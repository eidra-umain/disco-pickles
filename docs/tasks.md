# Development Tasks — Libresse App

**Generated:** 2026-03-06 | **Source:** PRD, Design Spec, Technical Design
**Target:** MVP buildable in ~1 hour with Claude Code

> **Note:** This is the MVP sprint breakdown. Task IDs use the `MVP-XXX` prefix to distinguish them from the canonical product task queue in [`/tasks.md`](../tasks.md) which uses `TASK-XXX`.

---

## Task Index

| ID | Title | Complexity | Priority | Dependencies | Status |
|----|-------|------------|----------|--------------|--------|
| MVP-001 | Configure Project Dependencies | S | P0 | — | pending |
| MVP-002 | Implement Core Data Models | S | P0 | MVP-001 | pending |
| MVP-003 | Set Up Drift Database | M | P0 | MVP-002 | pending |
| MVP-004 | Create Riverpod Providers | S | P0 | MVP-003 | pending |
| MVP-005 | Implement Phase Theme System | S | P0 | MVP-004 | pending |
| MVP-006 | Set Up Navigation | S | P0 | MVP-001 | pending |
| MVP-007 | Build CycleRing Widget | M | P0 | MVP-005 | pending |
| MVP-008 | Build Home Dashboard | M | P0 | MVP-007 | pending |
| MVP-009 | Build Daily Log Screen | M | P0 | MVP-004 | pending |
| MVP-010 | Build Cycle Detail Screen | M | P1 | MVP-008 | pending |
| MVP-011 | Build Shop Browse Screen | M | P1 | MVP-006 | pending |
| MVP-012 | Build Health Assistant Screen | M | P2 | MVP-006 | pending |

---

## MVP-001: Configure Project Dependencies

**Priority:** P0 | **Complexity:** S | **Dependencies:** None

**Description:**
Update `pubspec.yaml` with required dependencies for state management, database, navigation, and UI.

**Acceptance Criteria:**
- [ ] Add flutter_riverpod, riverpod_annotation
- [ ] Add drift, sqlite3_flutter_libs, flutter_secure_storage
- [ ] Add go_router
- [ ] Add freezed_annotation, json_annotation (dev: freezed, json_serializable, build_runner, drift_dev)
- [ ] Run `flutter pub get` successfully

**Testing Requirements:**
- Manual QA: `flutter pub get` completes without errors

---

## MVP-002: Implement Core Data Models

**Priority:** P0 | **Complexity:** S | **Dependencies:** MVP-001

**Description:**
Create Freezed data models for Phase, Cycle, and DailyLog with computed properties.

**Acceptance Criteria:**
- [ ] `Phase` enum: menstrual, follicular, ovulatory, luteal
- [ ] `Cycle` model with startDate, endDate, length, computed currentDay/currentPhase
- [ ] `DailyLog` model with date, flowLevel, painLevel, symptoms, moods, notes
- [ ] Models use Freezed for immutability
- [ ] Run `dart run build_runner build` successfully

**Testing Requirements:**
- Unit tests: Test Cycle.currentPhase at different days

---

## MVP-003: Set Up Drift Database

**Priority:** P0 | **Complexity:** M | **Dependencies:** MVP-002

**Description:**
Configure Drift database with tables for cycles, daily logs, and settings.

**Acceptance Criteria:**
- [ ] `AppDatabase` class with Cycles, DailyLogs, UserSettings tables
- [ ] DAOs for each table with basic CRUD operations
- [ ] Database opens and initializes correctly
- [ ] Run `dart run build_runner build` for generated code

**Testing Requirements:**
- Unit tests: Test insert/query operations

---

## MVP-004: Create Riverpod Providers

**Priority:** P0 | **Complexity:** S | **Dependencies:** MVP-003

**Description:**
Set up core Riverpod providers for cycle state and database access.

**Acceptance Criteria:**
- [ ] `databaseProvider` for AppDatabase instance
- [ ] `cycleRepositoryProvider` for data access
- [ ] `currentCycleProvider` returning active cycle or null
- [ ] `currentPhaseProvider` derived from cycle
- [ ] ProviderScope wrapping app in main.dart

**Testing Requirements:**
- Manual QA: Providers initialize without errors

---

## MVP-005: Implement Phase Theme System

**Priority:** P0 | **Complexity:** S | **Dependencies:** MVP-004

**Description:**
Create phase-adaptive theming with four color palettes.

**Acceptance Criteria:**
- [ ] `PhaseTheme` class with primary, background, surface colors
- [ ] Colors: menstrual (#E07A5F), follicular (#81B29A), ovulatory (#F2CC8F), luteal (#B8A9C9)
- [ ] `phaseThemeProvider` derived from currentPhaseProvider
- [ ] Theme accessible throughout widget tree

**Testing Requirements:**
- Manual QA: Visual inspection of theme colors

---

## MVP-006: Set Up Navigation

**Priority:** P0 | **Complexity:** S | **Dependencies:** MVP-001

**Description:**
Configure go_router with bottom tab navigation.

**Acceptance Criteria:**
- [ ] Bottom tab bar: Home, My Cycle, Shop, Assistant
- [ ] ShellRoute for persistent tab bar
- [ ] Routes for all main screens
- [ ] Proper back button behavior

**Testing Requirements:**
- Manual QA: Navigate between all tabs

---

## MVP-007: Build CycleRing Widget

**Priority:** P0 | **Complexity:** M | **Dependencies:** MVP-005

**Description:**
Custom paint widget showing cycle progress with phase-colored segments.

**Acceptance Criteria:**
- [ ] Circular ring with 4 phase segments
- [ ] Current day marker (white dot)
- [ ] Phase colors from PhaseTheme
- [ ] Configurable size

**Testing Requirements:**
- Widget tests: Renders correctly at different cycle days
- Manual QA: Visual inspection

---

## MVP-008: Build Home Dashboard

**Priority:** P0 | **Complexity:** M | **Dependencies:** MVP-007

**Description:**
Home screen with CycleRing, phase banner, and quick actions.

**Acceptance Criteria:**
- [ ] CycleRing prominently displayed
- [ ] Phase banner with name and description
- [ ] Quick Log button
- [ ] Privacy badge ("Your data stays on device")
- [ ] Empty state when no cycle data

**Testing Requirements:**
- Widget tests: Test empty and active states
- Manual QA: Visual review

---

## MVP-009: Build Daily Log Screen

**Priority:** P0 | **Complexity:** M | **Dependencies:** MVP-004

**Description:**
Modal screen for logging daily symptoms, flow, and mood.

**Acceptance Criteria:**
- [ ] Flow level selector (5 levels)
- [ ] Mood picker (multi-select chips)
- [ ] Symptom tags (scrollable chips)
- [ ] Pain scale (0-10)
- [ ] Save button (disabled until input)
- [ ] Saves to database

**Testing Requirements:**
- Widget tests: Test input interactions
- Integration tests: Test save persists data

---

## MVP-010: Build Cycle Detail Screen

**Priority:** P1 | **Complexity:** M | **Dependencies:** MVP-008

**Description:**
My Cycle tab showing detailed cycle view and stats.

**Acceptance Criteria:**
- [ ] Phase timeline visualization
- [ ] Cycle stats (avg length, regularity)
- [ ] Period prediction display
- [ ] Link to Daily Log

**Testing Requirements:**
- Widget tests: Test stats display
- Manual QA: Visual review

---

## MVP-011: Build Shop Browse Screen

**Priority:** P1 | **Complexity:** M | **Dependencies:** MVP-006

**Description:**
Shop tab with product grid and phase filtering (mock data).

**Acceptance Criteria:**
- [ ] Product card grid
- [ ] Phase filter pills
- [ ] Mock product data
- [ ] Product detail navigation (placeholder)

**Testing Requirements:**
- Widget tests: Test filter interactions
- Manual QA: Visual review

---

## MVP-012: Build Health Assistant Screen

**Priority:** P2 | **Complexity:** M | **Dependencies:** MVP-006

**Description:**
Assistant tab with chat UI (placeholder/mock responses).

**Acceptance Criteria:**
- [ ] Chat message list
- [ ] Text input field
- [ ] Suggested prompts
- [ ] Mock AI responses
- [ ] Medical disclaimer footer

**Testing Requirements:**
- Widget tests: Test message rendering
- Manual QA: Test conversation flow

---

## Dependency Graph

```
MVP-001 (Dependencies)
    |-- MVP-002 (Models)
    |       |-- MVP-003 (Database)
    |               |-- MVP-004 (Providers)
    |                       |-- MVP-005 (Theme)
    |                               |-- MVP-007 (CycleRing)
    |                                       |-- MVP-008 (Home)
    |                                               |-- MVP-010 (Cycle Detail)
    |-- MVP-006 (Navigation)
            |-- MVP-011 (Shop)
            |-- MVP-012 (Assistant)

MVP-004 (Providers)
    |-- MVP-009 (Daily Log)
```

---

## Execution Order (Recommended)

For fastest parallel execution with Claude:

1. **MVP-001** - Dependencies (~2 min)
2. **MVP-002 + MVP-006** - Models + Navigation in parallel (~5 min)
3. **MVP-003** - Database (~5 min)
4. **MVP-004** - Providers (~3 min)
5. **MVP-005** - Theme (~3 min)
6. **MVP-007 + MVP-009** - CycleRing + Daily Log in parallel (~8 min)
7. **MVP-008** - Home Dashboard (~8 min)
8. **MVP-010 + MVP-011 + MVP-012** - Remaining screens in parallel (~10 min)

**Total estimated time: ~45-60 minutes**

---

## Notes

- **P0 tasks** (9): Critical for functional MVP
- **P1 tasks** (2): Enhanced functionality
- **P2 tasks** (1): Nice-to-have
- All tasks designed for single Claude session completion
- Mock data used where external APIs (Shopify, AI) would be needed
- Focus on UI/UX scaffold that can be enhanced later
