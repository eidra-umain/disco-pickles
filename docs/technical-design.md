# Technical Design — Libresse App

**Version:** 1.0 | **Date:** 2026-03-06 | **Author:** Tech Lead
**Prerequisites:** [PRD](../pm/prd.md) · [Design Spec](../design/design-spec.md)

---

## 1. Executive Summary

This document defines the technical architecture for the Libresse cycle tracking app. The design prioritizes **privacy-first on-device processing**, **phase-adaptive UI**, and a **commerce integration** that treats product recommendations as service, not advertising.

**Key architectural decisions:**
- Flutter for cross-platform mobile (iOS-first, Android follow)
- On-device data storage with SQLite (Drift) + encryption
- ONNX Runtime for cross-platform AI inference
- Shopify Storefront API for commerce
- Riverpod for reactive state management

---

## 2. System Architecture

### 2.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           LIBRESSE APP                                   │
├─────────────────────────────────────────────────────────────────────────┤
│  PRESENTATION LAYER (Flutter)                                           │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐              │
│  │   Home    │ │ My Cycle  │ │   Shop    │ │ Assistant │              │
│  │ Dashboard │ │           │ │           │ │  (AI)     │              │
│  └─────┬─────┘ └─────┬─────┘ └─────┬─────┘ └─────┬─────┘              │
│        └─────────────┴─────────────┴─────────────┘                     │
│                              │                                          │
├──────────────────────────────┼──────────────────────────────────────────┤
│  STATE MANAGEMENT (Riverpod) │                                          │
│  ┌───────────────────────────┴───────────────────────────────────────┐ │
│  │ cycleProvider │ userProvider │ shopProvider │ chatProvider        │ │
│  │ settingsProvider │ themeProvider (phase-adaptive)                 │ │
│  └───────────────────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────────────────────┤
│  DOMAIN LAYER (Services)                                                │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐      │
│  │CycleService │ │PredictionSvc│ │ AIService   │ │ShopService  │      │
│  │             │ │             │ │(ONNX)       │ │(Shopify)    │      │
│  └──────┬──────┘ └──────┬──────┘ └──────┬──────┘ └──────┬──────┘      │
│         │               │               │               │              │
├─────────┴───────────────┴───────────────┴───────────────┴──────────────┤
│  DATA LAYER                                                             │
│  ┌────────────────────────────┐  ┌────────────────────────────────┐   │
│  │     LOCAL (On-Device)      │  │       REMOTE (Optional)        │   │
│  │                            │  │                                │   │
│  │ ┌────────────────────────┐ │  │ ┌────────────────────────────┐ │   │
│  │ │  SQLite (Drift)        │ │  │ │  Shopify Storefront API    │ │   │
│  │ │  - Cycle data          │ │  │ │  - Products (GraphQL)      │ │   │
│  │ │  - Daily logs          │ │  │ │  - Cart & Checkout         │ │   │
│  │ │  - Predictions         │ │  │ │  - Subscriptions           │ │   │
│  │ │  - Settings            │ │  │ │  - Customer accounts       │ │   │
│  │ └────────────────────────┘ │  │ └────────────────────────────┘ │   │
│  │                            │  │                                │   │
│  │ ┌────────────────────────┐ │  │ ┌────────────────────────────┐ │   │
│  │ │  ONNX Model            │ │  │ │  Analytics (opt-in only)   │ │   │
│  │ │  - Health Assistant AI │ │  │ │  - PostHog or Amplitude    │ │   │
│  │ │  - Symptom patterns    │ │  │ │  - No PII, anonymized      │ │   │
│  │ └────────────────────────┘ │  │ └────────────────────────────┘ │   │
│  └────────────────────────────┘  └────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────┘
```

### 2.2 Data Flow

```
User Action (tap log, ask question, browse shop)
         │
         ▼
┌─────────────────┐
│  UI Widget      │ ←── Rebuilds on state change
└────────┬────────┘
         │ ref.read(provider)
         ▼
┌─────────────────┐
│  Riverpod       │ ←── Manages async state, caching
│  Provider       │
└────────┬────────┘
         │ calls
         ▼
┌─────────────────┐
│  Domain Service │ ←── Business logic, validation
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌───────┐  ┌───────┐
│ Local │  │Remote │
│  DB   │  │ API   │
└───────┘  └───────┘
```

---

## 3. Tech Stack

### 3.1 Decisions with Justification

| Component | Technology | Justification | Alternatives Considered |
|-----------|------------|---------------|------------------------|
| **Framework** | Flutter 3.x | Cross-platform with native performance. Excellent for custom UI (phase-adaptive design). Strong widget system for CycleRing component. | React Native (larger ecosystem, but less performant custom animations), Native (2x effort) |
| **State Management** | Riverpod 2.x | Type-safe, testable, excellent async handling. Supports offline-first patterns. Better than Provider for complex state. | BLoC (more boilerplate), Provider (less powerful), GetX (less testable) |
| **Local Database** | Drift 2.x (SQLite) | Type-safe SQL, reactive streams, encryption support via SQLCipher. On-device = privacy. | Hive (less queryable), Isar (newer, less mature), SharedPreferences (too simple) |
| **On-Device AI** | ONNX Runtime | Cross-platform ML inference. Single model works on iOS + Android. Privacy-first. | Core ML + ML Kit (platform-specific), TensorFlow Lite (less optimized), llama.cpp (too large) |
| **Commerce API** | Shopify Storefront API | Mature subscription support, hosted checkout, handles fulfillment. GraphQL = efficient queries. | Custom backend (6+ months work), Stripe alone (no fulfillment), WooCommerce (less robust) |
| **HTTP Client** | Dio | Interceptors for auth, retry logic, logging. Better than http package. | http (too basic), Chopper (more boilerplate) |
| **GraphQL** | graphql_flutter | Native Shopify integration, caching, optimistic updates. | ferry (less mature), custom Dio wrapper |
| **Navigation** | go_router | Declarative, deep linking, guards for auth flows. | auto_route (more magic), Navigator 2.0 raw (too verbose) |
| **Secure Storage** | flutter_secure_storage | Keychain (iOS) / Keystore (Android) for tokens. | shared_preferences (not secure), hive encrypted (less standard) |

### 3.2 Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  
  # Local Storage
  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0
  sqlcipher_flutter_libs: ^0.6.0  # Encrypted SQLite
  flutter_secure_storage: ^9.0.0
  
  # Networking
  dio: ^5.4.0
  graphql_flutter: ^5.1.0
  
  # Navigation
  go_router: ^13.0.0
  
  # AI/ML
  onnxruntime: ^1.16.0
  
  # UI
  flutter_svg: ^2.0.0
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0  # Loading skeletons
  
  # Utilities
  freezed_annotation: ^2.4.0
  json_annotation: ^4.8.0
  intl: ^0.18.0
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.0
  drift_dev: ^2.14.0
  freezed: ^2.4.0
  json_serializable: ^6.7.0
  riverpod_generator: ^2.3.0
  mockito: ^5.4.0
  integration_test:
    sdk: flutter
```

---

## 4. State Management Strategy

### 4.1 Provider Architecture

```dart
// Core providers hierarchy
final cycleProvider = StateNotifierProvider<CycleNotifier, CycleState>((ref) {
  return CycleNotifier(ref.watch(cycleRepositoryProvider));
});

final currentPhaseProvider = Provider<Phase>((ref) {
  final cycle = ref.watch(cycleProvider);
  return cycle.currentPhase;
});

final phaseThemeProvider = Provider<PhaseTheme>((ref) {
  final phase = ref.watch(currentPhaseProvider);
  return PhaseTheme.forPhase(phase);
});
```

### 4.2 State Categories

| State Type | Scope | Persistence | Example |
|------------|-------|-------------|---------|
| **Cycle Data** | Global | SQLite (encrypted) | Cycles, daily logs, predictions |
| **UI State** | Screen-local | In-memory | Selected tab, scroll position |
| **User Settings** | Global | SQLite | Theme mode, notification prefs |
| **Shop State** | Global | Memory + SQLite cache | Cart, browsed products |
| **Chat State** | Session | Memory only (privacy) | AI conversation history |

### 4.3 Offline-First Pattern

```dart
class CycleRepository {
  Future<List<Cycle>> getCycles() async {
    // Always read from local DB first
    final local = await _localDb.getAllCycles();
    
    // No remote sync for cycle data (privacy)
    return local;
  }
}

class ShopRepository {
  Future<List<Product>> getProducts() async {
    // Try cache first
    final cached = await _localDb.getCachedProducts();
    if (cached.isNotEmpty && !_isCacheStale(cached)) {
      return cached;
    }
    
    // Fetch fresh if online
    try {
      final remote = await _shopifyApi.getProducts();
      await _localDb.cacheProducts(remote);
      return remote;
    } catch (e) {
      // Offline: return stale cache with warning
      return cached;
    }
  }
}
```

---

## 5. Database Schema

### 5.1 SQLite Tables (Drift)

```dart
// Core tables
class Cycles extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get length => integer().nullable()();
  BoolColumn get isPrediction => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class DailyLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get flowLevel => integer().nullable()(); // 0-5
  IntColumn get painLevel => integer().nullable()(); // 0-10
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  List<Set<Column>> get uniqueKeys => [{date}]; // One log per day
}

class Symptoms extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyLogId => integer().references(DailyLogs, #id)();
  TextColumn get type => text()(); // 'cramps', 'headache', 'bloating', etc.
  IntColumn get severity => integer().withDefault(const Constant(1))(); // 1-3
}

class Moods extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyLogId => integer().references(DailyLogs, #id)();
  TextColumn get type => text()(); // 'calm', 'anxious', 'happy', etc.
}

class Predictions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cycleId => integer().references(Cycles, #id)();
  TextColumn get type => text()(); // 'period_start', 'ovulation', 'phase_change'
  DateTimeColumn get predictedDate => dateTime()();
  RealColumn get confidence => real()(); // 0.0-1.0
  DateTimeColumn get actualDate => dateTime().nullable()();
}

class UserSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {key};
}

// Commerce cache tables
class CachedProducts extends Table {
  TextColumn get shopifyId => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get imageUrl => text().nullable()();
  RealColumn get price => real()();
  TextColumn get phaseRecommendation => text().nullable()(); // 'menstrual', 'all', etc.
  DateTimeColumn get cachedAt => dateTime()();
  
  @override
  Set<Column> get primaryKey => {shopifyId};
}

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text()();
  TextColumn get variantId => text()();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}
```

### 5.2 Indexes

```dart
@override
List<Index> get indexes => [
  Index('daily_logs_date_idx', [TableColumn('date')]),
  Index('symptoms_log_idx', [TableColumn('dailyLogId')]),
  Index('predictions_date_idx', [TableColumn('predictedDate')]),
  Index('cached_products_phase_idx', [TableColumn('phaseRecommendation')]),
];
```

### 5.3 Entity Relationship Diagram

```
┌─────────────┐       ┌─────────────┐       ┌─────────────┐
│   Cycles    │       │  DailyLogs  │       │  Symptoms   │
├─────────────┤       ├─────────────┤       ├─────────────┤
│ id (PK)     │       │ id (PK)     │──────<│ id (PK)     │
│ startDate   │       │ date        │       │ dailyLogId  │
│ endDate     │       │ flowLevel   │       │ type        │
│ length      │       │ painLevel   │       │ severity    │
│ isPrediction│       │ notes       │       └─────────────┘
│ createdAt   │       │ createdAt   │
└──────┬──────┘       └──────┬──────┘       ┌─────────────┐
       │                     │              │   Moods     │
       │                     │              ├─────────────┤
       │                     └─────────────<│ id (PK)     │
       │                                    │ dailyLogId  │
       │              ┌─────────────┐       │ type        │
       │              │ Predictions │       └─────────────┘
       │              ├─────────────┤
       └─────────────>│ id (PK)     │
                      │ cycleId     │
                      │ type        │
                      │ predictedDt │
                      │ confidence  │
                      │ actualDate  │
                      └─────────────┘
```

---

## 6. API Design

### 6.1 Local Services (No Network)

```dart
// Cycle Service
abstract class CycleService {
  Future<Cycle?> getCurrentCycle();
  Future<List<Cycle>> getCycleHistory({int limit = 12});
  Future<Cycle> startNewCycle(DateTime startDate);
  Future<void> endCurrentCycle(DateTime endDate);
  Future<Phase> calculateCurrentPhase();
}

// Daily Log Service
abstract class LogService {
  Future<DailyLog?> getLogForDate(DateTime date);
  Future<DailyLog> createOrUpdateLog(DailyLogInput input);
  Future<List<DailyLog>> getLogsForCycle(int cycleId);
  Future<Map<String, int>> getSymptomFrequencies();
}

// Prediction Service
abstract class PredictionService {
  Future<PeriodPrediction> predictNextPeriod();
  Future<List<PhasePrediction>> predictPhases(int daysAhead);
  Future<double> calculateConfidence();
}
```

### 6.2 Shopify GraphQL API

```graphql
# Get products filtered by phase recommendation
query GetProducts($first: Int!, $after: String, $query: String) {
  products(first: $first, after: $after, query: $query) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        title
        description
        featuredImage {
          url
        }
        priceRange {
          minVariantPrice {
            amount
            currencyCode
          }
        }
        variants(first: 10) {
          edges {
            node {
              id
              title
              price {
                amount
              }
              availableForSale
            }
          }
        }
        metafields(identifiers: [{namespace: "libresse", key: "phase_recommendation"}]) {
          key
          value
        }
      }
    }
  }
}

# Create checkout
mutation CreateCheckout($input: CheckoutCreateInput!) {
  checkoutCreate(input: $input) {
    checkout {
      id
      webUrl
      totalPrice {
        amount
      }
    }
    checkoutUserErrors {
      field
      message
    }
  }
}

# Subscribe to product
mutation CreateSubscription($input: SellingPlanGroupInput!) {
  sellingPlanGroupCreate(input: $input) {
    sellingPlanGroup {
      id
      name
    }
    userErrors {
      field
      message
    }
  }
}
```

### 6.3 API Client Pattern

```dart
class ShopifyClient {
  final GraphQLClient _client;
  
  Future<List<Product>> getProducts({
    Phase? phase,
    int first = 20,
    String? after,
  }) async {
    final query = phase != null ? 'tag:phase_${phase.name}' : null;
    
    final result = await _client.query(
      GetProductsQuery(first: first, after: after, query: query),
    );
    
    if (result.hasException) {
      throw ShopifyException(result.exception.toString());
    }
    
    return result.data!.products.edges
        .map((e) => Product.fromGraphQL(e.node))
        .toList();
  }
}
```

---

## 7. Authentication & Authorization

### 7.1 Auth Strategy

```
┌─────────────────────────────────────────────────────────────────┐
│                    AUTHENTICATION FLOW                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────────┐                                          │
│  │  NO ACCOUNT      │ ←── Default state                        │
│  │  (Anonymous)     │     Full tracking, local-only            │
│  └────────┬─────────┘                                          │
│           │                                                     │
│           │ User wants to purchase                              │
│           ▼                                                     │
│  ┌──────────────────┐                                          │
│  │  SHOPIFY GUEST   │ ←── Checkout without account             │
│  │  CHECKOUT        │     Order confirmation via email          │
│  └────────┬─────────┘                                          │
│           │                                                     │
│           │ User wants subscriptions/order history              │
│           ▼                                                     │
│  ┌──────────────────┐                                          │
│  │  SHOPIFY         │ ←── Email + password                     │
│  │  CUSTOMER ACCT   │     Stored in Secure Storage             │
│  └──────────────────┘                                          │
│                                                                 │
│  NOTE: Health data NEVER syncs to Shopify                      │
│        Commerce account is completely separate                  │
└─────────────────────────────────────────────────────────────────┘
```

### 7.2 Token Management

```dart
class AuthService {
  final FlutterSecureStorage _secureStorage;
  
  Future<void> storeShopifyToken(String accessToken) async {
    await _secureStorage.write(
      key: 'shopify_access_token',
      value: accessToken,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      iOptions: const IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
  }
  
  Future<String?> getShopifyToken() async {
    return _secureStorage.read(key: 'shopify_access_token');
  }
  
  Future<void> logout() async {
    await _secureStorage.delete(key: 'shopify_access_token');
    // Health data remains on device - not deleted
  }
}
```

---

## 8. Error Handling Strategy

### 8.1 Error Categories

| Category | Example | User Message | Logging |
|----------|---------|--------------|---------|
| **Validation** | Invalid date range | "Please enter a valid date" | Debug only |
| **Network** | No connection | "You're offline. Some features unavailable." | Info |
| **API Error** | Shopify 500 | "Something went wrong. Try again." | Error + Sentry |
| **AI Error** | Model inference fail | "I couldn't process that. Try rephrasing." | Warning |
| **Critical** | DB corruption | "Please reinstall the app" | Critical + alert |

### 8.2 Result Pattern

```dart
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final AppException error;
  const Failure(this.error);
}

// Usage
Future<Result<Cycle>> getCurrentCycle() async {
  try {
    final cycle = await _repository.getCurrentCycle();
    return Success(cycle);
  } on DatabaseException catch (e) {
    _logger.error('Database error', e);
    return Failure(AppException.database(e.message));
  }
}

// In UI
final cycleResult = await ref.read(cycleServiceProvider).getCurrentCycle();
switch (cycleResult) {
  case Success(:final data):
    // Show cycle
  case Failure(:final error):
    // Show error state
}
```

### 8.3 Global Error Handler

```dart
class GlobalErrorHandler {
  void handleError(Object error, StackTrace stack) {
    if (error is NetworkException) {
      _showSnackbar('You appear to be offline');
    } else if (error is ShopifyException) {
      _showSnackbar('Shop is temporarily unavailable');
      _logToSentry(error, stack);
    } else {
      _logToSentry(error, stack);
      // Don't show technical errors to users
    }
  }
}
```

---

## 9. Performance Optimization

### 9.1 App Launch Performance

| Target | Metric | Strategy |
|--------|--------|----------|
| Cold start | < 2s | Lazy initialization, minimal main() |
| Warm start | < 500ms | State persistence, no re-fetch |
| First paint | < 1s | Skeleton screens, defer non-critical |

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Only initialize critical services
  await initializeDatabase();
  
  // Defer non-critical
  Future.microtask(() async {
    await initializeAnalytics();
    await preloadOnnxModel();
  });
  
  runApp(const ProviderScope(child: LibresseApp()));
}
```

### 9.2 UI Performance

```dart
// Use const constructors
const CycleRing({super.key, required this.cycle});

// Selective rebuilds with Riverpod select
final phase = ref.watch(cycleProvider.select((s) => s.currentPhase));

// Image caching
CachedNetworkImage(
  imageUrl: product.imageUrl,
  placeholder: (_, __) => const ShimmerBox(),
  memCacheWidth: 200, // Resize in memory
);

// List virtualization
ListView.builder(
  itemCount: products.length,
  itemBuilder: (_, i) => ProductCard(products[i]),
);
```

### 9.3 Database Performance

```dart
// Batch writes
await _db.batch((batch) {
  for (final symptom in symptoms) {
    batch.insert(symptomsTable, symptom);
  }
});

// Indexed queries
final recentLogs = await (_db.select(dailyLogs)
  ..where((l) => l.date.isBiggerOrEqualValue(thirtyDaysAgo))
  ..orderBy([(l) => OrderingTerm.desc(l.date)]))
  .get();
```

---

## 10. Security Measures

### 10.1 Data Protection

| Data Type | Protection | Storage |
|-----------|------------|---------|
| Cycle data | SQLCipher encryption | Local SQLite |
| API tokens | Keychain/Keystore | Secure Storage |
| Chat history | In-memory only | Never persisted |
| Payment data | Never stored | Shopify handles |

### 10.2 Implementation

```dart
// Database encryption
final db = await openDatabase(
  'libresse.db',
  password: await _getOrCreateDbKey(),
);

Future<String> _getOrCreateDbKey() async {
  var key = await _secureStorage.read(key: 'db_encryption_key');
  if (key == null) {
    key = _generateSecureKey();
    await _secureStorage.write(key: 'db_encryption_key', value: key);
  }
  return key;
}

// Certificate pinning for Shopify
final dio = Dio()
  ..httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) {
        return _verifyShopifyCert(cert);
      };
      return client;
    },
  );

// Input sanitization
String sanitizeNote(String input) {
  return input
      .replaceAll(RegExp(r'<[^>]*>'), '') // Strip HTML
      .trim()
      .substring(0, min(input.length, 5000)); // Limit length
}
```

### 10.3 Privacy Compliance (GDPR)

```dart
class PrivacyService {
  /// Export all user data as JSON
  Future<File> exportUserData() async {
    final cycles = await _cycleRepo.getAllCycles();
    final logs = await _logRepo.getAllLogs();
    final settings = await _settingsRepo.getAllSettings();
    
    final export = {
      'exported_at': DateTime.now().toIso8601String(),
      'cycles': cycles.map((c) => c.toJson()).toList(),
      'logs': logs.map((l) => l.toJson()).toList(),
      'settings': settings,
    };
    
    return _writeToFile(jsonEncode(export));
  }
  
  /// Delete all user data
  Future<void> deleteAllData() async {
    await _db.delete(cyclesTable).go();
    await _db.delete(dailyLogsTable).go();
    await _db.delete(symptomsTable).go();
    await _db.delete(moodsTable).go();
    await _db.delete(predictionsTable).go();
    await _db.delete(userSettingsTable).go();
    await _secureStorage.deleteAll();
  }
}
```

---

## 11. Testing Strategy

### 11.1 Test Pyramid

```
                    ┌─────────┐
                    │   E2E   │  5%   Patrol/Maestro
                    │ (4-6)   │       Critical flows only
                    ├─────────┤
                ┌───┤ Integr. │  15%  integration_test
                │   │ (20-30) │       Feature flows
            ┌───┤   ├─────────┤
            │   │   │ Widget  │  20%  flutter_test
            │   │   │ (50-80) │       Screen rendering
        ┌───┤   │   ├─────────┤
        │   │   │   │  Unit   │  60%  flutter_test + mockito
        │   │   │   │(200-300)│       Services, repos, utils
        └───┴───┴───┴─────────┘
```

### 11.2 Test Examples

```dart
// Unit test - Prediction Service
void main() {
  group('PredictionService', () {
    late PredictionService service;
    late MockCycleRepository mockRepo;
    
    setUp(() {
      mockRepo = MockCycleRepository();
      service = PredictionService(mockRepo);
    });
    
    test('predicts next period based on average cycle length', () async {
      when(mockRepo.getRecentCycles(3)).thenAnswer((_) async => [
        Cycle(startDate: DateTime(2026, 1, 1), length: 28),
        Cycle(startDate: DateTime(2026, 1, 29), length: 30),
        Cycle(startDate: DateTime(2026, 2, 28), length: 28),
      ]);
      
      final prediction = await service.predictNextPeriod();
      
      expect(prediction.date, DateTime(2026, 3, 27)); // ~29 day avg
      expect(prediction.confidence, greaterThan(0.7));
    });
  });
}

// Widget test - CycleRing
void main() {
  testWidgets('CycleRing displays correct phase color', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CycleRing(
          cycle: Cycle(
            startDate: DateTime.now().subtract(const Duration(days: 5)),
            length: 28,
          ),
        ),
      ),
    );
    
    // Verify follicular phase color (day 5)
    final ringFinder = find.byType(CustomPaint);
    expect(ringFinder, findsOneWidget);
  });
}

// Integration test - Daily Log flow
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('user can log daily symptoms', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    
    // Tap log button
    await tester.tap(find.byKey(const Key('quick_log_button')));
    await tester.pumpAndSettle();
    
    // Select flow level
    await tester.tap(find.text('Medium'));
    
    // Select symptoms
    await tester.tap(find.text('Cramps'));
    await tester.tap(find.text('Fatigue'));
    
    // Save
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    
    // Verify back on home with confirmation
    expect(find.text('Logged'), findsOneWidget);
  });
}
```

### 11.3 Coverage Targets

| Module | Target | Critical Path |
|--------|--------|---------------|
| `services/` | 90% | Cycle calculations, predictions |
| `repositories/` | 85% | Data layer correctness |
| `providers/` | 80% | State management |
| `widgets/` | 70% | Core components |
| `screens/` | 60% | Happy paths |

---

## 12. Deployment Architecture

### 12.1 CI/CD Pipeline

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v3
  
  build-android:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release
      - uses: actions/upload-artifact@v3
        with:
          name: android-release
          path: build/app/outputs/flutter-apk/
  
  build-ios:
    needs: test
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - run: flutter build ios --release --no-codesign
```

### 12.2 Environments

| Environment | Purpose | Shopify | AI Model |
|-------------|---------|---------|----------|
| **dev** | Local development | Sandbox store | Local ONNX |
| **staging** | QA testing | Staging store | Production model |
| **production** | Live users | Production store | Production model |

### 12.3 Release Strategy

```
Feature Branch → PR → develop → staging build → QA
                                      ↓
                              Release branch → main → production
                                      ↓
                              Tag v1.x.x → App Store / Play Store
```

---

## 13. Monitoring & Observability

### 13.1 Logging Strategy

```dart
enum LogLevel { debug, info, warning, error, critical }

class AppLogger {
  void log(LogLevel level, String message, [Object? error, StackTrace? stack]) {
    // Local console
    if (kDebugMode) {
      debugPrint('[$level] $message');
    }
    
    // Remote (errors only, no PII)
    if (level.index >= LogLevel.error.index && !kDebugMode) {
      _sentry.captureException(
        error ?? message,
        stackTrace: stack,
        hint: Hint.withMap({'level': level.name}),
      );
    }
  }
}
```

### 13.2 Analytics Events (Opt-in Only)

```dart
// Only if user explicitly consents
final analyticsEvents = {
  'app_opened': {},
  'cycle_logged': {'phase': 'menstrual'},
  'product_viewed': {'product_id': 'xxx'}, // No PII
  'checkout_started': {},
  'checkout_completed': {'order_value': 29.99},
  'ai_query': {'query_type': 'symptom'}, // Never the actual query
};
```

### 13.3 Health Metrics

| Metric | Threshold | Alert |
|--------|-----------|-------|
| Crash-free rate | < 99% | Slack + PagerDuty |
| API error rate | > 5% | Slack |
| App launch time | > 3s (p95) | Dashboard |
| DB query time | > 500ms | Dashboard |

---

## 14. Scalability Considerations

### 14.1 Current Architecture Bottlenecks

| Component | Bottleneck | Mitigation |
|-----------|------------|------------|
| SQLite | Single-process writes | Batch operations, async isolates |
| ONNX Model | Memory usage (~100MB) | Lazy loading, release when backgrounded |
| Shopify API | Rate limits (2 req/s) | Request queue, caching |

### 14.2 Future Scaling Path

```
Current (MVP)                    Future (Scale)
─────────────────               ─────────────────
Local SQLite           →        Optional cloud sync
                                (E2E encrypted)

Single ONNX model      →        Model versioning
                                OTA updates

Shopify direct         →        BFF API layer
                                for caching/aggregation

No push notifications  →        Firebase/APNs
                                for proactive nudges
```

---

## 15. Implementation Phases

### Phase 1: Core Tracking (6 weeks)
- [ ] Project setup, CI/CD
- [ ] Database schema + Drift setup
- [ ] Cycle tracking models + service
- [ ] Home Dashboard + CycleRing
- [ ] Daily Log screen
- [ ] Phase-adaptive theming
- [ ] Basic predictions

### Phase 2: AI + Commerce (8 weeks)
- [ ] ONNX model integration
- [ ] Health Assistant chat UI
- [ ] Shopify API integration
- [ ] Product browsing
- [ ] Cart + checkout flow
- [ ] Subscription management

### Phase 3: Polish + Launch (4 weeks)
- [ ] Home/Lock Screen widgets
- [ ] Notification system
- [ ] Analytics (opt-in)
- [ ] Performance optimization
- [ ] App Store submission
- [ ] Launch monitoring

---

## Appendix A: Code Examples

### A.1 Phase Theme Implementation

```dart
class PhaseTheme {
  final Color primary;
  final Color background;
  final Color surface;
  final String phaseName;
  final String description;

  const PhaseTheme._({
    required this.primary,
    required this.background,
    required this.surface,
    required this.phaseName,
    required this.description,
  });

  static const menstrual = PhaseTheme._(
    primary: Color(0xFFE07A5F),
    background: Color(0xFFFDF6F4),
    surface: Color(0xFFFFFFFF),
    phaseName: 'Menstrual',
    description: 'Rest and restore',
  );

  static const follicular = PhaseTheme._(
    primary: Color(0xFF81B29A),
    background: Color(0xFFF4F9F6),
    surface: Color(0xFFFFFFFF),
    phaseName: 'Follicular',
    description: 'Energy is building',
  );

  static const ovulatory = PhaseTheme._(
    primary: Color(0xFFF2CC8F),
    background: Color(0xFFFFFBF5),
    surface: Color(0xFFFFFFFF),
    phaseName: 'Ovulatory',
    description: 'Peak energy',
  );

  static const luteal = PhaseTheme._(
    primary: Color(0xFFB8A9C9),
    background: Color(0xFFF8F6FA),
    surface: Color(0xFFFFFFFF),
    phaseName: 'Luteal',
    description: 'Winding down',
  );

  static PhaseTheme forPhase(Phase phase) => switch (phase) {
    Phase.menstrual => menstrual,
    Phase.follicular => follicular,
    Phase.ovulatory => ovulatory,
    Phase.luteal => luteal,
  };
}
```

### A.2 CycleRing Widget

```dart
class CycleRing extends StatelessWidget {
  final Cycle cycle;
  final double size;

  const CycleRing({
    super.key,
    required this.cycle,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _CycleRingPainter(
        currentDay: cycle.currentDay,
        cycleLength: cycle.length,
        phases: _calculatePhaseSegments(cycle.length),
      ),
    );
  }

  List<PhaseSegment> _calculatePhaseSegments(int cycleLength) {
    // Standard phase distribution
    return [
      PhaseSegment(Phase.menstrual, 0, 5),
      PhaseSegment(Phase.follicular, 5, 13),
      PhaseSegment(Phase.ovulatory, 13, 16),
      PhaseSegment(Phase.luteal, 16, cycleLength),
    ];
  }
}

class _CycleRingPainter extends CustomPainter {
  final int currentDay;
  final int cycleLength;
  final List<PhaseSegment> phases;

  _CycleRingPainter({
    required this.currentDay,
    required this.cycleLength,
    required this.phases,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    
    // Draw phase arcs
    for (final phase in phases) {
      final startAngle = (phase.startDay / cycleLength) * 2 * pi - pi / 2;
      final sweepAngle = ((phase.endDay - phase.startDay) / cycleLength) * 2 * pi;
      
      final paint = Paint()
        ..color = PhaseTheme.forPhase(phase.phase).primary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
    
    // Draw current day marker
    final markerAngle = (currentDay / cycleLength) * 2 * pi - pi / 2;
    final markerOffset = Offset(
      center.dx + radius * cos(markerAngle),
      center.dy + radius * sin(markerAngle),
    );
    
    canvas.drawCircle(
      markerOffset,
      10,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant _CycleRingPainter oldDelegate) {
    return oldDelegate.currentDay != currentDay;
  }
}
```

### A.3 Cycle Model

```dart
enum Phase { menstrual, follicular, ovulatory, luteal }

@freezed
class Cycle with _$Cycle {
  const Cycle._();
  
  const factory Cycle({
    int? id,
    required DateTime startDate,
    DateTime? endDate,
    @Default(28) int length,
    @Default(false) bool isPrediction,
  }) = _Cycle;

  int get currentDay {
    final now = DateTime.now();
    return now.difference(startDate).inDays + 1;
  }

  Phase get currentPhase {
    final day = currentDay;
    if (day <= 5) return Phase.menstrual;
    if (day <= 13) return Phase.follicular;
    if (day <= 16) return Phase.ovulatory;
    return Phase.luteal;
  }

  double get progress => currentDay / length;

  bool get isActive => endDate == null;

  factory Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);
}
```

---

## Appendix B: File Structure

```
mobile/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart
│   │   │   └── phase_constants.dart
│   │   ├── exceptions/
│   │   │   ├── app_exception.dart
│   │   │   └── network_exception.dart
│   │   ├── extensions/
│   │   │   ├── date_extensions.dart
│   │   │   └── context_extensions.dart
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   └── phase_theme.dart
│   │   └── utils/
│   │       ├── logger.dart
│   │       └── validators.dart
│   │
│   ├── data/
│   │   ├── database/
│   │   │   ├── app_database.dart
│   │   │   ├── app_database.g.dart
│   │   │   └── tables/
│   │   │       ├── cycles_table.dart
│   │   │       ├── daily_logs_table.dart
│   │   │       └── settings_table.dart
│   │   ├── repositories/
│   │   │   ├── cycle_repository.dart
│   │   │   ├── log_repository.dart
│   │   │   └── shop_repository.dart
│   │   └── services/
│   │       ├── ai_service.dart
│   │       └── shopify_client.dart
│   │
│   ├── domain/
│   │   ├── models/
│   │   │   ├── cycle.dart
│   │   │   ├── cycle.freezed.dart
│   │   │   ├── daily_log.dart
│   │   │   ├── phase.dart
│   │   │   ├── prediction.dart
│   │   │   └── product.dart
│   │   └── services/
│   │       ├── cycle_service.dart
│   │       ├── prediction_service.dart
│   │       └── privacy_service.dart
│   │
│   ├── presentation/
│   │   ├── providers/
│   │   │   ├── cycle_provider.dart
│   │   │   ├── shop_provider.dart
│   │   │   └── theme_provider.dart
│   │   ├── screens/
│   │   │   ├── home/
│   │   │   │   ├── home_screen.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── cycle_ring.dart
│   │   │   │       ├── phase_banner.dart
│   │   │   │       └── nudge_card.dart
│   │   │   ├── cycle/
│   │   │   │   ├── cycle_screen.dart
│   │   │   │   ├── daily_log_screen.dart
│   │   │   │   └── widgets/
│   │   │   ├── shop/
│   │   │   │   ├── shop_screen.dart
│   │   │   │   ├── product_detail_screen.dart
│   │   │   │   └── widgets/
│   │   │   ├── assistant/
│   │   │   │   ├── assistant_screen.dart
│   │   │   │   └── widgets/
│   │   │   ├── settings/
│   │   │   │   ├── settings_screen.dart
│   │   │   │   └── privacy_screen.dart
│   │   │   └── onboarding/
│   │   │       └── onboarding_screen.dart
│   │   └── widgets/
│   │       ├── common/
│   │       │   ├── loading_skeleton.dart
│   │       │   └── error_view.dart
│   │       └── shared/
│   │           ├── phase_indicator.dart
│   │           ├── privacy_badge.dart
│   │           └── product_card.dart
│   │
│   └── router/
│       └── app_router.dart
│
├── assets/
│   ├── images/
│   ├── icons/
│   └── models/
│       └── health_assistant.onnx
│
├── test/
│   ├── unit/
│   │   ├── services/
│   │   └── repositories/
│   ├── widget/
│   │   ├── screens/
│   │   └── widgets/
│   └── mocks/
│
├── integration_test/
│   └── app_test.dart
│
├── pubspec.yaml
└── analysis_options.yaml
```

---

## Appendix C: Glossary

| Term | Definition |
|------|------------|
| **Phase** | One of four cycle stages: menstrual, follicular, ovulatory, luteal |
| **CycleRing** | Circular UI component showing current cycle progress |
| **On-device** | Processing that happens locally without network |
| **Phase-adaptive** | UI that changes based on current cycle phase |
| **Drift** | Type-safe SQLite wrapper for Flutter |
| **ONNX** | Open Neural Network Exchange - cross-platform ML format |
| **Riverpod** | Reactive state management library for Flutter |
