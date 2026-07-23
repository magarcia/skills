---
title: Lazy Rendering with content-visibility
support: 93%
tags: performance, content-visibility, lazy, rendering
---

## Lazy Rendering with content-visibility

**Replaces:** JavaScript IntersectionObserver (15+ lines).

**Before:**

```js
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
});
sections.forEach(s => observer.observe(s));
```

**After:**

```css
.section {
  content-visibility: auto;
  contain-intrinsic-size: auto 500px;
}
```

Browser skips rendering off-screen content entirely. `contain-intrinsic-size` prevents layout shifts during scroll.
