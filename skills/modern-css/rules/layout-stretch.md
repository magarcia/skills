---
title: Filling Available Space with stretch
support: 90%
tags: layout, width, sizing
---

## Filling Available Space with stretch

**Replaces:** `calc(100% - 40px)` width workarounds.

**Before:**

```css
.full {
  width: calc(100% - 40px);
}
```

**After:**

```css
.full {
  width: stretch;
}
```
