; custom data structure declaration in llvm

%.struct.type = type { i32, i32 }

declare i32 @printf(i8*, ...)

@.tmpl = constant [16 x i8] c"Struct: {%d %d}\00"

define void @main() {
    %t = alloca %.struct.type
    %.tmp0 = getelementptr %.struct.type, %.struct.type*%t, i32 0, i32 0
    store i32 22, i32* %.tmp0

    %.tmp1 = getelementptr %.struct.type, %.struct.type*%t, i32 0, i32 1
    store i32 23, i32* %.tmp1

    %.tmp3 = getelementptr %.struct.type, %.struct.type*%t, i32 0, i32 0
    %.tmp4 = load i32, i32* %.tmp3

    %.tmp5 = getelementptr %.struct.type, %.struct.type*%t, i32 0, i32 1
    %.tmp6 = load i32, i32* %.tmp5

    %.tmp7 = getelementptr [ 16 x i8 ], [16 x i8]*@.tmpl, i32 0, i32 0
    call i32(i8*, ...) @printf(i8* %.tmp7, i32 %.tmp4, i32 %.tmp6)
    ret void
}
