define i32 @main() {
  %t = alloca [32 x i32]
  %.tmp0 = getelementptr [32 x i32], [32 x i32]*%t, i32 0, i32 1
  store i32 222, i32* %.tmp0

  %.tmp1 = getelementptr [32 x i32], [32 x i32]*%t, i32 0, i32 1
  %.tmp2 = load i32, i32* %.tmp1
  ret i32 %.tmp2
}
