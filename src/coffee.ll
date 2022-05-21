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
@Query_size = constant i32 24
%m286$.Matcher.type = type {%m286$.Query.type*,i8,%m286$.Matcher.type*,%m286$.Matcher.type*}
@Matcher_size = constant i32 32
%m286$.Rule.type = type {i8*,%m286$.Matcher.type*}
@Rule_size = constant i32 16
%m286$.ParsingContext.type = type {%m287$.Token.type*}
@ParsingContext_size = constant i32 8
define %m286$.ParsingContext.type* @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp774 = load i32, i32* @ParsingContext_size
%.tmp775 = call i8*(i32) @malloc(i32 %.tmp774)
%.tmp776 = bitcast i8* %.tmp775 to %m286$.ParsingContext.type*
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp776, %m286$.ParsingContext.type** %ctx
%.tmp777 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp778 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp777)
%fd = alloca i32
store i32 %.tmp778, i32* %fd
%.tmp779 = load i32, i32* %fd
%.tmp780 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp779)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp780, %m209$.PeekerInfo.type** %p
%.tmp781 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp782 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp781, i1 0)
%token_list = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp782, %m287$.Token.type** %token_list
%.tmp783 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp784 = bitcast %m209$.PeekerInfo.type* %.tmp783 to i8*
call void(i8*) @free(i8* %.tmp784)
%.tmp785 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp786 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp785, i32 0, i32 0
%.tmp787 = load %m287$.Token.type*, %m287$.Token.type** %token_list
store %m287$.Token.type* %.tmp787, %m287$.Token.type** %.tmp786
%.tmp788 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
ret %m286$.ParsingContext.type* %.tmp788
}
define %m286$.Matcher.type* @m286$new_matcher.m286$.Matcher.typep() {
%.tmp789 = load i32, i32* @Matcher_size
%.tmp790 = call i8*(i32) @malloc(i32 %.tmp789)
%.tmp791 = bitcast i8* %.tmp790 to %m286$.Matcher.type*
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp791, %m286$.Matcher.type** %m
%.tmp792 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp793 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp792, i32 0, i32 1
store i8 49, i8* %.tmp793
%.tmp794 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp795 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp794, i32 0, i32 2
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp795
%.tmp796 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp797 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp796, i32 0, i32 3
store %m286$.Matcher.type* null, %m286$.Matcher.type** %.tmp797
%.tmp798 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp799 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp798, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp799
%.tmp800 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp800
}
define %m286$.Matcher.type* @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%m = alloca %m286$.Matcher.type*
%.tmp801 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp802 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp801, i32 0, i32 0
%.tmp803 = load %m287$.Token.type*, %m287$.Token.type** %.tmp802
%.tmp804 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp803, i32 0, i32 1
%.tmp805 = load i8*, i8** %.tmp804
%.tmp807 = getelementptr [2 x i8], [2 x i8]*@.str806, i32 0, i32 0
%.tmp808 = call i32(i8*,i8*) @strcmp(i8* %.tmp805, i8* %.tmp807)
%.tmp809 = icmp eq i32 %.tmp808, 0
br i1 %.tmp809, label %.if.true.810, label %.if.false.810
.if.true.810:
%.tmp811 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp812 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp811, i32 0, i32 0
%.tmp813 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp814 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp813, i32 0, i32 0
%.tmp815 = load %m287$.Token.type*, %m287$.Token.type** %.tmp814
%.tmp816 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp815, i32 0, i32 5
%.tmp817 = load %m287$.Token.type*, %m287$.Token.type** %.tmp816
store %m287$.Token.type* %.tmp817, %m287$.Token.type** %.tmp812
%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp818 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp819 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp818)
store %m286$.Matcher.type* %.tmp819, %m286$.Matcher.type** %m
%.tmp820 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp821 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp820, i32 0, i32 0
%.tmp822 = load %m287$.Token.type*, %m287$.Token.type** %.tmp821
%.tmp823 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp822, i32 0, i32 1
%.tmp824 = load i8*, i8** %.tmp823
%.tmp826 = getelementptr [2 x i8], [2 x i8]*@.str825, i32 0, i32 0
%.tmp827 = call i32(i8*,i8*) @strcmp(i8* %.tmp824, i8* %.tmp826)
%.tmp828 = icmp eq i32 %.tmp827, 0
br i1 %.tmp828, label %.if.true.829, label %.if.false.829
.if.true.829:
%.tmp830 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp831 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp830, i32 0, i32 0
%.tmp832 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp833 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp832, i32 0, i32 0
%.tmp834 = load %m287$.Token.type*, %m287$.Token.type** %.tmp833
%.tmp835 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp834, i32 0, i32 5
%.tmp836 = load %m287$.Token.type*, %m287$.Token.type** %.tmp835
store %m287$.Token.type* %.tmp836, %m287$.Token.type** %.tmp831
%.tmp837 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%last_matcher = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp837, %m286$.Matcher.type** %last_matcher
br label %.for.start.838
.for.start.838:
%.tmp839 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp840 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp839, i32 0, i32 0
%.tmp841 = load %m287$.Token.type*, %m287$.Token.type** %.tmp840
%.tmp842 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp841, i32 0, i32 1
%.tmp843 = load i8*, i8** %.tmp842
%.tmp845 = getelementptr [2 x i8], [2 x i8]*@.str844, i32 0, i32 0
%.tmp846 = call i32(i8*,i8*) @strcmp(i8* %.tmp843, i8* %.tmp845)
%.tmp847 = icmp ne i32 %.tmp846, 0
%.tmp848 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp849 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp848, i32 0, i32 0
%.tmp850 = load %m287$.Token.type*, %m287$.Token.type** %.tmp849
%.tmp851 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp850, i32 0, i32 0
%.tmp852 = load i8*, i8** %.tmp851
%.tmp854 = getelementptr [4 x i8], [4 x i8]*@.str853, i32 0, i32 0
%.tmp855 = call i32(i8*,i8*) @strcmp(i8* %.tmp852, i8* %.tmp854)
%.tmp856 = icmp ne i32 %.tmp855, 0
%.tmp857 = and i1 %.tmp847, %.tmp856
br i1 %.tmp857, label %.for.continue.838, label %.for.end.838
.for.continue.838:
%.tmp858 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp859 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp858, i32 0, i32 2
%.tmp860 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp861 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp860)
store %m286$.Matcher.type* %.tmp861, %m286$.Matcher.type** %.tmp859
%.tmp862 = load %m286$.Matcher.type*, %m286$.Matcher.type** %last_matcher
%.tmp863 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp862, i32 0, i32 2
%.tmp864 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp863
store %m286$.Matcher.type* %.tmp864, %m286$.Matcher.type** %last_matcher
%.tmp865 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp866 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp865, i32 0, i32 0
%.tmp867 = load %m287$.Token.type*, %m287$.Token.type** %.tmp866
%.tmp868 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp867, i32 0, i32 1
%.tmp869 = load i8*, i8** %.tmp868
%.tmp871 = getelementptr [2 x i8], [2 x i8]*@.str870, i32 0, i32 0
%.tmp872 = call i32(i8*,i8*) @strcmp(i8* %.tmp869, i8* %.tmp871)
%.tmp873 = icmp ne i32 %.tmp872, 0
%.tmp874 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp875 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp874, i32 0, i32 0
%.tmp876 = load %m287$.Token.type*, %m287$.Token.type** %.tmp875
%.tmp877 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp876, i32 0, i32 1
%.tmp878 = load i8*, i8** %.tmp877
%.tmp880 = getelementptr [2 x i8], [2 x i8]*@.str879, i32 0, i32 0
%.tmp881 = call i32(i8*,i8*) @strcmp(i8* %.tmp878, i8* %.tmp880)
%.tmp882 = icmp ne i32 %.tmp881, 0
%.tmp883 = and i1 %.tmp873, %.tmp882
br i1 %.tmp883, label %.if.true.884, label %.if.false.884
.if.true.884:
%.tmp886 = getelementptr [48 x i8], [48 x i8]*@.str885, i32 0, i32 0
%.tmp887 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp888 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp887, i32 0, i32 0
%.tmp889 = load %m287$.Token.type*, %m287$.Token.type** %.tmp888
%.tmp890 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp889, i32 0, i32 2
%.tmp891 = load i32, i32* %.tmp890
%.tmp892 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp893 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp892, i32 0, i32 0
%.tmp894 = load %m287$.Token.type*, %m287$.Token.type** %.tmp893
%.tmp895 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp894, i32 0, i32 3
%.tmp896 = load i32, i32* %.tmp895
%.tmp897 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp898 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp897, i32 0, i32 0
%.tmp899 = load %m287$.Token.type*, %m287$.Token.type** %.tmp898
%.tmp900 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp899, i32 0, i32 1
%.tmp901 = load i8*, i8** %.tmp900
%.tmp902 = call i32(i8*,...) @printf(i8* %.tmp886, i32 %.tmp891, i32 %.tmp896, i8* %.tmp901)
call void(i32) @exit(i32 1)
br label %.if.end.884
.if.false.884:
br label %.if.end.884
.if.end.884:
%.tmp903 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp904 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp903, i32 0, i32 0
%.tmp905 = load %m287$.Token.type*, %m287$.Token.type** %.tmp904
%.tmp906 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp905, i32 0, i32 1
%.tmp907 = load i8*, i8** %.tmp906
%.tmp909 = getelementptr [2 x i8], [2 x i8]*@.str908, i32 0, i32 0
%.tmp910 = call i32(i8*,i8*) @strcmp(i8* %.tmp907, i8* %.tmp909)
%.tmp911 = icmp eq i32 %.tmp910, 0
br i1 %.tmp911, label %.if.true.912, label %.if.false.912
.if.true.912:
%.tmp913 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp914 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp913, i32 0, i32 0
%.tmp915 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp916 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp915, i32 0, i32 0
%.tmp917 = load %m287$.Token.type*, %m287$.Token.type** %.tmp916
%.tmp918 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp917, i32 0, i32 5
%.tmp919 = load %m287$.Token.type*, %m287$.Token.type** %.tmp918
store %m287$.Token.type* %.tmp919, %m287$.Token.type** %.tmp914
br label %.if.end.912
.if.false.912:
br label %.if.end.912
.if.end.912:
br label %.for.start.838
.for.end.838:
br label %.if.end.829
.if.false.829:
br label %.if.end.829
.if.end.829:
%.tmp920 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp921 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp920, i32 0, i32 0
%.tmp922 = load %m287$.Token.type*, %m287$.Token.type** %.tmp921
%.tmp923 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp922, i32 0, i32 1
%.tmp924 = load i8*, i8** %.tmp923
%.tmp926 = getelementptr [2 x i8], [2 x i8]*@.str925, i32 0, i32 0
%.tmp927 = call i32(i8*,i8*) @strcmp(i8* %.tmp924, i8* %.tmp926)
%.tmp928 = icmp ne i32 %.tmp927, 0
br i1 %.tmp928, label %.if.true.929, label %.if.false.929
.if.true.929:
%.tmp930 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp932 = getelementptr [22 x i8], [22 x i8]*@.str931, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp930, i8* %.tmp932)
br label %.if.end.929
.if.false.929:
br label %.if.end.929
.if.end.929:
%.tmp933 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp934 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp933, i32 0, i32 0
%.tmp935 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp936 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp935, i32 0, i32 0
%.tmp937 = load %m287$.Token.type*, %m287$.Token.type** %.tmp936
%.tmp938 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp937, i32 0, i32 5
%.tmp939 = load %m287$.Token.type*, %m287$.Token.type** %.tmp938
store %m287$.Token.type* %.tmp939, %m287$.Token.type** %.tmp934
%.tmp940 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp941 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp940, i32 0, i32 0
%.tmp942 = load %m287$.Token.type*, %m287$.Token.type** %.tmp941
%.tmp943 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp942, i32 0, i32 1
%.tmp944 = load i8*, i8** %.tmp943
%.tmp946 = getelementptr [2 x i8], [2 x i8]*@.str945, i32 0, i32 0
%.tmp947 = call i32(i8*,i8*) @strcmp(i8* %.tmp944, i8* %.tmp946)
%.tmp948 = icmp eq i32 %.tmp947, 0
br i1 %.tmp948, label %.if.true.949, label %.if.false.949
.if.true.949:
%.tmp950 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp951 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp950, i32 0, i32 0
%.tmp952 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp953 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp952, i32 0, i32 0
%.tmp954 = load %m287$.Token.type*, %m287$.Token.type** %.tmp953
%.tmp955 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp954, i32 0, i32 5
%.tmp956 = load %m287$.Token.type*, %m287$.Token.type** %.tmp955
store %m287$.Token.type* %.tmp956, %m287$.Token.type** %.tmp951
%.tmp957 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp958 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp957, i32 0, i32 1
store i8 43, i8* %.tmp958
br label %.if.end.949
.if.false.949:
%.tmp959 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp960 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp959, i32 0, i32 0
%.tmp961 = load %m287$.Token.type*, %m287$.Token.type** %.tmp960
%.tmp962 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp961, i32 0, i32 1
%.tmp963 = load i8*, i8** %.tmp962
%.tmp965 = getelementptr [2 x i8], [2 x i8]*@.str964, i32 0, i32 0
%.tmp966 = call i32(i8*,i8*) @strcmp(i8* %.tmp963, i8* %.tmp965)
%.tmp967 = icmp eq i32 %.tmp966, 0
br i1 %.tmp967, label %.if.true.968, label %.if.false.968
.if.true.968:
%.tmp969 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp970 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp969, i32 0, i32 0
%.tmp971 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp972 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp971, i32 0, i32 0
%.tmp973 = load %m287$.Token.type*, %m287$.Token.type** %.tmp972
%.tmp974 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp973, i32 0, i32 5
%.tmp975 = load %m287$.Token.type*, %m287$.Token.type** %.tmp974
store %m287$.Token.type* %.tmp975, %m287$.Token.type** %.tmp970
%.tmp976 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp977 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp976, i32 0, i32 1
store i8 42, i8* %.tmp977
br label %.if.end.968
.if.false.968:
%.tmp978 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp979 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp978, i32 0, i32 0
%.tmp980 = load %m287$.Token.type*, %m287$.Token.type** %.tmp979
%.tmp981 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp980, i32 0, i32 1
%.tmp982 = load i8*, i8** %.tmp981
%.tmp984 = getelementptr [2 x i8], [2 x i8]*@.str983, i32 0, i32 0
%.tmp985 = call i32(i8*,i8*) @strcmp(i8* %.tmp982, i8* %.tmp984)
%.tmp986 = icmp eq i32 %.tmp985, 0
br i1 %.tmp986, label %.if.true.987, label %.if.false.987
.if.true.987:
%.tmp988 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp989 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp988, i32 0, i32 0
%.tmp990 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp991 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp990, i32 0, i32 0
%.tmp992 = load %m287$.Token.type*, %m287$.Token.type** %.tmp991
%.tmp993 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp992, i32 0, i32 5
%.tmp994 = load %m287$.Token.type*, %m287$.Token.type** %.tmp993
store %m287$.Token.type* %.tmp994, %m287$.Token.type** %.tmp989
%.tmp995 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp996 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp995, i32 0, i32 1
store i8 63, i8* %.tmp996
br label %.if.end.987
.if.false.987:
br label %.if.end.987
.if.end.987:
br label %.if.end.968
.if.end.968:
br label %.if.end.949
.if.end.949:
br label %.if.end.810
.if.false.810:
%.tmp997 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp998 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp997)
store %m286$.Matcher.type* %.tmp998, %m286$.Matcher.type** %m
br label %.if.end.810
.if.end.810:
%.tmp999 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1000 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp999, i32 0, i32 0
%.tmp1001 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1000
%.tmp1002 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1001, i32 0, i32 1
%.tmp1003 = load i8*, i8** %.tmp1002
%.tmp1005 = getelementptr [2 x i8], [2 x i8]*@.str1004, i32 0, i32 0
%.tmp1006 = call i32(i8*,i8*) @strcmp(i8* %.tmp1003, i8* %.tmp1005)
%.tmp1007 = icmp eq i32 %.tmp1006, 0
%.tmp1008 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1009 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1008, i32 0, i32 0
%.tmp1010 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1009
%.tmp1011 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1010, i32 0, i32 0
%.tmp1012 = load i8*, i8** %.tmp1011
%.tmp1014 = getelementptr [5 x i8], [5 x i8]*@.str1013, i32 0, i32 0
%.tmp1015 = call i32(i8*,i8*) @strcmp(i8* %.tmp1012, i8* %.tmp1014)
%.tmp1016 = icmp eq i32 %.tmp1015, 0
%.tmp1017 = or i1 %.tmp1007, %.tmp1016
br i1 %.tmp1017, label %.if.true.1018, label %.if.false.1018
.if.true.1018:
%.tmp1019 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1020 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1019, i32 0, i32 3
%.tmp1021 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1022 = call %m286$.Matcher.type*(%m286$.ParsingContext.type*) @m286$parse_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp1021)
store %m286$.Matcher.type* %.tmp1022, %m286$.Matcher.type** %.tmp1020
br label %.if.end.1018
.if.false.1018:
br label %.if.end.1018
.if.end.1018:
%.tmp1023 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1023
}
define %m286$.Matcher.type* @m286$parse_simple_matcher.m286$.Matcher.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1024 = call %m286$.Matcher.type*() @m286$new_matcher.m286$.Matcher.typep()
%m = alloca %m286$.Matcher.type*
store %m286$.Matcher.type* %.tmp1024, %m286$.Matcher.type** %m
%count = alloca i32
%.tmp1025 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1026 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1025, i32 0, i32 0
%.tmp1027 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1026
%ptr = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1027, %m287$.Token.type** %ptr
store i32 0, i32* %count
br label %.for.start.1028
.for.start.1028:
%.tmp1029 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1030 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1029, i32 0, i32 0
%.tmp1031 = load i8*, i8** %.tmp1030
%.tmp1033 = getelementptr [5 x i8], [5 x i8]*@.str1032, i32 0, i32 0
%.tmp1034 = call i32(i8*,i8*) @strcmp(i8* %.tmp1031, i8* %.tmp1033)
%.tmp1035 = icmp eq i32 %.tmp1034, 0
%.tmp1036 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1037 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1036, i32 0, i32 0
%.tmp1038 = load i8*, i8** %.tmp1037
%.tmp1040 = getelementptr [7 x i8], [7 x i8]*@.str1039, i32 0, i32 0
%.tmp1041 = call i32(i8*,i8*) @strcmp(i8* %.tmp1038, i8* %.tmp1040)
%.tmp1042 = icmp eq i32 %.tmp1041, 0
%.tmp1043 = or i1 %.tmp1035, %.tmp1042
br i1 %.tmp1043, label %.for.continue.1028, label %.for.end.1028
.for.continue.1028:
%.tmp1044 = load i32, i32* %count
%.tmp1045 = add i32 %.tmp1044, 1
store i32 %.tmp1045, i32* %count
%.tmp1046 = load %m287$.Token.type*, %m287$.Token.type** %ptr
%.tmp1047 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1046, i32 0, i32 5
%.tmp1048 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1047
store %m287$.Token.type* %.tmp1048, %m287$.Token.type** %ptr
br label %.for.start.1028
.for.end.1028:
%.tmp1049 = load i32, i32* @Query_size
%.tmp1050 = icmp sgt i32 %.tmp1049, 0
br i1 %.tmp1050, label %.if.true.1051, label %.if.false.1051
.if.true.1051:
%.tmp1052 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1053 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1052, i32 0, i32 0
%.tmp1054 = load i32, i32* @Query_size
%.tmp1055 = call i8*(i32) @malloc(i32 %.tmp1054)
%.tmp1056 = bitcast i8* %.tmp1055 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1056, %m286$.Query.type** %.tmp1053
br label %.if.end.1051
.if.false.1051:
%.tmp1057 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1058 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1057, i32 0, i32 0
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1058
br label %.if.end.1051
.if.end.1051:
%.tmp1059 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1060 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1059, i32 0, i32 0
%.tmp1061 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1060
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1061, %m286$.Query.type** %q
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1062
.for.start.1062:
%.tmp1063 = load i32, i32* %i
%.tmp1064 = load i32, i32* %count
%.tmp1065 = icmp slt i32 %.tmp1063, %.tmp1064
br i1 %.tmp1065, label %.for.continue.1062, label %.for.end.1062
.for.continue.1062:
%.tmp1066 = load i32, i32* %i
%.tmp1067 = icmp sgt i32 %.tmp1066, 0
br i1 %.tmp1067, label %.if.true.1068, label %.if.false.1068
.if.true.1068:
%.tmp1069 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1070 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1069, i32 0, i32 2
%.tmp1071 = load i32, i32* @Query_size
%.tmp1072 = call i8*(i32) @malloc(i32 %.tmp1071)
%.tmp1073 = bitcast i8* %.tmp1072 to %m286$.Query.type*
store %m286$.Query.type* %.tmp1073, %m286$.Query.type** %.tmp1070
%.tmp1074 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1075 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1074, i32 0, i32 2
%.tmp1076 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1075
store %m286$.Query.type* %.tmp1076, %m286$.Query.type** %q
br label %.if.end.1068
.if.false.1068:
br label %.if.end.1068
.if.end.1068:
%.tmp1077 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1078 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1077, i32 0, i32 0
%.tmp1079 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1078
%.tmp1080 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1079, i32 0, i32 0
%.tmp1081 = load i8*, i8** %.tmp1080
%.tmp1083 = getelementptr [7 x i8], [7 x i8]*@.str1082, i32 0, i32 0
%.tmp1084 = call i32(i8*,i8*) @strcmp(i8* %.tmp1081, i8* %.tmp1083)
%.tmp1085 = icmp eq i32 %.tmp1084, 0
br i1 %.tmp1085, label %.if.true.1086, label %.if.false.1086
.if.true.1086:
%.tmp1087 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1088 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1087, i32 0, i32 0
store i8 118, i8* %.tmp1088
br label %.if.end.1086
.if.false.1086:
%.tmp1089 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1090 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1089, i32 0, i32 0
%.tmp1091 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1090
%.tmp1092 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1091, i32 0, i32 1
%.tmp1093 = load i8*, i8** %.tmp1092
%.tmp1094 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1093)
br i1 %.tmp1094, label %.if.true.1095, label %.if.false.1095
.if.true.1095:
%.tmp1096 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1097 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1096, i32 0, i32 0
store i8 97, i8* %.tmp1097
br label %.if.end.1095
.if.false.1095:
%.tmp1098 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1099 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1098, i32 0, i32 0
%.tmp1100 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1099
%.tmp1101 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1100, i32 0, i32 1
%.tmp1102 = load i8*, i8** %.tmp1101
%.tmp1103 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1102)
br i1 %.tmp1103, label %.if.true.1104, label %.if.false.1104
.if.true.1104:
%.tmp1105 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1106 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1105, i32 0, i32 0
store i8 116, i8* %.tmp1106
br label %.if.end.1104
.if.false.1104:
%.tmp1108 = getelementptr [17 x i8], [17 x i8]*@.str1107, i32 0, i32 0
%.tmp1109 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1110 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1109, i32 0, i32 0
%.tmp1111 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1110
%.tmp1112 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1111, i32 0, i32 1
%.tmp1113 = load i8*, i8** %.tmp1112
%.tmp1114 = call i32(i8*,...) @printf(i8* %.tmp1108, i8* %.tmp1113)
%.tmp1115 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1117 = getelementptr [50 x i8], [50 x i8]*@.str1116, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1115, i8* %.tmp1117)
br label %.if.end.1104
.if.end.1104:
br label %.if.end.1095
.if.end.1095:
br label %.if.end.1086
.if.end.1086:
%.tmp1118 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1119 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1118, i32 0, i32 1
%.tmp1120 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1121 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1120, i32 0, i32 0
%.tmp1122 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1121
%.tmp1123 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1122, i32 0, i32 1
%.tmp1124 = load i8*, i8** %.tmp1123
store i8* %.tmp1124, i8** %.tmp1119
%.tmp1125 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1126 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1125, i32 0, i32 2
store %m286$.Query.type* null, %m286$.Query.type** %.tmp1126
%.tmp1127 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1128 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1127, i32 0, i32 0
%.tmp1129 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1130 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1129, i32 0, i32 0
%.tmp1131 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1130
%.tmp1132 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1131, i32 0, i32 5
%.tmp1133 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1132
store %m287$.Token.type* %.tmp1133, %m287$.Token.type** %.tmp1128
%.tmp1134 = load i32, i32* %i
%.tmp1135 = add i32 %.tmp1134, 1
store i32 %.tmp1135, i32* %i
br label %.for.start.1062
.for.end.1062:
%.tmp1136 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
ret %m286$.Matcher.type* %.tmp1136
}
define %m286$.Rule.type* @m286$parse_rule.m286$.Rule.typep.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.ctx.arg, %m286$.ParsingContext.type** %ctx
%.tmp1137 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1138 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1137, i32 0, i32 0
%.tmp1139 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1138
%.tmp1140 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1139, i32 0, i32 1
%.tmp1141 = load i8*, i8** %.tmp1140
%rule_name = alloca i8*
store i8* %.tmp1141, i8** %rule_name
%.tmp1142 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1143 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1142, i32 0, i32 0
%.tmp1144 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1143
%.tmp1145 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1144, i32 0, i32 0
%.tmp1146 = load i8*, i8** %.tmp1145
%.tmp1148 = getelementptr [5 x i8], [5 x i8]*@.str1147, i32 0, i32 0
%.tmp1149 = call i32(i8*,i8*) @strcmp(i8* %.tmp1146, i8* %.tmp1148)
%.tmp1150 = icmp ne i32 %.tmp1149, 0
br i1 %.tmp1150, label %.if.true.1151, label %.if.false.1151
.if.true.1151:
%.tmp1153 = getelementptr [37 x i8], [37 x i8]*@.str1152, i32 0, i32 0
%.tmp1154 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1155 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1154, i32 0, i32 0
%.tmp1156 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1155
%.tmp1157 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1156, i32 0, i32 0
%.tmp1158 = load i8*, i8** %.tmp1157
%.tmp1159 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1160 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1159, i32 0, i32 0
%.tmp1161 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1160
%.tmp1162 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1161, i32 0, i32 1
%.tmp1163 = load i8*, i8** %.tmp1162
%.tmp1164 = call i32(i8*,...) @printf(i8* %.tmp1153, i8* %.tmp1158, i8* %.tmp1163)
%.tmp1165 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1167 = getelementptr [31 x i8], [31 x i8]*@.str1166, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1165, i8* %.tmp1167)
br label %.if.end.1151
.if.false.1151:
br label %.if.end.1151
.if.end.1151:
%.tmp1168 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1169 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1168, i32 0, i32 0
%.tmp1170 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1171 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1170, i32 0, i32 0
%.tmp1172 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1171
%.tmp1173 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1172, i32 0, i32 5
%.tmp1174 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1173
store %m287$.Token.type* %.tmp1174, %m287$.Token.type** %.tmp1169
%.tmp1175 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1176 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1175, i32 0, i32 0
%.tmp1177 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1176
%.tmp1178 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1177, i32 0, i32 1
%.tmp1179 = load i8*, i8** %.tmp1178
%.tmp1181 = getelementptr [2 x i8], [2 x i8]*@.str1180, i32 0, i32 0
%.tmp1182 = call i32(i8*,i8*) @strcmp(i8* %.tmp1179, i8* %.tmp1181)
%.tmp1183 = icmp ne i32 %.tmp1182, 0
br i1 %.tmp1183, label %.if.true.1184, label %.if.false.1184
.if.true.1184:
%.tmp1185 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1186 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1185, i32 0, i32 0
%.tmp1187 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1186
%.tmp1188 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1187, i32 0, i32 1
%.tmp1189 = load i8*, i8** %.tmp1188
%.tmp1190 = call i32(i8*,...) @printf(i8* %.tmp1189)
%.tmp1191 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1193 = getelementptr [27 x i8], [27 x i8]*@.str1192, i32 0, i32 0
call void(%m286$.ParsingContext.type*,i8*) @m286$parser_error.v.m286$.ParsingContext.typep.cp(%m286$.ParsingContext.type* %.tmp1191, i8* %.tmp1193)
br label %.if.end.1184
.if.false.1184:
br label %.if.end.1184
.if.end.1184:
%.tmp1194 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1195 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1194, i32 0, i32 0
%.tmp1196 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %ctx
%.tmp1197 = getelementptr %m286$.ParsingContext.type, %m286$.ParsingContext.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1197
%.tmp1199 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1198, i32 0, i32 5
%.tmp1200 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1199
store %m287$.Token.type* %.tmp1200, %m287$.Token.type** %.tmp1195
%.tmp1201 = load i32, i32* @Rule_size
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
@Node_size = constant i32 56
define %m286$.Node.type* @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m287$.Token.type*
store %m287$.Token.type* %.t.arg, %m287$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1259 = load i32, i32* @Node_size
%.tmp1260 = call i8*(i32) @malloc(i32 %.tmp1259)
%.tmp1261 = bitcast i8* %.tmp1260 to %m286$.Node.type*
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1261, %m286$.Node.type** %node
%.tmp1262 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1263 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1262, i32 0, i32 0
%.tmp1264 = load i8*, i8** %type
store i8* %.tmp1264, i8** %.tmp1263
%.tmp1265 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1266 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1265, i32 0, i32 1
%.tmp1267 = load i8*, i8** %value
store i8* %.tmp1267, i8** %.tmp1266
%.tmp1268 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1269 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1268, i32 0, i32 3
%.tmp1270 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1271 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1270, i32 0, i32 2
%.tmp1272 = load i32, i32* %.tmp1271
store i32 %.tmp1272, i32* %.tmp1269
%.tmp1273 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1274 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1273, i32 0, i32 2
%.tmp1275 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1276 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1275, i32 0, i32 4
%.tmp1277 = load i8*, i8** %.tmp1276
store i8* %.tmp1277, i8** %.tmp1274
%.tmp1278 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1279 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1278, i32 0, i32 4
%.tmp1280 = load %m287$.Token.type*, %m287$.Token.type** %t
%.tmp1281 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1280, i32 0, i32 3
%.tmp1282 = load i32, i32* %.tmp1281
store i32 %.tmp1282, i32* %.tmp1279
%.tmp1283 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1284 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1283, i32 0, i32 5
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1284
%.tmp1285 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1286 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1285, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1286
%.tmp1287 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1288 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1287, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1288
%.tmp1289 = load %m286$.Node.type*, %m286$.Node.type** %node
ret %m286$.Node.type* %.tmp1289
}
define void @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.parent.arg, %m286$.Node.type* %.child.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%child = alloca %m286$.Node.type*
store %m286$.Node.type* %.child.arg, %m286$.Node.type** %child
%.tmp1290 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1291 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1290, i32 0, i32 6
%.tmp1292 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1291
%.tmp1293 = icmp eq %m286$.Node.type* %.tmp1292, null
br i1 %.tmp1293, label %.if.true.1294, label %.if.false.1294
.if.true.1294:
%.tmp1295 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1296 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1295, i32 0, i32 6
%.tmp1297 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1297, %m286$.Node.type** %.tmp1296
br label %.if.end.1294
.if.false.1294:
%.tmp1298 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1299 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1298, i32 0, i32 6
%.tmp1300 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1299
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1300, %m286$.Node.type** %c
br label %.for.start.1301
.for.start.1301:
%.tmp1302 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1303 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1302, i32 0, i32 7
%.tmp1304 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1303
%.tmp1305 = icmp ne %m286$.Node.type* %.tmp1304, null
br i1 %.tmp1305, label %.for.continue.1301, label %.for.end.1301
.for.continue.1301:
%.tmp1306 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1307 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1306, i32 0, i32 7
%.tmp1308 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1307
store %m286$.Node.type* %.tmp1308, %m286$.Node.type** %c
br label %.for.start.1301
.for.end.1301:
%.tmp1309 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1310 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1309, i32 0, i32 7
%.tmp1311 = load %m286$.Node.type*, %m286$.Node.type** %child
store %m286$.Node.type* %.tmp1311, %m286$.Node.type** %.tmp1310
br label %.if.end.1294
.if.end.1294:
%.tmp1312 = load %m286$.Node.type*, %m286$.Node.type** %child
%.tmp1313 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1312, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1313
ret void
}
define void @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.parent.arg) {
%parent = alloca %m286$.Node.type*
store %m286$.Node.type* %.parent.arg, %m286$.Node.type** %parent
%.tmp1314 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1315 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1314, i32 0, i32 6
%.tmp1316 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1315
%.tmp1317 = icmp eq %m286$.Node.type* %.tmp1316, null
br i1 %.tmp1317, label %.if.true.1318, label %.if.false.1318
.if.true.1318:
ret void
br label %.if.end.1318
.if.false.1318:
br label %.if.end.1318
.if.end.1318:
%.tmp1319 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1320 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1319, i32 0, i32 6
%.tmp1321 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1320
%c = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1321, %m286$.Node.type** %c
%.tmp1322 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1323 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1322, i32 0, i32 7
%.tmp1324 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1323
%.tmp1325 = icmp eq %m286$.Node.type* %.tmp1324, null
br i1 %.tmp1325, label %.if.true.1326, label %.if.false.1326
.if.true.1326:
%.tmp1327 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1328 = bitcast %m286$.Node.type* %.tmp1327 to i8*
call void(i8*) @free(i8* %.tmp1328)
%.tmp1329 = load %m286$.Node.type*, %m286$.Node.type** %parent
%.tmp1330 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1329, i32 0, i32 6
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1330
ret void
br label %.if.end.1326
.if.false.1326:
br label %.if.end.1326
.if.end.1326:
br label %.for.start.1331
.for.start.1331:
%.tmp1332 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1333 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1332, i32 0, i32 7
%.tmp1334 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1333
%.tmp1335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1334, i32 0, i32 7
%.tmp1336 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1335
%.tmp1337 = icmp ne %m286$.Node.type* %.tmp1336, null
br i1 %.tmp1337, label %.for.continue.1331, label %.for.end.1331
.for.continue.1331:
%.tmp1338 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1338, i32 0, i32 7
%.tmp1340 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1339
store %m286$.Node.type* %.tmp1340, %m286$.Node.type** %c
br label %.for.start.1331
.for.end.1331:
%.tmp1341 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1342 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1341, i32 0, i32 7
%.tmp1343 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1342
%.tmp1344 = bitcast %m286$.Node.type* %.tmp1343 to i8*
call void(i8*) @free(i8* %.tmp1344)
%.tmp1345 = load %m286$.Node.type*, %m286$.Node.type** %c
%.tmp1346 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1345, i32 0, i32 7
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1346
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
br label %.for.start.1347
.for.start.1347:
br i1 1, label %.for.continue.1347, label %.for.end.1347
.for.continue.1347:
%.tmp1348 = load i32, i32* %i
%.tmp1349 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1350 = getelementptr %m286$.Rule.type*, %m286$.Rule.type** %.tmp1349, i32 %.tmp1348
%.tmp1351 = load %m286$.Rule.type*, %m286$.Rule.type** %.tmp1350
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1351, %m286$.Rule.type** %rule
%.tmp1352 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1353 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1352, i32 0, i32 0
%.tmp1354 = load i8*, i8** %.tmp1353
%.tmp1355 = load i8*, i8** %rule_name
%.tmp1356 = call i32(i8*,i8*) @strcmp(i8* %.tmp1354, i8* %.tmp1355)
%.tmp1357 = icmp eq i32 %.tmp1356, 0
br i1 %.tmp1357, label %.if.true.1358, label %.if.false.1358
.if.true.1358:
%.tmp1359 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
ret %m286$.Rule.type* %.tmp1359
br label %.if.end.1358
.if.false.1358:
br label %.if.end.1358
.if.end.1358:
%.tmp1360 = load i32, i32* %i
%.tmp1361 = add i32 %.tmp1360, 1
store i32 %.tmp1361, i32* %i
br label %.for.start.1347
.for.end.1347:
%.tmp1362 = bitcast ptr null to %m286$.Rule.type*
ret %m286$.Rule.type* %.tmp1362
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
%.tmp1363 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1364 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1363, i32 0, i32 0
%.tmp1365 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1364
%start_token = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1365, %m287$.Token.type** %start_token
%new_children = alloca i32
store i32 0, i32* %new_children
%.tmp1366 = bitcast ptr null to %m717$.Error.type*
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1366, %m717$.Error.type** %err
%.tmp1368 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1369 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1368, i32 0, i32 0
%.tmp1370 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1369
%q = alloca %m286$.Query.type*
store %m286$.Query.type* %.tmp1370, %m286$.Query.type** %q
br label %.for.start.1367
.for.start.1367:
%.tmp1371 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1372 = icmp ne %m286$.Query.type* %.tmp1371, null
%.tmp1373 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1374 = icmp eq %m717$.Error.type* %.tmp1373, null
%.tmp1375 = and i1 %.tmp1372, %.tmp1374
br i1 %.tmp1375, label %.for.continue.1367, label %.for.end.1367
.for.continue.1367:
%.tmp1376 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1377 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1376, i32 0, i32 0
%.tmp1378 = load i8, i8* %.tmp1377
%.tmp1379 = icmp eq i8 %.tmp1378, 118
br i1 %.tmp1379, label %.if.true.1380, label %.if.false.1380
.if.true.1380:
%.tmp1381 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1382 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1381, i32 0, i32 1
%.tmp1383 = load i8*, i8** %.tmp1382
%.tmp1384 = call i32(i8*) @strlen(i8* %.tmp1383)
%.tmp1385 = sub i32 %.tmp1384, 2
%qv_len = alloca i32
store i32 %.tmp1385, i32* %qv_len
%.tmp1386 = load i32, i32* %qv_len
%.tmp1387 = add i32 %.tmp1386, 1
%.tmp1388 = call i8*(i32) @malloc(i32 %.tmp1387)
%tmp_buff = alloca i8*
store i8* %.tmp1388, i8** %tmp_buff
%.tmp1389 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1390 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1389, i32 0, i32 1
%.tmp1391 = load i8*, i8** %.tmp1390
%.tmp1393 = getelementptr [8 x i8], [8 x i8]*@.str1392, i32 0, i32 0
%.tmp1394 = load i8*, i8** %tmp_buff
%.tmp1395 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1391, i8* %.tmp1393, i8* %.tmp1394)
%.tmp1396 = load i8*, i8** %tmp_buff
%.tmp1397 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1398 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1397, i32 0, i32 0
%.tmp1399 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1398
%.tmp1400 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1399, i32 0, i32 1
%.tmp1401 = load i8*, i8** %.tmp1400
%.tmp1402 = load i32, i32* %qv_len
%.tmp1403 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1396, i8* %.tmp1401, i32 %.tmp1402)
%.tmp1404 = icmp eq i32 %.tmp1403, 0
%.tmp1405 = load i32, i32* %qv_len
%.tmp1406 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1407 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1406, i32 0, i32 0
%.tmp1408 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1407
%.tmp1409 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1408, i32 0, i32 1
%.tmp1410 = load i8*, i8** %.tmp1409
%.tmp1411 = call i32(i8*) @strlen(i8* %.tmp1410)
%.tmp1412 = icmp eq i32 %.tmp1405, %.tmp1411
%.tmp1413 = and i1 %.tmp1404, %.tmp1412
br i1 %.tmp1413, label %.if.true.1414, label %.if.false.1414
.if.true.1414:
%.tmp1415 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1416 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1415, i32 0, i32 0
%.tmp1417 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1416
%.tmp1418 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1419 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1418, i32 0, i32 0
%.tmp1420 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1419
%.tmp1421 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1420, i32 0, i32 0
%.tmp1422 = load i8*, i8** %.tmp1421
%.tmp1423 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1424 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1423, i32 0, i32 0
%.tmp1425 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1424
%.tmp1426 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1425, i32 0, i32 1
%.tmp1427 = load i8*, i8** %.tmp1426
%.tmp1428 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1417, i8* %.tmp1422, i8* %.tmp1427)
store %m286$.Node.type* %.tmp1428, %m286$.Node.type** %child
%.tmp1429 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1430 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1429, %m286$.Node.type* %.tmp1430)
%.tmp1431 = load i32, i32* %new_children
%.tmp1432 = add i32 %.tmp1431, 1
store i32 %.tmp1432, i32* %new_children
%.tmp1433 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1434 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1433, i32 0, i32 0
%.tmp1435 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1436 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1435, i32 0, i32 0
%.tmp1437 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1436
%.tmp1438 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1437, i32 0, i32 5
%.tmp1439 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1438
store %m287$.Token.type* %.tmp1439, %m287$.Token.type** %.tmp1434
br label %.if.end.1414
.if.false.1414:
%.tmp1440 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1441 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1440, i32 0, i32 0
%.tmp1442 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1441
%.tmp1443 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1442, i32 0, i32 1
%.tmp1444 = load i8*, i8** %.tmp1443
%token_value = alloca i8*
store i8* %.tmp1444, i8** %token_value
%.tmp1445 = load i8*, i8** %token_value
%.tmp1446 = icmp eq i8* %.tmp1445, null
br i1 %.tmp1446, label %.if.true.1447, label %.if.false.1447
.if.true.1447:
%.tmp1449 = getelementptr [7 x i8], [7 x i8]*@.str1448, i32 0, i32 0
store i8* %.tmp1449, i8** %token_value
br label %.if.end.1447
.if.false.1447:
br label %.if.end.1447
.if.end.1447:
%.tmp1451 = getelementptr [15 x i8], [15 x i8]*@.str1450, i32 0, i32 0
%err_fmt = alloca i8*
store i8* %.tmp1451, i8** %err_fmt
%.tmp1453 = getelementptr [31 x i8], [31 x i8]*@.str1452, i32 0, i32 0
%err_msg = alloca i8*
store i8* %.tmp1453, i8** %err_msg
%.tmp1454 = load i8*, i8** %err_msg
%.tmp1455 = call i32(i8*) @strlen(i8* %.tmp1454)
%.tmp1456 = load i8*, i8** %tmp_buff
%.tmp1457 = call i32(i8*) @strlen(i8* %.tmp1456)
%.tmp1458 = add i32 %.tmp1455, %.tmp1457
%.tmp1459 = load i8*, i8** %token_value
%.tmp1460 = call i32(i8*) @strlen(i8* %.tmp1459)
%.tmp1461 = add i32 %.tmp1458, %.tmp1460
%.tmp1462 = load i8*, i8** %err_fmt
%.tmp1463 = call i32(i8*) @strlen(i8* %.tmp1462)
%.tmp1464 = add i32 %.tmp1461, %.tmp1463
%.tmp1465 = mul i32 3, 2
%.tmp1466 = sub i32 %.tmp1464, %.tmp1465
%.tmp1467 = add i32 %.tmp1466, 1
%err_len = alloca i32
store i32 %.tmp1467, i32* %err_len
%.tmp1468 = load i32, i32* %err_len
%.tmp1469 = call i8*(i32) @malloc(i32 %.tmp1468)
%err_buf = alloca i8*
store i8* %.tmp1469, i8** %err_buf
%.tmp1470 = load i8*, i8** %err_buf
%.tmp1471 = load i32, i32* %err_len
%.tmp1472 = load i8*, i8** %err_fmt
%.tmp1473 = load i8*, i8** %err_msg
%.tmp1474 = load i8*, i8** %tmp_buff
%.tmp1475 = load i8*, i8** %token_value
%.tmp1476 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1470, i32 %.tmp1471, i8* %.tmp1472, i8* %.tmp1473, i8* %.tmp1474, i8* %.tmp1475)
%.tmp1477 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1478 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1477, i32 0, i32 0
%.tmp1479 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1478
%.tmp1480 = load i8*, i8** %err_buf
%.tmp1481 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1479, i8* %.tmp1480)
store %m717$.Error.type* %.tmp1481, %m717$.Error.type** %err
br label %.if.end.1414
.if.end.1414:
%.tmp1482 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp1482)
br label %.if.end.1380
.if.false.1380:
%.tmp1483 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1484 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1483, i32 0, i32 0
%.tmp1485 = load i8, i8* %.tmp1484
%.tmp1486 = icmp eq i8 %.tmp1485, 116
br i1 %.tmp1486, label %.if.true.1487, label %.if.false.1487
.if.true.1487:
%.tmp1488 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1489 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1488, i32 0, i32 1
%.tmp1490 = load i8*, i8** %.tmp1489
%.tmp1491 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1492 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1491, i32 0, i32 0
%.tmp1493 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1492
%.tmp1494 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1493, i32 0, i32 0
%.tmp1495 = load i8*, i8** %.tmp1494
%.tmp1496 = call i32(i8*,i8*) @strcmp(i8* %.tmp1490, i8* %.tmp1495)
%.tmp1497 = icmp eq i32 %.tmp1496, 0
br i1 %.tmp1497, label %.if.true.1498, label %.if.false.1498
.if.true.1498:
%.tmp1499 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1500 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1499, i32 0, i32 0
%.tmp1501 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1500
%.tmp1502 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1503 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1502, i32 0, i32 0
%.tmp1504 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1503
%.tmp1505 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1504, i32 0, i32 0
%.tmp1506 = load i8*, i8** %.tmp1505
%.tmp1507 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1508 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1507, i32 0, i32 0
%.tmp1509 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1508
%.tmp1510 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1509, i32 0, i32 1
%.tmp1511 = load i8*, i8** %.tmp1510
%.tmp1512 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1501, i8* %.tmp1506, i8* %.tmp1511)
store %m286$.Node.type* %.tmp1512, %m286$.Node.type** %child
%.tmp1513 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1514 = load %m286$.Node.type*, %m286$.Node.type** %child
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1513, %m286$.Node.type* %.tmp1514)
%.tmp1515 = load i32, i32* %new_children
%.tmp1516 = add i32 %.tmp1515, 1
store i32 %.tmp1516, i32* %new_children
%.tmp1517 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1518 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1517, i32 0, i32 0
%.tmp1519 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1520 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1519, i32 0, i32 0
%.tmp1521 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1520
%.tmp1522 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1521, i32 0, i32 5
%.tmp1523 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1522
store %m287$.Token.type* %.tmp1523, %m287$.Token.type** %.tmp1518
br label %.if.end.1498
.if.false.1498:
%.tmp1525 = getelementptr [13 x i8], [13 x i8]*@.str1524, i32 0, i32 0
%err_fmt_t = alloca i8*
store i8* %.tmp1525, i8** %err_fmt_t
%.tmp1527 = getelementptr [30 x i8], [30 x i8]*@.str1526, i32 0, i32 0
%err_msg_t = alloca i8*
store i8* %.tmp1527, i8** %err_msg_t
%.tmp1528 = load i8*, i8** %err_fmt_t
%.tmp1529 = call i32(i8*) @strlen(i8* %.tmp1528)
%.tmp1530 = load i8*, i8** %err_msg_t
%.tmp1531 = call i32(i8*) @strlen(i8* %.tmp1530)
%.tmp1532 = add i32 %.tmp1529, %.tmp1531
%.tmp1533 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1534 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1533, i32 0, i32 1
%.tmp1535 = load i8*, i8** %.tmp1534
%.tmp1536 = call i32(i8*) @strlen(i8* %.tmp1535)
%.tmp1537 = add i32 %.tmp1532, %.tmp1536
%.tmp1538 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1539 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1538, i32 0, i32 0
%.tmp1540 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1539
%.tmp1541 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1540, i32 0, i32 0
%.tmp1542 = load i8*, i8** %.tmp1541
%.tmp1543 = call i32(i8*) @strlen(i8* %.tmp1542)
%.tmp1544 = add i32 %.tmp1537, %.tmp1543
%err_len_t = alloca i32
store i32 %.tmp1544, i32* %err_len_t
%.tmp1545 = load i32, i32* %err_len_t
%.tmp1546 = call i8*(i32) @malloc(i32 %.tmp1545)
%err_buf_t = alloca i8*
store i8* %.tmp1546, i8** %err_buf_t
%.tmp1547 = load i8*, i8** %err_buf_t
%.tmp1548 = load i32, i32* %err_len_t
%.tmp1549 = load i8*, i8** %err_fmt_t
%.tmp1550 = load i8*, i8** %err_msg_t
%.tmp1551 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1552 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1551, i32 0, i32 1
%.tmp1553 = load i8*, i8** %.tmp1552
%.tmp1554 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1555 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1554, i32 0, i32 0
%.tmp1556 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1555
%.tmp1557 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1556, i32 0, i32 0
%.tmp1558 = load i8*, i8** %.tmp1557
%.tmp1559 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1547, i32 %.tmp1548, i8* %.tmp1549, i8* %.tmp1550, i8* %.tmp1553, i8* %.tmp1558)
%.tmp1560 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1561 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1560, i32 0, i32 0
%.tmp1562 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1561
%.tmp1563 = load i8*, i8** %err_buf_t
%.tmp1564 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1562, i8* %.tmp1563)
store %m717$.Error.type* %.tmp1564, %m717$.Error.type** %err
br label %.if.end.1498
.if.end.1498:
br label %.if.end.1487
.if.false.1487:
%.tmp1565 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1566 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1565, i32 0, i32 0
%.tmp1567 = load i8, i8* %.tmp1566
%.tmp1568 = icmp eq i8 %.tmp1567, 97
br i1 %.tmp1568, label %.if.true.1569, label %.if.false.1569
.if.true.1569:
%.tmp1570 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1571 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1570, i32 0, i32 1
%.tmp1572 = load %m286$.Rule.type**, %m286$.Rule.type*** %.tmp1571
%.tmp1573 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1574 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1573, i32 0, i32 1
%.tmp1575 = load i8*, i8** %.tmp1574
%.tmp1576 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1572, i8* %.tmp1575)
%alias_rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1576, %m286$.Rule.type** %alias_rule
%.tmp1577 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1578 = icmp eq %m286$.Rule.type* %.tmp1577, null
br i1 %.tmp1578, label %.if.true.1579, label %.if.false.1579
.if.true.1579:
%.tmp1580 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1581 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1580, i32 0, i32 0
%.tmp1582 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1581
%.tmp1584 = getelementptr [30 x i8], [30 x i8]*@.str1583, i32 0, i32 0
%.tmp1585 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1582, i8* %.tmp1584)
store %m717$.Error.type* %.tmp1585, %m717$.Error.type** %err
br label %.if.end.1579
.if.false.1579:
%.tmp1586 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1587 = load %m286$.Rule.type*, %m286$.Rule.type** %alias_rule
%.tmp1588 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1586, %m286$.Rule.type* %.tmp1587)
%parse_result = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1588, %m286$.ParseResult.type** %parse_result
%.tmp1589 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1590 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1589, i32 0, i32 0
%.tmp1591 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1590
%.tmp1592 = icmp ne %m717$.Error.type* %.tmp1591, null
br i1 %.tmp1592, label %.if.true.1593, label %.if.false.1593
.if.true.1593:
%.tmp1594 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1595 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1594, i32 0, i32 0
%.tmp1596 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1595
store %m717$.Error.type* %.tmp1596, %m717$.Error.type** %err
br label %.if.end.1593
.if.false.1593:
%.tmp1597 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1598 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1599 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1598, i32 0, i32 1
%.tmp1600 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1599
call void(%m286$.Node.type*,%m286$.Node.type*) @m286$child_append.v.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp1597, %m286$.Node.type* %.tmp1600)
%.tmp1601 = load i32, i32* %new_children
%.tmp1602 = add i32 %.tmp1601, 1
store i32 %.tmp1602, i32* %new_children
br label %.if.end.1593
.if.end.1593:
%.tmp1603 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %parse_result
%.tmp1604 = bitcast %m286$.ParseResult.type* %.tmp1603 to i8*
call void(i8*) @free(i8* %.tmp1604)
br label %.if.end.1579
.if.end.1579:
br label %.if.end.1569
.if.false.1569:
%.tmp1606 = getelementptr [41 x i8], [41 x i8]*@.str1605, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1606)
br label %.if.end.1569
.if.end.1569:
br label %.if.end.1487
.if.end.1487:
br label %.if.end.1380
.if.end.1380:
%.tmp1607 = load %m286$.Query.type*, %m286$.Query.type** %q
%.tmp1608 = getelementptr %m286$.Query.type, %m286$.Query.type* %.tmp1607, i32 0, i32 2
%.tmp1609 = load %m286$.Query.type*, %m286$.Query.type** %.tmp1608
store %m286$.Query.type* %.tmp1609, %m286$.Query.type** %q
br label %.for.start.1367
.for.end.1367:
%.tmp1610 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1611 = icmp ne %m717$.Error.type* %.tmp1610, null
br i1 %.tmp1611, label %.if.true.1612, label %.if.false.1612
.if.true.1612:
%.tmp1613 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1614 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1613, i32 0, i32 0
%.tmp1615 = load %m287$.Token.type*, %m287$.Token.type** %start_token
store %m287$.Token.type* %.tmp1615, %m287$.Token.type** %.tmp1614
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1616
.for.start.1616:
%.tmp1617 = load i32, i32* %i
%.tmp1618 = load i32, i32* %new_children
%.tmp1619 = icmp slt i32 %.tmp1617, %.tmp1618
br i1 %.tmp1619, label %.for.continue.1616, label %.for.end.1616
.for.continue.1616:
%.tmp1620 = load %m286$.Node.type*, %m286$.Node.type** %base
call void(%m286$.Node.type*) @m286$child_pop.v.m286$.Node.typep(%m286$.Node.type* %.tmp1620)
%.tmp1621 = load i32, i32* %i
%.tmp1622 = add i32 %.tmp1621, 1
store i32 %.tmp1622, i32* %i
br label %.for.start.1616
.for.end.1616:
br label %.if.end.1612
.if.false.1612:
br label %.if.end.1612
.if.end.1612:
%.tmp1623 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1624 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1623, i32 0, i32 2
%.tmp1625 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1624
%.tmp1626 = icmp ne %m286$.Matcher.type* %.tmp1625, null
%.tmp1627 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1628 = icmp ne %m717$.Error.type* %.tmp1627, null
%.tmp1629 = and i1 %.tmp1626, %.tmp1628
br i1 %.tmp1629, label %.if.true.1630, label %.if.false.1630
.if.true.1630:
%.tmp1631 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1632 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1633 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1632, i32 0, i32 2
%.tmp1634 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1633
%.tmp1635 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1636 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1631, %m286$.Matcher.type* %.tmp1634, %m286$.Node.type* %.tmp1635)
%new_err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp1636, %m717$.Error.type** %new_err
%.tmp1637 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1638 = icmp eq %m717$.Error.type* %.tmp1637, null
br i1 %.tmp1638, label %.if.true.1639, label %.if.false.1639
.if.true.1639:
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1639
.if.false.1639:
%.tmp1640 = load %m717$.Error.type*, %m717$.Error.type** %new_err
%.tmp1641 = bitcast %m717$.Error.type* %.tmp1640 to i8*
call void(i8*) @free(i8* %.tmp1641)
br label %.if.end.1639
.if.end.1639:
br label %.if.end.1630
.if.false.1630:
br label %.if.end.1630
.if.end.1630:
%.tmp1642 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1643 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1642, i32 0, i32 1
%.tmp1644 = load i8, i8* %.tmp1643
%.tmp1645 = icmp eq i8 %.tmp1644, 49
br i1 %.tmp1645, label %.if.true.1646, label %.if.false.1646
.if.true.1646:
br label %.if.end.1646
.if.false.1646:
%.tmp1647 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1648 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1647, i32 0, i32 1
%.tmp1649 = load i8, i8* %.tmp1648
%.tmp1650 = icmp eq i8 %.tmp1649, 43
%.tmp1651 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1652 = icmp eq %m717$.Error.type* %.tmp1651, null
%.tmp1653 = and i1 %.tmp1650, %.tmp1652
br i1 %.tmp1653, label %.if.true.1654, label %.if.false.1654
.if.true.1654:
%.tmp1655 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1656 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1657 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1658 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1655, %m286$.Matcher.type* %.tmp1656, %m286$.Node.type* %.tmp1657)
store %m717$.Error.type* %.tmp1658, %m717$.Error.type** %err
%.tmp1659 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1660 = icmp ne %m717$.Error.type* %.tmp1659, null
br i1 %.tmp1660, label %.if.true.1661, label %.if.false.1661
.if.true.1661:
%.tmp1662 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1663 = bitcast %m717$.Error.type* %.tmp1662 to i8*
call void(i8*) @free(i8* %.tmp1663)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1661
.if.false.1661:
%.tmp1664 = bitcast ptr null to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1664
br label %.if.end.1661
.if.end.1661:
br label %.if.end.1654
.if.false.1654:
%.tmp1665 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1666 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1665, i32 0, i32 1
%.tmp1667 = load i8, i8* %.tmp1666
%.tmp1668 = icmp eq i8 %.tmp1667, 63
%.tmp1669 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1670 = icmp ne %m717$.Error.type* %.tmp1669, null
%.tmp1671 = and i1 %.tmp1668, %.tmp1670
br i1 %.tmp1671, label %.if.true.1672, label %.if.false.1672
.if.true.1672:
%.tmp1673 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1674 = bitcast %m717$.Error.type* %.tmp1673 to i8*
call void(i8*) @free(i8* %.tmp1674)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1672
.if.false.1672:
%.tmp1675 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1676 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1675, i32 0, i32 1
%.tmp1677 = load i8, i8* %.tmp1676
%.tmp1678 = icmp eq i8 %.tmp1677, 42
br i1 %.tmp1678, label %.if.true.1679, label %.if.false.1679
.if.true.1679:
%.tmp1680 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1681 = icmp ne %m717$.Error.type* %.tmp1680, null
br i1 %.tmp1681, label %.if.true.1682, label %.if.false.1682
.if.true.1682:
%.tmp1683 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1684 = bitcast %m717$.Error.type* %.tmp1683 to i8*
call void(i8*) @free(i8* %.tmp1684)
store %m717$.Error.type* null, %m717$.Error.type** %err
br label %.if.end.1682
.if.false.1682:
%.tmp1685 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1686 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1687 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1688 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1685, %m286$.Matcher.type* %.tmp1686, %m286$.Node.type* %.tmp1687)
ret %m717$.Error.type* %.tmp1688
br label %.if.end.1682
.if.end.1682:
br label %.if.end.1679
.if.false.1679:
br label %.if.end.1679
.if.end.1679:
br label %.if.end.1672
.if.end.1672:
br label %.if.end.1654
.if.end.1654:
br label %.if.end.1646
.if.end.1646:
%.tmp1689 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1690 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1689, i32 0, i32 3
%.tmp1691 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1690
%.tmp1692 = icmp ne %m286$.Matcher.type* %.tmp1691, null
%.tmp1693 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1694 = icmp eq %m717$.Error.type* %.tmp1693, null
%.tmp1695 = and i1 %.tmp1692, %.tmp1694
br i1 %.tmp1695, label %.if.true.1696, label %.if.false.1696
.if.true.1696:
%.tmp1697 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1698 = load %m286$.Matcher.type*, %m286$.Matcher.type** %m
%.tmp1699 = getelementptr %m286$.Matcher.type, %m286$.Matcher.type* %.tmp1698, i32 0, i32 3
%.tmp1700 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1699
%.tmp1701 = load %m286$.Node.type*, %m286$.Node.type** %base
%.tmp1702 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1697, %m286$.Matcher.type* %.tmp1700, %m286$.Node.type* %.tmp1701)
store %m717$.Error.type* %.tmp1702, %m717$.Error.type** %err
br label %.if.end.1696
.if.false.1696:
br label %.if.end.1696
.if.end.1696:
%.tmp1703 = load %m717$.Error.type*, %m717$.Error.type** %err
%.tmp1704 = bitcast %m717$.Error.type* %.tmp1703 to %m717$.Error.type*
ret %m717$.Error.type* %.tmp1704
}
define %m286$.ParseResult.type* @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.c.arg, %m286$.Rule.type* %.rule.arg) {
%c = alloca %m286$.AstContext.type*
store %m286$.AstContext.type* %.c.arg, %m286$.AstContext.type** %c
%rule = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.rule.arg, %m286$.Rule.type** %rule
%.tmp1705 = load i32, i32* @ParseResult_size
%.tmp1706 = call i8*(i32) @malloc(i32 %.tmp1705)
%.tmp1707 = bitcast i8* %.tmp1706 to %m286$.ParseResult.type*
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1707, %m286$.ParseResult.type** %res
%.tmp1708 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1709 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1708, i32 0, i32 0
store %m717$.Error.type* null, %m717$.Error.type** %.tmp1709
%.tmp1710 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1711 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1710, i32 0, i32 1
%.tmp1712 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1713 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1712, i32 0, i32 0
%.tmp1714 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1713
%.tmp1715 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1716 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1715, i32 0, i32 0
%.tmp1717 = load i8*, i8** %.tmp1716
%.tmp1718 = bitcast ptr null to i8*
%.tmp1719 = call %m286$.Node.type*(%m287$.Token.type*,i8*,i8*) @m286$new_node.m286$.Node.typep.m287$.Token.typep.cp.cp(%m287$.Token.type* %.tmp1714, i8* %.tmp1717, i8* %.tmp1718)
store %m286$.Node.type* %.tmp1719, %m286$.Node.type** %.tmp1711
%.tmp1720 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1721 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %.tmp1720, i32 0, i32 0
%.tmp1722 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1721
%start_match = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp1722, %m287$.Token.type** %start_match
%.tmp1723 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1724 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1723, i32 0, i32 0
%.tmp1725 = load %m286$.AstContext.type*, %m286$.AstContext.type** %c
%.tmp1726 = load %m286$.Rule.type*, %m286$.Rule.type** %rule
%.tmp1727 = getelementptr %m286$.Rule.type, %m286$.Rule.type* %.tmp1726, i32 0, i32 1
%.tmp1728 = load %m286$.Matcher.type*, %m286$.Matcher.type** %.tmp1727
%.tmp1729 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1730 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1729, i32 0, i32 1
%.tmp1731 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1730
%.tmp1732 = call %m717$.Error.type*(%m286$.AstContext.type*,%m286$.Matcher.type*,%m286$.Node.type*) @m286$parse_query.m717$.Error.typep.m286$.AstContext.typep.m286$.Matcher.typep.m286$.Node.typep(%m286$.AstContext.type* %.tmp1725, %m286$.Matcher.type* %.tmp1728, %m286$.Node.type* %.tmp1731)
store %m717$.Error.type* %.tmp1732, %m717$.Error.type** %.tmp1724
%.tmp1733 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1733
}
define %m286$.ParseResult.type* @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.grammar.arg, i8* %.start.arg, %m287$.Token.type* %.tokens.arg) {
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.grammar.arg, %m286$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tokens.arg, %m287$.Token.type** %tokens
%.tmp1734 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp1735 = load i8*, i8** %start
%.tmp1736 = call %m286$.Rule.type*(%m286$.Rule.type**,i8*) @m286$_find_rule.m286$.Rule.typep.m286$.Rule.typepp.cp(%m286$.Rule.type** %.tmp1734, i8* %.tmp1735)
%start_matcher = alloca %m286$.Rule.type*
store %m286$.Rule.type* %.tmp1736, %m286$.Rule.type** %start_matcher
%.tmp1737 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1738 = icmp ne %m286$.Rule.type* %.tmp1737, null
%.tmp1740 = getelementptr [44 x i8], [44 x i8]*@.str1739, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1738, i8* %.tmp1740)
%c = alloca %m286$.AstContext.type
%.tmp1741 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1742 = load %m287$.Token.type*, %m287$.Token.type** %tokens
store %m287$.Token.type* %.tmp1742, %m287$.Token.type** %.tmp1741
%.tmp1743 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 1
%.tmp1744 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
store %m286$.Rule.type** %.tmp1744, %m286$.Rule.type*** %.tmp1743
%.tmp1745 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0
%.tmp1746 = load %m286$.Rule.type*, %m286$.Rule.type** %start_matcher
%.tmp1747 = call %m286$.ParseResult.type*(%m286$.AstContext.type*,%m286$.Rule.type*) @m286$parse_to_ast.m286$.ParseResult.typep.m286$.AstContext.typep.m286$.Rule.typep(%m286$.AstContext.type* %.tmp1745, %m286$.Rule.type* %.tmp1746)
%res = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp1747, %m286$.ParseResult.type** %res
%.tmp1748 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1749 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1748
%.tmp1750 = getelementptr %m287$.Token.type, %m287$.Token.type* %.tmp1749, i32 0, i32 0
%.tmp1751 = load i8*, i8** %.tmp1750
%.tmp1753 = getelementptr [4 x i8], [4 x i8]*@.str1752, i32 0, i32 0
%.tmp1754 = call i32(i8*,i8*) @strcmp(i8* %.tmp1751, i8* %.tmp1753)
%.tmp1755 = icmp ne i32 %.tmp1754, 0
%.tmp1756 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1757 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1756, i32 0, i32 0
%.tmp1758 = load %m717$.Error.type*, %m717$.Error.type** %.tmp1757
%.tmp1759 = icmp eq %m717$.Error.type* %.tmp1758, null
%.tmp1760 = and i1 %.tmp1755, %.tmp1759
br i1 %.tmp1760, label %.if.true.1761, label %.if.false.1761
.if.true.1761:
%.tmp1762 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
%.tmp1763 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp1762, i32 0, i32 0
%.tmp1764 = getelementptr %m286$.AstContext.type, %m286$.AstContext.type* %c, i32 0, i32 0
%.tmp1765 = load %m287$.Token.type*, %m287$.Token.type** %.tmp1764
%.tmp1767 = getelementptr [26 x i8], [26 x i8]*@.str1766, i32 0, i32 0
%.tmp1768 = call %m717$.Error.type*(%m287$.Token.type*,i8*) @m717$from.m717$.Error.typep.m287$.Token.typep.cp(%m287$.Token.type* %.tmp1765, i8* %.tmp1767)
store %m717$.Error.type* %.tmp1768, %m717$.Error.type** %.tmp1763
br label %.if.end.1761
.if.false.1761:
br label %.if.end.1761
.if.end.1761:
%.tmp1769 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %res
ret %m286$.ParseResult.type* %.tmp1769
}
@.str806 = constant [2 x i8] c"(\00"
@.str825 = constant [2 x i8] c"|\00"
@.str844 = constant [2 x i8] c")\00"
@.str853 = constant [4 x i8] c"EOF\00"
@.str870 = constant [2 x i8] c"|\00"
@.str879 = constant [2 x i8] c")\00"
@.str885 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str908 = constant [2 x i8] c"|\00"
@.str925 = constant [2 x i8] c")\00"
@.str931 = constant [22 x i8] c"open brace not closed\00"
@.str945 = constant [2 x i8] c"+\00"
@.str964 = constant [2 x i8] c"*\00"
@.str983 = constant [2 x i8] c"?\00"
@.str1004 = constant [2 x i8] c"(\00"
@.str1013 = constant [5 x i8] c"WORD\00"
@.str1032 = constant [5 x i8] c"WORD\00"
@.str1039 = constant [7 x i8] c"STRING\00"
@.str1082 = constant [7 x i8] c"STRING\00"
@.str1107 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1116 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1147 = constant [5 x i8] c"WORD\00"
@.str1152 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1166 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1180 = constant [2 x i8] c":\00"
@.str1192 = constant [27 x i8] c"expected : after rule name\00"
@.str1229 = constant [4 x i8] c"EOF\00"
@.str1238 = constant [3 x i8] c"NL\00"
@.str1392 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1448 = constant [7 x i8] c"(null)\00"
@.str1450 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1452 = constant [31 x i8] c"unable to match token by value\00"
@.str1524 = constant [13 x i8] c"%s: %s != %s\00"
@.str1526 = constant [30 x i8] c"unable to match token by type\00"
@.str1583 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1605 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1739 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1752 = constant [4 x i8] c"EOF\00"
@.str1766 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1771$grammar.cp() {
%.tmp1773 = getelementptr [1609 x i8], [1609 x i8]*@.str1772, i32 0, i32 0
ret i8* %.tmp1773
}
@.str1772 = constant [1609 x i8] c"
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
define i8* @m1774$node_to_string.cp.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp1775 = call %m0$.File.type*() @tmpfile()
%tmp = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1775, %m0$.File.type** %tmp
%.tmp1776 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp1777 = load %m0$.File.type*, %m0$.File.type** %tmp
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1774$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1776, %m0$.File.type* %.tmp1777, i32 1)
%.tmp1778 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1779 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1778)
%.tmp1780 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1781 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1780)
%str_len = alloca i32
store i32 %.tmp1781, i32* %str_len
%.tmp1782 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1783 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1782)
%tmp_fd = alloca i32
store i32 %.tmp1783, i32* %tmp_fd
%.tmp1784 = load i32, i32* %tmp_fd
%.tmp1785 = load i32, i32* @SEEK_SET
%.tmp1786 = call i32(i32,i32,i32) @lseek(i32 %.tmp1784, i32 0, i32 %.tmp1785)
%.tmp1787 = load i32, i32* %str_len
%.tmp1788 = call i8*(i32) @malloc(i32 %.tmp1787)
%buf = alloca i8*
store i8* %.tmp1788, i8** %buf
%.tmp1789 = load i32, i32* %tmp_fd
%.tmp1790 = load i8*, i8** %buf
%.tmp1791 = load i32, i32* %str_len
%.tmp1792 = call i32(i32,i8*,i32) @read(i32 %.tmp1789, i8* %.tmp1790, i32 %.tmp1791)
%read = alloca i32
store i32 %.tmp1792, i32* %read
%.tmp1793 = load i32, i32* %read
%.tmp1794 = load i32, i32* %str_len
%.tmp1795 = icmp ne i32 %.tmp1793, %.tmp1794
br i1 %.tmp1795, label %.if.true.1796, label %.if.false.1796
.if.true.1796:
%.tmp1797 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp1797)
store i8* null, i8** %buf
br label %.if.end.1796
.if.false.1796:
br label %.if.end.1796
.if.end.1796:
%.tmp1798 = load i8*, i8** %buf
ret i8* %.tmp1798
}
define void @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1799 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1801 = getelementptr [2 x i8], [2 x i8]*@.str1800, i32 0, i32 0
%.tmp1802 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1799, i8* %.tmp1801)
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1803
.for.start.1803:
%.tmp1804 = load i32, i32* %i
%.tmp1805 = load i32, i32* %indent
%.tmp1806 = icmp slt i32 %.tmp1804, %.tmp1805
br i1 %.tmp1806, label %.for.continue.1803, label %.for.end.1803
.for.continue.1803:
%.tmp1807 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1809 = getelementptr [3 x i8], [3 x i8]*@.str1808, i32 0, i32 0
%.tmp1810 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1807, i8* %.tmp1809)
%.tmp1811 = load i32, i32* %i
%.tmp1812 = add i32 %.tmp1811, 1
store i32 %.tmp1812, i32* %i
br label %.for.start.1803
.for.end.1803:
ret void
}
define void @m1774$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1813 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1814 = icmp eq %m286$.Node.type* %.tmp1813, null
br i1 %.tmp1814, label %.if.true.1815, label %.if.false.1815
.if.true.1815:
%.tmp1816 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1818 = getelementptr [7 x i8], [7 x i8]*@.str1817, i32 0, i32 0
%.tmp1819 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1816, i8* %.tmp1818)
ret void
br label %.if.end.1815
.if.false.1815:
br label %.if.end.1815
.if.end.1815:
%.tmp1820 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1822 = getelementptr [2 x i8], [2 x i8]*@.str1821, i32 0, i32 0
%.tmp1823 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1820, i8* %.tmp1822)
%.tmp1824 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1825 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1824, i32 %.tmp1825)
%.tmp1826 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1828 = getelementptr [13 x i8], [13 x i8]*@.str1827, i32 0, i32 0
%.tmp1829 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1830 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1829, i32 0, i32 0
%.tmp1831 = load i8*, i8** %.tmp1830
%.tmp1832 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1826, i8* %.tmp1828, i8* %.tmp1831)
%.tmp1833 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1834 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1833, i32 %.tmp1834)
%.tmp1835 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1837 = getelementptr [12 x i8], [12 x i8]*@.str1836, i32 0, i32 0
%.tmp1838 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1839 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1838, i32 0, i32 1
%.tmp1840 = load i8*, i8** %.tmp1839
%.tmp1841 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1835, i8* %.tmp1837, i8* %.tmp1840)
%.tmp1842 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1843 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1842, i32 %.tmp1843)
%.tmp1844 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1846 = getelementptr [11 x i8], [11 x i8]*@.str1845, i32 0, i32 0
%.tmp1847 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1848 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1847, i32 0, i32 3
%.tmp1849 = load i32, i32* %.tmp1848
%.tmp1850 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1844, i8* %.tmp1846, i32 %.tmp1849)
%.tmp1851 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1852 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1851, i32 %.tmp1852)
%.tmp1853 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1855 = getelementptr [19 x i8], [19 x i8]*@.str1854, i32 0, i32 0
%.tmp1856 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1857 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1856, i32 0, i32 4
%.tmp1858 = load i32, i32* %.tmp1857
%.tmp1859 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1853, i8* %.tmp1855, i32 %.tmp1858)
%.tmp1860 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1861 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1860, i32 %.tmp1861)
%.tmp1862 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1864 = getelementptr [9 x i8], [9 x i8]*@.str1863, i32 0, i32 0
%.tmp1865 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1862, i8* %.tmp1864)
%.tmp1866 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1867 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1866, i32 0, i32 7
%.tmp1868 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1867
%.tmp1869 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1870 = load i32, i32* %indent
%.tmp1871 = add i32 %.tmp1870, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1774$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1868, %m0$.File.type* %.tmp1869, i32 %.tmp1871)
%.tmp1872 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1873 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1872, i32 %.tmp1873)
%.tmp1874 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1876 = getelementptr [13 x i8], [13 x i8]*@.str1875, i32 0, i32 0
%.tmp1877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1874, i8* %.tmp1876)
%.tmp1878 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1879 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1878, i32 0, i32 6
%.tmp1880 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1879
%.tmp1881 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1882 = load i32, i32* %indent
%.tmp1883 = add i32 %.tmp1882, 1
call void(%m286$.Node.type*,%m0$.File.type*,i32) @m1774$_node_to_string.v.m286$.Node.typep.m0$.File.typep.i(%m286$.Node.type* %.tmp1880, %m0$.File.type* %.tmp1881, i32 %.tmp1883)
%.tmp1884 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1885 = load i32, i32* %indent
%.tmp1886 = sub i32 %.tmp1885, 1
call void(%m0$.File.type*,i32) @m1774$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1884, i32 %.tmp1886)
%.tmp1887 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1889 = getelementptr [2 x i8], [2 x i8]*@.str1888, i32 0, i32 0
%.tmp1890 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1887, i8* %.tmp1889)
ret void
}
@.str1800 = constant [2 x i8] c"\0A\00"
@.str1808 = constant [3 x i8] c"  \00"
@.str1817 = constant [7 x i8] c"(null)\00"
@.str1821 = constant [2 x i8] c"{\00"
@.str1827 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1836 = constant [12 x i8] c"\22value\22: %s\00"
@.str1845 = constant [11 x i8] c"\22line\22: %d\00"
@.str1854 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1863 = constant [9 x i8] c"\22next\22: \00"
@.str1875 = constant [13 x i8] c"\22children\22: \00"
@.str1888 = constant [2 x i8] c"}\00"
%m1891$.SYStack.type = type {%m286$.Node.type*,%m1891$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1891$.SYStack.type* @m1891$stack_new.m1891$.SYStack.typep() {
%.tmp1892 = load i32, i32* @SYStack_size
%.tmp1893 = call i8*(i32) @malloc(i32 %.tmp1892)
%.tmp1894 = bitcast i8* %.tmp1893 to %m1891$.SYStack.type*
%s = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1894, %m1891$.SYStack.type** %s
%.tmp1895 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
%.tmp1896 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1895, i32 0, i32 0
store %m286$.Node.type* null, %m286$.Node.type** %.tmp1896
%.tmp1897 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
%.tmp1898 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1897, i32 0, i32 1
store %m1891$.SYStack.type* null, %m1891$.SYStack.type** %.tmp1898
%.tmp1899 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
ret %m1891$.SYStack.type* %.tmp1899
}
define %m1891$.SYStack.type* @m1891$sy_algorithm.m1891$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.assignable.arg) {
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.assignable.arg, %m286$.Node.type** %assignable
%.tmp1900 = call %m1891$.SYStack.type*() @m1891$stack_new.m1891$.SYStack.typep()
%out_stack = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1900, %m1891$.SYStack.type** %out_stack
%.tmp1901 = call %m1891$.SYStack.type*() @m1891$stack_new.m1891$.SYStack.typep()
%op_stack = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1901, %m1891$.SYStack.type** %op_stack
%.tmp1902 = call %m1891$.SYStack.type*() @m1891$stack_new.m1891$.SYStack.typep()
%token_stack = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1902, %m1891$.SYStack.type** %token_stack
%ptr = alloca %m286$.Node.type*
%.tmp1904 = load %m286$.Node.type*, %m286$.Node.type** %assignable
store %m286$.Node.type* %.tmp1904, %m286$.Node.type** %ptr
br label %.for.start.1903
.for.start.1903:
%.tmp1905 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1906 = icmp ne %m286$.Node.type* %.tmp1905, null
br i1 %.tmp1906, label %.for.continue.1903, label %.for.end.1903
.for.continue.1903:
%.tmp1907 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %token_stack
%.tmp1908 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1909 = call %m1891$.SYStack.type*(%m1891$.SYStack.type*,%m286$.Node.type*) @m1891$stack_push.m1891$.SYStack.typep.m1891$.SYStack.typep.m286$.Node.typep(%m1891$.SYStack.type* %.tmp1907, %m286$.Node.type* %.tmp1908)
store %m1891$.SYStack.type* %.tmp1909, %m1891$.SYStack.type** %token_stack
%.tmp1910 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1911 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1910, i32 0, i32 7
%.tmp1912 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1911
store %m286$.Node.type* %.tmp1912, %m286$.Node.type** %ptr
br label %.for.start.1903
.for.end.1903:
%.tmp1914 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %token_stack
%.tmp1915 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1914, i32 0, i32 0
%.tmp1916 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1915
store %m286$.Node.type* %.tmp1916, %m286$.Node.type** %ptr
br label %.for.start.1913
.for.start.1913:
%.tmp1917 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1918 = icmp ne %m286$.Node.type* %.tmp1917, null
br i1 %.tmp1918, label %.for.continue.1913, label %.for.end.1913
.for.continue.1913:
%.tmp1919 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %token_stack
%cs = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1919, %m1891$.SYStack.type** %cs
%.tmp1920 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %token_stack
%.tmp1921 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1920, i32 0, i32 1
%.tmp1922 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp1921
store %m1891$.SYStack.type* %.tmp1922, %m1891$.SYStack.type** %token_stack
%.tmp1923 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %cs
%.tmp1924 = bitcast %m1891$.SYStack.type* %.tmp1923 to i8*
call void(i8*) @free(i8* %.tmp1924)
%.tmp1925 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1926 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1925, i32 0, i32 0
%.tmp1927 = load i8*, i8** %.tmp1926
%.tmp1929 = getelementptr [16 x i8], [16 x i8]*@.str1928, i32 0, i32 0
%.tmp1930 = call i32(i8*,i8*) @strcmp(i8* %.tmp1927, i8* %.tmp1929)
%.tmp1931 = icmp eq i32 %.tmp1930, 0
br i1 %.tmp1931, label %.if.true.1932, label %.if.false.1932
.if.true.1932:
%.tmp1933 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %out_stack
%.tmp1934 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1935 = call %m1891$.SYStack.type*(%m1891$.SYStack.type*,%m286$.Node.type*) @m1891$stack_push.m1891$.SYStack.typep.m1891$.SYStack.typep.m286$.Node.typep(%m1891$.SYStack.type* %.tmp1933, %m286$.Node.type* %.tmp1934)
store %m1891$.SYStack.type* %.tmp1935, %m1891$.SYStack.type** %out_stack
br label %.if.end.1932
.if.false.1932:
%.tmp1936 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1937 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1936, i32 0, i32 0
%.tmp1938 = load i8*, i8** %.tmp1937
%.tmp1940 = getelementptr [9 x i8], [9 x i8]*@.str1939, i32 0, i32 0
%.tmp1941 = call i32(i8*,i8*) @strcmp(i8* %.tmp1938, i8* %.tmp1940)
%.tmp1942 = icmp eq i32 %.tmp1941, 0
br i1 %.tmp1942, label %.if.true.1943, label %.if.false.1943
.if.true.1943:
%quit = alloca i1
store i1 0, i1* %quit
br label %.for.start.1944
.for.start.1944:
%.tmp1945 = load i1, i1* %quit
%.tmp1946 = icmp eq i1 %.tmp1945, 0
br i1 %.tmp1946, label %.for.continue.1944, label %.for.end.1944
.for.continue.1944:
%.tmp1947 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1948 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1947, i32 0, i32 0
%.tmp1949 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1948
%.tmp1950 = icmp eq %m286$.Node.type* %.tmp1949, null
br i1 %.tmp1950, label %.if.true.1951, label %.if.false.1951
.if.true.1951:
store i1 1, i1* %quit
br label %.if.end.1951
.if.false.1951:
%.tmp1952 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1953 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1952, i32 0, i32 0
%.tmp1954 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1953
%.tmp1955 = call i32(%m286$.Node.type*) @m1891$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1954)
%.tmp1956 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1957 = call i32(%m286$.Node.type*) @m1891$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.tmp1956)
%.tmp1958 = icmp slt i32 %.tmp1955, %.tmp1957
br i1 %.tmp1958, label %.if.true.1959, label %.if.false.1959
.if.true.1959:
%.tmp1960 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%top = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1960, %m1891$.SYStack.type** %top
%.tmp1961 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1962 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1961, i32 0, i32 1
%.tmp1963 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp1962
store %m1891$.SYStack.type* %.tmp1963, %m1891$.SYStack.type** %op_stack
%.tmp1964 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %out_stack
%.tmp1965 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %top
%.tmp1966 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1965, i32 0, i32 0
%.tmp1967 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1966
%.tmp1968 = call %m1891$.SYStack.type*(%m1891$.SYStack.type*,%m286$.Node.type*) @m1891$stack_push.m1891$.SYStack.typep.m1891$.SYStack.typep.m286$.Node.typep(%m1891$.SYStack.type* %.tmp1964, %m286$.Node.type* %.tmp1967)
store %m1891$.SYStack.type* %.tmp1968, %m1891$.SYStack.type** %out_stack
%.tmp1969 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %top
%.tmp1970 = bitcast %m1891$.SYStack.type* %.tmp1969 to i8*
call void(i8*) @free(i8* %.tmp1970)
br label %.if.end.1959
.if.false.1959:
store i1 1, i1* %quit
br label %.if.end.1959
.if.end.1959:
br label %.if.end.1951
.if.end.1951:
br label %.for.start.1944
.for.end.1944:
%.tmp1971 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1972 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1973 = call %m1891$.SYStack.type*(%m1891$.SYStack.type*,%m286$.Node.type*) @m1891$stack_push.m1891$.SYStack.typep.m1891$.SYStack.typep.m286$.Node.typep(%m1891$.SYStack.type* %.tmp1971, %m286$.Node.type* %.tmp1972)
store %m1891$.SYStack.type* %.tmp1973, %m1891$.SYStack.type** %op_stack
br label %.if.end.1943
.if.false.1943:
%.tmp1975 = getelementptr [68 x i8], [68 x i8]*@.str1974, i32 0, i32 0
%.tmp1976 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp1977 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp1976, i32 0, i32 0
%.tmp1978 = load i8*, i8** %.tmp1977
%.tmp1979 = call i32(i8*,...) @printf(i8* %.tmp1975, i8* %.tmp1978)
br label %.if.end.1943
.if.end.1943:
br label %.if.end.1932
.if.end.1932:
%.tmp1980 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %token_stack
%.tmp1981 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1980, i32 0, i32 0
%.tmp1982 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1981
store %m286$.Node.type* %.tmp1982, %m286$.Node.type** %ptr
br label %.for.start.1913
.for.end.1913:
br label %.for.start.1983
.for.start.1983:
%.tmp1984 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1985 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1984, i32 0, i32 0
%.tmp1986 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1985
%.tmp1987 = icmp ne %m286$.Node.type* %.tmp1986, null
br i1 %.tmp1987, label %.for.continue.1983, label %.for.end.1983
.for.continue.1983:
%.tmp1988 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1989 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1988, i32 0, i32 0
%.tmp1990 = load %m286$.Node.type*, %m286$.Node.type** %.tmp1989
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp1990, %m286$.Node.type** %node
%.tmp1991 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%s = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp1991, %m1891$.SYStack.type** %s
%.tmp1992 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %op_stack
%.tmp1993 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp1992, i32 0, i32 1
%.tmp1994 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp1993
store %m1891$.SYStack.type* %.tmp1994, %m1891$.SYStack.type** %op_stack
%.tmp1995 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
%.tmp1996 = bitcast %m1891$.SYStack.type* %.tmp1995 to i8*
call void(i8*) @free(i8* %.tmp1996)
%.tmp1997 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %out_stack
%.tmp1998 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp1999 = call %m1891$.SYStack.type*(%m1891$.SYStack.type*,%m286$.Node.type*) @m1891$stack_push.m1891$.SYStack.typep.m1891$.SYStack.typep.m286$.Node.typep(%m1891$.SYStack.type* %.tmp1997, %m286$.Node.type* %.tmp1998)
store %m1891$.SYStack.type* %.tmp1999, %m1891$.SYStack.type** %out_stack
br label %.for.start.1983
.for.end.1983:
%.tmp2000 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %out_stack
ret %m1891$.SYStack.type* %.tmp2000
}
define %m1891$.SYStack.type* @m1891$stack_push.m1891$.SYStack.typep.m1891$.SYStack.typep.m286$.Node.typep(%m1891$.SYStack.type* %.curr_stack.arg, %m286$.Node.type* %.node.arg) {
%curr_stack = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.curr_stack.arg, %m1891$.SYStack.type** %curr_stack
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2001 = load i32, i32* @SYStack_size
%.tmp2002 = call i8*(i32) @malloc(i32 %.tmp2001)
%.tmp2003 = bitcast i8* %.tmp2002 to %m1891$.SYStack.type*
%s = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp2003, %m1891$.SYStack.type** %s
%.tmp2004 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
%.tmp2005 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp2004, i32 0, i32 0
%.tmp2006 = load %m286$.Node.type*, %m286$.Node.type** %node
store %m286$.Node.type* %.tmp2006, %m286$.Node.type** %.tmp2005
%.tmp2007 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
%.tmp2008 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp2007, i32 0, i32 1
%.tmp2009 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %curr_stack
store %m1891$.SYStack.type* %.tmp2009, %m1891$.SYStack.type** %.tmp2008
%.tmp2010 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %s
ret %m1891$.SYStack.type* %.tmp2010
}
define i32 @m1891$op_precedence.i.m286$.Node.typep(%m286$.Node.type* %.n.arg) {
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.n.arg, %m286$.Node.type** %n
%.tmp2011 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp2012 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2011, i32 0, i32 6
%.tmp2013 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2012
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2013, %m286$.Node.type** %op
%.tmp2014 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2015 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2014, i32 0, i32 1
%.tmp2016 = load i8*, i8** %.tmp2015
%.tmp2018 = getelementptr [2 x i8], [2 x i8]*@.str2017, i32 0, i32 0
%.tmp2019 = call i32(i8*,i8*) @strcmp(i8* %.tmp2016, i8* %.tmp2018)
%.tmp2020 = icmp eq i32 %.tmp2019, 0
%.tmp2021 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2022 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2021, i32 0, i32 1
%.tmp2023 = load i8*, i8** %.tmp2022
%.tmp2025 = getelementptr [2 x i8], [2 x i8]*@.str2024, i32 0, i32 0
%.tmp2026 = call i32(i8*,i8*) @strcmp(i8* %.tmp2023, i8* %.tmp2025)
%.tmp2027 = icmp eq i32 %.tmp2026, 0
%.tmp2028 = or i1 %.tmp2020, %.tmp2027
br i1 %.tmp2028, label %.if.true.2029, label %.if.false.2029
.if.true.2029:
ret i32 4
br label %.if.end.2029
.if.false.2029:
%.tmp2030 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2031 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2030, i32 0, i32 1
%.tmp2032 = load i8*, i8** %.tmp2031
%.tmp2034 = getelementptr [2 x i8], [2 x i8]*@.str2033, i32 0, i32 0
%.tmp2035 = call i32(i8*,i8*) @strcmp(i8* %.tmp2032, i8* %.tmp2034)
%.tmp2036 = icmp eq i32 %.tmp2035, 0
%.tmp2037 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2038 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2037, i32 0, i32 1
%.tmp2039 = load i8*, i8** %.tmp2038
%.tmp2041 = getelementptr [2 x i8], [2 x i8]*@.str2040, i32 0, i32 0
%.tmp2042 = call i32(i8*,i8*) @strcmp(i8* %.tmp2039, i8* %.tmp2041)
%.tmp2043 = icmp eq i32 %.tmp2042, 0
%.tmp2044 = or i1 %.tmp2036, %.tmp2043
br i1 %.tmp2044, label %.if.true.2045, label %.if.false.2045
.if.true.2045:
ret i32 3
br label %.if.end.2045
.if.false.2045:
%.tmp2046 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2047 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2046, i32 0, i32 1
%.tmp2048 = load i8*, i8** %.tmp2047
%.tmp2050 = getelementptr [3 x i8], [3 x i8]*@.str2049, i32 0, i32 0
%.tmp2051 = call i32(i8*,i8*) @strcmp(i8* %.tmp2048, i8* %.tmp2050)
%.tmp2052 = icmp eq i32 %.tmp2051, 0
%.tmp2053 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2054 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2053, i32 0, i32 1
%.tmp2055 = load i8*, i8** %.tmp2054
%.tmp2057 = getelementptr [3 x i8], [3 x i8]*@.str2056, i32 0, i32 0
%.tmp2058 = call i32(i8*,i8*) @strcmp(i8* %.tmp2055, i8* %.tmp2057)
%.tmp2059 = icmp eq i32 %.tmp2058, 0
%.tmp2060 = or i1 %.tmp2052, %.tmp2059
br i1 %.tmp2060, label %.if.true.2061, label %.if.false.2061
.if.true.2061:
ret i32 7
br label %.if.end.2061
.if.false.2061:
%.tmp2062 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2063 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2062, i32 0, i32 1
%.tmp2064 = load i8*, i8** %.tmp2063
%.tmp2066 = getelementptr [3 x i8], [3 x i8]*@.str2065, i32 0, i32 0
%.tmp2067 = call i32(i8*,i8*) @strcmp(i8* %.tmp2064, i8* %.tmp2066)
%.tmp2068 = icmp eq i32 %.tmp2067, 0
%.tmp2069 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2070 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2069, i32 0, i32 1
%.tmp2071 = load i8*, i8** %.tmp2070
%.tmp2073 = getelementptr [3 x i8], [3 x i8]*@.str2072, i32 0, i32 0
%.tmp2074 = call i32(i8*,i8*) @strcmp(i8* %.tmp2071, i8* %.tmp2073)
%.tmp2075 = icmp eq i32 %.tmp2074, 0
%.tmp2076 = or i1 %.tmp2068, %.tmp2075
br i1 %.tmp2076, label %.if.true.2077, label %.if.false.2077
.if.true.2077:
ret i32 6
br label %.if.end.2077
.if.false.2077:
%.tmp2078 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2079 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2078, i32 0, i32 1
%.tmp2080 = load i8*, i8** %.tmp2079
%.tmp2082 = getelementptr [2 x i8], [2 x i8]*@.str2081, i32 0, i32 0
%.tmp2083 = call i32(i8*,i8*) @strcmp(i8* %.tmp2080, i8* %.tmp2082)
%.tmp2084 = icmp eq i32 %.tmp2083, 0
%.tmp2085 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2086 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2085, i32 0, i32 1
%.tmp2087 = load i8*, i8** %.tmp2086
%.tmp2089 = getelementptr [2 x i8], [2 x i8]*@.str2088, i32 0, i32 0
%.tmp2090 = call i32(i8*,i8*) @strcmp(i8* %.tmp2087, i8* %.tmp2089)
%.tmp2091 = icmp eq i32 %.tmp2090, 0
%.tmp2092 = or i1 %.tmp2084, %.tmp2091
br i1 %.tmp2092, label %.if.true.2093, label %.if.false.2093
.if.true.2093:
ret i32 6
br label %.if.end.2093
.if.false.2093:
%.tmp2094 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2095 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2094, i32 0, i32 1
%.tmp2096 = load i8*, i8** %.tmp2095
%.tmp2098 = getelementptr [2 x i8], [2 x i8]*@.str2097, i32 0, i32 0
%.tmp2099 = call i32(i8*,i8*) @strcmp(i8* %.tmp2096, i8* %.tmp2098)
%.tmp2100 = icmp eq i32 %.tmp2099, 0
br i1 %.tmp2100, label %.if.true.2101, label %.if.false.2101
.if.true.2101:
ret i32 11
br label %.if.end.2101
.if.false.2101:
%.tmp2102 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2103 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2102, i32 0, i32 1
%.tmp2104 = load i8*, i8** %.tmp2103
%.tmp2106 = getelementptr [2 x i8], [2 x i8]*@.str2105, i32 0, i32 0
%.tmp2107 = call i32(i8*,i8*) @strcmp(i8* %.tmp2104, i8* %.tmp2106)
%.tmp2108 = icmp eq i32 %.tmp2107, 0
br i1 %.tmp2108, label %.if.true.2109, label %.if.false.2109
.if.true.2109:
ret i32 12
br label %.if.end.2109
.if.false.2109:
br label %.if.end.2109
.if.end.2109:
br label %.if.end.2101
.if.end.2101:
br label %.if.end.2093
.if.end.2093:
br label %.if.end.2077
.if.end.2077:
br label %.if.end.2061
.if.end.2061:
br label %.if.end.2045
.if.end.2045:
br label %.if.end.2029
.if.end.2029:
%.tmp2111 = getelementptr [65 x i8], [65 x i8]*@.str2110, i32 0, i32 0
%.tmp2112 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp2113 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2112, i32 0, i32 1
%.tmp2114 = load i8*, i8** %.tmp2113
%.tmp2115 = call i32(i8*,...) @printf(i8* %.tmp2111, i8* %.tmp2114)
ret i32 4
}
@.str1928 = constant [16 x i8] c"mono_assignable\00"
@.str1939 = constant [9 x i8] c"operator\00"
@.str1974 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2017 = constant [2 x i8] c"+\00"
@.str2024 = constant [2 x i8] c"-\00"
@.str2033 = constant [2 x i8] c"*\00"
@.str2040 = constant [2 x i8] c"/\00"
@.str2049 = constant [3 x i8] c"==\00"
@.str2056 = constant [3 x i8] c"!=\00"
@.str2065 = constant [3 x i8] c">=\00"
@.str2072 = constant [3 x i8] c"<=\00"
@.str2081 = constant [2 x i8] c">\00"
@.str2088 = constant [2 x i8] c"<\00"
@.str2097 = constant [2 x i8] c"&\00"
@.str2105 = constant [2 x i8] c"|\00"
@.str2110 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
define i8* @m2116$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2117 = load i8*, i8** %text
%.tmp2118 = call i32(i8*) @strlen(i8* %.tmp2117)
%str_len = alloca i32
store i32 %.tmp2118, i32* %str_len
%dest_string = alloca {i32,i32,i8*}
%.tmp2119 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2120 = load i32, i32* %str_len
store i32 %.tmp2120, i32* %.tmp2119
%.tmp2121 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2121
%.tmp2122 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2123 = load i32, i32* %str_len
%.tmp2124 = call i8*(i32) @malloc(i32 %.tmp2123)
store i8* %.tmp2124, i8** %.tmp2122
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.2125
.for.start.2125:
%.tmp2126 = load i32, i32* %i
%.tmp2127 = load i32, i32* %str_len
%.tmp2128 = sub i32 %.tmp2127, 1
%.tmp2129 = icmp slt i32 %.tmp2126, %.tmp2128
br i1 %.tmp2129, label %.for.continue.2125, label %.for.end.2125
.for.continue.2125:
%.tmp2130 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2131 = load i32, i32* %.tmp2130
%.tmp2132 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2133 = load i32, i32* %.tmp2132
%.tmp2134 = sub i32 %.tmp2133, 1
%.tmp2135 = icmp eq i32 %.tmp2131, %.tmp2134
br i1 %.tmp2135, label %.if.true.2136, label %.if.false.2136
.if.true.2136:
%.tmp2137 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2138 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2139 = load i8*, i8** %.tmp2138
%.tmp2140 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2141 = load i32, i32* %.tmp2140
%.tmp2142 = mul i32 %.tmp2141, 2
%.tmp2143 = call i8*(i8*,i32) @realloc(i8* %.tmp2139, i32 %.tmp2142)
store i8* %.tmp2143, i8** %.tmp2137
br label %.if.end.2136
.if.false.2136:
br label %.if.end.2136
.if.end.2136:
%.tmp2144 = load i32, i32* %i
%.tmp2145 = load i8*, i8** %text
%.tmp2146 = getelementptr i8, i8* %.tmp2145, i32 %.tmp2144
%.tmp2147 = load i8, i8* %.tmp2146
%.tmp2148 = icmp eq i8 %.tmp2147, 34
br i1 %.tmp2148, label %.if.true.2149, label %.if.false.2149
.if.true.2149:
%.tmp2150 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2151 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2152 = load i32, i32* %.tmp2151
%.tmp2153 = load i8*, i8** %.tmp2150
%.tmp2154 = getelementptr i8, i8* %.tmp2153, i32 %.tmp2152
store i8 92, i8* %.tmp2154
%.tmp2155 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2156 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2157 = load i32, i32* %.tmp2156
%.tmp2158 = add i32 %.tmp2157, 1
store i32 %.tmp2158, i32* %.tmp2155
%.tmp2159 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2160 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2161 = load i32, i32* %.tmp2160
%.tmp2162 = load i8*, i8** %.tmp2159
%.tmp2163 = getelementptr i8, i8* %.tmp2162, i32 %.tmp2161
store i8 50, i8* %.tmp2163
%.tmp2164 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2165 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2166 = load i32, i32* %.tmp2165
%.tmp2167 = add i32 %.tmp2166, 1
store i32 %.tmp2167, i32* %.tmp2164
%.tmp2168 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2169 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2170 = load i32, i32* %.tmp2169
%.tmp2171 = load i8*, i8** %.tmp2168
%.tmp2172 = getelementptr i8, i8* %.tmp2171, i32 %.tmp2170
store i8 50, i8* %.tmp2172
br label %.if.end.2149
.if.false.2149:
%.tmp2173 = load i32, i32* %i
%.tmp2174 = load i8*, i8** %text
%.tmp2175 = getelementptr i8, i8* %.tmp2174, i32 %.tmp2173
%.tmp2176 = load i8, i8* %.tmp2175
%.tmp2177 = icmp eq i8 %.tmp2176, 92
br i1 %.tmp2177, label %.if.true.2178, label %.if.false.2178
.if.true.2178:
%.tmp2179 = load i32, i32* %i
%.tmp2180 = add i32 %.tmp2179, 1
%.tmp2181 = load i8*, i8** %text
%.tmp2182 = getelementptr i8, i8* %.tmp2181, i32 %.tmp2180
%.tmp2183 = load i8, i8* %.tmp2182
%.tmp2184 = icmp eq i8 %.tmp2183, 110
%.tmp2185 = load i32, i32* %i
%.tmp2186 = add i32 %.tmp2185, 1
%.tmp2187 = load i8*, i8** %text
%.tmp2188 = getelementptr i8, i8* %.tmp2187, i32 %.tmp2186
%.tmp2189 = load i8, i8* %.tmp2188
%.tmp2190 = icmp eq i8 %.tmp2189, 78
%.tmp2191 = or i1 %.tmp2184, %.tmp2190
br i1 %.tmp2191, label %.if.true.2192, label %.if.false.2192
.if.true.2192:
%.tmp2193 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2194 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2195 = load i32, i32* %.tmp2194
%.tmp2196 = load i8*, i8** %.tmp2193
%.tmp2197 = getelementptr i8, i8* %.tmp2196, i32 %.tmp2195
store i8 92, i8* %.tmp2197
%.tmp2198 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2199 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2200 = load i32, i32* %.tmp2199
%.tmp2201 = add i32 %.tmp2200, 1
store i32 %.tmp2201, i32* %.tmp2198
%.tmp2202 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2203 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2204 = load i32, i32* %.tmp2203
%.tmp2205 = load i8*, i8** %.tmp2202
%.tmp2206 = getelementptr i8, i8* %.tmp2205, i32 %.tmp2204
store i8 48, i8* %.tmp2206
%.tmp2207 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2208 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2209 = load i32, i32* %.tmp2208
%.tmp2210 = add i32 %.tmp2209, 1
store i32 %.tmp2210, i32* %.tmp2207
%.tmp2211 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2212 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2213 = load i32, i32* %.tmp2212
%.tmp2214 = load i8*, i8** %.tmp2211
%.tmp2215 = getelementptr i8, i8* %.tmp2214, i32 %.tmp2213
store i8 65, i8* %.tmp2215
%.tmp2216 = load i32, i32* %i
%.tmp2217 = add i32 %.tmp2216, 1
store i32 %.tmp2217, i32* %i
br label %.if.end.2192
.if.false.2192:
%.tmp2218 = load i32, i32* %i
%.tmp2219 = add i32 %.tmp2218, 1
%.tmp2220 = load i8*, i8** %text
%.tmp2221 = getelementptr i8, i8* %.tmp2220, i32 %.tmp2219
%.tmp2222 = load i8, i8* %.tmp2221
%.tmp2223 = icmp eq i8 %.tmp2222, 92
br i1 %.tmp2223, label %.if.true.2224, label %.if.false.2224
.if.true.2224:
%.tmp2225 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2226 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2227 = load i32, i32* %.tmp2226
%.tmp2228 = load i8*, i8** %.tmp2225
%.tmp2229 = getelementptr i8, i8* %.tmp2228, i32 %.tmp2227
store i8 92, i8* %.tmp2229
%.tmp2230 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2231 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2232 = load i32, i32* %.tmp2231
%.tmp2233 = add i32 %.tmp2232, 1
store i32 %.tmp2233, i32* %.tmp2230
%.tmp2234 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2235 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2236 = load i32, i32* %.tmp2235
%.tmp2237 = load i8*, i8** %.tmp2234
%.tmp2238 = getelementptr i8, i8* %.tmp2237, i32 %.tmp2236
store i8 53, i8* %.tmp2238
%.tmp2239 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2240 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2241 = load i32, i32* %.tmp2240
%.tmp2242 = add i32 %.tmp2241, 1
store i32 %.tmp2242, i32* %.tmp2239
%.tmp2243 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2244 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2245 = load i32, i32* %.tmp2244
%.tmp2246 = load i8*, i8** %.tmp2243
%.tmp2247 = getelementptr i8, i8* %.tmp2246, i32 %.tmp2245
store i8 67, i8* %.tmp2247
%.tmp2248 = load i32, i32* %i
%.tmp2249 = add i32 %.tmp2248, 1
store i32 %.tmp2249, i32* %i
br label %.if.end.2224
.if.false.2224:
%.tmp2250 = load i32, i32* %i
%.tmp2251 = add i32 %.tmp2250, 1
%.tmp2252 = load i8*, i8** %text
%.tmp2253 = getelementptr i8, i8* %.tmp2252, i32 %.tmp2251
%.tmp2254 = load i8, i8* %.tmp2253
%.tmp2255 = icmp eq i8 %.tmp2254, 120
br i1 %.tmp2255, label %.if.true.2256, label %.if.false.2256
.if.true.2256:
%.tmp2257 = load i32, i32* %i
%.tmp2258 = add i32 %.tmp2257, 2
store i32 %.tmp2258, i32* %i
%.tmp2259 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2260 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2261 = load i32, i32* %.tmp2260
%.tmp2262 = load i8*, i8** %.tmp2259
%.tmp2263 = getelementptr i8, i8* %.tmp2262, i32 %.tmp2261
store i8 92, i8* %.tmp2263
%.tmp2264 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2265 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2266 = load i32, i32* %.tmp2265
%.tmp2267 = add i32 %.tmp2266, 1
store i32 %.tmp2267, i32* %.tmp2264
%.tmp2268 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2269 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2270 = load i32, i32* %.tmp2269
%.tmp2271 = load i8*, i8** %.tmp2268
%.tmp2272 = getelementptr i8, i8* %.tmp2271, i32 %.tmp2270
%.tmp2273 = load i32, i32* %i
%.tmp2274 = load i8*, i8** %text
%.tmp2275 = getelementptr i8, i8* %.tmp2274, i32 %.tmp2273
%.tmp2276 = load i8, i8* %.tmp2275
%.tmp2277 = call i8(i8) @toupper(i8 %.tmp2276)
store i8 %.tmp2277, i8* %.tmp2272
%.tmp2278 = load i32, i32* %i
%.tmp2279 = add i32 %.tmp2278, 1
store i32 %.tmp2279, i32* %i
%.tmp2280 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2281 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2282 = load i32, i32* %.tmp2281
%.tmp2283 = add i32 %.tmp2282, 1
store i32 %.tmp2283, i32* %.tmp2280
%.tmp2284 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2285 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2286 = load i32, i32* %.tmp2285
%.tmp2287 = load i8*, i8** %.tmp2284
%.tmp2288 = getelementptr i8, i8* %.tmp2287, i32 %.tmp2286
%.tmp2289 = load i32, i32* %i
%.tmp2290 = load i8*, i8** %text
%.tmp2291 = getelementptr i8, i8* %.tmp2290, i32 %.tmp2289
%.tmp2292 = load i8, i8* %.tmp2291
%.tmp2293 = call i8(i8) @toupper(i8 %.tmp2292)
store i8 %.tmp2293, i8* %.tmp2288
br label %.if.end.2256
.if.false.2256:
%.tmp2294 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2295 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2296 = load i32, i32* %.tmp2295
%.tmp2297 = load i8*, i8** %.tmp2294
%.tmp2298 = getelementptr i8, i8* %.tmp2297, i32 %.tmp2296
%.tmp2299 = load i32, i32* %i
%.tmp2300 = load i8*, i8** %text
%.tmp2301 = getelementptr i8, i8* %.tmp2300, i32 %.tmp2299
%.tmp2302 = load i8, i8* %.tmp2301
store i8 %.tmp2302, i8* %.tmp2298
br label %.if.end.2256
.if.end.2256:
br label %.if.end.2224
.if.end.2224:
br label %.if.end.2192
.if.end.2192:
br label %.if.end.2178
.if.false.2178:
%.tmp2303 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2304 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2305 = load i32, i32* %.tmp2304
%.tmp2306 = load i8*, i8** %.tmp2303
%.tmp2307 = getelementptr i8, i8* %.tmp2306, i32 %.tmp2305
%.tmp2308 = load i32, i32* %i
%.tmp2309 = load i8*, i8** %text
%.tmp2310 = getelementptr i8, i8* %.tmp2309, i32 %.tmp2308
%.tmp2311 = load i8, i8* %.tmp2310
store i8 %.tmp2311, i8* %.tmp2307
br label %.if.end.2178
.if.end.2178:
br label %.if.end.2149
.if.end.2149:
%.tmp2312 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2313 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2314 = load i32, i32* %.tmp2313
%.tmp2315 = add i32 %.tmp2314, 1
store i32 %.tmp2315, i32* %.tmp2312
%.tmp2316 = load i32, i32* %i
%.tmp2317 = add i32 %.tmp2316, 1
store i32 %.tmp2317, i32* %i
br label %.for.start.2125
.for.end.2125:
%.tmp2318 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2319 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2320 = load i32, i32* %.tmp2319
%.tmp2321 = load i8*, i8** %.tmp2318
%.tmp2322 = getelementptr i8, i8* %.tmp2321, i32 %.tmp2320
store i8 0, i8* %.tmp2322
%buf = alloca i8*
%.tmp2323 = getelementptr i8*, i8** %buf, i32 0
%.tmp2325 = getelementptr [9 x i8], [9 x i8]*@.str2324, i32 0, i32 0
%.tmp2326 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2327 = load i8*, i8** %.tmp2326
%.tmp2328 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2323, i8* %.tmp2325, i8* %.tmp2327)
%.tmp2329 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2330 = load i8*, i8** %.tmp2329
call void(i8*) @free(i8* %.tmp2330)
%.tmp2331 = load i8*, i8** %buf
ret i8* %.tmp2331
}
define i32 @m2116$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 2, i32* %i
br label %.for.start.2332
.for.start.2332:
%.tmp2333 = load i32, i32* %i
%.tmp2334 = load i8*, i8** %text
%.tmp2335 = getelementptr i8, i8* %.tmp2334, i32 %.tmp2333
%.tmp2336 = load i8, i8* %.tmp2335
%.tmp2337 = icmp ne i8 %.tmp2336, 0
br i1 %.tmp2337, label %.for.continue.2332, label %.for.end.2332
.for.continue.2332:
%.tmp2338 = load i32, i32* %i
%.tmp2339 = load i8*, i8** %text
%.tmp2340 = getelementptr i8, i8* %.tmp2339, i32 %.tmp2338
%.tmp2341 = load i8, i8* %.tmp2340
%.tmp2342 = icmp eq i8 %.tmp2341, 92
br i1 %.tmp2342, label %.if.true.2343, label %.if.false.2343
.if.true.2343:
%.tmp2344 = load i32, i32* %i
%.tmp2345 = add i32 %.tmp2344, 2
store i32 %.tmp2345, i32* %i
br label %.if.end.2343
.if.false.2343:
br label %.if.end.2343
.if.end.2343:
%.tmp2346 = load i32, i32* %len
%.tmp2347 = add i32 %.tmp2346, 1
store i32 %.tmp2347, i32* %len
%.tmp2348 = load i32, i32* %i
%.tmp2349 = add i32 %.tmp2348, 1
store i32 %.tmp2349, i32* %i
br label %.for.start.2332
.for.end.2332:
%.tmp2350 = load i32, i32* %len
%.tmp2351 = sub i32 %.tmp2350, 1
ret i32 %.tmp2351
}
define i8* @m2116$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval = alloca i32
%buf = alloca i8*
%chrval = alloca i8
%.tmp2352 = load i8*, i8** %chr_repr
%.tmp2353 = call i32(i8*) @strlen(i8* %.tmp2352)
%chr_len = alloca i32
store i32 %.tmp2353, i32* %chr_len
%.tmp2354 = load i32, i32* %chr_len
%.tmp2355 = icmp eq i32 %.tmp2354, 6
br i1 %.tmp2355, label %.if.true.2356, label %.if.false.2356
.if.true.2356:
%.tmp2357 = load i8*, i8** %chr_repr
%.tmp2359 = getelementptr [7 x i8], [7 x i8]*@.str2358, i32 0, i32 0
%.tmp2360 = getelementptr i32, i32* %intval, i32 0
%.tmp2361 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2357, i8* %.tmp2359, i32* %.tmp2360)
%.tmp2362 = getelementptr i8*, i8** %buf, i32 0
%.tmp2364 = getelementptr [3 x i8], [3 x i8]*@.str2363, i32 0, i32 0
%.tmp2365 = load i32, i32* %intval
%.tmp2366 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2362, i8* %.tmp2364, i32 %.tmp2365)
br label %.if.end.2356
.if.false.2356:
%.tmp2367 = load i32, i32* %chr_len
%.tmp2368 = icmp eq i32 %.tmp2367, 5
br i1 %.tmp2368, label %.if.true.2369, label %.if.false.2369
.if.true.2369:
%.tmp2370 = load i8*, i8** %chr_repr
%.tmp2372 = getelementptr [6 x i8], [6 x i8]*@.str2371, i32 0, i32 0
%.tmp2373 = getelementptr i32, i32* %intval, i32 0
%.tmp2374 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2370, i8* %.tmp2372, i32* %.tmp2373)
%.tmp2375 = getelementptr i8*, i8** %buf, i32 0
%.tmp2377 = getelementptr [3 x i8], [3 x i8]*@.str2376, i32 0, i32 0
%.tmp2378 = load i32, i32* %intval
%.tmp2379 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2375, i8* %.tmp2377, i32 %.tmp2378)
br label %.if.end.2369
.if.false.2369:
%.tmp2380 = load i32, i32* %chr_len
%.tmp2381 = icmp eq i32 %.tmp2380, 4
br i1 %.tmp2381, label %.if.true.2382, label %.if.false.2382
.if.true.2382:
%.tmp2383 = load i8*, i8** %chr_repr
%.tmp2385 = getelementptr [6 x i8], [6 x i8]*@.str2384, i32 0, i32 0
%.tmp2386 = getelementptr i8, i8* %chrval, i32 0
%.tmp2387 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2383, i8* %.tmp2385, i8* %.tmp2386)
%.tmp2388 = load i8, i8* %chrval
%.tmp2389 = icmp eq i8 %.tmp2388, 110
br i1 %.tmp2389, label %.if.true.2390, label %.if.false.2390
.if.true.2390:
%.tmp2392 = getelementptr [3 x i8], [3 x i8]*@.str2391, i32 0, i32 0
store i8* %.tmp2392, i8** %buf
br label %.if.end.2390
.if.false.2390:
%.tmp2393 = bitcast ptr null to i8*
ret i8* %.tmp2393
br label %.if.end.2390
.if.end.2390:
br label %.if.end.2382
.if.false.2382:
%.tmp2394 = load i32, i32* %chr_len
%.tmp2395 = icmp eq i32 %.tmp2394, 3
br i1 %.tmp2395, label %.if.true.2396, label %.if.false.2396
.if.true.2396:
%.tmp2397 = load i8*, i8** %chr_repr
%.tmp2399 = getelementptr [5 x i8], [5 x i8]*@.str2398, i32 0, i32 0
%.tmp2400 = getelementptr i32, i32* %intval, i32 0
%.tmp2401 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2397, i8* %.tmp2399, i32* %.tmp2400)
%.tmp2402 = getelementptr i8*, i8** %buf, i32 0
%.tmp2404 = getelementptr [3 x i8], [3 x i8]*@.str2403, i32 0, i32 0
%.tmp2405 = load i32, i32* %intval
%.tmp2406 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2402, i8* %.tmp2404, i32 %.tmp2405)
br label %.if.end.2396
.if.false.2396:
%.tmp2407 = bitcast ptr null to i8*
ret i8* %.tmp2407
br label %.if.end.2396
.if.end.2396:
br label %.if.end.2382
.if.end.2382:
br label %.if.end.2369
.if.end.2369:
br label %.if.end.2356
.if.end.2356:
%.tmp2408 = load i8*, i8** %buf
ret i8* %.tmp2408
}
@.str2324 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2358 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2363 = constant [3 x i8] c"%d\00"
@.str2371 = constant [6 x i8] c"'\5C%x'\00"
@.str2376 = constant [3 x i8] c"%d\00"
@.str2384 = constant [6 x i8] c"'\5C%c'\00"
@.str2391 = constant [3 x i8] c"10\00"
@.str2398 = constant [5 x i8] c"'%c'\00"
@.str2403 = constant [3 x i8] c"%d\00"
@DEBUG_INTERNALS = constant i1 0
%m1770$.ErrorList.type = type {%m717$.Error.type*,%m1770$.ErrorList.type*}
%m1770$.Type.type = type {i8*,i8*,i8*,%m1770$.Type.type*,%m1770$.Type.type*}
define %m1770$.Type.type* @m1770$type_clone.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.t.arg) {
%t = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.t.arg, %m1770$.Type.type** %t
%.tmp2409 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2410 = icmp eq %m1770$.Type.type* %.tmp2409, null
br i1 %.tmp2410, label %.if.true.2411, label %.if.false.2411
.if.true.2411:
%.tmp2412 = bitcast ptr null to %m1770$.Type.type*
ret %m1770$.Type.type* %.tmp2412
br label %.if.end.2411
.if.false.2411:
br label %.if.end.2411
.if.end.2411:
%.tmp2413 = getelementptr %m1770$.Type.type, %m1770$.Type.type* null, i32 1
%.tmp2414 = ptrtoint %m1770$.Type.type* %.tmp2413 to i32
%.tmp2415 = call i8*(i32) @malloc(i32 %.tmp2414)
%.tmp2416 = bitcast i8* %.tmp2415 to %m1770$.Type.type*
%clone = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp2416, %m1770$.Type.type** %clone
%.tmp2417 = load %m1770$.Type.type*, %m1770$.Type.type** %clone
%.tmp2418 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2417, i32 0, i32 3
%.tmp2419 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2420 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2419, i32 0, i32 3
%.tmp2421 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2420
store %m1770$.Type.type* %.tmp2421, %m1770$.Type.type** %.tmp2418
%.tmp2422 = load %m1770$.Type.type*, %m1770$.Type.type** %clone
%.tmp2423 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2422, i32 0, i32 4
%.tmp2424 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2425 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2424, i32 0, i32 4
%.tmp2426 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2425
%.tmp2427 = call %m1770$.Type.type*(%m1770$.Type.type*) @m1770$type_clone.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp2426)
store %m1770$.Type.type* %.tmp2427, %m1770$.Type.type** %.tmp2423
%.tmp2428 = load %m1770$.Type.type*, %m1770$.Type.type** %clone
%.tmp2429 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2428, i32 0, i32 2
%.tmp2430 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2431 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2430, i32 0, i32 2
%.tmp2432 = load i8*, i8** %.tmp2431
store i8* %.tmp2432, i8** %.tmp2429
%.tmp2433 = load %m1770$.Type.type*, %m1770$.Type.type** %clone
%.tmp2434 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2433, i32 0, i32 0
%.tmp2435 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2436 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2435, i32 0, i32 0
%.tmp2437 = load i8*, i8** %.tmp2436
store i8* %.tmp2437, i8** %.tmp2434
%.tmp2438 = load %m1770$.Type.type*, %m1770$.Type.type** %clone
%.tmp2439 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2438, i32 0, i32 1
%.tmp2440 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2441 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2440, i32 0, i32 1
%.tmp2442 = load i8*, i8** %.tmp2441
store i8* %.tmp2442, i8** %.tmp2439
%.tmp2443 = load %m1770$.Type.type*, %m1770$.Type.type** %clone
ret %m1770$.Type.type* %.tmp2443
}
define %m1770$.Type.type* @m1770$new_type.m1770$.Type.typep() {
%.tmp2444 = getelementptr %m1770$.Type.type, %m1770$.Type.type* null, i32 1
%.tmp2445 = ptrtoint %m1770$.Type.type* %.tmp2444 to i32
%.tmp2446 = call i8*(i32) @malloc(i32 %.tmp2445)
%.tmp2447 = bitcast i8* %.tmp2446 to %m1770$.Type.type*
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp2447, %m1770$.Type.type** %type
%.tmp2448 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2449 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2448, i32 0, i32 1
store i8* null, i8** %.tmp2449
%.tmp2450 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2451 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2450, i32 0, i32 2
store i8* null, i8** %.tmp2451
%.tmp2452 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2453 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2452, i32 0, i32 0
store i8* null, i8** %.tmp2453
%.tmp2454 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2455 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2454, i32 0, i32 3
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp2455
%.tmp2456 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2457 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2456, i32 0, i32 4
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp2457
%.tmp2458 = load %m1770$.Type.type*, %m1770$.Type.type** %type
ret %m1770$.Type.type* %.tmp2458
}
define void @m1770$copy_type.v.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.dest.arg, %m1770$.Type.type* %.src.arg) {
%dest = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.dest.arg, %m1770$.Type.type** %dest
%src = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.src.arg, %m1770$.Type.type** %src
%.tmp2459 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2460 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2459, i32 0, i32 0
%.tmp2461 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2462 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2461, i32 0, i32 0
%.tmp2463 = load i8*, i8** %.tmp2462
store i8* %.tmp2463, i8** %.tmp2460
%.tmp2464 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2465 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2464, i32 0, i32 1
%.tmp2466 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2467 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2466, i32 0, i32 1
%.tmp2468 = load i8*, i8** %.tmp2467
store i8* %.tmp2468, i8** %.tmp2465
%.tmp2469 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2470 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2469, i32 0, i32 2
%.tmp2471 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2472 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2471, i32 0, i32 2
%.tmp2473 = load i8*, i8** %.tmp2472
store i8* %.tmp2473, i8** %.tmp2470
%.tmp2474 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2475 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2474, i32 0, i32 3
%.tmp2476 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2475
%.tmp2477 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2478 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2477, i32 0, i32 3
%.tmp2479 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2478
%.tmp2480 = icmp ne %m1770$.Type.type* %.tmp2476, %.tmp2479
br i1 %.tmp2480, label %.if.true.2481, label %.if.false.2481
.if.true.2481:
%.tmp2482 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2483 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2482, i32 0, i32 3
%.tmp2484 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2485 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2484, i32 0, i32 3
%.tmp2486 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2485
store %m1770$.Type.type* %.tmp2486, %m1770$.Type.type** %.tmp2483
%.tmp2487 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2488 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2487, i32 0, i32 3
%.tmp2489 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2488
%.tmp2490 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2491 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2490, i32 0, i32 3
%.tmp2492 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2491
call void(%m1770$.Type.type*,%m1770$.Type.type*) @m1770$copy_type.v.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp2489, %m1770$.Type.type* %.tmp2492)
br label %.if.end.2481
.if.false.2481:
br label %.if.end.2481
.if.end.2481:
%.tmp2493 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2494 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2493, i32 0, i32 4
%.tmp2495 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2494
%.tmp2496 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2497 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2496, i32 0, i32 4
%.tmp2498 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2497
%.tmp2499 = icmp ne %m1770$.Type.type* %.tmp2495, %.tmp2498
br i1 %.tmp2499, label %.if.true.2500, label %.if.false.2500
.if.true.2500:
%.tmp2501 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2502 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2501, i32 0, i32 4
%.tmp2503 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2504 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2503, i32 0, i32 4
%.tmp2505 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2504
store %m1770$.Type.type* %.tmp2505, %m1770$.Type.type** %.tmp2502
%.tmp2506 = load %m1770$.Type.type*, %m1770$.Type.type** %dest
%.tmp2507 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2506, i32 0, i32 4
%.tmp2508 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2507
%.tmp2509 = load %m1770$.Type.type*, %m1770$.Type.type** %src
%.tmp2510 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2509, i32 0, i32 4
%.tmp2511 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2510
call void(%m1770$.Type.type*,%m1770$.Type.type*) @m1770$copy_type.v.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp2508, %m1770$.Type.type* %.tmp2511)
br label %.if.end.2500
.if.false.2500:
br label %.if.end.2500
.if.end.2500:
ret void
}
define void @m1770$debug_type.v.m1770$.Type.typep.i(%m1770$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.t.arg, %m1770$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2512 = load i32, i32* %level
%.tmp2513 = add i32 %.tmp2512, 1
%.tmp2514 = call i8*(i32) @malloc(i32 %.tmp2513)
%.tmp2515 = bitcast i8* %.tmp2514 to i8*
%indent = alloca i8*
store i8* %.tmp2515, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2516
.for.start.2516:
%.tmp2517 = load i32, i32* %i
%.tmp2518 = load i32, i32* %level
%.tmp2519 = icmp slt i32 %.tmp2517, %.tmp2518
br i1 %.tmp2519, label %.for.continue.2516, label %.for.end.2516
.for.continue.2516:
%.tmp2520 = load i32, i32* %i
%.tmp2521 = load i8*, i8** %indent
%.tmp2522 = getelementptr i8, i8* %.tmp2521, i32 %.tmp2520
store i8 32, i8* %.tmp2522
%.tmp2523 = load i32, i32* %i
%.tmp2524 = add i32 %.tmp2523, 1
store i32 %.tmp2524, i32* %i
br label %.for.start.2516
.for.end.2516:
%.tmp2525 = load i32, i32* %level
%.tmp2526 = load i8*, i8** %indent
%.tmp2527 = getelementptr i8, i8* %.tmp2526, i32 %.tmp2525
store i8 0, i8* %.tmp2527
%.tmp2529 = getelementptr [5 x i8], [5 x i8]*@.str2528, i32 0, i32 0
%.tmp2530 = load i8*, i8** %indent
%.tmp2531 = call i32(i8*,...) @printf(i8* %.tmp2529, i8* %.tmp2530)
%.tmp2533 = getelementptr [21 x i8], [21 x i8]*@.str2532, i32 0, i32 0
%.tmp2534 = load i8*, i8** %indent
%.tmp2535 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2536 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2535, i32 0, i32 0
%.tmp2537 = load i8*, i8** %.tmp2536
%.tmp2538 = call i32(i8*,...) @printf(i8* %.tmp2533, i8* %.tmp2534, i8* %.tmp2537)
%.tmp2540 = getelementptr [16 x i8], [16 x i8]*@.str2539, i32 0, i32 0
%.tmp2541 = load i8*, i8** %indent
%.tmp2542 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2543 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2542, i32 0, i32 1
%.tmp2544 = load i8*, i8** %.tmp2543
%.tmp2545 = call i32(i8*,...) @printf(i8* %.tmp2540, i8* %.tmp2541, i8* %.tmp2544)
%.tmp2547 = getelementptr [16 x i8], [16 x i8]*@.str2546, i32 0, i32 0
%.tmp2548 = load i8*, i8** %indent
%.tmp2549 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2550 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2549, i32 0, i32 2
%.tmp2551 = load i8*, i8** %.tmp2550
%.tmp2552 = call i32(i8*,...) @printf(i8* %.tmp2547, i8* %.tmp2548, i8* %.tmp2551)
%.tmp2553 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2554 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2553, i32 0, i32 3
%.tmp2555 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2554
%.tmp2556 = icmp eq %m1770$.Type.type* %.tmp2555, null
br i1 %.tmp2556, label %.if.true.2557, label %.if.false.2557
.if.true.2557:
%.tmp2559 = getelementptr [16 x i8], [16 x i8]*@.str2558, i32 0, i32 0
%.tmp2560 = load i8*, i8** %indent
%.tmp2561 = call i32(i8*,...) @printf(i8* %.tmp2559, i8* %.tmp2560)
br label %.if.end.2557
.if.false.2557:
%.tmp2563 = getelementptr [10 x i8], [10 x i8]*@.str2562, i32 0, i32 0
%.tmp2564 = load i8*, i8** %indent
%.tmp2565 = call i32(i8*,...) @printf(i8* %.tmp2563, i8* %.tmp2564)
%.tmp2566 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2567 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2566, i32 0, i32 3
%.tmp2568 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2567
%.tmp2569 = load i32, i32* %level
%.tmp2570 = add i32 %.tmp2569, 1
call void(%m1770$.Type.type*,i32) @m1770$debug_type.v.m1770$.Type.typep.i(%m1770$.Type.type* %.tmp2568, i32 %.tmp2570)
br label %.if.end.2557
.if.end.2557:
%.tmp2571 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2572 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2571, i32 0, i32 4
%.tmp2573 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2572
%.tmp2574 = icmp eq %m1770$.Type.type* %.tmp2573, null
br i1 %.tmp2574, label %.if.true.2575, label %.if.false.2575
.if.true.2575:
%.tmp2577 = getelementptr [18 x i8], [18 x i8]*@.str2576, i32 0, i32 0
%.tmp2578 = load i8*, i8** %indent
%.tmp2579 = call i32(i8*,...) @printf(i8* %.tmp2577, i8* %.tmp2578)
br label %.if.end.2575
.if.false.2575:
%.tmp2581 = getelementptr [12 x i8], [12 x i8]*@.str2580, i32 0, i32 0
%.tmp2582 = load i8*, i8** %indent
%.tmp2583 = call i32(i8*,...) @printf(i8* %.tmp2581, i8* %.tmp2582)
%.tmp2584 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp2585 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2584, i32 0, i32 4
%.tmp2586 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2585
%.tmp2587 = load i32, i32* %level
%.tmp2588 = add i32 %.tmp2587, 1
call void(%m1770$.Type.type*,i32) @m1770$debug_type.v.m1770$.Type.typep.i(%m1770$.Type.type* %.tmp2586, i32 %.tmp2588)
br label %.if.end.2575
.if.end.2575:
%.tmp2590 = getelementptr [5 x i8], [5 x i8]*@.str2589, i32 0, i32 0
%.tmp2591 = load i8*, i8** %indent
%.tmp2592 = call i32(i8*,...) @printf(i8* %.tmp2590, i8* %.tmp2591)
ret void
}
%m1770$.AssignableInfo.type = type {i8*,i8,i8*,%m1770$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1770$.AssignableInfo.type* @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.node.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2593 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* null, i32 1
%.tmp2594 = ptrtoint %m1770$.AssignableInfo.type* %.tmp2593 to i32
%.tmp2595 = call i8*(i32) @malloc(i32 %.tmp2594)
%.tmp2596 = bitcast i8* %.tmp2595 to %m1770$.AssignableInfo.type*
%ptr = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp2596, %m1770$.AssignableInfo.type** %ptr
%.tmp2597 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2598 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2597, i32 0, i32 1
%.tmp2599 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2599, i8* %.tmp2598
%.tmp2600 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2601 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2600, i32 0, i32 0
store i8* null, i8** %.tmp2601
%.tmp2602 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2603 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2602, i32 0, i32 2
store i8* null, i8** %.tmp2603
%.tmp2604 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2605 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2604, i32 0, i32 3
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp2605
%.tmp2606 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2607 = icmp ne %m286$.Node.type* %.tmp2606, null
br i1 %.tmp2607, label %.if.true.2608, label %.if.false.2608
.if.true.2608:
%.tmp2609 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2610 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2609, i32 0, i32 4
%.tmp2611 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2612 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2611, i32 0, i32 3
%.tmp2613 = load i32, i32* %.tmp2612
store i32 %.tmp2613, i32* %.tmp2610
%.tmp2614 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2615 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2614, i32 0, i32 5
%.tmp2616 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2617 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2616, i32 0, i32 4
%.tmp2618 = load i32, i32* %.tmp2617
store i32 %.tmp2618, i32* %.tmp2615
%.tmp2619 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2620 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2619, i32 0, i32 6
%.tmp2621 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2622 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2621, i32 0, i32 2
%.tmp2623 = load i8*, i8** %.tmp2622
store i8* %.tmp2623, i8** %.tmp2620
br label %.if.end.2608
.if.false.2608:
%.tmp2624 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2625 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2624, i32 0, i32 4
store i32 0, i32* %.tmp2625
%.tmp2626 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2627 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2626, i32 0, i32 5
store i32 0, i32* %.tmp2627
%.tmp2628 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
%.tmp2629 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2628, i32 0, i32 6
store i8* null, i8** %.tmp2629
br label %.if.end.2608
.if.end.2608:
%.tmp2630 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %ptr
ret %m1770$.AssignableInfo.type* %.tmp2630
}
define void @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.info.arg, %m1770$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2631 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2632 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2631, i32 0, i32 0
%.tmp2633 = load i8*, i8** %id
store i8* %.tmp2633, i8** %.tmp2632
%.tmp2634 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2635 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2634, i32 0, i32 1
%.tmp2636 = load i8, i8* %scope
store i8 %.tmp2636, i8* %.tmp2635
ret void
}
define i8* @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.info.arg, %m1770$.AssignableInfo.type** %info
%.tmp2637 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2638 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2637, i32 0, i32 1
%.tmp2639 = load i8, i8* %.tmp2638
%.tmp2640 = load i8, i8* @SCOPE_CONST
%.tmp2641 = icmp eq i8 %.tmp2639, %.tmp2640
br i1 %.tmp2641, label %.if.true.2642, label %.if.false.2642
.if.true.2642:
%.tmp2643 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2644 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2643, i32 0, i32 0
%.tmp2645 = load i8*, i8** %.tmp2644
ret i8* %.tmp2645
br label %.if.end.2642
.if.false.2642:
br label %.if.end.2642
.if.end.2642:
%buf = alloca i8*
%.tmp2646 = getelementptr i8*, i8** %buf, i32 0
%.tmp2648 = getelementptr [5 x i8], [5 x i8]*@.str2647, i32 0, i32 0
%.tmp2649 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2650 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2649, i32 0, i32 1
%.tmp2651 = load i8, i8* %.tmp2650
%.tmp2652 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2653 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2652, i32 0, i32 0
%.tmp2654 = load i8*, i8** %.tmp2653
%.tmp2655 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2646, i8* %.tmp2648, i8 %.tmp2651, i8* %.tmp2654)
%.tmp2656 = load i8*, i8** %buf
ret i8* %.tmp2656
}
%m1770$.ScopeItem.type = type {i8*,%m1770$.AssignableInfo.type*,%m1770$.ScopeItem.type*}
%m1770$.GlobalName.type = type {i8*,i8*,i1,%m1770$.AssignableInfo.type*,%m1770$.GlobalName.type*}
%m1770$.Scope.type = type {i8*,%m1770$.ScopeItem.type*,%m1770$.Scope.type*}
%m1770$.ModuleLookup.type = type {i8*,i8*,%m1770$.ModuleLookup.type*,%m1770$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1770$.CompilerCtx.type = type {%m286$.Node.type*,%m0$.File.type*,%m1770$.ErrorList.type*,%m1770$.GlobalName.type*,i32,%m1770$.ModuleLookup.type*,i8*}
define void @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.info.arg, %m1770$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp2657 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2659 = getelementptr [7 x i8], [7 x i8]*@.str2658, i32 0, i32 0
%.tmp2660 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2661 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp2660)
%.tmp2662 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2657, i8* %.tmp2659, i32 %.tmp2661)
%.tmp2663 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp2664 = load i8, i8* @SCOPE_LOCAL
%.tmp2665 = load i8*, i8** %tmp_buff
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp2663, i8 %.tmp2664, i8* %.tmp2665)
ret void
}
define %m1770$.ModuleLookup.type* @m1770$get_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2667 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2668 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2667, i32 0, i32 5
%.tmp2669 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp2668
%m = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp2669, %m1770$.ModuleLookup.type** %m
br label %.for.start.2666
.for.start.2666:
%.tmp2670 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2671 = icmp ne %m1770$.ModuleLookup.type* %.tmp2670, null
br i1 %.tmp2671, label %.for.continue.2666, label %.for.end.2666
.for.continue.2666:
%.tmp2672 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2673 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2672, i32 0, i32 0
%.tmp2674 = load i8*, i8** %.tmp2673
%.tmp2675 = load i8*, i8** %filename
%.tmp2676 = call i32(i8*,i8*) @strcmp(i8* %.tmp2674, i8* %.tmp2675)
%.tmp2677 = icmp eq i32 %.tmp2676, 0
br i1 %.tmp2677, label %.if.true.2678, label %.if.false.2678
.if.true.2678:
%.tmp2679 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
ret %m1770$.ModuleLookup.type* %.tmp2679
br label %.if.end.2678
.if.false.2678:
br label %.if.end.2678
.if.end.2678:
%.tmp2680 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2681 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2680, i32 0, i32 2
%.tmp2682 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp2681
store %m1770$.ModuleLookup.type* %.tmp2682, %m1770$.ModuleLookup.type** %m
br label %.for.start.2666
.for.end.2666:
%.tmp2683 = bitcast ptr null to %m1770$.ModuleLookup.type*
ret %m1770$.ModuleLookup.type* %.tmp2683
}
define %m1770$.ModuleLookup.type* @m1770$get_current_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%.tmp2684 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2685 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2686 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2685, i32 0, i32 6
%.tmp2687 = load i8*, i8** %.tmp2686
%.tmp2688 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*,i8*) @m1770$get_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.tmp2684, i8* %.tmp2687)
ret %m1770$.ModuleLookup.type* %.tmp2688
}
define i32 @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%.tmp2689 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2690 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2689, i32 0, i32 4
%.tmp2691 = load i32, i32* %.tmp2690
%uid = alloca i32
store i32 %.tmp2691, i32* %uid
%.tmp2692 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2693 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2692, i32 0, i32 4
%.tmp2694 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2695 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2694, i32 0, i32 4
%.tmp2696 = load i32, i32* %.tmp2695
%.tmp2697 = add i32 %.tmp2696, 1
store i32 %.tmp2697, i32* %.tmp2693
%.tmp2698 = load i32, i32* %uid
ret i32 %.tmp2698
}
define %m1770$.CompilerCtx.type* @m1770$new_context.m1770$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2699 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* null, i32 1
%.tmp2700 = ptrtoint %m1770$.CompilerCtx.type* %.tmp2699 to i32
%.tmp2701 = call i8*(i32) @malloc(i32 %.tmp2700)
%.tmp2702 = bitcast i8* %.tmp2701 to %m1770$.CompilerCtx.type*
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.tmp2702, %m1770$.CompilerCtx.type** %ctx
%.tmp2703 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2704 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2703, i32 0, i32 1
%.tmp2705 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2705, %m0$.File.type** %.tmp2704
%.tmp2706 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2707 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2706, i32 0, i32 0
%.tmp2708 = bitcast ptr null to %m286$.Node.type*
store %m286$.Node.type* %.tmp2708, %m286$.Node.type** %.tmp2707
%.tmp2709 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2710 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2709, i32 0, i32 2
store %m1770$.ErrorList.type* null, %m1770$.ErrorList.type** %.tmp2710
%.tmp2711 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2712 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2711, i32 0, i32 4
store i32 0, i32* %.tmp2712
%.tmp2713 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2714 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2713, i32 0, i32 3
store %m1770$.GlobalName.type* null, %m1770$.GlobalName.type** %.tmp2714
%.tmp2715 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2716 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2715, i32 0, i32 6
%.tmp2717 = load i8*, i8** %filename
store i8* %.tmp2717, i8** %.tmp2716
%.tmp2718 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2719 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2718, i32 0, i32 5
%.tmp2720 = load i32, i32* @ModuleLookup_size
%.tmp2721 = call i8*(i32) @malloc(i32 %.tmp2720)
%.tmp2722 = bitcast i8* %.tmp2721 to %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp2722, %m1770$.ModuleLookup.type** %.tmp2719
%.tmp2723 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2724 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2723, i32 0, i32 5
%.tmp2725 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp2724
%.tmp2726 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2725, i32 0, i32 0
%.tmp2727 = load i8*, i8** %filename
store i8* %.tmp2727, i8** %.tmp2726
%.tmp2728 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2729 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2728, i32 0, i32 5
%.tmp2730 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp2729
%.tmp2731 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2730, i32 0, i32 3
store %m1770$.Scope.type* null, %m1770$.Scope.type** %.tmp2731
%.tmp2732 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2733 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2732, i32 0, i32 5
%.tmp2734 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp2733
%.tmp2735 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2734, i32 0, i32 1
%.tmp2737 = getelementptr [1 x i8], [1 x i8]*@.str2736, i32 0, i32 0
store i8* %.tmp2737, i8** %.tmp2735
%.tmp2738 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2739 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2738, i32 0, i32 5
%.tmp2740 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp2739
%.tmp2741 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2740, i32 0, i32 2
store %m1770$.ModuleLookup.type* null, %m1770$.ModuleLookup.type** %.tmp2741
%.tmp2742 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2743 = bitcast %m1770$.CompilerCtx.type* %.tmp2742 to %m1770$.CompilerCtx.type*
ret %m1770$.CompilerCtx.type* %.tmp2743
}
define void @m1770$push_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%.tmp2744 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* null, i32 1
%.tmp2745 = ptrtoint %m1770$.Scope.type* %.tmp2744 to i32
%.tmp2746 = call i8*(i32) @malloc(i32 %.tmp2745)
%.tmp2747 = bitcast i8* %.tmp2746 to %m1770$.Scope.type*
%s = alloca %m1770$.Scope.type*
store %m1770$.Scope.type* %.tmp2747, %m1770$.Scope.type** %s
%.tmp2748 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2749 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*) @m1770$get_current_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp2748)
%m = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp2749, %m1770$.ModuleLookup.type** %m
%.tmp2750 = load %m1770$.Scope.type*, %m1770$.Scope.type** %s
%.tmp2751 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp2750, i32 0, i32 2
%.tmp2752 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2753 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2752, i32 0, i32 3
%.tmp2754 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp2753
store %m1770$.Scope.type* %.tmp2754, %m1770$.Scope.type** %.tmp2751
%.tmp2755 = load %m1770$.Scope.type*, %m1770$.Scope.type** %s
%.tmp2756 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp2755, i32 0, i32 1
store %m1770$.ScopeItem.type* null, %m1770$.ScopeItem.type** %.tmp2756
%.tmp2757 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2758 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2757, i32 0, i32 3
%.tmp2759 = load %m1770$.Scope.type*, %m1770$.Scope.type** %s
store %m1770$.Scope.type* %.tmp2759, %m1770$.Scope.type** %.tmp2758
ret void
}
define void @m1770$pop_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%.tmp2760 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2761 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*) @m1770$get_current_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp2760)
%m = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp2761, %m1770$.ModuleLookup.type** %m
%.tmp2762 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2763 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2762, i32 0, i32 3
%.tmp2764 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp2763
%.tmp2765 = icmp ne %m1770$.Scope.type* %.tmp2764, null
%.tmp2767 = getelementptr [61 x i8], [61 x i8]*@.str2766, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2765, i8* %.tmp2767)
%.tmp2768 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2769 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2768, i32 0, i32 3
%.tmp2770 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2771 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2770, i32 0, i32 3
%.tmp2772 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp2771
%.tmp2773 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp2772, i32 0, i32 2
%.tmp2774 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp2773
store %m1770$.Scope.type* %.tmp2774, %m1770$.Scope.type** %.tmp2769
ret void
}
define i1 @m1770$compile_file.b.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2775 = call i8*() @m1771$grammar.cp()
%.tmp2776 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2775)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2776, %m0$.File.type** %grammar_file
%.tmp2777 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2778 = icmp eq %m0$.File.type* %.tmp2777, null
br i1 %.tmp2778, label %.if.true.2779, label %.if.false.2779
.if.true.2779:
ret i1 0
br label %.if.end.2779
.if.false.2779:
br label %.if.end.2779
.if.end.2779:
%.tmp2780 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2781 = call %m286$.ParsingContext.type*(%m0$.File.type*) @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2780)
%grammar_ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp2781, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2782 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2783 = call %m286$.Rule.type**(%m286$.ParsingContext.type*) @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp2782)
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp2783, %m286$.Rule.type*** %grammar
%.tmp2784 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2785 = bitcast %m286$.ParsingContext.type* %.tmp2784 to i8*
call void(i8*) @free(i8* %.tmp2785)
%.tmp2786 = load i8*, i8** %filepath
%.tmp2787 = load i32, i32* @O_RDONLY
%.tmp2788 = call i32(i8*,i32) @open(i8* %.tmp2786, i32 %.tmp2787)
%input_fd = alloca i32
store i32 %.tmp2788, i32* %input_fd
%.tmp2789 = load i32, i32* %input_fd
%.tmp2790 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp2789)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp2790, %m209$.PeekerInfo.type** %p
%.tmp2791 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2792 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp2791, i32 0, i32 6
%.tmp2793 = load i8*, i8** %filepath
store i8* %.tmp2793, i8** %.tmp2792
%.tmp2794 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2795 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp2794, i1 0)
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp2795, %m287$.Token.type** %tokens
%.tmp2796 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp2798 = getelementptr [6 x i8], [6 x i8]*@.str2797, i32 0, i32 0
%.tmp2799 = load %m287$.Token.type*, %m287$.Token.type** %tokens
%.tmp2800 = call %m286$.ParseResult.type*(%m286$.Rule.type**,i8*,%m287$.Token.type*) @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.tmp2796, i8* %.tmp2798, %m287$.Token.type* %.tmp2799)
%ast = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp2800, %m286$.ParseResult.type** %ast
%.tmp2801 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2802 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %ast
%.tmp2803 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp2802, i32 0, i32 1
%.tmp2804 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2803
%.tmp2805 = call i1(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile.b.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp2801, %m286$.Node.type* %.tmp2804)
ret i1 %.tmp2805
}
define i1 @m1770$compile.b.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2806 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2807 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2806, i32 0, i32 0
%.tmp2808 = load i8*, i8** %.tmp2807
%.tmp2810 = getelementptr [6 x i8], [6 x i8]*@.str2809, i32 0, i32 0
%.tmp2811 = call i32(i8*,i8*) @strcmp(i8* %.tmp2808, i8* %.tmp2810)
%.tmp2812 = icmp ne i32 %.tmp2811, 0
br i1 %.tmp2812, label %.if.true.2813, label %.if.false.2813
.if.true.2813:
ret i1 0
br label %.if.end.2813
.if.false.2813:
br label %.if.end.2813
.if.end.2813:
%.tmp2814 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
call void(%m1770$.CompilerCtx.type*) @m1770$push_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp2814)
%.tmp2815 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2816 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2815, i32 0, i32 6
%.tmp2817 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2816
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2817, %m286$.Node.type** %start
%.tmp2818 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2819 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2818, i32 0, i32 0
%.tmp2820 = load i8*, i8** %.tmp2819
%.tmp2822 = getelementptr [13 x i8], [13 x i8]*@.str2821, i32 0, i32 0
%.tmp2823 = call i32(i8*,i8*) @strcmp(i8* %.tmp2820, i8* %.tmp2822)
%.tmp2824 = icmp eq i32 %.tmp2823, 0
br i1 %.tmp2824, label %.if.true.2825, label %.if.false.2825
.if.true.2825:
%.tmp2826 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2827 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2826, i32 0, i32 7
%.tmp2828 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2827
store %m286$.Node.type* %.tmp2828, %m286$.Node.type** %start
br label %.if.end.2825
.if.false.2825:
br label %.if.end.2825
.if.end.2825:
%.tmp2830 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2830, %m286$.Node.type** %stmt
br label %.for.start.2829
.for.start.2829:
%.tmp2831 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2832 = icmp ne %m286$.Node.type* %.tmp2831, null
br i1 %.tmp2832, label %.for.continue.2829, label %.for.end.2829
.for.continue.2829:
%.tmp2833 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2834 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2835 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2834, i32 0, i32 6
%.tmp2836 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2835
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1770$compile_statement.v.m1770$.CompilerCtx.typep.m286$.Node.typep.b(%m1770$.CompilerCtx.type* %.tmp2833, %m286$.Node.type* %.tmp2836, i1 1)
%.tmp2837 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2838 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2837, i32 0, i32 7
%.tmp2839 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2838
store %m286$.Node.type* %.tmp2839, %m286$.Node.type** %stmt
br label %.for.start.2829
.for.end.2829:
%.tmp2841 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2841, %m286$.Node.type** %s
br label %.for.start.2840
.for.start.2840:
%.tmp2842 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2843 = icmp ne %m286$.Node.type* %.tmp2842, null
br i1 %.tmp2843, label %.for.continue.2840, label %.for.end.2840
.for.continue.2840:
%.tmp2844 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2845 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2846 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2845, i32 0, i32 6
%.tmp2847 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2846
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1770$compile_statement.v.m1770$.CompilerCtx.typep.m286$.Node.typep.b(%m1770$.CompilerCtx.type* %.tmp2844, %m286$.Node.type* %.tmp2847, i1 0)
%.tmp2848 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2849 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2848, i32 0, i32 7
%.tmp2850 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2849
store %m286$.Node.type* %.tmp2850, %m286$.Node.type** %s
br label %.for.start.2840
.for.end.2840:
%.tmp2851 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2852 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2851, i32 0, i32 2
%.tmp2853 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp2852
%.tmp2854 = icmp ne %m1770$.ErrorList.type* %.tmp2853, null
%has_errors = alloca i1
store i1 %.tmp2854, i1* %has_errors
%.tmp2856 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2857 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2856, i32 0, i32 2
%.tmp2858 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp2857
%err = alloca %m1770$.ErrorList.type*
store %m1770$.ErrorList.type* %.tmp2858, %m1770$.ErrorList.type** %err
br label %.for.start.2855
.for.start.2855:
%.tmp2859 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %err
%.tmp2860 = icmp ne %m1770$.ErrorList.type* %.tmp2859, null
br i1 %.tmp2860, label %.for.continue.2855, label %.for.end.2855
.for.continue.2855:
%.tmp2861 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %err
%.tmp2862 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp2861, i32 0, i32 0
%.tmp2863 = load %m717$.Error.type*, %m717$.Error.type** %.tmp2862
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp2863)
%.tmp2864 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %err
%.tmp2865 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp2864, i32 0, i32 1
%.tmp2866 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp2865
store %m1770$.ErrorList.type* %.tmp2866, %m1770$.ErrorList.type** %err
br label %.for.start.2855
.for.end.2855:
%.tmp2868 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2869 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2868, i32 0, i32 3
%.tmp2870 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %.tmp2869
%g = alloca %m1770$.GlobalName.type*
store %m1770$.GlobalName.type* %.tmp2870, %m1770$.GlobalName.type** %g
br label %.for.start.2867
.for.start.2867:
%.tmp2871 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2872 = icmp ne %m1770$.GlobalName.type* %.tmp2871, null
br i1 %.tmp2872, label %.for.continue.2867, label %.for.end.2867
.for.continue.2867:
%.tmp2873 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2874 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
call void(%m1770$.CompilerCtx.type*,%m1770$.GlobalName.type*) @m1770$compile_global.v.m1770$.CompilerCtx.typep.m1770$.GlobalName.typep(%m1770$.CompilerCtx.type* %.tmp2873, %m1770$.GlobalName.type* %.tmp2874)
%.tmp2875 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2876 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2875, i32 0, i32 4
%.tmp2877 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %.tmp2876
store %m1770$.GlobalName.type* %.tmp2877, %m1770$.GlobalName.type** %g
br label %.for.start.2867
.for.end.2867:
%.tmp2878 = load i1, i1* %has_errors
ret i1 %.tmp2878
}
define void @m1770$compile_global.v.m1770$.CompilerCtx.typep.m1770$.GlobalName.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%g = alloca %m1770$.GlobalName.type*
store %m1770$.GlobalName.type* %.g.arg, %m1770$.GlobalName.type** %g
%.tmp2879 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2880 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2879, i32 0, i32 2
%.tmp2881 = load i1, i1* %.tmp2880
%.tmp2882 = icmp eq i1 %.tmp2881, 0
%.tmp2883 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2884 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2883, i32 0, i32 1
%.tmp2885 = load i8*, i8** %.tmp2884
%.tmp2887 = getelementptr [7 x i8], [7 x i8]*@.str2886, i32 0, i32 0
%.tmp2888 = call i32(i8*,i8*) @strcmp(i8* %.tmp2885, i8* %.tmp2887)
%.tmp2889 = icmp eq i32 %.tmp2888, 0
%.tmp2890 = and i1 %.tmp2882, %.tmp2889
br i1 %.tmp2890, label %.if.true.2891, label %.if.false.2891
.if.true.2891:
%.tmp2892 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2893 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp2892, i32 0, i32 1
%.tmp2894 = load %m0$.File.type*, %m0$.File.type** %.tmp2893
%.tmp2896 = getelementptr [21 x i8], [21 x i8]*@.str2895, i32 0, i32 0
%.tmp2897 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2898 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2897, i32 0, i32 3
%.tmp2899 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp2898
%.tmp2900 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp2899)
%.tmp2901 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2902 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2903 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2902, i32 0, i32 3
%.tmp2904 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp2903
%.tmp2905 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp2904, i32 0, i32 3
%.tmp2906 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2905
%.tmp2907 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp2901, %m1770$.Type.type* %.tmp2906)
%.tmp2908 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2909 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2908, i32 0, i32 0
%.tmp2910 = load i8*, i8** %.tmp2909
%.tmp2911 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2894, i8* %.tmp2896, i8* %.tmp2900, i8* %.tmp2907, i8* %.tmp2910)
%.tmp2912 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
%.tmp2913 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp2912, i32 0, i32 2
store i1 1, i1* %.tmp2913
br label %.if.end.2891
.if.false.2891:
br label %.if.end.2891
.if.end.2891:
ret void
}
define i8* @m1770$get_mod_prefix.cp.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2914 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2915 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*) @m1770$get_current_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp2914)
%m = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp2915, %m1770$.ModuleLookup.type** %m
%.tmp2916 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp2917 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp2916, i32 0, i32 1
%.tmp2918 = load i8*, i8** %.tmp2917
ret i8* %.tmp2918
}
define i8* @m1770$name_mangle.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1770$.Type.type* %.type.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%fn = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn.arg, %m286$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.type.arg, %m1770$.Type.type** %type
%mangled_name = alloca i8*
%.tmp2919 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2920 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2921 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2920, i32 0, i32 2
%.tmp2922 = load i8*, i8** %.tmp2921
%.tmp2923 = call i8*(%m1770$.CompilerCtx.type*,i8*) @m1770$get_mod_prefix.cp.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.tmp2919, i8* %.tmp2922)
%prefix = alloca i8*
store i8* %.tmp2923, i8** %prefix
%.tmp2924 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2926 = getelementptr [5 x i8], [5 x i8]*@.str2925, i32 0, i32 0
%.tmp2927 = load i8*, i8** %prefix
%.tmp2928 = load i8*, i8** %original_name
%.tmp2929 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2924, i8* %.tmp2926, i8* %.tmp2927, i8* %.tmp2928)
%.tmp2930 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2931 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2930, i32 0, i32 0
%.tmp2932 = load i8*, i8** %.tmp2931
%.tmp2934 = getelementptr [9 x i8], [9 x i8]*@.str2933, i32 0, i32 0
%.tmp2935 = call i32(i8*,i8*) @strcmp(i8* %.tmp2932, i8* %.tmp2934)
%.tmp2936 = icmp eq i32 %.tmp2935, 0
br i1 %.tmp2936, label %.if.true.2937, label %.if.false.2937
.if.true.2937:
%.tmp2938 = load i8*, i8** %mangled_name
%.tmp2940 = getelementptr [5 x i8], [5 x i8]*@.str2939, i32 0, i32 0
%.tmp2941 = call i32(i8*,i8*) @strcmp(i8* %.tmp2938, i8* %.tmp2940)
%.tmp2942 = icmp ne i32 %.tmp2941, 0
br i1 %.tmp2942, label %.if.true.2943, label %.if.false.2943
.if.true.2943:
%tmp_buff = alloca i8*
%swap_var = alloca i8*
%.tmp2945 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp2946 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2945, i32 0, i32 3
%.tmp2947 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2946
%tp = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp2947, %m1770$.Type.type** %tp
br label %.for.start.2944
.for.start.2944:
%.tmp2948 = load %m1770$.Type.type*, %m1770$.Type.type** %tp
%.tmp2949 = icmp ne %m1770$.Type.type* %.tmp2948, null
br i1 %.tmp2949, label %.for.continue.2944, label %.for.end.2944
.for.continue.2944:
%.tmp2950 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2952 = getelementptr [6 x i8], [6 x i8]*@.str2951, i32 0, i32 0
%.tmp2953 = load i8*, i8** %mangled_name
%.tmp2954 = load %m1770$.Type.type*, %m1770$.Type.type** %tp
%.tmp2955 = call i8*(%m1770$.Type.type*) @m1770$type_abbr.cp.m1770$.Type.typep(%m1770$.Type.type* %.tmp2954)
%.tmp2956 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2950, i8* %.tmp2952, i8* %.tmp2953, i8* %.tmp2955)
%.tmp2957 = load i8*, i8** %tmp_buff
store i8* %.tmp2957, i8** %swap_var
%.tmp2958 = load i8*, i8** %mangled_name
store i8* %.tmp2958, i8** %tmp_buff
%.tmp2959 = load i8*, i8** %swap_var
store i8* %.tmp2959, i8** %mangled_name
%.tmp2960 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2960)
%.tmp2961 = load %m1770$.Type.type*, %m1770$.Type.type** %tp
%.tmp2962 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp2961, i32 0, i32 4
%.tmp2963 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp2962
store %m1770$.Type.type* %.tmp2963, %m1770$.Type.type** %tp
br label %.for.start.2944
.for.end.2944:
br label %.if.end.2943
.if.false.2943:
br label %.if.end.2943
.if.end.2943:
br label %.if.end.2937
.if.false.2937:
br label %.if.end.2937
.if.end.2937:
%.tmp2964 = load i8*, i8** %mangled_name
ret i8* %.tmp2964
}
define void @m1770$compile_statement.v.m1770$.CompilerCtx.typep.m286$.Node.typep.b(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info = alloca %m1770$.AssignableInfo.type*
%return_type = alloca %m1770$.Type.type*
%err_buf = alloca i8*
%tmp_buff = alloca i8*
%.tmp2965 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2966 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2965, i32 0, i32 0
%.tmp2967 = load i8*, i8** %.tmp2966
%.tmp2969 = getelementptr [3 x i8], [3 x i8]*@.str2968, i32 0, i32 0
%.tmp2970 = call i32(i8*,i8*) @strcmp(i8* %.tmp2967, i8* %.tmp2969)
%.tmp2971 = icmp eq i32 %.tmp2970, 0
br i1 %.tmp2971, label %.if.true.2972, label %.if.false.2972
.if.true.2972:
ret void
br label %.if.end.2972
.if.false.2972:
%.tmp2973 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2974 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2973, i32 0, i32 0
%.tmp2975 = load i8*, i8** %.tmp2974
%.tmp2977 = getelementptr [7 x i8], [7 x i8]*@.str2976, i32 0, i32 0
%.tmp2978 = call i32(i8*,i8*) @strcmp(i8* %.tmp2975, i8* %.tmp2977)
%.tmp2979 = icmp eq i32 %.tmp2978, 0
br i1 %.tmp2979, label %.if.true.2980, label %.if.false.2980
.if.true.2980:
%.tmp2981 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2982 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2981, i32 0, i32 6
%.tmp2983 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2982
%.tmp2985 = getelementptr [11 x i8], [11 x i8]*@.str2984, i32 0, i32 0
%.tmp2986 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp2983, i8* %.tmp2985)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2986, %m286$.Node.type** %assignable
%.tmp2987 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp2988 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp2989 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp2987, %m286$.Node.type* %.tmp2988)
%a_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp2989, %m1770$.AssignableInfo.type** %a_info
%.tmp2990 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp2991 = icmp eq %m1770$.AssignableInfo.type* %.tmp2990, null
br i1 %.tmp2991, label %.if.true.2992, label %.if.false.2992
.if.true.2992:
ret void
br label %.if.end.2992
.if.false.2992:
br label %.if.end.2992
.if.end.2992:
%.tmp2993 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2994 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp2993)
store %m1770$.AssignableInfo.type* %.tmp2994, %m1770$.AssignableInfo.type** %info
%.tmp2995 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2996 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2995, i32 0, i32 6
%.tmp2997 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2996
%.tmp2998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2997, i32 0, i32 7
%.tmp2999 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2998
%.tmp3000 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2999, i32 0, i32 1
%.tmp3001 = load i8*, i8** %.tmp3000
%global_name = alloca i8*
store i8* %.tmp3001, i8** %global_name
%.tmp3002 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3003 = load i8, i8* @SCOPE_GLOBAL
%.tmp3004 = load i8*, i8** %global_name
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp3002, i8 %.tmp3003, i8* %.tmp3004)
%.tmp3005 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3006 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3005, i32 0, i32 3
%.tmp3007 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp3008 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3007, i32 0, i32 3
%.tmp3009 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3008
store %m1770$.Type.type* %.tmp3009, %m1770$.Type.type** %.tmp3006
%.tmp3010 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3011 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3010, i32 0, i32 2
%.tmp3013 = getelementptr [9 x i8], [9 x i8]*@.str3012, i32 0, i32 0
store i8* %.tmp3013, i8** %.tmp3011
%.tmp3014 = load i1, i1* %shallow
%.tmp3015 = icmp eq i1 %.tmp3014, 1
br i1 %.tmp3015, label %.if.true.3016, label %.if.false.3016
.if.true.3016:
%.tmp3017 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3018 = load i8*, i8** %global_name
%.tmp3019 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3017, i8* %.tmp3018, %m1770$.AssignableInfo.type* %.tmp3019)
br label %.if.end.3016
.if.false.3016:
%.tmp3020 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3021 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3020, i32 0, i32 1
%.tmp3022 = load %m0$.File.type*, %m0$.File.type** %.tmp3021
%.tmp3024 = getelementptr [21 x i8], [21 x i8]*@.str3023, i32 0, i32 0
%.tmp3025 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3026 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3025)
%.tmp3027 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3028 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3029 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3028, i32 0, i32 3
%.tmp3030 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3029
%.tmp3031 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3027, %m1770$.Type.type* %.tmp3030)
%.tmp3032 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp3033 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3032)
%.tmp3034 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3022, i8* %.tmp3024, i8* %.tmp3026, i8* %.tmp3031, i8* %.tmp3033)
br label %.if.end.3016
.if.end.3016:
br label %.if.end.2980
.if.false.2980:
%.tmp3035 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3036 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3035, i32 0, i32 0
%.tmp3037 = load i8*, i8** %.tmp3036
%.tmp3039 = getelementptr [10 x i8], [10 x i8]*@.str3038, i32 0, i32 0
%.tmp3040 = call i32(i8*,i8*) @strcmp(i8* %.tmp3037, i8* %.tmp3039)
%.tmp3041 = icmp eq i32 %.tmp3040, 0
br i1 %.tmp3041, label %.if.true.3042, label %.if.false.3042
.if.true.3042:
%.tmp3043 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3044 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3043, i32 0, i32 6
%.tmp3045 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3044
%.tmp3046 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3045, i32 0, i32 7
%.tmp3047 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3046
%.tmp3048 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3047, i32 0, i32 1
%.tmp3049 = load i8*, i8** %.tmp3048
%type_name = alloca i8*
store i8* %.tmp3049, i8** %type_name
%.tmp3050 = load i1, i1* %shallow
%.tmp3051 = icmp eq i1 %.tmp3050, 1
br i1 %.tmp3051, label %.if.true.3052, label %.if.false.3052
.if.true.3052:
%.tmp3053 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3054 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3053)
store %m1770$.AssignableInfo.type* %.tmp3054, %m1770$.AssignableInfo.type** %info
%.tmp3055 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3056 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*) @m1770$get_current_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3055)
%mod_from = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp3056, %m1770$.ModuleLookup.type** %mod_from
%.tmp3057 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3059 = getelementptr [11 x i8], [11 x i8]*@.str3058, i32 0, i32 0
%.tmp3060 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod_from
%.tmp3061 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3060, i32 0, i32 1
%.tmp3062 = load i8*, i8** %.tmp3061
%.tmp3063 = load i8*, i8** %type_name
%.tmp3064 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3057, i8* %.tmp3059, i8* %.tmp3062, i8* %.tmp3063)
%.tmp3065 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3066 = load i8, i8* @SCOPE_LOCAL
%.tmp3067 = load i8*, i8** %tmp_buff
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp3065, i8 %.tmp3066, i8* %.tmp3067)
%.tmp3068 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3069 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3068, i32 0, i32 2
%.tmp3071 = getelementptr [10 x i8], [10 x i8]*@.str3070, i32 0, i32 0
store i8* %.tmp3071, i8** %.tmp3069
%.tmp3072 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3073 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3072, i32 0, i32 4
%.tmp3074 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3075 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3074, i32 0, i32 3
%.tmp3076 = load i32, i32* %.tmp3075
store i32 %.tmp3076, i32* %.tmp3073
%.tmp3077 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3078 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3077, i32 0, i32 5
%.tmp3079 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3080 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3079, i32 0, i32 4
%.tmp3081 = load i32, i32* %.tmp3080
store i32 %.tmp3081, i32* %.tmp3078
%.tmp3082 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3083 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3082, i32 0, i32 3
%.tmp3084 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp3084, %m1770$.Type.type** %.tmp3083
%.tmp3085 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3086 = load i8*, i8** %type_name
%.tmp3087 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3085, i8* %.tmp3086, %m1770$.AssignableInfo.type* %.tmp3087)
%.tmp3088 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3089 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3088, i32 0, i32 6
%.tmp3090 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3089
%.tmp3092 = getelementptr [5 x i8], [5 x i8]*@.str3091, i32 0, i32 0
%.tmp3093 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3090, i8* %.tmp3092)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3093, %m286$.Node.type** %type_decl
%.tmp3094 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3095 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp3096 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3095, i32 0, i32 6
%.tmp3097 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3096
%.tmp3098 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3094, %m286$.Node.type* %.tmp3097)
%type_struct = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp3098, %m1770$.Type.type** %type_struct
%.tmp3099 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3100 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3099, i32 0, i32 3
%.tmp3101 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3100
%.tmp3102 = load %m1770$.Type.type*, %m1770$.Type.type** %type_struct
call void(%m1770$.Type.type*,%m1770$.Type.type*) @m1770$copy_type.v.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp3101, %m1770$.Type.type* %.tmp3102)
%.tmp3103 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3104 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3103, i32 0, i32 3
%.tmp3105 = load %m1770$.Type.type*, %m1770$.Type.type** %type_struct
store %m1770$.Type.type* %.tmp3105, %m1770$.Type.type** %.tmp3104
br label %.if.end.3052
.if.false.3052:
%.tmp3106 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3107 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3108 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3107, i32 0, i32 6
%.tmp3109 = load i8*, i8** %.tmp3108
%.tmp3110 = load i8*, i8** %type_name
%.tmp3111 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,i8*,i8*) @m1770$find_defined_str.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.cp(%m1770$.CompilerCtx.type* %.tmp3106, i8* %.tmp3109, i8* %.tmp3110)
%scope = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp3111, %m1770$.ScopeItem.type** %scope
%.tmp3112 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %scope
%.tmp3113 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp3112, i32 0, i32 1
%.tmp3114 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp3113
store %m1770$.AssignableInfo.type* %.tmp3114, %m1770$.AssignableInfo.type** %info
%.tmp3115 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3116 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3115, i32 0, i32 1
%.tmp3117 = load %m0$.File.type*, %m0$.File.type** %.tmp3116
%.tmp3119 = getelementptr [14 x i8], [14 x i8]*@.str3118, i32 0, i32 0
%.tmp3120 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3121 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3120)
%.tmp3122 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3123 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3124 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3123, i32 0, i32 3
%.tmp3125 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3124
%.tmp3126 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3122, %m1770$.Type.type* %.tmp3125)
%.tmp3127 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3117, i8* %.tmp3119, i8* %.tmp3121, i8* %.tmp3126)
br label %.if.end.3052
.if.end.3052:
br label %.if.end.3042
.if.false.3042:
%.tmp3128 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3129 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3128, i32 0, i32 0
%.tmp3130 = load i8*, i8** %.tmp3129
%.tmp3132 = getelementptr [7 x i8], [7 x i8]*@.str3131, i32 0, i32 0
%.tmp3133 = call i32(i8*,i8*) @strcmp(i8* %.tmp3130, i8* %.tmp3132)
%.tmp3134 = icmp eq i32 %.tmp3133, 0
br i1 %.tmp3134, label %.if.true.3135, label %.if.false.3135
.if.true.3135:
%.tmp3136 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3137 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3136)
store %m1770$.AssignableInfo.type* %.tmp3137, %m1770$.AssignableInfo.type** %info
%.tmp3138 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3139 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3138, i32 0, i32 3
%.tmp3140 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3141 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3142 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3141, i32 0, i32 6
%.tmp3143 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3142
%.tmp3144 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3143, i32 0, i32 7
%.tmp3145 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3144
%.tmp3146 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$syn_function_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3140, %m286$.Node.type* %.tmp3145)
store %m1770$.Type.type* %.tmp3146, %m1770$.Type.type** %.tmp3139
%.tmp3147 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3148 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3147, i32 0, i32 2
%.tmp3150 = getelementptr [7 x i8], [7 x i8]*@.str3149, i32 0, i32 0
store i8* %.tmp3150, i8** %.tmp3148
%.tmp3151 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3152 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3151, i32 0, i32 6
%.tmp3153 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3152
%.tmp3154 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3153, i32 0, i32 7
%.tmp3155 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3154
%.tmp3156 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3155, i32 0, i32 7
%.tmp3157 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3156
%.tmp3158 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3157, i32 0, i32 1
%.tmp3159 = load i8*, i8** %.tmp3158
%fn_name = alloca i8*
store i8* %.tmp3159, i8** %fn_name
%.tmp3160 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3161 = load i8, i8* @SCOPE_GLOBAL
%.tmp3162 = load i8*, i8** %fn_name
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp3160, i8 %.tmp3161, i8* %.tmp3162)
%.tmp3163 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3164 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3163, i32 0, i32 4
%.tmp3165 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3166 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3165, i32 0, i32 3
%.tmp3167 = load i32, i32* %.tmp3166
store i32 %.tmp3167, i32* %.tmp3164
%.tmp3168 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3169 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3168, i32 0, i32 5
%.tmp3170 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3171 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3170, i32 0, i32 4
%.tmp3172 = load i32, i32* %.tmp3171
store i32 %.tmp3172, i32* %.tmp3169
%.tmp3173 = getelementptr %m1770$.Type.type, %m1770$.Type.type* null, i32 1
%.tmp3174 = ptrtoint %m1770$.Type.type* %.tmp3173 to i32
%.tmp3175 = call i8*(i32) @malloc(i32 %.tmp3174)
%.tmp3176 = bitcast i8* %.tmp3175 to %m1770$.Type.type*
store %m1770$.Type.type* %.tmp3176, %m1770$.Type.type** %return_type
%.tmp3177 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3178 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3177, i32 0, i32 4
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp3178
%.tmp3179 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3180 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3179, i32 0, i32 1
store i8* null, i8** %.tmp3180
%.tmp3181 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3182 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3181, i32 0, i32 0
%.tmp3183 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3184 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3183, i32 0, i32 3
%.tmp3185 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3184
%.tmp3186 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3185, i32 0, i32 3
%.tmp3187 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3186
%.tmp3188 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3187, i32 0, i32 0
%.tmp3189 = load i8*, i8** %.tmp3188
store i8* %.tmp3189, i8** %.tmp3182
%.tmp3190 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3191 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3190, i32 0, i32 3
%.tmp3192 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3193 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3192, i32 0, i32 3
%.tmp3194 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3193
%.tmp3195 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3194, i32 0, i32 3
%.tmp3196 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3195
%.tmp3197 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3196, i32 0, i32 3
%.tmp3198 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3197
store %m1770$.Type.type* %.tmp3198, %m1770$.Type.type** %.tmp3191
%.tmp3199 = load i1, i1* %shallow
%.tmp3200 = icmp eq i1 %.tmp3199, 0
br i1 %.tmp3200, label %.if.true.3201, label %.if.false.3201
.if.true.3201:
%.tmp3202 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3203 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3202, i32 0, i32 1
%.tmp3204 = load %m0$.File.type*, %m0$.File.type** %.tmp3203
%.tmp3206 = getelementptr [15 x i8], [15 x i8]*@.str3205, i32 0, i32 0
%.tmp3207 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3208 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3209 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3207, %m1770$.Type.type* %.tmp3208)
%.tmp3210 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3211 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3210)
%.tmp3212 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3204, i8* %.tmp3206, i8* %.tmp3209, i8* %.tmp3211)
%.tmp3214 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3215 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3214, i32 0, i32 3
%.tmp3216 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3215
%.tmp3217 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3216, i32 0, i32 3
%.tmp3218 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3217
%.tmp3219 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3218, i32 0, i32 4
%.tmp3220 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3219
%pt = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp3220, %m1770$.Type.type** %pt
br label %.for.start.3213
.for.start.3213:
%.tmp3221 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
%.tmp3222 = icmp ne %m1770$.Type.type* %.tmp3221, null
br i1 %.tmp3222, label %.for.continue.3213, label %.for.end.3213
.for.continue.3213:
%.tmp3223 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
%.tmp3224 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3225 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3224, i32 0, i32 3
%.tmp3226 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3225
%.tmp3227 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3226, i32 0, i32 3
%.tmp3228 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3227
%.tmp3229 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3228, i32 0, i32 4
%.tmp3230 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3229
%.tmp3231 = icmp ne %m1770$.Type.type* %.tmp3223, %.tmp3230
br i1 %.tmp3231, label %.if.true.3232, label %.if.false.3232
.if.true.3232:
%.tmp3233 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3234 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3233, i32 0, i32 1
%.tmp3235 = load %m0$.File.type*, %m0$.File.type** %.tmp3234
%.tmp3237 = getelementptr [3 x i8], [3 x i8]*@.str3236, i32 0, i32 0
%.tmp3238 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3235, i8* %.tmp3237)
br label %.if.end.3232
.if.false.3232:
br label %.if.end.3232
.if.end.3232:
%.tmp3239 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3240 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3239, i32 0, i32 1
%.tmp3241 = load %m0$.File.type*, %m0$.File.type** %.tmp3240
%.tmp3243 = getelementptr [3 x i8], [3 x i8]*@.str3242, i32 0, i32 0
%.tmp3244 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3245 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
%.tmp3246 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3244, %m1770$.Type.type* %.tmp3245)
%.tmp3247 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3241, i8* %.tmp3243, i8* %.tmp3246)
%.tmp3248 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
%.tmp3249 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3248, i32 0, i32 4
%.tmp3250 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3249
store %m1770$.Type.type* %.tmp3250, %m1770$.Type.type** %pt
br label %.for.start.3213
.for.end.3213:
%.tmp3251 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3252 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3251, i32 0, i32 1
%.tmp3253 = load %m0$.File.type*, %m0$.File.type** %.tmp3252
%.tmp3255 = getelementptr [3 x i8], [3 x i8]*@.str3254, i32 0, i32 0
%.tmp3256 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3253, i8* %.tmp3255)
%.tmp3257 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3258 = bitcast %m1770$.Type.type* %.tmp3257 to i8*
call void(i8*) @free(i8* %.tmp3258)
br label %.if.end.3201
.if.false.3201:
%.tmp3259 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3260 = load i8*, i8** %fn_name
%.tmp3261 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3259, i8* %.tmp3260, %m1770$.AssignableInfo.type* %.tmp3261)
br label %.if.end.3201
.if.end.3201:
br label %.if.end.3135
.if.false.3135:
%.tmp3262 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3263 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3262, i32 0, i32 0
%.tmp3264 = load i8*, i8** %.tmp3263
%.tmp3266 = getelementptr [9 x i8], [9 x i8]*@.str3265, i32 0, i32 0
%.tmp3267 = call i32(i8*,i8*) @strcmp(i8* %.tmp3264, i8* %.tmp3266)
%.tmp3268 = icmp eq i32 %.tmp3267, 0
br i1 %.tmp3268, label %.if.true.3269, label %.if.false.3269
.if.true.3269:
%.tmp3270 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3271 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3270)
store %m1770$.AssignableInfo.type* %.tmp3271, %m1770$.AssignableInfo.type** %info
%.tmp3272 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3273 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3272, i32 0, i32 2
%.tmp3275 = getelementptr [9 x i8], [9 x i8]*@.str3274, i32 0, i32 0
store i8* %.tmp3275, i8** %.tmp3273
%.tmp3276 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3277 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3276, i32 0, i32 3
%.tmp3278 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3279 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3280 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3279, i32 0, i32 6
%.tmp3281 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3280
%.tmp3282 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$syn_function_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3278, %m286$.Node.type* %.tmp3281)
store %m1770$.Type.type* %.tmp3282, %m1770$.Type.type** %.tmp3277
%.tmp3283 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3284 = call i8*(%m286$.Node.type*) @m1770$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3283)
%name = alloca i8*
store i8* %.tmp3284, i8** %name
%.tmp3285 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3286 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3287 = load i8*, i8** %name
%.tmp3288 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3289 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3288, i32 0, i32 3
%.tmp3290 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3289
%.tmp3291 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1770$.Type.type*) @m1770$name_mangle.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3285, %m286$.Node.type* %.tmp3286, i8* %.tmp3287, %m1770$.Type.type* %.tmp3290)
store i8* %.tmp3291, i8** %tmp_buff
%.tmp3292 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3293 = load i8, i8* @SCOPE_GLOBAL
%.tmp3294 = load i8*, i8** %tmp_buff
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp3292, i8 %.tmp3293, i8* %.tmp3294)
%.tmp3295 = load i1, i1* %shallow
%.tmp3296 = icmp eq i1 %.tmp3295, 1
br i1 %.tmp3296, label %.if.true.3297, label %.if.false.3297
.if.true.3297:
%.tmp3298 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3299 = load i8*, i8** %name
%.tmp3300 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3298, i8* %.tmp3299, %m1770$.AssignableInfo.type* %.tmp3300)
br label %.if.end.3297
.if.false.3297:
%.tmp3301 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp3301, %m1770$.Type.type** %return_type
%.tmp3302 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3303 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3304 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3303, i32 0, i32 3
%.tmp3305 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3304
%.tmp3306 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3305, i32 0, i32 3
%.tmp3307 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3306
call void(%m1770$.Type.type*,%m1770$.Type.type*) @m1770$copy_type.v.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp3302, %m1770$.Type.type* %.tmp3307)
%.tmp3308 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3309 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3308, i32 0, i32 1
%.tmp3310 = load %m0$.File.type*, %m0$.File.type** %.tmp3309
%.tmp3312 = getelementptr [14 x i8], [14 x i8]*@.str3311, i32 0, i32 0
%.tmp3313 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3314 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3315 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3313, %m1770$.Type.type* %.tmp3314)
%.tmp3316 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3317 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3316)
%.tmp3318 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3310, i8* %.tmp3312, i8* %.tmp3315, i8* %.tmp3317)
%.tmp3319 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3320 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3319, i32 0, i32 6
%.tmp3321 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3320
%.tmp3322 = call %m286$.Node.type*(%m286$.Node.type*) @m1770$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3321)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3322, %m286$.Node.type** %params
%param_type = alloca %m1770$.Type.type*
%.tmp3324 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3324, %m286$.Node.type** %param_ptr
br label %.for.start.3323
.for.start.3323:
%.tmp3325 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3326 = icmp ne %m286$.Node.type* %.tmp3325, null
br i1 %.tmp3326, label %.for.continue.3323, label %.for.end.3323
.for.continue.3323:
%.tmp3327 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3328 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp3329 = icmp ne %m286$.Node.type* %.tmp3327, %.tmp3328
br i1 %.tmp3329, label %.if.true.3330, label %.if.false.3330
.if.true.3330:
%.tmp3331 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3332 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3331, i32 0, i32 7
%.tmp3333 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3332
store %m286$.Node.type* %.tmp3333, %m286$.Node.type** %param_ptr
%.tmp3334 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3335 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3334, i32 0, i32 1
%.tmp3336 = load %m0$.File.type*, %m0$.File.type** %.tmp3335
%.tmp3338 = getelementptr [3 x i8], [3 x i8]*@.str3337, i32 0, i32 0
%.tmp3339 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3336, i8* %.tmp3338)
br label %.if.end.3330
.if.false.3330:
br label %.if.end.3330
.if.end.3330:
%.tmp3340 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3341 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3340, i32 0, i32 0
%.tmp3342 = load i8*, i8** %.tmp3341
%.tmp3344 = getelementptr [5 x i8], [5 x i8]*@.str3343, i32 0, i32 0
%.tmp3345 = call i32(i8*,i8*) @strcmp(i8* %.tmp3342, i8* %.tmp3344)
%.tmp3346 = icmp eq i32 %.tmp3345, 0
br i1 %.tmp3346, label %.if.true.3347, label %.if.false.3347
.if.true.3347:
%.tmp3348 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3349 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3350 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3349, i32 0, i32 6
%.tmp3351 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3350
%.tmp3352 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3348, %m286$.Node.type* %.tmp3351)
store %m1770$.Type.type* %.tmp3352, %m1770$.Type.type** %param_type
%.tmp3353 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3354 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3353, i32 0, i32 7
%.tmp3355 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3354
store %m286$.Node.type* %.tmp3355, %m286$.Node.type** %param_ptr
br label %.if.end.3347
.if.false.3347:
br label %.if.end.3347
.if.end.3347:
%.tmp3356 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3357 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3356, i32 0, i32 1
%.tmp3358 = load %m0$.File.type*, %m0$.File.type** %.tmp3357
%.tmp3360 = getelementptr [13 x i8], [13 x i8]*@.str3359, i32 0, i32 0
%.tmp3361 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3362 = load %m1770$.Type.type*, %m1770$.Type.type** %param_type
%.tmp3363 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3361, %m1770$.Type.type* %.tmp3362)
%.tmp3364 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3365 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3364, i32 0, i32 1
%.tmp3366 = load i8*, i8** %.tmp3365
%.tmp3367 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3358, i8* %.tmp3360, i8* %.tmp3363, i8* %.tmp3366)
%.tmp3368 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3369 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3368, i32 0, i32 7
%.tmp3370 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3369
store %m286$.Node.type* %.tmp3370, %m286$.Node.type** %param_ptr
br label %.for.start.3323
.for.end.3323:
%.tmp3371 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3372 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3371, i32 0, i32 1
%.tmp3373 = load %m0$.File.type*, %m0$.File.type** %.tmp3372
%.tmp3375 = getelementptr [5 x i8], [5 x i8]*@.str3374, i32 0, i32 0
%.tmp3376 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3373, i8* %.tmp3375)
%.tmp3377 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
call void(%m1770$.CompilerCtx.type*) @m1770$push_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3377)
%.tmp3378 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3379 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_fn_params.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3378, %m286$.Node.type* %.tmp3379)
%.tmp3380 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3381 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3380, i32 0, i32 6
%.tmp3382 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3381
%.tmp3384 = getelementptr [6 x i8], [6 x i8]*@.str3383, i32 0, i32 0
%.tmp3385 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3382, i8* %.tmp3384)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3385, %m286$.Node.type** %fn_block
%.tmp3386 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3387 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3386, %m286$.Node.type* %.tmp3387)
%.tmp3388 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
call void(%m1770$.CompilerCtx.type*) @m1770$pop_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3388)
%.tmp3389 = bitcast ptr null to %m286$.Node.type*
%last_valid_instruction = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3389, %m286$.Node.type** %last_valid_instruction
%.tmp3391 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3392 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3391, i32 0, i32 6
%.tmp3393 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3392
%ci = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3393, %m286$.Node.type** %ci
br label %.for.start.3390
.for.start.3390:
%.tmp3394 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3395 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3394, i32 0, i32 7
%.tmp3396 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3395
%.tmp3397 = icmp ne %m286$.Node.type* %.tmp3396, null
br i1 %.tmp3397, label %.for.continue.3390, label %.for.end.3390
.for.continue.3390:
%.tmp3398 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3399 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3398, i32 0, i32 0
%.tmp3400 = load i8*, i8** %.tmp3399
%.tmp3402 = getelementptr [3 x i8], [3 x i8]*@.str3401, i32 0, i32 0
%.tmp3403 = call i32(i8*,i8*) @strcmp(i8* %.tmp3400, i8* %.tmp3402)
%.tmp3404 = icmp ne i32 %.tmp3403, 0
%.tmp3405 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3406 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3405, i32 0, i32 0
%.tmp3407 = load i8*, i8** %.tmp3406
%.tmp3409 = getelementptr [9 x i8], [9 x i8]*@.str3408, i32 0, i32 0
%.tmp3410 = call i32(i8*,i8*) @strcmp(i8* %.tmp3407, i8* %.tmp3409)
%.tmp3411 = icmp ne i32 %.tmp3410, 0
%.tmp3412 = and i1 %.tmp3404, %.tmp3411
br i1 %.tmp3412, label %.if.true.3413, label %.if.false.3413
.if.true.3413:
%.tmp3414 = load %m286$.Node.type*, %m286$.Node.type** %ci
store %m286$.Node.type* %.tmp3414, %m286$.Node.type** %last_valid_instruction
br label %.if.end.3413
.if.false.3413:
br label %.if.end.3413
.if.end.3413:
%.tmp3415 = load %m286$.Node.type*, %m286$.Node.type** %ci
%.tmp3416 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3415, i32 0, i32 7
%.tmp3417 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3416
store %m286$.Node.type* %.tmp3417, %m286$.Node.type** %ci
br label %.for.start.3390
.for.end.3390:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3418 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3419 = icmp eq %m286$.Node.type* %.tmp3418, null
br i1 %.tmp3419, label %.if.true.3420, label %.if.false.3420
.if.true.3420:
store i1 1, i1* %add_implicit_return
br label %.if.end.3420
.if.false.3420:
%.tmp3421 = load %m286$.Node.type*, %m286$.Node.type** %last_valid_instruction
%.tmp3422 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3421, i32 0, i32 6
%.tmp3423 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3422
%.tmp3424 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3423, i32 0, i32 0
%.tmp3425 = load i8*, i8** %.tmp3424
%.tmp3427 = getelementptr [7 x i8], [7 x i8]*@.str3426, i32 0, i32 0
%.tmp3428 = call i32(i8*,i8*) @strcmp(i8* %.tmp3425, i8* %.tmp3427)
%.tmp3429 = icmp ne i32 %.tmp3428, 0
br i1 %.tmp3429, label %.if.true.3430, label %.if.false.3430
.if.true.3430:
store i1 1, i1* %add_implicit_return
br label %.if.end.3430
.if.false.3430:
br label %.if.end.3430
.if.end.3430:
br label %.if.end.3420
.if.end.3420:
%.tmp3431 = load i1, i1* %add_implicit_return
br i1 %.tmp3431, label %.if.true.3432, label %.if.false.3432
.if.true.3432:
%.tmp3433 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3434 = load %m1770$.Type.type*, %m1770$.Type.type** %return_type
%.tmp3435 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3433, %m1770$.Type.type* %.tmp3434)
%.tmp3437 = getelementptr [5 x i8], [5 x i8]*@.str3436, i32 0, i32 0
%.tmp3438 = call i32(i8*,i8*) @strcmp(i8* %.tmp3435, i8* %.tmp3437)
%.tmp3439 = icmp ne i32 %.tmp3438, 0
br i1 %.tmp3439, label %.if.true.3440, label %.if.false.3440
.if.true.3440:
%.tmp3441 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3442 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3444 = getelementptr [21 x i8], [21 x i8]*@.str3443, i32 0, i32 0
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp3441, %m286$.Node.type* %.tmp3442, i8* %.tmp3444)
br label %.if.end.3440
.if.false.3440:
%.tmp3445 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3446 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3445, i32 0, i32 1
%.tmp3447 = load %m0$.File.type*, %m0$.File.type** %.tmp3446
%.tmp3449 = getelementptr [10 x i8], [10 x i8]*@.str3448, i32 0, i32 0
%.tmp3450 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3447, i8* %.tmp3449)
br label %.if.end.3440
.if.end.3440:
br label %.if.end.3432
.if.false.3432:
br label %.if.end.3432
.if.end.3432:
%.tmp3451 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3452 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3451, i32 0, i32 1
%.tmp3453 = load %m0$.File.type*, %m0$.File.type** %.tmp3452
%.tmp3455 = getelementptr [3 x i8], [3 x i8]*@.str3454, i32 0, i32 0
%.tmp3456 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3453, i8* %.tmp3455)
br label %.if.end.3297
.if.end.3297:
br label %.if.end.3269
.if.false.3269:
%.tmp3457 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3458 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3457, i32 0, i32 0
%.tmp3459 = load i8*, i8** %.tmp3458
%.tmp3461 = getelementptr [7 x i8], [7 x i8]*@.str3460, i32 0, i32 0
%.tmp3462 = call i32(i8*,i8*) @strcmp(i8* %.tmp3459, i8* %.tmp3461)
%.tmp3463 = icmp eq i32 %.tmp3462, 0
br i1 %.tmp3463, label %.if.true.3464, label %.if.false.3464
.if.true.3464:
%.tmp3465 = load i1, i1* %shallow
%.tmp3466 = icmp eq i1 %.tmp3465, 1
br i1 %.tmp3466, label %.if.true.3467, label %.if.false.3467
.if.true.3467:
%.tmp3468 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3469 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3468, i32 0, i32 6
%.tmp3470 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3469
%.tmp3471 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3470, i32 0, i32 7
%.tmp3472 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3471
%.tmp3473 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3472, i32 0, i32 1
%.tmp3474 = load i8*, i8** %.tmp3473
%mod_name = alloca i8*
store i8* %.tmp3474, i8** %mod_name
%.tmp3475 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3476 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3475, i32 0, i32 6
%.tmp3477 = load i8*, i8** %.tmp3476
%mod_abspath = alloca i8*
store i8* %.tmp3477, i8** %mod_abspath
%.tmp3478 = load i8*, i8** %mod_abspath
%.tmp3479 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3478)
%dirname = alloca i8*
store i8* %.tmp3479, i8** %dirname
%.tmp3480 = load i8*, i8** %mod_name
%.tmp3481 = call i32(i8*) @strlen(i8* %.tmp3480)
%mod_name_len = alloca i32
store i32 %.tmp3481, i32* %mod_name_len
%.tmp3482 = load i32, i32* %mod_name_len
%.tmp3483 = sub i32 %.tmp3482, 1
%.tmp3484 = call i8*(i32) @malloc(i32 %.tmp3483)
%trimmed_name = alloca i8*
store i8* %.tmp3484, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3485
.for.start.3485:
%.tmp3486 = load i32, i32* %i
%.tmp3487 = load i32, i32* %mod_name_len
%.tmp3488 = sub i32 %.tmp3487, 1
%.tmp3489 = icmp slt i32 %.tmp3486, %.tmp3488
br i1 %.tmp3489, label %.for.continue.3485, label %.for.end.3485
.for.continue.3485:
%.tmp3490 = load i32, i32* %i
%.tmp3491 = sub i32 %.tmp3490, 1
%.tmp3492 = load i8*, i8** %trimmed_name
%.tmp3493 = getelementptr i8, i8* %.tmp3492, i32 %.tmp3491
%.tmp3494 = load i32, i32* %i
%.tmp3495 = load i8*, i8** %mod_name
%.tmp3496 = getelementptr i8, i8* %.tmp3495, i32 %.tmp3494
%.tmp3497 = load i8, i8* %.tmp3496
store i8 %.tmp3497, i8* %.tmp3493
%.tmp3498 = load i32, i32* %i
%.tmp3499 = add i32 %.tmp3498, 1
store i32 %.tmp3499, i32* %i
br label %.for.start.3485
.for.end.3485:
%.tmp3500 = load i32, i32* %mod_name_len
%.tmp3501 = sub i32 %.tmp3500, 2
%.tmp3502 = load i8*, i8** %trimmed_name
%.tmp3503 = getelementptr i8, i8* %.tmp3502, i32 %.tmp3501
store i8 0, i8* %.tmp3503
%.tmp3504 = load i8*, i8** %dirname
%.tmp3506 = getelementptr [1 x i8], [1 x i8]*@.str3505, i32 0, i32 0
%.tmp3507 = call i32(i8*,i8*) @strcmp(i8* %.tmp3504, i8* %.tmp3506)
%.tmp3508 = icmp eq i32 %.tmp3507, 0
br i1 %.tmp3508, label %.if.true.3509, label %.if.false.3509
.if.true.3509:
%.tmp3510 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3512 = getelementptr [6 x i8], [6 x i8]*@.str3511, i32 0, i32 0
%.tmp3513 = load i8*, i8** %trimmed_name
%.tmp3514 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3510, i8* %.tmp3512, i8* %.tmp3513)
br label %.if.end.3509
.if.false.3509:
%.tmp3515 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3517 = getelementptr [9 x i8], [9 x i8]*@.str3516, i32 0, i32 0
%.tmp3518 = load i8*, i8** %dirname
%.tmp3519 = load i8*, i8** %trimmed_name
%.tmp3520 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3515, i8* %.tmp3517, i8* %.tmp3518, i8* %.tmp3519)
br label %.if.end.3509
.if.end.3509:
%.tmp3521 = load i8*, i8** %mod_abspath
%.tmp3522 = call i8*(i32) @malloc(i32 4096)
%.tmp3523 = call i8*(i8*,i8*) @realpath(i8* %.tmp3521, i8* %.tmp3522)
store i8* %.tmp3523, i8** %mod_abspath
%.tmp3524 = load i8*, i8** %mod_abspath
%.tmp3525 = icmp eq i8* %.tmp3524, null
br i1 %.tmp3525, label %.if.true.3526, label %.if.false.3526
.if.true.3526:
%.tmp3527 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3529 = getelementptr [60 x i8], [60 x i8]*@.str3528, i32 0, i32 0
%.tmp3530 = load i8*, i8** %mod_name
%.tmp3531 = load i8*, i8** %dirname
%.tmp3532 = load i8*, i8** %trimmed_name
%.tmp3533 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3527, i8* %.tmp3529, i8* %.tmp3530, i8* %.tmp3531, i8* %.tmp3532)
%.tmp3534 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3535 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3536 = load i8*, i8** %err_buf
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp3534, %m286$.Node.type* %.tmp3535, i8* %.tmp3536)
ret void
br label %.if.end.3526
.if.false.3526:
br label %.if.end.3526
.if.end.3526:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1770$.ModuleLookup.type*
%.tmp3537 = bitcast ptr null to %m1770$.ModuleLookup.type*
%mod = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp3537, %m1770$.ModuleLookup.type** %mod
%.tmp3539 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3540 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3539, i32 0, i32 5
%.tmp3541 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp3540
store %m1770$.ModuleLookup.type* %.tmp3541, %m1770$.ModuleLookup.type** %m
br label %.for.start.3538
.for.start.3538:
%.tmp3542 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp3543 = icmp ne %m1770$.ModuleLookup.type* %.tmp3542, null
%.tmp3544 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3545 = icmp eq %m1770$.ModuleLookup.type* %.tmp3544, null
%.tmp3546 = and i1 %.tmp3543, %.tmp3545
br i1 %.tmp3546, label %.for.continue.3538, label %.for.end.3538
.for.continue.3538:
%.tmp3547 = load i8*, i8** %mod_abspath
%.tmp3548 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp3549 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3548, i32 0, i32 0
%.tmp3550 = load i8*, i8** %.tmp3549
%.tmp3551 = call i32(i8*,i8*) @strcmp(i8* %.tmp3547, i8* %.tmp3550)
%.tmp3552 = icmp eq i32 %.tmp3551, 0
br i1 %.tmp3552, label %.if.true.3553, label %.if.false.3553
.if.true.3553:
%.tmp3554 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
store %m1770$.ModuleLookup.type* %.tmp3554, %m1770$.ModuleLookup.type** %mod
br label %.if.end.3553
.if.false.3553:
br label %.if.end.3553
.if.end.3553:
%.tmp3555 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp3556 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3555, i32 0, i32 2
%.tmp3557 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp3556
store %m1770$.ModuleLookup.type* %.tmp3557, %m1770$.ModuleLookup.type** %m
br label %.for.start.3538
.for.end.3538:
%.tmp3558 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3559 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3558, i32 0, i32 6
%.tmp3560 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3559
%.tmp3561 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3560, i32 0, i32 7
%.tmp3562 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3561
%.tmp3563 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3562, i32 0, i32 7
%.tmp3564 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3563
%.tmp3565 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3564, i32 0, i32 7
%.tmp3566 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3565
%.tmp3567 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3566, i32 0, i32 1
%.tmp3568 = load i8*, i8** %.tmp3567
%asname = alloca i8*
store i8* %.tmp3568, i8** %asname
%.tmp3569 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3570 = icmp eq %m1770$.ModuleLookup.type* %.tmp3569, null
br i1 %.tmp3570, label %.if.true.3571, label %.if.false.3571
.if.true.3571:
%.tmp3572 = load i32, i32* @ModuleLookup_size
%.tmp3573 = call i8*(i32) @malloc(i32 %.tmp3572)
%.tmp3574 = bitcast i8* %.tmp3573 to %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp3574, %m1770$.ModuleLookup.type** %mod
%.tmp3575 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3576 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3575, i32 0, i32 0
%.tmp3577 = load i8*, i8** %mod_abspath
store i8* %.tmp3577, i8** %.tmp3576
%.tmp3578 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3579 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3578, i32 0, i32 2
store %m1770$.ModuleLookup.type* null, %m1770$.ModuleLookup.type** %.tmp3579
%.tmp3580 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3581 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3580, i32 0, i32 3
store %m1770$.Scope.type* null, %m1770$.Scope.type** %.tmp3581
%.tmp3582 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3583 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3582, i32 0, i32 1
%.tmp3584 = getelementptr i8*, i8** %.tmp3583, i32 0
%.tmp3586 = getelementptr [5 x i8], [5 x i8]*@.str3585, i32 0, i32 0
%.tmp3587 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3588 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3587)
%.tmp3589 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3584, i8* %.tmp3586, i32 %.tmp3588)
%.tmp3591 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3592 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3591, i32 0, i32 5
%.tmp3593 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp3592
store %m1770$.ModuleLookup.type* %.tmp3593, %m1770$.ModuleLookup.type** %m
br label %.for.start.3590
.for.start.3590:
%.tmp3594 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp3595 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3594, i32 0, i32 2
%.tmp3596 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp3595
%.tmp3597 = icmp ne %m1770$.ModuleLookup.type* %.tmp3596, null
br i1 %.tmp3597, label %.for.continue.3590, label %.for.end.3590
.for.continue.3590:
%.tmp3598 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp3599 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3598, i32 0, i32 2
%.tmp3600 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %.tmp3599
store %m1770$.ModuleLookup.type* %.tmp3600, %m1770$.ModuleLookup.type** %m
br label %.for.start.3590
.for.end.3590:
%.tmp3601 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %m
%.tmp3602 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3601, i32 0, i32 2
%.tmp3603 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
store %m1770$.ModuleLookup.type* %.tmp3603, %m1770$.ModuleLookup.type** %.tmp3602
%.tmp3604 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3605 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3606 = load i8*, i8** %asname
%.tmp3607 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3608 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3607, i32 0, i32 0
%.tmp3609 = load i8*, i8** %.tmp3608
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1770$define_module.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1770$.CompilerCtx.type* %.tmp3604, %m286$.Node.type* %.tmp3605, i8* %.tmp3606, i8* %.tmp3609)
%.tmp3610 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3611 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3610, i32 0, i32 6
%.tmp3612 = load i8*, i8** %.tmp3611
%curr_mod = alloca i8*
store i8* %.tmp3612, i8** %curr_mod
%.tmp3613 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3614 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3613, i32 0, i32 6
%.tmp3615 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3616 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3615, i32 0, i32 0
%.tmp3617 = load i8*, i8** %.tmp3616
store i8* %.tmp3617, i8** %.tmp3614
%.tmp3618 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3619 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3620 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3619, i32 0, i32 0
%.tmp3621 = load i8*, i8** %.tmp3620
%.tmp3622 = call i1(%m1770$.CompilerCtx.type*,i8*) @m1770$compile_file.b.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.tmp3618, i8* %.tmp3621)
%.tmp3623 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3624 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3623, i32 0, i32 6
%.tmp3625 = load i8*, i8** %curr_mod
store i8* %.tmp3625, i8** %.tmp3624
br label %.if.end.3571
.if.false.3571:
%.tmp3626 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3627 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3628 = load i8*, i8** %asname
%.tmp3629 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp3630 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp3629, i32 0, i32 0
%.tmp3631 = load i8*, i8** %.tmp3630
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1770$define_module.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1770$.CompilerCtx.type* %.tmp3626, %m286$.Node.type* %.tmp3627, i8* %.tmp3628, i8* %.tmp3631)
br label %.if.end.3571
.if.end.3571:
br label %.if.end.3467
.if.false.3467:
br label %.if.end.3467
.if.end.3467:
br label %.if.end.3464
.if.false.3464:
%.tmp3632 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3633 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3635 = getelementptr [40 x i8], [40 x i8]*@.str3634, i32 0, i32 0
%.tmp3636 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp3632, %m286$.Node.type* %.tmp3633, i8* %.tmp3635)
%.tmp3637 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3638 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3637, i32 0, i32 0
%.tmp3639 = load i8*, i8** %.tmp3638
%.tmp3640 = call i32(i8*,...) @printf(i8* %.tmp3636, i8* %.tmp3639)
br label %.if.end.3464
.if.end.3464:
br label %.if.end.3269
.if.end.3269:
br label %.if.end.3135
.if.end.3135:
br label %.if.end.3042
.if.end.3042:
br label %.if.end.2980
.if.end.2980:
br label %.if.end.2972
.if.end.2972:
ret void
}
define i8* @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf = alloca i8*
%.tmp3641 = getelementptr i8*, i8** %buf, i32 0
%.tmp3643 = getelementptr [31 x i8], [31 x i8]*@.str3642, i32 0, i32 0
%.tmp3644 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3645 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3644, i32 0, i32 6
%.tmp3646 = load i8*, i8** %.tmp3645
%.tmp3647 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3648 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3647, i32 0, i32 3
%.tmp3649 = load i32, i32* %.tmp3648
%.tmp3650 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3651 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3650, i32 0, i32 4
%.tmp3652 = load i32, i32* %.tmp3651
%.tmp3653 = load i8*, i8** %msg
%.tmp3654 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3641, i8* %.tmp3643, i8* %.tmp3646, i32 %.tmp3649, i32 %.tmp3652, i8* %.tmp3653)
%.tmp3655 = load i8*, i8** %buf
ret i8* %.tmp3655
}
define void @m1770$compile_fn_params.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1770$.Type.type*
%.tmp3657 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3657, %m286$.Node.type** %param_ptr
br label %.for.start.3656
.for.start.3656:
%.tmp3658 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3659 = icmp ne %m286$.Node.type* %.tmp3658, null
br i1 %.tmp3659, label %.for.continue.3656, label %.for.end.3656
.for.continue.3656:
%.tmp3660 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3661 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3662 = icmp ne %m286$.Node.type* %.tmp3660, %.tmp3661
br i1 %.tmp3662, label %.if.true.3663, label %.if.false.3663
.if.true.3663:
%.tmp3664 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3665 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3664, i32 0, i32 7
%.tmp3666 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3665
store %m286$.Node.type* %.tmp3666, %m286$.Node.type** %param_ptr
br label %.if.end.3663
.if.false.3663:
br label %.if.end.3663
.if.end.3663:
%.tmp3667 = load %m286$.Node.type*, %m286$.Node.type** %fn_params
%.tmp3668 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3667)
%param_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3668, %m1770$.AssignableInfo.type** %param_info
%.tmp3669 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
%.tmp3670 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3669, i32 0, i32 2
%.tmp3672 = getelementptr [9 x i8], [9 x i8]*@.str3671, i32 0, i32 0
store i8* %.tmp3672, i8** %.tmp3670
%.tmp3673 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3674 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3673, i32 0, i32 0
%.tmp3675 = load i8*, i8** %.tmp3674
%.tmp3677 = getelementptr [5 x i8], [5 x i8]*@.str3676, i32 0, i32 0
%.tmp3678 = call i32(i8*,i8*) @strcmp(i8* %.tmp3675, i8* %.tmp3677)
%.tmp3679 = icmp eq i32 %.tmp3678, 0
br i1 %.tmp3679, label %.if.true.3680, label %.if.false.3680
.if.true.3680:
%.tmp3681 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3682 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3683 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3682, i32 0, i32 6
%.tmp3684 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3683
%.tmp3685 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3681, %m286$.Node.type* %.tmp3684)
store %m1770$.Type.type* %.tmp3685, %m1770$.Type.type** %param_type
%.tmp3686 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3687 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3686, i32 0, i32 7
%.tmp3688 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3687
store %m286$.Node.type* %.tmp3688, %m286$.Node.type** %param_ptr
br label %.if.end.3680
.if.false.3680:
br label %.if.end.3680
.if.end.3680:
%.tmp3689 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
%.tmp3690 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3689, i32 0, i32 3
%.tmp3691 = load %m1770$.Type.type*, %m1770$.Type.type** %param_type
store %m1770$.Type.type* %.tmp3691, %m1770$.Type.type** %.tmp3690
%.tmp3692 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3693 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3692, i32 0, i32 1
%.tmp3694 = load i8*, i8** %.tmp3693
%var_name = alloca i8*
store i8* %.tmp3694, i8** %var_name
%.tmp3695 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
%.tmp3696 = load i8, i8* @SCOPE_LOCAL
%.tmp3697 = load i8*, i8** %var_name
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp3695, i8 %.tmp3696, i8* %.tmp3697)
%.tmp3698 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3699 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
%.tmp3700 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3699, i32 0, i32 3
%.tmp3701 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3700
%.tmp3702 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3698, %m1770$.Type.type* %.tmp3701)
%param_info_tr = alloca i8*
store i8* %.tmp3702, i8** %param_info_tr
%.tmp3703 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3704 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3703, i32 0, i32 1
%.tmp3705 = load %m0$.File.type*, %m0$.File.type** %.tmp3704
%.tmp3707 = getelementptr [16 x i8], [16 x i8]*@.str3706, i32 0, i32 0
%.tmp3708 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
%.tmp3709 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3708)
%.tmp3710 = load i8*, i8** %param_info_tr
%.tmp3711 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3705, i8* %.tmp3707, i8* %.tmp3709, i8* %.tmp3710)
%.tmp3712 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3713 = load i8*, i8** %var_name
%.tmp3714 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3712, i8* %.tmp3713, %m1770$.AssignableInfo.type* %.tmp3714)
%.tmp3715 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3716 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3715, i32 0, i32 1
%.tmp3717 = load %m0$.File.type*, %m0$.File.type** %.tmp3716
%.tmp3719 = getelementptr [28 x i8], [28 x i8]*@.str3718, i32 0, i32 0
%.tmp3720 = load i8*, i8** %param_info_tr
%.tmp3721 = load i8*, i8** %var_name
%.tmp3722 = load i8*, i8** %param_info_tr
%.tmp3723 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %param_info
%.tmp3724 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3723)
%.tmp3725 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3717, i8* %.tmp3719, i8* %.tmp3720, i8* %.tmp3721, i8* %.tmp3722, i8* %.tmp3724)
%.tmp3726 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3727 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3726, i32 0, i32 7
%.tmp3728 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3727
store %m286$.Node.type* %.tmp3728, %m286$.Node.type** %param_ptr
br label %.for.start.3656
.for.end.3656:
ret void
}
define void @m1770$compile_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3729 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
call void(%m1770$.CompilerCtx.type*) @m1770$push_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3729)
%.tmp3731 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3732 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3731, i32 0, i32 6
%.tmp3733 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3732
%b = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3733, %m286$.Node.type** %b
br label %.for.start.3730
.for.start.3730:
%.tmp3734 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3735 = icmp ne %m286$.Node.type* %.tmp3734, null
br i1 %.tmp3735, label %.for.continue.3730, label %.for.end.3730
.for.continue.3730:
%.tmp3736 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3737 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3736, i32 0, i32 0
%.tmp3738 = load i8*, i8** %.tmp3737
%.tmp3740 = getelementptr [11 x i8], [11 x i8]*@.str3739, i32 0, i32 0
%.tmp3741 = call i32(i8*,i8*) @strcmp(i8* %.tmp3738, i8* %.tmp3740)
%.tmp3742 = icmp eq i32 %.tmp3741, 0
br i1 %.tmp3742, label %.if.true.3743, label %.if.false.3743
.if.true.3743:
%.tmp3744 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3745 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3746 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3745, i32 0, i32 6
%.tmp3747 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3746
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_expression.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3744, %m286$.Node.type* %.tmp3747)
br label %.if.end.3743
.if.false.3743:
br label %.if.end.3743
.if.end.3743:
%.tmp3748 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3749 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3748, i32 0, i32 7
%.tmp3750 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3749
store %m286$.Node.type* %.tmp3750, %m286$.Node.type** %b
br label %.for.start.3730
.for.end.3730:
%.tmp3751 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
call void(%m1770$.CompilerCtx.type*) @m1770$pop_scope.v.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3751)
ret void
}
define %m1770$.AssignableInfo.type* @m1770$compile_builtin.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3752 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3753 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3752, i32 0, i32 6
%.tmp3754 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3753
%.tmp3755 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3754, i32 0, i32 6
%.tmp3756 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3755
%dotted = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3756, %m286$.Node.type** %dotted
%.tmp3757 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3758 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3757, i32 0, i32 7
%.tmp3759 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3758
%.tmp3760 = icmp ne %m286$.Node.type* %.tmp3759, null
br i1 %.tmp3760, label %.if.true.3761, label %.if.false.3761
.if.true.3761:
%.tmp3762 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp3762
br label %.if.end.3761
.if.false.3761:
br label %.if.end.3761
.if.end.3761:
%.tmp3763 = load %m286$.Node.type*, %m286$.Node.type** %dotted
%.tmp3764 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3763, i32 0, i32 1
%.tmp3765 = load i8*, i8** %.tmp3764
%.tmp3767 = getelementptr [7 x i8], [7 x i8]*@.str3766, i32 0, i32 0
%.tmp3768 = call i32(i8*,i8*) @strcmp(i8* %.tmp3765, i8* %.tmp3767)
%.tmp3769 = icmp eq i32 %.tmp3768, 0
br i1 %.tmp3769, label %.if.true.3770, label %.if.false.3770
.if.true.3770:
%.tmp3771 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3773 = getelementptr [8 x i8], [8 x i8]*@.str3772, i32 0, i32 0
%.tmp3774 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3771, i8* %.tmp3773)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3774, %m286$.Node.type** %args
%.tmp3775 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3776 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3775, i32 0, i32 6
%.tmp3777 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3776
%.tmp3779 = getelementptr [11 x i8], [11 x i8]*@.str3778, i32 0, i32 0
%.tmp3780 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3777, i8* %.tmp3779)
%value = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3780, %m286$.Node.type** %value
%.tmp3781 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3782 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3781, i32 0, i32 6
%.tmp3783 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3782
%.tmp3784 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3783, i32 0, i32 6
%.tmp3785 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3784
%.tmp3786 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3785, i32 0, i32 6
%.tmp3787 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3786
%.tmp3788 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3787, i32 0, i32 6
%.tmp3789 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3788
store %m286$.Node.type* %.tmp3789, %m286$.Node.type** %value
%.tmp3790 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3791 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp3790)
%tmp_id = alloca i32
store i32 %.tmp3791, i32* %tmp_id
%.tmp3792 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3793 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3792)
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3793, %m1770$.AssignableInfo.type** %info
%.tmp3794 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3795 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3794, %m1770$.AssignableInfo.type* %.tmp3795)
%.tmp3796 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3797 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3796, i32 0, i32 3
%.tmp3798 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp3798, %m1770$.Type.type** %.tmp3797
%.tmp3799 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3800 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3799, i32 0, i32 3
%.tmp3801 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3800
%.tmp3802 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3801, i32 0, i32 0
%.tmp3804 = getelementptr [4 x i8], [4 x i8]*@.str3803, i32 0, i32 0
store i8* %.tmp3804, i8** %.tmp3802
%.tmp3805 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3806 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3807 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3805, %m286$.Node.type* %.tmp3806)
%inspected_type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp3807, %m1770$.Type.type** %inspected_type
%.tmp3808 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3809 = load %m1770$.Type.type*, %m1770$.Type.type** %inspected_type
%.tmp3810 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3808, %m1770$.Type.type* %.tmp3809)
%type_as_str = alloca i8*
store i8* %.tmp3810, i8** %type_as_str
%.tmp3811 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3812 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3811, i32 0, i32 1
%.tmp3813 = load %m0$.File.type*, %m0$.File.type** %.tmp3812
%.tmp3815 = getelementptr [46 x i8], [46 x i8]*@.str3814, i32 0, i32 0
%.tmp3816 = load i32, i32* %tmp_id
%.tmp3817 = load i8*, i8** %type_as_str
%.tmp3818 = load i8*, i8** %type_as_str
%.tmp3819 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3813, i8* %.tmp3815, i32 %.tmp3816, i8* %.tmp3817, i8* %.tmp3818)
%.tmp3820 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3821 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3820, i32 0, i32 1
%.tmp3822 = load %m0$.File.type*, %m0$.File.type** %.tmp3821
%.tmp3824 = getelementptr [35 x i8], [35 x i8]*@.str3823, i32 0, i32 0
%.tmp3825 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3826 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3825)
%.tmp3827 = load i8*, i8** %type_as_str
%.tmp3828 = load i32, i32* %tmp_id
%.tmp3829 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3822, i8* %.tmp3824, i8* %.tmp3826, i8* %.tmp3827, i32 %.tmp3828)
%.tmp3830 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp3830
br label %.if.end.3770
.if.false.3770:
br label %.if.end.3770
.if.end.3770:
%.tmp3831 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp3831
}
define %m1770$.AssignableInfo.type* @m1770$compile_fn_call.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3832 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3833 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3834 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_builtin.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3832, %m286$.Node.type* %.tmp3833)
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3834, %m1770$.AssignableInfo.type** %info
%.tmp3835 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3836 = icmp ne %m1770$.AssignableInfo.type* %.tmp3835, null
br i1 %.tmp3836, label %.if.true.3837, label %.if.false.3837
.if.true.3837:
%.tmp3838 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp3838
br label %.if.end.3837
.if.false.3837:
br label %.if.end.3837
.if.end.3837:
%.tmp3839 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3840 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3841 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_addr.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3839, %m286$.Node.type* %.tmp3840)
store %m1770$.AssignableInfo.type* %.tmp3841, %m1770$.AssignableInfo.type** %info
%.tmp3842 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3843 = icmp eq %m1770$.AssignableInfo.type* %.tmp3842, null
br i1 %.tmp3843, label %.if.true.3844, label %.if.false.3844
.if.true.3844:
%.tmp3845 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3845, label %.if.true.3846, label %.if.false.3846
.if.true.3846:
%.tmp3847 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3848 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3850 = getelementptr [35 x i8], [35 x i8]*@.str3849, i32 0, i32 0
%.tmp3851 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp3847, %m286$.Node.type* %.tmp3848, i8* %.tmp3850)
%.tmp3852 = call i32(i8*,...) @printf(i8* %.tmp3851)
br label %.if.end.3846
.if.false.3846:
br label %.if.end.3846
.if.end.3846:
%.tmp3853 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp3853
br label %.if.end.3844
.if.false.3844:
br label %.if.end.3844
.if.end.3844:
%.tmp3854 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3856 = getelementptr [8 x i8], [8 x i8]*@.str3855, i32 0, i32 0
%.tmp3857 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3854, i8* %.tmp3856)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3857, %m286$.Node.type** %args
%.tmp3859 = getelementptr [1 x i8], [1 x i8]*@.str3858, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3859, i8** %params_buff
%tmp = alloca i8*
%.tmp3860 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3861 = icmp ne %m286$.Node.type* %.tmp3860, null
br i1 %.tmp3861, label %.if.true.3862, label %.if.false.3862
.if.true.3862:
%.tmp3863 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3864 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3863, i32 0, i32 6
%.tmp3865 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3864
%.tmp3867 = getelementptr [11 x i8], [11 x i8]*@.str3866, i32 0, i32 0
%.tmp3868 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3865, i8* %.tmp3867)
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3868, %m286$.Node.type** %start
%.tmp3870 = load %m286$.Node.type*, %m286$.Node.type** %start
%pp = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3870, %m286$.Node.type** %pp
br label %.for.start.3869
.for.start.3869:
%.tmp3871 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3872 = icmp ne %m286$.Node.type* %.tmp3871, null
br i1 %.tmp3872, label %.for.continue.3869, label %.for.end.3869
.for.continue.3869:
%.tmp3873 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3874 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp3875 = icmp ne %m286$.Node.type* %.tmp3873, %.tmp3874
br i1 %.tmp3875, label %.if.true.3876, label %.if.false.3876
.if.true.3876:
%.tmp3877 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3879 = getelementptr [5 x i8], [5 x i8]*@.str3878, i32 0, i32 0
%.tmp3880 = load i8*, i8** %params_buff
%.tmp3881 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3877, i8* %.tmp3879, i8* %.tmp3880)
%.tmp3882 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3882, i8** %tmp_buff
%.tmp3883 = load i8*, i8** %tmp
store i8* %.tmp3883, i8** %params_buff
%.tmp3884 = load i8*, i8** %tmp_buff
store i8* %.tmp3884, i8** %tmp
%.tmp3885 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3885)
br label %.if.end.3876
.if.false.3876:
br label %.if.end.3876
.if.end.3876:
%.tmp3886 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3887 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3888 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3886, %m286$.Node.type* %.tmp3887)
%a_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3888, %m1770$.AssignableInfo.type** %a_info
%.tmp3889 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp3890 = icmp eq %m1770$.AssignableInfo.type* %.tmp3889, null
br i1 %.tmp3890, label %.if.true.3891, label %.if.false.3891
.if.true.3891:
%.tmp3892 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp3892
br label %.if.end.3891
.if.false.3891:
br label %.if.end.3891
.if.end.3891:
%.tmp3893 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3895 = getelementptr [8 x i8], [8 x i8]*@.str3894, i32 0, i32 0
%.tmp3896 = load i8*, i8** %params_buff
%.tmp3897 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3898 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp3899 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3898, i32 0, i32 3
%.tmp3900 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3899
%.tmp3901 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3897, %m1770$.Type.type* %.tmp3900)
%.tmp3902 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp3903 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3902)
%.tmp3904 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3893, i8* %.tmp3895, i8* %.tmp3896, i8* %.tmp3901, i8* %.tmp3903)
%.tmp3905 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3906 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3905, i32 0, i32 7
%.tmp3907 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3906
store %m286$.Node.type* %.tmp3907, %m286$.Node.type** %pp
%.tmp3908 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3910 = getelementptr [11 x i8], [11 x i8]*@.str3909, i32 0, i32 0
%.tmp3911 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3908, i8* %.tmp3910)
store %m286$.Node.type* %.tmp3911, %m286$.Node.type** %pp
br label %.for.start.3869
.for.end.3869:
br label %.if.end.3862
.if.false.3862:
br label %.if.end.3862
.if.end.3862:
%.tmp3912 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3913 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3914 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3913, i32 0, i32 3
%.tmp3915 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3914
%.tmp3916 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3915, i32 0, i32 3
%.tmp3917 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3916
%.tmp3918 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3912, %m1770$.Type.type* %.tmp3917)
%.tmp3920 = getelementptr [5 x i8], [5 x i8]*@.str3919, i32 0, i32 0
%.tmp3921 = call i32(i8*,i8*) @strcmp(i8* %.tmp3918, i8* %.tmp3920)
%.tmp3922 = icmp eq i32 %.tmp3921, 0
br i1 %.tmp3922, label %.if.true.3923, label %.if.false.3923
.if.true.3923:
%.tmp3924 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3925 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3924, i32 0, i32 1
%.tmp3926 = load %m0$.File.type*, %m0$.File.type** %.tmp3925
%.tmp3928 = getelementptr [16 x i8], [16 x i8]*@.str3927, i32 0, i32 0
%.tmp3929 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3930 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3931 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3930, i32 0, i32 3
%.tmp3932 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3931
%.tmp3933 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3929, %m1770$.Type.type* %.tmp3932)
%.tmp3934 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3935 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3934)
%.tmp3936 = load i8*, i8** %params_buff
%.tmp3937 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3926, i8* %.tmp3928, i8* %.tmp3933, i8* %.tmp3935, i8* %.tmp3936)
%.tmp3938 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp3938
br label %.if.end.3923
.if.false.3923:
br label %.if.end.3923
.if.end.3923:
%.tmp3939 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3940 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3939)
%call_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3940, %m1770$.AssignableInfo.type** %call_info
%.tmp3941 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3942 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %call_info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp3941, %m1770$.AssignableInfo.type* %.tmp3942)
%.tmp3943 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %call_info
%.tmp3944 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3943, i32 0, i32 3
%.tmp3945 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3946 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3945, i32 0, i32 3
%.tmp3947 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3946
%.tmp3948 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3947, i32 0, i32 3
%.tmp3949 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3948
%.tmp3950 = call %m1770$.Type.type*(%m1770$.Type.type*) @m1770$type_clone.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp3949)
store %m1770$.Type.type* %.tmp3950, %m1770$.Type.type** %.tmp3944
%.tmp3951 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %call_info
%.tmp3952 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3951, i32 0, i32 3
%.tmp3953 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3952
%.tmp3954 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp3953, i32 0, i32 4
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp3954
%.tmp3955 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3956 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp3955, i32 0, i32 1
%.tmp3957 = load %m0$.File.type*, %m0$.File.type** %.tmp3956
%.tmp3959 = getelementptr [21 x i8], [21 x i8]*@.str3958, i32 0, i32 0
%.tmp3960 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %call_info
%.tmp3961 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3960)
%.tmp3962 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3963 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3964 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp3963, i32 0, i32 3
%.tmp3965 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp3964
%.tmp3966 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp3962, %m1770$.Type.type* %.tmp3965)
%.tmp3967 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp3968 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp3967)
%.tmp3969 = load i8*, i8** %params_buff
%.tmp3970 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3957, i8* %.tmp3959, i8* %.tmp3961, i8* %.tmp3966, i8* %.tmp3968, i8* %.tmp3969)
%.tmp3971 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %call_info
%.tmp3972 = bitcast %m1770$.AssignableInfo.type* %.tmp3971 to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp3972
}
define void @m1770$compile_expression.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp3973 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3974 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3973, i32 0, i32 0
%.tmp3975 = load i8*, i8** %.tmp3974
%expr_type = alloca i8*
store i8* %.tmp3975, i8** %expr_type
%.tmp3976 = bitcast ptr null to %m1770$.AssignableInfo.type*
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3976, %m1770$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
%.tmp3977 = bitcast ptr null to %m1770$.AssignableInfo.type*
%a_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp3977, %m1770$.AssignableInfo.type** %a_info
%.tmp3978 = load i8*, i8** %expr_type
%.tmp3980 = getelementptr [7 x i8], [7 x i8]*@.str3979, i32 0, i32 0
%.tmp3981 = call i32(i8*,i8*) @strcmp(i8* %.tmp3978, i8* %.tmp3980)
%.tmp3982 = icmp eq i32 %.tmp3981, 0
br i1 %.tmp3982, label %.if.true.3983, label %.if.false.3983
.if.true.3983:
%.tmp3984 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3985 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3984, i32 0, i32 6
%.tmp3986 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3985
%.tmp3987 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3986, i32 0, i32 7
%.tmp3988 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3987
%.tmp3989 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3988, i32 0, i32 0
%.tmp3990 = load i8*, i8** %.tmp3989
%.tmp3992 = getelementptr [3 x i8], [3 x i8]*@.str3991, i32 0, i32 0
%.tmp3993 = call i32(i8*,i8*) @strcmp(i8* %.tmp3990, i8* %.tmp3992)
%.tmp3994 = icmp ne i32 %.tmp3993, 0
br i1 %.tmp3994, label %.if.true.3995, label %.if.false.3995
.if.true.3995:
%.tmp3996 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp3997 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3998 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3997, i32 0, i32 6
%.tmp3999 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3998
%.tmp4000 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3999, i32 0, i32 7
%.tmp4001 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4000
%.tmp4002 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp3996, %m286$.Node.type* %.tmp4001)
store %m1770$.AssignableInfo.type* %.tmp4002, %m1770$.AssignableInfo.type** %info
%.tmp4003 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4004 = icmp eq %m1770$.AssignableInfo.type* %.tmp4003, null
br i1 %.tmp4004, label %.if.true.4005, label %.if.false.4005
.if.true.4005:
ret void
br label %.if.end.4005
.if.false.4005:
br label %.if.end.4005
.if.end.4005:
%.tmp4006 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4007 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4006, i32 0, i32 1
%.tmp4008 = load %m0$.File.type*, %m0$.File.type** %.tmp4007
%.tmp4010 = getelementptr [11 x i8], [11 x i8]*@.str4009, i32 0, i32 0
%.tmp4011 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4012 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4013 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4012, i32 0, i32 3
%.tmp4014 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4013
%.tmp4015 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4011, %m1770$.Type.type* %.tmp4014)
%.tmp4016 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4017 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4016)
%.tmp4018 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4008, i8* %.tmp4010, i8* %.tmp4015, i8* %.tmp4017)
br label %.if.end.3995
.if.false.3995:
%.tmp4019 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4020 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4019, i32 0, i32 1
%.tmp4021 = load %m0$.File.type*, %m0$.File.type** %.tmp4020
%.tmp4023 = getelementptr [10 x i8], [10 x i8]*@.str4022, i32 0, i32 0
%.tmp4024 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4021, i8* %.tmp4023)
br label %.if.end.3995
.if.end.3995:
br label %.if.end.3983
.if.false.3983:
%.tmp4025 = load i8*, i8** %expr_type
%.tmp4027 = getelementptr [3 x i8], [3 x i8]*@.str4026, i32 0, i32 0
%.tmp4028 = call i32(i8*,i8*) @strcmp(i8* %.tmp4025, i8* %.tmp4027)
%.tmp4029 = icmp eq i32 %.tmp4028, 0
br i1 %.tmp4029, label %.if.true.4030, label %.if.false.4030
.if.true.4030:
br label %.if.end.4030
.if.false.4030:
%.tmp4031 = load i8*, i8** %expr_type
%.tmp4033 = getelementptr [8 x i8], [8 x i8]*@.str4032, i32 0, i32 0
%.tmp4034 = call i32(i8*,i8*) @strcmp(i8* %.tmp4031, i8* %.tmp4033)
%.tmp4035 = icmp eq i32 %.tmp4034, 0
br i1 %.tmp4035, label %.if.true.4036, label %.if.false.4036
.if.true.4036:
%.tmp4037 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4038 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4039 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4038, i32 0, i32 6
%.tmp4040 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4039
%.tmp4041 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_fn_call.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4037, %m286$.Node.type* %.tmp4040)
br label %.if.end.4036
.if.false.4036:
%.tmp4042 = load i8*, i8** %expr_type
%.tmp4044 = getelementptr [12 x i8], [12 x i8]*@.str4043, i32 0, i32 0
%.tmp4045 = call i32(i8*,i8*) @strcmp(i8* %.tmp4042, i8* %.tmp4044)
%.tmp4046 = icmp eq i32 %.tmp4045, 0
br i1 %.tmp4046, label %.if.true.4047, label %.if.false.4047
.if.true.4047:
%.tmp4048 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4049 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4050 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_declaration.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4048, %m286$.Node.type* %.tmp4049)
br label %.if.end.4047
.if.false.4047:
%.tmp4051 = load i8*, i8** %expr_type
%.tmp4053 = getelementptr [11 x i8], [11 x i8]*@.str4052, i32 0, i32 0
%.tmp4054 = call i32(i8*,i8*) @strcmp(i8* %.tmp4051, i8* %.tmp4053)
%.tmp4055 = icmp eq i32 %.tmp4054, 0
br i1 %.tmp4055, label %.if.true.4056, label %.if.false.4056
.if.true.4056:
%.tmp4057 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4058 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4057, i32 0, i32 6
%.tmp4059 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4058
%.tmp4061 = getelementptr [11 x i8], [11 x i8]*@.str4060, i32 0, i32 0
%.tmp4062 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4059, i8* %.tmp4061)
store %m286$.Node.type* %.tmp4062, %m286$.Node.type** %assignable
%.tmp4063 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4064 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4065 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4064, i32 0, i32 6
%.tmp4066 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4065
%.tmp4067 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_addr.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4063, %m286$.Node.type* %.tmp4066)
%dest = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4067, %m1770$.AssignableInfo.type** %dest
%.tmp4068 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %dest
%.tmp4069 = icmp eq %m1770$.AssignableInfo.type* %.tmp4068, null
br i1 %.tmp4069, label %.if.true.4070, label %.if.false.4070
.if.true.4070:
%.tmp4071 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4073 = getelementptr [34 x i8], [34 x i8]*@.str4072, i32 0, i32 0
%.tmp4074 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4075 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4074, i32 0, i32 6
%.tmp4076 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4075
%.tmp4077 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4076, i32 0, i32 6
%.tmp4078 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4077
%.tmp4079 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4078, i32 0, i32 6
%.tmp4080 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4079
%.tmp4081 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4080, i32 0, i32 1
%.tmp4082 = load i8*, i8** %.tmp4081
%.tmp4083 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4071, i8* %.tmp4073, i8* %.tmp4082)
%.tmp4084 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4085 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4086 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4084, %m286$.Node.type* %.tmp4085, i8* %.tmp4086)
ret void
br label %.if.end.4070
.if.false.4070:
br label %.if.end.4070
.if.end.4070:
%.tmp4087 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4088 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4089 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4087, %m286$.Node.type* %.tmp4088)
store %m1770$.AssignableInfo.type* %.tmp4089, %m1770$.AssignableInfo.type** %a_info
%.tmp4090 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4091 = icmp eq %m1770$.AssignableInfo.type* %.tmp4090, null
br i1 %.tmp4091, label %.if.true.4092, label %.if.false.4092
.if.true.4092:
ret void
br label %.if.end.4092
.if.false.4092:
br label %.if.end.4092
.if.end.4092:
%.tmp4093 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4094 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %dest
%.tmp4095 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4094, i32 0, i32 3
%.tmp4096 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4095
%.tmp4097 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4093, %m1770$.Type.type* %.tmp4096)
%dest_tr = alloca i8*
store i8* %.tmp4097, i8** %dest_tr
%.tmp4098 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4099 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4100 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4099, i32 0, i32 3
%.tmp4101 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4100
%.tmp4102 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4098, %m1770$.Type.type* %.tmp4101)
%src_tr = alloca i8*
store i8* %.tmp4102, i8** %src_tr
%.tmp4103 = load i8*, i8** %src_tr
%.tmp4105 = getelementptr [4 x i8], [4 x i8]*@.str4104, i32 0, i32 0
%.tmp4106 = call i32(i8*,i8*) @strcmp(i8* %.tmp4103, i8* %.tmp4105)
%.tmp4107 = icmp eq i32 %.tmp4106, 0
br i1 %.tmp4107, label %.if.true.4108, label %.if.false.4108
.if.true.4108:
%.tmp4109 = load i8*, i8** %dest_tr
store i8* %.tmp4109, i8** %src_tr
br label %.if.end.4108
.if.false.4108:
br label %.if.end.4108
.if.end.4108:
%.tmp4110 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4111 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4110, i32 0, i32 1
%.tmp4112 = load %m0$.File.type*, %m0$.File.type** %.tmp4111
%.tmp4114 = getelementptr [21 x i8], [21 x i8]*@.str4113, i32 0, i32 0
%.tmp4115 = load i8*, i8** %src_tr
%.tmp4116 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4117 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4116)
%.tmp4118 = load i8*, i8** %dest_tr
%.tmp4119 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %dest
%.tmp4120 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4119)
%.tmp4121 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4112, i8* %.tmp4114, i8* %.tmp4115, i8* %.tmp4117, i8* %.tmp4118, i8* %.tmp4120)
br label %.if.end.4056
.if.false.4056:
%.tmp4122 = load i8*, i8** %expr_type
%.tmp4124 = getelementptr [9 x i8], [9 x i8]*@.str4123, i32 0, i32 0
%.tmp4125 = call i32(i8*,i8*) @strcmp(i8* %.tmp4122, i8* %.tmp4124)
%.tmp4126 = icmp eq i32 %.tmp4125, 0
br i1 %.tmp4126, label %.if.true.4127, label %.if.false.4127
.if.true.4127:
%.tmp4128 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4129 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_if_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4128, %m286$.Node.type* %.tmp4129)
br label %.if.end.4127
.if.false.4127:
%.tmp4130 = load i8*, i8** %expr_type
%.tmp4132 = getelementptr [9 x i8], [9 x i8]*@.str4131, i32 0, i32 0
%.tmp4133 = call i32(i8*,i8*) @strcmp(i8* %.tmp4130, i8* %.tmp4132)
%.tmp4134 = icmp eq i32 %.tmp4133, 0
br i1 %.tmp4134, label %.if.true.4135, label %.if.false.4135
.if.true.4135:
%.tmp4136 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4137 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_for_loop.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4136, %m286$.Node.type* %.tmp4137)
br label %.if.end.4135
.if.false.4135:
%.tmp4138 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4139 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4141 = getelementptr [34 x i8], [34 x i8]*@.str4140, i32 0, i32 0
%.tmp4142 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4138, %m286$.Node.type* %.tmp4139, i8* %.tmp4141)
%.tmp4143 = load i8*, i8** %expr_type
%.tmp4144 = call i32(i8*,...) @printf(i8* %.tmp4142, i8* %.tmp4143)
br label %.if.end.4135
.if.end.4135:
br label %.if.end.4127
.if.end.4127:
br label %.if.end.4056
.if.end.4056:
br label %.if.end.4047
.if.end.4047:
br label %.if.end.4036
.if.end.4036:
br label %.if.end.4030
.if.end.4030:
br label %.if.end.3983
.if.end.3983:
ret void
}
define void @m1770$compile_for_loop.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4145 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4146 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp4145)
%for_id = alloca i32
store i32 %.tmp4146, i32* %for_id
%.tmp4147 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4148 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4147, i32 0, i32 6
%.tmp4149 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4148
%.tmp4150 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4149, i32 0, i32 7
%.tmp4151 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4150
%init_stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4151, %m286$.Node.type** %init_stmt
%.tmp4152 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4153 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4152, i32 0, i32 0
%.tmp4154 = load i8*, i8** %.tmp4153
%.tmp4156 = getelementptr [12 x i8], [12 x i8]*@.str4155, i32 0, i32 0
%.tmp4157 = call i32(i8*,i8*) @strcmp(i8* %.tmp4154, i8* %.tmp4156)
%.tmp4158 = icmp eq i32 %.tmp4157, 0
br i1 %.tmp4158, label %.if.true.4159, label %.if.false.4159
.if.true.4159:
%.tmp4160 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4161 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4162 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_declaration.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4160, %m286$.Node.type* %.tmp4161)
br label %.if.end.4159
.if.false.4159:
%.tmp4163 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4164 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4163, i32 0, i32 0
%.tmp4165 = load i8*, i8** %.tmp4164
%.tmp4167 = getelementptr [11 x i8], [11 x i8]*@.str4166, i32 0, i32 0
%.tmp4168 = call i32(i8*,i8*) @strcmp(i8* %.tmp4165, i8* %.tmp4167)
%.tmp4169 = icmp eq i32 %.tmp4168, 0
br i1 %.tmp4169, label %.if.true.4170, label %.if.false.4170
.if.true.4170:
%.tmp4171 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4172 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_expression.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4171, %m286$.Node.type* %.tmp4172)
br label %.if.end.4170
.if.false.4170:
%.tmp4173 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4174 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4173, i32 0, i32 0
%.tmp4175 = load i8*, i8** %.tmp4174
%.tmp4177 = getelementptr [9 x i8], [9 x i8]*@.str4176, i32 0, i32 0
%.tmp4178 = call i32(i8*,i8*) @strcmp(i8* %.tmp4175, i8* %.tmp4177)
%.tmp4179 = icmp eq i32 %.tmp4178, 0
br i1 %.tmp4179, label %.if.true.4180, label %.if.false.4180
.if.true.4180:
br label %.if.end.4180
.if.false.4180:
%.tmp4181 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4182 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4184 = getelementptr [66 x i8], [66 x i8]*@.str4183, i32 0, i32 0
%.tmp4185 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4181, %m286$.Node.type* %.tmp4182, i8* %.tmp4184)
%.tmp4186 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4187 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4186, i32 0, i32 0
%.tmp4188 = load i8*, i8** %.tmp4187
%.tmp4189 = call i32(i8*,...) @printf(i8* %.tmp4185, i8* %.tmp4188)
ret void
br label %.if.end.4180
.if.end.4180:
br label %.if.end.4170
.if.end.4170:
br label %.if.end.4159
.if.end.4159:
%.tmp4190 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4191 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4190, i32 0, i32 1
%.tmp4192 = load %m0$.File.type*, %m0$.File.type** %.tmp4191
%.tmp4194 = getelementptr [26 x i8], [26 x i8]*@.str4193, i32 0, i32 0
%.tmp4195 = load i32, i32* %for_id
%.tmp4196 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4192, i8* %.tmp4194, i32 %.tmp4195)
%.tmp4197 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4198 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4197, i32 0, i32 1
%.tmp4199 = load %m0$.File.type*, %m0$.File.type** %.tmp4198
%.tmp4201 = getelementptr [16 x i8], [16 x i8]*@.str4200, i32 0, i32 0
%.tmp4202 = load i32, i32* %for_id
%.tmp4203 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4199, i8* %.tmp4201, i32 %.tmp4202)
%.tmp4204 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4205 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4204, i32 0, i32 6
%.tmp4206 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4205
%.tmp4208 = getelementptr [9 x i8], [9 x i8]*@.str4207, i32 0, i32 0
%.tmp4209 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4206, i8* %.tmp4208)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4209, %m286$.Node.type** %fst_colon
%.tmp4210 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4211 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4210, i32 0, i32 7
%.tmp4212 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4211
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4212, %m286$.Node.type** %condition
%.tmp4213 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4214 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4215 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4213, %m286$.Node.type* %.tmp4214)
%condition_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4215, %m1770$.AssignableInfo.type** %condition_info
%.tmp4216 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4217 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4216, i32 0, i32 1
%.tmp4218 = load %m0$.File.type*, %m0$.File.type** %.tmp4217
%.tmp4220 = getelementptr [57 x i8], [57 x i8]*@.str4219, i32 0, i32 0
%.tmp4221 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4222 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %condition_info
%.tmp4223 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4222, i32 0, i32 3
%.tmp4224 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4223
%.tmp4225 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4221, %m1770$.Type.type* %.tmp4224)
%.tmp4226 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %condition_info
%.tmp4227 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4226)
%.tmp4228 = load i32, i32* %for_id
%.tmp4229 = load i32, i32* %for_id
%.tmp4230 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4218, i8* %.tmp4220, i8* %.tmp4225, i8* %.tmp4227, i32 %.tmp4228, i32 %.tmp4229)
%.tmp4231 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4232 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4231, i32 0, i32 1
%.tmp4233 = load %m0$.File.type*, %m0$.File.type** %.tmp4232
%.tmp4235 = getelementptr [19 x i8], [19 x i8]*@.str4234, i32 0, i32 0
%.tmp4236 = load i32, i32* %for_id
%.tmp4237 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4233, i8* %.tmp4235, i32 %.tmp4236)
%.tmp4238 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4239 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4238, i32 0, i32 7
%.tmp4240 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4239
%.tmp4242 = getelementptr [9 x i8], [9 x i8]*@.str4241, i32 0, i32 0
%.tmp4243 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4240, i8* %.tmp4242)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4243, %m286$.Node.type** %snd_colon
%.tmp4244 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4245 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4244, i32 0, i32 7
%.tmp4246 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4245
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4246, %m286$.Node.type** %increment
%.tmp4247 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4249 = getelementptr [6 x i8], [6 x i8]*@.str4248, i32 0, i32 0
%.tmp4250 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4247, i8* %.tmp4249)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4250, %m286$.Node.type** %for_body
%.tmp4251 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4252 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4251, %m286$.Node.type* %.tmp4252)
%.tmp4253 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4254 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4255 = icmp ne %m286$.Node.type* %.tmp4253, %.tmp4254
br i1 %.tmp4255, label %.if.true.4256, label %.if.false.4256
.if.true.4256:
%.tmp4257 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4258 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_expression.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4257, %m286$.Node.type* %.tmp4258)
br label %.if.end.4256
.if.false.4256:
br label %.if.end.4256
.if.end.4256:
%.tmp4259 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4260 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4259, i32 0, i32 1
%.tmp4261 = load %m0$.File.type*, %m0$.File.type** %.tmp4260
%.tmp4263 = getelementptr [26 x i8], [26 x i8]*@.str4262, i32 0, i32 0
%.tmp4264 = load i32, i32* %for_id
%.tmp4265 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4261, i8* %.tmp4263, i32 %.tmp4264)
%.tmp4266 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4267 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4266, i32 0, i32 1
%.tmp4268 = load %m0$.File.type*, %m0$.File.type** %.tmp4267
%.tmp4270 = getelementptr [14 x i8], [14 x i8]*@.str4269, i32 0, i32 0
%.tmp4271 = load i32, i32* %for_id
%.tmp4272 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4268, i8* %.tmp4270, i32 %.tmp4271)
ret void
}
define %m1770$.AssignableInfo.type* @m1770$compile_declaration.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4273 = bitcast ptr null to %m1770$.Type.type*
%decl_type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp4273, %m1770$.Type.type** %decl_type
%.tmp4274 = bitcast ptr null to %m1770$.AssignableInfo.type*
%a_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4274, %m1770$.AssignableInfo.type** %a_info
%.tmp4275 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4276 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4275, i32 0, i32 6
%.tmp4277 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4276
%.tmp4278 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4277, i32 0, i32 0
%.tmp4279 = load i8*, i8** %.tmp4278
%.tmp4281 = getelementptr [5 x i8], [5 x i8]*@.str4280, i32 0, i32 0
%.tmp4282 = call i32(i8*,i8*) @strcmp(i8* %.tmp4279, i8* %.tmp4281)
%.tmp4283 = icmp eq i32 %.tmp4282, 0
br i1 %.tmp4283, label %.if.true.4284, label %.if.false.4284
.if.true.4284:
%.tmp4285 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4286 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4287 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4286, i32 0, i32 6
%.tmp4288 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4287
%.tmp4289 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4288, i32 0, i32 6
%.tmp4290 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4289
%.tmp4291 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4285, %m286$.Node.type* %.tmp4290)
store %m1770$.Type.type* %.tmp4291, %m1770$.Type.type** %decl_type
br label %.if.end.4284
.if.false.4284:
br label %.if.end.4284
.if.end.4284:
%.tmp4292 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4293 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4292, i32 0, i32 6
%.tmp4294 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4293
%.tmp4296 = getelementptr [11 x i8], [11 x i8]*@.str4295, i32 0, i32 0
%.tmp4297 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4294, i8* %.tmp4296)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4297, %m286$.Node.type** %assignable
%.tmp4298 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4299 = icmp ne %m286$.Node.type* %.tmp4298, null
br i1 %.tmp4299, label %.if.true.4300, label %.if.false.4300
.if.true.4300:
%.tmp4301 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4302 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4303 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4301, %m286$.Node.type* %.tmp4302)
store %m1770$.AssignableInfo.type* %.tmp4303, %m1770$.AssignableInfo.type** %a_info
br label %.if.end.4300
.if.false.4300:
br label %.if.end.4300
.if.end.4300:
%.tmp4304 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4305 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4304)
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4305, %m1770$.AssignableInfo.type** %info
%.tmp4306 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4307 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4306, i32 0, i32 2
%.tmp4309 = getelementptr [9 x i8], [9 x i8]*@.str4308, i32 0, i32 0
store i8* %.tmp4309, i8** %.tmp4307
%.tmp4310 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4311 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4310, i32 0, i32 6
%.tmp4312 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4311
%.tmp4314 = getelementptr [5 x i8], [5 x i8]*@.str4313, i32 0, i32 0
%.tmp4315 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4312, i8* %.tmp4314)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4315, %m286$.Node.type** %var_name
%.tmp4316 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4317 = icmp eq %m286$.Node.type* %.tmp4316, null
br i1 %.tmp4317, label %.if.true.4318, label %.if.false.4318
.if.true.4318:
%.tmp4319 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4320 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4322 = getelementptr [31 x i8], [31 x i8]*@.str4321, i32 0, i32 0
%.tmp4323 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4319, %m286$.Node.type* %.tmp4320, i8* %.tmp4322)
%.tmp4324 = call i32(i8*,...) @printf(i8* %.tmp4323)
%.tmp4325 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4325
br label %.if.end.4318
.if.false.4318:
br label %.if.end.4318
.if.end.4318:
%.tmp4326 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4327 = load i8, i8* @SCOPE_LOCAL
%.tmp4328 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4329 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4328, i32 0, i32 1
%.tmp4330 = load i8*, i8** %.tmp4329
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp4326, i8 %.tmp4327, i8* %.tmp4330)
%.tmp4331 = load %m1770$.Type.type*, %m1770$.Type.type** %decl_type
%.tmp4332 = icmp ne %m1770$.Type.type* %.tmp4331, null
br i1 %.tmp4332, label %.if.true.4333, label %.if.false.4333
.if.true.4333:
%.tmp4334 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4335 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4334, i32 0, i32 3
%.tmp4336 = load %m1770$.Type.type*, %m1770$.Type.type** %decl_type
store %m1770$.Type.type* %.tmp4336, %m1770$.Type.type** %.tmp4335
br label %.if.end.4333
.if.false.4333:
%.tmp4337 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4338 = icmp ne %m1770$.AssignableInfo.type* %.tmp4337, null
br i1 %.tmp4338, label %.if.true.4339, label %.if.false.4339
.if.true.4339:
%.tmp4340 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4341 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4340, i32 0, i32 3
%.tmp4342 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4343 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4342, i32 0, i32 3
%.tmp4344 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4343
store %m1770$.Type.type* %.tmp4344, %m1770$.Type.type** %.tmp4341
br label %.if.end.4339
.if.false.4339:
br label %.if.end.4339
.if.end.4339:
br label %.if.end.4333
.if.end.4333:
%.tmp4345 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4346 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4347 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4346, i32 0, i32 3
%.tmp4348 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4347
%.tmp4349 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4345, %m1770$.Type.type* %.tmp4348)
%var_type_repr = alloca i8*
store i8* %.tmp4349, i8** %var_type_repr
%.tmp4350 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4351 = icmp ne %m1770$.AssignableInfo.type* %.tmp4350, null
br i1 %.tmp4351, label %.if.true.4352, label %.if.false.4352
.if.true.4352:
%.tmp4353 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4354 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4355 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4354, i32 0, i32 3
%.tmp4356 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4355
%.tmp4357 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4353, %m1770$.Type.type* %.tmp4356)
%a_type_repr = alloca i8*
store i8* %.tmp4357, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4358 = load i8*, i8** %a_type_repr
%.tmp4359 = call i32(i8*) @strlen(i8* %.tmp4358)
%.tmp4360 = load i8*, i8** %var_type_repr
%.tmp4361 = call i32(i8*) @strlen(i8* %.tmp4360)
%.tmp4362 = icmp ne i32 %.tmp4359, %.tmp4361
br i1 %.tmp4362, label %.if.true.4363, label %.if.false.4363
.if.true.4363:
store i1 1, i1* %type_error
br label %.if.end.4363
.if.false.4363:
%.tmp4364 = load i8*, i8** %a_type_repr
%.tmp4365 = load i8*, i8** %var_type_repr
%.tmp4366 = call i32(i8*,i8*) @strcmp(i8* %.tmp4364, i8* %.tmp4365)
%.tmp4367 = icmp ne i32 %.tmp4366, 0
br i1 %.tmp4367, label %.if.true.4368, label %.if.false.4368
.if.true.4368:
store i1 1, i1* %type_error
br label %.if.end.4368
.if.false.4368:
br label %.if.end.4368
.if.end.4368:
br label %.if.end.4363
.if.end.4363:
%.tmp4369 = load i1, i1* %type_error
br i1 %.tmp4369, label %.if.true.4370, label %.if.false.4370
.if.true.4370:
%.tmp4371 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4371, i8** %err_msg
%.tmp4372 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4374 = getelementptr [49 x i8], [49 x i8]*@.str4373, i32 0, i32 0
%.tmp4375 = load i8*, i8** %a_type_repr
%.tmp4376 = load i8*, i8** %var_type_repr
%.tmp4377 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4372, i8* %.tmp4374, i8* %.tmp4375, i8* %.tmp4376)
%.tmp4378 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4379 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4380 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4378, %m286$.Node.type* %.tmp4379, i8* %.tmp4380)
br label %.if.end.4370
.if.false.4370:
br label %.if.end.4370
.if.end.4370:
br label %.if.end.4352
.if.false.4352:
br label %.if.end.4352
.if.end.4352:
%.tmp4381 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4382 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4383 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4382, i32 0, i32 1
%.tmp4384 = load i8*, i8** %.tmp4383
%.tmp4385 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp4381, i8* %.tmp4384, %m1770$.AssignableInfo.type* %.tmp4385)
%.tmp4386 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4387 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4386, i32 0, i32 1
%.tmp4388 = load %m0$.File.type*, %m0$.File.type** %.tmp4387
%.tmp4390 = getelementptr [16 x i8], [16 x i8]*@.str4389, i32 0, i32 0
%.tmp4391 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4392 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4391)
%.tmp4393 = load i8*, i8** %var_type_repr
%.tmp4394 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4388, i8* %.tmp4390, i8* %.tmp4392, i8* %.tmp4393)
%.tmp4395 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4396 = icmp ne %m1770$.AssignableInfo.type* %.tmp4395, null
br i1 %.tmp4396, label %.if.true.4397, label %.if.false.4397
.if.true.4397:
%.tmp4398 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4399 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4398, i32 0, i32 1
%.tmp4400 = load %m0$.File.type*, %m0$.File.type** %.tmp4399
%.tmp4402 = getelementptr [21 x i8], [21 x i8]*@.str4401, i32 0, i32 0
%.tmp4403 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4404 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4405 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4404, i32 0, i32 3
%.tmp4406 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4405
%.tmp4407 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4403, %m1770$.Type.type* %.tmp4406)
%.tmp4408 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4409 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4408)
%.tmp4410 = load i8*, i8** %var_type_repr
%.tmp4411 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4412 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4411)
%.tmp4413 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4400, i8* %.tmp4402, i8* %.tmp4407, i8* %.tmp4409, i8* %.tmp4410, i8* %.tmp4412)
br label %.if.end.4397
.if.false.4397:
br label %.if.end.4397
.if.end.4397:
%.tmp4414 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp4414
}
define void @m1770$compile_if_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4415 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4416 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4415, i32 0, i32 6
%.tmp4417 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4416
%.tmp4419 = getelementptr [11 x i8], [11 x i8]*@.str4418, i32 0, i32 0
%.tmp4420 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4417, i8* %.tmp4419)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4420, %m286$.Node.type** %assignable
%.tmp4421 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4422 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4423 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4421, %m286$.Node.type* %.tmp4422)
%a_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4423, %m1770$.AssignableInfo.type** %a_info
%.tmp4424 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4425 = icmp eq %m1770$.AssignableInfo.type* %.tmp4424, null
br i1 %.tmp4425, label %.if.true.4426, label %.if.false.4426
.if.true.4426:
ret void
br label %.if.end.4426
.if.false.4426:
br label %.if.end.4426
.if.end.4426:
%.tmp4427 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4428 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp4427)
%if_id = alloca i32
store i32 %.tmp4428, i32* %if_id
%.tmp4429 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4430 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4429, i32 0, i32 1
%.tmp4431 = load %m0$.File.type*, %m0$.File.type** %.tmp4430
%.tmp4433 = getelementptr [53 x i8], [53 x i8]*@.str4432, i32 0, i32 0
%.tmp4434 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4435 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4436 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4435, i32 0, i32 3
%.tmp4437 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4436
%.tmp4438 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4434, %m1770$.Type.type* %.tmp4437)
%.tmp4439 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %a_info
%.tmp4440 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4439)
%.tmp4441 = load i32, i32* %if_id
%.tmp4442 = load i32, i32* %if_id
%.tmp4443 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4431, i8* %.tmp4433, i8* %.tmp4438, i8* %.tmp4440, i32 %.tmp4441, i32 %.tmp4442)
%.tmp4444 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4445 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4444, i32 0, i32 1
%.tmp4446 = load %m0$.File.type*, %m0$.File.type** %.tmp4445
%.tmp4448 = getelementptr [14 x i8], [14 x i8]*@.str4447, i32 0, i32 0
%.tmp4449 = load i32, i32* %if_id
%.tmp4450 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4446, i8* %.tmp4448, i32 %.tmp4449)
%.tmp4451 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4452 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4451, i32 0, i32 6
%.tmp4453 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4452
%.tmp4455 = getelementptr [6 x i8], [6 x i8]*@.str4454, i32 0, i32 0
%.tmp4456 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4453, i8* %.tmp4455)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4456, %m286$.Node.type** %block
%.tmp4457 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4458 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4457, %m286$.Node.type* %.tmp4458)
%.tmp4459 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4460 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4459, i32 0, i32 1
%.tmp4461 = load %m0$.File.type*, %m0$.File.type** %.tmp4460
%.tmp4463 = getelementptr [23 x i8], [23 x i8]*@.str4462, i32 0, i32 0
%.tmp4464 = load i32, i32* %if_id
%.tmp4465 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4461, i8* %.tmp4463, i32 %.tmp4464)
%.tmp4466 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4467 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4466, i32 0, i32 1
%.tmp4468 = load %m0$.File.type*, %m0$.File.type** %.tmp4467
%.tmp4470 = getelementptr [15 x i8], [15 x i8]*@.str4469, i32 0, i32 0
%.tmp4471 = load i32, i32* %if_id
%.tmp4472 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4468, i8* %.tmp4470, i32 %.tmp4471)
%.tmp4473 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4474 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4473, i32 0, i32 6
%.tmp4475 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4474
%.tmp4477 = getelementptr [11 x i8], [11 x i8]*@.str4476, i32 0, i32 0
%.tmp4478 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4475, i8* %.tmp4477)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4478, %m286$.Node.type** %else_block
%.tmp4479 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4480 = icmp ne %m286$.Node.type* %.tmp4479, null
br i1 %.tmp4480, label %.if.true.4481, label %.if.false.4481
.if.true.4481:
%.tmp4482 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4483 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4482, i32 0, i32 6
%.tmp4484 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4483
%.tmp4485 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4484, i32 0, i32 0
%.tmp4486 = load i8*, i8** %.tmp4485
%.tmp4488 = getelementptr [11 x i8], [11 x i8]*@.str4487, i32 0, i32 0
%.tmp4489 = call i32(i8*,i8*) @strcmp(i8* %.tmp4486, i8* %.tmp4488)
%.tmp4490 = icmp eq i32 %.tmp4489, 0
br i1 %.tmp4490, label %.if.true.4491, label %.if.false.4491
.if.true.4491:
%.tmp4492 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4493 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4492, i32 0, i32 6
%.tmp4494 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4493
%.tmp4495 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4494, i32 0, i32 6
%.tmp4496 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4495
%.tmp4498 = getelementptr [6 x i8], [6 x i8]*@.str4497, i32 0, i32 0
%.tmp4499 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4496, i8* %.tmp4498)
store %m286$.Node.type* %.tmp4499, %m286$.Node.type** %block
%.tmp4500 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4501 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4500, %m286$.Node.type* %.tmp4501)
br label %.if.end.4491
.if.false.4491:
%.tmp4502 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4503 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_if_block.v.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4502, %m286$.Node.type* %.tmp4503)
br label %.if.end.4491
.if.end.4491:
br label %.if.end.4481
.if.false.4481:
br label %.if.end.4481
.if.end.4481:
%.tmp4504 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4505 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4504, i32 0, i32 1
%.tmp4506 = load %m0$.File.type*, %m0$.File.type** %.tmp4505
%.tmp4508 = getelementptr [23 x i8], [23 x i8]*@.str4507, i32 0, i32 0
%.tmp4509 = load i32, i32* %if_id
%.tmp4510 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4506, i8* %.tmp4508, i32 %.tmp4509)
%.tmp4511 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4512 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4511, i32 0, i32 1
%.tmp4513 = load %m0$.File.type*, %m0$.File.type** %.tmp4512
%.tmp4515 = getelementptr [13 x i8], [13 x i8]*@.str4514, i32 0, i32 0
%.tmp4516 = load i32, i32* %if_id
%.tmp4517 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4513, i8* %.tmp4515, i32 %.tmp4516)
ret void
}
define void @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4518 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4519 = icmp ne %m286$.Node.type* %.tmp4518, null
br i1 %.tmp4519, label %.if.true.4520, label %.if.false.4520
.if.true.4520:
%.tmp4521 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4522 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4521, i32 0, i32 6
%.tmp4523 = load i8*, i8** %.tmp4522
%.tmp4524 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4525 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4524, i32 0, i32 3
%.tmp4526 = load i32, i32* %.tmp4525
%.tmp4527 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4528 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4527, i32 0, i32 4
%.tmp4529 = load i32, i32* %.tmp4528
%.tmp4530 = load i8*, i8** %msg
%.tmp4531 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp4523, i32 %.tmp4526, i32 %.tmp4529, i8* %.tmp4530)
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp4531, %m717$.Error.type** %err
%.tmp4532 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4533 = load %m717$.Error.type*, %m717$.Error.type** %err
call void(%m1770$.CompilerCtx.type*,%m717$.Error.type*) @m1770$append_error.v.m1770$.CompilerCtx.typep.m717$.Error.typep(%m1770$.CompilerCtx.type* %.tmp4532, %m717$.Error.type* %.tmp4533)
br label %.if.end.4520
.if.false.4520:
%.tmp4535 = getelementptr [61 x i8], [61 x i8]*@.str4534, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4535)
br label %.if.end.4520
.if.end.4520:
ret void
}
define void @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1770$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.info.arg, %m1770$.AssignableInfo.type** %info
%.tmp4536 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4537 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*) @m1770$get_current_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp4536)
%mod = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp4537, %m1770$.ModuleLookup.type** %mod
%.tmp4538 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp4539 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp4538, i32 0, i32 3
%.tmp4540 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp4539
%.tmp4541 = icmp ne %m1770$.Scope.type* %.tmp4540, null
%.tmp4543 = getelementptr [82 x i8], [82 x i8]*@.str4542, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4541, i8* %.tmp4543)
%.tmp4544 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp4545 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp4544, i32 0, i32 3
%.tmp4546 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp4545
%current_scope = alloca %m1770$.Scope.type*
store %m1770$.Scope.type* %.tmp4546, %m1770$.Scope.type** %current_scope
%.tmp4547 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* null, i32 1
%.tmp4548 = ptrtoint %m1770$.ScopeItem.type* %.tmp4547 to i32
%.tmp4549 = call i8*(i32) @malloc(i32 %.tmp4548)
%.tmp4550 = bitcast i8* %.tmp4549 to %m1770$.ScopeItem.type*
%newitem = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp4550, %m1770$.ScopeItem.type** %newitem
%.tmp4551 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %newitem
%.tmp4552 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4551, i32 0, i32 0
%.tmp4553 = load i8*, i8** %name
store i8* %.tmp4553, i8** %.tmp4552
%.tmp4554 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %newitem
%.tmp4555 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4554, i32 0, i32 1
%.tmp4556 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
store %m1770$.AssignableInfo.type* %.tmp4556, %m1770$.AssignableInfo.type** %.tmp4555
%.tmp4557 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %newitem
%.tmp4558 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4557, i32 0, i32 2
store %m1770$.ScopeItem.type* null, %m1770$.ScopeItem.type** %.tmp4558
%.tmp4559 = load %m1770$.Scope.type*, %m1770$.Scope.type** %current_scope
%.tmp4560 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp4559, i32 0, i32 1
%.tmp4561 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %.tmp4560
%.tmp4562 = icmp eq %m1770$.ScopeItem.type* %.tmp4561, null
br i1 %.tmp4562, label %.if.true.4563, label %.if.false.4563
.if.true.4563:
%.tmp4564 = load %m1770$.Scope.type*, %m1770$.Scope.type** %current_scope
%.tmp4565 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp4564, i32 0, i32 1
%.tmp4566 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %newitem
store %m1770$.ScopeItem.type* %.tmp4566, %m1770$.ScopeItem.type** %.tmp4565
ret void
br label %.if.end.4563
.if.false.4563:
br label %.if.end.4563
.if.end.4563:
%.tmp4567 = load %m1770$.Scope.type*, %m1770$.Scope.type** %current_scope
%.tmp4568 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp4567, i32 0, i32 1
%.tmp4569 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %.tmp4568
%last_item = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp4569, %m1770$.ScopeItem.type** %last_item
br label %.for.start.4570
.for.start.4570:
%.tmp4571 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %last_item
%.tmp4572 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4571, i32 0, i32 2
%.tmp4573 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %.tmp4572
%.tmp4574 = icmp ne %m1770$.ScopeItem.type* %.tmp4573, null
br i1 %.tmp4574, label %.for.continue.4570, label %.for.end.4570
.for.continue.4570:
%.tmp4575 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %last_item
%.tmp4576 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4575, i32 0, i32 2
%.tmp4577 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %.tmp4576
store %m1770$.ScopeItem.type* %.tmp4577, %m1770$.ScopeItem.type** %last_item
br label %.for.start.4570
.for.end.4570:
%.tmp4578 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %last_item
%.tmp4579 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4578, i32 0, i32 2
%.tmp4580 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %newitem
store %m1770$.ScopeItem.type* %.tmp4580, %m1770$.ScopeItem.type** %.tmp4579
ret void
}
define %m1770$.ScopeItem.type* @m1770$find_defined_in.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%err_buf = alloca i8*
%.tmp4581 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4582 = load i8*, i8** %module
%.tmp4583 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4584 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4583, i32 0, i32 1
%.tmp4585 = load i8*, i8** %.tmp4584
%.tmp4586 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,i8*,i8*) @m1770$find_defined_str.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.cp(%m1770$.CompilerCtx.type* %.tmp4581, i8* %.tmp4582, i8* %.tmp4585)
%found = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp4586, %m1770$.ScopeItem.type** %found
%.tmp4587 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %found
%.tmp4588 = icmp eq %m1770$.ScopeItem.type* %.tmp4587, null
br i1 %.tmp4588, label %.if.true.4589, label %.if.false.4589
.if.true.4589:
%.tmp4590 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4592 = getelementptr [31 x i8], [31 x i8]*@.str4591, i32 0, i32 0
%.tmp4593 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4594 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4593, i32 0, i32 1
%.tmp4595 = load i8*, i8** %.tmp4594
%.tmp4596 = load i8*, i8** %module
%.tmp4597 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4590, i8* %.tmp4592, i8* %.tmp4595, i8* %.tmp4596)
%.tmp4598 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4599 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4600 = load i8*, i8** %err_buf
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4598, %m286$.Node.type* %.tmp4599, i8* %.tmp4600)
%.tmp4601 = bitcast ptr null to %m1770$.ScopeItem.type*
ret %m1770$.ScopeItem.type* %.tmp4601
br label %.if.end.4589
.if.false.4589:
br label %.if.end.4589
.if.end.4589:
br label %.for.start.4602
.for.start.4602:
%.tmp4603 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4604 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4603, i32 0, i32 7
%.tmp4605 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4604
%.tmp4606 = icmp ne %m286$.Node.type* %.tmp4605, null
%.tmp4607 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %found
%.tmp4608 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4607, i32 0, i32 1
%.tmp4609 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp4608
%.tmp4610 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4609, i32 0, i32 2
%.tmp4611 = load i8*, i8** %.tmp4610
%.tmp4613 = getelementptr [7 x i8], [7 x i8]*@.str4612, i32 0, i32 0
%.tmp4614 = call i32(i8*,i8*) @strcmp(i8* %.tmp4611, i8* %.tmp4613)
%.tmp4615 = icmp eq i32 %.tmp4614, 0
%.tmp4616 = and i1 %.tmp4606, %.tmp4615
br i1 %.tmp4616, label %.for.continue.4602, label %.for.end.4602
.for.continue.4602:
%.tmp4617 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4618 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %found
%.tmp4619 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4618, i32 0, i32 1
%.tmp4620 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp4619
%.tmp4621 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4620, i32 0, i32 0
%.tmp4622 = load i8*, i8** %.tmp4621
%.tmp4623 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4624 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4623, i32 0, i32 7
%.tmp4625 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4624
%.tmp4626 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4625, i32 0, i32 7
%.tmp4627 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4626
%.tmp4628 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1770$find_defined_in.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4617, i8* %.tmp4622, %m286$.Node.type* %.tmp4627)
store %m1770$.ScopeItem.type* %.tmp4628, %m1770$.ScopeItem.type** %found
%.tmp4629 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %found
%.tmp4630 = icmp eq %m1770$.ScopeItem.type* %.tmp4629, null
br i1 %.tmp4630, label %.if.true.4631, label %.if.false.4631
.if.true.4631:
%.tmp4632 = bitcast ptr null to %m1770$.ScopeItem.type*
ret %m1770$.ScopeItem.type* %.tmp4632
br label %.if.end.4631
.if.false.4631:
br label %.if.end.4631
.if.end.4631:
br label %.for.start.4602
.for.end.4602:
%.tmp4633 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %found
ret %m1770$.ScopeItem.type* %.tmp4633
}
define %m1770$.ScopeItem.type* @m1770$find_defined_str.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.cp(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4634 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4635 = load i8*, i8** %module
%.tmp4636 = call %m1770$.ModuleLookup.type*(%m1770$.CompilerCtx.type*,i8*) @m1770$get_module.m1770$.ModuleLookup.typep.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.tmp4634, i8* %.tmp4635)
%mod = alloca %m1770$.ModuleLookup.type*
store %m1770$.ModuleLookup.type* %.tmp4636, %m1770$.ModuleLookup.type** %mod
%.tmp4637 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp4638 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp4637, i32 0, i32 3
%.tmp4639 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp4638
%.tmp4640 = icmp ne %m1770$.Scope.type* %.tmp4639, null
%.tmp4642 = getelementptr [77 x i8], [77 x i8]*@.str4641, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4640, i8* %.tmp4642)
%.tmp4644 = load %m1770$.ModuleLookup.type*, %m1770$.ModuleLookup.type** %mod
%.tmp4645 = getelementptr %m1770$.ModuleLookup.type, %m1770$.ModuleLookup.type* %.tmp4644, i32 0, i32 3
%.tmp4646 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp4645
%s = alloca %m1770$.Scope.type*
store %m1770$.Scope.type* %.tmp4646, %m1770$.Scope.type** %s
br label %.for.start.4643
.for.start.4643:
%.tmp4647 = load %m1770$.Scope.type*, %m1770$.Scope.type** %s
%.tmp4648 = icmp ne %m1770$.Scope.type* %.tmp4647, null
br i1 %.tmp4648, label %.for.continue.4643, label %.for.end.4643
.for.continue.4643:
%.tmp4650 = load %m1770$.Scope.type*, %m1770$.Scope.type** %s
%.tmp4651 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp4650, i32 0, i32 1
%.tmp4652 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %.tmp4651
%item = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp4652, %m1770$.ScopeItem.type** %item
br label %.for.start.4649
.for.start.4649:
%.tmp4653 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %item
%.tmp4654 = icmp ne %m1770$.ScopeItem.type* %.tmp4653, null
br i1 %.tmp4654, label %.for.continue.4649, label %.for.end.4649
.for.continue.4649:
%.tmp4655 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %item
%.tmp4656 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4655, i32 0, i32 0
%.tmp4657 = load i8*, i8** %.tmp4656
%.tmp4658 = load i8*, i8** %assignable_name
%.tmp4659 = call i32(i8*,i8*) @strcmp(i8* %.tmp4657, i8* %.tmp4658)
%.tmp4660 = icmp eq i32 %.tmp4659, 0
br i1 %.tmp4660, label %.if.true.4661, label %.if.false.4661
.if.true.4661:
%.tmp4662 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %item
ret %m1770$.ScopeItem.type* %.tmp4662
br label %.if.end.4661
.if.false.4661:
br label %.if.end.4661
.if.end.4661:
%.tmp4663 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %item
%.tmp4664 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4663, i32 0, i32 2
%.tmp4665 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %.tmp4664
store %m1770$.ScopeItem.type* %.tmp4665, %m1770$.ScopeItem.type** %item
br label %.for.start.4649
.for.end.4649:
%.tmp4666 = load %m1770$.Scope.type*, %m1770$.Scope.type** %s
%.tmp4667 = getelementptr %m1770$.Scope.type, %m1770$.Scope.type* %.tmp4666, i32 0, i32 2
%.tmp4668 = load %m1770$.Scope.type*, %m1770$.Scope.type** %.tmp4667
store %m1770$.Scope.type* %.tmp4668, %m1770$.Scope.type** %s
br label %.for.start.4643
.for.end.4643:
%.tmp4669 = bitcast ptr null to %m1770$.ScopeItem.type*
ret %m1770$.ScopeItem.type* %.tmp4669
}
define %m1770$.ScopeItem.type* @m1770$find_defined.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp4670 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4671 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4672 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4671, i32 0, i32 6
%.tmp4673 = load i8*, i8** %.tmp4672
%.tmp4674 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4675 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4674, i32 0, i32 6
%.tmp4676 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4675
%.tmp4677 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1770$find_defined_in.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp4670, i8* %.tmp4673, %m286$.Node.type* %.tmp4676)
ret %m1770$.ScopeItem.type* %.tmp4677
}
define %m1770$.AssignableInfo.type* @m1770$get_dotted_name.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dot_name_ptr.arg, %m1770$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.dot_name_ptr.arg, %m286$.Node.type** %dot_name_ptr
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.info.arg, %m1770$.AssignableInfo.type** %info
%err_msg = alloca i8*
%buf = alloca i8*
%.tmp4678 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4679 = icmp eq %m1770$.AssignableInfo.type* %.tmp4678, null
br i1 %.tmp4679, label %.if.true.4680, label %.if.false.4680
.if.true.4680:
%.tmp4681 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4682 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4684 = getelementptr [54 x i8], [54 x i8]*@.str4683, i32 0, i32 0
%.tmp4685 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4681, %m286$.Node.type* %.tmp4682, i8* %.tmp4684)
%.tmp4686 = call i32(i8*,...) @printf(i8* %.tmp4685)
%.tmp4687 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4687
br label %.if.end.4680
.if.false.4680:
br label %.if.end.4680
.if.end.4680:
%.tmp4688 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4689 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4688, i32 0, i32 2
%.tmp4690 = load i8*, i8** %.tmp4689
%.tmp4692 = getelementptr [9 x i8], [9 x i8]*@.str4691, i32 0, i32 0
%.tmp4693 = call i32(i8*,i8*) @strcmp(i8* %.tmp4690, i8* %.tmp4692)
%.tmp4694 = icmp eq i32 %.tmp4693, 0
%.tmp4695 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4696 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4695, i32 0, i32 2
%.tmp4697 = load i8*, i8** %.tmp4696
%.tmp4699 = getelementptr [7 x i8], [7 x i8]*@.str4698, i32 0, i32 0
%.tmp4700 = call i32(i8*,i8*) @strcmp(i8* %.tmp4697, i8* %.tmp4699)
%.tmp4701 = icmp eq i32 %.tmp4700, 0
%.tmp4702 = or i1 %.tmp4694, %.tmp4701
br i1 %.tmp4702, label %.if.true.4703, label %.if.false.4703
.if.true.4703:
%.tmp4704 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4705 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4704, i32 0, i32 7
%.tmp4706 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4705
%.tmp4707 = icmp ne %m286$.Node.type* %.tmp4706, null
br i1 %.tmp4707, label %.if.true.4708, label %.if.false.4708
.if.true.4708:
%.tmp4709 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4711 = getelementptr [46 x i8], [46 x i8]*@.str4710, i32 0, i32 0
%.tmp4712 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4713 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4712, i32 0, i32 7
%.tmp4714 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4713
%.tmp4715 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4714, i32 0, i32 7
%.tmp4716 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4715
%.tmp4717 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4716, i32 0, i32 1
%.tmp4718 = load i8*, i8** %.tmp4717
%.tmp4719 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4720 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4719, i32 0, i32 1
%.tmp4721 = load i8*, i8** %.tmp4720
%.tmp4722 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4709, i8* %.tmp4711, i8* %.tmp4718, i8* %.tmp4721)
%.tmp4723 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4724 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4725 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4723, %m286$.Node.type* %.tmp4724, i8* %.tmp4725)
%.tmp4726 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4726
br label %.if.end.4708
.if.false.4708:
br label %.if.end.4708
.if.end.4708:
%.tmp4727 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp4727
br label %.if.end.4703
.if.false.4703:
%.tmp4728 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4729 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4728, i32 0, i32 2
%.tmp4730 = load i8*, i8** %.tmp4729
%.tmp4732 = getelementptr [9 x i8], [9 x i8]*@.str4731, i32 0, i32 0
%.tmp4733 = call i32(i8*,i8*) @strcmp(i8* %.tmp4730, i8* %.tmp4732)
%.tmp4734 = icmp eq i32 %.tmp4733, 0
%.tmp4735 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4736 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4735, i32 0, i32 7
%.tmp4737 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4736
%.tmp4738 = icmp ne %m286$.Node.type* %.tmp4737, null
%.tmp4739 = and i1 %.tmp4734, %.tmp4738
br i1 %.tmp4739, label %.if.true.4740, label %.if.false.4740
.if.true.4740:
%.tmp4741 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%base_var = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4741, %m1770$.AssignableInfo.type** %base_var
%.tmp4742 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4743 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4742, i32 0, i32 3
%.tmp4744 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4743
%struct_info = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp4744, %m1770$.Type.type** %struct_info
br label %.for.start.4745
.for.start.4745:
%.tmp4746 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4747 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4746, i32 0, i32 3
%.tmp4748 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4747
%.tmp4749 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4748, i32 0, i32 0
%.tmp4750 = load i8*, i8** %.tmp4749
%.tmp4752 = getelementptr [4 x i8], [4 x i8]*@.str4751, i32 0, i32 0
%.tmp4753 = call i32(i8*,i8*) @strcmp(i8* %.tmp4750, i8* %.tmp4752)
%.tmp4754 = icmp eq i32 %.tmp4753, 0
br i1 %.tmp4754, label %.for.continue.4745, label %.for.end.4745
.for.continue.4745:
%.tmp4755 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4756 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4755)
%new_base = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4756, %m1770$.AssignableInfo.type** %new_base
%.tmp4757 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4758 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp4757, %m1770$.AssignableInfo.type* %.tmp4758)
%.tmp4759 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
%.tmp4760 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4759, i32 0, i32 3
%.tmp4761 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4762 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4761, i32 0, i32 3
%.tmp4763 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4762
%.tmp4764 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4763, i32 0, i32 3
%.tmp4765 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4764
store %m1770$.Type.type* %.tmp4765, %m1770$.Type.type** %.tmp4760
%.tmp4766 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4767 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4766, i32 0, i32 1
%.tmp4768 = load %m0$.File.type*, %m0$.File.type** %.tmp4767
%.tmp4770 = getelementptr [23 x i8], [23 x i8]*@.str4769, i32 0, i32 0
%.tmp4771 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
%.tmp4772 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4771)
%.tmp4773 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4774 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
%.tmp4775 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4774, i32 0, i32 3
%.tmp4776 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4775
%.tmp4777 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4773, %m1770$.Type.type* %.tmp4776)
%.tmp4778 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4779 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4780 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4779, i32 0, i32 3
%.tmp4781 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4780
%.tmp4782 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4778, %m1770$.Type.type* %.tmp4781)
%.tmp4783 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4784 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4783)
%.tmp4785 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4768, i8* %.tmp4770, i8* %.tmp4772, i8* %.tmp4777, i8* %.tmp4782, i8* %.tmp4784)
%.tmp4786 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
store %m1770$.AssignableInfo.type* %.tmp4786, %m1770$.AssignableInfo.type** %base_var
%.tmp4787 = load %m1770$.Type.type*, %m1770$.Type.type** %struct_info
%.tmp4788 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4787, i32 0, i32 3
%.tmp4789 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4788
store %m1770$.Type.type* %.tmp4789, %m1770$.Type.type** %struct_info
br label %.for.start.4745
.for.end.4745:
%.tmp4790 = load %m1770$.Type.type*, %m1770$.Type.type** %struct_info
%.tmp4791 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4790, i32 0, i32 0
%.tmp4792 = load i8*, i8** %.tmp4791
%.tmp4794 = getelementptr [10 x i8], [10 x i8]*@.str4793, i32 0, i32 0
%.tmp4795 = call i32(i8*,i8*) @strcmp(i8* %.tmp4792, i8* %.tmp4794)
%.tmp4796 = icmp eq i32 %.tmp4795, 0
br i1 %.tmp4796, label %.if.true.4797, label %.if.false.4797
.if.true.4797:
%.tmp4798 = load %m1770$.Type.type*, %m1770$.Type.type** %struct_info
%.tmp4799 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4798, i32 0, i32 3
%.tmp4800 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4799
store %m1770$.Type.type* %.tmp4800, %m1770$.Type.type** %struct_info
br label %.if.end.4797
.if.false.4797:
br label %.if.end.4797
.if.end.4797:
%.tmp4801 = load %m1770$.Type.type*, %m1770$.Type.type** %struct_info
%.tmp4802 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4801, i32 0, i32 0
%.tmp4803 = load i8*, i8** %.tmp4802
%.tmp4805 = getelementptr [7 x i8], [7 x i8]*@.str4804, i32 0, i32 0
%.tmp4806 = call i32(i8*,i8*) @strcmp(i8* %.tmp4803, i8* %.tmp4805)
%.tmp4807 = icmp ne i32 %.tmp4806, 0
br i1 %.tmp4807, label %.if.true.4808, label %.if.false.4808
.if.true.4808:
%.tmp4809 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4811 = getelementptr [48 x i8], [48 x i8]*@.str4810, i32 0, i32 0
%.tmp4812 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4813 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4812, i32 0, i32 7
%.tmp4814 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4813
%.tmp4815 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4814, i32 0, i32 7
%.tmp4816 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4815
%.tmp4817 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4816, i32 0, i32 1
%.tmp4818 = load i8*, i8** %.tmp4817
%.tmp4819 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4820 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4819, i32 0, i32 1
%.tmp4821 = load i8*, i8** %.tmp4820
%.tmp4822 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4809, i8* %.tmp4811, i8* %.tmp4818, i8* %.tmp4821)
%.tmp4823 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4824 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4825 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4823, %m286$.Node.type* %.tmp4824, i8* %.tmp4825)
%.tmp4826 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4826
br label %.if.end.4808
.if.false.4808:
br label %.if.end.4808
.if.end.4808:
%.tmp4827 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4828 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4827, i32 0, i32 7
%.tmp4829 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4828
%.tmp4830 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4829, i32 0, i32 7
%.tmp4831 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4830
%.tmp4832 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4831, i32 0, i32 1
%.tmp4833 = load i8*, i8** %.tmp4832
%field_name = alloca i8*
store i8* %.tmp4833, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp4834 = bitcast ptr null to %m1770$.Type.type*
%found_field = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp4834, %m1770$.Type.type** %found_field
%.tmp4836 = load %m1770$.Type.type*, %m1770$.Type.type** %struct_info
%.tmp4837 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4836, i32 0, i32 3
%.tmp4838 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4837
%field = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp4838, %m1770$.Type.type** %field
br label %.for.start.4835
.for.start.4835:
%.tmp4839 = load i1, i1* %quit
%.tmp4840 = icmp eq i1 %.tmp4839, 0
br i1 %.tmp4840, label %.for.continue.4835, label %.for.end.4835
.for.continue.4835:
%.tmp4841 = load %m1770$.Type.type*, %m1770$.Type.type** %field
%.tmp4842 = icmp eq %m1770$.Type.type* %.tmp4841, null
br i1 %.tmp4842, label %.if.true.4843, label %.if.false.4843
.if.true.4843:
store i1 1, i1* %quit
br label %.if.end.4843
.if.false.4843:
%.tmp4844 = load %m1770$.Type.type*, %m1770$.Type.type** %field
%.tmp4845 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4844, i32 0, i32 1
%.tmp4846 = load i8*, i8** %.tmp4845
%.tmp4847 = load i8*, i8** %field_name
%.tmp4848 = call i32(i8*,i8*) @strcmp(i8* %.tmp4846, i8* %.tmp4847)
%.tmp4849 = icmp eq i32 %.tmp4848, 0
br i1 %.tmp4849, label %.if.true.4850, label %.if.false.4850
.if.true.4850:
store i1 1, i1* %quit
%.tmp4851 = load %m1770$.Type.type*, %m1770$.Type.type** %field
store %m1770$.Type.type* %.tmp4851, %m1770$.Type.type** %found_field
br label %.if.end.4850
.if.false.4850:
%.tmp4852 = load i32, i32* %field_id
%.tmp4853 = add i32 %.tmp4852, 1
store i32 %.tmp4853, i32* %field_id
br label %.if.end.4850
.if.end.4850:
br label %.if.end.4843
.if.end.4843:
%.tmp4854 = load %m1770$.Type.type*, %m1770$.Type.type** %field
%.tmp4855 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp4854, i32 0, i32 4
%.tmp4856 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4855
store %m1770$.Type.type* %.tmp4856, %m1770$.Type.type** %field
br label %.for.start.4835
.for.end.4835:
%.tmp4857 = load %m1770$.Type.type*, %m1770$.Type.type** %found_field
%.tmp4858 = icmp eq %m1770$.Type.type* %.tmp4857, null
br i1 %.tmp4858, label %.if.true.4859, label %.if.false.4859
.if.true.4859:
%.tmp4860 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4862 = getelementptr [34 x i8], [34 x i8]*@.str4861, i32 0, i32 0
%.tmp4863 = load i8*, i8** %field_name
%.tmp4864 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4865 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4864, i32 0, i32 1
%.tmp4866 = load i8*, i8** %.tmp4865
%.tmp4867 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4860, i8* %.tmp4862, i8* %.tmp4863, i8* %.tmp4866)
%.tmp4868 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4869 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4870 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4868, %m286$.Node.type* %.tmp4869, i8* %.tmp4870)
%.tmp4871 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4871
br label %.if.end.4859
.if.false.4859:
br label %.if.end.4859
.if.end.4859:
%.tmp4872 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4873 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4872)
%new_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4873, %m1770$.AssignableInfo.type** %new_info
%.tmp4874 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_info
%.tmp4875 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4874, i32 0, i32 3
%.tmp4876 = load %m1770$.Type.type*, %m1770$.Type.type** %found_field
store %m1770$.Type.type* %.tmp4876, %m1770$.Type.type** %.tmp4875
%.tmp4877 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4878 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp4877, %m1770$.AssignableInfo.type* %.tmp4878)
%.tmp4879 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_info
%.tmp4880 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4879, i32 0, i32 2
%.tmp4882 = getelementptr [9 x i8], [9 x i8]*@.str4881, i32 0, i32 0
store i8* %.tmp4882, i8** %.tmp4880
%.tmp4883 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4884 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4885 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4884, i32 0, i32 3
%.tmp4886 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp4885
%.tmp4887 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp4883, %m1770$.Type.type* %.tmp4886)
%info_tr = alloca i8*
store i8* %.tmp4887, i8** %info_tr
%.tmp4888 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4889 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4888, i32 0, i32 1
%.tmp4890 = load %m0$.File.type*, %m0$.File.type** %.tmp4889
%.tmp4892 = getelementptr [46 x i8], [46 x i8]*@.str4891, i32 0, i32 0
%.tmp4893 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_info
%.tmp4894 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4893)
%.tmp4895 = load i8*, i8** %info_tr
%.tmp4896 = load i8*, i8** %info_tr
%.tmp4897 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base_var
%.tmp4898 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4897)
%.tmp4899 = load i32, i32* %field_id
%.tmp4900 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4890, i8* %.tmp4892, i8* %.tmp4894, i8* %.tmp4895, i8* %.tmp4896, i8* %.tmp4898, i32 %.tmp4899)
%.tmp4901 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4902 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4903 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4902, i32 0, i32 7
%.tmp4904 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4903
%.tmp4905 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4904, i32 0, i32 7
%.tmp4906 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4905
%.tmp4907 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_info
%.tmp4908 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,%m1770$.AssignableInfo.type*) @m1770$get_dotted_name.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp4901, %m286$.Node.type* %.tmp4906, %m1770$.AssignableInfo.type* %.tmp4907)
ret %m1770$.AssignableInfo.type* %.tmp4908
br label %.if.end.4740
.if.false.4740:
%.tmp4909 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4910 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4909, i32 0, i32 2
%.tmp4911 = load i8*, i8** %.tmp4910
%.tmp4913 = getelementptr [9 x i8], [9 x i8]*@.str4912, i32 0, i32 0
%.tmp4914 = call i32(i8*,i8*) @strcmp(i8* %.tmp4911, i8* %.tmp4913)
%.tmp4915 = icmp eq i32 %.tmp4914, 0
br i1 %.tmp4915, label %.if.true.4916, label %.if.false.4916
.if.true.4916:
%.tmp4917 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp4917
br label %.if.end.4916
.if.false.4916:
br label %.if.end.4916
.if.end.4916:
br label %.if.end.4740
.if.end.4740:
br label %.if.end.4703
.if.end.4703:
%.tmp4918 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4919 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4921 = getelementptr [43 x i8], [43 x i8]*@.str4920, i32 0, i32 0
%.tmp4922 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4918, %m286$.Node.type* %.tmp4919, i8* %.tmp4921)
%.tmp4923 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4924 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4923, i32 0, i32 2
%.tmp4925 = load i8*, i8** %.tmp4924
%.tmp4926 = call i32(i8*,...) @printf(i8* %.tmp4922, i8* %.tmp4925)
%.tmp4927 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4927
}
define %m1770$.AssignableInfo.type* @m1770$compile_addr.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp4928 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4928, %m286$.Node.type** %curr_node
%.tmp4929 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4930 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4929, i32 0, i32 0
%.tmp4931 = load i8*, i8** %.tmp4930
%.tmp4933 = getelementptr [12 x i8], [12 x i8]*@.str4932, i32 0, i32 0
%.tmp4934 = call i32(i8*,i8*) @strcmp(i8* %.tmp4931, i8* %.tmp4933)
%.tmp4935 = icmp ne i32 %.tmp4934, 0
br i1 %.tmp4935, label %.if.true.4936, label %.if.false.4936
.if.true.4936:
%.tmp4938 = getelementptr [92 x i8], [92 x i8]*@.str4937, i32 0, i32 0
%.tmp4939 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4940 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4939, i32 0, i32 0
%.tmp4941 = load i8*, i8** %.tmp4940
%.tmp4942 = call i32(i8*,...) @printf(i8* %.tmp4938, i8* %.tmp4941)
%.tmp4943 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4944 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4943, i32 0, i32 6
%.tmp4945 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4944
store %m286$.Node.type* %.tmp4945, %m286$.Node.type** %curr_node
br label %.if.end.4936
.if.false.4936:
br label %.if.end.4936
.if.end.4936:
%.tmp4946 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4947 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4946, i32 0, i32 6
%.tmp4948 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4947
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4948, %m286$.Node.type** %assignable_name
%.tmp4949 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4950 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4951 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp4950, i32 0, i32 6
%.tmp4952 = load i8*, i8** %.tmp4951
%.tmp4953 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4954 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4953, i32 0, i32 6
%.tmp4955 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4954
%.tmp4956 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4955, i32 0, i32 1
%.tmp4957 = load i8*, i8** %.tmp4956
%.tmp4958 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,i8*,i8*) @m1770$find_defined_str.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.cp(%m1770$.CompilerCtx.type* %.tmp4949, i8* %.tmp4952, i8* %.tmp4957)
%scope_info = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp4958, %m1770$.ScopeItem.type** %scope_info
%.tmp4959 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %scope_info
%.tmp4960 = icmp eq %m1770$.ScopeItem.type* %.tmp4959, null
br i1 %.tmp4960, label %.if.true.4961, label %.if.false.4961
.if.true.4961:
%.tmp4962 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4964 = getelementptr [25 x i8], [25 x i8]*@.str4963, i32 0, i32 0
%.tmp4965 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4966 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4965, i32 0, i32 6
%.tmp4967 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4966
%.tmp4968 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4967, i32 0, i32 1
%.tmp4969 = load i8*, i8** %.tmp4968
%.tmp4970 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4962, i8* %.tmp4964, i8* %.tmp4969)
%.tmp4971 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4972 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4973 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp4971, %m286$.Node.type* %.tmp4972, i8* %.tmp4973)
%.tmp4974 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp4974
br label %.if.end.4961
.if.false.4961:
br label %.if.end.4961
.if.end.4961:
%.tmp4975 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %scope_info
%.tmp4976 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp4975, i32 0, i32 1
%.tmp4977 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp4976
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp4977, %m1770$.AssignableInfo.type** %info
%.tmp4978 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4979 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp4978, i32 0, i32 2
%.tmp4980 = load i8*, i8** %.tmp4979
%.tmp4982 = getelementptr [7 x i8], [7 x i8]*@.str4981, i32 0, i32 0
%.tmp4983 = call i32(i8*,i8*) @strcmp(i8* %.tmp4980, i8* %.tmp4982)
%.tmp4984 = icmp eq i32 %.tmp4983, 0
br i1 %.tmp4984, label %.if.true.4985, label %.if.false.4985
.if.true.4985:
%.tmp4986 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp4987 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp4988 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp4987)
%.tmp4989 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4990 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4989, i32 0, i32 6
%.tmp4991 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4990
%.tmp4992 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4991, i32 0, i32 7
%.tmp4993 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4992
%.tmp4994 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4993, i32 0, i32 7
%.tmp4995 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4994
%.tmp4996 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4995, i32 0, i32 1
%.tmp4997 = load i8*, i8** %.tmp4996
%.tmp4998 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,i8*,i8*) @m1770$find_defined_str.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.cp.cp(%m1770$.CompilerCtx.type* %.tmp4986, i8* %.tmp4988, i8* %.tmp4997)
store %m1770$.ScopeItem.type* %.tmp4998, %m1770$.ScopeItem.type** %scope_info
%.tmp4999 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %scope_info
%.tmp5000 = icmp eq %m1770$.ScopeItem.type* %.tmp4999, null
br i1 %.tmp5000, label %.if.true.5001, label %.if.false.5001
.if.true.5001:
%.tmp5002 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5004 = getelementptr [31 x i8], [31 x i8]*@.str5003, i32 0, i32 0
%.tmp5005 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5006 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5005, i32 0, i32 6
%.tmp5007 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5006
%.tmp5008 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5007, i32 0, i32 7
%.tmp5009 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5008
%.tmp5010 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5009, i32 0, i32 7
%.tmp5011 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5010
%.tmp5012 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5011, i32 0, i32 1
%.tmp5013 = load i8*, i8** %.tmp5012
%.tmp5014 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5015 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5014)
%.tmp5016 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5002, i8* %.tmp5004, i8* %.tmp5013, i8* %.tmp5015)
%.tmp5017 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5018 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5019 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp5017, %m286$.Node.type* %.tmp5018, i8* %.tmp5019)
%.tmp5020 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp5020
br label %.if.end.5001
.if.false.5001:
br label %.if.end.5001
.if.end.5001:
%.tmp5021 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %scope_info
%.tmp5022 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp5021, i32 0, i32 1
%.tmp5023 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp5022
store %m1770$.AssignableInfo.type* %.tmp5023, %m1770$.AssignableInfo.type** %info
%.tmp5024 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5025 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5024, i32 0, i32 6
%.tmp5026 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5025
%.tmp5027 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5026, i32 0, i32 7
%.tmp5028 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5027
%.tmp5029 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5028, i32 0, i32 7
%.tmp5030 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5029
store %m286$.Node.type* %.tmp5030, %m286$.Node.type** %assignable_name
br label %.if.end.4985
.if.false.4985:
%.tmp5031 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5032 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5031, i32 0, i32 6
%.tmp5033 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5032
store %m286$.Node.type* %.tmp5033, %m286$.Node.type** %assignable_name
br label %.if.end.4985
.if.end.4985:
%.tmp5034 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5035 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5036 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5037 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,%m1770$.AssignableInfo.type*) @m1770$get_dotted_name.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp5034, %m286$.Node.type* %.tmp5035, %m1770$.AssignableInfo.type* %.tmp5036)
%base = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5037, %m1770$.AssignableInfo.type** %base
%.tmp5039 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5040 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5039, i32 0, i32 6
%.tmp5041 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5040
%.tmp5042 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5041, i32 0, i32 7
%.tmp5043 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5042
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5043, %m286$.Node.type** %addr
br label %.for.start.5038
.for.start.5038:
%.tmp5044 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5045 = icmp ne %m286$.Node.type* %.tmp5044, null
br i1 %.tmp5045, label %.for.continue.5038, label %.for.end.5038
.for.continue.5038:
%.tmp5046 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5047 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5046, i32 0, i32 7
%.tmp5048 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5047
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5048, %m286$.Node.type** %index
%.tmp5049 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5050 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp5051 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp5049, %m286$.Node.type* %.tmp5050)
%index_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5051, %m1770$.AssignableInfo.type** %index_info
%.tmp5052 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5053 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base
%.tmp5054 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5053, i32 0, i32 3
%.tmp5055 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5054
%.tmp5056 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5052, %m1770$.Type.type* %.tmp5055)
%base_type = alloca i8*
store i8* %.tmp5056, i8** %base_type
%.tmp5057 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5058 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %index_info
%.tmp5059 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5058, i32 0, i32 3
%.tmp5060 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5059
%.tmp5061 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5057, %m1770$.Type.type* %.tmp5060)
%index_type = alloca i8*
store i8* %.tmp5061, i8** %index_type
%.tmp5062 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5063 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp5062)
%tmp_id = alloca i32
store i32 %.tmp5063, i32* %tmp_id
%.tmp5064 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5065 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5064, i32 0, i32 1
%.tmp5066 = load %m0$.File.type*, %m0$.File.type** %.tmp5065
%.tmp5068 = getelementptr [28 x i8], [28 x i8]*@.str5067, i32 0, i32 0
%.tmp5069 = load i32, i32* %tmp_id
%.tmp5070 = load i8*, i8** %base_type
%.tmp5071 = load i8*, i8** %base_type
%.tmp5072 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base
%.tmp5073 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5072)
%.tmp5074 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5066, i8* %.tmp5068, i32 %.tmp5069, i8* %.tmp5070, i8* %.tmp5071, i8* %.tmp5073)
%.tmp5075 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5076 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5075)
%new_base = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5076, %m1770$.AssignableInfo.type** %new_base
%.tmp5077 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5078 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp5077, %m1770$.AssignableInfo.type* %.tmp5078)
%.tmp5079 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base
%.tmp5080 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5079, i32 0, i32 3
%.tmp5081 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5080
%.tmp5082 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5081, i32 0, i32 3
%.tmp5083 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5082
%.tmp5084 = icmp eq %m1770$.Type.type* %.tmp5083, null
br i1 %.tmp5084, label %.if.true.5085, label %.if.false.5085
.if.true.5085:
%.tmp5086 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5088 = getelementptr [35 x i8], [35 x i8]*@.str5087, i32 0, i32 0
%.tmp5089 = load i8*, i8** %base_type
%.tmp5090 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5086, i8* %.tmp5088, i8* %.tmp5089)
%.tmp5091 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5092 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5093 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp5091, %m286$.Node.type* %.tmp5092, i8* %.tmp5093)
%.tmp5094 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base
ret %m1770$.AssignableInfo.type* %.tmp5094
br label %.if.end.5085
.if.false.5085:
br label %.if.end.5085
.if.end.5085:
%.tmp5095 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
%.tmp5096 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5095, i32 0, i32 3
%.tmp5097 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base
%.tmp5098 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5097, i32 0, i32 3
%.tmp5099 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5098
%.tmp5100 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5099, i32 0, i32 3
%.tmp5101 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5100
store %m1770$.Type.type* %.tmp5101, %m1770$.Type.type** %.tmp5096
%.tmp5102 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5103 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
%.tmp5104 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5103, i32 0, i32 3
%.tmp5105 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5104
%.tmp5106 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5102, %m1770$.Type.type* %.tmp5105)
%base_type_2 = alloca i8*
store i8* %.tmp5106, i8** %base_type_2
%.tmp5107 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5108 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5107, i32 0, i32 1
%.tmp5109 = load %m0$.File.type*, %m0$.File.type** %.tmp5108
%.tmp5111 = getelementptr [44 x i8], [44 x i8]*@.str5110, i32 0, i32 0
%.tmp5112 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
%.tmp5113 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5112)
%.tmp5114 = load i8*, i8** %base_type_2
%.tmp5115 = load i8*, i8** %base_type_2
%.tmp5116 = load i32, i32* %tmp_id
%.tmp5117 = load i8*, i8** %index_type
%.tmp5118 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %index_info
%.tmp5119 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5118)
%.tmp5120 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5109, i8* %.tmp5111, i8* %.tmp5113, i8* %.tmp5114, i8* %.tmp5115, i32 %.tmp5116, i8* %.tmp5117, i8* %.tmp5119)
%.tmp5121 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %new_base
store %m1770$.AssignableInfo.type* %.tmp5121, %m1770$.AssignableInfo.type** %base
%.tmp5122 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5123 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5122, i32 0, i32 7
%.tmp5124 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5123
%.tmp5125 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5124, i32 0, i32 7
%.tmp5126 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5125
%.tmp5127 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5126, i32 0, i32 7
%.tmp5128 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5127
store %m286$.Node.type* %.tmp5128, %m286$.Node.type** %addr
br label %.for.start.5038
.for.end.5038:
%.tmp5129 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %base
ret %m1770$.AssignableInfo.type* %.tmp5129
}
%m1770$.StackHead.type = type {%m1891$.SYStack.type*}
define %m1770$.AssignableInfo.type* @m1770$compile_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5130 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5131 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5130, i32 0, i32 6
%.tmp5132 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5131
%.tmp5134 = getelementptr [16 x i8], [16 x i8]*@.str5133, i32 0, i32 0
%.tmp5135 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5132, i8* %.tmp5134)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5135, %m286$.Node.type** %assignable_start
%.tmp5136 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp5137 = call %m1891$.SYStack.type*(%m286$.Node.type*) @m1891$sy_algorithm.m1891$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5136)
%operator_stack = alloca %m1891$.SYStack.type*
store %m1891$.SYStack.type* %.tmp5137, %m1891$.SYStack.type** %operator_stack
%.tmp5138 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* null, i32 1
%.tmp5139 = ptrtoint %m1770$.StackHead.type* %.tmp5138 to i32
%.tmp5140 = call i8*(i32) @malloc(i32 %.tmp5139)
%.tmp5141 = bitcast i8* %.tmp5140 to %m1770$.StackHead.type*
%stack = alloca %m1770$.StackHead.type*
store %m1770$.StackHead.type* %.tmp5141, %m1770$.StackHead.type** %stack
%.tmp5142 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5143 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5142, i32 0, i32 0
%.tmp5144 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %operator_stack
store %m1891$.SYStack.type* %.tmp5144, %m1891$.SYStack.type** %.tmp5143
%.tmp5145 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5146 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5147 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m1770$.StackHead.type*) @m1770$compile_assignable_stack.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m1770$.StackHead.typep(%m1770$.CompilerCtx.type* %.tmp5145, %m1770$.StackHead.type* %.tmp5146)
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5147, %m1770$.AssignableInfo.type** %info
%.tmp5148 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5149 = icmp eq %m1770$.AssignableInfo.type* %.tmp5148, null
br i1 %.tmp5149, label %.if.true.5150, label %.if.false.5150
.if.true.5150:
%.tmp5151 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp5151
br label %.if.end.5150
.if.false.5150:
br label %.if.end.5150
.if.end.5150:
%.tmp5152 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5153 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5152, i32 0, i32 6
%.tmp5154 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5153
%.tmp5156 = getelementptr [5 x i8], [5 x i8]*@.str5155, i32 0, i32 0
%.tmp5157 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5154, i8* %.tmp5156)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5157, %m286$.Node.type** %cast
%.tmp5158 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5159 = icmp ne %m286$.Node.type* %.tmp5158, null
br i1 %.tmp5159, label %.if.true.5160, label %.if.false.5160
.if.true.5160:
%.tmp5161 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5162 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5161, i32 0, i32 6
%.tmp5163 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5162
%.tmp5165 = getelementptr [5 x i8], [5 x i8]*@.str5164, i32 0, i32 0
%.tmp5166 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5163, i8* %.tmp5165)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5166, %m286$.Node.type** %cast_type
%.tmp5167 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5168 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5169 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5168, i32 0, i32 6
%.tmp5170 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5169
%.tmp5171 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp5167, %m286$.Node.type* %.tmp5170)
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp5171, %m1770$.Type.type** %type
%.tmp5172 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5173 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5172)
%prev_id = alloca i8*
store i8* %.tmp5173, i8** %prev_id
%.tmp5174 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5175 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp5174, %m1770$.AssignableInfo.type* %.tmp5175)
%.tmp5176 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5177 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5176, i32 0, i32 1
%.tmp5178 = load %m0$.File.type*, %m0$.File.type** %.tmp5177
%.tmp5180 = getelementptr [26 x i8], [26 x i8]*@.str5179, i32 0, i32 0
%.tmp5181 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5182 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5181)
%.tmp5183 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5184 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5185 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5184, i32 0, i32 3
%.tmp5186 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5185
%.tmp5187 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5183, %m1770$.Type.type* %.tmp5186)
%.tmp5188 = load i8*, i8** %prev_id
%.tmp5189 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5190 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5191 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5189, %m1770$.Type.type* %.tmp5190)
%.tmp5192 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5178, i8* %.tmp5180, i8* %.tmp5182, i8* %.tmp5187, i8* %.tmp5188, i8* %.tmp5191)
%.tmp5193 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5194 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5193, i32 0, i32 3
%.tmp5195 = load %m1770$.Type.type*, %m1770$.Type.type** %type
store %m1770$.Type.type* %.tmp5195, %m1770$.Type.type** %.tmp5194
br label %.if.end.5160
.if.false.5160:
br label %.if.end.5160
.if.end.5160:
%.tmp5196 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp5196
}
define %m1770$.AssignableInfo.type* @m1770$compile_assignable_stack.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m1770$.StackHead.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stack = alloca %m1770$.StackHead.type*
store %m1770$.StackHead.type* %.stack.arg, %m1770$.StackHead.type** %stack
%.tmp5197 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5198 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5197, i32 0, i32 0
%.tmp5199 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5198
%.tmp5200 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp5199, i32 0, i32 0
%.tmp5201 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5200
%.tmp5202 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5201, i32 0, i32 0
%.tmp5203 = load i8*, i8** %.tmp5202
%.tmp5205 = getelementptr [16 x i8], [16 x i8]*@.str5204, i32 0, i32 0
%.tmp5206 = call i32(i8*,i8*) @strcmp(i8* %.tmp5203, i8* %.tmp5205)
%.tmp5207 = icmp eq i32 %.tmp5206, 0
br i1 %.tmp5207, label %.if.true.5208, label %.if.false.5208
.if.true.5208:
%.tmp5209 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5210 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5211 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5210, i32 0, i32 0
%.tmp5212 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5211
%.tmp5213 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp5212, i32 0, i32 0
%.tmp5214 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5213
%.tmp5215 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_mono_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp5209, %m286$.Node.type* %.tmp5214)
ret %m1770$.AssignableInfo.type* %.tmp5215
br label %.if.end.5208
.if.false.5208:
br label %.if.end.5208
.if.end.5208:
%.tmp5216 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5217 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5216, i32 0, i32 0
%.tmp5218 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5217
%.tmp5219 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp5218, i32 0, i32 0
%.tmp5220 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5219
%.tmp5221 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5220, i32 0, i32 6
%.tmp5222 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5221
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5222, %m286$.Node.type** %operator
%.tmp5223 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5224 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5223, i32 0, i32 0
%.tmp5225 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5226 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5225, i32 0, i32 0
%.tmp5227 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5226
%.tmp5228 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp5227, i32 0, i32 1
%.tmp5229 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5228
store %m1891$.SYStack.type* %.tmp5229, %m1891$.SYStack.type** %.tmp5224
%.tmp5230 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5231 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5232 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m1770$.StackHead.type*) @m1770$compile_assignable_stack.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m1770$.StackHead.typep(%m1770$.CompilerCtx.type* %.tmp5230, %m1770$.StackHead.type* %.tmp5231)
%A = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5232, %m1770$.AssignableInfo.type** %A
%.tmp5233 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %A
%.tmp5234 = icmp eq %m1770$.AssignableInfo.type* %.tmp5233, null
br i1 %.tmp5234, label %.if.true.5235, label %.if.false.5235
.if.true.5235:
%.tmp5236 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %A
ret %m1770$.AssignableInfo.type* %.tmp5236
br label %.if.end.5235
.if.false.5235:
br label %.if.end.5235
.if.end.5235:
%.tmp5237 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5238 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5237, i32 0, i32 0
%.tmp5239 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5240 = getelementptr %m1770$.StackHead.type, %m1770$.StackHead.type* %.tmp5239, i32 0, i32 0
%.tmp5241 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5240
%.tmp5242 = getelementptr %m1891$.SYStack.type, %m1891$.SYStack.type* %.tmp5241, i32 0, i32 1
%.tmp5243 = load %m1891$.SYStack.type*, %m1891$.SYStack.type** %.tmp5242
store %m1891$.SYStack.type* %.tmp5243, %m1891$.SYStack.type** %.tmp5238
%.tmp5244 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5245 = load %m1770$.StackHead.type*, %m1770$.StackHead.type** %stack
%.tmp5246 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m1770$.StackHead.type*) @m1770$compile_assignable_stack.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m1770$.StackHead.typep(%m1770$.CompilerCtx.type* %.tmp5244, %m1770$.StackHead.type* %.tmp5245)
%B = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5246, %m1770$.AssignableInfo.type** %B
%.tmp5247 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %B
%.tmp5248 = icmp eq %m1770$.AssignableInfo.type* %.tmp5247, null
br i1 %.tmp5248, label %.if.true.5249, label %.if.false.5249
.if.true.5249:
%.tmp5250 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %B
ret %m1770$.AssignableInfo.type* %.tmp5250
br label %.if.end.5249
.if.false.5249:
br label %.if.end.5249
.if.end.5249:
%.tmp5251 = bitcast ptr null to %m286$.Node.type*
%.tmp5252 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5251)
%op_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5252, %m1770$.AssignableInfo.type** %op_info
%.tmp5253 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %op_info
%.tmp5254 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5253, i32 0, i32 3
%.tmp5255 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5256 = call %m1770$.Type.type*(%m286$.Node.type*) @m1770$operator_type.m1770$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5255)
store %m1770$.Type.type* %.tmp5256, %m1770$.Type.type** %.tmp5254
%.tmp5257 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5258 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %op_info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp5257, %m1770$.AssignableInfo.type* %.tmp5258)
%.tmp5259 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5260 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5259, i32 0, i32 1
%.tmp5261 = load %m0$.File.type*, %m0$.File.type** %.tmp5260
%.tmp5263 = getelementptr [19 x i8], [19 x i8]*@.str5262, i32 0, i32 0
%.tmp5264 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %op_info
%.tmp5265 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5264)
%.tmp5266 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5267 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5268 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$operator_op.cp.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp5266, %m286$.Node.type* %.tmp5267)
%.tmp5269 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5270 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %A
%.tmp5271 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5270, i32 0, i32 3
%.tmp5272 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5271
%.tmp5273 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5269, %m1770$.Type.type* %.tmp5272)
%.tmp5274 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %A
%.tmp5275 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5274)
%.tmp5276 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %B
%.tmp5277 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5276)
%.tmp5278 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5261, i8* %.tmp5263, i8* %.tmp5265, i8* %.tmp5268, i8* %.tmp5273, i8* %.tmp5275, i8* %.tmp5277)
%.tmp5279 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %op_info
ret %m1770$.AssignableInfo.type* %.tmp5279
}
define i8* @m1770$operator_op.cp.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5280 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5281 = icmp eq %m286$.Node.type* %.tmp5280, null
br i1 %.tmp5281, label %.if.true.5282, label %.if.false.5282
.if.true.5282:
%.tmp5283 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5284 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5286 = getelementptr [31 x i8], [31 x i8]*@.str5285, i32 0, i32 0
%.tmp5287 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp5283, %m286$.Node.type* %.tmp5284, i8* %.tmp5286)
%.tmp5288 = call i32(i8*,...) @printf(i8* %.tmp5287)
br label %.if.end.5282
.if.false.5282:
br label %.if.end.5282
.if.end.5282:
%.tmp5289 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5290 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5289, i32 0, i32 1
%.tmp5291 = load i8*, i8** %.tmp5290
%.tmp5293 = getelementptr [2 x i8], [2 x i8]*@.str5292, i32 0, i32 0
%.tmp5294 = call i32(i8*,i8*) @strcmp(i8* %.tmp5291, i8* %.tmp5293)
%.tmp5295 = icmp eq i32 %.tmp5294, 0
br i1 %.tmp5295, label %.if.true.5296, label %.if.false.5296
.if.true.5296:
%.tmp5298 = getelementptr [4 x i8], [4 x i8]*@.str5297, i32 0, i32 0
ret i8* %.tmp5298
br label %.if.end.5296
.if.false.5296:
%.tmp5299 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5300 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5299, i32 0, i32 1
%.tmp5301 = load i8*, i8** %.tmp5300
%.tmp5303 = getelementptr [2 x i8], [2 x i8]*@.str5302, i32 0, i32 0
%.tmp5304 = call i32(i8*,i8*) @strcmp(i8* %.tmp5301, i8* %.tmp5303)
%.tmp5305 = icmp eq i32 %.tmp5304, 0
br i1 %.tmp5305, label %.if.true.5306, label %.if.false.5306
.if.true.5306:
%.tmp5308 = getelementptr [4 x i8], [4 x i8]*@.str5307, i32 0, i32 0
ret i8* %.tmp5308
br label %.if.end.5306
.if.false.5306:
%.tmp5309 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5310 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5309, i32 0, i32 1
%.tmp5311 = load i8*, i8** %.tmp5310
%.tmp5313 = getelementptr [2 x i8], [2 x i8]*@.str5312, i32 0, i32 0
%.tmp5314 = call i32(i8*,i8*) @strcmp(i8* %.tmp5311, i8* %.tmp5313)
%.tmp5315 = icmp eq i32 %.tmp5314, 0
br i1 %.tmp5315, label %.if.true.5316, label %.if.false.5316
.if.true.5316:
%.tmp5318 = getelementptr [4 x i8], [4 x i8]*@.str5317, i32 0, i32 0
ret i8* %.tmp5318
br label %.if.end.5316
.if.false.5316:
%.tmp5319 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5320 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5319, i32 0, i32 1
%.tmp5321 = load i8*, i8** %.tmp5320
%.tmp5323 = getelementptr [2 x i8], [2 x i8]*@.str5322, i32 0, i32 0
%.tmp5324 = call i32(i8*,i8*) @strcmp(i8* %.tmp5321, i8* %.tmp5323)
%.tmp5325 = icmp eq i32 %.tmp5324, 0
br i1 %.tmp5325, label %.if.true.5326, label %.if.false.5326
.if.true.5326:
%.tmp5328 = getelementptr [5 x i8], [5 x i8]*@.str5327, i32 0, i32 0
ret i8* %.tmp5328
br label %.if.end.5326
.if.false.5326:
%.tmp5329 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5330 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5329, i32 0, i32 1
%.tmp5331 = load i8*, i8** %.tmp5330
%.tmp5333 = getelementptr [3 x i8], [3 x i8]*@.str5332, i32 0, i32 0
%.tmp5334 = call i32(i8*,i8*) @strcmp(i8* %.tmp5331, i8* %.tmp5333)
%.tmp5335 = icmp eq i32 %.tmp5334, 0
br i1 %.tmp5335, label %.if.true.5336, label %.if.false.5336
.if.true.5336:
%.tmp5338 = getelementptr [8 x i8], [8 x i8]*@.str5337, i32 0, i32 0
ret i8* %.tmp5338
br label %.if.end.5336
.if.false.5336:
%.tmp5339 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5340 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5339, i32 0, i32 1
%.tmp5341 = load i8*, i8** %.tmp5340
%.tmp5343 = getelementptr [3 x i8], [3 x i8]*@.str5342, i32 0, i32 0
%.tmp5344 = call i32(i8*,i8*) @strcmp(i8* %.tmp5341, i8* %.tmp5343)
%.tmp5345 = icmp eq i32 %.tmp5344, 0
br i1 %.tmp5345, label %.if.true.5346, label %.if.false.5346
.if.true.5346:
%.tmp5348 = getelementptr [8 x i8], [8 x i8]*@.str5347, i32 0, i32 0
ret i8* %.tmp5348
br label %.if.end.5346
.if.false.5346:
%.tmp5349 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5350 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5349, i32 0, i32 1
%.tmp5351 = load i8*, i8** %.tmp5350
%.tmp5353 = getelementptr [2 x i8], [2 x i8]*@.str5352, i32 0, i32 0
%.tmp5354 = call i32(i8*,i8*) @strcmp(i8* %.tmp5351, i8* %.tmp5353)
%.tmp5355 = icmp eq i32 %.tmp5354, 0
br i1 %.tmp5355, label %.if.true.5356, label %.if.false.5356
.if.true.5356:
%.tmp5358 = getelementptr [9 x i8], [9 x i8]*@.str5357, i32 0, i32 0
ret i8* %.tmp5358
br label %.if.end.5356
.if.false.5356:
%.tmp5359 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5360 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5359, i32 0, i32 1
%.tmp5361 = load i8*, i8** %.tmp5360
%.tmp5363 = getelementptr [2 x i8], [2 x i8]*@.str5362, i32 0, i32 0
%.tmp5364 = call i32(i8*,i8*) @strcmp(i8* %.tmp5361, i8* %.tmp5363)
%.tmp5365 = icmp eq i32 %.tmp5364, 0
br i1 %.tmp5365, label %.if.true.5366, label %.if.false.5366
.if.true.5366:
%.tmp5368 = getelementptr [9 x i8], [9 x i8]*@.str5367, i32 0, i32 0
ret i8* %.tmp5368
br label %.if.end.5366
.if.false.5366:
%.tmp5369 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5370 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5369, i32 0, i32 1
%.tmp5371 = load i8*, i8** %.tmp5370
%.tmp5373 = getelementptr [2 x i8], [2 x i8]*@.str5372, i32 0, i32 0
%.tmp5374 = call i32(i8*,i8*) @strcmp(i8* %.tmp5371, i8* %.tmp5373)
%.tmp5375 = icmp eq i32 %.tmp5374, 0
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
%.tmp5378 = getelementptr [4 x i8], [4 x i8]*@.str5377, i32 0, i32 0
ret i8* %.tmp5378
br label %.if.end.5376
.if.false.5376:
%.tmp5379 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5380 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5379, i32 0, i32 1
%.tmp5381 = load i8*, i8** %.tmp5380
%.tmp5383 = getelementptr [2 x i8], [2 x i8]*@.str5382, i32 0, i32 0
%.tmp5384 = call i32(i8*,i8*) @strcmp(i8* %.tmp5381, i8* %.tmp5383)
%.tmp5385 = icmp eq i32 %.tmp5384, 0
br i1 %.tmp5385, label %.if.true.5386, label %.if.false.5386
.if.true.5386:
%.tmp5388 = getelementptr [3 x i8], [3 x i8]*@.str5387, i32 0, i32 0
ret i8* %.tmp5388
br label %.if.end.5386
.if.false.5386:
%.tmp5389 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5390 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5389, i32 0, i32 1
%.tmp5391 = load i8*, i8** %.tmp5390
%.tmp5393 = getelementptr [3 x i8], [3 x i8]*@.str5392, i32 0, i32 0
%.tmp5394 = call i32(i8*,i8*) @strcmp(i8* %.tmp5391, i8* %.tmp5393)
%.tmp5395 = icmp eq i32 %.tmp5394, 0
br i1 %.tmp5395, label %.if.true.5396, label %.if.false.5396
.if.true.5396:
%.tmp5398 = getelementptr [9 x i8], [9 x i8]*@.str5397, i32 0, i32 0
ret i8* %.tmp5398
br label %.if.end.5396
.if.false.5396:
%.tmp5399 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5400 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5399, i32 0, i32 1
%.tmp5401 = load i8*, i8** %.tmp5400
%.tmp5403 = getelementptr [3 x i8], [3 x i8]*@.str5402, i32 0, i32 0
%.tmp5404 = call i32(i8*,i8*) @strcmp(i8* %.tmp5401, i8* %.tmp5403)
%.tmp5405 = icmp eq i32 %.tmp5404, 0
br i1 %.tmp5405, label %.if.true.5406, label %.if.false.5406
.if.true.5406:
%.tmp5408 = getelementptr [9 x i8], [9 x i8]*@.str5407, i32 0, i32 0
ret i8* %.tmp5408
br label %.if.end.5406
.if.false.5406:
%.tmp5409 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5410 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5412 = getelementptr [30 x i8], [30 x i8]*@.str5411, i32 0, i32 0
%.tmp5413 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp5409, %m286$.Node.type* %.tmp5410, i8* %.tmp5412)
%.tmp5414 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5415 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5414, i32 0, i32 1
%.tmp5416 = load i8*, i8** %.tmp5415
%.tmp5417 = call i32(i8*,...) @printf(i8* %.tmp5413, i8* %.tmp5416)
br label %.if.end.5406
.if.end.5406:
br label %.if.end.5396
.if.end.5396:
br label %.if.end.5386
.if.end.5386:
br label %.if.end.5376
.if.end.5376:
br label %.if.end.5366
.if.end.5366:
br label %.if.end.5356
.if.end.5356:
br label %.if.end.5346
.if.end.5346:
br label %.if.end.5336
.if.end.5336:
br label %.if.end.5326
.if.end.5326:
br label %.if.end.5316
.if.end.5316:
br label %.if.end.5306
.if.end.5306:
br label %.if.end.5296
.if.end.5296:
%.tmp5419 = getelementptr [4 x i8], [4 x i8]*@.str5418, i32 0, i32 0
ret i8* %.tmp5419
}
define %m1770$.Type.type* @m1770$operator_type.m1770$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5420 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp5420, %m1770$.Type.type** %type
%.tmp5421 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5422 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5421, i32 0, i32 1
%.tmp5423 = load i8*, i8** %.tmp5422
%.tmp5425 = getelementptr [3 x i8], [3 x i8]*@.str5424, i32 0, i32 0
%.tmp5426 = call i32(i8*,i8*) @strcmp(i8* %.tmp5423, i8* %.tmp5425)
%.tmp5427 = icmp eq i32 %.tmp5426, 0
%.tmp5428 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5429 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5428, i32 0, i32 1
%.tmp5430 = load i8*, i8** %.tmp5429
%.tmp5432 = getelementptr [3 x i8], [3 x i8]*@.str5431, i32 0, i32 0
%.tmp5433 = call i32(i8*,i8*) @strcmp(i8* %.tmp5430, i8* %.tmp5432)
%.tmp5434 = icmp eq i32 %.tmp5433, 0
%.tmp5435 = or i1 %.tmp5427, %.tmp5434
%.tmp5436 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5437 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5436, i32 0, i32 1
%.tmp5438 = load i8*, i8** %.tmp5437
%.tmp5440 = getelementptr [2 x i8], [2 x i8]*@.str5439, i32 0, i32 0
%.tmp5441 = call i32(i8*,i8*) @strcmp(i8* %.tmp5438, i8* %.tmp5440)
%.tmp5442 = icmp eq i32 %.tmp5441, 0
%.tmp5443 = or i1 %.tmp5435, %.tmp5442
%.tmp5444 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5445 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5444, i32 0, i32 1
%.tmp5446 = load i8*, i8** %.tmp5445
%.tmp5448 = getelementptr [2 x i8], [2 x i8]*@.str5447, i32 0, i32 0
%.tmp5449 = call i32(i8*,i8*) @strcmp(i8* %.tmp5446, i8* %.tmp5448)
%.tmp5450 = icmp eq i32 %.tmp5449, 0
%.tmp5451 = or i1 %.tmp5443, %.tmp5450
%.tmp5452 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5453 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5452, i32 0, i32 1
%.tmp5454 = load i8*, i8** %.tmp5453
%.tmp5456 = getelementptr [2 x i8], [2 x i8]*@.str5455, i32 0, i32 0
%.tmp5457 = call i32(i8*,i8*) @strcmp(i8* %.tmp5454, i8* %.tmp5456)
%.tmp5458 = icmp eq i32 %.tmp5457, 0
%.tmp5459 = or i1 %.tmp5451, %.tmp5458
%.tmp5460 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5461 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5460, i32 0, i32 1
%.tmp5462 = load i8*, i8** %.tmp5461
%.tmp5464 = getelementptr [2 x i8], [2 x i8]*@.str5463, i32 0, i32 0
%.tmp5465 = call i32(i8*,i8*) @strcmp(i8* %.tmp5462, i8* %.tmp5464)
%.tmp5466 = icmp eq i32 %.tmp5465, 0
%.tmp5467 = or i1 %.tmp5459, %.tmp5466
%.tmp5468 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5469 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5468, i32 0, i32 1
%.tmp5470 = load i8*, i8** %.tmp5469
%.tmp5472 = getelementptr [3 x i8], [3 x i8]*@.str5471, i32 0, i32 0
%.tmp5473 = call i32(i8*,i8*) @strcmp(i8* %.tmp5470, i8* %.tmp5472)
%.tmp5474 = icmp eq i32 %.tmp5473, 0
%.tmp5475 = or i1 %.tmp5467, %.tmp5474
%.tmp5476 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5477 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5476, i32 0, i32 1
%.tmp5478 = load i8*, i8** %.tmp5477
%.tmp5480 = getelementptr [3 x i8], [3 x i8]*@.str5479, i32 0, i32 0
%.tmp5481 = call i32(i8*,i8*) @strcmp(i8* %.tmp5478, i8* %.tmp5480)
%.tmp5482 = icmp eq i32 %.tmp5481, 0
%.tmp5483 = or i1 %.tmp5475, %.tmp5482
br i1 %.tmp5483, label %.if.true.5484, label %.if.false.5484
.if.true.5484:
%.tmp5485 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5486 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5485, i32 0, i32 0
%.tmp5488 = getelementptr [5 x i8], [5 x i8]*@.str5487, i32 0, i32 0
store i8* %.tmp5488, i8** %.tmp5486
br label %.if.end.5484
.if.false.5484:
%.tmp5489 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5490 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5489, i32 0, i32 0
%.tmp5492 = getelementptr [4 x i8], [4 x i8]*@.str5491, i32 0, i32 0
store i8* %.tmp5492, i8** %.tmp5490
br label %.if.end.5484
.if.end.5484:
%.tmp5493 = load %m1770$.Type.type*, %m1770$.Type.type** %type
ret %m1770$.Type.type* %.tmp5493
}
define %m1770$.AssignableInfo.type* @m1770$compile_mono_assignable.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5494 = bitcast ptr null to %m1770$.AssignableInfo.type*
%assignable_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5494, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5495 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5495, %m286$.Node.type** %mono
%err_buf = alloca i8*
%buf = alloca i8*
%.tmp5496 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5497 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5496, i32 0, i32 6
%.tmp5498 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5497
%.tmp5499 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5498, i32 0, i32 0
%.tmp5500 = load i8*, i8** %.tmp5499
%.tmp5502 = getelementptr [7 x i8], [7 x i8]*@.str5501, i32 0, i32 0
%.tmp5503 = call i32(i8*,i8*) @strcmp(i8* %.tmp5500, i8* %.tmp5502)
%.tmp5504 = icmp eq i32 %.tmp5503, 0
br i1 %.tmp5504, label %.if.true.5505, label %.if.false.5505
.if.true.5505:
%.tmp5506 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5507 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5506)
store %m1770$.AssignableInfo.type* %.tmp5507, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5508 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5509 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5508, i32 0, i32 3
%.tmp5510 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5510, %m1770$.Type.type** %.tmp5509
%.tmp5511 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5512 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5511, i32 0, i32 3
%.tmp5513 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5512
%.tmp5514 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5513, i32 0, i32 0
%.tmp5516 = getelementptr [4 x i8], [4 x i8]*@.str5515, i32 0, i32 0
store i8* %.tmp5516, i8** %.tmp5514
%.tmp5517 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5518 = load i8, i8* @SCOPE_CONST
%.tmp5519 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5520 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5519, i32 0, i32 6
%.tmp5521 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5520
%.tmp5522 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5521, i32 0, i32 1
%.tmp5523 = load i8*, i8** %.tmp5522
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp5517, i8 %.tmp5518, i8* %.tmp5523)
br label %.if.end.5505
.if.false.5505:
%.tmp5524 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5525 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5524, i32 0, i32 6
%.tmp5526 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5525
%.tmp5527 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5526, i32 0, i32 0
%.tmp5528 = load i8*, i8** %.tmp5527
%.tmp5530 = getelementptr [5 x i8], [5 x i8]*@.str5529, i32 0, i32 0
%.tmp5531 = call i32(i8*,i8*) @strcmp(i8* %.tmp5528, i8* %.tmp5530)
%.tmp5532 = icmp eq i32 %.tmp5531, 0
br i1 %.tmp5532, label %.if.true.5533, label %.if.false.5533
.if.true.5533:
%.tmp5534 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5535 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5534, i32 0, i32 6
%.tmp5536 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5535
%.tmp5537 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5536, i32 0, i32 1
%.tmp5538 = load i8*, i8** %.tmp5537
%.tmp5540 = getelementptr [5 x i8], [5 x i8]*@.str5539, i32 0, i32 0
%.tmp5541 = call i32(i8*,i8*) @strcmp(i8* %.tmp5538, i8* %.tmp5540)
%.tmp5542 = icmp ne i32 %.tmp5541, 0
br i1 %.tmp5542, label %.if.true.5543, label %.if.false.5543
.if.true.5543:
%.tmp5544 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5545 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5547 = getelementptr [42 x i8], [42 x i8]*@.str5546, i32 0, i32 0
%.tmp5548 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp5544, %m286$.Node.type* %.tmp5545, i8* %.tmp5547)
%.tmp5549 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5550 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5549, i32 0, i32 6
%.tmp5551 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5550
%.tmp5552 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5551, i32 0, i32 1
%.tmp5553 = load i8*, i8** %.tmp5552
%.tmp5554 = call i32(i8*,...) @printf(i8* %.tmp5548, i8* %.tmp5553)
%.tmp5555 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp5555
br label %.if.end.5543
.if.false.5543:
br label %.if.end.5543
.if.end.5543:
%.tmp5556 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5557 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5556)
store %m1770$.AssignableInfo.type* %.tmp5557, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5558 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5559 = load i8, i8* @SCOPE_CONST
%.tmp5561 = getelementptr [5 x i8], [5 x i8]*@.str5560, i32 0, i32 0
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp5558, i8 %.tmp5559, i8* %.tmp5561)
%.tmp5562 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5563 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5562, i32 0, i32 3
%.tmp5564 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5564, %m1770$.Type.type** %.tmp5563
%.tmp5565 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5566 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5565, i32 0, i32 3
%.tmp5567 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5566
%.tmp5568 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5567, i32 0, i32 0
%.tmp5570 = getelementptr [8 x i8], [8 x i8]*@.str5569, i32 0, i32 0
store i8* %.tmp5570, i8** %.tmp5568
br label %.if.end.5533
.if.false.5533:
%.tmp5571 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5572 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5571, i32 0, i32 6
%.tmp5573 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5572
%.tmp5574 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5573, i32 0, i32 0
%.tmp5575 = load i8*, i8** %.tmp5574
%.tmp5577 = getelementptr [17 x i8], [17 x i8]*@.str5576, i32 0, i32 0
%.tmp5578 = call i32(i8*,i8*) @strcmp(i8* %.tmp5575, i8* %.tmp5577)
%.tmp5579 = icmp eq i32 %.tmp5578, 0
br i1 %.tmp5579, label %.if.true.5580, label %.if.false.5580
.if.true.5580:
%.tmp5581 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5582 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5581)
store %m1770$.AssignableInfo.type* %.tmp5582, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5583 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5584 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5583, i32 0, i32 6
%.tmp5585 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5584
%.tmp5586 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5585, i32 0, i32 6
%.tmp5587 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5586
%.tmp5589 = getelementptr [12 x i8], [12 x i8]*@.str5588, i32 0, i32 0
%.tmp5590 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5587, i8* %.tmp5589)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5590, %m286$.Node.type** %dest
%.tmp5591 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5592 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5593 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_addr.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp5591, %m286$.Node.type* %.tmp5592)
%var_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5593, %m1770$.AssignableInfo.type** %var_info
%.tmp5594 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %var_info
%.tmp5595 = icmp eq %m1770$.AssignableInfo.type* %.tmp5594, null
br i1 %.tmp5595, label %.if.true.5596, label %.if.false.5596
.if.true.5596:
%.tmp5597 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
ret %m1770$.AssignableInfo.type* %.tmp5597
br label %.if.end.5596
.if.false.5596:
br label %.if.end.5596
.if.end.5596:
%.tmp5598 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5599 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %var_info
%.tmp5600 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5599, i32 0, i32 3
%.tmp5601 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5600
%.tmp5602 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5598, %m1770$.Type.type* %.tmp5601)
%var_type_repr = alloca i8*
store i8* %.tmp5602, i8** %var_type_repr
%.tmp5603 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5604 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp5603, %m1770$.AssignableInfo.type* %.tmp5604)
%.tmp5605 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5606 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5605, i32 0, i32 3
%.tmp5607 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %var_info
%.tmp5608 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5607, i32 0, i32 3
%.tmp5609 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5608
store %m1770$.Type.type* %.tmp5609, %m1770$.Type.type** %.tmp5606
%.tmp5611 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5612 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5611, i32 0, i32 6
%.tmp5613 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5612
%.tmp5614 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5613, i32 0, i32 6
%.tmp5615 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5614
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5615, %m286$.Node.type** %ptr
br label %.for.start.5610
.for.start.5610:
%.tmp5616 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5617 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5618 = icmp ne %m286$.Node.type* %.tmp5616, %.tmp5617
br i1 %.tmp5618, label %.for.continue.5610, label %.for.end.5610
.for.continue.5610:
%.tmp5619 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp5619, %m1770$.Type.type** %type
%.tmp5620 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5621 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5620, i32 0, i32 3
%.tmp5622 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5623 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5622, i32 0, i32 3
%.tmp5624 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5623
store %m1770$.Type.type* %.tmp5624, %m1770$.Type.type** %.tmp5621
%.tmp5625 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5626 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5625, i32 0, i32 0
%.tmp5628 = getelementptr [4 x i8], [4 x i8]*@.str5627, i32 0, i32 0
store i8* %.tmp5628, i8** %.tmp5626
%.tmp5629 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5630 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5629, i32 0, i32 3
%.tmp5631 = load %m1770$.Type.type*, %m1770$.Type.type** %type
store %m1770$.Type.type* %.tmp5631, %m1770$.Type.type** %.tmp5630
%.tmp5632 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5633 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5632, i32 0, i32 7
%.tmp5634 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5633
store %m286$.Node.type* %.tmp5634, %m286$.Node.type** %ptr
br label %.for.start.5610
.for.end.5610:
%.tmp5635 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5636 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5635, i32 0, i32 6
%.tmp5637 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5636
%.tmp5638 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5637, i32 0, i32 6
%.tmp5639 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5638
%.tmp5640 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5641 = icmp ne %m286$.Node.type* %.tmp5639, %.tmp5640
br i1 %.tmp5641, label %.if.true.5642, label %.if.false.5642
.if.true.5642:
%.tmp5643 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5644 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5643, i32 0, i32 1
%.tmp5645 = load %m0$.File.type*, %m0$.File.type** %.tmp5644
%.tmp5647 = getelementptr [38 x i8], [38 x i8]*@.str5646, i32 0, i32 0
%.tmp5648 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5649 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5648)
%.tmp5650 = load i8*, i8** %var_type_repr
%.tmp5651 = load i8*, i8** %var_type_repr
%.tmp5652 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %var_info
%.tmp5653 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5652)
%.tmp5654 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5645, i8* %.tmp5647, i8* %.tmp5649, i8* %.tmp5650, i8* %.tmp5651, i8* %.tmp5653)
br label %.if.end.5642
.if.false.5642:
%.tmp5655 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5656 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5655, i32 0, i32 1
%.tmp5657 = load %m0$.File.type*, %m0$.File.type** %.tmp5656
%.tmp5659 = getelementptr [22 x i8], [22 x i8]*@.str5658, i32 0, i32 0
%.tmp5660 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5661 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5660)
%.tmp5662 = load i8*, i8** %var_type_repr
%.tmp5663 = load i8*, i8** %var_type_repr
%.tmp5664 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %var_info
%.tmp5665 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5664)
%.tmp5666 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5657, i8* %.tmp5659, i8* %.tmp5661, i8* %.tmp5662, i8* %.tmp5663, i8* %.tmp5665)
br label %.if.end.5642
.if.end.5642:
br label %.if.end.5580
.if.false.5580:
%.tmp5667 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5668 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5667, i32 0, i32 6
%.tmp5669 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5668
%.tmp5670 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5669, i32 0, i32 0
%.tmp5671 = load i8*, i8** %.tmp5670
%.tmp5673 = getelementptr [8 x i8], [8 x i8]*@.str5672, i32 0, i32 0
%.tmp5674 = call i32(i8*,i8*) @strcmp(i8* %.tmp5671, i8* %.tmp5673)
%.tmp5675 = icmp eq i32 %.tmp5674, 0
br i1 %.tmp5675, label %.if.true.5676, label %.if.false.5676
.if.true.5676:
%.tmp5677 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5678 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5677)
store %m1770$.AssignableInfo.type* %.tmp5678, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5679 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5680 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5679, i32 0, i32 3
%.tmp5681 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5681, %m1770$.Type.type** %.tmp5680
%.tmp5682 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5683 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5682, i32 0, i32 3
%.tmp5684 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5683
%.tmp5685 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5684, i32 0, i32 0
%.tmp5687 = getelementptr [5 x i8], [5 x i8]*@.str5686, i32 0, i32 0
store i8* %.tmp5687, i8** %.tmp5685
%.tmp5688 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5689 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5688, i32 0, i32 6
%.tmp5690 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5689
%.tmp5691 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5690, i32 0, i32 6
%.tmp5692 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5691
%.tmp5693 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5692, i32 0, i32 1
%.tmp5694 = load i8*, i8** %.tmp5693
%.tmp5696 = getelementptr [6 x i8], [6 x i8]*@.str5695, i32 0, i32 0
%.tmp5697 = call i32(i8*,i8*) @strcmp(i8* %.tmp5694, i8* %.tmp5696)
%.tmp5698 = icmp eq i32 %.tmp5697, 0
br i1 %.tmp5698, label %.if.true.5699, label %.if.false.5699
.if.true.5699:
%.tmp5700 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5701 = load i8, i8* @SCOPE_CONST
%.tmp5703 = getelementptr [2 x i8], [2 x i8]*@.str5702, i32 0, i32 0
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp5700, i8 %.tmp5701, i8* %.tmp5703)
br label %.if.end.5699
.if.false.5699:
%.tmp5704 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5705 = load i8, i8* @SCOPE_CONST
%.tmp5707 = getelementptr [2 x i8], [2 x i8]*@.str5706, i32 0, i32 0
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp5704, i8 %.tmp5705, i8* %.tmp5707)
br label %.if.end.5699
.if.end.5699:
br label %.if.end.5676
.if.false.5676:
%.tmp5708 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5709 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5708, i32 0, i32 6
%.tmp5710 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5709
%.tmp5711 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5710, i32 0, i32 0
%.tmp5712 = load i8*, i8** %.tmp5711
%.tmp5714 = getelementptr [8 x i8], [8 x i8]*@.str5713, i32 0, i32 0
%.tmp5715 = call i32(i8*,i8*) @strcmp(i8* %.tmp5712, i8* %.tmp5714)
%.tmp5716 = icmp eq i32 %.tmp5715, 0
br i1 %.tmp5716, label %.if.true.5717, label %.if.false.5717
.if.true.5717:
%.tmp5718 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5719 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5720 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5719, i32 0, i32 6
%.tmp5721 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5720
%.tmp5722 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5721, i32 0, i32 6
%.tmp5723 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5722
%.tmp5724 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$compile_fn_call.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp5718, %m286$.Node.type* %.tmp5723)
store %m1770$.AssignableInfo.type* %.tmp5724, %m1770$.AssignableInfo.type** %assignable_info
br label %.if.end.5717
.if.false.5717:
%.tmp5725 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5726 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5725, i32 0, i32 6
%.tmp5727 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5726
%.tmp5728 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5727, i32 0, i32 0
%.tmp5729 = load i8*, i8** %.tmp5728
%.tmp5731 = getelementptr [7 x i8], [7 x i8]*@.str5730, i32 0, i32 0
%.tmp5732 = call i32(i8*,i8*) @strcmp(i8* %.tmp5729, i8* %.tmp5731)
%.tmp5733 = icmp eq i32 %.tmp5732, 0
br i1 %.tmp5733, label %.if.true.5734, label %.if.false.5734
.if.true.5734:
%.tmp5735 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5736 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5737 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5736, i32 0, i32 6
%.tmp5738 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5737
%.tmp5739 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5738, i32 0, i32 1
%.tmp5740 = load i8*, i8** %.tmp5739
%.tmp5741 = call %m1770$.AssignableInfo.type*(%m1770$.CompilerCtx.type*,i8*) @m1770$define_string.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.tmp5735, i8* %.tmp5740)
%string_info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5741, %m1770$.AssignableInfo.type** %string_info
%.tmp5742 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5743 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5742)
store %m1770$.AssignableInfo.type* %.tmp5743, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5744 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5745 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
call void(%m1770$.CompilerCtx.type*,%m1770$.AssignableInfo.type*) @m1770$set_assignable_tmp_id.v.m1770$.CompilerCtx.typep.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp5744, %m1770$.AssignableInfo.type* %.tmp5745)
%.tmp5746 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5747 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %string_info
%.tmp5748 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5747, i32 0, i32 3
%.tmp5749 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5748
%.tmp5750 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp5746, %m1770$.Type.type* %.tmp5749)
%str_tr = alloca i8*
store i8* %.tmp5750, i8** %str_tr
%.tmp5751 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5752 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp5751, i32 0, i32 1
%.tmp5753 = load %m0$.File.type*, %m0$.File.type** %.tmp5752
%.tmp5755 = getelementptr [44 x i8], [44 x i8]*@.str5754, i32 0, i32 0
%.tmp5756 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5757 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5756)
%.tmp5758 = load i8*, i8** %str_tr
%.tmp5759 = load i8*, i8** %str_tr
%.tmp5760 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %string_info
%.tmp5761 = call i8*(%m1770$.AssignableInfo.type*) @m1770$repr_assignable_id.cp.m1770$.AssignableInfo.typep(%m1770$.AssignableInfo.type* %.tmp5760)
%.tmp5762 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5753, i8* %.tmp5755, i8* %.tmp5757, i8* %.tmp5758, i8* %.tmp5759, i8* %.tmp5761)
%.tmp5763 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5764 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5763, i32 0, i32 3
%.tmp5765 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5765, %m1770$.Type.type** %.tmp5764
%.tmp5766 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5767 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5766, i32 0, i32 3
%.tmp5768 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5767
%.tmp5769 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5768, i32 0, i32 0
%.tmp5771 = getelementptr [4 x i8], [4 x i8]*@.str5770, i32 0, i32 0
store i8* %.tmp5771, i8** %.tmp5769
%.tmp5772 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5773 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5772, i32 0, i32 3
%.tmp5774 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5773
%.tmp5775 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5774, i32 0, i32 3
%.tmp5776 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5776, %m1770$.Type.type** %.tmp5775
%.tmp5777 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5778 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5777, i32 0, i32 3
%.tmp5779 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5778
%.tmp5780 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5779, i32 0, i32 3
%.tmp5781 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5780
%.tmp5782 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5781, i32 0, i32 0
%.tmp5784 = getelementptr [4 x i8], [4 x i8]*@.str5783, i32 0, i32 0
store i8* %.tmp5784, i8** %.tmp5782
br label %.if.end.5734
.if.false.5734:
%.tmp5785 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5786 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5785, i32 0, i32 6
%.tmp5787 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5786
%.tmp5788 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5787, i32 0, i32 0
%.tmp5789 = load i8*, i8** %.tmp5788
%.tmp5791 = getelementptr [4 x i8], [4 x i8]*@.str5790, i32 0, i32 0
%.tmp5792 = call i32(i8*,i8*) @strcmp(i8* %.tmp5789, i8* %.tmp5791)
%.tmp5793 = icmp eq i32 %.tmp5792, 0
br i1 %.tmp5793, label %.if.true.5794, label %.if.false.5794
.if.true.5794:
%.tmp5795 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5796 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5795)
store %m1770$.AssignableInfo.type* %.tmp5796, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5797 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5798 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5797, i32 0, i32 6
%.tmp5799 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5798
%.tmp5800 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5799, i32 0, i32 1
%.tmp5801 = load i8*, i8** %.tmp5800
%.tmp5802 = call i32(i8*) @strlen(i8* %.tmp5801)
%chr_len = alloca i32
store i32 %.tmp5802, i32* %chr_len
%.tmp5803 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5804 = load i8, i8* @SCOPE_CONST
%.tmp5806 = getelementptr [2 x i8], [2 x i8]*@.str5805, i32 0, i32 0
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp5803, i8 %.tmp5804, i8* %.tmp5806)
%.tmp5807 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5808 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5807, i32 0, i32 0
%.tmp5809 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5810 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5809, i32 0, i32 6
%.tmp5811 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5810
%.tmp5812 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5811, i32 0, i32 1
%.tmp5813 = load i8*, i8** %.tmp5812
%.tmp5814 = call i8*(i8*) @m2116$chr_to_llvm.cp.cp(i8* %.tmp5813)
store i8* %.tmp5814, i8** %.tmp5808
%.tmp5815 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5816 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5815, i32 0, i32 0
%.tmp5817 = load i8*, i8** %.tmp5816
%.tmp5818 = icmp eq i8* %.tmp5817, null
br i1 %.tmp5818, label %.if.true.5819, label %.if.false.5819
.if.true.5819:
%.tmp5820 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp5822 = getelementptr [22 x i8], [22 x i8]*@.str5821, i32 0, i32 0
%.tmp5823 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5824 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5823, i32 0, i32 6
%.tmp5825 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5824
%.tmp5826 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5825, i32 0, i32 1
%.tmp5827 = load i8*, i8** %.tmp5826
%.tmp5828 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5820, i8* %.tmp5822, i8* %.tmp5827)
%.tmp5829 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp5829
br label %.if.end.5819
.if.false.5819:
br label %.if.end.5819
.if.end.5819:
%.tmp5830 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5831 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5830, i32 0, i32 3
%.tmp5832 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5832, %m1770$.Type.type** %.tmp5831
%.tmp5833 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5834 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5833, i32 0, i32 3
%.tmp5835 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5834
%.tmp5836 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5835, i32 0, i32 0
%.tmp5838 = getelementptr [4 x i8], [4 x i8]*@.str5837, i32 0, i32 0
store i8* %.tmp5838, i8** %.tmp5836
br label %.if.end.5794
.if.false.5794:
%.tmp5839 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5840 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5842 = getelementptr [40 x i8], [40 x i8]*@.str5841, i32 0, i32 0
%.tmp5843 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp5839, %m286$.Node.type* %.tmp5840, i8* %.tmp5842)
%.tmp5844 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5845 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5844, i32 0, i32 6
%.tmp5846 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5845
%.tmp5847 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5846, i32 0, i32 0
%.tmp5848 = load i8*, i8** %.tmp5847
%.tmp5849 = call i32(i8*,...) @printf(i8* %.tmp5843, i8* %.tmp5848)
%.tmp5850 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp5850
br label %.if.end.5794
.if.end.5794:
br label %.if.end.5734
.if.end.5734:
br label %.if.end.5717
.if.end.5717:
br label %.if.end.5676
.if.end.5676:
br label %.if.end.5580
.if.end.5580:
br label %.if.end.5533
.if.end.5533:
br label %.if.end.5505
.if.end.5505:
%.tmp5851 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5852 = icmp eq %m1770$.AssignableInfo.type* %.tmp5851, null
br i1 %.tmp5852, label %.if.true.5853, label %.if.false.5853
.if.true.5853:
%.tmp5854 = bitcast ptr null to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp5854
br label %.if.end.5853
.if.false.5853:
br label %.if.end.5853
.if.end.5853:
%.tmp5855 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5856 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5855, i32 0, i32 4
%.tmp5857 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5858 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5857, i32 0, i32 3
%.tmp5859 = load i32, i32* %.tmp5858
store i32 %.tmp5859, i32* %.tmp5856
%.tmp5860 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5861 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5860, i32 0, i32 5
%.tmp5862 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5863 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5862, i32 0, i32 4
%.tmp5864 = load i32, i32* %.tmp5863
store i32 %.tmp5864, i32* %.tmp5861
%.tmp5865 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %assignable_info
%.tmp5866 = bitcast %m1770$.AssignableInfo.type* %.tmp5865 to %m1770$.AssignableInfo.type*
ret %m1770$.AssignableInfo.type* %.tmp5866
}
define i8* @m1770$type_abbr.cp.m1770$.Type.typep(%m1770$.Type.type* %.type.arg) {
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.type.arg, %m1770$.Type.type** %type
%.tmp5867 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5868 = icmp ne %m1770$.Type.type* %.tmp5867, null
%.tmp5870 = getelementptr [22 x i8], [22 x i8]*@.str5869, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5868, i8* %.tmp5870)
%.tmp5871 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5872 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5871, i32 0, i32 0
%.tmp5873 = load i8*, i8** %.tmp5872
%.tmp5874 = icmp ne i8* %.tmp5873, null
%.tmp5876 = getelementptr [59 x i8], [59 x i8]*@.str5875, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5874, i8* %.tmp5876)
%.tmp5877 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5878 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5877, i32 0, i32 0
%.tmp5879 = load i8*, i8** %.tmp5878
%.tmp5881 = getelementptr [4 x i8], [4 x i8]*@.str5880, i32 0, i32 0
%.tmp5882 = call i32(i8*,i8*) @strcmp(i8* %.tmp5879, i8* %.tmp5881)
%.tmp5883 = icmp eq i32 %.tmp5882, 0
br i1 %.tmp5883, label %.if.true.5884, label %.if.false.5884
.if.true.5884:
%.tmp5886 = getelementptr [2 x i8], [2 x i8]*@.str5885, i32 0, i32 0
ret i8* %.tmp5886
br label %.if.end.5884
.if.false.5884:
%.tmp5887 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5888 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5887, i32 0, i32 0
%.tmp5889 = load i8*, i8** %.tmp5888
%.tmp5891 = getelementptr [5 x i8], [5 x i8]*@.str5890, i32 0, i32 0
%.tmp5892 = call i32(i8*,i8*) @strcmp(i8* %.tmp5889, i8* %.tmp5891)
%.tmp5893 = icmp eq i32 %.tmp5892, 0
br i1 %.tmp5893, label %.if.true.5894, label %.if.false.5894
.if.true.5894:
%.tmp5896 = getelementptr [2 x i8], [2 x i8]*@.str5895, i32 0, i32 0
ret i8* %.tmp5896
br label %.if.end.5894
.if.false.5894:
%.tmp5897 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5898 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5897, i32 0, i32 0
%.tmp5899 = load i8*, i8** %.tmp5898
%.tmp5901 = getelementptr [5 x i8], [5 x i8]*@.str5900, i32 0, i32 0
%.tmp5902 = call i32(i8*,i8*) @strcmp(i8* %.tmp5899, i8* %.tmp5901)
%.tmp5903 = icmp eq i32 %.tmp5902, 0
br i1 %.tmp5903, label %.if.true.5904, label %.if.false.5904
.if.true.5904:
%.tmp5906 = getelementptr [2 x i8], [2 x i8]*@.str5905, i32 0, i32 0
ret i8* %.tmp5906
br label %.if.end.5904
.if.false.5904:
%.tmp5907 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5908 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5907, i32 0, i32 0
%.tmp5909 = load i8*, i8** %.tmp5908
%.tmp5911 = getelementptr [4 x i8], [4 x i8]*@.str5910, i32 0, i32 0
%.tmp5912 = call i32(i8*,i8*) @strcmp(i8* %.tmp5909, i8* %.tmp5911)
%.tmp5913 = icmp eq i32 %.tmp5912, 0
br i1 %.tmp5913, label %.if.true.5914, label %.if.false.5914
.if.true.5914:
%.tmp5916 = getelementptr [2 x i8], [2 x i8]*@.str5915, i32 0, i32 0
ret i8* %.tmp5916
br label %.if.end.5914
.if.false.5914:
%.tmp5917 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5918 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5917, i32 0, i32 0
%.tmp5919 = load i8*, i8** %.tmp5918
%.tmp5921 = getelementptr [4 x i8], [4 x i8]*@.str5920, i32 0, i32 0
%.tmp5922 = call i32(i8*,i8*) @strcmp(i8* %.tmp5919, i8* %.tmp5921)
%.tmp5923 = icmp eq i32 %.tmp5922, 0
br i1 %.tmp5923, label %.if.true.5924, label %.if.false.5924
.if.true.5924:
%.tmp5926 = getelementptr [3 x i8], [3 x i8]*@.str5925, i32 0, i32 0
ret i8* %.tmp5926
br label %.if.end.5924
.if.false.5924:
%.tmp5927 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5928 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5927, i32 0, i32 0
%.tmp5929 = load i8*, i8** %.tmp5928
%.tmp5931 = getelementptr [4 x i8], [4 x i8]*@.str5930, i32 0, i32 0
%.tmp5932 = call i32(i8*,i8*) @strcmp(i8* %.tmp5929, i8* %.tmp5931)
%.tmp5933 = icmp eq i32 %.tmp5932, 0
br i1 %.tmp5933, label %.if.true.5934, label %.if.false.5934
.if.true.5934:
%buf = alloca i8*
%.tmp5935 = getelementptr i8*, i8** %buf, i32 0
%.tmp5937 = getelementptr [4 x i8], [4 x i8]*@.str5936, i32 0, i32 0
%.tmp5938 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5939 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5938, i32 0, i32 3
%.tmp5940 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5939
%.tmp5941 = call i8*(%m1770$.Type.type*) @m1770$type_abbr.cp.m1770$.Type.typep(%m1770$.Type.type* %.tmp5940)
%.tmp5942 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5935, i8* %.tmp5937, i8* %.tmp5941)
%.tmp5943 = load i8*, i8** %buf
ret i8* %.tmp5943
br label %.if.end.5934
.if.false.5934:
%.tmp5944 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5945 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5944, i32 0, i32 0
%.tmp5946 = load i8*, i8** %.tmp5945
%.tmp5948 = getelementptr [10 x i8], [10 x i8]*@.str5947, i32 0, i32 0
%.tmp5949 = call i32(i8*,i8*) @strcmp(i8* %.tmp5946, i8* %.tmp5948)
%.tmp5950 = icmp eq i32 %.tmp5949, 0
br i1 %.tmp5950, label %.if.true.5951, label %.if.false.5951
.if.true.5951:
%.tmp5952 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5953 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5952, i32 0, i32 2
%.tmp5954 = load i8*, i8** %.tmp5953
ret i8* %.tmp5954
br label %.if.end.5951
.if.false.5951:
%.tmp5955 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5956 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5955, i32 0, i32 0
%.tmp5957 = load i8*, i8** %.tmp5956
%.tmp5959 = getelementptr [6 x i8], [6 x i8]*@.str5958, i32 0, i32 0
%.tmp5960 = call i32(i8*,i8*) @strcmp(i8* %.tmp5957, i8* %.tmp5959)
%.tmp5961 = icmp eq i32 %.tmp5960, 0
br i1 %.tmp5961, label %.if.true.5962, label %.if.false.5962
.if.true.5962:
%.tmp5964 = getelementptr [2 x i8], [2 x i8]*@.str5963, i32 0, i32 0
ret i8* %.tmp5964
br label %.if.end.5962
.if.false.5962:
%.tmp5966 = getelementptr [44 x i8], [44 x i8]*@.str5965, i32 0, i32 0
%.tmp5967 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp5968 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5967, i32 0, i32 0
%.tmp5969 = load i8*, i8** %.tmp5968
%.tmp5970 = call i32(i8*,...) @printf(i8* %.tmp5966, i8* %.tmp5969)
br label %.if.end.5962
.if.end.5962:
br label %.if.end.5951
.if.end.5951:
br label %.if.end.5934
.if.end.5934:
br label %.if.end.5924
.if.end.5924:
br label %.if.end.5914
.if.end.5914:
br label %.if.end.5904
.if.end.5904:
br label %.if.end.5894
.if.end.5894:
br label %.if.end.5884
.if.end.5884:
%.tmp5971 = bitcast ptr null to i8*
ret i8* %.tmp5971
}
define %m1770$.AssignableInfo.type* @m1770$define_string.m1770$.AssignableInfo.typep.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp5972 = bitcast ptr null to %m286$.Node.type*
%.tmp5973 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5972)
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp5973, %m1770$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp5974 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp5976 = getelementptr [7 x i8], [7 x i8]*@.str5975, i32 0, i32 0
%.tmp5977 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp5978 = call i32(%m1770$.CompilerCtx.type*) @m1770$new_uid.i.m1770$.CompilerCtx.typep(%m1770$.CompilerCtx.type* %.tmp5977)
%.tmp5979 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5974, i8* %.tmp5976, i32 %.tmp5978)
%.tmp5980 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5981 = load i8, i8* @SCOPE_GLOBAL
%.tmp5982 = load i8*, i8** %tmp_buff
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp5980, i8 %.tmp5981, i8* %.tmp5982)
%.tmp5983 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* null, i32 1
%.tmp5984 = ptrtoint %m1770$.GlobalName.type* %.tmp5983 to i32
%.tmp5985 = call i8*(i32) @malloc(i32 %.tmp5984)
%.tmp5986 = bitcast i8* %.tmp5985 to %m1770$.GlobalName.type*
%global = alloca %m1770$.GlobalName.type*
store %m1770$.GlobalName.type* %.tmp5986, %m1770$.GlobalName.type** %global
%.tmp5987 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
%.tmp5988 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp5987, i32 0, i32 0
%.tmp5989 = load i8*, i8** %text
%.tmp5990 = call i8*(i8*) @m2116$string_to_llvm.cp.cp(i8* %.tmp5989)
store i8* %.tmp5990, i8** %.tmp5988
%.tmp5991 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5992 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5991, i32 0, i32 3
%.tmp5993 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp5993, %m1770$.Type.type** %.tmp5992
%.tmp5994 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp5995 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp5994, i32 0, i32 3
%.tmp5996 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp5995
%.tmp5997 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp5996, i32 0, i32 0
%.tmp5999 = getelementptr [6 x i8], [6 x i8]*@.str5998, i32 0, i32 0
store i8* %.tmp5999, i8** %.tmp5997
%.tmp6000 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6001 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6000, i32 0, i32 3
%.tmp6002 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6001
%.tmp6003 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6002, i32 0, i32 3
%.tmp6004 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp6004, %m1770$.Type.type** %.tmp6003
%.tmp6005 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6006 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6005, i32 0, i32 3
%.tmp6007 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6006
%.tmp6008 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6007, i32 0, i32 3
%.tmp6009 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6008
%.tmp6010 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6009, i32 0, i32 0
%.tmp6012 = getelementptr [4 x i8], [4 x i8]*@.str6011, i32 0, i32 0
store i8* %.tmp6012, i8** %.tmp6010
%.tmp6013 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6014 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6013, i32 0, i32 3
%.tmp6015 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6014
%.tmp6016 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6015, i32 0, i32 3
%.tmp6017 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6016
%.tmp6018 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6017, i32 0, i32 4
%.tmp6019 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
store %m1770$.Type.type* %.tmp6019, %m1770$.Type.type** %.tmp6018
%.tmp6020 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6021 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6020, i32 0, i32 3
%.tmp6022 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6021
%.tmp6023 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6022, i32 0, i32 3
%.tmp6024 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6023
%.tmp6025 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6024, i32 0, i32 4
%.tmp6026 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6025
%.tmp6027 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6026, i32 0, i32 0
%.tmp6028 = getelementptr i8*, i8** %.tmp6027, i32 0
%.tmp6030 = getelementptr [3 x i8], [3 x i8]*@.str6029, i32 0, i32 0
%.tmp6031 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
%.tmp6032 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6031, i32 0, i32 0
%.tmp6033 = load i8*, i8** %.tmp6032
%.tmp6034 = call i32(i8*) @m2116$llvm_str_len.i.cp(i8* %.tmp6033)
%.tmp6035 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6028, i8* %.tmp6030, i32 %.tmp6034)
%.tmp6036 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
%.tmp6037 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6036, i32 0, i32 1
%.tmp6039 = getelementptr [7 x i8], [7 x i8]*@.str6038, i32 0, i32 0
store i8* %.tmp6039, i8** %.tmp6037
%.tmp6040 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
%.tmp6041 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6040, i32 0, i32 4
store %m1770$.GlobalName.type* null, %m1770$.GlobalName.type** %.tmp6041
%.tmp6042 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
%.tmp6043 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6042, i32 0, i32 3
%.tmp6044 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
store %m1770$.AssignableInfo.type* %.tmp6044, %m1770$.AssignableInfo.type** %.tmp6043
%.tmp6045 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
%.tmp6046 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6045, i32 0, i32 2
store i1 0, i1* %.tmp6046
%.tmp6047 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6048 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %global
call void(%m1770$.CompilerCtx.type*,%m1770$.GlobalName.type*) @m1770$append_global.v.m1770$.CompilerCtx.typep.m1770$.GlobalName.typep(%m1770$.CompilerCtx.type* %.tmp6047, %m1770$.GlobalName.type* %.tmp6048)
%.tmp6049 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
ret %m1770$.AssignableInfo.type* %.tmp6049
}
define void @m1770$define_module.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%mod = alloca %m286$.Node.type*
store %m286$.Node.type* %.mod.arg, %m286$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp6050 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp6051 = call %m1770$.AssignableInfo.type*(%m286$.Node.type*) @m1770$new_assignable_info.m1770$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6050)
%info = alloca %m1770$.AssignableInfo.type*
store %m1770$.AssignableInfo.type* %.tmp6051, %m1770$.AssignableInfo.type** %info
%.tmp6052 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6053 = load i8, i8* @SCOPE_CONST
%.tmp6054 = load i8*, i8** %abspath
call void(%m1770$.AssignableInfo.type*,i8,i8*) @m1770$set_assignable_id.v.m1770$.AssignableInfo.typep.c.cp(%m1770$.AssignableInfo.type* %.tmp6052, i8 %.tmp6053, i8* %.tmp6054)
%.tmp6055 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6056 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6055, i32 0, i32 2
%.tmp6058 = getelementptr [7 x i8], [7 x i8]*@.str6057, i32 0, i32 0
store i8* %.tmp6058, i8** %.tmp6056
%.tmp6059 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
%.tmp6060 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6059, i32 0, i32 3
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp6060
%.tmp6061 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6062 = load i8*, i8** %as_name
%.tmp6063 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %info
call void(%m1770$.CompilerCtx.type*,i8*,%m1770$.AssignableInfo.type*) @m1770$define_assignable.v.m1770$.CompilerCtx.typep.cp.m1770$.AssignableInfo.typep(%m1770$.CompilerCtx.type* %.tmp6061, i8* %.tmp6062, %m1770$.AssignableInfo.type* %.tmp6063)
ret void
}
define void @m1770$append_global.v.m1770$.CompilerCtx.typep.m1770$.GlobalName.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%g = alloca %m1770$.GlobalName.type*
store %m1770$.GlobalName.type* %.g.arg, %m1770$.GlobalName.type** %g
%.tmp6064 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6065 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6064, i32 0, i32 3
%.tmp6066 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %.tmp6065
%.tmp6067 = icmp eq %m1770$.GlobalName.type* %.tmp6066, null
br i1 %.tmp6067, label %.if.true.6068, label %.if.false.6068
.if.true.6068:
%.tmp6069 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6070 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6069, i32 0, i32 3
%.tmp6071 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
store %m1770$.GlobalName.type* %.tmp6071, %m1770$.GlobalName.type** %.tmp6070
br label %.if.end.6068
.if.false.6068:
%last_global = alloca %m1770$.GlobalName.type*
%.tmp6073 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6074 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6073, i32 0, i32 3
%.tmp6075 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %.tmp6074
store %m1770$.GlobalName.type* %.tmp6075, %m1770$.GlobalName.type** %last_global
br label %.for.start.6072
.for.start.6072:
%.tmp6076 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %last_global
%.tmp6077 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6076, i32 0, i32 4
%.tmp6078 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %.tmp6077
%.tmp6079 = icmp ne %m1770$.GlobalName.type* %.tmp6078, null
br i1 %.tmp6079, label %.for.continue.6072, label %.for.end.6072
.for.continue.6072:
%.tmp6080 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %last_global
%.tmp6081 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6080, i32 0, i32 4
%.tmp6082 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %.tmp6081
store %m1770$.GlobalName.type* %.tmp6082, %m1770$.GlobalName.type** %last_global
br label %.for.start.6072
.for.end.6072:
%.tmp6083 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %last_global
%.tmp6084 = getelementptr %m1770$.GlobalName.type, %m1770$.GlobalName.type* %.tmp6083, i32 0, i32 4
%.tmp6085 = load %m1770$.GlobalName.type*, %m1770$.GlobalName.type** %g
store %m1770$.GlobalName.type* %.tmp6085, %m1770$.GlobalName.type** %.tmp6084
br label %.if.end.6068
.if.end.6068:
ret void
}
define i8* @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.Type.type* %.type.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.type.arg, %m1770$.Type.type** %type
%.tmp6086 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6087 = icmp eq %m1770$.Type.type* %.tmp6086, null
br i1 %.tmp6087, label %.if.true.6088, label %.if.false.6088
.if.true.6088:
%.tmp6089 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6089, label %.if.true.6090, label %.if.false.6090
.if.true.6090:
%.tmp6092 = getelementptr [44 x i8], [44 x i8]*@.str6091, i32 0, i32 0
%.tmp6093 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6094 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6093, i32 0, i32 6
%.tmp6095 = load i8*, i8** %.tmp6094
%.tmp6096 = call i32(i8*,...) @printf(i8* %.tmp6092, i8* %.tmp6095)
br label %.if.end.6090
.if.false.6090:
br label %.if.end.6090
.if.end.6090:
%.tmp6098 = getelementptr [2 x i8], [2 x i8]*@.str6097, i32 0, i32 0
ret i8* %.tmp6098
br label %.if.end.6088
.if.false.6088:
br label %.if.end.6088
.if.end.6088:
%.tmp6099 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6100 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6099, i32 0, i32 0
%.tmp6101 = load i8*, i8** %.tmp6100
%.tmp6102 = icmp ne i8* %.tmp6101, null
%.tmp6104 = getelementptr [59 x i8], [59 x i8]*@.str6103, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6102, i8* %.tmp6104)
%buf = alloca i8*
%.tmp6105 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6106 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6105, i32 0, i32 0
%.tmp6107 = load i8*, i8** %.tmp6106
%.tmp6109 = getelementptr [4 x i8], [4 x i8]*@.str6108, i32 0, i32 0
%.tmp6110 = call i32(i8*,i8*) @strcmp(i8* %.tmp6107, i8* %.tmp6109)
%.tmp6111 = icmp eq i32 %.tmp6110, 0
br i1 %.tmp6111, label %.if.true.6112, label %.if.false.6112
.if.true.6112:
%.tmp6114 = getelementptr [4 x i8], [4 x i8]*@.str6113, i32 0, i32 0
ret i8* %.tmp6114
br label %.if.end.6112
.if.false.6112:
%.tmp6115 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6116 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6115, i32 0, i32 0
%.tmp6117 = load i8*, i8** %.tmp6116
%.tmp6119 = getelementptr [5 x i8], [5 x i8]*@.str6118, i32 0, i32 0
%.tmp6120 = call i32(i8*,i8*) @strcmp(i8* %.tmp6117, i8* %.tmp6119)
%.tmp6121 = icmp eq i32 %.tmp6120, 0
br i1 %.tmp6121, label %.if.true.6122, label %.if.false.6122
.if.true.6122:
%.tmp6124 = getelementptr [5 x i8], [5 x i8]*@.str6123, i32 0, i32 0
ret i8* %.tmp6124
br label %.if.end.6122
.if.false.6122:
%.tmp6125 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6126 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6125, i32 0, i32 0
%.tmp6127 = load i8*, i8** %.tmp6126
%.tmp6129 = getelementptr [5 x i8], [5 x i8]*@.str6128, i32 0, i32 0
%.tmp6130 = call i32(i8*,i8*) @strcmp(i8* %.tmp6127, i8* %.tmp6129)
%.tmp6131 = icmp eq i32 %.tmp6130, 0
br i1 %.tmp6131, label %.if.true.6132, label %.if.false.6132
.if.true.6132:
%.tmp6134 = getelementptr [3 x i8], [3 x i8]*@.str6133, i32 0, i32 0
ret i8* %.tmp6134
br label %.if.end.6132
.if.false.6132:
%.tmp6135 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6136 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6135, i32 0, i32 0
%.tmp6137 = load i8*, i8** %.tmp6136
%.tmp6139 = getelementptr [8 x i8], [8 x i8]*@.str6138, i32 0, i32 0
%.tmp6140 = call i32(i8*,i8*) @strcmp(i8* %.tmp6137, i8* %.tmp6139)
%.tmp6141 = icmp eq i32 %.tmp6140, 0
br i1 %.tmp6141, label %.if.true.6142, label %.if.false.6142
.if.true.6142:
%.tmp6144 = getelementptr [4 x i8], [4 x i8]*@.str6143, i32 0, i32 0
ret i8* %.tmp6144
br label %.if.end.6142
.if.false.6142:
%.tmp6145 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6146 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6145, i32 0, i32 0
%.tmp6147 = load i8*, i8** %.tmp6146
%.tmp6149 = getelementptr [4 x i8], [4 x i8]*@.str6148, i32 0, i32 0
%.tmp6150 = call i32(i8*,i8*) @strcmp(i8* %.tmp6147, i8* %.tmp6149)
%.tmp6151 = icmp eq i32 %.tmp6150, 0
br i1 %.tmp6151, label %.if.true.6152, label %.if.false.6152
.if.true.6152:
%.tmp6154 = getelementptr [3 x i8], [3 x i8]*@.str6153, i32 0, i32 0
ret i8* %.tmp6154
br label %.if.end.6152
.if.false.6152:
%.tmp6155 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6156 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6155, i32 0, i32 0
%.tmp6157 = load i8*, i8** %.tmp6156
%.tmp6159 = getelementptr [9 x i8], [9 x i8]*@.str6158, i32 0, i32 0
%.tmp6160 = call i32(i8*,i8*) @strcmp(i8* %.tmp6157, i8* %.tmp6159)
%.tmp6161 = icmp eq i32 %.tmp6160, 0
br i1 %.tmp6161, label %.if.true.6162, label %.if.false.6162
.if.true.6162:
%.tmp6163 = getelementptr i8*, i8** %buf, i32 0
%.tmp6165 = getelementptr [4 x i8], [4 x i8]*@.str6164, i32 0, i32 0
%.tmp6166 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6167 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6168 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6167, i32 0, i32 3
%.tmp6169 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6168
%.tmp6170 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp6166, %m1770$.Type.type* %.tmp6169)
%.tmp6171 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6163, i8* %.tmp6165, i8* %.tmp6170)
%.tmp6173 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6174 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6173, i32 0, i32 3
%.tmp6175 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6174
%.tmp6176 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6175, i32 0, i32 4
%.tmp6177 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6176
%p = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6177, %m1770$.Type.type** %p
br label %.for.start.6172
.for.start.6172:
%.tmp6178 = load %m1770$.Type.type*, %m1770$.Type.type** %p
%.tmp6179 = icmp ne %m1770$.Type.type* %.tmp6178, null
br i1 %.tmp6179, label %.for.continue.6172, label %.for.end.6172
.for.continue.6172:
%.tmp6180 = load %m1770$.Type.type*, %m1770$.Type.type** %p
%.tmp6181 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6182 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6181, i32 0, i32 3
%.tmp6183 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6182
%.tmp6184 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6183, i32 0, i32 4
%.tmp6185 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6184
%.tmp6186 = icmp ne %m1770$.Type.type* %.tmp6180, %.tmp6185
br i1 %.tmp6186, label %.if.true.6187, label %.if.false.6187
.if.true.6187:
%.tmp6188 = getelementptr i8*, i8** %buf, i32 0
%.tmp6190 = getelementptr [4 x i8], [4 x i8]*@.str6189, i32 0, i32 0
%.tmp6191 = load i8*, i8** %buf
%.tmp6192 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6188, i8* %.tmp6190, i8* %.tmp6191)
br label %.if.end.6187
.if.false.6187:
br label %.if.end.6187
.if.end.6187:
%.tmp6193 = getelementptr i8*, i8** %buf, i32 0
%.tmp6195 = getelementptr [5 x i8], [5 x i8]*@.str6194, i32 0, i32 0
%.tmp6196 = load i8*, i8** %buf
%.tmp6197 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6198 = load %m1770$.Type.type*, %m1770$.Type.type** %p
%.tmp6199 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp6197, %m1770$.Type.type* %.tmp6198)
%.tmp6200 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6193, i8* %.tmp6195, i8* %.tmp6196, i8* %.tmp6199)
%.tmp6201 = load %m1770$.Type.type*, %m1770$.Type.type** %p
%.tmp6202 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6201, i32 0, i32 4
%.tmp6203 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6202
store %m1770$.Type.type* %.tmp6203, %m1770$.Type.type** %p
br label %.for.start.6172
.for.end.6172:
%.tmp6204 = getelementptr i8*, i8** %buf, i32 0
%.tmp6206 = getelementptr [4 x i8], [4 x i8]*@.str6205, i32 0, i32 0
%.tmp6207 = load i8*, i8** %buf
%.tmp6208 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6204, i8* %.tmp6206, i8* %.tmp6207)
%.tmp6209 = load i8*, i8** %buf
ret i8* %.tmp6209
br label %.if.end.6162
.if.false.6162:
%.tmp6210 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6211 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6210, i32 0, i32 0
%.tmp6212 = load i8*, i8** %.tmp6211
%.tmp6214 = getelementptr [4 x i8], [4 x i8]*@.str6213, i32 0, i32 0
%.tmp6215 = call i32(i8*,i8*) @strcmp(i8* %.tmp6212, i8* %.tmp6214)
%.tmp6216 = icmp eq i32 %.tmp6215, 0
br i1 %.tmp6216, label %.if.true.6217, label %.if.false.6217
.if.true.6217:
%.tmp6218 = getelementptr i8*, i8** %buf, i32 0
%.tmp6220 = getelementptr [4 x i8], [4 x i8]*@.str6219, i32 0, i32 0
%.tmp6221 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6222 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6223 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6222, i32 0, i32 3
%.tmp6224 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6223
%.tmp6225 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp6221, %m1770$.Type.type* %.tmp6224)
%.tmp6226 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6218, i8* %.tmp6220, i8* %.tmp6225)
%.tmp6227 = load i8*, i8** %buf
ret i8* %.tmp6227
br label %.if.end.6217
.if.false.6217:
%.tmp6228 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6229 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6228, i32 0, i32 0
%.tmp6230 = load i8*, i8** %.tmp6229
%.tmp6232 = getelementptr [7 x i8], [7 x i8]*@.str6231, i32 0, i32 0
%.tmp6233 = call i32(i8*,i8*) @strcmp(i8* %.tmp6230, i8* %.tmp6232)
%.tmp6234 = icmp eq i32 %.tmp6233, 0
br i1 %.tmp6234, label %.if.true.6235, label %.if.false.6235
.if.true.6235:
%.tmp6236 = getelementptr i8*, i8** %buf, i32 0
%.tmp6238 = getelementptr [2 x i8], [2 x i8]*@.str6237, i32 0, i32 0
%.tmp6239 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6236, i8* %.tmp6238)
%.tmp6241 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6242 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6241, i32 0, i32 3
%.tmp6243 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6242
%t = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6243, %m1770$.Type.type** %t
br label %.for.start.6240
.for.start.6240:
%.tmp6244 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6245 = icmp ne %m1770$.Type.type* %.tmp6244, null
br i1 %.tmp6245, label %.for.continue.6240, label %.for.end.6240
.for.continue.6240:
%.tmp6246 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6247 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6248 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6247, i32 0, i32 3
%.tmp6249 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6248
%.tmp6250 = icmp ne %m1770$.Type.type* %.tmp6246, %.tmp6249
br i1 %.tmp6250, label %.if.true.6251, label %.if.false.6251
.if.true.6251:
%.tmp6252 = getelementptr i8*, i8** %buf, i32 0
%.tmp6254 = getelementptr [4 x i8], [4 x i8]*@.str6253, i32 0, i32 0
%.tmp6255 = load i8*, i8** %buf
%.tmp6256 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6252, i8* %.tmp6254, i8* %.tmp6255)
br label %.if.end.6251
.if.false.6251:
br label %.if.end.6251
.if.end.6251:
%.tmp6257 = getelementptr i8*, i8** %buf, i32 0
%.tmp6259 = getelementptr [5 x i8], [5 x i8]*@.str6258, i32 0, i32 0
%.tmp6260 = load i8*, i8** %buf
%.tmp6261 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6262 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6263 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp6261, %m1770$.Type.type* %.tmp6262)
%.tmp6264 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6257, i8* %.tmp6259, i8* %.tmp6260, i8* %.tmp6263)
%.tmp6265 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6266 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6265, i32 0, i32 4
%.tmp6267 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6266
store %m1770$.Type.type* %.tmp6267, %m1770$.Type.type** %t
br label %.for.start.6240
.for.end.6240:
%.tmp6268 = getelementptr i8*, i8** %buf, i32 0
%.tmp6270 = getelementptr [4 x i8], [4 x i8]*@.str6269, i32 0, i32 0
%.tmp6271 = load i8*, i8** %buf
%.tmp6272 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6268, i8* %.tmp6270, i8* %.tmp6271)
%.tmp6273 = load i8*, i8** %buf
ret i8* %.tmp6273
br label %.if.end.6235
.if.false.6235:
%.tmp6274 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6275 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6274, i32 0, i32 0
%.tmp6276 = load i8*, i8** %.tmp6275
%.tmp6278 = getelementptr [6 x i8], [6 x i8]*@.str6277, i32 0, i32 0
%.tmp6279 = call i32(i8*,i8*) @strcmp(i8* %.tmp6276, i8* %.tmp6278)
%.tmp6280 = icmp eq i32 %.tmp6279, 0
br i1 %.tmp6280, label %.if.true.6281, label %.if.false.6281
.if.true.6281:
%.tmp6282 = getelementptr i8*, i8** %buf, i32 0
%.tmp6284 = getelementptr [10 x i8], [10 x i8]*@.str6283, i32 0, i32 0
%.tmp6285 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6286 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6285, i32 0, i32 3
%.tmp6287 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6286
%.tmp6288 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6287, i32 0, i32 4
%.tmp6289 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6288
%.tmp6290 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6289, i32 0, i32 0
%.tmp6291 = load i8*, i8** %.tmp6290
%.tmp6292 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6293 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6294 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6293, i32 0, i32 3
%.tmp6295 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6294
%.tmp6296 = call i8*(%m1770$.CompilerCtx.type*,%m1770$.Type.type*) @m1770$type_repr.cp.m1770$.CompilerCtx.typep.m1770$.Type.typep(%m1770$.CompilerCtx.type* %.tmp6292, %m1770$.Type.type* %.tmp6295)
%.tmp6297 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6282, i8* %.tmp6284, i8* %.tmp6291, i8* %.tmp6296)
%.tmp6298 = load i8*, i8** %buf
ret i8* %.tmp6298
br label %.if.end.6281
.if.false.6281:
%.tmp6299 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6300 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6299, i32 0, i32 0
%.tmp6301 = load i8*, i8** %.tmp6300
%.tmp6303 = getelementptr [10 x i8], [10 x i8]*@.str6302, i32 0, i32 0
%.tmp6304 = call i32(i8*,i8*) @strcmp(i8* %.tmp6301, i8* %.tmp6303)
%.tmp6305 = icmp eq i32 %.tmp6304, 0
br i1 %.tmp6305, label %.if.true.6306, label %.if.false.6306
.if.true.6306:
%.tmp6307 = getelementptr i8*, i8** %buf, i32 0
%.tmp6309 = getelementptr [5 x i8], [5 x i8]*@.str6308, i32 0, i32 0
%.tmp6310 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6311 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6310, i32 0, i32 2
%.tmp6312 = load i8*, i8** %.tmp6311
%.tmp6313 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6307, i8* %.tmp6309, i8* %.tmp6312)
%.tmp6314 = load i8*, i8** %buf
ret i8* %.tmp6314
br label %.if.end.6306
.if.false.6306:
%.tmp6315 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6316 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6315, i32 0, i32 0
%.tmp6317 = load i8*, i8** %.tmp6316
%.tmp6319 = getelementptr [4 x i8], [4 x i8]*@.str6318, i32 0, i32 0
%.tmp6320 = call i32(i8*,i8*) @strcmp(i8* %.tmp6317, i8* %.tmp6319)
%.tmp6321 = icmp eq i32 %.tmp6320, 0
br i1 %.tmp6321, label %.if.true.6322, label %.if.false.6322
.if.true.6322:
%.tmp6324 = getelementptr [4 x i8], [4 x i8]*@.str6323, i32 0, i32 0
ret i8* %.tmp6324
br label %.if.end.6322
.if.false.6322:
%.tmp6325 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6326 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6325, i32 0, i32 0
%.tmp6327 = load i8*, i8** %.tmp6326
%.tmp6329 = getelementptr [7 x i8], [7 x i8]*@.str6328, i32 0, i32 0
%.tmp6330 = call i32(i8*,i8*) @strcmp(i8* %.tmp6327, i8* %.tmp6329)
%.tmp6331 = icmp eq i32 %.tmp6330, 0
br i1 %.tmp6331, label %.if.true.6332, label %.if.false.6332
.if.true.6332:
%.tmp6334 = getelementptr [4 x i8], [4 x i8]*@.str6333, i32 0, i32 0
ret i8* %.tmp6334
br label %.if.end.6332
.if.false.6332:
%.tmp6335 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6336 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6335, i32 0, i32 0
%.tmp6337 = load i8*, i8** %.tmp6336
%.tmp6339 = getelementptr [6 x i8], [6 x i8]*@.str6338, i32 0, i32 0
%.tmp6340 = call i32(i8*,i8*) @strcmp(i8* %.tmp6337, i8* %.tmp6339)
%.tmp6341 = icmp eq i32 %.tmp6340, 0
br i1 %.tmp6341, label %.if.true.6342, label %.if.false.6342
.if.true.6342:
br label %.if.end.6342
.if.false.6342:
%.tmp6344 = getelementptr [58 x i8], [58 x i8]*@.str6343, i32 0, i32 0
%.tmp6345 = load %m1770$.Type.type*, %m1770$.Type.type** %type
%.tmp6346 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6345, i32 0, i32 0
%.tmp6347 = load i8*, i8** %.tmp6346
%.tmp6348 = call i32(i8*,...) @printf(i8* %.tmp6344, i8* %.tmp6347)
br label %.if.end.6342
.if.end.6342:
br label %.if.end.6332
.if.end.6332:
br label %.if.end.6322
.if.end.6322:
br label %.if.end.6306
.if.end.6306:
br label %.if.end.6281
.if.end.6281:
br label %.if.end.6235
.if.end.6235:
br label %.if.end.6217
.if.end.6217:
br label %.if.end.6162
.if.end.6162:
br label %.if.end.6152
.if.end.6152:
br label %.if.end.6142
.if.end.6142:
br label %.if.end.6132
.if.end.6132:
br label %.if.end.6122
.if.end.6122:
br label %.if.end.6112
.if.end.6112:
%.tmp6349 = bitcast ptr null to i8*
ret i8* %.tmp6349
}
define void @m1770$append_error.v.m1770$.CompilerCtx.typep.m717$.Error.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m717$.Error.type* %.e.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp6350 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* null, i32 1
%.tmp6351 = ptrtoint %m1770$.ErrorList.type* %.tmp6350 to i32
%.tmp6352 = call i8*(i32) @malloc(i32 %.tmp6351)
%.tmp6353 = bitcast i8* %.tmp6352 to %m1770$.ErrorList.type*
%new_err = alloca %m1770$.ErrorList.type*
store %m1770$.ErrorList.type* %.tmp6353, %m1770$.ErrorList.type** %new_err
%.tmp6354 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %new_err
%.tmp6355 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp6354, i32 0, i32 0
%.tmp6356 = load %m717$.Error.type*, %m717$.Error.type** %e
store %m717$.Error.type* %.tmp6356, %m717$.Error.type** %.tmp6355
%.tmp6357 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %new_err
%.tmp6358 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp6357, i32 0, i32 1
store %m1770$.ErrorList.type* null, %m1770$.ErrorList.type** %.tmp6358
%.tmp6359 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6360 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6359, i32 0, i32 2
%.tmp6361 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp6360
%.tmp6362 = icmp eq %m1770$.ErrorList.type* %.tmp6361, null
br i1 %.tmp6362, label %.if.true.6363, label %.if.false.6363
.if.true.6363:
%.tmp6364 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6365 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6364, i32 0, i32 2
%.tmp6366 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %new_err
store %m1770$.ErrorList.type* %.tmp6366, %m1770$.ErrorList.type** %.tmp6365
ret void
br label %.if.end.6363
.if.false.6363:
br label %.if.end.6363
.if.end.6363:
%.tmp6368 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6369 = getelementptr %m1770$.CompilerCtx.type, %m1770$.CompilerCtx.type* %.tmp6368, i32 0, i32 2
%.tmp6370 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp6369
%last = alloca %m1770$.ErrorList.type*
store %m1770$.ErrorList.type* %.tmp6370, %m1770$.ErrorList.type** %last
br label %.for.start.6367
.for.start.6367:
%.tmp6371 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %last
%.tmp6372 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp6371, i32 0, i32 1
%.tmp6373 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp6372
%.tmp6374 = icmp ne %m1770$.ErrorList.type* %.tmp6373, null
br i1 %.tmp6374, label %.for.continue.6367, label %.for.end.6367
.for.continue.6367:
%.tmp6375 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %last
%.tmp6376 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp6375, i32 0, i32 1
%.tmp6377 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %.tmp6376
store %m1770$.ErrorList.type* %.tmp6377, %m1770$.ErrorList.type** %last
br label %.for.start.6367
.for.end.6367:
%.tmp6378 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %last
%.tmp6379 = getelementptr %m1770$.ErrorList.type, %m1770$.ErrorList.type* %.tmp6378, i32 0, i32 1
%.tmp6380 = load %m1770$.ErrorList.type*, %m1770$.ErrorList.type** %new_err
store %m1770$.ErrorList.type* %.tmp6380, %m1770$.ErrorList.type** %.tmp6379
ret void
}
define i8* @m1770$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6381 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6382 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6381, i32 0, i32 6
%.tmp6383 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6382
%.tmp6384 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6383, i32 0, i32 7
%.tmp6385 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6384
%.tmp6386 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6385, i32 0, i32 1
%.tmp6387 = load i8*, i8** %.tmp6386
ret i8* %.tmp6387
}
define %m286$.Node.type* @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6389 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6389, %m286$.Node.type** %n
br label %.for.start.6388
.for.start.6388:
%.tmp6390 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6391 = icmp ne %m286$.Node.type* %.tmp6390, null
br i1 %.tmp6391, label %.for.continue.6388, label %.for.end.6388
.for.continue.6388:
%.tmp6392 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6393 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6392, i32 0, i32 0
%.tmp6394 = load i8*, i8** %.tmp6393
%.tmp6395 = load i8*, i8** %type
%.tmp6396 = call i32(i8*,i8*) @strcmp(i8* %.tmp6394, i8* %.tmp6395)
%.tmp6397 = icmp eq i32 %.tmp6396, 0
br i1 %.tmp6397, label %.if.true.6398, label %.if.false.6398
.if.true.6398:
%.tmp6399 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6399
br label %.if.end.6398
.if.false.6398:
br label %.if.end.6398
.if.end.6398:
%.tmp6400 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6401 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6400, i32 0, i32 7
%.tmp6402 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6401
store %m286$.Node.type* %.tmp6402, %m286$.Node.type** %n
br label %.for.start.6388
.for.end.6388:
%.tmp6403 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6403
}
define %m1770$.Type.type* @m1770$syn_function_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6404 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
%function_type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6404, %m1770$.Type.type** %function_type
%.tmp6405 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6406 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6407 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6406, i32 0, i32 6
%.tmp6408 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6407
%.tmp6409 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp6405, %m286$.Node.type* %.tmp6408)
%return_value_type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6409, %m1770$.Type.type** %return_value_type
%.tmp6410 = load %m1770$.Type.type*, %m1770$.Type.type** %function_type
%.tmp6411 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6410, i32 0, i32 0
%.tmp6413 = getelementptr [9 x i8], [9 x i8]*@.str6412, i32 0, i32 0
store i8* %.tmp6413, i8** %.tmp6411
%.tmp6414 = load %m1770$.Type.type*, %m1770$.Type.type** %function_type
%.tmp6415 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6414, i32 0, i32 3
%.tmp6416 = load %m1770$.Type.type*, %m1770$.Type.type** %return_value_type
store %m1770$.Type.type* %.tmp6416, %m1770$.Type.type** %.tmp6415
%.tmp6417 = load %m1770$.Type.type*, %m1770$.Type.type** %return_value_type
%last_type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6417, %m1770$.Type.type** %last_type
%.tmp6418 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6419 = call %m286$.Node.type*(%m286$.Node.type*) @m1770$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6418)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6419, %m286$.Node.type** %params
%.tmp6421 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6421, %m286$.Node.type** %param_ptr
br label %.for.start.6420
.for.start.6420:
%.tmp6422 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6423 = icmp ne %m286$.Node.type* %.tmp6422, null
br i1 %.tmp6423, label %.for.continue.6420, label %.for.end.6420
.for.continue.6420:
%.tmp6424 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6425 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6424, i32 0, i32 0
%.tmp6426 = load i8*, i8** %.tmp6425
%.tmp6428 = getelementptr [5 x i8], [5 x i8]*@.str6427, i32 0, i32 0
%.tmp6429 = call i32(i8*,i8*) @strcmp(i8* %.tmp6426, i8* %.tmp6428)
%.tmp6430 = icmp eq i32 %.tmp6429, 0
br i1 %.tmp6430, label %.if.true.6431, label %.if.false.6431
.if.true.6431:
%.tmp6432 = load %m1770$.Type.type*, %m1770$.Type.type** %last_type
%.tmp6433 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6432, i32 0, i32 4
%.tmp6434 = load %m1770$.Type.type*, %m1770$.Type.type** %last_type
%.tmp6435 = call %m1770$.Type.type*(%m1770$.Type.type*) @m1770$type_clone.m1770$.Type.typep.m1770$.Type.typep(%m1770$.Type.type* %.tmp6434)
store %m1770$.Type.type* %.tmp6435, %m1770$.Type.type** %.tmp6433
%.tmp6436 = load %m1770$.Type.type*, %m1770$.Type.type** %last_type
%.tmp6437 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6436, i32 0, i32 4
%.tmp6438 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6437
%.tmp6439 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6438, i32 0, i32 4
store %m1770$.Type.type* null, %m1770$.Type.type** %.tmp6439
%.tmp6440 = load %m1770$.Type.type*, %m1770$.Type.type** %last_type
%.tmp6441 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6440, i32 0, i32 4
%.tmp6442 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6441
store %m1770$.Type.type* %.tmp6442, %m1770$.Type.type** %last_type
%.tmp6443 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6444 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6443, i32 0, i32 7
%.tmp6445 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6444
%.tmp6446 = icmp ne %m286$.Node.type* %.tmp6445, null
br i1 %.tmp6446, label %.if.true.6447, label %.if.false.6447
.if.true.6447:
%.tmp6448 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6449 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6448, i32 0, i32 7
%.tmp6450 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6449
store %m286$.Node.type* %.tmp6450, %m286$.Node.type** %param_ptr
br label %.if.end.6447
.if.false.6447:
br label %.if.end.6447
.if.end.6447:
%.tmp6451 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6452 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6451, i32 0, i32 7
%.tmp6453 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6452
%.tmp6454 = icmp ne %m286$.Node.type* %.tmp6453, null
br i1 %.tmp6454, label %.if.true.6455, label %.if.false.6455
.if.true.6455:
%.tmp6456 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6457 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6456, i32 0, i32 7
%.tmp6458 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6457
store %m286$.Node.type* %.tmp6458, %m286$.Node.type** %param_ptr
br label %.if.end.6455
.if.false.6455:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6455
.if.end.6455:
br label %.if.end.6431
.if.false.6431:
%.tmp6459 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6460 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6461 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6460, i32 0, i32 6
%.tmp6462 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6461
%.tmp6463 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp6459, %m286$.Node.type* %.tmp6462)
%param_type = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6463, %m1770$.Type.type** %param_type
%.tmp6464 = load %m1770$.Type.type*, %m1770$.Type.type** %last_type
%.tmp6465 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6464, i32 0, i32 4
%.tmp6466 = load %m1770$.Type.type*, %m1770$.Type.type** %param_type
store %m1770$.Type.type* %.tmp6466, %m1770$.Type.type** %.tmp6465
%.tmp6467 = load %m1770$.Type.type*, %m1770$.Type.type** %param_type
store %m1770$.Type.type* %.tmp6467, %m1770$.Type.type** %last_type
%.tmp6468 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6469 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6468, i32 0, i32 7
%.tmp6470 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6469
store %m286$.Node.type* %.tmp6470, %m286$.Node.type** %param_ptr
%.tmp6471 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6472 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6471, i32 0, i32 7
%.tmp6473 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6472
%.tmp6474 = icmp ne %m286$.Node.type* %.tmp6473, null
br i1 %.tmp6474, label %.if.true.6475, label %.if.false.6475
.if.true.6475:
%.tmp6476 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6477 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6476, i32 0, i32 7
%.tmp6478 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6477
%.tmp6479 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6478, i32 0, i32 7
%.tmp6480 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6479
store %m286$.Node.type* %.tmp6480, %m286$.Node.type** %param_ptr
br label %.if.end.6475
.if.false.6475:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6475
.if.end.6475:
br label %.if.end.6431
.if.end.6431:
br label %.for.start.6420
.for.end.6420:
%.tmp6481 = load %m1770$.Type.type*, %m1770$.Type.type** %function_type
ret %m1770$.Type.type* %.tmp6481
}
define %m286$.Node.type* @m1770$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6482 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6484 = getelementptr [10 x i8], [10 x i8]*@.str6483, i32 0, i32 0
%.tmp6485 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6482, i8* %.tmp6484)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6485, %m286$.Node.type** %params
%.tmp6486 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6487 = icmp eq %m286$.Node.type* %.tmp6486, null
br i1 %.tmp6487, label %.if.true.6488, label %.if.false.6488
.if.true.6488:
%.tmp6489 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6489
br label %.if.end.6488
.if.false.6488:
br label %.if.end.6488
.if.end.6488:
%.tmp6490 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6491 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6490, i32 0, i32 6
%.tmp6492 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6491
ret %m286$.Node.type* %.tmp6492
}
define %m1770$.Type.type* @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.ctx.arg, %m1770$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6493 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
%t = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6493, %m1770$.Type.type** %t
%.tmp6494 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6495 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6494, i32 0, i32 0
%.tmp6496 = load i8*, i8** %.tmp6495
%.tmp6498 = getelementptr [10 x i8], [10 x i8]*@.str6497, i32 0, i32 0
%.tmp6499 = call i32(i8*,i8*) @strcmp(i8* %.tmp6496, i8* %.tmp6498)
%.tmp6500 = icmp eq i32 %.tmp6499, 0
br i1 %.tmp6500, label %.if.true.6501, label %.if.false.6501
.if.true.6501:
%.tmp6502 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6503 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6502, i32 0, i32 0
%.tmp6505 = getelementptr [7 x i8], [7 x i8]*@.str6504, i32 0, i32 0
store i8* %.tmp6505, i8** %.tmp6503
%.tmp6506 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6507 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6506, i32 0, i32 1
store i8* null, i8** %.tmp6507
%.tmp6508 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6509 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6508, i32 0, i32 6
%.tmp6510 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6509
%.tmp6512 = getelementptr [5 x i8], [5 x i8]*@.str6511, i32 0, i32 0
%.tmp6513 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6510, i8* %.tmp6512)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6513, %m286$.Node.type** %curr_type
%.tmp6514 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6515 = icmp ne %m286$.Node.type* %.tmp6514, null
br i1 %.tmp6515, label %.if.true.6516, label %.if.false.6516
.if.true.6516:
%.tmp6517 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6518 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6517, i32 0, i32 3
%.tmp6519 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6520 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6521 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6520, i32 0, i32 6
%.tmp6522 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6521
%.tmp6523 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp6519, %m286$.Node.type* %.tmp6522)
store %m1770$.Type.type* %.tmp6523, %m1770$.Type.type** %.tmp6518
%.tmp6524 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6525 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6524, i32 0, i32 3
%.tmp6526 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6525
%.tmp6527 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6526, i32 0, i32 1
%.tmp6528 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6529 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6528, i32 0, i32 7
%.tmp6530 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6529
%.tmp6531 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6530, i32 0, i32 1
%.tmp6532 = load i8*, i8** %.tmp6531
store i8* %.tmp6532, i8** %.tmp6527
%.tmp6533 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6534 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6533, i32 0, i32 3
%.tmp6535 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6534
%curr_t = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6535, %m1770$.Type.type** %curr_t
%.tmp6537 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6538 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6537, i32 0, i32 7
%.tmp6539 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6538
%.tmp6541 = getelementptr [5 x i8], [5 x i8]*@.str6540, i32 0, i32 0
%.tmp6542 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6539, i8* %.tmp6541)
store %m286$.Node.type* %.tmp6542, %m286$.Node.type** %curr_type
br label %.for.start.6536
.for.start.6536:
%.tmp6543 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6544 = icmp ne %m286$.Node.type* %.tmp6543, null
br i1 %.tmp6544, label %.for.continue.6536, label %.for.end.6536
.for.continue.6536:
%.tmp6545 = load %m1770$.Type.type*, %m1770$.Type.type** %curr_t
%.tmp6546 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6545, i32 0, i32 4
%.tmp6547 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6548 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6549 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6548, i32 0, i32 6
%.tmp6550 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6549
%.tmp6551 = call %m1770$.Type.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$node_to_type.m1770$.Type.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp6547, %m286$.Node.type* %.tmp6550)
store %m1770$.Type.type* %.tmp6551, %m1770$.Type.type** %.tmp6546
%.tmp6552 = load %m1770$.Type.type*, %m1770$.Type.type** %curr_t
%.tmp6553 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6552, i32 0, i32 4
%.tmp6554 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6553
%.tmp6555 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6554, i32 0, i32 1
%.tmp6556 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6557 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6556, i32 0, i32 7
%.tmp6558 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6557
%.tmp6559 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6558, i32 0, i32 1
%.tmp6560 = load i8*, i8** %.tmp6559
store i8* %.tmp6560, i8** %.tmp6555
%.tmp6561 = load %m1770$.Type.type*, %m1770$.Type.type** %curr_t
%.tmp6562 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6561, i32 0, i32 4
%.tmp6563 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6562
store %m1770$.Type.type* %.tmp6563, %m1770$.Type.type** %curr_t
%.tmp6564 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6565 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6564, i32 0, i32 7
%.tmp6566 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6565
%.tmp6568 = getelementptr [5 x i8], [5 x i8]*@.str6567, i32 0, i32 0
%.tmp6569 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1770$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6566, i8* %.tmp6568)
store %m286$.Node.type* %.tmp6569, %m286$.Node.type** %curr_type
br label %.for.start.6536
.for.end.6536:
br label %.if.end.6516
.if.false.6516:
br label %.if.end.6516
.if.end.6516:
br label %.if.end.6501
.if.false.6501:
%.tmp6570 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6571 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6570, i32 0, i32 0
%.tmp6572 = load i8*, i8** %.tmp6571
%.tmp6574 = getelementptr [5 x i8], [5 x i8]*@.str6573, i32 0, i32 0
%.tmp6575 = call i32(i8*,i8*) @strcmp(i8* %.tmp6572, i8* %.tmp6574)
%.tmp6576 = icmp eq i32 %.tmp6575, 0
br i1 %.tmp6576, label %.if.true.6577, label %.if.false.6577
.if.true.6577:
%.tmp6578 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6579 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6578, i32 0, i32 0
%.tmp6580 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6581 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6580, i32 0, i32 1
%.tmp6582 = load i8*, i8** %.tmp6581
store i8* %.tmp6582, i8** %.tmp6579
br label %.if.end.6577
.if.false.6577:
%.tmp6583 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6584 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6583, i32 0, i32 0
%.tmp6585 = load i8*, i8** %.tmp6584
%.tmp6587 = getelementptr [12 x i8], [12 x i8]*@.str6586, i32 0, i32 0
%.tmp6588 = call i32(i8*,i8*) @strcmp(i8* %.tmp6585, i8* %.tmp6587)
%.tmp6589 = icmp eq i32 %.tmp6588, 0
br i1 %.tmp6589, label %.if.true.6590, label %.if.false.6590
.if.true.6590:
%err_msg = alloca i8*
%.tmp6591 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6592 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6593 = call %m1770$.ScopeItem.type*(%m1770$.CompilerCtx.type*,%m286$.Node.type*) @m1770$find_defined.m1770$.ScopeItem.typep.m1770$.CompilerCtx.typep.m286$.Node.typep(%m1770$.CompilerCtx.type* %.tmp6591, %m286$.Node.type* %.tmp6592)
%base = alloca %m1770$.ScopeItem.type*
store %m1770$.ScopeItem.type* %.tmp6593, %m1770$.ScopeItem.type** %base
%.tmp6594 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %base
%.tmp6595 = icmp eq %m1770$.ScopeItem.type* %.tmp6594, null
br i1 %.tmp6595, label %.if.true.6596, label %.if.false.6596
.if.true.6596:
%.tmp6597 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6599 = getelementptr [37 x i8], [37 x i8]*@.str6598, i32 0, i32 0
%.tmp6600 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6601 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6600, i32 0, i32 6
%.tmp6602 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6601
%.tmp6603 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6602, i32 0, i32 1
%.tmp6604 = load i8*, i8** %.tmp6603
%.tmp6605 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6597, i8* %.tmp6599, i8* %.tmp6604)
%.tmp6606 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6607 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6608 = load i8*, i8** %err_msg
call void(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$new_error.v.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp6606, %m286$.Node.type* %.tmp6607, i8* %.tmp6608)
%.tmp6609 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6610 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6609, i32 0, i32 0
%.tmp6612 = getelementptr [6 x i8], [6 x i8]*@.str6611, i32 0, i32 0
store i8* %.tmp6612, i8** %.tmp6610
%.tmp6613 = load %m1770$.Type.type*, %m1770$.Type.type** %t
ret %m1770$.Type.type* %.tmp6613
br label %.if.end.6596
.if.false.6596:
br label %.if.end.6596
.if.end.6596:
%.tmp6614 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6615 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6614, i32 0, i32 0
%.tmp6617 = getelementptr [10 x i8], [10 x i8]*@.str6616, i32 0, i32 0
store i8* %.tmp6617, i8** %.tmp6615
%.tmp6618 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6619 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6618, i32 0, i32 1
%.tmp6620 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %base
%.tmp6621 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp6620, i32 0, i32 0
%.tmp6622 = load i8*, i8** %.tmp6621
store i8* %.tmp6622, i8** %.tmp6619
%.tmp6623 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6624 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6623, i32 0, i32 2
%.tmp6625 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %base
%.tmp6626 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp6625, i32 0, i32 1
%.tmp6627 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp6626
%.tmp6628 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6627, i32 0, i32 0
%.tmp6629 = load i8*, i8** %.tmp6628
store i8* %.tmp6629, i8** %.tmp6624
%.tmp6630 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6631 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6630, i32 0, i32 3
%.tmp6632 = load %m1770$.ScopeItem.type*, %m1770$.ScopeItem.type** %base
%.tmp6633 = getelementptr %m1770$.ScopeItem.type, %m1770$.ScopeItem.type* %.tmp6632, i32 0, i32 1
%.tmp6634 = load %m1770$.AssignableInfo.type*, %m1770$.AssignableInfo.type** %.tmp6633
%.tmp6635 = getelementptr %m1770$.AssignableInfo.type, %m1770$.AssignableInfo.type* %.tmp6634, i32 0, i32 3
%.tmp6636 = load %m1770$.Type.type*, %m1770$.Type.type** %.tmp6635
store %m1770$.Type.type* %.tmp6636, %m1770$.Type.type** %.tmp6631
br label %.if.end.6590
.if.false.6590:
%.tmp6637 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6638 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6637, i32 0, i32 1
%.tmp6639 = load i8*, i8** %.tmp6638
%.tmp6641 = getelementptr [4 x i8], [4 x i8]*@.str6640, i32 0, i32 0
%.tmp6642 = call i32(i8*,i8*) @strcmp(i8* %.tmp6639, i8* %.tmp6641)
%.tmp6643 = icmp eq i32 %.tmp6642, 0
br i1 %.tmp6643, label %.if.true.6644, label %.if.false.6644
.if.true.6644:
%.tmp6645 = load %m1770$.Type.type*, %m1770$.Type.type** %t
%.tmp6646 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6645, i32 0, i32 0
%.tmp6648 = getelementptr [7 x i8], [7 x i8]*@.str6647, i32 0, i32 0
store i8* %.tmp6648, i8** %.tmp6646
br label %.if.end.6644
.if.false.6644:
%.tmp6649 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %ctx
%.tmp6650 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6652 = getelementptr [54 x i8], [54 x i8]*@.str6651, i32 0, i32 0
%.tmp6653 = call i8*(%m1770$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1770$err_tmpl.cp.m1770$.CompilerCtx.typep.m286$.Node.typep.cp(%m1770$.CompilerCtx.type* %.tmp6649, %m286$.Node.type* %.tmp6650, i8* %.tmp6652)
%.tmp6654 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6655 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6654, i32 0, i32 0
%.tmp6656 = load i8*, i8** %.tmp6655
%.tmp6657 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6658 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6657, i32 0, i32 1
%.tmp6659 = load i8*, i8** %.tmp6658
%.tmp6660 = call i32(i8*,...) @printf(i8* %.tmp6653, i8* %.tmp6656, i8* %.tmp6659)
br label %.if.end.6644
.if.end.6644:
br label %.if.end.6590
.if.end.6590:
br label %.if.end.6577
.if.end.6577:
br label %.if.end.6501
.if.end.6501:
%.tmp6662 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6663 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6662, i32 0, i32 7
%.tmp6664 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6663
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6664, %m286$.Node.type** %ptr
br label %.for.start.6661
.for.start.6661:
%.tmp6665 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6666 = icmp ne %m286$.Node.type* %.tmp6665, null
br i1 %.tmp6666, label %.for.continue.6661, label %.for.end.6661
.for.continue.6661:
%.tmp6667 = call %m1770$.Type.type*() @m1770$new_type.m1770$.Type.typep()
%pt = alloca %m1770$.Type.type*
store %m1770$.Type.type* %.tmp6667, %m1770$.Type.type** %pt
%.tmp6668 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
%.tmp6669 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6668, i32 0, i32 0
%.tmp6671 = getelementptr [4 x i8], [4 x i8]*@.str6670, i32 0, i32 0
store i8* %.tmp6671, i8** %.tmp6669
%.tmp6672 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
%.tmp6673 = getelementptr %m1770$.Type.type, %m1770$.Type.type* %.tmp6672, i32 0, i32 3
%.tmp6674 = load %m1770$.Type.type*, %m1770$.Type.type** %t
store %m1770$.Type.type* %.tmp6674, %m1770$.Type.type** %.tmp6673
%.tmp6675 = load %m1770$.Type.type*, %m1770$.Type.type** %pt
store %m1770$.Type.type* %.tmp6675, %m1770$.Type.type** %t
%.tmp6676 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6677 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6676, i32 0, i32 7
%.tmp6678 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6677
store %m286$.Node.type* %.tmp6678, %m286$.Node.type** %ptr
br label %.for.start.6661
.for.end.6661:
%.tmp6679 = load %m1770$.Type.type*, %m1770$.Type.type** %t
ret %m1770$.Type.type* %.tmp6679
}
@.str2528 = constant [5 x i8] c"%s{\0A\00"
@.str2532 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2539 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2546 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2558 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2562 = constant [10 x i8] c"%s  of: \0A\00"
@.str2576 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2580 = constant [12 x i8] c"%s  next: \0A\00"
@.str2589 = constant [5 x i8] c"%s}\0A\00"
@.str2647 = constant [5 x i8] c"%c%s\00"
@.str2658 = constant [7 x i8] c".tmp%d\00"
@.str2736 = constant [1 x i8] c"\00"
@.str2766 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2797 = constant [6 x i8] c"start\00"
@.str2809 = constant [6 x i8] c"start\00"
@.str2821 = constant [13 x i8] c"head_comment\00"
@.str2886 = constant [7 x i8] c"string\00"
@.str2895 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2925 = constant [5 x i8] c"%s%s\00"
@.str2933 = constant [9 x i8] c"function\00"
@.str2939 = constant [5 x i8] c"main\00"
@.str2951 = constant [6 x i8] c"%s.%s\00"
@.str2968 = constant [3 x i8] c"NL\00"
@.str2976 = constant [7 x i8] c"global\00"
@.str2984 = constant [11 x i8] c"assignable\00"
@.str3012 = constant [9 x i8] c"variable\00"
@.str3023 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3038 = constant [10 x i8] c"typealias\00"
@.str3058 = constant [11 x i8] c"%s.%s.type\00"
@.str3070 = constant [10 x i8] c"typealias\00"
@.str3091 = constant [5 x i8] c"type\00"
@.str3118 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3131 = constant [7 x i8] c"extern\00"
@.str3149 = constant [7 x i8] c"extern\00"
@.str3205 = constant [15 x i8] c"declare %s %s(\00"
@.str3236 = constant [3 x i8] c", \00"
@.str3242 = constant [3 x i8] c"%s\00"
@.str3254 = constant [3 x i8] c")\0A\00"
@.str3265 = constant [9 x i8] c"function\00"
@.str3274 = constant [9 x i8] c"function\00"
@.str3311 = constant [14 x i8] c"define %s %s(\00"
@.str3337 = constant [3 x i8] c", \00"
@.str3343 = constant [5 x i8] c"type\00"
@.str3359 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3374 = constant [5 x i8] c") {\0A\00"
@.str3383 = constant [6 x i8] c"block\00"
@.str3401 = constant [3 x i8] c"NL\00"
@.str3408 = constant [9 x i8] c"OPERATOR\00"
@.str3426 = constant [7 x i8] c"return\00"
@.str3436 = constant [5 x i8] c"void\00"
@.str3443 = constant [21 x i8] c"missing return value\00"
@.str3448 = constant [10 x i8] c"ret void\0A\00"
@.str3454 = constant [3 x i8] c"}\0A\00"
@.str3460 = constant [7 x i8] c"import\00"
@.str3505 = constant [1 x i8] c"\00"
@.str3511 = constant [6 x i8] c"%s.bn\00"
@.str3516 = constant [9 x i8] c"%s/%s.bn\00"
@.str3528 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3585 = constant [5 x i8] c"m%d$\00"
@.str3634 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3642 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3671 = constant [9 x i8] c"variable\00"
@.str3676 = constant [5 x i8] c"type\00"
@.str3706 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3718 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3739 = constant [11 x i8] c"expression\00"
@.str3766 = constant [7 x i8] c"sizeof\00"
@.str3772 = constant [8 x i8] c"fn_args\00"
@.str3778 = constant [11 x i8] c"assignable\00"
@.str3803 = constant [4 x i8] c"int\00"
@.str3814 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3823 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3849 = constant [35 x i8] c"unable to compile function address\00"
@.str3855 = constant [8 x i8] c"fn_args\00"
@.str3858 = constant [1 x i8] c"\00"
@.str3866 = constant [11 x i8] c"assignable\00"
@.str3878 = constant [5 x i8] c"%s, \00"
@.str3894 = constant [8 x i8] c"%s%s %s\00"
@.str3909 = constant [11 x i8] c"assignable\00"
@.str3919 = constant [5 x i8] c"void\00"
@.str3927 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str3958 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str3979 = constant [7 x i8] c"return\00"
@.str3991 = constant [3 x i8] c"NL\00"
@.str4009 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4022 = constant [10 x i8] c"ret void\0A\00"
@.str4026 = constant [3 x i8] c"NL\00"
@.str4032 = constant [8 x i8] c"fn_call\00"
@.str4043 = constant [12 x i8] c"declaration\00"
@.str4052 = constant [11 x i8] c"assignment\00"
@.str4060 = constant [11 x i8] c"assignable\00"
@.str4072 = constant [34 x i8] c"%s was not declared in this scope\00"
@.str4104 = constant [4 x i8] c"ptr\00"
@.str4113 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4123 = constant [9 x i8] c"if_block\00"
@.str4131 = constant [9 x i8] c"for_loop\00"
@.str4140 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4155 = constant [12 x i8] c"declaration\00"
@.str4166 = constant [11 x i8] c"assignment\00"
@.str4176 = constant [9 x i8] c"OPERATOR\00"
@.str4183 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4193 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4200 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4207 = constant [9 x i8] c"OPERATOR\00"
@.str4219 = constant [57 x i8] c"br %s %s, label %%.for.continue.%d, label %%.for.end.%d\0A\00"
@.str4234 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4241 = constant [9 x i8] c"OPERATOR\00"
@.str4248 = constant [6 x i8] c"block\00"
@.str4262 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4269 = constant [14 x i8] c".for.end.%d:\0A\00"
@.str4280 = constant [5 x i8] c"type\00"
@.str4295 = constant [11 x i8] c"assignable\00"
@.str4308 = constant [9 x i8] c"variable\00"
@.str4313 = constant [5 x i8] c"WORD\00"
@.str4321 = constant [31 x i8] c"unable to get declaration name\00"
@.str4373 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4389 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4401 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4418 = constant [11 x i8] c"assignable\00"
@.str4432 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4447 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4454 = constant [6 x i8] c"block\00"
@.str4462 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4469 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4476 = constant [11 x i8] c"elif_block\00"
@.str4487 = constant [11 x i8] c"else_block\00"
@.str4497 = constant [6 x i8] c"block\00"
@.str4507 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4514 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4534 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4542 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4591 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4612 = constant [7 x i8] c"module\00"
@.str4641 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str4683 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str4691 = constant [9 x i8] c"function\00"
@.str4698 = constant [7 x i8] c"extern\00"
@.str4710 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str4731 = constant [9 x i8] c"variable\00"
@.str4751 = constant [4 x i8] c"ptr\00"
@.str4769 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str4793 = constant [10 x i8] c"typealias\00"
@.str4804 = constant [7 x i8] c"struct\00"
@.str4810 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str4861 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str4881 = constant [9 x i8] c"variable\00"
@.str4891 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4912 = constant [9 x i8] c"variable\00"
@.str4920 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str4932 = constant [12 x i8] c"destination\00"
@.str4937 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str4963 = constant [25 x i8] c"name '%s' is not defined\00"
@.str4981 = constant [7 x i8] c"module\00"
@.str5003 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5067 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5087 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5110 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5133 = constant [16 x i8] c"mono_assignable\00"
@.str5155 = constant [5 x i8] c"cast\00"
@.str5164 = constant [5 x i8] c"type\00"
@.str5179 = constant [26 x i8] c"%s = bitcast %s %s to %s\0A\00"
@.str5204 = constant [16 x i8] c"mono_assignable\00"
@.str5262 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5285 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5292 = constant [2 x i8] c"+\00"
@.str5297 = constant [4 x i8] c"add\00"
@.str5302 = constant [2 x i8] c"-\00"
@.str5307 = constant [4 x i8] c"sub\00"
@.str5312 = constant [2 x i8] c"*\00"
@.str5317 = constant [4 x i8] c"mul\00"
@.str5322 = constant [2 x i8] c"/\00"
@.str5327 = constant [5 x i8] c"sdiv\00"
@.str5332 = constant [3 x i8] c"==\00"
@.str5337 = constant [8 x i8] c"icmp eq\00"
@.str5342 = constant [3 x i8] c"!=\00"
@.str5347 = constant [8 x i8] c"icmp ne\00"
@.str5352 = constant [2 x i8] c">\00"
@.str5357 = constant [9 x i8] c"icmp sgt\00"
@.str5362 = constant [2 x i8] c"<\00"
@.str5367 = constant [9 x i8] c"icmp slt\00"
@.str5372 = constant [2 x i8] c"&\00"
@.str5377 = constant [4 x i8] c"and\00"
@.str5382 = constant [2 x i8] c"|\00"
@.str5387 = constant [3 x i8] c"or\00"
@.str5392 = constant [3 x i8] c">=\00"
@.str5397 = constant [9 x i8] c"icmp sge\00"
@.str5402 = constant [3 x i8] c"<=\00"
@.str5407 = constant [9 x i8] c"icmp sle\00"
@.str5411 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5418 = constant [4 x i8] c"add\00"
@.str5424 = constant [3 x i8] c"==\00"
@.str5431 = constant [3 x i8] c"!=\00"
@.str5439 = constant [2 x i8] c"|\00"
@.str5447 = constant [2 x i8] c"&\00"
@.str5455 = constant [2 x i8] c">\00"
@.str5463 = constant [2 x i8] c"<\00"
@.str5471 = constant [3 x i8] c">=\00"
@.str5479 = constant [3 x i8] c"<=\00"
@.str5487 = constant [5 x i8] c"bool\00"
@.str5491 = constant [4 x i8] c"int\00"
@.str5501 = constant [7 x i8] c"NUMBER\00"
@.str5515 = constant [4 x i8] c"int\00"
@.str5529 = constant [5 x i8] c"WORD\00"
@.str5539 = constant [5 x i8] c"null\00"
@.str5546 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5560 = constant [5 x i8] c"null\00"
@.str5569 = constant [8 x i8] c"nullptr\00"
@.str5576 = constant [17 x i8] c"addr_destination\00"
@.str5588 = constant [12 x i8] c"destination\00"
@.str5627 = constant [4 x i8] c"ptr\00"
@.str5646 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str5658 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5672 = constant [8 x i8] c"boolean\00"
@.str5686 = constant [5 x i8] c"bool\00"
@.str5695 = constant [6 x i8] c"false\00"
@.str5702 = constant [2 x i8] c"0\00"
@.str5706 = constant [2 x i8] c"1\00"
@.str5713 = constant [8 x i8] c"fn_call\00"
@.str5730 = constant [7 x i8] c"STRING\00"
@.str5754 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str5770 = constant [4 x i8] c"ptr\00"
@.str5783 = constant [4 x i8] c"chr\00"
@.str5790 = constant [4 x i8] c"CHR\00"
@.str5805 = constant [2 x i8] c"0\00"
@.str5821 = constant [22 x i8] c"Invalid character: %s\00"
@.str5837 = constant [4 x i8] c"chr\00"
@.str5841 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str5869 = constant [22 x i8] c"called 'abbr' on null\00"
@.str5875 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str5880 = constant [4 x i8] c"int\00"
@.str5885 = constant [2 x i8] c"i\00"
@.str5890 = constant [5 x i8] c"bool\00"
@.str5895 = constant [2 x i8] c"b\00"
@.str5900 = constant [5 x i8] c"void\00"
@.str5905 = constant [2 x i8] c"v\00"
@.str5910 = constant [4 x i8] c"chr\00"
@.str5915 = constant [2 x i8] c"c\00"
@.str5920 = constant [4 x i8] c"str\00"
@.str5925 = constant [3 x i8] c"cp\00"
@.str5930 = constant [4 x i8] c"ptr\00"
@.str5936 = constant [4 x i8] c"%sp\00"
@.str5947 = constant [10 x i8] c"typealias\00"
@.str5958 = constant [6 x i8] c"error\00"
@.str5963 = constant [2 x i8] c"?\00"
@.str5965 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str5975 = constant [7 x i8] c".str%d\00"
@.str5998 = constant [6 x i8] c"array\00"
@.str6011 = constant [4 x i8] c"chr\00"
@.str6029 = constant [3 x i8] c"%d\00"
@.str6038 = constant [7 x i8] c"string\00"
@.str6057 = constant [7 x i8] c"module\00"
@.str6091 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6097 = constant [2 x i8] c"?\00"
@.str6103 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6108 = constant [4 x i8] c"int\00"
@.str6113 = constant [4 x i8] c"i32\00"
@.str6118 = constant [5 x i8] c"void\00"
@.str6123 = constant [5 x i8] c"void\00"
@.str6128 = constant [5 x i8] c"bool\00"
@.str6133 = constant [3 x i8] c"i1\00"
@.str6138 = constant [8 x i8] c"nullptr\00"
@.str6143 = constant [4 x i8] c"ptr\00"
@.str6148 = constant [4 x i8] c"chr\00"
@.str6153 = constant [3 x i8] c"i8\00"
@.str6158 = constant [9 x i8] c"function\00"
@.str6164 = constant [4 x i8] c"%s(\00"
@.str6189 = constant [4 x i8] c"%s,\00"
@.str6194 = constant [5 x i8] c"%s%s\00"
@.str6205 = constant [4 x i8] c"%s)\00"
@.str6213 = constant [4 x i8] c"ptr\00"
@.str6219 = constant [4 x i8] c"%s*\00"
@.str6231 = constant [7 x i8] c"struct\00"
@.str6237 = constant [2 x i8] c"{\00"
@.str6253 = constant [4 x i8] c"%s,\00"
@.str6258 = constant [5 x i8] c"%s%s\00"
@.str6269 = constant [4 x i8] c"%s}\00"
@.str6277 = constant [6 x i8] c"array\00"
@.str6283 = constant [10 x i8] c"[%s x %s]\00"
@.str6302 = constant [10 x i8] c"typealias\00"
@.str6308 = constant [5 x i8] c"%%%s\00"
@.str6318 = constant [4 x i8] c"str\00"
@.str6323 = constant [4 x i8] c"i8*\00"
@.str6328 = constant [7 x i8] c"vararg\00"
@.str6333 = constant [4 x i8] c"...\00"
@.str6338 = constant [6 x i8] c"error\00"
@.str6343 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6412 = constant [9 x i8] c"function\00"
@.str6427 = constant [5 x i8] c"WORD\00"
@.str6483 = constant [10 x i8] c"fn_params\00"
@.str6497 = constant [10 x i8] c"structdef\00"
@.str6504 = constant [7 x i8] c"struct\00"
@.str6511 = constant [5 x i8] c"type\00"
@.str6540 = constant [5 x i8] c"type\00"
@.str6567 = constant [5 x i8] c"type\00"
@.str6573 = constant [5 x i8] c"WORD\00"
@.str6586 = constant [12 x i8] c"dotted_name\00"
@.str6598 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6611 = constant [6 x i8] c"error\00"
@.str6616 = constant [10 x i8] c"typealias\00"
@.str6640 = constant [4 x i8] c"...\00"
@.str6647 = constant [7 x i8] c"vararg\00"
@.str6651 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str6670 = constant [4 x i8] c"ptr\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6680 = load i32, i32* %argc
%.tmp6681 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp6680, i8** %.tmp6681)
%.tmp6682 = load i32, i32* @STDERR
%.tmp6684 = getelementptr [2 x i8], [2 x i8]*@.str6683, i32 0, i32 0
%.tmp6685 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp6682, i8* %.tmp6684)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6685, %m0$.File.type** %stderr
%.tmp6686 = load i8**, i8*** %argv
%.tmp6687 = getelementptr i8*, i8** %.tmp6686, i32 1
%.tmp6688 = load i8*, i8** %.tmp6687
%filename = alloca i8*
store i8* %.tmp6688, i8** %filename
%.tmp6689 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6689, %m0$.File.type** %llvm_code
%.tmp6690 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6691 = load i8*, i8** %filename
%.tmp6692 = call %m1770$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1770$new_context.m1770$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp6690, i8* %.tmp6691)
%compiler_ctx = alloca %m1770$.CompilerCtx.type*
store %m1770$.CompilerCtx.type* %.tmp6692, %m1770$.CompilerCtx.type** %compiler_ctx
%.tmp6693 = load %m1770$.CompilerCtx.type*, %m1770$.CompilerCtx.type** %compiler_ctx
%.tmp6694 = load i8*, i8** %filename
%.tmp6695 = call i1(%m1770$.CompilerCtx.type*,i8*) @m1770$compile_file.b.m1770$.CompilerCtx.typep.cp(%m1770$.CompilerCtx.type* %.tmp6693, i8* %.tmp6694)
br i1 %.tmp6695, label %.if.true.6696, label %.if.false.6696
.if.true.6696:
%.tmp6697 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6699 = getelementptr [34 x i8], [34 x i8]*@.str6698, i32 0, i32 0
%.tmp6700 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6697, i8* %.tmp6699)
ret i32 1
br label %.if.end.6696
.if.false.6696:
br label %.if.end.6696
.if.end.6696:
%.tmp6701 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6702 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp6701)
%.tmp6703 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6704 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp6703)
%llvm_code_size = alloca i32
store i32 %.tmp6704, i32* %llvm_code_size
%.tmp6705 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6705)
%.tmp6707 = getelementptr [30 x i8], [30 x i8]*@.str6706, i32 0, i32 0
%.tmp6709 = getelementptr [2 x i8], [2 x i8]*@.str6708, i32 0, i32 0
%.tmp6710 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6707, i8* %.tmp6709)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6710, %m0$.File.type** %proc
%.tmp6711 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6712 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6711)
%.tmp6713 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6714 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6713)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp6712, i32 %.tmp6714)
%.tmp6715 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6716 = icmp eq %m0$.File.type* %.tmp6715, null
br i1 %.tmp6716, label %.if.true.6717, label %.if.false.6717
.if.true.6717:
%.tmp6718 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6720 = getelementptr [28 x i8], [28 x i8]*@.str6719, i32 0, i32 0
%.tmp6721 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6718, i8* %.tmp6720)
ret i32 0
br label %.if.end.6717
.if.false.6717:
br label %.if.end.6717
.if.end.6717:
%.tmp6722 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6723 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6722)
%.tmp6724 = icmp ne i32 %.tmp6723, 0
br i1 %.tmp6724, label %.if.true.6725, label %.if.false.6725
.if.true.6725:
%.tmp6726 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6728 = getelementptr [24 x i8], [24 x i8]*@.str6727, i32 0, i32 0
%.tmp6729 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6726, i8* %.tmp6728)
ret i32 0
br label %.if.end.6725
.if.false.6725:
br label %.if.end.6725
.if.end.6725:
%.tmp6731 = getelementptr [17 x i8], [17 x i8]*@.str6730, i32 0, i32 0
%.tmp6733 = getelementptr [2 x i8], [2 x i8]*@.str6732, i32 0, i32 0
%.tmp6734 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6731, i8* %.tmp6733)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6734, %m0$.File.type** %gcc_proc
%.tmp6735 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp6736 = icmp eq %m0$.File.type* %.tmp6735, null
br i1 %.tmp6736, label %.if.true.6737, label %.if.false.6737
.if.true.6737:
%.tmp6738 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6740 = getelementptr [28 x i8], [28 x i8]*@.str6739, i32 0, i32 0
%.tmp6741 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6738, i8* %.tmp6740)
ret i32 0
br label %.if.end.6737
.if.false.6737:
br label %.if.end.6737
.if.end.6737:
%.tmp6742 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6743 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6742)
%.tmp6744 = icmp ne i32 %.tmp6743, 0
br i1 %.tmp6744, label %.if.true.6745, label %.if.false.6745
.if.true.6745:
%.tmp6746 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6748 = getelementptr [23 x i8], [23 x i8]*@.str6747, i32 0, i32 0
%.tmp6749 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6746, i8* %.tmp6748)
br label %.if.end.6745
.if.false.6745:
%.tmp6751 = getelementptr [32 x i8], [32 x i8]*@.str6750, i32 0, i32 0
%.tmp6752 = load i8*, i8** %filename
%.tmp6753 = call i32(i8*,...) @printf(i8* %.tmp6751, i8* %.tmp6752)
br label %.if.end.6745
.if.end.6745:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6754 = load i32, i32* %argc
%.tmp6755 = icmp eq i32 %.tmp6754, 2
br i1 %.tmp6755, label %.if.true.6756, label %.if.false.6756
.if.true.6756:
ret void
br label %.if.end.6756
.if.false.6756:
br label %.if.end.6756
.if.end.6756:
%.tmp6758 = getelementptr [21 x i8], [21 x i8]*@.str6757, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp6758, i8** %tmpl
%.tmp6759 = load i8**, i8*** %argv
%.tmp6760 = getelementptr i8*, i8** %.tmp6759, i32 0
%.tmp6761 = load i8*, i8** %.tmp6760
%.tmp6762 = call i32(i8*) @strlen(i8* %.tmp6761)
%.tmp6763 = load i8*, i8** %tmpl
%.tmp6764 = call i32(i8*) @strlen(i8* %.tmp6763)
%.tmp6765 = add i32 %.tmp6762, %.tmp6764
%len_filename = alloca i32
store i32 %.tmp6765, i32* %len_filename
%.tmp6766 = load i32, i32* %len_filename
%.tmp6767 = call i8*(i32) @malloc(i32 %.tmp6766)
%buf = alloca i8*
store i8* %.tmp6767, i8** %buf
%.tmp6768 = load i8*, i8** %buf
%.tmp6769 = load i8*, i8** %tmpl
%.tmp6770 = load i8**, i8*** %argv
%.tmp6771 = getelementptr i8*, i8** %.tmp6770, i32 0
%.tmp6772 = load i8*, i8** %.tmp6771
%.tmp6773 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp6768, i8* %.tmp6769, i8* %.tmp6772)
%.tmp6774 = load i8*, i8** %buf
%.tmp6775 = call i32(i8*) @puts(i8* %.tmp6774)
%.tmp6776 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp6776)
call void(i32) @exit(i32 1)
ret void
}
@.str6683 = constant [2 x i8] c"w\00"
@.str6698 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str6706 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str6708 = constant [2 x i8] c"w\00"
@.str6719 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6727 = constant [24 x i8] c"error on llc execution\0A\00"
@.str6730 = constant [17 x i8] c"gcc out.s -o out\00"
@.str6732 = constant [2 x i8] c"w\00"
@.str6739 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6747 = constant [23 x i8] c"error on gcc execution\00"
@.str6750 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str6757 = constant [21 x i8] c"Usage: %s <filename>\00"
