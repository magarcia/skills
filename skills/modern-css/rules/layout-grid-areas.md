---
title: Named Grid Areas
support: 96%
tags: layout, grid, template-areas
---

## Named Grid Areas

**Replaces:** Line numbers or float-based layouts.

**Before:**

```css
.header { grid-column: 1 / 3; grid-row: 1; }
.sidebar { grid-column: 1; grid-row: 2; }
.main { grid-column: 2; grid-row: 2; }
.footer { grid-column: 1 / 3; grid-row: 3; }
```

**After:**

```css
.layout {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
}
.header { grid-area: header; }
.sidebar { grid-area: sidebar; }
.main { grid-area: main; }
.footer { grid-area: footer; }
```
