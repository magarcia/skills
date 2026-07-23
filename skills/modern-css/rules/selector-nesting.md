---
title: Native CSS Nesting
support: 91%
tags: selector, nesting, native
---

## Native CSS Nesting

**Replaces:** Sass compiler requirement for nested syntax.

**Before (Sass):**

```scss
.nav {
  background: white;
  a {
    color: #888;
    &:hover {
      color: #333;
    }
  }
}
```

**After (native CSS):**

```css
.nav {
  background: white;

  & a {
    color: #888;

    &:hover {
      color: #333;
    }
  }
}
```

No build step needed. The `&` is required when nesting element selectors (not needed for pseudo-classes on their own).
