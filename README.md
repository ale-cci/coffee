# Cjure (yes, it's pronounced like seizure)
## C-like programming language with Clojures
I don't have the time to do it right the first time, but surely i have the
time to do it twice.
#### Getting started
```sh
$ go build ./cli/cj.go

$ # build & run one of the samples
$ cj -in samples/hello.cj -out hello
$ ./hello
```

#### Sample syntax
```
#!/usr/bin/env cj
-- example of multiline docstring
import "something" as something_else

-- Function to store somehitng
-- < argv : input arguent
-- > nothing : output argument
void main(string[] argv) {
    int clojure() {
        return len(argv)
    }

    int t = 0;
    dec j = 10.0;

    for t = 0; t < 69; t += 1 {
        print(t)
    }

    -- Variable swapping
    t, j = j, t

    printf("%f", dec(t) + j)
    return
}
```

- repl (jit compiler?)
- closures

