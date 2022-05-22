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
%.tmp394 = icmp sge i32 %.tmp392, %.tmp393
br i1 %.tmp394, label %.if.true.395, label %.if.false.395
.if.true.395:
%.tmp397 = getelementptr [25 x i8], [25 x i8]*@.str396, i32 0, i32 0
%.tmp398 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp399 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp398, i32 0, i32 6
%.tmp400 = load i8*, i8** %.tmp399
%.tmp401 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp402 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp401, i32 0, i32 1
%.tmp403 = load i32, i32* %.tmp402
%.tmp404 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp405 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp404, i32 0, i32 2
%.tmp406 = load i32, i32* %.tmp405
%.tmp407 = load i32, i32* %idx
%.tmp408 = load i32, i32* %max_token_size
%.tmp409 = load i8, i8* %c
%.tmp410 = call i32(i8*,...) @printf(i8* %.tmp397, i8* %.tmp400, i32 %.tmp403, i32 %.tmp406, i32 %.tmp407, i32 %.tmp408, i8 %.tmp409)
br label %.if.end.395
.if.false.395:
br label %.if.end.395
.if.end.395:
%.tmp411 = load i32, i32* %idx
%.tmp412 = load i32, i32* %max_token_size
%.tmp413 = icmp slt i32 %.tmp411, %.tmp412
%.tmp415 = getelementptr [16 x i8], [16 x i8]*@.str414, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp413, i8* %.tmp415)
%.tmp416 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp417 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp416)
store i8 %.tmp417, i8* %c
br label %.for.start.383
.for.end.383:
%.tmp418 = load i32, i32* %idx
%.tmp419 = load i8*, i8** %buf
%.tmp420 = getelementptr i8, i8* %.tmp419, i32 %.tmp418
store i8 0, i8* %.tmp420
%.tmp421 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp423 = getelementptr [7 x i8], [7 x i8]*@.str422, i32 0, i32 0
%.tmp424 = load i8*, i8** %buf
%.tmp425 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp421, i8* %.tmp423, i8* %.tmp424)
br label %.if.end.380
.if.false.380:
%.tmp426 = load i8, i8* %c
%.tmp427 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp426)
%.tmp428 = load i8, i8* %c
%.tmp429 = icmp eq i8 %.tmp428, 95
%.tmp430 = or i1 %.tmp427, %.tmp429
br i1 %.tmp430, label %.if.true.431, label %.if.false.431
.if.true.431:
%.tmp432 = load i32, i32* %max_token_size
%.tmp433 = call i8*(i32) @malloc(i32 %.tmp432)
store i8* %.tmp433, i8** %buf
store i32 0, i32* %idx
br label %.for.start.434
.for.start.434:
%.tmp435 = load i8, i8* %c
%.tmp436 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp435)
%.tmp437 = load i8, i8* %c
%.tmp438 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp437)
%.tmp439 = or i1 %.tmp436, %.tmp438
%.tmp440 = load i8, i8* %c
%.tmp441 = icmp eq i8 %.tmp440, 95
%.tmp442 = or i1 %.tmp439, %.tmp441
br i1 %.tmp442, label %.for.continue.434, label %.for.end.434
.for.continue.434:
%.tmp443 = load i32, i32* %idx
%.tmp444 = load i8*, i8** %buf
%.tmp445 = getelementptr i8, i8* %.tmp444, i32 %.tmp443
%.tmp446 = load i8, i8* %c
store i8 %.tmp446, i8* %.tmp445
%.tmp447 = load i32, i32* %idx
%.tmp448 = add i32 %.tmp447, 1
store i32 %.tmp448, i32* %idx
%.tmp449 = load i32, i32* %idx
%.tmp450 = load i32, i32* %max_token_size
%.tmp451 = icmp sge i32 %.tmp449, %.tmp450
br i1 %.tmp451, label %.if.true.452, label %.if.false.452
.if.true.452:
%.tmp454 = getelementptr [20 x i8], [20 x i8]*@.str453, i32 0, i32 0
%.tmp455 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp456 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp455, i32 0, i32 6
%.tmp457 = load i8*, i8** %.tmp456
%.tmp458 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp459 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp458, i32 0, i32 1
%.tmp460 = load i32, i32* %.tmp459
%.tmp461 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp462 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp461, i32 0, i32 2
%.tmp463 = load i32, i32* %.tmp462
%.tmp464 = load i32, i32* %idx
%.tmp465 = load i32, i32* %max_token_size
%.tmp466 = call i32(i8*,...) @printf(i8* %.tmp454, i8* %.tmp457, i32 %.tmp460, i32 %.tmp463, i32 %.tmp464, i32 %.tmp465)
br label %.if.end.452
.if.false.452:
br label %.if.end.452
.if.end.452:
%.tmp467 = load i32, i32* %idx
%.tmp468 = load i32, i32* %max_token_size
%.tmp469 = icmp slt i32 %.tmp467, %.tmp468
%.tmp471 = getelementptr [16 x i8], [16 x i8]*@.str470, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp469, i8* %.tmp471)
%.tmp472 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp473 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp472)
store i8 %.tmp473, i8* %c
br label %.for.start.434
.for.end.434:
%.tmp474 = load i32, i32* %idx
%.tmp475 = load i8*, i8** %buf
%.tmp476 = getelementptr i8, i8* %.tmp475, i32 %.tmp474
store i8 0, i8* %.tmp476
%.tmp477 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp479 = getelementptr [5 x i8], [5 x i8]*@.str478, i32 0, i32 0
%.tmp480 = load i8*, i8** %buf
%.tmp481 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp477, i8* %.tmp479, i8* %.tmp480)
br label %.if.end.431
.if.false.431:
%.tmp482 = load i8, i8* %c
%.tmp483 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp482)
br i1 %.tmp483, label %.if.true.484, label %.if.false.484
.if.true.484:
%.tmp485 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp486 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp485)
store i8 %.tmp486, i8* %c
br label %.if.end.484
.if.false.484:
%.tmp487 = load i8, i8* %c
%.tmp488 = icmp eq i8 %.tmp487, 34
%.tmp489 = load i8, i8* %c
%.tmp490 = icmp eq i8 %.tmp489, 96
%.tmp491 = or i1 %.tmp488, %.tmp490
br i1 %.tmp491, label %.if.true.492, label %.if.false.492
.if.true.492:
%.tmp493 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp494 = load i8, i8* %c
%.tmp495 = call i8*(%m209$.PeekerInfo.type*,i8) @m287$read_string.cp.m209$.PeekerInfo.typep.c(%m209$.PeekerInfo.type* %.tmp493, i8 %.tmp494)
store i8* %.tmp495, i8** %buf
%.tmp496 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp497 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp496)
store i8 %.tmp497, i8* %c
%.tmp498 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp500 = getelementptr [7 x i8], [7 x i8]*@.str499, i32 0, i32 0
%.tmp501 = load i8*, i8** %buf
%.tmp502 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp498, i8* %.tmp500, i8* %.tmp501)
br label %.if.end.492
.if.false.492:
%.tmp503 = load i8, i8* %c
%.tmp504 = icmp eq i8 %.tmp503, 39
br i1 %.tmp504, label %.if.true.505, label %.if.false.505
.if.true.505:
%.tmp506 = load i32, i32* %max_token_size
%.tmp507 = call i8*(i32) @malloc(i32 %.tmp506)
store i8* %.tmp507, i8** %buf
%.tmp508 = load i8*, i8** %buf
%.tmp509 = getelementptr i8, i8* %.tmp508, i32 0
%.tmp510 = load i8, i8* %c
store i8 %.tmp510, i8* %.tmp509
%.tmp511 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp512 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp511)
store i8 %.tmp512, i8* %c
store i32 1, i32* %idx
br label %.for.start.513
.for.start.513:
%.tmp514 = load i8, i8* %c
%.tmp515 = icmp ne i8 %.tmp514, 39
br i1 %.tmp515, label %.for.continue.513, label %.for.end.513
.for.continue.513:
%.tmp516 = load i32, i32* %idx
%.tmp517 = load i32, i32* %max_token_size
%.tmp518 = sub i32 %.tmp517, 2
%.tmp519 = icmp slt i32 %.tmp516, %.tmp518
%.tmp521 = getelementptr [15 x i8], [15 x i8]*@.str520, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp519, i8* %.tmp521)
%.tmp522 = load i32, i32* %idx
%.tmp523 = load i8*, i8** %buf
%.tmp524 = getelementptr i8, i8* %.tmp523, i32 %.tmp522
%.tmp525 = load i8, i8* %c
store i8 %.tmp525, i8* %.tmp524
%.tmp526 = load i32, i32* %idx
%.tmp527 = add i32 %.tmp526, 1
store i32 %.tmp527, i32* %idx
%.tmp528 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp529 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp528)
store i8 %.tmp529, i8* %c
br label %.for.start.513
.for.end.513:
%.tmp530 = load i32, i32* %idx
%.tmp531 = load i8*, i8** %buf
%.tmp532 = getelementptr i8, i8* %.tmp531, i32 %.tmp530
%.tmp533 = load i8, i8* %c
store i8 %.tmp533, i8* %.tmp532
%.tmp534 = load i32, i32* %idx
%.tmp535 = add i32 %.tmp534, 1
%.tmp536 = load i8*, i8** %buf
%.tmp537 = getelementptr i8, i8* %.tmp536, i32 %.tmp535
store i8 0, i8* %.tmp537
%.tmp538 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp539 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp538)
store i8 %.tmp539, i8* %c
%.tmp540 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp542 = getelementptr [4 x i8], [4 x i8]*@.str541, i32 0, i32 0
%.tmp543 = load i8*, i8** %buf
%.tmp544 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp540, i8* %.tmp542, i8* %.tmp543)
br label %.if.end.505
.if.false.505:
%.tmp545 = load i8, i8* %c
%.tmp546 = icmp eq i8 %.tmp545, 10
br i1 %.tmp546, label %.if.true.547, label %.if.false.547
.if.true.547:
%.tmp548 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp550 = getelementptr [3 x i8], [3 x i8]*@.str549, i32 0, i32 0
%.tmp552 = getelementptr [2 x i8], [2 x i8]*@.str551, i32 0, i32 0
%.tmp553 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp548, i8* %.tmp550, i8* %.tmp552)
%.tmp554 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp555 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp554)
store i8 %.tmp555, i8* %c
br label %.if.end.547
.if.false.547:
%.tmp556 = load i8, i8* %c
%.tmp557 = icmp eq i8 %.tmp556, 45
br i1 %.tmp557, label %.if.true.558, label %.if.false.558
.if.true.558:
%.tmp559 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp560 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp559)
store i8 %.tmp560, i8* %c
%.tmp561 = load i8, i8* %c
%.tmp562 = icmp eq i8 %.tmp561, 45
br i1 %.tmp562, label %.if.true.563, label %.if.false.563
.if.true.563:
%.tmp564 = load i32, i32* %max_token_size
%.tmp565 = call i8*(i32) @malloc(i32 %.tmp564)
store i8* %.tmp565, i8** %buf
%.tmp566 = load i8*, i8** %buf
%.tmp567 = getelementptr i8, i8* %.tmp566, i32 0
store i8 45, i8* %.tmp567
store i32 1, i32* %idx
br label %.for.start.568
.for.start.568:
%.tmp569 = load i8, i8* %c
%.tmp570 = icmp ne i8 %.tmp569, 10
%.tmp571 = load i8, i8* %c
%.tmp572 = icmp ne i8 %.tmp571, 0
%.tmp573 = and i1 %.tmp570, %.tmp572
br i1 %.tmp573, label %.for.continue.568, label %.for.end.568
.for.continue.568:
%.tmp574 = load i32, i32* %idx
%.tmp575 = load i8*, i8** %buf
%.tmp576 = getelementptr i8, i8* %.tmp575, i32 %.tmp574
%.tmp577 = load i8, i8* %c
store i8 %.tmp577, i8* %.tmp576
%.tmp578 = load i32, i32* %idx
%.tmp579 = add i32 %.tmp578, 1
store i32 %.tmp579, i32* %idx
%.tmp580 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp581 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp580)
store i8 %.tmp581, i8* %c
br label %.for.start.568
.for.end.568:
%.tmp582 = load i32, i32* %idx
%.tmp583 = load i8*, i8** %buf
%.tmp584 = getelementptr i8, i8* %.tmp583, i32 %.tmp582
store i8 0, i8* %.tmp584
%.tmp585 = load i1, i1* %keep_comments
br i1 %.tmp585, label %.if.true.586, label %.if.false.586
.if.true.586:
%.tmp587 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp589 = getelementptr [8 x i8], [8 x i8]*@.str588, i32 0, i32 0
%.tmp590 = load i8*, i8** %buf
%.tmp591 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp587, i8* %.tmp589, i8* %.tmp590)
br label %.if.end.586
.if.false.586:
%.tmp592 = load i8*, i8** %buf
%.tmp593 = bitcast i8* %.tmp592 to i8*
call void(i8*) @free(i8* %.tmp593)
br label %.if.end.586
.if.end.586:
br label %.if.end.563
.if.false.563:
%.tmp594 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp596 = getelementptr [9 x i8], [9 x i8]*@.str595, i32 0, i32 0
%.tmp598 = getelementptr [2 x i8], [2 x i8]*@.str597, i32 0, i32 0
%.tmp599 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp594, i8* %.tmp596, i8* %.tmp598)
br label %.if.end.563
.if.end.563:
br label %.if.end.558
.if.false.558:
%.tmp600 = load i8, i8* %c
%.tmp601 = icmp sgt i8 %.tmp600, 126
br i1 %.tmp601, label %.if.true.602, label %.if.false.602
.if.true.602:
%.tmp604 = getelementptr [47 x i8], [47 x i8]*@.str603, i32 0, i32 0
%.tmp605 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp606 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp605, i32 0, i32 1
%.tmp607 = load i32, i32* %.tmp606
%.tmp608 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp609 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp608, i32 0, i32 2
%.tmp610 = load i32, i32* %.tmp609
%.tmp611 = load i8, i8* %c
%.tmp612 = load i8, i8* %c
%.tmp613 = call i32(i8*,...) @printf(i8* %.tmp604, i32 %.tmp607, i32 %.tmp610, i8 %.tmp611, i8 %.tmp612)
call void(i32) @exit(i32 1)
br label %.if.end.602
.if.false.602:
br label %.if.end.602
.if.end.602:
%.tmp614 = load i8, i8* %c
%prev_c = alloca i8
store i8 %.tmp614, i8* %prev_c
%.tmp615 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp616 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp615)
store i8 %.tmp616, i8* %c
%.tmp618 = getelementptr [9 x i8], [9 x i8]*@.str617, i32 0, i32 0
%type = alloca i8*
store i8* %.tmp618, i8** %type
%.tmp619 = load i8, i8* %prev_c
%.tmp620 = icmp eq i8 %.tmp619, 61
%.tmp621 = load i8, i8* %c
%.tmp622 = icmp eq i8 %.tmp621, 61
%.tmp623 = and i1 %.tmp620, %.tmp622
br i1 %.tmp623, label %.if.true.624, label %.if.false.624
.if.true.624:
%.tmp625 = getelementptr i8*, i8** %buf, i32 0
%.tmp627 = getelementptr [3 x i8], [3 x i8]*@.str626, i32 0, i32 0
%.tmp628 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp625, i8* %.tmp627)
%.tmp629 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp630 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp629)
store i8 %.tmp630, i8* %c
br label %.if.end.624
.if.false.624:
%.tmp631 = load i8, i8* %prev_c
%.tmp632 = icmp eq i8 %.tmp631, 33
%.tmp633 = load i8, i8* %c
%.tmp634 = icmp eq i8 %.tmp633, 61
%.tmp635 = and i1 %.tmp632, %.tmp634
br i1 %.tmp635, label %.if.true.636, label %.if.false.636
.if.true.636:
%.tmp637 = getelementptr i8*, i8** %buf, i32 0
%.tmp639 = getelementptr [3 x i8], [3 x i8]*@.str638, i32 0, i32 0
%.tmp640 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp637, i8* %.tmp639)
%.tmp641 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp642 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp641)
store i8 %.tmp642, i8* %c
br label %.if.end.636
.if.false.636:
%.tmp643 = load i8, i8* %prev_c
%.tmp644 = icmp eq i8 %.tmp643, 62
%.tmp645 = load i8, i8* %c
%.tmp646 = icmp eq i8 %.tmp645, 61
%.tmp647 = and i1 %.tmp644, %.tmp646
br i1 %.tmp647, label %.if.true.648, label %.if.false.648
.if.true.648:
%.tmp649 = getelementptr i8*, i8** %buf, i32 0
%.tmp651 = getelementptr [3 x i8], [3 x i8]*@.str650, i32 0, i32 0
%.tmp652 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp649, i8* %.tmp651)
%.tmp653 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp654 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp653)
store i8 %.tmp654, i8* %c
br label %.if.end.648
.if.false.648:
%.tmp655 = load i8, i8* %prev_c
%.tmp656 = icmp eq i8 %.tmp655, 60
%.tmp657 = load i8, i8* %c
%.tmp658 = icmp eq i8 %.tmp657, 61
%.tmp659 = and i1 %.tmp656, %.tmp658
br i1 %.tmp659, label %.if.true.660, label %.if.false.660
.if.true.660:
%.tmp661 = getelementptr i8*, i8** %buf, i32 0
%.tmp663 = getelementptr [3 x i8], [3 x i8]*@.str662, i32 0, i32 0
%.tmp664 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp661, i8* %.tmp663)
%.tmp665 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp666 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp665)
store i8 %.tmp666, i8* %c
br label %.if.end.660
.if.false.660:
%.tmp667 = load i8, i8* %prev_c
%.tmp668 = icmp eq i8 %.tmp667, 46
%.tmp669 = load i8, i8* %c
%.tmp670 = icmp eq i8 %.tmp669, 46
%.tmp671 = and i1 %.tmp668, %.tmp670
br i1 %.tmp671, label %.if.true.672, label %.if.false.672
.if.true.672:
%.tmp673 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp674 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp673)
store i8 %.tmp674, i8* %c
%.tmp675 = load i8, i8* %c
%.tmp676 = icmp ne i8 %.tmp675, 46
br i1 %.tmp676, label %.if.true.677, label %.if.false.677
.if.true.677:
%.tmp679 = getelementptr [13 x i8], [13 x i8]*@.str678, i32 0, i32 0
%.tmp680 = call i32(i8*,...) @printf(i8* %.tmp679)
call void(i32) @exit(i32 1)
br label %.if.end.677
.if.false.677:
%.tmp681 = getelementptr i8*, i8** %buf, i32 0
%.tmp683 = getelementptr [4 x i8], [4 x i8]*@.str682, i32 0, i32 0
%.tmp684 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp681, i8* %.tmp683)
%.tmp686 = getelementptr [8 x i8], [8 x i8]*@.str685, i32 0, i32 0
store i8* %.tmp686, i8** %type
br label %.if.end.677
.if.end.677:
%.tmp687 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp688 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp687)
store i8 %.tmp688, i8* %c
br label %.if.end.672
.if.false.672:
%.tmp689 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp689, i8** %buf
%.tmp690 = load i8*, i8** %buf
%.tmp691 = getelementptr i8, i8* %.tmp690, i32 0
%.tmp692 = load i8, i8* %prev_c
store i8 %.tmp692, i8* %.tmp691
%.tmp693 = load i8*, i8** %buf
%.tmp694 = getelementptr i8, i8* %.tmp693, i32 1
store i8 0, i8* %.tmp694
br label %.if.end.672
.if.end.672:
br label %.if.end.660
.if.end.660:
br label %.if.end.648
.if.end.648:
br label %.if.end.636
.if.end.636:
br label %.if.end.624
.if.end.624:
%.tmp695 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp696 = load i8*, i8** %type
%.tmp697 = load i8*, i8** %buf
%.tmp698 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp695, i8* %.tmp696, i8* %.tmp697)
br label %.if.end.558
.if.end.558:
br label %.if.end.547
.if.end.547:
br label %.if.end.505
.if.end.505:
br label %.if.end.492
.if.end.492:
br label %.if.end.484
.if.end.484:
br label %.if.end.431
.if.end.431:
br label %.if.end.380
.if.end.380:
br label %.if.end.375
.if.end.375:
br label %.for.start.358
.for.end.358:
%.tmp699 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp701 = getelementptr [4 x i8], [4 x i8]*@.str700, i32 0, i32 0
%.tmp703 = getelementptr [1 x i8], [1 x i8]*@.str702, i32 0, i32 0
%.tmp704 = call %m287$.Token.type*(%m287$.ParseCtx.type*,i8*,i8*) @m287$push_token.m287$.Token.typep.m287$.ParseCtx.typep.cp.cp(%m287$.ParseCtx.type* %.tmp699, i8* %.tmp701, i8* %.tmp703)
%.tmp705 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp706 = getelementptr %m287$.ParseCtx.type, %m287$.ParseCtx.type* %.tmp705, i32 0, i32 3
%.tmp707 = load %m287$.Token.type*, %m287$.Token.type** %.tmp706
%root = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp707, %m287$.Token.type** %root
%.tmp708 = load %m287$.ParseCtx.type*, %m287$.ParseCtx.type** %ctx
%.tmp709 = bitcast %m287$.ParseCtx.type* %.tmp708 to i8*
call void(i8*) @free(i8* %.tmp709)
%.tmp710 = load %m287$.Token.type*, %m287$.Token.type** %root
%.tmp711 = bitcast %m287$.Token.type* %.tmp710 to %m287$.Token.type*
ret %m287$.Token.type* %.tmp711
}
define i8* @m287$read_string.cp.m209$.PeekerInfo.typep.c(%m209$.PeekerInfo.type* %.p.arg, i8 %.delimeter.arg) {
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.p.arg, %m209$.PeekerInfo.type** %p
%delimeter = alloca i8
store i8 %.delimeter.arg, i8* %delimeter
%str_size = alloca i32
store i32 64, i32* %str_size
%.tmp712 = load i32, i32* %str_size
%.tmp713 = call i8*(i32) @malloc(i32 %.tmp712)
%buf = alloca i8*
store i8* %.tmp713, i8** %buf
%.tmp714 = load i8*, i8** %buf
%.tmp715 = getelementptr i8, i8* %.tmp714, i32 0
%.tmp716 = load i8, i8* %delimeter
store i8 %.tmp716, i8* %.tmp715
%.tmp717 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp718 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp717)
%c = alloca i8
store i8 %.tmp718, i8* %c
%idx = alloca i32
store i32 0, i32* %idx
store i32 1, i32* %idx
br label %.for.start.719
.for.start.719:
%.tmp720 = load i8, i8* %c
%.tmp721 = load i8, i8* %delimeter
%.tmp722 = icmp ne i8 %.tmp720, %.tmp721
br i1 %.tmp722, label %.for.continue.719, label %.for.end.719
.for.continue.719:
%.tmp723 = load i8, i8* %c
%.tmp724 = icmp ne i8 %.tmp723, 0
%.tmp726 = getelementptr [61 x i8], [61 x i8]*@.str725, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp724, i8* %.tmp726)
%.tmp727 = load i32, i32* %idx
%.tmp728 = load i32, i32* %str_size
%.tmp729 = sub i32 %.tmp728, 2
%.tmp730 = icmp eq i32 %.tmp727, %.tmp729
br i1 %.tmp730, label %.if.true.731, label %.if.false.731
.if.true.731:
%.tmp732 = load i32, i32* %str_size
%.tmp733 = mul i32 %.tmp732, 2
store i32 %.tmp733, i32* %str_size
%.tmp734 = load i8*, i8** %buf
%.tmp735 = load i32, i32* %str_size
%.tmp736 = call i8*(i8*,i32) @realloc(i8* %.tmp734, i32 %.tmp735)
store i8* %.tmp736, i8** %buf
br label %.if.end.731
.if.false.731:
br label %.if.end.731
.if.end.731:
%.tmp737 = load i32, i32* %idx
%.tmp738 = load i8*, i8** %buf
%.tmp739 = getelementptr i8, i8* %.tmp738, i32 %.tmp737
%.tmp740 = load i8, i8* %c
store i8 %.tmp740, i8* %.tmp739
%.tmp741 = load i32, i32* %idx
%.tmp742 = add i32 %.tmp741, 1
store i32 %.tmp742, i32* %idx
%.tmp743 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp744 = call i8(%m209$.PeekerInfo.type*) @m209$read.c.m209$.PeekerInfo.typep(%m209$.PeekerInfo.type* %.tmp743)
store i8 %.tmp744, i8* %c
br label %.for.start.719
.for.end.719:
%.tmp745 = load i32, i32* %idx
%.tmp746 = load i8*, i8** %buf
%.tmp747 = getelementptr i8, i8* %.tmp746, i32 %.tmp745
%.tmp748 = load i8, i8* %c
store i8 %.tmp748, i8* %.tmp747
%.tmp749 = load i32, i32* %idx
%.tmp750 = add i32 %.tmp749, 1
%.tmp751 = load i8*, i8** %buf
%.tmp752 = getelementptr i8, i8* %.tmp751, i32 %.tmp750
store i8 0, i8* %.tmp752
%.tmp753 = load i8*, i8** %buf
ret i8* %.tmp753
}
@.str396 = constant [25 x i8] c"%s: %d %d (%d, %d) [%c]\0A\00"
@.str414 = constant [16 x i8] c"digit too large\00"
@.str422 = constant [7 x i8] c"NUMBER\00"
@.str453 = constant [20 x i8] c"%s: %d %d (%d, %d)\0A\00"
@.str470 = constant [16 x i8] c"digit too large\00"
@.str478 = constant [5 x i8] c"WORD\00"
@.str499 = constant [7 x i8] c"STRING\00"
@.str520 = constant [15 x i8] c"char too large\00"
@.str541 = constant [4 x i8] c"CHR\00"
@.str549 = constant [3 x i8] c"NL\00"
@.str551 = constant [2 x i8] c"\0A\00"
@.str588 = constant [8 x i8] c"COMMENT\00"
@.str595 = constant [9 x i8] c"OPERATOR\00"
@.str597 = constant [2 x i8] c"-\00"
@.str603 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str617 = constant [9 x i8] c"OPERATOR\00"
@.str626 = constant [3 x i8] c"==\00"
@.str638 = constant [3 x i8] c"!=\00"
@.str650 = constant [3 x i8] c">=\00"
@.str662 = constant [3 x i8] c"<=\00"
@.str678 = constant [13 x i8] c"error on ..\0A\00"
@.str682 = constant [4 x i8] c"...\00"
@.str685 = constant [8 x i8] c"KEYWORD\00"
@.str700 = constant [4 x i8] c"EOF\00"
@.str702 = constant [1 x i8] c"\00"
@.str725 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
%m754$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m754$.Error.type* @m754$from.m754$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp755 = bitcast ptr null to i8*
%.tmp756 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp757 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp756, i32 0, i32 2
%.tmp758 = load i32, i32* %.tmp757
%.tmp759 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp760 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp759, i32 0, i32 3
%.tmp761 = load i32, i32* %.tmp760
%.tmp762 = load i8*, i8** %message
%.tmp763 = call %m754$.Error.type*(i8*,i32,i32,i8*) @m754$new.m754$.Error.typep.cp.i.i.cp(i8* %.tmp755, i32 %.tmp758, i32 %.tmp761, i8* %.tmp762)
ret %m754$.Error.type* %.tmp763
}
define %m754$.Error.type* @m754$new.m754$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%line = alloca i32
store i32 %.line.arg, i32* %line
%char_of_line = alloca i32
store i32 %.char_of_line.arg, i32* %char_of_line
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp764 = load i32, i32* @Error_size
%.tmp765 = call i8*(i32) @malloc(i32 %.tmp764)
%.tmp766 = bitcast i8* %.tmp765 to %m754$.Error.type*
%e = alloca %m754$.Error.type*
store %m754$.Error.type* %.tmp766, %m754$.Error.type** %e
%.tmp767 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp768 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp767, i32 0, i32 0
%.tmp769 = load i32, i32* %line
store i32 %.tmp769, i32* %.tmp768
%.tmp770 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp771 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp770, i32 0, i32 1
%.tmp772 = load i32, i32* %char_of_line
store i32 %.tmp772, i32* %.tmp771
%.tmp773 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp774 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp773, i32 0, i32 3
%.tmp775 = load i8*, i8** %message
store i8* %.tmp775, i8** %.tmp774
%.tmp776 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp777 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp776, i32 0, i32 2
%.tmp778 = load i8*, i8** %filename
store i8* %.tmp778, i8** %.tmp777
%.tmp779 = load %m754$.Error.type*, %m754$.Error.type** %e
ret %m754$.Error.type* %.tmp779
}
define void @m754$report.v.m754$.Error.typep(%m754$.Error.type* %.e.arg) {
%e = alloca %m754$.Error.type*
store %m754$.Error.type* %.e.arg, %m754$.Error.type** %e
%.tmp781 = getelementptr [22 x i8], [22 x i8]*@.str780, i32 0, i32 0
%.tmp782 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp783 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp782, i32 0, i32 2
%.tmp784 = load i8*, i8** %.tmp783
%.tmp785 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp786 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp785, i32 0, i32 0
%.tmp787 = load i32, i32* %.tmp786
%.tmp788 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp789 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp788, i32 0, i32 1
%.tmp790 = load i32, i32* %.tmp789
%.tmp791 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp792 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp791, i32 0, i32 3
%.tmp793 = load i8*, i8** %.tmp792
%.tmp794 = call i32(i8*,...) @printf(i8* %.tmp781, i8* %.tmp784, i32 %.tmp787, i32 %.tmp790, i8* %.tmp793)
ret void
}
define void @m754$freport.v.m0$.File.typep.m754$.Error.typep(%m0$.File.type* %.fd.arg, %m754$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m754$.Error.type*
store %m754$.Error.type* %.e.arg, %m754$.Error.type** %e
%.tmp795 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp797 = getelementptr [22 x i8], [22 x i8]*@.str796, i32 0, i32 0
%.tmp798 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp799 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp798, i32 0, i32 2
%.tmp800 = load i8*, i8** %.tmp799
%.tmp801 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp802 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp801, i32 0, i32 0
%.tmp803 = load i32, i32* %.tmp802
%.tmp804 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp805 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp804, i32 0, i32 1
%.tmp806 = load i32, i32* %.tmp805
%.tmp807 = load %m754$.Error.type*, %m754$.Error.type** %e
%.tmp808 = getelementptr %m754$.Error.type, %m754$.Error.type* %.tmp807, i32 0, i32 3
%.tmp809 = load i8*, i8** %.tmp808
%.tmp810 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp795, i8* %.tmp797, i8* %.tmp800, i32 %.tmp803, i32 %.tmp806, i8* %.tmp809)
ret void
}
@.str780 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str796 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
%m286$.Query.type = type {i8,i8*,%m286$.Query.type*}
%m286$.Matcher.type = type {%m286$.Query.type*,i8,%m286$.Matcher.type*,%m286$.Matcher.type*}
%m286$.Rule.type = type {i8*,%m286$.Matcher.type*}
%m286$.ParsingContext.type = type {%m287$.Token.type*}
define %m286$.ParsingContext.type* @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp811 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* null, i32 1
%.tmp812 = ptrtoint %m286$.ParsingContext.type* %.tmp811 to i32
%.tmp813 = call i8*(i32) @malloc(i32 %.tmp812)
%.tmp814 = bitcast i8* %.tmp813 to %m286$.ParsingContext.type*
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp814, %m286$.ParsingContext.type** %ctx
%.tmp815 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp816 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp815)
%fd = alloca i32
store i32 %.tmp816, i32* %fd
%.tmp817 = load i32, i32* %fd
%.tmp818 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp817)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp818, %m209$.PeekerInfo.type** %p
%.tmp819 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp820 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp819, i1 0)
%token_list = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp820, %m287$.Token.type** %token_list
%.tmp821 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp822 = bitcast %m209$.PeekerInfo.type* %.tmp821 to i8*
call void(i8*) @free(i8* %.tmp822)
%.tmp823 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp824 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp823, i32 0, i32 0
%.tmp825 = load %m287$.Token.type*, %m287$.Token.type** %token_list
store %m287$.Token.type* %.tmp825, %m287$.Token.type** %.tmp824
%.tmp826 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
ret %m286$.ParsingContext.type* %.tmp826
}
define %m286$.Matcher.type* @m286$new_matcher.m286$.Matcher.typep() {
%.tmp827 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* null, i32 1
%.tmp828 = ptrtoint %m286$.Matcher.type* %.tmp827 to i32
%.tmp829 = call i8*(i32) @malloc(i32 %.tmp828)
%.tmp830 = bitcast i8* %.tmp829 to %m286$.Matcher.type*
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp830, %m286$.Matcher.type** %m
%.tmp831 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp832 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp831, i32 0, i32 1
store i8 49, i8* %.tmp832
%.tmp833 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp834 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp833, i32 0, i32 2
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp834
%.tmp835 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp836 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp835, i32 0, i32 3
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp836
%.tmp837 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp838 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp837, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp838
%.tmp839 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp839
}
define %m286$.Matcher.type* @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* null, %m286$.Matcher.type** %m
%.tmp840 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp841 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp840, i32 0, i32 0
%.tmp842 = load %m287$.Token.type*, %m287$.Token.type** %.tmp841
%.tmp843 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp842, i32 0, i32 1
%.tmp844 = load i8*, i8** %.tmp843
%.tmp846 = getelementptr [2 x i8], [2 x i8]*@.str845, i32 0, i32 0
%.tmp847 = call i32(i8*,i8*) @strcmp(i8* %.tmp844, i8* %.tmp846)
%.tmp848 = icmp eq i32 %.tmp847, 0
br i1 %.tmp848, label %.if.true.849, label %.if.false.849
.if.true.849:
%.tmp850 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp851 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp850, i32 0, i32 0
%.tmp852 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp853 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp852, i32 0, i32 0
%.tmp854 = load %m287$.Token.type*, %m287$.Token.type** %.tmp853
%.tmp855 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp854, i32 0, i32 5
%.tmp856 = load %m287$.Token.type*, %m287$.Token.type** %.tmp855
store %m287$.Token.type* %.tmp856, %m287$.Token.type** %.tmp851
%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp857 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp858 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp857)
store %m286$.Matcher.type* %.tmp858, %m286$.Matcher.type** %m
%.tmp859 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp860 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp859, i32 0, i32 0
%.tmp861 = load %m287$.Token.type*, %m287$.Token.type** %.tmp860
%.tmp862 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp861, i32 0, i32 1
%.tmp863 = load i8*, i8** %.tmp862
%.tmp865 = getelementptr [2 x i8], [2 x i8]*@.str864, i32 0, i32 0
%.tmp866 = call i32(i8*,i8*) @strcmp(i8* %.tmp863, i8* %.tmp865)
%.tmp867 = icmp eq i32 %.tmp866, 0
br i1 %.tmp867, label %.if.true.868, label %.if.false.868
.if.true.868:
%.tmp869 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp870 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp869, i32 0, i32 0
%.tmp871 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp872 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp871, i32 0, i32 0
%.tmp873 = load %m287$.Token.type*, %m287$.Token.type** %.tmp872
%.tmp874 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp873, i32 0, i32 5
%.tmp875 = load %m287$.Token.type*, %m287$.Token.type** %.tmp874
store %m287$.Token.type* %.tmp875, %m287$.Token.type** %.tmp870
%.tmp876 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%last_matcher = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp876, %m286$.Matcher.type** %last_matcher
br label %.for.start.877
.for.start.877:
%.tmp878 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp879 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp878, i32 0, i32 0
%.tmp880 = load %m287$.Token.type*, %m287$.Token.type** %.tmp879
%.tmp881 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp880, i32 0, i32 1
%.tmp882 = load i8*, i8** %.tmp881
%.tmp884 = getelementptr [2 x i8], [2 x i8]*@.str883, i32 0, i32 0
%.tmp885 = call i32(i8*,i8*) @strcmp(i8* %.tmp882, i8* %.tmp884)
%.tmp886 = icmp ne i32 %.tmp885, 0
%.tmp887 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp888 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp887, i32 0, i32 0
%.tmp889 = load %m287$.Token.type*, %m287$.Token.type** %.tmp888
%.tmp890 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp889, i32 0, i32 0
%.tmp891 = load i8*, i8** %.tmp890
%.tmp893 = getelementptr [4 x i8], [4 x i8]*@.str892, i32 0, i32 0
%.tmp894 = call i32(i8*,i8*) @strcmp(i8* %.tmp891, i8* %.tmp893)
%.tmp895 = icmp ne i32 %.tmp894, 0
%.tmp896 = and i1 %.tmp886, %.tmp895
br i1 %.tmp896, label %.for.continue.877, label %.for.end.877
.for.continue.877:
%.tmp897 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp898 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp897, i32 0, i32 2
%.tmp899 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp900 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp899)
store %m286$.Matcher.type* %.tmp900, %m286$.Matcher.type** %.tmp898
%.tmp901 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp902 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp901, i32 0, i32 2
%.tmp903 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp902
store %m286$.Matcher.type* %.tmp903, %m286$.Matcher.type** %last_matcher
%.tmp904 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp905 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp904, i32 0, i32 0
%.tmp906 = load %m287$.Token.type*, %m287$.Token.type** %.tmp905
%.tmp907 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp906, i32 0, i32 1
%.tmp908 = load i8*, i8** %.tmp907
%.tmp910 = getelementptr [2 x i8], [2 x i8]*@.str909, i32 0, i32 0
%.tmp911 = call i32(i8*,i8*) @strcmp(i8* %.tmp908, i8* %.tmp910)
%.tmp912 = icmp ne i32 %.tmp911, 0
%.tmp913 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp914 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp913, i32 0, i32 0
%.tmp915 = load %m287$.Token.type*, %m287$.Token.type** %.tmp914
%.tmp916 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp915, i32 0, i32 1
%.tmp917 = load i8*, i8** %.tmp916
%.tmp919 = getelementptr [2 x i8], [2 x i8]*@.str918, i32 0, i32 0
%.tmp920 = call i32(i8*,i8*) @strcmp(i8* %.tmp917, i8* %.tmp919)
%.tmp921 = icmp ne i32 %.tmp920, 0
%.tmp922 = and i1 %.tmp912, %.tmp921
br i1 %.tmp922, label %.if.true.923, label %.if.false.923
.if.true.923:
%.tmp925 = getelementptr [48 x i8], [48 x i8]*@.str924, i32 0, i32 0
%.tmp926 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp927 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp926, i32 0, i32 0
%.tmp928 = load %m287$.Token.type*, %m287$.Token.type** %.tmp927
%.tmp929 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp928, i32 0, i32 2
%.tmp930 = load i32, i32* %.tmp929
%.tmp931 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp932 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp931, i32 0, i32 0
%.tmp933 = load %m287$.Token.type*, %m287$.Token.type** %.tmp932
%.tmp934 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp933, i32 0, i32 3
%.tmp935 = load i32, i32* %.tmp934
%.tmp936 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp937 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp936, i32 0, i32 0
%.tmp938 = load %m287$.Token.type*, %m287$.Token.type** %.tmp937
%.tmp939 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp938, i32 0, i32 1
%.tmp940 = load i8*, i8** %.tmp939
%.tmp941 = call i32(i8*,...) @printf(i8* %.tmp925, i32 %.tmp930, i32 %.tmp935, i8* %.tmp940)
call void(i32) @exit(i32 1)
br label %.if.end.923
.if.false.923:
br label %.if.end.923
.if.end.923:
%.tmp942 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp943 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp942, i32 0, i32 0
%.tmp944 = load %m287$.Token.type*, %m287$.Token.type** %.tmp943
%.tmp945 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp944, i32 0, i32 1
%.tmp946 = load i8*, i8** %.tmp945
%.tmp948 = getelementptr [2 x i8], [2 x i8]*@.str947, i32 0, i32 0
%.tmp949 = call i32(i8*,i8*) @strcmp(i8* %.tmp946, i8* %.tmp948)
%.tmp950 = icmp eq i32 %.tmp949, 0
br i1 %.tmp950, label %.if.true.951, label %.if.false.951
.if.true.951:
%.tmp952 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp953 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp952, i32 0, i32 0
%.tmp954 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp955 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp954, i32 0, i32 0
%.tmp956 = load %m287$.Token.type*, %m287$.Token.type** %.tmp955
%.tmp957 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp956, i32 0, i32 5
%.tmp958 = load %m287$.Token.type*, %m287$.Token.type** %.tmp957
store %m287$.Token.type* %.tmp958, %m287$.Token.type** %.tmp953
br label %.if.end.951
.if.false.951:
br label %.if.end.951
.if.end.951:
br label %.for.start.877
.for.end.877:
br label %.if.end.868
.if.false.868:
br label %.if.end.868
.if.end.868:
%.tmp959 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp960 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp959, i32 0, i32 0
%.tmp961 = load %m287$.Token.type*, %m287$.Token.type** %.tmp960
%.tmp962 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp961, i32 0, i32 1
%.tmp963 = load i8*, i8** %.tmp962
%.tmp965 = getelementptr [2 x i8], [2 x i8]*@.str964, i32 0, i32 0
%.tmp966 = call i32(i8*,i8*) @strcmp(i8* %.tmp963, i8* %.tmp965)
%.tmp967 = icmp ne i32 %.tmp966, 0
br i1 %.tmp967, label %.if.true.968, label %.if.false.968
.if.true.968:
%.tmp969 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp971 = getelementptr [22 x i8], [22 x i8]*@.str970, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp969, i8* %.tmp971)
br label %.if.end.968
.if.false.968:
br label %.if.end.968
.if.end.968:
%.tmp972 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp973 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp972, i32 0, i32 0
%.tmp974 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp975 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp974, i32 0, i32 0
%.tmp976 = load %m287$.Token.type*, %m287$.Token.type** %.tmp975
%.tmp977 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp976, i32 0, i32 5
%.tmp978 = load %m287$.Token.type*, %m287$.Token.type** %.tmp977
store %m287$.Token.type* %.tmp978, %m287$.Token.type** %.tmp973
%.tmp979 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp980 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp979, i32 0, i32 0
%.tmp981 = load %m287$.Token.type*, %m287$.Token.type** %.tmp980
%.tmp982 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp981, i32 0, i32 1
%.tmp983 = load i8*, i8** %.tmp982
%.tmp985 = getelementptr [2 x i8], [2 x i8]*@.str984, i32 0, i32 0
%.tmp986 = call i32(i8*,i8*) @strcmp(i8* %.tmp983, i8* %.tmp985)
%.tmp987 = icmp eq i32 %.tmp986, 0
br i1 %.tmp987, label %.if.true.988, label %.if.false.988
.if.true.988:
%.tmp989 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp990 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp989, i32 0, i32 0
%.tmp991 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp992 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp991, i32 0, i32 0
%.tmp993 = load %m287$.Token.type*, %m287$.Token.type** %.tmp992
%.tmp994 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp993, i32 0, i32 5
%.tmp995 = load %m287$.Token.type*, %m287$.Token.type** %.tmp994
store %m287$.Token.type* %.tmp995, %m287$.Token.type** %.tmp990
%.tmp996 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp997 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp996, i32 0, i32 1
store i8 43, i8* %.tmp997
br label %.if.end.988
.if.false.988:
%.tmp998 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp999 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp998, i32 0, i32 0
%.tmp1000 = load %m287$.Token.type*, %m287$.Token.type** %.tmp999
%.tmp1001 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1000, i32 0, i32 1
%.tmp1002 = load i8*, i8** %.tmp1001
%.tmp1004 = getelementptr [2 x i8], [2 x i8]*@.str1003, i32 0, i32 0
%.tmp1005 = call i32(i8*,i8*) @strcmp(i8* %.tmp1002, i8* %.tmp1004)
%.tmp1006 = icmp eq i32 %.tmp1005, 0
br i1 %.tmp1006, label %.if.true.1007, label %.if.false.1007
.if.true.1007:
%.tmp1008 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1009 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1008, i32 0, i32 0
%.tmp1010 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1011 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1010, i32 0, i32 0
%.tmp1012 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1011
%.tmp1013 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1012, i32 0, i32 5
%.tmp1014 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1013
store %m287$.Token.type* %.tmp1014, %m287$.Token.type** %.tmp1009
%.tmp1015 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1016 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1015, i32 0, i32 1
store i8 42, i8* %.tmp1016
br label %.if.end.1007
.if.false.1007:
%.tmp1017 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1018 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1017, i32 0, i32 0
%.tmp1019 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1018
%.tmp1020 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1019, i32 0, i32 1
%.tmp1021 = load i8*, i8** %.tmp1020
%.tmp1023 = getelementptr [2 x i8], [2 x i8]*@.str1022, i32 0, i32 0
%.tmp1024 = call i32(i8*,i8*) @strcmp(i8* %.tmp1021, i8* %.tmp1023)
%.tmp1025 = icmp eq i32 %.tmp1024, 0
br i1 %.tmp1025, label %.if.true.1026, label %.if.false.1026
.if.true.1026:
%.tmp1027 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1028 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1027, i32 0, i32 0
%.tmp1029 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1030 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1029, i32 0, i32 0
%.tmp1031 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1030
%.tmp1032 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1031, i32 0, i32 5
%.tmp1033 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1032
store %m287$.Token.type* %.tmp1033, %m287$.Token.type** %.tmp1028
%.tmp1034 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1035 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1034, i32 0, i32 1
store i8 63, i8* %.tmp1035
br label %.if.end.1026
.if.false.1026:
br label %.if.end.1026
.if.end.1026:
br label %.if.end.1007
.if.end.1007:
br label %.if.end.988
.if.end.988:
br label %.if.end.849
.if.false.849:
%.tmp1036 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1037 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1036)
store %m286$.Matcher.type* %.tmp1037, %m286$.Matcher.type** %m
br label %.if.end.849
.if.end.849:
%.tmp1038 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1039 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1038, i32 0, i32 0
%.tmp1040 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1039
%.tmp1041 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1040, i32 0, i32 1
%.tmp1042 = load i8*, i8** %.tmp1041
%.tmp1044 = getelementptr [2 x i8], [2 x i8]*@.str1043, i32 0, i32 0
%.tmp1045 = call i32(i8*,i8*) @strcmp(i8* %.tmp1042, i8* %.tmp1044)
%.tmp1046 = icmp eq i32 %.tmp1045, 0
%.tmp1047 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1048 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1047, i32 0, i32 0
%.tmp1049 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1048
%.tmp1050 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1049, i32 0, i32 0
%.tmp1051 = load i8*, i8** %.tmp1050
%.tmp1053 = getelementptr [5 x i8], [5 x i8]*@.str1052, i32 0, i32 0
%.tmp1054 = call i32(i8*,i8*) @strcmp(i8* %.tmp1051, i8* %.tmp1053)
%.tmp1055 = icmp eq i32 %.tmp1054, 0
%.tmp1056 = or i1 %.tmp1046, %.tmp1055
br i1 %.tmp1056, label %.if.true.1057, label %.if.false.1057
.if.true.1057:
%.tmp1058 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1059 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1058, i32 0, i32 3
%.tmp1060 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1061 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1060)
store %m286$.Matcher.type* %.tmp1061, %m286$.Matcher.type** %.tmp1059
br label %.if.end.1057
.if.false.1057:
br label %.if.end.1057
.if.end.1057:
%.tmp1062 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1062
}
define %m286$.Matcher.type* @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1063 = call %m286$.Matcher.type*() @m286$new_matcher.m286$.Matcher.typep()
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp1063, %m286$.Matcher.type** %m
%count = alloca i32
store i32 0, i32* %count
%.tmp1064 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1065 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1064, i32 0, i32 0
%.tmp1066 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1065
%ptr = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1066, %m287$.Token.type** %ptr
store i32 0, i32* %count
br label %.for.start.1067
.for.start.1067:
%.tmp1068 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1069 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1068, i32 0, i32 0
%.tmp1070 = load i8*, i8** %.tmp1069
%.tmp1072 = getelementptr [5 x i8], [5 x i8]*@.str1071, i32 0, i32 0
%.tmp1073 = call i32(i8*,i8*) @strcmp(i8* %.tmp1070, i8* %.tmp1072)
%.tmp1074 = icmp eq i32 %.tmp1073, 0
%.tmp1075 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1076 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1075, i32 0, i32 0
%.tmp1077 = load i8*, i8** %.tmp1076
%.tmp1079 = getelementptr [7 x i8], [7 x i8]*@.str1078, i32 0, i32 0
%.tmp1080 = call i32(i8*,i8*) @strcmp(i8* %.tmp1077, i8* %.tmp1079)
%.tmp1081 = icmp eq i32 %.tmp1080, 0
%.tmp1082 = or i1 %.tmp1074, %.tmp1081
br i1 %.tmp1082, label %.for.continue.1067, label %.for.end.1067
.for.continue.1067:
%.tmp1083 = load i32, i32* %count
%.tmp1084 = add i32 %.tmp1083, 1
store i32 %.tmp1084, i32* %count
%.tmp1085 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1086 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1085, i32 0, i32 5
%.tmp1087 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1086
store %m287$.Token.type* %.tmp1087, %m287$.Token.type** %ptr
br label %.for.start.1067
.for.end.1067:
%.tmp1088 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1089 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1088, i32 0, i32 0
%.tmp1090 = getelementptr %m286$.Query.type, %m286$.Query.type* null, i32 1
%.tmp1091 = ptrtoint %m286$.Query.type* %.tmp1090 to i32
%.tmp1092 = call i8*(i32) @malloc(i32 %.tmp1091)
%.tmp1093 = bitcast i8* %.tmp1092 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1093, %m286$.Query.type** %.tmp1089
%.tmp1094 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1095 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1094, i32 0, i32 0
%.tmp1096 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1095
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1096, %m286$.Query.type** %q
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1097
.for.start.1097:
%.tmp1098 = load i32, i32* %i
%.tmp1099 = load i32, i32* %count
%.tmp1100 = icmp slt i32 %.tmp1098, %.tmp1099
br i1 %.tmp1100, label %.for.continue.1097, label %.for.end.1097
.for.continue.1097:
%.tmp1101 = load i32, i32* %i
%.tmp1102 = icmp sgt i32 %.tmp1101, 0
br i1 %.tmp1102, label %.if.true.1103, label %.if.false.1103
.if.true.1103:
%.tmp1104 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1105 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1104, i32 0, i32 2
%.tmp1106 = getelementptr %m286$.Query.type, %m286$.Query.type* null, i32 1
%.tmp1107 = ptrtoint %m286$.Query.type* %.tmp1106 to i32
%.tmp1108 = call i8*(i32) @malloc(i32 %.tmp1107)
%.tmp1109 = bitcast i8* %.tmp1108 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1109, %m286$.Query.type** %.tmp1105
%.tmp1110 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1111 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1110, i32 0, i32 2
%.tmp1112 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1111
store %m286$.Query.type* %.tmp1112, %m286$.Query.type** %q
br label %.if.end.1103
.if.false.1103:
br label %.if.end.1103
.if.end.1103:
%.tmp1113 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1114 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1113, i32 0, i32 0
%.tmp1115 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1114
%.tmp1116 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1115, i32 0, i32 0
%.tmp1117 = load i8*, i8** %.tmp1116
%.tmp1119 = getelementptr [7 x i8], [7 x i8]*@.str1118, i32 0, i32 0
%.tmp1120 = call i32(i8*,i8*) @strcmp(i8* %.tmp1117, i8* %.tmp1119)
%.tmp1121 = icmp eq i32 %.tmp1120, 0
br i1 %.tmp1121, label %.if.true.1122, label %.if.false.1122
.if.true.1122:
%.tmp1123 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1124 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1123, i32 0, i32 0
store i8 118, i8* %.tmp1124
br label %.if.end.1122
.if.false.1122:
%.tmp1125 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1126 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1125, i32 0, i32 0
%.tmp1127 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1126
%.tmp1128 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1127, i32 0, i32 1
%.tmp1129 = load i8*, i8** %.tmp1128
%.tmp1130 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1129)
br i1 %.tmp1130, label %.if.true.1131, label %.if.false.1131
.if.true.1131:
%.tmp1132 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1133 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1132, i32 0, i32 0
store i8 97, i8* %.tmp1133
br label %.if.end.1131
.if.false.1131:
%.tmp1134 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1135 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1134, i32 0, i32 0
%.tmp1136 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1135
%.tmp1137 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1136, i32 0, i32 1
%.tmp1138 = load i8*, i8** %.tmp1137
%.tmp1139 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1138)
br i1 %.tmp1139, label %.if.true.1140, label %.if.false.1140
.if.true.1140:
%.tmp1141 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1142 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1141, i32 0, i32 0
store i8 116, i8* %.tmp1142
br label %.if.end.1140
.if.false.1140:
%.tmp1144 = getelementptr [17 x i8], [17 x i8]*@.str1143, i32 0, i32 0
%.tmp1145 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1146 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1145, i32 0, i32 0
%.tmp1147 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1146
%.tmp1148 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1147, i32 0, i32 1
%.tmp1149 = load i8*, i8** %.tmp1148
%.tmp1150 = call i32(i8*,...) @printf(i8* %.tmp1144, i8* %.tmp1149)
%.tmp1151 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1153 = getelementptr [50 x i8], [50 x i8]*@.str1152, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1151, i8* %.tmp1153)
br label %.if.end.1140
.if.end.1140:
br label %.if.end.1131
.if.end.1131:
br label %.if.end.1122
.if.end.1122:
%.tmp1154 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1155 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1154, i32 0, i32 1
%.tmp1156 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1157 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1156, i32 0, i32 0
%.tmp1158 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1157
%.tmp1159 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1158, i32 0, i32 1
%.tmp1160 = load i8*, i8** %.tmp1159
store i8* %.tmp1160, i8** %.tmp1155
%.tmp1161 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1162 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1161, i32 0, i32 2
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1162
%.tmp1163 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1164 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1163, i32 0, i32 0
%.tmp1165 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1166 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1165, i32 0, i32 0
%.tmp1167 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1166
%.tmp1168 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1167, i32 0, i32 5
%.tmp1169 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1168
store %m287$.Token.type* %.tmp1169, %m287$.Token.type** %.tmp1164
%.tmp1170 = load i32, i32* %i
%.tmp1171 = add i32 %.tmp1170, 1
store i32 %.tmp1171, i32* %i
br label %.for.start.1097
.for.end.1097:
%.tmp1172 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1172
}
define %m286$.Rule.type* @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1173 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1174 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1173, i32 0, i32 0
%.tmp1175 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1174
%.tmp1176 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1175, i32 0, i32 1
%.tmp1177 = load i8*, i8** %.tmp1176
%rule_name = alloca i8*
store i8* %.tmp1177, i8** %rule_name
%.tmp1178 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1179 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1178, i32 0, i32 0
%.tmp1180 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1179
%.tmp1181 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load i8*, i8** %.tmp1181
%.tmp1184 = getelementptr [5 x i8], [5 x i8]*@.str1183, i32 0, i32 0
%.tmp1185 = call i32(i8*,i8*) @strcmp(i8* %.tmp1182, i8* %.tmp1184)
%.tmp1186 = icmp ne i32 %.tmp1185, 0
br i1 %.tmp1186, label %.if.true.1187, label %.if.false.1187
.if.true.1187:
%.tmp1189 = getelementptr [37 x i8], [37 x i8]*@.str1188, i32 0, i32 0
%.tmp1190 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1191 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1190, i32 0, i32 0
%.tmp1192 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1191
%.tmp1193 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1192, i32 0, i32 0
%.tmp1194 = load i8*, i8** %.tmp1193
%.tmp1195 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1196 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1195, i32 0, i32 0
%.tmp1197 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1196
%.tmp1198 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1197, i32 0, i32 1
%.tmp1199 = load i8*, i8** %.tmp1198
%.tmp1200 = call i32(i8*,...) @printf(i8* %.tmp1189, i8* %.tmp1194, i8* %.tmp1199)
%.tmp1201 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1203 = getelementptr [31 x i8], [31 x i8]*@.str1202, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1201, i8* %.tmp1203)
br label %.if.end.1187
.if.false.1187:
br label %.if.end.1187
.if.end.1187:
%.tmp1204 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1205 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1204, i32 0, i32 0
%.tmp1206 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1207 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1206, i32 0, i32 0
%.tmp1208 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1207
%.tmp1209 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1208, i32 0, i32 5
%.tmp1210 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1209
store %m287$.Token.type* %.tmp1210, %m287$.Token.type** %.tmp1205
%.tmp1211 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1212 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1211, i32 0, i32 0
%.tmp1213 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1212
%.tmp1214 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1213, i32 0, i32 1
%.tmp1215 = load i8*, i8** %.tmp1214
%.tmp1217 = getelementptr [2 x i8], [2 x i8]*@.str1216, i32 0, i32 0
%.tmp1218 = call i32(i8*,i8*) @strcmp(i8* %.tmp1215, i8* %.tmp1217)
%.tmp1219 = icmp ne i32 %.tmp1218, 0
br i1 %.tmp1219, label %.if.true.1220, label %.if.false.1220
.if.true.1220:
%.tmp1221 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1222 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1221, i32 0, i32 0
%.tmp1223 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1222
%.tmp1224 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1223, i32 0, i32 1
%.tmp1225 = load i8*, i8** %.tmp1224
%.tmp1226 = call i32(i8*,...) @printf(i8* %.tmp1225)
%.tmp1227 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1229 = getelementptr [27 x i8], [27 x i8]*@.str1228, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1227, i8* %.tmp1229)
br label %.if.end.1220
.if.false.1220:
br label %.if.end.1220
.if.end.1220:
%.tmp1230 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1231 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1230, i32 0, i32 0
%.tmp1232 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1233 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1232, i32 0, i32 0
%.tmp1234 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1233
%.tmp1235 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1234, i32 0, i32 5
%.tmp1236 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1235
store %m287$.Token.type* %.tmp1236, %m287$.Token.type** %.tmp1231
%.tmp1237 = getelementptr %m286$.Rule.type, %m286$.Rule.type* null, i32 1
%.tmp1238 = ptrtoint %m286$.Rule.type* %.tmp1237 to i32
%.tmp1239 = call i8*(i32) @malloc(i32 %.tmp1238)
%.tmp1240 = bitcast i8* %.tmp1239 to %m286$.Rule.type*
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1240, %m286$.Rule.type** %rule
%.tmp1241 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1242 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1241, i32 0, i32 0
%.tmp1243 = load i8*, i8** %rule_name
store i8* %.tmp1243, i8** %.tmp1242
%.tmp1244 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1245 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1244, i32 0, i32 1
%.tmp1246 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1247 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1246)
store %m286$.Matcher.type* %.tmp1247, %m286$.Matcher.type** %.tmp1245
%.tmp1248 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1248
}
define void @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1249 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1250 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1249, i32 0, i32 0
%.tmp1251 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1250
%.tmp1252 = load i8*, i8** %error
%.tmp1253 = call %m754$.Error.type*(%m287$.Token.type*,i8*) @m754$from.m754$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1251, i8* %.tmp1252)
%e = alloca %m754$.Error.type*
store %m754$.Error.type* %.tmp1253, %m754$.Error.type** %e
%.tmp1254 = load %m754$.Error.type*, %m754$.Error.type** %e
call void(%m754$.Error.type*) @m754$report.v.m754$.Error.typep(%m754$.Error.type* %.tmp1254)
call void(i32) @exit(i32 1)
ret void
}
define %m286$.Rule.type** @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%max_rules = alloca i32
store i32 40, i32* %max_rules
%.tmp1255 = load i32, i32* @ptr_size
%.tmp1256 = load i32, i32* %max_rules
%.tmp1257 = mul i32 %.tmp1255, %.tmp1256
%.tmp1258 = call i8*(i32) @malloc(i32 %.tmp1257)
%.tmp1259 = bitcast i8* %.tmp1258 to %m286$.Rule.type**
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp1259, %m286$.Rule.type*** %grammar
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1260
.for.start.1260:
%.tmp1261 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1262 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1261, i32 0, i32 0
%.tmp1263 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1262
%.tmp1264 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1263, i32 0, i32 0
%.tmp1265 = load i8*, i8** %.tmp1264
%.tmp1267 = getelementptr [4 x i8], [4 x i8]*@.str1266, i32 0, i32 0
%.tmp1268 = call i32(i8*,i8*) @strcmp(i8* %.tmp1265, i8* %.tmp1267)
%.tmp1269 = icmp ne i32 %.tmp1268, 0
br i1 %.tmp1269, label %.for.continue.1260, label %.for.end.1260
.for.continue.1260:
%.tmp1270 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1271 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1270, i32 0, i32 0
%.tmp1272 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1271
%.tmp1273 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1272, i32 0, i32 0
%.tmp1274 = load i8*, i8** %.tmp1273
%.tmp1276 = getelementptr [3 x i8], [3 x i8]*@.str1275, i32 0, i32 0
%.tmp1277 = call i32(i8*,i8*) @strcmp(i8* %.tmp1274, i8* %.tmp1276)
%.tmp1278 = icmp ne i32 %.tmp1277, 0
br i1 %.tmp1278, label %.if.true.1279, label %.if.false.1279
.if.true.1279:
%.tmp1280 = load i32, i32* %i
%.tmp1281 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1282 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1281, i32 %.tmp1280
%.tmp1283 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1284 = call %m286$.Rule.type*(%m286$.ParsingContext.type*) @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1283)
store %m286$.Rule.type* %.tmp1284, %m286$.Rule.type** %.tmp1282
%.tmp1285 = load i32, i32* %i
%.tmp1286 = add i32 %.tmp1285, 1
store i32 %.tmp1286, i32* %i
br label %.if.end.1279
.if.false.1279:
%.tmp1287 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1288 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1287, i32 0, i32 0
%.tmp1289 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1290 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1289, i32 0, i32 0
%.tmp1291 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1290
%.tmp1292 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1291, i32 0, i32 5
%.tmp1293 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1292
store %m287$.Token.type* %.tmp1293, %m287$.Token.type** %.tmp1288
br label %.if.end.1279
.if.end.1279:
br label %.for.start.1260
.for.end.1260:
%.tmp1294 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1295 = bitcast %m286$.Rule.type** %.tmp1294 to %m286$.Rule.type**
ret %m286$.Rule.type** %.tmp1295
}
%m286$.Node.type = type {i8*,i8*,i8*,i32,i32,%m286$.Node.type*,%m286$.Node.type*,%m286$.Node.type*}
define %m286$.Node.type* @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1296 = getelementptr %m286$.Node.type, %m286$.Node.type* null, i32 1
%.tmp1297 = ptrtoint %m286$.Node.type* %.tmp1296 to i32
%.tmp1298 = call i8*(i32) @malloc(i32 %.tmp1297)
%.tmp1299 = bitcast i8* %.tmp1298 to %m286$.Node.type*
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1299, %m286$.Node.type** %node
%.tmp1300 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1301 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1300, i32 0, i32 0
%.tmp1302 = load i8*, i8** %type
store i8* %.tmp1302, i8** %.tmp1301
%.tmp1303 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1304 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1303, i32 0, i32 1
%.tmp1305 = load i8*, i8** %value
store i8* %.tmp1305, i8** %.tmp1304
%.tmp1306 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1307 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1306, i32 0, i32 3
%.tmp1308 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1309 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1308, i32 0, i32 2
%.tmp1310 = load i32, i32* %.tmp1309
store i32 %.tmp1310, i32* %.tmp1307
%.tmp1311 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1312 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1311, i32 0, i32 2
%.tmp1313 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1314 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1313, i32 0, i32 4
%.tmp1315 = load i8*, i8** %.tmp1314
store i8* %.tmp1315, i8** %.tmp1312
%.tmp1316 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1317 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1316, i32 0, i32 4
%.tmp1318 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1319 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1318, i32 0, i32 3
%.tmp1320 = load i32, i32* %.tmp1319
store i32 %.tmp1320, i32* %.tmp1317
%.tmp1321 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1322 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1321, i32 0, i32 5
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1322
%.tmp1323 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1324 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1323, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1324
%.tmp1325 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1326 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1325, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1326
%.tmp1327 = load %m286$.Node.type*, %m286$.Node.type** %node
ret %m286$.Node.type* %.tmp1327
}
define void @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.parent.arg, %m286$.Node.type* %.child.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%child = alloca %m286$.Node.type*
store %m286$.Node.type* %.child.arg, %m286$.Node.type** %child
%.tmp1328 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1329 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1328, i32 0, i32 6
%.tmp1330 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1329
%.tmp1331 = icmp eq %m286$.Node.type* %.tmp1330, null
br i1 %.tmp1331, label %.if.true.1332, label %.if.false.1332
.if.true.1332:
%.tmp1333 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1334 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1333, i32 0, i32 6
%.tmp1335 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1335, %m286$.Node.type** %.tmp1334
br label %.if.end.1332
.if.false.1332:
%.tmp1336 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1337 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1336, i32 0, i32 6
%.tmp1338 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1337
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1338, %m286$.Node.type** %c
br label %.for.start.1339
.for.start.1339:
%.tmp1340 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1341 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1340, i32 0, i32 7
%.tmp1342 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1341
%.tmp1343 = icmp ne %m286$.Node.type* %.tmp1342, null
br i1 %.tmp1343, label %.for.continue.1339, label %.for.end.1339
.for.continue.1339:
%.tmp1344 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1345 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1344, i32 0, i32 7
%.tmp1346 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1345
store %m286$.Node.type* %.tmp1346, %m286$.Node.type** %c
br label %.for.start.1339
.for.end.1339:
%.tmp1347 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1348 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1347, i32 0, i32 7
%.tmp1349 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1349, %m286$.Node.type** %.tmp1348
br label %.if.end.1332
.if.end.1332:
%.tmp1350 = load %m286$.Node.type*, %m286$.Node.type** %child
%.tmp1351 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1350, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1351
ret void
}
define void @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.parent.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%.tmp1352 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1353 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1352, i32 0, i32 6
%.tmp1354 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1353
%.tmp1355 = icmp eq %m286$.Node.type* %.tmp1354, null
br i1 %.tmp1355, label %.if.true.1356, label %.if.false.1356
.if.true.1356:
ret void
br label %.if.end.1356
.if.false.1356:
br label %.if.end.1356
.if.end.1356:
%.tmp1357 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1358 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1357, i32 0, i32 6
%.tmp1359 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1358
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1359, %m286$.Node.type** %c
%.tmp1360 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1361 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1360, i32 0, i32 7
%.tmp1362 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1361
%.tmp1363 = icmp eq %m286$.Node.type* %.tmp1362, null
br i1 %.tmp1363, label %.if.true.1364, label %.if.false.1364
.if.true.1364:
%.tmp1365 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1366 = bitcast %m286$.Node.type* %.tmp1365 to i8*
call void(i8*) @free(i8* %.tmp1366)
%.tmp1367 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1368 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1367, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1368
ret void
br label %.if.end.1364
.if.false.1364:
br label %.if.end.1364
.if.end.1364:
br label %.for.start.1369
.for.start.1369:
%.tmp1370 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1371 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1370, i32 0, i32 7
%.tmp1372 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1371
%.tmp1373 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1372, i32 0, i32 7
%.tmp1374 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1373
%.tmp1375 = icmp ne %m286$.Node.type* %.tmp1374, null
br i1 %.tmp1375, label %.for.continue.1369, label %.for.end.1369
.for.continue.1369:
%.tmp1376 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1377 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1376, i32 0, i32 7
%.tmp1378 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1377
store %m286$.Node.type* %.tmp1378, %m286$.Node.type** %c
br label %.for.start.1369
.for.end.1369:
%.tmp1379 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1380 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1379, i32 0, i32 7
%.tmp1381 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1380
%.tmp1382 = bitcast %m286$.Node.type* %.tmp1381 to i8*
call void(i8*) @free(i8* %.tmp1382)
%.tmp1383 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1383, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1384
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
br label %.for.start.1385
.for.start.1385:
br i1 1, label %.for.continue.1385, label %.for.end.1385
.for.continue.1385:
%.tmp1386 = load i32, i32* %i
%.tmp1387 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1388 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1387, i32 %.tmp1386
%.tmp1389 = load %m286$.Rule.type*, %m286$.Rule.type** %.tmp1388
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1389, %m286$.Rule.type** %rule
%.tmp1390 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1391 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1390, i32 0, i32 0
%.tmp1392 = load i8*, i8** %.tmp1391
%.tmp1393 = load i8*, i8** %rule_name
%.tmp1394 = call i32(i8*,i8*) @strcmp(i8* %.tmp1392, i8* %.tmp1393)
%.tmp1395 = icmp eq i32 %.tmp1394, 0
br i1 %.tmp1395, label %.if.true.1396, label %.if.false.1396
.if.true.1396:
%.tmp1397 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1397
br label %.if.end.1396
.if.false.1396:
br label %.if.end.1396
.if.end.1396:
%.tmp1398 = load i32, i32* %i
%.tmp1399 = add i32 %.tmp1398, 1
store i32 %.tmp1399, i32* %i
br label %.for.start.1385
.for.end.1385:
%.tmp1400 = bitcast ptr null to %m286$.Rule.type*
ret %m286$.Rule.type* %.tmp1400
}
%m286$.ParseResult.type = type {%m754$.Error.type*,%m286$.Node.type*}
define %m754$.Error.type* @m286$parse_query.m754$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.c.arg, %m286$.Matcher.type* %.m.arg, %m286$.Node.type* %.base.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.m.arg, %m286$.Matcher.type** %m
%base = alloca %m286$.Node.type*
store %m286$.Node.type* %.base.arg, %m286$.Node.type** %base
%child = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %child
%.tmp1401 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1402 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1401, i32 0, i32 0
%.tmp1403 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1402
%start_token = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1403, %m287$.Token.type** %start_token
%new_children = alloca i32
store i32 0, i32* %new_children
%.tmp1404 = bitcast ptr null to %m754$.Error.type*
%err = alloca %m754$.Error.type*
store %m754$.Error.type* %.tmp1404, %m754$.Error.type** %err
%.tmp1406 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1407 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1406, i32 0, i32 0
%.tmp1408 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1407
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1408, %m286$.Query.type** %q
br label %.for.start.1405
.for.start.1405:
%.tmp1409 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1410 = icmp ne %m286$.Query.type* %.tmp1409, null
%.tmp1411 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1412 = icmp eq %m754$.Error.type* %.tmp1411, null
%.tmp1413 = and i1 %.tmp1410, %.tmp1412
br i1 %.tmp1413, label %.for.continue.1405, label %.for.end.1405
.for.continue.1405:
%.tmp1414 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1415 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1414, i32 0, i32 0
%.tmp1416 = load i8, i8* %.tmp1415
%.tmp1417 = icmp eq i8 %.tmp1416, 118
br i1 %.tmp1417, label %.if.true.1418, label %.if.false.1418
.if.true.1418:
%.tmp1419 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1420 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1419, i32 0, i32 1
%.tmp1421 = load i8*, i8** %.tmp1420
%.tmp1422 = call i32(i8*) @strlen(i8* %.tmp1421)
%.tmp1423 = sub i32 %.tmp1422, 2
%qv_len = alloca i32
store i32 %.tmp1423, i32* %qv_len
%.tmp1424 = load i32, i32* %qv_len
%.tmp1425 = add i32 %.tmp1424, 1
%.tmp1426 = call i8*(i32) @malloc(i32 %.tmp1425)
%tmp_buff = alloca i8*
store i8* %.tmp1426, i8** %tmp_buff
%.tmp1427 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1428 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1427, i32 0, i32 1
%.tmp1429 = load i8*, i8** %.tmp1428
%.tmp1431 = getelementptr [8 x i8], [8 x i8]*@.str1430, i32 0, i32 0
%.tmp1432 = load i8*, i8** %tmp_buff
%.tmp1433 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1429, i8* %.tmp1431, i8* %.tmp1432)
%.tmp1434 = load i8*, i8** %tmp_buff
%.tmp1435 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1436 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1435, i32 0, i32 0
%.tmp1437 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1436
%.tmp1438 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1437, i32 0, i32 1
%.tmp1439 = load i8*, i8** %.tmp1438
%.tmp1440 = load i32, i32* %qv_len
%.tmp1441 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1434, i8* %.tmp1439, i32 %.tmp1440)
%.tmp1442 = icmp eq i32 %.tmp1441, 0
%.tmp1443 = load i32, i32* %qv_len
%.tmp1444 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1445 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1444, i32 0, i32 0
%.tmp1446 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1445
%.tmp1447 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1446, i32 0, i32 1
%.tmp1448 = load i8*, i8** %.tmp1447
%.tmp1449 = call i32(i8*) @strlen(i8* %.tmp1448)
%.tmp1450 = icmp eq i32 %.tmp1443, %.tmp1449
%.tmp1451 = and i1 %.tmp1442, %.tmp1450
br i1 %.tmp1451, label %.if.true.1452, label %.if.false.1452
.if.true.1452:
%.tmp1453 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1454 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1453, i32 0, i32 0
%.tmp1455 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1454
%.tmp1456 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1457 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1456, i32 0, i32 0
%.tmp1458 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1457
%.tmp1459 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1458, i32 0, i32 0
%.tmp1460 = load i8*, i8** %.tmp1459
%.tmp1461 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1462 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1461, i32 0, i32 0
%.tmp1463 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1462
%.tmp1464 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1463, i32 0, i32 1
%.tmp1465 = load i8*, i8** %.tmp1464
%.tmp1466 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1455, i8* %.tmp1460, i8* %.tmp1465)
store %m286$.Node.type* %.tmp1466, %m286$.Node.type** %child
%.tmp1467 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1468 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1467, %m286$.Node.type* %.tmp1468)
%.tmp1469 = load i32, i32* %new_children
%.tmp1470 = add i32 %.tmp1469, 1
store i32 %.tmp1470, i32* %new_children
%.tmp1471 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1472 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1471, i32 0, i32 0
%.tmp1473 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1474 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1473, i32 0, i32 0
%.tmp1475 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1474
%.tmp1476 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1475, i32 0, i32 5
%.tmp1477 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1476
store %m287$.Token.type* %.tmp1477, %m287$.Token.type** %.tmp1472
br label %.if.end.1452
.if.false.1452:
%.tmp1478 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1479 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1478, i32 0, i32 0
%.tmp1480 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1479
%.tmp1481 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1480, i32 0, i32 1
%.tmp1482 = load i8*, i8** %.tmp1481
%token_value = alloca i8*
store i8* %.tmp1482, i8** %token_value
%.tmp1483 = load i8*, i8** %token_value
%.tmp1484 = icmp eq i8* %.tmp1483, null
br i1 %.tmp1484, label %.if.true.1485, label %.if.false.1485
.if.true.1485:
%.tmp1487 = getelementptr [7 x i8], [7 x i8]*@.str1486, i32 0, i32 0
store i8* %.tmp1487, i8** %token_value
br label %.if.end.1485
.if.false.1485:
br label %.if.end.1485
.if.end.1485:
%.tmp1489 = getelementptr [15 x i8], [15 x i8]*@.str1488, i32 0, i32 0
%err_fmt = alloca i8*
store i8* %.tmp1489, i8** %err_fmt
%.tmp1491 = getelementptr [31 x i8], [31 x i8]*@.str1490, i32 0, i32 0
%err_msg = alloca i8*
store i8* %.tmp1491, i8** %err_msg
%.tmp1492 = load i8*, i8** %err_msg
%.tmp1493 = call i32(i8*) @strlen(i8* %.tmp1492)
%.tmp1494 = load i8*, i8** %tmp_buff
%.tmp1495 = call i32(i8*) @strlen(i8* %.tmp1494)
%.tmp1496 = add i32 %.tmp1493, %.tmp1495
%.tmp1497 = load i8*, i8** %token_value
%.tmp1498 = call i32(i8*) @strlen(i8* %.tmp1497)
%.tmp1499 = add i32 %.tmp1496, %.tmp1498
%.tmp1500 = load i8*, i8** %err_fmt
%.tmp1501 = call i32(i8*) @strlen(i8* %.tmp1500)
%.tmp1502 = add i32 %.tmp1499, %.tmp1501
%.tmp1503 = mul i32 3, 2
%.tmp1504 = sub i32 %.tmp1502, %.tmp1503
%.tmp1505 = add i32 %.tmp1504, 1
%err_len = alloca i32
store i32 %.tmp1505, i32* %err_len
%.tmp1506 = load i32, i32* %err_len
%.tmp1507 = call i8*(i32) @malloc(i32 %.tmp1506)
%err_buf = alloca i8*
store i8* %.tmp1507, i8** %err_buf
%.tmp1508 = load i8*, i8** %err_buf
%.tmp1509 = load i32, i32* %err_len
%.tmp1510 = load i8*, i8** %err_fmt
%.tmp1511 = load i8*, i8** %err_msg
%.tmp1512 = load i8*, i8** %tmp_buff
%.tmp1513 = load i8*, i8** %token_value
%.tmp1514 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1508, i32 %.tmp1509, i8* %.tmp1510, i8* %.tmp1511, i8* %.tmp1512, i8* %.tmp1513)
%.tmp1515 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1516 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1515, i32 0, i32 0
%.tmp1517 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1516
%.tmp1518 = load i8*, i8** %err_buf
%.tmp1519 = call %m754$.Error.type*(%m287$.Token.type*,i8*) @m754$from.m754$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1517, i8* %.tmp1518)
store %m754$.Error.type* %.tmp1519, %m754$.Error.type** %err
br label %.if.end.1452
.if.end.1452:
%.tmp1520 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp1520)
br label %.if.end.1418
.if.false.1418:
%.tmp1521 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1522 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1521, i32 0, i32 0
%.tmp1523 = load i8, i8* %.tmp1522
%.tmp1524 = icmp eq i8 %.tmp1523, 116
br i1 %.tmp1524, label %.if.true.1525, label %.if.false.1525
.if.true.1525:
%.tmp1526 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1527 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1526, i32 0, i32 1
%.tmp1528 = load i8*, i8** %.tmp1527
%.tmp1529 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1530 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1529, i32 0, i32 0
%.tmp1531 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1530
%.tmp1532 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1531, i32 0, i32 0
%.tmp1533 = load i8*, i8** %.tmp1532
%.tmp1534 = call i32(i8*,i8*) @strcmp(i8* %.tmp1528, i8* %.tmp1533)
%.tmp1535 = icmp eq i32 %.tmp1534, 0
br i1 %.tmp1535, label %.if.true.1536, label %.if.false.1536
.if.true.1536:
%.tmp1537 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1538 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1537, i32 0, i32 0
%.tmp1539 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1538
%.tmp1540 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1541 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1540, i32 0, i32 0
%.tmp1542 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1541
%.tmp1543 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1542, i32 0, i32 0
%.tmp1544 = load i8*, i8** %.tmp1543
%.tmp1545 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1546 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1545, i32 0, i32 0
%.tmp1547 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1546
%.tmp1548 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1547, i32 0, i32 1
%.tmp1549 = load i8*, i8** %.tmp1548
%.tmp1550 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1539, i8* %.tmp1544, i8* %.tmp1549)
store %m286$.Node.type* %.tmp1550, %m286$.Node.type** %child
%.tmp1551 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1552 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1551, %m286$.Node.type* %.tmp1552)
%.tmp1553 = load i32, i32* %new_children
%.tmp1554 = add i32 %.tmp1553, 1
store i32 %.tmp1554, i32* %new_children
%.tmp1555 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1556 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1555, i32 0, i32 0
%.tmp1557 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1558 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1557, i32 0, i32 0
%.tmp1559 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1558
%.tmp1560 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1559, i32 0, i32 5
%.tmp1561 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1560
store %m287$.Token.type* %.tmp1561, %m287$.Token.type** %.tmp1556
br label %.if.end.1536
.if.false.1536:
%.tmp1563 = getelementptr [13 x i8], [13 x i8]*@.str1562, i32 0, i32 0
%err_fmt_t = alloca i8*
store i8* %.tmp1563, i8** %err_fmt_t
%.tmp1565 = getelementptr [30 x i8], [30 x i8]*@.str1564, i32 0, i32 0
%err_msg_t = alloca i8*
store i8* %.tmp1565, i8** %err_msg_t
%.tmp1566 = load i8*, i8** %err_fmt_t
%.tmp1567 = call i32(i8*) @strlen(i8* %.tmp1566)
%.tmp1568 = load i8*, i8** %err_msg_t
%.tmp1569 = call i32(i8*) @strlen(i8* %.tmp1568)
%.tmp1570 = add i32 %.tmp1567, %.tmp1569
%.tmp1571 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1572 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1571, i32 0, i32 1
%.tmp1573 = load i8*, i8** %.tmp1572
%.tmp1574 = call i32(i8*) @strlen(i8* %.tmp1573)
%.tmp1575 = add i32 %.tmp1570, %.tmp1574
%.tmp1576 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1577 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1576, i32 0, i32 0
%.tmp1578 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1577
%.tmp1579 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1578, i32 0, i32 0
%.tmp1580 = load i8*, i8** %.tmp1579
%.tmp1581 = call i32(i8*) @strlen(i8* %.tmp1580)
%.tmp1582 = add i32 %.tmp1575, %.tmp1581
%err_len_t = alloca i32
store i32 %.tmp1582, i32* %err_len_t
%.tmp1583 = load i32, i32* %err_len_t
%.tmp1584 = call i8*(i32) @malloc(i32 %.tmp1583)
%err_buf_t = alloca i8*
store i8* %.tmp1584, i8** %err_buf_t
%.tmp1585 = load i8*, i8** %err_buf_t
%.tmp1586 = load i32, i32* %err_len_t
%.tmp1587 = load i8*, i8** %err_fmt_t
%.tmp1588 = load i8*, i8** %err_msg_t
%.tmp1589 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1590 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1589, i32 0, i32 1
%.tmp1591 = load i8*, i8** %.tmp1590
%.tmp1592 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1593 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1592, i32 0, i32 0
%.tmp1594 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1593
%.tmp1595 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1594, i32 0, i32 0
%.tmp1596 = load i8*, i8** %.tmp1595
%.tmp1597 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1585, i32 %.tmp1586, i8* %.tmp1587, i8* %.tmp1588, i8* %.tmp1591, i8* %.tmp1596)
%.tmp1598 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1599 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1598, i32 0, i32 0
%.tmp1600 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1599
%.tmp1601 = load i8*, i8** %err_buf_t
%.tmp1602 = call %m754$.Error.type*(%m287$.Token.type*,i8*) @m754$from.m754$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1600, i8* %.tmp1601)
store %m754$.Error.type* %.tmp1602, %m754$.Error.type** %err
br label %.if.end.1536
.if.end.1536:
br label %.if.end.1525
.if.false.1525:
%.tmp1603 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1604 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1603, i32 0, i32 0
%.tmp1605 = load i8, i8* %.tmp1604
%.tmp1606 = icmp eq i8 %.tmp1605, 97
br i1 %.tmp1606, label %.if.true.1607, label %.if.false.1607
.if.true.1607:
%.tmp1608 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1609 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1608, i32 0, i32 1
%.tmp1610 = load %m286$.Rule.type**, %m286$.Rule.type*** %.tmp1609
%.tmp1611 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1612 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1611, i32 0, i32 1
%.tmp1613 = load i8*, i8** %.tmp1612
%.tmp1614 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1610, i8* %.tmp1613)
%alias_rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1614, %m286$.Rule.type** %alias_rule
%.tmp1615 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1616 = icmp eq %m286$.Rule.type* %.tmp1615, null
br i1 %.tmp1616, label %.if.true.1617, label %.if.false.1617
.if.true.1617:
%.tmp1618 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1619 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1618, i32 0, i32 0
%.tmp1620 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1619
%.tmp1622 = getelementptr [30 x i8], [30 x i8]*@.str1621, i32 0, i32 0
%.tmp1623 = call %m754$.Error.type*(%m287$.Token.type*,i8*) @m754$from.m754$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1620, i8* %.tmp1622)
store %m754$.Error.type* %.tmp1623, %m754$.Error.type** %err
br label %.if.end.1617
.if.false.1617:
%.tmp1624 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1625 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1626 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1624, %m286$.Rule.type* %.tmp1625)
%parse_result = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1626, %m286$.ParseResult.type** %parse_result
%.tmp1627 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1628 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1627, i32 0, i32 0
%.tmp1629 = load %m754$.Error.type*, %m754$.Error.type** %.tmp1628
%.tmp1630 = icmp ne %m754$.Error.type* %.tmp1629, null
br i1 %.tmp1630, label %.if.true.1631, label %.if.false.1631
.if.true.1631:
%.tmp1632 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1633 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1632, i32 0, i32 0
%.tmp1634 = load %m754$.Error.type*, %m754$.Error.type** %.tmp1633
store %m754$.Error.type* %.tmp1634, %m754$.Error.type** %err
br label %.if.end.1631
.if.false.1631:
%.tmp1635 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1636 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1637 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1636, i32 0, i32 1
%.tmp1638 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1637
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1635, %m286$.Node.type* %.tmp1638)
%.tmp1639 = load i32, i32* %new_children
%.tmp1640 = add i32 %.tmp1639, 1
store i32 %.tmp1640, i32* %new_children
br label %.if.end.1631
.if.end.1631:
%.tmp1641 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1642 = bitcast %m286$.ParseResult.type* %.tmp1641 to i8*
call void(i8*) @free(i8* %.tmp1642)
br label %.if.end.1617
.if.end.1617:
br label %.if.end.1607
.if.false.1607:
%.tmp1644 = getelementptr [41 x i8], [41 x i8]*@.str1643, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1644)
br label %.if.end.1607
.if.end.1607:
br label %.if.end.1525
.if.end.1525:
br label %.if.end.1418
.if.end.1418:
%.tmp1645 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1646 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1645, i32 0, i32 2
%.tmp1647 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1646
store %m286$.Query.type* %.tmp1647, %m286$.Query.type** %q
br label %.for.start.1405
.for.end.1405:
%.tmp1648 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1649 = icmp ne %m754$.Error.type* %.tmp1648, null
br i1 %.tmp1649, label %.if.true.1650, label %.if.false.1650
.if.true.1650:
%.tmp1651 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1652 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1651, i32 0, i32 0
%.tmp1653 = load %m287$.Token.type*, %m287$.Token.type** %start_token
store %m287$.Token.type* %.tmp1653, %m287$.Token.type** %.tmp1652
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1654
.for.start.1654:
%.tmp1655 = load i32, i32* %i
%.tmp1656 = load i32, i32* %new_children
%.tmp1657 = icmp slt i32 %.tmp1655, %.tmp1656
br i1 %.tmp1657, label %.for.continue.1654, label %.for.end.1654
.for.continue.1654:
%.tmp1658 = load %m286$.Node.type*, %m286$.Node.type** %base
call void(%m286$.Node.type*) @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.tmp1658)
%.tmp1659 = load i32, i32* %i
%.tmp1660 = add i32 %.tmp1659, 1
store i32 %.tmp1660, i32* %i
br label %.for.start.1654
.for.end.1654:
br label %.if.end.1650
.if.false.1650:
br label %.if.end.1650
.if.end.1650:
%.tmp1661 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1662 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1661, i32 0, i32 2
%.tmp1663 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1662
%.tmp1664 = icmp ne %m286$.Matcher.type* %.tmp1663, null
%.tmp1665 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1666 = icmp ne %m754$.Error.type* %.tmp1665, null
%.tmp1667 = and i1 %.tmp1664, %.tmp1666
br i1 %.tmp1667, label %.if.true.1668, label %.if.false.1668
.if.true.1668:
%.tmp1669 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1670 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1671 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1670, i32 0, i32 2
%.tmp1672 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1671
%.tmp1673 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1674 = call %m754$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m754$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1669, %m286$.Matcher.type* %.tmp1672, %m286$.Node.type* %.tmp1673)
%new_err = alloca %m754$.Error.type*
store %m754$.Error.type* %.tmp1674, %m754$.Error.type** %new_err
%.tmp1675 = load %m754$.Error.type*, %m754$.Error.type** %new_err
%.tmp1676 = icmp eq %m754$.Error.type* %.tmp1675, null
br i1 %.tmp1676, label %.if.true.1677, label %.if.false.1677
.if.true.1677:
store %m754$.Error.type* null, %m754$.Error.type** %err
br label %.if.end.1677
.if.false.1677:
%.tmp1678 = load %m754$.Error.type*, %m754$.Error.type** %new_err
%.tmp1679 = bitcast %m754$.Error.type* %.tmp1678 to i8*
call void(i8*) @free(i8* %.tmp1679)
br label %.if.end.1677
.if.end.1677:
br label %.if.end.1668
.if.false.1668:
br label %.if.end.1668
.if.end.1668:
%.tmp1680 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1681 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1680, i32 0, i32 1
%.tmp1682 = load i8, i8* %.tmp1681
%.tmp1683 = icmp eq i8 %.tmp1682, 49
br i1 %.tmp1683, label %.if.true.1684, label %.if.false.1684
.if.true.1684:
br label %.if.end.1684
.if.false.1684:
%.tmp1685 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1686 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1685, i32 0, i32 1
%.tmp1687 = load i8, i8* %.tmp1686
%.tmp1688 = icmp eq i8 %.tmp1687, 43
%.tmp1689 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1690 = icmp eq %m754$.Error.type* %.tmp1689, null
%.tmp1691 = and i1 %.tmp1688, %.tmp1690
br i1 %.tmp1691, label %.if.true.1692, label %.if.false.1692
.if.true.1692:
%.tmp1693 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1694 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1695 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1696 = call %m754$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m754$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1693, %m286$.Matcher.type* %.tmp1694, %m286$.Node.type* %.tmp1695)
store %m754$.Error.type* %.tmp1696, %m754$.Error.type** %err
%.tmp1697 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1698 = icmp ne %m754$.Error.type* %.tmp1697, null
br i1 %.tmp1698, label %.if.true.1699, label %.if.false.1699
.if.true.1699:
%.tmp1700 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1701 = bitcast %m754$.Error.type* %.tmp1700 to i8*
call void(i8*) @free(i8* %.tmp1701)
store %m754$.Error.type* null, %m754$.Error.type** %err
br label %.if.end.1699
.if.false.1699:
%.tmp1702 = bitcast ptr null to %m754$.Error.type*
ret %m754$.Error.type* %.tmp1702
br label %.if.end.1699
.if.end.1699:
br label %.if.end.1692
.if.false.1692:
%.tmp1703 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1704 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1703, i32 0, i32 1
%.tmp1705 = load i8, i8* %.tmp1704
%.tmp1706 = icmp eq i8 %.tmp1705, 63
%.tmp1707 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1708 = icmp ne %m754$.Error.type* %.tmp1707, null
%.tmp1709 = and i1 %.tmp1706, %.tmp1708
br i1 %.tmp1709, label %.if.true.1710, label %.if.false.1710
.if.true.1710:
%.tmp1711 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1712 = bitcast %m754$.Error.type* %.tmp1711 to i8*
call void(i8*) @free(i8* %.tmp1712)
store %m754$.Error.type* null, %m754$.Error.type** %err
br label %.if.end.1710
.if.false.1710:
%.tmp1713 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1714 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1713, i32 0, i32 1
%.tmp1715 = load i8, i8* %.tmp1714
%.tmp1716 = icmp eq i8 %.tmp1715, 42
br i1 %.tmp1716, label %.if.true.1717, label %.if.false.1717
.if.true.1717:
%.tmp1718 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1719 = icmp ne %m754$.Error.type* %.tmp1718, null
br i1 %.tmp1719, label %.if.true.1720, label %.if.false.1720
.if.true.1720:
%.tmp1721 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1722 = bitcast %m754$.Error.type* %.tmp1721 to i8*
call void(i8*) @free(i8* %.tmp1722)
store %m754$.Error.type* null, %m754$.Error.type** %err
br label %.if.end.1720
.if.false.1720:
%.tmp1723 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1724 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1725 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1726 = call %m754$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m754$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1723, %m286$.Matcher.type* %.tmp1724, %m286$.Node.type* %.tmp1725)
ret %m754$.Error.type* %.tmp1726
br label %.if.end.1720
.if.end.1720:
br label %.if.end.1717
.if.false.1717:
br label %.if.end.1717
.if.end.1717:
br label %.if.end.1710
.if.end.1710:
br label %.if.end.1692
.if.end.1692:
br label %.if.end.1684
.if.end.1684:
%.tmp1727 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1728 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1727, i32 0, i32 3
%.tmp1729 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1728
%.tmp1730 = icmp ne %m286$.Matcher.type* %.tmp1729, null
%.tmp1731 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1732 = icmp eq %m754$.Error.type* %.tmp1731, null
%.tmp1733 = and i1 %.tmp1730, %.tmp1732
br i1 %.tmp1733, label %.if.true.1734, label %.if.false.1734
.if.true.1734:
%.tmp1735 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1736 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1737 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1736, i32 0, i32 3
%.tmp1738 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1737
%.tmp1739 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1740 = call %m754$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m754$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1735, %m286$.Matcher.type* %.tmp1738, %m286$.Node.type* %.tmp1739)
store %m754$.Error.type* %.tmp1740, %m754$.Error.type** %err
br label %.if.end.1734
.if.false.1734:
br label %.if.end.1734
.if.end.1734:
%.tmp1741 = load %m754$.Error.type*, %m754$.Error.type** %err
%.tmp1742 = bitcast %m754$.Error.type* %.tmp1741 to %m754$.Error.type*
ret %m754$.Error.type* %.tmp1742
}
define %m286$.ParseResult.type* @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.c.arg, %m286$.Rule.type* %.rule.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.rule.arg, %m286$.Rule.type** %rule
%.tmp1743 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* null, i32 1
%.tmp1744 = ptrtoint %m286$.ParseResult.type* %.tmp1743 to i32
%.tmp1745 = call i8*(i32) @malloc(i32 %.tmp1744)
%.tmp1746 = bitcast i8* %.tmp1745 to %m286$.ParseResult.type*
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1746, %m286$.ParseResult.type** %res
%.tmp1747 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1748 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1747, i32 0, i32 0
store %m754$.Error.type* null, %m754$.Error.type** %.tmp1748
%.tmp1749 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1750 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1749, i32 0, i32 1
%.tmp1751 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1752 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1751, i32 0, i32 0
%.tmp1753 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1752
%.tmp1754 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1755 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1754, i32 0, i32 0
%.tmp1756 = load i8*, i8** %.tmp1755
%.tmp1757 = bitcast ptr null to i8*
%.tmp1758 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1753, i8* %.tmp1756, i8* %.tmp1757)
store %m286$.Node.type* %.tmp1758, %m286$.Node.type** %.tmp1750
%.tmp1759 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1760 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1759, i32 0, i32 0
%.tmp1761 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1760
%start_match = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1761, %m287$.Token.type** %start_match
%.tmp1762 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1763 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1762, i32 0, i32 0
%.tmp1764 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1765 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1766 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1765, i32 0, i32 1
%.tmp1767 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1766
%.tmp1768 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1769 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1768, i32 0, i32 1
%.tmp1770 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1769
%.tmp1771 = call %m754$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m754$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1764, %m286$.Matcher.type* %.tmp1767, %m286$.Node.type* %.tmp1770)
store %m754$.Error.type* %.tmp1771, %m754$.Error.type** %.tmp1763
%.tmp1772 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1772
}
define %m286$.ParseResult.type* @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.grammar.arg, i8* %.start.arg, %m287$.Token.type* %.tokens.arg) {
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.grammar.arg, %m286$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tokens.arg, %m287$.Token.type** %tokens
%.tmp1773 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1774 = load i8*, i8** %start
%.tmp1775 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1773, i8* %.tmp1774)
%start_matcher = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1775, %m286$.Rule.type** %start_matcher
%.tmp1776 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1777 = icmp ne %m286$.Rule.type* %.tmp1776, null
%.tmp1779 = getelementptr [44 x i8], [44 x i8]*@.str1778, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1777, i8* %.tmp1779)
%c = alloca %m286$.AstContext.type
%.tmp1780 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
store %m287$.Token.type* null, %m287$.Token.type** %.tmp1780
%.tmp1781 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
store %m286$.Rule.type** null, %m286$.Rule.type*** %.tmp1781
%.tmp1782 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1783 = load %m287$.Token.type*, %m287$.Token.type** %tokens
store %m287$.Token.type* %.tmp1783, %m287$.Token.type** %.tmp1782
%.tmp1784 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
%.tmp1785 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
store %m286$.Rule.type** %.tmp1785, %m286$.Rule.type*** %.tmp1784
%.tmp1786 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0
%.tmp1787 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1788 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1786, %m286$.Rule.type* %.tmp1787)
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1788, %m286$.ParseResult.type** %res
%.tmp1789 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1790 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1789
%.tmp1791 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1790, i32 0, i32 0
%.tmp1792 = load i8*, i8** %.tmp1791
%.tmp1794 = getelementptr [4 x i8], [4 x i8]*@.str1793, i32 0, i32 0
%.tmp1795 = call i32(i8*,i8*) @strcmp(i8* %.tmp1792, i8* %.tmp1794)
%.tmp1796 = icmp ne i32 %.tmp1795, 0
%.tmp1797 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1798 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1797, i32 0, i32 0
%.tmp1799 = load %m754$.Error.type*, %m754$.Error.type** %.tmp1798
%.tmp1800 = icmp eq %m754$.Error.type* %.tmp1799, null
%.tmp1801 = and i1 %.tmp1796, %.tmp1800
br i1 %.tmp1801, label %.if.true.1802, label %.if.false.1802
.if.true.1802:
%.tmp1803 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1804 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1803, i32 0, i32 0
%.tmp1805 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1806 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1805
%.tmp1808 = getelementptr [26 x i8], [26 x i8]*@.str1807, i32 0, i32 0
%.tmp1809 = call %m754$.Error.type*(%m287$.Token.type*,i8*) @m754$from.m754$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1806, i8* %.tmp1808)
store %m754$.Error.type* %.tmp1809, %m754$.Error.type** %.tmp1804
br label %.if.end.1802
.if.false.1802:
br label %.if.end.1802
.if.end.1802:
%.tmp1810 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1810
}
@.str845 = constant [2 x i8] c"(\00"
@.str864 = constant [2 x i8] c"|\00"
@.str883 = constant [2 x i8] c")\00"
@.str892 = constant [4 x i8] c"EOF\00"
@.str909 = constant [2 x i8] c"|\00"
@.str918 = constant [2 x i8] c")\00"
@.str924 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str947 = constant [2 x i8] c"|\00"
@.str964 = constant [2 x i8] c")\00"
@.str970 = constant [22 x i8] c"open brace not closed\00"
@.str984 = constant [2 x i8] c"+\00"
@.str1003 = constant [2 x i8] c"*\00"
@.str1022 = constant [2 x i8] c"?\00"
@.str1043 = constant [2 x i8] c"(\00"
@.str1052 = constant [5 x i8] c"WORD\00"
@.str1071 = constant [5 x i8] c"WORD\00"
@.str1078 = constant [7 x i8] c"STRING\00"
@.str1118 = constant [7 x i8] c"STRING\00"
@.str1143 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1152 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1183 = constant [5 x i8] c"WORD\00"
@.str1188 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1202 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1216 = constant [2 x i8] c":\00"
@.str1228 = constant [27 x i8] c"expected : after rule name\00"
@.str1266 = constant [4 x i8] c"EOF\00"
@.str1275 = constant [3 x i8] c"NL\00"
@.str1430 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1486 = constant [7 x i8] c"(null)\00"
@.str1488 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1490 = constant [31 x i8] c"unable to match token by value\00"
@.str1562 = constant [13 x i8] c"%s: %s != %s\00"
@.str1564 = constant [30 x i8] c"unable to match token by type\00"
@.str1621 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1643 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1778 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1793 = constant [4 x i8] c"EOF\00"
@.str1807 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1812$grammar.cp() {
%.tmp1814 = getelementptr [1652 x i8], [1652 x i8]*@.str1813, i32 0, i32 0
ret i8* %.tmp1814
}
@.str1813 = constant [1652 x i8] c"
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
define i8* @m1815$node_to_string.cp.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp1816 = call %m0$.File.type*() @tmpfile()
%tmp = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1816, %m0$.File.type** %tmp
%.tmp1817 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp1818 = load %m0$.File.type*, %m0$.File.type** %tmp
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1815$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1817, %m0$.File.type* %.tmp1818, i32 1)
%.tmp1819 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1820 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1819)
%.tmp1821 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1822 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1821)
%str_len = alloca i32
store i32 %.tmp1822, i32* %str_len
%.tmp1823 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1824 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1823)
%tmp_fd = alloca i32
store i32 %.tmp1824, i32* %tmp_fd
%.tmp1825 = load i32, i32* %tmp_fd
%.tmp1826 = load i32, i32* @SEEK_SET
%.tmp1827 = call i32(i32,i32,i32) @lseek(i32 %.tmp1825, i32 0, i32 %.tmp1826)
%.tmp1828 = load i32, i32* %str_len
%.tmp1829 = call i8*(i32) @malloc(i32 %.tmp1828)
%buf = alloca i8*
store i8* %.tmp1829, i8** %buf
%.tmp1830 = load i32, i32* %tmp_fd
%.tmp1831 = load i8*, i8** %buf
%.tmp1832 = load i32, i32* %str_len
%.tmp1833 = call i32(i32,i8*,i32) @read(i32 %.tmp1830, i8* %.tmp1831, i32 %.tmp1832)
%read = alloca i32
store i32 %.tmp1833, i32* %read
%.tmp1834 = load i32, i32* %read
%.tmp1835 = load i32, i32* %str_len
%.tmp1836 = icmp ne i32 %.tmp1834, %.tmp1835
br i1 %.tmp1836, label %.if.true.1837, label %.if.false.1837
.if.true.1837:
%.tmp1838 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp1838)
store i8* null, i8** %buf
br label %.if.end.1837
.if.false.1837:
br label %.if.end.1837
.if.end.1837:
%.tmp1839 = load i8*, i8** %buf
ret i8* %.tmp1839
}
define void @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1840 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1842 = getelementptr [2 x i8], [2 x i8]*@.str1841, i32 0, i32 0
%.tmp1843 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1840, i8* %.tmp1842)
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1844
.for.start.1844:
%.tmp1845 = load i32, i32* %i
%.tmp1846 = load i32, i32* %indent
%.tmp1847 = icmp slt i32 %.tmp1845, %.tmp1846
br i1 %.tmp1847, label %.for.continue.1844, label %.for.end.1844
.for.continue.1844:
%.tmp1848 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1850 = getelementptr [3 x i8], [3 x i8]*@.str1849, i32 0, i32 0
%.tmp1851 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1848, i8* %.tmp1850)
%.tmp1852 = load i32, i32* %i
%.tmp1853 = add i32 %.tmp1852, 1
store i32 %.tmp1853, i32* %i
br label %.for.start.1844
.for.end.1844:
ret void
}
define void @m1815$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1854 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1855 = icmp eq %m286$.Node.type* %.tmp1854, null
br i1 %.tmp1855, label %.if.true.1856, label %.if.false.1856
.if.true.1856:
%.tmp1857 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1859 = getelementptr [7 x i8], [7 x i8]*@.str1858, i32 0, i32 0
%.tmp1860 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1857, i8* %.tmp1859)
ret void
br label %.if.end.1856
.if.false.1856:
br label %.if.end.1856
.if.end.1856:
%.tmp1861 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1863 = getelementptr [2 x i8], [2 x i8]*@.str1862, i32 0, i32 0
%.tmp1864 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1861, i8* %.tmp1863)
%.tmp1865 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1866 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1865, i32 %.tmp1866)
%.tmp1867 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1869 = getelementptr [13 x i8], [13 x i8]*@.str1868, i32 0, i32 0
%.tmp1870 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1871 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1870, i32 0, i32 0
%.tmp1872 = load i8*, i8** %.tmp1871
%.tmp1873 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1867, i8* %.tmp1869, i8* %.tmp1872)
%.tmp1874 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1875 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1874, i32 %.tmp1875)
%.tmp1876 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1878 = getelementptr [12 x i8], [12 x i8]*@.str1877, i32 0, i32 0
%.tmp1879 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1880 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1879, i32 0, i32 1
%.tmp1881 = load i8*, i8** %.tmp1880
%.tmp1882 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1876, i8* %.tmp1878, i8* %.tmp1881)
%.tmp1883 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1884 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1883, i32 %.tmp1884)
%.tmp1885 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1887 = getelementptr [11 x i8], [11 x i8]*@.str1886, i32 0, i32 0
%.tmp1888 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1889 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1888, i32 0, i32 3
%.tmp1890 = load i32, i32* %.tmp1889
%.tmp1891 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1885, i8* %.tmp1887, i32 %.tmp1890)
%.tmp1892 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1893 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1892, i32 %.tmp1893)
%.tmp1894 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1896 = getelementptr [19 x i8], [19 x i8]*@.str1895, i32 0, i32 0
%.tmp1897 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1898 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1897, i32 0, i32 4
%.tmp1899 = load i32, i32* %.tmp1898
%.tmp1900 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1894, i8* %.tmp1896, i32 %.tmp1899)
%.tmp1901 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1902 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1901, i32 %.tmp1902)
%.tmp1903 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1905 = getelementptr [9 x i8], [9 x i8]*@.str1904, i32 0, i32 0
%.tmp1906 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1903, i8* %.tmp1905)
%.tmp1907 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1908 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1907, i32 0, i32 7
%.tmp1909 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1908
%.tmp1910 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1911 = load i32, i32* %indent
%.tmp1912 = add i32 %.tmp1911, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1815$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1909, %m0$.File.type* %.tmp1910, i32 %.tmp1912)
%.tmp1913 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1914 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1913, i32 %.tmp1914)
%.tmp1915 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1917 = getelementptr [13 x i8], [13 x i8]*@.str1916, i32 0, i32 0
%.tmp1918 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1915, i8* %.tmp1917)
%.tmp1919 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1920 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1919, i32 0, i32 6
%.tmp1921 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1920
%.tmp1922 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1923 = load i32, i32* %indent
%.tmp1924 = add i32 %.tmp1923, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1815$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1921, %m0$.File.type* %.tmp1922, i32 %.tmp1924)
%.tmp1925 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1926 = load i32, i32* %indent
%.tmp1927 = sub i32 %.tmp1926, 1
call void(%m0$.File.type*,i32) @m1815$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1925, i32 %.tmp1927)
%.tmp1928 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1930 = getelementptr [2 x i8], [2 x i8]*@.str1929, i32 0, i32 0
%.tmp1931 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1928, i8* %.tmp1930)
ret void
}
@.str1841 = constant [2 x i8] c"\0A\00"
@.str1849 = constant [3 x i8] c"  \00"
@.str1858 = constant [7 x i8] c"(null)\00"
@.str1862 = constant [2 x i8] c"{\00"
@.str1868 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1877 = constant [12 x i8] c"\22value\22: %s\00"
@.str1886 = constant [11 x i8] c"\22line\22: %d\00"
@.str1895 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1904 = constant [9 x i8] c"\22next\22: \00"
@.str1916 = constant [13 x i8] c"\22children\22: \00"
@.str1929 = constant [2 x i8] c"}\00"
%m1932$.SYStack.type = type {%m286$.Node.type*,%m1932$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1932$.SYStack.type* @m1932$stack_new.m1932$.SYStack.typep() {
%.tmp1933 = load i32, i32* @SYStack_size
%.tmp1934 = call i8*(i32) @malloc(i32 %.tmp1933)
%.tmp1935 = bitcast i8* %.tmp1934 to %m1932$.SYStack.type*
%s = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp1935, %m1932$.SYStack.type** %s
%.tmp1936 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
%.tmp1937 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp1936, i32 0, i32 0
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1937
%.tmp1938 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
%.tmp1939 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp1938, i32 0, i32 1
store %m1932$.SYStack.type* null, %m1932$.SYStack.type** %.tmp1939
%.tmp1940 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
ret %m1932$.SYStack.type* %.tmp1940
}
define %m1932$.SYStack.type* @m1932$sy_algorithm.m1932$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.assignable.arg) {
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.assignable.arg, %m286$.Node.type** %assignable
%.tmp1941 = call %m1932$.SYStack.type*() @m1932$stack_new.m1932$.SYStack.typep()
%out_stack = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp1941, %m1932$.SYStack.type** %out_stack
%.tmp1942 = call %m1932$.SYStack.type*() @m1932$stack_new.m1932$.SYStack.typep()
%op_stack = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp1942, %m1932$.SYStack.type** %op_stack
%.tmp1943 = call %m1932$.SYStack.type*() @m1932$stack_new.m1932$.SYStack.typep()
%token_stack = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp1943, %m1932$.SYStack.type** %token_stack
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %ptr
%.tmp1945 = load %m286$.Node.type*, %m286$.Node.type** %assignable
store %m286$.Node.type* %.tmp1945, %m286$.Node.type** %ptr
br label %.for.start.1944
.for.start.1944:
%.tmp1946 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1947 = icmp ne %m286$.Node.type* %.tmp1946, null
br i1 %.tmp1947, label %.for.continue.1944, label %.for.end.1944
.for.continue.1944:
%.tmp1948 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %token_stack
%.tmp1949 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1950 = call %m1932$.SYStack.type*(%m1932$.SYStack.type*,%m286$.Node.type*) @m1932$stack_push.m1932$.SYStack.typep.m1932$.SYStack.typep.m286$.Node.typep(%m1932$.SYStack.type* %.tmp1948, %m286$.Node.type* %.tmp1949)
store %m1932$.SYStack.type* %.tmp1950, %m1932$.SYStack.type** %token_stack
%.tmp1951 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1952 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1951, i32 0, i32 7
%.tmp1953 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1952
store %m286$.Node.type* %.tmp1953, %m286$.Node.type** %ptr
br label %.for.start.1944
.for.end.1944:
%.tmp1955 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %token_stack
%.tmp1956 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp1955, i32 0, i32 0
%.tmp1957 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1956
store %m286$.Node.type* %.tmp1957, %m286$.Node.type** %ptr
br label %.for.start.1954
.for.start.1954:
%.tmp1958 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1959 = icmp ne %m286$.Node.type* %.tmp1958, null
br i1 %.tmp1959, label %.for.continue.1954, label %.for.end.1954
.for.continue.1954:
%.tmp1960 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %token_stack
%cs = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp1960, %m1932$.SYStack.type** %cs
%.tmp1961 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %token_stack
%.tmp1962 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp1961, i32 0, i32 1
%.tmp1963 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp1962
store %m1932$.SYStack.type* %.tmp1963, %m1932$.SYStack.type** %token_stack
%.tmp1964 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %cs
%.tmp1965 = bitcast %m1932$.SYStack.type* %.tmp1964 to i8*
call void(i8*) @free(i8* %.tmp1965)
%.tmp1966 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1967 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1966, i32 0, i32 0
%.tmp1968 = load i8*, i8** %.tmp1967
%.tmp1970 = getelementptr [16 x i8], [16 x i8]*@.str1969, i32 0, i32 0
%.tmp1971 = call i32(i8*,i8*) @strcmp(i8* %.tmp1968, i8* %.tmp1970)
%.tmp1972 = icmp eq i32 %.tmp1971, 0
br i1 %.tmp1972, label %.if.true.1973, label %.if.false.1973
.if.true.1973:
%.tmp1974 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %out_stack
%.tmp1975 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1976 = call %m1932$.SYStack.type*(%m1932$.SYStack.type*,%m286$.Node.type*) @m1932$stack_push.m1932$.SYStack.typep.m1932$.SYStack.typep.m286$.Node.typep(%m1932$.SYStack.type* %.tmp1974, %m286$.Node.type* %.tmp1975)
store %m1932$.SYStack.type* %.tmp1976, %m1932$.SYStack.type** %out_stack
br label %.if.end.1973
.if.false.1973:
%.tmp1977 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1978 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1977, i32 0, i32 0
%.tmp1979 = load i8*, i8** %.tmp1978
%.tmp1981 = getelementptr [9 x i8], [9 x i8]*@.str1980, i32 0, i32 0
%.tmp1982 = call i32(i8*,i8*) @strcmp(i8* %.tmp1979, i8* %.tmp1981)
%.tmp1983 = icmp eq i32 %.tmp1982, 0
br i1 %.tmp1983, label %.if.true.1984, label %.if.false.1984
.if.true.1984:
%quit = alloca i1
store i1 0, i1* %quit
br label %.for.start.1985
.for.start.1985:
%.tmp1986 = load i1, i1* %quit
%.tmp1987 = icmp eq i1 %.tmp1986, 0
br i1 %.tmp1987, label %.for.continue.1985, label %.for.end.1985
.for.continue.1985:
%.tmp1988 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp1989 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp1988, i32 0, i32 0
%.tmp1990 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1989
%.tmp1991 = icmp eq %m286$.Node.type* %.tmp1990, null
br i1 %.tmp1991, label %.if.true.1992, label %.if.false.1992
.if.true.1992:
store i1 1, i1* %quit
br label %.if.end.1992
.if.false.1992:
%.tmp1993 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp1994 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp1993, i32 0, i32 0
%.tmp1995 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1994
%.tmp1996 = call i32(%m286$.Node.type*) @m1932$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1995)
%.tmp1997 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1998 = call i32(%m286$.Node.type*) @m1932$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1997)
%.tmp1999 = icmp slt i32 %.tmp1996, %.tmp1998
br i1 %.tmp1999, label %.if.true.2000, label %.if.false.2000
.if.true.2000:
%.tmp2001 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%top = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp2001, %m1932$.SYStack.type** %top
%.tmp2002 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp2003 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2002, i32 0, i32 1
%.tmp2004 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp2003
store %m1932$.SYStack.type* %.tmp2004, %m1932$.SYStack.type** %op_stack
%.tmp2005 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %out_stack
%.tmp2006 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %top
%.tmp2007 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2006, i32 0, i32 0
%.tmp2008 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2007
%.tmp2009 = call %m1932$.SYStack.type*(%m1932$.SYStack.type*,%m286$.Node.type*) @m1932$stack_push.m1932$.SYStack.typep.m1932$.SYStack.typep.m286$.Node.typep(%m1932$.SYStack.type* %.tmp2005, %m286$.Node.type* %.tmp2008)
store %m1932$.SYStack.type* %.tmp2009, %m1932$.SYStack.type** %out_stack
%.tmp2010 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %top
%.tmp2011 = bitcast %m1932$.SYStack.type* %.tmp2010 to i8*
call void(i8*) @free(i8* %.tmp2011)
br label %.if.end.2000
.if.false.2000:
store i1 1, i1* %quit
br label %.if.end.2000
.if.end.2000:
br label %.if.end.1992
.if.end.1992:
br label %.for.start.1985
.for.end.1985:
%.tmp2012 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp2013 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp2014 = call %m1932$.SYStack.type*(%m1932$.SYStack.type*,%m286$.Node.type*) @m1932$stack_push.m1932$.SYStack.typep.m1932$.SYStack.typep.m286$.Node.typep(%m1932$.SYStack.type* %.tmp2012, %m286$.Node.type* %.tmp2013)
store %m1932$.SYStack.type* %.tmp2014, %m1932$.SYStack.type** %op_stack
br label %.if.end.1984
.if.false.1984:
%.tmp2016 = getelementptr [68 x i8], [68 x i8]*@.str2015, i32 0, i32 0
%.tmp2017 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp2018 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2017, i32 0, i32 0
%.tmp2019 = load i8*, i8** %.tmp2018
%.tmp2020 = call i32(i8*,...) @printf(i8* %.tmp2016, i8* %.tmp2019)
br label %.if.end.1984
.if.end.1984:
br label %.if.end.1973
.if.end.1973:
%.tmp2021 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %token_stack
%.tmp2022 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2021, i32 0, i32 0
%.tmp2023 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2022
store %m286$.Node.type* %.tmp2023, %m286$.Node.type** %ptr
br label %.for.start.1954
.for.end.1954:
br label %.for.start.2024
.for.start.2024:
%.tmp2025 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp2026 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2025, i32 0, i32 0
%.tmp2027 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2026
%.tmp2028 = icmp ne %m286$.Node.type* %.tmp2027, null
br i1 %.tmp2028, label %.for.continue.2024, label %.for.end.2024
.for.continue.2024:
%.tmp2029 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp2030 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2029, i32 0, i32 0
%.tmp2031 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2030
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2031, %m286$.Node.type** %node
%.tmp2032 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%s = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp2032, %m1932$.SYStack.type** %s
%.tmp2033 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %op_stack
%.tmp2034 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2033, i32 0, i32 1
%.tmp2035 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp2034
store %m1932$.SYStack.type* %.tmp2035, %m1932$.SYStack.type** %op_stack
%.tmp2036 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
%.tmp2037 = bitcast %m1932$.SYStack.type* %.tmp2036 to i8*
call void(i8*) @free(i8* %.tmp2037)
%.tmp2038 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %out_stack
%.tmp2039 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2040 = call %m1932$.SYStack.type*(%m1932$.SYStack.type*,%m286$.Node.type*) @m1932$stack_push.m1932$.SYStack.typep.m1932$.SYStack.typep.m286$.Node.typep(%m1932$.SYStack.type* %.tmp2038, %m286$.Node.type* %.tmp2039)
store %m1932$.SYStack.type* %.tmp2040, %m1932$.SYStack.type** %out_stack
br label %.for.start.2024
.for.end.2024:
%.tmp2041 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %out_stack
ret %m1932$.SYStack.type* %.tmp2041
}
define %m1932$.SYStack.type* @m1932$stack_push.m1932$.SYStack.typep.m1932$.SYStack.typep.m286$.Node.typep(%m1932$.SYStack.type* %.curr_stack.arg, %m286$.Node.type* %.node.arg) {
%curr_stack = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.curr_stack.arg, %m1932$.SYStack.type** %curr_stack
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2042 = load i32, i32* @SYStack_size
%.tmp2043 = call i8*(i32) @malloc(i32 %.tmp2042)
%.tmp2044 = bitcast i8* %.tmp2043 to %m1932$.SYStack.type*
%s = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp2044, %m1932$.SYStack.type** %s
%.tmp2045 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
%.tmp2046 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2045, i32 0, i32 0
%.tmp2047 = load %m286$.Node.type*, %m286$.Node.type** %node
store %m286$.Node.type* %.tmp2047, %m286$.Node.type** %.tmp2046
%.tmp2048 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
%.tmp2049 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp2048, i32 0, i32 1
%.tmp2050 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %curr_stack
store %m1932$.SYStack.type* %.tmp2050, %m1932$.SYStack.type** %.tmp2049
%.tmp2051 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %s
ret %m1932$.SYStack.type* %.tmp2051
}
define i32 @m1932$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp2052 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp2053 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2052, i32 0, i32 6
%.tmp2054 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2053
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2054, %m286$.Node.type** %op
%.tmp2055 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2056 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2055, i32 0, i32 1
%.tmp2057 = load i8*, i8** %.tmp2056
%.tmp2059 = getelementptr [2 x i8], [2 x i8]*@.str2058, i32 0, i32 0
%.tmp2060 = call i32(i8*,i8*) @strcmp(i8* %.tmp2057, i8* %.tmp2059)
%.tmp2061 = icmp eq i32 %.tmp2060, 0
%.tmp2062 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2063 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2062, i32 0, i32 1
%.tmp2064 = load i8*, i8** %.tmp2063
%.tmp2066 = getelementptr [2 x i8], [2 x i8]*@.str2065, i32 0, i32 0
%.tmp2067 = call i32(i8*,i8*) @strcmp(i8* %.tmp2064, i8* %.tmp2066)
%.tmp2068 = icmp eq i32 %.tmp2067, 0
%.tmp2069 = or i1 %.tmp2061, %.tmp2068
br i1 %.tmp2069, label %.if.true.2070, label %.if.false.2070
.if.true.2070:
ret i32 4
br label %.if.end.2070
.if.false.2070:
%.tmp2071 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2072 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2071, i32 0, i32 1
%.tmp2073 = load i8*, i8** %.tmp2072
%.tmp2075 = getelementptr [2 x i8], [2 x i8]*@.str2074, i32 0, i32 0
%.tmp2076 = call i32(i8*,i8*) @strcmp(i8* %.tmp2073, i8* %.tmp2075)
%.tmp2077 = icmp eq i32 %.tmp2076, 0
%.tmp2078 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2079 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2078, i32 0, i32 1
%.tmp2080 = load i8*, i8** %.tmp2079
%.tmp2082 = getelementptr [2 x i8], [2 x i8]*@.str2081, i32 0, i32 0
%.tmp2083 = call i32(i8*,i8*) @strcmp(i8* %.tmp2080, i8* %.tmp2082)
%.tmp2084 = icmp eq i32 %.tmp2083, 0
%.tmp2085 = or i1 %.tmp2077, %.tmp2084
br i1 %.tmp2085, label %.if.true.2086, label %.if.false.2086
.if.true.2086:
ret i32 3
br label %.if.end.2086
.if.false.2086:
%.tmp2087 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2088 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2087, i32 0, i32 1
%.tmp2089 = load i8*, i8** %.tmp2088
%.tmp2091 = getelementptr [3 x i8], [3 x i8]*@.str2090, i32 0, i32 0
%.tmp2092 = call i32(i8*,i8*) @strcmp(i8* %.tmp2089, i8* %.tmp2091)
%.tmp2093 = icmp eq i32 %.tmp2092, 0
%.tmp2094 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2095 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2094, i32 0, i32 1
%.tmp2096 = load i8*, i8** %.tmp2095
%.tmp2098 = getelementptr [3 x i8], [3 x i8]*@.str2097, i32 0, i32 0
%.tmp2099 = call i32(i8*,i8*) @strcmp(i8* %.tmp2096, i8* %.tmp2098)
%.tmp2100 = icmp eq i32 %.tmp2099, 0
%.tmp2101 = or i1 %.tmp2093, %.tmp2100
br i1 %.tmp2101, label %.if.true.2102, label %.if.false.2102
.if.true.2102:
ret i32 7
br label %.if.end.2102
.if.false.2102:
%.tmp2103 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2104 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2103, i32 0, i32 1
%.tmp2105 = load i8*, i8** %.tmp2104
%.tmp2107 = getelementptr [3 x i8], [3 x i8]*@.str2106, i32 0, i32 0
%.tmp2108 = call i32(i8*,i8*) @strcmp(i8* %.tmp2105, i8* %.tmp2107)
%.tmp2109 = icmp eq i32 %.tmp2108, 0
%.tmp2110 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2111 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2110, i32 0, i32 1
%.tmp2112 = load i8*, i8** %.tmp2111
%.tmp2114 = getelementptr [3 x i8], [3 x i8]*@.str2113, i32 0, i32 0
%.tmp2115 = call i32(i8*,i8*) @strcmp(i8* %.tmp2112, i8* %.tmp2114)
%.tmp2116 = icmp eq i32 %.tmp2115, 0
%.tmp2117 = or i1 %.tmp2109, %.tmp2116
br i1 %.tmp2117, label %.if.true.2118, label %.if.false.2118
.if.true.2118:
ret i32 6
br label %.if.end.2118
.if.false.2118:
%.tmp2119 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2120 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2119, i32 0, i32 1
%.tmp2121 = load i8*, i8** %.tmp2120
%.tmp2123 = getelementptr [2 x i8], [2 x i8]*@.str2122, i32 0, i32 0
%.tmp2124 = call i32(i8*,i8*) @strcmp(i8* %.tmp2121, i8* %.tmp2123)
%.tmp2125 = icmp eq i32 %.tmp2124, 0
%.tmp2126 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2127 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2126, i32 0, i32 1
%.tmp2128 = load i8*, i8** %.tmp2127
%.tmp2130 = getelementptr [2 x i8], [2 x i8]*@.str2129, i32 0, i32 0
%.tmp2131 = call i32(i8*,i8*) @strcmp(i8* %.tmp2128, i8* %.tmp2130)
%.tmp2132 = icmp eq i32 %.tmp2131, 0
%.tmp2133 = or i1 %.tmp2125, %.tmp2132
br i1 %.tmp2133, label %.if.true.2134, label %.if.false.2134
.if.true.2134:
ret i32 6
br label %.if.end.2134
.if.false.2134:
%.tmp2135 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2136 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2135, i32 0, i32 1
%.tmp2137 = load i8*, i8** %.tmp2136
%.tmp2139 = getelementptr [2 x i8], [2 x i8]*@.str2138, i32 0, i32 0
%.tmp2140 = call i32(i8*,i8*) @strcmp(i8* %.tmp2137, i8* %.tmp2139)
%.tmp2141 = icmp eq i32 %.tmp2140, 0
br i1 %.tmp2141, label %.if.true.2142, label %.if.false.2142
.if.true.2142:
ret i32 11
br label %.if.end.2142
.if.false.2142:
%.tmp2143 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2144 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2143, i32 0, i32 1
%.tmp2145 = load i8*, i8** %.tmp2144
%.tmp2147 = getelementptr [2 x i8], [2 x i8]*@.str2146, i32 0, i32 0
%.tmp2148 = call i32(i8*,i8*) @strcmp(i8* %.tmp2145, i8* %.tmp2147)
%.tmp2149 = icmp eq i32 %.tmp2148, 0
br i1 %.tmp2149, label %.if.true.2150, label %.if.false.2150
.if.true.2150:
ret i32 12
br label %.if.end.2150
.if.false.2150:
br label %.if.end.2150
.if.end.2150:
br label %.if.end.2142
.if.end.2142:
br label %.if.end.2134
.if.end.2134:
br label %.if.end.2118
.if.end.2118:
br label %.if.end.2102
.if.end.2102:
br label %.if.end.2086
.if.end.2086:
br label %.if.end.2070
.if.end.2070:
%.tmp2152 = getelementptr [65 x i8], [65 x i8]*@.str2151, i32 0, i32 0
%.tmp2153 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2154 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2153, i32 0, i32 1
%.tmp2155 = load i8*, i8** %.tmp2154
%.tmp2156 = call i32(i8*,...) @printf(i8* %.tmp2152, i8* %.tmp2155)
ret i32 4
}
@.str1969 = constant [16 x i8] c"mono_assignable\00"
@.str1980 = constant [9 x i8] c"operator\00"
@.str2015 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2058 = constant [2 x i8] c"+\00"
@.str2065 = constant [2 x i8] c"-\00"
@.str2074 = constant [2 x i8] c"*\00"
@.str2081 = constant [2 x i8] c"/\00"
@.str2090 = constant [3 x i8] c"==\00"
@.str2097 = constant [3 x i8] c"!=\00"
@.str2106 = constant [3 x i8] c">=\00"
@.str2113 = constant [3 x i8] c"<=\00"
@.str2122 = constant [2 x i8] c">\00"
@.str2129 = constant [2 x i8] c"<\00"
@.str2138 = constant [2 x i8] c"&\00"
@.str2146 = constant [2 x i8] c"|\00"
@.str2151 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
define i8* @m2157$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2158 = load i8*, i8** %text
%.tmp2159 = call i32(i8*) @strlen(i8* %.tmp2158)
%str_len = alloca i32
store i32 %.tmp2159, i32* %str_len
%dest_string = alloca {i32,i32,i8*}
%.tmp2160 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
store i32 0, i32* %.tmp2160
%.tmp2161 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2161
%.tmp2162 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
store i8* null, i8** %.tmp2162
%.tmp2163 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2164 = load i32, i32* %str_len
store i32 %.tmp2164, i32* %.tmp2163
%.tmp2165 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2165
%.tmp2166 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2167 = load i32, i32* %str_len
%.tmp2168 = call i8*(i32) @malloc(i32 %.tmp2167)
store i8* %.tmp2168, i8** %.tmp2166
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.2169
.for.start.2169:
%.tmp2170 = load i32, i32* %i
%.tmp2171 = load i32, i32* %str_len
%.tmp2172 = sub i32 %.tmp2171, 1
%.tmp2173 = icmp slt i32 %.tmp2170, %.tmp2172
br i1 %.tmp2173, label %.for.continue.2169, label %.for.end.2169
.for.continue.2169:
%.tmp2174 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2175 = load i32, i32* %.tmp2174
%.tmp2176 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2177 = load i32, i32* %.tmp2176
%.tmp2178 = sub i32 %.tmp2177, 4
%.tmp2179 = icmp eq i32 %.tmp2175, %.tmp2178
br i1 %.tmp2179, label %.if.true.2180, label %.if.false.2180
.if.true.2180:
%.tmp2181 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2182 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2183 = load i8*, i8** %.tmp2182
%.tmp2184 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2185 = load i32, i32* %.tmp2184
%.tmp2186 = mul i32 %.tmp2185, 2
%.tmp2187 = call i8*(i8*,i32) @realloc(i8* %.tmp2183, i32 %.tmp2186)
store i8* %.tmp2187, i8** %.tmp2181
br label %.if.end.2180
.if.false.2180:
br label %.if.end.2180
.if.end.2180:
%.tmp2188 = load i32, i32* %i
%.tmp2189 = load i8*, i8** %text
%.tmp2190 = getelementptr i8, i8* %.tmp2189, i32 %.tmp2188
%.tmp2191 = load i8, i8* %.tmp2190
%.tmp2192 = icmp eq i8 %.tmp2191, 34
br i1 %.tmp2192, label %.if.true.2193, label %.if.false.2193
.if.true.2193:
%.tmp2194 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2195 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2196 = load i32, i32* %.tmp2195
%.tmp2197 = load i8*, i8** %.tmp2194
%.tmp2198 = getelementptr i8, i8* %.tmp2197, i32 %.tmp2196
store i8 92, i8* %.tmp2198
%.tmp2199 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2200 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2201 = load i32, i32* %.tmp2200
%.tmp2202 = add i32 %.tmp2201, 1
store i32 %.tmp2202, i32* %.tmp2199
%.tmp2203 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2204 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2205 = load i32, i32* %.tmp2204
%.tmp2206 = load i8*, i8** %.tmp2203
%.tmp2207 = getelementptr i8, i8* %.tmp2206, i32 %.tmp2205
store i8 50, i8* %.tmp2207
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
store i8 50, i8* %.tmp2216
br label %.if.end.2193
.if.false.2193:
%.tmp2217 = load i32, i32* %i
%.tmp2218 = load i8*, i8** %text
%.tmp2219 = getelementptr i8, i8* %.tmp2218, i32 %.tmp2217
%.tmp2220 = load i8, i8* %.tmp2219
%.tmp2221 = icmp eq i8 %.tmp2220, 92
br i1 %.tmp2221, label %.if.true.2222, label %.if.false.2222
.if.true.2222:
%.tmp2223 = load i32, i32* %i
%.tmp2224 = add i32 %.tmp2223, 1
%.tmp2225 = load i8*, i8** %text
%.tmp2226 = getelementptr i8, i8* %.tmp2225, i32 %.tmp2224
%.tmp2227 = load i8, i8* %.tmp2226
%.tmp2228 = icmp eq i8 %.tmp2227, 110
%.tmp2229 = load i32, i32* %i
%.tmp2230 = add i32 %.tmp2229, 1
%.tmp2231 = load i8*, i8** %text
%.tmp2232 = getelementptr i8, i8* %.tmp2231, i32 %.tmp2230
%.tmp2233 = load i8, i8* %.tmp2232
%.tmp2234 = icmp eq i8 %.tmp2233, 78
%.tmp2235 = or i1 %.tmp2228, %.tmp2234
br i1 %.tmp2235, label %.if.true.2236, label %.if.false.2236
.if.true.2236:
%.tmp2237 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2238 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2239 = load i32, i32* %.tmp2238
%.tmp2240 = load i8*, i8** %.tmp2237
%.tmp2241 = getelementptr i8, i8* %.tmp2240, i32 %.tmp2239
store i8 92, i8* %.tmp2241
%.tmp2242 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2243 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2244 = load i32, i32* %.tmp2243
%.tmp2245 = add i32 %.tmp2244, 1
store i32 %.tmp2245, i32* %.tmp2242
%.tmp2246 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2247 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2248 = load i32, i32* %.tmp2247
%.tmp2249 = load i8*, i8** %.tmp2246
%.tmp2250 = getelementptr i8, i8* %.tmp2249, i32 %.tmp2248
store i8 48, i8* %.tmp2250
%.tmp2251 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2252 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2253 = load i32, i32* %.tmp2252
%.tmp2254 = add i32 %.tmp2253, 1
store i32 %.tmp2254, i32* %.tmp2251
%.tmp2255 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2256 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2257 = load i32, i32* %.tmp2256
%.tmp2258 = load i8*, i8** %.tmp2255
%.tmp2259 = getelementptr i8, i8* %.tmp2258, i32 %.tmp2257
store i8 65, i8* %.tmp2259
%.tmp2260 = load i32, i32* %i
%.tmp2261 = add i32 %.tmp2260, 1
store i32 %.tmp2261, i32* %i
br label %.if.end.2236
.if.false.2236:
%.tmp2262 = load i32, i32* %i
%.tmp2263 = add i32 %.tmp2262, 1
%.tmp2264 = load i8*, i8** %text
%.tmp2265 = getelementptr i8, i8* %.tmp2264, i32 %.tmp2263
%.tmp2266 = load i8, i8* %.tmp2265
%.tmp2267 = icmp eq i8 %.tmp2266, 92
br i1 %.tmp2267, label %.if.true.2268, label %.if.false.2268
.if.true.2268:
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
store i8 53, i8* %.tmp2282
%.tmp2283 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2284 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2285 = load i32, i32* %.tmp2284
%.tmp2286 = add i32 %.tmp2285, 1
store i32 %.tmp2286, i32* %.tmp2283
%.tmp2287 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2288 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2289 = load i32, i32* %.tmp2288
%.tmp2290 = load i8*, i8** %.tmp2287
%.tmp2291 = getelementptr i8, i8* %.tmp2290, i32 %.tmp2289
store i8 67, i8* %.tmp2291
%.tmp2292 = load i32, i32* %i
%.tmp2293 = add i32 %.tmp2292, 1
store i32 %.tmp2293, i32* %i
br label %.if.end.2268
.if.false.2268:
%.tmp2294 = load i32, i32* %i
%.tmp2295 = add i32 %.tmp2294, 1
%.tmp2296 = load i8*, i8** %text
%.tmp2297 = getelementptr i8, i8* %.tmp2296, i32 %.tmp2295
%.tmp2298 = load i8, i8* %.tmp2297
%.tmp2299 = icmp eq i8 %.tmp2298, 120
br i1 %.tmp2299, label %.if.true.2300, label %.if.false.2300
.if.true.2300:
%.tmp2301 = load i32, i32* %i
%.tmp2302 = add i32 %.tmp2301, 2
store i32 %.tmp2302, i32* %i
%.tmp2303 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2304 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2305 = load i32, i32* %.tmp2304
%.tmp2306 = load i8*, i8** %.tmp2303
%.tmp2307 = getelementptr i8, i8* %.tmp2306, i32 %.tmp2305
store i8 92, i8* %.tmp2307
%.tmp2308 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2309 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2310 = load i32, i32* %.tmp2309
%.tmp2311 = add i32 %.tmp2310, 1
store i32 %.tmp2311, i32* %.tmp2308
%.tmp2312 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2313 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2314 = load i32, i32* %.tmp2313
%.tmp2315 = load i8*, i8** %.tmp2312
%.tmp2316 = getelementptr i8, i8* %.tmp2315, i32 %.tmp2314
%.tmp2317 = load i32, i32* %i
%.tmp2318 = load i8*, i8** %text
%.tmp2319 = getelementptr i8, i8* %.tmp2318, i32 %.tmp2317
%.tmp2320 = load i8, i8* %.tmp2319
%.tmp2321 = call i8(i8) @toupper(i8 %.tmp2320)
store i8 %.tmp2321, i8* %.tmp2316
%.tmp2322 = load i32, i32* %i
%.tmp2323 = add i32 %.tmp2322, 1
store i32 %.tmp2323, i32* %i
%.tmp2324 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2325 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2326 = load i32, i32* %.tmp2325
%.tmp2327 = add i32 %.tmp2326, 1
store i32 %.tmp2327, i32* %.tmp2324
%.tmp2328 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2329 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2330 = load i32, i32* %.tmp2329
%.tmp2331 = load i8*, i8** %.tmp2328
%.tmp2332 = getelementptr i8, i8* %.tmp2331, i32 %.tmp2330
%.tmp2333 = load i32, i32* %i
%.tmp2334 = load i8*, i8** %text
%.tmp2335 = getelementptr i8, i8* %.tmp2334, i32 %.tmp2333
%.tmp2336 = load i8, i8* %.tmp2335
%.tmp2337 = call i8(i8) @toupper(i8 %.tmp2336)
store i8 %.tmp2337, i8* %.tmp2332
br label %.if.end.2300
.if.false.2300:
%.tmp2338 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2339 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2340 = load i32, i32* %.tmp2339
%.tmp2341 = load i8*, i8** %.tmp2338
%.tmp2342 = getelementptr i8, i8* %.tmp2341, i32 %.tmp2340
%.tmp2343 = load i32, i32* %i
%.tmp2344 = load i8*, i8** %text
%.tmp2345 = getelementptr i8, i8* %.tmp2344, i32 %.tmp2343
%.tmp2346 = load i8, i8* %.tmp2345
store i8 %.tmp2346, i8* %.tmp2342
br label %.if.end.2300
.if.end.2300:
br label %.if.end.2268
.if.end.2268:
br label %.if.end.2236
.if.end.2236:
br label %.if.end.2222
.if.false.2222:
%.tmp2347 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2348 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2349 = load i32, i32* %.tmp2348
%.tmp2350 = load i8*, i8** %.tmp2347
%.tmp2351 = getelementptr i8, i8* %.tmp2350, i32 %.tmp2349
%.tmp2352 = load i32, i32* %i
%.tmp2353 = load i8*, i8** %text
%.tmp2354 = getelementptr i8, i8* %.tmp2353, i32 %.tmp2352
%.tmp2355 = load i8, i8* %.tmp2354
store i8 %.tmp2355, i8* %.tmp2351
br label %.if.end.2222
.if.end.2222:
br label %.if.end.2193
.if.end.2193:
%.tmp2356 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2357 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2358 = load i32, i32* %.tmp2357
%.tmp2359 = add i32 %.tmp2358, 1
store i32 %.tmp2359, i32* %.tmp2356
%.tmp2360 = load i32, i32* %i
%.tmp2361 = add i32 %.tmp2360, 1
store i32 %.tmp2361, i32* %i
br label %.for.start.2169
.for.end.2169:
%.tmp2362 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2363 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2364 = load i32, i32* %.tmp2363
%.tmp2365 = load i8*, i8** %.tmp2362
%.tmp2366 = getelementptr i8, i8* %.tmp2365, i32 %.tmp2364
store i8 0, i8* %.tmp2366
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp2367 = getelementptr i8*, i8** %buf, i32 0
%.tmp2369 = getelementptr [9 x i8], [9 x i8]*@.str2368, i32 0, i32 0
%.tmp2370 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2371 = load i8*, i8** %.tmp2370
%.tmp2372 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2367, i8* %.tmp2369, i8* %.tmp2371)
%.tmp2373 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2374 = load i8*, i8** %.tmp2373
call void(i8*) @free(i8* %.tmp2374)
%.tmp2375 = load i8*, i8** %buf
ret i8* %.tmp2375
}
define i32 @m2157$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 2, i32* %i
br label %.for.start.2376
.for.start.2376:
%.tmp2377 = load i32, i32* %i
%.tmp2378 = load i8*, i8** %text
%.tmp2379 = getelementptr i8, i8* %.tmp2378, i32 %.tmp2377
%.tmp2380 = load i8, i8* %.tmp2379
%.tmp2381 = icmp ne i8 %.tmp2380, 0
br i1 %.tmp2381, label %.for.continue.2376, label %.for.end.2376
.for.continue.2376:
%.tmp2382 = load i32, i32* %i
%.tmp2383 = load i8*, i8** %text
%.tmp2384 = getelementptr i8, i8* %.tmp2383, i32 %.tmp2382
%.tmp2385 = load i8, i8* %.tmp2384
%.tmp2386 = icmp eq i8 %.tmp2385, 92
br i1 %.tmp2386, label %.if.true.2387, label %.if.false.2387
.if.true.2387:
%.tmp2388 = load i32, i32* %i
%.tmp2389 = add i32 %.tmp2388, 2
store i32 %.tmp2389, i32* %i
br label %.if.end.2387
.if.false.2387:
br label %.if.end.2387
.if.end.2387:
%.tmp2390 = load i32, i32* %len
%.tmp2391 = add i32 %.tmp2390, 1
store i32 %.tmp2391, i32* %len
%.tmp2392 = load i32, i32* %i
%.tmp2393 = add i32 %.tmp2392, 1
store i32 %.tmp2393, i32* %i
br label %.for.start.2376
.for.end.2376:
%.tmp2394 = load i32, i32* %len
%.tmp2395 = sub i32 %.tmp2394, 1
ret i32 %.tmp2395
}
define i8* @m2157$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval = alloca i32
store i32 0, i32* %intval
%buf = alloca i8*
store i8* null, i8** %buf
%chrval = alloca i8
store i8 0, i8* %chrval
%.tmp2396 = load i8*, i8** %chr_repr
%.tmp2397 = call i32(i8*) @strlen(i8* %.tmp2396)
%chr_len = alloca i32
store i32 %.tmp2397, i32* %chr_len
%.tmp2398 = load i32, i32* %chr_len
%.tmp2399 = icmp eq i32 %.tmp2398, 6
br i1 %.tmp2399, label %.if.true.2400, label %.if.false.2400
.if.true.2400:
%.tmp2401 = load i8*, i8** %chr_repr
%.tmp2403 = getelementptr [7 x i8], [7 x i8]*@.str2402, i32 0, i32 0
%.tmp2404 = getelementptr i32, i32* %intval, i32 0
%.tmp2405 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2401, i8* %.tmp2403, i32* %.tmp2404)
%.tmp2406 = getelementptr i8*, i8** %buf, i32 0
%.tmp2408 = getelementptr [3 x i8], [3 x i8]*@.str2407, i32 0, i32 0
%.tmp2409 = load i32, i32* %intval
%.tmp2410 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2406, i8* %.tmp2408, i32 %.tmp2409)
br label %.if.end.2400
.if.false.2400:
%.tmp2411 = load i32, i32* %chr_len
%.tmp2412 = icmp eq i32 %.tmp2411, 5
br i1 %.tmp2412, label %.if.true.2413, label %.if.false.2413
.if.true.2413:
%.tmp2414 = load i8*, i8** %chr_repr
%.tmp2416 = getelementptr [6 x i8], [6 x i8]*@.str2415, i32 0, i32 0
%.tmp2417 = getelementptr i32, i32* %intval, i32 0
%.tmp2418 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2414, i8* %.tmp2416, i32* %.tmp2417)
%.tmp2419 = getelementptr i8*, i8** %buf, i32 0
%.tmp2421 = getelementptr [3 x i8], [3 x i8]*@.str2420, i32 0, i32 0
%.tmp2422 = load i32, i32* %intval
%.tmp2423 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2419, i8* %.tmp2421, i32 %.tmp2422)
br label %.if.end.2413
.if.false.2413:
%.tmp2424 = load i32, i32* %chr_len
%.tmp2425 = icmp eq i32 %.tmp2424, 4
br i1 %.tmp2425, label %.if.true.2426, label %.if.false.2426
.if.true.2426:
%.tmp2427 = load i8*, i8** %chr_repr
%.tmp2429 = getelementptr [6 x i8], [6 x i8]*@.str2428, i32 0, i32 0
%.tmp2430 = getelementptr i8, i8* %chrval, i32 0
%.tmp2431 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2427, i8* %.tmp2429, i8* %.tmp2430)
%.tmp2432 = load i8, i8* %chrval
%.tmp2433 = icmp eq i8 %.tmp2432, 110
br i1 %.tmp2433, label %.if.true.2434, label %.if.false.2434
.if.true.2434:
%.tmp2436 = getelementptr [3 x i8], [3 x i8]*@.str2435, i32 0, i32 0
store i8* %.tmp2436, i8** %buf
br label %.if.end.2434
.if.false.2434:
%.tmp2437 = bitcast ptr null to i8*
ret i8* %.tmp2437
br label %.if.end.2434
.if.end.2434:
br label %.if.end.2426
.if.false.2426:
%.tmp2438 = load i32, i32* %chr_len
%.tmp2439 = icmp eq i32 %.tmp2438, 3
br i1 %.tmp2439, label %.if.true.2440, label %.if.false.2440
.if.true.2440:
%.tmp2441 = load i8*, i8** %chr_repr
%.tmp2443 = getelementptr [5 x i8], [5 x i8]*@.str2442, i32 0, i32 0
%.tmp2444 = getelementptr i32, i32* %intval, i32 0
%.tmp2445 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2441, i8* %.tmp2443, i32* %.tmp2444)
%.tmp2446 = getelementptr i8*, i8** %buf, i32 0
%.tmp2448 = getelementptr [3 x i8], [3 x i8]*@.str2447, i32 0, i32 0
%.tmp2449 = load i32, i32* %intval
%.tmp2450 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2446, i8* %.tmp2448, i32 %.tmp2449)
br label %.if.end.2440
.if.false.2440:
%.tmp2451 = bitcast ptr null to i8*
ret i8* %.tmp2451
br label %.if.end.2440
.if.end.2440:
br label %.if.end.2426
.if.end.2426:
br label %.if.end.2413
.if.end.2413:
br label %.if.end.2400
.if.end.2400:
%.tmp2452 = load i8*, i8** %buf
ret i8* %.tmp2452
}
@.str2368 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2402 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2407 = constant [3 x i8] c"%d\00"
@.str2415 = constant [6 x i8] c"'\5C%x'\00"
@.str2420 = constant [3 x i8] c"%d\00"
@.str2428 = constant [6 x i8] c"'\5C%c'\00"
@.str2435 = constant [3 x i8] c"10\00"
@.str2442 = constant [5 x i8] c"'%c'\00"
@.str2447 = constant [3 x i8] c"%d\00"
@DEBUG_INTERNALS = constant i1 0
%m1811$.ErrorList.type = type {%m754$.Error.type*,%m1811$.ErrorList.type*,i1}
%m1811$.Type.type = type {i8*,i8*,i8*,%m1811$.Type.type*,%m1811$.Type.type*}
define %m1811$.Type.type* @m1811$type_clone.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.t.arg) {
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.t.arg, %m1811$.Type.type** %t
%.tmp2453 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2454 = icmp eq %m1811$.Type.type* %.tmp2453, null
br i1 %.tmp2454, label %.if.true.2455, label %.if.false.2455
.if.true.2455:
%.tmp2456 = bitcast ptr null to %m1811$.Type.type*
ret %m1811$.Type.type* %.tmp2456
br label %.if.end.2455
.if.false.2455:
br label %.if.end.2455
.if.end.2455:
%.tmp2457 = getelementptr %m1811$.Type.type, %m1811$.Type.type* null, i32 1
%.tmp2458 = ptrtoint %m1811$.Type.type* %.tmp2457 to i32
%.tmp2459 = call i8*(i32) @malloc(i32 %.tmp2458)
%.tmp2460 = bitcast i8* %.tmp2459 to %m1811$.Type.type*
%clone = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp2460, %m1811$.Type.type** %clone
%.tmp2461 = load %m1811$.Type.type*, %m1811$.Type.type** %clone
%.tmp2462 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2461, i32 0, i32 3
%.tmp2463 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2464 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2463, i32 0, i32 3
%.tmp2465 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2464
store %m1811$.Type.type* %.tmp2465, %m1811$.Type.type** %.tmp2462
%.tmp2466 = load %m1811$.Type.type*, %m1811$.Type.type** %clone
%.tmp2467 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2466, i32 0, i32 4
%.tmp2468 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2469 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2468, i32 0, i32 4
%.tmp2470 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2469
%.tmp2471 = call %m1811$.Type.type*(%m1811$.Type.type*) @m1811$type_clone.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp2470)
store %m1811$.Type.type* %.tmp2471, %m1811$.Type.type** %.tmp2467
%.tmp2472 = load %m1811$.Type.type*, %m1811$.Type.type** %clone
%.tmp2473 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2472, i32 0, i32 2
%.tmp2474 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2475 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2474, i32 0, i32 2
%.tmp2476 = load i8*, i8** %.tmp2475
store i8* %.tmp2476, i8** %.tmp2473
%.tmp2477 = load %m1811$.Type.type*, %m1811$.Type.type** %clone
%.tmp2478 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2477, i32 0, i32 0
%.tmp2479 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2480 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2479, i32 0, i32 0
%.tmp2481 = load i8*, i8** %.tmp2480
store i8* %.tmp2481, i8** %.tmp2478
%.tmp2482 = load %m1811$.Type.type*, %m1811$.Type.type** %clone
%.tmp2483 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2482, i32 0, i32 1
%.tmp2484 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2485 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2484, i32 0, i32 1
%.tmp2486 = load i8*, i8** %.tmp2485
store i8* %.tmp2486, i8** %.tmp2483
%.tmp2487 = load %m1811$.Type.type*, %m1811$.Type.type** %clone
ret %m1811$.Type.type* %.tmp2487
}
define %m1811$.Type.type* @m1811$new_type.m1811$.Type.typep() {
%.tmp2488 = getelementptr %m1811$.Type.type, %m1811$.Type.type* null, i32 1
%.tmp2489 = ptrtoint %m1811$.Type.type* %.tmp2488 to i32
%.tmp2490 = call i8*(i32) @malloc(i32 %.tmp2489)
%.tmp2491 = bitcast i8* %.tmp2490 to %m1811$.Type.type*
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp2491, %m1811$.Type.type** %type
%.tmp2492 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2493 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2492, i32 0, i32 1
store i8* null, i8** %.tmp2493
%.tmp2494 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2495 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2494, i32 0, i32 2
store i8* null, i8** %.tmp2495
%.tmp2496 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2497 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2496, i32 0, i32 0
store i8* null, i8** %.tmp2497
%.tmp2498 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2499 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2498, i32 0, i32 3
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp2499
%.tmp2500 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2501 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2500, i32 0, i32 4
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp2501
%.tmp2502 = load %m1811$.Type.type*, %m1811$.Type.type** %type
ret %m1811$.Type.type* %.tmp2502
}
define void @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.dest.arg, %m1811$.Type.type* %.src.arg) {
%dest = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.dest.arg, %m1811$.Type.type** %dest
%src = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.src.arg, %m1811$.Type.type** %src
%.tmp2503 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2504 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2503, i32 0, i32 0
%.tmp2505 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2506 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2505, i32 0, i32 0
%.tmp2507 = load i8*, i8** %.tmp2506
store i8* %.tmp2507, i8** %.tmp2504
%.tmp2508 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2509 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2508, i32 0, i32 1
%.tmp2510 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2511 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2510, i32 0, i32 1
%.tmp2512 = load i8*, i8** %.tmp2511
store i8* %.tmp2512, i8** %.tmp2509
%.tmp2513 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2514 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2513, i32 0, i32 2
%.tmp2515 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2516 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2515, i32 0, i32 2
%.tmp2517 = load i8*, i8** %.tmp2516
store i8* %.tmp2517, i8** %.tmp2514
%.tmp2518 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2519 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2518, i32 0, i32 3
%.tmp2520 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2519
%.tmp2521 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2522 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2521, i32 0, i32 3
%.tmp2523 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2522
%.tmp2524 = icmp ne %m1811$.Type.type* %.tmp2520, %.tmp2523
br i1 %.tmp2524, label %.if.true.2525, label %.if.false.2525
.if.true.2525:
%.tmp2526 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2527 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2526, i32 0, i32 3
%.tmp2528 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2529 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2528, i32 0, i32 3
%.tmp2530 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2529
store %m1811$.Type.type* %.tmp2530, %m1811$.Type.type** %.tmp2527
%.tmp2531 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2532 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2531, i32 0, i32 3
%.tmp2533 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2532
%.tmp2534 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2535 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2534, i32 0, i32 3
%.tmp2536 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2535
call void(%m1811$.Type.type*,%m1811$.Type.type*) @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp2533, %m1811$.Type.type* %.tmp2536)
br label %.if.end.2525
.if.false.2525:
br label %.if.end.2525
.if.end.2525:
%.tmp2537 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2538 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2537, i32 0, i32 4
%.tmp2539 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2538
%.tmp2540 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2541 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2540, i32 0, i32 4
%.tmp2542 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2541
%.tmp2543 = icmp ne %m1811$.Type.type* %.tmp2539, %.tmp2542
br i1 %.tmp2543, label %.if.true.2544, label %.if.false.2544
.if.true.2544:
%.tmp2545 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2546 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2545, i32 0, i32 4
%.tmp2547 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2548 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2547, i32 0, i32 4
%.tmp2549 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2548
store %m1811$.Type.type* %.tmp2549, %m1811$.Type.type** %.tmp2546
%.tmp2550 = load %m1811$.Type.type*, %m1811$.Type.type** %dest
%.tmp2551 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2550, i32 0, i32 4
%.tmp2552 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2551
%.tmp2553 = load %m1811$.Type.type*, %m1811$.Type.type** %src
%.tmp2554 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2553, i32 0, i32 4
%.tmp2555 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2554
call void(%m1811$.Type.type*,%m1811$.Type.type*) @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp2552, %m1811$.Type.type* %.tmp2555)
br label %.if.end.2544
.if.false.2544:
br label %.if.end.2544
.if.end.2544:
ret void
}
define void @m1811$debug_type.v.m1811$.Type.typep.i(%m1811$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.t.arg, %m1811$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2556 = load i32, i32* %level
%.tmp2557 = add i32 %.tmp2556, 1
%.tmp2558 = call i8*(i32) @malloc(i32 %.tmp2557)
%.tmp2559 = bitcast i8* %.tmp2558 to i8*
%indent = alloca i8*
store i8* %.tmp2559, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2560
.for.start.2560:
%.tmp2561 = load i32, i32* %i
%.tmp2562 = load i32, i32* %level
%.tmp2563 = icmp slt i32 %.tmp2561, %.tmp2562
br i1 %.tmp2563, label %.for.continue.2560, label %.for.end.2560
.for.continue.2560:
%.tmp2564 = load i32, i32* %i
%.tmp2565 = load i8*, i8** %indent
%.tmp2566 = getelementptr i8, i8* %.tmp2565, i32 %.tmp2564
store i8 32, i8* %.tmp2566
%.tmp2567 = load i32, i32* %i
%.tmp2568 = add i32 %.tmp2567, 1
store i32 %.tmp2568, i32* %i
br label %.for.start.2560
.for.end.2560:
%.tmp2569 = load i32, i32* %level
%.tmp2570 = load i8*, i8** %indent
%.tmp2571 = getelementptr i8, i8* %.tmp2570, i32 %.tmp2569
store i8 0, i8* %.tmp2571
%.tmp2573 = getelementptr [5 x i8], [5 x i8]*@.str2572, i32 0, i32 0
%.tmp2574 = load i8*, i8** %indent
%.tmp2575 = call i32(i8*,...) @printf(i8* %.tmp2573, i8* %.tmp2574)
%.tmp2577 = getelementptr [21 x i8], [21 x i8]*@.str2576, i32 0, i32 0
%.tmp2578 = load i8*, i8** %indent
%.tmp2579 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2580 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2579, i32 0, i32 0
%.tmp2581 = load i8*, i8** %.tmp2580
%.tmp2582 = call i32(i8*,...) @printf(i8* %.tmp2577, i8* %.tmp2578, i8* %.tmp2581)
%.tmp2584 = getelementptr [16 x i8], [16 x i8]*@.str2583, i32 0, i32 0
%.tmp2585 = load i8*, i8** %indent
%.tmp2586 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2587 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2586, i32 0, i32 1
%.tmp2588 = load i8*, i8** %.tmp2587
%.tmp2589 = call i32(i8*,...) @printf(i8* %.tmp2584, i8* %.tmp2585, i8* %.tmp2588)
%.tmp2591 = getelementptr [16 x i8], [16 x i8]*@.str2590, i32 0, i32 0
%.tmp2592 = load i8*, i8** %indent
%.tmp2593 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2594 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2593, i32 0, i32 2
%.tmp2595 = load i8*, i8** %.tmp2594
%.tmp2596 = call i32(i8*,...) @printf(i8* %.tmp2591, i8* %.tmp2592, i8* %.tmp2595)
%.tmp2597 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2598 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2597, i32 0, i32 3
%.tmp2599 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2598
%.tmp2600 = icmp eq %m1811$.Type.type* %.tmp2599, null
br i1 %.tmp2600, label %.if.true.2601, label %.if.false.2601
.if.true.2601:
%.tmp2603 = getelementptr [16 x i8], [16 x i8]*@.str2602, i32 0, i32 0
%.tmp2604 = load i8*, i8** %indent
%.tmp2605 = call i32(i8*,...) @printf(i8* %.tmp2603, i8* %.tmp2604)
br label %.if.end.2601
.if.false.2601:
%.tmp2607 = getelementptr [10 x i8], [10 x i8]*@.str2606, i32 0, i32 0
%.tmp2608 = load i8*, i8** %indent
%.tmp2609 = call i32(i8*,...) @printf(i8* %.tmp2607, i8* %.tmp2608)
%.tmp2610 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2611 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2610, i32 0, i32 3
%.tmp2612 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2611
%.tmp2613 = load i32, i32* %level
%.tmp2614 = add i32 %.tmp2613, 1
call void(%m1811$.Type.type*,i32) @m1811$debug_type.v.m1811$.Type.typep.i(%m1811$.Type.type* %.tmp2612, i32 %.tmp2614)
br label %.if.end.2601
.if.end.2601:
%.tmp2615 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2616 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2615, i32 0, i32 4
%.tmp2617 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2616
%.tmp2618 = icmp eq %m1811$.Type.type* %.tmp2617, null
br i1 %.tmp2618, label %.if.true.2619, label %.if.false.2619
.if.true.2619:
%.tmp2621 = getelementptr [18 x i8], [18 x i8]*@.str2620, i32 0, i32 0
%.tmp2622 = load i8*, i8** %indent
%.tmp2623 = call i32(i8*,...) @printf(i8* %.tmp2621, i8* %.tmp2622)
br label %.if.end.2619
.if.false.2619:
%.tmp2625 = getelementptr [12 x i8], [12 x i8]*@.str2624, i32 0, i32 0
%.tmp2626 = load i8*, i8** %indent
%.tmp2627 = call i32(i8*,...) @printf(i8* %.tmp2625, i8* %.tmp2626)
%.tmp2628 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp2629 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2628, i32 0, i32 4
%.tmp2630 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2629
%.tmp2631 = load i32, i32* %level
%.tmp2632 = add i32 %.tmp2631, 1
call void(%m1811$.Type.type*,i32) @m1811$debug_type.v.m1811$.Type.typep.i(%m1811$.Type.type* %.tmp2630, i32 %.tmp2632)
br label %.if.end.2619
.if.end.2619:
%.tmp2634 = getelementptr [5 x i8], [5 x i8]*@.str2633, i32 0, i32 0
%.tmp2635 = load i8*, i8** %indent
%.tmp2636 = call i32(i8*,...) @printf(i8* %.tmp2634, i8* %.tmp2635)
ret void
}
%m1811$.AssignableInfo.type = type {i8*,i8,i8*,%m1811$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1811$.AssignableInfo.type* @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.node.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2637 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* null, i32 1
%.tmp2638 = ptrtoint %m1811$.AssignableInfo.type* %.tmp2637 to i32
%.tmp2639 = call i8*(i32) @malloc(i32 %.tmp2638)
%.tmp2640 = bitcast i8* %.tmp2639 to %m1811$.AssignableInfo.type*
%ptr = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp2640, %m1811$.AssignableInfo.type** %ptr
%.tmp2641 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2642 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2641, i32 0, i32 1
%.tmp2643 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2643, i8* %.tmp2642
%.tmp2644 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2645 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2644, i32 0, i32 0
store i8* null, i8** %.tmp2645
%.tmp2646 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2647 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2646, i32 0, i32 2
store i8* null, i8** %.tmp2647
%.tmp2648 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2649 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2648, i32 0, i32 3
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp2649
%.tmp2650 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2651 = icmp ne %m286$.Node.type* %.tmp2650, null
br i1 %.tmp2651, label %.if.true.2652, label %.if.false.2652
.if.true.2652:
%.tmp2653 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2654 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2653, i32 0, i32 4
%.tmp2655 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2656 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2655, i32 0, i32 3
%.tmp2657 = load i32, i32* %.tmp2656
store i32 %.tmp2657, i32* %.tmp2654
%.tmp2658 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2659 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2658, i32 0, i32 5
%.tmp2660 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2661 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2660, i32 0, i32 4
%.tmp2662 = load i32, i32* %.tmp2661
store i32 %.tmp2662, i32* %.tmp2659
%.tmp2663 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2664 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2663, i32 0, i32 6
%.tmp2665 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2666 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2665, i32 0, i32 2
%.tmp2667 = load i8*, i8** %.tmp2666
store i8* %.tmp2667, i8** %.tmp2664
br label %.if.end.2652
.if.false.2652:
%.tmp2668 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2669 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2668, i32 0, i32 4
store i32 0, i32* %.tmp2669
%.tmp2670 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2671 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2670, i32 0, i32 5
store i32 0, i32* %.tmp2671
%.tmp2672 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
%.tmp2673 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2672, i32 0, i32 6
store i8* null, i8** %.tmp2673
br label %.if.end.2652
.if.end.2652:
%.tmp2674 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %ptr
ret %m1811$.AssignableInfo.type* %.tmp2674
}
define void @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2675 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2676 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2675, i32 0, i32 0
%.tmp2677 = load i8*, i8** %id
store i8* %.tmp2677, i8** %.tmp2676
%.tmp2678 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2679 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2678, i32 0, i32 1
%.tmp2680 = load i8, i8* %scope
store i8 %.tmp2680, i8* %.tmp2679
ret void
}
define i8* @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%.tmp2681 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2682 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2681, i32 0, i32 1
%.tmp2683 = load i8, i8* %.tmp2682
%.tmp2684 = load i8, i8* @SCOPE_CONST
%.tmp2685 = icmp eq i8 %.tmp2683, %.tmp2684
br i1 %.tmp2685, label %.if.true.2686, label %.if.false.2686
.if.true.2686:
%.tmp2687 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2688 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2687, i32 0, i32 0
%.tmp2689 = load i8*, i8** %.tmp2688
ret i8* %.tmp2689
br label %.if.end.2686
.if.false.2686:
br label %.if.end.2686
.if.end.2686:
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp2690 = getelementptr i8*, i8** %buf, i32 0
%.tmp2692 = getelementptr [5 x i8], [5 x i8]*@.str2691, i32 0, i32 0
%.tmp2693 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2694 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2693, i32 0, i32 1
%.tmp2695 = load i8, i8* %.tmp2694
%.tmp2696 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2697 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2696, i32 0, i32 0
%.tmp2698 = load i8*, i8** %.tmp2697
%.tmp2699 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2690, i8* %.tmp2692, i8 %.tmp2695, i8* %.tmp2698)
%.tmp2700 = load i8*, i8** %buf
ret i8* %.tmp2700
}
%m1811$.ScopeItem.type = type {i8*,%m1811$.AssignableInfo.type*,%m1811$.ScopeItem.type*}
%m1811$.GlobalName.type = type {i8*,i8*,i1,%m1811$.AssignableInfo.type*,%m1811$.GlobalName.type*}
%m1811$.Scope.type = type {i8*,%m1811$.ScopeItem.type*,i8*,i8*,i8*,%m1811$.Scope.type*}
%m1811$.ModuleLookup.type = type {i8*,i8*,%m1811$.ModuleLookup.type*,%m1811$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1811$.CompilerCtx.type = type {%m286$.Node.type*,%m0$.File.type*,%m1811$.ErrorList.type*,%m1811$.GlobalName.type*,i32,%m1811$.ModuleLookup.type*,i8*}
define void @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp2701 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2703 = getelementptr [7 x i8], [7 x i8]*@.str2702, i32 0, i32 0
%.tmp2704 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2705 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp2704)
%.tmp2706 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2701, i8* %.tmp2703, i32 %.tmp2705)
%.tmp2707 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp2708 = load i8, i8* @SCOPE_LOCAL
%.tmp2709 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp2707, i8 %.tmp2708, i8* %.tmp2709)
ret void
}
define %m1811$.ModuleLookup.type* @m1811$get_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2711 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2712 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2711, i32 0, i32 5
%.tmp2713 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp2712
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp2713, %m1811$.ModuleLookup.type** %m
br label %.for.start.2710
.for.start.2710:
%.tmp2714 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2715 = icmp ne %m1811$.ModuleLookup.type* %.tmp2714, null
br i1 %.tmp2715, label %.for.continue.2710, label %.for.end.2710
.for.continue.2710:
%.tmp2716 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2717 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2716, i32 0, i32 0
%.tmp2718 = load i8*, i8** %.tmp2717
%.tmp2719 = load i8*, i8** %filename
%.tmp2720 = call i32(i8*,i8*) @strcmp(i8* %.tmp2718, i8* %.tmp2719)
%.tmp2721 = icmp eq i32 %.tmp2720, 0
br i1 %.tmp2721, label %.if.true.2722, label %.if.false.2722
.if.true.2722:
%.tmp2723 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
ret %m1811$.ModuleLookup.type* %.tmp2723
br label %.if.end.2722
.if.false.2722:
br label %.if.end.2722
.if.end.2722:
%.tmp2724 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2725 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2724, i32 0, i32 2
%.tmp2726 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp2725
store %m1811$.ModuleLookup.type* %.tmp2726, %m1811$.ModuleLookup.type** %m
br label %.for.start.2710
.for.end.2710:
%.tmp2727 = bitcast ptr null to %m1811$.ModuleLookup.type*
ret %m1811$.ModuleLookup.type* %.tmp2727
}
define %m1811$.ModuleLookup.type* @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%.tmp2728 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2729 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2730 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2729, i32 0, i32 6
%.tmp2731 = load i8*, i8** %.tmp2730
%.tmp2732 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*,i8*) @m1811$get_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp2728, i8* %.tmp2731)
ret %m1811$.ModuleLookup.type* %.tmp2732
}
define i32 @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%.tmp2733 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2734 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2733, i32 0, i32 4
%.tmp2735 = load i32, i32* %.tmp2734
%uid = alloca i32
store i32 %.tmp2735, i32* %uid
%.tmp2736 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2737 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2736, i32 0, i32 4
%.tmp2738 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2739 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2738, i32 0, i32 4
%.tmp2740 = load i32, i32* %.tmp2739
%.tmp2741 = add i32 %.tmp2740, 1
store i32 %.tmp2741, i32* %.tmp2737
%.tmp2742 = load i32, i32* %uid
ret i32 %.tmp2742
}
define %m1811$.CompilerCtx.type* @m1811$new_context.m1811$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2743 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* null, i32 1
%.tmp2744 = ptrtoint %m1811$.CompilerCtx.type* %.tmp2743 to i32
%.tmp2745 = call i8*(i32) @malloc(i32 %.tmp2744)
%.tmp2746 = bitcast i8* %.tmp2745 to %m1811$.CompilerCtx.type*
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.tmp2746, %m1811$.CompilerCtx.type** %ctx
%.tmp2747 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2748 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2747, i32 0, i32 1
%.tmp2749 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2749, %m0$.File.type** %.tmp2748
%.tmp2750 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2751 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2750, i32 0, i32 0
%.tmp2752 = bitcast ptr null to %m286$.Node.type*
store %m286$.Node.type* %.tmp2752, %m286$.Node.type** %.tmp2751
%.tmp2753 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2754 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2753, i32 0, i32 2
store %m1811$.ErrorList.type* null, %m1811$.ErrorList.type** %.tmp2754
%.tmp2755 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2756 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2755, i32 0, i32 4
store i32 0, i32* %.tmp2756
%.tmp2757 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2758 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2757, i32 0, i32 3
store %m1811$.GlobalName.type* null, %m1811$.GlobalName.type** %.tmp2758
%.tmp2759 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2760 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2759, i32 0, i32 6
%.tmp2761 = load i8*, i8** %filename
store i8* %.tmp2761, i8** %.tmp2760
%.tmp2762 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2763 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2762, i32 0, i32 5
%.tmp2764 = load i32, i32* @ModuleLookup_size
%.tmp2765 = call i8*(i32) @malloc(i32 %.tmp2764)
%.tmp2766 = bitcast i8* %.tmp2765 to %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp2766, %m1811$.ModuleLookup.type** %.tmp2763
%.tmp2767 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2768 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2767, i32 0, i32 5
%.tmp2769 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp2768
%.tmp2770 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2769, i32 0, i32 0
%.tmp2771 = load i8*, i8** %filename
store i8* %.tmp2771, i8** %.tmp2770
%.tmp2772 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2773 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2772, i32 0, i32 5
%.tmp2774 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp2773
%.tmp2775 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2774, i32 0, i32 3
store %m1811$.Scope.type* null, %m1811$.Scope.type** %.tmp2775
%.tmp2776 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2777 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2776, i32 0, i32 5
%.tmp2778 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp2777
%.tmp2779 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2778, i32 0, i32 1
%.tmp2781 = getelementptr [1 x i8], [1 x i8]*@.str2780, i32 0, i32 0
store i8* %.tmp2781, i8** %.tmp2779
%.tmp2782 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2783 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2782, i32 0, i32 5
%.tmp2784 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp2783
%.tmp2785 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2784, i32 0, i32 2
store %m1811$.ModuleLookup.type* null, %m1811$.ModuleLookup.type** %.tmp2785
%.tmp2786 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2787 = bitcast %m1811$.CompilerCtx.type* %.tmp2786 to %m1811$.CompilerCtx.type*
ret %m1811$.CompilerCtx.type* %.tmp2787
}
define void @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%.tmp2788 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* null, i32 1
%.tmp2789 = ptrtoint %m1811$.Scope.type* %.tmp2788 to i32
%.tmp2790 = call i8*(i32) @malloc(i32 %.tmp2789)
%.tmp2791 = bitcast i8* %.tmp2790 to %m1811$.Scope.type*
%s = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp2791, %m1811$.Scope.type** %s
%.tmp2792 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2793 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp2792)
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp2793, %m1811$.ModuleLookup.type** %m
%.tmp2794 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp2795 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp2794, i32 0, i32 5
%.tmp2796 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2797 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2796, i32 0, i32 3
%.tmp2798 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp2797
store %m1811$.Scope.type* %.tmp2798, %m1811$.Scope.type** %.tmp2795
%.tmp2799 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp2800 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp2799, i32 0, i32 1
store %m1811$.ScopeItem.type* null, %m1811$.ScopeItem.type** %.tmp2800
%.tmp2801 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp2802 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp2801, i32 0, i32 2
%.tmp2803 = load i8*, i8** %type
store i8* %.tmp2803, i8** %.tmp2802
%.tmp2804 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp2805 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp2804, i32 0, i32 3
%.tmp2806 = load i8*, i8** %begin_id
store i8* %.tmp2806, i8** %.tmp2805
%.tmp2807 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp2808 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp2807, i32 0, i32 4
%.tmp2809 = load i8*, i8** %end_id
store i8* %.tmp2809, i8** %.tmp2808
%.tmp2810 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2811 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2810, i32 0, i32 3
%.tmp2812 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
store %m1811$.Scope.type* %.tmp2812, %m1811$.Scope.type** %.tmp2811
ret void
}
define void @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%.tmp2813 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2814 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp2813)
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp2814, %m1811$.ModuleLookup.type** %m
%.tmp2815 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2816 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2815, i32 0, i32 3
%.tmp2817 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp2816
%.tmp2818 = icmp ne %m1811$.Scope.type* %.tmp2817, null
%.tmp2820 = getelementptr [61 x i8], [61 x i8]*@.str2819, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2818, i8* %.tmp2820)
%.tmp2821 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2822 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2821, i32 0, i32 3
%.tmp2823 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2824 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2823, i32 0, i32 3
%.tmp2825 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp2824
%.tmp2826 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp2825, i32 0, i32 5
%.tmp2827 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp2826
store %m1811$.Scope.type* %.tmp2827, %m1811$.Scope.type** %.tmp2822
ret void
}
define i1 @m1811$compile_file.b.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2828 = call i8*() @m1812$grammar.cp()
%.tmp2829 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2828)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2829, %m0$.File.type** %grammar_file
%.tmp2830 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2831 = icmp eq %m0$.File.type* %.tmp2830, null
br i1 %.tmp2831, label %.if.true.2832, label %.if.false.2832
.if.true.2832:
ret i1 0
br label %.if.end.2832
.if.false.2832:
br label %.if.end.2832
.if.end.2832:
%.tmp2833 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2834 = call %m286$.ParsingContext.type*(%m0$.File.type*) @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2833)
%grammar_ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp2834, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2835 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2836 = call %m286$.Rule.type**(%m286$.ParsingContext.type*) @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp2835)
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp2836, %m286$.Rule.type*** %grammar
%.tmp2837 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2838 = bitcast %m286$.ParsingContext.type* %.tmp2837 to i8*
call void(i8*) @free(i8* %.tmp2838)
%.tmp2839 = load i8*, i8** %filepath
%.tmp2840 = load i32, i32* @O_RDONLY
%.tmp2841 = call i32(i8*,i32) @open(i8* %.tmp2839, i32 %.tmp2840)
%input_fd = alloca i32
store i32 %.tmp2841, i32* %input_fd
%.tmp2842 = load i32, i32* %input_fd
%.tmp2843 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp2842)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp2843, %m209$.PeekerInfo.type** %p
%.tmp2844 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2845 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp2844, i32 0, i32 6
%.tmp2846 = load i8*, i8** %filepath
store i8* %.tmp2846, i8** %.tmp2845
%.tmp2847 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2848 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp2847, i1 0)
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp2848, %m287$.Token.type** %tokens
%.tmp2849 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp2851 = getelementptr [6 x i8], [6 x i8]*@.str2850, i32 0, i32 0
%.tmp2852 = load %m287$.Token.type*, %m287$.Token.type** %tokens
%.tmp2853 = call %m286$.ParseResult.type*(%m286$.Rule.type**,i8*,%m287$.Token.type*) @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.tmp2849, i8* %.tmp2851, %m287$.Token.type* %.tmp2852)
%ast = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp2853, %m286$.ParseResult.type** %ast
%.tmp2854 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2855 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %ast
%.tmp2856 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp2855, i32 0, i32 1
%.tmp2857 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2856
%.tmp2858 = call i1(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile.b.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp2854, %m286$.Node.type* %.tmp2857)
ret i1 %.tmp2858
}
define i1 @m1811$compile.b.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2859 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2860 = load %m286$.Node.type*, %m286$.Node.type** %ast
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_ast.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp2859, %m286$.Node.type* %.tmp2860)
%.tmp2861 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2862 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2861, i32 0, i32 2
%.tmp2863 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp2862
%.tmp2864 = icmp ne %m1811$.ErrorList.type* %.tmp2863, null
%has_errors = alloca i1
store i1 %.tmp2864, i1* %has_errors
%.tmp2866 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2867 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2866, i32 0, i32 2
%.tmp2868 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp2867
%err = alloca %m1811$.ErrorList.type*
store %m1811$.ErrorList.type* %.tmp2868, %m1811$.ErrorList.type** %err
br label %.for.start.2865
.for.start.2865:
%.tmp2869 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %err
%.tmp2870 = icmp ne %m1811$.ErrorList.type* %.tmp2869, null
br i1 %.tmp2870, label %.for.continue.2865, label %.for.end.2865
.for.continue.2865:
%.tmp2871 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %err
%.tmp2872 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp2871, i32 0, i32 2
%.tmp2873 = load i1, i1* %.tmp2872
%.tmp2874 = icmp eq i1 %.tmp2873, 0
br i1 %.tmp2874, label %.if.true.2875, label %.if.false.2875
.if.true.2875:
%.tmp2876 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %err
%.tmp2877 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp2876, i32 0, i32 0
%.tmp2878 = load %m754$.Error.type*, %m754$.Error.type** %.tmp2877
call void(%m754$.Error.type*) @m754$report.v.m754$.Error.typep(%m754$.Error.type* %.tmp2878)
%.tmp2879 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %err
%.tmp2880 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp2879, i32 0, i32 2
store i1 1, i1* %.tmp2880
br label %.if.end.2875
.if.false.2875:
br label %.if.end.2875
.if.end.2875:
%.tmp2881 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %err
%.tmp2882 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp2881, i32 0, i32 1
%.tmp2883 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp2882
store %m1811$.ErrorList.type* %.tmp2883, %m1811$.ErrorList.type** %err
br label %.for.start.2865
.for.end.2865:
%.tmp2885 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2886 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2885, i32 0, i32 3
%.tmp2887 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp2886
%g = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.tmp2887, %m1811$.GlobalName.type** %g
br label %.for.start.2884
.for.start.2884:
%.tmp2888 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2889 = icmp ne %m1811$.GlobalName.type* %.tmp2888, null
br i1 %.tmp2889, label %.for.continue.2884, label %.for.end.2884
.for.continue.2884:
%.tmp2890 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2891 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
call void(%m1811$.CompilerCtx.type*,%m1811$.GlobalName.type*) @m1811$compile_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.tmp2890, %m1811$.GlobalName.type* %.tmp2891)
%.tmp2892 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2893 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2892, i32 0, i32 4
%.tmp2894 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp2893
store %m1811$.GlobalName.type* %.tmp2894, %m1811$.GlobalName.type** %g
br label %.for.start.2884
.for.end.2884:
%.tmp2895 = load i1, i1* %has_errors
ret i1 %.tmp2895
}
define void @m1811$compile_ast.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2896 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2897 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2896, i32 0, i32 0
%.tmp2898 = load i8*, i8** %.tmp2897
%.tmp2900 = getelementptr [6 x i8], [6 x i8]*@.str2899, i32 0, i32 0
%.tmp2901 = call i32(i8*,i8*) @strcmp(i8* %.tmp2898, i8* %.tmp2900)
%.tmp2902 = icmp ne i32 %.tmp2901, 0
br i1 %.tmp2902, label %.if.true.2903, label %.if.false.2903
.if.true.2903:
ret void
br label %.if.end.2903
.if.false.2903:
br label %.if.end.2903
.if.end.2903:
%.tmp2904 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2906 = getelementptr [7 x i8], [7 x i8]*@.str2905, i32 0, i32 0
%.tmp2907 = bitcast ptr null to i8*
%.tmp2908 = bitcast ptr null to i8*
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp2904, i8* %.tmp2906, i8* %.tmp2907, i8* %.tmp2908)
%.tmp2909 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2910 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2909, i32 0, i32 6
%.tmp2911 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2910
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2911, %m286$.Node.type** %start
%.tmp2912 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2913 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2912, i32 0, i32 0
%.tmp2914 = load i8*, i8** %.tmp2913
%.tmp2916 = getelementptr [13 x i8], [13 x i8]*@.str2915, i32 0, i32 0
%.tmp2917 = call i32(i8*,i8*) @strcmp(i8* %.tmp2914, i8* %.tmp2916)
%.tmp2918 = icmp eq i32 %.tmp2917, 0
br i1 %.tmp2918, label %.if.true.2919, label %.if.false.2919
.if.true.2919:
%.tmp2920 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2921 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2920, i32 0, i32 7
%.tmp2922 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2921
store %m286$.Node.type* %.tmp2922, %m286$.Node.type** %start
br label %.if.end.2919
.if.false.2919:
br label %.if.end.2919
.if.end.2919:
%.tmp2924 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2924, %m286$.Node.type** %stmt
br label %.for.start.2923
.for.start.2923:
%.tmp2925 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2926 = icmp ne %m286$.Node.type* %.tmp2925, null
br i1 %.tmp2926, label %.for.continue.2923, label %.for.end.2923
.for.continue.2923:
%.tmp2927 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2928 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2929 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2928, i32 0, i32 6
%.tmp2930 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2929
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1811$compile_statement.v.m1811$.CompilerCtx.typep.m286$.Node.typep.b(%m1811$.CompilerCtx.type* %.tmp2927, %m286$.Node.type* %.tmp2930, i1 1)
%.tmp2931 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2932 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2931, i32 0, i32 7
%.tmp2933 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2932
store %m286$.Node.type* %.tmp2933, %m286$.Node.type** %stmt
br label %.for.start.2923
.for.end.2923:
%.tmp2935 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2935, %m286$.Node.type** %s
br label %.for.start.2934
.for.start.2934:
%.tmp2936 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2937 = icmp ne %m286$.Node.type* %.tmp2936, null
br i1 %.tmp2937, label %.for.continue.2934, label %.for.end.2934
.for.continue.2934:
%.tmp2938 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2939 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2940 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2939, i32 0, i32 6
%.tmp2941 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2940
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1811$compile_statement.v.m1811$.CompilerCtx.typep.m286$.Node.typep.b(%m1811$.CompilerCtx.type* %.tmp2938, %m286$.Node.type* %.tmp2941, i1 0)
%.tmp2942 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2943 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2942, i32 0, i32 7
%.tmp2944 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2943
store %m286$.Node.type* %.tmp2944, %m286$.Node.type** %s
br label %.for.start.2934
.for.end.2934:
ret void
}
define void @m1811$compile_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%g = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.g.arg, %m1811$.GlobalName.type** %g
%.tmp2945 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2946 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2945, i32 0, i32 2
%.tmp2947 = load i1, i1* %.tmp2946
%.tmp2948 = icmp eq i1 %.tmp2947, 0
%.tmp2949 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2950 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2949, i32 0, i32 1
%.tmp2951 = load i8*, i8** %.tmp2950
%.tmp2953 = getelementptr [7 x i8], [7 x i8]*@.str2952, i32 0, i32 0
%.tmp2954 = call i32(i8*,i8*) @strcmp(i8* %.tmp2951, i8* %.tmp2953)
%.tmp2955 = icmp eq i32 %.tmp2954, 0
%.tmp2956 = and i1 %.tmp2948, %.tmp2955
br i1 %.tmp2956, label %.if.true.2957, label %.if.false.2957
.if.true.2957:
%.tmp2958 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2959 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2958, i32 0, i32 1
%.tmp2960 = load %m0$.File.type*, %m0$.File.type** %.tmp2959
%.tmp2962 = getelementptr [21 x i8], [21 x i8]*@.str2961, i32 0, i32 0
%.tmp2963 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2964 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2963, i32 0, i32 3
%.tmp2965 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp2964
%.tmp2966 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp2965)
%.tmp2967 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2968 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2969 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2968, i32 0, i32 3
%.tmp2970 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp2969
%.tmp2971 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2970, i32 0, i32 3
%.tmp2972 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2971
%.tmp2973 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp2967, %m1811$.Type.type* %.tmp2972)
%.tmp2974 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2975 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2974, i32 0, i32 0
%.tmp2976 = load i8*, i8** %.tmp2975
%.tmp2977 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2960, i8* %.tmp2962, i8* %.tmp2966, i8* %.tmp2973, i8* %.tmp2976)
%.tmp2978 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2979 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2978, i32 0, i32 2
store i1 1, i1* %.tmp2979
br label %.if.end.2957
.if.false.2957:
br label %.if.end.2957
.if.end.2957:
ret void
}
define i8* @m1811$get_mod_prefix.cp.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2980 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2981 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp2980)
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp2981, %m1811$.ModuleLookup.type** %m
%.tmp2982 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2983 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2982, i32 0, i32 1
%.tmp2984 = load i8*, i8** %.tmp2983
ret i8* %.tmp2984
}
define i8* @m1811$name_mangle.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1811$.Type.type* %.type.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%fn = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn.arg, %m286$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.type.arg, %m1811$.Type.type** %type
%mangled_name = alloca i8*
store i8* null, i8** %mangled_name
%.tmp2985 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2986 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2987 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2986, i32 0, i32 2
%.tmp2988 = load i8*, i8** %.tmp2987
%.tmp2989 = call i8*(%m1811$.CompilerCtx.type*,i8*) @m1811$get_mod_prefix.cp.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp2985, i8* %.tmp2988)
%prefix = alloca i8*
store i8* %.tmp2989, i8** %prefix
%.tmp2990 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2992 = getelementptr [5 x i8], [5 x i8]*@.str2991, i32 0, i32 0
%.tmp2993 = load i8*, i8** %prefix
%.tmp2994 = load i8*, i8** %original_name
%.tmp2995 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2990, i8* %.tmp2992, i8* %.tmp2993, i8* %.tmp2994)
%.tmp2996 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2997 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2996, i32 0, i32 0
%.tmp2998 = load i8*, i8** %.tmp2997
%.tmp3000 = getelementptr [9 x i8], [9 x i8]*@.str2999, i32 0, i32 0
%.tmp3001 = call i32(i8*,i8*) @strcmp(i8* %.tmp2998, i8* %.tmp3000)
%.tmp3002 = icmp eq i32 %.tmp3001, 0
br i1 %.tmp3002, label %.if.true.3003, label %.if.false.3003
.if.true.3003:
%.tmp3004 = load i8*, i8** %mangled_name
%.tmp3006 = getelementptr [5 x i8], [5 x i8]*@.str3005, i32 0, i32 0
%.tmp3007 = call i32(i8*,i8*) @strcmp(i8* %.tmp3004, i8* %.tmp3006)
%.tmp3008 = icmp ne i32 %.tmp3007, 0
br i1 %.tmp3008, label %.if.true.3009, label %.if.false.3009
.if.true.3009:
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%swap_var = alloca i8*
store i8* null, i8** %swap_var
%.tmp3011 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp3012 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3011, i32 0, i32 3
%.tmp3013 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3012
%tp = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3013, %m1811$.Type.type** %tp
br label %.for.start.3010
.for.start.3010:
%.tmp3014 = load %m1811$.Type.type*, %m1811$.Type.type** %tp
%.tmp3015 = icmp ne %m1811$.Type.type* %.tmp3014, null
br i1 %.tmp3015, label %.for.continue.3010, label %.for.end.3010
.for.continue.3010:
%.tmp3016 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3018 = getelementptr [6 x i8], [6 x i8]*@.str3017, i32 0, i32 0
%.tmp3019 = load i8*, i8** %mangled_name
%.tmp3020 = load %m1811$.Type.type*, %m1811$.Type.type** %tp
%.tmp3021 = call i8*(%m1811$.Type.type*) @m1811$type_abbr.cp.m1811$.Type.typep(%m1811$.Type.type* %.tmp3020)
%.tmp3022 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3016, i8* %.tmp3018, i8* %.tmp3019, i8* %.tmp3021)
%.tmp3023 = load i8*, i8** %tmp_buff
store i8* %.tmp3023, i8** %swap_var
%.tmp3024 = load i8*, i8** %mangled_name
store i8* %.tmp3024, i8** %tmp_buff
%.tmp3025 = load i8*, i8** %swap_var
store i8* %.tmp3025, i8** %mangled_name
%.tmp3026 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp3026)
%.tmp3027 = load %m1811$.Type.type*, %m1811$.Type.type** %tp
%.tmp3028 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3027, i32 0, i32 4
%.tmp3029 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3028
store %m1811$.Type.type* %.tmp3029, %m1811$.Type.type** %tp
br label %.for.start.3010
.for.end.3010:
br label %.if.end.3009
.if.false.3009:
br label %.if.end.3009
.if.end.3009:
br label %.if.end.3003
.if.false.3003:
br label %.if.end.3003
.if.end.3003:
%.tmp3030 = load i8*, i8** %mangled_name
ret i8* %.tmp3030
}
define void @m1811$compile_statement.v.m1811$.CompilerCtx.typep.m286$.Node.typep.b(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* null, %m1811$.AssignableInfo.type** %info
%return_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %return_type
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp3031 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3032 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3031, i32 0, i32 0
%.tmp3033 = load i8*, i8** %.tmp3032
%.tmp3035 = getelementptr [3 x i8], [3 x i8]*@.str3034, i32 0, i32 0
%.tmp3036 = call i32(i8*,i8*) @strcmp(i8* %.tmp3033, i8* %.tmp3035)
%.tmp3037 = icmp eq i32 %.tmp3036, 0
br i1 %.tmp3037, label %.if.true.3038, label %.if.false.3038
.if.true.3038:
ret void
br label %.if.end.3038
.if.false.3038:
%.tmp3039 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3040 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3039, i32 0, i32 0
%.tmp3041 = load i8*, i8** %.tmp3040
%.tmp3043 = getelementptr [7 x i8], [7 x i8]*@.str3042, i32 0, i32 0
%.tmp3044 = call i32(i8*,i8*) @strcmp(i8* %.tmp3041, i8* %.tmp3043)
%.tmp3045 = icmp eq i32 %.tmp3044, 0
br i1 %.tmp3045, label %.if.true.3046, label %.if.false.3046
.if.true.3046:
%.tmp3047 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3047, i32 0, i32 6
%.tmp3049 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3048
%.tmp3051 = getelementptr [11 x i8], [11 x i8]*@.str3050, i32 0, i32 0
%.tmp3052 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3049, i8* %.tmp3051)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3052, %m286$.Node.type** %assignable
%.tmp3053 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3054 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp3055 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3053, %m286$.Node.type* %.tmp3054)
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3055, %m1811$.AssignableInfo.type** %a_info
%.tmp3056 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3057 = icmp eq %m1811$.AssignableInfo.type* %.tmp3056, null
br i1 %.tmp3057, label %.if.true.3058, label %.if.false.3058
.if.true.3058:
ret void
br label %.if.end.3058
.if.false.3058:
br label %.if.end.3058
.if.end.3058:
%.tmp3059 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3060 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3059)
store %m1811$.AssignableInfo.type* %.tmp3060, %m1811$.AssignableInfo.type** %info
%.tmp3061 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3062 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3061, i32 0, i32 6
%.tmp3063 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3062
%.tmp3064 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3063, i32 0, i32 7
%.tmp3065 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3064
%.tmp3066 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3065, i32 0, i32 1
%.tmp3067 = load i8*, i8** %.tmp3066
%global_name = alloca i8*
store i8* %.tmp3067, i8** %global_name
%.tmp3068 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3069 = load i8, i8* @SCOPE_GLOBAL
%.tmp3070 = load i8*, i8** %global_name
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3068, i8 %.tmp3069, i8* %.tmp3070)
%.tmp3071 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3072 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3071, i32 0, i32 3
%.tmp3073 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3074 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3073, i32 0, i32 3
%.tmp3075 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3074
store %m1811$.Type.type* %.tmp3075, %m1811$.Type.type** %.tmp3072
%.tmp3076 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3077 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3076, i32 0, i32 2
%.tmp3079 = getelementptr [9 x i8], [9 x i8]*@.str3078, i32 0, i32 0
store i8* %.tmp3079, i8** %.tmp3077
%.tmp3080 = load i1, i1* %shallow
%.tmp3081 = icmp eq i1 %.tmp3080, 1
br i1 %.tmp3081, label %.if.true.3082, label %.if.false.3082
.if.true.3082:
%.tmp3083 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3084 = load i8*, i8** %global_name
%.tmp3085 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3083, i8* %.tmp3084, %m1811$.AssignableInfo.type* %.tmp3085)
br label %.if.end.3082
.if.false.3082:
%.tmp3086 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3087 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3086, i32 0, i32 1
%.tmp3088 = load %m0$.File.type*, %m0$.File.type** %.tmp3087
%.tmp3090 = getelementptr [21 x i8], [21 x i8]*@.str3089, i32 0, i32 0
%.tmp3091 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3092 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3091)
%.tmp3093 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3094 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3095 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3094, i32 0, i32 3
%.tmp3096 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3095
%.tmp3097 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3093, %m1811$.Type.type* %.tmp3096)
%.tmp3098 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3099 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3098)
%.tmp3100 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3088, i8* %.tmp3090, i8* %.tmp3092, i8* %.tmp3097, i8* %.tmp3099)
br label %.if.end.3082
.if.end.3082:
br label %.if.end.3046
.if.false.3046:
%.tmp3101 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3102 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3101, i32 0, i32 0
%.tmp3103 = load i8*, i8** %.tmp3102
%.tmp3105 = getelementptr [10 x i8], [10 x i8]*@.str3104, i32 0, i32 0
%.tmp3106 = call i32(i8*,i8*) @strcmp(i8* %.tmp3103, i8* %.tmp3105)
%.tmp3107 = icmp eq i32 %.tmp3106, 0
br i1 %.tmp3107, label %.if.true.3108, label %.if.false.3108
.if.true.3108:
%.tmp3109 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3110 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3109, i32 0, i32 6
%.tmp3111 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3110
%.tmp3112 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3111, i32 0, i32 7
%.tmp3113 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3112
%.tmp3114 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3113, i32 0, i32 1
%.tmp3115 = load i8*, i8** %.tmp3114
%type_name = alloca i8*
store i8* %.tmp3115, i8** %type_name
%.tmp3116 = load i1, i1* %shallow
%.tmp3117 = icmp eq i1 %.tmp3116, 1
br i1 %.tmp3117, label %.if.true.3118, label %.if.false.3118
.if.true.3118:
%.tmp3119 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3120 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3119)
store %m1811$.AssignableInfo.type* %.tmp3120, %m1811$.AssignableInfo.type** %info
%.tmp3121 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3122 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3121)
%mod_from = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp3122, %m1811$.ModuleLookup.type** %mod_from
%.tmp3123 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3125 = getelementptr [11 x i8], [11 x i8]*@.str3124, i32 0, i32 0
%.tmp3126 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod_from
%.tmp3127 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3126, i32 0, i32 1
%.tmp3128 = load i8*, i8** %.tmp3127
%.tmp3129 = load i8*, i8** %type_name
%.tmp3130 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3123, i8* %.tmp3125, i8* %.tmp3128, i8* %.tmp3129)
%.tmp3131 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3132 = load i8, i8* @SCOPE_LOCAL
%.tmp3133 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3131, i8 %.tmp3132, i8* %.tmp3133)
%.tmp3134 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3135 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3134, i32 0, i32 2
%.tmp3137 = getelementptr [10 x i8], [10 x i8]*@.str3136, i32 0, i32 0
store i8* %.tmp3137, i8** %.tmp3135
%.tmp3138 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3139 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3138, i32 0, i32 4
%.tmp3140 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3141 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3140, i32 0, i32 3
%.tmp3142 = load i32, i32* %.tmp3141
store i32 %.tmp3142, i32* %.tmp3139
%.tmp3143 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3144 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3143, i32 0, i32 5
%.tmp3145 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3146 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3145, i32 0, i32 4
%.tmp3147 = load i32, i32* %.tmp3146
store i32 %.tmp3147, i32* %.tmp3144
%.tmp3148 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3149 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3148, i32 0, i32 3
%.tmp3150 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3150, %m1811$.Type.type** %.tmp3149
%.tmp3151 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3152 = load i8*, i8** %type_name
%.tmp3153 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3151, i8* %.tmp3152, %m1811$.AssignableInfo.type* %.tmp3153)
%.tmp3154 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3155 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3154, i32 0, i32 6
%.tmp3156 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3155
%.tmp3158 = getelementptr [5 x i8], [5 x i8]*@.str3157, i32 0, i32 0
%.tmp3159 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3156, i8* %.tmp3158)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3159, %m286$.Node.type** %type_decl
%.tmp3160 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3161 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp3162 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3161, i32 0, i32 6
%.tmp3163 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3162
%.tmp3164 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3160, %m286$.Node.type* %.tmp3163)
%type_struct = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3164, %m1811$.Type.type** %type_struct
%.tmp3165 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3166 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3165, i32 0, i32 3
%.tmp3167 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3166
%.tmp3168 = load %m1811$.Type.type*, %m1811$.Type.type** %type_struct
call void(%m1811$.Type.type*,%m1811$.Type.type*) @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp3167, %m1811$.Type.type* %.tmp3168)
%.tmp3169 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3170 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3169, i32 0, i32 3
%.tmp3171 = load %m1811$.Type.type*, %m1811$.Type.type** %type_struct
store %m1811$.Type.type* %.tmp3171, %m1811$.Type.type** %.tmp3170
br label %.if.end.3118
.if.false.3118:
%.tmp3172 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3173 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3174 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3173, i32 0, i32 6
%.tmp3175 = load i8*, i8** %.tmp3174
%.tmp3176 = load i8*, i8** %type_name
%.tmp3177 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp3172, i8* %.tmp3175, i8* %.tmp3176)
%scope = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp3177, %m1811$.ScopeItem.type** %scope
%.tmp3178 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope
%.tmp3179 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp3178, i32 0, i32 1
%.tmp3180 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp3179
store %m1811$.AssignableInfo.type* %.tmp3180, %m1811$.AssignableInfo.type** %info
%.tmp3181 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3182 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3181, i32 0, i32 1
%.tmp3183 = load %m0$.File.type*, %m0$.File.type** %.tmp3182
%.tmp3185 = getelementptr [14 x i8], [14 x i8]*@.str3184, i32 0, i32 0
%.tmp3186 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3187 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3186)
%.tmp3188 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3189 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3190 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3189, i32 0, i32 3
%.tmp3191 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3190
%.tmp3192 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3188, %m1811$.Type.type* %.tmp3191)
%.tmp3193 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3183, i8* %.tmp3185, i8* %.tmp3187, i8* %.tmp3192)
br label %.if.end.3118
.if.end.3118:
br label %.if.end.3108
.if.false.3108:
%.tmp3194 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3195 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3194, i32 0, i32 0
%.tmp3196 = load i8*, i8** %.tmp3195
%.tmp3198 = getelementptr [7 x i8], [7 x i8]*@.str3197, i32 0, i32 0
%.tmp3199 = call i32(i8*,i8*) @strcmp(i8* %.tmp3196, i8* %.tmp3198)
%.tmp3200 = icmp eq i32 %.tmp3199, 0
br i1 %.tmp3200, label %.if.true.3201, label %.if.false.3201
.if.true.3201:
%.tmp3202 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3203 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3202)
store %m1811$.AssignableInfo.type* %.tmp3203, %m1811$.AssignableInfo.type** %info
%.tmp3204 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3205 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3204, i32 0, i32 3
%.tmp3206 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3207 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3208 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3207, i32 0, i32 6
%.tmp3209 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3208
%.tmp3210 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3209, i32 0, i32 7
%.tmp3211 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3210
%.tmp3212 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$syn_function_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3206, %m286$.Node.type* %.tmp3211)
store %m1811$.Type.type* %.tmp3212, %m1811$.Type.type** %.tmp3205
%.tmp3213 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3214 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3213, i32 0, i32 2
%.tmp3216 = getelementptr [7 x i8], [7 x i8]*@.str3215, i32 0, i32 0
store i8* %.tmp3216, i8** %.tmp3214
%.tmp3217 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3218 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3217, i32 0, i32 6
%.tmp3219 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3218
%.tmp3220 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3219, i32 0, i32 7
%.tmp3221 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3220
%.tmp3222 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3221, i32 0, i32 7
%.tmp3223 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3222
%.tmp3224 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3223, i32 0, i32 1
%.tmp3225 = load i8*, i8** %.tmp3224
%fn_name = alloca i8*
store i8* %.tmp3225, i8** %fn_name
%.tmp3226 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3227 = load i8, i8* @SCOPE_GLOBAL
%.tmp3228 = load i8*, i8** %fn_name
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3226, i8 %.tmp3227, i8* %.tmp3228)
%.tmp3229 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3229, %m1811$.Type.type** %return_type
%.tmp3230 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3231 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3230, i32 0, i32 0
%.tmp3232 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3233 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3232, i32 0, i32 3
%.tmp3234 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3233
%.tmp3235 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3234, i32 0, i32 3
%.tmp3236 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3235
%.tmp3237 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3236, i32 0, i32 0
%.tmp3238 = load i8*, i8** %.tmp3237
store i8* %.tmp3238, i8** %.tmp3231
%.tmp3239 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3240 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3239, i32 0, i32 3
%.tmp3241 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3242 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3241, i32 0, i32 3
%.tmp3243 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3242
%.tmp3244 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3243, i32 0, i32 3
%.tmp3245 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3244
%.tmp3246 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3245, i32 0, i32 3
%.tmp3247 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3246
store %m1811$.Type.type* %.tmp3247, %m1811$.Type.type** %.tmp3240
%.tmp3248 = load i1, i1* %shallow
%.tmp3249 = icmp eq i1 %.tmp3248, 0
br i1 %.tmp3249, label %.if.true.3250, label %.if.false.3250
.if.true.3250:
%.tmp3251 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3252 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3251, i32 0, i32 1
%.tmp3253 = load %m0$.File.type*, %m0$.File.type** %.tmp3252
%.tmp3255 = getelementptr [15 x i8], [15 x i8]*@.str3254, i32 0, i32 0
%.tmp3256 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3257 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3258 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3256, %m1811$.Type.type* %.tmp3257)
%.tmp3259 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3260 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3259)
%.tmp3261 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3253, i8* %.tmp3255, i8* %.tmp3258, i8* %.tmp3260)
%.tmp3263 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3264 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3263, i32 0, i32 3
%.tmp3265 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3264
%.tmp3266 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3265, i32 0, i32 3
%.tmp3267 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3266
%.tmp3268 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3267, i32 0, i32 4
%.tmp3269 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3268
%pt = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3269, %m1811$.Type.type** %pt
br label %.for.start.3262
.for.start.3262:
%.tmp3270 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3271 = icmp ne %m1811$.Type.type* %.tmp3270, null
br i1 %.tmp3271, label %.for.continue.3262, label %.for.end.3262
.for.continue.3262:
%.tmp3272 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3273 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3274 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3273, i32 0, i32 3
%.tmp3275 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3274
%.tmp3276 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3275, i32 0, i32 3
%.tmp3277 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3276
%.tmp3278 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3277, i32 0, i32 4
%.tmp3279 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3278
%.tmp3280 = icmp ne %m1811$.Type.type* %.tmp3272, %.tmp3279
br i1 %.tmp3280, label %.if.true.3281, label %.if.false.3281
.if.true.3281:
%.tmp3282 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3283 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3282, i32 0, i32 1
%.tmp3284 = load %m0$.File.type*, %m0$.File.type** %.tmp3283
%.tmp3286 = getelementptr [3 x i8], [3 x i8]*@.str3285, i32 0, i32 0
%.tmp3287 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3284, i8* %.tmp3286)
br label %.if.end.3281
.if.false.3281:
br label %.if.end.3281
.if.end.3281:
%.tmp3288 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3289 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3288, i32 0, i32 1
%.tmp3290 = load %m0$.File.type*, %m0$.File.type** %.tmp3289
%.tmp3292 = getelementptr [3 x i8], [3 x i8]*@.str3291, i32 0, i32 0
%.tmp3293 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3294 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3295 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3293, %m1811$.Type.type* %.tmp3294)
%.tmp3296 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3290, i8* %.tmp3292, i8* %.tmp3295)
%.tmp3297 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3298 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3297, i32 0, i32 4
%.tmp3299 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3298
store %m1811$.Type.type* %.tmp3299, %m1811$.Type.type** %pt
br label %.for.start.3262
.for.end.3262:
%.tmp3300 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3301 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3300, i32 0, i32 1
%.tmp3302 = load %m0$.File.type*, %m0$.File.type** %.tmp3301
%.tmp3304 = getelementptr [3 x i8], [3 x i8]*@.str3303, i32 0, i32 0
%.tmp3305 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3302, i8* %.tmp3304)
%.tmp3306 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3307 = bitcast %m1811$.Type.type* %.tmp3306 to i8*
call void(i8*) @free(i8* %.tmp3307)
br label %.if.end.3250
.if.false.3250:
%.tmp3308 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3309 = load i8*, i8** %fn_name
%.tmp3310 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3308, i8* %.tmp3309, %m1811$.AssignableInfo.type* %.tmp3310)
br label %.if.end.3250
.if.end.3250:
br label %.if.end.3201
.if.false.3201:
%.tmp3311 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3312 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3311, i32 0, i32 0
%.tmp3313 = load i8*, i8** %.tmp3312
%.tmp3315 = getelementptr [9 x i8], [9 x i8]*@.str3314, i32 0, i32 0
%.tmp3316 = call i32(i8*,i8*) @strcmp(i8* %.tmp3313, i8* %.tmp3315)
%.tmp3317 = icmp eq i32 %.tmp3316, 0
br i1 %.tmp3317, label %.if.true.3318, label %.if.false.3318
.if.true.3318:
%.tmp3319 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3320 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3319)
store %m1811$.AssignableInfo.type* %.tmp3320, %m1811$.AssignableInfo.type** %info
%.tmp3321 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3322 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3321, i32 0, i32 2
%.tmp3324 = getelementptr [9 x i8], [9 x i8]*@.str3323, i32 0, i32 0
store i8* %.tmp3324, i8** %.tmp3322
%.tmp3325 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3326 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3325, i32 0, i32 3
%.tmp3327 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3328 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3329 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3328, i32 0, i32 6
%.tmp3330 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3329
%.tmp3331 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$syn_function_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3327, %m286$.Node.type* %.tmp3330)
store %m1811$.Type.type* %.tmp3331, %m1811$.Type.type** %.tmp3326
%.tmp3332 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3333 = call i8*(%m286$.Node.type*) @m1811$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3332)
%name = alloca i8*
store i8* %.tmp3333, i8** %name
%.tmp3334 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3335 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3336 = load i8*, i8** %name
%.tmp3337 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3338 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3337, i32 0, i32 3
%.tmp3339 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3338
%.tmp3340 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1811$.Type.type*) @m1811$name_mangle.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3334, %m286$.Node.type* %.tmp3335, i8* %.tmp3336, %m1811$.Type.type* %.tmp3339)
store i8* %.tmp3340, i8** %tmp_buff
%.tmp3341 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3342 = load i8, i8* @SCOPE_GLOBAL
%.tmp3343 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3341, i8 %.tmp3342, i8* %.tmp3343)
%.tmp3344 = load i1, i1* %shallow
%.tmp3345 = icmp eq i1 %.tmp3344, 1
br i1 %.tmp3345, label %.if.true.3346, label %.if.false.3346
.if.true.3346:
%.tmp3347 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3348 = load i8*, i8** %name
%.tmp3349 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3347, i8* %.tmp3348, %m1811$.AssignableInfo.type* %.tmp3349)
br label %.if.end.3346
.if.false.3346:
%.tmp3350 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3350, %m1811$.Type.type** %return_type
%.tmp3351 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3352 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3353 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3352, i32 0, i32 3
%.tmp3354 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3353
%.tmp3355 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3354, i32 0, i32 3
%.tmp3356 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3355
call void(%m1811$.Type.type*,%m1811$.Type.type*) @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp3351, %m1811$.Type.type* %.tmp3356)
%.tmp3357 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3358 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3357, i32 0, i32 1
%.tmp3359 = load %m0$.File.type*, %m0$.File.type** %.tmp3358
%.tmp3361 = getelementptr [14 x i8], [14 x i8]*@.str3360, i32 0, i32 0
%.tmp3362 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3363 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3364 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3362, %m1811$.Type.type* %.tmp3363)
%.tmp3365 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3366 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3365)
%.tmp3367 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3359, i8* %.tmp3361, i8* %.tmp3364, i8* %.tmp3366)
%.tmp3368 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3369 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3368, i32 0, i32 6
%.tmp3370 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3369
%.tmp3371 = call %m286$.Node.type*(%m286$.Node.type*) @m1811$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3370)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3371, %m286$.Node.type** %params
%param_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %param_type
%.tmp3373 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3373, %m286$.Node.type** %param_ptr
br label %.for.start.3372
.for.start.3372:
%.tmp3374 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3375 = icmp ne %m286$.Node.type* %.tmp3374, null
br i1 %.tmp3375, label %.for.continue.3372, label %.for.end.3372
.for.continue.3372:
%.tmp3376 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3377 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp3378 = icmp ne %m286$.Node.type* %.tmp3376, %.tmp3377
br i1 %.tmp3378, label %.if.true.3379, label %.if.false.3379
.if.true.3379:
%.tmp3380 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3381 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3380, i32 0, i32 7
%.tmp3382 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3381
store %m286$.Node.type* %.tmp3382, %m286$.Node.type** %param_ptr
%.tmp3383 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3384 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3383, i32 0, i32 1
%.tmp3385 = load %m0$.File.type*, %m0$.File.type** %.tmp3384
%.tmp3387 = getelementptr [3 x i8], [3 x i8]*@.str3386, i32 0, i32 0
%.tmp3388 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3385, i8* %.tmp3387)
br label %.if.end.3379
.if.false.3379:
br label %.if.end.3379
.if.end.3379:
%.tmp3389 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3390 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3389, i32 0, i32 0
%.tmp3391 = load i8*, i8** %.tmp3390
%.tmp3393 = getelementptr [5 x i8], [5 x i8]*@.str3392, i32 0, i32 0
%.tmp3394 = call i32(i8*,i8*) @strcmp(i8* %.tmp3391, i8* %.tmp3393)
%.tmp3395 = icmp eq i32 %.tmp3394, 0
br i1 %.tmp3395, label %.if.true.3396, label %.if.false.3396
.if.true.3396:
%.tmp3397 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3398 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3399 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3398, i32 0, i32 6
%.tmp3400 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3399
%.tmp3401 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3397, %m286$.Node.type* %.tmp3400)
store %m1811$.Type.type* %.tmp3401, %m1811$.Type.type** %param_type
%.tmp3402 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3403 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3402, i32 0, i32 7
%.tmp3404 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3403
store %m286$.Node.type* %.tmp3404, %m286$.Node.type** %param_ptr
br label %.if.end.3396
.if.false.3396:
br label %.if.end.3396
.if.end.3396:
%.tmp3405 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3406 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3405, i32 0, i32 1
%.tmp3407 = load %m0$.File.type*, %m0$.File.type** %.tmp3406
%.tmp3409 = getelementptr [13 x i8], [13 x i8]*@.str3408, i32 0, i32 0
%.tmp3410 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3411 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
%.tmp3412 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3410, %m1811$.Type.type* %.tmp3411)
%.tmp3413 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3414 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3413, i32 0, i32 1
%.tmp3415 = load i8*, i8** %.tmp3414
%.tmp3416 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3407, i8* %.tmp3409, i8* %.tmp3412, i8* %.tmp3415)
%.tmp3417 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3418 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3417, i32 0, i32 7
%.tmp3419 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3418
store %m286$.Node.type* %.tmp3419, %m286$.Node.type** %param_ptr
br label %.for.start.3372
.for.end.3372:
%.tmp3420 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3421 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3420, i32 0, i32 1
%.tmp3422 = load %m0$.File.type*, %m0$.File.type** %.tmp3421
%.tmp3424 = getelementptr [5 x i8], [5 x i8]*@.str3423, i32 0, i32 0
%.tmp3425 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3422, i8* %.tmp3424)
%.tmp3426 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3428 = getelementptr [9 x i8], [9 x i8]*@.str3427, i32 0, i32 0
%.tmp3429 = bitcast ptr null to i8*
%.tmp3430 = bitcast ptr null to i8*
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp3426, i8* %.tmp3428, i8* %.tmp3429, i8* %.tmp3430)
%.tmp3431 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3432 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_fn_params.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3431, %m286$.Node.type* %.tmp3432)
%.tmp3433 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3434 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3433, i32 0, i32 6
%.tmp3435 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3434
%.tmp3437 = getelementptr [6 x i8], [6 x i8]*@.str3436, i32 0, i32 0
%.tmp3438 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3435, i8* %.tmp3437)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3438, %m286$.Node.type** %fn_block
%.tmp3439 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3440 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3439, %m286$.Node.type* %.tmp3440)
%.tmp3441 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3441)
%.tmp3442 = bitcast ptr null to %m286$.Node.type*
%last_valid_instruction = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3442, %m286$.Node.type** %last_valid_instruction
%.tmp3444 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3445 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3444, i32 0, i32 6
%.tmp3446 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3445
%ci = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3446, %m286$.Node.type** %ci
br label %.for.start.3443
.for.start.3443:
%.tmp3447 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3448 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3447, i32 0, i32 7
%.tmp3449 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3448
%.tmp3450 = icmp ne %m286$.Node.type* %.tmp3449, null
br i1 %.tmp3450, label %.for.continue.3443, label %.for.end.3443
.for.continue.3443:
%.tmp3451 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3452 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3451, i32 0, i32 0
%.tmp3453 = load i8*, i8** %.tmp3452
%.tmp3455 = getelementptr [3 x i8], [3 x i8]*@.str3454, i32 0, i32 0
%.tmp3456 = call i32(i8*,i8*) @strcmp(i8* %.tmp3453, i8* %.tmp3455)
%.tmp3457 = icmp ne i32 %.tmp3456, 0
%.tmp3458 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3459 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3458, i32 0, i32 0
%.tmp3460 = load i8*, i8** %.tmp3459
%.tmp3462 = getelementptr [9 x i8], [9 x i8]*@.str3461, i32 0, i32 0
%.tmp3463 = call i32(i8*,i8*) @strcmp(i8* %.tmp3460, i8* %.tmp3462)
%.tmp3464 = icmp ne i32 %.tmp3463, 0
%.tmp3465 = and i1 %.tmp3457, %.tmp3464
br i1 %.tmp3465, label %.if.true.3466, label %.if.false.3466
.if.true.3466:
%.tmp3467 = load %m286$.Node.type*, %m286$.Node.type** %ci
store %m286$.Node.type* %.tmp3467, %m286$.Node.type** %last_valid_instruction
br label %.if.end.3466
.if.false.3466:
br label %.if.end.3466
.if.end.3466:
%.tmp3468 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3469 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3468, i32 0, i32 7
%.tmp3470 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3469
store %m286$.Node.type* %.tmp3470, %m286$.Node.type** %ci
br label %.for.start.3443
.for.end.3443:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3471 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3472 = icmp eq %m286$.Node.type* %.tmp3471, null
br i1 %.tmp3472, label %.if.true.3473, label %.if.false.3473
.if.true.3473:
store i1 1, i1* %add_implicit_return
br label %.if.end.3473
.if.false.3473:
%.tmp3474 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3475 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3474, i32 0, i32 6
%.tmp3476 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3475
%.tmp3477 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3476, i32 0, i32 0
%.tmp3478 = load i8*, i8** %.tmp3477
%.tmp3480 = getelementptr [7 x i8], [7 x i8]*@.str3479, i32 0, i32 0
%.tmp3481 = call i32(i8*,i8*) @strcmp(i8* %.tmp3478, i8* %.tmp3480)
%.tmp3482 = icmp ne i32 %.tmp3481, 0
br i1 %.tmp3482, label %.if.true.3483, label %.if.false.3483
.if.true.3483:
store i1 1, i1* %add_implicit_return
br label %.if.end.3483
.if.false.3483:
br label %.if.end.3483
.if.end.3483:
br label %.if.end.3473
.if.end.3473:
%.tmp3484 = load i1, i1* %add_implicit_return
br i1 %.tmp3484, label %.if.true.3485, label %.if.false.3485
.if.true.3485:
%.tmp3486 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3487 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3488 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3486, %m1811$.Type.type* %.tmp3487)
%.tmp3490 = getelementptr [5 x i8], [5 x i8]*@.str3489, i32 0, i32 0
%.tmp3491 = call i32(i8*,i8*) @strcmp(i8* %.tmp3488, i8* %.tmp3490)
%.tmp3492 = icmp ne i32 %.tmp3491, 0
br i1 %.tmp3492, label %.if.true.3493, label %.if.false.3493
.if.true.3493:
%.tmp3494 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3495 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3497 = getelementptr [21 x i8], [21 x i8]*@.str3496, i32 0, i32 0
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3494, %m286$.Node.type* %.tmp3495, i8* %.tmp3497)
br label %.if.end.3493
.if.false.3493:
%.tmp3498 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3499 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3498, i32 0, i32 1
%.tmp3500 = load %m0$.File.type*, %m0$.File.type** %.tmp3499
%.tmp3502 = getelementptr [10 x i8], [10 x i8]*@.str3501, i32 0, i32 0
%.tmp3503 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3500, i8* %.tmp3502)
br label %.if.end.3493
.if.end.3493:
br label %.if.end.3485
.if.false.3485:
br label %.if.end.3485
.if.end.3485:
%.tmp3504 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3505 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3504, i32 0, i32 1
%.tmp3506 = load %m0$.File.type*, %m0$.File.type** %.tmp3505
%.tmp3508 = getelementptr [3 x i8], [3 x i8]*@.str3507, i32 0, i32 0
%.tmp3509 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3506, i8* %.tmp3508)
br label %.if.end.3346
.if.end.3346:
br label %.if.end.3318
.if.false.3318:
%.tmp3510 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3511 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3510, i32 0, i32 0
%.tmp3512 = load i8*, i8** %.tmp3511
%.tmp3514 = getelementptr [7 x i8], [7 x i8]*@.str3513, i32 0, i32 0
%.tmp3515 = call i32(i8*,i8*) @strcmp(i8* %.tmp3512, i8* %.tmp3514)
%.tmp3516 = icmp eq i32 %.tmp3515, 0
br i1 %.tmp3516, label %.if.true.3517, label %.if.false.3517
.if.true.3517:
%.tmp3518 = load i1, i1* %shallow
%.tmp3519 = icmp eq i1 %.tmp3518, 1
br i1 %.tmp3519, label %.if.true.3520, label %.if.false.3520
.if.true.3520:
%.tmp3521 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3522 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3521, i32 0, i32 6
%.tmp3523 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3522
%.tmp3524 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3523, i32 0, i32 7
%.tmp3525 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3524
%.tmp3526 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3525, i32 0, i32 1
%.tmp3527 = load i8*, i8** %.tmp3526
%mod_name = alloca i8*
store i8* %.tmp3527, i8** %mod_name
%.tmp3528 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3529 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3528, i32 0, i32 6
%.tmp3530 = load i8*, i8** %.tmp3529
%mod_abspath = alloca i8*
store i8* %.tmp3530, i8** %mod_abspath
%.tmp3531 = load i8*, i8** %mod_abspath
%.tmp3532 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3531)
%dirname = alloca i8*
store i8* %.tmp3532, i8** %dirname
%.tmp3533 = load i8*, i8** %mod_name
%.tmp3534 = call i32(i8*) @strlen(i8* %.tmp3533)
%mod_name_len = alloca i32
store i32 %.tmp3534, i32* %mod_name_len
%.tmp3535 = load i32, i32* %mod_name_len
%.tmp3536 = sub i32 %.tmp3535, 1
%.tmp3537 = call i8*(i32) @malloc(i32 %.tmp3536)
%trimmed_name = alloca i8*
store i8* %.tmp3537, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3538
.for.start.3538:
%.tmp3539 = load i32, i32* %i
%.tmp3540 = load i32, i32* %mod_name_len
%.tmp3541 = sub i32 %.tmp3540, 1
%.tmp3542 = icmp slt i32 %.tmp3539, %.tmp3541
br i1 %.tmp3542, label %.for.continue.3538, label %.for.end.3538
.for.continue.3538:
%.tmp3543 = load i32, i32* %i
%.tmp3544 = sub i32 %.tmp3543, 1
%.tmp3545 = load i8*, i8** %trimmed_name
%.tmp3546 = getelementptr i8, i8* %.tmp3545, i32 %.tmp3544
%.tmp3547 = load i32, i32* %i
%.tmp3548 = load i8*, i8** %mod_name
%.tmp3549 = getelementptr i8, i8* %.tmp3548, i32 %.tmp3547
%.tmp3550 = load i8, i8* %.tmp3549
store i8 %.tmp3550, i8* %.tmp3546
%.tmp3551 = load i32, i32* %i
%.tmp3552 = add i32 %.tmp3551, 1
store i32 %.tmp3552, i32* %i
br label %.for.start.3538
.for.end.3538:
%.tmp3553 = load i32, i32* %mod_name_len
%.tmp3554 = sub i32 %.tmp3553, 2
%.tmp3555 = load i8*, i8** %trimmed_name
%.tmp3556 = getelementptr i8, i8* %.tmp3555, i32 %.tmp3554
store i8 0, i8* %.tmp3556
%.tmp3557 = load i8*, i8** %dirname
%.tmp3559 = getelementptr [1 x i8], [1 x i8]*@.str3558, i32 0, i32 0
%.tmp3560 = call i32(i8*,i8*) @strcmp(i8* %.tmp3557, i8* %.tmp3559)
%.tmp3561 = icmp eq i32 %.tmp3560, 0
br i1 %.tmp3561, label %.if.true.3562, label %.if.false.3562
.if.true.3562:
%.tmp3563 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3565 = getelementptr [6 x i8], [6 x i8]*@.str3564, i32 0, i32 0
%.tmp3566 = load i8*, i8** %trimmed_name
%.tmp3567 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3563, i8* %.tmp3565, i8* %.tmp3566)
br label %.if.end.3562
.if.false.3562:
%.tmp3568 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3570 = getelementptr [9 x i8], [9 x i8]*@.str3569, i32 0, i32 0
%.tmp3571 = load i8*, i8** %dirname
%.tmp3572 = load i8*, i8** %trimmed_name
%.tmp3573 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3568, i8* %.tmp3570, i8* %.tmp3571, i8* %.tmp3572)
br label %.if.end.3562
.if.end.3562:
%.tmp3574 = load i8*, i8** %mod_abspath
%.tmp3575 = call i8*(i32) @malloc(i32 4096)
%.tmp3576 = call i8*(i8*,i8*) @realpath(i8* %.tmp3574, i8* %.tmp3575)
store i8* %.tmp3576, i8** %mod_abspath
%.tmp3577 = load i8*, i8** %mod_abspath
%.tmp3578 = icmp eq i8* %.tmp3577, null
br i1 %.tmp3578, label %.if.true.3579, label %.if.false.3579
.if.true.3579:
%.tmp3580 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3582 = getelementptr [60 x i8], [60 x i8]*@.str3581, i32 0, i32 0
%.tmp3583 = load i8*, i8** %mod_name
%.tmp3584 = load i8*, i8** %dirname
%.tmp3585 = load i8*, i8** %trimmed_name
%.tmp3586 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3580, i8* %.tmp3582, i8* %.tmp3583, i8* %.tmp3584, i8* %.tmp3585)
%.tmp3587 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3588 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3589 = load i8*, i8** %err_buf
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3587, %m286$.Node.type* %.tmp3588, i8* %.tmp3589)
ret void
br label %.if.end.3579
.if.false.3579:
br label %.if.end.3579
.if.end.3579:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* null, %m1811$.ModuleLookup.type** %m
%.tmp3590 = bitcast ptr null to %m1811$.ModuleLookup.type*
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp3590, %m1811$.ModuleLookup.type** %mod
%.tmp3592 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3593 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3592, i32 0, i32 5
%.tmp3594 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3593
store %m1811$.ModuleLookup.type* %.tmp3594, %m1811$.ModuleLookup.type** %m
br label %.for.start.3591
.for.start.3591:
%.tmp3595 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3596 = icmp ne %m1811$.ModuleLookup.type* %.tmp3595, null
%.tmp3597 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3598 = icmp eq %m1811$.ModuleLookup.type* %.tmp3597, null
%.tmp3599 = and i1 %.tmp3596, %.tmp3598
br i1 %.tmp3599, label %.for.continue.3591, label %.for.end.3591
.for.continue.3591:
%.tmp3600 = load i8*, i8** %mod_abspath
%.tmp3601 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3602 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3601, i32 0, i32 0
%.tmp3603 = load i8*, i8** %.tmp3602
%.tmp3604 = call i32(i8*,i8*) @strcmp(i8* %.tmp3600, i8* %.tmp3603)
%.tmp3605 = icmp eq i32 %.tmp3604, 0
br i1 %.tmp3605, label %.if.true.3606, label %.if.false.3606
.if.true.3606:
%.tmp3607 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
store %m1811$.ModuleLookup.type* %.tmp3607, %m1811$.ModuleLookup.type** %mod
br label %.if.end.3606
.if.false.3606:
br label %.if.end.3606
.if.end.3606:
%.tmp3608 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3609 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3608, i32 0, i32 2
%.tmp3610 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3609
store %m1811$.ModuleLookup.type* %.tmp3610, %m1811$.ModuleLookup.type** %m
br label %.for.start.3591
.for.end.3591:
%.tmp3611 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3612 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3611, i32 0, i32 6
%.tmp3613 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3612
%.tmp3614 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3613, i32 0, i32 7
%.tmp3615 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3614
%.tmp3616 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3615, i32 0, i32 7
%.tmp3617 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3616
%.tmp3618 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3617, i32 0, i32 7
%.tmp3619 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3618
%.tmp3620 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3619, i32 0, i32 1
%.tmp3621 = load i8*, i8** %.tmp3620
%asname = alloca i8*
store i8* %.tmp3621, i8** %asname
%.tmp3622 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3623 = icmp eq %m1811$.ModuleLookup.type* %.tmp3622, null
br i1 %.tmp3623, label %.if.true.3624, label %.if.false.3624
.if.true.3624:
%.tmp3625 = load i32, i32* @ModuleLookup_size
%.tmp3626 = call i8*(i32) @malloc(i32 %.tmp3625)
%.tmp3627 = bitcast i8* %.tmp3626 to %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp3627, %m1811$.ModuleLookup.type** %mod
%.tmp3628 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3629 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3628, i32 0, i32 0
%.tmp3630 = load i8*, i8** %mod_abspath
store i8* %.tmp3630, i8** %.tmp3629
%.tmp3631 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3632 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3631, i32 0, i32 2
store %m1811$.ModuleLookup.type* null, %m1811$.ModuleLookup.type** %.tmp3632
%.tmp3633 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3634 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3633, i32 0, i32 3
store %m1811$.Scope.type* null, %m1811$.Scope.type** %.tmp3634
%.tmp3635 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3636 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3635, i32 0, i32 1
%.tmp3637 = getelementptr i8*, i8** %.tmp3636, i32 0
%.tmp3639 = getelementptr [5 x i8], [5 x i8]*@.str3638, i32 0, i32 0
%.tmp3640 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3641 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3640)
%.tmp3642 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3637, i8* %.tmp3639, i32 %.tmp3641)
%.tmp3644 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3645 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3644, i32 0, i32 5
%.tmp3646 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3645
store %m1811$.ModuleLookup.type* %.tmp3646, %m1811$.ModuleLookup.type** %m
br label %.for.start.3643
.for.start.3643:
%.tmp3647 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3648 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3647, i32 0, i32 2
%.tmp3649 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3648
%.tmp3650 = icmp ne %m1811$.ModuleLookup.type* %.tmp3649, null
br i1 %.tmp3650, label %.for.continue.3643, label %.for.end.3643
.for.continue.3643:
%.tmp3651 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3652 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3651, i32 0, i32 2
%.tmp3653 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3652
store %m1811$.ModuleLookup.type* %.tmp3653, %m1811$.ModuleLookup.type** %m
br label %.for.start.3643
.for.end.3643:
%.tmp3654 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3655 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3654, i32 0, i32 2
%.tmp3656 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
store %m1811$.ModuleLookup.type* %.tmp3656, %m1811$.ModuleLookup.type** %.tmp3655
%.tmp3657 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3658 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3659 = load i8*, i8** %asname
%.tmp3660 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3661 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3660, i32 0, i32 0
%.tmp3662 = load i8*, i8** %.tmp3661
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1811$define_module.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp3657, %m286$.Node.type* %.tmp3658, i8* %.tmp3659, i8* %.tmp3662)
%.tmp3663 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3664 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3663, i32 0, i32 6
%.tmp3665 = load i8*, i8** %.tmp3664
%curr_mod = alloca i8*
store i8* %.tmp3665, i8** %curr_mod
%.tmp3666 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3667 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3666, i32 0, i32 6
%.tmp3668 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3669 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3668, i32 0, i32 0
%.tmp3670 = load i8*, i8** %.tmp3669
store i8* %.tmp3670, i8** %.tmp3667
%.tmp3671 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3672 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3673 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3672, i32 0, i32 0
%.tmp3674 = load i8*, i8** %.tmp3673
%.tmp3675 = call i1(%m1811$.CompilerCtx.type*,i8*) @m1811$compile_file.b.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp3671, i8* %.tmp3674)
%.tmp3676 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3677 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3676, i32 0, i32 6
%.tmp3678 = load i8*, i8** %curr_mod
store i8* %.tmp3678, i8** %.tmp3677
br label %.if.end.3624
.if.false.3624:
%.tmp3679 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3680 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3681 = load i8*, i8** %asname
%.tmp3682 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3683 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3682, i32 0, i32 0
%.tmp3684 = load i8*, i8** %.tmp3683
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1811$define_module.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp3679, %m286$.Node.type* %.tmp3680, i8* %.tmp3681, i8* %.tmp3684)
br label %.if.end.3624
.if.end.3624:
br label %.if.end.3520
.if.false.3520:
br label %.if.end.3520
.if.end.3520:
br label %.if.end.3517
.if.false.3517:
%.tmp3685 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3686 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3688 = getelementptr [40 x i8], [40 x i8]*@.str3687, i32 0, i32 0
%.tmp3689 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3685, %m286$.Node.type* %.tmp3686, i8* %.tmp3688)
%.tmp3690 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3691 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3690, i32 0, i32 0
%.tmp3692 = load i8*, i8** %.tmp3691
%.tmp3693 = call i32(i8*,...) @printf(i8* %.tmp3689, i8* %.tmp3692)
br label %.if.end.3517
.if.end.3517:
br label %.if.end.3318
.if.end.3318:
br label %.if.end.3201
.if.end.3201:
br label %.if.end.3108
.if.end.3108:
br label %.if.end.3046
.if.end.3046:
br label %.if.end.3038
.if.end.3038:
ret void
}
define i8* @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp3694 = getelementptr i8*, i8** %buf, i32 0
%.tmp3696 = getelementptr [31 x i8], [31 x i8]*@.str3695, i32 0, i32 0
%.tmp3697 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3698 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3697, i32 0, i32 6
%.tmp3699 = load i8*, i8** %.tmp3698
%.tmp3700 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3701 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3700, i32 0, i32 3
%.tmp3702 = load i32, i32* %.tmp3701
%.tmp3703 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3704 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3703, i32 0, i32 4
%.tmp3705 = load i32, i32* %.tmp3704
%.tmp3706 = load i8*, i8** %msg
%.tmp3707 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3694, i8* %.tmp3696, i8* %.tmp3699, i32 %.tmp3702, i32 %.tmp3705, i8* %.tmp3706)
%.tmp3708 = load i8*, i8** %buf
ret i8* %.tmp3708
}
define void @m1811$compile_fn_params.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %param_type
%.tmp3710 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3710, %m286$.Node.type** %param_ptr
br label %.for.start.3709
.for.start.3709:
%.tmp3711 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3712 = icmp ne %m286$.Node.type* %.tmp3711, null
br i1 %.tmp3712, label %.for.continue.3709, label %.for.end.3709
.for.continue.3709:
%.tmp3713 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3714 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3715 = icmp ne %m286$.Node.type* %.tmp3713, %.tmp3714
br i1 %.tmp3715, label %.if.true.3716, label %.if.false.3716
.if.true.3716:
%.tmp3717 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3718 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3717, i32 0, i32 7
%.tmp3719 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3718
store %m286$.Node.type* %.tmp3719, %m286$.Node.type** %param_ptr
br label %.if.end.3716
.if.false.3716:
br label %.if.end.3716
.if.end.3716:
%.tmp3720 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3721 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3720)
%param_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3721, %m1811$.AssignableInfo.type** %param_info
%.tmp3722 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3723 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3722, i32 0, i32 2
%.tmp3725 = getelementptr [9 x i8], [9 x i8]*@.str3724, i32 0, i32 0
store i8* %.tmp3725, i8** %.tmp3723
%.tmp3726 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3727 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3726, i32 0, i32 0
%.tmp3728 = load i8*, i8** %.tmp3727
%.tmp3730 = getelementptr [5 x i8], [5 x i8]*@.str3729, i32 0, i32 0
%.tmp3731 = call i32(i8*,i8*) @strcmp(i8* %.tmp3728, i8* %.tmp3730)
%.tmp3732 = icmp eq i32 %.tmp3731, 0
br i1 %.tmp3732, label %.if.true.3733, label %.if.false.3733
.if.true.3733:
%.tmp3734 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3735 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3736 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3735, i32 0, i32 6
%.tmp3737 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3736
%.tmp3738 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3734, %m286$.Node.type* %.tmp3737)
store %m1811$.Type.type* %.tmp3738, %m1811$.Type.type** %param_type
%.tmp3739 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3740 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3739, i32 0, i32 7
%.tmp3741 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3740
store %m286$.Node.type* %.tmp3741, %m286$.Node.type** %param_ptr
br label %.if.end.3733
.if.false.3733:
br label %.if.end.3733
.if.end.3733:
%.tmp3742 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3743 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3742, i32 0, i32 3
%.tmp3744 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
store %m1811$.Type.type* %.tmp3744, %m1811$.Type.type** %.tmp3743
%.tmp3745 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3746 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3745, i32 0, i32 1
%.tmp3747 = load i8*, i8** %.tmp3746
%var_name = alloca i8*
store i8* %.tmp3747, i8** %var_name
%.tmp3748 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3749 = load i8, i8* @SCOPE_LOCAL
%.tmp3750 = load i8*, i8** %var_name
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3748, i8 %.tmp3749, i8* %.tmp3750)
%.tmp3751 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3752 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3753 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3752, i32 0, i32 3
%.tmp3754 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3753
%.tmp3755 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3751, %m1811$.Type.type* %.tmp3754)
%param_info_tr = alloca i8*
store i8* %.tmp3755, i8** %param_info_tr
%.tmp3756 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3757 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3756, i32 0, i32 1
%.tmp3758 = load %m0$.File.type*, %m0$.File.type** %.tmp3757
%.tmp3760 = getelementptr [16 x i8], [16 x i8]*@.str3759, i32 0, i32 0
%.tmp3761 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3762 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3761)
%.tmp3763 = load i8*, i8** %param_info_tr
%.tmp3764 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3758, i8* %.tmp3760, i8* %.tmp3762, i8* %.tmp3763)
%.tmp3765 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3766 = load i8*, i8** %var_name
%.tmp3767 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3765, i8* %.tmp3766, %m1811$.AssignableInfo.type* %.tmp3767)
%.tmp3768 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3769 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3768, i32 0, i32 1
%.tmp3770 = load %m0$.File.type*, %m0$.File.type** %.tmp3769
%.tmp3772 = getelementptr [28 x i8], [28 x i8]*@.str3771, i32 0, i32 0
%.tmp3773 = load i8*, i8** %param_info_tr
%.tmp3774 = load i8*, i8** %var_name
%.tmp3775 = load i8*, i8** %param_info_tr
%.tmp3776 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3777 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3776)
%.tmp3778 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3770, i8* %.tmp3772, i8* %.tmp3773, i8* %.tmp3774, i8* %.tmp3775, i8* %.tmp3777)
%.tmp3779 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3780 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3779, i32 0, i32 7
%.tmp3781 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3780
store %m286$.Node.type* %.tmp3781, %m286$.Node.type** %param_ptr
br label %.for.start.3709
.for.end.3709:
ret void
}
define void @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3782 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3784 = getelementptr [6 x i8], [6 x i8]*@.str3783, i32 0, i32 0
%.tmp3785 = bitcast ptr null to i8*
%.tmp3786 = bitcast ptr null to i8*
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp3782, i8* %.tmp3784, i8* %.tmp3785, i8* %.tmp3786)
%.tmp3788 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3789 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3788, i32 0, i32 6
%.tmp3790 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3789
%b = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3790, %m286$.Node.type** %b
br label %.for.start.3787
.for.start.3787:
%.tmp3791 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3792 = icmp ne %m286$.Node.type* %.tmp3791, null
br i1 %.tmp3792, label %.for.continue.3787, label %.for.end.3787
.for.continue.3787:
%.tmp3793 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3794 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3793, i32 0, i32 0
%.tmp3795 = load i8*, i8** %.tmp3794
%.tmp3797 = getelementptr [11 x i8], [11 x i8]*@.str3796, i32 0, i32 0
%.tmp3798 = call i32(i8*,i8*) @strcmp(i8* %.tmp3795, i8* %.tmp3797)
%.tmp3799 = icmp eq i32 %.tmp3798, 0
br i1 %.tmp3799, label %.if.true.3800, label %.if.false.3800
.if.true.3800:
%.tmp3801 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3802 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3803 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3802, i32 0, i32 6
%.tmp3804 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3803
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3801, %m286$.Node.type* %.tmp3804)
br label %.if.end.3800
.if.false.3800:
br label %.if.end.3800
.if.end.3800:
%.tmp3805 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3806 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3805, i32 0, i32 7
%.tmp3807 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3806
store %m286$.Node.type* %.tmp3807, %m286$.Node.type** %b
br label %.for.start.3787
.for.end.3787:
%.tmp3808 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3808)
ret void
}
define %m1811$.AssignableInfo.type* @m1811$compile_builtin.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3809 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3810 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3809, i32 0, i32 6
%.tmp3811 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3810
%.tmp3812 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3811, i32 0, i32 6
%.tmp3813 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3812
%dotted = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3813, %m286$.Node.type** %dotted
%.tmp3814 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3815 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3814, i32 0, i32 7
%.tmp3816 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3815
%.tmp3817 = icmp ne %m286$.Node.type* %.tmp3816, null
br i1 %.tmp3817, label %.if.true.3818, label %.if.false.3818
.if.true.3818:
%.tmp3819 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3819
br label %.if.end.3818
.if.false.3818:
br label %.if.end.3818
.if.end.3818:
%.tmp3820 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3821 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3820, i32 0, i32 1
%.tmp3822 = load i8*, i8** %.tmp3821
%.tmp3824 = getelementptr [7 x i8], [7 x i8]*@.str3823, i32 0, i32 0
%.tmp3825 = call i32(i8*,i8*) @strcmp(i8* %.tmp3822, i8* %.tmp3824)
%.tmp3826 = icmp eq i32 %.tmp3825, 0
br i1 %.tmp3826, label %.if.true.3827, label %.if.false.3827
.if.true.3827:
%.tmp3828 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3830 = getelementptr [8 x i8], [8 x i8]*@.str3829, i32 0, i32 0
%.tmp3831 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3828, i8* %.tmp3830)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3831, %m286$.Node.type** %args
%.tmp3832 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3833 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3832, i32 0, i32 6
%.tmp3834 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3833
%.tmp3836 = getelementptr [11 x i8], [11 x i8]*@.str3835, i32 0, i32 0
%.tmp3837 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3834, i8* %.tmp3836)
%value = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3837, %m286$.Node.type** %value
%.tmp3838 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3839 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3838, i32 0, i32 6
%.tmp3840 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3839
%.tmp3841 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3840, i32 0, i32 6
%.tmp3842 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3841
%.tmp3843 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3842, i32 0, i32 6
%.tmp3844 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3843
%.tmp3845 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3844, i32 0, i32 6
%.tmp3846 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3845
store %m286$.Node.type* %.tmp3846, %m286$.Node.type** %value
%.tmp3847 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3848 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3847)
%tmp_id = alloca i32
store i32 %.tmp3848, i32* %tmp_id
%.tmp3849 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3850 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3849)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3850, %m1811$.AssignableInfo.type** %info
%.tmp3851 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3852 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3851, %m1811$.AssignableInfo.type* %.tmp3852)
%.tmp3853 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3854 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3853, i32 0, i32 3
%.tmp3855 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3855, %m1811$.Type.type** %.tmp3854
%.tmp3856 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3857 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3856, i32 0, i32 3
%.tmp3858 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3857
%.tmp3859 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3858, i32 0, i32 0
%.tmp3861 = getelementptr [4 x i8], [4 x i8]*@.str3860, i32 0, i32 0
store i8* %.tmp3861, i8** %.tmp3859
%.tmp3862 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3863 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3864 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3862, %m286$.Node.type* %.tmp3863)
%inspected_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3864, %m1811$.Type.type** %inspected_type
%.tmp3865 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3866 = load %m1811$.Type.type*, %m1811$.Type.type** %inspected_type
%.tmp3867 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3865, %m1811$.Type.type* %.tmp3866)
%type_as_str = alloca i8*
store i8* %.tmp3867, i8** %type_as_str
%.tmp3868 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3869 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3868, i32 0, i32 1
%.tmp3870 = load %m0$.File.type*, %m0$.File.type** %.tmp3869
%.tmp3872 = getelementptr [46 x i8], [46 x i8]*@.str3871, i32 0, i32 0
%.tmp3873 = load i32, i32* %tmp_id
%.tmp3874 = load i8*, i8** %type_as_str
%.tmp3875 = load i8*, i8** %type_as_str
%.tmp3876 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3870, i8* %.tmp3872, i32 %.tmp3873, i8* %.tmp3874, i8* %.tmp3875)
%.tmp3877 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3878 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3877, i32 0, i32 1
%.tmp3879 = load %m0$.File.type*, %m0$.File.type** %.tmp3878
%.tmp3881 = getelementptr [35 x i8], [35 x i8]*@.str3880, i32 0, i32 0
%.tmp3882 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3883 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3882)
%.tmp3884 = load i8*, i8** %type_as_str
%.tmp3885 = load i32, i32* %tmp_id
%.tmp3886 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3879, i8* %.tmp3881, i8* %.tmp3883, i8* %.tmp3884, i32 %.tmp3885)
%.tmp3887 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp3887
br label %.if.end.3827
.if.false.3827:
br label %.if.end.3827
.if.end.3827:
%.tmp3888 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3888
}
define %m1811$.AssignableInfo.type* @m1811$compile_fn_call.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3889 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3890 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3891 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_builtin.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3889, %m286$.Node.type* %.tmp3890)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3891, %m1811$.AssignableInfo.type** %info
%.tmp3892 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3893 = icmp ne %m1811$.AssignableInfo.type* %.tmp3892, null
br i1 %.tmp3893, label %.if.true.3894, label %.if.false.3894
.if.true.3894:
%.tmp3895 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp3895
br label %.if.end.3894
.if.false.3894:
br label %.if.end.3894
.if.end.3894:
%.tmp3896 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3897 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3898 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3896, %m286$.Node.type* %.tmp3897)
store %m1811$.AssignableInfo.type* %.tmp3898, %m1811$.AssignableInfo.type** %info
%.tmp3899 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3900 = icmp eq %m1811$.AssignableInfo.type* %.tmp3899, null
br i1 %.tmp3900, label %.if.true.3901, label %.if.false.3901
.if.true.3901:
%.tmp3902 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3902, label %.if.true.3903, label %.if.false.3903
.if.true.3903:
%.tmp3904 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3905 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3907 = getelementptr [35 x i8], [35 x i8]*@.str3906, i32 0, i32 0
%.tmp3908 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3904, %m286$.Node.type* %.tmp3905, i8* %.tmp3907)
%.tmp3909 = call i32(i8*,...) @printf(i8* %.tmp3908)
br label %.if.end.3903
.if.false.3903:
br label %.if.end.3903
.if.end.3903:
%.tmp3910 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3910
br label %.if.end.3901
.if.false.3901:
br label %.if.end.3901
.if.end.3901:
%.tmp3911 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3913 = getelementptr [8 x i8], [8 x i8]*@.str3912, i32 0, i32 0
%.tmp3914 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3911, i8* %.tmp3913)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3914, %m286$.Node.type** %args
%.tmp3916 = getelementptr [1 x i8], [1 x i8]*@.str3915, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3916, i8** %params_buff
%tmp = alloca i8*
store i8* null, i8** %tmp
%.tmp3917 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3918 = icmp ne %m286$.Node.type* %.tmp3917, null
br i1 %.tmp3918, label %.if.true.3919, label %.if.false.3919
.if.true.3919:
%.tmp3920 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3921 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3920, i32 0, i32 6
%.tmp3922 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3921
%.tmp3924 = getelementptr [11 x i8], [11 x i8]*@.str3923, i32 0, i32 0
%.tmp3925 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3922, i8* %.tmp3924)
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3925, %m286$.Node.type** %start
%.tmp3927 = load %m286$.Node.type*, %m286$.Node.type** %start
%pp = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3927, %m286$.Node.type** %pp
br label %.for.start.3926
.for.start.3926:
%.tmp3928 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3929 = icmp ne %m286$.Node.type* %.tmp3928, null
br i1 %.tmp3929, label %.for.continue.3926, label %.for.end.3926
.for.continue.3926:
%.tmp3930 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3931 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp3932 = icmp ne %m286$.Node.type* %.tmp3930, %.tmp3931
br i1 %.tmp3932, label %.if.true.3933, label %.if.false.3933
.if.true.3933:
%.tmp3934 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3936 = getelementptr [5 x i8], [5 x i8]*@.str3935, i32 0, i32 0
%.tmp3937 = load i8*, i8** %params_buff
%.tmp3938 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3934, i8* %.tmp3936, i8* %.tmp3937)
%.tmp3939 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3939, i8** %tmp_buff
%.tmp3940 = load i8*, i8** %tmp
store i8* %.tmp3940, i8** %params_buff
%.tmp3941 = load i8*, i8** %tmp_buff
store i8* %.tmp3941, i8** %tmp
%.tmp3942 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3942)
br label %.if.end.3933
.if.false.3933:
br label %.if.end.3933
.if.end.3933:
%.tmp3943 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3944 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3945 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3943, %m286$.Node.type* %.tmp3944)
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3945, %m1811$.AssignableInfo.type** %a_info
%.tmp3946 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3947 = icmp eq %m1811$.AssignableInfo.type* %.tmp3946, null
br i1 %.tmp3947, label %.if.true.3948, label %.if.false.3948
.if.true.3948:
%.tmp3949 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3949
br label %.if.end.3948
.if.false.3948:
br label %.if.end.3948
.if.end.3948:
%.tmp3950 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3952 = getelementptr [8 x i8], [8 x i8]*@.str3951, i32 0, i32 0
%.tmp3953 = load i8*, i8** %params_buff
%.tmp3954 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3955 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3956 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3955, i32 0, i32 3
%.tmp3957 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3956
%.tmp3958 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3954, %m1811$.Type.type* %.tmp3957)
%.tmp3959 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3960 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3959)
%.tmp3961 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3950, i8* %.tmp3952, i8* %.tmp3953, i8* %.tmp3958, i8* %.tmp3960)
%.tmp3962 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3963 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3962, i32 0, i32 7
%.tmp3964 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3963
store %m286$.Node.type* %.tmp3964, %m286$.Node.type** %pp
%.tmp3965 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3967 = getelementptr [11 x i8], [11 x i8]*@.str3966, i32 0, i32 0
%.tmp3968 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3965, i8* %.tmp3967)
store %m286$.Node.type* %.tmp3968, %m286$.Node.type** %pp
br label %.for.start.3926
.for.end.3926:
br label %.if.end.3919
.if.false.3919:
br label %.if.end.3919
.if.end.3919:
%.tmp3969 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3970 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3971 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3970, i32 0, i32 3
%.tmp3972 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3971
%.tmp3973 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3972, i32 0, i32 3
%.tmp3974 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3973
%.tmp3975 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3969, %m1811$.Type.type* %.tmp3974)
%.tmp3977 = getelementptr [5 x i8], [5 x i8]*@.str3976, i32 0, i32 0
%.tmp3978 = call i32(i8*,i8*) @strcmp(i8* %.tmp3975, i8* %.tmp3977)
%.tmp3979 = icmp eq i32 %.tmp3978, 0
br i1 %.tmp3979, label %.if.true.3980, label %.if.false.3980
.if.true.3980:
%.tmp3981 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3982 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3981, i32 0, i32 1
%.tmp3983 = load %m0$.File.type*, %m0$.File.type** %.tmp3982
%.tmp3985 = getelementptr [16 x i8], [16 x i8]*@.str3984, i32 0, i32 0
%.tmp3986 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3987 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3988 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3987, i32 0, i32 3
%.tmp3989 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3988
%.tmp3990 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3986, %m1811$.Type.type* %.tmp3989)
%.tmp3991 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3992 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3991)
%.tmp3993 = load i8*, i8** %params_buff
%.tmp3994 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3983, i8* %.tmp3985, i8* %.tmp3990, i8* %.tmp3992, i8* %.tmp3993)
%.tmp3995 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3995
br label %.if.end.3980
.if.false.3980:
br label %.if.end.3980
.if.end.3980:
%.tmp3996 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3997 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3996)
%call_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3997, %m1811$.AssignableInfo.type** %call_info
%.tmp3998 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3999 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3998, %m1811$.AssignableInfo.type* %.tmp3999)
%.tmp4000 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4001 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4000, i32 0, i32 3
%.tmp4002 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4003 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4002, i32 0, i32 3
%.tmp4004 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4003
%.tmp4005 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4004, i32 0, i32 3
%.tmp4006 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4005
%.tmp4007 = call %m1811$.Type.type*(%m1811$.Type.type*) @m1811$type_clone.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp4006)
store %m1811$.Type.type* %.tmp4007, %m1811$.Type.type** %.tmp4001
%.tmp4008 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4009 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4008, i32 0, i32 3
%.tmp4010 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4009
%.tmp4011 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4010, i32 0, i32 4
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp4011
%.tmp4012 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4013 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4012, i32 0, i32 1
%.tmp4014 = load %m0$.File.type*, %m0$.File.type** %.tmp4013
%.tmp4016 = getelementptr [21 x i8], [21 x i8]*@.str4015, i32 0, i32 0
%.tmp4017 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4018 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4017)
%.tmp4019 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4020 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4021 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4020, i32 0, i32 3
%.tmp4022 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4021
%.tmp4023 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4019, %m1811$.Type.type* %.tmp4022)
%.tmp4024 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4025 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4024)
%.tmp4026 = load i8*, i8** %params_buff
%.tmp4027 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4014, i8* %.tmp4016, i8* %.tmp4018, i8* %.tmp4023, i8* %.tmp4025, i8* %.tmp4026)
%.tmp4028 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4029 = bitcast %m1811$.AssignableInfo.type* %.tmp4028 to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp4029
}
define void @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp4030 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4031 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4030, i32 0, i32 0
%.tmp4032 = load i8*, i8** %.tmp4031
%expr_type = alloca i8*
store i8* %.tmp4032, i8** %expr_type
%.tmp4033 = bitcast ptr null to %m1811$.AssignableInfo.type*
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4033, %m1811$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %assignable
%.tmp4034 = bitcast ptr null to %m1811$.AssignableInfo.type*
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4034, %m1811$.AssignableInfo.type** %a_info
%.tmp4035 = load i8*, i8** %expr_type
%.tmp4037 = getelementptr [7 x i8], [7 x i8]*@.str4036, i32 0, i32 0
%.tmp4038 = call i32(i8*,i8*) @strcmp(i8* %.tmp4035, i8* %.tmp4037)
%.tmp4039 = icmp eq i32 %.tmp4038, 0
br i1 %.tmp4039, label %.if.true.4040, label %.if.false.4040
.if.true.4040:
%.tmp4041 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4042 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4041, i32 0, i32 6
%.tmp4043 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4042
%.tmp4044 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4043, i32 0, i32 7
%.tmp4045 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4044
%.tmp4046 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4045, i32 0, i32 0
%.tmp4047 = load i8*, i8** %.tmp4046
%.tmp4049 = getelementptr [3 x i8], [3 x i8]*@.str4048, i32 0, i32 0
%.tmp4050 = call i32(i8*,i8*) @strcmp(i8* %.tmp4047, i8* %.tmp4049)
%.tmp4051 = icmp ne i32 %.tmp4050, 0
br i1 %.tmp4051, label %.if.true.4052, label %.if.false.4052
.if.true.4052:
%.tmp4053 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4054 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4055 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4054, i32 0, i32 6
%.tmp4056 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4055
%.tmp4057 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4056, i32 0, i32 7
%.tmp4058 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4057
%.tmp4059 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4053, %m286$.Node.type* %.tmp4058)
store %m1811$.AssignableInfo.type* %.tmp4059, %m1811$.AssignableInfo.type** %info
%.tmp4060 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4061 = icmp eq %m1811$.AssignableInfo.type* %.tmp4060, null
br i1 %.tmp4061, label %.if.true.4062, label %.if.false.4062
.if.true.4062:
ret void
br label %.if.end.4062
.if.false.4062:
br label %.if.end.4062
.if.end.4062:
%.tmp4063 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4064 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4063, i32 0, i32 1
%.tmp4065 = load %m0$.File.type*, %m0$.File.type** %.tmp4064
%.tmp4067 = getelementptr [11 x i8], [11 x i8]*@.str4066, i32 0, i32 0
%.tmp4068 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4069 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4070 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4069, i32 0, i32 3
%.tmp4071 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4070
%.tmp4072 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4068, %m1811$.Type.type* %.tmp4071)
%.tmp4073 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4074 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4073)
%.tmp4075 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4065, i8* %.tmp4067, i8* %.tmp4072, i8* %.tmp4074)
br label %.if.end.4052
.if.false.4052:
%.tmp4076 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4077 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4076, i32 0, i32 1
%.tmp4078 = load %m0$.File.type*, %m0$.File.type** %.tmp4077
%.tmp4080 = getelementptr [10 x i8], [10 x i8]*@.str4079, i32 0, i32 0
%.tmp4081 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4078, i8* %.tmp4080)
br label %.if.end.4052
.if.end.4052:
br label %.if.end.4040
.if.false.4040:
%.tmp4082 = load i8*, i8** %expr_type
%.tmp4084 = getelementptr [3 x i8], [3 x i8]*@.str4083, i32 0, i32 0
%.tmp4085 = call i32(i8*,i8*) @strcmp(i8* %.tmp4082, i8* %.tmp4084)
%.tmp4086 = icmp eq i32 %.tmp4085, 0
br i1 %.tmp4086, label %.if.true.4087, label %.if.false.4087
.if.true.4087:
br label %.if.end.4087
.if.false.4087:
%.tmp4088 = load i8*, i8** %expr_type
%.tmp4090 = getelementptr [8 x i8], [8 x i8]*@.str4089, i32 0, i32 0
%.tmp4091 = call i32(i8*,i8*) @strcmp(i8* %.tmp4088, i8* %.tmp4090)
%.tmp4092 = icmp eq i32 %.tmp4091, 0
br i1 %.tmp4092, label %.if.true.4093, label %.if.false.4093
.if.true.4093:
%.tmp4094 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4095 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4096 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4095, i32 0, i32 6
%.tmp4097 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4096
%.tmp4098 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_fn_call.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4094, %m286$.Node.type* %.tmp4097)
br label %.if.end.4093
.if.false.4093:
%.tmp4099 = load i8*, i8** %expr_type
%.tmp4101 = getelementptr [12 x i8], [12 x i8]*@.str4100, i32 0, i32 0
%.tmp4102 = call i32(i8*,i8*) @strcmp(i8* %.tmp4099, i8* %.tmp4101)
%.tmp4103 = icmp eq i32 %.tmp4102, 0
br i1 %.tmp4103, label %.if.true.4104, label %.if.false.4104
.if.true.4104:
%.tmp4105 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4106 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4107 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_declaration.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4105, %m286$.Node.type* %.tmp4106)
br label %.if.end.4104
.if.false.4104:
%.tmp4108 = load i8*, i8** %expr_type
%.tmp4110 = getelementptr [11 x i8], [11 x i8]*@.str4109, i32 0, i32 0
%.tmp4111 = call i32(i8*,i8*) @strcmp(i8* %.tmp4108, i8* %.tmp4110)
%.tmp4112 = icmp eq i32 %.tmp4111, 0
br i1 %.tmp4112, label %.if.true.4113, label %.if.false.4113
.if.true.4113:
%.tmp4114 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4115 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4114, i32 0, i32 6
%.tmp4116 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4115
%.tmp4118 = getelementptr [11 x i8], [11 x i8]*@.str4117, i32 0, i32 0
%.tmp4119 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4116, i8* %.tmp4118)
store %m286$.Node.type* %.tmp4119, %m286$.Node.type** %assignable
%.tmp4120 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4121 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4122 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4121, i32 0, i32 6
%.tmp4123 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4122
%.tmp4124 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4120, %m286$.Node.type* %.tmp4123)
%dest = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4124, %m1811$.AssignableInfo.type** %dest
%.tmp4125 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %dest
%.tmp4126 = icmp eq %m1811$.AssignableInfo.type* %.tmp4125, null
br i1 %.tmp4126, label %.if.true.4127, label %.if.false.4127
.if.true.4127:
ret void
br label %.if.end.4127
.if.false.4127:
br label %.if.end.4127
.if.end.4127:
%.tmp4128 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4129 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4130 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4128, %m286$.Node.type* %.tmp4129)
store %m1811$.AssignableInfo.type* %.tmp4130, %m1811$.AssignableInfo.type** %a_info
%.tmp4131 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4132 = icmp eq %m1811$.AssignableInfo.type* %.tmp4131, null
br i1 %.tmp4132, label %.if.true.4133, label %.if.false.4133
.if.true.4133:
ret void
br label %.if.end.4133
.if.false.4133:
br label %.if.end.4133
.if.end.4133:
%.tmp4134 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4135 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %dest
%.tmp4136 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4135, i32 0, i32 3
%.tmp4137 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4136
%.tmp4138 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4134, %m1811$.Type.type* %.tmp4137)
%dest_tr = alloca i8*
store i8* %.tmp4138, i8** %dest_tr
%.tmp4139 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4140 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4141 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4140, i32 0, i32 3
%.tmp4142 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4141
%.tmp4143 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4139, %m1811$.Type.type* %.tmp4142)
%src_tr = alloca i8*
store i8* %.tmp4143, i8** %src_tr
%.tmp4144 = load i8*, i8** %src_tr
%.tmp4146 = getelementptr [4 x i8], [4 x i8]*@.str4145, i32 0, i32 0
%.tmp4147 = call i32(i8*,i8*) @strcmp(i8* %.tmp4144, i8* %.tmp4146)
%.tmp4148 = icmp eq i32 %.tmp4147, 0
br i1 %.tmp4148, label %.if.true.4149, label %.if.false.4149
.if.true.4149:
%.tmp4150 = load i8*, i8** %dest_tr
store i8* %.tmp4150, i8** %src_tr
br label %.if.end.4149
.if.false.4149:
br label %.if.end.4149
.if.end.4149:
%.tmp4151 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4152 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4151, i32 0, i32 1
%.tmp4153 = load %m0$.File.type*, %m0$.File.type** %.tmp4152
%.tmp4155 = getelementptr [21 x i8], [21 x i8]*@.str4154, i32 0, i32 0
%.tmp4156 = load i8*, i8** %src_tr
%.tmp4157 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4158 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4157)
%.tmp4159 = load i8*, i8** %dest_tr
%.tmp4160 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %dest
%.tmp4161 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4160)
%.tmp4162 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4153, i8* %.tmp4155, i8* %.tmp4156, i8* %.tmp4158, i8* %.tmp4159, i8* %.tmp4161)
br label %.if.end.4113
.if.false.4113:
%.tmp4163 = load i8*, i8** %expr_type
%.tmp4165 = getelementptr [9 x i8], [9 x i8]*@.str4164, i32 0, i32 0
%.tmp4166 = call i32(i8*,i8*) @strcmp(i8* %.tmp4163, i8* %.tmp4165)
%.tmp4167 = icmp eq i32 %.tmp4166, 0
br i1 %.tmp4167, label %.if.true.4168, label %.if.false.4168
.if.true.4168:
%.tmp4169 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4170 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_if_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4169, %m286$.Node.type* %.tmp4170)
br label %.if.end.4168
.if.false.4168:
%.tmp4171 = load i8*, i8** %expr_type
%.tmp4173 = getelementptr [9 x i8], [9 x i8]*@.str4172, i32 0, i32 0
%.tmp4174 = call i32(i8*,i8*) @strcmp(i8* %.tmp4171, i8* %.tmp4173)
%.tmp4175 = icmp eq i32 %.tmp4174, 0
br i1 %.tmp4175, label %.if.true.4176, label %.if.false.4176
.if.true.4176:
%.tmp4177 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4178 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_for_loop.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4177, %m286$.Node.type* %.tmp4178)
br label %.if.end.4176
.if.false.4176:
%.tmp4179 = load i8*, i8** %expr_type
%.tmp4181 = getelementptr [8 x i8], [8 x i8]*@.str4180, i32 0, i32 0
%.tmp4182 = call i32(i8*,i8*) @strcmp(i8* %.tmp4179, i8* %.tmp4181)
%.tmp4183 = icmp eq i32 %.tmp4182, 0
br i1 %.tmp4183, label %.if.true.4184, label %.if.false.4184
.if.true.4184:
%.tmp4185 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4186 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4185)
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp4186, %m1811$.ModuleLookup.type** %mod
%found = alloca i1
store i1 0, i1* %found
%.tmp4187 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4188 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4187, i32 0, i32 3
%.tmp4189 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4188
%s = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp4189, %m1811$.Scope.type** %s
%.tmp4190 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4191 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4190, i32 0, i32 6
%.tmp4192 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4191
%.tmp4193 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4192, i32 0, i32 1
%.tmp4194 = load i8*, i8** %.tmp4193
%.tmp4196 = getelementptr [6 x i8], [6 x i8]*@.str4195, i32 0, i32 0
%.tmp4197 = call i32(i8*,i8*) @strcmp(i8* %.tmp4194, i8* %.tmp4196)
%.tmp4198 = icmp eq i32 %.tmp4197, 0
br i1 %.tmp4198, label %.if.true.4199, label %.if.false.4199
.if.true.4199:
br label %.for.start.4200
.for.start.4200:
%.tmp4201 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4202 = icmp ne %m1811$.Scope.type* %.tmp4201, null
%.tmp4203 = load i1, i1* %found
%.tmp4204 = icmp eq i1 %.tmp4203, 0
%.tmp4205 = and i1 %.tmp4202, %.tmp4204
br i1 %.tmp4205, label %.for.continue.4200, label %.for.end.4200
.for.continue.4200:
%.tmp4206 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4207 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4206, i32 0, i32 2
%.tmp4208 = load i8*, i8** %.tmp4207
%.tmp4210 = getelementptr [4 x i8], [4 x i8]*@.str4209, i32 0, i32 0
%.tmp4211 = call i32(i8*,i8*) @strcmp(i8* %.tmp4208, i8* %.tmp4210)
%.tmp4212 = icmp eq i32 %.tmp4211, 0
br i1 %.tmp4212, label %.if.true.4213, label %.if.false.4213
.if.true.4213:
store i1 1, i1* %found
%.tmp4214 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4215 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4214, i32 0, i32 1
%.tmp4216 = load %m0$.File.type*, %m0$.File.type** %.tmp4215
%.tmp4218 = getelementptr [15 x i8], [15 x i8]*@.str4217, i32 0, i32 0
%.tmp4219 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4220 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4219, i32 0, i32 4
%.tmp4221 = load i8*, i8** %.tmp4220
%.tmp4222 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4216, i8* %.tmp4218, i8* %.tmp4221)
br label %.if.end.4213
.if.false.4213:
br label %.if.end.4213
.if.end.4213:
%.tmp4223 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4224 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4223, i32 0, i32 5
%.tmp4225 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4224
store %m1811$.Scope.type* %.tmp4225, %m1811$.Scope.type** %s
br label %.for.start.4200
.for.end.4200:
%.tmp4226 = load i1, i1* %found
%.tmp4227 = icmp eq i1 %.tmp4226, 0
br i1 %.tmp4227, label %.if.true.4228, label %.if.false.4228
.if.true.4228:
%.tmp4229 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4230 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4232 = getelementptr [48 x i8], [48 x i8]*@.str4231, i32 0, i32 0
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4229, %m286$.Node.type* %.tmp4230, i8* %.tmp4232)
br label %.if.end.4228
.if.false.4228:
br label %.if.end.4228
.if.end.4228:
br label %.if.end.4199
.if.false.4199:
%.tmp4233 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4234 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4233, i32 0, i32 6
%.tmp4235 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4234
%.tmp4236 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4235, i32 0, i32 1
%.tmp4237 = load i8*, i8** %.tmp4236
%.tmp4239 = getelementptr [9 x i8], [9 x i8]*@.str4238, i32 0, i32 0
%.tmp4240 = call i32(i8*,i8*) @strcmp(i8* %.tmp4237, i8* %.tmp4239)
%.tmp4241 = icmp eq i32 %.tmp4240, 0
br i1 %.tmp4241, label %.if.true.4242, label %.if.false.4242
.if.true.4242:
br label %.for.start.4243
.for.start.4243:
%.tmp4244 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4245 = icmp ne %m1811$.Scope.type* %.tmp4244, null
%.tmp4246 = load i1, i1* %found
%.tmp4247 = icmp eq i1 %.tmp4246, 0
%.tmp4248 = and i1 %.tmp4245, %.tmp4247
br i1 %.tmp4248, label %.for.continue.4243, label %.for.end.4243
.for.continue.4243:
%.tmp4249 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4250 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4249, i32 0, i32 2
%.tmp4251 = load i8*, i8** %.tmp4250
%.tmp4253 = getelementptr [4 x i8], [4 x i8]*@.str4252, i32 0, i32 0
%.tmp4254 = call i32(i8*,i8*) @strcmp(i8* %.tmp4251, i8* %.tmp4253)
%.tmp4255 = icmp eq i32 %.tmp4254, 0
br i1 %.tmp4255, label %.if.true.4256, label %.if.false.4256
.if.true.4256:
store i1 1, i1* %found
%.tmp4257 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4258 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4257, i32 0, i32 1
%.tmp4259 = load %m0$.File.type*, %m0$.File.type** %.tmp4258
%.tmp4261 = getelementptr [15 x i8], [15 x i8]*@.str4260, i32 0, i32 0
%.tmp4262 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4263 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4262, i32 0, i32 3
%.tmp4264 = load i8*, i8** %.tmp4263
%.tmp4265 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4259, i8* %.tmp4261, i8* %.tmp4264)
br label %.if.end.4256
.if.false.4256:
br label %.if.end.4256
.if.end.4256:
%.tmp4266 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4267 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4266, i32 0, i32 5
%.tmp4268 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4267
store %m1811$.Scope.type* %.tmp4268, %m1811$.Scope.type** %s
br label %.for.start.4243
.for.end.4243:
%.tmp4269 = load i1, i1* %found
%.tmp4270 = icmp eq i1 %.tmp4269, 0
br i1 %.tmp4270, label %.if.true.4271, label %.if.false.4271
.if.true.4271:
%.tmp4272 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4273 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4275 = getelementptr [48 x i8], [48 x i8]*@.str4274, i32 0, i32 0
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4272, %m286$.Node.type* %.tmp4273, i8* %.tmp4275)
br label %.if.end.4271
.if.false.4271:
br label %.if.end.4271
.if.end.4271:
br label %.if.end.4242
.if.false.4242:
%.tmp4276 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4277 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4279 = getelementptr [29 x i8], [29 x i8]*@.str4278, i32 0, i32 0
%.tmp4280 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4276, %m286$.Node.type* %.tmp4277, i8* %.tmp4279)
%.tmp4281 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4282 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4281, i32 0, i32 6
%.tmp4283 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4282
%.tmp4284 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4283, i32 0, i32 1
%.tmp4285 = load i8*, i8** %.tmp4284
%.tmp4286 = call i32(i8*,...) @printf(i8* %.tmp4280, i8* %.tmp4285)
br label %.if.end.4242
.if.end.4242:
br label %.if.end.4199
.if.end.4199:
br label %.if.end.4184
.if.false.4184:
%.tmp4287 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4288 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4290 = getelementptr [34 x i8], [34 x i8]*@.str4289, i32 0, i32 0
%.tmp4291 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4287, %m286$.Node.type* %.tmp4288, i8* %.tmp4290)
%.tmp4292 = load i8*, i8** %expr_type
%.tmp4293 = call i32(i8*,...) @printf(i8* %.tmp4291, i8* %.tmp4292)
br label %.if.end.4184
.if.end.4184:
br label %.if.end.4176
.if.end.4176:
br label %.if.end.4168
.if.end.4168:
br label %.if.end.4113
.if.end.4113:
br label %.if.end.4104
.if.end.4104:
br label %.if.end.4093
.if.end.4093:
br label %.if.end.4087
.if.end.4087:
br label %.if.end.4040
.if.end.4040:
ret void
}
define void @m1811$compile_for_loop.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4294 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4295 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4294)
%for_id = alloca i32
store i32 %.tmp4295, i32* %for_id
%.tmp4296 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4297 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4296, i32 0, i32 6
%.tmp4298 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4297
%.tmp4299 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4298, i32 0, i32 7
%.tmp4300 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4299
%init_stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4300, %m286$.Node.type** %init_stmt
%.tmp4301 = bitcast ptr null to i8*
%begin_lbl = alloca i8*
store i8* %.tmp4301, i8** %begin_lbl
%.tmp4302 = bitcast ptr null to i8*
%end_lbl = alloca i8*
store i8* %.tmp4302, i8** %end_lbl
%.tmp4303 = getelementptr i8*, i8** %begin_lbl, i32 0
%.tmp4305 = getelementptr [14 x i8], [14 x i8]*@.str4304, i32 0, i32 0
%.tmp4306 = load i32, i32* %for_id
%.tmp4307 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4303, i8* %.tmp4305, i32 %.tmp4306)
%.tmp4308 = getelementptr i8*, i8** %end_lbl, i32 0
%.tmp4310 = getelementptr [12 x i8], [12 x i8]*@.str4309, i32 0, i32 0
%.tmp4311 = load i32, i32* %for_id
%.tmp4312 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4308, i8* %.tmp4310, i32 %.tmp4311)
%.tmp4313 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4315 = getelementptr [4 x i8], [4 x i8]*@.str4314, i32 0, i32 0
%.tmp4316 = load i8*, i8** %begin_lbl
%.tmp4317 = load i8*, i8** %end_lbl
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp4313, i8* %.tmp4315, i8* %.tmp4316, i8* %.tmp4317)
%.tmp4318 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4319 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4318, i32 0, i32 0
%.tmp4320 = load i8*, i8** %.tmp4319
%.tmp4322 = getelementptr [12 x i8], [12 x i8]*@.str4321, i32 0, i32 0
%.tmp4323 = call i32(i8*,i8*) @strcmp(i8* %.tmp4320, i8* %.tmp4322)
%.tmp4324 = icmp eq i32 %.tmp4323, 0
br i1 %.tmp4324, label %.if.true.4325, label %.if.false.4325
.if.true.4325:
%.tmp4326 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4327 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4328 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_declaration.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4326, %m286$.Node.type* %.tmp4327)
br label %.if.end.4325
.if.false.4325:
%.tmp4329 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4330 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4329, i32 0, i32 0
%.tmp4331 = load i8*, i8** %.tmp4330
%.tmp4333 = getelementptr [11 x i8], [11 x i8]*@.str4332, i32 0, i32 0
%.tmp4334 = call i32(i8*,i8*) @strcmp(i8* %.tmp4331, i8* %.tmp4333)
%.tmp4335 = icmp eq i32 %.tmp4334, 0
br i1 %.tmp4335, label %.if.true.4336, label %.if.false.4336
.if.true.4336:
%.tmp4337 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4338 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4337, %m286$.Node.type* %.tmp4338)
br label %.if.end.4336
.if.false.4336:
%.tmp4339 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4340 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4339, i32 0, i32 0
%.tmp4341 = load i8*, i8** %.tmp4340
%.tmp4343 = getelementptr [9 x i8], [9 x i8]*@.str4342, i32 0, i32 0
%.tmp4344 = call i32(i8*,i8*) @strcmp(i8* %.tmp4341, i8* %.tmp4343)
%.tmp4345 = icmp eq i32 %.tmp4344, 0
br i1 %.tmp4345, label %.if.true.4346, label %.if.false.4346
.if.true.4346:
br label %.if.end.4346
.if.false.4346:
%.tmp4347 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4348 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4350 = getelementptr [66 x i8], [66 x i8]*@.str4349, i32 0, i32 0
%.tmp4351 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4347, %m286$.Node.type* %.tmp4348, i8* %.tmp4350)
%.tmp4352 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4353 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4352, i32 0, i32 0
%.tmp4354 = load i8*, i8** %.tmp4353
%.tmp4355 = call i32(i8*,...) @printf(i8* %.tmp4351, i8* %.tmp4354)
%.tmp4356 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4356)
ret void
br label %.if.end.4346
.if.end.4346:
br label %.if.end.4336
.if.end.4336:
br label %.if.end.4325
.if.end.4325:
%.tmp4357 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4358 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4357, i32 0, i32 1
%.tmp4359 = load %m0$.File.type*, %m0$.File.type** %.tmp4358
%.tmp4361 = getelementptr [26 x i8], [26 x i8]*@.str4360, i32 0, i32 0
%.tmp4362 = load i32, i32* %for_id
%.tmp4363 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4359, i8* %.tmp4361, i32 %.tmp4362)
%.tmp4364 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4365 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4364, i32 0, i32 1
%.tmp4366 = load %m0$.File.type*, %m0$.File.type** %.tmp4365
%.tmp4368 = getelementptr [16 x i8], [16 x i8]*@.str4367, i32 0, i32 0
%.tmp4369 = load i32, i32* %for_id
%.tmp4370 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4366, i8* %.tmp4368, i32 %.tmp4369)
%.tmp4371 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4372 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4371, i32 0, i32 6
%.tmp4373 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4372
%.tmp4375 = getelementptr [9 x i8], [9 x i8]*@.str4374, i32 0, i32 0
%.tmp4376 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4373, i8* %.tmp4375)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4376, %m286$.Node.type** %fst_colon
%.tmp4377 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4378 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4377, i32 0, i32 7
%.tmp4379 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4378
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4379, %m286$.Node.type** %condition
%.tmp4380 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4381 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4380, i32 0, i32 0
%.tmp4382 = load i8*, i8** %.tmp4381
%.tmp4384 = getelementptr [9 x i8], [9 x i8]*@.str4383, i32 0, i32 0
%.tmp4385 = call i32(i8*,i8*) @strcmp(i8* %.tmp4382, i8* %.tmp4384)
%.tmp4386 = icmp eq i32 %.tmp4385, 0
br i1 %.tmp4386, label %.if.true.4387, label %.if.false.4387
.if.true.4387:
%.tmp4388 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4389 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4391 = getelementptr [39 x i8], [39 x i8]*@.str4390, i32 0, i32 0
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4388, %m286$.Node.type* %.tmp4389, i8* %.tmp4391)
ret void
br label %.if.end.4387
.if.false.4387:
br label %.if.end.4387
.if.end.4387:
%.tmp4392 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4393 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4394 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4392, %m286$.Node.type* %.tmp4393)
%condition_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4394, %m1811$.AssignableInfo.type** %condition_info
%.tmp4395 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4396 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4395, i32 0, i32 1
%.tmp4397 = load %m0$.File.type*, %m0$.File.type** %.tmp4396
%.tmp4399 = getelementptr [48 x i8], [48 x i8]*@.str4398, i32 0, i32 0
%.tmp4400 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4401 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %condition_info
%.tmp4402 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4401, i32 0, i32 3
%.tmp4403 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4402
%.tmp4404 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4400, %m1811$.Type.type* %.tmp4403)
%.tmp4405 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %condition_info
%.tmp4406 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4405)
%.tmp4407 = load i32, i32* %for_id
%.tmp4408 = load i8*, i8** %end_lbl
%.tmp4409 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4397, i8* %.tmp4399, i8* %.tmp4404, i8* %.tmp4406, i32 %.tmp4407, i8* %.tmp4408)
%.tmp4410 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4411 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4410, i32 0, i32 1
%.tmp4412 = load %m0$.File.type*, %m0$.File.type** %.tmp4411
%.tmp4414 = getelementptr [19 x i8], [19 x i8]*@.str4413, i32 0, i32 0
%.tmp4415 = load i32, i32* %for_id
%.tmp4416 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4412, i8* %.tmp4414, i32 %.tmp4415)
%.tmp4417 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4418 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4417, i32 0, i32 7
%.tmp4419 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4418
%.tmp4421 = getelementptr [9 x i8], [9 x i8]*@.str4420, i32 0, i32 0
%.tmp4422 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4419, i8* %.tmp4421)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4422, %m286$.Node.type** %snd_colon
%.tmp4423 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4424 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4423, i32 0, i32 7
%.tmp4425 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4424
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4425, %m286$.Node.type** %increment
%.tmp4426 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4428 = getelementptr [6 x i8], [6 x i8]*@.str4427, i32 0, i32 0
%.tmp4429 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4426, i8* %.tmp4428)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4429, %m286$.Node.type** %for_body
%.tmp4430 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4431 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4430, %m286$.Node.type* %.tmp4431)
%.tmp4432 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4433 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4434 = icmp ne %m286$.Node.type* %.tmp4432, %.tmp4433
br i1 %.tmp4434, label %.if.true.4435, label %.if.false.4435
.if.true.4435:
%.tmp4436 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4437 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4436, %m286$.Node.type* %.tmp4437)
br label %.if.end.4435
.if.false.4435:
br label %.if.end.4435
.if.end.4435:
%.tmp4438 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4439 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4438, i32 0, i32 1
%.tmp4440 = load %m0$.File.type*, %m0$.File.type** %.tmp4439
%.tmp4442 = getelementptr [15 x i8], [15 x i8]*@.str4441, i32 0, i32 0
%.tmp4443 = load i8*, i8** %begin_lbl
%.tmp4444 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4440, i8* %.tmp4442, i8* %.tmp4443)
%.tmp4445 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4446 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4445, i32 0, i32 1
%.tmp4447 = load %m0$.File.type*, %m0$.File.type** %.tmp4446
%.tmp4449 = getelementptr [5 x i8], [5 x i8]*@.str4448, i32 0, i32 0
%.tmp4450 = load i8*, i8** %end_lbl
%.tmp4451 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4447, i8* %.tmp4449, i8* %.tmp4450)
%.tmp4452 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4452)
ret void
}
define %m1811$.AssignableInfo.type* @m1811$compile_declaration.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4453 = bitcast ptr null to %m1811$.Type.type*
%decl_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp4453, %m1811$.Type.type** %decl_type
%.tmp4454 = bitcast ptr null to %m1811$.AssignableInfo.type*
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4454, %m1811$.AssignableInfo.type** %a_info
%.tmp4455 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4456 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4455, i32 0, i32 6
%.tmp4457 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4456
%.tmp4458 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4457, i32 0, i32 0
%.tmp4459 = load i8*, i8** %.tmp4458
%.tmp4461 = getelementptr [5 x i8], [5 x i8]*@.str4460, i32 0, i32 0
%.tmp4462 = call i32(i8*,i8*) @strcmp(i8* %.tmp4459, i8* %.tmp4461)
%.tmp4463 = icmp eq i32 %.tmp4462, 0
br i1 %.tmp4463, label %.if.true.4464, label %.if.false.4464
.if.true.4464:
%.tmp4465 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4466 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4467 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4466, i32 0, i32 6
%.tmp4468 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4467
%.tmp4469 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4468, i32 0, i32 6
%.tmp4470 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4469
%.tmp4471 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4465, %m286$.Node.type* %.tmp4470)
store %m1811$.Type.type* %.tmp4471, %m1811$.Type.type** %decl_type
br label %.if.end.4464
.if.false.4464:
br label %.if.end.4464
.if.end.4464:
%.tmp4472 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4473 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4472, i32 0, i32 6
%.tmp4474 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4473
%.tmp4476 = getelementptr [11 x i8], [11 x i8]*@.str4475, i32 0, i32 0
%.tmp4477 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4474, i8* %.tmp4476)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4477, %m286$.Node.type** %assignable
%.tmp4478 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4479 = icmp ne %m286$.Node.type* %.tmp4478, null
br i1 %.tmp4479, label %.if.true.4480, label %.if.false.4480
.if.true.4480:
%.tmp4481 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4482 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4483 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4481, %m286$.Node.type* %.tmp4482)
store %m1811$.AssignableInfo.type* %.tmp4483, %m1811$.AssignableInfo.type** %a_info
br label %.if.end.4480
.if.false.4480:
br label %.if.end.4480
.if.end.4480:
%.tmp4484 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4485 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4484)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4485, %m1811$.AssignableInfo.type** %info
%.tmp4486 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4487 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4486, i32 0, i32 2
%.tmp4489 = getelementptr [9 x i8], [9 x i8]*@.str4488, i32 0, i32 0
store i8* %.tmp4489, i8** %.tmp4487
%.tmp4490 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4491 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4490, i32 0, i32 6
%.tmp4492 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4491
%.tmp4494 = getelementptr [5 x i8], [5 x i8]*@.str4493, i32 0, i32 0
%.tmp4495 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4492, i8* %.tmp4494)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4495, %m286$.Node.type** %var_name
%.tmp4496 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4497 = icmp eq %m286$.Node.type* %.tmp4496, null
br i1 %.tmp4497, label %.if.true.4498, label %.if.false.4498
.if.true.4498:
%.tmp4499 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4500 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4502 = getelementptr [31 x i8], [31 x i8]*@.str4501, i32 0, i32 0
%.tmp4503 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4499, %m286$.Node.type* %.tmp4500, i8* %.tmp4502)
%.tmp4504 = call i32(i8*,...) @printf(i8* %.tmp4503)
%.tmp4505 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp4505
br label %.if.end.4498
.if.false.4498:
br label %.if.end.4498
.if.end.4498:
%.tmp4506 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4507 = load i8, i8* @SCOPE_LOCAL
%.tmp4508 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4509 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4508, i32 0, i32 1
%.tmp4510 = load i8*, i8** %.tmp4509
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp4506, i8 %.tmp4507, i8* %.tmp4510)
%.tmp4511 = load %m1811$.Type.type*, %m1811$.Type.type** %decl_type
%.tmp4512 = icmp ne %m1811$.Type.type* %.tmp4511, null
br i1 %.tmp4512, label %.if.true.4513, label %.if.false.4513
.if.true.4513:
%.tmp4514 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4515 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4514, i32 0, i32 3
%.tmp4516 = load %m1811$.Type.type*, %m1811$.Type.type** %decl_type
store %m1811$.Type.type* %.tmp4516, %m1811$.Type.type** %.tmp4515
br label %.if.end.4513
.if.false.4513:
%.tmp4517 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4518 = icmp ne %m1811$.AssignableInfo.type* %.tmp4517, null
br i1 %.tmp4518, label %.if.true.4519, label %.if.false.4519
.if.true.4519:
%.tmp4520 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4521 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4520, i32 0, i32 3
%.tmp4522 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4523 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4522, i32 0, i32 3
%.tmp4524 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4523
store %m1811$.Type.type* %.tmp4524, %m1811$.Type.type** %.tmp4521
br label %.if.end.4519
.if.false.4519:
br label %.if.end.4519
.if.end.4519:
br label %.if.end.4513
.if.end.4513:
%.tmp4525 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4526 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4527 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4526, i32 0, i32 3
%.tmp4528 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4527
%.tmp4529 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4525, %m1811$.Type.type* %.tmp4528)
%var_type_repr = alloca i8*
store i8* %.tmp4529, i8** %var_type_repr
%.tmp4530 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4531 = icmp ne %m1811$.AssignableInfo.type* %.tmp4530, null
br i1 %.tmp4531, label %.if.true.4532, label %.if.false.4532
.if.true.4532:
%.tmp4533 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4534 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4535 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4534, i32 0, i32 3
%.tmp4536 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4535
%.tmp4537 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4533, %m1811$.Type.type* %.tmp4536)
%a_type_repr = alloca i8*
store i8* %.tmp4537, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4538 = load i8*, i8** %a_type_repr
%.tmp4539 = call i32(i8*) @strlen(i8* %.tmp4538)
%.tmp4540 = load i8*, i8** %var_type_repr
%.tmp4541 = call i32(i8*) @strlen(i8* %.tmp4540)
%.tmp4542 = icmp ne i32 %.tmp4539, %.tmp4541
br i1 %.tmp4542, label %.if.true.4543, label %.if.false.4543
.if.true.4543:
store i1 1, i1* %type_error
br label %.if.end.4543
.if.false.4543:
%.tmp4544 = load i8*, i8** %a_type_repr
%.tmp4545 = load i8*, i8** %var_type_repr
%.tmp4546 = call i32(i8*,i8*) @strcmp(i8* %.tmp4544, i8* %.tmp4545)
%.tmp4547 = icmp ne i32 %.tmp4546, 0
br i1 %.tmp4547, label %.if.true.4548, label %.if.false.4548
.if.true.4548:
store i1 1, i1* %type_error
br label %.if.end.4548
.if.false.4548:
br label %.if.end.4548
.if.end.4548:
br label %.if.end.4543
.if.end.4543:
%.tmp4549 = load i1, i1* %type_error
br i1 %.tmp4549, label %.if.true.4550, label %.if.false.4550
.if.true.4550:
%.tmp4551 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4551, i8** %err_msg
%.tmp4552 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4554 = getelementptr [49 x i8], [49 x i8]*@.str4553, i32 0, i32 0
%.tmp4555 = load i8*, i8** %a_type_repr
%.tmp4556 = load i8*, i8** %var_type_repr
%.tmp4557 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4552, i8* %.tmp4554, i8* %.tmp4555, i8* %.tmp4556)
%.tmp4558 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4559 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4560 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4558, %m286$.Node.type* %.tmp4559, i8* %.tmp4560)
br label %.if.end.4550
.if.false.4550:
br label %.if.end.4550
.if.end.4550:
br label %.if.end.4532
.if.false.4532:
br label %.if.end.4532
.if.end.4532:
%.tmp4561 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4562 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4563 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4562, i32 0, i32 1
%.tmp4564 = load i8*, i8** %.tmp4563
%.tmp4565 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4561, i8* %.tmp4564, %m1811$.AssignableInfo.type* %.tmp4565)
%.tmp4566 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4567 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4566, i32 0, i32 1
%.tmp4568 = load %m0$.File.type*, %m0$.File.type** %.tmp4567
%.tmp4570 = getelementptr [16 x i8], [16 x i8]*@.str4569, i32 0, i32 0
%.tmp4571 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4572 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4571)
%.tmp4573 = load i8*, i8** %var_type_repr
%.tmp4574 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4568, i8* %.tmp4570, i8* %.tmp4572, i8* %.tmp4573)
%.tmp4575 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4576 = icmp ne %m1811$.AssignableInfo.type* %.tmp4575, null
br i1 %.tmp4576, label %.if.true.4577, label %.if.false.4577
.if.true.4577:
%.tmp4578 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4579 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4578, i32 0, i32 1
%.tmp4580 = load %m0$.File.type*, %m0$.File.type** %.tmp4579
%.tmp4582 = getelementptr [21 x i8], [21 x i8]*@.str4581, i32 0, i32 0
%.tmp4583 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4584 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4585 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4584, i32 0, i32 3
%.tmp4586 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4585
%.tmp4587 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4583, %m1811$.Type.type* %.tmp4586)
%.tmp4588 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4589 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4588)
%.tmp4590 = load i8*, i8** %var_type_repr
%.tmp4591 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4592 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4591)
%.tmp4593 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4580, i8* %.tmp4582, i8* %.tmp4587, i8* %.tmp4589, i8* %.tmp4590, i8* %.tmp4592)
br label %.if.end.4577
.if.false.4577:
%.tmp4594 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4595 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4596 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4594, %m286$.Node.type* %.tmp4595, %m1811$.AssignableInfo.type* %.tmp4596)
br label %.if.end.4577
.if.end.4577:
%.tmp4597 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp4597
}
define void @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, %m1811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%.tmp4598 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4599 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4598, i32 0, i32 3
%.tmp4600 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4599
%.tmp4601 = icmp eq %m1811$.Type.type* %.tmp4600, null
br i1 %.tmp4601, label %.if.true.4602, label %.if.false.4602
.if.true.4602:
ret void
br label %.if.end.4602
.if.false.4602:
br label %.if.end.4602
.if.end.4602:
%.tmp4603 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4604 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4605 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4604, i32 0, i32 3
%.tmp4606 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4605
%.tmp4607 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4603, %m1811$.Type.type* %.tmp4606)
%t_repr = alloca i8*
store i8* %.tmp4607, i8** %t_repr
%.tmp4608 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4609 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4608)
%id = alloca i8*
store i8* %.tmp4609, i8** %id
%field_id = alloca i32
store i32 0, i32* %field_id
%field = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %field
%field_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* null, %m1811$.AssignableInfo.type** %field_info
%.tmp4610 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4611 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4610, i32 0, i32 3
%.tmp4612 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4611
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp4612, %m1811$.Type.type** %t
%.tmp4613 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4614 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4613, i32 0, i32 0
%.tmp4615 = load i8*, i8** %.tmp4614
%.tmp4617 = getelementptr [4 x i8], [4 x i8]*@.str4616, i32 0, i32 0
%.tmp4618 = call i32(i8*,i8*) @strcmp(i8* %.tmp4615, i8* %.tmp4617)
%.tmp4619 = icmp eq i32 %.tmp4618, 0
%.tmp4620 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4621 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4620, i32 0, i32 0
%.tmp4622 = load i8*, i8** %.tmp4621
%.tmp4624 = getelementptr [4 x i8], [4 x i8]*@.str4623, i32 0, i32 0
%.tmp4625 = call i32(i8*,i8*) @strcmp(i8* %.tmp4622, i8* %.tmp4624)
%.tmp4626 = icmp eq i32 %.tmp4625, 0
%.tmp4627 = or i1 %.tmp4619, %.tmp4626
%.tmp4628 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4629 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4628, i32 0, i32 0
%.tmp4630 = load i8*, i8** %.tmp4629
%.tmp4632 = getelementptr [5 x i8], [5 x i8]*@.str4631, i32 0, i32 0
%.tmp4633 = call i32(i8*,i8*) @strcmp(i8* %.tmp4630, i8* %.tmp4632)
%.tmp4634 = icmp eq i32 %.tmp4633, 0
%.tmp4635 = or i1 %.tmp4627, %.tmp4634
br i1 %.tmp4635, label %.if.true.4636, label %.if.false.4636
.if.true.4636:
%.tmp4637 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4638 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4637, i32 0, i32 1
%.tmp4639 = load %m0$.File.type*, %m0$.File.type** %.tmp4638
%.tmp4641 = getelementptr [21 x i8], [21 x i8]*@.str4640, i32 0, i32 0
%.tmp4642 = load i8*, i8** %t_repr
%.tmp4643 = load i8*, i8** %t_repr
%.tmp4644 = load i8*, i8** %id
%.tmp4645 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4639, i8* %.tmp4641, i8* %.tmp4642, i32 0, i8* %.tmp4643, i8* %.tmp4644)
br label %.if.end.4636
.if.false.4636:
%.tmp4646 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4647 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4646, i32 0, i32 0
%.tmp4648 = load i8*, i8** %.tmp4647
%.tmp4650 = getelementptr [4 x i8], [4 x i8]*@.str4649, i32 0, i32 0
%.tmp4651 = call i32(i8*,i8*) @strcmp(i8* %.tmp4648, i8* %.tmp4650)
%.tmp4652 = icmp eq i32 %.tmp4651, 0
br i1 %.tmp4652, label %.if.true.4653, label %.if.false.4653
.if.true.4653:
%.tmp4654 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4655 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4654, i32 0, i32 1
%.tmp4656 = load %m0$.File.type*, %m0$.File.type** %.tmp4655
%.tmp4658 = getelementptr [21 x i8], [21 x i8]*@.str4657, i32 0, i32 0
%.tmp4659 = load i8*, i8** %t_repr
%.tmp4661 = getelementptr [5 x i8], [5 x i8]*@.str4660, i32 0, i32 0
%.tmp4662 = load i8*, i8** %t_repr
%.tmp4663 = load i8*, i8** %id
%.tmp4664 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4656, i8* %.tmp4658, i8* %.tmp4659, i8* %.tmp4661, i8* %.tmp4662, i8* %.tmp4663)
br label %.if.end.4653
.if.false.4653:
%.tmp4665 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4666 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4665, i32 0, i32 0
%.tmp4667 = load i8*, i8** %.tmp4666
%.tmp4669 = getelementptr [7 x i8], [7 x i8]*@.str4668, i32 0, i32 0
%.tmp4670 = call i32(i8*,i8*) @strcmp(i8* %.tmp4667, i8* %.tmp4669)
%.tmp4671 = icmp eq i32 %.tmp4670, 0
br i1 %.tmp4671, label %.if.true.4672, label %.if.false.4672
.if.true.4672:
%.tmp4674 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4675 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4674, i32 0, i32 3
%.tmp4676 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4675
store %m1811$.Type.type* %.tmp4676, %m1811$.Type.type** %field
br label %.for.start.4673
.for.start.4673:
%.tmp4677 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4678 = icmp ne %m1811$.Type.type* %.tmp4677, null
br i1 %.tmp4678, label %.for.continue.4673, label %.for.end.4673
.for.continue.4673:
%.tmp4679 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4680 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4679)
store %m1811$.AssignableInfo.type* %.tmp4680, %m1811$.AssignableInfo.type** %field_info
%.tmp4681 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4682 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4681, %m1811$.AssignableInfo.type* %.tmp4682)
%.tmp4683 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4684 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4683, i32 0, i32 3
%.tmp4685 = load %m1811$.Type.type*, %m1811$.Type.type** %field
store %m1811$.Type.type* %.tmp4685, %m1811$.Type.type** %.tmp4684
%.tmp4686 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4687 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4686, i32 0, i32 1
%.tmp4688 = load %m0$.File.type*, %m0$.File.type** %.tmp4687
%.tmp4690 = getelementptr [46 x i8], [46 x i8]*@.str4689, i32 0, i32 0
%.tmp4691 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4692 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4691)
%.tmp4693 = load i8*, i8** %t_repr
%.tmp4694 = load i8*, i8** %t_repr
%.tmp4695 = load i8*, i8** %id
%.tmp4696 = load i32, i32* %field_id
%.tmp4697 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4688, i8* %.tmp4690, i8* %.tmp4692, i8* %.tmp4693, i8* %.tmp4694, i8* %.tmp4695, i32 %.tmp4696)
%.tmp4698 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4699 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4700 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4698, %m286$.Node.type* %.tmp4699, %m1811$.AssignableInfo.type* %.tmp4700)
%.tmp4701 = load i32, i32* %field_id
%.tmp4702 = add i32 %.tmp4701, 1
store i32 %.tmp4702, i32* %field_id
%.tmp4703 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4704 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4703, i32 0, i32 4
%.tmp4705 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4704
store %m1811$.Type.type* %.tmp4705, %m1811$.Type.type** %field
br label %.for.start.4673
.for.end.4673:
br label %.if.end.4672
.if.false.4672:
%.tmp4706 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4707 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4706, i32 0, i32 0
%.tmp4708 = load i8*, i8** %.tmp4707
%.tmp4710 = getelementptr [10 x i8], [10 x i8]*@.str4709, i32 0, i32 0
%.tmp4711 = call i32(i8*,i8*) @strcmp(i8* %.tmp4708, i8* %.tmp4710)
%.tmp4712 = icmp eq i32 %.tmp4711, 0
br i1 %.tmp4712, label %.if.true.4713, label %.if.false.4713
.if.true.4713:
%.tmp4715 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4716 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4715, i32 0, i32 3
%.tmp4717 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4716
%.tmp4718 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4717, i32 0, i32 3
%.tmp4719 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4718
store %m1811$.Type.type* %.tmp4719, %m1811$.Type.type** %field
br label %.for.start.4714
.for.start.4714:
%.tmp4720 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4721 = icmp ne %m1811$.Type.type* %.tmp4720, null
br i1 %.tmp4721, label %.for.continue.4714, label %.for.end.4714
.for.continue.4714:
%.tmp4722 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4723 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4722)
store %m1811$.AssignableInfo.type* %.tmp4723, %m1811$.AssignableInfo.type** %field_info
%.tmp4724 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4725 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4724, %m1811$.AssignableInfo.type* %.tmp4725)
%.tmp4726 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4727 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4726, i32 0, i32 3
%.tmp4728 = load %m1811$.Type.type*, %m1811$.Type.type** %field
store %m1811$.Type.type* %.tmp4728, %m1811$.Type.type** %.tmp4727
%.tmp4729 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4730 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4729, i32 0, i32 1
%.tmp4731 = load %m0$.File.type*, %m0$.File.type** %.tmp4730
%.tmp4733 = getelementptr [46 x i8], [46 x i8]*@.str4732, i32 0, i32 0
%.tmp4734 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4735 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4734)
%.tmp4736 = load i8*, i8** %t_repr
%.tmp4737 = load i8*, i8** %t_repr
%.tmp4738 = load i8*, i8** %id
%.tmp4739 = load i32, i32* %field_id
%.tmp4740 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4731, i8* %.tmp4733, i8* %.tmp4735, i8* %.tmp4736, i8* %.tmp4737, i8* %.tmp4738, i32 %.tmp4739)
%.tmp4741 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4742 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4743 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4741, %m286$.Node.type* %.tmp4742, %m1811$.AssignableInfo.type* %.tmp4743)
%.tmp4744 = load i32, i32* %field_id
%.tmp4745 = add i32 %.tmp4744, 1
store i32 %.tmp4745, i32* %field_id
%.tmp4746 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4747 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4746, i32 0, i32 4
%.tmp4748 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4747
store %m1811$.Type.type* %.tmp4748, %m1811$.Type.type** %field
br label %.for.start.4714
.for.end.4714:
br label %.if.end.4713
.if.false.4713:
%.tmp4749 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4750 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4752 = getelementptr [44 x i8], [44 x i8]*@.str4751, i32 0, i32 0
%.tmp4753 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4749, %m286$.Node.type* %.tmp4750, i8* %.tmp4752)
%.tmp4754 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4755 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4754, i32 0, i32 3
%.tmp4756 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4755
%.tmp4757 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4756, i32 0, i32 0
%.tmp4758 = load i8*, i8** %.tmp4757
%.tmp4759 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4760 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4761 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4760, i32 0, i32 3
%.tmp4762 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4761
%.tmp4763 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4759, %m1811$.Type.type* %.tmp4762)
%.tmp4764 = call i32(i8*,...) @printf(i8* %.tmp4753, i8* %.tmp4758, i8* %.tmp4763)
ret void
br label %.if.end.4713
.if.end.4713:
br label %.if.end.4672
.if.end.4672:
br label %.if.end.4653
.if.end.4653:
br label %.if.end.4636
.if.end.4636:
ret void
}
define void @m1811$compile_if_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4765 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4766 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4765, i32 0, i32 6
%.tmp4767 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4766
%.tmp4769 = getelementptr [11 x i8], [11 x i8]*@.str4768, i32 0, i32 0
%.tmp4770 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4767, i8* %.tmp4769)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4770, %m286$.Node.type** %assignable
%.tmp4771 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4772 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4773 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4771, %m286$.Node.type* %.tmp4772)
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4773, %m1811$.AssignableInfo.type** %a_info
%.tmp4774 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4775 = icmp eq %m1811$.AssignableInfo.type* %.tmp4774, null
br i1 %.tmp4775, label %.if.true.4776, label %.if.false.4776
.if.true.4776:
ret void
br label %.if.end.4776
.if.false.4776:
br label %.if.end.4776
.if.end.4776:
%.tmp4777 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4778 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4777)
%if_id = alloca i32
store i32 %.tmp4778, i32* %if_id
%.tmp4779 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4780 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4779, i32 0, i32 1
%.tmp4781 = load %m0$.File.type*, %m0$.File.type** %.tmp4780
%.tmp4783 = getelementptr [53 x i8], [53 x i8]*@.str4782, i32 0, i32 0
%.tmp4784 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4785 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4786 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4785, i32 0, i32 3
%.tmp4787 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4786
%.tmp4788 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4784, %m1811$.Type.type* %.tmp4787)
%.tmp4789 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4790 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4789)
%.tmp4791 = load i32, i32* %if_id
%.tmp4792 = load i32, i32* %if_id
%.tmp4793 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4781, i8* %.tmp4783, i8* %.tmp4788, i8* %.tmp4790, i32 %.tmp4791, i32 %.tmp4792)
%.tmp4794 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4795 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4794, i32 0, i32 1
%.tmp4796 = load %m0$.File.type*, %m0$.File.type** %.tmp4795
%.tmp4798 = getelementptr [14 x i8], [14 x i8]*@.str4797, i32 0, i32 0
%.tmp4799 = load i32, i32* %if_id
%.tmp4800 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4796, i8* %.tmp4798, i32 %.tmp4799)
%.tmp4801 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4802 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4801, i32 0, i32 6
%.tmp4803 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4802
%.tmp4805 = getelementptr [6 x i8], [6 x i8]*@.str4804, i32 0, i32 0
%.tmp4806 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4803, i8* %.tmp4805)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4806, %m286$.Node.type** %block
%.tmp4807 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4808 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4807, %m286$.Node.type* %.tmp4808)
%.tmp4809 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4810 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4809, i32 0, i32 1
%.tmp4811 = load %m0$.File.type*, %m0$.File.type** %.tmp4810
%.tmp4813 = getelementptr [23 x i8], [23 x i8]*@.str4812, i32 0, i32 0
%.tmp4814 = load i32, i32* %if_id
%.tmp4815 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4811, i8* %.tmp4813, i32 %.tmp4814)
%.tmp4816 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4817 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4816, i32 0, i32 1
%.tmp4818 = load %m0$.File.type*, %m0$.File.type** %.tmp4817
%.tmp4820 = getelementptr [15 x i8], [15 x i8]*@.str4819, i32 0, i32 0
%.tmp4821 = load i32, i32* %if_id
%.tmp4822 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4818, i8* %.tmp4820, i32 %.tmp4821)
%.tmp4823 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4824 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4823, i32 0, i32 6
%.tmp4825 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4824
%.tmp4827 = getelementptr [11 x i8], [11 x i8]*@.str4826, i32 0, i32 0
%.tmp4828 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4825, i8* %.tmp4827)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4828, %m286$.Node.type** %else_block
%.tmp4829 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4830 = icmp ne %m286$.Node.type* %.tmp4829, null
br i1 %.tmp4830, label %.if.true.4831, label %.if.false.4831
.if.true.4831:
%.tmp4832 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4833 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4832, i32 0, i32 6
%.tmp4834 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4833
%.tmp4835 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4834, i32 0, i32 0
%.tmp4836 = load i8*, i8** %.tmp4835
%.tmp4838 = getelementptr [11 x i8], [11 x i8]*@.str4837, i32 0, i32 0
%.tmp4839 = call i32(i8*,i8*) @strcmp(i8* %.tmp4836, i8* %.tmp4838)
%.tmp4840 = icmp eq i32 %.tmp4839, 0
br i1 %.tmp4840, label %.if.true.4841, label %.if.false.4841
.if.true.4841:
%.tmp4842 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4843 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4842, i32 0, i32 6
%.tmp4844 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4843
%.tmp4845 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4844, i32 0, i32 6
%.tmp4846 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4845
%.tmp4848 = getelementptr [6 x i8], [6 x i8]*@.str4847, i32 0, i32 0
%.tmp4849 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4846, i8* %.tmp4848)
store %m286$.Node.type* %.tmp4849, %m286$.Node.type** %block
%.tmp4850 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4851 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4850, %m286$.Node.type* %.tmp4851)
br label %.if.end.4841
.if.false.4841:
%.tmp4852 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4853 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_if_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4852, %m286$.Node.type* %.tmp4853)
br label %.if.end.4841
.if.end.4841:
br label %.if.end.4831
.if.false.4831:
br label %.if.end.4831
.if.end.4831:
%.tmp4854 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4855 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4854, i32 0, i32 1
%.tmp4856 = load %m0$.File.type*, %m0$.File.type** %.tmp4855
%.tmp4858 = getelementptr [23 x i8], [23 x i8]*@.str4857, i32 0, i32 0
%.tmp4859 = load i32, i32* %if_id
%.tmp4860 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4856, i8* %.tmp4858, i32 %.tmp4859)
%.tmp4861 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4862 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4861, i32 0, i32 1
%.tmp4863 = load %m0$.File.type*, %m0$.File.type** %.tmp4862
%.tmp4865 = getelementptr [13 x i8], [13 x i8]*@.str4864, i32 0, i32 0
%.tmp4866 = load i32, i32* %if_id
%.tmp4867 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4863, i8* %.tmp4865, i32 %.tmp4866)
ret void
}
define void @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4868 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4869 = icmp ne %m286$.Node.type* %.tmp4868, null
br i1 %.tmp4869, label %.if.true.4870, label %.if.false.4870
.if.true.4870:
%.tmp4871 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4872 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4871, i32 0, i32 6
%.tmp4873 = load i8*, i8** %.tmp4872
%.tmp4874 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4875 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4874, i32 0, i32 3
%.tmp4876 = load i32, i32* %.tmp4875
%.tmp4877 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4878 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4877, i32 0, i32 4
%.tmp4879 = load i32, i32* %.tmp4878
%.tmp4880 = load i8*, i8** %msg
%.tmp4881 = call %m754$.Error.type*(i8*,i32,i32,i8*) @m754$new.m754$.Error.typep.cp.i.i.cp(i8* %.tmp4873, i32 %.tmp4876, i32 %.tmp4879, i8* %.tmp4880)
%err = alloca %m754$.Error.type*
store %m754$.Error.type* %.tmp4881, %m754$.Error.type** %err
%.tmp4882 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4883 = load %m754$.Error.type*, %m754$.Error.type** %err
call void(%m1811$.CompilerCtx.type*,%m754$.Error.type*) @m1811$append_error.v.m1811$.CompilerCtx.typep.m754$.Error.typep(%m1811$.CompilerCtx.type* %.tmp4882, %m754$.Error.type* %.tmp4883)
br label %.if.end.4870
.if.false.4870:
%.tmp4885 = getelementptr [61 x i8], [61 x i8]*@.str4884, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4885)
br label %.if.end.4870
.if.end.4870:
ret void
}
define void @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%.tmp4886 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4887 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4886)
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp4887, %m1811$.ModuleLookup.type** %mod
%.tmp4888 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4889 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4888, i32 0, i32 3
%.tmp4890 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4889
%.tmp4891 = icmp ne %m1811$.Scope.type* %.tmp4890, null
%.tmp4893 = getelementptr [82 x i8], [82 x i8]*@.str4892, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4891, i8* %.tmp4893)
%.tmp4894 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4895 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4894, i32 0, i32 3
%.tmp4896 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4895
%current_scope = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp4896, %m1811$.Scope.type** %current_scope
%.tmp4897 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* null, i32 1
%.tmp4898 = ptrtoint %m1811$.ScopeItem.type* %.tmp4897 to i32
%.tmp4899 = call i8*(i32) @malloc(i32 %.tmp4898)
%.tmp4900 = bitcast i8* %.tmp4899 to %m1811$.ScopeItem.type*
%newitem = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4900, %m1811$.ScopeItem.type** %newitem
%.tmp4901 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
%.tmp4902 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4901, i32 0, i32 0
%.tmp4903 = load i8*, i8** %name
store i8* %.tmp4903, i8** %.tmp4902
%.tmp4904 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
%.tmp4905 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4904, i32 0, i32 1
%.tmp4906 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
store %m1811$.AssignableInfo.type* %.tmp4906, %m1811$.AssignableInfo.type** %.tmp4905
%.tmp4907 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
%.tmp4908 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4907, i32 0, i32 2
store %m1811$.ScopeItem.type* null, %m1811$.ScopeItem.type** %.tmp4908
%.tmp4909 = load %m1811$.Scope.type*, %m1811$.Scope.type** %current_scope
%.tmp4910 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4909, i32 0, i32 1
%.tmp4911 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4910
%.tmp4912 = icmp eq %m1811$.ScopeItem.type* %.tmp4911, null
br i1 %.tmp4912, label %.if.true.4913, label %.if.false.4913
.if.true.4913:
%.tmp4914 = load %m1811$.Scope.type*, %m1811$.Scope.type** %current_scope
%.tmp4915 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4914, i32 0, i32 1
%.tmp4916 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
store %m1811$.ScopeItem.type* %.tmp4916, %m1811$.ScopeItem.type** %.tmp4915
ret void
br label %.if.end.4913
.if.false.4913:
br label %.if.end.4913
.if.end.4913:
%.tmp4917 = load %m1811$.Scope.type*, %m1811$.Scope.type** %current_scope
%.tmp4918 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4917, i32 0, i32 1
%.tmp4919 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4918
%last_item = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4919, %m1811$.ScopeItem.type** %last_item
br label %.for.start.4920
.for.start.4920:
%.tmp4921 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %last_item
%.tmp4922 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4921, i32 0, i32 2
%.tmp4923 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4922
%.tmp4924 = icmp ne %m1811$.ScopeItem.type* %.tmp4923, null
br i1 %.tmp4924, label %.for.continue.4920, label %.for.end.4920
.for.continue.4920:
%.tmp4925 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %last_item
%.tmp4926 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4925, i32 0, i32 2
%.tmp4927 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4926
store %m1811$.ScopeItem.type* %.tmp4927, %m1811$.ScopeItem.type** %last_item
br label %.for.start.4920
.for.end.4920:
%.tmp4928 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %last_item
%.tmp4929 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4928, i32 0, i32 2
%.tmp4930 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
store %m1811$.ScopeItem.type* %.tmp4930, %m1811$.ScopeItem.type** %.tmp4929
ret void
}
define %m1811$.ScopeItem.type* @m1811$find_defined_in.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%.tmp4931 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4932 = load i8*, i8** %module
%.tmp4933 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4934 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4933, i32 0, i32 1
%.tmp4935 = load i8*, i8** %.tmp4934
%.tmp4936 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp4931, i8* %.tmp4932, i8* %.tmp4935)
%found = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4936, %m1811$.ScopeItem.type** %found
%.tmp4937 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4938 = icmp eq %m1811$.ScopeItem.type* %.tmp4937, null
br i1 %.tmp4938, label %.if.true.4939, label %.if.false.4939
.if.true.4939:
%.tmp4940 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4942 = getelementptr [31 x i8], [31 x i8]*@.str4941, i32 0, i32 0
%.tmp4943 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4944 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4943, i32 0, i32 1
%.tmp4945 = load i8*, i8** %.tmp4944
%.tmp4946 = load i8*, i8** %module
%.tmp4947 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4940, i8* %.tmp4942, i8* %.tmp4945, i8* %.tmp4946)
%.tmp4948 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4949 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4950 = load i8*, i8** %err_buf
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4948, %m286$.Node.type* %.tmp4949, i8* %.tmp4950)
%.tmp4951 = bitcast ptr null to %m1811$.ScopeItem.type*
ret %m1811$.ScopeItem.type* %.tmp4951
br label %.if.end.4939
.if.false.4939:
br label %.if.end.4939
.if.end.4939:
br label %.for.start.4952
.for.start.4952:
%.tmp4953 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4954 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4953, i32 0, i32 7
%.tmp4955 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4954
%.tmp4956 = icmp ne %m286$.Node.type* %.tmp4955, null
%.tmp4957 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4958 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4957, i32 0, i32 1
%.tmp4959 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp4958
%.tmp4960 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4959, i32 0, i32 2
%.tmp4961 = load i8*, i8** %.tmp4960
%.tmp4963 = getelementptr [7 x i8], [7 x i8]*@.str4962, i32 0, i32 0
%.tmp4964 = call i32(i8*,i8*) @strcmp(i8* %.tmp4961, i8* %.tmp4963)
%.tmp4965 = icmp eq i32 %.tmp4964, 0
%.tmp4966 = and i1 %.tmp4956, %.tmp4965
br i1 %.tmp4966, label %.for.continue.4952, label %.for.end.4952
.for.continue.4952:
%.tmp4967 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4968 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4969 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4968, i32 0, i32 1
%.tmp4970 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp4969
%.tmp4971 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4970, i32 0, i32 0
%.tmp4972 = load i8*, i8** %.tmp4971
%.tmp4973 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4974 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4973, i32 0, i32 7
%.tmp4975 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4974
%.tmp4976 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4975, i32 0, i32 7
%.tmp4977 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4976
%.tmp4978 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1811$find_defined_in.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4967, i8* %.tmp4972, %m286$.Node.type* %.tmp4977)
store %m1811$.ScopeItem.type* %.tmp4978, %m1811$.ScopeItem.type** %found
%.tmp4979 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4980 = icmp eq %m1811$.ScopeItem.type* %.tmp4979, null
br i1 %.tmp4980, label %.if.true.4981, label %.if.false.4981
.if.true.4981:
%.tmp4982 = bitcast ptr null to %m1811$.ScopeItem.type*
ret %m1811$.ScopeItem.type* %.tmp4982
br label %.if.end.4981
.if.false.4981:
br label %.if.end.4981
.if.end.4981:
br label %.for.start.4952
.for.end.4952:
%.tmp4983 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
ret %m1811$.ScopeItem.type* %.tmp4983
}
define %m1811$.ScopeItem.type* @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4984 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4985 = load i8*, i8** %module
%.tmp4986 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*,i8*) @m1811$get_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp4984, i8* %.tmp4985)
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp4986, %m1811$.ModuleLookup.type** %mod
%.tmp4987 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4988 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4987, i32 0, i32 3
%.tmp4989 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4988
%.tmp4990 = icmp ne %m1811$.Scope.type* %.tmp4989, null
%.tmp4992 = getelementptr [77 x i8], [77 x i8]*@.str4991, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4990, i8* %.tmp4992)
%.tmp4994 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4995 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4994, i32 0, i32 3
%.tmp4996 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4995
%s = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp4996, %m1811$.Scope.type** %s
br label %.for.start.4993
.for.start.4993:
%.tmp4997 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4998 = icmp ne %m1811$.Scope.type* %.tmp4997, null
br i1 %.tmp4998, label %.for.continue.4993, label %.for.end.4993
.for.continue.4993:
%.tmp5000 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp5001 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp5000, i32 0, i32 1
%.tmp5002 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp5001
%item = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp5002, %m1811$.ScopeItem.type** %item
br label %.for.start.4999
.for.start.4999:
%.tmp5003 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
%.tmp5004 = icmp ne %m1811$.ScopeItem.type* %.tmp5003, null
br i1 %.tmp5004, label %.for.continue.4999, label %.for.end.4999
.for.continue.4999:
%.tmp5005 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
%.tmp5006 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5005, i32 0, i32 0
%.tmp5007 = load i8*, i8** %.tmp5006
%.tmp5008 = load i8*, i8** %assignable_name
%.tmp5009 = call i32(i8*,i8*) @strcmp(i8* %.tmp5007, i8* %.tmp5008)
%.tmp5010 = icmp eq i32 %.tmp5009, 0
br i1 %.tmp5010, label %.if.true.5011, label %.if.false.5011
.if.true.5011:
%.tmp5012 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
ret %m1811$.ScopeItem.type* %.tmp5012
br label %.if.end.5011
.if.false.5011:
br label %.if.end.5011
.if.end.5011:
%.tmp5013 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
%.tmp5014 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5013, i32 0, i32 2
%.tmp5015 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp5014
store %m1811$.ScopeItem.type* %.tmp5015, %m1811$.ScopeItem.type** %item
br label %.for.start.4999
.for.end.4999:
%.tmp5016 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp5017 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp5016, i32 0, i32 5
%.tmp5018 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp5017
store %m1811$.Scope.type* %.tmp5018, %m1811$.Scope.type** %s
br label %.for.start.4993
.for.end.4993:
%.tmp5019 = bitcast ptr null to %m1811$.ScopeItem.type*
ret %m1811$.ScopeItem.type* %.tmp5019
}
define %m1811$.ScopeItem.type* @m1811$find_defined.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp5020 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5021 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5022 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5021, i32 0, i32 6
%.tmp5023 = load i8*, i8** %.tmp5022
%.tmp5024 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp5025 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5024, i32 0, i32 6
%.tmp5026 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5025
%.tmp5027 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1811$find_defined_in.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5020, i8* %.tmp5023, %m286$.Node.type* %.tmp5026)
ret %m1811$.ScopeItem.type* %.tmp5027
}
define %m1811$.AssignableInfo.type* @m1811$get_dotted_name.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dot_name_ptr.arg, %m1811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.dot_name_ptr.arg, %m286$.Node.type** %dot_name_ptr
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp5028 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5029 = icmp eq %m1811$.AssignableInfo.type* %.tmp5028, null
br i1 %.tmp5029, label %.if.true.5030, label %.if.false.5030
.if.true.5030:
%.tmp5031 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5032 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5034 = getelementptr [54 x i8], [54 x i8]*@.str5033, i32 0, i32 0
%.tmp5035 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5031, %m286$.Node.type* %.tmp5032, i8* %.tmp5034)
%.tmp5036 = call i32(i8*,...) @printf(i8* %.tmp5035)
%.tmp5037 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5037
br label %.if.end.5030
.if.false.5030:
br label %.if.end.5030
.if.end.5030:
%.tmp5038 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5039 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5038, i32 0, i32 2
%.tmp5040 = load i8*, i8** %.tmp5039
%.tmp5042 = getelementptr [9 x i8], [9 x i8]*@.str5041, i32 0, i32 0
%.tmp5043 = call i32(i8*,i8*) @strcmp(i8* %.tmp5040, i8* %.tmp5042)
%.tmp5044 = icmp eq i32 %.tmp5043, 0
%.tmp5045 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5046 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5045, i32 0, i32 2
%.tmp5047 = load i8*, i8** %.tmp5046
%.tmp5049 = getelementptr [7 x i8], [7 x i8]*@.str5048, i32 0, i32 0
%.tmp5050 = call i32(i8*,i8*) @strcmp(i8* %.tmp5047, i8* %.tmp5049)
%.tmp5051 = icmp eq i32 %.tmp5050, 0
%.tmp5052 = or i1 %.tmp5044, %.tmp5051
br i1 %.tmp5052, label %.if.true.5053, label %.if.false.5053
.if.true.5053:
%.tmp5054 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5055 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5054, i32 0, i32 7
%.tmp5056 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5055
%.tmp5057 = icmp ne %m286$.Node.type* %.tmp5056, null
br i1 %.tmp5057, label %.if.true.5058, label %.if.false.5058
.if.true.5058:
%.tmp5059 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5061 = getelementptr [46 x i8], [46 x i8]*@.str5060, i32 0, i32 0
%.tmp5062 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5063 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5062, i32 0, i32 7
%.tmp5064 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5063
%.tmp5065 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5064, i32 0, i32 7
%.tmp5066 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5065
%.tmp5067 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5066, i32 0, i32 1
%.tmp5068 = load i8*, i8** %.tmp5067
%.tmp5069 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5070 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5069, i32 0, i32 1
%.tmp5071 = load i8*, i8** %.tmp5070
%.tmp5072 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5059, i8* %.tmp5061, i8* %.tmp5068, i8* %.tmp5071)
%.tmp5073 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5074 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5075 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5073, %m286$.Node.type* %.tmp5074, i8* %.tmp5075)
%.tmp5076 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5076
br label %.if.end.5058
.if.false.5058:
br label %.if.end.5058
.if.end.5058:
%.tmp5077 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5077
br label %.if.end.5053
.if.false.5053:
%.tmp5078 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5079 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5078, i32 0, i32 2
%.tmp5080 = load i8*, i8** %.tmp5079
%.tmp5082 = getelementptr [9 x i8], [9 x i8]*@.str5081, i32 0, i32 0
%.tmp5083 = call i32(i8*,i8*) @strcmp(i8* %.tmp5080, i8* %.tmp5082)
%.tmp5084 = icmp eq i32 %.tmp5083, 0
%.tmp5085 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5086 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5085, i32 0, i32 7
%.tmp5087 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5086
%.tmp5088 = icmp ne %m286$.Node.type* %.tmp5087, null
%.tmp5089 = and i1 %.tmp5084, %.tmp5088
br i1 %.tmp5089, label %.if.true.5090, label %.if.false.5090
.if.true.5090:
%.tmp5091 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%base_var = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5091, %m1811$.AssignableInfo.type** %base_var
%.tmp5092 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5093 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5092, i32 0, i32 3
%.tmp5094 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5093
%struct_info = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5094, %m1811$.Type.type** %struct_info
br label %.for.start.5095
.for.start.5095:
%.tmp5096 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5097 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5096, i32 0, i32 3
%.tmp5098 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5097
%.tmp5099 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5098, i32 0, i32 0
%.tmp5100 = load i8*, i8** %.tmp5099
%.tmp5102 = getelementptr [4 x i8], [4 x i8]*@.str5101, i32 0, i32 0
%.tmp5103 = call i32(i8*,i8*) @strcmp(i8* %.tmp5100, i8* %.tmp5102)
%.tmp5104 = icmp eq i32 %.tmp5103, 0
br i1 %.tmp5104, label %.for.continue.5095, label %.for.end.5095
.for.continue.5095:
%.tmp5105 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5106 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5105)
%new_base = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5106, %m1811$.AssignableInfo.type** %new_base
%.tmp5107 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5108 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5107, %m1811$.AssignableInfo.type* %.tmp5108)
%.tmp5109 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5110 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5109, i32 0, i32 3
%.tmp5111 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5112 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5111, i32 0, i32 3
%.tmp5113 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5112
%.tmp5114 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5113, i32 0, i32 3
%.tmp5115 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5114
store %m1811$.Type.type* %.tmp5115, %m1811$.Type.type** %.tmp5110
%.tmp5116 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5117 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5116, i32 0, i32 1
%.tmp5118 = load %m0$.File.type*, %m0$.File.type** %.tmp5117
%.tmp5120 = getelementptr [23 x i8], [23 x i8]*@.str5119, i32 0, i32 0
%.tmp5121 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5122 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5121)
%.tmp5123 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5124 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5125 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5124, i32 0, i32 3
%.tmp5126 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5125
%.tmp5127 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5123, %m1811$.Type.type* %.tmp5126)
%.tmp5128 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5129 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5130 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5129, i32 0, i32 3
%.tmp5131 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5130
%.tmp5132 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5128, %m1811$.Type.type* %.tmp5131)
%.tmp5133 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5134 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5133)
%.tmp5135 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5118, i8* %.tmp5120, i8* %.tmp5122, i8* %.tmp5127, i8* %.tmp5132, i8* %.tmp5134)
%.tmp5136 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
store %m1811$.AssignableInfo.type* %.tmp5136, %m1811$.AssignableInfo.type** %base_var
%.tmp5137 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5138 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5137, i32 0, i32 3
%.tmp5139 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5138
store %m1811$.Type.type* %.tmp5139, %m1811$.Type.type** %struct_info
br label %.for.start.5095
.for.end.5095:
%.tmp5140 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5141 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5140, i32 0, i32 0
%.tmp5142 = load i8*, i8** %.tmp5141
%.tmp5144 = getelementptr [10 x i8], [10 x i8]*@.str5143, i32 0, i32 0
%.tmp5145 = call i32(i8*,i8*) @strcmp(i8* %.tmp5142, i8* %.tmp5144)
%.tmp5146 = icmp eq i32 %.tmp5145, 0
br i1 %.tmp5146, label %.if.true.5147, label %.if.false.5147
.if.true.5147:
%.tmp5148 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5149 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5148, i32 0, i32 3
%.tmp5150 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5149
store %m1811$.Type.type* %.tmp5150, %m1811$.Type.type** %struct_info
br label %.if.end.5147
.if.false.5147:
br label %.if.end.5147
.if.end.5147:
%.tmp5151 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5152 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5151, i32 0, i32 0
%.tmp5153 = load i8*, i8** %.tmp5152
%.tmp5155 = getelementptr [7 x i8], [7 x i8]*@.str5154, i32 0, i32 0
%.tmp5156 = call i32(i8*,i8*) @strcmp(i8* %.tmp5153, i8* %.tmp5155)
%.tmp5157 = icmp ne i32 %.tmp5156, 0
br i1 %.tmp5157, label %.if.true.5158, label %.if.false.5158
.if.true.5158:
%.tmp5159 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5161 = getelementptr [48 x i8], [48 x i8]*@.str5160, i32 0, i32 0
%.tmp5162 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5163 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5162, i32 0, i32 7
%.tmp5164 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5163
%.tmp5165 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5164, i32 0, i32 7
%.tmp5166 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5165
%.tmp5167 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5166, i32 0, i32 1
%.tmp5168 = load i8*, i8** %.tmp5167
%.tmp5169 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5170 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5169, i32 0, i32 1
%.tmp5171 = load i8*, i8** %.tmp5170
%.tmp5172 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5159, i8* %.tmp5161, i8* %.tmp5168, i8* %.tmp5171)
%.tmp5173 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5174 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5175 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5173, %m286$.Node.type* %.tmp5174, i8* %.tmp5175)
%.tmp5176 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5176
br label %.if.end.5158
.if.false.5158:
br label %.if.end.5158
.if.end.5158:
%.tmp5177 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5178 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5177, i32 0, i32 7
%.tmp5179 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5178
%.tmp5180 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5179, i32 0, i32 7
%.tmp5181 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5180
%.tmp5182 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5181, i32 0, i32 1
%.tmp5183 = load i8*, i8** %.tmp5182
%field_name = alloca i8*
store i8* %.tmp5183, i8** %field_name
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp5184 = bitcast ptr null to %m1811$.Type.type*
%found_field = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5184, %m1811$.Type.type** %found_field
%.tmp5186 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5187 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5186, i32 0, i32 3
%.tmp5188 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5187
%field = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5188, %m1811$.Type.type** %field
br label %.for.start.5185
.for.start.5185:
%.tmp5189 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp5190 = icmp ne %m1811$.Type.type* %.tmp5189, null
br i1 %.tmp5190, label %.for.continue.5185, label %.for.end.5185
.for.continue.5185:
%.tmp5191 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp5192 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5191, i32 0, i32 1
%.tmp5193 = load i8*, i8** %.tmp5192
%.tmp5194 = load i8*, i8** %field_name
%.tmp5195 = call i32(i8*,i8*) @strcmp(i8* %.tmp5193, i8* %.tmp5194)
%.tmp5196 = icmp eq i32 %.tmp5195, 0
br i1 %.tmp5196, label %.if.true.5197, label %.if.false.5197
.if.true.5197:
%.tmp5198 = load %m1811$.Type.type*, %m1811$.Type.type** %field
store %m1811$.Type.type* %.tmp5198, %m1811$.Type.type** %found_field
br label %.for.end.5185
br label %.if.end.5197
.if.false.5197:
%.tmp5199 = load i32, i32* %field_id
%.tmp5200 = add i32 %.tmp5199, 1
store i32 %.tmp5200, i32* %field_id
br label %.if.end.5197
.if.end.5197:
%.tmp5201 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp5202 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5201, i32 0, i32 4
%.tmp5203 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5202
store %m1811$.Type.type* %.tmp5203, %m1811$.Type.type** %field
br label %.for.start.5185
.for.end.5185:
%.tmp5204 = load %m1811$.Type.type*, %m1811$.Type.type** %found_field
%.tmp5205 = icmp eq %m1811$.Type.type* %.tmp5204, null
br i1 %.tmp5205, label %.if.true.5206, label %.if.false.5206
.if.true.5206:
%.tmp5207 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5209 = getelementptr [34 x i8], [34 x i8]*@.str5208, i32 0, i32 0
%.tmp5210 = load i8*, i8** %field_name
%.tmp5211 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5212 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5211, i32 0, i32 1
%.tmp5213 = load i8*, i8** %.tmp5212
%.tmp5214 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5207, i8* %.tmp5209, i8* %.tmp5210, i8* %.tmp5213)
%.tmp5215 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5216 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5217 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5215, %m286$.Node.type* %.tmp5216, i8* %.tmp5217)
%.tmp5218 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5218
br label %.if.end.5206
.if.false.5206:
br label %.if.end.5206
.if.end.5206:
%.tmp5219 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5220 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5219)
%new_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5220, %m1811$.AssignableInfo.type** %new_info
%.tmp5221 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5222 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5221, i32 0, i32 3
%.tmp5223 = load %m1811$.Type.type*, %m1811$.Type.type** %found_field
store %m1811$.Type.type* %.tmp5223, %m1811$.Type.type** %.tmp5222
%.tmp5224 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5225 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5224, %m1811$.AssignableInfo.type* %.tmp5225)
%.tmp5226 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5227 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5226, i32 0, i32 2
%.tmp5229 = getelementptr [9 x i8], [9 x i8]*@.str5228, i32 0, i32 0
store i8* %.tmp5229, i8** %.tmp5227
%.tmp5230 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5231 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5232 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5231, i32 0, i32 3
%.tmp5233 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5232
%.tmp5234 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5230, %m1811$.Type.type* %.tmp5233)
%info_tr = alloca i8*
store i8* %.tmp5234, i8** %info_tr
%.tmp5235 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5236 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5235, i32 0, i32 1
%.tmp5237 = load %m0$.File.type*, %m0$.File.type** %.tmp5236
%.tmp5239 = getelementptr [46 x i8], [46 x i8]*@.str5238, i32 0, i32 0
%.tmp5240 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5241 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5240)
%.tmp5242 = load i8*, i8** %info_tr
%.tmp5243 = load i8*, i8** %info_tr
%.tmp5244 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5245 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5244)
%.tmp5246 = load i32, i32* %field_id
%.tmp5247 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5237, i8* %.tmp5239, i8* %.tmp5241, i8* %.tmp5242, i8* %.tmp5243, i8* %.tmp5245, i32 %.tmp5246)
%.tmp5248 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5249 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5250 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5249, i32 0, i32 7
%.tmp5251 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5250
%.tmp5252 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5251, i32 0, i32 7
%.tmp5253 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5252
%.tmp5254 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5255 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$get_dotted_name.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5248, %m286$.Node.type* %.tmp5253, %m1811$.AssignableInfo.type* %.tmp5254)
ret %m1811$.AssignableInfo.type* %.tmp5255
br label %.if.end.5090
.if.false.5090:
%.tmp5256 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5257 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5256, i32 0, i32 2
%.tmp5258 = load i8*, i8** %.tmp5257
%.tmp5260 = getelementptr [9 x i8], [9 x i8]*@.str5259, i32 0, i32 0
%.tmp5261 = call i32(i8*,i8*) @strcmp(i8* %.tmp5258, i8* %.tmp5260)
%.tmp5262 = icmp eq i32 %.tmp5261, 0
br i1 %.tmp5262, label %.if.true.5263, label %.if.false.5263
.if.true.5263:
%.tmp5264 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5264
br label %.if.end.5263
.if.false.5263:
br label %.if.end.5263
.if.end.5263:
br label %.if.end.5090
.if.end.5090:
br label %.if.end.5053
.if.end.5053:
%.tmp5265 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5266 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5268 = getelementptr [43 x i8], [43 x i8]*@.str5267, i32 0, i32 0
%.tmp5269 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5265, %m286$.Node.type* %.tmp5266, i8* %.tmp5268)
%.tmp5270 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5271 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5270, i32 0, i32 2
%.tmp5272 = load i8*, i8** %.tmp5271
%.tmp5273 = call i32(i8*,...) @printf(i8* %.tmp5269, i8* %.tmp5272)
%.tmp5274 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5274
}
define %m1811$.AssignableInfo.type* @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp5275 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5275, %m286$.Node.type** %curr_node
%.tmp5276 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5277 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5276, i32 0, i32 0
%.tmp5278 = load i8*, i8** %.tmp5277
%.tmp5280 = getelementptr [12 x i8], [12 x i8]*@.str5279, i32 0, i32 0
%.tmp5281 = call i32(i8*,i8*) @strcmp(i8* %.tmp5278, i8* %.tmp5280)
%.tmp5282 = icmp ne i32 %.tmp5281, 0
br i1 %.tmp5282, label %.if.true.5283, label %.if.false.5283
.if.true.5283:
%.tmp5285 = getelementptr [92 x i8], [92 x i8]*@.str5284, i32 0, i32 0
%.tmp5286 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5287 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5286, i32 0, i32 0
%.tmp5288 = load i8*, i8** %.tmp5287
%.tmp5289 = call i32(i8*,...) @printf(i8* %.tmp5285, i8* %.tmp5288)
%.tmp5290 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp5291 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5290, i32 0, i32 6
%.tmp5292 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5291
store %m286$.Node.type* %.tmp5292, %m286$.Node.type** %curr_node
br label %.if.end.5283
.if.false.5283:
br label %.if.end.5283
.if.end.5283:
%.tmp5293 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5294 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5293, i32 0, i32 6
%.tmp5295 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5294
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5295, %m286$.Node.type** %assignable_name
%.tmp5296 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5297 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5298 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5297, i32 0, i32 6
%.tmp5299 = load i8*, i8** %.tmp5298
%.tmp5300 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5301 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5300, i32 0, i32 6
%.tmp5302 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5301
%.tmp5303 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5302, i32 0, i32 1
%.tmp5304 = load i8*, i8** %.tmp5303
%.tmp5305 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp5296, i8* %.tmp5299, i8* %.tmp5304)
%scope_info = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp5305, %m1811$.ScopeItem.type** %scope_info
%.tmp5306 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5307 = icmp eq %m1811$.ScopeItem.type* %.tmp5306, null
br i1 %.tmp5307, label %.if.true.5308, label %.if.false.5308
.if.true.5308:
%.tmp5309 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5311 = getelementptr [41 x i8], [41 x i8]*@.str5310, i32 0, i32 0
%.tmp5312 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5313 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5312, i32 0, i32 6
%.tmp5314 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5313
%.tmp5315 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5314, i32 0, i32 1
%.tmp5316 = load i8*, i8** %.tmp5315
%.tmp5317 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5309, i8* %.tmp5311, i8* %.tmp5316)
%.tmp5318 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5319 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5320 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5318, %m286$.Node.type* %.tmp5319, i8* %.tmp5320)
%.tmp5321 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5321
br label %.if.end.5308
.if.false.5308:
br label %.if.end.5308
.if.end.5308:
%.tmp5322 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5323 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5322, i32 0, i32 1
%.tmp5324 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp5323
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5324, %m1811$.AssignableInfo.type** %info
%.tmp5325 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5326 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5325, i32 0, i32 2
%.tmp5327 = load i8*, i8** %.tmp5326
%.tmp5329 = getelementptr [7 x i8], [7 x i8]*@.str5328, i32 0, i32 0
%.tmp5330 = call i32(i8*,i8*) @strcmp(i8* %.tmp5327, i8* %.tmp5329)
%.tmp5331 = icmp eq i32 %.tmp5330, 0
br i1 %.tmp5331, label %.if.true.5332, label %.if.false.5332
.if.true.5332:
%.tmp5333 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5334 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5335 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5334)
%.tmp5336 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5337 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5336, i32 0, i32 6
%.tmp5338 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5337
%.tmp5339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5338, i32 0, i32 7
%.tmp5340 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5339
%.tmp5341 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5340, i32 0, i32 7
%.tmp5342 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5341
%.tmp5343 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5342, i32 0, i32 1
%.tmp5344 = load i8*, i8** %.tmp5343
%.tmp5345 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp5333, i8* %.tmp5335, i8* %.tmp5344)
store %m1811$.ScopeItem.type* %.tmp5345, %m1811$.ScopeItem.type** %scope_info
%.tmp5346 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5347 = icmp eq %m1811$.ScopeItem.type* %.tmp5346, null
br i1 %.tmp5347, label %.if.true.5348, label %.if.false.5348
.if.true.5348:
%.tmp5349 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5351 = getelementptr [31 x i8], [31 x i8]*@.str5350, i32 0, i32 0
%.tmp5352 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5353 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5352, i32 0, i32 6
%.tmp5354 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5353
%.tmp5355 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5354, i32 0, i32 7
%.tmp5356 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5355
%.tmp5357 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5356, i32 0, i32 7
%.tmp5358 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5357
%.tmp5359 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5358, i32 0, i32 1
%.tmp5360 = load i8*, i8** %.tmp5359
%.tmp5361 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5362 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5361)
%.tmp5363 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5349, i8* %.tmp5351, i8* %.tmp5360, i8* %.tmp5362)
%.tmp5364 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5365 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5366 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5364, %m286$.Node.type* %.tmp5365, i8* %.tmp5366)
%.tmp5367 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5367
br label %.if.end.5348
.if.false.5348:
br label %.if.end.5348
.if.end.5348:
%.tmp5368 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5369 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5368, i32 0, i32 1
%.tmp5370 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp5369
store %m1811$.AssignableInfo.type* %.tmp5370, %m1811$.AssignableInfo.type** %info
%.tmp5371 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5372 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5371, i32 0, i32 6
%.tmp5373 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5372
%.tmp5374 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5373, i32 0, i32 7
%.tmp5375 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5374
%.tmp5376 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5375, i32 0, i32 7
%.tmp5377 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5376
store %m286$.Node.type* %.tmp5377, %m286$.Node.type** %assignable_name
br label %.if.end.5332
.if.false.5332:
%.tmp5378 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5379 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5378, i32 0, i32 6
%.tmp5380 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5379
store %m286$.Node.type* %.tmp5380, %m286$.Node.type** %assignable_name
br label %.if.end.5332
.if.end.5332:
%.tmp5381 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5382 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5383 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5384 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$get_dotted_name.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5381, %m286$.Node.type* %.tmp5382, %m1811$.AssignableInfo.type* %.tmp5383)
%base = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5384, %m1811$.AssignableInfo.type** %base
%.tmp5386 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5387 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5386, i32 0, i32 6
%.tmp5388 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5387
%.tmp5389 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5388, i32 0, i32 7
%.tmp5390 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5389
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5390, %m286$.Node.type** %addr
br label %.for.start.5385
.for.start.5385:
%.tmp5391 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5392 = icmp ne %m286$.Node.type* %.tmp5391, null
br i1 %.tmp5392, label %.for.continue.5385, label %.for.end.5385
.for.continue.5385:
%.tmp5393 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5394 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5393, i32 0, i32 7
%.tmp5395 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5394
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5395, %m286$.Node.type** %index
%.tmp5396 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5397 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp5398 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5396, %m286$.Node.type* %.tmp5397)
%index_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5398, %m1811$.AssignableInfo.type** %index_info
%.tmp5399 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5400 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5401 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5400, i32 0, i32 3
%.tmp5402 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5401
%.tmp5403 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5399, %m1811$.Type.type* %.tmp5402)
%base_type = alloca i8*
store i8* %.tmp5403, i8** %base_type
%.tmp5404 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5405 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %index_info
%.tmp5406 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5405, i32 0, i32 3
%.tmp5407 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5406
%.tmp5408 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5404, %m1811$.Type.type* %.tmp5407)
%index_type = alloca i8*
store i8* %.tmp5408, i8** %index_type
%.tmp5409 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5410 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp5409)
%tmp_id = alloca i32
store i32 %.tmp5410, i32* %tmp_id
%.tmp5411 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5412 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5411, i32 0, i32 1
%.tmp5413 = load %m0$.File.type*, %m0$.File.type** %.tmp5412
%.tmp5415 = getelementptr [28 x i8], [28 x i8]*@.str5414, i32 0, i32 0
%.tmp5416 = load i32, i32* %tmp_id
%.tmp5417 = load i8*, i8** %base_type
%.tmp5418 = load i8*, i8** %base_type
%.tmp5419 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5420 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5419)
%.tmp5421 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5413, i8* %.tmp5415, i32 %.tmp5416, i8* %.tmp5417, i8* %.tmp5418, i8* %.tmp5420)
%.tmp5422 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5423 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5422)
%new_base = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5423, %m1811$.AssignableInfo.type** %new_base
%.tmp5424 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5425 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5424, %m1811$.AssignableInfo.type* %.tmp5425)
%.tmp5426 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5427 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5426, i32 0, i32 3
%.tmp5428 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5427
%.tmp5429 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5428, i32 0, i32 3
%.tmp5430 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5429
%.tmp5431 = icmp eq %m1811$.Type.type* %.tmp5430, null
br i1 %.tmp5431, label %.if.true.5432, label %.if.false.5432
.if.true.5432:
%.tmp5433 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5435 = getelementptr [35 x i8], [35 x i8]*@.str5434, i32 0, i32 0
%.tmp5436 = load i8*, i8** %base_type
%.tmp5437 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5433, i8* %.tmp5435, i8* %.tmp5436)
%.tmp5438 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5439 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5440 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5438, %m286$.Node.type* %.tmp5439, i8* %.tmp5440)
%.tmp5441 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
ret %m1811$.AssignableInfo.type* %.tmp5441
br label %.if.end.5432
.if.false.5432:
br label %.if.end.5432
.if.end.5432:
%.tmp5442 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5443 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5442, i32 0, i32 3
%.tmp5444 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5445 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5444, i32 0, i32 3
%.tmp5446 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5445
%.tmp5447 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5446, i32 0, i32 3
%.tmp5448 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5447
store %m1811$.Type.type* %.tmp5448, %m1811$.Type.type** %.tmp5443
%.tmp5449 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5450 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5451 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5450, i32 0, i32 3
%.tmp5452 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5451
%.tmp5453 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5449, %m1811$.Type.type* %.tmp5452)
%base_type_2 = alloca i8*
store i8* %.tmp5453, i8** %base_type_2
%.tmp5454 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5455 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5454, i32 0, i32 1
%.tmp5456 = load %m0$.File.type*, %m0$.File.type** %.tmp5455
%.tmp5458 = getelementptr [44 x i8], [44 x i8]*@.str5457, i32 0, i32 0
%.tmp5459 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5460 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5459)
%.tmp5461 = load i8*, i8** %base_type_2
%.tmp5462 = load i8*, i8** %base_type_2
%.tmp5463 = load i32, i32* %tmp_id
%.tmp5464 = load i8*, i8** %index_type
%.tmp5465 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %index_info
%.tmp5466 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5465)
%.tmp5467 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5456, i8* %.tmp5458, i8* %.tmp5460, i8* %.tmp5461, i8* %.tmp5462, i32 %.tmp5463, i8* %.tmp5464, i8* %.tmp5466)
%.tmp5468 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
store %m1811$.AssignableInfo.type* %.tmp5468, %m1811$.AssignableInfo.type** %base
%.tmp5469 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5470 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5469, i32 0, i32 7
%.tmp5471 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5470
%.tmp5472 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5471, i32 0, i32 7
%.tmp5473 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5472
%.tmp5474 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5473, i32 0, i32 7
%.tmp5475 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5474
store %m286$.Node.type* %.tmp5475, %m286$.Node.type** %addr
br label %.for.start.5385
.for.end.5385:
%.tmp5476 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
ret %m1811$.AssignableInfo.type* %.tmp5476
}
%m1811$.StackHead.type = type {%m1932$.SYStack.type*}
define %m1811$.AssignableInfo.type* @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5477 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5478 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5477, i32 0, i32 6
%.tmp5479 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5478
%.tmp5480 = icmp eq %m286$.Node.type* %.tmp5479, null
br i1 %.tmp5480, label %.if.true.5481, label %.if.false.5481
.if.true.5481:
%.tmp5483 = getelementptr [15 x i8], [15 x i8]*@.str5482, i32 0, i32 0
%.tmp5484 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5485 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5484, i32 0, i32 0
%.tmp5486 = load i8*, i8** %.tmp5485
%.tmp5487 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5488 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5487, i32 0, i32 1
%.tmp5489 = load i8*, i8** %.tmp5488
%.tmp5490 = call i32(i8*,...) @printf(i8* %.tmp5483, i8* %.tmp5486, i8* %.tmp5489)
br label %.if.end.5481
.if.false.5481:
br label %.if.end.5481
.if.end.5481:
%.tmp5491 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5492 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5491, i32 0, i32 6
%.tmp5493 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5492
%.tmp5495 = getelementptr [16 x i8], [16 x i8]*@.str5494, i32 0, i32 0
%.tmp5496 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5493, i8* %.tmp5495)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5496, %m286$.Node.type** %assignable_start
%.tmp5497 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp5498 = call %m1932$.SYStack.type*(%m286$.Node.type*) @m1932$sy_algorithm.m1932$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5497)
%operator_stack = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp5498, %m1932$.SYStack.type** %operator_stack
%.tmp5499 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* null, i32 1
%.tmp5500 = ptrtoint %m1811$.StackHead.type* %.tmp5499 to i32
%.tmp5501 = call i8*(i32) @malloc(i32 %.tmp5500)
%.tmp5502 = bitcast i8* %.tmp5501 to %m1811$.StackHead.type*
%stack = alloca %m1811$.StackHead.type*
store %m1811$.StackHead.type* %.tmp5502, %m1811$.StackHead.type** %stack
%.tmp5503 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5504 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5503, i32 0, i32 0
%.tmp5505 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %operator_stack
store %m1932$.SYStack.type* %.tmp5505, %m1932$.SYStack.type** %.tmp5504
%.tmp5506 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5507 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5508 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m1811$.StackHead.type*) @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.tmp5506, %m1811$.StackHead.type* %.tmp5507)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5508, %m1811$.AssignableInfo.type** %info
%.tmp5509 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5510 = icmp eq %m1811$.AssignableInfo.type* %.tmp5509, null
br i1 %.tmp5510, label %.if.true.5511, label %.if.false.5511
.if.true.5511:
%.tmp5512 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5512
br label %.if.end.5511
.if.false.5511:
br label %.if.end.5511
.if.end.5511:
%.tmp5513 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5514 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5513, i32 0, i32 6
%.tmp5515 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5514
%.tmp5517 = getelementptr [5 x i8], [5 x i8]*@.str5516, i32 0, i32 0
%.tmp5518 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5515, i8* %.tmp5517)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5518, %m286$.Node.type** %cast
%.tmp5519 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5520 = icmp ne %m286$.Node.type* %.tmp5519, null
br i1 %.tmp5520, label %.if.true.5521, label %.if.false.5521
.if.true.5521:
%.tmp5522 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5523 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5522, i32 0, i32 6
%.tmp5524 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5523
%.tmp5526 = getelementptr [5 x i8], [5 x i8]*@.str5525, i32 0, i32 0
%.tmp5527 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5524, i8* %.tmp5526)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5527, %m286$.Node.type** %cast_type
%.tmp5528 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5529 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5530 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5529, i32 0, i32 6
%.tmp5531 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5530
%.tmp5532 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5528, %m286$.Node.type* %.tmp5531)
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5532, %m1811$.Type.type** %type
%.tmp5533 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5534 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5533)
%prev_id = alloca i8*
store i8* %.tmp5534, i8** %prev_id
%.tmp5535 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5536 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5535, %m1811$.AssignableInfo.type* %.tmp5536)
%.tmp5537 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5538 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5539 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5538, i32 0, i32 3
%.tmp5540 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5539
%.tmp5541 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5537, %m1811$.Type.type* %.tmp5540)
%from_type = alloca i8*
store i8* %.tmp5541, i8** %from_type
%.tmp5542 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5543 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5544 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5542, %m1811$.Type.type* %.tmp5543)
%to_type = alloca i8*
store i8* %.tmp5544, i8** %to_type
%.tmp5546 = getelementptr [8 x i8], [8 x i8]*@.str5545, i32 0, i32 0
%cast_fn = alloca i8*
store i8* %.tmp5546, i8** %cast_fn
%.tmp5547 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5548 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5547, i32 0, i32 3
%.tmp5549 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5548
%.tmp5550 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5549, i32 0, i32 0
%.tmp5551 = load i8*, i8** %.tmp5550
%.tmp5553 = getelementptr [4 x i8], [4 x i8]*@.str5552, i32 0, i32 0
%.tmp5554 = call i32(i8*,i8*) @strcmp(i8* %.tmp5551, i8* %.tmp5553)
%.tmp5555 = icmp ne i32 %.tmp5554, 0
%.tmp5556 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5557 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5556, i32 0, i32 0
%.tmp5558 = load i8*, i8** %.tmp5557
%.tmp5560 = getelementptr [4 x i8], [4 x i8]*@.str5559, i32 0, i32 0
%.tmp5561 = call i32(i8*,i8*) @strcmp(i8* %.tmp5558, i8* %.tmp5560)
%.tmp5562 = icmp ne i32 %.tmp5561, 0
%.tmp5563 = and i1 %.tmp5555, %.tmp5562
br i1 %.tmp5563, label %.if.true.5564, label %.if.false.5564
.if.true.5564:
%.tmp5565 = load i8*, i8** %from_type
%.tmp5566 = getelementptr i8, i8* %.tmp5565, i32 0
%.tmp5567 = load i8, i8* %.tmp5566
%.tmp5568 = icmp eq i8 %.tmp5567, 105
%.tmp5569 = load i8*, i8** %to_type
%.tmp5570 = getelementptr i8, i8* %.tmp5569, i32 0
%.tmp5571 = load i8, i8* %.tmp5570
%.tmp5572 = icmp eq i8 %.tmp5571, 105
%.tmp5573 = and i1 %.tmp5568, %.tmp5572
br i1 %.tmp5573, label %.if.true.5574, label %.if.false.5574
.if.true.5574:
%from_size = alloca i32
store i32 0, i32* %from_size
%to_size = alloca i32
store i32 0, i32* %to_size
%.tmp5575 = load i8*, i8** %from_type
%.tmp5577 = getelementptr [4 x i8], [4 x i8]*@.str5576, i32 0, i32 0
%.tmp5578 = getelementptr i32, i32* %from_size, i32 0
%.tmp5579 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5575, i8* %.tmp5577, i32* %.tmp5578)
%.tmp5580 = load i8*, i8** %to_type
%.tmp5582 = getelementptr [4 x i8], [4 x i8]*@.str5581, i32 0, i32 0
%.tmp5583 = getelementptr i32, i32* %to_size, i32 0
%.tmp5584 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5580, i8* %.tmp5582, i32* %.tmp5583)
%.tmp5585 = load i32, i32* %from_size
%.tmp5586 = load i32, i32* %to_size
%.tmp5587 = icmp slt i32 %.tmp5585, %.tmp5586
br i1 %.tmp5587, label %.if.true.5588, label %.if.false.5588
.if.true.5588:
%.tmp5590 = getelementptr [5 x i8], [5 x i8]*@.str5589, i32 0, i32 0
store i8* %.tmp5590, i8** %cast_fn
br label %.if.end.5588
.if.false.5588:
%.tmp5592 = getelementptr [6 x i8], [6 x i8]*@.str5591, i32 0, i32 0
store i8* %.tmp5592, i8** %cast_fn
br label %.if.end.5588
.if.end.5588:
br label %.if.end.5574
.if.false.5574:
br label %.if.end.5574
.if.end.5574:
br label %.if.end.5564
.if.false.5564:
br label %.if.end.5564
.if.end.5564:
%.tmp5593 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5594 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5593, i32 0, i32 1
%.tmp5595 = load %m0$.File.type*, %m0$.File.type** %.tmp5594
%.tmp5597 = getelementptr [21 x i8], [21 x i8]*@.str5596, i32 0, i32 0
%.tmp5598 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5599 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5598)
%.tmp5600 = load i8*, i8** %cast_fn
%.tmp5601 = load i8*, i8** %from_type
%.tmp5602 = load i8*, i8** %prev_id
%.tmp5603 = load i8*, i8** %to_type
%.tmp5604 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5595, i8* %.tmp5597, i8* %.tmp5599, i8* %.tmp5600, i8* %.tmp5601, i8* %.tmp5602, i8* %.tmp5603)
%.tmp5605 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5606 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5605, i32 0, i32 3
%.tmp5607 = load %m1811$.Type.type*, %m1811$.Type.type** %type
store %m1811$.Type.type* %.tmp5607, %m1811$.Type.type** %.tmp5606
br label %.if.end.5521
.if.false.5521:
br label %.if.end.5521
.if.end.5521:
%.tmp5608 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5608
}
define %m1811$.AssignableInfo.type* @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stack = alloca %m1811$.StackHead.type*
store %m1811$.StackHead.type* %.stack.arg, %m1811$.StackHead.type** %stack
%.tmp5609 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5610 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5609, i32 0, i32 0
%.tmp5611 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5610
%.tmp5612 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5611, i32 0, i32 0
%.tmp5613 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5612
%.tmp5614 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5613, i32 0, i32 0
%.tmp5615 = load i8*, i8** %.tmp5614
%.tmp5617 = getelementptr [16 x i8], [16 x i8]*@.str5616, i32 0, i32 0
%.tmp5618 = call i32(i8*,i8*) @strcmp(i8* %.tmp5615, i8* %.tmp5617)
%.tmp5619 = icmp eq i32 %.tmp5618, 0
br i1 %.tmp5619, label %.if.true.5620, label %.if.false.5620
.if.true.5620:
%.tmp5621 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5622 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5623 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5622, i32 0, i32 0
%.tmp5624 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5623
%.tmp5625 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5624, i32 0, i32 0
%.tmp5626 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5625
%.tmp5627 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_mono_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5621, %m286$.Node.type* %.tmp5626)
ret %m1811$.AssignableInfo.type* %.tmp5627
br label %.if.end.5620
.if.false.5620:
br label %.if.end.5620
.if.end.5620:
%.tmp5628 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5629 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5628, i32 0, i32 0
%.tmp5630 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5629
%.tmp5631 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5630, i32 0, i32 0
%.tmp5632 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5631
%.tmp5633 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5632, i32 0, i32 6
%.tmp5634 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5633
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5634, %m286$.Node.type** %operator
%.tmp5635 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5636 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5635, i32 0, i32 0
%.tmp5637 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5638 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5637, i32 0, i32 0
%.tmp5639 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5638
%.tmp5640 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5639, i32 0, i32 1
%.tmp5641 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5640
store %m1932$.SYStack.type* %.tmp5641, %m1932$.SYStack.type** %.tmp5636
%.tmp5642 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5643 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5644 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m1811$.StackHead.type*) @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.tmp5642, %m1811$.StackHead.type* %.tmp5643)
%A = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5644, %m1811$.AssignableInfo.type** %A
%.tmp5645 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
%.tmp5646 = icmp eq %m1811$.AssignableInfo.type* %.tmp5645, null
br i1 %.tmp5646, label %.if.true.5647, label %.if.false.5647
.if.true.5647:
%.tmp5648 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
ret %m1811$.AssignableInfo.type* %.tmp5648
br label %.if.end.5647
.if.false.5647:
br label %.if.end.5647
.if.end.5647:
%.tmp5649 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5650 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5649, i32 0, i32 0
%.tmp5651 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5652 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5651, i32 0, i32 0
%.tmp5653 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5652
%.tmp5654 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5653, i32 0, i32 1
%.tmp5655 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5654
store %m1932$.SYStack.type* %.tmp5655, %m1932$.SYStack.type** %.tmp5650
%.tmp5656 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5657 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5658 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m1811$.StackHead.type*) @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.tmp5656, %m1811$.StackHead.type* %.tmp5657)
%B = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5658, %m1811$.AssignableInfo.type** %B
%.tmp5659 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %B
%.tmp5660 = icmp eq %m1811$.AssignableInfo.type* %.tmp5659, null
br i1 %.tmp5660, label %.if.true.5661, label %.if.false.5661
.if.true.5661:
%.tmp5662 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %B
ret %m1811$.AssignableInfo.type* %.tmp5662
br label %.if.end.5661
.if.false.5661:
br label %.if.end.5661
.if.end.5661:
%.tmp5663 = bitcast ptr null to %m286$.Node.type*
%.tmp5664 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5663)
%op_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5664, %m1811$.AssignableInfo.type** %op_info
%.tmp5665 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
%.tmp5666 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5665, i32 0, i32 3
%.tmp5667 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5668 = call %m1811$.Type.type*(%m286$.Node.type*) @m1811$operator_type.m1811$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5667)
store %m1811$.Type.type* %.tmp5668, %m1811$.Type.type** %.tmp5666
%.tmp5669 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5670 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5669, %m1811$.AssignableInfo.type* %.tmp5670)
%.tmp5671 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5672 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5671, i32 0, i32 1
%.tmp5673 = load %m0$.File.type*, %m0$.File.type** %.tmp5672
%.tmp5675 = getelementptr [19 x i8], [19 x i8]*@.str5674, i32 0, i32 0
%.tmp5676 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
%.tmp5677 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5676)
%.tmp5678 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5679 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5680 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$operator_op.cp.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5678, %m286$.Node.type* %.tmp5679)
%.tmp5681 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5682 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
%.tmp5683 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5682, i32 0, i32 3
%.tmp5684 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5683
%.tmp5685 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5681, %m1811$.Type.type* %.tmp5684)
%.tmp5686 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
%.tmp5687 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5686)
%.tmp5688 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %B
%.tmp5689 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5688)
%.tmp5690 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5673, i8* %.tmp5675, i8* %.tmp5677, i8* %.tmp5680, i8* %.tmp5685, i8* %.tmp5687, i8* %.tmp5689)
%.tmp5691 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
ret %m1811$.AssignableInfo.type* %.tmp5691
}
define i8* @m1811$operator_op.cp.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5692 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5693 = icmp eq %m286$.Node.type* %.tmp5692, null
br i1 %.tmp5693, label %.if.true.5694, label %.if.false.5694
.if.true.5694:
%.tmp5695 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5696 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5698 = getelementptr [31 x i8], [31 x i8]*@.str5697, i32 0, i32 0
%.tmp5699 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5695, %m286$.Node.type* %.tmp5696, i8* %.tmp5698)
%.tmp5700 = call i32(i8*,...) @printf(i8* %.tmp5699)
br label %.if.end.5694
.if.false.5694:
br label %.if.end.5694
.if.end.5694:
%.tmp5701 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5702 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5701, i32 0, i32 1
%.tmp5703 = load i8*, i8** %.tmp5702
%.tmp5705 = getelementptr [2 x i8], [2 x i8]*@.str5704, i32 0, i32 0
%.tmp5706 = call i32(i8*,i8*) @strcmp(i8* %.tmp5703, i8* %.tmp5705)
%.tmp5707 = icmp eq i32 %.tmp5706, 0
br i1 %.tmp5707, label %.if.true.5708, label %.if.false.5708
.if.true.5708:
%.tmp5710 = getelementptr [4 x i8], [4 x i8]*@.str5709, i32 0, i32 0
ret i8* %.tmp5710
br label %.if.end.5708
.if.false.5708:
%.tmp5711 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5712 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5711, i32 0, i32 1
%.tmp5713 = load i8*, i8** %.tmp5712
%.tmp5715 = getelementptr [2 x i8], [2 x i8]*@.str5714, i32 0, i32 0
%.tmp5716 = call i32(i8*,i8*) @strcmp(i8* %.tmp5713, i8* %.tmp5715)
%.tmp5717 = icmp eq i32 %.tmp5716, 0
br i1 %.tmp5717, label %.if.true.5718, label %.if.false.5718
.if.true.5718:
%.tmp5720 = getelementptr [4 x i8], [4 x i8]*@.str5719, i32 0, i32 0
ret i8* %.tmp5720
br label %.if.end.5718
.if.false.5718:
%.tmp5721 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5722 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5721, i32 0, i32 1
%.tmp5723 = load i8*, i8** %.tmp5722
%.tmp5725 = getelementptr [2 x i8], [2 x i8]*@.str5724, i32 0, i32 0
%.tmp5726 = call i32(i8*,i8*) @strcmp(i8* %.tmp5723, i8* %.tmp5725)
%.tmp5727 = icmp eq i32 %.tmp5726, 0
br i1 %.tmp5727, label %.if.true.5728, label %.if.false.5728
.if.true.5728:
%.tmp5730 = getelementptr [4 x i8], [4 x i8]*@.str5729, i32 0, i32 0
ret i8* %.tmp5730
br label %.if.end.5728
.if.false.5728:
%.tmp5731 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5732 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5731, i32 0, i32 1
%.tmp5733 = load i8*, i8** %.tmp5732
%.tmp5735 = getelementptr [2 x i8], [2 x i8]*@.str5734, i32 0, i32 0
%.tmp5736 = call i32(i8*,i8*) @strcmp(i8* %.tmp5733, i8* %.tmp5735)
%.tmp5737 = icmp eq i32 %.tmp5736, 0
br i1 %.tmp5737, label %.if.true.5738, label %.if.false.5738
.if.true.5738:
%.tmp5740 = getelementptr [5 x i8], [5 x i8]*@.str5739, i32 0, i32 0
ret i8* %.tmp5740
br label %.if.end.5738
.if.false.5738:
%.tmp5741 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5742 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5741, i32 0, i32 1
%.tmp5743 = load i8*, i8** %.tmp5742
%.tmp5745 = getelementptr [3 x i8], [3 x i8]*@.str5744, i32 0, i32 0
%.tmp5746 = call i32(i8*,i8*) @strcmp(i8* %.tmp5743, i8* %.tmp5745)
%.tmp5747 = icmp eq i32 %.tmp5746, 0
br i1 %.tmp5747, label %.if.true.5748, label %.if.false.5748
.if.true.5748:
%.tmp5750 = getelementptr [8 x i8], [8 x i8]*@.str5749, i32 0, i32 0
ret i8* %.tmp5750
br label %.if.end.5748
.if.false.5748:
%.tmp5751 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5752 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5751, i32 0, i32 1
%.tmp5753 = load i8*, i8** %.tmp5752
%.tmp5755 = getelementptr [3 x i8], [3 x i8]*@.str5754, i32 0, i32 0
%.tmp5756 = call i32(i8*,i8*) @strcmp(i8* %.tmp5753, i8* %.tmp5755)
%.tmp5757 = icmp eq i32 %.tmp5756, 0
br i1 %.tmp5757, label %.if.true.5758, label %.if.false.5758
.if.true.5758:
%.tmp5760 = getelementptr [8 x i8], [8 x i8]*@.str5759, i32 0, i32 0
ret i8* %.tmp5760
br label %.if.end.5758
.if.false.5758:
%.tmp5761 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5762 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5761, i32 0, i32 1
%.tmp5763 = load i8*, i8** %.tmp5762
%.tmp5765 = getelementptr [2 x i8], [2 x i8]*@.str5764, i32 0, i32 0
%.tmp5766 = call i32(i8*,i8*) @strcmp(i8* %.tmp5763, i8* %.tmp5765)
%.tmp5767 = icmp eq i32 %.tmp5766, 0
br i1 %.tmp5767, label %.if.true.5768, label %.if.false.5768
.if.true.5768:
%.tmp5770 = getelementptr [9 x i8], [9 x i8]*@.str5769, i32 0, i32 0
ret i8* %.tmp5770
br label %.if.end.5768
.if.false.5768:
%.tmp5771 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5772 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5771, i32 0, i32 1
%.tmp5773 = load i8*, i8** %.tmp5772
%.tmp5775 = getelementptr [2 x i8], [2 x i8]*@.str5774, i32 0, i32 0
%.tmp5776 = call i32(i8*,i8*) @strcmp(i8* %.tmp5773, i8* %.tmp5775)
%.tmp5777 = icmp eq i32 %.tmp5776, 0
br i1 %.tmp5777, label %.if.true.5778, label %.if.false.5778
.if.true.5778:
%.tmp5780 = getelementptr [9 x i8], [9 x i8]*@.str5779, i32 0, i32 0
ret i8* %.tmp5780
br label %.if.end.5778
.if.false.5778:
%.tmp5781 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5782 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5781, i32 0, i32 1
%.tmp5783 = load i8*, i8** %.tmp5782
%.tmp5785 = getelementptr [2 x i8], [2 x i8]*@.str5784, i32 0, i32 0
%.tmp5786 = call i32(i8*,i8*) @strcmp(i8* %.tmp5783, i8* %.tmp5785)
%.tmp5787 = icmp eq i32 %.tmp5786, 0
br i1 %.tmp5787, label %.if.true.5788, label %.if.false.5788
.if.true.5788:
%.tmp5790 = getelementptr [4 x i8], [4 x i8]*@.str5789, i32 0, i32 0
ret i8* %.tmp5790
br label %.if.end.5788
.if.false.5788:
%.tmp5791 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5792 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5791, i32 0, i32 1
%.tmp5793 = load i8*, i8** %.tmp5792
%.tmp5795 = getelementptr [2 x i8], [2 x i8]*@.str5794, i32 0, i32 0
%.tmp5796 = call i32(i8*,i8*) @strcmp(i8* %.tmp5793, i8* %.tmp5795)
%.tmp5797 = icmp eq i32 %.tmp5796, 0
br i1 %.tmp5797, label %.if.true.5798, label %.if.false.5798
.if.true.5798:
%.tmp5800 = getelementptr [3 x i8], [3 x i8]*@.str5799, i32 0, i32 0
ret i8* %.tmp5800
br label %.if.end.5798
.if.false.5798:
%.tmp5801 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5802 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5801, i32 0, i32 1
%.tmp5803 = load i8*, i8** %.tmp5802
%.tmp5805 = getelementptr [3 x i8], [3 x i8]*@.str5804, i32 0, i32 0
%.tmp5806 = call i32(i8*,i8*) @strcmp(i8* %.tmp5803, i8* %.tmp5805)
%.tmp5807 = icmp eq i32 %.tmp5806, 0
br i1 %.tmp5807, label %.if.true.5808, label %.if.false.5808
.if.true.5808:
%.tmp5810 = getelementptr [9 x i8], [9 x i8]*@.str5809, i32 0, i32 0
ret i8* %.tmp5810
br label %.if.end.5808
.if.false.5808:
%.tmp5811 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5812 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5811, i32 0, i32 1
%.tmp5813 = load i8*, i8** %.tmp5812
%.tmp5815 = getelementptr [3 x i8], [3 x i8]*@.str5814, i32 0, i32 0
%.tmp5816 = call i32(i8*,i8*) @strcmp(i8* %.tmp5813, i8* %.tmp5815)
%.tmp5817 = icmp eq i32 %.tmp5816, 0
br i1 %.tmp5817, label %.if.true.5818, label %.if.false.5818
.if.true.5818:
%.tmp5820 = getelementptr [9 x i8], [9 x i8]*@.str5819, i32 0, i32 0
ret i8* %.tmp5820
br label %.if.end.5818
.if.false.5818:
%.tmp5821 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5822 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5824 = getelementptr [30 x i8], [30 x i8]*@.str5823, i32 0, i32 0
%.tmp5825 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5821, %m286$.Node.type* %.tmp5822, i8* %.tmp5824)
%.tmp5826 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5827 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5826, i32 0, i32 1
%.tmp5828 = load i8*, i8** %.tmp5827
%.tmp5829 = call i32(i8*,...) @printf(i8* %.tmp5825, i8* %.tmp5828)
br label %.if.end.5818
.if.end.5818:
br label %.if.end.5808
.if.end.5808:
br label %.if.end.5798
.if.end.5798:
br label %.if.end.5788
.if.end.5788:
br label %.if.end.5778
.if.end.5778:
br label %.if.end.5768
.if.end.5768:
br label %.if.end.5758
.if.end.5758:
br label %.if.end.5748
.if.end.5748:
br label %.if.end.5738
.if.end.5738:
br label %.if.end.5728
.if.end.5728:
br label %.if.end.5718
.if.end.5718:
br label %.if.end.5708
.if.end.5708:
%.tmp5831 = getelementptr [4 x i8], [4 x i8]*@.str5830, i32 0, i32 0
ret i8* %.tmp5831
}
define %m1811$.Type.type* @m1811$operator_type.m1811$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5832 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5832, %m1811$.Type.type** %type
%.tmp5833 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5833, i32 0, i32 1
%.tmp5835 = load i8*, i8** %.tmp5834
%.tmp5837 = getelementptr [3 x i8], [3 x i8]*@.str5836, i32 0, i32 0
%.tmp5838 = call i32(i8*,i8*) @strcmp(i8* %.tmp5835, i8* %.tmp5837)
%.tmp5839 = icmp eq i32 %.tmp5838, 0
%.tmp5840 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5841 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5840, i32 0, i32 1
%.tmp5842 = load i8*, i8** %.tmp5841
%.tmp5844 = getelementptr [3 x i8], [3 x i8]*@.str5843, i32 0, i32 0
%.tmp5845 = call i32(i8*,i8*) @strcmp(i8* %.tmp5842, i8* %.tmp5844)
%.tmp5846 = icmp eq i32 %.tmp5845, 0
%.tmp5847 = or i1 %.tmp5839, %.tmp5846
%.tmp5848 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5849 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5848, i32 0, i32 1
%.tmp5850 = load i8*, i8** %.tmp5849
%.tmp5852 = getelementptr [2 x i8], [2 x i8]*@.str5851, i32 0, i32 0
%.tmp5853 = call i32(i8*,i8*) @strcmp(i8* %.tmp5850, i8* %.tmp5852)
%.tmp5854 = icmp eq i32 %.tmp5853, 0
%.tmp5855 = or i1 %.tmp5847, %.tmp5854
%.tmp5856 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5857 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5856, i32 0, i32 1
%.tmp5858 = load i8*, i8** %.tmp5857
%.tmp5860 = getelementptr [2 x i8], [2 x i8]*@.str5859, i32 0, i32 0
%.tmp5861 = call i32(i8*,i8*) @strcmp(i8* %.tmp5858, i8* %.tmp5860)
%.tmp5862 = icmp eq i32 %.tmp5861, 0
%.tmp5863 = or i1 %.tmp5855, %.tmp5862
%.tmp5864 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5865 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5864, i32 0, i32 1
%.tmp5866 = load i8*, i8** %.tmp5865
%.tmp5868 = getelementptr [2 x i8], [2 x i8]*@.str5867, i32 0, i32 0
%.tmp5869 = call i32(i8*,i8*) @strcmp(i8* %.tmp5866, i8* %.tmp5868)
%.tmp5870 = icmp eq i32 %.tmp5869, 0
%.tmp5871 = or i1 %.tmp5863, %.tmp5870
%.tmp5872 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5873 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5872, i32 0, i32 1
%.tmp5874 = load i8*, i8** %.tmp5873
%.tmp5876 = getelementptr [2 x i8], [2 x i8]*@.str5875, i32 0, i32 0
%.tmp5877 = call i32(i8*,i8*) @strcmp(i8* %.tmp5874, i8* %.tmp5876)
%.tmp5878 = icmp eq i32 %.tmp5877, 0
%.tmp5879 = or i1 %.tmp5871, %.tmp5878
%.tmp5880 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5881 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5880, i32 0, i32 1
%.tmp5882 = load i8*, i8** %.tmp5881
%.tmp5884 = getelementptr [3 x i8], [3 x i8]*@.str5883, i32 0, i32 0
%.tmp5885 = call i32(i8*,i8*) @strcmp(i8* %.tmp5882, i8* %.tmp5884)
%.tmp5886 = icmp eq i32 %.tmp5885, 0
%.tmp5887 = or i1 %.tmp5879, %.tmp5886
%.tmp5888 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5889 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5888, i32 0, i32 1
%.tmp5890 = load i8*, i8** %.tmp5889
%.tmp5892 = getelementptr [3 x i8], [3 x i8]*@.str5891, i32 0, i32 0
%.tmp5893 = call i32(i8*,i8*) @strcmp(i8* %.tmp5890, i8* %.tmp5892)
%.tmp5894 = icmp eq i32 %.tmp5893, 0
%.tmp5895 = or i1 %.tmp5887, %.tmp5894
br i1 %.tmp5895, label %.if.true.5896, label %.if.false.5896
.if.true.5896:
%.tmp5897 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5898 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5897, i32 0, i32 0
%.tmp5900 = getelementptr [5 x i8], [5 x i8]*@.str5899, i32 0, i32 0
store i8* %.tmp5900, i8** %.tmp5898
br label %.if.end.5896
.if.false.5896:
%.tmp5901 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5902 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5901, i32 0, i32 0
%.tmp5904 = getelementptr [4 x i8], [4 x i8]*@.str5903, i32 0, i32 0
store i8* %.tmp5904, i8** %.tmp5902
br label %.if.end.5896
.if.end.5896:
%.tmp5905 = load %m1811$.Type.type*, %m1811$.Type.type** %type
ret %m1811$.Type.type* %.tmp5905
}
define %m1811$.AssignableInfo.type* @m1811$compile_mono_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5906 = bitcast ptr null to %m1811$.AssignableInfo.type*
%assignable_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5906, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5907 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5907, %m286$.Node.type** %mono
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp5908 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5909 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5908, i32 0, i32 6
%.tmp5910 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5909
%.tmp5911 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5910, i32 0, i32 0
%.tmp5912 = load i8*, i8** %.tmp5911
%.tmp5914 = getelementptr [7 x i8], [7 x i8]*@.str5913, i32 0, i32 0
%.tmp5915 = call i32(i8*,i8*) @strcmp(i8* %.tmp5912, i8* %.tmp5914)
%.tmp5916 = icmp eq i32 %.tmp5915, 0
br i1 %.tmp5916, label %.if.true.5917, label %.if.false.5917
.if.true.5917:
%.tmp5918 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5919 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5918)
store %m1811$.AssignableInfo.type* %.tmp5919, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5920 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5921 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5920, i32 0, i32 3
%.tmp5922 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp5922, %m1811$.Type.type** %.tmp5921
%.tmp5923 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5924 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5923, i32 0, i32 3
%.tmp5925 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5924
%.tmp5926 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5925, i32 0, i32 0
%.tmp5928 = getelementptr [4 x i8], [4 x i8]*@.str5927, i32 0, i32 0
store i8* %.tmp5928, i8** %.tmp5926
%.tmp5929 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5930 = load i8, i8* @SCOPE_CONST
%.tmp5931 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5932 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5931, i32 0, i32 6
%.tmp5933 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5932
%.tmp5934 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5933, i32 0, i32 1
%.tmp5935 = load i8*, i8** %.tmp5934
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp5929, i8 %.tmp5930, i8* %.tmp5935)
br label %.if.end.5917
.if.false.5917:
%.tmp5936 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5936, i32 0, i32 6
%.tmp5938 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5937
%.tmp5939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5938, i32 0, i32 0
%.tmp5940 = load i8*, i8** %.tmp5939
%.tmp5942 = getelementptr [5 x i8], [5 x i8]*@.str5941, i32 0, i32 0
%.tmp5943 = call i32(i8*,i8*) @strcmp(i8* %.tmp5940, i8* %.tmp5942)
%.tmp5944 = icmp eq i32 %.tmp5943, 0
br i1 %.tmp5944, label %.if.true.5945, label %.if.false.5945
.if.true.5945:
%.tmp5946 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5947 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5946, i32 0, i32 6
%.tmp5948 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5947
%.tmp5949 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5948, i32 0, i32 1
%.tmp5950 = load i8*, i8** %.tmp5949
%.tmp5952 = getelementptr [5 x i8], [5 x i8]*@.str5951, i32 0, i32 0
%.tmp5953 = call i32(i8*,i8*) @strcmp(i8* %.tmp5950, i8* %.tmp5952)
%.tmp5954 = icmp ne i32 %.tmp5953, 0
br i1 %.tmp5954, label %.if.true.5955, label %.if.false.5955
.if.true.5955:
%.tmp5956 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5957 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5959 = getelementptr [42 x i8], [42 x i8]*@.str5958, i32 0, i32 0
%.tmp5960 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5956, %m286$.Node.type* %.tmp5957, i8* %.tmp5959)
%.tmp5961 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5962 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5961, i32 0, i32 6
%.tmp5963 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5962
%.tmp5964 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5963, i32 0, i32 1
%.tmp5965 = load i8*, i8** %.tmp5964
%.tmp5966 = call i32(i8*,...) @printf(i8* %.tmp5960, i8* %.tmp5965)
%.tmp5967 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5967
br label %.if.end.5955
.if.false.5955:
br label %.if.end.5955
.if.end.5955:
%.tmp5968 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5969 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5968)
store %m1811$.AssignableInfo.type* %.tmp5969, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5970 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5971 = load i8, i8* @SCOPE_CONST
%.tmp5973 = getelementptr [5 x i8], [5 x i8]*@.str5972, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp5970, i8 %.tmp5971, i8* %.tmp5973)
%.tmp5974 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5975 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5974, i32 0, i32 3
%.tmp5976 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp5976, %m1811$.Type.type** %.tmp5975
%.tmp5977 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5978 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5977, i32 0, i32 3
%.tmp5979 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5978
%.tmp5980 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5979, i32 0, i32 0
%.tmp5982 = getelementptr [8 x i8], [8 x i8]*@.str5981, i32 0, i32 0
store i8* %.tmp5982, i8** %.tmp5980
br label %.if.end.5945
.if.false.5945:
%.tmp5983 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5984 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5983, i32 0, i32 6
%.tmp5985 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5984
%.tmp5986 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5985, i32 0, i32 0
%.tmp5987 = load i8*, i8** %.tmp5986
%.tmp5989 = getelementptr [17 x i8], [17 x i8]*@.str5988, i32 0, i32 0
%.tmp5990 = call i32(i8*,i8*) @strcmp(i8* %.tmp5987, i8* %.tmp5989)
%.tmp5991 = icmp eq i32 %.tmp5990, 0
br i1 %.tmp5991, label %.if.true.5992, label %.if.false.5992
.if.true.5992:
%.tmp5993 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5994 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5993)
store %m1811$.AssignableInfo.type* %.tmp5994, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5995 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5996 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5995, i32 0, i32 6
%.tmp5997 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5996
%.tmp5998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5997, i32 0, i32 6
%.tmp5999 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5998
%.tmp6001 = getelementptr [12 x i8], [12 x i8]*@.str6000, i32 0, i32 0
%.tmp6002 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5999, i8* %.tmp6001)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6002, %m286$.Node.type** %dest
%.tmp6003 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6004 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6005 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6003, %m286$.Node.type* %.tmp6004)
%var_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6005, %m1811$.AssignableInfo.type** %var_info
%.tmp6006 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6007 = icmp eq %m1811$.AssignableInfo.type* %.tmp6006, null
br i1 %.tmp6007, label %.if.true.6008, label %.if.false.6008
.if.true.6008:
%.tmp6009 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
ret %m1811$.AssignableInfo.type* %.tmp6009
br label %.if.end.6008
.if.false.6008:
br label %.if.end.6008
.if.end.6008:
%.tmp6010 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6011 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6012 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6011, i32 0, i32 3
%.tmp6013 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6012
%.tmp6014 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6010, %m1811$.Type.type* %.tmp6013)
%var_type_repr = alloca i8*
store i8* %.tmp6014, i8** %var_type_repr
%.tmp6015 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6016 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp6015, %m1811$.AssignableInfo.type* %.tmp6016)
%.tmp6017 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6018 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6017, i32 0, i32 3
%.tmp6019 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6020 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6019, i32 0, i32 3
%.tmp6021 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6020
store %m1811$.Type.type* %.tmp6021, %m1811$.Type.type** %.tmp6018
%.tmp6023 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6023, i32 0, i32 6
%.tmp6025 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6024
%.tmp6026 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6025, i32 0, i32 6
%.tmp6027 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6026
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6027, %m286$.Node.type** %ptr
br label %.for.start.6022
.for.start.6022:
%.tmp6028 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6029 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6030 = icmp ne %m286$.Node.type* %.tmp6028, %.tmp6029
br i1 %.tmp6030, label %.for.continue.6022, label %.for.end.6022
.for.continue.6022:
%.tmp6031 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6031, %m1811$.Type.type** %type
%.tmp6032 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6033 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6032, i32 0, i32 3
%.tmp6034 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6035 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6034, i32 0, i32 3
%.tmp6036 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6035
store %m1811$.Type.type* %.tmp6036, %m1811$.Type.type** %.tmp6033
%.tmp6037 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6038 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6037, i32 0, i32 0
%.tmp6040 = getelementptr [4 x i8], [4 x i8]*@.str6039, i32 0, i32 0
store i8* %.tmp6040, i8** %.tmp6038
%.tmp6041 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6042 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6041, i32 0, i32 3
%.tmp6043 = load %m1811$.Type.type*, %m1811$.Type.type** %type
store %m1811$.Type.type* %.tmp6043, %m1811$.Type.type** %.tmp6042
%.tmp6044 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6045 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6044, i32 0, i32 7
%.tmp6046 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6045
store %m286$.Node.type* %.tmp6046, %m286$.Node.type** %ptr
br label %.for.start.6022
.for.end.6022:
%.tmp6047 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6047, i32 0, i32 6
%.tmp6049 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6048
%.tmp6050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6049, i32 0, i32 6
%.tmp6051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6050
%.tmp6052 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6053 = icmp ne %m286$.Node.type* %.tmp6051, %.tmp6052
br i1 %.tmp6053, label %.if.true.6054, label %.if.false.6054
.if.true.6054:
%.tmp6055 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6056 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6055, i32 0, i32 1
%.tmp6057 = load %m0$.File.type*, %m0$.File.type** %.tmp6056
%.tmp6059 = getelementptr [38 x i8], [38 x i8]*@.str6058, i32 0, i32 0
%.tmp6060 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6061 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6060)
%.tmp6062 = load i8*, i8** %var_type_repr
%.tmp6063 = load i8*, i8** %var_type_repr
%.tmp6064 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6065 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6064)
%.tmp6066 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6057, i8* %.tmp6059, i8* %.tmp6061, i8* %.tmp6062, i8* %.tmp6063, i8* %.tmp6065)
br label %.if.end.6054
.if.false.6054:
%.tmp6067 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6068 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6067, i32 0, i32 1
%.tmp6069 = load %m0$.File.type*, %m0$.File.type** %.tmp6068
%.tmp6071 = getelementptr [22 x i8], [22 x i8]*@.str6070, i32 0, i32 0
%.tmp6072 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6073 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6072)
%.tmp6074 = load i8*, i8** %var_type_repr
%.tmp6075 = load i8*, i8** %var_type_repr
%.tmp6076 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6077 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6076)
%.tmp6078 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6069, i8* %.tmp6071, i8* %.tmp6073, i8* %.tmp6074, i8* %.tmp6075, i8* %.tmp6077)
br label %.if.end.6054
.if.end.6054:
br label %.if.end.5992
.if.false.5992:
%.tmp6079 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6080 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6079, i32 0, i32 6
%.tmp6081 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6080
%.tmp6082 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6081, i32 0, i32 0
%.tmp6083 = load i8*, i8** %.tmp6082
%.tmp6085 = getelementptr [8 x i8], [8 x i8]*@.str6084, i32 0, i32 0
%.tmp6086 = call i32(i8*,i8*) @strcmp(i8* %.tmp6083, i8* %.tmp6085)
%.tmp6087 = icmp eq i32 %.tmp6086, 0
br i1 %.tmp6087, label %.if.true.6088, label %.if.false.6088
.if.true.6088:
%.tmp6089 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6090 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6089)
store %m1811$.AssignableInfo.type* %.tmp6090, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6091 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6092 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6091, i32 0, i32 3
%.tmp6093 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6093, %m1811$.Type.type** %.tmp6092
%.tmp6094 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6095 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6094, i32 0, i32 3
%.tmp6096 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6095
%.tmp6097 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6096, i32 0, i32 0
%.tmp6099 = getelementptr [5 x i8], [5 x i8]*@.str6098, i32 0, i32 0
store i8* %.tmp6099, i8** %.tmp6097
%.tmp6100 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6101 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6100, i32 0, i32 6
%.tmp6102 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6101
%.tmp6103 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6102, i32 0, i32 6
%.tmp6104 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6103
%.tmp6105 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6104, i32 0, i32 1
%.tmp6106 = load i8*, i8** %.tmp6105
%.tmp6108 = getelementptr [6 x i8], [6 x i8]*@.str6107, i32 0, i32 0
%.tmp6109 = call i32(i8*,i8*) @strcmp(i8* %.tmp6106, i8* %.tmp6108)
%.tmp6110 = icmp eq i32 %.tmp6109, 0
br i1 %.tmp6110, label %.if.true.6111, label %.if.false.6111
.if.true.6111:
%.tmp6112 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6113 = load i8, i8* @SCOPE_CONST
%.tmp6115 = getelementptr [2 x i8], [2 x i8]*@.str6114, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6112, i8 %.tmp6113, i8* %.tmp6115)
br label %.if.end.6111
.if.false.6111:
%.tmp6116 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6117 = load i8, i8* @SCOPE_CONST
%.tmp6119 = getelementptr [2 x i8], [2 x i8]*@.str6118, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6116, i8 %.tmp6117, i8* %.tmp6119)
br label %.if.end.6111
.if.end.6111:
br label %.if.end.6088
.if.false.6088:
%.tmp6120 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6121 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6120, i32 0, i32 6
%.tmp6122 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6121
%.tmp6123 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6122, i32 0, i32 0
%.tmp6124 = load i8*, i8** %.tmp6123
%.tmp6126 = getelementptr [8 x i8], [8 x i8]*@.str6125, i32 0, i32 0
%.tmp6127 = call i32(i8*,i8*) @strcmp(i8* %.tmp6124, i8* %.tmp6126)
%.tmp6128 = icmp eq i32 %.tmp6127, 0
br i1 %.tmp6128, label %.if.true.6129, label %.if.false.6129
.if.true.6129:
%.tmp6130 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6131 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6132 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6131, i32 0, i32 6
%.tmp6133 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6132
%.tmp6134 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6133, i32 0, i32 6
%.tmp6135 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6134
%.tmp6136 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_fn_call.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6130, %m286$.Node.type* %.tmp6135)
store %m1811$.AssignableInfo.type* %.tmp6136, %m1811$.AssignableInfo.type** %assignable_info
br label %.if.end.6129
.if.false.6129:
%.tmp6137 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6138 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6137, i32 0, i32 6
%.tmp6139 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6138
%.tmp6140 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6139, i32 0, i32 0
%.tmp6141 = load i8*, i8** %.tmp6140
%.tmp6143 = getelementptr [7 x i8], [7 x i8]*@.str6142, i32 0, i32 0
%.tmp6144 = call i32(i8*,i8*) @strcmp(i8* %.tmp6141, i8* %.tmp6143)
%.tmp6145 = icmp eq i32 %.tmp6144, 0
br i1 %.tmp6145, label %.if.true.6146, label %.if.false.6146
.if.true.6146:
%.tmp6147 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6148 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6149 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6148, i32 0, i32 6
%.tmp6150 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6149
%.tmp6151 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6150, i32 0, i32 1
%.tmp6152 = load i8*, i8** %.tmp6151
%.tmp6153 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,i8*) @m1811$define_string.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp6147, i8* %.tmp6152)
%string_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6153, %m1811$.AssignableInfo.type** %string_info
%.tmp6154 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6155 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6154)
store %m1811$.AssignableInfo.type* %.tmp6155, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6156 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6157 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp6156, %m1811$.AssignableInfo.type* %.tmp6157)
%.tmp6158 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6159 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %string_info
%.tmp6160 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6159, i32 0, i32 3
%.tmp6161 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6160
%.tmp6162 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6158, %m1811$.Type.type* %.tmp6161)
%str_tr = alloca i8*
store i8* %.tmp6162, i8** %str_tr
%.tmp6163 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6164 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6163, i32 0, i32 1
%.tmp6165 = load %m0$.File.type*, %m0$.File.type** %.tmp6164
%.tmp6167 = getelementptr [44 x i8], [44 x i8]*@.str6166, i32 0, i32 0
%.tmp6168 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6169 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6168)
%.tmp6170 = load i8*, i8** %str_tr
%.tmp6171 = load i8*, i8** %str_tr
%.tmp6172 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %string_info
%.tmp6173 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6172)
%.tmp6174 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6165, i8* %.tmp6167, i8* %.tmp6169, i8* %.tmp6170, i8* %.tmp6171, i8* %.tmp6173)
%.tmp6175 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6176 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6175, i32 0, i32 3
%.tmp6177 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6177, %m1811$.Type.type** %.tmp6176
%.tmp6178 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6179 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6178, i32 0, i32 3
%.tmp6180 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6179
%.tmp6181 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6180, i32 0, i32 0
%.tmp6183 = getelementptr [4 x i8], [4 x i8]*@.str6182, i32 0, i32 0
store i8* %.tmp6183, i8** %.tmp6181
%.tmp6184 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6185 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6184, i32 0, i32 3
%.tmp6186 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6185
%.tmp6187 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6186, i32 0, i32 3
%.tmp6188 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6188, %m1811$.Type.type** %.tmp6187
%.tmp6189 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6190 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6189, i32 0, i32 3
%.tmp6191 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6190
%.tmp6192 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6191, i32 0, i32 3
%.tmp6193 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6192
%.tmp6194 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6193, i32 0, i32 0
%.tmp6196 = getelementptr [4 x i8], [4 x i8]*@.str6195, i32 0, i32 0
store i8* %.tmp6196, i8** %.tmp6194
br label %.if.end.6146
.if.false.6146:
%.tmp6197 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6198 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6197, i32 0, i32 6
%.tmp6199 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6198
%.tmp6200 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6199, i32 0, i32 0
%.tmp6201 = load i8*, i8** %.tmp6200
%.tmp6203 = getelementptr [4 x i8], [4 x i8]*@.str6202, i32 0, i32 0
%.tmp6204 = call i32(i8*,i8*) @strcmp(i8* %.tmp6201, i8* %.tmp6203)
%.tmp6205 = icmp eq i32 %.tmp6204, 0
br i1 %.tmp6205, label %.if.true.6206, label %.if.false.6206
.if.true.6206:
%.tmp6207 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6208 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6207)
store %m1811$.AssignableInfo.type* %.tmp6208, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6209 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6210 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6209, i32 0, i32 6
%.tmp6211 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6210
%.tmp6212 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6211, i32 0, i32 1
%.tmp6213 = load i8*, i8** %.tmp6212
%.tmp6214 = call i32(i8*) @strlen(i8* %.tmp6213)
%chr_len = alloca i32
store i32 %.tmp6214, i32* %chr_len
%.tmp6215 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6216 = load i8, i8* @SCOPE_CONST
%.tmp6218 = getelementptr [2 x i8], [2 x i8]*@.str6217, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6215, i8 %.tmp6216, i8* %.tmp6218)
%.tmp6219 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6220 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6219, i32 0, i32 0
%.tmp6221 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6222 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6221, i32 0, i32 6
%.tmp6223 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6222
%.tmp6224 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6223, i32 0, i32 1
%.tmp6225 = load i8*, i8** %.tmp6224
%.tmp6226 = call i8*(i8*) @m2157$chr_to_llvm.cp.cp(i8* %.tmp6225)
store i8* %.tmp6226, i8** %.tmp6220
%.tmp6227 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6228 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6227, i32 0, i32 0
%.tmp6229 = load i8*, i8** %.tmp6228
%.tmp6230 = icmp eq i8* %.tmp6229, null
br i1 %.tmp6230, label %.if.true.6231, label %.if.false.6231
.if.true.6231:
%.tmp6232 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp6234 = getelementptr [22 x i8], [22 x i8]*@.str6233, i32 0, i32 0
%.tmp6235 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6236 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6235, i32 0, i32 6
%.tmp6237 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6236
%.tmp6238 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6237, i32 0, i32 1
%.tmp6239 = load i8*, i8** %.tmp6238
%.tmp6240 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6232, i8* %.tmp6234, i8* %.tmp6239)
%.tmp6241 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6241
br label %.if.end.6231
.if.false.6231:
br label %.if.end.6231
.if.end.6231:
%.tmp6242 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6243 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6242, i32 0, i32 3
%.tmp6244 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6244, %m1811$.Type.type** %.tmp6243
%.tmp6245 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6246 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6245, i32 0, i32 3
%.tmp6247 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6246
%.tmp6248 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6247, i32 0, i32 0
%.tmp6250 = getelementptr [4 x i8], [4 x i8]*@.str6249, i32 0, i32 0
store i8* %.tmp6250, i8** %.tmp6248
br label %.if.end.6206
.if.false.6206:
%.tmp6251 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6252 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6254 = getelementptr [40 x i8], [40 x i8]*@.str6253, i32 0, i32 0
%.tmp6255 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp6251, %m286$.Node.type* %.tmp6252, i8* %.tmp6254)
%.tmp6256 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6257 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6256, i32 0, i32 6
%.tmp6258 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6257
%.tmp6259 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6258, i32 0, i32 0
%.tmp6260 = load i8*, i8** %.tmp6259
%.tmp6261 = call i32(i8*,...) @printf(i8* %.tmp6255, i8* %.tmp6260)
%.tmp6262 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6262
br label %.if.end.6206
.if.end.6206:
br label %.if.end.6146
.if.end.6146:
br label %.if.end.6129
.if.end.6129:
br label %.if.end.6088
.if.end.6088:
br label %.if.end.5992
.if.end.5992:
br label %.if.end.5945
.if.end.5945:
br label %.if.end.5917
.if.end.5917:
%.tmp6263 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6264 = icmp eq %m1811$.AssignableInfo.type* %.tmp6263, null
br i1 %.tmp6264, label %.if.true.6265, label %.if.false.6265
.if.true.6265:
%.tmp6266 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6266
br label %.if.end.6265
.if.false.6265:
br label %.if.end.6265
.if.end.6265:
%.tmp6267 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6268 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6267, i32 0, i32 4
%.tmp6269 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6270 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6269, i32 0, i32 3
%.tmp6271 = load i32, i32* %.tmp6270
store i32 %.tmp6271, i32* %.tmp6268
%.tmp6272 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6273 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6272, i32 0, i32 5
%.tmp6274 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6275 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6274, i32 0, i32 4
%.tmp6276 = load i32, i32* %.tmp6275
store i32 %.tmp6276, i32* %.tmp6273
%.tmp6277 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6278 = bitcast %m1811$.AssignableInfo.type* %.tmp6277 to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6278
}
define i8* @m1811$type_abbr.cp.m1811$.Type.typep(%m1811$.Type.type* %.type.arg) {
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.type.arg, %m1811$.Type.type** %type
%.tmp6279 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6280 = icmp ne %m1811$.Type.type* %.tmp6279, null
%.tmp6282 = getelementptr [22 x i8], [22 x i8]*@.str6281, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6280, i8* %.tmp6282)
%.tmp6283 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6284 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6283, i32 0, i32 0
%.tmp6285 = load i8*, i8** %.tmp6284
%.tmp6286 = icmp ne i8* %.tmp6285, null
%.tmp6288 = getelementptr [59 x i8], [59 x i8]*@.str6287, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6286, i8* %.tmp6288)
%.tmp6289 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6290 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6289, i32 0, i32 0
%.tmp6291 = load i8*, i8** %.tmp6290
%.tmp6293 = getelementptr [4 x i8], [4 x i8]*@.str6292, i32 0, i32 0
%.tmp6294 = call i32(i8*,i8*) @strcmp(i8* %.tmp6291, i8* %.tmp6293)
%.tmp6295 = icmp eq i32 %.tmp6294, 0
br i1 %.tmp6295, label %.if.true.6296, label %.if.false.6296
.if.true.6296:
%.tmp6298 = getelementptr [2 x i8], [2 x i8]*@.str6297, i32 0, i32 0
ret i8* %.tmp6298
br label %.if.end.6296
.if.false.6296:
%.tmp6299 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6300 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6299, i32 0, i32 0
%.tmp6301 = load i8*, i8** %.tmp6300
%.tmp6303 = getelementptr [5 x i8], [5 x i8]*@.str6302, i32 0, i32 0
%.tmp6304 = call i32(i8*,i8*) @strcmp(i8* %.tmp6301, i8* %.tmp6303)
%.tmp6305 = icmp eq i32 %.tmp6304, 0
br i1 %.tmp6305, label %.if.true.6306, label %.if.false.6306
.if.true.6306:
%.tmp6308 = getelementptr [2 x i8], [2 x i8]*@.str6307, i32 0, i32 0
ret i8* %.tmp6308
br label %.if.end.6306
.if.false.6306:
%.tmp6309 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6310 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6309, i32 0, i32 0
%.tmp6311 = load i8*, i8** %.tmp6310
%.tmp6313 = getelementptr [5 x i8], [5 x i8]*@.str6312, i32 0, i32 0
%.tmp6314 = call i32(i8*,i8*) @strcmp(i8* %.tmp6311, i8* %.tmp6313)
%.tmp6315 = icmp eq i32 %.tmp6314, 0
br i1 %.tmp6315, label %.if.true.6316, label %.if.false.6316
.if.true.6316:
%.tmp6318 = getelementptr [2 x i8], [2 x i8]*@.str6317, i32 0, i32 0
ret i8* %.tmp6318
br label %.if.end.6316
.if.false.6316:
%.tmp6319 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6320 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6319, i32 0, i32 0
%.tmp6321 = load i8*, i8** %.tmp6320
%.tmp6323 = getelementptr [4 x i8], [4 x i8]*@.str6322, i32 0, i32 0
%.tmp6324 = call i32(i8*,i8*) @strcmp(i8* %.tmp6321, i8* %.tmp6323)
%.tmp6325 = icmp eq i32 %.tmp6324, 0
br i1 %.tmp6325, label %.if.true.6326, label %.if.false.6326
.if.true.6326:
%.tmp6328 = getelementptr [2 x i8], [2 x i8]*@.str6327, i32 0, i32 0
ret i8* %.tmp6328
br label %.if.end.6326
.if.false.6326:
%.tmp6329 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6330 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6329, i32 0, i32 0
%.tmp6331 = load i8*, i8** %.tmp6330
%.tmp6333 = getelementptr [4 x i8], [4 x i8]*@.str6332, i32 0, i32 0
%.tmp6334 = call i32(i8*,i8*) @strcmp(i8* %.tmp6331, i8* %.tmp6333)
%.tmp6335 = icmp eq i32 %.tmp6334, 0
br i1 %.tmp6335, label %.if.true.6336, label %.if.false.6336
.if.true.6336:
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp6337 = getelementptr i8*, i8** %buf, i32 0
%.tmp6339 = getelementptr [4 x i8], [4 x i8]*@.str6338, i32 0, i32 0
%.tmp6340 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6341 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6340, i32 0, i32 3
%.tmp6342 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6341
%.tmp6343 = call i8*(%m1811$.Type.type*) @m1811$type_abbr.cp.m1811$.Type.typep(%m1811$.Type.type* %.tmp6342)
%.tmp6344 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6337, i8* %.tmp6339, i8* %.tmp6343)
%.tmp6345 = load i8*, i8** %buf
ret i8* %.tmp6345
br label %.if.end.6336
.if.false.6336:
%.tmp6346 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6347 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6346, i32 0, i32 0
%.tmp6348 = load i8*, i8** %.tmp6347
%.tmp6350 = getelementptr [10 x i8], [10 x i8]*@.str6349, i32 0, i32 0
%.tmp6351 = call i32(i8*,i8*) @strcmp(i8* %.tmp6348, i8* %.tmp6350)
%.tmp6352 = icmp eq i32 %.tmp6351, 0
br i1 %.tmp6352, label %.if.true.6353, label %.if.false.6353
.if.true.6353:
%.tmp6354 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6355 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6354, i32 0, i32 2
%.tmp6356 = load i8*, i8** %.tmp6355
ret i8* %.tmp6356
br label %.if.end.6353
.if.false.6353:
%.tmp6357 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6358 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6357, i32 0, i32 0
%.tmp6359 = load i8*, i8** %.tmp6358
%.tmp6361 = getelementptr [6 x i8], [6 x i8]*@.str6360, i32 0, i32 0
%.tmp6362 = call i32(i8*,i8*) @strcmp(i8* %.tmp6359, i8* %.tmp6361)
%.tmp6363 = icmp eq i32 %.tmp6362, 0
br i1 %.tmp6363, label %.if.true.6364, label %.if.false.6364
.if.true.6364:
%.tmp6366 = getelementptr [2 x i8], [2 x i8]*@.str6365, i32 0, i32 0
ret i8* %.tmp6366
br label %.if.end.6364
.if.false.6364:
%.tmp6368 = getelementptr [44 x i8], [44 x i8]*@.str6367, i32 0, i32 0
%.tmp6369 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6370 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6369, i32 0, i32 0
%.tmp6371 = load i8*, i8** %.tmp6370
%.tmp6372 = call i32(i8*,...) @printf(i8* %.tmp6368, i8* %.tmp6371)
br label %.if.end.6364
.if.end.6364:
br label %.if.end.6353
.if.end.6353:
br label %.if.end.6336
.if.end.6336:
br label %.if.end.6326
.if.end.6326:
br label %.if.end.6316
.if.end.6316:
br label %.if.end.6306
.if.end.6306:
br label %.if.end.6296
.if.end.6296:
%.tmp6373 = bitcast ptr null to i8*
ret i8* %.tmp6373
}
define %m1811$.AssignableInfo.type* @m1811$define_string.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp6374 = bitcast ptr null to %m286$.Node.type*
%.tmp6375 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6374)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6375, %m1811$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp6376 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp6378 = getelementptr [7 x i8], [7 x i8]*@.str6377, i32 0, i32 0
%.tmp6379 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6380 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp6379)
%.tmp6381 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6376, i8* %.tmp6378, i32 %.tmp6380)
%.tmp6382 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6383 = load i8, i8* @SCOPE_GLOBAL
%.tmp6384 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6382, i8 %.tmp6383, i8* %.tmp6384)
%.tmp6385 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* null, i32 1
%.tmp6386 = ptrtoint %m1811$.GlobalName.type* %.tmp6385 to i32
%.tmp6387 = call i8*(i32) @malloc(i32 %.tmp6386)
%.tmp6388 = bitcast i8* %.tmp6387 to %m1811$.GlobalName.type*
%global = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.tmp6388, %m1811$.GlobalName.type** %global
%.tmp6389 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6390 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6389, i32 0, i32 0
%.tmp6391 = load i8*, i8** %text
%.tmp6392 = call i8*(i8*) @m2157$string_to_llvm.cp.cp(i8* %.tmp6391)
store i8* %.tmp6392, i8** %.tmp6390
%.tmp6393 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6394 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6393, i32 0, i32 3
%.tmp6395 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6395, %m1811$.Type.type** %.tmp6394
%.tmp6396 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6397 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6396, i32 0, i32 3
%.tmp6398 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6397
%.tmp6399 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6398, i32 0, i32 0
%.tmp6401 = getelementptr [6 x i8], [6 x i8]*@.str6400, i32 0, i32 0
store i8* %.tmp6401, i8** %.tmp6399
%.tmp6402 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6403 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6402, i32 0, i32 3
%.tmp6404 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6403
%.tmp6405 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6404, i32 0, i32 3
%.tmp6406 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6406, %m1811$.Type.type** %.tmp6405
%.tmp6407 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6408 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6407, i32 0, i32 3
%.tmp6409 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6408
%.tmp6410 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6409, i32 0, i32 3
%.tmp6411 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6410
%.tmp6412 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6411, i32 0, i32 0
%.tmp6414 = getelementptr [4 x i8], [4 x i8]*@.str6413, i32 0, i32 0
store i8* %.tmp6414, i8** %.tmp6412
%.tmp6415 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6416 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6415, i32 0, i32 3
%.tmp6417 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6416
%.tmp6418 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6417, i32 0, i32 3
%.tmp6419 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6418
%.tmp6420 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6419, i32 0, i32 4
%.tmp6421 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6421, %m1811$.Type.type** %.tmp6420
%.tmp6422 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6423 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6422, i32 0, i32 3
%.tmp6424 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6423
%.tmp6425 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6424, i32 0, i32 3
%.tmp6426 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6425
%.tmp6427 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6426, i32 0, i32 4
%.tmp6428 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6427
%.tmp6429 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6428, i32 0, i32 0
%.tmp6430 = getelementptr i8*, i8** %.tmp6429, i32 0
%.tmp6432 = getelementptr [3 x i8], [3 x i8]*@.str6431, i32 0, i32 0
%.tmp6433 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6434 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6433, i32 0, i32 0
%.tmp6435 = load i8*, i8** %.tmp6434
%.tmp6436 = call i32(i8*) @m2157$llvm_str_len.i.cp(i8* %.tmp6435)
%.tmp6437 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6430, i8* %.tmp6432, i32 %.tmp6436)
%.tmp6438 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6439 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6438, i32 0, i32 1
%.tmp6441 = getelementptr [7 x i8], [7 x i8]*@.str6440, i32 0, i32 0
store i8* %.tmp6441, i8** %.tmp6439
%.tmp6442 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6443 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6442, i32 0, i32 4
store %m1811$.GlobalName.type* null, %m1811$.GlobalName.type** %.tmp6443
%.tmp6444 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6445 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6444, i32 0, i32 3
%.tmp6446 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
store %m1811$.AssignableInfo.type* %.tmp6446, %m1811$.AssignableInfo.type** %.tmp6445
%.tmp6447 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6448 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6447, i32 0, i32 2
store i1 0, i1* %.tmp6448
%.tmp6449 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6450 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
call void(%m1811$.CompilerCtx.type*,%m1811$.GlobalName.type*) @m1811$append_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.tmp6449, %m1811$.GlobalName.type* %.tmp6450)
%.tmp6451 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp6451
}
define void @m1811$define_module.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%mod = alloca %m286$.Node.type*
store %m286$.Node.type* %.mod.arg, %m286$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp6452 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp6453 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6452)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6453, %m1811$.AssignableInfo.type** %info
%.tmp6454 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6455 = load i8, i8* @SCOPE_CONST
%.tmp6456 = load i8*, i8** %abspath
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6454, i8 %.tmp6455, i8* %.tmp6456)
%.tmp6457 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6458 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6457, i32 0, i32 2
%.tmp6460 = getelementptr [7 x i8], [7 x i8]*@.str6459, i32 0, i32 0
store i8* %.tmp6460, i8** %.tmp6458
%.tmp6461 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6462 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6461, i32 0, i32 3
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp6462
%.tmp6463 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6464 = load i8*, i8** %as_name
%.tmp6465 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp6463, i8* %.tmp6464, %m1811$.AssignableInfo.type* %.tmp6465)
ret void
}
define void @m1811$append_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%g = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.g.arg, %m1811$.GlobalName.type** %g
%.tmp6466 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6467 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6466, i32 0, i32 3
%.tmp6468 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6467
%.tmp6469 = icmp eq %m1811$.GlobalName.type* %.tmp6468, null
br i1 %.tmp6469, label %.if.true.6470, label %.if.false.6470
.if.true.6470:
%.tmp6471 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6472 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6471, i32 0, i32 3
%.tmp6473 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
store %m1811$.GlobalName.type* %.tmp6473, %m1811$.GlobalName.type** %.tmp6472
br label %.if.end.6470
.if.false.6470:
%last_global = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* null, %m1811$.GlobalName.type** %last_global
%.tmp6475 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6476 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6475, i32 0, i32 3
%.tmp6477 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6476
store %m1811$.GlobalName.type* %.tmp6477, %m1811$.GlobalName.type** %last_global
br label %.for.start.6474
.for.start.6474:
%.tmp6478 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %last_global
%.tmp6479 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6478, i32 0, i32 4
%.tmp6480 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6479
%.tmp6481 = icmp ne %m1811$.GlobalName.type* %.tmp6480, null
br i1 %.tmp6481, label %.for.continue.6474, label %.for.end.6474
.for.continue.6474:
%.tmp6482 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %last_global
%.tmp6483 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6482, i32 0, i32 4
%.tmp6484 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6483
store %m1811$.GlobalName.type* %.tmp6484, %m1811$.GlobalName.type** %last_global
br label %.for.start.6474
.for.end.6474:
%.tmp6485 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %last_global
%.tmp6486 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6485, i32 0, i32 4
%.tmp6487 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
store %m1811$.GlobalName.type* %.tmp6487, %m1811$.GlobalName.type** %.tmp6486
br label %.if.end.6470
.if.end.6470:
ret void
}
define i8* @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.Type.type* %.type.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.type.arg, %m1811$.Type.type** %type
%.tmp6488 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6489 = icmp eq %m1811$.Type.type* %.tmp6488, null
br i1 %.tmp6489, label %.if.true.6490, label %.if.false.6490
.if.true.6490:
%.tmp6491 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6491, label %.if.true.6492, label %.if.false.6492
.if.true.6492:
%.tmp6494 = getelementptr [44 x i8], [44 x i8]*@.str6493, i32 0, i32 0
%.tmp6495 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6496 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6495, i32 0, i32 6
%.tmp6497 = load i8*, i8** %.tmp6496
%.tmp6498 = call i32(i8*,...) @printf(i8* %.tmp6494, i8* %.tmp6497)
br label %.if.end.6492
.if.false.6492:
br label %.if.end.6492
.if.end.6492:
%.tmp6500 = getelementptr [2 x i8], [2 x i8]*@.str6499, i32 0, i32 0
ret i8* %.tmp6500
br label %.if.end.6490
.if.false.6490:
br label %.if.end.6490
.if.end.6490:
%.tmp6501 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6502 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6501, i32 0, i32 0
%.tmp6503 = load i8*, i8** %.tmp6502
%.tmp6504 = icmp ne i8* %.tmp6503, null
%.tmp6506 = getelementptr [59 x i8], [59 x i8]*@.str6505, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6504, i8* %.tmp6506)
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp6507 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6508 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6507, i32 0, i32 0
%.tmp6509 = load i8*, i8** %.tmp6508
%.tmp6511 = getelementptr [4 x i8], [4 x i8]*@.str6510, i32 0, i32 0
%.tmp6512 = call i32(i8*,i8*) @strcmp(i8* %.tmp6509, i8* %.tmp6511)
%.tmp6513 = icmp eq i32 %.tmp6512, 0
br i1 %.tmp6513, label %.if.true.6514, label %.if.false.6514
.if.true.6514:
%.tmp6516 = getelementptr [4 x i8], [4 x i8]*@.str6515, i32 0, i32 0
ret i8* %.tmp6516
br label %.if.end.6514
.if.false.6514:
%.tmp6517 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6518 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6517, i32 0, i32 0
%.tmp6519 = load i8*, i8** %.tmp6518
%.tmp6521 = getelementptr [5 x i8], [5 x i8]*@.str6520, i32 0, i32 0
%.tmp6522 = call i32(i8*,i8*) @strcmp(i8* %.tmp6519, i8* %.tmp6521)
%.tmp6523 = icmp eq i32 %.tmp6522, 0
br i1 %.tmp6523, label %.if.true.6524, label %.if.false.6524
.if.true.6524:
%.tmp6526 = getelementptr [5 x i8], [5 x i8]*@.str6525, i32 0, i32 0
ret i8* %.tmp6526
br label %.if.end.6524
.if.false.6524:
%.tmp6527 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6528 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6527, i32 0, i32 0
%.tmp6529 = load i8*, i8** %.tmp6528
%.tmp6531 = getelementptr [5 x i8], [5 x i8]*@.str6530, i32 0, i32 0
%.tmp6532 = call i32(i8*,i8*) @strcmp(i8* %.tmp6529, i8* %.tmp6531)
%.tmp6533 = icmp eq i32 %.tmp6532, 0
br i1 %.tmp6533, label %.if.true.6534, label %.if.false.6534
.if.true.6534:
%.tmp6536 = getelementptr [3 x i8], [3 x i8]*@.str6535, i32 0, i32 0
ret i8* %.tmp6536
br label %.if.end.6534
.if.false.6534:
%.tmp6537 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6538 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6537, i32 0, i32 0
%.tmp6539 = load i8*, i8** %.tmp6538
%.tmp6541 = getelementptr [8 x i8], [8 x i8]*@.str6540, i32 0, i32 0
%.tmp6542 = call i32(i8*,i8*) @strcmp(i8* %.tmp6539, i8* %.tmp6541)
%.tmp6543 = icmp eq i32 %.tmp6542, 0
br i1 %.tmp6543, label %.if.true.6544, label %.if.false.6544
.if.true.6544:
%.tmp6546 = getelementptr [4 x i8], [4 x i8]*@.str6545, i32 0, i32 0
ret i8* %.tmp6546
br label %.if.end.6544
.if.false.6544:
%.tmp6547 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6548 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6547, i32 0, i32 0
%.tmp6549 = load i8*, i8** %.tmp6548
%.tmp6551 = getelementptr [4 x i8], [4 x i8]*@.str6550, i32 0, i32 0
%.tmp6552 = call i32(i8*,i8*) @strcmp(i8* %.tmp6549, i8* %.tmp6551)
%.tmp6553 = icmp eq i32 %.tmp6552, 0
br i1 %.tmp6553, label %.if.true.6554, label %.if.false.6554
.if.true.6554:
%.tmp6556 = getelementptr [3 x i8], [3 x i8]*@.str6555, i32 0, i32 0
ret i8* %.tmp6556
br label %.if.end.6554
.if.false.6554:
%.tmp6557 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6558 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6557, i32 0, i32 0
%.tmp6559 = load i8*, i8** %.tmp6558
%.tmp6561 = getelementptr [9 x i8], [9 x i8]*@.str6560, i32 0, i32 0
%.tmp6562 = call i32(i8*,i8*) @strcmp(i8* %.tmp6559, i8* %.tmp6561)
%.tmp6563 = icmp eq i32 %.tmp6562, 0
br i1 %.tmp6563, label %.if.true.6564, label %.if.false.6564
.if.true.6564:
%.tmp6565 = getelementptr i8*, i8** %buf, i32 0
%.tmp6567 = getelementptr [4 x i8], [4 x i8]*@.str6566, i32 0, i32 0
%.tmp6568 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6569 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6570 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6569, i32 0, i32 3
%.tmp6571 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6570
%.tmp6572 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6568, %m1811$.Type.type* %.tmp6571)
%.tmp6573 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6565, i8* %.tmp6567, i8* %.tmp6572)
%.tmp6575 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6576 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6575, i32 0, i32 3
%.tmp6577 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6576
%.tmp6578 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6577, i32 0, i32 4
%.tmp6579 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6578
%p = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6579, %m1811$.Type.type** %p
br label %.for.start.6574
.for.start.6574:
%.tmp6580 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6581 = icmp ne %m1811$.Type.type* %.tmp6580, null
br i1 %.tmp6581, label %.for.continue.6574, label %.for.end.6574
.for.continue.6574:
%.tmp6582 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6583 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6584 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6583, i32 0, i32 3
%.tmp6585 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6584
%.tmp6586 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6585, i32 0, i32 4
%.tmp6587 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6586
%.tmp6588 = icmp ne %m1811$.Type.type* %.tmp6582, %.tmp6587
br i1 %.tmp6588, label %.if.true.6589, label %.if.false.6589
.if.true.6589:
%.tmp6590 = getelementptr i8*, i8** %buf, i32 0
%.tmp6592 = getelementptr [4 x i8], [4 x i8]*@.str6591, i32 0, i32 0
%.tmp6593 = load i8*, i8** %buf
%.tmp6594 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6590, i8* %.tmp6592, i8* %.tmp6593)
br label %.if.end.6589
.if.false.6589:
br label %.if.end.6589
.if.end.6589:
%.tmp6595 = getelementptr i8*, i8** %buf, i32 0
%.tmp6597 = getelementptr [5 x i8], [5 x i8]*@.str6596, i32 0, i32 0
%.tmp6598 = load i8*, i8** %buf
%.tmp6599 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6600 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6601 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6599, %m1811$.Type.type* %.tmp6600)
%.tmp6602 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6595, i8* %.tmp6597, i8* %.tmp6598, i8* %.tmp6601)
%.tmp6603 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6604 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6603, i32 0, i32 4
%.tmp6605 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6604
store %m1811$.Type.type* %.tmp6605, %m1811$.Type.type** %p
br label %.for.start.6574
.for.end.6574:
%.tmp6606 = getelementptr i8*, i8** %buf, i32 0
%.tmp6608 = getelementptr [4 x i8], [4 x i8]*@.str6607, i32 0, i32 0
%.tmp6609 = load i8*, i8** %buf
%.tmp6610 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6606, i8* %.tmp6608, i8* %.tmp6609)
%.tmp6611 = load i8*, i8** %buf
ret i8* %.tmp6611
br label %.if.end.6564
.if.false.6564:
%.tmp6612 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6613 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6612, i32 0, i32 0
%.tmp6614 = load i8*, i8** %.tmp6613
%.tmp6616 = getelementptr [4 x i8], [4 x i8]*@.str6615, i32 0, i32 0
%.tmp6617 = call i32(i8*,i8*) @strcmp(i8* %.tmp6614, i8* %.tmp6616)
%.tmp6618 = icmp eq i32 %.tmp6617, 0
br i1 %.tmp6618, label %.if.true.6619, label %.if.false.6619
.if.true.6619:
%.tmp6620 = getelementptr i8*, i8** %buf, i32 0
%.tmp6622 = getelementptr [4 x i8], [4 x i8]*@.str6621, i32 0, i32 0
%.tmp6623 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6624 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6625 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6624, i32 0, i32 3
%.tmp6626 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6625
%.tmp6627 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6623, %m1811$.Type.type* %.tmp6626)
%.tmp6628 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6620, i8* %.tmp6622, i8* %.tmp6627)
%.tmp6629 = load i8*, i8** %buf
ret i8* %.tmp6629
br label %.if.end.6619
.if.false.6619:
%.tmp6630 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6631 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6630, i32 0, i32 0
%.tmp6632 = load i8*, i8** %.tmp6631
%.tmp6634 = getelementptr [7 x i8], [7 x i8]*@.str6633, i32 0, i32 0
%.tmp6635 = call i32(i8*,i8*) @strcmp(i8* %.tmp6632, i8* %.tmp6634)
%.tmp6636 = icmp eq i32 %.tmp6635, 0
br i1 %.tmp6636, label %.if.true.6637, label %.if.false.6637
.if.true.6637:
%.tmp6638 = getelementptr i8*, i8** %buf, i32 0
%.tmp6640 = getelementptr [2 x i8], [2 x i8]*@.str6639, i32 0, i32 0
%.tmp6641 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6638, i8* %.tmp6640)
%.tmp6643 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6644 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6643, i32 0, i32 3
%.tmp6645 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6644
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6645, %m1811$.Type.type** %t
br label %.for.start.6642
.for.start.6642:
%.tmp6646 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6647 = icmp ne %m1811$.Type.type* %.tmp6646, null
br i1 %.tmp6647, label %.for.continue.6642, label %.for.end.6642
.for.continue.6642:
%.tmp6648 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6649 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6650 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6649, i32 0, i32 3
%.tmp6651 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6650
%.tmp6652 = icmp ne %m1811$.Type.type* %.tmp6648, %.tmp6651
br i1 %.tmp6652, label %.if.true.6653, label %.if.false.6653
.if.true.6653:
%.tmp6654 = getelementptr i8*, i8** %buf, i32 0
%.tmp6656 = getelementptr [4 x i8], [4 x i8]*@.str6655, i32 0, i32 0
%.tmp6657 = load i8*, i8** %buf
%.tmp6658 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6654, i8* %.tmp6656, i8* %.tmp6657)
br label %.if.end.6653
.if.false.6653:
br label %.if.end.6653
.if.end.6653:
%.tmp6659 = getelementptr i8*, i8** %buf, i32 0
%.tmp6661 = getelementptr [5 x i8], [5 x i8]*@.str6660, i32 0, i32 0
%.tmp6662 = load i8*, i8** %buf
%.tmp6663 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6664 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6665 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6663, %m1811$.Type.type* %.tmp6664)
%.tmp6666 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6659, i8* %.tmp6661, i8* %.tmp6662, i8* %.tmp6665)
%.tmp6667 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6668 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6667, i32 0, i32 4
%.tmp6669 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6668
store %m1811$.Type.type* %.tmp6669, %m1811$.Type.type** %t
br label %.for.start.6642
.for.end.6642:
%.tmp6670 = getelementptr i8*, i8** %buf, i32 0
%.tmp6672 = getelementptr [4 x i8], [4 x i8]*@.str6671, i32 0, i32 0
%.tmp6673 = load i8*, i8** %buf
%.tmp6674 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6670, i8* %.tmp6672, i8* %.tmp6673)
%.tmp6675 = load i8*, i8** %buf
ret i8* %.tmp6675
br label %.if.end.6637
.if.false.6637:
%.tmp6676 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6677 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6676, i32 0, i32 0
%.tmp6678 = load i8*, i8** %.tmp6677
%.tmp6680 = getelementptr [6 x i8], [6 x i8]*@.str6679, i32 0, i32 0
%.tmp6681 = call i32(i8*,i8*) @strcmp(i8* %.tmp6678, i8* %.tmp6680)
%.tmp6682 = icmp eq i32 %.tmp6681, 0
br i1 %.tmp6682, label %.if.true.6683, label %.if.false.6683
.if.true.6683:
%.tmp6684 = getelementptr i8*, i8** %buf, i32 0
%.tmp6686 = getelementptr [10 x i8], [10 x i8]*@.str6685, i32 0, i32 0
%.tmp6687 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6688 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6687, i32 0, i32 3
%.tmp6689 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6688
%.tmp6690 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6689, i32 0, i32 4
%.tmp6691 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6690
%.tmp6692 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6691, i32 0, i32 0
%.tmp6693 = load i8*, i8** %.tmp6692
%.tmp6694 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6695 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6696 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6695, i32 0, i32 3
%.tmp6697 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6696
%.tmp6698 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6694, %m1811$.Type.type* %.tmp6697)
%.tmp6699 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6684, i8* %.tmp6686, i8* %.tmp6693, i8* %.tmp6698)
%.tmp6700 = load i8*, i8** %buf
ret i8* %.tmp6700
br label %.if.end.6683
.if.false.6683:
%.tmp6701 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6702 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6701, i32 0, i32 0
%.tmp6703 = load i8*, i8** %.tmp6702
%.tmp6705 = getelementptr [10 x i8], [10 x i8]*@.str6704, i32 0, i32 0
%.tmp6706 = call i32(i8*,i8*) @strcmp(i8* %.tmp6703, i8* %.tmp6705)
%.tmp6707 = icmp eq i32 %.tmp6706, 0
br i1 %.tmp6707, label %.if.true.6708, label %.if.false.6708
.if.true.6708:
%.tmp6709 = getelementptr i8*, i8** %buf, i32 0
%.tmp6711 = getelementptr [5 x i8], [5 x i8]*@.str6710, i32 0, i32 0
%.tmp6712 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6713 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6712, i32 0, i32 2
%.tmp6714 = load i8*, i8** %.tmp6713
%.tmp6715 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6709, i8* %.tmp6711, i8* %.tmp6714)
%.tmp6716 = load i8*, i8** %buf
ret i8* %.tmp6716
br label %.if.end.6708
.if.false.6708:
%.tmp6717 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6718 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6717, i32 0, i32 0
%.tmp6719 = load i8*, i8** %.tmp6718
%.tmp6721 = getelementptr [7 x i8], [7 x i8]*@.str6720, i32 0, i32 0
%.tmp6722 = call i32(i8*,i8*) @strcmp(i8* %.tmp6719, i8* %.tmp6721)
%.tmp6723 = icmp eq i32 %.tmp6722, 0
br i1 %.tmp6723, label %.if.true.6724, label %.if.false.6724
.if.true.6724:
%.tmp6726 = getelementptr [4 x i8], [4 x i8]*@.str6725, i32 0, i32 0
ret i8* %.tmp6726
br label %.if.end.6724
.if.false.6724:
%.tmp6727 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6728 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6727, i32 0, i32 0
%.tmp6729 = load i8*, i8** %.tmp6728
%.tmp6731 = getelementptr [6 x i8], [6 x i8]*@.str6730, i32 0, i32 0
%.tmp6732 = call i32(i8*,i8*) @strcmp(i8* %.tmp6729, i8* %.tmp6731)
%.tmp6733 = icmp eq i32 %.tmp6732, 0
br i1 %.tmp6733, label %.if.true.6734, label %.if.false.6734
.if.true.6734:
br label %.if.end.6734
.if.false.6734:
%.tmp6736 = getelementptr [58 x i8], [58 x i8]*@.str6735, i32 0, i32 0
%.tmp6737 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6738 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6737, i32 0, i32 0
%.tmp6739 = load i8*, i8** %.tmp6738
%.tmp6740 = call i32(i8*,...) @printf(i8* %.tmp6736, i8* %.tmp6739)
br label %.if.end.6734
.if.end.6734:
br label %.if.end.6724
.if.end.6724:
br label %.if.end.6708
.if.end.6708:
br label %.if.end.6683
.if.end.6683:
br label %.if.end.6637
.if.end.6637:
br label %.if.end.6619
.if.end.6619:
br label %.if.end.6564
.if.end.6564:
br label %.if.end.6554
.if.end.6554:
br label %.if.end.6544
.if.end.6544:
br label %.if.end.6534
.if.end.6534:
br label %.if.end.6524
.if.end.6524:
br label %.if.end.6514
.if.end.6514:
%.tmp6741 = bitcast ptr null to i8*
ret i8* %.tmp6741
}
define void @m1811$append_error.v.m1811$.CompilerCtx.typep.m754$.Error.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m754$.Error.type* %.e.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%e = alloca %m754$.Error.type*
store %m754$.Error.type* %.e.arg, %m754$.Error.type** %e
%.tmp6742 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* null, i32 1
%.tmp6743 = ptrtoint %m1811$.ErrorList.type* %.tmp6742 to i32
%.tmp6744 = call i8*(i32) @malloc(i32 %.tmp6743)
%.tmp6745 = bitcast i8* %.tmp6744 to %m1811$.ErrorList.type*
%new_err = alloca %m1811$.ErrorList.type*
store %m1811$.ErrorList.type* %.tmp6745, %m1811$.ErrorList.type** %new_err
%.tmp6746 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
%.tmp6747 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6746, i32 0, i32 0
%.tmp6748 = load %m754$.Error.type*, %m754$.Error.type** %e
store %m754$.Error.type* %.tmp6748, %m754$.Error.type** %.tmp6747
%.tmp6749 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
%.tmp6750 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6749, i32 0, i32 1
store %m1811$.ErrorList.type* null, %m1811$.ErrorList.type** %.tmp6750
%.tmp6751 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6752 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6751, i32 0, i32 2
%.tmp6753 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6752
%.tmp6754 = icmp eq %m1811$.ErrorList.type* %.tmp6753, null
br i1 %.tmp6754, label %.if.true.6755, label %.if.false.6755
.if.true.6755:
%.tmp6756 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6757 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6756, i32 0, i32 2
%.tmp6758 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
store %m1811$.ErrorList.type* %.tmp6758, %m1811$.ErrorList.type** %.tmp6757
ret void
br label %.if.end.6755
.if.false.6755:
br label %.if.end.6755
.if.end.6755:
%last = alloca %m1811$.ErrorList.type*
store %m1811$.ErrorList.type* null, %m1811$.ErrorList.type** %last
%.tmp6760 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6761 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6760, i32 0, i32 2
%.tmp6762 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6761
store %m1811$.ErrorList.type* %.tmp6762, %m1811$.ErrorList.type** %last
br label %.for.start.6759
.for.start.6759:
%.tmp6763 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %last
%.tmp6764 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6763, i32 0, i32 1
%.tmp6765 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6764
%.tmp6766 = icmp ne %m1811$.ErrorList.type* %.tmp6765, null
br i1 %.tmp6766, label %.for.continue.6759, label %.for.end.6759
.for.continue.6759:
%.tmp6767 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %last
%.tmp6768 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6767, i32 0, i32 1
%.tmp6769 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6768
store %m1811$.ErrorList.type* %.tmp6769, %m1811$.ErrorList.type** %last
br label %.for.start.6759
.for.end.6759:
%.tmp6770 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %last
%.tmp6771 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6770, i32 0, i32 1
%.tmp6772 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
store %m1811$.ErrorList.type* %.tmp6772, %m1811$.ErrorList.type** %.tmp6771
ret void
}
define i8* @m1811$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6773 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6774 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6773, i32 0, i32 6
%.tmp6775 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6774
%.tmp6776 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6775, i32 0, i32 7
%.tmp6777 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6776
%.tmp6778 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6777, i32 0, i32 1
%.tmp6779 = load i8*, i8** %.tmp6778
ret i8* %.tmp6779
}
define %m286$.Node.type* @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6781 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6781, %m286$.Node.type** %n
br label %.for.start.6780
.for.start.6780:
%.tmp6782 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6783 = icmp ne %m286$.Node.type* %.tmp6782, null
br i1 %.tmp6783, label %.for.continue.6780, label %.for.end.6780
.for.continue.6780:
%.tmp6784 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6785 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6784, i32 0, i32 0
%.tmp6786 = load i8*, i8** %.tmp6785
%.tmp6787 = load i8*, i8** %type
%.tmp6788 = call i32(i8*,i8*) @strcmp(i8* %.tmp6786, i8* %.tmp6787)
%.tmp6789 = icmp eq i32 %.tmp6788, 0
br i1 %.tmp6789, label %.if.true.6790, label %.if.false.6790
.if.true.6790:
%.tmp6791 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6791
br label %.if.end.6790
.if.false.6790:
br label %.if.end.6790
.if.end.6790:
%.tmp6792 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6793 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6792, i32 0, i32 7
%.tmp6794 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6793
store %m286$.Node.type* %.tmp6794, %m286$.Node.type** %n
br label %.for.start.6780
.for.end.6780:
%.tmp6795 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6795
}
define %m1811$.Type.type* @m1811$syn_function_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6796 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%function_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6796, %m1811$.Type.type** %function_type
%.tmp6797 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6798 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6799 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6798, i32 0, i32 6
%.tmp6800 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6799
%.tmp6801 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6797, %m286$.Node.type* %.tmp6800)
%return_value_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6801, %m1811$.Type.type** %return_value_type
%.tmp6802 = load %m1811$.Type.type*, %m1811$.Type.type** %function_type
%.tmp6803 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6802, i32 0, i32 0
%.tmp6805 = getelementptr [9 x i8], [9 x i8]*@.str6804, i32 0, i32 0
store i8* %.tmp6805, i8** %.tmp6803
%.tmp6806 = load %m1811$.Type.type*, %m1811$.Type.type** %function_type
%.tmp6807 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6806, i32 0, i32 3
%.tmp6808 = load %m1811$.Type.type*, %m1811$.Type.type** %return_value_type
store %m1811$.Type.type* %.tmp6808, %m1811$.Type.type** %.tmp6807
%.tmp6809 = load %m1811$.Type.type*, %m1811$.Type.type** %return_value_type
%last_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6809, %m1811$.Type.type** %last_type
%.tmp6810 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6811 = call %m286$.Node.type*(%m286$.Node.type*) @m1811$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6810)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6811, %m286$.Node.type** %params
%.tmp6813 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6813, %m286$.Node.type** %param_ptr
br label %.for.start.6812
.for.start.6812:
%.tmp6814 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6815 = icmp ne %m286$.Node.type* %.tmp6814, null
br i1 %.tmp6815, label %.for.continue.6812, label %.for.end.6812
.for.continue.6812:
%.tmp6816 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6817 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6816, i32 0, i32 0
%.tmp6818 = load i8*, i8** %.tmp6817
%.tmp6820 = getelementptr [5 x i8], [5 x i8]*@.str6819, i32 0, i32 0
%.tmp6821 = call i32(i8*,i8*) @strcmp(i8* %.tmp6818, i8* %.tmp6820)
%.tmp6822 = icmp eq i32 %.tmp6821, 0
br i1 %.tmp6822, label %.if.true.6823, label %.if.false.6823
.if.true.6823:
%.tmp6824 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6825 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6824, i32 0, i32 4
%.tmp6826 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6827 = call %m1811$.Type.type*(%m1811$.Type.type*) @m1811$type_clone.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp6826)
store %m1811$.Type.type* %.tmp6827, %m1811$.Type.type** %.tmp6825
%.tmp6828 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6829 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6828, i32 0, i32 4
%.tmp6830 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6829
%.tmp6831 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6830, i32 0, i32 4
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp6831
%.tmp6832 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6833 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6832, i32 0, i32 4
%.tmp6834 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6833
store %m1811$.Type.type* %.tmp6834, %m1811$.Type.type** %last_type
%.tmp6835 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6836 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6835, i32 0, i32 7
%.tmp6837 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6836
%.tmp6838 = icmp ne %m286$.Node.type* %.tmp6837, null
br i1 %.tmp6838, label %.if.true.6839, label %.if.false.6839
.if.true.6839:
%.tmp6840 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6841 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6840, i32 0, i32 7
%.tmp6842 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6841
store %m286$.Node.type* %.tmp6842, %m286$.Node.type** %param_ptr
br label %.if.end.6839
.if.false.6839:
br label %.if.end.6839
.if.end.6839:
%.tmp6843 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6844 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6843, i32 0, i32 7
%.tmp6845 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6844
%.tmp6846 = icmp ne %m286$.Node.type* %.tmp6845, null
br i1 %.tmp6846, label %.if.true.6847, label %.if.false.6847
.if.true.6847:
%.tmp6848 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6849 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6848, i32 0, i32 7
%.tmp6850 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6849
store %m286$.Node.type* %.tmp6850, %m286$.Node.type** %param_ptr
br label %.if.end.6847
.if.false.6847:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6847
.if.end.6847:
br label %.if.end.6823
.if.false.6823:
%.tmp6851 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6852 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6853 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6852, i32 0, i32 6
%.tmp6854 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6853
%.tmp6855 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6851, %m286$.Node.type* %.tmp6854)
%param_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6855, %m1811$.Type.type** %param_type
%.tmp6856 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6857 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6856, i32 0, i32 4
%.tmp6858 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
store %m1811$.Type.type* %.tmp6858, %m1811$.Type.type** %.tmp6857
%.tmp6859 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
store %m1811$.Type.type* %.tmp6859, %m1811$.Type.type** %last_type
%.tmp6860 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6861 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6860, i32 0, i32 7
%.tmp6862 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6861
store %m286$.Node.type* %.tmp6862, %m286$.Node.type** %param_ptr
%.tmp6863 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6864 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6863, i32 0, i32 7
%.tmp6865 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6864
%.tmp6866 = icmp ne %m286$.Node.type* %.tmp6865, null
br i1 %.tmp6866, label %.if.true.6867, label %.if.false.6867
.if.true.6867:
%.tmp6868 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6869 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6868, i32 0, i32 7
%.tmp6870 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6869
%.tmp6871 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6870, i32 0, i32 7
%.tmp6872 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6871
store %m286$.Node.type* %.tmp6872, %m286$.Node.type** %param_ptr
br label %.if.end.6867
.if.false.6867:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6867
.if.end.6867:
br label %.if.end.6823
.if.end.6823:
br label %.for.start.6812
.for.end.6812:
%.tmp6873 = load %m1811$.Type.type*, %m1811$.Type.type** %function_type
ret %m1811$.Type.type* %.tmp6873
}
define %m286$.Node.type* @m1811$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6874 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6876 = getelementptr [10 x i8], [10 x i8]*@.str6875, i32 0, i32 0
%.tmp6877 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6874, i8* %.tmp6876)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6877, %m286$.Node.type** %params
%.tmp6878 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6879 = icmp eq %m286$.Node.type* %.tmp6878, null
br i1 %.tmp6879, label %.if.true.6880, label %.if.false.6880
.if.true.6880:
%.tmp6881 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6881
br label %.if.end.6880
.if.false.6880:
br label %.if.end.6880
.if.end.6880:
%.tmp6882 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6883 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6882, i32 0, i32 6
%.tmp6884 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6883
ret %m286$.Node.type* %.tmp6884
}
define %m1811$.Type.type* @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6885 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6885, %m1811$.Type.type** %t
%.tmp6886 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6886, i32 0, i32 0
%.tmp6888 = load i8*, i8** %.tmp6887
%.tmp6890 = getelementptr [10 x i8], [10 x i8]*@.str6889, i32 0, i32 0
%.tmp6891 = call i32(i8*,i8*) @strcmp(i8* %.tmp6888, i8* %.tmp6890)
%.tmp6892 = icmp eq i32 %.tmp6891, 0
br i1 %.tmp6892, label %.if.true.6893, label %.if.false.6893
.if.true.6893:
%.tmp6894 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6895 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6894, i32 0, i32 0
%.tmp6897 = getelementptr [7 x i8], [7 x i8]*@.str6896, i32 0, i32 0
store i8* %.tmp6897, i8** %.tmp6895
%.tmp6898 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6899 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6898, i32 0, i32 1
store i8* null, i8** %.tmp6899
%.tmp6900 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6901 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6900, i32 0, i32 6
%.tmp6902 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6901
%.tmp6904 = getelementptr [5 x i8], [5 x i8]*@.str6903, i32 0, i32 0
%.tmp6905 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6902, i8* %.tmp6904)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6905, %m286$.Node.type** %curr_type
%.tmp6906 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6907 = icmp ne %m286$.Node.type* %.tmp6906, null
br i1 %.tmp6907, label %.if.true.6908, label %.if.false.6908
.if.true.6908:
%.tmp6909 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6910 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6909, i32 0, i32 3
%.tmp6911 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6912 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6913 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6912, i32 0, i32 6
%.tmp6914 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6913
%.tmp6915 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6911, %m286$.Node.type* %.tmp6914)
store %m1811$.Type.type* %.tmp6915, %m1811$.Type.type** %.tmp6910
%.tmp6916 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6917 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6916, i32 0, i32 3
%.tmp6918 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6917
%.tmp6919 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6918, i32 0, i32 1
%.tmp6920 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6921 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6920, i32 0, i32 7
%.tmp6922 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6921
%.tmp6923 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6922, i32 0, i32 1
%.tmp6924 = load i8*, i8** %.tmp6923
store i8* %.tmp6924, i8** %.tmp6919
%.tmp6925 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6926 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6925, i32 0, i32 3
%.tmp6927 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6926
%curr_t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6927, %m1811$.Type.type** %curr_t
%.tmp6929 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6930 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6929, i32 0, i32 7
%.tmp6931 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6930
%.tmp6933 = getelementptr [5 x i8], [5 x i8]*@.str6932, i32 0, i32 0
%.tmp6934 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6931, i8* %.tmp6933)
store %m286$.Node.type* %.tmp6934, %m286$.Node.type** %curr_type
br label %.for.start.6928
.for.start.6928:
%.tmp6935 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6936 = icmp ne %m286$.Node.type* %.tmp6935, null
br i1 %.tmp6936, label %.for.continue.6928, label %.for.end.6928
.for.continue.6928:
%.tmp6937 = load %m1811$.Type.type*, %m1811$.Type.type** %curr_t
%.tmp6938 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6937, i32 0, i32 4
%.tmp6939 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6940 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6941 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6940, i32 0, i32 6
%.tmp6942 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6941
%.tmp6943 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6939, %m286$.Node.type* %.tmp6942)
store %m1811$.Type.type* %.tmp6943, %m1811$.Type.type** %.tmp6938
%.tmp6944 = load %m1811$.Type.type*, %m1811$.Type.type** %curr_t
%.tmp6945 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6944, i32 0, i32 4
%.tmp6946 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6945
%.tmp6947 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6946, i32 0, i32 1
%.tmp6948 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6949 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6948, i32 0, i32 7
%.tmp6950 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6949
%.tmp6951 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6950, i32 0, i32 1
%.tmp6952 = load i8*, i8** %.tmp6951
store i8* %.tmp6952, i8** %.tmp6947
%.tmp6953 = load %m1811$.Type.type*, %m1811$.Type.type** %curr_t
%.tmp6954 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6953, i32 0, i32 4
%.tmp6955 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6954
store %m1811$.Type.type* %.tmp6955, %m1811$.Type.type** %curr_t
%.tmp6956 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6957 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6956, i32 0, i32 7
%.tmp6958 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6957
%.tmp6960 = getelementptr [5 x i8], [5 x i8]*@.str6959, i32 0, i32 0
%.tmp6961 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6958, i8* %.tmp6960)
store %m286$.Node.type* %.tmp6961, %m286$.Node.type** %curr_type
br label %.for.start.6928
.for.end.6928:
br label %.if.end.6908
.if.false.6908:
br label %.if.end.6908
.if.end.6908:
br label %.if.end.6893
.if.false.6893:
%.tmp6962 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6963 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6962, i32 0, i32 0
%.tmp6964 = load i8*, i8** %.tmp6963
%.tmp6966 = getelementptr [12 x i8], [12 x i8]*@.str6965, i32 0, i32 0
%.tmp6967 = call i32(i8*,i8*) @strcmp(i8* %.tmp6964, i8* %.tmp6966)
%.tmp6968 = icmp eq i32 %.tmp6967, 0
br i1 %.tmp6968, label %.if.true.6969, label %.if.false.6969
.if.true.6969:
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp6970 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6971 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6972 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$find_defined.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6970, %m286$.Node.type* %.tmp6971)
%base = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp6972, %m1811$.ScopeItem.type** %base
%.tmp6973 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp6974 = icmp eq %m1811$.ScopeItem.type* %.tmp6973, null
br i1 %.tmp6974, label %.if.true.6975, label %.if.false.6975
.if.true.6975:
%.tmp6976 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6978 = getelementptr [37 x i8], [37 x i8]*@.str6977, i32 0, i32 0
%.tmp6979 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6980 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6979, i32 0, i32 6
%.tmp6981 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6980
%.tmp6982 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6981, i32 0, i32 1
%.tmp6983 = load i8*, i8** %.tmp6982
%.tmp6984 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6976, i8* %.tmp6978, i8* %.tmp6983)
%.tmp6985 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6986 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6987 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp6985, %m286$.Node.type* %.tmp6986, i8* %.tmp6987)
%.tmp6988 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6989 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6988, i32 0, i32 0
%.tmp6991 = getelementptr [6 x i8], [6 x i8]*@.str6990, i32 0, i32 0
store i8* %.tmp6991, i8** %.tmp6989
%.tmp6992 = load %m1811$.Type.type*, %m1811$.Type.type** %t
ret %m1811$.Type.type* %.tmp6992
br label %.if.end.6975
.if.false.6975:
br label %.if.end.6975
.if.end.6975:
%.tmp6993 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6994 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6993, i32 0, i32 0
%.tmp6996 = getelementptr [10 x i8], [10 x i8]*@.str6995, i32 0, i32 0
store i8* %.tmp6996, i8** %.tmp6994
%.tmp6997 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6998 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6997, i32 0, i32 1
%.tmp6999 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp7000 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp6999, i32 0, i32 0
%.tmp7001 = load i8*, i8** %.tmp7000
store i8* %.tmp7001, i8** %.tmp6998
%.tmp7002 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7003 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7002, i32 0, i32 2
%.tmp7004 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp7005 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp7004, i32 0, i32 1
%.tmp7006 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp7005
%.tmp7007 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp7006, i32 0, i32 0
%.tmp7008 = load i8*, i8** %.tmp7007
store i8* %.tmp7008, i8** %.tmp7003
%.tmp7009 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7010 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7009, i32 0, i32 3
%.tmp7011 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp7012 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp7011, i32 0, i32 1
%.tmp7013 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp7012
%.tmp7014 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp7013, i32 0, i32 3
%.tmp7015 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp7014
store %m1811$.Type.type* %.tmp7015, %m1811$.Type.type** %.tmp7010
br label %.if.end.6969
.if.false.6969:
%.tmp7016 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7017 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7016, i32 0, i32 1
%.tmp7018 = load i8*, i8** %.tmp7017
%.tmp7020 = getelementptr [4 x i8], [4 x i8]*@.str7019, i32 0, i32 0
%.tmp7021 = call i32(i8*,i8*) @strcmp(i8* %.tmp7018, i8* %.tmp7020)
%.tmp7022 = icmp eq i32 %.tmp7021, 0
br i1 %.tmp7022, label %.if.true.7023, label %.if.false.7023
.if.true.7023:
%.tmp7024 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7025 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7024, i32 0, i32 0
%.tmp7027 = getelementptr [4 x i8], [4 x i8]*@.str7026, i32 0, i32 0
store i8* %.tmp7027, i8** %.tmp7025
%.tmp7028 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7029 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7028, i32 0, i32 3
%.tmp7030 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp7030, %m1811$.Type.type** %.tmp7029
%.tmp7031 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7032 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7031, i32 0, i32 3
%.tmp7033 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp7032
%.tmp7034 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7033, i32 0, i32 0
%.tmp7036 = getelementptr [4 x i8], [4 x i8]*@.str7035, i32 0, i32 0
store i8* %.tmp7036, i8** %.tmp7034
br label %.if.end.7023
.if.false.7023:
%.tmp7037 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7038 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7037, i32 0, i32 0
%.tmp7039 = load i8*, i8** %.tmp7038
%.tmp7041 = getelementptr [5 x i8], [5 x i8]*@.str7040, i32 0, i32 0
%.tmp7042 = call i32(i8*,i8*) @strcmp(i8* %.tmp7039, i8* %.tmp7041)
%.tmp7043 = icmp eq i32 %.tmp7042, 0
br i1 %.tmp7043, label %.if.true.7044, label %.if.false.7044
.if.true.7044:
%.tmp7045 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7046 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7045, i32 0, i32 0
%.tmp7047 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7047, i32 0, i32 1
%.tmp7049 = load i8*, i8** %.tmp7048
store i8* %.tmp7049, i8** %.tmp7046
br label %.if.end.7044
.if.false.7044:
%.tmp7050 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7051 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7050, i32 0, i32 1
%.tmp7052 = load i8*, i8** %.tmp7051
%.tmp7054 = getelementptr [4 x i8], [4 x i8]*@.str7053, i32 0, i32 0
%.tmp7055 = call i32(i8*,i8*) @strcmp(i8* %.tmp7052, i8* %.tmp7054)
%.tmp7056 = icmp eq i32 %.tmp7055, 0
br i1 %.tmp7056, label %.if.true.7057, label %.if.false.7057
.if.true.7057:
%.tmp7058 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7059 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7058, i32 0, i32 0
%.tmp7061 = getelementptr [7 x i8], [7 x i8]*@.str7060, i32 0, i32 0
store i8* %.tmp7061, i8** %.tmp7059
br label %.if.end.7057
.if.false.7057:
%.tmp7062 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp7063 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7065 = getelementptr [54 x i8], [54 x i8]*@.str7064, i32 0, i32 0
%.tmp7066 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp7062, %m286$.Node.type* %.tmp7063, i8* %.tmp7065)
%.tmp7067 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7068 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7067, i32 0, i32 0
%.tmp7069 = load i8*, i8** %.tmp7068
%.tmp7070 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7071 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7070, i32 0, i32 1
%.tmp7072 = load i8*, i8** %.tmp7071
%.tmp7073 = call i32(i8*,...) @printf(i8* %.tmp7066, i8* %.tmp7069, i8* %.tmp7072)
%.tmp7074 = bitcast ptr null to %m1811$.Type.type*
ret %m1811$.Type.type* %.tmp7074
br label %.if.end.7057
.if.end.7057:
br label %.if.end.7044
.if.end.7044:
br label %.if.end.7023
.if.end.7023:
br label %.if.end.6969
.if.end.6969:
br label %.if.end.6893
.if.end.6893:
%.tmp7076 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7077 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7076, i32 0, i32 7
%.tmp7078 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7077
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp7078, %m286$.Node.type** %ptr
br label %.for.start.7075
.for.start.7075:
%.tmp7079 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7080 = icmp ne %m286$.Node.type* %.tmp7079, null
br i1 %.tmp7080, label %.for.continue.7075, label %.for.end.7075
.for.continue.7075:
%.tmp7081 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7082 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7081, i32 0, i32 1
%.tmp7083 = load i8*, i8** %.tmp7082
%.tmp7085 = getelementptr [2 x i8], [2 x i8]*@.str7084, i32 0, i32 0
%.tmp7086 = call i32(i8*,i8*) @strcmp(i8* %.tmp7083, i8* %.tmp7085)
%.tmp7087 = icmp eq i32 %.tmp7086, 0
br i1 %.tmp7087, label %.if.true.7088, label %.if.false.7088
.if.true.7088:
%.tmp7089 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%pt = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7089, %m1811$.Type.type** %pt
%.tmp7090 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp7091 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7090, i32 0, i32 0
%.tmp7093 = getelementptr [4 x i8], [4 x i8]*@.str7092, i32 0, i32 0
store i8* %.tmp7093, i8** %.tmp7091
%.tmp7094 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp7095 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7094, i32 0, i32 3
%.tmp7096 = load %m1811$.Type.type*, %m1811$.Type.type** %t
store %m1811$.Type.type* %.tmp7096, %m1811$.Type.type** %.tmp7095
%.tmp7097 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
store %m1811$.Type.type* %.tmp7097, %m1811$.Type.type** %t
br label %.if.end.7088
.if.false.7088:
%.tmp7098 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7099 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7098, i32 0, i32 1
%.tmp7100 = load i8*, i8** %.tmp7099
%.tmp7102 = getelementptr [2 x i8], [2 x i8]*@.str7101, i32 0, i32 0
%.tmp7103 = call i32(i8*,i8*) @strcmp(i8* %.tmp7100, i8* %.tmp7102)
%.tmp7104 = icmp eq i32 %.tmp7103, 0
br i1 %.tmp7104, label %.if.true.7105, label %.if.false.7105
.if.true.7105:
%.tmp7106 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7107 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7106, i32 0, i32 7
%.tmp7108 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7107
%.tmp7109 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7108, i32 0, i32 1
%.tmp7110 = load i8*, i8** %.tmp7109
%.tmp7112 = getelementptr [2 x i8], [2 x i8]*@.str7111, i32 0, i32 0
%.tmp7113 = call i32(i8*,i8*) @strcmp(i8* %.tmp7110, i8* %.tmp7112)
%.tmp7114 = icmp eq i32 %.tmp7113, 0
br i1 %.tmp7114, label %.if.true.7115, label %.if.false.7115
.if.true.7115:
%.tmp7116 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7116, %m1811$.Type.type** %slice_type
%.tmp7117 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_type
%.tmp7118 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7117, i32 0, i32 0
%.tmp7120 = getelementptr [7 x i8], [7 x i8]*@.str7119, i32 0, i32 0
store i8* %.tmp7120, i8** %.tmp7118
%.tmp7121 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_c_array = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7121, %m1811$.Type.type** %slice_c_array
%.tmp7122 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7123 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7122, i32 0, i32 0
%.tmp7125 = getelementptr [4 x i8], [4 x i8]*@.str7124, i32 0, i32 0
store i8* %.tmp7125, i8** %.tmp7123
%.tmp7126 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7127 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7126, i32 0, i32 1
%.tmp7129 = getelementptr [6 x i8], [6 x i8]*@.str7128, i32 0, i32 0
store i8* %.tmp7129, i8** %.tmp7127
%.tmp7130 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7131 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7130, i32 0, i32 3
%.tmp7132 = load %m1811$.Type.type*, %m1811$.Type.type** %t
store %m1811$.Type.type* %.tmp7132, %m1811$.Type.type** %.tmp7131
%.tmp7133 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_type
%.tmp7134 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7133, i32 0, i32 3
%.tmp7135 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
store %m1811$.Type.type* %.tmp7135, %m1811$.Type.type** %.tmp7134
%.tmp7136 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_len = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7136, %m1811$.Type.type** %slice_len
%.tmp7137 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
%.tmp7138 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7137, i32 0, i32 0
%.tmp7140 = getelementptr [4 x i8], [4 x i8]*@.str7139, i32 0, i32 0
store i8* %.tmp7140, i8** %.tmp7138
%.tmp7141 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
%.tmp7142 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7141, i32 0, i32 1
%.tmp7144 = getelementptr [4 x i8], [4 x i8]*@.str7143, i32 0, i32 0
store i8* %.tmp7144, i8** %.tmp7142
%.tmp7145 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7146 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7145, i32 0, i32 4
%.tmp7147 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
store %m1811$.Type.type* %.tmp7147, %m1811$.Type.type** %.tmp7146
%.tmp7148 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_cap = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7148, %m1811$.Type.type** %slice_cap
%.tmp7149 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_cap
%.tmp7150 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7149, i32 0, i32 0
%.tmp7152 = getelementptr [4 x i8], [4 x i8]*@.str7151, i32 0, i32 0
store i8* %.tmp7152, i8** %.tmp7150
%.tmp7153 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_cap
%.tmp7154 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7153, i32 0, i32 1
%.tmp7156 = getelementptr [4 x i8], [4 x i8]*@.str7155, i32 0, i32 0
store i8* %.tmp7156, i8** %.tmp7154
%.tmp7157 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
%.tmp7158 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7157, i32 0, i32 4
%.tmp7159 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_cap
store %m1811$.Type.type* %.tmp7159, %m1811$.Type.type** %.tmp7158
%.tmp7160 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_type
store %m1811$.Type.type* %.tmp7160, %m1811$.Type.type** %t
%.tmp7161 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7162 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7161, i32 0, i32 7
%.tmp7163 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7162
store %m286$.Node.type* %.tmp7163, %m286$.Node.type** %ptr
br label %.if.end.7115
.if.false.7115:
br label %.if.end.7115
.if.end.7115:
br label %.if.end.7105
.if.false.7105:
%.tmp7164 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp7165 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7167 = getelementptr [49 x i8], [49 x i8]*@.str7166, i32 0, i32 0
%.tmp7168 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp7164, %m286$.Node.type* %.tmp7165, i8* %.tmp7167)
%.tmp7169 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7170 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7169, i32 0, i32 1
%.tmp7171 = load i8*, i8** %.tmp7170
%.tmp7172 = call i32(i8*,...) @printf(i8* %.tmp7168, i8* %.tmp7171)
%.tmp7173 = bitcast ptr null to %m1811$.Type.type*
ret %m1811$.Type.type* %.tmp7173
br label %.if.end.7105
.if.end.7105:
br label %.if.end.7088
.if.end.7088:
%.tmp7174 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7175 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7174, i32 0, i32 7
%.tmp7176 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7175
store %m286$.Node.type* %.tmp7176, %m286$.Node.type** %ptr
br label %.for.start.7075
.for.end.7075:
%.tmp7177 = load %m1811$.Type.type*, %m1811$.Type.type** %t
ret %m1811$.Type.type* %.tmp7177
}
@.str2572 = constant [5 x i8] c"%s{\0A\00"
@.str2576 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2583 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2590 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2602 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2606 = constant [10 x i8] c"%s  of: \0A\00"
@.str2620 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2624 = constant [12 x i8] c"%s  next: \0A\00"
@.str2633 = constant [5 x i8] c"%s}\0A\00"
@.str2691 = constant [5 x i8] c"%c%s\00"
@.str2702 = constant [7 x i8] c".tmp%d\00"
@.str2780 = constant [1 x i8] c"\00"
@.str2819 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2850 = constant [6 x i8] c"start\00"
@.str2899 = constant [6 x i8] c"start\00"
@.str2905 = constant [7 x i8] c"global\00"
@.str2915 = constant [13 x i8] c"head_comment\00"
@.str2952 = constant [7 x i8] c"string\00"
@.str2961 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2991 = constant [5 x i8] c"%s%s\00"
@.str2999 = constant [9 x i8] c"function\00"
@.str3005 = constant [5 x i8] c"main\00"
@.str3017 = constant [6 x i8] c"%s.%s\00"
@.str3034 = constant [3 x i8] c"NL\00"
@.str3042 = constant [7 x i8] c"global\00"
@.str3050 = constant [11 x i8] c"assignable\00"
@.str3078 = constant [9 x i8] c"variable\00"
@.str3089 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3104 = constant [10 x i8] c"typealias\00"
@.str3124 = constant [11 x i8] c"%s.%s.type\00"
@.str3136 = constant [10 x i8] c"typealias\00"
@.str3157 = constant [5 x i8] c"type\00"
@.str3184 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3197 = constant [7 x i8] c"extern\00"
@.str3215 = constant [7 x i8] c"extern\00"
@.str3254 = constant [15 x i8] c"declare %s %s(\00"
@.str3285 = constant [3 x i8] c", \00"
@.str3291 = constant [3 x i8] c"%s\00"
@.str3303 = constant [3 x i8] c")\0A\00"
@.str3314 = constant [9 x i8] c"function\00"
@.str3323 = constant [9 x i8] c"function\00"
@.str3360 = constant [14 x i8] c"define %s %s(\00"
@.str3386 = constant [3 x i8] c", \00"
@.str3392 = constant [5 x i8] c"type\00"
@.str3408 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3423 = constant [5 x i8] c") {\0A\00"
@.str3427 = constant [9 x i8] c"function\00"
@.str3436 = constant [6 x i8] c"block\00"
@.str3454 = constant [3 x i8] c"NL\00"
@.str3461 = constant [9 x i8] c"OPERATOR\00"
@.str3479 = constant [7 x i8] c"return\00"
@.str3489 = constant [5 x i8] c"void\00"
@.str3496 = constant [21 x i8] c"missing return value\00"
@.str3501 = constant [10 x i8] c"ret void\0A\00"
@.str3507 = constant [3 x i8] c"}\0A\00"
@.str3513 = constant [7 x i8] c"import\00"
@.str3558 = constant [1 x i8] c"\00"
@.str3564 = constant [6 x i8] c"%s.bn\00"
@.str3569 = constant [9 x i8] c"%s/%s.bn\00"
@.str3581 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3638 = constant [5 x i8] c"m%d$\00"
@.str3687 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3695 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3724 = constant [9 x i8] c"variable\00"
@.str3729 = constant [5 x i8] c"type\00"
@.str3759 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3771 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3783 = constant [6 x i8] c"block\00"
@.str3796 = constant [11 x i8] c"expression\00"
@.str3823 = constant [7 x i8] c"sizeof\00"
@.str3829 = constant [8 x i8] c"fn_args\00"
@.str3835 = constant [11 x i8] c"assignable\00"
@.str3860 = constant [4 x i8] c"int\00"
@.str3871 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3880 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3906 = constant [35 x i8] c"unable to compile function address\00"
@.str3912 = constant [8 x i8] c"fn_args\00"
@.str3915 = constant [1 x i8] c"\00"
@.str3923 = constant [11 x i8] c"assignable\00"
@.str3935 = constant [5 x i8] c"%s, \00"
@.str3951 = constant [8 x i8] c"%s%s %s\00"
@.str3966 = constant [11 x i8] c"assignable\00"
@.str3976 = constant [5 x i8] c"void\00"
@.str3984 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4015 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4036 = constant [7 x i8] c"return\00"
@.str4048 = constant [3 x i8] c"NL\00"
@.str4066 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4079 = constant [10 x i8] c"ret void\0A\00"
@.str4083 = constant [3 x i8] c"NL\00"
@.str4089 = constant [8 x i8] c"fn_call\00"
@.str4100 = constant [12 x i8] c"declaration\00"
@.str4109 = constant [11 x i8] c"assignment\00"
@.str4117 = constant [11 x i8] c"assignable\00"
@.str4145 = constant [4 x i8] c"ptr\00"
@.str4154 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4164 = constant [9 x i8] c"if_block\00"
@.str4172 = constant [9 x i8] c"for_loop\00"
@.str4180 = constant [8 x i8] c"keyword\00"
@.str4195 = constant [6 x i8] c"break\00"
@.str4209 = constant [4 x i8] c"for\00"
@.str4217 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4231 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4238 = constant [9 x i8] c"continue\00"
@.str4252 = constant [4 x i8] c"for\00"
@.str4260 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4274 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4278 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4289 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4304 = constant [14 x i8] c".for.start.%d\00"
@.str4309 = constant [12 x i8] c".for.end.%d\00"
@.str4314 = constant [4 x i8] c"for\00"
@.str4321 = constant [12 x i8] c"declaration\00"
@.str4332 = constant [11 x i8] c"assignment\00"
@.str4342 = constant [9 x i8] c"OPERATOR\00"
@.str4349 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4360 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4367 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4374 = constant [9 x i8] c"OPERATOR\00"
@.str4383 = constant [9 x i8] c"OPERATOR\00"
@.str4390 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4398 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4413 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4420 = constant [9 x i8] c"OPERATOR\00"
@.str4427 = constant [6 x i8] c"block\00"
@.str4441 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4448 = constant [5 x i8] c"%s:\0A\00"
@.str4460 = constant [5 x i8] c"type\00"
@.str4475 = constant [11 x i8] c"assignable\00"
@.str4488 = constant [9 x i8] c"variable\00"
@.str4493 = constant [5 x i8] c"WORD\00"
@.str4501 = constant [31 x i8] c"unable to get declaration name\00"
@.str4553 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4569 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4581 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4616 = constant [4 x i8] c"int\00"
@.str4623 = constant [4 x i8] c"chr\00"
@.str4631 = constant [5 x i8] c"bool\00"
@.str4640 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str4649 = constant [4 x i8] c"ptr\00"
@.str4657 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4660 = constant [5 x i8] c"null\00"
@.str4668 = constant [7 x i8] c"struct\00"
@.str4689 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4709 = constant [10 x i8] c"typealias\00"
@.str4732 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4751 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str4768 = constant [11 x i8] c"assignable\00"
@.str4782 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4797 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4804 = constant [6 x i8] c"block\00"
@.str4812 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4819 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4826 = constant [11 x i8] c"elif_block\00"
@.str4837 = constant [11 x i8] c"else_block\00"
@.str4847 = constant [6 x i8] c"block\00"
@.str4857 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4864 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4884 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4892 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4941 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4962 = constant [7 x i8] c"module\00"
@.str4991 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5033 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5041 = constant [9 x i8] c"function\00"
@.str5048 = constant [7 x i8] c"extern\00"
@.str5060 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5081 = constant [9 x i8] c"variable\00"
@.str5101 = constant [4 x i8] c"ptr\00"
@.str5119 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5143 = constant [10 x i8] c"typealias\00"
@.str5154 = constant [7 x i8] c"struct\00"
@.str5160 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5208 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5228 = constant [9 x i8] c"variable\00"
@.str5238 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5259 = constant [9 x i8] c"variable\00"
@.str5267 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5279 = constant [12 x i8] c"destination\00"
@.str5284 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5310 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5328 = constant [7 x i8] c"module\00"
@.str5350 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5414 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5434 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5457 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5482 = constant [15 x i8] c"hello: %s %s?\0A\00"
@.str5494 = constant [16 x i8] c"mono_assignable\00"
@.str5516 = constant [5 x i8] c"cast\00"
@.str5525 = constant [5 x i8] c"type\00"
@.str5545 = constant [8 x i8] c"bitcast\00"
@.str5552 = constant [4 x i8] c"ptr\00"
@.str5559 = constant [4 x i8] c"ptr\00"
@.str5576 = constant [4 x i8] c"i%d\00"
@.str5581 = constant [4 x i8] c"i%d\00"
@.str5589 = constant [5 x i8] c"sext\00"
@.str5591 = constant [6 x i8] c"trunc\00"
@.str5596 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str5616 = constant [16 x i8] c"mono_assignable\00"
@.str5674 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5697 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5704 = constant [2 x i8] c"+\00"
@.str5709 = constant [4 x i8] c"add\00"
@.str5714 = constant [2 x i8] c"-\00"
@.str5719 = constant [4 x i8] c"sub\00"
@.str5724 = constant [2 x i8] c"*\00"
@.str5729 = constant [4 x i8] c"mul\00"
@.str5734 = constant [2 x i8] c"/\00"
@.str5739 = constant [5 x i8] c"sdiv\00"
@.str5744 = constant [3 x i8] c"==\00"
@.str5749 = constant [8 x i8] c"icmp eq\00"
@.str5754 = constant [3 x i8] c"!=\00"
@.str5759 = constant [8 x i8] c"icmp ne\00"
@.str5764 = constant [2 x i8] c">\00"
@.str5769 = constant [9 x i8] c"icmp sgt\00"
@.str5774 = constant [2 x i8] c"<\00"
@.str5779 = constant [9 x i8] c"icmp slt\00"
@.str5784 = constant [2 x i8] c"&\00"
@.str5789 = constant [4 x i8] c"and\00"
@.str5794 = constant [2 x i8] c"|\00"
@.str5799 = constant [3 x i8] c"or\00"
@.str5804 = constant [3 x i8] c">=\00"
@.str5809 = constant [9 x i8] c"icmp sge\00"
@.str5814 = constant [3 x i8] c"<=\00"
@.str5819 = constant [9 x i8] c"icmp sle\00"
@.str5823 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5830 = constant [4 x i8] c"add\00"
@.str5836 = constant [3 x i8] c"==\00"
@.str5843 = constant [3 x i8] c"!=\00"
@.str5851 = constant [2 x i8] c"|\00"
@.str5859 = constant [2 x i8] c"&\00"
@.str5867 = constant [2 x i8] c">\00"
@.str5875 = constant [2 x i8] c"<\00"
@.str5883 = constant [3 x i8] c">=\00"
@.str5891 = constant [3 x i8] c"<=\00"
@.str5899 = constant [5 x i8] c"bool\00"
@.str5903 = constant [4 x i8] c"int\00"
@.str5913 = constant [7 x i8] c"NUMBER\00"
@.str5927 = constant [4 x i8] c"int\00"
@.str5941 = constant [5 x i8] c"WORD\00"
@.str5951 = constant [5 x i8] c"null\00"
@.str5958 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5972 = constant [5 x i8] c"null\00"
@.str5981 = constant [8 x i8] c"nullptr\00"
@.str5988 = constant [17 x i8] c"addr_destination\00"
@.str6000 = constant [12 x i8] c"destination\00"
@.str6039 = constant [4 x i8] c"ptr\00"
@.str6058 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6070 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6084 = constant [8 x i8] c"boolean\00"
@.str6098 = constant [5 x i8] c"bool\00"
@.str6107 = constant [6 x i8] c"false\00"
@.str6114 = constant [2 x i8] c"0\00"
@.str6118 = constant [2 x i8] c"1\00"
@.str6125 = constant [8 x i8] c"fn_call\00"
@.str6142 = constant [7 x i8] c"STRING\00"
@.str6166 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6182 = constant [4 x i8] c"ptr\00"
@.str6195 = constant [4 x i8] c"chr\00"
@.str6202 = constant [4 x i8] c"CHR\00"
@.str6217 = constant [2 x i8] c"0\00"
@.str6233 = constant [22 x i8] c"Invalid character: %s\00"
@.str6249 = constant [4 x i8] c"chr\00"
@.str6253 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6281 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6287 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6292 = constant [4 x i8] c"int\00"
@.str6297 = constant [2 x i8] c"i\00"
@.str6302 = constant [5 x i8] c"bool\00"
@.str6307 = constant [2 x i8] c"b\00"
@.str6312 = constant [5 x i8] c"void\00"
@.str6317 = constant [2 x i8] c"v\00"
@.str6322 = constant [4 x i8] c"chr\00"
@.str6327 = constant [2 x i8] c"c\00"
@.str6332 = constant [4 x i8] c"ptr\00"
@.str6338 = constant [4 x i8] c"%sp\00"
@.str6349 = constant [10 x i8] c"typealias\00"
@.str6360 = constant [6 x i8] c"error\00"
@.str6365 = constant [2 x i8] c"?\00"
@.str6367 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str6377 = constant [7 x i8] c".str%d\00"
@.str6400 = constant [6 x i8] c"array\00"
@.str6413 = constant [4 x i8] c"chr\00"
@.str6431 = constant [3 x i8] c"%d\00"
@.str6440 = constant [7 x i8] c"string\00"
@.str6459 = constant [7 x i8] c"module\00"
@.str6493 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6499 = constant [2 x i8] c"?\00"
@.str6505 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6510 = constant [4 x i8] c"int\00"
@.str6515 = constant [4 x i8] c"i32\00"
@.str6520 = constant [5 x i8] c"void\00"
@.str6525 = constant [5 x i8] c"void\00"
@.str6530 = constant [5 x i8] c"bool\00"
@.str6535 = constant [3 x i8] c"i1\00"
@.str6540 = constant [8 x i8] c"nullptr\00"
@.str6545 = constant [4 x i8] c"ptr\00"
@.str6550 = constant [4 x i8] c"chr\00"
@.str6555 = constant [3 x i8] c"i8\00"
@.str6560 = constant [9 x i8] c"function\00"
@.str6566 = constant [4 x i8] c"%s(\00"
@.str6591 = constant [4 x i8] c"%s,\00"
@.str6596 = constant [5 x i8] c"%s%s\00"
@.str6607 = constant [4 x i8] c"%s)\00"
@.str6615 = constant [4 x i8] c"ptr\00"
@.str6621 = constant [4 x i8] c"%s*\00"
@.str6633 = constant [7 x i8] c"struct\00"
@.str6639 = constant [2 x i8] c"{\00"
@.str6655 = constant [4 x i8] c"%s,\00"
@.str6660 = constant [5 x i8] c"%s%s\00"
@.str6671 = constant [4 x i8] c"%s}\00"
@.str6679 = constant [6 x i8] c"array\00"
@.str6685 = constant [10 x i8] c"[%s x %s]\00"
@.str6704 = constant [10 x i8] c"typealias\00"
@.str6710 = constant [5 x i8] c"%%%s\00"
@.str6720 = constant [7 x i8] c"vararg\00"
@.str6725 = constant [4 x i8] c"...\00"
@.str6730 = constant [6 x i8] c"error\00"
@.str6735 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6804 = constant [9 x i8] c"function\00"
@.str6819 = constant [5 x i8] c"WORD\00"
@.str6875 = constant [10 x i8] c"fn_params\00"
@.str6889 = constant [10 x i8] c"structdef\00"
@.str6896 = constant [7 x i8] c"struct\00"
@.str6903 = constant [5 x i8] c"type\00"
@.str6932 = constant [5 x i8] c"type\00"
@.str6959 = constant [5 x i8] c"type\00"
@.str6965 = constant [12 x i8] c"dotted_name\00"
@.str6977 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6990 = constant [6 x i8] c"error\00"
@.str6995 = constant [10 x i8] c"typealias\00"
@.str7019 = constant [4 x i8] c"str\00"
@.str7026 = constant [4 x i8] c"ptr\00"
@.str7035 = constant [4 x i8] c"chr\00"
@.str7040 = constant [5 x i8] c"WORD\00"
@.str7053 = constant [4 x i8] c"...\00"
@.str7060 = constant [7 x i8] c"vararg\00"
@.str7064 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7084 = constant [2 x i8] c"*\00"
@.str7092 = constant [4 x i8] c"ptr\00"
@.str7101 = constant [2 x i8] c"[\00"
@.str7111 = constant [2 x i8] c"]\00"
@.str7119 = constant [7 x i8] c"struct\00"
@.str7124 = constant [4 x i8] c"ptr\00"
@.str7128 = constant [6 x i8] c"c_arr\00"
@.str7139 = constant [4 x i8] c"int\00"
@.str7143 = constant [4 x i8] c"len\00"
@.str7151 = constant [4 x i8] c"int\00"
@.str7155 = constant [4 x i8] c"cap\00"
@.str7166 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7178 = load i32, i32* %argc
%.tmp7179 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7178, i8** %.tmp7179)
%.tmp7180 = load i32, i32* @STDERR
%.tmp7182 = getelementptr [2 x i8], [2 x i8]*@.str7181, i32 0, i32 0
%.tmp7183 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7180, i8* %.tmp7182)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7183, %m0$.File.type** %stderr
%.tmp7184 = load i8**, i8*** %argv
%.tmp7185 = getelementptr i8*, i8** %.tmp7184, i32 1
%.tmp7186 = load i8*, i8** %.tmp7185
%filename = alloca i8*
store i8* %.tmp7186, i8** %filename
%.tmp7187 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7187, %m0$.File.type** %llvm_code
%.tmp7188 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7189 = load i8*, i8** %filename
%.tmp7190 = call %m1811$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1811$new_context.m1811$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7188, i8* %.tmp7189)
%compiler_ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.tmp7190, %m1811$.CompilerCtx.type** %compiler_ctx
%.tmp7191 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %compiler_ctx
%.tmp7192 = load i8*, i8** %filename
%.tmp7193 = call i1(%m1811$.CompilerCtx.type*,i8*) @m1811$compile_file.b.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp7191, i8* %.tmp7192)
br i1 %.tmp7193, label %.if.true.7194, label %.if.false.7194
.if.true.7194:
%.tmp7195 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7197 = getelementptr [34 x i8], [34 x i8]*@.str7196, i32 0, i32 0
%.tmp7198 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7195, i8* %.tmp7197)
ret i32 1
br label %.if.end.7194
.if.false.7194:
br label %.if.end.7194
.if.end.7194:
%.tmp7199 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7200 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7199)
%.tmp7201 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7202 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7201)
%llvm_code_size = alloca i32
store i32 %.tmp7202, i32* %llvm_code_size
%.tmp7203 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7203)
%.tmp7205 = getelementptr [30 x i8], [30 x i8]*@.str7204, i32 0, i32 0
%.tmp7207 = getelementptr [2 x i8], [2 x i8]*@.str7206, i32 0, i32 0
%.tmp7208 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7205, i8* %.tmp7207)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7208, %m0$.File.type** %proc
%.tmp7209 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7210 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7209)
%.tmp7211 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7212 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7211)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7210, i32 %.tmp7212)
%.tmp7213 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7214 = icmp eq %m0$.File.type* %.tmp7213, null
br i1 %.tmp7214, label %.if.true.7215, label %.if.false.7215
.if.true.7215:
%.tmp7216 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7218 = getelementptr [28 x i8], [28 x i8]*@.str7217, i32 0, i32 0
%.tmp7219 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7216, i8* %.tmp7218)
ret i32 0
br label %.if.end.7215
.if.false.7215:
br label %.if.end.7215
.if.end.7215:
%.tmp7220 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7221 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7220)
%.tmp7222 = icmp ne i32 %.tmp7221, 0
br i1 %.tmp7222, label %.if.true.7223, label %.if.false.7223
.if.true.7223:
%.tmp7224 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7226 = getelementptr [24 x i8], [24 x i8]*@.str7225, i32 0, i32 0
%.tmp7227 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7224, i8* %.tmp7226)
ret i32 0
br label %.if.end.7223
.if.false.7223:
br label %.if.end.7223
.if.end.7223:
%.tmp7229 = getelementptr [17 x i8], [17 x i8]*@.str7228, i32 0, i32 0
%.tmp7231 = getelementptr [2 x i8], [2 x i8]*@.str7230, i32 0, i32 0
%.tmp7232 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7229, i8* %.tmp7231)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7232, %m0$.File.type** %gcc_proc
%.tmp7233 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp7234 = icmp eq %m0$.File.type* %.tmp7233, null
br i1 %.tmp7234, label %.if.true.7235, label %.if.false.7235
.if.true.7235:
%.tmp7236 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7238 = getelementptr [28 x i8], [28 x i8]*@.str7237, i32 0, i32 0
%.tmp7239 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7236, i8* %.tmp7238)
ret i32 0
br label %.if.end.7235
.if.false.7235:
br label %.if.end.7235
.if.end.7235:
%.tmp7240 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7241 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7240)
%.tmp7242 = icmp ne i32 %.tmp7241, 0
br i1 %.tmp7242, label %.if.true.7243, label %.if.false.7243
.if.true.7243:
%.tmp7244 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7246 = getelementptr [23 x i8], [23 x i8]*@.str7245, i32 0, i32 0
%.tmp7247 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7244, i8* %.tmp7246)
br label %.if.end.7243
.if.false.7243:
%.tmp7249 = getelementptr [32 x i8], [32 x i8]*@.str7248, i32 0, i32 0
%.tmp7250 = load i8*, i8** %filename
%.tmp7251 = call i32(i8*,...) @printf(i8* %.tmp7249, i8* %.tmp7250)
br label %.if.end.7243
.if.end.7243:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7252 = load i32, i32* %argc
%.tmp7253 = icmp eq i32 %.tmp7252, 2
br i1 %.tmp7253, label %.if.true.7254, label %.if.false.7254
.if.true.7254:
ret void
br label %.if.end.7254
.if.false.7254:
br label %.if.end.7254
.if.end.7254:
%.tmp7256 = getelementptr [21 x i8], [21 x i8]*@.str7255, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp7256, i8** %tmpl
%.tmp7257 = load i8**, i8*** %argv
%.tmp7258 = getelementptr i8*, i8** %.tmp7257, i32 0
%.tmp7259 = load i8*, i8** %.tmp7258
%.tmp7260 = call i32(i8*) @strlen(i8* %.tmp7259)
%.tmp7261 = load i8*, i8** %tmpl
%.tmp7262 = call i32(i8*) @strlen(i8* %.tmp7261)
%.tmp7263 = add i32 %.tmp7260, %.tmp7262
%len_filename = alloca i32
store i32 %.tmp7263, i32* %len_filename
%.tmp7264 = load i32, i32* %len_filename
%.tmp7265 = call i8*(i32) @malloc(i32 %.tmp7264)
%buf = alloca i8*
store i8* %.tmp7265, i8** %buf
%.tmp7266 = load i8*, i8** %buf
%.tmp7267 = load i8*, i8** %tmpl
%.tmp7268 = load i8**, i8*** %argv
%.tmp7269 = getelementptr i8*, i8** %.tmp7268, i32 0
%.tmp7270 = load i8*, i8** %.tmp7269
%.tmp7271 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7266, i8* %.tmp7267, i8* %.tmp7270)
%.tmp7272 = load i8*, i8** %buf
%.tmp7273 = call i32(i8*) @puts(i8* %.tmp7272)
%.tmp7274 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp7274)
call void(i32) @exit(i32 1)
ret void
}
@.str7181 = constant [2 x i8] c"w\00"
@.str7196 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7204 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7206 = constant [2 x i8] c"w\00"
@.str7217 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7225 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7228 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7230 = constant [2 x i8] c"w\00"
@.str7237 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7245 = constant [23 x i8] c"error on gcc execution\00"
@.str7248 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7255 = constant [21 x i8] c"Usage: %s <filename>\00"
