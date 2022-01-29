## Coffee-lang: things implemented
```
-- for now varargs are implemented
extern int printf(str text, int arg1)

int function(int param1, int param2) {
    return param1 + param2
}

void main() {
    -- strings are auto-terminated with null character
    str string = "Hello"

    -- array declaration, for now there is no way to assign at declaration
    int[32] array

    -- var definition
    int t = 32

    -- \0A is the hex-ascii code for newline
    printf("Example of function call: %d\0A", t)
}
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
#### Implemented operators
`+ - = < > == | & * / != >= <=`

## In progress
- [ ] more operators `&& || !`
- [ ] pointer type
- [ ] elif block
- [ ] import variables
- [ ] enums

## TODO:
- [ ] fixing relative imports
- [ ] standard library
- [ ] imports from standard library
- [ ] first class functions
