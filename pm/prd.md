# Product Requirements Document — Libresse App

**Prepared by:** umain | **Date:** March 2026 | **Status:** Draft v2
**Research inputs:** UX-Research-Libresse-App.md, ui-inspiration-libresse.md, brand-research-libresse.md

---

## 1. Executive Summary

Libresse aims to launch a privacy-first mobile app that bridges cycle health tracking with contextual product commerce. The app targets women aged 16–25 who value simplicity, privacy, and education over daily logging demands. It enters a market where the leader (Flo, 380M+ downloads) has destroyed trust through a $56M FTC privacy fine, and the #2 (Clue) has frustrated users by paywalling core features. Libresse's unique position: a trusted consumer brand with no data-monetization incentive, genuine product expertise, and the ability to close the loop from tracking to purchasing — something no competitor offers.

The design philosophy is **"Log less, learn more"** — minimal manual input, maximum educational value. The AI Health Assistant is the primary engagement driver, not a symptom journal. The app adapts visually to the four cycle phases (terracotta/green/golden/lavender), creating an experience that feels different each week — a differentiator no competitor has attempted. The app has four main sections: **Home, My Cycle, Shop, Health Assistant.**

## 2. Target Users

| Persona | Age | Key Trait | Primary Need |
|---------|-----|-----------|--------------|
| The Everyday User | 16–25 | Privacy-conscious, subscription-fatigued, expects personalization | Trustworthy cycle tracking that respects their time; answers to "why do I feel like this?"; easy commerce when needed |
| The Loyal Libresse Customer | Any | Existing brand relationship | Value-driven subscription, seamless reordering, cycle-aware product guidance |

### 2.1 Audience Behavioral Context (16–25 age group)

Research-backed traits that inform design decisions:

- **Phone usage:** ~4.5 hours/day, 80–100 unlocks, short "snacking" sessions — not long blocks
- **Notification hostility:** 40–50% have turned off notifications for most apps; 50–60% have uninstalled an app because of annoying notifications
- **Subscription fatigue:** ~50% feel they're paying for too many subscriptions; 60–65% prefer free, ad-supported over paid; free trials that auto-convert are deeply mistrusted
- **Privacy paradox:** 88% willing to share data if experience improves, but 70–75% opt out of cross-app tracking; post-Dobbs, 25–30% of women deleted or considered deleting period apps
- **Widget usage:** 50–60% use at least one home screen widget; health/fitness widgets ranked #4 most popular — the widget may be a more important daily touchpoint than the app itself
- **Personalization:** 71% expect it as baseline (McKinsey). User-controlled preferred over invisible behavioral tracking
- **Aesthetic preferences:** "Warm minimalism" — clean layouts with personality, rounded corners, dark mode expected (70–80% prefer it), speed is the #1 UX factor

## 3. Hypotheses to Validate

- **H1:** The app can be designed around the rhythm of a cycle (four phases, not a generic calendar)
- **H2:** We can help users understand their body, not just track it (AI assistant + phone sensor data)
- **H3:** We can help users keep track of costs and manage product needs (cycle-linked consumption patterns)
- **H4:** Privacy as a visible product feature — on-device processing, no third-party SDKs, transparent data practices
- **H5:** Routine product reordering can be automated (cycle predictions + purchase history)

### 3.1 Research Validation

| Hypothesis | Finding | Confidence |
|------------|---------|------------|
| H1 | Users explicitly want phase-aware experiences; no competitor does this well | STRONG YES |
| H2 | The #1 unmet need is "why do I feel like this?" — not "when is my next period?" 84% of women feel unheard in healthcare | STRONG YES |
| H3 | Cost tracking is a feature NO competitor offers. Menstrual products cost ~€100–120/year — making the invisible visible creates a natural bridge to subscription | YES |
| H4 | Flo's $56M FTC fine is the defining trust breach. On-device + no data monetization = structural advantage | STRONG YES |
| H5 | "Running out mid-cycle" is a universal pain point. Cycle prediction + purchase history = accurate anticipation | YES |

## 4. Functional Requirements

The app has four main sections as defined in the original brief, plus cross-cutting concerns (widget, notifications, personalization) that support the four sections.

### 4.1 Home (Dashboard)

- **P0:** Show current cycle phase and day count with phase-adaptive visual design (terracotta/green/golden/lavender)
- **P0:** Display what to expect in the coming days — one primary insight, not a wall of data
- **P0:** Privacy badge visible — "Your data is on your device"
- **P1:** Contextual nudge card — phase-aware, connects to Health Assistant or Shop naturally
- **P1:** Quick-log entry point for flow intensity (1–2 taps, not a journal)

**Home Widget extension:**
- **P1:** Glanceable cycle status widget — "Day 14 · Follicular" with phase-color gradient
- **P1:** Discreet mode — user chooses what to display (critical for teens, shared devices)
- **P2:** Lock Screen widget (iOS 16+) and aesthetic customization options

### 4.2 My Cycle (Tracking)

- **P0:** View cycle history and predictions with cycle ring visualization (4-color phase system)
- **P0:** All processing on-device — offline-first, no account required for tracking
- **P1:** Optional symptom logging — chip-based quick-entry, minimal friction, not required
- **P1:** Phone sensor integration (steps, sleep) for passive insight without manual logging
- **P1:** Pattern recognition with actionable language — "Your headaches cluster around day 22–24" not just "You logged headaches 3 times"
- **P2:** Doctor-ready exportable report
- **P2:** Condition-specific modes (PCOS, endometriosis, PMDD) for users who need deeper tracking

### 4.3 Shop (Commerce)

- **P0:** Context-aware product recommendations tied to cycle phase — "Super for days 1–2, Regular for days 3–5"
- **P0:** Direct purchasing with subscription options — easy pause/cancel, no dark patterns
- **P1:** One-tap reorder of previous purchases
- **P1:** Smart subscription that adapts to actual cycle length (not generic 28-day boxes)
- **P1:** Cost tracking — "You've spent €94 this year. A subscription saves €22."
- **P2:** Seasonal/occasion packs and partner ordering (share product needs without sharing health data)

### 4.4 Health Assistant (AI)

- **P0:** Answer "why do I feel like this?" with evidence-based, phase-aware responses in plain language
- **P0:** Primary educational content driver — the reason users open the app
- **P0:** On-device AI processing — conversations never stored on a server
- **P1:** Symptom pattern recognition — "Your PMS symptoms are worsening — consider discussing PMDD with your doctor"
- **P1:** Surface relevant products naturally within responses
- **P1:** Know when to say "talk to your doctor" — never replace medical advice
- **P2:** Proactive phase-specific insights — "Your energy peaks next week — good time for that big presentation"

### 4.5 Cross-Cutting: Notifications & Personalization

**Notifications:**
- Default to OFF — opt-in only. Maximum 1/day, only when genuinely useful
- Acceptable: period prediction, pattern insights, shipment status
- Never: content promotion, guilt-tripping about inactivity, vague engagement teasers

**Personalization:**
- Phase-adaptive UI across all sections (terracotta/green/golden/lavender)
- Light/dark mode, functional customization (reorder cards, hide features)
- Inclusive language, identity settings (name, pronouns), discreet app icon options

## 5. Non-Functional Requirements

- **Privacy:** On-device processing for all health data. No account required for tracking. No data monetization. No third-party advertising SDKs. GDPR-compliant.
- **Performance:** App launch < 2s. Tracking input < 300ms. Skeleton screens over spinners. Speed is the #1 UX factor for this audience.
- **Accessibility:** WCAG 2.1 AA. Screen reader support. 44px minimum touch targets. Bottom tab navigation.
- **Platforms:** iOS first (widget/Lock Screen capabilities), Android to follow.
- **Localisation:** English first, then key EU markets (Sweden, Netherlands, France).
- **Offline-first:** Core tracking works entirely offline. Network required only for purchases and AI cloud features if needed.
- **Data portability:** Import from existing trackers. Export in standard format. No data held hostage.

## 6. Business Model

### 6.1 Core Principle: User Value = Business Value

| User Value | Business Value |
|------------|---------------|
| Accurate cycle predictions | Predictable product demand |
| Flow-based product recommendations | Higher conversion, lower returns |
| Subscription convenience | Recurring revenue |
| Health education | Brand authority, trust |
| Privacy-first architecture | Competitive moat |
| Cost tracking | Bridge to subscription conversion |

### 6.2 Pricing

- **Free:** Full cycle tracking, predictions, basic Health Assistant, widget. Must be genuinely excellent — a hard paywall would be catastrophic for 16–25 adoption.
- **Premium:** Advanced AI, condition-specific modes, detailed reports, wearable integrations.
- **Commerce:** Product sales and smart subscriptions. Revenue from products — the incentive that makes privacy credible.

## 7. Design Principles

Derived from brand research, UI competitive analysis, and UX research:

1. **Bold, not soft** — Cerise pink (#E31D94) is unoccupied in a market of purple (Flo), teal (Clue), green (NC), and dark (Oura). The brand is unapologetic; the app should be too.
2. **Phase-adaptive, not static** — The app changes with the user's cycle. No competitor does this. Strongest visual differentiator.
3. **Log less, learn more** — Education replaces journaling. 1–2 taps max. The Health Assistant is where time is spent, not a symptom diary.
4. **Commerce as service** — "Your flow starts in 3 days — stocked up?" not "Buy now." Anticipate, don't advertise.
5. **Privacy you can see** — "Your data never leaves your phone" on every screen. Stronger than Flo's Anonymous Mode.
6. **Warm minimalism** — Clean with personality. Rounded corners, whitespace, playful moments. Dark mode. Speed above all.
7. **Respectful engagement** — No guilt-tripping. No aggressive notifications. No subscription dark patterns. Widget as passive touchpoint.

## 8. Competitive Positioning

| Dimension | Clue | Flo | Natural Cycles | Libresse |
|-----------|------|-----|---------------|----------|
| Color | Neutral | Purple/lavender | Green/dark | **Bold cerise — unoccupied** |
| Dashboard | Circular wheel | Countdown | Green/red circle | **Phase-adaptive + one insight** |
| Data input | 100+ items | 70+ symptoms | Temp + optional | **1–2 taps, rest optional** |
| Revenue | Subscription paywall | Subscription paywall | Subscription + HW | **Product commerce** |
| Privacy | Badge | Anonymous Mode | EU clinical | **On-device, no account** |
| Unique | Gender-neutral | Symptom Checker | FDA-cleared | **Commerce + AI education** |
| Engagement | Daily logging | Daily logging | Morning ritual | **Open when relevant** |

## 9. Success Metrics

| Metric | Target | Rationale |
|--------|--------|-----------|
| Monthly active users | 50% of registered | Open when relevant, not daily |
| Health Assistant queries | 4+/month | Primary engagement driver |
| Widget daily glances | 60% of users | Passive engagement without app open |
| Symptom logging | 1–2 entries/cycle | Optional, minimal friction |
| Shop conversion | 8% click-through | Commerce as service |
| Subscription adoption | 15% at 6 months | Free tier must be excellent first |
| 3-month retention | 35% | Realistic for "when needed" usage |
| NPS | 50+ | Trust benchmark |

## 10. Open Questions for Prototype

1. Does the phase-adaptive UI feel genuinely different per phase, or is it a gimmick?
2. Can the Health Assistant answer real questions trustworthily — not like a chatbot?
3. Does cost tracking feel useful or anxiety-inducing for this age group?
4. Is the Shop tab perceived as a service or an ad?
5. How discreet does the widget need to be for teens and shared devices?
6. Does "no account required" reduce friction enough to justify the complexity?
7. What's the right balance between automation and control for replenishment?

---

## Research Sources

- **UX Research:** design/UX-Research-Libresse-App.md
- **UI Inspiration:** design/ui-inspiration-libresse.md
- **Brand Research:** design/brand-research-libresse.md
- **Design Spec:** design/design-spec.md
- **UI Moodboard:** design/ui-moodboard-libresse.pen
