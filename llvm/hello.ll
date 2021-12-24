; sample on hello owrld

@.str = constant [15 x i8] c"hi from llvm!\0A\00"

declare i32 @puts(i8*)

define i32 @main() {
  %local.string = getelementptr [15 x i8], [15 x i8]*@.str, i64 0, i64 0

  call i32 @puts(i8* %local.string)
  ret i32 0
}

