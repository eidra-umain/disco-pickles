# UI Inspiration Research: Libresse App

**Date:** March 6, 2026
**Category:** Period tracking / Feminine health / Cycle-linked commerce
**Products analyzed:** Clue, Flo, Natural Cycles, Headspace (adjacent), Oura Ring (adjacent)
**Researcher:** AI-assisted competitive UI analysis

---

## Executive Summary

The period tracking space is dominated by two UI philosophies: Clue's gender-neutral minimalism (scientific, no pink, circular cycle view with red/teal phase coding) and Flo's purple-branded data-richness (lavender/purple identity, 430M users, medical credibility with FSA/HSA eligibility). Natural Cycles carves a niche with FDA-cleared clinical credibility, a distinctive green/red day system on a dark background, and deep wearable integration (NC Band, Oura Ring, Apple Watch). All three rely on a bottom tab bar with 4–5 sections, circular or calendar-based cycle visualization, and chip-based symptom logging.

The biggest gap in the market is **commerce integration** — no major period tracker connects cycle tracking to product purchasing. Libresse has a unique opportunity to own this space. Adjacent apps like Headspace and Oura show how to handle daily engagement (check-ins, scores, streaks) and complex health data visualization (abstracted scores, personalized baselines) in ways that feel warm rather than clinical.

---

## Products Analyzed

### Libresse (Brand's Own)
- **Platform:** No existing app (this is a new product)
- **Brand identity:** Bold cerise pink (#E31D94), taboo-breaking, body-positive
- **Design spec vision:** 4 sections (Home, My Cycle, Shop, Health Assistant), cycle-phase-driven UI, privacy-first

### Clue
- **Platform:** iOS, Android, watchOS
- **Rating:** High ratings, 100M+ users
- **Positioning:** "#1 women-led period and cycle tracker" — science-backed, gender-neutral
- **UI Summary:** Deliberately void of pink. Sleek, modern, and inclusive. Circular cycle wheel as hero element showing "Day 28" with "2 days until your next period" countdown. Uses color-coded phases (red = period, teal = fertile, blue = ovulation, purple = PMS). Symptom tracking uses a structured icon grid with clear categories (Period flow: Light/Medium/Heavy/Super heavy, Energy: Exhausted/Tired/OK/Energized, Pain levels). "Strict data privacy" badge prominently displayed. Wearable sync support. Hormone chart visualization for deeper cycle analysis. Dark mode supported. Targets LGBTQIA+ users with neutral language and alternative app icons for privacy.

### Flo
- **Platform:** iOS, Android
- **Rating:** 4.8/5, 7M+ 5-star ratings, 430M+ total users, 36M+ MAU
- **Positioning:** Medical-grade, science-backed health companion with 140+ expert partners. FSA/HSA eligible.
- **UI Summary:** **Purple/lavender is the dominant brand color** — not pink as commonly assumed. The app uses a sophisticated purple palette ranging from deep violet to soft lavender. Dashboard shows a prominent countdown ("Period in: 2 days") with calendar view using blue ovulation markers and red/pink period markers. Symptom logging uses illustrated icons with labeled chips (Cramps, Mood swings, Fatigue, etc.) in a scrollable grid. Notable features include "Flo for Partners" (extending the app's social footprint) and a Symptom Checker that matches symptoms to conditions (PCOS, Endometriosis, Fibroids, Perimenopause). Anonymous Mode for privacy. Chip-based symptom logging with 70+ symptoms across 16 categories. Humanist sans-serif typography creates warmth.

### Natural Cycles
- **Platform:** iOS, Android
- **Rating:** Strong ratings, FDA Class II medical device clearance
- **Positioning:** First FDA-cleared digital contraceptive — hormone-free, clinically validated
- **UI Summary:** Clinical yet approachable. Hero element is a large green gradient circle on dark background showing cycle day and fertility status ("Cykeldag 26, Ej fertil") with today's temperature (36.69°C). Calendar view uses pink/red filled circles for period days and green circles for safe/non-fertile days. Extensive chip-based symptom logging organized by category with emoji icons — categories include Sexlust (sex drive), Hud (skin), Smärta (pain), and emotional states ("Jag känner mig..."). 5-tab navigation. Minimal friction temperature entry (~30 seconds). Strong wearable ecosystem: NC Band (own hardware), Oura Ring, Apple Watch integration. Dark background throughout optimized for morning use.

### Headspace (Adjacent)
- **Platform:** iOS, Android
- **Rating:** Top meditation app
- **Positioning:** Meditation and mental wellness with daily check-in patterns
- **UI Summary:** Bold orange/yellow brand identity. Home screen uses a grid of large category cards (Meditate, Sleep, Breathe, Focus, Move, Mental Health) — each with a distinctive illustration and color. Course detail screens show teacher selection and session breakdowns. Sleep content uses a completely different dark purple/blue palette, creating a context-appropriate mood shift. Soundscape screens for ambient audio. Progressive disclosure — simple surface rewarding exploration. Warm, psychologically safe design language throughout.

### Oura Ring (Adjacent)
- **Platform:** iOS, Android (companion to Oura Ring hardware)
- **Rating:** Top health dashboard
- **Positioning:** Holistic health tracking through wearable ring — sleep, activity, readiness
- **UI Summary:** Dark, premium UI aesthetic. Dashboard shows score-based system: Readiness (88), Sleep (84), Activity (91), plus Cycle Day (6) — all as large, glanceable numbers. 3-tab navigation (Today, Vitals, My Health). Vitals breakdown uses horizontal bar charts for individual metrics. "Min hälsa" (My Health) provides long-term reflection views. Sleep tracking includes detailed hypnogram with REM/Light/Deep breakdown. Heart health section shows "konditionsålder" (fitness age). Color coding: blue (85+ thriving), yellow (70–84 balanced), red (<70 recovering). All baselines personalized to the individual. Zero daily input required — passive data collection. Notable: Oura now includes cycle tracking (Cycle Day shown on dashboard), making it a partial competitor, not just adjacent.

---

## Pattern Analysis

### Navigation

| App | Model | Tabs | Depth | Notes |
|-----|-------|------|-------|-------|
| Clue | Bottom tab bar | 4 | 2 levels | Cycle View, Calendar, Analysis, Content. Plus "+" button for quick logging |
| Flo | Bottom tab bar + FAB | 5–7 | 2–3 levels | Floating action button for quick log. Thumb-friendly design |
| Natural Cycles | Bottom tab bar | 5 | 2 levels | Today, Calendar, Learn, Messages, Add Data (+). Plus in center |
| Headspace | Bottom tab bar | 3 | 2 levels | Today, Explore, Profile. Minimal, focused |
| Oura | Bottom tab bar | 3 | 3 levels | Today, Vitals, My Health. Deep drill-down into each metric |

**Trend:** 4–5 bottom tabs is the standard. Every app puts the primary daily view first. Quick-log access is always within one tap (either via FAB, "+" button, or prominent CTA).

**Opportunity:** Libresse's 4-tab structure (Home, My Cycle, Shop, Assistant) is well-aligned with the market. The Shop tab is genuinely novel — no competitor has commerce integrated. The challenge is ensuring it doesn't feel like an ad. Headspace and Oura show that 3 tabs can work if navigation depth is well-designed.

### Home / Dashboard

| App | Hero element | Info density | Primary action | Style |
|-----|-------------|-------------|----------------|-------|
| Clue | Circular cycle wheel | Medium | Quick-log via "+" | Scientific, clean |
| Flo | Cycle day countdown number | Moderate-high | Log via FAB | Warm, data-forward |
| Natural Cycles | Single colored circle (green/red) | Low | Add temperature | Clinical, decisive |
| Headspace | "Today" card with daily recommendation | Low | Start session | Warm, illustrated |
| Oura | Single readiness score (0–100) | Low surface, deep drill-down | None — passive data | Data-elegant |

**Trend:** There's a clear split between "show everything" (Flo, Clue) and "show one thing" (Natural Cycles, Oura, Headspace). The "one big thing" approach from Oura is notably effective — users see their most relevant insight first and dig deeper only if they want.

**Opportunity:** Libresse's design spec proposes a Cycle Ring + Phase Banner + Today's Nudge. This balances both approaches well. The phase-adaptive background color system (terracotta/green/golden/lavender) is unique in the market — no competitor does this. Lean into it as a differentiator.

### Data Input / Logging

| App | Method | Taps to complete | Customization | Notes |
|-----|--------|-----------------|---------------|-------|
| Clue | Modal with category buttons | 3–5 | 100+ trackable experiences | Large tap targets, haptic feedback. Recent redesign increased tap count |
| Flo | Chip-based multi-select | 3–4 | 70+ symptoms, 16 categories | Icon + text chips. Highly visual |
| Natural Cycles | Single temperature field + optional extras | 1–2 (temp only) | Limited symptoms, focused on temp | Optimized for speed — 30-second morning routine |
| Headspace | Biometric-estimated mood | 0 (passive) or 1 tap | Limited to mood spectrum | Wearable integration reduces friction |

**Trend:** Chip/tag-based selection is universal for symptoms. Flo leads in breadth (70+ symptoms), Clue in trackable categories (100+). Natural Cycles proves that minimal input can still be engaging if the core data point is valuable enough.

**Opportunity:** Libresse's Daily Log spec (flow selector, mood chips, symptom tags, optional pain scale and notes) is well-designed. The progressive disclosure pattern (pain scale hidden until "Add pain level" tap, notes collapsed by default) matches what works in the market. Consider adding haptic feedback on selection (Clue does this well) and an estimated completion time ("Takes ~30 seconds").

### Data Visualization

| App | Chart types | Calendar view | Color coding | Empty state |
|-----|------------|---------------|-------------|-------------|
| Clue | Circular cycle wheel, phase timeline | Monthly grid with colored blocks | Phase-based (red/teal/blue/purple) | Progressive — needs 3+ cycles |
| Flo | Line charts, cycle trends, symptom heatmaps | Calendar with prediction overlays | Semantic (red=period, blue=ovulation) | Illustrated prompts |
| Natural Cycles | Green/red circles per day | Month view with connected red days | Binary + intensity gradient | Minimal — "keep measuring" |
| Oura | Rings, score trends, time-of-day patterns | No calendar (daily focus) | Threshold-based (blue/yellow/red) | Score unavailable state |

**Trend:** Circular visualization is dominant in period trackers (Clue's wheel, Natural Cycles' colored circle). Calendar views are supplementary, not primary. Color intensity gradients add nuance beyond simple on/off states.

**Opportunity:** The design spec's Cycle Ring + Phase Timeline combination is strong. The four-phase color system (terracotta/green/golden/lavender) is more nuanced than competitors' binary or tri-color approaches. For the "insufficient data" state, Oura's approach of showing what's available while being honest about confidence is worth emulating.

### Cards & Content Blocks

| App | Corner radius | Shadow | Spacing feel | Content mix |
|-----|--------------|--------|-------------|-------------|
| Clue | 12–16px | Subtle elevation | Airy, generous | Text + colored indicators |
| Flo | Moderate (~12px) | Subtle shadows | Moderate density | Icon + text + data viz |
| Natural Cycles | 12px | Minimal | Clean, clinical | Text + color circle |
| Headspace | 16–20px | Soft, rounded | Very airy | Illustration + text + CTA |
| Oura | 12–16px | Near-flat, subtle | Medium | Score + trend + text |

**Trend:** 12–16px corner radius is the standard for health apps. Shadows are universally subtle or absent. Airy spacing signals trust and care, while tighter spacing signals data density.

**Opportunity:** The design spec targets 12–16px radius with organic shapes — aligned with the market. Headspace's illustration-forward card design is worth noting for Libresse's NudgeCard component and empty states. Given Libresse's brand boldness, slightly larger corner radii (16px) would differentiate from the more clinical competitors.

### Typography & Color

| App | Primary font | Heading size | Body size | Accent color | Dark mode |
|-----|-------------|-------------|-----------|-------------|-----------|
| Clue | Modern sans-serif | ~20–24px | ~14–16px | Red/Teal/Blue (phase-based) | Yes |
| Flo | Humanist sans-serif | 40–48px (hero number) | 14–16px | Purple/Lavender (brand) + Red/Blue (semantic) | Yes |
| Natural Cycles | Clean sans-serif | ~20px | ~14px | Green/Red (fertility) | Inherent (dark bg) |
| Headspace | Rounded sans-serif | ~28px | ~16px | Orange (#FF6B6B) | Yes |
| Oura | Geometric sans-serif | ~32px (scores) | ~14px | Blue (#1E88E5) | Yes |

**Trend:** Body text is universally 14–16px. Hero numbers (Flo's cycle day, Oura's score) run large (32–48px) for glanceability. Most apps use a single font family with weight variation. Dark mode is increasingly expected.

**Opportunity:** Libresse's cerise pink (#E31D94) is far bolder than any competitor's accent color. This is a strength — it creates instant brand recognition. The four-phase palette (terracotta/green/golden/lavender) adds richness that competitors lack. Pair with a rounded, friendly sans-serif (the design spec says this) to balance the boldness with warmth.

---

## Standout Patterns

### 1. Clue's Circular Cycle Wheel
- **What:** A full-circle visualization with the current day at top, phases color-coded around the ring, and tracking dots showing logged data
- **Why it works:** Cycles are inherently circular — this visualization matches the mental model. Users can see at a glance where they are, what's coming, and what they've tracked
- **Applicable?** Yes — the Libresse Cycle Ring is already planned. The key learning: make the phases visually distinct (Clue uses distinct colors) and show tracking completeness (dots for logged days)

### 2. Oura's "One Big Thing" Dashboard
- **What:** Instead of showing all metrics, the home screen surfaces the single most relevant insight for that day. Everything else is one tap away.
- **Why it works:** Reduces cognitive load dramatically. Users get value in under 2 seconds. The algorithm decides what matters most — users don't have to.
- **Applicable?** Partially — Libresse's Home has multiple components (ring, phase banner, nudge, forecast), but the Phase Banner could serve as the "one big thing" if it's treated as the hero. The nudge card is context-aware by design, which is similar.

### 3. Flo's Anonymous Mode
- **What:** A toggle that anonymizes the user's account — removes name, email, and personal identifiers while keeping cycle data functional
- **Why it works:** Privacy becomes a visible, tangible feature, not just a policy page. Users feel in control. It's especially important in regions where reproductive data is sensitive.
- **Applicable?** Highly applicable — Libresse's PRD makes privacy a core hypothesis (H4). The design spec's PrivacyBadge component and "privacy you can see" principle align perfectly. Flo proves users value this.

### 4. Headspace's Illustration System
- **What:** Custom, playful illustrations of diverse characters showing various emotional states — not just happiness but stress, sadness, anxiety, calm
- **Why it works:** Creates psychological safety and emotional warmth. The illustrations are abstract enough to feel universal but specific enough to be empathetic. They make empty states and onboarding feel caring rather than clinical.
- **Applicable?** Yes — Libresse's brand is body-positive and emotionally authentic. Custom illustrations for empty states, onboarding, and educational content would differentiate from competitors' more sterile approaches. The Womb Stories animation heritage gives Libresse creative permission to go further here.

### 5. Flo's Symptom Checker & Partner Mode
- **What:** Two notable features: (1) A Symptom Checker that matches user-reported symptoms to potential conditions like PCOS, Endometriosis, Fibroids, and Perimenopause, and (2) "Flo for Partners" that extends the app beyond the primary user.
- **Why it works:** The Symptom Checker bridges tracking and understanding — it's not just "log your cramps" but "your cramps + fatigue + heavy flow might indicate something worth discussing with a doctor." Partner Mode acknowledges that cycles affect relationships and households, not just individuals.
- **Applicable?** Highly — Libresse's Health Assistant (H2) could offer similar condition-matching but through conversational AI rather than a static checker. The partner angle is interesting for the commerce story: partners could manage subscription orders too.

### 6. Natural Cycles' Morning-Optimized UI
- **What:** Dark background, minimal UI, large tap targets, and sub-30-second data entry — all optimized for the first moment after waking
- **Why it works:** Respects the context of use. The dark background doesn't shock tired eyes. The minimal interface doesn't require decision-making when you're barely awake.
- **Applicable?** Partially — Libresse's Daily Log should be fast, but it doesn't require temperature logging. The principle of context-aware UI is worth adopting: if a user opens the app at 7am, default to "quick log" mode. If they open at 8pm, show the dashboard.

---

## Design Opportunities

Based on the competitive analysis, these are the areas where the Libresse app can differentiate:

1. **Cycle-linked commerce (unique in market)** — No competitor connects period tracking to product purchasing. Libresse can own this space entirely. The key is making it feel like service ("your flow starts in 3 days — are you stocked up?") rather than advertising. Flo and Clue monetize through subscriptions and content — Libresse can build a fundamentally different revenue model.

2. **Phase-adaptive visual design** — The four-phase color system (terracotta/green/golden/lavender) as background and accent shifts is unique. Competitors use color to code data; Libresse can use color to create an ambient, mood-appropriate experience that changes with the user's cycle. This is emotionally resonant in a way no competitor has attempted.

3. **Bold visual identity** — Cerise pink (#E31D94) is louder and more confident than anything in the market. Clue is deliberately neutral, Flo owns purple/lavender, Natural Cycles is clinical green-on-dark. Libresse's brand personality — unapologetic, taboo-breaking — can translate into a UI that feels energetic and empowering rather than gentle and soothing. The cerise pink creates clear visual separation from Flo's purple, which is the only other "bold color" play in the space.

4. **Privacy as visible product feature** — While Flo has Anonymous Mode, Libresse's "privacy you can see" principle plus on-device processing goes further. No data leaves the phone — that's a stronger claim than anonymization. Design this into every relevant screen with the PrivacyBadge component so users see it constantly.

5. **AI Health Assistant with commerce context** — No competitor has a conversational AI that can both answer health questions and contextually suggest products. The design spec's inline product card within AI responses is a novel pattern. The risk is it feeling transactional — the opportunity is making it genuinely helpful ("based on your cycle history, you tend to need heavier protection on days 2–3").

---

## Recommended Design Direction

The Libresse app should lean into its brand boldness as a differentiator. Where Clue is clinical and Flo is gentle, Libresse should be **confident and warm** — a friend who knows her stuff and isn't afraid to say it directly. The phase-adaptive color system is the strongest visual differentiator available; it should permeate the entire experience, not just accent elements. The commerce integration must earn its place through contextual helpfulness, following Oura's principle of surfacing "the one thing that matters right now" rather than a product catalog. And the privacy story needs to be as visible as Flo's Anonymous Mode but architecturally stronger — "your data never leaves your phone" is a cleaner message than "we'll anonymize you."

The biggest design risk is the Shop tab feeling like an ad inside a health app. The biggest design opportunity is making cycle-phase-aware commerce feel like a genuinely useful service that competitors can't replicate because they don't have the product catalog to back it up.

---

## Sources & References

- Clue: helloclue.com, iOS/Android App Store listings, BioWink GmbH, **App Store screenshots (verified)**
- Flo: flo.health, iOS/Android App Store listings, Flo Design System (Medium), **App Store screenshots (verified — corrected brand color to purple/lavender)**
- Natural Cycles: naturalcycles.com, FDA clearance documentation, iOS/Android listings, **App Store screenshots (verified — Swedish locale)**
- Headspace: headspace.com, design analysis articles, **App Store screenshots (verified)**
- Oura: ouraring.com, app design documentation, **App Store screenshots (verified — Swedish locale, includes cycle day tracking)**
- Brand research: design/brand-research-libresse.md
- PRD: pm/prd.md
- Design spec: design/design-spec.md
