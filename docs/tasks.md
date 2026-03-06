# Development Tasks — Libresse App

**Generated:** 2026-03-06 | **Source:** PRD, Design Spec, Technical Design
**Phase 1 Target:** Core Tracking (6 weeks) | **Phase 2:** AI + Commerce (8 weeks) | **Phase 3:** Polish + Launch (4 weeks)

---

## Task Index

| ID | Title | Complexity | Priority | Dependencies | Status |
|----|-------|------------|----------|--------------|--------|
| TASK-001 | Project Setup & CI/CD | M | P0 | — | pending |
| TASK-002 | Configure Flutter Project Structure | S | P0 | TASK-001 | pending |
| TASK-003 | Set Up Drift Database with SQLCipher | M | P0 | TASK-002 | pending |
| TASK-004 | Implement Core Data Models | M | P0 | TASK-003 | pending |
| TASK-005 | Create Riverpod Provider Architecture | M | P0 | TASK-004 | pending |
| TASK-006 | Implement Phase Theme System | S | P0 | TASK-005 | pending |
| TASK-007 | Set Up go_router Navigation | S | P0 | TASK-002 | pending |
| TASK-008 | Build CycleRing Widget | M | P0 | TASK-006 | pending |
| TASK-009 | Build Home Dashboard Screen | M | P0 | TASK-008 | pending |
| TASK-010 | Implement Cycle Service | M | P0 | TASK-004 | pending |
| TASK-011 | Build Daily Log Screen | M | P0 | TASK-010 | pending |
| TASK-012 | Implement Prediction Service | M | P1 | TASK-010 | pending |
| TASK-013 | Build Cycle Detail Screen | M | P0 | TASK-010 | pending |
| TASK-014 | Build Cycle History View | S | P1 | TASK-013 | pending |
| TASK-015 | Implement Onboarding Flow | M | P0 | TASK-007, TASK-009 | pending |
| TASK-016 | Build Settings & Privacy Screen | M | P0 | TASK-007 | pending |
| TASK-017 | Implement Data Export Feature | S | P1 | TASK-016 | pending |
| TASK-018 | Implement Data Delete Feature | S | P1 | TASK-016 | pending |
| TASK-019 | Integrate ONNX Runtime | L | P1 | TASK-002 | pending |
| TASK-020 | Build Health Assistant Chat UI | M | P1 | TASK-019 | pending |
| TASK-021 | Implement AI Service | L | P1 | TASK-019 | pending |
| TASK-022 | Set Up Shopify GraphQL Client | M | P0 | TASK-002 | pending |
| TASK-023 | Build Shop Browse Screen | M | P0 | TASK-022, TASK-006 | pending |
| TASK-024 | Build Product Detail Screen | M | P0 | TASK-023 | pending |
| TASK-025 | Implement Cart State Management | M | P0 | TASK-022 | pending |
| TASK-026 | Build Cart & Checkout Flow | M | P0 | TASK-025 | pending |
| TASK-027 | Build Subscription Manager Screen | M | P1 | TASK-026 | pending |
| TASK-028 | Implement Home/Lock Screen Widget | L | P1 | TASK-009 | pending |
| TASK-029 | Implement Notification System | M | P1 | TASK-012 | pending |
| TASK-030 | Add Analytics (Opt-in) | S | P2 | TASK-016 | pending |
| TASK-031 | Performance Optimization | M | P1 | All P0 tasks | pending |
| TASK-032 | App Store Submission Prep | M | P0 | All P0/P1 tasks | pending |
| TASK-033 | Build Shared UI Components | M | P0 | TASK-006 | pending |
| TASK-034 | Implement Secure Storage Service | S | P0 | TASK-002 | pending |
| TASK-035 | Build Error Handling System | S | P0 | TASK-002 | pending |

---

## Phase 1: Core Tracking (Weeks 1-6)

### TASK-001: Project Setup & CI/CD

**Priority:** P0 | **Complexity:** M | **Dependencies:** None

**Description:**
Initialize the Flutter project repository with proper CI/CD pipeline configuration. Set up GitHub Actions for automated testing, building, and code quality checks.

**Acceptance Criteria:**
- [ ] Flutter 3.x project initialized with proper folder structure per technical design
- [ ] GitHub Actions workflow runs on push to main/develop and on PRs
- [ ] Workflow includes: `flutter analyze`, `flutter test --coverage`, build APK, build iOS (no-codesign)
- [ ] Codecov integration configured for coverage reporting
- [ ] Branch protection rules set up (require PR, require CI pass)
- [ ] `.gitignore` properly configured for Flutter/Dart

**Testing Requirements:**
- Unit tests: N/A (infrastructure)
- Integration tests: N/A
- Manual QA: Verify CI pipeline runs successfully on a test commit

---

### TASK-002: Configure Flutter Project Structure

**Priority:** P0 | **Complexity:** S | **Dependencies:** TASK-001

**Description:**
Set up the folder structure as defined in Appendix B of the technical design. Configure `pubspec.yaml` with all required dependencies. Set up `analysis_options.yaml` with strict linting rules.

**Acceptance Criteria:**
- [ ] Folder structure matches technical design: `lib/core/`, `lib/data/`, `lib/domain/`, `lib/presentation/`, `lib/router/`
- [ ] All dependencies from Section 3.2 of technical design added to `pubspec.yaml`
- [ ] `analysis_options.yaml` configured with recommended Flutter lints
- [ ] `flutter pub get` runs without errors
- [ ] Project builds successfully for iOS and Android

**Testing Requirements:**
- Unit tests: N/A (infrastructure)
- Integration tests: N/A
- Manual QA: `flutter run` launches app successfully on simulator

---

### TASK-003: Set Up Drift Database with SQLCipher

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-002

**Description:**
Configure Drift (SQLite) with SQLCipher encryption for secure on-device data storage. Implement the database schema as defined in Section 5 of the technical design.

**Acceptance Criteria:**
- [ ] `app_database.dart` created with all tables from technical design (Cycles, DailyLogs, Symptoms, Moods, Predictions, UserSettings, CachedProducts, CartItems)
- [ ] SQLCipher encryption enabled with key stored in secure storage
- [ ] Database migrations configured for future schema changes
- [ ] All indexes defined as per Section 5.2
- [ ] Database opens successfully and can perform CRUD operations
- [ ] Database file is encrypted (verifiable by attempting to open with standard SQLite tools)

**Testing Requirements:**
- Unit tests: Test CRUD operations for each table
- Unit tests: Test encryption key generation and retrieval
- Integration tests: Test database initialization on fresh app install
- Manual QA: Verify database file cannot be read without encryption key

---

### TASK-004: Implement Core Data Models

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-003

**Description:**
Create Freezed data models for Cycle, DailyLog, Phase, Prediction, and related entities. Models should include JSON serialization and computed properties.

**Acceptance Criteria:**
- [ ] `Cycle` model with `currentDay`, `currentPhase`, `progress`, `isActive` computed properties
- [ ] `Phase` enum with menstrual, follicular, ovulatory, luteal values
- [ ] `DailyLog` model with flow, mood, symptoms, pain, notes
- [ ] `Prediction` model with type, predictedDate, confidence, actualDate
- [ ] `Symptom` and `Mood` models with type and severity
- [ ] All models are immutable (Freezed)
- [ ] All models have `fromJson`/`toJson` methods
- [ ] `build_runner` generates `.freezed.dart` and `.g.dart` files without errors

**Testing Requirements:**
- Unit tests: Test computed properties (currentDay, currentPhase)
- Unit tests: Test JSON serialization round-trip
- Unit tests: Test edge cases (day 1, day 28, irregular cycles)
- Manual QA: N/A

---

### TASK-005: Create Riverpod Provider Architecture

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-004

**Description:**
Set up the Riverpod provider hierarchy as defined in Section 4 of the technical design. Implement core providers for cycle state, user settings, and theme.

**Acceptance Criteria:**
- [ ] `cycleProvider` (StateNotifierProvider) managing CycleState
- [ ] `currentPhaseProvider` derived from cycleProvider
- [ ] `phaseThemeProvider` derived from currentPhaseProvider
- [ ] `settingsProvider` for user preferences
- [ ] `cycleRepositoryProvider` for data layer access
- [ ] Providers properly scoped with ProviderScope in main.dart
- [ ] Provider overrides configured for testing

**Testing Requirements:**
- Unit tests: Test state transitions in CycleNotifier
- Unit tests: Test provider derivation (phase from cycle, theme from phase)
- Integration tests: Test provider initialization on app start
- Manual QA: Verify state persists across app restarts

---

### TASK-006: Implement Phase Theme System

**Priority:** P0 | **Complexity:** S | **Dependencies:** TASK-005

**Description:**
Implement the phase-adaptive theming system with four distinct color palettes (menstrual: terracotta, follicular: green, ovulatory: golden, luteal: lavender).

**Acceptance Criteria:**
- [ ] `PhaseTheme` class with primary, background, surface colors for each phase
- [ ] Theme colors match design spec: terracotta (#E07A5F), green (#81B29A), golden (#F2CC8F), lavender (#B8A9C9)
- [ ] `AppTheme` class providing full ThemeData based on current phase
- [ ] Theme transitions smoothly when phase changes
- [ ] Dark mode foundation in place (P2 feature, but architecture ready)
- [ ] Theme accessible via `ref.watch(phaseThemeProvider)`

**Testing Requirements:**
- Unit tests: Test PhaseTheme.forPhase returns correct colors
- Widget tests: Test theme propagates to child widgets
- Manual QA: Visual inspection of each phase color in app

---

### TASK-007: Set Up go_router Navigation

**Priority:** P0 | **Complexity:** S | **Dependencies:** TASK-002

**Description:**
Configure go_router with the navigation structure defined in Section 8 of the design spec. Implement tab-based navigation with Home, My Cycle, Shop, and Assistant tabs.

**Acceptance Criteria:**
- [ ] Bottom tab bar with 4 tabs: Home, My Cycle, Shop, Assistant
- [ ] Nested navigation within each tab (e.g., Shop -> Product Detail -> Cart)
- [ ] Deep linking support configured
- [ ] Route guards for onboarding (redirect to onboarding if first launch)
- [ ] Modal routes for Daily Log screen
- [ ] Settings accessible from Home via top-right icon
- [ ] Proper back button behavior in nested routes

**Testing Requirements:**
- Unit tests: Test route matching and redirects
- Widget tests: Test tab switching preserves state
- Manual QA: Navigate through all routes, verify back button behavior

---

### TASK-008: Build CycleRing Widget

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-006

**Description:**
Implement the CycleRing custom paint widget as specified in Appendix A.2 of the technical design. The ring displays cycle progress with phase-colored segments.

**Acceptance Criteria:**
- [ ] Circular ring divided into 4 phase segments with correct colors
- [ ] Current day marker (white dot) positioned correctly on ring
- [ ] Phase segments calculated based on standard distribution (days 1-5, 5-13, 13-16, 16-28)
- [ ] Configurable size prop (sm/lg variants)
- [ ] Prediction segments shown as dashed (when cycle data includes predictions)
- [ ] Repaint optimization (shouldRepaint checks currentDay)
- [ ] Accessible (semantic label for screen readers)

**Testing Requirements:**
- Widget tests: Test correct phase segment rendering for different cycle days
- Widget tests: Test size variants render correctly
- Widget tests: Test prediction mode styling
- Manual QA: Visual inspection at various cycle days (day 1, 7, 14, 21, 28)

---

### TASK-009: Build Home Dashboard Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-008

**Description:**
Build the Home Dashboard screen with CycleRing, Phase Banner, Today's Nudge, Quick Log Button, and Upcoming forecast as defined in Section 4.1 of the design spec.

**Acceptance Criteria:**
- [ ] CycleRing component prominently displayed
- [ ] Phase Banner shows current phase name + description, adapts to phase
- [ ] Today's Nudge card displays contextual content (health tip, product suggestion, or log reminder)
- [ ] Quick Log button visible, shows badge if not logged today
- [ ] Upcoming 3-day forecast strip showing expected symptoms/phase transitions
- [ ] Empty state when no cycle data: "Set up your cycle" CTA
- [ ] Background color subtly shifts by cycle phase
- [ ] Privacy badge visible ("Your data is on your device")
- [ ] Skeleton loading states (no spinners)

**Testing Requirements:**
- Widget tests: Test all state variations (empty, active, logged today)
- Widget tests: Test phase-adaptive styling
- Integration tests: Test navigation to Daily Log from Quick Log button
- Manual QA: Visual review in each phase, test empty state

---

### TASK-010: Implement Cycle Service

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-004

**Description:**
Implement the CycleService as defined in Section 6.1 of the technical design. This service handles all cycle-related business logic.

**Acceptance Criteria:**
- [ ] `getCurrentCycle()` returns active cycle or null
- [ ] `getCycleHistory(limit)` returns past cycles ordered by start date
- [ ] `startNewCycle(startDate)` creates new cycle, ends previous if active
- [ ] `endCurrentCycle(endDate)` marks current cycle complete
- [ ] `calculateCurrentPhase()` returns correct phase based on cycle day
- [ ] Validation: Cannot start cycle with future date
- [ ] Validation: Cannot end cycle before start date
- [ ] Uses Result pattern for error handling

**Testing Requirements:**
- Unit tests: Test all methods with valid inputs
- Unit tests: Test edge cases (no cycles, overlapping cycles)
- Unit tests: Test validation failures
- Unit tests: Test phase calculation at day boundaries (day 5, 13, 16)
- Manual QA: Create and end cycles, verify data persistence

---

### TASK-011: Build Daily Log Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-010

**Description:**
Build the Daily Log screen as specified in Section 4.2 of the design spec. Full-screen modal for quick symptom/mood/flow/pain entry.

**Acceptance Criteria:**
- [ ] Flow Selector: 5-level scale (none -> heavy) with visual indicators
- [ ] Mood Picker: Grid of mood options with multi-select
- [ ] Symptom Tags: Scrollable chip tags (cramps, headache, bloating, fatigue, acne, etc.)
- [ ] Pain Scale: 0-10 slider/segmented control, collapsed by default
- [ ] Notes Field: Optional free-text, collapsed by default
- [ ] Save button disabled until at least one field has input
- [ ] Haptic feedback on selection
- [ ] Success animation on save, returns to Home
- [ ] If log exists for today, pre-populate fields (edit mode)

**Testing Requirements:**
- Widget tests: Test all input components
- Widget tests: Test save button disabled/enabled states
- Widget tests: Test edit mode with existing log
- Integration tests: Test full log flow from Home -> Log -> Save -> Home
- Manual QA: Log symptoms for multiple days, verify persistence

---

### TASK-012: Implement Prediction Service

**Priority:** P1 | **Complexity:** M | **Dependencies:** TASK-010

**Description:**
Implement the PredictionService for predicting next period and cycle phases based on historical data.

**Acceptance Criteria:**
- [ ] `predictNextPeriod()` calculates next period based on average cycle length
- [ ] `predictPhases(daysAhead)` returns phase predictions for upcoming days
- [ ] `calculateConfidence()` returns confidence score (0.0-1.0) based on data quality
- [ ] Requires minimum 3 cycles for predictions (returns low confidence otherwise)
- [ ] Handles irregular cycles gracefully (wider confidence intervals)
- [ ] Predictions stored in database with confidence scores
- [ ] Predictions update when new cycle data is logged

**Testing Requirements:**
- Unit tests: Test prediction accuracy with mock cycle data
- Unit tests: Test confidence calculation with varying data quality
- Unit tests: Test edge cases (< 3 cycles, irregular cycles)
- Integration tests: Test predictions update after logging new cycle
- Manual QA: Verify predictions make sense for real-world scenarios

---

### TASK-013: Build Cycle Detail Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-010

**Description:**
Build the Cycle Detail screen (My Cycle tab) with phase timeline, cycle stats, and current cycle information.

**Acceptance Criteria:**
- [ ] Horizontal scrollable Phase Timeline with 4 colored segments
- [ ] Current day marker on timeline
- [ ] Tapping a day shows that day's log (if exists)
- [ ] Cycle Stats: avg cycle length, avg period length, regularity score
- [ ] Stats show "We need 3+ cycles for predictions" when insufficient data
- [ ] Period Prediction card with estimated next period and confidence
- [ ] Navigation to Daily Log for logging
- [ ] Loading skeleton states

**Testing Requirements:**
- Widget tests: Test timeline rendering for various cycle lengths
- Widget tests: Test stats display with sufficient/insufficient data
- Integration tests: Test navigation from timeline day tap to log view
- Manual QA: Visual review with different amounts of cycle history

---

### TASK-014: Build Cycle History View

**Priority:** P1 | **Complexity:** S | **Dependencies:** TASK-013

**Description:**
Build the Cycle History view showing past cycles and trend analysis.

**Acceptance Criteria:**
- [ ] List of past cycles with start date, length, and phase breakdown
- [ ] Trend Cards showing symptom frequency patterns (e.g., "Headaches cluster around day 22-24")
- [ ] Trend cards only shown after 2+ cycles logged
- [ ] Scrollable history with pull-to-refresh
- [ ] Empty state when no history

**Testing Requirements:**
- Widget tests: Test list rendering with various cycle counts
- Widget tests: Test trend card display logic
- Manual QA: Review trend insights with multi-cycle data

---

### TASK-015: Implement Onboarding Flow

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-007, TASK-009

**Description:**
Build the 3-screen onboarding flow: Welcome, Privacy Explainer, and Cycle Setup.

**Acceptance Criteria:**
- [ ] Welcome screen with Libresse branding
- [ ] Privacy explainer screen: "How we handle your data" with PrivacyBadge
- [ ] Cycle Setup screen: Last period date picker, typical cycle length selector
- [ ] "Skip for now" option on Cycle Setup with graceful degradation
- [ ] Onboarding completion stored in user settings
- [ ] Route guard redirects to onboarding on first launch only
- [ ] Smooth transitions between screens
- [ ] Progress indicator showing step 1/2/3

**Testing Requirements:**
- Widget tests: Test each onboarding screen renders correctly
- Integration tests: Test full onboarding flow completion
- Integration tests: Test skip flow and graceful degradation
- Manual QA: Fresh install experience, verify onboarding only shows once

---

### TASK-016: Build Settings & Privacy Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-007

**Description:**
Build the Settings screen with privacy controls, data management, and app preferences.

**Acceptance Criteria:**
- [ ] Privacy section: "Your data is stored on-device only"
- [ ] Export my data button (links to TASK-017)
- [ ] Delete all data button (links to TASK-018)
- [ ] App preferences: Theme mode selector (light/dark/system - dark mode P2)
- [ ] Notification preferences (on/off, frequency - links to TASK-029)
- [ ] About section: App version, privacy policy link, terms of service link
- [ ] Account section placeholder for Shopify customer account (P2)

**Testing Requirements:**
- Widget tests: Test settings UI renders all sections
- Widget tests: Test preference toggles update state
- Integration tests: Test navigation from Home to Settings
- Manual QA: Verify all settings persist across app restarts

---

### TASK-033: Build Shared UI Components

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-006

**Description:**
Build the shared UI component library as defined in Section 5 of the design spec.

**Acceptance Criteria:**
- [ ] `PhaseIndicator` widget with phase, label, auto-color props
- [ ] `LogButton` widget with idle/active/completed states and badge
- [ ] `MoodChip` widget with mood label and selected state
- [ ] `SymptomTag` widget with label, selected, frequency props
- [ ] `PrivacyBadge` widget with prominent/subtle variants
- [ ] `NudgeCard` widget with health/product/log types
- [ ] `EmptyState` widget with illustration, title, description, CTA
- [ ] `LoadingSkeleton` widget matching component shapes
- [ ] All components support phase theming

**Testing Requirements:**
- Widget tests: Test all component variants and states
- Widget tests: Test accessibility (semantic labels, tap targets >= 44px)
- Manual QA: Visual review of all components in component showcase

---

### TASK-034: Implement Secure Storage Service

**Priority:** P0 | **Complexity:** S | **Dependencies:** TASK-002

**Description:**
Implement secure storage service using flutter_secure_storage for tokens and encryption keys.

**Acceptance Criteria:**
- [ ] `SecureStorageService` class wrapping flutter_secure_storage
- [ ] Methods: `read`, `write`, `delete`, `deleteAll`
- [ ] Proper iOS Keychain accessibility settings (first_unlock)
- [ ] Proper Android encrypted shared preferences settings
- [ ] Used for: database encryption key, Shopify access token
- [ ] Error handling for storage failures

**Testing Requirements:**
- Unit tests: Test CRUD operations (mock secure storage)
- Integration tests: Test actual secure storage on device
- Manual QA: Verify data survives app restart but not uninstall

---

### TASK-035: Build Error Handling System

**Priority:** P0 | **Complexity:** S | **Dependencies:** TASK-002

**Description:**
Implement the error handling strategy defined in Section 8 of the technical design.

**Acceptance Criteria:**
- [ ] `AppException` base class with validation, network, api, ai, critical types
- [ ] `Result<T>` sealed class with Success and Failure variants
- [ ] `GlobalErrorHandler` class for centralized error handling
- [ ] User-friendly error messages (not technical jargon)
- [ ] Errors logged appropriately (debug console in dev, Sentry in prod)
- [ ] Network errors show "You appear to be offline"
- [ ] API errors show "Something went wrong. Try again."
- [ ] Critical errors logged with alert

**Testing Requirements:**
- Unit tests: Test Result pattern usage
- Unit tests: Test error message mapping
- Widget tests: Test error UI display
- Manual QA: Trigger various error conditions, verify UX

---

## Phase 2: AI + Commerce (Weeks 7-14)

### TASK-017: Implement Data Export Feature

**Priority:** P1 | **Complexity:** S | **Dependencies:** TASK-016

**Description:**
Implement GDPR-compliant data export functionality.

**Acceptance Criteria:**
- [ ] Export all user data as JSON file
- [ ] Includes: cycles, daily logs, symptoms, moods, predictions, settings
- [ ] Export includes timestamp and data schema version
- [ ] File saved to device's document directory
- [ ] Share sheet opens for user to save/send file
- [ ] Export completes within 5 seconds for typical data volume

**Testing Requirements:**
- Unit tests: Test export data completeness
- Unit tests: Test JSON structure validity
- Integration tests: Test export flow end-to-end
- Manual QA: Export data, import to JSON viewer, verify contents

---

### TASK-018: Implement Data Delete Feature

**Priority:** P1 | **Complexity:** S | **Dependencies:** TASK-016

**Description:**
Implement complete data deletion with double confirmation.

**Acceptance Criteria:**
- [ ] Delete all data button triggers confirmation dialog
- [ ] Confirmation dialog warns: "This will erase your cycle history. This cannot be undone."
- [ ] Second confirmation required (type "DELETE" or similar)
- [ ] Deletes: all database tables, secure storage keys
- [ ] After deletion, app redirects to onboarding
- [ ] Deletion is irreversible

**Testing Requirements:**
- Unit tests: Test deletion clears all data stores
- Widget tests: Test confirmation flow UI
- Integration tests: Test post-deletion app state
- Manual QA: Delete data, verify app is in fresh state

---

### TASK-019: Integrate ONNX Runtime

**Priority:** P1 | **Complexity:** L | **Dependencies:** TASK-002

**Description:**
Set up ONNX Runtime for on-device AI inference. Prepare model loading and inference pipeline.

**Acceptance Criteria:**
- [ ] ONNX Runtime dependency configured
- [ ] Model file (`health_assistant.onnx`) bundled in assets
- [ ] Lazy model loading (load on first AI interaction, not app start)
- [ ] Model released when app backgrounded (memory management)
- [ ] Inference completes within 2 seconds for typical queries
- [ ] Graceful fallback if model fails to load

**Testing Requirements:**
- Unit tests: Test model loading/unloading
- Unit tests: Test inference with mock inputs
- Integration tests: Test memory usage before/after model load
- Manual QA: Trigger AI queries, monitor memory in profiler

---

### TASK-020: Build Health Assistant Chat UI

**Priority:** P1 | **Complexity:** M | **Dependencies:** TASK-019

**Description:**
Build the Health Assistant Chat screen as specified in Section 4.4 of the design spec.

**Acceptance Criteria:**
- [ ] Chat interface with user messages (right) and AI messages (left)
- [ ] AI messages have Libresse assistant avatar
- [ ] Suggested prompts shown initially, disappear after first message
- [ ] Typing indicator (animated dots) while AI processes
- [ ] Response streams in (not all-at-once)
- [ ] Inline product cards within AI responses (non-intrusive)
- [ ] Persistent disclaimer footer: "For informational purposes. Not medical advice."
- [ ] Conversation persists within session, clears on app restart (privacy)
- [ ] "I'm not sure about that" fallback for unanswerable questions

**Testing Requirements:**
- Widget tests: Test message rendering (user and AI)
- Widget tests: Test suggested prompts display/hide
- Widget tests: Test product card inline rendering
- Integration tests: Test full conversation flow
- Manual QA: Have real conversations, verify UX quality

---

### TASK-021: Implement AI Service

**Priority:** P1 | **Complexity:** L | **Dependencies:** TASK-019

**Description:**
Implement the AI Service that processes user queries using the ONNX model with cycle context.

**Acceptance Criteria:**
- [ ] `AIService` class with `query(message, cycleContext)` method
- [ ] Queries processed entirely on-device (no network)
- [ ] Cycle context (current phase, recent symptoms) included in inference
- [ ] Responses are phase-aware and evidence-based
- [ ] Medical disclaimer triggers for symptom-related queries
- [ ] "Talk to your doctor" suggestion for urgent/medical queries
- [ ] Product suggestions returned with responses when relevant
- [ ] Error handling returns user-friendly fallback

**Testing Requirements:**
- Unit tests: Test query processing with various inputs
- Unit tests: Test context injection
- Unit tests: Test medical disclaimer triggers
- Integration tests: Test end-to-end query flow
- Manual QA: Test quality of responses for common questions

---

### TASK-022: Set Up Shopify GraphQL Client

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-002

**Description:**
Configure Shopify Storefront API client with GraphQL as specified in Section 6.2 of the technical design.

**Acceptance Criteria:**
- [ ] `ShopifyClient` class using graphql_flutter
- [ ] Storefront API token configured via environment variables
- [ ] GraphQL queries defined: GetProducts, CreateCheckout, etc.
- [ ] Certificate pinning for Shopify connections
- [ ] Request rate limiting (max 2 req/s per Shopify limits)
- [ ] Response caching for product data
- [ ] Error handling for API failures with user-friendly messages

**Testing Requirements:**
- Unit tests: Test client initialization
- Unit tests: Test query building and parsing
- Unit tests: Test rate limiting
- Integration tests: Test actual Shopify API calls (sandbox store)
- Manual QA: Verify products fetch from Shopify store

---

### TASK-023: Build Shop Browse Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-022, TASK-006

**Description:**
Build the Shop Browse screen as specified in Section 4.5 of the design spec.

**Acceptance Criteria:**
- [ ] Grid layout of ProductCards
- [ ] Phase Filter: horizontal pills (All, Menstrual, Follicular, Ovulatory, Luteal)
- [ ] Default filter: current cycle phase (or "All" if no cycle data)
- [ ] Product cards show: image, name, description, price, "Subscribe" badge
- [ ] Stock states: In stock, Low stock (badge), Out of stock (greyed + "Notify me")
- [ ] Collapsible search bar with real-time filtering
- [ ] Cart badge on Shop tab showing item count
- [ ] Offline state: cached products with "Offline" badge
- [ ] Skeleton loading states

**Testing Requirements:**
- Widget tests: Test filter selection updates display
- Widget tests: Test product card states
- Widget tests: Test search functionality
- Integration tests: Test product data loading from Shopify
- Manual QA: Browse products, test filters, verify phase recommendations

---

### TASK-024: Build Product Detail Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-023

**Description:**
Build the Product Detail screen with full product information and purchase options.

**Acceptance Criteria:**
- [ ] Full product image (zoomable)
- [ ] Product name, description, price
- [ ] Variant selector (if applicable - size, quantity, etc.)
- [ ] "Add to Cart" button
- [ ] "Subscribe & Save" option with frequency selector
- [ ] Phase recommendation tag (if product has phase_recommendation metafield)
- [ ] Stock availability indicator
- [ ] Back navigation to Shop Browse

**Testing Requirements:**
- Widget tests: Test variant selection
- Widget tests: Test add to cart action
- Widget tests: Test subscribe option display
- Integration tests: Test product detail loading
- Manual QA: View various products, test add to cart flow

---

### TASK-025: Implement Cart State Management

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-022

**Description:**
Implement cart state management with local persistence and Shopify sync.

**Acceptance Criteria:**
- [ ] `CartProvider` managing cart state
- [ ] Cart items stored locally (CartItems table)
- [ ] Add item, update quantity, remove item operations
- [ ] Cart syncs with Shopify checkout when online
- [ ] Cart total calculated correctly
- [ ] Cart persists across app sessions
- [ ] Cart badge updates reactively

**Testing Requirements:**
- Unit tests: Test cart operations (add, update, remove)
- Unit tests: Test total calculation
- Integration tests: Test cart persistence
- Integration tests: Test Shopify checkout sync
- Manual QA: Add items, close app, verify cart persists

---

### TASK-026: Build Cart & Checkout Flow

**Priority:** P0 | **Complexity:** M | **Dependencies:** TASK-025

**Description:**
Build the Cart screen and checkout flow using Shopify hosted checkout.

**Acceptance Criteria:**
- [ ] Cart screen showing all cart items with quantities
- [ ] Quantity adjustment (+/-) per item
- [ ] Remove item action
- [ ] Cart subtotal and total displayed
- [ ] "Proceed to Checkout" button
- [ ] Shopify hosted checkout opens in WebView/browser
- [ ] Order confirmation handling after checkout complete
- [ ] Payment failure error handling with retry option
- [ ] Empty cart state with "Start shopping" CTA

**Testing Requirements:**
- Widget tests: Test cart item display and interactions
- Widget tests: Test empty cart state
- Integration tests: Test checkout flow (sandbox)
- Manual QA: Complete test purchases in sandbox mode

---

### TASK-027: Build Subscription Manager Screen

**Priority:** P1 | **Complexity:** M | **Dependencies:** TASK-026

**Description:**
Build the Subscription Manager as specified in Section 4.6 of the design spec.

**Acceptance Criteria:**
- [ ] List of active subscription cards
- [ ] Subscription card shows: product image, name, frequency, next delivery, price
- [ ] States: Active, Paused (muted + "Resume"), Expiring (warning badge)
- [ ] Edit controls: Change frequency, skip next delivery, pause, cancel
- [ ] Cancel requires confirmation step
- [ ] Monthly Cost Summary showing total spend
- [ ] Empty state: "No subscriptions yet" with "Find products" CTA
- [ ] Accessible from Shop tab and Settings

**Testing Requirements:**
- Widget tests: Test subscription card states
- Widget tests: Test edit controls
- Integration tests: Test subscription management via Shopify API
- Manual QA: Manage test subscriptions in sandbox

---

### TASK-028: Implement Home/Lock Screen Widget

**Priority:** P1 | **Complexity:** L | **Dependencies:** TASK-009

**Description:**
Implement iOS Home Screen and Lock Screen widgets showing glanceable cycle status.

**Acceptance Criteria:**
- [ ] Home Screen widget: "Day 14 - Follicular" with phase-color gradient
- [ ] Lock Screen widget (iOS 16+): Compact cycle status
- [ ] Widget updates when cycle data changes
- [ ] Discreet mode option: user chooses what to display
- [ ] Multiple size options (small, medium)
- [ ] Widget taps open app to relevant section
- [ ] Widget data refreshes appropriately (not too frequently for battery)

**Testing Requirements:**
- Widget tests: Limited (native widget testing)
- Integration tests: Test widget data updates from app
- Manual QA: Add widget to home screen, verify updates

---

### TASK-029: Implement Notification System

**Priority:** P1 | **Complexity:** M | **Dependencies:** TASK-012

**Description:**
Implement the notification system following the respectful engagement principles in the PRD.

**Acceptance Criteria:**
- [ ] Notifications OFF by default (opt-in only)
- [ ] Notification types: period prediction, pattern insights, shipment status
- [ ] Maximum 1 notification per day
- [ ] Notification scheduling based on predictions
- [ ] User can configure which notification types to receive
- [ ] Never: content promotion, guilt-tripping, vague engagement teasers
- [ ] Local notifications (no push service required for core features)
- [ ] Notification tap opens relevant app section

**Testing Requirements:**
- Unit tests: Test notification scheduling logic
- Unit tests: Test frequency limiting
- Integration tests: Test notification delivery (device testing)
- Manual QA: Enable notifications, verify they appear appropriately

---

## Phase 3: Polish + Launch (Weeks 15-18)

### TASK-030: Add Analytics (Opt-in)

**Priority:** P2 | **Complexity:** S | **Dependencies:** TASK-016

**Description:**
Implement opt-in analytics following privacy requirements.

**Acceptance Criteria:**
- [ ] Analytics OFF by default, requires explicit opt-in
- [ ] Opt-in prompt explains what data is collected
- [ ] Events tracked: app_opened, cycle_logged, product_viewed, checkout events
- [ ] NO PII in any events (anonymized user IDs only)
- [ ] Never track actual health data or AI queries
- [ ] PostHog or Amplitude integration
- [ ] User can opt-out anytime from Settings

**Testing Requirements:**
- Unit tests: Test event sanitization (no PII)
- Integration tests: Test event sending (staging environment)
- Manual QA: Verify events in analytics dashboard

---

### TASK-031: Performance Optimization

**Priority:** P1 | **Complexity:** M | **Dependencies:** All P0 tasks

**Description:**
Optimize app performance to meet targets in Section 9 of the technical design.

**Acceptance Criteria:**
- [ ] Cold start < 2 seconds
- [ ] Warm start < 500ms
- [ ] First paint < 1 second
- [ ] Database queries < 500ms (p95)
- [ ] Image caching optimized (memCacheWidth)
- [ ] List virtualization for product lists
- [ ] Const constructors used throughout
- [ ] Provider select() used for targeted rebuilds
- [ ] ONNX model lazy loaded and released when backgrounded

**Testing Requirements:**
- Unit tests: N/A
- Integration tests: Performance profiling tests
- Manual QA: Profile app on low-end devices, verify targets met

---

### TASK-032: App Store Submission Prep

**Priority:** P0 | **Complexity:** M | **Dependencies:** All P0/P1 tasks

**Description:**
Prepare all assets and configuration for App Store submission.

**Acceptance Criteria:**
- [ ] App icons for all required sizes
- [ ] Launch screen configured
- [ ] App Store screenshots (iPhone 15, iPhone SE, iPad)
- [ ] App Store description and keywords
- [ ] Privacy policy URL configured
- [ ] Terms of service URL configured
- [ ] App privacy nutrition labels completed
- [ ] TestFlight build uploaded and tested
- [ ] App Store Connect metadata complete
- [ ] Release notes prepared

**Testing Requirements:**
- Unit tests: N/A
- Integration tests: N/A
- Manual QA: Full app review checklist, TestFlight external testing

---

## Dependency Graph

```
TASK-001 (Setup)
    |-- TASK-002 (Flutter Structure)
            |-- TASK-003 (Drift/SQLCipher)
            |       |-- TASK-004 (Models)
            |               |-- TASK-005 (Riverpod)
            |               |       |-- TASK-006 (Phase Theme)
            |               |               |-- TASK-008 (CycleRing)
            |               |               |       |-- TASK-009 (Home Dashboard)
            |               |               |               |-- TASK-028 (Widget)
            |               |               |-- TASK-023 (Shop Browse)
            |               |               |       |-- TASK-024 (Product Detail)
            |               |               |-- TASK-033 (Shared Components)
            |               |-- TASK-010 (Cycle Service)
            |                       |-- TASK-011 (Daily Log)
            |                       |-- TASK-012 (Predictions)
            |                       |       |-- TASK-029 (Notifications)
            |                       |-- TASK-013 (Cycle Detail)
            |                       |       |-- TASK-014 (History)
            |                       |-- TASK-021 (AI Service)
            |-- TASK-007 (Navigation)
            |       |-- TASK-015 (Onboarding)
            |       |-- TASK-016 (Settings)
            |               |-- TASK-017 (Export)
            |               |-- TASK-018 (Delete)
            |               |-- TASK-030 (Analytics)
            |-- TASK-019 (ONNX)
            |       |-- TASK-020 (Chat UI)
            |       |-- TASK-021 (AI Service)
            |-- TASK-022 (Shopify Client)
            |       |-- TASK-023 (Shop Browse)
            |       |-- TASK-025 (Cart State)
            |       |       |-- TASK-026 (Checkout)
            |       |               |-- TASK-027 (Subscriptions)
            |       |-- TASK-024 (Product Detail)
            |-- TASK-034 (Secure Storage)
            |-- TASK-035 (Error Handling)

TASK-031 (Performance) <- All P0 tasks
TASK-032 (App Store) <- All P0/P1 tasks
```

---

## Notes

- **P0 tasks** are critical path for MVP launch
- **P1 tasks** enhance functionality but app is usable without them
- **P2 tasks** are nice-to-have for initial release
- Tasks are designed to be completable in 1-3 days (one focused session)
- Testing requirements follow the test pyramid: 60% unit, 20% widget, 15% integration, 5% E2E
