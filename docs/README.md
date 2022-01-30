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


#### Implemented operators
`+ - = < > == | & * / != >= <=`

## In progress
- [ ] more operators `&& || !`
- [ ] pointer type
- [ ] import variables
- [ ] check elif block
- [ ] enums

## TODOs:
- [ ] standard library
- [ ] first class functions
- [ ] keyword argument: `int fd = io.open(file: "something", mode: 0)`
- [ ] Create a documentation page: `https://docs.readthedocs.io/en/stable/tutorial/`
- [ ] Union

