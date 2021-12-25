; Example of `if` compilation, conditionally print 'Hi' depending on true or
; false condition
@.str0 = constant [3 x i8] c"Hi\00"

declare i32 @puts(i8*)

define i32 @main() {

  br i1 false, label %.if.true.1, label %.if.false.1
.if.true.1:
  %.tmp0 = getelementptr [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
  %.tmp1 = call i32 @puts(i8* %.tmp0)
  br label %.if.end.1

.if.false.1:
  br label %.if.end.1

.if.end.1:
  ret i32 0
}
