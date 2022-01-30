### Loops
##### Syntax
```
for <initialization> ; <condition> ; <step> {
    <expressions...>
}
```
---
Some examples:
```
for i := 0; i < 9; i = i + 1 {
    -- your loop body
}


for i := 0; i < 9; {
    -- loop body
}


for ; true ; {
    -- loop body
}
```

NOTE: `<condition>` is always required
