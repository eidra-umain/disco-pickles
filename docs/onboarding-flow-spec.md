# Onboarding Flow Specification

**Task:** TASK-007  
**Owner:** product-lead  
**Status:** Complete  
**Last Updated:** 2026-03  

---

## Overview

The onboarding flow introduces new users to the app's core value proposition (privacy-first cycle tracking) and collects minimal data needed for predictions. The flow is **skippable** and **non-blocking** — users can start using the app immediately.

**Flow:** Welcome → Privacy Explainer → Cycle Setup → Home Dashboard

**Duration:** ~60-90 seconds (or skip in 2 taps)

---

## Design Principles

1. **Privacy first** — Explain data handling before asking for any input
2. **Minimal friction** — Only ask for essential data (last period date, typical cycle length)
3. **Skippable** — Users can defer cycle setup and still use the app
4. **One-time only** — Never show again after completion
5. **Graceful degradation** — Home works without cycle data (shows setup CTA)

---

## Screen 1: Welcome

### Purpose
Brand introduction and set expectations for what the app does.

### Layout
- **Full-screen branded splash**
- Libresse logo (centered, top third)
- Hero illustration (abstract, inclusive, cycle-themed)
- Headline + subheadline
- Primary CTA button
- Skip link (subtle, bottom)

### Content

**Headline:**  
"Your cycle, your way"

**Subheadline:**  
"Track your cycle, understand your body, and shop for what you need — all in one place."

**Primary CTA:**  
"Get Started" → Advances to Privacy Explainer

**Skip Link:**  
"Skip setup" → Jumps to Home Dashboard (no cycle data)

### Visual Notes
- Background: Soft gradient (cerise pink to warm neutral)
- Illustration: Abstract cycle ring with four phase colors
- Typography: Large, friendly, rounded sans-serif
- Button: Prominent, cerise pink, rounded corners

### Interaction
- Auto-advances after 3 seconds OR on tap
- Skip link always visible (not hidden)
- Haptic feedback on button tap

---

## Screen 2: Privacy Explainer

### Purpose
Build trust by explaining data handling BEFORE asking for any personal information. This is the competitive differentiator vs. Flo/Clue.

### Layout
- **Full-screen with icon grid**
- Headline
- 4 privacy features (icon + short text each)
- Primary CTA button
- Back button (top-left)
- Skip link (bottom)

### Content

**Headline:**  
"Your health data never leaves your phone"

**Privacy Features (4 icons + text):**

1. **🔒 On Your Device**  
   "All tracking happens locally. No servers, no cloud."

2. **🚫 No Ads**  
   "We don't sell your data. Ever."

3. **📤 You Control It**  
   "Export or delete your data anytime."

4. **✓ No Account Needed**  
   "Start tracking immediately. Sign up only if you want to shop."

**Primary CTA:**  
"I Understand" → Advances to Cycle Setup

**Back Button:**  
← Returns to Welcome screen

**Skip Link:**  
"Skip setup" → Jumps to Home Dashboard

### Visual Notes
- Background: White/neutral (clean, trustworthy)
- Icons: Simple line icons, cerise pink accent
- Layout: 2x2 grid for the 4 features
- Privacy badge visible (small, top-right): "Your data is on your device"

### Interaction
- Each feature can be tapped for more detail (optional modal)
- Primary CTA always visible
- No auto-advance (user must explicitly confirm understanding)

### Copy Tone
- Direct, confident, non-defensive
- Avoid legalese ("We comply with GDPR" → "You control it")
- Emphasize user benefit, not technical details

---

## Screen 3: Cycle Setup

### Purpose
Collect minimal data needed for cycle predictions: last period start date and typical cycle length.

### Layout
- **Form screen with 2 inputs**
- Headline + subheadline
- Input 1: Date picker (last period start)
- Input 2: Number picker (typical cycle length)
- Helper text for each input
- Primary CTA button (disabled until both filled)
- Skip link (bottom)
- Back button (top-left)

### Content

**Headline:**  
"Let's set up your cycle"

**Subheadline:**  
"We'll use this to predict your next period and show you what to expect."

**Input 1: Last Period Start Date**
- Label: "When did your last period start?"
- Input: Date picker (scrollable calendar or wheel)
- Helper text: "If you're not sure, your best guess is fine."
- Default: Today's date

**Input 2: Typical Cycle Length**
- Label: "How long is your cycle usually?"
- Input: Number picker (21-45 days, default 28)
- Helper text: "From the first day of one period to the first day of the next. Average is 28 days."
- Default: 28 days

**Primary CTA:**  
"Start Tracking" → Saves data, advances to Home Dashboard  
(Disabled until both inputs filled)

**Skip Link:**  
"I'll set this up later" → Jumps to Home Dashboard (no cycle data saved)

**Back Button:**  
← Returns to Privacy Explainer

### Visual Notes
- Background: Soft phase-color gradient (terracotta, since menstrual is default)
- Inputs: Large, touch-friendly (min 44px height)
- Helper text: Small, muted gray, below each input
- CTA button: Disabled state (gray), enabled state (cerise pink)

### Interaction
- Date picker: Native iOS/Android date picker (familiar UX)
- Number picker: Scrollable wheel or stepper (± buttons)
- CTA enables only when both fields have values
- Haptic feedback on input change and CTA tap
- No validation errors (all inputs are valid by design)

### Edge Cases
- User selects future date → Auto-corrects to today
- User selects date > 60 days ago → Warning: "That was a while ago. Is this correct?" (confirm/change)
- User skips → Home shows "Set up your cycle" CTA

---

## Screen 4: Home Dashboard (Post-Onboarding)

### Purpose
First view of the main app interface. Shows cycle status if data was provided, or setup CTA if skipped.

### Layout (With Cycle Data)
- Cycle Ring (showing day 1 of 28, menstrual phase)
- Phase Banner: "Menstrual phase — your period has started"
- Today's Nudge: "Welcome! Log how you're feeling today."
- Quick Log Button (prominent, floating)
- Privacy Badge (top-right): "Your data is on your device"

### Layout (Without Cycle Data — Skipped Setup)
- Empty State Illustration (cycle ring outline, muted)
- Headline: "Set up your cycle to get started"
- Subheadline: "We'll predict your next period and show you what to expect."
- CTA Button: "Set Up Now" → Opens Cycle Setup screen (same as onboarding Screen 3)
- Secondary Link: "I'll do this later" → Dismisses, shows minimal Home

### Interaction
- If cycle data exists: Home functions normally
- If no cycle data: Setup CTA is primary action
- Privacy badge always visible (tappable → opens Privacy Explainer again)

---

## Persistence & State Management

### Onboarding Completion State
**Storage:** Local app preferences (key-value store)

**Key:** `onboarding_completed`  
**Value:** `true` (boolean)

**Logic:**
- Set to `true` after user completes onboarding OR skips from any screen
- Checked on every app launch
- If `true`, skip onboarding and go directly to Home
- If `false`, show Welcome screen

### Cycle Setup State
**Storage:** Local database (SQLite)

**Data Saved:**
- `last_period_start_date` (ISO 8601 date)
- `typical_cycle_length` (integer, days)
- `setup_completed` (boolean)

**Logic:**
- If user completes Cycle Setup: save data, set `setup_completed = true`
- If user skips: set `setup_completed = false`, no cycle data saved
- Home checks `setup_completed` to determine which layout to show

### Re-triggering Setup
**From Home (if skipped):**
- Tap "Set Up Now" CTA → Opens Cycle Setup screen (Screen 3 only, not full onboarding)

**From Settings:**
- Settings → My Cycle → Edit Cycle Settings → Opens Cycle Setup screen

---

## Navigation Flow Diagram

```
App Launch
    ↓
Check: onboarding_completed?
    ↓
NO → Welcome Screen (Screen 1)
    ↓
    [Get Started] → Privacy Explainer (Screen 2)
    ↓
    [I Understand] → Cycle Setup (Screen 3)
    ↓
    [Start Tracking] → Save data → Home Dashboard (Screen 4)
    ↓
    Set onboarding_completed = true
    
YES → Home Dashboard (Screen 4)
    ↓
    Check: setup_completed?
        ↓
        YES → Show full Home (Cycle Ring, Phase Banner, etc.)
        NO → Show empty state with "Set Up Now" CTA

[Skip setup] (from any screen) → Home Dashboard (empty state)
    ↓
    Set onboarding_completed = true
    Set setup_completed = false
```

---

## Copy Guidelines

### Tone of Voice
- **Warm, not clinical:** "Your cycle, your way" not "Menstrual cycle tracking application"
- **Direct, not vague:** "Your data never leaves your phone" not "We prioritize privacy"
- **Empowering, not prescriptive:** "You control it" not "We let you control it"
- **Inclusive:** Avoid gendered language where possible ("your body" not "women's health")

### Word Choices
- ✅ "Period" (not "menstruation" or euphemisms)
- ✅ "Cycle" (not "monthly cycle" — not everyone is 28 days)
- ✅ "Your data" (not "user data" or "personal information")
- ✅ "On your device" (not "locally stored" or "on-premise")

### Accessibility
- All headlines: Semantic heading tags (H1, H2)
- All buttons: Descriptive labels (not "Next" → "Get Started")
- All inputs: Associated labels and helper text
- All icons: Alt text or ARIA labels
- Minimum font size: 16px (body text)
- Minimum touch target: 44x44px

---

## Visual Design Specs

### Colors
- **Primary (Cerise Pink):** #E31D94 (buttons, accents)
- **Phase Colors:**
  - Menstrual: #D97757 (terracotta)
  - Follicular: #7FB069 (soft green)
  - Ovulatory: #F4A261 (golden amber)
  - Luteal: #B8A4D9 (muted lavender)
- **Neutral Background:** #FAFAFA (light mode)
- **Text:** #1A1A1A (primary), #6B6B6B (secondary)

### Typography
- **Headline (Screen 1):** 32px, semibold, rounded sans-serif
- **Subheadline:** 18px, regular
- **Body text:** 16px, regular
- **Button text:** 16px, semibold
- **Helper text:** 14px, regular, muted gray

### Spacing
- Screen padding: 24px (left/right)
- Vertical spacing between elements: 16px (small), 24px (medium), 40px (large)
- Button height: 56px (touch-friendly)
- Button corner radius: 12px

### Illustrations
- **Welcome Screen:** Abstract cycle ring with four phase colors (terracotta, green, golden, lavender)
- **Privacy Explainer:** Simple line icons (lock, no-ads symbol, export arrow, checkmark)
- **Empty State (Home):** Muted cycle ring outline with dashed segments

---

## Acceptance Criteria Validation

- [x] **Welcome screen with Libresse branding** → Screen 1 includes logo, brand colors, hero illustration
- [x] **Privacy explainer screen ("How we handle your data")** → Screen 2 with 4 privacy features
- [x] **Cycle setup screen (last period date, typical cycle length)** → Screen 3 with 2 inputs
- [x] **Option to skip cycle setup ("I'll set this up later")** → Skip link on all screens
- [x] **Onboarding only shows once (persisted completion state)** → `onboarding_completed` flag in local storage
- [x] **Graceful degradation on Home if cycle not set up** → Empty state with "Set Up Now" CTA

---

## Implementation Notes

### For Developers
- Use native date/number pickers (iOS: UIDatePicker, Android: DatePicker)
- Store `onboarding_completed` in UserDefaults (iOS) or SharedPreferences (Android)
- Store cycle data in SQLite database (encrypted with SQLCipher)
- Privacy Explainer icons: Use SF Symbols (iOS) or Material Icons (Android)
- Haptic feedback: Use UIImpactFeedbackGenerator (iOS) or Vibrator (Android)

### For Designers
- Create high-fidelity mockups for all 4 screens (light mode)
- Design empty state for Home (no cycle data)
- Specify animation for Welcome → Privacy transition (fade or slide)
- Design disabled/enabled states for "Start Tracking" button

### For QA
- Test skip flow from each screen
- Test back navigation (should work from all screens except Welcome)
- Test with invalid dates (future dates, very old dates)
- Test onboarding completion persistence (close app, reopen → should skip onboarding)
- Test empty state on Home (skip setup → should show "Set Up Now" CTA)

---

## Open Questions

1. **Should we show a progress indicator (1 of 3, 2 of 3, etc.) at the top of each screen?**  
   → Recommendation: No. Adds visual clutter and implies commitment. Skip link is sufficient.

2. **Should the Privacy Explainer be accessible after onboarding?**  
   → Recommendation: Yes. Add link in Settings → Privacy. Also accessible via Privacy Badge on Home.

3. **What happens if user force-closes the app mid-onboarding?**  
   → Recommendation: Restart from Welcome screen (onboarding_completed is still false). No partial state saved.

4. **Should we collect typical period length (in addition to cycle length)?**  
   → Recommendation: Not in onboarding. Too much friction. Infer from first few logs.

5. **Should we ask for notification permissions during onboarding?**  
   → Recommendation: No. Ask contextually later (e.g., after first period prediction). Onboarding should be minimal.

---

## Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Onboarding completion rate | > 70% | % of users who complete all 3 screens |
| Cycle setup completion rate | > 60% | % of users who fill in cycle data (vs. skip) |
| Time to complete onboarding | < 90 seconds | Median time from Welcome to Home |
| Skip rate | < 30% | % of users who skip from any screen |
| Return to setup (after skip) | > 40% | % of users who tap "Set Up Now" on Home within 7 days |

---

## Related Documentation

- [Privacy Architecture](../docs/privacy-architecture.md) — Technical implementation of privacy features
- [Design Spec](../design/design-spec.md) — Full app design system and component library
- [PRD](../pm/prd.md) — Product requirements and user research

---

**Status:** Ready for design and development.
