## Coffee-lang: things implemented
NOTE: for now you need to copy the [std directory](../src/std) in your "project folder"

Coffee-lang è un linguaggio di programmazione di sistema tipizzato staticamente, con una sintassi ispirata a **Go** e la flessibilità del **C**. Il compilatore traduce il codice sorgente `.bn` ("Bean") in una rappresentazione intermedia, che viene poi compilata e linkata in un binario nativo ed eseguibile tramite la toolchain di sistema.

```go
import "./std/io" as io

int function(int param1, int param2) {
    return param1 + param2
}

void main() {
    -- le stringhe sono terminate automaticamente con il carattere nullo \0
    str string = "Hello"

    -- dichiarazione di un array statico
    int[32] array

    -- definizione di una variabile
    int t = 32

    -- \0A è il codice esadecimale ASCII per il newline
    io.printf("Example of function call: %d\n", t)
}
```

Puoi trovare altri esempi ed applicazioni pratiche nella cartella [samples](../samples).

### Index:
- [types](./types.md) — Tipi di dati nativi e puntatori.
- [variables](./variables.md) — Dichiarazione di variabili e inferenza di tipo.
- [structs](./structs.md) — Definizione di strutture dati (`struct`), alias e gestione puntatori.
- [loops](./loops.md) — Strutture di controllo iterative (`for`, `for-else`).
- [arrays](./arrays.md) — Gestione di array e slice dinamiche.
- [stdlib](./stdlib.md) — Panoramica e funzioni della Libreria Standard (`io`, `sys`, `string`, ecc.).
- [testing](./testing.md) — Scrittura ed esecuzione di test unitari con `std/testing`.


#### Implemented operators
`+ - = < > == | & * / != >= <= %`

## In progress
- [ ] Create a documentation page: `https://docs.readthedocs.io/en/stable/tutorial/`
- [ ] slices casting (to array ptr and back), pop, square bracket operator ([:-1])

## TODOs:
- [ ] lexer better error reporting
- [ ] first class functions
- [ ] reliable paramater expansion (maybe something like rust macros) `something(...x)`
- [ ] keyword argument: `int fd = io.open(file: "something", mode: 0)`
- [ ] Unions
- [ ] closures / clojures
- [ ] something like va\_args
- [ ] lazy operands `&& ||`, negation operator `!`
- [ ] enums
- [ ] interfaces
- [ ] tracebacks

- [x] standard library import
- [ ] zero value initialization (`https://go.dev/ref/spec#The_zero_value`)

## TOOLS - todo
- [ ] formatter
- [ ] syntax highlighter
- [ ] http library
