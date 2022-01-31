# Coffee
> C-like programming language with Clojures

I don't have the time to do it right the first time, but surely i have the
time to do it twice.

### Scope of this project:
I've pretty high standards, and i'm still too new on the field to know if all
of these are doable, but there they are:

- self hosting language

- clojure support

- not nullable values by default (you have to provide `?` at the end of a type name if you want to allow null) (to prevent undefined errors)

- simple golike syntax (to prevent headakes)

- repl (for faster feedback loop)

- no floating types, only integers and decimals (to prevent floating point rounding errors)

- easy to test

- c-like features (only the good parts):
    * no truthy & falsy values.
    * null has it's own type
    * no macros
    * something to prevent buffer overflow errors & memory allocation problems
    * easier function pointer syntax

- rich ast library apis for easier to write linting tools, lsps, etc...

#### Dependencies
 - go (for now)
 - llvm (requires llc executable to be in "$PATH")
 - gcc

#### Getting started
```sh
$ go build ./cli/coffee.go # or go install ./cli/coffee.go

$ # build & run one of the samples
$ coffee -in samples/hello.bn -out hello
File hello compiled successfully!
$ ./hello
Hello from coffee!
```

NOTE: if you do `go install`, you probably need to add `$HOME/go/bin` to your `"$PATH"`

#### Sample syntax (Not all implemented yet)
```
#!/usr/bin/env coffee
-- example of multiline docstring
-- the second line
-- the third line
import "something" as something_else

-- Example function declaration
int main(int argc, str* argv) {
    -- example closure declaration
    int clojure() {
        return len(argv)
    }

    int t = 0
    dec j = 10.0

    for t = 0; t < 69; t += 1 {
        print(t)
    }

    -- Variable swapping
    t, j = j, t

    printf("%f", dec(t) + j)
    return 0 -- exit code
}
```
