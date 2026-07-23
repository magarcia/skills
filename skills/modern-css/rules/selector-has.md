---
title: Parent Selection with :has()
support: 94%
tags: selector, has, parent, relational
---

## Parent Selection with :has()

**Replaces:** JavaScript `closest('.parent')` with classList manipulation.

**Before:**

```js
document.querySelectorAll('.card').forEach(card => {
  if (card.querySelector('img')) {
    card.classList.add('has-image');
  }
});
```

```css
.card.has-image { grid-template: auto 1fr; }
```

**After:**

```css
.card:has(img) {
  grid-template: auto 1fr;
}
```

Also works with combinators: `.form:has(:invalid)`, `h2:has(+ p)`, `.nav:has(:focus-within)`.
