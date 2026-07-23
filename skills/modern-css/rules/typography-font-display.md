---
title: Font Loading with font-display
support: 96%
tags: typography, font-loading, font-display, performance
---

## Font Loading with font-display

**Replaces:** Default invisible text during font loading (FOIT).

**Before:**

```css
@font-face {
  font-family: "MyFont";
  src: url("MyFont.woff2") format("woff2");
  /* text invisible until font loads */
}
```

**After:**

```css
@font-face {
  font-family: "MyFont";
  src: url("MyFont.woff2") format("woff2");
  font-display: swap;
}
```

`swap` shows fallback text immediately, swaps when loaded. Use `optional` for non-critical fonts (skips if slow).
