# Jobs To Be Done — Libresse App MVP

**Date:** March 2026 | **Status:** Base for wireframes
**Inputs:** PRD v2, UX-Research-Libresse-App.md, ui-inspiration-libresse.md

---

## How to read this document

Each job follows the format:
**When** [situation/trigger] **I want to** [action/capability] **so I can** [desired outcome]

Priority: **MVP** = must be in first prototype, **Next** = second iteration
Each job maps to a section of the app and includes acceptance criteria for design validation.

---

## 1. HOME

### H1 — Glance at my cycle status
**When** I open the app (or glance at my widget) **I want to** instantly see what cycle day I'm on and what phase I'm in **so I can** orient myself without thinking.

| | |
|---|---|
| Priority | MVP |
| Trigger | App open, widget glance |
| Success | User identifies day + phase in under 2 seconds |
| Design criteria | Phase-adaptive color (terracotta/green/golden/lavender) visible immediately. Single hero element — cycle ring or day number. No reading required. |
| PRD link | 4.1 P0 |

### H2 — Know what to expect today
**When** I'm on the home screen **I want to** see one relevant insight about what's coming **so I can** feel prepared, not surprised.

| | |
|---|---|
| Priority | MVP |
| Trigger | Home screen load |
| Success | User reads a single contextual nudge and feels it's relevant to *them* |
| Design criteria | One nudge card, not a feed. Phase-aware copy: "Your period is expected in 2 days" or "Energy rising — good week ahead." Links to Health Assistant or Shop when relevant. |
| PRD link | 4.1 P0, P1 |

### H3 — Log my period start with minimum effort
**When** my period starts **I want to** tell the app in 1–2 taps **so I can** keep my predictions accurate without journaling.

| | |
|---|---|
| Priority | MVP |
| Trigger | Period onset (user-initiated) |
| Success | Period logged in under 5 seconds, no modal, no multi-step form |
| Design criteria | Persistent quick-log affordance on Home. Tap → select flow intensity (light/medium/heavy) → done. No mandatory fields beyond "period started." |
| PRD link | 4.1 P1 |

### H4 — Feel confident my data is private
**When** I see the app for the first time (and every time after) **I want to** see clear proof that my data stays on my phone **so I can** trust this app with sensitive health information.

| | |
|---|---|
| Priority | MVP |
| Trigger | Every app open |
| Success | User can point to the privacy indicator without being asked |
| Design criteria | PrivacyBadge visible on Home — always present, not dismissible. Plain language: "On your device only" or shield icon. Not buried in settings. |
| PRD link | 4.1 P0, H4 |

---

## 2. MY CYCLE

### C1 — See where I am in my cycle visually
**When** I go to My Cycle **I want to** see a visual representation of my full cycle with phases color-coded **so I can** understand the rhythm of my body at a glance.

| | |
|---|---|
| Priority | MVP |
| Trigger | Navigate to My Cycle tab |
| Success | User can identify current day, current phase, and days until next period from the visualization |
| Design criteria | Cycle ring with 4-color phase system (not just a calendar grid). Current day highlighted. Past days show logged data. Future days show predictions with confidence indication. |
| PRD link | 4.2 P0 |

### C2 — Review my cycle history
**When** I want to understand my patterns over time **I want to** scroll through past cycles **so I can** see if my cycles are regular, getting longer, or changing.

| | |
|---|---|
| Priority | MVP |
| Trigger | User scrolls/navigates to past cycles |
| Success | User can compare last 3+ cycles side by side or sequentially |
| Design criteria | Cycle length visible per cycle. Trend direction (shorter/longer/stable) indicated. Logged symptoms visible per cycle without opening each one. |
| PRD link | 4.2 P0 |

### C3 — Optionally log symptoms quickly
**When** I'm experiencing something notable (cramps, mood shift, headache) **I want to** log it in 1–2 taps **so I can** build a picture over time without it feeling like homework.

| | |
|---|---|
| Priority | MVP |
| Trigger | User-initiated, never prompted aggressively |
| Success | Symptom logged in under 10 seconds. User doesn't feel obligated to log daily. |
| Design criteria | Chip-based selection (inspired by Flo/NC). Pre-selected common symptoms. Optional — UI never guilts for skipping. "Add more" is always collapsed, not default. |
| PRD link | 4.2 P1 |

### C4 — Understand patterns in my symptoms
**When** I've logged a few cycles of data **I want to** see what patterns emerge **so I can** understand why I feel certain ways at certain times.

| | |
|---|---|
| Priority | Next |
| Trigger | 3+ cycles of data available |
| Success | User discovers a correlation they didn't know about (e.g., headaches cluster on day 22–24) |
| Design criteria | Actionable language: "Your headaches tend to appear during your luteal phase" — not "You logged headaches 3 times." Links to Health Assistant for deeper understanding. |
| PRD link | 4.2 P1 |

---

## 3. SHOP

### S1 — Get product recommendations that match my flow
**When** I need menstrual products **I want to** see recommendations based on my actual flow data **so I can** buy the right absorbency without guessing.

| | |
|---|---|
| Priority | MVP |
| Trigger | User visits Shop tab, or nudge card on Home during luteal/menstrual phase |
| Success | User sees a recommendation they agree with ("yes, I do need super for day 1–2") |
| Design criteria | Recommendations framed as helpful, not salesy: "Based on your flow, Super for days 1–2, Regular from day 3." Not a product catalog — a curated suggestion. |
| PRD link | 4.3 P0 |

### S2 — Buy products quickly
**When** I've decided what I need **I want to** purchase in as few taps as possible **so I can** get it done and move on.

| | |
|---|---|
| Priority | MVP |
| Trigger | User taps a product or "reorder" |
| Success | Purchase completed in 3 taps or fewer (select → confirm → done) |
| Design criteria | One-tap reorder for previous purchases. Clear price. No dark patterns. Subscription option visible but not forced. |
| PRD link | 4.3 P0 |

### S3 — Set up a subscription that adapts to my cycle
**When** I'm tired of remembering to buy products **I want to** set up auto-delivery timed to my cycle **so I can** always have what I need without thinking about it.

| | |
|---|---|
| Priority | MVP |
| Trigger | User explores subscription option in Shop |
| Success | User sets up subscription and feels confident it will arrive when needed |
| Design criteria | Subscription adapts to predicted cycle start (not fixed 28-day). Easy pause/cancel — one tap, no guilt screen. Clear "next delivery" date on Home or Shop. Shows savings vs. one-time purchase. |
| PRD link | 4.3 P0, P1 |

### S4 — See what I'm spending on period products
**When** I'm curious about my spending **I want to** see my annual cost and how a subscription compares **so I can** make an informed decision about my money.

| | |
|---|---|
| Priority | Next |
| Trigger | User explores cost section in Shop |
| Success | User sees a clear number and feels informed, not anxious |
| Design criteria | "You've spent €94 this year. A subscription saves ~€22." Tone: empowering, not guilt-inducing. Optional view — not the first thing in Shop. |
| PRD link | 4.3 P1, H3 |

---

## 4. HEALTH ASSISTANT

### A1 — Ask "why do I feel like this?"
**When** I'm experiencing something uncomfortable or confusing **I want to** ask the Health Assistant what's going on **so I can** understand my body instead of just enduring symptoms.

| | |
|---|---|
| Priority | MVP |
| Trigger | User opens Health Assistant tab, or taps "learn more" from a nudge |
| Success | User gets a plain-language, phase-aware answer that feels trustworthy |
| Design criteria | Conversational UI — not a search engine. Response references user's current cycle phase. Tone: warm, direct, evidence-based. "You're in your luteal phase — progesterone peaks can cause bloating and fatigue. This is normal." |
| PRD link | 4.4 P0, H2 |

### A2 — Learn about what's happening in my body right now
**When** I'm curious (not necessarily in pain) **I want to** read/browse educational content about my current phase **so I can** understand my body better over time.

| | |
|---|---|
| Priority | MVP |
| Trigger | User opens Health Assistant, or is drawn in by a nudge card |
| Success | User learns something new and feels more body-literate |
| Design criteria | Content adapts to current phase — not a generic article library. Short, scannable format. Feels like a knowledgeable friend, not a medical textbook. This is the primary engagement hook — it should feel rewarding to explore. |
| PRD link | 4.4 P0 |

### A3 — Get a product suggestion within a health context
**When** the Health Assistant mentions a symptom or need **I want to** see a relevant product suggestion inline **so I can** act on the advice without switching contexts.

| | |
|---|---|
| Priority | Next |
| Trigger | Health Assistant response mentions a product-relevant topic (cramps → heating pad, heavy flow → absorbency) |
| Success | User perceives the suggestion as helpful, not as an ad |
| Design criteria | Inline product card within conversation — small, non-intrusive. "Libresse also offers warming pads — want to see?" User must opt in to see more. Never the first thing in a response. Health answer always comes first. |
| PRD link | 4.4 P1 |

### A4 — Know when to see a doctor
**When** the Health Assistant identifies something potentially concerning **I want to** be told clearly that I should consult a professional **so I can** take action without the app pretending to be a doctor.

| | |
|---|---|
| Priority | MVP |
| Trigger | User describes symptoms that warrant medical attention |
| Success | User receives a clear, non-alarming recommendation to see a doctor |
| Design criteria | Distinct visual treatment for "talk to your doctor" responses — not the same card as general advice. Tone: caring, not scary. "This is worth discussing with your doctor" — not "WARNING: seek medical attention." Never diagnoses. |
| PRD link | 4.4 P1 |

---

## 5. CROSS-CUTTING

### X1 — Start using the app without creating an account
**When** I download the app for the first time **I want to** start tracking immediately without signing up **so I can** try it before committing any personal information.

| | |
|---|---|
| Priority | MVP |
| Trigger | First app launch |
| Success | User reaches Home screen with cycle status in under 60 seconds |
| Design criteria | Onboarding: ask only cycle length + last period date. No email, no name, no account. Account prompt only when user tries Shop or subscription. Frictionless — every extra screen is a drop-off risk. |
| PRD link | 5 (no account required) |

### X2 — Check my cycle from my home screen without opening the app
**When** I glance at my phone **I want to** see my cycle day and phase on a widget **so I can** stay aware without opening anything.

| | |
|---|---|
| Priority | MVP |
| Trigger | Phone unlock / home screen glance |
| Success | User gets cycle status in under 1 second without tapping |
| Design criteria | Small widget: "Day 14 · Follicular" with phase-color gradient. Discreet mode option (shows only a colored ring, no text). Matches home screen aesthetic. Lock Screen variant for iOS 16+. |
| PRD link | 4.1 Widget extension |

### X3 — Get notified only when it actually matters
**When** something important is predicted (period coming, pattern detected, delivery arriving) **I want to** receive one useful notification **so I can** act on it — not dismiss it.

| | |
|---|---|
| Priority | Next |
| Trigger | System detects a notification-worthy event |
| Success | User taps the notification and finds it useful, or ignores it without annoyance |
| Design criteria | Default OFF — user opts in during onboarding or settings. Max 1/day. Always actionable: "Period expected in 2 days — essentials ready?" links to Shop. Never: "You haven't opened the app in 3 days." |
| PRD link | 4.5 Notifications |

### X4 — Make the app feel like mine
**When** I'm settling into the app **I want to** adjust the look and what I see **so I can** feel like it's my personal space, not a generic tool.

| | |
|---|---|
| Priority | Next |
| Trigger | User explores settings or is prompted after a few uses |
| Success | User changes at least one setting (dark mode, layout, icon) and feels ownership |
| Design criteria | Light/dark mode toggle. Dashboard card reordering. Discreet app icon option. Pronoun/name settings. Phase-adaptive colors are automatic — no setup needed. |
| PRD link | 4.5 Personalization |

---

## MVP Flow Summary

The minimum viable user journey through the JTBD:

```
Download → X1 (no account onboarding, ~60s)
    ↓
Home → H1 (see cycle day) → H2 (see what's coming) → H4 (see privacy badge)
    ↓
Period starts → H3 (log in 2 taps)
    ↓
Curious → A1 ("why do I feel like this?") → A2 (learn about current phase)
    ↓
Need products → S1 (see recommendation) → S2 (buy quickly)
    ↓
Want convenience → S3 (set up subscription)
    ↓
Between opens → X2 (widget glance)
```

**14 MVP jobs. 4 Next-iteration jobs.** Every MVP job maps to a P0 requirement in the PRD.

---

## Job Priority Matrix

| Section | MVP Jobs | Next Jobs | Core question the section answers |
|---------|---------|-----------|----------------------------------|
| Home | H1, H2, H3, H4 | — | "Where am I and what's coming?" |
| My Cycle | C1, C2, C3 | C4 | "What does my body do?" |
| Shop | S1, S2, S3 | S4 | "What do I need and how do I get it?" |
| Health Assistant | A1, A2, A4 | A3 | "Why do I feel like this?" |
| Cross-cutting | X1, X2 | X3, X4 | "Can I trust this and make it mine?" |
