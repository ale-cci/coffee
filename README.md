# Coffee
> C-like programming language with Clojures

I don't have the time to do it right the first time, but surely i have the
time to do it twice.


```
-- Example of hello world:
-- re-use external functions delcared in libc
import "std/io" as io

-- this is a comment
int main() {

    for i := 0; i < 3; i = i + 1 {
        io.printf("Hello from coffee!\n")
    }

    return 0
}
```

#### Getting started
###### Dependencies:
 - llvm (requires llc executable to be in "$PATH")
 - gcc

```shell
$ bash install.sh
 . Installing standard libraries
 . Building coffee
 ☕ coffee is ready!

$ coffee run samples/00-hello_world.bn
File samples/00-hello_world compiled successfully!
Hello from coffee!
Hello from coffee!
Hello from coffee!
```

#### Documentation
Waiting for a better way to host it, [here](./docs) you could find the documentation
for this language.

If you find something hard to understand, please let me know or open an issue on github.
I would really appreciate it.


### Scope of this project:
I've pretty high standards, and i'm still too new on the field to know if all
of these are doable, but there they are:

- self hosted language

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
