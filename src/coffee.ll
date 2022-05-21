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
%.tmp1833 = getelementptr [1609 x i8], [1609 x i8]*@.str1832, i32 0, i32 0
ret i8* %.tmp1833
}
@.str1832 = constant [1609 x i8] c"
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
define i8* @m2176$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2177 = load i8*, i8** %text
%.tmp2178 = call i32(i8*) @strlen(i8* %.tmp2177)
%str_len = alloca i32
store i32 %.tmp2178, i32* %str_len
%dest_string = alloca {i32,i32,i8*}
%.tmp2179 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2180 = load i32, i32* %str_len
store i32 %.tmp2180, i32* %.tmp2179
%.tmp2181 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
store i32 0, i32* %.tmp2181
%.tmp2182 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2183 = load i32, i32* %str_len
%.tmp2184 = call i8*(i32) @malloc(i32 %.tmp2183)
store i8* %.tmp2184, i8** %.tmp2182
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.2185
.for.start.2185:
%.tmp2186 = load i32, i32* %i
%.tmp2187 = load i32, i32* %str_len
%.tmp2188 = sub i32 %.tmp2187, 1
%.tmp2189 = icmp slt i32 %.tmp2186, %.tmp2188
br i1 %.tmp2189, label %.for.continue.2185, label %.for.end.2185
.for.continue.2185:
%.tmp2190 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2191 = load i32, i32* %.tmp2190
%.tmp2192 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2193 = load i32, i32* %.tmp2192
%.tmp2194 = sub i32 %.tmp2193, 1
%.tmp2195 = icmp eq i32 %.tmp2191, %.tmp2194
br i1 %.tmp2195, label %.if.true.2196, label %.if.false.2196
.if.true.2196:
%.tmp2197 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2198 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2199 = load i8*, i8** %.tmp2198
%.tmp2200 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 0
%.tmp2201 = load i32, i32* %.tmp2200
%.tmp2202 = mul i32 %.tmp2201, 2
%.tmp2203 = call i8*(i8*,i32) @realloc(i8* %.tmp2199, i32 %.tmp2202)
store i8* %.tmp2203, i8** %.tmp2197
br label %.if.end.2196
.if.false.2196:
br label %.if.end.2196
.if.end.2196:
%.tmp2204 = load i32, i32* %i
%.tmp2205 = load i8*, i8** %text
%.tmp2206 = getelementptr i8, i8* %.tmp2205, i32 %.tmp2204
%.tmp2207 = load i8, i8* %.tmp2206
%.tmp2208 = icmp eq i8 %.tmp2207, 34
br i1 %.tmp2208, label %.if.true.2209, label %.if.false.2209
.if.true.2209:
%.tmp2210 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2211 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2212 = load i32, i32* %.tmp2211
%.tmp2213 = load i8*, i8** %.tmp2210
%.tmp2214 = getelementptr i8, i8* %.tmp2213, i32 %.tmp2212
store i8 92, i8* %.tmp2214
%.tmp2215 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2216 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2217 = load i32, i32* %.tmp2216
%.tmp2218 = add i32 %.tmp2217, 1
store i32 %.tmp2218, i32* %.tmp2215
%.tmp2219 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2220 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2221 = load i32, i32* %.tmp2220
%.tmp2222 = load i8*, i8** %.tmp2219
%.tmp2223 = getelementptr i8, i8* %.tmp2222, i32 %.tmp2221
store i8 50, i8* %.tmp2223
%.tmp2224 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2225 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2226 = load i32, i32* %.tmp2225
%.tmp2227 = add i32 %.tmp2226, 1
store i32 %.tmp2227, i32* %.tmp2224
%.tmp2228 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2229 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2230 = load i32, i32* %.tmp2229
%.tmp2231 = load i8*, i8** %.tmp2228
%.tmp2232 = getelementptr i8, i8* %.tmp2231, i32 %.tmp2230
store i8 50, i8* %.tmp2232
br label %.if.end.2209
.if.false.2209:
%.tmp2233 = load i32, i32* %i
%.tmp2234 = load i8*, i8** %text
%.tmp2235 = getelementptr i8, i8* %.tmp2234, i32 %.tmp2233
%.tmp2236 = load i8, i8* %.tmp2235
%.tmp2237 = icmp eq i8 %.tmp2236, 92
br i1 %.tmp2237, label %.if.true.2238, label %.if.false.2238
.if.true.2238:
%.tmp2239 = load i32, i32* %i
%.tmp2240 = add i32 %.tmp2239, 1
%.tmp2241 = load i8*, i8** %text
%.tmp2242 = getelementptr i8, i8* %.tmp2241, i32 %.tmp2240
%.tmp2243 = load i8, i8* %.tmp2242
%.tmp2244 = icmp eq i8 %.tmp2243, 110
%.tmp2245 = load i32, i32* %i
%.tmp2246 = add i32 %.tmp2245, 1
%.tmp2247 = load i8*, i8** %text
%.tmp2248 = getelementptr i8, i8* %.tmp2247, i32 %.tmp2246
%.tmp2249 = load i8, i8* %.tmp2248
%.tmp2250 = icmp eq i8 %.tmp2249, 78
%.tmp2251 = or i1 %.tmp2244, %.tmp2250
br i1 %.tmp2251, label %.if.true.2252, label %.if.false.2252
.if.true.2252:
%.tmp2253 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2254 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2255 = load i32, i32* %.tmp2254
%.tmp2256 = load i8*, i8** %.tmp2253
%.tmp2257 = getelementptr i8, i8* %.tmp2256, i32 %.tmp2255
store i8 92, i8* %.tmp2257
%.tmp2258 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2259 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2260 = load i32, i32* %.tmp2259
%.tmp2261 = add i32 %.tmp2260, 1
store i32 %.tmp2261, i32* %.tmp2258
%.tmp2262 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2263 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2264 = load i32, i32* %.tmp2263
%.tmp2265 = load i8*, i8** %.tmp2262
%.tmp2266 = getelementptr i8, i8* %.tmp2265, i32 %.tmp2264
store i8 48, i8* %.tmp2266
%.tmp2267 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2268 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2269 = load i32, i32* %.tmp2268
%.tmp2270 = add i32 %.tmp2269, 1
store i32 %.tmp2270, i32* %.tmp2267
%.tmp2271 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2272 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2273 = load i32, i32* %.tmp2272
%.tmp2274 = load i8*, i8** %.tmp2271
%.tmp2275 = getelementptr i8, i8* %.tmp2274, i32 %.tmp2273
store i8 65, i8* %.tmp2275
%.tmp2276 = load i32, i32* %i
%.tmp2277 = add i32 %.tmp2276, 1
store i32 %.tmp2277, i32* %i
br label %.if.end.2252
.if.false.2252:
%.tmp2278 = load i32, i32* %i
%.tmp2279 = add i32 %.tmp2278, 1
%.tmp2280 = load i8*, i8** %text
%.tmp2281 = getelementptr i8, i8* %.tmp2280, i32 %.tmp2279
%.tmp2282 = load i8, i8* %.tmp2281
%.tmp2283 = icmp eq i8 %.tmp2282, 92
br i1 %.tmp2283, label %.if.true.2284, label %.if.false.2284
.if.true.2284:
%.tmp2285 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2286 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2287 = load i32, i32* %.tmp2286
%.tmp2288 = load i8*, i8** %.tmp2285
%.tmp2289 = getelementptr i8, i8* %.tmp2288, i32 %.tmp2287
store i8 92, i8* %.tmp2289
%.tmp2290 = load i32, i32* %i
%.tmp2291 = add i32 %.tmp2290, 1
store i32 %.tmp2291, i32* %i
br label %.if.end.2284
.if.false.2284:
%.tmp2292 = load i32, i32* %i
%.tmp2293 = add i32 %.tmp2292, 1
%.tmp2294 = load i8*, i8** %text
%.tmp2295 = getelementptr i8, i8* %.tmp2294, i32 %.tmp2293
%.tmp2296 = load i8, i8* %.tmp2295
%.tmp2297 = icmp eq i8 %.tmp2296, 120
br i1 %.tmp2297, label %.if.true.2298, label %.if.false.2298
.if.true.2298:
%.tmp2299 = load i32, i32* %i
%.tmp2300 = add i32 %.tmp2299, 2
store i32 %.tmp2300, i32* %i
%.tmp2301 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2302 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2303 = load i32, i32* %.tmp2302
%.tmp2304 = load i8*, i8** %.tmp2301
%.tmp2305 = getelementptr i8, i8* %.tmp2304, i32 %.tmp2303
store i8 92, i8* %.tmp2305
%.tmp2306 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2307 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2308 = load i32, i32* %.tmp2307
%.tmp2309 = add i32 %.tmp2308, 1
store i32 %.tmp2309, i32* %.tmp2306
%.tmp2310 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2311 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2312 = load i32, i32* %.tmp2311
%.tmp2313 = load i8*, i8** %.tmp2310
%.tmp2314 = getelementptr i8, i8* %.tmp2313, i32 %.tmp2312
%.tmp2315 = load i32, i32* %i
%.tmp2316 = load i8*, i8** %text
%.tmp2317 = getelementptr i8, i8* %.tmp2316, i32 %.tmp2315
%.tmp2318 = load i8, i8* %.tmp2317
%.tmp2319 = call i8(i8) @toupper(i8 %.tmp2318)
store i8 %.tmp2319, i8* %.tmp2314
%.tmp2320 = load i32, i32* %i
%.tmp2321 = add i32 %.tmp2320, 1
store i32 %.tmp2321, i32* %i
%.tmp2322 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2323 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2324 = load i32, i32* %.tmp2323
%.tmp2325 = add i32 %.tmp2324, 1
store i32 %.tmp2325, i32* %.tmp2322
%.tmp2326 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2327 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2328 = load i32, i32* %.tmp2327
%.tmp2329 = load i8*, i8** %.tmp2326
%.tmp2330 = getelementptr i8, i8* %.tmp2329, i32 %.tmp2328
%.tmp2331 = load i32, i32* %i
%.tmp2332 = load i8*, i8** %text
%.tmp2333 = getelementptr i8, i8* %.tmp2332, i32 %.tmp2331
%.tmp2334 = load i8, i8* %.tmp2333
%.tmp2335 = call i8(i8) @toupper(i8 %.tmp2334)
store i8 %.tmp2335, i8* %.tmp2330
br label %.if.end.2298
.if.false.2298:
%.tmp2336 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2337 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2338 = load i32, i32* %.tmp2337
%.tmp2339 = load i8*, i8** %.tmp2336
%.tmp2340 = getelementptr i8, i8* %.tmp2339, i32 %.tmp2338
%.tmp2341 = load i32, i32* %i
%.tmp2342 = load i8*, i8** %text
%.tmp2343 = getelementptr i8, i8* %.tmp2342, i32 %.tmp2341
%.tmp2344 = load i8, i8* %.tmp2343
store i8 %.tmp2344, i8* %.tmp2340
br label %.if.end.2298
.if.end.2298:
br label %.if.end.2284
.if.end.2284:
br label %.if.end.2252
.if.end.2252:
br label %.if.end.2238
.if.false.2238:
%.tmp2345 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2346 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2347 = load i32, i32* %.tmp2346
%.tmp2348 = load i8*, i8** %.tmp2345
%.tmp2349 = getelementptr i8, i8* %.tmp2348, i32 %.tmp2347
%.tmp2350 = load i32, i32* %i
%.tmp2351 = load i8*, i8** %text
%.tmp2352 = getelementptr i8, i8* %.tmp2351, i32 %.tmp2350
%.tmp2353 = load i8, i8* %.tmp2352
store i8 %.tmp2353, i8* %.tmp2349
br label %.if.end.2238
.if.end.2238:
br label %.if.end.2209
.if.end.2209:
%.tmp2354 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2355 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2356 = load i32, i32* %.tmp2355
%.tmp2357 = add i32 %.tmp2356, 1
store i32 %.tmp2357, i32* %.tmp2354
%.tmp2358 = load i32, i32* %i
%.tmp2359 = add i32 %.tmp2358, 1
store i32 %.tmp2359, i32* %i
br label %.for.start.2185
.for.end.2185:
%.tmp2360 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2361 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 1
%.tmp2362 = load i32, i32* %.tmp2361
%.tmp2363 = load i8*, i8** %.tmp2360
%.tmp2364 = getelementptr i8, i8* %.tmp2363, i32 %.tmp2362
store i8 0, i8* %.tmp2364
%buf = alloca i8*
%.tmp2365 = getelementptr i8*, i8** %buf, i32 0
%.tmp2367 = getelementptr [9 x i8], [9 x i8]*@.str2366, i32 0, i32 0
%.tmp2368 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2369 = load i8*, i8** %.tmp2368
%.tmp2370 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2365, i8* %.tmp2367, i8* %.tmp2369)
%.tmp2371 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string, i32 0, i32 2
%.tmp2372 = load i8*, i8** %.tmp2371
call void(i8*) @free(i8* %.tmp2372)
%.tmp2373 = load i8*, i8** %buf
ret i8* %.tmp2373
}
define i32 @m2176$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 2, i32* %i
br label %.for.start.2374
.for.start.2374:
%.tmp2375 = load i32, i32* %i
%.tmp2376 = load i8*, i8** %text
%.tmp2377 = getelementptr i8, i8* %.tmp2376, i32 %.tmp2375
%.tmp2378 = load i8, i8* %.tmp2377
%.tmp2379 = icmp ne i8 %.tmp2378, 0
br i1 %.tmp2379, label %.for.continue.2374, label %.for.end.2374
.for.continue.2374:
%.tmp2380 = load i32, i32* %i
%.tmp2381 = load i8*, i8** %text
%.tmp2382 = getelementptr i8, i8* %.tmp2381, i32 %.tmp2380
%.tmp2383 = load i8, i8* %.tmp2382
%.tmp2384 = icmp eq i8 %.tmp2383, 92
br i1 %.tmp2384, label %.if.true.2385, label %.if.false.2385
.if.true.2385:
%.tmp2386 = load i32, i32* %i
%.tmp2387 = add i32 %.tmp2386, 2
store i32 %.tmp2387, i32* %i
br label %.if.end.2385
.if.false.2385:
br label %.if.end.2385
.if.end.2385:
%.tmp2388 = load i32, i32* %len
%.tmp2389 = add i32 %.tmp2388, 1
store i32 %.tmp2389, i32* %len
%.tmp2390 = load i32, i32* %i
%.tmp2391 = add i32 %.tmp2390, 1
store i32 %.tmp2391, i32* %i
br label %.for.start.2374
.for.end.2374:
%.tmp2392 = load i32, i32* %len
%.tmp2393 = sub i32 %.tmp2392, 1
ret i32 %.tmp2393
}
@.str2366 = constant [9 x i8] c"c\22%s\5C00\22\00"
@DEBUG_INTERNALS = constant i1 0
%m1830$.ErrorList.type = type {%m717$.Error.type*,%m1830$.ErrorList.type*}
%m1830$.Type.type = type {i8*,i8*,i8*,%m1830$.Type.type*,%m1830$.Type.type*}
define %m1830$.Type.type* @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.t.arg) {
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.t.arg, %m1830$.Type.type** %t
%.tmp2394 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2395 = icmp eq %m1830$.Type.type* %.tmp2394, null
br i1 %.tmp2395, label %.if.true.2396, label %.if.false.2396
.if.true.2396:
%.tmp2397 = bitcast ptr null to %m1830$.Type.type*
ret %m1830$.Type.type* %.tmp2397
br label %.if.end.2396
.if.false.2396:
br label %.if.end.2396
.if.end.2396:
%.tmp2398 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp2399 = ptrtoint %m1830$.Type.type* %.tmp2398 to i32
%.tmp2400 = call i8*(i32) @malloc(i32 %.tmp2399)
%.tmp2401 = bitcast i8* %.tmp2400 to %m1830$.Type.type*
%clone = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2401, %m1830$.Type.type** %clone
%.tmp2402 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2403 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2402, i32 0, i32 3
%.tmp2404 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2405 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2404, i32 0, i32 3
%.tmp2406 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2405
store %m1830$.Type.type* %.tmp2406, %m1830$.Type.type** %.tmp2403
%.tmp2407 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2408 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2407, i32 0, i32 4
%.tmp2409 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2410 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2409, i32 0, i32 4
%.tmp2411 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2410
%.tmp2412 = call %m1830$.Type.type*(%m1830$.Type.type*) @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2411)
store %m1830$.Type.type* %.tmp2412, %m1830$.Type.type** %.tmp2408
%.tmp2413 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2414 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2413, i32 0, i32 2
%.tmp2415 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2416 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2415, i32 0, i32 2
%.tmp2417 = load i8*, i8** %.tmp2416
store i8* %.tmp2417, i8** %.tmp2414
%.tmp2418 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2419 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2418, i32 0, i32 0
%.tmp2420 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2421 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2420, i32 0, i32 0
%.tmp2422 = load i8*, i8** %.tmp2421
store i8* %.tmp2422, i8** %.tmp2419
%.tmp2423 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
%.tmp2424 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2423, i32 0, i32 1
%.tmp2425 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2426 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2425, i32 0, i32 1
%.tmp2427 = load i8*, i8** %.tmp2426
store i8* %.tmp2427, i8** %.tmp2424
%.tmp2428 = load %m1830$.Type.type*, %m1830$.Type.type** %clone
ret %m1830$.Type.type* %.tmp2428
}
define %m1830$.Type.type* @m1830$new_type.m1830$.Type.typep() {
%.tmp2429 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp2430 = ptrtoint %m1830$.Type.type* %.tmp2429 to i32
%.tmp2431 = call i8*(i32) @malloc(i32 %.tmp2430)
%.tmp2432 = bitcast i8* %.tmp2431 to %m1830$.Type.type*
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2432, %m1830$.Type.type** %type
%.tmp2433 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2434 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2433, i32 0, i32 1
store i8* null, i8** %.tmp2434
%.tmp2435 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2436 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2435, i32 0, i32 2
store i8* null, i8** %.tmp2436
%.tmp2437 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2438 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2437, i32 0, i32 0
store i8* null, i8** %.tmp2438
%.tmp2439 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2440 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2439, i32 0, i32 3
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp2440
%.tmp2441 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2442 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2441, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp2442
%.tmp2443 = load %m1830$.Type.type*, %m1830$.Type.type** %type
ret %m1830$.Type.type* %.tmp2443
}
define void @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.dest.arg, %m1830$.Type.type* %.src.arg) {
%dest = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.dest.arg, %m1830$.Type.type** %dest
%src = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.src.arg, %m1830$.Type.type** %src
%.tmp2444 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2445 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2444, i32 0, i32 0
%.tmp2446 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2447 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2446, i32 0, i32 0
%.tmp2448 = load i8*, i8** %.tmp2447
store i8* %.tmp2448, i8** %.tmp2445
%.tmp2449 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2450 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2449, i32 0, i32 1
%.tmp2451 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2452 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2451, i32 0, i32 1
%.tmp2453 = load i8*, i8** %.tmp2452
store i8* %.tmp2453, i8** %.tmp2450
%.tmp2454 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2455 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2454, i32 0, i32 2
%.tmp2456 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2457 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2456, i32 0, i32 2
%.tmp2458 = load i8*, i8** %.tmp2457
store i8* %.tmp2458, i8** %.tmp2455
%.tmp2459 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2460 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2459, i32 0, i32 3
%.tmp2461 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2460
%.tmp2462 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2463 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2462, i32 0, i32 3
%.tmp2464 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2463
%.tmp2465 = icmp ne %m1830$.Type.type* %.tmp2461, %.tmp2464
br i1 %.tmp2465, label %.if.true.2466, label %.if.false.2466
.if.true.2466:
%.tmp2467 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2468 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2467, i32 0, i32 3
%.tmp2469 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2470 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2469, i32 0, i32 3
%.tmp2471 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2470
store %m1830$.Type.type* %.tmp2471, %m1830$.Type.type** %.tmp2468
%.tmp2472 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2473 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2472, i32 0, i32 3
%.tmp2474 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2473
%.tmp2475 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2476 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2475, i32 0, i32 3
%.tmp2477 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2476
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2474, %m1830$.Type.type* %.tmp2477)
br label %.if.end.2466
.if.false.2466:
br label %.if.end.2466
.if.end.2466:
%.tmp2478 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2479 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2478, i32 0, i32 4
%.tmp2480 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2479
%.tmp2481 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2482 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2481, i32 0, i32 4
%.tmp2483 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2482
%.tmp2484 = icmp ne %m1830$.Type.type* %.tmp2480, %.tmp2483
br i1 %.tmp2484, label %.if.true.2485, label %.if.false.2485
.if.true.2485:
%.tmp2486 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2487 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2486, i32 0, i32 4
%.tmp2488 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2489 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2488, i32 0, i32 4
%.tmp2490 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2489
store %m1830$.Type.type* %.tmp2490, %m1830$.Type.type** %.tmp2487
%.tmp2491 = load %m1830$.Type.type*, %m1830$.Type.type** %dest
%.tmp2492 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2491, i32 0, i32 4
%.tmp2493 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2492
%.tmp2494 = load %m1830$.Type.type*, %m1830$.Type.type** %src
%.tmp2495 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2494, i32 0, i32 4
%.tmp2496 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2495
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp2493, %m1830$.Type.type* %.tmp2496)
br label %.if.end.2485
.if.false.2485:
br label %.if.end.2485
.if.end.2485:
ret void
}
define void @m1830$debug_type.v.m1830$.Type.typep.i(%m1830$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.t.arg, %m1830$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2497 = load i32, i32* %level
%.tmp2498 = add i32 %.tmp2497, 1
%.tmp2499 = call i8*(i32) @malloc(i32 %.tmp2498)
%.tmp2500 = bitcast i8* %.tmp2499 to i8*
%indent = alloca i8*
store i8* %.tmp2500, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2501
.for.start.2501:
%.tmp2502 = load i32, i32* %i
%.tmp2503 = load i32, i32* %level
%.tmp2504 = icmp slt i32 %.tmp2502, %.tmp2503
br i1 %.tmp2504, label %.for.continue.2501, label %.for.end.2501
.for.continue.2501:
%.tmp2505 = load i32, i32* %i
%.tmp2506 = load i8*, i8** %indent
%.tmp2507 = getelementptr i8, i8* %.tmp2506, i32 %.tmp2505
store i8 32, i8* %.tmp2507
%.tmp2508 = load i32, i32* %i
%.tmp2509 = add i32 %.tmp2508, 1
store i32 %.tmp2509, i32* %i
br label %.for.start.2501
.for.end.2501:
%.tmp2510 = load i32, i32* %level
%.tmp2511 = load i8*, i8** %indent
%.tmp2512 = getelementptr i8, i8* %.tmp2511, i32 %.tmp2510
store i8 0, i8* %.tmp2512
%.tmp2514 = getelementptr [5 x i8], [5 x i8]*@.str2513, i32 0, i32 0
%.tmp2515 = load i8*, i8** %indent
%.tmp2516 = call i32(i8*,...) @printf(i8* %.tmp2514, i8* %.tmp2515)
%.tmp2518 = getelementptr [21 x i8], [21 x i8]*@.str2517, i32 0, i32 0
%.tmp2519 = load i8*, i8** %indent
%.tmp2520 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2521 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2520, i32 0, i32 0
%.tmp2522 = load i8*, i8** %.tmp2521
%.tmp2523 = call i32(i8*,...) @printf(i8* %.tmp2518, i8* %.tmp2519, i8* %.tmp2522)
%.tmp2525 = getelementptr [16 x i8], [16 x i8]*@.str2524, i32 0, i32 0
%.tmp2526 = load i8*, i8** %indent
%.tmp2527 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2528 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2527, i32 0, i32 1
%.tmp2529 = load i8*, i8** %.tmp2528
%.tmp2530 = call i32(i8*,...) @printf(i8* %.tmp2525, i8* %.tmp2526, i8* %.tmp2529)
%.tmp2532 = getelementptr [16 x i8], [16 x i8]*@.str2531, i32 0, i32 0
%.tmp2533 = load i8*, i8** %indent
%.tmp2534 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2535 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2534, i32 0, i32 2
%.tmp2536 = load i8*, i8** %.tmp2535
%.tmp2537 = call i32(i8*,...) @printf(i8* %.tmp2532, i8* %.tmp2533, i8* %.tmp2536)
%.tmp2538 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2539 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2538, i32 0, i32 3
%.tmp2540 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2539
%.tmp2541 = icmp eq %m1830$.Type.type* %.tmp2540, null
br i1 %.tmp2541, label %.if.true.2542, label %.if.false.2542
.if.true.2542:
%.tmp2544 = getelementptr [16 x i8], [16 x i8]*@.str2543, i32 0, i32 0
%.tmp2545 = load i8*, i8** %indent
%.tmp2546 = call i32(i8*,...) @printf(i8* %.tmp2544, i8* %.tmp2545)
br label %.if.end.2542
.if.false.2542:
%.tmp2548 = getelementptr [10 x i8], [10 x i8]*@.str2547, i32 0, i32 0
%.tmp2549 = load i8*, i8** %indent
%.tmp2550 = call i32(i8*,...) @printf(i8* %.tmp2548, i8* %.tmp2549)
%.tmp2551 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2552 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2551, i32 0, i32 3
%.tmp2553 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2552
%.tmp2554 = load i32, i32* %level
%.tmp2555 = add i32 %.tmp2554, 1
call void(%m1830$.Type.type*,i32) @m1830$debug_type.v.m1830$.Type.typep.i(%m1830$.Type.type* %.tmp2553, i32 %.tmp2555)
br label %.if.end.2542
.if.end.2542:
%.tmp2556 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2557 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2556, i32 0, i32 4
%.tmp2558 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2557
%.tmp2559 = icmp eq %m1830$.Type.type* %.tmp2558, null
br i1 %.tmp2559, label %.if.true.2560, label %.if.false.2560
.if.true.2560:
%.tmp2562 = getelementptr [18 x i8], [18 x i8]*@.str2561, i32 0, i32 0
%.tmp2563 = load i8*, i8** %indent
%.tmp2564 = call i32(i8*,...) @printf(i8* %.tmp2562, i8* %.tmp2563)
br label %.if.end.2560
.if.false.2560:
%.tmp2566 = getelementptr [12 x i8], [12 x i8]*@.str2565, i32 0, i32 0
%.tmp2567 = load i8*, i8** %indent
%.tmp2568 = call i32(i8*,...) @printf(i8* %.tmp2566, i8* %.tmp2567)
%.tmp2569 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp2570 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2569, i32 0, i32 4
%.tmp2571 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2570
%.tmp2572 = load i32, i32* %level
%.tmp2573 = add i32 %.tmp2572, 1
call void(%m1830$.Type.type*,i32) @m1830$debug_type.v.m1830$.Type.typep.i(%m1830$.Type.type* %.tmp2571, i32 %.tmp2573)
br label %.if.end.2560
.if.end.2560:
%.tmp2575 = getelementptr [5 x i8], [5 x i8]*@.str2574, i32 0, i32 0
%.tmp2576 = load i8*, i8** %indent
%.tmp2577 = call i32(i8*,...) @printf(i8* %.tmp2575, i8* %.tmp2576)
ret void
}
%m1830$.AssignableInfo.type = type {i8*,i8,i8*,%m1830$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1830$.AssignableInfo.type* @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.node.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%.tmp2578 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* null, i32 1
%.tmp2579 = ptrtoint %m1830$.AssignableInfo.type* %.tmp2578 to i32
%.tmp2580 = call i8*(i32) @malloc(i32 %.tmp2579)
%.tmp2581 = bitcast i8* %.tmp2580 to %m1830$.AssignableInfo.type*
%ptr = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp2581, %m1830$.AssignableInfo.type** %ptr
%.tmp2582 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2583 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2582, i32 0, i32 1
%.tmp2584 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2584, i8* %.tmp2583
%.tmp2585 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2586 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2585, i32 0, i32 0
store i8* null, i8** %.tmp2586
%.tmp2587 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2588 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2587, i32 0, i32 2
store i8* null, i8** %.tmp2588
%.tmp2589 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2590 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2589, i32 0, i32 3
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp2590
%.tmp2591 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2592 = icmp ne %m286$.Node.type* %.tmp2591, null
br i1 %.tmp2592, label %.if.true.2593, label %.if.false.2593
.if.true.2593:
%.tmp2594 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2595 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2594, i32 0, i32 4
%.tmp2596 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2597 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2596, i32 0, i32 3
%.tmp2598 = load i32, i32* %.tmp2597
store i32 %.tmp2598, i32* %.tmp2595
%.tmp2599 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2600 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2599, i32 0, i32 5
%.tmp2601 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2602 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2601, i32 0, i32 4
%.tmp2603 = load i32, i32* %.tmp2602
store i32 %.tmp2603, i32* %.tmp2600
%.tmp2604 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2605 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2604, i32 0, i32 6
%.tmp2606 = load %m286$.Node.type*, %m286$.Node.type** %node
%.tmp2607 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2606, i32 0, i32 2
%.tmp2608 = load i8*, i8** %.tmp2607
store i8* %.tmp2608, i8** %.tmp2605
br label %.if.end.2593
.if.false.2593:
%.tmp2609 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2610 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2609, i32 0, i32 4
store i32 0, i32* %.tmp2610
%.tmp2611 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2612 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2611, i32 0, i32 5
store i32 0, i32* %.tmp2612
%.tmp2613 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
%.tmp2614 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2613, i32 0, i32 6
store i8* null, i8** %.tmp2614
br label %.if.end.2593
.if.end.2593:
%.tmp2615 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %ptr
ret %m1830$.AssignableInfo.type* %.tmp2615
}
define void @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2616 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2617 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2616, i32 0, i32 0
%.tmp2618 = load i8*, i8** %id
store i8* %.tmp2618, i8** %.tmp2617
%.tmp2619 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2620 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2619, i32 0, i32 1
%.tmp2621 = load i8, i8* %scope
store i8 %.tmp2621, i8* %.tmp2620
ret void
}
define i8* @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%.tmp2622 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2623 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2622, i32 0, i32 1
%.tmp2624 = load i8, i8* %.tmp2623
%.tmp2625 = load i8, i8* @SCOPE_CONST
%.tmp2626 = icmp eq i8 %.tmp2624, %.tmp2625
br i1 %.tmp2626, label %.if.true.2627, label %.if.false.2627
.if.true.2627:
%.tmp2628 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2629 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2628, i32 0, i32 0
%.tmp2630 = load i8*, i8** %.tmp2629
ret i8* %.tmp2630
br label %.if.end.2627
.if.false.2627:
br label %.if.end.2627
.if.end.2627:
%buf = alloca i8*
%.tmp2631 = getelementptr i8*, i8** %buf, i32 0
%.tmp2633 = getelementptr [5 x i8], [5 x i8]*@.str2632, i32 0, i32 0
%.tmp2634 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2635 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2634, i32 0, i32 1
%.tmp2636 = load i8, i8* %.tmp2635
%.tmp2637 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2638 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2637, i32 0, i32 0
%.tmp2639 = load i8*, i8** %.tmp2638
%.tmp2640 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2631, i8* %.tmp2633, i8 %.tmp2636, i8* %.tmp2639)
%.tmp2641 = load i8*, i8** %buf
ret i8* %.tmp2641
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
%.tmp2642 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2644 = getelementptr [7 x i8], [7 x i8]*@.str2643, i32 0, i32 0
%.tmp2645 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2646 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2645)
%.tmp2647 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2642, i8* %.tmp2644, i32 %.tmp2646)
%.tmp2648 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2649 = load i8, i8* @SCOPE_LOCAL
%.tmp2650 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp2648, i8 %.tmp2649, i8* %.tmp2650)
ret void
}
define %m1830$.ModuleLookup.type* @m1830$get_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2652 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2653 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2652, i32 0, i32 5
%.tmp2654 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2653
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2654, %m1830$.ModuleLookup.type** %m
br label %.for.start.2651
.for.start.2651:
%.tmp2655 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2656 = icmp ne %m1830$.ModuleLookup.type* %.tmp2655, null
br i1 %.tmp2656, label %.for.continue.2651, label %.for.end.2651
.for.continue.2651:
%.tmp2657 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2658 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2657, i32 0, i32 0
%.tmp2659 = load i8*, i8** %.tmp2658
%.tmp2660 = load i8*, i8** %filename
%.tmp2661 = call i32(i8*,i8*) @strcmp(i8* %.tmp2659, i8* %.tmp2660)
%.tmp2662 = icmp eq i32 %.tmp2661, 0
br i1 %.tmp2662, label %.if.true.2663, label %.if.false.2663
.if.true.2663:
%.tmp2664 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
ret %m1830$.ModuleLookup.type* %.tmp2664
br label %.if.end.2663
.if.false.2663:
br label %.if.end.2663
.if.end.2663:
%.tmp2665 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2666 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2665, i32 0, i32 2
%.tmp2667 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2666
store %m1830$.ModuleLookup.type* %.tmp2667, %m1830$.ModuleLookup.type** %m
br label %.for.start.2651
.for.end.2651:
%.tmp2668 = bitcast ptr null to %m1830$.ModuleLookup.type*
ret %m1830$.ModuleLookup.type* %.tmp2668
}
define %m1830$.ModuleLookup.type* @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2669 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2670 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2671 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2670, i32 0, i32 6
%.tmp2672 = load i8*, i8** %.tmp2671
%.tmp2673 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*,i8*) @m1830$get_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp2669, i8* %.tmp2672)
ret %m1830$.ModuleLookup.type* %.tmp2673
}
define i32 @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2674 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2675 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2674, i32 0, i32 4
%.tmp2676 = load i32, i32* %.tmp2675
%uid = alloca i32
store i32 %.tmp2676, i32* %uid
%.tmp2677 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2678 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2677, i32 0, i32 4
%.tmp2679 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2680 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2679, i32 0, i32 4
%.tmp2681 = load i32, i32* %.tmp2680
%.tmp2682 = add i32 %.tmp2681, 1
store i32 %.tmp2682, i32* %.tmp2678
%.tmp2683 = load i32, i32* %uid
ret i32 %.tmp2683
}
define %m1830$.CompilerCtx.type* @m1830$new_context.m1830$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2684 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* null, i32 1
%.tmp2685 = ptrtoint %m1830$.CompilerCtx.type* %.tmp2684 to i32
%.tmp2686 = call i8*(i32) @malloc(i32 %.tmp2685)
%.tmp2687 = bitcast i8* %.tmp2686 to %m1830$.CompilerCtx.type*
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.tmp2687, %m1830$.CompilerCtx.type** %ctx
%.tmp2688 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2689 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2688, i32 0, i32 1
%.tmp2690 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2690, %m0$.File.type** %.tmp2689
%.tmp2691 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2692 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2691, i32 0, i32 0
%.tmp2693 = bitcast ptr null to %m286$.Node.type*
store %m286$.Node.type* %.tmp2693, %m286$.Node.type** %.tmp2692
%.tmp2694 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2695 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2694, i32 0, i32 2
store %m1830$.ErrorList.type* null, %m1830$.ErrorList.type** %.tmp2695
%.tmp2696 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2697 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2696, i32 0, i32 4
store i32 0, i32* %.tmp2697
%.tmp2698 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2699 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2698, i32 0, i32 3
store %m1830$.GlobalName.type* null, %m1830$.GlobalName.type** %.tmp2699
%.tmp2700 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2701 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2700, i32 0, i32 6
%.tmp2702 = load i8*, i8** %filename
store i8* %.tmp2702, i8** %.tmp2701
%.tmp2703 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2704 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2703, i32 0, i32 5
%.tmp2705 = load i32, i32* @ModuleLookup_size
%.tmp2706 = call i8*(i32) @malloc(i32 %.tmp2705)
%.tmp2707 = bitcast i8* %.tmp2706 to %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2707, %m1830$.ModuleLookup.type** %.tmp2704
%.tmp2708 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2709 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2708, i32 0, i32 5
%.tmp2710 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2709
%.tmp2711 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2710, i32 0, i32 0
%.tmp2712 = load i8*, i8** %filename
store i8* %.tmp2712, i8** %.tmp2711
%.tmp2713 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2714 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2713, i32 0, i32 5
%.tmp2715 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2714
%.tmp2716 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2715, i32 0, i32 3
store %m1830$.Scope.type* null, %m1830$.Scope.type** %.tmp2716
%.tmp2717 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2718 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2717, i32 0, i32 5
%.tmp2719 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2718
%.tmp2720 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2719, i32 0, i32 1
%.tmp2722 = getelementptr [1 x i8], [1 x i8]*@.str2721, i32 0, i32 0
store i8* %.tmp2722, i8** %.tmp2720
%.tmp2723 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2724 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2723, i32 0, i32 5
%.tmp2725 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp2724
%.tmp2726 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2725, i32 0, i32 2
store %m1830$.ModuleLookup.type* null, %m1830$.ModuleLookup.type** %.tmp2726
%.tmp2727 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2728 = bitcast %m1830$.CompilerCtx.type* %.tmp2727 to %m1830$.CompilerCtx.type*
ret %m1830$.CompilerCtx.type* %.tmp2728
}
define void @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2729 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* null, i32 1
%.tmp2730 = ptrtoint %m1830$.Scope.type* %.tmp2729 to i32
%.tmp2731 = call i8*(i32) @malloc(i32 %.tmp2730)
%.tmp2732 = bitcast i8* %.tmp2731 to %m1830$.Scope.type*
%s = alloca %m1830$.Scope.type*
store %m1830$.Scope.type* %.tmp2732, %m1830$.Scope.type** %s
%.tmp2733 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2734 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2733)
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2734, %m1830$.ModuleLookup.type** %m
%.tmp2735 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp2736 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp2735, i32 0, i32 2
%.tmp2737 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2738 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2737, i32 0, i32 3
%.tmp2739 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2738
store %m1830$.Scope.type* %.tmp2739, %m1830$.Scope.type** %.tmp2736
%.tmp2740 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp2741 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp2740, i32 0, i32 1
store %m1830$.ScopeItem.type* null, %m1830$.ScopeItem.type** %.tmp2741
%.tmp2742 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2743 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2742, i32 0, i32 3
%.tmp2744 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
store %m1830$.Scope.type* %.tmp2744, %m1830$.Scope.type** %.tmp2743
ret void
}
define void @m1830$pop_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%.tmp2745 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2746 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2745)
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2746, %m1830$.ModuleLookup.type** %m
%.tmp2747 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2748 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2747, i32 0, i32 3
%.tmp2749 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2748
%.tmp2750 = icmp ne %m1830$.Scope.type* %.tmp2749, null
%.tmp2752 = getelementptr [61 x i8], [61 x i8]*@.str2751, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2750, i8* %.tmp2752)
%.tmp2753 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2754 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2753, i32 0, i32 3
%.tmp2755 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2756 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2755, i32 0, i32 3
%.tmp2757 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2756
%.tmp2758 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp2757, i32 0, i32 2
%.tmp2759 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp2758
store %m1830$.Scope.type* %.tmp2759, %m1830$.Scope.type** %.tmp2754
ret void
}
define i1 @m1830$compile_file.b.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2760 = call i8*() @m1831$grammar.cp()
%.tmp2761 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2760)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2761, %m0$.File.type** %grammar_file
%.tmp2762 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2763 = icmp eq %m0$.File.type* %.tmp2762, null
br i1 %.tmp2763, label %.if.true.2764, label %.if.false.2764
.if.true.2764:
ret i1 0
br label %.if.end.2764
.if.false.2764:
br label %.if.end.2764
.if.end.2764:
%.tmp2765 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2766 = call %m286$.ParsingContext.type*(%m0$.File.type*) @m286$new_context.m286$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2765)
%grammar_ctx = alloca %m286$.ParsingContext.type*
store %m286$.ParsingContext.type* %.tmp2766, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2767 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2768 = call %m286$.Rule.type**(%m286$.ParsingContext.type*) @m286$parse_grammar.m286$.Rule.typepp.m286$.ParsingContext.typep(%m286$.ParsingContext.type* %.tmp2767)
%grammar = alloca %m286$.Rule.type**
store %m286$.Rule.type** %.tmp2768, %m286$.Rule.type*** %grammar
%.tmp2769 = load %m286$.ParsingContext.type*, %m286$.ParsingContext.type** %grammar_ctx
%.tmp2770 = bitcast %m286$.ParsingContext.type* %.tmp2769 to i8*
call void(i8*) @free(i8* %.tmp2770)
%.tmp2771 = load i8*, i8** %filepath
%.tmp2772 = load i32, i32* @O_RDONLY
%.tmp2773 = call i32(i8*,i32) @open(i8* %.tmp2771, i32 %.tmp2772)
%input_fd = alloca i32
store i32 %.tmp2773, i32* %input_fd
%.tmp2774 = load i32, i32* %input_fd
%.tmp2775 = call %m209$.PeekerInfo.type*(i32) @m209$new.m209$.PeekerInfo.typep.i(i32 %.tmp2774)
%p = alloca %m209$.PeekerInfo.type*
store %m209$.PeekerInfo.type* %.tmp2775, %m209$.PeekerInfo.type** %p
%.tmp2776 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2777 = getelementptr %m209$.PeekerInfo.type, %m209$.PeekerInfo.type* %.tmp2776, i32 0, i32 6
%.tmp2778 = load i8*, i8** %filepath
store i8* %.tmp2778, i8** %.tmp2777
%.tmp2779 = load %m209$.PeekerInfo.type*, %m209$.PeekerInfo.type** %p
%.tmp2780 = call %m287$.Token.type*(%m209$.PeekerInfo.type*,i1) @m287$tokenize.m287$.Token.typep.m209$.PeekerInfo.typep.b(%m209$.PeekerInfo.type* %.tmp2779, i1 0)
%tokens = alloca %m287$.Token.type*
store %m287$.Token.type* %.tmp2780, %m287$.Token.type** %tokens
%.tmp2781 = load %m286$.Rule.type**, %m286$.Rule.type*** %grammar
%.tmp2783 = getelementptr [6 x i8], [6 x i8]*@.str2782, i32 0, i32 0
%.tmp2784 = load %m287$.Token.type*, %m287$.Token.type** %tokens
%.tmp2785 = call %m286$.ParseResult.type*(%m286$.Rule.type**,i8*,%m287$.Token.type*) @m286$ast.m286$.ParseResult.typep.m286$.Rule.typepp.cp.m287$.Token.typep(%m286$.Rule.type** %.tmp2781, i8* %.tmp2783, %m287$.Token.type* %.tmp2784)
%ast = alloca %m286$.ParseResult.type*
store %m286$.ParseResult.type* %.tmp2785, %m286$.ParseResult.type** %ast
%.tmp2786 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2787 = load %m286$.ParseResult.type*, %m286$.ParseResult.type** %ast
%.tmp2788 = getelementptr %m286$.ParseResult.type, %m286$.ParseResult.type* %.tmp2787, i32 0, i32 1
%.tmp2789 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2788
%.tmp2790 = call i1(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile.b.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp2786, %m286$.Node.type* %.tmp2789)
ret i1 %.tmp2790
}
define i1 @m1830$compile.b.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.ast.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%ast = alloca %m286$.Node.type*
store %m286$.Node.type* %.ast.arg, %m286$.Node.type** %ast
%.tmp2791 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2792 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2791, i32 0, i32 0
%.tmp2793 = load i8*, i8** %.tmp2792
%.tmp2795 = getelementptr [6 x i8], [6 x i8]*@.str2794, i32 0, i32 0
%.tmp2796 = call i32(i8*,i8*) @strcmp(i8* %.tmp2793, i8* %.tmp2795)
%.tmp2797 = icmp ne i32 %.tmp2796, 0
br i1 %.tmp2797, label %.if.true.2798, label %.if.false.2798
.if.true.2798:
ret i1 0
br label %.if.end.2798
.if.false.2798:
br label %.if.end.2798
.if.end.2798:
%.tmp2799 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2799)
%.tmp2800 = load %m286$.Node.type*, %m286$.Node.type** %ast
%.tmp2801 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2800, i32 0, i32 6
%.tmp2802 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2801
%start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2802, %m286$.Node.type** %start
%.tmp2803 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2804 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2803, i32 0, i32 0
%.tmp2805 = load i8*, i8** %.tmp2804
%.tmp2807 = getelementptr [13 x i8], [13 x i8]*@.str2806, i32 0, i32 0
%.tmp2808 = call i32(i8*,i8*) @strcmp(i8* %.tmp2805, i8* %.tmp2807)
%.tmp2809 = icmp eq i32 %.tmp2808, 0
br i1 %.tmp2809, label %.if.true.2810, label %.if.false.2810
.if.true.2810:
%.tmp2811 = load %m286$.Node.type*, %m286$.Node.type** %start
%.tmp2812 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2811, i32 0, i32 7
%.tmp2813 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2812
store %m286$.Node.type* %.tmp2813, %m286$.Node.type** %start
br label %.if.end.2810
.if.false.2810:
br label %.if.end.2810
.if.end.2810:
%.tmp2815 = load %m286$.Node.type*, %m286$.Node.type** %start
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2815, %m286$.Node.type** %stmt
br label %.for.start.2814
.for.start.2814:
%.tmp2816 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2817 = icmp ne %m286$.Node.type* %.tmp2816, null
br i1 %.tmp2817, label %.for.continue.2814, label %.for.end.2814
.for.continue.2814:
%.tmp2818 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2819 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2820 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2819, i32 0, i32 6
%.tmp2821 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2820
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1830$compile_statement.v.m1830$.CompilerCtx.typep.m286$.Node.typep.b(%m1830$.CompilerCtx.type* %.tmp2818, %m286$.Node.type* %.tmp2821, i1 1)
%.tmp2822 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2823 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2822, i32 0, i32 7
%.tmp2824 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2823
store %m286$.Node.type* %.tmp2824, %m286$.Node.type** %stmt
br label %.for.start.2814
.for.end.2814:
%.tmp2826 = load %m286$.Node.type*, %m286$.Node.type** %start
%s = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2826, %m286$.Node.type** %s
br label %.for.start.2825
.for.start.2825:
%.tmp2827 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2828 = icmp ne %m286$.Node.type* %.tmp2827, null
br i1 %.tmp2828, label %.for.continue.2825, label %.for.end.2825
.for.continue.2825:
%.tmp2829 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2830 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2831 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2830, i32 0, i32 6
%.tmp2832 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2831
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i1) @m1830$compile_statement.v.m1830$.CompilerCtx.typep.m286$.Node.typep.b(%m1830$.CompilerCtx.type* %.tmp2829, %m286$.Node.type* %.tmp2832, i1 0)
%.tmp2833 = load %m286$.Node.type*, %m286$.Node.type** %s
%.tmp2834 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2833, i32 0, i32 7
%.tmp2835 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2834
store %m286$.Node.type* %.tmp2835, %m286$.Node.type** %s
br label %.for.start.2825
.for.end.2825:
%.tmp2836 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2837 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2836, i32 0, i32 2
%.tmp2838 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp2837
%.tmp2839 = icmp ne %m1830$.ErrorList.type* %.tmp2838, null
%has_errors = alloca i1
store i1 %.tmp2839, i1* %has_errors
%.tmp2841 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2842 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2841, i32 0, i32 2
%.tmp2843 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp2842
%err = alloca %m1830$.ErrorList.type*
store %m1830$.ErrorList.type* %.tmp2843, %m1830$.ErrorList.type** %err
br label %.for.start.2840
.for.start.2840:
%.tmp2844 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %err
%.tmp2845 = icmp ne %m1830$.ErrorList.type* %.tmp2844, null
br i1 %.tmp2845, label %.for.continue.2840, label %.for.end.2840
.for.continue.2840:
%.tmp2846 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %err
%.tmp2847 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp2846, i32 0, i32 0
%.tmp2848 = load %m717$.Error.type*, %m717$.Error.type** %.tmp2847
call void(%m717$.Error.type*) @m717$report.v.m717$.Error.typep(%m717$.Error.type* %.tmp2848)
%.tmp2849 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %err
%.tmp2850 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp2849, i32 0, i32 1
%.tmp2851 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp2850
store %m1830$.ErrorList.type* %.tmp2851, %m1830$.ErrorList.type** %err
br label %.for.start.2840
.for.end.2840:
%.tmp2853 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2854 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2853, i32 0, i32 3
%.tmp2855 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp2854
%g = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.tmp2855, %m1830$.GlobalName.type** %g
br label %.for.start.2852
.for.start.2852:
%.tmp2856 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2857 = icmp ne %m1830$.GlobalName.type* %.tmp2856, null
br i1 %.tmp2857, label %.for.continue.2852, label %.for.end.2852
.for.continue.2852:
%.tmp2858 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2859 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
call void(%m1830$.CompilerCtx.type*,%m1830$.GlobalName.type*) @m1830$compile_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.tmp2858, %m1830$.GlobalName.type* %.tmp2859)
%.tmp2860 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2861 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2860, i32 0, i32 4
%.tmp2862 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp2861
store %m1830$.GlobalName.type* %.tmp2862, %m1830$.GlobalName.type** %g
br label %.for.start.2852
.for.end.2852:
%.tmp2863 = load i1, i1* %has_errors
ret i1 %.tmp2863
}
define void @m1830$compile_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%g = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.g.arg, %m1830$.GlobalName.type** %g
%.tmp2864 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2865 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2864, i32 0, i32 2
%.tmp2866 = load i1, i1* %.tmp2865
%.tmp2867 = icmp eq i1 %.tmp2866, 0
%.tmp2868 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2869 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2868, i32 0, i32 1
%.tmp2870 = load i8*, i8** %.tmp2869
%.tmp2872 = getelementptr [7 x i8], [7 x i8]*@.str2871, i32 0, i32 0
%.tmp2873 = call i32(i8*,i8*) @strcmp(i8* %.tmp2870, i8* %.tmp2872)
%.tmp2874 = icmp eq i32 %.tmp2873, 0
%.tmp2875 = and i1 %.tmp2867, %.tmp2874
br i1 %.tmp2875, label %.if.true.2876, label %.if.false.2876
.if.true.2876:
%.tmp2877 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2878 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp2877, i32 0, i32 1
%.tmp2879 = load %m0$.File.type*, %m0$.File.type** %.tmp2878
%.tmp2881 = getelementptr [21 x i8], [21 x i8]*@.str2880, i32 0, i32 0
%.tmp2882 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2883 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2882, i32 0, i32 3
%.tmp2884 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp2883
%.tmp2885 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp2884)
%.tmp2886 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2887 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2888 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2887, i32 0, i32 3
%.tmp2889 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp2888
%.tmp2890 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2889, i32 0, i32 3
%.tmp2891 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2890
%.tmp2892 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp2886, %m1830$.Type.type* %.tmp2891)
%.tmp2893 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2894 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2893, i32 0, i32 0
%.tmp2895 = load i8*, i8** %.tmp2894
%.tmp2896 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2879, i8* %.tmp2881, i8* %.tmp2885, i8* %.tmp2892, i8* %.tmp2895)
%.tmp2897 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
%.tmp2898 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp2897, i32 0, i32 2
store i1 1, i1* %.tmp2898
br label %.if.end.2876
.if.false.2876:
br label %.if.end.2876
.if.end.2876:
ret void
}
define i8* @m1830$get_mod_prefix.cp.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2899 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2900 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp2899)
%m = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp2900, %m1830$.ModuleLookup.type** %m
%.tmp2901 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp2902 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp2901, i32 0, i32 1
%.tmp2903 = load i8*, i8** %.tmp2902
ret i8* %.tmp2903
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
%.tmp2904 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2905 = load %m286$.Node.type*, %m286$.Node.type** %fn
%.tmp2906 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2905, i32 0, i32 2
%.tmp2907 = load i8*, i8** %.tmp2906
%.tmp2908 = call i8*(%m1830$.CompilerCtx.type*,i8*) @m1830$get_mod_prefix.cp.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp2904, i8* %.tmp2907)
%prefix = alloca i8*
store i8* %.tmp2908, i8** %prefix
%.tmp2909 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2911 = getelementptr [5 x i8], [5 x i8]*@.str2910, i32 0, i32 0
%.tmp2912 = load i8*, i8** %prefix
%.tmp2913 = load i8*, i8** %original_name
%.tmp2914 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2909, i8* %.tmp2911, i8* %.tmp2912, i8* %.tmp2913)
%.tmp2915 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2916 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2915, i32 0, i32 0
%.tmp2917 = load i8*, i8** %.tmp2916
%.tmp2919 = getelementptr [9 x i8], [9 x i8]*@.str2918, i32 0, i32 0
%.tmp2920 = call i32(i8*,i8*) @strcmp(i8* %.tmp2917, i8* %.tmp2919)
%.tmp2921 = icmp eq i32 %.tmp2920, 0
br i1 %.tmp2921, label %.if.true.2922, label %.if.false.2922
.if.true.2922:
%.tmp2923 = load i8*, i8** %mangled_name
%.tmp2925 = getelementptr [5 x i8], [5 x i8]*@.str2924, i32 0, i32 0
%.tmp2926 = call i32(i8*,i8*) @strcmp(i8* %.tmp2923, i8* %.tmp2925)
%.tmp2927 = icmp ne i32 %.tmp2926, 0
br i1 %.tmp2927, label %.if.true.2928, label %.if.false.2928
.if.true.2928:
%tmp_buff = alloca i8*
%swap_var = alloca i8*
%.tmp2930 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp2931 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2930, i32 0, i32 3
%.tmp2932 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2931
%tp = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp2932, %m1830$.Type.type** %tp
br label %.for.start.2929
.for.start.2929:
%.tmp2933 = load %m1830$.Type.type*, %m1830$.Type.type** %tp
%.tmp2934 = icmp ne %m1830$.Type.type* %.tmp2933, null
br i1 %.tmp2934, label %.for.continue.2929, label %.for.end.2929
.for.continue.2929:
%.tmp2935 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2937 = getelementptr [6 x i8], [6 x i8]*@.str2936, i32 0, i32 0
%.tmp2938 = load i8*, i8** %mangled_name
%.tmp2939 = load %m1830$.Type.type*, %m1830$.Type.type** %tp
%.tmp2940 = call i8*(%m1830$.Type.type*) @m1830$type_abbr.cp.m1830$.Type.typep(%m1830$.Type.type* %.tmp2939)
%.tmp2941 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2935, i8* %.tmp2937, i8* %.tmp2938, i8* %.tmp2940)
%.tmp2942 = load i8*, i8** %tmp_buff
store i8* %.tmp2942, i8** %swap_var
%.tmp2943 = load i8*, i8** %mangled_name
store i8* %.tmp2943, i8** %tmp_buff
%.tmp2944 = load i8*, i8** %swap_var
store i8* %.tmp2944, i8** %mangled_name
%.tmp2945 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2945)
%.tmp2946 = load %m1830$.Type.type*, %m1830$.Type.type** %tp
%.tmp2947 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp2946, i32 0, i32 4
%.tmp2948 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2947
store %m1830$.Type.type* %.tmp2948, %m1830$.Type.type** %tp
br label %.for.start.2929
.for.end.2929:
br label %.if.end.2928
.if.false.2928:
br label %.if.end.2928
.if.end.2928:
br label %.if.end.2922
.if.false.2922:
br label %.if.end.2922
.if.end.2922:
%.tmp2949 = load i8*, i8** %mangled_name
ret i8* %.tmp2949
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
%.tmp2950 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2951 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2950, i32 0, i32 0
%.tmp2952 = load i8*, i8** %.tmp2951
%.tmp2954 = getelementptr [3 x i8], [3 x i8]*@.str2953, i32 0, i32 0
%.tmp2955 = call i32(i8*,i8*) @strcmp(i8* %.tmp2952, i8* %.tmp2954)
%.tmp2956 = icmp eq i32 %.tmp2955, 0
br i1 %.tmp2956, label %.if.true.2957, label %.if.false.2957
.if.true.2957:
ret void
br label %.if.end.2957
.if.false.2957:
%.tmp2958 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2959 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2958, i32 0, i32 0
%.tmp2960 = load i8*, i8** %.tmp2959
%.tmp2962 = getelementptr [7 x i8], [7 x i8]*@.str2961, i32 0, i32 0
%.tmp2963 = call i32(i8*,i8*) @strcmp(i8* %.tmp2960, i8* %.tmp2962)
%.tmp2964 = icmp eq i32 %.tmp2963, 0
br i1 %.tmp2964, label %.if.true.2965, label %.if.false.2965
.if.true.2965:
%.tmp2966 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2967 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2966, i32 0, i32 6
%.tmp2968 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2967
%.tmp2970 = getelementptr [11 x i8], [11 x i8]*@.str2969, i32 0, i32 0
%.tmp2971 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp2968, i8* %.tmp2970)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp2971, %m286$.Node.type** %assignable
%.tmp2972 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp2973 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp2974 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp2972, %m286$.Node.type* %.tmp2973)
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp2974, %m1830$.AssignableInfo.type** %a_info
%.tmp2975 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp2976 = icmp eq %m1830$.AssignableInfo.type* %.tmp2975, null
br i1 %.tmp2976, label %.if.true.2977, label %.if.false.2977
.if.true.2977:
ret void
br label %.if.end.2977
.if.false.2977:
br label %.if.end.2977
.if.end.2977:
%.tmp2978 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2979 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp2978)
store %m1830$.AssignableInfo.type* %.tmp2979, %m1830$.AssignableInfo.type** %info
%.tmp2980 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp2981 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2980, i32 0, i32 6
%.tmp2982 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2981
%.tmp2983 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2982, i32 0, i32 7
%.tmp2984 = load %m286$.Node.type*, %m286$.Node.type** %.tmp2983
%.tmp2985 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp2984, i32 0, i32 1
%.tmp2986 = load i8*, i8** %.tmp2985
%global_name = alloca i8*
store i8* %.tmp2986, i8** %global_name
%.tmp2987 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2988 = load i8, i8* @SCOPE_GLOBAL
%.tmp2989 = load i8*, i8** %global_name
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp2987, i8 %.tmp2988, i8* %.tmp2989)
%.tmp2990 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2991 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2990, i32 0, i32 3
%.tmp2992 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp2993 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2992, i32 0, i32 3
%.tmp2994 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp2993
store %m1830$.Type.type* %.tmp2994, %m1830$.Type.type** %.tmp2991
%.tmp2995 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp2996 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp2995, i32 0, i32 2
%.tmp2998 = getelementptr [9 x i8], [9 x i8]*@.str2997, i32 0, i32 0
store i8* %.tmp2998, i8** %.tmp2996
%.tmp2999 = load i1, i1* %shallow
%.tmp3000 = icmp eq i1 %.tmp2999, 1
br i1 %.tmp3000, label %.if.true.3001, label %.if.false.3001
.if.true.3001:
%.tmp3002 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3003 = load i8*, i8** %global_name
%.tmp3004 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3002, i8* %.tmp3003, %m1830$.AssignableInfo.type* %.tmp3004)
br label %.if.end.3001
.if.false.3001:
%.tmp3005 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3006 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3005, i32 0, i32 1
%.tmp3007 = load %m0$.File.type*, %m0$.File.type** %.tmp3006
%.tmp3009 = getelementptr [21 x i8], [21 x i8]*@.str3008, i32 0, i32 0
%.tmp3010 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3011 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3010)
%.tmp3012 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3013 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3014 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3013, i32 0, i32 3
%.tmp3015 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3014
%.tmp3016 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3012, %m1830$.Type.type* %.tmp3015)
%.tmp3017 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3018 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3017)
%.tmp3019 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3007, i8* %.tmp3009, i8* %.tmp3011, i8* %.tmp3016, i8* %.tmp3018)
br label %.if.end.3001
.if.end.3001:
br label %.if.end.2965
.if.false.2965:
%.tmp3020 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3021 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3020, i32 0, i32 0
%.tmp3022 = load i8*, i8** %.tmp3021
%.tmp3024 = getelementptr [10 x i8], [10 x i8]*@.str3023, i32 0, i32 0
%.tmp3025 = call i32(i8*,i8*) @strcmp(i8* %.tmp3022, i8* %.tmp3024)
%.tmp3026 = icmp eq i32 %.tmp3025, 0
br i1 %.tmp3026, label %.if.true.3027, label %.if.false.3027
.if.true.3027:
%.tmp3028 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3029 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3028, i32 0, i32 6
%.tmp3030 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3029
%.tmp3031 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3030, i32 0, i32 7
%.tmp3032 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3031
%.tmp3033 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3032, i32 0, i32 1
%.tmp3034 = load i8*, i8** %.tmp3033
%type_name = alloca i8*
store i8* %.tmp3034, i8** %type_name
%.tmp3035 = load i1, i1* %shallow
%.tmp3036 = icmp eq i1 %.tmp3035, 1
br i1 %.tmp3036, label %.if.true.3037, label %.if.false.3037
.if.true.3037:
%.tmp3038 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3039 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3038)
store %m1830$.AssignableInfo.type* %.tmp3039, %m1830$.AssignableInfo.type** %info
%.tmp3040 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3041 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3040)
%mod_from = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp3041, %m1830$.ModuleLookup.type** %mod_from
%.tmp3042 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp3044 = getelementptr [11 x i8], [11 x i8]*@.str3043, i32 0, i32 0
%.tmp3045 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod_from
%.tmp3046 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3045, i32 0, i32 1
%.tmp3047 = load i8*, i8** %.tmp3046
%.tmp3048 = load i8*, i8** %type_name
%.tmp3049 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3042, i8* %.tmp3044, i8* %.tmp3047, i8* %.tmp3048)
%.tmp3050 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3051 = load i8, i8* @SCOPE_LOCAL
%.tmp3052 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3050, i8 %.tmp3051, i8* %.tmp3052)
%.tmp3053 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3054 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3053, i32 0, i32 2
%.tmp3056 = getelementptr [10 x i8], [10 x i8]*@.str3055, i32 0, i32 0
store i8* %.tmp3056, i8** %.tmp3054
%.tmp3057 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3058 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3057, i32 0, i32 4
%.tmp3059 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3060 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3059, i32 0, i32 3
%.tmp3061 = load i32, i32* %.tmp3060
store i32 %.tmp3061, i32* %.tmp3058
%.tmp3062 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3063 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3062, i32 0, i32 5
%.tmp3064 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3065 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3064, i32 0, i32 4
%.tmp3066 = load i32, i32* %.tmp3065
store i32 %.tmp3066, i32* %.tmp3063
%.tmp3067 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3068 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3067, i32 0, i32 3
%.tmp3069 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp3069, %m1830$.Type.type** %.tmp3068
%.tmp3070 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3071 = load i8*, i8** %type_name
%.tmp3072 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3070, i8* %.tmp3071, %m1830$.AssignableInfo.type* %.tmp3072)
%.tmp3073 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3074 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3073, i32 0, i32 6
%.tmp3075 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3074
%.tmp3077 = getelementptr [5 x i8], [5 x i8]*@.str3076, i32 0, i32 0
%.tmp3078 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3075, i8* %.tmp3077)
%type_decl = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3078, %m286$.Node.type** %type_decl
%.tmp3079 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3080 = load %m286$.Node.type*, %m286$.Node.type** %type_decl
%.tmp3081 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3080, i32 0, i32 6
%.tmp3082 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3081
%.tmp3083 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3079, %m286$.Node.type* %.tmp3082)
%type_struct = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3083, %m1830$.Type.type** %type_struct
%.tmp3084 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3085 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3084, i32 0, i32 3
%.tmp3086 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3085
%.tmp3087 = load %m1830$.Type.type*, %m1830$.Type.type** %type_struct
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp3086, %m1830$.Type.type* %.tmp3087)
%.tmp3088 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3089 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3088, i32 0, i32 3
%.tmp3090 = load %m1830$.Type.type*, %m1830$.Type.type** %type_struct
store %m1830$.Type.type* %.tmp3090, %m1830$.Type.type** %.tmp3089
br label %.if.end.3037
.if.false.3037:
%.tmp3091 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3092 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3093 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3092, i32 0, i32 6
%.tmp3094 = load i8*, i8** %.tmp3093
%.tmp3095 = load i8*, i8** %type_name
%.tmp3096 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp3091, i8* %.tmp3094, i8* %.tmp3095)
%scope = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp3096, %m1830$.ScopeItem.type** %scope
%.tmp3097 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope
%.tmp3098 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp3097, i32 0, i32 1
%.tmp3099 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp3098
store %m1830$.AssignableInfo.type* %.tmp3099, %m1830$.AssignableInfo.type** %info
%.tmp3100 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3101 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3100, i32 0, i32 1
%.tmp3102 = load %m0$.File.type*, %m0$.File.type** %.tmp3101
%.tmp3104 = getelementptr [14 x i8], [14 x i8]*@.str3103, i32 0, i32 0
%.tmp3105 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3106 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3105)
%.tmp3107 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3108 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3109 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3108, i32 0, i32 3
%.tmp3110 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3109
%.tmp3111 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3107, %m1830$.Type.type* %.tmp3110)
%.tmp3112 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3102, i8* %.tmp3104, i8* %.tmp3106, i8* %.tmp3111)
br label %.if.end.3037
.if.end.3037:
br label %.if.end.3027
.if.false.3027:
%.tmp3113 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3114 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3113, i32 0, i32 0
%.tmp3115 = load i8*, i8** %.tmp3114
%.tmp3117 = getelementptr [7 x i8], [7 x i8]*@.str3116, i32 0, i32 0
%.tmp3118 = call i32(i8*,i8*) @strcmp(i8* %.tmp3115, i8* %.tmp3117)
%.tmp3119 = icmp eq i32 %.tmp3118, 0
br i1 %.tmp3119, label %.if.true.3120, label %.if.false.3120
.if.true.3120:
%.tmp3121 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3122 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3121)
store %m1830$.AssignableInfo.type* %.tmp3122, %m1830$.AssignableInfo.type** %info
%.tmp3123 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3124 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3123, i32 0, i32 3
%.tmp3125 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3126 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3127 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3126, i32 0, i32 6
%.tmp3128 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3127
%.tmp3129 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3128, i32 0, i32 7
%.tmp3130 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3129
%.tmp3131 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$syn_function_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3125, %m286$.Node.type* %.tmp3130)
store %m1830$.Type.type* %.tmp3131, %m1830$.Type.type** %.tmp3124
%.tmp3132 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3133 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3132, i32 0, i32 2
%.tmp3135 = getelementptr [7 x i8], [7 x i8]*@.str3134, i32 0, i32 0
store i8* %.tmp3135, i8** %.tmp3133
%.tmp3136 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3137 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3136, i32 0, i32 6
%.tmp3138 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3137
%.tmp3139 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3138, i32 0, i32 7
%.tmp3140 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3139
%.tmp3141 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3140, i32 0, i32 7
%.tmp3142 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3141
%.tmp3143 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3142, i32 0, i32 1
%.tmp3144 = load i8*, i8** %.tmp3143
%fn_name = alloca i8*
store i8* %.tmp3144, i8** %fn_name
%.tmp3145 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3146 = load i8, i8* @SCOPE_GLOBAL
%.tmp3147 = load i8*, i8** %fn_name
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3145, i8 %.tmp3146, i8* %.tmp3147)
%.tmp3148 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3149 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3148, i32 0, i32 4
%.tmp3150 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3151 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3150, i32 0, i32 3
%.tmp3152 = load i32, i32* %.tmp3151
store i32 %.tmp3152, i32* %.tmp3149
%.tmp3153 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3154 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3153, i32 0, i32 5
%.tmp3155 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3156 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3155, i32 0, i32 4
%.tmp3157 = load i32, i32* %.tmp3156
store i32 %.tmp3157, i32* %.tmp3154
%.tmp3158 = getelementptr %m1830$.Type.type, %m1830$.Type.type* null, i32 1
%.tmp3159 = ptrtoint %m1830$.Type.type* %.tmp3158 to i32
%.tmp3160 = call i8*(i32) @malloc(i32 %.tmp3159)
%.tmp3161 = bitcast i8* %.tmp3160 to %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3161, %m1830$.Type.type** %return_type
%.tmp3162 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3163 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3162, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp3163
%.tmp3164 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3165 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3164, i32 0, i32 1
store i8* null, i8** %.tmp3165
%.tmp3166 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3167 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3166, i32 0, i32 0
%.tmp3168 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3169 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3168, i32 0, i32 3
%.tmp3170 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3169
%.tmp3171 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3170, i32 0, i32 3
%.tmp3172 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3171
%.tmp3173 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3172, i32 0, i32 0
%.tmp3174 = load i8*, i8** %.tmp3173
store i8* %.tmp3174, i8** %.tmp3167
%.tmp3175 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3176 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3175, i32 0, i32 3
%.tmp3177 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3178 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3177, i32 0, i32 3
%.tmp3179 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3178
%.tmp3180 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3179, i32 0, i32 3
%.tmp3181 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3180
%.tmp3182 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3181, i32 0, i32 3
%.tmp3183 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3182
store %m1830$.Type.type* %.tmp3183, %m1830$.Type.type** %.tmp3176
%.tmp3184 = load i1, i1* %shallow
%.tmp3185 = icmp eq i1 %.tmp3184, 0
br i1 %.tmp3185, label %.if.true.3186, label %.if.false.3186
.if.true.3186:
%.tmp3187 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3188 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3187, i32 0, i32 1
%.tmp3189 = load %m0$.File.type*, %m0$.File.type** %.tmp3188
%.tmp3191 = getelementptr [15 x i8], [15 x i8]*@.str3190, i32 0, i32 0
%.tmp3192 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3193 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3194 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3192, %m1830$.Type.type* %.tmp3193)
%.tmp3195 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3196 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3195)
%.tmp3197 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3189, i8* %.tmp3191, i8* %.tmp3194, i8* %.tmp3196)
%.tmp3199 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3200 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3199, i32 0, i32 3
%.tmp3201 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3200
%.tmp3202 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3201, i32 0, i32 3
%.tmp3203 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3202
%.tmp3204 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3203, i32 0, i32 4
%.tmp3205 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3204
%pt = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3205, %m1830$.Type.type** %pt
br label %.for.start.3198
.for.start.3198:
%.tmp3206 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3207 = icmp ne %m1830$.Type.type* %.tmp3206, null
br i1 %.tmp3207, label %.for.continue.3198, label %.for.end.3198
.for.continue.3198:
%.tmp3208 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3209 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3210 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3209, i32 0, i32 3
%.tmp3211 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3210
%.tmp3212 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3211, i32 0, i32 3
%.tmp3213 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3212
%.tmp3214 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3213, i32 0, i32 4
%.tmp3215 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3214
%.tmp3216 = icmp ne %m1830$.Type.type* %.tmp3208, %.tmp3215
br i1 %.tmp3216, label %.if.true.3217, label %.if.false.3217
.if.true.3217:
%.tmp3218 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3219 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3218, i32 0, i32 1
%.tmp3220 = load %m0$.File.type*, %m0$.File.type** %.tmp3219
%.tmp3222 = getelementptr [3 x i8], [3 x i8]*@.str3221, i32 0, i32 0
%.tmp3223 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3220, i8* %.tmp3222)
br label %.if.end.3217
.if.false.3217:
br label %.if.end.3217
.if.end.3217:
%.tmp3224 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3225 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3224, i32 0, i32 1
%.tmp3226 = load %m0$.File.type*, %m0$.File.type** %.tmp3225
%.tmp3228 = getelementptr [3 x i8], [3 x i8]*@.str3227, i32 0, i32 0
%.tmp3229 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3230 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3231 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3229, %m1830$.Type.type* %.tmp3230)
%.tmp3232 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3226, i8* %.tmp3228, i8* %.tmp3231)
%.tmp3233 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp3234 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3233, i32 0, i32 4
%.tmp3235 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3234
store %m1830$.Type.type* %.tmp3235, %m1830$.Type.type** %pt
br label %.for.start.3198
.for.end.3198:
%.tmp3236 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3237 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3236, i32 0, i32 1
%.tmp3238 = load %m0$.File.type*, %m0$.File.type** %.tmp3237
%.tmp3240 = getelementptr [3 x i8], [3 x i8]*@.str3239, i32 0, i32 0
%.tmp3241 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3238, i8* %.tmp3240)
%.tmp3242 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3243 = bitcast %m1830$.Type.type* %.tmp3242 to i8*
call void(i8*) @free(i8* %.tmp3243)
br label %.if.end.3186
.if.false.3186:
%.tmp3244 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3245 = load i8*, i8** %fn_name
%.tmp3246 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3244, i8* %.tmp3245, %m1830$.AssignableInfo.type* %.tmp3246)
br label %.if.end.3186
.if.end.3186:
br label %.if.end.3120
.if.false.3120:
%.tmp3247 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3248 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3247, i32 0, i32 0
%.tmp3249 = load i8*, i8** %.tmp3248
%.tmp3251 = getelementptr [9 x i8], [9 x i8]*@.str3250, i32 0, i32 0
%.tmp3252 = call i32(i8*,i8*) @strcmp(i8* %.tmp3249, i8* %.tmp3251)
%.tmp3253 = icmp eq i32 %.tmp3252, 0
br i1 %.tmp3253, label %.if.true.3254, label %.if.false.3254
.if.true.3254:
%.tmp3255 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3256 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3255)
store %m1830$.AssignableInfo.type* %.tmp3256, %m1830$.AssignableInfo.type** %info
%.tmp3257 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3258 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3257, i32 0, i32 2
%.tmp3260 = getelementptr [9 x i8], [9 x i8]*@.str3259, i32 0, i32 0
store i8* %.tmp3260, i8** %.tmp3258
%.tmp3261 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3262 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3261, i32 0, i32 3
%.tmp3263 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3264 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3265 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3264, i32 0, i32 6
%.tmp3266 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3265
%.tmp3267 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$syn_function_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3263, %m286$.Node.type* %.tmp3266)
store %m1830$.Type.type* %.tmp3267, %m1830$.Type.type** %.tmp3262
%.tmp3268 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3269 = call i8*(%m286$.Node.type*) @m1830$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.tmp3268)
%name = alloca i8*
store i8* %.tmp3269, i8** %name
%.tmp3270 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3271 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3272 = load i8*, i8** %name
%.tmp3273 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3274 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3273, i32 0, i32 3
%.tmp3275 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3274
%.tmp3276 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*,%m1830$.Type.type*) @m1830$name_mangle.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3270, %m286$.Node.type* %.tmp3271, i8* %.tmp3272, %m1830$.Type.type* %.tmp3275)
store i8* %.tmp3276, i8** %tmp_buff
%.tmp3277 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3278 = load i8, i8* @SCOPE_GLOBAL
%.tmp3279 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3277, i8 %.tmp3278, i8* %.tmp3279)
%.tmp3280 = load i1, i1* %shallow
%.tmp3281 = icmp eq i1 %.tmp3280, 1
br i1 %.tmp3281, label %.if.true.3282, label %.if.false.3282
.if.true.3282:
%.tmp3283 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3284 = load i8*, i8** %name
%.tmp3285 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3283, i8* %.tmp3284, %m1830$.AssignableInfo.type* %.tmp3285)
br label %.if.end.3282
.if.false.3282:
%.tmp3286 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp3286, %m1830$.Type.type** %return_type
%.tmp3287 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3288 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3289 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3288, i32 0, i32 3
%.tmp3290 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3289
%.tmp3291 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3290, i32 0, i32 3
%.tmp3292 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3291
call void(%m1830$.Type.type*,%m1830$.Type.type*) @m1830$copy_type.v.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp3287, %m1830$.Type.type* %.tmp3292)
%.tmp3293 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3294 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3293, i32 0, i32 1
%.tmp3295 = load %m0$.File.type*, %m0$.File.type** %.tmp3294
%.tmp3297 = getelementptr [14 x i8], [14 x i8]*@.str3296, i32 0, i32 0
%.tmp3298 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3299 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3300 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3298, %m1830$.Type.type* %.tmp3299)
%.tmp3301 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3302 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3301)
%.tmp3303 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3295, i8* %.tmp3297, i8* %.tmp3300, i8* %.tmp3302)
%.tmp3304 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3305 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3304, i32 0, i32 6
%.tmp3306 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3305
%.tmp3307 = call %m286$.Node.type*(%m286$.Node.type*) @m1830$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3306)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3307, %m286$.Node.type** %params
%param_type = alloca %m1830$.Type.type*
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
%.tmp3319 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3320 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3319, i32 0, i32 1
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
%.tmp3333 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3334 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3334, i32 0, i32 6
%.tmp3336 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3335
%.tmp3337 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3333, %m286$.Node.type* %.tmp3336)
store %m1830$.Type.type* %.tmp3337, %m1830$.Type.type** %param_type
%.tmp3338 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3339 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3338, i32 0, i32 7
%.tmp3340 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3339
store %m286$.Node.type* %.tmp3340, %m286$.Node.type** %param_ptr
br label %.if.end.3332
.if.false.3332:
br label %.if.end.3332
.if.end.3332:
%.tmp3341 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3342 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3341, i32 0, i32 1
%.tmp3343 = load %m0$.File.type*, %m0$.File.type** %.tmp3342
%.tmp3345 = getelementptr [13 x i8], [13 x i8]*@.str3344, i32 0, i32 0
%.tmp3346 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3347 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
%.tmp3348 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3346, %m1830$.Type.type* %.tmp3347)
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
%.tmp3356 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3357 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3356, i32 0, i32 1
%.tmp3358 = load %m0$.File.type*, %m0$.File.type** %.tmp3357
%.tmp3360 = getelementptr [5 x i8], [5 x i8]*@.str3359, i32 0, i32 0
%.tmp3361 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3358, i8* %.tmp3360)
%.tmp3362 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3362)
%.tmp3363 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3364 = load %m286$.Node.type*, %m286$.Node.type** %params
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_fn_params.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3363, %m286$.Node.type* %.tmp3364)
%.tmp3365 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3366 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3365, i32 0, i32 6
%.tmp3367 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3366
%.tmp3369 = getelementptr [6 x i8], [6 x i8]*@.str3368, i32 0, i32 0
%.tmp3370 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3367, i8* %.tmp3369)
%fn_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3370, %m286$.Node.type** %fn_block
%.tmp3371 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3372 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3371, %m286$.Node.type* %.tmp3372)
%.tmp3373 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$pop_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3373)
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
%.tmp3418 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3419 = load %m1830$.Type.type*, %m1830$.Type.type** %return_type
%.tmp3420 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3418, %m1830$.Type.type* %.tmp3419)
%.tmp3422 = getelementptr [5 x i8], [5 x i8]*@.str3421, i32 0, i32 0
%.tmp3423 = call i32(i8*,i8*) @strcmp(i8* %.tmp3420, i8* %.tmp3422)
%.tmp3424 = icmp ne i32 %.tmp3423, 0
br i1 %.tmp3424, label %.if.true.3425, label %.if.false.3425
.if.true.3425:
%.tmp3426 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3427 = load %m286$.Node.type*, %m286$.Node.type** %fn_block
%.tmp3429 = getelementptr [21 x i8], [21 x i8]*@.str3428, i32 0, i32 0
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3426, %m286$.Node.type* %.tmp3427, i8* %.tmp3429)
br label %.if.end.3425
.if.false.3425:
%.tmp3430 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3431 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3430, i32 0, i32 1
%.tmp3432 = load %m0$.File.type*, %m0$.File.type** %.tmp3431
%.tmp3434 = getelementptr [10 x i8], [10 x i8]*@.str3433, i32 0, i32 0
%.tmp3435 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3432, i8* %.tmp3434)
br label %.if.end.3425
.if.end.3425:
br label %.if.end.3417
.if.false.3417:
br label %.if.end.3417
.if.end.3417:
%.tmp3436 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3437 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3436, i32 0, i32 1
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
%.tmp3460 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3461 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3460, i32 0, i32 6
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
%.tmp3519 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3520 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3521 = load i8*, i8** %err_buf
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3519, %m286$.Node.type* %.tmp3520, i8* %.tmp3521)
ret void
br label %.if.end.3511
.if.false.3511:
br label %.if.end.3511
.if.end.3511:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1830$.ModuleLookup.type*
%.tmp3522 = bitcast ptr null to %m1830$.ModuleLookup.type*
%mod = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp3522, %m1830$.ModuleLookup.type** %mod
%.tmp3524 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3525 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3524, i32 0, i32 5
%.tmp3526 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3525
store %m1830$.ModuleLookup.type* %.tmp3526, %m1830$.ModuleLookup.type** %m
br label %.for.start.3523
.for.start.3523:
%.tmp3527 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3528 = icmp ne %m1830$.ModuleLookup.type* %.tmp3527, null
%.tmp3529 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3530 = icmp eq %m1830$.ModuleLookup.type* %.tmp3529, null
%.tmp3531 = and i1 %.tmp3528, %.tmp3530
br i1 %.tmp3531, label %.for.continue.3523, label %.for.end.3523
.for.continue.3523:
%.tmp3532 = load i8*, i8** %mod_abspath
%.tmp3533 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3534 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3533, i32 0, i32 0
%.tmp3535 = load i8*, i8** %.tmp3534
%.tmp3536 = call i32(i8*,i8*) @strcmp(i8* %.tmp3532, i8* %.tmp3535)
%.tmp3537 = icmp eq i32 %.tmp3536, 0
br i1 %.tmp3537, label %.if.true.3538, label %.if.false.3538
.if.true.3538:
%.tmp3539 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
store %m1830$.ModuleLookup.type* %.tmp3539, %m1830$.ModuleLookup.type** %mod
br label %.if.end.3538
.if.false.3538:
br label %.if.end.3538
.if.end.3538:
%.tmp3540 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3541 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3540, i32 0, i32 2
%.tmp3542 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3541
store %m1830$.ModuleLookup.type* %.tmp3542, %m1830$.ModuleLookup.type** %m
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
%.tmp3554 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3555 = icmp eq %m1830$.ModuleLookup.type* %.tmp3554, null
br i1 %.tmp3555, label %.if.true.3556, label %.if.false.3556
.if.true.3556:
%.tmp3557 = load i32, i32* @ModuleLookup_size
%.tmp3558 = call i8*(i32) @malloc(i32 %.tmp3557)
%.tmp3559 = bitcast i8* %.tmp3558 to %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp3559, %m1830$.ModuleLookup.type** %mod
%.tmp3560 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3561 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3560, i32 0, i32 0
%.tmp3562 = load i8*, i8** %mod_abspath
store i8* %.tmp3562, i8** %.tmp3561
%.tmp3563 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3564 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3563, i32 0, i32 2
store %m1830$.ModuleLookup.type* null, %m1830$.ModuleLookup.type** %.tmp3564
%.tmp3565 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3566 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3565, i32 0, i32 3
store %m1830$.Scope.type* null, %m1830$.Scope.type** %.tmp3566
%.tmp3567 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3568 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3567, i32 0, i32 1
%.tmp3569 = getelementptr i8*, i8** %.tmp3568, i32 0
%.tmp3571 = getelementptr [5 x i8], [5 x i8]*@.str3570, i32 0, i32 0
%.tmp3572 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3573 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3572)
%.tmp3574 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3569, i8* %.tmp3571, i32 %.tmp3573)
%.tmp3576 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3577 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3576, i32 0, i32 5
%.tmp3578 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3577
store %m1830$.ModuleLookup.type* %.tmp3578, %m1830$.ModuleLookup.type** %m
br label %.for.start.3575
.for.start.3575:
%.tmp3579 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3580 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3579, i32 0, i32 2
%.tmp3581 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3580
%.tmp3582 = icmp ne %m1830$.ModuleLookup.type* %.tmp3581, null
br i1 %.tmp3582, label %.for.continue.3575, label %.for.end.3575
.for.continue.3575:
%.tmp3583 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3584 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3583, i32 0, i32 2
%.tmp3585 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %.tmp3584
store %m1830$.ModuleLookup.type* %.tmp3585, %m1830$.ModuleLookup.type** %m
br label %.for.start.3575
.for.end.3575:
%.tmp3586 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %m
%.tmp3587 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3586, i32 0, i32 2
%.tmp3588 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
store %m1830$.ModuleLookup.type* %.tmp3588, %m1830$.ModuleLookup.type** %.tmp3587
%.tmp3589 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3590 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3591 = load i8*, i8** %asname
%.tmp3592 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3593 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3592, i32 0, i32 0
%.tmp3594 = load i8*, i8** %.tmp3593
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1830$define_module.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp3589, %m286$.Node.type* %.tmp3590, i8* %.tmp3591, i8* %.tmp3594)
%.tmp3595 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3596 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3595, i32 0, i32 6
%.tmp3597 = load i8*, i8** %.tmp3596
%curr_mod = alloca i8*
store i8* %.tmp3597, i8** %curr_mod
%.tmp3598 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3599 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3598, i32 0, i32 6
%.tmp3600 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3601 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3600, i32 0, i32 0
%.tmp3602 = load i8*, i8** %.tmp3601
store i8* %.tmp3602, i8** %.tmp3599
%.tmp3603 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3604 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3605 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3604, i32 0, i32 0
%.tmp3606 = load i8*, i8** %.tmp3605
%.tmp3607 = call i1(%m1830$.CompilerCtx.type*,i8*) @m1830$compile_file.b.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp3603, i8* %.tmp3606)
%.tmp3608 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3609 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3608, i32 0, i32 6
%.tmp3610 = load i8*, i8** %curr_mod
store i8* %.tmp3610, i8** %.tmp3609
br label %.if.end.3556
.if.false.3556:
%.tmp3611 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3612 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3613 = load i8*, i8** %asname
%.tmp3614 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp3615 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp3614, i32 0, i32 0
%.tmp3616 = load i8*, i8** %.tmp3615
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*,i8*) @m1830$define_module.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp3611, %m286$.Node.type* %.tmp3612, i8* %.tmp3613, i8* %.tmp3616)
br label %.if.end.3556
.if.end.3556:
br label %.if.end.3452
.if.false.3452:
br label %.if.end.3452
.if.end.3452:
br label %.if.end.3449
.if.false.3449:
%.tmp3617 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3618 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3620 = getelementptr [40 x i8], [40 x i8]*@.str3619, i32 0, i32 0
%.tmp3621 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3617, %m286$.Node.type* %.tmp3618, i8* %.tmp3620)
%.tmp3622 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3623 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3622, i32 0, i32 0
%.tmp3624 = load i8*, i8** %.tmp3623
%.tmp3625 = call i32(i8*,...) @printf(i8* %.tmp3621, i8* %.tmp3624)
br label %.if.end.3449
.if.end.3449:
br label %.if.end.3254
.if.end.3254:
br label %.if.end.3120
.if.end.3120:
br label %.if.end.3027
.if.end.3027:
br label %.if.end.2965
.if.end.2965:
br label %.if.end.2957
.if.end.2957:
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
%.tmp3626 = getelementptr i8*, i8** %buf, i32 0
%.tmp3628 = getelementptr [31 x i8], [31 x i8]*@.str3627, i32 0, i32 0
%.tmp3629 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3630 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3629, i32 0, i32 6
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
define void @m1830$compile_fn_params.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%fn_params = alloca %m286$.Node.type*
store %m286$.Node.type* %.fn_params.arg, %m286$.Node.type** %fn_params
%param_type = alloca %m1830$.Type.type*
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
%.tmp3653 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3652)
%param_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3653, %m1830$.AssignableInfo.type** %param_info
%.tmp3654 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3655 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3654, i32 0, i32 2
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
%.tmp3666 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3667 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3668 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3667, i32 0, i32 6
%.tmp3669 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3668
%.tmp3670 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3666, %m286$.Node.type* %.tmp3669)
store %m1830$.Type.type* %.tmp3670, %m1830$.Type.type** %param_type
%.tmp3671 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3672 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3671, i32 0, i32 7
%.tmp3673 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3672
store %m286$.Node.type* %.tmp3673, %m286$.Node.type** %param_ptr
br label %.if.end.3665
.if.false.3665:
br label %.if.end.3665
.if.end.3665:
%.tmp3674 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3675 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3674, i32 0, i32 3
%.tmp3676 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
store %m1830$.Type.type* %.tmp3676, %m1830$.Type.type** %.tmp3675
%.tmp3677 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3678 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3677, i32 0, i32 1
%.tmp3679 = load i8*, i8** %.tmp3678
%var_name = alloca i8*
store i8* %.tmp3679, i8** %var_name
%.tmp3680 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3681 = load i8, i8* @SCOPE_LOCAL
%.tmp3682 = load i8*, i8** %var_name
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp3680, i8 %.tmp3681, i8* %.tmp3682)
%.tmp3683 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3684 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3685 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3684, i32 0, i32 3
%.tmp3686 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3685
%.tmp3687 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3683, %m1830$.Type.type* %.tmp3686)
%param_info_tr = alloca i8*
store i8* %.tmp3687, i8** %param_info_tr
%.tmp3688 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3689 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3688, i32 0, i32 1
%.tmp3690 = load %m0$.File.type*, %m0$.File.type** %.tmp3689
%.tmp3692 = getelementptr [16 x i8], [16 x i8]*@.str3691, i32 0, i32 0
%.tmp3693 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3694 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3693)
%.tmp3695 = load i8*, i8** %param_info_tr
%.tmp3696 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3690, i8* %.tmp3692, i8* %.tmp3694, i8* %.tmp3695)
%.tmp3697 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3698 = load i8*, i8** %var_name
%.tmp3699 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3697, i8* %.tmp3698, %m1830$.AssignableInfo.type* %.tmp3699)
%.tmp3700 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3701 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3700, i32 0, i32 1
%.tmp3702 = load %m0$.File.type*, %m0$.File.type** %.tmp3701
%.tmp3704 = getelementptr [28 x i8], [28 x i8]*@.str3703, i32 0, i32 0
%.tmp3705 = load i8*, i8** %param_info_tr
%.tmp3706 = load i8*, i8** %var_name
%.tmp3707 = load i8*, i8** %param_info_tr
%.tmp3708 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %param_info
%.tmp3709 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3708)
%.tmp3710 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3702, i8* %.tmp3704, i8* %.tmp3705, i8* %.tmp3706, i8* %.tmp3707, i8* %.tmp3709)
%.tmp3711 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp3712 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3711, i32 0, i32 7
%.tmp3713 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3712
store %m286$.Node.type* %.tmp3713, %m286$.Node.type** %param_ptr
br label %.for.start.3641
.for.end.3641:
ret void
}
define void @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3714 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$push_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3714)
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
%.tmp3729 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3730 = load %m286$.Node.type*, %m286$.Node.type** %b
%.tmp3731 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3730, i32 0, i32 6
%.tmp3732 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3731
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3729, %m286$.Node.type* %.tmp3732)
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
%.tmp3736 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
call void(%m1830$.CompilerCtx.type*) @m1830$pop_scope.v.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3736)
ret void
}
define %m1830$.AssignableInfo.type* @m1830$compile_builtin.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
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
%.tmp3747 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3747
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
%.tmp3759 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3756, i8* %.tmp3758)
%args = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp3759, %m286$.Node.type** %args
%.tmp3760 = load %m286$.Node.type*, %m286$.Node.type** %args
%.tmp3761 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3760, i32 0, i32 6
%.tmp3762 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3761
%.tmp3764 = getelementptr [11 x i8], [11 x i8]*@.str3763, i32 0, i32 0
%.tmp3765 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3762, i8* %.tmp3764)
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
%.tmp3775 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3776 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp3775)
%tmp_id = alloca i32
store i32 %.tmp3776, i32* %tmp_id
%.tmp3777 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3778 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3777)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3778, %m1830$.AssignableInfo.type** %info
%.tmp3779 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3780 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3779, %m1830$.AssignableInfo.type* %.tmp3780)
%.tmp3781 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3782 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3781, i32 0, i32 3
%.tmp3783 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp3783, %m1830$.Type.type** %.tmp3782
%.tmp3784 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3785 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3784, i32 0, i32 3
%.tmp3786 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3785
%.tmp3787 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3786, i32 0, i32 0
%.tmp3789 = getelementptr [4 x i8], [4 x i8]*@.str3788, i32 0, i32 0
store i8* %.tmp3789, i8** %.tmp3787
%.tmp3790 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3791 = load %m286$.Node.type*, %m286$.Node.type** %value
%.tmp3792 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3790, %m286$.Node.type* %.tmp3791)
%inspected_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp3792, %m1830$.Type.type** %inspected_type
%.tmp3793 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3794 = load %m1830$.Type.type*, %m1830$.Type.type** %inspected_type
%.tmp3795 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3793, %m1830$.Type.type* %.tmp3794)
%type_as_str = alloca i8*
store i8* %.tmp3795, i8** %type_as_str
%.tmp3796 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3797 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3796, i32 0, i32 1
%.tmp3798 = load %m0$.File.type*, %m0$.File.type** %.tmp3797
%.tmp3800 = getelementptr [46 x i8], [46 x i8]*@.str3799, i32 0, i32 0
%.tmp3801 = load i32, i32* %tmp_id
%.tmp3802 = load i8*, i8** %type_as_str
%.tmp3803 = load i8*, i8** %type_as_str
%.tmp3804 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3798, i8* %.tmp3800, i32 %.tmp3801, i8* %.tmp3802, i8* %.tmp3803)
%.tmp3805 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3806 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3805, i32 0, i32 1
%.tmp3807 = load %m0$.File.type*, %m0$.File.type** %.tmp3806
%.tmp3809 = getelementptr [35 x i8], [35 x i8]*@.str3808, i32 0, i32 0
%.tmp3810 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3811 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3810)
%.tmp3812 = load i8*, i8** %type_as_str
%.tmp3813 = load i32, i32* %tmp_id
%.tmp3814 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3807, i8* %.tmp3809, i8* %.tmp3811, i8* %.tmp3812, i32 %.tmp3813)
%.tmp3815 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp3815
br label %.if.end.3755
.if.false.3755:
br label %.if.end.3755
.if.end.3755:
%.tmp3816 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3816
}
define %m1830$.AssignableInfo.type* @m1830$compile_fn_call.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp3817 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3818 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3819 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_builtin.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3817, %m286$.Node.type* %.tmp3818)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3819, %m1830$.AssignableInfo.type** %info
%.tmp3820 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3821 = icmp ne %m1830$.AssignableInfo.type* %.tmp3820, null
br i1 %.tmp3821, label %.if.true.3822, label %.if.false.3822
.if.true.3822:
%.tmp3823 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp3823
br label %.if.end.3822
.if.false.3822:
br label %.if.end.3822
.if.end.3822:
%.tmp3824 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3825 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3826 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3824, %m286$.Node.type* %.tmp3825)
store %m1830$.AssignableInfo.type* %.tmp3826, %m1830$.AssignableInfo.type** %info
%.tmp3827 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3828 = icmp eq %m1830$.AssignableInfo.type* %.tmp3827, null
br i1 %.tmp3828, label %.if.true.3829, label %.if.false.3829
.if.true.3829:
%.tmp3830 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3830, label %.if.true.3831, label %.if.false.3831
.if.true.3831:
%.tmp3832 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3833 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3835 = getelementptr [35 x i8], [35 x i8]*@.str3834, i32 0, i32 0
%.tmp3836 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp3832, %m286$.Node.type* %.tmp3833, i8* %.tmp3835)
%.tmp3837 = call i32(i8*,...) @printf(i8* %.tmp3836)
br label %.if.end.3831
.if.false.3831:
br label %.if.end.3831
.if.end.3831:
%.tmp3838 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3838
br label %.if.end.3829
.if.false.3829:
br label %.if.end.3829
.if.end.3829:
%.tmp3839 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3841 = getelementptr [8 x i8], [8 x i8]*@.str3840, i32 0, i32 0
%.tmp3842 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3839, i8* %.tmp3841)
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
%.tmp3853 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3850, i8* %.tmp3852)
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
%.tmp3871 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3872 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3873 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3871, %m286$.Node.type* %.tmp3872)
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3873, %m1830$.AssignableInfo.type** %a_info
%.tmp3874 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3875 = icmp eq %m1830$.AssignableInfo.type* %.tmp3874, null
br i1 %.tmp3875, label %.if.true.3876, label %.if.false.3876
.if.true.3876:
%.tmp3877 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3877
br label %.if.end.3876
.if.false.3876:
br label %.if.end.3876
.if.end.3876:
%.tmp3878 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3880 = getelementptr [8 x i8], [8 x i8]*@.str3879, i32 0, i32 0
%.tmp3881 = load i8*, i8** %params_buff
%.tmp3882 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3883 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3884 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3883, i32 0, i32 3
%.tmp3885 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3884
%.tmp3886 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3882, %m1830$.Type.type* %.tmp3885)
%.tmp3887 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp3888 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3887)
%.tmp3889 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3878, i8* %.tmp3880, i8* %.tmp3881, i8* %.tmp3886, i8* %.tmp3888)
%.tmp3890 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3891 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3890, i32 0, i32 7
%.tmp3892 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3891
store %m286$.Node.type* %.tmp3892, %m286$.Node.type** %pp
%.tmp3893 = load %m286$.Node.type*, %m286$.Node.type** %pp
%.tmp3895 = getelementptr [11 x i8], [11 x i8]*@.str3894, i32 0, i32 0
%.tmp3896 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp3893, i8* %.tmp3895)
store %m286$.Node.type* %.tmp3896, %m286$.Node.type** %pp
br label %.for.start.3854
.for.end.3854:
br label %.if.end.3847
.if.false.3847:
br label %.if.end.3847
.if.end.3847:
%.tmp3897 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3898 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3899 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3898, i32 0, i32 3
%.tmp3900 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3899
%.tmp3901 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3900, i32 0, i32 3
%.tmp3902 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3901
%.tmp3903 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3897, %m1830$.Type.type* %.tmp3902)
%.tmp3905 = getelementptr [5 x i8], [5 x i8]*@.str3904, i32 0, i32 0
%.tmp3906 = call i32(i8*,i8*) @strcmp(i8* %.tmp3903, i8* %.tmp3905)
%.tmp3907 = icmp eq i32 %.tmp3906, 0
br i1 %.tmp3907, label %.if.true.3908, label %.if.false.3908
.if.true.3908:
%.tmp3909 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3910 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3909, i32 0, i32 1
%.tmp3911 = load %m0$.File.type*, %m0$.File.type** %.tmp3910
%.tmp3913 = getelementptr [16 x i8], [16 x i8]*@.str3912, i32 0, i32 0
%.tmp3914 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3915 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3916 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3915, i32 0, i32 3
%.tmp3917 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3916
%.tmp3918 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3914, %m1830$.Type.type* %.tmp3917)
%.tmp3919 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3920 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3919)
%.tmp3921 = load i8*, i8** %params_buff
%.tmp3922 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3911, i8* %.tmp3913, i8* %.tmp3918, i8* %.tmp3920, i8* %.tmp3921)
%.tmp3923 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3923
br label %.if.end.3908
.if.false.3908:
br label %.if.end.3908
.if.end.3908:
%.tmp3924 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3925 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp3924)
%call_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3925, %m1830$.AssignableInfo.type** %call_info
%.tmp3926 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3927 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp3926, %m1830$.AssignableInfo.type* %.tmp3927)
%.tmp3928 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3929 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3928, i32 0, i32 3
%.tmp3930 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3931 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3930, i32 0, i32 3
%.tmp3932 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3931
%.tmp3933 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3932, i32 0, i32 3
%.tmp3934 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3933
%.tmp3935 = call %m1830$.Type.type*(%m1830$.Type.type*) @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp3934)
store %m1830$.Type.type* %.tmp3935, %m1830$.Type.type** %.tmp3929
%.tmp3936 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3937 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3936, i32 0, i32 3
%.tmp3938 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3937
%.tmp3939 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp3938, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp3939
%.tmp3940 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3941 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3940, i32 0, i32 1
%.tmp3942 = load %m0$.File.type*, %m0$.File.type** %.tmp3941
%.tmp3944 = getelementptr [21 x i8], [21 x i8]*@.str3943, i32 0, i32 0
%.tmp3945 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3946 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3945)
%.tmp3947 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3948 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3949 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3948, i32 0, i32 3
%.tmp3950 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3949
%.tmp3951 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3947, %m1830$.Type.type* %.tmp3950)
%.tmp3952 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3953 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp3952)
%.tmp3954 = load i8*, i8** %params_buff
%.tmp3955 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3942, i8* %.tmp3944, i8* %.tmp3946, i8* %.tmp3951, i8* %.tmp3953, i8* %.tmp3954)
%.tmp3956 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %call_info
%.tmp3957 = bitcast %m1830$.AssignableInfo.type* %.tmp3956 to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp3957
}
define void @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp3958 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3959 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3958, i32 0, i32 0
%.tmp3960 = load i8*, i8** %.tmp3959
%expr_type = alloca i8*
store i8* %.tmp3960, i8** %expr_type
%.tmp3961 = bitcast ptr null to %m1830$.AssignableInfo.type*
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3961, %m1830$.AssignableInfo.type** %info
%assignable = alloca %m286$.Node.type*
%.tmp3962 = bitcast ptr null to %m1830$.AssignableInfo.type*
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp3962, %m1830$.AssignableInfo.type** %a_info
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
%.tmp3981 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3982 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp3983 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3982, i32 0, i32 6
%.tmp3984 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3983
%.tmp3985 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp3984, i32 0, i32 7
%.tmp3986 = load %m286$.Node.type*, %m286$.Node.type** %.tmp3985
%.tmp3987 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp3981, %m286$.Node.type* %.tmp3986)
store %m1830$.AssignableInfo.type* %.tmp3987, %m1830$.AssignableInfo.type** %info
%.tmp3988 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3989 = icmp eq %m1830$.AssignableInfo.type* %.tmp3988, null
br i1 %.tmp3989, label %.if.true.3990, label %.if.false.3990
.if.true.3990:
ret void
br label %.if.end.3990
.if.false.3990:
br label %.if.end.3990
.if.end.3990:
%.tmp3991 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3992 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp3991, i32 0, i32 1
%.tmp3993 = load %m0$.File.type*, %m0$.File.type** %.tmp3992
%.tmp3995 = getelementptr [11 x i8], [11 x i8]*@.str3994, i32 0, i32 0
%.tmp3996 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp3997 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp3998 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp3997, i32 0, i32 3
%.tmp3999 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp3998
%.tmp4000 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp3996, %m1830$.Type.type* %.tmp3999)
%.tmp4001 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4002 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4001)
%.tmp4003 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3993, i8* %.tmp3995, i8* %.tmp4000, i8* %.tmp4002)
br label %.if.end.3980
.if.false.3980:
%.tmp4004 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4005 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4004, i32 0, i32 1
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
%.tmp4022 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4023 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4024 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4023, i32 0, i32 6
%.tmp4025 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4024
%.tmp4026 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_fn_call.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4022, %m286$.Node.type* %.tmp4025)
br label %.if.end.4021
.if.false.4021:
%.tmp4027 = load i8*, i8** %expr_type
%.tmp4029 = getelementptr [12 x i8], [12 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = call i32(i8*,i8*) @strcmp(i8* %.tmp4027, i8* %.tmp4029)
%.tmp4031 = icmp eq i32 %.tmp4030, 0
br i1 %.tmp4031, label %.if.true.4032, label %.if.false.4032
.if.true.4032:
%.tmp4033 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4034 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4035 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_declaration.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4033, %m286$.Node.type* %.tmp4034)
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
%.tmp4047 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4044, i8* %.tmp4046)
store %m286$.Node.type* %.tmp4047, %m286$.Node.type** %assignable
%.tmp4048 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4049 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4050 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4049, i32 0, i32 6
%.tmp4051 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4050
%.tmp4052 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4048, %m286$.Node.type* %.tmp4051)
%dest = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4052, %m1830$.AssignableInfo.type** %dest
%.tmp4053 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %dest
%.tmp4054 = icmp eq %m1830$.AssignableInfo.type* %.tmp4053, null
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
%.tmp4069 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4070 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4071 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4069, %m286$.Node.type* %.tmp4070, i8* %.tmp4071)
ret void
br label %.if.end.4055
.if.false.4055:
br label %.if.end.4055
.if.end.4055:
%.tmp4072 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4073 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4074 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4072, %m286$.Node.type* %.tmp4073)
store %m1830$.AssignableInfo.type* %.tmp4074, %m1830$.AssignableInfo.type** %a_info
%.tmp4075 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4076 = icmp eq %m1830$.AssignableInfo.type* %.tmp4075, null
br i1 %.tmp4076, label %.if.true.4077, label %.if.false.4077
.if.true.4077:
ret void
br label %.if.end.4077
.if.false.4077:
br label %.if.end.4077
.if.end.4077:
%.tmp4078 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4079 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %dest
%.tmp4080 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4079, i32 0, i32 3
%.tmp4081 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4080
%.tmp4082 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4078, %m1830$.Type.type* %.tmp4081)
%dest_tr = alloca i8*
store i8* %.tmp4082, i8** %dest_tr
%.tmp4083 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4084 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4085 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4084, i32 0, i32 3
%.tmp4086 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4085
%.tmp4087 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4083, %m1830$.Type.type* %.tmp4086)
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
%.tmp4095 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4096 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4095, i32 0, i32 1
%.tmp4097 = load %m0$.File.type*, %m0$.File.type** %.tmp4096
%.tmp4099 = getelementptr [21 x i8], [21 x i8]*@.str4098, i32 0, i32 0
%.tmp4100 = load i8*, i8** %src_tr
%.tmp4101 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4102 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4101)
%.tmp4103 = load i8*, i8** %dest_tr
%.tmp4104 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %dest
%.tmp4105 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4104)
%.tmp4106 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4097, i8* %.tmp4099, i8* %.tmp4100, i8* %.tmp4102, i8* %.tmp4103, i8* %.tmp4105)
br label %.if.end.4041
.if.false.4041:
%.tmp4107 = load i8*, i8** %expr_type
%.tmp4109 = getelementptr [9 x i8], [9 x i8]*@.str4108, i32 0, i32 0
%.tmp4110 = call i32(i8*,i8*) @strcmp(i8* %.tmp4107, i8* %.tmp4109)
%.tmp4111 = icmp eq i32 %.tmp4110, 0
br i1 %.tmp4111, label %.if.true.4112, label %.if.false.4112
.if.true.4112:
%.tmp4113 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4114 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_if_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4113, %m286$.Node.type* %.tmp4114)
br label %.if.end.4112
.if.false.4112:
%.tmp4115 = load i8*, i8** %expr_type
%.tmp4117 = getelementptr [9 x i8], [9 x i8]*@.str4116, i32 0, i32 0
%.tmp4118 = call i32(i8*,i8*) @strcmp(i8* %.tmp4115, i8* %.tmp4117)
%.tmp4119 = icmp eq i32 %.tmp4118, 0
br i1 %.tmp4119, label %.if.true.4120, label %.if.false.4120
.if.true.4120:
%.tmp4121 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4122 = load %m286$.Node.type*, %m286$.Node.type** %stmt
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_for_loop.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4121, %m286$.Node.type* %.tmp4122)
br label %.if.end.4120
.if.false.4120:
%.tmp4123 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4124 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4126 = getelementptr [34 x i8], [34 x i8]*@.str4125, i32 0, i32 0
%.tmp4127 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4123, %m286$.Node.type* %.tmp4124, i8* %.tmp4126)
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
define void @m1830$compile_for_loop.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4130 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4131 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4130)
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
%.tmp4145 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4146 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4147 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_declaration.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4145, %m286$.Node.type* %.tmp4146)
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
%.tmp4156 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4157 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4156, %m286$.Node.type* %.tmp4157)
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
%.tmp4166 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4167 = load %m286$.Node.type*, %m286$.Node.type** %init_stmt
%.tmp4169 = getelementptr [66 x i8], [66 x i8]*@.str4168, i32 0, i32 0
%.tmp4170 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4166, %m286$.Node.type* %.tmp4167, i8* %.tmp4169)
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
%.tmp4175 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4176 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4175, i32 0, i32 1
%.tmp4177 = load %m0$.File.type*, %m0$.File.type** %.tmp4176
%.tmp4179 = getelementptr [26 x i8], [26 x i8]*@.str4178, i32 0, i32 0
%.tmp4180 = load i32, i32* %for_id
%.tmp4181 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4177, i8* %.tmp4179, i32 %.tmp4180)
%.tmp4182 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4183 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4182, i32 0, i32 1
%.tmp4184 = load %m0$.File.type*, %m0$.File.type** %.tmp4183
%.tmp4186 = getelementptr [16 x i8], [16 x i8]*@.str4185, i32 0, i32 0
%.tmp4187 = load i32, i32* %for_id
%.tmp4188 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4184, i8* %.tmp4186, i32 %.tmp4187)
%.tmp4189 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4190 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4189, i32 0, i32 6
%.tmp4191 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4190
%.tmp4193 = getelementptr [9 x i8], [9 x i8]*@.str4192, i32 0, i32 0
%.tmp4194 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4191, i8* %.tmp4193)
%fst_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4194, %m286$.Node.type** %fst_colon
%.tmp4195 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4196 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4195, i32 0, i32 7
%.tmp4197 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4196
%condition = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4197, %m286$.Node.type** %condition
%.tmp4198 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4199 = load %m286$.Node.type*, %m286$.Node.type** %condition
%.tmp4200 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4198, %m286$.Node.type* %.tmp4199)
%condition_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4200, %m1830$.AssignableInfo.type** %condition_info
%.tmp4201 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4202 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4201, i32 0, i32 1
%.tmp4203 = load %m0$.File.type*, %m0$.File.type** %.tmp4202
%.tmp4205 = getelementptr [57 x i8], [57 x i8]*@.str4204, i32 0, i32 0
%.tmp4206 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4207 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %condition_info
%.tmp4208 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4207, i32 0, i32 3
%.tmp4209 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4208
%.tmp4210 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4206, %m1830$.Type.type* %.tmp4209)
%.tmp4211 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %condition_info
%.tmp4212 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4211)
%.tmp4213 = load i32, i32* %for_id
%.tmp4214 = load i32, i32* %for_id
%.tmp4215 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4203, i8* %.tmp4205, i8* %.tmp4210, i8* %.tmp4212, i32 %.tmp4213, i32 %.tmp4214)
%.tmp4216 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4217 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4216, i32 0, i32 1
%.tmp4218 = load %m0$.File.type*, %m0$.File.type** %.tmp4217
%.tmp4220 = getelementptr [19 x i8], [19 x i8]*@.str4219, i32 0, i32 0
%.tmp4221 = load i32, i32* %for_id
%.tmp4222 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4218, i8* %.tmp4220, i32 %.tmp4221)
%.tmp4223 = load %m286$.Node.type*, %m286$.Node.type** %fst_colon
%.tmp4224 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4223, i32 0, i32 7
%.tmp4225 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4224
%.tmp4227 = getelementptr [9 x i8], [9 x i8]*@.str4226, i32 0, i32 0
%.tmp4228 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4225, i8* %.tmp4227)
%snd_colon = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4228, %m286$.Node.type** %snd_colon
%.tmp4229 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4230 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4229, i32 0, i32 7
%.tmp4231 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4230
%increment = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4231, %m286$.Node.type** %increment
%.tmp4232 = load %m286$.Node.type*, %m286$.Node.type** %snd_colon
%.tmp4234 = getelementptr [6 x i8], [6 x i8]*@.str4233, i32 0, i32 0
%.tmp4235 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4232, i8* %.tmp4234)
%for_body = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4235, %m286$.Node.type** %for_body
%.tmp4236 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4237 = load %m286$.Node.type*, %m286$.Node.type** %for_body
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4236, %m286$.Node.type* %.tmp4237)
%.tmp4238 = load %m286$.Node.type*, %m286$.Node.type** %increment
%.tmp4239 = load %m286$.Node.type*, %m286$.Node.type** %for_body
%.tmp4240 = icmp ne %m286$.Node.type* %.tmp4238, %.tmp4239
br i1 %.tmp4240, label %.if.true.4241, label %.if.false.4241
.if.true.4241:
%.tmp4242 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4243 = load %m286$.Node.type*, %m286$.Node.type** %increment
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_expression.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4242, %m286$.Node.type* %.tmp4243)
br label %.if.end.4241
.if.false.4241:
br label %.if.end.4241
.if.end.4241:
%.tmp4244 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4245 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4244, i32 0, i32 1
%.tmp4246 = load %m0$.File.type*, %m0$.File.type** %.tmp4245
%.tmp4248 = getelementptr [26 x i8], [26 x i8]*@.str4247, i32 0, i32 0
%.tmp4249 = load i32, i32* %for_id
%.tmp4250 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4246, i8* %.tmp4248, i32 %.tmp4249)
%.tmp4251 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4252 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4251, i32 0, i32 1
%.tmp4253 = load %m0$.File.type*, %m0$.File.type** %.tmp4252
%.tmp4255 = getelementptr [14 x i8], [14 x i8]*@.str4254, i32 0, i32 0
%.tmp4256 = load i32, i32* %for_id
%.tmp4257 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4253, i8* %.tmp4255, i32 %.tmp4256)
ret void
}
define %m1830$.AssignableInfo.type* @m1830$compile_declaration.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4258 = bitcast ptr null to %m1830$.Type.type*
%decl_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4258, %m1830$.Type.type** %decl_type
%.tmp4259 = bitcast ptr null to %m1830$.AssignableInfo.type*
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4259, %m1830$.AssignableInfo.type** %a_info
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
%.tmp4270 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4271 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4272 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4271, i32 0, i32 6
%.tmp4273 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4272
%.tmp4274 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4273, i32 0, i32 6
%.tmp4275 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4274
%.tmp4276 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4270, %m286$.Node.type* %.tmp4275)
store %m1830$.Type.type* %.tmp4276, %m1830$.Type.type** %decl_type
br label %.if.end.4269
.if.false.4269:
br label %.if.end.4269
.if.end.4269:
%.tmp4277 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4278 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4277, i32 0, i32 6
%.tmp4279 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4278
%.tmp4281 = getelementptr [11 x i8], [11 x i8]*@.str4280, i32 0, i32 0
%.tmp4282 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4279, i8* %.tmp4281)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4282, %m286$.Node.type** %assignable
%.tmp4283 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4284 = icmp ne %m286$.Node.type* %.tmp4283, null
br i1 %.tmp4284, label %.if.true.4285, label %.if.false.4285
.if.true.4285:
%.tmp4286 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4287 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4288 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4286, %m286$.Node.type* %.tmp4287)
store %m1830$.AssignableInfo.type* %.tmp4288, %m1830$.AssignableInfo.type** %a_info
br label %.if.end.4285
.if.false.4285:
br label %.if.end.4285
.if.end.4285:
%.tmp4289 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4290 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4289)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4290, %m1830$.AssignableInfo.type** %info
%.tmp4291 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4292 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4291, i32 0, i32 2
%.tmp4294 = getelementptr [9 x i8], [9 x i8]*@.str4293, i32 0, i32 0
store i8* %.tmp4294, i8** %.tmp4292
%.tmp4295 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4296 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4295, i32 0, i32 6
%.tmp4297 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4296
%.tmp4299 = getelementptr [5 x i8], [5 x i8]*@.str4298, i32 0, i32 0
%.tmp4300 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4297, i8* %.tmp4299)
%var_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4300, %m286$.Node.type** %var_name
%.tmp4301 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4302 = icmp eq %m286$.Node.type* %.tmp4301, null
br i1 %.tmp4302, label %.if.true.4303, label %.if.false.4303
.if.true.4303:
%.tmp4304 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4305 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4307 = getelementptr [31 x i8], [31 x i8]*@.str4306, i32 0, i32 0
%.tmp4308 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4304, %m286$.Node.type* %.tmp4305, i8* %.tmp4307)
%.tmp4309 = call i32(i8*,...) @printf(i8* %.tmp4308)
%.tmp4310 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4310
br label %.if.end.4303
.if.false.4303:
br label %.if.end.4303
.if.end.4303:
%.tmp4311 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4312 = load i8, i8* @SCOPE_LOCAL
%.tmp4313 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4314 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4313, i32 0, i32 1
%.tmp4315 = load i8*, i8** %.tmp4314
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp4311, i8 %.tmp4312, i8* %.tmp4315)
%.tmp4316 = load %m1830$.Type.type*, %m1830$.Type.type** %decl_type
%.tmp4317 = icmp ne %m1830$.Type.type* %.tmp4316, null
br i1 %.tmp4317, label %.if.true.4318, label %.if.false.4318
.if.true.4318:
%.tmp4319 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4320 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4319, i32 0, i32 3
%.tmp4321 = load %m1830$.Type.type*, %m1830$.Type.type** %decl_type
store %m1830$.Type.type* %.tmp4321, %m1830$.Type.type** %.tmp4320
br label %.if.end.4318
.if.false.4318:
%.tmp4322 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4323 = icmp ne %m1830$.AssignableInfo.type* %.tmp4322, null
br i1 %.tmp4323, label %.if.true.4324, label %.if.false.4324
.if.true.4324:
%.tmp4325 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4326 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4325, i32 0, i32 3
%.tmp4327 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4328 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4327, i32 0, i32 3
%.tmp4329 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4328
store %m1830$.Type.type* %.tmp4329, %m1830$.Type.type** %.tmp4326
br label %.if.end.4324
.if.false.4324:
br label %.if.end.4324
.if.end.4324:
br label %.if.end.4318
.if.end.4318:
%.tmp4330 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4331 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4332 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4331, i32 0, i32 3
%.tmp4333 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4332
%.tmp4334 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4330, %m1830$.Type.type* %.tmp4333)
%var_type_repr = alloca i8*
store i8* %.tmp4334, i8** %var_type_repr
%.tmp4335 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4336 = icmp ne %m1830$.AssignableInfo.type* %.tmp4335, null
br i1 %.tmp4336, label %.if.true.4337, label %.if.false.4337
.if.true.4337:
%.tmp4338 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4339 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4340 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4339, i32 0, i32 3
%.tmp4341 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4340
%.tmp4342 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4338, %m1830$.Type.type* %.tmp4341)
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
%.tmp4363 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4364 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4365 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4363, %m286$.Node.type* %.tmp4364, i8* %.tmp4365)
br label %.if.end.4355
.if.false.4355:
br label %.if.end.4355
.if.end.4355:
br label %.if.end.4337
.if.false.4337:
br label %.if.end.4337
.if.end.4337:
%.tmp4366 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4367 = load %m286$.Node.type*, %m286$.Node.type** %var_name
%.tmp4368 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4367, i32 0, i32 1
%.tmp4369 = load i8*, i8** %.tmp4368
%.tmp4370 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4366, i8* %.tmp4369, %m1830$.AssignableInfo.type* %.tmp4370)
%.tmp4371 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4372 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4371, i32 0, i32 1
%.tmp4373 = load %m0$.File.type*, %m0$.File.type** %.tmp4372
%.tmp4375 = getelementptr [16 x i8], [16 x i8]*@.str4374, i32 0, i32 0
%.tmp4376 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4377 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4376)
%.tmp4378 = load i8*, i8** %var_type_repr
%.tmp4379 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4373, i8* %.tmp4375, i8* %.tmp4377, i8* %.tmp4378)
%.tmp4380 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4381 = icmp ne %m1830$.AssignableInfo.type* %.tmp4380, null
br i1 %.tmp4381, label %.if.true.4382, label %.if.false.4382
.if.true.4382:
%.tmp4383 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4384 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4383, i32 0, i32 1
%.tmp4385 = load %m0$.File.type*, %m0$.File.type** %.tmp4384
%.tmp4387 = getelementptr [21 x i8], [21 x i8]*@.str4386, i32 0, i32 0
%.tmp4388 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4389 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4390 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4389, i32 0, i32 3
%.tmp4391 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4390
%.tmp4392 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4388, %m1830$.Type.type* %.tmp4391)
%.tmp4393 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4394 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4393)
%.tmp4395 = load i8*, i8** %var_type_repr
%.tmp4396 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4397 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4396)
%.tmp4398 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4385, i8* %.tmp4387, i8* %.tmp4392, i8* %.tmp4394, i8* %.tmp4395, i8* %.tmp4397)
br label %.if.end.4382
.if.false.4382:
br label %.if.end.4382
.if.end.4382:
%.tmp4399 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp4399
}
define void @m1830$compile_if_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp4400 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4401 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4400, i32 0, i32 6
%.tmp4402 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4401
%.tmp4404 = getelementptr [11 x i8], [11 x i8]*@.str4403, i32 0, i32 0
%.tmp4405 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4402, i8* %.tmp4404)
%assignable = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4405, %m286$.Node.type** %assignable
%.tmp4406 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4407 = load %m286$.Node.type*, %m286$.Node.type** %assignable
%.tmp4408 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4406, %m286$.Node.type* %.tmp4407)
%a_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4408, %m1830$.AssignableInfo.type** %a_info
%.tmp4409 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4410 = icmp eq %m1830$.AssignableInfo.type* %.tmp4409, null
br i1 %.tmp4410, label %.if.true.4411, label %.if.false.4411
.if.true.4411:
ret void
br label %.if.end.4411
.if.false.4411:
br label %.if.end.4411
.if.end.4411:
%.tmp4412 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4413 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4412)
%if_id = alloca i32
store i32 %.tmp4413, i32* %if_id
%.tmp4414 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4415 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4414, i32 0, i32 1
%.tmp4416 = load %m0$.File.type*, %m0$.File.type** %.tmp4415
%.tmp4418 = getelementptr [53 x i8], [53 x i8]*@.str4417, i32 0, i32 0
%.tmp4419 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4420 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4421 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4420, i32 0, i32 3
%.tmp4422 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4421
%.tmp4423 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4419, %m1830$.Type.type* %.tmp4422)
%.tmp4424 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %a_info
%.tmp4425 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4424)
%.tmp4426 = load i32, i32* %if_id
%.tmp4427 = load i32, i32* %if_id
%.tmp4428 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4416, i8* %.tmp4418, i8* %.tmp4423, i8* %.tmp4425, i32 %.tmp4426, i32 %.tmp4427)
%.tmp4429 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4430 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4429, i32 0, i32 1
%.tmp4431 = load %m0$.File.type*, %m0$.File.type** %.tmp4430
%.tmp4433 = getelementptr [14 x i8], [14 x i8]*@.str4432, i32 0, i32 0
%.tmp4434 = load i32, i32* %if_id
%.tmp4435 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4431, i8* %.tmp4433, i32 %.tmp4434)
%.tmp4436 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4437 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4436, i32 0, i32 6
%.tmp4438 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4437
%.tmp4440 = getelementptr [6 x i8], [6 x i8]*@.str4439, i32 0, i32 0
%.tmp4441 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4438, i8* %.tmp4440)
%block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4441, %m286$.Node.type** %block
%.tmp4442 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4443 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4442, %m286$.Node.type* %.tmp4443)
%.tmp4444 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4445 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4444, i32 0, i32 1
%.tmp4446 = load %m0$.File.type*, %m0$.File.type** %.tmp4445
%.tmp4448 = getelementptr [23 x i8], [23 x i8]*@.str4447, i32 0, i32 0
%.tmp4449 = load i32, i32* %if_id
%.tmp4450 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4446, i8* %.tmp4448, i32 %.tmp4449)
%.tmp4451 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4452 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4451, i32 0, i32 1
%.tmp4453 = load %m0$.File.type*, %m0$.File.type** %.tmp4452
%.tmp4455 = getelementptr [15 x i8], [15 x i8]*@.str4454, i32 0, i32 0
%.tmp4456 = load i32, i32* %if_id
%.tmp4457 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4453, i8* %.tmp4455, i32 %.tmp4456)
%.tmp4458 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4459 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4458, i32 0, i32 6
%.tmp4460 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4459
%.tmp4462 = getelementptr [11 x i8], [11 x i8]*@.str4461, i32 0, i32 0
%.tmp4463 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4460, i8* %.tmp4462)
%else_block = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4463, %m286$.Node.type** %else_block
%.tmp4464 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4465 = icmp ne %m286$.Node.type* %.tmp4464, null
br i1 %.tmp4465, label %.if.true.4466, label %.if.false.4466
.if.true.4466:
%.tmp4467 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4468 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4467, i32 0, i32 6
%.tmp4469 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4468
%.tmp4470 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4469, i32 0, i32 0
%.tmp4471 = load i8*, i8** %.tmp4470
%.tmp4473 = getelementptr [11 x i8], [11 x i8]*@.str4472, i32 0, i32 0
%.tmp4474 = call i32(i8*,i8*) @strcmp(i8* %.tmp4471, i8* %.tmp4473)
%.tmp4475 = icmp eq i32 %.tmp4474, 0
br i1 %.tmp4475, label %.if.true.4476, label %.if.false.4476
.if.true.4476:
%.tmp4477 = load %m286$.Node.type*, %m286$.Node.type** %else_block
%.tmp4478 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4477, i32 0, i32 6
%.tmp4479 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4478
%.tmp4480 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4479, i32 0, i32 6
%.tmp4481 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4480
%.tmp4483 = getelementptr [6 x i8], [6 x i8]*@.str4482, i32 0, i32 0
%.tmp4484 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp4481, i8* %.tmp4483)
store %m286$.Node.type* %.tmp4484, %m286$.Node.type** %block
%.tmp4485 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4486 = load %m286$.Node.type*, %m286$.Node.type** %block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4485, %m286$.Node.type* %.tmp4486)
br label %.if.end.4476
.if.false.4476:
%.tmp4487 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4488 = load %m286$.Node.type*, %m286$.Node.type** %else_block
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_if_block.v.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4487, %m286$.Node.type* %.tmp4488)
br label %.if.end.4476
.if.end.4476:
br label %.if.end.4466
.if.false.4466:
br label %.if.end.4466
.if.end.4466:
%.tmp4489 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4490 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4489, i32 0, i32 1
%.tmp4491 = load %m0$.File.type*, %m0$.File.type** %.tmp4490
%.tmp4493 = getelementptr [23 x i8], [23 x i8]*@.str4492, i32 0, i32 0
%.tmp4494 = load i32, i32* %if_id
%.tmp4495 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4491, i8* %.tmp4493, i32 %.tmp4494)
%.tmp4496 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4497 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4496, i32 0, i32 1
%.tmp4498 = load %m0$.File.type*, %m0$.File.type** %.tmp4497
%.tmp4500 = getelementptr [13 x i8], [13 x i8]*@.str4499, i32 0, i32 0
%.tmp4501 = load i32, i32* %if_id
%.tmp4502 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4498, i8* %.tmp4500, i32 %.tmp4501)
ret void
}
define void @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4503 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4504 = icmp ne %m286$.Node.type* %.tmp4503, null
br i1 %.tmp4504, label %.if.true.4505, label %.if.false.4505
.if.true.4505:
%.tmp4506 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4507 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4506, i32 0, i32 6
%.tmp4508 = load i8*, i8** %.tmp4507
%.tmp4509 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4510 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4509, i32 0, i32 3
%.tmp4511 = load i32, i32* %.tmp4510
%.tmp4512 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4513 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4512, i32 0, i32 4
%.tmp4514 = load i32, i32* %.tmp4513
%.tmp4515 = load i8*, i8** %msg
%.tmp4516 = call %m717$.Error.type*(i8*,i32,i32,i8*) @m717$new.m717$.Error.typep.cp.i.i.cp(i8* %.tmp4508, i32 %.tmp4511, i32 %.tmp4514, i8* %.tmp4515)
%err = alloca %m717$.Error.type*
store %m717$.Error.type* %.tmp4516, %m717$.Error.type** %err
%.tmp4517 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4518 = load %m717$.Error.type*, %m717$.Error.type** %err
call void(%m1830$.CompilerCtx.type*,%m717$.Error.type*) @m1830$append_error.v.m1830$.CompilerCtx.typep.m717$.Error.typep(%m1830$.CompilerCtx.type* %.tmp4517, %m717$.Error.type* %.tmp4518)
br label %.if.end.4505
.if.false.4505:
%.tmp4520 = getelementptr [61 x i8], [61 x i8]*@.str4519, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4520)
br label %.if.end.4505
.if.end.4505:
ret void
}
define void @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1830$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.info.arg, %m1830$.AssignableInfo.type** %info
%.tmp4521 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4522 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*) @m1830$get_current_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp4521)
%mod = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp4522, %m1830$.ModuleLookup.type** %mod
%.tmp4523 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4524 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4523, i32 0, i32 3
%.tmp4525 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4524
%.tmp4526 = icmp ne %m1830$.Scope.type* %.tmp4525, null
%.tmp4528 = getelementptr [82 x i8], [82 x i8]*@.str4527, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4526, i8* %.tmp4528)
%.tmp4529 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4530 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4529, i32 0, i32 3
%.tmp4531 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4530
%current_scope = alloca %m1830$.Scope.type*
store %m1830$.Scope.type* %.tmp4531, %m1830$.Scope.type** %current_scope
%.tmp4532 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* null, i32 1
%.tmp4533 = ptrtoint %m1830$.ScopeItem.type* %.tmp4532 to i32
%.tmp4534 = call i8*(i32) @malloc(i32 %.tmp4533)
%.tmp4535 = bitcast i8* %.tmp4534 to %m1830$.ScopeItem.type*
%newitem = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4535, %m1830$.ScopeItem.type** %newitem
%.tmp4536 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
%.tmp4537 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4536, i32 0, i32 0
%.tmp4538 = load i8*, i8** %name
store i8* %.tmp4538, i8** %.tmp4537
%.tmp4539 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
%.tmp4540 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4539, i32 0, i32 1
%.tmp4541 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
store %m1830$.AssignableInfo.type* %.tmp4541, %m1830$.AssignableInfo.type** %.tmp4540
%.tmp4542 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
%.tmp4543 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4542, i32 0, i32 2
store %m1830$.ScopeItem.type* null, %m1830$.ScopeItem.type** %.tmp4543
%.tmp4544 = load %m1830$.Scope.type*, %m1830$.Scope.type** %current_scope
%.tmp4545 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4544, i32 0, i32 1
%.tmp4546 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4545
%.tmp4547 = icmp eq %m1830$.ScopeItem.type* %.tmp4546, null
br i1 %.tmp4547, label %.if.true.4548, label %.if.false.4548
.if.true.4548:
%.tmp4549 = load %m1830$.Scope.type*, %m1830$.Scope.type** %current_scope
%.tmp4550 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4549, i32 0, i32 1
%.tmp4551 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
store %m1830$.ScopeItem.type* %.tmp4551, %m1830$.ScopeItem.type** %.tmp4550
ret void
br label %.if.end.4548
.if.false.4548:
br label %.if.end.4548
.if.end.4548:
%.tmp4552 = load %m1830$.Scope.type*, %m1830$.Scope.type** %current_scope
%.tmp4553 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4552, i32 0, i32 1
%.tmp4554 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4553
%last_item = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4554, %m1830$.ScopeItem.type** %last_item
br label %.for.start.4555
.for.start.4555:
%.tmp4556 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %last_item
%.tmp4557 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4556, i32 0, i32 2
%.tmp4558 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4557
%.tmp4559 = icmp ne %m1830$.ScopeItem.type* %.tmp4558, null
br i1 %.tmp4559, label %.for.continue.4555, label %.for.end.4555
.for.continue.4555:
%.tmp4560 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %last_item
%.tmp4561 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4560, i32 0, i32 2
%.tmp4562 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4561
store %m1830$.ScopeItem.type* %.tmp4562, %m1830$.ScopeItem.type** %last_item
br label %.for.start.4555
.for.end.4555:
%.tmp4563 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %last_item
%.tmp4564 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4563, i32 0, i32 2
%.tmp4565 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %newitem
store %m1830$.ScopeItem.type* %.tmp4565, %m1830$.ScopeItem.type** %.tmp4564
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
%.tmp4566 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4567 = load i8*, i8** %module
%.tmp4568 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4569 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4568, i32 0, i32 1
%.tmp4570 = load i8*, i8** %.tmp4569
%.tmp4571 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp4566, i8* %.tmp4567, i8* %.tmp4570)
%found = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4571, %m1830$.ScopeItem.type** %found
%.tmp4572 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4573 = icmp eq %m1830$.ScopeItem.type* %.tmp4572, null
br i1 %.tmp4573, label %.if.true.4574, label %.if.false.4574
.if.true.4574:
%.tmp4575 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4577 = getelementptr [31 x i8], [31 x i8]*@.str4576, i32 0, i32 0
%.tmp4578 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4579 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4578, i32 0, i32 1
%.tmp4580 = load i8*, i8** %.tmp4579
%.tmp4581 = load i8*, i8** %module
%.tmp4582 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4575, i8* %.tmp4577, i8* %.tmp4580, i8* %.tmp4581)
%.tmp4583 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4584 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4585 = load i8*, i8** %err_buf
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4583, %m286$.Node.type* %.tmp4584, i8* %.tmp4585)
%.tmp4586 = bitcast ptr null to %m1830$.ScopeItem.type*
ret %m1830$.ScopeItem.type* %.tmp4586
br label %.if.end.4574
.if.false.4574:
br label %.if.end.4574
.if.end.4574:
br label %.for.start.4587
.for.start.4587:
%.tmp4588 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4589 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4588, i32 0, i32 7
%.tmp4590 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4589
%.tmp4591 = icmp ne %m286$.Node.type* %.tmp4590, null
%.tmp4592 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4593 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4592, i32 0, i32 1
%.tmp4594 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4593
%.tmp4595 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4594, i32 0, i32 2
%.tmp4596 = load i8*, i8** %.tmp4595
%.tmp4598 = getelementptr [7 x i8], [7 x i8]*@.str4597, i32 0, i32 0
%.tmp4599 = call i32(i8*,i8*) @strcmp(i8* %.tmp4596, i8* %.tmp4598)
%.tmp4600 = icmp eq i32 %.tmp4599, 0
%.tmp4601 = and i1 %.tmp4591, %.tmp4600
br i1 %.tmp4601, label %.for.continue.4587, label %.for.end.4587
.for.continue.4587:
%.tmp4602 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4603 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4604 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4603, i32 0, i32 1
%.tmp4605 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4604
%.tmp4606 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4605, i32 0, i32 0
%.tmp4607 = load i8*, i8** %.tmp4606
%.tmp4608 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4609 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4608, i32 0, i32 7
%.tmp4610 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4609
%.tmp4611 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4610, i32 0, i32 7
%.tmp4612 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4611
%.tmp4613 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1830$find_defined_in.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4602, i8* %.tmp4607, %m286$.Node.type* %.tmp4612)
store %m1830$.ScopeItem.type* %.tmp4613, %m1830$.ScopeItem.type** %found
%.tmp4614 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
%.tmp4615 = icmp eq %m1830$.ScopeItem.type* %.tmp4614, null
br i1 %.tmp4615, label %.if.true.4616, label %.if.false.4616
.if.true.4616:
%.tmp4617 = bitcast ptr null to %m1830$.ScopeItem.type*
ret %m1830$.ScopeItem.type* %.tmp4617
br label %.if.end.4616
.if.false.4616:
br label %.if.end.4616
.if.end.4616:
br label %.for.start.4587
.for.end.4587:
%.tmp4618 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %found
ret %m1830$.ScopeItem.type* %.tmp4618
}
define %m1830$.ScopeItem.type* @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4619 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4620 = load i8*, i8** %module
%.tmp4621 = call %m1830$.ModuleLookup.type*(%m1830$.CompilerCtx.type*,i8*) @m1830$get_module.m1830$.ModuleLookup.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp4619, i8* %.tmp4620)
%mod = alloca %m1830$.ModuleLookup.type*
store %m1830$.ModuleLookup.type* %.tmp4621, %m1830$.ModuleLookup.type** %mod
%.tmp4622 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4623 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4622, i32 0, i32 3
%.tmp4624 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4623
%.tmp4625 = icmp ne %m1830$.Scope.type* %.tmp4624, null
%.tmp4627 = getelementptr [77 x i8], [77 x i8]*@.str4626, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4625, i8* %.tmp4627)
%.tmp4629 = load %m1830$.ModuleLookup.type*, %m1830$.ModuleLookup.type** %mod
%.tmp4630 = getelementptr %m1830$.ModuleLookup.type, %m1830$.ModuleLookup.type* %.tmp4629, i32 0, i32 3
%.tmp4631 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4630
%s = alloca %m1830$.Scope.type*
store %m1830$.Scope.type* %.tmp4631, %m1830$.Scope.type** %s
br label %.for.start.4628
.for.start.4628:
%.tmp4632 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp4633 = icmp ne %m1830$.Scope.type* %.tmp4632, null
br i1 %.tmp4633, label %.for.continue.4628, label %.for.end.4628
.for.continue.4628:
%.tmp4635 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp4636 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4635, i32 0, i32 1
%.tmp4637 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4636
%item = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4637, %m1830$.ScopeItem.type** %item
br label %.for.start.4634
.for.start.4634:
%.tmp4638 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
%.tmp4639 = icmp ne %m1830$.ScopeItem.type* %.tmp4638, null
br i1 %.tmp4639, label %.for.continue.4634, label %.for.end.4634
.for.continue.4634:
%.tmp4640 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
%.tmp4641 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4640, i32 0, i32 0
%.tmp4642 = load i8*, i8** %.tmp4641
%.tmp4643 = load i8*, i8** %assignable_name
%.tmp4644 = call i32(i8*,i8*) @strcmp(i8* %.tmp4642, i8* %.tmp4643)
%.tmp4645 = icmp eq i32 %.tmp4644, 0
br i1 %.tmp4645, label %.if.true.4646, label %.if.false.4646
.if.true.4646:
%.tmp4647 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
ret %m1830$.ScopeItem.type* %.tmp4647
br label %.if.end.4646
.if.false.4646:
br label %.if.end.4646
.if.end.4646:
%.tmp4648 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %item
%.tmp4649 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4648, i32 0, i32 2
%.tmp4650 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %.tmp4649
store %m1830$.ScopeItem.type* %.tmp4650, %m1830$.ScopeItem.type** %item
br label %.for.start.4634
.for.end.4634:
%.tmp4651 = load %m1830$.Scope.type*, %m1830$.Scope.type** %s
%.tmp4652 = getelementptr %m1830$.Scope.type, %m1830$.Scope.type* %.tmp4651, i32 0, i32 2
%.tmp4653 = load %m1830$.Scope.type*, %m1830$.Scope.type** %.tmp4652
store %m1830$.Scope.type* %.tmp4653, %m1830$.Scope.type** %s
br label %.for.start.4628
.for.end.4628:
%.tmp4654 = bitcast ptr null to %m1830$.ScopeItem.type*
ret %m1830$.ScopeItem.type* %.tmp4654
}
define %m1830$.ScopeItem.type* @m1830$find_defined.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%dotted_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.dotted_name.arg, %m286$.Node.type** %dotted_name
%.tmp4655 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4656 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4657 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4656, i32 0, i32 6
%.tmp4658 = load i8*, i8** %.tmp4657
%.tmp4659 = load %m286$.Node.type*, %m286$.Node.type** %dotted_name
%.tmp4660 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4659, i32 0, i32 6
%.tmp4661 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4660
%.tmp4662 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,%m286$.Node.type*) @m1830$find_defined_in.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp4655, i8* %.tmp4658, %m286$.Node.type* %.tmp4661)
ret %m1830$.ScopeItem.type* %.tmp4662
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
%.tmp4663 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4664 = icmp eq %m1830$.AssignableInfo.type* %.tmp4663, null
br i1 %.tmp4664, label %.if.true.4665, label %.if.false.4665
.if.true.4665:
%.tmp4666 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4667 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4669 = getelementptr [54 x i8], [54 x i8]*@.str4668, i32 0, i32 0
%.tmp4670 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4666, %m286$.Node.type* %.tmp4667, i8* %.tmp4669)
%.tmp4671 = call i32(i8*,...) @printf(i8* %.tmp4670)
%.tmp4672 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4672
br label %.if.end.4665
.if.false.4665:
br label %.if.end.4665
.if.end.4665:
%.tmp4673 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4674 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4673, i32 0, i32 2
%.tmp4675 = load i8*, i8** %.tmp4674
%.tmp4677 = getelementptr [9 x i8], [9 x i8]*@.str4676, i32 0, i32 0
%.tmp4678 = call i32(i8*,i8*) @strcmp(i8* %.tmp4675, i8* %.tmp4677)
%.tmp4679 = icmp eq i32 %.tmp4678, 0
%.tmp4680 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4681 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4680, i32 0, i32 2
%.tmp4682 = load i8*, i8** %.tmp4681
%.tmp4684 = getelementptr [7 x i8], [7 x i8]*@.str4683, i32 0, i32 0
%.tmp4685 = call i32(i8*,i8*) @strcmp(i8* %.tmp4682, i8* %.tmp4684)
%.tmp4686 = icmp eq i32 %.tmp4685, 0
%.tmp4687 = or i1 %.tmp4679, %.tmp4686
br i1 %.tmp4687, label %.if.true.4688, label %.if.false.4688
.if.true.4688:
%.tmp4689 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4690 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4689, i32 0, i32 7
%.tmp4691 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4690
%.tmp4692 = icmp ne %m286$.Node.type* %.tmp4691, null
br i1 %.tmp4692, label %.if.true.4693, label %.if.false.4693
.if.true.4693:
%.tmp4694 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4696 = getelementptr [46 x i8], [46 x i8]*@.str4695, i32 0, i32 0
%.tmp4697 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4698 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4697, i32 0, i32 7
%.tmp4699 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4698
%.tmp4700 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4699, i32 0, i32 7
%.tmp4701 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4700
%.tmp4702 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4701, i32 0, i32 1
%.tmp4703 = load i8*, i8** %.tmp4702
%.tmp4704 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4705 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4704, i32 0, i32 1
%.tmp4706 = load i8*, i8** %.tmp4705
%.tmp4707 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4694, i8* %.tmp4696, i8* %.tmp4703, i8* %.tmp4706)
%.tmp4708 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4709 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4710 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4708, %m286$.Node.type* %.tmp4709, i8* %.tmp4710)
%.tmp4711 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4711
br label %.if.end.4693
.if.false.4693:
br label %.if.end.4693
.if.end.4693:
%.tmp4712 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp4712
br label %.if.end.4688
.if.false.4688:
%.tmp4713 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4714 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4713, i32 0, i32 2
%.tmp4715 = load i8*, i8** %.tmp4714
%.tmp4717 = getelementptr [9 x i8], [9 x i8]*@.str4716, i32 0, i32 0
%.tmp4718 = call i32(i8*,i8*) @strcmp(i8* %.tmp4715, i8* %.tmp4717)
%.tmp4719 = icmp eq i32 %.tmp4718, 0
%.tmp4720 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4721 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4720, i32 0, i32 7
%.tmp4722 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4721
%.tmp4723 = icmp ne %m286$.Node.type* %.tmp4722, null
%.tmp4724 = and i1 %.tmp4719, %.tmp4723
br i1 %.tmp4724, label %.if.true.4725, label %.if.false.4725
.if.true.4725:
%.tmp4726 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%base_var = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4726, %m1830$.AssignableInfo.type** %base_var
%.tmp4727 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4728 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4727, i32 0, i32 3
%.tmp4729 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4728
%struct_info = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4729, %m1830$.Type.type** %struct_info
br label %.for.start.4730
.for.start.4730:
%.tmp4731 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4732 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4731, i32 0, i32 3
%.tmp4733 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4732
%.tmp4734 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4733, i32 0, i32 0
%.tmp4735 = load i8*, i8** %.tmp4734
%.tmp4737 = getelementptr [4 x i8], [4 x i8]*@.str4736, i32 0, i32 0
%.tmp4738 = call i32(i8*,i8*) @strcmp(i8* %.tmp4735, i8* %.tmp4737)
%.tmp4739 = icmp eq i32 %.tmp4738, 0
br i1 %.tmp4739, label %.for.continue.4730, label %.for.end.4730
.for.continue.4730:
%.tmp4740 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4741 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4740)
%new_base = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4741, %m1830$.AssignableInfo.type** %new_base
%.tmp4742 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4743 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4742, %m1830$.AssignableInfo.type* %.tmp4743)
%.tmp4744 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4745 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4744, i32 0, i32 3
%.tmp4746 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4747 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4746, i32 0, i32 3
%.tmp4748 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4747
%.tmp4749 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4748, i32 0, i32 3
%.tmp4750 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4749
store %m1830$.Type.type* %.tmp4750, %m1830$.Type.type** %.tmp4745
%.tmp4751 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4752 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4751, i32 0, i32 1
%.tmp4753 = load %m0$.File.type*, %m0$.File.type** %.tmp4752
%.tmp4755 = getelementptr [23 x i8], [23 x i8]*@.str4754, i32 0, i32 0
%.tmp4756 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4757 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4756)
%.tmp4758 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4759 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp4760 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4759, i32 0, i32 3
%.tmp4761 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4760
%.tmp4762 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4758, %m1830$.Type.type* %.tmp4761)
%.tmp4763 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4764 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4765 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4764, i32 0, i32 3
%.tmp4766 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4765
%.tmp4767 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4763, %m1830$.Type.type* %.tmp4766)
%.tmp4768 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4769 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4768)
%.tmp4770 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4753, i8* %.tmp4755, i8* %.tmp4757, i8* %.tmp4762, i8* %.tmp4767, i8* %.tmp4769)
%.tmp4771 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
store %m1830$.AssignableInfo.type* %.tmp4771, %m1830$.AssignableInfo.type** %base_var
%.tmp4772 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4773 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4772, i32 0, i32 3
%.tmp4774 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4773
store %m1830$.Type.type* %.tmp4774, %m1830$.Type.type** %struct_info
br label %.for.start.4730
.for.end.4730:
%.tmp4775 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4776 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4775, i32 0, i32 0
%.tmp4777 = load i8*, i8** %.tmp4776
%.tmp4779 = getelementptr [10 x i8], [10 x i8]*@.str4778, i32 0, i32 0
%.tmp4780 = call i32(i8*,i8*) @strcmp(i8* %.tmp4777, i8* %.tmp4779)
%.tmp4781 = icmp eq i32 %.tmp4780, 0
br i1 %.tmp4781, label %.if.true.4782, label %.if.false.4782
.if.true.4782:
%.tmp4783 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4784 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4783, i32 0, i32 3
%.tmp4785 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4784
store %m1830$.Type.type* %.tmp4785, %m1830$.Type.type** %struct_info
br label %.if.end.4782
.if.false.4782:
br label %.if.end.4782
.if.end.4782:
%.tmp4786 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4787 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4786, i32 0, i32 0
%.tmp4788 = load i8*, i8** %.tmp4787
%.tmp4790 = getelementptr [7 x i8], [7 x i8]*@.str4789, i32 0, i32 0
%.tmp4791 = call i32(i8*,i8*) @strcmp(i8* %.tmp4788, i8* %.tmp4790)
%.tmp4792 = icmp ne i32 %.tmp4791, 0
br i1 %.tmp4792, label %.if.true.4793, label %.if.false.4793
.if.true.4793:
%.tmp4794 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4796 = getelementptr [48 x i8], [48 x i8]*@.str4795, i32 0, i32 0
%.tmp4797 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4798 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4797, i32 0, i32 7
%.tmp4799 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4798
%.tmp4800 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4799, i32 0, i32 7
%.tmp4801 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4800
%.tmp4802 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4801, i32 0, i32 1
%.tmp4803 = load i8*, i8** %.tmp4802
%.tmp4804 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4805 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4804, i32 0, i32 1
%.tmp4806 = load i8*, i8** %.tmp4805
%.tmp4807 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4794, i8* %.tmp4796, i8* %.tmp4803, i8* %.tmp4806)
%.tmp4808 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4809 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4810 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4808, %m286$.Node.type* %.tmp4809, i8* %.tmp4810)
%.tmp4811 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4811
br label %.if.end.4793
.if.false.4793:
br label %.if.end.4793
.if.end.4793:
%.tmp4812 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4813 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4812, i32 0, i32 7
%.tmp4814 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4813
%.tmp4815 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4814, i32 0, i32 7
%.tmp4816 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4815
%.tmp4817 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4816, i32 0, i32 1
%.tmp4818 = load i8*, i8** %.tmp4817
%field_name = alloca i8*
store i8* %.tmp4818, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp4819 = bitcast ptr null to %m1830$.Type.type*
%found_field = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4819, %m1830$.Type.type** %found_field
%.tmp4821 = load %m1830$.Type.type*, %m1830$.Type.type** %struct_info
%.tmp4822 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4821, i32 0, i32 3
%.tmp4823 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4822
%field = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp4823, %m1830$.Type.type** %field
br label %.for.start.4820
.for.start.4820:
%.tmp4824 = load i1, i1* %quit
%.tmp4825 = icmp eq i1 %.tmp4824, 0
br i1 %.tmp4825, label %.for.continue.4820, label %.for.end.4820
.for.continue.4820:
%.tmp4826 = load %m1830$.Type.type*, %m1830$.Type.type** %field
%.tmp4827 = icmp eq %m1830$.Type.type* %.tmp4826, null
br i1 %.tmp4827, label %.if.true.4828, label %.if.false.4828
.if.true.4828:
store i1 1, i1* %quit
br label %.if.end.4828
.if.false.4828:
%.tmp4829 = load %m1830$.Type.type*, %m1830$.Type.type** %field
%.tmp4830 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4829, i32 0, i32 1
%.tmp4831 = load i8*, i8** %.tmp4830
%.tmp4832 = load i8*, i8** %field_name
%.tmp4833 = call i32(i8*,i8*) @strcmp(i8* %.tmp4831, i8* %.tmp4832)
%.tmp4834 = icmp eq i32 %.tmp4833, 0
br i1 %.tmp4834, label %.if.true.4835, label %.if.false.4835
.if.true.4835:
store i1 1, i1* %quit
%.tmp4836 = load %m1830$.Type.type*, %m1830$.Type.type** %field
store %m1830$.Type.type* %.tmp4836, %m1830$.Type.type** %found_field
br label %.if.end.4835
.if.false.4835:
%.tmp4837 = load i32, i32* %field_id
%.tmp4838 = add i32 %.tmp4837, 1
store i32 %.tmp4838, i32* %field_id
br label %.if.end.4835
.if.end.4835:
br label %.if.end.4828
.if.end.4828:
%.tmp4839 = load %m1830$.Type.type*, %m1830$.Type.type** %field
%.tmp4840 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp4839, i32 0, i32 4
%.tmp4841 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4840
store %m1830$.Type.type* %.tmp4841, %m1830$.Type.type** %field
br label %.for.start.4820
.for.end.4820:
%.tmp4842 = load %m1830$.Type.type*, %m1830$.Type.type** %found_field
%.tmp4843 = icmp eq %m1830$.Type.type* %.tmp4842, null
br i1 %.tmp4843, label %.if.true.4844, label %.if.false.4844
.if.true.4844:
%.tmp4845 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4847 = getelementptr [34 x i8], [34 x i8]*@.str4846, i32 0, i32 0
%.tmp4848 = load i8*, i8** %field_name
%.tmp4849 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4850 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4849, i32 0, i32 1
%.tmp4851 = load i8*, i8** %.tmp4850
%.tmp4852 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4845, i8* %.tmp4847, i8* %.tmp4848, i8* %.tmp4851)
%.tmp4853 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4854 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4855 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4853, %m286$.Node.type* %.tmp4854, i8* %.tmp4855)
%.tmp4856 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4856
br label %.if.end.4844
.if.false.4844:
br label %.if.end.4844
.if.end.4844:
%.tmp4857 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4858 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp4857)
%new_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4858, %m1830$.AssignableInfo.type** %new_info
%.tmp4859 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4860 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4859, i32 0, i32 3
%.tmp4861 = load %m1830$.Type.type*, %m1830$.Type.type** %found_field
store %m1830$.Type.type* %.tmp4861, %m1830$.Type.type** %.tmp4860
%.tmp4862 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4863 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4862, %m1830$.AssignableInfo.type* %.tmp4863)
%.tmp4864 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4865 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4864, i32 0, i32 2
%.tmp4867 = getelementptr [9 x i8], [9 x i8]*@.str4866, i32 0, i32 0
store i8* %.tmp4867, i8** %.tmp4865
%.tmp4868 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4869 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4870 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4869, i32 0, i32 3
%.tmp4871 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp4870
%.tmp4872 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp4868, %m1830$.Type.type* %.tmp4871)
%info_tr = alloca i8*
store i8* %.tmp4872, i8** %info_tr
%.tmp4873 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4874 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4873, i32 0, i32 1
%.tmp4875 = load %m0$.File.type*, %m0$.File.type** %.tmp4874
%.tmp4877 = getelementptr [46 x i8], [46 x i8]*@.str4876, i32 0, i32 0
%.tmp4878 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4879 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4878)
%.tmp4880 = load i8*, i8** %info_tr
%.tmp4881 = load i8*, i8** %info_tr
%.tmp4882 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base_var
%.tmp4883 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4882)
%.tmp4884 = load i32, i32* %field_id
%.tmp4885 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4875, i8* %.tmp4877, i8* %.tmp4879, i8* %.tmp4880, i8* %.tmp4881, i8* %.tmp4883, i32 %.tmp4884)
%.tmp4886 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4887 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4888 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4887, i32 0, i32 7
%.tmp4889 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4888
%.tmp4890 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4889, i32 0, i32 7
%.tmp4891 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4890
%.tmp4892 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_info
%.tmp4893 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,%m1830$.AssignableInfo.type*) @m1830$get_dotted_name.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp4886, %m286$.Node.type* %.tmp4891, %m1830$.AssignableInfo.type* %.tmp4892)
ret %m1830$.AssignableInfo.type* %.tmp4893
br label %.if.end.4725
.if.false.4725:
%.tmp4894 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4895 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4894, i32 0, i32 2
%.tmp4896 = load i8*, i8** %.tmp4895
%.tmp4898 = getelementptr [9 x i8], [9 x i8]*@.str4897, i32 0, i32 0
%.tmp4899 = call i32(i8*,i8*) @strcmp(i8* %.tmp4896, i8* %.tmp4898)
%.tmp4900 = icmp eq i32 %.tmp4899, 0
br i1 %.tmp4900, label %.if.true.4901, label %.if.false.4901
.if.true.4901:
%.tmp4902 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp4902
br label %.if.end.4901
.if.false.4901:
br label %.if.end.4901
.if.end.4901:
br label %.if.end.4725
.if.end.4725:
br label %.if.end.4688
.if.end.4688:
%.tmp4903 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4904 = load %m286$.Node.type*, %m286$.Node.type** %dot_name_ptr
%.tmp4906 = getelementptr [43 x i8], [43 x i8]*@.str4905, i32 0, i32 0
%.tmp4907 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4903, %m286$.Node.type* %.tmp4904, i8* %.tmp4906)
%.tmp4908 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4909 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4908, i32 0, i32 2
%.tmp4910 = load i8*, i8** %.tmp4909
%.tmp4911 = call i32(i8*,...) @printf(i8* %.tmp4907, i8* %.tmp4910)
%.tmp4912 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4912
}
define %m1830$.AssignableInfo.type* @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp4913 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4913, %m286$.Node.type** %curr_node
%.tmp4914 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4915 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4914, i32 0, i32 0
%.tmp4916 = load i8*, i8** %.tmp4915
%.tmp4918 = getelementptr [12 x i8], [12 x i8]*@.str4917, i32 0, i32 0
%.tmp4919 = call i32(i8*,i8*) @strcmp(i8* %.tmp4916, i8* %.tmp4918)
%.tmp4920 = icmp ne i32 %.tmp4919, 0
br i1 %.tmp4920, label %.if.true.4921, label %.if.false.4921
.if.true.4921:
%.tmp4923 = getelementptr [92 x i8], [92 x i8]*@.str4922, i32 0, i32 0
%.tmp4924 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4925 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4924, i32 0, i32 0
%.tmp4926 = load i8*, i8** %.tmp4925
%.tmp4927 = call i32(i8*,...) @printf(i8* %.tmp4923, i8* %.tmp4926)
%.tmp4928 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp4929 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4928, i32 0, i32 6
%.tmp4930 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4929
store %m286$.Node.type* %.tmp4930, %m286$.Node.type** %curr_node
br label %.if.end.4921
.if.false.4921:
br label %.if.end.4921
.if.end.4921:
%.tmp4931 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp4932 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4931, i32 0, i32 6
%.tmp4933 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4932
%assignable_name = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp4933, %m286$.Node.type** %assignable_name
%.tmp4934 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4935 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4936 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp4935, i32 0, i32 6
%.tmp4937 = load i8*, i8** %.tmp4936
%.tmp4938 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4939 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4938, i32 0, i32 6
%.tmp4940 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4939
%.tmp4941 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4940, i32 0, i32 1
%.tmp4942 = load i8*, i8** %.tmp4941
%.tmp4943 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp4934, i8* %.tmp4937, i8* %.tmp4942)
%scope_info = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp4943, %m1830$.ScopeItem.type** %scope_info
%.tmp4944 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4945 = icmp eq %m1830$.ScopeItem.type* %.tmp4944, null
br i1 %.tmp4945, label %.if.true.4946, label %.if.false.4946
.if.true.4946:
%.tmp4947 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4949 = getelementptr [25 x i8], [25 x i8]*@.str4948, i32 0, i32 0
%.tmp4950 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4951 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4950, i32 0, i32 6
%.tmp4952 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4951
%.tmp4953 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4952, i32 0, i32 1
%.tmp4954 = load i8*, i8** %.tmp4953
%.tmp4955 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4947, i8* %.tmp4949, i8* %.tmp4954)
%.tmp4956 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4957 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4958 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp4956, %m286$.Node.type* %.tmp4957, i8* %.tmp4958)
%.tmp4959 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp4959
br label %.if.end.4946
.if.false.4946:
br label %.if.end.4946
.if.end.4946:
%.tmp4960 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4961 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp4960, i32 0, i32 1
%.tmp4962 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp4961
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp4962, %m1830$.AssignableInfo.type** %info
%.tmp4963 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4964 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp4963, i32 0, i32 2
%.tmp4965 = load i8*, i8** %.tmp4964
%.tmp4967 = getelementptr [7 x i8], [7 x i8]*@.str4966, i32 0, i32 0
%.tmp4968 = call i32(i8*,i8*) @strcmp(i8* %.tmp4965, i8* %.tmp4967)
%.tmp4969 = icmp eq i32 %.tmp4968, 0
br i1 %.tmp4969, label %.if.true.4970, label %.if.false.4970
.if.true.4970:
%.tmp4971 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp4972 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp4973 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4972)
%.tmp4974 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4975 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4974, i32 0, i32 6
%.tmp4976 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4975
%.tmp4977 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4976, i32 0, i32 7
%.tmp4978 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4977
%.tmp4979 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4978, i32 0, i32 7
%.tmp4980 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4979
%.tmp4981 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4980, i32 0, i32 1
%.tmp4982 = load i8*, i8** %.tmp4981
%.tmp4983 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,i8*,i8*) @m1830$find_defined_str.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.cp.cp(%m1830$.CompilerCtx.type* %.tmp4971, i8* %.tmp4973, i8* %.tmp4982)
store %m1830$.ScopeItem.type* %.tmp4983, %m1830$.ScopeItem.type** %scope_info
%.tmp4984 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp4985 = icmp eq %m1830$.ScopeItem.type* %.tmp4984, null
br i1 %.tmp4985, label %.if.true.4986, label %.if.false.4986
.if.true.4986:
%.tmp4987 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4989 = getelementptr [31 x i8], [31 x i8]*@.str4988, i32 0, i32 0
%.tmp4990 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp4991 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4990, i32 0, i32 6
%.tmp4992 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4991
%.tmp4993 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4992, i32 0, i32 7
%.tmp4994 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4993
%.tmp4995 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4994, i32 0, i32 7
%.tmp4996 = load %m286$.Node.type*, %m286$.Node.type** %.tmp4995
%.tmp4997 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp4996, i32 0, i32 1
%.tmp4998 = load i8*, i8** %.tmp4997
%.tmp4999 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5000 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp4999)
%.tmp5001 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4987, i8* %.tmp4989, i8* %.tmp4998, i8* %.tmp5000)
%.tmp5002 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5003 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5004 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5002, %m286$.Node.type* %.tmp5003, i8* %.tmp5004)
%.tmp5005 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5005
br label %.if.end.4986
.if.false.4986:
br label %.if.end.4986
.if.end.4986:
%.tmp5006 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %scope_info
%.tmp5007 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp5006, i32 0, i32 1
%.tmp5008 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp5007
store %m1830$.AssignableInfo.type* %.tmp5008, %m1830$.AssignableInfo.type** %info
%.tmp5009 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5010 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5009, i32 0, i32 6
%.tmp5011 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5010
%.tmp5012 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5011, i32 0, i32 7
%.tmp5013 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5012
%.tmp5014 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5013, i32 0, i32 7
%.tmp5015 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5014
store %m286$.Node.type* %.tmp5015, %m286$.Node.type** %assignable_name
br label %.if.end.4970
.if.false.4970:
%.tmp5016 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5017 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5016, i32 0, i32 6
%.tmp5018 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5017
store %m286$.Node.type* %.tmp5018, %m286$.Node.type** %assignable_name
br label %.if.end.4970
.if.end.4970:
%.tmp5019 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5020 = load %m286$.Node.type*, %m286$.Node.type** %assignable_name
%.tmp5021 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5022 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,%m1830$.AssignableInfo.type*) @m1830$get_dotted_name.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5019, %m286$.Node.type* %.tmp5020, %m1830$.AssignableInfo.type* %.tmp5021)
%base = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5022, %m1830$.AssignableInfo.type** %base
%.tmp5024 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5025 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5024, i32 0, i32 6
%.tmp5026 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5025
%.tmp5027 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5026, i32 0, i32 7
%.tmp5028 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5027
%addr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5028, %m286$.Node.type** %addr
br label %.for.start.5023
.for.start.5023:
%.tmp5029 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5030 = icmp ne %m286$.Node.type* %.tmp5029, null
br i1 %.tmp5030, label %.for.continue.5023, label %.for.end.5023
.for.continue.5023:
%.tmp5031 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5032 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5031, i32 0, i32 7
%.tmp5033 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5032
%index = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5033, %m286$.Node.type** %index
%.tmp5034 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5035 = load %m286$.Node.type*, %m286$.Node.type** %index
%.tmp5036 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5034, %m286$.Node.type* %.tmp5035)
%index_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5036, %m1830$.AssignableInfo.type** %index_info
%.tmp5037 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5038 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp5039 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5038, i32 0, i32 3
%.tmp5040 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5039
%.tmp5041 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5037, %m1830$.Type.type* %.tmp5040)
%base_type = alloca i8*
store i8* %.tmp5041, i8** %base_type
%.tmp5042 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5043 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %index_info
%.tmp5044 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5043, i32 0, i32 3
%.tmp5045 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5044
%.tmp5046 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5042, %m1830$.Type.type* %.tmp5045)
%index_type = alloca i8*
store i8* %.tmp5046, i8** %index_type
%.tmp5047 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5048 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp5047)
%tmp_id = alloca i32
store i32 %.tmp5048, i32* %tmp_id
%.tmp5049 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5050 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5049, i32 0, i32 1
%.tmp5051 = load %m0$.File.type*, %m0$.File.type** %.tmp5050
%.tmp5053 = getelementptr [28 x i8], [28 x i8]*@.str5052, i32 0, i32 0
%.tmp5054 = load i32, i32* %tmp_id
%.tmp5055 = load i8*, i8** %base_type
%.tmp5056 = load i8*, i8** %base_type
%.tmp5057 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp5058 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5057)
%.tmp5059 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5051, i8* %.tmp5053, i32 %.tmp5054, i8* %.tmp5055, i8* %.tmp5056, i8* %.tmp5058)
%.tmp5060 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5061 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5060)
%new_base = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5061, %m1830$.AssignableInfo.type** %new_base
%.tmp5062 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5063 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5062, %m1830$.AssignableInfo.type* %.tmp5063)
%.tmp5064 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp5065 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5064, i32 0, i32 3
%.tmp5066 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5065
%.tmp5067 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5066, i32 0, i32 3
%.tmp5068 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5067
%.tmp5069 = icmp eq %m1830$.Type.type* %.tmp5068, null
br i1 %.tmp5069, label %.if.true.5070, label %.if.false.5070
.if.true.5070:
%.tmp5071 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp5073 = getelementptr [35 x i8], [35 x i8]*@.str5072, i32 0, i32 0
%.tmp5074 = load i8*, i8** %base_type
%.tmp5075 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5071, i8* %.tmp5073, i8* %.tmp5074)
%.tmp5076 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5077 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5078 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5076, %m286$.Node.type* %.tmp5077, i8* %.tmp5078)
%.tmp5079 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
ret %m1830$.AssignableInfo.type* %.tmp5079
br label %.if.end.5070
.if.false.5070:
br label %.if.end.5070
.if.end.5070:
%.tmp5080 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp5081 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5080, i32 0, i32 3
%.tmp5082 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
%.tmp5083 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5082, i32 0, i32 3
%.tmp5084 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5083
%.tmp5085 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5084, i32 0, i32 3
%.tmp5086 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5085
store %m1830$.Type.type* %.tmp5086, %m1830$.Type.type** %.tmp5081
%.tmp5087 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5088 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp5089 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5088, i32 0, i32 3
%.tmp5090 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5089
%.tmp5091 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5087, %m1830$.Type.type* %.tmp5090)
%base_type_2 = alloca i8*
store i8* %.tmp5091, i8** %base_type_2
%.tmp5092 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5093 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5092, i32 0, i32 1
%.tmp5094 = load %m0$.File.type*, %m0$.File.type** %.tmp5093
%.tmp5096 = getelementptr [44 x i8], [44 x i8]*@.str5095, i32 0, i32 0
%.tmp5097 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
%.tmp5098 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5097)
%.tmp5099 = load i8*, i8** %base_type_2
%.tmp5100 = load i8*, i8** %base_type_2
%.tmp5101 = load i32, i32* %tmp_id
%.tmp5102 = load i8*, i8** %index_type
%.tmp5103 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %index_info
%.tmp5104 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5103)
%.tmp5105 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5094, i8* %.tmp5096, i8* %.tmp5098, i8* %.tmp5099, i8* %.tmp5100, i32 %.tmp5101, i8* %.tmp5102, i8* %.tmp5104)
%.tmp5106 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %new_base
store %m1830$.AssignableInfo.type* %.tmp5106, %m1830$.AssignableInfo.type** %base
%.tmp5107 = load %m286$.Node.type*, %m286$.Node.type** %addr
%.tmp5108 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5107, i32 0, i32 7
%.tmp5109 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5108
%.tmp5110 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5109, i32 0, i32 7
%.tmp5111 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5110
%.tmp5112 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5111, i32 0, i32 7
%.tmp5113 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5112
store %m286$.Node.type* %.tmp5113, %m286$.Node.type** %addr
br label %.for.start.5023
.for.end.5023:
%.tmp5114 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %base
ret %m1830$.AssignableInfo.type* %.tmp5114
}
%m1830$.StackHead.type = type {%m1951$.SYStack.type*}
define %m1830$.AssignableInfo.type* @m1830$compile_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5115 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5116 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5115, i32 0, i32 6
%.tmp5117 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5116
%.tmp5119 = getelementptr [16 x i8], [16 x i8]*@.str5118, i32 0, i32 0
%.tmp5120 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5117, i8* %.tmp5119)
%assignable_start = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5120, %m286$.Node.type** %assignable_start
%.tmp5121 = load %m286$.Node.type*, %m286$.Node.type** %assignable_start
%.tmp5122 = call %m1951$.SYStack.type*(%m286$.Node.type*) @m1951$sy_algorithm.m1951$.SYStack.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5121)
%operator_stack = alloca %m1951$.SYStack.type*
store %m1951$.SYStack.type* %.tmp5122, %m1951$.SYStack.type** %operator_stack
%.tmp5123 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* null, i32 1
%.tmp5124 = ptrtoint %m1830$.StackHead.type* %.tmp5123 to i32
%.tmp5125 = call i8*(i32) @malloc(i32 %.tmp5124)
%.tmp5126 = bitcast i8* %.tmp5125 to %m1830$.StackHead.type*
%stack = alloca %m1830$.StackHead.type*
store %m1830$.StackHead.type* %.tmp5126, %m1830$.StackHead.type** %stack
%.tmp5127 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5128 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5127, i32 0, i32 0
%.tmp5129 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %operator_stack
store %m1951$.SYStack.type* %.tmp5129, %m1951$.SYStack.type** %.tmp5128
%.tmp5130 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5131 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5132 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m1830$.StackHead.type*) @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.tmp5130, %m1830$.StackHead.type* %.tmp5131)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5132, %m1830$.AssignableInfo.type** %info
%.tmp5133 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5134 = icmp eq %m1830$.AssignableInfo.type* %.tmp5133, null
br i1 %.tmp5134, label %.if.true.5135, label %.if.false.5135
.if.true.5135:
%.tmp5136 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp5136
br label %.if.end.5135
.if.false.5135:
br label %.if.end.5135
.if.end.5135:
%.tmp5137 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5138 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5137, i32 0, i32 6
%.tmp5139 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5138
%.tmp5141 = getelementptr [5 x i8], [5 x i8]*@.str5140, i32 0, i32 0
%.tmp5142 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5139, i8* %.tmp5141)
%cast = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5142, %m286$.Node.type** %cast
%.tmp5143 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5144 = icmp ne %m286$.Node.type* %.tmp5143, null
br i1 %.tmp5144, label %.if.true.5145, label %.if.false.5145
.if.true.5145:
%.tmp5146 = load %m286$.Node.type*, %m286$.Node.type** %cast
%.tmp5147 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5146, i32 0, i32 6
%.tmp5148 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5147
%.tmp5150 = getelementptr [5 x i8], [5 x i8]*@.str5149, i32 0, i32 0
%.tmp5151 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5148, i8* %.tmp5150)
%cast_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5151, %m286$.Node.type** %cast_type
%.tmp5152 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5153 = load %m286$.Node.type*, %m286$.Node.type** %cast_type
%.tmp5154 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5153, i32 0, i32 6
%.tmp5155 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5154
%.tmp5156 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5152, %m286$.Node.type* %.tmp5155)
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp5156, %m1830$.Type.type** %type
%.tmp5157 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5158 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5157)
%prev_id = alloca i8*
store i8* %.tmp5158, i8** %prev_id
%.tmp5159 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5160 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5159, %m1830$.AssignableInfo.type* %.tmp5160)
%.tmp5161 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5162 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5161, i32 0, i32 1
%.tmp5163 = load %m0$.File.type*, %m0$.File.type** %.tmp5162
%.tmp5165 = getelementptr [26 x i8], [26 x i8]*@.str5164, i32 0, i32 0
%.tmp5166 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5167 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5166)
%.tmp5168 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5169 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5170 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5169, i32 0, i32 3
%.tmp5171 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5170
%.tmp5172 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5168, %m1830$.Type.type* %.tmp5171)
%.tmp5173 = load i8*, i8** %prev_id
%.tmp5174 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5175 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5176 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5174, %m1830$.Type.type* %.tmp5175)
%.tmp5177 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5163, i8* %.tmp5165, i8* %.tmp5167, i8* %.tmp5172, i8* %.tmp5173, i8* %.tmp5176)
%.tmp5178 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5179 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5178, i32 0, i32 3
%.tmp5180 = load %m1830$.Type.type*, %m1830$.Type.type** %type
store %m1830$.Type.type* %.tmp5180, %m1830$.Type.type** %.tmp5179
br label %.if.end.5145
.if.false.5145:
br label %.if.end.5145
.if.end.5145:
%.tmp5181 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp5181
}
define %m1830$.AssignableInfo.type* @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stack = alloca %m1830$.StackHead.type*
store %m1830$.StackHead.type* %.stack.arg, %m1830$.StackHead.type** %stack
%.tmp5182 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5183 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5182, i32 0, i32 0
%.tmp5184 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5183
%.tmp5185 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5184, i32 0, i32 0
%.tmp5186 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5185
%.tmp5187 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5186, i32 0, i32 0
%.tmp5188 = load i8*, i8** %.tmp5187
%.tmp5190 = getelementptr [16 x i8], [16 x i8]*@.str5189, i32 0, i32 0
%.tmp5191 = call i32(i8*,i8*) @strcmp(i8* %.tmp5188, i8* %.tmp5190)
%.tmp5192 = icmp eq i32 %.tmp5191, 0
br i1 %.tmp5192, label %.if.true.5193, label %.if.false.5193
.if.true.5193:
%.tmp5194 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5195 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5196 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5195, i32 0, i32 0
%.tmp5197 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5196
%.tmp5198 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5197, i32 0, i32 0
%.tmp5199 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5198
%.tmp5200 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_mono_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5194, %m286$.Node.type* %.tmp5199)
ret %m1830$.AssignableInfo.type* %.tmp5200
br label %.if.end.5193
.if.false.5193:
br label %.if.end.5193
.if.end.5193:
%.tmp5201 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5202 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5201, i32 0, i32 0
%.tmp5203 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5202
%.tmp5204 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5203, i32 0, i32 0
%.tmp5205 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5204
%.tmp5206 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5205, i32 0, i32 6
%.tmp5207 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5206
%operator = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5207, %m286$.Node.type** %operator
%.tmp5208 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5209 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5208, i32 0, i32 0
%.tmp5210 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5211 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5210, i32 0, i32 0
%.tmp5212 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5211
%.tmp5213 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5212, i32 0, i32 1
%.tmp5214 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5213
store %m1951$.SYStack.type* %.tmp5214, %m1951$.SYStack.type** %.tmp5209
%.tmp5215 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5216 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5217 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m1830$.StackHead.type*) @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.tmp5215, %m1830$.StackHead.type* %.tmp5216)
%A = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5217, %m1830$.AssignableInfo.type** %A
%.tmp5218 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
%.tmp5219 = icmp eq %m1830$.AssignableInfo.type* %.tmp5218, null
br i1 %.tmp5219, label %.if.true.5220, label %.if.false.5220
.if.true.5220:
%.tmp5221 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
ret %m1830$.AssignableInfo.type* %.tmp5221
br label %.if.end.5220
.if.false.5220:
br label %.if.end.5220
.if.end.5220:
%.tmp5222 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5223 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5222, i32 0, i32 0
%.tmp5224 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5225 = getelementptr %m1830$.StackHead.type, %m1830$.StackHead.type* %.tmp5224, i32 0, i32 0
%.tmp5226 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5225
%.tmp5227 = getelementptr %m1951$.SYStack.type, %m1951$.SYStack.type* %.tmp5226, i32 0, i32 1
%.tmp5228 = load %m1951$.SYStack.type*, %m1951$.SYStack.type** %.tmp5227
store %m1951$.SYStack.type* %.tmp5228, %m1951$.SYStack.type** %.tmp5223
%.tmp5229 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5230 = load %m1830$.StackHead.type*, %m1830$.StackHead.type** %stack
%.tmp5231 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m1830$.StackHead.type*) @m1830$compile_assignable_stack.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m1830$.StackHead.typep(%m1830$.CompilerCtx.type* %.tmp5229, %m1830$.StackHead.type* %.tmp5230)
%B = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5231, %m1830$.AssignableInfo.type** %B
%.tmp5232 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %B
%.tmp5233 = icmp eq %m1830$.AssignableInfo.type* %.tmp5232, null
br i1 %.tmp5233, label %.if.true.5234, label %.if.false.5234
.if.true.5234:
%.tmp5235 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %B
ret %m1830$.AssignableInfo.type* %.tmp5235
br label %.if.end.5234
.if.false.5234:
br label %.if.end.5234
.if.end.5234:
%.tmp5236 = bitcast ptr null to %m286$.Node.type*
%.tmp5237 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5236)
%op_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5237, %m1830$.AssignableInfo.type** %op_info
%.tmp5238 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
%.tmp5239 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5238, i32 0, i32 3
%.tmp5240 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5241 = call %m1830$.Type.type*(%m286$.Node.type*) @m1830$operator_type.m1830$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5240)
store %m1830$.Type.type* %.tmp5241, %m1830$.Type.type** %.tmp5239
%.tmp5242 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5243 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5242, %m1830$.AssignableInfo.type* %.tmp5243)
%.tmp5244 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5245 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5244, i32 0, i32 1
%.tmp5246 = load %m0$.File.type*, %m0$.File.type** %.tmp5245
%.tmp5248 = getelementptr [19 x i8], [19 x i8]*@.str5247, i32 0, i32 0
%.tmp5249 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
%.tmp5250 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5249)
%.tmp5251 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5252 = load %m286$.Node.type*, %m286$.Node.type** %operator
%.tmp5253 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$operator_op.cp.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5251, %m286$.Node.type* %.tmp5252)
%.tmp5254 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5255 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
%.tmp5256 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5255, i32 0, i32 3
%.tmp5257 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5256
%.tmp5258 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5254, %m1830$.Type.type* %.tmp5257)
%.tmp5259 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %A
%.tmp5260 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5259)
%.tmp5261 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %B
%.tmp5262 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5261)
%.tmp5263 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5246, i8* %.tmp5248, i8* %.tmp5250, i8* %.tmp5253, i8* %.tmp5258, i8* %.tmp5260, i8* %.tmp5262)
%.tmp5264 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %op_info
ret %m1830$.AssignableInfo.type* %.tmp5264
}
define i8* @m1830$operator_op.cp.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.op.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5265 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5266 = icmp eq %m286$.Node.type* %.tmp5265, null
br i1 %.tmp5266, label %.if.true.5267, label %.if.false.5267
.if.true.5267:
%.tmp5268 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5269 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5271 = getelementptr [31 x i8], [31 x i8]*@.str5270, i32 0, i32 0
%.tmp5272 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5268, %m286$.Node.type* %.tmp5269, i8* %.tmp5271)
%.tmp5273 = call i32(i8*,...) @printf(i8* %.tmp5272)
br label %.if.end.5267
.if.false.5267:
br label %.if.end.5267
.if.end.5267:
%.tmp5274 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5275 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5274, i32 0, i32 1
%.tmp5276 = load i8*, i8** %.tmp5275
%.tmp5278 = getelementptr [2 x i8], [2 x i8]*@.str5277, i32 0, i32 0
%.tmp5279 = call i32(i8*,i8*) @strcmp(i8* %.tmp5276, i8* %.tmp5278)
%.tmp5280 = icmp eq i32 %.tmp5279, 0
br i1 %.tmp5280, label %.if.true.5281, label %.if.false.5281
.if.true.5281:
%.tmp5283 = getelementptr [4 x i8], [4 x i8]*@.str5282, i32 0, i32 0
ret i8* %.tmp5283
br label %.if.end.5281
.if.false.5281:
%.tmp5284 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5285 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5284, i32 0, i32 1
%.tmp5286 = load i8*, i8** %.tmp5285
%.tmp5288 = getelementptr [2 x i8], [2 x i8]*@.str5287, i32 0, i32 0
%.tmp5289 = call i32(i8*,i8*) @strcmp(i8* %.tmp5286, i8* %.tmp5288)
%.tmp5290 = icmp eq i32 %.tmp5289, 0
br i1 %.tmp5290, label %.if.true.5291, label %.if.false.5291
.if.true.5291:
%.tmp5293 = getelementptr [4 x i8], [4 x i8]*@.str5292, i32 0, i32 0
ret i8* %.tmp5293
br label %.if.end.5291
.if.false.5291:
%.tmp5294 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5295 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5294, i32 0, i32 1
%.tmp5296 = load i8*, i8** %.tmp5295
%.tmp5298 = getelementptr [2 x i8], [2 x i8]*@.str5297, i32 0, i32 0
%.tmp5299 = call i32(i8*,i8*) @strcmp(i8* %.tmp5296, i8* %.tmp5298)
%.tmp5300 = icmp eq i32 %.tmp5299, 0
br i1 %.tmp5300, label %.if.true.5301, label %.if.false.5301
.if.true.5301:
%.tmp5303 = getelementptr [4 x i8], [4 x i8]*@.str5302, i32 0, i32 0
ret i8* %.tmp5303
br label %.if.end.5301
.if.false.5301:
%.tmp5304 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5305 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5304, i32 0, i32 1
%.tmp5306 = load i8*, i8** %.tmp5305
%.tmp5308 = getelementptr [2 x i8], [2 x i8]*@.str5307, i32 0, i32 0
%.tmp5309 = call i32(i8*,i8*) @strcmp(i8* %.tmp5306, i8* %.tmp5308)
%.tmp5310 = icmp eq i32 %.tmp5309, 0
br i1 %.tmp5310, label %.if.true.5311, label %.if.false.5311
.if.true.5311:
%.tmp5313 = getelementptr [5 x i8], [5 x i8]*@.str5312, i32 0, i32 0
ret i8* %.tmp5313
br label %.if.end.5311
.if.false.5311:
%.tmp5314 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5315 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5314, i32 0, i32 1
%.tmp5316 = load i8*, i8** %.tmp5315
%.tmp5318 = getelementptr [3 x i8], [3 x i8]*@.str5317, i32 0, i32 0
%.tmp5319 = call i32(i8*,i8*) @strcmp(i8* %.tmp5316, i8* %.tmp5318)
%.tmp5320 = icmp eq i32 %.tmp5319, 0
br i1 %.tmp5320, label %.if.true.5321, label %.if.false.5321
.if.true.5321:
%.tmp5323 = getelementptr [8 x i8], [8 x i8]*@.str5322, i32 0, i32 0
ret i8* %.tmp5323
br label %.if.end.5321
.if.false.5321:
%.tmp5324 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5325 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5324, i32 0, i32 1
%.tmp5326 = load i8*, i8** %.tmp5325
%.tmp5328 = getelementptr [3 x i8], [3 x i8]*@.str5327, i32 0, i32 0
%.tmp5329 = call i32(i8*,i8*) @strcmp(i8* %.tmp5326, i8* %.tmp5328)
%.tmp5330 = icmp eq i32 %.tmp5329, 0
br i1 %.tmp5330, label %.if.true.5331, label %.if.false.5331
.if.true.5331:
%.tmp5333 = getelementptr [8 x i8], [8 x i8]*@.str5332, i32 0, i32 0
ret i8* %.tmp5333
br label %.if.end.5331
.if.false.5331:
%.tmp5334 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5335 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5334, i32 0, i32 1
%.tmp5336 = load i8*, i8** %.tmp5335
%.tmp5338 = getelementptr [2 x i8], [2 x i8]*@.str5337, i32 0, i32 0
%.tmp5339 = call i32(i8*,i8*) @strcmp(i8* %.tmp5336, i8* %.tmp5338)
%.tmp5340 = icmp eq i32 %.tmp5339, 0
br i1 %.tmp5340, label %.if.true.5341, label %.if.false.5341
.if.true.5341:
%.tmp5343 = getelementptr [9 x i8], [9 x i8]*@.str5342, i32 0, i32 0
ret i8* %.tmp5343
br label %.if.end.5341
.if.false.5341:
%.tmp5344 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5345 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5344, i32 0, i32 1
%.tmp5346 = load i8*, i8** %.tmp5345
%.tmp5348 = getelementptr [2 x i8], [2 x i8]*@.str5347, i32 0, i32 0
%.tmp5349 = call i32(i8*,i8*) @strcmp(i8* %.tmp5346, i8* %.tmp5348)
%.tmp5350 = icmp eq i32 %.tmp5349, 0
br i1 %.tmp5350, label %.if.true.5351, label %.if.false.5351
.if.true.5351:
%.tmp5353 = getelementptr [9 x i8], [9 x i8]*@.str5352, i32 0, i32 0
ret i8* %.tmp5353
br label %.if.end.5351
.if.false.5351:
%.tmp5354 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5355 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5354, i32 0, i32 1
%.tmp5356 = load i8*, i8** %.tmp5355
%.tmp5358 = getelementptr [2 x i8], [2 x i8]*@.str5357, i32 0, i32 0
%.tmp5359 = call i32(i8*,i8*) @strcmp(i8* %.tmp5356, i8* %.tmp5358)
%.tmp5360 = icmp eq i32 %.tmp5359, 0
br i1 %.tmp5360, label %.if.true.5361, label %.if.false.5361
.if.true.5361:
%.tmp5363 = getelementptr [4 x i8], [4 x i8]*@.str5362, i32 0, i32 0
ret i8* %.tmp5363
br label %.if.end.5361
.if.false.5361:
%.tmp5364 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5365 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5364, i32 0, i32 1
%.tmp5366 = load i8*, i8** %.tmp5365
%.tmp5368 = getelementptr [2 x i8], [2 x i8]*@.str5367, i32 0, i32 0
%.tmp5369 = call i32(i8*,i8*) @strcmp(i8* %.tmp5366, i8* %.tmp5368)
%.tmp5370 = icmp eq i32 %.tmp5369, 0
br i1 %.tmp5370, label %.if.true.5371, label %.if.false.5371
.if.true.5371:
%.tmp5373 = getelementptr [3 x i8], [3 x i8]*@.str5372, i32 0, i32 0
ret i8* %.tmp5373
br label %.if.end.5371
.if.false.5371:
%.tmp5374 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5375 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5374, i32 0, i32 1
%.tmp5376 = load i8*, i8** %.tmp5375
%.tmp5378 = getelementptr [3 x i8], [3 x i8]*@.str5377, i32 0, i32 0
%.tmp5379 = call i32(i8*,i8*) @strcmp(i8* %.tmp5376, i8* %.tmp5378)
%.tmp5380 = icmp eq i32 %.tmp5379, 0
br i1 %.tmp5380, label %.if.true.5381, label %.if.false.5381
.if.true.5381:
%.tmp5383 = getelementptr [9 x i8], [9 x i8]*@.str5382, i32 0, i32 0
ret i8* %.tmp5383
br label %.if.end.5381
.if.false.5381:
%.tmp5384 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5385 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5384, i32 0, i32 1
%.tmp5386 = load i8*, i8** %.tmp5385
%.tmp5388 = getelementptr [3 x i8], [3 x i8]*@.str5387, i32 0, i32 0
%.tmp5389 = call i32(i8*,i8*) @strcmp(i8* %.tmp5386, i8* %.tmp5388)
%.tmp5390 = icmp eq i32 %.tmp5389, 0
br i1 %.tmp5390, label %.if.true.5391, label %.if.false.5391
.if.true.5391:
%.tmp5393 = getelementptr [9 x i8], [9 x i8]*@.str5392, i32 0, i32 0
ret i8* %.tmp5393
br label %.if.end.5391
.if.false.5391:
%.tmp5394 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5395 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5397 = getelementptr [30 x i8], [30 x i8]*@.str5396, i32 0, i32 0
%.tmp5398 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5394, %m286$.Node.type* %.tmp5395, i8* %.tmp5397)
%.tmp5399 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5400 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5399, i32 0, i32 1
%.tmp5401 = load i8*, i8** %.tmp5400
%.tmp5402 = call i32(i8*,...) @printf(i8* %.tmp5398, i8* %.tmp5401)
br label %.if.end.5391
.if.end.5391:
br label %.if.end.5381
.if.end.5381:
br label %.if.end.5371
.if.end.5371:
br label %.if.end.5361
.if.end.5361:
br label %.if.end.5351
.if.end.5351:
br label %.if.end.5341
.if.end.5341:
br label %.if.end.5331
.if.end.5331:
br label %.if.end.5321
.if.end.5321:
br label %.if.end.5311
.if.end.5311:
br label %.if.end.5301
.if.end.5301:
br label %.if.end.5291
.if.end.5291:
br label %.if.end.5281
.if.end.5281:
%.tmp5404 = getelementptr [4 x i8], [4 x i8]*@.str5403, i32 0, i32 0
ret i8* %.tmp5404
}
define %m1830$.Type.type* @m1830$operator_type.m1830$.Type.typep.m286$.Node.typep(%m286$.Node.type* %.op.arg) {
%op = alloca %m286$.Node.type*
store %m286$.Node.type* %.op.arg, %m286$.Node.type** %op
%.tmp5405 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp5405, %m1830$.Type.type** %type
%.tmp5406 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5407 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5406, i32 0, i32 1
%.tmp5408 = load i8*, i8** %.tmp5407
%.tmp5410 = getelementptr [3 x i8], [3 x i8]*@.str5409, i32 0, i32 0
%.tmp5411 = call i32(i8*,i8*) @strcmp(i8* %.tmp5408, i8* %.tmp5410)
%.tmp5412 = icmp eq i32 %.tmp5411, 0
%.tmp5413 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5414 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5413, i32 0, i32 1
%.tmp5415 = load i8*, i8** %.tmp5414
%.tmp5417 = getelementptr [3 x i8], [3 x i8]*@.str5416, i32 0, i32 0
%.tmp5418 = call i32(i8*,i8*) @strcmp(i8* %.tmp5415, i8* %.tmp5417)
%.tmp5419 = icmp eq i32 %.tmp5418, 0
%.tmp5420 = or i1 %.tmp5412, %.tmp5419
%.tmp5421 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5422 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5421, i32 0, i32 1
%.tmp5423 = load i8*, i8** %.tmp5422
%.tmp5425 = getelementptr [2 x i8], [2 x i8]*@.str5424, i32 0, i32 0
%.tmp5426 = call i32(i8*,i8*) @strcmp(i8* %.tmp5423, i8* %.tmp5425)
%.tmp5427 = icmp eq i32 %.tmp5426, 0
%.tmp5428 = or i1 %.tmp5420, %.tmp5427
%.tmp5429 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5430 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5429, i32 0, i32 1
%.tmp5431 = load i8*, i8** %.tmp5430
%.tmp5433 = getelementptr [2 x i8], [2 x i8]*@.str5432, i32 0, i32 0
%.tmp5434 = call i32(i8*,i8*) @strcmp(i8* %.tmp5431, i8* %.tmp5433)
%.tmp5435 = icmp eq i32 %.tmp5434, 0
%.tmp5436 = or i1 %.tmp5428, %.tmp5435
%.tmp5437 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5438 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5437, i32 0, i32 1
%.tmp5439 = load i8*, i8** %.tmp5438
%.tmp5441 = getelementptr [2 x i8], [2 x i8]*@.str5440, i32 0, i32 0
%.tmp5442 = call i32(i8*,i8*) @strcmp(i8* %.tmp5439, i8* %.tmp5441)
%.tmp5443 = icmp eq i32 %.tmp5442, 0
%.tmp5444 = or i1 %.tmp5436, %.tmp5443
%.tmp5445 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5446 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5445, i32 0, i32 1
%.tmp5447 = load i8*, i8** %.tmp5446
%.tmp5449 = getelementptr [2 x i8], [2 x i8]*@.str5448, i32 0, i32 0
%.tmp5450 = call i32(i8*,i8*) @strcmp(i8* %.tmp5447, i8* %.tmp5449)
%.tmp5451 = icmp eq i32 %.tmp5450, 0
%.tmp5452 = or i1 %.tmp5444, %.tmp5451
%.tmp5453 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5454 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5453, i32 0, i32 1
%.tmp5455 = load i8*, i8** %.tmp5454
%.tmp5457 = getelementptr [3 x i8], [3 x i8]*@.str5456, i32 0, i32 0
%.tmp5458 = call i32(i8*,i8*) @strcmp(i8* %.tmp5455, i8* %.tmp5457)
%.tmp5459 = icmp eq i32 %.tmp5458, 0
%.tmp5460 = or i1 %.tmp5452, %.tmp5459
%.tmp5461 = load %m286$.Node.type*, %m286$.Node.type** %op
%.tmp5462 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5461, i32 0, i32 1
%.tmp5463 = load i8*, i8** %.tmp5462
%.tmp5465 = getelementptr [3 x i8], [3 x i8]*@.str5464, i32 0, i32 0
%.tmp5466 = call i32(i8*,i8*) @strcmp(i8* %.tmp5463, i8* %.tmp5465)
%.tmp5467 = icmp eq i32 %.tmp5466, 0
%.tmp5468 = or i1 %.tmp5460, %.tmp5467
br i1 %.tmp5468, label %.if.true.5469, label %.if.false.5469
.if.true.5469:
%.tmp5470 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5471 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5470, i32 0, i32 0
%.tmp5473 = getelementptr [5 x i8], [5 x i8]*@.str5472, i32 0, i32 0
store i8* %.tmp5473, i8** %.tmp5471
br label %.if.end.5469
.if.false.5469:
%.tmp5474 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5475 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5474, i32 0, i32 0
%.tmp5477 = getelementptr [4 x i8], [4 x i8]*@.str5476, i32 0, i32 0
store i8* %.tmp5477, i8** %.tmp5475
br label %.if.end.5469
.if.end.5469:
%.tmp5478 = load %m1830$.Type.type*, %m1830$.Type.type** %type
ret %m1830$.Type.type* %.tmp5478
}
define %m1830$.AssignableInfo.type* @m1830$compile_mono_assignable.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%curr_node = alloca %m286$.Node.type*
store %m286$.Node.type* %.curr_node.arg, %m286$.Node.type** %curr_node
%.tmp5479 = bitcast ptr null to %m1830$.AssignableInfo.type*
%assignable_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5479, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5480 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%mono = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5480, %m286$.Node.type** %mono
%err_buf = alloca i8*
%buf = alloca i8*
%.tmp5481 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5482 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5481, i32 0, i32 6
%.tmp5483 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5482
%.tmp5484 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5483, i32 0, i32 0
%.tmp5485 = load i8*, i8** %.tmp5484
%.tmp5487 = getelementptr [7 x i8], [7 x i8]*@.str5486, i32 0, i32 0
%.tmp5488 = call i32(i8*,i8*) @strcmp(i8* %.tmp5485, i8* %.tmp5487)
%.tmp5489 = icmp eq i32 %.tmp5488, 0
br i1 %.tmp5489, label %.if.true.5490, label %.if.false.5490
.if.true.5490:
%.tmp5491 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5492 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5491)
store %m1830$.AssignableInfo.type* %.tmp5492, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5493 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5494 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5493, i32 0, i32 3
%.tmp5495 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5495, %m1830$.Type.type** %.tmp5494
%.tmp5496 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5497 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5496, i32 0, i32 3
%.tmp5498 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5497
%.tmp5499 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5498, i32 0, i32 0
%.tmp5501 = getelementptr [4 x i8], [4 x i8]*@.str5500, i32 0, i32 0
store i8* %.tmp5501, i8** %.tmp5499
%.tmp5502 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5503 = load i8, i8* @SCOPE_CONST
%.tmp5504 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5505 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5504, i32 0, i32 6
%.tmp5506 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5505
%.tmp5507 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5506, i32 0, i32 1
%.tmp5508 = load i8*, i8** %.tmp5507
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5502, i8 %.tmp5503, i8* %.tmp5508)
br label %.if.end.5490
.if.false.5490:
%.tmp5509 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5510 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5509, i32 0, i32 6
%.tmp5511 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5510
%.tmp5512 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5511, i32 0, i32 0
%.tmp5513 = load i8*, i8** %.tmp5512
%.tmp5515 = getelementptr [5 x i8], [5 x i8]*@.str5514, i32 0, i32 0
%.tmp5516 = call i32(i8*,i8*) @strcmp(i8* %.tmp5513, i8* %.tmp5515)
%.tmp5517 = icmp eq i32 %.tmp5516, 0
br i1 %.tmp5517, label %.if.true.5518, label %.if.false.5518
.if.true.5518:
%.tmp5519 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5520 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5519, i32 0, i32 6
%.tmp5521 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5520
%.tmp5522 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5521, i32 0, i32 1
%.tmp5523 = load i8*, i8** %.tmp5522
%.tmp5525 = getelementptr [5 x i8], [5 x i8]*@.str5524, i32 0, i32 0
%.tmp5526 = call i32(i8*,i8*) @strcmp(i8* %.tmp5523, i8* %.tmp5525)
%.tmp5527 = icmp ne i32 %.tmp5526, 0
br i1 %.tmp5527, label %.if.true.5528, label %.if.false.5528
.if.true.5528:
%.tmp5529 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5530 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5532 = getelementptr [42 x i8], [42 x i8]*@.str5531, i32 0, i32 0
%.tmp5533 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5529, %m286$.Node.type* %.tmp5530, i8* %.tmp5532)
%.tmp5534 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5535 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5534, i32 0, i32 6
%.tmp5536 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5535
%.tmp5537 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5536, i32 0, i32 1
%.tmp5538 = load i8*, i8** %.tmp5537
%.tmp5539 = call i32(i8*,...) @printf(i8* %.tmp5533, i8* %.tmp5538)
%.tmp5540 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5540
br label %.if.end.5528
.if.false.5528:
br label %.if.end.5528
.if.end.5528:
%.tmp5541 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5542 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5541)
store %m1830$.AssignableInfo.type* %.tmp5542, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5543 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5544 = load i8, i8* @SCOPE_CONST
%.tmp5546 = getelementptr [5 x i8], [5 x i8]*@.str5545, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5543, i8 %.tmp5544, i8* %.tmp5546)
%.tmp5547 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5548 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5547, i32 0, i32 3
%.tmp5549 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5549, %m1830$.Type.type** %.tmp5548
%.tmp5550 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5551 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5550, i32 0, i32 3
%.tmp5552 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5551
%.tmp5553 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5552, i32 0, i32 0
%.tmp5555 = getelementptr [8 x i8], [8 x i8]*@.str5554, i32 0, i32 0
store i8* %.tmp5555, i8** %.tmp5553
br label %.if.end.5518
.if.false.5518:
%.tmp5556 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5557 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5556, i32 0, i32 6
%.tmp5558 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5557
%.tmp5559 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5558, i32 0, i32 0
%.tmp5560 = load i8*, i8** %.tmp5559
%.tmp5562 = getelementptr [17 x i8], [17 x i8]*@.str5561, i32 0, i32 0
%.tmp5563 = call i32(i8*,i8*) @strcmp(i8* %.tmp5560, i8* %.tmp5562)
%.tmp5564 = icmp eq i32 %.tmp5563, 0
br i1 %.tmp5564, label %.if.true.5565, label %.if.false.5565
.if.true.5565:
%.tmp5566 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5567 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5566)
store %m1830$.AssignableInfo.type* %.tmp5567, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5568 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5569 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5568, i32 0, i32 6
%.tmp5570 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5569
%.tmp5571 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5570, i32 0, i32 6
%.tmp5572 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5571
%.tmp5574 = getelementptr [12 x i8], [12 x i8]*@.str5573, i32 0, i32 0
%.tmp5575 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp5572, i8* %.tmp5574)
%dest = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5575, %m286$.Node.type** %dest
%.tmp5576 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5577 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5578 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_addr.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5576, %m286$.Node.type* %.tmp5577)
%var_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5578, %m1830$.AssignableInfo.type** %var_info
%.tmp5579 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5580 = icmp eq %m1830$.AssignableInfo.type* %.tmp5579, null
br i1 %.tmp5580, label %.if.true.5581, label %.if.false.5581
.if.true.5581:
%.tmp5582 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
ret %m1830$.AssignableInfo.type* %.tmp5582
br label %.if.end.5581
.if.false.5581:
br label %.if.end.5581
.if.end.5581:
%.tmp5583 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5584 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5585 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5584, i32 0, i32 3
%.tmp5586 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5585
%.tmp5587 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5583, %m1830$.Type.type* %.tmp5586)
%var_type_repr = alloca i8*
store i8* %.tmp5587, i8** %var_type_repr
%.tmp5588 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5589 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5588, %m1830$.AssignableInfo.type* %.tmp5589)
%.tmp5590 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5591 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5590, i32 0, i32 3
%.tmp5592 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5593 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5592, i32 0, i32 3
%.tmp5594 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5593
store %m1830$.Type.type* %.tmp5594, %m1830$.Type.type** %.tmp5591
%.tmp5596 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5597 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5596, i32 0, i32 6
%.tmp5598 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5597
%.tmp5599 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5598, i32 0, i32 6
%.tmp5600 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5599
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp5600, %m286$.Node.type** %ptr
br label %.for.start.5595
.for.start.5595:
%.tmp5601 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5602 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5603 = icmp ne %m286$.Node.type* %.tmp5601, %.tmp5602
br i1 %.tmp5603, label %.for.continue.5595, label %.for.end.5595
.for.continue.5595:
%.tmp5604 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp5604, %m1830$.Type.type** %type
%.tmp5605 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5606 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5605, i32 0, i32 3
%.tmp5607 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5608 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5607, i32 0, i32 3
%.tmp5609 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5608
store %m1830$.Type.type* %.tmp5609, %m1830$.Type.type** %.tmp5606
%.tmp5610 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5611 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5610, i32 0, i32 0
%.tmp5613 = getelementptr [4 x i8], [4 x i8]*@.str5612, i32 0, i32 0
store i8* %.tmp5613, i8** %.tmp5611
%.tmp5614 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5615 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5614, i32 0, i32 3
%.tmp5616 = load %m1830$.Type.type*, %m1830$.Type.type** %type
store %m1830$.Type.type* %.tmp5616, %m1830$.Type.type** %.tmp5615
%.tmp5617 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp5618 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5617, i32 0, i32 7
%.tmp5619 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5618
store %m286$.Node.type* %.tmp5619, %m286$.Node.type** %ptr
br label %.for.start.5595
.for.end.5595:
%.tmp5620 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5621 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5620, i32 0, i32 6
%.tmp5622 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5621
%.tmp5623 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5622, i32 0, i32 6
%.tmp5624 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5623
%.tmp5625 = load %m286$.Node.type*, %m286$.Node.type** %dest
%.tmp5626 = icmp ne %m286$.Node.type* %.tmp5624, %.tmp5625
br i1 %.tmp5626, label %.if.true.5627, label %.if.false.5627
.if.true.5627:
%.tmp5628 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5629 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5628, i32 0, i32 1
%.tmp5630 = load %m0$.File.type*, %m0$.File.type** %.tmp5629
%.tmp5632 = getelementptr [38 x i8], [38 x i8]*@.str5631, i32 0, i32 0
%.tmp5633 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5634 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5633)
%.tmp5635 = load i8*, i8** %var_type_repr
%.tmp5636 = load i8*, i8** %var_type_repr
%.tmp5637 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5638 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5637)
%.tmp5639 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5630, i8* %.tmp5632, i8* %.tmp5634, i8* %.tmp5635, i8* %.tmp5636, i8* %.tmp5638)
br label %.if.end.5627
.if.false.5627:
%.tmp5640 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5641 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5640, i32 0, i32 1
%.tmp5642 = load %m0$.File.type*, %m0$.File.type** %.tmp5641
%.tmp5644 = getelementptr [22 x i8], [22 x i8]*@.str5643, i32 0, i32 0
%.tmp5645 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5646 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5645)
%.tmp5647 = load i8*, i8** %var_type_repr
%.tmp5648 = load i8*, i8** %var_type_repr
%.tmp5649 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %var_info
%.tmp5650 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5649)
%.tmp5651 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5642, i8* %.tmp5644, i8* %.tmp5646, i8* %.tmp5647, i8* %.tmp5648, i8* %.tmp5650)
br label %.if.end.5627
.if.end.5627:
br label %.if.end.5565
.if.false.5565:
%.tmp5652 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5653 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5652, i32 0, i32 6
%.tmp5654 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5653
%.tmp5655 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5654, i32 0, i32 0
%.tmp5656 = load i8*, i8** %.tmp5655
%.tmp5658 = getelementptr [8 x i8], [8 x i8]*@.str5657, i32 0, i32 0
%.tmp5659 = call i32(i8*,i8*) @strcmp(i8* %.tmp5656, i8* %.tmp5658)
%.tmp5660 = icmp eq i32 %.tmp5659, 0
br i1 %.tmp5660, label %.if.true.5661, label %.if.false.5661
.if.true.5661:
%.tmp5662 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5663 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5662)
store %m1830$.AssignableInfo.type* %.tmp5663, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5664 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5665 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5664, i32 0, i32 3
%.tmp5666 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5666, %m1830$.Type.type** %.tmp5665
%.tmp5667 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5668 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5667, i32 0, i32 3
%.tmp5669 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5668
%.tmp5670 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5669, i32 0, i32 0
%.tmp5672 = getelementptr [5 x i8], [5 x i8]*@.str5671, i32 0, i32 0
store i8* %.tmp5672, i8** %.tmp5670
%.tmp5673 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5674 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5673, i32 0, i32 6
%.tmp5675 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5674
%.tmp5676 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5675, i32 0, i32 6
%.tmp5677 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5676
%.tmp5678 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5677, i32 0, i32 1
%.tmp5679 = load i8*, i8** %.tmp5678
%.tmp5681 = getelementptr [6 x i8], [6 x i8]*@.str5680, i32 0, i32 0
%.tmp5682 = call i32(i8*,i8*) @strcmp(i8* %.tmp5679, i8* %.tmp5681)
%.tmp5683 = icmp eq i32 %.tmp5682, 0
br i1 %.tmp5683, label %.if.true.5684, label %.if.false.5684
.if.true.5684:
%.tmp5685 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5686 = load i8, i8* @SCOPE_CONST
%.tmp5688 = getelementptr [2 x i8], [2 x i8]*@.str5687, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5685, i8 %.tmp5686, i8* %.tmp5688)
br label %.if.end.5684
.if.false.5684:
%.tmp5689 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5690 = load i8, i8* @SCOPE_CONST
%.tmp5692 = getelementptr [2 x i8], [2 x i8]*@.str5691, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5689, i8 %.tmp5690, i8* %.tmp5692)
br label %.if.end.5684
.if.end.5684:
br label %.if.end.5661
.if.false.5661:
%.tmp5693 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5694 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5693, i32 0, i32 6
%.tmp5695 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5694
%.tmp5696 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5695, i32 0, i32 0
%.tmp5697 = load i8*, i8** %.tmp5696
%.tmp5699 = getelementptr [8 x i8], [8 x i8]*@.str5698, i32 0, i32 0
%.tmp5700 = call i32(i8*,i8*) @strcmp(i8* %.tmp5697, i8* %.tmp5699)
%.tmp5701 = icmp eq i32 %.tmp5700, 0
br i1 %.tmp5701, label %.if.true.5702, label %.if.false.5702
.if.true.5702:
%.tmp5703 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5704 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5705 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5704, i32 0, i32 6
%.tmp5706 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5705
%.tmp5707 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5706, i32 0, i32 6
%.tmp5708 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5707
%.tmp5709 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$compile_fn_call.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp5703, %m286$.Node.type* %.tmp5708)
store %m1830$.AssignableInfo.type* %.tmp5709, %m1830$.AssignableInfo.type** %assignable_info
br label %.if.end.5702
.if.false.5702:
%.tmp5710 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5711 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5710, i32 0, i32 6
%.tmp5712 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5711
%.tmp5713 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5712, i32 0, i32 0
%.tmp5714 = load i8*, i8** %.tmp5713
%.tmp5716 = getelementptr [7 x i8], [7 x i8]*@.str5715, i32 0, i32 0
%.tmp5717 = call i32(i8*,i8*) @strcmp(i8* %.tmp5714, i8* %.tmp5716)
%.tmp5718 = icmp eq i32 %.tmp5717, 0
br i1 %.tmp5718, label %.if.true.5719, label %.if.false.5719
.if.true.5719:
%.tmp5720 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5721 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5722 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5721, i32 0, i32 6
%.tmp5723 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5722
%.tmp5724 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5723, i32 0, i32 1
%.tmp5725 = load i8*, i8** %.tmp5724
%.tmp5726 = call %m1830$.AssignableInfo.type*(%m1830$.CompilerCtx.type*,i8*) @m1830$define_string.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp5720, i8* %.tmp5725)
%string_info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5726, %m1830$.AssignableInfo.type** %string_info
%.tmp5727 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5728 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5727)
store %m1830$.AssignableInfo.type* %.tmp5728, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5729 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5730 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
call void(%m1830$.CompilerCtx.type*,%m1830$.AssignableInfo.type*) @m1830$set_assignable_tmp_id.v.m1830$.CompilerCtx.typep.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp5729, %m1830$.AssignableInfo.type* %.tmp5730)
%.tmp5731 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5732 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %string_info
%.tmp5733 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5732, i32 0, i32 3
%.tmp5734 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5733
%.tmp5735 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp5731, %m1830$.Type.type* %.tmp5734)
%str_tr = alloca i8*
store i8* %.tmp5735, i8** %str_tr
%.tmp5736 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5737 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp5736, i32 0, i32 1
%.tmp5738 = load %m0$.File.type*, %m0$.File.type** %.tmp5737
%.tmp5740 = getelementptr [44 x i8], [44 x i8]*@.str5739, i32 0, i32 0
%.tmp5741 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5742 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5741)
%.tmp5743 = load i8*, i8** %str_tr
%.tmp5744 = load i8*, i8** %str_tr
%.tmp5745 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %string_info
%.tmp5746 = call i8*(%m1830$.AssignableInfo.type*) @m1830$repr_assignable_id.cp.m1830$.AssignableInfo.typep(%m1830$.AssignableInfo.type* %.tmp5745)
%.tmp5747 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5738, i8* %.tmp5740, i8* %.tmp5742, i8* %.tmp5743, i8* %.tmp5744, i8* %.tmp5746)
%.tmp5748 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5749 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5748, i32 0, i32 3
%.tmp5750 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5750, %m1830$.Type.type** %.tmp5749
%.tmp5751 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5752 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5751, i32 0, i32 3
%.tmp5753 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5752
%.tmp5754 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5753, i32 0, i32 0
%.tmp5756 = getelementptr [4 x i8], [4 x i8]*@.str5755, i32 0, i32 0
store i8* %.tmp5756, i8** %.tmp5754
%.tmp5757 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5758 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5757, i32 0, i32 3
%.tmp5759 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5758
%.tmp5760 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5759, i32 0, i32 3
%.tmp5761 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5761, %m1830$.Type.type** %.tmp5760
%.tmp5762 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5763 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5762, i32 0, i32 3
%.tmp5764 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5763
%.tmp5765 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5764, i32 0, i32 3
%.tmp5766 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5765
%.tmp5767 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5766, i32 0, i32 0
%.tmp5769 = getelementptr [4 x i8], [4 x i8]*@.str5768, i32 0, i32 0
store i8* %.tmp5769, i8** %.tmp5767
br label %.if.end.5719
.if.false.5719:
%.tmp5770 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5771 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5770, i32 0, i32 6
%.tmp5772 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5771
%.tmp5773 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5772, i32 0, i32 0
%.tmp5774 = load i8*, i8** %.tmp5773
%.tmp5776 = getelementptr [4 x i8], [4 x i8]*@.str5775, i32 0, i32 0
%.tmp5777 = call i32(i8*,i8*) @strcmp(i8* %.tmp5774, i8* %.tmp5776)
%.tmp5778 = icmp eq i32 %.tmp5777, 0
br i1 %.tmp5778, label %.if.true.5779, label %.if.false.5779
.if.true.5779:
%.tmp5780 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5781 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5780)
store %m1830$.AssignableInfo.type* %.tmp5781, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5782 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5783 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5782, i32 0, i32 6
%.tmp5784 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5783
%.tmp5785 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5784, i32 0, i32 1
%.tmp5786 = load i8*, i8** %.tmp5785
%.tmp5787 = call i32(i8*) @strlen(i8* %.tmp5786)
%chr_len = alloca i32
store i32 %.tmp5787, i32* %chr_len
%.tmp5788 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5789 = load i8, i8* @SCOPE_CONST
%.tmp5791 = getelementptr [2 x i8], [2 x i8]*@.str5790, i32 0, i32 0
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5788, i8 %.tmp5789, i8* %.tmp5791)
%intval = alloca i32
store i32 0, i32* %intval
%.tmp5792 = load i32, i32* %chr_len
%.tmp5793 = icmp eq i32 %.tmp5792, 5
br i1 %.tmp5793, label %.if.true.5794, label %.if.false.5794
.if.true.5794:
%.tmp5795 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5796 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5795, i32 0, i32 6
%.tmp5797 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5796
%.tmp5798 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5797, i32 0, i32 1
%.tmp5799 = load i8*, i8** %.tmp5798
%.tmp5801 = getelementptr [6 x i8], [6 x i8]*@.str5800, i32 0, i32 0
%.tmp5802 = getelementptr i32, i32* %intval, i32 0
%.tmp5803 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5799, i8* %.tmp5801, i32* %.tmp5802)
%.tmp5804 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5805 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5804, i32 0, i32 0
%.tmp5806 = getelementptr i8*, i8** %.tmp5805, i32 0
%.tmp5808 = getelementptr [3 x i8], [3 x i8]*@.str5807, i32 0, i32 0
%.tmp5809 = load i32, i32* %intval
%.tmp5810 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5806, i8* %.tmp5808, i32 %.tmp5809)
br label %.if.end.5794
.if.false.5794:
%.tmp5811 = load i32, i32* %chr_len
%.tmp5812 = icmp eq i32 %.tmp5811, 3
br i1 %.tmp5812, label %.if.true.5813, label %.if.false.5813
.if.true.5813:
%.tmp5814 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5815 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5814, i32 0, i32 6
%.tmp5816 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5815
%.tmp5817 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5816, i32 0, i32 1
%.tmp5818 = load i8*, i8** %.tmp5817
%.tmp5820 = getelementptr [5 x i8], [5 x i8]*@.str5819, i32 0, i32 0
%.tmp5821 = getelementptr i32, i32* %intval, i32 0
%.tmp5822 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5818, i8* %.tmp5820, i32* %.tmp5821)
%.tmp5823 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5824 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5823, i32 0, i32 0
%.tmp5825 = getelementptr i8*, i8** %.tmp5824, i32 0
%.tmp5827 = getelementptr [3 x i8], [3 x i8]*@.str5826, i32 0, i32 0
%.tmp5828 = load i32, i32* %intval
%.tmp5829 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5825, i8* %.tmp5827, i32 %.tmp5828)
br label %.if.end.5813
.if.false.5813:
%.tmp5830 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp5832 = getelementptr [18 x i8], [18 x i8]*@.str5831, i32 0, i32 0
%.tmp5833 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5830, i8* %.tmp5832)
%.tmp5834 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5835 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5836 = load i8*, i8** %err_buf
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5834, %m286$.Node.type* %.tmp5835, i8* %.tmp5836)
br label %.if.end.5813
.if.end.5813:
br label %.if.end.5794
.if.end.5794:
%.tmp5837 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5838 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5837, i32 0, i32 3
%.tmp5839 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp5839, %m1830$.Type.type** %.tmp5838
%.tmp5840 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5841 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5840, i32 0, i32 3
%.tmp5842 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5841
%.tmp5843 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5842, i32 0, i32 0
%.tmp5845 = getelementptr [4 x i8], [4 x i8]*@.str5844, i32 0, i32 0
store i8* %.tmp5845, i8** %.tmp5843
br label %.if.end.5779
.if.false.5779:
%.tmp5846 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5847 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5849 = getelementptr [40 x i8], [40 x i8]*@.str5848, i32 0, i32 0
%.tmp5850 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp5846, %m286$.Node.type* %.tmp5847, i8* %.tmp5849)
%.tmp5851 = load %m286$.Node.type*, %m286$.Node.type** %mono
%.tmp5852 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5851, i32 0, i32 6
%.tmp5853 = load %m286$.Node.type*, %m286$.Node.type** %.tmp5852
%.tmp5854 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5853, i32 0, i32 0
%.tmp5855 = load i8*, i8** %.tmp5854
%.tmp5856 = call i32(i8*,...) @printf(i8* %.tmp5850, i8* %.tmp5855)
%.tmp5857 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5857
br label %.if.end.5779
.if.end.5779:
br label %.if.end.5719
.if.end.5719:
br label %.if.end.5702
.if.end.5702:
br label %.if.end.5661
.if.end.5661:
br label %.if.end.5565
.if.end.5565:
br label %.if.end.5518
.if.end.5518:
br label %.if.end.5490
.if.end.5490:
%.tmp5858 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5859 = icmp eq %m1830$.AssignableInfo.type* %.tmp5858, null
br i1 %.tmp5859, label %.if.true.5860, label %.if.false.5860
.if.true.5860:
%.tmp5861 = bitcast ptr null to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5861
br label %.if.end.5860
.if.false.5860:
br label %.if.end.5860
.if.end.5860:
%.tmp5862 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5863 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5862, i32 0, i32 4
%.tmp5864 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5865 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5864, i32 0, i32 3
%.tmp5866 = load i32, i32* %.tmp5865
store i32 %.tmp5866, i32* %.tmp5863
%.tmp5867 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5868 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5867, i32 0, i32 5
%.tmp5869 = load %m286$.Node.type*, %m286$.Node.type** %curr_node
%.tmp5870 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp5869, i32 0, i32 4
%.tmp5871 = load i32, i32* %.tmp5870
store i32 %.tmp5871, i32* %.tmp5868
%.tmp5872 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %assignable_info
%.tmp5873 = bitcast %m1830$.AssignableInfo.type* %.tmp5872 to %m1830$.AssignableInfo.type*
ret %m1830$.AssignableInfo.type* %.tmp5873
}
define i8* @m1830$type_abbr.cp.m1830$.Type.typep(%m1830$.Type.type* %.type.arg) {
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.type.arg, %m1830$.Type.type** %type
%.tmp5874 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5875 = icmp ne %m1830$.Type.type* %.tmp5874, null
%.tmp5877 = getelementptr [22 x i8], [22 x i8]*@.str5876, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5875, i8* %.tmp5877)
%.tmp5878 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5879 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5878, i32 0, i32 0
%.tmp5880 = load i8*, i8** %.tmp5879
%.tmp5881 = icmp ne i8* %.tmp5880, null
%.tmp5883 = getelementptr [59 x i8], [59 x i8]*@.str5882, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5881, i8* %.tmp5883)
%.tmp5884 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5885 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5884, i32 0, i32 0
%.tmp5886 = load i8*, i8** %.tmp5885
%.tmp5888 = getelementptr [4 x i8], [4 x i8]*@.str5887, i32 0, i32 0
%.tmp5889 = call i32(i8*,i8*) @strcmp(i8* %.tmp5886, i8* %.tmp5888)
%.tmp5890 = icmp eq i32 %.tmp5889, 0
br i1 %.tmp5890, label %.if.true.5891, label %.if.false.5891
.if.true.5891:
%.tmp5893 = getelementptr [2 x i8], [2 x i8]*@.str5892, i32 0, i32 0
ret i8* %.tmp5893
br label %.if.end.5891
.if.false.5891:
%.tmp5894 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5895 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5894, i32 0, i32 0
%.tmp5896 = load i8*, i8** %.tmp5895
%.tmp5898 = getelementptr [5 x i8], [5 x i8]*@.str5897, i32 0, i32 0
%.tmp5899 = call i32(i8*,i8*) @strcmp(i8* %.tmp5896, i8* %.tmp5898)
%.tmp5900 = icmp eq i32 %.tmp5899, 0
br i1 %.tmp5900, label %.if.true.5901, label %.if.false.5901
.if.true.5901:
%.tmp5903 = getelementptr [2 x i8], [2 x i8]*@.str5902, i32 0, i32 0
ret i8* %.tmp5903
br label %.if.end.5901
.if.false.5901:
%.tmp5904 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5905 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5904, i32 0, i32 0
%.tmp5906 = load i8*, i8** %.tmp5905
%.tmp5908 = getelementptr [5 x i8], [5 x i8]*@.str5907, i32 0, i32 0
%.tmp5909 = call i32(i8*,i8*) @strcmp(i8* %.tmp5906, i8* %.tmp5908)
%.tmp5910 = icmp eq i32 %.tmp5909, 0
br i1 %.tmp5910, label %.if.true.5911, label %.if.false.5911
.if.true.5911:
%.tmp5913 = getelementptr [2 x i8], [2 x i8]*@.str5912, i32 0, i32 0
ret i8* %.tmp5913
br label %.if.end.5911
.if.false.5911:
%.tmp5914 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5915 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5914, i32 0, i32 0
%.tmp5916 = load i8*, i8** %.tmp5915
%.tmp5918 = getelementptr [4 x i8], [4 x i8]*@.str5917, i32 0, i32 0
%.tmp5919 = call i32(i8*,i8*) @strcmp(i8* %.tmp5916, i8* %.tmp5918)
%.tmp5920 = icmp eq i32 %.tmp5919, 0
br i1 %.tmp5920, label %.if.true.5921, label %.if.false.5921
.if.true.5921:
%.tmp5923 = getelementptr [2 x i8], [2 x i8]*@.str5922, i32 0, i32 0
ret i8* %.tmp5923
br label %.if.end.5921
.if.false.5921:
%.tmp5924 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5925 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5924, i32 0, i32 0
%.tmp5926 = load i8*, i8** %.tmp5925
%.tmp5928 = getelementptr [4 x i8], [4 x i8]*@.str5927, i32 0, i32 0
%.tmp5929 = call i32(i8*,i8*) @strcmp(i8* %.tmp5926, i8* %.tmp5928)
%.tmp5930 = icmp eq i32 %.tmp5929, 0
br i1 %.tmp5930, label %.if.true.5931, label %.if.false.5931
.if.true.5931:
%.tmp5933 = getelementptr [3 x i8], [3 x i8]*@.str5932, i32 0, i32 0
ret i8* %.tmp5933
br label %.if.end.5931
.if.false.5931:
%.tmp5934 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5935 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5934, i32 0, i32 0
%.tmp5936 = load i8*, i8** %.tmp5935
%.tmp5938 = getelementptr [4 x i8], [4 x i8]*@.str5937, i32 0, i32 0
%.tmp5939 = call i32(i8*,i8*) @strcmp(i8* %.tmp5936, i8* %.tmp5938)
%.tmp5940 = icmp eq i32 %.tmp5939, 0
br i1 %.tmp5940, label %.if.true.5941, label %.if.false.5941
.if.true.5941:
%buf = alloca i8*
%.tmp5942 = getelementptr i8*, i8** %buf, i32 0
%.tmp5944 = getelementptr [4 x i8], [4 x i8]*@.str5943, i32 0, i32 0
%.tmp5945 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5946 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5945, i32 0, i32 3
%.tmp5947 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp5946
%.tmp5948 = call i8*(%m1830$.Type.type*) @m1830$type_abbr.cp.m1830$.Type.typep(%m1830$.Type.type* %.tmp5947)
%.tmp5949 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5942, i8* %.tmp5944, i8* %.tmp5948)
%.tmp5950 = load i8*, i8** %buf
ret i8* %.tmp5950
br label %.if.end.5941
.if.false.5941:
%.tmp5951 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5952 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5951, i32 0, i32 0
%.tmp5953 = load i8*, i8** %.tmp5952
%.tmp5955 = getelementptr [10 x i8], [10 x i8]*@.str5954, i32 0, i32 0
%.tmp5956 = call i32(i8*,i8*) @strcmp(i8* %.tmp5953, i8* %.tmp5955)
%.tmp5957 = icmp eq i32 %.tmp5956, 0
br i1 %.tmp5957, label %.if.true.5958, label %.if.false.5958
.if.true.5958:
%.tmp5959 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5960 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5959, i32 0, i32 2
%.tmp5961 = load i8*, i8** %.tmp5960
ret i8* %.tmp5961
br label %.if.end.5958
.if.false.5958:
%.tmp5962 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5963 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5962, i32 0, i32 0
%.tmp5964 = load i8*, i8** %.tmp5963
%.tmp5966 = getelementptr [6 x i8], [6 x i8]*@.str5965, i32 0, i32 0
%.tmp5967 = call i32(i8*,i8*) @strcmp(i8* %.tmp5964, i8* %.tmp5966)
%.tmp5968 = icmp eq i32 %.tmp5967, 0
br i1 %.tmp5968, label %.if.true.5969, label %.if.false.5969
.if.true.5969:
%.tmp5971 = getelementptr [2 x i8], [2 x i8]*@.str5970, i32 0, i32 0
ret i8* %.tmp5971
br label %.if.end.5969
.if.false.5969:
%.tmp5973 = getelementptr [44 x i8], [44 x i8]*@.str5972, i32 0, i32 0
%.tmp5974 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp5975 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp5974, i32 0, i32 0
%.tmp5976 = load i8*, i8** %.tmp5975
%.tmp5977 = call i32(i8*,...) @printf(i8* %.tmp5973, i8* %.tmp5976)
br label %.if.end.5969
.if.end.5969:
br label %.if.end.5958
.if.end.5958:
br label %.if.end.5941
.if.end.5941:
br label %.if.end.5931
.if.end.5931:
br label %.if.end.5921
.if.end.5921:
br label %.if.end.5911
.if.end.5911:
br label %.if.end.5901
.if.end.5901:
br label %.if.end.5891
.if.end.5891:
%.tmp5978 = bitcast ptr null to i8*
ret i8* %.tmp5978
}
define %m1830$.AssignableInfo.type* @m1830$define_string.m1830$.AssignableInfo.typep.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp5979 = bitcast ptr null to %m286$.Node.type*
%.tmp5980 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp5979)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp5980, %m1830$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp5981 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp5983 = getelementptr [7 x i8], [7 x i8]*@.str5982, i32 0, i32 0
%.tmp5984 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp5985 = call i32(%m1830$.CompilerCtx.type*) @m1830$new_uid.i.m1830$.CompilerCtx.typep(%m1830$.CompilerCtx.type* %.tmp5984)
%.tmp5986 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5981, i8* %.tmp5983, i32 %.tmp5985)
%.tmp5987 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5988 = load i8, i8* @SCOPE_GLOBAL
%.tmp5989 = load i8*, i8** %tmp_buff
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp5987, i8 %.tmp5988, i8* %.tmp5989)
%.tmp5990 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* null, i32 1
%.tmp5991 = ptrtoint %m1830$.GlobalName.type* %.tmp5990 to i32
%.tmp5992 = call i8*(i32) @malloc(i32 %.tmp5991)
%.tmp5993 = bitcast i8* %.tmp5992 to %m1830$.GlobalName.type*
%global = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.tmp5993, %m1830$.GlobalName.type** %global
%.tmp5994 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp5995 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp5994, i32 0, i32 0
%.tmp5996 = load i8*, i8** %text
%.tmp5997 = call i8*(i8*) @m2176$string_to_llvm.cp.cp(i8* %.tmp5996)
store i8* %.tmp5997, i8** %.tmp5995
%.tmp5998 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp5999 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp5998, i32 0, i32 3
%.tmp6000 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp6000, %m1830$.Type.type** %.tmp5999
%.tmp6001 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6002 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6001, i32 0, i32 3
%.tmp6003 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6002
%.tmp6004 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6003, i32 0, i32 0
%.tmp6006 = getelementptr [6 x i8], [6 x i8]*@.str6005, i32 0, i32 0
store i8* %.tmp6006, i8** %.tmp6004
%.tmp6007 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6008 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6007, i32 0, i32 3
%.tmp6009 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6008
%.tmp6010 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6009, i32 0, i32 3
%.tmp6011 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp6011, %m1830$.Type.type** %.tmp6010
%.tmp6012 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6013 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6012, i32 0, i32 3
%.tmp6014 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6013
%.tmp6015 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6014, i32 0, i32 3
%.tmp6016 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6015
%.tmp6017 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6016, i32 0, i32 0
%.tmp6019 = getelementptr [4 x i8], [4 x i8]*@.str6018, i32 0, i32 0
store i8* %.tmp6019, i8** %.tmp6017
%.tmp6020 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6021 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6020, i32 0, i32 3
%.tmp6022 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6021
%.tmp6023 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6022, i32 0, i32 3
%.tmp6024 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6023
%.tmp6025 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6024, i32 0, i32 4
%.tmp6026 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
store %m1830$.Type.type* %.tmp6026, %m1830$.Type.type** %.tmp6025
%.tmp6027 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6028 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6027, i32 0, i32 3
%.tmp6029 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6028
%.tmp6030 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6029, i32 0, i32 3
%.tmp6031 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6030
%.tmp6032 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6031, i32 0, i32 4
%.tmp6033 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6032
%.tmp6034 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6033, i32 0, i32 0
%.tmp6035 = getelementptr i8*, i8** %.tmp6034, i32 0
%.tmp6037 = getelementptr [3 x i8], [3 x i8]*@.str6036, i32 0, i32 0
%.tmp6038 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp6039 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6038, i32 0, i32 0
%.tmp6040 = load i8*, i8** %.tmp6039
%.tmp6041 = call i32(i8*) @m2176$llvm_str_len.i.cp(i8* %.tmp6040)
%.tmp6042 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6035, i8* %.tmp6037, i32 %.tmp6041)
%.tmp6043 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp6044 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6043, i32 0, i32 1
%.tmp6046 = getelementptr [7 x i8], [7 x i8]*@.str6045, i32 0, i32 0
store i8* %.tmp6046, i8** %.tmp6044
%.tmp6047 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp6048 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6047, i32 0, i32 4
store %m1830$.GlobalName.type* null, %m1830$.GlobalName.type** %.tmp6048
%.tmp6049 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp6050 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6049, i32 0, i32 3
%.tmp6051 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
store %m1830$.AssignableInfo.type* %.tmp6051, %m1830$.AssignableInfo.type** %.tmp6050
%.tmp6052 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
%.tmp6053 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6052, i32 0, i32 2
store i1 0, i1* %.tmp6053
%.tmp6054 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6055 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %global
call void(%m1830$.CompilerCtx.type*,%m1830$.GlobalName.type*) @m1830$append_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.tmp6054, %m1830$.GlobalName.type* %.tmp6055)
%.tmp6056 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
ret %m1830$.AssignableInfo.type* %.tmp6056
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
%.tmp6057 = load %m286$.Node.type*, %m286$.Node.type** %mod
%.tmp6058 = call %m1830$.AssignableInfo.type*(%m286$.Node.type*) @m1830$new_assignable_info.m1830$.AssignableInfo.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6057)
%info = alloca %m1830$.AssignableInfo.type*
store %m1830$.AssignableInfo.type* %.tmp6058, %m1830$.AssignableInfo.type** %info
%.tmp6059 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6060 = load i8, i8* @SCOPE_CONST
%.tmp6061 = load i8*, i8** %abspath
call void(%m1830$.AssignableInfo.type*,i8,i8*) @m1830$set_assignable_id.v.m1830$.AssignableInfo.typep.c.cp(%m1830$.AssignableInfo.type* %.tmp6059, i8 %.tmp6060, i8* %.tmp6061)
%.tmp6062 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6063 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6062, i32 0, i32 2
%.tmp6065 = getelementptr [7 x i8], [7 x i8]*@.str6064, i32 0, i32 0
store i8* %.tmp6065, i8** %.tmp6063
%.tmp6066 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
%.tmp6067 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6066, i32 0, i32 3
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp6067
%.tmp6068 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6069 = load i8*, i8** %as_name
%.tmp6070 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %info
call void(%m1830$.CompilerCtx.type*,i8*,%m1830$.AssignableInfo.type*) @m1830$define_assignable.v.m1830$.CompilerCtx.typep.cp.m1830$.AssignableInfo.typep(%m1830$.CompilerCtx.type* %.tmp6068, i8* %.tmp6069, %m1830$.AssignableInfo.type* %.tmp6070)
ret void
}
define void @m1830$append_global.v.m1830$.CompilerCtx.typep.m1830$.GlobalName.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%g = alloca %m1830$.GlobalName.type*
store %m1830$.GlobalName.type* %.g.arg, %m1830$.GlobalName.type** %g
%.tmp6071 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6072 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6071, i32 0, i32 3
%.tmp6073 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp6072
%.tmp6074 = icmp eq %m1830$.GlobalName.type* %.tmp6073, null
br i1 %.tmp6074, label %.if.true.6075, label %.if.false.6075
.if.true.6075:
%.tmp6076 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6077 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6076, i32 0, i32 3
%.tmp6078 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
store %m1830$.GlobalName.type* %.tmp6078, %m1830$.GlobalName.type** %.tmp6077
br label %.if.end.6075
.if.false.6075:
%last_global = alloca %m1830$.GlobalName.type*
%.tmp6080 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6081 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6080, i32 0, i32 3
%.tmp6082 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp6081
store %m1830$.GlobalName.type* %.tmp6082, %m1830$.GlobalName.type** %last_global
br label %.for.start.6079
.for.start.6079:
%.tmp6083 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %last_global
%.tmp6084 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6083, i32 0, i32 4
%.tmp6085 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp6084
%.tmp6086 = icmp ne %m1830$.GlobalName.type* %.tmp6085, null
br i1 %.tmp6086, label %.for.continue.6079, label %.for.end.6079
.for.continue.6079:
%.tmp6087 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %last_global
%.tmp6088 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6087, i32 0, i32 4
%.tmp6089 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %.tmp6088
store %m1830$.GlobalName.type* %.tmp6089, %m1830$.GlobalName.type** %last_global
br label %.for.start.6079
.for.end.6079:
%.tmp6090 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %last_global
%.tmp6091 = getelementptr %m1830$.GlobalName.type, %m1830$.GlobalName.type* %.tmp6090, i32 0, i32 4
%.tmp6092 = load %m1830$.GlobalName.type*, %m1830$.GlobalName.type** %g
store %m1830$.GlobalName.type* %.tmp6092, %m1830$.GlobalName.type** %.tmp6091
br label %.if.end.6075
.if.end.6075:
ret void
}
define i8* @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.Type.type* %.type.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.type.arg, %m1830$.Type.type** %type
%.tmp6093 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6094 = icmp eq %m1830$.Type.type* %.tmp6093, null
br i1 %.tmp6094, label %.if.true.6095, label %.if.false.6095
.if.true.6095:
%.tmp6096 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6096, label %.if.true.6097, label %.if.false.6097
.if.true.6097:
%.tmp6099 = getelementptr [44 x i8], [44 x i8]*@.str6098, i32 0, i32 0
%.tmp6100 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6101 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6100, i32 0, i32 6
%.tmp6102 = load i8*, i8** %.tmp6101
%.tmp6103 = call i32(i8*,...) @printf(i8* %.tmp6099, i8* %.tmp6102)
br label %.if.end.6097
.if.false.6097:
br label %.if.end.6097
.if.end.6097:
%.tmp6105 = getelementptr [2 x i8], [2 x i8]*@.str6104, i32 0, i32 0
ret i8* %.tmp6105
br label %.if.end.6095
.if.false.6095:
br label %.if.end.6095
.if.end.6095:
%.tmp6106 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6107 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6106, i32 0, i32 0
%.tmp6108 = load i8*, i8** %.tmp6107
%.tmp6109 = icmp ne i8* %.tmp6108, null
%.tmp6111 = getelementptr [59 x i8], [59 x i8]*@.str6110, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6109, i8* %.tmp6111)
%buf = alloca i8*
%.tmp6112 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6113 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6112, i32 0, i32 0
%.tmp6114 = load i8*, i8** %.tmp6113
%.tmp6116 = getelementptr [4 x i8], [4 x i8]*@.str6115, i32 0, i32 0
%.tmp6117 = call i32(i8*,i8*) @strcmp(i8* %.tmp6114, i8* %.tmp6116)
%.tmp6118 = icmp eq i32 %.tmp6117, 0
br i1 %.tmp6118, label %.if.true.6119, label %.if.false.6119
.if.true.6119:
%.tmp6121 = getelementptr [4 x i8], [4 x i8]*@.str6120, i32 0, i32 0
ret i8* %.tmp6121
br label %.if.end.6119
.if.false.6119:
%.tmp6122 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6123 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6122, i32 0, i32 0
%.tmp6124 = load i8*, i8** %.tmp6123
%.tmp6126 = getelementptr [5 x i8], [5 x i8]*@.str6125, i32 0, i32 0
%.tmp6127 = call i32(i8*,i8*) @strcmp(i8* %.tmp6124, i8* %.tmp6126)
%.tmp6128 = icmp eq i32 %.tmp6127, 0
br i1 %.tmp6128, label %.if.true.6129, label %.if.false.6129
.if.true.6129:
%.tmp6131 = getelementptr [5 x i8], [5 x i8]*@.str6130, i32 0, i32 0
ret i8* %.tmp6131
br label %.if.end.6129
.if.false.6129:
%.tmp6132 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6133 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6132, i32 0, i32 0
%.tmp6134 = load i8*, i8** %.tmp6133
%.tmp6136 = getelementptr [5 x i8], [5 x i8]*@.str6135, i32 0, i32 0
%.tmp6137 = call i32(i8*,i8*) @strcmp(i8* %.tmp6134, i8* %.tmp6136)
%.tmp6138 = icmp eq i32 %.tmp6137, 0
br i1 %.tmp6138, label %.if.true.6139, label %.if.false.6139
.if.true.6139:
%.tmp6141 = getelementptr [3 x i8], [3 x i8]*@.str6140, i32 0, i32 0
ret i8* %.tmp6141
br label %.if.end.6139
.if.false.6139:
%.tmp6142 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6143 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6142, i32 0, i32 0
%.tmp6144 = load i8*, i8** %.tmp6143
%.tmp6146 = getelementptr [8 x i8], [8 x i8]*@.str6145, i32 0, i32 0
%.tmp6147 = call i32(i8*,i8*) @strcmp(i8* %.tmp6144, i8* %.tmp6146)
%.tmp6148 = icmp eq i32 %.tmp6147, 0
br i1 %.tmp6148, label %.if.true.6149, label %.if.false.6149
.if.true.6149:
%.tmp6151 = getelementptr [4 x i8], [4 x i8]*@.str6150, i32 0, i32 0
ret i8* %.tmp6151
br label %.if.end.6149
.if.false.6149:
%.tmp6152 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6153 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6152, i32 0, i32 0
%.tmp6154 = load i8*, i8** %.tmp6153
%.tmp6156 = getelementptr [4 x i8], [4 x i8]*@.str6155, i32 0, i32 0
%.tmp6157 = call i32(i8*,i8*) @strcmp(i8* %.tmp6154, i8* %.tmp6156)
%.tmp6158 = icmp eq i32 %.tmp6157, 0
br i1 %.tmp6158, label %.if.true.6159, label %.if.false.6159
.if.true.6159:
%.tmp6161 = getelementptr [3 x i8], [3 x i8]*@.str6160, i32 0, i32 0
ret i8* %.tmp6161
br label %.if.end.6159
.if.false.6159:
%.tmp6162 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6163 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6162, i32 0, i32 0
%.tmp6164 = load i8*, i8** %.tmp6163
%.tmp6166 = getelementptr [9 x i8], [9 x i8]*@.str6165, i32 0, i32 0
%.tmp6167 = call i32(i8*,i8*) @strcmp(i8* %.tmp6164, i8* %.tmp6166)
%.tmp6168 = icmp eq i32 %.tmp6167, 0
br i1 %.tmp6168, label %.if.true.6169, label %.if.false.6169
.if.true.6169:
%.tmp6170 = getelementptr i8*, i8** %buf, i32 0
%.tmp6172 = getelementptr [4 x i8], [4 x i8]*@.str6171, i32 0, i32 0
%.tmp6173 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6174 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6175 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6174, i32 0, i32 3
%.tmp6176 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6175
%.tmp6177 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6173, %m1830$.Type.type* %.tmp6176)
%.tmp6178 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6170, i8* %.tmp6172, i8* %.tmp6177)
%.tmp6180 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6181 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6180, i32 0, i32 3
%.tmp6182 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6181
%.tmp6183 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6182, i32 0, i32 4
%.tmp6184 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6183
%p = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6184, %m1830$.Type.type** %p
br label %.for.start.6179
.for.start.6179:
%.tmp6185 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6186 = icmp ne %m1830$.Type.type* %.tmp6185, null
br i1 %.tmp6186, label %.for.continue.6179, label %.for.end.6179
.for.continue.6179:
%.tmp6187 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6188 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6189 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6188, i32 0, i32 3
%.tmp6190 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6189
%.tmp6191 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6190, i32 0, i32 4
%.tmp6192 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6191
%.tmp6193 = icmp ne %m1830$.Type.type* %.tmp6187, %.tmp6192
br i1 %.tmp6193, label %.if.true.6194, label %.if.false.6194
.if.true.6194:
%.tmp6195 = getelementptr i8*, i8** %buf, i32 0
%.tmp6197 = getelementptr [4 x i8], [4 x i8]*@.str6196, i32 0, i32 0
%.tmp6198 = load i8*, i8** %buf
%.tmp6199 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6195, i8* %.tmp6197, i8* %.tmp6198)
br label %.if.end.6194
.if.false.6194:
br label %.if.end.6194
.if.end.6194:
%.tmp6200 = getelementptr i8*, i8** %buf, i32 0
%.tmp6202 = getelementptr [5 x i8], [5 x i8]*@.str6201, i32 0, i32 0
%.tmp6203 = load i8*, i8** %buf
%.tmp6204 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6205 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6206 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6204, %m1830$.Type.type* %.tmp6205)
%.tmp6207 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6200, i8* %.tmp6202, i8* %.tmp6203, i8* %.tmp6206)
%.tmp6208 = load %m1830$.Type.type*, %m1830$.Type.type** %p
%.tmp6209 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6208, i32 0, i32 4
%.tmp6210 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6209
store %m1830$.Type.type* %.tmp6210, %m1830$.Type.type** %p
br label %.for.start.6179
.for.end.6179:
%.tmp6211 = getelementptr i8*, i8** %buf, i32 0
%.tmp6213 = getelementptr [4 x i8], [4 x i8]*@.str6212, i32 0, i32 0
%.tmp6214 = load i8*, i8** %buf
%.tmp6215 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6211, i8* %.tmp6213, i8* %.tmp6214)
%.tmp6216 = load i8*, i8** %buf
ret i8* %.tmp6216
br label %.if.end.6169
.if.false.6169:
%.tmp6217 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6218 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6217, i32 0, i32 0
%.tmp6219 = load i8*, i8** %.tmp6218
%.tmp6221 = getelementptr [4 x i8], [4 x i8]*@.str6220, i32 0, i32 0
%.tmp6222 = call i32(i8*,i8*) @strcmp(i8* %.tmp6219, i8* %.tmp6221)
%.tmp6223 = icmp eq i32 %.tmp6222, 0
br i1 %.tmp6223, label %.if.true.6224, label %.if.false.6224
.if.true.6224:
%.tmp6225 = getelementptr i8*, i8** %buf, i32 0
%.tmp6227 = getelementptr [4 x i8], [4 x i8]*@.str6226, i32 0, i32 0
%.tmp6228 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6229 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6230 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6229, i32 0, i32 3
%.tmp6231 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6230
%.tmp6232 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6228, %m1830$.Type.type* %.tmp6231)
%.tmp6233 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6225, i8* %.tmp6227, i8* %.tmp6232)
%.tmp6234 = load i8*, i8** %buf
ret i8* %.tmp6234
br label %.if.end.6224
.if.false.6224:
%.tmp6235 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6236 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6235, i32 0, i32 0
%.tmp6237 = load i8*, i8** %.tmp6236
%.tmp6239 = getelementptr [7 x i8], [7 x i8]*@.str6238, i32 0, i32 0
%.tmp6240 = call i32(i8*,i8*) @strcmp(i8* %.tmp6237, i8* %.tmp6239)
%.tmp6241 = icmp eq i32 %.tmp6240, 0
br i1 %.tmp6241, label %.if.true.6242, label %.if.false.6242
.if.true.6242:
%.tmp6243 = getelementptr i8*, i8** %buf, i32 0
%.tmp6245 = getelementptr [2 x i8], [2 x i8]*@.str6244, i32 0, i32 0
%.tmp6246 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6243, i8* %.tmp6245)
%.tmp6248 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6249 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6248, i32 0, i32 3
%.tmp6250 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6249
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6250, %m1830$.Type.type** %t
br label %.for.start.6247
.for.start.6247:
%.tmp6251 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6252 = icmp ne %m1830$.Type.type* %.tmp6251, null
br i1 %.tmp6252, label %.for.continue.6247, label %.for.end.6247
.for.continue.6247:
%.tmp6253 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6254 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6255 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6254, i32 0, i32 3
%.tmp6256 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6255
%.tmp6257 = icmp ne %m1830$.Type.type* %.tmp6253, %.tmp6256
br i1 %.tmp6257, label %.if.true.6258, label %.if.false.6258
.if.true.6258:
%.tmp6259 = getelementptr i8*, i8** %buf, i32 0
%.tmp6261 = getelementptr [4 x i8], [4 x i8]*@.str6260, i32 0, i32 0
%.tmp6262 = load i8*, i8** %buf
%.tmp6263 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6259, i8* %.tmp6261, i8* %.tmp6262)
br label %.if.end.6258
.if.false.6258:
br label %.if.end.6258
.if.end.6258:
%.tmp6264 = getelementptr i8*, i8** %buf, i32 0
%.tmp6266 = getelementptr [5 x i8], [5 x i8]*@.str6265, i32 0, i32 0
%.tmp6267 = load i8*, i8** %buf
%.tmp6268 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6269 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6270 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6268, %m1830$.Type.type* %.tmp6269)
%.tmp6271 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6264, i8* %.tmp6266, i8* %.tmp6267, i8* %.tmp6270)
%.tmp6272 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6273 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6272, i32 0, i32 4
%.tmp6274 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6273
store %m1830$.Type.type* %.tmp6274, %m1830$.Type.type** %t
br label %.for.start.6247
.for.end.6247:
%.tmp6275 = getelementptr i8*, i8** %buf, i32 0
%.tmp6277 = getelementptr [4 x i8], [4 x i8]*@.str6276, i32 0, i32 0
%.tmp6278 = load i8*, i8** %buf
%.tmp6279 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6275, i8* %.tmp6277, i8* %.tmp6278)
%.tmp6280 = load i8*, i8** %buf
ret i8* %.tmp6280
br label %.if.end.6242
.if.false.6242:
%.tmp6281 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6282 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6281, i32 0, i32 0
%.tmp6283 = load i8*, i8** %.tmp6282
%.tmp6285 = getelementptr [6 x i8], [6 x i8]*@.str6284, i32 0, i32 0
%.tmp6286 = call i32(i8*,i8*) @strcmp(i8* %.tmp6283, i8* %.tmp6285)
%.tmp6287 = icmp eq i32 %.tmp6286, 0
br i1 %.tmp6287, label %.if.true.6288, label %.if.false.6288
.if.true.6288:
%.tmp6289 = getelementptr i8*, i8** %buf, i32 0
%.tmp6291 = getelementptr [10 x i8], [10 x i8]*@.str6290, i32 0, i32 0
%.tmp6292 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6293 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6292, i32 0, i32 3
%.tmp6294 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6293
%.tmp6295 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6294, i32 0, i32 4
%.tmp6296 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6295
%.tmp6297 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6296, i32 0, i32 0
%.tmp6298 = load i8*, i8** %.tmp6297
%.tmp6299 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6300 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6301 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6300, i32 0, i32 3
%.tmp6302 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6301
%.tmp6303 = call i8*(%m1830$.CompilerCtx.type*,%m1830$.Type.type*) @m1830$type_repr.cp.m1830$.CompilerCtx.typep.m1830$.Type.typep(%m1830$.CompilerCtx.type* %.tmp6299, %m1830$.Type.type* %.tmp6302)
%.tmp6304 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6289, i8* %.tmp6291, i8* %.tmp6298, i8* %.tmp6303)
%.tmp6305 = load i8*, i8** %buf
ret i8* %.tmp6305
br label %.if.end.6288
.if.false.6288:
%.tmp6306 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6307 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6306, i32 0, i32 0
%.tmp6308 = load i8*, i8** %.tmp6307
%.tmp6310 = getelementptr [10 x i8], [10 x i8]*@.str6309, i32 0, i32 0
%.tmp6311 = call i32(i8*,i8*) @strcmp(i8* %.tmp6308, i8* %.tmp6310)
%.tmp6312 = icmp eq i32 %.tmp6311, 0
br i1 %.tmp6312, label %.if.true.6313, label %.if.false.6313
.if.true.6313:
%.tmp6314 = getelementptr i8*, i8** %buf, i32 0
%.tmp6316 = getelementptr [5 x i8], [5 x i8]*@.str6315, i32 0, i32 0
%.tmp6317 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6318 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6317, i32 0, i32 2
%.tmp6319 = load i8*, i8** %.tmp6318
%.tmp6320 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6314, i8* %.tmp6316, i8* %.tmp6319)
%.tmp6321 = load i8*, i8** %buf
ret i8* %.tmp6321
br label %.if.end.6313
.if.false.6313:
%.tmp6322 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6323 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6322, i32 0, i32 0
%.tmp6324 = load i8*, i8** %.tmp6323
%.tmp6326 = getelementptr [4 x i8], [4 x i8]*@.str6325, i32 0, i32 0
%.tmp6327 = call i32(i8*,i8*) @strcmp(i8* %.tmp6324, i8* %.tmp6326)
%.tmp6328 = icmp eq i32 %.tmp6327, 0
br i1 %.tmp6328, label %.if.true.6329, label %.if.false.6329
.if.true.6329:
%.tmp6331 = getelementptr [4 x i8], [4 x i8]*@.str6330, i32 0, i32 0
ret i8* %.tmp6331
br label %.if.end.6329
.if.false.6329:
%.tmp6332 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6333 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6332, i32 0, i32 0
%.tmp6334 = load i8*, i8** %.tmp6333
%.tmp6336 = getelementptr [7 x i8], [7 x i8]*@.str6335, i32 0, i32 0
%.tmp6337 = call i32(i8*,i8*) @strcmp(i8* %.tmp6334, i8* %.tmp6336)
%.tmp6338 = icmp eq i32 %.tmp6337, 0
br i1 %.tmp6338, label %.if.true.6339, label %.if.false.6339
.if.true.6339:
%.tmp6341 = getelementptr [4 x i8], [4 x i8]*@.str6340, i32 0, i32 0
ret i8* %.tmp6341
br label %.if.end.6339
.if.false.6339:
%.tmp6342 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6343 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6342, i32 0, i32 0
%.tmp6344 = load i8*, i8** %.tmp6343
%.tmp6346 = getelementptr [6 x i8], [6 x i8]*@.str6345, i32 0, i32 0
%.tmp6347 = call i32(i8*,i8*) @strcmp(i8* %.tmp6344, i8* %.tmp6346)
%.tmp6348 = icmp eq i32 %.tmp6347, 0
br i1 %.tmp6348, label %.if.true.6349, label %.if.false.6349
.if.true.6349:
br label %.if.end.6349
.if.false.6349:
%.tmp6351 = getelementptr [58 x i8], [58 x i8]*@.str6350, i32 0, i32 0
%.tmp6352 = load %m1830$.Type.type*, %m1830$.Type.type** %type
%.tmp6353 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6352, i32 0, i32 0
%.tmp6354 = load i8*, i8** %.tmp6353
%.tmp6355 = call i32(i8*,...) @printf(i8* %.tmp6351, i8* %.tmp6354)
br label %.if.end.6349
.if.end.6349:
br label %.if.end.6339
.if.end.6339:
br label %.if.end.6329
.if.end.6329:
br label %.if.end.6313
.if.end.6313:
br label %.if.end.6288
.if.end.6288:
br label %.if.end.6242
.if.end.6242:
br label %.if.end.6224
.if.end.6224:
br label %.if.end.6169
.if.end.6169:
br label %.if.end.6159
.if.end.6159:
br label %.if.end.6149
.if.end.6149:
br label %.if.end.6139
.if.end.6139:
br label %.if.end.6129
.if.end.6129:
br label %.if.end.6119
.if.end.6119:
%.tmp6356 = bitcast ptr null to i8*
ret i8* %.tmp6356
}
define void @m1830$append_error.v.m1830$.CompilerCtx.typep.m717$.Error.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m717$.Error.type* %.e.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%e = alloca %m717$.Error.type*
store %m717$.Error.type* %.e.arg, %m717$.Error.type** %e
%.tmp6357 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* null, i32 1
%.tmp6358 = ptrtoint %m1830$.ErrorList.type* %.tmp6357 to i32
%.tmp6359 = call i8*(i32) @malloc(i32 %.tmp6358)
%.tmp6360 = bitcast i8* %.tmp6359 to %m1830$.ErrorList.type*
%new_err = alloca %m1830$.ErrorList.type*
store %m1830$.ErrorList.type* %.tmp6360, %m1830$.ErrorList.type** %new_err
%.tmp6361 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
%.tmp6362 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6361, i32 0, i32 0
%.tmp6363 = load %m717$.Error.type*, %m717$.Error.type** %e
store %m717$.Error.type* %.tmp6363, %m717$.Error.type** %.tmp6362
%.tmp6364 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
%.tmp6365 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6364, i32 0, i32 1
store %m1830$.ErrorList.type* null, %m1830$.ErrorList.type** %.tmp6365
%.tmp6366 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6367 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6366, i32 0, i32 2
%.tmp6368 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6367
%.tmp6369 = icmp eq %m1830$.ErrorList.type* %.tmp6368, null
br i1 %.tmp6369, label %.if.true.6370, label %.if.false.6370
.if.true.6370:
%.tmp6371 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6372 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6371, i32 0, i32 2
%.tmp6373 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
store %m1830$.ErrorList.type* %.tmp6373, %m1830$.ErrorList.type** %.tmp6372
ret void
br label %.if.end.6370
.if.false.6370:
br label %.if.end.6370
.if.end.6370:
%.tmp6375 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6376 = getelementptr %m1830$.CompilerCtx.type, %m1830$.CompilerCtx.type* %.tmp6375, i32 0, i32 2
%.tmp6377 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6376
%last = alloca %m1830$.ErrorList.type*
store %m1830$.ErrorList.type* %.tmp6377, %m1830$.ErrorList.type** %last
br label %.for.start.6374
.for.start.6374:
%.tmp6378 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %last
%.tmp6379 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6378, i32 0, i32 1
%.tmp6380 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6379
%.tmp6381 = icmp ne %m1830$.ErrorList.type* %.tmp6380, null
br i1 %.tmp6381, label %.for.continue.6374, label %.for.end.6374
.for.continue.6374:
%.tmp6382 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %last
%.tmp6383 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6382, i32 0, i32 1
%.tmp6384 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %.tmp6383
store %m1830$.ErrorList.type* %.tmp6384, %m1830$.ErrorList.type** %last
br label %.for.start.6374
.for.end.6374:
%.tmp6385 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %last
%.tmp6386 = getelementptr %m1830$.ErrorList.type, %m1830$.ErrorList.type* %.tmp6385, i32 0, i32 1
%.tmp6387 = load %m1830$.ErrorList.type*, %m1830$.ErrorList.type** %new_err
store %m1830$.ErrorList.type* %.tmp6387, %m1830$.ErrorList.type** %.tmp6386
ret void
}
define i8* @m1830$syn_function_name.cp.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6388 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6389 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6388, i32 0, i32 6
%.tmp6390 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6389
%.tmp6391 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6390, i32 0, i32 7
%.tmp6392 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6391
%.tmp6393 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6392, i32 0, i32 1
%.tmp6394 = load i8*, i8** %.tmp6393
ret i8* %.tmp6394
}
define %m286$.Node.type* @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m286$.Node.type*
store %m286$.Node.type* %.node.arg, %m286$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6396 = load %m286$.Node.type*, %m286$.Node.type** %node
%n = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6396, %m286$.Node.type** %n
br label %.for.start.6395
.for.start.6395:
%.tmp6397 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6398 = icmp ne %m286$.Node.type* %.tmp6397, null
br i1 %.tmp6398, label %.for.continue.6395, label %.for.end.6395
.for.continue.6395:
%.tmp6399 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6400 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6399, i32 0, i32 0
%.tmp6401 = load i8*, i8** %.tmp6400
%.tmp6402 = load i8*, i8** %type
%.tmp6403 = call i32(i8*,i8*) @strcmp(i8* %.tmp6401, i8* %.tmp6402)
%.tmp6404 = icmp eq i32 %.tmp6403, 0
br i1 %.tmp6404, label %.if.true.6405, label %.if.false.6405
.if.true.6405:
%.tmp6406 = load %m286$.Node.type*, %m286$.Node.type** %n
ret %m286$.Node.type* %.tmp6406
br label %.if.end.6405
.if.false.6405:
br label %.if.end.6405
.if.end.6405:
%.tmp6407 = load %m286$.Node.type*, %m286$.Node.type** %n
%.tmp6408 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6407, i32 0, i32 7
%.tmp6409 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6408
store %m286$.Node.type* %.tmp6409, %m286$.Node.type** %n
br label %.for.start.6395
.for.end.6395:
%.tmp6410 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6410
}
define %m1830$.Type.type* @m1830$syn_function_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6411 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%function_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6411, %m1830$.Type.type** %function_type
%.tmp6412 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6413 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6414 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6413, i32 0, i32 6
%.tmp6415 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6414
%.tmp6416 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6412, %m286$.Node.type* %.tmp6415)
%return_value_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6416, %m1830$.Type.type** %return_value_type
%.tmp6417 = load %m1830$.Type.type*, %m1830$.Type.type** %function_type
%.tmp6418 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6417, i32 0, i32 0
%.tmp6420 = getelementptr [9 x i8], [9 x i8]*@.str6419, i32 0, i32 0
store i8* %.tmp6420, i8** %.tmp6418
%.tmp6421 = load %m1830$.Type.type*, %m1830$.Type.type** %function_type
%.tmp6422 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6421, i32 0, i32 3
%.tmp6423 = load %m1830$.Type.type*, %m1830$.Type.type** %return_value_type
store %m1830$.Type.type* %.tmp6423, %m1830$.Type.type** %.tmp6422
%.tmp6424 = load %m1830$.Type.type*, %m1830$.Type.type** %return_value_type
%last_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6424, %m1830$.Type.type** %last_type
%.tmp6425 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6426 = call %m286$.Node.type*(%m286$.Node.type*) @m1830$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.tmp6425)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6426, %m286$.Node.type** %params
%.tmp6428 = load %m286$.Node.type*, %m286$.Node.type** %params
%param_ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6428, %m286$.Node.type** %param_ptr
br label %.for.start.6427
.for.start.6427:
%.tmp6429 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6430 = icmp ne %m286$.Node.type* %.tmp6429, null
br i1 %.tmp6430, label %.for.continue.6427, label %.for.end.6427
.for.continue.6427:
%.tmp6431 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6432 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6431, i32 0, i32 0
%.tmp6433 = load i8*, i8** %.tmp6432
%.tmp6435 = getelementptr [5 x i8], [5 x i8]*@.str6434, i32 0, i32 0
%.tmp6436 = call i32(i8*,i8*) @strcmp(i8* %.tmp6433, i8* %.tmp6435)
%.tmp6437 = icmp eq i32 %.tmp6436, 0
br i1 %.tmp6437, label %.if.true.6438, label %.if.false.6438
.if.true.6438:
%.tmp6439 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6440 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6439, i32 0, i32 4
%.tmp6441 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6442 = call %m1830$.Type.type*(%m1830$.Type.type*) @m1830$type_clone.m1830$.Type.typep.m1830$.Type.typep(%m1830$.Type.type* %.tmp6441)
store %m1830$.Type.type* %.tmp6442, %m1830$.Type.type** %.tmp6440
%.tmp6443 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6444 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6443, i32 0, i32 4
%.tmp6445 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6444
%.tmp6446 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6445, i32 0, i32 4
store %m1830$.Type.type* null, %m1830$.Type.type** %.tmp6446
%.tmp6447 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6448 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6447, i32 0, i32 4
%.tmp6449 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6448
store %m1830$.Type.type* %.tmp6449, %m1830$.Type.type** %last_type
%.tmp6450 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6451 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6450, i32 0, i32 7
%.tmp6452 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6451
%.tmp6453 = icmp ne %m286$.Node.type* %.tmp6452, null
br i1 %.tmp6453, label %.if.true.6454, label %.if.false.6454
.if.true.6454:
%.tmp6455 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6456 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6455, i32 0, i32 7
%.tmp6457 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6456
store %m286$.Node.type* %.tmp6457, %m286$.Node.type** %param_ptr
br label %.if.end.6454
.if.false.6454:
br label %.if.end.6454
.if.end.6454:
%.tmp6458 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6459 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6458, i32 0, i32 7
%.tmp6460 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6459
%.tmp6461 = icmp ne %m286$.Node.type* %.tmp6460, null
br i1 %.tmp6461, label %.if.true.6462, label %.if.false.6462
.if.true.6462:
%.tmp6463 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6464 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6463, i32 0, i32 7
%.tmp6465 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6464
store %m286$.Node.type* %.tmp6465, %m286$.Node.type** %param_ptr
br label %.if.end.6462
.if.false.6462:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6462
.if.end.6462:
br label %.if.end.6438
.if.false.6438:
%.tmp6466 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6467 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6468 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6467, i32 0, i32 6
%.tmp6469 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6468
%.tmp6470 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6466, %m286$.Node.type* %.tmp6469)
%param_type = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6470, %m1830$.Type.type** %param_type
%.tmp6471 = load %m1830$.Type.type*, %m1830$.Type.type** %last_type
%.tmp6472 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6471, i32 0, i32 4
%.tmp6473 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
store %m1830$.Type.type* %.tmp6473, %m1830$.Type.type** %.tmp6472
%.tmp6474 = load %m1830$.Type.type*, %m1830$.Type.type** %param_type
store %m1830$.Type.type* %.tmp6474, %m1830$.Type.type** %last_type
%.tmp6475 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6476 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6475, i32 0, i32 7
%.tmp6477 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6476
store %m286$.Node.type* %.tmp6477, %m286$.Node.type** %param_ptr
%.tmp6478 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6479 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6478, i32 0, i32 7
%.tmp6480 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6479
%.tmp6481 = icmp ne %m286$.Node.type* %.tmp6480, null
br i1 %.tmp6481, label %.if.true.6482, label %.if.false.6482
.if.true.6482:
%.tmp6483 = load %m286$.Node.type*, %m286$.Node.type** %param_ptr
%.tmp6484 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6483, i32 0, i32 7
%.tmp6485 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6484
%.tmp6486 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6485, i32 0, i32 7
%.tmp6487 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6486
store %m286$.Node.type* %.tmp6487, %m286$.Node.type** %param_ptr
br label %.if.end.6482
.if.false.6482:
store %m286$.Node.type* null, %m286$.Node.type** %param_ptr
br label %.if.end.6482
.if.end.6482:
br label %.if.end.6438
.if.end.6438:
br label %.for.start.6427
.for.end.6427:
%.tmp6488 = load %m1830$.Type.type*, %m1830$.Type.type** %function_type
ret %m1830$.Type.type* %.tmp6488
}
define %m286$.Node.type* @m1830$syn_function_params.m286$.Node.typep.m286$.Node.typep(%m286$.Node.type* %.stmt.arg) {
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6489 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6491 = getelementptr [10 x i8], [10 x i8]*@.str6490, i32 0, i32 0
%.tmp6492 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6489, i8* %.tmp6491)
%params = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6492, %m286$.Node.type** %params
%.tmp6493 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6494 = icmp eq %m286$.Node.type* %.tmp6493, null
br i1 %.tmp6494, label %.if.true.6495, label %.if.false.6495
.if.true.6495:
%.tmp6496 = bitcast ptr null to %m286$.Node.type*
ret %m286$.Node.type* %.tmp6496
br label %.if.end.6495
.if.false.6495:
br label %.if.end.6495
.if.end.6495:
%.tmp6497 = load %m286$.Node.type*, %m286$.Node.type** %params
%.tmp6498 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6497, i32 0, i32 6
%.tmp6499 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6498
ret %m286$.Node.type* %.tmp6499
}
define %m1830$.Type.type* @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.ctx.arg, %m286$.Node.type* %.stmt.arg) {
%ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.ctx.arg, %m1830$.CompilerCtx.type** %ctx
%stmt = alloca %m286$.Node.type*
store %m286$.Node.type* %.stmt.arg, %m286$.Node.type** %stmt
%.tmp6500 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6500, %m1830$.Type.type** %t
%.tmp6501 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6502 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6501, i32 0, i32 0
%.tmp6503 = load i8*, i8** %.tmp6502
%.tmp6505 = getelementptr [10 x i8], [10 x i8]*@.str6504, i32 0, i32 0
%.tmp6506 = call i32(i8*,i8*) @strcmp(i8* %.tmp6503, i8* %.tmp6505)
%.tmp6507 = icmp eq i32 %.tmp6506, 0
br i1 %.tmp6507, label %.if.true.6508, label %.if.false.6508
.if.true.6508:
%.tmp6509 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6510 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6509, i32 0, i32 0
%.tmp6512 = getelementptr [7 x i8], [7 x i8]*@.str6511, i32 0, i32 0
store i8* %.tmp6512, i8** %.tmp6510
%.tmp6513 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6514 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6513, i32 0, i32 1
store i8* null, i8** %.tmp6514
%.tmp6515 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6516 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6515, i32 0, i32 6
%.tmp6517 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6516
%.tmp6519 = getelementptr [5 x i8], [5 x i8]*@.str6518, i32 0, i32 0
%.tmp6520 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6517, i8* %.tmp6519)
%curr_type = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6520, %m286$.Node.type** %curr_type
%.tmp6521 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6522 = icmp ne %m286$.Node.type* %.tmp6521, null
br i1 %.tmp6522, label %.if.true.6523, label %.if.false.6523
.if.true.6523:
%.tmp6524 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6525 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6524, i32 0, i32 3
%.tmp6526 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6527 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6528 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6527, i32 0, i32 6
%.tmp6529 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6528
%.tmp6530 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6526, %m286$.Node.type* %.tmp6529)
store %m1830$.Type.type* %.tmp6530, %m1830$.Type.type** %.tmp6525
%.tmp6531 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6532 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6531, i32 0, i32 3
%.tmp6533 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6532
%.tmp6534 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6533, i32 0, i32 1
%.tmp6535 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6536 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6535, i32 0, i32 7
%.tmp6537 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6536
%.tmp6538 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6537, i32 0, i32 1
%.tmp6539 = load i8*, i8** %.tmp6538
store i8* %.tmp6539, i8** %.tmp6534
%.tmp6540 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6541 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6540, i32 0, i32 3
%.tmp6542 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6541
%curr_t = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6542, %m1830$.Type.type** %curr_t
%.tmp6544 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6545 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6544, i32 0, i32 7
%.tmp6546 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6545
%.tmp6548 = getelementptr [5 x i8], [5 x i8]*@.str6547, i32 0, i32 0
%.tmp6549 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6546, i8* %.tmp6548)
store %m286$.Node.type* %.tmp6549, %m286$.Node.type** %curr_type
br label %.for.start.6543
.for.start.6543:
%.tmp6550 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6551 = icmp ne %m286$.Node.type* %.tmp6550, null
br i1 %.tmp6551, label %.for.continue.6543, label %.for.end.6543
.for.continue.6543:
%.tmp6552 = load %m1830$.Type.type*, %m1830$.Type.type** %curr_t
%.tmp6553 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6552, i32 0, i32 4
%.tmp6554 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6555 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6556 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6555, i32 0, i32 6
%.tmp6557 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6556
%.tmp6558 = call %m1830$.Type.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$node_to_type.m1830$.Type.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6554, %m286$.Node.type* %.tmp6557)
store %m1830$.Type.type* %.tmp6558, %m1830$.Type.type** %.tmp6553
%.tmp6559 = load %m1830$.Type.type*, %m1830$.Type.type** %curr_t
%.tmp6560 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6559, i32 0, i32 4
%.tmp6561 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6560
%.tmp6562 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6561, i32 0, i32 1
%.tmp6563 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6564 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6563, i32 0, i32 7
%.tmp6565 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6564
%.tmp6566 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6565, i32 0, i32 1
%.tmp6567 = load i8*, i8** %.tmp6566
store i8* %.tmp6567, i8** %.tmp6562
%.tmp6568 = load %m1830$.Type.type*, %m1830$.Type.type** %curr_t
%.tmp6569 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6568, i32 0, i32 4
%.tmp6570 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6569
store %m1830$.Type.type* %.tmp6570, %m1830$.Type.type** %curr_t
%.tmp6571 = load %m286$.Node.type*, %m286$.Node.type** %curr_type
%.tmp6572 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6571, i32 0, i32 7
%.tmp6573 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6572
%.tmp6575 = getelementptr [5 x i8], [5 x i8]*@.str6574, i32 0, i32 0
%.tmp6576 = call %m286$.Node.type*(%m286$.Node.type*,i8*) @m1830$skip_to_type.m286$.Node.typep.m286$.Node.typep.cp(%m286$.Node.type* %.tmp6573, i8* %.tmp6575)
store %m286$.Node.type* %.tmp6576, %m286$.Node.type** %curr_type
br label %.for.start.6543
.for.end.6543:
br label %.if.end.6523
.if.false.6523:
br label %.if.end.6523
.if.end.6523:
br label %.if.end.6508
.if.false.6508:
%.tmp6577 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6578 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6577, i32 0, i32 0
%.tmp6579 = load i8*, i8** %.tmp6578
%.tmp6581 = getelementptr [5 x i8], [5 x i8]*@.str6580, i32 0, i32 0
%.tmp6582 = call i32(i8*,i8*) @strcmp(i8* %.tmp6579, i8* %.tmp6581)
%.tmp6583 = icmp eq i32 %.tmp6582, 0
br i1 %.tmp6583, label %.if.true.6584, label %.if.false.6584
.if.true.6584:
%.tmp6585 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6586 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6585, i32 0, i32 0
%.tmp6587 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6588 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6587, i32 0, i32 1
%.tmp6589 = load i8*, i8** %.tmp6588
store i8* %.tmp6589, i8** %.tmp6586
br label %.if.end.6584
.if.false.6584:
%.tmp6590 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6591 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6590, i32 0, i32 0
%.tmp6592 = load i8*, i8** %.tmp6591
%.tmp6594 = getelementptr [12 x i8], [12 x i8]*@.str6593, i32 0, i32 0
%.tmp6595 = call i32(i8*,i8*) @strcmp(i8* %.tmp6592, i8* %.tmp6594)
%.tmp6596 = icmp eq i32 %.tmp6595, 0
br i1 %.tmp6596, label %.if.true.6597, label %.if.false.6597
.if.true.6597:
%err_msg = alloca i8*
%.tmp6598 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6599 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6600 = call %m1830$.ScopeItem.type*(%m1830$.CompilerCtx.type*,%m286$.Node.type*) @m1830$find_defined.m1830$.ScopeItem.typep.m1830$.CompilerCtx.typep.m286$.Node.typep(%m1830$.CompilerCtx.type* %.tmp6598, %m286$.Node.type* %.tmp6599)
%base = alloca %m1830$.ScopeItem.type*
store %m1830$.ScopeItem.type* %.tmp6600, %m1830$.ScopeItem.type** %base
%.tmp6601 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6602 = icmp eq %m1830$.ScopeItem.type* %.tmp6601, null
br i1 %.tmp6602, label %.if.true.6603, label %.if.false.6603
.if.true.6603:
%.tmp6604 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6606 = getelementptr [37 x i8], [37 x i8]*@.str6605, i32 0, i32 0
%.tmp6607 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6608 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6607, i32 0, i32 6
%.tmp6609 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6608
%.tmp6610 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6609, i32 0, i32 1
%.tmp6611 = load i8*, i8** %.tmp6610
%.tmp6612 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6604, i8* %.tmp6606, i8* %.tmp6611)
%.tmp6613 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6614 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6615 = load i8*, i8** %err_msg
call void(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$new_error.v.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp6613, %m286$.Node.type* %.tmp6614, i8* %.tmp6615)
%.tmp6616 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6617 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6616, i32 0, i32 0
%.tmp6619 = getelementptr [6 x i8], [6 x i8]*@.str6618, i32 0, i32 0
store i8* %.tmp6619, i8** %.tmp6617
%.tmp6620 = load %m1830$.Type.type*, %m1830$.Type.type** %t
ret %m1830$.Type.type* %.tmp6620
br label %.if.end.6603
.if.false.6603:
br label %.if.end.6603
.if.end.6603:
%.tmp6621 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6622 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6621, i32 0, i32 0
%.tmp6624 = getelementptr [10 x i8], [10 x i8]*@.str6623, i32 0, i32 0
store i8* %.tmp6624, i8** %.tmp6622
%.tmp6625 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6626 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6625, i32 0, i32 1
%.tmp6627 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6628 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp6627, i32 0, i32 0
%.tmp6629 = load i8*, i8** %.tmp6628
store i8* %.tmp6629, i8** %.tmp6626
%.tmp6630 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6631 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6630, i32 0, i32 2
%.tmp6632 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6633 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp6632, i32 0, i32 1
%.tmp6634 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp6633
%.tmp6635 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6634, i32 0, i32 0
%.tmp6636 = load i8*, i8** %.tmp6635
store i8* %.tmp6636, i8** %.tmp6631
%.tmp6637 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6638 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6637, i32 0, i32 3
%.tmp6639 = load %m1830$.ScopeItem.type*, %m1830$.ScopeItem.type** %base
%.tmp6640 = getelementptr %m1830$.ScopeItem.type, %m1830$.ScopeItem.type* %.tmp6639, i32 0, i32 1
%.tmp6641 = load %m1830$.AssignableInfo.type*, %m1830$.AssignableInfo.type** %.tmp6640
%.tmp6642 = getelementptr %m1830$.AssignableInfo.type, %m1830$.AssignableInfo.type* %.tmp6641, i32 0, i32 3
%.tmp6643 = load %m1830$.Type.type*, %m1830$.Type.type** %.tmp6642
store %m1830$.Type.type* %.tmp6643, %m1830$.Type.type** %.tmp6638
br label %.if.end.6597
.if.false.6597:
%.tmp6644 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6645 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6644, i32 0, i32 1
%.tmp6646 = load i8*, i8** %.tmp6645
%.tmp6648 = getelementptr [4 x i8], [4 x i8]*@.str6647, i32 0, i32 0
%.tmp6649 = call i32(i8*,i8*) @strcmp(i8* %.tmp6646, i8* %.tmp6648)
%.tmp6650 = icmp eq i32 %.tmp6649, 0
br i1 %.tmp6650, label %.if.true.6651, label %.if.false.6651
.if.true.6651:
%.tmp6652 = load %m1830$.Type.type*, %m1830$.Type.type** %t
%.tmp6653 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6652, i32 0, i32 0
%.tmp6655 = getelementptr [7 x i8], [7 x i8]*@.str6654, i32 0, i32 0
store i8* %.tmp6655, i8** %.tmp6653
br label %.if.end.6651
.if.false.6651:
%.tmp6656 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %ctx
%.tmp6657 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6659 = getelementptr [54 x i8], [54 x i8]*@.str6658, i32 0, i32 0
%.tmp6660 = call i8*(%m1830$.CompilerCtx.type*,%m286$.Node.type*,i8*) @m1830$err_tmpl.cp.m1830$.CompilerCtx.typep.m286$.Node.typep.cp(%m1830$.CompilerCtx.type* %.tmp6656, %m286$.Node.type* %.tmp6657, i8* %.tmp6659)
%.tmp6661 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6662 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6661, i32 0, i32 0
%.tmp6663 = load i8*, i8** %.tmp6662
%.tmp6664 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6665 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6664, i32 0, i32 1
%.tmp6666 = load i8*, i8** %.tmp6665
%.tmp6667 = call i32(i8*,...) @printf(i8* %.tmp6660, i8* %.tmp6663, i8* %.tmp6666)
br label %.if.end.6651
.if.end.6651:
br label %.if.end.6597
.if.end.6597:
br label %.if.end.6584
.if.end.6584:
br label %.if.end.6508
.if.end.6508:
%.tmp6669 = load %m286$.Node.type*, %m286$.Node.type** %stmt
%.tmp6670 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6669, i32 0, i32 7
%.tmp6671 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6670
%ptr = alloca %m286$.Node.type*
store %m286$.Node.type* %.tmp6671, %m286$.Node.type** %ptr
br label %.for.start.6668
.for.start.6668:
%.tmp6672 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6673 = icmp ne %m286$.Node.type* %.tmp6672, null
br i1 %.tmp6673, label %.for.continue.6668, label %.for.end.6668
.for.continue.6668:
%.tmp6674 = call %m1830$.Type.type*() @m1830$new_type.m1830$.Type.typep()
%pt = alloca %m1830$.Type.type*
store %m1830$.Type.type* %.tmp6674, %m1830$.Type.type** %pt
%.tmp6675 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp6676 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6675, i32 0, i32 0
%.tmp6678 = getelementptr [4 x i8], [4 x i8]*@.str6677, i32 0, i32 0
store i8* %.tmp6678, i8** %.tmp6676
%.tmp6679 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
%.tmp6680 = getelementptr %m1830$.Type.type, %m1830$.Type.type* %.tmp6679, i32 0, i32 3
%.tmp6681 = load %m1830$.Type.type*, %m1830$.Type.type** %t
store %m1830$.Type.type* %.tmp6681, %m1830$.Type.type** %.tmp6680
%.tmp6682 = load %m1830$.Type.type*, %m1830$.Type.type** %pt
store %m1830$.Type.type* %.tmp6682, %m1830$.Type.type** %t
%.tmp6683 = load %m286$.Node.type*, %m286$.Node.type** %ptr
%.tmp6684 = getelementptr %m286$.Node.type, %m286$.Node.type* %.tmp6683, i32 0, i32 7
%.tmp6685 = load %m286$.Node.type*, %m286$.Node.type** %.tmp6684
store %m286$.Node.type* %.tmp6685, %m286$.Node.type** %ptr
br label %.for.start.6668
.for.end.6668:
%.tmp6686 = load %m1830$.Type.type*, %m1830$.Type.type** %t
ret %m1830$.Type.type* %.tmp6686
}
@.str2513 = constant [5 x i8] c"%s{\0A\00"
@.str2517 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2524 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2531 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2543 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2547 = constant [10 x i8] c"%s  of: \0A\00"
@.str2561 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2565 = constant [12 x i8] c"%s  next: \0A\00"
@.str2574 = constant [5 x i8] c"%s}\0A\00"
@.str2632 = constant [5 x i8] c"%c%s\00"
@.str2643 = constant [7 x i8] c".tmp%d\00"
@.str2721 = constant [1 x i8] c"\00"
@.str2751 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2782 = constant [6 x i8] c"start\00"
@.str2794 = constant [6 x i8] c"start\00"
@.str2806 = constant [13 x i8] c"head_comment\00"
@.str2871 = constant [7 x i8] c"string\00"
@.str2880 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2910 = constant [5 x i8] c"%s%s\00"
@.str2918 = constant [9 x i8] c"function\00"
@.str2924 = constant [5 x i8] c"main\00"
@.str2936 = constant [6 x i8] c"%s.%s\00"
@.str2953 = constant [3 x i8] c"NL\00"
@.str2961 = constant [7 x i8] c"global\00"
@.str2969 = constant [11 x i8] c"assignable\00"
@.str2997 = constant [9 x i8] c"variable\00"
@.str3008 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3023 = constant [10 x i8] c"typealias\00"
@.str3043 = constant [11 x i8] c"%s.%s.type\00"
@.str3055 = constant [10 x i8] c"typealias\00"
@.str3076 = constant [5 x i8] c"type\00"
@.str3103 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3116 = constant [7 x i8] c"extern\00"
@.str3134 = constant [7 x i8] c"extern\00"
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
@.str4403 = constant [11 x i8] c"assignable\00"
@.str4417 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4432 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4439 = constant [6 x i8] c"block\00"
@.str4447 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4454 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4461 = constant [11 x i8] c"elif_block\00"
@.str4472 = constant [11 x i8] c"else_block\00"
@.str4482 = constant [6 x i8] c"block\00"
@.str4492 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4499 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4519 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4527 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4576 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4597 = constant [7 x i8] c"module\00"
@.str4626 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str4668 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str4676 = constant [9 x i8] c"function\00"
@.str4683 = constant [7 x i8] c"extern\00"
@.str4695 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str4716 = constant [9 x i8] c"variable\00"
@.str4736 = constant [4 x i8] c"ptr\00"
@.str4754 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str4778 = constant [10 x i8] c"typealias\00"
@.str4789 = constant [7 x i8] c"struct\00"
@.str4795 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str4846 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str4866 = constant [9 x i8] c"variable\00"
@.str4876 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4897 = constant [9 x i8] c"variable\00"
@.str4905 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str4917 = constant [12 x i8] c"destination\00"
@.str4922 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str4948 = constant [25 x i8] c"name '%s' is not defined\00"
@.str4966 = constant [7 x i8] c"module\00"
@.str4988 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5052 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5072 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5095 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5118 = constant [16 x i8] c"mono_assignable\00"
@.str5140 = constant [5 x i8] c"cast\00"
@.str5149 = constant [5 x i8] c"type\00"
@.str5164 = constant [26 x i8] c"%s = bitcast %s %s to %s\0A\00"
@.str5189 = constant [16 x i8] c"mono_assignable\00"
@.str5247 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5270 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5277 = constant [2 x i8] c"+\00"
@.str5282 = constant [4 x i8] c"add\00"
@.str5287 = constant [2 x i8] c"-\00"
@.str5292 = constant [4 x i8] c"sub\00"
@.str5297 = constant [2 x i8] c"*\00"
@.str5302 = constant [4 x i8] c"mul\00"
@.str5307 = constant [2 x i8] c"/\00"
@.str5312 = constant [5 x i8] c"sdiv\00"
@.str5317 = constant [3 x i8] c"==\00"
@.str5322 = constant [8 x i8] c"icmp eq\00"
@.str5327 = constant [3 x i8] c"!=\00"
@.str5332 = constant [8 x i8] c"icmp ne\00"
@.str5337 = constant [2 x i8] c">\00"
@.str5342 = constant [9 x i8] c"icmp sgt\00"
@.str5347 = constant [2 x i8] c"<\00"
@.str5352 = constant [9 x i8] c"icmp slt\00"
@.str5357 = constant [2 x i8] c"&\00"
@.str5362 = constant [4 x i8] c"and\00"
@.str5367 = constant [2 x i8] c"|\00"
@.str5372 = constant [3 x i8] c"or\00"
@.str5377 = constant [3 x i8] c">=\00"
@.str5382 = constant [9 x i8] c"icmp sge\00"
@.str5387 = constant [3 x i8] c"<=\00"
@.str5392 = constant [9 x i8] c"icmp sle\00"
@.str5396 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5403 = constant [4 x i8] c"add\00"
@.str5409 = constant [3 x i8] c"==\00"
@.str5416 = constant [3 x i8] c"!=\00"
@.str5424 = constant [2 x i8] c"|\00"
@.str5432 = constant [2 x i8] c"&\00"
@.str5440 = constant [2 x i8] c">\00"
@.str5448 = constant [2 x i8] c"<\00"
@.str5456 = constant [3 x i8] c">=\00"
@.str5464 = constant [3 x i8] c"<=\00"
@.str5472 = constant [5 x i8] c"bool\00"
@.str5476 = constant [4 x i8] c"int\00"
@.str5486 = constant [7 x i8] c"NUMBER\00"
@.str5500 = constant [4 x i8] c"int\00"
@.str5514 = constant [5 x i8] c"WORD\00"
@.str5524 = constant [5 x i8] c"null\00"
@.str5531 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5545 = constant [5 x i8] c"null\00"
@.str5554 = constant [8 x i8] c"nullptr\00"
@.str5561 = constant [17 x i8] c"addr_destination\00"
@.str5573 = constant [12 x i8] c"destination\00"
@.str5612 = constant [4 x i8] c"ptr\00"
@.str5631 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str5643 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5657 = constant [8 x i8] c"boolean\00"
@.str5671 = constant [5 x i8] c"bool\00"
@.str5680 = constant [6 x i8] c"false\00"
@.str5687 = constant [2 x i8] c"0\00"
@.str5691 = constant [2 x i8] c"1\00"
@.str5698 = constant [8 x i8] c"fn_call\00"
@.str5715 = constant [7 x i8] c"STRING\00"
@.str5739 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str5755 = constant [4 x i8] c"ptr\00"
@.str5768 = constant [4 x i8] c"chr\00"
@.str5775 = constant [4 x i8] c"CHR\00"
@.str5790 = constant [2 x i8] c"0\00"
@.str5800 = constant [6 x i8] c"'\5C%x'\00"
@.str5807 = constant [3 x i8] c"%d\00"
@.str5819 = constant [5 x i8] c"'%c'\00"
@.str5826 = constant [3 x i8] c"%d\00"
@.str5831 = constant [18 x i8] c"Invalid character\00"
@.str5844 = constant [4 x i8] c"chr\00"
@.str5848 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str5876 = constant [22 x i8] c"called 'abbr' on null\00"
@.str5882 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str5887 = constant [4 x i8] c"int\00"
@.str5892 = constant [2 x i8] c"i\00"
@.str5897 = constant [5 x i8] c"bool\00"
@.str5902 = constant [2 x i8] c"b\00"
@.str5907 = constant [5 x i8] c"void\00"
@.str5912 = constant [2 x i8] c"v\00"
@.str5917 = constant [4 x i8] c"chr\00"
@.str5922 = constant [2 x i8] c"c\00"
@.str5927 = constant [4 x i8] c"str\00"
@.str5932 = constant [3 x i8] c"cp\00"
@.str5937 = constant [4 x i8] c"ptr\00"
@.str5943 = constant [4 x i8] c"%sp\00"
@.str5954 = constant [10 x i8] c"typealias\00"
@.str5965 = constant [6 x i8] c"error\00"
@.str5970 = constant [2 x i8] c"?\00"
@.str5972 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str5982 = constant [7 x i8] c".str%d\00"
@.str6005 = constant [6 x i8] c"array\00"
@.str6018 = constant [4 x i8] c"chr\00"
@.str6036 = constant [3 x i8] c"%d\00"
@.str6045 = constant [7 x i8] c"string\00"
@.str6064 = constant [7 x i8] c"module\00"
@.str6098 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6104 = constant [2 x i8] c"?\00"
@.str6110 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6115 = constant [4 x i8] c"int\00"
@.str6120 = constant [4 x i8] c"i32\00"
@.str6125 = constant [5 x i8] c"void\00"
@.str6130 = constant [5 x i8] c"void\00"
@.str6135 = constant [5 x i8] c"bool\00"
@.str6140 = constant [3 x i8] c"i1\00"
@.str6145 = constant [8 x i8] c"nullptr\00"
@.str6150 = constant [4 x i8] c"ptr\00"
@.str6155 = constant [4 x i8] c"chr\00"
@.str6160 = constant [3 x i8] c"i8\00"
@.str6165 = constant [9 x i8] c"function\00"
@.str6171 = constant [4 x i8] c"%s(\00"
@.str6196 = constant [4 x i8] c"%s,\00"
@.str6201 = constant [5 x i8] c"%s%s\00"
@.str6212 = constant [4 x i8] c"%s)\00"
@.str6220 = constant [4 x i8] c"ptr\00"
@.str6226 = constant [4 x i8] c"%s*\00"
@.str6238 = constant [7 x i8] c"struct\00"
@.str6244 = constant [2 x i8] c"{\00"
@.str6260 = constant [4 x i8] c"%s,\00"
@.str6265 = constant [5 x i8] c"%s%s\00"
@.str6276 = constant [4 x i8] c"%s}\00"
@.str6284 = constant [6 x i8] c"array\00"
@.str6290 = constant [10 x i8] c"[%s x %s]\00"
@.str6309 = constant [10 x i8] c"typealias\00"
@.str6315 = constant [5 x i8] c"%%%s\00"
@.str6325 = constant [4 x i8] c"str\00"
@.str6330 = constant [4 x i8] c"i8*\00"
@.str6335 = constant [7 x i8] c"vararg\00"
@.str6340 = constant [4 x i8] c"...\00"
@.str6345 = constant [6 x i8] c"error\00"
@.str6350 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6419 = constant [9 x i8] c"function\00"
@.str6434 = constant [5 x i8] c"WORD\00"
@.str6490 = constant [10 x i8] c"fn_params\00"
@.str6504 = constant [10 x i8] c"structdef\00"
@.str6511 = constant [7 x i8] c"struct\00"
@.str6518 = constant [5 x i8] c"type\00"
@.str6547 = constant [5 x i8] c"type\00"
@.str6574 = constant [5 x i8] c"type\00"
@.str6580 = constant [5 x i8] c"WORD\00"
@.str6593 = constant [12 x i8] c"dotted_name\00"
@.str6605 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6618 = constant [6 x i8] c"error\00"
@.str6623 = constant [10 x i8] c"typealias\00"
@.str6647 = constant [4 x i8] c"...\00"
@.str6654 = constant [7 x i8] c"vararg\00"
@.str6658 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str6677 = constant [4 x i8] c"ptr\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6687 = load i32, i32* %argc
%.tmp6688 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp6687, i8** %.tmp6688)
%.tmp6689 = load i32, i32* @STDERR
%.tmp6691 = getelementptr [2 x i8], [2 x i8]*@.str6690, i32 0, i32 0
%.tmp6692 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp6689, i8* %.tmp6691)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6692, %m0$.File.type** %stderr
%.tmp6693 = load i8**, i8*** %argv
%.tmp6694 = getelementptr i8*, i8** %.tmp6693, i32 1
%.tmp6695 = load i8*, i8** %.tmp6694
%filename = alloca i8*
store i8* %.tmp6695, i8** %filename
%.tmp6696 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6696, %m0$.File.type** %llvm_code
%.tmp6697 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6698 = load i8*, i8** %filename
%.tmp6699 = call %m1830$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1830$new_context.m1830$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp6697, i8* %.tmp6698)
%compiler_ctx = alloca %m1830$.CompilerCtx.type*
store %m1830$.CompilerCtx.type* %.tmp6699, %m1830$.CompilerCtx.type** %compiler_ctx
%.tmp6700 = load %m1830$.CompilerCtx.type*, %m1830$.CompilerCtx.type** %compiler_ctx
%.tmp6701 = load i8*, i8** %filename
%.tmp6702 = call i1(%m1830$.CompilerCtx.type*,i8*) @m1830$compile_file.b.m1830$.CompilerCtx.typep.cp(%m1830$.CompilerCtx.type* %.tmp6700, i8* %.tmp6701)
br i1 %.tmp6702, label %.if.true.6703, label %.if.false.6703
.if.true.6703:
%.tmp6704 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6706 = getelementptr [34 x i8], [34 x i8]*@.str6705, i32 0, i32 0
%.tmp6707 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6704, i8* %.tmp6706)
ret i32 1
br label %.if.end.6703
.if.false.6703:
br label %.if.end.6703
.if.end.6703:
%.tmp6708 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6709 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp6708)
%.tmp6710 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6711 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp6710)
%llvm_code_size = alloca i32
store i32 %.tmp6711, i32* %llvm_code_size
%.tmp6712 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6712)
%.tmp6714 = getelementptr [30 x i8], [30 x i8]*@.str6713, i32 0, i32 0
%.tmp6716 = getelementptr [2 x i8], [2 x i8]*@.str6715, i32 0, i32 0
%.tmp6717 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6714, i8* %.tmp6716)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6717, %m0$.File.type** %proc
%.tmp6718 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6719 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6718)
%.tmp6720 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6721 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6720)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp6719, i32 %.tmp6721)
%.tmp6722 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6723 = icmp eq %m0$.File.type* %.tmp6722, null
br i1 %.tmp6723, label %.if.true.6724, label %.if.false.6724
.if.true.6724:
%.tmp6725 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6727 = getelementptr [28 x i8], [28 x i8]*@.str6726, i32 0, i32 0
%.tmp6728 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6725, i8* %.tmp6727)
ret i32 0
br label %.if.end.6724
.if.false.6724:
br label %.if.end.6724
.if.end.6724:
%.tmp6729 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6730 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6729)
%.tmp6731 = icmp ne i32 %.tmp6730, 0
br i1 %.tmp6731, label %.if.true.6732, label %.if.false.6732
.if.true.6732:
%.tmp6733 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6735 = getelementptr [24 x i8], [24 x i8]*@.str6734, i32 0, i32 0
%.tmp6736 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6733, i8* %.tmp6735)
ret i32 0
br label %.if.end.6732
.if.false.6732:
br label %.if.end.6732
.if.end.6732:
%.tmp6738 = getelementptr [17 x i8], [17 x i8]*@.str6737, i32 0, i32 0
%.tmp6740 = getelementptr [2 x i8], [2 x i8]*@.str6739, i32 0, i32 0
%.tmp6741 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6738, i8* %.tmp6740)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6741, %m0$.File.type** %gcc_proc
%.tmp6742 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp6743 = icmp eq %m0$.File.type* %.tmp6742, null
br i1 %.tmp6743, label %.if.true.6744, label %.if.false.6744
.if.true.6744:
%.tmp6745 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6747 = getelementptr [28 x i8], [28 x i8]*@.str6746, i32 0, i32 0
%.tmp6748 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6745, i8* %.tmp6747)
ret i32 0
br label %.if.end.6744
.if.false.6744:
br label %.if.end.6744
.if.end.6744:
%.tmp6749 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6750 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6749)
%.tmp6751 = icmp ne i32 %.tmp6750, 0
br i1 %.tmp6751, label %.if.true.6752, label %.if.false.6752
.if.true.6752:
%.tmp6753 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6755 = getelementptr [23 x i8], [23 x i8]*@.str6754, i32 0, i32 0
%.tmp6756 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6753, i8* %.tmp6755)
br label %.if.end.6752
.if.false.6752:
%.tmp6758 = getelementptr [32 x i8], [32 x i8]*@.str6757, i32 0, i32 0
%.tmp6759 = load i8*, i8** %filename
%.tmp6760 = call i32(i8*,...) @printf(i8* %.tmp6758, i8* %.tmp6759)
br label %.if.end.6752
.if.end.6752:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6761 = load i32, i32* %argc
%.tmp6762 = icmp eq i32 %.tmp6761, 2
br i1 %.tmp6762, label %.if.true.6763, label %.if.false.6763
.if.true.6763:
ret void
br label %.if.end.6763
.if.false.6763:
br label %.if.end.6763
.if.end.6763:
%.tmp6765 = getelementptr [21 x i8], [21 x i8]*@.str6764, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp6765, i8** %tmpl
%.tmp6766 = load i8**, i8*** %argv
%.tmp6767 = getelementptr i8*, i8** %.tmp6766, i32 0
%.tmp6768 = load i8*, i8** %.tmp6767
%.tmp6769 = call i32(i8*) @strlen(i8* %.tmp6768)
%.tmp6770 = load i8*, i8** %tmpl
%.tmp6771 = call i32(i8*) @strlen(i8* %.tmp6770)
%.tmp6772 = add i32 %.tmp6769, %.tmp6771
%len_filename = alloca i32
store i32 %.tmp6772, i32* %len_filename
%.tmp6773 = load i32, i32* %len_filename
%.tmp6774 = call i8*(i32) @malloc(i32 %.tmp6773)
%buf = alloca i8*
store i8* %.tmp6774, i8** %buf
%.tmp6775 = load i8*, i8** %buf
%.tmp6776 = load i8*, i8** %tmpl
%.tmp6777 = load i8**, i8*** %argv
%.tmp6778 = getelementptr i8*, i8** %.tmp6777, i32 0
%.tmp6779 = load i8*, i8** %.tmp6778
%.tmp6780 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp6775, i8* %.tmp6776, i8* %.tmp6779)
%.tmp6781 = load i8*, i8** %buf
%.tmp6782 = call i32(i8*) @puts(i8* %.tmp6781)
%.tmp6783 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp6783)
call void(i32) @exit(i32 1)
ret void
}
@.str6690 = constant [2 x i8] c"w\00"
@.str6705 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str6713 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str6715 = constant [2 x i8] c"w\00"
@.str6726 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6734 = constant [24 x i8] c"error on llc execution\0A\00"
@.str6737 = constant [17 x i8] c"gcc out.s -o out\00"
@.str6739 = constant [2 x i8] c"w\00"
@.str6746 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6754 = constant [23 x i8] c"error on gcc execution\00"
@.str6757 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str6764 = constant [21 x i8] c"Usage: %s <filename>\00"
