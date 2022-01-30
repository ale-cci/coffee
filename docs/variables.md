### Variables

###### Syntax
```
<type> <variable-name> [ = <value> ]
```


For `type` you may need to give a look at [types documentation](./types.md).

The `variable-name` could be any value that matches the regexp: `^[a-zA-Z_][a-zA-Z0-9_]$`

The `value` could be a string, a number function call or anything that you could assign
to a variable in a normal programming language.


###### Examples:
```
int main() {
    int t = 4
    return 0
}
```

##### Type inference
```
<variable-name> := <value>
```

###### Examples:
```
int main() {
    t := 4
    return 0
}
```

