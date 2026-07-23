---
title: Theme Variables with Custom Properties
support: 96%
tags: color, variables, custom-properties, theme
---

## Theme Variables with Custom Properties

**Replaces:** Sass `$variable` preprocessor compilation to static values.

**Before:**

```scss
$primary: #7c3aed;
.btn { background: $primary; }
```

**After:**

```css
:root {
  --primary: #7c3aed;
}
.btn {
  background: var(--primary);
}
```

Unlike Sass variables, custom properties are live — they can be changed at runtime, scoped to selectors, and overridden per media query without recompilation.
