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
%m286$.Matcher.type = type {%m286$.Query.type*,i8,%m286$.Matcher.type*,%m286$.Matcher.type*}
%m286$.Rule.type = type {i8*,%m286$.Matcher.type*}
%m286$.ParsingContext.type = type {%m287$.Token.type*}
define %m286$.ParsingContext.type* @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp774 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* null, i32 1
%.tmp775 = ptrtoint %m286$.ParsingContext.type* %.tmp774 to i32
%.tmp776 = call i8*(i32) @malloc(i32 %.tmp775)
%.tmp777 = bitcast i8* %.tmp776 to %m286$.ParsingContext.type*
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp777, %m286$.ParsingContext.type** %ctx
%.tmp778 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp779 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp778)
%fd = alloca i32
store i32 %.tmp779, i32* %fd
%.tmp780 = load i32, i32* %fd
%.tmp781 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp780)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp781, %m209$.PeekerInfo.type** %p
%.tmp782 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp783 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp782, i1 0)
%token_list = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp783, %m287$.Token.type** %token_list
%.tmp784 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp785 = bitcast %m209$.PeekerInfo.type* %.tmp784 to i8*
call void(i8*) @free(i8* %.tmp785)
%.tmp786 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp787 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp786, i32 0, i32 0
%.tmp788 = load %m287$.Token.type*, %m287$.Token.type** %token_list
store %m287$.Token.type* %.tmp788, %m287$.Token.type** %.tmp787
%.tmp789 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
ret %m286$.ParsingContext.type* %.tmp789
}
define %m286$.Matcher.type* @m286$new_matcher.m286$.Matcher.typep() {
%.tmp790 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* null, i32 1
%.tmp791 = ptrtoint %m286$.Matcher.type* %.tmp790 to i32
%.tmp792 = call i8*(i32) @malloc(i32 %.tmp791)
%.tmp793 = bitcast i8* %.tmp792 to %m286$.Matcher.type*
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp793, %m286$.Matcher.type** %m
%.tmp794 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp795 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp794, i32 0, i32 1
store i8 49, i8* %.tmp795
%.tmp796 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp797 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp796, i32 0, i32 2
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp797
%.tmp798 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp799 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp798, i32 0, i32 3
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp799
%.tmp800 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp801 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp800, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp801
%.tmp802 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp802
}
define %m286$.Matcher.type* @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%m = alloca %m286$.Matcher.type*
%.tmp803 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp804 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp803, i32 0, i32 0
%.tmp805 = load %m287$.Token.type*, %m287$.Token.type** %.tmp804
%.tmp806 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp805, i32 0, i32 1
%.tmp807 = load i8*, i8** %.tmp806
%.tmp809 = getelementptr [2 x i8], [2 x i8]*@.str808, i32 0, i32 0
%.tmp810 = call i32(i8*,i8*) @strcmp(i8* %.tmp807, i8* %.tmp809)
%.tmp811 = icmp eq i32 %.tmp810, 0
br i1 %.tmp811, label %.if.true.812, label %.if.false.812
.if.true.812:
%.tmp813 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp814 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp813, i32 0, i32 0
%.tmp815 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp816 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp815, i32 0, i32 0
%.tmp817 = load %m287$.Token.type*, %m287$.Token.type** %.tmp816
%.tmp818 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp817, i32 0, i32 5
%.tmp819 = load %m287$.Token.type*, %m287$.Token.type** %.tmp818
store %m287$.Token.type* %.tmp819, %m287$.Token.type** %.tmp814
%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp820 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp821 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp820)
store %m286$.Matcher.type* %.tmp821, %m286$.Matcher.type** %m
%.tmp822 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp823 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp822, i32 0, i32 0
%.tmp824 = load %m287$.Token.type*, %m287$.Token.type** %.tmp823
%.tmp825 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp824, i32 0, i32 1
%.tmp826 = load i8*, i8** %.tmp825
%.tmp828 = getelementptr [2 x i8], [2 x i8]*@.str827, i32 0, i32 0
%.tmp829 = call i32(i8*,i8*) @strcmp(i8* %.tmp826, i8* %.tmp828)
%.tmp830 = icmp eq i32 %.tmp829, 0
br i1 %.tmp830, label %.if.true.831, label %.if.false.831
.if.true.831:
%.tmp832 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp833 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp832, i32 0, i32 0
%.tmp834 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp835 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp834, i32 0, i32 0
%.tmp836 = load %m287$.Token.type*, %m287$.Token.type** %.tmp835
%.tmp837 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp836, i32 0, i32 5
%.tmp838 = load %m287$.Token.type*, %m287$.Token.type** %.tmp837
store %m287$.Token.type* %.tmp838, %m287$.Token.type** %.tmp833
%.tmp839 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%last_matcher = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp839, %m286$.Matcher.type** %last_matcher
br label %.for.start.840
.for.start.840:
%.tmp841 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp842 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp841, i32 0, i32 0
%.tmp843 = load %m287$.Token.type*, %m287$.Token.type** %.tmp842
%.tmp844 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp843, i32 0, i32 1
%.tmp845 = load i8*, i8** %.tmp844
%.tmp847 = getelementptr [2 x i8], [2 x i8]*@.str846, i32 0, i32 0
%.tmp848 = call i32(i8*,i8*) @strcmp(i8* %.tmp845, i8* %.tmp847)
%.tmp849 = icmp ne i32 %.tmp848, 0
%.tmp850 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp851 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp850, i32 0, i32 0
%.tmp852 = load %m287$.Token.type*, %m287$.Token.type** %.tmp851
%.tmp853 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp852, i32 0, i32 0
%.tmp854 = load i8*, i8** %.tmp853
%.tmp856 = getelementptr [4 x i8], [4 x i8]*@.str855, i32 0, i32 0
%.tmp857 = call i32(i8*,i8*) @strcmp(i8* %.tmp854, i8* %.tmp856)
%.tmp858 = icmp ne i32 %.tmp857, 0
%.tmp859 = and i1 %.tmp849, %.tmp858
br i1 %.tmp859, label %.for.continue.840, label %.for.end.840
.for.continue.840:
%.tmp860 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp861 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp860, i32 0, i32 2
%.tmp862 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp863 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp862)
store %m286$.Matcher.type* %.tmp863, %m286$.Matcher.type** %.tmp861
%.tmp864 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp865 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp864, i32 0, i32 2
%.tmp866 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp865
store %m286$.Matcher.type* %.tmp866, %m286$.Matcher.type** %last_matcher
%.tmp867 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp868 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp867, i32 0, i32 0
%.tmp869 = load %m287$.Token.type*, %m287$.Token.type** %.tmp868
%.tmp870 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp869, i32 0, i32 1
%.tmp871 = load i8*, i8** %.tmp870
%.tmp873 = getelementptr [2 x i8], [2 x i8]*@.str872, i32 0, i32 0
%.tmp874 = call i32(i8*,i8*) @strcmp(i8* %.tmp871, i8* %.tmp873)
%.tmp875 = icmp ne i32 %.tmp874, 0
%.tmp876 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp877 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp876, i32 0, i32 0
%.tmp878 = load %m287$.Token.type*, %m287$.Token.type** %.tmp877
%.tmp879 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp878, i32 0, i32 1
%.tmp880 = load i8*, i8** %.tmp879
%.tmp882 = getelementptr [2 x i8], [2 x i8]*@.str881, i32 0, i32 0
%.tmp883 = call i32(i8*,i8*) @strcmp(i8* %.tmp880, i8* %.tmp882)
%.tmp884 = icmp ne i32 %.tmp883, 0
%.tmp885 = and i1 %.tmp875, %.tmp884
br i1 %.tmp885, label %.if.true.886, label %.if.false.886
.if.true.886:
%.tmp888 = getelementptr [48 x i8], [48 x i8]*@.str887, i32 0, i32 0
%.tmp889 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp890 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp889, i32 0, i32 0
%.tmp891 = load %m287$.Token.type*, %m287$.Token.type** %.tmp890
%.tmp892 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp891, i32 0, i32 2
%.tmp893 = load i32, i32* %.tmp892
%.tmp894 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp895 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp894, i32 0, i32 0
%.tmp896 = load %m287$.Token.type*, %m287$.Token.type** %.tmp895
%.tmp897 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp896, i32 0, i32 3
%.tmp898 = load i32, i32* %.tmp897
%.tmp899 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp900 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp899, i32 0, i32 0
%.tmp901 = load %m287$.Token.type*, %m287$.Token.type** %.tmp900
%.tmp902 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp901, i32 0, i32 1
%.tmp903 = load i8*, i8** %.tmp902
%.tmp904 = call i32(i8*,...) @printf(i8* %.tmp888, i32 %.tmp893, i32 %.tmp898, i8* %.tmp903)
call void(i32) @exit(i32 1)
br label %.if.end.886
.if.false.886:
br label %.if.end.886
.if.end.886:
%.tmp905 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp906 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp905, i32 0, i32 0
%.tmp907 = load %m287$.Token.type*, %m287$.Token.type** %.tmp906
%.tmp908 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp907, i32 0, i32 1
%.tmp909 = load i8*, i8** %.tmp908
%.tmp911 = getelementptr [2 x i8], [2 x i8]*@.str910, i32 0, i32 0
%.tmp912 = call i32(i8*,i8*) @strcmp(i8* %.tmp909, i8* %.tmp911)
%.tmp913 = icmp eq i32 %.tmp912, 0
br i1 %.tmp913, label %.if.true.914, label %.if.false.914
.if.true.914:
%.tmp915 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp916 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp915, i32 0, i32 0
%.tmp917 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp918 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp917, i32 0, i32 0
%.tmp919 = load %m287$.Token.type*, %m287$.Token.type** %.tmp918
%.tmp920 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp919, i32 0, i32 5
%.tmp921 = load %m287$.Token.type*, %m287$.Token.type** %.tmp920
store %m287$.Token.type* %.tmp921, %m287$.Token.type** %.tmp916
br label %.if.end.914
.if.false.914:
br label %.if.end.914
.if.end.914:
br label %.for.start.840
.for.end.840:
br label %.if.end.831
.if.false.831:
br label %.if.end.831
.if.end.831:
%.tmp922 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp923 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp922, i32 0, i32 0
%.tmp924 = load %m287$.Token.type*, %m287$.Token.type** %.tmp923
%.tmp925 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp924, i32 0, i32 1
%.tmp926 = load i8*, i8** %.tmp925
%.tmp928 = getelementptr [2 x i8], [2 x i8]*@.str927, i32 0, i32 0
%.tmp929 = call i32(i8*,i8*) @strcmp(i8* %.tmp926, i8* %.tmp928)
%.tmp930 = icmp ne i32 %.tmp929, 0
br i1 %.tmp930, label %.if.true.931, label %.if.false.931
.if.true.931:
%.tmp932 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp934 = getelementptr [22 x i8], [22 x i8]*@.str933, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp932, i8* %.tmp934)
br label %.if.end.931
.if.false.931:
br label %.if.end.931
.if.end.931:
%.tmp935 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp936 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp935, i32 0, i32 0
%.tmp937 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp938 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp937, i32 0, i32 0
%.tmp939 = load %m287$.Token.type*, %m287$.Token.type** %.tmp938
%.tmp940 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp939, i32 0, i32 5
%.tmp941 = load %m287$.Token.type*, %m287$.Token.type** %.tmp940
store %m287$.Token.type* %.tmp941, %m287$.Token.type** %.tmp936
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
%.tmp959 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp960 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp959, i32 0, i32 1
store i8 43, i8* %.tmp960
br label %.if.end.951
.if.false.951:
%.tmp961 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp962 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp961, i32 0, i32 0
%.tmp963 = load %m287$.Token.type*, %m287$.Token.type** %.tmp962
%.tmp964 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp963, i32 0, i32 1
%.tmp965 = load i8*, i8** %.tmp964
%.tmp967 = getelementptr [2 x i8], [2 x i8]*@.str966, i32 0, i32 0
%.tmp968 = call i32(i8*,i8*) @strcmp(i8* %.tmp965, i8* %.tmp967)
%.tmp969 = icmp eq i32 %.tmp968, 0
br i1 %.tmp969, label %.if.true.970, label %.if.false.970
.if.true.970:
%.tmp971 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp972 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp971, i32 0, i32 0
%.tmp973 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp974 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp973, i32 0, i32 0
%.tmp975 = load %m287$.Token.type*, %m287$.Token.type** %.tmp974
%.tmp976 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp975, i32 0, i32 5
%.tmp977 = load %m287$.Token.type*, %m287$.Token.type** %.tmp976
store %m287$.Token.type* %.tmp977, %m287$.Token.type** %.tmp972
%.tmp978 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp979 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp978, i32 0, i32 1
store i8 42, i8* %.tmp979
br label %.if.end.970
.if.false.970:
%.tmp980 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp981 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp980, i32 0, i32 0
%.tmp982 = load %m287$.Token.type*, %m287$.Token.type** %.tmp981
%.tmp983 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp982, i32 0, i32 1
%.tmp984 = load i8*, i8** %.tmp983
%.tmp986 = getelementptr [2 x i8], [2 x i8]*@.str985, i32 0, i32 0
%.tmp987 = call i32(i8*,i8*) @strcmp(i8* %.tmp984, i8* %.tmp986)
%.tmp988 = icmp eq i32 %.tmp987, 0
br i1 %.tmp988, label %.if.true.989, label %.if.false.989
.if.true.989:
%.tmp990 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp991 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp990, i32 0, i32 0
%.tmp992 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp993 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp992, i32 0, i32 0
%.tmp994 = load %m287$.Token.type*, %m287$.Token.type** %.tmp993
%.tmp995 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp994, i32 0, i32 5
%.tmp996 = load %m287$.Token.type*, %m287$.Token.type** %.tmp995
store %m287$.Token.type* %.tmp996, %m287$.Token.type** %.tmp991
%.tmp997 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp998 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp997, i32 0, i32 1
store i8 63, i8* %.tmp998
br label %.if.end.989
.if.false.989:
br label %.if.end.989
.if.end.989:
br label %.if.end.970
.if.end.970:
br label %.if.end.951
.if.end.951:
br label %.if.end.812
.if.false.812:
%.tmp999 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1000 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp999)
store %m286$.Matcher.type* %.tmp1000, %m286$.Matcher.type** %m
br label %.if.end.812
.if.end.812:
%.tmp1001 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1002 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1001, i32 0, i32 0
%.tmp1003 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1002
%.tmp1004 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1003, i32 0, i32 1
%.tmp1005 = load i8*, i8** %.tmp1004
%.tmp1007 = getelementptr [2 x i8], [2 x i8]*@.str1006, i32 0, i32 0
%.tmp1008 = call i32(i8*,i8*) @strcmp(i8* %.tmp1005, i8* %.tmp1007)
%.tmp1009 = icmp eq i32 %.tmp1008, 0
%.tmp1010 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1011 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1010, i32 0, i32 0
%.tmp1012 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1011
%.tmp1013 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1012, i32 0, i32 0
%.tmp1014 = load i8*, i8** %.tmp1013
%.tmp1016 = getelementptr [5 x i8], [5 x i8]*@.str1015, i32 0, i32 0
%.tmp1017 = call i32(i8*,i8*) @strcmp(i8* %.tmp1014, i8* %.tmp1016)
%.tmp1018 = icmp eq i32 %.tmp1017, 0
%.tmp1019 = or i1 %.tmp1009, %.tmp1018
br i1 %.tmp1019, label %.if.true.1020, label %.if.false.1020
.if.true.1020:
%.tmp1021 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1022 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1021, i32 0, i32 3
%.tmp1023 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1024 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1023)
store %m286$.Matcher.type* %.tmp1024, %m286$.Matcher.type** %.tmp1022
br label %.if.end.1020
.if.false.1020:
br label %.if.end.1020
.if.end.1020:
%.tmp1025 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1025
}
define %m286$.Matcher.type* @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1026 = call %m286$.Matcher.type*() @m286$new_matcher.m286$.Matcher.typep()
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp1026, %m286$.Matcher.type** %m
%count = alloca i32
%.tmp1027 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1028 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1027, i32 0, i32 0
%.tmp1029 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1028
%ptr = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1029, %m287$.Token.type** %ptr
store i32 0, i32* %count
br label %.for.start.1030
.for.start.1030:
%.tmp1031 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1032 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1031, i32 0, i32 0
%.tmp1033 = load i8*, i8** %.tmp1032
%.tmp1035 = getelementptr [5 x i8], [5 x i8]*@.str1034, i32 0, i32 0
%.tmp1036 = call i32(i8*,i8*) @strcmp(i8* %.tmp1033, i8* %.tmp1035)
%.tmp1037 = icmp eq i32 %.tmp1036, 0
%.tmp1038 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1039 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1038, i32 0, i32 0
%.tmp1040 = load i8*, i8** %.tmp1039
%.tmp1042 = getelementptr [7 x i8], [7 x i8]*@.str1041, i32 0, i32 0
%.tmp1043 = call i32(i8*,i8*) @strcmp(i8* %.tmp1040, i8* %.tmp1042)
%.tmp1044 = icmp eq i32 %.tmp1043, 0
%.tmp1045 = or i1 %.tmp1037, %.tmp1044
br i1 %.tmp1045, label %.for.continue.1030, label %.for.end.1030
.for.continue.1030:
%.tmp1046 = load i32, i32* %count
%.tmp1047 = add i32 %.tmp1046, 1
store i32 %.tmp1047, i32* %count
%.tmp1048 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1049 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1048, i32 0, i32 5
%.tmp1050 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1049
store %m287$.Token.type* %.tmp1050, %m287$.Token.type** %ptr
br label %.for.start.1030
.for.end.1030:
%.tmp1051 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1052 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1051, i32 0, i32 0
%.tmp1053 = getelementptr %m286$.Query.type, %m286$.Query.type* null, i32 1
%.tmp1054 = ptrtoint %m286$.Query.type* %.tmp1053 to i32
%.tmp1055 = call i8*(i32) @malloc(i32 %.tmp1054)
%.tmp1056 = bitcast i8* %.tmp1055 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1056, %m286$.Query.type** %.tmp1052
%.tmp1057 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1058 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1057, i32 0, i32 0
%.tmp1059 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1058
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1059, %m286$.Query.type** %q
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1060
.for.start.1060:
%.tmp1061 = load i32, i32* %i
%.tmp1062 = load i32, i32* %count
%.tmp1063 = icmp slt i32 %.tmp1061, %.tmp1062
br i1 %.tmp1063, label %.for.continue.1060, label %.for.end.1060
.for.continue.1060:
%.tmp1064 = load i32, i32* %i
%.tmp1065 = icmp sgt i32 %.tmp1064, 0
br i1 %.tmp1065, label %.if.true.1066, label %.if.false.1066
.if.true.1066:
%.tmp1067 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1068 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1067, i32 0, i32 2
%.tmp1069 = getelementptr %m286$.Query.type, %m286$.Query.type* null, i32 1
%.tmp1070 = ptrtoint %m286$.Query.type* %.tmp1069 to i32
%.tmp1071 = call i8*(i32) @malloc(i32 %.tmp1070)
%.tmp1072 = bitcast i8* %.tmp1071 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1072, %m286$.Query.type** %.tmp1068
%.tmp1073 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1074 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1073, i32 0, i32 2
%.tmp1075 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1074
store %m286$.Query.type* %.tmp1075, %m286$.Query.type** %q
br label %.if.end.1066
.if.false.1066:
br label %.if.end.1066
.if.end.1066:
%.tmp1076 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1077 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1076, i32 0, i32 0
%.tmp1078 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1077
%.tmp1079 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1078, i32 0, i32 0
%.tmp1080 = load i8*, i8** %.tmp1079
%.tmp1082 = getelementptr [7 x i8], [7 x i8]*@.str1081, i32 0, i32 0
%.tmp1083 = call i32(i8*,i8*) @strcmp(i8* %.tmp1080, i8* %.tmp1082)
%.tmp1084 = icmp eq i32 %.tmp1083, 0
br i1 %.tmp1084, label %.if.true.1085, label %.if.false.1085
.if.true.1085:
%.tmp1086 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1087 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1086, i32 0, i32 0
store i8 118, i8* %.tmp1087
br label %.if.end.1085
.if.false.1085:
%.tmp1088 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1089 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1088, i32 0, i32 0
%.tmp1090 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1089
%.tmp1091 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1090, i32 0, i32 1
%.tmp1092 = load i8*, i8** %.tmp1091
%.tmp1093 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1092)
br i1 %.tmp1093, label %.if.true.1094, label %.if.false.1094
.if.true.1094:
%.tmp1095 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1096 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1095, i32 0, i32 0
store i8 97, i8* %.tmp1096
br label %.if.end.1094
.if.false.1094:
%.tmp1097 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1098 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1097, i32 0, i32 0
%.tmp1099 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1098
%.tmp1100 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1099, i32 0, i32 1
%.tmp1101 = load i8*, i8** %.tmp1100
%.tmp1102 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1101)
br i1 %.tmp1102, label %.if.true.1103, label %.if.false.1103
.if.true.1103:
%.tmp1104 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1105 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1104, i32 0, i32 0
store i8 116, i8* %.tmp1105
br label %.if.end.1103
.if.false.1103:
%.tmp1107 = getelementptr [17 x i8], [17 x i8]*@.str1106, i32 0, i32 0
%.tmp1108 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1109 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1108, i32 0, i32 0
%.tmp1110 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1109
%.tmp1111 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1110, i32 0, i32 1
%.tmp1112 = load i8*, i8** %.tmp1111
%.tmp1113 = call i32(i8*,...) @printf(i8* %.tmp1107, i8* %.tmp1112)
%.tmp1114 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1116 = getelementptr [50 x i8], [50 x i8]*@.str1115, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1114, i8* %.tmp1116)
br label %.if.end.1103
.if.end.1103:
br label %.if.end.1094
.if.end.1094:
br label %.if.end.1085
.if.end.1085:
%.tmp1117 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1118 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1117, i32 0, i32 1
%.tmp1119 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1120 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1119, i32 0, i32 0
%.tmp1121 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1120
%.tmp1122 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1121, i32 0, i32 1
%.tmp1123 = load i8*, i8** %.tmp1122
store i8* %.tmp1123, i8** %.tmp1118
%.tmp1124 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1125 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1124, i32 0, i32 2
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1125
%.tmp1126 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1127 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1126, i32 0, i32 0
%.tmp1128 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1129 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1128, i32 0, i32 0
%.tmp1130 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1129
%.tmp1131 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1130, i32 0, i32 5
%.tmp1132 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1131
store %m287$.Token.type* %.tmp1132, %m287$.Token.type** %.tmp1127
%.tmp1133 = load i32, i32* %i
%.tmp1134 = add i32 %.tmp1133, 1
store i32 %.tmp1134, i32* %i
br label %.for.start.1060
.for.end.1060:
%.tmp1135 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1135
}
define %m286$.Rule.type* @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1136 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1137 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1136, i32 0, i32 0
%.tmp1138 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1137
%.tmp1139 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1138, i32 0, i32 1
%.tmp1140 = load i8*, i8** %.tmp1139
%rule_name = alloca i8*
store i8* %.tmp1140, i8** %rule_name
%.tmp1141 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1142 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1141, i32 0, i32 0
%.tmp1143 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1142
%.tmp1144 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1143, i32 0, i32 0
%.tmp1145 = load i8*, i8** %.tmp1144
%.tmp1147 = getelementptr [5 x i8], [5 x i8]*@.str1146, i32 0, i32 0
%.tmp1148 = call i32(i8*,i8*) @strcmp(i8* %.tmp1145, i8* %.tmp1147)
%.tmp1149 = icmp ne i32 %.tmp1148, 0
br i1 %.tmp1149, label %.if.true.1150, label %.if.false.1150
.if.true.1150:
%.tmp1152 = getelementptr [37 x i8], [37 x i8]*@.str1151, i32 0, i32 0
%.tmp1153 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1154 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1153, i32 0, i32 0
%.tmp1155 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1154
%.tmp1156 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1155, i32 0, i32 0
%.tmp1157 = load i8*, i8** %.tmp1156
%.tmp1158 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1159 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1158, i32 0, i32 0
%.tmp1160 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1159
%.tmp1161 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1160, i32 0, i32 1
%.tmp1162 = load i8*, i8** %.tmp1161
%.tmp1163 = call i32(i8*,...) @printf(i8* %.tmp1152, i8* %.tmp1157, i8* %.tmp1162)
%.tmp1164 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1166 = getelementptr [31 x i8], [31 x i8]*@.str1165, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1164, i8* %.tmp1166)
br label %.if.end.1150
.if.false.1150:
br label %.if.end.1150
.if.end.1150:
%.tmp1167 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1168 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1167, i32 0, i32 0
%.tmp1169 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1170 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1169, i32 0, i32 0
%.tmp1171 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1170
%.tmp1172 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1171, i32 0, i32 5
%.tmp1173 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1172
store %m287$.Token.type* %.tmp1173, %m287$.Token.type** %.tmp1168
%.tmp1174 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1175 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1174, i32 0, i32 0
%.tmp1176 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1175
%.tmp1177 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1176, i32 0, i32 1
%.tmp1178 = load i8*, i8** %.tmp1177
%.tmp1180 = getelementptr [2 x i8], [2 x i8]*@.str1179, i32 0, i32 0
%.tmp1181 = call i32(i8*,i8*) @strcmp(i8* %.tmp1178, i8* %.tmp1180)
%.tmp1182 = icmp ne i32 %.tmp1181, 0
br i1 %.tmp1182, label %.if.true.1183, label %.if.false.1183
.if.true.1183:
%.tmp1184 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1185 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1184, i32 0, i32 0
%.tmp1186 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1185
%.tmp1187 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1186, i32 0, i32 1
%.tmp1188 = load i8*, i8** %.tmp1187
%.tmp1189 = call i32(i8*,...) @printf(i8* %.tmp1188)
%.tmp1190 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1192 = getelementptr [27 x i8], [27 x i8]*@.str1191, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1190, i8* %.tmp1192)
br label %.if.end.1183
.if.false.1183:
br label %.if.end.1183
.if.end.1183:
%.tmp1193 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1194 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1193, i32 0, i32 0
%.tmp1195 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1196 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1195, i32 0, i32 0
%.tmp1197 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1196
%.tmp1198 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1197, i32 0, i32 5
%.tmp1199 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1198
store %m287$.Token.type* %.tmp1199, %m287$.Token.type** %.tmp1194
%.tmp1200 = getelementptr %m286$.Rule.type, %m286$.Rule.type* null, i32 1
%.tmp1201 = ptrtoint %m286$.Rule.type* %.tmp1200 to i32
%.tmp1202 = call i8*(i32) @malloc(i32 %.tmp1201)
%.tmp1203 = bitcast i8* %.tmp1202 to %m286$.Rule.type*
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1203, %m286$.Rule.type** %rule
%.tmp1204 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1205 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1204, i32 0, i32 0
%.tmp1206 = load i8*, i8** %rule_name
store i8* %.tmp1206, i8** %.tmp1205
%.tmp1207 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1208 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1207, i32 0, i32 1
%.tmp1209 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1210 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1209)
store %m286$.Matcher.type* %.tmp1210, %m286$.Matcher.type** %.tmp1208
%.tmp1211 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1211
}
define void @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1212 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1213 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1212, i32 0, i32 0
%.tmp1214 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1213
%.tmp1215 = load i8*, i8** %error
%.tmp1216 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1214, i8* %.tmp1215)
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1216, %m717$.Error.type** %e
%.tmp1217 = load %m717$.Error.type*, %m717$.Error.type** %e
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp1217)
call void(i32) @exit(i32 1)
ret void
}
define %m286$.Rule.type** @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%max_rules = alloca i32
store i32 40, i32* %max_rules
%.tmp1218 = load i32, i32* @ptr_size
%.tmp1219 = load i32, i32* %max_rules
%.tmp1220 = mul i32 %.tmp1218, %.tmp1219
%.tmp1221 = call i8*(i32) @malloc(i32 %.tmp1220)
%.tmp1222 = bitcast i8* %.tmp1221 to %m286$.Rule.type**
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp1222, %m286$.Rule.type*** %grammar
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1223
.for.start.1223:
%.tmp1224 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1225 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1224, i32 0, i32 0
%.tmp1226 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1225
%.tmp1227 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1226, i32 0, i32 0
%.tmp1228 = load i8*, i8** %.tmp1227
%.tmp1230 = getelementptr [4 x i8], [4 x i8]*@.str1229, i32 0, i32 0
%.tmp1231 = call i32(i8*,i8*) @strcmp(i8* %.tmp1228, i8* %.tmp1230)
%.tmp1232 = icmp ne i32 %.tmp1231, 0
br i1 %.tmp1232, label %.for.continue.1223, label %.for.end.1223
.for.continue.1223:
%.tmp1233 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1234 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1233, i32 0, i32 0
%.tmp1235 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1234
%.tmp1236 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1235, i32 0, i32 0
%.tmp1237 = load i8*, i8** %.tmp1236
%.tmp1239 = getelementptr [3 x i8], [3 x i8]*@.str1238, i32 0, i32 0
%.tmp1240 = call i32(i8*,i8*) @strcmp(i8* %.tmp1237, i8* %.tmp1239)
%.tmp1241 = icmp ne i32 %.tmp1240, 0
br i1 %.tmp1241, label %.if.true.1242, label %.if.false.1242
.if.true.1242:
%.tmp1243 = load i32, i32* %i
%.tmp1244 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1245 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1244, i32 %.tmp1243
%.tmp1246 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1247 = call %m286$.Rule.type*(%m286$.ParsingContext.type*) @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1246)
store %m286$.Rule.type* %.tmp1247, %m286$.Rule.type** %.tmp1245
%.tmp1248 = load i32, i32* %i
%.tmp1249 = add i32 %.tmp1248, 1
store i32 %.tmp1249, i32* %i
br label %.if.end.1242
.if.false.1242:
%.tmp1250 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1251 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1250, i32 0, i32 0
%.tmp1252 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1253 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1252, i32 0, i32 0
%.tmp1254 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1253
%.tmp1255 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1254, i32 0, i32 5
%.tmp1256 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1255
store %m287$.Token.type* %.tmp1256, %m287$.Token.type** %.tmp1251
br label %.if.end.1242
.if.end.1242:
br label %.for.start.1223
.for.end.1223:
%.tmp1257 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1258 = bitcast %m286$.Rule.type** %.tmp1257 to %m286$.Rule.type**
ret %m286$.Rule.type** %.tmp1258
}
%m286$.Node.type = type {i8*,i8*,i8*,i32,i32,%m286$.Node.type*,%m286$.Node.type*,%m286$.Node.type*}
define %m286$.Node.type* @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1259 = getelementptr %m286$.Node.type, %m286$.Node.type* null, i32 1
%.tmp1260 = ptrtoint %m286$.Node.type* %.tmp1259 to i32
%.tmp1261 = call i8*(i32) @malloc(i32 %.tmp1260)
%.tmp1262 = bitcast i8* %.tmp1261 to %m286$.Node.type*
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1262, %m286$.Node.type** %node
%.tmp1263 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1264 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1263, i32 0, i32 0
%.tmp1265 = load i8*, i8** %type
store i8* %.tmp1265, i8** %.tmp1264
%.tmp1266 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1267 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1266, i32 0, i32 1
%.tmp1268 = load i8*, i8** %value
store i8* %.tmp1268, i8** %.tmp1267
%.tmp1269 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1270 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1269, i32 0, i32 3
%.tmp1271 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1272 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1271, i32 0, i32 2
%.tmp1273 = load i32, i32* %.tmp1272
store i32 %.tmp1273, i32* %.tmp1270
%.tmp1274 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1275 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1274, i32 0, i32 2
%.tmp1276 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1277 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1276, i32 0, i32 4
%.tmp1278 = load i8*, i8** %.tmp1277
store i8* %.tmp1278, i8** %.tmp1275
%.tmp1279 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1280 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1279, i32 0, i32 4
%.tmp1281 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1282 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1281, i32 0, i32 3
%.tmp1283 = load i32, i32* %.tmp1282
store i32 %.tmp1283, i32* %.tmp1280
%.tmp1284 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1285 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1284, i32 0, i32 5
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1285
%.tmp1286 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1287 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1286, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1287
%.tmp1288 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1289 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1288, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1289
%.tmp1290 = load %m286$.Node.type*, %m286$.Node.type** %node
ret %m286$.Node.type* %.tmp1290
}
define void @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.parent.arg, %m286$.Node.type* %.child.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%child = alloca %m286$.Node.type*
store %m286$.Node.type* %.child.arg, %m286$.Node.type** %child
%.tmp1291 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1292 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1291, i32 0, i32 6
%.tmp1293 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1292
%.tmp1294 = icmp eq %m286$.Node.type* %.tmp1293, null
br i1 %.tmp1294, label %.if.true.1295, label %.if.false.1295
.if.true.1295:
%.tmp1296 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1297 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1296, i32 0, i32 6
%.tmp1298 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1298, %m286$.Node.type** %.tmp1297
br label %.if.end.1295
.if.false.1295:
%.tmp1299 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1300 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1299, i32 0, i32 6
%.tmp1301 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1300
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1301, %m286$.Node.type** %c
br label %.for.start.1302
.for.start.1302:
%.tmp1303 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1304 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1303, i32 0, i32 7
%.tmp1305 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1304
%.tmp1306 = icmp ne %m286$.Node.type* %.tmp1305, null
br i1 %.tmp1306, label %.for.continue.1302, label %.for.end.1302
.for.continue.1302:
%.tmp1307 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1308 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1307, i32 0, i32 7
%.tmp1309 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1308
store %m286$.Node.type* %.tmp1309, %m286$.Node.type** %c
br label %.for.start.1302
.for.end.1302:
%.tmp1310 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1311 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1310, i32 0, i32 7
%.tmp1312 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1312, %m286$.Node.type** %.tmp1311
br label %.if.end.1295
.if.end.1295:
%.tmp1313 = load %m286$.Node.type*, %m286$.Node.type** %child
%.tmp1314 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1313, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1314
ret void
}
define void @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.parent.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%.tmp1315 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1316 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1315, i32 0, i32 6
%.tmp1317 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1316
%.tmp1318 = icmp eq %m286$.Node.type* %.tmp1317, null
br i1 %.tmp1318, label %.if.true.1319, label %.if.false.1319
.if.true.1319:
ret void
br label %.if.end.1319
.if.false.1319:
br label %.if.end.1319
.if.end.1319:
%.tmp1320 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1321 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1320, i32 0, i32 6
%.tmp1322 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1321
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1322, %m286$.Node.type** %c
%.tmp1323 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1324 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1323, i32 0, i32 7
%.tmp1325 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1324
%.tmp1326 = icmp eq %m286$.Node.type* %.tmp1325, null
br i1 %.tmp1326, label %.if.true.1327, label %.if.false.1327
.if.true.1327:
%.tmp1328 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1329 = bitcast %m286$.Node.type* %.tmp1328 to i8*
call void(i8*) @free(i8* %.tmp1329)
%.tmp1330 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1331 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1330, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1331
ret void
br label %.if.end.1327
.if.false.1327:
br label %.if.end.1327
.if.end.1327:
br label %.for.start.1332
.for.start.1332:
%.tmp1333 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1334 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1333, i32 0, i32 7
%.tmp1335 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1334
%.tmp1336 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1335, i32 0, i32 7
%.tmp1337 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1336
%.tmp1338 = icmp ne %m286$.Node.type* %.tmp1337, null
br i1 %.tmp1338, label %.for.continue.1332, label %.for.end.1332
.for.continue.1332:
%.tmp1339 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1340 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1339, i32 0, i32 7
%.tmp1341 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1340
store %m286$.Node.type* %.tmp1341, %m286$.Node.type** %c
br label %.for.start.1332
.for.end.1332:
%.tmp1342 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1343 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1342, i32 0, i32 7
%.tmp1344 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1343
%.tmp1345 = bitcast %m286$.Node.type* %.tmp1344 to i8*
call void(i8*) @free(i8* %.tmp1345)
%.tmp1346 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1347 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1346, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1347
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
br label %.for.start.1348
.for.start.1348:
br i1 1, label %.for.continue.1348, label %.for.end.1348
.for.continue.1348:
%.tmp1349 = load i32, i32* %i
%.tmp1350 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1351 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1350, i32 %.tmp1349
%.tmp1352 = load %m286$.Rule.type*, %m286$.Rule.type** %.tmp1351
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1352, %m286$.Rule.type** %rule
%.tmp1353 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1354 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1353, i32 0, i32 0
%.tmp1355 = load i8*, i8** %.tmp1354
%.tmp1356 = load i8*, i8** %rule_name
%.tmp1357 = call i32(i8*,i8*) @strcmp(i8* %.tmp1355, i8* %.tmp1356)
%.tmp1358 = icmp eq i32 %.tmp1357, 0
br i1 %.tmp1358, label %.if.true.1359, label %.if.false.1359
.if.true.1359:
%.tmp1360 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1360
br label %.if.end.1359
.if.false.1359:
br label %.if.end.1359
.if.end.1359:
%.tmp1361 = load i32, i32* %i
%.tmp1362 = add i32 %.tmp1361, 1
store i32 %.tmp1362, i32* %i
br label %.for.start.1348
.for.end.1348:
%.tmp1363 = bitcast ptr null to %m286$.Rule.type*
ret %m286$.Rule.type* %.tmp1363
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
%.tmp1364 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1365 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1364, i32 0, i32 0
%.tmp1366 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1365
%start_token = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1366, %m287$.Token.type** %start_token
%new_children = alloca i32
store i32 0, i32* %new_children
%.tmp1367 = bitcast ptr null to %m717$.Error.type*
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1367, %m717$.Error.type** %err
%.tmp1369 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1370 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1369, i32 0, i32 0
%.tmp1371 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1370
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1371, %m286$.Query.type** %q
br label %.for.start.1368
.for.start.1368:
%.tmp1372 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1373 = icmp ne %m286$.Query.type* %.tmp1372, null
%.tmp1374 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1375 = icmp eq %m717$.Error.type* %.tmp1374, null
%.tmp1376 = and i1 %.tmp1373, %.tmp1375
br i1 %.tmp1376, label %.for.continue.1368, label %.for.end.1368
.for.continue.1368:
%.tmp1377 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1378 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1377, i32 0, i32 0
%.tmp1379 = load i8, i8* %.tmp1378
%.tmp1380 = icmp eq i8 %.tmp1379, 118
br i1 %.tmp1380, label %.if.true.1381, label %.if.false.1381
.if.true.1381:
%.tmp1382 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1383 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1382, i32 0, i32 1
%.tmp1384 = load i8*, i8** %.tmp1383
%.tmp1385 = call i32(i8*) @strlen(i8* %.tmp1384)
%.tmp1386 = sub i32 %.tmp1385, 2
%qv_len = alloca i32
store i32 %.tmp1386, i32* %qv_len
%.tmp1387 = load i32, i32* %qv_len
%.tmp1388 = add i32 %.tmp1387, 1
%.tmp1389 = call i8*(i32) @malloc(i32 %.tmp1388)
%tmp_buff = alloca i8*
store i8* %.tmp1389, i8** %tmp_buff
%.tmp1390 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1391 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1390, i32 0, i32 1
%.tmp1392 = load i8*, i8** %.tmp1391
%.tmp1394 = getelementptr [8 x i8], [8 x i8]*@.str1393, i32 0, i32 0
%.tmp1395 = load i8*, i8** %tmp_buff
%.tmp1396 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1392, i8* %.tmp1394, i8* %.tmp1395)
%.tmp1397 = load i8*, i8** %tmp_buff
%.tmp1398 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1399 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1398, i32 0, i32 0
%.tmp1400 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1399
%.tmp1401 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1400, i32 0, i32 1
%.tmp1402 = load i8*, i8** %.tmp1401
%.tmp1403 = load i32, i32* %qv_len
%.tmp1404 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1397, i8* %.tmp1402, i32 %.tmp1403)
%.tmp1405 = icmp eq i32 %.tmp1404, 0
%.tmp1406 = load i32, i32* %qv_len
%.tmp1407 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1408 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1407, i32 0, i32 0
%.tmp1409 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1408
%.tmp1410 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1409, i32 0, i32 1
%.tmp1411 = load i8*, i8** %.tmp1410
%.tmp1412 = call i32(i8*) @strlen(i8* %.tmp1411)
%.tmp1413 = icmp eq i32 %.tmp1406, %.tmp1412
%.tmp1414 = and i1 %.tmp1405, %.tmp1413
br i1 %.tmp1414, label %.if.true.1415, label %.if.false.1415
.if.true.1415:
%.tmp1416 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1417 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1416, i32 0, i32 0
%.tmp1418 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1417
%.tmp1419 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1420 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1419, i32 0, i32 0
%.tmp1421 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1420
%.tmp1422 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1421, i32 0, i32 0
%.tmp1423 = load i8*, i8** %.tmp1422
%.tmp1424 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1425 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1424, i32 0, i32 0
%.tmp1426 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1425
%.tmp1427 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1426, i32 0, i32 1
%.tmp1428 = load i8*, i8** %.tmp1427
%.tmp1429 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1418, i8* %.tmp1423, i8* %.tmp1428)
store %m286$.Node.type* %.tmp1429, %m286$.Node.type** %child
%.tmp1430 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1431 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1430, %m286$.Node.type* %.tmp1431)
%.tmp1432 = load i32, i32* %new_children
%.tmp1433 = add i32 %.tmp1432, 1
store i32 %.tmp1433, i32* %new_children
%.tmp1434 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1435 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1434, i32 0, i32 0
%.tmp1436 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1437 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1436, i32 0, i32 0
%.tmp1438 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1437
%.tmp1439 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1438, i32 0, i32 5
%.tmp1440 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1439
store %m287$.Token.type* %.tmp1440, %m287$.Token.type** %.tmp1435
br label %.if.end.1415
.if.false.1415:
%.tmp1441 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1442 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1441, i32 0, i32 0
%.tmp1443 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1442
%.tmp1444 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1443, i32 0, i32 1
%.tmp1445 = load i8*, i8** %.tmp1444
%token_value = alloca i8*
store i8* %.tmp1445, i8** %token_value
%.tmp1446 = load i8*, i8** %token_value
%.tmp1447 = icmp eq i8* %.tmp1446, null
br i1 %.tmp1447, label %.if.true.1448, label %.if.false.1448
.if.true.1448:
%.tmp1450 = getelementptr [7 x i8], [7 x i8]*@.str1449, i32 0, i32 0
store i8* %.tmp1450, i8** %token_value
br label %.if.end.1448
.if.false.1448:
br label %.if.end.1448
.if.end.1448:
%.tmp1452 = getelementptr [15 x i8], [15 x i8]*@.str1451, i32 0, i32 0
%err_fmt = alloca i8*
store i8* %.tmp1452, i8** %err_fmt
%.tmp1454 = getelementptr [31 x i8], [31 x i8]*@.str1453, i32 0, i32 0
%err_msg = alloca i8*
store i8* %.tmp1454, i8** %err_msg
%.tmp1455 = load i8*, i8** %err_msg
%.tmp1456 = call i32(i8*) @strlen(i8* %.tmp1455)
%.tmp1457 = load i8*, i8** %tmp_buff
%.tmp1458 = call i32(i8*) @strlen(i8* %.tmp1457)
%.tmp1459 = add i32 %.tmp1456, %.tmp1458
%.tmp1460 = load i8*, i8** %token_value
%.tmp1461 = call i32(i8*) @strlen(i8* %.tmp1460)
%.tmp1462 = add i32 %.tmp1459, %.tmp1461
%.tmp1463 = load i8*, i8** %err_fmt
%.tmp1464 = call i32(i8*) @strlen(i8* %.tmp1463)
%.tmp1465 = add i32 %.tmp1462, %.tmp1464
%.tmp1466 = mul i32 3, 2
%.tmp1467 = sub i32 %.tmp1465, %.tmp1466
%.tmp1468 = add i32 %.tmp1467, 1
%err_len = alloca i32
store i32 %.tmp1468, i32* %err_len
%.tmp1469 = load i32, i32* %err_len
%.tmp1470 = call i8*(i32) @malloc(i32 %.tmp1469)
%err_buf = alloca i8*
store i8* %.tmp1470, i8** %err_buf
%.tmp1471 = load i8*, i8** %err_buf
%.tmp1472 = load i32, i32* %err_len
%.tmp1473 = load i8*, i8** %err_fmt
%.tmp1474 = load i8*, i8** %err_msg
%.tmp1475 = load i8*, i8** %tmp_buff
%.tmp1476 = load i8*, i8** %token_value
%.tmp1477 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1471, i32 %.tmp1472, i8* %.tmp1473, i8* %.tmp1474, i8* %.tmp1475, i8* %.tmp1476)
%.tmp1478 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1479 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1478, i32 0, i32 0
%.tmp1480 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1479
%.tmp1481 = load i8*, i8** %err_buf
%.tmp1482 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1480, i8* %.tmp1481)
store %m717$.Error.type* %.tmp1482, %m717$.Error.type** %err
br label %.if.end.1415
.if.end.1415:
%.tmp1483 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp1483)
br label %.if.end.1381
.if.false.1381:
%.tmp1484 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1485 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1484, i32 0, i32 0
%.tmp1486 = load i8, i8* %.tmp1485
%.tmp1487 = icmp eq i8 %.tmp1486, 116
br i1 %.tmp1487, label %.if.true.1488, label %.if.false.1488
.if.true.1488:
%.tmp1489 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1490 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1489, i32 0, i32 1
%.tmp1491 = load i8*, i8** %.tmp1490
%.tmp1492 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1493 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1492, i32 0, i32 0
%.tmp1494 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1493
%.tmp1495 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1494, i32 0, i32 0
%.tmp1496 = load i8*, i8** %.tmp1495
%.tmp1497 = call i32(i8*,i8*) @strcmp(i8* %.tmp1491, i8* %.tmp1496)
%.tmp1498 = icmp eq i32 %.tmp1497, 0
br i1 %.tmp1498, label %.if.true.1499, label %.if.false.1499
.if.true.1499:
%.tmp1500 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1501 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1500, i32 0, i32 0
%.tmp1502 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1501
%.tmp1503 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1504 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1503, i32 0, i32 0
%.tmp1505 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1504
%.tmp1506 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1505, i32 0, i32 0
%.tmp1507 = load i8*, i8** %.tmp1506
%.tmp1508 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1509 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1508, i32 0, i32 0
%.tmp1510 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1509
%.tmp1511 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1510, i32 0, i32 1
%.tmp1512 = load i8*, i8** %.tmp1511
%.tmp1513 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1502, i8* %.tmp1507, i8* %.tmp1512)
store %m286$.Node.type* %.tmp1513, %m286$.Node.type** %child
%.tmp1514 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1515 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1514, %m286$.Node.type* %.tmp1515)
%.tmp1516 = load i32, i32* %new_children
%.tmp1517 = add i32 %.tmp1516, 1
store i32 %.tmp1517, i32* %new_children
%.tmp1518 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1519 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1518, i32 0, i32 0
%.tmp1520 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1521 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1520, i32 0, i32 0
%.tmp1522 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1521
%.tmp1523 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1522, i32 0, i32 5
%.tmp1524 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1523
store %m287$.Token.type* %.tmp1524, %m287$.Token.type** %.tmp1519
br label %.if.end.1499
.if.false.1499:
%.tmp1526 = getelementptr [13 x i8], [13 x i8]*@.str1525, i32 0, i32 0
%err_fmt_t = alloca i8*
store i8* %.tmp1526, i8** %err_fmt_t
%.tmp1528 = getelementptr [30 x i8], [30 x i8]*@.str1527, i32 0, i32 0
%err_msg_t = alloca i8*
store i8* %.tmp1528, i8** %err_msg_t
%.tmp1529 = load i8*, i8** %err_fmt_t
%.tmp1530 = call i32(i8*) @strlen(i8* %.tmp1529)
%.tmp1531 = load i8*, i8** %err_msg_t
%.tmp1532 = call i32(i8*) @strlen(i8* %.tmp1531)
%.tmp1533 = add i32 %.tmp1530, %.tmp1532
%.tmp1534 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1535 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1534, i32 0, i32 1
%.tmp1536 = load i8*, i8** %.tmp1535
%.tmp1537 = call i32(i8*) @strlen(i8* %.tmp1536)
%.tmp1538 = add i32 %.tmp1533, %.tmp1537
%.tmp1539 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1540 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1539, i32 0, i32 0
%.tmp1541 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1540
%.tmp1542 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1541, i32 0, i32 0
%.tmp1543 = load i8*, i8** %.tmp1542
%.tmp1544 = call i32(i8*) @strlen(i8* %.tmp1543)
%.tmp1545 = add i32 %.tmp1538, %.tmp1544
%err_len_t = alloca i32
store i32 %.tmp1545, i32* %err_len_t
%.tmp1546 = load i32, i32* %err_len_t
%.tmp1547 = call i8*(i32) @malloc(i32 %.tmp1546)
%err_buf_t = alloca i8*
store i8* %.tmp1547, i8** %err_buf_t
%.tmp1548 = load i8*, i8** %err_buf_t
%.tmp1549 = load i32, i32* %err_len_t
%.tmp1550 = load i8*, i8** %err_fmt_t
%.tmp1551 = load i8*, i8** %err_msg_t
%.tmp1552 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1553 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1552, i32 0, i32 1
%.tmp1554 = load i8*, i8** %.tmp1553
%.tmp1555 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1556 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1555, i32 0, i32 0
%.tmp1557 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1556
%.tmp1558 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1557, i32 0, i32 0
%.tmp1559 = load i8*, i8** %.tmp1558
%.tmp1560 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1548, i32 %.tmp1549, i8* %.tmp1550, i8* %.tmp1551, i8* %.tmp1554, i8* %.tmp1559)
%.tmp1561 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1562 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1561, i32 0, i32 0
%.tmp1563 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1562
%.tmp1564 = load i8*, i8** %err_buf_t
%.tmp1565 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1563, i8* %.tmp1564)
store %m717$.Error.type* %.tmp1565, %m717$.Error.type** %err
br label %.if.end.1499
.if.end.1499:
br label %.if.end.1488
.if.false.1488:
%.tmp1566 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1567 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1566, i32 0, i32 0
%.tmp1568 = load i8, i8* %.tmp1567
%.tmp1569 = icmp eq i8 %.tmp1568, 97
br i1 %.tmp1569, label %.if.true.1570, label %.if.false.1570
.if.true.1570:
%.tmp1571 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1572 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1571, i32 0, i32 1
%.tmp1573 = load %m286$.Rule.type**, %m286$.Rule.type*** %.tmp1572
%.tmp1574 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1575 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1574, i32 0, i32 1
%.tmp1576 = load i8*, i8** %.tmp1575
%.tmp1577 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1573, i8* %.tmp1576)
%alias_rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1577, %m286$.Rule.type** %alias_rule
%.tmp1578 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1579 = icmp eq %m286$.Rule.type* %.tmp1578, null
br i1 %.tmp1579, label %.if.true.1580, label %.if.false.1580
.if.true.1580:
%.tmp1581 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1582 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1581, i32 0, i32 0
%.tmp1583 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1582
%.tmp1585 = getelementptr [30 x i8], [30 x i8]*@.str1584, i32 0, i32 0
%.tmp1586 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1583, i8* %.tmp1585)
store %m717$.Error.type* %.tmp1586, %m717$.Error.type** %err
br label %.if.end.1580
.if.false.1580:
%.tmp1587 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1588 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1589 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1587, %m286$.Rule.type* %.tmp1588)
%parse_result = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1589, %m286$.ParseResult.type** %parse_result
%.tmp1590 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1591 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1590, i32 0, i32 0
%.tmp1592 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1591
%.tmp1593 = icmp ne %m717$.Error.type* %.tmp1592, null
br i1 %.tmp1593, label %.if.true.1594, label %.if.false.1594
.if.true.1594:
%.tmp1595 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1596 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1595, i32 0, i32 0
%.tmp1597 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1596
store %m717$.Error.type* %.tmp1597, %m717$.Error.type** %err
br label %.if.end.1594
.if.false.1594:
%.tmp1598 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1599 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1600 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1599, i32 0, i32 1
%.tmp1601 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1600
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1598, %m286$.Node.type* %.tmp1601)
%.tmp1602 = load i32, i32* %new_children
%.tmp1603 = add i32 %.tmp1602, 1
store i32 %.tmp1603, i32* %new_children
br label %.if.end.1594
.if.end.1594:
%.tmp1604 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1605 = bitcast %m286$.ParseResult.type* %.tmp1604 to i8*
call void(i8*) @free(i8* %.tmp1605)
br label %.if.end.1580
.if.end.1580:
br label %.if.end.1570
.if.false.1570:
%.tmp1607 = getelementptr [41 x i8], [41 x i8]*@.str1606, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1607)
br label %.if.end.1570
.if.end.1570:
br label %.if.end.1488
.if.end.1488:
br label %.if.end.1381
.if.end.1381:
%.tmp1608 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1609 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1608, i32 0, i32 2
%.tmp1610 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1609
store %m286$.Query.type* %.tmp1610, %m286$.Query.type** %q
br label %.for.start.1368
.for.end.1368:
%.tmp1611 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1612 = icmp ne %m717$.Error.type* %.tmp1611, null
br i1 %.tmp1612, label %.if.true.1613, label %.if.false.1613
.if.true.1613:
%.tmp1614 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1615 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1614, i32 0, i32 0
%.tmp1616 = load %m287$.Token.type*, %m287$.Token.type** %start_token
store %m287$.Token.type* %.tmp1616, %m287$.Token.type** %.tmp1615
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1617
.for.start.1617:
%.tmp1618 = load i32, i32* %i
%.tmp1619 = load i32, i32* %new_children
%.tmp1620 = icmp slt i32 %.tmp1618, %.tmp1619
br i1 %.tmp1620, label %.for.continue.1617, label %.for.end.1617
.for.continue.1617:
%.tmp1621 = load %m286$.Node.type*, %m286$.Node.type** %base
call void(%m286$.Node.type*) @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.tmp1621)
%.tmp1622 = load i32, i32* %i
%.tmp1623 = add i32 %.tmp1622, 1
store i32 %.tmp1623, i32* %i
br label %.for.start.1617
.for.end.1617:
br label %.if.end.1613
.if.false.1613:
br label %.if.end.1613
.if.end.1613:
%.tmp1624 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1625 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1624, i32 0, i32 2
%.tmp1626 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1625
%.tmp1627 = icmp ne %m286$.Matcher.type* %.tmp1626, null
%.tmp1628 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1629 = icmp ne %m717$.Error.type* %.tmp1628, null
%.tmp1630 = and i1 %.tmp1627, %.tmp1629
br i1 %.tmp1630, label %.if.true.1631, label %.if.false.1631
.if.true.1631:
%.tmp1632 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1633 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1634 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1633, i32 0, i32 2
%.tmp1635 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1634
%.tmp1636 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1637 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1632, %m286$.Matcher.type* %.tmp1635, %m286$.Node.type* %.tmp1636)
%new_err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1637, %m717$.Error.type** %new_err
%.tmp1638 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1639 = icmp eq %m717$.Error.type* %.tmp1638, null
br i1 %.tmp1639, label %.if.true.1640, label %.if.false.1640
.if.true.1640:
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1640
.if.false.1640:
%.tmp1641 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1642 = bitcast %m717$.Error.type* %.tmp1641 to i8*
call void(i8*) @free(i8* %.tmp1642)
br label %.if.end.1640
.if.end.1640:
br label %.if.end.1631
.if.false.1631:
br label %.if.end.1631
.if.end.1631:
%.tmp1643 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1644 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1643, i32 0, i32 1
%.tmp1645 = load i8, i8* %.tmp1644
%.tmp1646 = icmp eq i8 %.tmp1645, 49
br i1 %.tmp1646, label %.if.true.1647, label %.if.false.1647
.if.true.1647:
br label %.if.end.1647
.if.false.1647:
%.tmp1648 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1649 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1648, i32 0, i32 1
%.tmp1650 = load i8, i8* %.tmp1649
%.tmp1651 = icmp eq i8 %.tmp1650, 43
%.tmp1652 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1653 = icmp eq %m717$.Error.type* %.tmp1652, null
%.tmp1654 = and i1 %.tmp1651, %.tmp1653
br i1 %.tmp1654, label %.if.true.1655, label %.if.false.1655
.if.true.1655:
%.tmp1656 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1657 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1658 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1659 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1656, %m286$.Matcher.type* %.tmp1657, %m286$.Node.type* %.tmp1658)
store %m717$.Error.type* %.tmp1659, %m717$.Error.type** %err
%.tmp1660 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1661 = icmp ne %m717$.Error.type* %.tmp1660, null
br i1 %.tmp1661, label %.if.true.1662, label %.if.false.1662
.if.true.1662:
%.tmp1663 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1664 = bitcast %m717$.Error.type* %.tmp1663 to i8*
call void(i8*) @free(i8* %.tmp1664)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1662
.if.false.1662:
%.tmp1665 = bitcast ptr null to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1665
br label %.if.end.1662
.if.end.1662:
br label %.if.end.1655
.if.false.1655:
%.tmp1666 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1667 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1666, i32 0, i32 1
%.tmp1668 = load i8, i8* %.tmp1667
%.tmp1669 = icmp eq i8 %.tmp1668, 63
%.tmp1670 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1671 = icmp ne %m717$.Error.type* %.tmp1670, null
%.tmp1672 = and i1 %.tmp1669, %.tmp1671
br i1 %.tmp1672, label %.if.true.1673, label %.if.false.1673
.if.true.1673:
%.tmp1674 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1675 = bitcast %m717$.Error.type* %.tmp1674 to i8*
call void(i8*) @free(i8* %.tmp1675)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1673
.if.false.1673:
%.tmp1676 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1677 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1676, i32 0, i32 1
%.tmp1678 = load i8, i8* %.tmp1677
%.tmp1679 = icmp eq i8 %.tmp1678, 42
br i1 %.tmp1679, label %.if.true.1680, label %.if.false.1680
.if.true.1680:
%.tmp1681 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1682 = icmp ne %m717$.Error.type* %.tmp1681, null
br i1 %.tmp1682, label %.if.true.1683, label %.if.false.1683
.if.true.1683:
%.tmp1684 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1685 = bitcast %m717$.Error.type* %.tmp1684 to i8*
call void(i8*) @free(i8* %.tmp1685)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1683
.if.false.1683:
%.tmp1686 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1687 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1688 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1689 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1686, %m286$.Matcher.type* %.tmp1687, %m286$.Node.type* %.tmp1688)
ret %m717$.Error.type* %.tmp1689
br label %.if.end.1683
.if.end.1683:
br label %.if.end.1680
.if.false.1680:
br label %.if.end.1680
.if.end.1680:
br label %.if.end.1673
.if.end.1673:
br label %.if.end.1655
.if.end.1655:
br label %.if.end.1647
.if.end.1647:
%.tmp1690 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1691 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1690, i32 0, i32 3
%.tmp1692 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1691
%.tmp1693 = icmp ne %m286$.Matcher.type* %.tmp1692, null
%.tmp1694 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1695 = icmp eq %m717$.Error.type* %.tmp1694, null
%.tmp1696 = and i1 %.tmp1693, %.tmp1695
br i1 %.tmp1696, label %.if.true.1697, label %.if.false.1697
.if.true.1697:
%.tmp1698 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1699 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1700 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1699, i32 0, i32 3
%.tmp1701 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1700
%.tmp1702 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1703 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1698, %m286$.Matcher.type* %.tmp1701, %m286$.Node.type* %.tmp1702)
store %m717$.Error.type* %.tmp1703, %m717$.Error.type** %err
br label %.if.end.1697
.if.false.1697:
br label %.if.end.1697
.if.end.1697:
%.tmp1704 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1705 = bitcast %m717$.Error.type* %.tmp1704 to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1705
}
define %m286$.ParseResult.type* @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.c.arg, %m286$.Rule.type* %.rule.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.rule.arg, %m286$.Rule.type** %rule
%.tmp1706 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* null, i32 1
%.tmp1707 = ptrtoint %m286$.ParseResult.type* %.tmp1706 to i32
%.tmp1708 = call i8*(i32) @malloc(i32 %.tmp1707)
%.tmp1709 = bitcast i8* %.tmp1708 to %m286$.ParseResult.type*
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1709, %m286$.ParseResult.type** %res
%.tmp1710 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1711 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1710, i32 0, i32 0
store %m717$.Error.type* null, %m717$.Error.type** %.tmp1711
%.tmp1712 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1713 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1712, i32 0, i32 1
%.tmp1714 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1715 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1714, i32 0, i32 0
%.tmp1716 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1715
%.tmp1717 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1718 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1717, i32 0, i32 0
%.tmp1719 = load i8*, i8** %.tmp1718
%.tmp1720 = bitcast ptr null to i8*
%.tmp1721 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1716, i8* %.tmp1719, i8* %.tmp1720)
store %m286$.Node.type* %.tmp1721, %m286$.Node.type** %.tmp1713
%.tmp1722 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1723 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1722, i32 0, i32 0
%.tmp1724 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1723
%start_match = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1724, %m287$.Token.type** %start_match
%.tmp1725 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1726 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1725, i32 0, i32 0
%.tmp1727 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1728 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1729 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1728, i32 0, i32 1
%.tmp1730 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1729
%.tmp1731 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1732 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1731, i32 0, i32 1
%.tmp1733 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1732
%.tmp1734 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1727, %m286$.Matcher.type* %.tmp1730, %m286$.Node.type* %.tmp1733)
store %m717$.Error.type* %.tmp1734, %m717$.Error.type** %.tmp1726
%.tmp1735 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1735
}
define %m286$.ParseResult.type* @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.grammar.arg, i8* %.start.arg, %m287$.Token.type* %.tokens.arg) {
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.grammar.arg, %m286$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tokens.arg, %m287$.Token.type** %tokens
%.tmp1736 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1737 = load i8*, i8** %start
%.tmp1738 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1736, i8* %.tmp1737)
%start_matcher = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1738, %m286$.Rule.type** %start_matcher
%.tmp1739 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1740 = icmp ne %m286$.Rule.type* %.tmp1739, null
%.tmp1742 = getelementptr [44 x i8], [44 x i8]*@.str1741, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1740, i8* %.tmp1742)
%c = alloca %m286$.AstContext.type
%.tmp1743 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1744 = load %m287$.Token.type*, %m287$.Token.type** %tokens
store %m287$.Token.type* %.tmp1744, %m287$.Token.type** %.tmp1743
%.tmp1745 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
%.tmp1746 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
store %m286$.Rule.type** %.tmp1746, %m286$.Rule.type*** %.tmp1745
%.tmp1747 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0
%.tmp1748 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1749 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1747, %m286$.Rule.type* %.tmp1748)
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1749, %m286$.ParseResult.type** %res
%.tmp1750 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1751 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1750
%.tmp1752 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1751, i32 0, i32 0
%.tmp1753 = load i8*, i8** %.tmp1752
%.tmp1755 = getelementptr [4 x i8], [4 x i8]*@.str1754, i32 0, i32 0
%.tmp1756 = call i32(i8*,i8*) @strcmp(i8* %.tmp1753, i8* %.tmp1755)
%.tmp1757 = icmp ne i32 %.tmp1756, 0
%.tmp1758 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1759 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1758, i32 0, i32 0
%.tmp1760 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1759
%.tmp1761 = icmp eq %m717$.Error.type* %.tmp1760, null
%.tmp1762 = and i1 %.tmp1757, %.tmp1761
br i1 %.tmp1762, label %.if.true.1763, label %.if.false.1763
.if.true.1763:
%.tmp1764 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1765 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1764, i32 0, i32 0
%.tmp1766 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1767 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1766
%.tmp1769 = getelementptr [26 x i8], [26 x i8]*@.str1768, i32 0, i32 0
%.tmp1770 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1767, i8* %.tmp1769)
store %m717$.Error.type* %.tmp1770, %m717$.Error.type** %.tmp1765
br label %.if.end.1763
.if.false.1763:
br label %.if.end.1763
.if.end.1763:
%.tmp1771 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1771
}
@.str808 = constant [2 x i8] c"(\00"
@.str827 = constant [2 x i8] c"|\00"
@.str846 = constant [2 x i8] c")\00"
@.str855 = constant [4 x i8] c"EOF\00"
@.str872 = constant [2 x i8] c"|\00"
@.str881 = constant [2 x i8] c")\00"
@.str887 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str910 = constant [2 x i8] c"|\00"
@.str927 = constant [2 x i8] c")\00"
@.str933 = constant [22 x i8] c"open brace not closed\00"
@.str947 = constant [2 x i8] c"+\00"
@.str966 = constant [2 x i8] c"*\00"
@.str985 = constant [2 x i8] c"?\00"
@.str1006 = constant [2 x i8] c"(\00"
@.str1015 = constant [5 x i8] c"WORD\00"
@.str1034 = constant [5 x i8] c"WORD\00"
@.str1041 = constant [7 x i8] c"STRING\00"
@.str1081 = constant [7 x i8] c"STRING\00"
@.str1106 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1115 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1146 = constant [5 x i8] c"WORD\00"
@.str1151 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1165 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1179 = constant [2 x i8] c":\00"
@.str1191 = constant [27 x i8] c"expected : after rule name\00"
@.str1229 = constant [4 x i8] c"EOF\00"
@.str1238 = constant [3 x i8] c"NL\00"
@.str1393 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1449 = constant [7 x i8] c"(null)\00"
@.str1451 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1453 = constant [31 x i8] c"unable to match token by value\00"
@.str1525 = constant [13 x i8] c"%s: %s != %s\00"
@.str1527 = constant [30 x i8] c"unable to match token by type\00"
@.str1584 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1606 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1741 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1754 = constant [4 x i8] c"EOF\00"
@.str1768 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1773$grammar.cp() {
%.tmp1775 = getelementptr [1609 x i8], [1609 x i8]*@.str1774, i32 0, i32 0
ret i8* %.tmp1775
}
@.str1774 = constant [1609 x i8] c"
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

expression: ( if_block | return | for_loop | assignment | fn_call | declaration | NL )

block: \22{\22 NL (expression)* (\22}\22)

for_loop: \22for\22 (declaration | assignment)? (\22;\22) (assignable)? (\22;\22) (assignment)? block
\00"
define i8* @m1776$node_to_string.cp.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp1777 = call %m0$.File.type*() @tmpfile()
%tmp = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1777, %m0$.File.type** %tmp
%.tmp1778 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp1779 = load %m0$.File.type*, %m0$.File.type** %tmp
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1776$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1778, %m0$.File.type* %.tmp1779, i32 1)
%.tmp1780 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1781 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1780)
%.tmp1782 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1783 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1782)
%str_len = alloca i32
store i32 %.tmp1783, i32* %str_len
%.tmp1784 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1785 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1784)
%tmp_fd = alloca i32
store i32 %.tmp1785, i32* %tmp_fd
%.tmp1786 = load i32, i32* %tmp_fd
%.tmp1787 = load i32, i32* @SEEK_SET
%.tmp1788 = call i32(i32,i32,i32) @lseek(i32 %.tmp1786, i32 0, i32 %.tmp1787)
%.tmp1789 = load i32, i32* %str_len
%.tmp1790 = call i8*(i32) @malloc(i32 %.tmp1789)
%buf = alloca i8*
store i8* %.tmp1790, i8** %buf
%.tmp1791 = load i32, i32* %tmp_fd
%.tmp1792 = load i8*, i8** %buf
%.tmp1793 = load i32, i32* %str_len
%.tmp1794 = call i32(i32,i8*,i32) @read(i32 %.tmp1791, i8* %.tmp1792, i32 %.tmp1793)
%read = alloca i32
store i32 %.tmp1794, i32* %read
%.tmp1795 = load i32, i32* %read
%.tmp1796 = load i32, i32* %str_len
%.tmp1797 = icmp ne i32 %.tmp1795, %.tmp1796
br i1 %.tmp1797, label %.if.true.1798, label %.if.false.1798
.if.true.1798:
%.tmp1799 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp1799)
store i8* null, i8** %buf
br label %.if.end.1798
.if.false.1798:
br label %.if.end.1798
.if.end.1798:
%.tmp1800 = load i8*, i8** %buf
ret i8* %.tmp1800
}
define void @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1801 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1803 = getelementptr [2 x i8], [2 x i8]*@.str1802, i32 0, i32 0
%.tmp1804 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1801, i8* %.tmp1803)
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1805
.for.start.1805:
%.tmp1806 = load i32, i32* %i
%.tmp1807 = load i32, i32* %indent
%.tmp1808 = icmp slt i32 %.tmp1806, %.tmp1807
br i1 %.tmp1808, label %.for.continue.1805, label %.for.end.1805
.for.continue.1805:
%.tmp1809 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1811 = getelementptr [3 x i8], [3 x i8]*@.str1810, i32 0, i32 0
%.tmp1812 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1809, i8* %.tmp1811)
%.tmp1813 = load i32, i32* %i
%.tmp1814 = add i32 %.tmp1813, 1
store i32 %.tmp1814, i32* %i
br label %.for.start.1805
.for.end.1805:
ret void
}
define void @m1776$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1815 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1816 = icmp eq %m286$.Node.type* %.tmp1815, null
br i1 %.tmp1816, label %.if.true.1817, label %.if.false.1817
.if.true.1817:
%.tmp1818 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1820 = getelementptr [7 x i8], [7 x i8]*@.str1819, i32 0, i32 0
%.tmp1821 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1818, i8* %.tmp1820)
ret void
br label %.if.end.1817
.if.false.1817:
br label %.if.end.1817
.if.end.1817:
%.tmp1822 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1824 = getelementptr [2 x i8], [2 x i8]*@.str1823, i32 0, i32 0
%.tmp1825 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1822, i8* %.tmp1824)
%.tmp1826 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1827 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1826, i32 %.tmp1827)
%.tmp1828 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1830 = getelementptr [13 x i8], [13 x i8]*@.str1829, i32 0, i32 0
%.tmp1831 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1832 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1831, i32 0, i32 0
%.tmp1833 = load i8*, i8** %.tmp1832
%.tmp1834 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1828, i8* %.tmp1830, i8* %.tmp1833)
%.tmp1835 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1836 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1835, i32 %.tmp1836)
%.tmp1837 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1839 = getelementptr [12 x i8], [12 x i8]*@.str1838, i32 0, i32 0
%.tmp1840 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1841 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1840, i32 0, i32 1
%.tmp1842 = load i8*, i8** %.tmp1841
%.tmp1843 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1837, i8* %.tmp1839, i8* %.tmp1842)
%.tmp1844 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1845 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1844, i32 %.tmp1845)
%.tmp1846 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1848 = getelementptr [11 x i8], [11 x i8]*@.str1847, i32 0, i32 0
%.tmp1849 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1850 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1849, i32 0, i32 3
%.tmp1851 = load i32, i32* %.tmp1850
%.tmp1852 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1846, i8* %.tmp1848, i32 %.tmp1851)
%.tmp1853 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1854 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1853, i32 %.tmp1854)
%.tmp1855 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1857 = getelementptr [19 x i8], [19 x i8]*@.str1856, i32 0, i32 0
%.tmp1858 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1859 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1858, i32 0, i32 4
%.tmp1860 = load i32, i32* %.tmp1859
%.tmp1861 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1855, i8* %.tmp1857, i32 %.tmp1860)
%.tmp1862 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1863 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1862, i32 %.tmp1863)
%.tmp1864 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1866 = getelementptr [9 x i8], [9 x i8]*@.str1865, i32 0, i32 0
%.tmp1867 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1864, i8* %.tmp1866)
%.tmp1868 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1869 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1868, i32 0, i32 7
%.tmp1870 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1869
%.tmp1871 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1872 = load i32, i32* %indent
%.tmp1873 = add i32 %.tmp1872, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1776$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1870, %m0$.File.type* %.tmp1871, i32 %.tmp1873)
%.tmp1874 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1875 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1874, i32 %.tmp1875)
%.tmp1876 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1878 = getelementptr [13 x i8], [13 x i8]*@.str1877, i32 0, i32 0
%.tmp1879 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1876, i8* %.tmp1878)
%.tmp1880 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1881 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1880, i32 0, i32 6
%.tmp1882 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1881
%.tmp1883 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1884 = load i32, i32* %indent
%.tmp1885 = add i32 %.tmp1884, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1776$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1882, %m0$.File.type* %.tmp1883, i32 %.tmp1885)
%.tmp1886 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1887 = load i32, i32* %indent
%.tmp1888 = sub i32 %.tmp1887, 1
call void(%m0$.File.type*,i32) @m1776$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1886, i32 %.tmp1888)
%.tmp1889 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1891 = getelementptr [2 x i8], [2 x i8]*@.str1890, i32 0, i32 0
%.tmp1892 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1889, i8* %.tmp1891)
ret void
}
@.str1802 = constant [2 x i8] c"\0A\00"
@.str1810 = constant [3 x i8] c"  \00"
@.str1819 = constant [7 x i8] c"(null)\00"
@.str1823 = constant [2 x i8] c"{\00"
@.str1829 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1838 = constant [12 x i8] c"\22value\22: %s\00"
@.str1847 = constant [11 x i8] c"\22line\22: %d\00"
@.str1856 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1865 = constant [9 x i8] c"\22next\22: \00"
@.str1877 = constant [13 x i8] c"\22children\22: \00"
@.str1890 = constant [2 x i8] c"}\00"
%m1893$.SYStack.type = type {%m286$.Node.type*,%m1893$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1893$.SYStack.type* @m1893$stack_new.m1893$.SYStack.typep() {
%.tmp1894 = load i32, i32* @SYStack_size
%.tmp1895 = call i8*(i32) @malloc(i32 %.tmp1894)
%.tmp1896 = bitcast i8* %.tmp1895 to %m1893$.SYStack.type*
%s = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1896, %m1893$.SYStack.type** %s
%.tmp1897 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
%.tmp1898 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1897, i32 0, i32 0
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1898
%.tmp1899 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
%.tmp1900 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1899, i32 0, i32 1
store %m1893$.SYStack.type* null, %m1893$.SYStack.type** %.tmp1900
%.tmp1901 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
ret %m1893$.SYStack.type* %.tmp1901
}
define %m1893$.SYStack.type* @m1893$sy_algorithm.m1893$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.assignable.arg) {
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.assignable.arg, %m286$.Node.type** %assignable
%.tmp1902 = call %m1893$.SYStack.type*() @m1893$stack_new.m1893$.SYStack.typep()
%out_stack = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1902, %m1893$.SYStack.type** %out_stack
%.tmp1903 = call %m1893$.SYStack.type*() @m1893$stack_new.m1893$.SYStack.typep()
%op_stack = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1903, %m1893$.SYStack.type** %op_stack
%.tmp1904 = call %m1893$.SYStack.type*() @m1893$stack_new.m1893$.SYStack.typep()
%token_stack = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1904, %m1893$.SYStack.type** %token_stack
%ptr = alloca %m286$.Node.type*
%.tmp1906 = load %m286$.Node.type*, %m286$.Node.type** %assignable
store %m286$.Node.type* %.tmp1906, %m286$.Node.type** %ptr
br label %.for.start.1905
.for.start.1905:
%.tmp1907 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1908 = icmp ne %m286$.Node.type* %.tmp1907, null
br i1 %.tmp1908, label %.for.continue.1905, label %.for.end.1905
.for.continue.1905:
%.tmp1909 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %token_stack
%.tmp1910 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1911 = call %m1893$.SYStack.type*(%m1893$.SYStack.type*,%m286$.Node.type*) @m1893$stack_push.m1893$.SYStack.typep.m1893$.SYStack.typep.m286$.Node.typep(%m1893$.SYStack.type* %.tmp1909, %m286$.Node.type* %.tmp1910)
store %m1893$.SYStack.type* %.tmp1911, %m1893$.SYStack.type** %token_stack
%.tmp1912 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1913 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1912, i32 0, i32 7
%.tmp1914 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1913
store %m286$.Node.type* %.tmp1914, %m286$.Node.type** %ptr
br label %.for.start.1905
.for.end.1905:
%.tmp1916 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %token_stack
%.tmp1917 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1916, i32 0, i32 0
%.tmp1918 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1917
store %m286$.Node.type* %.tmp1918, %m286$.Node.type** %ptr
br label %.for.start.1915
.for.start.1915:
%.tmp1919 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1920 = icmp ne %m286$.Node.type* %.tmp1919, null
br i1 %.tmp1920, label %.for.continue.1915, label %.for.end.1915
.for.continue.1915:
%.tmp1921 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %token_stack
%cs = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1921, %m1893$.SYStack.type** %cs
%.tmp1922 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %token_stack
%.tmp1923 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1922, i32 0, i32 1
%.tmp1924 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp1923
store %m1893$.SYStack.type* %.tmp1924, %m1893$.SYStack.type** %token_stack
%.tmp1925 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %cs
%.tmp1926 = bitcast %m1893$.SYStack.type* %.tmp1925 to i8*
call void(i8*) @free(i8* %.tmp1926)
%.tmp1927 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1928 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1927, i32 0, i32 0
%.tmp1929 = load i8*, i8** %.tmp1928
%.tmp1931 = getelementptr [16 x i8], [16 x i8]*@.str1930, i32 0, i32 0
%.tmp1932 = call i32(i8*,i8*) @strcmp(i8* %.tmp1929, i8* %.tmp1931)
%.tmp1933 = icmp eq i32 %.tmp1932, 0
br i1 %.tmp1933, label %.if.true.1934, label %.if.false.1934
.if.true.1934:
%.tmp1935 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %out_stack
%.tmp1936 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1937 = call %m1893$.SYStack.type*(%m1893$.SYStack.type*,%m286$.Node.type*) @m1893$stack_push.m1893$.SYStack.typep.m1893$.SYStack.typep.m286$.Node.typep(%m1893$.SYStack.type* %.tmp1935, %m286$.Node.type* %.tmp1936)
store %m1893$.SYStack.type* %.tmp1937, %m1893$.SYStack.type** %out_stack
br label %.if.end.1934
.if.false.1934:
%.tmp1938 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1938, i32 0, i32 0
%.tmp1940 = load i8*, i8** %.tmp1939
%.tmp1942 = getelementptr [9 x i8], [9 x i8]*@.str1941, i32 0, i32 0
%.tmp1943 = call i32(i8*,i8*) @strcmp(i8* %.tmp1940, i8* %.tmp1942)
%.tmp1944 = icmp eq i32 %.tmp1943, 0
br i1 %.tmp1944, label %.if.true.1945, label %.if.false.1945
.if.true.1945:
%quit = alloca i1
store i1 0, i1* %quit
br label %.for.start.1946
.for.start.1946:
%.tmp1947 = load i1, i1* %quit
%.tmp1948 = icmp eq i1 %.tmp1947, 0
br i1 %.tmp1948, label %.for.continue.1946, label %.for.end.1946
.for.continue.1946:
%.tmp1949 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1950 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1949, i32 0, i32 0
%.tmp1951 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1950
%.tmp1952 = icmp eq %m286$.Node.type* %.tmp1951, null
br i1 %.tmp1952, label %.if.true.1953, label %.if.false.1953
.if.true.1953:
store i1 1, i1* %quit
br label %.if.end.1953
.if.false.1953:
%.tmp1954 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1955 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1954, i32 0, i32 0
%.tmp1956 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1955
%.tmp1957 = call i32(%m286$.Node.type*) @m1893$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1956)
%.tmp1958 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1959 = call i32(%m286$.Node.type*) @m1893$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1958)
%.tmp1960 = icmp slt i32 %.tmp1957, %.tmp1959
br i1 %.tmp1960, label %.if.true.1961, label %.if.false.1961
.if.true.1961:
%.tmp1962 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%top = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1962, %m1893$.SYStack.type** %top
%.tmp1963 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1964 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1963, i32 0, i32 1
%.tmp1965 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp1964
store %m1893$.SYStack.type* %.tmp1965, %m1893$.SYStack.type** %op_stack
%.tmp1966 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %out_stack
%.tmp1967 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %top
%.tmp1968 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1967, i32 0, i32 0
%.tmp1969 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1968
%.tmp1970 = call %m1893$.SYStack.type*(%m1893$.SYStack.type*,%m286$.Node.type*) @m1893$stack_push.m1893$.SYStack.typep.m1893$.SYStack.typep.m286$.Node.typep(%m1893$.SYStack.type* %.tmp1966, %m286$.Node.type* %.tmp1969)
store %m1893$.SYStack.type* %.tmp1970, %m1893$.SYStack.type** %out_stack
%.tmp1971 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %top
%.tmp1972 = bitcast %m1893$.SYStack.type* %.tmp1971 to i8*
call void(i8*) @free(i8* %.tmp1972)
br label %.if.end.1961
.if.false.1961:
store i1 1, i1* %quit
br label %.if.end.1961
.if.end.1961:
br label %.if.end.1953
.if.end.1953:
br label %.for.start.1946
.for.end.1946:
%.tmp1973 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1974 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1975 = call %m1893$.SYStack.type*(%m1893$.SYStack.type*,%m286$.Node.type*) @m1893$stack_push.m1893$.SYStack.typep.m1893$.SYStack.typep.m286$.Node.typep(%m1893$.SYStack.type* %.tmp1973, %m286$.Node.type* %.tmp1974)
store %m1893$.SYStack.type* %.tmp1975, %m1893$.SYStack.type** %op_stack
br label %.if.end.1945
.if.false.1945:
%.tmp1977 = getelementptr [68 x i8], [68 x i8]*@.str1976, i32 0, i32 0
%.tmp1978 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1979 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1978, i32 0, i32 0
%.tmp1980 = load i8*, i8** %.tmp1979
%.tmp1981 = call i32(i8*,...) @printf(i8* %.tmp1977, i8* %.tmp1980)
br label %.if.end.1945
.if.end.1945:
br label %.if.end.1934
.if.end.1934:
%.tmp1982 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %token_stack
%.tmp1983 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1982, i32 0, i32 0
%.tmp1984 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1983
store %m286$.Node.type* %.tmp1984, %m286$.Node.type** %ptr
br label %.for.start.1915
.for.end.1915:
br label %.for.start.1985
.for.start.1985:
%.tmp1986 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1987 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1986, i32 0, i32 0
%.tmp1988 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1987
%.tmp1989 = icmp ne %m286$.Node.type* %.tmp1988, null
br i1 %.tmp1989, label %.for.continue.1985, label %.for.end.1985
.for.continue.1985:
%.tmp1990 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1991 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1990, i32 0, i32 0
%.tmp1992 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1991
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1992, %m286$.Node.type** %node
%.tmp1993 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%s = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp1993, %m1893$.SYStack.type** %s
%.tmp1994 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %op_stack
%.tmp1995 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp1994, i32 0, i32 1
%.tmp1996 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp1995
store %m1893$.SYStack.type* %.tmp1996, %m1893$.SYStack.type** %op_stack
%.tmp1997 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
%.tmp1998 = bitcast %m1893$.SYStack.type* %.tmp1997 to i8*
call void(i8*) @free(i8* %.tmp1998)
%.tmp1999 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %out_stack
%.tmp2000 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2001 = call %m1893$.SYStack.type*(%m1893$.SYStack.type*,%m286$.Node.type*) @m1893$stack_push.m1893$.SYStack.typep.m1893$.SYStack.typep.m286$.Node.typep(%m1893$.SYStack.type* %.tmp1999, %m286$.Node.type* %.tmp2000)
store %m1893$.SYStack.type* %.tmp2001, %m1893$.SYStack.type** %out_stack
br label %.for.start.1985
.for.end.1985:
%.tmp2002 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %out_stack
ret %m1893$.SYStack.type* %.tmp2002
}
define %m1893$.SYStack.type* @m1893$stack_push.m1893$.SYStack.typep.m1893$.SYStack.typep.m286$.Node.typep(%m1893$.SYStack.type* %.curr_stack.arg, %m286$.Node.type* %.node.arg) {
%curr_stack = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.curr_stack.arg, %m1893$.SYStack.type** %curr_stack
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2003 = load i32, i32* @SYStack_size
%.tmp2004 = call i8*(i32) @malloc(i32 %.tmp2003)
%.tmp2005 = bitcast i8* %.tmp2004 to %m1893$.SYStack.type*
%s = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp2005, %m1893$.SYStack.type** %s
%.tmp2006 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
%.tmp2007 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp2006, i32 0, i32 0
%.tmp2008 = load %m286$.Node.type*, %m286$.Node.type** %node
store %m286$.Node.type* %.tmp2008, %m286$.Node.type** %.tmp2007
%.tmp2009 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
%.tmp2010 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp2009, i32 0, i32 1
%.tmp2011 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %curr_stack
store %m1893$.SYStack.type* %.tmp2011, %m1893$.SYStack.type** %.tmp2010
%.tmp2012 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %s
ret %m1893$.SYStack.type* %.tmp2012
}
define i32 @m1893$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp2013 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp2014 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2013, i32 0, i32 6
%.tmp2015 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2014
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2015, %m286$.Node.type** %op
%.tmp2016 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2017 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2016, i32 0, i32 1
%.tmp2018 = load i8*, i8** %.tmp2017
%.tmp2020 = getelementptr [2 x i8], [2 x i8]*@.str2019, i32 0, i32 0
%.tmp2021 = call i32(i8*,i8*) @strcmp(i8* %.tmp2018, i8* %.tmp2020)
%.tmp2022 = icmp eq i32 %.tmp2021, 0
%.tmp2023 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2023, i32 0, i32 1
%.tmp2025 = load i8*, i8** %.tmp2024
%.tmp2027 = getelementptr [2 x i8], [2 x i8]*@.str2026, i32 0, i32 0
%.tmp2028 = call i32(i8*,i8*) @strcmp(i8* %.tmp2025, i8* %.tmp2027)
%.tmp2029 = icmp eq i32 %.tmp2028, 0
%.tmp2030 = or i1 %.tmp2022, %.tmp2029
br i1 %.tmp2030, label %.if.true.2031, label %.if.false.2031
.if.true.2031:
ret i32 4
br label %.if.end.2031
.if.false.2031:
%.tmp2032 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2033 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2032, i32 0, i32 1
%.tmp2034 = load i8*, i8** %.tmp2033
%.tmp2036 = getelementptr [2 x i8], [2 x i8]*@.str2035, i32 0, i32 0
%.tmp2037 = call i32(i8*,i8*) @strcmp(i8* %.tmp2034, i8* %.tmp2036)
%.tmp2038 = icmp eq i32 %.tmp2037, 0
%.tmp2039 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2040 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2039, i32 0, i32 1
%.tmp2041 = load i8*, i8** %.tmp2040
%.tmp2043 = getelementptr [2 x i8], [2 x i8]*@.str2042, i32 0, i32 0
%.tmp2044 = call i32(i8*,i8*) @strcmp(i8* %.tmp2041, i8* %.tmp2043)
%.tmp2045 = icmp eq i32 %.tmp2044, 0
%.tmp2046 = or i1 %.tmp2038, %.tmp2045
br i1 %.tmp2046, label %.if.true.2047, label %.if.false.2047
.if.true.2047:
ret i32 3
br label %.if.end.2047
.if.false.2047:
%.tmp2048 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2049 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2048, i32 0, i32 1
%.tmp2050 = load i8*, i8** %.tmp2049
%.tmp2052 = getelementptr [3 x i8], [3 x i8]*@.str2051, i32 0, i32 0
%.tmp2053 = call i32(i8*,i8*) @strcmp(i8* %.tmp2050, i8* %.tmp2052)
%.tmp2054 = icmp eq i32 %.tmp2053, 0
%.tmp2055 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2056 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2055, i32 0, i32 1
%.tmp2057 = load i8*, i8** %.tmp2056
%.tmp2059 = getelementptr [3 x i8], [3 x i8]*@.str2058, i32 0, i32 0
%.tmp2060 = call i32(i8*,i8*) @strcmp(i8* %.tmp2057, i8* %.tmp2059)
%.tmp2061 = icmp eq i32 %.tmp2060, 0
%.tmp2062 = or i1 %.tmp2054, %.tmp2061
br i1 %.tmp2062, label %.if.true.2063, label %.if.false.2063
.if.true.2063:
ret i32 7
br label %.if.end.2063
.if.false.2063:
%.tmp2064 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2065 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2064, i32 0, i32 1
%.tmp2066 = load i8*, i8** %.tmp2065
%.tmp2068 = getelementptr [3 x i8], [3 x i8]*@.str2067, i32 0, i32 0
%.tmp2069 = call i32(i8*,i8*) @strcmp(i8* %.tmp2066, i8* %.tmp2068)
%.tmp2070 = icmp eq i32 %.tmp2069, 0
%.tmp2071 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2072 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2071, i32 0, i32 1
%.tmp2073 = load i8*, i8** %.tmp2072
%.tmp2075 = getelementptr [3 x i8], [3 x i8]*@.str2074, i32 0, i32 0
%.tmp2076 = call i32(i8*,i8*) @strcmp(i8* %.tmp2073, i8* %.tmp2075)
%.tmp2077 = icmp eq i32 %.tmp2076, 0
%.tmp2078 = or i1 %.tmp2070, %.tmp2077
br i1 %.tmp2078, label %.if.true.2079, label %.if.false.2079
.if.true.2079:
ret i32 6
br label %.if.end.2079
.if.false.2079:
%.tmp2080 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2081 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2080, i32 0, i32 1
%.tmp2082 = load i8*, i8** %.tmp2081
%.tmp2084 = getelementptr [2 x i8], [2 x i8]*@.str2083, i32 0, i32 0
%.tmp2085 = call i32(i8*,i8*) @strcmp(i8* %.tmp2082, i8* %.tmp2084)
%.tmp2086 = icmp eq i32 %.tmp2085, 0
%.tmp2087 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2088 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2087, i32 0, i32 1
%.tmp2089 = load i8*, i8** %.tmp2088
%.tmp2091 = getelementptr [2 x i8], [2 x i8]*@.str2090, i32 0, i32 0
%.tmp2092 = call i32(i8*,i8*) @strcmp(i8* %.tmp2089, i8* %.tmp2091)
%.tmp2093 = icmp eq i32 %.tmp2092, 0
%.tmp2094 = or i1 %.tmp2086, %.tmp2093
br i1 %.tmp2094, label %.if.true.2095, label %.if.false.2095
.if.true.2095:
ret i32 6
br label %.if.end.2095
.if.false.2095:
%.tmp2096 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2097 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2096, i32 0, i32 1
%.tmp2098 = load i8*, i8** %.tmp2097
%.tmp2100 = getelementptr [2 x i8], [2 x i8]*@.str2099, i32 0, i32 0
%.tmp2101 = call i32(i8*,i8*) @strcmp(i8* %.tmp2098, i8* %.tmp2100)
%.tmp2102 = icmp eq i32 %.tmp2101, 0
br i1 %.tmp2102, label %.if.true.2103, label %.if.false.2103
.if.true.2103:
ret i32 11
br label %.if.end.2103
.if.false.2103:
%.tmp2104 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2105 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2104, i32 0, i32 1
%.tmp2106 = load i8*, i8** %.tmp2105
%.tmp2108 = getelementptr [2 x i8], [2 x i8]*@.str2107, i32 0, i32 0
%.tmp2109 = call i32(i8*,i8*) @strcmp(i8* %.tmp2106, i8* %.tmp2108)
%.tmp2110 = icmp eq i32 %.tmp2109, 0
br i1 %.tmp2110, label %.if.true.2111, label %.if.false.2111
.if.true.2111:
ret i32 12
br label %.if.end.2111
.if.false.2111:
br label %.if.end.2111
.if.end.2111:
br label %.if.end.2103
.if.end.2103:
br label %.if.end.2095
.if.end.2095:
br label %.if.end.2079
.if.end.2079:
br label %.if.end.2063
.if.end.2063:
br label %.if.end.2047
.if.end.2047:
br label %.if.end.2031
.if.end.2031:
%.tmp2113 = getelementptr [65 x i8], [65 x i8]*@.str2112, i32 0, i32 0
%.tmp2114 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2115 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2114, i32 0, i32 1
%.tmp2116 = load i8*, i8** %.tmp2115
%.tmp2117 = call i32(i8*,...) @printf(i8* %.tmp2113, i8* %.tmp2116)
ret i32 4
}
@.str1930 = constant [16 x i8] c"mono_assignable\00"
@.str1941 = constant [9 x i8] c"operator\00"
@.str1976 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2019 = constant [2 x i8] c"+\00"
@.str2026 = constant [2 x i8] c"-\00"
@.str2035 = constant [2 x i8] c"*\00"
@.str2042 = constant [2 x i8] c"/\00"
@.str2051 = constant [3 x i8] c"==\00"
@.str2058 = constant [3 x i8] c"!=\00"
@.str2067 = constant [3 x i8] c">=\00"
@.str2074 = constant [3 x i8] c"<=\00"
@.str2083 = constant [2 x i8] c">\00"
@.str2090 = constant [2 x i8] c"<\00"
@.str2099 = constant [2 x i8] c"&\00"
@.str2107 = constant [2 x i8] c"|\00"
@.str2112 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
define i8* @m2118$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2119 = load i8*, i8** %text
%.tmp2120 = call i32(i8*) @strlen(i8* %.tmp2119)
%str_len = alloca i32
store i32 %.tmp2120, i32* %str_len
%dest_string = alloca {i32,i32,i8*}
%.tmp2121 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2122 = load i32, i32* %str_len
store i32 %.tmp2122, i32* %.tmp2121
%.tmp2123 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2123
%.tmp2124 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2125 = load i32, i32* %str_len
%.tmp2126 = call i8*(i32) @malloc(i32 %.tmp2125)
store i8* %.tmp2126, i8** %.tmp2124
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.2127
.for.start.2127:
%.tmp2128 = load i32, i32* %i
%.tmp2129 = load i32, i32* %str_len
%.tmp2130 = sub i32 %.tmp2129, 1
%.tmp2131 = icmp slt i32 %.tmp2128, %.tmp2130
br i1 %.tmp2131, label %.for.continue.2127, label %.for.end.2127
.for.continue.2127:
%.tmp2132 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2133 = load i32, i32* %.tmp2132
%.tmp2134 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2135 = load i32, i32* %.tmp2134
%.tmp2136 = sub i32 %.tmp2135, 4
%.tmp2137 = icmp eq i32 %.tmp2133, %.tmp2136
br i1 %.tmp2137, label %.if.true.2138, label %.if.false.2138
.if.true.2138:
%.tmp2139 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2140 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2141 = load i8*, i8** %.tmp2140
%.tmp2142 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2143 = load i32, i32* %.tmp2142
%.tmp2144 = mul i32 %.tmp2143, 2
%.tmp2145 = call i8*(i8*,i32) @realloc(i8* %.tmp2141, i32 %.tmp2144)
store i8* %.tmp2145, i8** %.tmp2139
br label %.if.end.2138
.if.false.2138:
br label %.if.end.2138
.if.end.2138:
%.tmp2146 = load i32, i32* %i
%.tmp2147 = load i8*, i8** %text
%.tmp2148 = getelementptr i8, i8* %.tmp2147, i32 %.tmp2146
%.tmp2149 = load i8, i8* %.tmp2148
%.tmp2150 = icmp eq i8 %.tmp2149, 34
br i1 %.tmp2150, label %.if.true.2151, label %.if.false.2151
.if.true.2151:
%.tmp2152 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2153 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2154 = load i32, i32* %.tmp2153
%.tmp2155 = load i8*, i8** %.tmp2152
%.tmp2156 = getelementptr i8, i8* %.tmp2155, i32 %.tmp2154
store i8 92, i8* %.tmp2156
%.tmp2157 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2158 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2159 = load i32, i32* %.tmp2158
%.tmp2160 = add i32 %.tmp2159, 1
store i32 %.tmp2160, i32* %.tmp2157
%.tmp2161 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2162 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2163 = load i32, i32* %.tmp2162
%.tmp2164 = load i8*, i8** %.tmp2161
%.tmp2165 = getelementptr i8, i8* %.tmp2164, i32 %.tmp2163
store i8 50, i8* %.tmp2165
%.tmp2166 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2167 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2168 = load i32, i32* %.tmp2167
%.tmp2169 = add i32 %.tmp2168, 1
store i32 %.tmp2169, i32* %.tmp2166
%.tmp2170 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2171 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2172 = load i32, i32* %.tmp2171
%.tmp2173 = load i8*, i8** %.tmp2170
%.tmp2174 = getelementptr i8, i8* %.tmp2173, i32 %.tmp2172
store i8 50, i8* %.tmp2174
br label %.if.end.2151
.if.false.2151:
%.tmp2175 = load i32, i32* %i
%.tmp2176 = load i8*, i8** %text
%.tmp2177 = getelementptr i8, i8* %.tmp2176, i32 %.tmp2175
%.tmp2178 = load i8, i8* %.tmp2177
%.tmp2179 = icmp eq i8 %.tmp2178, 92
br i1 %.tmp2179, label %.if.true.2180, label %.if.false.2180
.if.true.2180:
%.tmp2181 = load i32, i32* %i
%.tmp2182 = add i32 %.tmp2181, 1
%.tmp2183 = load i8*, i8** %text
%.tmp2184 = getelementptr i8, i8* %.tmp2183, i32 %.tmp2182
%.tmp2185 = load i8, i8* %.tmp2184
%.tmp2186 = icmp eq i8 %.tmp2185, 110
%.tmp2187 = load i32, i32* %i
%.tmp2188 = add i32 %.tmp2187, 1
%.tmp2189 = load i8*, i8** %text
%.tmp2190 = getelementptr i8, i8* %.tmp2189, i32 %.tmp2188
%.tmp2191 = load i8, i8* %.tmp2190
%.tmp2192 = icmp eq i8 %.tmp2191, 78
%.tmp2193 = or i1 %.tmp2186, %.tmp2192
br i1 %.tmp2193, label %.if.true.2194, label %.if.false.2194
.if.true.2194:
%.tmp2195 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2196 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2197 = load i32, i32* %.tmp2196
%.tmp2198 = load i8*, i8** %.tmp2195
%.tmp2199 = getelementptr i8, i8* %.tmp2198, i32 %.tmp2197
store i8 92, i8* %.tmp2199
%.tmp2200 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2201 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2202 = load i32, i32* %.tmp2201
%.tmp2203 = add i32 %.tmp2202, 1
store i32 %.tmp2203, i32* %.tmp2200
%.tmp2204 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2205 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2206 = load i32, i32* %.tmp2205
%.tmp2207 = load i8*, i8** %.tmp2204
%.tmp2208 = getelementptr i8, i8* %.tmp2207, i32 %.tmp2206
store i8 48, i8* %.tmp2208
%.tmp2209 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2210 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2211 = load i32, i32* %.tmp2210
%.tmp2212 = add i32 %.tmp2211, 1
store i32 %.tmp2212, i32* %.tmp2209
%.tmp2213 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2214 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2215 = load i32, i32* %.tmp2214
%.tmp2216 = load i8*, i8** %.tmp2213
%.tmp2217 = getelementptr i8, i8* %.tmp2216, i32 %.tmp2215
store i8 65, i8* %.tmp2217
%.tmp2218 = load i32, i32* %i
%.tmp2219 = add i32 %.tmp2218, 1
store i32 %.tmp2219, i32* %i
br label %.if.end.2194
.if.false.2194:
%.tmp2220 = load i32, i32* %i
%.tmp2221 = add i32 %.tmp2220, 1
%.tmp2222 = load i8*, i8** %text
%.tmp2223 = getelementptr i8, i8* %.tmp2222, i32 %.tmp2221
%.tmp2224 = load i8, i8* %.tmp2223
%.tmp2225 = icmp eq i8 %.tmp2224, 92
br i1 %.tmp2225, label %.if.true.2226, label %.if.false.2226
.if.true.2226:
%.tmp2227 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2228 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2229 = load i32, i32* %.tmp2228
%.tmp2230 = load i8*, i8** %.tmp2227
%.tmp2231 = getelementptr i8, i8* %.tmp2230, i32 %.tmp2229
store i8 92, i8* %.tmp2231
%.tmp2232 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2233 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2234 = load i32, i32* %.tmp2233
%.tmp2235 = add i32 %.tmp2234, 1
store i32 %.tmp2235, i32* %.tmp2232
%.tmp2236 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2237 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2238 = load i32, i32* %.tmp2237
%.tmp2239 = load i8*, i8** %.tmp2236
%.tmp2240 = getelementptr i8, i8* %.tmp2239, i32 %.tmp2238
store i8 53, i8* %.tmp2240
%.tmp2241 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2242 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2243 = load i32, i32* %.tmp2242
%.tmp2244 = add i32 %.tmp2243, 1
store i32 %.tmp2244, i32* %.tmp2241
%.tmp2245 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2246 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2247 = load i32, i32* %.tmp2246
%.tmp2248 = load i8*, i8** %.tmp2245
%.tmp2249 = getelementptr i8, i8* %.tmp2248, i32 %.tmp2247
store i8 67, i8* %.tmp2249
%.tmp2250 = load i32, i32* %i
%.tmp2251 = add i32 %.tmp2250, 1
store i32 %.tmp2251, i32* %i
br label %.if.end.2226
.if.false.2226:
%.tmp2252 = load i32, i32* %i
%.tmp2253 = add i32 %.tmp2252, 1
%.tmp2254 = load i8*, i8** %text
%.tmp2255 = getelementptr i8, i8* %.tmp2254, i32 %.tmp2253
%.tmp2256 = load i8, i8* %.tmp2255
%.tmp2257 = icmp eq i8 %.tmp2256, 120
br i1 %.tmp2257, label %.if.true.2258, label %.if.false.2258
.if.true.2258:
%.tmp2259 = load i32, i32* %i
%.tmp2260 = add i32 %.tmp2259, 2
store i32 %.tmp2260, i32* %i
%.tmp2261 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2262 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2263 = load i32, i32* %.tmp2262
%.tmp2264 = load i8*, i8** %.tmp2261
%.tmp2265 = getelementptr i8, i8* %.tmp2264, i32 %.tmp2263
store i8 92, i8* %.tmp2265
%.tmp2266 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2267 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2268 = load i32, i32* %.tmp2267
%.tmp2269 = add i32 %.tmp2268, 1
store i32 %.tmp2269, i32* %.tmp2266
%.tmp2270 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2271 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2272 = load i32, i32* %.tmp2271
%.tmp2273 = load i8*, i8** %.tmp2270
%.tmp2274 = getelementptr i8, i8* %.tmp2273, i32 %.tmp2272
%.tmp2275 = load i32, i32* %i
%.tmp2276 = load i8*, i8** %text
%.tmp2277 = getelementptr i8, i8* %.tmp2276, i32 %.tmp2275
%.tmp2278 = load i8, i8* %.tmp2277
%.tmp2279 = call i8(i8) @toupper(i8 %.tmp2278)
store i8 %.tmp2279, i8* %.tmp2274
%.tmp2280 = load i32, i32* %i
%.tmp2281 = add i32 %.tmp2280, 1
store i32 %.tmp2281, i32* %i
%.tmp2282 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2283 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2284 = load i32, i32* %.tmp2283
%.tmp2285 = add i32 %.tmp2284, 1
store i32 %.tmp2285, i32* %.tmp2282
%.tmp2286 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2287 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2288 = load i32, i32* %.tmp2287
%.tmp2289 = load i8*, i8** %.tmp2286
%.tmp2290 = getelementptr i8, i8* %.tmp2289, i32 %.tmp2288
%.tmp2291 = load i32, i32* %i
%.tmp2292 = load i8*, i8** %text
%.tmp2293 = getelementptr i8, i8* %.tmp2292, i32 %.tmp2291
%.tmp2294 = load i8, i8* %.tmp2293
%.tmp2295 = call i8(i8) @toupper(i8 %.tmp2294)
store i8 %.tmp2295, i8* %.tmp2290
br label %.if.end.2258
.if.false.2258:
%.tmp2296 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2297 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2298 = load i32, i32* %.tmp2297
%.tmp2299 = load i8*, i8** %.tmp2296
%.tmp2300 = getelementptr i8, i8* %.tmp2299, i32 %.tmp2298
%.tmp2301 = load i32, i32* %i
%.tmp2302 = load i8*, i8** %text
%.tmp2303 = getelementptr i8, i8* %.tmp2302, i32 %.tmp2301
%.tmp2304 = load i8, i8* %.tmp2303
store i8 %.tmp2304, i8* %.tmp2300
br label %.if.end.2258
.if.end.2258:
br label %.if.end.2226
.if.end.2226:
br label %.if.end.2194
.if.end.2194:
br label %.if.end.2180
.if.false.2180:
%.tmp2305 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2306 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2307 = load i32, i32* %.tmp2306
%.tmp2308 = load i8*, i8** %.tmp2305
%.tmp2309 = getelementptr i8, i8* %.tmp2308, i32 %.tmp2307
%.tmp2310 = load i32, i32* %i
%.tmp2311 = load i8*, i8** %text
%.tmp2312 = getelementptr i8, i8* %.tmp2311, i32 %.tmp2310
%.tmp2313 = load i8, i8* %.tmp2312
store i8 %.tmp2313, i8* %.tmp2309
br label %.if.end.2180
.if.end.2180:
br label %.if.end.2151
.if.end.2151:
%.tmp2314 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2315 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2316 = load i32, i32* %.tmp2315
%.tmp2317 = add i32 %.tmp2316, 1
store i32 %.tmp2317, i32* %.tmp2314
%.tmp2318 = load i32, i32* %i
%.tmp2319 = add i32 %.tmp2318, 1
store i32 %.tmp2319, i32* %i
br label %.for.start.2127
.for.end.2127:
%.tmp2320 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2321 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2322 = load i32, i32* %.tmp2321
%.tmp2323 = load i8*, i8** %.tmp2320
%.tmp2324 = getelementptr i8, i8* %.tmp2323, i32 %.tmp2322
store i8 0, i8* %.tmp2324
%buf = alloca i8*
%.tmp2325 = getelementptr i8*, i8** %buf, i32 0
%.tmp2327 = getelementptr [9 x i8], [9 x i8]*@.str2326, i32 0, i32 0
%.tmp2328 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2329 = load i8*, i8** %.tmp2328
%.tmp2330 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2325, i8* %.tmp2327, i8* %.tmp2329)
%.tmp2331 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2332 = load i8*, i8** %.tmp2331
call void(i8*) @free(i8* %.tmp2332)
%.tmp2333 = load i8*, i8** %buf
ret i8* %.tmp2333
}
define i32 @m2118$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 2, i32* %i
br label %.for.start.2334
.for.start.2334:
%.tmp2335 = load i32, i32* %i
%.tmp2336 = load i8*, i8** %text
%.tmp2337 = getelementptr i8, i8* %.tmp2336, i32 %.tmp2335
%.tmp2338 = load i8, i8* %.tmp2337
%.tmp2339 = icmp ne i8 %.tmp2338, 0
br i1 %.tmp2339, label %.for.continue.2334, label %.for.end.2334
.for.continue.2334:
%.tmp2340 = load i32, i32* %i
%.tmp2341 = load i8*, i8** %text
%.tmp2342 = getelementptr i8, i8* %.tmp2341, i32 %.tmp2340
%.tmp2343 = load i8, i8* %.tmp2342
%.tmp2344 = icmp eq i8 %.tmp2343, 92
br i1 %.tmp2344, label %.if.true.2345, label %.if.false.2345
.if.true.2345:
%.tmp2346 = load i32, i32* %i
%.tmp2347 = add i32 %.tmp2346, 2
store i32 %.tmp2347, i32* %i
br label %.if.end.2345
.if.false.2345:
br label %.if.end.2345
.if.end.2345:
%.tmp2348 = load i32, i32* %len
%.tmp2349 = add i32 %.tmp2348, 1
store i32 %.tmp2349, i32* %len
%.tmp2350 = load i32, i32* %i
%.tmp2351 = add i32 %.tmp2350, 1
store i32 %.tmp2351, i32* %i
br label %.for.start.2334
.for.end.2334:
%.tmp2352 = load i32, i32* %len
%.tmp2353 = sub i32 %.tmp2352, 1
ret i32 %.tmp2353
}
define i8* @m2118$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval = alloca i32
%buf = alloca i8*
%chrval = alloca i8
%.tmp2354 = load i8*, i8** %chr_repr
%.tmp2355 = call i32(i8*) @strlen(i8* %.tmp2354)
%chr_len = alloca i32
store i32 %.tmp2355, i32* %chr_len
%.tmp2356 = load i32, i32* %chr_len
%.tmp2357 = icmp eq i32 %.tmp2356, 6
br i1 %.tmp2357, label %.if.true.2358, label %.if.false.2358
.if.true.2358:
%.tmp2359 = load i8*, i8** %chr_repr
%.tmp2361 = getelementptr [7 x i8], [7 x i8]*@.str2360, i32 0, i32 0
%.tmp2362 = getelementptr i32, i32* %intval, i32 0
%.tmp2363 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2359, i8* %.tmp2361, i32* %.tmp2362)
%.tmp2364 = getelementptr i8*, i8** %buf, i32 0
%.tmp2366 = getelementptr [3 x i8], [3 x i8]*@.str2365, i32 0, i32 0
%.tmp2367 = load i32, i32* %intval
%.tmp2368 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2364, i8* %.tmp2366, i32 %.tmp2367)
br label %.if.end.2358
.if.false.2358:
%.tmp2369 = load i32, i32* %chr_len
%.tmp2370 = icmp eq i32 %.tmp2369, 5
br i1 %.tmp2370, label %.if.true.2371, label %.if.false.2371
.if.true.2371:
%.tmp2372 = load i8*, i8** %chr_repr
%.tmp2374 = getelementptr [6 x i8], [6 x i8]*@.str2373, i32 0, i32 0
%.tmp2375 = getelementptr i32, i32* %intval, i32 0
%.tmp2376 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2372, i8* %.tmp2374, i32* %.tmp2375)
%.tmp2377 = getelementptr i8*, i8** %buf, i32 0
%.tmp2379 = getelementptr [3 x i8], [3 x i8]*@.str2378, i32 0, i32 0
%.tmp2380 = load i32, i32* %intval
%.tmp2381 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2377, i8* %.tmp2379, i32 %.tmp2380)
br label %.if.end.2371
.if.false.2371:
%.tmp2382 = load i32, i32* %chr_len
%.tmp2383 = icmp eq i32 %.tmp2382, 4
br i1 %.tmp2383, label %.if.true.2384, label %.if.false.2384
.if.true.2384:
%.tmp2385 = load i8*, i8** %chr_repr
%.tmp2387 = getelementptr [6 x i8], [6 x i8]*@.str2386, i32 0, i32 0
%.tmp2388 = getelementptr i8, i8* %chrval, i32 0
%.tmp2389 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2385, i8* %.tmp2387, i8* %.tmp2388)
%.tmp2390 = load i8, i8* %chrval
%.tmp2391 = icmp eq i8 %.tmp2390, 110
br i1 %.tmp2391, label %.if.true.2392, label %.if.false.2392
.if.true.2392:
%.tmp2394 = getelementptr [3 x i8], [3 x i8]*@.str2393, i32 0, i32 0
store i8* %.tmp2394, i8** %buf
br label %.if.end.2392
.if.false.2392:
%.tmp2395 = bitcast ptr null to i8*
ret i8* %.tmp2395
br label %.if.end.2392
.if.end.2392:
br label %.if.end.2384
.if.false.2384:
%.tmp2396 = load i32, i32* %chr_len
%.tmp2397 = icmp eq i32 %.tmp2396, 3
br i1 %.tmp2397, label %.if.true.2398, label %.if.false.2398
.if.true.2398:
%.tmp2399 = load i8*, i8** %chr_repr
%.tmp2401 = getelementptr [5 x i8], [5 x i8]*@.str2400, i32 0, i32 0
%.tmp2402 = getelementptr i32, i32* %intval, i32 0
%.tmp2403 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2399, i8* %.tmp2401, i32* %.tmp2402)
%.tmp2404 = getelementptr i8*, i8** %buf, i32 0
%.tmp2406 = getelementptr [3 x i8], [3 x i8]*@.str2405, i32 0, i32 0
%.tmp2407 = load i32, i32* %intval
%.tmp2408 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2404, i8* %.tmp2406, i32 %.tmp2407)
br label %.if.end.2398
.if.false.2398:
%.tmp2409 = bitcast ptr null to i8*
ret i8* %.tmp2409
br label %.if.end.2398
.if.end.2398:
br label %.if.end.2384
.if.end.2384:
br label %.if.end.2371
.if.end.2371:
br label %.if.end.2358
.if.end.2358:
%.tmp2410 = load i8*, i8** %buf
ret i8* %.tmp2410
}
@.str2326 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2360 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2365 = constant [3 x i8] c"%d\00"
@.str2373 = constant [6 x i8] c"'\5C%x'\00"
@.str2378 = constant [3 x i8] c"%d\00"
@.str2386 = constant [6 x i8] c"'\5C%c'\00"
@.str2393 = constant [3 x i8] c"10\00"
@.str2400 = constant [5 x i8] c"'%c'\00"
@.str2405 = constant [3 x i8] c"%d\00"
@DEBUG_INTERNALS = constant i1 0
%m1772$.ErrorList.type = type {%m717$.Error.type*,%m1772$.ErrorList.type*}
%m1772$.Type.type = type {i8*,i8*,i8*,%m1772$.Type.type*,%m1772$.Type.type*}
define %m1772$.Type.type* @m1772$type_clone.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.t.arg) {
%t = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.t.arg, %m1772$.Type.type** %t
%.tmp2411 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2412 = icmp eq %m1772$.Type.type* %.tmp2411, null
br i1 %.tmp2412, label %.if.true.2413, label %.if.false.2413
.if.true.2413:
%.tmp2414 = bitcast ptr null to %m1772$.Type.type*
ret %m1772$.Type.type* %.tmp2414
br label %.if.end.2413
.if.false.2413:
br label %.if.end.2413
.if.end.2413:
%.tmp2415 = getelementptr %m1772$.Type.type, %m1772$.Type.type* null, i32 1
%.tmp2416 = ptrtoint %m1772$.Type.type* %.tmp2415 to i32
%.tmp2417 = call i8*(i32) @malloc(i32 %.tmp2416)
%.tmp2418 = bitcast i8* %.tmp2417 to %m1772$.Type.type*
%clone = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp2418, %m1772$.Type.type** %clone
%.tmp2419 = load %m1772$.Type.type*, %m1772$.Type.type** %clone
%.tmp2420 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2419, i32 0, i32 3
%.tmp2421 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2422 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2421, i32 0, i32 3
%.tmp2423 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2422
store %m1772$.Type.type* %.tmp2423, %m1772$.Type.type** %.tmp2420
%.tmp2424 = load %m1772$.Type.type*, %m1772$.Type.type** %clone
%.tmp2425 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2424, i32 0, i32 4
%.tmp2426 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2427 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2426, i32 0, i32 4
%.tmp2428 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2427
%.tmp2429 = call %m1772$.Type.type*(%m1772$.Type.type*) @m1772$type_clone.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp2428)
store %m1772$.Type.type* %.tmp2429, %m1772$.Type.type** %.tmp2425
%.tmp2430 = load %m1772$.Type.type*, %m1772$.Type.type** %clone
%.tmp2431 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2430, i32 0, i32 2
%.tmp2432 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2433 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2432, i32 0, i32 2
%.tmp2434 = load i8*, i8** %.tmp2433
store i8* %.tmp2434, i8** %.tmp2431
%.tmp2435 = load %m1772$.Type.type*, %m1772$.Type.type** %clone
%.tmp2436 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2435, i32 0, i32 0
%.tmp2437 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2438 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2437, i32 0, i32 0
%.tmp2439 = load i8*, i8** %.tmp2438
store i8* %.tmp2439, i8** %.tmp2436
%.tmp2440 = load %m1772$.Type.type*, %m1772$.Type.type** %clone
%.tmp2441 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2440, i32 0, i32 1
%.tmp2442 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2443 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2442, i32 0, i32 1
%.tmp2444 = load i8*, i8** %.tmp2443
store i8* %.tmp2444, i8** %.tmp2441
%.tmp2445 = load %m1772$.Type.type*, %m1772$.Type.type** %clone
ret %m1772$.Type.type* %.tmp2445
}
define %m1772$.Type.type* @m1772$new_type.m1772$.Type.typep() {
%.tmp2446 = getelementptr %m1772$.Type.type, %m1772$.Type.type* null, i32 1
%.tmp2447 = ptrtoint %m1772$.Type.type* %.tmp2446 to i32
%.tmp2448 = call i8*(i32) @malloc(i32 %.tmp2447)
%.tmp2449 = bitcast i8* %.tmp2448 to %m1772$.Type.type*
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp2449, %m1772$.Type.type** %type
%.tmp2450 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2451 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2450, i32 0, i32 1
store i8* null, i8** %.tmp2451
%.tmp2452 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2453 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2452, i32 0, i32 2
store i8* null, i8** %.tmp2453
%.tmp2454 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2455 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2454, i32 0, i32 0
store i8* null, i8** %.tmp2455
%.tmp2456 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2457 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2456, i32 0, i32 3
store %m1772$.Type.type* null, %m1772$.Type.type** %.tmp2457
%.tmp2458 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2459 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2458, i32 0, i32 4
store %m1772$.Type.type* null, %m1772$.Type.type** %.tmp2459
%.tmp2460 = load %m1772$.Type.type*, %m1772$.Type.type** %type
ret %m1772$.Type.type* %.tmp2460
}
define void @m1772$copy_type.v.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.dest.arg, %m1772$.Type.type* %.src.arg) {
%dest = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.dest.arg, %m1772$.Type.type** %dest
%src = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.src.arg, %m1772$.Type.type** %src
%.tmp2461 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2462 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2461, i32 0, i32 0
%.tmp2463 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2464 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2463, i32 0, i32 0
%.tmp2465 = load i8*, i8** %.tmp2464
store i8* %.tmp2465, i8** %.tmp2462
%.tmp2466 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2467 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2466, i32 0, i32 1
%.tmp2468 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2469 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2468, i32 0, i32 1
%.tmp2470 = load i8*, i8** %.tmp2469
store i8* %.tmp2470, i8** %.tmp2467
%.tmp2471 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2472 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2471, i32 0, i32 2
%.tmp2473 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2474 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2473, i32 0, i32 2
%.tmp2475 = load i8*, i8** %.tmp2474
store i8* %.tmp2475, i8** %.tmp2472
%.tmp2476 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2477 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2476, i32 0, i32 3
%.tmp2478 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2477
%.tmp2479 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2480 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2479, i32 0, i32 3
%.tmp2481 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2480
%.tmp2482 = icmp ne %m1772$.Type.type* %.tmp2478, %.tmp2481
br i1 %.tmp2482, label %.if.true.2483, label %.if.false.2483
.if.true.2483:
%.tmp2484 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2485 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2484, i32 0, i32 3
%.tmp2486 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2487 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2486, i32 0, i32 3
%.tmp2488 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2487
store %m1772$.Type.type* %.tmp2488, %m1772$.Type.type** %.tmp2485
%.tmp2489 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2490 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2489, i32 0, i32 3
%.tmp2491 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2490
%.tmp2492 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2493 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2492, i32 0, i32 3
%.tmp2494 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2493
call void(%m1772$.Type.type*,%m1772$.Type.type*) @m1772$copy_type.v.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp2491, %m1772$.Type.type* %.tmp2494)
br label %.if.end.2483
.if.false.2483:
br label %.if.end.2483
.if.end.2483:
%.tmp2495 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2496 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2495, i32 0, i32 4
%.tmp2497 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2496
%.tmp2498 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2499 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2498, i32 0, i32 4
%.tmp2500 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2499
%.tmp2501 = icmp ne %m1772$.Type.type* %.tmp2497, %.tmp2500
br i1 %.tmp2501, label %.if.true.2502, label %.if.false.2502
.if.true.2502:
%.tmp2503 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2504 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2503, i32 0, i32 4
%.tmp2505 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2506 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2505, i32 0, i32 4
%.tmp2507 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2506
store %m1772$.Type.type* %.tmp2507, %m1772$.Type.type** %.tmp2504
%.tmp2508 = load %m1772$.Type.type*, %m1772$.Type.type** %dest
%.tmp2509 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2508, i32 0, i32 4
%.tmp2510 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2509
%.tmp2511 = load %m1772$.Type.type*, %m1772$.Type.type** %src
%.tmp2512 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2511, i32 0, i32 4
%.tmp2513 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2512
call void(%m1772$.Type.type*,%m1772$.Type.type*) @m1772$copy_type.v.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp2510, %m1772$.Type.type* %.tmp2513)
br label %.if.end.2502
.if.false.2502:
br label %.if.end.2502
.if.end.2502:
ret void
}
define void @m1772$debug_type.v.m1772$.Type.typep.i(%m1772$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.t.arg, %m1772$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2514 = load i32, i32* %level
%.tmp2515 = add i32 %.tmp2514, 1
%.tmp2516 = call i8*(i32) @malloc(i32 %.tmp2515)
%.tmp2517 = bitcast i8* %.tmp2516 to i8*
%indent = alloca i8*
store i8* %.tmp2517, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2518
.for.start.2518:
%.tmp2519 = load i32, i32* %i
%.tmp2520 = load i32, i32* %level
%.tmp2521 = icmp slt i32 %.tmp2519, %.tmp2520
br i1 %.tmp2521, label %.for.continue.2518, label %.for.end.2518
.for.continue.2518:
%.tmp2522 = load i32, i32* %i
%.tmp2523 = load i8*, i8** %indent
%.tmp2524 = getelementptr i8, i8* %.tmp2523, i32 %.tmp2522
store i8 32, i8* %.tmp2524
%.tmp2525 = load i32, i32* %i
%.tmp2526 = add i32 %.tmp2525, 1
store i32 %.tmp2526, i32* %i
br label %.for.start.2518
.for.end.2518:
%.tmp2527 = load i32, i32* %level
%.tmp2528 = load i8*, i8** %indent
%.tmp2529 = getelementptr i8, i8* %.tmp2528, i32 %.tmp2527
store i8 0, i8* %.tmp2529
%.tmp2531 = getelementptr [5 x i8], [5 x i8]*@.str2530, i32 0, i32 0
%.tmp2532 = load i8*, i8** %indent
%.tmp2533 = call i32(i8*,...) @printf(i8* %.tmp2531, i8* %.tmp2532)
%.tmp2535 = getelementptr [21 x i8], [21 x i8]*@.str2534, i32 0, i32 0
%.tmp2536 = load i8*, i8** %indent
%.tmp2537 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2538 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2537, i32 0, i32 0
%.tmp2539 = load i8*, i8** %.tmp2538
%.tmp2540 = call i32(i8*,...) @printf(i8* %.tmp2535, i8* %.tmp2536, i8* %.tmp2539)
%.tmp2542 = getelementptr [16 x i8], [16 x i8]*@.str2541, i32 0, i32 0
%.tmp2543 = load i8*, i8** %indent
%.tmp2544 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2545 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2544, i32 0, i32 1
%.tmp2546 = load i8*, i8** %.tmp2545
%.tmp2547 = call i32(i8*,...) @printf(i8* %.tmp2542, i8* %.tmp2543, i8* %.tmp2546)
%.tmp2549 = getelementptr [16 x i8], [16 x i8]*@.str2548, i32 0, i32 0
%.tmp2550 = load i8*, i8** %indent
%.tmp2551 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2552 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2551, i32 0, i32 2
%.tmp2553 = load i8*, i8** %.tmp2552
%.tmp2554 = call i32(i8*,...) @printf(i8* %.tmp2549, i8* %.tmp2550, i8* %.tmp2553)
%.tmp2555 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2556 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2555, i32 0, i32 3
%.tmp2557 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2556
%.tmp2558 = icmp eq %m1772$.Type.type* %.tmp2557, null
br i1 %.tmp2558, label %.if.true.2559, label %.if.false.2559
.if.true.2559:
%.tmp2561 = getelementptr [16 x i8], [16 x i8]*@.str2560, i32 0, i32 0
%.tmp2562 = load i8*, i8** %indent
%.tmp2563 = call i32(i8*,...) @printf(i8* %.tmp2561, i8* %.tmp2562)
br label %.if.end.2559
.if.false.2559:
%.tmp2565 = getelementptr [10 x i8], [10 x i8]*@.str2564, i32 0, i32 0
%.tmp2566 = load i8*, i8** %indent
%.tmp2567 = call i32(i8*,...) @printf(i8* %.tmp2565, i8* %.tmp2566)
%.tmp2568 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2569 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2568, i32 0, i32 3
%.tmp2570 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2569
%.tmp2571 = load i32, i32* %level
%.tmp2572 = add i32 %.tmp2571, 1
call void(%m1772$.Type.type*,i32) @m1772$debug_type.v.m1772$.Type.typep.i(%m1772$.Type.type* %.tmp2570, i32 %.tmp2572)
br label %.if.end.2559
.if.end.2559:
%.tmp2573 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2574 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2573, i32 0, i32 4
%.tmp2575 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2574
%.tmp2576 = icmp eq %m1772$.Type.type* %.tmp2575, null
br i1 %.tmp2576, label %.if.true.2577, label %.if.false.2577
.if.true.2577:
%.tmp2579 = getelementptr [18 x i8], [18 x i8]*@.str2578, i32 0, i32 0
%.tmp2580 = load i8*, i8** %indent
%.tmp2581 = call i32(i8*,...) @printf(i8* %.tmp2579, i8* %.tmp2580)
br label %.if.end.2577
.if.false.2577:
%.tmp2583 = getelementptr [12 x i8], [12 x i8]*@.str2582, i32 0, i32 0
%.tmp2584 = load i8*, i8** %indent
%.tmp2585 = call i32(i8*,...) @printf(i8* %.tmp2583, i8* %.tmp2584)
%.tmp2586 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp2587 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2586, i32 0, i32 4
%.tmp2588 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2587
%.tmp2589 = load i32, i32* %level
%.tmp2590 = add i32 %.tmp2589, 1
call void(%m1772$.Type.type*,i32) @m1772$debug_type.v.m1772$.Type.typep.i(%m1772$.Type.type* %.tmp2588, i32 %.tmp2590)
br label %.if.end.2577
.if.end.2577:
%.tmp2592 = getelementptr [5 x i8], [5 x i8]*@.str2591, i32 0, i32 0
%.tmp2593 = load i8*, i8** %indent
%.tmp2594 = call i32(i8*,...) @printf(i8* %.tmp2592, i8* %.tmp2593)
ret void
}
%m1772$.AssignableInfo.type = type {i8*,i8,i8*,%m1772$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1772$.AssignableInfo.type* @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.node.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2595 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* null, i32 1
%.tmp2596 = ptrtoint %m1772$.AssignableInfo.type* %.tmp2595 to i32
%.tmp2597 = call i8*(i32) @malloc(i32 %.tmp2596)
%.tmp2598 = bitcast i8* %.tmp2597 to %m1772$.AssignableInfo.type*
%ptr = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp2598, %m1772$.AssignableInfo.type** %ptr
%.tmp2599 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2600 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2599, i32 0, i32 1
%.tmp2601 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2601, i8* %.tmp2600
%.tmp2602 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2603 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2602, i32 0, i32 0
store i8* null, i8** %.tmp2603
%.tmp2604 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2605 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2604, i32 0, i32 2
store i8* null, i8** %.tmp2605
%.tmp2606 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2607 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2606, i32 0, i32 3
store %m1772$.Type.type* null, %m1772$.Type.type** %.tmp2607
%.tmp2608 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2609 = icmp ne %m286$.Node.type* %.tmp2608, null
br i1 %.tmp2609, label %.if.true.2610, label %.if.false.2610
.if.true.2610:
%.tmp2611 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2612 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2611, i32 0, i32 4
%.tmp2613 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2614 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2613, i32 0, i32 3
%.tmp2615 = load i32, i32* %.tmp2614
store i32 %.tmp2615, i32* %.tmp2612
%.tmp2616 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2617 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2616, i32 0, i32 5
%.tmp2618 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2619 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2618, i32 0, i32 4
%.tmp2620 = load i32, i32* %.tmp2619
store i32 %.tmp2620, i32* %.tmp2617
%.tmp2621 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2622 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2621, i32 0, i32 6
%.tmp2623 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2624 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2623, i32 0, i32 2
%.tmp2625 = load i8*, i8** %.tmp2624
store i8* %.tmp2625, i8** %.tmp2622
br label %.if.end.2610
.if.false.2610:
%.tmp2626 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2627 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2626, i32 0, i32 4
store i32 0, i32* %.tmp2627
%.tmp2628 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2629 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2628, i32 0, i32 5
store i32 0, i32* %.tmp2629
%.tmp2630 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
%.tmp2631 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2630, i32 0, i32 6
store i8* null, i8** %.tmp2631
br label %.if.end.2610
.if.end.2610:
%.tmp2632 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %ptr
ret %m1772$.AssignableInfo.type* %.tmp2632
}
define void @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.info.arg, %m1772$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2633 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2634 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2633, i32 0, i32 0
%.tmp2635 = load i8*, i8** %id
store i8* %.tmp2635, i8** %.tmp2634
%.tmp2636 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2637 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2636, i32 0, i32 1
%.tmp2638 = load i8, i8* %scope
store i8 %.tmp2638, i8* %.tmp2637
ret void
}
define i8* @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.info.arg, %m1772$.AssignableInfo.type** %info
%.tmp2639 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2640 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2639, i32 0, i32 1
%.tmp2641 = load i8, i8* %.tmp2640
%.tmp2642 = load i8, i8* @SCOPE_CONST
%.tmp2643 = icmp eq i8 %.tmp2641, %.tmp2642
br i1 %.tmp2643, label %.if.true.2644, label %.if.false.2644
.if.true.2644:
%.tmp2645 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2646 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2645, i32 0, i32 0
%.tmp2647 = load i8*, i8** %.tmp2646
ret i8* %.tmp2647
br label %.if.end.2644
.if.false.2644:
br label %.if.end.2644
.if.end.2644:
%buf = alloca i8*
%.tmp2648 = getelementptr i8*, i8** %buf, i32 0
%.tmp2650 = getelementptr [5 x i8], [5 x i8]*@.str2649, i32 0, i32 0
%.tmp2651 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2652 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2651, i32 0, i32 1
%.tmp2653 = load i8, i8* %.tmp2652
%.tmp2654 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2655 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2654, i32 0, i32 0
%.tmp2656 = load i8*, i8** %.tmp2655
%.tmp2657 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2648, i8* %.tmp2650, i8 %.tmp2653, i8* %.tmp2656)
%.tmp2658 = load i8*, i8** %buf
ret i8* %.tmp2658
}
%m1772$.ScopeItem.type = type {i8*,%m1772$.AssignableInfo.type*,%m1772$.ScopeItem.type*}
%m1772$.GlobalName.type = type {i8*,i8*,i1,%m1772$.AssignableInfo.type*,%m1772$.GlobalName.type*}
%m1772$.Scope.type = type {i8*,%m1772$.ScopeItem.type*,%m1772$.Scope.type*}
%m1772$.ModuleLookup.type = type {i8*,i8*,%m1772$.ModuleLookup.type*,%m1772$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1772$.CompilerCtx.type = type {%m286$.Node.type*,%m0$.File.type*,%m1772$.ErrorList.type*,%m1772$.GlobalName.type*,i32,%m1772$.ModuleLookup.type*,i8*}
define void @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.info.arg, %m1772$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp2659 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2661 = getelementptr [7 x i8], [7 x i8]*@.str2660, i32 0, i32 0
%.tmp2662 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2663 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp2662)
%.tmp2664 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2659, i8* %.tmp2661, i32 %.tmp2663)
%.tmp2665 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp2666 = load i8, i8* @SCOPE_LOCAL
%.tmp2667 = load i8*, i8** %tmp_buff
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp2665, i8 %.tmp2666, i8* %.tmp2667)
ret void
}
define %m1772$.ModuleLookup.type* @m1772$get_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2669 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2670 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2669, i32 0, i32 5
%.tmp2671 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp2670
%m = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp2671, %m1772$.ModuleLookup.type** %m
br label %.for.start.2668
.for.start.2668:
%.tmp2672 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2673 = icmp ne %m1772$.ModuleLookup.type* %.tmp2672, null
br i1 %.tmp2673, label %.for.continue.2668, label %.for.end.2668
.for.continue.2668:
%.tmp2674 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2675 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2674, i32 0, i32 0
%.tmp2676 = load i8*, i8** %.tmp2675
%.tmp2677 = load i8*, i8** %filename
%.tmp2678 = call i32(i8*,i8*) @strcmp(i8* %.tmp2676, i8* %.tmp2677)
%.tmp2679 = icmp eq i32 %.tmp2678, 0
br i1 %.tmp2679, label %.if.true.2680, label %.if.false.2680
.if.true.2680:
%.tmp2681 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
ret %m1772$.ModuleLookup.type* %.tmp2681
br label %.if.end.2680
.if.false.2680:
br label %.if.end.2680
.if.end.2680:
%.tmp2682 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2683 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2682, i32 0, i32 2
%.tmp2684 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp2683
store %m1772$.ModuleLookup.type* %.tmp2684, %m1772$.ModuleLookup.type** %m
br label %.for.start.2668
.for.end.2668:
%.tmp2685 = bitcast ptr null to %m1772$.ModuleLookup.type*
ret %m1772$.ModuleLookup.type* %.tmp2685
}
define %m1772$.ModuleLookup.type* @m1772$get_current_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%.tmp2686 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2687 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2688 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2687, i32 0, i32 6
%.tmp2689 = load i8*, i8** %.tmp2688
%.tmp2690 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*,i8*) @m1772$get_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.tmp2686, i8* %.tmp2689)
ret %m1772$.ModuleLookup.type* %.tmp2690
}
define i32 @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%.tmp2691 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2692 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2691, i32 0, i32 4
%.tmp2693 = load i32, i32* %.tmp2692
%uid = alloca i32
store i32 %.tmp2693, i32* %uid
%.tmp2694 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2695 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2694, i32 0, i32 4
%.tmp2696 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2697 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2696, i32 0, i32 4
%.tmp2698 = load i32, i32* %.tmp2697
%.tmp2699 = add i32 %.tmp2698, 1
store i32 %.tmp2699, i32* %.tmp2695
%.tmp2700 = load i32, i32* %uid
ret i32 %.tmp2700
}
define %m1772$.CompilerCtx.type* @m1772$new_context.m1772$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2701 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* null, i32 1
%.tmp2702 = ptrtoint %m1772$.CompilerCtx.type* %.tmp2701 to i32
%.tmp2703 = call i8*(i32) @malloc(i32 %.tmp2702)
%.tmp2704 = bitcast i8* %.tmp2703 to %m1772$.CompilerCtx.type*
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.tmp2704, %m1772$.CompilerCtx.type** %ctx
%.tmp2705 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2706 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2705, i32 0, i32 1
%.tmp2707 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2707, %m0$.File.type** %.tmp2706
%.tmp2708 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2709 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2708, i32 0, i32 0
%.tmp2710 = bitcast ptr null to %m286$.Node.type*
store %m286$.Node.type* %.tmp2710, %m286$.Node.type** %.tmp2709
%.tmp2711 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2712 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2711, i32 0, i32 2
store %m1772$.ErrorList.type* null, %m1772$.ErrorList.type** %.tmp2712
%.tmp2713 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2714 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2713, i32 0, i32 4
store i32 0, i32* %.tmp2714
%.tmp2715 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2716 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2715, i32 0, i32 3
store %m1772$.GlobalName.type* null, %m1772$.GlobalName.type** %.tmp2716
%.tmp2717 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2718 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2717, i32 0, i32 6
%.tmp2719 = load i8*, i8** %filename
store i8* %.tmp2719, i8** %.tmp2718
%.tmp2720 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2721 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2720, i32 0, i32 5
%.tmp2722 = load i32, i32* @ModuleLookup_size
%.tmp2723 = call i8*(i32) @malloc(i32 %.tmp2722)
%.tmp2724 = bitcast i8* %.tmp2723 to %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp2724, %m1772$.ModuleLookup.type** %.tmp2721
%.tmp2725 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2726 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2725, i32 0, i32 5
%.tmp2727 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp2726
%.tmp2728 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2727, i32 0, i32 0
%.tmp2729 = load i8*, i8** %filename
store i8* %.tmp2729, i8** %.tmp2728
%.tmp2730 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2731 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2730, i32 0, i32 5
%.tmp2732 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp2731
%.tmp2733 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2732, i32 0, i32 3
store %m1772$.Scope.type* null, %m1772$.Scope.type** %.tmp2733
%.tmp2734 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2735 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2734, i32 0, i32 5
%.tmp2736 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp2735
%.tmp2737 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2736, i32 0, i32 1
%.tmp2739 = getelementptr [1 x i8], [1 x i8]*@.str2738, i32 0, i32 0
store i8* %.tmp2739, i8** %.tmp2737
%.tmp2740 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2741 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2740, i32 0, i32 5
%.tmp2742 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp2741
%.tmp2743 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2742, i32 0, i32 2
store %m1772$.ModuleLookup.type* null, %m1772$.ModuleLookup.type** %.tmp2743
%.tmp2744 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2745 = bitcast %m1772$.CompilerCtx.type* %.tmp2744 to %m1772$.CompilerCtx.type*
ret %m1772$.CompilerCtx.type* %.tmp2745
}
define void @m1772$push_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%.tmp2746 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* null, i32 1
%.tmp2747 = ptrtoint %m1772$.Scope.type* %.tmp2746 to i32
%.tmp2748 = call i8*(i32) @malloc(i32 %.tmp2747)
%.tmp2749 = bitcast i8* %.tmp2748 to %m1772$.Scope.type*
%s = alloca %m1772$.Scope.type*
store %m1772$.Scope.type* %.tmp2749, %m1772$.Scope.type** %s
%.tmp2750 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2751 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*) @m1772$get_current_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp2750)
%m = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp2751, %m1772$.ModuleLookup.type** %m
%.tmp2752 = load %m1772$.Scope.type*, %m1772$.Scope.type** %s
%.tmp2753 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp2752, i32 0, i32 2
%.tmp2754 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2755 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2754, i32 0, i32 3
%.tmp2756 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp2755
store %m1772$.Scope.type* %.tmp2756, %m1772$.Scope.type** %.tmp2753
%.tmp2757 = load %m1772$.Scope.type*, %m1772$.Scope.type** %s
%.tmp2758 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp2757, i32 0, i32 1
store %m1772$.ScopeItem.type* null, %m1772$.ScopeItem.type** %.tmp2758
%.tmp2759 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2760 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2759, i32 0, i32 3
%.tmp2761 = load %m1772$.Scope.type*, %m1772$.Scope.type** %s
store %m1772$.Scope.type* %.tmp2761, %m1772$.Scope.type** %.tmp2760
ret void
}
define void @m1772$pop_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%.tmp2762 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2763 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*) @m1772$get_current_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp2762)
%m = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp2763, %m1772$.ModuleLookup.type** %m
%.tmp2764 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2765 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2764, i32 0, i32 3
%.tmp2766 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp2765
%.tmp2767 = icmp ne %m1772$.Scope.type* %.tmp2766, null
%.tmp2769 = getelementptr [61 x i8], [61 x i8]*@.str2768, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2767, i8* %.tmp2769)
%.tmp2770 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2771 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2770, i32 0, i32 3
%.tmp2772 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2773 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2772, i32 0, i32 3
%.tmp2774 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp2773
%.tmp2775 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp2774, i32 0, i32 2
%.tmp2776 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp2775
store %m1772$.Scope.type* %.tmp2776, %m1772$.Scope.type** %.tmp2771
ret void
}
define i1 @m1772$compile_file.b.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2777 = call i8*() @m1773$grammar.cp()
%.tmp2778 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2777)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2778, %m0$.File.type** %grammar_file
%.tmp2779 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2780 = icmp eq %m0$.File.type* %.tmp2779, null
br i1 %.tmp2780, label %.if.true.2781, label %.if.false.2781
.if.true.2781:
ret i1 0
br label %.if.end.2781
.if.false.2781:
br label %.if.end.2781
.if.end.2781:
%.tmp2782 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2783 = call %m286$.ParsingContext.type*(%m0$.File.type*) @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2782)
%grammar_ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp2783, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2784 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2785 = call %m286$.Rule.type**(%m286$.ParsingContext.type*) @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp2784)
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp2785, %m286$.Rule.type*** %grammar
%.tmp2786 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2787 = bitcast %m286$.ParsingContext.type* %.tmp2786 to i8*
call void(i8*) @free(i8* %.tmp2787)
%.tmp2788 = load i8*, i8** %filepath
%.tmp2789 = load i32, i32* @O_RDONLY
%.tmp2790 = call i32(i8*,i32) @open(i8* %.tmp2788, i32 %.tmp2789)
%input_fd = alloca i32
store i32 %.tmp2790, i32* %input_fd
%.tmp2791 = load i32, i32* %input_fd
%.tmp2792 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp2791)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp2792, %m209$.PeekerInfo.type** %p
%.tmp2793 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2794 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp2793, i32 0, i32 6
%.tmp2795 = load i8*, i8** %filepath
store i8* %.tmp2795, i8** %.tmp2794
%.tmp2796 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2797 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp2796, i1 0)
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp2797, %m287$.Token.type** %tokens
%.tmp2798 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp2800 = getelementptr [6 x i8], [6 x i8]*@.str2799, i32 0, i32 0
%.tmp2801 = load %m287$.Token.type*, %m287$.Token.type** %tokens
%.tmp2802 = call %m286$.ParseResult.type*(%m286$.Rule.type**,i8*,%m287$.Token.type*) @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.tmp2798, i8* %.tmp2800, %m287$.Token.type* %.tmp2801)
%ast = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp2802, %m286$.ParseResult.type** %ast
%.tmp2803 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2804 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %ast
%.tmp2805 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp2804, i32 0, i32 1
%.tmp2806 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2805
%.tmp2807 = call i1(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile.b.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp2803, %m286$.Node.type* %.tmp2806)
ret i1 %.tmp2807
}
define i1 @m1772$compile.b.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2808 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2809 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2808, i32 0, i32 0
%.tmp2810 = load i8*, i8** %.tmp2809
%.tmp2812 = getelementptr [6 x i8], [6 x i8]*@.str2811, i32 0, i32 0
%.tmp2813 = call i32(i8*,i8*) @strcmp(i8* %.tmp2810, i8* %.tmp2812)
%.tmp2814 = icmp ne i32 %.tmp2813, 0
br i1 %.tmp2814, label %.if.true.2815, label %.if.false.2815
.if.true.2815:
ret i1 0
br label %.if.end.2815
.if.false.2815:
br label %.if.end.2815
.if.end.2815:
%.tmp2816 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
call void(%m1772$.CompilerCtx.type*) @m1772$push_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp2816)
%.tmp2817 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2818 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2817, i32 0, i32 6
%.tmp2819 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2818
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2819, %m286$.Node.type** %start
%.tmp2820 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2821 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2820, i32 0, i32 0
%.tmp2822 = load i8*, i8** %.tmp2821
%.tmp2824 = getelementptr [13 x i8], [13 x i8]*@.str2823, i32 0, i32 0
%.tmp2825 = call i32(i8*,i8*) @strcmp(i8* %.tmp2822, i8* %.tmp2824)
%.tmp2826 = icmp eq i32 %.tmp2825, 0
br i1 %.tmp2826, label %.if.true.2827, label %.if.false.2827
.if.true.2827:
%.tmp2828 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2829 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2828, i32 0, i32 7
%.tmp2830 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2829
store %m286$.Node.type* %.tmp2830, %m286$.Node.type** %start
br label %.if.end.2827
.if.false.2827:
br label %.if.end.2827
.if.end.2827:
%.tmp2832 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2832, %m286$.Node.type** %stmt
br label %.for.start.2831
.for.start.2831:
%.tmp2833 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2834 = icmp ne %m286$.Node.type* %.tmp2833, null
br i1 %.tmp2834, label %.for.continue.2831, label %.for.end.2831
.for.continue.2831:
%.tmp2835 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2836 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2837 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2836, i32 0, i32 6
%.tmp2838 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2837
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1772$compile_statement.v.m1772$.CompilerCtx.typep.m286$.Node.typep.b(%m1772$.CompilerCtx.type* %.tmp2835, %m286$.Node.type* %.tmp2838, i1 1)
%.tmp2839 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2840 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2839, i32 0, i32 7
%.tmp2841 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2840
store %m286$.Node.type* %.tmp2841, %m286$.Node.type** %stmt
br label %.for.start.2831
.for.end.2831:
%.tmp2843 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2843, %m286$.Node.type** %s
br label %.for.start.2842
.for.start.2842:
%.tmp2844 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2845 = icmp ne %m286$.Node.type* %.tmp2844, null
br i1 %.tmp2845, label %.for.continue.2842, label %.for.end.2842
.for.continue.2842:
%.tmp2846 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2847 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2848 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2847, i32 0, i32 6
%.tmp2849 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2848
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1772$compile_statement.v.m1772$.CompilerCtx.typep.m286$.Node.typep.b(%m1772$.CompilerCtx.type* %.tmp2846, %m286$.Node.type* %.tmp2849, i1 0)
%.tmp2850 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2851 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2850, i32 0, i32 7
%.tmp2852 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2851
store %m286$.Node.type* %.tmp2852, %m286$.Node.type** %s
br label %.for.start.2842
.for.end.2842:
%.tmp2853 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2854 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2853, i32 0, i32 2
%.tmp2855 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp2854
%.tmp2856 = icmp ne %m1772$.ErrorList.type* %.tmp2855, null
%has_errors = alloca i1
store i1 %.tmp2856, i1* %has_errors
%.tmp2858 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2859 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2858, i32 0, i32 2
%.tmp2860 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp2859
%err = alloca %m1772$.ErrorList.type*
store %m1772$.ErrorList.type* %.tmp2860, %m1772$.ErrorList.type** %err
br label %.for.start.2857
.for.start.2857:
%.tmp2861 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %err
%.tmp2862 = icmp ne %m1772$.ErrorList.type* %.tmp2861, null
br i1 %.tmp2862, label %.for.continue.2857, label %.for.end.2857
.for.continue.2857:
%.tmp2863 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %err
%.tmp2864 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp2863, i32 0, i32 0
%.tmp2865 = load %m717$.Error.type*, %m717$.Error.type** %.tmp2864
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp2865)
%.tmp2866 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %err
%.tmp2867 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp2866, i32 0, i32 1
%.tmp2868 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp2867
store %m1772$.ErrorList.type* %.tmp2868, %m1772$.ErrorList.type** %err
br label %.for.start.2857
.for.end.2857:
%.tmp2870 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2871 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2870, i32 0, i32 3
%.tmp2872 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %.tmp2871
%g = alloca %m1772$.GlobalName.type*
store %m1772$.GlobalName.type* %.tmp2872, %m1772$.GlobalName.type** %g
br label %.for.start.2869
.for.start.2869:
%.tmp2873 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2874 = icmp ne %m1772$.GlobalName.type* %.tmp2873, null
br i1 %.tmp2874, label %.for.continue.2869, label %.for.end.2869
.for.continue.2869:
%.tmp2875 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2876 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
call void(%m1772$.CompilerCtx.type*,%m1772$.GlobalName.type*) @m1772$compile_global.v.m1772$.CompilerCtx.typep.m1772$.GlobalName.typep(%m1772$.CompilerCtx.type* %.tmp2875, %m1772$.GlobalName.type* %.tmp2876)
%.tmp2877 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2878 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2877, i32 0, i32 4
%.tmp2879 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %.tmp2878
store %m1772$.GlobalName.type* %.tmp2879, %m1772$.GlobalName.type** %g
br label %.for.start.2869
.for.end.2869:
%.tmp2880 = load i1, i1* %has_errors
ret i1 %.tmp2880
}
define void @m1772$compile_global.v.m1772$.CompilerCtx.typep.m1772$.GlobalName.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%g = alloca %m1772$.GlobalName.type*
store %m1772$.GlobalName.type* %.g.arg, %m1772$.GlobalName.type** %g
%.tmp2881 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2882 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2881, i32 0, i32 2
%.tmp2883 = load i1, i1* %.tmp2882
%.tmp2884 = icmp eq i1 %.tmp2883, 0
%.tmp2885 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2886 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2885, i32 0, i32 1
%.tmp2887 = load i8*, i8** %.tmp2886
%.tmp2889 = getelementptr [7 x i8], [7 x i8]*@.str2888, i32 0, i32 0
%.tmp2890 = call i32(i8*,i8*) @strcmp(i8* %.tmp2887, i8* %.tmp2889)
%.tmp2891 = icmp eq i32 %.tmp2890, 0
%.tmp2892 = and i1 %.tmp2884, %.tmp2891
br i1 %.tmp2892, label %.if.true.2893, label %.if.false.2893
.if.true.2893:
%.tmp2894 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2895 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp2894, i32 0, i32 1
%.tmp2896 = load %m0$.File.type*, %m0$.File.type** %.tmp2895
%.tmp2898 = getelementptr [21 x i8], [21 x i8]*@.str2897, i32 0, i32 0
%.tmp2899 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2900 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2899, i32 0, i32 3
%.tmp2901 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp2900
%.tmp2902 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp2901)
%.tmp2903 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2904 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2905 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2904, i32 0, i32 3
%.tmp2906 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp2905
%.tmp2907 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp2906, i32 0, i32 3
%.tmp2908 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2907
%.tmp2909 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp2903, %m1772$.Type.type* %.tmp2908)
%.tmp2910 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2911 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2910, i32 0, i32 0
%.tmp2912 = load i8*, i8** %.tmp2911
%.tmp2913 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2896, i8* %.tmp2898, i8* %.tmp2902, i8* %.tmp2909, i8* %.tmp2912)
%.tmp2914 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
%.tmp2915 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp2914, i32 0, i32 2
store i1 1, i1* %.tmp2915
br label %.if.end.2893
.if.false.2893:
br label %.if.end.2893
.if.end.2893:
ret void
}
define i8* @m1772$get_mod_prefix.cp.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2916 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2917 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*) @m1772$get_current_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp2916)
%m = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp2917, %m1772$.ModuleLookup.type** %m
%.tmp2918 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp2919 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp2918, i32 0, i32 1
%.tmp2920 = load i8*, i8** %.tmp2919
ret i8* %.tmp2920
}
define i8* @m1772$name_mangle.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1772$.Type.type* %.type.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%fn = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn.arg, %m286$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.type.arg, %m1772$.Type.type** %type
%mangled_name = alloca i8*
%.tmp2921 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2922 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2923 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2922, i32 0, i32 2
%.tmp2924 = load i8*, i8** %.tmp2923
%.tmp2925 = call i8*(%m1772$.CompilerCtx.type*,i8*) @m1772$get_mod_prefix.cp.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.tmp2921, i8* %.tmp2924)
%prefix = alloca i8*
store i8* %.tmp2925, i8** %prefix
%.tmp2926 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2928 = getelementptr [5 x i8], [5 x i8]*@.str2927, i32 0, i32 0
%.tmp2929 = load i8*, i8** %prefix
%.tmp2930 = load i8*, i8** %original_name
%.tmp2931 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2926, i8* %.tmp2928, i8* %.tmp2929, i8* %.tmp2930)
%.tmp2932 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2933 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2932, i32 0, i32 0
%.tmp2934 = load i8*, i8** %.tmp2933
%.tmp2936 = getelementptr [9 x i8], [9 x i8]*@.str2935, i32 0, i32 0
%.tmp2937 = call i32(i8*,i8*) @strcmp(i8* %.tmp2934, i8* %.tmp2936)
%.tmp2938 = icmp eq i32 %.tmp2937, 0
br i1 %.tmp2938, label %.if.true.2939, label %.if.false.2939
.if.true.2939:
%.tmp2940 = load i8*, i8** %mangled_name
%.tmp2942 = getelementptr [5 x i8], [5 x i8]*@.str2941, i32 0, i32 0
%.tmp2943 = call i32(i8*,i8*) @strcmp(i8* %.tmp2940, i8* %.tmp2942)
%.tmp2944 = icmp ne i32 %.tmp2943, 0
br i1 %.tmp2944, label %.if.true.2945, label %.if.false.2945
.if.true.2945:
%tmp_buff = alloca i8*
%swap_var = alloca i8*
%.tmp2947 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp2948 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2947, i32 0, i32 3
%.tmp2949 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2948
%tp = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp2949, %m1772$.Type.type** %tp
br label %.for.start.2946
.for.start.2946:
%.tmp2950 = load %m1772$.Type.type*, %m1772$.Type.type** %tp
%.tmp2951 = icmp ne %m1772$.Type.type* %.tmp2950, null
br i1 %.tmp2951, label %.for.continue.2946, label %.for.end.2946
.for.continue.2946:
%.tmp2952 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2954 = getelementptr [6 x i8], [6 x i8]*@.str2953, i32 0, i32 0
%.tmp2955 = load i8*, i8** %mangled_name
%.tmp2956 = load %m1772$.Type.type*, %m1772$.Type.type** %tp
%.tmp2957 = call i8*(%m1772$.Type.type*) @m1772$type_abbr.cp.m1772$.Type.typep(%m1772$.Type.type* %.tmp2956)
%.tmp2958 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2952, i8* %.tmp2954, i8* %.tmp2955, i8* %.tmp2957)
%.tmp2959 = load i8*, i8** %tmp_buff
store i8* %.tmp2959, i8** %swap_var
%.tmp2960 = load i8*, i8** %mangled_name
store i8* %.tmp2960, i8** %tmp_buff
%.tmp2961 = load i8*, i8** %swap_var
store i8* %.tmp2961, i8** %mangled_name
%.tmp2962 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2962)
%.tmp2963 = load %m1772$.Type.type*, %m1772$.Type.type** %tp
%.tmp2964 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp2963, i32 0, i32 4
%.tmp2965 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp2964
store %m1772$.Type.type* %.tmp2965, %m1772$.Type.type** %tp
br label %.for.start.2946
.for.end.2946:
br label %.if.end.2945
.if.false.2945:
br label %.if.end.2945
.if.end.2945:
br label %.if.end.2939
.if.false.2939:
br label %.if.end.2939
.if.end.2939:
%.tmp2966 = load i8*, i8** %mangled_name
ret i8* %.tmp2966
}
define void @m1772$compile_statement.v.m1772$.CompilerCtx.typep.m286$.Node.typep.b(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info = alloca %m1772$.AssignableInfo.type*
%return_type = alloca %m1772$.Type.type*
%err_buf = alloca i8*
%tmp_buff = alloca i8*
%.tmp2967 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2968 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2967, i32 0, i32 0
%.tmp2969 = load i8*, i8** %.tmp2968
%.tmp2971 = getelementptr [3 x i8], [3 x i8]*@.str2970, i32 0, i32 0
%.tmp2972 = call i32(i8*,i8*) @strcmp(i8* %.tmp2969, i8* %.tmp2971)
%.tmp2973 = icmp eq i32 %.tmp2972, 0
br i1 %.tmp2973, label %.if.true.2974, label %.if.false.2974
.if.true.2974:
ret void
br label %.if.end.2974
.if.false.2974:
%.tmp2975 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2976 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2975, i32 0, i32 0
%.tmp2977 = load i8*, i8** %.tmp2976
%.tmp2979 = getelementptr [7 x i8], [7 x i8]*@.str2978, i32 0, i32 0
%.tmp2980 = call i32(i8*,i8*) @strcmp(i8* %.tmp2977, i8* %.tmp2979)
%.tmp2981 = icmp eq i32 %.tmp2980, 0
br i1 %.tmp2981, label %.if.true.2982, label %.if.false.2982
.if.true.2982:
%.tmp2983 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2984 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2983, i32 0, i32 6
%.tmp2985 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2984
%.tmp2987 = getelementptr [11 x i8], [11 x i8]*@.str2986, i32 0, i32 0
%.tmp2988 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp2985, i8* %.tmp2987)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2988, %m286$.Node.type** %assignable
%.tmp2989 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp2990 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp2991 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp2989, %m286$.Node.type* %.tmp2990)
%a_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp2991, %m1772$.AssignableInfo.type** %a_info
%.tmp2992 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp2993 = icmp eq %m1772$.AssignableInfo.type* %.tmp2992, null
br i1 %.tmp2993, label %.if.true.2994, label %.if.false.2994
.if.true.2994:
ret void
br label %.if.end.2994
.if.false.2994:
br label %.if.end.2994
.if.end.2994:
%.tmp2995 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2996 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp2995)
store %m1772$.AssignableInfo.type* %.tmp2996, %m1772$.AssignableInfo.type** %info
%.tmp2997 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2997, i32 0, i32 6
%.tmp2999 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2998
%.tmp3000 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2999, i32 0, i32 7
%.tmp3001 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3000
%.tmp3002 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3001, i32 0, i32 1
%.tmp3003 = load i8*, i8** %.tmp3002
%global_name = alloca i8*
store i8* %.tmp3003, i8** %global_name
%.tmp3004 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3005 = load i8, i8* @SCOPE_GLOBAL
%.tmp3006 = load i8*, i8** %global_name
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp3004, i8 %.tmp3005, i8* %.tmp3006)
%.tmp3007 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3008 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3007, i32 0, i32 3
%.tmp3009 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp3010 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3009, i32 0, i32 3
%.tmp3011 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3010
store %m1772$.Type.type* %.tmp3011, %m1772$.Type.type** %.tmp3008
%.tmp3012 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3013 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3012, i32 0, i32 2
%.tmp3015 = getelementptr [9 x i8], [9 x i8]*@.str3014, i32 0, i32 0
store i8* %.tmp3015, i8** %.tmp3013
%.tmp3016 = load i1, i1* %shallow
%.tmp3017 = icmp eq i1 %.tmp3016, 1
br i1 %.tmp3017, label %.if.true.3018, label %.if.false.3018
.if.true.3018:
%.tmp3019 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3020 = load i8*, i8** %global_name
%.tmp3021 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3019, i8* %.tmp3020, %m1772$.AssignableInfo.type* %.tmp3021)
br label %.if.end.3018
.if.false.3018:
%.tmp3022 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3023 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3022, i32 0, i32 1
%.tmp3024 = load %m0$.File.type*, %m0$.File.type** %.tmp3023
%.tmp3026 = getelementptr [21 x i8], [21 x i8]*@.str3025, i32 0, i32 0
%.tmp3027 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3028 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3027)
%.tmp3029 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3030 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3031 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3030, i32 0, i32 3
%.tmp3032 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3031
%.tmp3033 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3029, %m1772$.Type.type* %.tmp3032)
%.tmp3034 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp3035 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3034)
%.tmp3036 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3024, i8* %.tmp3026, i8* %.tmp3028, i8* %.tmp3033, i8* %.tmp3035)
br label %.if.end.3018
.if.end.3018:
br label %.if.end.2982
.if.false.2982:
%.tmp3037 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3038 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3037, i32 0, i32 0
%.tmp3039 = load i8*, i8** %.tmp3038
%.tmp3041 = getelementptr [10 x i8], [10 x i8]*@.str3040, i32 0, i32 0
%.tmp3042 = call i32(i8*,i8*) @strcmp(i8* %.tmp3039, i8* %.tmp3041)
%.tmp3043 = icmp eq i32 %.tmp3042, 0
br i1 %.tmp3043, label %.if.true.3044, label %.if.false.3044
.if.true.3044:
%.tmp3045 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3046 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3045, i32 0, i32 6
%.tmp3047 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3046
%.tmp3048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3047, i32 0, i32 7
%.tmp3049 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3048
%.tmp3050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3049, i32 0, i32 1
%.tmp3051 = load i8*, i8** %.tmp3050
%type_name = alloca i8*
store i8* %.tmp3051, i8** %type_name
%.tmp3052 = load i1, i1* %shallow
%.tmp3053 = icmp eq i1 %.tmp3052, 1
br i1 %.tmp3053, label %.if.true.3054, label %.if.false.3054
.if.true.3054:
%.tmp3055 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3056 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3055)
store %m1772$.AssignableInfo.type* %.tmp3056, %m1772$.AssignableInfo.type** %info
%.tmp3057 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3058 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*) @m1772$get_current_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3057)
%mod_from = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp3058, %m1772$.ModuleLookup.type** %mod_from
%.tmp3059 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3061 = getelementptr [11 x i8], [11 x i8]*@.str3060, i32 0, i32 0
%.tmp3062 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod_from
%.tmp3063 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3062, i32 0, i32 1
%.tmp3064 = load i8*, i8** %.tmp3063
%.tmp3065 = load i8*, i8** %type_name
%.tmp3066 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3059, i8* %.tmp3061, i8* %.tmp3064, i8* %.tmp3065)
%.tmp3067 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3068 = load i8, i8* @SCOPE_LOCAL
%.tmp3069 = load i8*, i8** %tmp_buff
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp3067, i8 %.tmp3068, i8* %.tmp3069)
%.tmp3070 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3071 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3070, i32 0, i32 2
%.tmp3073 = getelementptr [10 x i8], [10 x i8]*@.str3072, i32 0, i32 0
store i8* %.tmp3073, i8** %.tmp3071
%.tmp3074 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3075 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3074, i32 0, i32 4
%.tmp3076 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3077 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3076, i32 0, i32 3
%.tmp3078 = load i32, i32* %.tmp3077
store i32 %.tmp3078, i32* %.tmp3075
%.tmp3079 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3080 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3079, i32 0, i32 5
%.tmp3081 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3082 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3081, i32 0, i32 4
%.tmp3083 = load i32, i32* %.tmp3082
store i32 %.tmp3083, i32* %.tmp3080
%.tmp3084 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3085 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3084, i32 0, i32 3
%.tmp3086 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp3086, %m1772$.Type.type** %.tmp3085
%.tmp3087 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3088 = load i8*, i8** %type_name
%.tmp3089 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3087, i8* %.tmp3088, %m1772$.AssignableInfo.type* %.tmp3089)
%.tmp3090 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3091 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3090, i32 0, i32 6
%.tmp3092 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3091
%.tmp3094 = getelementptr [5 x i8], [5 x i8]*@.str3093, i32 0, i32 0
%.tmp3095 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3092, i8* %.tmp3094)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3095, %m286$.Node.type** %type_decl
%.tmp3096 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3097 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp3098 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3097, i32 0, i32 6
%.tmp3099 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3098
%.tmp3100 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3096, %m286$.Node.type* %.tmp3099)
%type_struct = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp3100, %m1772$.Type.type** %type_struct
%.tmp3101 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3102 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3101, i32 0, i32 3
%.tmp3103 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3102
%.tmp3104 = load %m1772$.Type.type*, %m1772$.Type.type** %type_struct
call void(%m1772$.Type.type*,%m1772$.Type.type*) @m1772$copy_type.v.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp3103, %m1772$.Type.type* %.tmp3104)
%.tmp3105 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3106 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3105, i32 0, i32 3
%.tmp3107 = load %m1772$.Type.type*, %m1772$.Type.type** %type_struct
store %m1772$.Type.type* %.tmp3107, %m1772$.Type.type** %.tmp3106
br label %.if.end.3054
.if.false.3054:
%.tmp3108 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3109 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3110 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3109, i32 0, i32 6
%.tmp3111 = load i8*, i8** %.tmp3110
%.tmp3112 = load i8*, i8** %type_name
%.tmp3113 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,i8*,i8*) @m1772$find_defined_str.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.cp(%m1772$.CompilerCtx.type* %.tmp3108, i8* %.tmp3111, i8* %.tmp3112)
%scope = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp3113, %m1772$.ScopeItem.type** %scope
%.tmp3114 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %scope
%.tmp3115 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp3114, i32 0, i32 1
%.tmp3116 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp3115
store %m1772$.AssignableInfo.type* %.tmp3116, %m1772$.AssignableInfo.type** %info
%.tmp3117 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3118 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3117, i32 0, i32 1
%.tmp3119 = load %m0$.File.type*, %m0$.File.type** %.tmp3118
%.tmp3121 = getelementptr [14 x i8], [14 x i8]*@.str3120, i32 0, i32 0
%.tmp3122 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3123 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3122)
%.tmp3124 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3125 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3126 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3125, i32 0, i32 3
%.tmp3127 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3126
%.tmp3128 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3124, %m1772$.Type.type* %.tmp3127)
%.tmp3129 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3119, i8* %.tmp3121, i8* %.tmp3123, i8* %.tmp3128)
br label %.if.end.3054
.if.end.3054:
br label %.if.end.3044
.if.false.3044:
%.tmp3130 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3131 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3130, i32 0, i32 0
%.tmp3132 = load i8*, i8** %.tmp3131
%.tmp3134 = getelementptr [7 x i8], [7 x i8]*@.str3133, i32 0, i32 0
%.tmp3135 = call i32(i8*,i8*) @strcmp(i8* %.tmp3132, i8* %.tmp3134)
%.tmp3136 = icmp eq i32 %.tmp3135, 0
br i1 %.tmp3136, label %.if.true.3137, label %.if.false.3137
.if.true.3137:
%.tmp3138 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3139 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3138)
store %m1772$.AssignableInfo.type* %.tmp3139, %m1772$.AssignableInfo.type** %info
%.tmp3140 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3141 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3140, i32 0, i32 3
%.tmp3142 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3143 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3144 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3143, i32 0, i32 6
%.tmp3145 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3144
%.tmp3146 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3145, i32 0, i32 7
%.tmp3147 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3146
%.tmp3148 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$syn_function_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3142, %m286$.Node.type* %.tmp3147)
store %m1772$.Type.type* %.tmp3148, %m1772$.Type.type** %.tmp3141
%.tmp3149 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3150 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3149, i32 0, i32 2
%.tmp3152 = getelementptr [7 x i8], [7 x i8]*@.str3151, i32 0, i32 0
store i8* %.tmp3152, i8** %.tmp3150
%.tmp3153 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3154 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3153, i32 0, i32 6
%.tmp3155 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3154
%.tmp3156 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3155, i32 0, i32 7
%.tmp3157 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3156
%.tmp3158 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3157, i32 0, i32 7
%.tmp3159 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3158
%.tmp3160 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3159, i32 0, i32 1
%.tmp3161 = load i8*, i8** %.tmp3160
%fn_name = alloca i8*
store i8* %.tmp3161, i8** %fn_name
%.tmp3162 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3163 = load i8, i8* @SCOPE_GLOBAL
%.tmp3164 = load i8*, i8** %fn_name
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp3162, i8 %.tmp3163, i8* %.tmp3164)
%.tmp3165 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp3165, %m1772$.Type.type** %return_type
%.tmp3166 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3167 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3166, i32 0, i32 0
%.tmp3168 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3169 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3168, i32 0, i32 3
%.tmp3170 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3169
%.tmp3171 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3170, i32 0, i32 3
%.tmp3172 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3171
%.tmp3173 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3172, i32 0, i32 0
%.tmp3174 = load i8*, i8** %.tmp3173
store i8* %.tmp3174, i8** %.tmp3167
%.tmp3175 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3176 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3175, i32 0, i32 3
%.tmp3177 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3178 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3177, i32 0, i32 3
%.tmp3179 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3178
%.tmp3180 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3179, i32 0, i32 3
%.tmp3181 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3180
%.tmp3182 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3181, i32 0, i32 3
%.tmp3183 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3182
store %m1772$.Type.type* %.tmp3183, %m1772$.Type.type** %.tmp3176
%.tmp3184 = load i1, i1* %shallow
%.tmp3185 = icmp eq i1 %.tmp3184, 0
br i1 %.tmp3185, label %.if.true.3186, label %.if.false.3186
.if.true.3186:
%.tmp3187 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3188 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3187, i32 0, i32 1
%.tmp3189 = load %m0$.File.type*, %m0$.File.type** %.tmp3188
%.tmp3191 = getelementptr [15 x i8], [15 x i8]*@.str3190, i32 0, i32 0
%.tmp3192 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3193 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3194 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3192, %m1772$.Type.type* %.tmp3193)
%.tmp3195 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3196 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3195)
%.tmp3197 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3189, i8* %.tmp3191, i8* %.tmp3194, i8* %.tmp3196)
%.tmp3199 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3200 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3199, i32 0, i32 3
%.tmp3201 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3200
%.tmp3202 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3201, i32 0, i32 3
%.tmp3203 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3202
%.tmp3204 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3203, i32 0, i32 4
%.tmp3205 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3204
%pt = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp3205, %m1772$.Type.type** %pt
br label %.for.start.3198
.for.start.3198:
%.tmp3206 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
%.tmp3207 = icmp ne %m1772$.Type.type* %.tmp3206, null
br i1 %.tmp3207, label %.for.continue.3198, label %.for.end.3198
.for.continue.3198:
%.tmp3208 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
%.tmp3209 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3210 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3209, i32 0, i32 3
%.tmp3211 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3210
%.tmp3212 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3211, i32 0, i32 3
%.tmp3213 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3212
%.tmp3214 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3213, i32 0, i32 4
%.tmp3215 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3214
%.tmp3216 = icmp ne %m1772$.Type.type* %.tmp3208, %.tmp3215
br i1 %.tmp3216, label %.if.true.3217, label %.if.false.3217
.if.true.3217:
%.tmp3218 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3219 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3218, i32 0, i32 1
%.tmp3220 = load %m0$.File.type*, %m0$.File.type** %.tmp3219
%.tmp3222 = getelementptr [3 x i8], [3 x i8]*@.str3221, i32 0, i32 0
%.tmp3223 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3220, i8* %.tmp3222)
br label %.if.end.3217
.if.false.3217:
br label %.if.end.3217
.if.end.3217:
%.tmp3224 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3225 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3224, i32 0, i32 1
%.tmp3226 = load %m0$.File.type*, %m0$.File.type** %.tmp3225
%.tmp3228 = getelementptr [3 x i8], [3 x i8]*@.str3227, i32 0, i32 0
%.tmp3229 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3230 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
%.tmp3231 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3229, %m1772$.Type.type* %.tmp3230)
%.tmp3232 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3226, i8* %.tmp3228, i8* %.tmp3231)
%.tmp3233 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
%.tmp3234 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3233, i32 0, i32 4
%.tmp3235 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3234
store %m1772$.Type.type* %.tmp3235, %m1772$.Type.type** %pt
br label %.for.start.3198
.for.end.3198:
%.tmp3236 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3237 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3236, i32 0, i32 1
%.tmp3238 = load %m0$.File.type*, %m0$.File.type** %.tmp3237
%.tmp3240 = getelementptr [3 x i8], [3 x i8]*@.str3239, i32 0, i32 0
%.tmp3241 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3238, i8* %.tmp3240)
%.tmp3242 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3243 = bitcast %m1772$.Type.type* %.tmp3242 to i8*
call void(i8*) @free(i8* %.tmp3243)
br label %.if.end.3186
.if.false.3186:
%.tmp3244 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3245 = load i8*, i8** %fn_name
%.tmp3246 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3244, i8* %.tmp3245, %m1772$.AssignableInfo.type* %.tmp3246)
br label %.if.end.3186
.if.end.3186:
br label %.if.end.3137
.if.false.3137:
%.tmp3247 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3248 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3247, i32 0, i32 0
%.tmp3249 = load i8*, i8** %.tmp3248
%.tmp3251 = getelementptr [9 x i8], [9 x i8]*@.str3250, i32 0, i32 0
%.tmp3252 = call i32(i8*,i8*) @strcmp(i8* %.tmp3249, i8* %.tmp3251)
%.tmp3253 = icmp eq i32 %.tmp3252, 0
br i1 %.tmp3253, label %.if.true.3254, label %.if.false.3254
.if.true.3254:
%.tmp3255 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3256 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3255)
store %m1772$.AssignableInfo.type* %.tmp3256, %m1772$.AssignableInfo.type** %info
%.tmp3257 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3258 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3257, i32 0, i32 2
%.tmp3260 = getelementptr [9 x i8], [9 x i8]*@.str3259, i32 0, i32 0
store i8* %.tmp3260, i8** %.tmp3258
%.tmp3261 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3262 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3261, i32 0, i32 3
%.tmp3263 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3264 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3265 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3264, i32 0, i32 6
%.tmp3266 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3265
%.tmp3267 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$syn_function_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3263, %m286$.Node.type* %.tmp3266)
store %m1772$.Type.type* %.tmp3267, %m1772$.Type.type** %.tmp3262
%.tmp3268 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3269 = call i8*(%m286$.Node.type*) @m1772$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3268)
%name = alloca i8*
store i8* %.tmp3269, i8** %name
%.tmp3270 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3271 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3272 = load i8*, i8** %name
%.tmp3273 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3274 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3273, i32 0, i32 3
%.tmp3275 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3274
%.tmp3276 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1772$.Type.type*) @m1772$name_mangle.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3270, %m286$.Node.type* %.tmp3271, i8* %.tmp3272, %m1772$.Type.type* %.tmp3275)
store i8* %.tmp3276, i8** %tmp_buff
%.tmp3277 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3278 = load i8, i8* @SCOPE_GLOBAL
%.tmp3279 = load i8*, i8** %tmp_buff
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp3277, i8 %.tmp3278, i8* %.tmp3279)
%.tmp3280 = load i1, i1* %shallow
%.tmp3281 = icmp eq i1 %.tmp3280, 1
br i1 %.tmp3281, label %.if.true.3282, label %.if.false.3282
.if.true.3282:
%.tmp3283 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3284 = load i8*, i8** %name
%.tmp3285 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3283, i8* %.tmp3284, %m1772$.AssignableInfo.type* %.tmp3285)
br label %.if.end.3282
.if.false.3282:
%.tmp3286 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp3286, %m1772$.Type.type** %return_type
%.tmp3287 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3288 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3289 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3288, i32 0, i32 3
%.tmp3290 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3289
%.tmp3291 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3290, i32 0, i32 3
%.tmp3292 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3291
call void(%m1772$.Type.type*,%m1772$.Type.type*) @m1772$copy_type.v.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp3287, %m1772$.Type.type* %.tmp3292)
%.tmp3293 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3294 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3293, i32 0, i32 1
%.tmp3295 = load %m0$.File.type*, %m0$.File.type** %.tmp3294
%.tmp3297 = getelementptr [14 x i8], [14 x i8]*@.str3296, i32 0, i32 0
%.tmp3298 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3299 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3300 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3298, %m1772$.Type.type* %.tmp3299)
%.tmp3301 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3302 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3301)
%.tmp3303 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3295, i8* %.tmp3297, i8* %.tmp3300, i8* %.tmp3302)
%.tmp3304 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3305 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3304, i32 0, i32 6
%.tmp3306 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3305
%.tmp3307 = call %m286$.Node.type*(%m286$.Node.type*) @m1772$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3306)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3307, %m286$.Node.type** %params
%param_type = alloca %m1772$.Type.type*
%.tmp3309 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3309, %m286$.Node.type** %param_ptr
br label %.for.start.3308
.for.start.3308:
%.tmp3310 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3311 = icmp ne %m286$.Node.type* %.tmp3310, null
br i1 %.tmp3311, label %.for.continue.3308, label %.for.end.3308
.for.continue.3308:
%.tmp3312 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3313 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp3314 = icmp ne %m286$.Node.type* %.tmp3312, %.tmp3313
br i1 %.tmp3314, label %.if.true.3315, label %.if.false.3315
.if.true.3315:
%.tmp3316 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3317 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3316, i32 0, i32 7
%.tmp3318 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3317
store %m286$.Node.type* %.tmp3318, %m286$.Node.type** %param_ptr
%.tmp3319 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3320 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3319, i32 0, i32 1
%.tmp3321 = load %m0$.File.type*, %m0$.File.type** %.tmp3320
%.tmp3323 = getelementptr [3 x i8], [3 x i8]*@.str3322, i32 0, i32 0
%.tmp3324 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3321, i8* %.tmp3323)
br label %.if.end.3315
.if.false.3315:
br label %.if.end.3315
.if.end.3315:
%.tmp3325 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3326 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3325, i32 0, i32 0
%.tmp3327 = load i8*, i8** %.tmp3326
%.tmp3329 = getelementptr [5 x i8], [5 x i8]*@.str3328, i32 0, i32 0
%.tmp3330 = call i32(i8*,i8*) @strcmp(i8* %.tmp3327, i8* %.tmp3329)
%.tmp3331 = icmp eq i32 %.tmp3330, 0
br i1 %.tmp3331, label %.if.true.3332, label %.if.false.3332
.if.true.3332:
%.tmp3333 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3334 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3334, i32 0, i32 6
%.tmp3336 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3335
%.tmp3337 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3333, %m286$.Node.type* %.tmp3336)
store %m1772$.Type.type* %.tmp3337, %m1772$.Type.type** %param_type
%.tmp3338 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3338, i32 0, i32 7
%.tmp3340 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3339
store %m286$.Node.type* %.tmp3340, %m286$.Node.type** %param_ptr
br label %.if.end.3332
.if.false.3332:
br label %.if.end.3332
.if.end.3332:
%.tmp3341 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3342 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3341, i32 0, i32 1
%.tmp3343 = load %m0$.File.type*, %m0$.File.type** %.tmp3342
%.tmp3345 = getelementptr [13 x i8], [13 x i8]*@.str3344, i32 0, i32 0
%.tmp3346 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3347 = load %m1772$.Type.type*, %m1772$.Type.type** %param_type
%.tmp3348 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3346, %m1772$.Type.type* %.tmp3347)
%.tmp3349 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3350 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3349, i32 0, i32 1
%.tmp3351 = load i8*, i8** %.tmp3350
%.tmp3352 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3343, i8* %.tmp3345, i8* %.tmp3348, i8* %.tmp3351)
%.tmp3353 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3354 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3353, i32 0, i32 7
%.tmp3355 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3354
store %m286$.Node.type* %.tmp3355, %m286$.Node.type** %param_ptr
br label %.for.start.3308
.for.end.3308:
%.tmp3356 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3357 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3356, i32 0, i32 1
%.tmp3358 = load %m0$.File.type*, %m0$.File.type** %.tmp3357
%.tmp3360 = getelementptr [5 x i8], [5 x i8]*@.str3359, i32 0, i32 0
%.tmp3361 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3358, i8* %.tmp3360)
%.tmp3362 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
call void(%m1772$.CompilerCtx.type*) @m1772$push_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3362)
%.tmp3363 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3364 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_fn_params.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3363, %m286$.Node.type* %.tmp3364)
%.tmp3365 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3366 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3365, i32 0, i32 6
%.tmp3367 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3366
%.tmp3369 = getelementptr [6 x i8], [6 x i8]*@.str3368, i32 0, i32 0
%.tmp3370 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3367, i8* %.tmp3369)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3370, %m286$.Node.type** %fn_block
%.tmp3371 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3372 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3371, %m286$.Node.type* %.tmp3372)
%.tmp3373 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
call void(%m1772$.CompilerCtx.type*) @m1772$pop_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3373)
%.tmp3374 = bitcast ptr null to %m286$.Node.type*
%last_valid_instruction = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3374, %m286$.Node.type** %last_valid_instruction
%.tmp3376 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3377 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3376, i32 0, i32 6
%.tmp3378 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3377
%ci = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3378, %m286$.Node.type** %ci
br label %.for.start.3375
.for.start.3375:
%.tmp3379 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3380 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3379, i32 0, i32 7
%.tmp3381 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3380
%.tmp3382 = icmp ne %m286$.Node.type* %.tmp3381, null
br i1 %.tmp3382, label %.for.continue.3375, label %.for.end.3375
.for.continue.3375:
%.tmp3383 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3383, i32 0, i32 0
%.tmp3385 = load i8*, i8** %.tmp3384
%.tmp3387 = getelementptr [3 x i8], [3 x i8]*@.str3386, i32 0, i32 0
%.tmp3388 = call i32(i8*,i8*) @strcmp(i8* %.tmp3385, i8* %.tmp3387)
%.tmp3389 = icmp ne i32 %.tmp3388, 0
%.tmp3390 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3391 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3390, i32 0, i32 0
%.tmp3392 = load i8*, i8** %.tmp3391
%.tmp3394 = getelementptr [9 x i8], [9 x i8]*@.str3393, i32 0, i32 0
%.tmp3395 = call i32(i8*,i8*) @strcmp(i8* %.tmp3392, i8* %.tmp3394)
%.tmp3396 = icmp ne i32 %.tmp3395, 0
%.tmp3397 = and i1 %.tmp3389, %.tmp3396
br i1 %.tmp3397, label %.if.true.3398, label %.if.false.3398
.if.true.3398:
%.tmp3399 = load %m286$.Node.type*, %m286$.Node.type** %ci
store %m286$.Node.type* %.tmp3399, %m286$.Node.type** %last_valid_instruction
br label %.if.end.3398
.if.false.3398:
br label %.if.end.3398
.if.end.3398:
%.tmp3400 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3401 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3400, i32 0, i32 7
%.tmp3402 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3401
store %m286$.Node.type* %.tmp3402, %m286$.Node.type** %ci
br label %.for.start.3375
.for.end.3375:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3403 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3404 = icmp eq %m286$.Node.type* %.tmp3403, null
br i1 %.tmp3404, label %.if.true.3405, label %.if.false.3405
.if.true.3405:
store i1 1, i1* %add_implicit_return
br label %.if.end.3405
.if.false.3405:
%.tmp3406 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3407 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3406, i32 0, i32 6
%.tmp3408 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3407
%.tmp3409 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3408, i32 0, i32 0
%.tmp3410 = load i8*, i8** %.tmp3409
%.tmp3412 = getelementptr [7 x i8], [7 x i8]*@.str3411, i32 0, i32 0
%.tmp3413 = call i32(i8*,i8*) @strcmp(i8* %.tmp3410, i8* %.tmp3412)
%.tmp3414 = icmp ne i32 %.tmp3413, 0
br i1 %.tmp3414, label %.if.true.3415, label %.if.false.3415
.if.true.3415:
store i1 1, i1* %add_implicit_return
br label %.if.end.3415
.if.false.3415:
br label %.if.end.3415
.if.end.3415:
br label %.if.end.3405
.if.end.3405:
%.tmp3416 = load i1, i1* %add_implicit_return
br i1 %.tmp3416, label %.if.true.3417, label %.if.false.3417
.if.true.3417:
%.tmp3418 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3419 = load %m1772$.Type.type*, %m1772$.Type.type** %return_type
%.tmp3420 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3418, %m1772$.Type.type* %.tmp3419)
%.tmp3422 = getelementptr [5 x i8], [5 x i8]*@.str3421, i32 0, i32 0
%.tmp3423 = call i32(i8*,i8*) @strcmp(i8* %.tmp3420, i8* %.tmp3422)
%.tmp3424 = icmp ne i32 %.tmp3423, 0
br i1 %.tmp3424, label %.if.true.3425, label %.if.false.3425
.if.true.3425:
%.tmp3426 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3427 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3429 = getelementptr [21 x i8], [21 x i8]*@.str3428, i32 0, i32 0
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp3426, %m286$.Node.type* %.tmp3427, i8* %.tmp3429)
br label %.if.end.3425
.if.false.3425:
%.tmp3430 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3431 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3430, i32 0, i32 1
%.tmp3432 = load %m0$.File.type*, %m0$.File.type** %.tmp3431
%.tmp3434 = getelementptr [10 x i8], [10 x i8]*@.str3433, i32 0, i32 0
%.tmp3435 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3432, i8* %.tmp3434)
br label %.if.end.3425
.if.end.3425:
br label %.if.end.3417
.if.false.3417:
br label %.if.end.3417
.if.end.3417:
%.tmp3436 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3437 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3436, i32 0, i32 1
%.tmp3438 = load %m0$.File.type*, %m0$.File.type** %.tmp3437
%.tmp3440 = getelementptr [3 x i8], [3 x i8]*@.str3439, i32 0, i32 0
%.tmp3441 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3438, i8* %.tmp3440)
br label %.if.end.3282
.if.end.3282:
br label %.if.end.3254
.if.false.3254:
%.tmp3442 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3443 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3442, i32 0, i32 0
%.tmp3444 = load i8*, i8** %.tmp3443
%.tmp3446 = getelementptr [7 x i8], [7 x i8]*@.str3445, i32 0, i32 0
%.tmp3447 = call i32(i8*,i8*) @strcmp(i8* %.tmp3444, i8* %.tmp3446)
%.tmp3448 = icmp eq i32 %.tmp3447, 0
br i1 %.tmp3448, label %.if.true.3449, label %.if.false.3449
.if.true.3449:
%.tmp3450 = load i1, i1* %shallow
%.tmp3451 = icmp eq i1 %.tmp3450, 1
br i1 %.tmp3451, label %.if.true.3452, label %.if.false.3452
.if.true.3452:
%.tmp3453 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3454 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3453, i32 0, i32 6
%.tmp3455 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3454
%.tmp3456 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3455, i32 0, i32 7
%.tmp3457 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3456
%.tmp3458 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3457, i32 0, i32 1
%.tmp3459 = load i8*, i8** %.tmp3458
%mod_name = alloca i8*
store i8* %.tmp3459, i8** %mod_name
%.tmp3460 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3461 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3460, i32 0, i32 6
%.tmp3462 = load i8*, i8** %.tmp3461
%mod_abspath = alloca i8*
store i8* %.tmp3462, i8** %mod_abspath
%.tmp3463 = load i8*, i8** %mod_abspath
%.tmp3464 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3463)
%dirname = alloca i8*
store i8* %.tmp3464, i8** %dirname
%.tmp3465 = load i8*, i8** %mod_name
%.tmp3466 = call i32(i8*) @strlen(i8* %.tmp3465)
%mod_name_len = alloca i32
store i32 %.tmp3466, i32* %mod_name_len
%.tmp3467 = load i32, i32* %mod_name_len
%.tmp3468 = sub i32 %.tmp3467, 1
%.tmp3469 = call i8*(i32) @malloc(i32 %.tmp3468)
%trimmed_name = alloca i8*
store i8* %.tmp3469, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3470
.for.start.3470:
%.tmp3471 = load i32, i32* %i
%.tmp3472 = load i32, i32* %mod_name_len
%.tmp3473 = sub i32 %.tmp3472, 1
%.tmp3474 = icmp slt i32 %.tmp3471, %.tmp3473
br i1 %.tmp3474, label %.for.continue.3470, label %.for.end.3470
.for.continue.3470:
%.tmp3475 = load i32, i32* %i
%.tmp3476 = sub i32 %.tmp3475, 1
%.tmp3477 = load i8*, i8** %trimmed_name
%.tmp3478 = getelementptr i8, i8* %.tmp3477, i32 %.tmp3476
%.tmp3479 = load i32, i32* %i
%.tmp3480 = load i8*, i8** %mod_name
%.tmp3481 = getelementptr i8, i8* %.tmp3480, i32 %.tmp3479
%.tmp3482 = load i8, i8* %.tmp3481
store i8 %.tmp3482, i8* %.tmp3478
%.tmp3483 = load i32, i32* %i
%.tmp3484 = add i32 %.tmp3483, 1
store i32 %.tmp3484, i32* %i
br label %.for.start.3470
.for.end.3470:
%.tmp3485 = load i32, i32* %mod_name_len
%.tmp3486 = sub i32 %.tmp3485, 2
%.tmp3487 = load i8*, i8** %trimmed_name
%.tmp3488 = getelementptr i8, i8* %.tmp3487, i32 %.tmp3486
store i8 0, i8* %.tmp3488
%.tmp3489 = load i8*, i8** %dirname
%.tmp3491 = getelementptr [1 x i8], [1 x i8]*@.str3490, i32 0, i32 0
%.tmp3492 = call i32(i8*,i8*) @strcmp(i8* %.tmp3489, i8* %.tmp3491)
%.tmp3493 = icmp eq i32 %.tmp3492, 0
br i1 %.tmp3493, label %.if.true.3494, label %.if.false.3494
.if.true.3494:
%.tmp3495 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3497 = getelementptr [6 x i8], [6 x i8]*@.str3496, i32 0, i32 0
%.tmp3498 = load i8*, i8** %trimmed_name
%.tmp3499 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3495, i8* %.tmp3497, i8* %.tmp3498)
br label %.if.end.3494
.if.false.3494:
%.tmp3500 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3502 = getelementptr [9 x i8], [9 x i8]*@.str3501, i32 0, i32 0
%.tmp3503 = load i8*, i8** %dirname
%.tmp3504 = load i8*, i8** %trimmed_name
%.tmp3505 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3500, i8* %.tmp3502, i8* %.tmp3503, i8* %.tmp3504)
br label %.if.end.3494
.if.end.3494:
%.tmp3506 = load i8*, i8** %mod_abspath
%.tmp3507 = call i8*(i32) @malloc(i32 4096)
%.tmp3508 = call i8*(i8*,i8*) @realpath(i8* %.tmp3506, i8* %.tmp3507)
store i8* %.tmp3508, i8** %mod_abspath
%.tmp3509 = load i8*, i8** %mod_abspath
%.tmp3510 = icmp eq i8* %.tmp3509, null
br i1 %.tmp3510, label %.if.true.3511, label %.if.false.3511
.if.true.3511:
%.tmp3512 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3514 = getelementptr [60 x i8], [60 x i8]*@.str3513, i32 0, i32 0
%.tmp3515 = load i8*, i8** %mod_name
%.tmp3516 = load i8*, i8** %dirname
%.tmp3517 = load i8*, i8** %trimmed_name
%.tmp3518 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3512, i8* %.tmp3514, i8* %.tmp3515, i8* %.tmp3516, i8* %.tmp3517)
%.tmp3519 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3520 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3521 = load i8*, i8** %err_buf
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp3519, %m286$.Node.type* %.tmp3520, i8* %.tmp3521)
ret void
br label %.if.end.3511
.if.false.3511:
br label %.if.end.3511
.if.end.3511:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1772$.ModuleLookup.type*
%.tmp3522 = bitcast ptr null to %m1772$.ModuleLookup.type*
%mod = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp3522, %m1772$.ModuleLookup.type** %mod
%.tmp3524 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3525 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3524, i32 0, i32 5
%.tmp3526 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp3525
store %m1772$.ModuleLookup.type* %.tmp3526, %m1772$.ModuleLookup.type** %m
br label %.for.start.3523
.for.start.3523:
%.tmp3527 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp3528 = icmp ne %m1772$.ModuleLookup.type* %.tmp3527, null
%.tmp3529 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3530 = icmp eq %m1772$.ModuleLookup.type* %.tmp3529, null
%.tmp3531 = and i1 %.tmp3528, %.tmp3530
br i1 %.tmp3531, label %.for.continue.3523, label %.for.end.3523
.for.continue.3523:
%.tmp3532 = load i8*, i8** %mod_abspath
%.tmp3533 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp3534 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3533, i32 0, i32 0
%.tmp3535 = load i8*, i8** %.tmp3534
%.tmp3536 = call i32(i8*,i8*) @strcmp(i8* %.tmp3532, i8* %.tmp3535)
%.tmp3537 = icmp eq i32 %.tmp3536, 0
br i1 %.tmp3537, label %.if.true.3538, label %.if.false.3538
.if.true.3538:
%.tmp3539 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
store %m1772$.ModuleLookup.type* %.tmp3539, %m1772$.ModuleLookup.type** %mod
br label %.if.end.3538
.if.false.3538:
br label %.if.end.3538
.if.end.3538:
%.tmp3540 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp3541 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3540, i32 0, i32 2
%.tmp3542 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp3541
store %m1772$.ModuleLookup.type* %.tmp3542, %m1772$.ModuleLookup.type** %m
br label %.for.start.3523
.for.end.3523:
%.tmp3543 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3544 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3543, i32 0, i32 6
%.tmp3545 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3544
%.tmp3546 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3545, i32 0, i32 7
%.tmp3547 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3546
%.tmp3548 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3547, i32 0, i32 7
%.tmp3549 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3548
%.tmp3550 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3549, i32 0, i32 7
%.tmp3551 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3550
%.tmp3552 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3551, i32 0, i32 1
%.tmp3553 = load i8*, i8** %.tmp3552
%asname = alloca i8*
store i8* %.tmp3553, i8** %asname
%.tmp3554 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3555 = icmp eq %m1772$.ModuleLookup.type* %.tmp3554, null
br i1 %.tmp3555, label %.if.true.3556, label %.if.false.3556
.if.true.3556:
%.tmp3557 = load i32, i32* @ModuleLookup_size
%.tmp3558 = call i8*(i32) @malloc(i32 %.tmp3557)
%.tmp3559 = bitcast i8* %.tmp3558 to %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp3559, %m1772$.ModuleLookup.type** %mod
%.tmp3560 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3561 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3560, i32 0, i32 0
%.tmp3562 = load i8*, i8** %mod_abspath
store i8* %.tmp3562, i8** %.tmp3561
%.tmp3563 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3564 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3563, i32 0, i32 2
store %m1772$.ModuleLookup.type* null, %m1772$.ModuleLookup.type** %.tmp3564
%.tmp3565 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3566 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3565, i32 0, i32 3
store %m1772$.Scope.type* null, %m1772$.Scope.type** %.tmp3566
%.tmp3567 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3568 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3567, i32 0, i32 1
%.tmp3569 = getelementptr i8*, i8** %.tmp3568, i32 0
%.tmp3571 = getelementptr [5 x i8], [5 x i8]*@.str3570, i32 0, i32 0
%.tmp3572 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3573 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3572)
%.tmp3574 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3569, i8* %.tmp3571, i32 %.tmp3573)
%.tmp3576 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3577 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3576, i32 0, i32 5
%.tmp3578 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp3577
store %m1772$.ModuleLookup.type* %.tmp3578, %m1772$.ModuleLookup.type** %m
br label %.for.start.3575
.for.start.3575:
%.tmp3579 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp3580 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3579, i32 0, i32 2
%.tmp3581 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp3580
%.tmp3582 = icmp ne %m1772$.ModuleLookup.type* %.tmp3581, null
br i1 %.tmp3582, label %.for.continue.3575, label %.for.end.3575
.for.continue.3575:
%.tmp3583 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp3584 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3583, i32 0, i32 2
%.tmp3585 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %.tmp3584
store %m1772$.ModuleLookup.type* %.tmp3585, %m1772$.ModuleLookup.type** %m
br label %.for.start.3575
.for.end.3575:
%.tmp3586 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %m
%.tmp3587 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3586, i32 0, i32 2
%.tmp3588 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
store %m1772$.ModuleLookup.type* %.tmp3588, %m1772$.ModuleLookup.type** %.tmp3587
%.tmp3589 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3590 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3591 = load i8*, i8** %asname
%.tmp3592 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3593 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3592, i32 0, i32 0
%.tmp3594 = load i8*, i8** %.tmp3593
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1772$define_module.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1772$.CompilerCtx.type* %.tmp3589, %m286$.Node.type* %.tmp3590, i8* %.tmp3591, i8* %.tmp3594)
%.tmp3595 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3596 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3595, i32 0, i32 6
%.tmp3597 = load i8*, i8** %.tmp3596
%curr_mod = alloca i8*
store i8* %.tmp3597, i8** %curr_mod
%.tmp3598 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3599 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3598, i32 0, i32 6
%.tmp3600 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3601 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3600, i32 0, i32 0
%.tmp3602 = load i8*, i8** %.tmp3601
store i8* %.tmp3602, i8** %.tmp3599
%.tmp3603 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3604 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3605 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3604, i32 0, i32 0
%.tmp3606 = load i8*, i8** %.tmp3605
%.tmp3607 = call i1(%m1772$.CompilerCtx.type*,i8*) @m1772$compile_file.b.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.tmp3603, i8* %.tmp3606)
%.tmp3608 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3609 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3608, i32 0, i32 6
%.tmp3610 = load i8*, i8** %curr_mod
store i8* %.tmp3610, i8** %.tmp3609
br label %.if.end.3556
.if.false.3556:
%.tmp3611 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3612 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3613 = load i8*, i8** %asname
%.tmp3614 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp3615 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp3614, i32 0, i32 0
%.tmp3616 = load i8*, i8** %.tmp3615
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1772$define_module.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1772$.CompilerCtx.type* %.tmp3611, %m286$.Node.type* %.tmp3612, i8* %.tmp3613, i8* %.tmp3616)
br label %.if.end.3556
.if.end.3556:
br label %.if.end.3452
.if.false.3452:
br label %.if.end.3452
.if.end.3452:
br label %.if.end.3449
.if.false.3449:
%.tmp3617 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3618 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3620 = getelementptr [40 x i8], [40 x i8]*@.str3619, i32 0, i32 0
%.tmp3621 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp3617, %m286$.Node.type* %.tmp3618, i8* %.tmp3620)
%.tmp3622 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3623 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3622, i32 0, i32 0
%.tmp3624 = load i8*, i8** %.tmp3623
%.tmp3625 = call i32(i8*,...) @printf(i8* %.tmp3621, i8* %.tmp3624)
br label %.if.end.3449
.if.end.3449:
br label %.if.end.3254
.if.end.3254:
br label %.if.end.3137
.if.end.3137:
br label %.if.end.3044
.if.end.3044:
br label %.if.end.2982
.if.end.2982:
br label %.if.end.2974
.if.end.2974:
ret void
}
define i8* @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf = alloca i8*
%.tmp3626 = getelementptr i8*, i8** %buf, i32 0
%.tmp3628 = getelementptr [31 x i8], [31 x i8]*@.str3627, i32 0, i32 0
%.tmp3629 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3630 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3629, i32 0, i32 6
%.tmp3631 = load i8*, i8** %.tmp3630
%.tmp3632 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3633 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3632, i32 0, i32 3
%.tmp3634 = load i32, i32* %.tmp3633
%.tmp3635 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3636 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3635, i32 0, i32 4
%.tmp3637 = load i32, i32* %.tmp3636
%.tmp3638 = load i8*, i8** %msg
%.tmp3639 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3626, i8* %.tmp3628, i8* %.tmp3631, i32 %.tmp3634, i32 %.tmp3637, i8* %.tmp3638)
%.tmp3640 = load i8*, i8** %buf
ret i8* %.tmp3640
}
define void @m1772$compile_fn_params.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1772$.Type.type*
%.tmp3642 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3642, %m286$.Node.type** %param_ptr
br label %.for.start.3641
.for.start.3641:
%.tmp3643 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3644 = icmp ne %m286$.Node.type* %.tmp3643, null
br i1 %.tmp3644, label %.for.continue.3641, label %.for.end.3641
.for.continue.3641:
%.tmp3645 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3646 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3647 = icmp ne %m286$.Node.type* %.tmp3645, %.tmp3646
br i1 %.tmp3647, label %.if.true.3648, label %.if.false.3648
.if.true.3648:
%.tmp3649 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3650 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3649, i32 0, i32 7
%.tmp3651 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3650
store %m286$.Node.type* %.tmp3651, %m286$.Node.type** %param_ptr
br label %.if.end.3648
.if.false.3648:
br label %.if.end.3648
.if.end.3648:
%.tmp3652 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3653 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3652)
%param_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3653, %m1772$.AssignableInfo.type** %param_info
%.tmp3654 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
%.tmp3655 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3654, i32 0, i32 2
%.tmp3657 = getelementptr [9 x i8], [9 x i8]*@.str3656, i32 0, i32 0
store i8* %.tmp3657, i8** %.tmp3655
%.tmp3658 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3659 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3658, i32 0, i32 0
%.tmp3660 = load i8*, i8** %.tmp3659
%.tmp3662 = getelementptr [5 x i8], [5 x i8]*@.str3661, i32 0, i32 0
%.tmp3663 = call i32(i8*,i8*) @strcmp(i8* %.tmp3660, i8* %.tmp3662)
%.tmp3664 = icmp eq i32 %.tmp3663, 0
br i1 %.tmp3664, label %.if.true.3665, label %.if.false.3665
.if.true.3665:
%.tmp3666 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3667 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3668 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3667, i32 0, i32 6
%.tmp3669 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3668
%.tmp3670 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3666, %m286$.Node.type* %.tmp3669)
store %m1772$.Type.type* %.tmp3670, %m1772$.Type.type** %param_type
%.tmp3671 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3672 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3671, i32 0, i32 7
%.tmp3673 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3672
store %m286$.Node.type* %.tmp3673, %m286$.Node.type** %param_ptr
br label %.if.end.3665
.if.false.3665:
br label %.if.end.3665
.if.end.3665:
%.tmp3674 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
%.tmp3675 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3674, i32 0, i32 3
%.tmp3676 = load %m1772$.Type.type*, %m1772$.Type.type** %param_type
store %m1772$.Type.type* %.tmp3676, %m1772$.Type.type** %.tmp3675
%.tmp3677 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3678 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3677, i32 0, i32 1
%.tmp3679 = load i8*, i8** %.tmp3678
%var_name = alloca i8*
store i8* %.tmp3679, i8** %var_name
%.tmp3680 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
%.tmp3681 = load i8, i8* @SCOPE_LOCAL
%.tmp3682 = load i8*, i8** %var_name
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp3680, i8 %.tmp3681, i8* %.tmp3682)
%.tmp3683 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3684 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
%.tmp3685 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3684, i32 0, i32 3
%.tmp3686 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3685
%.tmp3687 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3683, %m1772$.Type.type* %.tmp3686)
%param_info_tr = alloca i8*
store i8* %.tmp3687, i8** %param_info_tr
%.tmp3688 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3689 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3688, i32 0, i32 1
%.tmp3690 = load %m0$.File.type*, %m0$.File.type** %.tmp3689
%.tmp3692 = getelementptr [16 x i8], [16 x i8]*@.str3691, i32 0, i32 0
%.tmp3693 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
%.tmp3694 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3693)
%.tmp3695 = load i8*, i8** %param_info_tr
%.tmp3696 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3690, i8* %.tmp3692, i8* %.tmp3694, i8* %.tmp3695)
%.tmp3697 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3698 = load i8*, i8** %var_name
%.tmp3699 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3697, i8* %.tmp3698, %m1772$.AssignableInfo.type* %.tmp3699)
%.tmp3700 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3701 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3700, i32 0, i32 1
%.tmp3702 = load %m0$.File.type*, %m0$.File.type** %.tmp3701
%.tmp3704 = getelementptr [28 x i8], [28 x i8]*@.str3703, i32 0, i32 0
%.tmp3705 = load i8*, i8** %param_info_tr
%.tmp3706 = load i8*, i8** %var_name
%.tmp3707 = load i8*, i8** %param_info_tr
%.tmp3708 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %param_info
%.tmp3709 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3708)
%.tmp3710 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3702, i8* %.tmp3704, i8* %.tmp3705, i8* %.tmp3706, i8* %.tmp3707, i8* %.tmp3709)
%.tmp3711 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3712 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3711, i32 0, i32 7
%.tmp3713 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3712
store %m286$.Node.type* %.tmp3713, %m286$.Node.type** %param_ptr
br label %.for.start.3641
.for.end.3641:
ret void
}
define void @m1772$compile_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3714 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
call void(%m1772$.CompilerCtx.type*) @m1772$push_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3714)
%.tmp3716 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3717 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3716, i32 0, i32 6
%.tmp3718 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3717
%b = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3718, %m286$.Node.type** %b
br label %.for.start.3715
.for.start.3715:
%.tmp3719 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3720 = icmp ne %m286$.Node.type* %.tmp3719, null
br i1 %.tmp3720, label %.for.continue.3715, label %.for.end.3715
.for.continue.3715:
%.tmp3721 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3722 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3721, i32 0, i32 0
%.tmp3723 = load i8*, i8** %.tmp3722
%.tmp3725 = getelementptr [11 x i8], [11 x i8]*@.str3724, i32 0, i32 0
%.tmp3726 = call i32(i8*,i8*) @strcmp(i8* %.tmp3723, i8* %.tmp3725)
%.tmp3727 = icmp eq i32 %.tmp3726, 0
br i1 %.tmp3727, label %.if.true.3728, label %.if.false.3728
.if.true.3728:
%.tmp3729 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3730 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3731 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3730, i32 0, i32 6
%.tmp3732 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3731
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_expression.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3729, %m286$.Node.type* %.tmp3732)
br label %.if.end.3728
.if.false.3728:
br label %.if.end.3728
.if.end.3728:
%.tmp3733 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3734 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3733, i32 0, i32 7
%.tmp3735 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3734
store %m286$.Node.type* %.tmp3735, %m286$.Node.type** %b
br label %.for.start.3715
.for.end.3715:
%.tmp3736 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
call void(%m1772$.CompilerCtx.type*) @m1772$pop_scope.v.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3736)
ret void
}
define %m1772$.AssignableInfo.type* @m1772$compile_builtin.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3737 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3738 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3737, i32 0, i32 6
%.tmp3739 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3738
%.tmp3740 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3739, i32 0, i32 6
%.tmp3741 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3740
%dotted = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3741, %m286$.Node.type** %dotted
%.tmp3742 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3743 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3742, i32 0, i32 7
%.tmp3744 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3743
%.tmp3745 = icmp ne %m286$.Node.type* %.tmp3744, null
br i1 %.tmp3745, label %.if.true.3746, label %.if.false.3746
.if.true.3746:
%.tmp3747 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp3747
br label %.if.end.3746
.if.false.3746:
br label %.if.end.3746
.if.end.3746:
%.tmp3748 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3749 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3748, i32 0, i32 1
%.tmp3750 = load i8*, i8** %.tmp3749
%.tmp3752 = getelementptr [7 x i8], [7 x i8]*@.str3751, i32 0, i32 0
%.tmp3753 = call i32(i8*,i8*) @strcmp(i8* %.tmp3750, i8* %.tmp3752)
%.tmp3754 = icmp eq i32 %.tmp3753, 0
br i1 %.tmp3754, label %.if.true.3755, label %.if.false.3755
.if.true.3755:
%.tmp3756 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3758 = getelementptr [8 x i8], [8 x i8]*@.str3757, i32 0, i32 0
%.tmp3759 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3756, i8* %.tmp3758)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3759, %m286$.Node.type** %args
%.tmp3760 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3761 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3760, i32 0, i32 6
%.tmp3762 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3761
%.tmp3764 = getelementptr [11 x i8], [11 x i8]*@.str3763, i32 0, i32 0
%.tmp3765 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3762, i8* %.tmp3764)
%value = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3765, %m286$.Node.type** %value
%.tmp3766 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3767 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3766, i32 0, i32 6
%.tmp3768 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3767
%.tmp3769 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3768, i32 0, i32 6
%.tmp3770 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3769
%.tmp3771 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3770, i32 0, i32 6
%.tmp3772 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3771
%.tmp3773 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3772, i32 0, i32 6
%.tmp3774 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3773
store %m286$.Node.type* %.tmp3774, %m286$.Node.type** %value
%.tmp3775 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3776 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp3775)
%tmp_id = alloca i32
store i32 %.tmp3776, i32* %tmp_id
%.tmp3777 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3778 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3777)
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3778, %m1772$.AssignableInfo.type** %info
%.tmp3779 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3780 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3779, %m1772$.AssignableInfo.type* %.tmp3780)
%.tmp3781 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3782 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3781, i32 0, i32 3
%.tmp3783 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp3783, %m1772$.Type.type** %.tmp3782
%.tmp3784 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3785 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3784, i32 0, i32 3
%.tmp3786 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3785
%.tmp3787 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3786, i32 0, i32 0
%.tmp3789 = getelementptr [4 x i8], [4 x i8]*@.str3788, i32 0, i32 0
store i8* %.tmp3789, i8** %.tmp3787
%.tmp3790 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3791 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3792 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3790, %m286$.Node.type* %.tmp3791)
%inspected_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp3792, %m1772$.Type.type** %inspected_type
%.tmp3793 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3794 = load %m1772$.Type.type*, %m1772$.Type.type** %inspected_type
%.tmp3795 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3793, %m1772$.Type.type* %.tmp3794)
%type_as_str = alloca i8*
store i8* %.tmp3795, i8** %type_as_str
%.tmp3796 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3797 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3796, i32 0, i32 1
%.tmp3798 = load %m0$.File.type*, %m0$.File.type** %.tmp3797
%.tmp3800 = getelementptr [46 x i8], [46 x i8]*@.str3799, i32 0, i32 0
%.tmp3801 = load i32, i32* %tmp_id
%.tmp3802 = load i8*, i8** %type_as_str
%.tmp3803 = load i8*, i8** %type_as_str
%.tmp3804 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3798, i8* %.tmp3800, i32 %.tmp3801, i8* %.tmp3802, i8* %.tmp3803)
%.tmp3805 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3806 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3805, i32 0, i32 1
%.tmp3807 = load %m0$.File.type*, %m0$.File.type** %.tmp3806
%.tmp3809 = getelementptr [35 x i8], [35 x i8]*@.str3808, i32 0, i32 0
%.tmp3810 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3811 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3810)
%.tmp3812 = load i8*, i8** %type_as_str
%.tmp3813 = load i32, i32* %tmp_id
%.tmp3814 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3807, i8* %.tmp3809, i8* %.tmp3811, i8* %.tmp3812, i32 %.tmp3813)
%.tmp3815 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp3815
br label %.if.end.3755
.if.false.3755:
br label %.if.end.3755
.if.end.3755:
%.tmp3816 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp3816
}
define %m1772$.AssignableInfo.type* @m1772$compile_fn_call.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3817 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3818 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3819 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_builtin.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3817, %m286$.Node.type* %.tmp3818)
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3819, %m1772$.AssignableInfo.type** %info
%.tmp3820 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3821 = icmp ne %m1772$.AssignableInfo.type* %.tmp3820, null
br i1 %.tmp3821, label %.if.true.3822, label %.if.false.3822
.if.true.3822:
%.tmp3823 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp3823
br label %.if.end.3822
.if.false.3822:
br label %.if.end.3822
.if.end.3822:
%.tmp3824 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3825 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3826 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_addr.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3824, %m286$.Node.type* %.tmp3825)
store %m1772$.AssignableInfo.type* %.tmp3826, %m1772$.AssignableInfo.type** %info
%.tmp3827 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3828 = icmp eq %m1772$.AssignableInfo.type* %.tmp3827, null
br i1 %.tmp3828, label %.if.true.3829, label %.if.false.3829
.if.true.3829:
%.tmp3830 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3830, label %.if.true.3831, label %.if.false.3831
.if.true.3831:
%.tmp3832 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3833 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3835 = getelementptr [35 x i8], [35 x i8]*@.str3834, i32 0, i32 0
%.tmp3836 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp3832, %m286$.Node.type* %.tmp3833, i8* %.tmp3835)
%.tmp3837 = call i32(i8*,...) @printf(i8* %.tmp3836)
br label %.if.end.3831
.if.false.3831:
br label %.if.end.3831
.if.end.3831:
%.tmp3838 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp3838
br label %.if.end.3829
.if.false.3829:
br label %.if.end.3829
.if.end.3829:
%.tmp3839 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3841 = getelementptr [8 x i8], [8 x i8]*@.str3840, i32 0, i32 0
%.tmp3842 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3839, i8* %.tmp3841)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3842, %m286$.Node.type** %args
%.tmp3844 = getelementptr [1 x i8], [1 x i8]*@.str3843, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3844, i8** %params_buff
%tmp = alloca i8*
%.tmp3845 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3846 = icmp ne %m286$.Node.type* %.tmp3845, null
br i1 %.tmp3846, label %.if.true.3847, label %.if.false.3847
.if.true.3847:
%.tmp3848 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3849 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3848, i32 0, i32 6
%.tmp3850 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3849
%.tmp3852 = getelementptr [11 x i8], [11 x i8]*@.str3851, i32 0, i32 0
%.tmp3853 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3850, i8* %.tmp3852)
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3853, %m286$.Node.type** %start
%.tmp3855 = load %m286$.Node.type*, %m286$.Node.type** %start
%pp = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3855, %m286$.Node.type** %pp
br label %.for.start.3854
.for.start.3854:
%.tmp3856 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3857 = icmp ne %m286$.Node.type* %.tmp3856, null
br i1 %.tmp3857, label %.for.continue.3854, label %.for.end.3854
.for.continue.3854:
%.tmp3858 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3859 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp3860 = icmp ne %m286$.Node.type* %.tmp3858, %.tmp3859
br i1 %.tmp3860, label %.if.true.3861, label %.if.false.3861
.if.true.3861:
%.tmp3862 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3864 = getelementptr [5 x i8], [5 x i8]*@.str3863, i32 0, i32 0
%.tmp3865 = load i8*, i8** %params_buff
%.tmp3866 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3862, i8* %.tmp3864, i8* %.tmp3865)
%.tmp3867 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3867, i8** %tmp_buff
%.tmp3868 = load i8*, i8** %tmp
store i8* %.tmp3868, i8** %params_buff
%.tmp3869 = load i8*, i8** %tmp_buff
store i8* %.tmp3869, i8** %tmp
%.tmp3870 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3870)
br label %.if.end.3861
.if.false.3861:
br label %.if.end.3861
.if.end.3861:
%.tmp3871 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3872 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3873 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3871, %m286$.Node.type* %.tmp3872)
%a_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3873, %m1772$.AssignableInfo.type** %a_info
%.tmp3874 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp3875 = icmp eq %m1772$.AssignableInfo.type* %.tmp3874, null
br i1 %.tmp3875, label %.if.true.3876, label %.if.false.3876
.if.true.3876:
%.tmp3877 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp3877
br label %.if.end.3876
.if.false.3876:
br label %.if.end.3876
.if.end.3876:
%.tmp3878 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3880 = getelementptr [8 x i8], [8 x i8]*@.str3879, i32 0, i32 0
%.tmp3881 = load i8*, i8** %params_buff
%.tmp3882 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3883 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp3884 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3883, i32 0, i32 3
%.tmp3885 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3884
%.tmp3886 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3882, %m1772$.Type.type* %.tmp3885)
%.tmp3887 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp3888 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3887)
%.tmp3889 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3878, i8* %.tmp3880, i8* %.tmp3881, i8* %.tmp3886, i8* %.tmp3888)
%.tmp3890 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3891 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3890, i32 0, i32 7
%.tmp3892 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3891
store %m286$.Node.type* %.tmp3892, %m286$.Node.type** %pp
%.tmp3893 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3895 = getelementptr [11 x i8], [11 x i8]*@.str3894, i32 0, i32 0
%.tmp3896 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3893, i8* %.tmp3895)
store %m286$.Node.type* %.tmp3896, %m286$.Node.type** %pp
br label %.for.start.3854
.for.end.3854:
br label %.if.end.3847
.if.false.3847:
br label %.if.end.3847
.if.end.3847:
%.tmp3897 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3898 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3899 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3898, i32 0, i32 3
%.tmp3900 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3899
%.tmp3901 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3900, i32 0, i32 3
%.tmp3902 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3901
%.tmp3903 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3897, %m1772$.Type.type* %.tmp3902)
%.tmp3905 = getelementptr [5 x i8], [5 x i8]*@.str3904, i32 0, i32 0
%.tmp3906 = call i32(i8*,i8*) @strcmp(i8* %.tmp3903, i8* %.tmp3905)
%.tmp3907 = icmp eq i32 %.tmp3906, 0
br i1 %.tmp3907, label %.if.true.3908, label %.if.false.3908
.if.true.3908:
%.tmp3909 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3910 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3909, i32 0, i32 1
%.tmp3911 = load %m0$.File.type*, %m0$.File.type** %.tmp3910
%.tmp3913 = getelementptr [16 x i8], [16 x i8]*@.str3912, i32 0, i32 0
%.tmp3914 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3915 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3916 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3915, i32 0, i32 3
%.tmp3917 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3916
%.tmp3918 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3914, %m1772$.Type.type* %.tmp3917)
%.tmp3919 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3920 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3919)
%.tmp3921 = load i8*, i8** %params_buff
%.tmp3922 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3911, i8* %.tmp3913, i8* %.tmp3918, i8* %.tmp3920, i8* %.tmp3921)
%.tmp3923 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp3923
br label %.if.end.3908
.if.false.3908:
br label %.if.end.3908
.if.end.3908:
%.tmp3924 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3925 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3924)
%call_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3925, %m1772$.AssignableInfo.type** %call_info
%.tmp3926 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3927 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %call_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp3926, %m1772$.AssignableInfo.type* %.tmp3927)
%.tmp3928 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %call_info
%.tmp3929 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3928, i32 0, i32 3
%.tmp3930 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3931 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3930, i32 0, i32 3
%.tmp3932 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3931
%.tmp3933 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3932, i32 0, i32 3
%.tmp3934 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3933
%.tmp3935 = call %m1772$.Type.type*(%m1772$.Type.type*) @m1772$type_clone.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp3934)
store %m1772$.Type.type* %.tmp3935, %m1772$.Type.type** %.tmp3929
%.tmp3936 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %call_info
%.tmp3937 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3936, i32 0, i32 3
%.tmp3938 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3937
%.tmp3939 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp3938, i32 0, i32 4
store %m1772$.Type.type* null, %m1772$.Type.type** %.tmp3939
%.tmp3940 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3941 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3940, i32 0, i32 1
%.tmp3942 = load %m0$.File.type*, %m0$.File.type** %.tmp3941
%.tmp3944 = getelementptr [21 x i8], [21 x i8]*@.str3943, i32 0, i32 0
%.tmp3945 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %call_info
%.tmp3946 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3945)
%.tmp3947 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3948 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3949 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3948, i32 0, i32 3
%.tmp3950 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3949
%.tmp3951 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3947, %m1772$.Type.type* %.tmp3950)
%.tmp3952 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3953 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp3952)
%.tmp3954 = load i8*, i8** %params_buff
%.tmp3955 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3942, i8* %.tmp3944, i8* %.tmp3946, i8* %.tmp3951, i8* %.tmp3953, i8* %.tmp3954)
%.tmp3956 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %call_info
%.tmp3957 = bitcast %m1772$.AssignableInfo.type* %.tmp3956 to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp3957
}
define void @m1772$compile_expression.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp3958 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3959 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3958, i32 0, i32 0
%.tmp3960 = load i8*, i8** %.tmp3959
%expr_type = alloca i8*
store i8* %.tmp3960, i8** %expr_type
%.tmp3961 = bitcast ptr null to %m1772$.AssignableInfo.type*
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3961, %m1772$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
%.tmp3962 = bitcast ptr null to %m1772$.AssignableInfo.type*
%a_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp3962, %m1772$.AssignableInfo.type** %a_info
%.tmp3963 = load i8*, i8** %expr_type
%.tmp3965 = getelementptr [7 x i8], [7 x i8]*@.str3964, i32 0, i32 0
%.tmp3966 = call i32(i8*,i8*) @strcmp(i8* %.tmp3963, i8* %.tmp3965)
%.tmp3967 = icmp eq i32 %.tmp3966, 0
br i1 %.tmp3967, label %.if.true.3968, label %.if.false.3968
.if.true.3968:
%.tmp3969 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3970 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3969, i32 0, i32 6
%.tmp3971 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3970
%.tmp3972 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3971, i32 0, i32 7
%.tmp3973 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3972
%.tmp3974 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3973, i32 0, i32 0
%.tmp3975 = load i8*, i8** %.tmp3974
%.tmp3977 = getelementptr [3 x i8], [3 x i8]*@.str3976, i32 0, i32 0
%.tmp3978 = call i32(i8*,i8*) @strcmp(i8* %.tmp3975, i8* %.tmp3977)
%.tmp3979 = icmp ne i32 %.tmp3978, 0
br i1 %.tmp3979, label %.if.true.3980, label %.if.false.3980
.if.true.3980:
%.tmp3981 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3982 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3983 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3982, i32 0, i32 6
%.tmp3984 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3983
%.tmp3985 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3984, i32 0, i32 7
%.tmp3986 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3985
%.tmp3987 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp3981, %m286$.Node.type* %.tmp3986)
store %m1772$.AssignableInfo.type* %.tmp3987, %m1772$.AssignableInfo.type** %info
%.tmp3988 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3989 = icmp eq %m1772$.AssignableInfo.type* %.tmp3988, null
br i1 %.tmp3989, label %.if.true.3990, label %.if.false.3990
.if.true.3990:
ret void
br label %.if.end.3990
.if.false.3990:
br label %.if.end.3990
.if.end.3990:
%.tmp3991 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3992 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp3991, i32 0, i32 1
%.tmp3993 = load %m0$.File.type*, %m0$.File.type** %.tmp3992
%.tmp3995 = getelementptr [11 x i8], [11 x i8]*@.str3994, i32 0, i32 0
%.tmp3996 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp3997 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp3998 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp3997, i32 0, i32 3
%.tmp3999 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp3998
%.tmp4000 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp3996, %m1772$.Type.type* %.tmp3999)
%.tmp4001 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4002 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4001)
%.tmp4003 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3993, i8* %.tmp3995, i8* %.tmp4000, i8* %.tmp4002)
br label %.if.end.3980
.if.false.3980:
%.tmp4004 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4005 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4004, i32 0, i32 1
%.tmp4006 = load %m0$.File.type*, %m0$.File.type** %.tmp4005
%.tmp4008 = getelementptr [10 x i8], [10 x i8]*@.str4007, i32 0, i32 0
%.tmp4009 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4006, i8* %.tmp4008)
br label %.if.end.3980
.if.end.3980:
br label %.if.end.3968
.if.false.3968:
%.tmp4010 = load i8*, i8** %expr_type
%.tmp4012 = getelementptr [3 x i8], [3 x i8]*@.str4011, i32 0, i32 0
%.tmp4013 = call i32(i8*,i8*) @strcmp(i8* %.tmp4010, i8* %.tmp4012)
%.tmp4014 = icmp eq i32 %.tmp4013, 0
br i1 %.tmp4014, label %.if.true.4015, label %.if.false.4015
.if.true.4015:
br label %.if.end.4015
.if.false.4015:
%.tmp4016 = load i8*, i8** %expr_type
%.tmp4018 = getelementptr [8 x i8], [8 x i8]*@.str4017, i32 0, i32 0
%.tmp4019 = call i32(i8*,i8*) @strcmp(i8* %.tmp4016, i8* %.tmp4018)
%.tmp4020 = icmp eq i32 %.tmp4019, 0
br i1 %.tmp4020, label %.if.true.4021, label %.if.false.4021
.if.true.4021:
%.tmp4022 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4023 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4023, i32 0, i32 6
%.tmp4025 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4024
%.tmp4026 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_fn_call.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4022, %m286$.Node.type* %.tmp4025)
br label %.if.end.4021
.if.false.4021:
%.tmp4027 = load i8*, i8** %expr_type
%.tmp4029 = getelementptr [12 x i8], [12 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = call i32(i8*,i8*) @strcmp(i8* %.tmp4027, i8* %.tmp4029)
%.tmp4031 = icmp eq i32 %.tmp4030, 0
br i1 %.tmp4031, label %.if.true.4032, label %.if.false.4032
.if.true.4032:
%.tmp4033 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4034 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4035 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_declaration.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4033, %m286$.Node.type* %.tmp4034)
br label %.if.end.4032
.if.false.4032:
%.tmp4036 = load i8*, i8** %expr_type
%.tmp4038 = getelementptr [11 x i8], [11 x i8]*@.str4037, i32 0, i32 0
%.tmp4039 = call i32(i8*,i8*) @strcmp(i8* %.tmp4036, i8* %.tmp4038)
%.tmp4040 = icmp eq i32 %.tmp4039, 0
br i1 %.tmp4040, label %.if.true.4041, label %.if.false.4041
.if.true.4041:
%.tmp4042 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4043 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4042, i32 0, i32 6
%.tmp4044 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4043
%.tmp4046 = getelementptr [11 x i8], [11 x i8]*@.str4045, i32 0, i32 0
%.tmp4047 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4044, i8* %.tmp4046)
store %m286$.Node.type* %.tmp4047, %m286$.Node.type** %assignable
%.tmp4048 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4049 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4049, i32 0, i32 6
%.tmp4051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4050
%.tmp4052 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_addr.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4048, %m286$.Node.type* %.tmp4051)
%dest = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4052, %m1772$.AssignableInfo.type** %dest
%.tmp4053 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %dest
%.tmp4054 = icmp eq %m1772$.AssignableInfo.type* %.tmp4053, null
br i1 %.tmp4054, label %.if.true.4055, label %.if.false.4055
.if.true.4055:
%.tmp4056 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4058 = getelementptr [34 x i8], [34 x i8]*@.str4057, i32 0, i32 0
%.tmp4059 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4060 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4059, i32 0, i32 6
%.tmp4061 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4060
%.tmp4062 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4061, i32 0, i32 6
%.tmp4063 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4062
%.tmp4064 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4063, i32 0, i32 6
%.tmp4065 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4064
%.tmp4066 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4065, i32 0, i32 1
%.tmp4067 = load i8*, i8** %.tmp4066
%.tmp4068 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4056, i8* %.tmp4058, i8* %.tmp4067)
%.tmp4069 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4070 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4071 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4069, %m286$.Node.type* %.tmp4070, i8* %.tmp4071)
ret void
br label %.if.end.4055
.if.false.4055:
br label %.if.end.4055
.if.end.4055:
%.tmp4072 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4073 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4074 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4072, %m286$.Node.type* %.tmp4073)
store %m1772$.AssignableInfo.type* %.tmp4074, %m1772$.AssignableInfo.type** %a_info
%.tmp4075 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4076 = icmp eq %m1772$.AssignableInfo.type* %.tmp4075, null
br i1 %.tmp4076, label %.if.true.4077, label %.if.false.4077
.if.true.4077:
ret void
br label %.if.end.4077
.if.false.4077:
br label %.if.end.4077
.if.end.4077:
%.tmp4078 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4079 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %dest
%.tmp4080 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4079, i32 0, i32 3
%.tmp4081 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4080
%.tmp4082 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4078, %m1772$.Type.type* %.tmp4081)
%dest_tr = alloca i8*
store i8* %.tmp4082, i8** %dest_tr
%.tmp4083 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4084 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4085 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4084, i32 0, i32 3
%.tmp4086 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4085
%.tmp4087 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4083, %m1772$.Type.type* %.tmp4086)
%src_tr = alloca i8*
store i8* %.tmp4087, i8** %src_tr
%.tmp4088 = load i8*, i8** %src_tr
%.tmp4090 = getelementptr [4 x i8], [4 x i8]*@.str4089, i32 0, i32 0
%.tmp4091 = call i32(i8*,i8*) @strcmp(i8* %.tmp4088, i8* %.tmp4090)
%.tmp4092 = icmp eq i32 %.tmp4091, 0
br i1 %.tmp4092, label %.if.true.4093, label %.if.false.4093
.if.true.4093:
%.tmp4094 = load i8*, i8** %dest_tr
store i8* %.tmp4094, i8** %src_tr
br label %.if.end.4093
.if.false.4093:
br label %.if.end.4093
.if.end.4093:
%.tmp4095 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4096 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4095, i32 0, i32 1
%.tmp4097 = load %m0$.File.type*, %m0$.File.type** %.tmp4096
%.tmp4099 = getelementptr [21 x i8], [21 x i8]*@.str4098, i32 0, i32 0
%.tmp4100 = load i8*, i8** %src_tr
%.tmp4101 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4102 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4101)
%.tmp4103 = load i8*, i8** %dest_tr
%.tmp4104 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %dest
%.tmp4105 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4104)
%.tmp4106 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4097, i8* %.tmp4099, i8* %.tmp4100, i8* %.tmp4102, i8* %.tmp4103, i8* %.tmp4105)
br label %.if.end.4041
.if.false.4041:
%.tmp4107 = load i8*, i8** %expr_type
%.tmp4109 = getelementptr [9 x i8], [9 x i8]*@.str4108, i32 0, i32 0
%.tmp4110 = call i32(i8*,i8*) @strcmp(i8* %.tmp4107, i8* %.tmp4109)
%.tmp4111 = icmp eq i32 %.tmp4110, 0
br i1 %.tmp4111, label %.if.true.4112, label %.if.false.4112
.if.true.4112:
%.tmp4113 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4114 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_if_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4113, %m286$.Node.type* %.tmp4114)
br label %.if.end.4112
.if.false.4112:
%.tmp4115 = load i8*, i8** %expr_type
%.tmp4117 = getelementptr [9 x i8], [9 x i8]*@.str4116, i32 0, i32 0
%.tmp4118 = call i32(i8*,i8*) @strcmp(i8* %.tmp4115, i8* %.tmp4117)
%.tmp4119 = icmp eq i32 %.tmp4118, 0
br i1 %.tmp4119, label %.if.true.4120, label %.if.false.4120
.if.true.4120:
%.tmp4121 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4122 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_for_loop.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4121, %m286$.Node.type* %.tmp4122)
br label %.if.end.4120
.if.false.4120:
%.tmp4123 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4124 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4126 = getelementptr [34 x i8], [34 x i8]*@.str4125, i32 0, i32 0
%.tmp4127 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4123, %m286$.Node.type* %.tmp4124, i8* %.tmp4126)
%.tmp4128 = load i8*, i8** %expr_type
%.tmp4129 = call i32(i8*,...) @printf(i8* %.tmp4127, i8* %.tmp4128)
br label %.if.end.4120
.if.end.4120:
br label %.if.end.4112
.if.end.4112:
br label %.if.end.4041
.if.end.4041:
br label %.if.end.4032
.if.end.4032:
br label %.if.end.4021
.if.end.4021:
br label %.if.end.4015
.if.end.4015:
br label %.if.end.3968
.if.end.3968:
ret void
}
define void @m1772$compile_for_loop.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4130 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4131 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp4130)
%for_id = alloca i32
store i32 %.tmp4131, i32* %for_id
%.tmp4132 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4133 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4132, i32 0, i32 6
%.tmp4134 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4133
%.tmp4135 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4134, i32 0, i32 7
%.tmp4136 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4135
%init_stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4136, %m286$.Node.type** %init_stmt
%.tmp4137 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4138 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4137, i32 0, i32 0
%.tmp4139 = load i8*, i8** %.tmp4138
%.tmp4141 = getelementptr [12 x i8], [12 x i8]*@.str4140, i32 0, i32 0
%.tmp4142 = call i32(i8*,i8*) @strcmp(i8* %.tmp4139, i8* %.tmp4141)
%.tmp4143 = icmp eq i32 %.tmp4142, 0
br i1 %.tmp4143, label %.if.true.4144, label %.if.false.4144
.if.true.4144:
%.tmp4145 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4146 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4147 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_declaration.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4145, %m286$.Node.type* %.tmp4146)
br label %.if.end.4144
.if.false.4144:
%.tmp4148 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4149 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4148, i32 0, i32 0
%.tmp4150 = load i8*, i8** %.tmp4149
%.tmp4152 = getelementptr [11 x i8], [11 x i8]*@.str4151, i32 0, i32 0
%.tmp4153 = call i32(i8*,i8*) @strcmp(i8* %.tmp4150, i8* %.tmp4152)
%.tmp4154 = icmp eq i32 %.tmp4153, 0
br i1 %.tmp4154, label %.if.true.4155, label %.if.false.4155
.if.true.4155:
%.tmp4156 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4157 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_expression.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4156, %m286$.Node.type* %.tmp4157)
br label %.if.end.4155
.if.false.4155:
%.tmp4158 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4159 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4158, i32 0, i32 0
%.tmp4160 = load i8*, i8** %.tmp4159
%.tmp4162 = getelementptr [9 x i8], [9 x i8]*@.str4161, i32 0, i32 0
%.tmp4163 = call i32(i8*,i8*) @strcmp(i8* %.tmp4160, i8* %.tmp4162)
%.tmp4164 = icmp eq i32 %.tmp4163, 0
br i1 %.tmp4164, label %.if.true.4165, label %.if.false.4165
.if.true.4165:
br label %.if.end.4165
.if.false.4165:
%.tmp4166 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4167 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4169 = getelementptr [66 x i8], [66 x i8]*@.str4168, i32 0, i32 0
%.tmp4170 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4166, %m286$.Node.type* %.tmp4167, i8* %.tmp4169)
%.tmp4171 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4172 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4171, i32 0, i32 0
%.tmp4173 = load i8*, i8** %.tmp4172
%.tmp4174 = call i32(i8*,...) @printf(i8* %.tmp4170, i8* %.tmp4173)
ret void
br label %.if.end.4165
.if.end.4165:
br label %.if.end.4155
.if.end.4155:
br label %.if.end.4144
.if.end.4144:
%.tmp4175 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4176 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4175, i32 0, i32 1
%.tmp4177 = load %m0$.File.type*, %m0$.File.type** %.tmp4176
%.tmp4179 = getelementptr [26 x i8], [26 x i8]*@.str4178, i32 0, i32 0
%.tmp4180 = load i32, i32* %for_id
%.tmp4181 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4177, i8* %.tmp4179, i32 %.tmp4180)
%.tmp4182 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4183 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4182, i32 0, i32 1
%.tmp4184 = load %m0$.File.type*, %m0$.File.type** %.tmp4183
%.tmp4186 = getelementptr [16 x i8], [16 x i8]*@.str4185, i32 0, i32 0
%.tmp4187 = load i32, i32* %for_id
%.tmp4188 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4184, i8* %.tmp4186, i32 %.tmp4187)
%.tmp4189 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4190 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4189, i32 0, i32 6
%.tmp4191 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4190
%.tmp4193 = getelementptr [9 x i8], [9 x i8]*@.str4192, i32 0, i32 0
%.tmp4194 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4191, i8* %.tmp4193)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4194, %m286$.Node.type** %fst_colon
%.tmp4195 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4196 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4195, i32 0, i32 7
%.tmp4197 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4196
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4197, %m286$.Node.type** %condition
%.tmp4198 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4199 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4200 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4198, %m286$.Node.type* %.tmp4199)
%condition_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4200, %m1772$.AssignableInfo.type** %condition_info
%.tmp4201 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4202 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4201, i32 0, i32 1
%.tmp4203 = load %m0$.File.type*, %m0$.File.type** %.tmp4202
%.tmp4205 = getelementptr [57 x i8], [57 x i8]*@.str4204, i32 0, i32 0
%.tmp4206 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4207 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %condition_info
%.tmp4208 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4207, i32 0, i32 3
%.tmp4209 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4208
%.tmp4210 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4206, %m1772$.Type.type* %.tmp4209)
%.tmp4211 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %condition_info
%.tmp4212 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4211)
%.tmp4213 = load i32, i32* %for_id
%.tmp4214 = load i32, i32* %for_id
%.tmp4215 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4203, i8* %.tmp4205, i8* %.tmp4210, i8* %.tmp4212, i32 %.tmp4213, i32 %.tmp4214)
%.tmp4216 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4217 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4216, i32 0, i32 1
%.tmp4218 = load %m0$.File.type*, %m0$.File.type** %.tmp4217
%.tmp4220 = getelementptr [19 x i8], [19 x i8]*@.str4219, i32 0, i32 0
%.tmp4221 = load i32, i32* %for_id
%.tmp4222 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4218, i8* %.tmp4220, i32 %.tmp4221)
%.tmp4223 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4224 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4223, i32 0, i32 7
%.tmp4225 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4224
%.tmp4227 = getelementptr [9 x i8], [9 x i8]*@.str4226, i32 0, i32 0
%.tmp4228 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4225, i8* %.tmp4227)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4228, %m286$.Node.type** %snd_colon
%.tmp4229 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4230 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4229, i32 0, i32 7
%.tmp4231 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4230
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4231, %m286$.Node.type** %increment
%.tmp4232 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4234 = getelementptr [6 x i8], [6 x i8]*@.str4233, i32 0, i32 0
%.tmp4235 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4232, i8* %.tmp4234)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4235, %m286$.Node.type** %for_body
%.tmp4236 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4237 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4236, %m286$.Node.type* %.tmp4237)
%.tmp4238 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4239 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4240 = icmp ne %m286$.Node.type* %.tmp4238, %.tmp4239
br i1 %.tmp4240, label %.if.true.4241, label %.if.false.4241
.if.true.4241:
%.tmp4242 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4243 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_expression.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4242, %m286$.Node.type* %.tmp4243)
br label %.if.end.4241
.if.false.4241:
br label %.if.end.4241
.if.end.4241:
%.tmp4244 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4245 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4244, i32 0, i32 1
%.tmp4246 = load %m0$.File.type*, %m0$.File.type** %.tmp4245
%.tmp4248 = getelementptr [26 x i8], [26 x i8]*@.str4247, i32 0, i32 0
%.tmp4249 = load i32, i32* %for_id
%.tmp4250 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4246, i8* %.tmp4248, i32 %.tmp4249)
%.tmp4251 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4252 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4251, i32 0, i32 1
%.tmp4253 = load %m0$.File.type*, %m0$.File.type** %.tmp4252
%.tmp4255 = getelementptr [14 x i8], [14 x i8]*@.str4254, i32 0, i32 0
%.tmp4256 = load i32, i32* %for_id
%.tmp4257 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4253, i8* %.tmp4255, i32 %.tmp4256)
ret void
}
define %m1772$.AssignableInfo.type* @m1772$compile_declaration.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4258 = bitcast ptr null to %m1772$.Type.type*
%decl_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp4258, %m1772$.Type.type** %decl_type
%.tmp4259 = bitcast ptr null to %m1772$.AssignableInfo.type*
%a_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4259, %m1772$.AssignableInfo.type** %a_info
%.tmp4260 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4261 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4260, i32 0, i32 6
%.tmp4262 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4261
%.tmp4263 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4262, i32 0, i32 0
%.tmp4264 = load i8*, i8** %.tmp4263
%.tmp4266 = getelementptr [5 x i8], [5 x i8]*@.str4265, i32 0, i32 0
%.tmp4267 = call i32(i8*,i8*) @strcmp(i8* %.tmp4264, i8* %.tmp4266)
%.tmp4268 = icmp eq i32 %.tmp4267, 0
br i1 %.tmp4268, label %.if.true.4269, label %.if.false.4269
.if.true.4269:
%.tmp4270 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4271 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4272 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4271, i32 0, i32 6
%.tmp4273 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4272
%.tmp4274 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4273, i32 0, i32 6
%.tmp4275 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4274
%.tmp4276 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4270, %m286$.Node.type* %.tmp4275)
store %m1772$.Type.type* %.tmp4276, %m1772$.Type.type** %decl_type
br label %.if.end.4269
.if.false.4269:
br label %.if.end.4269
.if.end.4269:
%.tmp4277 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4278 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4277, i32 0, i32 6
%.tmp4279 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4278
%.tmp4281 = getelementptr [11 x i8], [11 x i8]*@.str4280, i32 0, i32 0
%.tmp4282 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4279, i8* %.tmp4281)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4282, %m286$.Node.type** %assignable
%.tmp4283 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4284 = icmp ne %m286$.Node.type* %.tmp4283, null
br i1 %.tmp4284, label %.if.true.4285, label %.if.false.4285
.if.true.4285:
%.tmp4286 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4287 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4288 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4286, %m286$.Node.type* %.tmp4287)
store %m1772$.AssignableInfo.type* %.tmp4288, %m1772$.AssignableInfo.type** %a_info
br label %.if.end.4285
.if.false.4285:
br label %.if.end.4285
.if.end.4285:
%.tmp4289 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4290 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4289)
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4290, %m1772$.AssignableInfo.type** %info
%.tmp4291 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4292 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4291, i32 0, i32 2
%.tmp4294 = getelementptr [9 x i8], [9 x i8]*@.str4293, i32 0, i32 0
store i8* %.tmp4294, i8** %.tmp4292
%.tmp4295 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4296 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4295, i32 0, i32 6
%.tmp4297 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4296
%.tmp4299 = getelementptr [5 x i8], [5 x i8]*@.str4298, i32 0, i32 0
%.tmp4300 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4297, i8* %.tmp4299)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4300, %m286$.Node.type** %var_name
%.tmp4301 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4302 = icmp eq %m286$.Node.type* %.tmp4301, null
br i1 %.tmp4302, label %.if.true.4303, label %.if.false.4303
.if.true.4303:
%.tmp4304 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4305 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4307 = getelementptr [31 x i8], [31 x i8]*@.str4306, i32 0, i32 0
%.tmp4308 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4304, %m286$.Node.type* %.tmp4305, i8* %.tmp4307)
%.tmp4309 = call i32(i8*,...) @printf(i8* %.tmp4308)
%.tmp4310 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp4310
br label %.if.end.4303
.if.false.4303:
br label %.if.end.4303
.if.end.4303:
%.tmp4311 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4312 = load i8, i8* @SCOPE_LOCAL
%.tmp4313 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4314 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4313, i32 0, i32 1
%.tmp4315 = load i8*, i8** %.tmp4314
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp4311, i8 %.tmp4312, i8* %.tmp4315)
%.tmp4316 = load %m1772$.Type.type*, %m1772$.Type.type** %decl_type
%.tmp4317 = icmp ne %m1772$.Type.type* %.tmp4316, null
br i1 %.tmp4317, label %.if.true.4318, label %.if.false.4318
.if.true.4318:
%.tmp4319 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4320 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4319, i32 0, i32 3
%.tmp4321 = load %m1772$.Type.type*, %m1772$.Type.type** %decl_type
store %m1772$.Type.type* %.tmp4321, %m1772$.Type.type** %.tmp4320
br label %.if.end.4318
.if.false.4318:
%.tmp4322 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4323 = icmp ne %m1772$.AssignableInfo.type* %.tmp4322, null
br i1 %.tmp4323, label %.if.true.4324, label %.if.false.4324
.if.true.4324:
%.tmp4325 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4326 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4325, i32 0, i32 3
%.tmp4327 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4328 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4327, i32 0, i32 3
%.tmp4329 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4328
store %m1772$.Type.type* %.tmp4329, %m1772$.Type.type** %.tmp4326
br label %.if.end.4324
.if.false.4324:
br label %.if.end.4324
.if.end.4324:
br label %.if.end.4318
.if.end.4318:
%.tmp4330 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4331 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4332 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4331, i32 0, i32 3
%.tmp4333 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4332
%.tmp4334 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4330, %m1772$.Type.type* %.tmp4333)
%var_type_repr = alloca i8*
store i8* %.tmp4334, i8** %var_type_repr
%.tmp4335 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4336 = icmp ne %m1772$.AssignableInfo.type* %.tmp4335, null
br i1 %.tmp4336, label %.if.true.4337, label %.if.false.4337
.if.true.4337:
%.tmp4338 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4339 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4340 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4339, i32 0, i32 3
%.tmp4341 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4340
%.tmp4342 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4338, %m1772$.Type.type* %.tmp4341)
%a_type_repr = alloca i8*
store i8* %.tmp4342, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4343 = load i8*, i8** %a_type_repr
%.tmp4344 = call i32(i8*) @strlen(i8* %.tmp4343)
%.tmp4345 = load i8*, i8** %var_type_repr
%.tmp4346 = call i32(i8*) @strlen(i8* %.tmp4345)
%.tmp4347 = icmp ne i32 %.tmp4344, %.tmp4346
br i1 %.tmp4347, label %.if.true.4348, label %.if.false.4348
.if.true.4348:
store i1 1, i1* %type_error
br label %.if.end.4348
.if.false.4348:
%.tmp4349 = load i8*, i8** %a_type_repr
%.tmp4350 = load i8*, i8** %var_type_repr
%.tmp4351 = call i32(i8*,i8*) @strcmp(i8* %.tmp4349, i8* %.tmp4350)
%.tmp4352 = icmp ne i32 %.tmp4351, 0
br i1 %.tmp4352, label %.if.true.4353, label %.if.false.4353
.if.true.4353:
store i1 1, i1* %type_error
br label %.if.end.4353
.if.false.4353:
br label %.if.end.4353
.if.end.4353:
br label %.if.end.4348
.if.end.4348:
%.tmp4354 = load i1, i1* %type_error
br i1 %.tmp4354, label %.if.true.4355, label %.if.false.4355
.if.true.4355:
%.tmp4356 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4356, i8** %err_msg
%.tmp4357 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4359 = getelementptr [49 x i8], [49 x i8]*@.str4358, i32 0, i32 0
%.tmp4360 = load i8*, i8** %a_type_repr
%.tmp4361 = load i8*, i8** %var_type_repr
%.tmp4362 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4357, i8* %.tmp4359, i8* %.tmp4360, i8* %.tmp4361)
%.tmp4363 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4364 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4365 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4363, %m286$.Node.type* %.tmp4364, i8* %.tmp4365)
br label %.if.end.4355
.if.false.4355:
br label %.if.end.4355
.if.end.4355:
br label %.if.end.4337
.if.false.4337:
br label %.if.end.4337
.if.end.4337:
%.tmp4366 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4367 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4368 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4367, i32 0, i32 1
%.tmp4369 = load i8*, i8** %.tmp4368
%.tmp4370 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4366, i8* %.tmp4369, %m1772$.AssignableInfo.type* %.tmp4370)
%.tmp4371 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4372 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4371, i32 0, i32 1
%.tmp4373 = load %m0$.File.type*, %m0$.File.type** %.tmp4372
%.tmp4375 = getelementptr [16 x i8], [16 x i8]*@.str4374, i32 0, i32 0
%.tmp4376 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4377 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4376)
%.tmp4378 = load i8*, i8** %var_type_repr
%.tmp4379 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4373, i8* %.tmp4375, i8* %.tmp4377, i8* %.tmp4378)
%.tmp4380 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4381 = icmp ne %m1772$.AssignableInfo.type* %.tmp4380, null
br i1 %.tmp4381, label %.if.true.4382, label %.if.false.4382
.if.true.4382:
%.tmp4383 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4384 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4383, i32 0, i32 1
%.tmp4385 = load %m0$.File.type*, %m0$.File.type** %.tmp4384
%.tmp4387 = getelementptr [21 x i8], [21 x i8]*@.str4386, i32 0, i32 0
%.tmp4388 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4389 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4390 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4389, i32 0, i32 3
%.tmp4391 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4390
%.tmp4392 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4388, %m1772$.Type.type* %.tmp4391)
%.tmp4393 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4394 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4393)
%.tmp4395 = load i8*, i8** %var_type_repr
%.tmp4396 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4397 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4396)
%.tmp4398 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4385, i8* %.tmp4387, i8* %.tmp4392, i8* %.tmp4394, i8* %.tmp4395, i8* %.tmp4397)
br label %.if.end.4382
.if.false.4382:
%.tmp4399 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4400 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4401 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,%m1772$.AssignableInfo.type*) @m1772$compile_zero_value.v.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4399, %m286$.Node.type* %.tmp4400, %m1772$.AssignableInfo.type* %.tmp4401)
br label %.if.end.4382
.if.end.4382:
%.tmp4402 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp4402
}
define void @m1772$compile_zero_value.v.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, %m1772$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.info.arg, %m1772$.AssignableInfo.type** %info
%.tmp4403 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4404 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4403, i32 0, i32 3
%.tmp4405 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4404
%.tmp4406 = icmp eq %m1772$.Type.type* %.tmp4405, null
br i1 %.tmp4406, label %.if.true.4407, label %.if.false.4407
.if.true.4407:
ret void
br label %.if.end.4407
.if.false.4407:
br label %.if.end.4407
.if.end.4407:
%.tmp4408 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4409 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4410 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4409, i32 0, i32 3
%.tmp4411 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4410
%.tmp4412 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4408, %m1772$.Type.type* %.tmp4411)
%t_repr = alloca i8*
store i8* %.tmp4412, i8** %t_repr
%.tmp4413 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4414 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4413)
%id = alloca i8*
store i8* %.tmp4414, i8** %id
%field_id = alloca i32
store i32 0, i32* %field_id
%field = alloca %m1772$.Type.type*
%field_info = alloca %m1772$.AssignableInfo.type*
%.tmp4415 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4416 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4415, i32 0, i32 3
%.tmp4417 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4416
%t = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp4417, %m1772$.Type.type** %t
%.tmp4418 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4419 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4418, i32 0, i32 0
%.tmp4420 = load i8*, i8** %.tmp4419
%.tmp4422 = getelementptr [4 x i8], [4 x i8]*@.str4421, i32 0, i32 0
%.tmp4423 = call i32(i8*,i8*) @strcmp(i8* %.tmp4420, i8* %.tmp4422)
%.tmp4424 = icmp eq i32 %.tmp4423, 0
%.tmp4425 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4426 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4425, i32 0, i32 0
%.tmp4427 = load i8*, i8** %.tmp4426
%.tmp4429 = getelementptr [4 x i8], [4 x i8]*@.str4428, i32 0, i32 0
%.tmp4430 = call i32(i8*,i8*) @strcmp(i8* %.tmp4427, i8* %.tmp4429)
%.tmp4431 = icmp eq i32 %.tmp4430, 0
%.tmp4432 = or i1 %.tmp4424, %.tmp4431
br i1 %.tmp4432, label %.if.true.4433, label %.if.false.4433
.if.true.4433:
%.tmp4434 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4435 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4434, i32 0, i32 1
%.tmp4436 = load %m0$.File.type*, %m0$.File.type** %.tmp4435
%.tmp4438 = getelementptr [21 x i8], [21 x i8]*@.str4437, i32 0, i32 0
%.tmp4439 = load i8*, i8** %t_repr
%.tmp4440 = load i8*, i8** %t_repr
%.tmp4441 = load i8*, i8** %id
%.tmp4442 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4436, i8* %.tmp4438, i8* %.tmp4439, i32 0, i8* %.tmp4440, i8* %.tmp4441)
br label %.if.end.4433
.if.false.4433:
%.tmp4443 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4444 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4443, i32 0, i32 0
%.tmp4445 = load i8*, i8** %.tmp4444
%.tmp4447 = getelementptr [4 x i8], [4 x i8]*@.str4446, i32 0, i32 0
%.tmp4448 = call i32(i8*,i8*) @strcmp(i8* %.tmp4445, i8* %.tmp4447)
%.tmp4449 = icmp eq i32 %.tmp4448, 0
br i1 %.tmp4449, label %.if.true.4450, label %.if.false.4450
.if.true.4450:
%.tmp4451 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4452 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4451, i32 0, i32 1
%.tmp4453 = load %m0$.File.type*, %m0$.File.type** %.tmp4452
%.tmp4455 = getelementptr [21 x i8], [21 x i8]*@.str4454, i32 0, i32 0
%.tmp4456 = load i8*, i8** %t_repr
%.tmp4458 = getelementptr [5 x i8], [5 x i8]*@.str4457, i32 0, i32 0
%.tmp4459 = load i8*, i8** %t_repr
%.tmp4460 = load i8*, i8** %id
%.tmp4461 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4453, i8* %.tmp4455, i8* %.tmp4456, i8* %.tmp4458, i8* %.tmp4459, i8* %.tmp4460)
br label %.if.end.4450
.if.false.4450:
%.tmp4462 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4463 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4462, i32 0, i32 0
%.tmp4464 = load i8*, i8** %.tmp4463
%.tmp4466 = getelementptr [7 x i8], [7 x i8]*@.str4465, i32 0, i32 0
%.tmp4467 = call i32(i8*,i8*) @strcmp(i8* %.tmp4464, i8* %.tmp4466)
%.tmp4468 = icmp eq i32 %.tmp4467, 0
br i1 %.tmp4468, label %.if.true.4469, label %.if.false.4469
.if.true.4469:
%.tmp4471 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4472 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4471, i32 0, i32 3
%.tmp4473 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4472
store %m1772$.Type.type* %.tmp4473, %m1772$.Type.type** %field
br label %.for.start.4470
.for.start.4470:
%.tmp4474 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp4475 = icmp ne %m1772$.Type.type* %.tmp4474, null
br i1 %.tmp4475, label %.for.continue.4470, label %.for.end.4470
.for.continue.4470:
%.tmp4476 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4477 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4476)
store %m1772$.AssignableInfo.type* %.tmp4477, %m1772$.AssignableInfo.type** %field_info
%.tmp4478 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4479 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4478, %m1772$.AssignableInfo.type* %.tmp4479)
%.tmp4480 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
%.tmp4481 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4480, i32 0, i32 3
%.tmp4482 = load %m1772$.Type.type*, %m1772$.Type.type** %field
store %m1772$.Type.type* %.tmp4482, %m1772$.Type.type** %.tmp4481
%.tmp4483 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4484 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4483, i32 0, i32 1
%.tmp4485 = load %m0$.File.type*, %m0$.File.type** %.tmp4484
%.tmp4487 = getelementptr [46 x i8], [46 x i8]*@.str4486, i32 0, i32 0
%.tmp4488 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
%.tmp4489 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4488)
%.tmp4490 = load i8*, i8** %t_repr
%.tmp4491 = load i8*, i8** %t_repr
%.tmp4492 = load i8*, i8** %id
%.tmp4493 = load i32, i32* %field_id
%.tmp4494 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4485, i8* %.tmp4487, i8* %.tmp4489, i8* %.tmp4490, i8* %.tmp4491, i8* %.tmp4492, i32 %.tmp4493)
%.tmp4495 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4496 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4497 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,%m1772$.AssignableInfo.type*) @m1772$compile_zero_value.v.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4495, %m286$.Node.type* %.tmp4496, %m1772$.AssignableInfo.type* %.tmp4497)
%.tmp4498 = load i32, i32* %field_id
%.tmp4499 = add i32 %.tmp4498, 1
store i32 %.tmp4499, i32* %field_id
%.tmp4500 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp4501 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4500, i32 0, i32 4
%.tmp4502 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4501
store %m1772$.Type.type* %.tmp4502, %m1772$.Type.type** %field
br label %.for.start.4470
.for.end.4470:
br label %.if.end.4469
.if.false.4469:
%.tmp4503 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4504 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4503, i32 0, i32 0
%.tmp4505 = load i8*, i8** %.tmp4504
%.tmp4507 = getelementptr [10 x i8], [10 x i8]*@.str4506, i32 0, i32 0
%.tmp4508 = call i32(i8*,i8*) @strcmp(i8* %.tmp4505, i8* %.tmp4507)
%.tmp4509 = icmp eq i32 %.tmp4508, 0
br i1 %.tmp4509, label %.if.true.4510, label %.if.false.4510
.if.true.4510:
%.tmp4512 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp4513 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4512, i32 0, i32 3
%.tmp4514 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4513
%.tmp4515 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4514, i32 0, i32 3
%.tmp4516 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4515
store %m1772$.Type.type* %.tmp4516, %m1772$.Type.type** %field
br label %.for.start.4511
.for.start.4511:
%.tmp4517 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp4518 = icmp ne %m1772$.Type.type* %.tmp4517, null
br i1 %.tmp4518, label %.for.continue.4511, label %.for.end.4511
.for.continue.4511:
%.tmp4519 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4520 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4519)
store %m1772$.AssignableInfo.type* %.tmp4520, %m1772$.AssignableInfo.type** %field_info
%.tmp4521 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4522 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4521, %m1772$.AssignableInfo.type* %.tmp4522)
%.tmp4523 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
%.tmp4524 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4523, i32 0, i32 3
%.tmp4525 = load %m1772$.Type.type*, %m1772$.Type.type** %field
store %m1772$.Type.type* %.tmp4525, %m1772$.Type.type** %.tmp4524
%.tmp4526 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4527 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4526, i32 0, i32 1
%.tmp4528 = load %m0$.File.type*, %m0$.File.type** %.tmp4527
%.tmp4530 = getelementptr [46 x i8], [46 x i8]*@.str4529, i32 0, i32 0
%.tmp4531 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
%.tmp4532 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4531)
%.tmp4533 = load i8*, i8** %t_repr
%.tmp4534 = load i8*, i8** %t_repr
%.tmp4535 = load i8*, i8** %id
%.tmp4536 = load i32, i32* %field_id
%.tmp4537 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4528, i8* %.tmp4530, i8* %.tmp4532, i8* %.tmp4533, i8* %.tmp4534, i8* %.tmp4535, i32 %.tmp4536)
%.tmp4538 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4539 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4540 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %field_info
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,%m1772$.AssignableInfo.type*) @m1772$compile_zero_value.v.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4538, %m286$.Node.type* %.tmp4539, %m1772$.AssignableInfo.type* %.tmp4540)
%.tmp4541 = load i32, i32* %field_id
%.tmp4542 = add i32 %.tmp4541, 1
store i32 %.tmp4542, i32* %field_id
%.tmp4543 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp4544 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4543, i32 0, i32 4
%.tmp4545 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4544
store %m1772$.Type.type* %.tmp4545, %m1772$.Type.type** %field
br label %.for.start.4511
.for.end.4511:
br label %.if.end.4510
.if.false.4510:
%.tmp4546 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4547 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4549 = getelementptr [44 x i8], [44 x i8]*@.str4548, i32 0, i32 0
%.tmp4550 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4546, %m286$.Node.type* %.tmp4547, i8* %.tmp4549)
%.tmp4551 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4552 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4551, i32 0, i32 3
%.tmp4553 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4552
%.tmp4554 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4553, i32 0, i32 0
%.tmp4555 = load i8*, i8** %.tmp4554
%.tmp4556 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4557 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4558 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4557, i32 0, i32 3
%.tmp4559 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4558
%.tmp4560 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4556, %m1772$.Type.type* %.tmp4559)
%.tmp4561 = call i32(i8*,...) @printf(i8* %.tmp4550, i8* %.tmp4555, i8* %.tmp4560)
ret void
br label %.if.end.4510
.if.end.4510:
br label %.if.end.4469
.if.end.4469:
br label %.if.end.4450
.if.end.4450:
br label %.if.end.4433
.if.end.4433:
ret void
}
define void @m1772$compile_if_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4562 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4563 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4562, i32 0, i32 6
%.tmp4564 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4563
%.tmp4566 = getelementptr [11 x i8], [11 x i8]*@.str4565, i32 0, i32 0
%.tmp4567 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4564, i8* %.tmp4566)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4567, %m286$.Node.type** %assignable
%.tmp4568 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4569 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4570 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4568, %m286$.Node.type* %.tmp4569)
%a_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4570, %m1772$.AssignableInfo.type** %a_info
%.tmp4571 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4572 = icmp eq %m1772$.AssignableInfo.type* %.tmp4571, null
br i1 %.tmp4572, label %.if.true.4573, label %.if.false.4573
.if.true.4573:
ret void
br label %.if.end.4573
.if.false.4573:
br label %.if.end.4573
.if.end.4573:
%.tmp4574 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4575 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp4574)
%if_id = alloca i32
store i32 %.tmp4575, i32* %if_id
%.tmp4576 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4577 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4576, i32 0, i32 1
%.tmp4578 = load %m0$.File.type*, %m0$.File.type** %.tmp4577
%.tmp4580 = getelementptr [53 x i8], [53 x i8]*@.str4579, i32 0, i32 0
%.tmp4581 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4582 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4583 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4582, i32 0, i32 3
%.tmp4584 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4583
%.tmp4585 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4581, %m1772$.Type.type* %.tmp4584)
%.tmp4586 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %a_info
%.tmp4587 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4586)
%.tmp4588 = load i32, i32* %if_id
%.tmp4589 = load i32, i32* %if_id
%.tmp4590 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4578, i8* %.tmp4580, i8* %.tmp4585, i8* %.tmp4587, i32 %.tmp4588, i32 %.tmp4589)
%.tmp4591 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4592 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4591, i32 0, i32 1
%.tmp4593 = load %m0$.File.type*, %m0$.File.type** %.tmp4592
%.tmp4595 = getelementptr [14 x i8], [14 x i8]*@.str4594, i32 0, i32 0
%.tmp4596 = load i32, i32* %if_id
%.tmp4597 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4593, i8* %.tmp4595, i32 %.tmp4596)
%.tmp4598 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4599 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4598, i32 0, i32 6
%.tmp4600 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4599
%.tmp4602 = getelementptr [6 x i8], [6 x i8]*@.str4601, i32 0, i32 0
%.tmp4603 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4600, i8* %.tmp4602)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4603, %m286$.Node.type** %block
%.tmp4604 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4605 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4604, %m286$.Node.type* %.tmp4605)
%.tmp4606 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4607 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4606, i32 0, i32 1
%.tmp4608 = load %m0$.File.type*, %m0$.File.type** %.tmp4607
%.tmp4610 = getelementptr [23 x i8], [23 x i8]*@.str4609, i32 0, i32 0
%.tmp4611 = load i32, i32* %if_id
%.tmp4612 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4608, i8* %.tmp4610, i32 %.tmp4611)
%.tmp4613 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4614 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4613, i32 0, i32 1
%.tmp4615 = load %m0$.File.type*, %m0$.File.type** %.tmp4614
%.tmp4617 = getelementptr [15 x i8], [15 x i8]*@.str4616, i32 0, i32 0
%.tmp4618 = load i32, i32* %if_id
%.tmp4619 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4615, i8* %.tmp4617, i32 %.tmp4618)
%.tmp4620 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4621 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4620, i32 0, i32 6
%.tmp4622 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4621
%.tmp4624 = getelementptr [11 x i8], [11 x i8]*@.str4623, i32 0, i32 0
%.tmp4625 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4622, i8* %.tmp4624)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4625, %m286$.Node.type** %else_block
%.tmp4626 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4627 = icmp ne %m286$.Node.type* %.tmp4626, null
br i1 %.tmp4627, label %.if.true.4628, label %.if.false.4628
.if.true.4628:
%.tmp4629 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4630 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4629, i32 0, i32 6
%.tmp4631 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4630
%.tmp4632 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4631, i32 0, i32 0
%.tmp4633 = load i8*, i8** %.tmp4632
%.tmp4635 = getelementptr [11 x i8], [11 x i8]*@.str4634, i32 0, i32 0
%.tmp4636 = call i32(i8*,i8*) @strcmp(i8* %.tmp4633, i8* %.tmp4635)
%.tmp4637 = icmp eq i32 %.tmp4636, 0
br i1 %.tmp4637, label %.if.true.4638, label %.if.false.4638
.if.true.4638:
%.tmp4639 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4640 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4639, i32 0, i32 6
%.tmp4641 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4640
%.tmp4642 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4641, i32 0, i32 6
%.tmp4643 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4642
%.tmp4645 = getelementptr [6 x i8], [6 x i8]*@.str4644, i32 0, i32 0
%.tmp4646 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4643, i8* %.tmp4645)
store %m286$.Node.type* %.tmp4646, %m286$.Node.type** %block
%.tmp4647 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4648 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4647, %m286$.Node.type* %.tmp4648)
br label %.if.end.4638
.if.false.4638:
%.tmp4649 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4650 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_if_block.v.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4649, %m286$.Node.type* %.tmp4650)
br label %.if.end.4638
.if.end.4638:
br label %.if.end.4628
.if.false.4628:
br label %.if.end.4628
.if.end.4628:
%.tmp4651 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4652 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4651, i32 0, i32 1
%.tmp4653 = load %m0$.File.type*, %m0$.File.type** %.tmp4652
%.tmp4655 = getelementptr [23 x i8], [23 x i8]*@.str4654, i32 0, i32 0
%.tmp4656 = load i32, i32* %if_id
%.tmp4657 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4653, i8* %.tmp4655, i32 %.tmp4656)
%.tmp4658 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4659 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4658, i32 0, i32 1
%.tmp4660 = load %m0$.File.type*, %m0$.File.type** %.tmp4659
%.tmp4662 = getelementptr [13 x i8], [13 x i8]*@.str4661, i32 0, i32 0
%.tmp4663 = load i32, i32* %if_id
%.tmp4664 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4660, i8* %.tmp4662, i32 %.tmp4663)
ret void
}
define void @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4665 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4666 = icmp ne %m286$.Node.type* %.tmp4665, null
br i1 %.tmp4666, label %.if.true.4667, label %.if.false.4667
.if.true.4667:
%.tmp4668 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4669 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4668, i32 0, i32 6
%.tmp4670 = load i8*, i8** %.tmp4669
%.tmp4671 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4672 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4671, i32 0, i32 3
%.tmp4673 = load i32, i32* %.tmp4672
%.tmp4674 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4675 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4674, i32 0, i32 4
%.tmp4676 = load i32, i32* %.tmp4675
%.tmp4677 = load i8*, i8** %msg
%.tmp4678 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp4670, i32 %.tmp4673, i32 %.tmp4676, i8* %.tmp4677)
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp4678, %m717$.Error.type** %err
%.tmp4679 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4680 = load %m717$.Error.type*, %m717$.Error.type** %err
call void(%m1772$.CompilerCtx.type*,%m717$.Error.type*) @m1772$append_error.v.m1772$.CompilerCtx.typep.m717$.Error.typep(%m1772$.CompilerCtx.type* %.tmp4679, %m717$.Error.type* %.tmp4680)
br label %.if.end.4667
.if.false.4667:
%.tmp4682 = getelementptr [61 x i8], [61 x i8]*@.str4681, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4682)
br label %.if.end.4667
.if.end.4667:
ret void
}
define void @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1772$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.info.arg, %m1772$.AssignableInfo.type** %info
%.tmp4683 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4684 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*) @m1772$get_current_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp4683)
%mod = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp4684, %m1772$.ModuleLookup.type** %mod
%.tmp4685 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp4686 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp4685, i32 0, i32 3
%.tmp4687 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp4686
%.tmp4688 = icmp ne %m1772$.Scope.type* %.tmp4687, null
%.tmp4690 = getelementptr [82 x i8], [82 x i8]*@.str4689, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4688, i8* %.tmp4690)
%.tmp4691 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp4692 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp4691, i32 0, i32 3
%.tmp4693 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp4692
%current_scope = alloca %m1772$.Scope.type*
store %m1772$.Scope.type* %.tmp4693, %m1772$.Scope.type** %current_scope
%.tmp4694 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* null, i32 1
%.tmp4695 = ptrtoint %m1772$.ScopeItem.type* %.tmp4694 to i32
%.tmp4696 = call i8*(i32) @malloc(i32 %.tmp4695)
%.tmp4697 = bitcast i8* %.tmp4696 to %m1772$.ScopeItem.type*
%newitem = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp4697, %m1772$.ScopeItem.type** %newitem
%.tmp4698 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %newitem
%.tmp4699 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4698, i32 0, i32 0
%.tmp4700 = load i8*, i8** %name
store i8* %.tmp4700, i8** %.tmp4699
%.tmp4701 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %newitem
%.tmp4702 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4701, i32 0, i32 1
%.tmp4703 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
store %m1772$.AssignableInfo.type* %.tmp4703, %m1772$.AssignableInfo.type** %.tmp4702
%.tmp4704 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %newitem
%.tmp4705 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4704, i32 0, i32 2
store %m1772$.ScopeItem.type* null, %m1772$.ScopeItem.type** %.tmp4705
%.tmp4706 = load %m1772$.Scope.type*, %m1772$.Scope.type** %current_scope
%.tmp4707 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp4706, i32 0, i32 1
%.tmp4708 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %.tmp4707
%.tmp4709 = icmp eq %m1772$.ScopeItem.type* %.tmp4708, null
br i1 %.tmp4709, label %.if.true.4710, label %.if.false.4710
.if.true.4710:
%.tmp4711 = load %m1772$.Scope.type*, %m1772$.Scope.type** %current_scope
%.tmp4712 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp4711, i32 0, i32 1
%.tmp4713 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %newitem
store %m1772$.ScopeItem.type* %.tmp4713, %m1772$.ScopeItem.type** %.tmp4712
ret void
br label %.if.end.4710
.if.false.4710:
br label %.if.end.4710
.if.end.4710:
%.tmp4714 = load %m1772$.Scope.type*, %m1772$.Scope.type** %current_scope
%.tmp4715 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp4714, i32 0, i32 1
%.tmp4716 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %.tmp4715
%last_item = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp4716, %m1772$.ScopeItem.type** %last_item
br label %.for.start.4717
.for.start.4717:
%.tmp4718 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %last_item
%.tmp4719 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4718, i32 0, i32 2
%.tmp4720 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %.tmp4719
%.tmp4721 = icmp ne %m1772$.ScopeItem.type* %.tmp4720, null
br i1 %.tmp4721, label %.for.continue.4717, label %.for.end.4717
.for.continue.4717:
%.tmp4722 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %last_item
%.tmp4723 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4722, i32 0, i32 2
%.tmp4724 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %.tmp4723
store %m1772$.ScopeItem.type* %.tmp4724, %m1772$.ScopeItem.type** %last_item
br label %.for.start.4717
.for.end.4717:
%.tmp4725 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %last_item
%.tmp4726 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4725, i32 0, i32 2
%.tmp4727 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %newitem
store %m1772$.ScopeItem.type* %.tmp4727, %m1772$.ScopeItem.type** %.tmp4726
ret void
}
define %m1772$.ScopeItem.type* @m1772$find_defined_in.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%err_buf = alloca i8*
%.tmp4728 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4729 = load i8*, i8** %module
%.tmp4730 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4731 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4730, i32 0, i32 1
%.tmp4732 = load i8*, i8** %.tmp4731
%.tmp4733 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,i8*,i8*) @m1772$find_defined_str.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.cp(%m1772$.CompilerCtx.type* %.tmp4728, i8* %.tmp4729, i8* %.tmp4732)
%found = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp4733, %m1772$.ScopeItem.type** %found
%.tmp4734 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %found
%.tmp4735 = icmp eq %m1772$.ScopeItem.type* %.tmp4734, null
br i1 %.tmp4735, label %.if.true.4736, label %.if.false.4736
.if.true.4736:
%.tmp4737 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4739 = getelementptr [31 x i8], [31 x i8]*@.str4738, i32 0, i32 0
%.tmp4740 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4741 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4740, i32 0, i32 1
%.tmp4742 = load i8*, i8** %.tmp4741
%.tmp4743 = load i8*, i8** %module
%.tmp4744 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4737, i8* %.tmp4739, i8* %.tmp4742, i8* %.tmp4743)
%.tmp4745 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4746 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4747 = load i8*, i8** %err_buf
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4745, %m286$.Node.type* %.tmp4746, i8* %.tmp4747)
%.tmp4748 = bitcast ptr null to %m1772$.ScopeItem.type*
ret %m1772$.ScopeItem.type* %.tmp4748
br label %.if.end.4736
.if.false.4736:
br label %.if.end.4736
.if.end.4736:
br label %.for.start.4749
.for.start.4749:
%.tmp4750 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4751 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4750, i32 0, i32 7
%.tmp4752 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4751
%.tmp4753 = icmp ne %m286$.Node.type* %.tmp4752, null
%.tmp4754 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %found
%.tmp4755 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4754, i32 0, i32 1
%.tmp4756 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp4755
%.tmp4757 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4756, i32 0, i32 2
%.tmp4758 = load i8*, i8** %.tmp4757
%.tmp4760 = getelementptr [7 x i8], [7 x i8]*@.str4759, i32 0, i32 0
%.tmp4761 = call i32(i8*,i8*) @strcmp(i8* %.tmp4758, i8* %.tmp4760)
%.tmp4762 = icmp eq i32 %.tmp4761, 0
%.tmp4763 = and i1 %.tmp4753, %.tmp4762
br i1 %.tmp4763, label %.for.continue.4749, label %.for.end.4749
.for.continue.4749:
%.tmp4764 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4765 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %found
%.tmp4766 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4765, i32 0, i32 1
%.tmp4767 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp4766
%.tmp4768 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4767, i32 0, i32 0
%.tmp4769 = load i8*, i8** %.tmp4768
%.tmp4770 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4771 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4770, i32 0, i32 7
%.tmp4772 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4771
%.tmp4773 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4772, i32 0, i32 7
%.tmp4774 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4773
%.tmp4775 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1772$find_defined_in.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4764, i8* %.tmp4769, %m286$.Node.type* %.tmp4774)
store %m1772$.ScopeItem.type* %.tmp4775, %m1772$.ScopeItem.type** %found
%.tmp4776 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %found
%.tmp4777 = icmp eq %m1772$.ScopeItem.type* %.tmp4776, null
br i1 %.tmp4777, label %.if.true.4778, label %.if.false.4778
.if.true.4778:
%.tmp4779 = bitcast ptr null to %m1772$.ScopeItem.type*
ret %m1772$.ScopeItem.type* %.tmp4779
br label %.if.end.4778
.if.false.4778:
br label %.if.end.4778
.if.end.4778:
br label %.for.start.4749
.for.end.4749:
%.tmp4780 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %found
ret %m1772$.ScopeItem.type* %.tmp4780
}
define %m1772$.ScopeItem.type* @m1772$find_defined_str.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.cp(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4781 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4782 = load i8*, i8** %module
%.tmp4783 = call %m1772$.ModuleLookup.type*(%m1772$.CompilerCtx.type*,i8*) @m1772$get_module.m1772$.ModuleLookup.typep.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.tmp4781, i8* %.tmp4782)
%mod = alloca %m1772$.ModuleLookup.type*
store %m1772$.ModuleLookup.type* %.tmp4783, %m1772$.ModuleLookup.type** %mod
%.tmp4784 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp4785 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp4784, i32 0, i32 3
%.tmp4786 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp4785
%.tmp4787 = icmp ne %m1772$.Scope.type* %.tmp4786, null
%.tmp4789 = getelementptr [77 x i8], [77 x i8]*@.str4788, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4787, i8* %.tmp4789)
%.tmp4791 = load %m1772$.ModuleLookup.type*, %m1772$.ModuleLookup.type** %mod
%.tmp4792 = getelementptr %m1772$.ModuleLookup.type, %m1772$.ModuleLookup.type* %.tmp4791, i32 0, i32 3
%.tmp4793 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp4792
%s = alloca %m1772$.Scope.type*
store %m1772$.Scope.type* %.tmp4793, %m1772$.Scope.type** %s
br label %.for.start.4790
.for.start.4790:
%.tmp4794 = load %m1772$.Scope.type*, %m1772$.Scope.type** %s
%.tmp4795 = icmp ne %m1772$.Scope.type* %.tmp4794, null
br i1 %.tmp4795, label %.for.continue.4790, label %.for.end.4790
.for.continue.4790:
%.tmp4797 = load %m1772$.Scope.type*, %m1772$.Scope.type** %s
%.tmp4798 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp4797, i32 0, i32 1
%.tmp4799 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %.tmp4798
%item = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp4799, %m1772$.ScopeItem.type** %item
br label %.for.start.4796
.for.start.4796:
%.tmp4800 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %item
%.tmp4801 = icmp ne %m1772$.ScopeItem.type* %.tmp4800, null
br i1 %.tmp4801, label %.for.continue.4796, label %.for.end.4796
.for.continue.4796:
%.tmp4802 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %item
%.tmp4803 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4802, i32 0, i32 0
%.tmp4804 = load i8*, i8** %.tmp4803
%.tmp4805 = load i8*, i8** %assignable_name
%.tmp4806 = call i32(i8*,i8*) @strcmp(i8* %.tmp4804, i8* %.tmp4805)
%.tmp4807 = icmp eq i32 %.tmp4806, 0
br i1 %.tmp4807, label %.if.true.4808, label %.if.false.4808
.if.true.4808:
%.tmp4809 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %item
ret %m1772$.ScopeItem.type* %.tmp4809
br label %.if.end.4808
.if.false.4808:
br label %.if.end.4808
.if.end.4808:
%.tmp4810 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %item
%.tmp4811 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp4810, i32 0, i32 2
%.tmp4812 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %.tmp4811
store %m1772$.ScopeItem.type* %.tmp4812, %m1772$.ScopeItem.type** %item
br label %.for.start.4796
.for.end.4796:
%.tmp4813 = load %m1772$.Scope.type*, %m1772$.Scope.type** %s
%.tmp4814 = getelementptr %m1772$.Scope.type, %m1772$.Scope.type* %.tmp4813, i32 0, i32 2
%.tmp4815 = load %m1772$.Scope.type*, %m1772$.Scope.type** %.tmp4814
store %m1772$.Scope.type* %.tmp4815, %m1772$.Scope.type** %s
br label %.for.start.4790
.for.end.4790:
%.tmp4816 = bitcast ptr null to %m1772$.ScopeItem.type*
ret %m1772$.ScopeItem.type* %.tmp4816
}
define %m1772$.ScopeItem.type* @m1772$find_defined.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp4817 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4818 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4819 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4818, i32 0, i32 6
%.tmp4820 = load i8*, i8** %.tmp4819
%.tmp4821 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4822 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4821, i32 0, i32 6
%.tmp4823 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4822
%.tmp4824 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1772$find_defined_in.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp4817, i8* %.tmp4820, %m286$.Node.type* %.tmp4823)
ret %m1772$.ScopeItem.type* %.tmp4824
}
define %m1772$.AssignableInfo.type* @m1772$get_dotted_name.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dot_name_ptr.arg, %m1772$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.dot_name_ptr.arg, %m286$.Node.type** %dot_name_ptr
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.info.arg, %m1772$.AssignableInfo.type** %info
%err_msg = alloca i8*
%buf = alloca i8*
%.tmp4825 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4826 = icmp eq %m1772$.AssignableInfo.type* %.tmp4825, null
br i1 %.tmp4826, label %.if.true.4827, label %.if.false.4827
.if.true.4827:
%.tmp4828 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4829 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4831 = getelementptr [54 x i8], [54 x i8]*@.str4830, i32 0, i32 0
%.tmp4832 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4828, %m286$.Node.type* %.tmp4829, i8* %.tmp4831)
%.tmp4833 = call i32(i8*,...) @printf(i8* %.tmp4832)
%.tmp4834 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp4834
br label %.if.end.4827
.if.false.4827:
br label %.if.end.4827
.if.end.4827:
%.tmp4835 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4836 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4835, i32 0, i32 2
%.tmp4837 = load i8*, i8** %.tmp4836
%.tmp4839 = getelementptr [9 x i8], [9 x i8]*@.str4838, i32 0, i32 0
%.tmp4840 = call i32(i8*,i8*) @strcmp(i8* %.tmp4837, i8* %.tmp4839)
%.tmp4841 = icmp eq i32 %.tmp4840, 0
%.tmp4842 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4843 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4842, i32 0, i32 2
%.tmp4844 = load i8*, i8** %.tmp4843
%.tmp4846 = getelementptr [7 x i8], [7 x i8]*@.str4845, i32 0, i32 0
%.tmp4847 = call i32(i8*,i8*) @strcmp(i8* %.tmp4844, i8* %.tmp4846)
%.tmp4848 = icmp eq i32 %.tmp4847, 0
%.tmp4849 = or i1 %.tmp4841, %.tmp4848
br i1 %.tmp4849, label %.if.true.4850, label %.if.false.4850
.if.true.4850:
%.tmp4851 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4852 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4851, i32 0, i32 7
%.tmp4853 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4852
%.tmp4854 = icmp ne %m286$.Node.type* %.tmp4853, null
br i1 %.tmp4854, label %.if.true.4855, label %.if.false.4855
.if.true.4855:
%.tmp4856 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4858 = getelementptr [46 x i8], [46 x i8]*@.str4857, i32 0, i32 0
%.tmp4859 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4860 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4859, i32 0, i32 7
%.tmp4861 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4860
%.tmp4862 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4861, i32 0, i32 7
%.tmp4863 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4862
%.tmp4864 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4863, i32 0, i32 1
%.tmp4865 = load i8*, i8** %.tmp4864
%.tmp4866 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4867 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4866, i32 0, i32 1
%.tmp4868 = load i8*, i8** %.tmp4867
%.tmp4869 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4856, i8* %.tmp4858, i8* %.tmp4865, i8* %.tmp4868)
%.tmp4870 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4871 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4872 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4870, %m286$.Node.type* %.tmp4871, i8* %.tmp4872)
%.tmp4873 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp4873
br label %.if.end.4855
.if.false.4855:
br label %.if.end.4855
.if.end.4855:
%.tmp4874 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp4874
br label %.if.end.4850
.if.false.4850:
%.tmp4875 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp4876 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4875, i32 0, i32 2
%.tmp4877 = load i8*, i8** %.tmp4876
%.tmp4879 = getelementptr [9 x i8], [9 x i8]*@.str4878, i32 0, i32 0
%.tmp4880 = call i32(i8*,i8*) @strcmp(i8* %.tmp4877, i8* %.tmp4879)
%.tmp4881 = icmp eq i32 %.tmp4880, 0
%.tmp4882 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4883 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4882, i32 0, i32 7
%.tmp4884 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4883
%.tmp4885 = icmp ne %m286$.Node.type* %.tmp4884, null
%.tmp4886 = and i1 %.tmp4881, %.tmp4885
br i1 %.tmp4886, label %.if.true.4887, label %.if.false.4887
.if.true.4887:
%.tmp4888 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%base_var = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4888, %m1772$.AssignableInfo.type** %base_var
%.tmp4889 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp4890 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4889, i32 0, i32 3
%.tmp4891 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4890
%struct_info = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp4891, %m1772$.Type.type** %struct_info
br label %.for.start.4892
.for.start.4892:
%.tmp4893 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp4894 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4893, i32 0, i32 3
%.tmp4895 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4894
%.tmp4896 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4895, i32 0, i32 0
%.tmp4897 = load i8*, i8** %.tmp4896
%.tmp4899 = getelementptr [4 x i8], [4 x i8]*@.str4898, i32 0, i32 0
%.tmp4900 = call i32(i8*,i8*) @strcmp(i8* %.tmp4897, i8* %.tmp4899)
%.tmp4901 = icmp eq i32 %.tmp4900, 0
br i1 %.tmp4901, label %.for.continue.4892, label %.for.end.4892
.for.continue.4892:
%.tmp4902 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4903 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4902)
%new_base = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp4903, %m1772$.AssignableInfo.type** %new_base
%.tmp4904 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4905 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp4904, %m1772$.AssignableInfo.type* %.tmp4905)
%.tmp4906 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
%.tmp4907 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4906, i32 0, i32 3
%.tmp4908 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp4909 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4908, i32 0, i32 3
%.tmp4910 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4909
%.tmp4911 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4910, i32 0, i32 3
%.tmp4912 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4911
store %m1772$.Type.type* %.tmp4912, %m1772$.Type.type** %.tmp4907
%.tmp4913 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4914 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp4913, i32 0, i32 1
%.tmp4915 = load %m0$.File.type*, %m0$.File.type** %.tmp4914
%.tmp4917 = getelementptr [23 x i8], [23 x i8]*@.str4916, i32 0, i32 0
%.tmp4918 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
%.tmp4919 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4918)
%.tmp4920 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4921 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
%.tmp4922 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4921, i32 0, i32 3
%.tmp4923 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4922
%.tmp4924 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4920, %m1772$.Type.type* %.tmp4923)
%.tmp4925 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4926 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp4927 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp4926, i32 0, i32 3
%.tmp4928 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4927
%.tmp4929 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp4925, %m1772$.Type.type* %.tmp4928)
%.tmp4930 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp4931 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp4930)
%.tmp4932 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4915, i8* %.tmp4917, i8* %.tmp4919, i8* %.tmp4924, i8* %.tmp4929, i8* %.tmp4931)
%.tmp4933 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
store %m1772$.AssignableInfo.type* %.tmp4933, %m1772$.AssignableInfo.type** %base_var
%.tmp4934 = load %m1772$.Type.type*, %m1772$.Type.type** %struct_info
%.tmp4935 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4934, i32 0, i32 3
%.tmp4936 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4935
store %m1772$.Type.type* %.tmp4936, %m1772$.Type.type** %struct_info
br label %.for.start.4892
.for.end.4892:
%.tmp4937 = load %m1772$.Type.type*, %m1772$.Type.type** %struct_info
%.tmp4938 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4937, i32 0, i32 0
%.tmp4939 = load i8*, i8** %.tmp4938
%.tmp4941 = getelementptr [10 x i8], [10 x i8]*@.str4940, i32 0, i32 0
%.tmp4942 = call i32(i8*,i8*) @strcmp(i8* %.tmp4939, i8* %.tmp4941)
%.tmp4943 = icmp eq i32 %.tmp4942, 0
br i1 %.tmp4943, label %.if.true.4944, label %.if.false.4944
.if.true.4944:
%.tmp4945 = load %m1772$.Type.type*, %m1772$.Type.type** %struct_info
%.tmp4946 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4945, i32 0, i32 3
%.tmp4947 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4946
store %m1772$.Type.type* %.tmp4947, %m1772$.Type.type** %struct_info
br label %.if.end.4944
.if.false.4944:
br label %.if.end.4944
.if.end.4944:
%.tmp4948 = load %m1772$.Type.type*, %m1772$.Type.type** %struct_info
%.tmp4949 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4948, i32 0, i32 0
%.tmp4950 = load i8*, i8** %.tmp4949
%.tmp4952 = getelementptr [7 x i8], [7 x i8]*@.str4951, i32 0, i32 0
%.tmp4953 = call i32(i8*,i8*) @strcmp(i8* %.tmp4950, i8* %.tmp4952)
%.tmp4954 = icmp ne i32 %.tmp4953, 0
br i1 %.tmp4954, label %.if.true.4955, label %.if.false.4955
.if.true.4955:
%.tmp4956 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4958 = getelementptr [48 x i8], [48 x i8]*@.str4957, i32 0, i32 0
%.tmp4959 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4960 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4959, i32 0, i32 7
%.tmp4961 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4960
%.tmp4962 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4961, i32 0, i32 7
%.tmp4963 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4962
%.tmp4964 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4963, i32 0, i32 1
%.tmp4965 = load i8*, i8** %.tmp4964
%.tmp4966 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4967 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4966, i32 0, i32 1
%.tmp4968 = load i8*, i8** %.tmp4967
%.tmp4969 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4956, i8* %.tmp4958, i8* %.tmp4965, i8* %.tmp4968)
%.tmp4970 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp4971 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4972 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp4970, %m286$.Node.type* %.tmp4971, i8* %.tmp4972)
%.tmp4973 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp4973
br label %.if.end.4955
.if.false.4955:
br label %.if.end.4955
.if.end.4955:
%.tmp4974 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4975 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4974, i32 0, i32 7
%.tmp4976 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4975
%.tmp4977 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4976, i32 0, i32 7
%.tmp4978 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4977
%.tmp4979 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4978, i32 0, i32 1
%.tmp4980 = load i8*, i8** %.tmp4979
%field_name = alloca i8*
store i8* %.tmp4980, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp4981 = bitcast ptr null to %m1772$.Type.type*
%found_field = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp4981, %m1772$.Type.type** %found_field
%.tmp4983 = load %m1772$.Type.type*, %m1772$.Type.type** %struct_info
%.tmp4984 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4983, i32 0, i32 3
%.tmp4985 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp4984
%field = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp4985, %m1772$.Type.type** %field
br label %.for.start.4982
.for.start.4982:
%.tmp4986 = load i1, i1* %quit
%.tmp4987 = icmp eq i1 %.tmp4986, 0
br i1 %.tmp4987, label %.for.continue.4982, label %.for.end.4982
.for.continue.4982:
%.tmp4988 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp4989 = icmp eq %m1772$.Type.type* %.tmp4988, null
br i1 %.tmp4989, label %.if.true.4990, label %.if.false.4990
.if.true.4990:
store i1 1, i1* %quit
br label %.if.end.4990
.if.false.4990:
%.tmp4991 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp4992 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp4991, i32 0, i32 1
%.tmp4993 = load i8*, i8** %.tmp4992
%.tmp4994 = load i8*, i8** %field_name
%.tmp4995 = call i32(i8*,i8*) @strcmp(i8* %.tmp4993, i8* %.tmp4994)
%.tmp4996 = icmp eq i32 %.tmp4995, 0
br i1 %.tmp4996, label %.if.true.4997, label %.if.false.4997
.if.true.4997:
store i1 1, i1* %quit
%.tmp4998 = load %m1772$.Type.type*, %m1772$.Type.type** %field
store %m1772$.Type.type* %.tmp4998, %m1772$.Type.type** %found_field
br label %.if.end.4997
.if.false.4997:
%.tmp4999 = load i32, i32* %field_id
%.tmp5000 = add i32 %.tmp4999, 1
store i32 %.tmp5000, i32* %field_id
br label %.if.end.4997
.if.end.4997:
br label %.if.end.4990
.if.end.4990:
%.tmp5001 = load %m1772$.Type.type*, %m1772$.Type.type** %field
%.tmp5002 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5001, i32 0, i32 4
%.tmp5003 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5002
store %m1772$.Type.type* %.tmp5003, %m1772$.Type.type** %field
br label %.for.start.4982
.for.end.4982:
%.tmp5004 = load %m1772$.Type.type*, %m1772$.Type.type** %found_field
%.tmp5005 = icmp eq %m1772$.Type.type* %.tmp5004, null
br i1 %.tmp5005, label %.if.true.5006, label %.if.false.5006
.if.true.5006:
%.tmp5007 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5009 = getelementptr [34 x i8], [34 x i8]*@.str5008, i32 0, i32 0
%.tmp5010 = load i8*, i8** %field_name
%.tmp5011 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5012 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5011, i32 0, i32 1
%.tmp5013 = load i8*, i8** %.tmp5012
%.tmp5014 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5007, i8* %.tmp5009, i8* %.tmp5010, i8* %.tmp5013)
%.tmp5015 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5016 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5017 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5015, %m286$.Node.type* %.tmp5016, i8* %.tmp5017)
%.tmp5018 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp5018
br label %.if.end.5006
.if.false.5006:
br label %.if.end.5006
.if.end.5006:
%.tmp5019 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5020 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5019)
%new_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5020, %m1772$.AssignableInfo.type** %new_info
%.tmp5021 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_info
%.tmp5022 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5021, i32 0, i32 3
%.tmp5023 = load %m1772$.Type.type*, %m1772$.Type.type** %found_field
store %m1772$.Type.type* %.tmp5023, %m1772$.Type.type** %.tmp5022
%.tmp5024 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5025 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5024, %m1772$.AssignableInfo.type* %.tmp5025)
%.tmp5026 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_info
%.tmp5027 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5026, i32 0, i32 2
%.tmp5029 = getelementptr [9 x i8], [9 x i8]*@.str5028, i32 0, i32 0
store i8* %.tmp5029, i8** %.tmp5027
%.tmp5030 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5031 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp5032 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5031, i32 0, i32 3
%.tmp5033 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5032
%.tmp5034 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5030, %m1772$.Type.type* %.tmp5033)
%info_tr = alloca i8*
store i8* %.tmp5034, i8** %info_tr
%.tmp5035 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5036 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5035, i32 0, i32 1
%.tmp5037 = load %m0$.File.type*, %m0$.File.type** %.tmp5036
%.tmp5039 = getelementptr [46 x i8], [46 x i8]*@.str5038, i32 0, i32 0
%.tmp5040 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_info
%.tmp5041 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5040)
%.tmp5042 = load i8*, i8** %info_tr
%.tmp5043 = load i8*, i8** %info_tr
%.tmp5044 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base_var
%.tmp5045 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5044)
%.tmp5046 = load i32, i32* %field_id
%.tmp5047 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5037, i8* %.tmp5039, i8* %.tmp5041, i8* %.tmp5042, i8* %.tmp5043, i8* %.tmp5045, i32 %.tmp5046)
%.tmp5048 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5049 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5049, i32 0, i32 7
%.tmp5051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5050
%.tmp5052 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5051, i32 0, i32 7
%.tmp5053 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5052
%.tmp5054 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_info
%.tmp5055 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,%m1772$.AssignableInfo.type*) @m1772$get_dotted_name.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5048, %m286$.Node.type* %.tmp5053, %m1772$.AssignableInfo.type* %.tmp5054)
ret %m1772$.AssignableInfo.type* %.tmp5055
br label %.if.end.4887
.if.false.4887:
%.tmp5056 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5057 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5056, i32 0, i32 2
%.tmp5058 = load i8*, i8** %.tmp5057
%.tmp5060 = getelementptr [9 x i8], [9 x i8]*@.str5059, i32 0, i32 0
%.tmp5061 = call i32(i8*,i8*) @strcmp(i8* %.tmp5058, i8* %.tmp5060)
%.tmp5062 = icmp eq i32 %.tmp5061, 0
br i1 %.tmp5062, label %.if.true.5063, label %.if.false.5063
.if.true.5063:
%.tmp5064 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp5064
br label %.if.end.5063
.if.false.5063:
br label %.if.end.5063
.if.end.5063:
br label %.if.end.4887
.if.end.4887:
br label %.if.end.4850
.if.end.4850:
%.tmp5065 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5066 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp5068 = getelementptr [43 x i8], [43 x i8]*@.str5067, i32 0, i32 0
%.tmp5069 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5065, %m286$.Node.type* %.tmp5066, i8* %.tmp5068)
%.tmp5070 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5071 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5070, i32 0, i32 2
%.tmp5072 = load i8*, i8** %.tmp5071
%.tmp5073 = call i32(i8*,...) @printf(i8* %.tmp5069, i8* %.tmp5072)
%.tmp5074 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp5074
}
define %m1772$.AssignableInfo.type* @m1772$compile_addr.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp5075 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5075, %m286$.Node.type** %curr_node
%.tmp5076 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5077 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5076, i32 0, i32 0
%.tmp5078 = load i8*, i8** %.tmp5077
%.tmp5080 = getelementptr [12 x i8], [12 x i8]*@.str5079, i32 0, i32 0
%.tmp5081 = call i32(i8*,i8*) @strcmp(i8* %.tmp5078, i8* %.tmp5080)
%.tmp5082 = icmp ne i32 %.tmp5081, 0
br i1 %.tmp5082, label %.if.true.5083, label %.if.false.5083
.if.true.5083:
%.tmp5085 = getelementptr [92 x i8], [92 x i8]*@.str5084, i32 0, i32 0
%.tmp5086 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5087 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5086, i32 0, i32 0
%.tmp5088 = load i8*, i8** %.tmp5087
%.tmp5089 = call i32(i8*,...) @printf(i8* %.tmp5085, i8* %.tmp5088)
%.tmp5090 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp5091 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5090, i32 0, i32 6
%.tmp5092 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5091
store %m286$.Node.type* %.tmp5092, %m286$.Node.type** %curr_node
br label %.if.end.5083
.if.false.5083:
br label %.if.end.5083
.if.end.5083:
%.tmp5093 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5094 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5093, i32 0, i32 6
%.tmp5095 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5094
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5095, %m286$.Node.type** %assignable_name
%.tmp5096 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5097 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5098 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5097, i32 0, i32 6
%.tmp5099 = load i8*, i8** %.tmp5098
%.tmp5100 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5101 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5100, i32 0, i32 6
%.tmp5102 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5101
%.tmp5103 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5102, i32 0, i32 1
%.tmp5104 = load i8*, i8** %.tmp5103
%.tmp5105 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,i8*,i8*) @m1772$find_defined_str.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.cp(%m1772$.CompilerCtx.type* %.tmp5096, i8* %.tmp5099, i8* %.tmp5104)
%scope_info = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp5105, %m1772$.ScopeItem.type** %scope_info
%.tmp5106 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %scope_info
%.tmp5107 = icmp eq %m1772$.ScopeItem.type* %.tmp5106, null
br i1 %.tmp5107, label %.if.true.5108, label %.if.false.5108
.if.true.5108:
%.tmp5109 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5111 = getelementptr [25 x i8], [25 x i8]*@.str5110, i32 0, i32 0
%.tmp5112 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5113 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5112, i32 0, i32 6
%.tmp5114 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5113
%.tmp5115 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5114, i32 0, i32 1
%.tmp5116 = load i8*, i8** %.tmp5115
%.tmp5117 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5109, i8* %.tmp5111, i8* %.tmp5116)
%.tmp5118 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5119 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5120 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5118, %m286$.Node.type* %.tmp5119, i8* %.tmp5120)
%.tmp5121 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp5121
br label %.if.end.5108
.if.false.5108:
br label %.if.end.5108
.if.end.5108:
%.tmp5122 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %scope_info
%.tmp5123 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp5122, i32 0, i32 1
%.tmp5124 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp5123
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5124, %m1772$.AssignableInfo.type** %info
%.tmp5125 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5126 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5125, i32 0, i32 2
%.tmp5127 = load i8*, i8** %.tmp5126
%.tmp5129 = getelementptr [7 x i8], [7 x i8]*@.str5128, i32 0, i32 0
%.tmp5130 = call i32(i8*,i8*) @strcmp(i8* %.tmp5127, i8* %.tmp5129)
%.tmp5131 = icmp eq i32 %.tmp5130, 0
br i1 %.tmp5131, label %.if.true.5132, label %.if.false.5132
.if.true.5132:
%.tmp5133 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5134 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5135 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5134)
%.tmp5136 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5137 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5136, i32 0, i32 6
%.tmp5138 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5137
%.tmp5139 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5138, i32 0, i32 7
%.tmp5140 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5139
%.tmp5141 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5140, i32 0, i32 7
%.tmp5142 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5141
%.tmp5143 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5142, i32 0, i32 1
%.tmp5144 = load i8*, i8** %.tmp5143
%.tmp5145 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,i8*,i8*) @m1772$find_defined_str.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.cp.cp(%m1772$.CompilerCtx.type* %.tmp5133, i8* %.tmp5135, i8* %.tmp5144)
store %m1772$.ScopeItem.type* %.tmp5145, %m1772$.ScopeItem.type** %scope_info
%.tmp5146 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %scope_info
%.tmp5147 = icmp eq %m1772$.ScopeItem.type* %.tmp5146, null
br i1 %.tmp5147, label %.if.true.5148, label %.if.false.5148
.if.true.5148:
%.tmp5149 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5151 = getelementptr [31 x i8], [31 x i8]*@.str5150, i32 0, i32 0
%.tmp5152 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5153 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5152, i32 0, i32 6
%.tmp5154 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5153
%.tmp5155 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5154, i32 0, i32 7
%.tmp5156 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5155
%.tmp5157 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5156, i32 0, i32 7
%.tmp5158 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5157
%.tmp5159 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5158, i32 0, i32 1
%.tmp5160 = load i8*, i8** %.tmp5159
%.tmp5161 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5162 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5161)
%.tmp5163 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5149, i8* %.tmp5151, i8* %.tmp5160, i8* %.tmp5162)
%.tmp5164 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5165 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5166 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5164, %m286$.Node.type* %.tmp5165, i8* %.tmp5166)
%.tmp5167 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp5167
br label %.if.end.5148
.if.false.5148:
br label %.if.end.5148
.if.end.5148:
%.tmp5168 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %scope_info
%.tmp5169 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp5168, i32 0, i32 1
%.tmp5170 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp5169
store %m1772$.AssignableInfo.type* %.tmp5170, %m1772$.AssignableInfo.type** %info
%.tmp5171 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5172 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5171, i32 0, i32 6
%.tmp5173 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5172
%.tmp5174 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5173, i32 0, i32 7
%.tmp5175 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5174
%.tmp5176 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5175, i32 0, i32 7
%.tmp5177 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5176
store %m286$.Node.type* %.tmp5177, %m286$.Node.type** %assignable_name
br label %.if.end.5132
.if.false.5132:
%.tmp5178 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5179 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5178, i32 0, i32 6
%.tmp5180 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5179
store %m286$.Node.type* %.tmp5180, %m286$.Node.type** %assignable_name
br label %.if.end.5132
.if.end.5132:
%.tmp5181 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5182 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5183 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5184 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,%m1772$.AssignableInfo.type*) @m1772$get_dotted_name.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5181, %m286$.Node.type* %.tmp5182, %m1772$.AssignableInfo.type* %.tmp5183)
%base = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5184, %m1772$.AssignableInfo.type** %base
%.tmp5186 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5187 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5186, i32 0, i32 6
%.tmp5188 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5187
%.tmp5189 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5188, i32 0, i32 7
%.tmp5190 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5189
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5190, %m286$.Node.type** %addr
br label %.for.start.5185
.for.start.5185:
%.tmp5191 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5192 = icmp ne %m286$.Node.type* %.tmp5191, null
br i1 %.tmp5192, label %.for.continue.5185, label %.for.end.5185
.for.continue.5185:
%.tmp5193 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5194 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5193, i32 0, i32 7
%.tmp5195 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5194
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5195, %m286$.Node.type** %index
%.tmp5196 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5197 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp5198 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp5196, %m286$.Node.type* %.tmp5197)
%index_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5198, %m1772$.AssignableInfo.type** %index_info
%.tmp5199 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5200 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base
%.tmp5201 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5200, i32 0, i32 3
%.tmp5202 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5201
%.tmp5203 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5199, %m1772$.Type.type* %.tmp5202)
%base_type = alloca i8*
store i8* %.tmp5203, i8** %base_type
%.tmp5204 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5205 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %index_info
%.tmp5206 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5205, i32 0, i32 3
%.tmp5207 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5206
%.tmp5208 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5204, %m1772$.Type.type* %.tmp5207)
%index_type = alloca i8*
store i8* %.tmp5208, i8** %index_type
%.tmp5209 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5210 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp5209)
%tmp_id = alloca i32
store i32 %.tmp5210, i32* %tmp_id
%.tmp5211 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5212 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5211, i32 0, i32 1
%.tmp5213 = load %m0$.File.type*, %m0$.File.type** %.tmp5212
%.tmp5215 = getelementptr [28 x i8], [28 x i8]*@.str5214, i32 0, i32 0
%.tmp5216 = load i32, i32* %tmp_id
%.tmp5217 = load i8*, i8** %base_type
%.tmp5218 = load i8*, i8** %base_type
%.tmp5219 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base
%.tmp5220 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5219)
%.tmp5221 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5213, i8* %.tmp5215, i32 %.tmp5216, i8* %.tmp5217, i8* %.tmp5218, i8* %.tmp5220)
%.tmp5222 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5223 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5222)
%new_base = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5223, %m1772$.AssignableInfo.type** %new_base
%.tmp5224 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5225 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5224, %m1772$.AssignableInfo.type* %.tmp5225)
%.tmp5226 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base
%.tmp5227 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5226, i32 0, i32 3
%.tmp5228 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5227
%.tmp5229 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5228, i32 0, i32 3
%.tmp5230 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5229
%.tmp5231 = icmp eq %m1772$.Type.type* %.tmp5230, null
br i1 %.tmp5231, label %.if.true.5232, label %.if.false.5232
.if.true.5232:
%.tmp5233 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5235 = getelementptr [35 x i8], [35 x i8]*@.str5234, i32 0, i32 0
%.tmp5236 = load i8*, i8** %base_type
%.tmp5237 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5233, i8* %.tmp5235, i8* %.tmp5236)
%.tmp5238 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5239 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5240 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5238, %m286$.Node.type* %.tmp5239, i8* %.tmp5240)
%.tmp5241 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base
ret %m1772$.AssignableInfo.type* %.tmp5241
br label %.if.end.5232
.if.false.5232:
br label %.if.end.5232
.if.end.5232:
%.tmp5242 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
%.tmp5243 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5242, i32 0, i32 3
%.tmp5244 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base
%.tmp5245 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5244, i32 0, i32 3
%.tmp5246 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5245
%.tmp5247 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5246, i32 0, i32 3
%.tmp5248 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5247
store %m1772$.Type.type* %.tmp5248, %m1772$.Type.type** %.tmp5243
%.tmp5249 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5250 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
%.tmp5251 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5250, i32 0, i32 3
%.tmp5252 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5251
%.tmp5253 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5249, %m1772$.Type.type* %.tmp5252)
%base_type_2 = alloca i8*
store i8* %.tmp5253, i8** %base_type_2
%.tmp5254 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5255 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5254, i32 0, i32 1
%.tmp5256 = load %m0$.File.type*, %m0$.File.type** %.tmp5255
%.tmp5258 = getelementptr [44 x i8], [44 x i8]*@.str5257, i32 0, i32 0
%.tmp5259 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
%.tmp5260 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5259)
%.tmp5261 = load i8*, i8** %base_type_2
%.tmp5262 = load i8*, i8** %base_type_2
%.tmp5263 = load i32, i32* %tmp_id
%.tmp5264 = load i8*, i8** %index_type
%.tmp5265 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %index_info
%.tmp5266 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5265)
%.tmp5267 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5256, i8* %.tmp5258, i8* %.tmp5260, i8* %.tmp5261, i8* %.tmp5262, i32 %.tmp5263, i8* %.tmp5264, i8* %.tmp5266)
%.tmp5268 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %new_base
store %m1772$.AssignableInfo.type* %.tmp5268, %m1772$.AssignableInfo.type** %base
%.tmp5269 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5270 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5269, i32 0, i32 7
%.tmp5271 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5270
%.tmp5272 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5271, i32 0, i32 7
%.tmp5273 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5272
%.tmp5274 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5273, i32 0, i32 7
%.tmp5275 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5274
store %m286$.Node.type* %.tmp5275, %m286$.Node.type** %addr
br label %.for.start.5185
.for.end.5185:
%.tmp5276 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %base
ret %m1772$.AssignableInfo.type* %.tmp5276
}
%m1772$.StackHead.type = type {%m1893$.SYStack.type*}
define %m1772$.AssignableInfo.type* @m1772$compile_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5277 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5278 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5277, i32 0, i32 6
%.tmp5279 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5278
%.tmp5281 = getelementptr [16 x i8], [16 x i8]*@.str5280, i32 0, i32 0
%.tmp5282 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5279, i8* %.tmp5281)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5282, %m286$.Node.type** %assignable_start
%.tmp5283 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp5284 = call %m1893$.SYStack.type*(%m286$.Node.type*) @m1893$sy_algorithm.m1893$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5283)
%operator_stack = alloca %m1893$.SYStack.type*
store %m1893$.SYStack.type* %.tmp5284, %m1893$.SYStack.type** %operator_stack
%.tmp5285 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* null, i32 1
%.tmp5286 = ptrtoint %m1772$.StackHead.type* %.tmp5285 to i32
%.tmp5287 = call i8*(i32) @malloc(i32 %.tmp5286)
%.tmp5288 = bitcast i8* %.tmp5287 to %m1772$.StackHead.type*
%stack = alloca %m1772$.StackHead.type*
store %m1772$.StackHead.type* %.tmp5288, %m1772$.StackHead.type** %stack
%.tmp5289 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5290 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5289, i32 0, i32 0
%.tmp5291 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %operator_stack
store %m1893$.SYStack.type* %.tmp5291, %m1893$.SYStack.type** %.tmp5290
%.tmp5292 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5293 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5294 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m1772$.StackHead.type*) @m1772$compile_assignable_stack.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m1772$.StackHead.typep(%m1772$.CompilerCtx.type* %.tmp5292, %m1772$.StackHead.type* %.tmp5293)
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5294, %m1772$.AssignableInfo.type** %info
%.tmp5295 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5296 = icmp eq %m1772$.AssignableInfo.type* %.tmp5295, null
br i1 %.tmp5296, label %.if.true.5297, label %.if.false.5297
.if.true.5297:
%.tmp5298 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp5298
br label %.if.end.5297
.if.false.5297:
br label %.if.end.5297
.if.end.5297:
%.tmp5299 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5300 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5299, i32 0, i32 6
%.tmp5301 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5300
%.tmp5303 = getelementptr [5 x i8], [5 x i8]*@.str5302, i32 0, i32 0
%.tmp5304 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5301, i8* %.tmp5303)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5304, %m286$.Node.type** %cast
%.tmp5305 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5306 = icmp ne %m286$.Node.type* %.tmp5305, null
br i1 %.tmp5306, label %.if.true.5307, label %.if.false.5307
.if.true.5307:
%.tmp5308 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5309 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5308, i32 0, i32 6
%.tmp5310 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5309
%.tmp5312 = getelementptr [5 x i8], [5 x i8]*@.str5311, i32 0, i32 0
%.tmp5313 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5310, i8* %.tmp5312)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5313, %m286$.Node.type** %cast_type
%.tmp5314 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5315 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5316 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5315, i32 0, i32 6
%.tmp5317 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5316
%.tmp5318 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp5314, %m286$.Node.type* %.tmp5317)
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp5318, %m1772$.Type.type** %type
%.tmp5319 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5320 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5319)
%prev_id = alloca i8*
store i8* %.tmp5320, i8** %prev_id
%.tmp5321 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5322 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5321, %m1772$.AssignableInfo.type* %.tmp5322)
%.tmp5323 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5324 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5325 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5324, i32 0, i32 3
%.tmp5326 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5325
%.tmp5327 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5323, %m1772$.Type.type* %.tmp5326)
%from_type = alloca i8*
store i8* %.tmp5327, i8** %from_type
%.tmp5328 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5329 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp5330 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5328, %m1772$.Type.type* %.tmp5329)
%to_type = alloca i8*
store i8* %.tmp5330, i8** %to_type
%.tmp5332 = getelementptr [8 x i8], [8 x i8]*@.str5331, i32 0, i32 0
%cast_fn = alloca i8*
store i8* %.tmp5332, i8** %cast_fn
%.tmp5333 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5334 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5333, i32 0, i32 3
%.tmp5335 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5334
%.tmp5336 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5335, i32 0, i32 0
%.tmp5337 = load i8*, i8** %.tmp5336
%.tmp5339 = getelementptr [4 x i8], [4 x i8]*@.str5338, i32 0, i32 0
%.tmp5340 = call i32(i8*,i8*) @strcmp(i8* %.tmp5337, i8* %.tmp5339)
%.tmp5341 = icmp ne i32 %.tmp5340, 0
%.tmp5342 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp5343 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5342, i32 0, i32 0
%.tmp5344 = load i8*, i8** %.tmp5343
%.tmp5346 = getelementptr [4 x i8], [4 x i8]*@.str5345, i32 0, i32 0
%.tmp5347 = call i32(i8*,i8*) @strcmp(i8* %.tmp5344, i8* %.tmp5346)
%.tmp5348 = icmp ne i32 %.tmp5347, 0
%.tmp5349 = and i1 %.tmp5341, %.tmp5348
br i1 %.tmp5349, label %.if.true.5350, label %.if.false.5350
.if.true.5350:
%.tmp5351 = load i8*, i8** %from_type
%.tmp5352 = getelementptr i8, i8* %.tmp5351, i32 0
%.tmp5353 = load i8, i8* %.tmp5352
%.tmp5354 = icmp eq i8 %.tmp5353, 105
%.tmp5355 = load i8*, i8** %to_type
%.tmp5356 = getelementptr i8, i8* %.tmp5355, i32 0
%.tmp5357 = load i8, i8* %.tmp5356
%.tmp5358 = icmp eq i8 %.tmp5357, 105
%.tmp5359 = and i1 %.tmp5354, %.tmp5358
br i1 %.tmp5359, label %.if.true.5360, label %.if.false.5360
.if.true.5360:
%from_size = alloca i32
%to_size = alloca i32
%.tmp5361 = load i8*, i8** %from_type
%.tmp5363 = getelementptr [4 x i8], [4 x i8]*@.str5362, i32 0, i32 0
%.tmp5364 = getelementptr i32, i32* %from_size, i32 0
%.tmp5365 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5361, i8* %.tmp5363, i32* %.tmp5364)
%.tmp5366 = load i8*, i8** %to_type
%.tmp5368 = getelementptr [4 x i8], [4 x i8]*@.str5367, i32 0, i32 0
%.tmp5369 = getelementptr i32, i32* %to_size, i32 0
%.tmp5370 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5366, i8* %.tmp5368, i32* %.tmp5369)
%.tmp5371 = load i32, i32* %from_size
%.tmp5372 = load i32, i32* %to_size
%.tmp5373 = icmp slt i32 %.tmp5371, %.tmp5372
br i1 %.tmp5373, label %.if.true.5374, label %.if.false.5374
.if.true.5374:
%.tmp5376 = getelementptr [5 x i8], [5 x i8]*@.str5375, i32 0, i32 0
store i8* %.tmp5376, i8** %cast_fn
br label %.if.end.5374
.if.false.5374:
%.tmp5378 = getelementptr [6 x i8], [6 x i8]*@.str5377, i32 0, i32 0
store i8* %.tmp5378, i8** %cast_fn
br label %.if.end.5374
.if.end.5374:
br label %.if.end.5360
.if.false.5360:
br label %.if.end.5360
.if.end.5360:
br label %.if.end.5350
.if.false.5350:
br label %.if.end.5350
.if.end.5350:
%.tmp5379 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5380 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5379, i32 0, i32 1
%.tmp5381 = load %m0$.File.type*, %m0$.File.type** %.tmp5380
%.tmp5383 = getelementptr [21 x i8], [21 x i8]*@.str5382, i32 0, i32 0
%.tmp5384 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5385 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5384)
%.tmp5386 = load i8*, i8** %cast_fn
%.tmp5387 = load i8*, i8** %from_type
%.tmp5388 = load i8*, i8** %prev_id
%.tmp5389 = load i8*, i8** %to_type
%.tmp5390 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5381, i8* %.tmp5383, i8* %.tmp5385, i8* %.tmp5386, i8* %.tmp5387, i8* %.tmp5388, i8* %.tmp5389)
%.tmp5391 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp5392 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5391, i32 0, i32 3
%.tmp5393 = load %m1772$.Type.type*, %m1772$.Type.type** %type
store %m1772$.Type.type* %.tmp5393, %m1772$.Type.type** %.tmp5392
br label %.if.end.5307
.if.false.5307:
br label %.if.end.5307
.if.end.5307:
%.tmp5394 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp5394
}
define %m1772$.AssignableInfo.type* @m1772$compile_assignable_stack.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m1772$.StackHead.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stack = alloca %m1772$.StackHead.type*
store %m1772$.StackHead.type* %.stack.arg, %m1772$.StackHead.type** %stack
%.tmp5395 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5396 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5395, i32 0, i32 0
%.tmp5397 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5396
%.tmp5398 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp5397, i32 0, i32 0
%.tmp5399 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5398
%.tmp5400 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5399, i32 0, i32 0
%.tmp5401 = load i8*, i8** %.tmp5400
%.tmp5403 = getelementptr [16 x i8], [16 x i8]*@.str5402, i32 0, i32 0
%.tmp5404 = call i32(i8*,i8*) @strcmp(i8* %.tmp5401, i8* %.tmp5403)
%.tmp5405 = icmp eq i32 %.tmp5404, 0
br i1 %.tmp5405, label %.if.true.5406, label %.if.false.5406
.if.true.5406:
%.tmp5407 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5408 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5409 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5408, i32 0, i32 0
%.tmp5410 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5409
%.tmp5411 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp5410, i32 0, i32 0
%.tmp5412 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5411
%.tmp5413 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_mono_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp5407, %m286$.Node.type* %.tmp5412)
ret %m1772$.AssignableInfo.type* %.tmp5413
br label %.if.end.5406
.if.false.5406:
br label %.if.end.5406
.if.end.5406:
%.tmp5414 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5415 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5414, i32 0, i32 0
%.tmp5416 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5415
%.tmp5417 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp5416, i32 0, i32 0
%.tmp5418 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5417
%.tmp5419 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5418, i32 0, i32 6
%.tmp5420 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5419
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5420, %m286$.Node.type** %operator
%.tmp5421 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5422 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5421, i32 0, i32 0
%.tmp5423 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5424 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5423, i32 0, i32 0
%.tmp5425 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5424
%.tmp5426 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp5425, i32 0, i32 1
%.tmp5427 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5426
store %m1893$.SYStack.type* %.tmp5427, %m1893$.SYStack.type** %.tmp5422
%.tmp5428 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5429 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5430 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m1772$.StackHead.type*) @m1772$compile_assignable_stack.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m1772$.StackHead.typep(%m1772$.CompilerCtx.type* %.tmp5428, %m1772$.StackHead.type* %.tmp5429)
%A = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5430, %m1772$.AssignableInfo.type** %A
%.tmp5431 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %A
%.tmp5432 = icmp eq %m1772$.AssignableInfo.type* %.tmp5431, null
br i1 %.tmp5432, label %.if.true.5433, label %.if.false.5433
.if.true.5433:
%.tmp5434 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %A
ret %m1772$.AssignableInfo.type* %.tmp5434
br label %.if.end.5433
.if.false.5433:
br label %.if.end.5433
.if.end.5433:
%.tmp5435 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5436 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5435, i32 0, i32 0
%.tmp5437 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5438 = getelementptr %m1772$.StackHead.type, %m1772$.StackHead.type* %.tmp5437, i32 0, i32 0
%.tmp5439 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5438
%.tmp5440 = getelementptr %m1893$.SYStack.type, %m1893$.SYStack.type* %.tmp5439, i32 0, i32 1
%.tmp5441 = load %m1893$.SYStack.type*, %m1893$.SYStack.type** %.tmp5440
store %m1893$.SYStack.type* %.tmp5441, %m1893$.SYStack.type** %.tmp5436
%.tmp5442 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5443 = load %m1772$.StackHead.type*, %m1772$.StackHead.type** %stack
%.tmp5444 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m1772$.StackHead.type*) @m1772$compile_assignable_stack.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m1772$.StackHead.typep(%m1772$.CompilerCtx.type* %.tmp5442, %m1772$.StackHead.type* %.tmp5443)
%B = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5444, %m1772$.AssignableInfo.type** %B
%.tmp5445 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %B
%.tmp5446 = icmp eq %m1772$.AssignableInfo.type* %.tmp5445, null
br i1 %.tmp5446, label %.if.true.5447, label %.if.false.5447
.if.true.5447:
%.tmp5448 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %B
ret %m1772$.AssignableInfo.type* %.tmp5448
br label %.if.end.5447
.if.false.5447:
br label %.if.end.5447
.if.end.5447:
%.tmp5449 = bitcast ptr null to %m286$.Node.type*
%.tmp5450 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5449)
%op_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5450, %m1772$.AssignableInfo.type** %op_info
%.tmp5451 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %op_info
%.tmp5452 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5451, i32 0, i32 3
%.tmp5453 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5454 = call %m1772$.Type.type*(%m286$.Node.type*) @m1772$operator_type.m1772$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5453)
store %m1772$.Type.type* %.tmp5454, %m1772$.Type.type** %.tmp5452
%.tmp5455 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5456 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %op_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5455, %m1772$.AssignableInfo.type* %.tmp5456)
%.tmp5457 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5458 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5457, i32 0, i32 1
%.tmp5459 = load %m0$.File.type*, %m0$.File.type** %.tmp5458
%.tmp5461 = getelementptr [19 x i8], [19 x i8]*@.str5460, i32 0, i32 0
%.tmp5462 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %op_info
%.tmp5463 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5462)
%.tmp5464 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5465 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5466 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$operator_op.cp.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp5464, %m286$.Node.type* %.tmp5465)
%.tmp5467 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5468 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %A
%.tmp5469 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5468, i32 0, i32 3
%.tmp5470 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5469
%.tmp5471 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5467, %m1772$.Type.type* %.tmp5470)
%.tmp5472 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %A
%.tmp5473 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5472)
%.tmp5474 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %B
%.tmp5475 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5474)
%.tmp5476 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5459, i8* %.tmp5461, i8* %.tmp5463, i8* %.tmp5466, i8* %.tmp5471, i8* %.tmp5473, i8* %.tmp5475)
%.tmp5477 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %op_info
ret %m1772$.AssignableInfo.type* %.tmp5477
}
define i8* @m1772$operator_op.cp.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5478 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5479 = icmp eq %m286$.Node.type* %.tmp5478, null
br i1 %.tmp5479, label %.if.true.5480, label %.if.false.5480
.if.true.5480:
%.tmp5481 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5482 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5484 = getelementptr [31 x i8], [31 x i8]*@.str5483, i32 0, i32 0
%.tmp5485 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5481, %m286$.Node.type* %.tmp5482, i8* %.tmp5484)
%.tmp5486 = call i32(i8*,...) @printf(i8* %.tmp5485)
br label %.if.end.5480
.if.false.5480:
br label %.if.end.5480
.if.end.5480:
%.tmp5487 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5488 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5487, i32 0, i32 1
%.tmp5489 = load i8*, i8** %.tmp5488
%.tmp5491 = getelementptr [2 x i8], [2 x i8]*@.str5490, i32 0, i32 0
%.tmp5492 = call i32(i8*,i8*) @strcmp(i8* %.tmp5489, i8* %.tmp5491)
%.tmp5493 = icmp eq i32 %.tmp5492, 0
br i1 %.tmp5493, label %.if.true.5494, label %.if.false.5494
.if.true.5494:
%.tmp5496 = getelementptr [4 x i8], [4 x i8]*@.str5495, i32 0, i32 0
ret i8* %.tmp5496
br label %.if.end.5494
.if.false.5494:
%.tmp5497 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5498 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5497, i32 0, i32 1
%.tmp5499 = load i8*, i8** %.tmp5498
%.tmp5501 = getelementptr [2 x i8], [2 x i8]*@.str5500, i32 0, i32 0
%.tmp5502 = call i32(i8*,i8*) @strcmp(i8* %.tmp5499, i8* %.tmp5501)
%.tmp5503 = icmp eq i32 %.tmp5502, 0
br i1 %.tmp5503, label %.if.true.5504, label %.if.false.5504
.if.true.5504:
%.tmp5506 = getelementptr [4 x i8], [4 x i8]*@.str5505, i32 0, i32 0
ret i8* %.tmp5506
br label %.if.end.5504
.if.false.5504:
%.tmp5507 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5508 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5507, i32 0, i32 1
%.tmp5509 = load i8*, i8** %.tmp5508
%.tmp5511 = getelementptr [2 x i8], [2 x i8]*@.str5510, i32 0, i32 0
%.tmp5512 = call i32(i8*,i8*) @strcmp(i8* %.tmp5509, i8* %.tmp5511)
%.tmp5513 = icmp eq i32 %.tmp5512, 0
br i1 %.tmp5513, label %.if.true.5514, label %.if.false.5514
.if.true.5514:
%.tmp5516 = getelementptr [4 x i8], [4 x i8]*@.str5515, i32 0, i32 0
ret i8* %.tmp5516
br label %.if.end.5514
.if.false.5514:
%.tmp5517 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5518 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5517, i32 0, i32 1
%.tmp5519 = load i8*, i8** %.tmp5518
%.tmp5521 = getelementptr [2 x i8], [2 x i8]*@.str5520, i32 0, i32 0
%.tmp5522 = call i32(i8*,i8*) @strcmp(i8* %.tmp5519, i8* %.tmp5521)
%.tmp5523 = icmp eq i32 %.tmp5522, 0
br i1 %.tmp5523, label %.if.true.5524, label %.if.false.5524
.if.true.5524:
%.tmp5526 = getelementptr [5 x i8], [5 x i8]*@.str5525, i32 0, i32 0
ret i8* %.tmp5526
br label %.if.end.5524
.if.false.5524:
%.tmp5527 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5528 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5527, i32 0, i32 1
%.tmp5529 = load i8*, i8** %.tmp5528
%.tmp5531 = getelementptr [3 x i8], [3 x i8]*@.str5530, i32 0, i32 0
%.tmp5532 = call i32(i8*,i8*) @strcmp(i8* %.tmp5529, i8* %.tmp5531)
%.tmp5533 = icmp eq i32 %.tmp5532, 0
br i1 %.tmp5533, label %.if.true.5534, label %.if.false.5534
.if.true.5534:
%.tmp5536 = getelementptr [8 x i8], [8 x i8]*@.str5535, i32 0, i32 0
ret i8* %.tmp5536
br label %.if.end.5534
.if.false.5534:
%.tmp5537 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5538 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5537, i32 0, i32 1
%.tmp5539 = load i8*, i8** %.tmp5538
%.tmp5541 = getelementptr [3 x i8], [3 x i8]*@.str5540, i32 0, i32 0
%.tmp5542 = call i32(i8*,i8*) @strcmp(i8* %.tmp5539, i8* %.tmp5541)
%.tmp5543 = icmp eq i32 %.tmp5542, 0
br i1 %.tmp5543, label %.if.true.5544, label %.if.false.5544
.if.true.5544:
%.tmp5546 = getelementptr [8 x i8], [8 x i8]*@.str5545, i32 0, i32 0
ret i8* %.tmp5546
br label %.if.end.5544
.if.false.5544:
%.tmp5547 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5548 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5547, i32 0, i32 1
%.tmp5549 = load i8*, i8** %.tmp5548
%.tmp5551 = getelementptr [2 x i8], [2 x i8]*@.str5550, i32 0, i32 0
%.tmp5552 = call i32(i8*,i8*) @strcmp(i8* %.tmp5549, i8* %.tmp5551)
%.tmp5553 = icmp eq i32 %.tmp5552, 0
br i1 %.tmp5553, label %.if.true.5554, label %.if.false.5554
.if.true.5554:
%.tmp5556 = getelementptr [9 x i8], [9 x i8]*@.str5555, i32 0, i32 0
ret i8* %.tmp5556
br label %.if.end.5554
.if.false.5554:
%.tmp5557 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5558 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5557, i32 0, i32 1
%.tmp5559 = load i8*, i8** %.tmp5558
%.tmp5561 = getelementptr [2 x i8], [2 x i8]*@.str5560, i32 0, i32 0
%.tmp5562 = call i32(i8*,i8*) @strcmp(i8* %.tmp5559, i8* %.tmp5561)
%.tmp5563 = icmp eq i32 %.tmp5562, 0
br i1 %.tmp5563, label %.if.true.5564, label %.if.false.5564
.if.true.5564:
%.tmp5566 = getelementptr [9 x i8], [9 x i8]*@.str5565, i32 0, i32 0
ret i8* %.tmp5566
br label %.if.end.5564
.if.false.5564:
%.tmp5567 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5568 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5567, i32 0, i32 1
%.tmp5569 = load i8*, i8** %.tmp5568
%.tmp5571 = getelementptr [2 x i8], [2 x i8]*@.str5570, i32 0, i32 0
%.tmp5572 = call i32(i8*,i8*) @strcmp(i8* %.tmp5569, i8* %.tmp5571)
%.tmp5573 = icmp eq i32 %.tmp5572, 0
br i1 %.tmp5573, label %.if.true.5574, label %.if.false.5574
.if.true.5574:
%.tmp5576 = getelementptr [4 x i8], [4 x i8]*@.str5575, i32 0, i32 0
ret i8* %.tmp5576
br label %.if.end.5574
.if.false.5574:
%.tmp5577 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5578 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5577, i32 0, i32 1
%.tmp5579 = load i8*, i8** %.tmp5578
%.tmp5581 = getelementptr [2 x i8], [2 x i8]*@.str5580, i32 0, i32 0
%.tmp5582 = call i32(i8*,i8*) @strcmp(i8* %.tmp5579, i8* %.tmp5581)
%.tmp5583 = icmp eq i32 %.tmp5582, 0
br i1 %.tmp5583, label %.if.true.5584, label %.if.false.5584
.if.true.5584:
%.tmp5586 = getelementptr [3 x i8], [3 x i8]*@.str5585, i32 0, i32 0
ret i8* %.tmp5586
br label %.if.end.5584
.if.false.5584:
%.tmp5587 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5588 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5587, i32 0, i32 1
%.tmp5589 = load i8*, i8** %.tmp5588
%.tmp5591 = getelementptr [3 x i8], [3 x i8]*@.str5590, i32 0, i32 0
%.tmp5592 = call i32(i8*,i8*) @strcmp(i8* %.tmp5589, i8* %.tmp5591)
%.tmp5593 = icmp eq i32 %.tmp5592, 0
br i1 %.tmp5593, label %.if.true.5594, label %.if.false.5594
.if.true.5594:
%.tmp5596 = getelementptr [9 x i8], [9 x i8]*@.str5595, i32 0, i32 0
ret i8* %.tmp5596
br label %.if.end.5594
.if.false.5594:
%.tmp5597 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5598 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5597, i32 0, i32 1
%.tmp5599 = load i8*, i8** %.tmp5598
%.tmp5601 = getelementptr [3 x i8], [3 x i8]*@.str5600, i32 0, i32 0
%.tmp5602 = call i32(i8*,i8*) @strcmp(i8* %.tmp5599, i8* %.tmp5601)
%.tmp5603 = icmp eq i32 %.tmp5602, 0
br i1 %.tmp5603, label %.if.true.5604, label %.if.false.5604
.if.true.5604:
%.tmp5606 = getelementptr [9 x i8], [9 x i8]*@.str5605, i32 0, i32 0
ret i8* %.tmp5606
br label %.if.end.5604
.if.false.5604:
%.tmp5607 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5608 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5610 = getelementptr [30 x i8], [30 x i8]*@.str5609, i32 0, i32 0
%.tmp5611 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5607, %m286$.Node.type* %.tmp5608, i8* %.tmp5610)
%.tmp5612 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5613 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5612, i32 0, i32 1
%.tmp5614 = load i8*, i8** %.tmp5613
%.tmp5615 = call i32(i8*,...) @printf(i8* %.tmp5611, i8* %.tmp5614)
br label %.if.end.5604
.if.end.5604:
br label %.if.end.5594
.if.end.5594:
br label %.if.end.5584
.if.end.5584:
br label %.if.end.5574
.if.end.5574:
br label %.if.end.5564
.if.end.5564:
br label %.if.end.5554
.if.end.5554:
br label %.if.end.5544
.if.end.5544:
br label %.if.end.5534
.if.end.5534:
br label %.if.end.5524
.if.end.5524:
br label %.if.end.5514
.if.end.5514:
br label %.if.end.5504
.if.end.5504:
br label %.if.end.5494
.if.end.5494:
%.tmp5617 = getelementptr [4 x i8], [4 x i8]*@.str5616, i32 0, i32 0
ret i8* %.tmp5617
}
define %m1772$.Type.type* @m1772$operator_type.m1772$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5618 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp5618, %m1772$.Type.type** %type
%.tmp5619 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5620 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5619, i32 0, i32 1
%.tmp5621 = load i8*, i8** %.tmp5620
%.tmp5623 = getelementptr [3 x i8], [3 x i8]*@.str5622, i32 0, i32 0
%.tmp5624 = call i32(i8*,i8*) @strcmp(i8* %.tmp5621, i8* %.tmp5623)
%.tmp5625 = icmp eq i32 %.tmp5624, 0
%.tmp5626 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5627 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5626, i32 0, i32 1
%.tmp5628 = load i8*, i8** %.tmp5627
%.tmp5630 = getelementptr [3 x i8], [3 x i8]*@.str5629, i32 0, i32 0
%.tmp5631 = call i32(i8*,i8*) @strcmp(i8* %.tmp5628, i8* %.tmp5630)
%.tmp5632 = icmp eq i32 %.tmp5631, 0
%.tmp5633 = or i1 %.tmp5625, %.tmp5632
%.tmp5634 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5635 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5634, i32 0, i32 1
%.tmp5636 = load i8*, i8** %.tmp5635
%.tmp5638 = getelementptr [2 x i8], [2 x i8]*@.str5637, i32 0, i32 0
%.tmp5639 = call i32(i8*,i8*) @strcmp(i8* %.tmp5636, i8* %.tmp5638)
%.tmp5640 = icmp eq i32 %.tmp5639, 0
%.tmp5641 = or i1 %.tmp5633, %.tmp5640
%.tmp5642 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5643 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5642, i32 0, i32 1
%.tmp5644 = load i8*, i8** %.tmp5643
%.tmp5646 = getelementptr [2 x i8], [2 x i8]*@.str5645, i32 0, i32 0
%.tmp5647 = call i32(i8*,i8*) @strcmp(i8* %.tmp5644, i8* %.tmp5646)
%.tmp5648 = icmp eq i32 %.tmp5647, 0
%.tmp5649 = or i1 %.tmp5641, %.tmp5648
%.tmp5650 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5651 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5650, i32 0, i32 1
%.tmp5652 = load i8*, i8** %.tmp5651
%.tmp5654 = getelementptr [2 x i8], [2 x i8]*@.str5653, i32 0, i32 0
%.tmp5655 = call i32(i8*,i8*) @strcmp(i8* %.tmp5652, i8* %.tmp5654)
%.tmp5656 = icmp eq i32 %.tmp5655, 0
%.tmp5657 = or i1 %.tmp5649, %.tmp5656
%.tmp5658 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5659 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5658, i32 0, i32 1
%.tmp5660 = load i8*, i8** %.tmp5659
%.tmp5662 = getelementptr [2 x i8], [2 x i8]*@.str5661, i32 0, i32 0
%.tmp5663 = call i32(i8*,i8*) @strcmp(i8* %.tmp5660, i8* %.tmp5662)
%.tmp5664 = icmp eq i32 %.tmp5663, 0
%.tmp5665 = or i1 %.tmp5657, %.tmp5664
%.tmp5666 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5667 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5666, i32 0, i32 1
%.tmp5668 = load i8*, i8** %.tmp5667
%.tmp5670 = getelementptr [3 x i8], [3 x i8]*@.str5669, i32 0, i32 0
%.tmp5671 = call i32(i8*,i8*) @strcmp(i8* %.tmp5668, i8* %.tmp5670)
%.tmp5672 = icmp eq i32 %.tmp5671, 0
%.tmp5673 = or i1 %.tmp5665, %.tmp5672
%.tmp5674 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5675 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5674, i32 0, i32 1
%.tmp5676 = load i8*, i8** %.tmp5675
%.tmp5678 = getelementptr [3 x i8], [3 x i8]*@.str5677, i32 0, i32 0
%.tmp5679 = call i32(i8*,i8*) @strcmp(i8* %.tmp5676, i8* %.tmp5678)
%.tmp5680 = icmp eq i32 %.tmp5679, 0
%.tmp5681 = or i1 %.tmp5673, %.tmp5680
br i1 %.tmp5681, label %.if.true.5682, label %.if.false.5682
.if.true.5682:
%.tmp5683 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp5684 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5683, i32 0, i32 0
%.tmp5686 = getelementptr [5 x i8], [5 x i8]*@.str5685, i32 0, i32 0
store i8* %.tmp5686, i8** %.tmp5684
br label %.if.end.5682
.if.false.5682:
%.tmp5687 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp5688 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5687, i32 0, i32 0
%.tmp5690 = getelementptr [4 x i8], [4 x i8]*@.str5689, i32 0, i32 0
store i8* %.tmp5690, i8** %.tmp5688
br label %.if.end.5682
.if.end.5682:
%.tmp5691 = load %m1772$.Type.type*, %m1772$.Type.type** %type
ret %m1772$.Type.type* %.tmp5691
}
define %m1772$.AssignableInfo.type* @m1772$compile_mono_assignable.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5692 = bitcast ptr null to %m1772$.AssignableInfo.type*
%assignable_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5692, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5693 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5693, %m286$.Node.type** %mono
%err_buf = alloca i8*
%buf = alloca i8*
%.tmp5694 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5695 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5694, i32 0, i32 6
%.tmp5696 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5695
%.tmp5697 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5696, i32 0, i32 0
%.tmp5698 = load i8*, i8** %.tmp5697
%.tmp5700 = getelementptr [7 x i8], [7 x i8]*@.str5699, i32 0, i32 0
%.tmp5701 = call i32(i8*,i8*) @strcmp(i8* %.tmp5698, i8* %.tmp5700)
%.tmp5702 = icmp eq i32 %.tmp5701, 0
br i1 %.tmp5702, label %.if.true.5703, label %.if.false.5703
.if.true.5703:
%.tmp5704 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5705 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5704)
store %m1772$.AssignableInfo.type* %.tmp5705, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5706 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5707 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5706, i32 0, i32 3
%.tmp5708 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp5708, %m1772$.Type.type** %.tmp5707
%.tmp5709 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5710 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5709, i32 0, i32 3
%.tmp5711 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5710
%.tmp5712 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5711, i32 0, i32 0
%.tmp5714 = getelementptr [4 x i8], [4 x i8]*@.str5713, i32 0, i32 0
store i8* %.tmp5714, i8** %.tmp5712
%.tmp5715 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5716 = load i8, i8* @SCOPE_CONST
%.tmp5717 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5718 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5717, i32 0, i32 6
%.tmp5719 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5718
%.tmp5720 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5719, i32 0, i32 1
%.tmp5721 = load i8*, i8** %.tmp5720
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp5715, i8 %.tmp5716, i8* %.tmp5721)
br label %.if.end.5703
.if.false.5703:
%.tmp5722 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5723 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5722, i32 0, i32 6
%.tmp5724 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5723
%.tmp5725 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5724, i32 0, i32 0
%.tmp5726 = load i8*, i8** %.tmp5725
%.tmp5728 = getelementptr [5 x i8], [5 x i8]*@.str5727, i32 0, i32 0
%.tmp5729 = call i32(i8*,i8*) @strcmp(i8* %.tmp5726, i8* %.tmp5728)
%.tmp5730 = icmp eq i32 %.tmp5729, 0
br i1 %.tmp5730, label %.if.true.5731, label %.if.false.5731
.if.true.5731:
%.tmp5732 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5733 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5732, i32 0, i32 6
%.tmp5734 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5733
%.tmp5735 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5734, i32 0, i32 1
%.tmp5736 = load i8*, i8** %.tmp5735
%.tmp5738 = getelementptr [5 x i8], [5 x i8]*@.str5737, i32 0, i32 0
%.tmp5739 = call i32(i8*,i8*) @strcmp(i8* %.tmp5736, i8* %.tmp5738)
%.tmp5740 = icmp ne i32 %.tmp5739, 0
br i1 %.tmp5740, label %.if.true.5741, label %.if.false.5741
.if.true.5741:
%.tmp5742 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5743 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5745 = getelementptr [42 x i8], [42 x i8]*@.str5744, i32 0, i32 0
%.tmp5746 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp5742, %m286$.Node.type* %.tmp5743, i8* %.tmp5745)
%.tmp5747 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5748 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5747, i32 0, i32 6
%.tmp5749 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5748
%.tmp5750 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5749, i32 0, i32 1
%.tmp5751 = load i8*, i8** %.tmp5750
%.tmp5752 = call i32(i8*,...) @printf(i8* %.tmp5746, i8* %.tmp5751)
%.tmp5753 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp5753
br label %.if.end.5741
.if.false.5741:
br label %.if.end.5741
.if.end.5741:
%.tmp5754 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5755 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5754)
store %m1772$.AssignableInfo.type* %.tmp5755, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5756 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5757 = load i8, i8* @SCOPE_CONST
%.tmp5759 = getelementptr [5 x i8], [5 x i8]*@.str5758, i32 0, i32 0
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp5756, i8 %.tmp5757, i8* %.tmp5759)
%.tmp5760 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5761 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5760, i32 0, i32 3
%.tmp5762 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp5762, %m1772$.Type.type** %.tmp5761
%.tmp5763 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5764 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5763, i32 0, i32 3
%.tmp5765 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5764
%.tmp5766 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5765, i32 0, i32 0
%.tmp5768 = getelementptr [8 x i8], [8 x i8]*@.str5767, i32 0, i32 0
store i8* %.tmp5768, i8** %.tmp5766
br label %.if.end.5731
.if.false.5731:
%.tmp5769 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5770 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5769, i32 0, i32 6
%.tmp5771 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5770
%.tmp5772 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5771, i32 0, i32 0
%.tmp5773 = load i8*, i8** %.tmp5772
%.tmp5775 = getelementptr [17 x i8], [17 x i8]*@.str5774, i32 0, i32 0
%.tmp5776 = call i32(i8*,i8*) @strcmp(i8* %.tmp5773, i8* %.tmp5775)
%.tmp5777 = icmp eq i32 %.tmp5776, 0
br i1 %.tmp5777, label %.if.true.5778, label %.if.false.5778
.if.true.5778:
%.tmp5779 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5780 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5779)
store %m1772$.AssignableInfo.type* %.tmp5780, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5781 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5782 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5781, i32 0, i32 6
%.tmp5783 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5782
%.tmp5784 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5783, i32 0, i32 6
%.tmp5785 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5784
%.tmp5787 = getelementptr [12 x i8], [12 x i8]*@.str5786, i32 0, i32 0
%.tmp5788 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5785, i8* %.tmp5787)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5788, %m286$.Node.type** %dest
%.tmp5789 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5790 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5791 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_addr.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp5789, %m286$.Node.type* %.tmp5790)
%var_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5791, %m1772$.AssignableInfo.type** %var_info
%.tmp5792 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %var_info
%.tmp5793 = icmp eq %m1772$.AssignableInfo.type* %.tmp5792, null
br i1 %.tmp5793, label %.if.true.5794, label %.if.false.5794
.if.true.5794:
%.tmp5795 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
ret %m1772$.AssignableInfo.type* %.tmp5795
br label %.if.end.5794
.if.false.5794:
br label %.if.end.5794
.if.end.5794:
%.tmp5796 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5797 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %var_info
%.tmp5798 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5797, i32 0, i32 3
%.tmp5799 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5798
%.tmp5800 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5796, %m1772$.Type.type* %.tmp5799)
%var_type_repr = alloca i8*
store i8* %.tmp5800, i8** %var_type_repr
%.tmp5801 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5802 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5801, %m1772$.AssignableInfo.type* %.tmp5802)
%.tmp5803 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5804 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5803, i32 0, i32 3
%.tmp5805 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %var_info
%.tmp5806 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5805, i32 0, i32 3
%.tmp5807 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5806
store %m1772$.Type.type* %.tmp5807, %m1772$.Type.type** %.tmp5804
%.tmp5809 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5810 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5809, i32 0, i32 6
%.tmp5811 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5810
%.tmp5812 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5811, i32 0, i32 6
%.tmp5813 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5812
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5813, %m286$.Node.type** %ptr
br label %.for.start.5808
.for.start.5808:
%.tmp5814 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5815 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5816 = icmp ne %m286$.Node.type* %.tmp5814, %.tmp5815
br i1 %.tmp5816, label %.for.continue.5808, label %.for.end.5808
.for.continue.5808:
%.tmp5817 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp5817, %m1772$.Type.type** %type
%.tmp5818 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp5819 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5818, i32 0, i32 3
%.tmp5820 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5821 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5820, i32 0, i32 3
%.tmp5822 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5821
store %m1772$.Type.type* %.tmp5822, %m1772$.Type.type** %.tmp5819
%.tmp5823 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp5824 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5823, i32 0, i32 0
%.tmp5826 = getelementptr [4 x i8], [4 x i8]*@.str5825, i32 0, i32 0
store i8* %.tmp5826, i8** %.tmp5824
%.tmp5827 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5828 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5827, i32 0, i32 3
%.tmp5829 = load %m1772$.Type.type*, %m1772$.Type.type** %type
store %m1772$.Type.type* %.tmp5829, %m1772$.Type.type** %.tmp5828
%.tmp5830 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5831 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5830, i32 0, i32 7
%.tmp5832 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5831
store %m286$.Node.type* %.tmp5832, %m286$.Node.type** %ptr
br label %.for.start.5808
.for.end.5808:
%.tmp5833 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5833, i32 0, i32 6
%.tmp5835 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5834
%.tmp5836 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5835, i32 0, i32 6
%.tmp5837 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5836
%.tmp5838 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5839 = icmp ne %m286$.Node.type* %.tmp5837, %.tmp5838
br i1 %.tmp5839, label %.if.true.5840, label %.if.false.5840
.if.true.5840:
%.tmp5841 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5842 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5841, i32 0, i32 1
%.tmp5843 = load %m0$.File.type*, %m0$.File.type** %.tmp5842
%.tmp5845 = getelementptr [38 x i8], [38 x i8]*@.str5844, i32 0, i32 0
%.tmp5846 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5847 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5846)
%.tmp5848 = load i8*, i8** %var_type_repr
%.tmp5849 = load i8*, i8** %var_type_repr
%.tmp5850 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %var_info
%.tmp5851 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5850)
%.tmp5852 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5843, i8* %.tmp5845, i8* %.tmp5847, i8* %.tmp5848, i8* %.tmp5849, i8* %.tmp5851)
br label %.if.end.5840
.if.false.5840:
%.tmp5853 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5854 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5853, i32 0, i32 1
%.tmp5855 = load %m0$.File.type*, %m0$.File.type** %.tmp5854
%.tmp5857 = getelementptr [22 x i8], [22 x i8]*@.str5856, i32 0, i32 0
%.tmp5858 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5859 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5858)
%.tmp5860 = load i8*, i8** %var_type_repr
%.tmp5861 = load i8*, i8** %var_type_repr
%.tmp5862 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %var_info
%.tmp5863 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5862)
%.tmp5864 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5855, i8* %.tmp5857, i8* %.tmp5859, i8* %.tmp5860, i8* %.tmp5861, i8* %.tmp5863)
br label %.if.end.5840
.if.end.5840:
br label %.if.end.5778
.if.false.5778:
%.tmp5865 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5866 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5865, i32 0, i32 6
%.tmp5867 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5866
%.tmp5868 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5867, i32 0, i32 0
%.tmp5869 = load i8*, i8** %.tmp5868
%.tmp5871 = getelementptr [8 x i8], [8 x i8]*@.str5870, i32 0, i32 0
%.tmp5872 = call i32(i8*,i8*) @strcmp(i8* %.tmp5869, i8* %.tmp5871)
%.tmp5873 = icmp eq i32 %.tmp5872, 0
br i1 %.tmp5873, label %.if.true.5874, label %.if.false.5874
.if.true.5874:
%.tmp5875 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5876 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5875)
store %m1772$.AssignableInfo.type* %.tmp5876, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5877 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5878 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5877, i32 0, i32 3
%.tmp5879 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp5879, %m1772$.Type.type** %.tmp5878
%.tmp5880 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5881 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5880, i32 0, i32 3
%.tmp5882 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5881
%.tmp5883 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5882, i32 0, i32 0
%.tmp5885 = getelementptr [5 x i8], [5 x i8]*@.str5884, i32 0, i32 0
store i8* %.tmp5885, i8** %.tmp5883
%.tmp5886 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5887 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5886, i32 0, i32 6
%.tmp5888 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5887
%.tmp5889 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5888, i32 0, i32 6
%.tmp5890 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5889
%.tmp5891 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5890, i32 0, i32 1
%.tmp5892 = load i8*, i8** %.tmp5891
%.tmp5894 = getelementptr [6 x i8], [6 x i8]*@.str5893, i32 0, i32 0
%.tmp5895 = call i32(i8*,i8*) @strcmp(i8* %.tmp5892, i8* %.tmp5894)
%.tmp5896 = icmp eq i32 %.tmp5895, 0
br i1 %.tmp5896, label %.if.true.5897, label %.if.false.5897
.if.true.5897:
%.tmp5898 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5899 = load i8, i8* @SCOPE_CONST
%.tmp5901 = getelementptr [2 x i8], [2 x i8]*@.str5900, i32 0, i32 0
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp5898, i8 %.tmp5899, i8* %.tmp5901)
br label %.if.end.5897
.if.false.5897:
%.tmp5902 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5903 = load i8, i8* @SCOPE_CONST
%.tmp5905 = getelementptr [2 x i8], [2 x i8]*@.str5904, i32 0, i32 0
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp5902, i8 %.tmp5903, i8* %.tmp5905)
br label %.if.end.5897
.if.end.5897:
br label %.if.end.5874
.if.false.5874:
%.tmp5906 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5907 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5906, i32 0, i32 6
%.tmp5908 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5907
%.tmp5909 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5908, i32 0, i32 0
%.tmp5910 = load i8*, i8** %.tmp5909
%.tmp5912 = getelementptr [8 x i8], [8 x i8]*@.str5911, i32 0, i32 0
%.tmp5913 = call i32(i8*,i8*) @strcmp(i8* %.tmp5910, i8* %.tmp5912)
%.tmp5914 = icmp eq i32 %.tmp5913, 0
br i1 %.tmp5914, label %.if.true.5915, label %.if.false.5915
.if.true.5915:
%.tmp5916 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5917 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5918 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5917, i32 0, i32 6
%.tmp5919 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5918
%.tmp5920 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5919, i32 0, i32 6
%.tmp5921 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5920
%.tmp5922 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$compile_fn_call.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp5916, %m286$.Node.type* %.tmp5921)
store %m1772$.AssignableInfo.type* %.tmp5922, %m1772$.AssignableInfo.type** %assignable_info
br label %.if.end.5915
.if.false.5915:
%.tmp5923 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5924 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5923, i32 0, i32 6
%.tmp5925 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5924
%.tmp5926 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5925, i32 0, i32 0
%.tmp5927 = load i8*, i8** %.tmp5926
%.tmp5929 = getelementptr [7 x i8], [7 x i8]*@.str5928, i32 0, i32 0
%.tmp5930 = call i32(i8*,i8*) @strcmp(i8* %.tmp5927, i8* %.tmp5929)
%.tmp5931 = icmp eq i32 %.tmp5930, 0
br i1 %.tmp5931, label %.if.true.5932, label %.if.false.5932
.if.true.5932:
%.tmp5933 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5934 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5935 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5934, i32 0, i32 6
%.tmp5936 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5935
%.tmp5937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5936, i32 0, i32 1
%.tmp5938 = load i8*, i8** %.tmp5937
%.tmp5939 = call %m1772$.AssignableInfo.type*(%m1772$.CompilerCtx.type*,i8*) @m1772$define_string.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.tmp5933, i8* %.tmp5938)
%string_info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp5939, %m1772$.AssignableInfo.type** %string_info
%.tmp5940 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5941 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5940)
store %m1772$.AssignableInfo.type* %.tmp5941, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5942 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5943 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
call void(%m1772$.CompilerCtx.type*,%m1772$.AssignableInfo.type*) @m1772$set_assignable_tmp_id.v.m1772$.CompilerCtx.typep.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp5942, %m1772$.AssignableInfo.type* %.tmp5943)
%.tmp5944 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5945 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %string_info
%.tmp5946 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5945, i32 0, i32 3
%.tmp5947 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5946
%.tmp5948 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp5944, %m1772$.Type.type* %.tmp5947)
%str_tr = alloca i8*
store i8* %.tmp5948, i8** %str_tr
%.tmp5949 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp5950 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp5949, i32 0, i32 1
%.tmp5951 = load %m0$.File.type*, %m0$.File.type** %.tmp5950
%.tmp5953 = getelementptr [44 x i8], [44 x i8]*@.str5952, i32 0, i32 0
%.tmp5954 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5955 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5954)
%.tmp5956 = load i8*, i8** %str_tr
%.tmp5957 = load i8*, i8** %str_tr
%.tmp5958 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %string_info
%.tmp5959 = call i8*(%m1772$.AssignableInfo.type*) @m1772$repr_assignable_id.cp.m1772$.AssignableInfo.typep(%m1772$.AssignableInfo.type* %.tmp5958)
%.tmp5960 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5951, i8* %.tmp5953, i8* %.tmp5955, i8* %.tmp5956, i8* %.tmp5957, i8* %.tmp5959)
%.tmp5961 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5962 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5961, i32 0, i32 3
%.tmp5963 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp5963, %m1772$.Type.type** %.tmp5962
%.tmp5964 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5965 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5964, i32 0, i32 3
%.tmp5966 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5965
%.tmp5967 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5966, i32 0, i32 0
%.tmp5969 = getelementptr [4 x i8], [4 x i8]*@.str5968, i32 0, i32 0
store i8* %.tmp5969, i8** %.tmp5967
%.tmp5970 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5971 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5970, i32 0, i32 3
%.tmp5972 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5971
%.tmp5973 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5972, i32 0, i32 3
%.tmp5974 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp5974, %m1772$.Type.type** %.tmp5973
%.tmp5975 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5976 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp5975, i32 0, i32 3
%.tmp5977 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5976
%.tmp5978 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5977, i32 0, i32 3
%.tmp5979 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp5978
%.tmp5980 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp5979, i32 0, i32 0
%.tmp5982 = getelementptr [4 x i8], [4 x i8]*@.str5981, i32 0, i32 0
store i8* %.tmp5982, i8** %.tmp5980
br label %.if.end.5932
.if.false.5932:
%.tmp5983 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5984 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5983, i32 0, i32 6
%.tmp5985 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5984
%.tmp5986 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5985, i32 0, i32 0
%.tmp5987 = load i8*, i8** %.tmp5986
%.tmp5989 = getelementptr [4 x i8], [4 x i8]*@.str5988, i32 0, i32 0
%.tmp5990 = call i32(i8*,i8*) @strcmp(i8* %.tmp5987, i8* %.tmp5989)
%.tmp5991 = icmp eq i32 %.tmp5990, 0
br i1 %.tmp5991, label %.if.true.5992, label %.if.false.5992
.if.true.5992:
%.tmp5993 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5994 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5993)
store %m1772$.AssignableInfo.type* %.tmp5994, %m1772$.AssignableInfo.type** %assignable_info
%.tmp5995 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5996 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5995, i32 0, i32 6
%.tmp5997 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5996
%.tmp5998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5997, i32 0, i32 1
%.tmp5999 = load i8*, i8** %.tmp5998
%.tmp6000 = call i32(i8*) @strlen(i8* %.tmp5999)
%chr_len = alloca i32
store i32 %.tmp6000, i32* %chr_len
%.tmp6001 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6002 = load i8, i8* @SCOPE_CONST
%.tmp6004 = getelementptr [2 x i8], [2 x i8]*@.str6003, i32 0, i32 0
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp6001, i8 %.tmp6002, i8* %.tmp6004)
%.tmp6005 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6006 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6005, i32 0, i32 0
%.tmp6007 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6008 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6007, i32 0, i32 6
%.tmp6009 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6008
%.tmp6010 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6009, i32 0, i32 1
%.tmp6011 = load i8*, i8** %.tmp6010
%.tmp6012 = call i8*(i8*) @m2118$chr_to_llvm.cp.cp(i8* %.tmp6011)
store i8* %.tmp6012, i8** %.tmp6006
%.tmp6013 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6014 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6013, i32 0, i32 0
%.tmp6015 = load i8*, i8** %.tmp6014
%.tmp6016 = icmp eq i8* %.tmp6015, null
br i1 %.tmp6016, label %.if.true.6017, label %.if.false.6017
.if.true.6017:
%.tmp6018 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp6020 = getelementptr [22 x i8], [22 x i8]*@.str6019, i32 0, i32 0
%.tmp6021 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6022 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6021, i32 0, i32 6
%.tmp6023 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6022
%.tmp6024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6023, i32 0, i32 1
%.tmp6025 = load i8*, i8** %.tmp6024
%.tmp6026 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6018, i8* %.tmp6020, i8* %.tmp6025)
%.tmp6027 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp6027
br label %.if.end.6017
.if.false.6017:
br label %.if.end.6017
.if.end.6017:
%.tmp6028 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6029 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6028, i32 0, i32 3
%.tmp6030 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp6030, %m1772$.Type.type** %.tmp6029
%.tmp6031 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6032 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6031, i32 0, i32 3
%.tmp6033 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6032
%.tmp6034 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6033, i32 0, i32 0
%.tmp6036 = getelementptr [4 x i8], [4 x i8]*@.str6035, i32 0, i32 0
store i8* %.tmp6036, i8** %.tmp6034
br label %.if.end.5992
.if.false.5992:
%.tmp6037 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6038 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6040 = getelementptr [40 x i8], [40 x i8]*@.str6039, i32 0, i32 0
%.tmp6041 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp6037, %m286$.Node.type* %.tmp6038, i8* %.tmp6040)
%.tmp6042 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp6043 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6042, i32 0, i32 6
%.tmp6044 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6043
%.tmp6045 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6044, i32 0, i32 0
%.tmp6046 = load i8*, i8** %.tmp6045
%.tmp6047 = call i32(i8*,...) @printf(i8* %.tmp6041, i8* %.tmp6046)
%.tmp6048 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp6048
br label %.if.end.5992
.if.end.5992:
br label %.if.end.5932
.if.end.5932:
br label %.if.end.5915
.if.end.5915:
br label %.if.end.5874
.if.end.5874:
br label %.if.end.5778
.if.end.5778:
br label %.if.end.5731
.if.end.5731:
br label %.if.end.5703
.if.end.5703:
%.tmp6049 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6050 = icmp eq %m1772$.AssignableInfo.type* %.tmp6049, null
br i1 %.tmp6050, label %.if.true.6051, label %.if.false.6051
.if.true.6051:
%.tmp6052 = bitcast ptr null to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp6052
br label %.if.end.6051
.if.false.6051:
br label %.if.end.6051
.if.end.6051:
%.tmp6053 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6054 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6053, i32 0, i32 4
%.tmp6055 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6056 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6055, i32 0, i32 3
%.tmp6057 = load i32, i32* %.tmp6056
store i32 %.tmp6057, i32* %.tmp6054
%.tmp6058 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6059 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6058, i32 0, i32 5
%.tmp6060 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp6061 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6060, i32 0, i32 4
%.tmp6062 = load i32, i32* %.tmp6061
store i32 %.tmp6062, i32* %.tmp6059
%.tmp6063 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %assignable_info
%.tmp6064 = bitcast %m1772$.AssignableInfo.type* %.tmp6063 to %m1772$.AssignableInfo.type*
ret %m1772$.AssignableInfo.type* %.tmp6064
}
define i8* @m1772$type_abbr.cp.m1772$.Type.typep(%m1772$.Type.type* %.type.arg) {
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.type.arg, %m1772$.Type.type** %type
%.tmp6065 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6066 = icmp ne %m1772$.Type.type* %.tmp6065, null
%.tmp6068 = getelementptr [22 x i8], [22 x i8]*@.str6067, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6066, i8* %.tmp6068)
%.tmp6069 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6070 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6069, i32 0, i32 0
%.tmp6071 = load i8*, i8** %.tmp6070
%.tmp6072 = icmp ne i8* %.tmp6071, null
%.tmp6074 = getelementptr [59 x i8], [59 x i8]*@.str6073, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6072, i8* %.tmp6074)
%.tmp6075 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6076 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6075, i32 0, i32 0
%.tmp6077 = load i8*, i8** %.tmp6076
%.tmp6079 = getelementptr [4 x i8], [4 x i8]*@.str6078, i32 0, i32 0
%.tmp6080 = call i32(i8*,i8*) @strcmp(i8* %.tmp6077, i8* %.tmp6079)
%.tmp6081 = icmp eq i32 %.tmp6080, 0
br i1 %.tmp6081, label %.if.true.6082, label %.if.false.6082
.if.true.6082:
%.tmp6084 = getelementptr [2 x i8], [2 x i8]*@.str6083, i32 0, i32 0
ret i8* %.tmp6084
br label %.if.end.6082
.if.false.6082:
%.tmp6085 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6086 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6085, i32 0, i32 0
%.tmp6087 = load i8*, i8** %.tmp6086
%.tmp6089 = getelementptr [5 x i8], [5 x i8]*@.str6088, i32 0, i32 0
%.tmp6090 = call i32(i8*,i8*) @strcmp(i8* %.tmp6087, i8* %.tmp6089)
%.tmp6091 = icmp eq i32 %.tmp6090, 0
br i1 %.tmp6091, label %.if.true.6092, label %.if.false.6092
.if.true.6092:
%.tmp6094 = getelementptr [2 x i8], [2 x i8]*@.str6093, i32 0, i32 0
ret i8* %.tmp6094
br label %.if.end.6092
.if.false.6092:
%.tmp6095 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6096 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6095, i32 0, i32 0
%.tmp6097 = load i8*, i8** %.tmp6096
%.tmp6099 = getelementptr [5 x i8], [5 x i8]*@.str6098, i32 0, i32 0
%.tmp6100 = call i32(i8*,i8*) @strcmp(i8* %.tmp6097, i8* %.tmp6099)
%.tmp6101 = icmp eq i32 %.tmp6100, 0
br i1 %.tmp6101, label %.if.true.6102, label %.if.false.6102
.if.true.6102:
%.tmp6104 = getelementptr [2 x i8], [2 x i8]*@.str6103, i32 0, i32 0
ret i8* %.tmp6104
br label %.if.end.6102
.if.false.6102:
%.tmp6105 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6106 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6105, i32 0, i32 0
%.tmp6107 = load i8*, i8** %.tmp6106
%.tmp6109 = getelementptr [4 x i8], [4 x i8]*@.str6108, i32 0, i32 0
%.tmp6110 = call i32(i8*,i8*) @strcmp(i8* %.tmp6107, i8* %.tmp6109)
%.tmp6111 = icmp eq i32 %.tmp6110, 0
br i1 %.tmp6111, label %.if.true.6112, label %.if.false.6112
.if.true.6112:
%.tmp6114 = getelementptr [2 x i8], [2 x i8]*@.str6113, i32 0, i32 0
ret i8* %.tmp6114
br label %.if.end.6112
.if.false.6112:
%.tmp6115 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6116 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6115, i32 0, i32 0
%.tmp6117 = load i8*, i8** %.tmp6116
%.tmp6119 = getelementptr [4 x i8], [4 x i8]*@.str6118, i32 0, i32 0
%.tmp6120 = call i32(i8*,i8*) @strcmp(i8* %.tmp6117, i8* %.tmp6119)
%.tmp6121 = icmp eq i32 %.tmp6120, 0
br i1 %.tmp6121, label %.if.true.6122, label %.if.false.6122
.if.true.6122:
%buf = alloca i8*
%.tmp6123 = getelementptr i8*, i8** %buf, i32 0
%.tmp6125 = getelementptr [4 x i8], [4 x i8]*@.str6124, i32 0, i32 0
%.tmp6126 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6127 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6126, i32 0, i32 3
%.tmp6128 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6127
%.tmp6129 = call i8*(%m1772$.Type.type*) @m1772$type_abbr.cp.m1772$.Type.typep(%m1772$.Type.type* %.tmp6128)
%.tmp6130 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6123, i8* %.tmp6125, i8* %.tmp6129)
%.tmp6131 = load i8*, i8** %buf
ret i8* %.tmp6131
br label %.if.end.6122
.if.false.6122:
%.tmp6132 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6133 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6132, i32 0, i32 0
%.tmp6134 = load i8*, i8** %.tmp6133
%.tmp6136 = getelementptr [10 x i8], [10 x i8]*@.str6135, i32 0, i32 0
%.tmp6137 = call i32(i8*,i8*) @strcmp(i8* %.tmp6134, i8* %.tmp6136)
%.tmp6138 = icmp eq i32 %.tmp6137, 0
br i1 %.tmp6138, label %.if.true.6139, label %.if.false.6139
.if.true.6139:
%.tmp6140 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6141 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6140, i32 0, i32 2
%.tmp6142 = load i8*, i8** %.tmp6141
ret i8* %.tmp6142
br label %.if.end.6139
.if.false.6139:
%.tmp6143 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6144 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6143, i32 0, i32 0
%.tmp6145 = load i8*, i8** %.tmp6144
%.tmp6147 = getelementptr [6 x i8], [6 x i8]*@.str6146, i32 0, i32 0
%.tmp6148 = call i32(i8*,i8*) @strcmp(i8* %.tmp6145, i8* %.tmp6147)
%.tmp6149 = icmp eq i32 %.tmp6148, 0
br i1 %.tmp6149, label %.if.true.6150, label %.if.false.6150
.if.true.6150:
%.tmp6152 = getelementptr [2 x i8], [2 x i8]*@.str6151, i32 0, i32 0
ret i8* %.tmp6152
br label %.if.end.6150
.if.false.6150:
%.tmp6154 = getelementptr [44 x i8], [44 x i8]*@.str6153, i32 0, i32 0
%.tmp6155 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6156 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6155, i32 0, i32 0
%.tmp6157 = load i8*, i8** %.tmp6156
%.tmp6158 = call i32(i8*,...) @printf(i8* %.tmp6154, i8* %.tmp6157)
br label %.if.end.6150
.if.end.6150:
br label %.if.end.6139
.if.end.6139:
br label %.if.end.6122
.if.end.6122:
br label %.if.end.6112
.if.end.6112:
br label %.if.end.6102
.if.end.6102:
br label %.if.end.6092
.if.end.6092:
br label %.if.end.6082
.if.end.6082:
%.tmp6159 = bitcast ptr null to i8*
ret i8* %.tmp6159
}
define %m1772$.AssignableInfo.type* @m1772$define_string.m1772$.AssignableInfo.typep.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp6160 = bitcast ptr null to %m286$.Node.type*
%.tmp6161 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6160)
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp6161, %m1772$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp6162 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp6164 = getelementptr [7 x i8], [7 x i8]*@.str6163, i32 0, i32 0
%.tmp6165 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6166 = call i32(%m1772$.CompilerCtx.type*) @m1772$new_uid.i.m1772$.CompilerCtx.typep(%m1772$.CompilerCtx.type* %.tmp6165)
%.tmp6167 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6162, i8* %.tmp6164, i32 %.tmp6166)
%.tmp6168 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6169 = load i8, i8* @SCOPE_GLOBAL
%.tmp6170 = load i8*, i8** %tmp_buff
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp6168, i8 %.tmp6169, i8* %.tmp6170)
%.tmp6171 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* null, i32 1
%.tmp6172 = ptrtoint %m1772$.GlobalName.type* %.tmp6171 to i32
%.tmp6173 = call i8*(i32) @malloc(i32 %.tmp6172)
%.tmp6174 = bitcast i8* %.tmp6173 to %m1772$.GlobalName.type*
%global = alloca %m1772$.GlobalName.type*
store %m1772$.GlobalName.type* %.tmp6174, %m1772$.GlobalName.type** %global
%.tmp6175 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
%.tmp6176 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6175, i32 0, i32 0
%.tmp6177 = load i8*, i8** %text
%.tmp6178 = call i8*(i8*) @m2118$string_to_llvm.cp.cp(i8* %.tmp6177)
store i8* %.tmp6178, i8** %.tmp6176
%.tmp6179 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6180 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6179, i32 0, i32 3
%.tmp6181 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp6181, %m1772$.Type.type** %.tmp6180
%.tmp6182 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6183 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6182, i32 0, i32 3
%.tmp6184 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6183
%.tmp6185 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6184, i32 0, i32 0
%.tmp6187 = getelementptr [6 x i8], [6 x i8]*@.str6186, i32 0, i32 0
store i8* %.tmp6187, i8** %.tmp6185
%.tmp6188 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6189 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6188, i32 0, i32 3
%.tmp6190 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6189
%.tmp6191 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6190, i32 0, i32 3
%.tmp6192 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp6192, %m1772$.Type.type** %.tmp6191
%.tmp6193 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6194 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6193, i32 0, i32 3
%.tmp6195 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6194
%.tmp6196 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6195, i32 0, i32 3
%.tmp6197 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6196
%.tmp6198 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6197, i32 0, i32 0
%.tmp6200 = getelementptr [4 x i8], [4 x i8]*@.str6199, i32 0, i32 0
store i8* %.tmp6200, i8** %.tmp6198
%.tmp6201 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6202 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6201, i32 0, i32 3
%.tmp6203 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6202
%.tmp6204 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6203, i32 0, i32 3
%.tmp6205 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6204
%.tmp6206 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6205, i32 0, i32 4
%.tmp6207 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp6207, %m1772$.Type.type** %.tmp6206
%.tmp6208 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6209 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6208, i32 0, i32 3
%.tmp6210 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6209
%.tmp6211 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6210, i32 0, i32 3
%.tmp6212 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6211
%.tmp6213 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6212, i32 0, i32 4
%.tmp6214 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6213
%.tmp6215 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6214, i32 0, i32 0
%.tmp6216 = getelementptr i8*, i8** %.tmp6215, i32 0
%.tmp6218 = getelementptr [3 x i8], [3 x i8]*@.str6217, i32 0, i32 0
%.tmp6219 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
%.tmp6220 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6219, i32 0, i32 0
%.tmp6221 = load i8*, i8** %.tmp6220
%.tmp6222 = call i32(i8*) @m2118$llvm_str_len.i.cp(i8* %.tmp6221)
%.tmp6223 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6216, i8* %.tmp6218, i32 %.tmp6222)
%.tmp6224 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
%.tmp6225 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6224, i32 0, i32 1
%.tmp6227 = getelementptr [7 x i8], [7 x i8]*@.str6226, i32 0, i32 0
store i8* %.tmp6227, i8** %.tmp6225
%.tmp6228 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
%.tmp6229 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6228, i32 0, i32 4
store %m1772$.GlobalName.type* null, %m1772$.GlobalName.type** %.tmp6229
%.tmp6230 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
%.tmp6231 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6230, i32 0, i32 3
%.tmp6232 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
store %m1772$.AssignableInfo.type* %.tmp6232, %m1772$.AssignableInfo.type** %.tmp6231
%.tmp6233 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
%.tmp6234 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6233, i32 0, i32 2
store i1 0, i1* %.tmp6234
%.tmp6235 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6236 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %global
call void(%m1772$.CompilerCtx.type*,%m1772$.GlobalName.type*) @m1772$append_global.v.m1772$.CompilerCtx.typep.m1772$.GlobalName.typep(%m1772$.CompilerCtx.type* %.tmp6235, %m1772$.GlobalName.type* %.tmp6236)
%.tmp6237 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
ret %m1772$.AssignableInfo.type* %.tmp6237
}
define void @m1772$define_module.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%mod = alloca %m286$.Node.type*
store %m286$.Node.type* %.mod.arg, %m286$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp6238 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp6239 = call %m1772$.AssignableInfo.type*(%m286$.Node.type*) @m1772$new_assignable_info.m1772$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6238)
%info = alloca %m1772$.AssignableInfo.type*
store %m1772$.AssignableInfo.type* %.tmp6239, %m1772$.AssignableInfo.type** %info
%.tmp6240 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6241 = load i8, i8* @SCOPE_CONST
%.tmp6242 = load i8*, i8** %abspath
call void(%m1772$.AssignableInfo.type*,i8,i8*) @m1772$set_assignable_id.v.m1772$.AssignableInfo.typep.c.cp(%m1772$.AssignableInfo.type* %.tmp6240, i8 %.tmp6241, i8* %.tmp6242)
%.tmp6243 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6244 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6243, i32 0, i32 2
%.tmp6246 = getelementptr [7 x i8], [7 x i8]*@.str6245, i32 0, i32 0
store i8* %.tmp6246, i8** %.tmp6244
%.tmp6247 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
%.tmp6248 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6247, i32 0, i32 3
store %m1772$.Type.type* null, %m1772$.Type.type** %.tmp6248
%.tmp6249 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6250 = load i8*, i8** %as_name
%.tmp6251 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %info
call void(%m1772$.CompilerCtx.type*,i8*,%m1772$.AssignableInfo.type*) @m1772$define_assignable.v.m1772$.CompilerCtx.typep.cp.m1772$.AssignableInfo.typep(%m1772$.CompilerCtx.type* %.tmp6249, i8* %.tmp6250, %m1772$.AssignableInfo.type* %.tmp6251)
ret void
}
define void @m1772$append_global.v.m1772$.CompilerCtx.typep.m1772$.GlobalName.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%g = alloca %m1772$.GlobalName.type*
store %m1772$.GlobalName.type* %.g.arg, %m1772$.GlobalName.type** %g
%.tmp6252 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6253 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6252, i32 0, i32 3
%.tmp6254 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %.tmp6253
%.tmp6255 = icmp eq %m1772$.GlobalName.type* %.tmp6254, null
br i1 %.tmp6255, label %.if.true.6256, label %.if.false.6256
.if.true.6256:
%.tmp6257 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6258 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6257, i32 0, i32 3
%.tmp6259 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
store %m1772$.GlobalName.type* %.tmp6259, %m1772$.GlobalName.type** %.tmp6258
br label %.if.end.6256
.if.false.6256:
%last_global = alloca %m1772$.GlobalName.type*
%.tmp6261 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6262 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6261, i32 0, i32 3
%.tmp6263 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %.tmp6262
store %m1772$.GlobalName.type* %.tmp6263, %m1772$.GlobalName.type** %last_global
br label %.for.start.6260
.for.start.6260:
%.tmp6264 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %last_global
%.tmp6265 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6264, i32 0, i32 4
%.tmp6266 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %.tmp6265
%.tmp6267 = icmp ne %m1772$.GlobalName.type* %.tmp6266, null
br i1 %.tmp6267, label %.for.continue.6260, label %.for.end.6260
.for.continue.6260:
%.tmp6268 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %last_global
%.tmp6269 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6268, i32 0, i32 4
%.tmp6270 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %.tmp6269
store %m1772$.GlobalName.type* %.tmp6270, %m1772$.GlobalName.type** %last_global
br label %.for.start.6260
.for.end.6260:
%.tmp6271 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %last_global
%.tmp6272 = getelementptr %m1772$.GlobalName.type, %m1772$.GlobalName.type* %.tmp6271, i32 0, i32 4
%.tmp6273 = load %m1772$.GlobalName.type*, %m1772$.GlobalName.type** %g
store %m1772$.GlobalName.type* %.tmp6273, %m1772$.GlobalName.type** %.tmp6272
br label %.if.end.6256
.if.end.6256:
ret void
}
define i8* @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.Type.type* %.type.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.type.arg, %m1772$.Type.type** %type
%.tmp6274 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6275 = icmp eq %m1772$.Type.type* %.tmp6274, null
br i1 %.tmp6275, label %.if.true.6276, label %.if.false.6276
.if.true.6276:
%.tmp6277 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6277, label %.if.true.6278, label %.if.false.6278
.if.true.6278:
%.tmp6280 = getelementptr [44 x i8], [44 x i8]*@.str6279, i32 0, i32 0
%.tmp6281 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6282 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6281, i32 0, i32 6
%.tmp6283 = load i8*, i8** %.tmp6282
%.tmp6284 = call i32(i8*,...) @printf(i8* %.tmp6280, i8* %.tmp6283)
br label %.if.end.6278
.if.false.6278:
br label %.if.end.6278
.if.end.6278:
%.tmp6286 = getelementptr [2 x i8], [2 x i8]*@.str6285, i32 0, i32 0
ret i8* %.tmp6286
br label %.if.end.6276
.if.false.6276:
br label %.if.end.6276
.if.end.6276:
%.tmp6287 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6288 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6287, i32 0, i32 0
%.tmp6289 = load i8*, i8** %.tmp6288
%.tmp6290 = icmp ne i8* %.tmp6289, null
%.tmp6292 = getelementptr [59 x i8], [59 x i8]*@.str6291, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6290, i8* %.tmp6292)
%buf = alloca i8*
%.tmp6293 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6294 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6293, i32 0, i32 0
%.tmp6295 = load i8*, i8** %.tmp6294
%.tmp6297 = getelementptr [4 x i8], [4 x i8]*@.str6296, i32 0, i32 0
%.tmp6298 = call i32(i8*,i8*) @strcmp(i8* %.tmp6295, i8* %.tmp6297)
%.tmp6299 = icmp eq i32 %.tmp6298, 0
br i1 %.tmp6299, label %.if.true.6300, label %.if.false.6300
.if.true.6300:
%.tmp6302 = getelementptr [4 x i8], [4 x i8]*@.str6301, i32 0, i32 0
ret i8* %.tmp6302
br label %.if.end.6300
.if.false.6300:
%.tmp6303 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6304 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6303, i32 0, i32 0
%.tmp6305 = load i8*, i8** %.tmp6304
%.tmp6307 = getelementptr [5 x i8], [5 x i8]*@.str6306, i32 0, i32 0
%.tmp6308 = call i32(i8*,i8*) @strcmp(i8* %.tmp6305, i8* %.tmp6307)
%.tmp6309 = icmp eq i32 %.tmp6308, 0
br i1 %.tmp6309, label %.if.true.6310, label %.if.false.6310
.if.true.6310:
%.tmp6312 = getelementptr [5 x i8], [5 x i8]*@.str6311, i32 0, i32 0
ret i8* %.tmp6312
br label %.if.end.6310
.if.false.6310:
%.tmp6313 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6314 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6313, i32 0, i32 0
%.tmp6315 = load i8*, i8** %.tmp6314
%.tmp6317 = getelementptr [5 x i8], [5 x i8]*@.str6316, i32 0, i32 0
%.tmp6318 = call i32(i8*,i8*) @strcmp(i8* %.tmp6315, i8* %.tmp6317)
%.tmp6319 = icmp eq i32 %.tmp6318, 0
br i1 %.tmp6319, label %.if.true.6320, label %.if.false.6320
.if.true.6320:
%.tmp6322 = getelementptr [3 x i8], [3 x i8]*@.str6321, i32 0, i32 0
ret i8* %.tmp6322
br label %.if.end.6320
.if.false.6320:
%.tmp6323 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6324 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6323, i32 0, i32 0
%.tmp6325 = load i8*, i8** %.tmp6324
%.tmp6327 = getelementptr [8 x i8], [8 x i8]*@.str6326, i32 0, i32 0
%.tmp6328 = call i32(i8*,i8*) @strcmp(i8* %.tmp6325, i8* %.tmp6327)
%.tmp6329 = icmp eq i32 %.tmp6328, 0
br i1 %.tmp6329, label %.if.true.6330, label %.if.false.6330
.if.true.6330:
%.tmp6332 = getelementptr [4 x i8], [4 x i8]*@.str6331, i32 0, i32 0
ret i8* %.tmp6332
br label %.if.end.6330
.if.false.6330:
%.tmp6333 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6334 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6333, i32 0, i32 0
%.tmp6335 = load i8*, i8** %.tmp6334
%.tmp6337 = getelementptr [4 x i8], [4 x i8]*@.str6336, i32 0, i32 0
%.tmp6338 = call i32(i8*,i8*) @strcmp(i8* %.tmp6335, i8* %.tmp6337)
%.tmp6339 = icmp eq i32 %.tmp6338, 0
br i1 %.tmp6339, label %.if.true.6340, label %.if.false.6340
.if.true.6340:
%.tmp6342 = getelementptr [3 x i8], [3 x i8]*@.str6341, i32 0, i32 0
ret i8* %.tmp6342
br label %.if.end.6340
.if.false.6340:
%.tmp6343 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6344 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6343, i32 0, i32 0
%.tmp6345 = load i8*, i8** %.tmp6344
%.tmp6347 = getelementptr [9 x i8], [9 x i8]*@.str6346, i32 0, i32 0
%.tmp6348 = call i32(i8*,i8*) @strcmp(i8* %.tmp6345, i8* %.tmp6347)
%.tmp6349 = icmp eq i32 %.tmp6348, 0
br i1 %.tmp6349, label %.if.true.6350, label %.if.false.6350
.if.true.6350:
%.tmp6351 = getelementptr i8*, i8** %buf, i32 0
%.tmp6353 = getelementptr [4 x i8], [4 x i8]*@.str6352, i32 0, i32 0
%.tmp6354 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6355 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6356 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6355, i32 0, i32 3
%.tmp6357 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6356
%.tmp6358 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp6354, %m1772$.Type.type* %.tmp6357)
%.tmp6359 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6351, i8* %.tmp6353, i8* %.tmp6358)
%.tmp6361 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6362 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6361, i32 0, i32 3
%.tmp6363 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6362
%.tmp6364 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6363, i32 0, i32 4
%.tmp6365 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6364
%p = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6365, %m1772$.Type.type** %p
br label %.for.start.6360
.for.start.6360:
%.tmp6366 = load %m1772$.Type.type*, %m1772$.Type.type** %p
%.tmp6367 = icmp ne %m1772$.Type.type* %.tmp6366, null
br i1 %.tmp6367, label %.for.continue.6360, label %.for.end.6360
.for.continue.6360:
%.tmp6368 = load %m1772$.Type.type*, %m1772$.Type.type** %p
%.tmp6369 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6370 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6369, i32 0, i32 3
%.tmp6371 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6370
%.tmp6372 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6371, i32 0, i32 4
%.tmp6373 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6372
%.tmp6374 = icmp ne %m1772$.Type.type* %.tmp6368, %.tmp6373
br i1 %.tmp6374, label %.if.true.6375, label %.if.false.6375
.if.true.6375:
%.tmp6376 = getelementptr i8*, i8** %buf, i32 0
%.tmp6378 = getelementptr [4 x i8], [4 x i8]*@.str6377, i32 0, i32 0
%.tmp6379 = load i8*, i8** %buf
%.tmp6380 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6376, i8* %.tmp6378, i8* %.tmp6379)
br label %.if.end.6375
.if.false.6375:
br label %.if.end.6375
.if.end.6375:
%.tmp6381 = getelementptr i8*, i8** %buf, i32 0
%.tmp6383 = getelementptr [5 x i8], [5 x i8]*@.str6382, i32 0, i32 0
%.tmp6384 = load i8*, i8** %buf
%.tmp6385 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6386 = load %m1772$.Type.type*, %m1772$.Type.type** %p
%.tmp6387 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp6385, %m1772$.Type.type* %.tmp6386)
%.tmp6388 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6381, i8* %.tmp6383, i8* %.tmp6384, i8* %.tmp6387)
%.tmp6389 = load %m1772$.Type.type*, %m1772$.Type.type** %p
%.tmp6390 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6389, i32 0, i32 4
%.tmp6391 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6390
store %m1772$.Type.type* %.tmp6391, %m1772$.Type.type** %p
br label %.for.start.6360
.for.end.6360:
%.tmp6392 = getelementptr i8*, i8** %buf, i32 0
%.tmp6394 = getelementptr [4 x i8], [4 x i8]*@.str6393, i32 0, i32 0
%.tmp6395 = load i8*, i8** %buf
%.tmp6396 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6392, i8* %.tmp6394, i8* %.tmp6395)
%.tmp6397 = load i8*, i8** %buf
ret i8* %.tmp6397
br label %.if.end.6350
.if.false.6350:
%.tmp6398 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6399 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6398, i32 0, i32 0
%.tmp6400 = load i8*, i8** %.tmp6399
%.tmp6402 = getelementptr [4 x i8], [4 x i8]*@.str6401, i32 0, i32 0
%.tmp6403 = call i32(i8*,i8*) @strcmp(i8* %.tmp6400, i8* %.tmp6402)
%.tmp6404 = icmp eq i32 %.tmp6403, 0
br i1 %.tmp6404, label %.if.true.6405, label %.if.false.6405
.if.true.6405:
%.tmp6406 = getelementptr i8*, i8** %buf, i32 0
%.tmp6408 = getelementptr [4 x i8], [4 x i8]*@.str6407, i32 0, i32 0
%.tmp6409 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6410 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6411 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6410, i32 0, i32 3
%.tmp6412 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6411
%.tmp6413 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp6409, %m1772$.Type.type* %.tmp6412)
%.tmp6414 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6406, i8* %.tmp6408, i8* %.tmp6413)
%.tmp6415 = load i8*, i8** %buf
ret i8* %.tmp6415
br label %.if.end.6405
.if.false.6405:
%.tmp6416 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6417 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6416, i32 0, i32 0
%.tmp6418 = load i8*, i8** %.tmp6417
%.tmp6420 = getelementptr [7 x i8], [7 x i8]*@.str6419, i32 0, i32 0
%.tmp6421 = call i32(i8*,i8*) @strcmp(i8* %.tmp6418, i8* %.tmp6420)
%.tmp6422 = icmp eq i32 %.tmp6421, 0
br i1 %.tmp6422, label %.if.true.6423, label %.if.false.6423
.if.true.6423:
%.tmp6424 = getelementptr i8*, i8** %buf, i32 0
%.tmp6426 = getelementptr [2 x i8], [2 x i8]*@.str6425, i32 0, i32 0
%.tmp6427 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6424, i8* %.tmp6426)
%.tmp6429 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6430 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6429, i32 0, i32 3
%.tmp6431 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6430
%t = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6431, %m1772$.Type.type** %t
br label %.for.start.6428
.for.start.6428:
%.tmp6432 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6433 = icmp ne %m1772$.Type.type* %.tmp6432, null
br i1 %.tmp6433, label %.for.continue.6428, label %.for.end.6428
.for.continue.6428:
%.tmp6434 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6435 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6436 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6435, i32 0, i32 3
%.tmp6437 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6436
%.tmp6438 = icmp ne %m1772$.Type.type* %.tmp6434, %.tmp6437
br i1 %.tmp6438, label %.if.true.6439, label %.if.false.6439
.if.true.6439:
%.tmp6440 = getelementptr i8*, i8** %buf, i32 0
%.tmp6442 = getelementptr [4 x i8], [4 x i8]*@.str6441, i32 0, i32 0
%.tmp6443 = load i8*, i8** %buf
%.tmp6444 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6440, i8* %.tmp6442, i8* %.tmp6443)
br label %.if.end.6439
.if.false.6439:
br label %.if.end.6439
.if.end.6439:
%.tmp6445 = getelementptr i8*, i8** %buf, i32 0
%.tmp6447 = getelementptr [5 x i8], [5 x i8]*@.str6446, i32 0, i32 0
%.tmp6448 = load i8*, i8** %buf
%.tmp6449 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6450 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6451 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp6449, %m1772$.Type.type* %.tmp6450)
%.tmp6452 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6445, i8* %.tmp6447, i8* %.tmp6448, i8* %.tmp6451)
%.tmp6453 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6454 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6453, i32 0, i32 4
%.tmp6455 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6454
store %m1772$.Type.type* %.tmp6455, %m1772$.Type.type** %t
br label %.for.start.6428
.for.end.6428:
%.tmp6456 = getelementptr i8*, i8** %buf, i32 0
%.tmp6458 = getelementptr [4 x i8], [4 x i8]*@.str6457, i32 0, i32 0
%.tmp6459 = load i8*, i8** %buf
%.tmp6460 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6456, i8* %.tmp6458, i8* %.tmp6459)
%.tmp6461 = load i8*, i8** %buf
ret i8* %.tmp6461
br label %.if.end.6423
.if.false.6423:
%.tmp6462 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6463 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6462, i32 0, i32 0
%.tmp6464 = load i8*, i8** %.tmp6463
%.tmp6466 = getelementptr [6 x i8], [6 x i8]*@.str6465, i32 0, i32 0
%.tmp6467 = call i32(i8*,i8*) @strcmp(i8* %.tmp6464, i8* %.tmp6466)
%.tmp6468 = icmp eq i32 %.tmp6467, 0
br i1 %.tmp6468, label %.if.true.6469, label %.if.false.6469
.if.true.6469:
%.tmp6470 = getelementptr i8*, i8** %buf, i32 0
%.tmp6472 = getelementptr [10 x i8], [10 x i8]*@.str6471, i32 0, i32 0
%.tmp6473 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6474 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6473, i32 0, i32 3
%.tmp6475 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6474
%.tmp6476 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6475, i32 0, i32 4
%.tmp6477 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6476
%.tmp6478 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6477, i32 0, i32 0
%.tmp6479 = load i8*, i8** %.tmp6478
%.tmp6480 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6481 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6482 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6481, i32 0, i32 3
%.tmp6483 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6482
%.tmp6484 = call i8*(%m1772$.CompilerCtx.type*,%m1772$.Type.type*) @m1772$type_repr.cp.m1772$.CompilerCtx.typep.m1772$.Type.typep(%m1772$.CompilerCtx.type* %.tmp6480, %m1772$.Type.type* %.tmp6483)
%.tmp6485 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6470, i8* %.tmp6472, i8* %.tmp6479, i8* %.tmp6484)
%.tmp6486 = load i8*, i8** %buf
ret i8* %.tmp6486
br label %.if.end.6469
.if.false.6469:
%.tmp6487 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6488 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6487, i32 0, i32 0
%.tmp6489 = load i8*, i8** %.tmp6488
%.tmp6491 = getelementptr [10 x i8], [10 x i8]*@.str6490, i32 0, i32 0
%.tmp6492 = call i32(i8*,i8*) @strcmp(i8* %.tmp6489, i8* %.tmp6491)
%.tmp6493 = icmp eq i32 %.tmp6492, 0
br i1 %.tmp6493, label %.if.true.6494, label %.if.false.6494
.if.true.6494:
%.tmp6495 = getelementptr i8*, i8** %buf, i32 0
%.tmp6497 = getelementptr [5 x i8], [5 x i8]*@.str6496, i32 0, i32 0
%.tmp6498 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6499 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6498, i32 0, i32 2
%.tmp6500 = load i8*, i8** %.tmp6499
%.tmp6501 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6495, i8* %.tmp6497, i8* %.tmp6500)
%.tmp6502 = load i8*, i8** %buf
ret i8* %.tmp6502
br label %.if.end.6494
.if.false.6494:
%.tmp6503 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6504 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6503, i32 0, i32 0
%.tmp6505 = load i8*, i8** %.tmp6504
%.tmp6507 = getelementptr [7 x i8], [7 x i8]*@.str6506, i32 0, i32 0
%.tmp6508 = call i32(i8*,i8*) @strcmp(i8* %.tmp6505, i8* %.tmp6507)
%.tmp6509 = icmp eq i32 %.tmp6508, 0
br i1 %.tmp6509, label %.if.true.6510, label %.if.false.6510
.if.true.6510:
%.tmp6512 = getelementptr [4 x i8], [4 x i8]*@.str6511, i32 0, i32 0
ret i8* %.tmp6512
br label %.if.end.6510
.if.false.6510:
%.tmp6513 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6514 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6513, i32 0, i32 0
%.tmp6515 = load i8*, i8** %.tmp6514
%.tmp6517 = getelementptr [6 x i8], [6 x i8]*@.str6516, i32 0, i32 0
%.tmp6518 = call i32(i8*,i8*) @strcmp(i8* %.tmp6515, i8* %.tmp6517)
%.tmp6519 = icmp eq i32 %.tmp6518, 0
br i1 %.tmp6519, label %.if.true.6520, label %.if.false.6520
.if.true.6520:
br label %.if.end.6520
.if.false.6520:
%.tmp6522 = getelementptr [58 x i8], [58 x i8]*@.str6521, i32 0, i32 0
%.tmp6523 = load %m1772$.Type.type*, %m1772$.Type.type** %type
%.tmp6524 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6523, i32 0, i32 0
%.tmp6525 = load i8*, i8** %.tmp6524
%.tmp6526 = call i32(i8*,...) @printf(i8* %.tmp6522, i8* %.tmp6525)
br label %.if.end.6520
.if.end.6520:
br label %.if.end.6510
.if.end.6510:
br label %.if.end.6494
.if.end.6494:
br label %.if.end.6469
.if.end.6469:
br label %.if.end.6423
.if.end.6423:
br label %.if.end.6405
.if.end.6405:
br label %.if.end.6350
.if.end.6350:
br label %.if.end.6340
.if.end.6340:
br label %.if.end.6330
.if.end.6330:
br label %.if.end.6320
.if.end.6320:
br label %.if.end.6310
.if.end.6310:
br label %.if.end.6300
.if.end.6300:
%.tmp6527 = bitcast ptr null to i8*
ret i8* %.tmp6527
}
define void @m1772$append_error.v.m1772$.CompilerCtx.typep.m717$.Error.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m717$.Error.type* %.e.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp6528 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* null, i32 1
%.tmp6529 = ptrtoint %m1772$.ErrorList.type* %.tmp6528 to i32
%.tmp6530 = call i8*(i32) @malloc(i32 %.tmp6529)
%.tmp6531 = bitcast i8* %.tmp6530 to %m1772$.ErrorList.type*
%new_err = alloca %m1772$.ErrorList.type*
store %m1772$.ErrorList.type* %.tmp6531, %m1772$.ErrorList.type** %new_err
%.tmp6532 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %new_err
%.tmp6533 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp6532, i32 0, i32 0
%.tmp6534 = load %m717$.Error.type*, %m717$.Error.type** %e
store %m717$.Error.type* %.tmp6534, %m717$.Error.type** %.tmp6533
%.tmp6535 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %new_err
%.tmp6536 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp6535, i32 0, i32 1
store %m1772$.ErrorList.type* null, %m1772$.ErrorList.type** %.tmp6536
%.tmp6537 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6538 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6537, i32 0, i32 2
%.tmp6539 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp6538
%.tmp6540 = icmp eq %m1772$.ErrorList.type* %.tmp6539, null
br i1 %.tmp6540, label %.if.true.6541, label %.if.false.6541
.if.true.6541:
%.tmp6542 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6543 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6542, i32 0, i32 2
%.tmp6544 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %new_err
store %m1772$.ErrorList.type* %.tmp6544, %m1772$.ErrorList.type** %.tmp6543
ret void
br label %.if.end.6541
.if.false.6541:
br label %.if.end.6541
.if.end.6541:
%.tmp6546 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6547 = getelementptr %m1772$.CompilerCtx.type, %m1772$.CompilerCtx.type* %.tmp6546, i32 0, i32 2
%.tmp6548 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp6547
%last = alloca %m1772$.ErrorList.type*
store %m1772$.ErrorList.type* %.tmp6548, %m1772$.ErrorList.type** %last
br label %.for.start.6545
.for.start.6545:
%.tmp6549 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %last
%.tmp6550 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp6549, i32 0, i32 1
%.tmp6551 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp6550
%.tmp6552 = icmp ne %m1772$.ErrorList.type* %.tmp6551, null
br i1 %.tmp6552, label %.for.continue.6545, label %.for.end.6545
.for.continue.6545:
%.tmp6553 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %last
%.tmp6554 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp6553, i32 0, i32 1
%.tmp6555 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %.tmp6554
store %m1772$.ErrorList.type* %.tmp6555, %m1772$.ErrorList.type** %last
br label %.for.start.6545
.for.end.6545:
%.tmp6556 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %last
%.tmp6557 = getelementptr %m1772$.ErrorList.type, %m1772$.ErrorList.type* %.tmp6556, i32 0, i32 1
%.tmp6558 = load %m1772$.ErrorList.type*, %m1772$.ErrorList.type** %new_err
store %m1772$.ErrorList.type* %.tmp6558, %m1772$.ErrorList.type** %.tmp6557
ret void
}
define i8* @m1772$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6559 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6560 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6559, i32 0, i32 6
%.tmp6561 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6560
%.tmp6562 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6561, i32 0, i32 7
%.tmp6563 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6562
%.tmp6564 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6563, i32 0, i32 1
%.tmp6565 = load i8*, i8** %.tmp6564
ret i8* %.tmp6565
}
define %m286$.Node.type* @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6567 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6567, %m286$.Node.type** %n
br label %.for.start.6566
.for.start.6566:
%.tmp6568 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6569 = icmp ne %m286$.Node.type* %.tmp6568, null
br i1 %.tmp6569, label %.for.continue.6566, label %.for.end.6566
.for.continue.6566:
%.tmp6570 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6571 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6570, i32 0, i32 0
%.tmp6572 = load i8*, i8** %.tmp6571
%.tmp6573 = load i8*, i8** %type
%.tmp6574 = call i32(i8*,i8*) @strcmp(i8* %.tmp6572, i8* %.tmp6573)
%.tmp6575 = icmp eq i32 %.tmp6574, 0
br i1 %.tmp6575, label %.if.true.6576, label %.if.false.6576
.if.true.6576:
%.tmp6577 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6577
br label %.if.end.6576
.if.false.6576:
br label %.if.end.6576
.if.end.6576:
%.tmp6578 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6579 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6578, i32 0, i32 7
%.tmp6580 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6579
store %m286$.Node.type* %.tmp6580, %m286$.Node.type** %n
br label %.for.start.6566
.for.end.6566:
%.tmp6581 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6581
}
define %m1772$.Type.type* @m1772$syn_function_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6582 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%function_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6582, %m1772$.Type.type** %function_type
%.tmp6583 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6584 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6585 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6584, i32 0, i32 6
%.tmp6586 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6585
%.tmp6587 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp6583, %m286$.Node.type* %.tmp6586)
%return_value_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6587, %m1772$.Type.type** %return_value_type
%.tmp6588 = load %m1772$.Type.type*, %m1772$.Type.type** %function_type
%.tmp6589 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6588, i32 0, i32 0
%.tmp6591 = getelementptr [9 x i8], [9 x i8]*@.str6590, i32 0, i32 0
store i8* %.tmp6591, i8** %.tmp6589
%.tmp6592 = load %m1772$.Type.type*, %m1772$.Type.type** %function_type
%.tmp6593 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6592, i32 0, i32 3
%.tmp6594 = load %m1772$.Type.type*, %m1772$.Type.type** %return_value_type
store %m1772$.Type.type* %.tmp6594, %m1772$.Type.type** %.tmp6593
%.tmp6595 = load %m1772$.Type.type*, %m1772$.Type.type** %return_value_type
%last_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6595, %m1772$.Type.type** %last_type
%.tmp6596 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6597 = call %m286$.Node.type*(%m286$.Node.type*) @m1772$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6596)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6597, %m286$.Node.type** %params
%.tmp6599 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6599, %m286$.Node.type** %param_ptr
br label %.for.start.6598
.for.start.6598:
%.tmp6600 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6601 = icmp ne %m286$.Node.type* %.tmp6600, null
br i1 %.tmp6601, label %.for.continue.6598, label %.for.end.6598
.for.continue.6598:
%.tmp6602 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6603 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6602, i32 0, i32 0
%.tmp6604 = load i8*, i8** %.tmp6603
%.tmp6606 = getelementptr [5 x i8], [5 x i8]*@.str6605, i32 0, i32 0
%.tmp6607 = call i32(i8*,i8*) @strcmp(i8* %.tmp6604, i8* %.tmp6606)
%.tmp6608 = icmp eq i32 %.tmp6607, 0
br i1 %.tmp6608, label %.if.true.6609, label %.if.false.6609
.if.true.6609:
%.tmp6610 = load %m1772$.Type.type*, %m1772$.Type.type** %last_type
%.tmp6611 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6610, i32 0, i32 4
%.tmp6612 = load %m1772$.Type.type*, %m1772$.Type.type** %last_type
%.tmp6613 = call %m1772$.Type.type*(%m1772$.Type.type*) @m1772$type_clone.m1772$.Type.typep.m1772$.Type.typep(%m1772$.Type.type* %.tmp6612)
store %m1772$.Type.type* %.tmp6613, %m1772$.Type.type** %.tmp6611
%.tmp6614 = load %m1772$.Type.type*, %m1772$.Type.type** %last_type
%.tmp6615 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6614, i32 0, i32 4
%.tmp6616 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6615
%.tmp6617 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6616, i32 0, i32 4
store %m1772$.Type.type* null, %m1772$.Type.type** %.tmp6617
%.tmp6618 = load %m1772$.Type.type*, %m1772$.Type.type** %last_type
%.tmp6619 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6618, i32 0, i32 4
%.tmp6620 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6619
store %m1772$.Type.type* %.tmp6620, %m1772$.Type.type** %last_type
%.tmp6621 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6622 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6621, i32 0, i32 7
%.tmp6623 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6622
%.tmp6624 = icmp ne %m286$.Node.type* %.tmp6623, null
br i1 %.tmp6624, label %.if.true.6625, label %.if.false.6625
.if.true.6625:
%.tmp6626 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6627 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6626, i32 0, i32 7
%.tmp6628 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6627
store %m286$.Node.type* %.tmp6628, %m286$.Node.type** %param_ptr
br label %.if.end.6625
.if.false.6625:
br label %.if.end.6625
.if.end.6625:
%.tmp6629 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6630 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6629, i32 0, i32 7
%.tmp6631 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6630
%.tmp6632 = icmp ne %m286$.Node.type* %.tmp6631, null
br i1 %.tmp6632, label %.if.true.6633, label %.if.false.6633
.if.true.6633:
%.tmp6634 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6635 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6634, i32 0, i32 7
%.tmp6636 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6635
store %m286$.Node.type* %.tmp6636, %m286$.Node.type** %param_ptr
br label %.if.end.6633
.if.false.6633:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6633
.if.end.6633:
br label %.if.end.6609
.if.false.6609:
%.tmp6637 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6638 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6639 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6638, i32 0, i32 6
%.tmp6640 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6639
%.tmp6641 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp6637, %m286$.Node.type* %.tmp6640)
%param_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6641, %m1772$.Type.type** %param_type
%.tmp6642 = load %m1772$.Type.type*, %m1772$.Type.type** %last_type
%.tmp6643 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6642, i32 0, i32 4
%.tmp6644 = load %m1772$.Type.type*, %m1772$.Type.type** %param_type
store %m1772$.Type.type* %.tmp6644, %m1772$.Type.type** %.tmp6643
%.tmp6645 = load %m1772$.Type.type*, %m1772$.Type.type** %param_type
store %m1772$.Type.type* %.tmp6645, %m1772$.Type.type** %last_type
%.tmp6646 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6647 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6646, i32 0, i32 7
%.tmp6648 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6647
store %m286$.Node.type* %.tmp6648, %m286$.Node.type** %param_ptr
%.tmp6649 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6650 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6649, i32 0, i32 7
%.tmp6651 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6650
%.tmp6652 = icmp ne %m286$.Node.type* %.tmp6651, null
br i1 %.tmp6652, label %.if.true.6653, label %.if.false.6653
.if.true.6653:
%.tmp6654 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6655 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6654, i32 0, i32 7
%.tmp6656 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6655
%.tmp6657 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6656, i32 0, i32 7
%.tmp6658 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6657
store %m286$.Node.type* %.tmp6658, %m286$.Node.type** %param_ptr
br label %.if.end.6653
.if.false.6653:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6653
.if.end.6653:
br label %.if.end.6609
.if.end.6609:
br label %.for.start.6598
.for.end.6598:
%.tmp6659 = load %m1772$.Type.type*, %m1772$.Type.type** %function_type
ret %m1772$.Type.type* %.tmp6659
}
define %m286$.Node.type* @m1772$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6660 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6662 = getelementptr [10 x i8], [10 x i8]*@.str6661, i32 0, i32 0
%.tmp6663 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6660, i8* %.tmp6662)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6663, %m286$.Node.type** %params
%.tmp6664 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6665 = icmp eq %m286$.Node.type* %.tmp6664, null
br i1 %.tmp6665, label %.if.true.6666, label %.if.false.6666
.if.true.6666:
%.tmp6667 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6667
br label %.if.end.6666
.if.false.6666:
br label %.if.end.6666
.if.end.6666:
%.tmp6668 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6669 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6668, i32 0, i32 6
%.tmp6670 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6669
ret %m286$.Node.type* %.tmp6670
}
define %m1772$.Type.type* @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.ctx.arg, %m1772$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6671 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%t = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6671, %m1772$.Type.type** %t
%.tmp6672 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6673 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6672, i32 0, i32 0
%.tmp6674 = load i8*, i8** %.tmp6673
%.tmp6676 = getelementptr [10 x i8], [10 x i8]*@.str6675, i32 0, i32 0
%.tmp6677 = call i32(i8*,i8*) @strcmp(i8* %.tmp6674, i8* %.tmp6676)
%.tmp6678 = icmp eq i32 %.tmp6677, 0
br i1 %.tmp6678, label %.if.true.6679, label %.if.false.6679
.if.true.6679:
%.tmp6680 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6681 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6680, i32 0, i32 0
%.tmp6683 = getelementptr [7 x i8], [7 x i8]*@.str6682, i32 0, i32 0
store i8* %.tmp6683, i8** %.tmp6681
%.tmp6684 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6685 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6684, i32 0, i32 1
store i8* null, i8** %.tmp6685
%.tmp6686 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6687 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6686, i32 0, i32 6
%.tmp6688 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6687
%.tmp6690 = getelementptr [5 x i8], [5 x i8]*@.str6689, i32 0, i32 0
%.tmp6691 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6688, i8* %.tmp6690)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6691, %m286$.Node.type** %curr_type
%.tmp6692 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6693 = icmp ne %m286$.Node.type* %.tmp6692, null
br i1 %.tmp6693, label %.if.true.6694, label %.if.false.6694
.if.true.6694:
%.tmp6695 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6696 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6695, i32 0, i32 3
%.tmp6697 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6698 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6699 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6698, i32 0, i32 6
%.tmp6700 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6699
%.tmp6701 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp6697, %m286$.Node.type* %.tmp6700)
store %m1772$.Type.type* %.tmp6701, %m1772$.Type.type** %.tmp6696
%.tmp6702 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6703 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6702, i32 0, i32 3
%.tmp6704 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6703
%.tmp6705 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6704, i32 0, i32 1
%.tmp6706 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6707 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6706, i32 0, i32 7
%.tmp6708 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6707
%.tmp6709 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6708, i32 0, i32 1
%.tmp6710 = load i8*, i8** %.tmp6709
store i8* %.tmp6710, i8** %.tmp6705
%.tmp6711 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6712 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6711, i32 0, i32 3
%.tmp6713 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6712
%curr_t = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6713, %m1772$.Type.type** %curr_t
%.tmp6715 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6716 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6715, i32 0, i32 7
%.tmp6717 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6716
%.tmp6719 = getelementptr [5 x i8], [5 x i8]*@.str6718, i32 0, i32 0
%.tmp6720 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6717, i8* %.tmp6719)
store %m286$.Node.type* %.tmp6720, %m286$.Node.type** %curr_type
br label %.for.start.6714
.for.start.6714:
%.tmp6721 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6722 = icmp ne %m286$.Node.type* %.tmp6721, null
br i1 %.tmp6722, label %.for.continue.6714, label %.for.end.6714
.for.continue.6714:
%.tmp6723 = load %m1772$.Type.type*, %m1772$.Type.type** %curr_t
%.tmp6724 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6723, i32 0, i32 4
%.tmp6725 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6726 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6727 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6726, i32 0, i32 6
%.tmp6728 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6727
%.tmp6729 = call %m1772$.Type.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$node_to_type.m1772$.Type.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp6725, %m286$.Node.type* %.tmp6728)
store %m1772$.Type.type* %.tmp6729, %m1772$.Type.type** %.tmp6724
%.tmp6730 = load %m1772$.Type.type*, %m1772$.Type.type** %curr_t
%.tmp6731 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6730, i32 0, i32 4
%.tmp6732 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6731
%.tmp6733 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6732, i32 0, i32 1
%.tmp6734 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6735 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6734, i32 0, i32 7
%.tmp6736 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6735
%.tmp6737 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6736, i32 0, i32 1
%.tmp6738 = load i8*, i8** %.tmp6737
store i8* %.tmp6738, i8** %.tmp6733
%.tmp6739 = load %m1772$.Type.type*, %m1772$.Type.type** %curr_t
%.tmp6740 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6739, i32 0, i32 4
%.tmp6741 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6740
store %m1772$.Type.type* %.tmp6741, %m1772$.Type.type** %curr_t
%.tmp6742 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6743 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6742, i32 0, i32 7
%.tmp6744 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6743
%.tmp6746 = getelementptr [5 x i8], [5 x i8]*@.str6745, i32 0, i32 0
%.tmp6747 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1772$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6744, i8* %.tmp6746)
store %m286$.Node.type* %.tmp6747, %m286$.Node.type** %curr_type
br label %.for.start.6714
.for.end.6714:
br label %.if.end.6694
.if.false.6694:
br label %.if.end.6694
.if.end.6694:
br label %.if.end.6679
.if.false.6679:
%.tmp6748 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6749 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6748, i32 0, i32 0
%.tmp6750 = load i8*, i8** %.tmp6749
%.tmp6752 = getelementptr [12 x i8], [12 x i8]*@.str6751, i32 0, i32 0
%.tmp6753 = call i32(i8*,i8*) @strcmp(i8* %.tmp6750, i8* %.tmp6752)
%.tmp6754 = icmp eq i32 %.tmp6753, 0
br i1 %.tmp6754, label %.if.true.6755, label %.if.false.6755
.if.true.6755:
%err_msg = alloca i8*
%.tmp6756 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6757 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6758 = call %m1772$.ScopeItem.type*(%m1772$.CompilerCtx.type*,%m286$.Node.type*) @m1772$find_defined.m1772$.ScopeItem.typep.m1772$.CompilerCtx.typep.m286$.Node.typep(%m1772$.CompilerCtx.type* %.tmp6756, %m286$.Node.type* %.tmp6757)
%base = alloca %m1772$.ScopeItem.type*
store %m1772$.ScopeItem.type* %.tmp6758, %m1772$.ScopeItem.type** %base
%.tmp6759 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %base
%.tmp6760 = icmp eq %m1772$.ScopeItem.type* %.tmp6759, null
br i1 %.tmp6760, label %.if.true.6761, label %.if.false.6761
.if.true.6761:
%.tmp6762 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6764 = getelementptr [37 x i8], [37 x i8]*@.str6763, i32 0, i32 0
%.tmp6765 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6766 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6765, i32 0, i32 6
%.tmp6767 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6766
%.tmp6768 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6767, i32 0, i32 1
%.tmp6769 = load i8*, i8** %.tmp6768
%.tmp6770 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6762, i8* %.tmp6764, i8* %.tmp6769)
%.tmp6771 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6772 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6773 = load i8*, i8** %err_msg
call void(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$new_error.v.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp6771, %m286$.Node.type* %.tmp6772, i8* %.tmp6773)
%.tmp6774 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6775 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6774, i32 0, i32 0
%.tmp6777 = getelementptr [6 x i8], [6 x i8]*@.str6776, i32 0, i32 0
store i8* %.tmp6777, i8** %.tmp6775
%.tmp6778 = load %m1772$.Type.type*, %m1772$.Type.type** %t
ret %m1772$.Type.type* %.tmp6778
br label %.if.end.6761
.if.false.6761:
br label %.if.end.6761
.if.end.6761:
%.tmp6779 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6780 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6779, i32 0, i32 0
%.tmp6782 = getelementptr [10 x i8], [10 x i8]*@.str6781, i32 0, i32 0
store i8* %.tmp6782, i8** %.tmp6780
%.tmp6783 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6784 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6783, i32 0, i32 1
%.tmp6785 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %base
%.tmp6786 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp6785, i32 0, i32 0
%.tmp6787 = load i8*, i8** %.tmp6786
store i8* %.tmp6787, i8** %.tmp6784
%.tmp6788 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6789 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6788, i32 0, i32 2
%.tmp6790 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %base
%.tmp6791 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp6790, i32 0, i32 1
%.tmp6792 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp6791
%.tmp6793 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6792, i32 0, i32 0
%.tmp6794 = load i8*, i8** %.tmp6793
store i8* %.tmp6794, i8** %.tmp6789
%.tmp6795 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6796 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6795, i32 0, i32 3
%.tmp6797 = load %m1772$.ScopeItem.type*, %m1772$.ScopeItem.type** %base
%.tmp6798 = getelementptr %m1772$.ScopeItem.type, %m1772$.ScopeItem.type* %.tmp6797, i32 0, i32 1
%.tmp6799 = load %m1772$.AssignableInfo.type*, %m1772$.AssignableInfo.type** %.tmp6798
%.tmp6800 = getelementptr %m1772$.AssignableInfo.type, %m1772$.AssignableInfo.type* %.tmp6799, i32 0, i32 3
%.tmp6801 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6800
store %m1772$.Type.type* %.tmp6801, %m1772$.Type.type** %.tmp6796
br label %.if.end.6755
.if.false.6755:
%.tmp6802 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6803 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6802, i32 0, i32 1
%.tmp6804 = load i8*, i8** %.tmp6803
%.tmp6806 = getelementptr [4 x i8], [4 x i8]*@.str6805, i32 0, i32 0
%.tmp6807 = call i32(i8*,i8*) @strcmp(i8* %.tmp6804, i8* %.tmp6806)
%.tmp6808 = icmp eq i32 %.tmp6807, 0
br i1 %.tmp6808, label %.if.true.6809, label %.if.false.6809
.if.true.6809:
%.tmp6810 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6811 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6810, i32 0, i32 0
%.tmp6813 = getelementptr [4 x i8], [4 x i8]*@.str6812, i32 0, i32 0
store i8* %.tmp6813, i8** %.tmp6811
%.tmp6814 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6815 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6814, i32 0, i32 3
%.tmp6816 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
store %m1772$.Type.type* %.tmp6816, %m1772$.Type.type** %.tmp6815
%.tmp6817 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6818 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6817, i32 0, i32 3
%.tmp6819 = load %m1772$.Type.type*, %m1772$.Type.type** %.tmp6818
%.tmp6820 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6819, i32 0, i32 0
%.tmp6822 = getelementptr [4 x i8], [4 x i8]*@.str6821, i32 0, i32 0
store i8* %.tmp6822, i8** %.tmp6820
br label %.if.end.6809
.if.false.6809:
%.tmp6823 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6824 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6823, i32 0, i32 0
%.tmp6825 = load i8*, i8** %.tmp6824
%.tmp6827 = getelementptr [5 x i8], [5 x i8]*@.str6826, i32 0, i32 0
%.tmp6828 = call i32(i8*,i8*) @strcmp(i8* %.tmp6825, i8* %.tmp6827)
%.tmp6829 = icmp eq i32 %.tmp6828, 0
br i1 %.tmp6829, label %.if.true.6830, label %.if.false.6830
.if.true.6830:
%.tmp6831 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6832 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6831, i32 0, i32 0
%.tmp6833 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6833, i32 0, i32 1
%.tmp6835 = load i8*, i8** %.tmp6834
store i8* %.tmp6835, i8** %.tmp6832
br label %.if.end.6830
.if.false.6830:
%.tmp6836 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6837 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6836, i32 0, i32 1
%.tmp6838 = load i8*, i8** %.tmp6837
%.tmp6840 = getelementptr [4 x i8], [4 x i8]*@.str6839, i32 0, i32 0
%.tmp6841 = call i32(i8*,i8*) @strcmp(i8* %.tmp6838, i8* %.tmp6840)
%.tmp6842 = icmp eq i32 %.tmp6841, 0
br i1 %.tmp6842, label %.if.true.6843, label %.if.false.6843
.if.true.6843:
%.tmp6844 = load %m1772$.Type.type*, %m1772$.Type.type** %t
%.tmp6845 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6844, i32 0, i32 0
%.tmp6847 = getelementptr [7 x i8], [7 x i8]*@.str6846, i32 0, i32 0
store i8* %.tmp6847, i8** %.tmp6845
br label %.if.end.6843
.if.false.6843:
%.tmp6848 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6849 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6851 = getelementptr [54 x i8], [54 x i8]*@.str6850, i32 0, i32 0
%.tmp6852 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp6848, %m286$.Node.type* %.tmp6849, i8* %.tmp6851)
%.tmp6853 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6854 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6853, i32 0, i32 0
%.tmp6855 = load i8*, i8** %.tmp6854
%.tmp6856 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6857 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6856, i32 0, i32 1
%.tmp6858 = load i8*, i8** %.tmp6857
%.tmp6859 = call i32(i8*,...) @printf(i8* %.tmp6852, i8* %.tmp6855, i8* %.tmp6858)
%.tmp6860 = bitcast ptr null to %m1772$.Type.type*
ret %m1772$.Type.type* %.tmp6860
br label %.if.end.6843
.if.end.6843:
br label %.if.end.6830
.if.end.6830:
br label %.if.end.6809
.if.end.6809:
br label %.if.end.6755
.if.end.6755:
br label %.if.end.6679
.if.end.6679:
%.tmp6862 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6863 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6862, i32 0, i32 7
%.tmp6864 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6863
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6864, %m286$.Node.type** %ptr
br label %.for.start.6861
.for.start.6861:
%.tmp6865 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6866 = icmp ne %m286$.Node.type* %.tmp6865, null
br i1 %.tmp6866, label %.for.continue.6861, label %.for.end.6861
.for.continue.6861:
%.tmp6867 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6868 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6867, i32 0, i32 1
%.tmp6869 = load i8*, i8** %.tmp6868
%.tmp6871 = getelementptr [2 x i8], [2 x i8]*@.str6870, i32 0, i32 0
%.tmp6872 = call i32(i8*,i8*) @strcmp(i8* %.tmp6869, i8* %.tmp6871)
%.tmp6873 = icmp eq i32 %.tmp6872, 0
br i1 %.tmp6873, label %.if.true.6874, label %.if.false.6874
.if.true.6874:
%.tmp6875 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%pt = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6875, %m1772$.Type.type** %pt
%.tmp6876 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
%.tmp6877 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6876, i32 0, i32 0
%.tmp6879 = getelementptr [4 x i8], [4 x i8]*@.str6878, i32 0, i32 0
store i8* %.tmp6879, i8** %.tmp6877
%.tmp6880 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
%.tmp6881 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6880, i32 0, i32 3
%.tmp6882 = load %m1772$.Type.type*, %m1772$.Type.type** %t
store %m1772$.Type.type* %.tmp6882, %m1772$.Type.type** %.tmp6881
%.tmp6883 = load %m1772$.Type.type*, %m1772$.Type.type** %pt
store %m1772$.Type.type* %.tmp6883, %m1772$.Type.type** %t
br label %.if.end.6874
.if.false.6874:
%.tmp6884 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6885 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6884, i32 0, i32 1
%.tmp6886 = load i8*, i8** %.tmp6885
%.tmp6888 = getelementptr [2 x i8], [2 x i8]*@.str6887, i32 0, i32 0
%.tmp6889 = call i32(i8*,i8*) @strcmp(i8* %.tmp6886, i8* %.tmp6888)
%.tmp6890 = icmp eq i32 %.tmp6889, 0
br i1 %.tmp6890, label %.if.true.6891, label %.if.false.6891
.if.true.6891:
%.tmp6892 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6893 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6892, i32 0, i32 7
%.tmp6894 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6893
%.tmp6895 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6894, i32 0, i32 1
%.tmp6896 = load i8*, i8** %.tmp6895
%.tmp6898 = getelementptr [2 x i8], [2 x i8]*@.str6897, i32 0, i32 0
%.tmp6899 = call i32(i8*,i8*) @strcmp(i8* %.tmp6896, i8* %.tmp6898)
%.tmp6900 = icmp eq i32 %.tmp6899, 0
br i1 %.tmp6900, label %.if.true.6901, label %.if.false.6901
.if.true.6901:
%.tmp6902 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%slice_type = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6902, %m1772$.Type.type** %slice_type
%.tmp6903 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_type
%.tmp6904 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6903, i32 0, i32 0
%.tmp6906 = getelementptr [7 x i8], [7 x i8]*@.str6905, i32 0, i32 0
store i8* %.tmp6906, i8** %.tmp6904
%.tmp6907 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%slice_c_array = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6907, %m1772$.Type.type** %slice_c_array
%.tmp6908 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_c_array
%.tmp6909 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6908, i32 0, i32 0
%.tmp6911 = getelementptr [4 x i8], [4 x i8]*@.str6910, i32 0, i32 0
store i8* %.tmp6911, i8** %.tmp6909
%.tmp6912 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_c_array
%.tmp6913 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6912, i32 0, i32 1
%.tmp6915 = getelementptr [6 x i8], [6 x i8]*@.str6914, i32 0, i32 0
store i8* %.tmp6915, i8** %.tmp6913
%.tmp6916 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_c_array
%.tmp6917 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6916, i32 0, i32 3
%.tmp6918 = load %m1772$.Type.type*, %m1772$.Type.type** %t
store %m1772$.Type.type* %.tmp6918, %m1772$.Type.type** %.tmp6917
%.tmp6919 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_type
%.tmp6920 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6919, i32 0, i32 3
%.tmp6921 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_c_array
store %m1772$.Type.type* %.tmp6921, %m1772$.Type.type** %.tmp6920
%.tmp6922 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%slice_len = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6922, %m1772$.Type.type** %slice_len
%.tmp6923 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_len
%.tmp6924 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6923, i32 0, i32 0
%.tmp6926 = getelementptr [4 x i8], [4 x i8]*@.str6925, i32 0, i32 0
store i8* %.tmp6926, i8** %.tmp6924
%.tmp6927 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_len
%.tmp6928 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6927, i32 0, i32 1
%.tmp6930 = getelementptr [4 x i8], [4 x i8]*@.str6929, i32 0, i32 0
store i8* %.tmp6930, i8** %.tmp6928
%.tmp6931 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_c_array
%.tmp6932 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6931, i32 0, i32 4
%.tmp6933 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_len
store %m1772$.Type.type* %.tmp6933, %m1772$.Type.type** %.tmp6932
%.tmp6934 = call %m1772$.Type.type*() @m1772$new_type.m1772$.Type.typep()
%slice_cap = alloca %m1772$.Type.type*
store %m1772$.Type.type* %.tmp6934, %m1772$.Type.type** %slice_cap
%.tmp6935 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_cap
%.tmp6936 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6935, i32 0, i32 0
%.tmp6938 = getelementptr [4 x i8], [4 x i8]*@.str6937, i32 0, i32 0
store i8* %.tmp6938, i8** %.tmp6936
%.tmp6939 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_cap
%.tmp6940 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6939, i32 0, i32 1
%.tmp6942 = getelementptr [4 x i8], [4 x i8]*@.str6941, i32 0, i32 0
store i8* %.tmp6942, i8** %.tmp6940
%.tmp6943 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_len
%.tmp6944 = getelementptr %m1772$.Type.type, %m1772$.Type.type* %.tmp6943, i32 0, i32 4
%.tmp6945 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_cap
store %m1772$.Type.type* %.tmp6945, %m1772$.Type.type** %.tmp6944
%.tmp6946 = load %m1772$.Type.type*, %m1772$.Type.type** %slice_type
store %m1772$.Type.type* %.tmp6946, %m1772$.Type.type** %t
%.tmp6947 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6948 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6947, i32 0, i32 7
%.tmp6949 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6948
store %m286$.Node.type* %.tmp6949, %m286$.Node.type** %ptr
br label %.if.end.6901
.if.false.6901:
br label %.if.end.6901
.if.end.6901:
br label %.if.end.6891
.if.false.6891:
%.tmp6950 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %ctx
%.tmp6951 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6953 = getelementptr [49 x i8], [49 x i8]*@.str6952, i32 0, i32 0
%.tmp6954 = call i8*(%m1772$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1772$err_tmpl.cp.m1772$.CompilerCtx.typep.m286$.Node.typep.cp(%m1772$.CompilerCtx.type* %.tmp6950, %m286$.Node.type* %.tmp6951, i8* %.tmp6953)
%.tmp6955 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6956 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6955, i32 0, i32 1
%.tmp6957 = load i8*, i8** %.tmp6956
%.tmp6958 = call i32(i8*,...) @printf(i8* %.tmp6954, i8* %.tmp6957)
%.tmp6959 = bitcast ptr null to %m1772$.Type.type*
ret %m1772$.Type.type* %.tmp6959
br label %.if.end.6891
.if.end.6891:
br label %.if.end.6874
.if.end.6874:
%.tmp6960 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6961 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6960, i32 0, i32 7
%.tmp6962 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6961
store %m286$.Node.type* %.tmp6962, %m286$.Node.type** %ptr
br label %.for.start.6861
.for.end.6861:
%.tmp6963 = load %m1772$.Type.type*, %m1772$.Type.type** %t
ret %m1772$.Type.type* %.tmp6963
}
@.str2530 = constant [5 x i8] c"%s{\0A\00"
@.str2534 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2541 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2548 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2560 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2564 = constant [10 x i8] c"%s  of: \0A\00"
@.str2578 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2582 = constant [12 x i8] c"%s  next: \0A\00"
@.str2591 = constant [5 x i8] c"%s}\0A\00"
@.str2649 = constant [5 x i8] c"%c%s\00"
@.str2660 = constant [7 x i8] c".tmp%d\00"
@.str2738 = constant [1 x i8] c"\00"
@.str2768 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2799 = constant [6 x i8] c"start\00"
@.str2811 = constant [6 x i8] c"start\00"
@.str2823 = constant [13 x i8] c"head_comment\00"
@.str2888 = constant [7 x i8] c"string\00"
@.str2897 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2927 = constant [5 x i8] c"%s%s\00"
@.str2935 = constant [9 x i8] c"function\00"
@.str2941 = constant [5 x i8] c"main\00"
@.str2953 = constant [6 x i8] c"%s.%s\00"
@.str2970 = constant [3 x i8] c"NL\00"
@.str2978 = constant [7 x i8] c"global\00"
@.str2986 = constant [11 x i8] c"assignable\00"
@.str3014 = constant [9 x i8] c"variable\00"
@.str3025 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3040 = constant [10 x i8] c"typealias\00"
@.str3060 = constant [11 x i8] c"%s.%s.type\00"
@.str3072 = constant [10 x i8] c"typealias\00"
@.str3093 = constant [5 x i8] c"type\00"
@.str3120 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3133 = constant [7 x i8] c"extern\00"
@.str3151 = constant [7 x i8] c"extern\00"
@.str3190 = constant [15 x i8] c"declare %s %s(\00"
@.str3221 = constant [3 x i8] c", \00"
@.str3227 = constant [3 x i8] c"%s\00"
@.str3239 = constant [3 x i8] c")\0A\00"
@.str3250 = constant [9 x i8] c"function\00"
@.str3259 = constant [9 x i8] c"function\00"
@.str3296 = constant [14 x i8] c"define %s %s(\00"
@.str3322 = constant [3 x i8] c", \00"
@.str3328 = constant [5 x i8] c"type\00"
@.str3344 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3359 = constant [5 x i8] c") {\0A\00"
@.str3368 = constant [6 x i8] c"block\00"
@.str3386 = constant [3 x i8] c"NL\00"
@.str3393 = constant [9 x i8] c"OPERATOR\00"
@.str3411 = constant [7 x i8] c"return\00"
@.str3421 = constant [5 x i8] c"void\00"
@.str3428 = constant [21 x i8] c"missing return value\00"
@.str3433 = constant [10 x i8] c"ret void\0A\00"
@.str3439 = constant [3 x i8] c"}\0A\00"
@.str3445 = constant [7 x i8] c"import\00"
@.str3490 = constant [1 x i8] c"\00"
@.str3496 = constant [6 x i8] c"%s.bn\00"
@.str3501 = constant [9 x i8] c"%s/%s.bn\00"
@.str3513 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3570 = constant [5 x i8] c"m%d$\00"
@.str3619 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3627 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3656 = constant [9 x i8] c"variable\00"
@.str3661 = constant [5 x i8] c"type\00"
@.str3691 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3703 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3724 = constant [11 x i8] c"expression\00"
@.str3751 = constant [7 x i8] c"sizeof\00"
@.str3757 = constant [8 x i8] c"fn_args\00"
@.str3763 = constant [11 x i8] c"assignable\00"
@.str3788 = constant [4 x i8] c"int\00"
@.str3799 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3808 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3834 = constant [35 x i8] c"unable to compile function address\00"
@.str3840 = constant [8 x i8] c"fn_args\00"
@.str3843 = constant [1 x i8] c"\00"
@.str3851 = constant [11 x i8] c"assignable\00"
@.str3863 = constant [5 x i8] c"%s, \00"
@.str3879 = constant [8 x i8] c"%s%s %s\00"
@.str3894 = constant [11 x i8] c"assignable\00"
@.str3904 = constant [5 x i8] c"void\00"
@.str3912 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str3943 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str3964 = constant [7 x i8] c"return\00"
@.str3976 = constant [3 x i8] c"NL\00"
@.str3994 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4007 = constant [10 x i8] c"ret void\0A\00"
@.str4011 = constant [3 x i8] c"NL\00"
@.str4017 = constant [8 x i8] c"fn_call\00"
@.str4028 = constant [12 x i8] c"declaration\00"
@.str4037 = constant [11 x i8] c"assignment\00"
@.str4045 = constant [11 x i8] c"assignable\00"
@.str4057 = constant [34 x i8] c"%s was not declared in this scope\00"
@.str4089 = constant [4 x i8] c"ptr\00"
@.str4098 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4108 = constant [9 x i8] c"if_block\00"
@.str4116 = constant [9 x i8] c"for_loop\00"
@.str4125 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4140 = constant [12 x i8] c"declaration\00"
@.str4151 = constant [11 x i8] c"assignment\00"
@.str4161 = constant [9 x i8] c"OPERATOR\00"
@.str4168 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4178 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4185 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4192 = constant [9 x i8] c"OPERATOR\00"
@.str4204 = constant [57 x i8] c"br %s %s, label %%.for.continue.%d, label %%.for.end.%d\0A\00"
@.str4219 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4226 = constant [9 x i8] c"OPERATOR\00"
@.str4233 = constant [6 x i8] c"block\00"
@.str4247 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4254 = constant [14 x i8] c".for.end.%d:\0A\00"
@.str4265 = constant [5 x i8] c"type\00"
@.str4280 = constant [11 x i8] c"assignable\00"
@.str4293 = constant [9 x i8] c"variable\00"
@.str4298 = constant [5 x i8] c"WORD\00"
@.str4306 = constant [31 x i8] c"unable to get declaration name\00"
@.str4358 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4374 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4386 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4421 = constant [4 x i8] c"int\00"
@.str4428 = constant [4 x i8] c"chr\00"
@.str4437 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str4446 = constant [4 x i8] c"ptr\00"
@.str4454 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4457 = constant [5 x i8] c"null\00"
@.str4465 = constant [7 x i8] c"struct\00"
@.str4486 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4506 = constant [10 x i8] c"typealias\00"
@.str4529 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4548 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str4565 = constant [11 x i8] c"assignable\00"
@.str4579 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4594 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4601 = constant [6 x i8] c"block\00"
@.str4609 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4616 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4623 = constant [11 x i8] c"elif_block\00"
@.str4634 = constant [11 x i8] c"else_block\00"
@.str4644 = constant [6 x i8] c"block\00"
@.str4654 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4661 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4681 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4689 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4738 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4759 = constant [7 x i8] c"module\00"
@.str4788 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str4830 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str4838 = constant [9 x i8] c"function\00"
@.str4845 = constant [7 x i8] c"extern\00"
@.str4857 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str4878 = constant [9 x i8] c"variable\00"
@.str4898 = constant [4 x i8] c"ptr\00"
@.str4916 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str4940 = constant [10 x i8] c"typealias\00"
@.str4951 = constant [7 x i8] c"struct\00"
@.str4957 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5008 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5028 = constant [9 x i8] c"variable\00"
@.str5038 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5059 = constant [9 x i8] c"variable\00"
@.str5067 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5079 = constant [12 x i8] c"destination\00"
@.str5084 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5110 = constant [25 x i8] c"name '%s' is not defined\00"
@.str5128 = constant [7 x i8] c"module\00"
@.str5150 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5214 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5234 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5257 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5280 = constant [16 x i8] c"mono_assignable\00"
@.str5302 = constant [5 x i8] c"cast\00"
@.str5311 = constant [5 x i8] c"type\00"
@.str5331 = constant [8 x i8] c"bitcast\00"
@.str5338 = constant [4 x i8] c"ptr\00"
@.str5345 = constant [4 x i8] c"ptr\00"
@.str5362 = constant [4 x i8] c"i%d\00"
@.str5367 = constant [4 x i8] c"i%d\00"
@.str5375 = constant [5 x i8] c"sext\00"
@.str5377 = constant [6 x i8] c"trunc\00"
@.str5382 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str5402 = constant [16 x i8] c"mono_assignable\00"
@.str5460 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5483 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5490 = constant [2 x i8] c"+\00"
@.str5495 = constant [4 x i8] c"add\00"
@.str5500 = constant [2 x i8] c"-\00"
@.str5505 = constant [4 x i8] c"sub\00"
@.str5510 = constant [2 x i8] c"*\00"
@.str5515 = constant [4 x i8] c"mul\00"
@.str5520 = constant [2 x i8] c"/\00"
@.str5525 = constant [5 x i8] c"sdiv\00"
@.str5530 = constant [3 x i8] c"==\00"
@.str5535 = constant [8 x i8] c"icmp eq\00"
@.str5540 = constant [3 x i8] c"!=\00"
@.str5545 = constant [8 x i8] c"icmp ne\00"
@.str5550 = constant [2 x i8] c">\00"
@.str5555 = constant [9 x i8] c"icmp sgt\00"
@.str5560 = constant [2 x i8] c"<\00"
@.str5565 = constant [9 x i8] c"icmp slt\00"
@.str5570 = constant [2 x i8] c"&\00"
@.str5575 = constant [4 x i8] c"and\00"
@.str5580 = constant [2 x i8] c"|\00"
@.str5585 = constant [3 x i8] c"or\00"
@.str5590 = constant [3 x i8] c">=\00"
@.str5595 = constant [9 x i8] c"icmp sge\00"
@.str5600 = constant [3 x i8] c"<=\00"
@.str5605 = constant [9 x i8] c"icmp sle\00"
@.str5609 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5616 = constant [4 x i8] c"add\00"
@.str5622 = constant [3 x i8] c"==\00"
@.str5629 = constant [3 x i8] c"!=\00"
@.str5637 = constant [2 x i8] c"|\00"
@.str5645 = constant [2 x i8] c"&\00"
@.str5653 = constant [2 x i8] c">\00"
@.str5661 = constant [2 x i8] c"<\00"
@.str5669 = constant [3 x i8] c">=\00"
@.str5677 = constant [3 x i8] c"<=\00"
@.str5685 = constant [5 x i8] c"bool\00"
@.str5689 = constant [4 x i8] c"int\00"
@.str5699 = constant [7 x i8] c"NUMBER\00"
@.str5713 = constant [4 x i8] c"int\00"
@.str5727 = constant [5 x i8] c"WORD\00"
@.str5737 = constant [5 x i8] c"null\00"
@.str5744 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5758 = constant [5 x i8] c"null\00"
@.str5767 = constant [8 x i8] c"nullptr\00"
@.str5774 = constant [17 x i8] c"addr_destination\00"
@.str5786 = constant [12 x i8] c"destination\00"
@.str5825 = constant [4 x i8] c"ptr\00"
@.str5844 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str5856 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5870 = constant [8 x i8] c"boolean\00"
@.str5884 = constant [5 x i8] c"bool\00"
@.str5893 = constant [6 x i8] c"false\00"
@.str5900 = constant [2 x i8] c"0\00"
@.str5904 = constant [2 x i8] c"1\00"
@.str5911 = constant [8 x i8] c"fn_call\00"
@.str5928 = constant [7 x i8] c"STRING\00"
@.str5952 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str5968 = constant [4 x i8] c"ptr\00"
@.str5981 = constant [4 x i8] c"chr\00"
@.str5988 = constant [4 x i8] c"CHR\00"
@.str6003 = constant [2 x i8] c"0\00"
@.str6019 = constant [22 x i8] c"Invalid character: %s\00"
@.str6035 = constant [4 x i8] c"chr\00"
@.str6039 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6067 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6073 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6078 = constant [4 x i8] c"int\00"
@.str6083 = constant [2 x i8] c"i\00"
@.str6088 = constant [5 x i8] c"bool\00"
@.str6093 = constant [2 x i8] c"b\00"
@.str6098 = constant [5 x i8] c"void\00"
@.str6103 = constant [2 x i8] c"v\00"
@.str6108 = constant [4 x i8] c"chr\00"
@.str6113 = constant [2 x i8] c"c\00"
@.str6118 = constant [4 x i8] c"ptr\00"
@.str6124 = constant [4 x i8] c"%sp\00"
@.str6135 = constant [10 x i8] c"typealias\00"
@.str6146 = constant [6 x i8] c"error\00"
@.str6151 = constant [2 x i8] c"?\00"
@.str6153 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str6163 = constant [7 x i8] c".str%d\00"
@.str6186 = constant [6 x i8] c"array\00"
@.str6199 = constant [4 x i8] c"chr\00"
@.str6217 = constant [3 x i8] c"%d\00"
@.str6226 = constant [7 x i8] c"string\00"
@.str6245 = constant [7 x i8] c"module\00"
@.str6279 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6285 = constant [2 x i8] c"?\00"
@.str6291 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6296 = constant [4 x i8] c"int\00"
@.str6301 = constant [4 x i8] c"i32\00"
@.str6306 = constant [5 x i8] c"void\00"
@.str6311 = constant [5 x i8] c"void\00"
@.str6316 = constant [5 x i8] c"bool\00"
@.str6321 = constant [3 x i8] c"i1\00"
@.str6326 = constant [8 x i8] c"nullptr\00"
@.str6331 = constant [4 x i8] c"ptr\00"
@.str6336 = constant [4 x i8] c"chr\00"
@.str6341 = constant [3 x i8] c"i8\00"
@.str6346 = constant [9 x i8] c"function\00"
@.str6352 = constant [4 x i8] c"%s(\00"
@.str6377 = constant [4 x i8] c"%s,\00"
@.str6382 = constant [5 x i8] c"%s%s\00"
@.str6393 = constant [4 x i8] c"%s)\00"
@.str6401 = constant [4 x i8] c"ptr\00"
@.str6407 = constant [4 x i8] c"%s*\00"
@.str6419 = constant [7 x i8] c"struct\00"
@.str6425 = constant [2 x i8] c"{\00"
@.str6441 = constant [4 x i8] c"%s,\00"
@.str6446 = constant [5 x i8] c"%s%s\00"
@.str6457 = constant [4 x i8] c"%s}\00"
@.str6465 = constant [6 x i8] c"array\00"
@.str6471 = constant [10 x i8] c"[%s x %s]\00"
@.str6490 = constant [10 x i8] c"typealias\00"
@.str6496 = constant [5 x i8] c"%%%s\00"
@.str6506 = constant [7 x i8] c"vararg\00"
@.str6511 = constant [4 x i8] c"...\00"
@.str6516 = constant [6 x i8] c"error\00"
@.str6521 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6590 = constant [9 x i8] c"function\00"
@.str6605 = constant [5 x i8] c"WORD\00"
@.str6661 = constant [10 x i8] c"fn_params\00"
@.str6675 = constant [10 x i8] c"structdef\00"
@.str6682 = constant [7 x i8] c"struct\00"
@.str6689 = constant [5 x i8] c"type\00"
@.str6718 = constant [5 x i8] c"type\00"
@.str6745 = constant [5 x i8] c"type\00"
@.str6751 = constant [12 x i8] c"dotted_name\00"
@.str6763 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6776 = constant [6 x i8] c"error\00"
@.str6781 = constant [10 x i8] c"typealias\00"
@.str6805 = constant [4 x i8] c"str\00"
@.str6812 = constant [4 x i8] c"ptr\00"
@.str6821 = constant [4 x i8] c"chr\00"
@.str6826 = constant [5 x i8] c"WORD\00"
@.str6839 = constant [4 x i8] c"...\00"
@.str6846 = constant [7 x i8] c"vararg\00"
@.str6850 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str6870 = constant [2 x i8] c"*\00"
@.str6878 = constant [4 x i8] c"ptr\00"
@.str6887 = constant [2 x i8] c"[\00"
@.str6897 = constant [2 x i8] c"]\00"
@.str6905 = constant [7 x i8] c"struct\00"
@.str6910 = constant [4 x i8] c"ptr\00"
@.str6914 = constant [6 x i8] c"c_arr\00"
@.str6925 = constant [4 x i8] c"int\00"
@.str6929 = constant [4 x i8] c"len\00"
@.str6937 = constant [4 x i8] c"int\00"
@.str6941 = constant [4 x i8] c"cap\00"
@.str6952 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6964 = load i32, i32* %argc
%.tmp6965 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp6964, i8** %.tmp6965)
%.tmp6966 = load i32, i32* @STDERR
%.tmp6968 = getelementptr [2 x i8], [2 x i8]*@.str6967, i32 0, i32 0
%.tmp6969 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp6966, i8* %.tmp6968)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6969, %m0$.File.type** %stderr
%.tmp6970 = load i8**, i8*** %argv
%.tmp6971 = getelementptr i8*, i8** %.tmp6970, i32 1
%.tmp6972 = load i8*, i8** %.tmp6971
%filename = alloca i8*
store i8* %.tmp6972, i8** %filename
%.tmp6973 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6973, %m0$.File.type** %llvm_code
%.tmp6974 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6975 = load i8*, i8** %filename
%.tmp6976 = call %m1772$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1772$new_context.m1772$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp6974, i8* %.tmp6975)
%compiler_ctx = alloca %m1772$.CompilerCtx.type*
store %m1772$.CompilerCtx.type* %.tmp6976, %m1772$.CompilerCtx.type** %compiler_ctx
%.tmp6977 = load %m1772$.CompilerCtx.type*, %m1772$.CompilerCtx.type** %compiler_ctx
%.tmp6978 = load i8*, i8** %filename
%.tmp6979 = call i1(%m1772$.CompilerCtx.type*,i8*) @m1772$compile_file.b.m1772$.CompilerCtx.typep.cp(%m1772$.CompilerCtx.type* %.tmp6977, i8* %.tmp6978)
br i1 %.tmp6979, label %.if.true.6980, label %.if.false.6980
.if.true.6980:
%.tmp6981 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6983 = getelementptr [34 x i8], [34 x i8]*@.str6982, i32 0, i32 0
%.tmp6984 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6981, i8* %.tmp6983)
ret i32 1
br label %.if.end.6980
.if.false.6980:
br label %.if.end.6980
.if.end.6980:
%.tmp6985 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6986 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp6985)
%.tmp6987 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6988 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp6987)
%llvm_code_size = alloca i32
store i32 %.tmp6988, i32* %llvm_code_size
%.tmp6989 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6989)
%.tmp6991 = getelementptr [30 x i8], [30 x i8]*@.str6990, i32 0, i32 0
%.tmp6993 = getelementptr [2 x i8], [2 x i8]*@.str6992, i32 0, i32 0
%.tmp6994 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6991, i8* %.tmp6993)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6994, %m0$.File.type** %proc
%.tmp6995 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6996 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6995)
%.tmp6997 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6998 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6997)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp6996, i32 %.tmp6998)
%.tmp6999 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7000 = icmp eq %m0$.File.type* %.tmp6999, null
br i1 %.tmp7000, label %.if.true.7001, label %.if.false.7001
.if.true.7001:
%.tmp7002 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7004 = getelementptr [28 x i8], [28 x i8]*@.str7003, i32 0, i32 0
%.tmp7005 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7002, i8* %.tmp7004)
ret i32 0
br label %.if.end.7001
.if.false.7001:
br label %.if.end.7001
.if.end.7001:
%.tmp7006 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7007 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7006)
%.tmp7008 = icmp ne i32 %.tmp7007, 0
br i1 %.tmp7008, label %.if.true.7009, label %.if.false.7009
.if.true.7009:
%.tmp7010 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7012 = getelementptr [24 x i8], [24 x i8]*@.str7011, i32 0, i32 0
%.tmp7013 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7010, i8* %.tmp7012)
ret i32 0
br label %.if.end.7009
.if.false.7009:
br label %.if.end.7009
.if.end.7009:
%.tmp7015 = getelementptr [17 x i8], [17 x i8]*@.str7014, i32 0, i32 0
%.tmp7017 = getelementptr [2 x i8], [2 x i8]*@.str7016, i32 0, i32 0
%.tmp7018 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7015, i8* %.tmp7017)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7018, %m0$.File.type** %gcc_proc
%.tmp7019 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp7020 = icmp eq %m0$.File.type* %.tmp7019, null
br i1 %.tmp7020, label %.if.true.7021, label %.if.false.7021
.if.true.7021:
%.tmp7022 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7024 = getelementptr [28 x i8], [28 x i8]*@.str7023, i32 0, i32 0
%.tmp7025 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7022, i8* %.tmp7024)
ret i32 0
br label %.if.end.7021
.if.false.7021:
br label %.if.end.7021
.if.end.7021:
%.tmp7026 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp7027 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7026)
%.tmp7028 = icmp ne i32 %.tmp7027, 0
br i1 %.tmp7028, label %.if.true.7029, label %.if.false.7029
.if.true.7029:
%.tmp7030 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp7032 = getelementptr [23 x i8], [23 x i8]*@.str7031, i32 0, i32 0
%.tmp7033 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7030, i8* %.tmp7032)
br label %.if.end.7029
.if.false.7029:
%.tmp7035 = getelementptr [32 x i8], [32 x i8]*@.str7034, i32 0, i32 0
%.tmp7036 = load i8*, i8** %filename
%.tmp7037 = call i32(i8*,...) @printf(i8* %.tmp7035, i8* %.tmp7036)
br label %.if.end.7029
.if.end.7029:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7038 = load i32, i32* %argc
%.tmp7039 = icmp eq i32 %.tmp7038, 2
br i1 %.tmp7039, label %.if.true.7040, label %.if.false.7040
.if.true.7040:
ret void
br label %.if.end.7040
.if.false.7040:
br label %.if.end.7040
.if.end.7040:
%.tmp7042 = getelementptr [21 x i8], [21 x i8]*@.str7041, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp7042, i8** %tmpl
%.tmp7043 = load i8**, i8*** %argv
%.tmp7044 = getelementptr i8*, i8** %.tmp7043, i32 0
%.tmp7045 = load i8*, i8** %.tmp7044
%.tmp7046 = call i32(i8*) @strlen(i8* %.tmp7045)
%.tmp7047 = load i8*, i8** %tmpl
%.tmp7048 = call i32(i8*) @strlen(i8* %.tmp7047)
%.tmp7049 = add i32 %.tmp7046, %.tmp7048
%len_filename = alloca i32
store i32 %.tmp7049, i32* %len_filename
%.tmp7050 = load i32, i32* %len_filename
%.tmp7051 = call i8*(i32) @malloc(i32 %.tmp7050)
%buf = alloca i8*
store i8* %.tmp7051, i8** %buf
%.tmp7052 = load i8*, i8** %buf
%.tmp7053 = load i8*, i8** %tmpl
%.tmp7054 = load i8**, i8*** %argv
%.tmp7055 = getelementptr i8*, i8** %.tmp7054, i32 0
%.tmp7056 = load i8*, i8** %.tmp7055
%.tmp7057 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7052, i8* %.tmp7053, i8* %.tmp7056)
%.tmp7058 = load i8*, i8** %buf
%.tmp7059 = call i32(i8*) @puts(i8* %.tmp7058)
%.tmp7060 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp7060)
call void(i32) @exit(i32 1)
ret void
}
@.str6967 = constant [2 x i8] c"w\00"
@.str6982 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str6990 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str6992 = constant [2 x i8] c"w\00"
@.str7003 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7011 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7014 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7016 = constant [2 x i8] c"w\00"
@.str7023 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7031 = constant [23 x i8] c"error on gcc execution\00"
@.str7034 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7041 = constant [21 x i8] c"Usage: %s <filename>\00"
