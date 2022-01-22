declare i8* @itoa(i32 , i8* , i32)
declare i32 @puts(i8*)

define i32 @main() {
  ; var := 3
  %var = alloca i32
  store i32 3, i32* %var

  ; var += '0'
  %.tmp0 = load i32, i32* %var
  %.tmp1 = add i32 %.tmp0, 48
  store i32 %.tmp1, i32* %var

  %.tmp2 = load i32, i32* %var
  %.tmp3 = trunc i32 %.tmp2 to i8

  %.tmp4 = alloca [2 x i8]
  %.tmp5 = getelementptr [2 x i8], [2 x i8]* %.tmp4, i32 0, i32 0
  store i8 %.tmp3, i8* %.tmp5

  %.tmp6 = getelementptr [2 x i8], [2 x i8]* %.tmp4, i32 0, i32 1
  store i8 0, i8* %.tmp6

  %.tmp7 = getelementptr [2 x i8], [2 x i8]* %.tmp4, i32 0, i32 0
  call i32 @puts(i8* %.tmp7)
  ret i32 0
}
