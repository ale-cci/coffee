## Coffee-lang: things implemented
NOTE: for now you need to copy the [std directory](../src/std) in your "project folder"

```
import "./std/io" as io

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
    io.printf("Example of function call: %d\0A", t)
}
```

You can find more examples [here](../samples).

### Index:
- [types](./types.md)
- [loops](./loops.md)
- [variables](./variables.md)
- [arrays](./arrays.md)


#### Implemented operators
`+ - = < > == | & * / != >= <=`

## In progress
- [ ] Create a documentation page: `https://docs.readthedocs.io/en/stable/tutorial/`
- [ ] slices casting (to array ptr and back), pop, square bracket operator ([:-1])

## TODOs:
- [ ] lexer better error reporting
- [ ] first class functions
- [ ] keyword argument: `int fd = io.open(file: "something", mode: 0)`
- [ ] paramater expansion `something(...x)`
- [ ] Unions
- [ ] clojures
- [ ] something like va\_args
- [ ] lazy operands `&& ||`, negation operator `!`
- [ ] enums
- [ ] interfaces
- [ ] tracebacks

- [x] standard library import
- [ ] zero value initialization (`https://go.dev/ref/spec#The_zero_value`)
