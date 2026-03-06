# Task Queue

<!-- Tasks for Libresse Cycle Tracking App -->
<!-- Generated from PRD (pm/prd.md) and Design Spec (design/design-spec.md) -->

---

## Phase 0: Foundation

---

## TASK-001: Project setup

**Status:** done
**Owner:** claude
**Priority:** high

### Acceptance Criteria
- [x] Tech stack decided and documented in root CLAUDE.md
- [x] Development environment configured (React Native or Flutter)
- [x] CI/CD pipeline set up
- [x] All team members can build and run locally
- [x] ESLint/Prettier or equivalent linting configured
- [x] Basic folder structure established

---

## TASK-002: Design system & theming

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Phase-adaptive color system implemented (terracotta/green/golden/lavender)
- [ ] Typography scale defined (rounded sans-serif, 16px minimum body)
- [ ] Spacing and sizing tokens established
- [ ] Dark mode foundation prepared (sufficient contrast ratios)
- [ ] Core components scaffolded: Button, Card, Input, Chip
- [ ] Theme context/provider that accepts current cycle phase

---

## TASK-003: Navigation structure

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Bottom tab bar with 4 tabs: Home, My Cycle, Shop, Assistant
- [ ] Tab icons and labels match design spec
- [ ] Screen routing configured for all main sections
- [ ] Deep linking support for future use
- [ ] Settings accessible from Home (profile icon, top-right)
- [ ] Navigation respects phase-adaptive theming

---

## TASK-004: On-device data layer

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Local storage solution chosen and implemented (SQLite, Realm, or equivalent)
- [ ] Cycle data schema defined (periods, symptoms, moods, flow levels)
- [ ] Offline-first architecture — all tracking works without network
- [ ] No account required for core tracking functionality
- [ ] Data persistence across app restarts
- [ ] Migration strategy for future schema changes

---

## TASK-005: Backend API scaffold

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] API framework chosen and documented
- [ ] Authentication system designed (optional login for sync/commerce)
- [ ] Product catalog endpoints defined (GET products, categories, inventory)
- [ ] Order/subscription endpoints defined
- [ ] API documentation (OpenAPI/Swagger or equivalent)
- [ ] Development/staging environment configured

---

## TASK-006: Privacy architecture

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] All health data processed on-device only
- [ ] No third-party advertising SDKs integrated
- [ ] Data export functionality (standard format)
- [ ] Data delete functionality (complete erasure)
- [ ] Privacy policy compliant with GDPR
- [ ] "Your data never leaves your phone" messaging integrated into UI

---

## Phase 1: Onboarding & Home

---

## TASK-007: Onboarding flow

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Welcome screen with Libresse branding
- [ ] Privacy explainer screen ("How we handle your data")
- [ ] Cycle setup screen (last period date, typical cycle length)
- [ ] Option to skip cycle setup ("I'll set this up later")
- [ ] Onboarding only shows once (persisted completion state)
- [ ] Graceful degradation on Home if cycle not set up

---

## TASK-008: Home Dashboard - Cycle status

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] CycleRing component showing current day in cycle
- [ ] Ring colored by current phase (terracotta/green/golden/lavender)
- [ ] Upcoming period shown as dashed segment in ring
- [ ] Day X of Y display with phase name
- [ ] Empty state: "Set up your cycle" CTA when no cycle data
- [ ] Background color subtly shifts by cycle phase

---

## TASK-009: Home Dashboard - Insights & nudges

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Phase Banner showing current phase + short description
- [ ] Today's Nudge card (contextual: health tip, product suggestion, or log reminder)
- [ ] Nudge states: "You logged today ✓", "How are you feeling?", product nudge
- [ ] 3-day upcoming forecast strip showing expected symptoms/phase transitions
- [ ] Forecast shows "Log a few cycles for predictions" when insufficient data
- [ ] Privacy badge visible: "Your data is on your device"

---

## TASK-010: Quick Log entry point

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Floating or prominent Log button on Home
- [ ] Badge indicator if not logged today
- [ ] Tapping opens Daily Log screen (modal or pushed)
- [ ] 1-2 taps to log flow intensity (minimal friction)
- [ ] Button state updates after successful log
- [ ] Haptic feedback on tap

---

## Phase 2: My Cycle

---

## TASK-011: Daily Log screen

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Flow selector: 5-level scale (none → heavy) with visual indicators
- [ ] Mood picker: grid of mood options (calm, anxious, happy, irritable, etc.)
- [ ] Symptom tags: scrollable chips (cramps, headache, bloating, fatigue, acne)
- [ ] Pain scale: 0-10 slider (collapsed by default, expands on tap)
- [ ] Optional notes field (collapsed by default)
- [ ] Save button disabled until at least one field has input
- [ ] Success animation on save, returns to Home
- [ ] Multiple logs per day merge (most recent values win)

---

## TASK-012: Cycle Detail view

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Horizontal scrollable Phase Timeline at top
- [ ] Timeline divided into four colored phases with current day marker
- [ ] Tap a day to see that day's log details
- [ ] Cycle stats: avg cycle length, avg period length
- [ ] Period prediction with confidence indicator
- [ ] "We need 3+ cycles for predictions" message when insufficient data

---

## TASK-013: Cycle History & trends

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] View past cycles in scrollable timeline
- [ ] Cycle regularity score displayed
- [ ] Trend cards showing symptom frequency over past N cycles
- [ ] Pattern language: "Headaches tend to appear in your luteal phase"
- [ ] Trend cards only shown after 2+ cycles logged
- [ ] "Keep logging" encouragement when insufficient history

---

## TASK-014: Phone sensor integration

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Apple HealthKit integration (iOS)
- [ ] Google Fit integration (Android)
- [ ] Read steps and sleep data (with user permission)
- [ ] Display passive insights without manual logging
- [ ] Clear permission request flow explaining why data is needed
- [ ] Graceful handling when permissions denied

---

## Phase 3: Health Assistant

---

## TASK-015: Health Assistant - Chat UI

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Standard chat interface with branded styling
- [ ] Suggested prompts (3-4 chips) based on current cycle phase
- [ ] Prompts disappear after first user message in session
- [ ] User messages right-aligned, AI responses left-aligned
- [ ] AI avatar/branding on responses
- [ ] Typing indicator (animated dots) while AI processes
- [ ] Persistent disclaimer footer: "For informational purposes. Not medical advice."
- [ ] Conversation persists within session, clears on app restart

---

## TASK-016: Health Assistant - AI backend

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] AI processing architecture (on-device or encrypted cloud)
- [ ] Phase-aware response generation
- [ ] Evidence-based, plain language responses
- [ ] Inline product suggestions (non-intrusive ProductCard)
- [ ] Fallback for unanswerable questions: "I'm not sure about that. Here's what I do know…"
- [ ] Medical/urgent question handling: disclaimer + suggest doctor
- [ ] Responses stream in (not all-at-once)
- [ ] Conversations never stored on server

---

## TASK-017: Health Assistant - Pattern recognition

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Analyze logged symptoms over multiple cycles
- [ ] Generate actionable insights: "Your headaches cluster around day 22-24"
- [ ] Detect worsening PMS patterns: "Consider discussing PMDD with your doctor"
- [ ] Surface insights proactively in AI responses
- [ ] Pattern insights tied to specific cycle phases
- [ ] Clear "talk to your doctor" boundaries maintained

---

## Phase 4: Shop & Commerce

---

## TASK-018: Shop - Product catalog API

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Product data model: name, description, images, price, category
- [ ] Inventory/stock status tracking
- [ ] Subscription options per product (frequency, discount)
- [ ] Product-to-cycle-phase mapping for recommendations
- [ ] API endpoints: list products, get product detail, search
- [ ] Admin interface or seed data for product management

---

## TASK-019: Shop - Browse screen

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Grid layout of product cards
- [ ] Phase filter: horizontal pills (All, Menstrual, Follicular, Ovulatory, Luteal)
- [ ] Default filter: current cycle phase selected
- [ ] Product cards: image, name, price, "Subscribe" badge if available
- [ ] Stock states: In stock, Low stock (badge), Out of stock (greyed + "Notify me")
- [ ] Search bar (collapsible, filters in real-time)
- [ ] Cart badge on tab bar Shop icon (hidden when empty)

---

## TASK-020: Shop - Product Detail & Cart

**Status:** pending
**Owner:** unassigned
**Priority:** high

### Acceptance Criteria
- [ ] Product Detail screen: images, description, reviews, price
- [ ] "Add to cart" button
- [ ] "Subscribe & save" option with frequency selector
- [ ] Cart screen: item list, quantities, subtotal
- [ ] Checkout flow: shipping, payment, confirmation
- [ ] Clear error handling for payment failures (retry option)
- [ ] Order confirmation screen with summary

---

## TASK-021: Subscription Manager

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] List of active subscriptions as cards
- [ ] Card shows: product image, name, frequency, next delivery, price
- [ ] Subscription states: Active, Paused (muted + "Resume" CTA), Expiring (warning)
- [ ] Monthly cost summary across all subscriptions
- [ ] Edit controls: change frequency, skip next delivery, pause, cancel
- [ ] Cancel requires confirmation step
- [ ] Empty state with "Start a subscription" CTA

---

## TASK-022: Smart subscription logic

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Subscription timing adapts to actual cycle length (not generic 28-day)
- [ ] Purchase history analysis to predict needs
- [ ] Proactive nudges: "Your flow starts in 3 days — stocked up?"
- [ ] "Running out mid-cycle" prevention logic
- [ ] Easy pause/cancel with no dark patterns
- [ ] Subscription suggestions feel helpful, not pushy

---

## TASK-023: Cost tracking

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Track user spending on menstrual products
- [ ] Display: "You've spent €94 this year"
- [ ] Subscription savings calculator: "A subscription saves €22"
- [ ] Monthly cost breakdown visualization
- [ ] Integration with Subscription Manager
- [ ] Tone: helpful/informative, not anxiety-inducing

---

## Phase 5: Settings & Polish

---

## TASK-024: Settings & Privacy screen

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Settings accessible from Home (profile icon)
- [ ] Privacy & Data section prominently displayed
- [ ] Show what's stored on-device vs. synced (if anything)
- [ ] "Export my data" button (standard format download)
- [ ] "Delete all data" with double confirmation
- [ ] Manage permissions (HealthKit, notifications)
- [ ] Discreet mode toggle (hide sensitive info)
- [ ] App icon customization options
- [ ] Light/dark mode toggle (when dark mode implemented)

---

## TASK-025: Home Widget

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Glanceable cycle status widget: "Day 14 · Follicular"
- [ ] Phase-color gradient in widget
- [ ] Discreet mode: user chooses what to display
- [ ] Widget updates daily (or on cycle data change)
- [ ] iOS Widget extension implementation
- [ ] Android widget implementation
- [ ] Widget configuration screen

---

## TASK-026: Notifications system

**Status:** pending
**Owner:** unassigned
**Priority:** medium

### Acceptance Criteria
- [ ] Notifications default to OFF (opt-in only)
- [ ] Maximum 1 notification per day
- [ ] Acceptable notifications: period prediction, pattern insights, shipment status
- [ ] Never: content promotion, guilt-tripping, vague engagement teasers
- [ ] User can configure which notification types to receive
- [ ] Notification timing respects user preferences
- [ ] Clear notification settings in Settings screen

---

## Phase 6: Advanced Features

---

## TASK-027: Lock Screen widget (iOS 16+)

**Status:** pending
**Owner:** unassigned
**Priority:** low

### Acceptance Criteria
- [ ] iOS 16+ Lock Screen widget support
- [ ] Glanceable cycle day/phase display
- [ ] Aesthetic customization options
- [ ] Discreet mode support
- [ ] Respects phase-adaptive coloring

---

## TASK-028: Doctor-ready export

**Status:** pending
**Owner:** unassigned
**Priority:** low

### Acceptance Criteria
- [ ] Generate PDF report with cycle history
- [ ] Include: cycle lengths, period lengths, logged symptoms
- [ ] Pattern summaries included in report
- [ ] Professional, readable format
- [ ] Share/export via standard iOS/Android sharing
- [ ] Date range selection for report

---

## TASK-029: Condition-specific modes

**Status:** pending
**Owner:** unassigned
**Priority:** low

### Acceptance Criteria
- [ ] PCOS tracking mode with relevant symptom options
- [ ] Endometriosis tracking mode
- [ ] PMDD tracking mode with mood/symptom emphasis
- [ ] Condition-specific insights and recommendations
- [ ] Option to switch modes or use standard tracking
- [ ] Medical disclaimer for condition-specific features

---

## TASK-030: Proactive insights

**Status:** pending
**Owner:** unassigned
**Priority:** low

### Acceptance Criteria
- [ ] Push insights based on upcoming cycle phase
- [ ] Example: "Your energy peaks next week — good time for that big presentation"
- [ ] Insights feel helpful, not intrusive
- [ ] Opt-in via notification preferences
- [ ] Insights personalized based on user's logged patterns
- [ ] Respects notification frequency limits

---

<!-- End of task queue -->
