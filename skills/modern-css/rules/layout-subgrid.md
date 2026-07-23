---
title: Nested Grid Alignment with subgrid
support: 88%
tags: layout, grid, subgrid, alignment
---

## Nested Grid Alignment with subgrid

**Replaces:** Duplicating parent track definitions in child grids.

**Before:**

```css
.parent {
  display: grid;
  grid-template-columns: 200px 1fr 100px;
}
.child {
  display: grid;
  grid-template-columns: 200px 1fr 100px; /* duplicated */
}
```

**After:**

```css
.parent {
  display: grid;
  grid-template-columns: 200px 1fr 100px;
}
.child {
  display: grid;
  grid-template-columns: subgrid;
}
```

Child inherits parent's column tracks, keeping alignment consistent without duplication.
