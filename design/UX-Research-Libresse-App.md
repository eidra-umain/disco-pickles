# Libresse App — Deep UX Research
### Prepared for Prototype Workshop | March 2026 | Confidential

---

## Table of Contents
1. [Target Audience: Gen Z Women (16–25)](#1-target-audience-gen-z-women-16-25)
2. [Period Tracker Competitive Landscape](#2-period-tracker-competitive-landscape)
3. [User Pain Points](#3-user-pain-points)
4. [Real User Needs](#4-real-user-needs)
5. [Business Needs & Opportunities](#5-business-needs--opportunities)
6. [Ideation: Meeting User + Business Needs](#6-ideation-meeting-user--business-needs)
7. [Market & Sales Opportunities](#7-market--sales-opportunities)
8. [Key Hypotheses Validation Lens](#8-key-hypotheses-validation-lens)

---

## 1. Target Audience: Gen Z Women (16–25)

### 1.1 How They Use Their Phones

Gen Z women are the most mobile-native demographic. They are not "on their phones" — the phone **is** their primary device for everything.

| Metric | Data Point |
|--------|-----------|
| Daily screen time | ~4.5 hours on smartphone (7–9 total across devices) |
| Daily unlocks | 80–100+ times per day |
| Usage pattern | Short "snacking" sessions, not long blocks |
| Peak hours | Midday (11am–1pm) and heavy evening (8pm–midnight) |
| Morning check | 80%+ check phone within 10 minutes of waking |
| TikTok time | 89–120 min/day average for ages 13–24 |
| Social media 4+ hrs/day | 35% of Gen Z |

**Usage hierarchy:**
1. Social media (TikTok, Instagram, Snapchat)
2. Messaging (iMessage, WhatsApp, Discord)
3. Entertainment/Streaming (YouTube, Spotify)
4. Shopping (SHEIN, Amazon, TikTok Shop — 40%+ have purchased via social)
5. Health & Wellness (Flo, Strava, Calm)
6. Productivity (Notion, Duolingo)

**Key behavioral trait:** Multi-app multitasking is standard. They toggle between 3–5 apps in a single sitting.

### 1.2 UX Trends That Resonate

**"Warm minimalism"** — not cold/stark, but clean layouts with personality:
- Generous whitespace + playful moments (illustration, unexpected color, witty microcopy)
- Rounded corners, soft shapes, card-based layouts
- **Dark mode is expected** (70–80% prefer it), but the *option* matters — many women prefer lighter themes in health/wellness apps
- **Bottom navigation bars** strongly preferred over hamburger menus
- **Swipe gestures** for actions are intuitive and expected (TikTok set this paradigm)
- Haptic feedback + visual microinteractions feel "premium"
- **Speed is the #1 UX factor** — perceived lag is a dealbreaker
- Skeleton screens preferred over loading spinners

**Content-first design:**
- Full-bleed media, immersive viewing
- Vertical scrolling dominates
- UI should "get out of the way" during content consumption

### 1.3 Widget Usage

~50–60% of Gen Z women use at least one home screen widget. ~25–35% use three or more.

**Most popular widget types (ranked):**
1. Weather
2. Clock/Date (often aesthetically customized)
3. Music (Spotify, Apple Music)
4. **Fitness/Health** (step counts, period tracker status)
5. Photo widgets (Locket — social photo sharing on home screen)
6. Calendar/Productivity

**Key insight:** Widgets function as **glanceable information displays** — quick status checks without opening the full app. Lock Screen widgets (iOS 16+) see strong adoption. **Aesthetic cohesion matters** — widgets that don't match the home screen theme get removed even if useful.

> **Implication for Libresse:** A beautifully designed, discreet cycle widget showing "Day 14 — Ovulation window" with a gentle gradient could become a daily touchpoint without requiring the user to open the app. This is the entry point for daily engagement.

### 1.4 Notification Preferences

Gen Z women have an **antagonistic relationship** with push notifications:
- 40–50% have turned off notifications for most apps
- 2x more likely than older generations to disable notifications within the first week
- 50–60% have **uninstalled an app** because of annoying notifications

**What works:**
- Direct messages and social interactions (always kept on)
- Time-sensitive, actionable information
- Personalized recommendations that demonstrate genuine understanding
- Progress/streak notifications tied to user goals
- Rich notifications with images and action buttons

**What kills apps:**
- Generic promotional blasts ("Check out what's new!")
- More than 1–2/day from non-messaging apps
- Guilt-tripping language ("You haven't opened us in a while...")
- Vague teasers that exist solely to drive opens
- Notifications that feel mass-blast, not personal

### 1.5 Privacy Attitudes — The Nuanced Picture

Gen Z exhibits a "privacy paradox" that is more sophisticated than it appears:

| Finding | Data |
|---------|------|
| Concerned about how companies use data | 60–65% (Morning Consult 2024) |
| Anxious about online privacy | 52% (Experian 2025) |
| Willing to share data if experience improves | 88% (Oliver Wyman Forum) |
| Stopped using a service due to privacy concerns | 35% — highest of any generation |
| Opt out of cross-app tracking (ATT) | ~70–75% |
| Accept data sharing for healthcare purposes | 61% |
| Accept data sharing for marketing | Only 34% |

**Critical nuance for health data:** Post-Dobbs, 25–30% of women either deleted or considered deleting period tracking apps. Gen Z women are **especially vigilant** about reproductive health data. They want the functionality but demand better protections.

**Privacy behaviors:** Multiple social accounts with different privacy levels, heavy use of disappearing content, higher VPN usage (30–40%), preference for explicit user-controlled data settings over invisible behavioral tracking.

> **Implication for Libresse:** Privacy isn't just a feature — it's the **foundation of trust**. On-device processing, no third-party SDKs, and transparent data practices aren't nice-to-haves. They're the price of admission for this audience. The fact that Libresse is a *product brand, not a tech company* is actually an advantage here — it reframes the value exchange from "we monetize your data" to "we sell you products you already buy."

### 1.6 Subscription Fatigue

This is a **major pain point:**
- ~50% feel they're paying for too many subscriptions (Deloitte 2024)
- Average Gen Z user has 3–5 paid subscriptions
- 60–65% prefer free, ad-supported apps over paid
- Monthly preferred over annual (flexibility to cancel)
- Free trials that auto-convert are deeply mistrusted
- "Subscribe-binge-cancel" cycles are common

**What works:** Freemium with a genuinely useful free tier. The Spotify model (vast value for free, meaningful upgrade for premium) is the gold standard.

> **Implication for Libresse:** A hard paywall would be catastrophic. The core tracking experience must be free and excellent. Premium should unlock *convenience* (auto-replenishment, AI health assistant depth) not *basic functionality*.

### 1.7 Aesthetic Preferences

**Color:** Soft, muted palettes dominate — sage greens, dusty roses, lavender, warm cream. Subtle organic gradients (not bold 2010s style). Bold color as accent only. Dark mode prefers true dark + warm accents.

**Typography:** Sans-serif dominant, growing appreciation for serif headlines. Rounded, friendly sans-serifs (Poppins, Nunito) for health/wellness apps.

**Imagery:** Authentic/unfiltered > polished stock. Custom illustrations valued. Collage/scrapbook aesthetics trending.

**Design mood:** "Cozy tech" — warm, inviting, emotionally safe. Glassmorphism for overlays. "Bento box" grid layouts for dashboards.

### 1.8 Community & Social Features

60–70% of Gen Z prefer apps that let them connect with others sharing their interests. **Community is infrastructure, not a feature.**

**What they want:**
- Opt-in community features
- Share achievements with select friends (not public-by-default)
- User-generated content (trusted far more than brand content)
- Collaborative features

**What they don't want:**
- Forced social sharing
- Public-by-default profiles
- Bolted-on social features
- Mandatory social login

### 1.9 Personalization Expectations

Not a nice-to-have — a **baseline expectation**. 71% expect personalization (McKinsey). Gen Z women value aesthetic customization (themes, colors, icons) alongside content personalization.

**Types valued (priority order):**
1. Content/feed personalization (TikTok's algorithm set the bar)
2. Visual/aesthetic customization (themes, color schemes, app icons)
3. Functional personalization (reorder navigation, hide unused features)
4. Notification personalization (granular category-level control)
5. Identity personalization (name, pronouns, avatar)

**Critical:** User-controlled personalization (quizzes, preference-setting) preferred over invisible behavioral tracking. "Creepy" personalization causes backlash.

---

## 2. Period Tracker Competitive Landscape

### 2.1 Market Overview

| Metric | Data |
|--------|------|
| Global femtech market (2025) | $63.14B |
| Projected femtech market (2035) | $266.99B (CAGR 15.51%) |
| Menstrual health apps market (2026) | $2.49B |
| Projected menstrual health apps (2035) | $13.11B (CAGR 20.28%) |
| Over 70% of femtech companies | Have at least one female founder |
| Only 4% of healthcare R&D | Addresses women's health directly |
| 84% of women | Feel "unheard" in healthcare settings |

### 2.2 Key Competitors

| App | Downloads | Pricing | Strengths | Critical Weakness |
|-----|-----------|---------|-----------|-------------------|
| **Flo** | 380M+ | Freemium ($49.99/yr) | Feature-rich, large community, brand recognition | Privacy trust destroyed (FTC $56M fine), aggressive paywalls |
| **Clue** | 50M+ | Freemium ($29.99–39.99/yr) | Science-first, cleaner design, GDPR-compliant | Paywall frustration, overly clinical feel, financial struggles |
| **Natural Cycles** | 10M+ | $99.99/yr | FDA-cleared contraceptive, temperature-based | Expensive, high-discipline requirement, ~7% failure rate |
| **Apple Health** | Built-in | Free | Best privacy architecture, clean, no ads | Extremely limited features, basic predictions, iOS only |
| **Ovia** | 15M+ | Free (employer-subsidized) | No user cost | Employers may access reproductive health data |
| **Stardust** | 5M+ | Freemium | Post-Dobbs privacy marketing | Privacy claims debunked by security researchers |

### 2.3 FTC vs Flo — What Happened

Flo shared deeply intimate health data — pregnancy status, menstrual cycles, sexual activity, masturbation habits, contraceptive methods, mental wellbeing — with Facebook, Google Analytics, AppsFlyer, and Flurry from 2016–2019, despite explicitly promising users this data would be kept private. The FTC finalized a $56M settlement banning Flo from sharing health data for advertising.

In August 2025, a federal jury in California found that **Meta itself violated California law** by unlawfully collecting and using health data that women entered into Flo.

Users reported feeling "outraged," "victimized," and "violated." This is the defining trust breach in the category.

> **Implication for Libresse:** This is the single biggest competitive opportunity. Flo controls the market but has destroyed trust. A trusted consumer brand entering with **privacy-by-architecture** (not privacy-by-promise) can capture disillusioned users.

---

## 3. User Pain Points

### 3.1 Top Pain Points (Ranked by Severity)

**🔴 Critical — App-killing issues:**

1. **Data privacy fears** — Especially post-Roe. 25–30% of women considered deleting their period apps. The fear that cycle data could be subpoenaed is real and documented. Period tracking data shared with Facebook was the breaking point.

2. **Aggressive paywalls & subscription nags** — The #1 complaint across the category. "I should not have to pay monthly to track a basic bodily function." Features moving from free to paid. Dark patterns in subscription flows. Clue users dropped ratings from 5 to 3 stars citing "subscription prompts after EVERY ACTION."

3. **Prediction inaccuracy** — Apps assume ~28-day cycles and adjust slowly. For the large population with irregular cycles (PCOS, thyroid, perimenopause, stress, birth control), predictions are often wrong by a week+. Ovulation estimates presented with false confidence.

**🟠 High — Significant friction:**

4. **Unwanted pregnancy/fertility content** — Childfree users frustrated by conception tips. Users post-miscarriage served "your baby is the size of..." content. LGBTQ+ users alienated by heteronormative assumptions. Switching modes is difficult and emotionally traumatic.

5. **UI clutter and content overload** — Apps that started as trackers became content platforms. Core function buried under articles, forums, quizzes, promotions. Users want to "just log my period and see the prediction."

6. **Gendered, infantilizing design** — Pink flowers, butterflies, cutesy language. Trans men and nonbinary users feel excluded. Many women find it patronizing. UW study: one of the biggest complaints was "the use of pink, flowery iconography."

**🟡 Moderate — Cumulative frustration:**

7. **Lack of personalization** — Apps treat all menstruating people as having the same needs. No condition-specific modes (PCOS, endo, PMDD). Limited symptom customization.

8. **No actionable insights** — Apps collect data but deliver minimal intelligence. "You logged headaches 3 times" vs. "Your headaches correlate with your luteal phase estrogen drop."

9. **Data portability** — Switching apps means losing years of data. No standard format. Data held hostage as retention mechanism.

10. **Buggy widgets & sync errors** — Widgets showing wrong data (Dec 2025 reviews: "always showing 30 days left or day 1"), sync failures between devices.

### 3.2 The Fundamental Paradox

Users simultaneously want:
- **Simplicity** — "Just let me log and see predictions"
- **Depth** — "Tell me WHY I feel this way and WHAT to do"
- **Privacy** — "Don't store my data in the cloud"
- **Intelligence** — "Use AI to give me personalized insights"

Solving this UX tension — simple surface, intelligent depth, private architecture — is the central design challenge.

---

## 4. Real User Needs

### 4.1 Beyond Tracking: What Women Actually Want

**"Is what I'm experiencing normal?"** — This is the fundamental question. Not "when is my next period?" but "why do I feel like this?"

| Need | Current State | Opportunity |
|------|--------------|-------------|
| **Symptom pattern recognition** | Apps log symptoms but don't analyze correlations | AI that connects migraines to luteal phase, anxiety to PMS, acne to hormonal shifts |
| **Health education** | Generic articles behind paywalls | Phase-specific education: "Here's what's happening in your body RIGHT NOW and why" |
| **Pain management** | "Try yoga" — not helpful | Track what actually works: "400mg ibuprofen at onset reduced cramps from 8/10 to 3/10" |
| **Product recommendations** | Non-existent in trackers | "Your flow data suggests super-absorbency for days 1–2, switching to regular by day 4" |
| **Cycle-informed life planning** | Not addressed | "Your energy peaks next week — good time for that big presentation" |
| **Doctor-ready reports** | Manual data export at best | Clean, shareable summary: "My cycles ranged 24–38 days with heavy clots on days 1–3" |
| **Cost tracking** | Non-existent | "You spend ~$120/year on menstrual products. Here's how to optimize." |

### 4.2 The Unmet Wishes

Most frequently requested features that don't exist:

1. **A simple, private, no-nonsense tracker** — "Track my period, predict the next one, don't sell me anything, don't harvest my data, don't assume I'm trying to get pregnant." This essentially doesn't exist in a polished form.

2. **Truly intelligent pattern recognition** — "Your PMS symptoms are getting more severe over time — you may want to discuss PMDD with your doctor." Not logging. Intelligence.

3. **Condition-specific modes** — Endometriosis (pain by body location), PCOS (hirsutism, acne, insulin tracking), PMDD (mood mapped to cycle phases), perimenopause.

4. **Partner/support sharing** — Share select info ("I'm on day 2" or "PMS starts in 3 days") without full data access.

5. **Wearable integration** — Cycle phase detection from physiological signals (temperature, HRV, sleep) not just calendar math.

6. **Offline-first** — Works entirely on-device, optional encrypted backup, no account required.

### 4.3 Reddit Sentiment by Community

| Subreddit | Core Sentiment |
|-----------|---------------|
| r/TwoXChromosomes | Post-Dobbs mass deletion of apps. "Why should tracking my body be a legal risk?" |
| r/periods | "What app should I use?" — most common question. No great answer exists. |
| r/birthcontrol | "Apps don't understand hormonal BC." Withdrawal bleeds ≠ periods. IUD users abandoned. |
| r/PCOS | "Period trackers are practically useless for us." Want symptom tracking, not cycle predictions. |
| r/endometriosis | Need pain by body location, non-period symptoms, exportable reports for surgeons. |
| r/privacy | Technical analyses of which apps respect privacy. Open-source alternatives preferred. |

---

## 5. Business Needs & Opportunities

### 5.1 Libresse's Strategic Position

Libresse has a unique combination of assets that no competitor possesses:

| Asset | Why It Matters |
|-------|---------------|
| **Trusted consumer brand** | Users trust established brands over tech startups for health data |
| **Existing product expertise** | Genuine authority on menstrual products — not a tech company pretending |
| **D2C commerce capability** | Can close the loop from tracking to purchasing |
| **No data monetization dependency** | Revenue comes from product sales, not data — fundamentally different incentive |
| **European base** | GDPR compliance as a privacy advantage |

### 5.2 Business Model Alignment

The brilliance of the Libresse app concept is that **user value and business value are aligned**, not in tension:

| User Value | Business Value |
|------------|---------------|
| Accurate cycle predictions | Predictable product demand forecasting |
| Product recommendations by flow intensity | Higher conversion, lower return rates |
| Subscription convenience | Recurring revenue, reduced churn |
| Health education | Brand authority, trust, engagement |
| AI health assistant | Differentiation, lock-in, product discovery |
| Privacy-first architecture | Competitive moat against Flo/Clue |

### 5.3 Revenue Streams

**Primary — Product Commerce:**
- Direct product sales through in-app shop
- Cycle-synced subscription boxes
- Personalized product bundles based on tracking data

**Secondary — Premium Features:**
- AI health assistant (deeper analysis)
- Advanced analytics/reports
- Partner sharing features
- Wearable integrations

**Tertiary — Data Insights (Aggregated, Anonymized):**
- Product development insights from aggregated usage patterns
- Market research on menstrual product needs
- Clinical research partnerships (with explicit consent)

---

## 6. Ideation: Meeting User + Business Needs

### 6.1 The Core Concept: Cycle as Operating System

Instead of an app organized around features (tracker, shop, content), organize the entire experience around **the user's current cycle phase**. The app adapts everything — UI mood, content, product suggestions, health tips — based on where the user is in their cycle.

**Menstrual Phase (Days 1–5):**
- Dashboard emphasizes comfort: pain management, heating pad reminders
- Product spotlight: high-absorbency products, period underwear
- Health assistant proactively offers pain relief strategies
- Energy indicator: "Rest mode — lower expectations are okay"
- Gentle, warm UI tones

**Follicular Phase (Days 6–13):**
- Dashboard emphasizes energy and planning
- Product needs shift to lighter protection
- Health assistant surfaces exercise optimization
- "Your energy is rising — great time for that big meeting"
- Brighter, more energetic UI

**Ovulation Window (Days 13–15):**
- Clear, non-judgmental fertility status (opt-in)
- No assumptions about intent (trying/not trying)
- Health education about what's happening hormonally

**Luteal Phase (Days 16–28):**
- PMS prediction and preparation
- Self-care content and symptom management
- Product pre-ordering for upcoming period
- "Your period is expected in 5 days — your essentials are ready"
- Warmer, softer UI tones

### 6.2 The Four Screens — Redesigned for User Needs

**HOME — "Your Day"**
- Glanceable: cycle day, phase, what to expect today
- Personalized nudges (not generic content)
- Quick-log bar at bottom (period, symptoms, mood — one tap)
- Widget-ready design (the home screen is the real entry point)
- "Bento box" layout with meaningful data cards
- No content spam. No articles unless requested.

**MY CYCLE — "Your Body"**
- Phase-aware dashboard that explains what's happening hormonally
- Symptom logging that's fast (1–2 taps) with smart defaults
- Pattern visualization over time (not just current cycle)
- Actionable insights: "Your headaches cluster around day 22–24"
- Doctor-ready exportable report
- All processing on-device. Clear "your data never leaves your phone" messaging.

**SHOP — "Your Essentials"**
- **NOT a catalog.** Context-aware recommendations.
- "Based on your flow patterns, we recommend Super for days 1–2, Regular for days 3–5"
- One-tap reorder of previous purchases
- Smart subscription that adapts to actual cycle length (not generic 28-day)
- Price transparency: "Your monthly spend: ~€8.50"
- Subscription management that respects the user (easy pause/cancel, no dark patterns)

**HEALTH ASSISTANT — "Your Guide"**
- AI-powered conversational interface
- Answers "why do I feel like this?" with evidence-based responses
- Connects symptoms to cycle phases
- Knows when to say "talk to your doctor about this"
- Can surface relevant products naturally: "For menstrual cramps, heat therapy and ibuprofen at onset are most effective. Libresse also offers warming pads — want to learn more?"
- **Never stores conversations on a server.** On-device AI processing.

### 6.3 Privacy as Architecture, Not Feature

**The Privacy Triad:**

1. **On-device processing** — Cycle predictions, symptom analysis, AI insights all run locally. No health data transmitted to servers.
2. **No account required** — Use the app immediately. Optional account only for shop/subscription features.
3. **No third-party SDKs** — Zero advertising trackers, zero analytics that send data externally. If analytics are needed, use privacy-preserving aggregation.

**Make it visible:** Don't hide privacy in settings. Put it on the home screen: "🔒 Your data is on your device. We can't see it. No one can."

### 6.4 The Widget Strategy

The widget is potentially **the most important touchpoint** — it's what users see without opening the app.

**Widget designs:**
- **Minimal:** "Day 14 · Follicular" with a subtle gradient ring
- **Informative:** Countdown to next period + current phase
- **Discreet:** Customizable to show only what the user wants (important for teens, privacy-conscious users, shared devices)
- **Aesthetic:** Multiple color themes that match home screen aesthetics

The widget creates daily passive engagement → which builds habit → which drives the user to open the app occasionally → which surfaces product needs naturally.

### 6.5 Notification Strategy

**The rules:**
- Maximum 1 notification/day, and only when genuinely useful
- Default to NO notifications — let users opt in
- Every notification must pass the test: "Would I thank the app for telling me this?"

**Acceptable notifications:**
- "Your period is expected in 2 days — your essentials are ready" (actionable + helpful)
- "You logged migraines 3 cycles in a row around day 22 — your Health Assistant has an insight" (genuine value)
- "Your subscription shipment arrives tomorrow" (practical)

**Never send:**
- "Check out this article about..."
- "You haven't logged in 3 days..."
- "New features available!"

### 6.6 Smart Commerce — Selling Without Selling

The commerce experience should feel like a **service, not a store**.

**Principle: Anticipate, don't advertise.**

- Auto-detect when the user might need products based on cycle prediction
- "Your period starts in ~3 days. Your usual order would arrive by then. Confirm?" — one tap
- Track actual product usage (how many products per cycle) to refine recommendations
- Price comparison: "You're currently spending ~€X/month. A subscription would save you €Y"
- Bundle intelligence: "Users with similar flow patterns also use [product] for overnight"

**Cost tracking as a hook:**
- "You've spent €94 on menstrual products in the last 12 months"
- "A personalized subscription would cost €72 — saving you €22/year"
- This is genuinely useful information AND a conversion driver

**No dark patterns:**
- Subscription pauses with one tap, no guilt screens
- Cancel anytime, no hoops
- Show renewal dates clearly
- "We'd rather you come back than trick you into staying"

---

## 7. Market & Sales Opportunities

### 7.1 The Trust Gap Is the Market Opportunity

No major period tracking app has earned durable user trust. The market leader (Flo, 380M downloads) had a $56M privacy fine. The #2 (Clue) frustrated users by paywalling previously-free features. The privacy champion (Apple) has bare-bones features.

**Libresse can own the "trusted brand in period tracking" position** — something no tech company can credibly claim.

### 7.2 D2C Subscription Revenue

The subscription e-commerce market is growing at a 59.5% CAGR. Menstrual products are a **perfect subscription category:**
- Predictable, recurring need
- Product selection varies by cycle phase
- Forgetting to buy is a real pain point
- Cycle data makes timing precise (not generic 30-day boxes)

**Revenue model math (illustrative):**
- Average menstrual product spend: ~€100–120/year per person
- Subscription capture rate: if 5% of app users convert → with 1M users = 50,000 subscribers
- At €8/month average = €4.8M ARR from subscriptions alone
- With 5M users = €24M ARR potential

### 7.3 The AI Health Assistant as Differentiator

61% of American adults used AI in the first half of 2025. OpenAI launched ChatGPT Health in January 2026. The consumer expectation for AI health guidance is rising rapidly.

But there's a trust crisis in AI health: Woebot (the leading AI therapy app) shut down in June 2025. The FDA is actively regulating AI health devices. Illinois banned AI from making independent therapeutic decisions without licensed professional review.

**Libresse's opportunity:** An AI assistant that is **narrow and expert** (menstrual health only), **on-device** (privacy), and **connected to real products** (not just advice, but actionable solutions). This is more trustworthy than a general-purpose AI and more useful than a generic chatbot.

### 7.4 Adjacent Revenue Streams

**Without being obvious about selling:**

1. **Cycle-synced product bundles** — "Your Follicular Phase Kit" with lighter products, energy-boosting recommendations. Feels like personalized care, not upselling.

2. **Seasonal/occasion packs** — "Festival kit," "Travel pack," "First period starter kit" (for teens/parents)

3. **Wellness product expansion** — Heating pads, pain relief, skincare (cycle-phase aware), supplements. Each justified by cycle data, not random cross-selling.

4. **Partner API** — Allow wearable brands (Apple Watch, Oura) to integrate cycle data (with user permission). Positions Libresse as the cycle data platform.

5. **B2B health insights** — Anonymized, aggregated insights for medical research, product development, market intelligence. Only with explicit opt-in consent.

### 7.5 Competitive Moats

| Moat | Description |
|------|-------------|
| **Brand trust** | A real product company with physical products users already trust |
| **Data-commerce loop** | Tracking data makes commerce better → commerce data makes tracking better |
| **Privacy architecture** | On-device processing is genuinely hard to replicate and easy to market |
| **Product expertise** | No tech company can credibly recommend menstrual products |
| **Existing distribution** | Retail presence means the app extends a relationship, not starts one |

---

## 8. Key Hypotheses Validation Lens

### H1 — The app can be designed around the rhythm of a cycle

**Research supports: STRONG YES**
- Users explicitly want phase-aware experiences, not generic calendars
- Cycle-synced content, product needs, and energy patterns are well-documented
- No major competitor does this well — most are calendar-first, not phase-first
- Gen Z expects personalization as a baseline; cycle-phase personalization is a natural extension

**Prototype should test:** Does the phase-aware UI feel genuinely different from a calendar? Do users immediately understand "where they are" in their cycle and what that means?

### H2 — We can help users understand their body, not just track it

**Research supports: STRONG YES**
- The #1 unmet need is "why do I feel like this?" — not "when is my next period?"
- 84% of women feel unheard in healthcare. An AI assistant that *listens* and *explains* fills a real gap
- Current apps collect data but deliver minimal intelligence
- Integration with phone data (steps, sleep) would dramatically improve insight quality

**Prototype should test:** Can the Health Assistant answer real questions in a way that feels trustworthy and useful? Does it know when to recommend a doctor vs. offer self-care advice?

### H3 — We can help users keep track of costs and manage product needs

**Research supports: YES (largely unaddressed by competitors)**
- Product cost tracking is a feature NO major competitor offers
- Menstrual products are a ~€100–120/year expense that feels invisible but adds up
- Users in r/periods and r/TwoXChromosomes frequently discuss product costs
- Making the invisible visible creates a natural bridge to subscription value proposition

**Prototype should test:** Does showing spend data feel useful or anxiety-inducing? Is the subscription value proposition clear enough to drive conversion?

### H5 — Routine tasks like product reordering can be automated

**Research supports: YES**
- "Running out mid-cycle" is a universally recognized pain point
- Cycle prediction + purchase history = highly accurate anticipation
- Gen Z prefers convenience and automation (they grew up with Amazon Subscribe & Save)
- The key is user control: automation as an *offer*, not a *default*

**Prototype should test:** Does auto-replenishment feel helpful or presumptuous? What level of user control is needed (full auto vs. confirm each time)?

---

## Appendix: Sources

### Live Web Research (March 2026)
- [Bearable: Best Period Tracker Apps 2025](https://bearable.app/the-best-period-tracker-apps-of-2025/)
- [CycleSynced: 11 Apps Compared](https://cyclesynced.org/best-period-tracker-app-2025-11-apps-compared-tested-reviewed/)
- [FTC: Flo Health Settlement](https://www.ftc.gov/news-events/news/press-releases/2021/01/developer-popular-womens-fertility-tracking-app-settles-ftc-allegations-it-misled-consumers-about)
- [FTC: Health App Broke Privacy Promises](https://www.ftc.gov/business-guidance/blog/2021/01/health-app-broke-its-privacy-promises-disclosing-intimate-details-about-users)
- [MobiHealthNews: Flo FTC Settlement](https://www.mobihealthnews.com/news/fertility-app-flo-health-settles-ftc-over-sensitive-data-sharing-complaint)
- [Freshcode: Femtech Market Overview](https://www.freshcodeit.com/blog/femtech-market-overview)
- [BodySpec: Femtech Market Size & Trends 2025–2026](https://www.bodyspec.com/blog/post/femtech_market_size_trends_analysis_20252026)
- [Yahoo Finance: FemTech Market Projected $266.99B by 2035](https://finance.yahoo.com/news/femtech-market-projected-reach-us-143000455.html)
- [GlobeNewsWire: Menstrual Health Apps 20.28% CAGR](https://www.globenewswire.com/news-release/2026/02/25/3244660/0/en/Menstrual-Health-Apps-Market-s-20-28-CAGR-Reflects-Strong-Investor-Confidence-in-Women-Centric-Innovation.html)
- [FemTech World: Menstrual Health Apps Market to $13B](https://www.femtechworld.co.uk/news/menstrual-health-apps-market-tipped-to-reach-us13bn-mens26/)
- [Experian: Gen Z Privacy Anxiety](https://www.experianplc.com/newsroom/press-releases/2025/over-1-in-2-gen-z-are-anxious-about-online-privacy-and-misinform)
- [TechPolicy Press: Gen Z Privacy Preferences](https://www.techpolicy.press/as-privacy-policy-heats-up-lawmakers-should-heed-gen-zs-preferences/)
- [Usercentrics: Gen Z Wants Transparency](https://usercentrics.com/magazine/articles/gen-z-wants-transparency-not-hyperpersonalization/)
- [UW News: Period Apps Failing Users](https://www.washington.edu/news/2017/05/02/period-tracking-apps-failing-users-in-basic-ways-study-finds/)
- [eMarketer: D2C Healthcare Distribution](https://www.emarketer.com/content/d2c-will-become-viable-distribution-channel-healthcare-pharma-companies-2025)
- [Fortune: OpenAI ChatGPT Health Launch](https://fortune.com/2026/01/07/openai-launches-chatgpt-health-in-a-push-to-become-a-hub-for-personal-health-data/)
- [Nike Training Club Case Study](https://www.appventurez.com/blog/nike-training-club-app-case-study)

### Training Knowledge Sources (through mid-2025)
- Pew Research Center: Teens & Technology surveys
- eMarketer/Insider Intelligence: Gen Z behavioral reports
- data.ai (App Annie): State of Mobile reports
- Morning Consult: Gen Z consumer surveys
- Deloitte: Digital Media Trends surveys
- McKinsey: Gen Z consumer research
- YPulse: Media consumption studies
- Wall Street Journal, Washington Post, The Verge, TechCrunch: Femtech coverage
- Electronic Frontier Foundation, Mozilla Foundation: Period tracker privacy analyses
- Nielsen Norman Group: UX research publications
- Reddit communities: r/periods, r/TwoXChromosomes, r/birthcontrol, r/PCOS, r/endometriosis, r/privacy
