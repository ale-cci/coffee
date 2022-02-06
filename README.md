# Coffee
> C-like programming language with Clojures

I don't have the time to do it right the first time, but surely i have the
time to do it twice.

```
#!/usr/bin/env coffee
extern int printf(str template, ...args)

-- this is a comment
int main() {

    for i := 0; i < 3; i = i + 1 {
        printf("Hello from coffee!\0A")
    }

    return 0
}
```

#### Getting started
###### Dependencies:
 - go (for now)
 - llvm (requires llc executable to be in "$PATH")
 - gcc

```shell
$ go build ./cli/coffee.go # or go install ./cli/coffee.go
$ coffee -in samples/hello.bn -out hello
File hello compiled successfully!
$ ./hello
Hello from coffee!
Hello from coffee!
Hello from coffee!
```

NOTE: if you do `go install`, you probably need to add `$HOME/go/bin` to your `"$PATH"`


#### Documentation
waiting for a better way to host it, [here](./docs) you could find the documentation
for this language.

If you find something not easy to understand, please let me know or open an issue,
i would really appreciate it.


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
