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
declare i8 @toupper(i8)
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
store i32 0, i32* %end_idx
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
%.tmp434 = getelementptr [15 x i8], [15 x i8]*@.str433, i32 0, i32 0
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
store i32 0, i32* %idx
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
@.str433 = constant [15 x i8] c"WORD too large\00"
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
%.tmp718 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp719 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp718, i32 0, i32 4
%.tmp720 = load i8*, i8** %.tmp719
%.tmp721 = bitcast i8* %.tmp720 to i8*
%.tmp722 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp723 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp722, i32 0, i32 2
%.tmp724 = load i32, i32* %.tmp723
%.tmp725 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp726 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp725, i32 0, i32 3
%.tmp727 = load i32, i32* %.tmp726
%.tmp728 = load i8*, i8** %message
%.tmp729 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp721, i32 %.tmp724, i32 %.tmp727, i8* %.tmp728)
ret %m717$.Error.type* %.tmp729
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
%.tmp730 = load i32, i32* @Error_size
%.tmp731 = call i8*(i32) @malloc(i32 %.tmp730)
%.tmp732 = bitcast i8* %.tmp731 to %m717$.Error.type*
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp732, %m717$.Error.type** %e
%.tmp733 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp734 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp733, i32 0, i32 0
%.tmp735 = load i32, i32* %line
store i32 %.tmp735, i32* %.tmp734
%.tmp736 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp737 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp736, i32 0, i32 1
%.tmp738 = load i32, i32* %char_of_line
store i32 %.tmp738, i32* %.tmp737
%.tmp739 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp740 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp739, i32 0, i32 3
%.tmp741 = load i8*, i8** %message
store i8* %.tmp741, i8** %.tmp740
%.tmp742 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp743 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp742, i32 0, i32 2
%.tmp744 = load i8*, i8** %filename
store i8* %.tmp744, i8** %.tmp743
%.tmp745 = load %m717$.Error.type*, %m717$.Error.type** %e
ret %m717$.Error.type* %.tmp745
}
define void @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.e.arg) {
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp747 = getelementptr [22 x i8], [22 x i8]*@.str746, i32 0, i32 0
%.tmp748 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp749 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp748, i32 0, i32 2
%.tmp750 = load i8*, i8** %.tmp749
%.tmp751 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp752 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp751, i32 0, i32 0
%.tmp753 = load i32, i32* %.tmp752
%.tmp754 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp755 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp754, i32 0, i32 1
%.tmp756 = load i32, i32* %.tmp755
%.tmp757 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp758 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp757, i32 0, i32 3
%.tmp759 = load i8*, i8** %.tmp758
%.tmp760 = call i32(i8*,...) @printf(i8* %.tmp747, i8* %.tmp750, i32 %.tmp753, i32 %.tmp756, i8* %.tmp759)
ret void
}
define void @m717$freport.v.m0$.File.typep.m717$.Error.typep(%m0$.File.type* %.fd.arg, %m717$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp761 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp763 = getelementptr [22 x i8], [22 x i8]*@.str762, i32 0, i32 0
%.tmp764 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp765 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp764, i32 0, i32 2
%.tmp766 = load i8*, i8** %.tmp765
%.tmp767 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp768 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp767, i32 0, i32 0
%.tmp769 = load i32, i32* %.tmp768
%.tmp770 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp771 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp770, i32 0, i32 1
%.tmp772 = load i32, i32* %.tmp771
%.tmp773 = load %m717$.Error.type*, %m717$.Error.type** %e
%.tmp774 = getelementptr %m717$.Error.type, %m717$.Error.type* %.tmp773, i32 0, i32 3
%.tmp775 = load i8*, i8** %.tmp774
%.tmp776 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp761, i8* %.tmp763, i8* %.tmp766, i32 %.tmp769, i32 %.tmp772, i8* %.tmp775)
ret void
}
@.str746 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str762 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
%m286$.Query.type = type {i8,i8*,%m286$.Query.type*}
%m286$.Matcher.type = type {%m286$.Query.type*,i8,%m286$.Matcher.type*,%m286$.Matcher.type*}
%m286$.Rule.type = type {i8*,%m286$.Matcher.type*}
%m286$.ParsingContext.type = type {%m287$.Token.type*}
define %m286$.ParsingContext.type* @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp777 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* null, i32 1
%.tmp778 = ptrtoint %m286$.ParsingContext.type* %.tmp777 to i32
%.tmp779 = call i8*(i32) @malloc(i32 %.tmp778)
%.tmp780 = bitcast i8* %.tmp779 to %m286$.ParsingContext.type*
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp780, %m286$.ParsingContext.type** %ctx
%.tmp781 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp782 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp781)
%fd = alloca i32
store i32 %.tmp782, i32* %fd
%.tmp783 = load i32, i32* %fd
%.tmp784 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp783)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp784, %m209$.PeekerInfo.type** %p
%.tmp785 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp786 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp785, i1 0)
%token_list = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp786, %m287$.Token.type** %token_list
%.tmp787 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp788 = bitcast %m209$.PeekerInfo.type* %.tmp787 to i8*
call void(i8*) @free(i8* %.tmp788)
%.tmp789 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp790 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp789, i32 0, i32 0
%.tmp791 = load %m287$.Token.type*, %m287$.Token.type** %token_list
store %m287$.Token.type* %.tmp791, %m287$.Token.type** %.tmp790
%.tmp792 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
ret %m286$.ParsingContext.type* %.tmp792
}
define %m286$.Matcher.type* @m286$new_matcher.m286$.Matcher.typep() {
%.tmp793 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* null, i32 1
%.tmp794 = ptrtoint %m286$.Matcher.type* %.tmp793 to i32
%.tmp795 = call i8*(i32) @malloc(i32 %.tmp794)
%.tmp796 = bitcast i8* %.tmp795 to %m286$.Matcher.type*
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp796, %m286$.Matcher.type** %m
%.tmp797 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp798 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp797, i32 0, i32 1
store i8 49, i8* %.tmp798
%.tmp799 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp800 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp799, i32 0, i32 2
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp800
%.tmp801 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp802 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp801, i32 0, i32 3
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp802
%.tmp803 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp804 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp803, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp804
%.tmp805 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp805
}
define %m286$.Matcher.type* @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* null, %m286$.Matcher.type** %m
%.tmp806 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp807 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp806, i32 0, i32 0
%.tmp808 = load %m287$.Token.type*, %m287$.Token.type** %.tmp807
%.tmp809 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp808, i32 0, i32 1
%.tmp810 = load i8*, i8** %.tmp809
%.tmp812 = getelementptr [2 x i8], [2 x i8]*@.str811, i32 0, i32 0
%.tmp813 = call i32(i8*,i8*) @strcmp(i8* %.tmp810, i8* %.tmp812)
%.tmp814 = icmp eq i32 %.tmp813, 0
br i1 %.tmp814, label %.if.true.815, label %.if.false.815
.if.true.815:
%.tmp816 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp817 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp816, i32 0, i32 0
%.tmp818 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp819 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp818, i32 0, i32 0
%.tmp820 = load %m287$.Token.type*, %m287$.Token.type** %.tmp819
%.tmp821 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp820, i32 0, i32 5
%.tmp822 = load %m287$.Token.type*, %m287$.Token.type** %.tmp821
store %m287$.Token.type* %.tmp822, %m287$.Token.type** %.tmp817
%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp823 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp824 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp823)
store %m286$.Matcher.type* %.tmp824, %m286$.Matcher.type** %m
%.tmp825 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp826 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp825, i32 0, i32 0
%.tmp827 = load %m287$.Token.type*, %m287$.Token.type** %.tmp826
%.tmp828 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp827, i32 0, i32 1
%.tmp829 = load i8*, i8** %.tmp828
%.tmp831 = getelementptr [2 x i8], [2 x i8]*@.str830, i32 0, i32 0
%.tmp832 = call i32(i8*,i8*) @strcmp(i8* %.tmp829, i8* %.tmp831)
%.tmp833 = icmp eq i32 %.tmp832, 0
br i1 %.tmp833, label %.if.true.834, label %.if.false.834
.if.true.834:
%.tmp835 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp836 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp835, i32 0, i32 0
%.tmp837 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp838 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp837, i32 0, i32 0
%.tmp839 = load %m287$.Token.type*, %m287$.Token.type** %.tmp838
%.tmp840 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp839, i32 0, i32 5
%.tmp841 = load %m287$.Token.type*, %m287$.Token.type** %.tmp840
store %m287$.Token.type* %.tmp841, %m287$.Token.type** %.tmp836
%.tmp842 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%last_matcher = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp842, %m286$.Matcher.type** %last_matcher
br label %.for.start.843
.for.start.843:
%.tmp844 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp845 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp844, i32 0, i32 0
%.tmp846 = load %m287$.Token.type*, %m287$.Token.type** %.tmp845
%.tmp847 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp846, i32 0, i32 1
%.tmp848 = load i8*, i8** %.tmp847
%.tmp850 = getelementptr [2 x i8], [2 x i8]*@.str849, i32 0, i32 0
%.tmp851 = call i32(i8*,i8*) @strcmp(i8* %.tmp848, i8* %.tmp850)
%.tmp852 = icmp ne i32 %.tmp851, 0
%.tmp853 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp854 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp853, i32 0, i32 0
%.tmp855 = load %m287$.Token.type*, %m287$.Token.type** %.tmp854
%.tmp856 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp855, i32 0, i32 0
%.tmp857 = load i8*, i8** %.tmp856
%.tmp859 = getelementptr [4 x i8], [4 x i8]*@.str858, i32 0, i32 0
%.tmp860 = call i32(i8*,i8*) @strcmp(i8* %.tmp857, i8* %.tmp859)
%.tmp861 = icmp ne i32 %.tmp860, 0
%.tmp862 = and i1 %.tmp852, %.tmp861
br i1 %.tmp862, label %.for.continue.843, label %.for.end.843
.for.continue.843:
%.tmp863 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp864 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp863, i32 0, i32 2
%.tmp865 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp866 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp865)
store %m286$.Matcher.type* %.tmp866, %m286$.Matcher.type** %.tmp864
%.tmp867 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp868 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp867, i32 0, i32 2
%.tmp869 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp868
store %m286$.Matcher.type* %.tmp869, %m286$.Matcher.type** %last_matcher
%.tmp870 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp871 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp870, i32 0, i32 0
%.tmp872 = load %m287$.Token.type*, %m287$.Token.type** %.tmp871
%.tmp873 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp872, i32 0, i32 1
%.tmp874 = load i8*, i8** %.tmp873
%.tmp876 = getelementptr [2 x i8], [2 x i8]*@.str875, i32 0, i32 0
%.tmp877 = call i32(i8*,i8*) @strcmp(i8* %.tmp874, i8* %.tmp876)
%.tmp878 = icmp ne i32 %.tmp877, 0
%.tmp879 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp880 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp879, i32 0, i32 0
%.tmp881 = load %m287$.Token.type*, %m287$.Token.type** %.tmp880
%.tmp882 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp881, i32 0, i32 1
%.tmp883 = load i8*, i8** %.tmp882
%.tmp885 = getelementptr [2 x i8], [2 x i8]*@.str884, i32 0, i32 0
%.tmp886 = call i32(i8*,i8*) @strcmp(i8* %.tmp883, i8* %.tmp885)
%.tmp887 = icmp ne i32 %.tmp886, 0
%.tmp888 = and i1 %.tmp878, %.tmp887
br i1 %.tmp888, label %.if.true.889, label %.if.false.889
.if.true.889:
%.tmp891 = getelementptr [48 x i8], [48 x i8]*@.str890, i32 0, i32 0
%.tmp892 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp893 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp892, i32 0, i32 0
%.tmp894 = load %m287$.Token.type*, %m287$.Token.type** %.tmp893
%.tmp895 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp894, i32 0, i32 2
%.tmp896 = load i32, i32* %.tmp895
%.tmp897 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp898 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp897, i32 0, i32 0
%.tmp899 = load %m287$.Token.type*, %m287$.Token.type** %.tmp898
%.tmp900 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp899, i32 0, i32 3
%.tmp901 = load i32, i32* %.tmp900
%.tmp902 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp903 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp902, i32 0, i32 0
%.tmp904 = load %m287$.Token.type*, %m287$.Token.type** %.tmp903
%.tmp905 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp904, i32 0, i32 1
%.tmp906 = load i8*, i8** %.tmp905
%.tmp907 = call i32(i8*,...) @printf(i8* %.tmp891, i32 %.tmp896, i32 %.tmp901, i8* %.tmp906)
call void(i32) @exit(i32 1)
br label %.if.end.889
.if.false.889:
br label %.if.end.889
.if.end.889:
%.tmp908 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp909 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp908, i32 0, i32 0
%.tmp910 = load %m287$.Token.type*, %m287$.Token.type** %.tmp909
%.tmp911 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp910, i32 0, i32 1
%.tmp912 = load i8*, i8** %.tmp911
%.tmp914 = getelementptr [2 x i8], [2 x i8]*@.str913, i32 0, i32 0
%.tmp915 = call i32(i8*,i8*) @strcmp(i8* %.tmp912, i8* %.tmp914)
%.tmp916 = icmp eq i32 %.tmp915, 0
br i1 %.tmp916, label %.if.true.917, label %.if.false.917
.if.true.917:
%.tmp918 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp919 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp918, i32 0, i32 0
%.tmp920 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp921 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp920, i32 0, i32 0
%.tmp922 = load %m287$.Token.type*, %m287$.Token.type** %.tmp921
%.tmp923 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp922, i32 0, i32 5
%.tmp924 = load %m287$.Token.type*, %m287$.Token.type** %.tmp923
store %m287$.Token.type* %.tmp924, %m287$.Token.type** %.tmp919
br label %.if.end.917
.if.false.917:
br label %.if.end.917
.if.end.917:
br label %.for.start.843
.for.end.843:
br label %.if.end.834
.if.false.834:
br label %.if.end.834
.if.end.834:
%.tmp925 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp926 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp925, i32 0, i32 0
%.tmp927 = load %m287$.Token.type*, %m287$.Token.type** %.tmp926
%.tmp928 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp927, i32 0, i32 1
%.tmp929 = load i8*, i8** %.tmp928
%.tmp931 = getelementptr [2 x i8], [2 x i8]*@.str930, i32 0, i32 0
%.tmp932 = call i32(i8*,i8*) @strcmp(i8* %.tmp929, i8* %.tmp931)
%.tmp933 = icmp ne i32 %.tmp932, 0
br i1 %.tmp933, label %.if.true.934, label %.if.false.934
.if.true.934:
%.tmp935 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp937 = getelementptr [22 x i8], [22 x i8]*@.str936, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp935, i8* %.tmp937)
br label %.if.end.934
.if.false.934:
br label %.if.end.934
.if.end.934:
%.tmp938 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp939 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp938, i32 0, i32 0
%.tmp940 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp941 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp940, i32 0, i32 0
%.tmp942 = load %m287$.Token.type*, %m287$.Token.type** %.tmp941
%.tmp943 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp942, i32 0, i32 5
%.tmp944 = load %m287$.Token.type*, %m287$.Token.type** %.tmp943
store %m287$.Token.type* %.tmp944, %m287$.Token.type** %.tmp939
%.tmp945 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp946 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp945, i32 0, i32 0
%.tmp947 = load %m287$.Token.type*, %m287$.Token.type** %.tmp946
%.tmp948 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp947, i32 0, i32 1
%.tmp949 = load i8*, i8** %.tmp948
%.tmp951 = getelementptr [2 x i8], [2 x i8]*@.str950, i32 0, i32 0
%.tmp952 = call i32(i8*,i8*) @strcmp(i8* %.tmp949, i8* %.tmp951)
%.tmp953 = icmp eq i32 %.tmp952, 0
br i1 %.tmp953, label %.if.true.954, label %.if.false.954
.if.true.954:
%.tmp955 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp956 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp955, i32 0, i32 0
%.tmp957 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp958 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp957, i32 0, i32 0
%.tmp959 = load %m287$.Token.type*, %m287$.Token.type** %.tmp958
%.tmp960 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp959, i32 0, i32 5
%.tmp961 = load %m287$.Token.type*, %m287$.Token.type** %.tmp960
store %m287$.Token.type* %.tmp961, %m287$.Token.type** %.tmp956
%.tmp962 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp963 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp962, i32 0, i32 1
store i8 43, i8* %.tmp963
br label %.if.end.954
.if.false.954:
%.tmp964 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp965 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp964, i32 0, i32 0
%.tmp966 = load %m287$.Token.type*, %m287$.Token.type** %.tmp965
%.tmp967 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp966, i32 0, i32 1
%.tmp968 = load i8*, i8** %.tmp967
%.tmp970 = getelementptr [2 x i8], [2 x i8]*@.str969, i32 0, i32 0
%.tmp971 = call i32(i8*,i8*) @strcmp(i8* %.tmp968, i8* %.tmp970)
%.tmp972 = icmp eq i32 %.tmp971, 0
br i1 %.tmp972, label %.if.true.973, label %.if.false.973
.if.true.973:
%.tmp974 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp975 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp974, i32 0, i32 0
%.tmp976 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp977 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp976, i32 0, i32 0
%.tmp978 = load %m287$.Token.type*, %m287$.Token.type** %.tmp977
%.tmp979 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp978, i32 0, i32 5
%.tmp980 = load %m287$.Token.type*, %m287$.Token.type** %.tmp979
store %m287$.Token.type* %.tmp980, %m287$.Token.type** %.tmp975
%.tmp981 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp982 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp981, i32 0, i32 1
store i8 42, i8* %.tmp982
br label %.if.end.973
.if.false.973:
%.tmp983 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp984 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp983, i32 0, i32 0
%.tmp985 = load %m287$.Token.type*, %m287$.Token.type** %.tmp984
%.tmp986 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp985, i32 0, i32 1
%.tmp987 = load i8*, i8** %.tmp986
%.tmp989 = getelementptr [2 x i8], [2 x i8]*@.str988, i32 0, i32 0
%.tmp990 = call i32(i8*,i8*) @strcmp(i8* %.tmp987, i8* %.tmp989)
%.tmp991 = icmp eq i32 %.tmp990, 0
br i1 %.tmp991, label %.if.true.992, label %.if.false.992
.if.true.992:
%.tmp993 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp994 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp993, i32 0, i32 0
%.tmp995 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp996 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp995, i32 0, i32 0
%.tmp997 = load %m287$.Token.type*, %m287$.Token.type** %.tmp996
%.tmp998 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp997, i32 0, i32 5
%.tmp999 = load %m287$.Token.type*, %m287$.Token.type** %.tmp998
store %m287$.Token.type* %.tmp999, %m287$.Token.type** %.tmp994
%.tmp1000 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1001 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1000, i32 0, i32 1
store i8 63, i8* %.tmp1001
br label %.if.end.992
.if.false.992:
br label %.if.end.992
.if.end.992:
br label %.if.end.973
.if.end.973:
br label %.if.end.954
.if.end.954:
br label %.if.end.815
.if.false.815:
%.tmp1002 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1003 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1002)
store %m286$.Matcher.type* %.tmp1003, %m286$.Matcher.type** %m
br label %.if.end.815
.if.end.815:
%.tmp1004 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1005 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1004, i32 0, i32 0
%.tmp1006 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1005
%.tmp1007 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1006, i32 0, i32 1
%.tmp1008 = load i8*, i8** %.tmp1007
%.tmp1010 = getelementptr [2 x i8], [2 x i8]*@.str1009, i32 0, i32 0
%.tmp1011 = call i32(i8*,i8*) @strcmp(i8* %.tmp1008, i8* %.tmp1010)
%.tmp1012 = icmp eq i32 %.tmp1011, 0
%.tmp1013 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1014 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1013, i32 0, i32 0
%.tmp1015 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1014
%.tmp1016 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1015, i32 0, i32 0
%.tmp1017 = load i8*, i8** %.tmp1016
%.tmp1019 = getelementptr [5 x i8], [5 x i8]*@.str1018, i32 0, i32 0
%.tmp1020 = call i32(i8*,i8*) @strcmp(i8* %.tmp1017, i8* %.tmp1019)
%.tmp1021 = icmp eq i32 %.tmp1020, 0
%.tmp1022 = or i1 %.tmp1012, %.tmp1021
br i1 %.tmp1022, label %.if.true.1023, label %.if.false.1023
.if.true.1023:
%.tmp1024 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1025 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1024, i32 0, i32 3
%.tmp1026 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1027 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1026)
store %m286$.Matcher.type* %.tmp1027, %m286$.Matcher.type** %.tmp1025
br label %.if.end.1023
.if.false.1023:
br label %.if.end.1023
.if.end.1023:
%.tmp1028 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1028
}
define %m286$.Matcher.type* @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1029 = call %m286$.Matcher.type*() @m286$new_matcher.m286$.Matcher.typep()
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp1029, %m286$.Matcher.type** %m
%count = alloca i32
store i32 0, i32* %count
%.tmp1030 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1031 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1030, i32 0, i32 0
%.tmp1032 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1031
%ptr = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1032, %m287$.Token.type** %ptr
store i32 0, i32* %count
br label %.for.start.1033
.for.start.1033:
%.tmp1034 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1035 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1034, i32 0, i32 0
%.tmp1036 = load i8*, i8** %.tmp1035
%.tmp1038 = getelementptr [5 x i8], [5 x i8]*@.str1037, i32 0, i32 0
%.tmp1039 = call i32(i8*,i8*) @strcmp(i8* %.tmp1036, i8* %.tmp1038)
%.tmp1040 = icmp eq i32 %.tmp1039, 0
%.tmp1041 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1042 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1041, i32 0, i32 0
%.tmp1043 = load i8*, i8** %.tmp1042
%.tmp1045 = getelementptr [7 x i8], [7 x i8]*@.str1044, i32 0, i32 0
%.tmp1046 = call i32(i8*,i8*) @strcmp(i8* %.tmp1043, i8* %.tmp1045)
%.tmp1047 = icmp eq i32 %.tmp1046, 0
%.tmp1048 = or i1 %.tmp1040, %.tmp1047
br i1 %.tmp1048, label %.for.continue.1033, label %.for.end.1033
.for.continue.1033:
%.tmp1049 = load i32, i32* %count
%.tmp1050 = add i32 %.tmp1049, 1
store i32 %.tmp1050, i32* %count
%.tmp1051 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1052 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1051, i32 0, i32 5
%.tmp1053 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1052
store %m287$.Token.type* %.tmp1053, %m287$.Token.type** %ptr
br label %.for.start.1033
.for.end.1033:
%.tmp1054 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1055 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1054, i32 0, i32 0
%.tmp1056 = getelementptr %m286$.Query.type, %m286$.Query.type* null, i32 1
%.tmp1057 = ptrtoint %m286$.Query.type* %.tmp1056 to i32
%.tmp1058 = call i8*(i32) @malloc(i32 %.tmp1057)
%.tmp1059 = bitcast i8* %.tmp1058 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1059, %m286$.Query.type** %.tmp1055
%.tmp1060 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1061 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1060, i32 0, i32 0
%.tmp1062 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1061
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1062, %m286$.Query.type** %q
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1063
.for.start.1063:
%.tmp1064 = load i32, i32* %i
%.tmp1065 = load i32, i32* %count
%.tmp1066 = icmp slt i32 %.tmp1064, %.tmp1065
br i1 %.tmp1066, label %.for.continue.1063, label %.for.end.1063
.for.continue.1063:
%.tmp1067 = load i32, i32* %i
%.tmp1068 = icmp sgt i32 %.tmp1067, 0
br i1 %.tmp1068, label %.if.true.1069, label %.if.false.1069
.if.true.1069:
%.tmp1070 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1071 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1070, i32 0, i32 2
%.tmp1072 = getelementptr %m286$.Query.type, %m286$.Query.type* null, i32 1
%.tmp1073 = ptrtoint %m286$.Query.type* %.tmp1072 to i32
%.tmp1074 = call i8*(i32) @malloc(i32 %.tmp1073)
%.tmp1075 = bitcast i8* %.tmp1074 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1075, %m286$.Query.type** %.tmp1071
%.tmp1076 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1077 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1076, i32 0, i32 2
%.tmp1078 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1077
store %m286$.Query.type* %.tmp1078, %m286$.Query.type** %q
br label %.if.end.1069
.if.false.1069:
br label %.if.end.1069
.if.end.1069:
%.tmp1079 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1080 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1079, i32 0, i32 0
%.tmp1081 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1080
%.tmp1082 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1081, i32 0, i32 0
%.tmp1083 = load i8*, i8** %.tmp1082
%.tmp1085 = getelementptr [7 x i8], [7 x i8]*@.str1084, i32 0, i32 0
%.tmp1086 = call i32(i8*,i8*) @strcmp(i8* %.tmp1083, i8* %.tmp1085)
%.tmp1087 = icmp eq i32 %.tmp1086, 0
br i1 %.tmp1087, label %.if.true.1088, label %.if.false.1088
.if.true.1088:
%.tmp1089 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1090 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1089, i32 0, i32 0
store i8 118, i8* %.tmp1090
br label %.if.end.1088
.if.false.1088:
%.tmp1091 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1092 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1091, i32 0, i32 0
%.tmp1093 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1092
%.tmp1094 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1093, i32 0, i32 1
%.tmp1095 = load i8*, i8** %.tmp1094
%.tmp1096 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1095)
br i1 %.tmp1096, label %.if.true.1097, label %.if.false.1097
.if.true.1097:
%.tmp1098 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1099 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1098, i32 0, i32 0
store i8 97, i8* %.tmp1099
br label %.if.end.1097
.if.false.1097:
%.tmp1100 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1101 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1100, i32 0, i32 0
%.tmp1102 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1101
%.tmp1103 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1102, i32 0, i32 1
%.tmp1104 = load i8*, i8** %.tmp1103
%.tmp1105 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1104)
br i1 %.tmp1105, label %.if.true.1106, label %.if.false.1106
.if.true.1106:
%.tmp1107 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1108 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1107, i32 0, i32 0
store i8 116, i8* %.tmp1108
br label %.if.end.1106
.if.false.1106:
%.tmp1110 = getelementptr [17 x i8], [17 x i8]*@.str1109, i32 0, i32 0
%.tmp1111 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1112 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1111, i32 0, i32 0
%.tmp1113 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1112
%.tmp1114 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1113, i32 0, i32 1
%.tmp1115 = load i8*, i8** %.tmp1114
%.tmp1116 = call i32(i8*,...) @printf(i8* %.tmp1110, i8* %.tmp1115)
%.tmp1117 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1119 = getelementptr [50 x i8], [50 x i8]*@.str1118, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1117, i8* %.tmp1119)
br label %.if.end.1106
.if.end.1106:
br label %.if.end.1097
.if.end.1097:
br label %.if.end.1088
.if.end.1088:
%.tmp1120 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1121 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1120, i32 0, i32 1
%.tmp1122 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1123 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1122, i32 0, i32 0
%.tmp1124 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1123
%.tmp1125 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1124, i32 0, i32 1
%.tmp1126 = load i8*, i8** %.tmp1125
store i8* %.tmp1126, i8** %.tmp1121
%.tmp1127 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1128 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1127, i32 0, i32 2
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1128
%.tmp1129 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1130 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1129, i32 0, i32 0
%.tmp1131 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1132 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1131, i32 0, i32 0
%.tmp1133 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1132
%.tmp1134 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1133, i32 0, i32 5
%.tmp1135 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1134
store %m287$.Token.type* %.tmp1135, %m287$.Token.type** %.tmp1130
%.tmp1136 = load i32, i32* %i
%.tmp1137 = add i32 %.tmp1136, 1
store i32 %.tmp1137, i32* %i
br label %.for.start.1063
.for.end.1063:
%.tmp1138 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1138
}
define %m286$.Rule.type* @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1139 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1140 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1139, i32 0, i32 0
%.tmp1141 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1140
%.tmp1142 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1141, i32 0, i32 1
%.tmp1143 = load i8*, i8** %.tmp1142
%rule_name = alloca i8*
store i8* %.tmp1143, i8** %rule_name
%.tmp1144 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1145 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1144, i32 0, i32 0
%.tmp1146 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1145
%.tmp1147 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1146, i32 0, i32 0
%.tmp1148 = load i8*, i8** %.tmp1147
%.tmp1150 = getelementptr [5 x i8], [5 x i8]*@.str1149, i32 0, i32 0
%.tmp1151 = call i32(i8*,i8*) @strcmp(i8* %.tmp1148, i8* %.tmp1150)
%.tmp1152 = icmp ne i32 %.tmp1151, 0
br i1 %.tmp1152, label %.if.true.1153, label %.if.false.1153
.if.true.1153:
%.tmp1155 = getelementptr [37 x i8], [37 x i8]*@.str1154, i32 0, i32 0
%.tmp1156 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1157 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1156, i32 0, i32 0
%.tmp1158 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1157
%.tmp1159 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1158, i32 0, i32 0
%.tmp1160 = load i8*, i8** %.tmp1159
%.tmp1161 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1162 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1161, i32 0, i32 0
%.tmp1163 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1162
%.tmp1164 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1163, i32 0, i32 1
%.tmp1165 = load i8*, i8** %.tmp1164
%.tmp1166 = call i32(i8*,...) @printf(i8* %.tmp1155, i8* %.tmp1160, i8* %.tmp1165)
%.tmp1167 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1169 = getelementptr [31 x i8], [31 x i8]*@.str1168, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1167, i8* %.tmp1169)
br label %.if.end.1153
.if.false.1153:
br label %.if.end.1153
.if.end.1153:
%.tmp1170 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1171 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1170, i32 0, i32 0
%.tmp1172 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1173 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1172, i32 0, i32 0
%.tmp1174 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1173
%.tmp1175 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1174, i32 0, i32 5
%.tmp1176 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1175
store %m287$.Token.type* %.tmp1176, %m287$.Token.type** %.tmp1171
%.tmp1177 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1178 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1177, i32 0, i32 0
%.tmp1179 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1178
%.tmp1180 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1179, i32 0, i32 1
%.tmp1181 = load i8*, i8** %.tmp1180
%.tmp1183 = getelementptr [2 x i8], [2 x i8]*@.str1182, i32 0, i32 0
%.tmp1184 = call i32(i8*,i8*) @strcmp(i8* %.tmp1181, i8* %.tmp1183)
%.tmp1185 = icmp ne i32 %.tmp1184, 0
br i1 %.tmp1185, label %.if.true.1186, label %.if.false.1186
.if.true.1186:
%.tmp1187 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1187, i32 0, i32 0
%.tmp1189 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1188
%.tmp1190 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1189, i32 0, i32 1
%.tmp1191 = load i8*, i8** %.tmp1190
%.tmp1192 = call i32(i8*,...) @printf(i8* %.tmp1191)
%.tmp1193 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1195 = getelementptr [27 x i8], [27 x i8]*@.str1194, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1193, i8* %.tmp1195)
br label %.if.end.1186
.if.false.1186:
br label %.if.end.1186
.if.end.1186:
%.tmp1196 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1197 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1199 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1198, i32 0, i32 0
%.tmp1200 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1199
%.tmp1201 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1200, i32 0, i32 5
%.tmp1202 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1201
store %m287$.Token.type* %.tmp1202, %m287$.Token.type** %.tmp1197
%.tmp1203 = getelementptr %m286$.Rule.type, %m286$.Rule.type* null, i32 1
%.tmp1204 = ptrtoint %m286$.Rule.type* %.tmp1203 to i32
%.tmp1205 = call i8*(i32) @malloc(i32 %.tmp1204)
%.tmp1206 = bitcast i8* %.tmp1205 to %m286$.Rule.type*
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1206, %m286$.Rule.type** %rule
%.tmp1207 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1208 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1207, i32 0, i32 0
%.tmp1209 = load i8*, i8** %rule_name
store i8* %.tmp1209, i8** %.tmp1208
%.tmp1210 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1211 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1210, i32 0, i32 1
%.tmp1212 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1213 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1212)
store %m286$.Matcher.type* %.tmp1213, %m286$.Matcher.type** %.tmp1211
%.tmp1214 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1214
}
define void @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1215 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1216 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1215, i32 0, i32 0
%.tmp1217 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1216
%.tmp1218 = load i8*, i8** %error
%.tmp1219 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1217, i8* %.tmp1218)
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1219, %m717$.Error.type** %e
%.tmp1220 = load %m717$.Error.type*, %m717$.Error.type** %e
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp1220)
call void(i32) @exit(i32 1)
ret void
}
define %m286$.Rule.type** @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%max_rules = alloca i32
store i32 40, i32* %max_rules
%.tmp1221 = load i32, i32* @ptr_size
%.tmp1222 = load i32, i32* %max_rules
%.tmp1223 = mul i32 %.tmp1221, %.tmp1222
%.tmp1224 = call i8*(i32) @malloc(i32 %.tmp1223)
%.tmp1225 = bitcast i8* %.tmp1224 to %m286$.Rule.type**
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp1225, %m286$.Rule.type*** %grammar
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1226
.for.start.1226:
%.tmp1227 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1228 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1227, i32 0, i32 0
%.tmp1229 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1228
%.tmp1230 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1229, i32 0, i32 0
%.tmp1231 = load i8*, i8** %.tmp1230
%.tmp1233 = getelementptr [4 x i8], [4 x i8]*@.str1232, i32 0, i32 0
%.tmp1234 = call i32(i8*,i8*) @strcmp(i8* %.tmp1231, i8* %.tmp1233)
%.tmp1235 = icmp ne i32 %.tmp1234, 0
br i1 %.tmp1235, label %.for.continue.1226, label %.for.end.1226
.for.continue.1226:
%.tmp1236 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1237 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1236, i32 0, i32 0
%.tmp1238 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1237
%.tmp1239 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1238, i32 0, i32 0
%.tmp1240 = load i8*, i8** %.tmp1239
%.tmp1242 = getelementptr [3 x i8], [3 x i8]*@.str1241, i32 0, i32 0
%.tmp1243 = call i32(i8*,i8*) @strcmp(i8* %.tmp1240, i8* %.tmp1242)
%.tmp1244 = icmp ne i32 %.tmp1243, 0
br i1 %.tmp1244, label %.if.true.1245, label %.if.false.1245
.if.true.1245:
%.tmp1246 = load i32, i32* %i
%.tmp1247 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1248 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1247, i32 %.tmp1246
%.tmp1249 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1250 = call %m286$.Rule.type*(%m286$.ParsingContext.type*) @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1249)
store %m286$.Rule.type* %.tmp1250, %m286$.Rule.type** %.tmp1248
%.tmp1251 = load i32, i32* %i
%.tmp1252 = add i32 %.tmp1251, 1
store i32 %.tmp1252, i32* %i
br label %.if.end.1245
.if.false.1245:
%.tmp1253 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1254 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1253, i32 0, i32 0
%.tmp1255 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1256 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1255, i32 0, i32 0
%.tmp1257 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1256
%.tmp1258 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1257, i32 0, i32 5
%.tmp1259 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1258
store %m287$.Token.type* %.tmp1259, %m287$.Token.type** %.tmp1254
br label %.if.end.1245
.if.end.1245:
br label %.for.start.1226
.for.end.1226:
%.tmp1260 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1261 = bitcast %m286$.Rule.type** %.tmp1260 to %m286$.Rule.type**
ret %m286$.Rule.type** %.tmp1261
}
%m286$.Node.type = type {i8*,i8*,i8*,i32,i32,%m286$.Node.type*,%m286$.Node.type*,%m286$.Node.type*}
define %m286$.Node.type* @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1262 = getelementptr %m286$.Node.type, %m286$.Node.type* null, i32 1
%.tmp1263 = ptrtoint %m286$.Node.type* %.tmp1262 to i32
%.tmp1264 = call i8*(i32) @malloc(i32 %.tmp1263)
%.tmp1265 = bitcast i8* %.tmp1264 to %m286$.Node.type*
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1265, %m286$.Node.type** %node
%.tmp1266 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1267 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1266, i32 0, i32 0
%.tmp1268 = load i8*, i8** %type
store i8* %.tmp1268, i8** %.tmp1267
%.tmp1269 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1270 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1269, i32 0, i32 1
%.tmp1271 = load i8*, i8** %value
store i8* %.tmp1271, i8** %.tmp1270
%.tmp1272 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1273 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1272, i32 0, i32 3
%.tmp1274 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1275 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1274, i32 0, i32 2
%.tmp1276 = load i32, i32* %.tmp1275
store i32 %.tmp1276, i32* %.tmp1273
%.tmp1277 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1278 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1277, i32 0, i32 2
%.tmp1279 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1280 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1279, i32 0, i32 4
%.tmp1281 = load i8*, i8** %.tmp1280
store i8* %.tmp1281, i8** %.tmp1278
%.tmp1282 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1283 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1282, i32 0, i32 4
%.tmp1284 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1285 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1284, i32 0, i32 3
%.tmp1286 = load i32, i32* %.tmp1285
store i32 %.tmp1286, i32* %.tmp1283
%.tmp1287 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1288 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1287, i32 0, i32 5
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1288
%.tmp1289 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1290 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1289, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1290
%.tmp1291 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1292 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1291, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1292
%.tmp1293 = load %m286$.Node.type*, %m286$.Node.type** %node
ret %m286$.Node.type* %.tmp1293
}
define void @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.parent.arg, %m286$.Node.type* %.child.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%child = alloca %m286$.Node.type*
store %m286$.Node.type* %.child.arg, %m286$.Node.type** %child
%.tmp1294 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1295 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1294, i32 0, i32 6
%.tmp1296 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1295
%.tmp1297 = icmp eq %m286$.Node.type* %.tmp1296, null
br i1 %.tmp1297, label %.if.true.1298, label %.if.false.1298
.if.true.1298:
%.tmp1299 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1300 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1299, i32 0, i32 6
%.tmp1301 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1301, %m286$.Node.type** %.tmp1300
br label %.if.end.1298
.if.false.1298:
%.tmp1302 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1303 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1302, i32 0, i32 6
%.tmp1304 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1303
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1304, %m286$.Node.type** %c
br label %.for.start.1305
.for.start.1305:
%.tmp1306 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1307 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1306, i32 0, i32 7
%.tmp1308 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1307
%.tmp1309 = icmp ne %m286$.Node.type* %.tmp1308, null
br i1 %.tmp1309, label %.for.continue.1305, label %.for.end.1305
.for.continue.1305:
%.tmp1310 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1311 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1310, i32 0, i32 7
%.tmp1312 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1311
store %m286$.Node.type* %.tmp1312, %m286$.Node.type** %c
br label %.for.start.1305
.for.end.1305:
%.tmp1313 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1314 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1313, i32 0, i32 7
%.tmp1315 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1315, %m286$.Node.type** %.tmp1314
br label %.if.end.1298
.if.end.1298:
%.tmp1316 = load %m286$.Node.type*, %m286$.Node.type** %child
%.tmp1317 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1316, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1317
ret void
}
define void @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.parent.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%.tmp1318 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1319 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1318, i32 0, i32 6
%.tmp1320 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1319
%.tmp1321 = icmp eq %m286$.Node.type* %.tmp1320, null
br i1 %.tmp1321, label %.if.true.1322, label %.if.false.1322
.if.true.1322:
ret void
br label %.if.end.1322
.if.false.1322:
br label %.if.end.1322
.if.end.1322:
%.tmp1323 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1324 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1323, i32 0, i32 6
%.tmp1325 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1324
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1325, %m286$.Node.type** %c
%.tmp1326 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1327 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1326, i32 0, i32 7
%.tmp1328 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1327
%.tmp1329 = icmp eq %m286$.Node.type* %.tmp1328, null
br i1 %.tmp1329, label %.if.true.1330, label %.if.false.1330
.if.true.1330:
%.tmp1331 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1332 = bitcast %m286$.Node.type* %.tmp1331 to i8*
call void(i8*) @free(i8* %.tmp1332)
%.tmp1333 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1334 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1333, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1334
ret void
br label %.if.end.1330
.if.false.1330:
br label %.if.end.1330
.if.end.1330:
br label %.for.start.1335
.for.start.1335:
%.tmp1336 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1337 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1336, i32 0, i32 7
%.tmp1338 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1337
%.tmp1339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1338, i32 0, i32 7
%.tmp1340 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1339
%.tmp1341 = icmp ne %m286$.Node.type* %.tmp1340, null
br i1 %.tmp1341, label %.for.continue.1335, label %.for.end.1335
.for.continue.1335:
%.tmp1342 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1343 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1342, i32 0, i32 7
%.tmp1344 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1343
store %m286$.Node.type* %.tmp1344, %m286$.Node.type** %c
br label %.for.start.1335
.for.end.1335:
%.tmp1345 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1346 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1345, i32 0, i32 7
%.tmp1347 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1346
%.tmp1348 = bitcast %m286$.Node.type* %.tmp1347 to i8*
call void(i8*) @free(i8* %.tmp1348)
%.tmp1349 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1350 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1349, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1350
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
br label %.for.start.1351
.for.start.1351:
br i1 1, label %.for.continue.1351, label %.for.end.1351
.for.continue.1351:
%.tmp1352 = load i32, i32* %i
%.tmp1353 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1354 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1353, i32 %.tmp1352
%.tmp1355 = load %m286$.Rule.type*, %m286$.Rule.type** %.tmp1354
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1355, %m286$.Rule.type** %rule
%.tmp1356 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1357 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1356, i32 0, i32 0
%.tmp1358 = load i8*, i8** %.tmp1357
%.tmp1359 = load i8*, i8** %rule_name
%.tmp1360 = call i32(i8*,i8*) @strcmp(i8* %.tmp1358, i8* %.tmp1359)
%.tmp1361 = icmp eq i32 %.tmp1360, 0
br i1 %.tmp1361, label %.if.true.1362, label %.if.false.1362
.if.true.1362:
%.tmp1363 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1363
br label %.if.end.1362
.if.false.1362:
br label %.if.end.1362
.if.end.1362:
%.tmp1364 = load i32, i32* %i
%.tmp1365 = add i32 %.tmp1364, 1
store i32 %.tmp1365, i32* %i
br label %.for.start.1351
.for.end.1351:
%.tmp1366 = bitcast ptr null to %m286$.Rule.type*
ret %m286$.Rule.type* %.tmp1366
}
%m286$.ParseResult.type = type {%m717$.Error.type*,%m286$.Node.type*}
define %m717$.Error.type* @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.c.arg, %m286$.Matcher.type* %.m.arg, %m286$.Node.type* %.base.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.m.arg, %m286$.Matcher.type** %m
%base = alloca %m286$.Node.type*
store %m286$.Node.type* %.base.arg, %m286$.Node.type** %base
%child = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %child
%.tmp1367 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1368 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1367, i32 0, i32 0
%.tmp1369 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1368
%start_token = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1369, %m287$.Token.type** %start_token
%new_children = alloca i32
store i32 0, i32* %new_children
%.tmp1370 = bitcast ptr null to %m717$.Error.type*
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1370, %m717$.Error.type** %err
%.tmp1372 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1373 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1372, i32 0, i32 0
%.tmp1374 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1373
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1374, %m286$.Query.type** %q
br label %.for.start.1371
.for.start.1371:
%.tmp1375 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1376 = icmp ne %m286$.Query.type* %.tmp1375, null
%.tmp1377 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1378 = icmp eq %m717$.Error.type* %.tmp1377, null
%.tmp1379 = and i1 %.tmp1376, %.tmp1378
br i1 %.tmp1379, label %.for.continue.1371, label %.for.end.1371
.for.continue.1371:
%.tmp1380 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1381 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1380, i32 0, i32 0
%.tmp1382 = load i8, i8* %.tmp1381
%.tmp1383 = icmp eq i8 %.tmp1382, 118
br i1 %.tmp1383, label %.if.true.1384, label %.if.false.1384
.if.true.1384:
%.tmp1385 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1386 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1385, i32 0, i32 1
%.tmp1387 = load i8*, i8** %.tmp1386
%.tmp1388 = call i32(i8*) @strlen(i8* %.tmp1387)
%.tmp1389 = sub i32 %.tmp1388, 2
%qv_len = alloca i32
store i32 %.tmp1389, i32* %qv_len
%.tmp1390 = load i32, i32* %qv_len
%.tmp1391 = add i32 %.tmp1390, 1
%.tmp1392 = call i8*(i32) @malloc(i32 %.tmp1391)
%tmp_buff = alloca i8*
store i8* %.tmp1392, i8** %tmp_buff
%.tmp1393 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1394 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1393, i32 0, i32 1
%.tmp1395 = load i8*, i8** %.tmp1394
%.tmp1397 = getelementptr [8 x i8], [8 x i8]*@.str1396, i32 0, i32 0
%.tmp1398 = load i8*, i8** %tmp_buff
%.tmp1399 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1395, i8* %.tmp1397, i8* %.tmp1398)
%.tmp1400 = load i8*, i8** %tmp_buff
%.tmp1401 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1402 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1401, i32 0, i32 0
%.tmp1403 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1402
%.tmp1404 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1403, i32 0, i32 1
%.tmp1405 = load i8*, i8** %.tmp1404
%.tmp1406 = load i32, i32* %qv_len
%.tmp1407 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1400, i8* %.tmp1405, i32 %.tmp1406)
%.tmp1408 = icmp eq i32 %.tmp1407, 0
%.tmp1409 = load i32, i32* %qv_len
%.tmp1410 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1411 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1410, i32 0, i32 0
%.tmp1412 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1411
%.tmp1413 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1412, i32 0, i32 1
%.tmp1414 = load i8*, i8** %.tmp1413
%.tmp1415 = call i32(i8*) @strlen(i8* %.tmp1414)
%.tmp1416 = icmp eq i32 %.tmp1409, %.tmp1415
%.tmp1417 = and i1 %.tmp1408, %.tmp1416
br i1 %.tmp1417, label %.if.true.1418, label %.if.false.1418
.if.true.1418:
%.tmp1419 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1420 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1419, i32 0, i32 0
%.tmp1421 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1420
%.tmp1422 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1423 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1422, i32 0, i32 0
%.tmp1424 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1423
%.tmp1425 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1424, i32 0, i32 0
%.tmp1426 = load i8*, i8** %.tmp1425
%.tmp1427 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1428 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1427, i32 0, i32 0
%.tmp1429 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1428
%.tmp1430 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1429, i32 0, i32 1
%.tmp1431 = load i8*, i8** %.tmp1430
%.tmp1432 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1421, i8* %.tmp1426, i8* %.tmp1431)
store %m286$.Node.type* %.tmp1432, %m286$.Node.type** %child
%.tmp1433 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1434 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1433, %m286$.Node.type* %.tmp1434)
%.tmp1435 = load i32, i32* %new_children
%.tmp1436 = add i32 %.tmp1435, 1
store i32 %.tmp1436, i32* %new_children
%.tmp1437 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1438 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1437, i32 0, i32 0
%.tmp1439 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1440 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1439, i32 0, i32 0
%.tmp1441 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1440
%.tmp1442 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1441, i32 0, i32 5
%.tmp1443 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1442
store %m287$.Token.type* %.tmp1443, %m287$.Token.type** %.tmp1438
br label %.if.end.1418
.if.false.1418:
%.tmp1444 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1445 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1444, i32 0, i32 0
%.tmp1446 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1445
%.tmp1447 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1446, i32 0, i32 1
%.tmp1448 = load i8*, i8** %.tmp1447
%token_value = alloca i8*
store i8* %.tmp1448, i8** %token_value
%.tmp1449 = load i8*, i8** %token_value
%.tmp1450 = icmp eq i8* %.tmp1449, null
br i1 %.tmp1450, label %.if.true.1451, label %.if.false.1451
.if.true.1451:
%.tmp1453 = getelementptr [7 x i8], [7 x i8]*@.str1452, i32 0, i32 0
store i8* %.tmp1453, i8** %token_value
br label %.if.end.1451
.if.false.1451:
br label %.if.end.1451
.if.end.1451:
%.tmp1455 = getelementptr [15 x i8], [15 x i8]*@.str1454, i32 0, i32 0
%err_fmt = alloca i8*
store i8* %.tmp1455, i8** %err_fmt
%.tmp1457 = getelementptr [31 x i8], [31 x i8]*@.str1456, i32 0, i32 0
%err_msg = alloca i8*
store i8* %.tmp1457, i8** %err_msg
%.tmp1458 = load i8*, i8** %err_msg
%.tmp1459 = call i32(i8*) @strlen(i8* %.tmp1458)
%.tmp1460 = load i8*, i8** %tmp_buff
%.tmp1461 = call i32(i8*) @strlen(i8* %.tmp1460)
%.tmp1462 = add i32 %.tmp1459, %.tmp1461
%.tmp1463 = load i8*, i8** %token_value
%.tmp1464 = call i32(i8*) @strlen(i8* %.tmp1463)
%.tmp1465 = add i32 %.tmp1462, %.tmp1464
%.tmp1466 = load i8*, i8** %err_fmt
%.tmp1467 = call i32(i8*) @strlen(i8* %.tmp1466)
%.tmp1468 = add i32 %.tmp1465, %.tmp1467
%.tmp1469 = mul i32 3, 2
%.tmp1470 = sub i32 %.tmp1468, %.tmp1469
%.tmp1471 = add i32 %.tmp1470, 1
%err_len = alloca i32
store i32 %.tmp1471, i32* %err_len
%.tmp1472 = load i32, i32* %err_len
%.tmp1473 = call i8*(i32) @malloc(i32 %.tmp1472)
%err_buf = alloca i8*
store i8* %.tmp1473, i8** %err_buf
%.tmp1474 = load i8*, i8** %err_buf
%.tmp1475 = load i32, i32* %err_len
%.tmp1476 = load i8*, i8** %err_fmt
%.tmp1477 = load i8*, i8** %err_msg
%.tmp1478 = load i8*, i8** %tmp_buff
%.tmp1479 = load i8*, i8** %token_value
%.tmp1480 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1474, i32 %.tmp1475, i8* %.tmp1476, i8* %.tmp1477, i8* %.tmp1478, i8* %.tmp1479)
%.tmp1481 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1482 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1481, i32 0, i32 0
%.tmp1483 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1482
%.tmp1484 = load i8*, i8** %err_buf
%.tmp1485 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1483, i8* %.tmp1484)
store %m717$.Error.type* %.tmp1485, %m717$.Error.type** %err
br label %.if.end.1418
.if.end.1418:
%.tmp1486 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp1486)
br label %.if.end.1384
.if.false.1384:
%.tmp1487 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1488 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1487, i32 0, i32 0
%.tmp1489 = load i8, i8* %.tmp1488
%.tmp1490 = icmp eq i8 %.tmp1489, 116
br i1 %.tmp1490, label %.if.true.1491, label %.if.false.1491
.if.true.1491:
%.tmp1492 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1493 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1492, i32 0, i32 1
%.tmp1494 = load i8*, i8** %.tmp1493
%.tmp1495 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1496 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1495, i32 0, i32 0
%.tmp1497 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1496
%.tmp1498 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1497, i32 0, i32 0
%.tmp1499 = load i8*, i8** %.tmp1498
%.tmp1500 = call i32(i8*,i8*) @strcmp(i8* %.tmp1494, i8* %.tmp1499)
%.tmp1501 = icmp eq i32 %.tmp1500, 0
br i1 %.tmp1501, label %.if.true.1502, label %.if.false.1502
.if.true.1502:
%.tmp1503 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1504 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1503, i32 0, i32 0
%.tmp1505 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1504
%.tmp1506 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1507 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1506, i32 0, i32 0
%.tmp1508 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1507
%.tmp1509 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1508, i32 0, i32 0
%.tmp1510 = load i8*, i8** %.tmp1509
%.tmp1511 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1512 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1511, i32 0, i32 0
%.tmp1513 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1512
%.tmp1514 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1513, i32 0, i32 1
%.tmp1515 = load i8*, i8** %.tmp1514
%.tmp1516 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1505, i8* %.tmp1510, i8* %.tmp1515)
store %m286$.Node.type* %.tmp1516, %m286$.Node.type** %child
%.tmp1517 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1518 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1517, %m286$.Node.type* %.tmp1518)
%.tmp1519 = load i32, i32* %new_children
%.tmp1520 = add i32 %.tmp1519, 1
store i32 %.tmp1520, i32* %new_children
%.tmp1521 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1522 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1521, i32 0, i32 0
%.tmp1523 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1524 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1523, i32 0, i32 0
%.tmp1525 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1524
%.tmp1526 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1525, i32 0, i32 5
%.tmp1527 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1526
store %m287$.Token.type* %.tmp1527, %m287$.Token.type** %.tmp1522
br label %.if.end.1502
.if.false.1502:
%.tmp1529 = getelementptr [13 x i8], [13 x i8]*@.str1528, i32 0, i32 0
%err_fmt_t = alloca i8*
store i8* %.tmp1529, i8** %err_fmt_t
%.tmp1531 = getelementptr [30 x i8], [30 x i8]*@.str1530, i32 0, i32 0
%err_msg_t = alloca i8*
store i8* %.tmp1531, i8** %err_msg_t
%.tmp1532 = load i8*, i8** %err_fmt_t
%.tmp1533 = call i32(i8*) @strlen(i8* %.tmp1532)
%.tmp1534 = load i8*, i8** %err_msg_t
%.tmp1535 = call i32(i8*) @strlen(i8* %.tmp1534)
%.tmp1536 = add i32 %.tmp1533, %.tmp1535
%.tmp1537 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1538 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1537, i32 0, i32 1
%.tmp1539 = load i8*, i8** %.tmp1538
%.tmp1540 = call i32(i8*) @strlen(i8* %.tmp1539)
%.tmp1541 = add i32 %.tmp1536, %.tmp1540
%.tmp1542 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1543 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1542, i32 0, i32 0
%.tmp1544 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1543
%.tmp1545 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1544, i32 0, i32 0
%.tmp1546 = load i8*, i8** %.tmp1545
%.tmp1547 = call i32(i8*) @strlen(i8* %.tmp1546)
%.tmp1548 = add i32 %.tmp1541, %.tmp1547
%err_len_t = alloca i32
store i32 %.tmp1548, i32* %err_len_t
%.tmp1549 = load i32, i32* %err_len_t
%.tmp1550 = call i8*(i32) @malloc(i32 %.tmp1549)
%err_buf_t = alloca i8*
store i8* %.tmp1550, i8** %err_buf_t
%.tmp1551 = load i8*, i8** %err_buf_t
%.tmp1552 = load i32, i32* %err_len_t
%.tmp1553 = load i8*, i8** %err_fmt_t
%.tmp1554 = load i8*, i8** %err_msg_t
%.tmp1555 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1556 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1555, i32 0, i32 1
%.tmp1557 = load i8*, i8** %.tmp1556
%.tmp1558 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1559 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1558, i32 0, i32 0
%.tmp1560 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1559
%.tmp1561 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1560, i32 0, i32 0
%.tmp1562 = load i8*, i8** %.tmp1561
%.tmp1563 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1551, i32 %.tmp1552, i8* %.tmp1553, i8* %.tmp1554, i8* %.tmp1557, i8* %.tmp1562)
%.tmp1564 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1565 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1564, i32 0, i32 0
%.tmp1566 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1565
%.tmp1567 = load i8*, i8** %err_buf_t
%.tmp1568 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1566, i8* %.tmp1567)
store %m717$.Error.type* %.tmp1568, %m717$.Error.type** %err
br label %.if.end.1502
.if.end.1502:
br label %.if.end.1491
.if.false.1491:
%.tmp1569 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1570 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1569, i32 0, i32 0
%.tmp1571 = load i8, i8* %.tmp1570
%.tmp1572 = icmp eq i8 %.tmp1571, 97
br i1 %.tmp1572, label %.if.true.1573, label %.if.false.1573
.if.true.1573:
%.tmp1574 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1575 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1574, i32 0, i32 1
%.tmp1576 = load %m286$.Rule.type**, %m286$.Rule.type*** %.tmp1575
%.tmp1577 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1578 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1577, i32 0, i32 1
%.tmp1579 = load i8*, i8** %.tmp1578
%.tmp1580 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1576, i8* %.tmp1579)
%alias_rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1580, %m286$.Rule.type** %alias_rule
%.tmp1581 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1582 = icmp eq %m286$.Rule.type* %.tmp1581, null
br i1 %.tmp1582, label %.if.true.1583, label %.if.false.1583
.if.true.1583:
%.tmp1584 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1585 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1584, i32 0, i32 0
%.tmp1586 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1585
%.tmp1588 = getelementptr [30 x i8], [30 x i8]*@.str1587, i32 0, i32 0
%.tmp1589 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1586, i8* %.tmp1588)
store %m717$.Error.type* %.tmp1589, %m717$.Error.type** %err
br label %.if.end.1583
.if.false.1583:
%.tmp1590 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1591 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1592 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1590, %m286$.Rule.type* %.tmp1591)
%parse_result = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1592, %m286$.ParseResult.type** %parse_result
%.tmp1593 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1594 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1593, i32 0, i32 0
%.tmp1595 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1594
%.tmp1596 = icmp ne %m717$.Error.type* %.tmp1595, null
br i1 %.tmp1596, label %.if.true.1597, label %.if.false.1597
.if.true.1597:
%.tmp1598 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1599 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1598, i32 0, i32 0
%.tmp1600 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1599
store %m717$.Error.type* %.tmp1600, %m717$.Error.type** %err
br label %.if.end.1597
.if.false.1597:
%.tmp1601 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1602 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1603 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1602, i32 0, i32 1
%.tmp1604 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1603
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1601, %m286$.Node.type* %.tmp1604)
%.tmp1605 = load i32, i32* %new_children
%.tmp1606 = add i32 %.tmp1605, 1
store i32 %.tmp1606, i32* %new_children
br label %.if.end.1597
.if.end.1597:
%.tmp1607 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1608 = bitcast %m286$.ParseResult.type* %.tmp1607 to i8*
call void(i8*) @free(i8* %.tmp1608)
br label %.if.end.1583
.if.end.1583:
br label %.if.end.1573
.if.false.1573:
%.tmp1610 = getelementptr [41 x i8], [41 x i8]*@.str1609, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1610)
br label %.if.end.1573
.if.end.1573:
br label %.if.end.1491
.if.end.1491:
br label %.if.end.1384
.if.end.1384:
%.tmp1611 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1612 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1611, i32 0, i32 2
%.tmp1613 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1612
store %m286$.Query.type* %.tmp1613, %m286$.Query.type** %q
br label %.for.start.1371
.for.end.1371:
%.tmp1614 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1615 = icmp ne %m717$.Error.type* %.tmp1614, null
br i1 %.tmp1615, label %.if.true.1616, label %.if.false.1616
.if.true.1616:
%.tmp1617 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1618 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1617, i32 0, i32 0
%.tmp1619 = load %m287$.Token.type*, %m287$.Token.type** %start_token
store %m287$.Token.type* %.tmp1619, %m287$.Token.type** %.tmp1618
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1620
.for.start.1620:
%.tmp1621 = load i32, i32* %i
%.tmp1622 = load i32, i32* %new_children
%.tmp1623 = icmp slt i32 %.tmp1621, %.tmp1622
br i1 %.tmp1623, label %.for.continue.1620, label %.for.end.1620
.for.continue.1620:
%.tmp1624 = load %m286$.Node.type*, %m286$.Node.type** %base
call void(%m286$.Node.type*) @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.tmp1624)
%.tmp1625 = load i32, i32* %i
%.tmp1626 = add i32 %.tmp1625, 1
store i32 %.tmp1626, i32* %i
br label %.for.start.1620
.for.end.1620:
br label %.if.end.1616
.if.false.1616:
br label %.if.end.1616
.if.end.1616:
%.tmp1627 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1628 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1627, i32 0, i32 2
%.tmp1629 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1628
%.tmp1630 = icmp ne %m286$.Matcher.type* %.tmp1629, null
%.tmp1631 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1632 = icmp ne %m717$.Error.type* %.tmp1631, null
%.tmp1633 = and i1 %.tmp1630, %.tmp1632
br i1 %.tmp1633, label %.if.true.1634, label %.if.false.1634
.if.true.1634:
%.tmp1635 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1636 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1637 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1636, i32 0, i32 2
%.tmp1638 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1637
%.tmp1639 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1640 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1635, %m286$.Matcher.type* %.tmp1638, %m286$.Node.type* %.tmp1639)
%new_err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1640, %m717$.Error.type** %new_err
%.tmp1641 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1642 = icmp eq %m717$.Error.type* %.tmp1641, null
br i1 %.tmp1642, label %.if.true.1643, label %.if.false.1643
.if.true.1643:
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1643
.if.false.1643:
%.tmp1644 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1645 = bitcast %m717$.Error.type* %.tmp1644 to i8*
call void(i8*) @free(i8* %.tmp1645)
br label %.if.end.1643
.if.end.1643:
br label %.if.end.1634
.if.false.1634:
br label %.if.end.1634
.if.end.1634:
%.tmp1646 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1647 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1646, i32 0, i32 1
%.tmp1648 = load i8, i8* %.tmp1647
%.tmp1649 = icmp eq i8 %.tmp1648, 49
br i1 %.tmp1649, label %.if.true.1650, label %.if.false.1650
.if.true.1650:
br label %.if.end.1650
.if.false.1650:
%.tmp1651 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1652 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1651, i32 0, i32 1
%.tmp1653 = load i8, i8* %.tmp1652
%.tmp1654 = icmp eq i8 %.tmp1653, 43
%.tmp1655 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1656 = icmp eq %m717$.Error.type* %.tmp1655, null
%.tmp1657 = and i1 %.tmp1654, %.tmp1656
br i1 %.tmp1657, label %.if.true.1658, label %.if.false.1658
.if.true.1658:
%.tmp1659 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1660 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1661 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1662 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1659, %m286$.Matcher.type* %.tmp1660, %m286$.Node.type* %.tmp1661)
store %m717$.Error.type* %.tmp1662, %m717$.Error.type** %err
%.tmp1663 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1664 = icmp ne %m717$.Error.type* %.tmp1663, null
br i1 %.tmp1664, label %.if.true.1665, label %.if.false.1665
.if.true.1665:
%.tmp1666 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1667 = bitcast %m717$.Error.type* %.tmp1666 to i8*
call void(i8*) @free(i8* %.tmp1667)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1665
.if.false.1665:
%.tmp1668 = bitcast ptr null to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1668
br label %.if.end.1665
.if.end.1665:
br label %.if.end.1658
.if.false.1658:
%.tmp1669 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1670 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1669, i32 0, i32 1
%.tmp1671 = load i8, i8* %.tmp1670
%.tmp1672 = icmp eq i8 %.tmp1671, 63
%.tmp1673 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1674 = icmp ne %m717$.Error.type* %.tmp1673, null
%.tmp1675 = and i1 %.tmp1672, %.tmp1674
br i1 %.tmp1675, label %.if.true.1676, label %.if.false.1676
.if.true.1676:
%.tmp1677 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1678 = bitcast %m717$.Error.type* %.tmp1677 to i8*
call void(i8*) @free(i8* %.tmp1678)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1676
.if.false.1676:
%.tmp1679 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1680 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1679, i32 0, i32 1
%.tmp1681 = load i8, i8* %.tmp1680
%.tmp1682 = icmp eq i8 %.tmp1681, 42
br i1 %.tmp1682, label %.if.true.1683, label %.if.false.1683
.if.true.1683:
%.tmp1684 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1685 = icmp ne %m717$.Error.type* %.tmp1684, null
br i1 %.tmp1685, label %.if.true.1686, label %.if.false.1686
.if.true.1686:
%.tmp1687 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1688 = bitcast %m717$.Error.type* %.tmp1687 to i8*
call void(i8*) @free(i8* %.tmp1688)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1686
.if.false.1686:
%.tmp1689 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1690 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1691 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1692 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1689, %m286$.Matcher.type* %.tmp1690, %m286$.Node.type* %.tmp1691)
ret %m717$.Error.type* %.tmp1692
br label %.if.end.1686
.if.end.1686:
br label %.if.end.1683
.if.false.1683:
br label %.if.end.1683
.if.end.1683:
br label %.if.end.1676
.if.end.1676:
br label %.if.end.1658
.if.end.1658:
br label %.if.end.1650
.if.end.1650:
%.tmp1693 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1694 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1693, i32 0, i32 3
%.tmp1695 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1694
%.tmp1696 = icmp ne %m286$.Matcher.type* %.tmp1695, null
%.tmp1697 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1698 = icmp eq %m717$.Error.type* %.tmp1697, null
%.tmp1699 = and i1 %.tmp1696, %.tmp1698
br i1 %.tmp1699, label %.if.true.1700, label %.if.false.1700
.if.true.1700:
%.tmp1701 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1702 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1703 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1702, i32 0, i32 3
%.tmp1704 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1703
%.tmp1705 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1706 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1701, %m286$.Matcher.type* %.tmp1704, %m286$.Node.type* %.tmp1705)
store %m717$.Error.type* %.tmp1706, %m717$.Error.type** %err
br label %.if.end.1700
.if.false.1700:
br label %.if.end.1700
.if.end.1700:
%.tmp1707 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1708 = bitcast %m717$.Error.type* %.tmp1707 to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1708
}
define %m286$.ParseResult.type* @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.c.arg, %m286$.Rule.type* %.rule.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.rule.arg, %m286$.Rule.type** %rule
%.tmp1709 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* null, i32 1
%.tmp1710 = ptrtoint %m286$.ParseResult.type* %.tmp1709 to i32
%.tmp1711 = call i8*(i32) @malloc(i32 %.tmp1710)
%.tmp1712 = bitcast i8* %.tmp1711 to %m286$.ParseResult.type*
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1712, %m286$.ParseResult.type** %res
%.tmp1713 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1714 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1713, i32 0, i32 0
store %m717$.Error.type* null, %m717$.Error.type** %.tmp1714
%.tmp1715 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1716 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1715, i32 0, i32 1
%.tmp1717 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1718 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1717, i32 0, i32 0
%.tmp1719 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1718
%.tmp1720 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1721 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1720, i32 0, i32 0
%.tmp1722 = load i8*, i8** %.tmp1721
%.tmp1723 = bitcast ptr null to i8*
%.tmp1724 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1719, i8* %.tmp1722, i8* %.tmp1723)
store %m286$.Node.type* %.tmp1724, %m286$.Node.type** %.tmp1716
%.tmp1725 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1726 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1725, i32 0, i32 0
%.tmp1727 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1726
%start_match = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1727, %m287$.Token.type** %start_match
%.tmp1728 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1729 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1728, i32 0, i32 0
%.tmp1730 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1731 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1732 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1731, i32 0, i32 1
%.tmp1733 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1732
%.tmp1734 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1735 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1734, i32 0, i32 1
%.tmp1736 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1735
%.tmp1737 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1730, %m286$.Matcher.type* %.tmp1733, %m286$.Node.type* %.tmp1736)
store %m717$.Error.type* %.tmp1737, %m717$.Error.type** %.tmp1729
%.tmp1738 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1738
}
define %m286$.ParseResult.type* @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.grammar.arg, i8* %.start.arg, %m287$.Token.type* %.tokens.arg) {
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.grammar.arg, %m286$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tokens.arg, %m287$.Token.type** %tokens
%.tmp1739 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1740 = load i8*, i8** %start
%.tmp1741 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1739, i8* %.tmp1740)
%start_matcher = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1741, %m286$.Rule.type** %start_matcher
%.tmp1742 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1743 = icmp ne %m286$.Rule.type* %.tmp1742, null
%.tmp1745 = getelementptr [44 x i8], [44 x i8]*@.str1744, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1743, i8* %.tmp1745)
%c = alloca %m286$.AstContext.type
%.tmp1746 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
store %m287$.Token.type* null, %m287$.Token.type** %.tmp1746
%.tmp1747 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
store %m286$.Rule.type** null, %m286$.Rule.type*** %.tmp1747
%.tmp1748 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1749 = load %m287$.Token.type*, %m287$.Token.type** %tokens
store %m287$.Token.type* %.tmp1749, %m287$.Token.type** %.tmp1748
%.tmp1750 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
%.tmp1751 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
store %m286$.Rule.type** %.tmp1751, %m286$.Rule.type*** %.tmp1750
%.tmp1752 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0
%.tmp1753 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1754 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1752, %m286$.Rule.type* %.tmp1753)
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1754, %m286$.ParseResult.type** %res
%.tmp1755 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1756 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1755
%.tmp1757 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1756, i32 0, i32 0
%.tmp1758 = load i8*, i8** %.tmp1757
%.tmp1760 = getelementptr [4 x i8], [4 x i8]*@.str1759, i32 0, i32 0
%.tmp1761 = call i32(i8*,i8*) @strcmp(i8* %.tmp1758, i8* %.tmp1760)
%.tmp1762 = icmp ne i32 %.tmp1761, 0
%.tmp1763 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1764 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1763, i32 0, i32 0
%.tmp1765 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1764
%.tmp1766 = icmp eq %m717$.Error.type* %.tmp1765, null
%.tmp1767 = and i1 %.tmp1762, %.tmp1766
br i1 %.tmp1767, label %.if.true.1768, label %.if.false.1768
.if.true.1768:
%.tmp1769 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1770 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1769, i32 0, i32 0
%.tmp1771 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1772 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1771
%.tmp1774 = getelementptr [26 x i8], [26 x i8]*@.str1773, i32 0, i32 0
%.tmp1775 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1772, i8* %.tmp1774)
store %m717$.Error.type* %.tmp1775, %m717$.Error.type** %.tmp1770
br label %.if.end.1768
.if.false.1768:
br label %.if.end.1768
.if.end.1768:
%.tmp1776 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1776
}
@.str811 = constant [2 x i8] c"(\00"
@.str830 = constant [2 x i8] c"|\00"
@.str849 = constant [2 x i8] c")\00"
@.str858 = constant [4 x i8] c"EOF\00"
@.str875 = constant [2 x i8] c"|\00"
@.str884 = constant [2 x i8] c")\00"
@.str890 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str913 = constant [2 x i8] c"|\00"
@.str930 = constant [2 x i8] c")\00"
@.str936 = constant [22 x i8] c"open brace not closed\00"
@.str950 = constant [2 x i8] c"+\00"
@.str969 = constant [2 x i8] c"*\00"
@.str988 = constant [2 x i8] c"?\00"
@.str1009 = constant [2 x i8] c"(\00"
@.str1018 = constant [5 x i8] c"WORD\00"
@.str1037 = constant [5 x i8] c"WORD\00"
@.str1044 = constant [7 x i8] c"STRING\00"
@.str1084 = constant [7 x i8] c"STRING\00"
@.str1109 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1118 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1149 = constant [5 x i8] c"WORD\00"
@.str1154 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1168 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1182 = constant [2 x i8] c":\00"
@.str1194 = constant [27 x i8] c"expected : after rule name\00"
@.str1232 = constant [4 x i8] c"EOF\00"
@.str1241 = constant [3 x i8] c"NL\00"
@.str1396 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1452 = constant [7 x i8] c"(null)\00"
@.str1454 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1456 = constant [31 x i8] c"unable to match token by value\00"
@.str1528 = constant [13 x i8] c"%s: %s != %s\00"
@.str1530 = constant [30 x i8] c"unable to match token by type\00"
@.str1587 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1609 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1744 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1759 = constant [4 x i8] c"EOF\00"
@.str1773 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1778$grammar.cp() {
%.tmp1780 = getelementptr [1652 x i8], [1652 x i8]*@.str1779, i32 0, i32 0
ret i8* %.tmp1780
}
@.str1779 = constant [1652 x i8] c"
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

type: ( \22void\22 | \22int\22 | \22bool\22 | \22chr\22 | \22str\22 | structdef | dotted_name | \22...\22 ) (\22[\22 \22]\22)* (\22*\22)*

if_block: \22if\22 assignable block (elif_block)? (NL)

elif_block: (\22elif\22 assignable block (elif_block)? | else_block)

else_block: \22else\22 block

return: \22return\22 (assignable)? (NL)

declaration: ( type WORD \22=\22 assignable | WORD \22:\22 \22=\22 assignable | type WORD )

assignment: destination \22=\22 assignable

fn_args: assignable ( \22,\22 assignable )*

fn_call: (destination \22(\22) (fn_args)? (\22)\22)

keyword: (\22break\22 | \22continue\22)

expression: ( if_block | return | keyword | for_loop | assignment | fn_call | declaration | NL )

block: \22{\22 NL (expression)* (\22}\22)

for_loop: \22for\22 (declaration | assignment)? (\22;\22) (assignable)? (\22;\22) (assignment)? block
\00"
define i8* @m1781$node_to_string.cp.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp1782 = call %m0$.File.type*() @tmpfile()
%tmp = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1782, %m0$.File.type** %tmp
%.tmp1783 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp1784 = load %m0$.File.type*, %m0$.File.type** %tmp
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1781$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1783, %m0$.File.type* %.tmp1784, i32 1)
%.tmp1785 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1786 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1785)
%.tmp1787 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1788 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1787)
%str_len = alloca i32
store i32 %.tmp1788, i32* %str_len
%.tmp1789 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1790 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1789)
%tmp_fd = alloca i32
store i32 %.tmp1790, i32* %tmp_fd
%.tmp1791 = load i32, i32* %tmp_fd
%.tmp1792 = load i32, i32* @SEEK_SET
%.tmp1793 = call i32(i32,i32,i32) @lseek(i32 %.tmp1791, i32 0, i32 %.tmp1792)
%.tmp1794 = load i32, i32* %str_len
%.tmp1795 = call i8*(i32) @malloc(i32 %.tmp1794)
%buf = alloca i8*
store i8* %.tmp1795, i8** %buf
%.tmp1796 = load i32, i32* %tmp_fd
%.tmp1797 = load i8*, i8** %buf
%.tmp1798 = load i32, i32* %str_len
%.tmp1799 = call i32(i32,i8*,i32) @read(i32 %.tmp1796, i8* %.tmp1797, i32 %.tmp1798)
%read = alloca i32
store i32 %.tmp1799, i32* %read
%.tmp1800 = load i32, i32* %read
%.tmp1801 = load i32, i32* %str_len
%.tmp1802 = icmp ne i32 %.tmp1800, %.tmp1801
br i1 %.tmp1802, label %.if.true.1803, label %.if.false.1803
.if.true.1803:
%.tmp1804 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp1804)
store i8* null, i8** %buf
br label %.if.end.1803
.if.false.1803:
br label %.if.end.1803
.if.end.1803:
%.tmp1805 = load i8*, i8** %buf
ret i8* %.tmp1805
}
define void @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1806 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1808 = getelementptr [2 x i8], [2 x i8]*@.str1807, i32 0, i32 0
%.tmp1809 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1806, i8* %.tmp1808)
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1810
.for.start.1810:
%.tmp1811 = load i32, i32* %i
%.tmp1812 = load i32, i32* %indent
%.tmp1813 = icmp slt i32 %.tmp1811, %.tmp1812
br i1 %.tmp1813, label %.for.continue.1810, label %.for.end.1810
.for.continue.1810:
%.tmp1814 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1816 = getelementptr [3 x i8], [3 x i8]*@.str1815, i32 0, i32 0
%.tmp1817 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1814, i8* %.tmp1816)
%.tmp1818 = load i32, i32* %i
%.tmp1819 = add i32 %.tmp1818, 1
store i32 %.tmp1819, i32* %i
br label %.for.start.1810
.for.end.1810:
ret void
}
define void @m1781$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1820 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1821 = icmp eq %m286$.Node.type* %.tmp1820, null
br i1 %.tmp1821, label %.if.true.1822, label %.if.false.1822
.if.true.1822:
%.tmp1823 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1825 = getelementptr [7 x i8], [7 x i8]*@.str1824, i32 0, i32 0
%.tmp1826 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1823, i8* %.tmp1825)
ret void
br label %.if.end.1822
.if.false.1822:
br label %.if.end.1822
.if.end.1822:
%.tmp1827 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1829 = getelementptr [2 x i8], [2 x i8]*@.str1828, i32 0, i32 0
%.tmp1830 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1827, i8* %.tmp1829)
%.tmp1831 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1832 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1831, i32 %.tmp1832)
%.tmp1833 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1835 = getelementptr [13 x i8], [13 x i8]*@.str1834, i32 0, i32 0
%.tmp1836 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1837 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1836, i32 0, i32 0
%.tmp1838 = load i8*, i8** %.tmp1837
%.tmp1839 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1833, i8* %.tmp1835, i8* %.tmp1838)
%.tmp1840 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1841 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1840, i32 %.tmp1841)
%.tmp1842 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1844 = getelementptr [12 x i8], [12 x i8]*@.str1843, i32 0, i32 0
%.tmp1845 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1846 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1845, i32 0, i32 1
%.tmp1847 = load i8*, i8** %.tmp1846
%.tmp1848 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1842, i8* %.tmp1844, i8* %.tmp1847)
%.tmp1849 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1850 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1849, i32 %.tmp1850)
%.tmp1851 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1853 = getelementptr [11 x i8], [11 x i8]*@.str1852, i32 0, i32 0
%.tmp1854 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1855 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1854, i32 0, i32 3
%.tmp1856 = load i32, i32* %.tmp1855
%.tmp1857 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1851, i8* %.tmp1853, i32 %.tmp1856)
%.tmp1858 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1859 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1858, i32 %.tmp1859)
%.tmp1860 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1862 = getelementptr [19 x i8], [19 x i8]*@.str1861, i32 0, i32 0
%.tmp1863 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1864 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1863, i32 0, i32 4
%.tmp1865 = load i32, i32* %.tmp1864
%.tmp1866 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1860, i8* %.tmp1862, i32 %.tmp1865)
%.tmp1867 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1868 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1867, i32 %.tmp1868)
%.tmp1869 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1871 = getelementptr [9 x i8], [9 x i8]*@.str1870, i32 0, i32 0
%.tmp1872 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1869, i8* %.tmp1871)
%.tmp1873 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1874 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1873, i32 0, i32 7
%.tmp1875 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1874
%.tmp1876 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1877 = load i32, i32* %indent
%.tmp1878 = add i32 %.tmp1877, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1781$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1875, %m0$.File.type* %.tmp1876, i32 %.tmp1878)
%.tmp1879 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1880 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1879, i32 %.tmp1880)
%.tmp1881 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1883 = getelementptr [13 x i8], [13 x i8]*@.str1882, i32 0, i32 0
%.tmp1884 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1881, i8* %.tmp1883)
%.tmp1885 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1886 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1885, i32 0, i32 6
%.tmp1887 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1886
%.tmp1888 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1889 = load i32, i32* %indent
%.tmp1890 = add i32 %.tmp1889, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1781$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1887, %m0$.File.type* %.tmp1888, i32 %.tmp1890)
%.tmp1891 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1892 = load i32, i32* %indent
%.tmp1893 = sub i32 %.tmp1892, 1
call void(%m0$.File.type*,i32) @m1781$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1891, i32 %.tmp1893)
%.tmp1894 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1896 = getelementptr [2 x i8], [2 x i8]*@.str1895, i32 0, i32 0
%.tmp1897 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1894, i8* %.tmp1896)
ret void
}
@.str1807 = constant [2 x i8] c"\0A\00"
@.str1815 = constant [3 x i8] c"  \00"
@.str1824 = constant [7 x i8] c"(null)\00"
@.str1828 = constant [2 x i8] c"{\00"
@.str1834 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1843 = constant [12 x i8] c"\22value\22: %s\00"
@.str1852 = constant [11 x i8] c"\22line\22: %d\00"
@.str1861 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1870 = constant [9 x i8] c"\22next\22: \00"
@.str1882 = constant [13 x i8] c"\22children\22: \00"
@.str1895 = constant [2 x i8] c"}\00"
%m1898$.SYStack.type = type {%m286$.Node.type*,%m1898$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1898$.SYStack.type* @m1898$stack_new.m1898$.SYStack.typep() {
%.tmp1899 = load i32, i32* @SYStack_size
%.tmp1900 = call i8*(i32) @malloc(i32 %.tmp1899)
%.tmp1901 = bitcast i8* %.tmp1900 to %m1898$.SYStack.type*
%s = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1901, %m1898$.SYStack.type** %s
%.tmp1902 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
%.tmp1903 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1902, i32 0, i32 0
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1903
%.tmp1904 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
%.tmp1905 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1904, i32 0, i32 1
store %m1898$.SYStack.type* null, %m1898$.SYStack.type** %.tmp1905
%.tmp1906 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
ret %m1898$.SYStack.type* %.tmp1906
}
define %m1898$.SYStack.type* @m1898$sy_algorithm.m1898$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.assignable.arg) {
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.assignable.arg, %m286$.Node.type** %assignable
%.tmp1907 = call %m1898$.SYStack.type*() @m1898$stack_new.m1898$.SYStack.typep()
%out_stack = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1907, %m1898$.SYStack.type** %out_stack
%.tmp1908 = call %m1898$.SYStack.type*() @m1898$stack_new.m1898$.SYStack.typep()
%op_stack = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1908, %m1898$.SYStack.type** %op_stack
%.tmp1909 = call %m1898$.SYStack.type*() @m1898$stack_new.m1898$.SYStack.typep()
%token_stack = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1909, %m1898$.SYStack.type** %token_stack
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %ptr
%.tmp1911 = load %m286$.Node.type*, %m286$.Node.type** %assignable
store %m286$.Node.type* %.tmp1911, %m286$.Node.type** %ptr
br label %.for.start.1910
.for.start.1910:
%.tmp1912 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1913 = icmp ne %m286$.Node.type* %.tmp1912, null
br i1 %.tmp1913, label %.for.continue.1910, label %.for.end.1910
.for.continue.1910:
%.tmp1914 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %token_stack
%.tmp1915 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1916 = call %m1898$.SYStack.type*(%m1898$.SYStack.type*,%m286$.Node.type*) @m1898$stack_push.m1898$.SYStack.typep.m1898$.SYStack.typep.m286$.Node.typep(%m1898$.SYStack.type* %.tmp1914, %m286$.Node.type* %.tmp1915)
store %m1898$.SYStack.type* %.tmp1916, %m1898$.SYStack.type** %token_stack
%.tmp1917 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1918 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1917, i32 0, i32 7
%.tmp1919 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1918
store %m286$.Node.type* %.tmp1919, %m286$.Node.type** %ptr
br label %.for.start.1910
.for.end.1910:
%.tmp1921 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %token_stack
%.tmp1922 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1921, i32 0, i32 0
%.tmp1923 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1922
store %m286$.Node.type* %.tmp1923, %m286$.Node.type** %ptr
br label %.for.start.1920
.for.start.1920:
%.tmp1924 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1925 = icmp ne %m286$.Node.type* %.tmp1924, null
br i1 %.tmp1925, label %.for.continue.1920, label %.for.end.1920
.for.continue.1920:
%.tmp1926 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %token_stack
%cs = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1926, %m1898$.SYStack.type** %cs
%.tmp1927 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %token_stack
%.tmp1928 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1927, i32 0, i32 1
%.tmp1929 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp1928
store %m1898$.SYStack.type* %.tmp1929, %m1898$.SYStack.type** %token_stack
%.tmp1930 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %cs
%.tmp1931 = bitcast %m1898$.SYStack.type* %.tmp1930 to i8*
call void(i8*) @free(i8* %.tmp1931)
%.tmp1932 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1933 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1932, i32 0, i32 0
%.tmp1934 = load i8*, i8** %.tmp1933
%.tmp1936 = getelementptr [16 x i8], [16 x i8]*@.str1935, i32 0, i32 0
%.tmp1937 = call i32(i8*,i8*) @strcmp(i8* %.tmp1934, i8* %.tmp1936)
%.tmp1938 = icmp eq i32 %.tmp1937, 0
br i1 %.tmp1938, label %.if.true.1939, label %.if.false.1939
.if.true.1939:
%.tmp1940 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %out_stack
%.tmp1941 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1942 = call %m1898$.SYStack.type*(%m1898$.SYStack.type*,%m286$.Node.type*) @m1898$stack_push.m1898$.SYStack.typep.m1898$.SYStack.typep.m286$.Node.typep(%m1898$.SYStack.type* %.tmp1940, %m286$.Node.type* %.tmp1941)
store %m1898$.SYStack.type* %.tmp1942, %m1898$.SYStack.type** %out_stack
br label %.if.end.1939
.if.false.1939:
%.tmp1943 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1944 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1943, i32 0, i32 0
%.tmp1945 = load i8*, i8** %.tmp1944
%.tmp1947 = getelementptr [9 x i8], [9 x i8]*@.str1946, i32 0, i32 0
%.tmp1948 = call i32(i8*,i8*) @strcmp(i8* %.tmp1945, i8* %.tmp1947)
%.tmp1949 = icmp eq i32 %.tmp1948, 0
br i1 %.tmp1949, label %.if.true.1950, label %.if.false.1950
.if.true.1950:
%quit = alloca i1
store i1 0, i1* %quit
br label %.for.start.1951
.for.start.1951:
%.tmp1952 = load i1, i1* %quit
%.tmp1953 = icmp eq i1 %.tmp1952, 0
br i1 %.tmp1953, label %.for.continue.1951, label %.for.end.1951
.for.continue.1951:
%.tmp1954 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp1955 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1954, i32 0, i32 0
%.tmp1956 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1955
%.tmp1957 = icmp eq %m286$.Node.type* %.tmp1956, null
br i1 %.tmp1957, label %.if.true.1958, label %.if.false.1958
.if.true.1958:
store i1 1, i1* %quit
br label %.if.end.1958
.if.false.1958:
%.tmp1959 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp1960 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1959, i32 0, i32 0
%.tmp1961 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1960
%.tmp1962 = call i32(%m286$.Node.type*) @m1898$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1961)
%.tmp1963 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1964 = call i32(%m286$.Node.type*) @m1898$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1963)
%.tmp1965 = icmp slt i32 %.tmp1962, %.tmp1964
br i1 %.tmp1965, label %.if.true.1966, label %.if.false.1966
.if.true.1966:
%.tmp1967 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%top = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1967, %m1898$.SYStack.type** %top
%.tmp1968 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp1969 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1968, i32 0, i32 1
%.tmp1970 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp1969
store %m1898$.SYStack.type* %.tmp1970, %m1898$.SYStack.type** %op_stack
%.tmp1971 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %out_stack
%.tmp1972 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %top
%.tmp1973 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1972, i32 0, i32 0
%.tmp1974 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1973
%.tmp1975 = call %m1898$.SYStack.type*(%m1898$.SYStack.type*,%m286$.Node.type*) @m1898$stack_push.m1898$.SYStack.typep.m1898$.SYStack.typep.m286$.Node.typep(%m1898$.SYStack.type* %.tmp1971, %m286$.Node.type* %.tmp1974)
store %m1898$.SYStack.type* %.tmp1975, %m1898$.SYStack.type** %out_stack
%.tmp1976 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %top
%.tmp1977 = bitcast %m1898$.SYStack.type* %.tmp1976 to i8*
call void(i8*) @free(i8* %.tmp1977)
br label %.if.end.1966
.if.false.1966:
store i1 1, i1* %quit
br label %.if.end.1966
.if.end.1966:
br label %.if.end.1958
.if.end.1958:
br label %.for.start.1951
.for.end.1951:
%.tmp1978 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp1979 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1980 = call %m1898$.SYStack.type*(%m1898$.SYStack.type*,%m286$.Node.type*) @m1898$stack_push.m1898$.SYStack.typep.m1898$.SYStack.typep.m286$.Node.typep(%m1898$.SYStack.type* %.tmp1978, %m286$.Node.type* %.tmp1979)
store %m1898$.SYStack.type* %.tmp1980, %m1898$.SYStack.type** %op_stack
br label %.if.end.1950
.if.false.1950:
%.tmp1982 = getelementptr [68 x i8], [68 x i8]*@.str1981, i32 0, i32 0
%.tmp1983 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1984 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1983, i32 0, i32 0
%.tmp1985 = load i8*, i8** %.tmp1984
%.tmp1986 = call i32(i8*,...) @printf(i8* %.tmp1982, i8* %.tmp1985)
br label %.if.end.1950
.if.end.1950:
br label %.if.end.1939
.if.end.1939:
%.tmp1987 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %token_stack
%.tmp1988 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1987, i32 0, i32 0
%.tmp1989 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1988
store %m286$.Node.type* %.tmp1989, %m286$.Node.type** %ptr
br label %.for.start.1920
.for.end.1920:
br label %.for.start.1990
.for.start.1990:
%.tmp1991 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp1992 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1991, i32 0, i32 0
%.tmp1993 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1992
%.tmp1994 = icmp ne %m286$.Node.type* %.tmp1993, null
br i1 %.tmp1994, label %.for.continue.1990, label %.for.end.1990
.for.continue.1990:
%.tmp1995 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp1996 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1995, i32 0, i32 0
%.tmp1997 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1996
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1997, %m286$.Node.type** %node
%.tmp1998 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%s = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp1998, %m1898$.SYStack.type** %s
%.tmp1999 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %op_stack
%.tmp2000 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp1999, i32 0, i32 1
%.tmp2001 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp2000
store %m1898$.SYStack.type* %.tmp2001, %m1898$.SYStack.type** %op_stack
%.tmp2002 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
%.tmp2003 = bitcast %m1898$.SYStack.type* %.tmp2002 to i8*
call void(i8*) @free(i8* %.tmp2003)
%.tmp2004 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %out_stack
%.tmp2005 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2006 = call %m1898$.SYStack.type*(%m1898$.SYStack.type*,%m286$.Node.type*) @m1898$stack_push.m1898$.SYStack.typep.m1898$.SYStack.typep.m286$.Node.typep(%m1898$.SYStack.type* %.tmp2004, %m286$.Node.type* %.tmp2005)
store %m1898$.SYStack.type* %.tmp2006, %m1898$.SYStack.type** %out_stack
br label %.for.start.1990
.for.end.1990:
%.tmp2007 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %out_stack
ret %m1898$.SYStack.type* %.tmp2007
}
define %m1898$.SYStack.type* @m1898$stack_push.m1898$.SYStack.typep.m1898$.SYStack.typep.m286$.Node.typep(%m1898$.SYStack.type* %.curr_stack.arg, %m286$.Node.type* %.node.arg) {
%curr_stack = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.curr_stack.arg, %m1898$.SYStack.type** %curr_stack
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2008 = load i32, i32* @SYStack_size
%.tmp2009 = call i8*(i32) @malloc(i32 %.tmp2008)
%.tmp2010 = bitcast i8* %.tmp2009 to %m1898$.SYStack.type*
%s = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp2010, %m1898$.SYStack.type** %s
%.tmp2011 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
%.tmp2012 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp2011, i32 0, i32 0
%.tmp2013 = load %m286$.Node.type*, %m286$.Node.type** %node
store %m286$.Node.type* %.tmp2013, %m286$.Node.type** %.tmp2012
%.tmp2014 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
%.tmp2015 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp2014, i32 0, i32 1
%.tmp2016 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %curr_stack
store %m1898$.SYStack.type* %.tmp2016, %m1898$.SYStack.type** %.tmp2015
%.tmp2017 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %s
ret %m1898$.SYStack.type* %.tmp2017
}
define i32 @m1898$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp2018 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp2019 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2018, i32 0, i32 6
%.tmp2020 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2019
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2020, %m286$.Node.type** %op
%.tmp2021 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2022 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2021, i32 0, i32 1
%.tmp2023 = load i8*, i8** %.tmp2022
%.tmp2025 = getelementptr [2 x i8], [2 x i8]*@.str2024, i32 0, i32 0
%.tmp2026 = call i32(i8*,i8*) @strcmp(i8* %.tmp2023, i8* %.tmp2025)
%.tmp2027 = icmp eq i32 %.tmp2026, 0
%.tmp2028 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2029 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2028, i32 0, i32 1
%.tmp2030 = load i8*, i8** %.tmp2029
%.tmp2032 = getelementptr [2 x i8], [2 x i8]*@.str2031, i32 0, i32 0
%.tmp2033 = call i32(i8*,i8*) @strcmp(i8* %.tmp2030, i8* %.tmp2032)
%.tmp2034 = icmp eq i32 %.tmp2033, 0
%.tmp2035 = or i1 %.tmp2027, %.tmp2034
br i1 %.tmp2035, label %.if.true.2036, label %.if.false.2036
.if.true.2036:
ret i32 4
br label %.if.end.2036
.if.false.2036:
%.tmp2037 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2038 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2037, i32 0, i32 1
%.tmp2039 = load i8*, i8** %.tmp2038
%.tmp2041 = getelementptr [2 x i8], [2 x i8]*@.str2040, i32 0, i32 0
%.tmp2042 = call i32(i8*,i8*) @strcmp(i8* %.tmp2039, i8* %.tmp2041)
%.tmp2043 = icmp eq i32 %.tmp2042, 0
%.tmp2044 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2045 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2044, i32 0, i32 1
%.tmp2046 = load i8*, i8** %.tmp2045
%.tmp2048 = getelementptr [2 x i8], [2 x i8]*@.str2047, i32 0, i32 0
%.tmp2049 = call i32(i8*,i8*) @strcmp(i8* %.tmp2046, i8* %.tmp2048)
%.tmp2050 = icmp eq i32 %.tmp2049, 0
%.tmp2051 = or i1 %.tmp2043, %.tmp2050
br i1 %.tmp2051, label %.if.true.2052, label %.if.false.2052
.if.true.2052:
ret i32 3
br label %.if.end.2052
.if.false.2052:
%.tmp2053 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2054 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2053, i32 0, i32 1
%.tmp2055 = load i8*, i8** %.tmp2054
%.tmp2057 = getelementptr [3 x i8], [3 x i8]*@.str2056, i32 0, i32 0
%.tmp2058 = call i32(i8*,i8*) @strcmp(i8* %.tmp2055, i8* %.tmp2057)
%.tmp2059 = icmp eq i32 %.tmp2058, 0
%.tmp2060 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2061 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2060, i32 0, i32 1
%.tmp2062 = load i8*, i8** %.tmp2061
%.tmp2064 = getelementptr [3 x i8], [3 x i8]*@.str2063, i32 0, i32 0
%.tmp2065 = call i32(i8*,i8*) @strcmp(i8* %.tmp2062, i8* %.tmp2064)
%.tmp2066 = icmp eq i32 %.tmp2065, 0
%.tmp2067 = or i1 %.tmp2059, %.tmp2066
br i1 %.tmp2067, label %.if.true.2068, label %.if.false.2068
.if.true.2068:
ret i32 7
br label %.if.end.2068
.if.false.2068:
%.tmp2069 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2070 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2069, i32 0, i32 1
%.tmp2071 = load i8*, i8** %.tmp2070
%.tmp2073 = getelementptr [3 x i8], [3 x i8]*@.str2072, i32 0, i32 0
%.tmp2074 = call i32(i8*,i8*) @strcmp(i8* %.tmp2071, i8* %.tmp2073)
%.tmp2075 = icmp eq i32 %.tmp2074, 0
%.tmp2076 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2077 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2076, i32 0, i32 1
%.tmp2078 = load i8*, i8** %.tmp2077
%.tmp2080 = getelementptr [3 x i8], [3 x i8]*@.str2079, i32 0, i32 0
%.tmp2081 = call i32(i8*,i8*) @strcmp(i8* %.tmp2078, i8* %.tmp2080)
%.tmp2082 = icmp eq i32 %.tmp2081, 0
%.tmp2083 = or i1 %.tmp2075, %.tmp2082
br i1 %.tmp2083, label %.if.true.2084, label %.if.false.2084
.if.true.2084:
ret i32 6
br label %.if.end.2084
.if.false.2084:
%.tmp2085 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2086 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2085, i32 0, i32 1
%.tmp2087 = load i8*, i8** %.tmp2086
%.tmp2089 = getelementptr [2 x i8], [2 x i8]*@.str2088, i32 0, i32 0
%.tmp2090 = call i32(i8*,i8*) @strcmp(i8* %.tmp2087, i8* %.tmp2089)
%.tmp2091 = icmp eq i32 %.tmp2090, 0
%.tmp2092 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2093 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2092, i32 0, i32 1
%.tmp2094 = load i8*, i8** %.tmp2093
%.tmp2096 = getelementptr [2 x i8], [2 x i8]*@.str2095, i32 0, i32 0
%.tmp2097 = call i32(i8*,i8*) @strcmp(i8* %.tmp2094, i8* %.tmp2096)
%.tmp2098 = icmp eq i32 %.tmp2097, 0
%.tmp2099 = or i1 %.tmp2091, %.tmp2098
br i1 %.tmp2099, label %.if.true.2100, label %.if.false.2100
.if.true.2100:
ret i32 6
br label %.if.end.2100
.if.false.2100:
%.tmp2101 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2102 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2101, i32 0, i32 1
%.tmp2103 = load i8*, i8** %.tmp2102
%.tmp2105 = getelementptr [2 x i8], [2 x i8]*@.str2104, i32 0, i32 0
%.tmp2106 = call i32(i8*,i8*) @strcmp(i8* %.tmp2103, i8* %.tmp2105)
%.tmp2107 = icmp eq i32 %.tmp2106, 0
br i1 %.tmp2107, label %.if.true.2108, label %.if.false.2108
.if.true.2108:
ret i32 11
br label %.if.end.2108
.if.false.2108:
%.tmp2109 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2110 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2109, i32 0, i32 1
%.tmp2111 = load i8*, i8** %.tmp2110
%.tmp2113 = getelementptr [2 x i8], [2 x i8]*@.str2112, i32 0, i32 0
%.tmp2114 = call i32(i8*,i8*) @strcmp(i8* %.tmp2111, i8* %.tmp2113)
%.tmp2115 = icmp eq i32 %.tmp2114, 0
br i1 %.tmp2115, label %.if.true.2116, label %.if.false.2116
.if.true.2116:
ret i32 12
br label %.if.end.2116
.if.false.2116:
br label %.if.end.2116
.if.end.2116:
br label %.if.end.2108
.if.end.2108:
br label %.if.end.2100
.if.end.2100:
br label %.if.end.2084
.if.end.2084:
br label %.if.end.2068
.if.end.2068:
br label %.if.end.2052
.if.end.2052:
br label %.if.end.2036
.if.end.2036:
%.tmp2118 = getelementptr [65 x i8], [65 x i8]*@.str2117, i32 0, i32 0
%.tmp2119 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2120 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2119, i32 0, i32 1
%.tmp2121 = load i8*, i8** %.tmp2120
%.tmp2122 = call i32(i8*,...) @printf(i8* %.tmp2118, i8* %.tmp2121)
ret i32 4
}
@.str1935 = constant [16 x i8] c"mono_assignable\00"
@.str1946 = constant [9 x i8] c"operator\00"
@.str1981 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2024 = constant [2 x i8] c"+\00"
@.str2031 = constant [2 x i8] c"-\00"
@.str2040 = constant [2 x i8] c"*\00"
@.str2047 = constant [2 x i8] c"/\00"
@.str2056 = constant [3 x i8] c"==\00"
@.str2063 = constant [3 x i8] c"!=\00"
@.str2072 = constant [3 x i8] c">=\00"
@.str2079 = constant [3 x i8] c"<=\00"
@.str2088 = constant [2 x i8] c">\00"
@.str2095 = constant [2 x i8] c"<\00"
@.str2104 = constant [2 x i8] c"&\00"
@.str2112 = constant [2 x i8] c"|\00"
@.str2117 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
define i8* @m2123$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2124 = load i8*, i8** %text
%.tmp2125 = call i32(i8*) @strlen(i8* %.tmp2124)
%str_len = alloca i32
store i32 %.tmp2125, i32* %str_len
%dest_string = alloca {i32,i32,i8*}
%.tmp2126 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
store i32 0, i32* %.tmp2126
%.tmp2127 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2127
%.tmp2128 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
store i8* null, i8** %.tmp2128
%.tmp2129 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2130 = load i32, i32* %str_len
store i32 %.tmp2130, i32* %.tmp2129
%.tmp2131 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2131
%.tmp2132 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2133 = load i32, i32* %str_len
%.tmp2134 = call i8*(i32) @malloc(i32 %.tmp2133)
store i8* %.tmp2134, i8** %.tmp2132
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.2135
.for.start.2135:
%.tmp2136 = load i32, i32* %i
%.tmp2137 = load i32, i32* %str_len
%.tmp2138 = sub i32 %.tmp2137, 1
%.tmp2139 = icmp slt i32 %.tmp2136, %.tmp2138
br i1 %.tmp2139, label %.for.continue.2135, label %.for.end.2135
.for.continue.2135:
%.tmp2140 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2141 = load i32, i32* %.tmp2140
%.tmp2142 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2143 = load i32, i32* %.tmp2142
%.tmp2144 = sub i32 %.tmp2143, 4
%.tmp2145 = icmp eq i32 %.tmp2141, %.tmp2144
br i1 %.tmp2145, label %.if.true.2146, label %.if.false.2146
.if.true.2146:
%.tmp2147 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2148 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2149 = load i8*, i8** %.tmp2148
%.tmp2150 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2151 = load i32, i32* %.tmp2150
%.tmp2152 = mul i32 %.tmp2151, 2
%.tmp2153 = call i8*(i8*,i32) @realloc(i8* %.tmp2149, i32 %.tmp2152)
store i8* %.tmp2153, i8** %.tmp2147
br label %.if.end.2146
.if.false.2146:
br label %.if.end.2146
.if.end.2146:
%.tmp2154 = load i32, i32* %i
%.tmp2155 = load i8*, i8** %text
%.tmp2156 = getelementptr i8, i8* %.tmp2155, i32 %.tmp2154
%.tmp2157 = load i8, i8* %.tmp2156
%.tmp2158 = icmp eq i8 %.tmp2157, 34
br i1 %.tmp2158, label %.if.true.2159, label %.if.false.2159
.if.true.2159:
%.tmp2160 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2161 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2162 = load i32, i32* %.tmp2161
%.tmp2163 = load i8*, i8** %.tmp2160
%.tmp2164 = getelementptr i8, i8* %.tmp2163, i32 %.tmp2162
store i8 92, i8* %.tmp2164
%.tmp2165 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2166 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2167 = load i32, i32* %.tmp2166
%.tmp2168 = add i32 %.tmp2167, 1
store i32 %.tmp2168, i32* %.tmp2165
%.tmp2169 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2170 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2171 = load i32, i32* %.tmp2170
%.tmp2172 = load i8*, i8** %.tmp2169
%.tmp2173 = getelementptr i8, i8* %.tmp2172, i32 %.tmp2171
store i8 50, i8* %.tmp2173
%.tmp2174 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2175 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2176 = load i32, i32* %.tmp2175
%.tmp2177 = add i32 %.tmp2176, 1
store i32 %.tmp2177, i32* %.tmp2174
%.tmp2178 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2179 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2180 = load i32, i32* %.tmp2179
%.tmp2181 = load i8*, i8** %.tmp2178
%.tmp2182 = getelementptr i8, i8* %.tmp2181, i32 %.tmp2180
store i8 50, i8* %.tmp2182
br label %.if.end.2159
.if.false.2159:
%.tmp2183 = load i32, i32* %i
%.tmp2184 = load i8*, i8** %text
%.tmp2185 = getelementptr i8, i8* %.tmp2184, i32 %.tmp2183
%.tmp2186 = load i8, i8* %.tmp2185
%.tmp2187 = icmp eq i8 %.tmp2186, 92
br i1 %.tmp2187, label %.if.true.2188, label %.if.false.2188
.if.true.2188:
%.tmp2189 = load i32, i32* %i
%.tmp2190 = add i32 %.tmp2189, 1
%.tmp2191 = load i8*, i8** %text
%.tmp2192 = getelementptr i8, i8* %.tmp2191, i32 %.tmp2190
%.tmp2193 = load i8, i8* %.tmp2192
%.tmp2194 = icmp eq i8 %.tmp2193, 110
%.tmp2195 = load i32, i32* %i
%.tmp2196 = add i32 %.tmp2195, 1
%.tmp2197 = load i8*, i8** %text
%.tmp2198 = getelementptr i8, i8* %.tmp2197, i32 %.tmp2196
%.tmp2199 = load i8, i8* %.tmp2198
%.tmp2200 = icmp eq i8 %.tmp2199, 78
%.tmp2201 = or i1 %.tmp2194, %.tmp2200
br i1 %.tmp2201, label %.if.true.2202, label %.if.false.2202
.if.true.2202:
%.tmp2203 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2204 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2205 = load i32, i32* %.tmp2204
%.tmp2206 = load i8*, i8** %.tmp2203
%.tmp2207 = getelementptr i8, i8* %.tmp2206, i32 %.tmp2205
store i8 92, i8* %.tmp2207
%.tmp2208 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2209 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2210 = load i32, i32* %.tmp2209
%.tmp2211 = add i32 %.tmp2210, 1
store i32 %.tmp2211, i32* %.tmp2208
%.tmp2212 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2213 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2214 = load i32, i32* %.tmp2213
%.tmp2215 = load i8*, i8** %.tmp2212
%.tmp2216 = getelementptr i8, i8* %.tmp2215, i32 %.tmp2214
store i8 48, i8* %.tmp2216
%.tmp2217 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2218 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2219 = load i32, i32* %.tmp2218
%.tmp2220 = add i32 %.tmp2219, 1
store i32 %.tmp2220, i32* %.tmp2217
%.tmp2221 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2222 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2223 = load i32, i32* %.tmp2222
%.tmp2224 = load i8*, i8** %.tmp2221
%.tmp2225 = getelementptr i8, i8* %.tmp2224, i32 %.tmp2223
store i8 65, i8* %.tmp2225
%.tmp2226 = load i32, i32* %i
%.tmp2227 = add i32 %.tmp2226, 1
store i32 %.tmp2227, i32* %i
br label %.if.end.2202
.if.false.2202:
%.tmp2228 = load i32, i32* %i
%.tmp2229 = add i32 %.tmp2228, 1
%.tmp2230 = load i8*, i8** %text
%.tmp2231 = getelementptr i8, i8* %.tmp2230, i32 %.tmp2229
%.tmp2232 = load i8, i8* %.tmp2231
%.tmp2233 = icmp eq i8 %.tmp2232, 92
br i1 %.tmp2233, label %.if.true.2234, label %.if.false.2234
.if.true.2234:
%.tmp2235 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2236 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2237 = load i32, i32* %.tmp2236
%.tmp2238 = load i8*, i8** %.tmp2235
%.tmp2239 = getelementptr i8, i8* %.tmp2238, i32 %.tmp2237
store i8 92, i8* %.tmp2239
%.tmp2240 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2241 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2242 = load i32, i32* %.tmp2241
%.tmp2243 = add i32 %.tmp2242, 1
store i32 %.tmp2243, i32* %.tmp2240
%.tmp2244 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2245 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2246 = load i32, i32* %.tmp2245
%.tmp2247 = load i8*, i8** %.tmp2244
%.tmp2248 = getelementptr i8, i8* %.tmp2247, i32 %.tmp2246
store i8 53, i8* %.tmp2248
%.tmp2249 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2250 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2251 = load i32, i32* %.tmp2250
%.tmp2252 = add i32 %.tmp2251, 1
store i32 %.tmp2252, i32* %.tmp2249
%.tmp2253 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2254 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2255 = load i32, i32* %.tmp2254
%.tmp2256 = load i8*, i8** %.tmp2253
%.tmp2257 = getelementptr i8, i8* %.tmp2256, i32 %.tmp2255
store i8 67, i8* %.tmp2257
%.tmp2258 = load i32, i32* %i
%.tmp2259 = add i32 %.tmp2258, 1
store i32 %.tmp2259, i32* %i
br label %.if.end.2234
.if.false.2234:
%.tmp2260 = load i32, i32* %i
%.tmp2261 = add i32 %.tmp2260, 1
%.tmp2262 = load i8*, i8** %text
%.tmp2263 = getelementptr i8, i8* %.tmp2262, i32 %.tmp2261
%.tmp2264 = load i8, i8* %.tmp2263
%.tmp2265 = icmp eq i8 %.tmp2264, 120
br i1 %.tmp2265, label %.if.true.2266, label %.if.false.2266
.if.true.2266:
%.tmp2267 = load i32, i32* %i
%.tmp2268 = add i32 %.tmp2267, 2
store i32 %.tmp2268, i32* %i
%.tmp2269 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2270 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2271 = load i32, i32* %.tmp2270
%.tmp2272 = load i8*, i8** %.tmp2269
%.tmp2273 = getelementptr i8, i8* %.tmp2272, i32 %.tmp2271
store i8 92, i8* %.tmp2273
%.tmp2274 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2275 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2276 = load i32, i32* %.tmp2275
%.tmp2277 = add i32 %.tmp2276, 1
store i32 %.tmp2277, i32* %.tmp2274
%.tmp2278 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2279 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2280 = load i32, i32* %.tmp2279
%.tmp2281 = load i8*, i8** %.tmp2278
%.tmp2282 = getelementptr i8, i8* %.tmp2281, i32 %.tmp2280
%.tmp2283 = load i32, i32* %i
%.tmp2284 = load i8*, i8** %text
%.tmp2285 = getelementptr i8, i8* %.tmp2284, i32 %.tmp2283
%.tmp2286 = load i8, i8* %.tmp2285
%.tmp2287 = call i8(i8) @toupper(i8 %.tmp2286)
store i8 %.tmp2287, i8* %.tmp2282
%.tmp2288 = load i32, i32* %i
%.tmp2289 = add i32 %.tmp2288, 1
store i32 %.tmp2289, i32* %i
%.tmp2290 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2291 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2292 = load i32, i32* %.tmp2291
%.tmp2293 = add i32 %.tmp2292, 1
store i32 %.tmp2293, i32* %.tmp2290
%.tmp2294 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2295 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2296 = load i32, i32* %.tmp2295
%.tmp2297 = load i8*, i8** %.tmp2294
%.tmp2298 = getelementptr i8, i8* %.tmp2297, i32 %.tmp2296
%.tmp2299 = load i32, i32* %i
%.tmp2300 = load i8*, i8** %text
%.tmp2301 = getelementptr i8, i8* %.tmp2300, i32 %.tmp2299
%.tmp2302 = load i8, i8* %.tmp2301
%.tmp2303 = call i8(i8) @toupper(i8 %.tmp2302)
store i8 %.tmp2303, i8* %.tmp2298
br label %.if.end.2266
.if.false.2266:
%.tmp2304 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2305 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2306 = load i32, i32* %.tmp2305
%.tmp2307 = load i8*, i8** %.tmp2304
%.tmp2308 = getelementptr i8, i8* %.tmp2307, i32 %.tmp2306
%.tmp2309 = load i32, i32* %i
%.tmp2310 = load i8*, i8** %text
%.tmp2311 = getelementptr i8, i8* %.tmp2310, i32 %.tmp2309
%.tmp2312 = load i8, i8* %.tmp2311
store i8 %.tmp2312, i8* %.tmp2308
br label %.if.end.2266
.if.end.2266:
br label %.if.end.2234
.if.end.2234:
br label %.if.end.2202
.if.end.2202:
br label %.if.end.2188
.if.false.2188:
%.tmp2313 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2314 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2315 = load i32, i32* %.tmp2314
%.tmp2316 = load i8*, i8** %.tmp2313
%.tmp2317 = getelementptr i8, i8* %.tmp2316, i32 %.tmp2315
%.tmp2318 = load i32, i32* %i
%.tmp2319 = load i8*, i8** %text
%.tmp2320 = getelementptr i8, i8* %.tmp2319, i32 %.tmp2318
%.tmp2321 = load i8, i8* %.tmp2320
store i8 %.tmp2321, i8* %.tmp2317
br label %.if.end.2188
.if.end.2188:
br label %.if.end.2159
.if.end.2159:
%.tmp2322 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2323 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2324 = load i32, i32* %.tmp2323
%.tmp2325 = add i32 %.tmp2324, 1
store i32 %.tmp2325, i32* %.tmp2322
%.tmp2326 = load i32, i32* %i
%.tmp2327 = add i32 %.tmp2326, 1
store i32 %.tmp2327, i32* %i
br label %.for.start.2135
.for.end.2135:
%.tmp2328 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2329 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2330 = load i32, i32* %.tmp2329
%.tmp2331 = load i8*, i8** %.tmp2328
%.tmp2332 = getelementptr i8, i8* %.tmp2331, i32 %.tmp2330
store i8 0, i8* %.tmp2332
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp2333 = getelementptr i8*, i8** %buf, i32 0
%.tmp2335 = getelementptr [9 x i8], [9 x i8]*@.str2334, i32 0, i32 0
%.tmp2336 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2337 = load i8*, i8** %.tmp2336
%.tmp2338 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2333, i8* %.tmp2335, i8* %.tmp2337)
%.tmp2339 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2340 = load i8*, i8** %.tmp2339
call void(i8*) @free(i8* %.tmp2340)
%.tmp2341 = load i8*, i8** %buf
ret i8* %.tmp2341
}
define i32 @m2123$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 2, i32* %i
br label %.for.start.2342
.for.start.2342:
%.tmp2343 = load i32, i32* %i
%.tmp2344 = load i8*, i8** %text
%.tmp2345 = getelementptr i8, i8* %.tmp2344, i32 %.tmp2343
%.tmp2346 = load i8, i8* %.tmp2345
%.tmp2347 = icmp ne i8 %.tmp2346, 0
br i1 %.tmp2347, label %.for.continue.2342, label %.for.end.2342
.for.continue.2342:
%.tmp2348 = load i32, i32* %i
%.tmp2349 = load i8*, i8** %text
%.tmp2350 = getelementptr i8, i8* %.tmp2349, i32 %.tmp2348
%.tmp2351 = load i8, i8* %.tmp2350
%.tmp2352 = icmp eq i8 %.tmp2351, 92
br i1 %.tmp2352, label %.if.true.2353, label %.if.false.2353
.if.true.2353:
%.tmp2354 = load i32, i32* %i
%.tmp2355 = add i32 %.tmp2354, 2
store i32 %.tmp2355, i32* %i
br label %.if.end.2353
.if.false.2353:
br label %.if.end.2353
.if.end.2353:
%.tmp2356 = load i32, i32* %len
%.tmp2357 = add i32 %.tmp2356, 1
store i32 %.tmp2357, i32* %len
%.tmp2358 = load i32, i32* %i
%.tmp2359 = add i32 %.tmp2358, 1
store i32 %.tmp2359, i32* %i
br label %.for.start.2342
.for.end.2342:
%.tmp2360 = load i32, i32* %len
%.tmp2361 = sub i32 %.tmp2360, 1
ret i32 %.tmp2361
}
define i8* @m2123$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval = alloca i32
store i32 0, i32* %intval
%buf = alloca i8*
store i8* null, i8** %buf
%chrval = alloca i8
store i8 0, i8* %chrval
%.tmp2362 = load i8*, i8** %chr_repr
%.tmp2363 = call i32(i8*) @strlen(i8* %.tmp2362)
%chr_len = alloca i32
store i32 %.tmp2363, i32* %chr_len
%.tmp2364 = load i32, i32* %chr_len
%.tmp2365 = icmp eq i32 %.tmp2364, 6
br i1 %.tmp2365, label %.if.true.2366, label %.if.false.2366
.if.true.2366:
%.tmp2367 = load i8*, i8** %chr_repr
%.tmp2369 = getelementptr [7 x i8], [7 x i8]*@.str2368, i32 0, i32 0
%.tmp2370 = getelementptr i32, i32* %intval, i32 0
%.tmp2371 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2367, i8* %.tmp2369, i32* %.tmp2370)
%.tmp2372 = getelementptr i8*, i8** %buf, i32 0
%.tmp2374 = getelementptr [3 x i8], [3 x i8]*@.str2373, i32 0, i32 0
%.tmp2375 = load i32, i32* %intval
%.tmp2376 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2372, i8* %.tmp2374, i32 %.tmp2375)
br label %.if.end.2366
.if.false.2366:
%.tmp2377 = load i32, i32* %chr_len
%.tmp2378 = icmp eq i32 %.tmp2377, 5
br i1 %.tmp2378, label %.if.true.2379, label %.if.false.2379
.if.true.2379:
%.tmp2380 = load i8*, i8** %chr_repr
%.tmp2382 = getelementptr [6 x i8], [6 x i8]*@.str2381, i32 0, i32 0
%.tmp2383 = getelementptr i32, i32* %intval, i32 0
%.tmp2384 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2380, i8* %.tmp2382, i32* %.tmp2383)
%.tmp2385 = getelementptr i8*, i8** %buf, i32 0
%.tmp2387 = getelementptr [3 x i8], [3 x i8]*@.str2386, i32 0, i32 0
%.tmp2388 = load i32, i32* %intval
%.tmp2389 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2385, i8* %.tmp2387, i32 %.tmp2388)
br label %.if.end.2379
.if.false.2379:
%.tmp2390 = load i32, i32* %chr_len
%.tmp2391 = icmp eq i32 %.tmp2390, 4
br i1 %.tmp2391, label %.if.true.2392, label %.if.false.2392
.if.true.2392:
%.tmp2393 = load i8*, i8** %chr_repr
%.tmp2395 = getelementptr [6 x i8], [6 x i8]*@.str2394, i32 0, i32 0
%.tmp2396 = getelementptr i8, i8* %chrval, i32 0
%.tmp2397 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2393, i8* %.tmp2395, i8* %.tmp2396)
%.tmp2398 = load i8, i8* %chrval
%.tmp2399 = icmp eq i8 %.tmp2398, 110
br i1 %.tmp2399, label %.if.true.2400, label %.if.false.2400
.if.true.2400:
%.tmp2402 = getelementptr [3 x i8], [3 x i8]*@.str2401, i32 0, i32 0
store i8* %.tmp2402, i8** %buf
br label %.if.end.2400
.if.false.2400:
%.tmp2403 = bitcast ptr null to i8*
ret i8* %.tmp2403
br label %.if.end.2400
.if.end.2400:
br label %.if.end.2392
.if.false.2392:
%.tmp2404 = load i32, i32* %chr_len
%.tmp2405 = icmp eq i32 %.tmp2404, 3
br i1 %.tmp2405, label %.if.true.2406, label %.if.false.2406
.if.true.2406:
%.tmp2407 = load i8*, i8** %chr_repr
%.tmp2409 = getelementptr [5 x i8], [5 x i8]*@.str2408, i32 0, i32 0
%.tmp2410 = getelementptr i32, i32* %intval, i32 0
%.tmp2411 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2407, i8* %.tmp2409, i32* %.tmp2410)
%.tmp2412 = getelementptr i8*, i8** %buf, i32 0
%.tmp2414 = getelementptr [3 x i8], [3 x i8]*@.str2413, i32 0, i32 0
%.tmp2415 = load i32, i32* %intval
%.tmp2416 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2412, i8* %.tmp2414, i32 %.tmp2415)
br label %.if.end.2406
.if.false.2406:
%.tmp2417 = bitcast ptr null to i8*
ret i8* %.tmp2417
br label %.if.end.2406
.if.end.2406:
br label %.if.end.2392
.if.end.2392:
br label %.if.end.2379
.if.end.2379:
br label %.if.end.2366
.if.end.2366:
%.tmp2418 = load i8*, i8** %buf
ret i8* %.tmp2418
}
@.str2334 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2368 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2373 = constant [3 x i8] c"%d\00"
@.str2381 = constant [6 x i8] c"'\5C%x'\00"
@.str2386 = constant [3 x i8] c"%d\00"
@.str2394 = constant [6 x i8] c"'\5C%c'\00"
@.str2401 = constant [3 x i8] c"10\00"
@.str2408 = constant [5 x i8] c"'%c'\00"
@.str2413 = constant [3 x i8] c"%d\00"
@DEBUG_INTERNALS = constant i1 0
%m1777$.ErrorList.type = type {%m717$.Error.type*,%m1777$.ErrorList.type*,i1}
%m1777$.Type.type = type {i8*,i8*,i8*,%m1777$.Type.type*,%m1777$.Type.type*}
define %m1777$.Type.type* @m1777$type_clone.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.t.arg) {
%t = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.t.arg, %m1777$.Type.type** %t
%.tmp2419 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2420 = icmp eq %m1777$.Type.type* %.tmp2419, null
br i1 %.tmp2420, label %.if.true.2421, label %.if.false.2421
.if.true.2421:
%.tmp2422 = bitcast ptr null to %m1777$.Type.type*
ret %m1777$.Type.type* %.tmp2422
br label %.if.end.2421
.if.false.2421:
br label %.if.end.2421
.if.end.2421:
%.tmp2423 = getelementptr %m1777$.Type.type, %m1777$.Type.type* null, i32 1
%.tmp2424 = ptrtoint %m1777$.Type.type* %.tmp2423 to i32
%.tmp2425 = call i8*(i32) @malloc(i32 %.tmp2424)
%.tmp2426 = bitcast i8* %.tmp2425 to %m1777$.Type.type*
%clone = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp2426, %m1777$.Type.type** %clone
%.tmp2427 = load %m1777$.Type.type*, %m1777$.Type.type** %clone
%.tmp2428 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2427, i32 0, i32 3
%.tmp2429 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2430 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2429, i32 0, i32 3
%.tmp2431 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2430
store %m1777$.Type.type* %.tmp2431, %m1777$.Type.type** %.tmp2428
%.tmp2432 = load %m1777$.Type.type*, %m1777$.Type.type** %clone
%.tmp2433 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2432, i32 0, i32 4
%.tmp2434 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2435 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2434, i32 0, i32 4
%.tmp2436 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2435
%.tmp2437 = call %m1777$.Type.type*(%m1777$.Type.type*) @m1777$type_clone.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp2436)
store %m1777$.Type.type* %.tmp2437, %m1777$.Type.type** %.tmp2433
%.tmp2438 = load %m1777$.Type.type*, %m1777$.Type.type** %clone
%.tmp2439 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2438, i32 0, i32 2
%.tmp2440 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2441 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2440, i32 0, i32 2
%.tmp2442 = load i8*, i8** %.tmp2441
store i8* %.tmp2442, i8** %.tmp2439
%.tmp2443 = load %m1777$.Type.type*, %m1777$.Type.type** %clone
%.tmp2444 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2443, i32 0, i32 0
%.tmp2445 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2446 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2445, i32 0, i32 0
%.tmp2447 = load i8*, i8** %.tmp2446
store i8* %.tmp2447, i8** %.tmp2444
%.tmp2448 = load %m1777$.Type.type*, %m1777$.Type.type** %clone
%.tmp2449 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2448, i32 0, i32 1
%.tmp2450 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2451 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2450, i32 0, i32 1
%.tmp2452 = load i8*, i8** %.tmp2451
store i8* %.tmp2452, i8** %.tmp2449
%.tmp2453 = load %m1777$.Type.type*, %m1777$.Type.type** %clone
ret %m1777$.Type.type* %.tmp2453
}
define %m1777$.Type.type* @m1777$new_type.m1777$.Type.typep() {
%.tmp2454 = getelementptr %m1777$.Type.type, %m1777$.Type.type* null, i32 1
%.tmp2455 = ptrtoint %m1777$.Type.type* %.tmp2454 to i32
%.tmp2456 = call i8*(i32) @malloc(i32 %.tmp2455)
%.tmp2457 = bitcast i8* %.tmp2456 to %m1777$.Type.type*
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp2457, %m1777$.Type.type** %type
%.tmp2458 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2459 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2458, i32 0, i32 1
store i8* null, i8** %.tmp2459
%.tmp2460 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2461 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2460, i32 0, i32 2
store i8* null, i8** %.tmp2461
%.tmp2462 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2463 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2462, i32 0, i32 0
store i8* null, i8** %.tmp2463
%.tmp2464 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2465 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2464, i32 0, i32 3
store %m1777$.Type.type* null, %m1777$.Type.type** %.tmp2465
%.tmp2466 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2467 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2466, i32 0, i32 4
store %m1777$.Type.type* null, %m1777$.Type.type** %.tmp2467
%.tmp2468 = load %m1777$.Type.type*, %m1777$.Type.type** %type
ret %m1777$.Type.type* %.tmp2468
}
define void @m1777$copy_type.v.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.dest.arg, %m1777$.Type.type* %.src.arg) {
%dest = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.dest.arg, %m1777$.Type.type** %dest
%src = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.src.arg, %m1777$.Type.type** %src
%.tmp2469 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2470 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2469, i32 0, i32 0
%.tmp2471 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2472 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2471, i32 0, i32 0
%.tmp2473 = load i8*, i8** %.tmp2472
store i8* %.tmp2473, i8** %.tmp2470
%.tmp2474 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2475 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2474, i32 0, i32 1
%.tmp2476 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2477 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2476, i32 0, i32 1
%.tmp2478 = load i8*, i8** %.tmp2477
store i8* %.tmp2478, i8** %.tmp2475
%.tmp2479 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2480 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2479, i32 0, i32 2
%.tmp2481 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2482 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2481, i32 0, i32 2
%.tmp2483 = load i8*, i8** %.tmp2482
store i8* %.tmp2483, i8** %.tmp2480
%.tmp2484 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2485 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2484, i32 0, i32 3
%.tmp2486 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2485
%.tmp2487 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2488 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2487, i32 0, i32 3
%.tmp2489 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2488
%.tmp2490 = icmp ne %m1777$.Type.type* %.tmp2486, %.tmp2489
br i1 %.tmp2490, label %.if.true.2491, label %.if.false.2491
.if.true.2491:
%.tmp2492 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2493 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2492, i32 0, i32 3
%.tmp2494 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2495 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2494, i32 0, i32 3
%.tmp2496 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2495
store %m1777$.Type.type* %.tmp2496, %m1777$.Type.type** %.tmp2493
%.tmp2497 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2498 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2497, i32 0, i32 3
%.tmp2499 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2498
%.tmp2500 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2501 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2500, i32 0, i32 3
%.tmp2502 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2501
call void(%m1777$.Type.type*,%m1777$.Type.type*) @m1777$copy_type.v.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp2499, %m1777$.Type.type* %.tmp2502)
br label %.if.end.2491
.if.false.2491:
br label %.if.end.2491
.if.end.2491:
%.tmp2503 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2504 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2503, i32 0, i32 4
%.tmp2505 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2504
%.tmp2506 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2507 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2506, i32 0, i32 4
%.tmp2508 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2507
%.tmp2509 = icmp ne %m1777$.Type.type* %.tmp2505, %.tmp2508
br i1 %.tmp2509, label %.if.true.2510, label %.if.false.2510
.if.true.2510:
%.tmp2511 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2512 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2511, i32 0, i32 4
%.tmp2513 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2514 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2513, i32 0, i32 4
%.tmp2515 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2514
store %m1777$.Type.type* %.tmp2515, %m1777$.Type.type** %.tmp2512
%.tmp2516 = load %m1777$.Type.type*, %m1777$.Type.type** %dest
%.tmp2517 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2516, i32 0, i32 4
%.tmp2518 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2517
%.tmp2519 = load %m1777$.Type.type*, %m1777$.Type.type** %src
%.tmp2520 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2519, i32 0, i32 4
%.tmp2521 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2520
call void(%m1777$.Type.type*,%m1777$.Type.type*) @m1777$copy_type.v.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp2518, %m1777$.Type.type* %.tmp2521)
br label %.if.end.2510
.if.false.2510:
br label %.if.end.2510
.if.end.2510:
ret void
}
define void @m1777$debug_type.v.m1777$.Type.typep.i(%m1777$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.t.arg, %m1777$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2522 = load i32, i32* %level
%.tmp2523 = add i32 %.tmp2522, 1
%.tmp2524 = call i8*(i32) @malloc(i32 %.tmp2523)
%.tmp2525 = bitcast i8* %.tmp2524 to i8*
%indent = alloca i8*
store i8* %.tmp2525, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2526
.for.start.2526:
%.tmp2527 = load i32, i32* %i
%.tmp2528 = load i32, i32* %level
%.tmp2529 = icmp slt i32 %.tmp2527, %.tmp2528
br i1 %.tmp2529, label %.for.continue.2526, label %.for.end.2526
.for.continue.2526:
%.tmp2530 = load i32, i32* %i
%.tmp2531 = load i8*, i8** %indent
%.tmp2532 = getelementptr i8, i8* %.tmp2531, i32 %.tmp2530
store i8 32, i8* %.tmp2532
%.tmp2533 = load i32, i32* %i
%.tmp2534 = add i32 %.tmp2533, 1
store i32 %.tmp2534, i32* %i
br label %.for.start.2526
.for.end.2526:
%.tmp2535 = load i32, i32* %level
%.tmp2536 = load i8*, i8** %indent
%.tmp2537 = getelementptr i8, i8* %.tmp2536, i32 %.tmp2535
store i8 0, i8* %.tmp2537
%.tmp2539 = getelementptr [5 x i8], [5 x i8]*@.str2538, i32 0, i32 0
%.tmp2540 = load i8*, i8** %indent
%.tmp2541 = call i32(i8*,...) @printf(i8* %.tmp2539, i8* %.tmp2540)
%.tmp2543 = getelementptr [21 x i8], [21 x i8]*@.str2542, i32 0, i32 0
%.tmp2544 = load i8*, i8** %indent
%.tmp2545 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2546 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2545, i32 0, i32 0
%.tmp2547 = load i8*, i8** %.tmp2546
%.tmp2548 = call i32(i8*,...) @printf(i8* %.tmp2543, i8* %.tmp2544, i8* %.tmp2547)
%.tmp2550 = getelementptr [16 x i8], [16 x i8]*@.str2549, i32 0, i32 0
%.tmp2551 = load i8*, i8** %indent
%.tmp2552 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2553 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2552, i32 0, i32 1
%.tmp2554 = load i8*, i8** %.tmp2553
%.tmp2555 = call i32(i8*,...) @printf(i8* %.tmp2550, i8* %.tmp2551, i8* %.tmp2554)
%.tmp2557 = getelementptr [16 x i8], [16 x i8]*@.str2556, i32 0, i32 0
%.tmp2558 = load i8*, i8** %indent
%.tmp2559 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2560 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2559, i32 0, i32 2
%.tmp2561 = load i8*, i8** %.tmp2560
%.tmp2562 = call i32(i8*,...) @printf(i8* %.tmp2557, i8* %.tmp2558, i8* %.tmp2561)
%.tmp2563 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2564 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2563, i32 0, i32 3
%.tmp2565 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2564
%.tmp2566 = icmp eq %m1777$.Type.type* %.tmp2565, null
br i1 %.tmp2566, label %.if.true.2567, label %.if.false.2567
.if.true.2567:
%.tmp2569 = getelementptr [16 x i8], [16 x i8]*@.str2568, i32 0, i32 0
%.tmp2570 = load i8*, i8** %indent
%.tmp2571 = call i32(i8*,...) @printf(i8* %.tmp2569, i8* %.tmp2570)
br label %.if.end.2567
.if.false.2567:
%.tmp2573 = getelementptr [10 x i8], [10 x i8]*@.str2572, i32 0, i32 0
%.tmp2574 = load i8*, i8** %indent
%.tmp2575 = call i32(i8*,...) @printf(i8* %.tmp2573, i8* %.tmp2574)
%.tmp2576 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2577 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2576, i32 0, i32 3
%.tmp2578 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2577
%.tmp2579 = load i32, i32* %level
%.tmp2580 = add i32 %.tmp2579, 1
call void(%m1777$.Type.type*,i32) @m1777$debug_type.v.m1777$.Type.typep.i(%m1777$.Type.type* %.tmp2578, i32 %.tmp2580)
br label %.if.end.2567
.if.end.2567:
%.tmp2581 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2582 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2581, i32 0, i32 4
%.tmp2583 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2582
%.tmp2584 = icmp eq %m1777$.Type.type* %.tmp2583, null
br i1 %.tmp2584, label %.if.true.2585, label %.if.false.2585
.if.true.2585:
%.tmp2587 = getelementptr [18 x i8], [18 x i8]*@.str2586, i32 0, i32 0
%.tmp2588 = load i8*, i8** %indent
%.tmp2589 = call i32(i8*,...) @printf(i8* %.tmp2587, i8* %.tmp2588)
br label %.if.end.2585
.if.false.2585:
%.tmp2591 = getelementptr [12 x i8], [12 x i8]*@.str2590, i32 0, i32 0
%.tmp2592 = load i8*, i8** %indent
%.tmp2593 = call i32(i8*,...) @printf(i8* %.tmp2591, i8* %.tmp2592)
%.tmp2594 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp2595 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2594, i32 0, i32 4
%.tmp2596 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2595
%.tmp2597 = load i32, i32* %level
%.tmp2598 = add i32 %.tmp2597, 1
call void(%m1777$.Type.type*,i32) @m1777$debug_type.v.m1777$.Type.typep.i(%m1777$.Type.type* %.tmp2596, i32 %.tmp2598)
br label %.if.end.2585
.if.end.2585:
%.tmp2600 = getelementptr [5 x i8], [5 x i8]*@.str2599, i32 0, i32 0
%.tmp2601 = load i8*, i8** %indent
%.tmp2602 = call i32(i8*,...) @printf(i8* %.tmp2600, i8* %.tmp2601)
ret void
}
%m1777$.AssignableInfo.type = type {i8*,i8,i8*,%m1777$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1777$.AssignableInfo.type* @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.node.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2603 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* null, i32 1
%.tmp2604 = ptrtoint %m1777$.AssignableInfo.type* %.tmp2603 to i32
%.tmp2605 = call i8*(i32) @malloc(i32 %.tmp2604)
%.tmp2606 = bitcast i8* %.tmp2605 to %m1777$.AssignableInfo.type*
%ptr = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp2606, %m1777$.AssignableInfo.type** %ptr
%.tmp2607 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2608 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2607, i32 0, i32 1
%.tmp2609 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2609, i8* %.tmp2608
%.tmp2610 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2611 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2610, i32 0, i32 0
store i8* null, i8** %.tmp2611
%.tmp2612 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2613 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2612, i32 0, i32 2
store i8* null, i8** %.tmp2613
%.tmp2614 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2615 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2614, i32 0, i32 3
store %m1777$.Type.type* null, %m1777$.Type.type** %.tmp2615
%.tmp2616 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2617 = icmp ne %m286$.Node.type* %.tmp2616, null
br i1 %.tmp2617, label %.if.true.2618, label %.if.false.2618
.if.true.2618:
%.tmp2619 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2620 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2619, i32 0, i32 4
%.tmp2621 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2622 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2621, i32 0, i32 3
%.tmp2623 = load i32, i32* %.tmp2622
store i32 %.tmp2623, i32* %.tmp2620
%.tmp2624 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2625 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2624, i32 0, i32 5
%.tmp2626 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2627 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2626, i32 0, i32 4
%.tmp2628 = load i32, i32* %.tmp2627
store i32 %.tmp2628, i32* %.tmp2625
%.tmp2629 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2630 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2629, i32 0, i32 6
%.tmp2631 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2632 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2631, i32 0, i32 2
%.tmp2633 = load i8*, i8** %.tmp2632
store i8* %.tmp2633, i8** %.tmp2630
br label %.if.end.2618
.if.false.2618:
%.tmp2634 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2635 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2634, i32 0, i32 4
store i32 0, i32* %.tmp2635
%.tmp2636 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2637 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2636, i32 0, i32 5
store i32 0, i32* %.tmp2637
%.tmp2638 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
%.tmp2639 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2638, i32 0, i32 6
store i8* null, i8** %.tmp2639
br label %.if.end.2618
.if.end.2618:
%.tmp2640 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %ptr
ret %m1777$.AssignableInfo.type* %.tmp2640
}
define void @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.info.arg, %m1777$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2641 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2642 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2641, i32 0, i32 0
%.tmp2643 = load i8*, i8** %id
store i8* %.tmp2643, i8** %.tmp2642
%.tmp2644 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2645 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2644, i32 0, i32 1
%.tmp2646 = load i8, i8* %scope
store i8 %.tmp2646, i8* %.tmp2645
ret void
}
define i8* @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.info.arg, %m1777$.AssignableInfo.type** %info
%.tmp2647 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2648 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2647, i32 0, i32 1
%.tmp2649 = load i8, i8* %.tmp2648
%.tmp2650 = load i8, i8* @SCOPE_CONST
%.tmp2651 = icmp eq i8 %.tmp2649, %.tmp2650
br i1 %.tmp2651, label %.if.true.2652, label %.if.false.2652
.if.true.2652:
%.tmp2653 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2654 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2653, i32 0, i32 0
%.tmp2655 = load i8*, i8** %.tmp2654
ret i8* %.tmp2655
br label %.if.end.2652
.if.false.2652:
br label %.if.end.2652
.if.end.2652:
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp2656 = getelementptr i8*, i8** %buf, i32 0
%.tmp2658 = getelementptr [5 x i8], [5 x i8]*@.str2657, i32 0, i32 0
%.tmp2659 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2660 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2659, i32 0, i32 1
%.tmp2661 = load i8, i8* %.tmp2660
%.tmp2662 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2663 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2662, i32 0, i32 0
%.tmp2664 = load i8*, i8** %.tmp2663
%.tmp2665 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2656, i8* %.tmp2658, i8 %.tmp2661, i8* %.tmp2664)
%.tmp2666 = load i8*, i8** %buf
ret i8* %.tmp2666
}
%m1777$.ScopeItem.type = type {i8*,%m1777$.AssignableInfo.type*,%m1777$.ScopeItem.type*}
%m1777$.GlobalName.type = type {i8*,i8*,i1,%m1777$.AssignableInfo.type*,%m1777$.GlobalName.type*}
%m1777$.Scope.type = type {i8*,%m1777$.ScopeItem.type*,i8*,i8*,i8*,%m1777$.Scope.type*}
%m1777$.ModuleLookup.type = type {i8*,i8*,%m1777$.ModuleLookup.type*,%m1777$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1777$.CompilerCtx.type = type {%m286$.Node.type*,%m0$.File.type*,%m1777$.ErrorList.type*,%m1777$.GlobalName.type*,i32,%m1777$.ModuleLookup.type*,i8*}
define void @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.info.arg, %m1777$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp2667 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2669 = getelementptr [7 x i8], [7 x i8]*@.str2668, i32 0, i32 0
%.tmp2670 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2671 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp2670)
%.tmp2672 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2667, i8* %.tmp2669, i32 %.tmp2671)
%.tmp2673 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp2674 = load i8, i8* @SCOPE_LOCAL
%.tmp2675 = load i8*, i8** %tmp_buff
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp2673, i8 %.tmp2674, i8* %.tmp2675)
ret void
}
define %m1777$.ModuleLookup.type* @m1777$get_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2677 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2678 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2677, i32 0, i32 5
%.tmp2679 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp2678
%m = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp2679, %m1777$.ModuleLookup.type** %m
br label %.for.start.2676
.for.start.2676:
%.tmp2680 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2681 = icmp ne %m1777$.ModuleLookup.type* %.tmp2680, null
br i1 %.tmp2681, label %.for.continue.2676, label %.for.end.2676
.for.continue.2676:
%.tmp2682 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2683 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2682, i32 0, i32 0
%.tmp2684 = load i8*, i8** %.tmp2683
%.tmp2685 = load i8*, i8** %filename
%.tmp2686 = call i32(i8*,i8*) @strcmp(i8* %.tmp2684, i8* %.tmp2685)
%.tmp2687 = icmp eq i32 %.tmp2686, 0
br i1 %.tmp2687, label %.if.true.2688, label %.if.false.2688
.if.true.2688:
%.tmp2689 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
ret %m1777$.ModuleLookup.type* %.tmp2689
br label %.if.end.2688
.if.false.2688:
br label %.if.end.2688
.if.end.2688:
%.tmp2690 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2691 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2690, i32 0, i32 2
%.tmp2692 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp2691
store %m1777$.ModuleLookup.type* %.tmp2692, %m1777$.ModuleLookup.type** %m
br label %.for.start.2676
.for.end.2676:
%.tmp2693 = bitcast ptr null to %m1777$.ModuleLookup.type*
ret %m1777$.ModuleLookup.type* %.tmp2693
}
define %m1777$.ModuleLookup.type* @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%.tmp2694 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2695 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2696 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2695, i32 0, i32 6
%.tmp2697 = load i8*, i8** %.tmp2696
%.tmp2698 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*,i8*) @m1777$get_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.tmp2694, i8* %.tmp2697)
ret %m1777$.ModuleLookup.type* %.tmp2698
}
define i32 @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%.tmp2699 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2700 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2699, i32 0, i32 4
%.tmp2701 = load i32, i32* %.tmp2700
%uid = alloca i32
store i32 %.tmp2701, i32* %uid
%.tmp2702 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2703 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2702, i32 0, i32 4
%.tmp2704 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2705 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2704, i32 0, i32 4
%.tmp2706 = load i32, i32* %.tmp2705
%.tmp2707 = add i32 %.tmp2706, 1
store i32 %.tmp2707, i32* %.tmp2703
%.tmp2708 = load i32, i32* %uid
ret i32 %.tmp2708
}
define %m1777$.CompilerCtx.type* @m1777$new_context.m1777$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2709 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* null, i32 1
%.tmp2710 = ptrtoint %m1777$.CompilerCtx.type* %.tmp2709 to i32
%.tmp2711 = call i8*(i32) @malloc(i32 %.tmp2710)
%.tmp2712 = bitcast i8* %.tmp2711 to %m1777$.CompilerCtx.type*
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.tmp2712, %m1777$.CompilerCtx.type** %ctx
%.tmp2713 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2714 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2713, i32 0, i32 1
%.tmp2715 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2715, %m0$.File.type** %.tmp2714
%.tmp2716 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2717 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2716, i32 0, i32 0
%.tmp2718 = bitcast ptr null to %m286$.Node.type*
store %m286$.Node.type* %.tmp2718, %m286$.Node.type** %.tmp2717
%.tmp2719 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2720 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2719, i32 0, i32 2
store %m1777$.ErrorList.type* null, %m1777$.ErrorList.type** %.tmp2720
%.tmp2721 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2722 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2721, i32 0, i32 4
store i32 0, i32* %.tmp2722
%.tmp2723 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2724 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2723, i32 0, i32 3
store %m1777$.GlobalName.type* null, %m1777$.GlobalName.type** %.tmp2724
%.tmp2725 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2726 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2725, i32 0, i32 6
%.tmp2727 = load i8*, i8** %filename
store i8* %.tmp2727, i8** %.tmp2726
%.tmp2728 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2729 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2728, i32 0, i32 5
%.tmp2730 = load i32, i32* @ModuleLookup_size
%.tmp2731 = call i8*(i32) @malloc(i32 %.tmp2730)
%.tmp2732 = bitcast i8* %.tmp2731 to %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp2732, %m1777$.ModuleLookup.type** %.tmp2729
%.tmp2733 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2734 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2733, i32 0, i32 5
%.tmp2735 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp2734
%.tmp2736 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2735, i32 0, i32 0
%.tmp2737 = load i8*, i8** %filename
store i8* %.tmp2737, i8** %.tmp2736
%.tmp2738 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2739 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2738, i32 0, i32 5
%.tmp2740 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp2739
%.tmp2741 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2740, i32 0, i32 3
store %m1777$.Scope.type* null, %m1777$.Scope.type** %.tmp2741
%.tmp2742 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2743 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2742, i32 0, i32 5
%.tmp2744 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp2743
%.tmp2745 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2744, i32 0, i32 1
%.tmp2747 = getelementptr [1 x i8], [1 x i8]*@.str2746, i32 0, i32 0
store i8* %.tmp2747, i8** %.tmp2745
%.tmp2748 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2749 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2748, i32 0, i32 5
%.tmp2750 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp2749
%.tmp2751 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2750, i32 0, i32 2
store %m1777$.ModuleLookup.type* null, %m1777$.ModuleLookup.type** %.tmp2751
%.tmp2752 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2753 = bitcast %m1777$.CompilerCtx.type* %.tmp2752 to %m1777$.CompilerCtx.type*
ret %m1777$.CompilerCtx.type* %.tmp2753
}
define void @m1777$push_scope.v.m1777$.CompilerCtx.typep.cp.cp.cp(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%.tmp2754 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* null, i32 1
%.tmp2755 = ptrtoint %m1777$.Scope.type* %.tmp2754 to i32
%.tmp2756 = call i8*(i32) @malloc(i32 %.tmp2755)
%.tmp2757 = bitcast i8* %.tmp2756 to %m1777$.Scope.type*
%s = alloca %m1777$.Scope.type*
store %m1777$.Scope.type* %.tmp2757, %m1777$.Scope.type** %s
%.tmp2758 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2759 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*) @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp2758)
%m = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp2759, %m1777$.ModuleLookup.type** %m
%.tmp2760 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp2761 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp2760, i32 0, i32 5
%.tmp2762 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2763 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2762, i32 0, i32 3
%.tmp2764 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp2763
store %m1777$.Scope.type* %.tmp2764, %m1777$.Scope.type** %.tmp2761
%.tmp2765 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp2766 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp2765, i32 0, i32 1
store %m1777$.ScopeItem.type* null, %m1777$.ScopeItem.type** %.tmp2766
%.tmp2767 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp2768 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp2767, i32 0, i32 2
%.tmp2769 = load i8*, i8** %type
store i8* %.tmp2769, i8** %.tmp2768
%.tmp2770 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp2771 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp2770, i32 0, i32 3
%.tmp2772 = load i8*, i8** %begin_id
store i8* %.tmp2772, i8** %.tmp2771
%.tmp2773 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp2774 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp2773, i32 0, i32 4
%.tmp2775 = load i8*, i8** %end_id
store i8* %.tmp2775, i8** %.tmp2774
%.tmp2776 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2777 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2776, i32 0, i32 3
%.tmp2778 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
store %m1777$.Scope.type* %.tmp2778, %m1777$.Scope.type** %.tmp2777
ret void
}
define void @m1777$pop_scope.v.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%.tmp2779 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2780 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*) @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp2779)
%m = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp2780, %m1777$.ModuleLookup.type** %m
%.tmp2781 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2782 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2781, i32 0, i32 3
%.tmp2783 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp2782
%.tmp2784 = icmp ne %m1777$.Scope.type* %.tmp2783, null
%.tmp2786 = getelementptr [61 x i8], [61 x i8]*@.str2785, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2784, i8* %.tmp2786)
%.tmp2787 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2788 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2787, i32 0, i32 3
%.tmp2789 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2790 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2789, i32 0, i32 3
%.tmp2791 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp2790
%.tmp2792 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp2791, i32 0, i32 5
%.tmp2793 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp2792
store %m1777$.Scope.type* %.tmp2793, %m1777$.Scope.type** %.tmp2788
ret void
}
define i1 @m1777$compile_file.b.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2794 = call i8*() @m1778$grammar.cp()
%.tmp2795 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2794)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2795, %m0$.File.type** %grammar_file
%.tmp2796 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2797 = icmp eq %m0$.File.type* %.tmp2796, null
br i1 %.tmp2797, label %.if.true.2798, label %.if.false.2798
.if.true.2798:
ret i1 0
br label %.if.end.2798
.if.false.2798:
br label %.if.end.2798
.if.end.2798:
%.tmp2799 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2800 = call %m286$.ParsingContext.type*(%m0$.File.type*) @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2799)
%grammar_ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp2800, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2801 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2802 = call %m286$.Rule.type**(%m286$.ParsingContext.type*) @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp2801)
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp2802, %m286$.Rule.type*** %grammar
%.tmp2803 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2804 = bitcast %m286$.ParsingContext.type* %.tmp2803 to i8*
call void(i8*) @free(i8* %.tmp2804)
%.tmp2805 = load i8*, i8** %filepath
%.tmp2806 = load i32, i32* @O_RDONLY
%.tmp2807 = call i32(i8*,i32) @open(i8* %.tmp2805, i32 %.tmp2806)
%input_fd = alloca i32
store i32 %.tmp2807, i32* %input_fd
%.tmp2808 = load i32, i32* %input_fd
%.tmp2809 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp2808)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp2809, %m209$.PeekerInfo.type** %p
%.tmp2810 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2811 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp2810, i32 0, i32 6
%.tmp2812 = load i8*, i8** %filepath
store i8* %.tmp2812, i8** %.tmp2811
%.tmp2813 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2814 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp2813, i1 0)
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp2814, %m287$.Token.type** %tokens
%.tmp2815 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp2817 = getelementptr [6 x i8], [6 x i8]*@.str2816, i32 0, i32 0
%.tmp2818 = load %m287$.Token.type*, %m287$.Token.type** %tokens
%.tmp2819 = call %m286$.ParseResult.type*(%m286$.Rule.type**,i8*,%m287$.Token.type*) @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.tmp2815, i8* %.tmp2817, %m287$.Token.type* %.tmp2818)
%ast = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp2819, %m286$.ParseResult.type** %ast
%.tmp2820 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2821 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %ast
%.tmp2822 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp2821, i32 0, i32 1
%.tmp2823 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2822
%.tmp2824 = call i1(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile.b.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp2820, %m286$.Node.type* %.tmp2823)
ret i1 %.tmp2824
}
define i1 @m1777$compile.b.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2825 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2826 = load %m286$.Node.type*, %m286$.Node.type** %ast
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_ast.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp2825, %m286$.Node.type* %.tmp2826)
%.tmp2827 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2828 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2827, i32 0, i32 2
%.tmp2829 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp2828
%.tmp2830 = icmp ne %m1777$.ErrorList.type* %.tmp2829, null
%has_errors = alloca i1
store i1 %.tmp2830, i1* %has_errors
%.tmp2832 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2833 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2832, i32 0, i32 2
%.tmp2834 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp2833
%err = alloca %m1777$.ErrorList.type*
store %m1777$.ErrorList.type* %.tmp2834, %m1777$.ErrorList.type** %err
br label %.for.start.2831
.for.start.2831:
%.tmp2835 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %err
%.tmp2836 = icmp ne %m1777$.ErrorList.type* %.tmp2835, null
br i1 %.tmp2836, label %.for.continue.2831, label %.for.end.2831
.for.continue.2831:
%.tmp2837 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %err
%.tmp2838 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp2837, i32 0, i32 2
%.tmp2839 = load i1, i1* %.tmp2838
%.tmp2840 = icmp eq i1 %.tmp2839, 0
br i1 %.tmp2840, label %.if.true.2841, label %.if.false.2841
.if.true.2841:
%.tmp2842 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %err
%.tmp2843 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp2842, i32 0, i32 0
%.tmp2844 = load %m717$.Error.type*, %m717$.Error.type** %.tmp2843
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp2844)
%.tmp2845 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %err
%.tmp2846 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp2845, i32 0, i32 2
store i1 1, i1* %.tmp2846
br label %.if.end.2841
.if.false.2841:
br label %.if.end.2841
.if.end.2841:
%.tmp2847 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %err
%.tmp2848 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp2847, i32 0, i32 1
%.tmp2849 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp2848
store %m1777$.ErrorList.type* %.tmp2849, %m1777$.ErrorList.type** %err
br label %.for.start.2831
.for.end.2831:
%.tmp2851 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2852 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2851, i32 0, i32 3
%.tmp2853 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %.tmp2852
%g = alloca %m1777$.GlobalName.type*
store %m1777$.GlobalName.type* %.tmp2853, %m1777$.GlobalName.type** %g
br label %.for.start.2850
.for.start.2850:
%.tmp2854 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2855 = icmp ne %m1777$.GlobalName.type* %.tmp2854, null
br i1 %.tmp2855, label %.for.continue.2850, label %.for.end.2850
.for.continue.2850:
%.tmp2856 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2857 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
call void(%m1777$.CompilerCtx.type*,%m1777$.GlobalName.type*) @m1777$compile_global.v.m1777$.CompilerCtx.typep.m1777$.GlobalName.typep(%m1777$.CompilerCtx.type* %.tmp2856, %m1777$.GlobalName.type* %.tmp2857)
%.tmp2858 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2859 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2858, i32 0, i32 4
%.tmp2860 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %.tmp2859
store %m1777$.GlobalName.type* %.tmp2860, %m1777$.GlobalName.type** %g
br label %.for.start.2850
.for.end.2850:
%.tmp2861 = load i1, i1* %has_errors
ret i1 %.tmp2861
}
define void @m1777$compile_ast.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2862 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2863 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2862, i32 0, i32 0
%.tmp2864 = load i8*, i8** %.tmp2863
%.tmp2866 = getelementptr [6 x i8], [6 x i8]*@.str2865, i32 0, i32 0
%.tmp2867 = call i32(i8*,i8*) @strcmp(i8* %.tmp2864, i8* %.tmp2866)
%.tmp2868 = icmp ne i32 %.tmp2867, 0
br i1 %.tmp2868, label %.if.true.2869, label %.if.false.2869
.if.true.2869:
ret void
br label %.if.end.2869
.if.false.2869:
br label %.if.end.2869
.if.end.2869:
%.tmp2870 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2872 = getelementptr [7 x i8], [7 x i8]*@.str2871, i32 0, i32 0
%.tmp2873 = bitcast ptr null to i8*
%.tmp2874 = bitcast ptr null to i8*
call void(%m1777$.CompilerCtx.type*,i8*,i8*,i8*) @m1777$push_scope.v.m1777$.CompilerCtx.typep.cp.cp.cp(%m1777$.CompilerCtx.type* %.tmp2870, i8* %.tmp2872, i8* %.tmp2873, i8* %.tmp2874)
%.tmp2875 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2876 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2875, i32 0, i32 6
%.tmp2877 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2876
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2877, %m286$.Node.type** %start
%.tmp2878 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2879 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2878, i32 0, i32 0
%.tmp2880 = load i8*, i8** %.tmp2879
%.tmp2882 = getelementptr [13 x i8], [13 x i8]*@.str2881, i32 0, i32 0
%.tmp2883 = call i32(i8*,i8*) @strcmp(i8* %.tmp2880, i8* %.tmp2882)
%.tmp2884 = icmp eq i32 %.tmp2883, 0
br i1 %.tmp2884, label %.if.true.2885, label %.if.false.2885
.if.true.2885:
%.tmp2886 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2886, i32 0, i32 7
%.tmp2888 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2887
store %m286$.Node.type* %.tmp2888, %m286$.Node.type** %start
br label %.if.end.2885
.if.false.2885:
br label %.if.end.2885
.if.end.2885:
%.tmp2890 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2890, %m286$.Node.type** %stmt
br label %.for.start.2889
.for.start.2889:
%.tmp2891 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2892 = icmp ne %m286$.Node.type* %.tmp2891, null
br i1 %.tmp2892, label %.for.continue.2889, label %.for.end.2889
.for.continue.2889:
%.tmp2893 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2894 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2895 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2894, i32 0, i32 6
%.tmp2896 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2895
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1777$compile_statement.v.m1777$.CompilerCtx.typep.m286$.Node.typep.b(%m1777$.CompilerCtx.type* %.tmp2893, %m286$.Node.type* %.tmp2896, i1 1)
%.tmp2897 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2898 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2897, i32 0, i32 7
%.tmp2899 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2898
store %m286$.Node.type* %.tmp2899, %m286$.Node.type** %stmt
br label %.for.start.2889
.for.end.2889:
%.tmp2901 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2901, %m286$.Node.type** %s
br label %.for.start.2900
.for.start.2900:
%.tmp2902 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2903 = icmp ne %m286$.Node.type* %.tmp2902, null
br i1 %.tmp2903, label %.for.continue.2900, label %.for.end.2900
.for.continue.2900:
%.tmp2904 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2905 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2906 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2905, i32 0, i32 6
%.tmp2907 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2906
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1777$compile_statement.v.m1777$.CompilerCtx.typep.m286$.Node.typep.b(%m1777$.CompilerCtx.type* %.tmp2904, %m286$.Node.type* %.tmp2907, i1 0)
%.tmp2908 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2909 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2908, i32 0, i32 7
%.tmp2910 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2909
store %m286$.Node.type* %.tmp2910, %m286$.Node.type** %s
br label %.for.start.2900
.for.end.2900:
ret void
}
define void @m1777$compile_global.v.m1777$.CompilerCtx.typep.m1777$.GlobalName.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%g = alloca %m1777$.GlobalName.type*
store %m1777$.GlobalName.type* %.g.arg, %m1777$.GlobalName.type** %g
%.tmp2911 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2912 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2911, i32 0, i32 2
%.tmp2913 = load i1, i1* %.tmp2912
%.tmp2914 = icmp eq i1 %.tmp2913, 0
%.tmp2915 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2916 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2915, i32 0, i32 1
%.tmp2917 = load i8*, i8** %.tmp2916
%.tmp2919 = getelementptr [7 x i8], [7 x i8]*@.str2918, i32 0, i32 0
%.tmp2920 = call i32(i8*,i8*) @strcmp(i8* %.tmp2917, i8* %.tmp2919)
%.tmp2921 = icmp eq i32 %.tmp2920, 0
%.tmp2922 = and i1 %.tmp2914, %.tmp2921
br i1 %.tmp2922, label %.if.true.2923, label %.if.false.2923
.if.true.2923:
%.tmp2924 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2925 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp2924, i32 0, i32 1
%.tmp2926 = load %m0$.File.type*, %m0$.File.type** %.tmp2925
%.tmp2928 = getelementptr [21 x i8], [21 x i8]*@.str2927, i32 0, i32 0
%.tmp2929 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2930 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2929, i32 0, i32 3
%.tmp2931 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp2930
%.tmp2932 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp2931)
%.tmp2933 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2934 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2935 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2934, i32 0, i32 3
%.tmp2936 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp2935
%.tmp2937 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp2936, i32 0, i32 3
%.tmp2938 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2937
%.tmp2939 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp2933, %m1777$.Type.type* %.tmp2938)
%.tmp2940 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2941 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2940, i32 0, i32 0
%.tmp2942 = load i8*, i8** %.tmp2941
%.tmp2943 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2926, i8* %.tmp2928, i8* %.tmp2932, i8* %.tmp2939, i8* %.tmp2942)
%.tmp2944 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
%.tmp2945 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp2944, i32 0, i32 2
store i1 1, i1* %.tmp2945
br label %.if.end.2923
.if.false.2923:
br label %.if.end.2923
.if.end.2923:
ret void
}
define i8* @m1777$get_mod_prefix.cp.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2946 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2947 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*) @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp2946)
%m = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp2947, %m1777$.ModuleLookup.type** %m
%.tmp2948 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp2949 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp2948, i32 0, i32 1
%.tmp2950 = load i8*, i8** %.tmp2949
ret i8* %.tmp2950
}
define i8* @m1777$name_mangle.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1777$.Type.type* %.type.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%fn = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn.arg, %m286$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.type.arg, %m1777$.Type.type** %type
%mangled_name = alloca i8*
store i8* null, i8** %mangled_name
%.tmp2951 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp2952 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2953 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2952, i32 0, i32 2
%.tmp2954 = load i8*, i8** %.tmp2953
%.tmp2955 = call i8*(%m1777$.CompilerCtx.type*,i8*) @m1777$get_mod_prefix.cp.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.tmp2951, i8* %.tmp2954)
%prefix = alloca i8*
store i8* %.tmp2955, i8** %prefix
%.tmp2956 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2958 = getelementptr [5 x i8], [5 x i8]*@.str2957, i32 0, i32 0
%.tmp2959 = load i8*, i8** %prefix
%.tmp2960 = load i8*, i8** %original_name
%.tmp2961 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2956, i8* %.tmp2958, i8* %.tmp2959, i8* %.tmp2960)
%.tmp2962 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2963 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2962, i32 0, i32 0
%.tmp2964 = load i8*, i8** %.tmp2963
%.tmp2966 = getelementptr [9 x i8], [9 x i8]*@.str2965, i32 0, i32 0
%.tmp2967 = call i32(i8*,i8*) @strcmp(i8* %.tmp2964, i8* %.tmp2966)
%.tmp2968 = icmp eq i32 %.tmp2967, 0
br i1 %.tmp2968, label %.if.true.2969, label %.if.false.2969
.if.true.2969:
%.tmp2970 = load i8*, i8** %mangled_name
%.tmp2972 = getelementptr [5 x i8], [5 x i8]*@.str2971, i32 0, i32 0
%.tmp2973 = call i32(i8*,i8*) @strcmp(i8* %.tmp2970, i8* %.tmp2972)
%.tmp2974 = icmp ne i32 %.tmp2973, 0
br i1 %.tmp2974, label %.if.true.2975, label %.if.false.2975
.if.true.2975:
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%swap_var = alloca i8*
store i8* null, i8** %swap_var
%.tmp2977 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp2978 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2977, i32 0, i32 3
%.tmp2979 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2978
%tp = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp2979, %m1777$.Type.type** %tp
br label %.for.start.2976
.for.start.2976:
%.tmp2980 = load %m1777$.Type.type*, %m1777$.Type.type** %tp
%.tmp2981 = icmp ne %m1777$.Type.type* %.tmp2980, null
br i1 %.tmp2981, label %.for.continue.2976, label %.for.end.2976
.for.continue.2976:
%.tmp2982 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2984 = getelementptr [6 x i8], [6 x i8]*@.str2983, i32 0, i32 0
%.tmp2985 = load i8*, i8** %mangled_name
%.tmp2986 = load %m1777$.Type.type*, %m1777$.Type.type** %tp
%.tmp2987 = call i8*(%m1777$.Type.type*) @m1777$type_abbr.cp.m1777$.Type.typep(%m1777$.Type.type* %.tmp2986)
%.tmp2988 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2982, i8* %.tmp2984, i8* %.tmp2985, i8* %.tmp2987)
%.tmp2989 = load i8*, i8** %tmp_buff
store i8* %.tmp2989, i8** %swap_var
%.tmp2990 = load i8*, i8** %mangled_name
store i8* %.tmp2990, i8** %tmp_buff
%.tmp2991 = load i8*, i8** %swap_var
store i8* %.tmp2991, i8** %mangled_name
%.tmp2992 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2992)
%.tmp2993 = load %m1777$.Type.type*, %m1777$.Type.type** %tp
%.tmp2994 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp2993, i32 0, i32 4
%.tmp2995 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp2994
store %m1777$.Type.type* %.tmp2995, %m1777$.Type.type** %tp
br label %.for.start.2976
.for.end.2976:
br label %.if.end.2975
.if.false.2975:
br label %.if.end.2975
.if.end.2975:
br label %.if.end.2969
.if.false.2969:
br label %.if.end.2969
.if.end.2969:
%.tmp2996 = load i8*, i8** %mangled_name
ret i8* %.tmp2996
}
define void @m1777$compile_statement.v.m1777$.CompilerCtx.typep.m286$.Node.typep.b(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* null, %m1777$.AssignableInfo.type** %info
%return_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* null, %m1777$.Type.type** %return_type
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp2997 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2997, i32 0, i32 0
%.tmp2999 = load i8*, i8** %.tmp2998
%.tmp3001 = getelementptr [3 x i8], [3 x i8]*@.str3000, i32 0, i32 0
%.tmp3002 = call i32(i8*,i8*) @strcmp(i8* %.tmp2999, i8* %.tmp3001)
%.tmp3003 = icmp eq i32 %.tmp3002, 0
br i1 %.tmp3003, label %.if.true.3004, label %.if.false.3004
.if.true.3004:
ret void
br label %.if.end.3004
.if.false.3004:
%.tmp3005 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3006 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3005, i32 0, i32 0
%.tmp3007 = load i8*, i8** %.tmp3006
%.tmp3009 = getelementptr [7 x i8], [7 x i8]*@.str3008, i32 0, i32 0
%.tmp3010 = call i32(i8*,i8*) @strcmp(i8* %.tmp3007, i8* %.tmp3009)
%.tmp3011 = icmp eq i32 %.tmp3010, 0
br i1 %.tmp3011, label %.if.true.3012, label %.if.false.3012
.if.true.3012:
%.tmp3013 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3014 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3013, i32 0, i32 6
%.tmp3015 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3014
%.tmp3017 = getelementptr [11 x i8], [11 x i8]*@.str3016, i32 0, i32 0
%.tmp3018 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3015, i8* %.tmp3017)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3018, %m286$.Node.type** %assignable
%.tmp3019 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3020 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp3021 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3019, %m286$.Node.type* %.tmp3020)
%a_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3021, %m1777$.AssignableInfo.type** %a_info
%.tmp3022 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp3023 = icmp eq %m1777$.AssignableInfo.type* %.tmp3022, null
br i1 %.tmp3023, label %.if.true.3024, label %.if.false.3024
.if.true.3024:
ret void
br label %.if.end.3024
.if.false.3024:
br label %.if.end.3024
.if.end.3024:
%.tmp3025 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3026 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3025)
store %m1777$.AssignableInfo.type* %.tmp3026, %m1777$.AssignableInfo.type** %info
%.tmp3027 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3028 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3027, i32 0, i32 6
%.tmp3029 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3028
%.tmp3030 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3029, i32 0, i32 7
%.tmp3031 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3030
%.tmp3032 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3031, i32 0, i32 1
%.tmp3033 = load i8*, i8** %.tmp3032
%global_name = alloca i8*
store i8* %.tmp3033, i8** %global_name
%.tmp3034 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3035 = load i8, i8* @SCOPE_GLOBAL
%.tmp3036 = load i8*, i8** %global_name
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp3034, i8 %.tmp3035, i8* %.tmp3036)
%.tmp3037 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3038 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3037, i32 0, i32 3
%.tmp3039 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp3040 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3039, i32 0, i32 3
%.tmp3041 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3040
store %m1777$.Type.type* %.tmp3041, %m1777$.Type.type** %.tmp3038
%.tmp3042 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3043 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3042, i32 0, i32 2
%.tmp3045 = getelementptr [9 x i8], [9 x i8]*@.str3044, i32 0, i32 0
store i8* %.tmp3045, i8** %.tmp3043
%.tmp3046 = load i1, i1* %shallow
%.tmp3047 = icmp eq i1 %.tmp3046, 1
br i1 %.tmp3047, label %.if.true.3048, label %.if.false.3048
.if.true.3048:
%.tmp3049 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3050 = load i8*, i8** %global_name
%.tmp3051 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3049, i8* %.tmp3050, %m1777$.AssignableInfo.type* %.tmp3051)
br label %.if.end.3048
.if.false.3048:
%.tmp3052 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3053 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3052, i32 0, i32 1
%.tmp3054 = load %m0$.File.type*, %m0$.File.type** %.tmp3053
%.tmp3056 = getelementptr [21 x i8], [21 x i8]*@.str3055, i32 0, i32 0
%.tmp3057 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3058 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3057)
%.tmp3059 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3060 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3061 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3060, i32 0, i32 3
%.tmp3062 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3061
%.tmp3063 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3059, %m1777$.Type.type* %.tmp3062)
%.tmp3064 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp3065 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3064)
%.tmp3066 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3054, i8* %.tmp3056, i8* %.tmp3058, i8* %.tmp3063, i8* %.tmp3065)
br label %.if.end.3048
.if.end.3048:
br label %.if.end.3012
.if.false.3012:
%.tmp3067 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3068 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3067, i32 0, i32 0
%.tmp3069 = load i8*, i8** %.tmp3068
%.tmp3071 = getelementptr [10 x i8], [10 x i8]*@.str3070, i32 0, i32 0
%.tmp3072 = call i32(i8*,i8*) @strcmp(i8* %.tmp3069, i8* %.tmp3071)
%.tmp3073 = icmp eq i32 %.tmp3072, 0
br i1 %.tmp3073, label %.if.true.3074, label %.if.false.3074
.if.true.3074:
%.tmp3075 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3076 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3075, i32 0, i32 6
%.tmp3077 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3076
%.tmp3078 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3077, i32 0, i32 7
%.tmp3079 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3078
%.tmp3080 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3079, i32 0, i32 1
%.tmp3081 = load i8*, i8** %.tmp3080
%type_name = alloca i8*
store i8* %.tmp3081, i8** %type_name
%.tmp3082 = load i1, i1* %shallow
%.tmp3083 = icmp eq i1 %.tmp3082, 1
br i1 %.tmp3083, label %.if.true.3084, label %.if.false.3084
.if.true.3084:
%.tmp3085 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3086 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3085)
store %m1777$.AssignableInfo.type* %.tmp3086, %m1777$.AssignableInfo.type** %info
%.tmp3087 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3088 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*) @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp3087)
%mod_from = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp3088, %m1777$.ModuleLookup.type** %mod_from
%.tmp3089 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3091 = getelementptr [11 x i8], [11 x i8]*@.str3090, i32 0, i32 0
%.tmp3092 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod_from
%.tmp3093 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3092, i32 0, i32 1
%.tmp3094 = load i8*, i8** %.tmp3093
%.tmp3095 = load i8*, i8** %type_name
%.tmp3096 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3089, i8* %.tmp3091, i8* %.tmp3094, i8* %.tmp3095)
%.tmp3097 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3098 = load i8, i8* @SCOPE_LOCAL
%.tmp3099 = load i8*, i8** %tmp_buff
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp3097, i8 %.tmp3098, i8* %.tmp3099)
%.tmp3100 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3101 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3100, i32 0, i32 2
%.tmp3103 = getelementptr [10 x i8], [10 x i8]*@.str3102, i32 0, i32 0
store i8* %.tmp3103, i8** %.tmp3101
%.tmp3104 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3105 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3104, i32 0, i32 4
%.tmp3106 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3107 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3106, i32 0, i32 3
%.tmp3108 = load i32, i32* %.tmp3107
store i32 %.tmp3108, i32* %.tmp3105
%.tmp3109 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3110 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3109, i32 0, i32 5
%.tmp3111 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3112 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3111, i32 0, i32 4
%.tmp3113 = load i32, i32* %.tmp3112
store i32 %.tmp3113, i32* %.tmp3110
%.tmp3114 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3115 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3114, i32 0, i32 3
%.tmp3116 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp3116, %m1777$.Type.type** %.tmp3115
%.tmp3117 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3118 = load i8*, i8** %type_name
%.tmp3119 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3117, i8* %.tmp3118, %m1777$.AssignableInfo.type* %.tmp3119)
%.tmp3120 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3121 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3120, i32 0, i32 6
%.tmp3122 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3121
%.tmp3124 = getelementptr [5 x i8], [5 x i8]*@.str3123, i32 0, i32 0
%.tmp3125 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3122, i8* %.tmp3124)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3125, %m286$.Node.type** %type_decl
%.tmp3126 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3127 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp3128 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3127, i32 0, i32 6
%.tmp3129 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3128
%.tmp3130 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3126, %m286$.Node.type* %.tmp3129)
%type_struct = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp3130, %m1777$.Type.type** %type_struct
%.tmp3131 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3132 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3131, i32 0, i32 3
%.tmp3133 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3132
%.tmp3134 = load %m1777$.Type.type*, %m1777$.Type.type** %type_struct
call void(%m1777$.Type.type*,%m1777$.Type.type*) @m1777$copy_type.v.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp3133, %m1777$.Type.type* %.tmp3134)
%.tmp3135 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3136 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3135, i32 0, i32 3
%.tmp3137 = load %m1777$.Type.type*, %m1777$.Type.type** %type_struct
store %m1777$.Type.type* %.tmp3137, %m1777$.Type.type** %.tmp3136
br label %.if.end.3084
.if.false.3084:
%.tmp3138 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3139 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3140 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3139, i32 0, i32 6
%.tmp3141 = load i8*, i8** %.tmp3140
%.tmp3142 = load i8*, i8** %type_name
%.tmp3143 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,i8*,i8*) @m1777$find_defined_str.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.cp(%m1777$.CompilerCtx.type* %.tmp3138, i8* %.tmp3141, i8* %.tmp3142)
%scope = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp3143, %m1777$.ScopeItem.type** %scope
%.tmp3144 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %scope
%.tmp3145 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp3144, i32 0, i32 1
%.tmp3146 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp3145
store %m1777$.AssignableInfo.type* %.tmp3146, %m1777$.AssignableInfo.type** %info
%.tmp3147 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3148 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3147, i32 0, i32 1
%.tmp3149 = load %m0$.File.type*, %m0$.File.type** %.tmp3148
%.tmp3151 = getelementptr [14 x i8], [14 x i8]*@.str3150, i32 0, i32 0
%.tmp3152 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3153 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3152)
%.tmp3154 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3155 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3156 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3155, i32 0, i32 3
%.tmp3157 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3156
%.tmp3158 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3154, %m1777$.Type.type* %.tmp3157)
%.tmp3159 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3149, i8* %.tmp3151, i8* %.tmp3153, i8* %.tmp3158)
br label %.if.end.3084
.if.end.3084:
br label %.if.end.3074
.if.false.3074:
%.tmp3160 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3161 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3160, i32 0, i32 0
%.tmp3162 = load i8*, i8** %.tmp3161
%.tmp3164 = getelementptr [7 x i8], [7 x i8]*@.str3163, i32 0, i32 0
%.tmp3165 = call i32(i8*,i8*) @strcmp(i8* %.tmp3162, i8* %.tmp3164)
%.tmp3166 = icmp eq i32 %.tmp3165, 0
br i1 %.tmp3166, label %.if.true.3167, label %.if.false.3167
.if.true.3167:
%.tmp3168 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3169 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3168)
store %m1777$.AssignableInfo.type* %.tmp3169, %m1777$.AssignableInfo.type** %info
%.tmp3170 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3171 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3170, i32 0, i32 3
%.tmp3172 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3173 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3174 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3173, i32 0, i32 6
%.tmp3175 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3174
%.tmp3176 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3175, i32 0, i32 7
%.tmp3177 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3176
%.tmp3178 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$syn_function_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3172, %m286$.Node.type* %.tmp3177)
store %m1777$.Type.type* %.tmp3178, %m1777$.Type.type** %.tmp3171
%.tmp3179 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3180 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3179, i32 0, i32 2
%.tmp3182 = getelementptr [7 x i8], [7 x i8]*@.str3181, i32 0, i32 0
store i8* %.tmp3182, i8** %.tmp3180
%.tmp3183 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3184 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3183, i32 0, i32 6
%.tmp3185 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3184
%.tmp3186 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3185, i32 0, i32 7
%.tmp3187 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3186
%.tmp3188 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3187, i32 0, i32 7
%.tmp3189 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3188
%.tmp3190 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3189, i32 0, i32 1
%.tmp3191 = load i8*, i8** %.tmp3190
%fn_name = alloca i8*
store i8* %.tmp3191, i8** %fn_name
%.tmp3192 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3193 = load i8, i8* @SCOPE_GLOBAL
%.tmp3194 = load i8*, i8** %fn_name
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp3192, i8 %.tmp3193, i8* %.tmp3194)
%.tmp3195 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp3195, %m1777$.Type.type** %return_type
%.tmp3196 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3197 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3196, i32 0, i32 0
%.tmp3198 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3199 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3198, i32 0, i32 3
%.tmp3200 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3199
%.tmp3201 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3200, i32 0, i32 3
%.tmp3202 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3201
%.tmp3203 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3202, i32 0, i32 0
%.tmp3204 = load i8*, i8** %.tmp3203
store i8* %.tmp3204, i8** %.tmp3197
%.tmp3205 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3206 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3205, i32 0, i32 3
%.tmp3207 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3208 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3207, i32 0, i32 3
%.tmp3209 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3208
%.tmp3210 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3209, i32 0, i32 3
%.tmp3211 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3210
%.tmp3212 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3211, i32 0, i32 3
%.tmp3213 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3212
store %m1777$.Type.type* %.tmp3213, %m1777$.Type.type** %.tmp3206
%.tmp3214 = load i1, i1* %shallow
%.tmp3215 = icmp eq i1 %.tmp3214, 0
br i1 %.tmp3215, label %.if.true.3216, label %.if.false.3216
.if.true.3216:
%.tmp3217 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3218 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3217, i32 0, i32 1
%.tmp3219 = load %m0$.File.type*, %m0$.File.type** %.tmp3218
%.tmp3221 = getelementptr [15 x i8], [15 x i8]*@.str3220, i32 0, i32 0
%.tmp3222 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3223 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3224 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3222, %m1777$.Type.type* %.tmp3223)
%.tmp3225 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3226 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3225)
%.tmp3227 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3219, i8* %.tmp3221, i8* %.tmp3224, i8* %.tmp3226)
%.tmp3229 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3230 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3229, i32 0, i32 3
%.tmp3231 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3230
%.tmp3232 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3231, i32 0, i32 3
%.tmp3233 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3232
%.tmp3234 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3233, i32 0, i32 4
%.tmp3235 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3234
%pt = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp3235, %m1777$.Type.type** %pt
br label %.for.start.3228
.for.start.3228:
%.tmp3236 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
%.tmp3237 = icmp ne %m1777$.Type.type* %.tmp3236, null
br i1 %.tmp3237, label %.for.continue.3228, label %.for.end.3228
.for.continue.3228:
%.tmp3238 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
%.tmp3239 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3240 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3239, i32 0, i32 3
%.tmp3241 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3240
%.tmp3242 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3241, i32 0, i32 3
%.tmp3243 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3242
%.tmp3244 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3243, i32 0, i32 4
%.tmp3245 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3244
%.tmp3246 = icmp ne %m1777$.Type.type* %.tmp3238, %.tmp3245
br i1 %.tmp3246, label %.if.true.3247, label %.if.false.3247
.if.true.3247:
%.tmp3248 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3249 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3248, i32 0, i32 1
%.tmp3250 = load %m0$.File.type*, %m0$.File.type** %.tmp3249
%.tmp3252 = getelementptr [3 x i8], [3 x i8]*@.str3251, i32 0, i32 0
%.tmp3253 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3250, i8* %.tmp3252)
br label %.if.end.3247
.if.false.3247:
br label %.if.end.3247
.if.end.3247:
%.tmp3254 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3255 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3254, i32 0, i32 1
%.tmp3256 = load %m0$.File.type*, %m0$.File.type** %.tmp3255
%.tmp3258 = getelementptr [3 x i8], [3 x i8]*@.str3257, i32 0, i32 0
%.tmp3259 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3260 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
%.tmp3261 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3259, %m1777$.Type.type* %.tmp3260)
%.tmp3262 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3256, i8* %.tmp3258, i8* %.tmp3261)
%.tmp3263 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
%.tmp3264 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3263, i32 0, i32 4
%.tmp3265 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3264
store %m1777$.Type.type* %.tmp3265, %m1777$.Type.type** %pt
br label %.for.start.3228
.for.end.3228:
%.tmp3266 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3267 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3266, i32 0, i32 1
%.tmp3268 = load %m0$.File.type*, %m0$.File.type** %.tmp3267
%.tmp3270 = getelementptr [3 x i8], [3 x i8]*@.str3269, i32 0, i32 0
%.tmp3271 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3268, i8* %.tmp3270)
%.tmp3272 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3273 = bitcast %m1777$.Type.type* %.tmp3272 to i8*
call void(i8*) @free(i8* %.tmp3273)
br label %.if.end.3216
.if.false.3216:
%.tmp3274 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3275 = load i8*, i8** %fn_name
%.tmp3276 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3274, i8* %.tmp3275, %m1777$.AssignableInfo.type* %.tmp3276)
br label %.if.end.3216
.if.end.3216:
br label %.if.end.3167
.if.false.3167:
%.tmp3277 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3278 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3277, i32 0, i32 0
%.tmp3279 = load i8*, i8** %.tmp3278
%.tmp3281 = getelementptr [9 x i8], [9 x i8]*@.str3280, i32 0, i32 0
%.tmp3282 = call i32(i8*,i8*) @strcmp(i8* %.tmp3279, i8* %.tmp3281)
%.tmp3283 = icmp eq i32 %.tmp3282, 0
br i1 %.tmp3283, label %.if.true.3284, label %.if.false.3284
.if.true.3284:
%.tmp3285 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3286 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3285)
store %m1777$.AssignableInfo.type* %.tmp3286, %m1777$.AssignableInfo.type** %info
%.tmp3287 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3288 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3287, i32 0, i32 2
%.tmp3290 = getelementptr [9 x i8], [9 x i8]*@.str3289, i32 0, i32 0
store i8* %.tmp3290, i8** %.tmp3288
%.tmp3291 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3292 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3291, i32 0, i32 3
%.tmp3293 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3294 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3295 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3294, i32 0, i32 6
%.tmp3296 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3295
%.tmp3297 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$syn_function_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3293, %m286$.Node.type* %.tmp3296)
store %m1777$.Type.type* %.tmp3297, %m1777$.Type.type** %.tmp3292
%.tmp3298 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3299 = call i8*(%m286$.Node.type*) @m1777$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3298)
%name = alloca i8*
store i8* %.tmp3299, i8** %name
%.tmp3300 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3301 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3302 = load i8*, i8** %name
%.tmp3303 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3304 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3303, i32 0, i32 3
%.tmp3305 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3304
%.tmp3306 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1777$.Type.type*) @m1777$name_mangle.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3300, %m286$.Node.type* %.tmp3301, i8* %.tmp3302, %m1777$.Type.type* %.tmp3305)
store i8* %.tmp3306, i8** %tmp_buff
%.tmp3307 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3308 = load i8, i8* @SCOPE_GLOBAL
%.tmp3309 = load i8*, i8** %tmp_buff
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp3307, i8 %.tmp3308, i8* %.tmp3309)
%.tmp3310 = load i1, i1* %shallow
%.tmp3311 = icmp eq i1 %.tmp3310, 1
br i1 %.tmp3311, label %.if.true.3312, label %.if.false.3312
.if.true.3312:
%.tmp3313 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3314 = load i8*, i8** %name
%.tmp3315 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3313, i8* %.tmp3314, %m1777$.AssignableInfo.type* %.tmp3315)
br label %.if.end.3312
.if.false.3312:
%.tmp3316 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp3316, %m1777$.Type.type** %return_type
%.tmp3317 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3318 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3319 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3318, i32 0, i32 3
%.tmp3320 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3319
%.tmp3321 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3320, i32 0, i32 3
%.tmp3322 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3321
call void(%m1777$.Type.type*,%m1777$.Type.type*) @m1777$copy_type.v.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp3317, %m1777$.Type.type* %.tmp3322)
%.tmp3323 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3324 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3323, i32 0, i32 1
%.tmp3325 = load %m0$.File.type*, %m0$.File.type** %.tmp3324
%.tmp3327 = getelementptr [14 x i8], [14 x i8]*@.str3326, i32 0, i32 0
%.tmp3328 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3329 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3330 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3328, %m1777$.Type.type* %.tmp3329)
%.tmp3331 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3332 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3331)
%.tmp3333 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3325, i8* %.tmp3327, i8* %.tmp3330, i8* %.tmp3332)
%.tmp3334 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3334, i32 0, i32 6
%.tmp3336 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3335
%.tmp3337 = call %m286$.Node.type*(%m286$.Node.type*) @m1777$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3336)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3337, %m286$.Node.type** %params
%param_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* null, %m1777$.Type.type** %param_type
%.tmp3339 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3339, %m286$.Node.type** %param_ptr
br label %.for.start.3338
.for.start.3338:
%.tmp3340 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3341 = icmp ne %m286$.Node.type* %.tmp3340, null
br i1 %.tmp3341, label %.for.continue.3338, label %.for.end.3338
.for.continue.3338:
%.tmp3342 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3343 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp3344 = icmp ne %m286$.Node.type* %.tmp3342, %.tmp3343
br i1 %.tmp3344, label %.if.true.3345, label %.if.false.3345
.if.true.3345:
%.tmp3346 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3347 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3346, i32 0, i32 7
%.tmp3348 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3347
store %m286$.Node.type* %.tmp3348, %m286$.Node.type** %param_ptr
%.tmp3349 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3350 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3349, i32 0, i32 1
%.tmp3351 = load %m0$.File.type*, %m0$.File.type** %.tmp3350
%.tmp3353 = getelementptr [3 x i8], [3 x i8]*@.str3352, i32 0, i32 0
%.tmp3354 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3351, i8* %.tmp3353)
br label %.if.end.3345
.if.false.3345:
br label %.if.end.3345
.if.end.3345:
%.tmp3355 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3356 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3355, i32 0, i32 0
%.tmp3357 = load i8*, i8** %.tmp3356
%.tmp3359 = getelementptr [5 x i8], [5 x i8]*@.str3358, i32 0, i32 0
%.tmp3360 = call i32(i8*,i8*) @strcmp(i8* %.tmp3357, i8* %.tmp3359)
%.tmp3361 = icmp eq i32 %.tmp3360, 0
br i1 %.tmp3361, label %.if.true.3362, label %.if.false.3362
.if.true.3362:
%.tmp3363 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3364 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3365 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3364, i32 0, i32 6
%.tmp3366 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3365
%.tmp3367 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3363, %m286$.Node.type* %.tmp3366)
store %m1777$.Type.type* %.tmp3367, %m1777$.Type.type** %param_type
%.tmp3368 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3369 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3368, i32 0, i32 7
%.tmp3370 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3369
store %m286$.Node.type* %.tmp3370, %m286$.Node.type** %param_ptr
br label %.if.end.3362
.if.false.3362:
br label %.if.end.3362
.if.end.3362:
%.tmp3371 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3372 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3371, i32 0, i32 1
%.tmp3373 = load %m0$.File.type*, %m0$.File.type** %.tmp3372
%.tmp3375 = getelementptr [13 x i8], [13 x i8]*@.str3374, i32 0, i32 0
%.tmp3376 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3377 = load %m1777$.Type.type*, %m1777$.Type.type** %param_type
%.tmp3378 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3376, %m1777$.Type.type* %.tmp3377)
%.tmp3379 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3380 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3379, i32 0, i32 1
%.tmp3381 = load i8*, i8** %.tmp3380
%.tmp3382 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3373, i8* %.tmp3375, i8* %.tmp3378, i8* %.tmp3381)
%.tmp3383 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3383, i32 0, i32 7
%.tmp3385 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3384
store %m286$.Node.type* %.tmp3385, %m286$.Node.type** %param_ptr
br label %.for.start.3338
.for.end.3338:
%.tmp3386 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3387 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3386, i32 0, i32 1
%.tmp3388 = load %m0$.File.type*, %m0$.File.type** %.tmp3387
%.tmp3390 = getelementptr [5 x i8], [5 x i8]*@.str3389, i32 0, i32 0
%.tmp3391 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3388, i8* %.tmp3390)
%.tmp3392 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3394 = getelementptr [9 x i8], [9 x i8]*@.str3393, i32 0, i32 0
%.tmp3395 = bitcast ptr null to i8*
%.tmp3396 = bitcast ptr null to i8*
call void(%m1777$.CompilerCtx.type*,i8*,i8*,i8*) @m1777$push_scope.v.m1777$.CompilerCtx.typep.cp.cp.cp(%m1777$.CompilerCtx.type* %.tmp3392, i8* %.tmp3394, i8* %.tmp3395, i8* %.tmp3396)
%.tmp3397 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3398 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_fn_params.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3397, %m286$.Node.type* %.tmp3398)
%.tmp3399 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3400 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3399, i32 0, i32 6
%.tmp3401 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3400
%.tmp3403 = getelementptr [6 x i8], [6 x i8]*@.str3402, i32 0, i32 0
%.tmp3404 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3401, i8* %.tmp3403)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3404, %m286$.Node.type** %fn_block
%.tmp3405 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3406 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3405, %m286$.Node.type* %.tmp3406)
%.tmp3407 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
call void(%m1777$.CompilerCtx.type*) @m1777$pop_scope.v.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp3407)
%.tmp3408 = bitcast ptr null to %m286$.Node.type*
%last_valid_instruction = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3408, %m286$.Node.type** %last_valid_instruction
%.tmp3410 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3411 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3410, i32 0, i32 6
%.tmp3412 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3411
%ci = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3412, %m286$.Node.type** %ci
br label %.for.start.3409
.for.start.3409:
%.tmp3413 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3414 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3413, i32 0, i32 7
%.tmp3415 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3414
%.tmp3416 = icmp ne %m286$.Node.type* %.tmp3415, null
br i1 %.tmp3416, label %.for.continue.3409, label %.for.end.3409
.for.continue.3409:
%.tmp3417 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3418 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3417, i32 0, i32 0
%.tmp3419 = load i8*, i8** %.tmp3418
%.tmp3421 = getelementptr [3 x i8], [3 x i8]*@.str3420, i32 0, i32 0
%.tmp3422 = call i32(i8*,i8*) @strcmp(i8* %.tmp3419, i8* %.tmp3421)
%.tmp3423 = icmp ne i32 %.tmp3422, 0
%.tmp3424 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3425 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3424, i32 0, i32 0
%.tmp3426 = load i8*, i8** %.tmp3425
%.tmp3428 = getelementptr [9 x i8], [9 x i8]*@.str3427, i32 0, i32 0
%.tmp3429 = call i32(i8*,i8*) @strcmp(i8* %.tmp3426, i8* %.tmp3428)
%.tmp3430 = icmp ne i32 %.tmp3429, 0
%.tmp3431 = and i1 %.tmp3423, %.tmp3430
br i1 %.tmp3431, label %.if.true.3432, label %.if.false.3432
.if.true.3432:
%.tmp3433 = load %m286$.Node.type*, %m286$.Node.type** %ci
store %m286$.Node.type* %.tmp3433, %m286$.Node.type** %last_valid_instruction
br label %.if.end.3432
.if.false.3432:
br label %.if.end.3432
.if.end.3432:
%.tmp3434 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3435 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3434, i32 0, i32 7
%.tmp3436 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3435
store %m286$.Node.type* %.tmp3436, %m286$.Node.type** %ci
br label %.for.start.3409
.for.end.3409:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3437 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3438 = icmp eq %m286$.Node.type* %.tmp3437, null
br i1 %.tmp3438, label %.if.true.3439, label %.if.false.3439
.if.true.3439:
store i1 1, i1* %add_implicit_return
br label %.if.end.3439
.if.false.3439:
%.tmp3440 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3441 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3440, i32 0, i32 6
%.tmp3442 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3441
%.tmp3443 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3442, i32 0, i32 0
%.tmp3444 = load i8*, i8** %.tmp3443
%.tmp3446 = getelementptr [7 x i8], [7 x i8]*@.str3445, i32 0, i32 0
%.tmp3447 = call i32(i8*,i8*) @strcmp(i8* %.tmp3444, i8* %.tmp3446)
%.tmp3448 = icmp ne i32 %.tmp3447, 0
br i1 %.tmp3448, label %.if.true.3449, label %.if.false.3449
.if.true.3449:
store i1 1, i1* %add_implicit_return
br label %.if.end.3449
.if.false.3449:
br label %.if.end.3449
.if.end.3449:
br label %.if.end.3439
.if.end.3439:
%.tmp3450 = load i1, i1* %add_implicit_return
br i1 %.tmp3450, label %.if.true.3451, label %.if.false.3451
.if.true.3451:
%.tmp3452 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3453 = load %m1777$.Type.type*, %m1777$.Type.type** %return_type
%.tmp3454 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3452, %m1777$.Type.type* %.tmp3453)
%.tmp3456 = getelementptr [5 x i8], [5 x i8]*@.str3455, i32 0, i32 0
%.tmp3457 = call i32(i8*,i8*) @strcmp(i8* %.tmp3454, i8* %.tmp3456)
%.tmp3458 = icmp ne i32 %.tmp3457, 0
br i1 %.tmp3458, label %.if.true.3459, label %.if.false.3459
.if.true.3459:
%.tmp3460 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3461 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3463 = getelementptr [21 x i8], [21 x i8]*@.str3462, i32 0, i32 0
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp3460, %m286$.Node.type* %.tmp3461, i8* %.tmp3463)
br label %.if.end.3459
.if.false.3459:
%.tmp3464 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3465 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3464, i32 0, i32 1
%.tmp3466 = load %m0$.File.type*, %m0$.File.type** %.tmp3465
%.tmp3468 = getelementptr [10 x i8], [10 x i8]*@.str3467, i32 0, i32 0
%.tmp3469 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3466, i8* %.tmp3468)
br label %.if.end.3459
.if.end.3459:
br label %.if.end.3451
.if.false.3451:
br label %.if.end.3451
.if.end.3451:
%.tmp3470 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3471 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3470, i32 0, i32 1
%.tmp3472 = load %m0$.File.type*, %m0$.File.type** %.tmp3471
%.tmp3474 = getelementptr [3 x i8], [3 x i8]*@.str3473, i32 0, i32 0
%.tmp3475 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3472, i8* %.tmp3474)
br label %.if.end.3312
.if.end.3312:
br label %.if.end.3284
.if.false.3284:
%.tmp3476 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3477 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3476, i32 0, i32 0
%.tmp3478 = load i8*, i8** %.tmp3477
%.tmp3480 = getelementptr [7 x i8], [7 x i8]*@.str3479, i32 0, i32 0
%.tmp3481 = call i32(i8*,i8*) @strcmp(i8* %.tmp3478, i8* %.tmp3480)
%.tmp3482 = icmp eq i32 %.tmp3481, 0
br i1 %.tmp3482, label %.if.true.3483, label %.if.false.3483
.if.true.3483:
%.tmp3484 = load i1, i1* %shallow
%.tmp3485 = icmp eq i1 %.tmp3484, 1
br i1 %.tmp3485, label %.if.true.3486, label %.if.false.3486
.if.true.3486:
%.tmp3487 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3488 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3487, i32 0, i32 6
%.tmp3489 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3488
%.tmp3490 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3489, i32 0, i32 7
%.tmp3491 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3490
%.tmp3492 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3491, i32 0, i32 1
%.tmp3493 = load i8*, i8** %.tmp3492
%mod_name = alloca i8*
store i8* %.tmp3493, i8** %mod_name
%.tmp3494 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3495 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3494, i32 0, i32 6
%.tmp3496 = load i8*, i8** %.tmp3495
%mod_abspath = alloca i8*
store i8* %.tmp3496, i8** %mod_abspath
%.tmp3497 = load i8*, i8** %mod_abspath
%.tmp3498 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3497)
%dirname = alloca i8*
store i8* %.tmp3498, i8** %dirname
%.tmp3499 = load i8*, i8** %mod_name
%.tmp3500 = call i32(i8*) @strlen(i8* %.tmp3499)
%mod_name_len = alloca i32
store i32 %.tmp3500, i32* %mod_name_len
%.tmp3501 = load i32, i32* %mod_name_len
%.tmp3502 = sub i32 %.tmp3501, 1
%.tmp3503 = call i8*(i32) @malloc(i32 %.tmp3502)
%trimmed_name = alloca i8*
store i8* %.tmp3503, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3504
.for.start.3504:
%.tmp3505 = load i32, i32* %i
%.tmp3506 = load i32, i32* %mod_name_len
%.tmp3507 = sub i32 %.tmp3506, 1
%.tmp3508 = icmp slt i32 %.tmp3505, %.tmp3507
br i1 %.tmp3508, label %.for.continue.3504, label %.for.end.3504
.for.continue.3504:
%.tmp3509 = load i32, i32* %i
%.tmp3510 = sub i32 %.tmp3509, 1
%.tmp3511 = load i8*, i8** %trimmed_name
%.tmp3512 = getelementptr i8, i8* %.tmp3511, i32 %.tmp3510
%.tmp3513 = load i32, i32* %i
%.tmp3514 = load i8*, i8** %mod_name
%.tmp3515 = getelementptr i8, i8* %.tmp3514, i32 %.tmp3513
%.tmp3516 = load i8, i8* %.tmp3515
store i8 %.tmp3516, i8* %.tmp3512
%.tmp3517 = load i32, i32* %i
%.tmp3518 = add i32 %.tmp3517, 1
store i32 %.tmp3518, i32* %i
br label %.for.start.3504
.for.end.3504:
%.tmp3519 = load i32, i32* %mod_name_len
%.tmp3520 = sub i32 %.tmp3519, 2
%.tmp3521 = load i8*, i8** %trimmed_name
%.tmp3522 = getelementptr i8, i8* %.tmp3521, i32 %.tmp3520
store i8 0, i8* %.tmp3522
%.tmp3523 = load i8*, i8** %dirname
%.tmp3525 = getelementptr [1 x i8], [1 x i8]*@.str3524, i32 0, i32 0
%.tmp3526 = call i32(i8*,i8*) @strcmp(i8* %.tmp3523, i8* %.tmp3525)
%.tmp3527 = icmp eq i32 %.tmp3526, 0
br i1 %.tmp3527, label %.if.true.3528, label %.if.false.3528
.if.true.3528:
%.tmp3529 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3531 = getelementptr [6 x i8], [6 x i8]*@.str3530, i32 0, i32 0
%.tmp3532 = load i8*, i8** %trimmed_name
%.tmp3533 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3529, i8* %.tmp3531, i8* %.tmp3532)
br label %.if.end.3528
.if.false.3528:
%.tmp3534 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3536 = getelementptr [9 x i8], [9 x i8]*@.str3535, i32 0, i32 0
%.tmp3537 = load i8*, i8** %dirname
%.tmp3538 = load i8*, i8** %trimmed_name
%.tmp3539 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3534, i8* %.tmp3536, i8* %.tmp3537, i8* %.tmp3538)
br label %.if.end.3528
.if.end.3528:
%.tmp3540 = load i8*, i8** %mod_abspath
%.tmp3541 = call i8*(i32) @malloc(i32 4096)
%.tmp3542 = call i8*(i8*,i8*) @realpath(i8* %.tmp3540, i8* %.tmp3541)
store i8* %.tmp3542, i8** %mod_abspath
%.tmp3543 = load i8*, i8** %mod_abspath
%.tmp3544 = icmp eq i8* %.tmp3543, null
br i1 %.tmp3544, label %.if.true.3545, label %.if.false.3545
.if.true.3545:
%.tmp3546 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3548 = getelementptr [60 x i8], [60 x i8]*@.str3547, i32 0, i32 0
%.tmp3549 = load i8*, i8** %mod_name
%.tmp3550 = load i8*, i8** %dirname
%.tmp3551 = load i8*, i8** %trimmed_name
%.tmp3552 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3546, i8* %.tmp3548, i8* %.tmp3549, i8* %.tmp3550, i8* %.tmp3551)
%.tmp3553 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3554 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3555 = load i8*, i8** %err_buf
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp3553, %m286$.Node.type* %.tmp3554, i8* %.tmp3555)
ret void
br label %.if.end.3545
.if.false.3545:
br label %.if.end.3545
.if.end.3545:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* null, %m1777$.ModuleLookup.type** %m
%.tmp3556 = bitcast ptr null to %m1777$.ModuleLookup.type*
%mod = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp3556, %m1777$.ModuleLookup.type** %mod
%.tmp3558 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3559 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3558, i32 0, i32 5
%.tmp3560 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp3559
store %m1777$.ModuleLookup.type* %.tmp3560, %m1777$.ModuleLookup.type** %m
br label %.for.start.3557
.for.start.3557:
%.tmp3561 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp3562 = icmp ne %m1777$.ModuleLookup.type* %.tmp3561, null
%.tmp3563 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3564 = icmp eq %m1777$.ModuleLookup.type* %.tmp3563, null
%.tmp3565 = and i1 %.tmp3562, %.tmp3564
br i1 %.tmp3565, label %.for.continue.3557, label %.for.end.3557
.for.continue.3557:
%.tmp3566 = load i8*, i8** %mod_abspath
%.tmp3567 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp3568 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3567, i32 0, i32 0
%.tmp3569 = load i8*, i8** %.tmp3568
%.tmp3570 = call i32(i8*,i8*) @strcmp(i8* %.tmp3566, i8* %.tmp3569)
%.tmp3571 = icmp eq i32 %.tmp3570, 0
br i1 %.tmp3571, label %.if.true.3572, label %.if.false.3572
.if.true.3572:
%.tmp3573 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
store %m1777$.ModuleLookup.type* %.tmp3573, %m1777$.ModuleLookup.type** %mod
br label %.if.end.3572
.if.false.3572:
br label %.if.end.3572
.if.end.3572:
%.tmp3574 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp3575 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3574, i32 0, i32 2
%.tmp3576 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp3575
store %m1777$.ModuleLookup.type* %.tmp3576, %m1777$.ModuleLookup.type** %m
br label %.for.start.3557
.for.end.3557:
%.tmp3577 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3578 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3577, i32 0, i32 6
%.tmp3579 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3578
%.tmp3580 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3579, i32 0, i32 7
%.tmp3581 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3580
%.tmp3582 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3581, i32 0, i32 7
%.tmp3583 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3582
%.tmp3584 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3583, i32 0, i32 7
%.tmp3585 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3584
%.tmp3586 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3585, i32 0, i32 1
%.tmp3587 = load i8*, i8** %.tmp3586
%asname = alloca i8*
store i8* %.tmp3587, i8** %asname
%.tmp3588 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3589 = icmp eq %m1777$.ModuleLookup.type* %.tmp3588, null
br i1 %.tmp3589, label %.if.true.3590, label %.if.false.3590
.if.true.3590:
%.tmp3591 = load i32, i32* @ModuleLookup_size
%.tmp3592 = call i8*(i32) @malloc(i32 %.tmp3591)
%.tmp3593 = bitcast i8* %.tmp3592 to %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp3593, %m1777$.ModuleLookup.type** %mod
%.tmp3594 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3595 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3594, i32 0, i32 0
%.tmp3596 = load i8*, i8** %mod_abspath
store i8* %.tmp3596, i8** %.tmp3595
%.tmp3597 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3598 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3597, i32 0, i32 2
store %m1777$.ModuleLookup.type* null, %m1777$.ModuleLookup.type** %.tmp3598
%.tmp3599 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3600 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3599, i32 0, i32 3
store %m1777$.Scope.type* null, %m1777$.Scope.type** %.tmp3600
%.tmp3601 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3602 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3601, i32 0, i32 1
%.tmp3603 = getelementptr i8*, i8** %.tmp3602, i32 0
%.tmp3605 = getelementptr [5 x i8], [5 x i8]*@.str3604, i32 0, i32 0
%.tmp3606 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3607 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp3606)
%.tmp3608 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3603, i8* %.tmp3605, i32 %.tmp3607)
%.tmp3610 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3611 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3610, i32 0, i32 5
%.tmp3612 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp3611
store %m1777$.ModuleLookup.type* %.tmp3612, %m1777$.ModuleLookup.type** %m
br label %.for.start.3609
.for.start.3609:
%.tmp3613 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp3614 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3613, i32 0, i32 2
%.tmp3615 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp3614
%.tmp3616 = icmp ne %m1777$.ModuleLookup.type* %.tmp3615, null
br i1 %.tmp3616, label %.for.continue.3609, label %.for.end.3609
.for.continue.3609:
%.tmp3617 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp3618 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3617, i32 0, i32 2
%.tmp3619 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %.tmp3618
store %m1777$.ModuleLookup.type* %.tmp3619, %m1777$.ModuleLookup.type** %m
br label %.for.start.3609
.for.end.3609:
%.tmp3620 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %m
%.tmp3621 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3620, i32 0, i32 2
%.tmp3622 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
store %m1777$.ModuleLookup.type* %.tmp3622, %m1777$.ModuleLookup.type** %.tmp3621
%.tmp3623 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3624 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3625 = load i8*, i8** %asname
%.tmp3626 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3627 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3626, i32 0, i32 0
%.tmp3628 = load i8*, i8** %.tmp3627
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1777$define_module.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1777$.CompilerCtx.type* %.tmp3623, %m286$.Node.type* %.tmp3624, i8* %.tmp3625, i8* %.tmp3628)
%.tmp3629 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3630 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3629, i32 0, i32 6
%.tmp3631 = load i8*, i8** %.tmp3630
%curr_mod = alloca i8*
store i8* %.tmp3631, i8** %curr_mod
%.tmp3632 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3633 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3632, i32 0, i32 6
%.tmp3634 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3635 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3634, i32 0, i32 0
%.tmp3636 = load i8*, i8** %.tmp3635
store i8* %.tmp3636, i8** %.tmp3633
%.tmp3637 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3638 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3639 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3638, i32 0, i32 0
%.tmp3640 = load i8*, i8** %.tmp3639
%.tmp3641 = call i1(%m1777$.CompilerCtx.type*,i8*) @m1777$compile_file.b.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.tmp3637, i8* %.tmp3640)
%.tmp3642 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3643 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3642, i32 0, i32 6
%.tmp3644 = load i8*, i8** %curr_mod
store i8* %.tmp3644, i8** %.tmp3643
br label %.if.end.3590
.if.false.3590:
%.tmp3645 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3646 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3647 = load i8*, i8** %asname
%.tmp3648 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp3649 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp3648, i32 0, i32 0
%.tmp3650 = load i8*, i8** %.tmp3649
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1777$define_module.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1777$.CompilerCtx.type* %.tmp3645, %m286$.Node.type* %.tmp3646, i8* %.tmp3647, i8* %.tmp3650)
br label %.if.end.3590
.if.end.3590:
br label %.if.end.3486
.if.false.3486:
br label %.if.end.3486
.if.end.3486:
br label %.if.end.3483
.if.false.3483:
%.tmp3651 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3652 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3654 = getelementptr [40 x i8], [40 x i8]*@.str3653, i32 0, i32 0
%.tmp3655 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp3651, %m286$.Node.type* %.tmp3652, i8* %.tmp3654)
%.tmp3656 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3657 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3656, i32 0, i32 0
%.tmp3658 = load i8*, i8** %.tmp3657
%.tmp3659 = call i32(i8*,...) @printf(i8* %.tmp3655, i8* %.tmp3658)
br label %.if.end.3483
.if.end.3483:
br label %.if.end.3284
.if.end.3284:
br label %.if.end.3167
.if.end.3167:
br label %.if.end.3074
.if.end.3074:
br label %.if.end.3012
.if.end.3012:
br label %.if.end.3004
.if.end.3004:
ret void
}
define i8* @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp3660 = getelementptr i8*, i8** %buf, i32 0
%.tmp3662 = getelementptr [31 x i8], [31 x i8]*@.str3661, i32 0, i32 0
%.tmp3663 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3664 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3663, i32 0, i32 6
%.tmp3665 = load i8*, i8** %.tmp3664
%.tmp3666 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3667 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3666, i32 0, i32 3
%.tmp3668 = load i32, i32* %.tmp3667
%.tmp3669 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3670 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3669, i32 0, i32 4
%.tmp3671 = load i32, i32* %.tmp3670
%.tmp3672 = load i8*, i8** %msg
%.tmp3673 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3660, i8* %.tmp3662, i8* %.tmp3665, i32 %.tmp3668, i32 %.tmp3671, i8* %.tmp3672)
%.tmp3674 = load i8*, i8** %buf
ret i8* %.tmp3674
}
define void @m1777$compile_fn_params.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* null, %m1777$.Type.type** %param_type
%.tmp3676 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3676, %m286$.Node.type** %param_ptr
br label %.for.start.3675
.for.start.3675:
%.tmp3677 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3678 = icmp ne %m286$.Node.type* %.tmp3677, null
br i1 %.tmp3678, label %.for.continue.3675, label %.for.end.3675
.for.continue.3675:
%.tmp3679 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3680 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3681 = icmp ne %m286$.Node.type* %.tmp3679, %.tmp3680
br i1 %.tmp3681, label %.if.true.3682, label %.if.false.3682
.if.true.3682:
%.tmp3683 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3684 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3683, i32 0, i32 7
%.tmp3685 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3684
store %m286$.Node.type* %.tmp3685, %m286$.Node.type** %param_ptr
br label %.if.end.3682
.if.false.3682:
br label %.if.end.3682
.if.end.3682:
%.tmp3686 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3687 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3686)
%param_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3687, %m1777$.AssignableInfo.type** %param_info
%.tmp3688 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
%.tmp3689 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3688, i32 0, i32 2
%.tmp3691 = getelementptr [9 x i8], [9 x i8]*@.str3690, i32 0, i32 0
store i8* %.tmp3691, i8** %.tmp3689
%.tmp3692 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3693 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3692, i32 0, i32 0
%.tmp3694 = load i8*, i8** %.tmp3693
%.tmp3696 = getelementptr [5 x i8], [5 x i8]*@.str3695, i32 0, i32 0
%.tmp3697 = call i32(i8*,i8*) @strcmp(i8* %.tmp3694, i8* %.tmp3696)
%.tmp3698 = icmp eq i32 %.tmp3697, 0
br i1 %.tmp3698, label %.if.true.3699, label %.if.false.3699
.if.true.3699:
%.tmp3700 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3701 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3702 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3701, i32 0, i32 6
%.tmp3703 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3702
%.tmp3704 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3700, %m286$.Node.type* %.tmp3703)
store %m1777$.Type.type* %.tmp3704, %m1777$.Type.type** %param_type
%.tmp3705 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3706 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3705, i32 0, i32 7
%.tmp3707 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3706
store %m286$.Node.type* %.tmp3707, %m286$.Node.type** %param_ptr
br label %.if.end.3699
.if.false.3699:
br label %.if.end.3699
.if.end.3699:
%.tmp3708 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
%.tmp3709 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3708, i32 0, i32 3
%.tmp3710 = load %m1777$.Type.type*, %m1777$.Type.type** %param_type
store %m1777$.Type.type* %.tmp3710, %m1777$.Type.type** %.tmp3709
%.tmp3711 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3712 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3711, i32 0, i32 1
%.tmp3713 = load i8*, i8** %.tmp3712
%var_name = alloca i8*
store i8* %.tmp3713, i8** %var_name
%.tmp3714 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
%.tmp3715 = load i8, i8* @SCOPE_LOCAL
%.tmp3716 = load i8*, i8** %var_name
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp3714, i8 %.tmp3715, i8* %.tmp3716)
%.tmp3717 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3718 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
%.tmp3719 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3718, i32 0, i32 3
%.tmp3720 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3719
%.tmp3721 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3717, %m1777$.Type.type* %.tmp3720)
%param_info_tr = alloca i8*
store i8* %.tmp3721, i8** %param_info_tr
%.tmp3722 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3723 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3722, i32 0, i32 1
%.tmp3724 = load %m0$.File.type*, %m0$.File.type** %.tmp3723
%.tmp3726 = getelementptr [16 x i8], [16 x i8]*@.str3725, i32 0, i32 0
%.tmp3727 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
%.tmp3728 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3727)
%.tmp3729 = load i8*, i8** %param_info_tr
%.tmp3730 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3724, i8* %.tmp3726, i8* %.tmp3728, i8* %.tmp3729)
%.tmp3731 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3732 = load i8*, i8** %var_name
%.tmp3733 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3731, i8* %.tmp3732, %m1777$.AssignableInfo.type* %.tmp3733)
%.tmp3734 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3735 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3734, i32 0, i32 1
%.tmp3736 = load %m0$.File.type*, %m0$.File.type** %.tmp3735
%.tmp3738 = getelementptr [28 x i8], [28 x i8]*@.str3737, i32 0, i32 0
%.tmp3739 = load i8*, i8** %param_info_tr
%.tmp3740 = load i8*, i8** %var_name
%.tmp3741 = load i8*, i8** %param_info_tr
%.tmp3742 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %param_info
%.tmp3743 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3742)
%.tmp3744 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3736, i8* %.tmp3738, i8* %.tmp3739, i8* %.tmp3740, i8* %.tmp3741, i8* %.tmp3743)
%.tmp3745 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3746 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3745, i32 0, i32 7
%.tmp3747 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3746
store %m286$.Node.type* %.tmp3747, %m286$.Node.type** %param_ptr
br label %.for.start.3675
.for.end.3675:
ret void
}
define void @m1777$compile_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3748 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3750 = getelementptr [6 x i8], [6 x i8]*@.str3749, i32 0, i32 0
%.tmp3751 = bitcast ptr null to i8*
%.tmp3752 = bitcast ptr null to i8*
call void(%m1777$.CompilerCtx.type*,i8*,i8*,i8*) @m1777$push_scope.v.m1777$.CompilerCtx.typep.cp.cp.cp(%m1777$.CompilerCtx.type* %.tmp3748, i8* %.tmp3750, i8* %.tmp3751, i8* %.tmp3752)
%.tmp3754 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3755 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3754, i32 0, i32 6
%.tmp3756 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3755
%b = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3756, %m286$.Node.type** %b
br label %.for.start.3753
.for.start.3753:
%.tmp3757 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3758 = icmp ne %m286$.Node.type* %.tmp3757, null
br i1 %.tmp3758, label %.for.continue.3753, label %.for.end.3753
.for.continue.3753:
%.tmp3759 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3760 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3759, i32 0, i32 0
%.tmp3761 = load i8*, i8** %.tmp3760
%.tmp3763 = getelementptr [11 x i8], [11 x i8]*@.str3762, i32 0, i32 0
%.tmp3764 = call i32(i8*,i8*) @strcmp(i8* %.tmp3761, i8* %.tmp3763)
%.tmp3765 = icmp eq i32 %.tmp3764, 0
br i1 %.tmp3765, label %.if.true.3766, label %.if.false.3766
.if.true.3766:
%.tmp3767 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3768 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3769 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3768, i32 0, i32 6
%.tmp3770 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3769
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_expression.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3767, %m286$.Node.type* %.tmp3770)
br label %.if.end.3766
.if.false.3766:
br label %.if.end.3766
.if.end.3766:
%.tmp3771 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3772 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3771, i32 0, i32 7
%.tmp3773 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3772
store %m286$.Node.type* %.tmp3773, %m286$.Node.type** %b
br label %.for.start.3753
.for.end.3753:
%.tmp3774 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
call void(%m1777$.CompilerCtx.type*) @m1777$pop_scope.v.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp3774)
ret void
}
define %m1777$.AssignableInfo.type* @m1777$compile_builtin.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3775 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3776 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3775, i32 0, i32 6
%.tmp3777 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3776
%.tmp3778 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3777, i32 0, i32 6
%.tmp3779 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3778
%dotted = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3779, %m286$.Node.type** %dotted
%.tmp3780 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3781 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3780, i32 0, i32 7
%.tmp3782 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3781
%.tmp3783 = icmp ne %m286$.Node.type* %.tmp3782, null
br i1 %.tmp3783, label %.if.true.3784, label %.if.false.3784
.if.true.3784:
%.tmp3785 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp3785
br label %.if.end.3784
.if.false.3784:
br label %.if.end.3784
.if.end.3784:
%.tmp3786 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3787 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3786, i32 0, i32 1
%.tmp3788 = load i8*, i8** %.tmp3787
%.tmp3790 = getelementptr [7 x i8], [7 x i8]*@.str3789, i32 0, i32 0
%.tmp3791 = call i32(i8*,i8*) @strcmp(i8* %.tmp3788, i8* %.tmp3790)
%.tmp3792 = icmp eq i32 %.tmp3791, 0
br i1 %.tmp3792, label %.if.true.3793, label %.if.false.3793
.if.true.3793:
%.tmp3794 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3796 = getelementptr [8 x i8], [8 x i8]*@.str3795, i32 0, i32 0
%.tmp3797 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3794, i8* %.tmp3796)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3797, %m286$.Node.type** %args
%.tmp3798 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3799 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3798, i32 0, i32 6
%.tmp3800 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3799
%.tmp3802 = getelementptr [11 x i8], [11 x i8]*@.str3801, i32 0, i32 0
%.tmp3803 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3800, i8* %.tmp3802)
%value = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3803, %m286$.Node.type** %value
%.tmp3804 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3805 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3804, i32 0, i32 6
%.tmp3806 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3805
%.tmp3807 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3806, i32 0, i32 6
%.tmp3808 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3807
%.tmp3809 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3808, i32 0, i32 6
%.tmp3810 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3809
%.tmp3811 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3810, i32 0, i32 6
%.tmp3812 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3811
store %m286$.Node.type* %.tmp3812, %m286$.Node.type** %value
%.tmp3813 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3814 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp3813)
%tmp_id = alloca i32
store i32 %.tmp3814, i32* %tmp_id
%.tmp3815 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3816 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3815)
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3816, %m1777$.AssignableInfo.type** %info
%.tmp3817 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3818 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3817, %m1777$.AssignableInfo.type* %.tmp3818)
%.tmp3819 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3820 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3819, i32 0, i32 3
%.tmp3821 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp3821, %m1777$.Type.type** %.tmp3820
%.tmp3822 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3823 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3822, i32 0, i32 3
%.tmp3824 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3823
%.tmp3825 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3824, i32 0, i32 0
%.tmp3827 = getelementptr [4 x i8], [4 x i8]*@.str3826, i32 0, i32 0
store i8* %.tmp3827, i8** %.tmp3825
%.tmp3828 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3829 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3830 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3828, %m286$.Node.type* %.tmp3829)
%inspected_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp3830, %m1777$.Type.type** %inspected_type
%.tmp3831 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3832 = load %m1777$.Type.type*, %m1777$.Type.type** %inspected_type
%.tmp3833 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3831, %m1777$.Type.type* %.tmp3832)
%type_as_str = alloca i8*
store i8* %.tmp3833, i8** %type_as_str
%.tmp3834 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3835 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3834, i32 0, i32 1
%.tmp3836 = load %m0$.File.type*, %m0$.File.type** %.tmp3835
%.tmp3838 = getelementptr [46 x i8], [46 x i8]*@.str3837, i32 0, i32 0
%.tmp3839 = load i32, i32* %tmp_id
%.tmp3840 = load i8*, i8** %type_as_str
%.tmp3841 = load i8*, i8** %type_as_str
%.tmp3842 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3836, i8* %.tmp3838, i32 %.tmp3839, i8* %.tmp3840, i8* %.tmp3841)
%.tmp3843 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3844 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3843, i32 0, i32 1
%.tmp3845 = load %m0$.File.type*, %m0$.File.type** %.tmp3844
%.tmp3847 = getelementptr [35 x i8], [35 x i8]*@.str3846, i32 0, i32 0
%.tmp3848 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3849 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3848)
%.tmp3850 = load i8*, i8** %type_as_str
%.tmp3851 = load i32, i32* %tmp_id
%.tmp3852 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3845, i8* %.tmp3847, i8* %.tmp3849, i8* %.tmp3850, i32 %.tmp3851)
%.tmp3853 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp3853
br label %.if.end.3793
.if.false.3793:
br label %.if.end.3793
.if.end.3793:
%.tmp3854 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp3854
}
define %m1777$.AssignableInfo.type* @m1777$compile_fn_call.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3855 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3856 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3857 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_builtin.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3855, %m286$.Node.type* %.tmp3856)
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3857, %m1777$.AssignableInfo.type** %info
%.tmp3858 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3859 = icmp ne %m1777$.AssignableInfo.type* %.tmp3858, null
br i1 %.tmp3859, label %.if.true.3860, label %.if.false.3860
.if.true.3860:
%.tmp3861 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp3861
br label %.if.end.3860
.if.false.3860:
br label %.if.end.3860
.if.end.3860:
%.tmp3862 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3863 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3864 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_addr.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3862, %m286$.Node.type* %.tmp3863)
store %m1777$.AssignableInfo.type* %.tmp3864, %m1777$.AssignableInfo.type** %info
%.tmp3865 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3866 = icmp eq %m1777$.AssignableInfo.type* %.tmp3865, null
br i1 %.tmp3866, label %.if.true.3867, label %.if.false.3867
.if.true.3867:
%.tmp3868 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3868, label %.if.true.3869, label %.if.false.3869
.if.true.3869:
%.tmp3870 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3871 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3873 = getelementptr [35 x i8], [35 x i8]*@.str3872, i32 0, i32 0
%.tmp3874 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp3870, %m286$.Node.type* %.tmp3871, i8* %.tmp3873)
%.tmp3875 = call i32(i8*,...) @printf(i8* %.tmp3874)
br label %.if.end.3869
.if.false.3869:
br label %.if.end.3869
.if.end.3869:
%.tmp3876 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp3876
br label %.if.end.3867
.if.false.3867:
br label %.if.end.3867
.if.end.3867:
%.tmp3877 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3879 = getelementptr [8 x i8], [8 x i8]*@.str3878, i32 0, i32 0
%.tmp3880 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3877, i8* %.tmp3879)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3880, %m286$.Node.type** %args
%.tmp3882 = getelementptr [1 x i8], [1 x i8]*@.str3881, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3882, i8** %params_buff
%tmp = alloca i8*
store i8* null, i8** %tmp
%.tmp3883 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3884 = icmp ne %m286$.Node.type* %.tmp3883, null
br i1 %.tmp3884, label %.if.true.3885, label %.if.false.3885
.if.true.3885:
%.tmp3886 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3886, i32 0, i32 6
%.tmp3888 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3887
%.tmp3890 = getelementptr [11 x i8], [11 x i8]*@.str3889, i32 0, i32 0
%.tmp3891 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3888, i8* %.tmp3890)
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3891, %m286$.Node.type** %start
%.tmp3893 = load %m286$.Node.type*, %m286$.Node.type** %start
%pp = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3893, %m286$.Node.type** %pp
br label %.for.start.3892
.for.start.3892:
%.tmp3894 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3895 = icmp ne %m286$.Node.type* %.tmp3894, null
br i1 %.tmp3895, label %.for.continue.3892, label %.for.end.3892
.for.continue.3892:
%.tmp3896 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3897 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp3898 = icmp ne %m286$.Node.type* %.tmp3896, %.tmp3897
br i1 %.tmp3898, label %.if.true.3899, label %.if.false.3899
.if.true.3899:
%.tmp3900 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3902 = getelementptr [5 x i8], [5 x i8]*@.str3901, i32 0, i32 0
%.tmp3903 = load i8*, i8** %params_buff
%.tmp3904 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3900, i8* %.tmp3902, i8* %.tmp3903)
%.tmp3905 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3905, i8** %tmp_buff
%.tmp3906 = load i8*, i8** %tmp
store i8* %.tmp3906, i8** %params_buff
%.tmp3907 = load i8*, i8** %tmp_buff
store i8* %.tmp3907, i8** %tmp
%.tmp3908 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3908)
br label %.if.end.3899
.if.false.3899:
br label %.if.end.3899
.if.end.3899:
%.tmp3909 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3910 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3911 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp3909, %m286$.Node.type* %.tmp3910)
%a_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3911, %m1777$.AssignableInfo.type** %a_info
%.tmp3912 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp3913 = icmp eq %m1777$.AssignableInfo.type* %.tmp3912, null
br i1 %.tmp3913, label %.if.true.3914, label %.if.false.3914
.if.true.3914:
%.tmp3915 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp3915
br label %.if.end.3914
.if.false.3914:
br label %.if.end.3914
.if.end.3914:
%.tmp3916 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3918 = getelementptr [8 x i8], [8 x i8]*@.str3917, i32 0, i32 0
%.tmp3919 = load i8*, i8** %params_buff
%.tmp3920 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3921 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp3922 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3921, i32 0, i32 3
%.tmp3923 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3922
%.tmp3924 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3920, %m1777$.Type.type* %.tmp3923)
%.tmp3925 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp3926 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3925)
%.tmp3927 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3916, i8* %.tmp3918, i8* %.tmp3919, i8* %.tmp3924, i8* %.tmp3926)
%.tmp3928 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3929 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3928, i32 0, i32 7
%.tmp3930 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3929
store %m286$.Node.type* %.tmp3930, %m286$.Node.type** %pp
%.tmp3931 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3933 = getelementptr [11 x i8], [11 x i8]*@.str3932, i32 0, i32 0
%.tmp3934 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3931, i8* %.tmp3933)
store %m286$.Node.type* %.tmp3934, %m286$.Node.type** %pp
br label %.for.start.3892
.for.end.3892:
br label %.if.end.3885
.if.false.3885:
br label %.if.end.3885
.if.end.3885:
%.tmp3935 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3936 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3937 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3936, i32 0, i32 3
%.tmp3938 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3937
%.tmp3939 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3938, i32 0, i32 3
%.tmp3940 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3939
%.tmp3941 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3935, %m1777$.Type.type* %.tmp3940)
%.tmp3943 = getelementptr [5 x i8], [5 x i8]*@.str3942, i32 0, i32 0
%.tmp3944 = call i32(i8*,i8*) @strcmp(i8* %.tmp3941, i8* %.tmp3943)
%.tmp3945 = icmp eq i32 %.tmp3944, 0
br i1 %.tmp3945, label %.if.true.3946, label %.if.false.3946
.if.true.3946:
%.tmp3947 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3948 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3947, i32 0, i32 1
%.tmp3949 = load %m0$.File.type*, %m0$.File.type** %.tmp3948
%.tmp3951 = getelementptr [16 x i8], [16 x i8]*@.str3950, i32 0, i32 0
%.tmp3952 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3953 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3954 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3953, i32 0, i32 3
%.tmp3955 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3954
%.tmp3956 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3952, %m1777$.Type.type* %.tmp3955)
%.tmp3957 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3958 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3957)
%.tmp3959 = load i8*, i8** %params_buff
%.tmp3960 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3949, i8* %.tmp3951, i8* %.tmp3956, i8* %.tmp3958, i8* %.tmp3959)
%.tmp3961 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp3961
br label %.if.end.3946
.if.false.3946:
br label %.if.end.3946
.if.end.3946:
%.tmp3962 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3963 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3962)
%call_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3963, %m1777$.AssignableInfo.type** %call_info
%.tmp3964 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3965 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %call_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp3964, %m1777$.AssignableInfo.type* %.tmp3965)
%.tmp3966 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %call_info
%.tmp3967 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3966, i32 0, i32 3
%.tmp3968 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3969 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3968, i32 0, i32 3
%.tmp3970 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3969
%.tmp3971 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3970, i32 0, i32 3
%.tmp3972 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3971
%.tmp3973 = call %m1777$.Type.type*(%m1777$.Type.type*) @m1777$type_clone.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp3972)
store %m1777$.Type.type* %.tmp3973, %m1777$.Type.type** %.tmp3967
%.tmp3974 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %call_info
%.tmp3975 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3974, i32 0, i32 3
%.tmp3976 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3975
%.tmp3977 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp3976, i32 0, i32 4
store %m1777$.Type.type* null, %m1777$.Type.type** %.tmp3977
%.tmp3978 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3979 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp3978, i32 0, i32 1
%.tmp3980 = load %m0$.File.type*, %m0$.File.type** %.tmp3979
%.tmp3982 = getelementptr [21 x i8], [21 x i8]*@.str3981, i32 0, i32 0
%.tmp3983 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %call_info
%.tmp3984 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3983)
%.tmp3985 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp3986 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3987 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp3986, i32 0, i32 3
%.tmp3988 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp3987
%.tmp3989 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp3985, %m1777$.Type.type* %.tmp3988)
%.tmp3990 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp3991 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp3990)
%.tmp3992 = load i8*, i8** %params_buff
%.tmp3993 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3980, i8* %.tmp3982, i8* %.tmp3984, i8* %.tmp3989, i8* %.tmp3991, i8* %.tmp3992)
%.tmp3994 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %call_info
%.tmp3995 = bitcast %m1777$.AssignableInfo.type* %.tmp3994 to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp3995
}
define void @m1777$compile_expression.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp3996 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3997 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3996, i32 0, i32 0
%.tmp3998 = load i8*, i8** %.tmp3997
%expr_type = alloca i8*
store i8* %.tmp3998, i8** %expr_type
%.tmp3999 = bitcast ptr null to %m1777$.AssignableInfo.type*
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp3999, %m1777$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %assignable
%.tmp4000 = bitcast ptr null to %m1777$.AssignableInfo.type*
%a_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp4000, %m1777$.AssignableInfo.type** %a_info
%.tmp4001 = load i8*, i8** %expr_type
%.tmp4003 = getelementptr [7 x i8], [7 x i8]*@.str4002, i32 0, i32 0
%.tmp4004 = call i32(i8*,i8*) @strcmp(i8* %.tmp4001, i8* %.tmp4003)
%.tmp4005 = icmp eq i32 %.tmp4004, 0
br i1 %.tmp4005, label %.if.true.4006, label %.if.false.4006
.if.true.4006:
%.tmp4007 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4008 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4007, i32 0, i32 6
%.tmp4009 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4008
%.tmp4010 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4009, i32 0, i32 7
%.tmp4011 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4010
%.tmp4012 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4011, i32 0, i32 0
%.tmp4013 = load i8*, i8** %.tmp4012
%.tmp4015 = getelementptr [3 x i8], [3 x i8]*@.str4014, i32 0, i32 0
%.tmp4016 = call i32(i8*,i8*) @strcmp(i8* %.tmp4013, i8* %.tmp4015)
%.tmp4017 = icmp ne i32 %.tmp4016, 0
br i1 %.tmp4017, label %.if.true.4018, label %.if.false.4018
.if.true.4018:
%.tmp4019 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4020 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4021 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4020, i32 0, i32 6
%.tmp4022 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4021
%.tmp4023 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4022, i32 0, i32 7
%.tmp4024 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4023
%.tmp4025 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4019, %m286$.Node.type* %.tmp4024)
store %m1777$.AssignableInfo.type* %.tmp4025, %m1777$.AssignableInfo.type** %info
%.tmp4026 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4027 = icmp eq %m1777$.AssignableInfo.type* %.tmp4026, null
br i1 %.tmp4027, label %.if.true.4028, label %.if.false.4028
.if.true.4028:
ret void
br label %.if.end.4028
.if.false.4028:
br label %.if.end.4028
.if.end.4028:
%.tmp4029 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4030 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4029, i32 0, i32 1
%.tmp4031 = load %m0$.File.type*, %m0$.File.type** %.tmp4030
%.tmp4033 = getelementptr [11 x i8], [11 x i8]*@.str4032, i32 0, i32 0
%.tmp4034 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4035 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4036 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4035, i32 0, i32 3
%.tmp4037 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4036
%.tmp4038 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4034, %m1777$.Type.type* %.tmp4037)
%.tmp4039 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4040 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4039)
%.tmp4041 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4031, i8* %.tmp4033, i8* %.tmp4038, i8* %.tmp4040)
br label %.if.end.4018
.if.false.4018:
%.tmp4042 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4043 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4042, i32 0, i32 1
%.tmp4044 = load %m0$.File.type*, %m0$.File.type** %.tmp4043
%.tmp4046 = getelementptr [10 x i8], [10 x i8]*@.str4045, i32 0, i32 0
%.tmp4047 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4044, i8* %.tmp4046)
br label %.if.end.4018
.if.end.4018:
br label %.if.end.4006
.if.false.4006:
%.tmp4048 = load i8*, i8** %expr_type
%.tmp4050 = getelementptr [3 x i8], [3 x i8]*@.str4049, i32 0, i32 0
%.tmp4051 = call i32(i8*,i8*) @strcmp(i8* %.tmp4048, i8* %.tmp4050)
%.tmp4052 = icmp eq i32 %.tmp4051, 0
br i1 %.tmp4052, label %.if.true.4053, label %.if.false.4053
.if.true.4053:
br label %.if.end.4053
.if.false.4053:
%.tmp4054 = load i8*, i8** %expr_type
%.tmp4056 = getelementptr [8 x i8], [8 x i8]*@.str4055, i32 0, i32 0
%.tmp4057 = call i32(i8*,i8*) @strcmp(i8* %.tmp4054, i8* %.tmp4056)
%.tmp4058 = icmp eq i32 %.tmp4057, 0
br i1 %.tmp4058, label %.if.true.4059, label %.if.false.4059
.if.true.4059:
%.tmp4060 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4061 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4062 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4061, i32 0, i32 6
%.tmp4063 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4062
%.tmp4064 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_fn_call.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4060, %m286$.Node.type* %.tmp4063)
br label %.if.end.4059
.if.false.4059:
%.tmp4065 = load i8*, i8** %expr_type
%.tmp4067 = getelementptr [12 x i8], [12 x i8]*@.str4066, i32 0, i32 0
%.tmp4068 = call i32(i8*,i8*) @strcmp(i8* %.tmp4065, i8* %.tmp4067)
%.tmp4069 = icmp eq i32 %.tmp4068, 0
br i1 %.tmp4069, label %.if.true.4070, label %.if.false.4070
.if.true.4070:
%.tmp4071 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4072 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4073 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_declaration.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4071, %m286$.Node.type* %.tmp4072)
br label %.if.end.4070
.if.false.4070:
%.tmp4074 = load i8*, i8** %expr_type
%.tmp4076 = getelementptr [11 x i8], [11 x i8]*@.str4075, i32 0, i32 0
%.tmp4077 = call i32(i8*,i8*) @strcmp(i8* %.tmp4074, i8* %.tmp4076)
%.tmp4078 = icmp eq i32 %.tmp4077, 0
br i1 %.tmp4078, label %.if.true.4079, label %.if.false.4079
.if.true.4079:
%.tmp4080 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4081 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4080, i32 0, i32 6
%.tmp4082 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4081
%.tmp4084 = getelementptr [11 x i8], [11 x i8]*@.str4083, i32 0, i32 0
%.tmp4085 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4082, i8* %.tmp4084)
store %m286$.Node.type* %.tmp4085, %m286$.Node.type** %assignable
%.tmp4086 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4087 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4088 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4087, i32 0, i32 6
%.tmp4089 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4088
%.tmp4090 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_addr.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4086, %m286$.Node.type* %.tmp4089)
%dest = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp4090, %m1777$.AssignableInfo.type** %dest
%.tmp4091 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %dest
%.tmp4092 = icmp eq %m1777$.AssignableInfo.type* %.tmp4091, null
br i1 %.tmp4092, label %.if.true.4093, label %.if.false.4093
.if.true.4093:
ret void
br label %.if.end.4093
.if.false.4093:
br label %.if.end.4093
.if.end.4093:
%.tmp4094 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4095 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4096 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4094, %m286$.Node.type* %.tmp4095)
store %m1777$.AssignableInfo.type* %.tmp4096, %m1777$.AssignableInfo.type** %a_info
%.tmp4097 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4098 = icmp eq %m1777$.AssignableInfo.type* %.tmp4097, null
br i1 %.tmp4098, label %.if.true.4099, label %.if.false.4099
.if.true.4099:
ret void
br label %.if.end.4099
.if.false.4099:
br label %.if.end.4099
.if.end.4099:
%.tmp4100 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4101 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %dest
%.tmp4102 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4101, i32 0, i32 3
%.tmp4103 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4102
%.tmp4104 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4100, %m1777$.Type.type* %.tmp4103)
%dest_tr = alloca i8*
store i8* %.tmp4104, i8** %dest_tr
%.tmp4105 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4106 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4107 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4106, i32 0, i32 3
%.tmp4108 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4107
%.tmp4109 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4105, %m1777$.Type.type* %.tmp4108)
%src_tr = alloca i8*
store i8* %.tmp4109, i8** %src_tr
%.tmp4110 = load i8*, i8** %src_tr
%.tmp4112 = getelementptr [4 x i8], [4 x i8]*@.str4111, i32 0, i32 0
%.tmp4113 = call i32(i8*,i8*) @strcmp(i8* %.tmp4110, i8* %.tmp4112)
%.tmp4114 = icmp eq i32 %.tmp4113, 0
br i1 %.tmp4114, label %.if.true.4115, label %.if.false.4115
.if.true.4115:
%.tmp4116 = load i8*, i8** %dest_tr
store i8* %.tmp4116, i8** %src_tr
br label %.if.end.4115
.if.false.4115:
br label %.if.end.4115
.if.end.4115:
%.tmp4117 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4118 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4117, i32 0, i32 1
%.tmp4119 = load %m0$.File.type*, %m0$.File.type** %.tmp4118
%.tmp4121 = getelementptr [21 x i8], [21 x i8]*@.str4120, i32 0, i32 0
%.tmp4122 = load i8*, i8** %src_tr
%.tmp4123 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4124 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4123)
%.tmp4125 = load i8*, i8** %dest_tr
%.tmp4126 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %dest
%.tmp4127 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4126)
%.tmp4128 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4119, i8* %.tmp4121, i8* %.tmp4122, i8* %.tmp4124, i8* %.tmp4125, i8* %.tmp4127)
br label %.if.end.4079
.if.false.4079:
%.tmp4129 = load i8*, i8** %expr_type
%.tmp4131 = getelementptr [9 x i8], [9 x i8]*@.str4130, i32 0, i32 0
%.tmp4132 = call i32(i8*,i8*) @strcmp(i8* %.tmp4129, i8* %.tmp4131)
%.tmp4133 = icmp eq i32 %.tmp4132, 0
br i1 %.tmp4133, label %.if.true.4134, label %.if.false.4134
.if.true.4134:
%.tmp4135 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4136 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_if_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4135, %m286$.Node.type* %.tmp4136)
br label %.if.end.4134
.if.false.4134:
%.tmp4137 = load i8*, i8** %expr_type
%.tmp4139 = getelementptr [9 x i8], [9 x i8]*@.str4138, i32 0, i32 0
%.tmp4140 = call i32(i8*,i8*) @strcmp(i8* %.tmp4137, i8* %.tmp4139)
%.tmp4141 = icmp eq i32 %.tmp4140, 0
br i1 %.tmp4141, label %.if.true.4142, label %.if.false.4142
.if.true.4142:
%.tmp4143 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4144 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_for_loop.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4143, %m286$.Node.type* %.tmp4144)
br label %.if.end.4142
.if.false.4142:
%.tmp4145 = load i8*, i8** %expr_type
%.tmp4147 = getelementptr [8 x i8], [8 x i8]*@.str4146, i32 0, i32 0
%.tmp4148 = call i32(i8*,i8*) @strcmp(i8* %.tmp4145, i8* %.tmp4147)
%.tmp4149 = icmp eq i32 %.tmp4148, 0
br i1 %.tmp4149, label %.if.true.4150, label %.if.false.4150
.if.true.4150:
%.tmp4151 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4152 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*) @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4151)
%mod = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp4152, %m1777$.ModuleLookup.type** %mod
%found = alloca i1
store i1 0, i1* %found
%.tmp4153 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp4154 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp4153, i32 0, i32 3
%.tmp4155 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4154
%s = alloca %m1777$.Scope.type*
store %m1777$.Scope.type* %.tmp4155, %m1777$.Scope.type** %s
%.tmp4156 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4157 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4156, i32 0, i32 6
%.tmp4158 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4157
%.tmp4159 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4158, i32 0, i32 1
%.tmp4160 = load i8*, i8** %.tmp4159
%.tmp4162 = getelementptr [6 x i8], [6 x i8]*@.str4161, i32 0, i32 0
%.tmp4163 = call i32(i8*,i8*) @strcmp(i8* %.tmp4160, i8* %.tmp4162)
%.tmp4164 = icmp eq i32 %.tmp4163, 0
br i1 %.tmp4164, label %.if.true.4165, label %.if.false.4165
.if.true.4165:
br label %.for.start.4166
.for.start.4166:
%.tmp4167 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4168 = icmp ne %m1777$.Scope.type* %.tmp4167, null
%.tmp4169 = load i1, i1* %found
%.tmp4170 = icmp eq i1 %.tmp4169, 0
%.tmp4171 = and i1 %.tmp4168, %.tmp4170
br i1 %.tmp4171, label %.for.continue.4166, label %.for.end.4166
.for.continue.4166:
%.tmp4172 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4173 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4172, i32 0, i32 2
%.tmp4174 = load i8*, i8** %.tmp4173
%.tmp4176 = getelementptr [4 x i8], [4 x i8]*@.str4175, i32 0, i32 0
%.tmp4177 = call i32(i8*,i8*) @strcmp(i8* %.tmp4174, i8* %.tmp4176)
%.tmp4178 = icmp eq i32 %.tmp4177, 0
br i1 %.tmp4178, label %.if.true.4179, label %.if.false.4179
.if.true.4179:
store i1 1, i1* %found
%.tmp4180 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4181 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4180, i32 0, i32 1
%.tmp4182 = load %m0$.File.type*, %m0$.File.type** %.tmp4181
%.tmp4184 = getelementptr [15 x i8], [15 x i8]*@.str4183, i32 0, i32 0
%.tmp4185 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4186 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4185, i32 0, i32 4
%.tmp4187 = load i8*, i8** %.tmp4186
%.tmp4188 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4182, i8* %.tmp4184, i8* %.tmp4187)
br label %.if.end.4179
.if.false.4179:
br label %.if.end.4179
.if.end.4179:
%.tmp4189 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4190 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4189, i32 0, i32 5
%.tmp4191 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4190
store %m1777$.Scope.type* %.tmp4191, %m1777$.Scope.type** %s
br label %.for.start.4166
.for.end.4166:
%.tmp4192 = load i1, i1* %found
%.tmp4193 = icmp eq i1 %.tmp4192, 0
br i1 %.tmp4193, label %.if.true.4194, label %.if.false.4194
.if.true.4194:
%.tmp4195 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4196 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4198 = getelementptr [48 x i8], [48 x i8]*@.str4197, i32 0, i32 0
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4195, %m286$.Node.type* %.tmp4196, i8* %.tmp4198)
br label %.if.end.4194
.if.false.4194:
br label %.if.end.4194
.if.end.4194:
br label %.if.end.4165
.if.false.4165:
%.tmp4199 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4200 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4199, i32 0, i32 6
%.tmp4201 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4200
%.tmp4202 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4201, i32 0, i32 1
%.tmp4203 = load i8*, i8** %.tmp4202
%.tmp4205 = getelementptr [9 x i8], [9 x i8]*@.str4204, i32 0, i32 0
%.tmp4206 = call i32(i8*,i8*) @strcmp(i8* %.tmp4203, i8* %.tmp4205)
%.tmp4207 = icmp eq i32 %.tmp4206, 0
br i1 %.tmp4207, label %.if.true.4208, label %.if.false.4208
.if.true.4208:
br label %.for.start.4209
.for.start.4209:
%.tmp4210 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4211 = icmp ne %m1777$.Scope.type* %.tmp4210, null
%.tmp4212 = load i1, i1* %found
%.tmp4213 = icmp eq i1 %.tmp4212, 0
%.tmp4214 = and i1 %.tmp4211, %.tmp4213
br i1 %.tmp4214, label %.for.continue.4209, label %.for.end.4209
.for.continue.4209:
%.tmp4215 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4216 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4215, i32 0, i32 2
%.tmp4217 = load i8*, i8** %.tmp4216
%.tmp4219 = getelementptr [4 x i8], [4 x i8]*@.str4218, i32 0, i32 0
%.tmp4220 = call i32(i8*,i8*) @strcmp(i8* %.tmp4217, i8* %.tmp4219)
%.tmp4221 = icmp eq i32 %.tmp4220, 0
br i1 %.tmp4221, label %.if.true.4222, label %.if.false.4222
.if.true.4222:
store i1 1, i1* %found
%.tmp4223 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4224 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4223, i32 0, i32 1
%.tmp4225 = load %m0$.File.type*, %m0$.File.type** %.tmp4224
%.tmp4227 = getelementptr [15 x i8], [15 x i8]*@.str4226, i32 0, i32 0
%.tmp4228 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4229 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4228, i32 0, i32 3
%.tmp4230 = load i8*, i8** %.tmp4229
%.tmp4231 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4225, i8* %.tmp4227, i8* %.tmp4230)
br label %.if.end.4222
.if.false.4222:
br label %.if.end.4222
.if.end.4222:
%.tmp4232 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4233 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4232, i32 0, i32 5
%.tmp4234 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4233
store %m1777$.Scope.type* %.tmp4234, %m1777$.Scope.type** %s
br label %.for.start.4209
.for.end.4209:
%.tmp4235 = load i1, i1* %found
%.tmp4236 = icmp eq i1 %.tmp4235, 0
br i1 %.tmp4236, label %.if.true.4237, label %.if.false.4237
.if.true.4237:
%.tmp4238 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4239 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4241 = getelementptr [48 x i8], [48 x i8]*@.str4240, i32 0, i32 0
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4238, %m286$.Node.type* %.tmp4239, i8* %.tmp4241)
br label %.if.end.4237
.if.false.4237:
br label %.if.end.4237
.if.end.4237:
br label %.if.end.4208
.if.false.4208:
%.tmp4242 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4243 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4245 = getelementptr [29 x i8], [29 x i8]*@.str4244, i32 0, i32 0
%.tmp4246 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4242, %m286$.Node.type* %.tmp4243, i8* %.tmp4245)
%.tmp4247 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4248 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4247, i32 0, i32 6
%.tmp4249 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4248
%.tmp4250 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4249, i32 0, i32 1
%.tmp4251 = load i8*, i8** %.tmp4250
%.tmp4252 = call i32(i8*,...) @printf(i8* %.tmp4246, i8* %.tmp4251)
br label %.if.end.4208
.if.end.4208:
br label %.if.end.4165
.if.end.4165:
br label %.if.end.4150
.if.false.4150:
%.tmp4253 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4254 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4256 = getelementptr [34 x i8], [34 x i8]*@.str4255, i32 0, i32 0
%.tmp4257 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4253, %m286$.Node.type* %.tmp4254, i8* %.tmp4256)
%.tmp4258 = load i8*, i8** %expr_type
%.tmp4259 = call i32(i8*,...) @printf(i8* %.tmp4257, i8* %.tmp4258)
br label %.if.end.4150
.if.end.4150:
br label %.if.end.4142
.if.end.4142:
br label %.if.end.4134
.if.end.4134:
br label %.if.end.4079
.if.end.4079:
br label %.if.end.4070
.if.end.4070:
br label %.if.end.4059
.if.end.4059:
br label %.if.end.4053
.if.end.4053:
br label %.if.end.4006
.if.end.4006:
ret void
}
define void @m1777$compile_for_loop.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4260 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4261 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4260)
%for_id = alloca i32
store i32 %.tmp4261, i32* %for_id
%.tmp4262 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4263 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4262, i32 0, i32 6
%.tmp4264 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4263
%.tmp4265 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4264, i32 0, i32 7
%.tmp4266 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4265
%init_stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4266, %m286$.Node.type** %init_stmt
%.tmp4267 = bitcast ptr null to i8*
%begin_lbl = alloca i8*
store i8* %.tmp4267, i8** %begin_lbl
%.tmp4268 = bitcast ptr null to i8*
%end_lbl = alloca i8*
store i8* %.tmp4268, i8** %end_lbl
%.tmp4269 = getelementptr i8*, i8** %begin_lbl, i32 0
%.tmp4271 = getelementptr [14 x i8], [14 x i8]*@.str4270, i32 0, i32 0
%.tmp4272 = load i32, i32* %for_id
%.tmp4273 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4269, i8* %.tmp4271, i32 %.tmp4272)
%.tmp4274 = getelementptr i8*, i8** %end_lbl, i32 0
%.tmp4276 = getelementptr [12 x i8], [12 x i8]*@.str4275, i32 0, i32 0
%.tmp4277 = load i32, i32* %for_id
%.tmp4278 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4274, i8* %.tmp4276, i32 %.tmp4277)
%.tmp4279 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4281 = getelementptr [4 x i8], [4 x i8]*@.str4280, i32 0, i32 0
%.tmp4282 = load i8*, i8** %begin_lbl
%.tmp4283 = load i8*, i8** %end_lbl
call void(%m1777$.CompilerCtx.type*,i8*,i8*,i8*) @m1777$push_scope.v.m1777$.CompilerCtx.typep.cp.cp.cp(%m1777$.CompilerCtx.type* %.tmp4279, i8* %.tmp4281, i8* %.tmp4282, i8* %.tmp4283)
%.tmp4284 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4285 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4284, i32 0, i32 0
%.tmp4286 = load i8*, i8** %.tmp4285
%.tmp4288 = getelementptr [12 x i8], [12 x i8]*@.str4287, i32 0, i32 0
%.tmp4289 = call i32(i8*,i8*) @strcmp(i8* %.tmp4286, i8* %.tmp4288)
%.tmp4290 = icmp eq i32 %.tmp4289, 0
br i1 %.tmp4290, label %.if.true.4291, label %.if.false.4291
.if.true.4291:
%.tmp4292 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4293 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4294 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_declaration.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4292, %m286$.Node.type* %.tmp4293)
br label %.if.end.4291
.if.false.4291:
%.tmp4295 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4296 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4295, i32 0, i32 0
%.tmp4297 = load i8*, i8** %.tmp4296
%.tmp4299 = getelementptr [11 x i8], [11 x i8]*@.str4298, i32 0, i32 0
%.tmp4300 = call i32(i8*,i8*) @strcmp(i8* %.tmp4297, i8* %.tmp4299)
%.tmp4301 = icmp eq i32 %.tmp4300, 0
br i1 %.tmp4301, label %.if.true.4302, label %.if.false.4302
.if.true.4302:
%.tmp4303 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4304 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_expression.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4303, %m286$.Node.type* %.tmp4304)
br label %.if.end.4302
.if.false.4302:
%.tmp4305 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4306 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4305, i32 0, i32 0
%.tmp4307 = load i8*, i8** %.tmp4306
%.tmp4309 = getelementptr [9 x i8], [9 x i8]*@.str4308, i32 0, i32 0
%.tmp4310 = call i32(i8*,i8*) @strcmp(i8* %.tmp4307, i8* %.tmp4309)
%.tmp4311 = icmp eq i32 %.tmp4310, 0
br i1 %.tmp4311, label %.if.true.4312, label %.if.false.4312
.if.true.4312:
br label %.if.end.4312
.if.false.4312:
%.tmp4313 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4314 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4316 = getelementptr [66 x i8], [66 x i8]*@.str4315, i32 0, i32 0
%.tmp4317 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4313, %m286$.Node.type* %.tmp4314, i8* %.tmp4316)
%.tmp4318 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4319 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4318, i32 0, i32 0
%.tmp4320 = load i8*, i8** %.tmp4319
%.tmp4321 = call i32(i8*,...) @printf(i8* %.tmp4317, i8* %.tmp4320)
%.tmp4322 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
call void(%m1777$.CompilerCtx.type*) @m1777$pop_scope.v.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4322)
ret void
br label %.if.end.4312
.if.end.4312:
br label %.if.end.4302
.if.end.4302:
br label %.if.end.4291
.if.end.4291:
%.tmp4323 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4324 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4323, i32 0, i32 1
%.tmp4325 = load %m0$.File.type*, %m0$.File.type** %.tmp4324
%.tmp4327 = getelementptr [26 x i8], [26 x i8]*@.str4326, i32 0, i32 0
%.tmp4328 = load i32, i32* %for_id
%.tmp4329 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4325, i8* %.tmp4327, i32 %.tmp4328)
%.tmp4330 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4331 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4330, i32 0, i32 1
%.tmp4332 = load %m0$.File.type*, %m0$.File.type** %.tmp4331
%.tmp4334 = getelementptr [16 x i8], [16 x i8]*@.str4333, i32 0, i32 0
%.tmp4335 = load i32, i32* %for_id
%.tmp4336 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4332, i8* %.tmp4334, i32 %.tmp4335)
%.tmp4337 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4338 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4337, i32 0, i32 6
%.tmp4339 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4338
%.tmp4341 = getelementptr [9 x i8], [9 x i8]*@.str4340, i32 0, i32 0
%.tmp4342 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4339, i8* %.tmp4341)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4342, %m286$.Node.type** %fst_colon
%.tmp4343 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4344 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4343, i32 0, i32 7
%.tmp4345 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4344
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4345, %m286$.Node.type** %condition
%.tmp4346 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4347 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4346, i32 0, i32 0
%.tmp4348 = load i8*, i8** %.tmp4347
%.tmp4350 = getelementptr [9 x i8], [9 x i8]*@.str4349, i32 0, i32 0
%.tmp4351 = call i32(i8*,i8*) @strcmp(i8* %.tmp4348, i8* %.tmp4350)
%.tmp4352 = icmp eq i32 %.tmp4351, 0
br i1 %.tmp4352, label %.if.true.4353, label %.if.false.4353
.if.true.4353:
%.tmp4354 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4355 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4357 = getelementptr [39 x i8], [39 x i8]*@.str4356, i32 0, i32 0
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4354, %m286$.Node.type* %.tmp4355, i8* %.tmp4357)
ret void
br label %.if.end.4353
.if.false.4353:
br label %.if.end.4353
.if.end.4353:
%.tmp4358 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4359 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4360 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4358, %m286$.Node.type* %.tmp4359)
%condition_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp4360, %m1777$.AssignableInfo.type** %condition_info
%.tmp4361 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4362 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4361, i32 0, i32 1
%.tmp4363 = load %m0$.File.type*, %m0$.File.type** %.tmp4362
%.tmp4365 = getelementptr [48 x i8], [48 x i8]*@.str4364, i32 0, i32 0
%.tmp4366 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4367 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %condition_info
%.tmp4368 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4367, i32 0, i32 3
%.tmp4369 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4368
%.tmp4370 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4366, %m1777$.Type.type* %.tmp4369)
%.tmp4371 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %condition_info
%.tmp4372 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4371)
%.tmp4373 = load i32, i32* %for_id
%.tmp4374 = load i8*, i8** %end_lbl
%.tmp4375 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4363, i8* %.tmp4365, i8* %.tmp4370, i8* %.tmp4372, i32 %.tmp4373, i8* %.tmp4374)
%.tmp4376 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4377 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4376, i32 0, i32 1
%.tmp4378 = load %m0$.File.type*, %m0$.File.type** %.tmp4377
%.tmp4380 = getelementptr [19 x i8], [19 x i8]*@.str4379, i32 0, i32 0
%.tmp4381 = load i32, i32* %for_id
%.tmp4382 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4378, i8* %.tmp4380, i32 %.tmp4381)
%.tmp4383 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4383, i32 0, i32 7
%.tmp4385 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4384
%.tmp4387 = getelementptr [9 x i8], [9 x i8]*@.str4386, i32 0, i32 0
%.tmp4388 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4385, i8* %.tmp4387)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4388, %m286$.Node.type** %snd_colon
%.tmp4389 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4390 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4389, i32 0, i32 7
%.tmp4391 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4390
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4391, %m286$.Node.type** %increment
%.tmp4392 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4394 = getelementptr [6 x i8], [6 x i8]*@.str4393, i32 0, i32 0
%.tmp4395 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4392, i8* %.tmp4394)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4395, %m286$.Node.type** %for_body
%.tmp4396 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4397 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4396, %m286$.Node.type* %.tmp4397)
%.tmp4398 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4399 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4400 = icmp ne %m286$.Node.type* %.tmp4398, %.tmp4399
br i1 %.tmp4400, label %.if.true.4401, label %.if.false.4401
.if.true.4401:
%.tmp4402 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4403 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_expression.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4402, %m286$.Node.type* %.tmp4403)
br label %.if.end.4401
.if.false.4401:
br label %.if.end.4401
.if.end.4401:
%.tmp4404 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4405 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4404, i32 0, i32 1
%.tmp4406 = load %m0$.File.type*, %m0$.File.type** %.tmp4405
%.tmp4408 = getelementptr [15 x i8], [15 x i8]*@.str4407, i32 0, i32 0
%.tmp4409 = load i8*, i8** %begin_lbl
%.tmp4410 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4406, i8* %.tmp4408, i8* %.tmp4409)
%.tmp4411 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4412 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4411, i32 0, i32 1
%.tmp4413 = load %m0$.File.type*, %m0$.File.type** %.tmp4412
%.tmp4415 = getelementptr [5 x i8], [5 x i8]*@.str4414, i32 0, i32 0
%.tmp4416 = load i8*, i8** %end_lbl
%.tmp4417 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4413, i8* %.tmp4415, i8* %.tmp4416)
%.tmp4418 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
call void(%m1777$.CompilerCtx.type*) @m1777$pop_scope.v.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4418)
ret void
}
define %m1777$.AssignableInfo.type* @m1777$compile_declaration.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4419 = bitcast ptr null to %m1777$.Type.type*
%decl_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp4419, %m1777$.Type.type** %decl_type
%.tmp4420 = bitcast ptr null to %m1777$.AssignableInfo.type*
%a_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp4420, %m1777$.AssignableInfo.type** %a_info
%.tmp4421 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4422 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4421, i32 0, i32 6
%.tmp4423 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4422
%.tmp4424 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4423, i32 0, i32 0
%.tmp4425 = load i8*, i8** %.tmp4424
%.tmp4427 = getelementptr [5 x i8], [5 x i8]*@.str4426, i32 0, i32 0
%.tmp4428 = call i32(i8*,i8*) @strcmp(i8* %.tmp4425, i8* %.tmp4427)
%.tmp4429 = icmp eq i32 %.tmp4428, 0
br i1 %.tmp4429, label %.if.true.4430, label %.if.false.4430
.if.true.4430:
%.tmp4431 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4432 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4433 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4432, i32 0, i32 6
%.tmp4434 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4433
%.tmp4435 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4434, i32 0, i32 6
%.tmp4436 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4435
%.tmp4437 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4431, %m286$.Node.type* %.tmp4436)
store %m1777$.Type.type* %.tmp4437, %m1777$.Type.type** %decl_type
br label %.if.end.4430
.if.false.4430:
br label %.if.end.4430
.if.end.4430:
%.tmp4438 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4439 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4438, i32 0, i32 6
%.tmp4440 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4439
%.tmp4442 = getelementptr [11 x i8], [11 x i8]*@.str4441, i32 0, i32 0
%.tmp4443 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4440, i8* %.tmp4442)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4443, %m286$.Node.type** %assignable
%.tmp4444 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4445 = icmp ne %m286$.Node.type* %.tmp4444, null
br i1 %.tmp4445, label %.if.true.4446, label %.if.false.4446
.if.true.4446:
%.tmp4447 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4448 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4449 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4447, %m286$.Node.type* %.tmp4448)
store %m1777$.AssignableInfo.type* %.tmp4449, %m1777$.AssignableInfo.type** %a_info
br label %.if.end.4446
.if.false.4446:
br label %.if.end.4446
.if.end.4446:
%.tmp4450 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4451 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4450)
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp4451, %m1777$.AssignableInfo.type** %info
%.tmp4452 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4453 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4452, i32 0, i32 2
%.tmp4455 = getelementptr [9 x i8], [9 x i8]*@.str4454, i32 0, i32 0
store i8* %.tmp4455, i8** %.tmp4453
%.tmp4456 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4457 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4456, i32 0, i32 6
%.tmp4458 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4457
%.tmp4460 = getelementptr [5 x i8], [5 x i8]*@.str4459, i32 0, i32 0
%.tmp4461 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4458, i8* %.tmp4460)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4461, %m286$.Node.type** %var_name
%.tmp4462 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4463 = icmp eq %m286$.Node.type* %.tmp4462, null
br i1 %.tmp4463, label %.if.true.4464, label %.if.false.4464
.if.true.4464:
%.tmp4465 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4466 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4468 = getelementptr [31 x i8], [31 x i8]*@.str4467, i32 0, i32 0
%.tmp4469 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4465, %m286$.Node.type* %.tmp4466, i8* %.tmp4468)
%.tmp4470 = call i32(i8*,...) @printf(i8* %.tmp4469)
%.tmp4471 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp4471
br label %.if.end.4464
.if.false.4464:
br label %.if.end.4464
.if.end.4464:
%var_id = alloca i8*
store i8* null, i8** %var_id
%.tmp4472 = getelementptr i8*, i8** %var_id, i32 0
%.tmp4474 = getelementptr [6 x i8], [6 x i8]*@.str4473, i32 0, i32 0
%.tmp4475 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4476 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4475, i32 0, i32 1
%.tmp4477 = load i8*, i8** %.tmp4476
%.tmp4478 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4479 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4478)
%.tmp4480 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4472, i8* %.tmp4474, i8* %.tmp4477, i32 %.tmp4479)
%.tmp4481 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4482 = load i8, i8* @SCOPE_LOCAL
%.tmp4483 = load i8*, i8** %var_id
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp4481, i8 %.tmp4482, i8* %.tmp4483)
%.tmp4484 = load %m1777$.Type.type*, %m1777$.Type.type** %decl_type
%.tmp4485 = icmp ne %m1777$.Type.type* %.tmp4484, null
br i1 %.tmp4485, label %.if.true.4486, label %.if.false.4486
.if.true.4486:
%.tmp4487 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4488 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4487, i32 0, i32 3
%.tmp4489 = load %m1777$.Type.type*, %m1777$.Type.type** %decl_type
store %m1777$.Type.type* %.tmp4489, %m1777$.Type.type** %.tmp4488
br label %.if.end.4486
.if.false.4486:
%.tmp4490 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4491 = icmp ne %m1777$.AssignableInfo.type* %.tmp4490, null
br i1 %.tmp4491, label %.if.true.4492, label %.if.false.4492
.if.true.4492:
%.tmp4493 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4494 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4493, i32 0, i32 3
%.tmp4495 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4496 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4495, i32 0, i32 3
%.tmp4497 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4496
store %m1777$.Type.type* %.tmp4497, %m1777$.Type.type** %.tmp4494
br label %.if.end.4492
.if.false.4492:
br label %.if.end.4492
.if.end.4492:
br label %.if.end.4486
.if.end.4486:
%.tmp4498 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4499 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4500 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4499, i32 0, i32 3
%.tmp4501 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4500
%.tmp4502 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4498, %m1777$.Type.type* %.tmp4501)
%var_type_repr = alloca i8*
store i8* %.tmp4502, i8** %var_type_repr
%.tmp4503 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4504 = icmp ne %m1777$.AssignableInfo.type* %.tmp4503, null
br i1 %.tmp4504, label %.if.true.4505, label %.if.false.4505
.if.true.4505:
%.tmp4506 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4507 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4508 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4507, i32 0, i32 3
%.tmp4509 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4508
%.tmp4510 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4506, %m1777$.Type.type* %.tmp4509)
%a_type_repr = alloca i8*
store i8* %.tmp4510, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4511 = load i8*, i8** %a_type_repr
%.tmp4512 = call i32(i8*) @strlen(i8* %.tmp4511)
%.tmp4513 = load i8*, i8** %var_type_repr
%.tmp4514 = call i32(i8*) @strlen(i8* %.tmp4513)
%.tmp4515 = icmp ne i32 %.tmp4512, %.tmp4514
br i1 %.tmp4515, label %.if.true.4516, label %.if.false.4516
.if.true.4516:
store i1 1, i1* %type_error
br label %.if.end.4516
.if.false.4516:
%.tmp4517 = load i8*, i8** %a_type_repr
%.tmp4518 = load i8*, i8** %var_type_repr
%.tmp4519 = call i32(i8*,i8*) @strcmp(i8* %.tmp4517, i8* %.tmp4518)
%.tmp4520 = icmp ne i32 %.tmp4519, 0
br i1 %.tmp4520, label %.if.true.4521, label %.if.false.4521
.if.true.4521:
store i1 1, i1* %type_error
br label %.if.end.4521
.if.false.4521:
br label %.if.end.4521
.if.end.4521:
br label %.if.end.4516
.if.end.4516:
%.tmp4522 = load i1, i1* %type_error
br i1 %.tmp4522, label %.if.true.4523, label %.if.false.4523
.if.true.4523:
%.tmp4524 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4524, i8** %err_msg
%.tmp4525 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4527 = getelementptr [49 x i8], [49 x i8]*@.str4526, i32 0, i32 0
%.tmp4528 = load i8*, i8** %a_type_repr
%.tmp4529 = load i8*, i8** %var_type_repr
%.tmp4530 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4525, i8* %.tmp4527, i8* %.tmp4528, i8* %.tmp4529)
%.tmp4531 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4532 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4533 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4531, %m286$.Node.type* %.tmp4532, i8* %.tmp4533)
br label %.if.end.4523
.if.false.4523:
br label %.if.end.4523
.if.end.4523:
br label %.if.end.4505
.if.false.4505:
br label %.if.end.4505
.if.end.4505:
%.tmp4534 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4535 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4536 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4535, i32 0, i32 1
%.tmp4537 = load i8*, i8** %.tmp4536
%.tmp4538 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp4534, i8* %.tmp4537, %m1777$.AssignableInfo.type* %.tmp4538)
%.tmp4539 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4540 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4539, i32 0, i32 1
%.tmp4541 = load %m0$.File.type*, %m0$.File.type** %.tmp4540
%.tmp4543 = getelementptr [16 x i8], [16 x i8]*@.str4542, i32 0, i32 0
%.tmp4544 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4545 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4544)
%.tmp4546 = load i8*, i8** %var_type_repr
%.tmp4547 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4541, i8* %.tmp4543, i8* %.tmp4545, i8* %.tmp4546)
%.tmp4548 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4549 = icmp ne %m1777$.AssignableInfo.type* %.tmp4548, null
br i1 %.tmp4549, label %.if.true.4550, label %.if.false.4550
.if.true.4550:
%.tmp4551 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4552 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4551, i32 0, i32 1
%.tmp4553 = load %m0$.File.type*, %m0$.File.type** %.tmp4552
%.tmp4555 = getelementptr [21 x i8], [21 x i8]*@.str4554, i32 0, i32 0
%.tmp4556 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4557 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4558 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4557, i32 0, i32 3
%.tmp4559 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4558
%.tmp4560 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4556, %m1777$.Type.type* %.tmp4559)
%.tmp4561 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4562 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4561)
%.tmp4563 = load i8*, i8** %var_type_repr
%.tmp4564 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4565 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4564)
%.tmp4566 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4553, i8* %.tmp4555, i8* %.tmp4560, i8* %.tmp4562, i8* %.tmp4563, i8* %.tmp4565)
br label %.if.end.4550
.if.false.4550:
%.tmp4567 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4568 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4569 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,%m1777$.AssignableInfo.type*) @m1777$compile_zero_value.v.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp4567, %m286$.Node.type* %.tmp4568, %m1777$.AssignableInfo.type* %.tmp4569)
br label %.if.end.4550
.if.end.4550:
%.tmp4570 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp4570
}
define void @m1777$compile_zero_value.v.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, %m1777$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.info.arg, %m1777$.AssignableInfo.type** %info
%.tmp4571 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4572 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4571, i32 0, i32 3
%.tmp4573 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4572
%.tmp4574 = icmp eq %m1777$.Type.type* %.tmp4573, null
br i1 %.tmp4574, label %.if.true.4575, label %.if.false.4575
.if.true.4575:
ret void
br label %.if.end.4575
.if.false.4575:
br label %.if.end.4575
.if.end.4575:
%.tmp4576 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4577 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4578 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4577, i32 0, i32 3
%.tmp4579 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4578
%.tmp4580 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4576, %m1777$.Type.type* %.tmp4579)
%t_repr = alloca i8*
store i8* %.tmp4580, i8** %t_repr
%.tmp4581 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4582 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4581)
%id = alloca i8*
store i8* %.tmp4582, i8** %id
%field_id = alloca i32
store i32 0, i32* %field_id
%field = alloca %m1777$.Type.type*
store %m1777$.Type.type* null, %m1777$.Type.type** %field
%field_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* null, %m1777$.AssignableInfo.type** %field_info
%.tmp4583 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4584 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4583, i32 0, i32 3
%.tmp4585 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4584
%t = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp4585, %m1777$.Type.type** %t
%.tmp4586 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4587 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4586, i32 0, i32 0
%.tmp4588 = load i8*, i8** %.tmp4587
%.tmp4590 = getelementptr [4 x i8], [4 x i8]*@.str4589, i32 0, i32 0
%.tmp4591 = call i32(i8*,i8*) @strcmp(i8* %.tmp4588, i8* %.tmp4590)
%.tmp4592 = icmp eq i32 %.tmp4591, 0
%.tmp4593 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4594 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4593, i32 0, i32 0
%.tmp4595 = load i8*, i8** %.tmp4594
%.tmp4597 = getelementptr [4 x i8], [4 x i8]*@.str4596, i32 0, i32 0
%.tmp4598 = call i32(i8*,i8*) @strcmp(i8* %.tmp4595, i8* %.tmp4597)
%.tmp4599 = icmp eq i32 %.tmp4598, 0
%.tmp4600 = or i1 %.tmp4592, %.tmp4599
%.tmp4601 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4602 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4601, i32 0, i32 0
%.tmp4603 = load i8*, i8** %.tmp4602
%.tmp4605 = getelementptr [5 x i8], [5 x i8]*@.str4604, i32 0, i32 0
%.tmp4606 = call i32(i8*,i8*) @strcmp(i8* %.tmp4603, i8* %.tmp4605)
%.tmp4607 = icmp eq i32 %.tmp4606, 0
%.tmp4608 = or i1 %.tmp4600, %.tmp4607
br i1 %.tmp4608, label %.if.true.4609, label %.if.false.4609
.if.true.4609:
%.tmp4610 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4611 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4610, i32 0, i32 1
%.tmp4612 = load %m0$.File.type*, %m0$.File.type** %.tmp4611
%.tmp4614 = getelementptr [21 x i8], [21 x i8]*@.str4613, i32 0, i32 0
%.tmp4615 = load i8*, i8** %t_repr
%.tmp4616 = load i8*, i8** %t_repr
%.tmp4617 = load i8*, i8** %id
%.tmp4618 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4612, i8* %.tmp4614, i8* %.tmp4615, i32 0, i8* %.tmp4616, i8* %.tmp4617)
br label %.if.end.4609
.if.false.4609:
%.tmp4619 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4620 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4619, i32 0, i32 0
%.tmp4621 = load i8*, i8** %.tmp4620
%.tmp4623 = getelementptr [4 x i8], [4 x i8]*@.str4622, i32 0, i32 0
%.tmp4624 = call i32(i8*,i8*) @strcmp(i8* %.tmp4621, i8* %.tmp4623)
%.tmp4625 = icmp eq i32 %.tmp4624, 0
br i1 %.tmp4625, label %.if.true.4626, label %.if.false.4626
.if.true.4626:
%.tmp4627 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4628 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4627, i32 0, i32 1
%.tmp4629 = load %m0$.File.type*, %m0$.File.type** %.tmp4628
%.tmp4631 = getelementptr [21 x i8], [21 x i8]*@.str4630, i32 0, i32 0
%.tmp4632 = load i8*, i8** %t_repr
%.tmp4634 = getelementptr [5 x i8], [5 x i8]*@.str4633, i32 0, i32 0
%.tmp4635 = load i8*, i8** %t_repr
%.tmp4636 = load i8*, i8** %id
%.tmp4637 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4629, i8* %.tmp4631, i8* %.tmp4632, i8* %.tmp4634, i8* %.tmp4635, i8* %.tmp4636)
br label %.if.end.4626
.if.false.4626:
%.tmp4638 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4639 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4638, i32 0, i32 0
%.tmp4640 = load i8*, i8** %.tmp4639
%.tmp4642 = getelementptr [7 x i8], [7 x i8]*@.str4641, i32 0, i32 0
%.tmp4643 = call i32(i8*,i8*) @strcmp(i8* %.tmp4640, i8* %.tmp4642)
%.tmp4644 = icmp eq i32 %.tmp4643, 0
br i1 %.tmp4644, label %.if.true.4645, label %.if.false.4645
.if.true.4645:
%.tmp4647 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4648 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4647, i32 0, i32 3
%.tmp4649 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4648
store %m1777$.Type.type* %.tmp4649, %m1777$.Type.type** %field
br label %.for.start.4646
.for.start.4646:
%.tmp4650 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp4651 = icmp ne %m1777$.Type.type* %.tmp4650, null
br i1 %.tmp4651, label %.for.continue.4646, label %.for.end.4646
.for.continue.4646:
%.tmp4652 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4653 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4652)
store %m1777$.AssignableInfo.type* %.tmp4653, %m1777$.AssignableInfo.type** %field_info
%.tmp4654 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4655 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp4654, %m1777$.AssignableInfo.type* %.tmp4655)
%.tmp4656 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
%.tmp4657 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4656, i32 0, i32 3
%.tmp4658 = load %m1777$.Type.type*, %m1777$.Type.type** %field
store %m1777$.Type.type* %.tmp4658, %m1777$.Type.type** %.tmp4657
%.tmp4659 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4660 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4659, i32 0, i32 1
%.tmp4661 = load %m0$.File.type*, %m0$.File.type** %.tmp4660
%.tmp4663 = getelementptr [46 x i8], [46 x i8]*@.str4662, i32 0, i32 0
%.tmp4664 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
%.tmp4665 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4664)
%.tmp4666 = load i8*, i8** %t_repr
%.tmp4667 = load i8*, i8** %t_repr
%.tmp4668 = load i8*, i8** %id
%.tmp4669 = load i32, i32* %field_id
%.tmp4670 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4661, i8* %.tmp4663, i8* %.tmp4665, i8* %.tmp4666, i8* %.tmp4667, i8* %.tmp4668, i32 %.tmp4669)
%.tmp4671 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4672 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4673 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,%m1777$.AssignableInfo.type*) @m1777$compile_zero_value.v.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp4671, %m286$.Node.type* %.tmp4672, %m1777$.AssignableInfo.type* %.tmp4673)
%.tmp4674 = load i32, i32* %field_id
%.tmp4675 = add i32 %.tmp4674, 1
store i32 %.tmp4675, i32* %field_id
%.tmp4676 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp4677 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4676, i32 0, i32 4
%.tmp4678 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4677
store %m1777$.Type.type* %.tmp4678, %m1777$.Type.type** %field
br label %.for.start.4646
.for.end.4646:
br label %.if.end.4645
.if.false.4645:
%.tmp4679 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4680 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4679, i32 0, i32 0
%.tmp4681 = load i8*, i8** %.tmp4680
%.tmp4683 = getelementptr [10 x i8], [10 x i8]*@.str4682, i32 0, i32 0
%.tmp4684 = call i32(i8*,i8*) @strcmp(i8* %.tmp4681, i8* %.tmp4683)
%.tmp4685 = icmp eq i32 %.tmp4684, 0
br i1 %.tmp4685, label %.if.true.4686, label %.if.false.4686
.if.true.4686:
%.tmp4688 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp4689 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4688, i32 0, i32 3
%.tmp4690 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4689
%.tmp4691 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4690, i32 0, i32 3
%.tmp4692 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4691
store %m1777$.Type.type* %.tmp4692, %m1777$.Type.type** %field
br label %.for.start.4687
.for.start.4687:
%.tmp4693 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp4694 = icmp ne %m1777$.Type.type* %.tmp4693, null
br i1 %.tmp4694, label %.for.continue.4687, label %.for.end.4687
.for.continue.4687:
%.tmp4695 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4696 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4695)
store %m1777$.AssignableInfo.type* %.tmp4696, %m1777$.AssignableInfo.type** %field_info
%.tmp4697 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4698 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp4697, %m1777$.AssignableInfo.type* %.tmp4698)
%.tmp4699 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
%.tmp4700 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4699, i32 0, i32 3
%.tmp4701 = load %m1777$.Type.type*, %m1777$.Type.type** %field
store %m1777$.Type.type* %.tmp4701, %m1777$.Type.type** %.tmp4700
%.tmp4702 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4703 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4702, i32 0, i32 1
%.tmp4704 = load %m0$.File.type*, %m0$.File.type** %.tmp4703
%.tmp4706 = getelementptr [46 x i8], [46 x i8]*@.str4705, i32 0, i32 0
%.tmp4707 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
%.tmp4708 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4707)
%.tmp4709 = load i8*, i8** %t_repr
%.tmp4710 = load i8*, i8** %t_repr
%.tmp4711 = load i8*, i8** %id
%.tmp4712 = load i32, i32* %field_id
%.tmp4713 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4704, i8* %.tmp4706, i8* %.tmp4708, i8* %.tmp4709, i8* %.tmp4710, i8* %.tmp4711, i32 %.tmp4712)
%.tmp4714 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4715 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4716 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %field_info
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,%m1777$.AssignableInfo.type*) @m1777$compile_zero_value.v.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp4714, %m286$.Node.type* %.tmp4715, %m1777$.AssignableInfo.type* %.tmp4716)
%.tmp4717 = load i32, i32* %field_id
%.tmp4718 = add i32 %.tmp4717, 1
store i32 %.tmp4718, i32* %field_id
%.tmp4719 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp4720 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4719, i32 0, i32 4
%.tmp4721 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4720
store %m1777$.Type.type* %.tmp4721, %m1777$.Type.type** %field
br label %.for.start.4687
.for.end.4687:
br label %.if.end.4686
.if.false.4686:
%.tmp4722 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4723 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4725 = getelementptr [44 x i8], [44 x i8]*@.str4724, i32 0, i32 0
%.tmp4726 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4722, %m286$.Node.type* %.tmp4723, i8* %.tmp4725)
%.tmp4727 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4728 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4727, i32 0, i32 3
%.tmp4729 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4728
%.tmp4730 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp4729, i32 0, i32 0
%.tmp4731 = load i8*, i8** %.tmp4730
%.tmp4732 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4733 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp4734 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4733, i32 0, i32 3
%.tmp4735 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4734
%.tmp4736 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4732, %m1777$.Type.type* %.tmp4735)
%.tmp4737 = call i32(i8*,...) @printf(i8* %.tmp4726, i8* %.tmp4731, i8* %.tmp4736)
ret void
br label %.if.end.4686
.if.end.4686:
br label %.if.end.4645
.if.end.4645:
br label %.if.end.4626
.if.end.4626:
br label %.if.end.4609
.if.end.4609:
ret void
}
define void @m1777$compile_if_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4738 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4739 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4738, i32 0, i32 6
%.tmp4740 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4739
%.tmp4742 = getelementptr [11 x i8], [11 x i8]*@.str4741, i32 0, i32 0
%.tmp4743 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4740, i8* %.tmp4742)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4743, %m286$.Node.type** %assignable
%.tmp4744 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4745 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4746 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4744, %m286$.Node.type* %.tmp4745)
%a_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp4746, %m1777$.AssignableInfo.type** %a_info
%.tmp4747 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4748 = icmp eq %m1777$.AssignableInfo.type* %.tmp4747, null
br i1 %.tmp4748, label %.if.true.4749, label %.if.false.4749
.if.true.4749:
ret void
br label %.if.end.4749
.if.false.4749:
br label %.if.end.4749
.if.end.4749:
%.tmp4750 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4751 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4750)
%if_id = alloca i32
store i32 %.tmp4751, i32* %if_id
%.tmp4752 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4753 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4752, i32 0, i32 1
%.tmp4754 = load %m0$.File.type*, %m0$.File.type** %.tmp4753
%.tmp4756 = getelementptr [53 x i8], [53 x i8]*@.str4755, i32 0, i32 0
%.tmp4757 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4758 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4759 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4758, i32 0, i32 3
%.tmp4760 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp4759
%.tmp4761 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp4757, %m1777$.Type.type* %.tmp4760)
%.tmp4762 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %a_info
%.tmp4763 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp4762)
%.tmp4764 = load i32, i32* %if_id
%.tmp4765 = load i32, i32* %if_id
%.tmp4766 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4754, i8* %.tmp4756, i8* %.tmp4761, i8* %.tmp4763, i32 %.tmp4764, i32 %.tmp4765)
%.tmp4767 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4768 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4767, i32 0, i32 1
%.tmp4769 = load %m0$.File.type*, %m0$.File.type** %.tmp4768
%.tmp4771 = getelementptr [14 x i8], [14 x i8]*@.str4770, i32 0, i32 0
%.tmp4772 = load i32, i32* %if_id
%.tmp4773 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4769, i8* %.tmp4771, i32 %.tmp4772)
%.tmp4774 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4775 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4774, i32 0, i32 6
%.tmp4776 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4775
%.tmp4778 = getelementptr [6 x i8], [6 x i8]*@.str4777, i32 0, i32 0
%.tmp4779 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4776, i8* %.tmp4778)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4779, %m286$.Node.type** %block
%.tmp4780 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4781 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4780, %m286$.Node.type* %.tmp4781)
%.tmp4782 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4783 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4782, i32 0, i32 1
%.tmp4784 = load %m0$.File.type*, %m0$.File.type** %.tmp4783
%.tmp4786 = getelementptr [23 x i8], [23 x i8]*@.str4785, i32 0, i32 0
%.tmp4787 = load i32, i32* %if_id
%.tmp4788 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4784, i8* %.tmp4786, i32 %.tmp4787)
%.tmp4789 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4790 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4789, i32 0, i32 1
%.tmp4791 = load %m0$.File.type*, %m0$.File.type** %.tmp4790
%.tmp4793 = getelementptr [15 x i8], [15 x i8]*@.str4792, i32 0, i32 0
%.tmp4794 = load i32, i32* %if_id
%.tmp4795 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4791, i8* %.tmp4793, i32 %.tmp4794)
%.tmp4796 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4797 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4796, i32 0, i32 6
%.tmp4798 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4797
%.tmp4800 = getelementptr [11 x i8], [11 x i8]*@.str4799, i32 0, i32 0
%.tmp4801 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4798, i8* %.tmp4800)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4801, %m286$.Node.type** %else_block
%.tmp4802 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4803 = icmp ne %m286$.Node.type* %.tmp4802, null
br i1 %.tmp4803, label %.if.true.4804, label %.if.false.4804
.if.true.4804:
%.tmp4805 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4806 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4805, i32 0, i32 6
%.tmp4807 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4806
%.tmp4808 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4807, i32 0, i32 0
%.tmp4809 = load i8*, i8** %.tmp4808
%.tmp4811 = getelementptr [11 x i8], [11 x i8]*@.str4810, i32 0, i32 0
%.tmp4812 = call i32(i8*,i8*) @strcmp(i8* %.tmp4809, i8* %.tmp4811)
%.tmp4813 = icmp eq i32 %.tmp4812, 0
br i1 %.tmp4813, label %.if.true.4814, label %.if.false.4814
.if.true.4814:
%.tmp4815 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4816 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4815, i32 0, i32 6
%.tmp4817 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4816
%.tmp4818 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4817, i32 0, i32 6
%.tmp4819 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4818
%.tmp4821 = getelementptr [6 x i8], [6 x i8]*@.str4820, i32 0, i32 0
%.tmp4822 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4819, i8* %.tmp4821)
store %m286$.Node.type* %.tmp4822, %m286$.Node.type** %block
%.tmp4823 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4824 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4823, %m286$.Node.type* %.tmp4824)
br label %.if.end.4814
.if.false.4814:
%.tmp4825 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4826 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_if_block.v.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4825, %m286$.Node.type* %.tmp4826)
br label %.if.end.4814
.if.end.4814:
br label %.if.end.4804
.if.false.4804:
br label %.if.end.4804
.if.end.4804:
%.tmp4827 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4828 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4827, i32 0, i32 1
%.tmp4829 = load %m0$.File.type*, %m0$.File.type** %.tmp4828
%.tmp4831 = getelementptr [23 x i8], [23 x i8]*@.str4830, i32 0, i32 0
%.tmp4832 = load i32, i32* %if_id
%.tmp4833 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4829, i8* %.tmp4831, i32 %.tmp4832)
%.tmp4834 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4835 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4834, i32 0, i32 1
%.tmp4836 = load %m0$.File.type*, %m0$.File.type** %.tmp4835
%.tmp4838 = getelementptr [13 x i8], [13 x i8]*@.str4837, i32 0, i32 0
%.tmp4839 = load i32, i32* %if_id
%.tmp4840 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4836, i8* %.tmp4838, i32 %.tmp4839)
ret void
}
define void @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4841 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4842 = icmp ne %m286$.Node.type* %.tmp4841, null
br i1 %.tmp4842, label %.if.true.4843, label %.if.false.4843
.if.true.4843:
%.tmp4844 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4845 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4844, i32 0, i32 6
%.tmp4846 = load i8*, i8** %.tmp4845
%.tmp4847 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4848 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4847, i32 0, i32 3
%.tmp4849 = load i32, i32* %.tmp4848
%.tmp4850 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4851 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4850, i32 0, i32 4
%.tmp4852 = load i32, i32* %.tmp4851
%.tmp4853 = load i8*, i8** %msg
%.tmp4854 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp4846, i32 %.tmp4849, i32 %.tmp4852, i8* %.tmp4853)
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp4854, %m717$.Error.type** %err
%.tmp4855 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4856 = load %m717$.Error.type*, %m717$.Error.type** %err
call void(%m1777$.CompilerCtx.type*,%m717$.Error.type*) @m1777$append_error.v.m1777$.CompilerCtx.typep.m717$.Error.typep(%m1777$.CompilerCtx.type* %.tmp4855, %m717$.Error.type* %.tmp4856)
br label %.if.end.4843
.if.false.4843:
%.tmp4858 = getelementptr [61 x i8], [61 x i8]*@.str4857, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4858)
br label %.if.end.4843
.if.end.4843:
ret void
}
define void @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1777$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.info.arg, %m1777$.AssignableInfo.type** %info
%.tmp4859 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4860 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*) @m1777$get_current_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp4859)
%mod = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp4860, %m1777$.ModuleLookup.type** %mod
%.tmp4861 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp4862 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp4861, i32 0, i32 3
%.tmp4863 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4862
%.tmp4864 = icmp ne %m1777$.Scope.type* %.tmp4863, null
%.tmp4866 = getelementptr [82 x i8], [82 x i8]*@.str4865, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4864, i8* %.tmp4866)
%.tmp4867 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp4868 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp4867, i32 0, i32 3
%.tmp4869 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4868
%current_scope = alloca %m1777$.Scope.type*
store %m1777$.Scope.type* %.tmp4869, %m1777$.Scope.type** %current_scope
%.tmp4870 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* null, i32 1
%.tmp4871 = ptrtoint %m1777$.ScopeItem.type* %.tmp4870 to i32
%.tmp4872 = call i8*(i32) @malloc(i32 %.tmp4871)
%.tmp4873 = bitcast i8* %.tmp4872 to %m1777$.ScopeItem.type*
%newitem = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp4873, %m1777$.ScopeItem.type** %newitem
%.tmp4874 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %newitem
%.tmp4875 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4874, i32 0, i32 0
%.tmp4876 = load i8*, i8** %name
store i8* %.tmp4876, i8** %.tmp4875
%.tmp4877 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %newitem
%.tmp4878 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4877, i32 0, i32 1
%.tmp4879 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
store %m1777$.AssignableInfo.type* %.tmp4879, %m1777$.AssignableInfo.type** %.tmp4878
%.tmp4880 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %newitem
%.tmp4881 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4880, i32 0, i32 2
store %m1777$.ScopeItem.type* null, %m1777$.ScopeItem.type** %.tmp4881
%.tmp4882 = load %m1777$.Scope.type*, %m1777$.Scope.type** %current_scope
%.tmp4883 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4882, i32 0, i32 1
%.tmp4884 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %.tmp4883
%.tmp4885 = icmp eq %m1777$.ScopeItem.type* %.tmp4884, null
br i1 %.tmp4885, label %.if.true.4886, label %.if.false.4886
.if.true.4886:
%.tmp4887 = load %m1777$.Scope.type*, %m1777$.Scope.type** %current_scope
%.tmp4888 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4887, i32 0, i32 1
%.tmp4889 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %newitem
store %m1777$.ScopeItem.type* %.tmp4889, %m1777$.ScopeItem.type** %.tmp4888
ret void
br label %.if.end.4886
.if.false.4886:
br label %.if.end.4886
.if.end.4886:
%.tmp4890 = load %m1777$.Scope.type*, %m1777$.Scope.type** %current_scope
%.tmp4891 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4890, i32 0, i32 1
%.tmp4892 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %.tmp4891
%last_item = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp4892, %m1777$.ScopeItem.type** %last_item
br label %.for.start.4893
.for.start.4893:
%.tmp4894 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %last_item
%.tmp4895 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4894, i32 0, i32 2
%.tmp4896 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %.tmp4895
%.tmp4897 = icmp ne %m1777$.ScopeItem.type* %.tmp4896, null
br i1 %.tmp4897, label %.for.continue.4893, label %.for.end.4893
.for.continue.4893:
%.tmp4898 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %last_item
%.tmp4899 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4898, i32 0, i32 2
%.tmp4900 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %.tmp4899
store %m1777$.ScopeItem.type* %.tmp4900, %m1777$.ScopeItem.type** %last_item
br label %.for.start.4893
.for.end.4893:
%.tmp4901 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %last_item
%.tmp4902 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4901, i32 0, i32 2
%.tmp4903 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %newitem
store %m1777$.ScopeItem.type* %.tmp4903, %m1777$.ScopeItem.type** %.tmp4902
ret void
}
define %m1777$.ScopeItem.type* @m1777$find_defined_in.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%.tmp4904 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4905 = load i8*, i8** %module
%.tmp4906 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4907 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4906, i32 0, i32 1
%.tmp4908 = load i8*, i8** %.tmp4907
%.tmp4909 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,i8*,i8*) @m1777$find_defined_str.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.cp(%m1777$.CompilerCtx.type* %.tmp4904, i8* %.tmp4905, i8* %.tmp4908)
%found = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp4909, %m1777$.ScopeItem.type** %found
%.tmp4910 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %found
%.tmp4911 = icmp eq %m1777$.ScopeItem.type* %.tmp4910, null
br i1 %.tmp4911, label %.if.true.4912, label %.if.false.4912
.if.true.4912:
%.tmp4913 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4915 = getelementptr [31 x i8], [31 x i8]*@.str4914, i32 0, i32 0
%.tmp4916 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4917 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4916, i32 0, i32 1
%.tmp4918 = load i8*, i8** %.tmp4917
%.tmp4919 = load i8*, i8** %module
%.tmp4920 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4913, i8* %.tmp4915, i8* %.tmp4918, i8* %.tmp4919)
%.tmp4921 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4922 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4923 = load i8*, i8** %err_buf
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp4921, %m286$.Node.type* %.tmp4922, i8* %.tmp4923)
%.tmp4924 = bitcast ptr null to %m1777$.ScopeItem.type*
ret %m1777$.ScopeItem.type* %.tmp4924
br label %.if.end.4912
.if.false.4912:
br label %.if.end.4912
.if.end.4912:
br label %.for.start.4925
.for.start.4925:
%.tmp4926 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4927 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4926, i32 0, i32 7
%.tmp4928 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4927
%.tmp4929 = icmp ne %m286$.Node.type* %.tmp4928, null
%.tmp4930 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %found
%.tmp4931 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4930, i32 0, i32 1
%.tmp4932 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp4931
%.tmp4933 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4932, i32 0, i32 2
%.tmp4934 = load i8*, i8** %.tmp4933
%.tmp4936 = getelementptr [7 x i8], [7 x i8]*@.str4935, i32 0, i32 0
%.tmp4937 = call i32(i8*,i8*) @strcmp(i8* %.tmp4934, i8* %.tmp4936)
%.tmp4938 = icmp eq i32 %.tmp4937, 0
%.tmp4939 = and i1 %.tmp4929, %.tmp4938
br i1 %.tmp4939, label %.for.continue.4925, label %.for.end.4925
.for.continue.4925:
%.tmp4940 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4941 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %found
%.tmp4942 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4941, i32 0, i32 1
%.tmp4943 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp4942
%.tmp4944 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp4943, i32 0, i32 0
%.tmp4945 = load i8*, i8** %.tmp4944
%.tmp4946 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4947 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4946, i32 0, i32 7
%.tmp4948 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4947
%.tmp4949 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4948, i32 0, i32 7
%.tmp4950 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4949
%.tmp4951 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1777$find_defined_in.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4940, i8* %.tmp4945, %m286$.Node.type* %.tmp4950)
store %m1777$.ScopeItem.type* %.tmp4951, %m1777$.ScopeItem.type** %found
%.tmp4952 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %found
%.tmp4953 = icmp eq %m1777$.ScopeItem.type* %.tmp4952, null
br i1 %.tmp4953, label %.if.true.4954, label %.if.false.4954
.if.true.4954:
%.tmp4955 = bitcast ptr null to %m1777$.ScopeItem.type*
ret %m1777$.ScopeItem.type* %.tmp4955
br label %.if.end.4954
.if.false.4954:
br label %.if.end.4954
.if.end.4954:
br label %.for.start.4925
.for.end.4925:
%.tmp4956 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %found
ret %m1777$.ScopeItem.type* %.tmp4956
}
define %m1777$.ScopeItem.type* @m1777$find_defined_str.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.cp(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4957 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4958 = load i8*, i8** %module
%.tmp4959 = call %m1777$.ModuleLookup.type*(%m1777$.CompilerCtx.type*,i8*) @m1777$get_module.m1777$.ModuleLookup.typep.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.tmp4957, i8* %.tmp4958)
%mod = alloca %m1777$.ModuleLookup.type*
store %m1777$.ModuleLookup.type* %.tmp4959, %m1777$.ModuleLookup.type** %mod
%.tmp4960 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp4961 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp4960, i32 0, i32 3
%.tmp4962 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4961
%.tmp4963 = icmp ne %m1777$.Scope.type* %.tmp4962, null
%.tmp4965 = getelementptr [77 x i8], [77 x i8]*@.str4964, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4963, i8* %.tmp4965)
%.tmp4967 = load %m1777$.ModuleLookup.type*, %m1777$.ModuleLookup.type** %mod
%.tmp4968 = getelementptr %m1777$.ModuleLookup.type, %m1777$.ModuleLookup.type* %.tmp4967, i32 0, i32 3
%.tmp4969 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4968
%s = alloca %m1777$.Scope.type*
store %m1777$.Scope.type* %.tmp4969, %m1777$.Scope.type** %s
br label %.for.start.4966
.for.start.4966:
%.tmp4970 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4971 = icmp ne %m1777$.Scope.type* %.tmp4970, null
br i1 %.tmp4971, label %.for.continue.4966, label %.for.end.4966
.for.continue.4966:
%.tmp4973 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4974 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4973, i32 0, i32 1
%.tmp4975 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %.tmp4974
%item = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp4975, %m1777$.ScopeItem.type** %item
br label %.for.start.4972
.for.start.4972:
%.tmp4976 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %item
%.tmp4977 = icmp ne %m1777$.ScopeItem.type* %.tmp4976, null
br i1 %.tmp4977, label %.for.continue.4972, label %.for.end.4972
.for.continue.4972:
%.tmp4978 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %item
%.tmp4979 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4978, i32 0, i32 0
%.tmp4980 = load i8*, i8** %.tmp4979
%.tmp4981 = load i8*, i8** %assignable_name
%.tmp4982 = call i32(i8*,i8*) @strcmp(i8* %.tmp4980, i8* %.tmp4981)
%.tmp4983 = icmp eq i32 %.tmp4982, 0
br i1 %.tmp4983, label %.if.true.4984, label %.if.false.4984
.if.true.4984:
%.tmp4985 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %item
ret %m1777$.ScopeItem.type* %.tmp4985
br label %.if.end.4984
.if.false.4984:
br label %.if.end.4984
.if.end.4984:
%.tmp4986 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %item
%.tmp4987 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp4986, i32 0, i32 2
%.tmp4988 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %.tmp4987
store %m1777$.ScopeItem.type* %.tmp4988, %m1777$.ScopeItem.type** %item
br label %.for.start.4972
.for.end.4972:
%.tmp4989 = load %m1777$.Scope.type*, %m1777$.Scope.type** %s
%.tmp4990 = getelementptr %m1777$.Scope.type, %m1777$.Scope.type* %.tmp4989, i32 0, i32 5
%.tmp4991 = load %m1777$.Scope.type*, %m1777$.Scope.type** %.tmp4990
store %m1777$.Scope.type* %.tmp4991, %m1777$.Scope.type** %s
br label %.for.start.4966
.for.end.4966:
%.tmp4992 = bitcast ptr null to %m1777$.ScopeItem.type*
ret %m1777$.ScopeItem.type* %.tmp4992
}
define %m1777$.ScopeItem.type* @m1777$find_defined.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp4993 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4994 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp4995 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp4994, i32 0, i32 6
%.tmp4996 = load i8*, i8** %.tmp4995
%.tmp4997 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4997, i32 0, i32 6
%.tmp4999 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4998
%.tmp5000 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1777$find_defined_in.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp4993, i8* %.tmp4996, %m286$.Node.type* %.tmp4999)
ret %m1777$.ScopeItem.type* %.tmp5000
}
define %m1777$.AssignableInfo.type* @m1777$get_dotted_name.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dot_name_ptr.arg, %m1777$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.dot_name_ptr.arg, %m286$.Node.type** %dot_name_ptr
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.info.arg, %m1777$.AssignableInfo.type** %info
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp5001 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5002 = icmp eq %m1777$.AssignableInfo.type* %.tmp5001, null
br i1 %.tmp5002, label %.if.true.5003, label %.if.false.5003
.if.true.5003:
%.tmp5004 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5005 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5007 = getelementptr [54 x i8], [54 x i8]*@.str5006, i32 0, i32 0
%.tmp5008 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5004, %m286$.Node.type* %.tmp5005, i8* %.tmp5007)
%.tmp5009 = call i32(i8*,...) @printf(i8* %.tmp5008)
%.tmp5010 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5010
br label %.if.end.5003
.if.false.5003:
br label %.if.end.5003
.if.end.5003:
%.tmp5011 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5012 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5011, i32 0, i32 2
%.tmp5013 = load i8*, i8** %.tmp5012
%.tmp5015 = getelementptr [9 x i8], [9 x i8]*@.str5014, i32 0, i32 0
%.tmp5016 = call i32(i8*,i8*) @strcmp(i8* %.tmp5013, i8* %.tmp5015)
%.tmp5017 = icmp eq i32 %.tmp5016, 0
%.tmp5018 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5019 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5018, i32 0, i32 2
%.tmp5020 = load i8*, i8** %.tmp5019
%.tmp5022 = getelementptr [7 x i8], [7 x i8]*@.str5021, i32 0, i32 0
%.tmp5023 = call i32(i8*,i8*) @strcmp(i8* %.tmp5020, i8* %.tmp5022)
%.tmp5024 = icmp eq i32 %.tmp5023, 0
%.tmp5025 = or i1 %.tmp5017, %.tmp5024
br i1 %.tmp5025, label %.if.true.5026, label %.if.false.5026
.if.true.5026:
%.tmp5027 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5028 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5027, i32 0, i32 7
%.tmp5029 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5028
%.tmp5030 = icmp ne %m286$.Node.type* %.tmp5029, null
br i1 %.tmp5030, label %.if.true.5031, label %.if.false.5031
.if.true.5031:
%.tmp5032 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5034 = getelementptr [46 x i8], [46 x i8]*@.str5033, i32 0, i32 0
%.tmp5035 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5036 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5035, i32 0, i32 7
%.tmp5037 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5036
%.tmp5038 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5037, i32 0, i32 7
%.tmp5039 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5038
%.tmp5040 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5039, i32 0, i32 1
%.tmp5041 = load i8*, i8** %.tmp5040
%.tmp5042 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5043 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5042, i32 0, i32 1
%.tmp5044 = load i8*, i8** %.tmp5043
%.tmp5045 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5032, i8* %.tmp5034, i8* %.tmp5041, i8* %.tmp5044)
%.tmp5046 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5047 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5048 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5046, %m286$.Node.type* %.tmp5047, i8* %.tmp5048)
%.tmp5049 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5049
br label %.if.end.5031
.if.false.5031:
br label %.if.end.5031
.if.end.5031:
%.tmp5050 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp5050
br label %.if.end.5026
.if.false.5026:
%.tmp5051 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5052 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5051, i32 0, i32 2
%.tmp5053 = load i8*, i8** %.tmp5052
%.tmp5055 = getelementptr [9 x i8], [9 x i8]*@.str5054, i32 0, i32 0
%.tmp5056 = call i32(i8*,i8*) @strcmp(i8* %.tmp5053, i8* %.tmp5055)
%.tmp5057 = icmp eq i32 %.tmp5056, 0
%.tmp5058 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5059 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5058, i32 0, i32 7
%.tmp5060 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5059
%.tmp5061 = icmp ne %m286$.Node.type* %.tmp5060, null
%.tmp5062 = and i1 %.tmp5057, %.tmp5061
br i1 %.tmp5062, label %.if.true.5063, label %.if.false.5063
.if.true.5063:
%.tmp5064 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%base_var = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5064, %m1777$.AssignableInfo.type** %base_var
%.tmp5065 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5066 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5065, i32 0, i32 3
%.tmp5067 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5066
%struct_info = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp5067, %m1777$.Type.type** %struct_info
br label %.for.start.5068
.for.start.5068:
%.tmp5069 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5070 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5069, i32 0, i32 3
%.tmp5071 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5070
%.tmp5072 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5071, i32 0, i32 0
%.tmp5073 = load i8*, i8** %.tmp5072
%.tmp5075 = getelementptr [4 x i8], [4 x i8]*@.str5074, i32 0, i32 0
%.tmp5076 = call i32(i8*,i8*) @strcmp(i8* %.tmp5073, i8* %.tmp5075)
%.tmp5077 = icmp eq i32 %.tmp5076, 0
br i1 %.tmp5077, label %.for.continue.5068, label %.for.end.5068
.for.continue.5068:
%.tmp5078 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5079 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5078)
%new_base = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5079, %m1777$.AssignableInfo.type** %new_base
%.tmp5080 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5081 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5080, %m1777$.AssignableInfo.type* %.tmp5081)
%.tmp5082 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
%.tmp5083 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5082, i32 0, i32 3
%.tmp5084 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5085 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5084, i32 0, i32 3
%.tmp5086 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5085
%.tmp5087 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5086, i32 0, i32 3
%.tmp5088 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5087
store %m1777$.Type.type* %.tmp5088, %m1777$.Type.type** %.tmp5083
%.tmp5089 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5090 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5089, i32 0, i32 1
%.tmp5091 = load %m0$.File.type*, %m0$.File.type** %.tmp5090
%.tmp5093 = getelementptr [23 x i8], [23 x i8]*@.str5092, i32 0, i32 0
%.tmp5094 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
%.tmp5095 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5094)
%.tmp5096 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5097 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
%.tmp5098 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5097, i32 0, i32 3
%.tmp5099 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5098
%.tmp5100 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5096, %m1777$.Type.type* %.tmp5099)
%.tmp5101 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5102 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5103 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5102, i32 0, i32 3
%.tmp5104 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5103
%.tmp5105 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5101, %m1777$.Type.type* %.tmp5104)
%.tmp5106 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5107 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5106)
%.tmp5108 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5091, i8* %.tmp5093, i8* %.tmp5095, i8* %.tmp5100, i8* %.tmp5105, i8* %.tmp5107)
%.tmp5109 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
store %m1777$.AssignableInfo.type* %.tmp5109, %m1777$.AssignableInfo.type** %base_var
%.tmp5110 = load %m1777$.Type.type*, %m1777$.Type.type** %struct_info
%.tmp5111 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5110, i32 0, i32 3
%.tmp5112 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5111
store %m1777$.Type.type* %.tmp5112, %m1777$.Type.type** %struct_info
br label %.for.start.5068
.for.end.5068:
%.tmp5113 = load %m1777$.Type.type*, %m1777$.Type.type** %struct_info
%.tmp5114 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5113, i32 0, i32 0
%.tmp5115 = load i8*, i8** %.tmp5114
%.tmp5117 = getelementptr [10 x i8], [10 x i8]*@.str5116, i32 0, i32 0
%.tmp5118 = call i32(i8*,i8*) @strcmp(i8* %.tmp5115, i8* %.tmp5117)
%.tmp5119 = icmp eq i32 %.tmp5118, 0
br i1 %.tmp5119, label %.if.true.5120, label %.if.false.5120
.if.true.5120:
%.tmp5121 = load %m1777$.Type.type*, %m1777$.Type.type** %struct_info
%.tmp5122 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5121, i32 0, i32 3
%.tmp5123 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5122
store %m1777$.Type.type* %.tmp5123, %m1777$.Type.type** %struct_info
br label %.if.end.5120
.if.false.5120:
br label %.if.end.5120
.if.end.5120:
%.tmp5124 = load %m1777$.Type.type*, %m1777$.Type.type** %struct_info
%.tmp5125 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5124, i32 0, i32 0
%.tmp5126 = load i8*, i8** %.tmp5125
%.tmp5128 = getelementptr [7 x i8], [7 x i8]*@.str5127, i32 0, i32 0
%.tmp5129 = call i32(i8*,i8*) @strcmp(i8* %.tmp5126, i8* %.tmp5128)
%.tmp5130 = icmp ne i32 %.tmp5129, 0
br i1 %.tmp5130, label %.if.true.5131, label %.if.false.5131
.if.true.5131:
%.tmp5132 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5134 = getelementptr [48 x i8], [48 x i8]*@.str5133, i32 0, i32 0
%.tmp5135 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5136 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5135, i32 0, i32 7
%.tmp5137 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5136
%.tmp5138 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5137, i32 0, i32 7
%.tmp5139 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5138
%.tmp5140 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5139, i32 0, i32 1
%.tmp5141 = load i8*, i8** %.tmp5140
%.tmp5142 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5143 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5142, i32 0, i32 1
%.tmp5144 = load i8*, i8** %.tmp5143
%.tmp5145 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5132, i8* %.tmp5134, i8* %.tmp5141, i8* %.tmp5144)
%.tmp5146 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5147 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5148 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5146, %m286$.Node.type* %.tmp5147, i8* %.tmp5148)
%.tmp5149 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5149
br label %.if.end.5131
.if.false.5131:
br label %.if.end.5131
.if.end.5131:
%.tmp5150 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5151 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5150, i32 0, i32 7
%.tmp5152 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5151
%.tmp5153 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5152, i32 0, i32 7
%.tmp5154 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5153
%.tmp5155 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5154, i32 0, i32 1
%.tmp5156 = load i8*, i8** %.tmp5155
%field_name = alloca i8*
store i8* %.tmp5156, i8** %field_name
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp5157 = bitcast ptr null to %m1777$.Type.type*
%found_field = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp5157, %m1777$.Type.type** %found_field
%.tmp5159 = load %m1777$.Type.type*, %m1777$.Type.type** %struct_info
%.tmp5160 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5159, i32 0, i32 3
%.tmp5161 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5160
%field = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp5161, %m1777$.Type.type** %field
br label %.for.start.5158
.for.start.5158:
%.tmp5162 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp5163 = icmp ne %m1777$.Type.type* %.tmp5162, null
br i1 %.tmp5163, label %.for.continue.5158, label %.for.end.5158
.for.continue.5158:
%.tmp5164 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp5165 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5164, i32 0, i32 1
%.tmp5166 = load i8*, i8** %.tmp5165
%.tmp5167 = load i8*, i8** %field_name
%.tmp5168 = call i32(i8*,i8*) @strcmp(i8* %.tmp5166, i8* %.tmp5167)
%.tmp5169 = icmp eq i32 %.tmp5168, 0
br i1 %.tmp5169, label %.if.true.5170, label %.if.false.5170
.if.true.5170:
%.tmp5171 = load %m1777$.Type.type*, %m1777$.Type.type** %field
store %m1777$.Type.type* %.tmp5171, %m1777$.Type.type** %found_field
br label %.for.end.5158
br label %.if.end.5170
.if.false.5170:
%.tmp5172 = load i32, i32* %field_id
%.tmp5173 = add i32 %.tmp5172, 1
store i32 %.tmp5173, i32* %field_id
br label %.if.end.5170
.if.end.5170:
%.tmp5174 = load %m1777$.Type.type*, %m1777$.Type.type** %field
%.tmp5175 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5174, i32 0, i32 4
%.tmp5176 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5175
store %m1777$.Type.type* %.tmp5176, %m1777$.Type.type** %field
br label %.for.start.5158
.for.end.5158:
%.tmp5177 = load %m1777$.Type.type*, %m1777$.Type.type** %found_field
%.tmp5178 = icmp eq %m1777$.Type.type* %.tmp5177, null
br i1 %.tmp5178, label %.if.true.5179, label %.if.false.5179
.if.true.5179:
%.tmp5180 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5182 = getelementptr [34 x i8], [34 x i8]*@.str5181, i32 0, i32 0
%.tmp5183 = load i8*, i8** %field_name
%.tmp5184 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5185 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5184, i32 0, i32 1
%.tmp5186 = load i8*, i8** %.tmp5185
%.tmp5187 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5180, i8* %.tmp5182, i8* %.tmp5183, i8* %.tmp5186)
%.tmp5188 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5189 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5190 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5188, %m286$.Node.type* %.tmp5189, i8* %.tmp5190)
%.tmp5191 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5191
br label %.if.end.5179
.if.false.5179:
br label %.if.end.5179
.if.end.5179:
%.tmp5192 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5193 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5192)
%new_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5193, %m1777$.AssignableInfo.type** %new_info
%.tmp5194 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_info
%.tmp5195 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5194, i32 0, i32 3
%.tmp5196 = load %m1777$.Type.type*, %m1777$.Type.type** %found_field
store %m1777$.Type.type* %.tmp5196, %m1777$.Type.type** %.tmp5195
%.tmp5197 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5198 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5197, %m1777$.AssignableInfo.type* %.tmp5198)
%.tmp5199 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_info
%.tmp5200 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5199, i32 0, i32 2
%.tmp5202 = getelementptr [9 x i8], [9 x i8]*@.str5201, i32 0, i32 0
store i8* %.tmp5202, i8** %.tmp5200
%.tmp5203 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5204 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5205 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5204, i32 0, i32 3
%.tmp5206 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5205
%.tmp5207 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5203, %m1777$.Type.type* %.tmp5206)
%info_tr = alloca i8*
store i8* %.tmp5207, i8** %info_tr
%.tmp5208 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5209 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5208, i32 0, i32 1
%.tmp5210 = load %m0$.File.type*, %m0$.File.type** %.tmp5209
%.tmp5212 = getelementptr [46 x i8], [46 x i8]*@.str5211, i32 0, i32 0
%.tmp5213 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_info
%.tmp5214 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5213)
%.tmp5215 = load i8*, i8** %info_tr
%.tmp5216 = load i8*, i8** %info_tr
%.tmp5217 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base_var
%.tmp5218 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5217)
%.tmp5219 = load i32, i32* %field_id
%.tmp5220 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5210, i8* %.tmp5212, i8* %.tmp5214, i8* %.tmp5215, i8* %.tmp5216, i8* %.tmp5218, i32 %.tmp5219)
%.tmp5221 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5222 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5223 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5222, i32 0, i32 7
%.tmp5224 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5223
%.tmp5225 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5224, i32 0, i32 7
%.tmp5226 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5225
%.tmp5227 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_info
%.tmp5228 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,%m1777$.AssignableInfo.type*) @m1777$get_dotted_name.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5221, %m286$.Node.type* %.tmp5226, %m1777$.AssignableInfo.type* %.tmp5227)
ret %m1777$.AssignableInfo.type* %.tmp5228
br label %.if.end.5063
.if.false.5063:
%.tmp5229 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5230 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5229, i32 0, i32 2
%.tmp5231 = load i8*, i8** %.tmp5230
%.tmp5233 = getelementptr [9 x i8], [9 x i8]*@.str5232, i32 0, i32 0
%.tmp5234 = call i32(i8*,i8*) @strcmp(i8* %.tmp5231, i8* %.tmp5233)
%.tmp5235 = icmp eq i32 %.tmp5234, 0
br i1 %.tmp5235, label %.if.true.5236, label %.if.false.5236
.if.true.5236:
%.tmp5237 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp5237
br label %.if.end.5236
.if.false.5236:
br label %.if.end.5236
.if.end.5236:
br label %.if.end.5063
.if.end.5063:
br label %.if.end.5026
.if.end.5026:
%.tmp5238 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5239 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5241 = getelementptr [43 x i8], [43 x i8]*@.str5240, i32 0, i32 0
%.tmp5242 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5238, %m286$.Node.type* %.tmp5239, i8* %.tmp5241)
%.tmp5243 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5244 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5243, i32 0, i32 2
%.tmp5245 = load i8*, i8** %.tmp5244
%.tmp5246 = call i32(i8*,...) @printf(i8* %.tmp5242, i8* %.tmp5245)
%.tmp5247 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5247
}
define %m1777$.AssignableInfo.type* @m1777$compile_addr.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp5248 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5248, %m286$.Node.type** %curr_node
%.tmp5249 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5250 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5249, i32 0, i32 0
%.tmp5251 = load i8*, i8** %.tmp5250
%.tmp5253 = getelementptr [12 x i8], [12 x i8]*@.str5252, i32 0, i32 0
%.tmp5254 = call i32(i8*,i8*) @strcmp(i8* %.tmp5251, i8* %.tmp5253)
%.tmp5255 = icmp ne i32 %.tmp5254, 0
br i1 %.tmp5255, label %.if.true.5256, label %.if.false.5256
.if.true.5256:
%.tmp5258 = getelementptr [92 x i8], [92 x i8]*@.str5257, i32 0, i32 0
%.tmp5259 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5260 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5259, i32 0, i32 0
%.tmp5261 = load i8*, i8** %.tmp5260
%.tmp5262 = call i32(i8*,...) @printf(i8* %.tmp5258, i8* %.tmp5261)
%.tmp5263 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp5264 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5263, i32 0, i32 6
%.tmp5265 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5264
store %m286$.Node.type* %.tmp5265, %m286$.Node.type** %curr_node
br label %.if.end.5256
.if.false.5256:
br label %.if.end.5256
.if.end.5256:
%.tmp5266 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5267 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5266, i32 0, i32 6
%.tmp5268 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5267
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5268, %m286$.Node.type** %assignable_name
%.tmp5269 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5270 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5271 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5270, i32 0, i32 6
%.tmp5272 = load i8*, i8** %.tmp5271
%.tmp5273 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5274 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5273, i32 0, i32 6
%.tmp5275 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5274
%.tmp5276 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5275, i32 0, i32 1
%.tmp5277 = load i8*, i8** %.tmp5276
%.tmp5278 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,i8*,i8*) @m1777$find_defined_str.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.cp(%m1777$.CompilerCtx.type* %.tmp5269, i8* %.tmp5272, i8* %.tmp5277)
%scope_info = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp5278, %m1777$.ScopeItem.type** %scope_info
%.tmp5279 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %scope_info
%.tmp5280 = icmp eq %m1777$.ScopeItem.type* %.tmp5279, null
br i1 %.tmp5280, label %.if.true.5281, label %.if.false.5281
.if.true.5281:
%.tmp5282 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5284 = getelementptr [41 x i8], [41 x i8]*@.str5283, i32 0, i32 0
%.tmp5285 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5286 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5285, i32 0, i32 6
%.tmp5287 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5286
%.tmp5288 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5287, i32 0, i32 1
%.tmp5289 = load i8*, i8** %.tmp5288
%.tmp5290 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5282, i8* %.tmp5284, i8* %.tmp5289)
%.tmp5291 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5292 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5293 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5291, %m286$.Node.type* %.tmp5292, i8* %.tmp5293)
%.tmp5294 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5294
br label %.if.end.5281
.if.false.5281:
br label %.if.end.5281
.if.end.5281:
%.tmp5295 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %scope_info
%.tmp5296 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp5295, i32 0, i32 1
%.tmp5297 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp5296
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5297, %m1777$.AssignableInfo.type** %info
%.tmp5298 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5299 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5298, i32 0, i32 2
%.tmp5300 = load i8*, i8** %.tmp5299
%.tmp5302 = getelementptr [7 x i8], [7 x i8]*@.str5301, i32 0, i32 0
%.tmp5303 = call i32(i8*,i8*) @strcmp(i8* %.tmp5300, i8* %.tmp5302)
%.tmp5304 = icmp eq i32 %.tmp5303, 0
br i1 %.tmp5304, label %.if.true.5305, label %.if.false.5305
.if.true.5305:
%.tmp5306 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5307 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5308 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5307)
%.tmp5309 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5310 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5309, i32 0, i32 6
%.tmp5311 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5310
%.tmp5312 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5311, i32 0, i32 7
%.tmp5313 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5312
%.tmp5314 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5313, i32 0, i32 7
%.tmp5315 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5314
%.tmp5316 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5315, i32 0, i32 1
%.tmp5317 = load i8*, i8** %.tmp5316
%.tmp5318 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,i8*,i8*) @m1777$find_defined_str.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.cp.cp(%m1777$.CompilerCtx.type* %.tmp5306, i8* %.tmp5308, i8* %.tmp5317)
store %m1777$.ScopeItem.type* %.tmp5318, %m1777$.ScopeItem.type** %scope_info
%.tmp5319 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %scope_info
%.tmp5320 = icmp eq %m1777$.ScopeItem.type* %.tmp5319, null
br i1 %.tmp5320, label %.if.true.5321, label %.if.false.5321
.if.true.5321:
%.tmp5322 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5324 = getelementptr [31 x i8], [31 x i8]*@.str5323, i32 0, i32 0
%.tmp5325 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5326 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5325, i32 0, i32 6
%.tmp5327 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5326
%.tmp5328 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5327, i32 0, i32 7
%.tmp5329 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5328
%.tmp5330 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5329, i32 0, i32 7
%.tmp5331 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5330
%.tmp5332 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5331, i32 0, i32 1
%.tmp5333 = load i8*, i8** %.tmp5332
%.tmp5334 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5335 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5334)
%.tmp5336 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5322, i8* %.tmp5324, i8* %.tmp5333, i8* %.tmp5335)
%.tmp5337 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5338 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5339 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5337, %m286$.Node.type* %.tmp5338, i8* %.tmp5339)
%.tmp5340 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5340
br label %.if.end.5321
.if.false.5321:
br label %.if.end.5321
.if.end.5321:
%.tmp5341 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %scope_info
%.tmp5342 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp5341, i32 0, i32 1
%.tmp5343 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp5342
store %m1777$.AssignableInfo.type* %.tmp5343, %m1777$.AssignableInfo.type** %info
%.tmp5344 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5345 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5344, i32 0, i32 6
%.tmp5346 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5345
%.tmp5347 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5346, i32 0, i32 7
%.tmp5348 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5347
%.tmp5349 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5348, i32 0, i32 7
%.tmp5350 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5349
store %m286$.Node.type* %.tmp5350, %m286$.Node.type** %assignable_name
br label %.if.end.5305
.if.false.5305:
%.tmp5351 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5352 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5351, i32 0, i32 6
%.tmp5353 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5352
store %m286$.Node.type* %.tmp5353, %m286$.Node.type** %assignable_name
br label %.if.end.5305
.if.end.5305:
%.tmp5354 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5355 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5356 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5357 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,%m1777$.AssignableInfo.type*) @m1777$get_dotted_name.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5354, %m286$.Node.type* %.tmp5355, %m1777$.AssignableInfo.type* %.tmp5356)
%base = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5357, %m1777$.AssignableInfo.type** %base
%.tmp5359 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5360 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5359, i32 0, i32 6
%.tmp5361 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5360
%.tmp5362 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5361, i32 0, i32 7
%.tmp5363 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5362
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5363, %m286$.Node.type** %addr
br label %.for.start.5358
.for.start.5358:
%.tmp5364 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5365 = icmp ne %m286$.Node.type* %.tmp5364, null
br i1 %.tmp5365, label %.for.continue.5358, label %.for.end.5358
.for.continue.5358:
%.tmp5366 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5367 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5366, i32 0, i32 7
%.tmp5368 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5367
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5368, %m286$.Node.type** %index
%.tmp5369 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5370 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp5371 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp5369, %m286$.Node.type* %.tmp5370)
%index_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5371, %m1777$.AssignableInfo.type** %index_info
%.tmp5372 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5373 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base
%.tmp5374 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5373, i32 0, i32 3
%.tmp5375 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5374
%.tmp5376 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5372, %m1777$.Type.type* %.tmp5375)
%base_type = alloca i8*
store i8* %.tmp5376, i8** %base_type
%.tmp5377 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5378 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %index_info
%.tmp5379 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5378, i32 0, i32 3
%.tmp5380 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5379
%.tmp5381 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5377, %m1777$.Type.type* %.tmp5380)
%index_type = alloca i8*
store i8* %.tmp5381, i8** %index_type
%.tmp5382 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5383 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp5382)
%tmp_id = alloca i32
store i32 %.tmp5383, i32* %tmp_id
%.tmp5384 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5385 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5384, i32 0, i32 1
%.tmp5386 = load %m0$.File.type*, %m0$.File.type** %.tmp5385
%.tmp5388 = getelementptr [28 x i8], [28 x i8]*@.str5387, i32 0, i32 0
%.tmp5389 = load i32, i32* %tmp_id
%.tmp5390 = load i8*, i8** %base_type
%.tmp5391 = load i8*, i8** %base_type
%.tmp5392 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base
%.tmp5393 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5392)
%.tmp5394 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5386, i8* %.tmp5388, i32 %.tmp5389, i8* %.tmp5390, i8* %.tmp5391, i8* %.tmp5393)
%.tmp5395 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5396 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5395)
%new_base = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5396, %m1777$.AssignableInfo.type** %new_base
%.tmp5397 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5398 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5397, %m1777$.AssignableInfo.type* %.tmp5398)
%.tmp5399 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base
%.tmp5400 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5399, i32 0, i32 3
%.tmp5401 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5400
%.tmp5402 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5401, i32 0, i32 3
%.tmp5403 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5402
%.tmp5404 = icmp eq %m1777$.Type.type* %.tmp5403, null
br i1 %.tmp5404, label %.if.true.5405, label %.if.false.5405
.if.true.5405:
%.tmp5406 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5408 = getelementptr [35 x i8], [35 x i8]*@.str5407, i32 0, i32 0
%.tmp5409 = load i8*, i8** %base_type
%.tmp5410 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5406, i8* %.tmp5408, i8* %.tmp5409)
%.tmp5411 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5412 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5413 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5411, %m286$.Node.type* %.tmp5412, i8* %.tmp5413)
%.tmp5414 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base
ret %m1777$.AssignableInfo.type* %.tmp5414
br label %.if.end.5405
.if.false.5405:
br label %.if.end.5405
.if.end.5405:
%.tmp5415 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
%.tmp5416 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5415, i32 0, i32 3
%.tmp5417 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base
%.tmp5418 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5417, i32 0, i32 3
%.tmp5419 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5418
%.tmp5420 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5419, i32 0, i32 3
%.tmp5421 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5420
store %m1777$.Type.type* %.tmp5421, %m1777$.Type.type** %.tmp5416
%.tmp5422 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5423 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
%.tmp5424 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5423, i32 0, i32 3
%.tmp5425 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5424
%.tmp5426 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5422, %m1777$.Type.type* %.tmp5425)
%base_type_2 = alloca i8*
store i8* %.tmp5426, i8** %base_type_2
%.tmp5427 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5428 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5427, i32 0, i32 1
%.tmp5429 = load %m0$.File.type*, %m0$.File.type** %.tmp5428
%.tmp5431 = getelementptr [44 x i8], [44 x i8]*@.str5430, i32 0, i32 0
%.tmp5432 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
%.tmp5433 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5432)
%.tmp5434 = load i8*, i8** %base_type_2
%.tmp5435 = load i8*, i8** %base_type_2
%.tmp5436 = load i32, i32* %tmp_id
%.tmp5437 = load i8*, i8** %index_type
%.tmp5438 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %index_info
%.tmp5439 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5438)
%.tmp5440 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5429, i8* %.tmp5431, i8* %.tmp5433, i8* %.tmp5434, i8* %.tmp5435, i32 %.tmp5436, i8* %.tmp5437, i8* %.tmp5439)
%.tmp5441 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %new_base
store %m1777$.AssignableInfo.type* %.tmp5441, %m1777$.AssignableInfo.type** %base
%.tmp5442 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5443 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5442, i32 0, i32 7
%.tmp5444 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5443
%.tmp5445 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5444, i32 0, i32 7
%.tmp5446 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5445
%.tmp5447 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5446, i32 0, i32 7
%.tmp5448 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5447
store %m286$.Node.type* %.tmp5448, %m286$.Node.type** %addr
br label %.for.start.5358
.for.end.5358:
%.tmp5449 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %base
ret %m1777$.AssignableInfo.type* %.tmp5449
}
%m1777$.StackHead.type = type {%m1898$.SYStack.type*}
define %m1777$.AssignableInfo.type* @m1777$compile_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5450 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5451 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5450, i32 0, i32 6
%.tmp5452 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5451
%.tmp5453 = icmp eq %m286$.Node.type* %.tmp5452, null
br i1 %.tmp5453, label %.if.true.5454, label %.if.false.5454
.if.true.5454:
%.tmp5456 = getelementptr [15 x i8], [15 x i8]*@.str5455, i32 0, i32 0
%.tmp5457 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5458 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5457, i32 0, i32 0
%.tmp5459 = load i8*, i8** %.tmp5458
%.tmp5460 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5461 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5460, i32 0, i32 1
%.tmp5462 = load i8*, i8** %.tmp5461
%.tmp5463 = call i32(i8*,...) @printf(i8* %.tmp5456, i8* %.tmp5459, i8* %.tmp5462)
br label %.if.end.5454
.if.false.5454:
br label %.if.end.5454
.if.end.5454:
%.tmp5464 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5465 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5464, i32 0, i32 6
%.tmp5466 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5465
%.tmp5468 = getelementptr [16 x i8], [16 x i8]*@.str5467, i32 0, i32 0
%.tmp5469 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5466, i8* %.tmp5468)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5469, %m286$.Node.type** %assignable_start
%.tmp5470 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp5471 = call %m1898$.SYStack.type*(%m286$.Node.type*) @m1898$sy_algorithm.m1898$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5470)
%operator_stack = alloca %m1898$.SYStack.type*
store %m1898$.SYStack.type* %.tmp5471, %m1898$.SYStack.type** %operator_stack
%.tmp5472 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* null, i32 1
%.tmp5473 = ptrtoint %m1777$.StackHead.type* %.tmp5472 to i32
%.tmp5474 = call i8*(i32) @malloc(i32 %.tmp5473)
%.tmp5475 = bitcast i8* %.tmp5474 to %m1777$.StackHead.type*
%stack = alloca %m1777$.StackHead.type*
store %m1777$.StackHead.type* %.tmp5475, %m1777$.StackHead.type** %stack
%.tmp5476 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5477 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5476, i32 0, i32 0
%.tmp5478 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %operator_stack
store %m1898$.SYStack.type* %.tmp5478, %m1898$.SYStack.type** %.tmp5477
%.tmp5479 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5480 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5481 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m1777$.StackHead.type*) @m1777$compile_assignable_stack.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m1777$.StackHead.typep(%m1777$.CompilerCtx.type* %.tmp5479, %m1777$.StackHead.type* %.tmp5480)
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5481, %m1777$.AssignableInfo.type** %info
%.tmp5482 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5483 = icmp eq %m1777$.AssignableInfo.type* %.tmp5482, null
br i1 %.tmp5483, label %.if.true.5484, label %.if.false.5484
.if.true.5484:
%.tmp5485 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp5485
br label %.if.end.5484
.if.false.5484:
br label %.if.end.5484
.if.end.5484:
%.tmp5486 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5487 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5486, i32 0, i32 6
%.tmp5488 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5487
%.tmp5490 = getelementptr [5 x i8], [5 x i8]*@.str5489, i32 0, i32 0
%.tmp5491 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5488, i8* %.tmp5490)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5491, %m286$.Node.type** %cast
%.tmp5492 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5493 = icmp ne %m286$.Node.type* %.tmp5492, null
br i1 %.tmp5493, label %.if.true.5494, label %.if.false.5494
.if.true.5494:
%.tmp5495 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5496 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5495, i32 0, i32 6
%.tmp5497 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5496
%.tmp5499 = getelementptr [5 x i8], [5 x i8]*@.str5498, i32 0, i32 0
%.tmp5500 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5497, i8* %.tmp5499)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5500, %m286$.Node.type** %cast_type
%.tmp5501 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5502 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5503 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5502, i32 0, i32 6
%.tmp5504 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5503
%.tmp5505 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp5501, %m286$.Node.type* %.tmp5504)
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp5505, %m1777$.Type.type** %type
%.tmp5506 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5507 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5506)
%prev_id = alloca i8*
store i8* %.tmp5507, i8** %prev_id
%.tmp5508 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5509 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5508, %m1777$.AssignableInfo.type* %.tmp5509)
%.tmp5510 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5511 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5512 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5511, i32 0, i32 3
%.tmp5513 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5512
%.tmp5514 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5510, %m1777$.Type.type* %.tmp5513)
%from_type = alloca i8*
store i8* %.tmp5514, i8** %from_type
%.tmp5515 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5516 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp5517 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5515, %m1777$.Type.type* %.tmp5516)
%to_type = alloca i8*
store i8* %.tmp5517, i8** %to_type
%.tmp5519 = getelementptr [8 x i8], [8 x i8]*@.str5518, i32 0, i32 0
%cast_fn = alloca i8*
store i8* %.tmp5519, i8** %cast_fn
%.tmp5520 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5521 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5520, i32 0, i32 3
%.tmp5522 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5521
%.tmp5523 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5522, i32 0, i32 0
%.tmp5524 = load i8*, i8** %.tmp5523
%.tmp5526 = getelementptr [4 x i8], [4 x i8]*@.str5525, i32 0, i32 0
%.tmp5527 = call i32(i8*,i8*) @strcmp(i8* %.tmp5524, i8* %.tmp5526)
%.tmp5528 = icmp ne i32 %.tmp5527, 0
%.tmp5529 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp5530 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5529, i32 0, i32 0
%.tmp5531 = load i8*, i8** %.tmp5530
%.tmp5533 = getelementptr [4 x i8], [4 x i8]*@.str5532, i32 0, i32 0
%.tmp5534 = call i32(i8*,i8*) @strcmp(i8* %.tmp5531, i8* %.tmp5533)
%.tmp5535 = icmp ne i32 %.tmp5534, 0
%.tmp5536 = and i1 %.tmp5528, %.tmp5535
br i1 %.tmp5536, label %.if.true.5537, label %.if.false.5537
.if.true.5537:
%.tmp5538 = load i8*, i8** %from_type
%.tmp5539 = getelementptr i8, i8* %.tmp5538, i32 0
%.tmp5540 = load i8, i8* %.tmp5539
%.tmp5541 = icmp eq i8 %.tmp5540, 105
%.tmp5542 = load i8*, i8** %to_type
%.tmp5543 = getelementptr i8, i8* %.tmp5542, i32 0
%.tmp5544 = load i8, i8* %.tmp5543
%.tmp5545 = icmp eq i8 %.tmp5544, 105
%.tmp5546 = and i1 %.tmp5541, %.tmp5545
br i1 %.tmp5546, label %.if.true.5547, label %.if.false.5547
.if.true.5547:
%from_size = alloca i32
store i32 0, i32* %from_size
%to_size = alloca i32
store i32 0, i32* %to_size
%.tmp5548 = load i8*, i8** %from_type
%.tmp5550 = getelementptr [4 x i8], [4 x i8]*@.str5549, i32 0, i32 0
%.tmp5551 = getelementptr i32, i32* %from_size, i32 0
%.tmp5552 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5548, i8* %.tmp5550, i32* %.tmp5551)
%.tmp5553 = load i8*, i8** %to_type
%.tmp5555 = getelementptr [4 x i8], [4 x i8]*@.str5554, i32 0, i32 0
%.tmp5556 = getelementptr i32, i32* %to_size, i32 0
%.tmp5557 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5553, i8* %.tmp5555, i32* %.tmp5556)
%.tmp5558 = load i32, i32* %from_size
%.tmp5559 = load i32, i32* %to_size
%.tmp5560 = icmp slt i32 %.tmp5558, %.tmp5559
br i1 %.tmp5560, label %.if.true.5561, label %.if.false.5561
.if.true.5561:
%.tmp5563 = getelementptr [5 x i8], [5 x i8]*@.str5562, i32 0, i32 0
store i8* %.tmp5563, i8** %cast_fn
br label %.if.end.5561
.if.false.5561:
%.tmp5565 = getelementptr [6 x i8], [6 x i8]*@.str5564, i32 0, i32 0
store i8* %.tmp5565, i8** %cast_fn
br label %.if.end.5561
.if.end.5561:
br label %.if.end.5547
.if.false.5547:
br label %.if.end.5547
.if.end.5547:
br label %.if.end.5537
.if.false.5537:
br label %.if.end.5537
.if.end.5537:
%.tmp5566 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5567 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5566, i32 0, i32 1
%.tmp5568 = load %m0$.File.type*, %m0$.File.type** %.tmp5567
%.tmp5570 = getelementptr [21 x i8], [21 x i8]*@.str5569, i32 0, i32 0
%.tmp5571 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5572 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5571)
%.tmp5573 = load i8*, i8** %cast_fn
%.tmp5574 = load i8*, i8** %from_type
%.tmp5575 = load i8*, i8** %prev_id
%.tmp5576 = load i8*, i8** %to_type
%.tmp5577 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5568, i8* %.tmp5570, i8* %.tmp5572, i8* %.tmp5573, i8* %.tmp5574, i8* %.tmp5575, i8* %.tmp5576)
%.tmp5578 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp5579 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5578, i32 0, i32 3
%.tmp5580 = load %m1777$.Type.type*, %m1777$.Type.type** %type
store %m1777$.Type.type* %.tmp5580, %m1777$.Type.type** %.tmp5579
br label %.if.end.5494
.if.false.5494:
br label %.if.end.5494
.if.end.5494:
%.tmp5581 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp5581
}
define %m1777$.AssignableInfo.type* @m1777$compile_assignable_stack.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m1777$.StackHead.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stack = alloca %m1777$.StackHead.type*
store %m1777$.StackHead.type* %.stack.arg, %m1777$.StackHead.type** %stack
%.tmp5582 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5583 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5582, i32 0, i32 0
%.tmp5584 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5583
%.tmp5585 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp5584, i32 0, i32 0
%.tmp5586 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5585
%.tmp5587 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5586, i32 0, i32 0
%.tmp5588 = load i8*, i8** %.tmp5587
%.tmp5590 = getelementptr [16 x i8], [16 x i8]*@.str5589, i32 0, i32 0
%.tmp5591 = call i32(i8*,i8*) @strcmp(i8* %.tmp5588, i8* %.tmp5590)
%.tmp5592 = icmp eq i32 %.tmp5591, 0
br i1 %.tmp5592, label %.if.true.5593, label %.if.false.5593
.if.true.5593:
%.tmp5594 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5595 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5596 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5595, i32 0, i32 0
%.tmp5597 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5596
%.tmp5598 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp5597, i32 0, i32 0
%.tmp5599 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5598
%.tmp5600 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_mono_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp5594, %m286$.Node.type* %.tmp5599)
ret %m1777$.AssignableInfo.type* %.tmp5600
br label %.if.end.5593
.if.false.5593:
br label %.if.end.5593
.if.end.5593:
%.tmp5601 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5602 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5601, i32 0, i32 0
%.tmp5603 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5602
%.tmp5604 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp5603, i32 0, i32 0
%.tmp5605 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5604
%.tmp5606 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5605, i32 0, i32 6
%.tmp5607 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5606
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5607, %m286$.Node.type** %operator
%.tmp5608 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5609 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5608, i32 0, i32 0
%.tmp5610 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5611 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5610, i32 0, i32 0
%.tmp5612 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5611
%.tmp5613 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp5612, i32 0, i32 1
%.tmp5614 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5613
store %m1898$.SYStack.type* %.tmp5614, %m1898$.SYStack.type** %.tmp5609
%.tmp5615 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5616 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5617 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m1777$.StackHead.type*) @m1777$compile_assignable_stack.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m1777$.StackHead.typep(%m1777$.CompilerCtx.type* %.tmp5615, %m1777$.StackHead.type* %.tmp5616)
%A = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5617, %m1777$.AssignableInfo.type** %A
%.tmp5618 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %A
%.tmp5619 = icmp eq %m1777$.AssignableInfo.type* %.tmp5618, null
br i1 %.tmp5619, label %.if.true.5620, label %.if.false.5620
.if.true.5620:
%.tmp5621 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %A
ret %m1777$.AssignableInfo.type* %.tmp5621
br label %.if.end.5620
.if.false.5620:
br label %.if.end.5620
.if.end.5620:
%.tmp5622 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5623 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5622, i32 0, i32 0
%.tmp5624 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5625 = getelementptr %m1777$.StackHead.type, %m1777$.StackHead.type* %.tmp5624, i32 0, i32 0
%.tmp5626 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5625
%.tmp5627 = getelementptr %m1898$.SYStack.type, %m1898$.SYStack.type* %.tmp5626, i32 0, i32 1
%.tmp5628 = load %m1898$.SYStack.type*, %m1898$.SYStack.type** %.tmp5627
store %m1898$.SYStack.type* %.tmp5628, %m1898$.SYStack.type** %.tmp5623
%.tmp5629 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5630 = load %m1777$.StackHead.type*, %m1777$.StackHead.type** %stack
%.tmp5631 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m1777$.StackHead.type*) @m1777$compile_assignable_stack.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m1777$.StackHead.typep(%m1777$.CompilerCtx.type* %.tmp5629, %m1777$.StackHead.type* %.tmp5630)
%B = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5631, %m1777$.AssignableInfo.type** %B
%.tmp5632 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %B
%.tmp5633 = icmp eq %m1777$.AssignableInfo.type* %.tmp5632, null
br i1 %.tmp5633, label %.if.true.5634, label %.if.false.5634
.if.true.5634:
%.tmp5635 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %B
ret %m1777$.AssignableInfo.type* %.tmp5635
br label %.if.end.5634
.if.false.5634:
br label %.if.end.5634
.if.end.5634:
%.tmp5636 = bitcast ptr null to %m286$.Node.type*
%.tmp5637 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5636)
%op_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5637, %m1777$.AssignableInfo.type** %op_info
%.tmp5638 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %op_info
%.tmp5639 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5638, i32 0, i32 3
%.tmp5640 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5641 = call %m1777$.Type.type*(%m286$.Node.type*) @m1777$operator_type.m1777$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5640)
store %m1777$.Type.type* %.tmp5641, %m1777$.Type.type** %.tmp5639
%.tmp5642 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5643 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %op_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5642, %m1777$.AssignableInfo.type* %.tmp5643)
%.tmp5644 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5645 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp5644, i32 0, i32 1
%.tmp5646 = load %m0$.File.type*, %m0$.File.type** %.tmp5645
%.tmp5648 = getelementptr [19 x i8], [19 x i8]*@.str5647, i32 0, i32 0
%.tmp5649 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %op_info
%.tmp5650 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5649)
%.tmp5651 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5652 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5653 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$operator_op.cp.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp5651, %m286$.Node.type* %.tmp5652)
%.tmp5654 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5655 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %A
%.tmp5656 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5655, i32 0, i32 3
%.tmp5657 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5656
%.tmp5658 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5654, %m1777$.Type.type* %.tmp5657)
%.tmp5659 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %A
%.tmp5660 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5659)
%.tmp5661 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %B
%.tmp5662 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp5661)
%.tmp5663 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5646, i8* %.tmp5648, i8* %.tmp5650, i8* %.tmp5653, i8* %.tmp5658, i8* %.tmp5660, i8* %.tmp5662)
%.tmp5664 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %op_info
ret %m1777$.AssignableInfo.type* %.tmp5664
}
define i8* @m1777$operator_op.cp.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5665 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5666 = icmp eq %m286$.Node.type* %.tmp5665, null
br i1 %.tmp5666, label %.if.true.5667, label %.if.false.5667
.if.true.5667:
%.tmp5668 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5669 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5671 = getelementptr [31 x i8], [31 x i8]*@.str5670, i32 0, i32 0
%.tmp5672 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5668, %m286$.Node.type* %.tmp5669, i8* %.tmp5671)
%.tmp5673 = call i32(i8*,...) @printf(i8* %.tmp5672)
br label %.if.end.5667
.if.false.5667:
br label %.if.end.5667
.if.end.5667:
%.tmp5674 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5675 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5674, i32 0, i32 1
%.tmp5676 = load i8*, i8** %.tmp5675
%.tmp5678 = getelementptr [2 x i8], [2 x i8]*@.str5677, i32 0, i32 0
%.tmp5679 = call i32(i8*,i8*) @strcmp(i8* %.tmp5676, i8* %.tmp5678)
%.tmp5680 = icmp eq i32 %.tmp5679, 0
br i1 %.tmp5680, label %.if.true.5681, label %.if.false.5681
.if.true.5681:
%.tmp5683 = getelementptr [4 x i8], [4 x i8]*@.str5682, i32 0, i32 0
ret i8* %.tmp5683
br label %.if.end.5681
.if.false.5681:
%.tmp5684 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5685 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5684, i32 0, i32 1
%.tmp5686 = load i8*, i8** %.tmp5685
%.tmp5688 = getelementptr [2 x i8], [2 x i8]*@.str5687, i32 0, i32 0
%.tmp5689 = call i32(i8*,i8*) @strcmp(i8* %.tmp5686, i8* %.tmp5688)
%.tmp5690 = icmp eq i32 %.tmp5689, 0
br i1 %.tmp5690, label %.if.true.5691, label %.if.false.5691
.if.true.5691:
%.tmp5693 = getelementptr [4 x i8], [4 x i8]*@.str5692, i32 0, i32 0
ret i8* %.tmp5693
br label %.if.end.5691
.if.false.5691:
%.tmp5694 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5695 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5694, i32 0, i32 1
%.tmp5696 = load i8*, i8** %.tmp5695
%.tmp5698 = getelementptr [2 x i8], [2 x i8]*@.str5697, i32 0, i32 0
%.tmp5699 = call i32(i8*,i8*) @strcmp(i8* %.tmp5696, i8* %.tmp5698)
%.tmp5700 = icmp eq i32 %.tmp5699, 0
br i1 %.tmp5700, label %.if.true.5701, label %.if.false.5701
.if.true.5701:
%.tmp5703 = getelementptr [4 x i8], [4 x i8]*@.str5702, i32 0, i32 0
ret i8* %.tmp5703
br label %.if.end.5701
.if.false.5701:
%.tmp5704 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5705 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5704, i32 0, i32 1
%.tmp5706 = load i8*, i8** %.tmp5705
%.tmp5708 = getelementptr [2 x i8], [2 x i8]*@.str5707, i32 0, i32 0
%.tmp5709 = call i32(i8*,i8*) @strcmp(i8* %.tmp5706, i8* %.tmp5708)
%.tmp5710 = icmp eq i32 %.tmp5709, 0
br i1 %.tmp5710, label %.if.true.5711, label %.if.false.5711
.if.true.5711:
%.tmp5713 = getelementptr [5 x i8], [5 x i8]*@.str5712, i32 0, i32 0
ret i8* %.tmp5713
br label %.if.end.5711
.if.false.5711:
%.tmp5714 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5715 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5714, i32 0, i32 1
%.tmp5716 = load i8*, i8** %.tmp5715
%.tmp5718 = getelementptr [3 x i8], [3 x i8]*@.str5717, i32 0, i32 0
%.tmp5719 = call i32(i8*,i8*) @strcmp(i8* %.tmp5716, i8* %.tmp5718)
%.tmp5720 = icmp eq i32 %.tmp5719, 0
br i1 %.tmp5720, label %.if.true.5721, label %.if.false.5721
.if.true.5721:
%.tmp5723 = getelementptr [8 x i8], [8 x i8]*@.str5722, i32 0, i32 0
ret i8* %.tmp5723
br label %.if.end.5721
.if.false.5721:
%.tmp5724 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5725 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5724, i32 0, i32 1
%.tmp5726 = load i8*, i8** %.tmp5725
%.tmp5728 = getelementptr [3 x i8], [3 x i8]*@.str5727, i32 0, i32 0
%.tmp5729 = call i32(i8*,i8*) @strcmp(i8* %.tmp5726, i8* %.tmp5728)
%.tmp5730 = icmp eq i32 %.tmp5729, 0
br i1 %.tmp5730, label %.if.true.5731, label %.if.false.5731
.if.true.5731:
%.tmp5733 = getelementptr [8 x i8], [8 x i8]*@.str5732, i32 0, i32 0
ret i8* %.tmp5733
br label %.if.end.5731
.if.false.5731:
%.tmp5734 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5735 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5734, i32 0, i32 1
%.tmp5736 = load i8*, i8** %.tmp5735
%.tmp5738 = getelementptr [2 x i8], [2 x i8]*@.str5737, i32 0, i32 0
%.tmp5739 = call i32(i8*,i8*) @strcmp(i8* %.tmp5736, i8* %.tmp5738)
%.tmp5740 = icmp eq i32 %.tmp5739, 0
br i1 %.tmp5740, label %.if.true.5741, label %.if.false.5741
.if.true.5741:
%.tmp5743 = getelementptr [9 x i8], [9 x i8]*@.str5742, i32 0, i32 0
ret i8* %.tmp5743
br label %.if.end.5741
.if.false.5741:
%.tmp5744 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5745 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5744, i32 0, i32 1
%.tmp5746 = load i8*, i8** %.tmp5745
%.tmp5748 = getelementptr [2 x i8], [2 x i8]*@.str5747, i32 0, i32 0
%.tmp5749 = call i32(i8*,i8*) @strcmp(i8* %.tmp5746, i8* %.tmp5748)
%.tmp5750 = icmp eq i32 %.tmp5749, 0
br i1 %.tmp5750, label %.if.true.5751, label %.if.false.5751
.if.true.5751:
%.tmp5753 = getelementptr [9 x i8], [9 x i8]*@.str5752, i32 0, i32 0
ret i8* %.tmp5753
br label %.if.end.5751
.if.false.5751:
%.tmp5754 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5755 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5754, i32 0, i32 1
%.tmp5756 = load i8*, i8** %.tmp5755
%.tmp5758 = getelementptr [2 x i8], [2 x i8]*@.str5757, i32 0, i32 0
%.tmp5759 = call i32(i8*,i8*) @strcmp(i8* %.tmp5756, i8* %.tmp5758)
%.tmp5760 = icmp eq i32 %.tmp5759, 0
br i1 %.tmp5760, label %.if.true.5761, label %.if.false.5761
.if.true.5761:
%.tmp5763 = getelementptr [4 x i8], [4 x i8]*@.str5762, i32 0, i32 0
ret i8* %.tmp5763
br label %.if.end.5761
.if.false.5761:
%.tmp5764 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5765 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5764, i32 0, i32 1
%.tmp5766 = load i8*, i8** %.tmp5765
%.tmp5768 = getelementptr [2 x i8], [2 x i8]*@.str5767, i32 0, i32 0
%.tmp5769 = call i32(i8*,i8*) @strcmp(i8* %.tmp5766, i8* %.tmp5768)
%.tmp5770 = icmp eq i32 %.tmp5769, 0
br i1 %.tmp5770, label %.if.true.5771, label %.if.false.5771
.if.true.5771:
%.tmp5773 = getelementptr [3 x i8], [3 x i8]*@.str5772, i32 0, i32 0
ret i8* %.tmp5773
br label %.if.end.5771
.if.false.5771:
%.tmp5774 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5775 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5774, i32 0, i32 1
%.tmp5776 = load i8*, i8** %.tmp5775
%.tmp5778 = getelementptr [3 x i8], [3 x i8]*@.str5777, i32 0, i32 0
%.tmp5779 = call i32(i8*,i8*) @strcmp(i8* %.tmp5776, i8* %.tmp5778)
%.tmp5780 = icmp eq i32 %.tmp5779, 0
br i1 %.tmp5780, label %.if.true.5781, label %.if.false.5781
.if.true.5781:
%.tmp5783 = getelementptr [9 x i8], [9 x i8]*@.str5782, i32 0, i32 0
ret i8* %.tmp5783
br label %.if.end.5781
.if.false.5781:
%.tmp5784 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5785 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5784, i32 0, i32 1
%.tmp5786 = load i8*, i8** %.tmp5785
%.tmp5788 = getelementptr [3 x i8], [3 x i8]*@.str5787, i32 0, i32 0
%.tmp5789 = call i32(i8*,i8*) @strcmp(i8* %.tmp5786, i8* %.tmp5788)
%.tmp5790 = icmp eq i32 %.tmp5789, 0
br i1 %.tmp5790, label %.if.true.5791, label %.if.false.5791
.if.true.5791:
%.tmp5793 = getelementptr [9 x i8], [9 x i8]*@.str5792, i32 0, i32 0
ret i8* %.tmp5793
br label %.if.end.5791
.if.false.5791:
%.tmp5794 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5795 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5797 = getelementptr [30 x i8], [30 x i8]*@.str5796, i32 0, i32 0
%.tmp5798 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5794, %m286$.Node.type* %.tmp5795, i8* %.tmp5797)
%.tmp5799 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5800 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5799, i32 0, i32 1
%.tmp5801 = load i8*, i8** %.tmp5800
%.tmp5802 = call i32(i8*,...) @printf(i8* %.tmp5798, i8* %.tmp5801)
br label %.if.end.5791
.if.end.5791:
br label %.if.end.5781
.if.end.5781:
br label %.if.end.5771
.if.end.5771:
br label %.if.end.5761
.if.end.5761:
br label %.if.end.5751
.if.end.5751:
br label %.if.end.5741
.if.end.5741:
br label %.if.end.5731
.if.end.5731:
br label %.if.end.5721
.if.end.5721:
br label %.if.end.5711
.if.end.5711:
br label %.if.end.5701
.if.end.5701:
br label %.if.end.5691
.if.end.5691:
br label %.if.end.5681
.if.end.5681:
%.tmp5804 = getelementptr [4 x i8], [4 x i8]*@.str5803, i32 0, i32 0
ret i8* %.tmp5804
}
define %m1777$.Type.type* @m1777$operator_type.m1777$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5805 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp5805, %m1777$.Type.type** %type
%.tmp5806 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5807 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5806, i32 0, i32 1
%.tmp5808 = load i8*, i8** %.tmp5807
%.tmp5810 = getelementptr [3 x i8], [3 x i8]*@.str5809, i32 0, i32 0
%.tmp5811 = call i32(i8*,i8*) @strcmp(i8* %.tmp5808, i8* %.tmp5810)
%.tmp5812 = icmp eq i32 %.tmp5811, 0
%.tmp5813 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5814 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5813, i32 0, i32 1
%.tmp5815 = load i8*, i8** %.tmp5814
%.tmp5817 = getelementptr [3 x i8], [3 x i8]*@.str5816, i32 0, i32 0
%.tmp5818 = call i32(i8*,i8*) @strcmp(i8* %.tmp5815, i8* %.tmp5817)
%.tmp5819 = icmp eq i32 %.tmp5818, 0
%.tmp5820 = or i1 %.tmp5812, %.tmp5819
%.tmp5821 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5822 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5821, i32 0, i32 1
%.tmp5823 = load i8*, i8** %.tmp5822
%.tmp5825 = getelementptr [2 x i8], [2 x i8]*@.str5824, i32 0, i32 0
%.tmp5826 = call i32(i8*,i8*) @strcmp(i8* %.tmp5823, i8* %.tmp5825)
%.tmp5827 = icmp eq i32 %.tmp5826, 0
%.tmp5828 = or i1 %.tmp5820, %.tmp5827
%.tmp5829 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5830 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5829, i32 0, i32 1
%.tmp5831 = load i8*, i8** %.tmp5830
%.tmp5833 = getelementptr [2 x i8], [2 x i8]*@.str5832, i32 0, i32 0
%.tmp5834 = call i32(i8*,i8*) @strcmp(i8* %.tmp5831, i8* %.tmp5833)
%.tmp5835 = icmp eq i32 %.tmp5834, 0
%.tmp5836 = or i1 %.tmp5828, %.tmp5835
%.tmp5837 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5838 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5837, i32 0, i32 1
%.tmp5839 = load i8*, i8** %.tmp5838
%.tmp5841 = getelementptr [2 x i8], [2 x i8]*@.str5840, i32 0, i32 0
%.tmp5842 = call i32(i8*,i8*) @strcmp(i8* %.tmp5839, i8* %.tmp5841)
%.tmp5843 = icmp eq i32 %.tmp5842, 0
%.tmp5844 = or i1 %.tmp5836, %.tmp5843
%.tmp5845 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5846 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5845, i32 0, i32 1
%.tmp5847 = load i8*, i8** %.tmp5846
%.tmp5849 = getelementptr [2 x i8], [2 x i8]*@.str5848, i32 0, i32 0
%.tmp5850 = call i32(i8*,i8*) @strcmp(i8* %.tmp5847, i8* %.tmp5849)
%.tmp5851 = icmp eq i32 %.tmp5850, 0
%.tmp5852 = or i1 %.tmp5844, %.tmp5851
%.tmp5853 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5854 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5853, i32 0, i32 1
%.tmp5855 = load i8*, i8** %.tmp5854
%.tmp5857 = getelementptr [3 x i8], [3 x i8]*@.str5856, i32 0, i32 0
%.tmp5858 = call i32(i8*,i8*) @strcmp(i8* %.tmp5855, i8* %.tmp5857)
%.tmp5859 = icmp eq i32 %.tmp5858, 0
%.tmp5860 = or i1 %.tmp5852, %.tmp5859
%.tmp5861 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5862 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5861, i32 0, i32 1
%.tmp5863 = load i8*, i8** %.tmp5862
%.tmp5865 = getelementptr [3 x i8], [3 x i8]*@.str5864, i32 0, i32 0
%.tmp5866 = call i32(i8*,i8*) @strcmp(i8* %.tmp5863, i8* %.tmp5865)
%.tmp5867 = icmp eq i32 %.tmp5866, 0
%.tmp5868 = or i1 %.tmp5860, %.tmp5867
br i1 %.tmp5868, label %.if.true.5869, label %.if.false.5869
.if.true.5869:
%.tmp5870 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp5871 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5870, i32 0, i32 0
%.tmp5873 = getelementptr [5 x i8], [5 x i8]*@.str5872, i32 0, i32 0
store i8* %.tmp5873, i8** %.tmp5871
br label %.if.end.5869
.if.false.5869:
%.tmp5874 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp5875 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5874, i32 0, i32 0
%.tmp5877 = getelementptr [4 x i8], [4 x i8]*@.str5876, i32 0, i32 0
store i8* %.tmp5877, i8** %.tmp5875
br label %.if.end.5869
.if.end.5869:
%.tmp5878 = load %m1777$.Type.type*, %m1777$.Type.type** %type
ret %m1777$.Type.type* %.tmp5878
}
define %m1777$.AssignableInfo.type* @m1777$compile_mono_assignable.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5879 = bitcast ptr null to %m1777$.AssignableInfo.type*
%assignable_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5879, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5880 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5880, %m286$.Node.type** %mono
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp5881 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5882 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5881, i32 0, i32 6
%.tmp5883 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5882
%.tmp5884 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5883, i32 0, i32 0
%.tmp5885 = load i8*, i8** %.tmp5884
%.tmp5887 = getelementptr [7 x i8], [7 x i8]*@.str5886, i32 0, i32 0
%.tmp5888 = call i32(i8*,i8*) @strcmp(i8* %.tmp5885, i8* %.tmp5887)
%.tmp5889 = icmp eq i32 %.tmp5888, 0
br i1 %.tmp5889, label %.if.true.5890, label %.if.false.5890
.if.true.5890:
%.tmp5891 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5892 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5891)
store %m1777$.AssignableInfo.type* %.tmp5892, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5893 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5894 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5893, i32 0, i32 3
%.tmp5895 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp5895, %m1777$.Type.type** %.tmp5894
%.tmp5896 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5897 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5896, i32 0, i32 3
%.tmp5898 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5897
%.tmp5899 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5898, i32 0, i32 0
%.tmp5901 = getelementptr [4 x i8], [4 x i8]*@.str5900, i32 0, i32 0
store i8* %.tmp5901, i8** %.tmp5899
%.tmp5902 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5903 = load i8, i8* @SCOPE_CONST
%.tmp5904 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5905 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5904, i32 0, i32 6
%.tmp5906 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5905
%.tmp5907 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5906, i32 0, i32 1
%.tmp5908 = load i8*, i8** %.tmp5907
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp5902, i8 %.tmp5903, i8* %.tmp5908)
br label %.if.end.5890
.if.false.5890:
%.tmp5909 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5910 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5909, i32 0, i32 6
%.tmp5911 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5910
%.tmp5912 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5911, i32 0, i32 0
%.tmp5913 = load i8*, i8** %.tmp5912
%.tmp5915 = getelementptr [5 x i8], [5 x i8]*@.str5914, i32 0, i32 0
%.tmp5916 = call i32(i8*,i8*) @strcmp(i8* %.tmp5913, i8* %.tmp5915)
%.tmp5917 = icmp eq i32 %.tmp5916, 0
br i1 %.tmp5917, label %.if.true.5918, label %.if.false.5918
.if.true.5918:
%.tmp5919 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5920 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5919, i32 0, i32 6
%.tmp5921 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5920
%.tmp5922 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5921, i32 0, i32 1
%.tmp5923 = load i8*, i8** %.tmp5922
%.tmp5925 = getelementptr [5 x i8], [5 x i8]*@.str5924, i32 0, i32 0
%.tmp5926 = call i32(i8*,i8*) @strcmp(i8* %.tmp5923, i8* %.tmp5925)
%.tmp5927 = icmp ne i32 %.tmp5926, 0
br i1 %.tmp5927, label %.if.true.5928, label %.if.false.5928
.if.true.5928:
%.tmp5929 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5930 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5932 = getelementptr [42 x i8], [42 x i8]*@.str5931, i32 0, i32 0
%.tmp5933 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp5929, %m286$.Node.type* %.tmp5930, i8* %.tmp5932)
%.tmp5934 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5935 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5934, i32 0, i32 6
%.tmp5936 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5935
%.tmp5937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5936, i32 0, i32 1
%.tmp5938 = load i8*, i8** %.tmp5937
%.tmp5939 = call i32(i8*,...) @printf(i8* %.tmp5933, i8* %.tmp5938)
%.tmp5940 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp5940
br label %.if.end.5928
.if.false.5928:
br label %.if.end.5928
.if.end.5928:
%.tmp5941 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5942 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5941)
store %m1777$.AssignableInfo.type* %.tmp5942, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5943 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5944 = load i8, i8* @SCOPE_CONST
%.tmp5946 = getelementptr [5 x i8], [5 x i8]*@.str5945, i32 0, i32 0
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp5943, i8 %.tmp5944, i8* %.tmp5946)
%.tmp5947 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5948 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5947, i32 0, i32 3
%.tmp5949 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp5949, %m1777$.Type.type** %.tmp5948
%.tmp5950 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5951 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5950, i32 0, i32 3
%.tmp5952 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5951
%.tmp5953 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp5952, i32 0, i32 0
%.tmp5955 = getelementptr [8 x i8], [8 x i8]*@.str5954, i32 0, i32 0
store i8* %.tmp5955, i8** %.tmp5953
br label %.if.end.5918
.if.false.5918:
%.tmp5956 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5957 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5956, i32 0, i32 6
%.tmp5958 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5957
%.tmp5959 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5958, i32 0, i32 0
%.tmp5960 = load i8*, i8** %.tmp5959
%.tmp5962 = getelementptr [17 x i8], [17 x i8]*@.str5961, i32 0, i32 0
%.tmp5963 = call i32(i8*,i8*) @strcmp(i8* %.tmp5960, i8* %.tmp5962)
%.tmp5964 = icmp eq i32 %.tmp5963, 0
br i1 %.tmp5964, label %.if.true.5965, label %.if.false.5965
.if.true.5965:
%.tmp5966 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5967 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5966)
store %m1777$.AssignableInfo.type* %.tmp5967, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5968 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5969 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5968, i32 0, i32 6
%.tmp5970 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5969
%.tmp5971 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5970, i32 0, i32 6
%.tmp5972 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5971
%.tmp5974 = getelementptr [12 x i8], [12 x i8]*@.str5973, i32 0, i32 0
%.tmp5975 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5972, i8* %.tmp5974)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5975, %m286$.Node.type** %dest
%.tmp5976 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5977 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5978 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_addr.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp5976, %m286$.Node.type* %.tmp5977)
%var_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp5978, %m1777$.AssignableInfo.type** %var_info
%.tmp5979 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %var_info
%.tmp5980 = icmp eq %m1777$.AssignableInfo.type* %.tmp5979, null
br i1 %.tmp5980, label %.if.true.5981, label %.if.false.5981
.if.true.5981:
%.tmp5982 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
ret %m1777$.AssignableInfo.type* %.tmp5982
br label %.if.end.5981
.if.false.5981:
br label %.if.end.5981
.if.end.5981:
%.tmp5983 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5984 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %var_info
%.tmp5985 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5984, i32 0, i32 3
%.tmp5986 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5985
%.tmp5987 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp5983, %m1777$.Type.type* %.tmp5986)
%var_type_repr = alloca i8*
store i8* %.tmp5987, i8** %var_type_repr
%.tmp5988 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp5989 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp5988, %m1777$.AssignableInfo.type* %.tmp5989)
%.tmp5990 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp5991 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5990, i32 0, i32 3
%.tmp5992 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %var_info
%.tmp5993 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp5992, i32 0, i32 3
%.tmp5994 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp5993
store %m1777$.Type.type* %.tmp5994, %m1777$.Type.type** %.tmp5991
%.tmp5996 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5997 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5996, i32 0, i32 6
%.tmp5998 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5997
%.tmp5999 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5998, i32 0, i32 6
%.tmp6000 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5999
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6000, %m286$.Node.type** %ptr
br label %.for.start.5995
.for.start.5995:
%.tmp6001 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6002 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6003 = icmp ne %m286$.Node.type* %.tmp6001, %.tmp6002
br i1 %.tmp6003, label %.for.continue.5995, label %.for.end.5995
.for.continue.5995:
%.tmp6004 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6004, %m1777$.Type.type** %type
%.tmp6005 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6006 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6005, i32 0, i32 3
%.tmp6007 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6008 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6007, i32 0, i32 3
%.tmp6009 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6008
store %m1777$.Type.type* %.tmp6009, %m1777$.Type.type** %.tmp6006
%.tmp6010 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6011 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6010, i32 0, i32 0
%.tmp6013 = getelementptr [4 x i8], [4 x i8]*@.str6012, i32 0, i32 0
store i8* %.tmp6013, i8** %.tmp6011
%.tmp6014 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6015 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6014, i32 0, i32 3
%.tmp6016 = load %m1777$.Type.type*, %m1777$.Type.type** %type
store %m1777$.Type.type* %.tmp6016, %m1777$.Type.type** %.tmp6015
%.tmp6017 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6018 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6017, i32 0, i32 7
%.tmp6019 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6018
store %m286$.Node.type* %.tmp6019, %m286$.Node.type** %ptr
br label %.for.start.5995
.for.end.5995:
%.tmp6020 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6021 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6020, i32 0, i32 6
%.tmp6022 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6021
%.tmp6023 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6022, i32 0, i32 6
%.tmp6024 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6023
%.tmp6025 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6026 = icmp ne %m286$.Node.type* %.tmp6024, %.tmp6025
br i1 %.tmp6026, label %.if.true.6027, label %.if.false.6027
.if.true.6027:
%.tmp6028 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6029 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6028, i32 0, i32 1
%.tmp6030 = load %m0$.File.type*, %m0$.File.type** %.tmp6029
%.tmp6032 = getelementptr [38 x i8], [38 x i8]*@.str6031, i32 0, i32 0
%.tmp6033 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6034 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp6033)
%.tmp6035 = load i8*, i8** %var_type_repr
%.tmp6036 = load i8*, i8** %var_type_repr
%.tmp6037 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %var_info
%.tmp6038 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp6037)
%.tmp6039 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6030, i8* %.tmp6032, i8* %.tmp6034, i8* %.tmp6035, i8* %.tmp6036, i8* %.tmp6038)
br label %.if.end.6027
.if.false.6027:
%.tmp6040 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6041 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6040, i32 0, i32 1
%.tmp6042 = load %m0$.File.type*, %m0$.File.type** %.tmp6041
%.tmp6044 = getelementptr [22 x i8], [22 x i8]*@.str6043, i32 0, i32 0
%.tmp6045 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6046 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp6045)
%.tmp6047 = load i8*, i8** %var_type_repr
%.tmp6048 = load i8*, i8** %var_type_repr
%.tmp6049 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %var_info
%.tmp6050 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp6049)
%.tmp6051 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6042, i8* %.tmp6044, i8* %.tmp6046, i8* %.tmp6047, i8* %.tmp6048, i8* %.tmp6050)
br label %.if.end.6027
.if.end.6027:
br label %.if.end.5965
.if.false.5965:
%.tmp6052 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6053 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6052, i32 0, i32 6
%.tmp6054 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6053
%.tmp6055 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6054, i32 0, i32 0
%.tmp6056 = load i8*, i8** %.tmp6055
%.tmp6058 = getelementptr [8 x i8], [8 x i8]*@.str6057, i32 0, i32 0
%.tmp6059 = call i32(i8*,i8*) @strcmp(i8* %.tmp6056, i8* %.tmp6058)
%.tmp6060 = icmp eq i32 %.tmp6059, 0
br i1 %.tmp6060, label %.if.true.6061, label %.if.false.6061
.if.true.6061:
%.tmp6062 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6063 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6062)
store %m1777$.AssignableInfo.type* %.tmp6063, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6064 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6065 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6064, i32 0, i32 3
%.tmp6066 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6066, %m1777$.Type.type** %.tmp6065
%.tmp6067 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6068 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6067, i32 0, i32 3
%.tmp6069 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6068
%.tmp6070 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6069, i32 0, i32 0
%.tmp6072 = getelementptr [5 x i8], [5 x i8]*@.str6071, i32 0, i32 0
store i8* %.tmp6072, i8** %.tmp6070
%.tmp6073 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6074 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6073, i32 0, i32 6
%.tmp6075 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6074
%.tmp6076 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6075, i32 0, i32 6
%.tmp6077 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6076
%.tmp6078 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6077, i32 0, i32 1
%.tmp6079 = load i8*, i8** %.tmp6078
%.tmp6081 = getelementptr [6 x i8], [6 x i8]*@.str6080, i32 0, i32 0
%.tmp6082 = call i32(i8*,i8*) @strcmp(i8* %.tmp6079, i8* %.tmp6081)
%.tmp6083 = icmp eq i32 %.tmp6082, 0
br i1 %.tmp6083, label %.if.true.6084, label %.if.false.6084
.if.true.6084:
%.tmp6085 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6086 = load i8, i8* @SCOPE_CONST
%.tmp6088 = getelementptr [2 x i8], [2 x i8]*@.str6087, i32 0, i32 0
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp6085, i8 %.tmp6086, i8* %.tmp6088)
br label %.if.end.6084
.if.false.6084:
%.tmp6089 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6090 = load i8, i8* @SCOPE_CONST
%.tmp6092 = getelementptr [2 x i8], [2 x i8]*@.str6091, i32 0, i32 0
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp6089, i8 %.tmp6090, i8* %.tmp6092)
br label %.if.end.6084
.if.end.6084:
br label %.if.end.6061
.if.false.6061:
%.tmp6093 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6094 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6093, i32 0, i32 6
%.tmp6095 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6094
%.tmp6096 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6095, i32 0, i32 0
%.tmp6097 = load i8*, i8** %.tmp6096
%.tmp6099 = getelementptr [8 x i8], [8 x i8]*@.str6098, i32 0, i32 0
%.tmp6100 = call i32(i8*,i8*) @strcmp(i8* %.tmp6097, i8* %.tmp6099)
%.tmp6101 = icmp eq i32 %.tmp6100, 0
br i1 %.tmp6101, label %.if.true.6102, label %.if.false.6102
.if.true.6102:
%.tmp6103 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6104 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6105 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6104, i32 0, i32 6
%.tmp6106 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6105
%.tmp6107 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6106, i32 0, i32 6
%.tmp6108 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6107
%.tmp6109 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$compile_fn_call.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp6103, %m286$.Node.type* %.tmp6108)
store %m1777$.AssignableInfo.type* %.tmp6109, %m1777$.AssignableInfo.type** %assignable_info
br label %.if.end.6102
.if.false.6102:
%.tmp6110 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6111 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6110, i32 0, i32 6
%.tmp6112 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6111
%.tmp6113 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6112, i32 0, i32 0
%.tmp6114 = load i8*, i8** %.tmp6113
%.tmp6116 = getelementptr [7 x i8], [7 x i8]*@.str6115, i32 0, i32 0
%.tmp6117 = call i32(i8*,i8*) @strcmp(i8* %.tmp6114, i8* %.tmp6116)
%.tmp6118 = icmp eq i32 %.tmp6117, 0
br i1 %.tmp6118, label %.if.true.6119, label %.if.false.6119
.if.true.6119:
%.tmp6120 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6121 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6122 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6121, i32 0, i32 6
%.tmp6123 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6122
%.tmp6124 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6123, i32 0, i32 1
%.tmp6125 = load i8*, i8** %.tmp6124
%.tmp6126 = call %m1777$.AssignableInfo.type*(%m1777$.CompilerCtx.type*,i8*) @m1777$define_string.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.tmp6120, i8* %.tmp6125)
%string_info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp6126, %m1777$.AssignableInfo.type** %string_info
%.tmp6127 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6128 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6127)
store %m1777$.AssignableInfo.type* %.tmp6128, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6129 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6130 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
call void(%m1777$.CompilerCtx.type*,%m1777$.AssignableInfo.type*) @m1777$set_assignable_tmp_id.v.m1777$.CompilerCtx.typep.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp6129, %m1777$.AssignableInfo.type* %.tmp6130)
%.tmp6131 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6132 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %string_info
%.tmp6133 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6132, i32 0, i32 3
%.tmp6134 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6133
%.tmp6135 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp6131, %m1777$.Type.type* %.tmp6134)
%str_tr = alloca i8*
store i8* %.tmp6135, i8** %str_tr
%.tmp6136 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6137 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6136, i32 0, i32 1
%.tmp6138 = load %m0$.File.type*, %m0$.File.type** %.tmp6137
%.tmp6140 = getelementptr [44 x i8], [44 x i8]*@.str6139, i32 0, i32 0
%.tmp6141 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6142 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp6141)
%.tmp6143 = load i8*, i8** %str_tr
%.tmp6144 = load i8*, i8** %str_tr
%.tmp6145 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %string_info
%.tmp6146 = call i8*(%m1777$.AssignableInfo.type*) @m1777$repr_assignable_id.cp.m1777$.AssignableInfo.typep(%m1777$.AssignableInfo.type* %.tmp6145)
%.tmp6147 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6138, i8* %.tmp6140, i8* %.tmp6142, i8* %.tmp6143, i8* %.tmp6144, i8* %.tmp6146)
%.tmp6148 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6149 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6148, i32 0, i32 3
%.tmp6150 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6150, %m1777$.Type.type** %.tmp6149
%.tmp6151 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6152 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6151, i32 0, i32 3
%.tmp6153 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6152
%.tmp6154 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6153, i32 0, i32 0
%.tmp6156 = getelementptr [4 x i8], [4 x i8]*@.str6155, i32 0, i32 0
store i8* %.tmp6156, i8** %.tmp6154
%.tmp6157 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6158 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6157, i32 0, i32 3
%.tmp6159 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6158
%.tmp6160 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6159, i32 0, i32 3
%.tmp6161 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6161, %m1777$.Type.type** %.tmp6160
%.tmp6162 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6163 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6162, i32 0, i32 3
%.tmp6164 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6163
%.tmp6165 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6164, i32 0, i32 3
%.tmp6166 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6165
%.tmp6167 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6166, i32 0, i32 0
%.tmp6169 = getelementptr [4 x i8], [4 x i8]*@.str6168, i32 0, i32 0
store i8* %.tmp6169, i8** %.tmp6167
br label %.if.end.6119
.if.false.6119:
%.tmp6170 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6171 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6170, i32 0, i32 6
%.tmp6172 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6171
%.tmp6173 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6172, i32 0, i32 0
%.tmp6174 = load i8*, i8** %.tmp6173
%.tmp6176 = getelementptr [4 x i8], [4 x i8]*@.str6175, i32 0, i32 0
%.tmp6177 = call i32(i8*,i8*) @strcmp(i8* %.tmp6174, i8* %.tmp6176)
%.tmp6178 = icmp eq i32 %.tmp6177, 0
br i1 %.tmp6178, label %.if.true.6179, label %.if.false.6179
.if.true.6179:
%.tmp6180 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6181 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6180)
store %m1777$.AssignableInfo.type* %.tmp6181, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6182 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6183 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6182, i32 0, i32 6
%.tmp6184 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6183
%.tmp6185 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6184, i32 0, i32 1
%.tmp6186 = load i8*, i8** %.tmp6185
%.tmp6187 = call i32(i8*) @strlen(i8* %.tmp6186)
%chr_len = alloca i32
store i32 %.tmp6187, i32* %chr_len
%.tmp6188 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6189 = load i8, i8* @SCOPE_CONST
%.tmp6191 = getelementptr [2 x i8], [2 x i8]*@.str6190, i32 0, i32 0
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp6188, i8 %.tmp6189, i8* %.tmp6191)
%.tmp6192 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6193 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6192, i32 0, i32 0
%.tmp6194 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6195 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6194, i32 0, i32 6
%.tmp6196 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6195
%.tmp6197 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6196, i32 0, i32 1
%.tmp6198 = load i8*, i8** %.tmp6197
%.tmp6199 = call i8*(i8*) @m2123$chr_to_llvm.cp.cp(i8* %.tmp6198)
store i8* %.tmp6199, i8** %.tmp6193
%.tmp6200 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6201 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6200, i32 0, i32 0
%.tmp6202 = load i8*, i8** %.tmp6201
%.tmp6203 = icmp eq i8* %.tmp6202, null
br i1 %.tmp6203, label %.if.true.6204, label %.if.false.6204
.if.true.6204:
%.tmp6205 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp6207 = getelementptr [22 x i8], [22 x i8]*@.str6206, i32 0, i32 0
%.tmp6208 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6209 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6208, i32 0, i32 6
%.tmp6210 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6209
%.tmp6211 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6210, i32 0, i32 1
%.tmp6212 = load i8*, i8** %.tmp6211
%.tmp6213 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6205, i8* %.tmp6207, i8* %.tmp6212)
%.tmp6214 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp6214
br label %.if.end.6204
.if.false.6204:
br label %.if.end.6204
.if.end.6204:
%.tmp6215 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6216 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6215, i32 0, i32 3
%.tmp6217 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6217, %m1777$.Type.type** %.tmp6216
%.tmp6218 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6219 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6218, i32 0, i32 3
%.tmp6220 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6219
%.tmp6221 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6220, i32 0, i32 0
%.tmp6223 = getelementptr [4 x i8], [4 x i8]*@.str6222, i32 0, i32 0
store i8* %.tmp6223, i8** %.tmp6221
br label %.if.end.6179
.if.false.6179:
%.tmp6224 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6225 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6227 = getelementptr [40 x i8], [40 x i8]*@.str6226, i32 0, i32 0
%.tmp6228 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp6224, %m286$.Node.type* %.tmp6225, i8* %.tmp6227)
%.tmp6229 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6230 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6229, i32 0, i32 6
%.tmp6231 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6230
%.tmp6232 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6231, i32 0, i32 0
%.tmp6233 = load i8*, i8** %.tmp6232
%.tmp6234 = call i32(i8*,...) @printf(i8* %.tmp6228, i8* %.tmp6233)
%.tmp6235 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp6235
br label %.if.end.6179
.if.end.6179:
br label %.if.end.6119
.if.end.6119:
br label %.if.end.6102
.if.end.6102:
br label %.if.end.6061
.if.end.6061:
br label %.if.end.5965
.if.end.5965:
br label %.if.end.5918
.if.end.5918:
br label %.if.end.5890
.if.end.5890:
%.tmp6236 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6237 = icmp eq %m1777$.AssignableInfo.type* %.tmp6236, null
br i1 %.tmp6237, label %.if.true.6238, label %.if.false.6238
.if.true.6238:
%.tmp6239 = bitcast ptr null to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp6239
br label %.if.end.6238
.if.false.6238:
br label %.if.end.6238
.if.end.6238:
%.tmp6240 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6241 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6240, i32 0, i32 4
%.tmp6242 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6243 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6242, i32 0, i32 3
%.tmp6244 = load i32, i32* %.tmp6243
store i32 %.tmp6244, i32* %.tmp6241
%.tmp6245 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6246 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6245, i32 0, i32 5
%.tmp6247 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6248 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6247, i32 0, i32 4
%.tmp6249 = load i32, i32* %.tmp6248
store i32 %.tmp6249, i32* %.tmp6246
%.tmp6250 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %assignable_info
%.tmp6251 = bitcast %m1777$.AssignableInfo.type* %.tmp6250 to %m1777$.AssignableInfo.type*
ret %m1777$.AssignableInfo.type* %.tmp6251
}
define i8* @m1777$type_abbr.cp.m1777$.Type.typep(%m1777$.Type.type* %.type.arg) {
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.type.arg, %m1777$.Type.type** %type
%.tmp6252 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6253 = icmp ne %m1777$.Type.type* %.tmp6252, null
%.tmp6255 = getelementptr [22 x i8], [22 x i8]*@.str6254, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6253, i8* %.tmp6255)
%.tmp6256 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6257 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6256, i32 0, i32 0
%.tmp6258 = load i8*, i8** %.tmp6257
%.tmp6259 = icmp ne i8* %.tmp6258, null
%.tmp6261 = getelementptr [59 x i8], [59 x i8]*@.str6260, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6259, i8* %.tmp6261)
%.tmp6262 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6263 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6262, i32 0, i32 0
%.tmp6264 = load i8*, i8** %.tmp6263
%.tmp6266 = getelementptr [4 x i8], [4 x i8]*@.str6265, i32 0, i32 0
%.tmp6267 = call i32(i8*,i8*) @strcmp(i8* %.tmp6264, i8* %.tmp6266)
%.tmp6268 = icmp eq i32 %.tmp6267, 0
br i1 %.tmp6268, label %.if.true.6269, label %.if.false.6269
.if.true.6269:
%.tmp6271 = getelementptr [2 x i8], [2 x i8]*@.str6270, i32 0, i32 0
ret i8* %.tmp6271
br label %.if.end.6269
.if.false.6269:
%.tmp6272 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6273 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6272, i32 0, i32 0
%.tmp6274 = load i8*, i8** %.tmp6273
%.tmp6276 = getelementptr [5 x i8], [5 x i8]*@.str6275, i32 0, i32 0
%.tmp6277 = call i32(i8*,i8*) @strcmp(i8* %.tmp6274, i8* %.tmp6276)
%.tmp6278 = icmp eq i32 %.tmp6277, 0
br i1 %.tmp6278, label %.if.true.6279, label %.if.false.6279
.if.true.6279:
%.tmp6281 = getelementptr [2 x i8], [2 x i8]*@.str6280, i32 0, i32 0
ret i8* %.tmp6281
br label %.if.end.6279
.if.false.6279:
%.tmp6282 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6283 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6282, i32 0, i32 0
%.tmp6284 = load i8*, i8** %.tmp6283
%.tmp6286 = getelementptr [5 x i8], [5 x i8]*@.str6285, i32 0, i32 0
%.tmp6287 = call i32(i8*,i8*) @strcmp(i8* %.tmp6284, i8* %.tmp6286)
%.tmp6288 = icmp eq i32 %.tmp6287, 0
br i1 %.tmp6288, label %.if.true.6289, label %.if.false.6289
.if.true.6289:
%.tmp6291 = getelementptr [2 x i8], [2 x i8]*@.str6290, i32 0, i32 0
ret i8* %.tmp6291
br label %.if.end.6289
.if.false.6289:
%.tmp6292 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6293 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6292, i32 0, i32 0
%.tmp6294 = load i8*, i8** %.tmp6293
%.tmp6296 = getelementptr [4 x i8], [4 x i8]*@.str6295, i32 0, i32 0
%.tmp6297 = call i32(i8*,i8*) @strcmp(i8* %.tmp6294, i8* %.tmp6296)
%.tmp6298 = icmp eq i32 %.tmp6297, 0
br i1 %.tmp6298, label %.if.true.6299, label %.if.false.6299
.if.true.6299:
%.tmp6301 = getelementptr [2 x i8], [2 x i8]*@.str6300, i32 0, i32 0
ret i8* %.tmp6301
br label %.if.end.6299
.if.false.6299:
%.tmp6302 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6303 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6302, i32 0, i32 0
%.tmp6304 = load i8*, i8** %.tmp6303
%.tmp6306 = getelementptr [4 x i8], [4 x i8]*@.str6305, i32 0, i32 0
%.tmp6307 = call i32(i8*,i8*) @strcmp(i8* %.tmp6304, i8* %.tmp6306)
%.tmp6308 = icmp eq i32 %.tmp6307, 0
br i1 %.tmp6308, label %.if.true.6309, label %.if.false.6309
.if.true.6309:
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp6310 = getelementptr i8*, i8** %buf, i32 0
%.tmp6312 = getelementptr [4 x i8], [4 x i8]*@.str6311, i32 0, i32 0
%.tmp6313 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6314 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6313, i32 0, i32 3
%.tmp6315 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6314
%.tmp6316 = call i8*(%m1777$.Type.type*) @m1777$type_abbr.cp.m1777$.Type.typep(%m1777$.Type.type* %.tmp6315)
%.tmp6317 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6310, i8* %.tmp6312, i8* %.tmp6316)
%.tmp6318 = load i8*, i8** %buf
ret i8* %.tmp6318
br label %.if.end.6309
.if.false.6309:
%.tmp6319 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6320 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6319, i32 0, i32 0
%.tmp6321 = load i8*, i8** %.tmp6320
%.tmp6323 = getelementptr [10 x i8], [10 x i8]*@.str6322, i32 0, i32 0
%.tmp6324 = call i32(i8*,i8*) @strcmp(i8* %.tmp6321, i8* %.tmp6323)
%.tmp6325 = icmp eq i32 %.tmp6324, 0
br i1 %.tmp6325, label %.if.true.6326, label %.if.false.6326
.if.true.6326:
%.tmp6327 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6328 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6327, i32 0, i32 2
%.tmp6329 = load i8*, i8** %.tmp6328
ret i8* %.tmp6329
br label %.if.end.6326
.if.false.6326:
%.tmp6330 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6331 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6330, i32 0, i32 0
%.tmp6332 = load i8*, i8** %.tmp6331
%.tmp6334 = getelementptr [6 x i8], [6 x i8]*@.str6333, i32 0, i32 0
%.tmp6335 = call i32(i8*,i8*) @strcmp(i8* %.tmp6332, i8* %.tmp6334)
%.tmp6336 = icmp eq i32 %.tmp6335, 0
br i1 %.tmp6336, label %.if.true.6337, label %.if.false.6337
.if.true.6337:
%.tmp6339 = getelementptr [2 x i8], [2 x i8]*@.str6338, i32 0, i32 0
ret i8* %.tmp6339
br label %.if.end.6337
.if.false.6337:
%.tmp6341 = getelementptr [44 x i8], [44 x i8]*@.str6340, i32 0, i32 0
%.tmp6342 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6343 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6342, i32 0, i32 0
%.tmp6344 = load i8*, i8** %.tmp6343
%.tmp6345 = call i32(i8*,...) @printf(i8* %.tmp6341, i8* %.tmp6344)
br label %.if.end.6337
.if.end.6337:
br label %.if.end.6326
.if.end.6326:
br label %.if.end.6309
.if.end.6309:
br label %.if.end.6299
.if.end.6299:
br label %.if.end.6289
.if.end.6289:
br label %.if.end.6279
.if.end.6279:
br label %.if.end.6269
.if.end.6269:
%.tmp6346 = bitcast ptr null to i8*
ret i8* %.tmp6346
}
define %m1777$.AssignableInfo.type* @m1777$define_string.m1777$.AssignableInfo.typep.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp6347 = bitcast ptr null to %m286$.Node.type*
%.tmp6348 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6347)
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp6348, %m1777$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp6349 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp6351 = getelementptr [7 x i8], [7 x i8]*@.str6350, i32 0, i32 0
%.tmp6352 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6353 = call i32(%m1777$.CompilerCtx.type*) @m1777$new_uid.i.m1777$.CompilerCtx.typep(%m1777$.CompilerCtx.type* %.tmp6352)
%.tmp6354 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6349, i8* %.tmp6351, i32 %.tmp6353)
%.tmp6355 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6356 = load i8, i8* @SCOPE_GLOBAL
%.tmp6357 = load i8*, i8** %tmp_buff
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp6355, i8 %.tmp6356, i8* %.tmp6357)
%.tmp6358 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* null, i32 1
%.tmp6359 = ptrtoint %m1777$.GlobalName.type* %.tmp6358 to i32
%.tmp6360 = call i8*(i32) @malloc(i32 %.tmp6359)
%.tmp6361 = bitcast i8* %.tmp6360 to %m1777$.GlobalName.type*
%global = alloca %m1777$.GlobalName.type*
store %m1777$.GlobalName.type* %.tmp6361, %m1777$.GlobalName.type** %global
%.tmp6362 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
%.tmp6363 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6362, i32 0, i32 0
%.tmp6364 = load i8*, i8** %text
%.tmp6365 = call i8*(i8*) @m2123$string_to_llvm.cp.cp(i8* %.tmp6364)
store i8* %.tmp6365, i8** %.tmp6363
%.tmp6366 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6367 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6366, i32 0, i32 3
%.tmp6368 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6368, %m1777$.Type.type** %.tmp6367
%.tmp6369 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6370 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6369, i32 0, i32 3
%.tmp6371 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6370
%.tmp6372 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6371, i32 0, i32 0
%.tmp6374 = getelementptr [6 x i8], [6 x i8]*@.str6373, i32 0, i32 0
store i8* %.tmp6374, i8** %.tmp6372
%.tmp6375 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6376 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6375, i32 0, i32 3
%.tmp6377 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6376
%.tmp6378 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6377, i32 0, i32 3
%.tmp6379 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6379, %m1777$.Type.type** %.tmp6378
%.tmp6380 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6381 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6380, i32 0, i32 3
%.tmp6382 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6381
%.tmp6383 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6382, i32 0, i32 3
%.tmp6384 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6383
%.tmp6385 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6384, i32 0, i32 0
%.tmp6387 = getelementptr [4 x i8], [4 x i8]*@.str6386, i32 0, i32 0
store i8* %.tmp6387, i8** %.tmp6385
%.tmp6388 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6389 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6388, i32 0, i32 3
%.tmp6390 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6389
%.tmp6391 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6390, i32 0, i32 3
%.tmp6392 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6391
%.tmp6393 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6392, i32 0, i32 4
%.tmp6394 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp6394, %m1777$.Type.type** %.tmp6393
%.tmp6395 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6396 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6395, i32 0, i32 3
%.tmp6397 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6396
%.tmp6398 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6397, i32 0, i32 3
%.tmp6399 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6398
%.tmp6400 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6399, i32 0, i32 4
%.tmp6401 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6400
%.tmp6402 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6401, i32 0, i32 0
%.tmp6403 = getelementptr i8*, i8** %.tmp6402, i32 0
%.tmp6405 = getelementptr [3 x i8], [3 x i8]*@.str6404, i32 0, i32 0
%.tmp6406 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
%.tmp6407 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6406, i32 0, i32 0
%.tmp6408 = load i8*, i8** %.tmp6407
%.tmp6409 = call i32(i8*) @m2123$llvm_str_len.i.cp(i8* %.tmp6408)
%.tmp6410 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6403, i8* %.tmp6405, i32 %.tmp6409)
%.tmp6411 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
%.tmp6412 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6411, i32 0, i32 1
%.tmp6414 = getelementptr [7 x i8], [7 x i8]*@.str6413, i32 0, i32 0
store i8* %.tmp6414, i8** %.tmp6412
%.tmp6415 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
%.tmp6416 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6415, i32 0, i32 4
store %m1777$.GlobalName.type* null, %m1777$.GlobalName.type** %.tmp6416
%.tmp6417 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
%.tmp6418 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6417, i32 0, i32 3
%.tmp6419 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
store %m1777$.AssignableInfo.type* %.tmp6419, %m1777$.AssignableInfo.type** %.tmp6418
%.tmp6420 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
%.tmp6421 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6420, i32 0, i32 2
store i1 0, i1* %.tmp6421
%.tmp6422 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6423 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %global
call void(%m1777$.CompilerCtx.type*,%m1777$.GlobalName.type*) @m1777$append_global.v.m1777$.CompilerCtx.typep.m1777$.GlobalName.typep(%m1777$.CompilerCtx.type* %.tmp6422, %m1777$.GlobalName.type* %.tmp6423)
%.tmp6424 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
ret %m1777$.AssignableInfo.type* %.tmp6424
}
define void @m1777$define_module.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%mod = alloca %m286$.Node.type*
store %m286$.Node.type* %.mod.arg, %m286$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp6425 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp6426 = call %m1777$.AssignableInfo.type*(%m286$.Node.type*) @m1777$new_assignable_info.m1777$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6425)
%info = alloca %m1777$.AssignableInfo.type*
store %m1777$.AssignableInfo.type* %.tmp6426, %m1777$.AssignableInfo.type** %info
%.tmp6427 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6428 = load i8, i8* @SCOPE_CONST
%.tmp6429 = load i8*, i8** %abspath
call void(%m1777$.AssignableInfo.type*,i8,i8*) @m1777$set_assignable_id.v.m1777$.AssignableInfo.typep.c.cp(%m1777$.AssignableInfo.type* %.tmp6427, i8 %.tmp6428, i8* %.tmp6429)
%.tmp6430 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6431 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6430, i32 0, i32 2
%.tmp6433 = getelementptr [7 x i8], [7 x i8]*@.str6432, i32 0, i32 0
store i8* %.tmp6433, i8** %.tmp6431
%.tmp6434 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
%.tmp6435 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6434, i32 0, i32 3
store %m1777$.Type.type* null, %m1777$.Type.type** %.tmp6435
%.tmp6436 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6437 = load i8*, i8** %as_name
%.tmp6438 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %info
call void(%m1777$.CompilerCtx.type*,i8*,%m1777$.AssignableInfo.type*) @m1777$define_assignable.v.m1777$.CompilerCtx.typep.cp.m1777$.AssignableInfo.typep(%m1777$.CompilerCtx.type* %.tmp6436, i8* %.tmp6437, %m1777$.AssignableInfo.type* %.tmp6438)
ret void
}
define void @m1777$append_global.v.m1777$.CompilerCtx.typep.m1777$.GlobalName.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%g = alloca %m1777$.GlobalName.type*
store %m1777$.GlobalName.type* %.g.arg, %m1777$.GlobalName.type** %g
%.tmp6439 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6440 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6439, i32 0, i32 3
%.tmp6441 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %.tmp6440
%.tmp6442 = icmp eq %m1777$.GlobalName.type* %.tmp6441, null
br i1 %.tmp6442, label %.if.true.6443, label %.if.false.6443
.if.true.6443:
%.tmp6444 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6445 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6444, i32 0, i32 3
%.tmp6446 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
store %m1777$.GlobalName.type* %.tmp6446, %m1777$.GlobalName.type** %.tmp6445
br label %.if.end.6443
.if.false.6443:
%last_global = alloca %m1777$.GlobalName.type*
store %m1777$.GlobalName.type* null, %m1777$.GlobalName.type** %last_global
%.tmp6448 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6449 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6448, i32 0, i32 3
%.tmp6450 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %.tmp6449
store %m1777$.GlobalName.type* %.tmp6450, %m1777$.GlobalName.type** %last_global
br label %.for.start.6447
.for.start.6447:
%.tmp6451 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %last_global
%.tmp6452 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6451, i32 0, i32 4
%.tmp6453 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %.tmp6452
%.tmp6454 = icmp ne %m1777$.GlobalName.type* %.tmp6453, null
br i1 %.tmp6454, label %.for.continue.6447, label %.for.end.6447
.for.continue.6447:
%.tmp6455 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %last_global
%.tmp6456 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6455, i32 0, i32 4
%.tmp6457 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %.tmp6456
store %m1777$.GlobalName.type* %.tmp6457, %m1777$.GlobalName.type** %last_global
br label %.for.start.6447
.for.end.6447:
%.tmp6458 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %last_global
%.tmp6459 = getelementptr %m1777$.GlobalName.type, %m1777$.GlobalName.type* %.tmp6458, i32 0, i32 4
%.tmp6460 = load %m1777$.GlobalName.type*, %m1777$.GlobalName.type** %g
store %m1777$.GlobalName.type* %.tmp6460, %m1777$.GlobalName.type** %.tmp6459
br label %.if.end.6443
.if.end.6443:
ret void
}
define i8* @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.Type.type* %.type.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.type.arg, %m1777$.Type.type** %type
%.tmp6461 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6462 = icmp eq %m1777$.Type.type* %.tmp6461, null
br i1 %.tmp6462, label %.if.true.6463, label %.if.false.6463
.if.true.6463:
%.tmp6464 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6464, label %.if.true.6465, label %.if.false.6465
.if.true.6465:
%.tmp6467 = getelementptr [44 x i8], [44 x i8]*@.str6466, i32 0, i32 0
%.tmp6468 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6469 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6468, i32 0, i32 6
%.tmp6470 = load i8*, i8** %.tmp6469
%.tmp6471 = call i32(i8*,...) @printf(i8* %.tmp6467, i8* %.tmp6470)
br label %.if.end.6465
.if.false.6465:
br label %.if.end.6465
.if.end.6465:
%.tmp6473 = getelementptr [2 x i8], [2 x i8]*@.str6472, i32 0, i32 0
ret i8* %.tmp6473
br label %.if.end.6463
.if.false.6463:
br label %.if.end.6463
.if.end.6463:
%.tmp6474 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6475 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6474, i32 0, i32 0
%.tmp6476 = load i8*, i8** %.tmp6475
%.tmp6477 = icmp ne i8* %.tmp6476, null
%.tmp6479 = getelementptr [59 x i8], [59 x i8]*@.str6478, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6477, i8* %.tmp6479)
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp6480 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6481 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6480, i32 0, i32 0
%.tmp6482 = load i8*, i8** %.tmp6481
%.tmp6484 = getelementptr [4 x i8], [4 x i8]*@.str6483, i32 0, i32 0
%.tmp6485 = call i32(i8*,i8*) @strcmp(i8* %.tmp6482, i8* %.tmp6484)
%.tmp6486 = icmp eq i32 %.tmp6485, 0
br i1 %.tmp6486, label %.if.true.6487, label %.if.false.6487
.if.true.6487:
%.tmp6489 = getelementptr [4 x i8], [4 x i8]*@.str6488, i32 0, i32 0
ret i8* %.tmp6489
br label %.if.end.6487
.if.false.6487:
%.tmp6490 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6491 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6490, i32 0, i32 0
%.tmp6492 = load i8*, i8** %.tmp6491
%.tmp6494 = getelementptr [5 x i8], [5 x i8]*@.str6493, i32 0, i32 0
%.tmp6495 = call i32(i8*,i8*) @strcmp(i8* %.tmp6492, i8* %.tmp6494)
%.tmp6496 = icmp eq i32 %.tmp6495, 0
br i1 %.tmp6496, label %.if.true.6497, label %.if.false.6497
.if.true.6497:
%.tmp6499 = getelementptr [5 x i8], [5 x i8]*@.str6498, i32 0, i32 0
ret i8* %.tmp6499
br label %.if.end.6497
.if.false.6497:
%.tmp6500 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6501 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6500, i32 0, i32 0
%.tmp6502 = load i8*, i8** %.tmp6501
%.tmp6504 = getelementptr [5 x i8], [5 x i8]*@.str6503, i32 0, i32 0
%.tmp6505 = call i32(i8*,i8*) @strcmp(i8* %.tmp6502, i8* %.tmp6504)
%.tmp6506 = icmp eq i32 %.tmp6505, 0
br i1 %.tmp6506, label %.if.true.6507, label %.if.false.6507
.if.true.6507:
%.tmp6509 = getelementptr [3 x i8], [3 x i8]*@.str6508, i32 0, i32 0
ret i8* %.tmp6509
br label %.if.end.6507
.if.false.6507:
%.tmp6510 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6511 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6510, i32 0, i32 0
%.tmp6512 = load i8*, i8** %.tmp6511
%.tmp6514 = getelementptr [8 x i8], [8 x i8]*@.str6513, i32 0, i32 0
%.tmp6515 = call i32(i8*,i8*) @strcmp(i8* %.tmp6512, i8* %.tmp6514)
%.tmp6516 = icmp eq i32 %.tmp6515, 0
br i1 %.tmp6516, label %.if.true.6517, label %.if.false.6517
.if.true.6517:
%.tmp6519 = getelementptr [4 x i8], [4 x i8]*@.str6518, i32 0, i32 0
ret i8* %.tmp6519
br label %.if.end.6517
.if.false.6517:
%.tmp6520 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6521 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6520, i32 0, i32 0
%.tmp6522 = load i8*, i8** %.tmp6521
%.tmp6524 = getelementptr [4 x i8], [4 x i8]*@.str6523, i32 0, i32 0
%.tmp6525 = call i32(i8*,i8*) @strcmp(i8* %.tmp6522, i8* %.tmp6524)
%.tmp6526 = icmp eq i32 %.tmp6525, 0
br i1 %.tmp6526, label %.if.true.6527, label %.if.false.6527
.if.true.6527:
%.tmp6529 = getelementptr [3 x i8], [3 x i8]*@.str6528, i32 0, i32 0
ret i8* %.tmp6529
br label %.if.end.6527
.if.false.6527:
%.tmp6530 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6531 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6530, i32 0, i32 0
%.tmp6532 = load i8*, i8** %.tmp6531
%.tmp6534 = getelementptr [9 x i8], [9 x i8]*@.str6533, i32 0, i32 0
%.tmp6535 = call i32(i8*,i8*) @strcmp(i8* %.tmp6532, i8* %.tmp6534)
%.tmp6536 = icmp eq i32 %.tmp6535, 0
br i1 %.tmp6536, label %.if.true.6537, label %.if.false.6537
.if.true.6537:
%.tmp6538 = getelementptr i8*, i8** %buf, i32 0
%.tmp6540 = getelementptr [4 x i8], [4 x i8]*@.str6539, i32 0, i32 0
%.tmp6541 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6542 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6543 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6542, i32 0, i32 3
%.tmp6544 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6543
%.tmp6545 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp6541, %m1777$.Type.type* %.tmp6544)
%.tmp6546 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6538, i8* %.tmp6540, i8* %.tmp6545)
%.tmp6548 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6549 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6548, i32 0, i32 3
%.tmp6550 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6549
%.tmp6551 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6550, i32 0, i32 4
%.tmp6552 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6551
%p = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6552, %m1777$.Type.type** %p
br label %.for.start.6547
.for.start.6547:
%.tmp6553 = load %m1777$.Type.type*, %m1777$.Type.type** %p
%.tmp6554 = icmp ne %m1777$.Type.type* %.tmp6553, null
br i1 %.tmp6554, label %.for.continue.6547, label %.for.end.6547
.for.continue.6547:
%.tmp6555 = load %m1777$.Type.type*, %m1777$.Type.type** %p
%.tmp6556 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6557 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6556, i32 0, i32 3
%.tmp6558 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6557
%.tmp6559 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6558, i32 0, i32 4
%.tmp6560 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6559
%.tmp6561 = icmp ne %m1777$.Type.type* %.tmp6555, %.tmp6560
br i1 %.tmp6561, label %.if.true.6562, label %.if.false.6562
.if.true.6562:
%.tmp6563 = getelementptr i8*, i8** %buf, i32 0
%.tmp6565 = getelementptr [4 x i8], [4 x i8]*@.str6564, i32 0, i32 0
%.tmp6566 = load i8*, i8** %buf
%.tmp6567 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6563, i8* %.tmp6565, i8* %.tmp6566)
br label %.if.end.6562
.if.false.6562:
br label %.if.end.6562
.if.end.6562:
%.tmp6568 = getelementptr i8*, i8** %buf, i32 0
%.tmp6570 = getelementptr [5 x i8], [5 x i8]*@.str6569, i32 0, i32 0
%.tmp6571 = load i8*, i8** %buf
%.tmp6572 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6573 = load %m1777$.Type.type*, %m1777$.Type.type** %p
%.tmp6574 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp6572, %m1777$.Type.type* %.tmp6573)
%.tmp6575 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6568, i8* %.tmp6570, i8* %.tmp6571, i8* %.tmp6574)
%.tmp6576 = load %m1777$.Type.type*, %m1777$.Type.type** %p
%.tmp6577 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6576, i32 0, i32 4
%.tmp6578 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6577
store %m1777$.Type.type* %.tmp6578, %m1777$.Type.type** %p
br label %.for.start.6547
.for.end.6547:
%.tmp6579 = getelementptr i8*, i8** %buf, i32 0
%.tmp6581 = getelementptr [4 x i8], [4 x i8]*@.str6580, i32 0, i32 0
%.tmp6582 = load i8*, i8** %buf
%.tmp6583 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6579, i8* %.tmp6581, i8* %.tmp6582)
%.tmp6584 = load i8*, i8** %buf
ret i8* %.tmp6584
br label %.if.end.6537
.if.false.6537:
%.tmp6585 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6586 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6585, i32 0, i32 0
%.tmp6587 = load i8*, i8** %.tmp6586
%.tmp6589 = getelementptr [4 x i8], [4 x i8]*@.str6588, i32 0, i32 0
%.tmp6590 = call i32(i8*,i8*) @strcmp(i8* %.tmp6587, i8* %.tmp6589)
%.tmp6591 = icmp eq i32 %.tmp6590, 0
br i1 %.tmp6591, label %.if.true.6592, label %.if.false.6592
.if.true.6592:
%.tmp6593 = getelementptr i8*, i8** %buf, i32 0
%.tmp6595 = getelementptr [4 x i8], [4 x i8]*@.str6594, i32 0, i32 0
%.tmp6596 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6597 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6598 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6597, i32 0, i32 3
%.tmp6599 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6598
%.tmp6600 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp6596, %m1777$.Type.type* %.tmp6599)
%.tmp6601 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6593, i8* %.tmp6595, i8* %.tmp6600)
%.tmp6602 = load i8*, i8** %buf
ret i8* %.tmp6602
br label %.if.end.6592
.if.false.6592:
%.tmp6603 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6604 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6603, i32 0, i32 0
%.tmp6605 = load i8*, i8** %.tmp6604
%.tmp6607 = getelementptr [7 x i8], [7 x i8]*@.str6606, i32 0, i32 0
%.tmp6608 = call i32(i8*,i8*) @strcmp(i8* %.tmp6605, i8* %.tmp6607)
%.tmp6609 = icmp eq i32 %.tmp6608, 0
br i1 %.tmp6609, label %.if.true.6610, label %.if.false.6610
.if.true.6610:
%.tmp6611 = getelementptr i8*, i8** %buf, i32 0
%.tmp6613 = getelementptr [2 x i8], [2 x i8]*@.str6612, i32 0, i32 0
%.tmp6614 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6611, i8* %.tmp6613)
%.tmp6616 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6617 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6616, i32 0, i32 3
%.tmp6618 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6617
%t = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6618, %m1777$.Type.type** %t
br label %.for.start.6615
.for.start.6615:
%.tmp6619 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6620 = icmp ne %m1777$.Type.type* %.tmp6619, null
br i1 %.tmp6620, label %.for.continue.6615, label %.for.end.6615
.for.continue.6615:
%.tmp6621 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6622 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6623 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6622, i32 0, i32 3
%.tmp6624 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6623
%.tmp6625 = icmp ne %m1777$.Type.type* %.tmp6621, %.tmp6624
br i1 %.tmp6625, label %.if.true.6626, label %.if.false.6626
.if.true.6626:
%.tmp6627 = getelementptr i8*, i8** %buf, i32 0
%.tmp6629 = getelementptr [4 x i8], [4 x i8]*@.str6628, i32 0, i32 0
%.tmp6630 = load i8*, i8** %buf
%.tmp6631 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6627, i8* %.tmp6629, i8* %.tmp6630)
br label %.if.end.6626
.if.false.6626:
br label %.if.end.6626
.if.end.6626:
%.tmp6632 = getelementptr i8*, i8** %buf, i32 0
%.tmp6634 = getelementptr [5 x i8], [5 x i8]*@.str6633, i32 0, i32 0
%.tmp6635 = load i8*, i8** %buf
%.tmp6636 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6637 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6638 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp6636, %m1777$.Type.type* %.tmp6637)
%.tmp6639 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6632, i8* %.tmp6634, i8* %.tmp6635, i8* %.tmp6638)
%.tmp6640 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6641 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6640, i32 0, i32 4
%.tmp6642 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6641
store %m1777$.Type.type* %.tmp6642, %m1777$.Type.type** %t
br label %.for.start.6615
.for.end.6615:
%.tmp6643 = getelementptr i8*, i8** %buf, i32 0
%.tmp6645 = getelementptr [4 x i8], [4 x i8]*@.str6644, i32 0, i32 0
%.tmp6646 = load i8*, i8** %buf
%.tmp6647 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6643, i8* %.tmp6645, i8* %.tmp6646)
%.tmp6648 = load i8*, i8** %buf
ret i8* %.tmp6648
br label %.if.end.6610
.if.false.6610:
%.tmp6649 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6650 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6649, i32 0, i32 0
%.tmp6651 = load i8*, i8** %.tmp6650
%.tmp6653 = getelementptr [6 x i8], [6 x i8]*@.str6652, i32 0, i32 0
%.tmp6654 = call i32(i8*,i8*) @strcmp(i8* %.tmp6651, i8* %.tmp6653)
%.tmp6655 = icmp eq i32 %.tmp6654, 0
br i1 %.tmp6655, label %.if.true.6656, label %.if.false.6656
.if.true.6656:
%.tmp6657 = getelementptr i8*, i8** %buf, i32 0
%.tmp6659 = getelementptr [10 x i8], [10 x i8]*@.str6658, i32 0, i32 0
%.tmp6660 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6661 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6660, i32 0, i32 3
%.tmp6662 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6661
%.tmp6663 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6662, i32 0, i32 4
%.tmp6664 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6663
%.tmp6665 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6664, i32 0, i32 0
%.tmp6666 = load i8*, i8** %.tmp6665
%.tmp6667 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6668 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6669 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6668, i32 0, i32 3
%.tmp6670 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6669
%.tmp6671 = call i8*(%m1777$.CompilerCtx.type*,%m1777$.Type.type*) @m1777$type_repr.cp.m1777$.CompilerCtx.typep.m1777$.Type.typep(%m1777$.CompilerCtx.type* %.tmp6667, %m1777$.Type.type* %.tmp6670)
%.tmp6672 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6657, i8* %.tmp6659, i8* %.tmp6666, i8* %.tmp6671)
%.tmp6673 = load i8*, i8** %buf
ret i8* %.tmp6673
br label %.if.end.6656
.if.false.6656:
%.tmp6674 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6675 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6674, i32 0, i32 0
%.tmp6676 = load i8*, i8** %.tmp6675
%.tmp6678 = getelementptr [10 x i8], [10 x i8]*@.str6677, i32 0, i32 0
%.tmp6679 = call i32(i8*,i8*) @strcmp(i8* %.tmp6676, i8* %.tmp6678)
%.tmp6680 = icmp eq i32 %.tmp6679, 0
br i1 %.tmp6680, label %.if.true.6681, label %.if.false.6681
.if.true.6681:
%.tmp6682 = getelementptr i8*, i8** %buf, i32 0
%.tmp6684 = getelementptr [5 x i8], [5 x i8]*@.str6683, i32 0, i32 0
%.tmp6685 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6686 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6685, i32 0, i32 2
%.tmp6687 = load i8*, i8** %.tmp6686
%.tmp6688 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6682, i8* %.tmp6684, i8* %.tmp6687)
%.tmp6689 = load i8*, i8** %buf
ret i8* %.tmp6689
br label %.if.end.6681
.if.false.6681:
%.tmp6690 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6691 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6690, i32 0, i32 0
%.tmp6692 = load i8*, i8** %.tmp6691
%.tmp6694 = getelementptr [7 x i8], [7 x i8]*@.str6693, i32 0, i32 0
%.tmp6695 = call i32(i8*,i8*) @strcmp(i8* %.tmp6692, i8* %.tmp6694)
%.tmp6696 = icmp eq i32 %.tmp6695, 0
br i1 %.tmp6696, label %.if.true.6697, label %.if.false.6697
.if.true.6697:
%.tmp6699 = getelementptr [4 x i8], [4 x i8]*@.str6698, i32 0, i32 0
ret i8* %.tmp6699
br label %.if.end.6697
.if.false.6697:
%.tmp6700 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6701 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6700, i32 0, i32 0
%.tmp6702 = load i8*, i8** %.tmp6701
%.tmp6704 = getelementptr [6 x i8], [6 x i8]*@.str6703, i32 0, i32 0
%.tmp6705 = call i32(i8*,i8*) @strcmp(i8* %.tmp6702, i8* %.tmp6704)
%.tmp6706 = icmp eq i32 %.tmp6705, 0
br i1 %.tmp6706, label %.if.true.6707, label %.if.false.6707
.if.true.6707:
br label %.if.end.6707
.if.false.6707:
%.tmp6709 = getelementptr [58 x i8], [58 x i8]*@.str6708, i32 0, i32 0
%.tmp6710 = load %m1777$.Type.type*, %m1777$.Type.type** %type
%.tmp6711 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6710, i32 0, i32 0
%.tmp6712 = load i8*, i8** %.tmp6711
%.tmp6713 = call i32(i8*,...) @printf(i8* %.tmp6709, i8* %.tmp6712)
br label %.if.end.6707
.if.end.6707:
br label %.if.end.6697
.if.end.6697:
br label %.if.end.6681
.if.end.6681:
br label %.if.end.6656
.if.end.6656:
br label %.if.end.6610
.if.end.6610:
br label %.if.end.6592
.if.end.6592:
br label %.if.end.6537
.if.end.6537:
br label %.if.end.6527
.if.end.6527:
br label %.if.end.6517
.if.end.6517:
br label %.if.end.6507
.if.end.6507:
br label %.if.end.6497
.if.end.6497:
br label %.if.end.6487
.if.end.6487:
%.tmp6714 = bitcast ptr null to i8*
ret i8* %.tmp6714
}
define void @m1777$append_error.v.m1777$.CompilerCtx.typep.m717$.Error.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m717$.Error.type* %.e.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp6715 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* null, i32 1
%.tmp6716 = ptrtoint %m1777$.ErrorList.type* %.tmp6715 to i32
%.tmp6717 = call i8*(i32) @malloc(i32 %.tmp6716)
%.tmp6718 = bitcast i8* %.tmp6717 to %m1777$.ErrorList.type*
%new_err = alloca %m1777$.ErrorList.type*
store %m1777$.ErrorList.type* %.tmp6718, %m1777$.ErrorList.type** %new_err
%.tmp6719 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %new_err
%.tmp6720 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp6719, i32 0, i32 0
%.tmp6721 = load %m717$.Error.type*, %m717$.Error.type** %e
store %m717$.Error.type* %.tmp6721, %m717$.Error.type** %.tmp6720
%.tmp6722 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %new_err
%.tmp6723 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp6722, i32 0, i32 1
store %m1777$.ErrorList.type* null, %m1777$.ErrorList.type** %.tmp6723
%.tmp6724 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6725 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6724, i32 0, i32 2
%.tmp6726 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp6725
%.tmp6727 = icmp eq %m1777$.ErrorList.type* %.tmp6726, null
br i1 %.tmp6727, label %.if.true.6728, label %.if.false.6728
.if.true.6728:
%.tmp6729 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6730 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6729, i32 0, i32 2
%.tmp6731 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %new_err
store %m1777$.ErrorList.type* %.tmp6731, %m1777$.ErrorList.type** %.tmp6730
ret void
br label %.if.end.6728
.if.false.6728:
br label %.if.end.6728
.if.end.6728:
%last = alloca %m1777$.ErrorList.type*
store %m1777$.ErrorList.type* null, %m1777$.ErrorList.type** %last
%.tmp6733 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6734 = getelementptr %m1777$.CompilerCtx.type, %m1777$.CompilerCtx.type* %.tmp6733, i32 0, i32 2
%.tmp6735 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp6734
store %m1777$.ErrorList.type* %.tmp6735, %m1777$.ErrorList.type** %last
br label %.for.start.6732
.for.start.6732:
%.tmp6736 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %last
%.tmp6737 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp6736, i32 0, i32 1
%.tmp6738 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp6737
%.tmp6739 = icmp ne %m1777$.ErrorList.type* %.tmp6738, null
br i1 %.tmp6739, label %.for.continue.6732, label %.for.end.6732
.for.continue.6732:
%.tmp6740 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %last
%.tmp6741 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp6740, i32 0, i32 1
%.tmp6742 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %.tmp6741
store %m1777$.ErrorList.type* %.tmp6742, %m1777$.ErrorList.type** %last
br label %.for.start.6732
.for.end.6732:
%.tmp6743 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %last
%.tmp6744 = getelementptr %m1777$.ErrorList.type, %m1777$.ErrorList.type* %.tmp6743, i32 0, i32 1
%.tmp6745 = load %m1777$.ErrorList.type*, %m1777$.ErrorList.type** %new_err
store %m1777$.ErrorList.type* %.tmp6745, %m1777$.ErrorList.type** %.tmp6744
ret void
}
define i8* @m1777$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6746 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6747 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6746, i32 0, i32 6
%.tmp6748 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6747
%.tmp6749 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6748, i32 0, i32 7
%.tmp6750 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6749
%.tmp6751 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6750, i32 0, i32 1
%.tmp6752 = load i8*, i8** %.tmp6751
ret i8* %.tmp6752
}
define %m286$.Node.type* @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6754 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6754, %m286$.Node.type** %n
br label %.for.start.6753
.for.start.6753:
%.tmp6755 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6756 = icmp ne %m286$.Node.type* %.tmp6755, null
br i1 %.tmp6756, label %.for.continue.6753, label %.for.end.6753
.for.continue.6753:
%.tmp6757 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6758 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6757, i32 0, i32 0
%.tmp6759 = load i8*, i8** %.tmp6758
%.tmp6760 = load i8*, i8** %type
%.tmp6761 = call i32(i8*,i8*) @strcmp(i8* %.tmp6759, i8* %.tmp6760)
%.tmp6762 = icmp eq i32 %.tmp6761, 0
br i1 %.tmp6762, label %.if.true.6763, label %.if.false.6763
.if.true.6763:
%.tmp6764 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6764
br label %.if.end.6763
.if.false.6763:
br label %.if.end.6763
.if.end.6763:
%.tmp6765 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6766 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6765, i32 0, i32 7
%.tmp6767 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6766
store %m286$.Node.type* %.tmp6767, %m286$.Node.type** %n
br label %.for.start.6753
.for.end.6753:
%.tmp6768 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6768
}
define %m1777$.Type.type* @m1777$syn_function_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6769 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%function_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6769, %m1777$.Type.type** %function_type
%.tmp6770 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6771 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6772 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6771, i32 0, i32 6
%.tmp6773 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6772
%.tmp6774 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp6770, %m286$.Node.type* %.tmp6773)
%return_value_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6774, %m1777$.Type.type** %return_value_type
%.tmp6775 = load %m1777$.Type.type*, %m1777$.Type.type** %function_type
%.tmp6776 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6775, i32 0, i32 0
%.tmp6778 = getelementptr [9 x i8], [9 x i8]*@.str6777, i32 0, i32 0
store i8* %.tmp6778, i8** %.tmp6776
%.tmp6779 = load %m1777$.Type.type*, %m1777$.Type.type** %function_type
%.tmp6780 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6779, i32 0, i32 3
%.tmp6781 = load %m1777$.Type.type*, %m1777$.Type.type** %return_value_type
store %m1777$.Type.type* %.tmp6781, %m1777$.Type.type** %.tmp6780
%.tmp6782 = load %m1777$.Type.type*, %m1777$.Type.type** %return_value_type
%last_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6782, %m1777$.Type.type** %last_type
%.tmp6783 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6784 = call %m286$.Node.type*(%m286$.Node.type*) @m1777$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6783)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6784, %m286$.Node.type** %params
%.tmp6786 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6786, %m286$.Node.type** %param_ptr
br label %.for.start.6785
.for.start.6785:
%.tmp6787 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6788 = icmp ne %m286$.Node.type* %.tmp6787, null
br i1 %.tmp6788, label %.for.continue.6785, label %.for.end.6785
.for.continue.6785:
%.tmp6789 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6790 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6789, i32 0, i32 0
%.tmp6791 = load i8*, i8** %.tmp6790
%.tmp6793 = getelementptr [5 x i8], [5 x i8]*@.str6792, i32 0, i32 0
%.tmp6794 = call i32(i8*,i8*) @strcmp(i8* %.tmp6791, i8* %.tmp6793)
%.tmp6795 = icmp eq i32 %.tmp6794, 0
br i1 %.tmp6795, label %.if.true.6796, label %.if.false.6796
.if.true.6796:
%.tmp6797 = load %m1777$.Type.type*, %m1777$.Type.type** %last_type
%.tmp6798 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6797, i32 0, i32 4
%.tmp6799 = load %m1777$.Type.type*, %m1777$.Type.type** %last_type
%.tmp6800 = call %m1777$.Type.type*(%m1777$.Type.type*) @m1777$type_clone.m1777$.Type.typep.m1777$.Type.typep(%m1777$.Type.type* %.tmp6799)
store %m1777$.Type.type* %.tmp6800, %m1777$.Type.type** %.tmp6798
%.tmp6801 = load %m1777$.Type.type*, %m1777$.Type.type** %last_type
%.tmp6802 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6801, i32 0, i32 4
%.tmp6803 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6802
%.tmp6804 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6803, i32 0, i32 4
store %m1777$.Type.type* null, %m1777$.Type.type** %.tmp6804
%.tmp6805 = load %m1777$.Type.type*, %m1777$.Type.type** %last_type
%.tmp6806 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6805, i32 0, i32 4
%.tmp6807 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6806
store %m1777$.Type.type* %.tmp6807, %m1777$.Type.type** %last_type
%.tmp6808 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6809 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6808, i32 0, i32 7
%.tmp6810 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6809
%.tmp6811 = icmp ne %m286$.Node.type* %.tmp6810, null
br i1 %.tmp6811, label %.if.true.6812, label %.if.false.6812
.if.true.6812:
%.tmp6813 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6814 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6813, i32 0, i32 7
%.tmp6815 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6814
store %m286$.Node.type* %.tmp6815, %m286$.Node.type** %param_ptr
br label %.if.end.6812
.if.false.6812:
br label %.if.end.6812
.if.end.6812:
%.tmp6816 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6817 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6816, i32 0, i32 7
%.tmp6818 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6817
%.tmp6819 = icmp ne %m286$.Node.type* %.tmp6818, null
br i1 %.tmp6819, label %.if.true.6820, label %.if.false.6820
.if.true.6820:
%.tmp6821 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6822 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6821, i32 0, i32 7
%.tmp6823 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6822
store %m286$.Node.type* %.tmp6823, %m286$.Node.type** %param_ptr
br label %.if.end.6820
.if.false.6820:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6820
.if.end.6820:
br label %.if.end.6796
.if.false.6796:
%.tmp6824 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6825 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6826 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6825, i32 0, i32 6
%.tmp6827 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6826
%.tmp6828 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp6824, %m286$.Node.type* %.tmp6827)
%param_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6828, %m1777$.Type.type** %param_type
%.tmp6829 = load %m1777$.Type.type*, %m1777$.Type.type** %last_type
%.tmp6830 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6829, i32 0, i32 4
%.tmp6831 = load %m1777$.Type.type*, %m1777$.Type.type** %param_type
store %m1777$.Type.type* %.tmp6831, %m1777$.Type.type** %.tmp6830
%.tmp6832 = load %m1777$.Type.type*, %m1777$.Type.type** %param_type
store %m1777$.Type.type* %.tmp6832, %m1777$.Type.type** %last_type
%.tmp6833 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6833, i32 0, i32 7
%.tmp6835 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6834
store %m286$.Node.type* %.tmp6835, %m286$.Node.type** %param_ptr
%.tmp6836 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6837 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6836, i32 0, i32 7
%.tmp6838 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6837
%.tmp6839 = icmp ne %m286$.Node.type* %.tmp6838, null
br i1 %.tmp6839, label %.if.true.6840, label %.if.false.6840
.if.true.6840:
%.tmp6841 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6842 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6841, i32 0, i32 7
%.tmp6843 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6842
%.tmp6844 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6843, i32 0, i32 7
%.tmp6845 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6844
store %m286$.Node.type* %.tmp6845, %m286$.Node.type** %param_ptr
br label %.if.end.6840
.if.false.6840:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6840
.if.end.6840:
br label %.if.end.6796
.if.end.6796:
br label %.for.start.6785
.for.end.6785:
%.tmp6846 = load %m1777$.Type.type*, %m1777$.Type.type** %function_type
ret %m1777$.Type.type* %.tmp6846
}
define %m286$.Node.type* @m1777$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6847 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6849 = getelementptr [10 x i8], [10 x i8]*@.str6848, i32 0, i32 0
%.tmp6850 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6847, i8* %.tmp6849)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6850, %m286$.Node.type** %params
%.tmp6851 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6852 = icmp eq %m286$.Node.type* %.tmp6851, null
br i1 %.tmp6852, label %.if.true.6853, label %.if.false.6853
.if.true.6853:
%.tmp6854 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6854
br label %.if.end.6853
.if.false.6853:
br label %.if.end.6853
.if.end.6853:
%.tmp6855 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6856 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6855, i32 0, i32 6
%.tmp6857 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6856
ret %m286$.Node.type* %.tmp6857
}
define %m1777$.Type.type* @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.ctx.arg, %m1777$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6858 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%t = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6858, %m1777$.Type.type** %t
%.tmp6859 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6860 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6859, i32 0, i32 0
%.tmp6861 = load i8*, i8** %.tmp6860
%.tmp6863 = getelementptr [10 x i8], [10 x i8]*@.str6862, i32 0, i32 0
%.tmp6864 = call i32(i8*,i8*) @strcmp(i8* %.tmp6861, i8* %.tmp6863)
%.tmp6865 = icmp eq i32 %.tmp6864, 0
br i1 %.tmp6865, label %.if.true.6866, label %.if.false.6866
.if.true.6866:
%.tmp6867 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6868 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6867, i32 0, i32 0
%.tmp6870 = getelementptr [7 x i8], [7 x i8]*@.str6869, i32 0, i32 0
store i8* %.tmp6870, i8** %.tmp6868
%.tmp6871 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6872 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6871, i32 0, i32 1
store i8* null, i8** %.tmp6872
%.tmp6873 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6874 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6873, i32 0, i32 6
%.tmp6875 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6874
%.tmp6877 = getelementptr [5 x i8], [5 x i8]*@.str6876, i32 0, i32 0
%.tmp6878 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6875, i8* %.tmp6877)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6878, %m286$.Node.type** %curr_type
%.tmp6879 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6880 = icmp ne %m286$.Node.type* %.tmp6879, null
br i1 %.tmp6880, label %.if.true.6881, label %.if.false.6881
.if.true.6881:
%.tmp6882 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6883 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6882, i32 0, i32 3
%.tmp6884 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6885 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6886 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6885, i32 0, i32 6
%.tmp6887 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6886
%.tmp6888 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp6884, %m286$.Node.type* %.tmp6887)
store %m1777$.Type.type* %.tmp6888, %m1777$.Type.type** %.tmp6883
%.tmp6889 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6890 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6889, i32 0, i32 3
%.tmp6891 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6890
%.tmp6892 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6891, i32 0, i32 1
%.tmp6893 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6894 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6893, i32 0, i32 7
%.tmp6895 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6894
%.tmp6896 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6895, i32 0, i32 1
%.tmp6897 = load i8*, i8** %.tmp6896
store i8* %.tmp6897, i8** %.tmp6892
%.tmp6898 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6899 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6898, i32 0, i32 3
%.tmp6900 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6899
%curr_t = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp6900, %m1777$.Type.type** %curr_t
%.tmp6902 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6903 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6902, i32 0, i32 7
%.tmp6904 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6903
%.tmp6906 = getelementptr [5 x i8], [5 x i8]*@.str6905, i32 0, i32 0
%.tmp6907 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6904, i8* %.tmp6906)
store %m286$.Node.type* %.tmp6907, %m286$.Node.type** %curr_type
br label %.for.start.6901
.for.start.6901:
%.tmp6908 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6909 = icmp ne %m286$.Node.type* %.tmp6908, null
br i1 %.tmp6909, label %.for.continue.6901, label %.for.end.6901
.for.continue.6901:
%.tmp6910 = load %m1777$.Type.type*, %m1777$.Type.type** %curr_t
%.tmp6911 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6910, i32 0, i32 4
%.tmp6912 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6913 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6914 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6913, i32 0, i32 6
%.tmp6915 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6914
%.tmp6916 = call %m1777$.Type.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$node_to_type.m1777$.Type.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp6912, %m286$.Node.type* %.tmp6915)
store %m1777$.Type.type* %.tmp6916, %m1777$.Type.type** %.tmp6911
%.tmp6917 = load %m1777$.Type.type*, %m1777$.Type.type** %curr_t
%.tmp6918 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6917, i32 0, i32 4
%.tmp6919 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6918
%.tmp6920 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6919, i32 0, i32 1
%.tmp6921 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6922 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6921, i32 0, i32 7
%.tmp6923 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6922
%.tmp6924 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6923, i32 0, i32 1
%.tmp6925 = load i8*, i8** %.tmp6924
store i8* %.tmp6925, i8** %.tmp6920
%.tmp6926 = load %m1777$.Type.type*, %m1777$.Type.type** %curr_t
%.tmp6927 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6926, i32 0, i32 4
%.tmp6928 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6927
store %m1777$.Type.type* %.tmp6928, %m1777$.Type.type** %curr_t
%.tmp6929 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6930 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6929, i32 0, i32 7
%.tmp6931 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6930
%.tmp6933 = getelementptr [5 x i8], [5 x i8]*@.str6932, i32 0, i32 0
%.tmp6934 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1777$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6931, i8* %.tmp6933)
store %m286$.Node.type* %.tmp6934, %m286$.Node.type** %curr_type
br label %.for.start.6901
.for.end.6901:
br label %.if.end.6881
.if.false.6881:
br label %.if.end.6881
.if.end.6881:
br label %.if.end.6866
.if.false.6866:
%.tmp6935 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6936 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6935, i32 0, i32 0
%.tmp6937 = load i8*, i8** %.tmp6936
%.tmp6939 = getelementptr [12 x i8], [12 x i8]*@.str6938, i32 0, i32 0
%.tmp6940 = call i32(i8*,i8*) @strcmp(i8* %.tmp6937, i8* %.tmp6939)
%.tmp6941 = icmp eq i32 %.tmp6940, 0
br i1 %.tmp6941, label %.if.true.6942, label %.if.false.6942
.if.true.6942:
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp6943 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6944 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6945 = call %m1777$.ScopeItem.type*(%m1777$.CompilerCtx.type*,%m286$.Node.type*) @m1777$find_defined.m1777$.ScopeItem.typep.m1777$.CompilerCtx.typep.m286$.Node.typep(%m1777$.CompilerCtx.type* %.tmp6943, %m286$.Node.type* %.tmp6944)
%base = alloca %m1777$.ScopeItem.type*
store %m1777$.ScopeItem.type* %.tmp6945, %m1777$.ScopeItem.type** %base
%.tmp6946 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %base
%.tmp6947 = icmp eq %m1777$.ScopeItem.type* %.tmp6946, null
br i1 %.tmp6947, label %.if.true.6948, label %.if.false.6948
.if.true.6948:
%.tmp6949 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6951 = getelementptr [37 x i8], [37 x i8]*@.str6950, i32 0, i32 0
%.tmp6952 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6953 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6952, i32 0, i32 6
%.tmp6954 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6953
%.tmp6955 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6954, i32 0, i32 1
%.tmp6956 = load i8*, i8** %.tmp6955
%.tmp6957 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6949, i8* %.tmp6951, i8* %.tmp6956)
%.tmp6958 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp6959 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6960 = load i8*, i8** %err_msg
call void(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$new_error.v.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp6958, %m286$.Node.type* %.tmp6959, i8* %.tmp6960)
%.tmp6961 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6962 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6961, i32 0, i32 0
%.tmp6964 = getelementptr [6 x i8], [6 x i8]*@.str6963, i32 0, i32 0
store i8* %.tmp6964, i8** %.tmp6962
%.tmp6965 = load %m1777$.Type.type*, %m1777$.Type.type** %t
ret %m1777$.Type.type* %.tmp6965
br label %.if.end.6948
.if.false.6948:
br label %.if.end.6948
.if.end.6948:
%.tmp6966 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6967 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6966, i32 0, i32 0
%.tmp6969 = getelementptr [10 x i8], [10 x i8]*@.str6968, i32 0, i32 0
store i8* %.tmp6969, i8** %.tmp6967
%.tmp6970 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6971 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6970, i32 0, i32 1
%.tmp6972 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %base
%.tmp6973 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp6972, i32 0, i32 0
%.tmp6974 = load i8*, i8** %.tmp6973
store i8* %.tmp6974, i8** %.tmp6971
%.tmp6975 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6976 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6975, i32 0, i32 2
%.tmp6977 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %base
%.tmp6978 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp6977, i32 0, i32 1
%.tmp6979 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp6978
%.tmp6980 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6979, i32 0, i32 0
%.tmp6981 = load i8*, i8** %.tmp6980
store i8* %.tmp6981, i8** %.tmp6976
%.tmp6982 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6983 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6982, i32 0, i32 3
%.tmp6984 = load %m1777$.ScopeItem.type*, %m1777$.ScopeItem.type** %base
%.tmp6985 = getelementptr %m1777$.ScopeItem.type, %m1777$.ScopeItem.type* %.tmp6984, i32 0, i32 1
%.tmp6986 = load %m1777$.AssignableInfo.type*, %m1777$.AssignableInfo.type** %.tmp6985
%.tmp6987 = getelementptr %m1777$.AssignableInfo.type, %m1777$.AssignableInfo.type* %.tmp6986, i32 0, i32 3
%.tmp6988 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp6987
store %m1777$.Type.type* %.tmp6988, %m1777$.Type.type** %.tmp6983
br label %.if.end.6942
.if.false.6942:
%.tmp6989 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6990 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6989, i32 0, i32 1
%.tmp6991 = load i8*, i8** %.tmp6990
%.tmp6993 = getelementptr [4 x i8], [4 x i8]*@.str6992, i32 0, i32 0
%.tmp6994 = call i32(i8*,i8*) @strcmp(i8* %.tmp6991, i8* %.tmp6993)
%.tmp6995 = icmp eq i32 %.tmp6994, 0
br i1 %.tmp6995, label %.if.true.6996, label %.if.false.6996
.if.true.6996:
%.tmp6997 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp6998 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp6997, i32 0, i32 0
%.tmp7000 = getelementptr [4 x i8], [4 x i8]*@.str6999, i32 0, i32 0
store i8* %.tmp7000, i8** %.tmp6998
%.tmp7001 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp7002 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7001, i32 0, i32 3
%.tmp7003 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
store %m1777$.Type.type* %.tmp7003, %m1777$.Type.type** %.tmp7002
%.tmp7004 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp7005 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7004, i32 0, i32 3
%.tmp7006 = load %m1777$.Type.type*, %m1777$.Type.type** %.tmp7005
%.tmp7007 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7006, i32 0, i32 0
%.tmp7009 = getelementptr [4 x i8], [4 x i8]*@.str7008, i32 0, i32 0
store i8* %.tmp7009, i8** %.tmp7007
br label %.if.end.6996
.if.false.6996:
%.tmp7010 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7011 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7010, i32 0, i32 0
%.tmp7012 = load i8*, i8** %.tmp7011
%.tmp7014 = getelementptr [5 x i8], [5 x i8]*@.str7013, i32 0, i32 0
%.tmp7015 = call i32(i8*,i8*) @strcmp(i8* %.tmp7012, i8* %.tmp7014)
%.tmp7016 = icmp eq i32 %.tmp7015, 0
br i1 %.tmp7016, label %.if.true.7017, label %.if.false.7017
.if.true.7017:
%.tmp7018 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp7019 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7018, i32 0, i32 0
%.tmp7020 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7021 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7020, i32 0, i32 1
%.tmp7022 = load i8*, i8** %.tmp7021
store i8* %.tmp7022, i8** %.tmp7019
br label %.if.end.7017
.if.false.7017:
%.tmp7023 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7023, i32 0, i32 1
%.tmp7025 = load i8*, i8** %.tmp7024
%.tmp7027 = getelementptr [4 x i8], [4 x i8]*@.str7026, i32 0, i32 0
%.tmp7028 = call i32(i8*,i8*) @strcmp(i8* %.tmp7025, i8* %.tmp7027)
%.tmp7029 = icmp eq i32 %.tmp7028, 0
br i1 %.tmp7029, label %.if.true.7030, label %.if.false.7030
.if.true.7030:
%.tmp7031 = load %m1777$.Type.type*, %m1777$.Type.type** %t
%.tmp7032 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7031, i32 0, i32 0
%.tmp7034 = getelementptr [7 x i8], [7 x i8]*@.str7033, i32 0, i32 0
store i8* %.tmp7034, i8** %.tmp7032
br label %.if.end.7030
.if.false.7030:
%.tmp7035 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp7036 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7038 = getelementptr [54 x i8], [54 x i8]*@.str7037, i32 0, i32 0
%.tmp7039 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp7035, %m286$.Node.type* %.tmp7036, i8* %.tmp7038)
%.tmp7040 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7041 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7040, i32 0, i32 0
%.tmp7042 = load i8*, i8** %.tmp7041
%.tmp7043 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7044 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7043, i32 0, i32 1
%.tmp7045 = load i8*, i8** %.tmp7044
%.tmp7046 = call i32(i8*,...) @printf(i8* %.tmp7039, i8* %.tmp7042, i8* %.tmp7045)
%.tmp7047 = bitcast ptr null to %m1777$.Type.type*
ret %m1777$.Type.type* %.tmp7047
br label %.if.end.7030
.if.end.7030:
br label %.if.end.7017
.if.end.7017:
br label %.if.end.6996
.if.end.6996:
br label %.if.end.6942
.if.end.6942:
br label %.if.end.6866
.if.end.6866:
%.tmp7049 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7049, i32 0, i32 7
%.tmp7051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7050
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp7051, %m286$.Node.type** %ptr
br label %.for.start.7048
.for.start.7048:
%.tmp7052 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7053 = icmp ne %m286$.Node.type* %.tmp7052, null
br i1 %.tmp7053, label %.for.continue.7048, label %.for.end.7048
.for.continue.7048:
%.tmp7054 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7055 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7054, i32 0, i32 1
%.tmp7056 = load i8*, i8** %.tmp7055
%.tmp7058 = getelementptr [2 x i8], [2 x i8]*@.str7057, i32 0, i32 0
%.tmp7059 = call i32(i8*,i8*) @strcmp(i8* %.tmp7056, i8* %.tmp7058)
%.tmp7060 = icmp eq i32 %.tmp7059, 0
br i1 %.tmp7060, label %.if.true.7061, label %.if.false.7061
.if.true.7061:
%.tmp7062 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%pt = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp7062, %m1777$.Type.type** %pt
%.tmp7063 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
%.tmp7064 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7063, i32 0, i32 0
%.tmp7066 = getelementptr [4 x i8], [4 x i8]*@.str7065, i32 0, i32 0
store i8* %.tmp7066, i8** %.tmp7064
%.tmp7067 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
%.tmp7068 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7067, i32 0, i32 3
%.tmp7069 = load %m1777$.Type.type*, %m1777$.Type.type** %t
store %m1777$.Type.type* %.tmp7069, %m1777$.Type.type** %.tmp7068
%.tmp7070 = load %m1777$.Type.type*, %m1777$.Type.type** %pt
store %m1777$.Type.type* %.tmp7070, %m1777$.Type.type** %t
br label %.if.end.7061
.if.false.7061:
%.tmp7071 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7072 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7071, i32 0, i32 1
%.tmp7073 = load i8*, i8** %.tmp7072
%.tmp7075 = getelementptr [2 x i8], [2 x i8]*@.str7074, i32 0, i32 0
%.tmp7076 = call i32(i8*,i8*) @strcmp(i8* %.tmp7073, i8* %.tmp7075)
%.tmp7077 = icmp eq i32 %.tmp7076, 0
br i1 %.tmp7077, label %.if.true.7078, label %.if.false.7078
.if.true.7078:
%.tmp7079 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7080 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7079, i32 0, i32 7
%.tmp7081 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7080
%.tmp7082 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7081, i32 0, i32 1
%.tmp7083 = load i8*, i8** %.tmp7082
%.tmp7085 = getelementptr [2 x i8], [2 x i8]*@.str7084, i32 0, i32 0
%.tmp7086 = call i32(i8*,i8*) @strcmp(i8* %.tmp7083, i8* %.tmp7085)
%.tmp7087 = icmp eq i32 %.tmp7086, 0
br i1 %.tmp7087, label %.if.true.7088, label %.if.false.7088
.if.true.7088:
%.tmp7089 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%slice_type = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp7089, %m1777$.Type.type** %slice_type
%.tmp7090 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_type
%.tmp7091 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7090, i32 0, i32 0
%.tmp7093 = getelementptr [7 x i8], [7 x i8]*@.str7092, i32 0, i32 0
store i8* %.tmp7093, i8** %.tmp7091
%.tmp7094 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%slice_c_array = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp7094, %m1777$.Type.type** %slice_c_array
%.tmp7095 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_c_array
%.tmp7096 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7095, i32 0, i32 0
%.tmp7098 = getelementptr [4 x i8], [4 x i8]*@.str7097, i32 0, i32 0
store i8* %.tmp7098, i8** %.tmp7096
%.tmp7099 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_c_array
%.tmp7100 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7099, i32 0, i32 1
%.tmp7102 = getelementptr [6 x i8], [6 x i8]*@.str7101, i32 0, i32 0
store i8* %.tmp7102, i8** %.tmp7100
%.tmp7103 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_c_array
%.tmp7104 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7103, i32 0, i32 3
%.tmp7105 = load %m1777$.Type.type*, %m1777$.Type.type** %t
store %m1777$.Type.type* %.tmp7105, %m1777$.Type.type** %.tmp7104
%.tmp7106 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_type
%.tmp7107 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7106, i32 0, i32 3
%.tmp7108 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_c_array
store %m1777$.Type.type* %.tmp7108, %m1777$.Type.type** %.tmp7107
%.tmp7109 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%slice_len = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp7109, %m1777$.Type.type** %slice_len
%.tmp7110 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_len
%.tmp7111 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7110, i32 0, i32 0
%.tmp7113 = getelementptr [4 x i8], [4 x i8]*@.str7112, i32 0, i32 0
store i8* %.tmp7113, i8** %.tmp7111
%.tmp7114 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_len
%.tmp7115 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7114, i32 0, i32 1
%.tmp7117 = getelementptr [4 x i8], [4 x i8]*@.str7116, i32 0, i32 0
store i8* %.tmp7117, i8** %.tmp7115
%.tmp7118 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_c_array
%.tmp7119 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7118, i32 0, i32 4
%.tmp7120 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_len
store %m1777$.Type.type* %.tmp7120, %m1777$.Type.type** %.tmp7119
%.tmp7121 = call %m1777$.Type.type*() @m1777$new_type.m1777$.Type.typep()
%slice_cap = alloca %m1777$.Type.type*
store %m1777$.Type.type* %.tmp7121, %m1777$.Type.type** %slice_cap
%.tmp7122 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_cap
%.tmp7123 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7122, i32 0, i32 0
%.tmp7125 = getelementptr [4 x i8], [4 x i8]*@.str7124, i32 0, i32 0
store i8* %.tmp7125, i8** %.tmp7123
%.tmp7126 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_cap
%.tmp7127 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7126, i32 0, i32 1
%.tmp7129 = getelementptr [4 x i8], [4 x i8]*@.str7128, i32 0, i32 0
store i8* %.tmp7129, i8** %.tmp7127
%.tmp7130 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_len
%.tmp7131 = getelementptr %m1777$.Type.type, %m1777$.Type.type* %.tmp7130, i32 0, i32 4
%.tmp7132 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_cap
store %m1777$.Type.type* %.tmp7132, %m1777$.Type.type** %.tmp7131
%.tmp7133 = load %m1777$.Type.type*, %m1777$.Type.type** %slice_type
store %m1777$.Type.type* %.tmp7133, %m1777$.Type.type** %t
%.tmp7134 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7135 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7134, i32 0, i32 7
%.tmp7136 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7135
store %m286$.Node.type* %.tmp7136, %m286$.Node.type** %ptr
br label %.if.end.7088
.if.false.7088:
br label %.if.end.7088
.if.end.7088:
br label %.if.end.7078
.if.false.7078:
%.tmp7137 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %ctx
%.tmp7138 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7140 = getelementptr [49 x i8], [49 x i8]*@.str7139, i32 0, i32 0
%.tmp7141 = call i8*(%m1777$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1777$err_tmpl.cp.m1777$.CompilerCtx.typep.m286$.Node.typep.cp(%m1777$.CompilerCtx.type* %.tmp7137, %m286$.Node.type* %.tmp7138, i8* %.tmp7140)
%.tmp7142 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7143 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7142, i32 0, i32 1
%.tmp7144 = load i8*, i8** %.tmp7143
%.tmp7145 = call i32(i8*,...) @printf(i8* %.tmp7141, i8* %.tmp7144)
%.tmp7146 = bitcast ptr null to %m1777$.Type.type*
ret %m1777$.Type.type* %.tmp7146
br label %.if.end.7078
.if.end.7078:
br label %.if.end.7061
.if.end.7061:
%.tmp7147 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7148 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7147, i32 0, i32 7
%.tmp7149 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7148
store %m286$.Node.type* %.tmp7149, %m286$.Node.type** %ptr
br label %.for.start.7048
.for.end.7048:
%.tmp7150 = load %m1777$.Type.type*, %m1777$.Type.type** %t
ret %m1777$.Type.type* %.tmp7150
}
@.str2538 = constant [5 x i8] c"%s{\0A\00"
@.str2542 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2549 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2556 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2568 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2572 = constant [10 x i8] c"%s  of: \0A\00"
@.str2586 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2590 = constant [12 x i8] c"%s  next: \0A\00"
@.str2599 = constant [5 x i8] c"%s}\0A\00"
@.str2657 = constant [5 x i8] c"%c%s\00"
@.str2668 = constant [7 x i8] c".tmp%d\00"
@.str2746 = constant [1 x i8] c"\00"
@.str2785 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2816 = constant [6 x i8] c"start\00"
@.str2865 = constant [6 x i8] c"start\00"
@.str2871 = constant [7 x i8] c"global\00"
@.str2881 = constant [13 x i8] c"head_comment\00"
@.str2918 = constant [7 x i8] c"string\00"
@.str2927 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2957 = constant [5 x i8] c"%s%s\00"
@.str2965 = constant [9 x i8] c"function\00"
@.str2971 = constant [5 x i8] c"main\00"
@.str2983 = constant [6 x i8] c"%s.%s\00"
@.str3000 = constant [3 x i8] c"NL\00"
@.str3008 = constant [7 x i8] c"global\00"
@.str3016 = constant [11 x i8] c"assignable\00"
@.str3044 = constant [9 x i8] c"variable\00"
@.str3055 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3070 = constant [10 x i8] c"typealias\00"
@.str3090 = constant [11 x i8] c"%s.%s.type\00"
@.str3102 = constant [10 x i8] c"typealias\00"
@.str3123 = constant [5 x i8] c"type\00"
@.str3150 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3163 = constant [7 x i8] c"extern\00"
@.str3181 = constant [7 x i8] c"extern\00"
@.str3220 = constant [15 x i8] c"declare %s %s(\00"
@.str3251 = constant [3 x i8] c", \00"
@.str3257 = constant [3 x i8] c"%s\00"
@.str3269 = constant [3 x i8] c")\0A\00"
@.str3280 = constant [9 x i8] c"function\00"
@.str3289 = constant [9 x i8] c"function\00"
@.str3326 = constant [14 x i8] c"define %s %s(\00"
@.str3352 = constant [3 x i8] c", \00"
@.str3358 = constant [5 x i8] c"type\00"
@.str3374 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3389 = constant [5 x i8] c") {\0A\00"
@.str3393 = constant [9 x i8] c"function\00"
@.str3402 = constant [6 x i8] c"block\00"
@.str3420 = constant [3 x i8] c"NL\00"
@.str3427 = constant [9 x i8] c"OPERATOR\00"
@.str3445 = constant [7 x i8] c"return\00"
@.str3455 = constant [5 x i8] c"void\00"
@.str3462 = constant [21 x i8] c"missing return value\00"
@.str3467 = constant [10 x i8] c"ret void\0A\00"
@.str3473 = constant [3 x i8] c"}\0A\00"
@.str3479 = constant [7 x i8] c"import\00"
@.str3524 = constant [1 x i8] c"\00"
@.str3530 = constant [6 x i8] c"%s.bn\00"
@.str3535 = constant [9 x i8] c"%s/%s.bn\00"
@.str3547 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3604 = constant [5 x i8] c"m%d$\00"
@.str3653 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3661 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3690 = constant [9 x i8] c"variable\00"
@.str3695 = constant [5 x i8] c"type\00"
@.str3725 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3737 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3749 = constant [6 x i8] c"block\00"
@.str3762 = constant [11 x i8] c"expression\00"
@.str3789 = constant [7 x i8] c"sizeof\00"
@.str3795 = constant [8 x i8] c"fn_args\00"
@.str3801 = constant [11 x i8] c"assignable\00"
@.str3826 = constant [4 x i8] c"int\00"
@.str3837 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3846 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3872 = constant [35 x i8] c"unable to compile function address\00"
@.str3878 = constant [8 x i8] c"fn_args\00"
@.str3881 = constant [1 x i8] c"\00"
@.str3889 = constant [11 x i8] c"assignable\00"
@.str3901 = constant [5 x i8] c"%s, \00"
@.str3917 = constant [8 x i8] c"%s%s %s\00"
@.str3932 = constant [11 x i8] c"assignable\00"
@.str3942 = constant [5 x i8] c"void\00"
@.str3950 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str3981 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4002 = constant [7 x i8] c"return\00"
@.str4014 = constant [3 x i8] c"NL\00"
@.str4032 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4045 = constant [10 x i8] c"ret void\0A\00"
@.str4049 = constant [3 x i8] c"NL\00"
@.str4055 = constant [8 x i8] c"fn_call\00"
@.str4066 = constant [12 x i8] c"declaration\00"
@.str4075 = constant [11 x i8] c"assignment\00"
@.str4083 = constant [11 x i8] c"assignable\00"
@.str4111 = constant [4 x i8] c"ptr\00"
@.str4120 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4130 = constant [9 x i8] c"if_block\00"
@.str4138 = constant [9 x i8] c"for_loop\00"
@.str4146 = constant [8 x i8] c"keyword\00"
@.str4161 = constant [6 x i8] c"break\00"
@.str4175 = constant [4 x i8] c"for\00"
@.str4183 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4197 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4204 = constant [9 x i8] c"continue\00"
@.str4218 = constant [4 x i8] c"for\00"
@.str4226 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4240 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4244 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4255 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4270 = constant [14 x i8] c".for.start.%d\00"
@.str4275 = constant [12 x i8] c".for.end.%d\00"
@.str4280 = constant [4 x i8] c"for\00"
@.str4287 = constant [12 x i8] c"declaration\00"
@.str4298 = constant [11 x i8] c"assignment\00"
@.str4308 = constant [9 x i8] c"OPERATOR\00"
@.str4315 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4326 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4333 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4340 = constant [9 x i8] c"OPERATOR\00"
@.str4349 = constant [9 x i8] c"OPERATOR\00"
@.str4356 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4364 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4379 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4386 = constant [9 x i8] c"OPERATOR\00"
@.str4393 = constant [6 x i8] c"block\00"
@.str4407 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4414 = constant [5 x i8] c"%s:\0A\00"
@.str4426 = constant [5 x i8] c"type\00"
@.str4441 = constant [11 x i8] c"assignable\00"
@.str4454 = constant [9 x i8] c"variable\00"
@.str4459 = constant [5 x i8] c"WORD\00"
@.str4467 = constant [31 x i8] c"unable to get declaration name\00"
@.str4473 = constant [6 x i8] c"%s.%d\00"
@.str4526 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4542 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4554 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4589 = constant [4 x i8] c"int\00"
@.str4596 = constant [4 x i8] c"chr\00"
@.str4604 = constant [5 x i8] c"bool\00"
@.str4613 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str4622 = constant [4 x i8] c"ptr\00"
@.str4630 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4633 = constant [5 x i8] c"null\00"
@.str4641 = constant [7 x i8] c"struct\00"
@.str4662 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4682 = constant [10 x i8] c"typealias\00"
@.str4705 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4724 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str4741 = constant [11 x i8] c"assignable\00"
@.str4755 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4770 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4777 = constant [6 x i8] c"block\00"
@.str4785 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4792 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4799 = constant [11 x i8] c"elif_block\00"
@.str4810 = constant [11 x i8] c"else_block\00"
@.str4820 = constant [6 x i8] c"block\00"
@.str4830 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4837 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4857 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4865 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4914 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4935 = constant [7 x i8] c"module\00"
@.str4964 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5006 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5014 = constant [9 x i8] c"function\00"
@.str5021 = constant [7 x i8] c"extern\00"
@.str5033 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5054 = constant [9 x i8] c"variable\00"
@.str5074 = constant [4 x i8] c"ptr\00"
@.str5092 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5116 = constant [10 x i8] c"typealias\00"
@.str5127 = constant [7 x i8] c"struct\00"
@.str5133 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5181 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5201 = constant [9 x i8] c"variable\00"
@.str5211 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5232 = constant [9 x i8] c"variable\00"
@.str5240 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5252 = constant [12 x i8] c"destination\00"
@.str5257 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5283 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5301 = constant [7 x i8] c"module\00"
@.str5323 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5387 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5407 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5430 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5455 = constant [15 x i8] c"hello: %s %s?\0A\00"
@.str5467 = constant [16 x i8] c"mono_assignable\00"
@.str5489 = constant [5 x i8] c"cast\00"
@.str5498 = constant [5 x i8] c"type\00"
@.str5518 = constant [8 x i8] c"bitcast\00"
@.str5525 = constant [4 x i8] c"ptr\00"
@.str5532 = constant [4 x i8] c"ptr\00"
@.str5549 = constant [4 x i8] c"i%d\00"
@.str5554 = constant [4 x i8] c"i%d\00"
@.str5562 = constant [5 x i8] c"sext\00"
@.str5564 = constant [6 x i8] c"trunc\00"
@.str5569 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str5589 = constant [16 x i8] c"mono_assignable\00"
@.str5647 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5670 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5677 = constant [2 x i8] c"+\00"
@.str5682 = constant [4 x i8] c"add\00"
@.str5687 = constant [2 x i8] c"-\00"
@.str5692 = constant [4 x i8] c"sub\00"
@.str5697 = constant [2 x i8] c"*\00"
@.str5702 = constant [4 x i8] c"mul\00"
@.str5707 = constant [2 x i8] c"/\00"
@.str5712 = constant [5 x i8] c"sdiv\00"
@.str5717 = constant [3 x i8] c"==\00"
@.str5722 = constant [8 x i8] c"icmp eq\00"
@.str5727 = constant [3 x i8] c"!=\00"
@.str5732 = constant [8 x i8] c"icmp ne\00"
@.str5737 = constant [2 x i8] c">\00"
@.str5742 = constant [9 x i8] c"icmp sgt\00"
@.str5747 = constant [2 x i8] c"<\00"
@.str5752 = constant [9 x i8] c"icmp slt\00"
@.str5757 = constant [2 x i8] c"&\00"
@.str5762 = constant [4 x i8] c"and\00"
@.str5767 = constant [2 x i8] c"|\00"
@.str5772 = constant [3 x i8] c"or\00"
@.str5777 = constant [3 x i8] c">=\00"
@.str5782 = constant [9 x i8] c"icmp sge\00"
@.str5787 = constant [3 x i8] c"<=\00"
@.str5792 = constant [9 x i8] c"icmp sle\00"
@.str5796 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5803 = constant [4 x i8] c"add\00"
@.str5809 = constant [3 x i8] c"==\00"
@.str5816 = constant [3 x i8] c"!=\00"
@.str5824 = constant [2 x i8] c"|\00"
@.str5832 = constant [2 x i8] c"&\00"
@.str5840 = constant [2 x i8] c">\00"
@.str5848 = constant [2 x i8] c"<\00"
@.str5856 = constant [3 x i8] c">=\00"
@.str5864 = constant [3 x i8] c"<=\00"
@.str5872 = constant [5 x i8] c"bool\00"
@.str5876 = constant [4 x i8] c"int\00"
@.str5886 = constant [7 x i8] c"NUMBER\00"
@.str5900 = constant [4 x i8] c"int\00"
@.str5914 = constant [5 x i8] c"WORD\00"
@.str5924 = constant [5 x i8] c"null\00"
@.str5931 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5945 = constant [5 x i8] c"null\00"
@.str5954 = constant [8 x i8] c"nullptr\00"
@.str5961 = constant [17 x i8] c"addr_destination\00"
@.str5973 = constant [12 x i8] c"destination\00"
@.str6012 = constant [4 x i8] c"ptr\00"
@.str6031 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6043 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6057 = constant [8 x i8] c"boolean\00"
@.str6071 = constant [5 x i8] c"bool\00"
@.str6080 = constant [6 x i8] c"false\00"
@.str6087 = constant [2 x i8] c"0\00"
@.str6091 = constant [2 x i8] c"1\00"
@.str6098 = constant [8 x i8] c"fn_call\00"
@.str6115 = constant [7 x i8] c"STRING\00"
@.str6139 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6155 = constant [4 x i8] c"ptr\00"
@.str6168 = constant [4 x i8] c"chr\00"
@.str6175 = constant [4 x i8] c"CHR\00"
@.str6190 = constant [2 x i8] c"0\00"
@.str6206 = constant [22 x i8] c"Invalid character: %s\00"
@.str6222 = constant [4 x i8] c"chr\00"
@.str6226 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6254 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6260 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6265 = constant [4 x i8] c"int\00"
@.str6270 = constant [2 x i8] c"i\00"
@.str6275 = constant [5 x i8] c"bool\00"
@.str6280 = constant [2 x i8] c"b\00"
@.str6285 = constant [5 x i8] c"void\00"
@.str6290 = constant [2 x i8] c"v\00"
@.str6295 = constant [4 x i8] c"chr\00"
@.str6300 = constant [2 x i8] c"c\00"
@.str6305 = constant [4 x i8] c"ptr\00"
@.str6311 = constant [4 x i8] c"%sp\00"
@.str6322 = constant [10 x i8] c"typealias\00"
@.str6333 = constant [6 x i8] c"error\00"
@.str6338 = constant [2 x i8] c"?\00"
@.str6340 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str6350 = constant [7 x i8] c".str%d\00"
@.str6373 = constant [6 x i8] c"array\00"
@.str6386 = constant [4 x i8] c"chr\00"
@.str6404 = constant [3 x i8] c"%d\00"
@.str6413 = constant [7 x i8] c"string\00"
@.str6432 = constant [7 x i8] c"module\00"
@.str6466 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6472 = constant [2 x i8] c"?\00"
@.str6478 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6483 = constant [4 x i8] c"int\00"
@.str6488 = constant [4 x i8] c"i32\00"
@.str6493 = constant [5 x i8] c"void\00"
@.str6498 = constant [5 x i8] c"void\00"
@.str6503 = constant [5 x i8] c"bool\00"
@.str6508 = constant [3 x i8] c"i1\00"
@.str6513 = constant [8 x i8] c"nullptr\00"
@.str6518 = constant [4 x i8] c"ptr\00"
@.str6523 = constant [4 x i8] c"chr\00"
@.str6528 = constant [3 x i8] c"i8\00"
@.str6533 = constant [9 x i8] c"function\00"
@.str6539 = constant [4 x i8] c"%s(\00"
@.str6564 = constant [4 x i8] c"%s,\00"
@.str6569 = constant [5 x i8] c"%s%s\00"
@.str6580 = constant [4 x i8] c"%s)\00"
@.str6588 = constant [4 x i8] c"ptr\00"
@.str6594 = constant [4 x i8] c"%s*\00"
@.str6606 = constant [7 x i8] c"struct\00"
@.str6612 = constant [2 x i8] c"{\00"
@.str6628 = constant [4 x i8] c"%s,\00"
@.str6633 = constant [5 x i8] c"%s%s\00"
@.str6644 = constant [4 x i8] c"%s}\00"
@.str6652 = constant [6 x i8] c"array\00"
@.str6658 = constant [10 x i8] c"[%s x %s]\00"
@.str6677 = constant [10 x i8] c"typealias\00"
@.str6683 = constant [5 x i8] c"%%%s\00"
@.str6693 = constant [7 x i8] c"vararg\00"
@.str6698 = constant [4 x i8] c"...\00"
@.str6703 = constant [6 x i8] c"error\00"
@.str6708 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6777 = constant [9 x i8] c"function\00"
@.str6792 = constant [5 x i8] c"WORD\00"
@.str6848 = constant [10 x i8] c"fn_params\00"
@.str6862 = constant [10 x i8] c"structdef\00"
@.str6869 = constant [7 x i8] c"struct\00"
@.str6876 = constant [5 x i8] c"type\00"
@.str6905 = constant [5 x i8] c"type\00"
@.str6932 = constant [5 x i8] c"type\00"
@.str6938 = constant [12 x i8] c"dotted_name\00"
@.str6950 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6963 = constant [6 x i8] c"error\00"
@.str6968 = constant [10 x i8] c"typealias\00"
@.str6992 = constant [4 x i8] c"str\00"
@.str6999 = constant [4 x i8] c"ptr\00"
@.str7008 = constant [4 x i8] c"chr\00"
@.str7013 = constant [5 x i8] c"WORD\00"
@.str7026 = constant [4 x i8] c"...\00"
@.str7033 = constant [7 x i8] c"vararg\00"
@.str7037 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7057 = constant [2 x i8] c"*\00"
@.str7065 = constant [4 x i8] c"ptr\00"
@.str7074 = constant [2 x i8] c"[\00"
@.str7084 = constant [2 x i8] c"]\00"
@.str7092 = constant [7 x i8] c"struct\00"
@.str7097 = constant [4 x i8] c"ptr\00"
@.str7101 = constant [6 x i8] c"c_arr\00"
@.str7112 = constant [4 x i8] c"int\00"
@.str7116 = constant [4 x i8] c"len\00"
@.str7124 = constant [4 x i8] c"int\00"
@.str7128 = constant [4 x i8] c"cap\00"
@.str7139 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7151 = load i32, i32* %argc
%.tmp7152 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7151, i8** %.tmp7152)
%.tmp7153 = load i32, i32* @STDERR
%.tmp7155 = getelementptr [2 x i8], [2 x i8]*@.str7154, i32 0, i32 0
%.tmp7156 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7153, i8* %.tmp7155)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7156, %m0$.File.type** %stderr
%.tmp7157 = load i8**, i8*** %argv
%.tmp7158 = getelementptr i8*, i8** %.tmp7157, i32 1
%.tmp7159 = load i8*, i8** %.tmp7158
%filename = alloca i8*
store i8* %.tmp7159, i8** %filename
%.tmp7160 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7160, %m0$.File.type** %llvm_code
%.tmp7161 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7162 = load i8*, i8** %filename
%.tmp7163 = call %m1777$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1777$new_context.m1777$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7161, i8* %.tmp7162)
%compiler_ctx = alloca %m1777$.CompilerCtx.type*
store %m1777$.CompilerCtx.type* %.tmp7163, %m1777$.CompilerCtx.type** %compiler_ctx
%.tmp7164 = load %m1777$.CompilerCtx.type*, %m1777$.CompilerCtx.type** %compiler_ctx
%.tmp7165 = load i8*, i8** %filename
%.tmp7166 = call i1(%m1777$.CompilerCtx.type*,i8*) @m1777$compile_file.b.m1777$.CompilerCtx.typep.cp(%m1777$.CompilerCtx.type* %.tmp7164, i8* %.tmp7165)
br i1 %.tmp7166, label %.if.true.7167, label %.if.false.7167
.if.true.7167:
%.tmp7168 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7170 = getelementptr [34 x i8], [34 x i8]*@.str7169, i32 0, i32 0
%.tmp7171 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7168, i8* %.tmp7170)
ret i32 1
br label %.if.end.7167
.if.false.7167:
br label %.if.end.7167
.if.end.7167:
%.tmp7172 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7173 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7172)
%.tmp7174 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7175 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7174)
%llvm_code_size = alloca i32
store i32 %.tmp7175, i32* %llvm_code_size
%.tmp7176 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7176)
%.tmp7178 = getelementptr [30 x i8], [30 x i8]*@.str7177, i32 0, i32 0
%.tmp7180 = getelementptr [2 x i8], [2 x i8]*@.str7179, i32 0, i32 0
%.tmp7181 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7178, i8* %.tmp7180)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7181, %m0$.File.type** %proc
%.tmp7182 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7183 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7182)
%.tmp7184 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7185 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7184)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7183, i32 %.tmp7185)
%.tmp7186 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7187 = icmp eq %m0$.File.type* %.tmp7186, null
br i1 %.tmp7187, label %.if.true.7188, label %.if.false.7188
.if.true.7188:
%.tmp7189 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7191 = getelementptr [28 x i8], [28 x i8]*@.str7190, i32 0, i32 0
%.tmp7192 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7189, i8* %.tmp7191)
ret i32 0
br label %.if.end.7188
.if.false.7188:
br label %.if.end.7188
.if.end.7188:
%.tmp7193 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7194 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7193)
%.tmp7195 = icmp ne i32 %.tmp7194, 0
br i1 %.tmp7195, label %.if.true.7196, label %.if.false.7196
.if.true.7196:
%.tmp7197 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7199 = getelementptr [24 x i8], [24 x i8]*@.str7198, i32 0, i32 0
%.tmp7200 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7197, i8* %.tmp7199)
ret i32 0
br label %.if.end.7196
.if.false.7196:
br label %.if.end.7196
.if.end.7196:
%.tmp7202 = getelementptr [17 x i8], [17 x i8]*@.str7201, i32 0, i32 0
%.tmp7204 = getelementptr [2 x i8], [2 x i8]*@.str7203, i32 0, i32 0
%.tmp7205 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7202, i8* %.tmp7204)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7205, %m0$.File.type** %gcc_proc
%.tmp7206 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp7207 = icmp eq %m0$.File.type* %.tmp7206, null
br i1 %.tmp7207, label %.if.true.7208, label %.if.false.7208
.if.true.7208:
%.tmp7209 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7211 = getelementptr [28 x i8], [28 x i8]*@.str7210, i32 0, i32 0
%.tmp7212 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7209, i8* %.tmp7211)
ret i32 0
br label %.if.end.7208
.if.false.7208:
br label %.if.end.7208
.if.end.7208:
%.tmp7213 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7214 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7213)
%.tmp7215 = icmp ne i32 %.tmp7214, 0
br i1 %.tmp7215, label %.if.true.7216, label %.if.false.7216
.if.true.7216:
%.tmp7217 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7219 = getelementptr [23 x i8], [23 x i8]*@.str7218, i32 0, i32 0
%.tmp7220 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7217, i8* %.tmp7219)
br label %.if.end.7216
.if.false.7216:
%.tmp7222 = getelementptr [32 x i8], [32 x i8]*@.str7221, i32 0, i32 0
%.tmp7223 = load i8*, i8** %filename
%.tmp7224 = call i32(i8*,...) @printf(i8* %.tmp7222, i8* %.tmp7223)
br label %.if.end.7216
.if.end.7216:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7225 = load i32, i32* %argc
%.tmp7226 = icmp eq i32 %.tmp7225, 2
br i1 %.tmp7226, label %.if.true.7227, label %.if.false.7227
.if.true.7227:
ret void
br label %.if.end.7227
.if.false.7227:
br label %.if.end.7227
.if.end.7227:
%.tmp7229 = getelementptr [21 x i8], [21 x i8]*@.str7228, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp7229, i8** %tmpl
%.tmp7230 = load i8**, i8*** %argv
%.tmp7231 = getelementptr i8*, i8** %.tmp7230, i32 0
%.tmp7232 = load i8*, i8** %.tmp7231
%.tmp7233 = call i32(i8*) @strlen(i8* %.tmp7232)
%.tmp7234 = load i8*, i8** %tmpl
%.tmp7235 = call i32(i8*) @strlen(i8* %.tmp7234)
%.tmp7236 = add i32 %.tmp7233, %.tmp7235
%len_filename = alloca i32
store i32 %.tmp7236, i32* %len_filename
%.tmp7237 = load i32, i32* %len_filename
%.tmp7238 = call i8*(i32) @malloc(i32 %.tmp7237)
%buf = alloca i8*
store i8* %.tmp7238, i8** %buf
%.tmp7239 = load i8*, i8** %buf
%.tmp7240 = load i8*, i8** %tmpl
%.tmp7241 = load i8**, i8*** %argv
%.tmp7242 = getelementptr i8*, i8** %.tmp7241, i32 0
%.tmp7243 = load i8*, i8** %.tmp7242
%.tmp7244 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7239, i8* %.tmp7240, i8* %.tmp7243)
%.tmp7245 = load i8*, i8** %buf
%.tmp7246 = call i32(i8*) @puts(i8* %.tmp7245)
%.tmp7247 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp7247)
call void(i32) @exit(i32 1)
ret void
}
@.str7154 = constant [2 x i8] c"w\00"
@.str7169 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7177 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7179 = constant [2 x i8] c"w\00"
@.str7190 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7198 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7201 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7203 = constant [2 x i8] c"w\00"
@.str7210 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7218 = constant [23 x i8] c"error on gcc execution\00"
@.str7221 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7228 = constant [21 x i8] c"Usage: %s <filename>\00"
