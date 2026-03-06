# Design Specification — Libresse App

**Version:** 1.0 | **Date:** 2026-03-06 | **Author:** Design Team
**Prerequisites:** [Project Summary](../pm/summary.md) · [PRD](../pm/prd.md)

---

## 1. Design Principles

1. **Cycle-first, not calendar-first.** Every screen adapts to where the user is in their cycle. The four phases (menstrual, follicular, ovulatory, luteal) define the visual rhythm of the app.
2. **Privacy you can see.** On-device processing isn't a footnote — it's visible in the UI. Users should feel their data is safe without reading a policy.
3. **Helpful, not transactional.** Commerce is surfaced in context, never pushed. Product recommendations feel like advice from a knowledgeable friend.
4. **Body-literate.** The app treats users as adults. Plain language, no euphemisms, medically grounded information.
5. **Calm and warm.** The visual language should feel calming, not clinical. Soft gradients, organic shapes, generous whitespace.

---

## 2. Screen Inventory

| # | Screen | Section | Purpose | Validates |
|---|--------|---------|---------|-----------|
| 1 | Home Dashboard | Home | At-a-glance cycle status, upcoming expectations, nudges | H1 |
| 2 | Cycle Detail | My Cycle | Full cycle view with phase breakdown and history | H1 |
| 3 | Daily Log | My Cycle | Quick symptom/mood/flow/pain entry | H1, H2 |
| 4 | Cycle History | My Cycle | Past cycles, trends, predictions | H1, H2 |
| 5 | Health Assistant Chat | Health Assistant | Conversational AI for health questions | H2 |
| 6 | Insight Card (expanded) | Health Assistant | Deep-dive on a specific health topic | H2 |
| 7 | Shop Browse | Shop | Product catalog with cycle-phase context | H3 |
| 8 | Product Detail | Shop | Single product with description, reviews, subscribe option | H3, H5 |
| 9 | Subscription Manager | Shop | Active subscriptions, next delivery, cost overview | H3, H5 |
| 10 | Cart & Checkout | Shop | Purchase flow | H3 |
| 11 | Onboarding (3 screens) | Global | First launch: cycle basics, privacy explainer, initial setup | H4 |
| 12 | Settings / Privacy | Global | Data controls, export, delete — privacy as a feature | H4 |
| 13 | Tab Bar / Navigation | Global | Persistent bottom nav: Home, My Cycle, Shop, Assistant | — |

---

## 3. User Flows

### 3.1 First Launch (Onboarding)

```
App Open → Welcome Screen → "How we handle your data" (privacy explainer)
→ Cycle Setup (last period date, typical length) → Home Dashboard
```

**States:** New user only. Skippable after first completion. Cycle setup can be skipped ("I'll set this up later") with graceful degradation on Home.

### 3.2 Daily Check-in (Happy Path)

```
Open App → Home Dashboard (shows cycle day, phase, what to expect)
→ Tap "Log today" → Daily Log screen
→ Select mood, symptoms, flow level → Confirm
→ Return to Home (updated with today's entry)
```

**Error path:** If no cycle data yet → prompt to set up cycle from Home.
**Edge case:** User logs multiple times in a day → entries merge, most recent values win.

### 3.3 Ask the Health Assistant

```
Home Dashboard → Tap "Health Assistant" tab
→ Chat screen with suggested prompts ("Why do I feel bloated?", "Is this normal?")
→ Type or tap a question → AI responds in plain language
→ Response may include a product suggestion (inline, non-intrusive)
→ Tap product → Product Detail screen
```

**Error path:** AI can't answer → "I'm not sure about that. Here's what I do know…" with links to trusted sources.
**Edge case:** User asks something medical/urgent → clear disclaimer + suggest consulting a doctor.

### 3.4 Browse & Buy Products

```
Tap "Shop" tab → Shop Browse (filtered by current cycle phase by default)
→ Browse or search → Tap product → Product Detail
→ "Add to cart" or "Subscribe & save" → Cart & Checkout
→ Confirm payment → Order confirmation
```

**Error path:** Payment fails → clear error, retry option, no data lost from cart.
**Edge case:** User in unknown cycle phase → show all products, no phase filter applied.

### 3.5 Manage Subscription

```
Shop tab → "My Subscriptions" link (or via Settings)
→ Subscription Manager: list of active plans, next delivery dates, monthly cost
→ Tap subscription → Edit frequency, pause, or cancel
→ Confirm changes → Updated view
```

**Edge case:** No active subscriptions → empty state with "Start a subscription" CTA linking to Shop.

### 3.6 Review Privacy Controls

```
Settings → Privacy & Data
→ See what's stored on-device, what (if anything) is synced
→ Options: Export my data, Delete all data, Manage permissions
→ Confirm action → Success feedback
```

**Edge case:** Delete all data → double confirmation ("This will erase your cycle history. This cannot be undone.").

---

## 4. Screen Specifications

### 4.1 Home Dashboard

**Layout:** Single scrollable column.

| Component | Description | State Variations |
|-----------|-------------|-----------------|
| Cycle Ring | Circular progress showing current day in cycle, coloured by phase | **Empty:** No cycle data → "Set up your cycle" CTA. **Active:** Shows day X of Y. **Prediction:** Upcoming period shown as dashed segment. |
| Phase Banner | Current phase name + short description ("Luteal phase — you might feel more tired") | Changes per phase. Adapts tone and colour. |
| Today's Nudge | One contextual card — could be health tip, product suggestion, or log reminder | **Logged:** "You logged today ✓". **Not logged:** "How are you feeling?". **Product:** "Your flow might start soon — stocked up?" |
| Quick Log Button | Floating or prominent CTA to open Daily Log | Always visible. Badge if not logged today. |
| Upcoming | 3-day forecast strip showing expected symptoms/phase transitions | **Loading:** Skeleton. **No data:** "Log a few cycles for predictions." |

**Visual notes:** Background colour subtly shifts by cycle phase. Warm terracotta (menstrual), soft green (follicular), golden (ovulatory), muted lavender (luteal).

### 4.2 Daily Log

**Layout:** Full-screen modal or pushed screen.

| Component | Description | State Variations |
|-----------|-------------|-----------------|
| Flow Selector | 5-level scale (none → heavy) with visual indicators | Default: none selected. Selected state highlighted. |
| Mood Picker | Grid of mood options (calm, anxious, happy, irritable, etc.) | Multi-select allowed. Selected items highlighted. |
| Symptom Tags | Scrollable tag chips (cramps, headache, bloating, fatigue, acne, etc.) | Multi-select. Most common tags shown first (personalised over time). |
| Pain Scale | Slider or segmented control (0–10) | Default: 0. Only shows if user taps "Add pain level." |
| Notes Field | Optional free-text field | Collapsed by default. Expands on tap. |
| Save Button | Confirms entry | **Disabled** until at least one field has input. **Active** after input. |

**Interaction:** Each selector provides haptic feedback on selection. Save triggers a brief success animation and returns to Home.

### 4.3 Cycle Detail & History

**Layout:** Horizontal scrollable timeline at top, detail cards below.

| Component | Description | State Variations |
|-----------|-------------|-----------------|
| Phase Timeline | Horizontal bar divided into four coloured phases with current day marker | Scrollable to past cycles. Tap a day to see that day's log. |
| Cycle Stats | Avg cycle length, avg period length, cycle regularity score | **Insufficient data:** "We need 3+ cycles for predictions." **Sufficient:** Shows stats. |
| Trend Cards | Symptom frequency over past N cycles (e.g., "Headaches tend to appear in your luteal phase") | Only shown after 2+ cycles logged. |
| Period Prediction | Estimated next period start with confidence indicator | **High confidence** (3+ regular cycles). **Low confidence** (< 3 cycles or irregular). |

### 4.4 Health Assistant Chat

**Layout:** Standard chat interface with branded styling.

| Component | Description | State Variations |
|-----------|-------------|-----------------|
| Suggested Prompts | 3-4 contextual question chips based on current cycle phase | Change per phase. Disappear after first user message in session. |
| User Message | Right-aligned bubble | Standard input with send button. |
| AI Response | Left-aligned bubble with Libresse assistant avatar | **Typing:** Animated dots. **Response:** Text with optional inline product card. **Error:** Fallback message. |
| Product Card (inline) | Small embedded card within AI response linking to a product | Tap → Product Detail. Clearly labelled "Suggested product." Non-intrusive. |
| Disclaimer Banner | Persistent subtle footer | "For informational purposes. Not medical advice." |

**Interaction:** Typing indicator while AI processes. Responses stream in (not all-at-once). Conversation persists within session, clears on app restart.

### 4.5 Shop Browse

**Layout:** Grid with filter bar.

| Component | Description | State Variations |
|-----------|-------------|-----------------|
| Phase Filter | Horizontal pill selector: All, Menstrual, Follicular, Ovulatory, Luteal | Default: current phase selected. "All" always available. |
| Product Cards | Image, name, short description, price, "Subscribe" badge if available | **In stock.** **Low stock** (badge). **Out of stock** (greyed, "Notify me"). |
| Search Bar | Collapsible search at top | Expands on tap. Filters in real-time. |
| Cart Badge | On tab bar Shop icon | Shows item count. Hidden when empty. |

### 4.6 Subscription Manager

**Layout:** Card list.

| Component | Description | State Variations |
|-----------|-------------|-----------------|
| Subscription Card | Product image, name, frequency, next delivery date, price | **Active.** **Paused** (muted styling + "Resume" CTA). **Expiring** (warning badge). |
| Monthly Cost Summary | Total monthly spend across all subscriptions | Updates dynamically as subscriptions change. |
| Edit Controls | Change frequency, skip next delivery, pause, cancel | Cancel requires confirmation step. |
| Empty State | Illustration + "No subscriptions yet" | Links to Shop Browse with "Find products" CTA. |

---

## 5. Component Library (Key Components)

| Component | Used In | Props/Variants |
|-----------|---------|---------------|
| CycleRing | Home | size: sm/lg · phase: menstrual/follicular/ovulatory/luteal · progress: 0-1 |
| PhaseIndicator | Home, Cycle Detail, Shop | phase · label: bool · colour: auto |
| LogButton | Home, Daily Log | state: idle/active/completed · badge: bool |
| MoodChip | Daily Log | mood: string · selected: bool |
| SymptomTag | Daily Log | label: string · selected: bool · frequency: low/med/high |
| ProductCard | Shop, AI Chat | product · variant: grid/inline · subscribable: bool · stock: in/low/out |
| SubscriptionCard | Subscription Manager | subscription · state: active/paused/expiring |
| ChatBubble | Health Assistant | sender: user/ai · content · hasProductCard: bool |
| PhaseFilter | Shop, Cycle Detail | phases[] · selected · onSelect |
| PrivacyBadge | Onboarding, Settings | style: prominent/subtle |
| NudgeCard | Home | type: health/product/log · content · action |
| EmptyState | All screens | illustration · title · description · cta |

---

## 6. State Definitions (Global)

| State | Trigger | UI Behaviour |
|-------|---------|-------------|
| **No Cycle Data** | First launch or data deleted | Home shows setup CTA. Cycle Detail shows onboarding prompt. Shop shows all products (no phase filter). |
| **Insufficient History** | < 3 cycles logged | Predictions show low-confidence badge. Trend cards hidden. "Keep logging" encouragement. |
| **Active Tracking** | 3+ cycles logged | Full predictions, trends, personalised nudges, phase-filtered shop. |
| **Loading** | Any data fetch | Skeleton placeholders matching component shapes. No spinners. |
| **Error** | Network/AI failure | Inline error message with retry. Never a full-screen error for non-blocking failures. |
| **Offline** | No network | All tracking works offline (on-device). Shop shows cached products with "Offline" badge. AI Assistant shows "You're offline" with option to queue question. |

---

## 7. Hypothesis → Screen Mapping

| Hypothesis | Primary Screen(s) | What the Design Must Prove |
|------------|-------------------|---------------------------|
| **H1** — Cycle-rhythm design | Home Dashboard, Cycle Detail, Phase Timeline | The UI is structured around four phases, not a calendar grid. Phase colours, language, and nudges adapt. |
| **H2** — Understand, not just track | Health Assistant Chat, Insight Cards, Daily Log | Users can ask "why" questions and get contextual answers. The AI feels knowledgeable and grounded. |
| **H3** — Cost & product management | Shop Browse, Subscription Manager, Monthly Cost Summary | Users can see their spend, manage subscriptions, and feel in control of recurring costs. |
| **H4** — Privacy as visible feature | Onboarding, Settings/Privacy, PrivacyBadge component | Privacy is shown, not buried. Users can see, export, and delete their data in ≤ 2 taps. |
| **H5** — Automated reordering | Subscription Manager, NudgeCard (product type), Cart | The app anticipates needs based on cycle predictions and purchase history. Reorder suggestions feel helpful. |

---

## 8. Navigation Structure

```
Tab Bar (persistent bottom)
├── Home          → Home Dashboard
├── My Cycle      → Cycle Detail → Daily Log (modal)
│                                → Cycle History
├── Shop          → Shop Browse → Product Detail → Cart & Checkout
│                              → Subscription Manager
└── Assistant     → Health Assistant Chat → Insight Card (push)
```

Settings accessible from Home (profile icon, top-right).
Onboarding is a one-time flow before the tab bar appears.

---

## 9. Visual Direction (Notes for Design)

- **Colour system:** Phase-driven palette. Warm terracotta (menstrual), fresh green (follicular), golden amber (ovulatory), soft lavender (luteal). Neutral background with phase colour as accent.
- **Typography:** Rounded, friendly sans-serif. Two weights: regular for body, semibold for headings. Large, legible sizes (minimum 16px body).
- **Shapes:** Organic, rounded corners (12–16px radius). Circular motifs (cycle ring, mood picker). Avoid harsh edges.
- **Illustrations:** Inclusive, body-positive, abstract enough to feel universal. Used in empty states and onboarding.
- **Motion:** Gentle transitions between phases. Haptic feedback on logging. No aggressive animations.
- **Dark mode:** Planned for v2. Design with sufficient contrast ratios that dark mode adaptation is straightforward.

---

## 10. Open Design Questions

1. Should the Cycle Ring on Home animate phase transitions when opened, or be static?
2. How prominent should product suggestions be inside AI chat responses — inline card vs. post-response suggestion?
3. Do we show a "cycle score" or "regularity index" on Home, or is that too clinical?
4. Subscription nudge timing — should the app proactively notify before estimated period, or only show in-app?
5. How do we handle the Health Assistant for users under 18 — same experience, or age-gated responses?
