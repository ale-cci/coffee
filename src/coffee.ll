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
%.tmp2872 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp2871, i32 0, i32 0
%.tmp2873 = load %m754$.Error.type*, %m754$.Error.type** %.tmp2872
call void(%m754$.Error.type*) @m754$report.v.m754$.Error.typep(%m754$.Error.type* %.tmp2873)
%.tmp2874 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %err
%.tmp2875 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp2874, i32 0, i32 1
%.tmp2876 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp2875
store %m1811$.ErrorList.type* %.tmp2876, %m1811$.ErrorList.type** %err
br label %.for.start.2865
.for.end.2865:
%.tmp2878 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2879 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2878, i32 0, i32 3
%.tmp2880 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp2879
%g = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.tmp2880, %m1811$.GlobalName.type** %g
br label %.for.start.2877
.for.start.2877:
%.tmp2881 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2882 = icmp ne %m1811$.GlobalName.type* %.tmp2881, null
br i1 %.tmp2882, label %.for.continue.2877, label %.for.end.2877
.for.continue.2877:
%.tmp2883 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2884 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
call void(%m1811$.CompilerCtx.type*,%m1811$.GlobalName.type*) @m1811$compile_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.tmp2883, %m1811$.GlobalName.type* %.tmp2884)
%.tmp2885 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2886 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2885, i32 0, i32 4
%.tmp2887 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp2886
store %m1811$.GlobalName.type* %.tmp2887, %m1811$.GlobalName.type** %g
br label %.for.start.2877
.for.end.2877:
%.tmp2888 = load i1, i1* %has_errors
ret i1 %.tmp2888
}
define void @m1811$compile_ast.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2889 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2890 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2889, i32 0, i32 0
%.tmp2891 = load i8*, i8** %.tmp2890
%.tmp2893 = getelementptr [6 x i8], [6 x i8]*@.str2892, i32 0, i32 0
%.tmp2894 = call i32(i8*,i8*) @strcmp(i8* %.tmp2891, i8* %.tmp2893)
%.tmp2895 = icmp ne i32 %.tmp2894, 0
br i1 %.tmp2895, label %.if.true.2896, label %.if.false.2896
.if.true.2896:
ret void
br label %.if.end.2896
.if.false.2896:
br label %.if.end.2896
.if.end.2896:
%.tmp2897 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2899 = getelementptr [7 x i8], [7 x i8]*@.str2898, i32 0, i32 0
%.tmp2900 = bitcast ptr null to i8*
%.tmp2901 = bitcast ptr null to i8*
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp2897, i8* %.tmp2899, i8* %.tmp2900, i8* %.tmp2901)
%.tmp2902 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2903 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2902, i32 0, i32 6
%.tmp2904 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2903
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2904, %m286$.Node.type** %start
%.tmp2905 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2906 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2905, i32 0, i32 0
%.tmp2907 = load i8*, i8** %.tmp2906
%.tmp2909 = getelementptr [13 x i8], [13 x i8]*@.str2908, i32 0, i32 0
%.tmp2910 = call i32(i8*,i8*) @strcmp(i8* %.tmp2907, i8* %.tmp2909)
%.tmp2911 = icmp eq i32 %.tmp2910, 0
br i1 %.tmp2911, label %.if.true.2912, label %.if.false.2912
.if.true.2912:
%.tmp2913 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2914 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2913, i32 0, i32 7
%.tmp2915 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2914
store %m286$.Node.type* %.tmp2915, %m286$.Node.type** %start
br label %.if.end.2912
.if.false.2912:
br label %.if.end.2912
.if.end.2912:
%.tmp2917 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2917, %m286$.Node.type** %stmt
br label %.for.start.2916
.for.start.2916:
%.tmp2918 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2919 = icmp ne %m286$.Node.type* %.tmp2918, null
br i1 %.tmp2919, label %.for.continue.2916, label %.for.end.2916
.for.continue.2916:
%.tmp2920 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2921 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2922 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2921, i32 0, i32 6
%.tmp2923 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2922
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1811$compile_statement.v.m1811$.CompilerCtx.typep.m286$.Node.typep.b(%m1811$.CompilerCtx.type* %.tmp2920, %m286$.Node.type* %.tmp2923, i1 1)
%.tmp2924 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2925 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2924, i32 0, i32 7
%.tmp2926 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2925
store %m286$.Node.type* %.tmp2926, %m286$.Node.type** %stmt
br label %.for.start.2916
.for.end.2916:
%.tmp2928 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2928, %m286$.Node.type** %s
br label %.for.start.2927
.for.start.2927:
%.tmp2929 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2930 = icmp ne %m286$.Node.type* %.tmp2929, null
br i1 %.tmp2930, label %.for.continue.2927, label %.for.end.2927
.for.continue.2927:
%.tmp2931 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2932 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2933 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2932, i32 0, i32 6
%.tmp2934 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2933
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1811$compile_statement.v.m1811$.CompilerCtx.typep.m286$.Node.typep.b(%m1811$.CompilerCtx.type* %.tmp2931, %m286$.Node.type* %.tmp2934, i1 0)
%.tmp2935 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2936 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2935, i32 0, i32 7
%.tmp2937 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2936
store %m286$.Node.type* %.tmp2937, %m286$.Node.type** %s
br label %.for.start.2927
.for.end.2927:
ret void
}
define void @m1811$compile_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%g = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.g.arg, %m1811$.GlobalName.type** %g
%.tmp2938 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2939 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2938, i32 0, i32 2
%.tmp2940 = load i1, i1* %.tmp2939
%.tmp2941 = icmp eq i1 %.tmp2940, 0
%.tmp2942 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2943 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2942, i32 0, i32 1
%.tmp2944 = load i8*, i8** %.tmp2943
%.tmp2946 = getelementptr [7 x i8], [7 x i8]*@.str2945, i32 0, i32 0
%.tmp2947 = call i32(i8*,i8*) @strcmp(i8* %.tmp2944, i8* %.tmp2946)
%.tmp2948 = icmp eq i32 %.tmp2947, 0
%.tmp2949 = and i1 %.tmp2941, %.tmp2948
br i1 %.tmp2949, label %.if.true.2950, label %.if.false.2950
.if.true.2950:
%.tmp2951 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2952 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp2951, i32 0, i32 1
%.tmp2953 = load %m0$.File.type*, %m0$.File.type** %.tmp2952
%.tmp2955 = getelementptr [21 x i8], [21 x i8]*@.str2954, i32 0, i32 0
%.tmp2956 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2957 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2956, i32 0, i32 3
%.tmp2958 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp2957
%.tmp2959 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp2958)
%.tmp2960 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2961 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2962 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2961, i32 0, i32 3
%.tmp2963 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp2962
%.tmp2964 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp2963, i32 0, i32 3
%.tmp2965 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp2964
%.tmp2966 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp2960, %m1811$.Type.type* %.tmp2965)
%.tmp2967 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2968 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2967, i32 0, i32 0
%.tmp2969 = load i8*, i8** %.tmp2968
%.tmp2970 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2953, i8* %.tmp2955, i8* %.tmp2959, i8* %.tmp2966, i8* %.tmp2969)
%.tmp2971 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
%.tmp2972 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp2971, i32 0, i32 2
store i1 1, i1* %.tmp2972
br label %.if.end.2950
.if.false.2950:
br label %.if.end.2950
.if.end.2950:
ret void
}
define i8* @m1811$get_mod_prefix.cp.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2973 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2974 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp2973)
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp2974, %m1811$.ModuleLookup.type** %m
%.tmp2975 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp2976 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp2975, i32 0, i32 1
%.tmp2977 = load i8*, i8** %.tmp2976
ret i8* %.tmp2977
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
%.tmp2978 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp2979 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2980 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2979, i32 0, i32 2
%.tmp2981 = load i8*, i8** %.tmp2980
%.tmp2982 = call i8*(%m1811$.CompilerCtx.type*,i8*) @m1811$get_mod_prefix.cp.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp2978, i8* %.tmp2981)
%prefix = alloca i8*
store i8* %.tmp2982, i8** %prefix
%.tmp2983 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2985 = getelementptr [5 x i8], [5 x i8]*@.str2984, i32 0, i32 0
%.tmp2986 = load i8*, i8** %prefix
%.tmp2987 = load i8*, i8** %original_name
%.tmp2988 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2983, i8* %.tmp2985, i8* %.tmp2986, i8* %.tmp2987)
%.tmp2989 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp2990 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp2989, i32 0, i32 0
%.tmp2991 = load i8*, i8** %.tmp2990
%.tmp2993 = getelementptr [9 x i8], [9 x i8]*@.str2992, i32 0, i32 0
%.tmp2994 = call i32(i8*,i8*) @strcmp(i8* %.tmp2991, i8* %.tmp2993)
%.tmp2995 = icmp eq i32 %.tmp2994, 0
br i1 %.tmp2995, label %.if.true.2996, label %.if.false.2996
.if.true.2996:
%.tmp2997 = load i8*, i8** %mangled_name
%.tmp2999 = getelementptr [5 x i8], [5 x i8]*@.str2998, i32 0, i32 0
%.tmp3000 = call i32(i8*,i8*) @strcmp(i8* %.tmp2997, i8* %.tmp2999)
%.tmp3001 = icmp ne i32 %.tmp3000, 0
br i1 %.tmp3001, label %.if.true.3002, label %.if.false.3002
.if.true.3002:
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%swap_var = alloca i8*
store i8* null, i8** %swap_var
%.tmp3004 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp3005 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3004, i32 0, i32 3
%.tmp3006 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3005
%tp = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3006, %m1811$.Type.type** %tp
br label %.for.start.3003
.for.start.3003:
%.tmp3007 = load %m1811$.Type.type*, %m1811$.Type.type** %tp
%.tmp3008 = icmp ne %m1811$.Type.type* %.tmp3007, null
br i1 %.tmp3008, label %.for.continue.3003, label %.for.end.3003
.for.continue.3003:
%.tmp3009 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3011 = getelementptr [6 x i8], [6 x i8]*@.str3010, i32 0, i32 0
%.tmp3012 = load i8*, i8** %mangled_name
%.tmp3013 = load %m1811$.Type.type*, %m1811$.Type.type** %tp
%.tmp3014 = call i8*(%m1811$.Type.type*) @m1811$type_abbr.cp.m1811$.Type.typep(%m1811$.Type.type* %.tmp3013)
%.tmp3015 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3009, i8* %.tmp3011, i8* %.tmp3012, i8* %.tmp3014)
%.tmp3016 = load i8*, i8** %tmp_buff
store i8* %.tmp3016, i8** %swap_var
%.tmp3017 = load i8*, i8** %mangled_name
store i8* %.tmp3017, i8** %tmp_buff
%.tmp3018 = load i8*, i8** %swap_var
store i8* %.tmp3018, i8** %mangled_name
%.tmp3019 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp3019)
%.tmp3020 = load %m1811$.Type.type*, %m1811$.Type.type** %tp
%.tmp3021 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3020, i32 0, i32 4
%.tmp3022 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3021
store %m1811$.Type.type* %.tmp3022, %m1811$.Type.type** %tp
br label %.for.start.3003
.for.end.3003:
br label %.if.end.3002
.if.false.3002:
br label %.if.end.3002
.if.end.3002:
br label %.if.end.2996
.if.false.2996:
br label %.if.end.2996
.if.end.2996:
%.tmp3023 = load i8*, i8** %mangled_name
ret i8* %.tmp3023
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
%.tmp3024 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3025 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3024, i32 0, i32 0
%.tmp3026 = load i8*, i8** %.tmp3025
%.tmp3028 = getelementptr [3 x i8], [3 x i8]*@.str3027, i32 0, i32 0
%.tmp3029 = call i32(i8*,i8*) @strcmp(i8* %.tmp3026, i8* %.tmp3028)
%.tmp3030 = icmp eq i32 %.tmp3029, 0
br i1 %.tmp3030, label %.if.true.3031, label %.if.false.3031
.if.true.3031:
ret void
br label %.if.end.3031
.if.false.3031:
%.tmp3032 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3033 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3032, i32 0, i32 0
%.tmp3034 = load i8*, i8** %.tmp3033
%.tmp3036 = getelementptr [7 x i8], [7 x i8]*@.str3035, i32 0, i32 0
%.tmp3037 = call i32(i8*,i8*) @strcmp(i8* %.tmp3034, i8* %.tmp3036)
%.tmp3038 = icmp eq i32 %.tmp3037, 0
br i1 %.tmp3038, label %.if.true.3039, label %.if.false.3039
.if.true.3039:
%.tmp3040 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3041 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3040, i32 0, i32 6
%.tmp3042 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3041
%.tmp3044 = getelementptr [11 x i8], [11 x i8]*@.str3043, i32 0, i32 0
%.tmp3045 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3042, i8* %.tmp3044)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3045, %m286$.Node.type** %assignable
%.tmp3046 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3047 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp3048 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3046, %m286$.Node.type* %.tmp3047)
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3048, %m1811$.AssignableInfo.type** %a_info
%.tmp3049 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3050 = icmp eq %m1811$.AssignableInfo.type* %.tmp3049, null
br i1 %.tmp3050, label %.if.true.3051, label %.if.false.3051
.if.true.3051:
ret void
br label %.if.end.3051
.if.false.3051:
br label %.if.end.3051
.if.end.3051:
%.tmp3052 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3053 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3052)
store %m1811$.AssignableInfo.type* %.tmp3053, %m1811$.AssignableInfo.type** %info
%.tmp3054 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3055 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3054, i32 0, i32 6
%.tmp3056 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3055
%.tmp3057 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3056, i32 0, i32 7
%.tmp3058 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3057
%.tmp3059 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3058, i32 0, i32 1
%.tmp3060 = load i8*, i8** %.tmp3059
%global_name = alloca i8*
store i8* %.tmp3060, i8** %global_name
%.tmp3061 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3062 = load i8, i8* @SCOPE_GLOBAL
%.tmp3063 = load i8*, i8** %global_name
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3061, i8 %.tmp3062, i8* %.tmp3063)
%.tmp3064 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3065 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3064, i32 0, i32 3
%.tmp3066 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3067 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3066, i32 0, i32 3
%.tmp3068 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3067
store %m1811$.Type.type* %.tmp3068, %m1811$.Type.type** %.tmp3065
%.tmp3069 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3070 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3069, i32 0, i32 2
%.tmp3072 = getelementptr [9 x i8], [9 x i8]*@.str3071, i32 0, i32 0
store i8* %.tmp3072, i8** %.tmp3070
%.tmp3073 = load i1, i1* %shallow
%.tmp3074 = icmp eq i1 %.tmp3073, 1
br i1 %.tmp3074, label %.if.true.3075, label %.if.false.3075
.if.true.3075:
%.tmp3076 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3077 = load i8*, i8** %global_name
%.tmp3078 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3076, i8* %.tmp3077, %m1811$.AssignableInfo.type* %.tmp3078)
br label %.if.end.3075
.if.false.3075:
%.tmp3079 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3080 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3079, i32 0, i32 1
%.tmp3081 = load %m0$.File.type*, %m0$.File.type** %.tmp3080
%.tmp3083 = getelementptr [21 x i8], [21 x i8]*@.str3082, i32 0, i32 0
%.tmp3084 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3085 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3084)
%.tmp3086 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3087 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3088 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3087, i32 0, i32 3
%.tmp3089 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3088
%.tmp3090 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3086, %m1811$.Type.type* %.tmp3089)
%.tmp3091 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3092 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3091)
%.tmp3093 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3081, i8* %.tmp3083, i8* %.tmp3085, i8* %.tmp3090, i8* %.tmp3092)
br label %.if.end.3075
.if.end.3075:
br label %.if.end.3039
.if.false.3039:
%.tmp3094 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3095 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3094, i32 0, i32 0
%.tmp3096 = load i8*, i8** %.tmp3095
%.tmp3098 = getelementptr [10 x i8], [10 x i8]*@.str3097, i32 0, i32 0
%.tmp3099 = call i32(i8*,i8*) @strcmp(i8* %.tmp3096, i8* %.tmp3098)
%.tmp3100 = icmp eq i32 %.tmp3099, 0
br i1 %.tmp3100, label %.if.true.3101, label %.if.false.3101
.if.true.3101:
%.tmp3102 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3103 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3102, i32 0, i32 6
%.tmp3104 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3103
%.tmp3105 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3104, i32 0, i32 7
%.tmp3106 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3105
%.tmp3107 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3106, i32 0, i32 1
%.tmp3108 = load i8*, i8** %.tmp3107
%type_name = alloca i8*
store i8* %.tmp3108, i8** %type_name
%.tmp3109 = load i1, i1* %shallow
%.tmp3110 = icmp eq i1 %.tmp3109, 1
br i1 %.tmp3110, label %.if.true.3111, label %.if.false.3111
.if.true.3111:
%.tmp3112 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3113 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3112)
store %m1811$.AssignableInfo.type* %.tmp3113, %m1811$.AssignableInfo.type** %info
%.tmp3114 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3115 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3114)
%mod_from = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp3115, %m1811$.ModuleLookup.type** %mod_from
%.tmp3116 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3118 = getelementptr [11 x i8], [11 x i8]*@.str3117, i32 0, i32 0
%.tmp3119 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod_from
%.tmp3120 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3119, i32 0, i32 1
%.tmp3121 = load i8*, i8** %.tmp3120
%.tmp3122 = load i8*, i8** %type_name
%.tmp3123 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3116, i8* %.tmp3118, i8* %.tmp3121, i8* %.tmp3122)
%.tmp3124 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3125 = load i8, i8* @SCOPE_LOCAL
%.tmp3126 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3124, i8 %.tmp3125, i8* %.tmp3126)
%.tmp3127 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3128 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3127, i32 0, i32 2
%.tmp3130 = getelementptr [10 x i8], [10 x i8]*@.str3129, i32 0, i32 0
store i8* %.tmp3130, i8** %.tmp3128
%.tmp3131 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3132 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3131, i32 0, i32 4
%.tmp3133 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3134 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3133, i32 0, i32 3
%.tmp3135 = load i32, i32* %.tmp3134
store i32 %.tmp3135, i32* %.tmp3132
%.tmp3136 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3137 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3136, i32 0, i32 5
%.tmp3138 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3139 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3138, i32 0, i32 4
%.tmp3140 = load i32, i32* %.tmp3139
store i32 %.tmp3140, i32* %.tmp3137
%.tmp3141 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3142 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3141, i32 0, i32 3
%.tmp3143 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3143, %m1811$.Type.type** %.tmp3142
%.tmp3144 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3145 = load i8*, i8** %type_name
%.tmp3146 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3144, i8* %.tmp3145, %m1811$.AssignableInfo.type* %.tmp3146)
%.tmp3147 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3148 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3147, i32 0, i32 6
%.tmp3149 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3148
%.tmp3151 = getelementptr [5 x i8], [5 x i8]*@.str3150, i32 0, i32 0
%.tmp3152 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3149, i8* %.tmp3151)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3152, %m286$.Node.type** %type_decl
%.tmp3153 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3154 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp3155 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3154, i32 0, i32 6
%.tmp3156 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3155
%.tmp3157 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3153, %m286$.Node.type* %.tmp3156)
%type_struct = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3157, %m1811$.Type.type** %type_struct
%.tmp3158 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3159 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3158, i32 0, i32 3
%.tmp3160 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3159
%.tmp3161 = load %m1811$.Type.type*, %m1811$.Type.type** %type_struct
call void(%m1811$.Type.type*,%m1811$.Type.type*) @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp3160, %m1811$.Type.type* %.tmp3161)
%.tmp3162 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3163 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3162, i32 0, i32 3
%.tmp3164 = load %m1811$.Type.type*, %m1811$.Type.type** %type_struct
store %m1811$.Type.type* %.tmp3164, %m1811$.Type.type** %.tmp3163
br label %.if.end.3111
.if.false.3111:
%.tmp3165 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3166 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3167 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3166, i32 0, i32 6
%.tmp3168 = load i8*, i8** %.tmp3167
%.tmp3169 = load i8*, i8** %type_name
%.tmp3170 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp3165, i8* %.tmp3168, i8* %.tmp3169)
%scope = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp3170, %m1811$.ScopeItem.type** %scope
%.tmp3171 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope
%.tmp3172 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp3171, i32 0, i32 1
%.tmp3173 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp3172
store %m1811$.AssignableInfo.type* %.tmp3173, %m1811$.AssignableInfo.type** %info
%.tmp3174 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3175 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3174, i32 0, i32 1
%.tmp3176 = load %m0$.File.type*, %m0$.File.type** %.tmp3175
%.tmp3178 = getelementptr [14 x i8], [14 x i8]*@.str3177, i32 0, i32 0
%.tmp3179 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3180 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3179)
%.tmp3181 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3182 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3183 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3182, i32 0, i32 3
%.tmp3184 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3183
%.tmp3185 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3181, %m1811$.Type.type* %.tmp3184)
%.tmp3186 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3176, i8* %.tmp3178, i8* %.tmp3180, i8* %.tmp3185)
br label %.if.end.3111
.if.end.3111:
br label %.if.end.3101
.if.false.3101:
%.tmp3187 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3188 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3187, i32 0, i32 0
%.tmp3189 = load i8*, i8** %.tmp3188
%.tmp3191 = getelementptr [7 x i8], [7 x i8]*@.str3190, i32 0, i32 0
%.tmp3192 = call i32(i8*,i8*) @strcmp(i8* %.tmp3189, i8* %.tmp3191)
%.tmp3193 = icmp eq i32 %.tmp3192, 0
br i1 %.tmp3193, label %.if.true.3194, label %.if.false.3194
.if.true.3194:
%.tmp3195 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3196 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3195)
store %m1811$.AssignableInfo.type* %.tmp3196, %m1811$.AssignableInfo.type** %info
%.tmp3197 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3198 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3197, i32 0, i32 3
%.tmp3199 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3200 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3201 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3200, i32 0, i32 6
%.tmp3202 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3201
%.tmp3203 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3202, i32 0, i32 7
%.tmp3204 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3203
%.tmp3205 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$syn_function_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3199, %m286$.Node.type* %.tmp3204)
store %m1811$.Type.type* %.tmp3205, %m1811$.Type.type** %.tmp3198
%.tmp3206 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3207 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3206, i32 0, i32 2
%.tmp3209 = getelementptr [7 x i8], [7 x i8]*@.str3208, i32 0, i32 0
store i8* %.tmp3209, i8** %.tmp3207
%.tmp3210 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3211 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3210, i32 0, i32 6
%.tmp3212 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3211
%.tmp3213 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3212, i32 0, i32 7
%.tmp3214 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3213
%.tmp3215 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3214, i32 0, i32 7
%.tmp3216 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3215
%.tmp3217 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3216, i32 0, i32 1
%.tmp3218 = load i8*, i8** %.tmp3217
%fn_name = alloca i8*
store i8* %.tmp3218, i8** %fn_name
%.tmp3219 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3220 = load i8, i8* @SCOPE_GLOBAL
%.tmp3221 = load i8*, i8** %fn_name
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3219, i8 %.tmp3220, i8* %.tmp3221)
%.tmp3222 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3222, %m1811$.Type.type** %return_type
%.tmp3223 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3224 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3223, i32 0, i32 0
%.tmp3225 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3226 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3225, i32 0, i32 3
%.tmp3227 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3226
%.tmp3228 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3227, i32 0, i32 3
%.tmp3229 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3228
%.tmp3230 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3229, i32 0, i32 0
%.tmp3231 = load i8*, i8** %.tmp3230
store i8* %.tmp3231, i8** %.tmp3224
%.tmp3232 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3233 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3232, i32 0, i32 3
%.tmp3234 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3235 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3234, i32 0, i32 3
%.tmp3236 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3235
%.tmp3237 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3236, i32 0, i32 3
%.tmp3238 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3237
%.tmp3239 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3238, i32 0, i32 3
%.tmp3240 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3239
store %m1811$.Type.type* %.tmp3240, %m1811$.Type.type** %.tmp3233
%.tmp3241 = load i1, i1* %shallow
%.tmp3242 = icmp eq i1 %.tmp3241, 0
br i1 %.tmp3242, label %.if.true.3243, label %.if.false.3243
.if.true.3243:
%.tmp3244 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3245 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3244, i32 0, i32 1
%.tmp3246 = load %m0$.File.type*, %m0$.File.type** %.tmp3245
%.tmp3248 = getelementptr [15 x i8], [15 x i8]*@.str3247, i32 0, i32 0
%.tmp3249 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3250 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3251 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3249, %m1811$.Type.type* %.tmp3250)
%.tmp3252 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3253 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3252)
%.tmp3254 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3246, i8* %.tmp3248, i8* %.tmp3251, i8* %.tmp3253)
%.tmp3256 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3257 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3256, i32 0, i32 3
%.tmp3258 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3257
%.tmp3259 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3258, i32 0, i32 3
%.tmp3260 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3259
%.tmp3261 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3260, i32 0, i32 4
%.tmp3262 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3261
%pt = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3262, %m1811$.Type.type** %pt
br label %.for.start.3255
.for.start.3255:
%.tmp3263 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3264 = icmp ne %m1811$.Type.type* %.tmp3263, null
br i1 %.tmp3264, label %.for.continue.3255, label %.for.end.3255
.for.continue.3255:
%.tmp3265 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3266 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3267 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3266, i32 0, i32 3
%.tmp3268 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3267
%.tmp3269 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3268, i32 0, i32 3
%.tmp3270 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3269
%.tmp3271 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3270, i32 0, i32 4
%.tmp3272 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3271
%.tmp3273 = icmp ne %m1811$.Type.type* %.tmp3265, %.tmp3272
br i1 %.tmp3273, label %.if.true.3274, label %.if.false.3274
.if.true.3274:
%.tmp3275 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3276 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3275, i32 0, i32 1
%.tmp3277 = load %m0$.File.type*, %m0$.File.type** %.tmp3276
%.tmp3279 = getelementptr [3 x i8], [3 x i8]*@.str3278, i32 0, i32 0
%.tmp3280 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3277, i8* %.tmp3279)
br label %.if.end.3274
.if.false.3274:
br label %.if.end.3274
.if.end.3274:
%.tmp3281 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3282 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3281, i32 0, i32 1
%.tmp3283 = load %m0$.File.type*, %m0$.File.type** %.tmp3282
%.tmp3285 = getelementptr [3 x i8], [3 x i8]*@.str3284, i32 0, i32 0
%.tmp3286 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3287 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3288 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3286, %m1811$.Type.type* %.tmp3287)
%.tmp3289 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3283, i8* %.tmp3285, i8* %.tmp3288)
%.tmp3290 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp3291 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3290, i32 0, i32 4
%.tmp3292 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3291
store %m1811$.Type.type* %.tmp3292, %m1811$.Type.type** %pt
br label %.for.start.3255
.for.end.3255:
%.tmp3293 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3294 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3293, i32 0, i32 1
%.tmp3295 = load %m0$.File.type*, %m0$.File.type** %.tmp3294
%.tmp3297 = getelementptr [3 x i8], [3 x i8]*@.str3296, i32 0, i32 0
%.tmp3298 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3295, i8* %.tmp3297)
%.tmp3299 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3300 = bitcast %m1811$.Type.type* %.tmp3299 to i8*
call void(i8*) @free(i8* %.tmp3300)
br label %.if.end.3243
.if.false.3243:
%.tmp3301 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3302 = load i8*, i8** %fn_name
%.tmp3303 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3301, i8* %.tmp3302, %m1811$.AssignableInfo.type* %.tmp3303)
br label %.if.end.3243
.if.end.3243:
br label %.if.end.3194
.if.false.3194:
%.tmp3304 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3305 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3304, i32 0, i32 0
%.tmp3306 = load i8*, i8** %.tmp3305
%.tmp3308 = getelementptr [9 x i8], [9 x i8]*@.str3307, i32 0, i32 0
%.tmp3309 = call i32(i8*,i8*) @strcmp(i8* %.tmp3306, i8* %.tmp3308)
%.tmp3310 = icmp eq i32 %.tmp3309, 0
br i1 %.tmp3310, label %.if.true.3311, label %.if.false.3311
.if.true.3311:
%.tmp3312 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3313 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3312)
store %m1811$.AssignableInfo.type* %.tmp3313, %m1811$.AssignableInfo.type** %info
%.tmp3314 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3315 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3314, i32 0, i32 2
%.tmp3317 = getelementptr [9 x i8], [9 x i8]*@.str3316, i32 0, i32 0
store i8* %.tmp3317, i8** %.tmp3315
%.tmp3318 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3319 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3318, i32 0, i32 3
%.tmp3320 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3321 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3322 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3321, i32 0, i32 6
%.tmp3323 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3322
%.tmp3324 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$syn_function_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3320, %m286$.Node.type* %.tmp3323)
store %m1811$.Type.type* %.tmp3324, %m1811$.Type.type** %.tmp3319
%.tmp3325 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3326 = call i8*(%m286$.Node.type*) @m1811$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3325)
%name = alloca i8*
store i8* %.tmp3326, i8** %name
%.tmp3327 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3328 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3329 = load i8*, i8** %name
%.tmp3330 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3331 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3330, i32 0, i32 3
%.tmp3332 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3331
%.tmp3333 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1811$.Type.type*) @m1811$name_mangle.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3327, %m286$.Node.type* %.tmp3328, i8* %.tmp3329, %m1811$.Type.type* %.tmp3332)
store i8* %.tmp3333, i8** %tmp_buff
%.tmp3334 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3335 = load i8, i8* @SCOPE_GLOBAL
%.tmp3336 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3334, i8 %.tmp3335, i8* %.tmp3336)
%.tmp3337 = load i1, i1* %shallow
%.tmp3338 = icmp eq i1 %.tmp3337, 1
br i1 %.tmp3338, label %.if.true.3339, label %.if.false.3339
.if.true.3339:
%.tmp3340 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3341 = load i8*, i8** %name
%.tmp3342 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3340, i8* %.tmp3341, %m1811$.AssignableInfo.type* %.tmp3342)
br label %.if.end.3339
.if.false.3339:
%.tmp3343 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3343, %m1811$.Type.type** %return_type
%.tmp3344 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3345 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3346 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3345, i32 0, i32 3
%.tmp3347 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3346
%.tmp3348 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3347, i32 0, i32 3
%.tmp3349 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3348
call void(%m1811$.Type.type*,%m1811$.Type.type*) @m1811$copy_type.v.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp3344, %m1811$.Type.type* %.tmp3349)
%.tmp3350 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3351 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3350, i32 0, i32 1
%.tmp3352 = load %m0$.File.type*, %m0$.File.type** %.tmp3351
%.tmp3354 = getelementptr [14 x i8], [14 x i8]*@.str3353, i32 0, i32 0
%.tmp3355 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3356 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3357 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3355, %m1811$.Type.type* %.tmp3356)
%.tmp3358 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3359 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3358)
%.tmp3360 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3352, i8* %.tmp3354, i8* %.tmp3357, i8* %.tmp3359)
%.tmp3361 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3362 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3361, i32 0, i32 6
%.tmp3363 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3362
%.tmp3364 = call %m286$.Node.type*(%m286$.Node.type*) @m1811$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3363)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3364, %m286$.Node.type** %params
%param_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %param_type
%.tmp3366 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3366, %m286$.Node.type** %param_ptr
br label %.for.start.3365
.for.start.3365:
%.tmp3367 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3368 = icmp ne %m286$.Node.type* %.tmp3367, null
br i1 %.tmp3368, label %.for.continue.3365, label %.for.end.3365
.for.continue.3365:
%.tmp3369 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3370 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp3371 = icmp ne %m286$.Node.type* %.tmp3369, %.tmp3370
br i1 %.tmp3371, label %.if.true.3372, label %.if.false.3372
.if.true.3372:
%.tmp3373 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3374 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3373, i32 0, i32 7
%.tmp3375 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3374
store %m286$.Node.type* %.tmp3375, %m286$.Node.type** %param_ptr
%.tmp3376 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3377 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3376, i32 0, i32 1
%.tmp3378 = load %m0$.File.type*, %m0$.File.type** %.tmp3377
%.tmp3380 = getelementptr [3 x i8], [3 x i8]*@.str3379, i32 0, i32 0
%.tmp3381 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3378, i8* %.tmp3380)
br label %.if.end.3372
.if.false.3372:
br label %.if.end.3372
.if.end.3372:
%.tmp3382 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3383 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3382, i32 0, i32 0
%.tmp3384 = load i8*, i8** %.tmp3383
%.tmp3386 = getelementptr [5 x i8], [5 x i8]*@.str3385, i32 0, i32 0
%.tmp3387 = call i32(i8*,i8*) @strcmp(i8* %.tmp3384, i8* %.tmp3386)
%.tmp3388 = icmp eq i32 %.tmp3387, 0
br i1 %.tmp3388, label %.if.true.3389, label %.if.false.3389
.if.true.3389:
%.tmp3390 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3391 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3392 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3391, i32 0, i32 6
%.tmp3393 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3392
%.tmp3394 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3390, %m286$.Node.type* %.tmp3393)
store %m1811$.Type.type* %.tmp3394, %m1811$.Type.type** %param_type
%.tmp3395 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3396 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3395, i32 0, i32 7
%.tmp3397 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3396
store %m286$.Node.type* %.tmp3397, %m286$.Node.type** %param_ptr
br label %.if.end.3389
.if.false.3389:
br label %.if.end.3389
.if.end.3389:
%.tmp3398 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3399 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3398, i32 0, i32 1
%.tmp3400 = load %m0$.File.type*, %m0$.File.type** %.tmp3399
%.tmp3402 = getelementptr [13 x i8], [13 x i8]*@.str3401, i32 0, i32 0
%.tmp3403 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3404 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
%.tmp3405 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3403, %m1811$.Type.type* %.tmp3404)
%.tmp3406 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3407 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3406, i32 0, i32 1
%.tmp3408 = load i8*, i8** %.tmp3407
%.tmp3409 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3400, i8* %.tmp3402, i8* %.tmp3405, i8* %.tmp3408)
%.tmp3410 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3411 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3410, i32 0, i32 7
%.tmp3412 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3411
store %m286$.Node.type* %.tmp3412, %m286$.Node.type** %param_ptr
br label %.for.start.3365
.for.end.3365:
%.tmp3413 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3414 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3413, i32 0, i32 1
%.tmp3415 = load %m0$.File.type*, %m0$.File.type** %.tmp3414
%.tmp3417 = getelementptr [5 x i8], [5 x i8]*@.str3416, i32 0, i32 0
%.tmp3418 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3415, i8* %.tmp3417)
%.tmp3419 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3421 = getelementptr [9 x i8], [9 x i8]*@.str3420, i32 0, i32 0
%.tmp3422 = bitcast ptr null to i8*
%.tmp3423 = bitcast ptr null to i8*
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp3419, i8* %.tmp3421, i8* %.tmp3422, i8* %.tmp3423)
%.tmp3424 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3425 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_fn_params.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3424, %m286$.Node.type* %.tmp3425)
%.tmp3426 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3427 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3426, i32 0, i32 6
%.tmp3428 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3427
%.tmp3430 = getelementptr [6 x i8], [6 x i8]*@.str3429, i32 0, i32 0
%.tmp3431 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3428, i8* %.tmp3430)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3431, %m286$.Node.type** %fn_block
%.tmp3432 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3433 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3432, %m286$.Node.type* %.tmp3433)
%.tmp3434 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3434)
%.tmp3435 = bitcast ptr null to %m286$.Node.type*
%last_valid_instruction = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3435, %m286$.Node.type** %last_valid_instruction
%.tmp3437 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3438 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3437, i32 0, i32 6
%.tmp3439 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3438
%ci = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3439, %m286$.Node.type** %ci
br label %.for.start.3436
.for.start.3436:
%.tmp3440 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3441 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3440, i32 0, i32 7
%.tmp3442 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3441
%.tmp3443 = icmp ne %m286$.Node.type* %.tmp3442, null
br i1 %.tmp3443, label %.for.continue.3436, label %.for.end.3436
.for.continue.3436:
%.tmp3444 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3445 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3444, i32 0, i32 0
%.tmp3446 = load i8*, i8** %.tmp3445
%.tmp3448 = getelementptr [3 x i8], [3 x i8]*@.str3447, i32 0, i32 0
%.tmp3449 = call i32(i8*,i8*) @strcmp(i8* %.tmp3446, i8* %.tmp3448)
%.tmp3450 = icmp ne i32 %.tmp3449, 0
%.tmp3451 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3452 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3451, i32 0, i32 0
%.tmp3453 = load i8*, i8** %.tmp3452
%.tmp3455 = getelementptr [9 x i8], [9 x i8]*@.str3454, i32 0, i32 0
%.tmp3456 = call i32(i8*,i8*) @strcmp(i8* %.tmp3453, i8* %.tmp3455)
%.tmp3457 = icmp ne i32 %.tmp3456, 0
%.tmp3458 = and i1 %.tmp3450, %.tmp3457
br i1 %.tmp3458, label %.if.true.3459, label %.if.false.3459
.if.true.3459:
%.tmp3460 = load %m286$.Node.type*, %m286$.Node.type** %ci
store %m286$.Node.type* %.tmp3460, %m286$.Node.type** %last_valid_instruction
br label %.if.end.3459
.if.false.3459:
br label %.if.end.3459
.if.end.3459:
%.tmp3461 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3462 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3461, i32 0, i32 7
%.tmp3463 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3462
store %m286$.Node.type* %.tmp3463, %m286$.Node.type** %ci
br label %.for.start.3436
.for.end.3436:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3464 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3465 = icmp eq %m286$.Node.type* %.tmp3464, null
br i1 %.tmp3465, label %.if.true.3466, label %.if.false.3466
.if.true.3466:
store i1 1, i1* %add_implicit_return
br label %.if.end.3466
.if.false.3466:
%.tmp3467 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3468 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3467, i32 0, i32 6
%.tmp3469 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3468
%.tmp3470 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3469, i32 0, i32 0
%.tmp3471 = load i8*, i8** %.tmp3470
%.tmp3473 = getelementptr [7 x i8], [7 x i8]*@.str3472, i32 0, i32 0
%.tmp3474 = call i32(i8*,i8*) @strcmp(i8* %.tmp3471, i8* %.tmp3473)
%.tmp3475 = icmp ne i32 %.tmp3474, 0
br i1 %.tmp3475, label %.if.true.3476, label %.if.false.3476
.if.true.3476:
store i1 1, i1* %add_implicit_return
br label %.if.end.3476
.if.false.3476:
br label %.if.end.3476
.if.end.3476:
br label %.if.end.3466
.if.end.3466:
%.tmp3477 = load i1, i1* %add_implicit_return
br i1 %.tmp3477, label %.if.true.3478, label %.if.false.3478
.if.true.3478:
%.tmp3479 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3480 = load %m1811$.Type.type*, %m1811$.Type.type** %return_type
%.tmp3481 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3479, %m1811$.Type.type* %.tmp3480)
%.tmp3483 = getelementptr [5 x i8], [5 x i8]*@.str3482, i32 0, i32 0
%.tmp3484 = call i32(i8*,i8*) @strcmp(i8* %.tmp3481, i8* %.tmp3483)
%.tmp3485 = icmp ne i32 %.tmp3484, 0
br i1 %.tmp3485, label %.if.true.3486, label %.if.false.3486
.if.true.3486:
%.tmp3487 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3488 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3490 = getelementptr [21 x i8], [21 x i8]*@.str3489, i32 0, i32 0
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3487, %m286$.Node.type* %.tmp3488, i8* %.tmp3490)
br label %.if.end.3486
.if.false.3486:
%.tmp3491 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3492 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3491, i32 0, i32 1
%.tmp3493 = load %m0$.File.type*, %m0$.File.type** %.tmp3492
%.tmp3495 = getelementptr [10 x i8], [10 x i8]*@.str3494, i32 0, i32 0
%.tmp3496 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3493, i8* %.tmp3495)
br label %.if.end.3486
.if.end.3486:
br label %.if.end.3478
.if.false.3478:
br label %.if.end.3478
.if.end.3478:
%.tmp3497 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3498 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3497, i32 0, i32 1
%.tmp3499 = load %m0$.File.type*, %m0$.File.type** %.tmp3498
%.tmp3501 = getelementptr [3 x i8], [3 x i8]*@.str3500, i32 0, i32 0
%.tmp3502 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3499, i8* %.tmp3501)
br label %.if.end.3339
.if.end.3339:
br label %.if.end.3311
.if.false.3311:
%.tmp3503 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3504 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3503, i32 0, i32 0
%.tmp3505 = load i8*, i8** %.tmp3504
%.tmp3507 = getelementptr [7 x i8], [7 x i8]*@.str3506, i32 0, i32 0
%.tmp3508 = call i32(i8*,i8*) @strcmp(i8* %.tmp3505, i8* %.tmp3507)
%.tmp3509 = icmp eq i32 %.tmp3508, 0
br i1 %.tmp3509, label %.if.true.3510, label %.if.false.3510
.if.true.3510:
%.tmp3511 = load i1, i1* %shallow
%.tmp3512 = icmp eq i1 %.tmp3511, 1
br i1 %.tmp3512, label %.if.true.3513, label %.if.false.3513
.if.true.3513:
%.tmp3514 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3515 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3514, i32 0, i32 6
%.tmp3516 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3515
%.tmp3517 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3516, i32 0, i32 7
%.tmp3518 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3517
%.tmp3519 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3518, i32 0, i32 1
%.tmp3520 = load i8*, i8** %.tmp3519
%mod_name = alloca i8*
store i8* %.tmp3520, i8** %mod_name
%.tmp3521 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3522 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3521, i32 0, i32 6
%.tmp3523 = load i8*, i8** %.tmp3522
%mod_abspath = alloca i8*
store i8* %.tmp3523, i8** %mod_abspath
%.tmp3524 = load i8*, i8** %mod_abspath
%.tmp3525 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3524)
%dirname = alloca i8*
store i8* %.tmp3525, i8** %dirname
%.tmp3526 = load i8*, i8** %mod_name
%.tmp3527 = call i32(i8*) @strlen(i8* %.tmp3526)
%mod_name_len = alloca i32
store i32 %.tmp3527, i32* %mod_name_len
%.tmp3528 = load i32, i32* %mod_name_len
%.tmp3529 = sub i32 %.tmp3528, 1
%.tmp3530 = call i8*(i32) @malloc(i32 %.tmp3529)
%trimmed_name = alloca i8*
store i8* %.tmp3530, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3531
.for.start.3531:
%.tmp3532 = load i32, i32* %i
%.tmp3533 = load i32, i32* %mod_name_len
%.tmp3534 = sub i32 %.tmp3533, 1
%.tmp3535 = icmp slt i32 %.tmp3532, %.tmp3534
br i1 %.tmp3535, label %.for.continue.3531, label %.for.end.3531
.for.continue.3531:
%.tmp3536 = load i32, i32* %i
%.tmp3537 = sub i32 %.tmp3536, 1
%.tmp3538 = load i8*, i8** %trimmed_name
%.tmp3539 = getelementptr i8, i8* %.tmp3538, i32 %.tmp3537
%.tmp3540 = load i32, i32* %i
%.tmp3541 = load i8*, i8** %mod_name
%.tmp3542 = getelementptr i8, i8* %.tmp3541, i32 %.tmp3540
%.tmp3543 = load i8, i8* %.tmp3542
store i8 %.tmp3543, i8* %.tmp3539
%.tmp3544 = load i32, i32* %i
%.tmp3545 = add i32 %.tmp3544, 1
store i32 %.tmp3545, i32* %i
br label %.for.start.3531
.for.end.3531:
%.tmp3546 = load i32, i32* %mod_name_len
%.tmp3547 = sub i32 %.tmp3546, 2
%.tmp3548 = load i8*, i8** %trimmed_name
%.tmp3549 = getelementptr i8, i8* %.tmp3548, i32 %.tmp3547
store i8 0, i8* %.tmp3549
%.tmp3550 = load i8*, i8** %dirname
%.tmp3552 = getelementptr [1 x i8], [1 x i8]*@.str3551, i32 0, i32 0
%.tmp3553 = call i32(i8*,i8*) @strcmp(i8* %.tmp3550, i8* %.tmp3552)
%.tmp3554 = icmp eq i32 %.tmp3553, 0
br i1 %.tmp3554, label %.if.true.3555, label %.if.false.3555
.if.true.3555:
%.tmp3556 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3558 = getelementptr [6 x i8], [6 x i8]*@.str3557, i32 0, i32 0
%.tmp3559 = load i8*, i8** %trimmed_name
%.tmp3560 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3556, i8* %.tmp3558, i8* %.tmp3559)
br label %.if.end.3555
.if.false.3555:
%.tmp3561 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3563 = getelementptr [9 x i8], [9 x i8]*@.str3562, i32 0, i32 0
%.tmp3564 = load i8*, i8** %dirname
%.tmp3565 = load i8*, i8** %trimmed_name
%.tmp3566 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3561, i8* %.tmp3563, i8* %.tmp3564, i8* %.tmp3565)
br label %.if.end.3555
.if.end.3555:
%.tmp3567 = load i8*, i8** %mod_abspath
%.tmp3568 = call i8*(i32) @malloc(i32 4096)
%.tmp3569 = call i8*(i8*,i8*) @realpath(i8* %.tmp3567, i8* %.tmp3568)
store i8* %.tmp3569, i8** %mod_abspath
%.tmp3570 = load i8*, i8** %mod_abspath
%.tmp3571 = icmp eq i8* %.tmp3570, null
br i1 %.tmp3571, label %.if.true.3572, label %.if.false.3572
.if.true.3572:
%.tmp3573 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3575 = getelementptr [60 x i8], [60 x i8]*@.str3574, i32 0, i32 0
%.tmp3576 = load i8*, i8** %mod_name
%.tmp3577 = load i8*, i8** %dirname
%.tmp3578 = load i8*, i8** %trimmed_name
%.tmp3579 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3573, i8* %.tmp3575, i8* %.tmp3576, i8* %.tmp3577, i8* %.tmp3578)
%.tmp3580 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3581 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3582 = load i8*, i8** %err_buf
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3580, %m286$.Node.type* %.tmp3581, i8* %.tmp3582)
ret void
br label %.if.end.3572
.if.false.3572:
br label %.if.end.3572
.if.end.3572:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* null, %m1811$.ModuleLookup.type** %m
%.tmp3583 = bitcast ptr null to %m1811$.ModuleLookup.type*
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp3583, %m1811$.ModuleLookup.type** %mod
%.tmp3585 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3586 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3585, i32 0, i32 5
%.tmp3587 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3586
store %m1811$.ModuleLookup.type* %.tmp3587, %m1811$.ModuleLookup.type** %m
br label %.for.start.3584
.for.start.3584:
%.tmp3588 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3589 = icmp ne %m1811$.ModuleLookup.type* %.tmp3588, null
%.tmp3590 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3591 = icmp eq %m1811$.ModuleLookup.type* %.tmp3590, null
%.tmp3592 = and i1 %.tmp3589, %.tmp3591
br i1 %.tmp3592, label %.for.continue.3584, label %.for.end.3584
.for.continue.3584:
%.tmp3593 = load i8*, i8** %mod_abspath
%.tmp3594 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3595 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3594, i32 0, i32 0
%.tmp3596 = load i8*, i8** %.tmp3595
%.tmp3597 = call i32(i8*,i8*) @strcmp(i8* %.tmp3593, i8* %.tmp3596)
%.tmp3598 = icmp eq i32 %.tmp3597, 0
br i1 %.tmp3598, label %.if.true.3599, label %.if.false.3599
.if.true.3599:
%.tmp3600 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
store %m1811$.ModuleLookup.type* %.tmp3600, %m1811$.ModuleLookup.type** %mod
br label %.if.end.3599
.if.false.3599:
br label %.if.end.3599
.if.end.3599:
%.tmp3601 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3602 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3601, i32 0, i32 2
%.tmp3603 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3602
store %m1811$.ModuleLookup.type* %.tmp3603, %m1811$.ModuleLookup.type** %m
br label %.for.start.3584
.for.end.3584:
%.tmp3604 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3605 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3604, i32 0, i32 6
%.tmp3606 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3605
%.tmp3607 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3606, i32 0, i32 7
%.tmp3608 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3607
%.tmp3609 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3608, i32 0, i32 7
%.tmp3610 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3609
%.tmp3611 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3610, i32 0, i32 7
%.tmp3612 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3611
%.tmp3613 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3612, i32 0, i32 1
%.tmp3614 = load i8*, i8** %.tmp3613
%asname = alloca i8*
store i8* %.tmp3614, i8** %asname
%.tmp3615 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3616 = icmp eq %m1811$.ModuleLookup.type* %.tmp3615, null
br i1 %.tmp3616, label %.if.true.3617, label %.if.false.3617
.if.true.3617:
%.tmp3618 = load i32, i32* @ModuleLookup_size
%.tmp3619 = call i8*(i32) @malloc(i32 %.tmp3618)
%.tmp3620 = bitcast i8* %.tmp3619 to %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp3620, %m1811$.ModuleLookup.type** %mod
%.tmp3621 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3622 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3621, i32 0, i32 0
%.tmp3623 = load i8*, i8** %mod_abspath
store i8* %.tmp3623, i8** %.tmp3622
%.tmp3624 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3625 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3624, i32 0, i32 2
store %m1811$.ModuleLookup.type* null, %m1811$.ModuleLookup.type** %.tmp3625
%.tmp3626 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3627 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3626, i32 0, i32 3
store %m1811$.Scope.type* null, %m1811$.Scope.type** %.tmp3627
%.tmp3628 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3629 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3628, i32 0, i32 1
%.tmp3630 = getelementptr i8*, i8** %.tmp3629, i32 0
%.tmp3632 = getelementptr [5 x i8], [5 x i8]*@.str3631, i32 0, i32 0
%.tmp3633 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3634 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3633)
%.tmp3635 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3630, i8* %.tmp3632, i32 %.tmp3634)
%.tmp3637 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3638 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3637, i32 0, i32 5
%.tmp3639 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3638
store %m1811$.ModuleLookup.type* %.tmp3639, %m1811$.ModuleLookup.type** %m
br label %.for.start.3636
.for.start.3636:
%.tmp3640 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3641 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3640, i32 0, i32 2
%.tmp3642 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3641
%.tmp3643 = icmp ne %m1811$.ModuleLookup.type* %.tmp3642, null
br i1 %.tmp3643, label %.for.continue.3636, label %.for.end.3636
.for.continue.3636:
%.tmp3644 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3645 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3644, i32 0, i32 2
%.tmp3646 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %.tmp3645
store %m1811$.ModuleLookup.type* %.tmp3646, %m1811$.ModuleLookup.type** %m
br label %.for.start.3636
.for.end.3636:
%.tmp3647 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %m
%.tmp3648 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3647, i32 0, i32 2
%.tmp3649 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
store %m1811$.ModuleLookup.type* %.tmp3649, %m1811$.ModuleLookup.type** %.tmp3648
%.tmp3650 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3651 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3652 = load i8*, i8** %asname
%.tmp3653 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3654 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3653, i32 0, i32 0
%.tmp3655 = load i8*, i8** %.tmp3654
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1811$define_module.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp3650, %m286$.Node.type* %.tmp3651, i8* %.tmp3652, i8* %.tmp3655)
%.tmp3656 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3657 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3656, i32 0, i32 6
%.tmp3658 = load i8*, i8** %.tmp3657
%curr_mod = alloca i8*
store i8* %.tmp3658, i8** %curr_mod
%.tmp3659 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3660 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3659, i32 0, i32 6
%.tmp3661 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3662 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3661, i32 0, i32 0
%.tmp3663 = load i8*, i8** %.tmp3662
store i8* %.tmp3663, i8** %.tmp3660
%.tmp3664 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3665 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3666 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3665, i32 0, i32 0
%.tmp3667 = load i8*, i8** %.tmp3666
%.tmp3668 = call i1(%m1811$.CompilerCtx.type*,i8*) @m1811$compile_file.b.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp3664, i8* %.tmp3667)
%.tmp3669 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3670 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3669, i32 0, i32 6
%.tmp3671 = load i8*, i8** %curr_mod
store i8* %.tmp3671, i8** %.tmp3670
br label %.if.end.3617
.if.false.3617:
%.tmp3672 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3673 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3674 = load i8*, i8** %asname
%.tmp3675 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp3676 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp3675, i32 0, i32 0
%.tmp3677 = load i8*, i8** %.tmp3676
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1811$define_module.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp3672, %m286$.Node.type* %.tmp3673, i8* %.tmp3674, i8* %.tmp3677)
br label %.if.end.3617
.if.end.3617:
br label %.if.end.3513
.if.false.3513:
br label %.if.end.3513
.if.end.3513:
br label %.if.end.3510
.if.false.3510:
%.tmp3678 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3679 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3681 = getelementptr [40 x i8], [40 x i8]*@.str3680, i32 0, i32 0
%.tmp3682 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3678, %m286$.Node.type* %.tmp3679, i8* %.tmp3681)
%.tmp3683 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3684 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3683, i32 0, i32 0
%.tmp3685 = load i8*, i8** %.tmp3684
%.tmp3686 = call i32(i8*,...) @printf(i8* %.tmp3682, i8* %.tmp3685)
br label %.if.end.3510
.if.end.3510:
br label %.if.end.3311
.if.end.3311:
br label %.if.end.3194
.if.end.3194:
br label %.if.end.3101
.if.end.3101:
br label %.if.end.3039
.if.end.3039:
br label %.if.end.3031
.if.end.3031:
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
%.tmp3687 = getelementptr i8*, i8** %buf, i32 0
%.tmp3689 = getelementptr [31 x i8], [31 x i8]*@.str3688, i32 0, i32 0
%.tmp3690 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3691 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3690, i32 0, i32 6
%.tmp3692 = load i8*, i8** %.tmp3691
%.tmp3693 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3694 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3693, i32 0, i32 3
%.tmp3695 = load i32, i32* %.tmp3694
%.tmp3696 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3697 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3696, i32 0, i32 4
%.tmp3698 = load i32, i32* %.tmp3697
%.tmp3699 = load i8*, i8** %msg
%.tmp3700 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3687, i8* %.tmp3689, i8* %.tmp3692, i32 %.tmp3695, i32 %.tmp3698, i8* %.tmp3699)
%.tmp3701 = load i8*, i8** %buf
ret i8* %.tmp3701
}
define void @m1811$compile_fn_params.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %param_type
%.tmp3703 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3703, %m286$.Node.type** %param_ptr
br label %.for.start.3702
.for.start.3702:
%.tmp3704 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3705 = icmp ne %m286$.Node.type* %.tmp3704, null
br i1 %.tmp3705, label %.for.continue.3702, label %.for.end.3702
.for.continue.3702:
%.tmp3706 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3707 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3708 = icmp ne %m286$.Node.type* %.tmp3706, %.tmp3707
br i1 %.tmp3708, label %.if.true.3709, label %.if.false.3709
.if.true.3709:
%.tmp3710 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3711 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3710, i32 0, i32 7
%.tmp3712 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3711
store %m286$.Node.type* %.tmp3712, %m286$.Node.type** %param_ptr
br label %.if.end.3709
.if.false.3709:
br label %.if.end.3709
.if.end.3709:
%.tmp3713 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3714 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3713)
%param_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3714, %m1811$.AssignableInfo.type** %param_info
%.tmp3715 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3716 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3715, i32 0, i32 2
%.tmp3718 = getelementptr [9 x i8], [9 x i8]*@.str3717, i32 0, i32 0
store i8* %.tmp3718, i8** %.tmp3716
%.tmp3719 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3720 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3719, i32 0, i32 0
%.tmp3721 = load i8*, i8** %.tmp3720
%.tmp3723 = getelementptr [5 x i8], [5 x i8]*@.str3722, i32 0, i32 0
%.tmp3724 = call i32(i8*,i8*) @strcmp(i8* %.tmp3721, i8* %.tmp3723)
%.tmp3725 = icmp eq i32 %.tmp3724, 0
br i1 %.tmp3725, label %.if.true.3726, label %.if.false.3726
.if.true.3726:
%.tmp3727 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3728 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3729 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3728, i32 0, i32 6
%.tmp3730 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3729
%.tmp3731 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3727, %m286$.Node.type* %.tmp3730)
store %m1811$.Type.type* %.tmp3731, %m1811$.Type.type** %param_type
%.tmp3732 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3733 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3732, i32 0, i32 7
%.tmp3734 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3733
store %m286$.Node.type* %.tmp3734, %m286$.Node.type** %param_ptr
br label %.if.end.3726
.if.false.3726:
br label %.if.end.3726
.if.end.3726:
%.tmp3735 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3736 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3735, i32 0, i32 3
%.tmp3737 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
store %m1811$.Type.type* %.tmp3737, %m1811$.Type.type** %.tmp3736
%.tmp3738 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3739 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3738, i32 0, i32 1
%.tmp3740 = load i8*, i8** %.tmp3739
%var_name = alloca i8*
store i8* %.tmp3740, i8** %var_name
%.tmp3741 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3742 = load i8, i8* @SCOPE_LOCAL
%.tmp3743 = load i8*, i8** %var_name
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp3741, i8 %.tmp3742, i8* %.tmp3743)
%.tmp3744 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3745 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3746 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3745, i32 0, i32 3
%.tmp3747 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3746
%.tmp3748 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3744, %m1811$.Type.type* %.tmp3747)
%param_info_tr = alloca i8*
store i8* %.tmp3748, i8** %param_info_tr
%.tmp3749 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3750 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3749, i32 0, i32 1
%.tmp3751 = load %m0$.File.type*, %m0$.File.type** %.tmp3750
%.tmp3753 = getelementptr [16 x i8], [16 x i8]*@.str3752, i32 0, i32 0
%.tmp3754 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3755 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3754)
%.tmp3756 = load i8*, i8** %param_info_tr
%.tmp3757 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3751, i8* %.tmp3753, i8* %.tmp3755, i8* %.tmp3756)
%.tmp3758 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3759 = load i8*, i8** %var_name
%.tmp3760 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3758, i8* %.tmp3759, %m1811$.AssignableInfo.type* %.tmp3760)
%.tmp3761 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3762 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3761, i32 0, i32 1
%.tmp3763 = load %m0$.File.type*, %m0$.File.type** %.tmp3762
%.tmp3765 = getelementptr [28 x i8], [28 x i8]*@.str3764, i32 0, i32 0
%.tmp3766 = load i8*, i8** %param_info_tr
%.tmp3767 = load i8*, i8** %var_name
%.tmp3768 = load i8*, i8** %param_info_tr
%.tmp3769 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %param_info
%.tmp3770 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3769)
%.tmp3771 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3763, i8* %.tmp3765, i8* %.tmp3766, i8* %.tmp3767, i8* %.tmp3768, i8* %.tmp3770)
%.tmp3772 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3773 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3772, i32 0, i32 7
%.tmp3774 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3773
store %m286$.Node.type* %.tmp3774, %m286$.Node.type** %param_ptr
br label %.for.start.3702
.for.end.3702:
ret void
}
define void @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3775 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3777 = getelementptr [6 x i8], [6 x i8]*@.str3776, i32 0, i32 0
%.tmp3778 = bitcast ptr null to i8*
%.tmp3779 = bitcast ptr null to i8*
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp3775, i8* %.tmp3777, i8* %.tmp3778, i8* %.tmp3779)
%.tmp3781 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3782 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3781, i32 0, i32 6
%.tmp3783 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3782
%b = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3783, %m286$.Node.type** %b
br label %.for.start.3780
.for.start.3780:
%.tmp3784 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3785 = icmp ne %m286$.Node.type* %.tmp3784, null
br i1 %.tmp3785, label %.for.continue.3780, label %.for.end.3780
.for.continue.3780:
%.tmp3786 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3787 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3786, i32 0, i32 0
%.tmp3788 = load i8*, i8** %.tmp3787
%.tmp3790 = getelementptr [11 x i8], [11 x i8]*@.str3789, i32 0, i32 0
%.tmp3791 = call i32(i8*,i8*) @strcmp(i8* %.tmp3788, i8* %.tmp3790)
%.tmp3792 = icmp eq i32 %.tmp3791, 0
br i1 %.tmp3792, label %.if.true.3793, label %.if.false.3793
.if.true.3793:
%.tmp3794 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3795 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3796 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3795, i32 0, i32 6
%.tmp3797 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3796
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3794, %m286$.Node.type* %.tmp3797)
br label %.if.end.3793
.if.false.3793:
br label %.if.end.3793
.if.end.3793:
%.tmp3798 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3799 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3798, i32 0, i32 7
%.tmp3800 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3799
store %m286$.Node.type* %.tmp3800, %m286$.Node.type** %b
br label %.for.start.3780
.for.end.3780:
%.tmp3801 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3801)
ret void
}
define %m1811$.AssignableInfo.type* @m1811$compile_builtin.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3802 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3803 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3802, i32 0, i32 6
%.tmp3804 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3803
%.tmp3805 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3804, i32 0, i32 6
%.tmp3806 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3805
%dotted = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3806, %m286$.Node.type** %dotted
%.tmp3807 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3808 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3807, i32 0, i32 7
%.tmp3809 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3808
%.tmp3810 = icmp ne %m286$.Node.type* %.tmp3809, null
br i1 %.tmp3810, label %.if.true.3811, label %.if.false.3811
.if.true.3811:
%.tmp3812 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3812
br label %.if.end.3811
.if.false.3811:
br label %.if.end.3811
.if.end.3811:
%.tmp3813 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3814 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3813, i32 0, i32 1
%.tmp3815 = load i8*, i8** %.tmp3814
%.tmp3817 = getelementptr [7 x i8], [7 x i8]*@.str3816, i32 0, i32 0
%.tmp3818 = call i32(i8*,i8*) @strcmp(i8* %.tmp3815, i8* %.tmp3817)
%.tmp3819 = icmp eq i32 %.tmp3818, 0
br i1 %.tmp3819, label %.if.true.3820, label %.if.false.3820
.if.true.3820:
%.tmp3821 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3823 = getelementptr [8 x i8], [8 x i8]*@.str3822, i32 0, i32 0
%.tmp3824 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3821, i8* %.tmp3823)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3824, %m286$.Node.type** %args
%.tmp3825 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3826 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3825, i32 0, i32 6
%.tmp3827 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3826
%.tmp3829 = getelementptr [11 x i8], [11 x i8]*@.str3828, i32 0, i32 0
%.tmp3830 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3827, i8* %.tmp3829)
%value = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3830, %m286$.Node.type** %value
%.tmp3831 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3832 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3831, i32 0, i32 6
%.tmp3833 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3832
%.tmp3834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3833, i32 0, i32 6
%.tmp3835 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3834
%.tmp3836 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3835, i32 0, i32 6
%.tmp3837 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3836
%.tmp3838 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3837, i32 0, i32 6
%.tmp3839 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3838
store %m286$.Node.type* %.tmp3839, %m286$.Node.type** %value
%.tmp3840 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3841 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp3840)
%tmp_id = alloca i32
store i32 %.tmp3841, i32* %tmp_id
%.tmp3842 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3843 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3842)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3843, %m1811$.AssignableInfo.type** %info
%.tmp3844 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3845 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3844, %m1811$.AssignableInfo.type* %.tmp3845)
%.tmp3846 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3847 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3846, i32 0, i32 3
%.tmp3848 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp3848, %m1811$.Type.type** %.tmp3847
%.tmp3849 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3850 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3849, i32 0, i32 3
%.tmp3851 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3850
%.tmp3852 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3851, i32 0, i32 0
%.tmp3854 = getelementptr [4 x i8], [4 x i8]*@.str3853, i32 0, i32 0
store i8* %.tmp3854, i8** %.tmp3852
%.tmp3855 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3856 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3857 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3855, %m286$.Node.type* %.tmp3856)
%inspected_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp3857, %m1811$.Type.type** %inspected_type
%.tmp3858 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3859 = load %m1811$.Type.type*, %m1811$.Type.type** %inspected_type
%.tmp3860 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3858, %m1811$.Type.type* %.tmp3859)
%type_as_str = alloca i8*
store i8* %.tmp3860, i8** %type_as_str
%.tmp3861 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3862 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3861, i32 0, i32 1
%.tmp3863 = load %m0$.File.type*, %m0$.File.type** %.tmp3862
%.tmp3865 = getelementptr [46 x i8], [46 x i8]*@.str3864, i32 0, i32 0
%.tmp3866 = load i32, i32* %tmp_id
%.tmp3867 = load i8*, i8** %type_as_str
%.tmp3868 = load i8*, i8** %type_as_str
%.tmp3869 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3863, i8* %.tmp3865, i32 %.tmp3866, i8* %.tmp3867, i8* %.tmp3868)
%.tmp3870 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3871 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3870, i32 0, i32 1
%.tmp3872 = load %m0$.File.type*, %m0$.File.type** %.tmp3871
%.tmp3874 = getelementptr [35 x i8], [35 x i8]*@.str3873, i32 0, i32 0
%.tmp3875 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3876 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3875)
%.tmp3877 = load i8*, i8** %type_as_str
%.tmp3878 = load i32, i32* %tmp_id
%.tmp3879 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3872, i8* %.tmp3874, i8* %.tmp3876, i8* %.tmp3877, i32 %.tmp3878)
%.tmp3880 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp3880
br label %.if.end.3820
.if.false.3820:
br label %.if.end.3820
.if.end.3820:
%.tmp3881 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3881
}
define %m1811$.AssignableInfo.type* @m1811$compile_fn_call.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3882 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3883 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3884 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_builtin.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3882, %m286$.Node.type* %.tmp3883)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3884, %m1811$.AssignableInfo.type** %info
%.tmp3885 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3886 = icmp ne %m1811$.AssignableInfo.type* %.tmp3885, null
br i1 %.tmp3886, label %.if.true.3887, label %.if.false.3887
.if.true.3887:
%.tmp3888 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp3888
br label %.if.end.3887
.if.false.3887:
br label %.if.end.3887
.if.end.3887:
%.tmp3889 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3890 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3891 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3889, %m286$.Node.type* %.tmp3890)
store %m1811$.AssignableInfo.type* %.tmp3891, %m1811$.AssignableInfo.type** %info
%.tmp3892 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3893 = icmp eq %m1811$.AssignableInfo.type* %.tmp3892, null
br i1 %.tmp3893, label %.if.true.3894, label %.if.false.3894
.if.true.3894:
%.tmp3895 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3895, label %.if.true.3896, label %.if.false.3896
.if.true.3896:
%.tmp3897 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3898 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3900 = getelementptr [35 x i8], [35 x i8]*@.str3899, i32 0, i32 0
%.tmp3901 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp3897, %m286$.Node.type* %.tmp3898, i8* %.tmp3900)
%.tmp3902 = call i32(i8*,...) @printf(i8* %.tmp3901)
br label %.if.end.3896
.if.false.3896:
br label %.if.end.3896
.if.end.3896:
%.tmp3903 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3903
br label %.if.end.3894
.if.false.3894:
br label %.if.end.3894
.if.end.3894:
%.tmp3904 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3906 = getelementptr [8 x i8], [8 x i8]*@.str3905, i32 0, i32 0
%.tmp3907 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3904, i8* %.tmp3906)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3907, %m286$.Node.type** %args
%.tmp3909 = getelementptr [1 x i8], [1 x i8]*@.str3908, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3909, i8** %params_buff
%tmp = alloca i8*
store i8* null, i8** %tmp
%.tmp3910 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3911 = icmp ne %m286$.Node.type* %.tmp3910, null
br i1 %.tmp3911, label %.if.true.3912, label %.if.false.3912
.if.true.3912:
%.tmp3913 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3914 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3913, i32 0, i32 6
%.tmp3915 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3914
%.tmp3917 = getelementptr [11 x i8], [11 x i8]*@.str3916, i32 0, i32 0
%.tmp3918 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3915, i8* %.tmp3917)
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3918, %m286$.Node.type** %start
%.tmp3920 = load %m286$.Node.type*, %m286$.Node.type** %start
%pp = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3920, %m286$.Node.type** %pp
br label %.for.start.3919
.for.start.3919:
%.tmp3921 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3922 = icmp ne %m286$.Node.type* %.tmp3921, null
br i1 %.tmp3922, label %.for.continue.3919, label %.for.end.3919
.for.continue.3919:
%.tmp3923 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3924 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp3925 = icmp ne %m286$.Node.type* %.tmp3923, %.tmp3924
br i1 %.tmp3925, label %.if.true.3926, label %.if.false.3926
.if.true.3926:
%.tmp3927 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3929 = getelementptr [5 x i8], [5 x i8]*@.str3928, i32 0, i32 0
%.tmp3930 = load i8*, i8** %params_buff
%.tmp3931 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3927, i8* %.tmp3929, i8* %.tmp3930)
%.tmp3932 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3932, i8** %tmp_buff
%.tmp3933 = load i8*, i8** %tmp
store i8* %.tmp3933, i8** %params_buff
%.tmp3934 = load i8*, i8** %tmp_buff
store i8* %.tmp3934, i8** %tmp
%.tmp3935 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3935)
br label %.if.end.3926
.if.false.3926:
br label %.if.end.3926
.if.end.3926:
%.tmp3936 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3937 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3938 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp3936, %m286$.Node.type* %.tmp3937)
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3938, %m1811$.AssignableInfo.type** %a_info
%.tmp3939 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3940 = icmp eq %m1811$.AssignableInfo.type* %.tmp3939, null
br i1 %.tmp3940, label %.if.true.3941, label %.if.false.3941
.if.true.3941:
%.tmp3942 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3942
br label %.if.end.3941
.if.false.3941:
br label %.if.end.3941
.if.end.3941:
%.tmp3943 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3945 = getelementptr [8 x i8], [8 x i8]*@.str3944, i32 0, i32 0
%.tmp3946 = load i8*, i8** %params_buff
%.tmp3947 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3948 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3949 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3948, i32 0, i32 3
%.tmp3950 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3949
%.tmp3951 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3947, %m1811$.Type.type* %.tmp3950)
%.tmp3952 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp3953 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3952)
%.tmp3954 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3943, i8* %.tmp3945, i8* %.tmp3946, i8* %.tmp3951, i8* %.tmp3953)
%.tmp3955 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3956 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3955, i32 0, i32 7
%.tmp3957 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3956
store %m286$.Node.type* %.tmp3957, %m286$.Node.type** %pp
%.tmp3958 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3960 = getelementptr [11 x i8], [11 x i8]*@.str3959, i32 0, i32 0
%.tmp3961 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3958, i8* %.tmp3960)
store %m286$.Node.type* %.tmp3961, %m286$.Node.type** %pp
br label %.for.start.3919
.for.end.3919:
br label %.if.end.3912
.if.false.3912:
br label %.if.end.3912
.if.end.3912:
%.tmp3962 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3963 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3964 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3963, i32 0, i32 3
%.tmp3965 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3964
%.tmp3966 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3965, i32 0, i32 3
%.tmp3967 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3966
%.tmp3968 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3962, %m1811$.Type.type* %.tmp3967)
%.tmp3970 = getelementptr [5 x i8], [5 x i8]*@.str3969, i32 0, i32 0
%.tmp3971 = call i32(i8*,i8*) @strcmp(i8* %.tmp3968, i8* %.tmp3970)
%.tmp3972 = icmp eq i32 %.tmp3971, 0
br i1 %.tmp3972, label %.if.true.3973, label %.if.false.3973
.if.true.3973:
%.tmp3974 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3975 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp3974, i32 0, i32 1
%.tmp3976 = load %m0$.File.type*, %m0$.File.type** %.tmp3975
%.tmp3978 = getelementptr [16 x i8], [16 x i8]*@.str3977, i32 0, i32 0
%.tmp3979 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3980 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3981 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3980, i32 0, i32 3
%.tmp3982 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3981
%.tmp3983 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp3979, %m1811$.Type.type* %.tmp3982)
%.tmp3984 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3985 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp3984)
%.tmp3986 = load i8*, i8** %params_buff
%.tmp3987 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3976, i8* %.tmp3978, i8* %.tmp3983, i8* %.tmp3985, i8* %.tmp3986)
%.tmp3988 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp3988
br label %.if.end.3973
.if.false.3973:
br label %.if.end.3973
.if.end.3973:
%.tmp3989 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3990 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3989)
%call_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp3990, %m1811$.AssignableInfo.type** %call_info
%.tmp3991 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp3992 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp3991, %m1811$.AssignableInfo.type* %.tmp3992)
%.tmp3993 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp3994 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3993, i32 0, i32 3
%.tmp3995 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp3996 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp3995, i32 0, i32 3
%.tmp3997 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3996
%.tmp3998 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp3997, i32 0, i32 3
%.tmp3999 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp3998
%.tmp4000 = call %m1811$.Type.type*(%m1811$.Type.type*) @m1811$type_clone.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp3999)
store %m1811$.Type.type* %.tmp4000, %m1811$.Type.type** %.tmp3994
%.tmp4001 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4002 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4001, i32 0, i32 3
%.tmp4003 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4002
%.tmp4004 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4003, i32 0, i32 4
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp4004
%.tmp4005 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4006 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4005, i32 0, i32 1
%.tmp4007 = load %m0$.File.type*, %m0$.File.type** %.tmp4006
%.tmp4009 = getelementptr [21 x i8], [21 x i8]*@.str4008, i32 0, i32 0
%.tmp4010 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4011 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4010)
%.tmp4012 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4013 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4014 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4013, i32 0, i32 3
%.tmp4015 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4014
%.tmp4016 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4012, %m1811$.Type.type* %.tmp4015)
%.tmp4017 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4018 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4017)
%.tmp4019 = load i8*, i8** %params_buff
%.tmp4020 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4007, i8* %.tmp4009, i8* %.tmp4011, i8* %.tmp4016, i8* %.tmp4018, i8* %.tmp4019)
%.tmp4021 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %call_info
%.tmp4022 = bitcast %m1811$.AssignableInfo.type* %.tmp4021 to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp4022
}
define void @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp4023 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4023, i32 0, i32 0
%.tmp4025 = load i8*, i8** %.tmp4024
%expr_type = alloca i8*
store i8* %.tmp4025, i8** %expr_type
%.tmp4026 = bitcast ptr null to %m1811$.AssignableInfo.type*
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4026, %m1811$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* null, %m286$.Node.type** %assignable
%.tmp4027 = bitcast ptr null to %m1811$.AssignableInfo.type*
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4027, %m1811$.AssignableInfo.type** %a_info
%.tmp4028 = load i8*, i8** %expr_type
%.tmp4030 = getelementptr [7 x i8], [7 x i8]*@.str4029, i32 0, i32 0
%.tmp4031 = call i32(i8*,i8*) @strcmp(i8* %.tmp4028, i8* %.tmp4030)
%.tmp4032 = icmp eq i32 %.tmp4031, 0
br i1 %.tmp4032, label %.if.true.4033, label %.if.false.4033
.if.true.4033:
%.tmp4034 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4035 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4034, i32 0, i32 6
%.tmp4036 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4035
%.tmp4037 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4036, i32 0, i32 7
%.tmp4038 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4037
%.tmp4039 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4038, i32 0, i32 0
%.tmp4040 = load i8*, i8** %.tmp4039
%.tmp4042 = getelementptr [3 x i8], [3 x i8]*@.str4041, i32 0, i32 0
%.tmp4043 = call i32(i8*,i8*) @strcmp(i8* %.tmp4040, i8* %.tmp4042)
%.tmp4044 = icmp ne i32 %.tmp4043, 0
br i1 %.tmp4044, label %.if.true.4045, label %.if.false.4045
.if.true.4045:
%.tmp4046 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4047 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4047, i32 0, i32 6
%.tmp4049 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4048
%.tmp4050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4049, i32 0, i32 7
%.tmp4051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4050
%.tmp4052 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4046, %m286$.Node.type* %.tmp4051)
store %m1811$.AssignableInfo.type* %.tmp4052, %m1811$.AssignableInfo.type** %info
%.tmp4053 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4054 = icmp eq %m1811$.AssignableInfo.type* %.tmp4053, null
br i1 %.tmp4054, label %.if.true.4055, label %.if.false.4055
.if.true.4055:
ret void
br label %.if.end.4055
.if.false.4055:
br label %.if.end.4055
.if.end.4055:
%.tmp4056 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4057 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4056, i32 0, i32 1
%.tmp4058 = load %m0$.File.type*, %m0$.File.type** %.tmp4057
%.tmp4060 = getelementptr [11 x i8], [11 x i8]*@.str4059, i32 0, i32 0
%.tmp4061 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4062 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4063 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4062, i32 0, i32 3
%.tmp4064 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4063
%.tmp4065 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4061, %m1811$.Type.type* %.tmp4064)
%.tmp4066 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4067 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4066)
%.tmp4068 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4058, i8* %.tmp4060, i8* %.tmp4065, i8* %.tmp4067)
br label %.if.end.4045
.if.false.4045:
%.tmp4069 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4070 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4069, i32 0, i32 1
%.tmp4071 = load %m0$.File.type*, %m0$.File.type** %.tmp4070
%.tmp4073 = getelementptr [10 x i8], [10 x i8]*@.str4072, i32 0, i32 0
%.tmp4074 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4071, i8* %.tmp4073)
br label %.if.end.4045
.if.end.4045:
br label %.if.end.4033
.if.false.4033:
%.tmp4075 = load i8*, i8** %expr_type
%.tmp4077 = getelementptr [3 x i8], [3 x i8]*@.str4076, i32 0, i32 0
%.tmp4078 = call i32(i8*,i8*) @strcmp(i8* %.tmp4075, i8* %.tmp4077)
%.tmp4079 = icmp eq i32 %.tmp4078, 0
br i1 %.tmp4079, label %.if.true.4080, label %.if.false.4080
.if.true.4080:
br label %.if.end.4080
.if.false.4080:
%.tmp4081 = load i8*, i8** %expr_type
%.tmp4083 = getelementptr [8 x i8], [8 x i8]*@.str4082, i32 0, i32 0
%.tmp4084 = call i32(i8*,i8*) @strcmp(i8* %.tmp4081, i8* %.tmp4083)
%.tmp4085 = icmp eq i32 %.tmp4084, 0
br i1 %.tmp4085, label %.if.true.4086, label %.if.false.4086
.if.true.4086:
%.tmp4087 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4088 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4089 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4088, i32 0, i32 6
%.tmp4090 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4089
%.tmp4091 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_fn_call.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4087, %m286$.Node.type* %.tmp4090)
br label %.if.end.4086
.if.false.4086:
%.tmp4092 = load i8*, i8** %expr_type
%.tmp4094 = getelementptr [12 x i8], [12 x i8]*@.str4093, i32 0, i32 0
%.tmp4095 = call i32(i8*,i8*) @strcmp(i8* %.tmp4092, i8* %.tmp4094)
%.tmp4096 = icmp eq i32 %.tmp4095, 0
br i1 %.tmp4096, label %.if.true.4097, label %.if.false.4097
.if.true.4097:
%.tmp4098 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4099 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4100 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_declaration.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4098, %m286$.Node.type* %.tmp4099)
br label %.if.end.4097
.if.false.4097:
%.tmp4101 = load i8*, i8** %expr_type
%.tmp4103 = getelementptr [11 x i8], [11 x i8]*@.str4102, i32 0, i32 0
%.tmp4104 = call i32(i8*,i8*) @strcmp(i8* %.tmp4101, i8* %.tmp4103)
%.tmp4105 = icmp eq i32 %.tmp4104, 0
br i1 %.tmp4105, label %.if.true.4106, label %.if.false.4106
.if.true.4106:
%.tmp4107 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4108 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4107, i32 0, i32 6
%.tmp4109 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4108
%.tmp4111 = getelementptr [11 x i8], [11 x i8]*@.str4110, i32 0, i32 0
%.tmp4112 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4109, i8* %.tmp4111)
store %m286$.Node.type* %.tmp4112, %m286$.Node.type** %assignable
%.tmp4113 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4114 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4115 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4114, i32 0, i32 6
%.tmp4116 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4115
%.tmp4117 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4113, %m286$.Node.type* %.tmp4116)
%dest = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4117, %m1811$.AssignableInfo.type** %dest
%.tmp4118 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %dest
%.tmp4119 = icmp eq %m1811$.AssignableInfo.type* %.tmp4118, null
br i1 %.tmp4119, label %.if.true.4120, label %.if.false.4120
.if.true.4120:
%.tmp4121 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4123 = getelementptr [34 x i8], [34 x i8]*@.str4122, i32 0, i32 0
%.tmp4124 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4125 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4124, i32 0, i32 6
%.tmp4126 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4125
%.tmp4127 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4126, i32 0, i32 6
%.tmp4128 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4127
%.tmp4129 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4128, i32 0, i32 6
%.tmp4130 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4129
%.tmp4131 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4130, i32 0, i32 1
%.tmp4132 = load i8*, i8** %.tmp4131
%.tmp4133 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4121, i8* %.tmp4123, i8* %.tmp4132)
%.tmp4134 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4135 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4136 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4134, %m286$.Node.type* %.tmp4135, i8* %.tmp4136)
ret void
br label %.if.end.4120
.if.false.4120:
br label %.if.end.4120
.if.end.4120:
%.tmp4137 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4138 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4139 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4137, %m286$.Node.type* %.tmp4138)
store %m1811$.AssignableInfo.type* %.tmp4139, %m1811$.AssignableInfo.type** %a_info
%.tmp4140 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4141 = icmp eq %m1811$.AssignableInfo.type* %.tmp4140, null
br i1 %.tmp4141, label %.if.true.4142, label %.if.false.4142
.if.true.4142:
ret void
br label %.if.end.4142
.if.false.4142:
br label %.if.end.4142
.if.end.4142:
%.tmp4143 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4144 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %dest
%.tmp4145 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4144, i32 0, i32 3
%.tmp4146 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4145
%.tmp4147 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4143, %m1811$.Type.type* %.tmp4146)
%dest_tr = alloca i8*
store i8* %.tmp4147, i8** %dest_tr
%.tmp4148 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4149 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4150 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4149, i32 0, i32 3
%.tmp4151 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4150
%.tmp4152 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4148, %m1811$.Type.type* %.tmp4151)
%src_tr = alloca i8*
store i8* %.tmp4152, i8** %src_tr
%.tmp4153 = load i8*, i8** %src_tr
%.tmp4155 = getelementptr [4 x i8], [4 x i8]*@.str4154, i32 0, i32 0
%.tmp4156 = call i32(i8*,i8*) @strcmp(i8* %.tmp4153, i8* %.tmp4155)
%.tmp4157 = icmp eq i32 %.tmp4156, 0
br i1 %.tmp4157, label %.if.true.4158, label %.if.false.4158
.if.true.4158:
%.tmp4159 = load i8*, i8** %dest_tr
store i8* %.tmp4159, i8** %src_tr
br label %.if.end.4158
.if.false.4158:
br label %.if.end.4158
.if.end.4158:
%.tmp4160 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4161 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4160, i32 0, i32 1
%.tmp4162 = load %m0$.File.type*, %m0$.File.type** %.tmp4161
%.tmp4164 = getelementptr [21 x i8], [21 x i8]*@.str4163, i32 0, i32 0
%.tmp4165 = load i8*, i8** %src_tr
%.tmp4166 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4167 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4166)
%.tmp4168 = load i8*, i8** %dest_tr
%.tmp4169 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %dest
%.tmp4170 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4169)
%.tmp4171 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4162, i8* %.tmp4164, i8* %.tmp4165, i8* %.tmp4167, i8* %.tmp4168, i8* %.tmp4170)
br label %.if.end.4106
.if.false.4106:
%.tmp4172 = load i8*, i8** %expr_type
%.tmp4174 = getelementptr [9 x i8], [9 x i8]*@.str4173, i32 0, i32 0
%.tmp4175 = call i32(i8*,i8*) @strcmp(i8* %.tmp4172, i8* %.tmp4174)
%.tmp4176 = icmp eq i32 %.tmp4175, 0
br i1 %.tmp4176, label %.if.true.4177, label %.if.false.4177
.if.true.4177:
%.tmp4178 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4179 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_if_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4178, %m286$.Node.type* %.tmp4179)
br label %.if.end.4177
.if.false.4177:
%.tmp4180 = load i8*, i8** %expr_type
%.tmp4182 = getelementptr [9 x i8], [9 x i8]*@.str4181, i32 0, i32 0
%.tmp4183 = call i32(i8*,i8*) @strcmp(i8* %.tmp4180, i8* %.tmp4182)
%.tmp4184 = icmp eq i32 %.tmp4183, 0
br i1 %.tmp4184, label %.if.true.4185, label %.if.false.4185
.if.true.4185:
%.tmp4186 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4187 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_for_loop.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4186, %m286$.Node.type* %.tmp4187)
br label %.if.end.4185
.if.false.4185:
%.tmp4188 = load i8*, i8** %expr_type
%.tmp4190 = getelementptr [8 x i8], [8 x i8]*@.str4189, i32 0, i32 0
%.tmp4191 = call i32(i8*,i8*) @strcmp(i8* %.tmp4188, i8* %.tmp4190)
%.tmp4192 = icmp eq i32 %.tmp4191, 0
br i1 %.tmp4192, label %.if.true.4193, label %.if.false.4193
.if.true.4193:
%.tmp4194 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4195 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4194)
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp4195, %m1811$.ModuleLookup.type** %mod
%found = alloca i1
store i1 0, i1* %found
%.tmp4196 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4197 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4196, i32 0, i32 3
%.tmp4198 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4197
%s = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp4198, %m1811$.Scope.type** %s
%.tmp4199 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4200 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4199, i32 0, i32 6
%.tmp4201 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4200
%.tmp4202 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4201, i32 0, i32 1
%.tmp4203 = load i8*, i8** %.tmp4202
%.tmp4205 = getelementptr [6 x i8], [6 x i8]*@.str4204, i32 0, i32 0
%.tmp4206 = call i32(i8*,i8*) @strcmp(i8* %.tmp4203, i8* %.tmp4205)
%.tmp4207 = icmp eq i32 %.tmp4206, 0
br i1 %.tmp4207, label %.if.true.4208, label %.if.false.4208
.if.true.4208:
br label %.for.start.4209
.for.start.4209:
%.tmp4210 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4211 = icmp ne %m1811$.Scope.type* %.tmp4210, null
%.tmp4212 = load i1, i1* %found
%.tmp4213 = icmp eq i1 %.tmp4212, 0
%.tmp4214 = and i1 %.tmp4211, %.tmp4213
br i1 %.tmp4214, label %.for.continue.4209, label %.for.end.4209
.for.continue.4209:
%.tmp4215 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4216 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4215, i32 0, i32 2
%.tmp4217 = load i8*, i8** %.tmp4216
%.tmp4219 = getelementptr [4 x i8], [4 x i8]*@.str4218, i32 0, i32 0
%.tmp4220 = call i32(i8*,i8*) @strcmp(i8* %.tmp4217, i8* %.tmp4219)
%.tmp4221 = icmp eq i32 %.tmp4220, 0
br i1 %.tmp4221, label %.if.true.4222, label %.if.false.4222
.if.true.4222:
store i1 1, i1* %found
%.tmp4223 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4224 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4223, i32 0, i32 1
%.tmp4225 = load %m0$.File.type*, %m0$.File.type** %.tmp4224
%.tmp4227 = getelementptr [15 x i8], [15 x i8]*@.str4226, i32 0, i32 0
%.tmp4228 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4229 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4228, i32 0, i32 4
%.tmp4230 = load i8*, i8** %.tmp4229
%.tmp4231 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4225, i8* %.tmp4227, i8* %.tmp4230)
br label %.if.end.4222
.if.false.4222:
br label %.if.end.4222
.if.end.4222:
%.tmp4232 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4233 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4232, i32 0, i32 5
%.tmp4234 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4233
store %m1811$.Scope.type* %.tmp4234, %m1811$.Scope.type** %s
br label %.for.start.4209
.for.end.4209:
br label %.if.end.4208
.if.false.4208:
%.tmp4235 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4236 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4235, i32 0, i32 6
%.tmp4237 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4236
%.tmp4238 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4237, i32 0, i32 1
%.tmp4239 = load i8*, i8** %.tmp4238
%.tmp4241 = getelementptr [9 x i8], [9 x i8]*@.str4240, i32 0, i32 0
%.tmp4242 = call i32(i8*,i8*) @strcmp(i8* %.tmp4239, i8* %.tmp4241)
%.tmp4243 = icmp eq i32 %.tmp4242, 0
br i1 %.tmp4243, label %.if.true.4244, label %.if.false.4244
.if.true.4244:
br label %.for.start.4245
.for.start.4245:
%.tmp4246 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4247 = icmp ne %m1811$.Scope.type* %.tmp4246, null
%.tmp4248 = load i1, i1* %found
%.tmp4249 = icmp eq i1 %.tmp4248, 0
%.tmp4250 = and i1 %.tmp4247, %.tmp4249
br i1 %.tmp4250, label %.for.continue.4245, label %.for.end.4245
.for.continue.4245:
%.tmp4251 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4252 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4251, i32 0, i32 2
%.tmp4253 = load i8*, i8** %.tmp4252
%.tmp4255 = getelementptr [4 x i8], [4 x i8]*@.str4254, i32 0, i32 0
%.tmp4256 = call i32(i8*,i8*) @strcmp(i8* %.tmp4253, i8* %.tmp4255)
%.tmp4257 = icmp eq i32 %.tmp4256, 0
br i1 %.tmp4257, label %.if.true.4258, label %.if.false.4258
.if.true.4258:
store i1 1, i1* %found
%.tmp4259 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4260 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4259, i32 0, i32 1
%.tmp4261 = load %m0$.File.type*, %m0$.File.type** %.tmp4260
%.tmp4263 = getelementptr [15 x i8], [15 x i8]*@.str4262, i32 0, i32 0
%.tmp4264 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4265 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4264, i32 0, i32 3
%.tmp4266 = load i8*, i8** %.tmp4265
%.tmp4267 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4261, i8* %.tmp4263, i8* %.tmp4266)
br label %.if.end.4258
.if.false.4258:
br label %.if.end.4258
.if.end.4258:
%.tmp4268 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4269 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4268, i32 0, i32 5
%.tmp4270 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4269
store %m1811$.Scope.type* %.tmp4270, %m1811$.Scope.type** %s
br label %.for.start.4245
.for.end.4245:
br label %.if.end.4244
.if.false.4244:
%.tmp4271 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4272 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4274 = getelementptr [29 x i8], [29 x i8]*@.str4273, i32 0, i32 0
%.tmp4275 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4271, %m286$.Node.type* %.tmp4272, i8* %.tmp4274)
%.tmp4276 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4277 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4276, i32 0, i32 6
%.tmp4278 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4277
%.tmp4279 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4278, i32 0, i32 1
%.tmp4280 = load i8*, i8** %.tmp4279
%.tmp4281 = call i32(i8*,...) @printf(i8* %.tmp4275, i8* %.tmp4280)
br label %.if.end.4244
.if.end.4244:
br label %.if.end.4208
.if.end.4208:
br label %.if.end.4193
.if.false.4193:
%.tmp4282 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4283 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4285 = getelementptr [34 x i8], [34 x i8]*@.str4284, i32 0, i32 0
%.tmp4286 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4282, %m286$.Node.type* %.tmp4283, i8* %.tmp4285)
%.tmp4287 = load i8*, i8** %expr_type
%.tmp4288 = call i32(i8*,...) @printf(i8* %.tmp4286, i8* %.tmp4287)
br label %.if.end.4193
.if.end.4193:
br label %.if.end.4185
.if.end.4185:
br label %.if.end.4177
.if.end.4177:
br label %.if.end.4106
.if.end.4106:
br label %.if.end.4097
.if.end.4097:
br label %.if.end.4086
.if.end.4086:
br label %.if.end.4080
.if.end.4080:
br label %.if.end.4033
.if.end.4033:
ret void
}
define void @m1811$compile_for_loop.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4289 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4290 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4289)
%for_id = alloca i32
store i32 %.tmp4290, i32* %for_id
%.tmp4291 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4292 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4291, i32 0, i32 6
%.tmp4293 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4292
%.tmp4294 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4293, i32 0, i32 7
%.tmp4295 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4294
%init_stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4295, %m286$.Node.type** %init_stmt
%.tmp4296 = bitcast ptr null to i8*
%begin_lbl = alloca i8*
store i8* %.tmp4296, i8** %begin_lbl
%.tmp4297 = bitcast ptr null to i8*
%end_lbl = alloca i8*
store i8* %.tmp4297, i8** %end_lbl
%.tmp4298 = getelementptr i8*, i8** %begin_lbl, i32 0
%.tmp4300 = getelementptr [14 x i8], [14 x i8]*@.str4299, i32 0, i32 0
%.tmp4301 = load i32, i32* %for_id
%.tmp4302 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4298, i8* %.tmp4300, i32 %.tmp4301)
%.tmp4303 = getelementptr i8*, i8** %end_lbl, i32 0
%.tmp4305 = getelementptr [12 x i8], [12 x i8]*@.str4304, i32 0, i32 0
%.tmp4306 = load i32, i32* %for_id
%.tmp4307 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4303, i8* %.tmp4305, i32 %.tmp4306)
%.tmp4308 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4310 = getelementptr [4 x i8], [4 x i8]*@.str4309, i32 0, i32 0
%.tmp4311 = load i8*, i8** %begin_lbl
%.tmp4312 = load i8*, i8** %end_lbl
call void(%m1811$.CompilerCtx.type*,i8*,i8*,i8*) @m1811$push_scope.v.m1811$.CompilerCtx.typep.cp.cp.cp(%m1811$.CompilerCtx.type* %.tmp4308, i8* %.tmp4310, i8* %.tmp4311, i8* %.tmp4312)
%.tmp4313 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4314 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4313, i32 0, i32 0
%.tmp4315 = load i8*, i8** %.tmp4314
%.tmp4317 = getelementptr [12 x i8], [12 x i8]*@.str4316, i32 0, i32 0
%.tmp4318 = call i32(i8*,i8*) @strcmp(i8* %.tmp4315, i8* %.tmp4317)
%.tmp4319 = icmp eq i32 %.tmp4318, 0
br i1 %.tmp4319, label %.if.true.4320, label %.if.false.4320
.if.true.4320:
%.tmp4321 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4322 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4323 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_declaration.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4321, %m286$.Node.type* %.tmp4322)
br label %.if.end.4320
.if.false.4320:
%.tmp4324 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4325 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4324, i32 0, i32 0
%.tmp4326 = load i8*, i8** %.tmp4325
%.tmp4328 = getelementptr [11 x i8], [11 x i8]*@.str4327, i32 0, i32 0
%.tmp4329 = call i32(i8*,i8*) @strcmp(i8* %.tmp4326, i8* %.tmp4328)
%.tmp4330 = icmp eq i32 %.tmp4329, 0
br i1 %.tmp4330, label %.if.true.4331, label %.if.false.4331
.if.true.4331:
%.tmp4332 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4333 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4332, %m286$.Node.type* %.tmp4333)
br label %.if.end.4331
.if.false.4331:
%.tmp4334 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4334, i32 0, i32 0
%.tmp4336 = load i8*, i8** %.tmp4335
%.tmp4338 = getelementptr [9 x i8], [9 x i8]*@.str4337, i32 0, i32 0
%.tmp4339 = call i32(i8*,i8*) @strcmp(i8* %.tmp4336, i8* %.tmp4338)
%.tmp4340 = icmp eq i32 %.tmp4339, 0
br i1 %.tmp4340, label %.if.true.4341, label %.if.false.4341
.if.true.4341:
br label %.if.end.4341
.if.false.4341:
%.tmp4342 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4343 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4345 = getelementptr [66 x i8], [66 x i8]*@.str4344, i32 0, i32 0
%.tmp4346 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4342, %m286$.Node.type* %.tmp4343, i8* %.tmp4345)
%.tmp4347 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4348 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4347, i32 0, i32 0
%.tmp4349 = load i8*, i8** %.tmp4348
%.tmp4350 = call i32(i8*,...) @printf(i8* %.tmp4346, i8* %.tmp4349)
%.tmp4351 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4351)
ret void
br label %.if.end.4341
.if.end.4341:
br label %.if.end.4331
.if.end.4331:
br label %.if.end.4320
.if.end.4320:
%.tmp4352 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4353 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4352, i32 0, i32 1
%.tmp4354 = load %m0$.File.type*, %m0$.File.type** %.tmp4353
%.tmp4356 = getelementptr [26 x i8], [26 x i8]*@.str4355, i32 0, i32 0
%.tmp4357 = load i32, i32* %for_id
%.tmp4358 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4354, i8* %.tmp4356, i32 %.tmp4357)
%.tmp4359 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4360 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4359, i32 0, i32 1
%.tmp4361 = load %m0$.File.type*, %m0$.File.type** %.tmp4360
%.tmp4363 = getelementptr [16 x i8], [16 x i8]*@.str4362, i32 0, i32 0
%.tmp4364 = load i32, i32* %for_id
%.tmp4365 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4361, i8* %.tmp4363, i32 %.tmp4364)
%.tmp4366 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4367 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4366, i32 0, i32 6
%.tmp4368 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4367
%.tmp4370 = getelementptr [9 x i8], [9 x i8]*@.str4369, i32 0, i32 0
%.tmp4371 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4368, i8* %.tmp4370)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4371, %m286$.Node.type** %fst_colon
%.tmp4372 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4373 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4372, i32 0, i32 7
%.tmp4374 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4373
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4374, %m286$.Node.type** %condition
%.tmp4375 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4376 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4375, i32 0, i32 0
%.tmp4377 = load i8*, i8** %.tmp4376
%.tmp4379 = getelementptr [9 x i8], [9 x i8]*@.str4378, i32 0, i32 0
%.tmp4380 = call i32(i8*,i8*) @strcmp(i8* %.tmp4377, i8* %.tmp4379)
%.tmp4381 = icmp eq i32 %.tmp4380, 0
br i1 %.tmp4381, label %.if.true.4382, label %.if.false.4382
.if.true.4382:
%.tmp4383 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4384 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4386 = getelementptr [39 x i8], [39 x i8]*@.str4385, i32 0, i32 0
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4383, %m286$.Node.type* %.tmp4384, i8* %.tmp4386)
ret void
br label %.if.end.4382
.if.false.4382:
br label %.if.end.4382
.if.end.4382:
%.tmp4387 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4388 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4389 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4387, %m286$.Node.type* %.tmp4388)
%condition_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4389, %m1811$.AssignableInfo.type** %condition_info
%.tmp4390 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4391 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4390, i32 0, i32 1
%.tmp4392 = load %m0$.File.type*, %m0$.File.type** %.tmp4391
%.tmp4394 = getelementptr [48 x i8], [48 x i8]*@.str4393, i32 0, i32 0
%.tmp4395 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4396 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %condition_info
%.tmp4397 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4396, i32 0, i32 3
%.tmp4398 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4397
%.tmp4399 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4395, %m1811$.Type.type* %.tmp4398)
%.tmp4400 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %condition_info
%.tmp4401 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4400)
%.tmp4402 = load i32, i32* %for_id
%.tmp4403 = load i8*, i8** %end_lbl
%.tmp4404 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4392, i8* %.tmp4394, i8* %.tmp4399, i8* %.tmp4401, i32 %.tmp4402, i8* %.tmp4403)
%.tmp4405 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4406 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4405, i32 0, i32 1
%.tmp4407 = load %m0$.File.type*, %m0$.File.type** %.tmp4406
%.tmp4409 = getelementptr [19 x i8], [19 x i8]*@.str4408, i32 0, i32 0
%.tmp4410 = load i32, i32* %for_id
%.tmp4411 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4407, i8* %.tmp4409, i32 %.tmp4410)
%.tmp4412 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4413 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4412, i32 0, i32 7
%.tmp4414 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4413
%.tmp4416 = getelementptr [9 x i8], [9 x i8]*@.str4415, i32 0, i32 0
%.tmp4417 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4414, i8* %.tmp4416)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4417, %m286$.Node.type** %snd_colon
%.tmp4418 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4419 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4418, i32 0, i32 7
%.tmp4420 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4419
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4420, %m286$.Node.type** %increment
%.tmp4421 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4423 = getelementptr [6 x i8], [6 x i8]*@.str4422, i32 0, i32 0
%.tmp4424 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4421, i8* %.tmp4423)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4424, %m286$.Node.type** %for_body
%.tmp4425 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4426 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4425, %m286$.Node.type* %.tmp4426)
%.tmp4427 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4428 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4429 = icmp ne %m286$.Node.type* %.tmp4427, %.tmp4428
br i1 %.tmp4429, label %.if.true.4430, label %.if.false.4430
.if.true.4430:
%.tmp4431 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4432 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_expression.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4431, %m286$.Node.type* %.tmp4432)
br label %.if.end.4430
.if.false.4430:
br label %.if.end.4430
.if.end.4430:
%.tmp4433 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4434 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4433, i32 0, i32 1
%.tmp4435 = load %m0$.File.type*, %m0$.File.type** %.tmp4434
%.tmp4437 = getelementptr [15 x i8], [15 x i8]*@.str4436, i32 0, i32 0
%.tmp4438 = load i8*, i8** %begin_lbl
%.tmp4439 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4435, i8* %.tmp4437, i8* %.tmp4438)
%.tmp4440 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4441 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4440, i32 0, i32 1
%.tmp4442 = load %m0$.File.type*, %m0$.File.type** %.tmp4441
%.tmp4444 = getelementptr [5 x i8], [5 x i8]*@.str4443, i32 0, i32 0
%.tmp4445 = load i8*, i8** %end_lbl
%.tmp4446 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4442, i8* %.tmp4444, i8* %.tmp4445)
%.tmp4447 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
call void(%m1811$.CompilerCtx.type*) @m1811$pop_scope.v.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4447)
ret void
}
define %m1811$.AssignableInfo.type* @m1811$compile_declaration.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4448 = bitcast ptr null to %m1811$.Type.type*
%decl_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp4448, %m1811$.Type.type** %decl_type
%.tmp4449 = bitcast ptr null to %m1811$.AssignableInfo.type*
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4449, %m1811$.AssignableInfo.type** %a_info
%.tmp4450 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4451 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4450, i32 0, i32 6
%.tmp4452 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4451
%.tmp4453 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4452, i32 0, i32 0
%.tmp4454 = load i8*, i8** %.tmp4453
%.tmp4456 = getelementptr [5 x i8], [5 x i8]*@.str4455, i32 0, i32 0
%.tmp4457 = call i32(i8*,i8*) @strcmp(i8* %.tmp4454, i8* %.tmp4456)
%.tmp4458 = icmp eq i32 %.tmp4457, 0
br i1 %.tmp4458, label %.if.true.4459, label %.if.false.4459
.if.true.4459:
%.tmp4460 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4461 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4462 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4461, i32 0, i32 6
%.tmp4463 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4462
%.tmp4464 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4463, i32 0, i32 6
%.tmp4465 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4464
%.tmp4466 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4460, %m286$.Node.type* %.tmp4465)
store %m1811$.Type.type* %.tmp4466, %m1811$.Type.type** %decl_type
br label %.if.end.4459
.if.false.4459:
br label %.if.end.4459
.if.end.4459:
%.tmp4467 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4468 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4467, i32 0, i32 6
%.tmp4469 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4468
%.tmp4471 = getelementptr [11 x i8], [11 x i8]*@.str4470, i32 0, i32 0
%.tmp4472 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4469, i8* %.tmp4471)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4472, %m286$.Node.type** %assignable
%.tmp4473 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4474 = icmp ne %m286$.Node.type* %.tmp4473, null
br i1 %.tmp4474, label %.if.true.4475, label %.if.false.4475
.if.true.4475:
%.tmp4476 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4477 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4478 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4476, %m286$.Node.type* %.tmp4477)
store %m1811$.AssignableInfo.type* %.tmp4478, %m1811$.AssignableInfo.type** %a_info
br label %.if.end.4475
.if.false.4475:
br label %.if.end.4475
.if.end.4475:
%.tmp4479 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4480 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4479)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4480, %m1811$.AssignableInfo.type** %info
%.tmp4481 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4482 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4481, i32 0, i32 2
%.tmp4484 = getelementptr [9 x i8], [9 x i8]*@.str4483, i32 0, i32 0
store i8* %.tmp4484, i8** %.tmp4482
%.tmp4485 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4486 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4485, i32 0, i32 6
%.tmp4487 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4486
%.tmp4489 = getelementptr [5 x i8], [5 x i8]*@.str4488, i32 0, i32 0
%.tmp4490 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4487, i8* %.tmp4489)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4490, %m286$.Node.type** %var_name
%.tmp4491 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4492 = icmp eq %m286$.Node.type* %.tmp4491, null
br i1 %.tmp4492, label %.if.true.4493, label %.if.false.4493
.if.true.4493:
%.tmp4494 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4495 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4497 = getelementptr [31 x i8], [31 x i8]*@.str4496, i32 0, i32 0
%.tmp4498 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4494, %m286$.Node.type* %.tmp4495, i8* %.tmp4497)
%.tmp4499 = call i32(i8*,...) @printf(i8* %.tmp4498)
%.tmp4500 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp4500
br label %.if.end.4493
.if.false.4493:
br label %.if.end.4493
.if.end.4493:
%.tmp4501 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4502 = load i8, i8* @SCOPE_LOCAL
%.tmp4503 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4504 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4503, i32 0, i32 1
%.tmp4505 = load i8*, i8** %.tmp4504
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp4501, i8 %.tmp4502, i8* %.tmp4505)
%.tmp4506 = load %m1811$.Type.type*, %m1811$.Type.type** %decl_type
%.tmp4507 = icmp ne %m1811$.Type.type* %.tmp4506, null
br i1 %.tmp4507, label %.if.true.4508, label %.if.false.4508
.if.true.4508:
%.tmp4509 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4510 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4509, i32 0, i32 3
%.tmp4511 = load %m1811$.Type.type*, %m1811$.Type.type** %decl_type
store %m1811$.Type.type* %.tmp4511, %m1811$.Type.type** %.tmp4510
br label %.if.end.4508
.if.false.4508:
%.tmp4512 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4513 = icmp ne %m1811$.AssignableInfo.type* %.tmp4512, null
br i1 %.tmp4513, label %.if.true.4514, label %.if.false.4514
.if.true.4514:
%.tmp4515 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4516 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4515, i32 0, i32 3
%.tmp4517 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4518 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4517, i32 0, i32 3
%.tmp4519 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4518
store %m1811$.Type.type* %.tmp4519, %m1811$.Type.type** %.tmp4516
br label %.if.end.4514
.if.false.4514:
br label %.if.end.4514
.if.end.4514:
br label %.if.end.4508
.if.end.4508:
%.tmp4520 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4521 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4522 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4521, i32 0, i32 3
%.tmp4523 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4522
%.tmp4524 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4520, %m1811$.Type.type* %.tmp4523)
%var_type_repr = alloca i8*
store i8* %.tmp4524, i8** %var_type_repr
%.tmp4525 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4526 = icmp ne %m1811$.AssignableInfo.type* %.tmp4525, null
br i1 %.tmp4526, label %.if.true.4527, label %.if.false.4527
.if.true.4527:
%.tmp4528 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4529 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4530 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4529, i32 0, i32 3
%.tmp4531 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4530
%.tmp4532 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4528, %m1811$.Type.type* %.tmp4531)
%a_type_repr = alloca i8*
store i8* %.tmp4532, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4533 = load i8*, i8** %a_type_repr
%.tmp4534 = call i32(i8*) @strlen(i8* %.tmp4533)
%.tmp4535 = load i8*, i8** %var_type_repr
%.tmp4536 = call i32(i8*) @strlen(i8* %.tmp4535)
%.tmp4537 = icmp ne i32 %.tmp4534, %.tmp4536
br i1 %.tmp4537, label %.if.true.4538, label %.if.false.4538
.if.true.4538:
store i1 1, i1* %type_error
br label %.if.end.4538
.if.false.4538:
%.tmp4539 = load i8*, i8** %a_type_repr
%.tmp4540 = load i8*, i8** %var_type_repr
%.tmp4541 = call i32(i8*,i8*) @strcmp(i8* %.tmp4539, i8* %.tmp4540)
%.tmp4542 = icmp ne i32 %.tmp4541, 0
br i1 %.tmp4542, label %.if.true.4543, label %.if.false.4543
.if.true.4543:
store i1 1, i1* %type_error
br label %.if.end.4543
.if.false.4543:
br label %.if.end.4543
.if.end.4543:
br label %.if.end.4538
.if.end.4538:
%.tmp4544 = load i1, i1* %type_error
br i1 %.tmp4544, label %.if.true.4545, label %.if.false.4545
.if.true.4545:
%.tmp4546 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4546, i8** %err_msg
%.tmp4547 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4549 = getelementptr [49 x i8], [49 x i8]*@.str4548, i32 0, i32 0
%.tmp4550 = load i8*, i8** %a_type_repr
%.tmp4551 = load i8*, i8** %var_type_repr
%.tmp4552 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4547, i8* %.tmp4549, i8* %.tmp4550, i8* %.tmp4551)
%.tmp4553 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4554 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4555 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4553, %m286$.Node.type* %.tmp4554, i8* %.tmp4555)
br label %.if.end.4545
.if.false.4545:
br label %.if.end.4545
.if.end.4545:
br label %.if.end.4527
.if.false.4527:
br label %.if.end.4527
.if.end.4527:
%.tmp4556 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4557 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4558 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4557, i32 0, i32 1
%.tmp4559 = load i8*, i8** %.tmp4558
%.tmp4560 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4556, i8* %.tmp4559, %m1811$.AssignableInfo.type* %.tmp4560)
%.tmp4561 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4562 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4561, i32 0, i32 1
%.tmp4563 = load %m0$.File.type*, %m0$.File.type** %.tmp4562
%.tmp4565 = getelementptr [16 x i8], [16 x i8]*@.str4564, i32 0, i32 0
%.tmp4566 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4567 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4566)
%.tmp4568 = load i8*, i8** %var_type_repr
%.tmp4569 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4563, i8* %.tmp4565, i8* %.tmp4567, i8* %.tmp4568)
%.tmp4570 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4571 = icmp ne %m1811$.AssignableInfo.type* %.tmp4570, null
br i1 %.tmp4571, label %.if.true.4572, label %.if.false.4572
.if.true.4572:
%.tmp4573 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4574 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4573, i32 0, i32 1
%.tmp4575 = load %m0$.File.type*, %m0$.File.type** %.tmp4574
%.tmp4577 = getelementptr [21 x i8], [21 x i8]*@.str4576, i32 0, i32 0
%.tmp4578 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4579 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4580 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4579, i32 0, i32 3
%.tmp4581 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4580
%.tmp4582 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4578, %m1811$.Type.type* %.tmp4581)
%.tmp4583 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4584 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4583)
%.tmp4585 = load i8*, i8** %var_type_repr
%.tmp4586 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4587 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4586)
%.tmp4588 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4575, i8* %.tmp4577, i8* %.tmp4582, i8* %.tmp4584, i8* %.tmp4585, i8* %.tmp4587)
br label %.if.end.4572
.if.false.4572:
%.tmp4589 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4590 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4591 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4589, %m286$.Node.type* %.tmp4590, %m1811$.AssignableInfo.type* %.tmp4591)
br label %.if.end.4572
.if.end.4572:
%.tmp4592 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp4592
}
define void @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, %m1811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%.tmp4593 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4594 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4593, i32 0, i32 3
%.tmp4595 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4594
%.tmp4596 = icmp eq %m1811$.Type.type* %.tmp4595, null
br i1 %.tmp4596, label %.if.true.4597, label %.if.false.4597
.if.true.4597:
ret void
br label %.if.end.4597
.if.false.4597:
br label %.if.end.4597
.if.end.4597:
%.tmp4598 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4599 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4600 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4599, i32 0, i32 3
%.tmp4601 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4600
%.tmp4602 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4598, %m1811$.Type.type* %.tmp4601)
%t_repr = alloca i8*
store i8* %.tmp4602, i8** %t_repr
%.tmp4603 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4604 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4603)
%id = alloca i8*
store i8* %.tmp4604, i8** %id
%field_id = alloca i32
store i32 0, i32* %field_id
%field = alloca %m1811$.Type.type*
store %m1811$.Type.type* null, %m1811$.Type.type** %field
%field_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* null, %m1811$.AssignableInfo.type** %field_info
%.tmp4605 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4606 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4605, i32 0, i32 3
%.tmp4607 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4606
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp4607, %m1811$.Type.type** %t
%.tmp4608 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4609 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4608, i32 0, i32 0
%.tmp4610 = load i8*, i8** %.tmp4609
%.tmp4612 = getelementptr [4 x i8], [4 x i8]*@.str4611, i32 0, i32 0
%.tmp4613 = call i32(i8*,i8*) @strcmp(i8* %.tmp4610, i8* %.tmp4612)
%.tmp4614 = icmp eq i32 %.tmp4613, 0
%.tmp4615 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4616 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4615, i32 0, i32 0
%.tmp4617 = load i8*, i8** %.tmp4616
%.tmp4619 = getelementptr [4 x i8], [4 x i8]*@.str4618, i32 0, i32 0
%.tmp4620 = call i32(i8*,i8*) @strcmp(i8* %.tmp4617, i8* %.tmp4619)
%.tmp4621 = icmp eq i32 %.tmp4620, 0
%.tmp4622 = or i1 %.tmp4614, %.tmp4621
%.tmp4623 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4624 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4623, i32 0, i32 0
%.tmp4625 = load i8*, i8** %.tmp4624
%.tmp4627 = getelementptr [5 x i8], [5 x i8]*@.str4626, i32 0, i32 0
%.tmp4628 = call i32(i8*,i8*) @strcmp(i8* %.tmp4625, i8* %.tmp4627)
%.tmp4629 = icmp eq i32 %.tmp4628, 0
%.tmp4630 = or i1 %.tmp4622, %.tmp4629
br i1 %.tmp4630, label %.if.true.4631, label %.if.false.4631
.if.true.4631:
%.tmp4632 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4633 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4632, i32 0, i32 1
%.tmp4634 = load %m0$.File.type*, %m0$.File.type** %.tmp4633
%.tmp4636 = getelementptr [21 x i8], [21 x i8]*@.str4635, i32 0, i32 0
%.tmp4637 = load i8*, i8** %t_repr
%.tmp4638 = load i8*, i8** %t_repr
%.tmp4639 = load i8*, i8** %id
%.tmp4640 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4634, i8* %.tmp4636, i8* %.tmp4637, i32 0, i8* %.tmp4638, i8* %.tmp4639)
br label %.if.end.4631
.if.false.4631:
%.tmp4641 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4642 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4641, i32 0, i32 0
%.tmp4643 = load i8*, i8** %.tmp4642
%.tmp4645 = getelementptr [4 x i8], [4 x i8]*@.str4644, i32 0, i32 0
%.tmp4646 = call i32(i8*,i8*) @strcmp(i8* %.tmp4643, i8* %.tmp4645)
%.tmp4647 = icmp eq i32 %.tmp4646, 0
br i1 %.tmp4647, label %.if.true.4648, label %.if.false.4648
.if.true.4648:
%.tmp4649 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4650 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4649, i32 0, i32 1
%.tmp4651 = load %m0$.File.type*, %m0$.File.type** %.tmp4650
%.tmp4653 = getelementptr [21 x i8], [21 x i8]*@.str4652, i32 0, i32 0
%.tmp4654 = load i8*, i8** %t_repr
%.tmp4656 = getelementptr [5 x i8], [5 x i8]*@.str4655, i32 0, i32 0
%.tmp4657 = load i8*, i8** %t_repr
%.tmp4658 = load i8*, i8** %id
%.tmp4659 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4651, i8* %.tmp4653, i8* %.tmp4654, i8* %.tmp4656, i8* %.tmp4657, i8* %.tmp4658)
br label %.if.end.4648
.if.false.4648:
%.tmp4660 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4661 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4660, i32 0, i32 0
%.tmp4662 = load i8*, i8** %.tmp4661
%.tmp4664 = getelementptr [7 x i8], [7 x i8]*@.str4663, i32 0, i32 0
%.tmp4665 = call i32(i8*,i8*) @strcmp(i8* %.tmp4662, i8* %.tmp4664)
%.tmp4666 = icmp eq i32 %.tmp4665, 0
br i1 %.tmp4666, label %.if.true.4667, label %.if.false.4667
.if.true.4667:
%.tmp4669 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4670 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4669, i32 0, i32 3
%.tmp4671 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4670
store %m1811$.Type.type* %.tmp4671, %m1811$.Type.type** %field
br label %.for.start.4668
.for.start.4668:
%.tmp4672 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4673 = icmp ne %m1811$.Type.type* %.tmp4672, null
br i1 %.tmp4673, label %.for.continue.4668, label %.for.end.4668
.for.continue.4668:
%.tmp4674 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4675 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4674)
store %m1811$.AssignableInfo.type* %.tmp4675, %m1811$.AssignableInfo.type** %field_info
%.tmp4676 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4677 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4676, %m1811$.AssignableInfo.type* %.tmp4677)
%.tmp4678 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4679 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4678, i32 0, i32 3
%.tmp4680 = load %m1811$.Type.type*, %m1811$.Type.type** %field
store %m1811$.Type.type* %.tmp4680, %m1811$.Type.type** %.tmp4679
%.tmp4681 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4682 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4681, i32 0, i32 1
%.tmp4683 = load %m0$.File.type*, %m0$.File.type** %.tmp4682
%.tmp4685 = getelementptr [46 x i8], [46 x i8]*@.str4684, i32 0, i32 0
%.tmp4686 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4687 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4686)
%.tmp4688 = load i8*, i8** %t_repr
%.tmp4689 = load i8*, i8** %t_repr
%.tmp4690 = load i8*, i8** %id
%.tmp4691 = load i32, i32* %field_id
%.tmp4692 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4683, i8* %.tmp4685, i8* %.tmp4687, i8* %.tmp4688, i8* %.tmp4689, i8* %.tmp4690, i32 %.tmp4691)
%.tmp4693 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4694 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4695 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4693, %m286$.Node.type* %.tmp4694, %m1811$.AssignableInfo.type* %.tmp4695)
%.tmp4696 = load i32, i32* %field_id
%.tmp4697 = add i32 %.tmp4696, 1
store i32 %.tmp4697, i32* %field_id
%.tmp4698 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4699 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4698, i32 0, i32 4
%.tmp4700 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4699
store %m1811$.Type.type* %.tmp4700, %m1811$.Type.type** %field
br label %.for.start.4668
.for.end.4668:
br label %.if.end.4667
.if.false.4667:
%.tmp4701 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4702 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4701, i32 0, i32 0
%.tmp4703 = load i8*, i8** %.tmp4702
%.tmp4705 = getelementptr [10 x i8], [10 x i8]*@.str4704, i32 0, i32 0
%.tmp4706 = call i32(i8*,i8*) @strcmp(i8* %.tmp4703, i8* %.tmp4705)
%.tmp4707 = icmp eq i32 %.tmp4706, 0
br i1 %.tmp4707, label %.if.true.4708, label %.if.false.4708
.if.true.4708:
%.tmp4710 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp4711 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4710, i32 0, i32 3
%.tmp4712 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4711
%.tmp4713 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4712, i32 0, i32 3
%.tmp4714 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4713
store %m1811$.Type.type* %.tmp4714, %m1811$.Type.type** %field
br label %.for.start.4709
.for.start.4709:
%.tmp4715 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4716 = icmp ne %m1811$.Type.type* %.tmp4715, null
br i1 %.tmp4716, label %.for.continue.4709, label %.for.end.4709
.for.continue.4709:
%.tmp4717 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4718 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4717)
store %m1811$.AssignableInfo.type* %.tmp4718, %m1811$.AssignableInfo.type** %field_info
%.tmp4719 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4720 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4719, %m1811$.AssignableInfo.type* %.tmp4720)
%.tmp4721 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4722 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4721, i32 0, i32 3
%.tmp4723 = load %m1811$.Type.type*, %m1811$.Type.type** %field
store %m1811$.Type.type* %.tmp4723, %m1811$.Type.type** %.tmp4722
%.tmp4724 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4725 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4724, i32 0, i32 1
%.tmp4726 = load %m0$.File.type*, %m0$.File.type** %.tmp4725
%.tmp4728 = getelementptr [46 x i8], [46 x i8]*@.str4727, i32 0, i32 0
%.tmp4729 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
%.tmp4730 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4729)
%.tmp4731 = load i8*, i8** %t_repr
%.tmp4732 = load i8*, i8** %t_repr
%.tmp4733 = load i8*, i8** %id
%.tmp4734 = load i32, i32* %field_id
%.tmp4735 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4726, i8* %.tmp4728, i8* %.tmp4730, i8* %.tmp4731, i8* %.tmp4732, i8* %.tmp4733, i32 %.tmp4734)
%.tmp4736 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4737 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4738 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %field_info
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$compile_zero_value.v.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp4736, %m286$.Node.type* %.tmp4737, %m1811$.AssignableInfo.type* %.tmp4738)
%.tmp4739 = load i32, i32* %field_id
%.tmp4740 = add i32 %.tmp4739, 1
store i32 %.tmp4740, i32* %field_id
%.tmp4741 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp4742 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4741, i32 0, i32 4
%.tmp4743 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4742
store %m1811$.Type.type* %.tmp4743, %m1811$.Type.type** %field
br label %.for.start.4709
.for.end.4709:
br label %.if.end.4708
.if.false.4708:
%.tmp4744 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4745 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4747 = getelementptr [44 x i8], [44 x i8]*@.str4746, i32 0, i32 0
%.tmp4748 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4744, %m286$.Node.type* %.tmp4745, i8* %.tmp4747)
%.tmp4749 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4750 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4749, i32 0, i32 3
%.tmp4751 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4750
%.tmp4752 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp4751, i32 0, i32 0
%.tmp4753 = load i8*, i8** %.tmp4752
%.tmp4754 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4755 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp4756 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4755, i32 0, i32 3
%.tmp4757 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4756
%.tmp4758 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4754, %m1811$.Type.type* %.tmp4757)
%.tmp4759 = call i32(i8*,...) @printf(i8* %.tmp4748, i8* %.tmp4753, i8* %.tmp4758)
ret void
br label %.if.end.4708
.if.end.4708:
br label %.if.end.4667
.if.end.4667:
br label %.if.end.4648
.if.end.4648:
br label %.if.end.4631
.if.end.4631:
ret void
}
define void @m1811$compile_if_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4760 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4761 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4760, i32 0, i32 6
%.tmp4762 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4761
%.tmp4764 = getelementptr [11 x i8], [11 x i8]*@.str4763, i32 0, i32 0
%.tmp4765 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4762, i8* %.tmp4764)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4765, %m286$.Node.type** %assignable
%.tmp4766 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4767 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4768 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4766, %m286$.Node.type* %.tmp4767)
%a_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp4768, %m1811$.AssignableInfo.type** %a_info
%.tmp4769 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4770 = icmp eq %m1811$.AssignableInfo.type* %.tmp4769, null
br i1 %.tmp4770, label %.if.true.4771, label %.if.false.4771
.if.true.4771:
ret void
br label %.if.end.4771
.if.false.4771:
br label %.if.end.4771
.if.end.4771:
%.tmp4772 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4773 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4772)
%if_id = alloca i32
store i32 %.tmp4773, i32* %if_id
%.tmp4774 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4775 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4774, i32 0, i32 1
%.tmp4776 = load %m0$.File.type*, %m0$.File.type** %.tmp4775
%.tmp4778 = getelementptr [53 x i8], [53 x i8]*@.str4777, i32 0, i32 0
%.tmp4779 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4780 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4781 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4780, i32 0, i32 3
%.tmp4782 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp4781
%.tmp4783 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp4779, %m1811$.Type.type* %.tmp4782)
%.tmp4784 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %a_info
%.tmp4785 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp4784)
%.tmp4786 = load i32, i32* %if_id
%.tmp4787 = load i32, i32* %if_id
%.tmp4788 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4776, i8* %.tmp4778, i8* %.tmp4783, i8* %.tmp4785, i32 %.tmp4786, i32 %.tmp4787)
%.tmp4789 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4790 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4789, i32 0, i32 1
%.tmp4791 = load %m0$.File.type*, %m0$.File.type** %.tmp4790
%.tmp4793 = getelementptr [14 x i8], [14 x i8]*@.str4792, i32 0, i32 0
%.tmp4794 = load i32, i32* %if_id
%.tmp4795 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4791, i8* %.tmp4793, i32 %.tmp4794)
%.tmp4796 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4797 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4796, i32 0, i32 6
%.tmp4798 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4797
%.tmp4800 = getelementptr [6 x i8], [6 x i8]*@.str4799, i32 0, i32 0
%.tmp4801 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4798, i8* %.tmp4800)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4801, %m286$.Node.type** %block
%.tmp4802 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4803 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4802, %m286$.Node.type* %.tmp4803)
%.tmp4804 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4805 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4804, i32 0, i32 1
%.tmp4806 = load %m0$.File.type*, %m0$.File.type** %.tmp4805
%.tmp4808 = getelementptr [23 x i8], [23 x i8]*@.str4807, i32 0, i32 0
%.tmp4809 = load i32, i32* %if_id
%.tmp4810 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4806, i8* %.tmp4808, i32 %.tmp4809)
%.tmp4811 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4812 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4811, i32 0, i32 1
%.tmp4813 = load %m0$.File.type*, %m0$.File.type** %.tmp4812
%.tmp4815 = getelementptr [15 x i8], [15 x i8]*@.str4814, i32 0, i32 0
%.tmp4816 = load i32, i32* %if_id
%.tmp4817 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4813, i8* %.tmp4815, i32 %.tmp4816)
%.tmp4818 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4819 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4818, i32 0, i32 6
%.tmp4820 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4819
%.tmp4822 = getelementptr [11 x i8], [11 x i8]*@.str4821, i32 0, i32 0
%.tmp4823 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4820, i8* %.tmp4822)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4823, %m286$.Node.type** %else_block
%.tmp4824 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4825 = icmp ne %m286$.Node.type* %.tmp4824, null
br i1 %.tmp4825, label %.if.true.4826, label %.if.false.4826
.if.true.4826:
%.tmp4827 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4828 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4827, i32 0, i32 6
%.tmp4829 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4828
%.tmp4830 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4829, i32 0, i32 0
%.tmp4831 = load i8*, i8** %.tmp4830
%.tmp4833 = getelementptr [11 x i8], [11 x i8]*@.str4832, i32 0, i32 0
%.tmp4834 = call i32(i8*,i8*) @strcmp(i8* %.tmp4831, i8* %.tmp4833)
%.tmp4835 = icmp eq i32 %.tmp4834, 0
br i1 %.tmp4835, label %.if.true.4836, label %.if.false.4836
.if.true.4836:
%.tmp4837 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4838 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4837, i32 0, i32 6
%.tmp4839 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4838
%.tmp4840 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4839, i32 0, i32 6
%.tmp4841 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4840
%.tmp4843 = getelementptr [6 x i8], [6 x i8]*@.str4842, i32 0, i32 0
%.tmp4844 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4841, i8* %.tmp4843)
store %m286$.Node.type* %.tmp4844, %m286$.Node.type** %block
%.tmp4845 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4846 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4845, %m286$.Node.type* %.tmp4846)
br label %.if.end.4836
.if.false.4836:
%.tmp4847 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4848 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_if_block.v.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4847, %m286$.Node.type* %.tmp4848)
br label %.if.end.4836
.if.end.4836:
br label %.if.end.4826
.if.false.4826:
br label %.if.end.4826
.if.end.4826:
%.tmp4849 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4850 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4849, i32 0, i32 1
%.tmp4851 = load %m0$.File.type*, %m0$.File.type** %.tmp4850
%.tmp4853 = getelementptr [23 x i8], [23 x i8]*@.str4852, i32 0, i32 0
%.tmp4854 = load i32, i32* %if_id
%.tmp4855 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4851, i8* %.tmp4853, i32 %.tmp4854)
%.tmp4856 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4857 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4856, i32 0, i32 1
%.tmp4858 = load %m0$.File.type*, %m0$.File.type** %.tmp4857
%.tmp4860 = getelementptr [13 x i8], [13 x i8]*@.str4859, i32 0, i32 0
%.tmp4861 = load i32, i32* %if_id
%.tmp4862 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4858, i8* %.tmp4860, i32 %.tmp4861)
ret void
}
define void @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4863 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4864 = icmp ne %m286$.Node.type* %.tmp4863, null
br i1 %.tmp4864, label %.if.true.4865, label %.if.false.4865
.if.true.4865:
%.tmp4866 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4867 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp4866, i32 0, i32 6
%.tmp4868 = load i8*, i8** %.tmp4867
%.tmp4869 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4870 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4869, i32 0, i32 3
%.tmp4871 = load i32, i32* %.tmp4870
%.tmp4872 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4873 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4872, i32 0, i32 4
%.tmp4874 = load i32, i32* %.tmp4873
%.tmp4875 = load i8*, i8** %msg
%.tmp4876 = call %m754$.Error.type*(i8*,i32,i32,i8*) @m754$new.m754$.Error.typep.cp.i.i.cp(i8* %.tmp4868, i32 %.tmp4871, i32 %.tmp4874, i8* %.tmp4875)
%err = alloca %m754$.Error.type*
store %m754$.Error.type* %.tmp4876, %m754$.Error.type** %err
%.tmp4877 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4878 = load %m754$.Error.type*, %m754$.Error.type** %err
call void(%m1811$.CompilerCtx.type*,%m754$.Error.type*) @m1811$append_error.v.m1811$.CompilerCtx.typep.m754$.Error.typep(%m1811$.CompilerCtx.type* %.tmp4877, %m754$.Error.type* %.tmp4878)
br label %.if.end.4865
.if.false.4865:
%.tmp4880 = getelementptr [61 x i8], [61 x i8]*@.str4879, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4880)
br label %.if.end.4865
.if.end.4865:
ret void
}
define void @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.info.arg, %m1811$.AssignableInfo.type** %info
%.tmp4881 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4882 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*) @m1811$get_current_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp4881)
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp4882, %m1811$.ModuleLookup.type** %mod
%.tmp4883 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4884 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4883, i32 0, i32 3
%.tmp4885 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4884
%.tmp4886 = icmp ne %m1811$.Scope.type* %.tmp4885, null
%.tmp4888 = getelementptr [82 x i8], [82 x i8]*@.str4887, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4886, i8* %.tmp4888)
%.tmp4889 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4890 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4889, i32 0, i32 3
%.tmp4891 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4890
%current_scope = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp4891, %m1811$.Scope.type** %current_scope
%.tmp4892 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* null, i32 1
%.tmp4893 = ptrtoint %m1811$.ScopeItem.type* %.tmp4892 to i32
%.tmp4894 = call i8*(i32) @malloc(i32 %.tmp4893)
%.tmp4895 = bitcast i8* %.tmp4894 to %m1811$.ScopeItem.type*
%newitem = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4895, %m1811$.ScopeItem.type** %newitem
%.tmp4896 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
%.tmp4897 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4896, i32 0, i32 0
%.tmp4898 = load i8*, i8** %name
store i8* %.tmp4898, i8** %.tmp4897
%.tmp4899 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
%.tmp4900 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4899, i32 0, i32 1
%.tmp4901 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
store %m1811$.AssignableInfo.type* %.tmp4901, %m1811$.AssignableInfo.type** %.tmp4900
%.tmp4902 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
%.tmp4903 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4902, i32 0, i32 2
store %m1811$.ScopeItem.type* null, %m1811$.ScopeItem.type** %.tmp4903
%.tmp4904 = load %m1811$.Scope.type*, %m1811$.Scope.type** %current_scope
%.tmp4905 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4904, i32 0, i32 1
%.tmp4906 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4905
%.tmp4907 = icmp eq %m1811$.ScopeItem.type* %.tmp4906, null
br i1 %.tmp4907, label %.if.true.4908, label %.if.false.4908
.if.true.4908:
%.tmp4909 = load %m1811$.Scope.type*, %m1811$.Scope.type** %current_scope
%.tmp4910 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4909, i32 0, i32 1
%.tmp4911 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
store %m1811$.ScopeItem.type* %.tmp4911, %m1811$.ScopeItem.type** %.tmp4910
ret void
br label %.if.end.4908
.if.false.4908:
br label %.if.end.4908
.if.end.4908:
%.tmp4912 = load %m1811$.Scope.type*, %m1811$.Scope.type** %current_scope
%.tmp4913 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4912, i32 0, i32 1
%.tmp4914 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4913
%last_item = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4914, %m1811$.ScopeItem.type** %last_item
br label %.for.start.4915
.for.start.4915:
%.tmp4916 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %last_item
%.tmp4917 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4916, i32 0, i32 2
%.tmp4918 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4917
%.tmp4919 = icmp ne %m1811$.ScopeItem.type* %.tmp4918, null
br i1 %.tmp4919, label %.for.continue.4915, label %.for.end.4915
.for.continue.4915:
%.tmp4920 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %last_item
%.tmp4921 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4920, i32 0, i32 2
%.tmp4922 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4921
store %m1811$.ScopeItem.type* %.tmp4922, %m1811$.ScopeItem.type** %last_item
br label %.for.start.4915
.for.end.4915:
%.tmp4923 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %last_item
%.tmp4924 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4923, i32 0, i32 2
%.tmp4925 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %newitem
store %m1811$.ScopeItem.type* %.tmp4925, %m1811$.ScopeItem.type** %.tmp4924
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
%.tmp4926 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4927 = load i8*, i8** %module
%.tmp4928 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4929 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4928, i32 0, i32 1
%.tmp4930 = load i8*, i8** %.tmp4929
%.tmp4931 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp4926, i8* %.tmp4927, i8* %.tmp4930)
%found = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4931, %m1811$.ScopeItem.type** %found
%.tmp4932 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4933 = icmp eq %m1811$.ScopeItem.type* %.tmp4932, null
br i1 %.tmp4933, label %.if.true.4934, label %.if.false.4934
.if.true.4934:
%.tmp4935 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4937 = getelementptr [31 x i8], [31 x i8]*@.str4936, i32 0, i32 0
%.tmp4938 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4938, i32 0, i32 1
%.tmp4940 = load i8*, i8** %.tmp4939
%.tmp4941 = load i8*, i8** %module
%.tmp4942 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4935, i8* %.tmp4937, i8* %.tmp4940, i8* %.tmp4941)
%.tmp4943 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4944 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4945 = load i8*, i8** %err_buf
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp4943, %m286$.Node.type* %.tmp4944, i8* %.tmp4945)
%.tmp4946 = bitcast ptr null to %m1811$.ScopeItem.type*
ret %m1811$.ScopeItem.type* %.tmp4946
br label %.if.end.4934
.if.false.4934:
br label %.if.end.4934
.if.end.4934:
br label %.for.start.4947
.for.start.4947:
%.tmp4948 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4949 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4948, i32 0, i32 7
%.tmp4950 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4949
%.tmp4951 = icmp ne %m286$.Node.type* %.tmp4950, null
%.tmp4952 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4953 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4952, i32 0, i32 1
%.tmp4954 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp4953
%.tmp4955 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4954, i32 0, i32 2
%.tmp4956 = load i8*, i8** %.tmp4955
%.tmp4958 = getelementptr [7 x i8], [7 x i8]*@.str4957, i32 0, i32 0
%.tmp4959 = call i32(i8*,i8*) @strcmp(i8* %.tmp4956, i8* %.tmp4958)
%.tmp4960 = icmp eq i32 %.tmp4959, 0
%.tmp4961 = and i1 %.tmp4951, %.tmp4960
br i1 %.tmp4961, label %.for.continue.4947, label %.for.end.4947
.for.continue.4947:
%.tmp4962 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4963 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4964 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp4963, i32 0, i32 1
%.tmp4965 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp4964
%.tmp4966 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp4965, i32 0, i32 0
%.tmp4967 = load i8*, i8** %.tmp4966
%.tmp4968 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4969 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4968, i32 0, i32 7
%.tmp4970 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4969
%.tmp4971 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4970, i32 0, i32 7
%.tmp4972 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4971
%.tmp4973 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1811$find_defined_in.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp4962, i8* %.tmp4967, %m286$.Node.type* %.tmp4972)
store %m1811$.ScopeItem.type* %.tmp4973, %m1811$.ScopeItem.type** %found
%.tmp4974 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
%.tmp4975 = icmp eq %m1811$.ScopeItem.type* %.tmp4974, null
br i1 %.tmp4975, label %.if.true.4976, label %.if.false.4976
.if.true.4976:
%.tmp4977 = bitcast ptr null to %m1811$.ScopeItem.type*
ret %m1811$.ScopeItem.type* %.tmp4977
br label %.if.end.4976
.if.false.4976:
br label %.if.end.4976
.if.end.4976:
br label %.for.start.4947
.for.end.4947:
%.tmp4978 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %found
ret %m1811$.ScopeItem.type* %.tmp4978
}
define %m1811$.ScopeItem.type* @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4979 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp4980 = load i8*, i8** %module
%.tmp4981 = call %m1811$.ModuleLookup.type*(%m1811$.CompilerCtx.type*,i8*) @m1811$get_module.m1811$.ModuleLookup.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp4979, i8* %.tmp4980)
%mod = alloca %m1811$.ModuleLookup.type*
store %m1811$.ModuleLookup.type* %.tmp4981, %m1811$.ModuleLookup.type** %mod
%.tmp4982 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4983 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4982, i32 0, i32 3
%.tmp4984 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4983
%.tmp4985 = icmp ne %m1811$.Scope.type* %.tmp4984, null
%.tmp4987 = getelementptr [77 x i8], [77 x i8]*@.str4986, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4985, i8* %.tmp4987)
%.tmp4989 = load %m1811$.ModuleLookup.type*, %m1811$.ModuleLookup.type** %mod
%.tmp4990 = getelementptr %m1811$.ModuleLookup.type, %m1811$.ModuleLookup.type* %.tmp4989, i32 0, i32 3
%.tmp4991 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp4990
%s = alloca %m1811$.Scope.type*
store %m1811$.Scope.type* %.tmp4991, %m1811$.Scope.type** %s
br label %.for.start.4988
.for.start.4988:
%.tmp4992 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4993 = icmp ne %m1811$.Scope.type* %.tmp4992, null
br i1 %.tmp4993, label %.for.continue.4988, label %.for.end.4988
.for.continue.4988:
%.tmp4995 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp4996 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp4995, i32 0, i32 1
%.tmp4997 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp4996
%item = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp4997, %m1811$.ScopeItem.type** %item
br label %.for.start.4994
.for.start.4994:
%.tmp4998 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
%.tmp4999 = icmp ne %m1811$.ScopeItem.type* %.tmp4998, null
br i1 %.tmp4999, label %.for.continue.4994, label %.for.end.4994
.for.continue.4994:
%.tmp5000 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
%.tmp5001 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5000, i32 0, i32 0
%.tmp5002 = load i8*, i8** %.tmp5001
%.tmp5003 = load i8*, i8** %assignable_name
%.tmp5004 = call i32(i8*,i8*) @strcmp(i8* %.tmp5002, i8* %.tmp5003)
%.tmp5005 = icmp eq i32 %.tmp5004, 0
br i1 %.tmp5005, label %.if.true.5006, label %.if.false.5006
.if.true.5006:
%.tmp5007 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
ret %m1811$.ScopeItem.type* %.tmp5007
br label %.if.end.5006
.if.false.5006:
br label %.if.end.5006
.if.end.5006:
%.tmp5008 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %item
%.tmp5009 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5008, i32 0, i32 2
%.tmp5010 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %.tmp5009
store %m1811$.ScopeItem.type* %.tmp5010, %m1811$.ScopeItem.type** %item
br label %.for.start.4994
.for.end.4994:
%.tmp5011 = load %m1811$.Scope.type*, %m1811$.Scope.type** %s
%.tmp5012 = getelementptr %m1811$.Scope.type, %m1811$.Scope.type* %.tmp5011, i32 0, i32 5
%.tmp5013 = load %m1811$.Scope.type*, %m1811$.Scope.type** %.tmp5012
store %m1811$.Scope.type* %.tmp5013, %m1811$.Scope.type** %s
br label %.for.start.4988
.for.end.4988:
%.tmp5014 = bitcast ptr null to %m1811$.ScopeItem.type*
ret %m1811$.ScopeItem.type* %.tmp5014
}
define %m1811$.ScopeItem.type* @m1811$find_defined.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp5015 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5016 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5017 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5016, i32 0, i32 6
%.tmp5018 = load i8*, i8** %.tmp5017
%.tmp5019 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp5020 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5019, i32 0, i32 6
%.tmp5021 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5020
%.tmp5022 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1811$find_defined_in.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5015, i8* %.tmp5018, %m286$.Node.type* %.tmp5021)
ret %m1811$.ScopeItem.type* %.tmp5022
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
%.tmp5023 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5024 = icmp eq %m1811$.AssignableInfo.type* %.tmp5023, null
br i1 %.tmp5024, label %.if.true.5025, label %.if.false.5025
.if.true.5025:
%.tmp5026 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5027 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5029 = getelementptr [54 x i8], [54 x i8]*@.str5028, i32 0, i32 0
%.tmp5030 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5026, %m286$.Node.type* %.tmp5027, i8* %.tmp5029)
%.tmp5031 = call i32(i8*,...) @printf(i8* %.tmp5030)
%.tmp5032 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5032
br label %.if.end.5025
.if.false.5025:
br label %.if.end.5025
.if.end.5025:
%.tmp5033 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5034 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5033, i32 0, i32 2
%.tmp5035 = load i8*, i8** %.tmp5034
%.tmp5037 = getelementptr [9 x i8], [9 x i8]*@.str5036, i32 0, i32 0
%.tmp5038 = call i32(i8*,i8*) @strcmp(i8* %.tmp5035, i8* %.tmp5037)
%.tmp5039 = icmp eq i32 %.tmp5038, 0
%.tmp5040 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5041 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5040, i32 0, i32 2
%.tmp5042 = load i8*, i8** %.tmp5041
%.tmp5044 = getelementptr [7 x i8], [7 x i8]*@.str5043, i32 0, i32 0
%.tmp5045 = call i32(i8*,i8*) @strcmp(i8* %.tmp5042, i8* %.tmp5044)
%.tmp5046 = icmp eq i32 %.tmp5045, 0
%.tmp5047 = or i1 %.tmp5039, %.tmp5046
br i1 %.tmp5047, label %.if.true.5048, label %.if.false.5048
.if.true.5048:
%.tmp5049 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5049, i32 0, i32 7
%.tmp5051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5050
%.tmp5052 = icmp ne %m286$.Node.type* %.tmp5051, null
br i1 %.tmp5052, label %.if.true.5053, label %.if.false.5053
.if.true.5053:
%.tmp5054 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5056 = getelementptr [46 x i8], [46 x i8]*@.str5055, i32 0, i32 0
%.tmp5057 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5058 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5057, i32 0, i32 7
%.tmp5059 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5058
%.tmp5060 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5059, i32 0, i32 7
%.tmp5061 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5060
%.tmp5062 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5061, i32 0, i32 1
%.tmp5063 = load i8*, i8** %.tmp5062
%.tmp5064 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5065 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5064, i32 0, i32 1
%.tmp5066 = load i8*, i8** %.tmp5065
%.tmp5067 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5054, i8* %.tmp5056, i8* %.tmp5063, i8* %.tmp5066)
%.tmp5068 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5069 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5070 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5068, %m286$.Node.type* %.tmp5069, i8* %.tmp5070)
%.tmp5071 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5071
br label %.if.end.5053
.if.false.5053:
br label %.if.end.5053
.if.end.5053:
%.tmp5072 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5072
br label %.if.end.5048
.if.false.5048:
%.tmp5073 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5074 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5073, i32 0, i32 2
%.tmp5075 = load i8*, i8** %.tmp5074
%.tmp5077 = getelementptr [9 x i8], [9 x i8]*@.str5076, i32 0, i32 0
%.tmp5078 = call i32(i8*,i8*) @strcmp(i8* %.tmp5075, i8* %.tmp5077)
%.tmp5079 = icmp eq i32 %.tmp5078, 0
%.tmp5080 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5081 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5080, i32 0, i32 7
%.tmp5082 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5081
%.tmp5083 = icmp ne %m286$.Node.type* %.tmp5082, null
%.tmp5084 = and i1 %.tmp5079, %.tmp5083
br i1 %.tmp5084, label %.if.true.5085, label %.if.false.5085
.if.true.5085:
%.tmp5086 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%base_var = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5086, %m1811$.AssignableInfo.type** %base_var
%.tmp5087 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5088 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5087, i32 0, i32 3
%.tmp5089 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5088
%struct_info = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5089, %m1811$.Type.type** %struct_info
br label %.for.start.5090
.for.start.5090:
%.tmp5091 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5092 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5091, i32 0, i32 3
%.tmp5093 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5092
%.tmp5094 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5093, i32 0, i32 0
%.tmp5095 = load i8*, i8** %.tmp5094
%.tmp5097 = getelementptr [4 x i8], [4 x i8]*@.str5096, i32 0, i32 0
%.tmp5098 = call i32(i8*,i8*) @strcmp(i8* %.tmp5095, i8* %.tmp5097)
%.tmp5099 = icmp eq i32 %.tmp5098, 0
br i1 %.tmp5099, label %.for.continue.5090, label %.for.end.5090
.for.continue.5090:
%.tmp5100 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5101 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5100)
%new_base = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5101, %m1811$.AssignableInfo.type** %new_base
%.tmp5102 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5103 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5102, %m1811$.AssignableInfo.type* %.tmp5103)
%.tmp5104 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5105 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5104, i32 0, i32 3
%.tmp5106 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5107 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5106, i32 0, i32 3
%.tmp5108 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5107
%.tmp5109 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5108, i32 0, i32 3
%.tmp5110 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5109
store %m1811$.Type.type* %.tmp5110, %m1811$.Type.type** %.tmp5105
%.tmp5111 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5112 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5111, i32 0, i32 1
%.tmp5113 = load %m0$.File.type*, %m0$.File.type** %.tmp5112
%.tmp5115 = getelementptr [23 x i8], [23 x i8]*@.str5114, i32 0, i32 0
%.tmp5116 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5117 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5116)
%.tmp5118 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5119 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5120 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5119, i32 0, i32 3
%.tmp5121 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5120
%.tmp5122 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5118, %m1811$.Type.type* %.tmp5121)
%.tmp5123 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5124 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5125 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5124, i32 0, i32 3
%.tmp5126 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5125
%.tmp5127 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5123, %m1811$.Type.type* %.tmp5126)
%.tmp5128 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5129 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5128)
%.tmp5130 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5113, i8* %.tmp5115, i8* %.tmp5117, i8* %.tmp5122, i8* %.tmp5127, i8* %.tmp5129)
%.tmp5131 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
store %m1811$.AssignableInfo.type* %.tmp5131, %m1811$.AssignableInfo.type** %base_var
%.tmp5132 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5133 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5132, i32 0, i32 3
%.tmp5134 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5133
store %m1811$.Type.type* %.tmp5134, %m1811$.Type.type** %struct_info
br label %.for.start.5090
.for.end.5090:
%.tmp5135 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5136 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5135, i32 0, i32 0
%.tmp5137 = load i8*, i8** %.tmp5136
%.tmp5139 = getelementptr [10 x i8], [10 x i8]*@.str5138, i32 0, i32 0
%.tmp5140 = call i32(i8*,i8*) @strcmp(i8* %.tmp5137, i8* %.tmp5139)
%.tmp5141 = icmp eq i32 %.tmp5140, 0
br i1 %.tmp5141, label %.if.true.5142, label %.if.false.5142
.if.true.5142:
%.tmp5143 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5144 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5143, i32 0, i32 3
%.tmp5145 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5144
store %m1811$.Type.type* %.tmp5145, %m1811$.Type.type** %struct_info
br label %.if.end.5142
.if.false.5142:
br label %.if.end.5142
.if.end.5142:
%.tmp5146 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5147 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5146, i32 0, i32 0
%.tmp5148 = load i8*, i8** %.tmp5147
%.tmp5150 = getelementptr [7 x i8], [7 x i8]*@.str5149, i32 0, i32 0
%.tmp5151 = call i32(i8*,i8*) @strcmp(i8* %.tmp5148, i8* %.tmp5150)
%.tmp5152 = icmp ne i32 %.tmp5151, 0
br i1 %.tmp5152, label %.if.true.5153, label %.if.false.5153
.if.true.5153:
%.tmp5154 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5156 = getelementptr [48 x i8], [48 x i8]*@.str5155, i32 0, i32 0
%.tmp5157 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5158 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5157, i32 0, i32 7
%.tmp5159 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5158
%.tmp5160 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5159, i32 0, i32 7
%.tmp5161 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5160
%.tmp5162 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5161, i32 0, i32 1
%.tmp5163 = load i8*, i8** %.tmp5162
%.tmp5164 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5165 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5164, i32 0, i32 1
%.tmp5166 = load i8*, i8** %.tmp5165
%.tmp5167 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5154, i8* %.tmp5156, i8* %.tmp5163, i8* %.tmp5166)
%.tmp5168 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5169 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5170 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5168, %m286$.Node.type* %.tmp5169, i8* %.tmp5170)
%.tmp5171 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5171
br label %.if.end.5153
.if.false.5153:
br label %.if.end.5153
.if.end.5153:
%.tmp5172 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5173 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5172, i32 0, i32 7
%.tmp5174 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5173
%.tmp5175 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5174, i32 0, i32 7
%.tmp5176 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5175
%.tmp5177 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5176, i32 0, i32 1
%.tmp5178 = load i8*, i8** %.tmp5177
%field_name = alloca i8*
store i8* %.tmp5178, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp5179 = bitcast ptr null to %m1811$.Type.type*
%found_field = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5179, %m1811$.Type.type** %found_field
%.tmp5181 = load %m1811$.Type.type*, %m1811$.Type.type** %struct_info
%.tmp5182 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5181, i32 0, i32 3
%.tmp5183 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5182
%field = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5183, %m1811$.Type.type** %field
br label %.for.start.5180
.for.start.5180:
%.tmp5184 = load i1, i1* %quit
%.tmp5185 = icmp eq i1 %.tmp5184, 0
br i1 %.tmp5185, label %.for.continue.5180, label %.for.end.5180
.for.continue.5180:
%.tmp5186 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp5187 = icmp eq %m1811$.Type.type* %.tmp5186, null
br i1 %.tmp5187, label %.if.true.5188, label %.if.false.5188
.if.true.5188:
store i1 1, i1* %quit
br label %.if.end.5188
.if.false.5188:
%.tmp5189 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp5190 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5189, i32 0, i32 1
%.tmp5191 = load i8*, i8** %.tmp5190
%.tmp5192 = load i8*, i8** %field_name
%.tmp5193 = call i32(i8*,i8*) @strcmp(i8* %.tmp5191, i8* %.tmp5192)
%.tmp5194 = icmp eq i32 %.tmp5193, 0
br i1 %.tmp5194, label %.if.true.5195, label %.if.false.5195
.if.true.5195:
store i1 1, i1* %quit
%.tmp5196 = load %m1811$.Type.type*, %m1811$.Type.type** %field
store %m1811$.Type.type* %.tmp5196, %m1811$.Type.type** %found_field
br label %.if.end.5195
.if.false.5195:
%.tmp5197 = load i32, i32* %field_id
%.tmp5198 = add i32 %.tmp5197, 1
store i32 %.tmp5198, i32* %field_id
br label %.if.end.5195
.if.end.5195:
br label %.if.end.5188
.if.end.5188:
%.tmp5199 = load %m1811$.Type.type*, %m1811$.Type.type** %field
%.tmp5200 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5199, i32 0, i32 4
%.tmp5201 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5200
store %m1811$.Type.type* %.tmp5201, %m1811$.Type.type** %field
br label %.for.start.5180
.for.end.5180:
%.tmp5202 = load %m1811$.Type.type*, %m1811$.Type.type** %found_field
%.tmp5203 = icmp eq %m1811$.Type.type* %.tmp5202, null
br i1 %.tmp5203, label %.if.true.5204, label %.if.false.5204
.if.true.5204:
%.tmp5205 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5207 = getelementptr [34 x i8], [34 x i8]*@.str5206, i32 0, i32 0
%.tmp5208 = load i8*, i8** %field_name
%.tmp5209 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5210 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5209, i32 0, i32 1
%.tmp5211 = load i8*, i8** %.tmp5210
%.tmp5212 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5205, i8* %.tmp5207, i8* %.tmp5208, i8* %.tmp5211)
%.tmp5213 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5214 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5215 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5213, %m286$.Node.type* %.tmp5214, i8* %.tmp5215)
%.tmp5216 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5216
br label %.if.end.5204
.if.false.5204:
br label %.if.end.5204
.if.end.5204:
%.tmp5217 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5218 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5217)
%new_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5218, %m1811$.AssignableInfo.type** %new_info
%.tmp5219 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5220 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5219, i32 0, i32 3
%.tmp5221 = load %m1811$.Type.type*, %m1811$.Type.type** %found_field
store %m1811$.Type.type* %.tmp5221, %m1811$.Type.type** %.tmp5220
%.tmp5222 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5223 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5222, %m1811$.AssignableInfo.type* %.tmp5223)
%.tmp5224 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5225 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5224, i32 0, i32 2
%.tmp5227 = getelementptr [9 x i8], [9 x i8]*@.str5226, i32 0, i32 0
store i8* %.tmp5227, i8** %.tmp5225
%.tmp5228 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5229 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5230 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5229, i32 0, i32 3
%.tmp5231 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5230
%.tmp5232 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5228, %m1811$.Type.type* %.tmp5231)
%info_tr = alloca i8*
store i8* %.tmp5232, i8** %info_tr
%.tmp5233 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5234 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5233, i32 0, i32 1
%.tmp5235 = load %m0$.File.type*, %m0$.File.type** %.tmp5234
%.tmp5237 = getelementptr [46 x i8], [46 x i8]*@.str5236, i32 0, i32 0
%.tmp5238 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5239 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5238)
%.tmp5240 = load i8*, i8** %info_tr
%.tmp5241 = load i8*, i8** %info_tr
%.tmp5242 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base_var
%.tmp5243 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5242)
%.tmp5244 = load i32, i32* %field_id
%.tmp5245 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5235, i8* %.tmp5237, i8* %.tmp5239, i8* %.tmp5240, i8* %.tmp5241, i8* %.tmp5243, i32 %.tmp5244)
%.tmp5246 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5247 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5248 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5247, i32 0, i32 7
%.tmp5249 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5248
%.tmp5250 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5249, i32 0, i32 7
%.tmp5251 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5250
%.tmp5252 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_info
%.tmp5253 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$get_dotted_name.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5246, %m286$.Node.type* %.tmp5251, %m1811$.AssignableInfo.type* %.tmp5252)
ret %m1811$.AssignableInfo.type* %.tmp5253
br label %.if.end.5085
.if.false.5085:
%.tmp5254 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5255 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5254, i32 0, i32 2
%.tmp5256 = load i8*, i8** %.tmp5255
%.tmp5258 = getelementptr [9 x i8], [9 x i8]*@.str5257, i32 0, i32 0
%.tmp5259 = call i32(i8*,i8*) @strcmp(i8* %.tmp5256, i8* %.tmp5258)
%.tmp5260 = icmp eq i32 %.tmp5259, 0
br i1 %.tmp5260, label %.if.true.5261, label %.if.false.5261
.if.true.5261:
%.tmp5262 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5262
br label %.if.end.5261
.if.false.5261:
br label %.if.end.5261
.if.end.5261:
br label %.if.end.5085
.if.end.5085:
br label %.if.end.5048
.if.end.5048:
%.tmp5263 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5264 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5266 = getelementptr [43 x i8], [43 x i8]*@.str5265, i32 0, i32 0
%.tmp5267 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5263, %m286$.Node.type* %.tmp5264, i8* %.tmp5266)
%.tmp5268 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5269 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5268, i32 0, i32 2
%.tmp5270 = load i8*, i8** %.tmp5269
%.tmp5271 = call i32(i8*,...) @printf(i8* %.tmp5267, i8* %.tmp5270)
%.tmp5272 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5272
}
define %m1811$.AssignableInfo.type* @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp5273 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5273, %m286$.Node.type** %curr_node
%.tmp5274 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5275 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5274, i32 0, i32 0
%.tmp5276 = load i8*, i8** %.tmp5275
%.tmp5278 = getelementptr [12 x i8], [12 x i8]*@.str5277, i32 0, i32 0
%.tmp5279 = call i32(i8*,i8*) @strcmp(i8* %.tmp5276, i8* %.tmp5278)
%.tmp5280 = icmp ne i32 %.tmp5279, 0
br i1 %.tmp5280, label %.if.true.5281, label %.if.false.5281
.if.true.5281:
%.tmp5283 = getelementptr [92 x i8], [92 x i8]*@.str5282, i32 0, i32 0
%.tmp5284 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5285 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5284, i32 0, i32 0
%.tmp5286 = load i8*, i8** %.tmp5285
%.tmp5287 = call i32(i8*,...) @printf(i8* %.tmp5283, i8* %.tmp5286)
%.tmp5288 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp5289 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5288, i32 0, i32 6
%.tmp5290 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5289
store %m286$.Node.type* %.tmp5290, %m286$.Node.type** %curr_node
br label %.if.end.5281
.if.false.5281:
br label %.if.end.5281
.if.end.5281:
%.tmp5291 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5292 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5291, i32 0, i32 6
%.tmp5293 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5292
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5293, %m286$.Node.type** %assignable_name
%.tmp5294 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5295 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5296 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5295, i32 0, i32 6
%.tmp5297 = load i8*, i8** %.tmp5296
%.tmp5298 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5299 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5298, i32 0, i32 6
%.tmp5300 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5299
%.tmp5301 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5300, i32 0, i32 1
%.tmp5302 = load i8*, i8** %.tmp5301
%.tmp5303 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp5294, i8* %.tmp5297, i8* %.tmp5302)
%scope_info = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp5303, %m1811$.ScopeItem.type** %scope_info
%.tmp5304 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5305 = icmp eq %m1811$.ScopeItem.type* %.tmp5304, null
br i1 %.tmp5305, label %.if.true.5306, label %.if.false.5306
.if.true.5306:
%.tmp5307 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5309 = getelementptr [25 x i8], [25 x i8]*@.str5308, i32 0, i32 0
%.tmp5310 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5311 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5310, i32 0, i32 6
%.tmp5312 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5311
%.tmp5313 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5312, i32 0, i32 1
%.tmp5314 = load i8*, i8** %.tmp5313
%.tmp5315 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5307, i8* %.tmp5309, i8* %.tmp5314)
%.tmp5316 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5317 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5318 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5316, %m286$.Node.type* %.tmp5317, i8* %.tmp5318)
%.tmp5319 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5319
br label %.if.end.5306
.if.false.5306:
br label %.if.end.5306
.if.end.5306:
%.tmp5320 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5321 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5320, i32 0, i32 1
%.tmp5322 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp5321
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5322, %m1811$.AssignableInfo.type** %info
%.tmp5323 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5324 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5323, i32 0, i32 2
%.tmp5325 = load i8*, i8** %.tmp5324
%.tmp5327 = getelementptr [7 x i8], [7 x i8]*@.str5326, i32 0, i32 0
%.tmp5328 = call i32(i8*,i8*) @strcmp(i8* %.tmp5325, i8* %.tmp5327)
%.tmp5329 = icmp eq i32 %.tmp5328, 0
br i1 %.tmp5329, label %.if.true.5330, label %.if.false.5330
.if.true.5330:
%.tmp5331 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5332 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5333 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5332)
%.tmp5334 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5334, i32 0, i32 6
%.tmp5336 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5335
%.tmp5337 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5336, i32 0, i32 7
%.tmp5338 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5337
%.tmp5339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5338, i32 0, i32 7
%.tmp5340 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5339
%.tmp5341 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5340, i32 0, i32 1
%.tmp5342 = load i8*, i8** %.tmp5341
%.tmp5343 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,i8*,i8*) @m1811$find_defined_str.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.cp.cp(%m1811$.CompilerCtx.type* %.tmp5331, i8* %.tmp5333, i8* %.tmp5342)
store %m1811$.ScopeItem.type* %.tmp5343, %m1811$.ScopeItem.type** %scope_info
%.tmp5344 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5345 = icmp eq %m1811$.ScopeItem.type* %.tmp5344, null
br i1 %.tmp5345, label %.if.true.5346, label %.if.false.5346
.if.true.5346:
%.tmp5347 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5349 = getelementptr [31 x i8], [31 x i8]*@.str5348, i32 0, i32 0
%.tmp5350 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5351 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5350, i32 0, i32 6
%.tmp5352 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5351
%.tmp5353 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5352, i32 0, i32 7
%.tmp5354 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5353
%.tmp5355 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5354, i32 0, i32 7
%.tmp5356 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5355
%.tmp5357 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5356, i32 0, i32 1
%.tmp5358 = load i8*, i8** %.tmp5357
%.tmp5359 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5360 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5359)
%.tmp5361 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5347, i8* %.tmp5349, i8* %.tmp5358, i8* %.tmp5360)
%.tmp5362 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5363 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5364 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5362, %m286$.Node.type* %.tmp5363, i8* %.tmp5364)
%.tmp5365 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5365
br label %.if.end.5346
.if.false.5346:
br label %.if.end.5346
.if.end.5346:
%.tmp5366 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %scope_info
%.tmp5367 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp5366, i32 0, i32 1
%.tmp5368 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp5367
store %m1811$.AssignableInfo.type* %.tmp5368, %m1811$.AssignableInfo.type** %info
%.tmp5369 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5370 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5369, i32 0, i32 6
%.tmp5371 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5370
%.tmp5372 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5371, i32 0, i32 7
%.tmp5373 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5372
%.tmp5374 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5373, i32 0, i32 7
%.tmp5375 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5374
store %m286$.Node.type* %.tmp5375, %m286$.Node.type** %assignable_name
br label %.if.end.5330
.if.false.5330:
%.tmp5376 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5377 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5376, i32 0, i32 6
%.tmp5378 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5377
store %m286$.Node.type* %.tmp5378, %m286$.Node.type** %assignable_name
br label %.if.end.5330
.if.end.5330:
%.tmp5379 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5380 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5381 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5382 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,%m1811$.AssignableInfo.type*) @m1811$get_dotted_name.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5379, %m286$.Node.type* %.tmp5380, %m1811$.AssignableInfo.type* %.tmp5381)
%base = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5382, %m1811$.AssignableInfo.type** %base
%.tmp5384 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5385 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5384, i32 0, i32 6
%.tmp5386 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5385
%.tmp5387 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5386, i32 0, i32 7
%.tmp5388 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5387
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5388, %m286$.Node.type** %addr
br label %.for.start.5383
.for.start.5383:
%.tmp5389 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5390 = icmp ne %m286$.Node.type* %.tmp5389, null
br i1 %.tmp5390, label %.for.continue.5383, label %.for.end.5383
.for.continue.5383:
%.tmp5391 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5392 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5391, i32 0, i32 7
%.tmp5393 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5392
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5393, %m286$.Node.type** %index
%.tmp5394 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5395 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp5396 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5394, %m286$.Node.type* %.tmp5395)
%index_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5396, %m1811$.AssignableInfo.type** %index_info
%.tmp5397 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5398 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5399 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5398, i32 0, i32 3
%.tmp5400 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5399
%.tmp5401 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5397, %m1811$.Type.type* %.tmp5400)
%base_type = alloca i8*
store i8* %.tmp5401, i8** %base_type
%.tmp5402 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5403 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %index_info
%.tmp5404 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5403, i32 0, i32 3
%.tmp5405 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5404
%.tmp5406 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5402, %m1811$.Type.type* %.tmp5405)
%index_type = alloca i8*
store i8* %.tmp5406, i8** %index_type
%.tmp5407 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5408 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp5407)
%tmp_id = alloca i32
store i32 %.tmp5408, i32* %tmp_id
%.tmp5409 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5410 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5409, i32 0, i32 1
%.tmp5411 = load %m0$.File.type*, %m0$.File.type** %.tmp5410
%.tmp5413 = getelementptr [28 x i8], [28 x i8]*@.str5412, i32 0, i32 0
%.tmp5414 = load i32, i32* %tmp_id
%.tmp5415 = load i8*, i8** %base_type
%.tmp5416 = load i8*, i8** %base_type
%.tmp5417 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5418 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5417)
%.tmp5419 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5411, i8* %.tmp5413, i32 %.tmp5414, i8* %.tmp5415, i8* %.tmp5416, i8* %.tmp5418)
%.tmp5420 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5421 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5420)
%new_base = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5421, %m1811$.AssignableInfo.type** %new_base
%.tmp5422 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5423 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5422, %m1811$.AssignableInfo.type* %.tmp5423)
%.tmp5424 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5425 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5424, i32 0, i32 3
%.tmp5426 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5425
%.tmp5427 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5426, i32 0, i32 3
%.tmp5428 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5427
%.tmp5429 = icmp eq %m1811$.Type.type* %.tmp5428, null
br i1 %.tmp5429, label %.if.true.5430, label %.if.false.5430
.if.true.5430:
%.tmp5431 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5433 = getelementptr [35 x i8], [35 x i8]*@.str5432, i32 0, i32 0
%.tmp5434 = load i8*, i8** %base_type
%.tmp5435 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5431, i8* %.tmp5433, i8* %.tmp5434)
%.tmp5436 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5437 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5438 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5436, %m286$.Node.type* %.tmp5437, i8* %.tmp5438)
%.tmp5439 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
ret %m1811$.AssignableInfo.type* %.tmp5439
br label %.if.end.5430
.if.false.5430:
br label %.if.end.5430
.if.end.5430:
%.tmp5440 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5441 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5440, i32 0, i32 3
%.tmp5442 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
%.tmp5443 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5442, i32 0, i32 3
%.tmp5444 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5443
%.tmp5445 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5444, i32 0, i32 3
%.tmp5446 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5445
store %m1811$.Type.type* %.tmp5446, %m1811$.Type.type** %.tmp5441
%.tmp5447 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5448 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5449 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5448, i32 0, i32 3
%.tmp5450 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5449
%.tmp5451 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5447, %m1811$.Type.type* %.tmp5450)
%base_type_2 = alloca i8*
store i8* %.tmp5451, i8** %base_type_2
%.tmp5452 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5453 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5452, i32 0, i32 1
%.tmp5454 = load %m0$.File.type*, %m0$.File.type** %.tmp5453
%.tmp5456 = getelementptr [44 x i8], [44 x i8]*@.str5455, i32 0, i32 0
%.tmp5457 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
%.tmp5458 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5457)
%.tmp5459 = load i8*, i8** %base_type_2
%.tmp5460 = load i8*, i8** %base_type_2
%.tmp5461 = load i32, i32* %tmp_id
%.tmp5462 = load i8*, i8** %index_type
%.tmp5463 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %index_info
%.tmp5464 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5463)
%.tmp5465 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5454, i8* %.tmp5456, i8* %.tmp5458, i8* %.tmp5459, i8* %.tmp5460, i32 %.tmp5461, i8* %.tmp5462, i8* %.tmp5464)
%.tmp5466 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %new_base
store %m1811$.AssignableInfo.type* %.tmp5466, %m1811$.AssignableInfo.type** %base
%.tmp5467 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5468 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5467, i32 0, i32 7
%.tmp5469 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5468
%.tmp5470 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5469, i32 0, i32 7
%.tmp5471 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5470
%.tmp5472 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5471, i32 0, i32 7
%.tmp5473 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5472
store %m286$.Node.type* %.tmp5473, %m286$.Node.type** %addr
br label %.for.start.5383
.for.end.5383:
%.tmp5474 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %base
ret %m1811$.AssignableInfo.type* %.tmp5474
}
%m1811$.StackHead.type = type {%m1932$.SYStack.type*}
define %m1811$.AssignableInfo.type* @m1811$compile_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5475 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5476 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5475, i32 0, i32 6
%.tmp5477 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5476
%.tmp5478 = icmp eq %m286$.Node.type* %.tmp5477, null
br i1 %.tmp5478, label %.if.true.5479, label %.if.false.5479
.if.true.5479:
%.tmp5481 = getelementptr [15 x i8], [15 x i8]*@.str5480, i32 0, i32 0
%.tmp5482 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5483 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5482, i32 0, i32 0
%.tmp5484 = load i8*, i8** %.tmp5483
%.tmp5485 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5486 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5485, i32 0, i32 1
%.tmp5487 = load i8*, i8** %.tmp5486
%.tmp5488 = call i32(i8*,...) @printf(i8* %.tmp5481, i8* %.tmp5484, i8* %.tmp5487)
br label %.if.end.5479
.if.false.5479:
br label %.if.end.5479
.if.end.5479:
%.tmp5489 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5490 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5489, i32 0, i32 6
%.tmp5491 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5490
%.tmp5493 = getelementptr [16 x i8], [16 x i8]*@.str5492, i32 0, i32 0
%.tmp5494 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5491, i8* %.tmp5493)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5494, %m286$.Node.type** %assignable_start
%.tmp5495 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp5496 = call %m1932$.SYStack.type*(%m286$.Node.type*) @m1932$sy_algorithm.m1932$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5495)
%operator_stack = alloca %m1932$.SYStack.type*
store %m1932$.SYStack.type* %.tmp5496, %m1932$.SYStack.type** %operator_stack
%.tmp5497 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* null, i32 1
%.tmp5498 = ptrtoint %m1811$.StackHead.type* %.tmp5497 to i32
%.tmp5499 = call i8*(i32) @malloc(i32 %.tmp5498)
%.tmp5500 = bitcast i8* %.tmp5499 to %m1811$.StackHead.type*
%stack = alloca %m1811$.StackHead.type*
store %m1811$.StackHead.type* %.tmp5500, %m1811$.StackHead.type** %stack
%.tmp5501 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5502 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5501, i32 0, i32 0
%.tmp5503 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %operator_stack
store %m1932$.SYStack.type* %.tmp5503, %m1932$.SYStack.type** %.tmp5502
%.tmp5504 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5505 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5506 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m1811$.StackHead.type*) @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.tmp5504, %m1811$.StackHead.type* %.tmp5505)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5506, %m1811$.AssignableInfo.type** %info
%.tmp5507 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5508 = icmp eq %m1811$.AssignableInfo.type* %.tmp5507, null
br i1 %.tmp5508, label %.if.true.5509, label %.if.false.5509
.if.true.5509:
%.tmp5510 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5510
br label %.if.end.5509
.if.false.5509:
br label %.if.end.5509
.if.end.5509:
%.tmp5511 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5512 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5511, i32 0, i32 6
%.tmp5513 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5512
%.tmp5515 = getelementptr [5 x i8], [5 x i8]*@.str5514, i32 0, i32 0
%.tmp5516 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5513, i8* %.tmp5515)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5516, %m286$.Node.type** %cast
%.tmp5517 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5518 = icmp ne %m286$.Node.type* %.tmp5517, null
br i1 %.tmp5518, label %.if.true.5519, label %.if.false.5519
.if.true.5519:
%.tmp5520 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5521 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5520, i32 0, i32 6
%.tmp5522 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5521
%.tmp5524 = getelementptr [5 x i8], [5 x i8]*@.str5523, i32 0, i32 0
%.tmp5525 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5522, i8* %.tmp5524)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5525, %m286$.Node.type** %cast_type
%.tmp5526 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5527 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5528 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5527, i32 0, i32 6
%.tmp5529 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5528
%.tmp5530 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5526, %m286$.Node.type* %.tmp5529)
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5530, %m1811$.Type.type** %type
%.tmp5531 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5532 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5531)
%prev_id = alloca i8*
store i8* %.tmp5532, i8** %prev_id
%.tmp5533 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5534 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5533, %m1811$.AssignableInfo.type* %.tmp5534)
%.tmp5535 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5536 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5537 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5536, i32 0, i32 3
%.tmp5538 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5537
%.tmp5539 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5535, %m1811$.Type.type* %.tmp5538)
%from_type = alloca i8*
store i8* %.tmp5539, i8** %from_type
%.tmp5540 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5541 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5542 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5540, %m1811$.Type.type* %.tmp5541)
%to_type = alloca i8*
store i8* %.tmp5542, i8** %to_type
%.tmp5544 = getelementptr [8 x i8], [8 x i8]*@.str5543, i32 0, i32 0
%cast_fn = alloca i8*
store i8* %.tmp5544, i8** %cast_fn
%.tmp5545 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5546 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5545, i32 0, i32 3
%.tmp5547 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5546
%.tmp5548 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5547, i32 0, i32 0
%.tmp5549 = load i8*, i8** %.tmp5548
%.tmp5551 = getelementptr [4 x i8], [4 x i8]*@.str5550, i32 0, i32 0
%.tmp5552 = call i32(i8*,i8*) @strcmp(i8* %.tmp5549, i8* %.tmp5551)
%.tmp5553 = icmp ne i32 %.tmp5552, 0
%.tmp5554 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5555 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5554, i32 0, i32 0
%.tmp5556 = load i8*, i8** %.tmp5555
%.tmp5558 = getelementptr [4 x i8], [4 x i8]*@.str5557, i32 0, i32 0
%.tmp5559 = call i32(i8*,i8*) @strcmp(i8* %.tmp5556, i8* %.tmp5558)
%.tmp5560 = icmp ne i32 %.tmp5559, 0
%.tmp5561 = and i1 %.tmp5553, %.tmp5560
br i1 %.tmp5561, label %.if.true.5562, label %.if.false.5562
.if.true.5562:
%.tmp5563 = load i8*, i8** %from_type
%.tmp5564 = getelementptr i8, i8* %.tmp5563, i32 0
%.tmp5565 = load i8, i8* %.tmp5564
%.tmp5566 = icmp eq i8 %.tmp5565, 105
%.tmp5567 = load i8*, i8** %to_type
%.tmp5568 = getelementptr i8, i8* %.tmp5567, i32 0
%.tmp5569 = load i8, i8* %.tmp5568
%.tmp5570 = icmp eq i8 %.tmp5569, 105
%.tmp5571 = and i1 %.tmp5566, %.tmp5570
br i1 %.tmp5571, label %.if.true.5572, label %.if.false.5572
.if.true.5572:
%from_size = alloca i32
store i32 0, i32* %from_size
%to_size = alloca i32
store i32 0, i32* %to_size
%.tmp5573 = load i8*, i8** %from_type
%.tmp5575 = getelementptr [4 x i8], [4 x i8]*@.str5574, i32 0, i32 0
%.tmp5576 = getelementptr i32, i32* %from_size, i32 0
%.tmp5577 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5573, i8* %.tmp5575, i32* %.tmp5576)
%.tmp5578 = load i8*, i8** %to_type
%.tmp5580 = getelementptr [4 x i8], [4 x i8]*@.str5579, i32 0, i32 0
%.tmp5581 = getelementptr i32, i32* %to_size, i32 0
%.tmp5582 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5578, i8* %.tmp5580, i32* %.tmp5581)
%.tmp5583 = load i32, i32* %from_size
%.tmp5584 = load i32, i32* %to_size
%.tmp5585 = icmp slt i32 %.tmp5583, %.tmp5584
br i1 %.tmp5585, label %.if.true.5586, label %.if.false.5586
.if.true.5586:
%.tmp5588 = getelementptr [5 x i8], [5 x i8]*@.str5587, i32 0, i32 0
store i8* %.tmp5588, i8** %cast_fn
br label %.if.end.5586
.if.false.5586:
%.tmp5590 = getelementptr [6 x i8], [6 x i8]*@.str5589, i32 0, i32 0
store i8* %.tmp5590, i8** %cast_fn
br label %.if.end.5586
.if.end.5586:
br label %.if.end.5572
.if.false.5572:
br label %.if.end.5572
.if.end.5572:
br label %.if.end.5562
.if.false.5562:
br label %.if.end.5562
.if.end.5562:
%.tmp5591 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5592 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5591, i32 0, i32 1
%.tmp5593 = load %m0$.File.type*, %m0$.File.type** %.tmp5592
%.tmp5595 = getelementptr [21 x i8], [21 x i8]*@.str5594, i32 0, i32 0
%.tmp5596 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5597 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5596)
%.tmp5598 = load i8*, i8** %cast_fn
%.tmp5599 = load i8*, i8** %from_type
%.tmp5600 = load i8*, i8** %prev_id
%.tmp5601 = load i8*, i8** %to_type
%.tmp5602 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5593, i8* %.tmp5595, i8* %.tmp5597, i8* %.tmp5598, i8* %.tmp5599, i8* %.tmp5600, i8* %.tmp5601)
%.tmp5603 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp5604 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5603, i32 0, i32 3
%.tmp5605 = load %m1811$.Type.type*, %m1811$.Type.type** %type
store %m1811$.Type.type* %.tmp5605, %m1811$.Type.type** %.tmp5604
br label %.if.end.5519
.if.false.5519:
br label %.if.end.5519
.if.end.5519:
%.tmp5606 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp5606
}
define %m1811$.AssignableInfo.type* @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stack = alloca %m1811$.StackHead.type*
store %m1811$.StackHead.type* %.stack.arg, %m1811$.StackHead.type** %stack
%.tmp5607 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5608 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5607, i32 0, i32 0
%.tmp5609 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5608
%.tmp5610 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5609, i32 0, i32 0
%.tmp5611 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5610
%.tmp5612 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5611, i32 0, i32 0
%.tmp5613 = load i8*, i8** %.tmp5612
%.tmp5615 = getelementptr [16 x i8], [16 x i8]*@.str5614, i32 0, i32 0
%.tmp5616 = call i32(i8*,i8*) @strcmp(i8* %.tmp5613, i8* %.tmp5615)
%.tmp5617 = icmp eq i32 %.tmp5616, 0
br i1 %.tmp5617, label %.if.true.5618, label %.if.false.5618
.if.true.5618:
%.tmp5619 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5620 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5621 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5620, i32 0, i32 0
%.tmp5622 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5621
%.tmp5623 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5622, i32 0, i32 0
%.tmp5624 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5623
%.tmp5625 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_mono_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5619, %m286$.Node.type* %.tmp5624)
ret %m1811$.AssignableInfo.type* %.tmp5625
br label %.if.end.5618
.if.false.5618:
br label %.if.end.5618
.if.end.5618:
%.tmp5626 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5627 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5626, i32 0, i32 0
%.tmp5628 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5627
%.tmp5629 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5628, i32 0, i32 0
%.tmp5630 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5629
%.tmp5631 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5630, i32 0, i32 6
%.tmp5632 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5631
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5632, %m286$.Node.type** %operator
%.tmp5633 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5634 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5633, i32 0, i32 0
%.tmp5635 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5636 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5635, i32 0, i32 0
%.tmp5637 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5636
%.tmp5638 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5637, i32 0, i32 1
%.tmp5639 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5638
store %m1932$.SYStack.type* %.tmp5639, %m1932$.SYStack.type** %.tmp5634
%.tmp5640 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5641 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5642 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m1811$.StackHead.type*) @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.tmp5640, %m1811$.StackHead.type* %.tmp5641)
%A = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5642, %m1811$.AssignableInfo.type** %A
%.tmp5643 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
%.tmp5644 = icmp eq %m1811$.AssignableInfo.type* %.tmp5643, null
br i1 %.tmp5644, label %.if.true.5645, label %.if.false.5645
.if.true.5645:
%.tmp5646 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
ret %m1811$.AssignableInfo.type* %.tmp5646
br label %.if.end.5645
.if.false.5645:
br label %.if.end.5645
.if.end.5645:
%.tmp5647 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5648 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5647, i32 0, i32 0
%.tmp5649 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5650 = getelementptr %m1811$.StackHead.type, %m1811$.StackHead.type* %.tmp5649, i32 0, i32 0
%.tmp5651 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5650
%.tmp5652 = getelementptr %m1932$.SYStack.type, %m1932$.SYStack.type* %.tmp5651, i32 0, i32 1
%.tmp5653 = load %m1932$.SYStack.type*, %m1932$.SYStack.type** %.tmp5652
store %m1932$.SYStack.type* %.tmp5653, %m1932$.SYStack.type** %.tmp5648
%.tmp5654 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5655 = load %m1811$.StackHead.type*, %m1811$.StackHead.type** %stack
%.tmp5656 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m1811$.StackHead.type*) @m1811$compile_assignable_stack.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m1811$.StackHead.typep(%m1811$.CompilerCtx.type* %.tmp5654, %m1811$.StackHead.type* %.tmp5655)
%B = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5656, %m1811$.AssignableInfo.type** %B
%.tmp5657 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %B
%.tmp5658 = icmp eq %m1811$.AssignableInfo.type* %.tmp5657, null
br i1 %.tmp5658, label %.if.true.5659, label %.if.false.5659
.if.true.5659:
%.tmp5660 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %B
ret %m1811$.AssignableInfo.type* %.tmp5660
br label %.if.end.5659
.if.false.5659:
br label %.if.end.5659
.if.end.5659:
%.tmp5661 = bitcast ptr null to %m286$.Node.type*
%.tmp5662 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5661)
%op_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5662, %m1811$.AssignableInfo.type** %op_info
%.tmp5663 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
%.tmp5664 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5663, i32 0, i32 3
%.tmp5665 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5666 = call %m1811$.Type.type*(%m286$.Node.type*) @m1811$operator_type.m1811$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5665)
store %m1811$.Type.type* %.tmp5666, %m1811$.Type.type** %.tmp5664
%.tmp5667 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5668 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp5667, %m1811$.AssignableInfo.type* %.tmp5668)
%.tmp5669 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5670 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp5669, i32 0, i32 1
%.tmp5671 = load %m0$.File.type*, %m0$.File.type** %.tmp5670
%.tmp5673 = getelementptr [19 x i8], [19 x i8]*@.str5672, i32 0, i32 0
%.tmp5674 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
%.tmp5675 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5674)
%.tmp5676 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5677 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5678 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$operator_op.cp.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp5676, %m286$.Node.type* %.tmp5677)
%.tmp5679 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5680 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
%.tmp5681 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5680, i32 0, i32 3
%.tmp5682 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5681
%.tmp5683 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp5679, %m1811$.Type.type* %.tmp5682)
%.tmp5684 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %A
%.tmp5685 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5684)
%.tmp5686 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %B
%.tmp5687 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp5686)
%.tmp5688 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5671, i8* %.tmp5673, i8* %.tmp5675, i8* %.tmp5678, i8* %.tmp5683, i8* %.tmp5685, i8* %.tmp5687)
%.tmp5689 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %op_info
ret %m1811$.AssignableInfo.type* %.tmp5689
}
define i8* @m1811$operator_op.cp.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5690 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5691 = icmp eq %m286$.Node.type* %.tmp5690, null
br i1 %.tmp5691, label %.if.true.5692, label %.if.false.5692
.if.true.5692:
%.tmp5693 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5694 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5696 = getelementptr [31 x i8], [31 x i8]*@.str5695, i32 0, i32 0
%.tmp5697 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5693, %m286$.Node.type* %.tmp5694, i8* %.tmp5696)
%.tmp5698 = call i32(i8*,...) @printf(i8* %.tmp5697)
br label %.if.end.5692
.if.false.5692:
br label %.if.end.5692
.if.end.5692:
%.tmp5699 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5700 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5699, i32 0, i32 1
%.tmp5701 = load i8*, i8** %.tmp5700
%.tmp5703 = getelementptr [2 x i8], [2 x i8]*@.str5702, i32 0, i32 0
%.tmp5704 = call i32(i8*,i8*) @strcmp(i8* %.tmp5701, i8* %.tmp5703)
%.tmp5705 = icmp eq i32 %.tmp5704, 0
br i1 %.tmp5705, label %.if.true.5706, label %.if.false.5706
.if.true.5706:
%.tmp5708 = getelementptr [4 x i8], [4 x i8]*@.str5707, i32 0, i32 0
ret i8* %.tmp5708
br label %.if.end.5706
.if.false.5706:
%.tmp5709 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5710 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5709, i32 0, i32 1
%.tmp5711 = load i8*, i8** %.tmp5710
%.tmp5713 = getelementptr [2 x i8], [2 x i8]*@.str5712, i32 0, i32 0
%.tmp5714 = call i32(i8*,i8*) @strcmp(i8* %.tmp5711, i8* %.tmp5713)
%.tmp5715 = icmp eq i32 %.tmp5714, 0
br i1 %.tmp5715, label %.if.true.5716, label %.if.false.5716
.if.true.5716:
%.tmp5718 = getelementptr [4 x i8], [4 x i8]*@.str5717, i32 0, i32 0
ret i8* %.tmp5718
br label %.if.end.5716
.if.false.5716:
%.tmp5719 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5720 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5719, i32 0, i32 1
%.tmp5721 = load i8*, i8** %.tmp5720
%.tmp5723 = getelementptr [2 x i8], [2 x i8]*@.str5722, i32 0, i32 0
%.tmp5724 = call i32(i8*,i8*) @strcmp(i8* %.tmp5721, i8* %.tmp5723)
%.tmp5725 = icmp eq i32 %.tmp5724, 0
br i1 %.tmp5725, label %.if.true.5726, label %.if.false.5726
.if.true.5726:
%.tmp5728 = getelementptr [4 x i8], [4 x i8]*@.str5727, i32 0, i32 0
ret i8* %.tmp5728
br label %.if.end.5726
.if.false.5726:
%.tmp5729 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5730 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5729, i32 0, i32 1
%.tmp5731 = load i8*, i8** %.tmp5730
%.tmp5733 = getelementptr [2 x i8], [2 x i8]*@.str5732, i32 0, i32 0
%.tmp5734 = call i32(i8*,i8*) @strcmp(i8* %.tmp5731, i8* %.tmp5733)
%.tmp5735 = icmp eq i32 %.tmp5734, 0
br i1 %.tmp5735, label %.if.true.5736, label %.if.false.5736
.if.true.5736:
%.tmp5738 = getelementptr [5 x i8], [5 x i8]*@.str5737, i32 0, i32 0
ret i8* %.tmp5738
br label %.if.end.5736
.if.false.5736:
%.tmp5739 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5740 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5739, i32 0, i32 1
%.tmp5741 = load i8*, i8** %.tmp5740
%.tmp5743 = getelementptr [3 x i8], [3 x i8]*@.str5742, i32 0, i32 0
%.tmp5744 = call i32(i8*,i8*) @strcmp(i8* %.tmp5741, i8* %.tmp5743)
%.tmp5745 = icmp eq i32 %.tmp5744, 0
br i1 %.tmp5745, label %.if.true.5746, label %.if.false.5746
.if.true.5746:
%.tmp5748 = getelementptr [8 x i8], [8 x i8]*@.str5747, i32 0, i32 0
ret i8* %.tmp5748
br label %.if.end.5746
.if.false.5746:
%.tmp5749 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5750 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5749, i32 0, i32 1
%.tmp5751 = load i8*, i8** %.tmp5750
%.tmp5753 = getelementptr [3 x i8], [3 x i8]*@.str5752, i32 0, i32 0
%.tmp5754 = call i32(i8*,i8*) @strcmp(i8* %.tmp5751, i8* %.tmp5753)
%.tmp5755 = icmp eq i32 %.tmp5754, 0
br i1 %.tmp5755, label %.if.true.5756, label %.if.false.5756
.if.true.5756:
%.tmp5758 = getelementptr [8 x i8], [8 x i8]*@.str5757, i32 0, i32 0
ret i8* %.tmp5758
br label %.if.end.5756
.if.false.5756:
%.tmp5759 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5760 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5759, i32 0, i32 1
%.tmp5761 = load i8*, i8** %.tmp5760
%.tmp5763 = getelementptr [2 x i8], [2 x i8]*@.str5762, i32 0, i32 0
%.tmp5764 = call i32(i8*,i8*) @strcmp(i8* %.tmp5761, i8* %.tmp5763)
%.tmp5765 = icmp eq i32 %.tmp5764, 0
br i1 %.tmp5765, label %.if.true.5766, label %.if.false.5766
.if.true.5766:
%.tmp5768 = getelementptr [9 x i8], [9 x i8]*@.str5767, i32 0, i32 0
ret i8* %.tmp5768
br label %.if.end.5766
.if.false.5766:
%.tmp5769 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5770 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5769, i32 0, i32 1
%.tmp5771 = load i8*, i8** %.tmp5770
%.tmp5773 = getelementptr [2 x i8], [2 x i8]*@.str5772, i32 0, i32 0
%.tmp5774 = call i32(i8*,i8*) @strcmp(i8* %.tmp5771, i8* %.tmp5773)
%.tmp5775 = icmp eq i32 %.tmp5774, 0
br i1 %.tmp5775, label %.if.true.5776, label %.if.false.5776
.if.true.5776:
%.tmp5778 = getelementptr [9 x i8], [9 x i8]*@.str5777, i32 0, i32 0
ret i8* %.tmp5778
br label %.if.end.5776
.if.false.5776:
%.tmp5779 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5780 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5779, i32 0, i32 1
%.tmp5781 = load i8*, i8** %.tmp5780
%.tmp5783 = getelementptr [2 x i8], [2 x i8]*@.str5782, i32 0, i32 0
%.tmp5784 = call i32(i8*,i8*) @strcmp(i8* %.tmp5781, i8* %.tmp5783)
%.tmp5785 = icmp eq i32 %.tmp5784, 0
br i1 %.tmp5785, label %.if.true.5786, label %.if.false.5786
.if.true.5786:
%.tmp5788 = getelementptr [4 x i8], [4 x i8]*@.str5787, i32 0, i32 0
ret i8* %.tmp5788
br label %.if.end.5786
.if.false.5786:
%.tmp5789 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5790 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5789, i32 0, i32 1
%.tmp5791 = load i8*, i8** %.tmp5790
%.tmp5793 = getelementptr [2 x i8], [2 x i8]*@.str5792, i32 0, i32 0
%.tmp5794 = call i32(i8*,i8*) @strcmp(i8* %.tmp5791, i8* %.tmp5793)
%.tmp5795 = icmp eq i32 %.tmp5794, 0
br i1 %.tmp5795, label %.if.true.5796, label %.if.false.5796
.if.true.5796:
%.tmp5798 = getelementptr [3 x i8], [3 x i8]*@.str5797, i32 0, i32 0
ret i8* %.tmp5798
br label %.if.end.5796
.if.false.5796:
%.tmp5799 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5800 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5799, i32 0, i32 1
%.tmp5801 = load i8*, i8** %.tmp5800
%.tmp5803 = getelementptr [3 x i8], [3 x i8]*@.str5802, i32 0, i32 0
%.tmp5804 = call i32(i8*,i8*) @strcmp(i8* %.tmp5801, i8* %.tmp5803)
%.tmp5805 = icmp eq i32 %.tmp5804, 0
br i1 %.tmp5805, label %.if.true.5806, label %.if.false.5806
.if.true.5806:
%.tmp5808 = getelementptr [9 x i8], [9 x i8]*@.str5807, i32 0, i32 0
ret i8* %.tmp5808
br label %.if.end.5806
.if.false.5806:
%.tmp5809 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5810 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5809, i32 0, i32 1
%.tmp5811 = load i8*, i8** %.tmp5810
%.tmp5813 = getelementptr [3 x i8], [3 x i8]*@.str5812, i32 0, i32 0
%.tmp5814 = call i32(i8*,i8*) @strcmp(i8* %.tmp5811, i8* %.tmp5813)
%.tmp5815 = icmp eq i32 %.tmp5814, 0
br i1 %.tmp5815, label %.if.true.5816, label %.if.false.5816
.if.true.5816:
%.tmp5818 = getelementptr [9 x i8], [9 x i8]*@.str5817, i32 0, i32 0
ret i8* %.tmp5818
br label %.if.end.5816
.if.false.5816:
%.tmp5819 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5820 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5822 = getelementptr [30 x i8], [30 x i8]*@.str5821, i32 0, i32 0
%.tmp5823 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5819, %m286$.Node.type* %.tmp5820, i8* %.tmp5822)
%.tmp5824 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5825 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5824, i32 0, i32 1
%.tmp5826 = load i8*, i8** %.tmp5825
%.tmp5827 = call i32(i8*,...) @printf(i8* %.tmp5823, i8* %.tmp5826)
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
br label %.if.end.5756
.if.end.5756:
br label %.if.end.5746
.if.end.5746:
br label %.if.end.5736
.if.end.5736:
br label %.if.end.5726
.if.end.5726:
br label %.if.end.5716
.if.end.5716:
br label %.if.end.5706
.if.end.5706:
%.tmp5829 = getelementptr [4 x i8], [4 x i8]*@.str5828, i32 0, i32 0
ret i8* %.tmp5829
}
define %m1811$.Type.type* @m1811$operator_type.m1811$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5830 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp5830, %m1811$.Type.type** %type
%.tmp5831 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5832 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5831, i32 0, i32 1
%.tmp5833 = load i8*, i8** %.tmp5832
%.tmp5835 = getelementptr [3 x i8], [3 x i8]*@.str5834, i32 0, i32 0
%.tmp5836 = call i32(i8*,i8*) @strcmp(i8* %.tmp5833, i8* %.tmp5835)
%.tmp5837 = icmp eq i32 %.tmp5836, 0
%.tmp5838 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5839 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5838, i32 0, i32 1
%.tmp5840 = load i8*, i8** %.tmp5839
%.tmp5842 = getelementptr [3 x i8], [3 x i8]*@.str5841, i32 0, i32 0
%.tmp5843 = call i32(i8*,i8*) @strcmp(i8* %.tmp5840, i8* %.tmp5842)
%.tmp5844 = icmp eq i32 %.tmp5843, 0
%.tmp5845 = or i1 %.tmp5837, %.tmp5844
%.tmp5846 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5847 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5846, i32 0, i32 1
%.tmp5848 = load i8*, i8** %.tmp5847
%.tmp5850 = getelementptr [2 x i8], [2 x i8]*@.str5849, i32 0, i32 0
%.tmp5851 = call i32(i8*,i8*) @strcmp(i8* %.tmp5848, i8* %.tmp5850)
%.tmp5852 = icmp eq i32 %.tmp5851, 0
%.tmp5853 = or i1 %.tmp5845, %.tmp5852
%.tmp5854 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5855 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5854, i32 0, i32 1
%.tmp5856 = load i8*, i8** %.tmp5855
%.tmp5858 = getelementptr [2 x i8], [2 x i8]*@.str5857, i32 0, i32 0
%.tmp5859 = call i32(i8*,i8*) @strcmp(i8* %.tmp5856, i8* %.tmp5858)
%.tmp5860 = icmp eq i32 %.tmp5859, 0
%.tmp5861 = or i1 %.tmp5853, %.tmp5860
%.tmp5862 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5863 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5862, i32 0, i32 1
%.tmp5864 = load i8*, i8** %.tmp5863
%.tmp5866 = getelementptr [2 x i8], [2 x i8]*@.str5865, i32 0, i32 0
%.tmp5867 = call i32(i8*,i8*) @strcmp(i8* %.tmp5864, i8* %.tmp5866)
%.tmp5868 = icmp eq i32 %.tmp5867, 0
%.tmp5869 = or i1 %.tmp5861, %.tmp5868
%.tmp5870 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5871 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5870, i32 0, i32 1
%.tmp5872 = load i8*, i8** %.tmp5871
%.tmp5874 = getelementptr [2 x i8], [2 x i8]*@.str5873, i32 0, i32 0
%.tmp5875 = call i32(i8*,i8*) @strcmp(i8* %.tmp5872, i8* %.tmp5874)
%.tmp5876 = icmp eq i32 %.tmp5875, 0
%.tmp5877 = or i1 %.tmp5869, %.tmp5876
%.tmp5878 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5879 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5878, i32 0, i32 1
%.tmp5880 = load i8*, i8** %.tmp5879
%.tmp5882 = getelementptr [3 x i8], [3 x i8]*@.str5881, i32 0, i32 0
%.tmp5883 = call i32(i8*,i8*) @strcmp(i8* %.tmp5880, i8* %.tmp5882)
%.tmp5884 = icmp eq i32 %.tmp5883, 0
%.tmp5885 = or i1 %.tmp5877, %.tmp5884
%.tmp5886 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5886, i32 0, i32 1
%.tmp5888 = load i8*, i8** %.tmp5887
%.tmp5890 = getelementptr [3 x i8], [3 x i8]*@.str5889, i32 0, i32 0
%.tmp5891 = call i32(i8*,i8*) @strcmp(i8* %.tmp5888, i8* %.tmp5890)
%.tmp5892 = icmp eq i32 %.tmp5891, 0
%.tmp5893 = or i1 %.tmp5885, %.tmp5892
br i1 %.tmp5893, label %.if.true.5894, label %.if.false.5894
.if.true.5894:
%.tmp5895 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5896 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5895, i32 0, i32 0
%.tmp5898 = getelementptr [5 x i8], [5 x i8]*@.str5897, i32 0, i32 0
store i8* %.tmp5898, i8** %.tmp5896
br label %.if.end.5894
.if.false.5894:
%.tmp5899 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp5900 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5899, i32 0, i32 0
%.tmp5902 = getelementptr [4 x i8], [4 x i8]*@.str5901, i32 0, i32 0
store i8* %.tmp5902, i8** %.tmp5900
br label %.if.end.5894
.if.end.5894:
%.tmp5903 = load %m1811$.Type.type*, %m1811$.Type.type** %type
ret %m1811$.Type.type* %.tmp5903
}
define %m1811$.AssignableInfo.type* @m1811$compile_mono_assignable.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5904 = bitcast ptr null to %m1811$.AssignableInfo.type*
%assignable_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp5904, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5905 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5905, %m286$.Node.type** %mono
%err_buf = alloca i8*
store i8* null, i8** %err_buf
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp5906 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5907 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5906, i32 0, i32 6
%.tmp5908 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5907
%.tmp5909 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5908, i32 0, i32 0
%.tmp5910 = load i8*, i8** %.tmp5909
%.tmp5912 = getelementptr [7 x i8], [7 x i8]*@.str5911, i32 0, i32 0
%.tmp5913 = call i32(i8*,i8*) @strcmp(i8* %.tmp5910, i8* %.tmp5912)
%.tmp5914 = icmp eq i32 %.tmp5913, 0
br i1 %.tmp5914, label %.if.true.5915, label %.if.false.5915
.if.true.5915:
%.tmp5916 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5917 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5916)
store %m1811$.AssignableInfo.type* %.tmp5917, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5918 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5919 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5918, i32 0, i32 3
%.tmp5920 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp5920, %m1811$.Type.type** %.tmp5919
%.tmp5921 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5922 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5921, i32 0, i32 3
%.tmp5923 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5922
%.tmp5924 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5923, i32 0, i32 0
%.tmp5926 = getelementptr [4 x i8], [4 x i8]*@.str5925, i32 0, i32 0
store i8* %.tmp5926, i8** %.tmp5924
%.tmp5927 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5928 = load i8, i8* @SCOPE_CONST
%.tmp5929 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5930 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5929, i32 0, i32 6
%.tmp5931 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5930
%.tmp5932 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5931, i32 0, i32 1
%.tmp5933 = load i8*, i8** %.tmp5932
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp5927, i8 %.tmp5928, i8* %.tmp5933)
br label %.if.end.5915
.if.false.5915:
%.tmp5934 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5935 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5934, i32 0, i32 6
%.tmp5936 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5935
%.tmp5937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5936, i32 0, i32 0
%.tmp5938 = load i8*, i8** %.tmp5937
%.tmp5940 = getelementptr [5 x i8], [5 x i8]*@.str5939, i32 0, i32 0
%.tmp5941 = call i32(i8*,i8*) @strcmp(i8* %.tmp5938, i8* %.tmp5940)
%.tmp5942 = icmp eq i32 %.tmp5941, 0
br i1 %.tmp5942, label %.if.true.5943, label %.if.false.5943
.if.true.5943:
%.tmp5944 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5945 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5944, i32 0, i32 6
%.tmp5946 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5945
%.tmp5947 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5946, i32 0, i32 1
%.tmp5948 = load i8*, i8** %.tmp5947
%.tmp5950 = getelementptr [5 x i8], [5 x i8]*@.str5949, i32 0, i32 0
%.tmp5951 = call i32(i8*,i8*) @strcmp(i8* %.tmp5948, i8* %.tmp5950)
%.tmp5952 = icmp ne i32 %.tmp5951, 0
br i1 %.tmp5952, label %.if.true.5953, label %.if.false.5953
.if.true.5953:
%.tmp5954 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp5955 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5957 = getelementptr [42 x i8], [42 x i8]*@.str5956, i32 0, i32 0
%.tmp5958 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp5954, %m286$.Node.type* %.tmp5955, i8* %.tmp5957)
%.tmp5959 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5960 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5959, i32 0, i32 6
%.tmp5961 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5960
%.tmp5962 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5961, i32 0, i32 1
%.tmp5963 = load i8*, i8** %.tmp5962
%.tmp5964 = call i32(i8*,...) @printf(i8* %.tmp5958, i8* %.tmp5963)
%.tmp5965 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp5965
br label %.if.end.5953
.if.false.5953:
br label %.if.end.5953
.if.end.5953:
%.tmp5966 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5967 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5966)
store %m1811$.AssignableInfo.type* %.tmp5967, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5968 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5969 = load i8, i8* @SCOPE_CONST
%.tmp5971 = getelementptr [5 x i8], [5 x i8]*@.str5970, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp5968, i8 %.tmp5969, i8* %.tmp5971)
%.tmp5972 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5973 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5972, i32 0, i32 3
%.tmp5974 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp5974, %m1811$.Type.type** %.tmp5973
%.tmp5975 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5976 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp5975, i32 0, i32 3
%.tmp5977 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp5976
%.tmp5978 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp5977, i32 0, i32 0
%.tmp5980 = getelementptr [8 x i8], [8 x i8]*@.str5979, i32 0, i32 0
store i8* %.tmp5980, i8** %.tmp5978
br label %.if.end.5943
.if.false.5943:
%.tmp5981 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5982 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5981, i32 0, i32 6
%.tmp5983 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5982
%.tmp5984 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5983, i32 0, i32 0
%.tmp5985 = load i8*, i8** %.tmp5984
%.tmp5987 = getelementptr [17 x i8], [17 x i8]*@.str5986, i32 0, i32 0
%.tmp5988 = call i32(i8*,i8*) @strcmp(i8* %.tmp5985, i8* %.tmp5987)
%.tmp5989 = icmp eq i32 %.tmp5988, 0
br i1 %.tmp5989, label %.if.true.5990, label %.if.false.5990
.if.true.5990:
%.tmp5991 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5992 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5991)
store %m1811$.AssignableInfo.type* %.tmp5992, %m1811$.AssignableInfo.type** %assignable_info
%.tmp5993 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5994 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5993, i32 0, i32 6
%.tmp5995 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5994
%.tmp5996 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5995, i32 0, i32 6
%.tmp5997 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5996
%.tmp5999 = getelementptr [12 x i8], [12 x i8]*@.str5998, i32 0, i32 0
%.tmp6000 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5997, i8* %.tmp5999)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6000, %m286$.Node.type** %dest
%.tmp6001 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6002 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6003 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_addr.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6001, %m286$.Node.type* %.tmp6002)
%var_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6003, %m1811$.AssignableInfo.type** %var_info
%.tmp6004 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6005 = icmp eq %m1811$.AssignableInfo.type* %.tmp6004, null
br i1 %.tmp6005, label %.if.true.6006, label %.if.false.6006
.if.true.6006:
%.tmp6007 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
ret %m1811$.AssignableInfo.type* %.tmp6007
br label %.if.end.6006
.if.false.6006:
br label %.if.end.6006
.if.end.6006:
%.tmp6008 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6009 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6010 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6009, i32 0, i32 3
%.tmp6011 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6010
%.tmp6012 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6008, %m1811$.Type.type* %.tmp6011)
%var_type_repr = alloca i8*
store i8* %.tmp6012, i8** %var_type_repr
%.tmp6013 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6014 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp6013, %m1811$.AssignableInfo.type* %.tmp6014)
%.tmp6015 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6016 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6015, i32 0, i32 3
%.tmp6017 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6018 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6017, i32 0, i32 3
%.tmp6019 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6018
store %m1811$.Type.type* %.tmp6019, %m1811$.Type.type** %.tmp6016
%.tmp6021 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6022 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6021, i32 0, i32 6
%.tmp6023 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6022
%.tmp6024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6023, i32 0, i32 6
%.tmp6025 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6024
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6025, %m286$.Node.type** %ptr
br label %.for.start.6020
.for.start.6020:
%.tmp6026 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6027 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6028 = icmp ne %m286$.Node.type* %.tmp6026, %.tmp6027
br i1 %.tmp6028, label %.for.continue.6020, label %.for.end.6020
.for.continue.6020:
%.tmp6029 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6029, %m1811$.Type.type** %type
%.tmp6030 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6031 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6030, i32 0, i32 3
%.tmp6032 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6033 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6032, i32 0, i32 3
%.tmp6034 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6033
store %m1811$.Type.type* %.tmp6034, %m1811$.Type.type** %.tmp6031
%.tmp6035 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6036 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6035, i32 0, i32 0
%.tmp6038 = getelementptr [4 x i8], [4 x i8]*@.str6037, i32 0, i32 0
store i8* %.tmp6038, i8** %.tmp6036
%.tmp6039 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6040 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6039, i32 0, i32 3
%.tmp6041 = load %m1811$.Type.type*, %m1811$.Type.type** %type
store %m1811$.Type.type* %.tmp6041, %m1811$.Type.type** %.tmp6040
%.tmp6042 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6043 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6042, i32 0, i32 7
%.tmp6044 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6043
store %m286$.Node.type* %.tmp6044, %m286$.Node.type** %ptr
br label %.for.start.6020
.for.end.6020:
%.tmp6045 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6046 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6045, i32 0, i32 6
%.tmp6047 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6046
%.tmp6048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6047, i32 0, i32 6
%.tmp6049 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6048
%.tmp6050 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp6051 = icmp ne %m286$.Node.type* %.tmp6049, %.tmp6050
br i1 %.tmp6051, label %.if.true.6052, label %.if.false.6052
.if.true.6052:
%.tmp6053 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6054 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6053, i32 0, i32 1
%.tmp6055 = load %m0$.File.type*, %m0$.File.type** %.tmp6054
%.tmp6057 = getelementptr [38 x i8], [38 x i8]*@.str6056, i32 0, i32 0
%.tmp6058 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6059 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6058)
%.tmp6060 = load i8*, i8** %var_type_repr
%.tmp6061 = load i8*, i8** %var_type_repr
%.tmp6062 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6063 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6062)
%.tmp6064 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6055, i8* %.tmp6057, i8* %.tmp6059, i8* %.tmp6060, i8* %.tmp6061, i8* %.tmp6063)
br label %.if.end.6052
.if.false.6052:
%.tmp6065 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6066 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6065, i32 0, i32 1
%.tmp6067 = load %m0$.File.type*, %m0$.File.type** %.tmp6066
%.tmp6069 = getelementptr [22 x i8], [22 x i8]*@.str6068, i32 0, i32 0
%.tmp6070 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6071 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6070)
%.tmp6072 = load i8*, i8** %var_type_repr
%.tmp6073 = load i8*, i8** %var_type_repr
%.tmp6074 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %var_info
%.tmp6075 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6074)
%.tmp6076 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6067, i8* %.tmp6069, i8* %.tmp6071, i8* %.tmp6072, i8* %.tmp6073, i8* %.tmp6075)
br label %.if.end.6052
.if.end.6052:
br label %.if.end.5990
.if.false.5990:
%.tmp6077 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6078 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6077, i32 0, i32 6
%.tmp6079 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6078
%.tmp6080 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6079, i32 0, i32 0
%.tmp6081 = load i8*, i8** %.tmp6080
%.tmp6083 = getelementptr [8 x i8], [8 x i8]*@.str6082, i32 0, i32 0
%.tmp6084 = call i32(i8*,i8*) @strcmp(i8* %.tmp6081, i8* %.tmp6083)
%.tmp6085 = icmp eq i32 %.tmp6084, 0
br i1 %.tmp6085, label %.if.true.6086, label %.if.false.6086
.if.true.6086:
%.tmp6087 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6088 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6087)
store %m1811$.AssignableInfo.type* %.tmp6088, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6089 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6090 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6089, i32 0, i32 3
%.tmp6091 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6091, %m1811$.Type.type** %.tmp6090
%.tmp6092 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6093 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6092, i32 0, i32 3
%.tmp6094 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6093
%.tmp6095 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6094, i32 0, i32 0
%.tmp6097 = getelementptr [5 x i8], [5 x i8]*@.str6096, i32 0, i32 0
store i8* %.tmp6097, i8** %.tmp6095
%.tmp6098 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6099 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6098, i32 0, i32 6
%.tmp6100 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6099
%.tmp6101 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6100, i32 0, i32 6
%.tmp6102 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6101
%.tmp6103 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6102, i32 0, i32 1
%.tmp6104 = load i8*, i8** %.tmp6103
%.tmp6106 = getelementptr [6 x i8], [6 x i8]*@.str6105, i32 0, i32 0
%.tmp6107 = call i32(i8*,i8*) @strcmp(i8* %.tmp6104, i8* %.tmp6106)
%.tmp6108 = icmp eq i32 %.tmp6107, 0
br i1 %.tmp6108, label %.if.true.6109, label %.if.false.6109
.if.true.6109:
%.tmp6110 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6111 = load i8, i8* @SCOPE_CONST
%.tmp6113 = getelementptr [2 x i8], [2 x i8]*@.str6112, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6110, i8 %.tmp6111, i8* %.tmp6113)
br label %.if.end.6109
.if.false.6109:
%.tmp6114 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6115 = load i8, i8* @SCOPE_CONST
%.tmp6117 = getelementptr [2 x i8], [2 x i8]*@.str6116, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6114, i8 %.tmp6115, i8* %.tmp6117)
br label %.if.end.6109
.if.end.6109:
br label %.if.end.6086
.if.false.6086:
%.tmp6118 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6119 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6118, i32 0, i32 6
%.tmp6120 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6119
%.tmp6121 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6120, i32 0, i32 0
%.tmp6122 = load i8*, i8** %.tmp6121
%.tmp6124 = getelementptr [8 x i8], [8 x i8]*@.str6123, i32 0, i32 0
%.tmp6125 = call i32(i8*,i8*) @strcmp(i8* %.tmp6122, i8* %.tmp6124)
%.tmp6126 = icmp eq i32 %.tmp6125, 0
br i1 %.tmp6126, label %.if.true.6127, label %.if.false.6127
.if.true.6127:
%.tmp6128 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6129 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6130 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6129, i32 0, i32 6
%.tmp6131 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6130
%.tmp6132 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6131, i32 0, i32 6
%.tmp6133 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6132
%.tmp6134 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$compile_fn_call.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6128, %m286$.Node.type* %.tmp6133)
store %m1811$.AssignableInfo.type* %.tmp6134, %m1811$.AssignableInfo.type** %assignable_info
br label %.if.end.6127
.if.false.6127:
%.tmp6135 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6136 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6135, i32 0, i32 6
%.tmp6137 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6136
%.tmp6138 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6137, i32 0, i32 0
%.tmp6139 = load i8*, i8** %.tmp6138
%.tmp6141 = getelementptr [7 x i8], [7 x i8]*@.str6140, i32 0, i32 0
%.tmp6142 = call i32(i8*,i8*) @strcmp(i8* %.tmp6139, i8* %.tmp6141)
%.tmp6143 = icmp eq i32 %.tmp6142, 0
br i1 %.tmp6143, label %.if.true.6144, label %.if.false.6144
.if.true.6144:
%.tmp6145 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6146 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6147 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6146, i32 0, i32 6
%.tmp6148 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6147
%.tmp6149 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6148, i32 0, i32 1
%.tmp6150 = load i8*, i8** %.tmp6149
%.tmp6151 = call %m1811$.AssignableInfo.type*(%m1811$.CompilerCtx.type*,i8*) @m1811$define_string.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp6145, i8* %.tmp6150)
%string_info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6151, %m1811$.AssignableInfo.type** %string_info
%.tmp6152 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6153 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6152)
store %m1811$.AssignableInfo.type* %.tmp6153, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6154 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6155 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
call void(%m1811$.CompilerCtx.type*,%m1811$.AssignableInfo.type*) @m1811$set_assignable_tmp_id.v.m1811$.CompilerCtx.typep.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp6154, %m1811$.AssignableInfo.type* %.tmp6155)
%.tmp6156 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6157 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %string_info
%.tmp6158 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6157, i32 0, i32 3
%.tmp6159 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6158
%.tmp6160 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6156, %m1811$.Type.type* %.tmp6159)
%str_tr = alloca i8*
store i8* %.tmp6160, i8** %str_tr
%.tmp6161 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6162 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6161, i32 0, i32 1
%.tmp6163 = load %m0$.File.type*, %m0$.File.type** %.tmp6162
%.tmp6165 = getelementptr [44 x i8], [44 x i8]*@.str6164, i32 0, i32 0
%.tmp6166 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6167 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6166)
%.tmp6168 = load i8*, i8** %str_tr
%.tmp6169 = load i8*, i8** %str_tr
%.tmp6170 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %string_info
%.tmp6171 = call i8*(%m1811$.AssignableInfo.type*) @m1811$repr_assignable_id.cp.m1811$.AssignableInfo.typep(%m1811$.AssignableInfo.type* %.tmp6170)
%.tmp6172 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6163, i8* %.tmp6165, i8* %.tmp6167, i8* %.tmp6168, i8* %.tmp6169, i8* %.tmp6171)
%.tmp6173 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6174 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6173, i32 0, i32 3
%.tmp6175 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6175, %m1811$.Type.type** %.tmp6174
%.tmp6176 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6177 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6176, i32 0, i32 3
%.tmp6178 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6177
%.tmp6179 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6178, i32 0, i32 0
%.tmp6181 = getelementptr [4 x i8], [4 x i8]*@.str6180, i32 0, i32 0
store i8* %.tmp6181, i8** %.tmp6179
%.tmp6182 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6183 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6182, i32 0, i32 3
%.tmp6184 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6183
%.tmp6185 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6184, i32 0, i32 3
%.tmp6186 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6186, %m1811$.Type.type** %.tmp6185
%.tmp6187 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6188 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6187, i32 0, i32 3
%.tmp6189 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6188
%.tmp6190 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6189, i32 0, i32 3
%.tmp6191 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6190
%.tmp6192 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6191, i32 0, i32 0
%.tmp6194 = getelementptr [4 x i8], [4 x i8]*@.str6193, i32 0, i32 0
store i8* %.tmp6194, i8** %.tmp6192
br label %.if.end.6144
.if.false.6144:
%.tmp6195 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6196 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6195, i32 0, i32 6
%.tmp6197 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6196
%.tmp6198 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6197, i32 0, i32 0
%.tmp6199 = load i8*, i8** %.tmp6198
%.tmp6201 = getelementptr [4 x i8], [4 x i8]*@.str6200, i32 0, i32 0
%.tmp6202 = call i32(i8*,i8*) @strcmp(i8* %.tmp6199, i8* %.tmp6201)
%.tmp6203 = icmp eq i32 %.tmp6202, 0
br i1 %.tmp6203, label %.if.true.6204, label %.if.false.6204
.if.true.6204:
%.tmp6205 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6206 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6205)
store %m1811$.AssignableInfo.type* %.tmp6206, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6207 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6208 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6207, i32 0, i32 6
%.tmp6209 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6208
%.tmp6210 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6209, i32 0, i32 1
%.tmp6211 = load i8*, i8** %.tmp6210
%.tmp6212 = call i32(i8*) @strlen(i8* %.tmp6211)
%chr_len = alloca i32
store i32 %.tmp6212, i32* %chr_len
%.tmp6213 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6214 = load i8, i8* @SCOPE_CONST
%.tmp6216 = getelementptr [2 x i8], [2 x i8]*@.str6215, i32 0, i32 0
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6213, i8 %.tmp6214, i8* %.tmp6216)
%.tmp6217 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6218 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6217, i32 0, i32 0
%.tmp6219 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6220 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6219, i32 0, i32 6
%.tmp6221 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6220
%.tmp6222 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6221, i32 0, i32 1
%.tmp6223 = load i8*, i8** %.tmp6222
%.tmp6224 = call i8*(i8*) @m2157$chr_to_llvm.cp.cp(i8* %.tmp6223)
store i8* %.tmp6224, i8** %.tmp6218
%.tmp6225 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6226 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6225, i32 0, i32 0
%.tmp6227 = load i8*, i8** %.tmp6226
%.tmp6228 = icmp eq i8* %.tmp6227, null
br i1 %.tmp6228, label %.if.true.6229, label %.if.false.6229
.if.true.6229:
%.tmp6230 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp6232 = getelementptr [22 x i8], [22 x i8]*@.str6231, i32 0, i32 0
%.tmp6233 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6234 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6233, i32 0, i32 6
%.tmp6235 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6234
%.tmp6236 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6235, i32 0, i32 1
%.tmp6237 = load i8*, i8** %.tmp6236
%.tmp6238 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6230, i8* %.tmp6232, i8* %.tmp6237)
%.tmp6239 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6239
br label %.if.end.6229
.if.false.6229:
br label %.if.end.6229
.if.end.6229:
%.tmp6240 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6241 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6240, i32 0, i32 3
%.tmp6242 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6242, %m1811$.Type.type** %.tmp6241
%.tmp6243 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6244 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6243, i32 0, i32 3
%.tmp6245 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6244
%.tmp6246 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6245, i32 0, i32 0
%.tmp6248 = getelementptr [4 x i8], [4 x i8]*@.str6247, i32 0, i32 0
store i8* %.tmp6248, i8** %.tmp6246
br label %.if.end.6204
.if.false.6204:
%.tmp6249 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6250 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6252 = getelementptr [40 x i8], [40 x i8]*@.str6251, i32 0, i32 0
%.tmp6253 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp6249, %m286$.Node.type* %.tmp6250, i8* %.tmp6252)
%.tmp6254 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6255 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6254, i32 0, i32 6
%.tmp6256 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6255
%.tmp6257 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6256, i32 0, i32 0
%.tmp6258 = load i8*, i8** %.tmp6257
%.tmp6259 = call i32(i8*,...) @printf(i8* %.tmp6253, i8* %.tmp6258)
%.tmp6260 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6260
br label %.if.end.6204
.if.end.6204:
br label %.if.end.6144
.if.end.6144:
br label %.if.end.6127
.if.end.6127:
br label %.if.end.6086
.if.end.6086:
br label %.if.end.5990
.if.end.5990:
br label %.if.end.5943
.if.end.5943:
br label %.if.end.5915
.if.end.5915:
%.tmp6261 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6262 = icmp eq %m1811$.AssignableInfo.type* %.tmp6261, null
br i1 %.tmp6262, label %.if.true.6263, label %.if.false.6263
.if.true.6263:
%.tmp6264 = bitcast ptr null to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6264
br label %.if.end.6263
.if.false.6263:
br label %.if.end.6263
.if.end.6263:
%.tmp6265 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6266 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6265, i32 0, i32 4
%.tmp6267 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6268 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6267, i32 0, i32 3
%.tmp6269 = load i32, i32* %.tmp6268
store i32 %.tmp6269, i32* %.tmp6266
%.tmp6270 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6271 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6270, i32 0, i32 5
%.tmp6272 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6273 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6272, i32 0, i32 4
%.tmp6274 = load i32, i32* %.tmp6273
store i32 %.tmp6274, i32* %.tmp6271
%.tmp6275 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %assignable_info
%.tmp6276 = bitcast %m1811$.AssignableInfo.type* %.tmp6275 to %m1811$.AssignableInfo.type*
ret %m1811$.AssignableInfo.type* %.tmp6276
}
define i8* @m1811$type_abbr.cp.m1811$.Type.typep(%m1811$.Type.type* %.type.arg) {
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.type.arg, %m1811$.Type.type** %type
%.tmp6277 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6278 = icmp ne %m1811$.Type.type* %.tmp6277, null
%.tmp6280 = getelementptr [22 x i8], [22 x i8]*@.str6279, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6278, i8* %.tmp6280)
%.tmp6281 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6282 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6281, i32 0, i32 0
%.tmp6283 = load i8*, i8** %.tmp6282
%.tmp6284 = icmp ne i8* %.tmp6283, null
%.tmp6286 = getelementptr [59 x i8], [59 x i8]*@.str6285, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6284, i8* %.tmp6286)
%.tmp6287 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6288 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6287, i32 0, i32 0
%.tmp6289 = load i8*, i8** %.tmp6288
%.tmp6291 = getelementptr [4 x i8], [4 x i8]*@.str6290, i32 0, i32 0
%.tmp6292 = call i32(i8*,i8*) @strcmp(i8* %.tmp6289, i8* %.tmp6291)
%.tmp6293 = icmp eq i32 %.tmp6292, 0
br i1 %.tmp6293, label %.if.true.6294, label %.if.false.6294
.if.true.6294:
%.tmp6296 = getelementptr [2 x i8], [2 x i8]*@.str6295, i32 0, i32 0
ret i8* %.tmp6296
br label %.if.end.6294
.if.false.6294:
%.tmp6297 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6298 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6297, i32 0, i32 0
%.tmp6299 = load i8*, i8** %.tmp6298
%.tmp6301 = getelementptr [5 x i8], [5 x i8]*@.str6300, i32 0, i32 0
%.tmp6302 = call i32(i8*,i8*) @strcmp(i8* %.tmp6299, i8* %.tmp6301)
%.tmp6303 = icmp eq i32 %.tmp6302, 0
br i1 %.tmp6303, label %.if.true.6304, label %.if.false.6304
.if.true.6304:
%.tmp6306 = getelementptr [2 x i8], [2 x i8]*@.str6305, i32 0, i32 0
ret i8* %.tmp6306
br label %.if.end.6304
.if.false.6304:
%.tmp6307 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6308 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6307, i32 0, i32 0
%.tmp6309 = load i8*, i8** %.tmp6308
%.tmp6311 = getelementptr [5 x i8], [5 x i8]*@.str6310, i32 0, i32 0
%.tmp6312 = call i32(i8*,i8*) @strcmp(i8* %.tmp6309, i8* %.tmp6311)
%.tmp6313 = icmp eq i32 %.tmp6312, 0
br i1 %.tmp6313, label %.if.true.6314, label %.if.false.6314
.if.true.6314:
%.tmp6316 = getelementptr [2 x i8], [2 x i8]*@.str6315, i32 0, i32 0
ret i8* %.tmp6316
br label %.if.end.6314
.if.false.6314:
%.tmp6317 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6318 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6317, i32 0, i32 0
%.tmp6319 = load i8*, i8** %.tmp6318
%.tmp6321 = getelementptr [4 x i8], [4 x i8]*@.str6320, i32 0, i32 0
%.tmp6322 = call i32(i8*,i8*) @strcmp(i8* %.tmp6319, i8* %.tmp6321)
%.tmp6323 = icmp eq i32 %.tmp6322, 0
br i1 %.tmp6323, label %.if.true.6324, label %.if.false.6324
.if.true.6324:
%.tmp6326 = getelementptr [2 x i8], [2 x i8]*@.str6325, i32 0, i32 0
ret i8* %.tmp6326
br label %.if.end.6324
.if.false.6324:
%.tmp6327 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6328 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6327, i32 0, i32 0
%.tmp6329 = load i8*, i8** %.tmp6328
%.tmp6331 = getelementptr [4 x i8], [4 x i8]*@.str6330, i32 0, i32 0
%.tmp6332 = call i32(i8*,i8*) @strcmp(i8* %.tmp6329, i8* %.tmp6331)
%.tmp6333 = icmp eq i32 %.tmp6332, 0
br i1 %.tmp6333, label %.if.true.6334, label %.if.false.6334
.if.true.6334:
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp6335 = getelementptr i8*, i8** %buf, i32 0
%.tmp6337 = getelementptr [4 x i8], [4 x i8]*@.str6336, i32 0, i32 0
%.tmp6338 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6339 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6338, i32 0, i32 3
%.tmp6340 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6339
%.tmp6341 = call i8*(%m1811$.Type.type*) @m1811$type_abbr.cp.m1811$.Type.typep(%m1811$.Type.type* %.tmp6340)
%.tmp6342 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6335, i8* %.tmp6337, i8* %.tmp6341)
%.tmp6343 = load i8*, i8** %buf
ret i8* %.tmp6343
br label %.if.end.6334
.if.false.6334:
%.tmp6344 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6345 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6344, i32 0, i32 0
%.tmp6346 = load i8*, i8** %.tmp6345
%.tmp6348 = getelementptr [10 x i8], [10 x i8]*@.str6347, i32 0, i32 0
%.tmp6349 = call i32(i8*,i8*) @strcmp(i8* %.tmp6346, i8* %.tmp6348)
%.tmp6350 = icmp eq i32 %.tmp6349, 0
br i1 %.tmp6350, label %.if.true.6351, label %.if.false.6351
.if.true.6351:
%.tmp6352 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6353 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6352, i32 0, i32 2
%.tmp6354 = load i8*, i8** %.tmp6353
ret i8* %.tmp6354
br label %.if.end.6351
.if.false.6351:
%.tmp6355 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6356 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6355, i32 0, i32 0
%.tmp6357 = load i8*, i8** %.tmp6356
%.tmp6359 = getelementptr [6 x i8], [6 x i8]*@.str6358, i32 0, i32 0
%.tmp6360 = call i32(i8*,i8*) @strcmp(i8* %.tmp6357, i8* %.tmp6359)
%.tmp6361 = icmp eq i32 %.tmp6360, 0
br i1 %.tmp6361, label %.if.true.6362, label %.if.false.6362
.if.true.6362:
%.tmp6364 = getelementptr [2 x i8], [2 x i8]*@.str6363, i32 0, i32 0
ret i8* %.tmp6364
br label %.if.end.6362
.if.false.6362:
%.tmp6366 = getelementptr [44 x i8], [44 x i8]*@.str6365, i32 0, i32 0
%.tmp6367 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6368 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6367, i32 0, i32 0
%.tmp6369 = load i8*, i8** %.tmp6368
%.tmp6370 = call i32(i8*,...) @printf(i8* %.tmp6366, i8* %.tmp6369)
br label %.if.end.6362
.if.end.6362:
br label %.if.end.6351
.if.end.6351:
br label %.if.end.6334
.if.end.6334:
br label %.if.end.6324
.if.end.6324:
br label %.if.end.6314
.if.end.6314:
br label %.if.end.6304
.if.end.6304:
br label %.if.end.6294
.if.end.6294:
%.tmp6371 = bitcast ptr null to i8*
ret i8* %.tmp6371
}
define %m1811$.AssignableInfo.type* @m1811$define_string.m1811$.AssignableInfo.typep.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp6372 = bitcast ptr null to %m286$.Node.type*
%.tmp6373 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6372)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6373, %m1811$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
store i8* null, i8** %tmp_buff
%.tmp6374 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp6376 = getelementptr [7 x i8], [7 x i8]*@.str6375, i32 0, i32 0
%.tmp6377 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6378 = call i32(%m1811$.CompilerCtx.type*) @m1811$new_uid.i.m1811$.CompilerCtx.typep(%m1811$.CompilerCtx.type* %.tmp6377)
%.tmp6379 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6374, i8* %.tmp6376, i32 %.tmp6378)
%.tmp6380 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6381 = load i8, i8* @SCOPE_GLOBAL
%.tmp6382 = load i8*, i8** %tmp_buff
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6380, i8 %.tmp6381, i8* %.tmp6382)
%.tmp6383 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* null, i32 1
%.tmp6384 = ptrtoint %m1811$.GlobalName.type* %.tmp6383 to i32
%.tmp6385 = call i8*(i32) @malloc(i32 %.tmp6384)
%.tmp6386 = bitcast i8* %.tmp6385 to %m1811$.GlobalName.type*
%global = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.tmp6386, %m1811$.GlobalName.type** %global
%.tmp6387 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6388 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6387, i32 0, i32 0
%.tmp6389 = load i8*, i8** %text
%.tmp6390 = call i8*(i8*) @m2157$string_to_llvm.cp.cp(i8* %.tmp6389)
store i8* %.tmp6390, i8** %.tmp6388
%.tmp6391 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6392 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6391, i32 0, i32 3
%.tmp6393 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6393, %m1811$.Type.type** %.tmp6392
%.tmp6394 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6395 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6394, i32 0, i32 3
%.tmp6396 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6395
%.tmp6397 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6396, i32 0, i32 0
%.tmp6399 = getelementptr [6 x i8], [6 x i8]*@.str6398, i32 0, i32 0
store i8* %.tmp6399, i8** %.tmp6397
%.tmp6400 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6401 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6400, i32 0, i32 3
%.tmp6402 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6401
%.tmp6403 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6402, i32 0, i32 3
%.tmp6404 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6404, %m1811$.Type.type** %.tmp6403
%.tmp6405 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6406 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6405, i32 0, i32 3
%.tmp6407 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6406
%.tmp6408 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6407, i32 0, i32 3
%.tmp6409 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6408
%.tmp6410 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6409, i32 0, i32 0
%.tmp6412 = getelementptr [4 x i8], [4 x i8]*@.str6411, i32 0, i32 0
store i8* %.tmp6412, i8** %.tmp6410
%.tmp6413 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6414 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6413, i32 0, i32 3
%.tmp6415 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6414
%.tmp6416 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6415, i32 0, i32 3
%.tmp6417 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6416
%.tmp6418 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6417, i32 0, i32 4
%.tmp6419 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp6419, %m1811$.Type.type** %.tmp6418
%.tmp6420 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6421 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6420, i32 0, i32 3
%.tmp6422 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6421
%.tmp6423 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6422, i32 0, i32 3
%.tmp6424 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6423
%.tmp6425 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6424, i32 0, i32 4
%.tmp6426 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6425
%.tmp6427 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6426, i32 0, i32 0
%.tmp6428 = getelementptr i8*, i8** %.tmp6427, i32 0
%.tmp6430 = getelementptr [3 x i8], [3 x i8]*@.str6429, i32 0, i32 0
%.tmp6431 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6432 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6431, i32 0, i32 0
%.tmp6433 = load i8*, i8** %.tmp6432
%.tmp6434 = call i32(i8*) @m2157$llvm_str_len.i.cp(i8* %.tmp6433)
%.tmp6435 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6428, i8* %.tmp6430, i32 %.tmp6434)
%.tmp6436 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6437 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6436, i32 0, i32 1
%.tmp6439 = getelementptr [7 x i8], [7 x i8]*@.str6438, i32 0, i32 0
store i8* %.tmp6439, i8** %.tmp6437
%.tmp6440 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6441 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6440, i32 0, i32 4
store %m1811$.GlobalName.type* null, %m1811$.GlobalName.type** %.tmp6441
%.tmp6442 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6443 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6442, i32 0, i32 3
%.tmp6444 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
store %m1811$.AssignableInfo.type* %.tmp6444, %m1811$.AssignableInfo.type** %.tmp6443
%.tmp6445 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
%.tmp6446 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6445, i32 0, i32 2
store i1 0, i1* %.tmp6446
%.tmp6447 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6448 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %global
call void(%m1811$.CompilerCtx.type*,%m1811$.GlobalName.type*) @m1811$append_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.tmp6447, %m1811$.GlobalName.type* %.tmp6448)
%.tmp6449 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
ret %m1811$.AssignableInfo.type* %.tmp6449
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
%.tmp6450 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp6451 = call %m1811$.AssignableInfo.type*(%m286$.Node.type*) @m1811$new_assignable_info.m1811$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6450)
%info = alloca %m1811$.AssignableInfo.type*
store %m1811$.AssignableInfo.type* %.tmp6451, %m1811$.AssignableInfo.type** %info
%.tmp6452 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6453 = load i8, i8* @SCOPE_CONST
%.tmp6454 = load i8*, i8** %abspath
call void(%m1811$.AssignableInfo.type*,i8,i8*) @m1811$set_assignable_id.v.m1811$.AssignableInfo.typep.c.cp(%m1811$.AssignableInfo.type* %.tmp6452, i8 %.tmp6453, i8* %.tmp6454)
%.tmp6455 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6456 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6455, i32 0, i32 2
%.tmp6458 = getelementptr [7 x i8], [7 x i8]*@.str6457, i32 0, i32 0
store i8* %.tmp6458, i8** %.tmp6456
%.tmp6459 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
%.tmp6460 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp6459, i32 0, i32 3
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp6460
%.tmp6461 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6462 = load i8*, i8** %as_name
%.tmp6463 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %info
call void(%m1811$.CompilerCtx.type*,i8*,%m1811$.AssignableInfo.type*) @m1811$define_assignable.v.m1811$.CompilerCtx.typep.cp.m1811$.AssignableInfo.typep(%m1811$.CompilerCtx.type* %.tmp6461, i8* %.tmp6462, %m1811$.AssignableInfo.type* %.tmp6463)
ret void
}
define void @m1811$append_global.v.m1811$.CompilerCtx.typep.m1811$.GlobalName.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%g = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* %.g.arg, %m1811$.GlobalName.type** %g
%.tmp6464 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6465 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6464, i32 0, i32 3
%.tmp6466 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6465
%.tmp6467 = icmp eq %m1811$.GlobalName.type* %.tmp6466, null
br i1 %.tmp6467, label %.if.true.6468, label %.if.false.6468
.if.true.6468:
%.tmp6469 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6470 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6469, i32 0, i32 3
%.tmp6471 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
store %m1811$.GlobalName.type* %.tmp6471, %m1811$.GlobalName.type** %.tmp6470
br label %.if.end.6468
.if.false.6468:
%last_global = alloca %m1811$.GlobalName.type*
store %m1811$.GlobalName.type* null, %m1811$.GlobalName.type** %last_global
%.tmp6473 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6474 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6473, i32 0, i32 3
%.tmp6475 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6474
store %m1811$.GlobalName.type* %.tmp6475, %m1811$.GlobalName.type** %last_global
br label %.for.start.6472
.for.start.6472:
%.tmp6476 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %last_global
%.tmp6477 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6476, i32 0, i32 4
%.tmp6478 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6477
%.tmp6479 = icmp ne %m1811$.GlobalName.type* %.tmp6478, null
br i1 %.tmp6479, label %.for.continue.6472, label %.for.end.6472
.for.continue.6472:
%.tmp6480 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %last_global
%.tmp6481 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6480, i32 0, i32 4
%.tmp6482 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %.tmp6481
store %m1811$.GlobalName.type* %.tmp6482, %m1811$.GlobalName.type** %last_global
br label %.for.start.6472
.for.end.6472:
%.tmp6483 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %last_global
%.tmp6484 = getelementptr %m1811$.GlobalName.type, %m1811$.GlobalName.type* %.tmp6483, i32 0, i32 4
%.tmp6485 = load %m1811$.GlobalName.type*, %m1811$.GlobalName.type** %g
store %m1811$.GlobalName.type* %.tmp6485, %m1811$.GlobalName.type** %.tmp6484
br label %.if.end.6468
.if.end.6468:
ret void
}
define i8* @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.Type.type* %.type.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.type.arg, %m1811$.Type.type** %type
%.tmp6486 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6487 = icmp eq %m1811$.Type.type* %.tmp6486, null
br i1 %.tmp6487, label %.if.true.6488, label %.if.false.6488
.if.true.6488:
%.tmp6489 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6489, label %.if.true.6490, label %.if.false.6490
.if.true.6490:
%.tmp6492 = getelementptr [44 x i8], [44 x i8]*@.str6491, i32 0, i32 0
%.tmp6493 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6494 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6493, i32 0, i32 6
%.tmp6495 = load i8*, i8** %.tmp6494
%.tmp6496 = call i32(i8*,...) @printf(i8* %.tmp6492, i8* %.tmp6495)
br label %.if.end.6490
.if.false.6490:
br label %.if.end.6490
.if.end.6490:
%.tmp6498 = getelementptr [2 x i8], [2 x i8]*@.str6497, i32 0, i32 0
ret i8* %.tmp6498
br label %.if.end.6488
.if.false.6488:
br label %.if.end.6488
.if.end.6488:
%.tmp6499 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6500 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6499, i32 0, i32 0
%.tmp6501 = load i8*, i8** %.tmp6500
%.tmp6502 = icmp ne i8* %.tmp6501, null
%.tmp6504 = getelementptr [59 x i8], [59 x i8]*@.str6503, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6502, i8* %.tmp6504)
%buf = alloca i8*
store i8* null, i8** %buf
%.tmp6505 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6506 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6505, i32 0, i32 0
%.tmp6507 = load i8*, i8** %.tmp6506
%.tmp6509 = getelementptr [4 x i8], [4 x i8]*@.str6508, i32 0, i32 0
%.tmp6510 = call i32(i8*,i8*) @strcmp(i8* %.tmp6507, i8* %.tmp6509)
%.tmp6511 = icmp eq i32 %.tmp6510, 0
br i1 %.tmp6511, label %.if.true.6512, label %.if.false.6512
.if.true.6512:
%.tmp6514 = getelementptr [4 x i8], [4 x i8]*@.str6513, i32 0, i32 0
ret i8* %.tmp6514
br label %.if.end.6512
.if.false.6512:
%.tmp6515 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6516 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6515, i32 0, i32 0
%.tmp6517 = load i8*, i8** %.tmp6516
%.tmp6519 = getelementptr [5 x i8], [5 x i8]*@.str6518, i32 0, i32 0
%.tmp6520 = call i32(i8*,i8*) @strcmp(i8* %.tmp6517, i8* %.tmp6519)
%.tmp6521 = icmp eq i32 %.tmp6520, 0
br i1 %.tmp6521, label %.if.true.6522, label %.if.false.6522
.if.true.6522:
%.tmp6524 = getelementptr [5 x i8], [5 x i8]*@.str6523, i32 0, i32 0
ret i8* %.tmp6524
br label %.if.end.6522
.if.false.6522:
%.tmp6525 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6526 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6525, i32 0, i32 0
%.tmp6527 = load i8*, i8** %.tmp6526
%.tmp6529 = getelementptr [5 x i8], [5 x i8]*@.str6528, i32 0, i32 0
%.tmp6530 = call i32(i8*,i8*) @strcmp(i8* %.tmp6527, i8* %.tmp6529)
%.tmp6531 = icmp eq i32 %.tmp6530, 0
br i1 %.tmp6531, label %.if.true.6532, label %.if.false.6532
.if.true.6532:
%.tmp6534 = getelementptr [3 x i8], [3 x i8]*@.str6533, i32 0, i32 0
ret i8* %.tmp6534
br label %.if.end.6532
.if.false.6532:
%.tmp6535 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6536 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6535, i32 0, i32 0
%.tmp6537 = load i8*, i8** %.tmp6536
%.tmp6539 = getelementptr [8 x i8], [8 x i8]*@.str6538, i32 0, i32 0
%.tmp6540 = call i32(i8*,i8*) @strcmp(i8* %.tmp6537, i8* %.tmp6539)
%.tmp6541 = icmp eq i32 %.tmp6540, 0
br i1 %.tmp6541, label %.if.true.6542, label %.if.false.6542
.if.true.6542:
%.tmp6544 = getelementptr [4 x i8], [4 x i8]*@.str6543, i32 0, i32 0
ret i8* %.tmp6544
br label %.if.end.6542
.if.false.6542:
%.tmp6545 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6546 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6545, i32 0, i32 0
%.tmp6547 = load i8*, i8** %.tmp6546
%.tmp6549 = getelementptr [4 x i8], [4 x i8]*@.str6548, i32 0, i32 0
%.tmp6550 = call i32(i8*,i8*) @strcmp(i8* %.tmp6547, i8* %.tmp6549)
%.tmp6551 = icmp eq i32 %.tmp6550, 0
br i1 %.tmp6551, label %.if.true.6552, label %.if.false.6552
.if.true.6552:
%.tmp6554 = getelementptr [3 x i8], [3 x i8]*@.str6553, i32 0, i32 0
ret i8* %.tmp6554
br label %.if.end.6552
.if.false.6552:
%.tmp6555 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6556 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6555, i32 0, i32 0
%.tmp6557 = load i8*, i8** %.tmp6556
%.tmp6559 = getelementptr [9 x i8], [9 x i8]*@.str6558, i32 0, i32 0
%.tmp6560 = call i32(i8*,i8*) @strcmp(i8* %.tmp6557, i8* %.tmp6559)
%.tmp6561 = icmp eq i32 %.tmp6560, 0
br i1 %.tmp6561, label %.if.true.6562, label %.if.false.6562
.if.true.6562:
%.tmp6563 = getelementptr i8*, i8** %buf, i32 0
%.tmp6565 = getelementptr [4 x i8], [4 x i8]*@.str6564, i32 0, i32 0
%.tmp6566 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6567 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6568 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6567, i32 0, i32 3
%.tmp6569 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6568
%.tmp6570 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6566, %m1811$.Type.type* %.tmp6569)
%.tmp6571 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6563, i8* %.tmp6565, i8* %.tmp6570)
%.tmp6573 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6574 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6573, i32 0, i32 3
%.tmp6575 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6574
%.tmp6576 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6575, i32 0, i32 4
%.tmp6577 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6576
%p = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6577, %m1811$.Type.type** %p
br label %.for.start.6572
.for.start.6572:
%.tmp6578 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6579 = icmp ne %m1811$.Type.type* %.tmp6578, null
br i1 %.tmp6579, label %.for.continue.6572, label %.for.end.6572
.for.continue.6572:
%.tmp6580 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6581 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6582 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6581, i32 0, i32 3
%.tmp6583 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6582
%.tmp6584 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6583, i32 0, i32 4
%.tmp6585 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6584
%.tmp6586 = icmp ne %m1811$.Type.type* %.tmp6580, %.tmp6585
br i1 %.tmp6586, label %.if.true.6587, label %.if.false.6587
.if.true.6587:
%.tmp6588 = getelementptr i8*, i8** %buf, i32 0
%.tmp6590 = getelementptr [4 x i8], [4 x i8]*@.str6589, i32 0, i32 0
%.tmp6591 = load i8*, i8** %buf
%.tmp6592 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6588, i8* %.tmp6590, i8* %.tmp6591)
br label %.if.end.6587
.if.false.6587:
br label %.if.end.6587
.if.end.6587:
%.tmp6593 = getelementptr i8*, i8** %buf, i32 0
%.tmp6595 = getelementptr [5 x i8], [5 x i8]*@.str6594, i32 0, i32 0
%.tmp6596 = load i8*, i8** %buf
%.tmp6597 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6598 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6599 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6597, %m1811$.Type.type* %.tmp6598)
%.tmp6600 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6593, i8* %.tmp6595, i8* %.tmp6596, i8* %.tmp6599)
%.tmp6601 = load %m1811$.Type.type*, %m1811$.Type.type** %p
%.tmp6602 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6601, i32 0, i32 4
%.tmp6603 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6602
store %m1811$.Type.type* %.tmp6603, %m1811$.Type.type** %p
br label %.for.start.6572
.for.end.6572:
%.tmp6604 = getelementptr i8*, i8** %buf, i32 0
%.tmp6606 = getelementptr [4 x i8], [4 x i8]*@.str6605, i32 0, i32 0
%.tmp6607 = load i8*, i8** %buf
%.tmp6608 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6604, i8* %.tmp6606, i8* %.tmp6607)
%.tmp6609 = load i8*, i8** %buf
ret i8* %.tmp6609
br label %.if.end.6562
.if.false.6562:
%.tmp6610 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6611 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6610, i32 0, i32 0
%.tmp6612 = load i8*, i8** %.tmp6611
%.tmp6614 = getelementptr [4 x i8], [4 x i8]*@.str6613, i32 0, i32 0
%.tmp6615 = call i32(i8*,i8*) @strcmp(i8* %.tmp6612, i8* %.tmp6614)
%.tmp6616 = icmp eq i32 %.tmp6615, 0
br i1 %.tmp6616, label %.if.true.6617, label %.if.false.6617
.if.true.6617:
%.tmp6618 = getelementptr i8*, i8** %buf, i32 0
%.tmp6620 = getelementptr [4 x i8], [4 x i8]*@.str6619, i32 0, i32 0
%.tmp6621 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6622 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6623 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6622, i32 0, i32 3
%.tmp6624 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6623
%.tmp6625 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6621, %m1811$.Type.type* %.tmp6624)
%.tmp6626 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6618, i8* %.tmp6620, i8* %.tmp6625)
%.tmp6627 = load i8*, i8** %buf
ret i8* %.tmp6627
br label %.if.end.6617
.if.false.6617:
%.tmp6628 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6629 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6628, i32 0, i32 0
%.tmp6630 = load i8*, i8** %.tmp6629
%.tmp6632 = getelementptr [7 x i8], [7 x i8]*@.str6631, i32 0, i32 0
%.tmp6633 = call i32(i8*,i8*) @strcmp(i8* %.tmp6630, i8* %.tmp6632)
%.tmp6634 = icmp eq i32 %.tmp6633, 0
br i1 %.tmp6634, label %.if.true.6635, label %.if.false.6635
.if.true.6635:
%.tmp6636 = getelementptr i8*, i8** %buf, i32 0
%.tmp6638 = getelementptr [2 x i8], [2 x i8]*@.str6637, i32 0, i32 0
%.tmp6639 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6636, i8* %.tmp6638)
%.tmp6641 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6642 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6641, i32 0, i32 3
%.tmp6643 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6642
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6643, %m1811$.Type.type** %t
br label %.for.start.6640
.for.start.6640:
%.tmp6644 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6645 = icmp ne %m1811$.Type.type* %.tmp6644, null
br i1 %.tmp6645, label %.for.continue.6640, label %.for.end.6640
.for.continue.6640:
%.tmp6646 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6647 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6648 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6647, i32 0, i32 3
%.tmp6649 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6648
%.tmp6650 = icmp ne %m1811$.Type.type* %.tmp6646, %.tmp6649
br i1 %.tmp6650, label %.if.true.6651, label %.if.false.6651
.if.true.6651:
%.tmp6652 = getelementptr i8*, i8** %buf, i32 0
%.tmp6654 = getelementptr [4 x i8], [4 x i8]*@.str6653, i32 0, i32 0
%.tmp6655 = load i8*, i8** %buf
%.tmp6656 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6652, i8* %.tmp6654, i8* %.tmp6655)
br label %.if.end.6651
.if.false.6651:
br label %.if.end.6651
.if.end.6651:
%.tmp6657 = getelementptr i8*, i8** %buf, i32 0
%.tmp6659 = getelementptr [5 x i8], [5 x i8]*@.str6658, i32 0, i32 0
%.tmp6660 = load i8*, i8** %buf
%.tmp6661 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6662 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6663 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6661, %m1811$.Type.type* %.tmp6662)
%.tmp6664 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6657, i8* %.tmp6659, i8* %.tmp6660, i8* %.tmp6663)
%.tmp6665 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6666 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6665, i32 0, i32 4
%.tmp6667 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6666
store %m1811$.Type.type* %.tmp6667, %m1811$.Type.type** %t
br label %.for.start.6640
.for.end.6640:
%.tmp6668 = getelementptr i8*, i8** %buf, i32 0
%.tmp6670 = getelementptr [4 x i8], [4 x i8]*@.str6669, i32 0, i32 0
%.tmp6671 = load i8*, i8** %buf
%.tmp6672 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6668, i8* %.tmp6670, i8* %.tmp6671)
%.tmp6673 = load i8*, i8** %buf
ret i8* %.tmp6673
br label %.if.end.6635
.if.false.6635:
%.tmp6674 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6675 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6674, i32 0, i32 0
%.tmp6676 = load i8*, i8** %.tmp6675
%.tmp6678 = getelementptr [6 x i8], [6 x i8]*@.str6677, i32 0, i32 0
%.tmp6679 = call i32(i8*,i8*) @strcmp(i8* %.tmp6676, i8* %.tmp6678)
%.tmp6680 = icmp eq i32 %.tmp6679, 0
br i1 %.tmp6680, label %.if.true.6681, label %.if.false.6681
.if.true.6681:
%.tmp6682 = getelementptr i8*, i8** %buf, i32 0
%.tmp6684 = getelementptr [10 x i8], [10 x i8]*@.str6683, i32 0, i32 0
%.tmp6685 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6686 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6685, i32 0, i32 3
%.tmp6687 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6686
%.tmp6688 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6687, i32 0, i32 4
%.tmp6689 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6688
%.tmp6690 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6689, i32 0, i32 0
%.tmp6691 = load i8*, i8** %.tmp6690
%.tmp6692 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6693 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6694 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6693, i32 0, i32 3
%.tmp6695 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6694
%.tmp6696 = call i8*(%m1811$.CompilerCtx.type*,%m1811$.Type.type*) @m1811$type_repr.cp.m1811$.CompilerCtx.typep.m1811$.Type.typep(%m1811$.CompilerCtx.type* %.tmp6692, %m1811$.Type.type* %.tmp6695)
%.tmp6697 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6682, i8* %.tmp6684, i8* %.tmp6691, i8* %.tmp6696)
%.tmp6698 = load i8*, i8** %buf
ret i8* %.tmp6698
br label %.if.end.6681
.if.false.6681:
%.tmp6699 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6700 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6699, i32 0, i32 0
%.tmp6701 = load i8*, i8** %.tmp6700
%.tmp6703 = getelementptr [10 x i8], [10 x i8]*@.str6702, i32 0, i32 0
%.tmp6704 = call i32(i8*,i8*) @strcmp(i8* %.tmp6701, i8* %.tmp6703)
%.tmp6705 = icmp eq i32 %.tmp6704, 0
br i1 %.tmp6705, label %.if.true.6706, label %.if.false.6706
.if.true.6706:
%.tmp6707 = getelementptr i8*, i8** %buf, i32 0
%.tmp6709 = getelementptr [5 x i8], [5 x i8]*@.str6708, i32 0, i32 0
%.tmp6710 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6711 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6710, i32 0, i32 2
%.tmp6712 = load i8*, i8** %.tmp6711
%.tmp6713 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6707, i8* %.tmp6709, i8* %.tmp6712)
%.tmp6714 = load i8*, i8** %buf
ret i8* %.tmp6714
br label %.if.end.6706
.if.false.6706:
%.tmp6715 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6716 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6715, i32 0, i32 0
%.tmp6717 = load i8*, i8** %.tmp6716
%.tmp6719 = getelementptr [7 x i8], [7 x i8]*@.str6718, i32 0, i32 0
%.tmp6720 = call i32(i8*,i8*) @strcmp(i8* %.tmp6717, i8* %.tmp6719)
%.tmp6721 = icmp eq i32 %.tmp6720, 0
br i1 %.tmp6721, label %.if.true.6722, label %.if.false.6722
.if.true.6722:
%.tmp6724 = getelementptr [4 x i8], [4 x i8]*@.str6723, i32 0, i32 0
ret i8* %.tmp6724
br label %.if.end.6722
.if.false.6722:
%.tmp6725 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6726 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6725, i32 0, i32 0
%.tmp6727 = load i8*, i8** %.tmp6726
%.tmp6729 = getelementptr [6 x i8], [6 x i8]*@.str6728, i32 0, i32 0
%.tmp6730 = call i32(i8*,i8*) @strcmp(i8* %.tmp6727, i8* %.tmp6729)
%.tmp6731 = icmp eq i32 %.tmp6730, 0
br i1 %.tmp6731, label %.if.true.6732, label %.if.false.6732
.if.true.6732:
br label %.if.end.6732
.if.false.6732:
%.tmp6734 = getelementptr [58 x i8], [58 x i8]*@.str6733, i32 0, i32 0
%.tmp6735 = load %m1811$.Type.type*, %m1811$.Type.type** %type
%.tmp6736 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6735, i32 0, i32 0
%.tmp6737 = load i8*, i8** %.tmp6736
%.tmp6738 = call i32(i8*,...) @printf(i8* %.tmp6734, i8* %.tmp6737)
br label %.if.end.6732
.if.end.6732:
br label %.if.end.6722
.if.end.6722:
br label %.if.end.6706
.if.end.6706:
br label %.if.end.6681
.if.end.6681:
br label %.if.end.6635
.if.end.6635:
br label %.if.end.6617
.if.end.6617:
br label %.if.end.6562
.if.end.6562:
br label %.if.end.6552
.if.end.6552:
br label %.if.end.6542
.if.end.6542:
br label %.if.end.6532
.if.end.6532:
br label %.if.end.6522
.if.end.6522:
br label %.if.end.6512
.if.end.6512:
%.tmp6739 = bitcast ptr null to i8*
ret i8* %.tmp6739
}
define void @m1811$append_error.v.m1811$.CompilerCtx.typep.m754$.Error.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m754$.Error.type* %.e.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%e = alloca %m754$.Error.type*
store %m754$.Error.type* %.e.arg, %m754$.Error.type** %e
%.tmp6740 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* null, i32 1
%.tmp6741 = ptrtoint %m1811$.ErrorList.type* %.tmp6740 to i32
%.tmp6742 = call i8*(i32) @malloc(i32 %.tmp6741)
%.tmp6743 = bitcast i8* %.tmp6742 to %m1811$.ErrorList.type*
%new_err = alloca %m1811$.ErrorList.type*
store %m1811$.ErrorList.type* %.tmp6743, %m1811$.ErrorList.type** %new_err
%.tmp6744 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
%.tmp6745 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6744, i32 0, i32 0
%.tmp6746 = load %m754$.Error.type*, %m754$.Error.type** %e
store %m754$.Error.type* %.tmp6746, %m754$.Error.type** %.tmp6745
%.tmp6747 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
%.tmp6748 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6747, i32 0, i32 1
store %m1811$.ErrorList.type* null, %m1811$.ErrorList.type** %.tmp6748
%.tmp6749 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6750 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6749, i32 0, i32 2
%.tmp6751 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6750
%.tmp6752 = icmp eq %m1811$.ErrorList.type* %.tmp6751, null
br i1 %.tmp6752, label %.if.true.6753, label %.if.false.6753
.if.true.6753:
%.tmp6754 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6755 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6754, i32 0, i32 2
%.tmp6756 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
store %m1811$.ErrorList.type* %.tmp6756, %m1811$.ErrorList.type** %.tmp6755
ret void
br label %.if.end.6753
.if.false.6753:
br label %.if.end.6753
.if.end.6753:
%last = alloca %m1811$.ErrorList.type*
store %m1811$.ErrorList.type* null, %m1811$.ErrorList.type** %last
%.tmp6758 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6759 = getelementptr %m1811$.CompilerCtx.type, %m1811$.CompilerCtx.type* %.tmp6758, i32 0, i32 2
%.tmp6760 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6759
store %m1811$.ErrorList.type* %.tmp6760, %m1811$.ErrorList.type** %last
br label %.for.start.6757
.for.start.6757:
%.tmp6761 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %last
%.tmp6762 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6761, i32 0, i32 1
%.tmp6763 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6762
%.tmp6764 = icmp ne %m1811$.ErrorList.type* %.tmp6763, null
br i1 %.tmp6764, label %.for.continue.6757, label %.for.end.6757
.for.continue.6757:
%.tmp6765 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %last
%.tmp6766 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6765, i32 0, i32 1
%.tmp6767 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %.tmp6766
store %m1811$.ErrorList.type* %.tmp6767, %m1811$.ErrorList.type** %last
br label %.for.start.6757
.for.end.6757:
%.tmp6768 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %last
%.tmp6769 = getelementptr %m1811$.ErrorList.type, %m1811$.ErrorList.type* %.tmp6768, i32 0, i32 1
%.tmp6770 = load %m1811$.ErrorList.type*, %m1811$.ErrorList.type** %new_err
store %m1811$.ErrorList.type* %.tmp6770, %m1811$.ErrorList.type** %.tmp6769
ret void
}
define i8* @m1811$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6771 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6772 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6771, i32 0, i32 6
%.tmp6773 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6772
%.tmp6774 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6773, i32 0, i32 7
%.tmp6775 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6774
%.tmp6776 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6775, i32 0, i32 1
%.tmp6777 = load i8*, i8** %.tmp6776
ret i8* %.tmp6777
}
define %m286$.Node.type* @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6779 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6779, %m286$.Node.type** %n
br label %.for.start.6778
.for.start.6778:
%.tmp6780 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6781 = icmp ne %m286$.Node.type* %.tmp6780, null
br i1 %.tmp6781, label %.for.continue.6778, label %.for.end.6778
.for.continue.6778:
%.tmp6782 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6783 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6782, i32 0, i32 0
%.tmp6784 = load i8*, i8** %.tmp6783
%.tmp6785 = load i8*, i8** %type
%.tmp6786 = call i32(i8*,i8*) @strcmp(i8* %.tmp6784, i8* %.tmp6785)
%.tmp6787 = icmp eq i32 %.tmp6786, 0
br i1 %.tmp6787, label %.if.true.6788, label %.if.false.6788
.if.true.6788:
%.tmp6789 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6789
br label %.if.end.6788
.if.false.6788:
br label %.if.end.6788
.if.end.6788:
%.tmp6790 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6791 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6790, i32 0, i32 7
%.tmp6792 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6791
store %m286$.Node.type* %.tmp6792, %m286$.Node.type** %n
br label %.for.start.6778
.for.end.6778:
%.tmp6793 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6793
}
define %m1811$.Type.type* @m1811$syn_function_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6794 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%function_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6794, %m1811$.Type.type** %function_type
%.tmp6795 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6796 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6797 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6796, i32 0, i32 6
%.tmp6798 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6797
%.tmp6799 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6795, %m286$.Node.type* %.tmp6798)
%return_value_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6799, %m1811$.Type.type** %return_value_type
%.tmp6800 = load %m1811$.Type.type*, %m1811$.Type.type** %function_type
%.tmp6801 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6800, i32 0, i32 0
%.tmp6803 = getelementptr [9 x i8], [9 x i8]*@.str6802, i32 0, i32 0
store i8* %.tmp6803, i8** %.tmp6801
%.tmp6804 = load %m1811$.Type.type*, %m1811$.Type.type** %function_type
%.tmp6805 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6804, i32 0, i32 3
%.tmp6806 = load %m1811$.Type.type*, %m1811$.Type.type** %return_value_type
store %m1811$.Type.type* %.tmp6806, %m1811$.Type.type** %.tmp6805
%.tmp6807 = load %m1811$.Type.type*, %m1811$.Type.type** %return_value_type
%last_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6807, %m1811$.Type.type** %last_type
%.tmp6808 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6809 = call %m286$.Node.type*(%m286$.Node.type*) @m1811$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6808)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6809, %m286$.Node.type** %params
%.tmp6811 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6811, %m286$.Node.type** %param_ptr
br label %.for.start.6810
.for.start.6810:
%.tmp6812 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6813 = icmp ne %m286$.Node.type* %.tmp6812, null
br i1 %.tmp6813, label %.for.continue.6810, label %.for.end.6810
.for.continue.6810:
%.tmp6814 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6815 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6814, i32 0, i32 0
%.tmp6816 = load i8*, i8** %.tmp6815
%.tmp6818 = getelementptr [5 x i8], [5 x i8]*@.str6817, i32 0, i32 0
%.tmp6819 = call i32(i8*,i8*) @strcmp(i8* %.tmp6816, i8* %.tmp6818)
%.tmp6820 = icmp eq i32 %.tmp6819, 0
br i1 %.tmp6820, label %.if.true.6821, label %.if.false.6821
.if.true.6821:
%.tmp6822 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6823 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6822, i32 0, i32 4
%.tmp6824 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6825 = call %m1811$.Type.type*(%m1811$.Type.type*) @m1811$type_clone.m1811$.Type.typep.m1811$.Type.typep(%m1811$.Type.type* %.tmp6824)
store %m1811$.Type.type* %.tmp6825, %m1811$.Type.type** %.tmp6823
%.tmp6826 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6827 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6826, i32 0, i32 4
%.tmp6828 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6827
%.tmp6829 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6828, i32 0, i32 4
store %m1811$.Type.type* null, %m1811$.Type.type** %.tmp6829
%.tmp6830 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6831 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6830, i32 0, i32 4
%.tmp6832 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6831
store %m1811$.Type.type* %.tmp6832, %m1811$.Type.type** %last_type
%.tmp6833 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6833, i32 0, i32 7
%.tmp6835 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6834
%.tmp6836 = icmp ne %m286$.Node.type* %.tmp6835, null
br i1 %.tmp6836, label %.if.true.6837, label %.if.false.6837
.if.true.6837:
%.tmp6838 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6839 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6838, i32 0, i32 7
%.tmp6840 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6839
store %m286$.Node.type* %.tmp6840, %m286$.Node.type** %param_ptr
br label %.if.end.6837
.if.false.6837:
br label %.if.end.6837
.if.end.6837:
%.tmp6841 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6842 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6841, i32 0, i32 7
%.tmp6843 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6842
%.tmp6844 = icmp ne %m286$.Node.type* %.tmp6843, null
br i1 %.tmp6844, label %.if.true.6845, label %.if.false.6845
.if.true.6845:
%.tmp6846 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6847 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6846, i32 0, i32 7
%.tmp6848 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6847
store %m286$.Node.type* %.tmp6848, %m286$.Node.type** %param_ptr
br label %.if.end.6845
.if.false.6845:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6845
.if.end.6845:
br label %.if.end.6821
.if.false.6821:
%.tmp6849 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6850 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6851 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6850, i32 0, i32 6
%.tmp6852 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6851
%.tmp6853 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6849, %m286$.Node.type* %.tmp6852)
%param_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6853, %m1811$.Type.type** %param_type
%.tmp6854 = load %m1811$.Type.type*, %m1811$.Type.type** %last_type
%.tmp6855 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6854, i32 0, i32 4
%.tmp6856 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
store %m1811$.Type.type* %.tmp6856, %m1811$.Type.type** %.tmp6855
%.tmp6857 = load %m1811$.Type.type*, %m1811$.Type.type** %param_type
store %m1811$.Type.type* %.tmp6857, %m1811$.Type.type** %last_type
%.tmp6858 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6859 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6858, i32 0, i32 7
%.tmp6860 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6859
store %m286$.Node.type* %.tmp6860, %m286$.Node.type** %param_ptr
%.tmp6861 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6862 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6861, i32 0, i32 7
%.tmp6863 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6862
%.tmp6864 = icmp ne %m286$.Node.type* %.tmp6863, null
br i1 %.tmp6864, label %.if.true.6865, label %.if.false.6865
.if.true.6865:
%.tmp6866 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6867 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6866, i32 0, i32 7
%.tmp6868 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6867
%.tmp6869 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6868, i32 0, i32 7
%.tmp6870 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6869
store %m286$.Node.type* %.tmp6870, %m286$.Node.type** %param_ptr
br label %.if.end.6865
.if.false.6865:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6865
.if.end.6865:
br label %.if.end.6821
.if.end.6821:
br label %.for.start.6810
.for.end.6810:
%.tmp6871 = load %m1811$.Type.type*, %m1811$.Type.type** %function_type
ret %m1811$.Type.type* %.tmp6871
}
define %m286$.Node.type* @m1811$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6872 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6874 = getelementptr [10 x i8], [10 x i8]*@.str6873, i32 0, i32 0
%.tmp6875 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6872, i8* %.tmp6874)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6875, %m286$.Node.type** %params
%.tmp6876 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6877 = icmp eq %m286$.Node.type* %.tmp6876, null
br i1 %.tmp6877, label %.if.true.6878, label %.if.false.6878
.if.true.6878:
%.tmp6879 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6879
br label %.if.end.6878
.if.false.6878:
br label %.if.end.6878
.if.end.6878:
%.tmp6880 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6881 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6880, i32 0, i32 6
%.tmp6882 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6881
ret %m286$.Node.type* %.tmp6882
}
define %m1811$.Type.type* @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.ctx.arg, %m1811$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6883 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6883, %m1811$.Type.type** %t
%.tmp6884 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6885 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6884, i32 0, i32 0
%.tmp6886 = load i8*, i8** %.tmp6885
%.tmp6888 = getelementptr [10 x i8], [10 x i8]*@.str6887, i32 0, i32 0
%.tmp6889 = call i32(i8*,i8*) @strcmp(i8* %.tmp6886, i8* %.tmp6888)
%.tmp6890 = icmp eq i32 %.tmp6889, 0
br i1 %.tmp6890, label %.if.true.6891, label %.if.false.6891
.if.true.6891:
%.tmp6892 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6893 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6892, i32 0, i32 0
%.tmp6895 = getelementptr [7 x i8], [7 x i8]*@.str6894, i32 0, i32 0
store i8* %.tmp6895, i8** %.tmp6893
%.tmp6896 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6897 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6896, i32 0, i32 1
store i8* null, i8** %.tmp6897
%.tmp6898 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6899 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6898, i32 0, i32 6
%.tmp6900 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6899
%.tmp6902 = getelementptr [5 x i8], [5 x i8]*@.str6901, i32 0, i32 0
%.tmp6903 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6900, i8* %.tmp6902)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6903, %m286$.Node.type** %curr_type
%.tmp6904 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6905 = icmp ne %m286$.Node.type* %.tmp6904, null
br i1 %.tmp6905, label %.if.true.6906, label %.if.false.6906
.if.true.6906:
%.tmp6907 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6908 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6907, i32 0, i32 3
%.tmp6909 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6910 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6911 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6910, i32 0, i32 6
%.tmp6912 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6911
%.tmp6913 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6909, %m286$.Node.type* %.tmp6912)
store %m1811$.Type.type* %.tmp6913, %m1811$.Type.type** %.tmp6908
%.tmp6914 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6915 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6914, i32 0, i32 3
%.tmp6916 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6915
%.tmp6917 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6916, i32 0, i32 1
%.tmp6918 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6919 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6918, i32 0, i32 7
%.tmp6920 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6919
%.tmp6921 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6920, i32 0, i32 1
%.tmp6922 = load i8*, i8** %.tmp6921
store i8* %.tmp6922, i8** %.tmp6917
%.tmp6923 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6924 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6923, i32 0, i32 3
%.tmp6925 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6924
%curr_t = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp6925, %m1811$.Type.type** %curr_t
%.tmp6927 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6928 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6927, i32 0, i32 7
%.tmp6929 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6928
%.tmp6931 = getelementptr [5 x i8], [5 x i8]*@.str6930, i32 0, i32 0
%.tmp6932 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6929, i8* %.tmp6931)
store %m286$.Node.type* %.tmp6932, %m286$.Node.type** %curr_type
br label %.for.start.6926
.for.start.6926:
%.tmp6933 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6934 = icmp ne %m286$.Node.type* %.tmp6933, null
br i1 %.tmp6934, label %.for.continue.6926, label %.for.end.6926
.for.continue.6926:
%.tmp6935 = load %m1811$.Type.type*, %m1811$.Type.type** %curr_t
%.tmp6936 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6935, i32 0, i32 4
%.tmp6937 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6938 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6938, i32 0, i32 6
%.tmp6940 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6939
%.tmp6941 = call %m1811$.Type.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$node_to_type.m1811$.Type.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6937, %m286$.Node.type* %.tmp6940)
store %m1811$.Type.type* %.tmp6941, %m1811$.Type.type** %.tmp6936
%.tmp6942 = load %m1811$.Type.type*, %m1811$.Type.type** %curr_t
%.tmp6943 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6942, i32 0, i32 4
%.tmp6944 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6943
%.tmp6945 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6944, i32 0, i32 1
%.tmp6946 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6947 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6946, i32 0, i32 7
%.tmp6948 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6947
%.tmp6949 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6948, i32 0, i32 1
%.tmp6950 = load i8*, i8** %.tmp6949
store i8* %.tmp6950, i8** %.tmp6945
%.tmp6951 = load %m1811$.Type.type*, %m1811$.Type.type** %curr_t
%.tmp6952 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6951, i32 0, i32 4
%.tmp6953 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp6952
store %m1811$.Type.type* %.tmp6953, %m1811$.Type.type** %curr_t
%.tmp6954 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6955 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6954, i32 0, i32 7
%.tmp6956 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6955
%.tmp6958 = getelementptr [5 x i8], [5 x i8]*@.str6957, i32 0, i32 0
%.tmp6959 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1811$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6956, i8* %.tmp6958)
store %m286$.Node.type* %.tmp6959, %m286$.Node.type** %curr_type
br label %.for.start.6926
.for.end.6926:
br label %.if.end.6906
.if.false.6906:
br label %.if.end.6906
.if.end.6906:
br label %.if.end.6891
.if.false.6891:
%.tmp6960 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6961 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6960, i32 0, i32 0
%.tmp6962 = load i8*, i8** %.tmp6961
%.tmp6964 = getelementptr [12 x i8], [12 x i8]*@.str6963, i32 0, i32 0
%.tmp6965 = call i32(i8*,i8*) @strcmp(i8* %.tmp6962, i8* %.tmp6964)
%.tmp6966 = icmp eq i32 %.tmp6965, 0
br i1 %.tmp6966, label %.if.true.6967, label %.if.false.6967
.if.true.6967:
%err_msg = alloca i8*
store i8* null, i8** %err_msg
%.tmp6968 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6969 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6970 = call %m1811$.ScopeItem.type*(%m1811$.CompilerCtx.type*,%m286$.Node.type*) @m1811$find_defined.m1811$.ScopeItem.typep.m1811$.CompilerCtx.typep.m286$.Node.typep(%m1811$.CompilerCtx.type* %.tmp6968, %m286$.Node.type* %.tmp6969)
%base = alloca %m1811$.ScopeItem.type*
store %m1811$.ScopeItem.type* %.tmp6970, %m1811$.ScopeItem.type** %base
%.tmp6971 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp6972 = icmp eq %m1811$.ScopeItem.type* %.tmp6971, null
br i1 %.tmp6972, label %.if.true.6973, label %.if.false.6973
.if.true.6973:
%.tmp6974 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6976 = getelementptr [37 x i8], [37 x i8]*@.str6975, i32 0, i32 0
%.tmp6977 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6978 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6977, i32 0, i32 6
%.tmp6979 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6978
%.tmp6980 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6979, i32 0, i32 1
%.tmp6981 = load i8*, i8** %.tmp6980
%.tmp6982 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6974, i8* %.tmp6976, i8* %.tmp6981)
%.tmp6983 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp6984 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6985 = load i8*, i8** %err_msg
call void(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$new_error.v.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp6983, %m286$.Node.type* %.tmp6984, i8* %.tmp6985)
%.tmp6986 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6987 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6986, i32 0, i32 0
%.tmp6989 = getelementptr [6 x i8], [6 x i8]*@.str6988, i32 0, i32 0
store i8* %.tmp6989, i8** %.tmp6987
%.tmp6990 = load %m1811$.Type.type*, %m1811$.Type.type** %t
ret %m1811$.Type.type* %.tmp6990
br label %.if.end.6973
.if.false.6973:
br label %.if.end.6973
.if.end.6973:
%.tmp6991 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6992 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6991, i32 0, i32 0
%.tmp6994 = getelementptr [10 x i8], [10 x i8]*@.str6993, i32 0, i32 0
store i8* %.tmp6994, i8** %.tmp6992
%.tmp6995 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp6996 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp6995, i32 0, i32 1
%.tmp6997 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp6998 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp6997, i32 0, i32 0
%.tmp6999 = load i8*, i8** %.tmp6998
store i8* %.tmp6999, i8** %.tmp6996
%.tmp7000 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7001 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7000, i32 0, i32 2
%.tmp7002 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp7003 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp7002, i32 0, i32 1
%.tmp7004 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp7003
%.tmp7005 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp7004, i32 0, i32 0
%.tmp7006 = load i8*, i8** %.tmp7005
store i8* %.tmp7006, i8** %.tmp7001
%.tmp7007 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7008 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7007, i32 0, i32 3
%.tmp7009 = load %m1811$.ScopeItem.type*, %m1811$.ScopeItem.type** %base
%.tmp7010 = getelementptr %m1811$.ScopeItem.type, %m1811$.ScopeItem.type* %.tmp7009, i32 0, i32 1
%.tmp7011 = load %m1811$.AssignableInfo.type*, %m1811$.AssignableInfo.type** %.tmp7010
%.tmp7012 = getelementptr %m1811$.AssignableInfo.type, %m1811$.AssignableInfo.type* %.tmp7011, i32 0, i32 3
%.tmp7013 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp7012
store %m1811$.Type.type* %.tmp7013, %m1811$.Type.type** %.tmp7008
br label %.if.end.6967
.if.false.6967:
%.tmp7014 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7015 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7014, i32 0, i32 1
%.tmp7016 = load i8*, i8** %.tmp7015
%.tmp7018 = getelementptr [4 x i8], [4 x i8]*@.str7017, i32 0, i32 0
%.tmp7019 = call i32(i8*,i8*) @strcmp(i8* %.tmp7016, i8* %.tmp7018)
%.tmp7020 = icmp eq i32 %.tmp7019, 0
br i1 %.tmp7020, label %.if.true.7021, label %.if.false.7021
.if.true.7021:
%.tmp7022 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7023 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7022, i32 0, i32 0
%.tmp7025 = getelementptr [4 x i8], [4 x i8]*@.str7024, i32 0, i32 0
store i8* %.tmp7025, i8** %.tmp7023
%.tmp7026 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7027 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7026, i32 0, i32 3
%.tmp7028 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
store %m1811$.Type.type* %.tmp7028, %m1811$.Type.type** %.tmp7027
%.tmp7029 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7030 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7029, i32 0, i32 3
%.tmp7031 = load %m1811$.Type.type*, %m1811$.Type.type** %.tmp7030
%.tmp7032 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7031, i32 0, i32 0
%.tmp7034 = getelementptr [4 x i8], [4 x i8]*@.str7033, i32 0, i32 0
store i8* %.tmp7034, i8** %.tmp7032
br label %.if.end.7021
.if.false.7021:
%.tmp7035 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7036 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7035, i32 0, i32 0
%.tmp7037 = load i8*, i8** %.tmp7036
%.tmp7039 = getelementptr [5 x i8], [5 x i8]*@.str7038, i32 0, i32 0
%.tmp7040 = call i32(i8*,i8*) @strcmp(i8* %.tmp7037, i8* %.tmp7039)
%.tmp7041 = icmp eq i32 %.tmp7040, 0
br i1 %.tmp7041, label %.if.true.7042, label %.if.false.7042
.if.true.7042:
%.tmp7043 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7044 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7043, i32 0, i32 0
%.tmp7045 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7046 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7045, i32 0, i32 1
%.tmp7047 = load i8*, i8** %.tmp7046
store i8* %.tmp7047, i8** %.tmp7044
br label %.if.end.7042
.if.false.7042:
%.tmp7048 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7049 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7048, i32 0, i32 1
%.tmp7050 = load i8*, i8** %.tmp7049
%.tmp7052 = getelementptr [4 x i8], [4 x i8]*@.str7051, i32 0, i32 0
%.tmp7053 = call i32(i8*,i8*) @strcmp(i8* %.tmp7050, i8* %.tmp7052)
%.tmp7054 = icmp eq i32 %.tmp7053, 0
br i1 %.tmp7054, label %.if.true.7055, label %.if.false.7055
.if.true.7055:
%.tmp7056 = load %m1811$.Type.type*, %m1811$.Type.type** %t
%.tmp7057 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7056, i32 0, i32 0
%.tmp7059 = getelementptr [7 x i8], [7 x i8]*@.str7058, i32 0, i32 0
store i8* %.tmp7059, i8** %.tmp7057
br label %.if.end.7055
.if.false.7055:
%.tmp7060 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp7061 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7063 = getelementptr [54 x i8], [54 x i8]*@.str7062, i32 0, i32 0
%.tmp7064 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp7060, %m286$.Node.type* %.tmp7061, i8* %.tmp7063)
%.tmp7065 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7066 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7065, i32 0, i32 0
%.tmp7067 = load i8*, i8** %.tmp7066
%.tmp7068 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7069 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7068, i32 0, i32 1
%.tmp7070 = load i8*, i8** %.tmp7069
%.tmp7071 = call i32(i8*,...) @printf(i8* %.tmp7064, i8* %.tmp7067, i8* %.tmp7070)
%.tmp7072 = bitcast ptr null to %m1811$.Type.type*
ret %m1811$.Type.type* %.tmp7072
br label %.if.end.7055
.if.end.7055:
br label %.if.end.7042
.if.end.7042:
br label %.if.end.7021
.if.end.7021:
br label %.if.end.6967
.if.end.6967:
br label %.if.end.6891
.if.end.6891:
%.tmp7074 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp7075 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7074, i32 0, i32 7
%.tmp7076 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7075
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp7076, %m286$.Node.type** %ptr
br label %.for.start.7073
.for.start.7073:
%.tmp7077 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7078 = icmp ne %m286$.Node.type* %.tmp7077, null
br i1 %.tmp7078, label %.for.continue.7073, label %.for.end.7073
.for.continue.7073:
%.tmp7079 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7080 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7079, i32 0, i32 1
%.tmp7081 = load i8*, i8** %.tmp7080
%.tmp7083 = getelementptr [2 x i8], [2 x i8]*@.str7082, i32 0, i32 0
%.tmp7084 = call i32(i8*,i8*) @strcmp(i8* %.tmp7081, i8* %.tmp7083)
%.tmp7085 = icmp eq i32 %.tmp7084, 0
br i1 %.tmp7085, label %.if.true.7086, label %.if.false.7086
.if.true.7086:
%.tmp7087 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%pt = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7087, %m1811$.Type.type** %pt
%.tmp7088 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp7089 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7088, i32 0, i32 0
%.tmp7091 = getelementptr [4 x i8], [4 x i8]*@.str7090, i32 0, i32 0
store i8* %.tmp7091, i8** %.tmp7089
%.tmp7092 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
%.tmp7093 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7092, i32 0, i32 3
%.tmp7094 = load %m1811$.Type.type*, %m1811$.Type.type** %t
store %m1811$.Type.type* %.tmp7094, %m1811$.Type.type** %.tmp7093
%.tmp7095 = load %m1811$.Type.type*, %m1811$.Type.type** %pt
store %m1811$.Type.type* %.tmp7095, %m1811$.Type.type** %t
br label %.if.end.7086
.if.false.7086:
%.tmp7096 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7097 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7096, i32 0, i32 1
%.tmp7098 = load i8*, i8** %.tmp7097
%.tmp7100 = getelementptr [2 x i8], [2 x i8]*@.str7099, i32 0, i32 0
%.tmp7101 = call i32(i8*,i8*) @strcmp(i8* %.tmp7098, i8* %.tmp7100)
%.tmp7102 = icmp eq i32 %.tmp7101, 0
br i1 %.tmp7102, label %.if.true.7103, label %.if.false.7103
.if.true.7103:
%.tmp7104 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7105 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7104, i32 0, i32 7
%.tmp7106 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7105
%.tmp7107 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7106, i32 0, i32 1
%.tmp7108 = load i8*, i8** %.tmp7107
%.tmp7110 = getelementptr [2 x i8], [2 x i8]*@.str7109, i32 0, i32 0
%.tmp7111 = call i32(i8*,i8*) @strcmp(i8* %.tmp7108, i8* %.tmp7110)
%.tmp7112 = icmp eq i32 %.tmp7111, 0
br i1 %.tmp7112, label %.if.true.7113, label %.if.false.7113
.if.true.7113:
%.tmp7114 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_type = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7114, %m1811$.Type.type** %slice_type
%.tmp7115 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_type
%.tmp7116 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7115, i32 0, i32 0
%.tmp7118 = getelementptr [7 x i8], [7 x i8]*@.str7117, i32 0, i32 0
store i8* %.tmp7118, i8** %.tmp7116
%.tmp7119 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_c_array = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7119, %m1811$.Type.type** %slice_c_array
%.tmp7120 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7121 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7120, i32 0, i32 0
%.tmp7123 = getelementptr [4 x i8], [4 x i8]*@.str7122, i32 0, i32 0
store i8* %.tmp7123, i8** %.tmp7121
%.tmp7124 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7125 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7124, i32 0, i32 1
%.tmp7127 = getelementptr [6 x i8], [6 x i8]*@.str7126, i32 0, i32 0
store i8* %.tmp7127, i8** %.tmp7125
%.tmp7128 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7129 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7128, i32 0, i32 3
%.tmp7130 = load %m1811$.Type.type*, %m1811$.Type.type** %t
store %m1811$.Type.type* %.tmp7130, %m1811$.Type.type** %.tmp7129
%.tmp7131 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_type
%.tmp7132 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7131, i32 0, i32 3
%.tmp7133 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
store %m1811$.Type.type* %.tmp7133, %m1811$.Type.type** %.tmp7132
%.tmp7134 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_len = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7134, %m1811$.Type.type** %slice_len
%.tmp7135 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
%.tmp7136 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7135, i32 0, i32 0
%.tmp7138 = getelementptr [4 x i8], [4 x i8]*@.str7137, i32 0, i32 0
store i8* %.tmp7138, i8** %.tmp7136
%.tmp7139 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
%.tmp7140 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7139, i32 0, i32 1
%.tmp7142 = getelementptr [4 x i8], [4 x i8]*@.str7141, i32 0, i32 0
store i8* %.tmp7142, i8** %.tmp7140
%.tmp7143 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_c_array
%.tmp7144 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7143, i32 0, i32 4
%.tmp7145 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
store %m1811$.Type.type* %.tmp7145, %m1811$.Type.type** %.tmp7144
%.tmp7146 = call %m1811$.Type.type*() @m1811$new_type.m1811$.Type.typep()
%slice_cap = alloca %m1811$.Type.type*
store %m1811$.Type.type* %.tmp7146, %m1811$.Type.type** %slice_cap
%.tmp7147 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_cap
%.tmp7148 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7147, i32 0, i32 0
%.tmp7150 = getelementptr [4 x i8], [4 x i8]*@.str7149, i32 0, i32 0
store i8* %.tmp7150, i8** %.tmp7148
%.tmp7151 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_cap
%.tmp7152 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7151, i32 0, i32 1
%.tmp7154 = getelementptr [4 x i8], [4 x i8]*@.str7153, i32 0, i32 0
store i8* %.tmp7154, i8** %.tmp7152
%.tmp7155 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_len
%.tmp7156 = getelementptr %m1811$.Type.type, %m1811$.Type.type* %.tmp7155, i32 0, i32 4
%.tmp7157 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_cap
store %m1811$.Type.type* %.tmp7157, %m1811$.Type.type** %.tmp7156
%.tmp7158 = load %m1811$.Type.type*, %m1811$.Type.type** %slice_type
store %m1811$.Type.type* %.tmp7158, %m1811$.Type.type** %t
%.tmp7159 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7160 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7159, i32 0, i32 7
%.tmp7161 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7160
store %m286$.Node.type* %.tmp7161, %m286$.Node.type** %ptr
br label %.if.end.7113
.if.false.7113:
br label %.if.end.7113
.if.end.7113:
br label %.if.end.7103
.if.false.7103:
%.tmp7162 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %ctx
%.tmp7163 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7165 = getelementptr [49 x i8], [49 x i8]*@.str7164, i32 0, i32 0
%.tmp7166 = call i8*(%m1811$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1811$err_tmpl.cp.m1811$.CompilerCtx.typep.m286$.Node.typep.cp(%m1811$.CompilerCtx.type* %.tmp7162, %m286$.Node.type* %.tmp7163, i8* %.tmp7165)
%.tmp7167 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7168 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7167, i32 0, i32 1
%.tmp7169 = load i8*, i8** %.tmp7168
%.tmp7170 = call i32(i8*,...) @printf(i8* %.tmp7166, i8* %.tmp7169)
%.tmp7171 = bitcast ptr null to %m1811$.Type.type*
ret %m1811$.Type.type* %.tmp7171
br label %.if.end.7103
.if.end.7103:
br label %.if.end.7086
.if.end.7086:
%.tmp7172 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp7173 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp7172, i32 0, i32 7
%.tmp7174 = load %m286$.Node.type*, %m286$.Node.type** %.tmp7173
store %m286$.Node.type* %.tmp7174, %m286$.Node.type** %ptr
br label %.for.start.7073
.for.end.7073:
%.tmp7175 = load %m1811$.Type.type*, %m1811$.Type.type** %t
ret %m1811$.Type.type* %.tmp7175
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
@.str2892 = constant [6 x i8] c"start\00"
@.str2898 = constant [7 x i8] c"global\00"
@.str2908 = constant [13 x i8] c"head_comment\00"
@.str2945 = constant [7 x i8] c"string\00"
@.str2954 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2984 = constant [5 x i8] c"%s%s\00"
@.str2992 = constant [9 x i8] c"function\00"
@.str2998 = constant [5 x i8] c"main\00"
@.str3010 = constant [6 x i8] c"%s.%s\00"
@.str3027 = constant [3 x i8] c"NL\00"
@.str3035 = constant [7 x i8] c"global\00"
@.str3043 = constant [11 x i8] c"assignable\00"
@.str3071 = constant [9 x i8] c"variable\00"
@.str3082 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3097 = constant [10 x i8] c"typealias\00"
@.str3117 = constant [11 x i8] c"%s.%s.type\00"
@.str3129 = constant [10 x i8] c"typealias\00"
@.str3150 = constant [5 x i8] c"type\00"
@.str3177 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3190 = constant [7 x i8] c"extern\00"
@.str3208 = constant [7 x i8] c"extern\00"
@.str3247 = constant [15 x i8] c"declare %s %s(\00"
@.str3278 = constant [3 x i8] c", \00"
@.str3284 = constant [3 x i8] c"%s\00"
@.str3296 = constant [3 x i8] c")\0A\00"
@.str3307 = constant [9 x i8] c"function\00"
@.str3316 = constant [9 x i8] c"function\00"
@.str3353 = constant [14 x i8] c"define %s %s(\00"
@.str3379 = constant [3 x i8] c", \00"
@.str3385 = constant [5 x i8] c"type\00"
@.str3401 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3416 = constant [5 x i8] c") {\0A\00"
@.str3420 = constant [9 x i8] c"function\00"
@.str3429 = constant [6 x i8] c"block\00"
@.str3447 = constant [3 x i8] c"NL\00"
@.str3454 = constant [9 x i8] c"OPERATOR\00"
@.str3472 = constant [7 x i8] c"return\00"
@.str3482 = constant [5 x i8] c"void\00"
@.str3489 = constant [21 x i8] c"missing return value\00"
@.str3494 = constant [10 x i8] c"ret void\0A\00"
@.str3500 = constant [3 x i8] c"}\0A\00"
@.str3506 = constant [7 x i8] c"import\00"
@.str3551 = constant [1 x i8] c"\00"
@.str3557 = constant [6 x i8] c"%s.bn\00"
@.str3562 = constant [9 x i8] c"%s/%s.bn\00"
@.str3574 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3631 = constant [5 x i8] c"m%d$\00"
@.str3680 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3688 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3717 = constant [9 x i8] c"variable\00"
@.str3722 = constant [5 x i8] c"type\00"
@.str3752 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3764 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3776 = constant [6 x i8] c"block\00"
@.str3789 = constant [11 x i8] c"expression\00"
@.str3816 = constant [7 x i8] c"sizeof\00"
@.str3822 = constant [8 x i8] c"fn_args\00"
@.str3828 = constant [11 x i8] c"assignable\00"
@.str3853 = constant [4 x i8] c"int\00"
@.str3864 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3873 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3899 = constant [35 x i8] c"unable to compile function address\00"
@.str3905 = constant [8 x i8] c"fn_args\00"
@.str3908 = constant [1 x i8] c"\00"
@.str3916 = constant [11 x i8] c"assignable\00"
@.str3928 = constant [5 x i8] c"%s, \00"
@.str3944 = constant [8 x i8] c"%s%s %s\00"
@.str3959 = constant [11 x i8] c"assignable\00"
@.str3969 = constant [5 x i8] c"void\00"
@.str3977 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4008 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4029 = constant [7 x i8] c"return\00"
@.str4041 = constant [3 x i8] c"NL\00"
@.str4059 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4072 = constant [10 x i8] c"ret void\0A\00"
@.str4076 = constant [3 x i8] c"NL\00"
@.str4082 = constant [8 x i8] c"fn_call\00"
@.str4093 = constant [12 x i8] c"declaration\00"
@.str4102 = constant [11 x i8] c"assignment\00"
@.str4110 = constant [11 x i8] c"assignable\00"
@.str4122 = constant [34 x i8] c"%s was not declared in this scope\00"
@.str4154 = constant [4 x i8] c"ptr\00"
@.str4163 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4173 = constant [9 x i8] c"if_block\00"
@.str4181 = constant [9 x i8] c"for_loop\00"
@.str4189 = constant [8 x i8] c"keyword\00"
@.str4204 = constant [6 x i8] c"break\00"
@.str4218 = constant [4 x i8] c"for\00"
@.str4226 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4240 = constant [9 x i8] c"continue\00"
@.str4254 = constant [4 x i8] c"for\00"
@.str4262 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4273 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4284 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4299 = constant [14 x i8] c".for.start.%d\00"
@.str4304 = constant [12 x i8] c".for.end.%d\00"
@.str4309 = constant [4 x i8] c"for\00"
@.str4316 = constant [12 x i8] c"declaration\00"
@.str4327 = constant [11 x i8] c"assignment\00"
@.str4337 = constant [9 x i8] c"OPERATOR\00"
@.str4344 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4355 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4362 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4369 = constant [9 x i8] c"OPERATOR\00"
@.str4378 = constant [9 x i8] c"OPERATOR\00"
@.str4385 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4393 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4408 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4415 = constant [9 x i8] c"OPERATOR\00"
@.str4422 = constant [6 x i8] c"block\00"
@.str4436 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4443 = constant [5 x i8] c"%s:\0A\00"
@.str4455 = constant [5 x i8] c"type\00"
@.str4470 = constant [11 x i8] c"assignable\00"
@.str4483 = constant [9 x i8] c"variable\00"
@.str4488 = constant [5 x i8] c"WORD\00"
@.str4496 = constant [31 x i8] c"unable to get declaration name\00"
@.str4548 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4564 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4576 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4611 = constant [4 x i8] c"int\00"
@.str4618 = constant [4 x i8] c"chr\00"
@.str4626 = constant [5 x i8] c"bool\00"
@.str4635 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str4644 = constant [4 x i8] c"ptr\00"
@.str4652 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4655 = constant [5 x i8] c"null\00"
@.str4663 = constant [7 x i8] c"struct\00"
@.str4684 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4704 = constant [10 x i8] c"typealias\00"
@.str4727 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4746 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str4763 = constant [11 x i8] c"assignable\00"
@.str4777 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4792 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4799 = constant [6 x i8] c"block\00"
@.str4807 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4814 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4821 = constant [11 x i8] c"elif_block\00"
@.str4832 = constant [11 x i8] c"else_block\00"
@.str4842 = constant [6 x i8] c"block\00"
@.str4852 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4859 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4879 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4887 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4936 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4957 = constant [7 x i8] c"module\00"
@.str4986 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5028 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5036 = constant [9 x i8] c"function\00"
@.str5043 = constant [7 x i8] c"extern\00"
@.str5055 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5076 = constant [9 x i8] c"variable\00"
@.str5096 = constant [4 x i8] c"ptr\00"
@.str5114 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5138 = constant [10 x i8] c"typealias\00"
@.str5149 = constant [7 x i8] c"struct\00"
@.str5155 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5206 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5226 = constant [9 x i8] c"variable\00"
@.str5236 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5257 = constant [9 x i8] c"variable\00"
@.str5265 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5277 = constant [12 x i8] c"destination\00"
@.str5282 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5308 = constant [25 x i8] c"name '%s' is not defined\00"
@.str5326 = constant [7 x i8] c"module\00"
@.str5348 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5412 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5432 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5455 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5480 = constant [15 x i8] c"hello: %s %s?\0A\00"
@.str5492 = constant [16 x i8] c"mono_assignable\00"
@.str5514 = constant [5 x i8] c"cast\00"
@.str5523 = constant [5 x i8] c"type\00"
@.str5543 = constant [8 x i8] c"bitcast\00"
@.str5550 = constant [4 x i8] c"ptr\00"
@.str5557 = constant [4 x i8] c"ptr\00"
@.str5574 = constant [4 x i8] c"i%d\00"
@.str5579 = constant [4 x i8] c"i%d\00"
@.str5587 = constant [5 x i8] c"sext\00"
@.str5589 = constant [6 x i8] c"trunc\00"
@.str5594 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str5614 = constant [16 x i8] c"mono_assignable\00"
@.str5672 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5695 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5702 = constant [2 x i8] c"+\00"
@.str5707 = constant [4 x i8] c"add\00"
@.str5712 = constant [2 x i8] c"-\00"
@.str5717 = constant [4 x i8] c"sub\00"
@.str5722 = constant [2 x i8] c"*\00"
@.str5727 = constant [4 x i8] c"mul\00"
@.str5732 = constant [2 x i8] c"/\00"
@.str5737 = constant [5 x i8] c"sdiv\00"
@.str5742 = constant [3 x i8] c"==\00"
@.str5747 = constant [8 x i8] c"icmp eq\00"
@.str5752 = constant [3 x i8] c"!=\00"
@.str5757 = constant [8 x i8] c"icmp ne\00"
@.str5762 = constant [2 x i8] c">\00"
@.str5767 = constant [9 x i8] c"icmp sgt\00"
@.str5772 = constant [2 x i8] c"<\00"
@.str5777 = constant [9 x i8] c"icmp slt\00"
@.str5782 = constant [2 x i8] c"&\00"
@.str5787 = constant [4 x i8] c"and\00"
@.str5792 = constant [2 x i8] c"|\00"
@.str5797 = constant [3 x i8] c"or\00"
@.str5802 = constant [3 x i8] c">=\00"
@.str5807 = constant [9 x i8] c"icmp sge\00"
@.str5812 = constant [3 x i8] c"<=\00"
@.str5817 = constant [9 x i8] c"icmp sle\00"
@.str5821 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5828 = constant [4 x i8] c"add\00"
@.str5834 = constant [3 x i8] c"==\00"
@.str5841 = constant [3 x i8] c"!=\00"
@.str5849 = constant [2 x i8] c"|\00"
@.str5857 = constant [2 x i8] c"&\00"
@.str5865 = constant [2 x i8] c">\00"
@.str5873 = constant [2 x i8] c"<\00"
@.str5881 = constant [3 x i8] c">=\00"
@.str5889 = constant [3 x i8] c"<=\00"
@.str5897 = constant [5 x i8] c"bool\00"
@.str5901 = constant [4 x i8] c"int\00"
@.str5911 = constant [7 x i8] c"NUMBER\00"
@.str5925 = constant [4 x i8] c"int\00"
@.str5939 = constant [5 x i8] c"WORD\00"
@.str5949 = constant [5 x i8] c"null\00"
@.str5956 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5970 = constant [5 x i8] c"null\00"
@.str5979 = constant [8 x i8] c"nullptr\00"
@.str5986 = constant [17 x i8] c"addr_destination\00"
@.str5998 = constant [12 x i8] c"destination\00"
@.str6037 = constant [4 x i8] c"ptr\00"
@.str6056 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6068 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6082 = constant [8 x i8] c"boolean\00"
@.str6096 = constant [5 x i8] c"bool\00"
@.str6105 = constant [6 x i8] c"false\00"
@.str6112 = constant [2 x i8] c"0\00"
@.str6116 = constant [2 x i8] c"1\00"
@.str6123 = constant [8 x i8] c"fn_call\00"
@.str6140 = constant [7 x i8] c"STRING\00"
@.str6164 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6180 = constant [4 x i8] c"ptr\00"
@.str6193 = constant [4 x i8] c"chr\00"
@.str6200 = constant [4 x i8] c"CHR\00"
@.str6215 = constant [2 x i8] c"0\00"
@.str6231 = constant [22 x i8] c"Invalid character: %s\00"
@.str6247 = constant [4 x i8] c"chr\00"
@.str6251 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6279 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6285 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6290 = constant [4 x i8] c"int\00"
@.str6295 = constant [2 x i8] c"i\00"
@.str6300 = constant [5 x i8] c"bool\00"
@.str6305 = constant [2 x i8] c"b\00"
@.str6310 = constant [5 x i8] c"void\00"
@.str6315 = constant [2 x i8] c"v\00"
@.str6320 = constant [4 x i8] c"chr\00"
@.str6325 = constant [2 x i8] c"c\00"
@.str6330 = constant [4 x i8] c"ptr\00"
@.str6336 = constant [4 x i8] c"%sp\00"
@.str6347 = constant [10 x i8] c"typealias\00"
@.str6358 = constant [6 x i8] c"error\00"
@.str6363 = constant [2 x i8] c"?\00"
@.str6365 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str6375 = constant [7 x i8] c".str%d\00"
@.str6398 = constant [6 x i8] c"array\00"
@.str6411 = constant [4 x i8] c"chr\00"
@.str6429 = constant [3 x i8] c"%d\00"
@.str6438 = constant [7 x i8] c"string\00"
@.str6457 = constant [7 x i8] c"module\00"
@.str6491 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6497 = constant [2 x i8] c"?\00"
@.str6503 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6508 = constant [4 x i8] c"int\00"
@.str6513 = constant [4 x i8] c"i32\00"
@.str6518 = constant [5 x i8] c"void\00"
@.str6523 = constant [5 x i8] c"void\00"
@.str6528 = constant [5 x i8] c"bool\00"
@.str6533 = constant [3 x i8] c"i1\00"
@.str6538 = constant [8 x i8] c"nullptr\00"
@.str6543 = constant [4 x i8] c"ptr\00"
@.str6548 = constant [4 x i8] c"chr\00"
@.str6553 = constant [3 x i8] c"i8\00"
@.str6558 = constant [9 x i8] c"function\00"
@.str6564 = constant [4 x i8] c"%s(\00"
@.str6589 = constant [4 x i8] c"%s,\00"
@.str6594 = constant [5 x i8] c"%s%s\00"
@.str6605 = constant [4 x i8] c"%s)\00"
@.str6613 = constant [4 x i8] c"ptr\00"
@.str6619 = constant [4 x i8] c"%s*\00"
@.str6631 = constant [7 x i8] c"struct\00"
@.str6637 = constant [2 x i8] c"{\00"
@.str6653 = constant [4 x i8] c"%s,\00"
@.str6658 = constant [5 x i8] c"%s%s\00"
@.str6669 = constant [4 x i8] c"%s}\00"
@.str6677 = constant [6 x i8] c"array\00"
@.str6683 = constant [10 x i8] c"[%s x %s]\00"
@.str6702 = constant [10 x i8] c"typealias\00"
@.str6708 = constant [5 x i8] c"%%%s\00"
@.str6718 = constant [7 x i8] c"vararg\00"
@.str6723 = constant [4 x i8] c"...\00"
@.str6728 = constant [6 x i8] c"error\00"
@.str6733 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6802 = constant [9 x i8] c"function\00"
@.str6817 = constant [5 x i8] c"WORD\00"
@.str6873 = constant [10 x i8] c"fn_params\00"
@.str6887 = constant [10 x i8] c"structdef\00"
@.str6894 = constant [7 x i8] c"struct\00"
@.str6901 = constant [5 x i8] c"type\00"
@.str6930 = constant [5 x i8] c"type\00"
@.str6957 = constant [5 x i8] c"type\00"
@.str6963 = constant [12 x i8] c"dotted_name\00"
@.str6975 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6988 = constant [6 x i8] c"error\00"
@.str6993 = constant [10 x i8] c"typealias\00"
@.str7017 = constant [4 x i8] c"str\00"
@.str7024 = constant [4 x i8] c"ptr\00"
@.str7033 = constant [4 x i8] c"chr\00"
@.str7038 = constant [5 x i8] c"WORD\00"
@.str7051 = constant [4 x i8] c"...\00"
@.str7058 = constant [7 x i8] c"vararg\00"
@.str7062 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7082 = constant [2 x i8] c"*\00"
@.str7090 = constant [4 x i8] c"ptr\00"
@.str7099 = constant [2 x i8] c"[\00"
@.str7109 = constant [2 x i8] c"]\00"
@.str7117 = constant [7 x i8] c"struct\00"
@.str7122 = constant [4 x i8] c"ptr\00"
@.str7126 = constant [6 x i8] c"c_arr\00"
@.str7137 = constant [4 x i8] c"int\00"
@.str7141 = constant [4 x i8] c"len\00"
@.str7149 = constant [4 x i8] c"int\00"
@.str7153 = constant [4 x i8] c"cap\00"
@.str7164 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7176 = load i32, i32* %argc
%.tmp7177 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7176, i8** %.tmp7177)
%.tmp7178 = load i32, i32* @STDERR
%.tmp7180 = getelementptr [2 x i8], [2 x i8]*@.str7179, i32 0, i32 0
%.tmp7181 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7178, i8* %.tmp7180)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7181, %m0$.File.type** %stderr
%.tmp7182 = load i8**, i8*** %argv
%.tmp7183 = getelementptr i8*, i8** %.tmp7182, i32 1
%.tmp7184 = load i8*, i8** %.tmp7183
%filename = alloca i8*
store i8* %.tmp7184, i8** %filename
%.tmp7185 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7185, %m0$.File.type** %llvm_code
%.tmp7186 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7187 = load i8*, i8** %filename
%.tmp7188 = call %m1811$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1811$new_context.m1811$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7186, i8* %.tmp7187)
%compiler_ctx = alloca %m1811$.CompilerCtx.type*
store %m1811$.CompilerCtx.type* %.tmp7188, %m1811$.CompilerCtx.type** %compiler_ctx
%.tmp7189 = load %m1811$.CompilerCtx.type*, %m1811$.CompilerCtx.type** %compiler_ctx
%.tmp7190 = load i8*, i8** %filename
%.tmp7191 = call i1(%m1811$.CompilerCtx.type*,i8*) @m1811$compile_file.b.m1811$.CompilerCtx.typep.cp(%m1811$.CompilerCtx.type* %.tmp7189, i8* %.tmp7190)
br i1 %.tmp7191, label %.if.true.7192, label %.if.false.7192
.if.true.7192:
%.tmp7193 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7195 = getelementptr [34 x i8], [34 x i8]*@.str7194, i32 0, i32 0
%.tmp7196 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7193, i8* %.tmp7195)
ret i32 1
br label %.if.end.7192
.if.false.7192:
br label %.if.end.7192
.if.end.7192:
%.tmp7197 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7198 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7197)
%.tmp7199 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7200 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7199)
%llvm_code_size = alloca i32
store i32 %.tmp7200, i32* %llvm_code_size
%.tmp7201 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7201)
%.tmp7203 = getelementptr [30 x i8], [30 x i8]*@.str7202, i32 0, i32 0
%.tmp7205 = getelementptr [2 x i8], [2 x i8]*@.str7204, i32 0, i32 0
%.tmp7206 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7203, i8* %.tmp7205)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7206, %m0$.File.type** %proc
%.tmp7207 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7208 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7207)
%.tmp7209 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp7210 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7209)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7208, i32 %.tmp7210)
%.tmp7211 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7212 = icmp eq %m0$.File.type* %.tmp7211, null
br i1 %.tmp7212, label %.if.true.7213, label %.if.false.7213
.if.true.7213:
%.tmp7214 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7216 = getelementptr [28 x i8], [28 x i8]*@.str7215, i32 0, i32 0
%.tmp7217 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7214, i8* %.tmp7216)
ret i32 0
br label %.if.end.7213
.if.false.7213:
br label %.if.end.7213
.if.end.7213:
%.tmp7218 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7219 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7218)
%.tmp7220 = icmp ne i32 %.tmp7219, 0
br i1 %.tmp7220, label %.if.true.7221, label %.if.false.7221
.if.true.7221:
%.tmp7222 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7224 = getelementptr [24 x i8], [24 x i8]*@.str7223, i32 0, i32 0
%.tmp7225 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7222, i8* %.tmp7224)
ret i32 0
br label %.if.end.7221
.if.false.7221:
br label %.if.end.7221
.if.end.7221:
%.tmp7227 = getelementptr [17 x i8], [17 x i8]*@.str7226, i32 0, i32 0
%.tmp7229 = getelementptr [2 x i8], [2 x i8]*@.str7228, i32 0, i32 0
%.tmp7230 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7227, i8* %.tmp7229)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7230, %m0$.File.type** %gcc_proc
%.tmp7231 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp7232 = icmp eq %m0$.File.type* %.tmp7231, null
br i1 %.tmp7232, label %.if.true.7233, label %.if.false.7233
.if.true.7233:
%.tmp7234 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7236 = getelementptr [28 x i8], [28 x i8]*@.str7235, i32 0, i32 0
%.tmp7237 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7234, i8* %.tmp7236)
ret i32 0
br label %.if.end.7233
.if.false.7233:
br label %.if.end.7233
.if.end.7233:
%.tmp7238 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7239 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7238)
%.tmp7240 = icmp ne i32 %.tmp7239, 0
br i1 %.tmp7240, label %.if.true.7241, label %.if.false.7241
.if.true.7241:
%.tmp7242 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7244 = getelementptr [23 x i8], [23 x i8]*@.str7243, i32 0, i32 0
%.tmp7245 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7242, i8* %.tmp7244)
br label %.if.end.7241
.if.false.7241:
%.tmp7247 = getelementptr [32 x i8], [32 x i8]*@.str7246, i32 0, i32 0
%.tmp7248 = load i8*, i8** %filename
%.tmp7249 = call i32(i8*,...) @printf(i8* %.tmp7247, i8* %.tmp7248)
br label %.if.end.7241
.if.end.7241:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7250 = load i32, i32* %argc
%.tmp7251 = icmp eq i32 %.tmp7250, 2
br i1 %.tmp7251, label %.if.true.7252, label %.if.false.7252
.if.true.7252:
ret void
br label %.if.end.7252
.if.false.7252:
br label %.if.end.7252
.if.end.7252:
%.tmp7254 = getelementptr [21 x i8], [21 x i8]*@.str7253, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp7254, i8** %tmpl
%.tmp7255 = load i8**, i8*** %argv
%.tmp7256 = getelementptr i8*, i8** %.tmp7255, i32 0
%.tmp7257 = load i8*, i8** %.tmp7256
%.tmp7258 = call i32(i8*) @strlen(i8* %.tmp7257)
%.tmp7259 = load i8*, i8** %tmpl
%.tmp7260 = call i32(i8*) @strlen(i8* %.tmp7259)
%.tmp7261 = add i32 %.tmp7258, %.tmp7260
%len_filename = alloca i32
store i32 %.tmp7261, i32* %len_filename
%.tmp7262 = load i32, i32* %len_filename
%.tmp7263 = call i8*(i32) @malloc(i32 %.tmp7262)
%buf = alloca i8*
store i8* %.tmp7263, i8** %buf
%.tmp7264 = load i8*, i8** %buf
%.tmp7265 = load i8*, i8** %tmpl
%.tmp7266 = load i8**, i8*** %argv
%.tmp7267 = getelementptr i8*, i8** %.tmp7266, i32 0
%.tmp7268 = load i8*, i8** %.tmp7267
%.tmp7269 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7264, i8* %.tmp7265, i8* %.tmp7268)
%.tmp7270 = load i8*, i8** %buf
%.tmp7271 = call i32(i8*) @puts(i8* %.tmp7270)
%.tmp7272 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp7272)
call void(i32) @exit(i32 1)
ret void
}
@.str7179 = constant [2 x i8] c"w\00"
@.str7194 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7202 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7204 = constant [2 x i8] c"w\00"
@.str7215 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7223 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7226 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7228 = constant [2 x i8] c"w\00"
@.str7235 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7243 = constant [23 x i8] c"error on gcc execution\00"
@.str7246 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7253 = constant [21 x i8] c"Usage: %s <filename>\00"
