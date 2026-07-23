---
title: Customizable Selects with appearance base-select
support: 96%
tags: component, select, form, styling
---

## Customizable Selects with appearance: base-select

**Replaces:** Select2 or Choices.js libraries with DOM rebuilding.

**Before:**

```js
new Choices('.select', { searchEnabled: false });
// rebuilds entire DOM, adds 30KB JS
```

**After:**

```css
select,
select ::picker(select) {
  appearance: base-select;
}
```

Full styling control over native `<select>` elements without JavaScript. Maintains accessibility and keyboard navigation.
