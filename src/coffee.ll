declare i32 @printf(i8*, ...)
declare i32 @sprintf(i8*, i8*, ...)
declare i32 @snprintf(i8*, i32, i8*, ...)
declare i32 @asprintf(i8**, i8*, ...)
declare void @perror(i8*)
declare i32 @puts(i8*)
declare i32 @scanf(i8*, ...)
declare i32 @sscanf(i8*, i8*, ...)
@STDIN = constant i32 0
@STDOUT = constant i32 1
@STDERR = constant i32 2
declare i32 @write(i32, i8*, i32)
declare i32 @read(i32, i8*, i32)
declare i32 @close(i32)
@SEEK_SET = constant i32 0
@SEEK_CUR = constant i32 1
@SEEK_END = constant i32 2
declare i32 @lseek(i32, i32, i32)
@O_RDONLY = constant i32 0
@O_WRONLY = constant i32 1
@O_RDWR = constant i32 2
@O_CREAT = constant i32 64
@O_TRUNC = constant i32 512
declare i32 @open(i8*, i32)
%m0$.File.type = type {i8*,i32,i8*,i32,i32,i32,i32,i8*}
declare i32 @fprintf(%m0$.File.type*, i8*, ...)
declare %m0$.File.type* @fdopen(i32, i8*)
declare %m0$.File.type* @fopen(i8*, i8*)
declare i32 @fscanf(%m0$.File.type*, i8*, ...)
declare %m0$.File.type* @tmpfile()
declare i32 @fseek(%m0$.File.type*, i32, i32)
declare i32 @sendfile(i32, i32, i32*, i32)
declare void @sync()
declare i32 @fflush(%m0$.File.type*)
declare i32 @fsync(i32)
declare i32 @fileno(%m0$.File.type*)
declare i32 @fclose(%m0$.File.type*)
declare i32 @ftell(%m0$.File.type*)
declare void @rewind(%m0$.File.type*)
declare i32 @strcmp(i8*, i8*)
declare i32 @strncmp(i8*, i8*, i32)
declare i32 @strlen(i8*)
declare i8* @strcat(i8*, i8*)
declare i8* @strncat(i8*, i8*, i32)
define i1 @m3$is_letter.b.c(i8 %.c.arg) {
%c = alloca i8
store i8 %.c.arg, i8* %c
%.tmp4 = load i8, i8* %c
%.tmp5 = icmp sge i8 %.tmp4, 97
%.tmp6 = load i8, i8* %c
%.tmp7 = icmp sle i8 %.tmp6, 122
%.tmp8 = and i1 %.tmp5, %.tmp7
%.tmp9 = load i8, i8* %c
%.tmp10 = icmp sge i8 %.tmp9, 65
%.tmp11 = load i8, i8* %c
%.tmp12 = icmp sle i8 %.tmp11, 90
%.tmp13 = and i1 %.tmp10, %.tmp12
%.tmp14 = or i1 %.tmp8, %.tmp13
ret i1 %.tmp14
}
define i1 @m3$is_digit.b.c(i8 %.c.arg) {
%c = alloca i8
store i8 %.c.arg, i8* %c
%.tmp15 = load i8, i8* %c
%.tmp16 = icmp sge i8 %.tmp15, 48
%.tmp17 = load i8, i8* %c
%.tmp18 = icmp sle i8 %.tmp17, 57
%.tmp19 = and i1 %.tmp16, %.tmp18
ret i1 %.tmp19
}
define i1 @m3$is_whitespace.b.c(i8 %.c.arg) {
%c = alloca i8
store i8 %.c.arg, i8* %c
%.tmp20 = load i8, i8* %c
%.tmp21 = icmp eq i8 %.tmp20, 32
%.tmp22 = load i8, i8* %c
%.tmp23 = icmp eq i8 %.tmp22, 9
%.tmp24 = or i1 %.tmp21, %.tmp23
ret i1 %.tmp24
}
define i1 @m3$is_lower.b.cp(i8* %.string.arg) {
%string = alloca i8*
store i8* %.string.arg, i8** %string
%idx = alloca i32
store i32 0, i32* %idx
br label %.for.start.25
.for.start.25:
%.tmp26 = load i32, i32* %idx
%.tmp27 = load i8*, i8** %string
%.tmp28 = getelementptr i8, i8* %.tmp27, i32 %.tmp26
%.tmp29 = load i8, i8* %.tmp28
%.tmp30 = icmp ne i8 %.tmp29, 0
br i1 %.tmp30, label %.for.continue.25, label %.for.end.25
.for.continue.25:
%.tmp31 = load i32, i32* %idx
%.tmp32 = load i8*, i8** %string
%.tmp33 = getelementptr i8, i8* %.tmp32, i32 %.tmp31
%.tmp34 = load i8, i8* %.tmp33
%c = alloca i8
store i8 %.tmp34, i8* %c
%.tmp35 = load i8, i8* %c
%.tmp36 = icmp eq i8 %.tmp35, 95
br i1 %.tmp36, label %.if.true.37, label %.if.false.37
.if.true.37:
br label %.if.end.37
.if.false.37:
%.tmp38 = load i8, i8* %c
%.tmp39 = icmp slt i8 %.tmp38, 97
%.tmp40 = load i8, i8* %c
%.tmp41 = icmp sgt i8 %.tmp40, 122
%.tmp42 = or i1 %.tmp39, %.tmp41
br i1 %.tmp42, label %.if.true.43, label %.if.false.43
.if.true.43:
ret i1 0
br label %.if.end.43
.if.false.43:
br label %.if.end.43
.if.end.43:
br label %.if.end.37
.if.end.37:
%.tmp44 = load i32, i32* %idx
%.tmp45 = add i32 %.tmp44, 1
store i32 %.tmp45, i32* %idx
br label %.for.start.25
.for.end.25:
ret i1 1
}
define i1 @m3$is_upper.b.cp(i8* %.string.arg) {
%string = alloca i8*
store i8* %.string.arg, i8** %string
%idx = alloca i32
store i32 0, i32* %idx
br label %.for.start.46
.for.start.46:
%.tmp47 = load i32, i32* %idx
%.tmp48 = load i8*, i8** %string
%.tmp49 = getelementptr i8, i8* %.tmp48, i32 %.tmp47
%.tmp50 = load i8, i8* %.tmp49
%.tmp51 = icmp ne i8 %.tmp50, 0
br i1 %.tmp51, label %.for.continue.46, label %.for.end.46
.for.continue.46:
%.tmp52 = load i32, i32* %idx
%.tmp53 = load i8*, i8** %string
%.tmp54 = getelementptr i8, i8* %.tmp53, i32 %.tmp52
%.tmp55 = load i8, i8* %.tmp54
%c = alloca i8
store i8 %.tmp55, i8* %c
%.tmp56 = load i8, i8* %c
%.tmp57 = icmp eq i8 %.tmp56, 95
br i1 %.tmp57, label %.if.true.58, label %.if.false.58
.if.true.58:
br label %.if.end.58
.if.false.58:
%.tmp59 = load i8, i8* %c
%.tmp60 = icmp slt i8 %.tmp59, 65
%.tmp61 = load i8, i8* %c
%.tmp62 = icmp sgt i8 %.tmp61, 90
%.tmp63 = or i1 %.tmp60, %.tmp62
br i1 %.tmp63, label %.if.true.64, label %.if.false.64
.if.true.64:
ret i1 0
br label %.if.end.64
.if.false.64:
br label %.if.end.64
.if.end.64:
br label %.if.end.58
.if.end.58:
%.tmp65 = load i32, i32* %idx
%.tmp66 = add i32 %.tmp65, 1
store i32 %.tmp66, i32* %idx
br label %.for.start.46
.for.end.46:
ret i1 1
}
declare i8* @strcpy(i8*, i8*)
declare i8* @strncpy(i8*, i8*, i32)
declare void @exit(i32)
declare i8* @malloc(i32)
declare i8* @realloc(i8*, i32)
declare void @free(i8*)
@ptr_size = constant i32 8
define void @m2$assert.v.b.cp(i1 %.condition.arg, i8* %.message.arg) {
%condition = alloca i1
store i1 %.condition.arg, i1* %condition
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp67 = load i1, i1* %condition
%.tmp68 = icmp ne i1 %.tmp67, 1
br i1 %.tmp68, label %.if.true.69, label %.if.false.69
.if.true.69:
%.tmp70 = load i8*, i8** %message
%.tmp71 = call i32(i8*) @strlen(i8* %.tmp70)
%size = alloca i32
store i32 %.tmp71, i32* %size
%.tmp72 = load i8*, i8** %message
%.tmp73 = load i32, i32* %size
%.tmp74 = call i32(i32,i8*,i32) @write(i32 1, i8* %.tmp72, i32 %.tmp73)
call void(i32) @exit(i32 1)
br label %.if.end.69
.if.false.69:
br label %.if.end.69
.if.end.69:
ret void
}
declare i32 @fork()
declare i32 @waitpid(i32, i32*, i32)
declare i8* @memmove(i8*, i8*, i32)
define i8* @m2$memset.cp.cp.c.i(i8* %.buf.arg, i8 %.val.arg, i32 %.n.arg) {
%buf = alloca i8*
store i8* %.buf.arg, i8** %buf
%val = alloca i8
store i8 %.val.arg, i8* %val
%n = alloca i32
store i32 %.n.arg, i32* %n
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.75
.for.start.75:
%.tmp76 = load i32, i32* %i
%.tmp77 = load i32, i32* %n
%.tmp78 = icmp slt i32 %.tmp76, %.tmp77
br i1 %.tmp78, label %.for.continue.75, label %.for.end.75
.for.continue.75:
%.tmp79 = load i32, i32* %i
%.tmp80 = load i8*, i8** %buf
%.tmp81 = getelementptr i8, i8* %.tmp80, i32 %.tmp79
%.tmp82 = load i8, i8* %val
store i8 %.tmp82, i8* %.tmp81
%.tmp83 = load i32, i32* %i
%.tmp84 = add i32 %.tmp83, 1
store i32 %.tmp84, i32* %i
br label %.for.start.75
.for.end.75:
%.tmp85 = load i8*, i8** %buf
ret i8* %.tmp85
}
declare i32 @pipe(i32*)
declare %m0$.File.type* @popen(i8*, i8*)
declare i32 @pclose(%m0$.File.type*)
define i8* @m2$dirname.cp.cp(i8* %.path.arg) {
%path = alloca i8*
store i8* %.path.arg, i8** %path
%.tmp86 = load i8*, i8** %path
%.tmp87 = icmp eq i8* %.tmp86, null
br i1 %.tmp87, label %.if.true.88, label %.if.false.88
.if.true.88:
%.tmp89 = bitcast ptr null to i8*
ret i8* %.tmp89
br label %.if.end.88
.if.false.88:
br label %.if.end.88
.if.end.88:
%end_idx = alloca i32
%stop = alloca i1
store i1 0, i1* %stop
%.tmp91 = load i8*, i8** %path
%.tmp92 = call i32(i8*) @strlen(i8* %.tmp91)
%.tmp93 = sub i32 %.tmp92, 1
store i32 %.tmp93, i32* %end_idx
br label %.for.start.90
.for.start.90:
%.tmp94 = load i32, i32* %end_idx
%.tmp95 = icmp sgt i32 %.tmp94, 0
%.tmp96 = load i1, i1* %stop
%.tmp97 = icmp eq i1 %.tmp96, 0
%.tmp98 = and i1 %.tmp95, %.tmp97
br i1 %.tmp98, label %.for.continue.90, label %.for.end.90
.for.continue.90:
%.tmp99 = load i32, i32* %end_idx
%.tmp100 = load i8*, i8** %path
%.tmp101 = getelementptr i8, i8* %.tmp100, i32 %.tmp99
%.tmp102 = load i8, i8* %.tmp101
%.tmp103 = icmp eq i8 %.tmp102, 47
br i1 %.tmp103, label %.if.true.104, label %.if.false.104
.if.true.104:
store i1 1, i1* %stop
br label %.if.end.104
.if.false.104:
%.tmp105 = load i32, i32* %end_idx
%.tmp106 = sub i32 %.tmp105, 1
store i32 %.tmp106, i32* %end_idx
br label %.if.end.104
.if.end.104:
br label %.for.start.90
.for.end.90:
%.tmp107 = load i32, i32* %end_idx
%.tmp108 = add i32 %.tmp107, 1
%.tmp109 = call i8*(i32) @malloc(i32 %.tmp108)
%.tmp110 = bitcast i8* %.tmp109 to i8*
%path_dirname = alloca i8*
store i8* %.tmp110, i8** %path_dirname
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.111
.for.start.111:
%.tmp112 = load i32, i32* %i
%.tmp113 = load i32, i32* %end_idx
%.tmp114 = icmp slt i32 %.tmp112, %.tmp113
br i1 %.tmp114, label %.for.continue.111, label %.for.end.111
.for.continue.111:
%.tmp115 = load i32, i32* %i
%.tmp116 = load i8*, i8** %path_dirname
%.tmp117 = getelementptr i8, i8* %.tmp116, i32 %.tmp115
%.tmp118 = load i32, i32* %i
%.tmp119 = load i8*, i8** %path
%.tmp120 = getelementptr i8, i8* %.tmp119, i32 %.tmp118
%.tmp121 = load i8, i8* %.tmp120
store i8 %.tmp121, i8* %.tmp117
%.tmp122 = load i32, i32* %i
%.tmp123 = add i32 %.tmp122, 1
store i32 %.tmp123, i32* %i
br label %.for.start.111
.for.end.111:
%.tmp124 = load i32, i32* %end_idx
%.tmp125 = load i8*, i8** %path_dirname
%.tmp126 = getelementptr i8, i8* %.tmp125, i32 %.tmp124
store i8 0, i8* %.tmp126
%.tmp127 = load i8*, i8** %path_dirname
ret i8* %.tmp127
}
declare i8* @basename(i8*)
declare i8* @getcwd(i8*, i32)
declare i8* @realpath(i8*, i8*)
declare i8* @getenv(i8*)
define i8* @m1$readall.cp.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%buf_len = alloca i32
store i32 1024, i32* %buf_len
%.tmp128 = load i32, i32* %buf_len
%.tmp129 = call i8*(i32) @malloc(i32 %.tmp128)
%buf = alloca i8*
store i8* %.tmp129, i8** %buf
%content_len = alloca i32
store i32 0, i32* %content_len
%.tmp130 = call i8*(i32) @malloc(i32 1)
%content = alloca i8*
store i8* %.tmp130, i8** %content
%.tmp131 = load i8*, i8** %content
%.tmp132 = getelementptr i8, i8* %.tmp131, i32 0
store i8 0, i8* %.tmp132
%.tmp133 = load i32, i32* %fd
%.tmp134 = load i8*, i8** %buf
%.tmp135 = load i32, i32* %buf_len
%.tmp136 = call i32(i32,i8*,i32) @read(i32 %.tmp133, i8* %.tmp134, i32 %.tmp135)
%read_bytes = alloca i32
store i32 %.tmp136, i32* %read_bytes
br label %.for.start.137
.for.start.137:
%.tmp138 = load i32, i32* %read_bytes
%.tmp139 = icmp sgt i32 %.tmp138, 0
br i1 %.tmp139, label %.for.continue.137, label %.for.end.137
.for.continue.137:
%.tmp140 = load i8*, i8** %content
%.tmp141 = load i32, i32* %content_len
%.tmp142 = load i32, i32* %read_bytes
%.tmp143 = add i32 %.tmp141, %.tmp142
%.tmp144 = call i8*(i8*,i32) @realloc(i8* %.tmp140, i32 %.tmp143)
store i8* %.tmp144, i8** %content
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.145
.for.start.145:
%.tmp146 = load i32, i32* %i
%.tmp147 = load i32, i32* %read_bytes
%.tmp148 = icmp slt i32 %.tmp146, %.tmp147
br i1 %.tmp148, label %.for.continue.145, label %.for.end.145
.for.continue.145:
%.tmp149 = load i32, i32* %i
%.tmp150 = load i32, i32* %content_len
%.tmp151 = add i32 %.tmp149, %.tmp150
%.tmp152 = load i8*, i8** %content
%.tmp153 = getelementptr i8, i8* %.tmp152, i32 %.tmp151
%.tmp154 = load i32, i32* %i
%.tmp155 = load i8*, i8** %buf
%.tmp156 = getelementptr i8, i8* %.tmp155, i32 %.tmp154
%.tmp157 = load i8, i8* %.tmp156
store i8 %.tmp157, i8* %.tmp153
%.tmp158 = load i32, i32* %i
%.tmp159 = add i32 %.tmp158, 1
store i32 %.tmp159, i32* %i
br label %.for.start.145
.for.end.145:
%.tmp160 = load i32, i32* %content_len
%.tmp161 = load i32, i32* %read_bytes
%.tmp162 = add i32 %.tmp160, %.tmp161
store i32 %.tmp162, i32* %content_len
%.tmp163 = load i32, i32* %fd
%.tmp164 = load i8*, i8** %buf
%.tmp165 = load i32, i32* %buf_len
%.tmp166 = call i32(i32,i8*,i32) @read(i32 %.tmp163, i8* %.tmp164, i32 %.tmp165)
store i32 %.tmp166, i32* %read_bytes
br label %.for.start.137
.for.end.137:
%.tmp167 = load i32, i32* %content_len
%.tmp168 = sub i32 %.tmp167, 1
%.tmp169 = load i8*, i8** %content
%.tmp170 = getelementptr i8, i8* %.tmp169, i32 %.tmp168
store i8 0, i8* %.tmp170
%.tmp171 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp171)
%.tmp172 = load i8*, i8** %content
ret i8* %.tmp172
}
define void @m1$copy.v.i.i(i32 %.dest.arg, i32 %.src.arg) {
%dest = alloca i32
store i32 %.dest.arg, i32* %dest
%src = alloca i32
store i32 %.src.arg, i32* %src
%buf_size = alloca i32
store i32 4096, i32* %buf_size
%.tmp173 = call i8*(i32) @malloc(i32 4096)
%buf = alloca i8*
store i8* %.tmp173, i8** %buf
%to_write = alloca i32
store i32 1, i32* %to_write
br label %.for.start.174
.for.start.174:
%.tmp175 = load i32, i32* %to_write
%.tmp176 = icmp sgt i32 %.tmp175, 0
br i1 %.tmp176, label %.for.continue.174, label %.for.end.174
.for.continue.174:
%.tmp177 = load i32, i32* %src
%.tmp178 = load i8*, i8** %buf
%.tmp179 = load i32, i32* %buf_size
%.tmp180 = call i32(i32,i8*,i32) @read(i32 %.tmp177, i8* %.tmp178, i32 %.tmp179)
store i32 %.tmp180, i32* %to_write
%.tmp181 = load i32, i32* %dest
%.tmp182 = load i8*, i8** %buf
%.tmp183 = load i32, i32* %to_write
%.tmp184 = call i32(i32,i8*,i32) @write(i32 %.tmp181, i8* %.tmp182, i32 %.tmp183)
br label %.for.start.174
.for.end.174:
ret void
}
define %m0$.File.type* @m1$str_as_file.m0$.File.typep.cp(i8* %.file_content.arg) {
%file_content = alloca i8*
store i8* %.file_content.arg, i8** %file_content
%.tmp185 = call i8*(i32) @malloc(i32 16)
%.tmp186 = bitcast i8* %.tmp185 to i32*
%pp = alloca i32*
store i32* %.tmp186, i32** %pp
%.tmp187 = load i32*, i32** %pp
%.tmp188 = call i32(i32*) @pipe(i32* %.tmp187)
%.tmp189 = load i32, i32* @STDOUT
%.tmp190 = load i32*, i32** %pp
%.tmp191 = getelementptr i32, i32* %.tmp190, i32 %.tmp189
%.tmp192 = load i32, i32* %.tmp191
%.tmp193 = load i8*, i8** %file_content
%.tmp194 = load i8*, i8** %file_content
%.tmp195 = call i32(i8*) @strlen(i8* %.tmp194)
%.tmp196 = call i32(i32,i8*,i32) @write(i32 %.tmp192, i8* %.tmp193, i32 %.tmp195)
%.tmp197 = load i32, i32* @STDOUT
%.tmp198 = load i32*, i32** %pp
%.tmp199 = getelementptr i32, i32* %.tmp198, i32 %.tmp197
%.tmp200 = load i32, i32* %.tmp199
%.tmp201 = call i32(i32) @close(i32 %.tmp200)
%.tmp202 = load i32, i32* @STDIN
%.tmp203 = load i32*, i32** %pp
%.tmp204 = getelementptr i32, i32* %.tmp203, i32 %.tmp202
%.tmp205 = load i32, i32* %.tmp204
%.tmp207 = getelementptr [2 x i8], [2 x i8]*@.str206, i32 0, i32 0
%.tmp208 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp205, i8* %.tmp207)
ret %m0$.File.type* %.tmp208
}
@.str206 = constant [2 x i8] c"r\00"
%m209$.PeekerInfo.type = type {i32,i32,i32,i32,i8,i1,i8*}
@EOF = constant i32 0
define i8 @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.p.arg) {
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.p.arg, %m209$.PeekerInfo.type** %p
%.tmp210 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp211 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp210, i32 0, i32 5
%.tmp212 = load i1, i1* %.tmp211
br i1 %.tmp212, label %.if.true.213, label %.if.false.213
.if.true.213:
ret i8 0
br label %.if.end.213
.if.false.213:
br label %.if.end.213
.if.end.213:
%.tmp214 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp215 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp214, i32 0, i32 4
%.tmp216 = load i8, i8* %.tmp215
%.tmp217 = icmp eq i8 %.tmp216, 10
br i1 %.tmp217, label %.if.true.218, label %.if.false.218
.if.true.218:
%.tmp219 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp220 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp219, i32 0, i32 2
%.tmp221 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp222 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp221, i32 0, i32 2
%.tmp223 = load i32, i32* %.tmp222
%.tmp224 = add i32 %.tmp223, 1
store i32 %.tmp224, i32* %.tmp220
%.tmp225 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp226 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp225, i32 0, i32 3
store i32 0, i32* %.tmp226
br label %.if.end.218
.if.false.218:
br label %.if.end.218
.if.end.218:
%.tmp227 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp228 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp227, i32 0, i32 1
%.tmp229 = load i32, i32* %.tmp228
%.tmp230 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp231 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp230, i32 0, i32 4
%.tmp232 = getelementptr i8, i8* %.tmp231, i32 0
%.tmp233 = call i32(i32,i8*,i32) @read(i32 %.tmp229, i8* %.tmp232, i32 1)
%.tmp234 = icmp eq i32 %.tmp233, 0
br i1 %.tmp234, label %.if.true.235, label %.if.false.235
.if.true.235:
%.tmp236 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp237 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp236, i32 0, i32 4
store i8 0, i8* %.tmp237
%.tmp238 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp239 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp238, i32 0, i32 5
store i1 1, i1* %.tmp239
%.tmp240 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp241 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp240, i32 0, i32 4
%.tmp242 = load i8, i8* %.tmp241
ret i8 %.tmp242
br label %.if.end.235
.if.false.235:
br label %.if.end.235
.if.end.235:
%.tmp243 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp244 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp243, i32 0, i32 3
%.tmp245 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp246 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp245, i32 0, i32 3
%.tmp247 = load i32, i32* %.tmp246
%.tmp248 = add i32 %.tmp247, 1
store i32 %.tmp248, i32* %.tmp244
%.tmp249 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp250 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp249, i32 0, i32 0
%.tmp251 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp252 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp251, i32 0, i32 0
%.tmp253 = load i32, i32* %.tmp252
%.tmp254 = add i32 %.tmp253, 1
store i32 %.tmp254, i32* %.tmp250
%.tmp255 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp256 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp255, i32 0, i32 4
%.tmp257 = load i8, i8* %.tmp256
ret i8 %.tmp257
}
define void @m209$seek.v.m209$.PeekerInfo.typep.i(%m209$.PeekerInfo.type* %.p.arg, i32 %.pos.arg) {
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.p.arg, %m209$.PeekerInfo.type** %p
%pos = alloca i32
store i32 %.pos.arg, i32* %pos
%.tmp258 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp259 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp258, i32 0, i32 1
%.tmp260 = load i32, i32* %.tmp259
%.tmp261 = load i32, i32* %pos
%.tmp262 = load i32, i32* @SEEK_SET
%.tmp263 = call i32(i32,i32,i32) @lseek(i32 %.tmp260, i32 %.tmp261, i32 %.tmp262)
ret void
}
define %m209$.PeekerInfo.type* @m209$new.m209$.PeekerInfo.typep.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%.tmp264 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* null, i32 1
%.tmp265 = ptrtoint %m209$.PeekerInfo.type* %.tmp264 to i32
%.tmp266 = call i8*(i32) @malloc(i32 %.tmp265)
%.tmp267 = bitcast i8* %.tmp266 to %m209$.PeekerInfo.type*
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp267, %m209$.PeekerInfo.type** %p
%.tmp268 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp269 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp268, i32 0, i32 0
store i32 0, i32* %.tmp269
%.tmp270 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp271 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp270, i32 0, i32 2
store i32 1, i32* %.tmp271
%.tmp272 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp273 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp272, i32 0, i32 3
store i32 0, i32* %.tmp273
%.tmp274 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp275 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp274, i32 0, i32 1
%.tmp276 = load i32, i32* %fd
store i32 %.tmp276, i32* %.tmp275
%.tmp277 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp278 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp277, i32 0, i32 4
store i8 0, i8* %.tmp278
%.tmp279 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp280 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp279, i32 0, i32 5
store i1 0, i1* %.tmp280
%.tmp281 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp282 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp281, i32 0, i32 6
%.tmp284 = getelementptr [1 x i8], [1 x i8]*@.str283, i32 0, i32 0
store i8* %.tmp284, i8** %.tmp282
%.tmp285 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
ret %m209$.PeekerInfo.type* %.tmp285
}
@.str283 = constant [1 x i8] c"\00"
%m287$.Token.type = type {i8*,i8*,i32,i32,i8*,%m287$.Token.type*,%m287$.Token.type*}
%m287$.ParseCtx.type = type {i8*,i32,i32,%m287$.Token.type*,%m287$.Token.type*}
define %m287$.Token.type* @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.c.arg, i8* %.type.arg, i8* %.value.arg) {
%c = alloca %m287$.ParseCtx.type*
store %m287$.ParseCtx.type* %.c.arg, %m287$.ParseCtx.type** %c
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp288 = getelementptr %m287$.Token.type, %m287$.Token.type* null, i32 1
%.tmp289 = ptrtoint %m287$.Token.type* %.tmp288 to i32
%.tmp290 = call i8*(i32) @malloc(i32 %.tmp289)
%.tmp291 = bitcast i8* %.tmp290 to %m287$.Token.type*
%root = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp291, %m287$.Token.type** %root
%.tmp292 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp293 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp292, i32 0, i32 0
%.tmp294 = load i8*, i8** %type
store i8* %.tmp294, i8** %.tmp293
%.tmp295 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp296 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp295, i32 0, i32 1
%.tmp297 = load i8*, i8** %value
store i8* %.tmp297, i8** %.tmp296
%.tmp298 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp299 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp298, i32 0, i32 4
%.tmp300 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp301 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp300, i32 0, i32 0
%.tmp302 = load i8*, i8** %.tmp301
store i8* %.tmp302, i8** %.tmp299
%.tmp303 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp304 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp303, i32 0, i32 2
%.tmp305 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp306 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp305, i32 0, i32 1
%.tmp307 = load i32, i32* %.tmp306
store i32 %.tmp307, i32* %.tmp304
%.tmp308 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp309 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp308, i32 0, i32 3
%.tmp310 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp311 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp310, i32 0, i32 2
%.tmp312 = load i32, i32* %.tmp311
store i32 %.tmp312, i32* %.tmp309
%.tmp313 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp314 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp313, i32 0, i32 6
%.tmp315 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp316 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp315, i32 0, i32 4
%.tmp317 = load %m287$.Token.type*, %m287$.Token.type** %.tmp316
store %m287$.Token.type* %.tmp317, %m287$.Token.type** %.tmp314
%.tmp318 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp319 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp318, i32 0, i32 5
store %m287$.Token.type* null, %m287$.Token.type** %.tmp319
%.tmp320 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp321 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp320, i32 0, i32 4
%.tmp322 = load %m287$.Token.type*, %m287$.Token.type** %.tmp321
%.tmp323 = icmp ne %m287$.Token.type* %.tmp322, null
br i1 %.tmp323, label %.if.true.324, label %.if.false.324
.if.true.324:
%.tmp325 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp326 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp325, i32 0, i32 4
%.tmp327 = load %m287$.Token.type*, %m287$.Token.type** %.tmp326
%.tmp328 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp327, i32 0, i32 5
%.tmp329 = load %m287$.Token.type*, %m287$.Token.type** %root
store %m287$.Token.type* %.tmp329, %m287$.Token.type** %.tmp328
br label %.if.end.324
.if.false.324:
br label %.if.end.324
.if.end.324:
%.tmp330 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp331 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp330, i32 0, i32 4
%.tmp332 = load %m287$.Token.type*, %m287$.Token.type** %root
store %m287$.Token.type* %.tmp332, %m287$.Token.type** %.tmp331
%.tmp333 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp334 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp333, i32 0, i32 3
%.tmp335 = load %m287$.Token.type*, %m287$.Token.type** %.tmp334
%.tmp336 = icmp eq %m287$.Token.type* %.tmp335, null
br i1 %.tmp336, label %.if.true.337, label %.if.false.337
.if.true.337:
%.tmp338 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %c
%.tmp339 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp338, i32 0, i32 3
%.tmp340 = load %m287$.Token.type*, %m287$.Token.type** %root
store %m287$.Token.type* %.tmp340, %m287$.Token.type** %.tmp339
br label %.if.end.337
.if.false.337:
br label %.if.end.337
.if.end.337:
%.tmp341 = load %m287$.Token.type*, %m287$.Token.type** %root
ret %m287$.Token.type* %.tmp341
}
define %m287$.Token.type* @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.p.arg, i1 %.keep_comments.arg) {
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.p.arg, %m209$.PeekerInfo.type** %p
%keep_comments = alloca i1
store i1 %.keep_comments.arg, i1* %keep_comments
%.tmp342 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* null, i32 1
%.tmp343 = ptrtoint %m287$.ParseCtx.type* %.tmp342 to i32
%.tmp344 = call i8*(i32) @malloc(i32 %.tmp343)
%.tmp345 = bitcast i8* %.tmp344 to %m287$.ParseCtx.type*
%ctx = alloca %m287$.ParseCtx.type*
store %m287$.ParseCtx.type* %.tmp345, %m287$.ParseCtx.type** %ctx
%.tmp346 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp347 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp346, i32 0, i32 0
%.tmp348 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp349 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp348, i32 0, i32 6
%.tmp350 = load i8*, i8** %.tmp349
store i8* %.tmp350, i8** %.tmp347
%.tmp351 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp352 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp351, i32 0, i32 3
store %m287$.Token.type* null, %m287$.Token.type** %.tmp352
%.tmp353 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp354 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp353, i32 0, i32 4
store %m287$.Token.type* null, %m287$.Token.type** %.tmp354
%max_token_size = alloca i32
store i32 128, i32* %max_token_size
%.tmp355 = bitcast ptr null to i8*
%buf = alloca i8*
store i8* %.tmp355, i8** %buf
%idx = alloca i32
store i32 0, i32* %idx
%.tmp356 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp357 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp356)
%c = alloca i8
store i8 %.tmp357, i8* %c
br label %.for.start.358
.for.start.358:
%.tmp359 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp360 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp359, i32 0, i32 5
%.tmp361 = load i1, i1* %.tmp360
%.tmp362 = icmp eq i1 %.tmp361, 0
br i1 %.tmp362, label %.for.continue.358, label %.for.end.358
.for.continue.358:
%.tmp363 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp364 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp363, i32 0, i32 1
%.tmp365 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp366 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp365, i32 0, i32 2
%.tmp367 = load i32, i32* %.tmp366
store i32 %.tmp367, i32* %.tmp364
%.tmp368 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp369 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp368, i32 0, i32 2
%.tmp370 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp371 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp370, i32 0, i32 3
%.tmp372 = load i32, i32* %.tmp371
store i32 %.tmp372, i32* %.tmp369
%.tmp373 = load i8, i8* %c
%.tmp374 = icmp eq i8 %.tmp373, 0
br i1 %.tmp374, label %.if.true.375, label %.if.false.375
.if.true.375:
%.tmp376 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp377 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp376)
store i8 %.tmp377, i8* %c
br label %.if.end.375
.if.false.375:
%.tmp378 = load i8, i8* %c
%.tmp379 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp378)
br i1 %.tmp379, label %.if.true.380, label %.if.false.380
.if.true.380:
%.tmp381 = load i32, i32* %max_token_size
%.tmp382 = call i8*(i32) @malloc(i32 %.tmp381)
store i8* %.tmp382, i8** %buf
store i32 0, i32* %idx
br label %.for.start.383
.for.start.383:
%.tmp384 = load i8, i8* %c
%.tmp385 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp384)
br i1 %.tmp385, label %.for.continue.383, label %.for.end.383
.for.continue.383:
%.tmp386 = load i32, i32* %idx
%.tmp387 = load i8*, i8** %buf
%.tmp388 = getelementptr i8, i8* %.tmp387, i32 %.tmp386
%.tmp389 = load i8, i8* %c
store i8 %.tmp389, i8* %.tmp388
%.tmp390 = load i32, i32* %idx
%.tmp391 = add i32 %.tmp390, 1
store i32 %.tmp391, i32* %idx
%.tmp392 = load i32, i32* %idx
%.tmp393 = load i32, i32* %max_token_size
%.tmp394 = icmp slt i32 %.tmp392, %.tmp393
%.tmp396 = getelementptr [16 x i8], [16 x i8]*@.str395, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp394, i8* %.tmp396)
%.tmp397 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp398 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp397)
store i8 %.tmp398, i8* %c
br label %.for.start.383
.for.end.383:
%.tmp399 = load i32, i32* %idx
%.tmp400 = load i8*, i8** %buf
%.tmp401 = getelementptr i8, i8* %.tmp400, i32 %.tmp399
store i8 0, i8* %.tmp401
%.tmp402 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp404 = getelementptr [7 x i8], [7 x i8]*@.str403, i32 0, i32 0
%.tmp405 = load i8*, i8** %buf
%.tmp406 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp402, i8* %.tmp404, i8* %.tmp405)
br label %.if.end.380
.if.false.380:
%.tmp407 = load i8, i8* %c
%.tmp408 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp407)
%.tmp409 = load i8, i8* %c
%.tmp410 = icmp eq i8 %.tmp409, 95
%.tmp411 = or i1 %.tmp408, %.tmp410
br i1 %.tmp411, label %.if.true.412, label %.if.false.412
.if.true.412:
%.tmp413 = load i32, i32* %max_token_size
%.tmp414 = call i8*(i32) @malloc(i32 %.tmp413)
store i8* %.tmp414, i8** %buf
store i32 0, i32* %idx
br label %.for.start.415
.for.start.415:
%.tmp416 = load i8, i8* %c
%.tmp417 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp416)
%.tmp418 = load i8, i8* %c
%.tmp419 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp418)
%.tmp420 = or i1 %.tmp417, %.tmp419
%.tmp421 = load i8, i8* %c
%.tmp422 = icmp eq i8 %.tmp421, 95
%.tmp423 = or i1 %.tmp420, %.tmp422
br i1 %.tmp423, label %.for.continue.415, label %.for.end.415
.for.continue.415:
%.tmp424 = load i32, i32* %idx
%.tmp425 = load i8*, i8** %buf
%.tmp426 = getelementptr i8, i8* %.tmp425, i32 %.tmp424
%.tmp427 = load i8, i8* %c
store i8 %.tmp427, i8* %.tmp426
%.tmp428 = load i32, i32* %idx
%.tmp429 = add i32 %.tmp428, 1
store i32 %.tmp429, i32* %idx
%.tmp430 = load i32, i32* %idx
%.tmp431 = load i32, i32* %max_token_size
%.tmp432 = icmp slt i32 %.tmp430, %.tmp431
%.tmp434 = getelementptr [16 x i8], [16 x i8]*@.str433, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp432, i8* %.tmp434)
%.tmp435 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp436 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp435)
store i8 %.tmp436, i8* %c
br label %.for.start.415
.for.end.415:
%.tmp437 = load i32, i32* %idx
%.tmp438 = load i8*, i8** %buf
%.tmp439 = getelementptr i8, i8* %.tmp438, i32 %.tmp437
store i8 0, i8* %.tmp439
%.tmp440 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp442 = getelementptr [5 x i8], [5 x i8]*@.str441, i32 0, i32 0
%.tmp443 = load i8*, i8** %buf
%.tmp444 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp440, i8* %.tmp442, i8* %.tmp443)
br label %.if.end.412
.if.false.412:
%.tmp445 = load i8, i8* %c
%.tmp446 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp445)
br i1 %.tmp446, label %.if.true.447, label %.if.false.447
.if.true.447:
%.tmp448 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp449 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp448)
store i8 %.tmp449, i8* %c
br label %.if.end.447
.if.false.447:
%.tmp450 = load i8, i8* %c
%.tmp451 = icmp eq i8 %.tmp450, 34
%.tmp452 = load i8, i8* %c
%.tmp453 = icmp eq i8 %.tmp452, 96
%.tmp454 = or i1 %.tmp451, %.tmp453
br i1 %.tmp454, label %.if.true.455, label %.if.false.455
.if.true.455:
%.tmp456 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp457 = load i8, i8* %c
%.tmp458 = call i8*(%m209$.PeekerInfo.type*,i8) @m287$read_string.cp.m209$.PeekerInfo.typep.c(%m209$.PeekerInfo.type* %.tmp456, i8 %.tmp457)
store i8* %.tmp458, i8** %buf
%.tmp459 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp460 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp459)
store i8 %.tmp460, i8* %c
%.tmp461 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp463 = getelementptr [7 x i8], [7 x i8]*@.str462, i32 0, i32 0
%.tmp464 = load i8*, i8** %buf
%.tmp465 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp461, i8* %.tmp463, i8* %.tmp464)
br label %.if.end.455
.if.false.455:
%.tmp466 = load i8, i8* %c
%.tmp467 = icmp eq i8 %.tmp466, 39
br i1 %.tmp467, label %.if.true.468, label %.if.false.468
.if.true.468:
%.tmp469 = load i32, i32* %max_token_size
%.tmp470 = call i8*(i32) @malloc(i32 %.tmp469)
store i8* %.tmp470, i8** %buf
%.tmp471 = load i8*, i8** %buf
%.tmp472 = getelementptr i8, i8* %.tmp471, i32 0
%.tmp473 = load i8, i8* %c
store i8 %.tmp473, i8* %.tmp472
%.tmp474 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp475 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp474)
store i8 %.tmp475, i8* %c
store i32 1, i32* %idx
br label %.for.start.476
.for.start.476:
%.tmp477 = load i8, i8* %c
%.tmp478 = icmp ne i8 %.tmp477, 39
br i1 %.tmp478, label %.for.continue.476, label %.for.end.476
.for.continue.476:
%.tmp479 = load i32, i32* %idx
%.tmp480 = load i32, i32* %max_token_size
%.tmp481 = sub i32 %.tmp480, 2
%.tmp482 = icmp slt i32 %.tmp479, %.tmp481
%.tmp484 = getelementptr [15 x i8], [15 x i8]*@.str483, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp482, i8* %.tmp484)
%.tmp485 = load i32, i32* %idx
%.tmp486 = load i8*, i8** %buf
%.tmp487 = getelementptr i8, i8* %.tmp486, i32 %.tmp485
%.tmp488 = load i8, i8* %c
store i8 %.tmp488, i8* %.tmp487
%.tmp489 = load i32, i32* %idx
%.tmp490 = add i32 %.tmp489, 1
store i32 %.tmp490, i32* %idx
%.tmp491 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp492 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp491)
store i8 %.tmp492, i8* %c
br label %.for.start.476
.for.end.476:
%.tmp493 = load i32, i32* %idx
%.tmp494 = load i8*, i8** %buf
%.tmp495 = getelementptr i8, i8* %.tmp494, i32 %.tmp493
%.tmp496 = load i8, i8* %c
store i8 %.tmp496, i8* %.tmp495
%.tmp497 = load i32, i32* %idx
%.tmp498 = add i32 %.tmp497, 1
%.tmp499 = load i8*, i8** %buf
%.tmp500 = getelementptr i8, i8* %.tmp499, i32 %.tmp498
store i8 0, i8* %.tmp500
%.tmp501 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp502 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp501)
store i8 %.tmp502, i8* %c
%.tmp503 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp505 = getelementptr [4 x i8], [4 x i8]*@.str504, i32 0, i32 0
%.tmp506 = load i8*, i8** %buf
%.tmp507 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp503, i8* %.tmp505, i8* %.tmp506)
br label %.if.end.468
.if.false.468:
%.tmp508 = load i8, i8* %c
%.tmp509 = icmp eq i8 %.tmp508, 10
br i1 %.tmp509, label %.if.true.510, label %.if.false.510
.if.true.510:
%.tmp511 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp513 = getelementptr [3 x i8], [3 x i8]*@.str512, i32 0, i32 0
%.tmp515 = getelementptr [2 x i8], [2 x i8]*@.str514, i32 0, i32 0
%.tmp516 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp511, i8* %.tmp513, i8* %.tmp515)
%.tmp517 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp518 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp517)
store i8 %.tmp518, i8* %c
br label %.if.end.510
.if.false.510:
%.tmp519 = load i8, i8* %c
%.tmp520 = icmp eq i8 %.tmp519, 45
br i1 %.tmp520, label %.if.true.521, label %.if.false.521
.if.true.521:
%.tmp522 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp523 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp522)
store i8 %.tmp523, i8* %c
%.tmp524 = load i8, i8* %c
%.tmp525 = icmp eq i8 %.tmp524, 45
br i1 %.tmp525, label %.if.true.526, label %.if.false.526
.if.true.526:
%.tmp527 = load i32, i32* %max_token_size
%.tmp528 = call i8*(i32) @malloc(i32 %.tmp527)
store i8* %.tmp528, i8** %buf
%.tmp529 = load i8*, i8** %buf
%.tmp530 = getelementptr i8, i8* %.tmp529, i32 0
store i8 45, i8* %.tmp530
store i32 1, i32* %idx
br label %.for.start.531
.for.start.531:
%.tmp532 = load i8, i8* %c
%.tmp533 = icmp ne i8 %.tmp532, 10
%.tmp534 = load i8, i8* %c
%.tmp535 = icmp ne i8 %.tmp534, 0
%.tmp536 = and i1 %.tmp533, %.tmp535
br i1 %.tmp536, label %.for.continue.531, label %.for.end.531
.for.continue.531:
%.tmp537 = load i32, i32* %idx
%.tmp538 = load i8*, i8** %buf
%.tmp539 = getelementptr i8, i8* %.tmp538, i32 %.tmp537
%.tmp540 = load i8, i8* %c
store i8 %.tmp540, i8* %.tmp539
%.tmp541 = load i32, i32* %idx
%.tmp542 = add i32 %.tmp541, 1
store i32 %.tmp542, i32* %idx
%.tmp543 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp544 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp543)
store i8 %.tmp544, i8* %c
br label %.for.start.531
.for.end.531:
%.tmp545 = load i32, i32* %idx
%.tmp546 = load i8*, i8** %buf
%.tmp547 = getelementptr i8, i8* %.tmp546, i32 %.tmp545
store i8 0, i8* %.tmp547
%.tmp548 = load i1, i1* %keep_comments
br i1 %.tmp548, label %.if.true.549, label %.if.false.549
.if.true.549:
%.tmp550 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp552 = getelementptr [8 x i8], [8 x i8]*@.str551, i32 0, i32 0
%.tmp553 = load i8*, i8** %buf
%.tmp554 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp550, i8* %.tmp552, i8* %.tmp553)
br label %.if.end.549
.if.false.549:
%.tmp555 = load i8*, i8** %buf
%.tmp556 = bitcast i8* %.tmp555 to i8*
call void(i8*) @free(i8* %.tmp556)
br label %.if.end.549
.if.end.549:
br label %.if.end.526
.if.false.526:
%.tmp557 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp559 = getelementptr [9 x i8], [9 x i8]*@.str558, i32 0, i32 0
%.tmp561 = getelementptr [2 x i8], [2 x i8]*@.str560, i32 0, i32 0
%.tmp562 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp557, i8* %.tmp559, i8* %.tmp561)
br label %.if.end.526
.if.end.526:
br label %.if.end.521
.if.false.521:
%.tmp563 = load i8, i8* %c
%.tmp564 = icmp sgt i8 %.tmp563, 126
br i1 %.tmp564, label %.if.true.565, label %.if.false.565
.if.true.565:
%.tmp567 = getelementptr [47 x i8], [47 x i8]*@.str566, i32 0, i32 0
%.tmp568 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp569 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp568, i32 0, i32 1
%.tmp570 = load i32, i32* %.tmp569
%.tmp571 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp572 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp571, i32 0, i32 2
%.tmp573 = load i32, i32* %.tmp572
%.tmp574 = load i8, i8* %c
%.tmp575 = load i8, i8* %c
%.tmp576 = call i32(i8*,...) @printf(i8* %.tmp567, i32 %.tmp570, i32 %.tmp573, i8 %.tmp574, i8 %.tmp575)
call void(i32) @exit(i32 1)
br label %.if.end.565
.if.false.565:
br label %.if.end.565
.if.end.565:
%.tmp577 = load i8, i8* %c
%prev_c = alloca i8
store i8 %.tmp577, i8* %prev_c
%.tmp578 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp579 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp578)
store i8 %.tmp579, i8* %c
%.tmp581 = getelementptr [9 x i8], [9 x i8]*@.str580, i32 0, i32 0
%type = alloca i8*
store i8* %.tmp581, i8** %type
%.tmp582 = load i8, i8* %prev_c
%.tmp583 = icmp eq i8 %.tmp582, 61
%.tmp584 = load i8, i8* %c
%.tmp585 = icmp eq i8 %.tmp584, 61
%.tmp586 = and i1 %.tmp583, %.tmp585
br i1 %.tmp586, label %.if.true.587, label %.if.false.587
.if.true.587:
%.tmp588 = getelementptr i8*, i8** %buf, i32 0
%.tmp590 = getelementptr [3 x i8], [3 x i8]*@.str589, i32 0, i32 0
%.tmp591 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp588, i8* %.tmp590)
%.tmp592 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp593 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp592)
store i8 %.tmp593, i8* %c
br label %.if.end.587
.if.false.587:
%.tmp594 = load i8, i8* %prev_c
%.tmp595 = icmp eq i8 %.tmp594, 33
%.tmp596 = load i8, i8* %c
%.tmp597 = icmp eq i8 %.tmp596, 61
%.tmp598 = and i1 %.tmp595, %.tmp597
br i1 %.tmp598, label %.if.true.599, label %.if.false.599
.if.true.599:
%.tmp600 = getelementptr i8*, i8** %buf, i32 0
%.tmp602 = getelementptr [3 x i8], [3 x i8]*@.str601, i32 0, i32 0
%.tmp603 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp600, i8* %.tmp602)
%.tmp604 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp605 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp604)
store i8 %.tmp605, i8* %c
br label %.if.end.599
.if.false.599:
%.tmp606 = load i8, i8* %prev_c
%.tmp607 = icmp eq i8 %.tmp606, 62
%.tmp608 = load i8, i8* %c
%.tmp609 = icmp eq i8 %.tmp608, 61
%.tmp610 = and i1 %.tmp607, %.tmp609
br i1 %.tmp610, label %.if.true.611, label %.if.false.611
.if.true.611:
%.tmp612 = getelementptr i8*, i8** %buf, i32 0
%.tmp614 = getelementptr [3 x i8], [3 x i8]*@.str613, i32 0, i32 0
%.tmp615 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp612, i8* %.tmp614)
%.tmp616 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp617 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp616)
store i8 %.tmp617, i8* %c
br label %.if.end.611
.if.false.611:
%.tmp618 = load i8, i8* %prev_c
%.tmp619 = icmp eq i8 %.tmp618, 60
%.tmp620 = load i8, i8* %c
%.tmp621 = icmp eq i8 %.tmp620, 61
%.tmp622 = and i1 %.tmp619, %.tmp621
br i1 %.tmp622, label %.if.true.623, label %.if.false.623
.if.true.623:
%.tmp624 = getelementptr i8*, i8** %buf, i32 0
%.tmp626 = getelementptr [3 x i8], [3 x i8]*@.str625, i32 0, i32 0
%.tmp627 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp624, i8* %.tmp626)
%.tmp628 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp629 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp628)
store i8 %.tmp629, i8* %c
br label %.if.end.623
.if.false.623:
%.tmp630 = load i8, i8* %prev_c
%.tmp631 = icmp eq i8 %.tmp630, 46
%.tmp632 = load i8, i8* %c
%.tmp633 = icmp eq i8 %.tmp632, 46
%.tmp634 = and i1 %.tmp631, %.tmp633
br i1 %.tmp634, label %.if.true.635, label %.if.false.635
.if.true.635:
%.tmp636 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp637 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp636)
store i8 %.tmp637, i8* %c
%.tmp638 = load i8, i8* %c
%.tmp639 = icmp ne i8 %.tmp638, 46
br i1 %.tmp639, label %.if.true.640, label %.if.false.640
.if.true.640:
%.tmp642 = getelementptr [13 x i8], [13 x i8]*@.str641, i32 0, i32 0
%.tmp643 = call i32(i8*,...) @printf(i8* %.tmp642)
call void(i32) @exit(i32 1)
br label %.if.end.640
.if.false.640:
%.tmp644 = getelementptr i8*, i8** %buf, i32 0
%.tmp646 = getelementptr [4 x i8], [4 x i8]*@.str645, i32 0, i32 0
%.tmp647 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp644, i8* %.tmp646)
%.tmp649 = getelementptr [8 x i8], [8 x i8]*@.str648, i32 0, i32 0
store i8* %.tmp649, i8** %type
br label %.if.end.640
.if.end.640:
%.tmp650 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp651 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp650)
store i8 %.tmp651, i8* %c
br label %.if.end.635
.if.false.635:
%.tmp652 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp652, i8** %buf
%.tmp653 = load i8*, i8** %buf
%.tmp654 = getelementptr i8, i8* %.tmp653, i32 0
%.tmp655 = load i8, i8* %prev_c
store i8 %.tmp655, i8* %.tmp654
%.tmp656 = load i8*, i8** %buf
%.tmp657 = getelementptr i8, i8* %.tmp656, i32 1
store i8 0, i8* %.tmp657
br label %.if.end.635
.if.end.635:
br label %.if.end.623
.if.end.623:
br label %.if.end.611
.if.end.611:
br label %.if.end.599
.if.end.599:
br label %.if.end.587
.if.end.587:
%.tmp658 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp659 = load i8*, i8** %type
%.tmp660 = load i8*, i8** %buf
%.tmp661 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp658, i8* %.tmp659, i8* %.tmp660)
br label %.if.end.521
.if.end.521:
br label %.if.end.510
.if.end.510:
br label %.if.end.468
.if.end.468:
br label %.if.end.455
.if.end.455:
br label %.if.end.447
.if.end.447:
br label %.if.end.412
.if.end.412:
br label %.if.end.380
.if.end.380:
br label %.if.end.375
.if.end.375:
br label %.for.start.358
.for.end.358:
%.tmp662 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp664 = getelementptr [4 x i8], [4 x i8]*@.str663, i32 0, i32 0
%.tmp666 = getelementptr [1 x i8], [1 x i8]*@.str665, i32 0, i32 0
%.tmp667 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp662, i8* %.tmp664, i8* %.tmp666)
%.tmp668 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp669 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp668, i32 0, i32 3
%.tmp670 = load %m287$.Token.type*, %m287$.Token.type** %.tmp669
%root = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp670, %m287$.Token.type** %root
%.tmp671 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp672 = bitcast %m287$.ParseCtx.type* %.tmp671 to i8*
call void(i8*) @free(i8* %.tmp672)
%.tmp673 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp674 = bitcast %m287$.Token.type* %.tmp673 to %m287$.Token.type*
ret %m287$.Token.type* %.tmp674
}
define i8* @m287$read_string.cp.m209$.PeekerInfo.typep.c(%m209$.PeekerInfo.type* %.p.arg, i8 %.delimeter.arg) {
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.p.arg, %m209$.PeekerInfo.type** %p
%delimeter = alloca i8
store i8 %.delimeter.arg, i8* %delimeter
%str_size = alloca i32
store i32 64, i32* %str_size
%.tmp675 = load i32, i32* %str_size
%.tmp676 = call i8*(i32) @malloc(i32 %.tmp675)
%buf = alloca i8*
store i8* %.tmp676, i8** %buf
%.tmp677 = load i8*, i8** %buf
%.tmp678 = getelementptr i8, i8* %.tmp677, i32 0
%.tmp679 = load i8, i8* %delimeter
store i8 %.tmp679, i8* %.tmp678
%.tmp680 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp681 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp680)
%c = alloca i8
store i8 %.tmp681, i8* %c
%idx = alloca i32
store i32 1, i32* %idx
br label %.for.start.682
.for.start.682:
%.tmp683 = load i8, i8* %c
%.tmp684 = load i8, i8* %delimeter
%.tmp685 = icmp ne i8 %.tmp683, %.tmp684
br i1 %.tmp685, label %.for.continue.682, label %.for.end.682
.for.continue.682:
%.tmp686 = load i8, i8* %c
%.tmp687 = icmp ne i8 %.tmp686, 0
%.tmp689 = getelementptr [61 x i8], [61 x i8]*@.str688, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp687, i8* %.tmp689)
%.tmp690 = load i32, i32* %idx
%.tmp691 = load i32, i32* %str_size
%.tmp692 = sub i32 %.tmp691, 2
%.tmp693 = icmp eq i32 %.tmp690, %.tmp692
br i1 %.tmp693, label %.if.true.694, label %.if.false.694
.if.true.694:
%.tmp695 = load i32, i32* %str_size
%.tmp696 = mul i32 %.tmp695, 2
store i32 %.tmp696, i32* %str_size
%.tmp697 = load i8*, i8** %buf
%.tmp698 = load i32, i32* %str_size
%.tmp699 = call i8*(i8*,i32) @realloc(i8* %.tmp697, i32 %.tmp698)
store i8* %.tmp699, i8** %buf
br label %.if.end.694
.if.false.694:
br label %.if.end.694
.if.end.694:
%.tmp700 = load i32, i32* %idx
%.tmp701 = load i8*, i8** %buf
%.tmp702 = getelementptr i8, i8* %.tmp701, i32 %.tmp700
%.tmp703 = load i8, i8* %c
store i8 %.tmp703, i8* %.tmp702
%.tmp704 = load i32, i32* %idx
%.tmp705 = add i32 %.tmp704, 1
store i32 %.tmp705, i32* %idx
%.tmp706 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp707 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp706)
store i8 %.tmp707, i8* %c
br label %.for.start.682
.for.end.682:
%.tmp708 = load i32, i32* %idx
%.tmp709 = load i8*, i8** %buf
%.tmp710 = getelementptr i8, i8* %.tmp709, i32 %.tmp708
%.tmp711 = load i8, i8* %c
store i8 %.tmp711, i8* %.tmp710
%.tmp712 = load i32, i32* %idx
%.tmp713 = add i32 %.tmp712, 1
%.tmp714 = load i8*, i8** %buf
%.tmp715 = getelementptr i8, i8* %.tmp714, i32 %.tmp713
store i8 0, i8* %.tmp715
%.tmp716 = load i8*, i8** %buf
ret i8* %.tmp716
}
@.str395 = constant [16 x i8] c"digit too large\00"
@.str403 = constant [7 x i8] c"NUMBER\00"
@.str433 = constant [16 x i8] c"digit too large\00"
@.str441 = constant [5 x i8] c"WORD\00"
@.str462 = constant [7 x i8] c"STRING\00"
@.str483 = constant [15 x i8] c"char too large\00"
@.str504 = constant [4 x i8] c"CHR\00"
@.str512 = constant [3 x i8] c"NL\00"
@.str514 = constant [2 x i8] c"\0A\00"
@.str551 = constant [8 x i8] c"COMMENT\00"
@.str558 = constant [9 x i8] c"OPERATOR\00"
@.str560 = constant [2 x i8] c"-\00"
@.str566 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str580 = constant [9 x i8] c"OPERATOR\00"
@.str589 = constant [3 x i8] c"==\00"
@.str601 = constant [3 x i8] c"!=\00"
@.str613 = constant [3 x i8] c">=\00"
@.str625 = constant [3 x i8] c"<=\00"
@.str641 = constant [13 x i8] c"error on ..\0A\00"
@.str645 = constant [4 x i8] c"...\00"
@.str648 = constant [8 x i8] c"KEYWORD\00"
@.str663 = constant [4 x i8] c"EOF\00"
@.str665 = constant [1 x i8] c"\00"
@.str688 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
%m717$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m717$.Error.type* @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp718 = bitcast ptr null to i8*
%.tmp719 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp720 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp719, i32 0, i32 2
%.tmp721 = load i32, i32* %.tmp720
%.tmp722 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp723 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp722, i32 0, i32 3
%.tmp724 = load i32, i32* %.tmp723
%.tmp725 = load i8*, i8** %message
%.tmp726 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp718, i32 %.tmp721, i32 %.tmp724, i8* %.tmp725)
ret %m717$.Error.type* %.tmp726
}
define %m717$.Error.type* @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%line = alloca i32
store i32 %.line.arg, i32* %line
%char_of_line = alloca i32
store i32 %.char_of_line.arg, i32* %char_of_line
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp727 = load i32, i32* @Error_size
%.tmp728 = call i8*(i32) @malloc(i32 %.tmp727)
%.tmp729 = bitcast i8* %.tmp728 to %m717$.Error.type*
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp729, %m717$.Error.type** %e
%.tmp730 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp731 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp730, i32 0, i32 0
%.tmp732 = load i32, i32* %line
store i32 %.tmp732, i32* %.tmp731
%.tmp733 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp734 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp733, i32 0, i32 1
%.tmp735 = load i32, i32* %char_of_line
store i32 %.tmp735, i32* %.tmp734
%.tmp736 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp737 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp736, i32 0, i32 3
%.tmp738 = load i8*, i8** %message
store i8* %.tmp738, i8** %.tmp737
%.tmp739 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp740 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp739, i32 0, i32 2
%.tmp741 = load i8*, i8** %filename
store i8* %.tmp741, i8** %.tmp740
%.tmp742 = load %m717$.Error.type*, %m717$.Error.type** %e
ret %m717$.Error.type* %.tmp742
}
define void @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.e.arg) {
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp744 = getelementptr [22 x i8], [22 x i8]*@.str743, i32 0, i32 0
%.tmp745 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp746 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp745, i32 0, i32 2
%.tmp747 = load i8*, i8** %.tmp746
%.tmp748 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp749 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp748, i32 0, i32 0
%.tmp750 = load i32, i32* %.tmp749
%.tmp751 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp752 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp751, i32 0, i32 1
%.tmp753 = load i32, i32* %.tmp752
%.tmp754 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp755 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp754, i32 0, i32 3
%.tmp756 = load i8*, i8** %.tmp755
%.tmp757 = call i32(i8*,...) @printf(i8* %.tmp744, i8* %.tmp747, i32 %.tmp750, i32 %.tmp753, i8* %.tmp756)
ret void
}
define void @m717$freport.v.m0$.File.typep.m717$.Error.typep(%m0$.File.type* %.fd.arg, %m717$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp758 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp760 = getelementptr [22 x i8], [22 x i8]*@.str759, i32 0, i32 0
%.tmp761 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp762 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp761, i32 0, i32 2
%.tmp763 = load i8*, i8** %.tmp762
%.tmp764 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp765 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp764, i32 0, i32 0
%.tmp766 = load i32, i32* %.tmp765
%.tmp767 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp768 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp767, i32 0, i32 1
%.tmp769 = load i32, i32* %.tmp768
%.tmp770 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp771 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp770, i32 0, i32 3
%.tmp772 = load i8*, i8** %.tmp771
%.tmp773 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp758, i8* %.tmp760, i8* %.tmp763, i32 %.tmp766, i32 %.tmp769, i8* %.tmp772)
ret void
}
@.str743 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str759 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
%m286$.Query.type = type {i8,i8*,%m286$.Query.type*}
@Query_size = constant i32 24
%m286$.Matcher.type = type {%m286$.Query.type*,i8,%m286$.Matcher.type*,%m286$.Matcher.type*}
@Matcher_size = constant i32 32
define void @m286$debug_matcher.v.m286$.Matcher.typep(%m286$.Matcher.type* %.m.arg) {
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.m.arg, %m286$.Matcher.type** %m
%.tmp775 = getelementptr [14 x i8], [14 x i8]*@.str774, i32 0, i32 0
%.tmp776 = call i32(i8*,...) @printf(i8* %.tmp775)
%.tmp778 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp779 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp778, i32 0, i32 0
%.tmp780 = load %m286$.Query.type*, %m286$.Query.type** %.tmp779
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp780, %m286$.Query.type** %q
br label %.for.start.777
.for.start.777:
%.tmp781 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp782 = icmp ne %m286$.Query.type* %.tmp781, null
br i1 %.tmp782, label %.for.continue.777, label %.for.end.777
.for.continue.777:
%.tmp783 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp784 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp783, i32 0, i32 0
%.tmp785 = load i8, i8* %.tmp784
%.tmp786 = icmp eq i8 %.tmp785, 118
br i1 %.tmp786, label %.if.true.787, label %.if.false.787
.if.true.787:
%.tmp789 = getelementptr [30 x i8], [30 x i8]*@.str788, i32 0, i32 0
%.tmp790 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp791 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp790, i32 0, i32 0
%.tmp792 = load i8, i8* %.tmp791
%.tmp793 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp794 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp793, i32 0, i32 1
%.tmp795 = load i8*, i8** %.tmp794
%.tmp796 = call i32(i8*,...) @printf(i8* %.tmp789, i8 %.tmp792, i8* %.tmp795)
br label %.if.end.787
.if.false.787:
%.tmp798 = getelementptr [32 x i8], [32 x i8]*@.str797, i32 0, i32 0
%.tmp799 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp800 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp799, i32 0, i32 0
%.tmp801 = load i8, i8* %.tmp800
%.tmp802 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp803 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp802, i32 0, i32 1
%.tmp804 = load i8*, i8** %.tmp803
%.tmp805 = call i32(i8*,...) @printf(i8* %.tmp798, i8 %.tmp801, i8* %.tmp804)
br label %.if.end.787
.if.end.787:
%.tmp806 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp807 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp806, i32 0, i32 2
%.tmp808 = load %m286$.Query.type*, %m286$.Query.type** %.tmp807
store %m286$.Query.type* %.tmp808, %m286$.Query.type** %q
br label %.for.start.777
.for.end.777:
%.tmp810 = getelementptr [14 x i8], [14 x i8]*@.str809, i32 0, i32 0
%.tmp811 = call i32(i8*,...) @printf(i8* %.tmp810)
%.tmp812 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp813 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp812, i32 0, i32 3
%.tmp814 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp813
%.tmp815 = icmp ne %m286$.Matcher.type* %.tmp814, null
br i1 %.tmp815, label %.if.true.816, label %.if.false.816
.if.true.816:
%.tmp817 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp818 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp817, i32 0, i32 3
%.tmp819 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp818
call void(%m286$.Matcher.type*) @m286$debug_matcher.v.m286$.Matcher.typep(%m286$.Matcher.type* %.tmp819)
br label %.if.end.816
.if.false.816:
br label %.if.end.816
.if.end.816:
%.tmp821 = getelementptr [13 x i8], [13 x i8]*@.str820, i32 0, i32 0
%.tmp822 = call i32(i8*,...) @printf(i8* %.tmp821)
%.tmp823 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp824 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp823, i32 0, i32 2
%.tmp825 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp824
%.tmp826 = icmp ne %m286$.Matcher.type* %.tmp825, null
br i1 %.tmp826, label %.if.true.827, label %.if.false.827
.if.true.827:
%.tmp828 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp829 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp828, i32 0, i32 2
%.tmp830 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp829
call void(%m286$.Matcher.type*) @m286$debug_matcher.v.m286$.Matcher.typep(%m286$.Matcher.type* %.tmp830)
br label %.if.end.827
.if.false.827:
br label %.if.end.827
.if.end.827:
%.tmp832 = getelementptr [5 x i8], [5 x i8]*@.str831, i32 0, i32 0
%.tmp833 = call i32(i8*,...) @printf(i8* %.tmp832)
ret void
}
%m286$.Rule.type = type {i8*,%m286$.Matcher.type*}
@Rule_size = constant i32 16
%m286$.ParsingContext.type = type {%m287$.Token.type*}
@ParsingContext_size = constant i32 8
define %m286$.ParsingContext.type* @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp834 = load i32, i32* @ParsingContext_size
%.tmp835 = call i8*(i32) @malloc(i32 %.tmp834)
%.tmp836 = bitcast i8* %.tmp835 to %m286$.ParsingContext.type*
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp836, %m286$.ParsingContext.type** %ctx
%.tmp837 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp838 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp837)
%fd = alloca i32
store i32 %.tmp838, i32* %fd
%.tmp839 = load i32, i32* %fd
%.tmp840 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp839)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp840, %m209$.PeekerInfo.type** %p
%.tmp841 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp842 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp841, i1 0)
%token_list = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp842, %m287$.Token.type** %token_list
%.tmp843 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp844 = bitcast %m209$.PeekerInfo.type* %.tmp843 to i8*
call void(i8*) @free(i8* %.tmp844)
%.tmp845 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp846 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp845, i32 0, i32 0
%.tmp847 = load %m287$.Token.type*, %m287$.Token.type** %token_list
store %m287$.Token.type* %.tmp847, %m287$.Token.type** %.tmp846
%.tmp848 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
ret %m286$.ParsingContext.type* %.tmp848
}
define %m286$.Matcher.type* @m286$new_matcher.m286$.Matcher.typep() {
%.tmp849 = load i32, i32* @Matcher_size
%.tmp850 = call i8*(i32) @malloc(i32 %.tmp849)
%.tmp851 = bitcast i8* %.tmp850 to %m286$.Matcher.type*
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp851, %m286$.Matcher.type** %m
%.tmp852 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp853 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp852, i32 0, i32 1
store i8 49, i8* %.tmp853
%.tmp854 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp855 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp854, i32 0, i32 2
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp855
%.tmp856 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp857 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp856, i32 0, i32 3
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp857
%.tmp858 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp859 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp858, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp859
%.tmp860 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp860
}
define %m286$.Matcher.type* @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%m = alloca %m286$.Matcher.type*
%.tmp861 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp862 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp861, i32 0, i32 0
%.tmp863 = load %m287$.Token.type*, %m287$.Token.type** %.tmp862
%.tmp864 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp863, i32 0, i32 1
%.tmp865 = load i8*, i8** %.tmp864
%.tmp867 = getelementptr [2 x i8], [2 x i8]*@.str866, i32 0, i32 0
%.tmp868 = call i32(i8*,i8*) @strcmp(i8* %.tmp865, i8* %.tmp867)
%.tmp869 = icmp eq i32 %.tmp868, 0
br i1 %.tmp869, label %.if.true.870, label %.if.false.870
.if.true.870:
%.tmp871 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp872 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp871, i32 0, i32 0
%.tmp873 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp874 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp873, i32 0, i32 0
%.tmp875 = load %m287$.Token.type*, %m287$.Token.type** %.tmp874
%.tmp876 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp875, i32 0, i32 5
%.tmp877 = load %m287$.Token.type*, %m287$.Token.type** %.tmp876
store %m287$.Token.type* %.tmp877, %m287$.Token.type** %.tmp872
%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp878 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp879 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp878)
store %m286$.Matcher.type* %.tmp879, %m286$.Matcher.type** %m
%.tmp880 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp881 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp880, i32 0, i32 0
%.tmp882 = load %m287$.Token.type*, %m287$.Token.type** %.tmp881
%.tmp883 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp882, i32 0, i32 1
%.tmp884 = load i8*, i8** %.tmp883
%.tmp886 = getelementptr [2 x i8], [2 x i8]*@.str885, i32 0, i32 0
%.tmp887 = call i32(i8*,i8*) @strcmp(i8* %.tmp884, i8* %.tmp886)
%.tmp888 = icmp eq i32 %.tmp887, 0
br i1 %.tmp888, label %.if.true.889, label %.if.false.889
.if.true.889:
%.tmp890 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp891 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp890, i32 0, i32 0
%.tmp892 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp893 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp892, i32 0, i32 0
%.tmp894 = load %m287$.Token.type*, %m287$.Token.type** %.tmp893
%.tmp895 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp894, i32 0, i32 5
%.tmp896 = load %m287$.Token.type*, %m287$.Token.type** %.tmp895
store %m287$.Token.type* %.tmp896, %m287$.Token.type** %.tmp891
%.tmp897 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%last_matcher = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp897, %m286$.Matcher.type** %last_matcher
br label %.for.start.898
.for.start.898:
%.tmp899 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp900 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp899, i32 0, i32 0
%.tmp901 = load %m287$.Token.type*, %m287$.Token.type** %.tmp900
%.tmp902 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp901, i32 0, i32 1
%.tmp903 = load i8*, i8** %.tmp902
%.tmp905 = getelementptr [2 x i8], [2 x i8]*@.str904, i32 0, i32 0
%.tmp906 = call i32(i8*,i8*) @strcmp(i8* %.tmp903, i8* %.tmp905)
%.tmp907 = icmp ne i32 %.tmp906, 0
%.tmp908 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp909 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp908, i32 0, i32 0
%.tmp910 = load %m287$.Token.type*, %m287$.Token.type** %.tmp909
%.tmp911 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp910, i32 0, i32 0
%.tmp912 = load i8*, i8** %.tmp911
%.tmp914 = getelementptr [4 x i8], [4 x i8]*@.str913, i32 0, i32 0
%.tmp915 = call i32(i8*,i8*) @strcmp(i8* %.tmp912, i8* %.tmp914)
%.tmp916 = icmp ne i32 %.tmp915, 0
%.tmp917 = and i1 %.tmp907, %.tmp916
br i1 %.tmp917, label %.for.continue.898, label %.for.end.898
.for.continue.898:
%.tmp918 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp919 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp918, i32 0, i32 2
%.tmp920 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp921 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp920)
store %m286$.Matcher.type* %.tmp921, %m286$.Matcher.type** %.tmp919
%.tmp922 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp923 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp922, i32 0, i32 2
%.tmp924 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp923
store %m286$.Matcher.type* %.tmp924, %m286$.Matcher.type** %last_matcher
%.tmp925 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp926 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp925, i32 0, i32 0
%.tmp927 = load %m287$.Token.type*, %m287$.Token.type** %.tmp926
%.tmp928 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp927, i32 0, i32 1
%.tmp929 = load i8*, i8** %.tmp928
%.tmp931 = getelementptr [2 x i8], [2 x i8]*@.str930, i32 0, i32 0
%.tmp932 = call i32(i8*,i8*) @strcmp(i8* %.tmp929, i8* %.tmp931)
%.tmp933 = icmp ne i32 %.tmp932, 0
%.tmp934 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp935 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp934, i32 0, i32 0
%.tmp936 = load %m287$.Token.type*, %m287$.Token.type** %.tmp935
%.tmp937 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp936, i32 0, i32 1
%.tmp938 = load i8*, i8** %.tmp937
%.tmp940 = getelementptr [2 x i8], [2 x i8]*@.str939, i32 0, i32 0
%.tmp941 = call i32(i8*,i8*) @strcmp(i8* %.tmp938, i8* %.tmp940)
%.tmp942 = icmp ne i32 %.tmp941, 0
%.tmp943 = and i1 %.tmp933, %.tmp942
br i1 %.tmp943, label %.if.true.944, label %.if.false.944
.if.true.944:
%.tmp946 = getelementptr [48 x i8], [48 x i8]*@.str945, i32 0, i32 0
%.tmp947 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp948 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp947, i32 0, i32 0
%.tmp949 = load %m287$.Token.type*, %m287$.Token.type** %.tmp948
%.tmp950 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp949, i32 0, i32 2
%.tmp951 = load i32, i32* %.tmp950
%.tmp952 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp953 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp952, i32 0, i32 0
%.tmp954 = load %m287$.Token.type*, %m287$.Token.type** %.tmp953
%.tmp955 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp954, i32 0, i32 3
%.tmp956 = load i32, i32* %.tmp955
%.tmp957 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp958 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp957, i32 0, i32 0
%.tmp959 = load %m287$.Token.type*, %m287$.Token.type** %.tmp958
%.tmp960 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp959, i32 0, i32 1
%.tmp961 = load i8*, i8** %.tmp960
%.tmp962 = call i32(i8*,...) @printf(i8* %.tmp946, i32 %.tmp951, i32 %.tmp956, i8* %.tmp961)
call void(i32) @exit(i32 1)
br label %.if.end.944
.if.false.944:
br label %.if.end.944
.if.end.944:
%.tmp963 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp964 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp963, i32 0, i32 0
%.tmp965 = load %m287$.Token.type*, %m287$.Token.type** %.tmp964
%.tmp966 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp965, i32 0, i32 1
%.tmp967 = load i8*, i8** %.tmp966
%.tmp969 = getelementptr [2 x i8], [2 x i8]*@.str968, i32 0, i32 0
%.tmp970 = call i32(i8*,i8*) @strcmp(i8* %.tmp967, i8* %.tmp969)
%.tmp971 = icmp eq i32 %.tmp970, 0
br i1 %.tmp971, label %.if.true.972, label %.if.false.972
.if.true.972:
%.tmp973 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp974 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp973, i32 0, i32 0
%.tmp975 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp976 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp975, i32 0, i32 0
%.tmp977 = load %m287$.Token.type*, %m287$.Token.type** %.tmp976
%.tmp978 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp977, i32 0, i32 5
%.tmp979 = load %m287$.Token.type*, %m287$.Token.type** %.tmp978
store %m287$.Token.type* %.tmp979, %m287$.Token.type** %.tmp974
br label %.if.end.972
.if.false.972:
br label %.if.end.972
.if.end.972:
br label %.for.start.898
.for.end.898:
br label %.if.end.889
.if.false.889:
br label %.if.end.889
.if.end.889:
%.tmp980 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp981 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp980, i32 0, i32 0
%.tmp982 = load %m287$.Token.type*, %m287$.Token.type** %.tmp981
%.tmp983 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp982, i32 0, i32 1
%.tmp984 = load i8*, i8** %.tmp983
%.tmp986 = getelementptr [2 x i8], [2 x i8]*@.str985, i32 0, i32 0
%.tmp987 = call i32(i8*,i8*) @strcmp(i8* %.tmp984, i8* %.tmp986)
%.tmp988 = icmp ne i32 %.tmp987, 0
br i1 %.tmp988, label %.if.true.989, label %.if.false.989
.if.true.989:
%.tmp990 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp992 = getelementptr [22 x i8], [22 x i8]*@.str991, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp990, i8* %.tmp992)
br label %.if.end.989
.if.false.989:
br label %.if.end.989
.if.end.989:
%.tmp993 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp994 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp993, i32 0, i32 0
%.tmp995 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp996 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp995, i32 0, i32 0
%.tmp997 = load %m287$.Token.type*, %m287$.Token.type** %.tmp996
%.tmp998 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp997, i32 0, i32 5
%.tmp999 = load %m287$.Token.type*, %m287$.Token.type** %.tmp998
store %m287$.Token.type* %.tmp999, %m287$.Token.type** %.tmp994
%.tmp1000 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1001 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1000, i32 0, i32 0
%.tmp1002 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1001
%.tmp1003 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1002, i32 0, i32 1
%.tmp1004 = load i8*, i8** %.tmp1003
%.tmp1006 = getelementptr [2 x i8], [2 x i8]*@.str1005, i32 0, i32 0
%.tmp1007 = call i32(i8*,i8*) @strcmp(i8* %.tmp1004, i8* %.tmp1006)
%.tmp1008 = icmp eq i32 %.tmp1007, 0
br i1 %.tmp1008, label %.if.true.1009, label %.if.false.1009
.if.true.1009:
%.tmp1010 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1011 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1010, i32 0, i32 0
%.tmp1012 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1013 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1012, i32 0, i32 0
%.tmp1014 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1013
%.tmp1015 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1014, i32 0, i32 5
%.tmp1016 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1015
store %m287$.Token.type* %.tmp1016, %m287$.Token.type** %.tmp1011
%.tmp1017 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1018 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1017, i32 0, i32 1
store i8 43, i8* %.tmp1018
br label %.if.end.1009
.if.false.1009:
%.tmp1019 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1020 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1019, i32 0, i32 0
%.tmp1021 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1020
%.tmp1022 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1021, i32 0, i32 1
%.tmp1023 = load i8*, i8** %.tmp1022
%.tmp1025 = getelementptr [2 x i8], [2 x i8]*@.str1024, i32 0, i32 0
%.tmp1026 = call i32(i8*,i8*) @strcmp(i8* %.tmp1023, i8* %.tmp1025)
%.tmp1027 = icmp eq i32 %.tmp1026, 0
br i1 %.tmp1027, label %.if.true.1028, label %.if.false.1028
.if.true.1028:
%.tmp1029 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1030 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1029, i32 0, i32 0
%.tmp1031 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1032 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1031, i32 0, i32 0
%.tmp1033 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1032
%.tmp1034 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1033, i32 0, i32 5
%.tmp1035 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1034
store %m287$.Token.type* %.tmp1035, %m287$.Token.type** %.tmp1030
%.tmp1036 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1037 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1036, i32 0, i32 1
store i8 42, i8* %.tmp1037
br label %.if.end.1028
.if.false.1028:
%.tmp1038 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1039 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1038, i32 0, i32 0
%.tmp1040 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1039
%.tmp1041 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1040, i32 0, i32 1
%.tmp1042 = load i8*, i8** %.tmp1041
%.tmp1044 = getelementptr [2 x i8], [2 x i8]*@.str1043, i32 0, i32 0
%.tmp1045 = call i32(i8*,i8*) @strcmp(i8* %.tmp1042, i8* %.tmp1044)
%.tmp1046 = icmp eq i32 %.tmp1045, 0
br i1 %.tmp1046, label %.if.true.1047, label %.if.false.1047
.if.true.1047:
%.tmp1048 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1049 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1048, i32 0, i32 0
%.tmp1050 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1051 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1050, i32 0, i32 0
%.tmp1052 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1051
%.tmp1053 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1052, i32 0, i32 5
%.tmp1054 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1053
store %m287$.Token.type* %.tmp1054, %m287$.Token.type** %.tmp1049
%.tmp1055 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1056 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1055, i32 0, i32 1
store i8 63, i8* %.tmp1056
br label %.if.end.1047
.if.false.1047:
br label %.if.end.1047
.if.end.1047:
br label %.if.end.1028
.if.end.1028:
br label %.if.end.1009
.if.end.1009:
br label %.if.end.870
.if.false.870:
%.tmp1057 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1058 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1057)
store %m286$.Matcher.type* %.tmp1058, %m286$.Matcher.type** %m
br label %.if.end.870
.if.end.870:
%.tmp1059 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1060 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1059, i32 0, i32 0
%.tmp1061 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1060
%.tmp1062 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1061, i32 0, i32 1
%.tmp1063 = load i8*, i8** %.tmp1062
%.tmp1065 = getelementptr [2 x i8], [2 x i8]*@.str1064, i32 0, i32 0
%.tmp1066 = call i32(i8*,i8*) @strcmp(i8* %.tmp1063, i8* %.tmp1065)
%.tmp1067 = icmp eq i32 %.tmp1066, 0
%.tmp1068 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1069 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1068, i32 0, i32 0
%.tmp1070 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1069
%.tmp1071 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1070, i32 0, i32 0
%.tmp1072 = load i8*, i8** %.tmp1071
%.tmp1074 = getelementptr [5 x i8], [5 x i8]*@.str1073, i32 0, i32 0
%.tmp1075 = call i32(i8*,i8*) @strcmp(i8* %.tmp1072, i8* %.tmp1074)
%.tmp1076 = icmp eq i32 %.tmp1075, 0
%.tmp1077 = or i1 %.tmp1067, %.tmp1076
br i1 %.tmp1077, label %.if.true.1078, label %.if.false.1078
.if.true.1078:
%.tmp1079 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1080 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1079, i32 0, i32 3
%.tmp1081 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1082 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1081)
store %m286$.Matcher.type* %.tmp1082, %m286$.Matcher.type** %.tmp1080
br label %.if.end.1078
.if.false.1078:
br label %.if.end.1078
.if.end.1078:
%.tmp1083 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1083
}
define %m286$.Matcher.type* @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1084 = call %m286$.Matcher.type*() @m286$new_matcher.m286$.Matcher.typep()
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp1084, %m286$.Matcher.type** %m
%count = alloca i32
%.tmp1085 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1086 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1085, i32 0, i32 0
%.tmp1087 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1086
%ptr = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1087, %m287$.Token.type** %ptr
store i32 0, i32* %count
br label %.for.start.1088
.for.start.1088:
%.tmp1089 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1090 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1089, i32 0, i32 0
%.tmp1091 = load i8*, i8** %.tmp1090
%.tmp1093 = getelementptr [5 x i8], [5 x i8]*@.str1092, i32 0, i32 0
%.tmp1094 = call i32(i8*,i8*) @strcmp(i8* %.tmp1091, i8* %.tmp1093)
%.tmp1095 = icmp eq i32 %.tmp1094, 0
%.tmp1096 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1097 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1096, i32 0, i32 0
%.tmp1098 = load i8*, i8** %.tmp1097
%.tmp1100 = getelementptr [7 x i8], [7 x i8]*@.str1099, i32 0, i32 0
%.tmp1101 = call i32(i8*,i8*) @strcmp(i8* %.tmp1098, i8* %.tmp1100)
%.tmp1102 = icmp eq i32 %.tmp1101, 0
%.tmp1103 = or i1 %.tmp1095, %.tmp1102
br i1 %.tmp1103, label %.for.continue.1088, label %.for.end.1088
.for.continue.1088:
%.tmp1104 = load i32, i32* %count
%.tmp1105 = add i32 %.tmp1104, 1
store i32 %.tmp1105, i32* %count
%.tmp1106 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1107 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1106, i32 0, i32 5
%.tmp1108 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1107
store %m287$.Token.type* %.tmp1108, %m287$.Token.type** %ptr
br label %.for.start.1088
.for.end.1088:
%.tmp1109 = load i32, i32* @Query_size
%.tmp1110 = icmp sgt i32 %.tmp1109, 0
br i1 %.tmp1110, label %.if.true.1111, label %.if.false.1111
.if.true.1111:
%.tmp1112 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1113 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1112, i32 0, i32 0
%.tmp1114 = load i32, i32* @Query_size
%.tmp1115 = call i8*(i32) @malloc(i32 %.tmp1114)
%.tmp1116 = bitcast i8* %.tmp1115 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1116, %m286$.Query.type** %.tmp1113
br label %.if.end.1111
.if.false.1111:
%.tmp1117 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1118 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1117, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1118
br label %.if.end.1111
.if.end.1111:
%.tmp1119 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1120 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1119, i32 0, i32 0
%.tmp1121 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1120
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1121, %m286$.Query.type** %q
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1122
.for.start.1122:
%.tmp1123 = load i32, i32* %i
%.tmp1124 = load i32, i32* %count
%.tmp1125 = icmp slt i32 %.tmp1123, %.tmp1124
br i1 %.tmp1125, label %.for.continue.1122, label %.for.end.1122
.for.continue.1122:
%.tmp1126 = load i32, i32* %i
%.tmp1127 = icmp sgt i32 %.tmp1126, 0
br i1 %.tmp1127, label %.if.true.1128, label %.if.false.1128
.if.true.1128:
%.tmp1129 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1130 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1129, i32 0, i32 2
%.tmp1131 = load i32, i32* @Query_size
%.tmp1132 = call i8*(i32) @malloc(i32 %.tmp1131)
%.tmp1133 = bitcast i8* %.tmp1132 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1133, %m286$.Query.type** %.tmp1130
%.tmp1134 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1135 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1134, i32 0, i32 2
%.tmp1136 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1135
store %m286$.Query.type* %.tmp1136, %m286$.Query.type** %q
br label %.if.end.1128
.if.false.1128:
br label %.if.end.1128
.if.end.1128:
%.tmp1137 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1138 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1137, i32 0, i32 0
%.tmp1139 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1138
%.tmp1140 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1139, i32 0, i32 0
%.tmp1141 = load i8*, i8** %.tmp1140
%.tmp1143 = getelementptr [7 x i8], [7 x i8]*@.str1142, i32 0, i32 0
%.tmp1144 = call i32(i8*,i8*) @strcmp(i8* %.tmp1141, i8* %.tmp1143)
%.tmp1145 = icmp eq i32 %.tmp1144, 0
br i1 %.tmp1145, label %.if.true.1146, label %.if.false.1146
.if.true.1146:
%.tmp1147 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1148 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1147, i32 0, i32 0
store i8 118, i8* %.tmp1148
br label %.if.end.1146
.if.false.1146:
%.tmp1149 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1150 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1149, i32 0, i32 0
%.tmp1151 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1150
%.tmp1152 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1151, i32 0, i32 1
%.tmp1153 = load i8*, i8** %.tmp1152
%.tmp1154 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1153)
br i1 %.tmp1154, label %.if.true.1155, label %.if.false.1155
.if.true.1155:
%.tmp1156 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1157 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1156, i32 0, i32 0
store i8 97, i8* %.tmp1157
br label %.if.end.1155
.if.false.1155:
%.tmp1158 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1159 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1158, i32 0, i32 0
%.tmp1160 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1159
%.tmp1161 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1160, i32 0, i32 1
%.tmp1162 = load i8*, i8** %.tmp1161
%.tmp1163 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1162)
br i1 %.tmp1163, label %.if.true.1164, label %.if.false.1164
.if.true.1164:
%.tmp1165 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1166 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1165, i32 0, i32 0
store i8 116, i8* %.tmp1166
br label %.if.end.1164
.if.false.1164:
%.tmp1168 = getelementptr [17 x i8], [17 x i8]*@.str1167, i32 0, i32 0
%.tmp1169 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1170 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1169, i32 0, i32 0
%.tmp1171 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1170
%.tmp1172 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1171, i32 0, i32 1
%.tmp1173 = load i8*, i8** %.tmp1172
%.tmp1174 = call i32(i8*,...) @printf(i8* %.tmp1168, i8* %.tmp1173)
%.tmp1175 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1177 = getelementptr [50 x i8], [50 x i8]*@.str1176, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1175, i8* %.tmp1177)
br label %.if.end.1164
.if.end.1164:
br label %.if.end.1155
.if.end.1155:
br label %.if.end.1146
.if.end.1146:
%.tmp1178 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1179 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1178, i32 0, i32 1
%.tmp1180 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1181
%.tmp1183 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1182, i32 0, i32 1
%.tmp1184 = load i8*, i8** %.tmp1183
store i8* %.tmp1184, i8** %.tmp1179
%.tmp1185 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1186 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1185, i32 0, i32 2
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1186
%.tmp1187 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1187, i32 0, i32 0
%.tmp1189 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1190 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1189, i32 0, i32 0
%.tmp1191 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1190
%.tmp1192 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1191, i32 0, i32 5
%.tmp1193 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1192
store %m287$.Token.type* %.tmp1193, %m287$.Token.type** %.tmp1188
%.tmp1194 = load i32, i32* %i
%.tmp1195 = add i32 %.tmp1194, 1
store i32 %.tmp1195, i32* %i
br label %.for.start.1122
.for.end.1122:
%.tmp1196 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1196
}
define %m286$.Rule.type* @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1197 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1198 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1197, i32 0, i32 0
%.tmp1199 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1198
%.tmp1200 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1199, i32 0, i32 1
%.tmp1201 = load i8*, i8** %.tmp1200
%rule_name = alloca i8*
store i8* %.tmp1201, i8** %rule_name
%.tmp1202 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1203 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1202, i32 0, i32 0
%.tmp1204 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1203
%.tmp1205 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1204, i32 0, i32 0
%.tmp1206 = load i8*, i8** %.tmp1205
%.tmp1208 = getelementptr [5 x i8], [5 x i8]*@.str1207, i32 0, i32 0
%.tmp1209 = call i32(i8*,i8*) @strcmp(i8* %.tmp1206, i8* %.tmp1208)
%.tmp1210 = icmp ne i32 %.tmp1209, 0
br i1 %.tmp1210, label %.if.true.1211, label %.if.false.1211
.if.true.1211:
%.tmp1213 = getelementptr [37 x i8], [37 x i8]*@.str1212, i32 0, i32 0
%.tmp1214 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1215 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1214, i32 0, i32 0
%.tmp1216 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1215
%.tmp1217 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1216, i32 0, i32 0
%.tmp1218 = load i8*, i8** %.tmp1217
%.tmp1219 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1220 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1219, i32 0, i32 0
%.tmp1221 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1220
%.tmp1222 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1221, i32 0, i32 1
%.tmp1223 = load i8*, i8** %.tmp1222
%.tmp1224 = call i32(i8*,...) @printf(i8* %.tmp1213, i8* %.tmp1218, i8* %.tmp1223)
%.tmp1225 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1227 = getelementptr [31 x i8], [31 x i8]*@.str1226, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1225, i8* %.tmp1227)
br label %.if.end.1211
.if.false.1211:
br label %.if.end.1211
.if.end.1211:
%.tmp1228 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1229 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1228, i32 0, i32 0
%.tmp1230 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1231 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1230, i32 0, i32 0
%.tmp1232 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1231
%.tmp1233 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1232, i32 0, i32 5
%.tmp1234 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1233
store %m287$.Token.type* %.tmp1234, %m287$.Token.type** %.tmp1229
%.tmp1235 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1236 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1235, i32 0, i32 0
%.tmp1237 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1236
%.tmp1238 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1237, i32 0, i32 1
%.tmp1239 = load i8*, i8** %.tmp1238
%.tmp1241 = getelementptr [2 x i8], [2 x i8]*@.str1240, i32 0, i32 0
%.tmp1242 = call i32(i8*,i8*) @strcmp(i8* %.tmp1239, i8* %.tmp1241)
%.tmp1243 = icmp ne i32 %.tmp1242, 0
br i1 %.tmp1243, label %.if.true.1244, label %.if.false.1244
.if.true.1244:
%.tmp1245 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1246 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1245, i32 0, i32 0
%.tmp1247 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1246
%.tmp1248 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1247, i32 0, i32 1
%.tmp1249 = load i8*, i8** %.tmp1248
%.tmp1250 = call i32(i8*,...) @printf(i8* %.tmp1249)
%.tmp1251 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1253 = getelementptr [27 x i8], [27 x i8]*@.str1252, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1251, i8* %.tmp1253)
br label %.if.end.1244
.if.false.1244:
br label %.if.end.1244
.if.end.1244:
%.tmp1254 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1255 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1254, i32 0, i32 0
%.tmp1256 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1257 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1256, i32 0, i32 0
%.tmp1258 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1257
%.tmp1259 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1258, i32 0, i32 5
%.tmp1260 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1259
store %m287$.Token.type* %.tmp1260, %m287$.Token.type** %.tmp1255
%.tmp1261 = load i32, i32* @Rule_size
%.tmp1262 = call i8*(i32) @malloc(i32 %.tmp1261)
%.tmp1263 = bitcast i8* %.tmp1262 to %m286$.Rule.type*
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1263, %m286$.Rule.type** %rule
%.tmp1264 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1265 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1264, i32 0, i32 0
%.tmp1266 = load i8*, i8** %rule_name
store i8* %.tmp1266, i8** %.tmp1265
%.tmp1267 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1268 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1267, i32 0, i32 1
%.tmp1269 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1270 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1269)
store %m286$.Matcher.type* %.tmp1270, %m286$.Matcher.type** %.tmp1268
%.tmp1271 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1271
}
define void @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1272 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1273 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1272, i32 0, i32 0
%.tmp1274 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1273
%.tmp1275 = load i8*, i8** %error
%.tmp1276 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1274, i8* %.tmp1275)
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1276, %m717$.Error.type** %e
%.tmp1277 = load %m717$.Error.type*, %m717$.Error.type** %e
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp1277)
call void(i32) @exit(i32 1)
ret void
}
define %m286$.Rule.type** @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%max_rules = alloca i32
store i32 40, i32* %max_rules
%.tmp1278 = load i32, i32* @ptr_size
%.tmp1279 = load i32, i32* %max_rules
%.tmp1280 = mul i32 %.tmp1278, %.tmp1279
%.tmp1281 = call i8*(i32) @malloc(i32 %.tmp1280)
%.tmp1282 = bitcast i8* %.tmp1281 to %m286$.Rule.type**
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp1282, %m286$.Rule.type*** %grammar
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1283
.for.start.1283:
%.tmp1284 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1285 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1284, i32 0, i32 0
%.tmp1286 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1285
%.tmp1287 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1286, i32 0, i32 0
%.tmp1288 = load i8*, i8** %.tmp1287
%.tmp1290 = getelementptr [4 x i8], [4 x i8]*@.str1289, i32 0, i32 0
%.tmp1291 = call i32(i8*,i8*) @strcmp(i8* %.tmp1288, i8* %.tmp1290)
%.tmp1292 = icmp ne i32 %.tmp1291, 0
br i1 %.tmp1292, label %.for.continue.1283, label %.for.end.1283
.for.continue.1283:
%.tmp1293 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1294 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1293, i32 0, i32 0
%.tmp1295 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1294
%.tmp1296 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1295, i32 0, i32 0
%.tmp1297 = load i8*, i8** %.tmp1296
%.tmp1299 = getelementptr [3 x i8], [3 x i8]*@.str1298, i32 0, i32 0
%.tmp1300 = call i32(i8*,i8*) @strcmp(i8* %.tmp1297, i8* %.tmp1299)
%.tmp1301 = icmp ne i32 %.tmp1300, 0
br i1 %.tmp1301, label %.if.true.1302, label %.if.false.1302
.if.true.1302:
%.tmp1303 = load i32, i32* %i
%.tmp1304 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1305 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1304, i32 %.tmp1303
%.tmp1306 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1307 = call %m286$.Rule.type*(%m286$.ParsingContext.type*) @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1306)
store %m286$.Rule.type* %.tmp1307, %m286$.Rule.type** %.tmp1305
%.tmp1308 = load i32, i32* %i
%.tmp1309 = add i32 %.tmp1308, 1
store i32 %.tmp1309, i32* %i
br label %.if.end.1302
.if.false.1302:
%.tmp1310 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1311 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1310, i32 0, i32 0
%.tmp1312 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1313 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1312, i32 0, i32 0
%.tmp1314 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1313
%.tmp1315 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1314, i32 0, i32 5
%.tmp1316 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1315
store %m287$.Token.type* %.tmp1316, %m287$.Token.type** %.tmp1311
br label %.if.end.1302
.if.end.1302:
br label %.for.start.1283
.for.end.1283:
%.tmp1317 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1318 = bitcast %m286$.Rule.type** %.tmp1317 to %m286$.Rule.type**
ret %m286$.Rule.type** %.tmp1318
}
%m286$.Node.type = type {i8*,i8*,i8*,i32,i32,%m286$.Node.type*,%m286$.Node.type*,%m286$.Node.type*}
@Node_size = constant i32 56
define %m286$.Node.type* @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1319 = load i32, i32* @Node_size
%.tmp1320 = call i8*(i32) @malloc(i32 %.tmp1319)
%.tmp1321 = bitcast i8* %.tmp1320 to %m286$.Node.type*
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1321, %m286$.Node.type** %node
%.tmp1322 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1323 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1322, i32 0, i32 0
%.tmp1324 = load i8*, i8** %type
store i8* %.tmp1324, i8** %.tmp1323
%.tmp1325 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1326 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1325, i32 0, i32 1
%.tmp1327 = load i8*, i8** %value
store i8* %.tmp1327, i8** %.tmp1326
%.tmp1328 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1329 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1328, i32 0, i32 3
%.tmp1330 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1331 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1330, i32 0, i32 2
%.tmp1332 = load i32, i32* %.tmp1331
store i32 %.tmp1332, i32* %.tmp1329
%.tmp1333 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1334 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1333, i32 0, i32 2
%.tmp1335 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1336 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1335, i32 0, i32 4
%.tmp1337 = load i8*, i8** %.tmp1336
store i8* %.tmp1337, i8** %.tmp1334
%.tmp1338 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1338, i32 0, i32 4
%.tmp1340 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1341 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1340, i32 0, i32 3
%.tmp1342 = load i32, i32* %.tmp1341
store i32 %.tmp1342, i32* %.tmp1339
%.tmp1343 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1344 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1343, i32 0, i32 5
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1344
%.tmp1345 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1346 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1345, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1346
%.tmp1347 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1348 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1347, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1348
%.tmp1349 = load %m286$.Node.type*, %m286$.Node.type** %node
ret %m286$.Node.type* %.tmp1349
}
define void @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.parent.arg, %m286$.Node.type* %.child.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%child = alloca %m286$.Node.type*
store %m286$.Node.type* %.child.arg, %m286$.Node.type** %child
%.tmp1350 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1351 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1350, i32 0, i32 6
%.tmp1352 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1351
%.tmp1353 = icmp eq %m286$.Node.type* %.tmp1352, null
br i1 %.tmp1353, label %.if.true.1354, label %.if.false.1354
.if.true.1354:
%.tmp1355 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1356 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1355, i32 0, i32 6
%.tmp1357 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1357, %m286$.Node.type** %.tmp1356
br label %.if.end.1354
.if.false.1354:
%.tmp1358 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1359 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1358, i32 0, i32 6
%.tmp1360 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1359
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1360, %m286$.Node.type** %c
br label %.for.start.1361
.for.start.1361:
%.tmp1362 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1363 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1362, i32 0, i32 7
%.tmp1364 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1363
%.tmp1365 = icmp ne %m286$.Node.type* %.tmp1364, null
br i1 %.tmp1365, label %.for.continue.1361, label %.for.end.1361
.for.continue.1361:
%.tmp1366 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1367 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1366, i32 0, i32 7
%.tmp1368 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1367
store %m286$.Node.type* %.tmp1368, %m286$.Node.type** %c
br label %.for.start.1361
.for.end.1361:
%.tmp1369 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1370 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1369, i32 0, i32 7
%.tmp1371 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1371, %m286$.Node.type** %.tmp1370
br label %.if.end.1354
.if.end.1354:
%.tmp1372 = load %m286$.Node.type*, %m286$.Node.type** %child
%.tmp1373 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1372, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1373
ret void
}
define void @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.parent.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%.tmp1374 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1375 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1374, i32 0, i32 6
%.tmp1376 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1375
%.tmp1377 = icmp eq %m286$.Node.type* %.tmp1376, null
br i1 %.tmp1377, label %.if.true.1378, label %.if.false.1378
.if.true.1378:
ret void
br label %.if.end.1378
.if.false.1378:
br label %.if.end.1378
.if.end.1378:
%.tmp1379 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1380 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1379, i32 0, i32 6
%.tmp1381 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1380
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1381, %m286$.Node.type** %c
%.tmp1382 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1383 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1382, i32 0, i32 7
%.tmp1384 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1383
%.tmp1385 = icmp eq %m286$.Node.type* %.tmp1384, null
br i1 %.tmp1385, label %.if.true.1386, label %.if.false.1386
.if.true.1386:
%.tmp1387 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1388 = bitcast %m286$.Node.type* %.tmp1387 to i8*
call void(i8*) @free(i8* %.tmp1388)
%.tmp1389 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1390 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1389, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1390
ret void
br label %.if.end.1386
.if.false.1386:
br label %.if.end.1386
.if.end.1386:
br label %.for.start.1391
.for.start.1391:
%.tmp1392 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1393 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1392, i32 0, i32 7
%.tmp1394 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1393
%.tmp1395 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1394, i32 0, i32 7
%.tmp1396 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1395
%.tmp1397 = icmp ne %m286$.Node.type* %.tmp1396, null
br i1 %.tmp1397, label %.for.continue.1391, label %.for.end.1391
.for.continue.1391:
%.tmp1398 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1399 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1398, i32 0, i32 7
%.tmp1400 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1399
store %m286$.Node.type* %.tmp1400, %m286$.Node.type** %c
br label %.for.start.1391
.for.end.1391:
%.tmp1401 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1402 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1401, i32 0, i32 7
%.tmp1403 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1402
%.tmp1404 = bitcast %m286$.Node.type* %.tmp1403 to i8*
call void(i8*) @free(i8* %.tmp1404)
%.tmp1405 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1406 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1405, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1406
ret void
}
%m286$.AstContext.type = type {%m287$.Token.type*,%m286$.Rule.type**}
define %m286$.Rule.type* @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.grammar.arg, %m286$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1407
.for.start.1407:
br i1 1, label %.for.continue.1407, label %.for.end.1407
.for.continue.1407:
%.tmp1408 = load i32, i32* %i
%.tmp1409 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1410 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1409, i32 %.tmp1408
%.tmp1411 = load %m286$.Rule.type*, %m286$.Rule.type** %.tmp1410
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1411, %m286$.Rule.type** %rule
%.tmp1412 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1413 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1412, i32 0, i32 0
%.tmp1414 = load i8*, i8** %.tmp1413
%.tmp1415 = load i8*, i8** %rule_name
%.tmp1416 = call i32(i8*,i8*) @strcmp(i8* %.tmp1414, i8* %.tmp1415)
%.tmp1417 = icmp eq i32 %.tmp1416, 0
br i1 %.tmp1417, label %.if.true.1418, label %.if.false.1418
.if.true.1418:
%.tmp1419 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1419
br label %.if.end.1418
.if.false.1418:
br label %.if.end.1418
.if.end.1418:
%.tmp1420 = load i32, i32* %i
%.tmp1421 = add i32 %.tmp1420, 1
store i32 %.tmp1421, i32* %i
br label %.for.start.1407
.for.end.1407:
%.tmp1422 = bitcast ptr null to %m286$.Rule.type*
ret %m286$.Rule.type* %.tmp1422
}
%m286$.ParseResult.type = type {%m717$.Error.type*,%m286$.Node.type*}
@ParseResult_size = constant i32 16
define %m717$.Error.type* @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.c.arg, %m286$.Matcher.type* %.m.arg, %m286$.Node.type* %.base.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.m.arg, %m286$.Matcher.type** %m
%base = alloca %m286$.Node.type*
store %m286$.Node.type* %.base.arg, %m286$.Node.type** %base
%child = alloca %m286$.Node.type*
%.tmp1423 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1424 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1423, i32 0, i32 0
%.tmp1425 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1424
%start_token = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1425, %m287$.Token.type** %start_token
%new_children = alloca i32
store i32 0, i32* %new_children
%.tmp1426 = bitcast ptr null to %m717$.Error.type*
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1426, %m717$.Error.type** %err
%.tmp1428 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1429 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1428, i32 0, i32 0
%.tmp1430 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1429
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1430, %m286$.Query.type** %q
br label %.for.start.1427
.for.start.1427:
%.tmp1431 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1432 = icmp ne %m286$.Query.type* %.tmp1431, null
%.tmp1433 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1434 = icmp eq %m717$.Error.type* %.tmp1433, null
%.tmp1435 = and i1 %.tmp1432, %.tmp1434
br i1 %.tmp1435, label %.for.continue.1427, label %.for.end.1427
.for.continue.1427:
%.tmp1436 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1437 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1436, i32 0, i32 0
%.tmp1438 = load i8, i8* %.tmp1437
%.tmp1439 = icmp eq i8 %.tmp1438, 118
br i1 %.tmp1439, label %.if.true.1440, label %.if.false.1440
.if.true.1440:
%.tmp1441 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1442 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1441, i32 0, i32 1
%.tmp1443 = load i8*, i8** %.tmp1442
%.tmp1444 = call i32(i8*) @strlen(i8* %.tmp1443)
%.tmp1445 = sub i32 %.tmp1444, 2
%qv_len = alloca i32
store i32 %.tmp1445, i32* %qv_len
%.tmp1446 = load i32, i32* %qv_len
%.tmp1447 = add i32 %.tmp1446, 1
%.tmp1448 = call i8*(i32) @malloc(i32 %.tmp1447)
%tmp_buff = alloca i8*
store i8* %.tmp1448, i8** %tmp_buff
%.tmp1449 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1450 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1449, i32 0, i32 1
%.tmp1451 = load i8*, i8** %.tmp1450
%.tmp1453 = getelementptr [8 x i8], [8 x i8]*@.str1452, i32 0, i32 0
%.tmp1454 = load i8*, i8** %tmp_buff
%.tmp1455 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1451, i8* %.tmp1453, i8* %.tmp1454)
%.tmp1456 = load i8*, i8** %tmp_buff
%.tmp1457 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1458 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1457, i32 0, i32 0
%.tmp1459 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1458
%.tmp1460 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1459, i32 0, i32 1
%.tmp1461 = load i8*, i8** %.tmp1460
%.tmp1462 = load i32, i32* %qv_len
%.tmp1463 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1456, i8* %.tmp1461, i32 %.tmp1462)
%.tmp1464 = icmp eq i32 %.tmp1463, 0
%.tmp1465 = load i32, i32* %qv_len
%.tmp1466 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1467 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1466, i32 0, i32 0
%.tmp1468 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1467
%.tmp1469 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1468, i32 0, i32 1
%.tmp1470 = load i8*, i8** %.tmp1469
%.tmp1471 = call i32(i8*) @strlen(i8* %.tmp1470)
%.tmp1472 = icmp eq i32 %.tmp1465, %.tmp1471
%.tmp1473 = and i1 %.tmp1464, %.tmp1472
br i1 %.tmp1473, label %.if.true.1474, label %.if.false.1474
.if.true.1474:
%.tmp1475 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1476 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1475, i32 0, i32 0
%.tmp1477 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1476
%.tmp1478 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1479 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1478, i32 0, i32 0
%.tmp1480 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1479
%.tmp1481 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1480, i32 0, i32 0
%.tmp1482 = load i8*, i8** %.tmp1481
%.tmp1483 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1484 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1483, i32 0, i32 0
%.tmp1485 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1484
%.tmp1486 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1485, i32 0, i32 1
%.tmp1487 = load i8*, i8** %.tmp1486
%.tmp1488 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1477, i8* %.tmp1482, i8* %.tmp1487)
store %m286$.Node.type* %.tmp1488, %m286$.Node.type** %child
%.tmp1489 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1490 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1489, %m286$.Node.type* %.tmp1490)
%.tmp1491 = load i32, i32* %new_children
%.tmp1492 = add i32 %.tmp1491, 1
store i32 %.tmp1492, i32* %new_children
%.tmp1493 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1494 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1493, i32 0, i32 0
%.tmp1495 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1496 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1495, i32 0, i32 0
%.tmp1497 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1496
%.tmp1498 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1497, i32 0, i32 5
%.tmp1499 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1498
store %m287$.Token.type* %.tmp1499, %m287$.Token.type** %.tmp1494
br label %.if.end.1474
.if.false.1474:
%.tmp1500 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1501 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1500, i32 0, i32 0
%.tmp1502 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1501
%.tmp1503 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1502, i32 0, i32 1
%.tmp1504 = load i8*, i8** %.tmp1503
%token_value = alloca i8*
store i8* %.tmp1504, i8** %token_value
%.tmp1505 = load i8*, i8** %token_value
%.tmp1506 = icmp eq i8* %.tmp1505, null
br i1 %.tmp1506, label %.if.true.1507, label %.if.false.1507
.if.true.1507:
%.tmp1509 = getelementptr [7 x i8], [7 x i8]*@.str1508, i32 0, i32 0
store i8* %.tmp1509, i8** %token_value
br label %.if.end.1507
.if.false.1507:
br label %.if.end.1507
.if.end.1507:
%.tmp1511 = getelementptr [15 x i8], [15 x i8]*@.str1510, i32 0, i32 0
%err_fmt = alloca i8*
store i8* %.tmp1511, i8** %err_fmt
%.tmp1513 = getelementptr [31 x i8], [31 x i8]*@.str1512, i32 0, i32 0
%err_msg = alloca i8*
store i8* %.tmp1513, i8** %err_msg
%.tmp1514 = load i8*, i8** %err_msg
%.tmp1515 = call i32(i8*) @strlen(i8* %.tmp1514)
%.tmp1516 = load i8*, i8** %tmp_buff
%.tmp1517 = call i32(i8*) @strlen(i8* %.tmp1516)
%.tmp1518 = add i32 %.tmp1515, %.tmp1517
%.tmp1519 = load i8*, i8** %token_value
%.tmp1520 = call i32(i8*) @strlen(i8* %.tmp1519)
%.tmp1521 = add i32 %.tmp1518, %.tmp1520
%.tmp1522 = load i8*, i8** %err_fmt
%.tmp1523 = call i32(i8*) @strlen(i8* %.tmp1522)
%.tmp1524 = add i32 %.tmp1521, %.tmp1523
%.tmp1525 = mul i32 3, 2
%.tmp1526 = sub i32 %.tmp1524, %.tmp1525
%.tmp1527 = add i32 %.tmp1526, 1
%err_len = alloca i32
store i32 %.tmp1527, i32* %err_len
%.tmp1528 = load i32, i32* %err_len
%.tmp1529 = call i8*(i32) @malloc(i32 %.tmp1528)
%err_buf = alloca i8*
store i8* %.tmp1529, i8** %err_buf
%.tmp1530 = load i8*, i8** %err_buf
%.tmp1531 = load i32, i32* %err_len
%.tmp1532 = load i8*, i8** %err_fmt
%.tmp1533 = load i8*, i8** %err_msg
%.tmp1534 = load i8*, i8** %tmp_buff
%.tmp1535 = load i8*, i8** %token_value
%.tmp1536 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1530, i32 %.tmp1531, i8* %.tmp1532, i8* %.tmp1533, i8* %.tmp1534, i8* %.tmp1535)
%.tmp1537 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1538 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1537, i32 0, i32 0
%.tmp1539 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1538
%.tmp1540 = load i8*, i8** %err_buf
%.tmp1541 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1539, i8* %.tmp1540)
store %m717$.Error.type* %.tmp1541, %m717$.Error.type** %err
br label %.if.end.1474
.if.end.1474:
%.tmp1542 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp1542)
br label %.if.end.1440
.if.false.1440:
%.tmp1543 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1544 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1543, i32 0, i32 0
%.tmp1545 = load i8, i8* %.tmp1544
%.tmp1546 = icmp eq i8 %.tmp1545, 116
br i1 %.tmp1546, label %.if.true.1547, label %.if.false.1547
.if.true.1547:
%.tmp1548 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1549 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1548, i32 0, i32 1
%.tmp1550 = load i8*, i8** %.tmp1549
%.tmp1551 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1552 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1551, i32 0, i32 0
%.tmp1553 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1552
%.tmp1554 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1553, i32 0, i32 0
%.tmp1555 = load i8*, i8** %.tmp1554
%.tmp1556 = call i32(i8*,i8*) @strcmp(i8* %.tmp1550, i8* %.tmp1555)
%.tmp1557 = icmp eq i32 %.tmp1556, 0
br i1 %.tmp1557, label %.if.true.1558, label %.if.false.1558
.if.true.1558:
%.tmp1559 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1560 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1559, i32 0, i32 0
%.tmp1561 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1560
%.tmp1562 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1563 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1562, i32 0, i32 0
%.tmp1564 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1563
%.tmp1565 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1564, i32 0, i32 0
%.tmp1566 = load i8*, i8** %.tmp1565
%.tmp1567 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1568 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1567, i32 0, i32 0
%.tmp1569 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1568
%.tmp1570 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1569, i32 0, i32 1
%.tmp1571 = load i8*, i8** %.tmp1570
%.tmp1572 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1561, i8* %.tmp1566, i8* %.tmp1571)
store %m286$.Node.type* %.tmp1572, %m286$.Node.type** %child
%.tmp1573 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1574 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1573, %m286$.Node.type* %.tmp1574)
%.tmp1575 = load i32, i32* %new_children
%.tmp1576 = add i32 %.tmp1575, 1
store i32 %.tmp1576, i32* %new_children
%.tmp1577 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1578 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1577, i32 0, i32 0
%.tmp1579 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1580 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1579, i32 0, i32 0
%.tmp1581 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1580
%.tmp1582 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1581, i32 0, i32 5
%.tmp1583 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1582
store %m287$.Token.type* %.tmp1583, %m287$.Token.type** %.tmp1578
br label %.if.end.1558
.if.false.1558:
%.tmp1585 = getelementptr [13 x i8], [13 x i8]*@.str1584, i32 0, i32 0
%err_fmt_t = alloca i8*
store i8* %.tmp1585, i8** %err_fmt_t
%.tmp1587 = getelementptr [30 x i8], [30 x i8]*@.str1586, i32 0, i32 0
%err_msg_t = alloca i8*
store i8* %.tmp1587, i8** %err_msg_t
%.tmp1588 = load i8*, i8** %err_fmt_t
%.tmp1589 = call i32(i8*) @strlen(i8* %.tmp1588)
%.tmp1590 = load i8*, i8** %err_msg_t
%.tmp1591 = call i32(i8*) @strlen(i8* %.tmp1590)
%.tmp1592 = add i32 %.tmp1589, %.tmp1591
%.tmp1593 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1594 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1593, i32 0, i32 1
%.tmp1595 = load i8*, i8** %.tmp1594
%.tmp1596 = call i32(i8*) @strlen(i8* %.tmp1595)
%.tmp1597 = add i32 %.tmp1592, %.tmp1596
%.tmp1598 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1599 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1598, i32 0, i32 0
%.tmp1600 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1599
%.tmp1601 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1600, i32 0, i32 0
%.tmp1602 = load i8*, i8** %.tmp1601
%.tmp1603 = call i32(i8*) @strlen(i8* %.tmp1602)
%.tmp1604 = add i32 %.tmp1597, %.tmp1603
%err_len_t = alloca i32
store i32 %.tmp1604, i32* %err_len_t
%.tmp1605 = load i32, i32* %err_len_t
%.tmp1606 = call i8*(i32) @malloc(i32 %.tmp1605)
%err_buf_t = alloca i8*
store i8* %.tmp1606, i8** %err_buf_t
%.tmp1607 = load i8*, i8** %err_buf_t
%.tmp1608 = load i32, i32* %err_len_t
%.tmp1609 = load i8*, i8** %err_fmt_t
%.tmp1610 = load i8*, i8** %err_msg_t
%.tmp1611 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1612 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1611, i32 0, i32 1
%.tmp1613 = load i8*, i8** %.tmp1612
%.tmp1614 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1615 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1614, i32 0, i32 0
%.tmp1616 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1615
%.tmp1617 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1616, i32 0, i32 0
%.tmp1618 = load i8*, i8** %.tmp1617
%.tmp1619 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1607, i32 %.tmp1608, i8* %.tmp1609, i8* %.tmp1610, i8* %.tmp1613, i8* %.tmp1618)
%.tmp1620 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1621 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1620, i32 0, i32 0
%.tmp1622 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1621
%.tmp1623 = load i8*, i8** %err_buf_t
%.tmp1624 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1622, i8* %.tmp1623)
store %m717$.Error.type* %.tmp1624, %m717$.Error.type** %err
br label %.if.end.1558
.if.end.1558:
br label %.if.end.1547
.if.false.1547:
%.tmp1625 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1626 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1625, i32 0, i32 0
%.tmp1627 = load i8, i8* %.tmp1626
%.tmp1628 = icmp eq i8 %.tmp1627, 97
br i1 %.tmp1628, label %.if.true.1629, label %.if.false.1629
.if.true.1629:
%.tmp1630 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1631 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1630, i32 0, i32 1
%.tmp1632 = load %m286$.Rule.type**, %m286$.Rule.type*** %.tmp1631
%.tmp1633 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1634 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1633, i32 0, i32 1
%.tmp1635 = load i8*, i8** %.tmp1634
%.tmp1636 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1632, i8* %.tmp1635)
%alias_rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1636, %m286$.Rule.type** %alias_rule
%.tmp1637 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1638 = icmp eq %m286$.Rule.type* %.tmp1637, null
br i1 %.tmp1638, label %.if.true.1639, label %.if.false.1639
.if.true.1639:
%.tmp1640 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1641 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1640, i32 0, i32 0
%.tmp1642 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1641
%.tmp1644 = getelementptr [30 x i8], [30 x i8]*@.str1643, i32 0, i32 0
%.tmp1645 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1642, i8* %.tmp1644)
store %m717$.Error.type* %.tmp1645, %m717$.Error.type** %err
br label %.if.end.1639
.if.false.1639:
%.tmp1646 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1647 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1648 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1646, %m286$.Rule.type* %.tmp1647)
%parse_result = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1648, %m286$.ParseResult.type** %parse_result
%.tmp1649 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1650 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1649, i32 0, i32 0
%.tmp1651 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1650
%.tmp1652 = icmp ne %m717$.Error.type* %.tmp1651, null
br i1 %.tmp1652, label %.if.true.1653, label %.if.false.1653
.if.true.1653:
%.tmp1654 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1655 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1654, i32 0, i32 0
%.tmp1656 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1655
store %m717$.Error.type* %.tmp1656, %m717$.Error.type** %err
br label %.if.end.1653
.if.false.1653:
%.tmp1657 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1658 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1659 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1658, i32 0, i32 1
%.tmp1660 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1659
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1657, %m286$.Node.type* %.tmp1660)
%.tmp1661 = load i32, i32* %new_children
%.tmp1662 = add i32 %.tmp1661, 1
store i32 %.tmp1662, i32* %new_children
br label %.if.end.1653
.if.end.1653:
%.tmp1663 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1664 = bitcast %m286$.ParseResult.type* %.tmp1663 to i8*
call void(i8*) @free(i8* %.tmp1664)
br label %.if.end.1639
.if.end.1639:
br label %.if.end.1629
.if.false.1629:
%.tmp1666 = getelementptr [41 x i8], [41 x i8]*@.str1665, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1666)
br label %.if.end.1629
.if.end.1629:
br label %.if.end.1547
.if.end.1547:
br label %.if.end.1440
.if.end.1440:
%.tmp1667 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1668 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1667, i32 0, i32 2
%.tmp1669 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1668
store %m286$.Query.type* %.tmp1669, %m286$.Query.type** %q
br label %.for.start.1427
.for.end.1427:
%.tmp1670 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1671 = icmp ne %m717$.Error.type* %.tmp1670, null
br i1 %.tmp1671, label %.if.true.1672, label %.if.false.1672
.if.true.1672:
%.tmp1673 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1674 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1673, i32 0, i32 0
%.tmp1675 = load %m287$.Token.type*, %m287$.Token.type** %start_token
store %m287$.Token.type* %.tmp1675, %m287$.Token.type** %.tmp1674
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1676
.for.start.1676:
%.tmp1677 = load i32, i32* %i
%.tmp1678 = load i32, i32* %new_children
%.tmp1679 = icmp slt i32 %.tmp1677, %.tmp1678
br i1 %.tmp1679, label %.for.continue.1676, label %.for.end.1676
.for.continue.1676:
%.tmp1680 = load %m286$.Node.type*, %m286$.Node.type** %base
call void(%m286$.Node.type*) @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.tmp1680)
%.tmp1681 = load i32, i32* %i
%.tmp1682 = add i32 %.tmp1681, 1
store i32 %.tmp1682, i32* %i
br label %.for.start.1676
.for.end.1676:
br label %.if.end.1672
.if.false.1672:
br label %.if.end.1672
.if.end.1672:
%.tmp1683 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1684 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1683, i32 0, i32 2
%.tmp1685 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1684
%.tmp1686 = icmp ne %m286$.Matcher.type* %.tmp1685, null
%.tmp1687 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1688 = icmp ne %m717$.Error.type* %.tmp1687, null
%.tmp1689 = and i1 %.tmp1686, %.tmp1688
br i1 %.tmp1689, label %.if.true.1690, label %.if.false.1690
.if.true.1690:
%.tmp1691 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1692 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1693 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1692, i32 0, i32 2
%.tmp1694 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1693
%.tmp1695 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1696 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1691, %m286$.Matcher.type* %.tmp1694, %m286$.Node.type* %.tmp1695)
%new_err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1696, %m717$.Error.type** %new_err
%.tmp1697 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1698 = icmp eq %m717$.Error.type* %.tmp1697, null
br i1 %.tmp1698, label %.if.true.1699, label %.if.false.1699
.if.true.1699:
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1699
.if.false.1699:
%.tmp1700 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1701 = bitcast %m717$.Error.type* %.tmp1700 to i8*
call void(i8*) @free(i8* %.tmp1701)
br label %.if.end.1699
.if.end.1699:
br label %.if.end.1690
.if.false.1690:
br label %.if.end.1690
.if.end.1690:
%.tmp1702 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1703 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1702, i32 0, i32 1
%.tmp1704 = load i8, i8* %.tmp1703
%.tmp1705 = icmp eq i8 %.tmp1704, 49
br i1 %.tmp1705, label %.if.true.1706, label %.if.false.1706
.if.true.1706:
br label %.if.end.1706
.if.false.1706:
%.tmp1707 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1708 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1707, i32 0, i32 1
%.tmp1709 = load i8, i8* %.tmp1708
%.tmp1710 = icmp eq i8 %.tmp1709, 43
%.tmp1711 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1712 = icmp eq %m717$.Error.type* %.tmp1711, null
%.tmp1713 = and i1 %.tmp1710, %.tmp1712
br i1 %.tmp1713, label %.if.true.1714, label %.if.false.1714
.if.true.1714:
%.tmp1715 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1716 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1717 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1718 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1715, %m286$.Matcher.type* %.tmp1716, %m286$.Node.type* %.tmp1717)
store %m717$.Error.type* %.tmp1718, %m717$.Error.type** %err
%.tmp1719 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1720 = icmp ne %m717$.Error.type* %.tmp1719, null
br i1 %.tmp1720, label %.if.true.1721, label %.if.false.1721
.if.true.1721:
%.tmp1722 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1723 = bitcast %m717$.Error.type* %.tmp1722 to i8*
call void(i8*) @free(i8* %.tmp1723)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1721
.if.false.1721:
%.tmp1724 = bitcast ptr null to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1724
br label %.if.end.1721
.if.end.1721:
br label %.if.end.1714
.if.false.1714:
%.tmp1725 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1726 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1725, i32 0, i32 1
%.tmp1727 = load i8, i8* %.tmp1726
%.tmp1728 = icmp eq i8 %.tmp1727, 63
%.tmp1729 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1730 = icmp ne %m717$.Error.type* %.tmp1729, null
%.tmp1731 = and i1 %.tmp1728, %.tmp1730
br i1 %.tmp1731, label %.if.true.1732, label %.if.false.1732
.if.true.1732:
%.tmp1733 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1734 = bitcast %m717$.Error.type* %.tmp1733 to i8*
call void(i8*) @free(i8* %.tmp1734)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1732
.if.false.1732:
%.tmp1735 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1736 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1735, i32 0, i32 1
%.tmp1737 = load i8, i8* %.tmp1736
%.tmp1738 = icmp eq i8 %.tmp1737, 42
br i1 %.tmp1738, label %.if.true.1739, label %.if.false.1739
.if.true.1739:
%.tmp1740 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1741 = icmp ne %m717$.Error.type* %.tmp1740, null
br i1 %.tmp1741, label %.if.true.1742, label %.if.false.1742
.if.true.1742:
%.tmp1743 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1744 = bitcast %m717$.Error.type* %.tmp1743 to i8*
call void(i8*) @free(i8* %.tmp1744)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1742
.if.false.1742:
%.tmp1745 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1746 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1747 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1748 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1745, %m286$.Matcher.type* %.tmp1746, %m286$.Node.type* %.tmp1747)
ret %m717$.Error.type* %.tmp1748
br label %.if.end.1742
.if.end.1742:
br label %.if.end.1739
.if.false.1739:
br label %.if.end.1739
.if.end.1739:
br label %.if.end.1732
.if.end.1732:
br label %.if.end.1714
.if.end.1714:
br label %.if.end.1706
.if.end.1706:
%.tmp1749 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1750 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1749, i32 0, i32 3
%.tmp1751 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1750
%.tmp1752 = icmp ne %m286$.Matcher.type* %.tmp1751, null
%.tmp1753 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1754 = icmp eq %m717$.Error.type* %.tmp1753, null
%.tmp1755 = and i1 %.tmp1752, %.tmp1754
br i1 %.tmp1755, label %.if.true.1756, label %.if.false.1756
.if.true.1756:
%.tmp1757 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1758 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1759 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1758, i32 0, i32 3
%.tmp1760 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1759
%.tmp1761 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1762 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1757, %m286$.Matcher.type* %.tmp1760, %m286$.Node.type* %.tmp1761)
store %m717$.Error.type* %.tmp1762, %m717$.Error.type** %err
br label %.if.end.1756
.if.false.1756:
br label %.if.end.1756
.if.end.1756:
%.tmp1763 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1764 = bitcast %m717$.Error.type* %.tmp1763 to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1764
}
define %m286$.ParseResult.type* @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.c.arg, %m286$.Rule.type* %.rule.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.rule.arg, %m286$.Rule.type** %rule
%.tmp1765 = load i32, i32* @ParseResult_size
%.tmp1766 = call i8*(i32) @malloc(i32 %.tmp1765)
%.tmp1767 = bitcast i8* %.tmp1766 to %m286$.ParseResult.type*
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1767, %m286$.ParseResult.type** %res
%.tmp1768 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1769 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1768, i32 0, i32 0
store %m717$.Error.type* null, %m717$.Error.type** %.tmp1769
%.tmp1770 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1771 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1770, i32 0, i32 1
%.tmp1772 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1773 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1772, i32 0, i32 0
%.tmp1774 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1773
%.tmp1775 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1776 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1775, i32 0, i32 0
%.tmp1777 = load i8*, i8** %.tmp1776
%.tmp1778 = bitcast ptr null to i8*
%.tmp1779 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1774, i8* %.tmp1777, i8* %.tmp1778)
store %m286$.Node.type* %.tmp1779, %m286$.Node.type** %.tmp1771
%.tmp1780 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1781 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1780, i32 0, i32 0
%.tmp1782 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1781
%start_match = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1782, %m287$.Token.type** %start_match
%.tmp1783 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1784 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1783, i32 0, i32 0
%.tmp1785 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1786 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1787 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1786, i32 0, i32 1
%.tmp1788 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1787
%.tmp1789 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1790 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1789, i32 0, i32 1
%.tmp1791 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1790
%.tmp1792 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1785, %m286$.Matcher.type* %.tmp1788, %m286$.Node.type* %.tmp1791)
store %m717$.Error.type* %.tmp1792, %m717$.Error.type** %.tmp1784
%.tmp1793 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1793
}
define %m286$.ParseResult.type* @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.grammar.arg, i8* %.start.arg, %m287$.Token.type* %.tokens.arg) {
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.grammar.arg, %m286$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tokens.arg, %m287$.Token.type** %tokens
%.tmp1794 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1795 = load i8*, i8** %start
%.tmp1796 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1794, i8* %.tmp1795)
%start_matcher = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1796, %m286$.Rule.type** %start_matcher
%.tmp1797 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1798 = icmp ne %m286$.Rule.type* %.tmp1797, null
%.tmp1800 = getelementptr [44 x i8], [44 x i8]*@.str1799, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1798, i8* %.tmp1800)
%c = alloca %m286$.AstContext.type
%.tmp1801 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1802 = load %m287$.Token.type*, %m287$.Token.type** %tokens
store %m287$.Token.type* %.tmp1802, %m287$.Token.type** %.tmp1801
%.tmp1803 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
%.tmp1804 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
store %m286$.Rule.type** %.tmp1804, %m286$.Rule.type*** %.tmp1803
%.tmp1805 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0
%.tmp1806 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1807 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1805, %m286$.Rule.type* %.tmp1806)
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1807, %m286$.ParseResult.type** %res
%.tmp1808 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1809 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1808
%.tmp1810 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1809, i32 0, i32 0
%.tmp1811 = load i8*, i8** %.tmp1810
%.tmp1813 = getelementptr [4 x i8], [4 x i8]*@.str1812, i32 0, i32 0
%.tmp1814 = call i32(i8*,i8*) @strcmp(i8* %.tmp1811, i8* %.tmp1813)
%.tmp1815 = icmp ne i32 %.tmp1814, 0
%.tmp1816 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1817 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1816, i32 0, i32 0
%.tmp1818 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1817
%.tmp1819 = icmp eq %m717$.Error.type* %.tmp1818, null
%.tmp1820 = and i1 %.tmp1815, %.tmp1819
br i1 %.tmp1820, label %.if.true.1821, label %.if.false.1821
.if.true.1821:
%.tmp1822 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1823 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1822, i32 0, i32 0
%.tmp1824 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1825 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1824
%.tmp1827 = getelementptr [26 x i8], [26 x i8]*@.str1826, i32 0, i32 0
%.tmp1828 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1825, i8* %.tmp1827)
store %m717$.Error.type* %.tmp1828, %m717$.Error.type** %.tmp1823
br label %.if.end.1821
.if.false.1821:
br label %.if.end.1821
.if.end.1821:
%.tmp1829 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1829
}
@.str774 = constant [14 x i8] c"{\0A\22querys\22: [\00"
@.str788 = constant [30 x i8] c"\0A{\22type\22: \22%c\22, \22value\22: %s},\00"
@.str797 = constant [32 x i8] c"\0A{\22type\22: \22%c\22, \22value\22: \22%s\22},\00"
@.str809 = constant [14 x i8] c"],\0A\22next\22: [\0A\00"
@.str820 = constant [13 x i8] c"],\0A\22alt\22: [\0A\00"
@.str831 = constant [5 x i8] c"]\0A}\0A\00"
@.str866 = constant [2 x i8] c"(\00"
@.str885 = constant [2 x i8] c"|\00"
@.str904 = constant [2 x i8] c")\00"
@.str913 = constant [4 x i8] c"EOF\00"
@.str930 = constant [2 x i8] c"|\00"
@.str939 = constant [2 x i8] c")\00"
@.str945 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str968 = constant [2 x i8] c"|\00"
@.str985 = constant [2 x i8] c")\00"
@.str991 = constant [22 x i8] c"open brace not closed\00"
@.str1005 = constant [2 x i8] c"+\00"
@.str1024 = constant [2 x i8] c"*\00"
@.str1043 = constant [2 x i8] c"?\00"
@.str1064 = constant [2 x i8] c"(\00"
@.str1073 = constant [5 x i8] c"WORD\00"
@.str1092 = constant [5 x i8] c"WORD\00"
@.str1099 = constant [7 x i8] c"STRING\00"
@.str1142 = constant [7 x i8] c"STRING\00"
@.str1167 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1176 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1207 = constant [5 x i8] c"WORD\00"
@.str1212 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1226 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1240 = constant [2 x i8] c":\00"
@.str1252 = constant [27 x i8] c"expected : after rule name\00"
@.str1289 = constant [4 x i8] c"EOF\00"
@.str1298 = constant [3 x i8] c"NL\00"
@.str1452 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1508 = constant [7 x i8] c"(null)\00"
@.str1510 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1512 = constant [31 x i8] c"unable to match token by value\00"
@.str1584 = constant [13 x i8] c"%s: %s != %s\00"
@.str1586 = constant [30 x i8] c"unable to match token by type\00"
@.str1643 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1665 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1799 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1812 = constant [4 x i8] c"EOF\00"
@.str1826 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1831$grammar.cp() {
%.tmp1833 = getelementptr [1598 x i8], [1598 x i8]*@.str1832, i32 0, i32 0
ret i8* %.tmp1833
}
@.str1832 = constant [1598 x i8] c"
start: (head_comment)? (statement)*

head_comment: \22#\22 (OPERATOR | WORD)* NL

statement: (NL | import | typealias | extern | global | function )

typealias: \22alias\22 WORD \22=\22 type

extern: \22extern\22 type WORD \22(\22 (fn_params)? ( \22)\22 )

import: \22import\22 STRING \22as\22 WORD

destination: dotted_name ( \22[\22 assignable \22]\22 )*

dotted_name: WORD ( \22.\22 WORD )*

boolean: (\22true\22 | \22false\22)

addr_destination: (\22&\22)* (destination)

operator: ( \22+\22 | \22/\22 | \22==\22 | \22!=\22 | \22|\22 | \22&\22 | \22<=\22 | \22>=\22 | \22<\22 | \22>\22 | \22*\22 | \22-\22 )

mono_assignable: ( fn_call | boolean | \22null\22 | addr_destination | NUMBER | CHR | STRING  )

assignable: (cast)? mono_assignable ( operator mono_assignable)*

global: type WORD \22=\22 assignable

cast: \22(\22 type \22)\22

fn_params: ( type WORD) (\22,\22 type WORD | \22,\22 WORD )*

function: type WORD \22(\22 (fn_params)? ( \22)\22 block )

structdef: ( \22struct\22 \22{\22 NL ) ( ( type WORD \22,\22 NL ) | ( NL ) )* ( \22}\22 )

type: ( \22void\22 | \22int\22 | \22bool\22 | \22chr\22 | \22str\22 | structdef | dotted_name | \22...\22 ) (\22*\22)*

if_block: \22if\22 assignable block (elif_block)? (NL)

elif_block: (\22elif\22 assignable block (elif_block)? | else_block)

else_block: \22else\22 block

return: \22return\22 (assignable)? (NL)

declaration: ( type WORD \22=\22 assignable | WORD \22:\22 \22=\22 assignable | type WORD )

assignment: destination \22=\22 assignable

fn_args: assignable ( \22,\22 assignable )*

fn_call: (destination \22(\22) (fn_args)? (\22)\22)

expression: ( if_block | return | for_loop | assignment | fn_call | declaration | NL )

block: \22{\22 NL (expression)* (\22}\22)

for_loop: \22for\22 (declaration | assignment)? (\22;\22) (assignable)? (\22;\22) (assignment)? block
\00"
define i8* @m1834$node_to_string.cp.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp1835 = call %m0$.File.type*() @tmpfile()
%tmp = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1835, %m0$.File.type** %tmp
%.tmp1836 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp1837 = load %m0$.File.type*, %m0$.File.type** %tmp
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1834$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1836, %m0$.File.type* %.tmp1837, i32 1)
%.tmp1838 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1839 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1838)
%.tmp1840 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1841 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1840)
%str_len = alloca i32
store i32 %.tmp1841, i32* %str_len
%.tmp1842 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1843 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1842)
%tmp_fd = alloca i32
store i32 %.tmp1843, i32* %tmp_fd
%.tmp1844 = load i32, i32* %tmp_fd
%.tmp1845 = load i32, i32* @SEEK_SET
%.tmp1846 = call i32(i32,i32,i32) @lseek(i32 %.tmp1844, i32 0, i32 %.tmp1845)
%.tmp1847 = load i32, i32* %str_len
%.tmp1848 = call i8*(i32) @malloc(i32 %.tmp1847)
%buf = alloca i8*
store i8* %.tmp1848, i8** %buf
%.tmp1849 = load i32, i32* %tmp_fd
%.tmp1850 = load i8*, i8** %buf
%.tmp1851 = load i32, i32* %str_len
%.tmp1852 = call i32(i32,i8*,i32) @read(i32 %.tmp1849, i8* %.tmp1850, i32 %.tmp1851)
%read = alloca i32
store i32 %.tmp1852, i32* %read
%.tmp1853 = load i32, i32* %read
%.tmp1854 = load i32, i32* %str_len
%.tmp1855 = icmp ne i32 %.tmp1853, %.tmp1854
br i1 %.tmp1855, label %.if.true.1856, label %.if.false.1856
.if.true.1856:
%.tmp1857 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp1857)
store i8* null, i8** %buf
br label %.if.end.1856
.if.false.1856:
br label %.if.end.1856
.if.end.1856:
%.tmp1858 = load i8*, i8** %buf
ret i8* %.tmp1858
}
define void @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1859 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1861 = getelementptr [2 x i8], [2 x i8]*@.str1860, i32 0, i32 0
%.tmp1862 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1859, i8* %.tmp1861)
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1863
.for.start.1863:
%.tmp1864 = load i32, i32* %i
%.tmp1865 = load i32, i32* %indent
%.tmp1866 = icmp slt i32 %.tmp1864, %.tmp1865
br i1 %.tmp1866, label %.for.continue.1863, label %.for.end.1863
.for.continue.1863:
%.tmp1867 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1869 = getelementptr [3 x i8], [3 x i8]*@.str1868, i32 0, i32 0
%.tmp1870 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1867, i8* %.tmp1869)
%.tmp1871 = load i32, i32* %i
%.tmp1872 = add i32 %.tmp1871, 1
store i32 %.tmp1872, i32* %i
br label %.for.start.1863
.for.end.1863:
ret void
}
define void @m1834$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1873 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1874 = icmp eq %m286$.Node.type* %.tmp1873, null
br i1 %.tmp1874, label %.if.true.1875, label %.if.false.1875
.if.true.1875:
%.tmp1876 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1878 = getelementptr [7 x i8], [7 x i8]*@.str1877, i32 0, i32 0
%.tmp1879 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1876, i8* %.tmp1878)
ret void
br label %.if.end.1875
.if.false.1875:
br label %.if.end.1875
.if.end.1875:
%.tmp1880 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1882 = getelementptr [2 x i8], [2 x i8]*@.str1881, i32 0, i32 0
%.tmp1883 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1880, i8* %.tmp1882)
%.tmp1884 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1885 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1884, i32 %.tmp1885)
%.tmp1886 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1888 = getelementptr [13 x i8], [13 x i8]*@.str1887, i32 0, i32 0
%.tmp1889 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1890 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1889, i32 0, i32 0
%.tmp1891 = load i8*, i8** %.tmp1890
%.tmp1892 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1886, i8* %.tmp1888, i8* %.tmp1891)
%.tmp1893 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1894 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1893, i32 %.tmp1894)
%.tmp1895 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1897 = getelementptr [12 x i8], [12 x i8]*@.str1896, i32 0, i32 0
%.tmp1898 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1899 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1898, i32 0, i32 1
%.tmp1900 = load i8*, i8** %.tmp1899
%.tmp1901 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1895, i8* %.tmp1897, i8* %.tmp1900)
%.tmp1902 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1903 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1902, i32 %.tmp1903)
%.tmp1904 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1906 = getelementptr [11 x i8], [11 x i8]*@.str1905, i32 0, i32 0
%.tmp1907 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1908 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1907, i32 0, i32 3
%.tmp1909 = load i32, i32* %.tmp1908
%.tmp1910 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1904, i8* %.tmp1906, i32 %.tmp1909)
%.tmp1911 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1912 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1911, i32 %.tmp1912)
%.tmp1913 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1915 = getelementptr [19 x i8], [19 x i8]*@.str1914, i32 0, i32 0
%.tmp1916 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1917 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1916, i32 0, i32 4
%.tmp1918 = load i32, i32* %.tmp1917
%.tmp1919 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1913, i8* %.tmp1915, i32 %.tmp1918)
%.tmp1920 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1921 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1920, i32 %.tmp1921)
%.tmp1922 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1924 = getelementptr [9 x i8], [9 x i8]*@.str1923, i32 0, i32 0
%.tmp1925 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1922, i8* %.tmp1924)
%.tmp1926 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1927 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1926, i32 0, i32 7
%.tmp1928 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1927
%.tmp1929 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1930 = load i32, i32* %indent
%.tmp1931 = add i32 %.tmp1930, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1834$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1928, %m0$.File.type* %.tmp1929, i32 %.tmp1931)
%.tmp1932 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1933 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1932, i32 %.tmp1933)
%.tmp1934 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1936 = getelementptr [13 x i8], [13 x i8]*@.str1935, i32 0, i32 0
%.tmp1937 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1934, i8* %.tmp1936)
%.tmp1938 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1938, i32 0, i32 6
%.tmp1940 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1939
%.tmp1941 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1942 = load i32, i32* %indent
%.tmp1943 = add i32 %.tmp1942, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1834$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1940, %m0$.File.type* %.tmp1941, i32 %.tmp1943)
%.tmp1944 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1945 = load i32, i32* %indent
%.tmp1946 = sub i32 %.tmp1945, 1
call void(%m0$.File.type*,i32) @m1834$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1944, i32 %.tmp1946)
%.tmp1947 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1949 = getelementptr [2 x i8], [2 x i8]*@.str1948, i32 0, i32 0
%.tmp1950 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1947, i8* %.tmp1949)
ret void
}
@.str1860 = constant [2 x i8] c"\0A\00"
@.str1868 = constant [3 x i8] c"  \00"
@.str1877 = constant [7 x i8] c"(null)\00"
@.str1881 = constant [2 x i8] c"{\00"
@.str1887 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1896 = constant [12 x i8] c"\22value\22: %s\00"
@.str1905 = constant [11 x i8] c"\22line\22: %d\00"
@.str1914 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1923 = constant [9 x i8] c"\22next\22: \00"
@.str1935 = constant [13 x i8] c"\22children\22: \00"
@.str1948 = constant [2 x i8] c"}\00"
%m1951$.SYStack.type = type {%m286$.Node.type*,%m1951$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1951$.SYStack.type* @m1951$stack_new.m1951$.SYStack.typep() {
%.tmp1952 = load i32, i32* @SYStack_size
%.tmp1953 = call i8*(i32) @malloc(i32 %.tmp1952)
%.tmp1954 = bitcast i8* %.tmp1953 to %m1951$.SYStack.type*
%s = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp1954, %m1951$.SYStack.type** %s
%.tmp1955 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
%.tmp1956 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp1955, i32 0, i32 0
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1956
%.tmp1957 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
%.tmp1958 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp1957, i32 0, i32 1
store %m1951$.SYStack.type* null, %m1951$.SYStack.type** %.tmp1958
%.tmp1959 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
ret %m1951$.SYStack.type* %.tmp1959
}
define %m1951$.SYStack.type* @m1951$sy_algorithm.m1951$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.assignable.arg) {
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.assignable.arg, %m286$.Node.type** %assignable
%.tmp1960 = call %m1951$.SYStack.type*() @m1951$stack_new.m1951$.SYStack.typep()
%out_stack = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp1960, %m1951$.SYStack.type** %out_stack
%.tmp1961 = call %m1951$.SYStack.type*() @m1951$stack_new.m1951$.SYStack.typep()
%op_stack = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp1961, %m1951$.SYStack.type** %op_stack
%.tmp1962 = call %m1951$.SYStack.type*() @m1951$stack_new.m1951$.SYStack.typep()
%token_stack = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp1962, %m1951$.SYStack.type** %token_stack
%ptr = alloca %m286$.Node.type*
%.tmp1964 = load %m286$.Node.type*, %m286$.Node.type** %assignable
store %m286$.Node.type* %.tmp1964, %m286$.Node.type** %ptr
br label %.for.start.1963
.for.start.1963:
%.tmp1965 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1966 = icmp ne %m286$.Node.type* %.tmp1965, null
br i1 %.tmp1966, label %.for.continue.1963, label %.for.end.1963
.for.continue.1963:
%.tmp1967 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %token_stack
%.tmp1968 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1969 = call %m1951$.SYStack.type*(%m1951$.SYStack.type*,%m286$.Node.type*) @m1951$stack_push.m1951$.SYStack.typep.m1951$.SYStack.typep.m286$.Node.typep(%m1951$.SYStack.type* %.tmp1967, %m286$.Node.type* %.tmp1968)
store %m1951$.SYStack.type* %.tmp1969, %m1951$.SYStack.type** %token_stack
%.tmp1970 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1971 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1970, i32 0, i32 7
%.tmp1972 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1971
store %m286$.Node.type* %.tmp1972, %m286$.Node.type** %ptr
br label %.for.start.1963
.for.end.1963:
%.tmp1974 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %token_stack
%.tmp1975 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp1974, i32 0, i32 0
%.tmp1976 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1975
store %m286$.Node.type* %.tmp1976, %m286$.Node.type** %ptr
br label %.for.start.1973
.for.start.1973:
%.tmp1977 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1978 = icmp ne %m286$.Node.type* %.tmp1977, null
br i1 %.tmp1978, label %.for.continue.1973, label %.for.end.1973
.for.continue.1973:
%.tmp1979 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %token_stack
%cs = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp1979, %m1951$.SYStack.type** %cs
%.tmp1980 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %token_stack
%.tmp1981 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp1980, i32 0, i32 1
%.tmp1982 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp1981
store %m1951$.SYStack.type* %.tmp1982, %m1951$.SYStack.type** %token_stack
%.tmp1983 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %cs
%.tmp1984 = bitcast %m1951$.SYStack.type* %.tmp1983 to i8*
call void(i8*) @free(i8* %.tmp1984)
%.tmp1985 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1986 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1985, i32 0, i32 0
%.tmp1987 = load i8*, i8** %.tmp1986
%.tmp1989 = getelementptr [16 x i8], [16 x i8]*@.str1988, i32 0, i32 0
%.tmp1990 = call i32(i8*,i8*) @strcmp(i8* %.tmp1987, i8* %.tmp1989)
%.tmp1991 = icmp eq i32 %.tmp1990, 0
br i1 %.tmp1991, label %.if.true.1992, label %.if.false.1992
.if.true.1992:
%.tmp1993 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %out_stack
%.tmp1994 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1995 = call %m1951$.SYStack.type*(%m1951$.SYStack.type*,%m286$.Node.type*) @m1951$stack_push.m1951$.SYStack.typep.m1951$.SYStack.typep.m286$.Node.typep(%m1951$.SYStack.type* %.tmp1993, %m286$.Node.type* %.tmp1994)
store %m1951$.SYStack.type* %.tmp1995, %m1951$.SYStack.type** %out_stack
br label %.if.end.1992
.if.false.1992:
%.tmp1996 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1997 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1996, i32 0, i32 0
%.tmp1998 = load i8*, i8** %.tmp1997
%.tmp2000 = getelementptr [9 x i8], [9 x i8]*@.str1999, i32 0, i32 0
%.tmp2001 = call i32(i8*,i8*) @strcmp(i8* %.tmp1998, i8* %.tmp2000)
%.tmp2002 = icmp eq i32 %.tmp2001, 0
br i1 %.tmp2002, label %.if.true.2003, label %.if.false.2003
.if.true.2003:
%quit = alloca i1
store i1 0, i1* %quit
br label %.for.start.2004
.for.start.2004:
%.tmp2005 = load i1, i1* %quit
%.tmp2006 = icmp eq i1 %.tmp2005, 0
br i1 %.tmp2006, label %.for.continue.2004, label %.for.end.2004
.for.continue.2004:
%.tmp2007 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2008 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2007, i32 0, i32 0
%.tmp2009 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2008
%.tmp2010 = icmp eq %m286$.Node.type* %.tmp2009, null
br i1 %.tmp2010, label %.if.true.2011, label %.if.false.2011
.if.true.2011:
store i1 1, i1* %quit
br label %.if.end.2011
.if.false.2011:
%.tmp2012 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2013 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2012, i32 0, i32 0
%.tmp2014 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2013
%.tmp2015 = call i32(%m286$.Node.type*) @m1951$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp2014)
%.tmp2016 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp2017 = call i32(%m286$.Node.type*) @m1951$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp2016)
%.tmp2018 = icmp slt i32 %.tmp2015, %.tmp2017
br i1 %.tmp2018, label %.if.true.2019, label %.if.false.2019
.if.true.2019:
%.tmp2020 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%top = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp2020, %m1951$.SYStack.type** %top
%.tmp2021 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2022 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2021, i32 0, i32 1
%.tmp2023 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp2022
store %m1951$.SYStack.type* %.tmp2023, %m1951$.SYStack.type** %op_stack
%.tmp2024 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %out_stack
%.tmp2025 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %top
%.tmp2026 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2025, i32 0, i32 0
%.tmp2027 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2026
%.tmp2028 = call %m1951$.SYStack.type*(%m1951$.SYStack.type*,%m286$.Node.type*) @m1951$stack_push.m1951$.SYStack.typep.m1951$.SYStack.typep.m286$.Node.typep(%m1951$.SYStack.type* %.tmp2024, %m286$.Node.type* %.tmp2027)
store %m1951$.SYStack.type* %.tmp2028, %m1951$.SYStack.type** %out_stack
%.tmp2029 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %top
%.tmp2030 = bitcast %m1951$.SYStack.type* %.tmp2029 to i8*
call void(i8*) @free(i8* %.tmp2030)
br label %.if.end.2019
.if.false.2019:
store i1 1, i1* %quit
br label %.if.end.2019
.if.end.2019:
br label %.if.end.2011
.if.end.2011:
br label %.for.start.2004
.for.end.2004:
%.tmp2031 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2032 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp2033 = call %m1951$.SYStack.type*(%m1951$.SYStack.type*,%m286$.Node.type*) @m1951$stack_push.m1951$.SYStack.typep.m1951$.SYStack.typep.m286$.Node.typep(%m1951$.SYStack.type* %.tmp2031, %m286$.Node.type* %.tmp2032)
store %m1951$.SYStack.type* %.tmp2033, %m1951$.SYStack.type** %op_stack
br label %.if.end.2003
.if.false.2003:
%.tmp2035 = getelementptr [68 x i8], [68 x i8]*@.str2034, i32 0, i32 0
%.tmp2036 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp2037 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2036, i32 0, i32 0
%.tmp2038 = load i8*, i8** %.tmp2037
%.tmp2039 = call i32(i8*,...) @printf(i8* %.tmp2035, i8* %.tmp2038)
br label %.if.end.2003
.if.end.2003:
br label %.if.end.1992
.if.end.1992:
%.tmp2040 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %token_stack
%.tmp2041 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2040, i32 0, i32 0
%.tmp2042 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2041
store %m286$.Node.type* %.tmp2042, %m286$.Node.type** %ptr
br label %.for.start.1973
.for.end.1973:
br label %.for.start.2043
.for.start.2043:
%.tmp2044 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2045 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2044, i32 0, i32 0
%.tmp2046 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2045
%.tmp2047 = icmp ne %m286$.Node.type* %.tmp2046, null
br i1 %.tmp2047, label %.for.continue.2043, label %.for.end.2043
.for.continue.2043:
%.tmp2048 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2049 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2048, i32 0, i32 0
%.tmp2050 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2049
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2050, %m286$.Node.type** %node
%.tmp2051 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%s = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp2051, %m1951$.SYStack.type** %s
%.tmp2052 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %op_stack
%.tmp2053 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2052, i32 0, i32 1
%.tmp2054 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp2053
store %m1951$.SYStack.type* %.tmp2054, %m1951$.SYStack.type** %op_stack
%.tmp2055 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
%.tmp2056 = bitcast %m1951$.SYStack.type* %.tmp2055 to i8*
call void(i8*) @free(i8* %.tmp2056)
%.tmp2057 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %out_stack
%.tmp2058 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2059 = call %m1951$.SYStack.type*(%m1951$.SYStack.type*,%m286$.Node.type*) @m1951$stack_push.m1951$.SYStack.typep.m1951$.SYStack.typep.m286$.Node.typep(%m1951$.SYStack.type* %.tmp2057, %m286$.Node.type* %.tmp2058)
store %m1951$.SYStack.type* %.tmp2059, %m1951$.SYStack.type** %out_stack
br label %.for.start.2043
.for.end.2043:
%.tmp2060 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %out_stack
ret %m1951$.SYStack.type* %.tmp2060
}
define %m1951$.SYStack.type* @m1951$stack_push.m1951$.SYStack.typep.m1951$.SYStack.typep.m286$.Node.typep(%m1951$.SYStack.type* %.curr_stack.arg, %m286$.Node.type* %.node.arg) {
%curr_stack = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.curr_stack.arg, %m1951$.SYStack.type** %curr_stack
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2061 = load i32, i32* @SYStack_size
%.tmp2062 = call i8*(i32) @malloc(i32 %.tmp2061)
%.tmp2063 = bitcast i8* %.tmp2062 to %m1951$.SYStack.type*
%s = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp2063, %m1951$.SYStack.type** %s
%.tmp2064 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
%.tmp2065 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2064, i32 0, i32 0
%.tmp2066 = load %m286$.Node.type*, %m286$.Node.type** %node
store %m286$.Node.type* %.tmp2066, %m286$.Node.type** %.tmp2065
%.tmp2067 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
%.tmp2068 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp2067, i32 0, i32 1
%.tmp2069 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %curr_stack
store %m1951$.SYStack.type* %.tmp2069, %m1951$.SYStack.type** %.tmp2068
%.tmp2070 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %s
ret %m1951$.SYStack.type* %.tmp2070
}
define i32 @m1951$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp2071 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp2072 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2071, i32 0, i32 6
%.tmp2073 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2072
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2073, %m286$.Node.type** %op
%.tmp2074 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2075 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2074, i32 0, i32 1
%.tmp2076 = load i8*, i8** %.tmp2075
%.tmp2078 = getelementptr [2 x i8], [2 x i8]*@.str2077, i32 0, i32 0
%.tmp2079 = call i32(i8*,i8*) @strcmp(i8* %.tmp2076, i8* %.tmp2078)
%.tmp2080 = icmp eq i32 %.tmp2079, 0
%.tmp2081 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2082 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2081, i32 0, i32 1
%.tmp2083 = load i8*, i8** %.tmp2082
%.tmp2085 = getelementptr [2 x i8], [2 x i8]*@.str2084, i32 0, i32 0
%.tmp2086 = call i32(i8*,i8*) @strcmp(i8* %.tmp2083, i8* %.tmp2085)
%.tmp2087 = icmp eq i32 %.tmp2086, 0
%.tmp2088 = or i1 %.tmp2080, %.tmp2087
br i1 %.tmp2088, label %.if.true.2089, label %.if.false.2089
.if.true.2089:
ret i32 4
br label %.if.end.2089
.if.false.2089:
%.tmp2090 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2091 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2090, i32 0, i32 1
%.tmp2092 = load i8*, i8** %.tmp2091
%.tmp2094 = getelementptr [2 x i8], [2 x i8]*@.str2093, i32 0, i32 0
%.tmp2095 = call i32(i8*,i8*) @strcmp(i8* %.tmp2092, i8* %.tmp2094)
%.tmp2096 = icmp eq i32 %.tmp2095, 0
%.tmp2097 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2098 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2097, i32 0, i32 1
%.tmp2099 = load i8*, i8** %.tmp2098
%.tmp2101 = getelementptr [2 x i8], [2 x i8]*@.str2100, i32 0, i32 0
%.tmp2102 = call i32(i8*,i8*) @strcmp(i8* %.tmp2099, i8* %.tmp2101)
%.tmp2103 = icmp eq i32 %.tmp2102, 0
%.tmp2104 = or i1 %.tmp2096, %.tmp2103
br i1 %.tmp2104, label %.if.true.2105, label %.if.false.2105
.if.true.2105:
ret i32 3
br label %.if.end.2105
.if.false.2105:
%.tmp2106 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2107 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2106, i32 0, i32 1
%.tmp2108 = load i8*, i8** %.tmp2107
%.tmp2110 = getelementptr [3 x i8], [3 x i8]*@.str2109, i32 0, i32 0
%.tmp2111 = call i32(i8*,i8*) @strcmp(i8* %.tmp2108, i8* %.tmp2110)
%.tmp2112 = icmp eq i32 %.tmp2111, 0
%.tmp2113 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2114 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2113, i32 0, i32 1
%.tmp2115 = load i8*, i8** %.tmp2114
%.tmp2117 = getelementptr [3 x i8], [3 x i8]*@.str2116, i32 0, i32 0
%.tmp2118 = call i32(i8*,i8*) @strcmp(i8* %.tmp2115, i8* %.tmp2117)
%.tmp2119 = icmp eq i32 %.tmp2118, 0
%.tmp2120 = or i1 %.tmp2112, %.tmp2119
br i1 %.tmp2120, label %.if.true.2121, label %.if.false.2121
.if.true.2121:
ret i32 7
br label %.if.end.2121
.if.false.2121:
%.tmp2122 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2123 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2122, i32 0, i32 1
%.tmp2124 = load i8*, i8** %.tmp2123
%.tmp2126 = getelementptr [3 x i8], [3 x i8]*@.str2125, i32 0, i32 0
%.tmp2127 = call i32(i8*,i8*) @strcmp(i8* %.tmp2124, i8* %.tmp2126)
%.tmp2128 = icmp eq i32 %.tmp2127, 0
%.tmp2129 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2130 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2129, i32 0, i32 1
%.tmp2131 = load i8*, i8** %.tmp2130
%.tmp2133 = getelementptr [3 x i8], [3 x i8]*@.str2132, i32 0, i32 0
%.tmp2134 = call i32(i8*,i8*) @strcmp(i8* %.tmp2131, i8* %.tmp2133)
%.tmp2135 = icmp eq i32 %.tmp2134, 0
%.tmp2136 = or i1 %.tmp2128, %.tmp2135
br i1 %.tmp2136, label %.if.true.2137, label %.if.false.2137
.if.true.2137:
ret i32 6
br label %.if.end.2137
.if.false.2137:
%.tmp2138 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2139 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2138, i32 0, i32 1
%.tmp2140 = load i8*, i8** %.tmp2139
%.tmp2142 = getelementptr [2 x i8], [2 x i8]*@.str2141, i32 0, i32 0
%.tmp2143 = call i32(i8*,i8*) @strcmp(i8* %.tmp2140, i8* %.tmp2142)
%.tmp2144 = icmp eq i32 %.tmp2143, 0
%.tmp2145 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2146 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2145, i32 0, i32 1
%.tmp2147 = load i8*, i8** %.tmp2146
%.tmp2149 = getelementptr [2 x i8], [2 x i8]*@.str2148, i32 0, i32 0
%.tmp2150 = call i32(i8*,i8*) @strcmp(i8* %.tmp2147, i8* %.tmp2149)
%.tmp2151 = icmp eq i32 %.tmp2150, 0
%.tmp2152 = or i1 %.tmp2144, %.tmp2151
br i1 %.tmp2152, label %.if.true.2153, label %.if.false.2153
.if.true.2153:
ret i32 6
br label %.if.end.2153
.if.false.2153:
%.tmp2154 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2155 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2154, i32 0, i32 1
%.tmp2156 = load i8*, i8** %.tmp2155
%.tmp2158 = getelementptr [2 x i8], [2 x i8]*@.str2157, i32 0, i32 0
%.tmp2159 = call i32(i8*,i8*) @strcmp(i8* %.tmp2156, i8* %.tmp2158)
%.tmp2160 = icmp eq i32 %.tmp2159, 0
br i1 %.tmp2160, label %.if.true.2161, label %.if.false.2161
.if.true.2161:
ret i32 11
br label %.if.end.2161
.if.false.2161:
%.tmp2162 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2163 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2162, i32 0, i32 1
%.tmp2164 = load i8*, i8** %.tmp2163
%.tmp2166 = getelementptr [2 x i8], [2 x i8]*@.str2165, i32 0, i32 0
%.tmp2167 = call i32(i8*,i8*) @strcmp(i8* %.tmp2164, i8* %.tmp2166)
%.tmp2168 = icmp eq i32 %.tmp2167, 0
br i1 %.tmp2168, label %.if.true.2169, label %.if.false.2169
.if.true.2169:
ret i32 12
br label %.if.end.2169
.if.false.2169:
br label %.if.end.2169
.if.end.2169:
br label %.if.end.2161
.if.end.2161:
br label %.if.end.2153
.if.end.2153:
br label %.if.end.2137
.if.end.2137:
br label %.if.end.2121
.if.end.2121:
br label %.if.end.2105
.if.end.2105:
br label %.if.end.2089
.if.end.2089:
%.tmp2171 = getelementptr [65 x i8], [65 x i8]*@.str2170, i32 0, i32 0
%.tmp2172 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2173 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2172, i32 0, i32 1
%.tmp2174 = load i8*, i8** %.tmp2173
%.tmp2175 = call i32(i8*,...) @printf(i8* %.tmp2171, i8* %.tmp2174)
ret i32 4
}
@.str1988 = constant [16 x i8] c"mono_assignable\00"
@.str1999 = constant [9 x i8] c"operator\00"
@.str2034 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2077 = constant [2 x i8] c"+\00"
@.str2084 = constant [2 x i8] c"-\00"
@.str2093 = constant [2 x i8] c"*\00"
@.str2100 = constant [2 x i8] c"/\00"
@.str2109 = constant [3 x i8] c"==\00"
@.str2116 = constant [3 x i8] c"!=\00"
@.str2125 = constant [3 x i8] c">=\00"
@.str2132 = constant [3 x i8] c"<=\00"
@.str2141 = constant [2 x i8] c">\00"
@.str2148 = constant [2 x i8] c"<\00"
@.str2157 = constant [2 x i8] c"&\00"
@.str2165 = constant [2 x i8] c"|\00"
@.str2170 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@DEBUG_INTERNALS = constant i1 0
%m1830$.ErrorList.type = type {%m717$.Error.type*,%m1830$.ErrorList.type*}
%m1830$.Type.type = type {i8*,i8*,i8*,%m1830$.Type.type*,%m1830$.Type.type*}
define %m1830$.Type.type* @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.t.arg) {
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.t.arg, %m1830$.Type.type** %t
%.tmp2176 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2177 = icmp eq %m1830$.Type.type* %.tmp2176, null
br i1 %.tmp2177, label %.if.true.2178, label %.if.false.2178
.if.true.2178:
%.tmp2179 = bitcast ptr null to %m1830$.Type.type*
ret %m1830$.Type.type* %.tmp2179
br label %.if.end.2178
.if.false.2178:
br label %.if.end.2178
.if.end.2178:
%.tmp2180 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp2181 = ptrtoint %m1830$.Type.type* %.tmp2180 to i32
%.tmp2182 = call i8*(i32) @malloc(i32 %.tmp2181)
%.tmp2183 = bitcast i8* %.tmp2182 to %m1830$.Type.type*
%clone = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2183, %m1830$.Type.type** %clone
%.tmp2184 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2185 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2184, i32 0, i32 3
%.tmp2186 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2187 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2186, i32 0, i32 3
%.tmp2188 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2187
store %m1830$.Type.type* %.tmp2188, %m1830$.Type.type** %.tmp2185
%.tmp2189 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2190 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2189, i32 0, i32 4
%.tmp2191 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2192 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2191, i32 0, i32 4
%.tmp2193 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2192
%.tmp2194 = call %m1830$.Type.type*(%m1830$.Type.type*) @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2193)
store %m1830$.Type.type* %.tmp2194, %m1830$.Type.type** %.tmp2190
%.tmp2195 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2196 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2195, i32 0, i32 2
%.tmp2197 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2198 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2197, i32 0, i32 2
%.tmp2199 = load i8*, i8** %.tmp2198
store i8* %.tmp2199, i8** %.tmp2196
%.tmp2200 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2201 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2200, i32 0, i32 0
%.tmp2202 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2203 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2202, i32 0, i32 0
%.tmp2204 = load i8*, i8** %.tmp2203
store i8* %.tmp2204, i8** %.tmp2201
%.tmp2205 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2206 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2205, i32 0, i32 1
%.tmp2207 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2208 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2207, i32 0, i32 1
%.tmp2209 = load i8*, i8** %.tmp2208
store i8* %.tmp2209, i8** %.tmp2206
%.tmp2210 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
ret %m1830$.Type.type* %.tmp2210
}
define %m1830$.Type.type* @m1830$new_type.m1830$.Type.typep() {
%.tmp2211 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp2212 = ptrtoint %m1830$.Type.type* %.tmp2211 to i32
%.tmp2213 = call i8*(i32) @malloc(i32 %.tmp2212)
%.tmp2214 = bitcast i8* %.tmp2213 to %m1830$.Type.type*
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2214, %m1830$.Type.type** %type
%.tmp2215 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2216 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2215, i32 0, i32 1
store i8* null, i8** %.tmp2216
%.tmp2217 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2218 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2217, i32 0, i32 2
store i8* null, i8** %.tmp2218
%.tmp2219 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2220 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2219, i32 0, i32 0
store i8* null, i8** %.tmp2220
%.tmp2221 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2222 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2221, i32 0, i32 3
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp2222
%.tmp2223 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2224 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2223, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp2224
%.tmp2225 = load %m1830$.Type.type*, %m1830$.Type.type** %type
ret %m1830$.Type.type* %.tmp2225
}
define void @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.dest.arg, %m1830$.Type.type* %.src.arg) {
%dest = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.dest.arg, %m1830$.Type.type** %dest
%src = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.src.arg, %m1830$.Type.type** %src
%.tmp2226 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2227 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2226, i32 0, i32 0
%.tmp2228 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2229 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2228, i32 0, i32 0
%.tmp2230 = load i8*, i8** %.tmp2229
store i8* %.tmp2230, i8** %.tmp2227
%.tmp2231 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2232 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2231, i32 0, i32 1
%.tmp2233 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2234 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2233, i32 0, i32 1
%.tmp2235 = load i8*, i8** %.tmp2234
store i8* %.tmp2235, i8** %.tmp2232
%.tmp2236 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2237 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2236, i32 0, i32 2
%.tmp2238 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2239 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2238, i32 0, i32 2
%.tmp2240 = load i8*, i8** %.tmp2239
store i8* %.tmp2240, i8** %.tmp2237
%.tmp2241 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2242 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2241, i32 0, i32 3
%.tmp2243 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2242
%.tmp2244 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2245 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2244, i32 0, i32 3
%.tmp2246 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2245
%.tmp2247 = icmp ne %m1830$.Type.type* %.tmp2243, %.tmp2246
br i1 %.tmp2247, label %.if.true.2248, label %.if.false.2248
.if.true.2248:
%.tmp2249 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2250 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2249, i32 0, i32 3
%.tmp2251 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2252 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2251, i32 0, i32 3
%.tmp2253 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2252
store %m1830$.Type.type* %.tmp2253, %m1830$.Type.type** %.tmp2250
%.tmp2254 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2255 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2254, i32 0, i32 3
%.tmp2256 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2255
%.tmp2257 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2258 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2257, i32 0, i32 3
%.tmp2259 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2258
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2256, %m1830$.Type.type* %.tmp2259)
br label %.if.end.2248
.if.false.2248:
br label %.if.end.2248
.if.end.2248:
%.tmp2260 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2261 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2260, i32 0, i32 4
%.tmp2262 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2261
%.tmp2263 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2264 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2263, i32 0, i32 4
%.tmp2265 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2264
%.tmp2266 = icmp ne %m1830$.Type.type* %.tmp2262, %.tmp2265
br i1 %.tmp2266, label %.if.true.2267, label %.if.false.2267
.if.true.2267:
%.tmp2268 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2269 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2268, i32 0, i32 4
%.tmp2270 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2271 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2270, i32 0, i32 4
%.tmp2272 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2271
store %m1830$.Type.type* %.tmp2272, %m1830$.Type.type** %.tmp2269
%.tmp2273 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2274 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2273, i32 0, i32 4
%.tmp2275 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2274
%.tmp2276 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2277 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2276, i32 0, i32 4
%.tmp2278 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2277
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2275, %m1830$.Type.type* %.tmp2278)
br label %.if.end.2267
.if.false.2267:
br label %.if.end.2267
.if.end.2267:
ret void
}
define void @m1830$debug_type.v.m1830$.Type.typep.i(%m1830$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.t.arg, %m1830$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2279 = load i32, i32* %level
%.tmp2280 = add i32 %.tmp2279, 1
%.tmp2281 = call i8*(i32) @malloc(i32 %.tmp2280)
%.tmp2282 = bitcast i8* %.tmp2281 to i8*
%indent = alloca i8*
store i8* %.tmp2282, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2283
.for.start.2283:
%.tmp2284 = load i32, i32* %i
%.tmp2285 = load i32, i32* %level
%.tmp2286 = icmp slt i32 %.tmp2284, %.tmp2285
br i1 %.tmp2286, label %.for.continue.2283, label %.for.end.2283
.for.continue.2283:
%.tmp2287 = load i32, i32* %i
%.tmp2288 = load i8*, i8** %indent
%.tmp2289 = getelementptr i8, i8* %.tmp2288, i32 %.tmp2287
store i8 32, i8* %.tmp2289
%.tmp2290 = load i32, i32* %i
%.tmp2291 = add i32 %.tmp2290, 1
store i32 %.tmp2291, i32* %i
br label %.for.start.2283
.for.end.2283:
%.tmp2292 = load i32, i32* %level
%.tmp2293 = load i8*, i8** %indent
%.tmp2294 = getelementptr i8, i8* %.tmp2293, i32 %.tmp2292
store i8 0, i8* %.tmp2294
%.tmp2296 = getelementptr [5 x i8], [5 x i8]*@.str2295, i32 0, i32 0
%.tmp2297 = load i8*, i8** %indent
%.tmp2298 = call i32(i8*,...) @printf(i8* %.tmp2296, i8* %.tmp2297)
%.tmp2300 = getelementptr [21 x i8], [21 x i8]*@.str2299, i32 0, i32 0
%.tmp2301 = load i8*, i8** %indent
%.tmp2302 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2303 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2302, i32 0, i32 0
%.tmp2304 = load i8*, i8** %.tmp2303
%.tmp2305 = call i32(i8*,...) @printf(i8* %.tmp2300, i8* %.tmp2301, i8* %.tmp2304)
%.tmp2307 = getelementptr [16 x i8], [16 x i8]*@.str2306, i32 0, i32 0
%.tmp2308 = load i8*, i8** %indent
%.tmp2309 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2310 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2309, i32 0, i32 1
%.tmp2311 = load i8*, i8** %.tmp2310
%.tmp2312 = call i32(i8*,...) @printf(i8* %.tmp2307, i8* %.tmp2308, i8* %.tmp2311)
%.tmp2314 = getelementptr [16 x i8], [16 x i8]*@.str2313, i32 0, i32 0
%.tmp2315 = load i8*, i8** %indent
%.tmp2316 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2317 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2316, i32 0, i32 2
%.tmp2318 = load i8*, i8** %.tmp2317
%.tmp2319 = call i32(i8*,...) @printf(i8* %.tmp2314, i8* %.tmp2315, i8* %.tmp2318)
%.tmp2320 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2321 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2320, i32 0, i32 3
%.tmp2322 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2321
%.tmp2323 = icmp eq %m1830$.Type.type* %.tmp2322, null
br i1 %.tmp2323, label %.if.true.2324, label %.if.false.2324
.if.true.2324:
%.tmp2326 = getelementptr [16 x i8], [16 x i8]*@.str2325, i32 0, i32 0
%.tmp2327 = load i8*, i8** %indent
%.tmp2328 = call i32(i8*,...) @printf(i8* %.tmp2326, i8* %.tmp2327)
br label %.if.end.2324
.if.false.2324:
%.tmp2330 = getelementptr [10 x i8], [10 x i8]*@.str2329, i32 0, i32 0
%.tmp2331 = load i8*, i8** %indent
%.tmp2332 = call i32(i8*,...) @printf(i8* %.tmp2330, i8* %.tmp2331)
%.tmp2333 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2334 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2333, i32 0, i32 3
%.tmp2335 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2334
%.tmp2336 = load i32, i32* %level
%.tmp2337 = add i32 %.tmp2336, 1
call void(%m1830$.Type.type*,i32) @m1830$debug_type.v.m1830$.Type.typep.i(%m1830$.Type.type* %.tmp2335, i32 %.tmp2337)
br label %.if.end.2324
.if.end.2324:
%.tmp2338 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2339 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2338, i32 0, i32 4
%.tmp2340 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2339
%.tmp2341 = icmp eq %m1830$.Type.type* %.tmp2340, null
br i1 %.tmp2341, label %.if.true.2342, label %.if.false.2342
.if.true.2342:
%.tmp2344 = getelementptr [18 x i8], [18 x i8]*@.str2343, i32 0, i32 0
%.tmp2345 = load i8*, i8** %indent
%.tmp2346 = call i32(i8*,...) @printf(i8* %.tmp2344, i8* %.tmp2345)
br label %.if.end.2342
.if.false.2342:
%.tmp2348 = getelementptr [12 x i8], [12 x i8]*@.str2347, i32 0, i32 0
%.tmp2349 = load i8*, i8** %indent
%.tmp2350 = call i32(i8*,...) @printf(i8* %.tmp2348, i8* %.tmp2349)
%.tmp2351 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2352 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2351, i32 0, i32 4
%.tmp2353 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2352
%.tmp2354 = load i32, i32* %level
%.tmp2355 = add i32 %.tmp2354, 1
call void(%m1830$.Type.type*,i32) @m1830$debug_type.v.m1830$.Type.typep.i(%m1830$.Type.type* %.tmp2353, i32 %.tmp2355)
br label %.if.end.2342
.if.end.2342:
%.tmp2357 = getelementptr [5 x i8], [5 x i8]*@.str2356, i32 0, i32 0
%.tmp2358 = load i8*, i8** %indent
%.tmp2359 = call i32(i8*,...) @printf(i8* %.tmp2357, i8* %.tmp2358)
ret void
}
%m1830$.AssignableInfo.type = type {i8*,i8,i8*,%m1830$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1830$.AssignableInfo.type* @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.node.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2360 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* null, i32 1
%.tmp2361 = ptrtoint %m1830$.AssignableInfo.type* %.tmp2360 to i32
%.tmp2362 = call i8*(i32) @malloc(i32 %.tmp2361)
%.tmp2363 = bitcast i8* %.tmp2362 to %m1830$.AssignableInfo.type*
%ptr = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp2363, %m1830$.AssignableInfo.type** %ptr
%.tmp2364 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2365 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2364, i32 0, i32 1
%.tmp2366 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2366, i8* %.tmp2365
%.tmp2367 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2368 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2367, i32 0, i32 0
store i8* null, i8** %.tmp2368
%.tmp2369 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2370 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2369, i32 0, i32 2
store i8* null, i8** %.tmp2370
%.tmp2371 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2372 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2371, i32 0, i32 3
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp2372
%.tmp2373 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2374 = icmp ne %m286$.Node.type* %.tmp2373, null
br i1 %.tmp2374, label %.if.true.2375, label %.if.false.2375
.if.true.2375:
%.tmp2376 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2377 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2376, i32 0, i32 4
%.tmp2378 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2379 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2378, i32 0, i32 3
%.tmp2380 = load i32, i32* %.tmp2379
store i32 %.tmp2380, i32* %.tmp2377
%.tmp2381 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2382 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2381, i32 0, i32 5
%.tmp2383 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2383, i32 0, i32 4
%.tmp2385 = load i32, i32* %.tmp2384
store i32 %.tmp2385, i32* %.tmp2382
%.tmp2386 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2387 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2386, i32 0, i32 6
%.tmp2388 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2389 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2388, i32 0, i32 2
%.tmp2390 = load i8*, i8** %.tmp2389
store i8* %.tmp2390, i8** %.tmp2387
br label %.if.end.2375
.if.false.2375:
%.tmp2391 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2392 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2391, i32 0, i32 4
store i32 0, i32* %.tmp2392
%.tmp2393 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2394 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2393, i32 0, i32 5
store i32 0, i32* %.tmp2394
%.tmp2395 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2396 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2395, i32 0, i32 6
store i8* null, i8** %.tmp2396
br label %.if.end.2375
.if.end.2375:
%.tmp2397 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
ret %m1830$.AssignableInfo.type* %.tmp2397
}
define void @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2398 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2399 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2398, i32 0, i32 0
%.tmp2400 = load i8*, i8** %id
store i8* %.tmp2400, i8** %.tmp2399
%.tmp2401 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2402 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2401, i32 0, i32 1
%.tmp2403 = load i8, i8* %scope
store i8 %.tmp2403, i8* %.tmp2402
ret void
}
define i8* @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%.tmp2404 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2405 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2404, i32 0, i32 1
%.tmp2406 = load i8, i8* %.tmp2405
%.tmp2407 = load i8, i8* @SCOPE_CONST
%.tmp2408 = icmp eq i8 %.tmp2406, %.tmp2407
br i1 %.tmp2408, label %.if.true.2409, label %.if.false.2409
.if.true.2409:
%.tmp2410 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2411 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2410, i32 0, i32 0
%.tmp2412 = load i8*, i8** %.tmp2411
ret i8* %.tmp2412
br label %.if.end.2409
.if.false.2409:
br label %.if.end.2409
.if.end.2409:
%buf = alloca i8*
%.tmp2413 = getelementptr i8*, i8** %buf, i32 0
%.tmp2415 = getelementptr [5 x i8], [5 x i8]*@.str2414, i32 0, i32 0
%.tmp2416 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2417 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2416, i32 0, i32 1
%.tmp2418 = load i8, i8* %.tmp2417
%.tmp2419 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2420 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2419, i32 0, i32 0
%.tmp2421 = load i8*, i8** %.tmp2420
%.tmp2422 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2413, i8* %.tmp2415, i8 %.tmp2418, i8* %.tmp2421)
%.tmp2423 = load i8*, i8** %buf
ret i8* %.tmp2423
}
%m1830$.ScopeItem.type = type {i8*,%m1830$.AssignableInfo.type*,%m1830$.ScopeItem.type*}
%m1830$.GlobalName.type = type {i8*,i8*,i1,%m1830$.AssignableInfo.type*,%m1830$.GlobalName.type*}
%m1830$.Scope.type = type {i8*,%m1830$.ScopeItem.type*,%m1830$.Scope.type*}
%m1830$.ModuleLookup.type = type {i8*,i8*,%m1830$.ModuleLookup.type*,%m1830$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1830$.CompilerCtx.type = type {%m286$.Node.type*,%m0$.File.type*,%m1830$.ErrorList.type*,%m1830$.GlobalName.type*,i32,%m1830$.ModuleLookup.type*,i8*}
define void @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp2424 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2426 = getelementptr [7 x i8], [7 x i8]*@.str2425, i32 0, i32 0
%.tmp2427 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2428 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2427)
%.tmp2429 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2424, i8* %.tmp2426, i32 %.tmp2428)
%.tmp2430 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2431 = load i8, i8* @SCOPE_LOCAL
%.tmp2432 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp2430, i8 %.tmp2431, i8* %.tmp2432)
ret void
}
define %m1830$.ModuleLookup.type* @m1830$get_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2434 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2435 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2434, i32 0, i32 5
%.tmp2436 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2435
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2436, %m1830$.ModuleLookup.type** %m
br label %.for.start.2433
.for.start.2433:
%.tmp2437 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2438 = icmp ne %m1830$.ModuleLookup.type* %.tmp2437, null
br i1 %.tmp2438, label %.for.continue.2433, label %.for.end.2433
.for.continue.2433:
%.tmp2439 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2440 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2439, i32 0, i32 0
%.tmp2441 = load i8*, i8** %.tmp2440
%.tmp2442 = load i8*, i8** %filename
%.tmp2443 = call i32(i8*,i8*) @strcmp(i8* %.tmp2441, i8* %.tmp2442)
%.tmp2444 = icmp eq i32 %.tmp2443, 0
br i1 %.tmp2444, label %.if.true.2445, label %.if.false.2445
.if.true.2445:
%.tmp2446 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
ret %m1830$.ModuleLookup.type* %.tmp2446
br label %.if.end.2445
.if.false.2445:
br label %.if.end.2445
.if.end.2445:
%.tmp2447 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2448 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2447, i32 0, i32 2
%.tmp2449 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2448
store %m1830$.ModuleLookup.type* %.tmp2449, %m1830$.ModuleLookup.type** %m
br label %.for.start.2433
.for.end.2433:
%.tmp2450 = bitcast ptr null to %m1830$.ModuleLookup.type*
ret %m1830$.ModuleLookup.type* %.tmp2450
}
define %m1830$.ModuleLookup.type* @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2451 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2452 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2453 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2452, i32 0, i32 6
%.tmp2454 = load i8*, i8** %.tmp2453
%.tmp2455 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*,i8*) @m1830$get_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp2451, i8* %.tmp2454)
ret %m1830$.ModuleLookup.type* %.tmp2455
}
define i32 @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2456 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2457 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2456, i32 0, i32 4
%.tmp2458 = load i32, i32* %.tmp2457
%uid = alloca i32
store i32 %.tmp2458, i32* %uid
%.tmp2459 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2460 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2459, i32 0, i32 4
%.tmp2461 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2462 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2461, i32 0, i32 4
%.tmp2463 = load i32, i32* %.tmp2462
%.tmp2464 = add i32 %.tmp2463, 1
store i32 %.tmp2464, i32* %.tmp2460
%.tmp2465 = load i32, i32* %uid
ret i32 %.tmp2465
}
define %m1830$.CompilerCtx.type* @m1830$new_context.m1830$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2466 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* null, i32 1
%.tmp2467 = ptrtoint %m1830$.CompilerCtx.type* %.tmp2466 to i32
%.tmp2468 = call i8*(i32) @malloc(i32 %.tmp2467)
%.tmp2469 = bitcast i8* %.tmp2468 to %m1830$.CompilerCtx.type*
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.tmp2469, %m1830$.CompilerCtx.type** %ctx
%.tmp2470 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2471 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2470, i32 0, i32 1
%.tmp2472 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2472, %m0$.File.type** %.tmp2471
%.tmp2473 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2474 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2473, i32 0, i32 0
%.tmp2475 = bitcast ptr null to %m286$.Node.type*
store %m286$.Node.type* %.tmp2475, %m286$.Node.type** %.tmp2474
%.tmp2476 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2477 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2476, i32 0, i32 2
store %m1830$.ErrorList.type* null, %m1830$.ErrorList.type** %.tmp2477
%.tmp2478 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2479 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2478, i32 0, i32 4
store i32 0, i32* %.tmp2479
%.tmp2480 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2481 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2480, i32 0, i32 3
store %m1830$.GlobalName.type* null, %m1830$.GlobalName.type** %.tmp2481
%.tmp2482 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2483 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2482, i32 0, i32 6
%.tmp2484 = load i8*, i8** %filename
store i8* %.tmp2484, i8** %.tmp2483
%.tmp2485 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2486 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2485, i32 0, i32 5
%.tmp2487 = load i32, i32* @ModuleLookup_size
%.tmp2488 = call i8*(i32) @malloc(i32 %.tmp2487)
%.tmp2489 = bitcast i8* %.tmp2488 to %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2489, %m1830$.ModuleLookup.type** %.tmp2486
%.tmp2490 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2491 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2490, i32 0, i32 5
%.tmp2492 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2491
%.tmp2493 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2492, i32 0, i32 0
%.tmp2494 = load i8*, i8** %filename
store i8* %.tmp2494, i8** %.tmp2493
%.tmp2495 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2496 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2495, i32 0, i32 5
%.tmp2497 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2496
%.tmp2498 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2497, i32 0, i32 3
store %m1830$.Scope.type* null, %m1830$.Scope.type** %.tmp2498
%.tmp2499 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2500 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2499, i32 0, i32 5
%.tmp2501 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2500
%.tmp2502 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2501, i32 0, i32 1
%.tmp2504 = getelementptr [1 x i8], [1 x i8]*@.str2503, i32 0, i32 0
store i8* %.tmp2504, i8** %.tmp2502
%.tmp2505 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2506 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2505, i32 0, i32 5
%.tmp2507 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2506
%.tmp2508 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2507, i32 0, i32 2
store %m1830$.ModuleLookup.type* null, %m1830$.ModuleLookup.type** %.tmp2508
%.tmp2509 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2510 = bitcast %m1830$.CompilerCtx.type* %.tmp2509 to %m1830$.CompilerCtx.type*
ret %m1830$.CompilerCtx.type* %.tmp2510
}
define void @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2511 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* null, i32 1
%.tmp2512 = ptrtoint %m1830$.Scope.type* %.tmp2511 to i32
%.tmp2513 = call i8*(i32) @malloc(i32 %.tmp2512)
%.tmp2514 = bitcast i8* %.tmp2513 to %m1830$.Scope.type*
%s = alloca %m1830$.Scope.type*
store %m1830$.Scope.type* %.tmp2514, %m1830$.Scope.type** %s
%.tmp2515 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2516 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2515)
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2516, %m1830$.ModuleLookup.type** %m
%.tmp2517 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp2518 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp2517, i32 0, i32 2
%.tmp2519 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2520 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2519, i32 0, i32 3
%.tmp2521 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2520
store %m1830$.Scope.type* %.tmp2521, %m1830$.Scope.type** %.tmp2518
%.tmp2522 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp2523 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp2522, i32 0, i32 1
store %m1830$.ScopeItem.type* null, %m1830$.ScopeItem.type** %.tmp2523
%.tmp2524 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2525 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2524, i32 0, i32 3
%.tmp2526 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
store %m1830$.Scope.type* %.tmp2526, %m1830$.Scope.type** %.tmp2525
ret void
}
define void @m1830$pop_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2527 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2528 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2527)
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2528, %m1830$.ModuleLookup.type** %m
%.tmp2529 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2530 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2529, i32 0, i32 3
%.tmp2531 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2530
%.tmp2532 = icmp ne %m1830$.Scope.type* %.tmp2531, null
%.tmp2534 = getelementptr [61 x i8], [61 x i8]*@.str2533, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2532, i8* %.tmp2534)
%.tmp2535 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2536 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2535, i32 0, i32 3
%.tmp2537 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2538 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2537, i32 0, i32 3
%.tmp2539 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2538
%.tmp2540 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp2539, i32 0, i32 2
%.tmp2541 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2540
store %m1830$.Scope.type* %.tmp2541, %m1830$.Scope.type** %.tmp2536
ret void
}
define i1 @m1830$compile_file.b.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2542 = call i8*() @m1831$grammar.cp()
%.tmp2543 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2542)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2543, %m0$.File.type** %grammar_file
%.tmp2544 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2545 = icmp eq %m0$.File.type* %.tmp2544, null
br i1 %.tmp2545, label %.if.true.2546, label %.if.false.2546
.if.true.2546:
ret i1 0
br label %.if.end.2546
.if.false.2546:
br label %.if.end.2546
.if.end.2546:
%.tmp2547 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2548 = call %m286$.ParsingContext.type*(%m0$.File.type*) @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2547)
%grammar_ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp2548, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2549 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2550 = call %m286$.Rule.type**(%m286$.ParsingContext.type*) @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp2549)
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp2550, %m286$.Rule.type*** %grammar
%.tmp2551 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2552 = bitcast %m286$.ParsingContext.type* %.tmp2551 to i8*
call void(i8*) @free(i8* %.tmp2552)
%.tmp2553 = load i8*, i8** %filepath
%.tmp2554 = load i32, i32* @O_RDONLY
%.tmp2555 = call i32(i8*,i32) @open(i8* %.tmp2553, i32 %.tmp2554)
%input_fd = alloca i32
store i32 %.tmp2555, i32* %input_fd
%.tmp2556 = load i32, i32* %input_fd
%.tmp2557 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp2556)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp2557, %m209$.PeekerInfo.type** %p
%.tmp2558 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2559 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp2558, i32 0, i32 6
%.tmp2560 = load i8*, i8** %filepath
store i8* %.tmp2560, i8** %.tmp2559
%.tmp2561 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2562 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp2561, i1 0)
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp2562, %m287$.Token.type** %tokens
%.tmp2563 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp2565 = getelementptr [6 x i8], [6 x i8]*@.str2564, i32 0, i32 0
%.tmp2566 = load %m287$.Token.type*, %m287$.Token.type** %tokens
%.tmp2567 = call %m286$.ParseResult.type*(%m286$.Rule.type**,i8*,%m287$.Token.type*) @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.tmp2563, i8* %.tmp2565, %m287$.Token.type* %.tmp2566)
%ast = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp2567, %m286$.ParseResult.type** %ast
%.tmp2568 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2569 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %ast
%.tmp2570 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp2569, i32 0, i32 1
%.tmp2571 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2570
%.tmp2572 = call i1(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile.b.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp2568, %m286$.Node.type* %.tmp2571)
ret i1 %.tmp2572
}
define i1 @m1830$compile.b.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2573 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2574 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2573, i32 0, i32 0
%.tmp2575 = load i8*, i8** %.tmp2574
%.tmp2577 = getelementptr [6 x i8], [6 x i8]*@.str2576, i32 0, i32 0
%.tmp2578 = call i32(i8*,i8*) @strcmp(i8* %.tmp2575, i8* %.tmp2577)
%.tmp2579 = icmp ne i32 %.tmp2578, 0
br i1 %.tmp2579, label %.if.true.2580, label %.if.false.2580
.if.true.2580:
ret i1 0
br label %.if.end.2580
.if.false.2580:
br label %.if.end.2580
.if.end.2580:
%.tmp2581 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2581)
%.tmp2582 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2583 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2582, i32 0, i32 6
%.tmp2584 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2583
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2584, %m286$.Node.type** %start
%.tmp2585 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2586 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2585, i32 0, i32 0
%.tmp2587 = load i8*, i8** %.tmp2586
%.tmp2589 = getelementptr [13 x i8], [13 x i8]*@.str2588, i32 0, i32 0
%.tmp2590 = call i32(i8*,i8*) @strcmp(i8* %.tmp2587, i8* %.tmp2589)
%.tmp2591 = icmp eq i32 %.tmp2590, 0
br i1 %.tmp2591, label %.if.true.2592, label %.if.false.2592
.if.true.2592:
%.tmp2593 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2594 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2593, i32 0, i32 7
%.tmp2595 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2594
store %m286$.Node.type* %.tmp2595, %m286$.Node.type** %start
br label %.if.end.2592
.if.false.2592:
br label %.if.end.2592
.if.end.2592:
%.tmp2597 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2597, %m286$.Node.type** %stmt
br label %.for.start.2596
.for.start.2596:
%.tmp2598 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2599 = icmp ne %m286$.Node.type* %.tmp2598, null
br i1 %.tmp2599, label %.for.continue.2596, label %.for.end.2596
.for.continue.2596:
%.tmp2600 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2601 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2602 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2601, i32 0, i32 6
%.tmp2603 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2602
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1830$compile_statement.v.m1830$.CompilerCtx.typep.m286$.Node.typep.b(%m1830$.CompilerCtx.type* %.tmp2600, %m286$.Node.type* %.tmp2603, i1 1)
%.tmp2604 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2605 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2604, i32 0, i32 7
%.tmp2606 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2605
store %m286$.Node.type* %.tmp2606, %m286$.Node.type** %stmt
br label %.for.start.2596
.for.end.2596:
%.tmp2608 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2608, %m286$.Node.type** %s
br label %.for.start.2607
.for.start.2607:
%.tmp2609 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2610 = icmp ne %m286$.Node.type* %.tmp2609, null
br i1 %.tmp2610, label %.for.continue.2607, label %.for.end.2607
.for.continue.2607:
%.tmp2611 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2612 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2613 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2612, i32 0, i32 6
%.tmp2614 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2613
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1830$compile_statement.v.m1830$.CompilerCtx.typep.m286$.Node.typep.b(%m1830$.CompilerCtx.type* %.tmp2611, %m286$.Node.type* %.tmp2614, i1 0)
%.tmp2615 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2616 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2615, i32 0, i32 7
%.tmp2617 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2616
store %m286$.Node.type* %.tmp2617, %m286$.Node.type** %s
br label %.for.start.2607
.for.end.2607:
%.tmp2618 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2619 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2618, i32 0, i32 2
%.tmp2620 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp2619
%.tmp2621 = icmp ne %m1830$.ErrorList.type* %.tmp2620, null
%has_errors = alloca i1
store i1 %.tmp2621, i1* %has_errors
%.tmp2623 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2624 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2623, i32 0, i32 2
%.tmp2625 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp2624
%err = alloca %m1830$.ErrorList.type*
store %m1830$.ErrorList.type* %.tmp2625, %m1830$.ErrorList.type** %err
br label %.for.start.2622
.for.start.2622:
%.tmp2626 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %err
%.tmp2627 = icmp ne %m1830$.ErrorList.type* %.tmp2626, null
br i1 %.tmp2627, label %.for.continue.2622, label %.for.end.2622
.for.continue.2622:
%.tmp2628 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %err
%.tmp2629 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp2628, i32 0, i32 0
%.tmp2630 = load %m717$.Error.type*, %m717$.Error.type** %.tmp2629
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp2630)
%.tmp2631 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %err
%.tmp2632 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp2631, i32 0, i32 1
%.tmp2633 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp2632
store %m1830$.ErrorList.type* %.tmp2633, %m1830$.ErrorList.type** %err
br label %.for.start.2622
.for.end.2622:
%.tmp2635 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2636 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2635, i32 0, i32 3
%.tmp2637 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp2636
%g = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.tmp2637, %m1830$.GlobalName.type** %g
br label %.for.start.2634
.for.start.2634:
%.tmp2638 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2639 = icmp ne %m1830$.GlobalName.type* %.tmp2638, null
br i1 %.tmp2639, label %.for.continue.2634, label %.for.end.2634
.for.continue.2634:
%.tmp2640 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2641 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
call void(%m1830$.CompilerCtx.type*,%m1830$.GlobalName.type*) @m1830$compile_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.tmp2640, %m1830$.GlobalName.type* %.tmp2641)
%.tmp2642 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2643 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2642, i32 0, i32 4
%.tmp2644 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp2643
store %m1830$.GlobalName.type* %.tmp2644, %m1830$.GlobalName.type** %g
br label %.for.start.2634
.for.end.2634:
%.tmp2645 = load i1, i1* %has_errors
ret i1 %.tmp2645
}
define i8* @m1830$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%buf = alloca i8*
%.tmp2646 = load i8*, i8** %text
%.tmp2647 = call i32(i8*) @strlen(i8* %.tmp2646)
%str_len = alloca i32
store i32 %.tmp2647, i32* %str_len
%i = alloca i32
%nof_quotes = alloca i32
store i32 0, i32* %nof_quotes
store i32 0, i32* %i
br label %.for.start.2648
.for.start.2648:
%.tmp2649 = load i32, i32* %i
%.tmp2650 = load i32, i32* %str_len
%.tmp2651 = sub i32 %.tmp2650, 2
%.tmp2652 = icmp slt i32 %.tmp2649, %.tmp2651
br i1 %.tmp2652, label %.for.continue.2648, label %.for.end.2648
.for.continue.2648:
%.tmp2653 = load i32, i32* %i
%.tmp2654 = add i32 %.tmp2653, 1
%.tmp2655 = load i8*, i8** %text
%.tmp2656 = getelementptr i8, i8* %.tmp2655, i32 %.tmp2654
%.tmp2657 = load i8, i8* %.tmp2656
%.tmp2658 = icmp eq i8 %.tmp2657, 34
br i1 %.tmp2658, label %.if.true.2659, label %.if.false.2659
.if.true.2659:
%.tmp2660 = load i32, i32* %nof_quotes
%.tmp2661 = add i32 %.tmp2660, 1
store i32 %.tmp2661, i32* %nof_quotes
br label %.if.end.2659
.if.false.2659:
br label %.if.end.2659
.if.end.2659:
%.tmp2662 = load i32, i32* %i
%.tmp2663 = add i32 %.tmp2662, 1
store i32 %.tmp2663, i32* %i
br label %.for.start.2648
.for.end.2648:
%.tmp2664 = load i32, i32* %str_len
%.tmp2665 = sub i32 %.tmp2664, 2
%.tmp2666 = add i32 %.tmp2665, 1
%.tmp2667 = load i32, i32* %nof_quotes
%.tmp2668 = mul i32 %.tmp2667, 3
%.tmp2669 = add i32 %.tmp2666, %.tmp2668
%.tmp2670 = call i8*(i32) @malloc(i32 %.tmp2669)
%substr = alloca i8*
store i8* %.tmp2670, i8** %substr
%substr_idx = alloca i32
store i32 0, i32* %substr_idx
store i32 0, i32* %i
br label %.for.start.2671
.for.start.2671:
%.tmp2672 = load i32, i32* %i
%.tmp2673 = load i32, i32* %str_len
%.tmp2674 = sub i32 %.tmp2673, 2
%.tmp2675 = icmp slt i32 %.tmp2672, %.tmp2674
br i1 %.tmp2675, label %.for.continue.2671, label %.for.end.2671
.for.continue.2671:
%.tmp2676 = load i32, i32* %i
%.tmp2677 = add i32 %.tmp2676, 1
%.tmp2678 = load i8*, i8** %text
%.tmp2679 = getelementptr i8, i8* %.tmp2678, i32 %.tmp2677
%.tmp2680 = load i8, i8* %.tmp2679
%.tmp2681 = icmp eq i8 %.tmp2680, 34
br i1 %.tmp2681, label %.if.true.2682, label %.if.false.2682
.if.true.2682:
%.tmp2683 = load i32, i32* %substr_idx
%.tmp2684 = load i8*, i8** %substr
%.tmp2685 = getelementptr i8, i8* %.tmp2684, i32 %.tmp2683
store i8 92, i8* %.tmp2685
%.tmp2686 = load i32, i32* %substr_idx
%.tmp2687 = add i32 %.tmp2686, 1
%.tmp2688 = load i8*, i8** %substr
%.tmp2689 = getelementptr i8, i8* %.tmp2688, i32 %.tmp2687
store i8 50, i8* %.tmp2689
%.tmp2690 = load i32, i32* %substr_idx
%.tmp2691 = add i32 %.tmp2690, 2
%.tmp2692 = load i8*, i8** %substr
%.tmp2693 = getelementptr i8, i8* %.tmp2692, i32 %.tmp2691
store i8 50, i8* %.tmp2693
%.tmp2694 = load i32, i32* %substr_idx
%.tmp2695 = add i32 %.tmp2694, 3
store i32 %.tmp2695, i32* %substr_idx
br label %.if.end.2682
.if.false.2682:
%.tmp2696 = load i32, i32* %substr_idx
%.tmp2697 = load i8*, i8** %substr
%.tmp2698 = getelementptr i8, i8* %.tmp2697, i32 %.tmp2696
%.tmp2699 = load i32, i32* %i
%.tmp2700 = add i32 %.tmp2699, 1
%.tmp2701 = load i8*, i8** %text
%.tmp2702 = getelementptr i8, i8* %.tmp2701, i32 %.tmp2700
%.tmp2703 = load i8, i8* %.tmp2702
store i8 %.tmp2703, i8* %.tmp2698
%.tmp2704 = load i32, i32* %substr_idx
%.tmp2705 = add i32 %.tmp2704, 1
store i32 %.tmp2705, i32* %substr_idx
br label %.if.end.2682
.if.end.2682:
%.tmp2706 = load i32, i32* %i
%.tmp2707 = add i32 %.tmp2706, 1
store i32 %.tmp2707, i32* %i
br label %.for.start.2671
.for.end.2671:
%.tmp2708 = load i32, i32* %substr_idx
%.tmp2709 = load i8*, i8** %substr
%.tmp2710 = getelementptr i8, i8* %.tmp2709, i32 %.tmp2708
store i8 0, i8* %.tmp2710
%.tmp2711 = getelementptr i8*, i8** %buf, i32 0
%.tmp2713 = getelementptr [9 x i8], [9 x i8]*@.str2712, i32 0, i32 0
%.tmp2714 = load i8*, i8** %substr
%.tmp2715 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2711, i8* %.tmp2713, i8* %.tmp2714)
%.tmp2716 = load i8*, i8** %substr
call void(i8*) @free(i8* %.tmp2716)
%.tmp2717 = load i8*, i8** %buf
ret i8* %.tmp2717
}
define void @m1830$compile_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%g = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.g.arg, %m1830$.GlobalName.type** %g
%.tmp2718 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2719 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2718, i32 0, i32 2
%.tmp2720 = load i1, i1* %.tmp2719
%.tmp2721 = icmp eq i1 %.tmp2720, 0
%.tmp2722 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2723 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2722, i32 0, i32 1
%.tmp2724 = load i8*, i8** %.tmp2723
%.tmp2726 = getelementptr [7 x i8], [7 x i8]*@.str2725, i32 0, i32 0
%.tmp2727 = call i32(i8*,i8*) @strcmp(i8* %.tmp2724, i8* %.tmp2726)
%.tmp2728 = icmp eq i32 %.tmp2727, 0
%.tmp2729 = and i1 %.tmp2721, %.tmp2728
br i1 %.tmp2729, label %.if.true.2730, label %.if.false.2730
.if.true.2730:
%.tmp2731 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2732 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2731, i32 0, i32 0
%.tmp2733 = load i8*, i8** %.tmp2732
%.tmp2734 = call i8*(i8*) @m1830$string_to_llvm.cp.cp(i8* %.tmp2733)
%repr = alloca i8*
store i8* %.tmp2734, i8** %repr
%.tmp2735 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2736 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2735, i32 0, i32 1
%.tmp2737 = load %m0$.File.type*, %m0$.File.type** %.tmp2736
%.tmp2739 = getelementptr [21 x i8], [21 x i8]*@.str2738, i32 0, i32 0
%.tmp2740 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2741 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2740, i32 0, i32 3
%.tmp2742 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp2741
%.tmp2743 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp2742)
%.tmp2744 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2745 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2746 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2745, i32 0, i32 3
%.tmp2747 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp2746
%.tmp2748 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2747, i32 0, i32 3
%.tmp2749 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2748
%.tmp2750 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp2744, %m1830$.Type.type* %.tmp2749)
%.tmp2751 = load i8*, i8** %repr
%.tmp2752 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2737, i8* %.tmp2739, i8* %.tmp2743, i8* %.tmp2750, i8* %.tmp2751)
%.tmp2753 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2754 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2753, i32 0, i32 2
store i1 1, i1* %.tmp2754
br label %.if.end.2730
.if.false.2730:
br label %.if.end.2730
.if.end.2730:
ret void
}
define i8* @m1830$get_mod_prefix.cp.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2755 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2756 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2755)
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2756, %m1830$.ModuleLookup.type** %m
%.tmp2757 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2758 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2757, i32 0, i32 1
%.tmp2759 = load i8*, i8** %.tmp2758
ret i8* %.tmp2759
}
define i8* @m1830$name_mangle.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1830$.Type.type* %.type.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%fn = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn.arg, %m286$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.type.arg, %m1830$.Type.type** %type
%mangled_name = alloca i8*
%.tmp2760 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2761 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2762 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2761, i32 0, i32 2
%.tmp2763 = load i8*, i8** %.tmp2762
%.tmp2764 = call i8*(%m1830$.CompilerCtx.type*,i8*) @m1830$get_mod_prefix.cp.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp2760, i8* %.tmp2763)
%prefix = alloca i8*
store i8* %.tmp2764, i8** %prefix
%.tmp2765 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2767 = getelementptr [5 x i8], [5 x i8]*@.str2766, i32 0, i32 0
%.tmp2768 = load i8*, i8** %prefix
%.tmp2769 = load i8*, i8** %original_name
%.tmp2770 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2765, i8* %.tmp2767, i8* %.tmp2768, i8* %.tmp2769)
%.tmp2771 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2772 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2771, i32 0, i32 0
%.tmp2773 = load i8*, i8** %.tmp2772
%.tmp2775 = getelementptr [9 x i8], [9 x i8]*@.str2774, i32 0, i32 0
%.tmp2776 = call i32(i8*,i8*) @strcmp(i8* %.tmp2773, i8* %.tmp2775)
%.tmp2777 = icmp eq i32 %.tmp2776, 0
br i1 %.tmp2777, label %.if.true.2778, label %.if.false.2778
.if.true.2778:
%.tmp2779 = load i8*, i8** %mangled_name
%.tmp2781 = getelementptr [5 x i8], [5 x i8]*@.str2780, i32 0, i32 0
%.tmp2782 = call i32(i8*,i8*) @strcmp(i8* %.tmp2779, i8* %.tmp2781)
%.tmp2783 = icmp ne i32 %.tmp2782, 0
br i1 %.tmp2783, label %.if.true.2784, label %.if.false.2784
.if.true.2784:
%tmp_buff = alloca i8*
%swap_var = alloca i8*
%.tmp2786 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2787 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2786, i32 0, i32 3
%.tmp2788 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2787
%tp = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2788, %m1830$.Type.type** %tp
br label %.for.start.2785
.for.start.2785:
%.tmp2789 = load %m1830$.Type.type*, %m1830$.Type.type** %tp
%.tmp2790 = icmp ne %m1830$.Type.type* %.tmp2789, null
br i1 %.tmp2790, label %.for.continue.2785, label %.for.end.2785
.for.continue.2785:
%.tmp2791 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2793 = getelementptr [6 x i8], [6 x i8]*@.str2792, i32 0, i32 0
%.tmp2794 = load i8*, i8** %mangled_name
%.tmp2795 = load %m1830$.Type.type*, %m1830$.Type.type** %tp
%.tmp2796 = call i8*(%m1830$.Type.type*) @m1830$type_abbr.cp.m1830$.Type.typep(%m1830$.Type.type* %.tmp2795)
%.tmp2797 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2791, i8* %.tmp2793, i8* %.tmp2794, i8* %.tmp2796)
%.tmp2798 = load i8*, i8** %tmp_buff
store i8* %.tmp2798, i8** %swap_var
%.tmp2799 = load i8*, i8** %mangled_name
store i8* %.tmp2799, i8** %tmp_buff
%.tmp2800 = load i8*, i8** %swap_var
store i8* %.tmp2800, i8** %mangled_name
%.tmp2801 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2801)
%.tmp2802 = load %m1830$.Type.type*, %m1830$.Type.type** %tp
%.tmp2803 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2802, i32 0, i32 4
%.tmp2804 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2803
store %m1830$.Type.type* %.tmp2804, %m1830$.Type.type** %tp
br label %.for.start.2785
.for.end.2785:
br label %.if.end.2784
.if.false.2784:
br label %.if.end.2784
.if.end.2784:
br label %.if.end.2778
.if.false.2778:
br label %.if.end.2778
.if.end.2778:
%.tmp2805 = load i8*, i8** %mangled_name
ret i8* %.tmp2805
}
define void @m1830$compile_statement.v.m1830$.CompilerCtx.typep.m286$.Node.typep.b(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info = alloca %m1830$.AssignableInfo.type*
%return_type = alloca %m1830$.Type.type*
%err_buf = alloca i8*
%tmp_buff = alloca i8*
%.tmp2806 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2807 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2806, i32 0, i32 0
%.tmp2808 = load i8*, i8** %.tmp2807
%.tmp2810 = getelementptr [3 x i8], [3 x i8]*@.str2809, i32 0, i32 0
%.tmp2811 = call i32(i8*,i8*) @strcmp(i8* %.tmp2808, i8* %.tmp2810)
%.tmp2812 = icmp eq i32 %.tmp2811, 0
br i1 %.tmp2812, label %.if.true.2813, label %.if.false.2813
.if.true.2813:
ret void
br label %.if.end.2813
.if.false.2813:
%.tmp2814 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2815 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2814, i32 0, i32 0
%.tmp2816 = load i8*, i8** %.tmp2815
%.tmp2818 = getelementptr [7 x i8], [7 x i8]*@.str2817, i32 0, i32 0
%.tmp2819 = call i32(i8*,i8*) @strcmp(i8* %.tmp2816, i8* %.tmp2818)
%.tmp2820 = icmp eq i32 %.tmp2819, 0
br i1 %.tmp2820, label %.if.true.2821, label %.if.false.2821
.if.true.2821:
%.tmp2822 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2823 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2822, i32 0, i32 6
%.tmp2824 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2823
%.tmp2826 = getelementptr [11 x i8], [11 x i8]*@.str2825, i32 0, i32 0
%.tmp2827 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp2824, i8* %.tmp2826)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2827, %m286$.Node.type** %assignable
%.tmp2828 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2829 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp2830 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp2828, %m286$.Node.type* %.tmp2829)
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp2830, %m1830$.AssignableInfo.type** %a_info
%.tmp2831 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp2832 = icmp eq %m1830$.AssignableInfo.type* %.tmp2831, null
br i1 %.tmp2832, label %.if.true.2833, label %.if.false.2833
.if.true.2833:
ret void
br label %.if.end.2833
.if.false.2833:
br label %.if.end.2833
.if.end.2833:
%.tmp2834 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2835 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp2834)
store %m1830$.AssignableInfo.type* %.tmp2835, %m1830$.AssignableInfo.type** %info
%.tmp2836 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2837 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2836, i32 0, i32 6
%.tmp2838 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2837
%.tmp2839 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2838, i32 0, i32 7
%.tmp2840 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2839
%.tmp2841 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2840, i32 0, i32 1
%.tmp2842 = load i8*, i8** %.tmp2841
%global_name = alloca i8*
store i8* %.tmp2842, i8** %global_name
%.tmp2843 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2844 = load i8, i8* @SCOPE_GLOBAL
%.tmp2845 = load i8*, i8** %global_name
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp2843, i8 %.tmp2844, i8* %.tmp2845)
%.tmp2846 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2847 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2846, i32 0, i32 3
%.tmp2848 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp2849 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2848, i32 0, i32 3
%.tmp2850 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2849
store %m1830$.Type.type* %.tmp2850, %m1830$.Type.type** %.tmp2847
%.tmp2851 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2852 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2851, i32 0, i32 2
%.tmp2854 = getelementptr [9 x i8], [9 x i8]*@.str2853, i32 0, i32 0
store i8* %.tmp2854, i8** %.tmp2852
%.tmp2855 = load i1, i1* %shallow
%.tmp2856 = icmp eq i1 %.tmp2855, 1
br i1 %.tmp2856, label %.if.true.2857, label %.if.false.2857
.if.true.2857:
%.tmp2858 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2859 = load i8*, i8** %global_name
%.tmp2860 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp2858, i8* %.tmp2859, %m1830$.AssignableInfo.type* %.tmp2860)
br label %.if.end.2857
.if.false.2857:
%.tmp2861 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2862 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2861, i32 0, i32 1
%.tmp2863 = load %m0$.File.type*, %m0$.File.type** %.tmp2862
%.tmp2865 = getelementptr [21 x i8], [21 x i8]*@.str2864, i32 0, i32 0
%.tmp2866 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2867 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp2866)
%.tmp2868 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2869 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2870 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2869, i32 0, i32 3
%.tmp2871 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2870
%.tmp2872 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp2868, %m1830$.Type.type* %.tmp2871)
%.tmp2873 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp2874 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp2873)
%.tmp2875 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2863, i8* %.tmp2865, i8* %.tmp2867, i8* %.tmp2872, i8* %.tmp2874)
br label %.if.end.2857
.if.end.2857:
br label %.if.end.2821
.if.false.2821:
%.tmp2876 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2877 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2876, i32 0, i32 0
%.tmp2878 = load i8*, i8** %.tmp2877
%.tmp2880 = getelementptr [10 x i8], [10 x i8]*@.str2879, i32 0, i32 0
%.tmp2881 = call i32(i8*,i8*) @strcmp(i8* %.tmp2878, i8* %.tmp2880)
%.tmp2882 = icmp eq i32 %.tmp2881, 0
br i1 %.tmp2882, label %.if.true.2883, label %.if.false.2883
.if.true.2883:
%.tmp2884 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2885 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2884, i32 0, i32 6
%.tmp2886 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2885
%.tmp2887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2886, i32 0, i32 7
%.tmp2888 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2887
%.tmp2889 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2888, i32 0, i32 1
%.tmp2890 = load i8*, i8** %.tmp2889
%type_name = alloca i8*
store i8* %.tmp2890, i8** %type_name
%.tmp2891 = load i1, i1* %shallow
%.tmp2892 = icmp eq i1 %.tmp2891, 1
br i1 %.tmp2892, label %.if.true.2893, label %.if.false.2893
.if.true.2893:
%.tmp2894 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2895 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp2894)
store %m1830$.AssignableInfo.type* %.tmp2895, %m1830$.AssignableInfo.type** %info
%.tmp2896 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2897 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2896)
%mod_from = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2897, %m1830$.ModuleLookup.type** %mod_from
%.tmp2898 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2900 = getelementptr [11 x i8], [11 x i8]*@.str2899, i32 0, i32 0
%.tmp2901 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod_from
%.tmp2902 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2901, i32 0, i32 1
%.tmp2903 = load i8*, i8** %.tmp2902
%.tmp2904 = load i8*, i8** %type_name
%.tmp2905 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2898, i8* %.tmp2900, i8* %.tmp2903, i8* %.tmp2904)
%.tmp2906 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2907 = load i8, i8* @SCOPE_LOCAL
%.tmp2908 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp2906, i8 %.tmp2907, i8* %.tmp2908)
%.tmp2909 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2910 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2909, i32 0, i32 2
%.tmp2912 = getelementptr [10 x i8], [10 x i8]*@.str2911, i32 0, i32 0
store i8* %.tmp2912, i8** %.tmp2910
%.tmp2913 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2914 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2913, i32 0, i32 4
%.tmp2915 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2916 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2915, i32 0, i32 3
%.tmp2917 = load i32, i32* %.tmp2916
store i32 %.tmp2917, i32* %.tmp2914
%.tmp2918 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2919 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2918, i32 0, i32 5
%.tmp2920 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2921 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2920, i32 0, i32 4
%.tmp2922 = load i32, i32* %.tmp2921
store i32 %.tmp2922, i32* %.tmp2919
%.tmp2923 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2924 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2923, i32 0, i32 3
%.tmp2925 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp2925, %m1830$.Type.type** %.tmp2924
%.tmp2926 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2927 = load i8*, i8** %type_name
%.tmp2928 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp2926, i8* %.tmp2927, %m1830$.AssignableInfo.type* %.tmp2928)
%.tmp2929 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2930 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2929, i32 0, i32 6
%.tmp2931 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2930
%.tmp2933 = getelementptr [5 x i8], [5 x i8]*@.str2932, i32 0, i32 0
%.tmp2934 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp2931, i8* %.tmp2933)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2934, %m286$.Node.type** %type_decl
%.tmp2935 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2936 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp2937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2936, i32 0, i32 6
%.tmp2938 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2937
%.tmp2939 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp2935, %m286$.Node.type* %.tmp2938)
%type_struct = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2939, %m1830$.Type.type** %type_struct
%.tmp2940 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2941 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2940, i32 0, i32 3
%.tmp2942 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2941
%.tmp2943 = load %m1830$.Type.type*, %m1830$.Type.type** %type_struct
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2942, %m1830$.Type.type* %.tmp2943)
%.tmp2944 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2945 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2944, i32 0, i32 3
%.tmp2946 = load %m1830$.Type.type*, %m1830$.Type.type** %type_struct
store %m1830$.Type.type* %.tmp2946, %m1830$.Type.type** %.tmp2945
br label %.if.end.2893
.if.false.2893:
%.tmp2947 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2948 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2949 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2948, i32 0, i32 6
%.tmp2950 = load i8*, i8** %.tmp2949
%.tmp2951 = load i8*, i8** %type_name
%.tmp2952 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp2947, i8* %.tmp2950, i8* %.tmp2951)
%scope = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp2952, %m1830$.ScopeItem.type** %scope
%.tmp2953 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope
%.tmp2954 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp2953, i32 0, i32 1
%.tmp2955 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp2954
store %m1830$.AssignableInfo.type* %.tmp2955, %m1830$.AssignableInfo.type** %info
%.tmp2956 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2957 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2956, i32 0, i32 1
%.tmp2958 = load %m0$.File.type*, %m0$.File.type** %.tmp2957
%.tmp2960 = getelementptr [14 x i8], [14 x i8]*@.str2959, i32 0, i32 0
%.tmp2961 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2962 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp2961)
%.tmp2963 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2964 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2965 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2964, i32 0, i32 3
%.tmp2966 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2965
%.tmp2967 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp2963, %m1830$.Type.type* %.tmp2966)
%.tmp2968 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2958, i8* %.tmp2960, i8* %.tmp2962, i8* %.tmp2967)
br label %.if.end.2893
.if.end.2893:
br label %.if.end.2883
.if.false.2883:
%.tmp2969 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2970 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2969, i32 0, i32 0
%.tmp2971 = load i8*, i8** %.tmp2970
%.tmp2973 = getelementptr [7 x i8], [7 x i8]*@.str2972, i32 0, i32 0
%.tmp2974 = call i32(i8*,i8*) @strcmp(i8* %.tmp2971, i8* %.tmp2973)
%.tmp2975 = icmp eq i32 %.tmp2974, 0
br i1 %.tmp2975, label %.if.true.2976, label %.if.false.2976
.if.true.2976:
%.tmp2977 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2978 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp2977)
store %m1830$.AssignableInfo.type* %.tmp2978, %m1830$.AssignableInfo.type** %info
%.tmp2979 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2980 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2979, i32 0, i32 3
%.tmp2981 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2982 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2983 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2982, i32 0, i32 6
%.tmp2984 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2983
%.tmp2985 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2984, i32 0, i32 7
%.tmp2986 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2985
%.tmp2987 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$syn_function_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp2981, %m286$.Node.type* %.tmp2986)
store %m1830$.Type.type* %.tmp2987, %m1830$.Type.type** %.tmp2980
%.tmp2988 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2989 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2988, i32 0, i32 2
%.tmp2991 = getelementptr [7 x i8], [7 x i8]*@.str2990, i32 0, i32 0
store i8* %.tmp2991, i8** %.tmp2989
%.tmp2992 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2993 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2992, i32 0, i32 6
%.tmp2994 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2993
%.tmp2995 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2994, i32 0, i32 7
%.tmp2996 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2995
%.tmp2997 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2996, i32 0, i32 7
%.tmp2998 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2997
%.tmp2999 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2998, i32 0, i32 1
%.tmp3000 = load i8*, i8** %.tmp2999
%fn_name = alloca i8*
store i8* %.tmp3000, i8** %fn_name
%.tmp3001 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3002 = load i8, i8* @SCOPE_GLOBAL
%.tmp3003 = load i8*, i8** %fn_name
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3001, i8 %.tmp3002, i8* %.tmp3003)
%.tmp3004 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3005 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3004, i32 0, i32 4
%.tmp3006 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3007 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3006, i32 0, i32 3
%.tmp3008 = load i32, i32* %.tmp3007
store i32 %.tmp3008, i32* %.tmp3005
%.tmp3009 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3010 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3009, i32 0, i32 5
%.tmp3011 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3012 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3011, i32 0, i32 4
%.tmp3013 = load i32, i32* %.tmp3012
store i32 %.tmp3013, i32* %.tmp3010
%.tmp3014 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp3015 = ptrtoint %m1830$.Type.type* %.tmp3014 to i32
%.tmp3016 = call i8*(i32) @malloc(i32 %.tmp3015)
%.tmp3017 = bitcast i8* %.tmp3016 to %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3017, %m1830$.Type.type** %return_type
%.tmp3018 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3019 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3018, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp3019
%.tmp3020 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3021 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3020, i32 0, i32 1
store i8* null, i8** %.tmp3021
%.tmp3022 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3023 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3022, i32 0, i32 0
%.tmp3024 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3025 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3024, i32 0, i32 3
%.tmp3026 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3025
%.tmp3027 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3026, i32 0, i32 3
%.tmp3028 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3027
%.tmp3029 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3028, i32 0, i32 0
%.tmp3030 = load i8*, i8** %.tmp3029
store i8* %.tmp3030, i8** %.tmp3023
%.tmp3031 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3032 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3031, i32 0, i32 3
%.tmp3033 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3034 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3033, i32 0, i32 3
%.tmp3035 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3034
%.tmp3036 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3035, i32 0, i32 3
%.tmp3037 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3036
%.tmp3038 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3037, i32 0, i32 3
%.tmp3039 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3038
store %m1830$.Type.type* %.tmp3039, %m1830$.Type.type** %.tmp3032
%.tmp3040 = load i1, i1* %shallow
%.tmp3041 = icmp eq i1 %.tmp3040, 0
br i1 %.tmp3041, label %.if.true.3042, label %.if.false.3042
.if.true.3042:
%.tmp3043 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3044 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3043, i32 0, i32 1
%.tmp3045 = load %m0$.File.type*, %m0$.File.type** %.tmp3044
%.tmp3047 = getelementptr [15 x i8], [15 x i8]*@.str3046, i32 0, i32 0
%.tmp3048 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3049 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3050 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3048, %m1830$.Type.type* %.tmp3049)
%.tmp3051 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3052 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3051)
%.tmp3053 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3045, i8* %.tmp3047, i8* %.tmp3050, i8* %.tmp3052)
%.tmp3055 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3056 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3055, i32 0, i32 3
%.tmp3057 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3056
%.tmp3058 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3057, i32 0, i32 3
%.tmp3059 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3058
%.tmp3060 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3059, i32 0, i32 4
%.tmp3061 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3060
%pt = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3061, %m1830$.Type.type** %pt
br label %.for.start.3054
.for.start.3054:
%.tmp3062 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3063 = icmp ne %m1830$.Type.type* %.tmp3062, null
br i1 %.tmp3063, label %.for.continue.3054, label %.for.end.3054
.for.continue.3054:
%.tmp3064 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3065 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3066 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3065, i32 0, i32 3
%.tmp3067 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3066
%.tmp3068 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3067, i32 0, i32 3
%.tmp3069 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3068
%.tmp3070 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3069, i32 0, i32 4
%.tmp3071 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3070
%.tmp3072 = icmp ne %m1830$.Type.type* %.tmp3064, %.tmp3071
br i1 %.tmp3072, label %.if.true.3073, label %.if.false.3073
.if.true.3073:
%.tmp3074 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3075 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3074, i32 0, i32 1
%.tmp3076 = load %m0$.File.type*, %m0$.File.type** %.tmp3075
%.tmp3078 = getelementptr [3 x i8], [3 x i8]*@.str3077, i32 0, i32 0
%.tmp3079 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3076, i8* %.tmp3078)
br label %.if.end.3073
.if.false.3073:
br label %.if.end.3073
.if.end.3073:
%.tmp3080 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3081 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3080, i32 0, i32 1
%.tmp3082 = load %m0$.File.type*, %m0$.File.type** %.tmp3081
%.tmp3084 = getelementptr [3 x i8], [3 x i8]*@.str3083, i32 0, i32 0
%.tmp3085 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3086 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3087 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3085, %m1830$.Type.type* %.tmp3086)
%.tmp3088 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3082, i8* %.tmp3084, i8* %.tmp3087)
%.tmp3089 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3090 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3089, i32 0, i32 4
%.tmp3091 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3090
store %m1830$.Type.type* %.tmp3091, %m1830$.Type.type** %pt
br label %.for.start.3054
.for.end.3054:
%.tmp3092 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3093 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3092, i32 0, i32 1
%.tmp3094 = load %m0$.File.type*, %m0$.File.type** %.tmp3093
%.tmp3096 = getelementptr [3 x i8], [3 x i8]*@.str3095, i32 0, i32 0
%.tmp3097 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3094, i8* %.tmp3096)
%.tmp3098 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3099 = bitcast %m1830$.Type.type* %.tmp3098 to i8*
call void(i8*) @free(i8* %.tmp3099)
br label %.if.end.3042
.if.false.3042:
%.tmp3100 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3101 = load i8*, i8** %fn_name
%.tmp3102 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3100, i8* %.tmp3101, %m1830$.AssignableInfo.type* %.tmp3102)
br label %.if.end.3042
.if.end.3042:
br label %.if.end.2976
.if.false.2976:
%.tmp3103 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3104 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3103, i32 0, i32 0
%.tmp3105 = load i8*, i8** %.tmp3104
%.tmp3107 = getelementptr [9 x i8], [9 x i8]*@.str3106, i32 0, i32 0
%.tmp3108 = call i32(i8*,i8*) @strcmp(i8* %.tmp3105, i8* %.tmp3107)
%.tmp3109 = icmp eq i32 %.tmp3108, 0
br i1 %.tmp3109, label %.if.true.3110, label %.if.false.3110
.if.true.3110:
%.tmp3111 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3112 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3111)
store %m1830$.AssignableInfo.type* %.tmp3112, %m1830$.AssignableInfo.type** %info
%.tmp3113 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3114 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3113, i32 0, i32 2
%.tmp3116 = getelementptr [9 x i8], [9 x i8]*@.str3115, i32 0, i32 0
store i8* %.tmp3116, i8** %.tmp3114
%.tmp3117 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3118 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3117, i32 0, i32 3
%.tmp3119 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3120 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3121 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3120, i32 0, i32 6
%.tmp3122 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3121
%.tmp3123 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$syn_function_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3119, %m286$.Node.type* %.tmp3122)
store %m1830$.Type.type* %.tmp3123, %m1830$.Type.type** %.tmp3118
%.tmp3124 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3125 = call i8*(%m286$.Node.type*) @m1830$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3124)
%name = alloca i8*
store i8* %.tmp3125, i8** %name
%.tmp3126 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3127 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3128 = load i8*, i8** %name
%.tmp3129 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3130 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3129, i32 0, i32 3
%.tmp3131 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3130
%.tmp3132 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1830$.Type.type*) @m1830$name_mangle.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3126, %m286$.Node.type* %.tmp3127, i8* %.tmp3128, %m1830$.Type.type* %.tmp3131)
store i8* %.tmp3132, i8** %tmp_buff
%.tmp3133 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3134 = load i8, i8* @SCOPE_GLOBAL
%.tmp3135 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3133, i8 %.tmp3134, i8* %.tmp3135)
%.tmp3136 = load i1, i1* %shallow
%.tmp3137 = icmp eq i1 %.tmp3136, 1
br i1 %.tmp3137, label %.if.true.3138, label %.if.false.3138
.if.true.3138:
%.tmp3139 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3140 = load i8*, i8** %name
%.tmp3141 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3139, i8* %.tmp3140, %m1830$.AssignableInfo.type* %.tmp3141)
br label %.if.end.3138
.if.false.3138:
%.tmp3142 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp3143 = ptrtoint %m1830$.Type.type* %.tmp3142 to i32
%.tmp3144 = call i8*(i32) @malloc(i32 %.tmp3143)
%.tmp3145 = bitcast i8* %.tmp3144 to %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3145, %m1830$.Type.type** %return_type
%.tmp3146 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3147 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3146, i32 0, i32 1
store i8* null, i8** %.tmp3147
%.tmp3148 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3149 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3148, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp3149
%.tmp3150 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3151 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3150, i32 0, i32 0
%.tmp3152 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3153 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3152, i32 0, i32 3
%.tmp3154 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3153
%.tmp3155 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3154, i32 0, i32 3
%.tmp3156 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3155
%.tmp3157 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3156, i32 0, i32 0
%.tmp3158 = load i8*, i8** %.tmp3157
store i8* %.tmp3158, i8** %.tmp3151
%.tmp3159 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3160 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3159, i32 0, i32 3
%.tmp3161 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3162 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3161, i32 0, i32 3
%.tmp3163 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3162
%.tmp3164 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3163, i32 0, i32 3
%.tmp3165 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3164
%.tmp3166 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3165, i32 0, i32 3
%.tmp3167 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3166
store %m1830$.Type.type* %.tmp3167, %m1830$.Type.type** %.tmp3160
%.tmp3168 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3169 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3168, i32 0, i32 1
%.tmp3170 = load %m0$.File.type*, %m0$.File.type** %.tmp3169
%.tmp3172 = getelementptr [14 x i8], [14 x i8]*@.str3171, i32 0, i32 0
%.tmp3173 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3174 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3175 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3173, %m1830$.Type.type* %.tmp3174)
%.tmp3176 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3177 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3176)
%.tmp3178 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3170, i8* %.tmp3172, i8* %.tmp3175, i8* %.tmp3177)
%.tmp3179 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3180 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3179, i32 0, i32 6
%.tmp3181 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3180
%.tmp3182 = call %m286$.Node.type*(%m286$.Node.type*) @m1830$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3181)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3182, %m286$.Node.type** %params
%param_type = alloca %m1830$.Type.type*
%.tmp3184 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3184, %m286$.Node.type** %param_ptr
br label %.for.start.3183
.for.start.3183:
%.tmp3185 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3186 = icmp ne %m286$.Node.type* %.tmp3185, null
br i1 %.tmp3186, label %.for.continue.3183, label %.for.end.3183
.for.continue.3183:
%.tmp3187 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3188 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp3189 = icmp ne %m286$.Node.type* %.tmp3187, %.tmp3188
br i1 %.tmp3189, label %.if.true.3190, label %.if.false.3190
.if.true.3190:
%.tmp3191 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3192 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3191, i32 0, i32 7
%.tmp3193 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3192
store %m286$.Node.type* %.tmp3193, %m286$.Node.type** %param_ptr
%.tmp3194 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3195 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3194, i32 0, i32 1
%.tmp3196 = load %m0$.File.type*, %m0$.File.type** %.tmp3195
%.tmp3198 = getelementptr [3 x i8], [3 x i8]*@.str3197, i32 0, i32 0
%.tmp3199 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3196, i8* %.tmp3198)
br label %.if.end.3190
.if.false.3190:
br label %.if.end.3190
.if.end.3190:
%.tmp3200 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3201 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3200, i32 0, i32 0
%.tmp3202 = load i8*, i8** %.tmp3201
%.tmp3204 = getelementptr [5 x i8], [5 x i8]*@.str3203, i32 0, i32 0
%.tmp3205 = call i32(i8*,i8*) @strcmp(i8* %.tmp3202, i8* %.tmp3204)
%.tmp3206 = icmp eq i32 %.tmp3205, 0
br i1 %.tmp3206, label %.if.true.3207, label %.if.false.3207
.if.true.3207:
%.tmp3208 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3209 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3210 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3209, i32 0, i32 6
%.tmp3211 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3210
%.tmp3212 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3208, %m286$.Node.type* %.tmp3211)
store %m1830$.Type.type* %.tmp3212, %m1830$.Type.type** %param_type
%.tmp3213 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3214 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3213, i32 0, i32 7
%.tmp3215 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3214
store %m286$.Node.type* %.tmp3215, %m286$.Node.type** %param_ptr
br label %.if.end.3207
.if.false.3207:
br label %.if.end.3207
.if.end.3207:
%.tmp3216 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3217 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3216, i32 0, i32 1
%.tmp3218 = load %m0$.File.type*, %m0$.File.type** %.tmp3217
%.tmp3220 = getelementptr [13 x i8], [13 x i8]*@.str3219, i32 0, i32 0
%.tmp3221 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3222 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
%.tmp3223 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3221, %m1830$.Type.type* %.tmp3222)
%.tmp3224 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3225 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3224, i32 0, i32 1
%.tmp3226 = load i8*, i8** %.tmp3225
%.tmp3227 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3218, i8* %.tmp3220, i8* %.tmp3223, i8* %.tmp3226)
%.tmp3228 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3229 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3228, i32 0, i32 7
%.tmp3230 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3229
store %m286$.Node.type* %.tmp3230, %m286$.Node.type** %param_ptr
br label %.for.start.3183
.for.end.3183:
%.tmp3231 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3232 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3231, i32 0, i32 1
%.tmp3233 = load %m0$.File.type*, %m0$.File.type** %.tmp3232
%.tmp3235 = getelementptr [5 x i8], [5 x i8]*@.str3234, i32 0, i32 0
%.tmp3236 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3233, i8* %.tmp3235)
%.tmp3237 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3237)
%.tmp3238 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3239 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_fn_params.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3238, %m286$.Node.type* %.tmp3239)
%.tmp3240 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3241 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3240, i32 0, i32 6
%.tmp3242 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3241
%.tmp3244 = getelementptr [6 x i8], [6 x i8]*@.str3243, i32 0, i32 0
%.tmp3245 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3242, i8* %.tmp3244)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3245, %m286$.Node.type** %fn_block
%.tmp3246 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3247 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3246, %m286$.Node.type* %.tmp3247)
%.tmp3248 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$pop_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3248)
%.tmp3249 = bitcast ptr null to %m286$.Node.type*
%last_valid_instruction = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3249, %m286$.Node.type** %last_valid_instruction
%.tmp3251 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3252 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3251, i32 0, i32 6
%.tmp3253 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3252
%ci = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3253, %m286$.Node.type** %ci
br label %.for.start.3250
.for.start.3250:
%.tmp3254 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3255 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3254, i32 0, i32 7
%.tmp3256 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3255
%.tmp3257 = icmp ne %m286$.Node.type* %.tmp3256, null
br i1 %.tmp3257, label %.for.continue.3250, label %.for.end.3250
.for.continue.3250:
%.tmp3258 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3259 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3258, i32 0, i32 0
%.tmp3260 = load i8*, i8** %.tmp3259
%.tmp3262 = getelementptr [3 x i8], [3 x i8]*@.str3261, i32 0, i32 0
%.tmp3263 = call i32(i8*,i8*) @strcmp(i8* %.tmp3260, i8* %.tmp3262)
%.tmp3264 = icmp ne i32 %.tmp3263, 0
%.tmp3265 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3266 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3265, i32 0, i32 0
%.tmp3267 = load i8*, i8** %.tmp3266
%.tmp3269 = getelementptr [9 x i8], [9 x i8]*@.str3268, i32 0, i32 0
%.tmp3270 = call i32(i8*,i8*) @strcmp(i8* %.tmp3267, i8* %.tmp3269)
%.tmp3271 = icmp ne i32 %.tmp3270, 0
%.tmp3272 = and i1 %.tmp3264, %.tmp3271
br i1 %.tmp3272, label %.if.true.3273, label %.if.false.3273
.if.true.3273:
%.tmp3274 = load %m286$.Node.type*, %m286$.Node.type** %ci
store %m286$.Node.type* %.tmp3274, %m286$.Node.type** %last_valid_instruction
br label %.if.end.3273
.if.false.3273:
br label %.if.end.3273
.if.end.3273:
%.tmp3275 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3276 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3275, i32 0, i32 7
%.tmp3277 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3276
store %m286$.Node.type* %.tmp3277, %m286$.Node.type** %ci
br label %.for.start.3250
.for.end.3250:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3278 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3279 = icmp eq %m286$.Node.type* %.tmp3278, null
br i1 %.tmp3279, label %.if.true.3280, label %.if.false.3280
.if.true.3280:
store i1 1, i1* %add_implicit_return
br label %.if.end.3280
.if.false.3280:
%.tmp3281 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3282 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3281, i32 0, i32 6
%.tmp3283 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3282
%.tmp3284 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3283, i32 0, i32 0
%.tmp3285 = load i8*, i8** %.tmp3284
%.tmp3287 = getelementptr [7 x i8], [7 x i8]*@.str3286, i32 0, i32 0
%.tmp3288 = call i32(i8*,i8*) @strcmp(i8* %.tmp3285, i8* %.tmp3287)
%.tmp3289 = icmp ne i32 %.tmp3288, 0
br i1 %.tmp3289, label %.if.true.3290, label %.if.false.3290
.if.true.3290:
store i1 1, i1* %add_implicit_return
br label %.if.end.3290
.if.false.3290:
br label %.if.end.3290
.if.end.3290:
br label %.if.end.3280
.if.end.3280:
%.tmp3291 = load i1, i1* %add_implicit_return
br i1 %.tmp3291, label %.if.true.3292, label %.if.false.3292
.if.true.3292:
%.tmp3293 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3294 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3295 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3293, %m1830$.Type.type* %.tmp3294)
%.tmp3297 = getelementptr [5 x i8], [5 x i8]*@.str3296, i32 0, i32 0
%.tmp3298 = call i32(i8*,i8*) @strcmp(i8* %.tmp3295, i8* %.tmp3297)
%.tmp3299 = icmp ne i32 %.tmp3298, 0
br i1 %.tmp3299, label %.if.true.3300, label %.if.false.3300
.if.true.3300:
%.tmp3301 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3302 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3304 = getelementptr [21 x i8], [21 x i8]*@.str3303, i32 0, i32 0
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3301, %m286$.Node.type* %.tmp3302, i8* %.tmp3304)
br label %.if.end.3300
.if.false.3300:
%.tmp3305 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3306 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3305, i32 0, i32 1
%.tmp3307 = load %m0$.File.type*, %m0$.File.type** %.tmp3306
%.tmp3309 = getelementptr [10 x i8], [10 x i8]*@.str3308, i32 0, i32 0
%.tmp3310 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3307, i8* %.tmp3309)
br label %.if.end.3300
.if.end.3300:
br label %.if.end.3292
.if.false.3292:
br label %.if.end.3292
.if.end.3292:
%.tmp3311 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3312 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3311, i32 0, i32 1
%.tmp3313 = load %m0$.File.type*, %m0$.File.type** %.tmp3312
%.tmp3315 = getelementptr [3 x i8], [3 x i8]*@.str3314, i32 0, i32 0
%.tmp3316 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3313, i8* %.tmp3315)
br label %.if.end.3138
.if.end.3138:
br label %.if.end.3110
.if.false.3110:
%.tmp3317 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3318 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3317, i32 0, i32 0
%.tmp3319 = load i8*, i8** %.tmp3318
%.tmp3321 = getelementptr [7 x i8], [7 x i8]*@.str3320, i32 0, i32 0
%.tmp3322 = call i32(i8*,i8*) @strcmp(i8* %.tmp3319, i8* %.tmp3321)
%.tmp3323 = icmp eq i32 %.tmp3322, 0
br i1 %.tmp3323, label %.if.true.3324, label %.if.false.3324
.if.true.3324:
%.tmp3325 = load i1, i1* %shallow
%.tmp3326 = icmp eq i1 %.tmp3325, 1
br i1 %.tmp3326, label %.if.true.3327, label %.if.false.3327
.if.true.3327:
%.tmp3328 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3329 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3328, i32 0, i32 6
%.tmp3330 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3329
%.tmp3331 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3330, i32 0, i32 7
%.tmp3332 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3331
%.tmp3333 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3332, i32 0, i32 1
%.tmp3334 = load i8*, i8** %.tmp3333
%mod_name = alloca i8*
store i8* %.tmp3334, i8** %mod_name
%.tmp3335 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3336 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3335, i32 0, i32 6
%.tmp3337 = load i8*, i8** %.tmp3336
%mod_abspath = alloca i8*
store i8* %.tmp3337, i8** %mod_abspath
%.tmp3338 = load i8*, i8** %mod_abspath
%.tmp3339 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3338)
%dirname = alloca i8*
store i8* %.tmp3339, i8** %dirname
%.tmp3340 = load i8*, i8** %mod_name
%.tmp3341 = call i32(i8*) @strlen(i8* %.tmp3340)
%mod_name_len = alloca i32
store i32 %.tmp3341, i32* %mod_name_len
%.tmp3342 = load i32, i32* %mod_name_len
%.tmp3343 = sub i32 %.tmp3342, 1
%.tmp3344 = call i8*(i32) @malloc(i32 %.tmp3343)
%trimmed_name = alloca i8*
store i8* %.tmp3344, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3345
.for.start.3345:
%.tmp3346 = load i32, i32* %i
%.tmp3347 = load i32, i32* %mod_name_len
%.tmp3348 = sub i32 %.tmp3347, 1
%.tmp3349 = icmp slt i32 %.tmp3346, %.tmp3348
br i1 %.tmp3349, label %.for.continue.3345, label %.for.end.3345
.for.continue.3345:
%.tmp3350 = load i32, i32* %i
%.tmp3351 = sub i32 %.tmp3350, 1
%.tmp3352 = load i8*, i8** %trimmed_name
%.tmp3353 = getelementptr i8, i8* %.tmp3352, i32 %.tmp3351
%.tmp3354 = load i32, i32* %i
%.tmp3355 = load i8*, i8** %mod_name
%.tmp3356 = getelementptr i8, i8* %.tmp3355, i32 %.tmp3354
%.tmp3357 = load i8, i8* %.tmp3356
store i8 %.tmp3357, i8* %.tmp3353
%.tmp3358 = load i32, i32* %i
%.tmp3359 = add i32 %.tmp3358, 1
store i32 %.tmp3359, i32* %i
br label %.for.start.3345
.for.end.3345:
%.tmp3360 = load i32, i32* %mod_name_len
%.tmp3361 = sub i32 %.tmp3360, 2
%.tmp3362 = load i8*, i8** %trimmed_name
%.tmp3363 = getelementptr i8, i8* %.tmp3362, i32 %.tmp3361
store i8 0, i8* %.tmp3363
%.tmp3364 = load i8*, i8** %dirname
%.tmp3366 = getelementptr [1 x i8], [1 x i8]*@.str3365, i32 0, i32 0
%.tmp3367 = call i32(i8*,i8*) @strcmp(i8* %.tmp3364, i8* %.tmp3366)
%.tmp3368 = icmp eq i32 %.tmp3367, 0
br i1 %.tmp3368, label %.if.true.3369, label %.if.false.3369
.if.true.3369:
%.tmp3370 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3372 = getelementptr [6 x i8], [6 x i8]*@.str3371, i32 0, i32 0
%.tmp3373 = load i8*, i8** %trimmed_name
%.tmp3374 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3370, i8* %.tmp3372, i8* %.tmp3373)
br label %.if.end.3369
.if.false.3369:
%.tmp3375 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3377 = getelementptr [9 x i8], [9 x i8]*@.str3376, i32 0, i32 0
%.tmp3378 = load i8*, i8** %dirname
%.tmp3379 = load i8*, i8** %trimmed_name
%.tmp3380 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3375, i8* %.tmp3377, i8* %.tmp3378, i8* %.tmp3379)
br label %.if.end.3369
.if.end.3369:
%.tmp3381 = load i8*, i8** %mod_abspath
%.tmp3382 = call i8*(i32) @malloc(i32 4096)
%.tmp3383 = call i8*(i8*,i8*) @realpath(i8* %.tmp3381, i8* %.tmp3382)
store i8* %.tmp3383, i8** %mod_abspath
%.tmp3384 = load i8*, i8** %mod_abspath
%.tmp3385 = icmp eq i8* %.tmp3384, null
br i1 %.tmp3385, label %.if.true.3386, label %.if.false.3386
.if.true.3386:
%.tmp3387 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3389 = getelementptr [60 x i8], [60 x i8]*@.str3388, i32 0, i32 0
%.tmp3390 = load i8*, i8** %mod_name
%.tmp3391 = load i8*, i8** %dirname
%.tmp3392 = load i8*, i8** %trimmed_name
%.tmp3393 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3387, i8* %.tmp3389, i8* %.tmp3390, i8* %.tmp3391, i8* %.tmp3392)
%.tmp3394 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3395 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3396 = load i8*, i8** %err_buf
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3394, %m286$.Node.type* %.tmp3395, i8* %.tmp3396)
ret void
br label %.if.end.3386
.if.false.3386:
br label %.if.end.3386
.if.end.3386:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1830$.ModuleLookup.type*
%.tmp3397 = bitcast ptr null to %m1830$.ModuleLookup.type*
%mod = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp3397, %m1830$.ModuleLookup.type** %mod
%.tmp3399 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3400 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3399, i32 0, i32 5
%.tmp3401 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3400
store %m1830$.ModuleLookup.type* %.tmp3401, %m1830$.ModuleLookup.type** %m
br label %.for.start.3398
.for.start.3398:
%.tmp3402 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3403 = icmp ne %m1830$.ModuleLookup.type* %.tmp3402, null
%.tmp3404 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3405 = icmp eq %m1830$.ModuleLookup.type* %.tmp3404, null
%.tmp3406 = and i1 %.tmp3403, %.tmp3405
br i1 %.tmp3406, label %.for.continue.3398, label %.for.end.3398
.for.continue.3398:
%.tmp3407 = load i8*, i8** %mod_abspath
%.tmp3408 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3409 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3408, i32 0, i32 0
%.tmp3410 = load i8*, i8** %.tmp3409
%.tmp3411 = call i32(i8*,i8*) @strcmp(i8* %.tmp3407, i8* %.tmp3410)
%.tmp3412 = icmp eq i32 %.tmp3411, 0
br i1 %.tmp3412, label %.if.true.3413, label %.if.false.3413
.if.true.3413:
%.tmp3414 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
store %m1830$.ModuleLookup.type* %.tmp3414, %m1830$.ModuleLookup.type** %mod
br label %.if.end.3413
.if.false.3413:
br label %.if.end.3413
.if.end.3413:
%.tmp3415 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3416 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3415, i32 0, i32 2
%.tmp3417 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3416
store %m1830$.ModuleLookup.type* %.tmp3417, %m1830$.ModuleLookup.type** %m
br label %.for.start.3398
.for.end.3398:
%.tmp3418 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3419 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3418, i32 0, i32 6
%.tmp3420 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3419
%.tmp3421 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3420, i32 0, i32 7
%.tmp3422 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3421
%.tmp3423 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3422, i32 0, i32 7
%.tmp3424 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3423
%.tmp3425 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3424, i32 0, i32 7
%.tmp3426 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3425
%.tmp3427 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3426, i32 0, i32 1
%.tmp3428 = load i8*, i8** %.tmp3427
%asname = alloca i8*
store i8* %.tmp3428, i8** %asname
%.tmp3429 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3430 = icmp eq %m1830$.ModuleLookup.type* %.tmp3429, null
br i1 %.tmp3430, label %.if.true.3431, label %.if.false.3431
.if.true.3431:
%.tmp3432 = load i32, i32* @ModuleLookup_size
%.tmp3433 = call i8*(i32) @malloc(i32 %.tmp3432)
%.tmp3434 = bitcast i8* %.tmp3433 to %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp3434, %m1830$.ModuleLookup.type** %mod
%.tmp3435 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3436 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3435, i32 0, i32 0
%.tmp3437 = load i8*, i8** %mod_abspath
store i8* %.tmp3437, i8** %.tmp3436
%.tmp3438 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3439 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3438, i32 0, i32 2
store %m1830$.ModuleLookup.type* null, %m1830$.ModuleLookup.type** %.tmp3439
%.tmp3440 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3441 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3440, i32 0, i32 3
store %m1830$.Scope.type* null, %m1830$.Scope.type** %.tmp3441
%.tmp3442 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3443 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3442, i32 0, i32 1
%.tmp3444 = getelementptr i8*, i8** %.tmp3443, i32 0
%.tmp3446 = getelementptr [5 x i8], [5 x i8]*@.str3445, i32 0, i32 0
%.tmp3447 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3448 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3447)
%.tmp3449 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3444, i8* %.tmp3446, i32 %.tmp3448)
%.tmp3451 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3452 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3451, i32 0, i32 5
%.tmp3453 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3452
store %m1830$.ModuleLookup.type* %.tmp3453, %m1830$.ModuleLookup.type** %m
br label %.for.start.3450
.for.start.3450:
%.tmp3454 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3455 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3454, i32 0, i32 2
%.tmp3456 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3455
%.tmp3457 = icmp ne %m1830$.ModuleLookup.type* %.tmp3456, null
br i1 %.tmp3457, label %.for.continue.3450, label %.for.end.3450
.for.continue.3450:
%.tmp3458 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3459 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3458, i32 0, i32 2
%.tmp3460 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3459
store %m1830$.ModuleLookup.type* %.tmp3460, %m1830$.ModuleLookup.type** %m
br label %.for.start.3450
.for.end.3450:
%.tmp3461 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3462 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3461, i32 0, i32 2
%.tmp3463 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
store %m1830$.ModuleLookup.type* %.tmp3463, %m1830$.ModuleLookup.type** %.tmp3462
%.tmp3464 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3465 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3466 = load i8*, i8** %asname
%.tmp3467 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3468 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3467, i32 0, i32 0
%.tmp3469 = load i8*, i8** %.tmp3468
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1830$define_module.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp3464, %m286$.Node.type* %.tmp3465, i8* %.tmp3466, i8* %.tmp3469)
%.tmp3470 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3471 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3470, i32 0, i32 6
%.tmp3472 = load i8*, i8** %.tmp3471
%curr_mod = alloca i8*
store i8* %.tmp3472, i8** %curr_mod
%.tmp3473 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3474 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3473, i32 0, i32 6
%.tmp3475 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3476 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3475, i32 0, i32 0
%.tmp3477 = load i8*, i8** %.tmp3476
store i8* %.tmp3477, i8** %.tmp3474
%.tmp3478 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3479 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3480 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3479, i32 0, i32 0
%.tmp3481 = load i8*, i8** %.tmp3480
%.tmp3482 = call i1(%m1830$.CompilerCtx.type*,i8*) @m1830$compile_file.b.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp3478, i8* %.tmp3481)
%.tmp3483 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3484 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3483, i32 0, i32 6
%.tmp3485 = load i8*, i8** %curr_mod
store i8* %.tmp3485, i8** %.tmp3484
br label %.if.end.3431
.if.false.3431:
%.tmp3486 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3487 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3488 = load i8*, i8** %asname
%.tmp3489 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3490 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3489, i32 0, i32 0
%.tmp3491 = load i8*, i8** %.tmp3490
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1830$define_module.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp3486, %m286$.Node.type* %.tmp3487, i8* %.tmp3488, i8* %.tmp3491)
br label %.if.end.3431
.if.end.3431:
br label %.if.end.3327
.if.false.3327:
br label %.if.end.3327
.if.end.3327:
br label %.if.end.3324
.if.false.3324:
%.tmp3492 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3493 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3495 = getelementptr [40 x i8], [40 x i8]*@.str3494, i32 0, i32 0
%.tmp3496 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3492, %m286$.Node.type* %.tmp3493, i8* %.tmp3495)
%.tmp3497 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3498 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3497, i32 0, i32 0
%.tmp3499 = load i8*, i8** %.tmp3498
%.tmp3500 = call i32(i8*,...) @printf(i8* %.tmp3496, i8* %.tmp3499)
br label %.if.end.3324
.if.end.3324:
br label %.if.end.3110
.if.end.3110:
br label %.if.end.2976
.if.end.2976:
br label %.if.end.2883
.if.end.2883:
br label %.if.end.2821
.if.end.2821:
br label %.if.end.2813
.if.end.2813:
ret void
}
define i8* @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf = alloca i8*
%.tmp3501 = getelementptr i8*, i8** %buf, i32 0
%.tmp3503 = getelementptr [31 x i8], [31 x i8]*@.str3502, i32 0, i32 0
%.tmp3504 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3505 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3504, i32 0, i32 6
%.tmp3506 = load i8*, i8** %.tmp3505
%.tmp3507 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3508 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3507, i32 0, i32 3
%.tmp3509 = load i32, i32* %.tmp3508
%.tmp3510 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3511 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3510, i32 0, i32 4
%.tmp3512 = load i32, i32* %.tmp3511
%.tmp3513 = load i8*, i8** %msg
%.tmp3514 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3501, i8* %.tmp3503, i8* %.tmp3506, i32 %.tmp3509, i32 %.tmp3512, i8* %.tmp3513)
%.tmp3515 = load i8*, i8** %buf
ret i8* %.tmp3515
}
define void @m1830$compile_fn_params.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1830$.Type.type*
%.tmp3517 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3517, %m286$.Node.type** %param_ptr
br label %.for.start.3516
.for.start.3516:
%.tmp3518 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3519 = icmp ne %m286$.Node.type* %.tmp3518, null
br i1 %.tmp3519, label %.for.continue.3516, label %.for.end.3516
.for.continue.3516:
%.tmp3520 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3521 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3522 = icmp ne %m286$.Node.type* %.tmp3520, %.tmp3521
br i1 %.tmp3522, label %.if.true.3523, label %.if.false.3523
.if.true.3523:
%.tmp3524 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3525 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3524, i32 0, i32 7
%.tmp3526 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3525
store %m286$.Node.type* %.tmp3526, %m286$.Node.type** %param_ptr
br label %.if.end.3523
.if.false.3523:
br label %.if.end.3523
.if.end.3523:
%.tmp3527 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3528 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3527)
%param_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3528, %m1830$.AssignableInfo.type** %param_info
%.tmp3529 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3530 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3529, i32 0, i32 2
%.tmp3532 = getelementptr [9 x i8], [9 x i8]*@.str3531, i32 0, i32 0
store i8* %.tmp3532, i8** %.tmp3530
%.tmp3533 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3534 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3533, i32 0, i32 0
%.tmp3535 = load i8*, i8** %.tmp3534
%.tmp3537 = getelementptr [5 x i8], [5 x i8]*@.str3536, i32 0, i32 0
%.tmp3538 = call i32(i8*,i8*) @strcmp(i8* %.tmp3535, i8* %.tmp3537)
%.tmp3539 = icmp eq i32 %.tmp3538, 0
br i1 %.tmp3539, label %.if.true.3540, label %.if.false.3540
.if.true.3540:
%.tmp3541 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3542 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3543 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3542, i32 0, i32 6
%.tmp3544 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3543
%.tmp3545 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3541, %m286$.Node.type* %.tmp3544)
store %m1830$.Type.type* %.tmp3545, %m1830$.Type.type** %param_type
%.tmp3546 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3547 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3546, i32 0, i32 7
%.tmp3548 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3547
store %m286$.Node.type* %.tmp3548, %m286$.Node.type** %param_ptr
br label %.if.end.3540
.if.false.3540:
br label %.if.end.3540
.if.end.3540:
%.tmp3549 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3550 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3549, i32 0, i32 3
%.tmp3551 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
store %m1830$.Type.type* %.tmp3551, %m1830$.Type.type** %.tmp3550
%.tmp3552 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3553 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3552, i32 0, i32 1
%.tmp3554 = load i8*, i8** %.tmp3553
%var_name = alloca i8*
store i8* %.tmp3554, i8** %var_name
%.tmp3555 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3556 = load i8, i8* @SCOPE_LOCAL
%.tmp3557 = load i8*, i8** %var_name
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3555, i8 %.tmp3556, i8* %.tmp3557)
%.tmp3558 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3559 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3560 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3559, i32 0, i32 3
%.tmp3561 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3560
%.tmp3562 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3558, %m1830$.Type.type* %.tmp3561)
%param_info_tr = alloca i8*
store i8* %.tmp3562, i8** %param_info_tr
%.tmp3563 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3564 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3563, i32 0, i32 1
%.tmp3565 = load %m0$.File.type*, %m0$.File.type** %.tmp3564
%.tmp3567 = getelementptr [16 x i8], [16 x i8]*@.str3566, i32 0, i32 0
%.tmp3568 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3569 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3568)
%.tmp3570 = load i8*, i8** %param_info_tr
%.tmp3571 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3565, i8* %.tmp3567, i8* %.tmp3569, i8* %.tmp3570)
%.tmp3572 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3573 = load i8*, i8** %var_name
%.tmp3574 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3572, i8* %.tmp3573, %m1830$.AssignableInfo.type* %.tmp3574)
%.tmp3575 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3576 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3575, i32 0, i32 1
%.tmp3577 = load %m0$.File.type*, %m0$.File.type** %.tmp3576
%.tmp3579 = getelementptr [28 x i8], [28 x i8]*@.str3578, i32 0, i32 0
%.tmp3580 = load i8*, i8** %param_info_tr
%.tmp3581 = load i8*, i8** %var_name
%.tmp3582 = load i8*, i8** %param_info_tr
%.tmp3583 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3584 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3583)
%.tmp3585 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3577, i8* %.tmp3579, i8* %.tmp3580, i8* %.tmp3581, i8* %.tmp3582, i8* %.tmp3584)
%.tmp3586 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3587 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3586, i32 0, i32 7
%.tmp3588 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3587
store %m286$.Node.type* %.tmp3588, %m286$.Node.type** %param_ptr
br label %.for.start.3516
.for.end.3516:
ret void
}
define void @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3589 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3589)
%.tmp3591 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3592 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3591, i32 0, i32 6
%.tmp3593 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3592
%b = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3593, %m286$.Node.type** %b
br label %.for.start.3590
.for.start.3590:
%.tmp3594 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3595 = icmp ne %m286$.Node.type* %.tmp3594, null
br i1 %.tmp3595, label %.for.continue.3590, label %.for.end.3590
.for.continue.3590:
%.tmp3596 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3597 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3596, i32 0, i32 0
%.tmp3598 = load i8*, i8** %.tmp3597
%.tmp3600 = getelementptr [11 x i8], [11 x i8]*@.str3599, i32 0, i32 0
%.tmp3601 = call i32(i8*,i8*) @strcmp(i8* %.tmp3598, i8* %.tmp3600)
%.tmp3602 = icmp eq i32 %.tmp3601, 0
br i1 %.tmp3602, label %.if.true.3603, label %.if.false.3603
.if.true.3603:
%.tmp3604 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3605 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3606 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3605, i32 0, i32 6
%.tmp3607 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3606
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3604, %m286$.Node.type* %.tmp3607)
br label %.if.end.3603
.if.false.3603:
br label %.if.end.3603
.if.end.3603:
%.tmp3608 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3609 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3608, i32 0, i32 7
%.tmp3610 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3609
store %m286$.Node.type* %.tmp3610, %m286$.Node.type** %b
br label %.for.start.3590
.for.end.3590:
%.tmp3611 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$pop_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3611)
ret void
}
define %m1830$.AssignableInfo.type* @m1830$compile_builtin.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3612 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3613 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3612, i32 0, i32 6
%.tmp3614 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3613
%.tmp3615 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3614, i32 0, i32 6
%.tmp3616 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3615
%dotted = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3616, %m286$.Node.type** %dotted
%.tmp3617 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3618 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3617, i32 0, i32 7
%.tmp3619 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3618
%.tmp3620 = icmp ne %m286$.Node.type* %.tmp3619, null
br i1 %.tmp3620, label %.if.true.3621, label %.if.false.3621
.if.true.3621:
%.tmp3622 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3622
br label %.if.end.3621
.if.false.3621:
br label %.if.end.3621
.if.end.3621:
%.tmp3623 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3624 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3623, i32 0, i32 1
%.tmp3625 = load i8*, i8** %.tmp3624
%.tmp3627 = getelementptr [7 x i8], [7 x i8]*@.str3626, i32 0, i32 0
%.tmp3628 = call i32(i8*,i8*) @strcmp(i8* %.tmp3625, i8* %.tmp3627)
%.tmp3629 = icmp eq i32 %.tmp3628, 0
br i1 %.tmp3629, label %.if.true.3630, label %.if.false.3630
.if.true.3630:
%.tmp3631 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3633 = getelementptr [8 x i8], [8 x i8]*@.str3632, i32 0, i32 0
%.tmp3634 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3631, i8* %.tmp3633)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3634, %m286$.Node.type** %args
%.tmp3635 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3636 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3635, i32 0, i32 6
%.tmp3637 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3636
%.tmp3639 = getelementptr [11 x i8], [11 x i8]*@.str3638, i32 0, i32 0
%.tmp3640 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3637, i8* %.tmp3639)
%value = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3640, %m286$.Node.type** %value
%.tmp3641 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3642 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3641, i32 0, i32 6
%.tmp3643 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3642
%.tmp3644 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3643, i32 0, i32 6
%.tmp3645 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3644
%.tmp3646 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3645, i32 0, i32 6
%.tmp3647 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3646
%.tmp3648 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3647, i32 0, i32 6
%.tmp3649 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3648
store %m286$.Node.type* %.tmp3649, %m286$.Node.type** %value
%.tmp3650 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3651 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3650)
%tmp_id = alloca i32
store i32 %.tmp3651, i32* %tmp_id
%.tmp3652 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3653 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3652)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3653, %m1830$.AssignableInfo.type** %info
%.tmp3654 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3655 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3654, %m1830$.AssignableInfo.type* %.tmp3655)
%.tmp3656 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3657 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3656, i32 0, i32 3
%.tmp3658 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp3658, %m1830$.Type.type** %.tmp3657
%.tmp3659 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3660 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3659, i32 0, i32 3
%.tmp3661 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3660
%.tmp3662 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3661, i32 0, i32 0
%.tmp3664 = getelementptr [4 x i8], [4 x i8]*@.str3663, i32 0, i32 0
store i8* %.tmp3664, i8** %.tmp3662
%.tmp3665 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3666 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3667 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3665, %m286$.Node.type* %.tmp3666)
%inspected_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3667, %m1830$.Type.type** %inspected_type
%.tmp3668 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3669 = load %m1830$.Type.type*, %m1830$.Type.type** %inspected_type
%.tmp3670 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3668, %m1830$.Type.type* %.tmp3669)
%type_as_str = alloca i8*
store i8* %.tmp3670, i8** %type_as_str
%.tmp3671 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3672 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3671, i32 0, i32 1
%.tmp3673 = load %m0$.File.type*, %m0$.File.type** %.tmp3672
%.tmp3675 = getelementptr [46 x i8], [46 x i8]*@.str3674, i32 0, i32 0
%.tmp3676 = load i32, i32* %tmp_id
%.tmp3677 = load i8*, i8** %type_as_str
%.tmp3678 = load i8*, i8** %type_as_str
%.tmp3679 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3673, i8* %.tmp3675, i32 %.tmp3676, i8* %.tmp3677, i8* %.tmp3678)
%.tmp3680 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3681 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3680, i32 0, i32 1
%.tmp3682 = load %m0$.File.type*, %m0$.File.type** %.tmp3681
%.tmp3684 = getelementptr [35 x i8], [35 x i8]*@.str3683, i32 0, i32 0
%.tmp3685 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3686 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3685)
%.tmp3687 = load i8*, i8** %type_as_str
%.tmp3688 = load i32, i32* %tmp_id
%.tmp3689 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3682, i8* %.tmp3684, i8* %.tmp3686, i8* %.tmp3687, i32 %.tmp3688)
%.tmp3690 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp3690
br label %.if.end.3630
.if.false.3630:
br label %.if.end.3630
.if.end.3630:
%.tmp3691 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3691
}
define %m1830$.AssignableInfo.type* @m1830$compile_fn_call.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3692 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3693 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3694 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_builtin.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3692, %m286$.Node.type* %.tmp3693)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3694, %m1830$.AssignableInfo.type** %info
%.tmp3695 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3696 = icmp ne %m1830$.AssignableInfo.type* %.tmp3695, null
br i1 %.tmp3696, label %.if.true.3697, label %.if.false.3697
.if.true.3697:
%.tmp3698 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp3698
br label %.if.end.3697
.if.false.3697:
br label %.if.end.3697
.if.end.3697:
%.tmp3699 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3700 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3701 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3699, %m286$.Node.type* %.tmp3700)
store %m1830$.AssignableInfo.type* %.tmp3701, %m1830$.AssignableInfo.type** %info
%.tmp3702 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3703 = icmp eq %m1830$.AssignableInfo.type* %.tmp3702, null
br i1 %.tmp3703, label %.if.true.3704, label %.if.false.3704
.if.true.3704:
%.tmp3705 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3705, label %.if.true.3706, label %.if.false.3706
.if.true.3706:
%.tmp3707 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3708 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3710 = getelementptr [35 x i8], [35 x i8]*@.str3709, i32 0, i32 0
%.tmp3711 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3707, %m286$.Node.type* %.tmp3708, i8* %.tmp3710)
%.tmp3712 = call i32(i8*,...) @printf(i8* %.tmp3711)
br label %.if.end.3706
.if.false.3706:
br label %.if.end.3706
.if.end.3706:
%.tmp3713 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3713
br label %.if.end.3704
.if.false.3704:
br label %.if.end.3704
.if.end.3704:
%.tmp3714 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3716 = getelementptr [8 x i8], [8 x i8]*@.str3715, i32 0, i32 0
%.tmp3717 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3714, i8* %.tmp3716)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3717, %m286$.Node.type** %args
%.tmp3719 = getelementptr [1 x i8], [1 x i8]*@.str3718, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3719, i8** %params_buff
%tmp = alloca i8*
%.tmp3720 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3721 = icmp ne %m286$.Node.type* %.tmp3720, null
br i1 %.tmp3721, label %.if.true.3722, label %.if.false.3722
.if.true.3722:
%.tmp3723 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3724 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3723, i32 0, i32 6
%.tmp3725 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3724
%.tmp3727 = getelementptr [11 x i8], [11 x i8]*@.str3726, i32 0, i32 0
%.tmp3728 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3725, i8* %.tmp3727)
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3728, %m286$.Node.type** %start
%.tmp3730 = load %m286$.Node.type*, %m286$.Node.type** %start
%pp = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3730, %m286$.Node.type** %pp
br label %.for.start.3729
.for.start.3729:
%.tmp3731 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3732 = icmp ne %m286$.Node.type* %.tmp3731, null
br i1 %.tmp3732, label %.for.continue.3729, label %.for.end.3729
.for.continue.3729:
%.tmp3733 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3734 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp3735 = icmp ne %m286$.Node.type* %.tmp3733, %.tmp3734
br i1 %.tmp3735, label %.if.true.3736, label %.if.false.3736
.if.true.3736:
%.tmp3737 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3739 = getelementptr [5 x i8], [5 x i8]*@.str3738, i32 0, i32 0
%.tmp3740 = load i8*, i8** %params_buff
%.tmp3741 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3737, i8* %.tmp3739, i8* %.tmp3740)
%.tmp3742 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3742, i8** %tmp_buff
%.tmp3743 = load i8*, i8** %tmp
store i8* %.tmp3743, i8** %params_buff
%.tmp3744 = load i8*, i8** %tmp_buff
store i8* %.tmp3744, i8** %tmp
%.tmp3745 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3745)
br label %.if.end.3736
.if.false.3736:
br label %.if.end.3736
.if.end.3736:
%.tmp3746 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3747 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3748 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3746, %m286$.Node.type* %.tmp3747)
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3748, %m1830$.AssignableInfo.type** %a_info
%.tmp3749 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3750 = icmp eq %m1830$.AssignableInfo.type* %.tmp3749, null
br i1 %.tmp3750, label %.if.true.3751, label %.if.false.3751
.if.true.3751:
%.tmp3752 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3752
br label %.if.end.3751
.if.false.3751:
br label %.if.end.3751
.if.end.3751:
%.tmp3753 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3755 = getelementptr [8 x i8], [8 x i8]*@.str3754, i32 0, i32 0
%.tmp3756 = load i8*, i8** %params_buff
%.tmp3757 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3758 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3759 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3758, i32 0, i32 3
%.tmp3760 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3759
%.tmp3761 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3757, %m1830$.Type.type* %.tmp3760)
%.tmp3762 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3763 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3762)
%.tmp3764 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3753, i8* %.tmp3755, i8* %.tmp3756, i8* %.tmp3761, i8* %.tmp3763)
%.tmp3765 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3766 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3765, i32 0, i32 7
%.tmp3767 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3766
store %m286$.Node.type* %.tmp3767, %m286$.Node.type** %pp
%.tmp3768 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3770 = getelementptr [11 x i8], [11 x i8]*@.str3769, i32 0, i32 0
%.tmp3771 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3768, i8* %.tmp3770)
store %m286$.Node.type* %.tmp3771, %m286$.Node.type** %pp
br label %.for.start.3729
.for.end.3729:
br label %.if.end.3722
.if.false.3722:
br label %.if.end.3722
.if.end.3722:
%.tmp3772 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3773 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3774 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3773, i32 0, i32 3
%.tmp3775 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3774
%.tmp3776 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3775, i32 0, i32 3
%.tmp3777 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3776
%.tmp3778 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3772, %m1830$.Type.type* %.tmp3777)
%.tmp3780 = getelementptr [5 x i8], [5 x i8]*@.str3779, i32 0, i32 0
%.tmp3781 = call i32(i8*,i8*) @strcmp(i8* %.tmp3778, i8* %.tmp3780)
%.tmp3782 = icmp eq i32 %.tmp3781, 0
br i1 %.tmp3782, label %.if.true.3783, label %.if.false.3783
.if.true.3783:
%.tmp3784 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3785 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3784, i32 0, i32 1
%.tmp3786 = load %m0$.File.type*, %m0$.File.type** %.tmp3785
%.tmp3788 = getelementptr [16 x i8], [16 x i8]*@.str3787, i32 0, i32 0
%.tmp3789 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3790 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3791 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3790, i32 0, i32 3
%.tmp3792 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3791
%.tmp3793 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3789, %m1830$.Type.type* %.tmp3792)
%.tmp3794 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3795 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3794)
%.tmp3796 = load i8*, i8** %params_buff
%.tmp3797 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3786, i8* %.tmp3788, i8* %.tmp3793, i8* %.tmp3795, i8* %.tmp3796)
%.tmp3798 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3798
br label %.if.end.3783
.if.false.3783:
br label %.if.end.3783
.if.end.3783:
%.tmp3799 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3800 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3799)
%call_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3800, %m1830$.AssignableInfo.type** %call_info
%.tmp3801 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3802 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3801, %m1830$.AssignableInfo.type* %.tmp3802)
%.tmp3803 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3804 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3803, i32 0, i32 3
%.tmp3805 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3806 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3805, i32 0, i32 3
%.tmp3807 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3806
%.tmp3808 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3807, i32 0, i32 3
%.tmp3809 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3808
%.tmp3810 = call %m1830$.Type.type*(%m1830$.Type.type*) @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp3809)
store %m1830$.Type.type* %.tmp3810, %m1830$.Type.type** %.tmp3804
%.tmp3811 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3812 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3811, i32 0, i32 3
%.tmp3813 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3812
%.tmp3814 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3813, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp3814
%.tmp3815 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3816 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3815, i32 0, i32 1
%.tmp3817 = load %m0$.File.type*, %m0$.File.type** %.tmp3816
%.tmp3819 = getelementptr [21 x i8], [21 x i8]*@.str3818, i32 0, i32 0
%.tmp3820 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3821 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3820)
%.tmp3822 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3823 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3824 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3823, i32 0, i32 3
%.tmp3825 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3824
%.tmp3826 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3822, %m1830$.Type.type* %.tmp3825)
%.tmp3827 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3828 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3827)
%.tmp3829 = load i8*, i8** %params_buff
%.tmp3830 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3817, i8* %.tmp3819, i8* %.tmp3821, i8* %.tmp3826, i8* %.tmp3828, i8* %.tmp3829)
%.tmp3831 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3832 = bitcast %m1830$.AssignableInfo.type* %.tmp3831 to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3832
}
define void @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp3833 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3833, i32 0, i32 0
%.tmp3835 = load i8*, i8** %.tmp3834
%expr_type = alloca i8*
store i8* %.tmp3835, i8** %expr_type
%.tmp3836 = bitcast ptr null to %m1830$.AssignableInfo.type*
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3836, %m1830$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
%.tmp3837 = bitcast ptr null to %m1830$.AssignableInfo.type*
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3837, %m1830$.AssignableInfo.type** %a_info
%.tmp3838 = load i8*, i8** %expr_type
%.tmp3840 = getelementptr [7 x i8], [7 x i8]*@.str3839, i32 0, i32 0
%.tmp3841 = call i32(i8*,i8*) @strcmp(i8* %.tmp3838, i8* %.tmp3840)
%.tmp3842 = icmp eq i32 %.tmp3841, 0
br i1 %.tmp3842, label %.if.true.3843, label %.if.false.3843
.if.true.3843:
%.tmp3844 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3845 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3844, i32 0, i32 6
%.tmp3846 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3845
%.tmp3847 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3846, i32 0, i32 7
%.tmp3848 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3847
%.tmp3849 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3848, i32 0, i32 0
%.tmp3850 = load i8*, i8** %.tmp3849
%.tmp3852 = getelementptr [3 x i8], [3 x i8]*@.str3851, i32 0, i32 0
%.tmp3853 = call i32(i8*,i8*) @strcmp(i8* %.tmp3850, i8* %.tmp3852)
%.tmp3854 = icmp ne i32 %.tmp3853, 0
br i1 %.tmp3854, label %.if.true.3855, label %.if.false.3855
.if.true.3855:
%.tmp3856 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3857 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3858 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3857, i32 0, i32 6
%.tmp3859 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3858
%.tmp3860 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3859, i32 0, i32 7
%.tmp3861 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3860
%.tmp3862 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3856, %m286$.Node.type* %.tmp3861)
store %m1830$.AssignableInfo.type* %.tmp3862, %m1830$.AssignableInfo.type** %info
%.tmp3863 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3864 = icmp eq %m1830$.AssignableInfo.type* %.tmp3863, null
br i1 %.tmp3864, label %.if.true.3865, label %.if.false.3865
.if.true.3865:
ret void
br label %.if.end.3865
.if.false.3865:
br label %.if.end.3865
.if.end.3865:
%.tmp3866 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3867 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3866, i32 0, i32 1
%.tmp3868 = load %m0$.File.type*, %m0$.File.type** %.tmp3867
%.tmp3870 = getelementptr [11 x i8], [11 x i8]*@.str3869, i32 0, i32 0
%.tmp3871 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3872 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3873 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3872, i32 0, i32 3
%.tmp3874 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3873
%.tmp3875 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3871, %m1830$.Type.type* %.tmp3874)
%.tmp3876 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3877 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3876)
%.tmp3878 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3868, i8* %.tmp3870, i8* %.tmp3875, i8* %.tmp3877)
br label %.if.end.3855
.if.false.3855:
%.tmp3879 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3880 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3879, i32 0, i32 1
%.tmp3881 = load %m0$.File.type*, %m0$.File.type** %.tmp3880
%.tmp3883 = getelementptr [10 x i8], [10 x i8]*@.str3882, i32 0, i32 0
%.tmp3884 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3881, i8* %.tmp3883)
br label %.if.end.3855
.if.end.3855:
br label %.if.end.3843
.if.false.3843:
%.tmp3885 = load i8*, i8** %expr_type
%.tmp3887 = getelementptr [3 x i8], [3 x i8]*@.str3886, i32 0, i32 0
%.tmp3888 = call i32(i8*,i8*) @strcmp(i8* %.tmp3885, i8* %.tmp3887)
%.tmp3889 = icmp eq i32 %.tmp3888, 0
br i1 %.tmp3889, label %.if.true.3890, label %.if.false.3890
.if.true.3890:
br label %.if.end.3890
.if.false.3890:
%.tmp3891 = load i8*, i8** %expr_type
%.tmp3893 = getelementptr [8 x i8], [8 x i8]*@.str3892, i32 0, i32 0
%.tmp3894 = call i32(i8*,i8*) @strcmp(i8* %.tmp3891, i8* %.tmp3893)
%.tmp3895 = icmp eq i32 %.tmp3894, 0
br i1 %.tmp3895, label %.if.true.3896, label %.if.false.3896
.if.true.3896:
%.tmp3897 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3898 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3899 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3898, i32 0, i32 6
%.tmp3900 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3899
%.tmp3901 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_fn_call.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3897, %m286$.Node.type* %.tmp3900)
br label %.if.end.3896
.if.false.3896:
%.tmp3902 = load i8*, i8** %expr_type
%.tmp3904 = getelementptr [12 x i8], [12 x i8]*@.str3903, i32 0, i32 0
%.tmp3905 = call i32(i8*,i8*) @strcmp(i8* %.tmp3902, i8* %.tmp3904)
%.tmp3906 = icmp eq i32 %.tmp3905, 0
br i1 %.tmp3906, label %.if.true.3907, label %.if.false.3907
.if.true.3907:
%.tmp3908 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3909 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3910 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_declaration.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3908, %m286$.Node.type* %.tmp3909)
br label %.if.end.3907
.if.false.3907:
%.tmp3911 = load i8*, i8** %expr_type
%.tmp3913 = getelementptr [11 x i8], [11 x i8]*@.str3912, i32 0, i32 0
%.tmp3914 = call i32(i8*,i8*) @strcmp(i8* %.tmp3911, i8* %.tmp3913)
%.tmp3915 = icmp eq i32 %.tmp3914, 0
br i1 %.tmp3915, label %.if.true.3916, label %.if.false.3916
.if.true.3916:
%.tmp3917 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3918 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3917, i32 0, i32 6
%.tmp3919 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3918
%.tmp3921 = getelementptr [11 x i8], [11 x i8]*@.str3920, i32 0, i32 0
%.tmp3922 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3919, i8* %.tmp3921)
store %m286$.Node.type* %.tmp3922, %m286$.Node.type** %assignable
%.tmp3923 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3924 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3925 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3924, i32 0, i32 6
%.tmp3926 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3925
%.tmp3927 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3923, %m286$.Node.type* %.tmp3926)
%dest = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3927, %m1830$.AssignableInfo.type** %dest
%.tmp3928 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %dest
%.tmp3929 = icmp eq %m1830$.AssignableInfo.type* %.tmp3928, null
br i1 %.tmp3929, label %.if.true.3930, label %.if.false.3930
.if.true.3930:
%.tmp3931 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp3933 = getelementptr [34 x i8], [34 x i8]*@.str3932, i32 0, i32 0
%.tmp3934 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3935 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3934, i32 0, i32 6
%.tmp3936 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3935
%.tmp3937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3936, i32 0, i32 6
%.tmp3938 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3937
%.tmp3939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3938, i32 0, i32 6
%.tmp3940 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3939
%.tmp3941 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3940, i32 0, i32 1
%.tmp3942 = load i8*, i8** %.tmp3941
%.tmp3943 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3931, i8* %.tmp3933, i8* %.tmp3942)
%.tmp3944 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3945 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3946 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3944, %m286$.Node.type* %.tmp3945, i8* %.tmp3946)
ret void
br label %.if.end.3930
.if.false.3930:
br label %.if.end.3930
.if.end.3930:
%.tmp3947 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3948 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp3949 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3947, %m286$.Node.type* %.tmp3948)
store %m1830$.AssignableInfo.type* %.tmp3949, %m1830$.AssignableInfo.type** %a_info
%.tmp3950 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3951 = icmp eq %m1830$.AssignableInfo.type* %.tmp3950, null
br i1 %.tmp3951, label %.if.true.3952, label %.if.false.3952
.if.true.3952:
ret void
br label %.if.end.3952
.if.false.3952:
br label %.if.end.3952
.if.end.3952:
%.tmp3953 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3954 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %dest
%.tmp3955 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3954, i32 0, i32 3
%.tmp3956 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3955
%.tmp3957 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3953, %m1830$.Type.type* %.tmp3956)
%dest_tr = alloca i8*
store i8* %.tmp3957, i8** %dest_tr
%.tmp3958 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3959 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3960 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3959, i32 0, i32 3
%.tmp3961 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3960
%.tmp3962 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3958, %m1830$.Type.type* %.tmp3961)
%src_tr = alloca i8*
store i8* %.tmp3962, i8** %src_tr
%.tmp3963 = load i8*, i8** %src_tr
%.tmp3965 = getelementptr [4 x i8], [4 x i8]*@.str3964, i32 0, i32 0
%.tmp3966 = call i32(i8*,i8*) @strcmp(i8* %.tmp3963, i8* %.tmp3965)
%.tmp3967 = icmp eq i32 %.tmp3966, 0
br i1 %.tmp3967, label %.if.true.3968, label %.if.false.3968
.if.true.3968:
%.tmp3969 = load i8*, i8** %dest_tr
store i8* %.tmp3969, i8** %src_tr
br label %.if.end.3968
.if.false.3968:
br label %.if.end.3968
.if.end.3968:
%.tmp3970 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3971 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3970, i32 0, i32 1
%.tmp3972 = load %m0$.File.type*, %m0$.File.type** %.tmp3971
%.tmp3974 = getelementptr [21 x i8], [21 x i8]*@.str3973, i32 0, i32 0
%.tmp3975 = load i8*, i8** %src_tr
%.tmp3976 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3977 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3976)
%.tmp3978 = load i8*, i8** %dest_tr
%.tmp3979 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %dest
%.tmp3980 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3979)
%.tmp3981 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3972, i8* %.tmp3974, i8* %.tmp3975, i8* %.tmp3977, i8* %.tmp3978, i8* %.tmp3980)
br label %.if.end.3916
.if.false.3916:
%.tmp3982 = load i8*, i8** %expr_type
%.tmp3984 = getelementptr [9 x i8], [9 x i8]*@.str3983, i32 0, i32 0
%.tmp3985 = call i32(i8*,i8*) @strcmp(i8* %.tmp3982, i8* %.tmp3984)
%.tmp3986 = icmp eq i32 %.tmp3985, 0
br i1 %.tmp3986, label %.if.true.3987, label %.if.false.3987
.if.true.3987:
%.tmp3988 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3989 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_if_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3988, %m286$.Node.type* %.tmp3989)
br label %.if.end.3987
.if.false.3987:
%.tmp3990 = load i8*, i8** %expr_type
%.tmp3992 = getelementptr [9 x i8], [9 x i8]*@.str3991, i32 0, i32 0
%.tmp3993 = call i32(i8*,i8*) @strcmp(i8* %.tmp3990, i8* %.tmp3992)
%.tmp3994 = icmp eq i32 %.tmp3993, 0
br i1 %.tmp3994, label %.if.true.3995, label %.if.false.3995
.if.true.3995:
%.tmp3996 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3997 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_for_loop.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3996, %m286$.Node.type* %.tmp3997)
br label %.if.end.3995
.if.false.3995:
%.tmp3998 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3999 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4001 = getelementptr [34 x i8], [34 x i8]*@.str4000, i32 0, i32 0
%.tmp4002 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3998, %m286$.Node.type* %.tmp3999, i8* %.tmp4001)
%.tmp4003 = load i8*, i8** %expr_type
%.tmp4004 = call i32(i8*,...) @printf(i8* %.tmp4002, i8* %.tmp4003)
br label %.if.end.3995
.if.end.3995:
br label %.if.end.3987
.if.end.3987:
br label %.if.end.3916
.if.end.3916:
br label %.if.end.3907
.if.end.3907:
br label %.if.end.3896
.if.end.3896:
br label %.if.end.3890
.if.end.3890:
br label %.if.end.3843
.if.end.3843:
ret void
}
define void @m1830$compile_for_loop.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4005 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4006 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4005)
%for_id = alloca i32
store i32 %.tmp4006, i32* %for_id
%.tmp4007 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4008 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4007, i32 0, i32 6
%.tmp4009 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4008
%.tmp4010 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4009, i32 0, i32 7
%.tmp4011 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4010
%init_stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4011, %m286$.Node.type** %init_stmt
%.tmp4012 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4013 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4012, i32 0, i32 0
%.tmp4014 = load i8*, i8** %.tmp4013
%.tmp4016 = getelementptr [12 x i8], [12 x i8]*@.str4015, i32 0, i32 0
%.tmp4017 = call i32(i8*,i8*) @strcmp(i8* %.tmp4014, i8* %.tmp4016)
%.tmp4018 = icmp eq i32 %.tmp4017, 0
br i1 %.tmp4018, label %.if.true.4019, label %.if.false.4019
.if.true.4019:
%.tmp4020 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4021 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4022 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_declaration.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4020, %m286$.Node.type* %.tmp4021)
br label %.if.end.4019
.if.false.4019:
%.tmp4023 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4023, i32 0, i32 0
%.tmp4025 = load i8*, i8** %.tmp4024
%.tmp4027 = getelementptr [11 x i8], [11 x i8]*@.str4026, i32 0, i32 0
%.tmp4028 = call i32(i8*,i8*) @strcmp(i8* %.tmp4025, i8* %.tmp4027)
%.tmp4029 = icmp eq i32 %.tmp4028, 0
br i1 %.tmp4029, label %.if.true.4030, label %.if.false.4030
.if.true.4030:
%.tmp4031 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4032 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4031, %m286$.Node.type* %.tmp4032)
br label %.if.end.4030
.if.false.4030:
%.tmp4033 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4034 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4033, i32 0, i32 0
%.tmp4035 = load i8*, i8** %.tmp4034
%.tmp4037 = getelementptr [9 x i8], [9 x i8]*@.str4036, i32 0, i32 0
%.tmp4038 = call i32(i8*,i8*) @strcmp(i8* %.tmp4035, i8* %.tmp4037)
%.tmp4039 = icmp eq i32 %.tmp4038, 0
br i1 %.tmp4039, label %.if.true.4040, label %.if.false.4040
.if.true.4040:
br label %.if.end.4040
.if.false.4040:
%.tmp4041 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4042 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4044 = getelementptr [66 x i8], [66 x i8]*@.str4043, i32 0, i32 0
%.tmp4045 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4041, %m286$.Node.type* %.tmp4042, i8* %.tmp4044)
%.tmp4046 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4047 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4046, i32 0, i32 0
%.tmp4048 = load i8*, i8** %.tmp4047
%.tmp4049 = call i32(i8*,...) @printf(i8* %.tmp4045, i8* %.tmp4048)
ret void
br label %.if.end.4040
.if.end.4040:
br label %.if.end.4030
.if.end.4030:
br label %.if.end.4019
.if.end.4019:
%.tmp4050 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4051 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4050, i32 0, i32 1
%.tmp4052 = load %m0$.File.type*, %m0$.File.type** %.tmp4051
%.tmp4054 = getelementptr [26 x i8], [26 x i8]*@.str4053, i32 0, i32 0
%.tmp4055 = load i32, i32* %for_id
%.tmp4056 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4052, i8* %.tmp4054, i32 %.tmp4055)
%.tmp4057 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4058 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4057, i32 0, i32 1
%.tmp4059 = load %m0$.File.type*, %m0$.File.type** %.tmp4058
%.tmp4061 = getelementptr [16 x i8], [16 x i8]*@.str4060, i32 0, i32 0
%.tmp4062 = load i32, i32* %for_id
%.tmp4063 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4059, i8* %.tmp4061, i32 %.tmp4062)
%.tmp4064 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4065 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4064, i32 0, i32 6
%.tmp4066 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4065
%.tmp4068 = getelementptr [9 x i8], [9 x i8]*@.str4067, i32 0, i32 0
%.tmp4069 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4066, i8* %.tmp4068)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4069, %m286$.Node.type** %fst_colon
%.tmp4070 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4071 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4070, i32 0, i32 7
%.tmp4072 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4071
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4072, %m286$.Node.type** %condition
%.tmp4073 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4074 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4075 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4073, %m286$.Node.type* %.tmp4074)
%condition_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4075, %m1830$.AssignableInfo.type** %condition_info
%.tmp4076 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4077 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4076, i32 0, i32 1
%.tmp4078 = load %m0$.File.type*, %m0$.File.type** %.tmp4077
%.tmp4080 = getelementptr [57 x i8], [57 x i8]*@.str4079, i32 0, i32 0
%.tmp4081 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4082 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %condition_info
%.tmp4083 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4082, i32 0, i32 3
%.tmp4084 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4083
%.tmp4085 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4081, %m1830$.Type.type* %.tmp4084)
%.tmp4086 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %condition_info
%.tmp4087 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4086)
%.tmp4088 = load i32, i32* %for_id
%.tmp4089 = load i32, i32* %for_id
%.tmp4090 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4078, i8* %.tmp4080, i8* %.tmp4085, i8* %.tmp4087, i32 %.tmp4088, i32 %.tmp4089)
%.tmp4091 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4092 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4091, i32 0, i32 1
%.tmp4093 = load %m0$.File.type*, %m0$.File.type** %.tmp4092
%.tmp4095 = getelementptr [19 x i8], [19 x i8]*@.str4094, i32 0, i32 0
%.tmp4096 = load i32, i32* %for_id
%.tmp4097 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4093, i8* %.tmp4095, i32 %.tmp4096)
%.tmp4098 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4099 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4098, i32 0, i32 7
%.tmp4100 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4099
%.tmp4102 = getelementptr [9 x i8], [9 x i8]*@.str4101, i32 0, i32 0
%.tmp4103 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4100, i8* %.tmp4102)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4103, %m286$.Node.type** %snd_colon
%.tmp4104 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4105 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4104, i32 0, i32 7
%.tmp4106 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4105
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4106, %m286$.Node.type** %increment
%.tmp4107 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4109 = getelementptr [6 x i8], [6 x i8]*@.str4108, i32 0, i32 0
%.tmp4110 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4107, i8* %.tmp4109)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4110, %m286$.Node.type** %for_body
%.tmp4111 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4112 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4111, %m286$.Node.type* %.tmp4112)
%.tmp4113 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4114 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4115 = icmp ne %m286$.Node.type* %.tmp4113, %.tmp4114
br i1 %.tmp4115, label %.if.true.4116, label %.if.false.4116
.if.true.4116:
%.tmp4117 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4118 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4117, %m286$.Node.type* %.tmp4118)
br label %.if.end.4116
.if.false.4116:
br label %.if.end.4116
.if.end.4116:
%.tmp4119 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4120 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4119, i32 0, i32 1
%.tmp4121 = load %m0$.File.type*, %m0$.File.type** %.tmp4120
%.tmp4123 = getelementptr [26 x i8], [26 x i8]*@.str4122, i32 0, i32 0
%.tmp4124 = load i32, i32* %for_id
%.tmp4125 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4121, i8* %.tmp4123, i32 %.tmp4124)
%.tmp4126 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4127 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4126, i32 0, i32 1
%.tmp4128 = load %m0$.File.type*, %m0$.File.type** %.tmp4127
%.tmp4130 = getelementptr [14 x i8], [14 x i8]*@.str4129, i32 0, i32 0
%.tmp4131 = load i32, i32* %for_id
%.tmp4132 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4128, i8* %.tmp4130, i32 %.tmp4131)
ret void
}
define %m1830$.AssignableInfo.type* @m1830$compile_declaration.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4133 = bitcast ptr null to %m1830$.Type.type*
%decl_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4133, %m1830$.Type.type** %decl_type
%.tmp4134 = bitcast ptr null to %m1830$.AssignableInfo.type*
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4134, %m1830$.AssignableInfo.type** %a_info
%.tmp4135 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4136 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4135, i32 0, i32 6
%.tmp4137 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4136
%.tmp4138 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4137, i32 0, i32 0
%.tmp4139 = load i8*, i8** %.tmp4138
%.tmp4141 = getelementptr [5 x i8], [5 x i8]*@.str4140, i32 0, i32 0
%.tmp4142 = call i32(i8*,i8*) @strcmp(i8* %.tmp4139, i8* %.tmp4141)
%.tmp4143 = icmp eq i32 %.tmp4142, 0
br i1 %.tmp4143, label %.if.true.4144, label %.if.false.4144
.if.true.4144:
%.tmp4145 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4146 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4147 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4146, i32 0, i32 6
%.tmp4148 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4147
%.tmp4149 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4148, i32 0, i32 6
%.tmp4150 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4149
%.tmp4151 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4145, %m286$.Node.type* %.tmp4150)
store %m1830$.Type.type* %.tmp4151, %m1830$.Type.type** %decl_type
br label %.if.end.4144
.if.false.4144:
br label %.if.end.4144
.if.end.4144:
%.tmp4152 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4153 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4152, i32 0, i32 6
%.tmp4154 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4153
%.tmp4156 = getelementptr [11 x i8], [11 x i8]*@.str4155, i32 0, i32 0
%.tmp4157 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4154, i8* %.tmp4156)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4157, %m286$.Node.type** %assignable
%.tmp4158 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4159 = icmp ne %m286$.Node.type* %.tmp4158, null
br i1 %.tmp4159, label %.if.true.4160, label %.if.false.4160
.if.true.4160:
%.tmp4161 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4162 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4163 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4161, %m286$.Node.type* %.tmp4162)
store %m1830$.AssignableInfo.type* %.tmp4163, %m1830$.AssignableInfo.type** %a_info
br label %.if.end.4160
.if.false.4160:
br label %.if.end.4160
.if.end.4160:
%.tmp4164 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4165 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4164)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4165, %m1830$.AssignableInfo.type** %info
%.tmp4166 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4167 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4166, i32 0, i32 2
%.tmp4169 = getelementptr [9 x i8], [9 x i8]*@.str4168, i32 0, i32 0
store i8* %.tmp4169, i8** %.tmp4167
%.tmp4170 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4171 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4170, i32 0, i32 6
%.tmp4172 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4171
%.tmp4174 = getelementptr [5 x i8], [5 x i8]*@.str4173, i32 0, i32 0
%.tmp4175 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4172, i8* %.tmp4174)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4175, %m286$.Node.type** %var_name
%.tmp4176 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4177 = icmp eq %m286$.Node.type* %.tmp4176, null
br i1 %.tmp4177, label %.if.true.4178, label %.if.false.4178
.if.true.4178:
%.tmp4179 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4180 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4182 = getelementptr [31 x i8], [31 x i8]*@.str4181, i32 0, i32 0
%.tmp4183 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4179, %m286$.Node.type* %.tmp4180, i8* %.tmp4182)
%.tmp4184 = call i32(i8*,...) @printf(i8* %.tmp4183)
%.tmp4185 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4185
br label %.if.end.4178
.if.false.4178:
br label %.if.end.4178
.if.end.4178:
%.tmp4186 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4187 = load i8, i8* @SCOPE_LOCAL
%.tmp4188 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4189 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4188, i32 0, i32 1
%.tmp4190 = load i8*, i8** %.tmp4189
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp4186, i8 %.tmp4187, i8* %.tmp4190)
%.tmp4191 = load %m1830$.Type.type*, %m1830$.Type.type** %decl_type
%.tmp4192 = icmp ne %m1830$.Type.type* %.tmp4191, null
br i1 %.tmp4192, label %.if.true.4193, label %.if.false.4193
.if.true.4193:
%.tmp4194 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4195 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4194, i32 0, i32 3
%.tmp4196 = load %m1830$.Type.type*, %m1830$.Type.type** %decl_type
store %m1830$.Type.type* %.tmp4196, %m1830$.Type.type** %.tmp4195
br label %.if.end.4193
.if.false.4193:
%.tmp4197 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4198 = icmp ne %m1830$.AssignableInfo.type* %.tmp4197, null
br i1 %.tmp4198, label %.if.true.4199, label %.if.false.4199
.if.true.4199:
%.tmp4200 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4201 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4200, i32 0, i32 3
%.tmp4202 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4203 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4202, i32 0, i32 3
%.tmp4204 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4203
store %m1830$.Type.type* %.tmp4204, %m1830$.Type.type** %.tmp4201
br label %.if.end.4199
.if.false.4199:
br label %.if.end.4199
.if.end.4199:
br label %.if.end.4193
.if.end.4193:
%.tmp4205 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4206 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4207 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4206, i32 0, i32 3
%.tmp4208 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4207
%.tmp4209 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4205, %m1830$.Type.type* %.tmp4208)
%var_type_repr = alloca i8*
store i8* %.tmp4209, i8** %var_type_repr
%.tmp4210 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4211 = icmp ne %m1830$.AssignableInfo.type* %.tmp4210, null
br i1 %.tmp4211, label %.if.true.4212, label %.if.false.4212
.if.true.4212:
%.tmp4213 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4214 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4215 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4214, i32 0, i32 3
%.tmp4216 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4215
%.tmp4217 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4213, %m1830$.Type.type* %.tmp4216)
%a_type_repr = alloca i8*
store i8* %.tmp4217, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4218 = load i8*, i8** %a_type_repr
%.tmp4219 = call i32(i8*) @strlen(i8* %.tmp4218)
%.tmp4220 = load i8*, i8** %var_type_repr
%.tmp4221 = call i32(i8*) @strlen(i8* %.tmp4220)
%.tmp4222 = icmp ne i32 %.tmp4219, %.tmp4221
br i1 %.tmp4222, label %.if.true.4223, label %.if.false.4223
.if.true.4223:
store i1 1, i1* %type_error
br label %.if.end.4223
.if.false.4223:
%.tmp4224 = load i8*, i8** %a_type_repr
%.tmp4225 = load i8*, i8** %var_type_repr
%.tmp4226 = call i32(i8*,i8*) @strcmp(i8* %.tmp4224, i8* %.tmp4225)
%.tmp4227 = icmp ne i32 %.tmp4226, 0
br i1 %.tmp4227, label %.if.true.4228, label %.if.false.4228
.if.true.4228:
store i1 1, i1* %type_error
br label %.if.end.4228
.if.false.4228:
br label %.if.end.4228
.if.end.4228:
br label %.if.end.4223
.if.end.4223:
%.tmp4229 = load i1, i1* %type_error
br i1 %.tmp4229, label %.if.true.4230, label %.if.false.4230
.if.true.4230:
%.tmp4231 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4231, i8** %err_msg
%.tmp4232 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4234 = getelementptr [49 x i8], [49 x i8]*@.str4233, i32 0, i32 0
%.tmp4235 = load i8*, i8** %a_type_repr
%.tmp4236 = load i8*, i8** %var_type_repr
%.tmp4237 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4232, i8* %.tmp4234, i8* %.tmp4235, i8* %.tmp4236)
%.tmp4238 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4239 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4240 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4238, %m286$.Node.type* %.tmp4239, i8* %.tmp4240)
br label %.if.end.4230
.if.false.4230:
br label %.if.end.4230
.if.end.4230:
br label %.if.end.4212
.if.false.4212:
br label %.if.end.4212
.if.end.4212:
%.tmp4241 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4242 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4243 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4242, i32 0, i32 1
%.tmp4244 = load i8*, i8** %.tmp4243
%.tmp4245 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4241, i8* %.tmp4244, %m1830$.AssignableInfo.type* %.tmp4245)
%.tmp4246 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4247 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4246, i32 0, i32 1
%.tmp4248 = load %m0$.File.type*, %m0$.File.type** %.tmp4247
%.tmp4250 = getelementptr [16 x i8], [16 x i8]*@.str4249, i32 0, i32 0
%.tmp4251 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4252 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4251)
%.tmp4253 = load i8*, i8** %var_type_repr
%.tmp4254 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4248, i8* %.tmp4250, i8* %.tmp4252, i8* %.tmp4253)
%.tmp4255 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4256 = icmp ne %m1830$.AssignableInfo.type* %.tmp4255, null
br i1 %.tmp4256, label %.if.true.4257, label %.if.false.4257
.if.true.4257:
%.tmp4258 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4259 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4258, i32 0, i32 1
%.tmp4260 = load %m0$.File.type*, %m0$.File.type** %.tmp4259
%.tmp4262 = getelementptr [21 x i8], [21 x i8]*@.str4261, i32 0, i32 0
%.tmp4263 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4264 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4265 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4264, i32 0, i32 3
%.tmp4266 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4265
%.tmp4267 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4263, %m1830$.Type.type* %.tmp4266)
%.tmp4268 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4269 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4268)
%.tmp4270 = load i8*, i8** %var_type_repr
%.tmp4271 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4272 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4271)
%.tmp4273 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4260, i8* %.tmp4262, i8* %.tmp4267, i8* %.tmp4269, i8* %.tmp4270, i8* %.tmp4272)
br label %.if.end.4257
.if.false.4257:
br label %.if.end.4257
.if.end.4257:
%.tmp4274 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp4274
}
define void @m1830$compile_if_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4275 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4276 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4275, i32 0, i32 6
%.tmp4277 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4276
%.tmp4279 = getelementptr [11 x i8], [11 x i8]*@.str4278, i32 0, i32 0
%.tmp4280 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4277, i8* %.tmp4279)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4280, %m286$.Node.type** %assignable
%.tmp4281 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4282 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4283 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4281, %m286$.Node.type* %.tmp4282)
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4283, %m1830$.AssignableInfo.type** %a_info
%.tmp4284 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4285 = icmp eq %m1830$.AssignableInfo.type* %.tmp4284, null
br i1 %.tmp4285, label %.if.true.4286, label %.if.false.4286
.if.true.4286:
ret void
br label %.if.end.4286
.if.false.4286:
br label %.if.end.4286
.if.end.4286:
%.tmp4287 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4288 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4287)
%if_id = alloca i32
store i32 %.tmp4288, i32* %if_id
%.tmp4289 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4290 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4289, i32 0, i32 1
%.tmp4291 = load %m0$.File.type*, %m0$.File.type** %.tmp4290
%.tmp4293 = getelementptr [53 x i8], [53 x i8]*@.str4292, i32 0, i32 0
%.tmp4294 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4295 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4296 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4295, i32 0, i32 3
%.tmp4297 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4296
%.tmp4298 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4294, %m1830$.Type.type* %.tmp4297)
%.tmp4299 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4300 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4299)
%.tmp4301 = load i32, i32* %if_id
%.tmp4302 = load i32, i32* %if_id
%.tmp4303 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4291, i8* %.tmp4293, i8* %.tmp4298, i8* %.tmp4300, i32 %.tmp4301, i32 %.tmp4302)
%.tmp4304 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4305 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4304, i32 0, i32 1
%.tmp4306 = load %m0$.File.type*, %m0$.File.type** %.tmp4305
%.tmp4308 = getelementptr [14 x i8], [14 x i8]*@.str4307, i32 0, i32 0
%.tmp4309 = load i32, i32* %if_id
%.tmp4310 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4306, i8* %.tmp4308, i32 %.tmp4309)
%.tmp4311 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4312 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4311, i32 0, i32 6
%.tmp4313 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4312
%.tmp4315 = getelementptr [6 x i8], [6 x i8]*@.str4314, i32 0, i32 0
%.tmp4316 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4313, i8* %.tmp4315)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4316, %m286$.Node.type** %block
%.tmp4317 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4318 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4317, %m286$.Node.type* %.tmp4318)
%.tmp4319 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4320 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4319, i32 0, i32 1
%.tmp4321 = load %m0$.File.type*, %m0$.File.type** %.tmp4320
%.tmp4323 = getelementptr [23 x i8], [23 x i8]*@.str4322, i32 0, i32 0
%.tmp4324 = load i32, i32* %if_id
%.tmp4325 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4321, i8* %.tmp4323, i32 %.tmp4324)
%.tmp4326 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4327 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4326, i32 0, i32 1
%.tmp4328 = load %m0$.File.type*, %m0$.File.type** %.tmp4327
%.tmp4330 = getelementptr [15 x i8], [15 x i8]*@.str4329, i32 0, i32 0
%.tmp4331 = load i32, i32* %if_id
%.tmp4332 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4328, i8* %.tmp4330, i32 %.tmp4331)
%.tmp4333 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4334 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4333, i32 0, i32 6
%.tmp4335 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4334
%.tmp4337 = getelementptr [11 x i8], [11 x i8]*@.str4336, i32 0, i32 0
%.tmp4338 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4335, i8* %.tmp4337)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4338, %m286$.Node.type** %else_block
%.tmp4339 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4340 = icmp ne %m286$.Node.type* %.tmp4339, null
br i1 %.tmp4340, label %.if.true.4341, label %.if.false.4341
.if.true.4341:
%.tmp4342 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4343 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4342, i32 0, i32 6
%.tmp4344 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4343
%.tmp4345 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4344, i32 0, i32 0
%.tmp4346 = load i8*, i8** %.tmp4345
%.tmp4348 = getelementptr [11 x i8], [11 x i8]*@.str4347, i32 0, i32 0
%.tmp4349 = call i32(i8*,i8*) @strcmp(i8* %.tmp4346, i8* %.tmp4348)
%.tmp4350 = icmp eq i32 %.tmp4349, 0
br i1 %.tmp4350, label %.if.true.4351, label %.if.false.4351
.if.true.4351:
%.tmp4352 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4353 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4352, i32 0, i32 6
%.tmp4354 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4353
%.tmp4355 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4354, i32 0, i32 6
%.tmp4356 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4355
%.tmp4358 = getelementptr [6 x i8], [6 x i8]*@.str4357, i32 0, i32 0
%.tmp4359 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4356, i8* %.tmp4358)
store %m286$.Node.type* %.tmp4359, %m286$.Node.type** %block
%.tmp4360 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4361 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4360, %m286$.Node.type* %.tmp4361)
br label %.if.end.4351
.if.false.4351:
%.tmp4362 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4363 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_if_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4362, %m286$.Node.type* %.tmp4363)
br label %.if.end.4351
.if.end.4351:
br label %.if.end.4341
.if.false.4341:
br label %.if.end.4341
.if.end.4341:
%.tmp4364 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4365 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4364, i32 0, i32 1
%.tmp4366 = load %m0$.File.type*, %m0$.File.type** %.tmp4365
%.tmp4368 = getelementptr [23 x i8], [23 x i8]*@.str4367, i32 0, i32 0
%.tmp4369 = load i32, i32* %if_id
%.tmp4370 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4366, i8* %.tmp4368, i32 %.tmp4369)
%.tmp4371 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4372 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4371, i32 0, i32 1
%.tmp4373 = load %m0$.File.type*, %m0$.File.type** %.tmp4372
%.tmp4375 = getelementptr [13 x i8], [13 x i8]*@.str4374, i32 0, i32 0
%.tmp4376 = load i32, i32* %if_id
%.tmp4377 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4373, i8* %.tmp4375, i32 %.tmp4376)
ret void
}
define void @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4378 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4379 = icmp ne %m286$.Node.type* %.tmp4378, null
br i1 %.tmp4379, label %.if.true.4380, label %.if.false.4380
.if.true.4380:
%.tmp4381 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4382 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4381, i32 0, i32 6
%.tmp4383 = load i8*, i8** %.tmp4382
%.tmp4384 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4385 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4384, i32 0, i32 3
%.tmp4386 = load i32, i32* %.tmp4385
%.tmp4387 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4388 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4387, i32 0, i32 4
%.tmp4389 = load i32, i32* %.tmp4388
%.tmp4390 = load i8*, i8** %msg
%.tmp4391 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp4383, i32 %.tmp4386, i32 %.tmp4389, i8* %.tmp4390)
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp4391, %m717$.Error.type** %err
%.tmp4392 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4393 = load %m717$.Error.type*, %m717$.Error.type** %err
call void(%m1830$.CompilerCtx.type*,%m717$.Error.type*) @m1830$append_error.v.m1830$.CompilerCtx.typep.m717$.Error.typep(%m1830$.CompilerCtx.type* %.tmp4392, %m717$.Error.type* %.tmp4393)
br label %.if.end.4380
.if.false.4380:
%.tmp4395 = getelementptr [61 x i8], [61 x i8]*@.str4394, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4395)
br label %.if.end.4380
.if.end.4380:
ret void
}
define void @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1830$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%.tmp4396 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4397 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4396)
%mod = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp4397, %m1830$.ModuleLookup.type** %mod
%.tmp4398 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4399 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4398, i32 0, i32 3
%.tmp4400 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4399
%.tmp4401 = icmp ne %m1830$.Scope.type* %.tmp4400, null
%.tmp4403 = getelementptr [82 x i8], [82 x i8]*@.str4402, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4401, i8* %.tmp4403)
%.tmp4404 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4405 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4404, i32 0, i32 3
%.tmp4406 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4405
%current_scope = alloca %m1830$.Scope.type*
store %m1830$.Scope.type* %.tmp4406, %m1830$.Scope.type** %current_scope
%.tmp4407 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* null, i32 1
%.tmp4408 = ptrtoint %m1830$.ScopeItem.type* %.tmp4407 to i32
%.tmp4409 = call i8*(i32) @malloc(i32 %.tmp4408)
%.tmp4410 = bitcast i8* %.tmp4409 to %m1830$.ScopeItem.type*
%newitem = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4410, %m1830$.ScopeItem.type** %newitem
%.tmp4411 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
%.tmp4412 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4411, i32 0, i32 0
%.tmp4413 = load i8*, i8** %name
store i8* %.tmp4413, i8** %.tmp4412
%.tmp4414 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
%.tmp4415 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4414, i32 0, i32 1
%.tmp4416 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
store %m1830$.AssignableInfo.type* %.tmp4416, %m1830$.AssignableInfo.type** %.tmp4415
%.tmp4417 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
%.tmp4418 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4417, i32 0, i32 2
store %m1830$.ScopeItem.type* null, %m1830$.ScopeItem.type** %.tmp4418
%.tmp4419 = load %m1830$.Scope.type*, %m1830$.Scope.type** %current_scope
%.tmp4420 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4419, i32 0, i32 1
%.tmp4421 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4420
%.tmp4422 = icmp eq %m1830$.ScopeItem.type* %.tmp4421, null
br i1 %.tmp4422, label %.if.true.4423, label %.if.false.4423
.if.true.4423:
%.tmp4424 = load %m1830$.Scope.type*, %m1830$.Scope.type** %current_scope
%.tmp4425 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4424, i32 0, i32 1
%.tmp4426 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
store %m1830$.ScopeItem.type* %.tmp4426, %m1830$.ScopeItem.type** %.tmp4425
ret void
br label %.if.end.4423
.if.false.4423:
br label %.if.end.4423
.if.end.4423:
%.tmp4427 = load %m1830$.Scope.type*, %m1830$.Scope.type** %current_scope
%.tmp4428 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4427, i32 0, i32 1
%.tmp4429 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4428
%last_item = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4429, %m1830$.ScopeItem.type** %last_item
br label %.for.start.4430
.for.start.4430:
%.tmp4431 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %last_item
%.tmp4432 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4431, i32 0, i32 2
%.tmp4433 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4432
%.tmp4434 = icmp ne %m1830$.ScopeItem.type* %.tmp4433, null
br i1 %.tmp4434, label %.for.continue.4430, label %.for.end.4430
.for.continue.4430:
%.tmp4435 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %last_item
%.tmp4436 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4435, i32 0, i32 2
%.tmp4437 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4436
store %m1830$.ScopeItem.type* %.tmp4437, %m1830$.ScopeItem.type** %last_item
br label %.for.start.4430
.for.end.4430:
%.tmp4438 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %last_item
%.tmp4439 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4438, i32 0, i32 2
%.tmp4440 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
store %m1830$.ScopeItem.type* %.tmp4440, %m1830$.ScopeItem.type** %.tmp4439
ret void
}
define %m1830$.ScopeItem.type* @m1830$find_defined_in.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%err_buf = alloca i8*
%.tmp4441 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4442 = load i8*, i8** %module
%.tmp4443 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4444 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4443, i32 0, i32 1
%.tmp4445 = load i8*, i8** %.tmp4444
%.tmp4446 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp4441, i8* %.tmp4442, i8* %.tmp4445)
%found = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4446, %m1830$.ScopeItem.type** %found
%.tmp4447 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4448 = icmp eq %m1830$.ScopeItem.type* %.tmp4447, null
br i1 %.tmp4448, label %.if.true.4449, label %.if.false.4449
.if.true.4449:
%.tmp4450 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4452 = getelementptr [31 x i8], [31 x i8]*@.str4451, i32 0, i32 0
%.tmp4453 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4454 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4453, i32 0, i32 1
%.tmp4455 = load i8*, i8** %.tmp4454
%.tmp4456 = load i8*, i8** %module
%.tmp4457 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4450, i8* %.tmp4452, i8* %.tmp4455, i8* %.tmp4456)
%.tmp4458 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4459 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4460 = load i8*, i8** %err_buf
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4458, %m286$.Node.type* %.tmp4459, i8* %.tmp4460)
%.tmp4461 = bitcast ptr null to %m1830$.ScopeItem.type*
ret %m1830$.ScopeItem.type* %.tmp4461
br label %.if.end.4449
.if.false.4449:
br label %.if.end.4449
.if.end.4449:
br label %.for.start.4462
.for.start.4462:
%.tmp4463 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4464 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4463, i32 0, i32 7
%.tmp4465 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4464
%.tmp4466 = icmp ne %m286$.Node.type* %.tmp4465, null
%.tmp4467 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4468 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4467, i32 0, i32 1
%.tmp4469 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4468
%.tmp4470 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4469, i32 0, i32 2
%.tmp4471 = load i8*, i8** %.tmp4470
%.tmp4473 = getelementptr [7 x i8], [7 x i8]*@.str4472, i32 0, i32 0
%.tmp4474 = call i32(i8*,i8*) @strcmp(i8* %.tmp4471, i8* %.tmp4473)
%.tmp4475 = icmp eq i32 %.tmp4474, 0
%.tmp4476 = and i1 %.tmp4466, %.tmp4475
br i1 %.tmp4476, label %.for.continue.4462, label %.for.end.4462
.for.continue.4462:
%.tmp4477 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4478 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4479 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4478, i32 0, i32 1
%.tmp4480 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4479
%.tmp4481 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4480, i32 0, i32 0
%.tmp4482 = load i8*, i8** %.tmp4481
%.tmp4483 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4484 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4483, i32 0, i32 7
%.tmp4485 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4484
%.tmp4486 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4485, i32 0, i32 7
%.tmp4487 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4486
%.tmp4488 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1830$find_defined_in.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4477, i8* %.tmp4482, %m286$.Node.type* %.tmp4487)
store %m1830$.ScopeItem.type* %.tmp4488, %m1830$.ScopeItem.type** %found
%.tmp4489 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4490 = icmp eq %m1830$.ScopeItem.type* %.tmp4489, null
br i1 %.tmp4490, label %.if.true.4491, label %.if.false.4491
.if.true.4491:
%.tmp4492 = bitcast ptr null to %m1830$.ScopeItem.type*
ret %m1830$.ScopeItem.type* %.tmp4492
br label %.if.end.4491
.if.false.4491:
br label %.if.end.4491
.if.end.4491:
br label %.for.start.4462
.for.end.4462:
%.tmp4493 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
ret %m1830$.ScopeItem.type* %.tmp4493
}
define %m1830$.ScopeItem.type* @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4494 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4495 = load i8*, i8** %module
%.tmp4496 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*,i8*) @m1830$get_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp4494, i8* %.tmp4495)
%mod = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp4496, %m1830$.ModuleLookup.type** %mod
%.tmp4497 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4498 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4497, i32 0, i32 3
%.tmp4499 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4498
%.tmp4500 = icmp ne %m1830$.Scope.type* %.tmp4499, null
%.tmp4502 = getelementptr [77 x i8], [77 x i8]*@.str4501, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4500, i8* %.tmp4502)
%.tmp4504 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4505 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4504, i32 0, i32 3
%.tmp4506 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4505
%s = alloca %m1830$.Scope.type*
store %m1830$.Scope.type* %.tmp4506, %m1830$.Scope.type** %s
br label %.for.start.4503
.for.start.4503:
%.tmp4507 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp4508 = icmp ne %m1830$.Scope.type* %.tmp4507, null
br i1 %.tmp4508, label %.for.continue.4503, label %.for.end.4503
.for.continue.4503:
%.tmp4510 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp4511 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4510, i32 0, i32 1
%.tmp4512 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4511
%item = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4512, %m1830$.ScopeItem.type** %item
br label %.for.start.4509
.for.start.4509:
%.tmp4513 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
%.tmp4514 = icmp ne %m1830$.ScopeItem.type* %.tmp4513, null
br i1 %.tmp4514, label %.for.continue.4509, label %.for.end.4509
.for.continue.4509:
%.tmp4515 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
%.tmp4516 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4515, i32 0, i32 0
%.tmp4517 = load i8*, i8** %.tmp4516
%.tmp4518 = load i8*, i8** %assignable_name
%.tmp4519 = call i32(i8*,i8*) @strcmp(i8* %.tmp4517, i8* %.tmp4518)
%.tmp4520 = icmp eq i32 %.tmp4519, 0
br i1 %.tmp4520, label %.if.true.4521, label %.if.false.4521
.if.true.4521:
%.tmp4522 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
ret %m1830$.ScopeItem.type* %.tmp4522
br label %.if.end.4521
.if.false.4521:
br label %.if.end.4521
.if.end.4521:
%.tmp4523 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
%.tmp4524 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4523, i32 0, i32 2
%.tmp4525 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4524
store %m1830$.ScopeItem.type* %.tmp4525, %m1830$.ScopeItem.type** %item
br label %.for.start.4509
.for.end.4509:
%.tmp4526 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp4527 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4526, i32 0, i32 2
%.tmp4528 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4527
store %m1830$.Scope.type* %.tmp4528, %m1830$.Scope.type** %s
br label %.for.start.4503
.for.end.4503:
%.tmp4529 = bitcast ptr null to %m1830$.ScopeItem.type*
ret %m1830$.ScopeItem.type* %.tmp4529
}
define %m1830$.ScopeItem.type* @m1830$find_defined.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp4530 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4531 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4532 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4531, i32 0, i32 6
%.tmp4533 = load i8*, i8** %.tmp4532
%.tmp4534 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4535 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4534, i32 0, i32 6
%.tmp4536 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4535
%.tmp4537 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1830$find_defined_in.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4530, i8* %.tmp4533, %m286$.Node.type* %.tmp4536)
ret %m1830$.ScopeItem.type* %.tmp4537
}
define %m1830$.AssignableInfo.type* @m1830$get_dotted_name.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dot_name_ptr.arg, %m1830$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.dot_name_ptr.arg, %m286$.Node.type** %dot_name_ptr
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%err_msg = alloca i8*
%buf = alloca i8*
%.tmp4538 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4539 = icmp eq %m1830$.AssignableInfo.type* %.tmp4538, null
br i1 %.tmp4539, label %.if.true.4540, label %.if.false.4540
.if.true.4540:
%.tmp4541 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4542 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4544 = getelementptr [54 x i8], [54 x i8]*@.str4543, i32 0, i32 0
%.tmp4545 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4541, %m286$.Node.type* %.tmp4542, i8* %.tmp4544)
%.tmp4546 = call i32(i8*,...) @printf(i8* %.tmp4545)
%.tmp4547 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4547
br label %.if.end.4540
.if.false.4540:
br label %.if.end.4540
.if.end.4540:
%.tmp4548 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4549 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4548, i32 0, i32 2
%.tmp4550 = load i8*, i8** %.tmp4549
%.tmp4552 = getelementptr [9 x i8], [9 x i8]*@.str4551, i32 0, i32 0
%.tmp4553 = call i32(i8*,i8*) @strcmp(i8* %.tmp4550, i8* %.tmp4552)
%.tmp4554 = icmp eq i32 %.tmp4553, 0
%.tmp4555 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4556 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4555, i32 0, i32 2
%.tmp4557 = load i8*, i8** %.tmp4556
%.tmp4559 = getelementptr [7 x i8], [7 x i8]*@.str4558, i32 0, i32 0
%.tmp4560 = call i32(i8*,i8*) @strcmp(i8* %.tmp4557, i8* %.tmp4559)
%.tmp4561 = icmp eq i32 %.tmp4560, 0
%.tmp4562 = or i1 %.tmp4554, %.tmp4561
br i1 %.tmp4562, label %.if.true.4563, label %.if.false.4563
.if.true.4563:
%.tmp4564 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4565 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4564, i32 0, i32 7
%.tmp4566 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4565
%.tmp4567 = icmp ne %m286$.Node.type* %.tmp4566, null
br i1 %.tmp4567, label %.if.true.4568, label %.if.false.4568
.if.true.4568:
%.tmp4569 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4571 = getelementptr [46 x i8], [46 x i8]*@.str4570, i32 0, i32 0
%.tmp4572 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4573 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4572, i32 0, i32 7
%.tmp4574 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4573
%.tmp4575 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4574, i32 0, i32 7
%.tmp4576 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4575
%.tmp4577 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4576, i32 0, i32 1
%.tmp4578 = load i8*, i8** %.tmp4577
%.tmp4579 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4580 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4579, i32 0, i32 1
%.tmp4581 = load i8*, i8** %.tmp4580
%.tmp4582 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4569, i8* %.tmp4571, i8* %.tmp4578, i8* %.tmp4581)
%.tmp4583 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4584 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4585 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4583, %m286$.Node.type* %.tmp4584, i8* %.tmp4585)
%.tmp4586 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4586
br label %.if.end.4568
.if.false.4568:
br label %.if.end.4568
.if.end.4568:
%.tmp4587 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp4587
br label %.if.end.4563
.if.false.4563:
%.tmp4588 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4589 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4588, i32 0, i32 2
%.tmp4590 = load i8*, i8** %.tmp4589
%.tmp4592 = getelementptr [9 x i8], [9 x i8]*@.str4591, i32 0, i32 0
%.tmp4593 = call i32(i8*,i8*) @strcmp(i8* %.tmp4590, i8* %.tmp4592)
%.tmp4594 = icmp eq i32 %.tmp4593, 0
%.tmp4595 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4596 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4595, i32 0, i32 7
%.tmp4597 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4596
%.tmp4598 = icmp ne %m286$.Node.type* %.tmp4597, null
%.tmp4599 = and i1 %.tmp4594, %.tmp4598
br i1 %.tmp4599, label %.if.true.4600, label %.if.false.4600
.if.true.4600:
%.tmp4601 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%base_var = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4601, %m1830$.AssignableInfo.type** %base_var
%.tmp4602 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4603 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4602, i32 0, i32 3
%.tmp4604 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4603
%struct_info = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4604, %m1830$.Type.type** %struct_info
br label %.for.start.4605
.for.start.4605:
%.tmp4606 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4607 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4606, i32 0, i32 3
%.tmp4608 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4607
%.tmp4609 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4608, i32 0, i32 0
%.tmp4610 = load i8*, i8** %.tmp4609
%.tmp4612 = getelementptr [4 x i8], [4 x i8]*@.str4611, i32 0, i32 0
%.tmp4613 = call i32(i8*,i8*) @strcmp(i8* %.tmp4610, i8* %.tmp4612)
%.tmp4614 = icmp eq i32 %.tmp4613, 0
br i1 %.tmp4614, label %.for.continue.4605, label %.for.end.4605
.for.continue.4605:
%.tmp4615 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4616 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4615)
%new_base = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4616, %m1830$.AssignableInfo.type** %new_base
%.tmp4617 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4618 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4617, %m1830$.AssignableInfo.type* %.tmp4618)
%.tmp4619 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4620 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4619, i32 0, i32 3
%.tmp4621 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4622 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4621, i32 0, i32 3
%.tmp4623 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4622
%.tmp4624 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4623, i32 0, i32 3
%.tmp4625 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4624
store %m1830$.Type.type* %.tmp4625, %m1830$.Type.type** %.tmp4620
%.tmp4626 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4627 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4626, i32 0, i32 1
%.tmp4628 = load %m0$.File.type*, %m0$.File.type** %.tmp4627
%.tmp4630 = getelementptr [23 x i8], [23 x i8]*@.str4629, i32 0, i32 0
%.tmp4631 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4632 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4631)
%.tmp4633 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4634 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4635 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4634, i32 0, i32 3
%.tmp4636 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4635
%.tmp4637 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4633, %m1830$.Type.type* %.tmp4636)
%.tmp4638 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4639 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4640 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4639, i32 0, i32 3
%.tmp4641 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4640
%.tmp4642 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4638, %m1830$.Type.type* %.tmp4641)
%.tmp4643 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4644 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4643)
%.tmp4645 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4628, i8* %.tmp4630, i8* %.tmp4632, i8* %.tmp4637, i8* %.tmp4642, i8* %.tmp4644)
%.tmp4646 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
store %m1830$.AssignableInfo.type* %.tmp4646, %m1830$.AssignableInfo.type** %base_var
%.tmp4647 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4648 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4647, i32 0, i32 3
%.tmp4649 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4648
store %m1830$.Type.type* %.tmp4649, %m1830$.Type.type** %struct_info
br label %.for.start.4605
.for.end.4605:
%.tmp4650 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4651 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4650, i32 0, i32 0
%.tmp4652 = load i8*, i8** %.tmp4651
%.tmp4654 = getelementptr [10 x i8], [10 x i8]*@.str4653, i32 0, i32 0
%.tmp4655 = call i32(i8*,i8*) @strcmp(i8* %.tmp4652, i8* %.tmp4654)
%.tmp4656 = icmp eq i32 %.tmp4655, 0
br i1 %.tmp4656, label %.if.true.4657, label %.if.false.4657
.if.true.4657:
%.tmp4658 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4659 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4658, i32 0, i32 3
%.tmp4660 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4659
store %m1830$.Type.type* %.tmp4660, %m1830$.Type.type** %struct_info
br label %.if.end.4657
.if.false.4657:
br label %.if.end.4657
.if.end.4657:
%.tmp4661 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4662 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4661, i32 0, i32 0
%.tmp4663 = load i8*, i8** %.tmp4662
%.tmp4665 = getelementptr [7 x i8], [7 x i8]*@.str4664, i32 0, i32 0
%.tmp4666 = call i32(i8*,i8*) @strcmp(i8* %.tmp4663, i8* %.tmp4665)
%.tmp4667 = icmp ne i32 %.tmp4666, 0
br i1 %.tmp4667, label %.if.true.4668, label %.if.false.4668
.if.true.4668:
%.tmp4669 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4671 = getelementptr [48 x i8], [48 x i8]*@.str4670, i32 0, i32 0
%.tmp4672 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4673 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4672, i32 0, i32 7
%.tmp4674 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4673
%.tmp4675 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4674, i32 0, i32 7
%.tmp4676 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4675
%.tmp4677 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4676, i32 0, i32 1
%.tmp4678 = load i8*, i8** %.tmp4677
%.tmp4679 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4680 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4679, i32 0, i32 1
%.tmp4681 = load i8*, i8** %.tmp4680
%.tmp4682 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4669, i8* %.tmp4671, i8* %.tmp4678, i8* %.tmp4681)
%.tmp4683 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4684 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4685 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4683, %m286$.Node.type* %.tmp4684, i8* %.tmp4685)
%.tmp4686 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4686
br label %.if.end.4668
.if.false.4668:
br label %.if.end.4668
.if.end.4668:
%.tmp4687 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4688 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4687, i32 0, i32 7
%.tmp4689 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4688
%.tmp4690 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4689, i32 0, i32 7
%.tmp4691 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4690
%.tmp4692 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4691, i32 0, i32 1
%.tmp4693 = load i8*, i8** %.tmp4692
%field_name = alloca i8*
store i8* %.tmp4693, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp4694 = bitcast ptr null to %m1830$.Type.type*
%found_field = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4694, %m1830$.Type.type** %found_field
%.tmp4696 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4697 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4696, i32 0, i32 3
%.tmp4698 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4697
%field = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4698, %m1830$.Type.type** %field
br label %.for.start.4695
.for.start.4695:
%.tmp4699 = load i1, i1* %quit
%.tmp4700 = icmp eq i1 %.tmp4699, 0
br i1 %.tmp4700, label %.for.continue.4695, label %.for.end.4695
.for.continue.4695:
%.tmp4701 = load %m1830$.Type.type*, %m1830$.Type.type** %field
%.tmp4702 = icmp eq %m1830$.Type.type* %.tmp4701, null
br i1 %.tmp4702, label %.if.true.4703, label %.if.false.4703
.if.true.4703:
store i1 1, i1* %quit
br label %.if.end.4703
.if.false.4703:
%.tmp4704 = load %m1830$.Type.type*, %m1830$.Type.type** %field
%.tmp4705 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4704, i32 0, i32 1
%.tmp4706 = load i8*, i8** %.tmp4705
%.tmp4707 = load i8*, i8** %field_name
%.tmp4708 = call i32(i8*,i8*) @strcmp(i8* %.tmp4706, i8* %.tmp4707)
%.tmp4709 = icmp eq i32 %.tmp4708, 0
br i1 %.tmp4709, label %.if.true.4710, label %.if.false.4710
.if.true.4710:
store i1 1, i1* %quit
%.tmp4711 = load %m1830$.Type.type*, %m1830$.Type.type** %field
store %m1830$.Type.type* %.tmp4711, %m1830$.Type.type** %found_field
br label %.if.end.4710
.if.false.4710:
%.tmp4712 = load i32, i32* %field_id
%.tmp4713 = add i32 %.tmp4712, 1
store i32 %.tmp4713, i32* %field_id
br label %.if.end.4710
.if.end.4710:
br label %.if.end.4703
.if.end.4703:
%.tmp4714 = load %m1830$.Type.type*, %m1830$.Type.type** %field
%.tmp4715 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4714, i32 0, i32 4
%.tmp4716 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4715
store %m1830$.Type.type* %.tmp4716, %m1830$.Type.type** %field
br label %.for.start.4695
.for.end.4695:
%.tmp4717 = load %m1830$.Type.type*, %m1830$.Type.type** %found_field
%.tmp4718 = icmp eq %m1830$.Type.type* %.tmp4717, null
br i1 %.tmp4718, label %.if.true.4719, label %.if.false.4719
.if.true.4719:
%.tmp4720 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4722 = getelementptr [34 x i8], [34 x i8]*@.str4721, i32 0, i32 0
%.tmp4723 = load i8*, i8** %field_name
%.tmp4724 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4725 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4724, i32 0, i32 1
%.tmp4726 = load i8*, i8** %.tmp4725
%.tmp4727 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4720, i8* %.tmp4722, i8* %.tmp4723, i8* %.tmp4726)
%.tmp4728 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4729 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4730 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4728, %m286$.Node.type* %.tmp4729, i8* %.tmp4730)
%.tmp4731 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4731
br label %.if.end.4719
.if.false.4719:
br label %.if.end.4719
.if.end.4719:
%.tmp4732 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4733 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4732)
%new_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4733, %m1830$.AssignableInfo.type** %new_info
%.tmp4734 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4735 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4734, i32 0, i32 3
%.tmp4736 = load %m1830$.Type.type*, %m1830$.Type.type** %found_field
store %m1830$.Type.type* %.tmp4736, %m1830$.Type.type** %.tmp4735
%.tmp4737 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4738 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4737, %m1830$.AssignableInfo.type* %.tmp4738)
%.tmp4739 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4740 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4739, i32 0, i32 2
%.tmp4742 = getelementptr [9 x i8], [9 x i8]*@.str4741, i32 0, i32 0
store i8* %.tmp4742, i8** %.tmp4740
%.tmp4743 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4744 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4745 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4744, i32 0, i32 3
%.tmp4746 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4745
%.tmp4747 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4743, %m1830$.Type.type* %.tmp4746)
%info_tr = alloca i8*
store i8* %.tmp4747, i8** %info_tr
%.tmp4748 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4749 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4748, i32 0, i32 1
%.tmp4750 = load %m0$.File.type*, %m0$.File.type** %.tmp4749
%.tmp4752 = getelementptr [46 x i8], [46 x i8]*@.str4751, i32 0, i32 0
%.tmp4753 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4754 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4753)
%.tmp4755 = load i8*, i8** %info_tr
%.tmp4756 = load i8*, i8** %info_tr
%.tmp4757 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4758 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4757)
%.tmp4759 = load i32, i32* %field_id
%.tmp4760 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4750, i8* %.tmp4752, i8* %.tmp4754, i8* %.tmp4755, i8* %.tmp4756, i8* %.tmp4758, i32 %.tmp4759)
%.tmp4761 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4762 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4763 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4762, i32 0, i32 7
%.tmp4764 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4763
%.tmp4765 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4764, i32 0, i32 7
%.tmp4766 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4765
%.tmp4767 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4768 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,%m1830$.AssignableInfo.type*) @m1830$get_dotted_name.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4761, %m286$.Node.type* %.tmp4766, %m1830$.AssignableInfo.type* %.tmp4767)
ret %m1830$.AssignableInfo.type* %.tmp4768
br label %.if.end.4600
.if.false.4600:
%.tmp4769 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4770 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4769, i32 0, i32 2
%.tmp4771 = load i8*, i8** %.tmp4770
%.tmp4773 = getelementptr [9 x i8], [9 x i8]*@.str4772, i32 0, i32 0
%.tmp4774 = call i32(i8*,i8*) @strcmp(i8* %.tmp4771, i8* %.tmp4773)
%.tmp4775 = icmp eq i32 %.tmp4774, 0
br i1 %.tmp4775, label %.if.true.4776, label %.if.false.4776
.if.true.4776:
%.tmp4777 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp4777
br label %.if.end.4776
.if.false.4776:
br label %.if.end.4776
.if.end.4776:
br label %.if.end.4600
.if.end.4600:
br label %.if.end.4563
.if.end.4563:
%.tmp4778 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4779 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4781 = getelementptr [43 x i8], [43 x i8]*@.str4780, i32 0, i32 0
%.tmp4782 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4778, %m286$.Node.type* %.tmp4779, i8* %.tmp4781)
%.tmp4783 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4784 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4783, i32 0, i32 2
%.tmp4785 = load i8*, i8** %.tmp4784
%.tmp4786 = call i32(i8*,...) @printf(i8* %.tmp4782, i8* %.tmp4785)
%.tmp4787 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4787
}
define %m1830$.AssignableInfo.type* @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp4788 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4788, %m286$.Node.type** %curr_node
%.tmp4789 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4790 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4789, i32 0, i32 0
%.tmp4791 = load i8*, i8** %.tmp4790
%.tmp4793 = getelementptr [12 x i8], [12 x i8]*@.str4792, i32 0, i32 0
%.tmp4794 = call i32(i8*,i8*) @strcmp(i8* %.tmp4791, i8* %.tmp4793)
%.tmp4795 = icmp ne i32 %.tmp4794, 0
br i1 %.tmp4795, label %.if.true.4796, label %.if.false.4796
.if.true.4796:
%.tmp4798 = getelementptr [92 x i8], [92 x i8]*@.str4797, i32 0, i32 0
%.tmp4799 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4800 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4799, i32 0, i32 0
%.tmp4801 = load i8*, i8** %.tmp4800
%.tmp4802 = call i32(i8*,...) @printf(i8* %.tmp4798, i8* %.tmp4801)
%.tmp4803 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4804 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4803, i32 0, i32 6
%.tmp4805 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4804
store %m286$.Node.type* %.tmp4805, %m286$.Node.type** %curr_node
br label %.if.end.4796
.if.false.4796:
br label %.if.end.4796
.if.end.4796:
%.tmp4806 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4807 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4806, i32 0, i32 6
%.tmp4808 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4807
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4808, %m286$.Node.type** %assignable_name
%.tmp4809 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4810 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4811 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4810, i32 0, i32 6
%.tmp4812 = load i8*, i8** %.tmp4811
%.tmp4813 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4814 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4813, i32 0, i32 6
%.tmp4815 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4814
%.tmp4816 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4815, i32 0, i32 1
%.tmp4817 = load i8*, i8** %.tmp4816
%.tmp4818 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp4809, i8* %.tmp4812, i8* %.tmp4817)
%scope_info = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4818, %m1830$.ScopeItem.type** %scope_info
%.tmp4819 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4820 = icmp eq %m1830$.ScopeItem.type* %.tmp4819, null
br i1 %.tmp4820, label %.if.true.4821, label %.if.false.4821
.if.true.4821:
%.tmp4822 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4824 = getelementptr [25 x i8], [25 x i8]*@.str4823, i32 0, i32 0
%.tmp4825 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4826 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4825, i32 0, i32 6
%.tmp4827 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4826
%.tmp4828 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4827, i32 0, i32 1
%.tmp4829 = load i8*, i8** %.tmp4828
%.tmp4830 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4822, i8* %.tmp4824, i8* %.tmp4829)
%.tmp4831 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4832 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4833 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4831, %m286$.Node.type* %.tmp4832, i8* %.tmp4833)
%.tmp4834 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4834
br label %.if.end.4821
.if.false.4821:
br label %.if.end.4821
.if.end.4821:
%.tmp4835 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4836 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4835, i32 0, i32 1
%.tmp4837 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4836
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4837, %m1830$.AssignableInfo.type** %info
%.tmp4838 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4839 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4838, i32 0, i32 2
%.tmp4840 = load i8*, i8** %.tmp4839
%.tmp4842 = getelementptr [7 x i8], [7 x i8]*@.str4841, i32 0, i32 0
%.tmp4843 = call i32(i8*,i8*) @strcmp(i8* %.tmp4840, i8* %.tmp4842)
%.tmp4844 = icmp eq i32 %.tmp4843, 0
br i1 %.tmp4844, label %.if.true.4845, label %.if.false.4845
.if.true.4845:
%.tmp4846 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4847 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4848 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4847)
%.tmp4849 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4850 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4849, i32 0, i32 6
%.tmp4851 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4850
%.tmp4852 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4851, i32 0, i32 7
%.tmp4853 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4852
%.tmp4854 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4853, i32 0, i32 7
%.tmp4855 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4854
%.tmp4856 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4855, i32 0, i32 1
%.tmp4857 = load i8*, i8** %.tmp4856
%.tmp4858 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp4846, i8* %.tmp4848, i8* %.tmp4857)
store %m1830$.ScopeItem.type* %.tmp4858, %m1830$.ScopeItem.type** %scope_info
%.tmp4859 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4860 = icmp eq %m1830$.ScopeItem.type* %.tmp4859, null
br i1 %.tmp4860, label %.if.true.4861, label %.if.false.4861
.if.true.4861:
%.tmp4862 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4864 = getelementptr [31 x i8], [31 x i8]*@.str4863, i32 0, i32 0
%.tmp4865 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4866 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4865, i32 0, i32 6
%.tmp4867 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4866
%.tmp4868 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4867, i32 0, i32 7
%.tmp4869 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4868
%.tmp4870 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4869, i32 0, i32 7
%.tmp4871 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4870
%.tmp4872 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4871, i32 0, i32 1
%.tmp4873 = load i8*, i8** %.tmp4872
%.tmp4874 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4875 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4874)
%.tmp4876 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4862, i8* %.tmp4864, i8* %.tmp4873, i8* %.tmp4875)
%.tmp4877 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4878 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4879 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4877, %m286$.Node.type* %.tmp4878, i8* %.tmp4879)
%.tmp4880 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4880
br label %.if.end.4861
.if.false.4861:
br label %.if.end.4861
.if.end.4861:
%.tmp4881 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4882 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4881, i32 0, i32 1
%.tmp4883 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4882
store %m1830$.AssignableInfo.type* %.tmp4883, %m1830$.AssignableInfo.type** %info
%.tmp4884 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4885 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4884, i32 0, i32 6
%.tmp4886 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4885
%.tmp4887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4886, i32 0, i32 7
%.tmp4888 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4887
%.tmp4889 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4888, i32 0, i32 7
%.tmp4890 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4889
store %m286$.Node.type* %.tmp4890, %m286$.Node.type** %assignable_name
br label %.if.end.4845
.if.false.4845:
%.tmp4891 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4892 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4891, i32 0, i32 6
%.tmp4893 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4892
store %m286$.Node.type* %.tmp4893, %m286$.Node.type** %assignable_name
br label %.if.end.4845
.if.end.4845:
%.tmp4894 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4895 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4896 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4897 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,%m1830$.AssignableInfo.type*) @m1830$get_dotted_name.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4894, %m286$.Node.type* %.tmp4895, %m1830$.AssignableInfo.type* %.tmp4896)
%base = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4897, %m1830$.AssignableInfo.type** %base
%.tmp4899 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4900 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4899, i32 0, i32 6
%.tmp4901 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4900
%.tmp4902 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4901, i32 0, i32 7
%.tmp4903 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4902
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4903, %m286$.Node.type** %addr
br label %.for.start.4898
.for.start.4898:
%.tmp4904 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp4905 = icmp ne %m286$.Node.type* %.tmp4904, null
br i1 %.tmp4905, label %.for.continue.4898, label %.for.end.4898
.for.continue.4898:
%.tmp4906 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp4907 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4906, i32 0, i32 7
%.tmp4908 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4907
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4908, %m286$.Node.type** %index
%.tmp4909 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4910 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp4911 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4909, %m286$.Node.type* %.tmp4910)
%index_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4911, %m1830$.AssignableInfo.type** %index_info
%.tmp4912 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4913 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp4914 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4913, i32 0, i32 3
%.tmp4915 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4914
%.tmp4916 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4912, %m1830$.Type.type* %.tmp4915)
%base_type = alloca i8*
store i8* %.tmp4916, i8** %base_type
%.tmp4917 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4918 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %index_info
%.tmp4919 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4918, i32 0, i32 3
%.tmp4920 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4919
%.tmp4921 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4917, %m1830$.Type.type* %.tmp4920)
%index_type = alloca i8*
store i8* %.tmp4921, i8** %index_type
%.tmp4922 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4923 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4922)
%tmp_id = alloca i32
store i32 %.tmp4923, i32* %tmp_id
%.tmp4924 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4925 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4924, i32 0, i32 1
%.tmp4926 = load %m0$.File.type*, %m0$.File.type** %.tmp4925
%.tmp4928 = getelementptr [28 x i8], [28 x i8]*@.str4927, i32 0, i32 0
%.tmp4929 = load i32, i32* %tmp_id
%.tmp4930 = load i8*, i8** %base_type
%.tmp4931 = load i8*, i8** %base_type
%.tmp4932 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp4933 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4932)
%.tmp4934 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4926, i8* %.tmp4928, i32 %.tmp4929, i8* %.tmp4930, i8* %.tmp4931, i8* %.tmp4933)
%.tmp4935 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4936 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4935)
%new_base = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4936, %m1830$.AssignableInfo.type** %new_base
%.tmp4937 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4938 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4937, %m1830$.AssignableInfo.type* %.tmp4938)
%.tmp4939 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp4940 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4939, i32 0, i32 3
%.tmp4941 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4940
%.tmp4942 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4941, i32 0, i32 3
%.tmp4943 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4942
%.tmp4944 = icmp eq %m1830$.Type.type* %.tmp4943, null
br i1 %.tmp4944, label %.if.true.4945, label %.if.false.4945
.if.true.4945:
%.tmp4946 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4948 = getelementptr [35 x i8], [35 x i8]*@.str4947, i32 0, i32 0
%.tmp4949 = load i8*, i8** %base_type
%.tmp4950 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4946, i8* %.tmp4948, i8* %.tmp4949)
%.tmp4951 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4952 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp4953 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4951, %m286$.Node.type* %.tmp4952, i8* %.tmp4953)
%.tmp4954 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
ret %m1830$.AssignableInfo.type* %.tmp4954
br label %.if.end.4945
.if.false.4945:
br label %.if.end.4945
.if.end.4945:
%.tmp4955 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4956 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4955, i32 0, i32 3
%.tmp4957 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp4958 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4957, i32 0, i32 3
%.tmp4959 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4958
%.tmp4960 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4959, i32 0, i32 3
%.tmp4961 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4960
store %m1830$.Type.type* %.tmp4961, %m1830$.Type.type** %.tmp4956
%.tmp4962 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4963 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4964 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4963, i32 0, i32 3
%.tmp4965 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4964
%.tmp4966 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4962, %m1830$.Type.type* %.tmp4965)
%base_type_2 = alloca i8*
store i8* %.tmp4966, i8** %base_type_2
%.tmp4967 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4968 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4967, i32 0, i32 1
%.tmp4969 = load %m0$.File.type*, %m0$.File.type** %.tmp4968
%.tmp4971 = getelementptr [44 x i8], [44 x i8]*@.str4970, i32 0, i32 0
%.tmp4972 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4973 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4972)
%.tmp4974 = load i8*, i8** %base_type_2
%.tmp4975 = load i8*, i8** %base_type_2
%.tmp4976 = load i32, i32* %tmp_id
%.tmp4977 = load i8*, i8** %index_type
%.tmp4978 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %index_info
%.tmp4979 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4978)
%.tmp4980 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4969, i8* %.tmp4971, i8* %.tmp4973, i8* %.tmp4974, i8* %.tmp4975, i32 %.tmp4976, i8* %.tmp4977, i8* %.tmp4979)
%.tmp4981 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
store %m1830$.AssignableInfo.type* %.tmp4981, %m1830$.AssignableInfo.type** %base
%.tmp4982 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp4983 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4982, i32 0, i32 7
%.tmp4984 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4983
%.tmp4985 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4984, i32 0, i32 7
%.tmp4986 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4985
%.tmp4987 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4986, i32 0, i32 7
%.tmp4988 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4987
store %m286$.Node.type* %.tmp4988, %m286$.Node.type** %addr
br label %.for.start.4898
.for.end.4898:
%.tmp4989 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
ret %m1830$.AssignableInfo.type* %.tmp4989
}
%m1830$.StackHead.type = type {%m1951$.SYStack.type*}
define %m1830$.AssignableInfo.type* @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp4990 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4991 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4990, i32 0, i32 6
%.tmp4992 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4991
%.tmp4994 = getelementptr [16 x i8], [16 x i8]*@.str4993, i32 0, i32 0
%.tmp4995 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4992, i8* %.tmp4994)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4995, %m286$.Node.type** %assignable_start
%.tmp4996 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp4997 = call %m1951$.SYStack.type*(%m286$.Node.type*) @m1951$sy_algorithm.m1951$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4996)
%operator_stack = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp4997, %m1951$.SYStack.type** %operator_stack
%.tmp4998 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* null, i32 1
%.tmp4999 = ptrtoint %m1830$.StackHead.type* %.tmp4998 to i32
%.tmp5000 = call i8*(i32) @malloc(i32 %.tmp4999)
%.tmp5001 = bitcast i8* %.tmp5000 to %m1830$.StackHead.type*
%stack = alloca %m1830$.StackHead.type*
store %m1830$.StackHead.type* %.tmp5001, %m1830$.StackHead.type** %stack
%.tmp5002 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5003 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5002, i32 0, i32 0
%.tmp5004 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %operator_stack
store %m1951$.SYStack.type* %.tmp5004, %m1951$.SYStack.type** %.tmp5003
%.tmp5005 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5006 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5007 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m1830$.StackHead.type*) @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.tmp5005, %m1830$.StackHead.type* %.tmp5006)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5007, %m1830$.AssignableInfo.type** %info
%.tmp5008 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5009 = icmp eq %m1830$.AssignableInfo.type* %.tmp5008, null
br i1 %.tmp5009, label %.if.true.5010, label %.if.false.5010
.if.true.5010:
%.tmp5011 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp5011
br label %.if.end.5010
.if.false.5010:
br label %.if.end.5010
.if.end.5010:
%.tmp5012 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5013 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5012, i32 0, i32 6
%.tmp5014 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5013
%.tmp5016 = getelementptr [5 x i8], [5 x i8]*@.str5015, i32 0, i32 0
%.tmp5017 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5014, i8* %.tmp5016)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5017, %m286$.Node.type** %cast
%.tmp5018 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5019 = icmp ne %m286$.Node.type* %.tmp5018, null
br i1 %.tmp5019, label %.if.true.5020, label %.if.false.5020
.if.true.5020:
%.tmp5021 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5022 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5021, i32 0, i32 6
%.tmp5023 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5022
%.tmp5025 = getelementptr [5 x i8], [5 x i8]*@.str5024, i32 0, i32 0
%.tmp5026 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5023, i8* %.tmp5025)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5026, %m286$.Node.type** %cast_type
%.tmp5027 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5028 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5029 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5028, i32 0, i32 6
%.tmp5030 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5029
%.tmp5031 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5027, %m286$.Node.type* %.tmp5030)
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp5031, %m1830$.Type.type** %type
%.tmp5032 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5033 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5032)
%prev_id = alloca i8*
store i8* %.tmp5033, i8** %prev_id
%.tmp5034 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5035 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5034, %m1830$.AssignableInfo.type* %.tmp5035)
%.tmp5036 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5037 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5036, i32 0, i32 1
%.tmp5038 = load %m0$.File.type*, %m0$.File.type** %.tmp5037
%.tmp5040 = getelementptr [26 x i8], [26 x i8]*@.str5039, i32 0, i32 0
%.tmp5041 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5042 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5041)
%.tmp5043 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5044 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5045 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5044, i32 0, i32 3
%.tmp5046 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5045
%.tmp5047 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5043, %m1830$.Type.type* %.tmp5046)
%.tmp5048 = load i8*, i8** %prev_id
%.tmp5049 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5050 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5051 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5049, %m1830$.Type.type* %.tmp5050)
%.tmp5052 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5038, i8* %.tmp5040, i8* %.tmp5042, i8* %.tmp5047, i8* %.tmp5048, i8* %.tmp5051)
%.tmp5053 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5054 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5053, i32 0, i32 3
%.tmp5055 = load %m1830$.Type.type*, %m1830$.Type.type** %type
store %m1830$.Type.type* %.tmp5055, %m1830$.Type.type** %.tmp5054
br label %.if.end.5020
.if.false.5020:
br label %.if.end.5020
.if.end.5020:
%.tmp5056 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp5056
}
define %m1830$.AssignableInfo.type* @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stack = alloca %m1830$.StackHead.type*
store %m1830$.StackHead.type* %.stack.arg, %m1830$.StackHead.type** %stack
%.tmp5057 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5058 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5057, i32 0, i32 0
%.tmp5059 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5058
%.tmp5060 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5059, i32 0, i32 0
%.tmp5061 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5060
%.tmp5062 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5061, i32 0, i32 0
%.tmp5063 = load i8*, i8** %.tmp5062
%.tmp5065 = getelementptr [16 x i8], [16 x i8]*@.str5064, i32 0, i32 0
%.tmp5066 = call i32(i8*,i8*) @strcmp(i8* %.tmp5063, i8* %.tmp5065)
%.tmp5067 = icmp eq i32 %.tmp5066, 0
br i1 %.tmp5067, label %.if.true.5068, label %.if.false.5068
.if.true.5068:
%.tmp5069 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5070 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5071 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5070, i32 0, i32 0
%.tmp5072 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5071
%.tmp5073 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5072, i32 0, i32 0
%.tmp5074 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5073
%.tmp5075 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_mono_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5069, %m286$.Node.type* %.tmp5074)
ret %m1830$.AssignableInfo.type* %.tmp5075
br label %.if.end.5068
.if.false.5068:
br label %.if.end.5068
.if.end.5068:
%.tmp5076 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5077 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5076, i32 0, i32 0
%.tmp5078 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5077
%.tmp5079 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5078, i32 0, i32 0
%.tmp5080 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5079
%.tmp5081 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5080, i32 0, i32 6
%.tmp5082 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5081
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5082, %m286$.Node.type** %operator
%.tmp5083 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5084 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5083, i32 0, i32 0
%.tmp5085 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5086 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5085, i32 0, i32 0
%.tmp5087 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5086
%.tmp5088 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5087, i32 0, i32 1
%.tmp5089 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5088
store %m1951$.SYStack.type* %.tmp5089, %m1951$.SYStack.type** %.tmp5084
%.tmp5090 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5091 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5092 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m1830$.StackHead.type*) @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.tmp5090, %m1830$.StackHead.type* %.tmp5091)
%A = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5092, %m1830$.AssignableInfo.type** %A
%.tmp5093 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
%.tmp5094 = icmp eq %m1830$.AssignableInfo.type* %.tmp5093, null
br i1 %.tmp5094, label %.if.true.5095, label %.if.false.5095
.if.true.5095:
%.tmp5096 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
ret %m1830$.AssignableInfo.type* %.tmp5096
br label %.if.end.5095
.if.false.5095:
br label %.if.end.5095
.if.end.5095:
%.tmp5097 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5098 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5097, i32 0, i32 0
%.tmp5099 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5100 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5099, i32 0, i32 0
%.tmp5101 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5100
%.tmp5102 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5101, i32 0, i32 1
%.tmp5103 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5102
store %m1951$.SYStack.type* %.tmp5103, %m1951$.SYStack.type** %.tmp5098
%.tmp5104 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5105 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5106 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m1830$.StackHead.type*) @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.tmp5104, %m1830$.StackHead.type* %.tmp5105)
%B = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5106, %m1830$.AssignableInfo.type** %B
%.tmp5107 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %B
%.tmp5108 = icmp eq %m1830$.AssignableInfo.type* %.tmp5107, null
br i1 %.tmp5108, label %.if.true.5109, label %.if.false.5109
.if.true.5109:
%.tmp5110 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %B
ret %m1830$.AssignableInfo.type* %.tmp5110
br label %.if.end.5109
.if.false.5109:
br label %.if.end.5109
.if.end.5109:
%.tmp5111 = bitcast ptr null to %m286$.Node.type*
%.tmp5112 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5111)
%op_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5112, %m1830$.AssignableInfo.type** %op_info
%.tmp5113 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
%.tmp5114 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5113, i32 0, i32 3
%.tmp5115 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5116 = call %m1830$.Type.type*(%m286$.Node.type*) @m1830$operator_type.m1830$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5115)
store %m1830$.Type.type* %.tmp5116, %m1830$.Type.type** %.tmp5114
%.tmp5117 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5118 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5117, %m1830$.AssignableInfo.type* %.tmp5118)
%.tmp5119 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5120 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5119, i32 0, i32 1
%.tmp5121 = load %m0$.File.type*, %m0$.File.type** %.tmp5120
%.tmp5123 = getelementptr [19 x i8], [19 x i8]*@.str5122, i32 0, i32 0
%.tmp5124 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
%.tmp5125 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5124)
%.tmp5126 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5127 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5128 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$operator_op.cp.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5126, %m286$.Node.type* %.tmp5127)
%.tmp5129 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5130 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
%.tmp5131 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5130, i32 0, i32 3
%.tmp5132 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5131
%.tmp5133 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5129, %m1830$.Type.type* %.tmp5132)
%.tmp5134 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
%.tmp5135 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5134)
%.tmp5136 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %B
%.tmp5137 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5136)
%.tmp5138 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5121, i8* %.tmp5123, i8* %.tmp5125, i8* %.tmp5128, i8* %.tmp5133, i8* %.tmp5135, i8* %.tmp5137)
%.tmp5139 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
ret %m1830$.AssignableInfo.type* %.tmp5139
}
define i8* @m1830$operator_op.cp.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5140 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5141 = icmp eq %m286$.Node.type* %.tmp5140, null
br i1 %.tmp5141, label %.if.true.5142, label %.if.false.5142
.if.true.5142:
%.tmp5143 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5144 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5146 = getelementptr [31 x i8], [31 x i8]*@.str5145, i32 0, i32 0
%.tmp5147 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5143, %m286$.Node.type* %.tmp5144, i8* %.tmp5146)
%.tmp5148 = call i32(i8*,...) @printf(i8* %.tmp5147)
br label %.if.end.5142
.if.false.5142:
br label %.if.end.5142
.if.end.5142:
%.tmp5149 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5150 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5149, i32 0, i32 1
%.tmp5151 = load i8*, i8** %.tmp5150
%.tmp5153 = getelementptr [2 x i8], [2 x i8]*@.str5152, i32 0, i32 0
%.tmp5154 = call i32(i8*,i8*) @strcmp(i8* %.tmp5151, i8* %.tmp5153)
%.tmp5155 = icmp eq i32 %.tmp5154, 0
br i1 %.tmp5155, label %.if.true.5156, label %.if.false.5156
.if.true.5156:
%.tmp5158 = getelementptr [4 x i8], [4 x i8]*@.str5157, i32 0, i32 0
ret i8* %.tmp5158
br label %.if.end.5156
.if.false.5156:
%.tmp5159 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5160 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5159, i32 0, i32 1
%.tmp5161 = load i8*, i8** %.tmp5160
%.tmp5163 = getelementptr [2 x i8], [2 x i8]*@.str5162, i32 0, i32 0
%.tmp5164 = call i32(i8*,i8*) @strcmp(i8* %.tmp5161, i8* %.tmp5163)
%.tmp5165 = icmp eq i32 %.tmp5164, 0
br i1 %.tmp5165, label %.if.true.5166, label %.if.false.5166
.if.true.5166:
%.tmp5168 = getelementptr [4 x i8], [4 x i8]*@.str5167, i32 0, i32 0
ret i8* %.tmp5168
br label %.if.end.5166
.if.false.5166:
%.tmp5169 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5170 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5169, i32 0, i32 1
%.tmp5171 = load i8*, i8** %.tmp5170
%.tmp5173 = getelementptr [2 x i8], [2 x i8]*@.str5172, i32 0, i32 0
%.tmp5174 = call i32(i8*,i8*) @strcmp(i8* %.tmp5171, i8* %.tmp5173)
%.tmp5175 = icmp eq i32 %.tmp5174, 0
br i1 %.tmp5175, label %.if.true.5176, label %.if.false.5176
.if.true.5176:
%.tmp5178 = getelementptr [4 x i8], [4 x i8]*@.str5177, i32 0, i32 0
ret i8* %.tmp5178
br label %.if.end.5176
.if.false.5176:
%.tmp5179 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5180 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5179, i32 0, i32 1
%.tmp5181 = load i8*, i8** %.tmp5180
%.tmp5183 = getelementptr [2 x i8], [2 x i8]*@.str5182, i32 0, i32 0
%.tmp5184 = call i32(i8*,i8*) @strcmp(i8* %.tmp5181, i8* %.tmp5183)
%.tmp5185 = icmp eq i32 %.tmp5184, 0
br i1 %.tmp5185, label %.if.true.5186, label %.if.false.5186
.if.true.5186:
%.tmp5188 = getelementptr [5 x i8], [5 x i8]*@.str5187, i32 0, i32 0
ret i8* %.tmp5188
br label %.if.end.5186
.if.false.5186:
%.tmp5189 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5190 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5189, i32 0, i32 1
%.tmp5191 = load i8*, i8** %.tmp5190
%.tmp5193 = getelementptr [3 x i8], [3 x i8]*@.str5192, i32 0, i32 0
%.tmp5194 = call i32(i8*,i8*) @strcmp(i8* %.tmp5191, i8* %.tmp5193)
%.tmp5195 = icmp eq i32 %.tmp5194, 0
br i1 %.tmp5195, label %.if.true.5196, label %.if.false.5196
.if.true.5196:
%.tmp5198 = getelementptr [8 x i8], [8 x i8]*@.str5197, i32 0, i32 0
ret i8* %.tmp5198
br label %.if.end.5196
.if.false.5196:
%.tmp5199 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5200 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5199, i32 0, i32 1
%.tmp5201 = load i8*, i8** %.tmp5200
%.tmp5203 = getelementptr [3 x i8], [3 x i8]*@.str5202, i32 0, i32 0
%.tmp5204 = call i32(i8*,i8*) @strcmp(i8* %.tmp5201, i8* %.tmp5203)
%.tmp5205 = icmp eq i32 %.tmp5204, 0
br i1 %.tmp5205, label %.if.true.5206, label %.if.false.5206
.if.true.5206:
%.tmp5208 = getelementptr [8 x i8], [8 x i8]*@.str5207, i32 0, i32 0
ret i8* %.tmp5208
br label %.if.end.5206
.if.false.5206:
%.tmp5209 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5210 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5209, i32 0, i32 1
%.tmp5211 = load i8*, i8** %.tmp5210
%.tmp5213 = getelementptr [2 x i8], [2 x i8]*@.str5212, i32 0, i32 0
%.tmp5214 = call i32(i8*,i8*) @strcmp(i8* %.tmp5211, i8* %.tmp5213)
%.tmp5215 = icmp eq i32 %.tmp5214, 0
br i1 %.tmp5215, label %.if.true.5216, label %.if.false.5216
.if.true.5216:
%.tmp5218 = getelementptr [9 x i8], [9 x i8]*@.str5217, i32 0, i32 0
ret i8* %.tmp5218
br label %.if.end.5216
.if.false.5216:
%.tmp5219 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5220 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5219, i32 0, i32 1
%.tmp5221 = load i8*, i8** %.tmp5220
%.tmp5223 = getelementptr [2 x i8], [2 x i8]*@.str5222, i32 0, i32 0
%.tmp5224 = call i32(i8*,i8*) @strcmp(i8* %.tmp5221, i8* %.tmp5223)
%.tmp5225 = icmp eq i32 %.tmp5224, 0
br i1 %.tmp5225, label %.if.true.5226, label %.if.false.5226
.if.true.5226:
%.tmp5228 = getelementptr [9 x i8], [9 x i8]*@.str5227, i32 0, i32 0
ret i8* %.tmp5228
br label %.if.end.5226
.if.false.5226:
%.tmp5229 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5230 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5229, i32 0, i32 1
%.tmp5231 = load i8*, i8** %.tmp5230
%.tmp5233 = getelementptr [2 x i8], [2 x i8]*@.str5232, i32 0, i32 0
%.tmp5234 = call i32(i8*,i8*) @strcmp(i8* %.tmp5231, i8* %.tmp5233)
%.tmp5235 = icmp eq i32 %.tmp5234, 0
br i1 %.tmp5235, label %.if.true.5236, label %.if.false.5236
.if.true.5236:
%.tmp5238 = getelementptr [4 x i8], [4 x i8]*@.str5237, i32 0, i32 0
ret i8* %.tmp5238
br label %.if.end.5236
.if.false.5236:
%.tmp5239 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5240 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5239, i32 0, i32 1
%.tmp5241 = load i8*, i8** %.tmp5240
%.tmp5243 = getelementptr [2 x i8], [2 x i8]*@.str5242, i32 0, i32 0
%.tmp5244 = call i32(i8*,i8*) @strcmp(i8* %.tmp5241, i8* %.tmp5243)
%.tmp5245 = icmp eq i32 %.tmp5244, 0
br i1 %.tmp5245, label %.if.true.5246, label %.if.false.5246
.if.true.5246:
%.tmp5248 = getelementptr [3 x i8], [3 x i8]*@.str5247, i32 0, i32 0
ret i8* %.tmp5248
br label %.if.end.5246
.if.false.5246:
%.tmp5249 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5250 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5249, i32 0, i32 1
%.tmp5251 = load i8*, i8** %.tmp5250
%.tmp5253 = getelementptr [3 x i8], [3 x i8]*@.str5252, i32 0, i32 0
%.tmp5254 = call i32(i8*,i8*) @strcmp(i8* %.tmp5251, i8* %.tmp5253)
%.tmp5255 = icmp eq i32 %.tmp5254, 0
br i1 %.tmp5255, label %.if.true.5256, label %.if.false.5256
.if.true.5256:
%.tmp5258 = getelementptr [9 x i8], [9 x i8]*@.str5257, i32 0, i32 0
ret i8* %.tmp5258
br label %.if.end.5256
.if.false.5256:
%.tmp5259 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5260 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5259, i32 0, i32 1
%.tmp5261 = load i8*, i8** %.tmp5260
%.tmp5263 = getelementptr [3 x i8], [3 x i8]*@.str5262, i32 0, i32 0
%.tmp5264 = call i32(i8*,i8*) @strcmp(i8* %.tmp5261, i8* %.tmp5263)
%.tmp5265 = icmp eq i32 %.tmp5264, 0
br i1 %.tmp5265, label %.if.true.5266, label %.if.false.5266
.if.true.5266:
%.tmp5268 = getelementptr [9 x i8], [9 x i8]*@.str5267, i32 0, i32 0
ret i8* %.tmp5268
br label %.if.end.5266
.if.false.5266:
%.tmp5269 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5270 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5272 = getelementptr [30 x i8], [30 x i8]*@.str5271, i32 0, i32 0
%.tmp5273 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5269, %m286$.Node.type* %.tmp5270, i8* %.tmp5272)
%.tmp5274 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5275 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5274, i32 0, i32 1
%.tmp5276 = load i8*, i8** %.tmp5275
%.tmp5277 = call i32(i8*,...) @printf(i8* %.tmp5273, i8* %.tmp5276)
br label %.if.end.5266
.if.end.5266:
br label %.if.end.5256
.if.end.5256:
br label %.if.end.5246
.if.end.5246:
br label %.if.end.5236
.if.end.5236:
br label %.if.end.5226
.if.end.5226:
br label %.if.end.5216
.if.end.5216:
br label %.if.end.5206
.if.end.5206:
br label %.if.end.5196
.if.end.5196:
br label %.if.end.5186
.if.end.5186:
br label %.if.end.5176
.if.end.5176:
br label %.if.end.5166
.if.end.5166:
br label %.if.end.5156
.if.end.5156:
%.tmp5279 = getelementptr [4 x i8], [4 x i8]*@.str5278, i32 0, i32 0
ret i8* %.tmp5279
}
define %m1830$.Type.type* @m1830$operator_type.m1830$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5280 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp5280, %m1830$.Type.type** %type
%.tmp5281 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5282 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5281, i32 0, i32 1
%.tmp5283 = load i8*, i8** %.tmp5282
%.tmp5285 = getelementptr [3 x i8], [3 x i8]*@.str5284, i32 0, i32 0
%.tmp5286 = call i32(i8*,i8*) @strcmp(i8* %.tmp5283, i8* %.tmp5285)
%.tmp5287 = icmp eq i32 %.tmp5286, 0
%.tmp5288 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5289 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5288, i32 0, i32 1
%.tmp5290 = load i8*, i8** %.tmp5289
%.tmp5292 = getelementptr [3 x i8], [3 x i8]*@.str5291, i32 0, i32 0
%.tmp5293 = call i32(i8*,i8*) @strcmp(i8* %.tmp5290, i8* %.tmp5292)
%.tmp5294 = icmp eq i32 %.tmp5293, 0
%.tmp5295 = or i1 %.tmp5287, %.tmp5294
%.tmp5296 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5297 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5296, i32 0, i32 1
%.tmp5298 = load i8*, i8** %.tmp5297
%.tmp5300 = getelementptr [2 x i8], [2 x i8]*@.str5299, i32 0, i32 0
%.tmp5301 = call i32(i8*,i8*) @strcmp(i8* %.tmp5298, i8* %.tmp5300)
%.tmp5302 = icmp eq i32 %.tmp5301, 0
%.tmp5303 = or i1 %.tmp5295, %.tmp5302
%.tmp5304 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5305 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5304, i32 0, i32 1
%.tmp5306 = load i8*, i8** %.tmp5305
%.tmp5308 = getelementptr [2 x i8], [2 x i8]*@.str5307, i32 0, i32 0
%.tmp5309 = call i32(i8*,i8*) @strcmp(i8* %.tmp5306, i8* %.tmp5308)
%.tmp5310 = icmp eq i32 %.tmp5309, 0
%.tmp5311 = or i1 %.tmp5303, %.tmp5310
%.tmp5312 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5313 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5312, i32 0, i32 1
%.tmp5314 = load i8*, i8** %.tmp5313
%.tmp5316 = getelementptr [2 x i8], [2 x i8]*@.str5315, i32 0, i32 0
%.tmp5317 = call i32(i8*,i8*) @strcmp(i8* %.tmp5314, i8* %.tmp5316)
%.tmp5318 = icmp eq i32 %.tmp5317, 0
%.tmp5319 = or i1 %.tmp5311, %.tmp5318
%.tmp5320 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5321 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5320, i32 0, i32 1
%.tmp5322 = load i8*, i8** %.tmp5321
%.tmp5324 = getelementptr [2 x i8], [2 x i8]*@.str5323, i32 0, i32 0
%.tmp5325 = call i32(i8*,i8*) @strcmp(i8* %.tmp5322, i8* %.tmp5324)
%.tmp5326 = icmp eq i32 %.tmp5325, 0
%.tmp5327 = or i1 %.tmp5319, %.tmp5326
%.tmp5328 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5329 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5328, i32 0, i32 1
%.tmp5330 = load i8*, i8** %.tmp5329
%.tmp5332 = getelementptr [3 x i8], [3 x i8]*@.str5331, i32 0, i32 0
%.tmp5333 = call i32(i8*,i8*) @strcmp(i8* %.tmp5330, i8* %.tmp5332)
%.tmp5334 = icmp eq i32 %.tmp5333, 0
%.tmp5335 = or i1 %.tmp5327, %.tmp5334
%.tmp5336 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5337 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5336, i32 0, i32 1
%.tmp5338 = load i8*, i8** %.tmp5337
%.tmp5340 = getelementptr [3 x i8], [3 x i8]*@.str5339, i32 0, i32 0
%.tmp5341 = call i32(i8*,i8*) @strcmp(i8* %.tmp5338, i8* %.tmp5340)
%.tmp5342 = icmp eq i32 %.tmp5341, 0
%.tmp5343 = or i1 %.tmp5335, %.tmp5342
br i1 %.tmp5343, label %.if.true.5344, label %.if.false.5344
.if.true.5344:
%.tmp5345 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5346 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5345, i32 0, i32 0
%.tmp5348 = getelementptr [5 x i8], [5 x i8]*@.str5347, i32 0, i32 0
store i8* %.tmp5348, i8** %.tmp5346
br label %.if.end.5344
.if.false.5344:
%.tmp5349 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5350 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5349, i32 0, i32 0
%.tmp5352 = getelementptr [4 x i8], [4 x i8]*@.str5351, i32 0, i32 0
store i8* %.tmp5352, i8** %.tmp5350
br label %.if.end.5344
.if.end.5344:
%.tmp5353 = load %m1830$.Type.type*, %m1830$.Type.type** %type
ret %m1830$.Type.type* %.tmp5353
}
define %m1830$.AssignableInfo.type* @m1830$compile_mono_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5354 = bitcast ptr null to %m1830$.AssignableInfo.type*
%assignable_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5354, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5355 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5355, %m286$.Node.type** %mono
%err_buf = alloca i8*
%buf = alloca i8*
%.tmp5356 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5357 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5356, i32 0, i32 6
%.tmp5358 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5357
%.tmp5359 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5358, i32 0, i32 0
%.tmp5360 = load i8*, i8** %.tmp5359
%.tmp5362 = getelementptr [7 x i8], [7 x i8]*@.str5361, i32 0, i32 0
%.tmp5363 = call i32(i8*,i8*) @strcmp(i8* %.tmp5360, i8* %.tmp5362)
%.tmp5364 = icmp eq i32 %.tmp5363, 0
br i1 %.tmp5364, label %.if.true.5365, label %.if.false.5365
.if.true.5365:
%.tmp5366 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5367 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5366)
store %m1830$.AssignableInfo.type* %.tmp5367, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5368 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5369 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5368, i32 0, i32 3
%.tmp5370 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5370, %m1830$.Type.type** %.tmp5369
%.tmp5371 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5372 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5371, i32 0, i32 3
%.tmp5373 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5372
%.tmp5374 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5373, i32 0, i32 0
%.tmp5376 = getelementptr [4 x i8], [4 x i8]*@.str5375, i32 0, i32 0
store i8* %.tmp5376, i8** %.tmp5374
%.tmp5377 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5378 = load i8, i8* @SCOPE_CONST
%.tmp5379 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5380 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5379, i32 0, i32 6
%.tmp5381 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5380
%.tmp5382 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5381, i32 0, i32 1
%.tmp5383 = load i8*, i8** %.tmp5382
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5377, i8 %.tmp5378, i8* %.tmp5383)
br label %.if.end.5365
.if.false.5365:
%.tmp5384 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5385 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5384, i32 0, i32 6
%.tmp5386 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5385
%.tmp5387 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5386, i32 0, i32 0
%.tmp5388 = load i8*, i8** %.tmp5387
%.tmp5390 = getelementptr [5 x i8], [5 x i8]*@.str5389, i32 0, i32 0
%.tmp5391 = call i32(i8*,i8*) @strcmp(i8* %.tmp5388, i8* %.tmp5390)
%.tmp5392 = icmp eq i32 %.tmp5391, 0
br i1 %.tmp5392, label %.if.true.5393, label %.if.false.5393
.if.true.5393:
%.tmp5394 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5395 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5394, i32 0, i32 6
%.tmp5396 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5395
%.tmp5397 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5396, i32 0, i32 1
%.tmp5398 = load i8*, i8** %.tmp5397
%.tmp5400 = getelementptr [5 x i8], [5 x i8]*@.str5399, i32 0, i32 0
%.tmp5401 = call i32(i8*,i8*) @strcmp(i8* %.tmp5398, i8* %.tmp5400)
%.tmp5402 = icmp ne i32 %.tmp5401, 0
br i1 %.tmp5402, label %.if.true.5403, label %.if.false.5403
.if.true.5403:
%.tmp5404 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5405 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5407 = getelementptr [42 x i8], [42 x i8]*@.str5406, i32 0, i32 0
%.tmp5408 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5404, %m286$.Node.type* %.tmp5405, i8* %.tmp5407)
%.tmp5409 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5410 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5409, i32 0, i32 6
%.tmp5411 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5410
%.tmp5412 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5411, i32 0, i32 1
%.tmp5413 = load i8*, i8** %.tmp5412
%.tmp5414 = call i32(i8*,...) @printf(i8* %.tmp5408, i8* %.tmp5413)
%.tmp5415 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5415
br label %.if.end.5403
.if.false.5403:
br label %.if.end.5403
.if.end.5403:
%.tmp5416 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5417 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5416)
store %m1830$.AssignableInfo.type* %.tmp5417, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5418 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5419 = load i8, i8* @SCOPE_CONST
%.tmp5421 = getelementptr [5 x i8], [5 x i8]*@.str5420, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5418, i8 %.tmp5419, i8* %.tmp5421)
%.tmp5422 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5423 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5422, i32 0, i32 3
%.tmp5424 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5424, %m1830$.Type.type** %.tmp5423
%.tmp5425 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5426 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5425, i32 0, i32 3
%.tmp5427 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5426
%.tmp5428 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5427, i32 0, i32 0
%.tmp5430 = getelementptr [8 x i8], [8 x i8]*@.str5429, i32 0, i32 0
store i8* %.tmp5430, i8** %.tmp5428
br label %.if.end.5393
.if.false.5393:
%.tmp5431 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5432 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5431, i32 0, i32 6
%.tmp5433 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5432
%.tmp5434 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5433, i32 0, i32 0
%.tmp5435 = load i8*, i8** %.tmp5434
%.tmp5437 = getelementptr [17 x i8], [17 x i8]*@.str5436, i32 0, i32 0
%.tmp5438 = call i32(i8*,i8*) @strcmp(i8* %.tmp5435, i8* %.tmp5437)
%.tmp5439 = icmp eq i32 %.tmp5438, 0
br i1 %.tmp5439, label %.if.true.5440, label %.if.false.5440
.if.true.5440:
%.tmp5441 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5442 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5441)
store %m1830$.AssignableInfo.type* %.tmp5442, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5443 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5444 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5443, i32 0, i32 6
%.tmp5445 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5444
%.tmp5446 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5445, i32 0, i32 6
%.tmp5447 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5446
%.tmp5449 = getelementptr [12 x i8], [12 x i8]*@.str5448, i32 0, i32 0
%.tmp5450 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5447, i8* %.tmp5449)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5450, %m286$.Node.type** %dest
%.tmp5451 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5452 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5453 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5451, %m286$.Node.type* %.tmp5452)
%var_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5453, %m1830$.AssignableInfo.type** %var_info
%.tmp5454 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5455 = icmp eq %m1830$.AssignableInfo.type* %.tmp5454, null
br i1 %.tmp5455, label %.if.true.5456, label %.if.false.5456
.if.true.5456:
%.tmp5457 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
ret %m1830$.AssignableInfo.type* %.tmp5457
br label %.if.end.5456
.if.false.5456:
br label %.if.end.5456
.if.end.5456:
%.tmp5458 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5459 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5460 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5459, i32 0, i32 3
%.tmp5461 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5460
%.tmp5462 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5458, %m1830$.Type.type* %.tmp5461)
%var_type_repr = alloca i8*
store i8* %.tmp5462, i8** %var_type_repr
%.tmp5463 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5464 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5463, %m1830$.AssignableInfo.type* %.tmp5464)
%.tmp5465 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5466 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5465, i32 0, i32 3
%.tmp5467 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5468 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5467, i32 0, i32 3
%.tmp5469 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5468
store %m1830$.Type.type* %.tmp5469, %m1830$.Type.type** %.tmp5466
%.tmp5471 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5472 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5471, i32 0, i32 6
%.tmp5473 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5472
%.tmp5474 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5473, i32 0, i32 6
%.tmp5475 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5474
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5475, %m286$.Node.type** %ptr
br label %.for.start.5470
.for.start.5470:
%.tmp5476 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5477 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5478 = icmp ne %m286$.Node.type* %.tmp5476, %.tmp5477
br i1 %.tmp5478, label %.for.continue.5470, label %.for.end.5470
.for.continue.5470:
%.tmp5479 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp5479, %m1830$.Type.type** %type
%.tmp5480 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5481 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5480, i32 0, i32 3
%.tmp5482 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5483 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5482, i32 0, i32 3
%.tmp5484 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5483
store %m1830$.Type.type* %.tmp5484, %m1830$.Type.type** %.tmp5481
%.tmp5485 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5486 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5485, i32 0, i32 0
%.tmp5488 = getelementptr [4 x i8], [4 x i8]*@.str5487, i32 0, i32 0
store i8* %.tmp5488, i8** %.tmp5486
%.tmp5489 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5490 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5489, i32 0, i32 3
%.tmp5491 = load %m1830$.Type.type*, %m1830$.Type.type** %type
store %m1830$.Type.type* %.tmp5491, %m1830$.Type.type** %.tmp5490
%.tmp5492 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5493 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5492, i32 0, i32 7
%.tmp5494 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5493
store %m286$.Node.type* %.tmp5494, %m286$.Node.type** %ptr
br label %.for.start.5470
.for.end.5470:
%.tmp5495 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5496 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5495, i32 0, i32 6
%.tmp5497 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5496
%.tmp5498 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5497, i32 0, i32 6
%.tmp5499 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5498
%.tmp5500 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5501 = icmp ne %m286$.Node.type* %.tmp5499, %.tmp5500
br i1 %.tmp5501, label %.if.true.5502, label %.if.false.5502
.if.true.5502:
%.tmp5503 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5504 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5503, i32 0, i32 1
%.tmp5505 = load %m0$.File.type*, %m0$.File.type** %.tmp5504
%.tmp5507 = getelementptr [38 x i8], [38 x i8]*@.str5506, i32 0, i32 0
%.tmp5508 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5509 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5508)
%.tmp5510 = load i8*, i8** %var_type_repr
%.tmp5511 = load i8*, i8** %var_type_repr
%.tmp5512 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5513 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5512)
%.tmp5514 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5505, i8* %.tmp5507, i8* %.tmp5509, i8* %.tmp5510, i8* %.tmp5511, i8* %.tmp5513)
br label %.if.end.5502
.if.false.5502:
%.tmp5515 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5516 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5515, i32 0, i32 1
%.tmp5517 = load %m0$.File.type*, %m0$.File.type** %.tmp5516
%.tmp5519 = getelementptr [22 x i8], [22 x i8]*@.str5518, i32 0, i32 0
%.tmp5520 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5521 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5520)
%.tmp5522 = load i8*, i8** %var_type_repr
%.tmp5523 = load i8*, i8** %var_type_repr
%.tmp5524 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5525 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5524)
%.tmp5526 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5517, i8* %.tmp5519, i8* %.tmp5521, i8* %.tmp5522, i8* %.tmp5523, i8* %.tmp5525)
br label %.if.end.5502
.if.end.5502:
br label %.if.end.5440
.if.false.5440:
%.tmp5527 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5528 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5527, i32 0, i32 6
%.tmp5529 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5528
%.tmp5530 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5529, i32 0, i32 0
%.tmp5531 = load i8*, i8** %.tmp5530
%.tmp5533 = getelementptr [8 x i8], [8 x i8]*@.str5532, i32 0, i32 0
%.tmp5534 = call i32(i8*,i8*) @strcmp(i8* %.tmp5531, i8* %.tmp5533)
%.tmp5535 = icmp eq i32 %.tmp5534, 0
br i1 %.tmp5535, label %.if.true.5536, label %.if.false.5536
.if.true.5536:
%.tmp5537 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5538 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5537)
store %m1830$.AssignableInfo.type* %.tmp5538, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5539 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5540 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5539, i32 0, i32 3
%.tmp5541 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5541, %m1830$.Type.type** %.tmp5540
%.tmp5542 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5543 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5542, i32 0, i32 3
%.tmp5544 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5543
%.tmp5545 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5544, i32 0, i32 0
%.tmp5547 = getelementptr [5 x i8], [5 x i8]*@.str5546, i32 0, i32 0
store i8* %.tmp5547, i8** %.tmp5545
%.tmp5548 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5549 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5548, i32 0, i32 6
%.tmp5550 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5549
%.tmp5551 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5550, i32 0, i32 6
%.tmp5552 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5551
%.tmp5553 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5552, i32 0, i32 1
%.tmp5554 = load i8*, i8** %.tmp5553
%.tmp5556 = getelementptr [6 x i8], [6 x i8]*@.str5555, i32 0, i32 0
%.tmp5557 = call i32(i8*,i8*) @strcmp(i8* %.tmp5554, i8* %.tmp5556)
%.tmp5558 = icmp eq i32 %.tmp5557, 0
br i1 %.tmp5558, label %.if.true.5559, label %.if.false.5559
.if.true.5559:
%.tmp5560 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5561 = load i8, i8* @SCOPE_CONST
%.tmp5563 = getelementptr [2 x i8], [2 x i8]*@.str5562, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5560, i8 %.tmp5561, i8* %.tmp5563)
br label %.if.end.5559
.if.false.5559:
%.tmp5564 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5565 = load i8, i8* @SCOPE_CONST
%.tmp5567 = getelementptr [2 x i8], [2 x i8]*@.str5566, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5564, i8 %.tmp5565, i8* %.tmp5567)
br label %.if.end.5559
.if.end.5559:
br label %.if.end.5536
.if.false.5536:
%.tmp5568 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5569 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5568, i32 0, i32 6
%.tmp5570 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5569
%.tmp5571 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5570, i32 0, i32 0
%.tmp5572 = load i8*, i8** %.tmp5571
%.tmp5574 = getelementptr [8 x i8], [8 x i8]*@.str5573, i32 0, i32 0
%.tmp5575 = call i32(i8*,i8*) @strcmp(i8* %.tmp5572, i8* %.tmp5574)
%.tmp5576 = icmp eq i32 %.tmp5575, 0
br i1 %.tmp5576, label %.if.true.5577, label %.if.false.5577
.if.true.5577:
%.tmp5578 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5579 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5580 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5579, i32 0, i32 6
%.tmp5581 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5580
%.tmp5582 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5581, i32 0, i32 6
%.tmp5583 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5582
%.tmp5584 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_fn_call.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5578, %m286$.Node.type* %.tmp5583)
store %m1830$.AssignableInfo.type* %.tmp5584, %m1830$.AssignableInfo.type** %assignable_info
br label %.if.end.5577
.if.false.5577:
%.tmp5585 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5586 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5585, i32 0, i32 6
%.tmp5587 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5586
%.tmp5588 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5587, i32 0, i32 0
%.tmp5589 = load i8*, i8** %.tmp5588
%.tmp5591 = getelementptr [7 x i8], [7 x i8]*@.str5590, i32 0, i32 0
%.tmp5592 = call i32(i8*,i8*) @strcmp(i8* %.tmp5589, i8* %.tmp5591)
%.tmp5593 = icmp eq i32 %.tmp5592, 0
br i1 %.tmp5593, label %.if.true.5594, label %.if.false.5594
.if.true.5594:
%.tmp5595 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5596 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5597 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5596, i32 0, i32 6
%.tmp5598 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5597
%.tmp5599 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5598, i32 0, i32 1
%.tmp5600 = load i8*, i8** %.tmp5599
%.tmp5601 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,i8*) @m1830$define_string.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp5595, i8* %.tmp5600)
%string_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5601, %m1830$.AssignableInfo.type** %string_info
%.tmp5602 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5603 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5602)
store %m1830$.AssignableInfo.type* %.tmp5603, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5604 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5605 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5604, %m1830$.AssignableInfo.type* %.tmp5605)
%.tmp5606 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5607 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %string_info
%.tmp5608 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5607, i32 0, i32 3
%.tmp5609 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5608
%.tmp5610 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5606, %m1830$.Type.type* %.tmp5609)
%str_tr = alloca i8*
store i8* %.tmp5610, i8** %str_tr
%.tmp5611 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5612 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5611, i32 0, i32 1
%.tmp5613 = load %m0$.File.type*, %m0$.File.type** %.tmp5612
%.tmp5615 = getelementptr [44 x i8], [44 x i8]*@.str5614, i32 0, i32 0
%.tmp5616 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5617 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5616)
%.tmp5618 = load i8*, i8** %str_tr
%.tmp5619 = load i8*, i8** %str_tr
%.tmp5620 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %string_info
%.tmp5621 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5620)
%.tmp5622 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5613, i8* %.tmp5615, i8* %.tmp5617, i8* %.tmp5618, i8* %.tmp5619, i8* %.tmp5621)
%.tmp5623 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5624 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5623, i32 0, i32 3
%.tmp5625 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5625, %m1830$.Type.type** %.tmp5624
%.tmp5626 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5627 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5626, i32 0, i32 3
%.tmp5628 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5627
%.tmp5629 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5628, i32 0, i32 0
%.tmp5631 = getelementptr [4 x i8], [4 x i8]*@.str5630, i32 0, i32 0
store i8* %.tmp5631, i8** %.tmp5629
%.tmp5632 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5633 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5632, i32 0, i32 3
%.tmp5634 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5633
%.tmp5635 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5634, i32 0, i32 3
%.tmp5636 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5636, %m1830$.Type.type** %.tmp5635
%.tmp5637 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5638 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5637, i32 0, i32 3
%.tmp5639 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5638
%.tmp5640 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5639, i32 0, i32 3
%.tmp5641 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5640
%.tmp5642 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5641, i32 0, i32 0
%.tmp5644 = getelementptr [4 x i8], [4 x i8]*@.str5643, i32 0, i32 0
store i8* %.tmp5644, i8** %.tmp5642
br label %.if.end.5594
.if.false.5594:
%.tmp5645 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5646 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5645, i32 0, i32 6
%.tmp5647 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5646
%.tmp5648 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5647, i32 0, i32 0
%.tmp5649 = load i8*, i8** %.tmp5648
%.tmp5651 = getelementptr [4 x i8], [4 x i8]*@.str5650, i32 0, i32 0
%.tmp5652 = call i32(i8*,i8*) @strcmp(i8* %.tmp5649, i8* %.tmp5651)
%.tmp5653 = icmp eq i32 %.tmp5652, 0
br i1 %.tmp5653, label %.if.true.5654, label %.if.false.5654
.if.true.5654:
%.tmp5655 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5656 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5655)
store %m1830$.AssignableInfo.type* %.tmp5656, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5657 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5658 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5657, i32 0, i32 6
%.tmp5659 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5658
%.tmp5660 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5659, i32 0, i32 1
%.tmp5661 = load i8*, i8** %.tmp5660
%.tmp5662 = call i32(i8*) @strlen(i8* %.tmp5661)
%chr_len = alloca i32
store i32 %.tmp5662, i32* %chr_len
%.tmp5663 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5664 = load i8, i8* @SCOPE_CONST
%.tmp5666 = getelementptr [2 x i8], [2 x i8]*@.str5665, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5663, i8 %.tmp5664, i8* %.tmp5666)
%intval = alloca i32
store i32 0, i32* %intval
%.tmp5667 = load i32, i32* %chr_len
%.tmp5668 = icmp eq i32 %.tmp5667, 5
br i1 %.tmp5668, label %.if.true.5669, label %.if.false.5669
.if.true.5669:
%.tmp5670 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5671 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5670, i32 0, i32 6
%.tmp5672 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5671
%.tmp5673 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5672, i32 0, i32 1
%.tmp5674 = load i8*, i8** %.tmp5673
%.tmp5676 = getelementptr [6 x i8], [6 x i8]*@.str5675, i32 0, i32 0
%.tmp5677 = getelementptr i32, i32* %intval, i32 0
%.tmp5678 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5674, i8* %.tmp5676, i32* %.tmp5677)
%.tmp5679 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5680 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5679, i32 0, i32 0
%.tmp5681 = getelementptr i8*, i8** %.tmp5680, i32 0
%.tmp5683 = getelementptr [3 x i8], [3 x i8]*@.str5682, i32 0, i32 0
%.tmp5684 = load i32, i32* %intval
%.tmp5685 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5681, i8* %.tmp5683, i32 %.tmp5684)
br label %.if.end.5669
.if.false.5669:
%.tmp5686 = load i32, i32* %chr_len
%.tmp5687 = icmp eq i32 %.tmp5686, 3
br i1 %.tmp5687, label %.if.true.5688, label %.if.false.5688
.if.true.5688:
%.tmp5689 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5690 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5689, i32 0, i32 6
%.tmp5691 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5690
%.tmp5692 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5691, i32 0, i32 1
%.tmp5693 = load i8*, i8** %.tmp5692
%.tmp5695 = getelementptr [5 x i8], [5 x i8]*@.str5694, i32 0, i32 0
%.tmp5696 = getelementptr i32, i32* %intval, i32 0
%.tmp5697 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5693, i8* %.tmp5695, i32* %.tmp5696)
%.tmp5698 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5699 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5698, i32 0, i32 0
%.tmp5700 = getelementptr i8*, i8** %.tmp5699, i32 0
%.tmp5702 = getelementptr [3 x i8], [3 x i8]*@.str5701, i32 0, i32 0
%.tmp5703 = load i32, i32* %intval
%.tmp5704 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5700, i8* %.tmp5702, i32 %.tmp5703)
br label %.if.end.5688
.if.false.5688:
%.tmp5705 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp5707 = getelementptr [18 x i8], [18 x i8]*@.str5706, i32 0, i32 0
%.tmp5708 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5705, i8* %.tmp5707)
%.tmp5709 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5710 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5711 = load i8*, i8** %err_buf
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5709, %m286$.Node.type* %.tmp5710, i8* %.tmp5711)
br label %.if.end.5688
.if.end.5688:
br label %.if.end.5669
.if.end.5669:
%.tmp5712 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5713 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5712, i32 0, i32 3
%.tmp5714 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5714, %m1830$.Type.type** %.tmp5713
%.tmp5715 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5716 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5715, i32 0, i32 3
%.tmp5717 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5716
%.tmp5718 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5717, i32 0, i32 0
%.tmp5720 = getelementptr [4 x i8], [4 x i8]*@.str5719, i32 0, i32 0
store i8* %.tmp5720, i8** %.tmp5718
br label %.if.end.5654
.if.false.5654:
%.tmp5721 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5722 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5724 = getelementptr [40 x i8], [40 x i8]*@.str5723, i32 0, i32 0
%.tmp5725 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5721, %m286$.Node.type* %.tmp5722, i8* %.tmp5724)
%.tmp5726 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5727 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5726, i32 0, i32 6
%.tmp5728 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5727
%.tmp5729 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5728, i32 0, i32 0
%.tmp5730 = load i8*, i8** %.tmp5729
%.tmp5731 = call i32(i8*,...) @printf(i8* %.tmp5725, i8* %.tmp5730)
%.tmp5732 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5732
br label %.if.end.5654
.if.end.5654:
br label %.if.end.5594
.if.end.5594:
br label %.if.end.5577
.if.end.5577:
br label %.if.end.5536
.if.end.5536:
br label %.if.end.5440
.if.end.5440:
br label %.if.end.5393
.if.end.5393:
br label %.if.end.5365
.if.end.5365:
%.tmp5733 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5734 = icmp eq %m1830$.AssignableInfo.type* %.tmp5733, null
br i1 %.tmp5734, label %.if.true.5735, label %.if.false.5735
.if.true.5735:
%.tmp5736 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5736
br label %.if.end.5735
.if.false.5735:
br label %.if.end.5735
.if.end.5735:
%.tmp5737 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5738 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5737, i32 0, i32 4
%.tmp5739 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5740 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5739, i32 0, i32 3
%.tmp5741 = load i32, i32* %.tmp5740
store i32 %.tmp5741, i32* %.tmp5738
%.tmp5742 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5743 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5742, i32 0, i32 5
%.tmp5744 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5745 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5744, i32 0, i32 4
%.tmp5746 = load i32, i32* %.tmp5745
store i32 %.tmp5746, i32* %.tmp5743
%.tmp5747 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5748 = bitcast %m1830$.AssignableInfo.type* %.tmp5747 to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5748
}
define i8* @m1830$type_abbr.cp.m1830$.Type.typep(%m1830$.Type.type* %.type.arg) {
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.type.arg, %m1830$.Type.type** %type
%.tmp5749 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5750 = icmp ne %m1830$.Type.type* %.tmp5749, null
%.tmp5752 = getelementptr [22 x i8], [22 x i8]*@.str5751, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5750, i8* %.tmp5752)
%.tmp5753 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5754 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5753, i32 0, i32 0
%.tmp5755 = load i8*, i8** %.tmp5754
%.tmp5756 = icmp ne i8* %.tmp5755, null
%.tmp5758 = getelementptr [59 x i8], [59 x i8]*@.str5757, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5756, i8* %.tmp5758)
%.tmp5759 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5760 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5759, i32 0, i32 0
%.tmp5761 = load i8*, i8** %.tmp5760
%.tmp5763 = getelementptr [4 x i8], [4 x i8]*@.str5762, i32 0, i32 0
%.tmp5764 = call i32(i8*,i8*) @strcmp(i8* %.tmp5761, i8* %.tmp5763)
%.tmp5765 = icmp eq i32 %.tmp5764, 0
br i1 %.tmp5765, label %.if.true.5766, label %.if.false.5766
.if.true.5766:
%.tmp5768 = getelementptr [2 x i8], [2 x i8]*@.str5767, i32 0, i32 0
ret i8* %.tmp5768
br label %.if.end.5766
.if.false.5766:
%.tmp5769 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5770 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5769, i32 0, i32 0
%.tmp5771 = load i8*, i8** %.tmp5770
%.tmp5773 = getelementptr [5 x i8], [5 x i8]*@.str5772, i32 0, i32 0
%.tmp5774 = call i32(i8*,i8*) @strcmp(i8* %.tmp5771, i8* %.tmp5773)
%.tmp5775 = icmp eq i32 %.tmp5774, 0
br i1 %.tmp5775, label %.if.true.5776, label %.if.false.5776
.if.true.5776:
%.tmp5778 = getelementptr [2 x i8], [2 x i8]*@.str5777, i32 0, i32 0
ret i8* %.tmp5778
br label %.if.end.5776
.if.false.5776:
%.tmp5779 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5780 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5779, i32 0, i32 0
%.tmp5781 = load i8*, i8** %.tmp5780
%.tmp5783 = getelementptr [5 x i8], [5 x i8]*@.str5782, i32 0, i32 0
%.tmp5784 = call i32(i8*,i8*) @strcmp(i8* %.tmp5781, i8* %.tmp5783)
%.tmp5785 = icmp eq i32 %.tmp5784, 0
br i1 %.tmp5785, label %.if.true.5786, label %.if.false.5786
.if.true.5786:
%.tmp5788 = getelementptr [2 x i8], [2 x i8]*@.str5787, i32 0, i32 0
ret i8* %.tmp5788
br label %.if.end.5786
.if.false.5786:
%.tmp5789 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5790 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5789, i32 0, i32 0
%.tmp5791 = load i8*, i8** %.tmp5790
%.tmp5793 = getelementptr [4 x i8], [4 x i8]*@.str5792, i32 0, i32 0
%.tmp5794 = call i32(i8*,i8*) @strcmp(i8* %.tmp5791, i8* %.tmp5793)
%.tmp5795 = icmp eq i32 %.tmp5794, 0
br i1 %.tmp5795, label %.if.true.5796, label %.if.false.5796
.if.true.5796:
%.tmp5798 = getelementptr [2 x i8], [2 x i8]*@.str5797, i32 0, i32 0
ret i8* %.tmp5798
br label %.if.end.5796
.if.false.5796:
%.tmp5799 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5800 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5799, i32 0, i32 0
%.tmp5801 = load i8*, i8** %.tmp5800
%.tmp5803 = getelementptr [4 x i8], [4 x i8]*@.str5802, i32 0, i32 0
%.tmp5804 = call i32(i8*,i8*) @strcmp(i8* %.tmp5801, i8* %.tmp5803)
%.tmp5805 = icmp eq i32 %.tmp5804, 0
br i1 %.tmp5805, label %.if.true.5806, label %.if.false.5806
.if.true.5806:
%.tmp5808 = getelementptr [3 x i8], [3 x i8]*@.str5807, i32 0, i32 0
ret i8* %.tmp5808
br label %.if.end.5806
.if.false.5806:
%.tmp5809 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5810 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5809, i32 0, i32 0
%.tmp5811 = load i8*, i8** %.tmp5810
%.tmp5813 = getelementptr [4 x i8], [4 x i8]*@.str5812, i32 0, i32 0
%.tmp5814 = call i32(i8*,i8*) @strcmp(i8* %.tmp5811, i8* %.tmp5813)
%.tmp5815 = icmp eq i32 %.tmp5814, 0
br i1 %.tmp5815, label %.if.true.5816, label %.if.false.5816
.if.true.5816:
%buf = alloca i8*
%.tmp5817 = getelementptr i8*, i8** %buf, i32 0
%.tmp5819 = getelementptr [4 x i8], [4 x i8]*@.str5818, i32 0, i32 0
%.tmp5820 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5821 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5820, i32 0, i32 3
%.tmp5822 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5821
%.tmp5823 = call i8*(%m1830$.Type.type*) @m1830$type_abbr.cp.m1830$.Type.typep(%m1830$.Type.type* %.tmp5822)
%.tmp5824 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5817, i8* %.tmp5819, i8* %.tmp5823)
%.tmp5825 = load i8*, i8** %buf
ret i8* %.tmp5825
br label %.if.end.5816
.if.false.5816:
%.tmp5826 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5827 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5826, i32 0, i32 0
%.tmp5828 = load i8*, i8** %.tmp5827
%.tmp5830 = getelementptr [10 x i8], [10 x i8]*@.str5829, i32 0, i32 0
%.tmp5831 = call i32(i8*,i8*) @strcmp(i8* %.tmp5828, i8* %.tmp5830)
%.tmp5832 = icmp eq i32 %.tmp5831, 0
br i1 %.tmp5832, label %.if.true.5833, label %.if.false.5833
.if.true.5833:
%.tmp5834 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5835 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5834, i32 0, i32 2
%.tmp5836 = load i8*, i8** %.tmp5835
ret i8* %.tmp5836
br label %.if.end.5833
.if.false.5833:
%.tmp5837 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5838 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5837, i32 0, i32 0
%.tmp5839 = load i8*, i8** %.tmp5838
%.tmp5841 = getelementptr [6 x i8], [6 x i8]*@.str5840, i32 0, i32 0
%.tmp5842 = call i32(i8*,i8*) @strcmp(i8* %.tmp5839, i8* %.tmp5841)
%.tmp5843 = icmp eq i32 %.tmp5842, 0
br i1 %.tmp5843, label %.if.true.5844, label %.if.false.5844
.if.true.5844:
%.tmp5846 = getelementptr [2 x i8], [2 x i8]*@.str5845, i32 0, i32 0
ret i8* %.tmp5846
br label %.if.end.5844
.if.false.5844:
%.tmp5848 = getelementptr [44 x i8], [44 x i8]*@.str5847, i32 0, i32 0
%.tmp5849 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5850 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5849, i32 0, i32 0
%.tmp5851 = load i8*, i8** %.tmp5850
%.tmp5852 = call i32(i8*,...) @printf(i8* %.tmp5848, i8* %.tmp5851)
br label %.if.end.5844
.if.end.5844:
br label %.if.end.5833
.if.end.5833:
br label %.if.end.5816
.if.end.5816:
br label %.if.end.5806
.if.end.5806:
br label %.if.end.5796
.if.end.5796:
br label %.if.end.5786
.if.end.5786:
br label %.if.end.5776
.if.end.5776:
br label %.if.end.5766
.if.end.5766:
%.tmp5853 = bitcast ptr null to i8*
ret i8* %.tmp5853
}
define i32 @m1830$calc_llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.5854
.for.start.5854:
%.tmp5855 = load i32, i32* %i
%.tmp5856 = load i8*, i8** %text
%.tmp5857 = getelementptr i8, i8* %.tmp5856, i32 %.tmp5855
%.tmp5858 = load i8, i8* %.tmp5857
%.tmp5859 = icmp ne i8 %.tmp5858, 0
br i1 %.tmp5859, label %.for.continue.5854, label %.for.end.5854
.for.continue.5854:
%.tmp5860 = load i32, i32* %i
%.tmp5861 = load i8*, i8** %text
%.tmp5862 = getelementptr i8, i8* %.tmp5861, i32 %.tmp5860
%.tmp5863 = load i8, i8* %.tmp5862
%.tmp5864 = icmp eq i8 %.tmp5863, 92
%.tmp5865 = load i32, i32* %i
%.tmp5866 = add i32 %.tmp5865, 1
%.tmp5867 = load i8*, i8** %text
%.tmp5868 = getelementptr i8, i8* %.tmp5867, i32 %.tmp5866
%.tmp5869 = load i8, i8* %.tmp5868
%.tmp5870 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp5869)
%.tmp5871 = and i1 %.tmp5864, %.tmp5870
br i1 %.tmp5871, label %.if.true.5872, label %.if.false.5872
.if.true.5872:
%.tmp5873 = load i32, i32* %i
%.tmp5874 = add i32 %.tmp5873, 1
store i32 %.tmp5874, i32* %i
br label %.if.end.5872
.if.false.5872:
%.tmp5875 = load i32, i32* %len
%.tmp5876 = add i32 %.tmp5875, 1
store i32 %.tmp5876, i32* %len
br label %.if.end.5872
.if.end.5872:
%.tmp5877 = load i32, i32* %i
%.tmp5878 = add i32 %.tmp5877, 1
store i32 %.tmp5878, i32* %i
br label %.for.start.5854
.for.end.5854:
%.tmp5879 = load i32, i32* %len
ret i32 %.tmp5879
}
define %m1830$.AssignableInfo.type* @m1830$define_string.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp5880 = bitcast ptr null to %m286$.Node.type*
%.tmp5881 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5880)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5881, %m1830$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp5882 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp5884 = getelementptr [7 x i8], [7 x i8]*@.str5883, i32 0, i32 0
%.tmp5885 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5886 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp5885)
%.tmp5887 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5882, i8* %.tmp5884, i32 %.tmp5886)
%.tmp5888 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5889 = load i8, i8* @SCOPE_GLOBAL
%.tmp5890 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5888, i8 %.tmp5889, i8* %.tmp5890)
%.tmp5891 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5892 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5891, i32 0, i32 3
%.tmp5893 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5893, %m1830$.Type.type** %.tmp5892
%.tmp5894 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5895 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5894, i32 0, i32 3
%.tmp5896 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5895
%.tmp5897 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5896, i32 0, i32 0
%.tmp5899 = getelementptr [6 x i8], [6 x i8]*@.str5898, i32 0, i32 0
store i8* %.tmp5899, i8** %.tmp5897
%.tmp5900 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5901 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5900, i32 0, i32 3
%.tmp5902 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5901
%.tmp5903 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5902, i32 0, i32 3
%.tmp5904 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5904, %m1830$.Type.type** %.tmp5903
%.tmp5905 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5906 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5905, i32 0, i32 3
%.tmp5907 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5906
%.tmp5908 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5907, i32 0, i32 3
%.tmp5909 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5908
%.tmp5910 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5909, i32 0, i32 0
%.tmp5912 = getelementptr [4 x i8], [4 x i8]*@.str5911, i32 0, i32 0
store i8* %.tmp5912, i8** %.tmp5910
%.tmp5913 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5914 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5913, i32 0, i32 3
%.tmp5915 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5914
%.tmp5916 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5915, i32 0, i32 3
%.tmp5917 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5916
%.tmp5918 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5917, i32 0, i32 4
%.tmp5919 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5919, %m1830$.Type.type** %.tmp5918
%.tmp5920 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5921 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5920, i32 0, i32 3
%.tmp5922 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5921
%.tmp5923 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5922, i32 0, i32 3
%.tmp5924 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5923
%.tmp5925 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5924, i32 0, i32 4
%.tmp5926 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5925
%.tmp5927 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5926, i32 0, i32 0
%.tmp5928 = getelementptr i8*, i8** %.tmp5927, i32 0
%.tmp5930 = getelementptr [3 x i8], [3 x i8]*@.str5929, i32 0, i32 0
%.tmp5931 = load i8*, i8** %text
%.tmp5932 = call i32(i8*) @m1830$calc_llvm_str_len.i.cp(i8* %.tmp5931)
%.tmp5933 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5928, i8* %.tmp5930, i32 %.tmp5932)
%.tmp5934 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* null, i32 1
%.tmp5935 = ptrtoint %m1830$.GlobalName.type* %.tmp5934 to i32
%.tmp5936 = call i8*(i32) @malloc(i32 %.tmp5935)
%.tmp5937 = bitcast i8* %.tmp5936 to %m1830$.GlobalName.type*
%global = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.tmp5937, %m1830$.GlobalName.type** %global
%.tmp5938 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp5939 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5938, i32 0, i32 0
%.tmp5940 = load i8*, i8** %text
store i8* %.tmp5940, i8** %.tmp5939
%.tmp5941 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp5942 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5941, i32 0, i32 1
%.tmp5944 = getelementptr [7 x i8], [7 x i8]*@.str5943, i32 0, i32 0
store i8* %.tmp5944, i8** %.tmp5942
%.tmp5945 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp5946 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5945, i32 0, i32 4
store %m1830$.GlobalName.type* null, %m1830$.GlobalName.type** %.tmp5946
%.tmp5947 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp5948 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5947, i32 0, i32 3
%.tmp5949 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
store %m1830$.AssignableInfo.type* %.tmp5949, %m1830$.AssignableInfo.type** %.tmp5948
%.tmp5950 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp5951 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5950, i32 0, i32 2
store i1 0, i1* %.tmp5951
%.tmp5952 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5953 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
call void(%m1830$.CompilerCtx.type*,%m1830$.GlobalName.type*) @m1830$append_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.tmp5952, %m1830$.GlobalName.type* %.tmp5953)
%.tmp5954 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp5954
}
define void @m1830$define_module.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%mod = alloca %m286$.Node.type*
store %m286$.Node.type* %.mod.arg, %m286$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp5955 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp5956 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5955)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5956, %m1830$.AssignableInfo.type** %info
%.tmp5957 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5958 = load i8, i8* @SCOPE_CONST
%.tmp5959 = load i8*, i8** %abspath
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5957, i8 %.tmp5958, i8* %.tmp5959)
%.tmp5960 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5961 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5960, i32 0, i32 2
%.tmp5963 = getelementptr [7 x i8], [7 x i8]*@.str5962, i32 0, i32 0
store i8* %.tmp5963, i8** %.tmp5961
%.tmp5964 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5965 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5964, i32 0, i32 3
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp5965
%.tmp5966 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5967 = load i8*, i8** %as_name
%.tmp5968 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5966, i8* %.tmp5967, %m1830$.AssignableInfo.type* %.tmp5968)
ret void
}
define void @m1830$append_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%g = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.g.arg, %m1830$.GlobalName.type** %g
%.tmp5969 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5970 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5969, i32 0, i32 3
%.tmp5971 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp5970
%.tmp5972 = icmp eq %m1830$.GlobalName.type* %.tmp5971, null
br i1 %.tmp5972, label %.if.true.5973, label %.if.false.5973
.if.true.5973:
%.tmp5974 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5975 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5974, i32 0, i32 3
%.tmp5976 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
store %m1830$.GlobalName.type* %.tmp5976, %m1830$.GlobalName.type** %.tmp5975
br label %.if.end.5973
.if.false.5973:
%last_global = alloca %m1830$.GlobalName.type*
%.tmp5978 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5979 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5978, i32 0, i32 3
%.tmp5980 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp5979
store %m1830$.GlobalName.type* %.tmp5980, %m1830$.GlobalName.type** %last_global
br label %.for.start.5977
.for.start.5977:
%.tmp5981 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %last_global
%.tmp5982 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5981, i32 0, i32 4
%.tmp5983 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp5982
%.tmp5984 = icmp ne %m1830$.GlobalName.type* %.tmp5983, null
br i1 %.tmp5984, label %.for.continue.5977, label %.for.end.5977
.for.continue.5977:
%.tmp5985 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %last_global
%.tmp5986 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5985, i32 0, i32 4
%.tmp5987 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp5986
store %m1830$.GlobalName.type* %.tmp5987, %m1830$.GlobalName.type** %last_global
br label %.for.start.5977
.for.end.5977:
%.tmp5988 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %last_global
%.tmp5989 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5988, i32 0, i32 4
%.tmp5990 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
store %m1830$.GlobalName.type* %.tmp5990, %m1830$.GlobalName.type** %.tmp5989
br label %.if.end.5973
.if.end.5973:
ret void
}
define i8* @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.Type.type* %.type.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.type.arg, %m1830$.Type.type** %type
%.tmp5991 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5992 = icmp eq %m1830$.Type.type* %.tmp5991, null
br i1 %.tmp5992, label %.if.true.5993, label %.if.false.5993
.if.true.5993:
%.tmp5994 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp5994, label %.if.true.5995, label %.if.false.5995
.if.true.5995:
%.tmp5997 = getelementptr [44 x i8], [44 x i8]*@.str5996, i32 0, i32 0
%.tmp5998 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5999 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5998, i32 0, i32 6
%.tmp6000 = load i8*, i8** %.tmp5999
%.tmp6001 = call i32(i8*,...) @printf(i8* %.tmp5997, i8* %.tmp6000)
br label %.if.end.5995
.if.false.5995:
br label %.if.end.5995
.if.end.5995:
%.tmp6003 = getelementptr [2 x i8], [2 x i8]*@.str6002, i32 0, i32 0
ret i8* %.tmp6003
br label %.if.end.5993
.if.false.5993:
br label %.if.end.5993
.if.end.5993:
%.tmp6004 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6005 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6004, i32 0, i32 0
%.tmp6006 = load i8*, i8** %.tmp6005
%.tmp6007 = icmp ne i8* %.tmp6006, null
%.tmp6009 = getelementptr [59 x i8], [59 x i8]*@.str6008, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6007, i8* %.tmp6009)
%buf = alloca i8*
%.tmp6010 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6011 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6010, i32 0, i32 0
%.tmp6012 = load i8*, i8** %.tmp6011
%.tmp6014 = getelementptr [4 x i8], [4 x i8]*@.str6013, i32 0, i32 0
%.tmp6015 = call i32(i8*,i8*) @strcmp(i8* %.tmp6012, i8* %.tmp6014)
%.tmp6016 = icmp eq i32 %.tmp6015, 0
br i1 %.tmp6016, label %.if.true.6017, label %.if.false.6017
.if.true.6017:
%.tmp6019 = getelementptr [4 x i8], [4 x i8]*@.str6018, i32 0, i32 0
ret i8* %.tmp6019
br label %.if.end.6017
.if.false.6017:
%.tmp6020 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6021 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6020, i32 0, i32 0
%.tmp6022 = load i8*, i8** %.tmp6021
%.tmp6024 = getelementptr [5 x i8], [5 x i8]*@.str6023, i32 0, i32 0
%.tmp6025 = call i32(i8*,i8*) @strcmp(i8* %.tmp6022, i8* %.tmp6024)
%.tmp6026 = icmp eq i32 %.tmp6025, 0
br i1 %.tmp6026, label %.if.true.6027, label %.if.false.6027
.if.true.6027:
%.tmp6029 = getelementptr [5 x i8], [5 x i8]*@.str6028, i32 0, i32 0
ret i8* %.tmp6029
br label %.if.end.6027
.if.false.6027:
%.tmp6030 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6031 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6030, i32 0, i32 0
%.tmp6032 = load i8*, i8** %.tmp6031
%.tmp6034 = getelementptr [5 x i8], [5 x i8]*@.str6033, i32 0, i32 0
%.tmp6035 = call i32(i8*,i8*) @strcmp(i8* %.tmp6032, i8* %.tmp6034)
%.tmp6036 = icmp eq i32 %.tmp6035, 0
br i1 %.tmp6036, label %.if.true.6037, label %.if.false.6037
.if.true.6037:
%.tmp6039 = getelementptr [3 x i8], [3 x i8]*@.str6038, i32 0, i32 0
ret i8* %.tmp6039
br label %.if.end.6037
.if.false.6037:
%.tmp6040 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6041 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6040, i32 0, i32 0
%.tmp6042 = load i8*, i8** %.tmp6041
%.tmp6044 = getelementptr [8 x i8], [8 x i8]*@.str6043, i32 0, i32 0
%.tmp6045 = call i32(i8*,i8*) @strcmp(i8* %.tmp6042, i8* %.tmp6044)
%.tmp6046 = icmp eq i32 %.tmp6045, 0
br i1 %.tmp6046, label %.if.true.6047, label %.if.false.6047
.if.true.6047:
%.tmp6049 = getelementptr [4 x i8], [4 x i8]*@.str6048, i32 0, i32 0
ret i8* %.tmp6049
br label %.if.end.6047
.if.false.6047:
%.tmp6050 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6051 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6050, i32 0, i32 0
%.tmp6052 = load i8*, i8** %.tmp6051
%.tmp6054 = getelementptr [4 x i8], [4 x i8]*@.str6053, i32 0, i32 0
%.tmp6055 = call i32(i8*,i8*) @strcmp(i8* %.tmp6052, i8* %.tmp6054)
%.tmp6056 = icmp eq i32 %.tmp6055, 0
br i1 %.tmp6056, label %.if.true.6057, label %.if.false.6057
.if.true.6057:
%.tmp6059 = getelementptr [3 x i8], [3 x i8]*@.str6058, i32 0, i32 0
ret i8* %.tmp6059
br label %.if.end.6057
.if.false.6057:
%.tmp6060 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6061 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6060, i32 0, i32 0
%.tmp6062 = load i8*, i8** %.tmp6061
%.tmp6064 = getelementptr [9 x i8], [9 x i8]*@.str6063, i32 0, i32 0
%.tmp6065 = call i32(i8*,i8*) @strcmp(i8* %.tmp6062, i8* %.tmp6064)
%.tmp6066 = icmp eq i32 %.tmp6065, 0
br i1 %.tmp6066, label %.if.true.6067, label %.if.false.6067
.if.true.6067:
%.tmp6068 = getelementptr i8*, i8** %buf, i32 0
%.tmp6070 = getelementptr [4 x i8], [4 x i8]*@.str6069, i32 0, i32 0
%.tmp6071 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6072 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6073 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6072, i32 0, i32 3
%.tmp6074 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6073
%.tmp6075 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6071, %m1830$.Type.type* %.tmp6074)
%.tmp6076 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6068, i8* %.tmp6070, i8* %.tmp6075)
%.tmp6078 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6079 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6078, i32 0, i32 3
%.tmp6080 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6079
%.tmp6081 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6080, i32 0, i32 4
%.tmp6082 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6081
%p = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6082, %m1830$.Type.type** %p
br label %.for.start.6077
.for.start.6077:
%.tmp6083 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6084 = icmp ne %m1830$.Type.type* %.tmp6083, null
br i1 %.tmp6084, label %.for.continue.6077, label %.for.end.6077
.for.continue.6077:
%.tmp6085 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6086 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6087 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6086, i32 0, i32 3
%.tmp6088 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6087
%.tmp6089 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6088, i32 0, i32 4
%.tmp6090 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6089
%.tmp6091 = icmp ne %m1830$.Type.type* %.tmp6085, %.tmp6090
br i1 %.tmp6091, label %.if.true.6092, label %.if.false.6092
.if.true.6092:
%.tmp6093 = getelementptr i8*, i8** %buf, i32 0
%.tmp6095 = getelementptr [4 x i8], [4 x i8]*@.str6094, i32 0, i32 0
%.tmp6096 = load i8*, i8** %buf
%.tmp6097 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6093, i8* %.tmp6095, i8* %.tmp6096)
br label %.if.end.6092
.if.false.6092:
br label %.if.end.6092
.if.end.6092:
%.tmp6098 = getelementptr i8*, i8** %buf, i32 0
%.tmp6100 = getelementptr [5 x i8], [5 x i8]*@.str6099, i32 0, i32 0
%.tmp6101 = load i8*, i8** %buf
%.tmp6102 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6103 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6104 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6102, %m1830$.Type.type* %.tmp6103)
%.tmp6105 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6098, i8* %.tmp6100, i8* %.tmp6101, i8* %.tmp6104)
%.tmp6106 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6107 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6106, i32 0, i32 4
%.tmp6108 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6107
store %m1830$.Type.type* %.tmp6108, %m1830$.Type.type** %p
br label %.for.start.6077
.for.end.6077:
%.tmp6109 = getelementptr i8*, i8** %buf, i32 0
%.tmp6111 = getelementptr [4 x i8], [4 x i8]*@.str6110, i32 0, i32 0
%.tmp6112 = load i8*, i8** %buf
%.tmp6113 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6109, i8* %.tmp6111, i8* %.tmp6112)
%.tmp6114 = load i8*, i8** %buf
ret i8* %.tmp6114
br label %.if.end.6067
.if.false.6067:
%.tmp6115 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6116 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6115, i32 0, i32 0
%.tmp6117 = load i8*, i8** %.tmp6116
%.tmp6119 = getelementptr [4 x i8], [4 x i8]*@.str6118, i32 0, i32 0
%.tmp6120 = call i32(i8*,i8*) @strcmp(i8* %.tmp6117, i8* %.tmp6119)
%.tmp6121 = icmp eq i32 %.tmp6120, 0
br i1 %.tmp6121, label %.if.true.6122, label %.if.false.6122
.if.true.6122:
%.tmp6123 = getelementptr i8*, i8** %buf, i32 0
%.tmp6125 = getelementptr [4 x i8], [4 x i8]*@.str6124, i32 0, i32 0
%.tmp6126 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6127 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6128 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6127, i32 0, i32 3
%.tmp6129 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6128
%.tmp6130 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6126, %m1830$.Type.type* %.tmp6129)
%.tmp6131 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6123, i8* %.tmp6125, i8* %.tmp6130)
%.tmp6132 = load i8*, i8** %buf
ret i8* %.tmp6132
br label %.if.end.6122
.if.false.6122:
%.tmp6133 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6134 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6133, i32 0, i32 0
%.tmp6135 = load i8*, i8** %.tmp6134
%.tmp6137 = getelementptr [7 x i8], [7 x i8]*@.str6136, i32 0, i32 0
%.tmp6138 = call i32(i8*,i8*) @strcmp(i8* %.tmp6135, i8* %.tmp6137)
%.tmp6139 = icmp eq i32 %.tmp6138, 0
br i1 %.tmp6139, label %.if.true.6140, label %.if.false.6140
.if.true.6140:
%.tmp6141 = getelementptr i8*, i8** %buf, i32 0
%.tmp6143 = getelementptr [2 x i8], [2 x i8]*@.str6142, i32 0, i32 0
%.tmp6144 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6141, i8* %.tmp6143)
%.tmp6146 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6147 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6146, i32 0, i32 3
%.tmp6148 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6147
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6148, %m1830$.Type.type** %t
br label %.for.start.6145
.for.start.6145:
%.tmp6149 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6150 = icmp ne %m1830$.Type.type* %.tmp6149, null
br i1 %.tmp6150, label %.for.continue.6145, label %.for.end.6145
.for.continue.6145:
%.tmp6151 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6152 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6153 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6152, i32 0, i32 3
%.tmp6154 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6153
%.tmp6155 = icmp ne %m1830$.Type.type* %.tmp6151, %.tmp6154
br i1 %.tmp6155, label %.if.true.6156, label %.if.false.6156
.if.true.6156:
%.tmp6157 = getelementptr i8*, i8** %buf, i32 0
%.tmp6159 = getelementptr [4 x i8], [4 x i8]*@.str6158, i32 0, i32 0
%.tmp6160 = load i8*, i8** %buf
%.tmp6161 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6157, i8* %.tmp6159, i8* %.tmp6160)
br label %.if.end.6156
.if.false.6156:
br label %.if.end.6156
.if.end.6156:
%.tmp6162 = getelementptr i8*, i8** %buf, i32 0
%.tmp6164 = getelementptr [5 x i8], [5 x i8]*@.str6163, i32 0, i32 0
%.tmp6165 = load i8*, i8** %buf
%.tmp6166 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6167 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6168 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6166, %m1830$.Type.type* %.tmp6167)
%.tmp6169 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6162, i8* %.tmp6164, i8* %.tmp6165, i8* %.tmp6168)
%.tmp6170 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6171 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6170, i32 0, i32 4
%.tmp6172 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6171
store %m1830$.Type.type* %.tmp6172, %m1830$.Type.type** %t
br label %.for.start.6145
.for.end.6145:
%.tmp6173 = getelementptr i8*, i8** %buf, i32 0
%.tmp6175 = getelementptr [4 x i8], [4 x i8]*@.str6174, i32 0, i32 0
%.tmp6176 = load i8*, i8** %buf
%.tmp6177 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6173, i8* %.tmp6175, i8* %.tmp6176)
%.tmp6178 = load i8*, i8** %buf
ret i8* %.tmp6178
br label %.if.end.6140
.if.false.6140:
%.tmp6179 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6180 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6179, i32 0, i32 0
%.tmp6181 = load i8*, i8** %.tmp6180
%.tmp6183 = getelementptr [6 x i8], [6 x i8]*@.str6182, i32 0, i32 0
%.tmp6184 = call i32(i8*,i8*) @strcmp(i8* %.tmp6181, i8* %.tmp6183)
%.tmp6185 = icmp eq i32 %.tmp6184, 0
br i1 %.tmp6185, label %.if.true.6186, label %.if.false.6186
.if.true.6186:
%.tmp6187 = getelementptr i8*, i8** %buf, i32 0
%.tmp6189 = getelementptr [10 x i8], [10 x i8]*@.str6188, i32 0, i32 0
%.tmp6190 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6191 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6190, i32 0, i32 3
%.tmp6192 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6191
%.tmp6193 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6192, i32 0, i32 4
%.tmp6194 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6193
%.tmp6195 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6194, i32 0, i32 0
%.tmp6196 = load i8*, i8** %.tmp6195
%.tmp6197 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6198 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6199 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6198, i32 0, i32 3
%.tmp6200 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6199
%.tmp6201 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6197, %m1830$.Type.type* %.tmp6200)
%.tmp6202 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6187, i8* %.tmp6189, i8* %.tmp6196, i8* %.tmp6201)
%.tmp6203 = load i8*, i8** %buf
ret i8* %.tmp6203
br label %.if.end.6186
.if.false.6186:
%.tmp6204 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6205 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6204, i32 0, i32 0
%.tmp6206 = load i8*, i8** %.tmp6205
%.tmp6208 = getelementptr [10 x i8], [10 x i8]*@.str6207, i32 0, i32 0
%.tmp6209 = call i32(i8*,i8*) @strcmp(i8* %.tmp6206, i8* %.tmp6208)
%.tmp6210 = icmp eq i32 %.tmp6209, 0
br i1 %.tmp6210, label %.if.true.6211, label %.if.false.6211
.if.true.6211:
%.tmp6212 = getelementptr i8*, i8** %buf, i32 0
%.tmp6214 = getelementptr [5 x i8], [5 x i8]*@.str6213, i32 0, i32 0
%.tmp6215 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6216 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6215, i32 0, i32 2
%.tmp6217 = load i8*, i8** %.tmp6216
%.tmp6218 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6212, i8* %.tmp6214, i8* %.tmp6217)
%.tmp6219 = load i8*, i8** %buf
ret i8* %.tmp6219
br label %.if.end.6211
.if.false.6211:
%.tmp6220 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6221 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6220, i32 0, i32 0
%.tmp6222 = load i8*, i8** %.tmp6221
%.tmp6224 = getelementptr [4 x i8], [4 x i8]*@.str6223, i32 0, i32 0
%.tmp6225 = call i32(i8*,i8*) @strcmp(i8* %.tmp6222, i8* %.tmp6224)
%.tmp6226 = icmp eq i32 %.tmp6225, 0
br i1 %.tmp6226, label %.if.true.6227, label %.if.false.6227
.if.true.6227:
%.tmp6229 = getelementptr [4 x i8], [4 x i8]*@.str6228, i32 0, i32 0
ret i8* %.tmp6229
br label %.if.end.6227
.if.false.6227:
%.tmp6230 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6231 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6230, i32 0, i32 0
%.tmp6232 = load i8*, i8** %.tmp6231
%.tmp6234 = getelementptr [7 x i8], [7 x i8]*@.str6233, i32 0, i32 0
%.tmp6235 = call i32(i8*,i8*) @strcmp(i8* %.tmp6232, i8* %.tmp6234)
%.tmp6236 = icmp eq i32 %.tmp6235, 0
br i1 %.tmp6236, label %.if.true.6237, label %.if.false.6237
.if.true.6237:
%.tmp6239 = getelementptr [4 x i8], [4 x i8]*@.str6238, i32 0, i32 0
ret i8* %.tmp6239
br label %.if.end.6237
.if.false.6237:
%.tmp6240 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6241 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6240, i32 0, i32 0
%.tmp6242 = load i8*, i8** %.tmp6241
%.tmp6244 = getelementptr [6 x i8], [6 x i8]*@.str6243, i32 0, i32 0
%.tmp6245 = call i32(i8*,i8*) @strcmp(i8* %.tmp6242, i8* %.tmp6244)
%.tmp6246 = icmp eq i32 %.tmp6245, 0
br i1 %.tmp6246, label %.if.true.6247, label %.if.false.6247
.if.true.6247:
br label %.if.end.6247
.if.false.6247:
%.tmp6249 = getelementptr [58 x i8], [58 x i8]*@.str6248, i32 0, i32 0
%.tmp6250 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6251 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6250, i32 0, i32 0
%.tmp6252 = load i8*, i8** %.tmp6251
%.tmp6253 = call i32(i8*,...) @printf(i8* %.tmp6249, i8* %.tmp6252)
br label %.if.end.6247
.if.end.6247:
br label %.if.end.6237
.if.end.6237:
br label %.if.end.6227
.if.end.6227:
br label %.if.end.6211
.if.end.6211:
br label %.if.end.6186
.if.end.6186:
br label %.if.end.6140
.if.end.6140:
br label %.if.end.6122
.if.end.6122:
br label %.if.end.6067
.if.end.6067:
br label %.if.end.6057
.if.end.6057:
br label %.if.end.6047
.if.end.6047:
br label %.if.end.6037
.if.end.6037:
br label %.if.end.6027
.if.end.6027:
br label %.if.end.6017
.if.end.6017:
%.tmp6254 = bitcast ptr null to i8*
ret i8* %.tmp6254
}
define void @m1830$append_error.v.m1830$.CompilerCtx.typep.m717$.Error.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m717$.Error.type* %.e.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp6255 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* null, i32 1
%.tmp6256 = ptrtoint %m1830$.ErrorList.type* %.tmp6255 to i32
%.tmp6257 = call i8*(i32) @malloc(i32 %.tmp6256)
%.tmp6258 = bitcast i8* %.tmp6257 to %m1830$.ErrorList.type*
%new_err = alloca %m1830$.ErrorList.type*
store %m1830$.ErrorList.type* %.tmp6258, %m1830$.ErrorList.type** %new_err
%.tmp6259 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
%.tmp6260 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6259, i32 0, i32 0
%.tmp6261 = load %m717$.Error.type*, %m717$.Error.type** %e
store %m717$.Error.type* %.tmp6261, %m717$.Error.type** %.tmp6260
%.tmp6262 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
%.tmp6263 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6262, i32 0, i32 1
store %m1830$.ErrorList.type* null, %m1830$.ErrorList.type** %.tmp6263
%.tmp6264 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6265 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6264, i32 0, i32 2
%.tmp6266 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6265
%.tmp6267 = icmp eq %m1830$.ErrorList.type* %.tmp6266, null
br i1 %.tmp6267, label %.if.true.6268, label %.if.false.6268
.if.true.6268:
%.tmp6269 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6270 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6269, i32 0, i32 2
%.tmp6271 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
store %m1830$.ErrorList.type* %.tmp6271, %m1830$.ErrorList.type** %.tmp6270
ret void
br label %.if.end.6268
.if.false.6268:
br label %.if.end.6268
.if.end.6268:
%.tmp6273 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6274 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6273, i32 0, i32 2
%.tmp6275 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6274
%last = alloca %m1830$.ErrorList.type*
store %m1830$.ErrorList.type* %.tmp6275, %m1830$.ErrorList.type** %last
br label %.for.start.6272
.for.start.6272:
%.tmp6276 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %last
%.tmp6277 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6276, i32 0, i32 1
%.tmp6278 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6277
%.tmp6279 = icmp ne %m1830$.ErrorList.type* %.tmp6278, null
br i1 %.tmp6279, label %.for.continue.6272, label %.for.end.6272
.for.continue.6272:
%.tmp6280 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %last
%.tmp6281 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6280, i32 0, i32 1
%.tmp6282 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6281
store %m1830$.ErrorList.type* %.tmp6282, %m1830$.ErrorList.type** %last
br label %.for.start.6272
.for.end.6272:
%.tmp6283 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %last
%.tmp6284 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6283, i32 0, i32 1
%.tmp6285 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
store %m1830$.ErrorList.type* %.tmp6285, %m1830$.ErrorList.type** %.tmp6284
ret void
}
define i8* @m1830$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6286 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6287 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6286, i32 0, i32 6
%.tmp6288 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6287
%.tmp6289 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6288, i32 0, i32 7
%.tmp6290 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6289
%.tmp6291 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6290, i32 0, i32 1
%.tmp6292 = load i8*, i8** %.tmp6291
ret i8* %.tmp6292
}
define %m286$.Node.type* @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6294 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6294, %m286$.Node.type** %n
br label %.for.start.6293
.for.start.6293:
%.tmp6295 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6296 = icmp ne %m286$.Node.type* %.tmp6295, null
br i1 %.tmp6296, label %.for.continue.6293, label %.for.end.6293
.for.continue.6293:
%.tmp6297 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6298 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6297, i32 0, i32 0
%.tmp6299 = load i8*, i8** %.tmp6298
%.tmp6300 = load i8*, i8** %type
%.tmp6301 = call i32(i8*,i8*) @strcmp(i8* %.tmp6299, i8* %.tmp6300)
%.tmp6302 = icmp eq i32 %.tmp6301, 0
br i1 %.tmp6302, label %.if.true.6303, label %.if.false.6303
.if.true.6303:
%.tmp6304 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6304
br label %.if.end.6303
.if.false.6303:
br label %.if.end.6303
.if.end.6303:
%.tmp6305 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6306 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6305, i32 0, i32 7
%.tmp6307 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6306
store %m286$.Node.type* %.tmp6307, %m286$.Node.type** %n
br label %.for.start.6293
.for.end.6293:
%.tmp6308 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6308
}
define %m1830$.Type.type* @m1830$syn_function_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6309 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%function_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6309, %m1830$.Type.type** %function_type
%.tmp6310 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6311 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6312 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6311, i32 0, i32 6
%.tmp6313 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6312
%.tmp6314 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6310, %m286$.Node.type* %.tmp6313)
%return_value_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6314, %m1830$.Type.type** %return_value_type
%.tmp6315 = load %m1830$.Type.type*, %m1830$.Type.type** %function_type
%.tmp6316 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6315, i32 0, i32 0
%.tmp6318 = getelementptr [9 x i8], [9 x i8]*@.str6317, i32 0, i32 0
store i8* %.tmp6318, i8** %.tmp6316
%.tmp6319 = load %m1830$.Type.type*, %m1830$.Type.type** %function_type
%.tmp6320 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6319, i32 0, i32 3
%.tmp6321 = load %m1830$.Type.type*, %m1830$.Type.type** %return_value_type
store %m1830$.Type.type* %.tmp6321, %m1830$.Type.type** %.tmp6320
%.tmp6322 = load %m1830$.Type.type*, %m1830$.Type.type** %return_value_type
%last_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6322, %m1830$.Type.type** %last_type
%.tmp6323 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6324 = call %m286$.Node.type*(%m286$.Node.type*) @m1830$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6323)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6324, %m286$.Node.type** %params
%.tmp6326 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6326, %m286$.Node.type** %param_ptr
br label %.for.start.6325
.for.start.6325:
%.tmp6327 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6328 = icmp ne %m286$.Node.type* %.tmp6327, null
br i1 %.tmp6328, label %.for.continue.6325, label %.for.end.6325
.for.continue.6325:
%.tmp6329 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6330 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6329, i32 0, i32 0
%.tmp6331 = load i8*, i8** %.tmp6330
%.tmp6333 = getelementptr [5 x i8], [5 x i8]*@.str6332, i32 0, i32 0
%.tmp6334 = call i32(i8*,i8*) @strcmp(i8* %.tmp6331, i8* %.tmp6333)
%.tmp6335 = icmp eq i32 %.tmp6334, 0
br i1 %.tmp6335, label %.if.true.6336, label %.if.false.6336
.if.true.6336:
%.tmp6337 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6338 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6337, i32 0, i32 4
%.tmp6339 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6340 = call %m1830$.Type.type*(%m1830$.Type.type*) @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp6339)
store %m1830$.Type.type* %.tmp6340, %m1830$.Type.type** %.tmp6338
%.tmp6341 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6342 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6341, i32 0, i32 4
%.tmp6343 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6342
%.tmp6344 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6343, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp6344
%.tmp6345 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6346 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6345, i32 0, i32 4
%.tmp6347 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6346
store %m1830$.Type.type* %.tmp6347, %m1830$.Type.type** %last_type
%.tmp6348 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6349 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6348, i32 0, i32 7
%.tmp6350 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6349
%.tmp6351 = icmp ne %m286$.Node.type* %.tmp6350, null
br i1 %.tmp6351, label %.if.true.6352, label %.if.false.6352
.if.true.6352:
%.tmp6353 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6354 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6353, i32 0, i32 7
%.tmp6355 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6354
store %m286$.Node.type* %.tmp6355, %m286$.Node.type** %param_ptr
br label %.if.end.6352
.if.false.6352:
br label %.if.end.6352
.if.end.6352:
%.tmp6356 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6357 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6356, i32 0, i32 7
%.tmp6358 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6357
%.tmp6359 = icmp ne %m286$.Node.type* %.tmp6358, null
br i1 %.tmp6359, label %.if.true.6360, label %.if.false.6360
.if.true.6360:
%.tmp6361 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6362 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6361, i32 0, i32 7
%.tmp6363 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6362
store %m286$.Node.type* %.tmp6363, %m286$.Node.type** %param_ptr
br label %.if.end.6360
.if.false.6360:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6360
.if.end.6360:
br label %.if.end.6336
.if.false.6336:
%.tmp6364 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6365 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6366 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6365, i32 0, i32 6
%.tmp6367 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6366
%.tmp6368 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6364, %m286$.Node.type* %.tmp6367)
%param_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6368, %m1830$.Type.type** %param_type
%.tmp6369 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6370 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6369, i32 0, i32 4
%.tmp6371 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
store %m1830$.Type.type* %.tmp6371, %m1830$.Type.type** %.tmp6370
%.tmp6372 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
store %m1830$.Type.type* %.tmp6372, %m1830$.Type.type** %last_type
%.tmp6373 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6374 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6373, i32 0, i32 7
%.tmp6375 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6374
store %m286$.Node.type* %.tmp6375, %m286$.Node.type** %param_ptr
%.tmp6376 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6377 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6376, i32 0, i32 7
%.tmp6378 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6377
%.tmp6379 = icmp ne %m286$.Node.type* %.tmp6378, null
br i1 %.tmp6379, label %.if.true.6380, label %.if.false.6380
.if.true.6380:
%.tmp6381 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6382 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6381, i32 0, i32 7
%.tmp6383 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6382
%.tmp6384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6383, i32 0, i32 7
%.tmp6385 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6384
store %m286$.Node.type* %.tmp6385, %m286$.Node.type** %param_ptr
br label %.if.end.6380
.if.false.6380:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6380
.if.end.6380:
br label %.if.end.6336
.if.end.6336:
br label %.for.start.6325
.for.end.6325:
%.tmp6386 = load %m1830$.Type.type*, %m1830$.Type.type** %function_type
ret %m1830$.Type.type* %.tmp6386
}
define %m286$.Node.type* @m1830$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6387 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6389 = getelementptr [10 x i8], [10 x i8]*@.str6388, i32 0, i32 0
%.tmp6390 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6387, i8* %.tmp6389)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6390, %m286$.Node.type** %params
%.tmp6391 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6392 = icmp eq %m286$.Node.type* %.tmp6391, null
br i1 %.tmp6392, label %.if.true.6393, label %.if.false.6393
.if.true.6393:
%.tmp6394 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6394
br label %.if.end.6393
.if.false.6393:
br label %.if.end.6393
.if.end.6393:
%.tmp6395 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6396 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6395, i32 0, i32 6
%.tmp6397 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6396
ret %m286$.Node.type* %.tmp6397
}
define %m1830$.Type.type* @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6398 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6398, %m1830$.Type.type** %t
%.tmp6399 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6400 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6399, i32 0, i32 0
%.tmp6401 = load i8*, i8** %.tmp6400
%.tmp6403 = getelementptr [10 x i8], [10 x i8]*@.str6402, i32 0, i32 0
%.tmp6404 = call i32(i8*,i8*) @strcmp(i8* %.tmp6401, i8* %.tmp6403)
%.tmp6405 = icmp eq i32 %.tmp6404, 0
br i1 %.tmp6405, label %.if.true.6406, label %.if.false.6406
.if.true.6406:
%.tmp6407 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6408 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6407, i32 0, i32 0
%.tmp6410 = getelementptr [7 x i8], [7 x i8]*@.str6409, i32 0, i32 0
store i8* %.tmp6410, i8** %.tmp6408
%.tmp6411 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6412 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6411, i32 0, i32 1
store i8* null, i8** %.tmp6412
%.tmp6413 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6414 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6413, i32 0, i32 6
%.tmp6415 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6414
%.tmp6417 = getelementptr [5 x i8], [5 x i8]*@.str6416, i32 0, i32 0
%.tmp6418 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6415, i8* %.tmp6417)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6418, %m286$.Node.type** %curr_type
%.tmp6419 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6420 = icmp ne %m286$.Node.type* %.tmp6419, null
br i1 %.tmp6420, label %.if.true.6421, label %.if.false.6421
.if.true.6421:
%.tmp6422 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6423 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6422, i32 0, i32 3
%.tmp6424 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6425 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6426 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6425, i32 0, i32 6
%.tmp6427 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6426
%.tmp6428 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6424, %m286$.Node.type* %.tmp6427)
store %m1830$.Type.type* %.tmp6428, %m1830$.Type.type** %.tmp6423
%.tmp6429 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6430 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6429, i32 0, i32 3
%.tmp6431 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6430
%.tmp6432 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6431, i32 0, i32 1
%.tmp6433 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6434 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6433, i32 0, i32 7
%.tmp6435 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6434
%.tmp6436 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6435, i32 0, i32 1
%.tmp6437 = load i8*, i8** %.tmp6436
store i8* %.tmp6437, i8** %.tmp6432
%.tmp6438 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6439 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6438, i32 0, i32 3
%.tmp6440 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6439
%curr_t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6440, %m1830$.Type.type** %curr_t
%.tmp6442 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6443 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6442, i32 0, i32 7
%.tmp6444 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6443
%.tmp6446 = getelementptr [5 x i8], [5 x i8]*@.str6445, i32 0, i32 0
%.tmp6447 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6444, i8* %.tmp6446)
store %m286$.Node.type* %.tmp6447, %m286$.Node.type** %curr_type
br label %.for.start.6441
.for.start.6441:
%.tmp6448 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6449 = icmp ne %m286$.Node.type* %.tmp6448, null
br i1 %.tmp6449, label %.for.continue.6441, label %.for.end.6441
.for.continue.6441:
%.tmp6450 = load %m1830$.Type.type*, %m1830$.Type.type** %curr_t
%.tmp6451 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6450, i32 0, i32 4
%.tmp6452 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6453 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6454 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6453, i32 0, i32 6
%.tmp6455 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6454
%.tmp6456 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6452, %m286$.Node.type* %.tmp6455)
store %m1830$.Type.type* %.tmp6456, %m1830$.Type.type** %.tmp6451
%.tmp6457 = load %m1830$.Type.type*, %m1830$.Type.type** %curr_t
%.tmp6458 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6457, i32 0, i32 4
%.tmp6459 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6458
%.tmp6460 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6459, i32 0, i32 1
%.tmp6461 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6462 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6461, i32 0, i32 7
%.tmp6463 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6462
%.tmp6464 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6463, i32 0, i32 1
%.tmp6465 = load i8*, i8** %.tmp6464
store i8* %.tmp6465, i8** %.tmp6460
%.tmp6466 = load %m1830$.Type.type*, %m1830$.Type.type** %curr_t
%.tmp6467 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6466, i32 0, i32 4
%.tmp6468 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6467
store %m1830$.Type.type* %.tmp6468, %m1830$.Type.type** %curr_t
%.tmp6469 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6470 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6469, i32 0, i32 7
%.tmp6471 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6470
%.tmp6473 = getelementptr [5 x i8], [5 x i8]*@.str6472, i32 0, i32 0
%.tmp6474 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6471, i8* %.tmp6473)
store %m286$.Node.type* %.tmp6474, %m286$.Node.type** %curr_type
br label %.for.start.6441
.for.end.6441:
br label %.if.end.6421
.if.false.6421:
br label %.if.end.6421
.if.end.6421:
br label %.if.end.6406
.if.false.6406:
%.tmp6475 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6476 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6475, i32 0, i32 0
%.tmp6477 = load i8*, i8** %.tmp6476
%.tmp6479 = getelementptr [5 x i8], [5 x i8]*@.str6478, i32 0, i32 0
%.tmp6480 = call i32(i8*,i8*) @strcmp(i8* %.tmp6477, i8* %.tmp6479)
%.tmp6481 = icmp eq i32 %.tmp6480, 0
br i1 %.tmp6481, label %.if.true.6482, label %.if.false.6482
.if.true.6482:
%.tmp6483 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6484 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6483, i32 0, i32 0
%.tmp6485 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6486 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6485, i32 0, i32 1
%.tmp6487 = load i8*, i8** %.tmp6486
store i8* %.tmp6487, i8** %.tmp6484
br label %.if.end.6482
.if.false.6482:
%.tmp6488 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6489 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6488, i32 0, i32 0
%.tmp6490 = load i8*, i8** %.tmp6489
%.tmp6492 = getelementptr [12 x i8], [12 x i8]*@.str6491, i32 0, i32 0
%.tmp6493 = call i32(i8*,i8*) @strcmp(i8* %.tmp6490, i8* %.tmp6492)
%.tmp6494 = icmp eq i32 %.tmp6493, 0
br i1 %.tmp6494, label %.if.true.6495, label %.if.false.6495
.if.true.6495:
%err_msg = alloca i8*
%.tmp6496 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6497 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6498 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$find_defined.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6496, %m286$.Node.type* %.tmp6497)
%base = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp6498, %m1830$.ScopeItem.type** %base
%.tmp6499 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6500 = icmp eq %m1830$.ScopeItem.type* %.tmp6499, null
br i1 %.tmp6500, label %.if.true.6501, label %.if.false.6501
.if.true.6501:
%.tmp6502 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6504 = getelementptr [37 x i8], [37 x i8]*@.str6503, i32 0, i32 0
%.tmp6505 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6506 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6505, i32 0, i32 6
%.tmp6507 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6506
%.tmp6508 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6507, i32 0, i32 1
%.tmp6509 = load i8*, i8** %.tmp6508
%.tmp6510 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6502, i8* %.tmp6504, i8* %.tmp6509)
%.tmp6511 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6512 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6513 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp6511, %m286$.Node.type* %.tmp6512, i8* %.tmp6513)
%.tmp6514 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6515 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6514, i32 0, i32 0
%.tmp6517 = getelementptr [6 x i8], [6 x i8]*@.str6516, i32 0, i32 0
store i8* %.tmp6517, i8** %.tmp6515
%.tmp6518 = load %m1830$.Type.type*, %m1830$.Type.type** %t
ret %m1830$.Type.type* %.tmp6518
br label %.if.end.6501
.if.false.6501:
br label %.if.end.6501
.if.end.6501:
%.tmp6519 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6520 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6519, i32 0, i32 0
%.tmp6522 = getelementptr [10 x i8], [10 x i8]*@.str6521, i32 0, i32 0
store i8* %.tmp6522, i8** %.tmp6520
%.tmp6523 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6524 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6523, i32 0, i32 1
%.tmp6525 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6526 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp6525, i32 0, i32 0
%.tmp6527 = load i8*, i8** %.tmp6526
store i8* %.tmp6527, i8** %.tmp6524
%.tmp6528 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6529 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6528, i32 0, i32 2
%.tmp6530 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6531 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp6530, i32 0, i32 1
%.tmp6532 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp6531
%.tmp6533 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6532, i32 0, i32 0
%.tmp6534 = load i8*, i8** %.tmp6533
store i8* %.tmp6534, i8** %.tmp6529
%.tmp6535 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6536 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6535, i32 0, i32 3
%.tmp6537 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6538 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp6537, i32 0, i32 1
%.tmp6539 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp6538
%.tmp6540 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6539, i32 0, i32 3
%.tmp6541 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6540
store %m1830$.Type.type* %.tmp6541, %m1830$.Type.type** %.tmp6536
br label %.if.end.6495
.if.false.6495:
%.tmp6542 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6543 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6542, i32 0, i32 1
%.tmp6544 = load i8*, i8** %.tmp6543
%.tmp6546 = getelementptr [4 x i8], [4 x i8]*@.str6545, i32 0, i32 0
%.tmp6547 = call i32(i8*,i8*) @strcmp(i8* %.tmp6544, i8* %.tmp6546)
%.tmp6548 = icmp eq i32 %.tmp6547, 0
br i1 %.tmp6548, label %.if.true.6549, label %.if.false.6549
.if.true.6549:
%.tmp6550 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6551 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6550, i32 0, i32 0
%.tmp6553 = getelementptr [7 x i8], [7 x i8]*@.str6552, i32 0, i32 0
store i8* %.tmp6553, i8** %.tmp6551
br label %.if.end.6549
.if.false.6549:
%.tmp6554 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6555 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6557 = getelementptr [54 x i8], [54 x i8]*@.str6556, i32 0, i32 0
%.tmp6558 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp6554, %m286$.Node.type* %.tmp6555, i8* %.tmp6557)
%.tmp6559 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6560 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6559, i32 0, i32 0
%.tmp6561 = load i8*, i8** %.tmp6560
%.tmp6562 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6563 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6562, i32 0, i32 1
%.tmp6564 = load i8*, i8** %.tmp6563
%.tmp6565 = call i32(i8*,...) @printf(i8* %.tmp6558, i8* %.tmp6561, i8* %.tmp6564)
br label %.if.end.6549
.if.end.6549:
br label %.if.end.6495
.if.end.6495:
br label %.if.end.6482
.if.end.6482:
br label %.if.end.6406
.if.end.6406:
%.tmp6567 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6568 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6567, i32 0, i32 7
%.tmp6569 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6568
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6569, %m286$.Node.type** %ptr
br label %.for.start.6566
.for.start.6566:
%.tmp6570 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6571 = icmp ne %m286$.Node.type* %.tmp6570, null
br i1 %.tmp6571, label %.for.continue.6566, label %.for.end.6566
.for.continue.6566:
%.tmp6572 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%pt = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6572, %m1830$.Type.type** %pt
%.tmp6573 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp6574 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6573, i32 0, i32 0
%.tmp6576 = getelementptr [4 x i8], [4 x i8]*@.str6575, i32 0, i32 0
store i8* %.tmp6576, i8** %.tmp6574
%.tmp6577 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp6578 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6577, i32 0, i32 3
%.tmp6579 = load %m1830$.Type.type*, %m1830$.Type.type** %t
store %m1830$.Type.type* %.tmp6579, %m1830$.Type.type** %.tmp6578
%.tmp6580 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
store %m1830$.Type.type* %.tmp6580, %m1830$.Type.type** %t
%.tmp6581 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6582 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6581, i32 0, i32 7
%.tmp6583 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6582
store %m286$.Node.type* %.tmp6583, %m286$.Node.type** %ptr
br label %.for.start.6566
.for.end.6566:
%.tmp6584 = load %m1830$.Type.type*, %m1830$.Type.type** %t
ret %m1830$.Type.type* %.tmp6584
}
@.str2295 = constant [5 x i8] c"%s{\0A\00"
@.str2299 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2306 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2313 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2325 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2329 = constant [10 x i8] c"%s  of: \0A\00"
@.str2343 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2347 = constant [12 x i8] c"%s  next: \0A\00"
@.str2356 = constant [5 x i8] c"%s}\0A\00"
@.str2414 = constant [5 x i8] c"%c%s\00"
@.str2425 = constant [7 x i8] c".tmp%d\00"
@.str2503 = constant [1 x i8] c"\00"
@.str2533 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2564 = constant [6 x i8] c"start\00"
@.str2576 = constant [6 x i8] c"start\00"
@.str2588 = constant [13 x i8] c"head_comment\00"
@.str2712 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2725 = constant [7 x i8] c"string\00"
@.str2738 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2766 = constant [5 x i8] c"%s%s\00"
@.str2774 = constant [9 x i8] c"function\00"
@.str2780 = constant [5 x i8] c"main\00"
@.str2792 = constant [6 x i8] c"%s.%s\00"
@.str2809 = constant [3 x i8] c"NL\00"
@.str2817 = constant [7 x i8] c"global\00"
@.str2825 = constant [11 x i8] c"assignable\00"
@.str2853 = constant [9 x i8] c"variable\00"
@.str2864 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2879 = constant [10 x i8] c"typealias\00"
@.str2899 = constant [11 x i8] c"%s.%s.type\00"
@.str2911 = constant [10 x i8] c"typealias\00"
@.str2932 = constant [5 x i8] c"type\00"
@.str2959 = constant [14 x i8] c"%s = type %s\0A\00"
@.str2972 = constant [7 x i8] c"extern\00"
@.str2990 = constant [7 x i8] c"extern\00"
@.str3046 = constant [15 x i8] c"declare %s %s(\00"
@.str3077 = constant [3 x i8] c", \00"
@.str3083 = constant [3 x i8] c"%s\00"
@.str3095 = constant [3 x i8] c")\0A\00"
@.str3106 = constant [9 x i8] c"function\00"
@.str3115 = constant [9 x i8] c"function\00"
@.str3171 = constant [14 x i8] c"define %s %s(\00"
@.str3197 = constant [3 x i8] c", \00"
@.str3203 = constant [5 x i8] c"type\00"
@.str3219 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3234 = constant [5 x i8] c") {\0A\00"
@.str3243 = constant [6 x i8] c"block\00"
@.str3261 = constant [3 x i8] c"NL\00"
@.str3268 = constant [9 x i8] c"OPERATOR\00"
@.str3286 = constant [7 x i8] c"return\00"
@.str3296 = constant [5 x i8] c"void\00"
@.str3303 = constant [21 x i8] c"missing return value\00"
@.str3308 = constant [10 x i8] c"ret void\0A\00"
@.str3314 = constant [3 x i8] c"}\0A\00"
@.str3320 = constant [7 x i8] c"import\00"
@.str3365 = constant [1 x i8] c"\00"
@.str3371 = constant [6 x i8] c"%s.bn\00"
@.str3376 = constant [9 x i8] c"%s/%s.bn\00"
@.str3388 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3445 = constant [5 x i8] c"m%d$\00"
@.str3494 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3502 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3531 = constant [9 x i8] c"variable\00"
@.str3536 = constant [5 x i8] c"type\00"
@.str3566 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3578 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3599 = constant [11 x i8] c"expression\00"
@.str3626 = constant [7 x i8] c"sizeof\00"
@.str3632 = constant [8 x i8] c"fn_args\00"
@.str3638 = constant [11 x i8] c"assignable\00"
@.str3663 = constant [4 x i8] c"int\00"
@.str3674 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3683 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3709 = constant [35 x i8] c"unable to compile function address\00"
@.str3715 = constant [8 x i8] c"fn_args\00"
@.str3718 = constant [1 x i8] c"\00"
@.str3726 = constant [11 x i8] c"assignable\00"
@.str3738 = constant [5 x i8] c"%s, \00"
@.str3754 = constant [8 x i8] c"%s%s %s\00"
@.str3769 = constant [11 x i8] c"assignable\00"
@.str3779 = constant [5 x i8] c"void\00"
@.str3787 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str3818 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str3839 = constant [7 x i8] c"return\00"
@.str3851 = constant [3 x i8] c"NL\00"
@.str3869 = constant [11 x i8] c"ret %s %s\0A\00"
@.str3882 = constant [10 x i8] c"ret void\0A\00"
@.str3886 = constant [3 x i8] c"NL\00"
@.str3892 = constant [8 x i8] c"fn_call\00"
@.str3903 = constant [12 x i8] c"declaration\00"
@.str3912 = constant [11 x i8] c"assignment\00"
@.str3920 = constant [11 x i8] c"assignable\00"
@.str3932 = constant [34 x i8] c"%s was not declared in this scope\00"
@.str3964 = constant [4 x i8] c"ptr\00"
@.str3973 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str3983 = constant [9 x i8] c"if_block\00"
@.str3991 = constant [9 x i8] c"for_loop\00"
@.str4000 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4015 = constant [12 x i8] c"declaration\00"
@.str4026 = constant [11 x i8] c"assignment\00"
@.str4036 = constant [9 x i8] c"OPERATOR\00"
@.str4043 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4053 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4060 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4067 = constant [9 x i8] c"OPERATOR\00"
@.str4079 = constant [57 x i8] c"br %s %s, label %%.for.continue.%d, label %%.for.end.%d\0A\00"
@.str4094 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4101 = constant [9 x i8] c"OPERATOR\00"
@.str4108 = constant [6 x i8] c"block\00"
@.str4122 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4129 = constant [14 x i8] c".for.end.%d:\0A\00"
@.str4140 = constant [5 x i8] c"type\00"
@.str4155 = constant [11 x i8] c"assignable\00"
@.str4168 = constant [9 x i8] c"variable\00"
@.str4173 = constant [5 x i8] c"WORD\00"
@.str4181 = constant [31 x i8] c"unable to get declaration name\00"
@.str4233 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4249 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4261 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4278 = constant [11 x i8] c"assignable\00"
@.str4292 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4307 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4314 = constant [6 x i8] c"block\00"
@.str4322 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4329 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4336 = constant [11 x i8] c"elif_block\00"
@.str4347 = constant [11 x i8] c"else_block\00"
@.str4357 = constant [6 x i8] c"block\00"
@.str4367 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4374 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4394 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4402 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4451 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4472 = constant [7 x i8] c"module\00"
@.str4501 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str4543 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str4551 = constant [9 x i8] c"function\00"
@.str4558 = constant [7 x i8] c"extern\00"
@.str4570 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str4591 = constant [9 x i8] c"variable\00"
@.str4611 = constant [4 x i8] c"ptr\00"
@.str4629 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str4653 = constant [10 x i8] c"typealias\00"
@.str4664 = constant [7 x i8] c"struct\00"
@.str4670 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str4721 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str4741 = constant [9 x i8] c"variable\00"
@.str4751 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4772 = constant [9 x i8] c"variable\00"
@.str4780 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str4792 = constant [12 x i8] c"destination\00"
@.str4797 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str4823 = constant [25 x i8] c"name '%s' is not defined\00"
@.str4841 = constant [7 x i8] c"module\00"
@.str4863 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str4927 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str4947 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str4970 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str4993 = constant [16 x i8] c"mono_assignable\00"
@.str5015 = constant [5 x i8] c"cast\00"
@.str5024 = constant [5 x i8] c"type\00"
@.str5039 = constant [26 x i8] c"%s = bitcast %s %s to %s\0A\00"
@.str5064 = constant [16 x i8] c"mono_assignable\00"
@.str5122 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5145 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5152 = constant [2 x i8] c"+\00"
@.str5157 = constant [4 x i8] c"add\00"
@.str5162 = constant [2 x i8] c"-\00"
@.str5167 = constant [4 x i8] c"sub\00"
@.str5172 = constant [2 x i8] c"*\00"
@.str5177 = constant [4 x i8] c"mul\00"
@.str5182 = constant [2 x i8] c"/\00"
@.str5187 = constant [5 x i8] c"sdiv\00"
@.str5192 = constant [3 x i8] c"==\00"
@.str5197 = constant [8 x i8] c"icmp eq\00"
@.str5202 = constant [3 x i8] c"!=\00"
@.str5207 = constant [8 x i8] c"icmp ne\00"
@.str5212 = constant [2 x i8] c">\00"
@.str5217 = constant [9 x i8] c"icmp sgt\00"
@.str5222 = constant [2 x i8] c"<\00"
@.str5227 = constant [9 x i8] c"icmp slt\00"
@.str5232 = constant [2 x i8] c"&\00"
@.str5237 = constant [4 x i8] c"and\00"
@.str5242 = constant [2 x i8] c"|\00"
@.str5247 = constant [3 x i8] c"or\00"
@.str5252 = constant [3 x i8] c">=\00"
@.str5257 = constant [9 x i8] c"icmp sge\00"
@.str5262 = constant [3 x i8] c"<=\00"
@.str5267 = constant [9 x i8] c"icmp sle\00"
@.str5271 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5278 = constant [4 x i8] c"add\00"
@.str5284 = constant [3 x i8] c"==\00"
@.str5291 = constant [3 x i8] c"!=\00"
@.str5299 = constant [2 x i8] c"|\00"
@.str5307 = constant [2 x i8] c"&\00"
@.str5315 = constant [2 x i8] c">\00"
@.str5323 = constant [2 x i8] c"<\00"
@.str5331 = constant [3 x i8] c">=\00"
@.str5339 = constant [3 x i8] c"<=\00"
@.str5347 = constant [5 x i8] c"bool\00"
@.str5351 = constant [4 x i8] c"int\00"
@.str5361 = constant [7 x i8] c"NUMBER\00"
@.str5375 = constant [4 x i8] c"int\00"
@.str5389 = constant [5 x i8] c"WORD\00"
@.str5399 = constant [5 x i8] c"null\00"
@.str5406 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5420 = constant [5 x i8] c"null\00"
@.str5429 = constant [8 x i8] c"nullptr\00"
@.str5436 = constant [17 x i8] c"addr_destination\00"
@.str5448 = constant [12 x i8] c"destination\00"
@.str5487 = constant [4 x i8] c"ptr\00"
@.str5506 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str5518 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5532 = constant [8 x i8] c"boolean\00"
@.str5546 = constant [5 x i8] c"bool\00"
@.str5555 = constant [6 x i8] c"false\00"
@.str5562 = constant [2 x i8] c"0\00"
@.str5566 = constant [2 x i8] c"1\00"
@.str5573 = constant [8 x i8] c"fn_call\00"
@.str5590 = constant [7 x i8] c"STRING\00"
@.str5614 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str5630 = constant [4 x i8] c"ptr\00"
@.str5643 = constant [4 x i8] c"chr\00"
@.str5650 = constant [4 x i8] c"CHR\00"
@.str5665 = constant [2 x i8] c"0\00"
@.str5675 = constant [6 x i8] c"'\5C%x'\00"
@.str5682 = constant [3 x i8] c"%d\00"
@.str5694 = constant [5 x i8] c"'%c'\00"
@.str5701 = constant [3 x i8] c"%d\00"
@.str5706 = constant [18 x i8] c"Invalid character\00"
@.str5719 = constant [4 x i8] c"chr\00"
@.str5723 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str5751 = constant [22 x i8] c"called 'abbr' on null\00"
@.str5757 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str5762 = constant [4 x i8] c"int\00"
@.str5767 = constant [2 x i8] c"i\00"
@.str5772 = constant [5 x i8] c"bool\00"
@.str5777 = constant [2 x i8] c"b\00"
@.str5782 = constant [5 x i8] c"void\00"
@.str5787 = constant [2 x i8] c"v\00"
@.str5792 = constant [4 x i8] c"chr\00"
@.str5797 = constant [2 x i8] c"c\00"
@.str5802 = constant [4 x i8] c"str\00"
@.str5807 = constant [3 x i8] c"cp\00"
@.str5812 = constant [4 x i8] c"ptr\00"
@.str5818 = constant [4 x i8] c"%sp\00"
@.str5829 = constant [10 x i8] c"typealias\00"
@.str5840 = constant [6 x i8] c"error\00"
@.str5845 = constant [2 x i8] c"?\00"
@.str5847 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str5883 = constant [7 x i8] c".str%d\00"
@.str5898 = constant [6 x i8] c"array\00"
@.str5911 = constant [4 x i8] c"chr\00"
@.str5929 = constant [3 x i8] c"%d\00"
@.str5943 = constant [7 x i8] c"string\00"
@.str5962 = constant [7 x i8] c"module\00"
@.str5996 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6002 = constant [2 x i8] c"?\00"
@.str6008 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6013 = constant [4 x i8] c"int\00"
@.str6018 = constant [4 x i8] c"i32\00"
@.str6023 = constant [5 x i8] c"void\00"
@.str6028 = constant [5 x i8] c"void\00"
@.str6033 = constant [5 x i8] c"bool\00"
@.str6038 = constant [3 x i8] c"i1\00"
@.str6043 = constant [8 x i8] c"nullptr\00"
@.str6048 = constant [4 x i8] c"ptr\00"
@.str6053 = constant [4 x i8] c"chr\00"
@.str6058 = constant [3 x i8] c"i8\00"
@.str6063 = constant [9 x i8] c"function\00"
@.str6069 = constant [4 x i8] c"%s(\00"
@.str6094 = constant [4 x i8] c"%s,\00"
@.str6099 = constant [5 x i8] c"%s%s\00"
@.str6110 = constant [4 x i8] c"%s)\00"
@.str6118 = constant [4 x i8] c"ptr\00"
@.str6124 = constant [4 x i8] c"%s*\00"
@.str6136 = constant [7 x i8] c"struct\00"
@.str6142 = constant [2 x i8] c"{\00"
@.str6158 = constant [4 x i8] c"%s,\00"
@.str6163 = constant [5 x i8] c"%s%s\00"
@.str6174 = constant [4 x i8] c"%s}\00"
@.str6182 = constant [6 x i8] c"array\00"
@.str6188 = constant [10 x i8] c"[%s x %s]\00"
@.str6207 = constant [10 x i8] c"typealias\00"
@.str6213 = constant [5 x i8] c"%%%s\00"
@.str6223 = constant [4 x i8] c"str\00"
@.str6228 = constant [4 x i8] c"i8*\00"
@.str6233 = constant [7 x i8] c"vararg\00"
@.str6238 = constant [4 x i8] c"...\00"
@.str6243 = constant [6 x i8] c"error\00"
@.str6248 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6317 = constant [9 x i8] c"function\00"
@.str6332 = constant [5 x i8] c"WORD\00"
@.str6388 = constant [10 x i8] c"fn_params\00"
@.str6402 = constant [10 x i8] c"structdef\00"
@.str6409 = constant [7 x i8] c"struct\00"
@.str6416 = constant [5 x i8] c"type\00"
@.str6445 = constant [5 x i8] c"type\00"
@.str6472 = constant [5 x i8] c"type\00"
@.str6478 = constant [5 x i8] c"WORD\00"
@.str6491 = constant [12 x i8] c"dotted_name\00"
@.str6503 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6516 = constant [6 x i8] c"error\00"
@.str6521 = constant [10 x i8] c"typealias\00"
@.str6545 = constant [4 x i8] c"...\00"
@.str6552 = constant [7 x i8] c"vararg\00"
@.str6556 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str6575 = constant [4 x i8] c"ptr\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6585 = load i32, i32* %argc
%.tmp6586 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp6585, i8** %.tmp6586)
%.tmp6587 = load i32, i32* @STDERR
%.tmp6589 = getelementptr [2 x i8], [2 x i8]*@.str6588, i32 0, i32 0
%.tmp6590 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp6587, i8* %.tmp6589)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6590, %m0$.File.type** %stderr
%.tmp6591 = load i8**, i8*** %argv
%.tmp6592 = getelementptr i8*, i8** %.tmp6591, i32 1
%.tmp6593 = load i8*, i8** %.tmp6592
%filename = alloca i8*
store i8* %.tmp6593, i8** %filename
%.tmp6594 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6594, %m0$.File.type** %llvm_code
%.tmp6595 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6596 = load i8*, i8** %filename
%.tmp6597 = call %m1830$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1830$new_context.m1830$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp6595, i8* %.tmp6596)
%compiler_ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.tmp6597, %m1830$.CompilerCtx.type** %compiler_ctx
%.tmp6598 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %compiler_ctx
%.tmp6599 = load i8*, i8** %filename
%.tmp6600 = call i1(%m1830$.CompilerCtx.type*,i8*) @m1830$compile_file.b.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp6598, i8* %.tmp6599)
br i1 %.tmp6600, label %.if.true.6601, label %.if.false.6601
.if.true.6601:
%.tmp6602 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6604 = getelementptr [34 x i8], [34 x i8]*@.str6603, i32 0, i32 0
%.tmp6605 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6602, i8* %.tmp6604)
ret i32 1
br label %.if.end.6601
.if.false.6601:
br label %.if.end.6601
.if.end.6601:
%.tmp6606 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6607 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp6606)
%.tmp6608 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6609 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp6608)
%llvm_code_size = alloca i32
store i32 %.tmp6609, i32* %llvm_code_size
%.tmp6610 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6610)
%.tmp6612 = getelementptr [29 x i8], [29 x i8]*@.str6611, i32 0, i32 0
%.tmp6614 = getelementptr [2 x i8], [2 x i8]*@.str6613, i32 0, i32 0
%.tmp6615 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6612, i8* %.tmp6614)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6615, %m0$.File.type** %proc
%.tmp6616 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6617 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6616)
%.tmp6618 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6619 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6618)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp6617, i32 %.tmp6619)
%.tmp6620 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6621 = icmp eq %m0$.File.type* %.tmp6620, null
br i1 %.tmp6621, label %.if.true.6622, label %.if.false.6622
.if.true.6622:
%.tmp6623 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6625 = getelementptr [28 x i8], [28 x i8]*@.str6624, i32 0, i32 0
%.tmp6626 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6623, i8* %.tmp6625)
ret i32 0
br label %.if.end.6622
.if.false.6622:
br label %.if.end.6622
.if.end.6622:
%.tmp6627 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6628 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6627)
%.tmp6629 = icmp ne i32 %.tmp6628, 0
br i1 %.tmp6629, label %.if.true.6630, label %.if.false.6630
.if.true.6630:
%.tmp6631 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6633 = getelementptr [24 x i8], [24 x i8]*@.str6632, i32 0, i32 0
%.tmp6634 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6631, i8* %.tmp6633)
ret i32 0
br label %.if.end.6630
.if.false.6630:
br label %.if.end.6630
.if.end.6630:
%.tmp6636 = getelementptr [17 x i8], [17 x i8]*@.str6635, i32 0, i32 0
%.tmp6638 = getelementptr [2 x i8], [2 x i8]*@.str6637, i32 0, i32 0
%.tmp6639 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6636, i8* %.tmp6638)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6639, %m0$.File.type** %gcc_proc
%.tmp6640 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp6641 = icmp eq %m0$.File.type* %.tmp6640, null
br i1 %.tmp6641, label %.if.true.6642, label %.if.false.6642
.if.true.6642:
%.tmp6643 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6645 = getelementptr [28 x i8], [28 x i8]*@.str6644, i32 0, i32 0
%.tmp6646 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6643, i8* %.tmp6645)
ret i32 0
br label %.if.end.6642
.if.false.6642:
br label %.if.end.6642
.if.end.6642:
%.tmp6647 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6648 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6647)
%.tmp6649 = icmp ne i32 %.tmp6648, 0
br i1 %.tmp6649, label %.if.true.6650, label %.if.false.6650
.if.true.6650:
%.tmp6651 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6653 = getelementptr [23 x i8], [23 x i8]*@.str6652, i32 0, i32 0
%.tmp6654 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6651, i8* %.tmp6653)
br label %.if.end.6650
.if.false.6650:
%.tmp6656 = getelementptr [32 x i8], [32 x i8]*@.str6655, i32 0, i32 0
%.tmp6657 = load i8*, i8** %filename
%.tmp6658 = call i32(i8*,...) @printf(i8* %.tmp6656, i8* %.tmp6657)
br label %.if.end.6650
.if.end.6650:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6659 = load i32, i32* %argc
%.tmp6660 = icmp eq i32 %.tmp6659, 2
br i1 %.tmp6660, label %.if.true.6661, label %.if.false.6661
.if.true.6661:
ret void
br label %.if.end.6661
.if.false.6661:
br label %.if.end.6661
.if.end.6661:
%.tmp6663 = getelementptr [21 x i8], [21 x i8]*@.str6662, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp6663, i8** %tmpl
%.tmp6664 = load i8**, i8*** %argv
%.tmp6665 = getelementptr i8*, i8** %.tmp6664, i32 0
%.tmp6666 = load i8*, i8** %.tmp6665
%.tmp6667 = call i32(i8*) @strlen(i8* %.tmp6666)
%.tmp6668 = load i8*, i8** %tmpl
%.tmp6669 = call i32(i8*) @strlen(i8* %.tmp6668)
%.tmp6670 = add i32 %.tmp6667, %.tmp6669
%len_filename = alloca i32
store i32 %.tmp6670, i32* %len_filename
%.tmp6671 = load i32, i32* %len_filename
%.tmp6672 = call i8*(i32) @malloc(i32 %.tmp6671)
%buf = alloca i8*
store i8* %.tmp6672, i8** %buf
%.tmp6673 = load i8*, i8** %buf
%.tmp6674 = load i8*, i8** %tmpl
%.tmp6675 = load i8**, i8*** %argv
%.tmp6676 = getelementptr i8*, i8** %.tmp6675, i32 0
%.tmp6677 = load i8*, i8** %.tmp6676
%.tmp6678 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp6673, i8* %.tmp6674, i8* %.tmp6677)
%.tmp6679 = load i8*, i8** %buf
%.tmp6680 = call i32(i8*) @puts(i8* %.tmp6679)
%.tmp6681 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp6681)
call void(i32) @exit(i32 1)
ret void
}
@.str6588 = constant [2 x i8] c"w\00"
@.str6603 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str6611 = constant [29 x i8] c"tee debug.ll | llc - > out.s\00"
@.str6613 = constant [2 x i8] c"w\00"
@.str6624 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6632 = constant [24 x i8] c"error on llc execution\0A\00"
@.str6635 = constant [17 x i8] c"gcc out.s -o out\00"
@.str6637 = constant [2 x i8] c"w\00"
@.str6644 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6652 = constant [23 x i8] c"error on gcc execution\00"
@.str6655 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str6662 = constant [21 x i8] c"Usage: %s <filename>\00"
