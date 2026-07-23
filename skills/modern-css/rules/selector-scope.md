---
title: Scoped Styles with @scope
support: 84%
tags: selector, scope, encapsulation
---

## Scoped Styles with @scope

**Replaces:** BEM naming, CSS Modules, or styled-components.

**Before:**

```css
.card__title { font-size: 1.25rem; }
.card__body { color: #444; }
```

**After:**

```css
@scope (.card) {
  .title { font-size: 1.25rem; }
  .body { color: #444; }
}
```

Styles only apply within the scoped root. Can also set a lower boundary: `@scope (.card) to (.card-footer)` to exclude nested regions.
