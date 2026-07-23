---
title: Scrollbar Layout Shift Prevention
support: 90%
tags: performance, scrollbar-gutter, layout-shift
---

## Scrollbar Layout Shift Prevention

**Replaces:** `overflow-y: scroll` or hardcoded padding.

**Before:**

```css
html {
  overflow-y: scroll; /* always shows scrollbar, even when not needed */
}
```

**After:**

```css
html {
  scrollbar-gutter: stable;
}
```

Reserves space for the scrollbar without always showing it. Prevents content from shifting when scrollbar appears/disappears.
