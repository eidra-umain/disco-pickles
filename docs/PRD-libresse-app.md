# PRD: Libresse Cycle App

| Field          | Value                                      |
|----------------|--------------------------------------------|
| Author         | Product Team                               |
| Status         | Draft                                      |
| Created        | 2026-03-06                                 |
| Last updated   | 2026-03-06                                 |
| Stakeholders   | Libresse (Essity), umain, Product, Engineering, Design |
| Target release | TBD — Prototype validation first           |

---

## 1. Executive Summary

Libresse is building a privacy-first period tracking and commerce app for Gen Z women (16–25). The app replaces the broken incumbents — led by Flo, which faced both an FTC enforcement action (2021, behavioral remedies) and a $56M class action settlement (2024–2025, with Google paying $48M and Flo paying $8M) for sharing intimate health data with Facebook, Google, and others — with a cycle-phase-aware experience that combines on-device health tracking, an AI health assistant, and context-aware product commerce. Unlike competitors that monetize user data, Libresse's revenue comes from product sales, aligning user trust with business incentives. The prototype validates whether a cycle-rhythm-driven UX, intelligent health guidance, and integrated product commerce can capture a disillusioned market worth $2.5B and growing at 20% CAGR.

---

## 2. Problem Statement

**Who:** Gen Z women aged 16–25 who menstruate and use smartphones as their primary device. This is the most mobile-native demographic: ~4.5 hours daily screen time, 80–100+ phone unlocks per day, with usage dominated by short "snacking" sessions peaking midday and 8pm–midnight. Health & wellness apps rank 5th in their usage hierarchy (behind social media, messaging, entertainment, and shopping). This includes the "Everyday User" (currently using Flo, Clue, or Apple Health and dissatisfied) and the "Loyal Libresse Customer" (already buys Libresse products and is open to a digital relationship).

**What they're trying to do:** Track their menstrual cycle, understand why they feel the way they do on any given day, and manage the recurring cost and logistics of menstrual products — without sacrificing their privacy or paying a premium for basic functionality.

**Where they get stuck (ranked by severity):**

*Critical — app-killing issues:*

- **Privacy fear:** 25–30% of women considered deleting period tracking apps post-Dobbs. Flo shared intimate health data (pregnancy status, menstrual cycles, sexual activity, contraceptive methods) with Facebook, Google Analytics, AppsFlyer, and Flurry. In August 2025, a federal jury found Meta itself violated California law by collecting this data. 60–65% of Gen Z are concerned about how companies use data; 35% have stopped using a service due to privacy concerns — the highest of any generation. Post-Dobbs, the fear that cycle data could be subpoenaed is real and documented.
- **Aggressive paywalls:** The #1 complaint across the category. Users describe being prompted to subscribe "after every action." Clue users dropped ratings from 5 to 3 stars citing paywall frustration. ~50% of Gen Z feel they're paying for too many subscriptions; 60–65% prefer free, ad-supported apps over paid. Free trials that auto-convert are deeply mistrusted.
- **Prediction inaccuracy:** Apps assume ~28-day cycles and adjust slowly. For the large population with irregular cycles (PCOS, thyroid, perimenopause, stress, birth control), predictions are often wrong by a week+. Ovulation estimates presented with false confidence.

*High — significant friction:*

- **Unwanted pregnancy/fertility content:** Childfree users frustrated by conception tips. Users post-miscarriage served "your baby is the size of..." content. LGBTQ+ users alienated by heteronormative assumptions. Switching modes is difficult and emotionally traumatic.
- **UI clutter and content overload:** Apps that started as trackers became content platforms. Core function buried under articles, forums, quizzes, promotions. Users want to "just log my period and see the prediction."
- **Infantilizing design:** Pink flowers, butterflies, and cutesy language alienate a large segment. Trans men and nonbinary users feel excluded. UW study: one of the biggest complaints was "the use of pink, flowery iconography."

*Moderate — cumulative frustration:*

- **No intelligence:** Apps collect symptoms but deliver minimal insight. Users want "why do I feel like this?" not just "your period is in 5 days." The #1 unmet need is understanding, not tracking.
- **No product connection:** No tracker links cycle data to the menstrual products users actually need. Recommendations, cost tracking, and auto-replenishment don't exist. Menstrual products are a ~€100–120/year expense that feels invisible but adds up.
- **Data portability:** Switching apps means losing years of data. No standard format. Data held hostage as a retention mechanism.

**The Fundamental Paradox:** Users simultaneously want simplicity ("just let me log and see predictions"), depth ("tell me WHY I feel this way"), privacy ("don't store my data in the cloud"), and intelligence ("use AI to give me personalized insights"). Solving this tension — simple surface, intelligent depth, private architecture — is the central design challenge.

**Evidence:**

- Flo: FTC enforcement action (2021) + $56M class action settlement (2024–2025) + Meta found liable by federal jury (August 2025). 380M+ downloads, 1.6-star rating.
- Clue users dropped ratings from 5 to 3 stars citing paywall frustration. Financial struggles reported.
- Stardust: post-Dobbs privacy marketing, but claims debunked by security researchers.
- Ovia: free but employer-subsidized — employers may access reproductive health data.
- 84% of women feel "unheard" in healthcare settings (femtech research)
- r/periods most common question: "What app should I use?" — no consensus answer exists
- r/PCOS: "Period trackers are practically useless for us." Want symptom tracking, not cycle predictions.
- r/endometriosis: Need pain by body location, non-period symptoms, exportable reports for surgeons.
- r/birthcontrol: "Apps don't understand hormonal BC." Withdrawal bleeds ≠ periods. IUD users abandoned.
- Only 4% of healthcare R&D addresses women's health directly

**Cost of inaction:** Libresse has no owned digital touchpoint with end users. The relationship ends at the retail shelf. Meanwhile, tech companies capture and monetize menstrual health data that Libresse could use to serve customers better. If a competitor (or a well-funded femtech startup) fills the trust gap first, Libresse loses the opportunity to own the direct customer relationship in a $13B addressable market (projected 2035).

---

## 3. Goals & Success Metrics

### Prototype Phase Goals

| Goal | Metric | Baseline | Target | Measurement Method |
|------|--------|----------|--------|--------------------|
| Validate cycle-phase UX resonance | User comprehension score — % of test users who correctly identify their current cycle phase and what it means within 10 seconds | N/A (new) | ≥80% | Moderated usability testing (5-second test) |
| Validate AI health assistant value | % of test users who rate the assistant response as "useful" or "very useful" | N/A (new) | ≥70% | Post-task survey (Likert scale) |
| Validate commerce integration acceptance | % of test users who find product recommendations "helpful" vs "intrusive" | N/A (new) | ≥65% helpful | Post-task survey |
| Validate privacy messaging clarity | % of test users who can articulate how their data is protected after 1 min of use | N/A (new) | ≥75% | Moderated interview recall |
| Validate subscription interest | % of test users expressing intent to try a cycle-synced subscription | N/A (new) | ≥30% | Post-prototype survey |

### MVP Phase Goals (post-validation)

| Goal | Metric | Baseline | Target | Measurement Method |
|------|--------|----------|--------|--------------------|
| User acquisition | Monthly downloads | 0 | 100K within first 3 months of launch | App store analytics |
| Daily engagement | DAU/MAU ratio | Industry avg: ~15% for health apps | ≥25% | Product analytics (on-device aggregated) |
| Cycle tracking retention | % of users logging ≥3 cycles | N/A | ≥40% | On-device event tracking, privacy-preserving aggregation |
| Commerce conversion | % of MAU who make at least 1 purchase | N/A | ≥5% | Commerce backend |
| Subscription adoption | % of purchasers converting to subscription | N/A | ≥20% of purchasers | Commerce backend |
| NPS | Net Promoter Score | Flo: ~10–20 (estimated) | ≥50 | In-app survey (quarterly) |

**Guardrail metrics (must NOT degrade):**

| Guardrail | Threshold |
|-----------|-----------|
| App store rating | Must stay ≥4.5 stars |
| Notification opt-out rate | Must stay ≤15% per month |
| Subscription cancel rate (first 30 days) | Must stay ≤10% |
| Privacy incident count | Must remain 0 |

---

## 4. User Stories & Scenarios

### Persona: Everyday User (Mia, 21, university student)

> **As a** Gen Z woman who currently uses Flo, **I want to** track my period without worrying about my data being sold **so that** I feel safe using a health app.

> **As a** person with irregular cycles, **I want to** log symptoms quickly and see patterns over time **so that** I understand why I feel the way I do.

> **As a** cost-conscious student, **I want to** see how much I spend on menstrual products **so that** I can budget better and find savings.

> **As a** busy person, **I want to** glance at a widget on my home screen to see where I am in my cycle **so that** I don't have to open the app every day.

> **As a** user who hates notification spam, **I want to** only receive notifications that are genuinely useful **so that** I don't disable them (and miss the ones that matter).

### Persona: Loyal Libresse Customer (Sara, 24, young professional)

> **As a** loyal Libresse customer, **I want to** get product recommendations matched to my flow patterns **so that** I always have the right products on hand.

> **As a** subscriber, **I want to** auto-replenish my products timed to my actual cycle **so that** I never run out mid-period.

> **As a** woman experiencing recurring PMS symptoms, **I want to** ask an AI health assistant "why do I get migraines before my period?" **so that** I get a plain-language, evidence-based answer.

### Unmet User Needs (from UX Research)

The fundamental question users are trying to answer is not "when is my next period?" but **"is what I'm experiencing normal?"**

| Need | Current State | Opportunity |
|------|--------------|-------------|
| Symptom pattern recognition | Apps log symptoms but don't analyze correlations | AI that connects migraines to luteal phase, anxiety to PMS, acne to hormonal shifts |
| Health education | Generic articles behind paywalls | Phase-specific education: "Here's what's happening in your body RIGHT NOW and why" |
| Pain management | "Try yoga" — not helpful | Track what actually works: "400mg ibuprofen at onset reduced cramps from 8/10 to 3/10" |
| Product recommendations | Non-existent in trackers | "Your flow data suggests super-absorbency for days 1–2, switching to regular by day 4" |
| Cycle-informed life planning | Not addressed | "Your energy peaks next week — good time for that big presentation" |
| Doctor-ready reports | Manual data export at best | Clean, shareable summary with cycle lengths, symptom patterns, flow intensity |
| Cost tracking | Non-existent | "You spend ~€120/year on menstrual products. Here's how to optimize." |

### Key Scenarios

**Scenario: First-time setup**
- **Given** Mia downloads the app for the first time
- **When** she opens it
- **Then** she sees a clear privacy statement ("Your data stays on your device"), can start tracking immediately without creating an account, and is guided through a minimal onboarding (cycle length, last period date) in under 60 seconds.

**Scenario: Daily check-in via widget**
- **Given** Mia has the Libresse widget on her home screen
- **When** she glances at her phone
- **Then** she sees "Day 22 · Luteal Phase" with a countdown to her next predicted period, without opening the app.

**Scenario: Quick symptom logging**
- **Given** Mia is experiencing cramps and headache on Day 2
- **When** she opens the app
- **Then** she can log both symptoms in ≤2 taps from the home screen, and the dashboard updates to show comfort-focused recommendations.

**Scenario: AI health assistant query**
- **Given** Sara has logged migraines for 3 consecutive cycles around Day 22–24
- **When** she asks the Health Assistant "why do I always get headaches before my period?"
- **Then** the assistant explains the estrogen-drop connection in plain language, suggests evidence-based relief strategies, and optionally mentions a relevant Libresse product — without storing the conversation on any server.

**Scenario: AI health assistant — escalation to doctor**
- **Given** Sara describes symptoms that may indicate endometriosis
- **When** the assistant detects a pattern consistent with a medical condition
- **Then** it clearly recommends she speak with a healthcare professional, offers to generate a doctor-ready report of her cycle data, and does NOT attempt to diagnose.

**Scenario: Cycle-synced product recommendation**
- **Given** Sara's predicted period is 3 days away
- **When** she opens the Shop tab
- **Then** she sees a pre-built order based on her flow history ("Super × 8, Regular × 6, Liners × 4"), her estimated spend, and a one-tap confirm for delivery.

**Scenario: Auto-replenishment**
- **Given** Sara has opted into auto-replenishment
- **When** her predicted period is 5 days away and her estimated product supply is low
- **Then** the app sends a single notification: "Your essentials ship tomorrow — tap to review or adjust," and she can confirm or modify in one tap.

**Scenario: Subscription cancellation (unhappy path)**
- **Given** Sara wants to cancel her subscription
- **When** she navigates to subscription settings
- **Then** she can cancel in ≤2 taps with no guilt screens, dark patterns, or retention walls. She sees a clear confirmation and a note that she can re-subscribe anytime.

**Scenario: Irregular cycle handling**
- **Given** Mia has PCOS and her cycles range from 24–45 days
- **When** the app's prediction is wrong by a week
- **Then** the app adapts predictions based on her actual history, shows confidence ranges ("expected between Day 28–38"), and doesn't present a false-precision single date.

**Scenario: Privacy verification**
- **Given** Mia wants to verify her data isn't being sent anywhere
- **When** she taps the privacy indicator on the home screen
- **Then** she sees a clear, jargon-free explanation of on-device processing, confirmation that no health data leaves the phone, and an option to export or delete all her data.

---

## 5. Functional Requirements

### 5.1 Home ("Your Day")

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-H01 | Display current cycle day, phase name, and phase description | P0 | Home screen shows "Day X · [Phase Name]" with a 1-sentence description of what to expect today. Updates daily. |
| FR-H02 | Countdown to next predicted period | P0 | Shows "Period in ~X days" with confidence range for irregular cycles. |
| FR-H03 | Quick-log bar for period start/end, symptoms, and mood | P0 | User can log period, top 3 symptoms, and mood in ≤2 taps from home screen. |
| FR-H04 | Phase-aware content nudges | P1 | Dashboard surfaces 1–2 relevant nudges based on current phase (e.g., "Rest day" in menstrual, "Energy peak" in follicular). No generic articles. |
| FR-H05 | Privacy indicator | P0 | Persistent, visible indicator on home screen confirming on-device data processing. Tappable for detail view. |
| FR-H06 | Bento-box card layout | P1 | Home screen uses a modular card layout. Cards are reorderable by the user. |
| FR-H07 | Phase-adaptive UI theming | P2 | UI color temperature/mood shifts subtly by cycle phase (warmer in menstrual/luteal, brighter in follicular). User can disable. |

### 5.2 My Cycle ("Your Body")

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-C01 | Cycle phase dashboard with hormonal context | P0 | Shows current phase with a plain-language explanation of what's happening hormonally. |
| FR-C02 | Symptom logging (fast entry) | P0 | Pre-populated symptom grid with icons. Log any symptom in 1 tap. Support custom symptoms. ≤5 seconds for a typical log. |
| FR-C03 | Cycle history and predictions | P0 | Calendar/timeline view showing past cycles and future prediction with confidence range. Adapts to irregular cycles within 3 logged cycles. |
| FR-C04 | Pattern detection and insights | P1 | After ≥3 cycles of data, surface correlations: "You logged [symptom] in X of your last Y cycles around Day Z." |
| FR-C05 | Doctor-ready export | P1 | Generate a clean PDF/share-ready summary of cycle data (cycle lengths, symptom patterns, flow intensity) that a clinician can quickly parse. |
| FR-C06 | On-device processing for all cycle computations | P0 | All prediction algorithms, symptom analysis, and pattern detection run locally. Zero health data transmitted to any server. Verifiable in privacy audit. |
| FR-C07 | Data export and deletion | P0 | User can export all their data in a standard format and/or permanently delete all data from the device in ≤3 taps. |
| FR-C08 | Wearable data integration (optional) | P2 | Integrate Apple Health / Google Health Connect data (steps, resting heart rate, sleep) to improve cycle predictions. Explicit opt-in. Data stays on device. |

### 5.3 Shop ("Your Essentials")

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-S01 | Context-aware product recommendations | P0 | Recommendations adapt to cycle phase and flow history: "Based on your patterns, Super for Days 1–2, Regular for Days 3–5." |
| FR-S02 | One-tap reorder of previous purchases | P0 | Last order is pre-populated. User confirms with 1 tap. |
| FR-S03 | Cycle-synced subscription | P1 | Subscription timing adapts to actual predicted cycle length, not a fixed 28/30-day cadence. |
| FR-S04 | Cost tracking dashboard | P1 | Shows monthly and annual spend on menstrual products. Compares current spend to subscription pricing. |
| FR-S05 | Subscription management (no dark patterns) | P0 | Pause or cancel in ≤2 taps. No guilt screens, confirmation nags, or hidden cancellation flows. Clear renewal dates. |
| FR-S06 | Product catalog with filtering | P1 | Browsable catalog with filters (product type, absorbency, format). |
| FR-S07 | Pre-period replenishment prompt | P1 | 3–5 days before predicted period, surface a pre-built order for review. Single notification if opted in. |
| FR-S08 | Auto-replenishment (opt-in) | P2 | Fully automated ordering based on cycle predictions and purchase history. User confirms or adjusts via notification. Off by default. |

### 5.4 Health Assistant ("Your Guide")

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-A01 | Conversational AI interface for menstrual health questions | P0 | User can type or tap pre-suggested questions. Responses are in plain language, evidence-based, and scoped to menstrual/reproductive health. |
| FR-A02 | Cycle-context-aware responses | P0 | Assistant has access to user's cycle data (on-device) and incorporates it into answers: "Based on your cycle history, your migraines tend to occur during the late luteal phase." |
| FR-A03 | Medical escalation guardrail | P0 | When symptoms suggest a condition requiring medical attention (e.g., endometriosis, PMDD, severe irregularity), the assistant explicitly recommends consulting a healthcare professional. Never diagnoses. |
| FR-A04 | Product recommendation integration | P1 | When contextually relevant, the assistant can mention Libresse products as part of a holistic response — never as the primary answer. User can disable product mentions. |
| FR-A05 | On-device conversation processing | P0 | No conversation data is transmitted to external servers. AI model runs on-device or queries are processed without persisting user health data server-side. |
| FR-A06 | Pre-suggested questions by cycle phase | P1 | Phase-relevant question suggestions: "Why am I so tired?" (luteal), "Is this flow amount normal?" (menstrual), etc. |

### 5.5 Onboarding & Account

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-O01 | No-account-required usage | P0 | Core tracking and health assistant work immediately without registration. No email, no phone number, no social login required. |
| FR-O02 | Minimal onboarding flow | P0 | ≤3 screens. Collect: approximate cycle length, date of last period. Skip option for everything. Complete in ≤60 seconds. |
| FR-O03 | Optional account for commerce features | P1 | Account creation required only for Shop/subscription. Clearly scoped: "Sign up to shop — your health data stays on your device regardless." |
| FR-O04 | Notification preferences during onboarding | P1 | Default: all notifications OFF. User opts in to specific categories. No pre-checked boxes. |
| FR-O05 | Data import from competing apps | P2 | Support importing cycle history from Flo, Clue, and Apple Health to reduce switching friction. |

### 5.7 Notifications

Research context: 40–50% of Gen Z have turned off notifications for most apps. 50–60% have **uninstalled an app** because of annoying notifications. Gen Z is 2x more likely than older generations to disable notifications within the first week.

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-N01 | Maximum 1 notification per day from non-messaging interactions | P0 | System enforces a daily cap. No stacking of multiple notifications. |
| FR-N02 | All notifications default to OFF | P0 | Zero notifications sent until user explicitly opts in per category. |
| FR-N03 | Every notification must be actionable | P0 | Each notification passes the test: "Would the user thank the app for telling them this?" No generic promotional blasts, guilt-tripping, or vague teasers. |
| FR-N04 | Permitted notification types | P0 | Only: period prediction reminders, pattern insights ("You logged migraines 3 cycles in a row"), subscription shipment updates, and pre-period replenishment prompts. |
| FR-N05 | Prohibited notification types | P0 | Never send: generic content promotions, re-engagement guilt ("You haven't logged in X days"), feature announcements, or mass-blast messages. |

### 5.6 Widget

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-W01 | Home screen widget (iOS + Android) | P1 | Shows cycle day, phase name, and countdown to next period. Multiple sizes (small: day + phase, medium: + countdown, large: + symptom quick-log). |
| FR-W02 | Lock screen widget (iOS) | P2 | Minimal widget for iOS lock screen showing cycle day and phase. |
| FR-W03 | Discreet mode | P1 | Widget can be configured to show abstract indicators (colors, numbers) without explicit menstrual language — for teens, shared devices, or privacy preference. |
| FR-W04 | Aesthetic customization | P2 | Multiple color themes for widget to match home screen aesthetic. |

---

## 6. Non-Functional Requirements

### Performance

| Metric | Target |
|--------|--------|
| App cold start | ≤2 seconds to interactive home screen |
| Symptom log action | ≤200ms response (tap to confirmation) |
| Cycle prediction computation | ≤500ms on-device |
| AI assistant response (first token) | ≤1.5 seconds |
| AI assistant full response | ≤5 seconds for typical query |
| Widget refresh | ≤1 second |
| App size (initial download) | ≤80MB (iOS), ≤60MB (Android) |

### Scalability

- On-device architecture means server load is limited to commerce/account services
- Commerce backend must support 1M+ concurrent users at peak (period product demand clusters around common cycle dates)
- AI model must run efficiently on devices from iPhone 12 / Android mid-range (2022+) onward

### Security & Privacy

| Requirement | Detail |
|-------------|--------|
| Health data storage | On-device only. Encrypted at rest using platform keychain/keystore. |
| Data transmission | Zero health data transmitted to Libresse servers. Commerce data (orders, addresses) over TLS 1.3. |
| Third-party SDKs | No advertising SDKs, no analytics SDKs that transmit user-level data. Privacy-preserving aggregated analytics only (e.g., differential privacy). |
| Authentication | Commerce account: email + password or biometric. Health tracking: no auth required. |
| Data deletion | Full device data wipe available. Commerce account deletion per GDPR Art. 17. |
| GDPR compliance | Full compliance. Data processing agreements for commerce only. DPIA completed before launch. |
| Regulatory | Comply with EU MDR if AI assistant outputs are classified as medical device guidance. Legal review required. |
| Penetration testing | Independent security audit before public launch. |

### Reliability

| Requirement | Target |
|-------------|--------|
| Core tracking (on-device) | 100% availability (no server dependency) |
| Commerce backend uptime | 99.9% |
| AI assistant availability | 99.5% (graceful degradation to pre-built responses if model unavailable) |
| Offline mode | Full tracking, logging, and cycle prediction functionality offline. Commerce requires connectivity. |

### Accessibility

- WCAG 2.1 AA compliance minimum
- Full VoiceOver (iOS) and TalkBack (Android) support
- Minimum touch target: 44×44pt
- Color contrast ratio ≥4.5:1 for text, ≥3:1 for UI components
- No information conveyed by color alone (use icons + labels)
- Support for Dynamic Type / system font scaling

### Internationalization

- Launch markets: UK, Sweden, Netherlands, Germany, France (align with Libresse retail presence)
- RTL support for future expansion
- Localized product catalogs per market
- Currency and date formatting per locale
- All UI strings externalized for translation

---

## 7. UX & Design

### Design Principles

1. **Cycle-first, not feature-first.** The app adapts to where the user is in their cycle. The phase determines the content, tone, and recommendations — not a static nav structure. 71% of Gen Z expect personalization as baseline; cycle-phase personalization is a natural extension.
2. **Privacy is visible.** Not buried in settings. The home screen communicates data safety at all times. Research shows 75%+ of users should be able to articulate how their data is protected after 1 minute of use.
3. **Speed over spectacle.** Every interaction must feel instant. Skeleton screens over spinners. No loading walls. Speed is the #1 UX factor for Gen Z — perceived lag is a dealbreaker.
4. **Warm minimalism.** Clean layouts with personality — "cozy tech" not cold clinical. Research-backed aesthetic: soft, muted palettes (sage greens, dusty roses, lavender, warm cream), subtle organic gradients, rounded corners, generous whitespace with playful moments (illustration, unexpected color, witty microcopy). Glassmorphism for overlays.
5. **No dark patterns. Anywhere.** Subscriptions, notifications, onboarding — all designed for trust.
6. **Content-first.** UI should "get out of the way" during content consumption. Full-bleed media, vertical scrolling, immersive viewing. No content spam on the home screen — no articles unless requested.

### Research-Backed Aesthetic Direction

**Color:** Soft, muted palettes dominate Gen Z preferences — sage greens, dusty roses, lavender, warm cream. Subtle organic gradients (not bold 2010s style). Bold color as accent only. Dark mode prefers true dark + warm accents.

**Typography:** Sans-serif dominant, growing appreciation for serif headlines. Rounded, friendly sans-serifs (e.g., Poppins, Nunito) align with health/wellness app expectations.

**Imagery:** Authentic/unfiltered preferred over polished stock. Custom illustrations valued. Collage/scrapbook aesthetics trending.

**Personalization priority (from UX research):** (1) Content/feed personalization, (2) Visual/aesthetic customization (themes, color schemes), (3) Functional personalization (reorder navigation, hide unused features), (4) Notification personalization (granular category-level control), (5) Identity personalization (name, pronouns). User-controlled personalization preferred over invisible behavioral tracking — "creepy" personalization causes backlash.

### Key States to Design

| State | Handling |
|-------|----------|
| Empty state (first open) | Friendly onboarding — not a blank screen. "Let's get to know your cycle." |
| Loading | Skeleton screens, never spinners. Content appears progressively. |
| Error (commerce) | Clear message + retry. "We couldn't place your order. Tap to try again." |
| Error (AI assistant) | Fallback to pre-built FAQ-style responses. "I'm having trouble right now. Here are common answers about [topic]." |
| No cycle data yet | Graceful: "Log your first period to unlock predictions." Show educational content about cycle phases. |
| Irregular cycle / low confidence | Show prediction ranges, not single dates. "Expected between Day 28–38." |
| Permission denied (HealthKit/notifications) | Non-blocking explanation of benefit + link to system settings. No repeated prompts. |
| Discreet mode | Abstract/neutral visual language on widgets and notifications for shared-device privacy. |

### Design System

- Bottom navigation bar (4 tabs: Home, My Cycle, Shop, Health Assistant) — strongly preferred over hamburger menus by Gen Z
- Dark mode support (user-toggled, not forced) — 70–80% of Gen Z prefer dark mode, but many women prefer lighter themes in health/wellness apps, so the *option* matters
- Phase-adaptive color accents (subtle, user-can-disable)
- Card-based "bento box" layout for home dashboard
- Haptic feedback + visual microinteractions on key interactions (log confirmation, phase transition) — feels "premium" per research
- Swipe gestures for common actions (TikTok set this paradigm; intuitive and expected)

### Cycle-as-Operating-System: Phase-Adaptive UX

The entire experience adapts to the user's current cycle phase:

**Menstrual Phase (Days 1–5):** Dashboard emphasizes comfort (pain management, heating pad reminders). Product spotlight: high-absorbency products. Health assistant proactively offers pain relief strategies. Energy indicator: "Rest mode." Gentle, warm UI tones.

**Follicular Phase (Days 6–13):** Dashboard emphasizes energy and planning. Product needs shift to lighter protection. Health assistant surfaces exercise optimization. "Your energy is rising — great time for that big meeting." Brighter, more energetic UI.

**Ovulation Window (Days 13–15):** Clear, non-judgmental fertility status (opt-in). No assumptions about intent. Health education about what's happening hormonally.

**Luteal Phase (Days 16–28):** PMS prediction and preparation. Self-care content and symptom management. Product pre-ordering for upcoming period. "Your period is expected in 5 days — your essentials are ready." Warmer, softer UI tones.

---

## 8. API & Data Model

### On-Device Data Model (Core)

```
CycleEntry {
  id: UUID
  startDate: Date
  endDate: Date?
  cycleLength: Int?  // computed
}

DailyLog {
  id: UUID
  date: Date
  flowIntensity: enum (none, light, medium, heavy, super)
  symptoms: [SymptomEntry]
  mood: enum?
  notes: String? (encrypted)
}

SymptomEntry {
  type: SymptomType (predefined + custom)
  severity: Int (1–5)
}

CyclePrediction {
  nextPeriodDate: DateRange  // range, not single date
  currentPhase: CyclePhase
  confidenceLevel: Float
  ovulationWindow: DateRange? (opt-in)
}

UserPreferences {
  notificationsEnabled: { [category]: Bool }
  discreetMode: Bool
  phaseTheming: Bool
  darkMode: enum (system, light, dark)
  widgetConfig: WidgetConfig
}
```

### Server-Side Data Model (Commerce Only)

```
Account {
  id: UUID
  email: String
  shippingAddresses: [Address]
  paymentMethods: [PaymentMethodRef]  // tokenized, never stored raw
}

Order {
  id: UUID
  accountId: UUID
  items: [OrderItem]
  total: Decimal
  currency: String
  status: enum
  shippingAddress: Address
  createdAt: DateTime
}

Subscription {
  id: UUID
  accountId: UUID
  items: [SubscriptionItem]
  frequency: enum (cycle-synced, monthly, custom)
  nextDeliveryDate: Date
  status: enum (active, paused, cancelled)
  pausedUntil: Date?
}
```

### API Endpoints (Commerce)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/accounts` | Create account |
| GET | `/api/v1/products?market={code}` | List products by market |
| POST | `/api/v1/orders` | Place order |
| GET | `/api/v1/orders` | Order history |
| POST | `/api/v1/subscriptions` | Create subscription |
| PATCH | `/api/v1/subscriptions/{id}` | Update/pause/cancel subscription |
| GET | `/api/v1/subscriptions/{id}` | Get subscription details |

### AI Health Assistant Architecture

- On-device inference using a fine-tuned small language model (e.g., quantized model optimized for menstrual health Q&A)
- Model receives cycle data from local storage as context — never transmitted
- Fallback: if on-device model is insufficient, queries can be sent to a server-side model with **no user health data attached** — only the question text, stripped of PII
- Pre-built response library for common questions as offline fallback

### Backward Compatibility

- N/A for v1 (greenfield)
- Data export format should use an open standard to avoid future portability issues

---

## 9. Business Model & Competitive Moats

### Value Alignment

The core strength of this concept is that **user value and business value are aligned**, not in tension:

| User Value | Business Value |
|------------|---------------|
| Accurate cycle predictions | Predictable product demand forecasting |
| Product recommendations by flow intensity | Higher conversion, lower return rates |
| Subscription convenience | Recurring revenue, reduced churn |
| Health education | Brand authority, trust, engagement |
| AI health assistant | Differentiation, lock-in, product discovery |
| Privacy-first architecture | Competitive moat against Flo/Clue |

### Revenue Streams

**Primary — Product Commerce:** Direct product sales through in-app shop, cycle-synced subscription boxes, personalized product bundles based on tracking data.

**Secondary — Premium Features:** AI health assistant (deeper analysis), advanced analytics/reports, partner sharing features, wearable integrations.

**Tertiary — Data Insights (Aggregated, Anonymized):** Product development insights from aggregated usage patterns, market research on menstrual product needs, clinical research partnerships (with explicit consent only).

### Revenue Model (Illustrative)

Average menstrual product spend: ~€100–120/year per person. The subscription e-commerce market is growing at 59.5% CAGR. Menstrual products are a near-perfect subscription category: predictable recurring need, product selection varies by cycle phase, forgetting to buy is a real pain point, and cycle data makes timing precise (not generic 30-day boxes).

If 5% of app users convert to subscribers: with 1M users = 50,000 subscribers at ~€8/month average = €4.8M ARR. With 5M users = €24M ARR potential from subscriptions alone.

### Adjacent Revenue Opportunities

Cycle-synced product bundles ("Your Follicular Phase Kit"), seasonal/occasion packs ("Festival kit," "Travel pack," "First period starter kit" for teens/parents), wellness product expansion (heating pads, pain relief, cycle-phase-aware skincare, supplements — each justified by cycle data), partner API for wearable brands (positions Libresse as the cycle data platform), and anonymized B2B health insights for medical research (explicit opt-in only).

### Competitive Moats

| Moat | Description |
|------|-------------|
| Brand trust | A real product company with physical products users already trust |
| Data-commerce loop | Tracking data makes commerce better → commerce data makes tracking better |
| Privacy architecture | On-device processing is genuinely hard to replicate and easy to market |
| Product expertise | No tech company can credibly recommend menstrual products |
| Existing distribution | Retail presence means the app extends a relationship, not starts one |

### Commerce UX Principle: Anticipate, Don't Advertise

The commerce experience should feel like a **service, not a store.** Auto-detect when the user might need products based on cycle prediction. "Your period starts in ~3 days. Your usual order would arrive by then. Confirm?" — one tap. Track actual product usage to refine recommendations. Show cost comparisons: "You're currently spending ~€X/month. A subscription would save you €Y."

---

## 10. Dependencies & Integrations

| Dependency | Team/Service | Status | Risk |
|------------|-------------|--------|------|
| On-device ML runtime (Core ML / TFLite) | Engineering | To evaluate | Medium — model size and device compatibility constraints |
| Apple HealthKit / Google Health Connect | Platform APIs | Available | Low — well-documented APIs, user opt-in required |
| Payment processing (Stripe/Adyen) | Payments team | To select | Low — mature providers |
| Libresse product catalog API | Essity commerce team | TBD | High — dependency on Essity internal systems; availability and format unknown |
| Shipping/fulfillment integration | Essity logistics | TBD | High — delivery SLAs, market-specific logistics |
| Push notification service (APNs/FCM) | Engineering | Available | Low |
| App Store / Play Store approval | Platform review | Required | Medium — health app category has stricter review; AI health claims need careful positioning |
| GDPR/legal review | Legal team | Required | Medium — AI health assistant responses may trigger EU MDR classification |
| Localization vendor | External | To select | Low |

---

## 11. Out of Scope

- **Fertility/conception mode** — V1 does not include trying-to-conceive features. This avoids heteronormative assumptions and reduces regulatory complexity.
- **Community/social features** — No forums, comments, or user-generated content in V1. Explore post-launch based on demand.
- **Partner sharing** — No "share with partner" feature in V1. Requires careful privacy design; deferred.
- **Condition-specific modes** (PCOS, endo, PMDD) — V1 uses a general model. Condition-specific features are a V2 priority based on user demand data.
- **Contraceptive efficacy claims** — The app does NOT position itself as a contraceptive tool. No FDA/CE marking pursued for V1.
- **Android Wear / Apple Watch app** — Widget only for V1. Wearable companion app deferred.
- **Clinical integrations** — No EHR/doctor portal integration. Doctor-ready export is a PDF, not a live integration.
- **Non-Libresse product sales** — Shop only carries Libresse (Essity) products. No third-party marketplace.
- **Advertising of any kind** — No ads, ever. This is a core brand promise.

---

## 12. Open Questions

| # | Question | Owner | Due Date | Resolution |
|---|----------|-------|----------|------------|
| 1 | Is on-device AI feasible for the Health Assistant at acceptable quality, or do we need a hybrid approach (on-device + privacy-preserving server calls)? | Engineering Lead | Prototype phase | — |
| 2 | What is the regulatory classification of the AI Health Assistant under EU MDR? Does it qualify as a medical device? | Legal | Before MVP | — |
| 3 | What is the availability and format of the Libresse product catalog API from Essity's existing commerce infrastructure? | Essity Commerce | Prototype phase | — |
| 4 | Which markets launch first? Does product availability vary by market? | Essity Product Team | Before MVP | — |
| 5 | What is the fulfillment model — Essity direct, or third-party logistics per market? | Essity Logistics | Before MVP | — |
| 6 | Should the free tier include a limited number of AI assistant queries per month, or should AI be fully premium? | Product + Business | Before MVP | — |
| 7 | What is the minimum device spec for on-device ML? How do we handle older devices? | Engineering Lead | Prototype phase | — |
| 8 | How do we handle the "H4 — Privacy as a visible product feature" hypothesis, which is referenced in the brief's validation table but not described in the hypothesis section? | Product | Prototype phase | — |
| 9 | What happens to cycle data if a user creates a commerce account and later deletes it? Need clear data separation architecture. | Engineering + Legal | Before MVP | — |
| 10 | Will the app support data import from Flo/Clue/Apple Health to reduce switching friction? | Engineering | V1 or V2 decision | — |

---

## 13. Rollout Plan

### Phase 0: Prototype (Current)
- Build working prototype covering 4 core screens (Home, My Cycle, Shop, Health Assistant)
- Validate hypotheses H1–H5 through moderated testing
- **Go/no-go criteria:** ≥3 of 5 hypotheses validated or partially validated with clear path forward

### Phase 1: Closed Beta (Post-prototype, ~Q3 2026)
- Feature-flagged release to 500–1,000 Loyal Libresse Customers in 1 market (Sweden or Netherlands)
- Core tracking + Shop + basic AI assistant
- Commerce integration live (real orders)
- **Go/no-go criteria:** DAU/MAU ≥20%, NPS ≥40, no P0 bugs, commerce conversion ≥3%

### Phase 2: Open Beta (Q4 2026)
- Expand to 3 markets
- Full AI assistant
- Widget release
- Subscription feature live
- **Go/no-go criteria:** 10K+ MAU, app store rating ≥4.5, subscription adoption ≥10% of purchasers

### Phase 3: General Availability (Q1 2027)
- All initial launch markets (UK, SE, NL, DE, FR)
- Full feature set
- Marketing push aligned with Libresse brand campaigns
- In-app announcement, CSM talking points, press coverage

### Rollback Plan
- Feature flags on all major features (AI assistant, commerce, subscription, auto-replenishment)
- Any feature can be disabled server-side without app update
- Commerce: pause new subscriptions or orders within 1 hour if fulfillment issues detected
- AI assistant: fallback to pre-built response library if model issues arise
- Full app rollback via app store if critical issue (24–48hr review delay for iOS)

### Communication Plan
- Pre-launch: Libresse social media teaser campaign, CSM outreach to loyal customers
- Launch: App store listing, press release, in-store QR codes on product packaging
- Ongoing: Changelog in-app, email updates for account holders, CSM talking points per release

---

## 14. Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| On-device AI quality insufficient for health queries | Medium | High | Hybrid architecture as fallback; pre-built response library; clearly scope assistant to menstrual health only. Context: Woebot (leading AI therapy app) shut down June 2025; FDA is actively regulating AI health devices; Illinois banned AI from making independent therapeutic decisions. An assistant that is narrow and expert (menstrual health only) is more trustworthy than general-purpose AI. |
| EU MDR classification triggers medical device regulation | Medium | High | Early legal review; position assistant as "educational wellness" not "diagnostic"; never use diagnostic language |
| Essity product catalog/fulfillment integration delays | High | High | Build Shop with mock data for prototype; decouple tracking from commerce so app has standalone value |
| Low commerce conversion — users want tracking but not shopping | Medium | Medium | Ensure standalone tracking value is excellent; commerce is additive, not required; validate willingness in prototype |
| Privacy claim scrutiny (press, security researchers) | Medium | High | Independent security audit pre-launch; open-source privacy-critical components; bug bounty program |
| App store rejection (health claims, AI health guidance) | Low | High | Pre-submission consultation with Apple/Google; conservative health language; medical disclaimers |
| User distrust — "a brand trying to sell me stuff" | Medium | Medium | Lead with free, excellent tracking; commerce is opt-in and genuinely helpful; no paywall on core features |
| Competitor response (Flo/Clue add privacy features) | High | Low | Privacy-by-architecture (on-device) is structurally different from privacy-by-policy; brand trust is the moat |
| Subscription fatigue — Gen Z resists another subscription | Medium | Medium | Free tier must be genuinely excellent; subscription = convenience, not access; easy cancel |
| Irregular cycle users get inaccurate predictions | High | Medium | Use confidence ranges, not point estimates; adapt algorithm within 3 cycles; show uncertainty honestly |

---

## 15. Hypotheses Validation Framework

The prototype must test these hypotheses (from the project brief). UX research confidence assessments are included.

| Hypothesis | What to Build | How to Validate | Success Signal | Research Confidence |
|------------|--------------|-----------------|----------------|---------------------|
| **H1** — App designed around cycle rhythm | Phase-aware home screen, adaptive UI, phase-specific content | 5-second comprehension test; post-task comparison to calendar-based tracker | ≥80% immediately understand their phase; ≥70% prefer phase-based over calendar-based | **STRONG YES** — Users explicitly want phase-aware experiences; no major competitor does this well; Gen Z expects personalization as baseline |
| **H2** — Understanding the body, not just tracking | AI health assistant with cycle-context answers | Moderated task: ask 3 health questions, rate usefulness | ≥70% rate responses as useful; ≥60% say "I learned something I didn't know" | **STRONG YES** — The #1 unmet need is "why do I feel like this?"; 84% of women feel unheard in healthcare; current apps collect data but deliver minimal intelligence |
| **H3** — Cost tracking and product management | Spend dashboard, subscription value comparison | Show spend data; measure reaction (useful vs. anxiety); subscription intent | ≥65% find it useful; ≥30% express subscription interest | **YES** — Product cost tracking is a feature NO major competitor offers; ~€100–120/year expense feels invisible but adds up; frequently discussed on Reddit |
| **H4** — Privacy as visible product feature | On-screen privacy indicator, privacy detail screen, no-account usage | Recall test: can users articulate data protections after 1 min? | ≥75% can articulate; privacy cited as top-3 reason to use in exit survey | **STRONG YES** — 35% of Gen Z stopped using a service due to privacy concerns (highest of any generation); 70–75% opt out of cross-app tracking; post-Dobbs fears are well-documented |
| **H5** — Automated product replenishment | Pre-period order prompt, auto-replenishment preview | Task: review and confirm a pre-built order; rate helpful vs. presumptuous | ≥60% find it helpful; ≥40% would enable auto-replenishment | **YES** — "Running out mid-cycle" is a universally recognized pain point; Gen Z prefers convenience and automation; the key is user control (automation as an offer, not a default) |

---

## 16. Appendix

### Reference Materials

- **Project Brief:** `design/Libresse App Project Brief.docx` — Workshop brief by umain, March 2026
- **UX Research:** `design/UX-Research-Libresse-App.md` — Deep research on target audience, competitive landscape, pain points, and ideation
- **Competitive Intelligence:** Flo (380M+ downloads, FTC action + $56M class action), Clue (50M+, paywall backlash), Natural Cycles (FDA-cleared, $99.99/yr), Apple Health (best privacy, limited features), Ovia (15M+, employer-subsidized), Stardust (5M+, privacy claims debunked)
- **Market Data:** Femtech market $34B–63B (2025, varies by scope), menstrual health apps $2.49B (2026) → $13.11B (2035) at 20.28% CAGR

### Competitive Landscape (Detailed)

| App | Downloads | Pricing | Strengths | Critical Weakness |
|-----|-----------|---------|-----------|-------------------|
| **Flo** | 380M+ | Freemium ($49.99/yr) | Feature-rich, large community, brand recognition | Privacy trust destroyed (FTC action + $56M class action), aggressive paywalls |
| **Clue** | 50M+ | Freemium ($29.99–39.99/yr) | Science-first, cleaner design, GDPR-compliant | Paywall frustration, overly clinical feel, financial struggles |
| **Natural Cycles** | 10M+ | $99.99/yr | FDA-cleared contraceptive, temperature-based | Expensive, high-discipline requirement, ~7% failure rate |
| **Apple Health** | Built-in | Free | Best privacy architecture, clean, no ads | Extremely limited features, basic predictions, iOS only |
| **Ovia** | 15M+ | Free (employer-subsidized) | No user cost | Employers may access reproductive health data |
| **Stardust** | 5M+ | Freemium | Post-Dobbs privacy marketing | Privacy claims debunked by security researchers |

### Key Research Findings (Comprehensive)

**Privacy & Trust:**
- 25–30% of women considered deleting period apps post-Dobbs
- 60–65% of Gen Z concerned about how companies use data (Morning Consult 2024)
- 52% of Gen Z anxious about online privacy (Experian 2025)
- 35% of Gen Z have stopped using a service due to privacy concerns — highest of any generation
- 70–75% opt out of cross-app tracking (ATT)
- 88% willing to share data if experience improves — but only 34% accept data sharing for marketing
- 61% accept data sharing for healthcare purposes
- 30–40% of Gen Z use VPNs

**Engagement & Behavior:**
- Gen Z daily screen time: ~4.5 hours on smartphone, 80–100+ phone unlocks per day
- Usage pattern: short "snacking" sessions, not long blocks
- Peak hours: midday (11am–1pm) and heavy evening (8pm–midnight)
- 40–50% of Gen Z have turned off notifications for most apps
- 50–60% have uninstalled an app because of annoying notifications
- 50–60% of Gen Z use at least one home screen widget; 25–35% use three or more

**Subscription & Commerce:**
- ~50% of Gen Z feel they're paying for too many subscriptions (Deloitte 2024)
- Average Gen Z user has 3–5 paid subscriptions
- 60–65% prefer free, ad-supported apps over paid
- Free trials that auto-convert are deeply mistrusted
- Subscription e-commerce market growing at 59.5% CAGR
- Average menstrual product spend: ~€100–120/year per person

**Design & Personalization:**
- 84% of women feel "unheard" in healthcare settings
- 71% of Gen Z expect personalization as baseline (McKinsey)
- 70–80% of Gen Z prefer dark mode
- Bottom navigation bars strongly preferred over hamburger menus
- Speed is the #1 UX factor — perceived lag is a dealbreaker
- The #1 unmet need is "why do I feel like this?" not "when is my next period?"

**Market:**
- Global femtech market (2025): $34B–63B depending on scope definition
- Menstrual health apps market (2026): $2.49B → projected $13.11B by 2035 (20.28% CAGR)
- Only 4% of healthcare R&D addresses women's health directly
- 61% of American adults used AI in H1 2025; OpenAI launched ChatGPT Health in January 2026

### UX Research Sources

**Live Web Research (March 2026):**
- Bearable: Best Period Tracker Apps 2025
- CycleSynced: 11 Apps Compared
- FTC: Flo Health Settlement (2021)
- MobiHealthNews: Flo FTC Settlement
- Freshcode: Femtech Market Overview
- BodySpec: Femtech Market Size & Trends 2025–2026
- Yahoo Finance: FemTech Market Projected $266.99B by 2035
- GlobeNewsWire: Menstrual Health Apps 20.28% CAGR
- Experian: Gen Z Privacy Anxiety
- TechPolicy Press: Gen Z Privacy Preferences
- Usercentrics: Gen Z Wants Transparency
- UW News: Period Apps Failing Users
- Fortune: OpenAI ChatGPT Health Launch

**Training Knowledge Sources:**
- Pew Research Center, eMarketer/Insider Intelligence, data.ai, Morning Consult, Deloitte, McKinsey, YPulse
- Wall Street Journal, Washington Post, The Verge, TechCrunch: Femtech coverage
- EFF, Mozilla Foundation: Period tracker privacy analyses
- Reddit: r/periods, r/TwoXChromosomes, r/birthcontrol, r/PCOS, r/endometriosis, r/privacy
