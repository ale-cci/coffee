; example of if implementation
@.str0 = constant [3 x i8] c"hi\00"

declare i32 @puts(i8*)

define i32 @main() {
  %.tmp5 = add i32 5, 0
  %.tmp0 = icmp sgt i32 %.tmp5, 4
  br i1 %.tmp0, label %.if.true.1, label %.if.false.1
.if.true.1:
  %.tmp1 = getelementptr [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
  %.tmp2 = call i32 @puts(i8* %.tmp1)
  br label %.if.end.1

.if.false.1:
  br label %.if.end.1

.if.end.1:
  ret i32 0
}
