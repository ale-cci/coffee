@0 = constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
  %.tmp = getelementptr [4 x i8], [4 x i8]* @0, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* %.tmp, i32 20)
  ret i32 0
}
