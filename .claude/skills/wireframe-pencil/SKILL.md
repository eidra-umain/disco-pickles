---
name: wireframe-pencil
description: >
  Create low-fidelity wireframes in Pencil (pencil.dev) from a PRD or design spec. Use this skill
  whenever the user asks to create wireframes, mockups, screen layouts, or app screens in Pencil.
  Also trigger when the user says "wireframe this", "sketch the screens", "create the UI in Pencil",
  "mock up the app", "design the screens", or "build wireframes from the PRD". This skill produces
  grayscale, layout-focused wireframes — boxes, text, and basic shapes — not polished visual designs.
  It uses the Pencil MCP tools (batch_design, batch_get, get_screenshot, etc.) to build .pen files.
---

# Wireframe Generator for Pencil

## Purpose

Turn a PRD or design spec into low-fidelity wireframes in Pencil. The output is grayscale and
layout-focused: rectangles, text labels, and simple shapes that communicate structure, hierarchy,
and flow — not visual polish. Think of these as the architectural blueprints before the interior
design happens.

## Why low-fi matters

Low-fidelity wireframes are fast to create and cheap to throw away. They keep conversations
focused on "is this the right structure?" instead of "should that blue be darker?" They're
the fastest way to validate information architecture, user flows, and screen layouts before
anyone invests time in visual design or code.

## Inputs

Read the design source in this order of preference:

1. **`design/design-spec.md`** — If it exists and has real content, use it. It contains screen
   inventory, user flows, component lists, and state definitions.
2. **`pm/prd.md`** — If there's no design spec, fall back to the PRD. Extract screens from
   the functional requirements and information architecture sections.
3. **Conversation context** — If neither file exists, work from what the user describes.

You need at minimum: a list of screens to wireframe and a rough sense of what each screen does.

## Output

Create wireframes in a `.pen` file in the `design/` directory. Name it descriptively
(e.g., `design/wireframes.pen` or `design/libresse-wireframes.pen`).

## Workflow

### Step 1: Plan the screens

Before touching Pencil, list out every screen you're going to wireframe. For each screen, note:
- Screen name
- Primary purpose (one sentence)
- Key components (what boxes/sections will be on it)
- Screen type: mobile (393×852) or desktop (1440×900)

Share this list with the user for a quick confirmation before proceeding. This saves rework.

### Step 2: Set up the Pencil document

Check what's already open:

```
get_editor_state(include_schema: false)
```

If there's already a `.pen` file open in the `design/` folder, use it. Otherwise, open or create one:

```
open_document(filePathOrTemplate: "new")
```

If the document has an existing design system with reusable components, note them — you can
use them as building blocks. Check with:

```
batch_get(filePath: "...", patterns: [{reusable: true}], readDepth: 2, searchDepth: 3)
```

### Step 3: Get a style guide (optional but recommended)

For better visual consistency even in low-fi, fetch a style guide:

```
get_style_guide_tags()
```

Then pick tags that match the project's vibe and fetch:

```
get_style_guide(tags: ["minimal", "clean", "mobile", ...])
```

Apply the font family and base colours from the style guide to your wireframes for consistency.

### Step 4: Build wireframes screen by screen

For each screen, use `batch_design` with a maximum of 25 operations per call. Build screens
in this order:

1. **Create the screen frame** on the document root
2. **Add the major structural sections** (header, content areas, footer/nav)
3. **Populate each section** with placeholder components
4. **Screenshot and verify** after each screen

#### Mobile screen template (393×852)

```javascript
screen=I(document, {type: "frame", name: "Screen Name", layout: "vertical", width: 393, height: 852, fill: "#FFFFFF", placeholder: true, cornerRadius: [0,0,0,0]})
statusBar=I(screen, {type: "frame", name: "Status Bar", layout: "horizontal", width: "fill_container", height: 62, padding: [0, 24], alignItems: "center", justifyContent: "space_between"})
timeLabel=I(statusBar, {type: "text", content: "9:41", fontSize: 15, fontWeight: "600", fontFamily: "Inter", fill: "#1A1A1A"})
content=I(screen, {type: "frame", name: "Content", layout: "vertical", width: "fill_container", height: "fill_container", padding: [16, 20], gap: 20, placeholder: true})
```

#### Desktop screen template (1440×900)

```javascript
screen=I(document, {type: "frame", name: "Screen Name", layout: "vertical", width: 1440, height: "fit_content(900)", fill: "#FFFFFF", placeholder: true})
header=I(screen, {type: "frame", name: "Header", layout: "horizontal", width: "fill_container", height: 64, padding: [0, 32], alignItems: "center", justifyContent: "space_between", stroke: {align: "inside", fill: "#E5E5E5", thickness: {bottom: 1}}})
content=I(screen, {type: "frame", name: "Content", layout: "vertical", width: "fill_container", height: "fill_container", padding: 32, gap: 24, placeholder: true})
```

### Low-fi component patterns

These are the building blocks for wireframes. Keep everything in grays — no brand colours.

#### Text hierarchy

```javascript
heading=I(parent, {type: "text", content: "Screen Title", fontSize: 24, fontWeight: "700", fill: "#1A1A1A", fontFamily: "Inter"})
subheading=I(parent, {type: "text", content: "Section heading", fontSize: 16, fontWeight: "600", fill: "#333333", fontFamily: "Inter"})
body=I(parent, {type: "text", content: "Body text description goes here", fontSize: 14, fontWeight: "400", fill: "#666666", fontFamily: "Inter"})
label=I(parent, {type: "text", content: "Label", fontSize: 12, fontWeight: "500", fill: "#999999", fontFamily: "Inter"})
```

#### Button (primary)

```javascript
btn=I(parent, {type: "frame", layout: "horizontal", height: 48, padding: [12, 24], cornerRadius: [8,8,8,8], fill: "#333333", alignItems: "center", justifyContent: "center", width: "fill_container"})
btnLabel=I(btn, {type: "text", content: "Button Label", fontSize: 16, fontWeight: "600", fill: "#FFFFFF", fontFamily: "Inter"})
```

#### Button (secondary / outline)

```javascript
btn=I(parent, {type: "frame", layout: "horizontal", height: 48, padding: [12, 24], cornerRadius: [8,8,8,8], fill: "#FFFFFF", stroke: {align: "inside", fill: "#CCCCCC", thickness: 1}, alignItems: "center", justifyContent: "center", width: "fill_container"})
btnLabel=I(btn, {type: "text", content: "Secondary", fontSize: 16, fontWeight: "500", fill: "#333333", fontFamily: "Inter"})
```

#### Input field

```javascript
inputGroup=I(parent, {type: "frame", layout: "vertical", gap: 6, width: "fill_container"})
inputLabel=I(inputGroup, {type: "text", content: "Field Label", fontSize: 12, fontWeight: "500", fill: "#666666", fontFamily: "Inter"})
inputBox=I(inputGroup, {type: "frame", layout: "horizontal", height: 44, padding: [10, 14], cornerRadius: [8,8,8,8], fill: "#F5F5F5", stroke: {align: "inside", fill: "#E0E0E0", thickness: 1}, alignItems: "center", width: "fill_container"})
placeholder=I(inputBox, {type: "text", content: "Placeholder text", fontSize: 14, fill: "#AAAAAA", fontFamily: "Inter"})
```

#### Card

```javascript
card=I(parent, {type: "frame", layout: "vertical", padding: 16, gap: 12, cornerRadius: [12,12,12,12], fill: "#FAFAFA", stroke: {align: "inside", fill: "#E5E5E5", thickness: 1}, width: "fill_container"})
```

#### Image placeholder

```javascript
imgPlaceholder=I(parent, {type: "frame", width: "fill_container", height: 200, cornerRadius: [8,8,8,8], fill: "#E5E5E5", layout: "horizontal", alignItems: "center", justifyContent: "center"})
imgIcon=I(imgPlaceholder, {type: "icon_font", iconFontFamily: "lucide", iconFontName: "image", width: 32, height: 32, fill: "#AAAAAA"})
```

#### Icon + text row (list item, menu item)

```javascript
row=I(parent, {type: "frame", layout: "horizontal", gap: 12, alignItems: "center", width: "fill_container", padding: [12, 0]})
rowIcon=I(row, {type: "icon_font", iconFontFamily: "lucide", iconFontName: "home", width: 20, height: 20, fill: "#666666"})
rowText=I(row, {type: "text", content: "Menu Item", fontSize: 15, fill: "#333333", fontFamily: "Inter"})
```

#### Bottom tab bar (mobile)

```javascript
tabBar=I(screen, {type: "frame", name: "Tab Bar", layout: "horizontal", width: "fill_container", height: 83, padding: [12, 20, 24, 20], alignItems: "start", justifyContent: "space_around", stroke: {align: "inside", fill: "#E5E5E5", thickness: {top: 1}}})
tab1=I(tabBar, {type: "frame", layout: "vertical", gap: 4, alignItems: "center"})
tab1Icon=I(tab1, {type: "icon_font", iconFontFamily: "lucide", iconFontName: "home", width: 22, height: 22, fill: "#1A1A1A"})
tab1Label=I(tab1, {type: "text", content: "Home", fontSize: 10, fontWeight: "600", fill: "#1A1A1A", fontFamily: "Inter"})
```

#### Divider

```javascript
divider=I(parent, {type: "frame", width: "fill_container", height: 1, fill: "#E5E5E5"})
```

### Step 5: Screenshot and verify each screen

After building each screen, take a screenshot and visually inspect it:

```
get_screenshot(filePath: "...", nodeId: "screenId")
```

Check for:
- Is the hierarchy clear? Can you tell what's most important?
- Is spacing consistent?
- Are touch targets large enough (44px minimum for mobile)?
- Does the layout make sense for the screen's purpose?

Fix any issues before moving to the next screen.

### Step 6: Arrange screens on canvas

After all screens are built, arrange them in a logical flow on the canvas. Use `find_empty_space_on_canvas`
to position each screen with adequate spacing (100px between screens).

Group related screens together:
- Onboarding flow: left to right
- Main app screens: grouped by tab/section
- Detail/modal screens: below their parent

### Step 7: Summary

After all wireframes are complete, tell the user:
- How many screens were created
- Which file they're in
- A brief note on anything that was ambiguous or where you made a judgment call
- Any screens from the spec that were intentionally skipped (and why)

## Colour palette (low-fi only)

Stick to this palette. The whole point of low-fi is to avoid colour discussions.

| Use | Hex | Description |
|-----|-----|-------------|
| Background | `#FFFFFF` | Screen background |
| Surface | `#FAFAFA` | Cards, elevated surfaces |
| Border | `#E5E5E5` | Borders, dividers |
| Input bg | `#F5F5F5` | Input fields |
| Primary text | `#1A1A1A` | Headings, key labels |
| Secondary text | `#333333` | Subheadings |
| Body text | `#666666` | Descriptions, body copy |
| Muted text | `#999999` | Labels, captions |
| Placeholder | `#AAAAAA` | Input placeholders, icons |
| Button fill | `#333333` | Primary buttons |
| Button text | `#FFFFFF` | Text on dark buttons |

## Sizing reference (mobile)

| Element | Height | Notes |
|---------|--------|-------|
| Status bar | 62px | OS chrome, don't design inside it |
| Screen width | 393px | iPhone 15 / standard mobile |
| Screen height | 852px | Standard mobile viewport |
| Tab bar | 83px | Includes safe area padding |
| Button | 48px | Touch-friendly |
| Input field | 44px | Touch-friendly |
| Touch target | 44px min | Accessibility requirement |
| Section gap | 20-24px | Between major content blocks |
| Item gap | 12-16px | Between related items |
| Content padding | 20px | Left/right page margins |
