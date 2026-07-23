---
title: Typed Attribute Values with attr() type
support: 42%
tags: attr, typed, data-attributes, experimental
---

## Typed Attribute Values with attr() type

**Replaces:** JavaScript dataset access for dynamic styling.

**Before:**

```js
bars.forEach(bar => {
  bar.style.width = bar.dataset.pct + '%';
});
```

**After:**

```css
.bar {
  width: attr(data-pct type(<percentage>));
}
```

```html
<div class="bar" data-pct="75"></div>
```

Read data attributes directly in CSS with type casting.
