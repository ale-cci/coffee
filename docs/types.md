### Types
##### Buildtin types
- `int`
- `chr`
- `bool`
- `void`
- `str`


#### the `alias` keyword
`alias` is used to define new types, it is a top level expression, so it could
be used in the global scope and in function/for/if scope


###### Syntax
```
alias <name> = <type definition>
```
---
Some examples:

```
alias Int = int
alias MyStruct = struct {
    int t,
    str name,
}

void main() {
    MyStruct s
    s.name = "example"
    s.t = 3
}
```
