---
name: ui-inspiration
description: >
  Research a brand's app and web UI plus direct and adjacent competitors to build a UI inspiration
  package — a structured markdown report and a Pencil (.pen) moodboard. Use this skill whenever the
  user asks to "find UI inspiration", "research competitor apps", "look at what others are doing",
  "build a moodboard", "competitive UI analysis", "gather design references", "UI benchmarking",
  "inspiration board for [app name]", "what do similar apps look like", or "research the market
  before designing". Also trigger when the user says things like "see how [competitor] designs their
  app", "compare UI patterns across [category] apps", "create a reference board", "screen collection
  for inspiration", or "UI teardown". Even casual mentions like "let's see what's out there" before
  a design phase should trigger this skill. This skill is the natural next step after brand-research
  and before wireframing — it bridges brand identity research with actual UI decisions.
---

# UI Inspiration Research

## Purpose

Before designing screens, you need to understand what already exists in the space. This skill
researches a brand's own digital products (website, app) and their competitors to collect UI
patterns, screen references, and design approaches. The output is twofold: a structured markdown
report cataloguing what was found, and a visual moodboard in Pencil that the designer can reference
while working.

## Why this matters

Designers don't design in a vacuum. Understanding what competitors are doing — and where they're
falling short — helps make informed decisions rather than guessing. A moodboard built from real
competitor screens gives the team a shared visual vocabulary: "we want something like Clue's
calendar but with the warmth of Flo's cards." That kind of grounded reference is worth more than
abstract adjectives.

## Inputs

The skill needs one or more of:
- A **brand name** or **product name** (e.g., "Libresse", "Headspace")
- A **product category** (e.g., "period tracking apps", "meditation apps")
- A **PRD or design spec** that mentions the product and its competitive landscape
- A **list of specific competitors** the user wants analyzed

If only a brand name is given, infer the category from context and identify competitors yourself.

Also check for existing pipeline artifacts that can inform the research:
- **`design/brand-research-[name].md`** — if the brand-research skill has already run, read this
  first. It gives you the brand's visual language, which helps you compare competitors against
  the brand's own aesthetic. Don't repeat work that's already been done.
- **`pm/prd.md`** or **`design/design-spec.md`** — may list competitors or describe the product
  category, saving you the scoping step.

## Outputs

Two deliverables:

1. **Markdown report** → `design/ui-inspiration-[product-name].md`
   A structured analysis of the brand's own UI plus 3–5 competitors, organized by UI pattern.

2. **Pencil moodboard** → `design/ui-moodboard-[product-name].pen`
   A visual reference board with annotated screenshots and pattern callouts.

## Workflow

### Step 1: Define the research scope

Before searching, establish what you're looking at:

1. **The brand's own products** — does the brand have an existing app or web product? Check
   the app stores and their website. This is the baseline.

2. **Direct competitors** — apps/sites in the same category solving the same problem.
   Identify 3–4 of the most prominent ones. For each, note:
   - Name and platform (iOS/Android/Web)
   - App Store rating and rough download count if visible
   - One-line positioning ("how they describe themselves")

3. **Adjacent inspiration** — 1–2 apps from nearby categories that are known for great UI.
   These aren't competitors but sources of design patterns. For a period tracker, that might be
   a sleep app or a meditation app that handles daily logging well.

Share this scope with the user for confirmation before diving in. A quick list like:

> **Direct competitors:** Clue, Flo, Natural Cycles
> **Adjacent inspiration:** Headspace (daily check-in UI), Oura (health dashboard)
> Does this look right, or should I add/swap any?

### Step 2: Research each product

For each product in your scope (including the brand's own), do the following:

#### 2a: App Store analysis

Search the web for the app's store listing. From the listing, extract:
- **Screenshots** — these are the most curated view of the app's UI. Note what screens
  they chose to showcase (usually their strongest).
- **App icon** — design style, color, shape
- **Star rating and review count** — rough quality signal
- **Key phrases from description** — how they position themselves

#### 2b: Website analysis

Use Chrome browser tools to visit the product's website. Focus on:
- **Hero section** — what's the first thing users see? Screenshot it.
- **Feature showcase** — how do they present app screens on the website?
  These are often higher-quality renders of key screens.
- **Signup/onboarding flow** — if visible, note the approach.

For each site, take screenshots of the most relevant sections:

```
tabs_context_mcp(createIfEmpty: true)
```
Then navigate and screenshot:
```
navigate(url: "[product-url]", tabId: [id])
computer(action: "screenshot", tabId: [id])
```

#### 2c: UI pattern extraction

From the screenshots and listings, identify and catalogue these patterns:

**Navigation model**
- Tab bar? Hamburger? Bottom sheet? How many top-level sections?
- How do they handle navigation depth?

**Dashboard / Home screen**
- What information is front and center?
- How do they visualize the primary data? (chart, card, illustration, number)
- Information density — sparse or data-rich?

**Data input / Logging**
- How do users enter data? (form, slider, tap chips, quick actions)
- Is it fast? How many taps to complete the primary action?

**Data visualization**
- Charts, calendars, timelines — what type and style?
- Color coding approach
- How do they handle empty/insufficient data states?

**Cards and content blocks**
- Corner radius, shadows, spacing
- Content structure within cards
- How do they mix content types (text + image + action)?

**Typography and spacing**
- Heading sizes, body sizes
- Spacing feel — airy or compact?
- Font personality — geometric, humanist, rounded?

**Color approach**
- Primary accent color
- How many colors in the UI palette?
- Dark mode support?
- How do they use color for meaning vs. decoration?

**Micro-interactions and details**
- Anything distinctive about transitions, animations, or feedback?
- Empty states — illustrated or plain?
- Loading states

### Step 3: Compile the markdown report

Write the report to `design/ui-inspiration-[product-name].md` using the template below.
The report should read as a useful reference document, not a dry comparison table. Include
observations about what works well and what doesn't, so the designer can make informed choices.

### Step 4: Build the Pencil moodboard

The moodboard is a visual reference board in Pencil. It's not wireframes — it's a curated
collection of findings organized spatially so the designer can glance at it while working.

#### Set up the document

```
get_editor_state(include_schema: false)
```

If there's no suitable file open, create one:
```
open_document(filePathOrTemplate: "design/ui-moodboard-[product-name].pen")
```

#### Moodboard structure

Create a large canvas frame (2400×1800 or larger) with these zones:

```javascript
board=I(document, {type: "frame", name: "UI Inspiration — [Product]", width: 2400, height: "fit_content(1800)", fill: "#F5F5F5", layout: "vertical", gap: 48, padding: 48, placeholder: true})
```

**Zone 1: Header**
A title bar with project name, date, and scope summary.

```javascript
header=I(board, {type: "frame", layout: "vertical", gap: 8, width: "fill_container"})
title=I(header, {type: "text", content: "UI Inspiration — [Product Name]", fontSize: 32, fontWeight: "800", fill: "#1A1A1A", fontFamily: "Inter"})
subtitle=I(header, {type: "text", content: "Competitive UI research · [date] · [N] apps analyzed", fontSize: 16, fill: "#888888", fontFamily: "Inter"})
divider=I(board, {type: "frame", width: "fill_container", height: 2, fill: "#E0E0E0"})
```

**Zone 2: Competitor overview**
A row of cards, one per analyzed product, with key facts.

```javascript
overviewRow=I(board, {type: "frame", layout: "horizontal", gap: 20, width: "fill_container"})
```

For each competitor:
```javascript
compCard=I(overviewRow, {type: "frame", layout: "vertical", gap: 12, padding: 20, fill: "#FFFFFF", cornerRadius: [12,12,12,12], stroke: {align: "inside", fill: "#E5E5E5", thickness: 1}, width: "fill_container"})
compName=I(compCard, {type: "text", content: "[App Name]", fontSize: 18, fontWeight: "700", fill: "#1A1A1A", fontFamily: "Inter"})
compCategory=I(compCard, {type: "text", content: "[category] · [rating] · [platform]", fontSize: 13, fill: "#888888", fontFamily: "Inter"})
compDesc=I(compCard, {type: "text", content: "[One-line positioning from app store]", fontSize: 14, fill: "#555555", fontFamily: "Inter"})
```

**Zone 3: Pattern comparison grids**

For each major UI pattern category (navigation, home/dashboard, data input, visualization,
cards), create a section with a heading and a horizontal row of annotated reference blocks:

```javascript
sectionTitle=I(board, {type: "text", content: "Navigation Patterns", fontSize: 22, fontWeight: "700", fill: "#1A1A1A", fontFamily: "Inter"})
patternRow=I(board, {type: "frame", layout: "horizontal", gap: 20, width: "fill_container", placeholder: true})
```

Each reference block inside a pattern row:

```javascript
refBlock=I(patternRow, {type: "frame", layout: "vertical", gap: 8, width: 340})
refImg=I(refBlock, {type: "frame", width: "fill_container", height: 500, cornerRadius: [12,12,12,12], fill: "#E0E0E0", layout: "vertical", alignItems: "center", justifyContent: "center"})
refLabel=I(refImg, {type: "text", content: "[App Name]", fontSize: 16, fontWeight: "600", fill: "#888888", fontFamily: "Inter"})
refAnnotation=I(refBlock, {type: "text", content: "[Key observation about this pattern]", fontSize: 13, fill: "#666666", fontFamily: "Inter", width: "fill_container"})
```

Where possible, use the `G()` (Generate image) operation to place stock or AI-generated
reference images that approximate the UI patterns you observed:

```javascript
refImg=I(patternRow, {type: "frame", width: 340, height: 500, cornerRadius: [12,12,12,12]})
G(refImg, "ai", "[description of the UI pattern, e.g., 'mobile app period tracker home screen with circular calendar and pastel colors']")
annotation=I(patternRow, {type: "text", content: "Clue — Circular calendar as hero element", fontSize: 13, fill: "#666666", fontFamily: "Inter"})
```

**Zone 4: Key takeaways**

A summary section with the most important findings, styled as callout cards:

```javascript
takeawayTitle=I(board, {type: "text", content: "Key Takeaways", fontSize: 22, fontWeight: "700", fill: "#1A1A1A", fontFamily: "Inter"})
takeawayGrid=I(board, {type: "frame", layout: "horizontal", gap: 16, width: "fill_container"})
```

Each takeaway as a colored card:
```javascript
tkCard=I(takeawayGrid, {type: "frame", layout: "vertical", gap: 8, padding: 20, fill: "#FFF0F5", cornerRadius: [12,12,12,12], width: "fill_container"})
tkTitle=I(tkCard, {type: "text", content: "[Pattern name]", fontSize: 15, fontWeight: "700", fill: "#1A1A1A", fontFamily: "Inter"})
tkBody=I(tkCard, {type: "text", content: "[What we should take from this — the design implication]", fontSize: 13, fill: "#555555", fontFamily: "Inter", width: "fill_container"})
```

#### Screenshot and verify

After building each zone, screenshot to verify layout:
```
get_screenshot(filePath: "...", nodeId: "boardId")
```

### Step 5: Present the deliverables

Tell the user:
- How many products were analyzed
- The report location and key findings
- The moodboard location
- Any competitors you couldn't access and why
- Suggested next steps (e.g., "this is ready to reference while wireframing")

---

## Report Template

```markdown
# UI Inspiration Research: [Product Name]

**Date:** [date]
**Category:** [e.g., Period tracking / Feminine health]
**Products analyzed:** [list with links]
**Researcher:** AI-assisted competitive UI analysis

---

## Executive Summary

[3–4 sentences capturing the state of UI in this category. What are the dominant patterns?
Where is there room for differentiation? What surprised you?]

---

## Products Analyzed

### [Brand's Own Product] (if exists)
- **Platform:** [iOS / Android / Web]
- **Rating:** [stars, review count]
- **Positioning:** [how they describe themselves]
- **UI Summary:** [2–3 sentences on the overall design approach]

### [Competitor 1]
[same structure]

### [Competitor 2]
[same structure]

[... repeat for each product]

---

## Pattern Analysis

### Navigation
| App | Model | Tabs | Depth | Notes |
|-----|-------|------|-------|-------|
| [App 1] | Tab bar | 4 | 2 levels | [observations] |
| [App 2] | Tab bar | 5 | 3 levels | [observations] |

**Trend:** [What most apps in this space do]
**Opportunity:** [Where there's room to do something different or better]

### Home / Dashboard
| App | Hero element | Info density | Primary action | Style |
|-----|-------------|-------------|----------------|-------|
| [App 1] | Circular calendar | Medium | Log today | Illustrated |
| [App 2] | Phase card | Low | Quick log | Photographic |

**Trend:** [What most apps do]
**Opportunity:** [Gaps or weaknesses to exploit]

### Data Input / Logging
| App | Method | Taps to complete | Customization | Notes |
|-----|--------|-----------------|---------------|-------|
| [App 1] | Chip selection | 3 | High | [observations] |
| [App 2] | Slider + form | 5 | Medium | [observations] |

**Trend:** [Common approaches]
**Opportunity:** [Where UX could be better]

### Data Visualization
| App | Chart types | Calendar view | Color coding | Empty state |
|-----|------------|---------------|-------------|-------------|
| [App 1] | Line, bar | Monthly grid | Phase-based | Illustrated |
| [App 2] | Circular | Timeline | Symptom-based | Text prompt |

**Trend:** [How data is typically shown]
**Opportunity:** [Where visualization could improve]

### Cards & Content Blocks
| App | Corner radius | Shadow | Spacing feel | Content mix |
|-----|--------------|--------|-------------|-------------|
| [App 1] | 12px | Subtle | Airy | Text + icon |
| [App 2] | 16px | None, border | Compact | Text + illustration |

### Typography & Color
| App | Primary font | Heading size | Accent color | Dark mode |
|-----|-------------|-------------|-------------|-----------|
| [App 1] | [font] | [size] | [color] | Yes/No |
| [App 2] | [font] | [size] | [color] | Yes/No |

---

## Standout Patterns

[3–5 specific UI patterns from any of the analyzed apps that stood out as particularly
well-designed. For each, explain what it is, why it works, and whether it's applicable
to the current project.]

### [Pattern 1: e.g., "Clue's circular calendar"]
- **What:** [description]
- **Why it works:** [explanation]
- **Applicable?** [Yes/No/Partially — and why]

---

## Design Opportunities

Based on the competitive analysis, these are the areas where [product name] can differentiate:

1. **[Opportunity 1]** — [explanation of the gap and how to fill it]
2. **[Opportunity 2]** — [explanation]
3. **[Opportunity 3]** — [explanation]

---

## Recommended Design Direction

[A short paragraph synthesizing everything into a recommended direction. Not detailed specs,
but a north star: "Based on the research, the app should lean toward [approach] because
[reason]. The biggest opportunity is [X] — no competitor does it well. Avoid [Y] because
the space is already saturated with that approach."]

---

## Sources & References

[List all URLs visited, app store listings checked, etc.]
```

## Tips for better results

- **Don't just describe, evaluate.** For each pattern, note whether it works well or poorly
  and why. A list of "App X does Y" isn't useful — "App X does Y, and it works because Z"
  gives the designer actionable insight.

- **Look for what's missing.** If no competitor does a good job with onboarding, or everyone
  ignores accessibility, that's a huge design opportunity. Call it out.

- **Prioritize the moodboard.** The markdown report is for reference, but the Pencil moodboard
  is what the designer will actually pin up and glance at while designing. Make it visually
  useful — well-organized, annotated, and scannable.

- **Connect findings to the project.** Don't just document the landscape — always bring it
  back to "what does this mean for us?" The Design Opportunities and Recommended Direction
  sections are the most important part of the report.

- **Note the rating gap.** If competitors have low ratings and common complaints, those
  complaints are your product's opportunity. Check a few recent negative reviews if accessible.
