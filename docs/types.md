### Types
##### Buildtin types
- `int`
- `chr`
- `bool`
- `void`
- `str`

#### Declaration of array type
###### Syntax
```
<type>[<size>]
```
---
Some examples:
```
void main() {
    int[32] t
}
```

#### Declaration of pointer type
###### Syntax
```
<type>*
```
---
Some examples:
```
void main() {
    int* t
}
```

#### type casting
##### Syntax
```
(<type>) <assignable>
```
---
###### Examples:
```
int* buffer = (int*) sys.malloc(32 * 4)
```

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
