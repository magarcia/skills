---
title: Sticky Headers
support: 96%
tags: layout, sticky, positioning, scroll
---

## Sticky Headers

**Replaces:** JavaScript scroll listeners with `getBoundingClientRect` checks.

**Before:**

```js
window.addEventListener('scroll', () => {
  const header = document.querySelector('.header');
  header.classList.toggle('stuck', window.scrollY > 100);
});
```

**After:**

```css
.header {
  position: sticky;
  top: 0;
}
```
