---
title: Element Centering with place-items
support: 96%
tags: layout, centering, grid
---

## Element Centering with place-items

**Replaces:** `position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%)`.

**Before:**

```css
.parent {
  position: relative;
}
.child {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

**After:**

```css
.parent {
  display: grid;
  place-items: center;
}
```
