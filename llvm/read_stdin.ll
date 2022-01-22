declare i8* @gets(i8*)
declare i32 @puts(i8*)
declare i32 @read(i32, i8*, i32)
declare i32 @write(i32, i8*, i32)
declare i32 @open(i8*, i32, i32)
declare i32 @creat(i8*, i32)

@.str = constant [11 x i8] c"sample.txt\00"

define i32 @main() {
  %s = alloca [20 x i8]

  %.tmp0 = getelementptr [20 x i8], [20 x i8]*%s, i64 0, i64 0
  ; call i8* @gets(i8* %.tmp0)
  call i32 @read(i32 0, i8* %.tmp0, i32 3)

  %.tmp1 = getelementptr [20 x i8], [20 x i8]*%s, i64 0, i64 0
  call i32 @puts(i8* %.tmp1)


  %.tmp2 = getelementptr [11 x i8], [11 x i8]*@.str, i32 0, i32 0
  %.tmp3 = call i32 @creat(i8* %.tmp2, i32 2)

  ret i32 0
}
