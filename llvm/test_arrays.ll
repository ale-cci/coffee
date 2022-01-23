; array declaration + access cell elements of an array
@.tmpl = constant [24 x i8] c"template: %d - %d = %d\0A\00"

declare i32 @printf(i8* , ...)

define void @main() {
  ; int[3] arr
  %.arrval =  [3 x i32] [i32 101, i32 202, i32 303]

  ; arr[0] = 101
  %.tmp0 = getelementptr [3 x i32], [3 x i32]* %arr, i32 0
  store [3 x i32] %.arrval, i32* %.tmp0

  %.tmp1 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 1
  %.tmp2 = load i32, i32* %.tmp1


  ; %.tmp0 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 0
  ; %.tmp0 = getelementptr [10 x i32], [10 x i32]* %arr, inrange [10 x i32]], i32 0

  %.tmp4 = getelementptr [24 x i8], [24 x i8]* @.tmpl, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* %.tmp4, i32 1, i32 1, i32 %.tmp2)

  ; arr[1] = 202
  ; arr[2] = 303

  ; printf("arr[0] = %d", a)
  ; printf("arr[1] = %d", b)
  ; printf("arr[2] = %d", c)

  ret void
}
