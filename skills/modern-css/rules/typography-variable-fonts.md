---
title: Variable Fonts for Multiple Weights
support: 96%
tags: typography, variable-fonts, font-weight, performance
---

## Variable Fonts for Multiple Weights

**Replaces:** Separate `@font-face` rules for each weight.

**Before:**

```css
@font-face { font-family: "MyFont"; src: url("Regular.woff2"); font-weight: 400; }
@font-face { font-family: "MyFont"; src: url("Bold.woff2"); font-weight: 700; }
@font-face { font-family: "MyFont"; src: url("Light.woff2"); font-weight: 300; }
```

**After:**

```css
@font-face {
  font-family: "MyFont";
  src: url("MyFont-Variable.woff2") format("woff2");
  font-weight: 100 900;
}
```

One file, all weights. Smaller total download than multiple static font files.
