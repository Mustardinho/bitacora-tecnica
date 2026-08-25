# REGEX - 50 exercuses

**Via:** B 
**Initial date:** 2026-08-25
**Fuente:** https://regexone.com - tested on https://regex101.com
**Time spent:** 30 min

| # | Pattern | What it matches | Gotcha |
|---|---|---|---|
| 1 | `abc` | the literal text `abc` anywhere in the line | NOT "starts with" — that needs `^abc` |
| 2 | `\d` | exactly one digit, 0-9 | one digit, not a number: `42` matches on the `4` |
| 3 | `\.` | a literal dot | `.` = any char; `\.` = a real dot. Backslash removes the power |
| 4 | `[cmf]` | one char, either c, m or f | inside `[ ]` most metachars lose meaning: `[.]` is a real dot |
| 5 | `[^bog]` | one char that is NOT b, o or g | `^` means "not" only as the FIRST char inside `[ ]` |
| 6 | `[^a-cx-z]` | one char outside a-c and x-z | still matches ONE char, not a whole word |
| 7 | `z{3}` | exactly `zzz` | `{3}` applies to the token before it, not the whole pattern |
| 8 | `aa+b*c+` | ≥2 a's, ≥0 b's, ≥1 c | `aa+` is at least TWO a's — `a` then `a+`. Not two |
| 9 | `\d+ files? found\?` | e.g. `3 files found?` / `1 file found?` | `s?` optional s; `\?` literal `?` — unescaped `?` = optional |
| 10 | `\d\.\s+abc` | digit, dot, ≥1 whitespace, then `abc` | `\s` = space, tab, newline. `\s+` collapses any amount |
| 11 | `^(file.+)\.pdf$` | full line: `file…` + `.pdf`, capturing the name | anchors force whole-line; `( )` captures for reuse as `$1` |

## How I apply it

-

## Open questions

-
