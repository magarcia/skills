---
title: Focus Styles with :focus-visible
support: 95%
tags: selector, focus, accessibility, keyboard
---

## Focus Styles with :focus-visible

**Replaces:** `:focus` showing outline on mouse click too.

**Before:**

```css
button:focus {
  outline: 2px solid blue; /* shows on mouse click too */
}
```

**After:**

```css
button:focus-visible {
  outline: 2px solid var(--focus-color);
}
```

Only shows focus ring for keyboard navigation, not mouse clicks. Better UX while maintaining accessibility.
