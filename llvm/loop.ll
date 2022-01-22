@.str = constant [3 x i8] c"%d\00"

declare i32 @printf(i8*, i32)

define void @main() {
  ; init before loop
  %i = alloca i32
  store i32 0, i32* %i
  br label %.start.loop

  ; check condition
.start.loop:
  %.tmp0 = load i32, i32* %i
  %.cond1 = icmp slt i32 %.tmp0, 3
  br i1 %.cond1, label %.continue.loop, label %.end.loop

.continue.loop:
  ; for body
  %.tmp1 = getelementptr [3 x i8], [3 x i8]*@.str, i32 0, i32 0
  call i32 @printf(i8* %.tmp1, i32 %.tmp0)

  %.tmp2 = add i32 %.tmp0, 1
  store i32 %.tmp2, i32* %i
  br label %.start.loop

  ; always loop
.end.loop:
  ret void
}
