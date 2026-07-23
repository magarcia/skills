---
title: Balanced Headlines with text-wrap
support: 87%
tags: typography, text-wrap, balance, headlines
---

## Balanced Headlines with text-wrap

**Replaces:** Manual `<br>` tags or Balance-Text.js library.

**Before:**

```html
<h1>This is a really long<br>headline that wraps</h1>
```

**After:**

```css
h1, h2 {
  text-wrap: balance;
}
```

Browser distributes text evenly across lines. Use `text-wrap: pretty` for body text to avoid orphans on the last line.
