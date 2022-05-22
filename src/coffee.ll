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
%idx.26 = alloca i32
store i32 0, i32* %idx.26
br label %.for.start.25
.for.start.25:
%.tmp27 = load i32, i32* %idx.26
%.tmp28 = load i8*, i8** %string
%.tmp29 = getelementptr i8, i8* %.tmp28, i32 %.tmp27
%.tmp30 = load i8, i8* %.tmp29
%.tmp31 = icmp ne i8 %.tmp30, 0
br i1 %.tmp31, label %.for.continue.25, label %.for.end.25
.for.continue.25:
%.tmp32 = load i32, i32* %idx.26
%.tmp33 = load i8*, i8** %string
%.tmp34 = getelementptr i8, i8* %.tmp33, i32 %.tmp32
%.tmp35 = load i8, i8* %.tmp34
%c.36 = alloca i8
store i8 %.tmp35, i8* %c.36
%.tmp37 = load i8, i8* %c.36
%.tmp38 = icmp eq i8 %.tmp37, 95
br i1 %.tmp38, label %.if.true.39, label %.if.false.39
.if.true.39:
br label %.if.end.39
.if.false.39:
%.tmp40 = load i8, i8* %c.36
%.tmp41 = icmp slt i8 %.tmp40, 97
%.tmp42 = load i8, i8* %c.36
%.tmp43 = icmp sgt i8 %.tmp42, 122
%.tmp44 = or i1 %.tmp41, %.tmp43
br i1 %.tmp44, label %.if.true.45, label %.if.false.45
.if.true.45:
ret i1 0
br label %.if.end.45
.if.false.45:
br label %.if.end.45
.if.end.45:
br label %.if.end.39
.if.end.39:
%.tmp46 = load i32, i32* %idx.26
%.tmp47 = add i32 %.tmp46, 1
store i32 %.tmp47, i32* %idx.26
br label %.for.start.25
.for.end.25:
ret i1 1
}
define i1 @m3$is_upper.b.cp(i8* %.string.arg) {
%string = alloca i8*
store i8* %.string.arg, i8** %string
%idx.49 = alloca i32
store i32 0, i32* %idx.49
br label %.for.start.48
.for.start.48:
%.tmp50 = load i32, i32* %idx.49
%.tmp51 = load i8*, i8** %string
%.tmp52 = getelementptr i8, i8* %.tmp51, i32 %.tmp50
%.tmp53 = load i8, i8* %.tmp52
%.tmp54 = icmp ne i8 %.tmp53, 0
br i1 %.tmp54, label %.for.continue.48, label %.for.end.48
.for.continue.48:
%.tmp55 = load i32, i32* %idx.49
%.tmp56 = load i8*, i8** %string
%.tmp57 = getelementptr i8, i8* %.tmp56, i32 %.tmp55
%.tmp58 = load i8, i8* %.tmp57
%c.59 = alloca i8
store i8 %.tmp58, i8* %c.59
%.tmp60 = load i8, i8* %c.59
%.tmp61 = icmp eq i8 %.tmp60, 95
br i1 %.tmp61, label %.if.true.62, label %.if.false.62
.if.true.62:
br label %.if.end.62
.if.false.62:
%.tmp63 = load i8, i8* %c.59
%.tmp64 = icmp slt i8 %.tmp63, 65
%.tmp65 = load i8, i8* %c.59
%.tmp66 = icmp sgt i8 %.tmp65, 90
%.tmp67 = or i1 %.tmp64, %.tmp66
br i1 %.tmp67, label %.if.true.68, label %.if.false.68
.if.true.68:
ret i1 0
br label %.if.end.68
.if.false.68:
br label %.if.end.68
.if.end.68:
br label %.if.end.62
.if.end.62:
%.tmp69 = load i32, i32* %idx.49
%.tmp70 = add i32 %.tmp69, 1
store i32 %.tmp70, i32* %idx.49
br label %.for.start.48
.for.end.48:
ret i1 1
}
declare i8* @strcpy(i8*, i8*)
declare i8* @strncpy(i8*, i8*, i32)
declare i8 @toupper(i8)
declare i8* @strstr(i8*, i8*)
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
%.tmp71 = load i1, i1* %condition
%.tmp72 = icmp ne i1 %.tmp71, 1
br i1 %.tmp72, label %.if.true.73, label %.if.false.73
.if.true.73:
%.tmp74 = load i8*, i8** %message
%.tmp75 = call i32(i8*) @strlen(i8* %.tmp74)
%size.76 = alloca i32
store i32 %.tmp75, i32* %size.76
%.tmp77 = load i8*, i8** %message
%.tmp78 = load i32, i32* %size.76
%.tmp79 = call i32(i32,i8*,i32) @write(i32 1, i8* %.tmp77, i32 %.tmp78)
call void(i32) @exit(i32 1)
br label %.if.end.73
.if.false.73:
br label %.if.end.73
.if.end.73:
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
%i.81 = alloca i32
store i32 0, i32* %i.81
br label %.for.start.80
.for.start.80:
%.tmp82 = load i32, i32* %i.81
%.tmp83 = load i32, i32* %n
%.tmp84 = icmp slt i32 %.tmp82, %.tmp83
br i1 %.tmp84, label %.for.continue.80, label %.for.end.80
.for.continue.80:
%.tmp85 = load i32, i32* %i.81
%.tmp86 = load i8*, i8** %buf
%.tmp87 = getelementptr i8, i8* %.tmp86, i32 %.tmp85
%.tmp88 = load i8, i8* %val
store i8 %.tmp88, i8* %.tmp87
%.tmp89 = load i32, i32* %i.81
%.tmp90 = add i32 %.tmp89, 1
store i32 %.tmp90, i32* %i.81
br label %.for.start.80
.for.end.80:
%.tmp91 = load i8*, i8** %buf
ret i8* %.tmp91
}
declare i32 @pipe(i32*)
declare %m0$.File.type* @popen(i8*, i8*)
declare i32 @pclose(%m0$.File.type*)
define i8* @m2$dirname.cp.cp(i8* %.path.arg) {
%path = alloca i8*
store i8* %.path.arg, i8** %path
%.tmp92 = load i8*, i8** %path
%.tmp93 = icmp eq i8* %.tmp92, null
br i1 %.tmp93, label %.if.true.94, label %.if.false.94
.if.true.94:
%.tmp95 = bitcast ptr null to i8*
ret i8* %.tmp95
br label %.if.end.94
.if.false.94:
br label %.if.end.94
.if.end.94:
%end_idx.96 = alloca i32
store i32 0, i32* %end_idx.96
%stop.97 = alloca i1
store i1 0, i1* %stop.97
%.tmp99 = load i8*, i8** %path
%.tmp100 = call i32(i8*) @strlen(i8* %.tmp99)
%.tmp101 = sub i32 %.tmp100, 1
store i32 %.tmp101, i32* %end_idx.96
br label %.for.start.98
.for.start.98:
%.tmp102 = load i32, i32* %end_idx.96
%.tmp103 = icmp sgt i32 %.tmp102, 0
%.tmp104 = load i1, i1* %stop.97
%.tmp105 = icmp eq i1 %.tmp104, 0
%.tmp106 = and i1 %.tmp103, %.tmp105
br i1 %.tmp106, label %.for.continue.98, label %.for.end.98
.for.continue.98:
%.tmp107 = load i32, i32* %end_idx.96
%.tmp108 = load i8*, i8** %path
%.tmp109 = getelementptr i8, i8* %.tmp108, i32 %.tmp107
%.tmp110 = load i8, i8* %.tmp109
%.tmp111 = icmp eq i8 %.tmp110, 47
br i1 %.tmp111, label %.if.true.112, label %.if.false.112
.if.true.112:
store i1 1, i1* %stop.97
br label %.if.end.112
.if.false.112:
%.tmp113 = load i32, i32* %end_idx.96
%.tmp114 = sub i32 %.tmp113, 1
store i32 %.tmp114, i32* %end_idx.96
br label %.if.end.112
.if.end.112:
br label %.for.start.98
.for.end.98:
%.tmp115 = load i32, i32* %end_idx.96
%.tmp116 = add i32 %.tmp115, 1
%.tmp117 = call i8*(i32) @malloc(i32 %.tmp116)
%.tmp118 = bitcast i8* %.tmp117 to i8*
%path_dirname.119 = alloca i8*
store i8* %.tmp118, i8** %path_dirname.119
%i.121 = alloca i32
store i32 0, i32* %i.121
br label %.for.start.120
.for.start.120:
%.tmp122 = load i32, i32* %i.121
%.tmp123 = load i32, i32* %end_idx.96
%.tmp124 = icmp slt i32 %.tmp122, %.tmp123
br i1 %.tmp124, label %.for.continue.120, label %.for.end.120
.for.continue.120:
%.tmp125 = load i32, i32* %i.121
%.tmp126 = load i8*, i8** %path_dirname.119
%.tmp127 = getelementptr i8, i8* %.tmp126, i32 %.tmp125
%.tmp128 = load i32, i32* %i.121
%.tmp129 = load i8*, i8** %path
%.tmp130 = getelementptr i8, i8* %.tmp129, i32 %.tmp128
%.tmp131 = load i8, i8* %.tmp130
store i8 %.tmp131, i8* %.tmp127
%.tmp132 = load i32, i32* %i.121
%.tmp133 = add i32 %.tmp132, 1
store i32 %.tmp133, i32* %i.121
br label %.for.start.120
.for.end.120:
%.tmp134 = load i32, i32* %end_idx.96
%.tmp135 = load i8*, i8** %path_dirname.119
%.tmp136 = getelementptr i8, i8* %.tmp135, i32 %.tmp134
store i8 0, i8* %.tmp136
%.tmp137 = load i8*, i8** %path_dirname.119
ret i8* %.tmp137
}
declare i8* @basename(i8*)
declare i8* @getcwd(i8*, i32)
declare i8* @realpath(i8*, i8*)
declare i8* @getenv(i8*)
define i8* @m1$readall.cp.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%buf_len.138 = alloca i32
store i32 1024, i32* %buf_len.138
%.tmp139 = load i32, i32* %buf_len.138
%.tmp140 = call i8*(i32) @malloc(i32 %.tmp139)
%buf.141 = alloca i8*
store i8* %.tmp140, i8** %buf.141
%content_len.142 = alloca i32
store i32 0, i32* %content_len.142
%.tmp143 = call i8*(i32) @malloc(i32 1)
%content.144 = alloca i8*
store i8* %.tmp143, i8** %content.144
%.tmp145 = load i8*, i8** %content.144
%.tmp146 = getelementptr i8, i8* %.tmp145, i32 0
store i8 0, i8* %.tmp146
%.tmp147 = load i32, i32* %fd
%.tmp148 = load i8*, i8** %buf.141
%.tmp149 = load i32, i32* %buf_len.138
%.tmp150 = call i32(i32,i8*,i32) @read(i32 %.tmp147, i8* %.tmp148, i32 %.tmp149)
%read_bytes.151 = alloca i32
store i32 %.tmp150, i32* %read_bytes.151
br label %.for.start.152
.for.start.152:
%.tmp153 = load i32, i32* %read_bytes.151
%.tmp154 = icmp sgt i32 %.tmp153, 0
br i1 %.tmp154, label %.for.continue.152, label %.for.end.152
.for.continue.152:
%.tmp155 = load i8*, i8** %content.144
%.tmp156 = load i32, i32* %content_len.142
%.tmp157 = load i32, i32* %read_bytes.151
%.tmp158 = add i32 %.tmp156, %.tmp157
%.tmp159 = call i8*(i8*,i32) @realloc(i8* %.tmp155, i32 %.tmp158)
store i8* %.tmp159, i8** %content.144
%i.161 = alloca i32
store i32 0, i32* %i.161
br label %.for.start.160
.for.start.160:
%.tmp162 = load i32, i32* %i.161
%.tmp163 = load i32, i32* %read_bytes.151
%.tmp164 = icmp slt i32 %.tmp162, %.tmp163
br i1 %.tmp164, label %.for.continue.160, label %.for.end.160
.for.continue.160:
%.tmp165 = load i32, i32* %i.161
%.tmp166 = load i32, i32* %content_len.142
%.tmp167 = add i32 %.tmp165, %.tmp166
%.tmp168 = load i8*, i8** %content.144
%.tmp169 = getelementptr i8, i8* %.tmp168, i32 %.tmp167
%.tmp170 = load i32, i32* %i.161
%.tmp171 = load i8*, i8** %buf.141
%.tmp172 = getelementptr i8, i8* %.tmp171, i32 %.tmp170
%.tmp173 = load i8, i8* %.tmp172
store i8 %.tmp173, i8* %.tmp169
%.tmp174 = load i32, i32* %i.161
%.tmp175 = add i32 %.tmp174, 1
store i32 %.tmp175, i32* %i.161
br label %.for.start.160
.for.end.160:
%.tmp176 = load i32, i32* %content_len.142
%.tmp177 = load i32, i32* %read_bytes.151
%.tmp178 = add i32 %.tmp176, %.tmp177
store i32 %.tmp178, i32* %content_len.142
%.tmp179 = load i32, i32* %fd
%.tmp180 = load i8*, i8** %buf.141
%.tmp181 = load i32, i32* %buf_len.138
%.tmp182 = call i32(i32,i8*,i32) @read(i32 %.tmp179, i8* %.tmp180, i32 %.tmp181)
store i32 %.tmp182, i32* %read_bytes.151
br label %.for.start.152
.for.end.152:
%.tmp183 = load i32, i32* %content_len.142
%.tmp184 = sub i32 %.tmp183, 1
%.tmp185 = load i8*, i8** %content.144
%.tmp186 = getelementptr i8, i8* %.tmp185, i32 %.tmp184
store i8 0, i8* %.tmp186
%.tmp187 = load i8*, i8** %buf.141
call void(i8*) @free(i8* %.tmp187)
%.tmp188 = load i8*, i8** %content.144
ret i8* %.tmp188
}
define void @m1$copy.v.i.i(i32 %.dest.arg, i32 %.src.arg) {
%dest = alloca i32
store i32 %.dest.arg, i32* %dest
%src = alloca i32
store i32 %.src.arg, i32* %src
%buf_size.189 = alloca i32
store i32 4096, i32* %buf_size.189
%.tmp190 = call i8*(i32) @malloc(i32 4096)
%buf.191 = alloca i8*
store i8* %.tmp190, i8** %buf.191
%to_write.192 = alloca i32
store i32 1, i32* %to_write.192
br label %.for.start.193
.for.start.193:
%.tmp194 = load i32, i32* %to_write.192
%.tmp195 = icmp sgt i32 %.tmp194, 0
br i1 %.tmp195, label %.for.continue.193, label %.for.end.193
.for.continue.193:
%.tmp196 = load i32, i32* %src
%.tmp197 = load i8*, i8** %buf.191
%.tmp198 = load i32, i32* %buf_size.189
%.tmp199 = call i32(i32,i8*,i32) @read(i32 %.tmp196, i8* %.tmp197, i32 %.tmp198)
store i32 %.tmp199, i32* %to_write.192
%.tmp200 = load i32, i32* %dest
%.tmp201 = load i8*, i8** %buf.191
%.tmp202 = load i32, i32* %to_write.192
%.tmp203 = call i32(i32,i8*,i32) @write(i32 %.tmp200, i8* %.tmp201, i32 %.tmp202)
br label %.for.start.193
.for.end.193:
ret void
}
define %m0$.File.type* @m1$str_as_file.m0$.File.typep.cp(i8* %.file_content.arg) {
%file_content = alloca i8*
store i8* %.file_content.arg, i8** %file_content
%.tmp204 = call i8*(i32) @malloc(i32 16)
%.tmp205 = bitcast i8* %.tmp204 to i32*
%pp.206 = alloca i32*
store i32* %.tmp205, i32** %pp.206
%.tmp207 = load i32*, i32** %pp.206
%.tmp208 = call i32(i32*) @pipe(i32* %.tmp207)
%.tmp209 = load i32, i32* @STDOUT
%.tmp210 = load i32*, i32** %pp.206
%.tmp211 = getelementptr i32, i32* %.tmp210, i32 %.tmp209
%.tmp212 = load i32, i32* %.tmp211
%.tmp213 = load i8*, i8** %file_content
%.tmp214 = load i8*, i8** %file_content
%.tmp215 = call i32(i8*) @strlen(i8* %.tmp214)
%.tmp216 = call i32(i32,i8*,i32) @write(i32 %.tmp212, i8* %.tmp213, i32 %.tmp215)
%.tmp217 = load i32, i32* @STDOUT
%.tmp218 = load i32*, i32** %pp.206
%.tmp219 = getelementptr i32, i32* %.tmp218, i32 %.tmp217
%.tmp220 = load i32, i32* %.tmp219
%.tmp221 = call i32(i32) @close(i32 %.tmp220)
%.tmp222 = load i32, i32* @STDIN
%.tmp223 = load i32*, i32** %pp.206
%.tmp224 = getelementptr i32, i32* %.tmp223, i32 %.tmp222
%.tmp225 = load i32, i32* %.tmp224
%.tmp227 = getelementptr [2 x i8], [2 x i8]*@.str226, i32 0, i32 0
%.tmp228 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp225, i8* %.tmp227)
ret %m0$.File.type* %.tmp228
}
@.str226 = constant [2 x i8] c"r\00"
%m229$.PeekerInfo.type = type {i32,i32,i32,i32,i8,i1,i8*}
@EOF = constant i32 0
define i8 @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.p.arg) {
%p = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.p.arg, %m229$.PeekerInfo.type** %p
%.tmp230 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp231 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp230, i32 0, i32 5
%.tmp232 = load i1, i1* %.tmp231
br i1 %.tmp232, label %.if.true.233, label %.if.false.233
.if.true.233:
ret i8 0
br label %.if.end.233
.if.false.233:
br label %.if.end.233
.if.end.233:
%.tmp234 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp235 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp234, i32 0, i32 4
%.tmp236 = load i8, i8* %.tmp235
%.tmp237 = icmp eq i8 %.tmp236, 10
br i1 %.tmp237, label %.if.true.238, label %.if.false.238
.if.true.238:
%.tmp239 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp240 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp239, i32 0, i32 2
%.tmp241 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp242 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp241, i32 0, i32 2
%.tmp243 = load i32, i32* %.tmp242
%.tmp244 = add i32 %.tmp243, 1
store i32 %.tmp244, i32* %.tmp240
%.tmp245 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp246 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp245, i32 0, i32 3
store i32 0, i32* %.tmp246
br label %.if.end.238
.if.false.238:
br label %.if.end.238
.if.end.238:
%.tmp247 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp248 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp247, i32 0, i32 1
%.tmp249 = load i32, i32* %.tmp248
%.tmp250 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp251 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp250, i32 0, i32 4
%.tmp252 = getelementptr i8, i8* %.tmp251, i32 0
%.tmp253 = call i32(i32,i8*,i32) @read(i32 %.tmp249, i8* %.tmp252, i32 1)
%.tmp254 = icmp eq i32 %.tmp253, 0
br i1 %.tmp254, label %.if.true.255, label %.if.false.255
.if.true.255:
%.tmp256 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp257 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp256, i32 0, i32 4
store i8 0, i8* %.tmp257
%.tmp258 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp259 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp258, i32 0, i32 5
store i1 1, i1* %.tmp259
%.tmp260 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp261 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp260, i32 0, i32 4
%.tmp262 = load i8, i8* %.tmp261
ret i8 %.tmp262
br label %.if.end.255
.if.false.255:
br label %.if.end.255
.if.end.255:
%.tmp263 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp264 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp263, i32 0, i32 3
%.tmp265 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp266 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp265, i32 0, i32 3
%.tmp267 = load i32, i32* %.tmp266
%.tmp268 = add i32 %.tmp267, 1
store i32 %.tmp268, i32* %.tmp264
%.tmp269 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp270 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp269, i32 0, i32 0
%.tmp271 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp272 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp271, i32 0, i32 0
%.tmp273 = load i32, i32* %.tmp272
%.tmp274 = add i32 %.tmp273, 1
store i32 %.tmp274, i32* %.tmp270
%.tmp275 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp276 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp275, i32 0, i32 4
%.tmp277 = load i8, i8* %.tmp276
ret i8 %.tmp277
}
define void @m229$seek.v.m229$.PeekerInfo.typep.i(%m229$.PeekerInfo.type* %.p.arg, i32 %.pos.arg) {
%p = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.p.arg, %m229$.PeekerInfo.type** %p
%pos = alloca i32
store i32 %.pos.arg, i32* %pos
%.tmp278 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp279 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp278, i32 0, i32 1
%.tmp280 = load i32, i32* %.tmp279
%.tmp281 = load i32, i32* %pos
%.tmp282 = load i32, i32* @SEEK_SET
%.tmp283 = call i32(i32,i32,i32) @lseek(i32 %.tmp280, i32 %.tmp281, i32 %.tmp282)
ret void
}
define %m229$.PeekerInfo.type* @m229$new.m229$.PeekerInfo.typep.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%.tmp284 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* null, i32 1
%.tmp285 = ptrtoint %m229$.PeekerInfo.type* %.tmp284 to i32
%.tmp286 = call i8*(i32) @malloc(i32 %.tmp285)
%.tmp287 = bitcast i8* %.tmp286 to %m229$.PeekerInfo.type*
%p.288 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp287, %m229$.PeekerInfo.type** %p.288
%.tmp289 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp290 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp289, i32 0, i32 0
store i32 0, i32* %.tmp290
%.tmp291 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp292 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp291, i32 0, i32 2
store i32 1, i32* %.tmp292
%.tmp293 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp294 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp293, i32 0, i32 3
store i32 0, i32* %.tmp294
%.tmp295 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp296 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp295, i32 0, i32 1
%.tmp297 = load i32, i32* %fd
store i32 %.tmp297, i32* %.tmp296
%.tmp298 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp299 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp298, i32 0, i32 4
store i8 0, i8* %.tmp299
%.tmp300 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp301 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp300, i32 0, i32 5
store i1 0, i1* %.tmp301
%.tmp302 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
%.tmp303 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp302, i32 0, i32 6
%.tmp305 = getelementptr [1 x i8], [1 x i8]*@.str304, i32 0, i32 0
store i8* %.tmp305, i8** %.tmp303
%.tmp306 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.288
ret %m229$.PeekerInfo.type* %.tmp306
}
@.str304 = constant [1 x i8] c"\00"
%m308$.Token.type = type {i8*,i8*,i32,i32,i8*,%m308$.Token.type*,%m308$.Token.type*}
%m308$.ParseCtx.type = type {i8*,i32,i32,%m308$.Token.type*,%m308$.Token.type*}
define %m308$.Token.type* @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.c.arg, i8* %.type.arg, i8* %.value.arg) {
%c = alloca %m308$.ParseCtx.type*
store %m308$.ParseCtx.type* %.c.arg, %m308$.ParseCtx.type** %c
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp309 = getelementptr %m308$.Token.type, %m308$.Token.type* null, i32 1
%.tmp310 = ptrtoint %m308$.Token.type* %.tmp309 to i32
%.tmp311 = call i8*(i32) @malloc(i32 %.tmp310)
%.tmp312 = bitcast i8* %.tmp311 to %m308$.Token.type*
%root.313 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp312, %m308$.Token.type** %root.313
%.tmp314 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp315 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp314, i32 0, i32 0
%.tmp316 = load i8*, i8** %type
store i8* %.tmp316, i8** %.tmp315
%.tmp317 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp318 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp317, i32 0, i32 1
%.tmp319 = load i8*, i8** %value
store i8* %.tmp319, i8** %.tmp318
%.tmp320 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp321 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp320, i32 0, i32 4
%.tmp322 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp323 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp322, i32 0, i32 0
%.tmp324 = load i8*, i8** %.tmp323
store i8* %.tmp324, i8** %.tmp321
%.tmp325 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp326 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp325, i32 0, i32 2
%.tmp327 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp328 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp327, i32 0, i32 1
%.tmp329 = load i32, i32* %.tmp328
store i32 %.tmp329, i32* %.tmp326
%.tmp330 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp331 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp330, i32 0, i32 3
%.tmp332 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp333 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp332, i32 0, i32 2
%.tmp334 = load i32, i32* %.tmp333
store i32 %.tmp334, i32* %.tmp331
%.tmp335 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp336 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp335, i32 0, i32 6
%.tmp337 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp338 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp337, i32 0, i32 4
%.tmp339 = load %m308$.Token.type*, %m308$.Token.type** %.tmp338
store %m308$.Token.type* %.tmp339, %m308$.Token.type** %.tmp336
%.tmp340 = load %m308$.Token.type*, %m308$.Token.type** %root.313
%.tmp341 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp340, i32 0, i32 5
store %m308$.Token.type* null, %m308$.Token.type** %.tmp341
%.tmp342 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp343 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp342, i32 0, i32 4
%.tmp344 = load %m308$.Token.type*, %m308$.Token.type** %.tmp343
%.tmp345 = icmp ne %m308$.Token.type* %.tmp344, null
br i1 %.tmp345, label %.if.true.346, label %.if.false.346
.if.true.346:
%.tmp347 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp348 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp347, i32 0, i32 4
%.tmp349 = load %m308$.Token.type*, %m308$.Token.type** %.tmp348
%.tmp350 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp349, i32 0, i32 5
%.tmp351 = load %m308$.Token.type*, %m308$.Token.type** %root.313
store %m308$.Token.type* %.tmp351, %m308$.Token.type** %.tmp350
br label %.if.end.346
.if.false.346:
br label %.if.end.346
.if.end.346:
%.tmp352 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp353 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp352, i32 0, i32 4
%.tmp354 = load %m308$.Token.type*, %m308$.Token.type** %root.313
store %m308$.Token.type* %.tmp354, %m308$.Token.type** %.tmp353
%.tmp355 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp356 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp355, i32 0, i32 3
%.tmp357 = load %m308$.Token.type*, %m308$.Token.type** %.tmp356
%.tmp358 = icmp eq %m308$.Token.type* %.tmp357, null
br i1 %.tmp358, label %.if.true.359, label %.if.false.359
.if.true.359:
%.tmp360 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %c
%.tmp361 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp360, i32 0, i32 3
%.tmp362 = load %m308$.Token.type*, %m308$.Token.type** %root.313
store %m308$.Token.type* %.tmp362, %m308$.Token.type** %.tmp361
br label %.if.end.359
.if.false.359:
br label %.if.end.359
.if.end.359:
%.tmp363 = load %m308$.Token.type*, %m308$.Token.type** %root.313
ret %m308$.Token.type* %.tmp363
}
define %m308$.Token.type* @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.p.arg, i1 %.keep_comments.arg) {
%p = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.p.arg, %m229$.PeekerInfo.type** %p
%keep_comments = alloca i1
store i1 %.keep_comments.arg, i1* %keep_comments
%.tmp364 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* null, i32 1
%.tmp365 = ptrtoint %m308$.ParseCtx.type* %.tmp364 to i32
%.tmp366 = call i8*(i32) @malloc(i32 %.tmp365)
%.tmp367 = bitcast i8* %.tmp366 to %m308$.ParseCtx.type*
%ctx.368 = alloca %m308$.ParseCtx.type*
store %m308$.ParseCtx.type* %.tmp367, %m308$.ParseCtx.type** %ctx.368
%.tmp369 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp370 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp369, i32 0, i32 0
%.tmp371 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp372 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp371, i32 0, i32 6
%.tmp373 = load i8*, i8** %.tmp372
store i8* %.tmp373, i8** %.tmp370
%.tmp374 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp375 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp374, i32 0, i32 3
store %m308$.Token.type* null, %m308$.Token.type** %.tmp375
%.tmp376 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp377 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp376, i32 0, i32 4
store %m308$.Token.type* null, %m308$.Token.type** %.tmp377
%max_token_size.378 = alloca i32
store i32 128, i32* %max_token_size.378
%.tmp379 = bitcast ptr null to i8*
%buf.380 = alloca i8*
store i8* %.tmp379, i8** %buf.380
%idx.381 = alloca i32
store i32 0, i32* %idx.381
%.tmp382 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp383 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp382)
%c.384 = alloca i8
store i8 %.tmp383, i8* %c.384
br label %.for.start.385
.for.start.385:
%.tmp386 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp387 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp386, i32 0, i32 5
%.tmp388 = load i1, i1* %.tmp387
%.tmp389 = icmp eq i1 %.tmp388, 0
br i1 %.tmp389, label %.for.continue.385, label %.for.end.385
.for.continue.385:
%.tmp390 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp391 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp390, i32 0, i32 1
%.tmp392 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp393 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp392, i32 0, i32 2
%.tmp394 = load i32, i32* %.tmp393
store i32 %.tmp394, i32* %.tmp391
%.tmp395 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp396 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp395, i32 0, i32 2
%.tmp397 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp398 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp397, i32 0, i32 3
%.tmp399 = load i32, i32* %.tmp398
store i32 %.tmp399, i32* %.tmp396
%.tmp400 = load i8, i8* %c.384
%.tmp401 = icmp eq i8 %.tmp400, 0
br i1 %.tmp401, label %.if.true.402, label %.if.false.402
.if.true.402:
%.tmp403 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp404 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp403)
store i8 %.tmp404, i8* %c.384
br label %.if.end.402
.if.false.402:
%.tmp405 = load i8, i8* %c.384
%.tmp406 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp405)
br i1 %.tmp406, label %.if.true.407, label %.if.false.407
.if.true.407:
%.tmp408 = load i32, i32* %max_token_size.378
%.tmp409 = call i8*(i32) @malloc(i32 %.tmp408)
store i8* %.tmp409, i8** %buf.380
store i32 0, i32* %idx.381
br label %.for.start.410
.for.start.410:
%.tmp411 = load i8, i8* %c.384
%.tmp412 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp411)
br i1 %.tmp412, label %.for.continue.410, label %.for.end.410
.for.continue.410:
%.tmp413 = load i32, i32* %idx.381
%.tmp414 = load i8*, i8** %buf.380
%.tmp415 = getelementptr i8, i8* %.tmp414, i32 %.tmp413
%.tmp416 = load i8, i8* %c.384
store i8 %.tmp416, i8* %.tmp415
%.tmp417 = load i32, i32* %idx.381
%.tmp418 = add i32 %.tmp417, 1
store i32 %.tmp418, i32* %idx.381
%.tmp419 = load i32, i32* %idx.381
%.tmp420 = load i32, i32* %max_token_size.378
%.tmp421 = icmp slt i32 %.tmp419, %.tmp420
%.tmp423 = getelementptr [16 x i8], [16 x i8]*@.str422, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp421, i8* %.tmp423)
%.tmp424 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp425 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp424)
store i8 %.tmp425, i8* %c.384
br label %.for.start.410
.for.end.410:
%.tmp426 = load i32, i32* %idx.381
%.tmp427 = load i8*, i8** %buf.380
%.tmp428 = getelementptr i8, i8* %.tmp427, i32 %.tmp426
store i8 0, i8* %.tmp428
%.tmp429 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp431 = getelementptr [7 x i8], [7 x i8]*@.str430, i32 0, i32 0
%.tmp432 = load i8*, i8** %buf.380
%.tmp433 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp429, i8* %.tmp431, i8* %.tmp432)
br label %.if.end.407
.if.false.407:
%.tmp434 = load i8, i8* %c.384
%.tmp435 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp434)
%.tmp436 = load i8, i8* %c.384
%.tmp437 = icmp eq i8 %.tmp436, 95
%.tmp438 = or i1 %.tmp435, %.tmp437
br i1 %.tmp438, label %.if.true.439, label %.if.false.439
.if.true.439:
%.tmp440 = load i32, i32* %max_token_size.378
%.tmp441 = call i8*(i32) @malloc(i32 %.tmp440)
store i8* %.tmp441, i8** %buf.380
store i32 0, i32* %idx.381
br label %.for.start.442
.for.start.442:
%.tmp443 = load i8, i8* %c.384
%.tmp444 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp443)
%.tmp445 = load i8, i8* %c.384
%.tmp446 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp445)
%.tmp447 = or i1 %.tmp444, %.tmp446
%.tmp448 = load i8, i8* %c.384
%.tmp449 = icmp eq i8 %.tmp448, 95
%.tmp450 = or i1 %.tmp447, %.tmp449
br i1 %.tmp450, label %.for.continue.442, label %.for.end.442
.for.continue.442:
%.tmp451 = load i32, i32* %idx.381
%.tmp452 = load i8*, i8** %buf.380
%.tmp453 = getelementptr i8, i8* %.tmp452, i32 %.tmp451
%.tmp454 = load i8, i8* %c.384
store i8 %.tmp454, i8* %.tmp453
%.tmp455 = load i32, i32* %idx.381
%.tmp456 = add i32 %.tmp455, 1
store i32 %.tmp456, i32* %idx.381
%.tmp457 = load i32, i32* %idx.381
%.tmp458 = load i32, i32* %max_token_size.378
%.tmp459 = icmp slt i32 %.tmp457, %.tmp458
%.tmp461 = getelementptr [15 x i8], [15 x i8]*@.str460, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp459, i8* %.tmp461)
%.tmp462 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp463 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp462)
store i8 %.tmp463, i8* %c.384
br label %.for.start.442
.for.end.442:
%.tmp464 = load i32, i32* %idx.381
%.tmp465 = load i8*, i8** %buf.380
%.tmp466 = getelementptr i8, i8* %.tmp465, i32 %.tmp464
store i8 0, i8* %.tmp466
%.tmp467 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp469 = getelementptr [5 x i8], [5 x i8]*@.str468, i32 0, i32 0
%.tmp470 = load i8*, i8** %buf.380
%.tmp471 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp467, i8* %.tmp469, i8* %.tmp470)
br label %.if.end.439
.if.false.439:
%.tmp472 = load i8, i8* %c.384
%.tmp473 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp472)
br i1 %.tmp473, label %.if.true.474, label %.if.false.474
.if.true.474:
%.tmp475 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp476 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp475)
store i8 %.tmp476, i8* %c.384
br label %.if.end.474
.if.false.474:
%.tmp477 = load i8, i8* %c.384
%.tmp478 = icmp eq i8 %.tmp477, 34
%.tmp479 = load i8, i8* %c.384
%.tmp480 = icmp eq i8 %.tmp479, 96
%.tmp481 = or i1 %.tmp478, %.tmp480
br i1 %.tmp481, label %.if.true.482, label %.if.false.482
.if.true.482:
%.tmp483 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp484 = load i8, i8* %c.384
%.tmp485 = call i8*(%m229$.PeekerInfo.type*,i8) @m308$read_string.cp.m229$.PeekerInfo.typep.c(%m229$.PeekerInfo.type* %.tmp483, i8 %.tmp484)
store i8* %.tmp485, i8** %buf.380
%.tmp486 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp487 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp486)
store i8 %.tmp487, i8* %c.384
%.tmp488 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp490 = getelementptr [7 x i8], [7 x i8]*@.str489, i32 0, i32 0
%.tmp491 = load i8*, i8** %buf.380
%.tmp492 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp488, i8* %.tmp490, i8* %.tmp491)
br label %.if.end.482
.if.false.482:
%.tmp493 = load i8, i8* %c.384
%.tmp494 = icmp eq i8 %.tmp493, 39
br i1 %.tmp494, label %.if.true.495, label %.if.false.495
.if.true.495:
%.tmp496 = load i32, i32* %max_token_size.378
%.tmp497 = call i8*(i32) @malloc(i32 %.tmp496)
store i8* %.tmp497, i8** %buf.380
%.tmp498 = load i8*, i8** %buf.380
%.tmp499 = getelementptr i8, i8* %.tmp498, i32 0
%.tmp500 = load i8, i8* %c.384
store i8 %.tmp500, i8* %.tmp499
%.tmp501 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp502 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp501)
store i8 %.tmp502, i8* %c.384
store i32 1, i32* %idx.381
br label %.for.start.503
.for.start.503:
%.tmp504 = load i8, i8* %c.384
%.tmp505 = icmp ne i8 %.tmp504, 39
br i1 %.tmp505, label %.for.continue.503, label %.for.end.503
.for.continue.503:
%.tmp506 = load i32, i32* %idx.381
%.tmp507 = load i32, i32* %max_token_size.378
%.tmp508 = sub i32 %.tmp507, 2
%.tmp509 = icmp slt i32 %.tmp506, %.tmp508
%.tmp511 = getelementptr [15 x i8], [15 x i8]*@.str510, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp509, i8* %.tmp511)
%.tmp512 = load i32, i32* %idx.381
%.tmp513 = load i8*, i8** %buf.380
%.tmp514 = getelementptr i8, i8* %.tmp513, i32 %.tmp512
%.tmp515 = load i8, i8* %c.384
store i8 %.tmp515, i8* %.tmp514
%.tmp516 = load i32, i32* %idx.381
%.tmp517 = add i32 %.tmp516, 1
store i32 %.tmp517, i32* %idx.381
%.tmp518 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp519 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp518)
store i8 %.tmp519, i8* %c.384
br label %.for.start.503
.for.end.503:
%.tmp520 = load i32, i32* %idx.381
%.tmp521 = load i8*, i8** %buf.380
%.tmp522 = getelementptr i8, i8* %.tmp521, i32 %.tmp520
%.tmp523 = load i8, i8* %c.384
store i8 %.tmp523, i8* %.tmp522
%.tmp524 = load i32, i32* %idx.381
%.tmp525 = add i32 %.tmp524, 1
%.tmp526 = load i8*, i8** %buf.380
%.tmp527 = getelementptr i8, i8* %.tmp526, i32 %.tmp525
store i8 0, i8* %.tmp527
%.tmp528 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp529 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp528)
store i8 %.tmp529, i8* %c.384
%.tmp530 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp532 = getelementptr [4 x i8], [4 x i8]*@.str531, i32 0, i32 0
%.tmp533 = load i8*, i8** %buf.380
%.tmp534 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp530, i8* %.tmp532, i8* %.tmp533)
br label %.if.end.495
.if.false.495:
%.tmp535 = load i8, i8* %c.384
%.tmp536 = icmp eq i8 %.tmp535, 10
br i1 %.tmp536, label %.if.true.537, label %.if.false.537
.if.true.537:
%.tmp538 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp540 = getelementptr [3 x i8], [3 x i8]*@.str539, i32 0, i32 0
%.tmp542 = getelementptr [2 x i8], [2 x i8]*@.str541, i32 0, i32 0
%.tmp543 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp538, i8* %.tmp540, i8* %.tmp542)
%.tmp544 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp545 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp544)
store i8 %.tmp545, i8* %c.384
br label %.if.end.537
.if.false.537:
%.tmp546 = load i8, i8* %c.384
%.tmp547 = icmp eq i8 %.tmp546, 45
br i1 %.tmp547, label %.if.true.548, label %.if.false.548
.if.true.548:
%.tmp549 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp550 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp549)
store i8 %.tmp550, i8* %c.384
%.tmp551 = load i8, i8* %c.384
%.tmp552 = icmp eq i8 %.tmp551, 45
br i1 %.tmp552, label %.if.true.553, label %.if.false.553
.if.true.553:
%.tmp554 = load i32, i32* %max_token_size.378
%.tmp555 = call i8*(i32) @malloc(i32 %.tmp554)
store i8* %.tmp555, i8** %buf.380
%.tmp556 = load i8*, i8** %buf.380
%.tmp557 = getelementptr i8, i8* %.tmp556, i32 0
store i8 45, i8* %.tmp557
store i32 1, i32* %idx.381
br label %.for.start.558
.for.start.558:
%.tmp559 = load i8, i8* %c.384
%.tmp560 = icmp ne i8 %.tmp559, 10
%.tmp561 = load i8, i8* %c.384
%.tmp562 = icmp ne i8 %.tmp561, 0
%.tmp563 = and i1 %.tmp560, %.tmp562
br i1 %.tmp563, label %.for.continue.558, label %.for.end.558
.for.continue.558:
%.tmp564 = load i32, i32* %idx.381
%.tmp565 = load i8*, i8** %buf.380
%.tmp566 = getelementptr i8, i8* %.tmp565, i32 %.tmp564
%.tmp567 = load i8, i8* %c.384
store i8 %.tmp567, i8* %.tmp566
%.tmp568 = load i32, i32* %idx.381
%.tmp569 = add i32 %.tmp568, 1
store i32 %.tmp569, i32* %idx.381
%.tmp570 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp571 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp570)
store i8 %.tmp571, i8* %c.384
br label %.for.start.558
.for.end.558:
%.tmp572 = load i32, i32* %idx.381
%.tmp573 = load i8*, i8** %buf.380
%.tmp574 = getelementptr i8, i8* %.tmp573, i32 %.tmp572
store i8 0, i8* %.tmp574
%.tmp575 = load i1, i1* %keep_comments
br i1 %.tmp575, label %.if.true.576, label %.if.false.576
.if.true.576:
%.tmp577 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp579 = getelementptr [8 x i8], [8 x i8]*@.str578, i32 0, i32 0
%.tmp580 = load i8*, i8** %buf.380
%.tmp581 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp577, i8* %.tmp579, i8* %.tmp580)
br label %.if.end.576
.if.false.576:
%.tmp582 = load i8*, i8** %buf.380
%.tmp583 = bitcast i8* %.tmp582 to i8*
call void(i8*) @free(i8* %.tmp583)
br label %.if.end.576
.if.end.576:
br label %.if.end.553
.if.false.553:
%.tmp584 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp586 = getelementptr [9 x i8], [9 x i8]*@.str585, i32 0, i32 0
%.tmp588 = getelementptr [2 x i8], [2 x i8]*@.str587, i32 0, i32 0
%.tmp589 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp584, i8* %.tmp586, i8* %.tmp588)
br label %.if.end.553
.if.end.553:
br label %.if.end.548
.if.false.548:
%.tmp590 = load i8, i8* %c.384
%.tmp591 = icmp sgt i8 %.tmp590, 126
br i1 %.tmp591, label %.if.true.592, label %.if.false.592
.if.true.592:
%.tmp594 = getelementptr [47 x i8], [47 x i8]*@.str593, i32 0, i32 0
%.tmp595 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp596 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp595, i32 0, i32 1
%.tmp597 = load i32, i32* %.tmp596
%.tmp598 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp599 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp598, i32 0, i32 2
%.tmp600 = load i32, i32* %.tmp599
%.tmp601 = load i8, i8* %c.384
%.tmp602 = load i8, i8* %c.384
%.tmp603 = call i32(i8*,...) @printf(i8* %.tmp594, i32 %.tmp597, i32 %.tmp600, i8 %.tmp601, i8 %.tmp602)
call void(i32) @exit(i32 1)
br label %.if.end.592
.if.false.592:
br label %.if.end.592
.if.end.592:
%.tmp604 = load i8, i8* %c.384
%prev_c.605 = alloca i8
store i8 %.tmp604, i8* %prev_c.605
%.tmp606 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp607 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp606)
store i8 %.tmp607, i8* %c.384
%.tmp609 = getelementptr [9 x i8], [9 x i8]*@.str608, i32 0, i32 0
%type.610 = alloca i8*
store i8* %.tmp609, i8** %type.610
%.tmp611 = load i8, i8* %prev_c.605
%.tmp612 = icmp eq i8 %.tmp611, 61
%.tmp613 = load i8, i8* %c.384
%.tmp614 = icmp eq i8 %.tmp613, 61
%.tmp615 = and i1 %.tmp612, %.tmp614
br i1 %.tmp615, label %.if.true.616, label %.if.false.616
.if.true.616:
%.tmp617 = getelementptr i8*, i8** %buf.380, i32 0
%.tmp619 = getelementptr [3 x i8], [3 x i8]*@.str618, i32 0, i32 0
%.tmp620 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp617, i8* %.tmp619)
%.tmp621 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp622 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp621)
store i8 %.tmp622, i8* %c.384
br label %.if.end.616
.if.false.616:
%.tmp623 = load i8, i8* %prev_c.605
%.tmp624 = icmp eq i8 %.tmp623, 33
%.tmp625 = load i8, i8* %c.384
%.tmp626 = icmp eq i8 %.tmp625, 61
%.tmp627 = and i1 %.tmp624, %.tmp626
br i1 %.tmp627, label %.if.true.628, label %.if.false.628
.if.true.628:
%.tmp629 = getelementptr i8*, i8** %buf.380, i32 0
%.tmp631 = getelementptr [3 x i8], [3 x i8]*@.str630, i32 0, i32 0
%.tmp632 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp629, i8* %.tmp631)
%.tmp633 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp634 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp633)
store i8 %.tmp634, i8* %c.384
br label %.if.end.628
.if.false.628:
%.tmp635 = load i8, i8* %prev_c.605
%.tmp636 = icmp eq i8 %.tmp635, 62
%.tmp637 = load i8, i8* %c.384
%.tmp638 = icmp eq i8 %.tmp637, 61
%.tmp639 = and i1 %.tmp636, %.tmp638
br i1 %.tmp639, label %.if.true.640, label %.if.false.640
.if.true.640:
%.tmp641 = getelementptr i8*, i8** %buf.380, i32 0
%.tmp643 = getelementptr [3 x i8], [3 x i8]*@.str642, i32 0, i32 0
%.tmp644 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp641, i8* %.tmp643)
%.tmp645 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp646 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp645)
store i8 %.tmp646, i8* %c.384
br label %.if.end.640
.if.false.640:
%.tmp647 = load i8, i8* %prev_c.605
%.tmp648 = icmp eq i8 %.tmp647, 60
%.tmp649 = load i8, i8* %c.384
%.tmp650 = icmp eq i8 %.tmp649, 61
%.tmp651 = and i1 %.tmp648, %.tmp650
br i1 %.tmp651, label %.if.true.652, label %.if.false.652
.if.true.652:
%.tmp653 = getelementptr i8*, i8** %buf.380, i32 0
%.tmp655 = getelementptr [3 x i8], [3 x i8]*@.str654, i32 0, i32 0
%.tmp656 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp653, i8* %.tmp655)
%.tmp657 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp658 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp657)
store i8 %.tmp658, i8* %c.384
br label %.if.end.652
.if.false.652:
%.tmp659 = load i8, i8* %prev_c.605
%.tmp660 = icmp eq i8 %.tmp659, 46
%.tmp661 = load i8, i8* %c.384
%.tmp662 = icmp eq i8 %.tmp661, 46
%.tmp663 = and i1 %.tmp660, %.tmp662
br i1 %.tmp663, label %.if.true.664, label %.if.false.664
.if.true.664:
%.tmp665 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp666 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp665)
store i8 %.tmp666, i8* %c.384
%.tmp667 = load i8, i8* %c.384
%.tmp668 = icmp ne i8 %.tmp667, 46
br i1 %.tmp668, label %.if.true.669, label %.if.false.669
.if.true.669:
%.tmp671 = getelementptr [13 x i8], [13 x i8]*@.str670, i32 0, i32 0
%.tmp672 = call i32(i8*,...) @printf(i8* %.tmp671)
call void(i32) @exit(i32 1)
br label %.if.end.669
.if.false.669:
%.tmp673 = getelementptr i8*, i8** %buf.380, i32 0
%.tmp675 = getelementptr [4 x i8], [4 x i8]*@.str674, i32 0, i32 0
%.tmp676 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp673, i8* %.tmp675)
%.tmp678 = getelementptr [8 x i8], [8 x i8]*@.str677, i32 0, i32 0
store i8* %.tmp678, i8** %type.610
br label %.if.end.669
.if.end.669:
%.tmp679 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp680 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp679)
store i8 %.tmp680, i8* %c.384
br label %.if.end.664
.if.false.664:
%.tmp681 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp681, i8** %buf.380
%.tmp682 = load i8*, i8** %buf.380
%.tmp683 = getelementptr i8, i8* %.tmp682, i32 0
%.tmp684 = load i8, i8* %prev_c.605
store i8 %.tmp684, i8* %.tmp683
%.tmp685 = load i8*, i8** %buf.380
%.tmp686 = getelementptr i8, i8* %.tmp685, i32 1
store i8 0, i8* %.tmp686
br label %.if.end.664
.if.end.664:
br label %.if.end.652
.if.end.652:
br label %.if.end.640
.if.end.640:
br label %.if.end.628
.if.end.628:
br label %.if.end.616
.if.end.616:
%.tmp687 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp688 = load i8*, i8** %type.610
%.tmp689 = load i8*, i8** %buf.380
%.tmp690 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp687, i8* %.tmp688, i8* %.tmp689)
br label %.if.end.548
.if.end.548:
br label %.if.end.537
.if.end.537:
br label %.if.end.495
.if.end.495:
br label %.if.end.482
.if.end.482:
br label %.if.end.474
.if.end.474:
br label %.if.end.439
.if.end.439:
br label %.if.end.407
.if.end.407:
br label %.if.end.402
.if.end.402:
br label %.for.start.385
.for.end.385:
%.tmp691 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp693 = getelementptr [4 x i8], [4 x i8]*@.str692, i32 0, i32 0
%.tmp695 = getelementptr [1 x i8], [1 x i8]*@.str694, i32 0, i32 0
%.tmp696 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp691, i8* %.tmp693, i8* %.tmp695)
%.tmp697 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp698 = getelementptr %m308$.ParseCtx.type, %m308$.ParseCtx.type* %.tmp697, i32 0, i32 3
%.tmp699 = load %m308$.Token.type*, %m308$.Token.type** %.tmp698
%root.700 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp699, %m308$.Token.type** %root.700
%.tmp701 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp702 = bitcast %m308$.ParseCtx.type* %.tmp701 to i8*
call void(i8*) @free(i8* %.tmp702)
%.tmp703 = load %m308$.Token.type*, %m308$.Token.type** %root.700
%.tmp704 = bitcast %m308$.Token.type* %.tmp703 to %m308$.Token.type*
ret %m308$.Token.type* %.tmp704
}
define i8* @m308$read_string.cp.m229$.PeekerInfo.typep.c(%m229$.PeekerInfo.type* %.p.arg, i8 %.delimeter.arg) {
%p = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.p.arg, %m229$.PeekerInfo.type** %p
%delimeter = alloca i8
store i8 %.delimeter.arg, i8* %delimeter
%str_size.705 = alloca i32
store i32 64, i32* %str_size.705
%.tmp706 = load i32, i32* %str_size.705
%.tmp707 = call i8*(i32) @malloc(i32 %.tmp706)
%buf.708 = alloca i8*
store i8* %.tmp707, i8** %buf.708
%.tmp709 = load i8*, i8** %buf.708
%.tmp710 = getelementptr i8, i8* %.tmp709, i32 0
%.tmp711 = load i8, i8* %delimeter
store i8 %.tmp711, i8* %.tmp710
%.tmp712 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp713 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp712)
%c.714 = alloca i8
store i8 %.tmp713, i8* %c.714
%idx.715 = alloca i32
store i32 0, i32* %idx.715
store i32 1, i32* %idx.715
br label %.for.start.716
.for.start.716:
%.tmp717 = load i8, i8* %c.714
%.tmp718 = load i8, i8* %delimeter
%.tmp719 = icmp ne i8 %.tmp717, %.tmp718
br i1 %.tmp719, label %.for.continue.716, label %.for.end.716
.for.continue.716:
%.tmp720 = load i8, i8* %c.714
%.tmp721 = icmp ne i8 %.tmp720, 0
%.tmp723 = getelementptr [61 x i8], [61 x i8]*@.str722, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp721, i8* %.tmp723)
%.tmp724 = load i32, i32* %idx.715
%.tmp725 = load i32, i32* %str_size.705
%.tmp726 = sub i32 %.tmp725, 2
%.tmp727 = icmp eq i32 %.tmp724, %.tmp726
br i1 %.tmp727, label %.if.true.728, label %.if.false.728
.if.true.728:
%.tmp729 = load i32, i32* %str_size.705
%.tmp730 = mul i32 %.tmp729, 2
store i32 %.tmp730, i32* %str_size.705
%.tmp731 = load i8*, i8** %buf.708
%.tmp732 = load i32, i32* %str_size.705
%.tmp733 = call i8*(i8*,i32) @realloc(i8* %.tmp731, i32 %.tmp732)
store i8* %.tmp733, i8** %buf.708
br label %.if.end.728
.if.false.728:
br label %.if.end.728
.if.end.728:
%.tmp734 = load i32, i32* %idx.715
%.tmp735 = load i8*, i8** %buf.708
%.tmp736 = getelementptr i8, i8* %.tmp735, i32 %.tmp734
%.tmp737 = load i8, i8* %c.714
store i8 %.tmp737, i8* %.tmp736
%.tmp738 = load i32, i32* %idx.715
%.tmp739 = add i32 %.tmp738, 1
store i32 %.tmp739, i32* %idx.715
%.tmp740 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp741 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp740)
store i8 %.tmp741, i8* %c.714
br label %.for.start.716
.for.end.716:
%.tmp742 = load i32, i32* %idx.715
%.tmp743 = load i8*, i8** %buf.708
%.tmp744 = getelementptr i8, i8* %.tmp743, i32 %.tmp742
%.tmp745 = load i8, i8* %c.714
store i8 %.tmp745, i8* %.tmp744
%.tmp746 = load i32, i32* %idx.715
%.tmp747 = add i32 %.tmp746, 1
%.tmp748 = load i8*, i8** %buf.708
%.tmp749 = getelementptr i8, i8* %.tmp748, i32 %.tmp747
store i8 0, i8* %.tmp749
%.tmp750 = load i8*, i8** %buf.708
ret i8* %.tmp750
}
@.str422 = constant [16 x i8] c"digit too large\00"
@.str430 = constant [7 x i8] c"NUMBER\00"
@.str460 = constant [15 x i8] c"WORD too large\00"
@.str468 = constant [5 x i8] c"WORD\00"
@.str489 = constant [7 x i8] c"STRING\00"
@.str510 = constant [15 x i8] c"char too large\00"
@.str531 = constant [4 x i8] c"CHR\00"
@.str539 = constant [3 x i8] c"NL\00"
@.str541 = constant [2 x i8] c"\0A\00"
@.str578 = constant [8 x i8] c"COMMENT\00"
@.str585 = constant [9 x i8] c"OPERATOR\00"
@.str587 = constant [2 x i8] c"-\00"
@.str593 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str608 = constant [9 x i8] c"OPERATOR\00"
@.str618 = constant [3 x i8] c"==\00"
@.str630 = constant [3 x i8] c"!=\00"
@.str642 = constant [3 x i8] c">=\00"
@.str654 = constant [3 x i8] c"<=\00"
@.str670 = constant [13 x i8] c"error on ..\0A\00"
@.str674 = constant [4 x i8] c"...\00"
@.str677 = constant [8 x i8] c"KEYWORD\00"
@.str692 = constant [4 x i8] c"EOF\00"
@.str694 = constant [1 x i8] c"\00"
@.str722 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
%m751$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m751$.Error.type* @m751$from.m751$.Error.typep.m308$.Token.typep.cp(%m308$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m308$.Token.type*
store %m308$.Token.type* %.t.arg, %m308$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp752 = load %m308$.Token.type*, %m308$.Token.type** %t
%.tmp753 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp752, i32 0, i32 4
%.tmp754 = load i8*, i8** %.tmp753
%.tmp755 = bitcast i8* %.tmp754 to i8*
%.tmp756 = load %m308$.Token.type*, %m308$.Token.type** %t
%.tmp757 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp756, i32 0, i32 2
%.tmp758 = load i32, i32* %.tmp757
%.tmp759 = load %m308$.Token.type*, %m308$.Token.type** %t
%.tmp760 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp759, i32 0, i32 3
%.tmp761 = load i32, i32* %.tmp760
%.tmp762 = load i8*, i8** %message
%.tmp763 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp755, i32 %.tmp758, i32 %.tmp761, i8* %.tmp762)
ret %m751$.Error.type* %.tmp763
}
define %m751$.Error.type* @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
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
%.tmp766 = bitcast i8* %.tmp765 to %m751$.Error.type*
%e.767 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp766, %m751$.Error.type** %e.767
%.tmp768 = load %m751$.Error.type*, %m751$.Error.type** %e.767
%.tmp769 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp768, i32 0, i32 0
%.tmp770 = load i32, i32* %line
store i32 %.tmp770, i32* %.tmp769
%.tmp771 = load %m751$.Error.type*, %m751$.Error.type** %e.767
%.tmp772 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp771, i32 0, i32 1
%.tmp773 = load i32, i32* %char_of_line
store i32 %.tmp773, i32* %.tmp772
%.tmp774 = load %m751$.Error.type*, %m751$.Error.type** %e.767
%.tmp775 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp774, i32 0, i32 3
%.tmp776 = load i8*, i8** %message
store i8* %.tmp776, i8** %.tmp775
%.tmp777 = load %m751$.Error.type*, %m751$.Error.type** %e.767
%.tmp778 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp777, i32 0, i32 2
%.tmp779 = load i8*, i8** %filename
store i8* %.tmp779, i8** %.tmp778
%.tmp780 = load %m751$.Error.type*, %m751$.Error.type** %e.767
ret %m751$.Error.type* %.tmp780
}
define void @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.e.arg) {
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp782 = getelementptr [22 x i8], [22 x i8]*@.str781, i32 0, i32 0
%.tmp783 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp784 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp783, i32 0, i32 2
%.tmp785 = load i8*, i8** %.tmp784
%.tmp786 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp787 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp786, i32 0, i32 0
%.tmp788 = load i32, i32* %.tmp787
%.tmp789 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp790 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp789, i32 0, i32 1
%.tmp791 = load i32, i32* %.tmp790
%.tmp792 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp793 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp792, i32 0, i32 3
%.tmp794 = load i8*, i8** %.tmp793
%.tmp795 = call i32(i8*,...) @printf(i8* %.tmp782, i8* %.tmp785, i32 %.tmp788, i32 %.tmp791, i8* %.tmp794)
ret void
}
define void @m751$freport.v.m0$.File.typep.m751$.Error.typep(%m0$.File.type* %.fd.arg, %m751$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp796 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp798 = getelementptr [22 x i8], [22 x i8]*@.str797, i32 0, i32 0
%.tmp799 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp800 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp799, i32 0, i32 2
%.tmp801 = load i8*, i8** %.tmp800
%.tmp802 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp803 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp802, i32 0, i32 0
%.tmp804 = load i32, i32* %.tmp803
%.tmp805 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp806 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp805, i32 0, i32 1
%.tmp807 = load i32, i32* %.tmp806
%.tmp808 = load %m751$.Error.type*, %m751$.Error.type** %e
%.tmp809 = getelementptr %m751$.Error.type, %m751$.Error.type* %.tmp808, i32 0, i32 3
%.tmp810 = load i8*, i8** %.tmp809
%.tmp811 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp796, i8* %.tmp798, i8* %.tmp801, i32 %.tmp804, i32 %.tmp807, i8* %.tmp810)
ret void
}
@.str781 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str797 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
%m307$.Query.type = type {i8,i8*,%m307$.Query.type*}
%m307$.Matcher.type = type {%m307$.Query.type*,i8,%m307$.Matcher.type*,%m307$.Matcher.type*}
%m307$.Rule.type = type {i8*,%m307$.Matcher.type*}
%m307$.ParsingContext.type = type {%m308$.Token.type*}
define %m307$.ParsingContext.type* @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp812 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* null, i32 1
%.tmp813 = ptrtoint %m307$.ParsingContext.type* %.tmp812 to i32
%.tmp814 = call i8*(i32) @malloc(i32 %.tmp813)
%.tmp815 = bitcast i8* %.tmp814 to %m307$.ParsingContext.type*
%ctx.816 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp815, %m307$.ParsingContext.type** %ctx.816
%.tmp817 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp818 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp817)
%fd.819 = alloca i32
store i32 %.tmp818, i32* %fd.819
%.tmp820 = load i32, i32* %fd.819
%.tmp821 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp820)
%p.822 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp821, %m229$.PeekerInfo.type** %p.822
%.tmp823 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.822
%.tmp824 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp823, i1 0)
%token_list.825 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp824, %m308$.Token.type** %token_list.825
%.tmp826 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.822
%.tmp827 = bitcast %m229$.PeekerInfo.type* %.tmp826 to i8*
call void(i8*) @free(i8* %.tmp827)
%.tmp828 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx.816
%.tmp829 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp828, i32 0, i32 0
%.tmp830 = load %m308$.Token.type*, %m308$.Token.type** %token_list.825
store %m308$.Token.type* %.tmp830, %m308$.Token.type** %.tmp829
%.tmp831 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx.816
ret %m307$.ParsingContext.type* %.tmp831
}
define %m307$.Matcher.type* @m307$new_matcher.m307$.Matcher.typep() {
%.tmp832 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* null, i32 1
%.tmp833 = ptrtoint %m307$.Matcher.type* %.tmp832 to i32
%.tmp834 = call i8*(i32) @malloc(i32 %.tmp833)
%.tmp835 = bitcast i8* %.tmp834 to %m307$.Matcher.type*
%m.836 = alloca %m307$.Matcher.type*
store %m307$.Matcher.type* %.tmp835, %m307$.Matcher.type** %m.836
%.tmp837 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.836
%.tmp838 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp837, i32 0, i32 1
store i8 49, i8* %.tmp838
%.tmp839 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.836
%.tmp840 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp839, i32 0, i32 2
store %m307$.Matcher.type* null, %m307$.Matcher.type** %.tmp840
%.tmp841 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.836
%.tmp842 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp841, i32 0, i32 3
store %m307$.Matcher.type* null, %m307$.Matcher.type** %.tmp842
%.tmp843 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.836
%.tmp844 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp843, i32 0, i32 0
store %m307$.Query.type* null, %m307$.Query.type** %.tmp844
%.tmp845 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.836
ret %m307$.Matcher.type* %.tmp845
}
define %m307$.Matcher.type* @m307$parse_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.ctx.arg, %m307$.ParsingContext.type** %ctx
%m.846 = alloca %m307$.Matcher.type*
store %m307$.Matcher.type* null, %m307$.Matcher.type** %m.846
%.tmp847 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp848 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp847, i32 0, i32 0
%.tmp849 = load %m308$.Token.type*, %m308$.Token.type** %.tmp848
%.tmp850 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp849, i32 0, i32 1
%.tmp851 = load i8*, i8** %.tmp850
%.tmp853 = getelementptr [2 x i8], [2 x i8]*@.str852, i32 0, i32 0
%.tmp854 = call i32(i8*,i8*) @strcmp(i8* %.tmp851, i8* %.tmp853)
%.tmp855 = icmp eq i32 %.tmp854, 0
br i1 %.tmp855, label %.if.true.856, label %.if.false.856
.if.true.856:
%.tmp857 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp858 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp857, i32 0, i32 0
%.tmp859 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp860 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp859, i32 0, i32 0
%.tmp861 = load %m308$.Token.type*, %m308$.Token.type** %.tmp860
%.tmp862 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp861, i32 0, i32 5
%.tmp863 = load %m308$.Token.type*, %m308$.Token.type** %.tmp862
store %m308$.Token.type* %.tmp863, %m308$.Token.type** %.tmp858
%max_matchers.864 = alloca i32
store i32 10, i32* %max_matchers.864
%.tmp865 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp866 = call %m307$.Matcher.type*(%m307$.ParsingContext.type*) @m307$parse_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp865)
store %m307$.Matcher.type* %.tmp866, %m307$.Matcher.type** %m.846
%.tmp867 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp868 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp867, i32 0, i32 0
%.tmp869 = load %m308$.Token.type*, %m308$.Token.type** %.tmp868
%.tmp870 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp869, i32 0, i32 1
%.tmp871 = load i8*, i8** %.tmp870
%.tmp873 = getelementptr [2 x i8], [2 x i8]*@.str872, i32 0, i32 0
%.tmp874 = call i32(i8*,i8*) @strcmp(i8* %.tmp871, i8* %.tmp873)
%.tmp875 = icmp eq i32 %.tmp874, 0
br i1 %.tmp875, label %.if.true.876, label %.if.false.876
.if.true.876:
%.tmp877 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp878 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp877, i32 0, i32 0
%.tmp879 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp880 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp879, i32 0, i32 0
%.tmp881 = load %m308$.Token.type*, %m308$.Token.type** %.tmp880
%.tmp882 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp881, i32 0, i32 5
%.tmp883 = load %m308$.Token.type*, %m308$.Token.type** %.tmp882
store %m308$.Token.type* %.tmp883, %m308$.Token.type** %.tmp878
%.tmp884 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.846
%last_matcher.885 = alloca %m307$.Matcher.type*
store %m307$.Matcher.type* %.tmp884, %m307$.Matcher.type** %last_matcher.885
br label %.for.start.886
.for.start.886:
%.tmp887 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp888 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp887, i32 0, i32 0
%.tmp889 = load %m308$.Token.type*, %m308$.Token.type** %.tmp888
%.tmp890 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp889, i32 0, i32 1
%.tmp891 = load i8*, i8** %.tmp890
%.tmp893 = getelementptr [2 x i8], [2 x i8]*@.str892, i32 0, i32 0
%.tmp894 = call i32(i8*,i8*) @strcmp(i8* %.tmp891, i8* %.tmp893)
%.tmp895 = icmp ne i32 %.tmp894, 0
%.tmp896 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp897 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp896, i32 0, i32 0
%.tmp898 = load %m308$.Token.type*, %m308$.Token.type** %.tmp897
%.tmp899 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp898, i32 0, i32 0
%.tmp900 = load i8*, i8** %.tmp899
%.tmp902 = getelementptr [4 x i8], [4 x i8]*@.str901, i32 0, i32 0
%.tmp903 = call i32(i8*,i8*) @strcmp(i8* %.tmp900, i8* %.tmp902)
%.tmp904 = icmp ne i32 %.tmp903, 0
%.tmp905 = and i1 %.tmp895, %.tmp904
br i1 %.tmp905, label %.for.continue.886, label %.for.end.886
.for.continue.886:
%.tmp906 = load %m307$.Matcher.type*, %m307$.Matcher.type** %last_matcher.885
%.tmp907 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp906, i32 0, i32 2
%.tmp908 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp909 = call %m307$.Matcher.type*(%m307$.ParsingContext.type*) @m307$parse_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp908)
store %m307$.Matcher.type* %.tmp909, %m307$.Matcher.type** %.tmp907
%.tmp910 = load %m307$.Matcher.type*, %m307$.Matcher.type** %last_matcher.885
%.tmp911 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp910, i32 0, i32 2
%.tmp912 = load %m307$.Matcher.type*, %m307$.Matcher.type** %.tmp911
store %m307$.Matcher.type* %.tmp912, %m307$.Matcher.type** %last_matcher.885
%.tmp913 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp914 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp913, i32 0, i32 0
%.tmp915 = load %m308$.Token.type*, %m308$.Token.type** %.tmp914
%.tmp916 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp915, i32 0, i32 1
%.tmp917 = load i8*, i8** %.tmp916
%.tmp919 = getelementptr [2 x i8], [2 x i8]*@.str918, i32 0, i32 0
%.tmp920 = call i32(i8*,i8*) @strcmp(i8* %.tmp917, i8* %.tmp919)
%.tmp921 = icmp ne i32 %.tmp920, 0
%.tmp922 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp923 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp922, i32 0, i32 0
%.tmp924 = load %m308$.Token.type*, %m308$.Token.type** %.tmp923
%.tmp925 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp924, i32 0, i32 1
%.tmp926 = load i8*, i8** %.tmp925
%.tmp928 = getelementptr [2 x i8], [2 x i8]*@.str927, i32 0, i32 0
%.tmp929 = call i32(i8*,i8*) @strcmp(i8* %.tmp926, i8* %.tmp928)
%.tmp930 = icmp ne i32 %.tmp929, 0
%.tmp931 = and i1 %.tmp921, %.tmp930
br i1 %.tmp931, label %.if.true.932, label %.if.false.932
.if.true.932:
%.tmp934 = getelementptr [48 x i8], [48 x i8]*@.str933, i32 0, i32 0
%.tmp935 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp936 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp935, i32 0, i32 0
%.tmp937 = load %m308$.Token.type*, %m308$.Token.type** %.tmp936
%.tmp938 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp937, i32 0, i32 2
%.tmp939 = load i32, i32* %.tmp938
%.tmp940 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp941 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp940, i32 0, i32 0
%.tmp942 = load %m308$.Token.type*, %m308$.Token.type** %.tmp941
%.tmp943 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp942, i32 0, i32 3
%.tmp944 = load i32, i32* %.tmp943
%.tmp945 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp946 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp945, i32 0, i32 0
%.tmp947 = load %m308$.Token.type*, %m308$.Token.type** %.tmp946
%.tmp948 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp947, i32 0, i32 1
%.tmp949 = load i8*, i8** %.tmp948
%.tmp950 = call i32(i8*,...) @printf(i8* %.tmp934, i32 %.tmp939, i32 %.tmp944, i8* %.tmp949)
call void(i32) @exit(i32 1)
br label %.if.end.932
.if.false.932:
br label %.if.end.932
.if.end.932:
%.tmp951 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp952 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp951, i32 0, i32 0
%.tmp953 = load %m308$.Token.type*, %m308$.Token.type** %.tmp952
%.tmp954 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp953, i32 0, i32 1
%.tmp955 = load i8*, i8** %.tmp954
%.tmp957 = getelementptr [2 x i8], [2 x i8]*@.str956, i32 0, i32 0
%.tmp958 = call i32(i8*,i8*) @strcmp(i8* %.tmp955, i8* %.tmp957)
%.tmp959 = icmp eq i32 %.tmp958, 0
br i1 %.tmp959, label %.if.true.960, label %.if.false.960
.if.true.960:
%.tmp961 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp962 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp961, i32 0, i32 0
%.tmp963 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp964 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp963, i32 0, i32 0
%.tmp965 = load %m308$.Token.type*, %m308$.Token.type** %.tmp964
%.tmp966 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp965, i32 0, i32 5
%.tmp967 = load %m308$.Token.type*, %m308$.Token.type** %.tmp966
store %m308$.Token.type* %.tmp967, %m308$.Token.type** %.tmp962
br label %.if.end.960
.if.false.960:
br label %.if.end.960
.if.end.960:
br label %.for.start.886
.for.end.886:
br label %.if.end.876
.if.false.876:
br label %.if.end.876
.if.end.876:
%.tmp968 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp969 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp968, i32 0, i32 0
%.tmp970 = load %m308$.Token.type*, %m308$.Token.type** %.tmp969
%.tmp971 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp970, i32 0, i32 1
%.tmp972 = load i8*, i8** %.tmp971
%.tmp974 = getelementptr [2 x i8], [2 x i8]*@.str973, i32 0, i32 0
%.tmp975 = call i32(i8*,i8*) @strcmp(i8* %.tmp972, i8* %.tmp974)
%.tmp976 = icmp ne i32 %.tmp975, 0
br i1 %.tmp976, label %.if.true.977, label %.if.false.977
.if.true.977:
%.tmp978 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp980 = getelementptr [22 x i8], [22 x i8]*@.str979, i32 0, i32 0
call void(%m307$.ParsingContext.type*,i8*) @m307$parser_error.v.m307$.ParsingContext.typep.cp(%m307$.ParsingContext.type* %.tmp978, i8* %.tmp980)
br label %.if.end.977
.if.false.977:
br label %.if.end.977
.if.end.977:
%.tmp981 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp982 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp981, i32 0, i32 0
%.tmp983 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp984 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp983, i32 0, i32 0
%.tmp985 = load %m308$.Token.type*, %m308$.Token.type** %.tmp984
%.tmp986 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp985, i32 0, i32 5
%.tmp987 = load %m308$.Token.type*, %m308$.Token.type** %.tmp986
store %m308$.Token.type* %.tmp987, %m308$.Token.type** %.tmp982
%.tmp988 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp989 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp988, i32 0, i32 0
%.tmp990 = load %m308$.Token.type*, %m308$.Token.type** %.tmp989
%.tmp991 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp990, i32 0, i32 1
%.tmp992 = load i8*, i8** %.tmp991
%.tmp994 = getelementptr [2 x i8], [2 x i8]*@.str993, i32 0, i32 0
%.tmp995 = call i32(i8*,i8*) @strcmp(i8* %.tmp992, i8* %.tmp994)
%.tmp996 = icmp eq i32 %.tmp995, 0
br i1 %.tmp996, label %.if.true.997, label %.if.false.997
.if.true.997:
%.tmp998 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp999 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp998, i32 0, i32 0
%.tmp1000 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1001 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1000, i32 0, i32 0
%.tmp1002 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1001
%.tmp1003 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1002, i32 0, i32 5
%.tmp1004 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1003
store %m308$.Token.type* %.tmp1004, %m308$.Token.type** %.tmp999
%.tmp1005 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.846
%.tmp1006 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1005, i32 0, i32 1
store i8 43, i8* %.tmp1006
br label %.if.end.997
.if.false.997:
%.tmp1007 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1008 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1007, i32 0, i32 0
%.tmp1009 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1008
%.tmp1010 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1009, i32 0, i32 1
%.tmp1011 = load i8*, i8** %.tmp1010
%.tmp1013 = getelementptr [2 x i8], [2 x i8]*@.str1012, i32 0, i32 0
%.tmp1014 = call i32(i8*,i8*) @strcmp(i8* %.tmp1011, i8* %.tmp1013)
%.tmp1015 = icmp eq i32 %.tmp1014, 0
br i1 %.tmp1015, label %.if.true.1016, label %.if.false.1016
.if.true.1016:
%.tmp1017 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1018 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1017, i32 0, i32 0
%.tmp1019 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1020 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1019, i32 0, i32 0
%.tmp1021 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1020
%.tmp1022 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1021, i32 0, i32 5
%.tmp1023 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1022
store %m308$.Token.type* %.tmp1023, %m308$.Token.type** %.tmp1018
%.tmp1024 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.846
%.tmp1025 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1024, i32 0, i32 1
store i8 42, i8* %.tmp1025
br label %.if.end.1016
.if.false.1016:
%.tmp1026 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1027 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1026, i32 0, i32 0
%.tmp1028 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1027
%.tmp1029 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1028, i32 0, i32 1
%.tmp1030 = load i8*, i8** %.tmp1029
%.tmp1032 = getelementptr [2 x i8], [2 x i8]*@.str1031, i32 0, i32 0
%.tmp1033 = call i32(i8*,i8*) @strcmp(i8* %.tmp1030, i8* %.tmp1032)
%.tmp1034 = icmp eq i32 %.tmp1033, 0
br i1 %.tmp1034, label %.if.true.1035, label %.if.false.1035
.if.true.1035:
%.tmp1036 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1037 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1036, i32 0, i32 0
%.tmp1038 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1039 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1038, i32 0, i32 0
%.tmp1040 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1039
%.tmp1041 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1040, i32 0, i32 5
%.tmp1042 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1041
store %m308$.Token.type* %.tmp1042, %m308$.Token.type** %.tmp1037
%.tmp1043 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.846
%.tmp1044 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1043, i32 0, i32 1
store i8 63, i8* %.tmp1044
br label %.if.end.1035
.if.false.1035:
br label %.if.end.1035
.if.end.1035:
br label %.if.end.1016
.if.end.1016:
br label %.if.end.997
.if.end.997:
br label %.if.end.856
.if.false.856:
%.tmp1045 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1046 = call %m307$.Matcher.type*(%m307$.ParsingContext.type*) @m307$parse_simple_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp1045)
store %m307$.Matcher.type* %.tmp1046, %m307$.Matcher.type** %m.846
br label %.if.end.856
.if.end.856:
%.tmp1047 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1048 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1047, i32 0, i32 0
%.tmp1049 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1048
%.tmp1050 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1049, i32 0, i32 1
%.tmp1051 = load i8*, i8** %.tmp1050
%.tmp1053 = getelementptr [2 x i8], [2 x i8]*@.str1052, i32 0, i32 0
%.tmp1054 = call i32(i8*,i8*) @strcmp(i8* %.tmp1051, i8* %.tmp1053)
%.tmp1055 = icmp eq i32 %.tmp1054, 0
%.tmp1056 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1057 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1056, i32 0, i32 0
%.tmp1058 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1057
%.tmp1059 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1058, i32 0, i32 0
%.tmp1060 = load i8*, i8** %.tmp1059
%.tmp1062 = getelementptr [5 x i8], [5 x i8]*@.str1061, i32 0, i32 0
%.tmp1063 = call i32(i8*,i8*) @strcmp(i8* %.tmp1060, i8* %.tmp1062)
%.tmp1064 = icmp eq i32 %.tmp1063, 0
%.tmp1065 = or i1 %.tmp1055, %.tmp1064
br i1 %.tmp1065, label %.if.true.1066, label %.if.false.1066
.if.true.1066:
%.tmp1067 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.846
%.tmp1068 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1067, i32 0, i32 3
%.tmp1069 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1070 = call %m307$.Matcher.type*(%m307$.ParsingContext.type*) @m307$parse_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp1069)
store %m307$.Matcher.type* %.tmp1070, %m307$.Matcher.type** %.tmp1068
br label %.if.end.1066
.if.false.1066:
br label %.if.end.1066
.if.end.1066:
%.tmp1071 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.846
ret %m307$.Matcher.type* %.tmp1071
}
define %m307$.Matcher.type* @m307$parse_simple_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.ctx.arg, %m307$.ParsingContext.type** %ctx
%.tmp1072 = call %m307$.Matcher.type*() @m307$new_matcher.m307$.Matcher.typep()
%m.1073 = alloca %m307$.Matcher.type*
store %m307$.Matcher.type* %.tmp1072, %m307$.Matcher.type** %m.1073
%count.1074 = alloca i32
store i32 0, i32* %count.1074
%.tmp1075 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1076 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1075, i32 0, i32 0
%.tmp1077 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1076
%ptr.1078 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp1077, %m308$.Token.type** %ptr.1078
store i32 0, i32* %count.1074
br label %.for.start.1079
.for.start.1079:
%.tmp1080 = load %m308$.Token.type*, %m308$.Token.type** %ptr.1078
%.tmp1081 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1080, i32 0, i32 0
%.tmp1082 = load i8*, i8** %.tmp1081
%.tmp1084 = getelementptr [5 x i8], [5 x i8]*@.str1083, i32 0, i32 0
%.tmp1085 = call i32(i8*,i8*) @strcmp(i8* %.tmp1082, i8* %.tmp1084)
%.tmp1086 = icmp eq i32 %.tmp1085, 0
%.tmp1087 = load %m308$.Token.type*, %m308$.Token.type** %ptr.1078
%.tmp1088 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1087, i32 0, i32 0
%.tmp1089 = load i8*, i8** %.tmp1088
%.tmp1091 = getelementptr [7 x i8], [7 x i8]*@.str1090, i32 0, i32 0
%.tmp1092 = call i32(i8*,i8*) @strcmp(i8* %.tmp1089, i8* %.tmp1091)
%.tmp1093 = icmp eq i32 %.tmp1092, 0
%.tmp1094 = or i1 %.tmp1086, %.tmp1093
br i1 %.tmp1094, label %.for.continue.1079, label %.for.end.1079
.for.continue.1079:
%.tmp1095 = load i32, i32* %count.1074
%.tmp1096 = add i32 %.tmp1095, 1
store i32 %.tmp1096, i32* %count.1074
%.tmp1097 = load %m308$.Token.type*, %m308$.Token.type** %ptr.1078
%.tmp1098 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1097, i32 0, i32 5
%.tmp1099 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1098
store %m308$.Token.type* %.tmp1099, %m308$.Token.type** %ptr.1078
br label %.for.start.1079
.for.end.1079:
%.tmp1100 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.1073
%.tmp1101 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1100, i32 0, i32 0
%.tmp1102 = getelementptr %m307$.Query.type, %m307$.Query.type* null, i32 1
%.tmp1103 = ptrtoint %m307$.Query.type* %.tmp1102 to i32
%.tmp1104 = call i8*(i32) @malloc(i32 %.tmp1103)
%.tmp1105 = bitcast i8* %.tmp1104 to %m307$.Query.type*
store %m307$.Query.type* %.tmp1105, %m307$.Query.type** %.tmp1101
%.tmp1106 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.1073
%.tmp1107 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1106, i32 0, i32 0
%.tmp1108 = load %m307$.Query.type*, %m307$.Query.type** %.tmp1107
%q.1109 = alloca %m307$.Query.type*
store %m307$.Query.type* %.tmp1108, %m307$.Query.type** %q.1109
%i.1111 = alloca i32
store i32 0, i32* %i.1111
br label %.for.start.1110
.for.start.1110:
%.tmp1112 = load i32, i32* %i.1111
%.tmp1113 = load i32, i32* %count.1074
%.tmp1114 = icmp slt i32 %.tmp1112, %.tmp1113
br i1 %.tmp1114, label %.for.continue.1110, label %.for.end.1110
.for.continue.1110:
%.tmp1115 = load i32, i32* %i.1111
%.tmp1116 = icmp sgt i32 %.tmp1115, 0
br i1 %.tmp1116, label %.if.true.1117, label %.if.false.1117
.if.true.1117:
%.tmp1118 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1119 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1118, i32 0, i32 2
%.tmp1120 = getelementptr %m307$.Query.type, %m307$.Query.type* null, i32 1
%.tmp1121 = ptrtoint %m307$.Query.type* %.tmp1120 to i32
%.tmp1122 = call i8*(i32) @malloc(i32 %.tmp1121)
%.tmp1123 = bitcast i8* %.tmp1122 to %m307$.Query.type*
store %m307$.Query.type* %.tmp1123, %m307$.Query.type** %.tmp1119
%.tmp1124 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1125 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1124, i32 0, i32 2
%.tmp1126 = load %m307$.Query.type*, %m307$.Query.type** %.tmp1125
store %m307$.Query.type* %.tmp1126, %m307$.Query.type** %q.1109
br label %.if.end.1117
.if.false.1117:
br label %.if.end.1117
.if.end.1117:
%.tmp1127 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1128 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1127, i32 0, i32 0
%.tmp1129 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1128
%.tmp1130 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1129, i32 0, i32 0
%.tmp1131 = load i8*, i8** %.tmp1130
%.tmp1133 = getelementptr [7 x i8], [7 x i8]*@.str1132, i32 0, i32 0
%.tmp1134 = call i32(i8*,i8*) @strcmp(i8* %.tmp1131, i8* %.tmp1133)
%.tmp1135 = icmp eq i32 %.tmp1134, 0
br i1 %.tmp1135, label %.if.true.1136, label %.if.false.1136
.if.true.1136:
%.tmp1137 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1138 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1137, i32 0, i32 0
store i8 118, i8* %.tmp1138
br label %.if.end.1136
.if.false.1136:
%.tmp1139 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1140 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1139, i32 0, i32 0
%.tmp1141 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1140
%.tmp1142 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1141, i32 0, i32 1
%.tmp1143 = load i8*, i8** %.tmp1142
%.tmp1144 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1143)
br i1 %.tmp1144, label %.if.true.1145, label %.if.false.1145
.if.true.1145:
%.tmp1146 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1147 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1146, i32 0, i32 0
store i8 97, i8* %.tmp1147
br label %.if.end.1145
.if.false.1145:
%.tmp1148 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1149 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1148, i32 0, i32 0
%.tmp1150 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1149
%.tmp1151 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1150, i32 0, i32 1
%.tmp1152 = load i8*, i8** %.tmp1151
%.tmp1153 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1152)
br i1 %.tmp1153, label %.if.true.1154, label %.if.false.1154
.if.true.1154:
%.tmp1155 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1156 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1155, i32 0, i32 0
store i8 116, i8* %.tmp1156
br label %.if.end.1154
.if.false.1154:
%.tmp1158 = getelementptr [17 x i8], [17 x i8]*@.str1157, i32 0, i32 0
%.tmp1159 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1160 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1159, i32 0, i32 0
%.tmp1161 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1160
%.tmp1162 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1161, i32 0, i32 1
%.tmp1163 = load i8*, i8** %.tmp1162
%.tmp1164 = call i32(i8*,...) @printf(i8* %.tmp1158, i8* %.tmp1163)
%.tmp1165 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1167 = getelementptr [50 x i8], [50 x i8]*@.str1166, i32 0, i32 0
call void(%m307$.ParsingContext.type*,i8*) @m307$parser_error.v.m307$.ParsingContext.typep.cp(%m307$.ParsingContext.type* %.tmp1165, i8* %.tmp1167)
br label %.if.end.1154
.if.end.1154:
br label %.if.end.1145
.if.end.1145:
br label %.if.end.1136
.if.end.1136:
%.tmp1168 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1169 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1168, i32 0, i32 1
%.tmp1170 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1171 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1170, i32 0, i32 0
%.tmp1172 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1171
%.tmp1173 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1172, i32 0, i32 1
%.tmp1174 = load i8*, i8** %.tmp1173
store i8* %.tmp1174, i8** %.tmp1169
%.tmp1175 = load %m307$.Query.type*, %m307$.Query.type** %q.1109
%.tmp1176 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1175, i32 0, i32 2
store %m307$.Query.type* null, %m307$.Query.type** %.tmp1176
%.tmp1177 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1178 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1177, i32 0, i32 0
%.tmp1179 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1180 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1179, i32 0, i32 0
%.tmp1181 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1180
%.tmp1182 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1181, i32 0, i32 5
%.tmp1183 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1182
store %m308$.Token.type* %.tmp1183, %m308$.Token.type** %.tmp1178
%.tmp1184 = load i32, i32* %i.1111
%.tmp1185 = add i32 %.tmp1184, 1
store i32 %.tmp1185, i32* %i.1111
br label %.for.start.1110
.for.end.1110:
%.tmp1186 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m.1073
ret %m307$.Matcher.type* %.tmp1186
}
define %m307$.Rule.type* @m307$parse_rule.m307$.Rule.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.ctx.arg, %m307$.ParsingContext.type** %ctx
%.tmp1187 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1187, i32 0, i32 0
%.tmp1189 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1188
%.tmp1190 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1189, i32 0, i32 1
%.tmp1191 = load i8*, i8** %.tmp1190
%rule_name.1192 = alloca i8*
store i8* %.tmp1191, i8** %rule_name.1192
%.tmp1193 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1194 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1193, i32 0, i32 0
%.tmp1195 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1194
%.tmp1196 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1195, i32 0, i32 0
%.tmp1197 = load i8*, i8** %.tmp1196
%.tmp1199 = getelementptr [5 x i8], [5 x i8]*@.str1198, i32 0, i32 0
%.tmp1200 = call i32(i8*,i8*) @strcmp(i8* %.tmp1197, i8* %.tmp1199)
%.tmp1201 = icmp ne i32 %.tmp1200, 0
br i1 %.tmp1201, label %.if.true.1202, label %.if.false.1202
.if.true.1202:
%.tmp1204 = getelementptr [37 x i8], [37 x i8]*@.str1203, i32 0, i32 0
%.tmp1205 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1206 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1205, i32 0, i32 0
%.tmp1207 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1206
%.tmp1208 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1207, i32 0, i32 0
%.tmp1209 = load i8*, i8** %.tmp1208
%.tmp1210 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1211 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1210, i32 0, i32 0
%.tmp1212 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1211
%.tmp1213 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1212, i32 0, i32 1
%.tmp1214 = load i8*, i8** %.tmp1213
%.tmp1215 = call i32(i8*,...) @printf(i8* %.tmp1204, i8* %.tmp1209, i8* %.tmp1214)
%.tmp1216 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1218 = getelementptr [31 x i8], [31 x i8]*@.str1217, i32 0, i32 0
call void(%m307$.ParsingContext.type*,i8*) @m307$parser_error.v.m307$.ParsingContext.typep.cp(%m307$.ParsingContext.type* %.tmp1216, i8* %.tmp1218)
br label %.if.end.1202
.if.false.1202:
br label %.if.end.1202
.if.end.1202:
%.tmp1219 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1220 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1219, i32 0, i32 0
%.tmp1221 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1222 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1221, i32 0, i32 0
%.tmp1223 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1222
%.tmp1224 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1223, i32 0, i32 5
%.tmp1225 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1224
store %m308$.Token.type* %.tmp1225, %m308$.Token.type** %.tmp1220
%.tmp1226 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1227 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1226, i32 0, i32 0
%.tmp1228 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1227
%.tmp1229 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1228, i32 0, i32 1
%.tmp1230 = load i8*, i8** %.tmp1229
%.tmp1232 = getelementptr [2 x i8], [2 x i8]*@.str1231, i32 0, i32 0
%.tmp1233 = call i32(i8*,i8*) @strcmp(i8* %.tmp1230, i8* %.tmp1232)
%.tmp1234 = icmp ne i32 %.tmp1233, 0
br i1 %.tmp1234, label %.if.true.1235, label %.if.false.1235
.if.true.1235:
%.tmp1236 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1237 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1236, i32 0, i32 0
%.tmp1238 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1237
%.tmp1239 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1238, i32 0, i32 1
%.tmp1240 = load i8*, i8** %.tmp1239
%.tmp1241 = call i32(i8*,...) @printf(i8* %.tmp1240)
%.tmp1242 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1244 = getelementptr [27 x i8], [27 x i8]*@.str1243, i32 0, i32 0
call void(%m307$.ParsingContext.type*,i8*) @m307$parser_error.v.m307$.ParsingContext.typep.cp(%m307$.ParsingContext.type* %.tmp1242, i8* %.tmp1244)
br label %.if.end.1235
.if.false.1235:
br label %.if.end.1235
.if.end.1235:
%.tmp1245 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1246 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1245, i32 0, i32 0
%.tmp1247 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1248 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1247, i32 0, i32 0
%.tmp1249 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1248
%.tmp1250 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1249, i32 0, i32 5
%.tmp1251 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1250
store %m308$.Token.type* %.tmp1251, %m308$.Token.type** %.tmp1246
%.tmp1252 = getelementptr %m307$.Rule.type, %m307$.Rule.type* null, i32 1
%.tmp1253 = ptrtoint %m307$.Rule.type* %.tmp1252 to i32
%.tmp1254 = call i8*(i32) @malloc(i32 %.tmp1253)
%.tmp1255 = bitcast i8* %.tmp1254 to %m307$.Rule.type*
%rule.1256 = alloca %m307$.Rule.type*
store %m307$.Rule.type* %.tmp1255, %m307$.Rule.type** %rule.1256
%.tmp1257 = load %m307$.Rule.type*, %m307$.Rule.type** %rule.1256
%.tmp1258 = getelementptr %m307$.Rule.type, %m307$.Rule.type* %.tmp1257, i32 0, i32 0
%.tmp1259 = load i8*, i8** %rule_name.1192
store i8* %.tmp1259, i8** %.tmp1258
%.tmp1260 = load %m307$.Rule.type*, %m307$.Rule.type** %rule.1256
%.tmp1261 = getelementptr %m307$.Rule.type, %m307$.Rule.type* %.tmp1260, i32 0, i32 1
%.tmp1262 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1263 = call %m307$.Matcher.type*(%m307$.ParsingContext.type*) @m307$parse_matcher.m307$.Matcher.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp1262)
store %m307$.Matcher.type* %.tmp1263, %m307$.Matcher.type** %.tmp1261
%.tmp1264 = load %m307$.Rule.type*, %m307$.Rule.type** %rule.1256
ret %m307$.Rule.type* %.tmp1264
}
define void @m307$parser_error.v.m307$.ParsingContext.typep.cp(%m307$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.ctx.arg, %m307$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1265 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1266 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1265, i32 0, i32 0
%.tmp1267 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1266
%.tmp1268 = load i8*, i8** %error
%.tmp1269 = call %m751$.Error.type*(%m308$.Token.type*,i8*) @m751$from.m751$.Error.typep.m308$.Token.typep.cp(%m308$.Token.type* %.tmp1267, i8* %.tmp1268)
%e.1270 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp1269, %m751$.Error.type** %e.1270
%.tmp1271 = load %m751$.Error.type*, %m751$.Error.type** %e.1270
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp1271)
call void(i32) @exit(i32 1)
ret void
}
define %m307$.Rule.type** @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.ctx.arg, %m307$.ParsingContext.type** %ctx
%max_rules.1272 = alloca i32
store i32 40, i32* %max_rules.1272
%.tmp1273 = load i32, i32* @ptr_size
%.tmp1274 = load i32, i32* %max_rules.1272
%.tmp1275 = mul i32 %.tmp1273, %.tmp1274
%.tmp1276 = call i8*(i32) @malloc(i32 %.tmp1275)
%.tmp1277 = bitcast i8* %.tmp1276 to %m307$.Rule.type**
%grammar.1278 = alloca %m307$.Rule.type**
store %m307$.Rule.type** %.tmp1277, %m307$.Rule.type*** %grammar.1278
%i.1280 = alloca i32
store i32 0, i32* %i.1280
br label %.for.start.1279
.for.start.1279:
%.tmp1281 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1282 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1281, i32 0, i32 0
%.tmp1283 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1282
%.tmp1284 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1283, i32 0, i32 0
%.tmp1285 = load i8*, i8** %.tmp1284
%.tmp1287 = getelementptr [4 x i8], [4 x i8]*@.str1286, i32 0, i32 0
%.tmp1288 = call i32(i8*,i8*) @strcmp(i8* %.tmp1285, i8* %.tmp1287)
%.tmp1289 = icmp ne i32 %.tmp1288, 0
br i1 %.tmp1289, label %.for.continue.1279, label %.for.end.1279
.for.continue.1279:
%.tmp1290 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1291 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1290, i32 0, i32 0
%.tmp1292 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1291
%.tmp1293 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1292, i32 0, i32 0
%.tmp1294 = load i8*, i8** %.tmp1293
%.tmp1296 = getelementptr [3 x i8], [3 x i8]*@.str1295, i32 0, i32 0
%.tmp1297 = call i32(i8*,i8*) @strcmp(i8* %.tmp1294, i8* %.tmp1296)
%.tmp1298 = icmp ne i32 %.tmp1297, 0
br i1 %.tmp1298, label %.if.true.1299, label %.if.false.1299
.if.true.1299:
%.tmp1300 = load i32, i32* %i.1280
%.tmp1301 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar.1278
%.tmp1302 = getelementptr %m307$.Rule.type*, %m307$.Rule.type** %.tmp1301, i32 %.tmp1300
%.tmp1303 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1304 = call %m307$.Rule.type*(%m307$.ParsingContext.type*) @m307$parse_rule.m307$.Rule.typep.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp1303)
store %m307$.Rule.type* %.tmp1304, %m307$.Rule.type** %.tmp1302
%.tmp1305 = load i32, i32* %i.1280
%.tmp1306 = add i32 %.tmp1305, 1
store i32 %.tmp1306, i32* %i.1280
br label %.if.end.1299
.if.false.1299:
%.tmp1307 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1308 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1307, i32 0, i32 0
%.tmp1309 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %ctx
%.tmp1310 = getelementptr %m307$.ParsingContext.type, %m307$.ParsingContext.type* %.tmp1309, i32 0, i32 0
%.tmp1311 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1310
%.tmp1312 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1311, i32 0, i32 5
%.tmp1313 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1312
store %m308$.Token.type* %.tmp1313, %m308$.Token.type** %.tmp1308
br label %.if.end.1299
.if.end.1299:
br label %.for.start.1279
.for.end.1279:
%.tmp1314 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar.1278
%.tmp1315 = bitcast %m307$.Rule.type** %.tmp1314 to %m307$.Rule.type**
ret %m307$.Rule.type** %.tmp1315
}
%m307$.Node.type = type {i8*,i8*,i8*,i32,i32,%m307$.Node.type*,%m307$.Node.type*,%m307$.Node.type*}
define %m307$.Node.type* @m307$new_node.m307$.Node.typep.m308$.Token.typep.cp.cp(%m308$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m308$.Token.type*
store %m308$.Token.type* %.t.arg, %m308$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1316 = getelementptr %m307$.Node.type, %m307$.Node.type* null, i32 1
%.tmp1317 = ptrtoint %m307$.Node.type* %.tmp1316 to i32
%.tmp1318 = call i8*(i32) @malloc(i32 %.tmp1317)
%.tmp1319 = bitcast i8* %.tmp1318 to %m307$.Node.type*
%node.1320 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp1319, %m307$.Node.type** %node.1320
%.tmp1321 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1322 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1321, i32 0, i32 0
%.tmp1323 = load i8*, i8** %type
store i8* %.tmp1323, i8** %.tmp1322
%.tmp1324 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1325 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1324, i32 0, i32 1
%.tmp1326 = load i8*, i8** %value
store i8* %.tmp1326, i8** %.tmp1325
%.tmp1327 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1328 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1327, i32 0, i32 3
%.tmp1329 = load %m308$.Token.type*, %m308$.Token.type** %t
%.tmp1330 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1329, i32 0, i32 2
%.tmp1331 = load i32, i32* %.tmp1330
store i32 %.tmp1331, i32* %.tmp1328
%.tmp1332 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1333 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1332, i32 0, i32 2
%.tmp1334 = load %m308$.Token.type*, %m308$.Token.type** %t
%.tmp1335 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1334, i32 0, i32 4
%.tmp1336 = load i8*, i8** %.tmp1335
store i8* %.tmp1336, i8** %.tmp1333
%.tmp1337 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1338 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1337, i32 0, i32 4
%.tmp1339 = load %m308$.Token.type*, %m308$.Token.type** %t
%.tmp1340 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1339, i32 0, i32 3
%.tmp1341 = load i32, i32* %.tmp1340
store i32 %.tmp1341, i32* %.tmp1338
%.tmp1342 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1343 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1342, i32 0, i32 5
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1343
%.tmp1344 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1345 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1344, i32 0, i32 7
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1345
%.tmp1346 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
%.tmp1347 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1346, i32 0, i32 6
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1347
%.tmp1348 = load %m307$.Node.type*, %m307$.Node.type** %node.1320
ret %m307$.Node.type* %.tmp1348
}
define void @m307$child_append.v.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.parent.arg, %m307$.Node.type* %.child.arg) {
%parent = alloca %m307$.Node.type*
store %m307$.Node.type* %.parent.arg, %m307$.Node.type** %parent
%child = alloca %m307$.Node.type*
store %m307$.Node.type* %.child.arg, %m307$.Node.type** %child
%.tmp1349 = load %m307$.Node.type*, %m307$.Node.type** %parent
%.tmp1350 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1349, i32 0, i32 6
%.tmp1351 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1350
%.tmp1352 = icmp eq %m307$.Node.type* %.tmp1351, null
br i1 %.tmp1352, label %.if.true.1353, label %.if.false.1353
.if.true.1353:
%.tmp1354 = load %m307$.Node.type*, %m307$.Node.type** %parent
%.tmp1355 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1354, i32 0, i32 6
%.tmp1356 = load %m307$.Node.type*, %m307$.Node.type** %child
store %m307$.Node.type* %.tmp1356, %m307$.Node.type** %.tmp1355
br label %.if.end.1353
.if.false.1353:
%.tmp1357 = load %m307$.Node.type*, %m307$.Node.type** %parent
%.tmp1358 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1357, i32 0, i32 6
%.tmp1359 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1358
%c.1360 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp1359, %m307$.Node.type** %c.1360
br label %.for.start.1361
.for.start.1361:
%.tmp1362 = load %m307$.Node.type*, %m307$.Node.type** %c.1360
%.tmp1363 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1362, i32 0, i32 7
%.tmp1364 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1363
%.tmp1365 = icmp ne %m307$.Node.type* %.tmp1364, null
br i1 %.tmp1365, label %.for.continue.1361, label %.for.end.1361
.for.continue.1361:
%.tmp1366 = load %m307$.Node.type*, %m307$.Node.type** %c.1360
%.tmp1367 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1366, i32 0, i32 7
%.tmp1368 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1367
store %m307$.Node.type* %.tmp1368, %m307$.Node.type** %c.1360
br label %.for.start.1361
.for.end.1361:
%.tmp1369 = load %m307$.Node.type*, %m307$.Node.type** %c.1360
%.tmp1370 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1369, i32 0, i32 7
%.tmp1371 = load %m307$.Node.type*, %m307$.Node.type** %child
store %m307$.Node.type* %.tmp1371, %m307$.Node.type** %.tmp1370
br label %.if.end.1353
.if.end.1353:
%.tmp1372 = load %m307$.Node.type*, %m307$.Node.type** %child
%.tmp1373 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1372, i32 0, i32 7
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1373
ret void
}
define void @m307$child_pop.v.m307$.Node.typep(%m307$.Node.type* %.parent.arg) {
%parent = alloca %m307$.Node.type*
store %m307$.Node.type* %.parent.arg, %m307$.Node.type** %parent
%.tmp1374 = load %m307$.Node.type*, %m307$.Node.type** %parent
%.tmp1375 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1374, i32 0, i32 6
%.tmp1376 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1375
%.tmp1377 = icmp eq %m307$.Node.type* %.tmp1376, null
br i1 %.tmp1377, label %.if.true.1378, label %.if.false.1378
.if.true.1378:
ret void
br label %.if.end.1378
.if.false.1378:
br label %.if.end.1378
.if.end.1378:
%.tmp1379 = load %m307$.Node.type*, %m307$.Node.type** %parent
%.tmp1380 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1379, i32 0, i32 6
%.tmp1381 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1380
%c.1382 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp1381, %m307$.Node.type** %c.1382
%.tmp1383 = load %m307$.Node.type*, %m307$.Node.type** %c.1382
%.tmp1384 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1383, i32 0, i32 7
%.tmp1385 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1384
%.tmp1386 = icmp eq %m307$.Node.type* %.tmp1385, null
br i1 %.tmp1386, label %.if.true.1387, label %.if.false.1387
.if.true.1387:
%.tmp1388 = load %m307$.Node.type*, %m307$.Node.type** %c.1382
%.tmp1389 = bitcast %m307$.Node.type* %.tmp1388 to i8*
call void(i8*) @free(i8* %.tmp1389)
%.tmp1390 = load %m307$.Node.type*, %m307$.Node.type** %parent
%.tmp1391 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1390, i32 0, i32 6
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1391
ret void
br label %.if.end.1387
.if.false.1387:
br label %.if.end.1387
.if.end.1387:
br label %.for.start.1392
.for.start.1392:
%.tmp1393 = load %m307$.Node.type*, %m307$.Node.type** %c.1382
%.tmp1394 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1393, i32 0, i32 7
%.tmp1395 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1394
%.tmp1396 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1395, i32 0, i32 7
%.tmp1397 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1396
%.tmp1398 = icmp ne %m307$.Node.type* %.tmp1397, null
br i1 %.tmp1398, label %.for.continue.1392, label %.for.end.1392
.for.continue.1392:
%.tmp1399 = load %m307$.Node.type*, %m307$.Node.type** %c.1382
%.tmp1400 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1399, i32 0, i32 7
%.tmp1401 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1400
store %m307$.Node.type* %.tmp1401, %m307$.Node.type** %c.1382
br label %.for.start.1392
.for.end.1392:
%.tmp1402 = load %m307$.Node.type*, %m307$.Node.type** %c.1382
%.tmp1403 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1402, i32 0, i32 7
%.tmp1404 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1403
%.tmp1405 = bitcast %m307$.Node.type* %.tmp1404 to i8*
call void(i8*) @free(i8* %.tmp1405)
%.tmp1406 = load %m307$.Node.type*, %m307$.Node.type** %c.1382
%.tmp1407 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1406, i32 0, i32 7
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1407
ret void
}
%m307$.AstContext.type = type {%m308$.Token.type*,%m307$.Rule.type**}
define %m307$.Rule.type* @m307$_find_rule.m307$.Rule.typep.m307$.Rule.typepp.cp(%m307$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m307$.Rule.type**
store %m307$.Rule.type** %.grammar.arg, %m307$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1409 = alloca i32
store i32 0, i32* %i.1409
br label %.for.start.1408
.for.start.1408:
br i1 1, label %.for.continue.1408, label %.for.end.1408
.for.continue.1408:
%.tmp1410 = load i32, i32* %i.1409
%.tmp1411 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar
%.tmp1412 = getelementptr %m307$.Rule.type*, %m307$.Rule.type** %.tmp1411, i32 %.tmp1410
%.tmp1413 = load %m307$.Rule.type*, %m307$.Rule.type** %.tmp1412
%rule.1414 = alloca %m307$.Rule.type*
store %m307$.Rule.type* %.tmp1413, %m307$.Rule.type** %rule.1414
%.tmp1415 = load %m307$.Rule.type*, %m307$.Rule.type** %rule.1414
%.tmp1416 = getelementptr %m307$.Rule.type, %m307$.Rule.type* %.tmp1415, i32 0, i32 0
%.tmp1417 = load i8*, i8** %.tmp1416
%.tmp1418 = load i8*, i8** %rule_name
%.tmp1419 = call i32(i8*,i8*) @strcmp(i8* %.tmp1417, i8* %.tmp1418)
%.tmp1420 = icmp eq i32 %.tmp1419, 0
br i1 %.tmp1420, label %.if.true.1421, label %.if.false.1421
.if.true.1421:
%.tmp1422 = load %m307$.Rule.type*, %m307$.Rule.type** %rule.1414
ret %m307$.Rule.type* %.tmp1422
br label %.if.end.1421
.if.false.1421:
br label %.if.end.1421
.if.end.1421:
%.tmp1423 = load i32, i32* %i.1409
%.tmp1424 = add i32 %.tmp1423, 1
store i32 %.tmp1424, i32* %i.1409
br label %.for.start.1408
.for.end.1408:
%.tmp1425 = bitcast ptr null to %m307$.Rule.type*
ret %m307$.Rule.type* %.tmp1425
}
%m307$.ParseResult.type = type {%m751$.Error.type*,%m307$.Node.type*}
define %m751$.Error.type* @m307$parse_query.m751$.Error.typep.m307$.AstContext.typep.m307$.Matcher.typep.m307$.Node.typep(%m307$.AstContext.type* %.c.arg, %m307$.Matcher.type* %.m.arg, %m307$.Node.type* %.base.arg) {
%c = alloca %m307$.AstContext.type*
store %m307$.AstContext.type* %.c.arg, %m307$.AstContext.type** %c
%m = alloca %m307$.Matcher.type*
store %m307$.Matcher.type* %.m.arg, %m307$.Matcher.type** %m
%base = alloca %m307$.Node.type*
store %m307$.Node.type* %.base.arg, %m307$.Node.type** %base
%child.1426 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %child.1426
%.tmp1427 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1428 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1427, i32 0, i32 0
%.tmp1429 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1428
%start_token.1430 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp1429, %m308$.Token.type** %start_token.1430
%new_children.1431 = alloca i32
store i32 0, i32* %new_children.1431
%.tmp1432 = bitcast ptr null to %m751$.Error.type*
%err.1433 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp1432, %m751$.Error.type** %err.1433
%.tmp1435 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1436 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1435, i32 0, i32 0
%.tmp1437 = load %m307$.Query.type*, %m307$.Query.type** %.tmp1436
%q.1438 = alloca %m307$.Query.type*
store %m307$.Query.type* %.tmp1437, %m307$.Query.type** %q.1438
br label %.for.start.1434
.for.start.1434:
%.tmp1439 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1440 = icmp ne %m307$.Query.type* %.tmp1439, null
%.tmp1441 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1442 = icmp eq %m751$.Error.type* %.tmp1441, null
%.tmp1443 = and i1 %.tmp1440, %.tmp1442
br i1 %.tmp1443, label %.for.continue.1434, label %.for.end.1434
.for.continue.1434:
%.tmp1444 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1445 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1444, i32 0, i32 0
%.tmp1446 = load i8, i8* %.tmp1445
%.tmp1447 = icmp eq i8 %.tmp1446, 118
br i1 %.tmp1447, label %.if.true.1448, label %.if.false.1448
.if.true.1448:
%.tmp1449 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1450 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1449, i32 0, i32 1
%.tmp1451 = load i8*, i8** %.tmp1450
%.tmp1452 = call i32(i8*) @strlen(i8* %.tmp1451)
%.tmp1453 = sub i32 %.tmp1452, 2
%qv_len.1454 = alloca i32
store i32 %.tmp1453, i32* %qv_len.1454
%.tmp1455 = load i32, i32* %qv_len.1454
%.tmp1456 = add i32 %.tmp1455, 1
%.tmp1457 = call i8*(i32) @malloc(i32 %.tmp1456)
%tmp_buff.1458 = alloca i8*
store i8* %.tmp1457, i8** %tmp_buff.1458
%.tmp1459 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1460 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1459, i32 0, i32 1
%.tmp1461 = load i8*, i8** %.tmp1460
%.tmp1463 = getelementptr [8 x i8], [8 x i8]*@.str1462, i32 0, i32 0
%.tmp1464 = load i8*, i8** %tmp_buff.1458
%.tmp1465 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1461, i8* %.tmp1463, i8* %.tmp1464)
%.tmp1466 = load i8*, i8** %tmp_buff.1458
%.tmp1467 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1468 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1467, i32 0, i32 0
%.tmp1469 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1468
%.tmp1470 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1469, i32 0, i32 1
%.tmp1471 = load i8*, i8** %.tmp1470
%.tmp1472 = load i32, i32* %qv_len.1454
%.tmp1473 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1466, i8* %.tmp1471, i32 %.tmp1472)
%.tmp1474 = icmp eq i32 %.tmp1473, 0
%.tmp1475 = load i32, i32* %qv_len.1454
%.tmp1476 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1477 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1476, i32 0, i32 0
%.tmp1478 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1477
%.tmp1479 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1478, i32 0, i32 1
%.tmp1480 = load i8*, i8** %.tmp1479
%.tmp1481 = call i32(i8*) @strlen(i8* %.tmp1480)
%.tmp1482 = icmp eq i32 %.tmp1475, %.tmp1481
%.tmp1483 = and i1 %.tmp1474, %.tmp1482
br i1 %.tmp1483, label %.if.true.1484, label %.if.false.1484
.if.true.1484:
%.tmp1485 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1486 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1485, i32 0, i32 0
%.tmp1487 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1486
%.tmp1488 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1489 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1488, i32 0, i32 0
%.tmp1490 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1489
%.tmp1491 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1490, i32 0, i32 0
%.tmp1492 = load i8*, i8** %.tmp1491
%.tmp1493 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1494 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1493, i32 0, i32 0
%.tmp1495 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1494
%.tmp1496 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1495, i32 0, i32 1
%.tmp1497 = load i8*, i8** %.tmp1496
%.tmp1498 = call %m307$.Node.type*(%m308$.Token.type*,i8*,i8*) @m307$new_node.m307$.Node.typep.m308$.Token.typep.cp.cp(%m308$.Token.type* %.tmp1487, i8* %.tmp1492, i8* %.tmp1497)
store %m307$.Node.type* %.tmp1498, %m307$.Node.type** %child.1426
%.tmp1499 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1500 = load %m307$.Node.type*, %m307$.Node.type** %child.1426
call void(%m307$.Node.type*,%m307$.Node.type*) @m307$child_append.v.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp1499, %m307$.Node.type* %.tmp1500)
%.tmp1501 = load i32, i32* %new_children.1431
%.tmp1502 = add i32 %.tmp1501, 1
store i32 %.tmp1502, i32* %new_children.1431
%.tmp1503 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1504 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1503, i32 0, i32 0
%.tmp1505 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1506 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1505, i32 0, i32 0
%.tmp1507 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1506
%.tmp1508 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1507, i32 0, i32 5
%.tmp1509 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1508
store %m308$.Token.type* %.tmp1509, %m308$.Token.type** %.tmp1504
br label %.if.end.1484
.if.false.1484:
%.tmp1510 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1511 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1510, i32 0, i32 0
%.tmp1512 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1511
%.tmp1513 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1512, i32 0, i32 1
%.tmp1514 = load i8*, i8** %.tmp1513
%token_value.1515 = alloca i8*
store i8* %.tmp1514, i8** %token_value.1515
%.tmp1516 = load i8*, i8** %token_value.1515
%.tmp1517 = icmp eq i8* %.tmp1516, null
br i1 %.tmp1517, label %.if.true.1518, label %.if.false.1518
.if.true.1518:
%.tmp1520 = getelementptr [7 x i8], [7 x i8]*@.str1519, i32 0, i32 0
store i8* %.tmp1520, i8** %token_value.1515
br label %.if.end.1518
.if.false.1518:
br label %.if.end.1518
.if.end.1518:
%.tmp1522 = getelementptr [15 x i8], [15 x i8]*@.str1521, i32 0, i32 0
%err_fmt.1523 = alloca i8*
store i8* %.tmp1522, i8** %err_fmt.1523
%.tmp1525 = getelementptr [31 x i8], [31 x i8]*@.str1524, i32 0, i32 0
%err_msg.1526 = alloca i8*
store i8* %.tmp1525, i8** %err_msg.1526
%.tmp1527 = load i8*, i8** %err_msg.1526
%.tmp1528 = call i32(i8*) @strlen(i8* %.tmp1527)
%.tmp1529 = load i8*, i8** %tmp_buff.1458
%.tmp1530 = call i32(i8*) @strlen(i8* %.tmp1529)
%.tmp1531 = add i32 %.tmp1528, %.tmp1530
%.tmp1532 = load i8*, i8** %token_value.1515
%.tmp1533 = call i32(i8*) @strlen(i8* %.tmp1532)
%.tmp1534 = add i32 %.tmp1531, %.tmp1533
%.tmp1535 = load i8*, i8** %err_fmt.1523
%.tmp1536 = call i32(i8*) @strlen(i8* %.tmp1535)
%.tmp1537 = add i32 %.tmp1534, %.tmp1536
%.tmp1538 = mul i32 3, 2
%.tmp1539 = sub i32 %.tmp1537, %.tmp1538
%.tmp1540 = add i32 %.tmp1539, 1
%err_len.1541 = alloca i32
store i32 %.tmp1540, i32* %err_len.1541
%.tmp1542 = load i32, i32* %err_len.1541
%.tmp1543 = call i8*(i32) @malloc(i32 %.tmp1542)
%err_buf.1544 = alloca i8*
store i8* %.tmp1543, i8** %err_buf.1544
%.tmp1545 = load i8*, i8** %err_buf.1544
%.tmp1546 = load i32, i32* %err_len.1541
%.tmp1547 = load i8*, i8** %err_fmt.1523
%.tmp1548 = load i8*, i8** %err_msg.1526
%.tmp1549 = load i8*, i8** %tmp_buff.1458
%.tmp1550 = load i8*, i8** %token_value.1515
%.tmp1551 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1545, i32 %.tmp1546, i8* %.tmp1547, i8* %.tmp1548, i8* %.tmp1549, i8* %.tmp1550)
%.tmp1552 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1553 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1552, i32 0, i32 0
%.tmp1554 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1553
%.tmp1555 = load i8*, i8** %err_buf.1544
%.tmp1556 = call %m751$.Error.type*(%m308$.Token.type*,i8*) @m751$from.m751$.Error.typep.m308$.Token.typep.cp(%m308$.Token.type* %.tmp1554, i8* %.tmp1555)
store %m751$.Error.type* %.tmp1556, %m751$.Error.type** %err.1433
br label %.if.end.1484
.if.end.1484:
%.tmp1557 = load i8*, i8** %tmp_buff.1458
call void(i8*) @free(i8* %.tmp1557)
br label %.if.end.1448
.if.false.1448:
%.tmp1558 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1559 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1558, i32 0, i32 0
%.tmp1560 = load i8, i8* %.tmp1559
%.tmp1561 = icmp eq i8 %.tmp1560, 116
br i1 %.tmp1561, label %.if.true.1562, label %.if.false.1562
.if.true.1562:
%.tmp1563 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1564 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1563, i32 0, i32 1
%.tmp1565 = load i8*, i8** %.tmp1564
%.tmp1566 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1567 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1566, i32 0, i32 0
%.tmp1568 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1567
%.tmp1569 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1568, i32 0, i32 0
%.tmp1570 = load i8*, i8** %.tmp1569
%.tmp1571 = call i32(i8*,i8*) @strcmp(i8* %.tmp1565, i8* %.tmp1570)
%.tmp1572 = icmp eq i32 %.tmp1571, 0
br i1 %.tmp1572, label %.if.true.1573, label %.if.false.1573
.if.true.1573:
%.tmp1574 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1575 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1574, i32 0, i32 0
%.tmp1576 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1575
%.tmp1577 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1578 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1577, i32 0, i32 0
%.tmp1579 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1578
%.tmp1580 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1579, i32 0, i32 0
%.tmp1581 = load i8*, i8** %.tmp1580
%.tmp1582 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1583 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1582, i32 0, i32 0
%.tmp1584 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1583
%.tmp1585 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1584, i32 0, i32 1
%.tmp1586 = load i8*, i8** %.tmp1585
%.tmp1587 = call %m307$.Node.type*(%m308$.Token.type*,i8*,i8*) @m307$new_node.m307$.Node.typep.m308$.Token.typep.cp.cp(%m308$.Token.type* %.tmp1576, i8* %.tmp1581, i8* %.tmp1586)
store %m307$.Node.type* %.tmp1587, %m307$.Node.type** %child.1426
%.tmp1588 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1589 = load %m307$.Node.type*, %m307$.Node.type** %child.1426
call void(%m307$.Node.type*,%m307$.Node.type*) @m307$child_append.v.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp1588, %m307$.Node.type* %.tmp1589)
%.tmp1590 = load i32, i32* %new_children.1431
%.tmp1591 = add i32 %.tmp1590, 1
store i32 %.tmp1591, i32* %new_children.1431
%.tmp1592 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1593 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1592, i32 0, i32 0
%.tmp1594 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1595 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1594, i32 0, i32 0
%.tmp1596 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1595
%.tmp1597 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1596, i32 0, i32 5
%.tmp1598 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1597
store %m308$.Token.type* %.tmp1598, %m308$.Token.type** %.tmp1593
br label %.if.end.1573
.if.false.1573:
%.tmp1600 = getelementptr [13 x i8], [13 x i8]*@.str1599, i32 0, i32 0
%err_fmt_t.1601 = alloca i8*
store i8* %.tmp1600, i8** %err_fmt_t.1601
%.tmp1603 = getelementptr [30 x i8], [30 x i8]*@.str1602, i32 0, i32 0
%err_msg_t.1604 = alloca i8*
store i8* %.tmp1603, i8** %err_msg_t.1604
%.tmp1605 = load i8*, i8** %err_fmt_t.1601
%.tmp1606 = call i32(i8*) @strlen(i8* %.tmp1605)
%.tmp1607 = load i8*, i8** %err_msg_t.1604
%.tmp1608 = call i32(i8*) @strlen(i8* %.tmp1607)
%.tmp1609 = add i32 %.tmp1606, %.tmp1608
%.tmp1610 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1611 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1610, i32 0, i32 1
%.tmp1612 = load i8*, i8** %.tmp1611
%.tmp1613 = call i32(i8*) @strlen(i8* %.tmp1612)
%.tmp1614 = add i32 %.tmp1609, %.tmp1613
%.tmp1615 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1616 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1615, i32 0, i32 0
%.tmp1617 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1616
%.tmp1618 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1617, i32 0, i32 0
%.tmp1619 = load i8*, i8** %.tmp1618
%.tmp1620 = call i32(i8*) @strlen(i8* %.tmp1619)
%.tmp1621 = add i32 %.tmp1614, %.tmp1620
%err_len_t.1622 = alloca i32
store i32 %.tmp1621, i32* %err_len_t.1622
%.tmp1623 = load i32, i32* %err_len_t.1622
%.tmp1624 = call i8*(i32) @malloc(i32 %.tmp1623)
%err_buf_t.1625 = alloca i8*
store i8* %.tmp1624, i8** %err_buf_t.1625
%.tmp1626 = load i8*, i8** %err_buf_t.1625
%.tmp1627 = load i32, i32* %err_len_t.1622
%.tmp1628 = load i8*, i8** %err_fmt_t.1601
%.tmp1629 = load i8*, i8** %err_msg_t.1604
%.tmp1630 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1631 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1630, i32 0, i32 1
%.tmp1632 = load i8*, i8** %.tmp1631
%.tmp1633 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1634 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1633, i32 0, i32 0
%.tmp1635 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1634
%.tmp1636 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1635, i32 0, i32 0
%.tmp1637 = load i8*, i8** %.tmp1636
%.tmp1638 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1626, i32 %.tmp1627, i8* %.tmp1628, i8* %.tmp1629, i8* %.tmp1632, i8* %.tmp1637)
%.tmp1639 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1640 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1639, i32 0, i32 0
%.tmp1641 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1640
%.tmp1642 = load i8*, i8** %err_buf_t.1625
%.tmp1643 = call %m751$.Error.type*(%m308$.Token.type*,i8*) @m751$from.m751$.Error.typep.m308$.Token.typep.cp(%m308$.Token.type* %.tmp1641, i8* %.tmp1642)
store %m751$.Error.type* %.tmp1643, %m751$.Error.type** %err.1433
br label %.if.end.1573
.if.end.1573:
br label %.if.end.1562
.if.false.1562:
%.tmp1644 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1645 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1644, i32 0, i32 0
%.tmp1646 = load i8, i8* %.tmp1645
%.tmp1647 = icmp eq i8 %.tmp1646, 97
br i1 %.tmp1647, label %.if.true.1648, label %.if.false.1648
.if.true.1648:
%.tmp1649 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1650 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1649, i32 0, i32 1
%.tmp1651 = load %m307$.Rule.type**, %m307$.Rule.type*** %.tmp1650
%.tmp1652 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1653 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1652, i32 0, i32 1
%.tmp1654 = load i8*, i8** %.tmp1653
%.tmp1655 = call %m307$.Rule.type*(%m307$.Rule.type**,i8*) @m307$_find_rule.m307$.Rule.typep.m307$.Rule.typepp.cp(%m307$.Rule.type** %.tmp1651, i8* %.tmp1654)
%alias_rule.1656 = alloca %m307$.Rule.type*
store %m307$.Rule.type* %.tmp1655, %m307$.Rule.type** %alias_rule.1656
%.tmp1657 = load %m307$.Rule.type*, %m307$.Rule.type** %alias_rule.1656
%.tmp1658 = icmp eq %m307$.Rule.type* %.tmp1657, null
br i1 %.tmp1658, label %.if.true.1659, label %.if.false.1659
.if.true.1659:
%.tmp1660 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1661 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1660, i32 0, i32 0
%.tmp1662 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1661
%.tmp1664 = getelementptr [30 x i8], [30 x i8]*@.str1663, i32 0, i32 0
%.tmp1665 = call %m751$.Error.type*(%m308$.Token.type*,i8*) @m751$from.m751$.Error.typep.m308$.Token.typep.cp(%m308$.Token.type* %.tmp1662, i8* %.tmp1664)
store %m751$.Error.type* %.tmp1665, %m751$.Error.type** %err.1433
br label %.if.end.1659
.if.false.1659:
%.tmp1666 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1667 = load %m307$.Rule.type*, %m307$.Rule.type** %alias_rule.1656
%.tmp1668 = call %m307$.ParseResult.type*(%m307$.AstContext.type*,%m307$.Rule.type*) @m307$parse_to_ast.m307$.ParseResult.typep.m307$.AstContext.typep.m307$.Rule.typep(%m307$.AstContext.type* %.tmp1666, %m307$.Rule.type* %.tmp1667)
%parse_result.1669 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp1668, %m307$.ParseResult.type** %parse_result.1669
%.tmp1670 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %parse_result.1669
%.tmp1671 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1670, i32 0, i32 0
%.tmp1672 = load %m751$.Error.type*, %m751$.Error.type** %.tmp1671
%.tmp1673 = icmp ne %m751$.Error.type* %.tmp1672, null
br i1 %.tmp1673, label %.if.true.1674, label %.if.false.1674
.if.true.1674:
%.tmp1675 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %parse_result.1669
%.tmp1676 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1675, i32 0, i32 0
%.tmp1677 = load %m751$.Error.type*, %m751$.Error.type** %.tmp1676
store %m751$.Error.type* %.tmp1677, %m751$.Error.type** %err.1433
br label %.if.end.1674
.if.false.1674:
%.tmp1678 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1679 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %parse_result.1669
%.tmp1680 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1679, i32 0, i32 1
%.tmp1681 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1680
call void(%m307$.Node.type*,%m307$.Node.type*) @m307$child_append.v.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp1678, %m307$.Node.type* %.tmp1681)
%.tmp1682 = load i32, i32* %new_children.1431
%.tmp1683 = add i32 %.tmp1682, 1
store i32 %.tmp1683, i32* %new_children.1431
br label %.if.end.1674
.if.end.1674:
%.tmp1684 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %parse_result.1669
%.tmp1685 = bitcast %m307$.ParseResult.type* %.tmp1684 to i8*
call void(i8*) @free(i8* %.tmp1685)
br label %.if.end.1659
.if.end.1659:
br label %.if.end.1648
.if.false.1648:
%.tmp1687 = getelementptr [41 x i8], [41 x i8]*@.str1686, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1687)
br label %.if.end.1648
.if.end.1648:
br label %.if.end.1562
.if.end.1562:
br label %.if.end.1448
.if.end.1448:
%.tmp1688 = load %m307$.Query.type*, %m307$.Query.type** %q.1438
%.tmp1689 = getelementptr %m307$.Query.type, %m307$.Query.type* %.tmp1688, i32 0, i32 2
%.tmp1690 = load %m307$.Query.type*, %m307$.Query.type** %.tmp1689
store %m307$.Query.type* %.tmp1690, %m307$.Query.type** %q.1438
br label %.for.start.1434
.for.end.1434:
%.tmp1691 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1692 = icmp ne %m751$.Error.type* %.tmp1691, null
br i1 %.tmp1692, label %.if.true.1693, label %.if.false.1693
.if.true.1693:
%.tmp1694 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1695 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1694, i32 0, i32 0
%.tmp1696 = load %m308$.Token.type*, %m308$.Token.type** %start_token.1430
store %m308$.Token.type* %.tmp1696, %m308$.Token.type** %.tmp1695
%i.1698 = alloca i32
store i32 0, i32* %i.1698
br label %.for.start.1697
.for.start.1697:
%.tmp1699 = load i32, i32* %i.1698
%.tmp1700 = load i32, i32* %new_children.1431
%.tmp1701 = icmp slt i32 %.tmp1699, %.tmp1700
br i1 %.tmp1701, label %.for.continue.1697, label %.for.end.1697
.for.continue.1697:
%.tmp1702 = load %m307$.Node.type*, %m307$.Node.type** %base
call void(%m307$.Node.type*) @m307$child_pop.v.m307$.Node.typep(%m307$.Node.type* %.tmp1702)
%.tmp1703 = load i32, i32* %i.1698
%.tmp1704 = add i32 %.tmp1703, 1
store i32 %.tmp1704, i32* %i.1698
br label %.for.start.1697
.for.end.1697:
br label %.if.end.1693
.if.false.1693:
br label %.if.end.1693
.if.end.1693:
%.tmp1705 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1706 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1705, i32 0, i32 2
%.tmp1707 = load %m307$.Matcher.type*, %m307$.Matcher.type** %.tmp1706
%.tmp1708 = icmp ne %m307$.Matcher.type* %.tmp1707, null
%.tmp1709 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1710 = icmp ne %m751$.Error.type* %.tmp1709, null
%.tmp1711 = and i1 %.tmp1708, %.tmp1710
br i1 %.tmp1711, label %.if.true.1712, label %.if.false.1712
.if.true.1712:
%.tmp1713 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1714 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1715 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1714, i32 0, i32 2
%.tmp1716 = load %m307$.Matcher.type*, %m307$.Matcher.type** %.tmp1715
%.tmp1717 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1718 = call %m751$.Error.type*(%m307$.AstContext.type*,%m307$.Matcher.type*,%m307$.Node.type*) @m307$parse_query.m751$.Error.typep.m307$.AstContext.typep.m307$.Matcher.typep.m307$.Node.typep(%m307$.AstContext.type* %.tmp1713, %m307$.Matcher.type* %.tmp1716, %m307$.Node.type* %.tmp1717)
%new_err.1719 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp1718, %m751$.Error.type** %new_err.1719
%.tmp1720 = load %m751$.Error.type*, %m751$.Error.type** %new_err.1719
%.tmp1721 = icmp eq %m751$.Error.type* %.tmp1720, null
br i1 %.tmp1721, label %.if.true.1722, label %.if.false.1722
.if.true.1722:
store %m751$.Error.type* null, %m751$.Error.type** %err.1433
br label %.if.end.1722
.if.false.1722:
%.tmp1723 = load %m751$.Error.type*, %m751$.Error.type** %new_err.1719
%.tmp1724 = bitcast %m751$.Error.type* %.tmp1723 to i8*
call void(i8*) @free(i8* %.tmp1724)
br label %.if.end.1722
.if.end.1722:
br label %.if.end.1712
.if.false.1712:
br label %.if.end.1712
.if.end.1712:
%.tmp1725 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1726 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1725, i32 0, i32 1
%.tmp1727 = load i8, i8* %.tmp1726
%.tmp1728 = icmp eq i8 %.tmp1727, 49
br i1 %.tmp1728, label %.if.true.1729, label %.if.false.1729
.if.true.1729:
br label %.if.end.1729
.if.false.1729:
%.tmp1730 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1731 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1730, i32 0, i32 1
%.tmp1732 = load i8, i8* %.tmp1731
%.tmp1733 = icmp eq i8 %.tmp1732, 43
%.tmp1734 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1735 = icmp eq %m751$.Error.type* %.tmp1734, null
%.tmp1736 = and i1 %.tmp1733, %.tmp1735
br i1 %.tmp1736, label %.if.true.1737, label %.if.false.1737
.if.true.1737:
%.tmp1738 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1739 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1740 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1741 = call %m751$.Error.type*(%m307$.AstContext.type*,%m307$.Matcher.type*,%m307$.Node.type*) @m307$parse_query.m751$.Error.typep.m307$.AstContext.typep.m307$.Matcher.typep.m307$.Node.typep(%m307$.AstContext.type* %.tmp1738, %m307$.Matcher.type* %.tmp1739, %m307$.Node.type* %.tmp1740)
store %m751$.Error.type* %.tmp1741, %m751$.Error.type** %err.1433
%.tmp1742 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1743 = icmp ne %m751$.Error.type* %.tmp1742, null
br i1 %.tmp1743, label %.if.true.1744, label %.if.false.1744
.if.true.1744:
%.tmp1745 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1746 = bitcast %m751$.Error.type* %.tmp1745 to i8*
call void(i8*) @free(i8* %.tmp1746)
store %m751$.Error.type* null, %m751$.Error.type** %err.1433
br label %.if.end.1744
.if.false.1744:
%.tmp1747 = bitcast ptr null to %m751$.Error.type*
ret %m751$.Error.type* %.tmp1747
br label %.if.end.1744
.if.end.1744:
br label %.if.end.1737
.if.false.1737:
%.tmp1748 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1749 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1748, i32 0, i32 1
%.tmp1750 = load i8, i8* %.tmp1749
%.tmp1751 = icmp eq i8 %.tmp1750, 63
%.tmp1752 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1753 = icmp ne %m751$.Error.type* %.tmp1752, null
%.tmp1754 = and i1 %.tmp1751, %.tmp1753
br i1 %.tmp1754, label %.if.true.1755, label %.if.false.1755
.if.true.1755:
%.tmp1756 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1757 = bitcast %m751$.Error.type* %.tmp1756 to i8*
call void(i8*) @free(i8* %.tmp1757)
store %m751$.Error.type* null, %m751$.Error.type** %err.1433
br label %.if.end.1755
.if.false.1755:
%.tmp1758 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1759 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1758, i32 0, i32 1
%.tmp1760 = load i8, i8* %.tmp1759
%.tmp1761 = icmp eq i8 %.tmp1760, 42
br i1 %.tmp1761, label %.if.true.1762, label %.if.false.1762
.if.true.1762:
%.tmp1763 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1764 = icmp ne %m751$.Error.type* %.tmp1763, null
br i1 %.tmp1764, label %.if.true.1765, label %.if.false.1765
.if.true.1765:
%.tmp1766 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1767 = bitcast %m751$.Error.type* %.tmp1766 to i8*
call void(i8*) @free(i8* %.tmp1767)
store %m751$.Error.type* null, %m751$.Error.type** %err.1433
br label %.if.end.1765
.if.false.1765:
%.tmp1768 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1769 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1770 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1771 = call %m751$.Error.type*(%m307$.AstContext.type*,%m307$.Matcher.type*,%m307$.Node.type*) @m307$parse_query.m751$.Error.typep.m307$.AstContext.typep.m307$.Matcher.typep.m307$.Node.typep(%m307$.AstContext.type* %.tmp1768, %m307$.Matcher.type* %.tmp1769, %m307$.Node.type* %.tmp1770)
ret %m751$.Error.type* %.tmp1771
br label %.if.end.1765
.if.end.1765:
br label %.if.end.1762
.if.false.1762:
br label %.if.end.1762
.if.end.1762:
br label %.if.end.1755
.if.end.1755:
br label %.if.end.1737
.if.end.1737:
br label %.if.end.1729
.if.end.1729:
%.tmp1772 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1773 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1772, i32 0, i32 3
%.tmp1774 = load %m307$.Matcher.type*, %m307$.Matcher.type** %.tmp1773
%.tmp1775 = icmp ne %m307$.Matcher.type* %.tmp1774, null
%.tmp1776 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1777 = icmp eq %m751$.Error.type* %.tmp1776, null
%.tmp1778 = and i1 %.tmp1775, %.tmp1777
br i1 %.tmp1778, label %.if.true.1779, label %.if.false.1779
.if.true.1779:
%.tmp1780 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1781 = load %m307$.Matcher.type*, %m307$.Matcher.type** %m
%.tmp1782 = getelementptr %m307$.Matcher.type, %m307$.Matcher.type* %.tmp1781, i32 0, i32 3
%.tmp1783 = load %m307$.Matcher.type*, %m307$.Matcher.type** %.tmp1782
%.tmp1784 = load %m307$.Node.type*, %m307$.Node.type** %base
%.tmp1785 = call %m751$.Error.type*(%m307$.AstContext.type*,%m307$.Matcher.type*,%m307$.Node.type*) @m307$parse_query.m751$.Error.typep.m307$.AstContext.typep.m307$.Matcher.typep.m307$.Node.typep(%m307$.AstContext.type* %.tmp1780, %m307$.Matcher.type* %.tmp1783, %m307$.Node.type* %.tmp1784)
store %m751$.Error.type* %.tmp1785, %m751$.Error.type** %err.1433
br label %.if.end.1779
.if.false.1779:
br label %.if.end.1779
.if.end.1779:
%.tmp1786 = load %m751$.Error.type*, %m751$.Error.type** %err.1433
%.tmp1787 = bitcast %m751$.Error.type* %.tmp1786 to %m751$.Error.type*
ret %m751$.Error.type* %.tmp1787
}
define %m307$.ParseResult.type* @m307$parse_to_ast.m307$.ParseResult.typep.m307$.AstContext.typep.m307$.Rule.typep(%m307$.AstContext.type* %.c.arg, %m307$.Rule.type* %.rule.arg) {
%c = alloca %m307$.AstContext.type*
store %m307$.AstContext.type* %.c.arg, %m307$.AstContext.type** %c
%rule = alloca %m307$.Rule.type*
store %m307$.Rule.type* %.rule.arg, %m307$.Rule.type** %rule
%.tmp1788 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* null, i32 1
%.tmp1789 = ptrtoint %m307$.ParseResult.type* %.tmp1788 to i32
%.tmp1790 = call i8*(i32) @malloc(i32 %.tmp1789)
%.tmp1791 = bitcast i8* %.tmp1790 to %m307$.ParseResult.type*
%res.1792 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp1791, %m307$.ParseResult.type** %res.1792
%.tmp1793 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1792
%.tmp1794 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1793, i32 0, i32 0
store %m751$.Error.type* null, %m751$.Error.type** %.tmp1794
%.tmp1795 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1792
%.tmp1796 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1795, i32 0, i32 1
%.tmp1797 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1798 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1797, i32 0, i32 0
%.tmp1799 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1798
%.tmp1800 = load %m307$.Rule.type*, %m307$.Rule.type** %rule
%.tmp1801 = getelementptr %m307$.Rule.type, %m307$.Rule.type* %.tmp1800, i32 0, i32 0
%.tmp1802 = load i8*, i8** %.tmp1801
%.tmp1803 = bitcast ptr null to i8*
%.tmp1804 = call %m307$.Node.type*(%m308$.Token.type*,i8*,i8*) @m307$new_node.m307$.Node.typep.m308$.Token.typep.cp.cp(%m308$.Token.type* %.tmp1799, i8* %.tmp1802, i8* %.tmp1803)
store %m307$.Node.type* %.tmp1804, %m307$.Node.type** %.tmp1796
%.tmp1805 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1806 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %.tmp1805, i32 0, i32 0
%.tmp1807 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1806
%start_match.1808 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp1807, %m308$.Token.type** %start_match.1808
%.tmp1809 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1792
%.tmp1810 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1809, i32 0, i32 0
%.tmp1811 = load %m307$.AstContext.type*, %m307$.AstContext.type** %c
%.tmp1812 = load %m307$.Rule.type*, %m307$.Rule.type** %rule
%.tmp1813 = getelementptr %m307$.Rule.type, %m307$.Rule.type* %.tmp1812, i32 0, i32 1
%.tmp1814 = load %m307$.Matcher.type*, %m307$.Matcher.type** %.tmp1813
%.tmp1815 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1792
%.tmp1816 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1815, i32 0, i32 1
%.tmp1817 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1816
%.tmp1818 = call %m751$.Error.type*(%m307$.AstContext.type*,%m307$.Matcher.type*,%m307$.Node.type*) @m307$parse_query.m751$.Error.typep.m307$.AstContext.typep.m307$.Matcher.typep.m307$.Node.typep(%m307$.AstContext.type* %.tmp1811, %m307$.Matcher.type* %.tmp1814, %m307$.Node.type* %.tmp1817)
store %m751$.Error.type* %.tmp1818, %m751$.Error.type** %.tmp1810
%.tmp1819 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1792
ret %m307$.ParseResult.type* %.tmp1819
}
define %m307$.ParseResult.type* @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.grammar.arg, i8* %.start.arg, %m308$.Token.type* %.tokens.arg) {
%grammar = alloca %m307$.Rule.type**
store %m307$.Rule.type** %.grammar.arg, %m307$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m308$.Token.type*
store %m308$.Token.type* %.tokens.arg, %m308$.Token.type** %tokens
%.tmp1820 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar
%.tmp1821 = load i8*, i8** %start
%.tmp1822 = call %m307$.Rule.type*(%m307$.Rule.type**,i8*) @m307$_find_rule.m307$.Rule.typep.m307$.Rule.typepp.cp(%m307$.Rule.type** %.tmp1820, i8* %.tmp1821)
%start_matcher.1823 = alloca %m307$.Rule.type*
store %m307$.Rule.type* %.tmp1822, %m307$.Rule.type** %start_matcher.1823
%.tmp1824 = load %m307$.Rule.type*, %m307$.Rule.type** %start_matcher.1823
%.tmp1825 = icmp ne %m307$.Rule.type* %.tmp1824, null
%.tmp1827 = getelementptr [44 x i8], [44 x i8]*@.str1826, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1825, i8* %.tmp1827)
%c.1828 = alloca %m307$.AstContext.type
%.tmp1829 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0, i32 0
store %m308$.Token.type* null, %m308$.Token.type** %.tmp1829
%.tmp1830 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0, i32 1
store %m307$.Rule.type** null, %m307$.Rule.type*** %.tmp1830
%.tmp1831 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0, i32 0
%.tmp1832 = load %m308$.Token.type*, %m308$.Token.type** %tokens
store %m308$.Token.type* %.tmp1832, %m308$.Token.type** %.tmp1831
%.tmp1833 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0, i32 1
%.tmp1834 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar
store %m307$.Rule.type** %.tmp1834, %m307$.Rule.type*** %.tmp1833
%.tmp1835 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0
%.tmp1836 = load %m307$.Rule.type*, %m307$.Rule.type** %start_matcher.1823
%.tmp1837 = call %m307$.ParseResult.type*(%m307$.AstContext.type*,%m307$.Rule.type*) @m307$parse_to_ast.m307$.ParseResult.typep.m307$.AstContext.typep.m307$.Rule.typep(%m307$.AstContext.type* %.tmp1835, %m307$.Rule.type* %.tmp1836)
%res.1838 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp1837, %m307$.ParseResult.type** %res.1838
%.tmp1839 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0, i32 0
%.tmp1840 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1839
%.tmp1841 = getelementptr %m308$.Token.type, %m308$.Token.type* %.tmp1840, i32 0, i32 0
%.tmp1842 = load i8*, i8** %.tmp1841
%.tmp1844 = getelementptr [4 x i8], [4 x i8]*@.str1843, i32 0, i32 0
%.tmp1845 = call i32(i8*,i8*) @strcmp(i8* %.tmp1842, i8* %.tmp1844)
%.tmp1846 = icmp ne i32 %.tmp1845, 0
%.tmp1847 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1838
%.tmp1848 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1847, i32 0, i32 0
%.tmp1849 = load %m751$.Error.type*, %m751$.Error.type** %.tmp1848
%.tmp1850 = icmp eq %m751$.Error.type* %.tmp1849, null
%.tmp1851 = and i1 %.tmp1846, %.tmp1850
br i1 %.tmp1851, label %.if.true.1852, label %.if.false.1852
.if.true.1852:
%.tmp1853 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1838
%.tmp1854 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp1853, i32 0, i32 0
%.tmp1855 = getelementptr %m307$.AstContext.type, %m307$.AstContext.type* %c.1828, i32 0, i32 0
%.tmp1856 = load %m308$.Token.type*, %m308$.Token.type** %.tmp1855
%.tmp1858 = getelementptr [26 x i8], [26 x i8]*@.str1857, i32 0, i32 0
%.tmp1859 = call %m751$.Error.type*(%m308$.Token.type*,i8*) @m751$from.m751$.Error.typep.m308$.Token.typep.cp(%m308$.Token.type* %.tmp1856, i8* %.tmp1858)
store %m751$.Error.type* %.tmp1859, %m751$.Error.type** %.tmp1854
br label %.if.end.1852
.if.false.1852:
br label %.if.end.1852
.if.end.1852:
%.tmp1860 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %res.1838
ret %m307$.ParseResult.type* %.tmp1860
}
@.str852 = constant [2 x i8] c"(\00"
@.str872 = constant [2 x i8] c"|\00"
@.str892 = constant [2 x i8] c")\00"
@.str901 = constant [4 x i8] c"EOF\00"
@.str918 = constant [2 x i8] c"|\00"
@.str927 = constant [2 x i8] c")\00"
@.str933 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str956 = constant [2 x i8] c"|\00"
@.str973 = constant [2 x i8] c")\00"
@.str979 = constant [22 x i8] c"open brace not closed\00"
@.str993 = constant [2 x i8] c"+\00"
@.str1012 = constant [2 x i8] c"*\00"
@.str1031 = constant [2 x i8] c"?\00"
@.str1052 = constant [2 x i8] c"(\00"
@.str1061 = constant [5 x i8] c"WORD\00"
@.str1083 = constant [5 x i8] c"WORD\00"
@.str1090 = constant [7 x i8] c"STRING\00"
@.str1132 = constant [7 x i8] c"STRING\00"
@.str1157 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1166 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1198 = constant [5 x i8] c"WORD\00"
@.str1203 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1217 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1231 = constant [2 x i8] c":\00"
@.str1243 = constant [27 x i8] c"expected : after rule name\00"
@.str1286 = constant [4 x i8] c"EOF\00"
@.str1295 = constant [3 x i8] c"NL\00"
@.str1462 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1519 = constant [7 x i8] c"(null)\00"
@.str1521 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1524 = constant [31 x i8] c"unable to match token by value\00"
@.str1599 = constant [13 x i8] c"%s: %s != %s\00"
@.str1602 = constant [30 x i8] c"unable to match token by type\00"
@.str1663 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1686 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1826 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1843 = constant [4 x i8] c"EOF\00"
@.str1857 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1862$grammar.cp() {
%.tmp1864 = getelementptr [1652 x i8], [1652 x i8]*@.str1863, i32 0, i32 0
ret i8* %.tmp1864
}
@.str1863 = constant [1652 x i8] c"
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
define i8* @m1865$node_to_string.cp.m307$.Node.typep(%m307$.Node.type* %.n.arg) {
%n = alloca %m307$.Node.type*
store %m307$.Node.type* %.n.arg, %m307$.Node.type** %n
%.tmp1866 = call %m0$.File.type*() @tmpfile()
%tmp.1867 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1866, %m0$.File.type** %tmp.1867
%.tmp1868 = load %m307$.Node.type*, %m307$.Node.type** %n
%.tmp1869 = load %m0$.File.type*, %m0$.File.type** %tmp.1867
call void(%m307$.Node.type*,%m0$.File.type*,i32) @m1865$_node_to_string.v.m307$.Node.typep.m0$.File.typep.i(%m307$.Node.type* %.tmp1868, %m0$.File.type* %.tmp1869, i32 1)
%.tmp1870 = load %m0$.File.type*, %m0$.File.type** %tmp.1867
%.tmp1871 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1870)
%.tmp1872 = load %m0$.File.type*, %m0$.File.type** %tmp.1867
%.tmp1873 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1872)
%str_len.1874 = alloca i32
store i32 %.tmp1873, i32* %str_len.1874
%.tmp1875 = load %m0$.File.type*, %m0$.File.type** %tmp.1867
%.tmp1876 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1875)
%tmp_fd.1877 = alloca i32
store i32 %.tmp1876, i32* %tmp_fd.1877
%.tmp1878 = load i32, i32* %tmp_fd.1877
%.tmp1879 = load i32, i32* @SEEK_SET
%.tmp1880 = call i32(i32,i32,i32) @lseek(i32 %.tmp1878, i32 0, i32 %.tmp1879)
%.tmp1881 = load i32, i32* %str_len.1874
%.tmp1882 = call i8*(i32) @malloc(i32 %.tmp1881)
%buf.1883 = alloca i8*
store i8* %.tmp1882, i8** %buf.1883
%.tmp1884 = load i32, i32* %tmp_fd.1877
%.tmp1885 = load i8*, i8** %buf.1883
%.tmp1886 = load i32, i32* %str_len.1874
%.tmp1887 = call i32(i32,i8*,i32) @read(i32 %.tmp1884, i8* %.tmp1885, i32 %.tmp1886)
%read.1888 = alloca i32
store i32 %.tmp1887, i32* %read.1888
%.tmp1889 = load i32, i32* %read.1888
%.tmp1890 = load i32, i32* %str_len.1874
%.tmp1891 = icmp ne i32 %.tmp1889, %.tmp1890
br i1 %.tmp1891, label %.if.true.1892, label %.if.false.1892
.if.true.1892:
%.tmp1893 = load i8*, i8** %buf.1883
call void(i8*) @free(i8* %.tmp1893)
store i8* null, i8** %buf.1883
br label %.if.end.1892
.if.false.1892:
br label %.if.end.1892
.if.end.1892:
%.tmp1894 = load i8*, i8** %buf.1883
ret i8* %.tmp1894
}
define void @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1895 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1897 = getelementptr [2 x i8], [2 x i8]*@.str1896, i32 0, i32 0
%.tmp1898 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1895, i8* %.tmp1897)
%i.1900 = alloca i32
store i32 0, i32* %i.1900
br label %.for.start.1899
.for.start.1899:
%.tmp1901 = load i32, i32* %i.1900
%.tmp1902 = load i32, i32* %indent
%.tmp1903 = icmp slt i32 %.tmp1901, %.tmp1902
br i1 %.tmp1903, label %.for.continue.1899, label %.for.end.1899
.for.continue.1899:
%.tmp1904 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1906 = getelementptr [3 x i8], [3 x i8]*@.str1905, i32 0, i32 0
%.tmp1907 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1904, i8* %.tmp1906)
%.tmp1908 = load i32, i32* %i.1900
%.tmp1909 = add i32 %.tmp1908, 1
store i32 %.tmp1909, i32* %i.1900
br label %.for.start.1899
.for.end.1899:
ret void
}
define void @m1865$_node_to_string.v.m307$.Node.typep.m0$.File.typep.i(%m307$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1910 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1911 = icmp eq %m307$.Node.type* %.tmp1910, null
br i1 %.tmp1911, label %.if.true.1912, label %.if.false.1912
.if.true.1912:
%.tmp1913 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1915 = getelementptr [7 x i8], [7 x i8]*@.str1914, i32 0, i32 0
%.tmp1916 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1913, i8* %.tmp1915)
ret void
br label %.if.end.1912
.if.false.1912:
br label %.if.end.1912
.if.end.1912:
%.tmp1917 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1919 = getelementptr [2 x i8], [2 x i8]*@.str1918, i32 0, i32 0
%.tmp1920 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1917, i8* %.tmp1919)
%.tmp1921 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1922 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1921, i32 %.tmp1922)
%.tmp1923 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1925 = getelementptr [13 x i8], [13 x i8]*@.str1924, i32 0, i32 0
%.tmp1926 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1927 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1926, i32 0, i32 0
%.tmp1928 = load i8*, i8** %.tmp1927
%.tmp1929 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1923, i8* %.tmp1925, i8* %.tmp1928)
%.tmp1930 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1931 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1930, i32 %.tmp1931)
%.tmp1932 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1934 = getelementptr [12 x i8], [12 x i8]*@.str1933, i32 0, i32 0
%.tmp1935 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1936 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1935, i32 0, i32 1
%.tmp1937 = load i8*, i8** %.tmp1936
%.tmp1938 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1932, i8* %.tmp1934, i8* %.tmp1937)
%.tmp1939 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1940 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1939, i32 %.tmp1940)
%.tmp1941 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1943 = getelementptr [11 x i8], [11 x i8]*@.str1942, i32 0, i32 0
%.tmp1944 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1945 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1944, i32 0, i32 3
%.tmp1946 = load i32, i32* %.tmp1945
%.tmp1947 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1941, i8* %.tmp1943, i32 %.tmp1946)
%.tmp1948 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1949 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1948, i32 %.tmp1949)
%.tmp1950 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1952 = getelementptr [19 x i8], [19 x i8]*@.str1951, i32 0, i32 0
%.tmp1953 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1954 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1953, i32 0, i32 4
%.tmp1955 = load i32, i32* %.tmp1954
%.tmp1956 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1950, i8* %.tmp1952, i32 %.tmp1955)
%.tmp1957 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1958 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1957, i32 %.tmp1958)
%.tmp1959 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1961 = getelementptr [9 x i8], [9 x i8]*@.str1960, i32 0, i32 0
%.tmp1962 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1959, i8* %.tmp1961)
%.tmp1963 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1964 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1963, i32 0, i32 7
%.tmp1965 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1964
%.tmp1966 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1967 = load i32, i32* %indent
%.tmp1968 = add i32 %.tmp1967, 1
call void(%m307$.Node.type*,%m0$.File.type*,i32) @m1865$_node_to_string.v.m307$.Node.typep.m0$.File.typep.i(%m307$.Node.type* %.tmp1965, %m0$.File.type* %.tmp1966, i32 %.tmp1968)
%.tmp1969 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1970 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1969, i32 %.tmp1970)
%.tmp1971 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1973 = getelementptr [13 x i8], [13 x i8]*@.str1972, i32 0, i32 0
%.tmp1974 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1971, i8* %.tmp1973)
%.tmp1975 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp1976 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp1975, i32 0, i32 6
%.tmp1977 = load %m307$.Node.type*, %m307$.Node.type** %.tmp1976
%.tmp1978 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1979 = load i32, i32* %indent
%.tmp1980 = add i32 %.tmp1979, 1
call void(%m307$.Node.type*,%m0$.File.type*,i32) @m1865$_node_to_string.v.m307$.Node.typep.m0$.File.typep.i(%m307$.Node.type* %.tmp1977, %m0$.File.type* %.tmp1978, i32 %.tmp1980)
%.tmp1981 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1982 = load i32, i32* %indent
%.tmp1983 = sub i32 %.tmp1982, 1
call void(%m0$.File.type*,i32) @m1865$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1981, i32 %.tmp1983)
%.tmp1984 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1986 = getelementptr [2 x i8], [2 x i8]*@.str1985, i32 0, i32 0
%.tmp1987 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1984, i8* %.tmp1986)
ret void
}
@.str1896 = constant [2 x i8] c"\0A\00"
@.str1905 = constant [3 x i8] c"  \00"
@.str1914 = constant [7 x i8] c"(null)\00"
@.str1918 = constant [2 x i8] c"{\00"
@.str1924 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1933 = constant [12 x i8] c"\22value\22: %s\00"
@.str1942 = constant [11 x i8] c"\22line\22: %d\00"
@.str1951 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1960 = constant [9 x i8] c"\22next\22: \00"
@.str1972 = constant [13 x i8] c"\22children\22: \00"
@.str1985 = constant [2 x i8] c"}\00"
%m1988$.SYStack.type = type {%m307$.Node.type*,%m1988$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1988$.SYStack.type* @m1988$stack_new.m1988$.SYStack.typep() {
%.tmp1989 = load i32, i32* @SYStack_size
%.tmp1990 = call i8*(i32) @malloc(i32 %.tmp1989)
%.tmp1991 = bitcast i8* %.tmp1990 to %m1988$.SYStack.type*
%s.1992 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp1991, %m1988$.SYStack.type** %s.1992
%.tmp1993 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.1992
%.tmp1994 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp1993, i32 0, i32 0
store %m307$.Node.type* null, %m307$.Node.type** %.tmp1994
%.tmp1995 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.1992
%.tmp1996 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp1995, i32 0, i32 1
store %m1988$.SYStack.type* null, %m1988$.SYStack.type** %.tmp1996
%.tmp1997 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.1992
ret %m1988$.SYStack.type* %.tmp1997
}
define %m1988$.SYStack.type* @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.assignable.arg) {
%assignable = alloca %m307$.Node.type*
store %m307$.Node.type* %.assignable.arg, %m307$.Node.type** %assignable
%.tmp1998 = call %m1988$.SYStack.type*() @m1988$stack_new.m1988$.SYStack.typep()
%out_stack.1999 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp1998, %m1988$.SYStack.type** %out_stack.1999
%.tmp2000 = call %m1988$.SYStack.type*() @m1988$stack_new.m1988$.SYStack.typep()
%op_stack.2001 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp2000, %m1988$.SYStack.type** %op_stack.2001
%.tmp2002 = call %m1988$.SYStack.type*() @m1988$stack_new.m1988$.SYStack.typep()
%token_stack.2003 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp2002, %m1988$.SYStack.type** %token_stack.2003
%ptr.2004 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %ptr.2004
%.tmp2006 = load %m307$.Node.type*, %m307$.Node.type** %assignable
store %m307$.Node.type* %.tmp2006, %m307$.Node.type** %ptr.2004
br label %.for.start.2005
.for.start.2005:
%.tmp2007 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2008 = icmp ne %m307$.Node.type* %.tmp2007, null
br i1 %.tmp2008, label %.for.continue.2005, label %.for.end.2005
.for.continue.2005:
%.tmp2009 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %token_stack.2003
%.tmp2010 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2011 = call %m1988$.SYStack.type*(%m1988$.SYStack.type*,%m307$.Node.type*) @m1988$stack_push.m1988$.SYStack.typep.m1988$.SYStack.typep.m307$.Node.typep(%m1988$.SYStack.type* %.tmp2009, %m307$.Node.type* %.tmp2010)
store %m1988$.SYStack.type* %.tmp2011, %m1988$.SYStack.type** %token_stack.2003
%.tmp2012 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2013 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2012, i32 0, i32 7
%.tmp2014 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2013
store %m307$.Node.type* %.tmp2014, %m307$.Node.type** %ptr.2004
br label %.for.start.2005
.for.end.2005:
%.tmp2016 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %token_stack.2003
%.tmp2017 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2016, i32 0, i32 0
%.tmp2018 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2017
store %m307$.Node.type* %.tmp2018, %m307$.Node.type** %ptr.2004
br label %.for.start.2015
.for.start.2015:
%.tmp2019 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2020 = icmp ne %m307$.Node.type* %.tmp2019, null
br i1 %.tmp2020, label %.for.continue.2015, label %.for.end.2015
.for.continue.2015:
%.tmp2021 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %token_stack.2003
%cs.2022 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp2021, %m1988$.SYStack.type** %cs.2022
%.tmp2023 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %token_stack.2003
%.tmp2024 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2023, i32 0, i32 1
%.tmp2025 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp2024
store %m1988$.SYStack.type* %.tmp2025, %m1988$.SYStack.type** %token_stack.2003
%.tmp2026 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %cs.2022
%.tmp2027 = bitcast %m1988$.SYStack.type* %.tmp2026 to i8*
call void(i8*) @free(i8* %.tmp2027)
%.tmp2028 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2029 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2028, i32 0, i32 0
%.tmp2030 = load i8*, i8** %.tmp2029
%.tmp2032 = getelementptr [16 x i8], [16 x i8]*@.str2031, i32 0, i32 0
%.tmp2033 = call i32(i8*,i8*) @strcmp(i8* %.tmp2030, i8* %.tmp2032)
%.tmp2034 = icmp eq i32 %.tmp2033, 0
br i1 %.tmp2034, label %.if.true.2035, label %.if.false.2035
.if.true.2035:
%.tmp2036 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %out_stack.1999
%.tmp2037 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2038 = call %m1988$.SYStack.type*(%m1988$.SYStack.type*,%m307$.Node.type*) @m1988$stack_push.m1988$.SYStack.typep.m1988$.SYStack.typep.m307$.Node.typep(%m1988$.SYStack.type* %.tmp2036, %m307$.Node.type* %.tmp2037)
store %m1988$.SYStack.type* %.tmp2038, %m1988$.SYStack.type** %out_stack.1999
br label %.if.end.2035
.if.false.2035:
%.tmp2039 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2040 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2039, i32 0, i32 0
%.tmp2041 = load i8*, i8** %.tmp2040
%.tmp2043 = getelementptr [9 x i8], [9 x i8]*@.str2042, i32 0, i32 0
%.tmp2044 = call i32(i8*,i8*) @strcmp(i8* %.tmp2041, i8* %.tmp2043)
%.tmp2045 = icmp eq i32 %.tmp2044, 0
br i1 %.tmp2045, label %.if.true.2046, label %.if.false.2046
.if.true.2046:
%quit.2047 = alloca i1
store i1 0, i1* %quit.2047
br label %.for.start.2048
.for.start.2048:
%.tmp2049 = load i1, i1* %quit.2047
%.tmp2050 = icmp eq i1 %.tmp2049, 0
br i1 %.tmp2050, label %.for.continue.2048, label %.for.end.2048
.for.continue.2048:
%.tmp2051 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2052 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2051, i32 0, i32 0
%.tmp2053 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2052
%.tmp2054 = icmp eq %m307$.Node.type* %.tmp2053, null
br i1 %.tmp2054, label %.if.true.2055, label %.if.false.2055
.if.true.2055:
store i1 1, i1* %quit.2047
br label %.if.end.2055
.if.false.2055:
%.tmp2056 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2057 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2056, i32 0, i32 0
%.tmp2058 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2057
%.tmp2059 = call i32(%m307$.Node.type*) @m1988$op_precedence.i.m307$.Node.typep(%m307$.Node.type* %.tmp2058)
%.tmp2060 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2061 = call i32(%m307$.Node.type*) @m1988$op_precedence.i.m307$.Node.typep(%m307$.Node.type* %.tmp2060)
%.tmp2062 = icmp slt i32 %.tmp2059, %.tmp2061
br i1 %.tmp2062, label %.if.true.2063, label %.if.false.2063
.if.true.2063:
%.tmp2064 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%top.2065 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp2064, %m1988$.SYStack.type** %top.2065
%.tmp2066 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2067 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2066, i32 0, i32 1
%.tmp2068 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp2067
store %m1988$.SYStack.type* %.tmp2068, %m1988$.SYStack.type** %op_stack.2001
%.tmp2069 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %out_stack.1999
%.tmp2070 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %top.2065
%.tmp2071 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2070, i32 0, i32 0
%.tmp2072 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2071
%.tmp2073 = call %m1988$.SYStack.type*(%m1988$.SYStack.type*,%m307$.Node.type*) @m1988$stack_push.m1988$.SYStack.typep.m1988$.SYStack.typep.m307$.Node.typep(%m1988$.SYStack.type* %.tmp2069, %m307$.Node.type* %.tmp2072)
store %m1988$.SYStack.type* %.tmp2073, %m1988$.SYStack.type** %out_stack.1999
%.tmp2074 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %top.2065
%.tmp2075 = bitcast %m1988$.SYStack.type* %.tmp2074 to i8*
call void(i8*) @free(i8* %.tmp2075)
br label %.if.end.2063
.if.false.2063:
store i1 1, i1* %quit.2047
br label %.if.end.2063
.if.end.2063:
br label %.if.end.2055
.if.end.2055:
br label %.for.start.2048
.for.end.2048:
%.tmp2076 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2077 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2078 = call %m1988$.SYStack.type*(%m1988$.SYStack.type*,%m307$.Node.type*) @m1988$stack_push.m1988$.SYStack.typep.m1988$.SYStack.typep.m307$.Node.typep(%m1988$.SYStack.type* %.tmp2076, %m307$.Node.type* %.tmp2077)
store %m1988$.SYStack.type* %.tmp2078, %m1988$.SYStack.type** %op_stack.2001
br label %.if.end.2046
.if.false.2046:
%.tmp2080 = getelementptr [68 x i8], [68 x i8]*@.str2079, i32 0, i32 0
%.tmp2081 = load %m307$.Node.type*, %m307$.Node.type** %ptr.2004
%.tmp2082 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2081, i32 0, i32 0
%.tmp2083 = load i8*, i8** %.tmp2082
%.tmp2084 = call i32(i8*,...) @printf(i8* %.tmp2080, i8* %.tmp2083)
br label %.if.end.2046
.if.end.2046:
br label %.if.end.2035
.if.end.2035:
%.tmp2085 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %token_stack.2003
%.tmp2086 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2085, i32 0, i32 0
%.tmp2087 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2086
store %m307$.Node.type* %.tmp2087, %m307$.Node.type** %ptr.2004
br label %.for.start.2015
.for.end.2015:
br label %.for.start.2088
.for.start.2088:
%.tmp2089 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2090 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2089, i32 0, i32 0
%.tmp2091 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2090
%.tmp2092 = icmp ne %m307$.Node.type* %.tmp2091, null
br i1 %.tmp2092, label %.for.continue.2088, label %.for.end.2088
.for.continue.2088:
%.tmp2093 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2094 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2093, i32 0, i32 0
%.tmp2095 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2094
%node.2096 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp2095, %m307$.Node.type** %node.2096
%.tmp2097 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%s.2098 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp2097, %m1988$.SYStack.type** %s.2098
%.tmp2099 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %op_stack.2001
%.tmp2100 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2099, i32 0, i32 1
%.tmp2101 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp2100
store %m1988$.SYStack.type* %.tmp2101, %m1988$.SYStack.type** %op_stack.2001
%.tmp2102 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.2098
%.tmp2103 = bitcast %m1988$.SYStack.type* %.tmp2102 to i8*
call void(i8*) @free(i8* %.tmp2103)
%.tmp2104 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %out_stack.1999
%.tmp2105 = load %m307$.Node.type*, %m307$.Node.type** %node.2096
%.tmp2106 = call %m1988$.SYStack.type*(%m1988$.SYStack.type*,%m307$.Node.type*) @m1988$stack_push.m1988$.SYStack.typep.m1988$.SYStack.typep.m307$.Node.typep(%m1988$.SYStack.type* %.tmp2104, %m307$.Node.type* %.tmp2105)
store %m1988$.SYStack.type* %.tmp2106, %m1988$.SYStack.type** %out_stack.1999
br label %.for.start.2088
.for.end.2088:
%.tmp2107 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %out_stack.1999
ret %m1988$.SYStack.type* %.tmp2107
}
define %m1988$.SYStack.type* @m1988$stack_push.m1988$.SYStack.typep.m1988$.SYStack.typep.m307$.Node.typep(%m1988$.SYStack.type* %.curr_stack.arg, %m307$.Node.type* %.node.arg) {
%curr_stack = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.curr_stack.arg, %m1988$.SYStack.type** %curr_stack
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2108 = load i32, i32* @SYStack_size
%.tmp2109 = call i8*(i32) @malloc(i32 %.tmp2108)
%.tmp2110 = bitcast i8* %.tmp2109 to %m1988$.SYStack.type*
%s.2111 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp2110, %m1988$.SYStack.type** %s.2111
%.tmp2112 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.2111
%.tmp2113 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2112, i32 0, i32 0
%.tmp2114 = load %m307$.Node.type*, %m307$.Node.type** %node
store %m307$.Node.type* %.tmp2114, %m307$.Node.type** %.tmp2113
%.tmp2115 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.2111
%.tmp2116 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp2115, i32 0, i32 1
%.tmp2117 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %curr_stack
store %m1988$.SYStack.type* %.tmp2117, %m1988$.SYStack.type** %.tmp2116
%.tmp2118 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %s.2111
ret %m1988$.SYStack.type* %.tmp2118
}
define i32 @m1988$op_precedence.i.m307$.Node.typep(%m307$.Node.type* %.n.arg) {
%n = alloca %m307$.Node.type*
store %m307$.Node.type* %.n.arg, %m307$.Node.type** %n
%.tmp2119 = load %m307$.Node.type*, %m307$.Node.type** %n
%.tmp2120 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2119, i32 0, i32 6
%.tmp2121 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2120
%op.2122 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp2121, %m307$.Node.type** %op.2122
%.tmp2123 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2124 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2123, i32 0, i32 1
%.tmp2125 = load i8*, i8** %.tmp2124
%.tmp2127 = getelementptr [2 x i8], [2 x i8]*@.str2126, i32 0, i32 0
%.tmp2128 = call i32(i8*,i8*) @strcmp(i8* %.tmp2125, i8* %.tmp2127)
%.tmp2129 = icmp eq i32 %.tmp2128, 0
%.tmp2130 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2131 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2130, i32 0, i32 1
%.tmp2132 = load i8*, i8** %.tmp2131
%.tmp2134 = getelementptr [2 x i8], [2 x i8]*@.str2133, i32 0, i32 0
%.tmp2135 = call i32(i8*,i8*) @strcmp(i8* %.tmp2132, i8* %.tmp2134)
%.tmp2136 = icmp eq i32 %.tmp2135, 0
%.tmp2137 = or i1 %.tmp2129, %.tmp2136
br i1 %.tmp2137, label %.if.true.2138, label %.if.false.2138
.if.true.2138:
ret i32 4
br label %.if.end.2138
.if.false.2138:
%.tmp2139 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2140 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2139, i32 0, i32 1
%.tmp2141 = load i8*, i8** %.tmp2140
%.tmp2143 = getelementptr [2 x i8], [2 x i8]*@.str2142, i32 0, i32 0
%.tmp2144 = call i32(i8*,i8*) @strcmp(i8* %.tmp2141, i8* %.tmp2143)
%.tmp2145 = icmp eq i32 %.tmp2144, 0
%.tmp2146 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2147 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2146, i32 0, i32 1
%.tmp2148 = load i8*, i8** %.tmp2147
%.tmp2150 = getelementptr [2 x i8], [2 x i8]*@.str2149, i32 0, i32 0
%.tmp2151 = call i32(i8*,i8*) @strcmp(i8* %.tmp2148, i8* %.tmp2150)
%.tmp2152 = icmp eq i32 %.tmp2151, 0
%.tmp2153 = or i1 %.tmp2145, %.tmp2152
br i1 %.tmp2153, label %.if.true.2154, label %.if.false.2154
.if.true.2154:
ret i32 3
br label %.if.end.2154
.if.false.2154:
%.tmp2155 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2156 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2155, i32 0, i32 1
%.tmp2157 = load i8*, i8** %.tmp2156
%.tmp2159 = getelementptr [3 x i8], [3 x i8]*@.str2158, i32 0, i32 0
%.tmp2160 = call i32(i8*,i8*) @strcmp(i8* %.tmp2157, i8* %.tmp2159)
%.tmp2161 = icmp eq i32 %.tmp2160, 0
%.tmp2162 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2163 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2162, i32 0, i32 1
%.tmp2164 = load i8*, i8** %.tmp2163
%.tmp2166 = getelementptr [3 x i8], [3 x i8]*@.str2165, i32 0, i32 0
%.tmp2167 = call i32(i8*,i8*) @strcmp(i8* %.tmp2164, i8* %.tmp2166)
%.tmp2168 = icmp eq i32 %.tmp2167, 0
%.tmp2169 = or i1 %.tmp2161, %.tmp2168
br i1 %.tmp2169, label %.if.true.2170, label %.if.false.2170
.if.true.2170:
ret i32 7
br label %.if.end.2170
.if.false.2170:
%.tmp2171 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2172 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2171, i32 0, i32 1
%.tmp2173 = load i8*, i8** %.tmp2172
%.tmp2175 = getelementptr [3 x i8], [3 x i8]*@.str2174, i32 0, i32 0
%.tmp2176 = call i32(i8*,i8*) @strcmp(i8* %.tmp2173, i8* %.tmp2175)
%.tmp2177 = icmp eq i32 %.tmp2176, 0
%.tmp2178 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2179 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2178, i32 0, i32 1
%.tmp2180 = load i8*, i8** %.tmp2179
%.tmp2182 = getelementptr [3 x i8], [3 x i8]*@.str2181, i32 0, i32 0
%.tmp2183 = call i32(i8*,i8*) @strcmp(i8* %.tmp2180, i8* %.tmp2182)
%.tmp2184 = icmp eq i32 %.tmp2183, 0
%.tmp2185 = or i1 %.tmp2177, %.tmp2184
br i1 %.tmp2185, label %.if.true.2186, label %.if.false.2186
.if.true.2186:
ret i32 6
br label %.if.end.2186
.if.false.2186:
%.tmp2187 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2188 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2187, i32 0, i32 1
%.tmp2189 = load i8*, i8** %.tmp2188
%.tmp2191 = getelementptr [2 x i8], [2 x i8]*@.str2190, i32 0, i32 0
%.tmp2192 = call i32(i8*,i8*) @strcmp(i8* %.tmp2189, i8* %.tmp2191)
%.tmp2193 = icmp eq i32 %.tmp2192, 0
%.tmp2194 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2195 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2194, i32 0, i32 1
%.tmp2196 = load i8*, i8** %.tmp2195
%.tmp2198 = getelementptr [2 x i8], [2 x i8]*@.str2197, i32 0, i32 0
%.tmp2199 = call i32(i8*,i8*) @strcmp(i8* %.tmp2196, i8* %.tmp2198)
%.tmp2200 = icmp eq i32 %.tmp2199, 0
%.tmp2201 = or i1 %.tmp2193, %.tmp2200
br i1 %.tmp2201, label %.if.true.2202, label %.if.false.2202
.if.true.2202:
ret i32 6
br label %.if.end.2202
.if.false.2202:
%.tmp2203 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2204 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2203, i32 0, i32 1
%.tmp2205 = load i8*, i8** %.tmp2204
%.tmp2207 = getelementptr [2 x i8], [2 x i8]*@.str2206, i32 0, i32 0
%.tmp2208 = call i32(i8*,i8*) @strcmp(i8* %.tmp2205, i8* %.tmp2207)
%.tmp2209 = icmp eq i32 %.tmp2208, 0
br i1 %.tmp2209, label %.if.true.2210, label %.if.false.2210
.if.true.2210:
ret i32 11
br label %.if.end.2210
.if.false.2210:
%.tmp2211 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2212 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2211, i32 0, i32 1
%.tmp2213 = load i8*, i8** %.tmp2212
%.tmp2215 = getelementptr [2 x i8], [2 x i8]*@.str2214, i32 0, i32 0
%.tmp2216 = call i32(i8*,i8*) @strcmp(i8* %.tmp2213, i8* %.tmp2215)
%.tmp2217 = icmp eq i32 %.tmp2216, 0
br i1 %.tmp2217, label %.if.true.2218, label %.if.false.2218
.if.true.2218:
ret i32 12
br label %.if.end.2218
.if.false.2218:
br label %.if.end.2218
.if.end.2218:
br label %.if.end.2210
.if.end.2210:
br label %.if.end.2202
.if.end.2202:
br label %.if.end.2186
.if.end.2186:
br label %.if.end.2170
.if.end.2170:
br label %.if.end.2154
.if.end.2154:
br label %.if.end.2138
.if.end.2138:
%.tmp2220 = getelementptr [65 x i8], [65 x i8]*@.str2219, i32 0, i32 0
%.tmp2221 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2222 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2221, i32 0, i32 1
%.tmp2223 = load i8*, i8** %.tmp2222
%.tmp2224 = call i32(i8*,...) @printf(i8* %.tmp2220, i8* %.tmp2223)
ret i32 4
}
@.str2031 = constant [16 x i8] c"mono_assignable\00"
@.str2042 = constant [9 x i8] c"operator\00"
@.str2079 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2126 = constant [2 x i8] c"+\00"
@.str2133 = constant [2 x i8] c"-\00"
@.str2142 = constant [2 x i8] c"*\00"
@.str2149 = constant [2 x i8] c"/\00"
@.str2158 = constant [3 x i8] c"==\00"
@.str2165 = constant [3 x i8] c"!=\00"
@.str2174 = constant [3 x i8] c">=\00"
@.str2181 = constant [3 x i8] c"<=\00"
@.str2190 = constant [2 x i8] c">\00"
@.str2197 = constant [2 x i8] c"<\00"
@.str2206 = constant [2 x i8] c"&\00"
@.str2214 = constant [2 x i8] c"|\00"
@.str2219 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
define i8* @m2225$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2226 = load i8*, i8** %text
%.tmp2227 = call i32(i8*) @strlen(i8* %.tmp2226)
%str_len.2228 = alloca i32
store i32 %.tmp2227, i32* %str_len.2228
%dest_string.2229 = alloca {i32,i32,i8*}
%.tmp2230 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 0
store i32 0, i32* %.tmp2230
%.tmp2231 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
store i32 0, i32* %.tmp2231
%.tmp2232 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
store i8* null, i8** %.tmp2232
%.tmp2233 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 0
%.tmp2234 = load i32, i32* %str_len.2228
store i32 %.tmp2234, i32* %.tmp2233
%.tmp2235 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
store i32 0, i32* %.tmp2235
%.tmp2236 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2237 = load i32, i32* %str_len.2228
%.tmp2238 = call i8*(i32) @malloc(i32 %.tmp2237)
store i8* %.tmp2238, i8** %.tmp2236
%i.2240 = alloca i32
store i32 1, i32* %i.2240
br label %.for.start.2239
.for.start.2239:
%.tmp2241 = load i32, i32* %i.2240
%.tmp2242 = load i32, i32* %str_len.2228
%.tmp2243 = sub i32 %.tmp2242, 1
%.tmp2244 = icmp slt i32 %.tmp2241, %.tmp2243
br i1 %.tmp2244, label %.for.continue.2239, label %.for.end.2239
.for.continue.2239:
%.tmp2245 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2246 = load i32, i32* %.tmp2245
%.tmp2247 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 0
%.tmp2248 = load i32, i32* %.tmp2247
%.tmp2249 = sub i32 %.tmp2248, 4
%.tmp2250 = icmp eq i32 %.tmp2246, %.tmp2249
br i1 %.tmp2250, label %.if.true.2251, label %.if.false.2251
.if.true.2251:
%.tmp2252 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2253 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2254 = load i8*, i8** %.tmp2253
%.tmp2255 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 0
%.tmp2256 = load i32, i32* %.tmp2255
%.tmp2257 = mul i32 %.tmp2256, 2
%.tmp2258 = call i8*(i8*,i32) @realloc(i8* %.tmp2254, i32 %.tmp2257)
store i8* %.tmp2258, i8** %.tmp2252
br label %.if.end.2251
.if.false.2251:
br label %.if.end.2251
.if.end.2251:
%.tmp2259 = load i32, i32* %i.2240
%.tmp2260 = load i8*, i8** %text
%.tmp2261 = getelementptr i8, i8* %.tmp2260, i32 %.tmp2259
%.tmp2262 = load i8, i8* %.tmp2261
%.tmp2263 = icmp eq i8 %.tmp2262, 34
br i1 %.tmp2263, label %.if.true.2264, label %.if.false.2264
.if.true.2264:
%.tmp2265 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2266 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2267 = load i32, i32* %.tmp2266
%.tmp2268 = load i8*, i8** %.tmp2265
%.tmp2269 = getelementptr i8, i8* %.tmp2268, i32 %.tmp2267
store i8 92, i8* %.tmp2269
%.tmp2270 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2271 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2272 = load i32, i32* %.tmp2271
%.tmp2273 = add i32 %.tmp2272, 1
store i32 %.tmp2273, i32* %.tmp2270
%.tmp2274 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2275 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2276 = load i32, i32* %.tmp2275
%.tmp2277 = load i8*, i8** %.tmp2274
%.tmp2278 = getelementptr i8, i8* %.tmp2277, i32 %.tmp2276
store i8 50, i8* %.tmp2278
%.tmp2279 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2280 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2281 = load i32, i32* %.tmp2280
%.tmp2282 = add i32 %.tmp2281, 1
store i32 %.tmp2282, i32* %.tmp2279
%.tmp2283 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2284 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2285 = load i32, i32* %.tmp2284
%.tmp2286 = load i8*, i8** %.tmp2283
%.tmp2287 = getelementptr i8, i8* %.tmp2286, i32 %.tmp2285
store i8 50, i8* %.tmp2287
br label %.if.end.2264
.if.false.2264:
%.tmp2288 = load i32, i32* %i.2240
%.tmp2289 = load i8*, i8** %text
%.tmp2290 = getelementptr i8, i8* %.tmp2289, i32 %.tmp2288
%.tmp2291 = load i8, i8* %.tmp2290
%.tmp2292 = icmp eq i8 %.tmp2291, 92
br i1 %.tmp2292, label %.if.true.2293, label %.if.false.2293
.if.true.2293:
%.tmp2294 = load i32, i32* %i.2240
%.tmp2295 = add i32 %.tmp2294, 1
%.tmp2296 = load i8*, i8** %text
%.tmp2297 = getelementptr i8, i8* %.tmp2296, i32 %.tmp2295
%.tmp2298 = load i8, i8* %.tmp2297
%.tmp2299 = icmp eq i8 %.tmp2298, 110
%.tmp2300 = load i32, i32* %i.2240
%.tmp2301 = add i32 %.tmp2300, 1
%.tmp2302 = load i8*, i8** %text
%.tmp2303 = getelementptr i8, i8* %.tmp2302, i32 %.tmp2301
%.tmp2304 = load i8, i8* %.tmp2303
%.tmp2305 = icmp eq i8 %.tmp2304, 78
%.tmp2306 = or i1 %.tmp2299, %.tmp2305
br i1 %.tmp2306, label %.if.true.2307, label %.if.false.2307
.if.true.2307:
%.tmp2308 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2309 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2310 = load i32, i32* %.tmp2309
%.tmp2311 = load i8*, i8** %.tmp2308
%.tmp2312 = getelementptr i8, i8* %.tmp2311, i32 %.tmp2310
store i8 92, i8* %.tmp2312
%.tmp2313 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2314 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2315 = load i32, i32* %.tmp2314
%.tmp2316 = add i32 %.tmp2315, 1
store i32 %.tmp2316, i32* %.tmp2313
%.tmp2317 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2318 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2319 = load i32, i32* %.tmp2318
%.tmp2320 = load i8*, i8** %.tmp2317
%.tmp2321 = getelementptr i8, i8* %.tmp2320, i32 %.tmp2319
store i8 48, i8* %.tmp2321
%.tmp2322 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2323 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2324 = load i32, i32* %.tmp2323
%.tmp2325 = add i32 %.tmp2324, 1
store i32 %.tmp2325, i32* %.tmp2322
%.tmp2326 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2327 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2328 = load i32, i32* %.tmp2327
%.tmp2329 = load i8*, i8** %.tmp2326
%.tmp2330 = getelementptr i8, i8* %.tmp2329, i32 %.tmp2328
store i8 65, i8* %.tmp2330
%.tmp2331 = load i32, i32* %i.2240
%.tmp2332 = add i32 %.tmp2331, 1
store i32 %.tmp2332, i32* %i.2240
br label %.if.end.2307
.if.false.2307:
%.tmp2333 = load i32, i32* %i.2240
%.tmp2334 = add i32 %.tmp2333, 1
%.tmp2335 = load i8*, i8** %text
%.tmp2336 = getelementptr i8, i8* %.tmp2335, i32 %.tmp2334
%.tmp2337 = load i8, i8* %.tmp2336
%.tmp2338 = icmp eq i8 %.tmp2337, 92
br i1 %.tmp2338, label %.if.true.2339, label %.if.false.2339
.if.true.2339:
%.tmp2340 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2341 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2342 = load i32, i32* %.tmp2341
%.tmp2343 = load i8*, i8** %.tmp2340
%.tmp2344 = getelementptr i8, i8* %.tmp2343, i32 %.tmp2342
store i8 92, i8* %.tmp2344
%.tmp2345 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2346 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2347 = load i32, i32* %.tmp2346
%.tmp2348 = add i32 %.tmp2347, 1
store i32 %.tmp2348, i32* %.tmp2345
%.tmp2349 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2350 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2351 = load i32, i32* %.tmp2350
%.tmp2352 = load i8*, i8** %.tmp2349
%.tmp2353 = getelementptr i8, i8* %.tmp2352, i32 %.tmp2351
store i8 53, i8* %.tmp2353
%.tmp2354 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2355 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2356 = load i32, i32* %.tmp2355
%.tmp2357 = add i32 %.tmp2356, 1
store i32 %.tmp2357, i32* %.tmp2354
%.tmp2358 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2359 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2360 = load i32, i32* %.tmp2359
%.tmp2361 = load i8*, i8** %.tmp2358
%.tmp2362 = getelementptr i8, i8* %.tmp2361, i32 %.tmp2360
store i8 67, i8* %.tmp2362
%.tmp2363 = load i32, i32* %i.2240
%.tmp2364 = add i32 %.tmp2363, 1
store i32 %.tmp2364, i32* %i.2240
br label %.if.end.2339
.if.false.2339:
%.tmp2365 = load i32, i32* %i.2240
%.tmp2366 = add i32 %.tmp2365, 1
%.tmp2367 = load i8*, i8** %text
%.tmp2368 = getelementptr i8, i8* %.tmp2367, i32 %.tmp2366
%.tmp2369 = load i8, i8* %.tmp2368
%.tmp2370 = icmp eq i8 %.tmp2369, 120
br i1 %.tmp2370, label %.if.true.2371, label %.if.false.2371
.if.true.2371:
%.tmp2372 = load i32, i32* %i.2240
%.tmp2373 = add i32 %.tmp2372, 2
store i32 %.tmp2373, i32* %i.2240
%.tmp2374 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2375 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2376 = load i32, i32* %.tmp2375
%.tmp2377 = load i8*, i8** %.tmp2374
%.tmp2378 = getelementptr i8, i8* %.tmp2377, i32 %.tmp2376
store i8 92, i8* %.tmp2378
%.tmp2379 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2380 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2381 = load i32, i32* %.tmp2380
%.tmp2382 = add i32 %.tmp2381, 1
store i32 %.tmp2382, i32* %.tmp2379
%.tmp2383 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2384 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2385 = load i32, i32* %.tmp2384
%.tmp2386 = load i8*, i8** %.tmp2383
%.tmp2387 = getelementptr i8, i8* %.tmp2386, i32 %.tmp2385
%.tmp2388 = load i32, i32* %i.2240
%.tmp2389 = load i8*, i8** %text
%.tmp2390 = getelementptr i8, i8* %.tmp2389, i32 %.tmp2388
%.tmp2391 = load i8, i8* %.tmp2390
%.tmp2392 = call i8(i8) @toupper(i8 %.tmp2391)
store i8 %.tmp2392, i8* %.tmp2387
%.tmp2393 = load i32, i32* %i.2240
%.tmp2394 = add i32 %.tmp2393, 1
store i32 %.tmp2394, i32* %i.2240
%.tmp2395 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2396 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2397 = load i32, i32* %.tmp2396
%.tmp2398 = add i32 %.tmp2397, 1
store i32 %.tmp2398, i32* %.tmp2395
%.tmp2399 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2400 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2401 = load i32, i32* %.tmp2400
%.tmp2402 = load i8*, i8** %.tmp2399
%.tmp2403 = getelementptr i8, i8* %.tmp2402, i32 %.tmp2401
%.tmp2404 = load i32, i32* %i.2240
%.tmp2405 = load i8*, i8** %text
%.tmp2406 = getelementptr i8, i8* %.tmp2405, i32 %.tmp2404
%.tmp2407 = load i8, i8* %.tmp2406
%.tmp2408 = call i8(i8) @toupper(i8 %.tmp2407)
store i8 %.tmp2408, i8* %.tmp2403
br label %.if.end.2371
.if.false.2371:
%.tmp2409 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2410 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2411 = load i32, i32* %.tmp2410
%.tmp2412 = load i8*, i8** %.tmp2409
%.tmp2413 = getelementptr i8, i8* %.tmp2412, i32 %.tmp2411
%.tmp2414 = load i32, i32* %i.2240
%.tmp2415 = load i8*, i8** %text
%.tmp2416 = getelementptr i8, i8* %.tmp2415, i32 %.tmp2414
%.tmp2417 = load i8, i8* %.tmp2416
store i8 %.tmp2417, i8* %.tmp2413
br label %.if.end.2371
.if.end.2371:
br label %.if.end.2339
.if.end.2339:
br label %.if.end.2307
.if.end.2307:
br label %.if.end.2293
.if.false.2293:
%.tmp2418 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2419 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2420 = load i32, i32* %.tmp2419
%.tmp2421 = load i8*, i8** %.tmp2418
%.tmp2422 = getelementptr i8, i8* %.tmp2421, i32 %.tmp2420
%.tmp2423 = load i32, i32* %i.2240
%.tmp2424 = load i8*, i8** %text
%.tmp2425 = getelementptr i8, i8* %.tmp2424, i32 %.tmp2423
%.tmp2426 = load i8, i8* %.tmp2425
store i8 %.tmp2426, i8* %.tmp2422
br label %.if.end.2293
.if.end.2293:
br label %.if.end.2264
.if.end.2264:
%.tmp2427 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2428 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2429 = load i32, i32* %.tmp2428
%.tmp2430 = add i32 %.tmp2429, 1
store i32 %.tmp2430, i32* %.tmp2427
%.tmp2431 = load i32, i32* %i.2240
%.tmp2432 = add i32 %.tmp2431, 1
store i32 %.tmp2432, i32* %i.2240
br label %.for.start.2239
.for.end.2239:
%.tmp2433 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2434 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2435 = load i32, i32* %.tmp2434
%.tmp2436 = load i8*, i8** %.tmp2433
%.tmp2437 = getelementptr i8, i8* %.tmp2436, i32 %.tmp2435
store i8 0, i8* %.tmp2437
%buf.2438 = alloca i8*
store i8* null, i8** %buf.2438
%.tmp2439 = getelementptr i8*, i8** %buf.2438, i32 0
%.tmp2441 = getelementptr [9 x i8], [9 x i8]*@.str2440, i32 0, i32 0
%.tmp2442 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2443 = load i8*, i8** %.tmp2442
%.tmp2444 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2439, i8* %.tmp2441, i8* %.tmp2443)
%.tmp2445 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2446 = load i8*, i8** %.tmp2445
call void(i8*) @free(i8* %.tmp2446)
%.tmp2447 = load i8*, i8** %buf.2438
ret i8* %.tmp2447
}
define i32 @m2225$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2448 = alloca i32
store i32 0, i32* %len.2448
%i.2450 = alloca i32
store i32 2, i32* %i.2450
br label %.for.start.2449
.for.start.2449:
%.tmp2451 = load i32, i32* %i.2450
%.tmp2452 = load i8*, i8** %text
%.tmp2453 = getelementptr i8, i8* %.tmp2452, i32 %.tmp2451
%.tmp2454 = load i8, i8* %.tmp2453
%.tmp2455 = icmp ne i8 %.tmp2454, 0
br i1 %.tmp2455, label %.for.continue.2449, label %.for.end.2449
.for.continue.2449:
%.tmp2456 = load i32, i32* %i.2450
%.tmp2457 = load i8*, i8** %text
%.tmp2458 = getelementptr i8, i8* %.tmp2457, i32 %.tmp2456
%.tmp2459 = load i8, i8* %.tmp2458
%.tmp2460 = icmp eq i8 %.tmp2459, 92
br i1 %.tmp2460, label %.if.true.2461, label %.if.false.2461
.if.true.2461:
%.tmp2462 = load i32, i32* %i.2450
%.tmp2463 = add i32 %.tmp2462, 2
store i32 %.tmp2463, i32* %i.2450
br label %.if.end.2461
.if.false.2461:
br label %.if.end.2461
.if.end.2461:
%.tmp2464 = load i32, i32* %len.2448
%.tmp2465 = add i32 %.tmp2464, 1
store i32 %.tmp2465, i32* %len.2448
%.tmp2466 = load i32, i32* %i.2450
%.tmp2467 = add i32 %.tmp2466, 1
store i32 %.tmp2467, i32* %i.2450
br label %.for.start.2449
.for.end.2449:
%.tmp2468 = load i32, i32* %len.2448
%.tmp2469 = sub i32 %.tmp2468, 1
ret i32 %.tmp2469
}
define i8* @m2225$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2470 = alloca i32
store i32 0, i32* %intval.2470
%buf.2471 = alloca i8*
store i8* null, i8** %buf.2471
%chrval.2472 = alloca i8
store i8 0, i8* %chrval.2472
%.tmp2473 = load i8*, i8** %chr_repr
%.tmp2474 = call i32(i8*) @strlen(i8* %.tmp2473)
%chr_len.2475 = alloca i32
store i32 %.tmp2474, i32* %chr_len.2475
%.tmp2476 = load i32, i32* %chr_len.2475
%.tmp2477 = icmp eq i32 %.tmp2476, 6
br i1 %.tmp2477, label %.if.true.2478, label %.if.false.2478
.if.true.2478:
%.tmp2479 = load i8*, i8** %chr_repr
%.tmp2481 = getelementptr [7 x i8], [7 x i8]*@.str2480, i32 0, i32 0
%.tmp2482 = getelementptr i32, i32* %intval.2470, i32 0
%.tmp2483 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2479, i8* %.tmp2481, i32* %.tmp2482)
%.tmp2484 = getelementptr i8*, i8** %buf.2471, i32 0
%.tmp2486 = getelementptr [3 x i8], [3 x i8]*@.str2485, i32 0, i32 0
%.tmp2487 = load i32, i32* %intval.2470
%.tmp2488 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2484, i8* %.tmp2486, i32 %.tmp2487)
br label %.if.end.2478
.if.false.2478:
%.tmp2489 = load i32, i32* %chr_len.2475
%.tmp2490 = icmp eq i32 %.tmp2489, 5
br i1 %.tmp2490, label %.if.true.2491, label %.if.false.2491
.if.true.2491:
%.tmp2492 = load i8*, i8** %chr_repr
%.tmp2494 = getelementptr [6 x i8], [6 x i8]*@.str2493, i32 0, i32 0
%.tmp2495 = getelementptr i32, i32* %intval.2470, i32 0
%.tmp2496 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2492, i8* %.tmp2494, i32* %.tmp2495)
%.tmp2497 = getelementptr i8*, i8** %buf.2471, i32 0
%.tmp2499 = getelementptr [3 x i8], [3 x i8]*@.str2498, i32 0, i32 0
%.tmp2500 = load i32, i32* %intval.2470
%.tmp2501 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2497, i8* %.tmp2499, i32 %.tmp2500)
br label %.if.end.2491
.if.false.2491:
%.tmp2502 = load i32, i32* %chr_len.2475
%.tmp2503 = icmp eq i32 %.tmp2502, 4
br i1 %.tmp2503, label %.if.true.2504, label %.if.false.2504
.if.true.2504:
%.tmp2505 = load i8*, i8** %chr_repr
%.tmp2507 = getelementptr [6 x i8], [6 x i8]*@.str2506, i32 0, i32 0
%.tmp2508 = getelementptr i8, i8* %chrval.2472, i32 0
%.tmp2509 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2505, i8* %.tmp2507, i8* %.tmp2508)
%.tmp2510 = load i8, i8* %chrval.2472
%.tmp2511 = icmp eq i8 %.tmp2510, 110
br i1 %.tmp2511, label %.if.true.2512, label %.if.false.2512
.if.true.2512:
%.tmp2514 = getelementptr [3 x i8], [3 x i8]*@.str2513, i32 0, i32 0
store i8* %.tmp2514, i8** %buf.2471
br label %.if.end.2512
.if.false.2512:
%.tmp2515 = bitcast ptr null to i8*
ret i8* %.tmp2515
br label %.if.end.2512
.if.end.2512:
br label %.if.end.2504
.if.false.2504:
%.tmp2516 = load i32, i32* %chr_len.2475
%.tmp2517 = icmp eq i32 %.tmp2516, 3
br i1 %.tmp2517, label %.if.true.2518, label %.if.false.2518
.if.true.2518:
%.tmp2519 = load i8*, i8** %chr_repr
%.tmp2521 = getelementptr [5 x i8], [5 x i8]*@.str2520, i32 0, i32 0
%.tmp2522 = getelementptr i32, i32* %intval.2470, i32 0
%.tmp2523 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2519, i8* %.tmp2521, i32* %.tmp2522)
%.tmp2524 = getelementptr i8*, i8** %buf.2471, i32 0
%.tmp2526 = getelementptr [3 x i8], [3 x i8]*@.str2525, i32 0, i32 0
%.tmp2527 = load i32, i32* %intval.2470
%.tmp2528 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2524, i8* %.tmp2526, i32 %.tmp2527)
br label %.if.end.2518
.if.false.2518:
%.tmp2529 = bitcast ptr null to i8*
ret i8* %.tmp2529
br label %.if.end.2518
.if.end.2518:
br label %.if.end.2504
.if.end.2504:
br label %.if.end.2491
.if.end.2491:
br label %.if.end.2478
.if.end.2478:
%.tmp2530 = load i8*, i8** %buf.2471
ret i8* %.tmp2530
}
@.str2440 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2480 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2485 = constant [3 x i8] c"%d\00"
@.str2493 = constant [6 x i8] c"'\5C%x'\00"
@.str2498 = constant [3 x i8] c"%d\00"
@.str2506 = constant [6 x i8] c"'\5C%c'\00"
@.str2513 = constant [3 x i8] c"10\00"
@.str2520 = constant [5 x i8] c"'%c'\00"
@.str2525 = constant [3 x i8] c"%d\00"
@DEBUG_INTERNALS = constant i1 0
%m1861$.ErrorList.type = type {%m751$.Error.type*,%m1861$.ErrorList.type*,i1}
%m1861$.Type.type = type {i8*,i8*,i8*,%m1861$.Type.type*,%m1861$.Type.type*}
define %m1861$.Type.type* @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.t.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%.tmp2531 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2532 = icmp eq %m1861$.Type.type* %.tmp2531, null
br i1 %.tmp2532, label %.if.true.2533, label %.if.false.2533
.if.true.2533:
%.tmp2534 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp2534
br label %.if.end.2533
.if.false.2533:
br label %.if.end.2533
.if.end.2533:
%.tmp2535 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2536 = ptrtoint %m1861$.Type.type* %.tmp2535 to i32
%.tmp2537 = call i8*(i32) @malloc(i32 %.tmp2536)
%.tmp2538 = bitcast i8* %.tmp2537 to %m1861$.Type.type*
%clone.2539 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2538, %m1861$.Type.type** %clone.2539
%.tmp2540 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2539
%.tmp2541 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2540, i32 0, i32 3
%.tmp2542 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2543 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2542, i32 0, i32 3
%.tmp2544 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2543
store %m1861$.Type.type* %.tmp2544, %m1861$.Type.type** %.tmp2541
%.tmp2545 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2539
%.tmp2546 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2545, i32 0, i32 4
%.tmp2547 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2548 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2547, i32 0, i32 4
%.tmp2549 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2548
%.tmp2550 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2549)
store %m1861$.Type.type* %.tmp2550, %m1861$.Type.type** %.tmp2546
%.tmp2551 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2539
%.tmp2552 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2551, i32 0, i32 2
%.tmp2553 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2554 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2553, i32 0, i32 2
%.tmp2555 = load i8*, i8** %.tmp2554
store i8* %.tmp2555, i8** %.tmp2552
%.tmp2556 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2539
%.tmp2557 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2556, i32 0, i32 0
%.tmp2558 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2559 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2558, i32 0, i32 0
%.tmp2560 = load i8*, i8** %.tmp2559
store i8* %.tmp2560, i8** %.tmp2557
%.tmp2561 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2539
%.tmp2562 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2561, i32 0, i32 1
%.tmp2563 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2564 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2563, i32 0, i32 1
%.tmp2565 = load i8*, i8** %.tmp2564
store i8* %.tmp2565, i8** %.tmp2562
%.tmp2566 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2539
ret %m1861$.Type.type* %.tmp2566
}
define %m1861$.Type.type* @m1861$new_type.m1861$.Type.typep() {
%.tmp2567 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2568 = ptrtoint %m1861$.Type.type* %.tmp2567 to i32
%.tmp2569 = call i8*(i32) @malloc(i32 %.tmp2568)
%.tmp2570 = bitcast i8* %.tmp2569 to %m1861$.Type.type*
%type.2571 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2570, %m1861$.Type.type** %type.2571
%.tmp2572 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2571
%.tmp2573 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2572, i32 0, i32 1
store i8* null, i8** %.tmp2573
%.tmp2574 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2571
%.tmp2575 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2574, i32 0, i32 2
store i8* null, i8** %.tmp2575
%.tmp2576 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2571
%.tmp2577 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2576, i32 0, i32 0
store i8* null, i8** %.tmp2577
%.tmp2578 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2571
%.tmp2579 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2578, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2579
%.tmp2580 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2571
%.tmp2581 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2580, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2581
%.tmp2582 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2571
ret %m1861$.Type.type* %.tmp2582
}
define void @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.dest.arg, %m1861$.Type.type* %.src.arg) {
%dest = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.dest.arg, %m1861$.Type.type** %dest
%src = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.src.arg, %m1861$.Type.type** %src
%.tmp2583 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2584 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2583, i32 0, i32 0
%.tmp2585 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2586 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2585, i32 0, i32 0
%.tmp2587 = load i8*, i8** %.tmp2586
store i8* %.tmp2587, i8** %.tmp2584
%.tmp2588 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2589 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2588, i32 0, i32 1
%.tmp2590 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2591 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2590, i32 0, i32 1
%.tmp2592 = load i8*, i8** %.tmp2591
store i8* %.tmp2592, i8** %.tmp2589
%.tmp2593 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2594 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2593, i32 0, i32 2
%.tmp2595 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2596 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2595, i32 0, i32 2
%.tmp2597 = load i8*, i8** %.tmp2596
store i8* %.tmp2597, i8** %.tmp2594
%.tmp2598 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2599 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2598, i32 0, i32 3
%.tmp2600 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2599
%.tmp2601 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2602 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2601, i32 0, i32 3
%.tmp2603 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2602
%.tmp2604 = icmp ne %m1861$.Type.type* %.tmp2600, %.tmp2603
br i1 %.tmp2604, label %.if.true.2605, label %.if.false.2605
.if.true.2605:
%.tmp2606 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2607 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2606, i32 0, i32 3
%.tmp2608 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2609 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2608, i32 0, i32 3
%.tmp2610 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2609
store %m1861$.Type.type* %.tmp2610, %m1861$.Type.type** %.tmp2607
%.tmp2611 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2612 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2611, i32 0, i32 3
%.tmp2613 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2612
%.tmp2614 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2615 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2614, i32 0, i32 3
%.tmp2616 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2615
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2613, %m1861$.Type.type* %.tmp2616)
br label %.if.end.2605
.if.false.2605:
br label %.if.end.2605
.if.end.2605:
%.tmp2617 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2618 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2617, i32 0, i32 4
%.tmp2619 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2618
%.tmp2620 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2621 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2620, i32 0, i32 4
%.tmp2622 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2621
%.tmp2623 = icmp ne %m1861$.Type.type* %.tmp2619, %.tmp2622
br i1 %.tmp2623, label %.if.true.2624, label %.if.false.2624
.if.true.2624:
%.tmp2625 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2626 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2625, i32 0, i32 4
%.tmp2627 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2628 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2627, i32 0, i32 4
%.tmp2629 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2628
store %m1861$.Type.type* %.tmp2629, %m1861$.Type.type** %.tmp2626
%.tmp2630 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2631 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2630, i32 0, i32 4
%.tmp2632 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2631
%.tmp2633 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2634 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2633, i32 0, i32 4
%.tmp2635 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2634
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2632, %m1861$.Type.type* %.tmp2635)
br label %.if.end.2624
.if.false.2624:
br label %.if.end.2624
.if.end.2624:
ret void
}
define void @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2636 = load i32, i32* %level
%.tmp2637 = add i32 %.tmp2636, 1
%.tmp2638 = call i8*(i32) @malloc(i32 %.tmp2637)
%.tmp2639 = bitcast i8* %.tmp2638 to i8*
%indent.2640 = alloca i8*
store i8* %.tmp2639, i8** %indent.2640
%i.2642 = alloca i32
store i32 0, i32* %i.2642
br label %.for.start.2641
.for.start.2641:
%.tmp2643 = load i32, i32* %i.2642
%.tmp2644 = load i32, i32* %level
%.tmp2645 = icmp slt i32 %.tmp2643, %.tmp2644
br i1 %.tmp2645, label %.for.continue.2641, label %.for.end.2641
.for.continue.2641:
%.tmp2646 = load i32, i32* %i.2642
%.tmp2647 = load i8*, i8** %indent.2640
%.tmp2648 = getelementptr i8, i8* %.tmp2647, i32 %.tmp2646
store i8 32, i8* %.tmp2648
%.tmp2649 = load i32, i32* %i.2642
%.tmp2650 = add i32 %.tmp2649, 1
store i32 %.tmp2650, i32* %i.2642
br label %.for.start.2641
.for.end.2641:
%.tmp2651 = load i32, i32* %level
%.tmp2652 = load i8*, i8** %indent.2640
%.tmp2653 = getelementptr i8, i8* %.tmp2652, i32 %.tmp2651
store i8 0, i8* %.tmp2653
%.tmp2655 = getelementptr [5 x i8], [5 x i8]*@.str2654, i32 0, i32 0
%.tmp2656 = load i8*, i8** %indent.2640
%.tmp2657 = call i32(i8*,...) @printf(i8* %.tmp2655, i8* %.tmp2656)
%.tmp2659 = getelementptr [21 x i8], [21 x i8]*@.str2658, i32 0, i32 0
%.tmp2660 = load i8*, i8** %indent.2640
%.tmp2661 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2662 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2661, i32 0, i32 0
%.tmp2663 = load i8*, i8** %.tmp2662
%.tmp2664 = call i32(i8*,...) @printf(i8* %.tmp2659, i8* %.tmp2660, i8* %.tmp2663)
%.tmp2666 = getelementptr [16 x i8], [16 x i8]*@.str2665, i32 0, i32 0
%.tmp2667 = load i8*, i8** %indent.2640
%.tmp2668 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2669 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2668, i32 0, i32 1
%.tmp2670 = load i8*, i8** %.tmp2669
%.tmp2671 = call i32(i8*,...) @printf(i8* %.tmp2666, i8* %.tmp2667, i8* %.tmp2670)
%.tmp2673 = getelementptr [16 x i8], [16 x i8]*@.str2672, i32 0, i32 0
%.tmp2674 = load i8*, i8** %indent.2640
%.tmp2675 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2676 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2675, i32 0, i32 2
%.tmp2677 = load i8*, i8** %.tmp2676
%.tmp2678 = call i32(i8*,...) @printf(i8* %.tmp2673, i8* %.tmp2674, i8* %.tmp2677)
%.tmp2679 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2680 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2679, i32 0, i32 3
%.tmp2681 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2680
%.tmp2682 = icmp eq %m1861$.Type.type* %.tmp2681, null
br i1 %.tmp2682, label %.if.true.2683, label %.if.false.2683
.if.true.2683:
%.tmp2685 = getelementptr [16 x i8], [16 x i8]*@.str2684, i32 0, i32 0
%.tmp2686 = load i8*, i8** %indent.2640
%.tmp2687 = call i32(i8*,...) @printf(i8* %.tmp2685, i8* %.tmp2686)
br label %.if.end.2683
.if.false.2683:
%.tmp2689 = getelementptr [10 x i8], [10 x i8]*@.str2688, i32 0, i32 0
%.tmp2690 = load i8*, i8** %indent.2640
%.tmp2691 = call i32(i8*,...) @printf(i8* %.tmp2689, i8* %.tmp2690)
%.tmp2692 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2693 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2692, i32 0, i32 3
%.tmp2694 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2693
%.tmp2695 = load i32, i32* %level
%.tmp2696 = add i32 %.tmp2695, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2694, i32 %.tmp2696)
br label %.if.end.2683
.if.end.2683:
%.tmp2697 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2698 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2697, i32 0, i32 4
%.tmp2699 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2698
%.tmp2700 = icmp eq %m1861$.Type.type* %.tmp2699, null
br i1 %.tmp2700, label %.if.true.2701, label %.if.false.2701
.if.true.2701:
%.tmp2703 = getelementptr [18 x i8], [18 x i8]*@.str2702, i32 0, i32 0
%.tmp2704 = load i8*, i8** %indent.2640
%.tmp2705 = call i32(i8*,...) @printf(i8* %.tmp2703, i8* %.tmp2704)
br label %.if.end.2701
.if.false.2701:
%.tmp2707 = getelementptr [12 x i8], [12 x i8]*@.str2706, i32 0, i32 0
%.tmp2708 = load i8*, i8** %indent.2640
%.tmp2709 = call i32(i8*,...) @printf(i8* %.tmp2707, i8* %.tmp2708)
%.tmp2710 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2711 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2710, i32 0, i32 4
%.tmp2712 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2711
%.tmp2713 = load i32, i32* %level
%.tmp2714 = add i32 %.tmp2713, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2712, i32 %.tmp2714)
br label %.if.end.2701
.if.end.2701:
%.tmp2716 = getelementptr [5 x i8], [5 x i8]*@.str2715, i32 0, i32 0
%.tmp2717 = load i8*, i8** %indent.2640
%.tmp2718 = call i32(i8*,...) @printf(i8* %.tmp2716, i8* %.tmp2717)
ret void
}
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,%m1861$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1861$.AssignableInfo.type* @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.node.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2719 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* null, i32 1
%.tmp2720 = ptrtoint %m1861$.AssignableInfo.type* %.tmp2719 to i32
%.tmp2721 = call i8*(i32) @malloc(i32 %.tmp2720)
%.tmp2722 = bitcast i8* %.tmp2721 to %m1861$.AssignableInfo.type*
%ptr.2723 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp2722, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2724 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2725 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2724, i32 0, i32 1
%.tmp2726 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2726, i8* %.tmp2725
%.tmp2727 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2728 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2727, i32 0, i32 0
store i8* null, i8** %.tmp2728
%.tmp2729 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2730 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2729, i32 0, i32 2
store i8* null, i8** %.tmp2730
%.tmp2731 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2732 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2731, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2732
%.tmp2733 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2734 = icmp ne %m307$.Node.type* %.tmp2733, null
br i1 %.tmp2734, label %.if.true.2735, label %.if.false.2735
.if.true.2735:
%.tmp2736 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2737 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2736, i32 0, i32 4
%.tmp2738 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2739 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2738, i32 0, i32 3
%.tmp2740 = load i32, i32* %.tmp2739
store i32 %.tmp2740, i32* %.tmp2737
%.tmp2741 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2742 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2741, i32 0, i32 5
%.tmp2743 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2744 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2743, i32 0, i32 4
%.tmp2745 = load i32, i32* %.tmp2744
store i32 %.tmp2745, i32* %.tmp2742
%.tmp2746 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2747 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2746, i32 0, i32 6
%.tmp2748 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2749 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2748, i32 0, i32 2
%.tmp2750 = load i8*, i8** %.tmp2749
store i8* %.tmp2750, i8** %.tmp2747
br label %.if.end.2735
.if.false.2735:
%.tmp2751 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2752 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2751, i32 0, i32 4
store i32 0, i32* %.tmp2752
%.tmp2753 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2754 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2753, i32 0, i32 5
store i32 0, i32* %.tmp2754
%.tmp2755 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
%.tmp2756 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2755, i32 0, i32 6
store i8* null, i8** %.tmp2756
br label %.if.end.2735
.if.end.2735:
%.tmp2757 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2723
ret %m1861$.AssignableInfo.type* %.tmp2757
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2759 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2758, i32 0, i32 0
%.tmp2760 = load i8*, i8** %id
store i8* %.tmp2760, i8** %.tmp2759
%.tmp2761 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2762 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2761, i32 0, i32 1
%.tmp2763 = load i8, i8* %scope
store i8 %.tmp2763, i8* %.tmp2762
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2764 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2765 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2764, i32 0, i32 1
%.tmp2766 = load i8, i8* %.tmp2765
%.tmp2767 = load i8, i8* @SCOPE_CONST
%.tmp2768 = icmp eq i8 %.tmp2766, %.tmp2767
br i1 %.tmp2768, label %.if.true.2769, label %.if.false.2769
.if.true.2769:
%.tmp2770 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2771 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2770, i32 0, i32 0
%.tmp2772 = load i8*, i8** %.tmp2771
ret i8* %.tmp2772
br label %.if.end.2769
.if.false.2769:
br label %.if.end.2769
.if.end.2769:
%buf.2773 = alloca i8*
store i8* null, i8** %buf.2773
%.tmp2774 = getelementptr i8*, i8** %buf.2773, i32 0
%.tmp2776 = getelementptr [5 x i8], [5 x i8]*@.str2775, i32 0, i32 0
%.tmp2777 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2778 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2777, i32 0, i32 1
%.tmp2779 = load i8, i8* %.tmp2778
%.tmp2780 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2781 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2780, i32 0, i32 0
%.tmp2782 = load i8*, i8** %.tmp2781
%.tmp2783 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2774, i8* %.tmp2776, i8 %.tmp2779, i8* %.tmp2782)
%.tmp2784 = load i8*, i8** %buf.2773
ret i8* %.tmp2784
}
%m1861$.ScopeItem.type = type {i8*,%m1861$.AssignableInfo.type*,%m1861$.ScopeItem.type*}
%m1861$.GlobalName.type = type {i8*,i8*,i1,%m1861$.AssignableInfo.type*,%m1861$.GlobalName.type*}
%m1861$.Scope.type = type {i8*,%m1861$.ScopeItem.type*,i8*,i8*,i8*,%m1861$.Scope.type*}
%m1861$.ModuleLookup.type = type {i8*,i8*,%m1861$.ModuleLookup.type*,%m1861$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1861$.CompilerCtx.type = type {%m307$.Node.type*,%m0$.File.type*,%m1861$.ErrorList.type*,%m1861$.GlobalName.type*,i32,%m1861$.ModuleLookup.type*,i8*}
define void @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%tmp_buff.2785 = alloca i8*
store i8* null, i8** %tmp_buff.2785
%.tmp2786 = getelementptr i8*, i8** %tmp_buff.2785, i32 0
%.tmp2788 = getelementptr [7 x i8], [7 x i8]*@.str2787, i32 0, i32 0
%.tmp2789 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2790 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2789)
%.tmp2791 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2786, i8* %.tmp2788, i32 %.tmp2790)
%.tmp2792 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2793 = load i8, i8* @SCOPE_LOCAL
%.tmp2794 = load i8*, i8** %tmp_buff.2785
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2792, i8 %.tmp2793, i8* %.tmp2794)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2796 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2797 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2796, i32 0, i32 5
%.tmp2798 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2797
%m.2799 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2798, %m1861$.ModuleLookup.type** %m.2799
br label %.for.start.2795
.for.start.2795:
%.tmp2800 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2799
%.tmp2801 = icmp ne %m1861$.ModuleLookup.type* %.tmp2800, null
br i1 %.tmp2801, label %.for.continue.2795, label %.for.end.2795
.for.continue.2795:
%.tmp2802 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2799
%.tmp2803 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2802, i32 0, i32 0
%.tmp2804 = load i8*, i8** %.tmp2803
%.tmp2805 = load i8*, i8** %filename
%.tmp2806 = call i32(i8*,i8*) @strcmp(i8* %.tmp2804, i8* %.tmp2805)
%.tmp2807 = icmp eq i32 %.tmp2806, 0
br i1 %.tmp2807, label %.if.true.2808, label %.if.false.2808
.if.true.2808:
%.tmp2809 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2799
ret %m1861$.ModuleLookup.type* %.tmp2809
br label %.if.end.2808
.if.false.2808:
br label %.if.end.2808
.if.end.2808:
%.tmp2810 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2799
%.tmp2811 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2810, i32 0, i32 2
%.tmp2812 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2811
store %m1861$.ModuleLookup.type* %.tmp2812, %m1861$.ModuleLookup.type** %m.2799
br label %.for.start.2795
.for.end.2795:
%.tmp2813 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2813
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2814 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2815 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2816 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2815, i32 0, i32 6
%.tmp2817 = load i8*, i8** %.tmp2816
%.tmp2818 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2814, i8* %.tmp2817)
ret %m1861$.ModuleLookup.type* %.tmp2818
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2819 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2820 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2819, i32 0, i32 4
%.tmp2821 = load i32, i32* %.tmp2820
%uid.2822 = alloca i32
store i32 %.tmp2821, i32* %uid.2822
%.tmp2823 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2824 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2823, i32 0, i32 4
%.tmp2825 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2826 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2825, i32 0, i32 4
%.tmp2827 = load i32, i32* %.tmp2826
%.tmp2828 = add i32 %.tmp2827, 1
store i32 %.tmp2828, i32* %.tmp2824
%.tmp2829 = load i32, i32* %uid.2822
ret i32 %.tmp2829
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2830 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2831 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2830 to i32
%.tmp2832 = call i8*(i32) @malloc(i32 %.tmp2831)
%.tmp2833 = bitcast i8* %.tmp2832 to %m1861$.CompilerCtx.type*
%ctx.2834 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2833, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2835 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2836 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2835, i32 0, i32 1
%.tmp2837 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2837, %m0$.File.type** %.tmp2836
%.tmp2838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2839 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2838, i32 0, i32 0
%.tmp2840 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2840, %m307$.Node.type** %.tmp2839
%.tmp2841 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2842 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2841, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2842
%.tmp2843 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2844 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2843, i32 0, i32 4
store i32 0, i32* %.tmp2844
%.tmp2845 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2846 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2845, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2846
%.tmp2847 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2848 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2847, i32 0, i32 6
%.tmp2849 = load i8*, i8** %filename
store i8* %.tmp2849, i8** %.tmp2848
%.tmp2850 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2851 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2850, i32 0, i32 5
%.tmp2852 = load i32, i32* @ModuleLookup_size
%.tmp2853 = call i8*(i32) @malloc(i32 %.tmp2852)
%.tmp2854 = bitcast i8* %.tmp2853 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2854, %m1861$.ModuleLookup.type** %.tmp2851
%.tmp2855 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2856 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2855, i32 0, i32 5
%.tmp2857 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2856
%.tmp2858 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2857, i32 0, i32 0
%.tmp2859 = load i8*, i8** %filename
store i8* %.tmp2859, i8** %.tmp2858
%.tmp2860 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2861 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2860, i32 0, i32 5
%.tmp2862 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2861
%.tmp2863 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2862, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2863
%.tmp2864 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2865 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2864, i32 0, i32 5
%.tmp2866 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2865
%.tmp2867 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2866, i32 0, i32 1
%.tmp2869 = getelementptr [1 x i8], [1 x i8]*@.str2868, i32 0, i32 0
store i8* %.tmp2869, i8** %.tmp2867
%.tmp2870 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2871 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2870, i32 0, i32 5
%.tmp2872 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2871
%.tmp2873 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2872, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2873
%.tmp2874 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2834
%.tmp2875 = bitcast %m1861$.CompilerCtx.type* %.tmp2874 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2875
}
define void @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%.tmp2876 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2877 = ptrtoint %m1861$.Scope.type* %.tmp2876 to i32
%.tmp2878 = call i8*(i32) @malloc(i32 %.tmp2877)
%.tmp2879 = bitcast i8* %.tmp2878 to %m1861$.Scope.type*
%s.2880 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2879, %m1861$.Scope.type** %s.2880
%.tmp2881 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2882 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2881)
%m.2883 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2882, %m1861$.ModuleLookup.type** %m.2883
%.tmp2884 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2880
%.tmp2885 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2884, i32 0, i32 5
%.tmp2886 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2883
%.tmp2887 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2886, i32 0, i32 3
%.tmp2888 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2887
store %m1861$.Scope.type* %.tmp2888, %m1861$.Scope.type** %.tmp2885
%.tmp2889 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2880
%.tmp2890 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2889, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2890
%.tmp2891 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2880
%.tmp2892 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2891, i32 0, i32 2
%.tmp2893 = load i8*, i8** %type
store i8* %.tmp2893, i8** %.tmp2892
%.tmp2894 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2880
%.tmp2895 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2894, i32 0, i32 3
%.tmp2896 = load i8*, i8** %begin_id
store i8* %.tmp2896, i8** %.tmp2895
%.tmp2897 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2880
%.tmp2898 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2897, i32 0, i32 4
%.tmp2899 = load i8*, i8** %end_id
store i8* %.tmp2899, i8** %.tmp2898
%.tmp2900 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2883
%.tmp2901 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2900, i32 0, i32 3
%.tmp2902 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2880
store %m1861$.Scope.type* %.tmp2902, %m1861$.Scope.type** %.tmp2901
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2903 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2904 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2903)
%m.2905 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2904, %m1861$.ModuleLookup.type** %m.2905
%.tmp2906 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2905
%.tmp2907 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2906, i32 0, i32 3
%.tmp2908 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2907
%.tmp2909 = icmp ne %m1861$.Scope.type* %.tmp2908, null
%.tmp2911 = getelementptr [61 x i8], [61 x i8]*@.str2910, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2909, i8* %.tmp2911)
%.tmp2912 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2905
%.tmp2913 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2912, i32 0, i32 3
%.tmp2914 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2905
%.tmp2915 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2914, i32 0, i32 3
%.tmp2916 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2915
%.tmp2917 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2916, i32 0, i32 5
%.tmp2918 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2917
store %m1861$.Scope.type* %.tmp2918, %m1861$.Scope.type** %.tmp2913
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2919 = call i8*() @m1862$grammar.cp()
%.tmp2920 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2919)
%grammar_file.2921 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2920, %m0$.File.type** %grammar_file.2921
%.tmp2922 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2921
%.tmp2923 = icmp eq %m0$.File.type* %.tmp2922, null
br i1 %.tmp2923, label %.if.true.2924, label %.if.false.2924
.if.true.2924:
ret i1 0
br label %.if.end.2924
.if.false.2924:
br label %.if.end.2924
.if.end.2924:
%.tmp2925 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2921
%.tmp2926 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2925)
%grammar_ctx.2927 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2926, %m307$.ParsingContext.type** %grammar_ctx.2927
%.tmp2928 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2927
%.tmp2929 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2928)
%grammar.2930 = alloca %m307$.Rule.type**
store %m307$.Rule.type** %.tmp2929, %m307$.Rule.type*** %grammar.2930
%.tmp2931 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2927
%.tmp2932 = bitcast %m307$.ParsingContext.type* %.tmp2931 to i8*
call void(i8*) @free(i8* %.tmp2932)
%.tmp2933 = load i8*, i8** %filepath
%.tmp2934 = load i32, i32* @O_RDONLY
%.tmp2935 = call i32(i8*,i32) @open(i8* %.tmp2933, i32 %.tmp2934)
%input_fd.2936 = alloca i32
store i32 %.tmp2935, i32* %input_fd.2936
%.tmp2937 = load i32, i32* %input_fd.2936
%.tmp2938 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2937)
%p.2939 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2938, %m229$.PeekerInfo.type** %p.2939
%.tmp2940 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2939
%.tmp2941 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2940, i32 0, i32 6
%.tmp2942 = load i8*, i8** %filepath
store i8* %.tmp2942, i8** %.tmp2941
%.tmp2943 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2939
%.tmp2944 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2943, i1 0)
%tokens.2945 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2944, %m308$.Token.type** %tokens.2945
%.tmp2946 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar.2930
%.tmp2948 = getelementptr [6 x i8], [6 x i8]*@.str2947, i32 0, i32 0
%.tmp2949 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2945
%.tmp2950 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2946, i8* %.tmp2948, %m308$.Token.type* %.tmp2949)
%ast.2951 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2950, %m307$.ParseResult.type** %ast.2951
%.tmp2952 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2953 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2951
%.tmp2954 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2953, i32 0, i32 1
%.tmp2955 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2954
%.tmp2956 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2952, %m307$.Node.type* %.tmp2955)
ret i1 %.tmp2956
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2957 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2958 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2957, %m307$.Node.type* %.tmp2958)
%.tmp2959 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2960 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2959, i32 0, i32 2
%.tmp2961 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2960
%.tmp2962 = icmp ne %m1861$.ErrorList.type* %.tmp2961, null
%has_errors.2963 = alloca i1
store i1 %.tmp2962, i1* %has_errors.2963
%.tmp2965 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2966 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2965, i32 0, i32 2
%.tmp2967 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2966
%err.2968 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp2967, %m1861$.ErrorList.type** %err.2968
br label %.for.start.2964
.for.start.2964:
%.tmp2969 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2968
%.tmp2970 = icmp ne %m1861$.ErrorList.type* %.tmp2969, null
br i1 %.tmp2970, label %.for.continue.2964, label %.for.end.2964
.for.continue.2964:
%.tmp2971 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2968
%.tmp2972 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2971, i32 0, i32 2
%.tmp2973 = load i1, i1* %.tmp2972
%.tmp2974 = icmp eq i1 %.tmp2973, 0
br i1 %.tmp2974, label %.if.true.2975, label %.if.false.2975
.if.true.2975:
%.tmp2976 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2968
%.tmp2977 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2976, i32 0, i32 0
%.tmp2978 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2977
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp2978)
%.tmp2979 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2968
%.tmp2980 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2979, i32 0, i32 2
store i1 1, i1* %.tmp2980
br label %.if.end.2975
.if.false.2975:
br label %.if.end.2975
.if.end.2975:
%.tmp2981 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2968
%.tmp2982 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2981, i32 0, i32 1
%.tmp2983 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2982
store %m1861$.ErrorList.type* %.tmp2983, %m1861$.ErrorList.type** %err.2968
br label %.for.start.2964
.for.end.2964:
%.tmp2985 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2986 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2985, i32 0, i32 3
%.tmp2987 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2986
%g.2988 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp2987, %m1861$.GlobalName.type** %g.2988
br label %.for.start.2984
.for.start.2984:
%.tmp2989 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2988
%.tmp2990 = icmp ne %m1861$.GlobalName.type* %.tmp2989, null
br i1 %.tmp2990, label %.for.continue.2984, label %.for.end.2984
.for.continue.2984:
%.tmp2991 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2992 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2988
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp2991, %m1861$.GlobalName.type* %.tmp2992)
%.tmp2993 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2988
%.tmp2994 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2993, i32 0, i32 4
%.tmp2995 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2994
store %m1861$.GlobalName.type* %.tmp2995, %m1861$.GlobalName.type** %g.2988
br label %.for.start.2984
.for.end.2984:
%.tmp2996 = load i1, i1* %has_errors.2963
ret i1 %.tmp2996
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2997 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp2998 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2997, i32 0, i32 0
%.tmp2999 = load i8*, i8** %.tmp2998
%.tmp3001 = getelementptr [6 x i8], [6 x i8]*@.str3000, i32 0, i32 0
%.tmp3002 = call i32(i8*,i8*) @strcmp(i8* %.tmp2999, i8* %.tmp3001)
%.tmp3003 = icmp ne i32 %.tmp3002, 0
br i1 %.tmp3003, label %.if.true.3004, label %.if.false.3004
.if.true.3004:
ret void
br label %.if.end.3004
.if.false.3004:
br label %.if.end.3004
.if.end.3004:
%.tmp3005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3007 = getelementptr [7 x i8], [7 x i8]*@.str3006, i32 0, i32 0
%.tmp3008 = bitcast ptr null to i8*
%.tmp3009 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3005, i8* %.tmp3007, i8* %.tmp3008, i8* %.tmp3009)
%.tmp3010 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3011 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3010, i32 0, i32 6
%.tmp3012 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3011
%start.3013 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3012, %m307$.Node.type** %start.3013
%.tmp3014 = load %m307$.Node.type*, %m307$.Node.type** %start.3013
%.tmp3015 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3014, i32 0, i32 0
%.tmp3016 = load i8*, i8** %.tmp3015
%.tmp3018 = getelementptr [13 x i8], [13 x i8]*@.str3017, i32 0, i32 0
%.tmp3019 = call i32(i8*,i8*) @strcmp(i8* %.tmp3016, i8* %.tmp3018)
%.tmp3020 = icmp eq i32 %.tmp3019, 0
br i1 %.tmp3020, label %.if.true.3021, label %.if.false.3021
.if.true.3021:
%.tmp3022 = load %m307$.Node.type*, %m307$.Node.type** %start.3013
%.tmp3023 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3022, i32 0, i32 7
%.tmp3024 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3023
store %m307$.Node.type* %.tmp3024, %m307$.Node.type** %start.3013
br label %.if.end.3021
.if.false.3021:
br label %.if.end.3021
.if.end.3021:
%.tmp3026 = load %m307$.Node.type*, %m307$.Node.type** %start.3013
%stmt.3027 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3026, %m307$.Node.type** %stmt.3027
br label %.for.start.3025
.for.start.3025:
%.tmp3028 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3027
%.tmp3029 = icmp ne %m307$.Node.type* %.tmp3028, null
br i1 %.tmp3029, label %.for.continue.3025, label %.for.end.3025
.for.continue.3025:
%.tmp3030 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3031 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3027
%.tmp3032 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3031, i32 0, i32 6
%.tmp3033 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3032
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3030, %m307$.Node.type* %.tmp3033, i1 1)
%.tmp3034 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3027
%.tmp3035 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3034, i32 0, i32 7
%.tmp3036 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3035
store %m307$.Node.type* %.tmp3036, %m307$.Node.type** %stmt.3027
br label %.for.start.3025
.for.end.3025:
%.tmp3038 = load %m307$.Node.type*, %m307$.Node.type** %start.3013
%s.3039 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3038, %m307$.Node.type** %s.3039
br label %.for.start.3037
.for.start.3037:
%.tmp3040 = load %m307$.Node.type*, %m307$.Node.type** %s.3039
%.tmp3041 = icmp ne %m307$.Node.type* %.tmp3040, null
br i1 %.tmp3041, label %.for.continue.3037, label %.for.end.3037
.for.continue.3037:
%.tmp3042 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3043 = load %m307$.Node.type*, %m307$.Node.type** %s.3039
%.tmp3044 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3043, i32 0, i32 6
%.tmp3045 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3044
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3042, %m307$.Node.type* %.tmp3045, i1 0)
%.tmp3046 = load %m307$.Node.type*, %m307$.Node.type** %s.3039
%.tmp3047 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3046, i32 0, i32 7
%.tmp3048 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3047
store %m307$.Node.type* %.tmp3048, %m307$.Node.type** %s.3039
br label %.for.start.3037
.for.end.3037:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp3049 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3050 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3049, i32 0, i32 2
%.tmp3051 = load i1, i1* %.tmp3050
%.tmp3052 = icmp eq i1 %.tmp3051, 0
%.tmp3053 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3054 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3053, i32 0, i32 1
%.tmp3055 = load i8*, i8** %.tmp3054
%.tmp3057 = getelementptr [7 x i8], [7 x i8]*@.str3056, i32 0, i32 0
%.tmp3058 = call i32(i8*,i8*) @strcmp(i8* %.tmp3055, i8* %.tmp3057)
%.tmp3059 = icmp eq i32 %.tmp3058, 0
%.tmp3060 = and i1 %.tmp3052, %.tmp3059
br i1 %.tmp3060, label %.if.true.3061, label %.if.false.3061
.if.true.3061:
%.tmp3062 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3063 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3062, i32 0, i32 1
%.tmp3064 = load %m0$.File.type*, %m0$.File.type** %.tmp3063
%.tmp3066 = getelementptr [21 x i8], [21 x i8]*@.str3065, i32 0, i32 0
%.tmp3067 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3068 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3067, i32 0, i32 3
%.tmp3069 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3068
%.tmp3070 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3069)
%.tmp3071 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3072 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3073 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3072, i32 0, i32 3
%.tmp3074 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3073
%.tmp3075 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3074, i32 0, i32 3
%.tmp3076 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3075
%.tmp3077 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3071, %m1861$.Type.type* %.tmp3076)
%.tmp3078 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3079 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3078, i32 0, i32 0
%.tmp3080 = load i8*, i8** %.tmp3079
%.tmp3081 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3064, i8* %.tmp3066, i8* %.tmp3070, i8* %.tmp3077, i8* %.tmp3080)
%.tmp3082 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3083 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3082, i32 0, i32 2
store i1 1, i1* %.tmp3083
br label %.if.end.3061
.if.false.3061:
br label %.if.end.3061
.if.end.3061:
ret void
}
define i8* @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3085 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3084)
%m.3086 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3085, %m1861$.ModuleLookup.type** %m.3086
%.tmp3087 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3086
%.tmp3088 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3087, i32 0, i32 1
%.tmp3089 = load i8*, i8** %.tmp3088
ret i8* %.tmp3089
}
define i8* @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn.arg, %m307$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%mangled_name.3090 = alloca i8*
store i8* null, i8** %mangled_name.3090
%.tmp3091 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3092 = load %m307$.Node.type*, %m307$.Node.type** %fn
%.tmp3093 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3092, i32 0, i32 2
%.tmp3094 = load i8*, i8** %.tmp3093
%.tmp3095 = call i8*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3091, i8* %.tmp3094)
%prefix.3096 = alloca i8*
store i8* %.tmp3095, i8** %prefix.3096
%.tmp3097 = getelementptr i8*, i8** %mangled_name.3090, i32 0
%.tmp3099 = getelementptr [5 x i8], [5 x i8]*@.str3098, i32 0, i32 0
%.tmp3100 = load i8*, i8** %prefix.3096
%.tmp3101 = load i8*, i8** %original_name
%.tmp3102 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3097, i8* %.tmp3099, i8* %.tmp3100, i8* %.tmp3101)
%.tmp3103 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3104 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3103, i32 0, i32 0
%.tmp3105 = load i8*, i8** %.tmp3104
%.tmp3107 = getelementptr [9 x i8], [9 x i8]*@.str3106, i32 0, i32 0
%.tmp3108 = call i32(i8*,i8*) @strcmp(i8* %.tmp3105, i8* %.tmp3107)
%.tmp3109 = icmp eq i32 %.tmp3108, 0
br i1 %.tmp3109, label %.if.true.3110, label %.if.false.3110
.if.true.3110:
%.tmp3111 = load i8*, i8** %mangled_name.3090
%.tmp3113 = getelementptr [5 x i8], [5 x i8]*@.str3112, i32 0, i32 0
%.tmp3114 = call i32(i8*,i8*) @strcmp(i8* %.tmp3111, i8* %.tmp3113)
%.tmp3115 = icmp ne i32 %.tmp3114, 0
br i1 %.tmp3115, label %.if.true.3116, label %.if.false.3116
.if.true.3116:
%tmp_buff.3117 = alloca i8*
store i8* null, i8** %tmp_buff.3117
%swap_var.3118 = alloca i8*
store i8* null, i8** %swap_var.3118
%.tmp3120 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3121 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3120, i32 0, i32 3
%.tmp3122 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3121
%tp.3123 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3122, %m1861$.Type.type** %tp.3123
br label %.for.start.3119
.for.start.3119:
%.tmp3124 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3123
%.tmp3125 = icmp ne %m1861$.Type.type* %.tmp3124, null
br i1 %.tmp3125, label %.for.continue.3119, label %.for.end.3119
.for.continue.3119:
%.tmp3126 = getelementptr i8*, i8** %tmp_buff.3117, i32 0
%.tmp3128 = getelementptr [6 x i8], [6 x i8]*@.str3127, i32 0, i32 0
%.tmp3129 = load i8*, i8** %mangled_name.3090
%.tmp3130 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3123
%.tmp3131 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp3130)
%.tmp3132 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3126, i8* %.tmp3128, i8* %.tmp3129, i8* %.tmp3131)
%.tmp3133 = load i8*, i8** %tmp_buff.3117
store i8* %.tmp3133, i8** %swap_var.3118
%.tmp3134 = load i8*, i8** %mangled_name.3090
store i8* %.tmp3134, i8** %tmp_buff.3117
%.tmp3135 = load i8*, i8** %swap_var.3118
store i8* %.tmp3135, i8** %mangled_name.3090
%.tmp3136 = load i8*, i8** %tmp_buff.3117
call void(i8*) @free(i8* %.tmp3136)
%.tmp3137 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3123
%.tmp3138 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3137, i32 0, i32 4
%.tmp3139 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3138
store %m1861$.Type.type* %.tmp3139, %m1861$.Type.type** %tp.3123
br label %.for.start.3119
.for.end.3119:
br label %.if.end.3116
.if.false.3116:
br label %.if.end.3116
.if.end.3116:
br label %.if.end.3110
.if.false.3110:
br label %.if.end.3110
.if.end.3110:
%.tmp3140 = load i8*, i8** %mangled_name.3090
ret i8* %.tmp3140
}
define void @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3141 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %info.3141
%return_type.3142 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %return_type.3142
%err_buf.3143 = alloca i8*
store i8* null, i8** %err_buf.3143
%tmp_buff.3144 = alloca i8*
store i8* null, i8** %tmp_buff.3144
%.tmp3145 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3146 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3145, i32 0, i32 0
%.tmp3147 = load i8*, i8** %.tmp3146
%.tmp3149 = getelementptr [3 x i8], [3 x i8]*@.str3148, i32 0, i32 0
%.tmp3150 = call i32(i8*,i8*) @strcmp(i8* %.tmp3147, i8* %.tmp3149)
%.tmp3151 = icmp eq i32 %.tmp3150, 0
br i1 %.tmp3151, label %.if.true.3152, label %.if.false.3152
.if.true.3152:
ret void
br label %.if.end.3152
.if.false.3152:
%.tmp3153 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3154 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3153, i32 0, i32 0
%.tmp3155 = load i8*, i8** %.tmp3154
%.tmp3157 = getelementptr [7 x i8], [7 x i8]*@.str3156, i32 0, i32 0
%.tmp3158 = call i32(i8*,i8*) @strcmp(i8* %.tmp3155, i8* %.tmp3157)
%.tmp3159 = icmp eq i32 %.tmp3158, 0
br i1 %.tmp3159, label %.if.true.3160, label %.if.false.3160
.if.true.3160:
%.tmp3161 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3162 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3161, i32 0, i32 6
%.tmp3163 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3162
%.tmp3165 = getelementptr [11 x i8], [11 x i8]*@.str3164, i32 0, i32 0
%.tmp3166 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3163, i8* %.tmp3165)
%assignable.3167 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3166, %m307$.Node.type** %assignable.3167
%.tmp3168 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3169 = load %m307$.Node.type*, %m307$.Node.type** %assignable.3167
%.tmp3170 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3168, %m307$.Node.type* %.tmp3169)
%a_info.3171 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3170, %m1861$.AssignableInfo.type** %a_info.3171
%.tmp3172 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3171
%.tmp3173 = icmp eq %m1861$.AssignableInfo.type* %.tmp3172, null
br i1 %.tmp3173, label %.if.true.3174, label %.if.false.3174
.if.true.3174:
ret void
br label %.if.end.3174
.if.false.3174:
br label %.if.end.3174
.if.end.3174:
%.tmp3175 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3176 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3175)
store %m1861$.AssignableInfo.type* %.tmp3176, %m1861$.AssignableInfo.type** %info.3141
%.tmp3177 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3178 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3177, i32 0, i32 6
%.tmp3179 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3178
%.tmp3180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3179, i32 0, i32 7
%.tmp3181 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3180
%.tmp3182 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3181, i32 0, i32 1
%.tmp3183 = load i8*, i8** %.tmp3182
%global_name.3184 = alloca i8*
store i8* %.tmp3183, i8** %global_name.3184
%.tmp3185 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3186 = load i8, i8* @SCOPE_GLOBAL
%.tmp3187 = load i8*, i8** %global_name.3184
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3185, i8 %.tmp3186, i8* %.tmp3187)
%.tmp3188 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3189 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3188, i32 0, i32 3
%.tmp3190 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3171
%.tmp3191 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3190, i32 0, i32 3
%.tmp3192 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3191
store %m1861$.Type.type* %.tmp3192, %m1861$.Type.type** %.tmp3189
%.tmp3193 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3194 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3193, i32 0, i32 2
%.tmp3196 = getelementptr [9 x i8], [9 x i8]*@.str3195, i32 0, i32 0
store i8* %.tmp3196, i8** %.tmp3194
%.tmp3197 = load i1, i1* %shallow
%.tmp3198 = icmp eq i1 %.tmp3197, 1
br i1 %.tmp3198, label %.if.true.3199, label %.if.false.3199
.if.true.3199:
%.tmp3200 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3201 = load i8*, i8** %global_name.3184
%.tmp3202 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3200, i8* %.tmp3201, %m1861$.AssignableInfo.type* %.tmp3202)
br label %.if.end.3199
.if.false.3199:
%.tmp3203 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3204 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3203, i32 0, i32 1
%.tmp3205 = load %m0$.File.type*, %m0$.File.type** %.tmp3204
%.tmp3207 = getelementptr [21 x i8], [21 x i8]*@.str3206, i32 0, i32 0
%.tmp3208 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3209 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3208)
%.tmp3210 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3211 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3212 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3211, i32 0, i32 3
%.tmp3213 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3212
%.tmp3214 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3210, %m1861$.Type.type* %.tmp3213)
%.tmp3215 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3171
%.tmp3216 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3215)
%.tmp3217 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3205, i8* %.tmp3207, i8* %.tmp3209, i8* %.tmp3214, i8* %.tmp3216)
br label %.if.end.3199
.if.end.3199:
br label %.if.end.3160
.if.false.3160:
%.tmp3218 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3219 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3218, i32 0, i32 0
%.tmp3220 = load i8*, i8** %.tmp3219
%.tmp3222 = getelementptr [10 x i8], [10 x i8]*@.str3221, i32 0, i32 0
%.tmp3223 = call i32(i8*,i8*) @strcmp(i8* %.tmp3220, i8* %.tmp3222)
%.tmp3224 = icmp eq i32 %.tmp3223, 0
br i1 %.tmp3224, label %.if.true.3225, label %.if.false.3225
.if.true.3225:
%.tmp3226 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3227 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3226, i32 0, i32 6
%.tmp3228 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3227
%.tmp3229 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3228, i32 0, i32 7
%.tmp3230 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3229
%.tmp3231 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3230, i32 0, i32 1
%.tmp3232 = load i8*, i8** %.tmp3231
%type_name.3233 = alloca i8*
store i8* %.tmp3232, i8** %type_name.3233
%.tmp3234 = load i1, i1* %shallow
%.tmp3235 = icmp eq i1 %.tmp3234, 1
br i1 %.tmp3235, label %.if.true.3236, label %.if.false.3236
.if.true.3236:
%.tmp3237 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3238 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3237)
store %m1861$.AssignableInfo.type* %.tmp3238, %m1861$.AssignableInfo.type** %info.3141
%.tmp3239 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3240 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3239)
%mod_from.3241 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3240, %m1861$.ModuleLookup.type** %mod_from.3241
%.tmp3242 = getelementptr i8*, i8** %tmp_buff.3144, i32 0
%.tmp3244 = getelementptr [11 x i8], [11 x i8]*@.str3243, i32 0, i32 0
%.tmp3245 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3241
%.tmp3246 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3245, i32 0, i32 1
%.tmp3247 = load i8*, i8** %.tmp3246
%.tmp3248 = load i8*, i8** %type_name.3233
%.tmp3249 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3242, i8* %.tmp3244, i8* %.tmp3247, i8* %.tmp3248)
%.tmp3250 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3251 = load i8, i8* @SCOPE_LOCAL
%.tmp3252 = load i8*, i8** %tmp_buff.3144
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3250, i8 %.tmp3251, i8* %.tmp3252)
%.tmp3253 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3254 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3253, i32 0, i32 2
%.tmp3256 = getelementptr [10 x i8], [10 x i8]*@.str3255, i32 0, i32 0
store i8* %.tmp3256, i8** %.tmp3254
%.tmp3257 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3258 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3257, i32 0, i32 4
%.tmp3259 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3260 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3259, i32 0, i32 3
%.tmp3261 = load i32, i32* %.tmp3260
store i32 %.tmp3261, i32* %.tmp3258
%.tmp3262 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3263 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3262, i32 0, i32 5
%.tmp3264 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3265 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3264, i32 0, i32 4
%.tmp3266 = load i32, i32* %.tmp3265
store i32 %.tmp3266, i32* %.tmp3263
%.tmp3267 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3268 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3267, i32 0, i32 3
%.tmp3269 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3269, %m1861$.Type.type** %.tmp3268
%.tmp3270 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3271 = load i8*, i8** %type_name.3233
%.tmp3272 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3270, i8* %.tmp3271, %m1861$.AssignableInfo.type* %.tmp3272)
%.tmp3273 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3274 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3273, i32 0, i32 6
%.tmp3275 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3274
%.tmp3277 = getelementptr [5 x i8], [5 x i8]*@.str3276, i32 0, i32 0
%.tmp3278 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3275, i8* %.tmp3277)
%type_decl.3279 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3278, %m307$.Node.type** %type_decl.3279
%.tmp3280 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3281 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3279
%.tmp3282 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3281, i32 0, i32 6
%.tmp3283 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3282
%.tmp3284 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3280, %m307$.Node.type* %.tmp3283)
%type_struct.3285 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3284, %m1861$.Type.type** %type_struct.3285
%.tmp3286 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3287 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3286, i32 0, i32 3
%.tmp3288 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3287
%.tmp3289 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3285
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3288, %m1861$.Type.type* %.tmp3289)
%.tmp3290 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3291 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3290, i32 0, i32 3
%.tmp3292 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3285
store %m1861$.Type.type* %.tmp3292, %m1861$.Type.type** %.tmp3291
br label %.if.end.3236
.if.false.3236:
%.tmp3293 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3294 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3295 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3294, i32 0, i32 6
%.tmp3296 = load i8*, i8** %.tmp3295
%.tmp3297 = load i8*, i8** %type_name.3233
%.tmp3298 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3293, i8* %.tmp3296, i8* %.tmp3297)
%scope.3299 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3298, %m1861$.ScopeItem.type** %scope.3299
%.tmp3300 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3299
%.tmp3301 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3300, i32 0, i32 1
%.tmp3302 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3301
store %m1861$.AssignableInfo.type* %.tmp3302, %m1861$.AssignableInfo.type** %info.3141
%.tmp3303 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3304 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3303, i32 0, i32 1
%.tmp3305 = load %m0$.File.type*, %m0$.File.type** %.tmp3304
%.tmp3307 = getelementptr [14 x i8], [14 x i8]*@.str3306, i32 0, i32 0
%.tmp3308 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3309 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3308)
%.tmp3310 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3311 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3312 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3311, i32 0, i32 3
%.tmp3313 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3312
%.tmp3314 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3310, %m1861$.Type.type* %.tmp3313)
%.tmp3315 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3305, i8* %.tmp3307, i8* %.tmp3309, i8* %.tmp3314)
br label %.if.end.3236
.if.end.3236:
br label %.if.end.3225
.if.false.3225:
%.tmp3316 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3317 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3316, i32 0, i32 0
%.tmp3318 = load i8*, i8** %.tmp3317
%.tmp3320 = getelementptr [7 x i8], [7 x i8]*@.str3319, i32 0, i32 0
%.tmp3321 = call i32(i8*,i8*) @strcmp(i8* %.tmp3318, i8* %.tmp3320)
%.tmp3322 = icmp eq i32 %.tmp3321, 0
br i1 %.tmp3322, label %.if.true.3323, label %.if.false.3323
.if.true.3323:
%.tmp3324 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3325 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3324)
store %m1861$.AssignableInfo.type* %.tmp3325, %m1861$.AssignableInfo.type** %info.3141
%.tmp3326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3327 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3326, i32 0, i32 3
%.tmp3328 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3329 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3330 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3329, i32 0, i32 6
%.tmp3331 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3330
%.tmp3332 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3331, i32 0, i32 7
%.tmp3333 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3332
%.tmp3334 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3328, %m307$.Node.type* %.tmp3333)
store %m1861$.Type.type* %.tmp3334, %m1861$.Type.type** %.tmp3327
%.tmp3335 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3336 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3335, i32 0, i32 2
%.tmp3338 = getelementptr [7 x i8], [7 x i8]*@.str3337, i32 0, i32 0
store i8* %.tmp3338, i8** %.tmp3336
%.tmp3339 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3340 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3339, i32 0, i32 6
%.tmp3341 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3340
%.tmp3342 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3341, i32 0, i32 7
%.tmp3343 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3342
%.tmp3344 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3343, i32 0, i32 7
%.tmp3345 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3344
%.tmp3346 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3345, i32 0, i32 1
%.tmp3347 = load i8*, i8** %.tmp3346
%fn_name.3348 = alloca i8*
store i8* %.tmp3347, i8** %fn_name.3348
%.tmp3349 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3350 = load i8, i8* @SCOPE_GLOBAL
%.tmp3351 = load i8*, i8** %fn_name.3348
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3349, i8 %.tmp3350, i8* %.tmp3351)
%.tmp3352 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3352, %m1861$.Type.type** %return_type.3142
%.tmp3353 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3354 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3353, i32 0, i32 0
%.tmp3355 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3356 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3355, i32 0, i32 3
%.tmp3357 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3356
%.tmp3358 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3357, i32 0, i32 3
%.tmp3359 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3358
%.tmp3360 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3359, i32 0, i32 0
%.tmp3361 = load i8*, i8** %.tmp3360
store i8* %.tmp3361, i8** %.tmp3354
%.tmp3362 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3363 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3362, i32 0, i32 3
%.tmp3364 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3365 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3364, i32 0, i32 3
%.tmp3366 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3365
%.tmp3367 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3366, i32 0, i32 3
%.tmp3368 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3367
%.tmp3369 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3368, i32 0, i32 3
%.tmp3370 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3369
store %m1861$.Type.type* %.tmp3370, %m1861$.Type.type** %.tmp3363
%.tmp3371 = load i1, i1* %shallow
%.tmp3372 = icmp eq i1 %.tmp3371, 0
br i1 %.tmp3372, label %.if.true.3373, label %.if.false.3373
.if.true.3373:
%.tmp3374 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3375 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3374, i32 0, i32 1
%.tmp3376 = load %m0$.File.type*, %m0$.File.type** %.tmp3375
%.tmp3378 = getelementptr [15 x i8], [15 x i8]*@.str3377, i32 0, i32 0
%.tmp3379 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3380 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3381 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3379, %m1861$.Type.type* %.tmp3380)
%.tmp3382 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3383 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3382)
%.tmp3384 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3376, i8* %.tmp3378, i8* %.tmp3381, i8* %.tmp3383)
%.tmp3386 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3387 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3386, i32 0, i32 3
%.tmp3388 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3387
%.tmp3389 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3388, i32 0, i32 3
%.tmp3390 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3389
%.tmp3391 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3390, i32 0, i32 4
%.tmp3392 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3391
%pt.3393 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3392, %m1861$.Type.type** %pt.3393
br label %.for.start.3385
.for.start.3385:
%.tmp3394 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3393
%.tmp3395 = icmp ne %m1861$.Type.type* %.tmp3394, null
br i1 %.tmp3395, label %.for.continue.3385, label %.for.end.3385
.for.continue.3385:
%.tmp3396 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3393
%.tmp3397 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3398 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3397, i32 0, i32 3
%.tmp3399 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3398
%.tmp3400 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3399, i32 0, i32 3
%.tmp3401 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3400
%.tmp3402 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3401, i32 0, i32 4
%.tmp3403 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3402
%.tmp3404 = icmp ne %m1861$.Type.type* %.tmp3396, %.tmp3403
br i1 %.tmp3404, label %.if.true.3405, label %.if.false.3405
.if.true.3405:
%.tmp3406 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3407 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3406, i32 0, i32 1
%.tmp3408 = load %m0$.File.type*, %m0$.File.type** %.tmp3407
%.tmp3410 = getelementptr [3 x i8], [3 x i8]*@.str3409, i32 0, i32 0
%.tmp3411 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3408, i8* %.tmp3410)
br label %.if.end.3405
.if.false.3405:
br label %.if.end.3405
.if.end.3405:
%.tmp3412 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3413 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3412, i32 0, i32 1
%.tmp3414 = load %m0$.File.type*, %m0$.File.type** %.tmp3413
%.tmp3416 = getelementptr [3 x i8], [3 x i8]*@.str3415, i32 0, i32 0
%.tmp3417 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3418 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3393
%.tmp3419 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3417, %m1861$.Type.type* %.tmp3418)
%.tmp3420 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3414, i8* %.tmp3416, i8* %.tmp3419)
%.tmp3421 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3393
%.tmp3422 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3421, i32 0, i32 4
%.tmp3423 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3422
store %m1861$.Type.type* %.tmp3423, %m1861$.Type.type** %pt.3393
br label %.for.start.3385
.for.end.3385:
%.tmp3424 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3425 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3424, i32 0, i32 1
%.tmp3426 = load %m0$.File.type*, %m0$.File.type** %.tmp3425
%.tmp3428 = getelementptr [3 x i8], [3 x i8]*@.str3427, i32 0, i32 0
%.tmp3429 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3426, i8* %.tmp3428)
%.tmp3430 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3431 = bitcast %m1861$.Type.type* %.tmp3430 to i8*
call void(i8*) @free(i8* %.tmp3431)
br label %.if.end.3373
.if.false.3373:
%.tmp3432 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3433 = load i8*, i8** %fn_name.3348
%.tmp3434 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3432, i8* %.tmp3433, %m1861$.AssignableInfo.type* %.tmp3434)
br label %.if.end.3373
.if.end.3373:
br label %.if.end.3323
.if.false.3323:
%.tmp3435 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3436 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3435, i32 0, i32 0
%.tmp3437 = load i8*, i8** %.tmp3436
%.tmp3439 = getelementptr [9 x i8], [9 x i8]*@.str3438, i32 0, i32 0
%.tmp3440 = call i32(i8*,i8*) @strcmp(i8* %.tmp3437, i8* %.tmp3439)
%.tmp3441 = icmp eq i32 %.tmp3440, 0
br i1 %.tmp3441, label %.if.true.3442, label %.if.false.3442
.if.true.3442:
%.tmp3443 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3444 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3443)
store %m1861$.AssignableInfo.type* %.tmp3444, %m1861$.AssignableInfo.type** %info.3141
%.tmp3445 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3446 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3445, i32 0, i32 2
%.tmp3448 = getelementptr [9 x i8], [9 x i8]*@.str3447, i32 0, i32 0
store i8* %.tmp3448, i8** %.tmp3446
%.tmp3449 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3450 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3449, i32 0, i32 3
%.tmp3451 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3452 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3453 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3452, i32 0, i32 6
%.tmp3454 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3453
%.tmp3455 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3451, %m307$.Node.type* %.tmp3454)
store %m1861$.Type.type* %.tmp3455, %m1861$.Type.type** %.tmp3450
%.tmp3456 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3457 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3456)
%name.3458 = alloca i8*
store i8* %.tmp3457, i8** %name.3458
%.tmp3459 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3460 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3461 = load i8*, i8** %name.3458
%.tmp3462 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3463 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3462, i32 0, i32 3
%.tmp3464 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3463
%.tmp3465 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3459, %m307$.Node.type* %.tmp3460, i8* %.tmp3461, %m1861$.Type.type* %.tmp3464)
store i8* %.tmp3465, i8** %tmp_buff.3144
%.tmp3466 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3467 = load i8, i8* @SCOPE_GLOBAL
%.tmp3468 = load i8*, i8** %tmp_buff.3144
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3466, i8 %.tmp3467, i8* %.tmp3468)
%.tmp3469 = load i1, i1* %shallow
%.tmp3470 = icmp eq i1 %.tmp3469, 1
br i1 %.tmp3470, label %.if.true.3471, label %.if.false.3471
.if.true.3471:
%.tmp3472 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3473 = load i8*, i8** %name.3458
%.tmp3474 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3472, i8* %.tmp3473, %m1861$.AssignableInfo.type* %.tmp3474)
br label %.if.end.3471
.if.false.3471:
%.tmp3475 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3475, %m1861$.Type.type** %return_type.3142
%.tmp3476 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3477 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3478 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3477, i32 0, i32 3
%.tmp3479 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3478
%.tmp3480 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3479, i32 0, i32 3
%.tmp3481 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3480
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3476, %m1861$.Type.type* %.tmp3481)
%.tmp3482 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3483 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3482, i32 0, i32 1
%.tmp3484 = load %m0$.File.type*, %m0$.File.type** %.tmp3483
%.tmp3486 = getelementptr [14 x i8], [14 x i8]*@.str3485, i32 0, i32 0
%.tmp3487 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3488 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3489 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3487, %m1861$.Type.type* %.tmp3488)
%.tmp3490 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3491 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3490)
%.tmp3492 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3484, i8* %.tmp3486, i8* %.tmp3489, i8* %.tmp3491)
%.tmp3493 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3494 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3493, i32 0, i32 6
%.tmp3495 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3494
%.tmp3496 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3495)
%params.3497 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3496, %m307$.Node.type** %params.3497
%param_type.3498 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3498
%.tmp3500 = load %m307$.Node.type*, %m307$.Node.type** %params.3497
%param_ptr.3501 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3500, %m307$.Node.type** %param_ptr.3501
br label %.for.start.3499
.for.start.3499:
%.tmp3502 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3503 = icmp ne %m307$.Node.type* %.tmp3502, null
br i1 %.tmp3503, label %.for.continue.3499, label %.for.end.3499
.for.continue.3499:
%.tmp3504 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3505 = load %m307$.Node.type*, %m307$.Node.type** %params.3497
%.tmp3506 = icmp ne %m307$.Node.type* %.tmp3504, %.tmp3505
br i1 %.tmp3506, label %.if.true.3507, label %.if.false.3507
.if.true.3507:
%.tmp3508 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3509 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3508, i32 0, i32 7
%.tmp3510 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3509
store %m307$.Node.type* %.tmp3510, %m307$.Node.type** %param_ptr.3501
%.tmp3511 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3512 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3511, i32 0, i32 1
%.tmp3513 = load %m0$.File.type*, %m0$.File.type** %.tmp3512
%.tmp3515 = getelementptr [3 x i8], [3 x i8]*@.str3514, i32 0, i32 0
%.tmp3516 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3513, i8* %.tmp3515)
br label %.if.end.3507
.if.false.3507:
br label %.if.end.3507
.if.end.3507:
%.tmp3517 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3518 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3517, i32 0, i32 0
%.tmp3519 = load i8*, i8** %.tmp3518
%.tmp3521 = getelementptr [5 x i8], [5 x i8]*@.str3520, i32 0, i32 0
%.tmp3522 = call i32(i8*,i8*) @strcmp(i8* %.tmp3519, i8* %.tmp3521)
%.tmp3523 = icmp eq i32 %.tmp3522, 0
br i1 %.tmp3523, label %.if.true.3524, label %.if.false.3524
.if.true.3524:
%.tmp3525 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3526 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3527 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3526, i32 0, i32 6
%.tmp3528 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3527
%.tmp3529 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3525, %m307$.Node.type* %.tmp3528)
store %m1861$.Type.type* %.tmp3529, %m1861$.Type.type** %param_type.3498
%.tmp3530 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3531 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3530, i32 0, i32 7
%.tmp3532 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3531
store %m307$.Node.type* %.tmp3532, %m307$.Node.type** %param_ptr.3501
br label %.if.end.3524
.if.false.3524:
br label %.if.end.3524
.if.end.3524:
%.tmp3533 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3534 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3533, i32 0, i32 1
%.tmp3535 = load %m0$.File.type*, %m0$.File.type** %.tmp3534
%.tmp3537 = getelementptr [13 x i8], [13 x i8]*@.str3536, i32 0, i32 0
%.tmp3538 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3539 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3498
%.tmp3540 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3538, %m1861$.Type.type* %.tmp3539)
%.tmp3541 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3542 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3541, i32 0, i32 1
%.tmp3543 = load i8*, i8** %.tmp3542
%.tmp3544 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3535, i8* %.tmp3537, i8* %.tmp3540, i8* %.tmp3543)
%.tmp3545 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3501
%.tmp3546 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3545, i32 0, i32 7
%.tmp3547 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3546
store %m307$.Node.type* %.tmp3547, %m307$.Node.type** %param_ptr.3501
br label %.for.start.3499
.for.end.3499:
%.tmp3548 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3549 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3548, i32 0, i32 1
%.tmp3550 = load %m0$.File.type*, %m0$.File.type** %.tmp3549
%.tmp3552 = getelementptr [5 x i8], [5 x i8]*@.str3551, i32 0, i32 0
%.tmp3553 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3550, i8* %.tmp3552)
%.tmp3554 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3556 = getelementptr [9 x i8], [9 x i8]*@.str3555, i32 0, i32 0
%.tmp3557 = bitcast ptr null to i8*
%.tmp3558 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3554, i8* %.tmp3556, i8* %.tmp3557, i8* %.tmp3558)
%.tmp3559 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3560 = load %m307$.Node.type*, %m307$.Node.type** %params.3497
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3559, %m307$.Node.type* %.tmp3560)
%.tmp3561 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3562 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3561, i32 0, i32 6
%.tmp3563 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3562
%.tmp3565 = getelementptr [6 x i8], [6 x i8]*@.str3564, i32 0, i32 0
%.tmp3566 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3563, i8* %.tmp3565)
%fn_block.3567 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3566, %m307$.Node.type** %fn_block.3567
%.tmp3568 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3569 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3567
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3568, %m307$.Node.type* %.tmp3569)
%.tmp3570 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3570)
%.tmp3571 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3572 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3571, %m307$.Node.type** %last_valid_instruction.3572
%.tmp3574 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3567
%.tmp3575 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3574, i32 0, i32 6
%.tmp3576 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3575
%ci.3577 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3576, %m307$.Node.type** %ci.3577
br label %.for.start.3573
.for.start.3573:
%.tmp3578 = load %m307$.Node.type*, %m307$.Node.type** %ci.3577
%.tmp3579 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3578, i32 0, i32 7
%.tmp3580 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3579
%.tmp3581 = icmp ne %m307$.Node.type* %.tmp3580, null
br i1 %.tmp3581, label %.for.continue.3573, label %.for.end.3573
.for.continue.3573:
%.tmp3582 = load %m307$.Node.type*, %m307$.Node.type** %ci.3577
%.tmp3583 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3582, i32 0, i32 0
%.tmp3584 = load i8*, i8** %.tmp3583
%.tmp3586 = getelementptr [3 x i8], [3 x i8]*@.str3585, i32 0, i32 0
%.tmp3587 = call i32(i8*,i8*) @strcmp(i8* %.tmp3584, i8* %.tmp3586)
%.tmp3588 = icmp ne i32 %.tmp3587, 0
%.tmp3589 = load %m307$.Node.type*, %m307$.Node.type** %ci.3577
%.tmp3590 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3589, i32 0, i32 0
%.tmp3591 = load i8*, i8** %.tmp3590
%.tmp3593 = getelementptr [9 x i8], [9 x i8]*@.str3592, i32 0, i32 0
%.tmp3594 = call i32(i8*,i8*) @strcmp(i8* %.tmp3591, i8* %.tmp3593)
%.tmp3595 = icmp ne i32 %.tmp3594, 0
%.tmp3596 = and i1 %.tmp3588, %.tmp3595
br i1 %.tmp3596, label %.if.true.3597, label %.if.false.3597
.if.true.3597:
%.tmp3598 = load %m307$.Node.type*, %m307$.Node.type** %ci.3577
store %m307$.Node.type* %.tmp3598, %m307$.Node.type** %last_valid_instruction.3572
br label %.if.end.3597
.if.false.3597:
br label %.if.end.3597
.if.end.3597:
%.tmp3599 = load %m307$.Node.type*, %m307$.Node.type** %ci.3577
%.tmp3600 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3599, i32 0, i32 7
%.tmp3601 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3600
store %m307$.Node.type* %.tmp3601, %m307$.Node.type** %ci.3577
br label %.for.start.3573
.for.end.3573:
%add_implicit_return.3602 = alloca i1
store i1 0, i1* %add_implicit_return.3602
%.tmp3603 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3572
%.tmp3604 = icmp eq %m307$.Node.type* %.tmp3603, null
br i1 %.tmp3604, label %.if.true.3605, label %.if.false.3605
.if.true.3605:
store i1 1, i1* %add_implicit_return.3602
br label %.if.end.3605
.if.false.3605:
%.tmp3606 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3572
%.tmp3607 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3606, i32 0, i32 6
%.tmp3608 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3607
%.tmp3609 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3608, i32 0, i32 0
%.tmp3610 = load i8*, i8** %.tmp3609
%.tmp3612 = getelementptr [7 x i8], [7 x i8]*@.str3611, i32 0, i32 0
%.tmp3613 = call i32(i8*,i8*) @strcmp(i8* %.tmp3610, i8* %.tmp3612)
%.tmp3614 = icmp ne i32 %.tmp3613, 0
br i1 %.tmp3614, label %.if.true.3615, label %.if.false.3615
.if.true.3615:
store i1 1, i1* %add_implicit_return.3602
br label %.if.end.3615
.if.false.3615:
br label %.if.end.3615
.if.end.3615:
br label %.if.end.3605
.if.end.3605:
%.tmp3616 = load i1, i1* %add_implicit_return.3602
br i1 %.tmp3616, label %.if.true.3617, label %.if.false.3617
.if.true.3617:
%.tmp3618 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3619 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3620 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3618, %m1861$.Type.type* %.tmp3619)
%.tmp3622 = getelementptr [5 x i8], [5 x i8]*@.str3621, i32 0, i32 0
%.tmp3623 = call i32(i8*,i8*) @strcmp(i8* %.tmp3620, i8* %.tmp3622)
%.tmp3624 = icmp ne i32 %.tmp3623, 0
br i1 %.tmp3624, label %.if.true.3625, label %.if.false.3625
.if.true.3625:
%.tmp3626 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3627 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3567
%.tmp3629 = getelementptr [21 x i8], [21 x i8]*@.str3628, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3626, %m307$.Node.type* %.tmp3627, i8* %.tmp3629)
br label %.if.end.3625
.if.false.3625:
%.tmp3630 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3631 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3630, i32 0, i32 1
%.tmp3632 = load %m0$.File.type*, %m0$.File.type** %.tmp3631
%.tmp3634 = getelementptr [10 x i8], [10 x i8]*@.str3633, i32 0, i32 0
%.tmp3635 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3632, i8* %.tmp3634)
br label %.if.end.3625
.if.end.3625:
br label %.if.end.3617
.if.false.3617:
br label %.if.end.3617
.if.end.3617:
%.tmp3636 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3637 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3636, i32 0, i32 1
%.tmp3638 = load %m0$.File.type*, %m0$.File.type** %.tmp3637
%.tmp3640 = getelementptr [3 x i8], [3 x i8]*@.str3639, i32 0, i32 0
%.tmp3641 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3638, i8* %.tmp3640)
br label %.if.end.3471
.if.end.3471:
br label %.if.end.3442
.if.false.3442:
%.tmp3642 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3643 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3642, i32 0, i32 0
%.tmp3644 = load i8*, i8** %.tmp3643
%.tmp3646 = getelementptr [7 x i8], [7 x i8]*@.str3645, i32 0, i32 0
%.tmp3647 = call i32(i8*,i8*) @strcmp(i8* %.tmp3644, i8* %.tmp3646)
%.tmp3648 = icmp eq i32 %.tmp3647, 0
br i1 %.tmp3648, label %.if.true.3649, label %.if.false.3649
.if.true.3649:
%.tmp3650 = load i1, i1* %shallow
%.tmp3651 = icmp eq i1 %.tmp3650, 1
br i1 %.tmp3651, label %.if.true.3652, label %.if.false.3652
.if.true.3652:
%.tmp3653 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3654 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3653, i32 0, i32 6
%.tmp3655 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3654
%.tmp3656 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3655, i32 0, i32 7
%.tmp3657 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3656
%.tmp3658 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3657, i32 0, i32 1
%.tmp3659 = load i8*, i8** %.tmp3658
%mod_name.3660 = alloca i8*
store i8* %.tmp3659, i8** %mod_name.3660
%.tmp3661 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3662 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3661, i32 0, i32 6
%.tmp3663 = load i8*, i8** %.tmp3662
%mod_abspath.3664 = alloca i8*
store i8* %.tmp3663, i8** %mod_abspath.3664
%.tmp3665 = load i8*, i8** %mod_abspath.3664
%.tmp3666 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3665)
%dirname.3667 = alloca i8*
store i8* %.tmp3666, i8** %dirname.3667
%.tmp3668 = load i8*, i8** %mod_name.3660
%.tmp3669 = call i32(i8*) @strlen(i8* %.tmp3668)
%mod_name_len.3670 = alloca i32
store i32 %.tmp3669, i32* %mod_name_len.3670
%.tmp3671 = load i32, i32* %mod_name_len.3670
%.tmp3672 = sub i32 %.tmp3671, 1
%.tmp3673 = call i8*(i32) @malloc(i32 %.tmp3672)
%trimmed_name.3674 = alloca i8*
store i8* %.tmp3673, i8** %trimmed_name.3674
%i.3676 = alloca i32
store i32 1, i32* %i.3676
br label %.for.start.3675
.for.start.3675:
%.tmp3677 = load i32, i32* %i.3676
%.tmp3678 = load i32, i32* %mod_name_len.3670
%.tmp3679 = sub i32 %.tmp3678, 1
%.tmp3680 = icmp slt i32 %.tmp3677, %.tmp3679
br i1 %.tmp3680, label %.for.continue.3675, label %.for.end.3675
.for.continue.3675:
%.tmp3681 = load i32, i32* %i.3676
%.tmp3682 = sub i32 %.tmp3681, 1
%.tmp3683 = load i8*, i8** %trimmed_name.3674
%.tmp3684 = getelementptr i8, i8* %.tmp3683, i32 %.tmp3682
%.tmp3685 = load i32, i32* %i.3676
%.tmp3686 = load i8*, i8** %mod_name.3660
%.tmp3687 = getelementptr i8, i8* %.tmp3686, i32 %.tmp3685
%.tmp3688 = load i8, i8* %.tmp3687
store i8 %.tmp3688, i8* %.tmp3684
%.tmp3689 = load i32, i32* %i.3676
%.tmp3690 = add i32 %.tmp3689, 1
store i32 %.tmp3690, i32* %i.3676
br label %.for.start.3675
.for.end.3675:
%.tmp3691 = load i32, i32* %mod_name_len.3670
%.tmp3692 = sub i32 %.tmp3691, 2
%.tmp3693 = load i8*, i8** %trimmed_name.3674
%.tmp3694 = getelementptr i8, i8* %.tmp3693, i32 %.tmp3692
store i8 0, i8* %.tmp3694
%.tmp3695 = load i8*, i8** %dirname.3667
%.tmp3697 = getelementptr [1 x i8], [1 x i8]*@.str3696, i32 0, i32 0
%.tmp3698 = call i32(i8*,i8*) @strcmp(i8* %.tmp3695, i8* %.tmp3697)
%.tmp3699 = icmp eq i32 %.tmp3698, 0
br i1 %.tmp3699, label %.if.true.3700, label %.if.false.3700
.if.true.3700:
%.tmp3701 = getelementptr i8*, i8** %mod_abspath.3664, i32 0
%.tmp3703 = getelementptr [6 x i8], [6 x i8]*@.str3702, i32 0, i32 0
%.tmp3704 = load i8*, i8** %trimmed_name.3674
%.tmp3705 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3701, i8* %.tmp3703, i8* %.tmp3704)
br label %.if.end.3700
.if.false.3700:
%.tmp3706 = getelementptr i8*, i8** %mod_abspath.3664, i32 0
%.tmp3708 = getelementptr [9 x i8], [9 x i8]*@.str3707, i32 0, i32 0
%.tmp3709 = load i8*, i8** %dirname.3667
%.tmp3710 = load i8*, i8** %trimmed_name.3674
%.tmp3711 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3706, i8* %.tmp3708, i8* %.tmp3709, i8* %.tmp3710)
br label %.if.end.3700
.if.end.3700:
%.tmp3712 = load i8*, i8** %mod_abspath.3664
%.tmp3713 = call i8*(i32) @malloc(i32 4096)
%.tmp3714 = call i8*(i8*,i8*) @realpath(i8* %.tmp3712, i8* %.tmp3713)
store i8* %.tmp3714, i8** %mod_abspath.3664
%.tmp3715 = load i8*, i8** %mod_abspath.3664
%.tmp3716 = icmp eq i8* %.tmp3715, null
br i1 %.tmp3716, label %.if.true.3717, label %.if.false.3717
.if.true.3717:
%.tmp3718 = getelementptr i8*, i8** %err_buf.3143, i32 0
%.tmp3720 = getelementptr [60 x i8], [60 x i8]*@.str3719, i32 0, i32 0
%.tmp3721 = load i8*, i8** %mod_name.3660
%.tmp3722 = load i8*, i8** %dirname.3667
%.tmp3723 = load i8*, i8** %trimmed_name.3674
%.tmp3724 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3718, i8* %.tmp3720, i8* %.tmp3721, i8* %.tmp3722, i8* %.tmp3723)
%.tmp3725 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3726 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3727 = load i8*, i8** %err_buf.3143
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3725, %m307$.Node.type* %.tmp3726, i8* %.tmp3727)
ret void
br label %.if.end.3717
.if.false.3717:
br label %.if.end.3717
.if.end.3717:
%already_imported.3728 = alloca i1
store i1 0, i1* %already_imported.3728
%m.3729 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3729
%.tmp3730 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3731 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3730, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3733 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3734 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3733, i32 0, i32 5
%.tmp3735 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3734
store %m1861$.ModuleLookup.type* %.tmp3735, %m1861$.ModuleLookup.type** %m.3729
br label %.for.start.3732
.for.start.3732:
%.tmp3736 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
%.tmp3737 = icmp ne %m1861$.ModuleLookup.type* %.tmp3736, null
%.tmp3738 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3739 = icmp eq %m1861$.ModuleLookup.type* %.tmp3738, null
%.tmp3740 = and i1 %.tmp3737, %.tmp3739
br i1 %.tmp3740, label %.for.continue.3732, label %.for.end.3732
.for.continue.3732:
%.tmp3741 = load i8*, i8** %mod_abspath.3664
%.tmp3742 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
%.tmp3743 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3742, i32 0, i32 0
%.tmp3744 = load i8*, i8** %.tmp3743
%.tmp3745 = call i32(i8*,i8*) @strcmp(i8* %.tmp3741, i8* %.tmp3744)
%.tmp3746 = icmp eq i32 %.tmp3745, 0
br i1 %.tmp3746, label %.if.true.3747, label %.if.false.3747
.if.true.3747:
%.tmp3748 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
store %m1861$.ModuleLookup.type* %.tmp3748, %m1861$.ModuleLookup.type** %mod.3731
br label %.if.end.3747
.if.false.3747:
br label %.if.end.3747
.if.end.3747:
%.tmp3749 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
%.tmp3750 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3749, i32 0, i32 2
%.tmp3751 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3750
store %m1861$.ModuleLookup.type* %.tmp3751, %m1861$.ModuleLookup.type** %m.3729
br label %.for.start.3732
.for.end.3732:
%.tmp3752 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3753 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3752, i32 0, i32 6
%.tmp3754 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3753
%.tmp3755 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3754, i32 0, i32 7
%.tmp3756 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3755
%.tmp3757 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3756, i32 0, i32 7
%.tmp3758 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3757
%.tmp3759 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3758, i32 0, i32 7
%.tmp3760 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3759
%.tmp3761 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3760, i32 0, i32 1
%.tmp3762 = load i8*, i8** %.tmp3761
%asname.3763 = alloca i8*
store i8* %.tmp3762, i8** %asname.3763
%.tmp3764 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3765 = icmp eq %m1861$.ModuleLookup.type* %.tmp3764, null
br i1 %.tmp3765, label %.if.true.3766, label %.if.false.3766
.if.true.3766:
%.tmp3767 = load i32, i32* @ModuleLookup_size
%.tmp3768 = call i8*(i32) @malloc(i32 %.tmp3767)
%.tmp3769 = bitcast i8* %.tmp3768 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3769, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3770 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3771 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3770, i32 0, i32 0
%.tmp3772 = load i8*, i8** %mod_abspath.3664
store i8* %.tmp3772, i8** %.tmp3771
%.tmp3773 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3774 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3773, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3774
%.tmp3775 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3776 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3775, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3776
%.tmp3777 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3778 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3777, i32 0, i32 1
%.tmp3779 = getelementptr i8*, i8** %.tmp3778, i32 0
%.tmp3781 = getelementptr [5 x i8], [5 x i8]*@.str3780, i32 0, i32 0
%.tmp3782 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3783 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3782)
%.tmp3784 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3779, i8* %.tmp3781, i32 %.tmp3783)
%.tmp3786 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3787 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3786, i32 0, i32 5
%.tmp3788 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3787
store %m1861$.ModuleLookup.type* %.tmp3788, %m1861$.ModuleLookup.type** %m.3729
br label %.for.start.3785
.for.start.3785:
%.tmp3789 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
%.tmp3790 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3789, i32 0, i32 2
%.tmp3791 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3790
%.tmp3792 = icmp ne %m1861$.ModuleLookup.type* %.tmp3791, null
br i1 %.tmp3792, label %.for.continue.3785, label %.for.end.3785
.for.continue.3785:
%.tmp3793 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
%.tmp3794 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3793, i32 0, i32 2
%.tmp3795 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3794
store %m1861$.ModuleLookup.type* %.tmp3795, %m1861$.ModuleLookup.type** %m.3729
br label %.for.start.3785
.for.end.3785:
%.tmp3796 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3729
%.tmp3797 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3796, i32 0, i32 2
%.tmp3798 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
store %m1861$.ModuleLookup.type* %.tmp3798, %m1861$.ModuleLookup.type** %.tmp3797
%.tmp3799 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3800 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3801 = load i8*, i8** %asname.3763
%.tmp3802 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3803 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3802, i32 0, i32 0
%.tmp3804 = load i8*, i8** %.tmp3803
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3799, %m307$.Node.type* %.tmp3800, i8* %.tmp3801, i8* %.tmp3804)
%.tmp3805 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3806 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3805, i32 0, i32 6
%.tmp3807 = load i8*, i8** %.tmp3806
%curr_mod.3808 = alloca i8*
store i8* %.tmp3807, i8** %curr_mod.3808
%.tmp3809 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3810 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3809, i32 0, i32 6
%.tmp3811 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3812 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3811, i32 0, i32 0
%.tmp3813 = load i8*, i8** %.tmp3812
store i8* %.tmp3813, i8** %.tmp3810
%.tmp3814 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3815 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3816 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3815, i32 0, i32 0
%.tmp3817 = load i8*, i8** %.tmp3816
%.tmp3818 = call i1(%m1861$.CompilerCtx.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3814, i8* %.tmp3817)
%.tmp3819 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3820 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3819, i32 0, i32 6
%.tmp3821 = load i8*, i8** %curr_mod.3808
store i8* %.tmp3821, i8** %.tmp3820
br label %.if.end.3766
.if.false.3766:
%.tmp3822 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3823 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3824 = load i8*, i8** %asname.3763
%.tmp3825 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3731
%.tmp3826 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3825, i32 0, i32 0
%.tmp3827 = load i8*, i8** %.tmp3826
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3822, %m307$.Node.type* %.tmp3823, i8* %.tmp3824, i8* %.tmp3827)
br label %.if.end.3766
.if.end.3766:
br label %.if.end.3652
.if.false.3652:
br label %.if.end.3652
.if.end.3652:
br label %.if.end.3649
.if.false.3649:
%.tmp3828 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3829 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3831 = getelementptr [40 x i8], [40 x i8]*@.str3830, i32 0, i32 0
%.tmp3832 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3828, %m307$.Node.type* %.tmp3829, i8* %.tmp3831)
%.tmp3833 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3834 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3833, i32 0, i32 0
%.tmp3835 = load i8*, i8** %.tmp3834
%.tmp3836 = call i32(i8*,...) @printf(i8* %.tmp3832, i8* %.tmp3835)
br label %.if.end.3649
.if.end.3649:
br label %.if.end.3442
.if.end.3442:
br label %.if.end.3323
.if.end.3323:
br label %.if.end.3225
.if.end.3225:
br label %.if.end.3160
.if.end.3160:
br label %.if.end.3152
.if.end.3152:
ret void
}
define i8* @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3837 = alloca i8*
store i8* null, i8** %buf.3837
%.tmp3838 = getelementptr i8*, i8** %buf.3837, i32 0
%.tmp3840 = getelementptr [31 x i8], [31 x i8]*@.str3839, i32 0, i32 0
%.tmp3841 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3842 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3841, i32 0, i32 6
%.tmp3843 = load i8*, i8** %.tmp3842
%.tmp3844 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3845 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3844, i32 0, i32 3
%.tmp3846 = load i32, i32* %.tmp3845
%.tmp3847 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3848 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3847, i32 0, i32 4
%.tmp3849 = load i32, i32* %.tmp3848
%.tmp3850 = load i8*, i8** %msg
%.tmp3851 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3838, i8* %.tmp3840, i8* %.tmp3843, i32 %.tmp3846, i32 %.tmp3849, i8* %.tmp3850)
%.tmp3852 = load i8*, i8** %buf.3837
ret i8* %.tmp3852
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3853 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3853
%.tmp3855 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3856 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3855, %m307$.Node.type** %param_ptr.3856
br label %.for.start.3854
.for.start.3854:
%.tmp3857 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3858 = icmp ne %m307$.Node.type* %.tmp3857, null
br i1 %.tmp3858, label %.for.continue.3854, label %.for.end.3854
.for.continue.3854:
%.tmp3859 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3860 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3861 = icmp ne %m307$.Node.type* %.tmp3859, %.tmp3860
br i1 %.tmp3861, label %.if.true.3862, label %.if.false.3862
.if.true.3862:
%.tmp3863 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3864 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3863, i32 0, i32 7
%.tmp3865 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3864
store %m307$.Node.type* %.tmp3865, %m307$.Node.type** %param_ptr.3856
br label %.if.end.3862
.if.false.3862:
br label %.if.end.3862
.if.end.3862:
%.tmp3866 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3867 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3866)
%param_info.3868 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3867, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3869 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3870 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3869, i32 0, i32 2
%.tmp3872 = getelementptr [9 x i8], [9 x i8]*@.str3871, i32 0, i32 0
store i8* %.tmp3872, i8** %.tmp3870
%.tmp3873 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3874 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3873, i32 0, i32 0
%.tmp3875 = load i8*, i8** %.tmp3874
%.tmp3877 = getelementptr [5 x i8], [5 x i8]*@.str3876, i32 0, i32 0
%.tmp3878 = call i32(i8*,i8*) @strcmp(i8* %.tmp3875, i8* %.tmp3877)
%.tmp3879 = icmp eq i32 %.tmp3878, 0
br i1 %.tmp3879, label %.if.true.3880, label %.if.false.3880
.if.true.3880:
%.tmp3881 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3882 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3883 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3882, i32 0, i32 6
%.tmp3884 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3883
%.tmp3885 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3881, %m307$.Node.type* %.tmp3884)
store %m1861$.Type.type* %.tmp3885, %m1861$.Type.type** %param_type.3853
%.tmp3886 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3887 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3886, i32 0, i32 7
%.tmp3888 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3887
store %m307$.Node.type* %.tmp3888, %m307$.Node.type** %param_ptr.3856
br label %.if.end.3880
.if.false.3880:
br label %.if.end.3880
.if.end.3880:
%.tmp3889 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3890 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3889, i32 0, i32 3
%.tmp3891 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3853
store %m1861$.Type.type* %.tmp3891, %m1861$.Type.type** %.tmp3890
%.tmp3892 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3893 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3892, i32 0, i32 1
%.tmp3894 = load i8*, i8** %.tmp3893
%var_name.3895 = alloca i8*
store i8* %.tmp3894, i8** %var_name.3895
%.tmp3896 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3897 = load i8, i8* @SCOPE_LOCAL
%.tmp3898 = load i8*, i8** %var_name.3895
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3896, i8 %.tmp3897, i8* %.tmp3898)
%.tmp3899 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3900 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3901 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3900, i32 0, i32 3
%.tmp3902 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3901
%.tmp3903 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3899, %m1861$.Type.type* %.tmp3902)
%param_info_tr.3904 = alloca i8*
store i8* %.tmp3903, i8** %param_info_tr.3904
%.tmp3905 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3906 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3905, i32 0, i32 1
%.tmp3907 = load %m0$.File.type*, %m0$.File.type** %.tmp3906
%.tmp3909 = getelementptr [16 x i8], [16 x i8]*@.str3908, i32 0, i32 0
%.tmp3910 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3911 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3910)
%.tmp3912 = load i8*, i8** %param_info_tr.3904
%.tmp3913 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3907, i8* %.tmp3909, i8* %.tmp3911, i8* %.tmp3912)
%.tmp3914 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3915 = load i8*, i8** %var_name.3895
%.tmp3916 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3914, i8* %.tmp3915, %m1861$.AssignableInfo.type* %.tmp3916)
%.tmp3917 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3918 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3917, i32 0, i32 1
%.tmp3919 = load %m0$.File.type*, %m0$.File.type** %.tmp3918
%.tmp3921 = getelementptr [28 x i8], [28 x i8]*@.str3920, i32 0, i32 0
%.tmp3922 = load i8*, i8** %param_info_tr.3904
%.tmp3923 = load i8*, i8** %var_name.3895
%.tmp3924 = load i8*, i8** %param_info_tr.3904
%.tmp3925 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3868
%.tmp3926 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3925)
%.tmp3927 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3919, i8* %.tmp3921, i8* %.tmp3922, i8* %.tmp3923, i8* %.tmp3924, i8* %.tmp3926)
%.tmp3928 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3856
%.tmp3929 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3928, i32 0, i32 7
%.tmp3930 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3929
store %m307$.Node.type* %.tmp3930, %m307$.Node.type** %param_ptr.3856
br label %.for.start.3854
.for.end.3854:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3931 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3933 = getelementptr [6 x i8], [6 x i8]*@.str3932, i32 0, i32 0
%.tmp3934 = bitcast ptr null to i8*
%.tmp3935 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3931, i8* %.tmp3933, i8* %.tmp3934, i8* %.tmp3935)
%.tmp3937 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3938 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3937, i32 0, i32 6
%.tmp3939 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3938
%b.3940 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3939, %m307$.Node.type** %b.3940
br label %.for.start.3936
.for.start.3936:
%.tmp3941 = load %m307$.Node.type*, %m307$.Node.type** %b.3940
%.tmp3942 = icmp ne %m307$.Node.type* %.tmp3941, null
br i1 %.tmp3942, label %.for.continue.3936, label %.for.end.3936
.for.continue.3936:
%.tmp3943 = load %m307$.Node.type*, %m307$.Node.type** %b.3940
%.tmp3944 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3943, i32 0, i32 0
%.tmp3945 = load i8*, i8** %.tmp3944
%.tmp3947 = getelementptr [11 x i8], [11 x i8]*@.str3946, i32 0, i32 0
%.tmp3948 = call i32(i8*,i8*) @strcmp(i8* %.tmp3945, i8* %.tmp3947)
%.tmp3949 = icmp eq i32 %.tmp3948, 0
br i1 %.tmp3949, label %.if.true.3950, label %.if.false.3950
.if.true.3950:
%.tmp3951 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3952 = load %m307$.Node.type*, %m307$.Node.type** %b.3940
%.tmp3953 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3952, i32 0, i32 6
%.tmp3954 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3953
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3951, %m307$.Node.type* %.tmp3954)
br label %.if.end.3950
.if.false.3950:
br label %.if.end.3950
.if.end.3950:
%.tmp3955 = load %m307$.Node.type*, %m307$.Node.type** %b.3940
%.tmp3956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3955, i32 0, i32 7
%.tmp3957 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3956
store %m307$.Node.type* %.tmp3957, %m307$.Node.type** %b.3940
br label %.for.start.3936
.for.end.3936:
%.tmp3958 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3958)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3959 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3960 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3959, i32 0, i32 6
%.tmp3961 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3960
%.tmp3962 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3961, i32 0, i32 6
%.tmp3963 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3962
%dotted.3964 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3963, %m307$.Node.type** %dotted.3964
%.tmp3965 = load %m307$.Node.type*, %m307$.Node.type** %dotted.3964
%.tmp3966 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3965, i32 0, i32 7
%.tmp3967 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3966
%.tmp3968 = icmp ne %m307$.Node.type* %.tmp3967, null
br i1 %.tmp3968, label %.if.true.3969, label %.if.false.3969
.if.true.3969:
%.tmp3970 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp3970
br label %.if.end.3969
.if.false.3969:
br label %.if.end.3969
.if.end.3969:
%.tmp3971 = load %m307$.Node.type*, %m307$.Node.type** %dotted.3964
%.tmp3972 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3971, i32 0, i32 1
%.tmp3973 = load i8*, i8** %.tmp3972
%.tmp3975 = getelementptr [7 x i8], [7 x i8]*@.str3974, i32 0, i32 0
%.tmp3976 = call i32(i8*,i8*) @strcmp(i8* %.tmp3973, i8* %.tmp3975)
%.tmp3977 = icmp eq i32 %.tmp3976, 0
br i1 %.tmp3977, label %.if.true.3978, label %.if.false.3978
.if.true.3978:
%.tmp3979 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3981 = getelementptr [8 x i8], [8 x i8]*@.str3980, i32 0, i32 0
%.tmp3982 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3979, i8* %.tmp3981)
%args.3983 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3982, %m307$.Node.type** %args.3983
%.tmp3984 = load %m307$.Node.type*, %m307$.Node.type** %args.3983
%.tmp3985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3984, i32 0, i32 6
%.tmp3986 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3985
%.tmp3988 = getelementptr [11 x i8], [11 x i8]*@.str3987, i32 0, i32 0
%.tmp3989 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3986, i8* %.tmp3988)
%value.3990 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3989, %m307$.Node.type** %value.3990
%.tmp3991 = load %m307$.Node.type*, %m307$.Node.type** %value.3990
%.tmp3992 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3991, i32 0, i32 6
%.tmp3993 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3992
%.tmp3994 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3993, i32 0, i32 6
%.tmp3995 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3994
%.tmp3996 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3995, i32 0, i32 6
%.tmp3997 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3996
%.tmp3998 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3997, i32 0, i32 6
%.tmp3999 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3998
store %m307$.Node.type* %.tmp3999, %m307$.Node.type** %value.3990
%.tmp4000 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4001 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4000)
%tmp_id.4002 = alloca i32
store i32 %.tmp4001, i32* %tmp_id.4002
%.tmp4003 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4004 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4003)
%info.4005 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4004, %m1861$.AssignableInfo.type** %info.4005
%.tmp4006 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4007 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4005
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4006, %m1861$.AssignableInfo.type* %.tmp4007)
%.tmp4008 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4005
%.tmp4009 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4008, i32 0, i32 3
%.tmp4010 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4010, %m1861$.Type.type** %.tmp4009
%.tmp4011 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4005
%.tmp4012 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4011, i32 0, i32 3
%.tmp4013 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4012
%.tmp4014 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4013, i32 0, i32 0
%.tmp4016 = getelementptr [4 x i8], [4 x i8]*@.str4015, i32 0, i32 0
store i8* %.tmp4016, i8** %.tmp4014
%.tmp4017 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4018 = load %m307$.Node.type*, %m307$.Node.type** %value.3990
%.tmp4019 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4017, %m307$.Node.type* %.tmp4018)
%inspected_type.4020 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4019, %m1861$.Type.type** %inspected_type.4020
%.tmp4021 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4022 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4020
%.tmp4023 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4021, %m1861$.Type.type* %.tmp4022)
%type_as_str.4024 = alloca i8*
store i8* %.tmp4023, i8** %type_as_str.4024
%.tmp4025 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4026 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4025, i32 0, i32 1
%.tmp4027 = load %m0$.File.type*, %m0$.File.type** %.tmp4026
%.tmp4029 = getelementptr [46 x i8], [46 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = load i32, i32* %tmp_id.4002
%.tmp4031 = load i8*, i8** %type_as_str.4024
%.tmp4032 = load i8*, i8** %type_as_str.4024
%.tmp4033 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4027, i8* %.tmp4029, i32 %.tmp4030, i8* %.tmp4031, i8* %.tmp4032)
%.tmp4034 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4035 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4034, i32 0, i32 1
%.tmp4036 = load %m0$.File.type*, %m0$.File.type** %.tmp4035
%.tmp4038 = getelementptr [35 x i8], [35 x i8]*@.str4037, i32 0, i32 0
%.tmp4039 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4005
%.tmp4040 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4039)
%.tmp4041 = load i8*, i8** %type_as_str.4024
%.tmp4042 = load i32, i32* %tmp_id.4002
%.tmp4043 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4036, i8* %.tmp4038, i8* %.tmp4040, i8* %.tmp4041, i32 %.tmp4042)
%.tmp4044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4005
ret %m1861$.AssignableInfo.type* %.tmp4044
br label %.if.end.3978
.if.false.3978:
br label %.if.end.3978
.if.end.3978:
%.tmp4045 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4045
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4046 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4047 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4048 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4046, %m307$.Node.type* %.tmp4047)
%info.4049 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4048, %m1861$.AssignableInfo.type** %info.4049
%.tmp4050 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4051 = icmp ne %m1861$.AssignableInfo.type* %.tmp4050, null
br i1 %.tmp4051, label %.if.true.4052, label %.if.false.4052
.if.true.4052:
%.tmp4053 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
ret %m1861$.AssignableInfo.type* %.tmp4053
br label %.if.end.4052
.if.false.4052:
br label %.if.end.4052
.if.end.4052:
%.tmp4054 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4055 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4056 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4054, %m307$.Node.type* %.tmp4055)
store %m1861$.AssignableInfo.type* %.tmp4056, %m1861$.AssignableInfo.type** %info.4049
%.tmp4057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4058 = icmp eq %m1861$.AssignableInfo.type* %.tmp4057, null
br i1 %.tmp4058, label %.if.true.4059, label %.if.false.4059
.if.true.4059:
%.tmp4060 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4060, label %.if.true.4061, label %.if.false.4061
.if.true.4061:
%.tmp4062 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4063 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4065 = getelementptr [35 x i8], [35 x i8]*@.str4064, i32 0, i32 0
%.tmp4066 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4062, %m307$.Node.type* %.tmp4063, i8* %.tmp4065)
%.tmp4067 = call i32(i8*,...) @printf(i8* %.tmp4066)
br label %.if.end.4061
.if.false.4061:
br label %.if.end.4061
.if.end.4061:
%.tmp4068 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4068
br label %.if.end.4059
.if.false.4059:
br label %.if.end.4059
.if.end.4059:
%.tmp4069 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4071 = getelementptr [8 x i8], [8 x i8]*@.str4070, i32 0, i32 0
%.tmp4072 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4069, i8* %.tmp4071)
%args.4073 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4072, %m307$.Node.type** %args.4073
%.tmp4075 = getelementptr [1 x i8], [1 x i8]*@.str4074, i32 0, i32 0
%params_buff.4076 = alloca i8*
store i8* %.tmp4075, i8** %params_buff.4076
%tmp.4077 = alloca i8*
store i8* null, i8** %tmp.4077
%.tmp4078 = load %m307$.Node.type*, %m307$.Node.type** %args.4073
%.tmp4079 = icmp ne %m307$.Node.type* %.tmp4078, null
br i1 %.tmp4079, label %.if.true.4080, label %.if.false.4080
.if.true.4080:
%.tmp4081 = load %m307$.Node.type*, %m307$.Node.type** %args.4073
%.tmp4082 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4081, i32 0, i32 6
%.tmp4083 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4082
%.tmp4085 = getelementptr [11 x i8], [11 x i8]*@.str4084, i32 0, i32 0
%.tmp4086 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4083, i8* %.tmp4085)
%start.4087 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4086, %m307$.Node.type** %start.4087
%.tmp4089 = load %m307$.Node.type*, %m307$.Node.type** %start.4087
%pp.4090 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4089, %m307$.Node.type** %pp.4090
br label %.for.start.4088
.for.start.4088:
%.tmp4091 = load %m307$.Node.type*, %m307$.Node.type** %pp.4090
%.tmp4092 = icmp ne %m307$.Node.type* %.tmp4091, null
br i1 %.tmp4092, label %.for.continue.4088, label %.for.end.4088
.for.continue.4088:
%.tmp4093 = load %m307$.Node.type*, %m307$.Node.type** %pp.4090
%.tmp4094 = load %m307$.Node.type*, %m307$.Node.type** %start.4087
%.tmp4095 = icmp ne %m307$.Node.type* %.tmp4093, %.tmp4094
br i1 %.tmp4095, label %.if.true.4096, label %.if.false.4096
.if.true.4096:
%.tmp4097 = getelementptr i8*, i8** %tmp.4077, i32 0
%.tmp4099 = getelementptr [5 x i8], [5 x i8]*@.str4098, i32 0, i32 0
%.tmp4100 = load i8*, i8** %params_buff.4076
%.tmp4101 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4097, i8* %.tmp4099, i8* %.tmp4100)
%.tmp4102 = load i8*, i8** %params_buff.4076
%tmp_buff.4103 = alloca i8*
store i8* %.tmp4102, i8** %tmp_buff.4103
%.tmp4104 = load i8*, i8** %tmp.4077
store i8* %.tmp4104, i8** %params_buff.4076
%.tmp4105 = load i8*, i8** %tmp_buff.4103
store i8* %.tmp4105, i8** %tmp.4077
%.tmp4106 = load i8*, i8** %tmp.4077
call void(i8*) @free(i8* %.tmp4106)
br label %.if.end.4096
.if.false.4096:
br label %.if.end.4096
.if.end.4096:
%.tmp4107 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4108 = load %m307$.Node.type*, %m307$.Node.type** %pp.4090
%.tmp4109 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4107, %m307$.Node.type* %.tmp4108)
%a_info.4110 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4109, %m1861$.AssignableInfo.type** %a_info.4110
%.tmp4111 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4110
%.tmp4112 = icmp eq %m1861$.AssignableInfo.type* %.tmp4111, null
br i1 %.tmp4112, label %.if.true.4113, label %.if.false.4113
.if.true.4113:
%.tmp4114 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4114
br label %.if.end.4113
.if.false.4113:
br label %.if.end.4113
.if.end.4113:
%.tmp4115 = getelementptr i8*, i8** %params_buff.4076, i32 0
%.tmp4117 = getelementptr [8 x i8], [8 x i8]*@.str4116, i32 0, i32 0
%.tmp4118 = load i8*, i8** %params_buff.4076
%.tmp4119 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4120 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4110
%.tmp4121 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4120, i32 0, i32 3
%.tmp4122 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4121
%.tmp4123 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4119, %m1861$.Type.type* %.tmp4122)
%.tmp4124 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4110
%.tmp4125 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4124)
%.tmp4126 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4115, i8* %.tmp4117, i8* %.tmp4118, i8* %.tmp4123, i8* %.tmp4125)
%.tmp4127 = load %m307$.Node.type*, %m307$.Node.type** %pp.4090
%.tmp4128 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4127, i32 0, i32 7
%.tmp4129 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4128
store %m307$.Node.type* %.tmp4129, %m307$.Node.type** %pp.4090
%.tmp4130 = load %m307$.Node.type*, %m307$.Node.type** %pp.4090
%.tmp4132 = getelementptr [11 x i8], [11 x i8]*@.str4131, i32 0, i32 0
%.tmp4133 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4130, i8* %.tmp4132)
store %m307$.Node.type* %.tmp4133, %m307$.Node.type** %pp.4090
br label %.for.start.4088
.for.end.4088:
br label %.if.end.4080
.if.false.4080:
br label %.if.end.4080
.if.end.4080:
%.tmp4134 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4135 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4136 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4135, i32 0, i32 3
%.tmp4137 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4136
%.tmp4138 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4137, i32 0, i32 3
%.tmp4139 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4138
%.tmp4140 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4134, %m1861$.Type.type* %.tmp4139)
%.tmp4142 = getelementptr [5 x i8], [5 x i8]*@.str4141, i32 0, i32 0
%.tmp4143 = call i32(i8*,i8*) @strcmp(i8* %.tmp4140, i8* %.tmp4142)
%.tmp4144 = icmp eq i32 %.tmp4143, 0
br i1 %.tmp4144, label %.if.true.4145, label %.if.false.4145
.if.true.4145:
%.tmp4146 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4147 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4146, i32 0, i32 1
%.tmp4148 = load %m0$.File.type*, %m0$.File.type** %.tmp4147
%.tmp4150 = getelementptr [16 x i8], [16 x i8]*@.str4149, i32 0, i32 0
%.tmp4151 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4152 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4153 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4152, i32 0, i32 3
%.tmp4154 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4153
%.tmp4155 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4151, %m1861$.Type.type* %.tmp4154)
%.tmp4156 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4157 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4156)
%.tmp4158 = load i8*, i8** %params_buff.4076
%.tmp4159 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4148, i8* %.tmp4150, i8* %.tmp4155, i8* %.tmp4157, i8* %.tmp4158)
%.tmp4160 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4160
br label %.if.end.4145
.if.false.4145:
br label %.if.end.4145
.if.end.4145:
%.tmp4161 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4162 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4161)
%call_info.4163 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4162, %m1861$.AssignableInfo.type** %call_info.4163
%.tmp4164 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4165 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4163
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4164, %m1861$.AssignableInfo.type* %.tmp4165)
%.tmp4166 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4163
%.tmp4167 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4166, i32 0, i32 3
%.tmp4168 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4169 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4168, i32 0, i32 3
%.tmp4170 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4169
%.tmp4171 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4170, i32 0, i32 3
%.tmp4172 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4171
%.tmp4173 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4172)
store %m1861$.Type.type* %.tmp4173, %m1861$.Type.type** %.tmp4167
%.tmp4174 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4163
%.tmp4175 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4174, i32 0, i32 3
%.tmp4176 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4175
%.tmp4177 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4176, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4177
%.tmp4178 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4179 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4178, i32 0, i32 1
%.tmp4180 = load %m0$.File.type*, %m0$.File.type** %.tmp4179
%.tmp4182 = getelementptr [21 x i8], [21 x i8]*@.str4181, i32 0, i32 0
%.tmp4183 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4163
%.tmp4184 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4183)
%.tmp4185 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4186 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4187 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4186, i32 0, i32 3
%.tmp4188 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4187
%.tmp4189 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4185, %m1861$.Type.type* %.tmp4188)
%.tmp4190 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4049
%.tmp4191 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4190)
%.tmp4192 = load i8*, i8** %params_buff.4076
%.tmp4193 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4180, i8* %.tmp4182, i8* %.tmp4184, i8* %.tmp4189, i8* %.tmp4191, i8* %.tmp4192)
%.tmp4194 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4163
%.tmp4195 = bitcast %m1861$.AssignableInfo.type* %.tmp4194 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4195
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4196 = alloca i8*
store i8* null, i8** %err_msg.4196
%.tmp4197 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4198 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4197, i32 0, i32 0
%.tmp4199 = load i8*, i8** %.tmp4198
%expr_type.4200 = alloca i8*
store i8* %.tmp4199, i8** %expr_type.4200
%.tmp4201 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4202 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4201, %m1861$.AssignableInfo.type** %info.4202
%assignable.4203 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4203
%.tmp4204 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4205 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4204, %m1861$.AssignableInfo.type** %a_info.4205
%.tmp4206 = load i8*, i8** %expr_type.4200
%.tmp4208 = getelementptr [7 x i8], [7 x i8]*@.str4207, i32 0, i32 0
%.tmp4209 = call i32(i8*,i8*) @strcmp(i8* %.tmp4206, i8* %.tmp4208)
%.tmp4210 = icmp eq i32 %.tmp4209, 0
br i1 %.tmp4210, label %.if.true.4211, label %.if.false.4211
.if.true.4211:
%.tmp4212 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4213 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4212, i32 0, i32 6
%.tmp4214 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4213
%.tmp4215 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4214, i32 0, i32 7
%.tmp4216 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4215
%.tmp4217 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4216, i32 0, i32 0
%.tmp4218 = load i8*, i8** %.tmp4217
%.tmp4220 = getelementptr [3 x i8], [3 x i8]*@.str4219, i32 0, i32 0
%.tmp4221 = call i32(i8*,i8*) @strcmp(i8* %.tmp4218, i8* %.tmp4220)
%.tmp4222 = icmp ne i32 %.tmp4221, 0
br i1 %.tmp4222, label %.if.true.4223, label %.if.false.4223
.if.true.4223:
%.tmp4224 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4225 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4226 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4225, i32 0, i32 6
%.tmp4227 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4226
%.tmp4228 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4227, i32 0, i32 7
%.tmp4229 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4228
%.tmp4230 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4224, %m307$.Node.type* %.tmp4229)
store %m1861$.AssignableInfo.type* %.tmp4230, %m1861$.AssignableInfo.type** %info.4202
%.tmp4231 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
%.tmp4232 = icmp eq %m1861$.AssignableInfo.type* %.tmp4231, null
br i1 %.tmp4232, label %.if.true.4233, label %.if.false.4233
.if.true.4233:
ret void
br label %.if.end.4233
.if.false.4233:
br label %.if.end.4233
.if.end.4233:
%.tmp4234 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4235 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4234, i32 0, i32 1
%.tmp4236 = load %m0$.File.type*, %m0$.File.type** %.tmp4235
%.tmp4238 = getelementptr [11 x i8], [11 x i8]*@.str4237, i32 0, i32 0
%.tmp4239 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4240 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
%.tmp4241 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4240, i32 0, i32 3
%.tmp4242 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4241
%.tmp4243 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4239, %m1861$.Type.type* %.tmp4242)
%.tmp4244 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
%.tmp4245 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4244)
%.tmp4246 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4236, i8* %.tmp4238, i8* %.tmp4243, i8* %.tmp4245)
br label %.if.end.4223
.if.false.4223:
%.tmp4247 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4248 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4247, i32 0, i32 1
%.tmp4249 = load %m0$.File.type*, %m0$.File.type** %.tmp4248
%.tmp4251 = getelementptr [10 x i8], [10 x i8]*@.str4250, i32 0, i32 0
%.tmp4252 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4249, i8* %.tmp4251)
br label %.if.end.4223
.if.end.4223:
br label %.if.end.4211
.if.false.4211:
%.tmp4253 = load i8*, i8** %expr_type.4200
%.tmp4255 = getelementptr [3 x i8], [3 x i8]*@.str4254, i32 0, i32 0
%.tmp4256 = call i32(i8*,i8*) @strcmp(i8* %.tmp4253, i8* %.tmp4255)
%.tmp4257 = icmp eq i32 %.tmp4256, 0
br i1 %.tmp4257, label %.if.true.4258, label %.if.false.4258
.if.true.4258:
br label %.if.end.4258
.if.false.4258:
%.tmp4259 = load i8*, i8** %expr_type.4200
%.tmp4261 = getelementptr [8 x i8], [8 x i8]*@.str4260, i32 0, i32 0
%.tmp4262 = call i32(i8*,i8*) @strcmp(i8* %.tmp4259, i8* %.tmp4261)
%.tmp4263 = icmp eq i32 %.tmp4262, 0
br i1 %.tmp4263, label %.if.true.4264, label %.if.false.4264
.if.true.4264:
%.tmp4265 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4266 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4267 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4266, i32 0, i32 6
%.tmp4268 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4267
%.tmp4269 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4265, %m307$.Node.type* %.tmp4268)
br label %.if.end.4264
.if.false.4264:
%.tmp4270 = load i8*, i8** %expr_type.4200
%.tmp4272 = getelementptr [12 x i8], [12 x i8]*@.str4271, i32 0, i32 0
%.tmp4273 = call i32(i8*,i8*) @strcmp(i8* %.tmp4270, i8* %.tmp4272)
%.tmp4274 = icmp eq i32 %.tmp4273, 0
br i1 %.tmp4274, label %.if.true.4275, label %.if.false.4275
.if.true.4275:
%.tmp4276 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4277 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4278 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4276, %m307$.Node.type* %.tmp4277)
br label %.if.end.4275
.if.false.4275:
%.tmp4279 = load i8*, i8** %expr_type.4200
%.tmp4281 = getelementptr [11 x i8], [11 x i8]*@.str4280, i32 0, i32 0
%.tmp4282 = call i32(i8*,i8*) @strcmp(i8* %.tmp4279, i8* %.tmp4281)
%.tmp4283 = icmp eq i32 %.tmp4282, 0
br i1 %.tmp4283, label %.if.true.4284, label %.if.false.4284
.if.true.4284:
%.tmp4285 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4286 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4285, i32 0, i32 6
%.tmp4287 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4286
%.tmp4289 = getelementptr [11 x i8], [11 x i8]*@.str4288, i32 0, i32 0
%.tmp4290 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4287, i8* %.tmp4289)
store %m307$.Node.type* %.tmp4290, %m307$.Node.type** %assignable.4203
%.tmp4291 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4292 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4293 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4292, i32 0, i32 6
%.tmp4294 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4293
%.tmp4295 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4291, %m307$.Node.type* %.tmp4294)
%dest.4296 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4295, %m1861$.AssignableInfo.type** %dest.4296
%.tmp4297 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4296
%.tmp4298 = icmp eq %m1861$.AssignableInfo.type* %.tmp4297, null
br i1 %.tmp4298, label %.if.true.4299, label %.if.false.4299
.if.true.4299:
ret void
br label %.if.end.4299
.if.false.4299:
br label %.if.end.4299
.if.end.4299:
%.tmp4300 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4301 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4203
%.tmp4302 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4300, %m307$.Node.type* %.tmp4301)
store %m1861$.AssignableInfo.type* %.tmp4302, %m1861$.AssignableInfo.type** %a_info.4205
%.tmp4303 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4205
%.tmp4304 = icmp eq %m1861$.AssignableInfo.type* %.tmp4303, null
br i1 %.tmp4304, label %.if.true.4305, label %.if.false.4305
.if.true.4305:
ret void
br label %.if.end.4305
.if.false.4305:
br label %.if.end.4305
.if.end.4305:
%.tmp4306 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4307 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4296
%.tmp4308 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4307, i32 0, i32 3
%.tmp4309 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4308
%.tmp4310 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4306, %m1861$.Type.type* %.tmp4309)
%dest_tr.4311 = alloca i8*
store i8* %.tmp4310, i8** %dest_tr.4311
%.tmp4312 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4313 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4205
%.tmp4314 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4313, i32 0, i32 3
%.tmp4315 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4314
%.tmp4316 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4312, %m1861$.Type.type* %.tmp4315)
%src_tr.4317 = alloca i8*
store i8* %.tmp4316, i8** %src_tr.4317
%.tmp4318 = load i8*, i8** %src_tr.4317
%.tmp4320 = getelementptr [4 x i8], [4 x i8]*@.str4319, i32 0, i32 0
%.tmp4321 = call i32(i8*,i8*) @strcmp(i8* %.tmp4318, i8* %.tmp4320)
%.tmp4322 = icmp eq i32 %.tmp4321, 0
br i1 %.tmp4322, label %.if.true.4323, label %.if.false.4323
.if.true.4323:
%.tmp4324 = load i8*, i8** %dest_tr.4311
store i8* %.tmp4324, i8** %src_tr.4317
br label %.if.end.4323
.if.false.4323:
br label %.if.end.4323
.if.end.4323:
%.tmp4325 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4326 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4325, i32 0, i32 1
%.tmp4327 = load %m0$.File.type*, %m0$.File.type** %.tmp4326
%.tmp4329 = getelementptr [21 x i8], [21 x i8]*@.str4328, i32 0, i32 0
%.tmp4330 = load i8*, i8** %src_tr.4317
%.tmp4331 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4205
%.tmp4332 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4331)
%.tmp4333 = load i8*, i8** %dest_tr.4311
%.tmp4334 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4296
%.tmp4335 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4334)
%.tmp4336 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4327, i8* %.tmp4329, i8* %.tmp4330, i8* %.tmp4332, i8* %.tmp4333, i8* %.tmp4335)
br label %.if.end.4284
.if.false.4284:
%.tmp4337 = load i8*, i8** %expr_type.4200
%.tmp4339 = getelementptr [9 x i8], [9 x i8]*@.str4338, i32 0, i32 0
%.tmp4340 = call i32(i8*,i8*) @strcmp(i8* %.tmp4337, i8* %.tmp4339)
%.tmp4341 = icmp eq i32 %.tmp4340, 0
br i1 %.tmp4341, label %.if.true.4342, label %.if.false.4342
.if.true.4342:
%.tmp4343 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4344 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4343, %m307$.Node.type* %.tmp4344)
br label %.if.end.4342
.if.false.4342:
%.tmp4345 = load i8*, i8** %expr_type.4200
%.tmp4347 = getelementptr [9 x i8], [9 x i8]*@.str4346, i32 0, i32 0
%.tmp4348 = call i32(i8*,i8*) @strcmp(i8* %.tmp4345, i8* %.tmp4347)
%.tmp4349 = icmp eq i32 %.tmp4348, 0
br i1 %.tmp4349, label %.if.true.4350, label %.if.false.4350
.if.true.4350:
%.tmp4351 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4352 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4351, %m307$.Node.type* %.tmp4352)
br label %.if.end.4350
.if.false.4350:
%.tmp4353 = load i8*, i8** %expr_type.4200
%.tmp4355 = getelementptr [8 x i8], [8 x i8]*@.str4354, i32 0, i32 0
%.tmp4356 = call i32(i8*,i8*) @strcmp(i8* %.tmp4353, i8* %.tmp4355)
%.tmp4357 = icmp eq i32 %.tmp4356, 0
br i1 %.tmp4357, label %.if.true.4358, label %.if.false.4358
.if.true.4358:
%.tmp4359 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4360 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4359)
%mod.4361 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4360, %m1861$.ModuleLookup.type** %mod.4361
%found.4362 = alloca i1
store i1 0, i1* %found.4362
%.tmp4363 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4361
%.tmp4364 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4363, i32 0, i32 3
%.tmp4365 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4364
%s.4366 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4365, %m1861$.Scope.type** %s.4366
%.tmp4367 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4368 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4367, i32 0, i32 6
%.tmp4369 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4368
%.tmp4370 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4369, i32 0, i32 1
%.tmp4371 = load i8*, i8** %.tmp4370
%.tmp4373 = getelementptr [6 x i8], [6 x i8]*@.str4372, i32 0, i32 0
%.tmp4374 = call i32(i8*,i8*) @strcmp(i8* %.tmp4371, i8* %.tmp4373)
%.tmp4375 = icmp eq i32 %.tmp4374, 0
br i1 %.tmp4375, label %.if.true.4376, label %.if.false.4376
.if.true.4376:
br label %.for.start.4377
.for.start.4377:
%.tmp4378 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4379 = icmp ne %m1861$.Scope.type* %.tmp4378, null
%.tmp4380 = load i1, i1* %found.4362
%.tmp4381 = icmp eq i1 %.tmp4380, 0
%.tmp4382 = and i1 %.tmp4379, %.tmp4381
br i1 %.tmp4382, label %.for.continue.4377, label %.for.end.4377
.for.continue.4377:
%.tmp4383 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4384 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4383, i32 0, i32 2
%.tmp4385 = load i8*, i8** %.tmp4384
%.tmp4387 = getelementptr [4 x i8], [4 x i8]*@.str4386, i32 0, i32 0
%.tmp4388 = call i32(i8*,i8*) @strcmp(i8* %.tmp4385, i8* %.tmp4387)
%.tmp4389 = icmp eq i32 %.tmp4388, 0
br i1 %.tmp4389, label %.if.true.4390, label %.if.false.4390
.if.true.4390:
store i1 1, i1* %found.4362
%.tmp4391 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4392 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4391, i32 0, i32 1
%.tmp4393 = load %m0$.File.type*, %m0$.File.type** %.tmp4392
%.tmp4395 = getelementptr [15 x i8], [15 x i8]*@.str4394, i32 0, i32 0
%.tmp4396 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4397 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4396, i32 0, i32 4
%.tmp4398 = load i8*, i8** %.tmp4397
%.tmp4399 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4393, i8* %.tmp4395, i8* %.tmp4398)
br label %.if.end.4390
.if.false.4390:
br label %.if.end.4390
.if.end.4390:
%.tmp4400 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4401 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4400, i32 0, i32 5
%.tmp4402 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4401
store %m1861$.Scope.type* %.tmp4402, %m1861$.Scope.type** %s.4366
br label %.for.start.4377
.for.end.4377:
%.tmp4403 = load i1, i1* %found.4362
%.tmp4404 = icmp eq i1 %.tmp4403, 0
br i1 %.tmp4404, label %.if.true.4405, label %.if.false.4405
.if.true.4405:
%.tmp4406 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4407 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4409 = getelementptr [48 x i8], [48 x i8]*@.str4408, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4406, %m307$.Node.type* %.tmp4407, i8* %.tmp4409)
br label %.if.end.4405
.if.false.4405:
br label %.if.end.4405
.if.end.4405:
br label %.if.end.4376
.if.false.4376:
%.tmp4410 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4411 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4410, i32 0, i32 6
%.tmp4412 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4411
%.tmp4413 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4412, i32 0, i32 1
%.tmp4414 = load i8*, i8** %.tmp4413
%.tmp4416 = getelementptr [9 x i8], [9 x i8]*@.str4415, i32 0, i32 0
%.tmp4417 = call i32(i8*,i8*) @strcmp(i8* %.tmp4414, i8* %.tmp4416)
%.tmp4418 = icmp eq i32 %.tmp4417, 0
br i1 %.tmp4418, label %.if.true.4419, label %.if.false.4419
.if.true.4419:
br label %.for.start.4420
.for.start.4420:
%.tmp4421 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4422 = icmp ne %m1861$.Scope.type* %.tmp4421, null
%.tmp4423 = load i1, i1* %found.4362
%.tmp4424 = icmp eq i1 %.tmp4423, 0
%.tmp4425 = and i1 %.tmp4422, %.tmp4424
br i1 %.tmp4425, label %.for.continue.4420, label %.for.end.4420
.for.continue.4420:
%.tmp4426 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4427 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4426, i32 0, i32 2
%.tmp4428 = load i8*, i8** %.tmp4427
%.tmp4430 = getelementptr [4 x i8], [4 x i8]*@.str4429, i32 0, i32 0
%.tmp4431 = call i32(i8*,i8*) @strcmp(i8* %.tmp4428, i8* %.tmp4430)
%.tmp4432 = icmp eq i32 %.tmp4431, 0
br i1 %.tmp4432, label %.if.true.4433, label %.if.false.4433
.if.true.4433:
store i1 1, i1* %found.4362
%.tmp4434 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4435 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4434, i32 0, i32 1
%.tmp4436 = load %m0$.File.type*, %m0$.File.type** %.tmp4435
%.tmp4438 = getelementptr [15 x i8], [15 x i8]*@.str4437, i32 0, i32 0
%.tmp4439 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4440 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4439, i32 0, i32 3
%.tmp4441 = load i8*, i8** %.tmp4440
%.tmp4442 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4436, i8* %.tmp4438, i8* %.tmp4441)
br label %.if.end.4433
.if.false.4433:
br label %.if.end.4433
.if.end.4433:
%.tmp4443 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4366
%.tmp4444 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4443, i32 0, i32 5
%.tmp4445 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4444
store %m1861$.Scope.type* %.tmp4445, %m1861$.Scope.type** %s.4366
br label %.for.start.4420
.for.end.4420:
%.tmp4446 = load i1, i1* %found.4362
%.tmp4447 = icmp eq i1 %.tmp4446, 0
br i1 %.tmp4447, label %.if.true.4448, label %.if.false.4448
.if.true.4448:
%.tmp4449 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4450 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4452 = getelementptr [48 x i8], [48 x i8]*@.str4451, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4449, %m307$.Node.type* %.tmp4450, i8* %.tmp4452)
br label %.if.end.4448
.if.false.4448:
br label %.if.end.4448
.if.end.4448:
br label %.if.end.4419
.if.false.4419:
%.tmp4453 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4454 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4456 = getelementptr [29 x i8], [29 x i8]*@.str4455, i32 0, i32 0
%.tmp4457 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4453, %m307$.Node.type* %.tmp4454, i8* %.tmp4456)
%.tmp4458 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4459 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4458, i32 0, i32 6
%.tmp4460 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4459
%.tmp4461 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4460, i32 0, i32 1
%.tmp4462 = load i8*, i8** %.tmp4461
%.tmp4463 = call i32(i8*,...) @printf(i8* %.tmp4457, i8* %.tmp4462)
br label %.if.end.4419
.if.end.4419:
br label %.if.end.4376
.if.end.4376:
br label %.if.end.4358
.if.false.4358:
%.tmp4464 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4465 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4467 = getelementptr [34 x i8], [34 x i8]*@.str4466, i32 0, i32 0
%.tmp4468 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4464, %m307$.Node.type* %.tmp4465, i8* %.tmp4467)
%.tmp4469 = load i8*, i8** %expr_type.4200
%.tmp4470 = call i32(i8*,...) @printf(i8* %.tmp4468, i8* %.tmp4469)
br label %.if.end.4358
.if.end.4358:
br label %.if.end.4350
.if.end.4350:
br label %.if.end.4342
.if.end.4342:
br label %.if.end.4284
.if.end.4284:
br label %.if.end.4275
.if.end.4275:
br label %.if.end.4264
.if.end.4264:
br label %.if.end.4258
.if.end.4258:
br label %.if.end.4211
.if.end.4211:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4471 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4472 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4471)
%for_id.4473 = alloca i32
store i32 %.tmp4472, i32* %for_id.4473
%.tmp4474 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4475 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4474, i32 0, i32 6
%.tmp4476 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4475
%.tmp4477 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4476, i32 0, i32 7
%.tmp4478 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4477
%init_stmt.4479 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4478, %m307$.Node.type** %init_stmt.4479
%.tmp4480 = bitcast ptr null to i8*
%begin_lbl.4481 = alloca i8*
store i8* %.tmp4480, i8** %begin_lbl.4481
%.tmp4482 = bitcast ptr null to i8*
%end_lbl.4483 = alloca i8*
store i8* %.tmp4482, i8** %end_lbl.4483
%.tmp4484 = getelementptr i8*, i8** %begin_lbl.4481, i32 0
%.tmp4486 = getelementptr [14 x i8], [14 x i8]*@.str4485, i32 0, i32 0
%.tmp4487 = load i32, i32* %for_id.4473
%.tmp4488 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4484, i8* %.tmp4486, i32 %.tmp4487)
%.tmp4489 = getelementptr i8*, i8** %end_lbl.4483, i32 0
%.tmp4491 = getelementptr [12 x i8], [12 x i8]*@.str4490, i32 0, i32 0
%.tmp4492 = load i32, i32* %for_id.4473
%.tmp4493 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4489, i8* %.tmp4491, i32 %.tmp4492)
%.tmp4494 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4496 = getelementptr [4 x i8], [4 x i8]*@.str4495, i32 0, i32 0
%.tmp4497 = load i8*, i8** %begin_lbl.4481
%.tmp4498 = load i8*, i8** %end_lbl.4483
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp4494, i8* %.tmp4496, i8* %.tmp4497, i8* %.tmp4498)
%.tmp4499 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
%.tmp4500 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4499, i32 0, i32 0
%.tmp4501 = load i8*, i8** %.tmp4500
%.tmp4503 = getelementptr [12 x i8], [12 x i8]*@.str4502, i32 0, i32 0
%.tmp4504 = call i32(i8*,i8*) @strcmp(i8* %.tmp4501, i8* %.tmp4503)
%.tmp4505 = icmp eq i32 %.tmp4504, 0
br i1 %.tmp4505, label %.if.true.4506, label %.if.false.4506
.if.true.4506:
%.tmp4507 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4508 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
%.tmp4509 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4507, %m307$.Node.type* %.tmp4508)
br label %.if.end.4506
.if.false.4506:
%.tmp4510 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
%.tmp4511 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4510, i32 0, i32 0
%.tmp4512 = load i8*, i8** %.tmp4511
%.tmp4514 = getelementptr [11 x i8], [11 x i8]*@.str4513, i32 0, i32 0
%.tmp4515 = call i32(i8*,i8*) @strcmp(i8* %.tmp4512, i8* %.tmp4514)
%.tmp4516 = icmp eq i32 %.tmp4515, 0
br i1 %.tmp4516, label %.if.true.4517, label %.if.false.4517
.if.true.4517:
%.tmp4518 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4519 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4518, %m307$.Node.type* %.tmp4519)
br label %.if.end.4517
.if.false.4517:
%.tmp4520 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
%.tmp4521 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4520, i32 0, i32 0
%.tmp4522 = load i8*, i8** %.tmp4521
%.tmp4524 = getelementptr [9 x i8], [9 x i8]*@.str4523, i32 0, i32 0
%.tmp4525 = call i32(i8*,i8*) @strcmp(i8* %.tmp4522, i8* %.tmp4524)
%.tmp4526 = icmp eq i32 %.tmp4525, 0
br i1 %.tmp4526, label %.if.true.4527, label %.if.false.4527
.if.true.4527:
br label %.if.end.4527
.if.false.4527:
%.tmp4528 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4529 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
%.tmp4531 = getelementptr [66 x i8], [66 x i8]*@.str4530, i32 0, i32 0
%.tmp4532 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4528, %m307$.Node.type* %.tmp4529, i8* %.tmp4531)
%.tmp4533 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4479
%.tmp4534 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4533, i32 0, i32 0
%.tmp4535 = load i8*, i8** %.tmp4534
%.tmp4536 = call i32(i8*,...) @printf(i8* %.tmp4532, i8* %.tmp4535)
%.tmp4537 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4537)
ret void
br label %.if.end.4527
.if.end.4527:
br label %.if.end.4517
.if.end.4517:
br label %.if.end.4506
.if.end.4506:
%.tmp4538 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4539 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4538, i32 0, i32 1
%.tmp4540 = load %m0$.File.type*, %m0$.File.type** %.tmp4539
%.tmp4542 = getelementptr [26 x i8], [26 x i8]*@.str4541, i32 0, i32 0
%.tmp4543 = load i32, i32* %for_id.4473
%.tmp4544 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4540, i8* %.tmp4542, i32 %.tmp4543)
%.tmp4545 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4546 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4545, i32 0, i32 1
%.tmp4547 = load %m0$.File.type*, %m0$.File.type** %.tmp4546
%.tmp4549 = getelementptr [16 x i8], [16 x i8]*@.str4548, i32 0, i32 0
%.tmp4550 = load i32, i32* %for_id.4473
%.tmp4551 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4547, i8* %.tmp4549, i32 %.tmp4550)
%.tmp4552 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4553 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4552, i32 0, i32 6
%.tmp4554 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4553
%.tmp4556 = getelementptr [9 x i8], [9 x i8]*@.str4555, i32 0, i32 0
%.tmp4557 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4554, i8* %.tmp4556)
%fst_colon.4558 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4557, %m307$.Node.type** %fst_colon.4558
%.tmp4559 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4558
%.tmp4560 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4559, i32 0, i32 7
%.tmp4561 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4560
%condition.4562 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4561, %m307$.Node.type** %condition.4562
%.tmp4563 = load %m307$.Node.type*, %m307$.Node.type** %condition.4562
%.tmp4564 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4563, i32 0, i32 0
%.tmp4565 = load i8*, i8** %.tmp4564
%.tmp4567 = getelementptr [9 x i8], [9 x i8]*@.str4566, i32 0, i32 0
%.tmp4568 = call i32(i8*,i8*) @strcmp(i8* %.tmp4565, i8* %.tmp4567)
%.tmp4569 = icmp eq i32 %.tmp4568, 0
br i1 %.tmp4569, label %.if.true.4570, label %.if.false.4570
.if.true.4570:
%.tmp4571 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4572 = load %m307$.Node.type*, %m307$.Node.type** %condition.4562
%.tmp4574 = getelementptr [39 x i8], [39 x i8]*@.str4573, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4571, %m307$.Node.type* %.tmp4572, i8* %.tmp4574)
ret void
br label %.if.end.4570
.if.false.4570:
br label %.if.end.4570
.if.end.4570:
%.tmp4575 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4576 = load %m307$.Node.type*, %m307$.Node.type** %condition.4562
%.tmp4577 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4575, %m307$.Node.type* %.tmp4576)
%condition_info.4578 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4577, %m1861$.AssignableInfo.type** %condition_info.4578
%.tmp4579 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4580 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4579, i32 0, i32 1
%.tmp4581 = load %m0$.File.type*, %m0$.File.type** %.tmp4580
%.tmp4583 = getelementptr [48 x i8], [48 x i8]*@.str4582, i32 0, i32 0
%.tmp4584 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4585 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4578
%.tmp4586 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4585, i32 0, i32 3
%.tmp4587 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4586
%.tmp4588 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4584, %m1861$.Type.type* %.tmp4587)
%.tmp4589 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4578
%.tmp4590 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4589)
%.tmp4591 = load i32, i32* %for_id.4473
%.tmp4592 = load i8*, i8** %end_lbl.4483
%.tmp4593 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4581, i8* %.tmp4583, i8* %.tmp4588, i8* %.tmp4590, i32 %.tmp4591, i8* %.tmp4592)
%.tmp4594 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4595 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4594, i32 0, i32 1
%.tmp4596 = load %m0$.File.type*, %m0$.File.type** %.tmp4595
%.tmp4598 = getelementptr [19 x i8], [19 x i8]*@.str4597, i32 0, i32 0
%.tmp4599 = load i32, i32* %for_id.4473
%.tmp4600 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4596, i8* %.tmp4598, i32 %.tmp4599)
%.tmp4601 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4558
%.tmp4602 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4601, i32 0, i32 7
%.tmp4603 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4602
%.tmp4605 = getelementptr [9 x i8], [9 x i8]*@.str4604, i32 0, i32 0
%.tmp4606 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4603, i8* %.tmp4605)
%snd_colon.4607 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4606, %m307$.Node.type** %snd_colon.4607
%.tmp4608 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4607
%.tmp4609 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4608, i32 0, i32 7
%.tmp4610 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4609
%increment.4611 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4610, %m307$.Node.type** %increment.4611
%.tmp4612 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4607
%.tmp4614 = getelementptr [6 x i8], [6 x i8]*@.str4613, i32 0, i32 0
%.tmp4615 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4612, i8* %.tmp4614)
%for_body.4616 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4615, %m307$.Node.type** %for_body.4616
%.tmp4617 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4618 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4616
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4617, %m307$.Node.type* %.tmp4618)
%.tmp4619 = load %m307$.Node.type*, %m307$.Node.type** %increment.4611
%.tmp4620 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4616
%.tmp4621 = icmp ne %m307$.Node.type* %.tmp4619, %.tmp4620
br i1 %.tmp4621, label %.if.true.4622, label %.if.false.4622
.if.true.4622:
%.tmp4623 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4624 = load %m307$.Node.type*, %m307$.Node.type** %increment.4611
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4623, %m307$.Node.type* %.tmp4624)
br label %.if.end.4622
.if.false.4622:
br label %.if.end.4622
.if.end.4622:
%.tmp4625 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4626 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4625, i32 0, i32 1
%.tmp4627 = load %m0$.File.type*, %m0$.File.type** %.tmp4626
%.tmp4629 = getelementptr [15 x i8], [15 x i8]*@.str4628, i32 0, i32 0
%.tmp4630 = load i8*, i8** %begin_lbl.4481
%.tmp4631 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4627, i8* %.tmp4629, i8* %.tmp4630)
%.tmp4632 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4633 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4632, i32 0, i32 1
%.tmp4634 = load %m0$.File.type*, %m0$.File.type** %.tmp4633
%.tmp4636 = getelementptr [5 x i8], [5 x i8]*@.str4635, i32 0, i32 0
%.tmp4637 = load i8*, i8** %end_lbl.4483
%.tmp4638 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4634, i8* %.tmp4636, i8* %.tmp4637)
%.tmp4639 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4639)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4640 = bitcast ptr null to %m1861$.Type.type*
%decl_type.4641 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4640, %m1861$.Type.type** %decl_type.4641
%.tmp4642 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4643 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4642, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4644 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4645 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4644, i32 0, i32 6
%.tmp4646 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4645
%.tmp4647 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4646, i32 0, i32 0
%.tmp4648 = load i8*, i8** %.tmp4647
%.tmp4650 = getelementptr [5 x i8], [5 x i8]*@.str4649, i32 0, i32 0
%.tmp4651 = call i32(i8*,i8*) @strcmp(i8* %.tmp4648, i8* %.tmp4650)
%.tmp4652 = icmp eq i32 %.tmp4651, 0
br i1 %.tmp4652, label %.if.true.4653, label %.if.false.4653
.if.true.4653:
%.tmp4654 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4655 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4656 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4655, i32 0, i32 6
%.tmp4657 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4656
%.tmp4658 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4657, i32 0, i32 6
%.tmp4659 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4658
%.tmp4660 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4654, %m307$.Node.type* %.tmp4659)
store %m1861$.Type.type* %.tmp4660, %m1861$.Type.type** %decl_type.4641
br label %.if.end.4653
.if.false.4653:
br label %.if.end.4653
.if.end.4653:
%.tmp4661 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4662 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4661, i32 0, i32 6
%.tmp4663 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4662
%.tmp4665 = getelementptr [11 x i8], [11 x i8]*@.str4664, i32 0, i32 0
%.tmp4666 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4663, i8* %.tmp4665)
%assignable.4667 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4666, %m307$.Node.type** %assignable.4667
%.tmp4668 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4667
%.tmp4669 = icmp ne %m307$.Node.type* %.tmp4668, null
br i1 %.tmp4669, label %.if.true.4670, label %.if.false.4670
.if.true.4670:
%.tmp4671 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4672 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4667
%.tmp4673 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4671, %m307$.Node.type* %.tmp4672)
store %m1861$.AssignableInfo.type* %.tmp4673, %m1861$.AssignableInfo.type** %a_info.4643
br label %.if.end.4670
.if.false.4670:
br label %.if.end.4670
.if.end.4670:
%.tmp4674 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4675 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4674)
%info.4676 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4675, %m1861$.AssignableInfo.type** %info.4676
%.tmp4677 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4678 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4677, i32 0, i32 2
%.tmp4680 = getelementptr [9 x i8], [9 x i8]*@.str4679, i32 0, i32 0
store i8* %.tmp4680, i8** %.tmp4678
%.tmp4681 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4682 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4681, i32 0, i32 6
%.tmp4683 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4682
%.tmp4685 = getelementptr [5 x i8], [5 x i8]*@.str4684, i32 0, i32 0
%.tmp4686 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4683, i8* %.tmp4685)
%var_name.4687 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4686, %m307$.Node.type** %var_name.4687
%.tmp4688 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4687
%.tmp4689 = icmp eq %m307$.Node.type* %.tmp4688, null
br i1 %.tmp4689, label %.if.true.4690, label %.if.false.4690
.if.true.4690:
%.tmp4691 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4692 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4694 = getelementptr [31 x i8], [31 x i8]*@.str4693, i32 0, i32 0
%.tmp4695 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4691, %m307$.Node.type* %.tmp4692, i8* %.tmp4694)
%.tmp4696 = call i32(i8*,...) @printf(i8* %.tmp4695)
%.tmp4697 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4697
br label %.if.end.4690
.if.false.4690:
br label %.if.end.4690
.if.end.4690:
%.tmp4698 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4699 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4698)
%mod.4700 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4699, %m1861$.ModuleLookup.type** %mod.4700
%.tmp4701 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4702 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4700
%.tmp4703 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4702, i32 0, i32 3
%.tmp4704 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4703
%.tmp4705 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4687
%.tmp4706 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4705, i32 0, i32 1
%.tmp4707 = load i8*, i8** %.tmp4706
%.tmp4708 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp4701, %m1861$.Scope.type* %.tmp4704, i8* %.tmp4707)
%.tmp4709 = icmp ne %m1861$.ScopeItem.type* %.tmp4708, null
br i1 %.tmp4709, label %.if.true.4710, label %.if.false.4710
.if.true.4710:
%err_buf.4711 = alloca i8*
store i8* null, i8** %err_buf.4711
%.tmp4712 = getelementptr i8*, i8** %err_buf.4711, i32 0
%.tmp4714 = getelementptr [43 x i8], [43 x i8]*@.str4713, i32 0, i32 0
%.tmp4715 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4687
%.tmp4716 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4715, i32 0, i32 1
%.tmp4717 = load i8*, i8** %.tmp4716
%.tmp4718 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4712, i8* %.tmp4714, i8* %.tmp4717)
%.tmp4719 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4720 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4721 = load i8*, i8** %err_buf.4711
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4719, %m307$.Node.type* %.tmp4720, i8* %.tmp4721)
%.tmp4722 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4722
br label %.if.end.4710
.if.false.4710:
br label %.if.end.4710
.if.end.4710:
%var_id.4723 = alloca i8*
store i8* null, i8** %var_id.4723
%.tmp4724 = getelementptr i8*, i8** %var_id.4723, i32 0
%.tmp4726 = getelementptr [6 x i8], [6 x i8]*@.str4725, i32 0, i32 0
%.tmp4727 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4687
%.tmp4728 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4727, i32 0, i32 1
%.tmp4729 = load i8*, i8** %.tmp4728
%.tmp4730 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4731 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4730)
%.tmp4732 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4724, i8* %.tmp4726, i8* %.tmp4729, i32 %.tmp4731)
%.tmp4733 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4734 = load i8, i8* @SCOPE_LOCAL
%.tmp4735 = load i8*, i8** %var_id.4723
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp4733, i8 %.tmp4734, i8* %.tmp4735)
%.tmp4736 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4641
%.tmp4737 = icmp ne %m1861$.Type.type* %.tmp4736, null
br i1 %.tmp4737, label %.if.true.4738, label %.if.false.4738
.if.true.4738:
%.tmp4739 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4740 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4739, i32 0, i32 3
%.tmp4741 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4641
store %m1861$.Type.type* %.tmp4741, %m1861$.Type.type** %.tmp4740
br label %.if.end.4738
.if.false.4738:
%.tmp4742 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4743 = icmp ne %m1861$.AssignableInfo.type* %.tmp4742, null
br i1 %.tmp4743, label %.if.true.4744, label %.if.false.4744
.if.true.4744:
%.tmp4745 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4746 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4745, i32 0, i32 3
%.tmp4747 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4748 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4747, i32 0, i32 3
%.tmp4749 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4748
store %m1861$.Type.type* %.tmp4749, %m1861$.Type.type** %.tmp4746
br label %.if.end.4744
.if.false.4744:
br label %.if.end.4744
.if.end.4744:
br label %.if.end.4738
.if.end.4738:
%.tmp4750 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4751 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4752 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4751, i32 0, i32 3
%.tmp4753 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4752
%.tmp4754 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4750, %m1861$.Type.type* %.tmp4753)
%var_type_repr.4755 = alloca i8*
store i8* %.tmp4754, i8** %var_type_repr.4755
%.tmp4756 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4757 = icmp ne %m1861$.AssignableInfo.type* %.tmp4756, null
br i1 %.tmp4757, label %.if.true.4758, label %.if.false.4758
.if.true.4758:
%.tmp4759 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4760 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4761 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4760, i32 0, i32 3
%.tmp4762 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4761
%.tmp4763 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4759, %m1861$.Type.type* %.tmp4762)
%a_type_repr.4764 = alloca i8*
store i8* %.tmp4763, i8** %a_type_repr.4764
%type_error.4765 = alloca i1
store i1 0, i1* %type_error.4765
%.tmp4766 = load i8*, i8** %a_type_repr.4764
%.tmp4767 = call i32(i8*) @strlen(i8* %.tmp4766)
%.tmp4768 = load i8*, i8** %var_type_repr.4755
%.tmp4769 = call i32(i8*) @strlen(i8* %.tmp4768)
%.tmp4770 = icmp ne i32 %.tmp4767, %.tmp4769
br i1 %.tmp4770, label %.if.true.4771, label %.if.false.4771
.if.true.4771:
store i1 1, i1* %type_error.4765
br label %.if.end.4771
.if.false.4771:
%.tmp4772 = load i8*, i8** %a_type_repr.4764
%.tmp4773 = load i8*, i8** %var_type_repr.4755
%.tmp4774 = call i32(i8*,i8*) @strcmp(i8* %.tmp4772, i8* %.tmp4773)
%.tmp4775 = icmp ne i32 %.tmp4774, 0
br i1 %.tmp4775, label %.if.true.4776, label %.if.false.4776
.if.true.4776:
store i1 1, i1* %type_error.4765
br label %.if.end.4776
.if.false.4776:
br label %.if.end.4776
.if.end.4776:
br label %.if.end.4771
.if.end.4771:
%.tmp4777 = load i1, i1* %type_error.4765
br i1 %.tmp4777, label %.if.true.4778, label %.if.false.4778
.if.true.4778:
%.tmp4779 = bitcast ptr null to i8*
%err_msg.4780 = alloca i8*
store i8* %.tmp4779, i8** %err_msg.4780
%.tmp4781 = getelementptr i8*, i8** %err_msg.4780, i32 0
%.tmp4783 = getelementptr [49 x i8], [49 x i8]*@.str4782, i32 0, i32 0
%.tmp4784 = load i8*, i8** %a_type_repr.4764
%.tmp4785 = load i8*, i8** %var_type_repr.4755
%.tmp4786 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4781, i8* %.tmp4783, i8* %.tmp4784, i8* %.tmp4785)
%.tmp4787 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4788 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4789 = load i8*, i8** %err_msg.4780
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4787, %m307$.Node.type* %.tmp4788, i8* %.tmp4789)
br label %.if.end.4778
.if.false.4778:
br label %.if.end.4778
.if.end.4778:
br label %.if.end.4758
.if.false.4758:
br label %.if.end.4758
.if.end.4758:
%.tmp4790 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4791 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4687
%.tmp4792 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4791, i32 0, i32 1
%.tmp4793 = load i8*, i8** %.tmp4792
%.tmp4794 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4790, i8* %.tmp4793, %m1861$.AssignableInfo.type* %.tmp4794)
%.tmp4795 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4796 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4795, i32 0, i32 1
%.tmp4797 = load %m0$.File.type*, %m0$.File.type** %.tmp4796
%.tmp4799 = getelementptr [16 x i8], [16 x i8]*@.str4798, i32 0, i32 0
%.tmp4800 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4801 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4800)
%.tmp4802 = load i8*, i8** %var_type_repr.4755
%.tmp4803 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4797, i8* %.tmp4799, i8* %.tmp4801, i8* %.tmp4802)
%.tmp4804 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4805 = icmp ne %m1861$.AssignableInfo.type* %.tmp4804, null
br i1 %.tmp4805, label %.if.true.4806, label %.if.false.4806
.if.true.4806:
%.tmp4807 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4808 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4807, i32 0, i32 1
%.tmp4809 = load %m0$.File.type*, %m0$.File.type** %.tmp4808
%.tmp4811 = getelementptr [21 x i8], [21 x i8]*@.str4810, i32 0, i32 0
%.tmp4812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4813 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4814 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4813, i32 0, i32 3
%.tmp4815 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4814
%.tmp4816 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4812, %m1861$.Type.type* %.tmp4815)
%.tmp4817 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4643
%.tmp4818 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4817)
%.tmp4819 = load i8*, i8** %var_type_repr.4755
%.tmp4820 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
%.tmp4821 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4820)
%.tmp4822 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4809, i8* %.tmp4811, i8* %.tmp4816, i8* %.tmp4818, i8* %.tmp4819, i8* %.tmp4821)
br label %.if.end.4806
.if.false.4806:
%.tmp4823 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4824 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4825 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4823, %m307$.Node.type* %.tmp4824, %m1861$.AssignableInfo.type* %.tmp4825)
br label %.if.end.4806
.if.end.4806:
%.tmp4826 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4676
ret %m1861$.AssignableInfo.type* %.tmp4826
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp4827 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp4828 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4827, i32 0, i32 3
%.tmp4829 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4828
%.tmp4830 = icmp eq %m1861$.Type.type* %.tmp4829, null
br i1 %.tmp4830, label %.if.true.4831, label %.if.false.4831
.if.true.4831:
ret void
br label %.if.end.4831
.if.false.4831:
br label %.if.end.4831
.if.end.4831:
%.tmp4832 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4833 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp4834 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4833, i32 0, i32 3
%.tmp4835 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4834
%.tmp4836 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4832, %m1861$.Type.type* %.tmp4835)
%t_repr.4837 = alloca i8*
store i8* %.tmp4836, i8** %t_repr.4837
%.tmp4838 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp4839 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4838)
%id.4840 = alloca i8*
store i8* %.tmp4839, i8** %id.4840
%field_id.4841 = alloca i32
store i32 0, i32* %field_id.4841
%field.4842 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.4842
%field_info.4843 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4844 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp4845 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4844, i32 0, i32 3
%.tmp4846 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4845
%t.4847 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4846, %m1861$.Type.type** %t.4847
%.tmp4848 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4849 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4848, i32 0, i32 0
%.tmp4850 = load i8*, i8** %.tmp4849
%.tmp4852 = getelementptr [4 x i8], [4 x i8]*@.str4851, i32 0, i32 0
%.tmp4853 = call i32(i8*,i8*) @strcmp(i8* %.tmp4850, i8* %.tmp4852)
%.tmp4854 = icmp eq i32 %.tmp4853, 0
%.tmp4855 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4856 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4855, i32 0, i32 0
%.tmp4857 = load i8*, i8** %.tmp4856
%.tmp4859 = getelementptr [4 x i8], [4 x i8]*@.str4858, i32 0, i32 0
%.tmp4860 = call i32(i8*,i8*) @strcmp(i8* %.tmp4857, i8* %.tmp4859)
%.tmp4861 = icmp eq i32 %.tmp4860, 0
%.tmp4862 = or i1 %.tmp4854, %.tmp4861
%.tmp4863 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4864 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4863, i32 0, i32 0
%.tmp4865 = load i8*, i8** %.tmp4864
%.tmp4867 = getelementptr [5 x i8], [5 x i8]*@.str4866, i32 0, i32 0
%.tmp4868 = call i32(i8*,i8*) @strcmp(i8* %.tmp4865, i8* %.tmp4867)
%.tmp4869 = icmp eq i32 %.tmp4868, 0
%.tmp4870 = or i1 %.tmp4862, %.tmp4869
br i1 %.tmp4870, label %.if.true.4871, label %.if.false.4871
.if.true.4871:
%.tmp4872 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4873 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4872, i32 0, i32 1
%.tmp4874 = load %m0$.File.type*, %m0$.File.type** %.tmp4873
%.tmp4876 = getelementptr [21 x i8], [21 x i8]*@.str4875, i32 0, i32 0
%.tmp4877 = load i8*, i8** %t_repr.4837
%.tmp4878 = load i8*, i8** %t_repr.4837
%.tmp4879 = load i8*, i8** %id.4840
%.tmp4880 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4874, i8* %.tmp4876, i8* %.tmp4877, i32 0, i8* %.tmp4878, i8* %.tmp4879)
br label %.if.end.4871
.if.false.4871:
%.tmp4881 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4882 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4881, i32 0, i32 0
%.tmp4883 = load i8*, i8** %.tmp4882
%.tmp4885 = getelementptr [4 x i8], [4 x i8]*@.str4884, i32 0, i32 0
%.tmp4886 = call i32(i8*,i8*) @strcmp(i8* %.tmp4883, i8* %.tmp4885)
%.tmp4887 = icmp eq i32 %.tmp4886, 0
br i1 %.tmp4887, label %.if.true.4888, label %.if.false.4888
.if.true.4888:
%.tmp4889 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4890 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4889, i32 0, i32 1
%.tmp4891 = load %m0$.File.type*, %m0$.File.type** %.tmp4890
%.tmp4893 = getelementptr [21 x i8], [21 x i8]*@.str4892, i32 0, i32 0
%.tmp4894 = load i8*, i8** %t_repr.4837
%.tmp4896 = getelementptr [5 x i8], [5 x i8]*@.str4895, i32 0, i32 0
%.tmp4897 = load i8*, i8** %t_repr.4837
%.tmp4898 = load i8*, i8** %id.4840
%.tmp4899 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4891, i8* %.tmp4893, i8* %.tmp4894, i8* %.tmp4896, i8* %.tmp4897, i8* %.tmp4898)
br label %.if.end.4888
.if.false.4888:
%.tmp4900 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4901 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4900, i32 0, i32 0
%.tmp4902 = load i8*, i8** %.tmp4901
%.tmp4904 = getelementptr [7 x i8], [7 x i8]*@.str4903, i32 0, i32 0
%.tmp4905 = call i32(i8*,i8*) @strcmp(i8* %.tmp4902, i8* %.tmp4904)
%.tmp4906 = icmp eq i32 %.tmp4905, 0
br i1 %.tmp4906, label %.if.true.4907, label %.if.false.4907
.if.true.4907:
%.tmp4909 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4910 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4909, i32 0, i32 3
%.tmp4911 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4910
store %m1861$.Type.type* %.tmp4911, %m1861$.Type.type** %field.4842
br label %.for.start.4908
.for.start.4908:
%.tmp4912 = load %m1861$.Type.type*, %m1861$.Type.type** %field.4842
%.tmp4913 = icmp ne %m1861$.Type.type* %.tmp4912, null
br i1 %.tmp4913, label %.for.continue.4908, label %.for.end.4908
.for.continue.4908:
%.tmp4914 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4915 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4914)
store %m1861$.AssignableInfo.type* %.tmp4915, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4916 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4917 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4916, %m1861$.AssignableInfo.type* %.tmp4917)
%.tmp4918 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4919 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4918, i32 0, i32 3
%.tmp4920 = load %m1861$.Type.type*, %m1861$.Type.type** %field.4842
store %m1861$.Type.type* %.tmp4920, %m1861$.Type.type** %.tmp4919
%.tmp4921 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4922 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4921, i32 0, i32 1
%.tmp4923 = load %m0$.File.type*, %m0$.File.type** %.tmp4922
%.tmp4925 = getelementptr [46 x i8], [46 x i8]*@.str4924, i32 0, i32 0
%.tmp4926 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4927 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4926)
%.tmp4928 = load i8*, i8** %t_repr.4837
%.tmp4929 = load i8*, i8** %t_repr.4837
%.tmp4930 = load i8*, i8** %id.4840
%.tmp4931 = load i32, i32* %field_id.4841
%.tmp4932 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4923, i8* %.tmp4925, i8* %.tmp4927, i8* %.tmp4928, i8* %.tmp4929, i8* %.tmp4930, i32 %.tmp4931)
%.tmp4933 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4934 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4935 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4933, %m307$.Node.type* %.tmp4934, %m1861$.AssignableInfo.type* %.tmp4935)
%.tmp4936 = load i32, i32* %field_id.4841
%.tmp4937 = add i32 %.tmp4936, 1
store i32 %.tmp4937, i32* %field_id.4841
%.tmp4938 = load %m1861$.Type.type*, %m1861$.Type.type** %field.4842
%.tmp4939 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4938, i32 0, i32 4
%.tmp4940 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4939
store %m1861$.Type.type* %.tmp4940, %m1861$.Type.type** %field.4842
br label %.for.start.4908
.for.end.4908:
br label %.if.end.4907
.if.false.4907:
%.tmp4941 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4942 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4941, i32 0, i32 0
%.tmp4943 = load i8*, i8** %.tmp4942
%.tmp4945 = getelementptr [10 x i8], [10 x i8]*@.str4944, i32 0, i32 0
%.tmp4946 = call i32(i8*,i8*) @strcmp(i8* %.tmp4943, i8* %.tmp4945)
%.tmp4947 = icmp eq i32 %.tmp4946, 0
br i1 %.tmp4947, label %.if.true.4948, label %.if.false.4948
.if.true.4948:
%.tmp4950 = load %m1861$.Type.type*, %m1861$.Type.type** %t.4847
%.tmp4951 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4950, i32 0, i32 3
%.tmp4952 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4951
%.tmp4953 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4952, i32 0, i32 3
%.tmp4954 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4953
store %m1861$.Type.type* %.tmp4954, %m1861$.Type.type** %field.4842
br label %.for.start.4949
.for.start.4949:
%.tmp4955 = load %m1861$.Type.type*, %m1861$.Type.type** %field.4842
%.tmp4956 = icmp ne %m1861$.Type.type* %.tmp4955, null
br i1 %.tmp4956, label %.for.continue.4949, label %.for.end.4949
.for.continue.4949:
%.tmp4957 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4958 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4957)
store %m1861$.AssignableInfo.type* %.tmp4958, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4959 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4960 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4959, %m1861$.AssignableInfo.type* %.tmp4960)
%.tmp4961 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4962 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4961, i32 0, i32 3
%.tmp4963 = load %m1861$.Type.type*, %m1861$.Type.type** %field.4842
store %m1861$.Type.type* %.tmp4963, %m1861$.Type.type** %.tmp4962
%.tmp4964 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4965 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4964, i32 0, i32 1
%.tmp4966 = load %m0$.File.type*, %m0$.File.type** %.tmp4965
%.tmp4968 = getelementptr [46 x i8], [46 x i8]*@.str4967, i32 0, i32 0
%.tmp4969 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
%.tmp4970 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4969)
%.tmp4971 = load i8*, i8** %t_repr.4837
%.tmp4972 = load i8*, i8** %t_repr.4837
%.tmp4973 = load i8*, i8** %id.4840
%.tmp4974 = load i32, i32* %field_id.4841
%.tmp4975 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4966, i8* %.tmp4968, i8* %.tmp4970, i8* %.tmp4971, i8* %.tmp4972, i8* %.tmp4973, i32 %.tmp4974)
%.tmp4976 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4977 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4978 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.4843
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4976, %m307$.Node.type* %.tmp4977, %m1861$.AssignableInfo.type* %.tmp4978)
%.tmp4979 = load i32, i32* %field_id.4841
%.tmp4980 = add i32 %.tmp4979, 1
store i32 %.tmp4980, i32* %field_id.4841
%.tmp4981 = load %m1861$.Type.type*, %m1861$.Type.type** %field.4842
%.tmp4982 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4981, i32 0, i32 4
%.tmp4983 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4982
store %m1861$.Type.type* %.tmp4983, %m1861$.Type.type** %field.4842
br label %.for.start.4949
.for.end.4949:
br label %.if.end.4948
.if.false.4948:
%.tmp4984 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4985 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4987 = getelementptr [44 x i8], [44 x i8]*@.str4986, i32 0, i32 0
%.tmp4988 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4984, %m307$.Node.type* %.tmp4985, i8* %.tmp4987)
%.tmp4989 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp4990 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4989, i32 0, i32 3
%.tmp4991 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4990
%.tmp4992 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4991, i32 0, i32 0
%.tmp4993 = load i8*, i8** %.tmp4992
%.tmp4994 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4995 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp4996 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4995, i32 0, i32 3
%.tmp4997 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4996
%.tmp4998 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4994, %m1861$.Type.type* %.tmp4997)
%.tmp4999 = call i32(i8*,...) @printf(i8* %.tmp4988, i8* %.tmp4993, i8* %.tmp4998)
ret void
br label %.if.end.4948
.if.end.4948:
br label %.if.end.4907
.if.end.4907:
br label %.if.end.4888
.if.end.4888:
br label %.if.end.4871
.if.end.4871:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5000 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5001 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5000, i32 0, i32 6
%.tmp5002 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5001
%.tmp5004 = getelementptr [11 x i8], [11 x i8]*@.str5003, i32 0, i32 0
%.tmp5005 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5002, i8* %.tmp5004)
%assignable.5006 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5005, %m307$.Node.type** %assignable.5006
%.tmp5007 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5008 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5006
%.tmp5009 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5007, %m307$.Node.type* %.tmp5008)
%a_info.5010 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5009, %m1861$.AssignableInfo.type** %a_info.5010
%.tmp5011 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5010
%.tmp5012 = icmp eq %m1861$.AssignableInfo.type* %.tmp5011, null
br i1 %.tmp5012, label %.if.true.5013, label %.if.false.5013
.if.true.5013:
ret void
br label %.if.end.5013
.if.false.5013:
br label %.if.end.5013
.if.end.5013:
%.tmp5014 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5015 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5014)
%if_id.5016 = alloca i32
store i32 %.tmp5015, i32* %if_id.5016
%.tmp5017 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5018 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5017, i32 0, i32 1
%.tmp5019 = load %m0$.File.type*, %m0$.File.type** %.tmp5018
%.tmp5021 = getelementptr [53 x i8], [53 x i8]*@.str5020, i32 0, i32 0
%.tmp5022 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5023 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5010
%.tmp5024 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5023, i32 0, i32 3
%.tmp5025 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5024
%.tmp5026 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5022, %m1861$.Type.type* %.tmp5025)
%.tmp5027 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5010
%.tmp5028 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5027)
%.tmp5029 = load i32, i32* %if_id.5016
%.tmp5030 = load i32, i32* %if_id.5016
%.tmp5031 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5019, i8* %.tmp5021, i8* %.tmp5026, i8* %.tmp5028, i32 %.tmp5029, i32 %.tmp5030)
%.tmp5032 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5033 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5032, i32 0, i32 1
%.tmp5034 = load %m0$.File.type*, %m0$.File.type** %.tmp5033
%.tmp5036 = getelementptr [14 x i8], [14 x i8]*@.str5035, i32 0, i32 0
%.tmp5037 = load i32, i32* %if_id.5016
%.tmp5038 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5034, i8* %.tmp5036, i32 %.tmp5037)
%.tmp5039 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5040 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5039, i32 0, i32 6
%.tmp5041 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5040
%.tmp5043 = getelementptr [6 x i8], [6 x i8]*@.str5042, i32 0, i32 0
%.tmp5044 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5041, i8* %.tmp5043)
%block.5045 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5044, %m307$.Node.type** %block.5045
%.tmp5046 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5047 = load %m307$.Node.type*, %m307$.Node.type** %block.5045
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5046, %m307$.Node.type* %.tmp5047)
%.tmp5048 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5049 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5048, i32 0, i32 1
%.tmp5050 = load %m0$.File.type*, %m0$.File.type** %.tmp5049
%.tmp5052 = getelementptr [23 x i8], [23 x i8]*@.str5051, i32 0, i32 0
%.tmp5053 = load i32, i32* %if_id.5016
%.tmp5054 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5050, i8* %.tmp5052, i32 %.tmp5053)
%.tmp5055 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5056 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5055, i32 0, i32 1
%.tmp5057 = load %m0$.File.type*, %m0$.File.type** %.tmp5056
%.tmp5059 = getelementptr [15 x i8], [15 x i8]*@.str5058, i32 0, i32 0
%.tmp5060 = load i32, i32* %if_id.5016
%.tmp5061 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5057, i8* %.tmp5059, i32 %.tmp5060)
%.tmp5062 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5063 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5062, i32 0, i32 6
%.tmp5064 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5063
%.tmp5066 = getelementptr [11 x i8], [11 x i8]*@.str5065, i32 0, i32 0
%.tmp5067 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5064, i8* %.tmp5066)
%else_block.5068 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5067, %m307$.Node.type** %else_block.5068
%.tmp5069 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5068
%.tmp5070 = icmp ne %m307$.Node.type* %.tmp5069, null
br i1 %.tmp5070, label %.if.true.5071, label %.if.false.5071
.if.true.5071:
%.tmp5072 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5068
%.tmp5073 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5072, i32 0, i32 6
%.tmp5074 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5073
%.tmp5075 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5074, i32 0, i32 0
%.tmp5076 = load i8*, i8** %.tmp5075
%.tmp5078 = getelementptr [11 x i8], [11 x i8]*@.str5077, i32 0, i32 0
%.tmp5079 = call i32(i8*,i8*) @strcmp(i8* %.tmp5076, i8* %.tmp5078)
%.tmp5080 = icmp eq i32 %.tmp5079, 0
br i1 %.tmp5080, label %.if.true.5081, label %.if.false.5081
.if.true.5081:
%.tmp5082 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5068
%.tmp5083 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5082, i32 0, i32 6
%.tmp5084 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5083
%.tmp5085 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5084, i32 0, i32 6
%.tmp5086 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5085
%.tmp5088 = getelementptr [6 x i8], [6 x i8]*@.str5087, i32 0, i32 0
%.tmp5089 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5086, i8* %.tmp5088)
store %m307$.Node.type* %.tmp5089, %m307$.Node.type** %block.5045
%.tmp5090 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5091 = load %m307$.Node.type*, %m307$.Node.type** %block.5045
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5090, %m307$.Node.type* %.tmp5091)
br label %.if.end.5081
.if.false.5081:
%.tmp5092 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5093 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5068
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5092, %m307$.Node.type* %.tmp5093)
br label %.if.end.5081
.if.end.5081:
br label %.if.end.5071
.if.false.5071:
br label %.if.end.5071
.if.end.5071:
%.tmp5094 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5095 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5094, i32 0, i32 1
%.tmp5096 = load %m0$.File.type*, %m0$.File.type** %.tmp5095
%.tmp5098 = getelementptr [23 x i8], [23 x i8]*@.str5097, i32 0, i32 0
%.tmp5099 = load i32, i32* %if_id.5016
%.tmp5100 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5096, i8* %.tmp5098, i32 %.tmp5099)
%.tmp5101 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5102 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5101, i32 0, i32 1
%.tmp5103 = load %m0$.File.type*, %m0$.File.type** %.tmp5102
%.tmp5105 = getelementptr [13 x i8], [13 x i8]*@.str5104, i32 0, i32 0
%.tmp5106 = load i32, i32* %if_id.5016
%.tmp5107 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5103, i8* %.tmp5105, i32 %.tmp5106)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5108 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5109 = icmp ne %m307$.Node.type* %.tmp5108, null
br i1 %.tmp5109, label %.if.true.5110, label %.if.false.5110
.if.true.5110:
%.tmp5111 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5112 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5111, i32 0, i32 6
%.tmp5113 = load i8*, i8** %.tmp5112
%.tmp5114 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5115 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5114, i32 0, i32 3
%.tmp5116 = load i32, i32* %.tmp5115
%.tmp5117 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5118 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5117, i32 0, i32 4
%.tmp5119 = load i32, i32* %.tmp5118
%.tmp5120 = load i8*, i8** %msg
%.tmp5121 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5113, i32 %.tmp5116, i32 %.tmp5119, i8* %.tmp5120)
%err.5122 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5121, %m751$.Error.type** %err.5122
%.tmp5123 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5124 = load %m751$.Error.type*, %m751$.Error.type** %err.5122
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5123, %m751$.Error.type* %.tmp5124)
br label %.if.end.5110
.if.false.5110:
%.tmp5126 = getelementptr [61 x i8], [61 x i8]*@.str5125, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5126)
br label %.if.end.5110
.if.end.5110:
ret void
}
define void @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5127 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5128 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5127)
%mod.5129 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5128, %m1861$.ModuleLookup.type** %mod.5129
%.tmp5130 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5129
%.tmp5131 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5130, i32 0, i32 3
%.tmp5132 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5131
%.tmp5133 = icmp ne %m1861$.Scope.type* %.tmp5132, null
%.tmp5135 = getelementptr [82 x i8], [82 x i8]*@.str5134, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5133, i8* %.tmp5135)
%.tmp5136 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5129
%.tmp5137 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5136, i32 0, i32 3
%.tmp5138 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5137
%current_scope.5139 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5138, %m1861$.Scope.type** %current_scope.5139
%.tmp5140 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5141 = ptrtoint %m1861$.ScopeItem.type* %.tmp5140 to i32
%.tmp5142 = call i8*(i32) @malloc(i32 %.tmp5141)
%.tmp5143 = bitcast i8* %.tmp5142 to %m1861$.ScopeItem.type*
%newitem.5144 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5143, %m1861$.ScopeItem.type** %newitem.5144
%.tmp5145 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5144
%.tmp5146 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5145, i32 0, i32 0
%.tmp5147 = load i8*, i8** %name
store i8* %.tmp5147, i8** %.tmp5146
%.tmp5148 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5144
%.tmp5149 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5148, i32 0, i32 1
%.tmp5150 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5150, %m1861$.AssignableInfo.type** %.tmp5149
%.tmp5151 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5144
%.tmp5152 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5151, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5152
%.tmp5153 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5139
%.tmp5154 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5153, i32 0, i32 1
%.tmp5155 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5154
%.tmp5156 = icmp eq %m1861$.ScopeItem.type* %.tmp5155, null
br i1 %.tmp5156, label %.if.true.5157, label %.if.false.5157
.if.true.5157:
%.tmp5158 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5139
%.tmp5159 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5158, i32 0, i32 1
%.tmp5160 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5144
store %m1861$.ScopeItem.type* %.tmp5160, %m1861$.ScopeItem.type** %.tmp5159
ret void
br label %.if.end.5157
.if.false.5157:
br label %.if.end.5157
.if.end.5157:
%.tmp5161 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5139
%.tmp5162 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5161, i32 0, i32 1
%.tmp5163 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5162
%last_item.5164 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5163, %m1861$.ScopeItem.type** %last_item.5164
br label %.for.start.5165
.for.start.5165:
%.tmp5166 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5164
%.tmp5167 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5166, i32 0, i32 2
%.tmp5168 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5167
%.tmp5169 = icmp ne %m1861$.ScopeItem.type* %.tmp5168, null
br i1 %.tmp5169, label %.for.continue.5165, label %.for.end.5165
.for.continue.5165:
%.tmp5170 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5164
%.tmp5171 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5170, i32 0, i32 2
%.tmp5172 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5171
store %m1861$.ScopeItem.type* %.tmp5172, %m1861$.ScopeItem.type** %last_item.5164
br label %.for.start.5165
.for.end.5165:
%.tmp5173 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5164
%.tmp5174 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5173, i32 0, i32 2
%.tmp5175 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5144
store %m1861$.ScopeItem.type* %.tmp5175, %m1861$.ScopeItem.type** %.tmp5174
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5176 = alloca i8*
store i8* null, i8** %err_buf.5176
%.tmp5177 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5178 = load i8*, i8** %module
%.tmp5179 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5179, i32 0, i32 1
%.tmp5181 = load i8*, i8** %.tmp5180
%.tmp5182 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5177, i8* %.tmp5178, i8* %.tmp5181)
%found.5183 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5182, %m1861$.ScopeItem.type** %found.5183
%.tmp5184 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5183
%.tmp5185 = icmp eq %m1861$.ScopeItem.type* %.tmp5184, null
br i1 %.tmp5185, label %.if.true.5186, label %.if.false.5186
.if.true.5186:
%.tmp5187 = getelementptr i8*, i8** %err_buf.5176, i32 0
%.tmp5189 = getelementptr [31 x i8], [31 x i8]*@.str5188, i32 0, i32 0
%.tmp5190 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5191 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5190, i32 0, i32 1
%.tmp5192 = load i8*, i8** %.tmp5191
%.tmp5193 = load i8*, i8** %module
%.tmp5194 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5187, i8* %.tmp5189, i8* %.tmp5192, i8* %.tmp5193)
%.tmp5195 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5196 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5197 = load i8*, i8** %err_buf.5176
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5195, %m307$.Node.type* %.tmp5196, i8* %.tmp5197)
%.tmp5198 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5198
br label %.if.end.5186
.if.false.5186:
br label %.if.end.5186
.if.end.5186:
br label %.for.start.5199
.for.start.5199:
%.tmp5200 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5201 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5200, i32 0, i32 7
%.tmp5202 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5201
%.tmp5203 = icmp ne %m307$.Node.type* %.tmp5202, null
%.tmp5204 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5183
%.tmp5205 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5204, i32 0, i32 1
%.tmp5206 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5205
%.tmp5207 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5206, i32 0, i32 2
%.tmp5208 = load i8*, i8** %.tmp5207
%.tmp5210 = getelementptr [7 x i8], [7 x i8]*@.str5209, i32 0, i32 0
%.tmp5211 = call i32(i8*,i8*) @strcmp(i8* %.tmp5208, i8* %.tmp5210)
%.tmp5212 = icmp eq i32 %.tmp5211, 0
%.tmp5213 = and i1 %.tmp5203, %.tmp5212
br i1 %.tmp5213, label %.for.continue.5199, label %.for.end.5199
.for.continue.5199:
%.tmp5214 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5215 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5183
%.tmp5216 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5215, i32 0, i32 1
%.tmp5217 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5216
%.tmp5218 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5217, i32 0, i32 0
%.tmp5219 = load i8*, i8** %.tmp5218
%.tmp5220 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5221 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5220, i32 0, i32 7
%.tmp5222 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5221
%.tmp5223 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5222, i32 0, i32 7
%.tmp5224 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5223
%.tmp5225 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5214, i8* %.tmp5219, %m307$.Node.type* %.tmp5224)
store %m1861$.ScopeItem.type* %.tmp5225, %m1861$.ScopeItem.type** %found.5183
%.tmp5226 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5183
%.tmp5227 = icmp eq %m1861$.ScopeItem.type* %.tmp5226, null
br i1 %.tmp5227, label %.if.true.5228, label %.if.false.5228
.if.true.5228:
%.tmp5229 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5229
br label %.if.end.5228
.if.false.5228:
br label %.if.end.5228
.if.end.5228:
br label %.for.start.5199
.for.end.5199:
%.tmp5230 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5183
ret %m1861$.ScopeItem.type* %.tmp5230
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5231 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5232 = icmp eq %m1861$.Scope.type* %.tmp5231, null
br i1 %.tmp5232, label %.if.true.5233, label %.if.false.5233
.if.true.5233:
%.tmp5234 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5234
br label %.if.end.5233
.if.false.5233:
br label %.if.end.5233
.if.end.5233:
%.tmp5236 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5237 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5236, i32 0, i32 1
%.tmp5238 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5237
%item.5239 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5238, %m1861$.ScopeItem.type** %item.5239
br label %.for.start.5235
.for.start.5235:
%.tmp5240 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5239
%.tmp5241 = icmp ne %m1861$.ScopeItem.type* %.tmp5240, null
br i1 %.tmp5241, label %.for.continue.5235, label %.for.end.5235
.for.continue.5235:
%.tmp5242 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5239
%.tmp5243 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5242, i32 0, i32 0
%.tmp5244 = load i8*, i8** %.tmp5243
%.tmp5245 = load i8*, i8** %name
%.tmp5246 = call i32(i8*,i8*) @strcmp(i8* %.tmp5244, i8* %.tmp5245)
%.tmp5247 = icmp eq i32 %.tmp5246, 0
br i1 %.tmp5247, label %.if.true.5248, label %.if.false.5248
.if.true.5248:
%.tmp5249 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5239
ret %m1861$.ScopeItem.type* %.tmp5249
br label %.if.end.5248
.if.false.5248:
br label %.if.end.5248
.if.end.5248:
%.tmp5250 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5239
%.tmp5251 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5250, i32 0, i32 2
%.tmp5252 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5251
store %m1861$.ScopeItem.type* %.tmp5252, %m1861$.ScopeItem.type** %item.5239
br label %.for.start.5235
.for.end.5235:
%.tmp5253 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5253
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5254 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5255 = load i8*, i8** %module
%.tmp5256 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5254, i8* %.tmp5255)
%mod.5257 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5256, %m1861$.ModuleLookup.type** %mod.5257
%.tmp5258 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5257
%.tmp5259 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5258, i32 0, i32 3
%.tmp5260 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5259
%.tmp5261 = icmp ne %m1861$.Scope.type* %.tmp5260, null
%.tmp5263 = getelementptr [77 x i8], [77 x i8]*@.str5262, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5261, i8* %.tmp5263)
%.tmp5265 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5257
%.tmp5266 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5265, i32 0, i32 3
%.tmp5267 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5266
%s.5268 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5267, %m1861$.Scope.type** %s.5268
br label %.for.start.5264
.for.start.5264:
%.tmp5269 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5268
%.tmp5270 = icmp ne %m1861$.Scope.type* %.tmp5269, null
br i1 %.tmp5270, label %.for.continue.5264, label %.for.end.5264
.for.continue.5264:
%.tmp5271 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5272 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5268
%.tmp5273 = load i8*, i8** %assignable_name
%.tmp5274 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5271, %m1861$.Scope.type* %.tmp5272, i8* %.tmp5273)
%item.5275 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5274, %m1861$.ScopeItem.type** %item.5275
%.tmp5276 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5275
%.tmp5277 = icmp ne %m1861$.ScopeItem.type* %.tmp5276, null
br i1 %.tmp5277, label %.if.true.5278, label %.if.false.5278
.if.true.5278:
%.tmp5279 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5275
ret %m1861$.ScopeItem.type* %.tmp5279
br label %.if.end.5278
.if.false.5278:
br label %.if.end.5278
.if.end.5278:
%.tmp5280 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5268
%.tmp5281 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5280, i32 0, i32 5
%.tmp5282 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5281
store %m1861$.Scope.type* %.tmp5282, %m1861$.Scope.type** %s.5268
br label %.for.start.5264
.for.end.5264:
%.tmp5283 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5283
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5284 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5285 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5286 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5285, i32 0, i32 6
%.tmp5287 = load i8*, i8** %.tmp5286
%.tmp5288 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5289 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5288, i32 0, i32 6
%.tmp5290 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5289
%.tmp5291 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5284, i8* %.tmp5287, %m307$.Node.type* %.tmp5290)
ret %m1861$.ScopeItem.type* %.tmp5291
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5292 = alloca i8*
store i8* null, i8** %err_msg.5292
%buf.5293 = alloca i8*
store i8* null, i8** %buf.5293
%.tmp5294 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5295 = icmp eq %m1861$.AssignableInfo.type* %.tmp5294, null
br i1 %.tmp5295, label %.if.true.5296, label %.if.false.5296
.if.true.5296:
%.tmp5297 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5298 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5300 = getelementptr [54 x i8], [54 x i8]*@.str5299, i32 0, i32 0
%.tmp5301 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5297, %m307$.Node.type* %.tmp5298, i8* %.tmp5300)
%.tmp5302 = call i32(i8*,...) @printf(i8* %.tmp5301)
%.tmp5303 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5303
br label %.if.end.5296
.if.false.5296:
br label %.if.end.5296
.if.end.5296:
%.tmp5304 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5305 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5304, i32 0, i32 2
%.tmp5306 = load i8*, i8** %.tmp5305
%.tmp5308 = getelementptr [9 x i8], [9 x i8]*@.str5307, i32 0, i32 0
%.tmp5309 = call i32(i8*,i8*) @strcmp(i8* %.tmp5306, i8* %.tmp5308)
%.tmp5310 = icmp eq i32 %.tmp5309, 0
%.tmp5311 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5312 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5311, i32 0, i32 2
%.tmp5313 = load i8*, i8** %.tmp5312
%.tmp5315 = getelementptr [7 x i8], [7 x i8]*@.str5314, i32 0, i32 0
%.tmp5316 = call i32(i8*,i8*) @strcmp(i8* %.tmp5313, i8* %.tmp5315)
%.tmp5317 = icmp eq i32 %.tmp5316, 0
%.tmp5318 = or i1 %.tmp5310, %.tmp5317
br i1 %.tmp5318, label %.if.true.5319, label %.if.false.5319
.if.true.5319:
%.tmp5320 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5321 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5320, i32 0, i32 7
%.tmp5322 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5321
%.tmp5323 = icmp ne %m307$.Node.type* %.tmp5322, null
br i1 %.tmp5323, label %.if.true.5324, label %.if.false.5324
.if.true.5324:
%.tmp5325 = getelementptr i8*, i8** %err_msg.5292, i32 0
%.tmp5327 = getelementptr [46 x i8], [46 x i8]*@.str5326, i32 0, i32 0
%.tmp5328 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5329 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5328, i32 0, i32 7
%.tmp5330 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5329
%.tmp5331 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5330, i32 0, i32 7
%.tmp5332 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5331
%.tmp5333 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5332, i32 0, i32 1
%.tmp5334 = load i8*, i8** %.tmp5333
%.tmp5335 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5336 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5335, i32 0, i32 1
%.tmp5337 = load i8*, i8** %.tmp5336
%.tmp5338 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5325, i8* %.tmp5327, i8* %.tmp5334, i8* %.tmp5337)
%.tmp5339 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5340 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5341 = load i8*, i8** %err_msg.5292
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5339, %m307$.Node.type* %.tmp5340, i8* %.tmp5341)
%.tmp5342 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5342
br label %.if.end.5324
.if.false.5324:
br label %.if.end.5324
.if.end.5324:
%.tmp5343 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5343
br label %.if.end.5319
.if.false.5319:
%.tmp5344 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5345 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5344, i32 0, i32 2
%.tmp5346 = load i8*, i8** %.tmp5345
%.tmp5348 = getelementptr [9 x i8], [9 x i8]*@.str5347, i32 0, i32 0
%.tmp5349 = call i32(i8*,i8*) @strcmp(i8* %.tmp5346, i8* %.tmp5348)
%.tmp5350 = icmp eq i32 %.tmp5349, 0
%.tmp5351 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5352 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5351, i32 0, i32 7
%.tmp5353 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5352
%.tmp5354 = icmp ne %m307$.Node.type* %.tmp5353, null
%.tmp5355 = and i1 %.tmp5350, %.tmp5354
br i1 %.tmp5355, label %.if.true.5356, label %.if.false.5356
.if.true.5356:
%.tmp5357 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5358 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5357, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5359 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5360 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5359, i32 0, i32 3
%.tmp5361 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5360
%struct_info.5362 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5361, %m1861$.Type.type** %struct_info.5362
br label %.for.start.5363
.for.start.5363:
%.tmp5364 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5365 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5364, i32 0, i32 3
%.tmp5366 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5365
%.tmp5367 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5366, i32 0, i32 0
%.tmp5368 = load i8*, i8** %.tmp5367
%.tmp5370 = getelementptr [4 x i8], [4 x i8]*@.str5369, i32 0, i32 0
%.tmp5371 = call i32(i8*,i8*) @strcmp(i8* %.tmp5368, i8* %.tmp5370)
%.tmp5372 = icmp eq i32 %.tmp5371, 0
br i1 %.tmp5372, label %.for.continue.5363, label %.for.end.5363
.for.continue.5363:
%.tmp5373 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5374 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5373)
%new_base.5375 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5374, %m1861$.AssignableInfo.type** %new_base.5375
%.tmp5376 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5377 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5375
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5376, %m1861$.AssignableInfo.type* %.tmp5377)
%.tmp5378 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5375
%.tmp5379 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5378, i32 0, i32 3
%.tmp5380 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5381 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5380, i32 0, i32 3
%.tmp5382 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5381
%.tmp5383 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5382, i32 0, i32 3
%.tmp5384 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5383
store %m1861$.Type.type* %.tmp5384, %m1861$.Type.type** %.tmp5379
%.tmp5385 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5386 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5385, i32 0, i32 1
%.tmp5387 = load %m0$.File.type*, %m0$.File.type** %.tmp5386
%.tmp5389 = getelementptr [23 x i8], [23 x i8]*@.str5388, i32 0, i32 0
%.tmp5390 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5375
%.tmp5391 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5390)
%.tmp5392 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5393 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5375
%.tmp5394 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5393, i32 0, i32 3
%.tmp5395 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5394
%.tmp5396 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5392, %m1861$.Type.type* %.tmp5395)
%.tmp5397 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5398 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5399 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5398, i32 0, i32 3
%.tmp5400 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5399
%.tmp5401 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5397, %m1861$.Type.type* %.tmp5400)
%.tmp5402 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5403 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5402)
%.tmp5404 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5387, i8* %.tmp5389, i8* %.tmp5391, i8* %.tmp5396, i8* %.tmp5401, i8* %.tmp5403)
%.tmp5405 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5375
store %m1861$.AssignableInfo.type* %.tmp5405, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5406 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5362
%.tmp5407 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5406, i32 0, i32 3
%.tmp5408 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5407
store %m1861$.Type.type* %.tmp5408, %m1861$.Type.type** %struct_info.5362
br label %.for.start.5363
.for.end.5363:
%.tmp5409 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5362
%.tmp5410 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5409, i32 0, i32 0
%.tmp5411 = load i8*, i8** %.tmp5410
%.tmp5413 = getelementptr [10 x i8], [10 x i8]*@.str5412, i32 0, i32 0
%.tmp5414 = call i32(i8*,i8*) @strcmp(i8* %.tmp5411, i8* %.tmp5413)
%.tmp5415 = icmp eq i32 %.tmp5414, 0
br i1 %.tmp5415, label %.if.true.5416, label %.if.false.5416
.if.true.5416:
%.tmp5417 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5362
%.tmp5418 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5417, i32 0, i32 3
%.tmp5419 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5418
store %m1861$.Type.type* %.tmp5419, %m1861$.Type.type** %struct_info.5362
br label %.if.end.5416
.if.false.5416:
br label %.if.end.5416
.if.end.5416:
%.tmp5420 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5362
%.tmp5421 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5420, i32 0, i32 0
%.tmp5422 = load i8*, i8** %.tmp5421
%.tmp5424 = getelementptr [7 x i8], [7 x i8]*@.str5423, i32 0, i32 0
%.tmp5425 = call i32(i8*,i8*) @strcmp(i8* %.tmp5422, i8* %.tmp5424)
%.tmp5426 = icmp ne i32 %.tmp5425, 0
br i1 %.tmp5426, label %.if.true.5427, label %.if.false.5427
.if.true.5427:
%.tmp5428 = getelementptr i8*, i8** %err_msg.5292, i32 0
%.tmp5430 = getelementptr [48 x i8], [48 x i8]*@.str5429, i32 0, i32 0
%.tmp5431 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5432 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5431, i32 0, i32 7
%.tmp5433 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5432
%.tmp5434 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5433, i32 0, i32 7
%.tmp5435 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5434
%.tmp5436 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5435, i32 0, i32 1
%.tmp5437 = load i8*, i8** %.tmp5436
%.tmp5438 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5439 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5438, i32 0, i32 1
%.tmp5440 = load i8*, i8** %.tmp5439
%.tmp5441 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5428, i8* %.tmp5430, i8* %.tmp5437, i8* %.tmp5440)
%.tmp5442 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5443 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5444 = load i8*, i8** %err_msg.5292
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5442, %m307$.Node.type* %.tmp5443, i8* %.tmp5444)
%.tmp5445 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5445
br label %.if.end.5427
.if.false.5427:
br label %.if.end.5427
.if.end.5427:
%.tmp5446 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5447 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5446, i32 0, i32 7
%.tmp5448 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5447
%.tmp5449 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5448, i32 0, i32 7
%.tmp5450 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5449
%.tmp5451 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5450, i32 0, i32 1
%.tmp5452 = load i8*, i8** %.tmp5451
%field_name.5453 = alloca i8*
store i8* %.tmp5452, i8** %field_name.5453
%field_id.5454 = alloca i32
store i32 0, i32* %field_id.5454
%.tmp5455 = bitcast ptr null to %m1861$.Type.type*
%found_field.5456 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5455, %m1861$.Type.type** %found_field.5456
%.tmp5458 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5362
%.tmp5459 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5458, i32 0, i32 3
%.tmp5460 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5459
%field.5461 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5460, %m1861$.Type.type** %field.5461
br label %.for.start.5457
.for.start.5457:
%.tmp5462 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5461
%.tmp5463 = icmp ne %m1861$.Type.type* %.tmp5462, null
br i1 %.tmp5463, label %.for.continue.5457, label %.for.end.5457
.for.continue.5457:
%.tmp5464 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5461
%.tmp5465 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5464, i32 0, i32 1
%.tmp5466 = load i8*, i8** %.tmp5465
%.tmp5467 = load i8*, i8** %field_name.5453
%.tmp5468 = call i32(i8*,i8*) @strcmp(i8* %.tmp5466, i8* %.tmp5467)
%.tmp5469 = icmp eq i32 %.tmp5468, 0
br i1 %.tmp5469, label %.if.true.5470, label %.if.false.5470
.if.true.5470:
%.tmp5471 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5461
store %m1861$.Type.type* %.tmp5471, %m1861$.Type.type** %found_field.5456
br label %.for.end.5457
br label %.if.end.5470
.if.false.5470:
%.tmp5472 = load i32, i32* %field_id.5454
%.tmp5473 = add i32 %.tmp5472, 1
store i32 %.tmp5473, i32* %field_id.5454
br label %.if.end.5470
.if.end.5470:
%.tmp5474 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5461
%.tmp5475 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5474, i32 0, i32 4
%.tmp5476 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5475
store %m1861$.Type.type* %.tmp5476, %m1861$.Type.type** %field.5461
br label %.for.start.5457
.for.end.5457:
%.tmp5477 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5456
%.tmp5478 = icmp eq %m1861$.Type.type* %.tmp5477, null
br i1 %.tmp5478, label %.if.true.5479, label %.if.false.5479
.if.true.5479:
%.tmp5480 = getelementptr i8*, i8** %err_msg.5292, i32 0
%.tmp5482 = getelementptr [34 x i8], [34 x i8]*@.str5481, i32 0, i32 0
%.tmp5483 = load i8*, i8** %field_name.5453
%.tmp5484 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5485 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5484, i32 0, i32 1
%.tmp5486 = load i8*, i8** %.tmp5485
%.tmp5487 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5480, i8* %.tmp5482, i8* %.tmp5483, i8* %.tmp5486)
%.tmp5488 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5489 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5490 = load i8*, i8** %err_msg.5292
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5488, %m307$.Node.type* %.tmp5489, i8* %.tmp5490)
%.tmp5491 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5491
br label %.if.end.5479
.if.false.5479:
br label %.if.end.5479
.if.end.5479:
%.tmp5492 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5493 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5492)
%new_info.5494 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5493, %m1861$.AssignableInfo.type** %new_info.5494
%.tmp5495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5494
%.tmp5496 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5495, i32 0, i32 3
%.tmp5497 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5456
store %m1861$.Type.type* %.tmp5497, %m1861$.Type.type** %.tmp5496
%.tmp5498 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5499 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5494
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5498, %m1861$.AssignableInfo.type* %.tmp5499)
%.tmp5500 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5494
%.tmp5501 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5500, i32 0, i32 2
%.tmp5503 = getelementptr [9 x i8], [9 x i8]*@.str5502, i32 0, i32 0
store i8* %.tmp5503, i8** %.tmp5501
%.tmp5504 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5505 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5506 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5505, i32 0, i32 3
%.tmp5507 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5506
%.tmp5508 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5504, %m1861$.Type.type* %.tmp5507)
%info_tr.5509 = alloca i8*
store i8* %.tmp5508, i8** %info_tr.5509
%.tmp5510 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5511 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5510, i32 0, i32 1
%.tmp5512 = load %m0$.File.type*, %m0$.File.type** %.tmp5511
%.tmp5514 = getelementptr [46 x i8], [46 x i8]*@.str5513, i32 0, i32 0
%.tmp5515 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5494
%.tmp5516 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5515)
%.tmp5517 = load i8*, i8** %info_tr.5509
%.tmp5518 = load i8*, i8** %info_tr.5509
%.tmp5519 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5358
%.tmp5520 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5519)
%.tmp5521 = load i32, i32* %field_id.5454
%.tmp5522 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5512, i8* %.tmp5514, i8* %.tmp5516, i8* %.tmp5517, i8* %.tmp5518, i8* %.tmp5520, i32 %.tmp5521)
%.tmp5523 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5524 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5525 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5524, i32 0, i32 7
%.tmp5526 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5525
%.tmp5527 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5526, i32 0, i32 7
%.tmp5528 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5527
%.tmp5529 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5494
%.tmp5530 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5523, %m307$.Node.type* %.tmp5528, %m1861$.AssignableInfo.type* %.tmp5529)
ret %m1861$.AssignableInfo.type* %.tmp5530
br label %.if.end.5356
.if.false.5356:
%.tmp5531 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5532 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5531, i32 0, i32 2
%.tmp5533 = load i8*, i8** %.tmp5532
%.tmp5535 = getelementptr [9 x i8], [9 x i8]*@.str5534, i32 0, i32 0
%.tmp5536 = call i32(i8*,i8*) @strcmp(i8* %.tmp5533, i8* %.tmp5535)
%.tmp5537 = icmp eq i32 %.tmp5536, 0
br i1 %.tmp5537, label %.if.true.5538, label %.if.false.5538
.if.true.5538:
%.tmp5539 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5539
br label %.if.end.5538
.if.false.5538:
br label %.if.end.5538
.if.end.5538:
br label %.if.end.5356
.if.end.5356:
br label %.if.end.5319
.if.end.5319:
%.tmp5540 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5541 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5543 = getelementptr [43 x i8], [43 x i8]*@.str5542, i32 0, i32 0
%.tmp5544 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5540, %m307$.Node.type* %.tmp5541, i8* %.tmp5543)
%.tmp5545 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5546 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5545, i32 0, i32 2
%.tmp5547 = load i8*, i8** %.tmp5546
%.tmp5548 = call i32(i8*,...) @printf(i8* %.tmp5544, i8* %.tmp5547)
%.tmp5549 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5549
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.5550 = alloca i8*
store i8* null, i8** %err_msg.5550
%.tmp5551 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.5552 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5551, %m307$.Node.type** %curr_node.5552
%.tmp5553 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5552
%.tmp5554 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5553, i32 0, i32 0
%.tmp5555 = load i8*, i8** %.tmp5554
%.tmp5557 = getelementptr [12 x i8], [12 x i8]*@.str5556, i32 0, i32 0
%.tmp5558 = call i32(i8*,i8*) @strcmp(i8* %.tmp5555, i8* %.tmp5557)
%.tmp5559 = icmp ne i32 %.tmp5558, 0
br i1 %.tmp5559, label %.if.true.5560, label %.if.false.5560
.if.true.5560:
%.tmp5562 = getelementptr [92 x i8], [92 x i8]*@.str5561, i32 0, i32 0
%.tmp5563 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5552
%.tmp5564 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5563, i32 0, i32 0
%.tmp5565 = load i8*, i8** %.tmp5564
%.tmp5566 = call i32(i8*,...) @printf(i8* %.tmp5562, i8* %.tmp5565)
%.tmp5567 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5568 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5567, i32 0, i32 6
%.tmp5569 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5568
store %m307$.Node.type* %.tmp5569, %m307$.Node.type** %curr_node.5552
br label %.if.end.5560
.if.false.5560:
br label %.if.end.5560
.if.end.5560:
%.tmp5570 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5552
%.tmp5571 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5570, i32 0, i32 6
%.tmp5572 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5571
%assignable_name.5573 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5572, %m307$.Node.type** %assignable_name.5573
%.tmp5574 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5575 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5576 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5575, i32 0, i32 6
%.tmp5577 = load i8*, i8** %.tmp5576
%.tmp5578 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5579 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5578, i32 0, i32 6
%.tmp5580 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5579
%.tmp5581 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5580, i32 0, i32 1
%.tmp5582 = load i8*, i8** %.tmp5581
%.tmp5583 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5574, i8* %.tmp5577, i8* %.tmp5582)
%scope_info.5584 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5583, %m1861$.ScopeItem.type** %scope_info.5584
%.tmp5585 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5584
%.tmp5586 = icmp eq %m1861$.ScopeItem.type* %.tmp5585, null
br i1 %.tmp5586, label %.if.true.5587, label %.if.false.5587
.if.true.5587:
%.tmp5588 = getelementptr i8*, i8** %err_msg.5550, i32 0
%.tmp5590 = getelementptr [41 x i8], [41 x i8]*@.str5589, i32 0, i32 0
%.tmp5591 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5592 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5591, i32 0, i32 6
%.tmp5593 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5592
%.tmp5594 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5593, i32 0, i32 1
%.tmp5595 = load i8*, i8** %.tmp5594
%.tmp5596 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5588, i8* %.tmp5590, i8* %.tmp5595)
%.tmp5597 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5598 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5599 = load i8*, i8** %err_msg.5550
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5597, %m307$.Node.type* %.tmp5598, i8* %.tmp5599)
%.tmp5600 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5600
br label %.if.end.5587
.if.false.5587:
br label %.if.end.5587
.if.end.5587:
%.tmp5601 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5584
%.tmp5602 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5601, i32 0, i32 1
%.tmp5603 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5602
%info.5604 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5603, %m1861$.AssignableInfo.type** %info.5604
%.tmp5605 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5604
%.tmp5606 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5605, i32 0, i32 2
%.tmp5607 = load i8*, i8** %.tmp5606
%.tmp5609 = getelementptr [7 x i8], [7 x i8]*@.str5608, i32 0, i32 0
%.tmp5610 = call i32(i8*,i8*) @strcmp(i8* %.tmp5607, i8* %.tmp5609)
%.tmp5611 = icmp eq i32 %.tmp5610, 0
br i1 %.tmp5611, label %.if.true.5612, label %.if.false.5612
.if.true.5612:
%.tmp5613 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5614 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5604
%.tmp5615 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5614)
%.tmp5616 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5617 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5616, i32 0, i32 6
%.tmp5618 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5617
%.tmp5619 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5618, i32 0, i32 7
%.tmp5620 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5619
%.tmp5621 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5620, i32 0, i32 7
%.tmp5622 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5621
%.tmp5623 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5622, i32 0, i32 1
%.tmp5624 = load i8*, i8** %.tmp5623
%.tmp5625 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5613, i8* %.tmp5615, i8* %.tmp5624)
store %m1861$.ScopeItem.type* %.tmp5625, %m1861$.ScopeItem.type** %scope_info.5584
%.tmp5626 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5584
%.tmp5627 = icmp eq %m1861$.ScopeItem.type* %.tmp5626, null
br i1 %.tmp5627, label %.if.true.5628, label %.if.false.5628
.if.true.5628:
%.tmp5629 = getelementptr i8*, i8** %err_msg.5550, i32 0
%.tmp5631 = getelementptr [31 x i8], [31 x i8]*@.str5630, i32 0, i32 0
%.tmp5632 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5633 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5632, i32 0, i32 6
%.tmp5634 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5633
%.tmp5635 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5634, i32 0, i32 7
%.tmp5636 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5635
%.tmp5637 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5636, i32 0, i32 7
%.tmp5638 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5637
%.tmp5639 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5638, i32 0, i32 1
%.tmp5640 = load i8*, i8** %.tmp5639
%.tmp5641 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5604
%.tmp5642 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5641)
%.tmp5643 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5629, i8* %.tmp5631, i8* %.tmp5640, i8* %.tmp5642)
%.tmp5644 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5645 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5552
%.tmp5646 = load i8*, i8** %err_msg.5550
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5644, %m307$.Node.type* %.tmp5645, i8* %.tmp5646)
%.tmp5647 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5647
br label %.if.end.5628
.if.false.5628:
br label %.if.end.5628
.if.end.5628:
%.tmp5648 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5584
%.tmp5649 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5648, i32 0, i32 1
%.tmp5650 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5649
store %m1861$.AssignableInfo.type* %.tmp5650, %m1861$.AssignableInfo.type** %info.5604
%.tmp5651 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5652 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5651, i32 0, i32 6
%.tmp5653 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5652
%.tmp5654 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5653, i32 0, i32 7
%.tmp5655 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5654
%.tmp5656 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5655, i32 0, i32 7
%.tmp5657 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5656
store %m307$.Node.type* %.tmp5657, %m307$.Node.type** %assignable_name.5573
br label %.if.end.5612
.if.false.5612:
%.tmp5658 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5659 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5658, i32 0, i32 6
%.tmp5660 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5659
store %m307$.Node.type* %.tmp5660, %m307$.Node.type** %assignable_name.5573
br label %.if.end.5612
.if.end.5612:
%.tmp5661 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5662 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5573
%.tmp5663 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5604
%.tmp5664 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5661, %m307$.Node.type* %.tmp5662, %m1861$.AssignableInfo.type* %.tmp5663)
%base.5665 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5664, %m1861$.AssignableInfo.type** %base.5665
%.tmp5667 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5552
%.tmp5668 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5667, i32 0, i32 6
%.tmp5669 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5668
%.tmp5670 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5669, i32 0, i32 7
%.tmp5671 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5670
%addr.5672 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5671, %m307$.Node.type** %addr.5672
br label %.for.start.5666
.for.start.5666:
%.tmp5673 = load %m307$.Node.type*, %m307$.Node.type** %addr.5672
%.tmp5674 = icmp ne %m307$.Node.type* %.tmp5673, null
br i1 %.tmp5674, label %.for.continue.5666, label %.for.end.5666
.for.continue.5666:
%.tmp5675 = load %m307$.Node.type*, %m307$.Node.type** %addr.5672
%.tmp5676 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5675, i32 0, i32 7
%.tmp5677 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5676
%index.5678 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5677, %m307$.Node.type** %index.5678
%.tmp5679 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5680 = load %m307$.Node.type*, %m307$.Node.type** %index.5678
%.tmp5681 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5679, %m307$.Node.type* %.tmp5680)
%index_info.5682 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5681, %m1861$.AssignableInfo.type** %index_info.5682
%.tmp5683 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5684 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5665
%.tmp5685 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5684, i32 0, i32 3
%.tmp5686 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5685
%.tmp5687 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5683, %m1861$.Type.type* %.tmp5686)
%base_type.5688 = alloca i8*
store i8* %.tmp5687, i8** %base_type.5688
%.tmp5689 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5690 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.5682
%.tmp5691 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5690, i32 0, i32 3
%.tmp5692 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5691
%.tmp5693 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5689, %m1861$.Type.type* %.tmp5692)
%index_type.5694 = alloca i8*
store i8* %.tmp5693, i8** %index_type.5694
%.tmp5695 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5696 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5695)
%tmp_id.5697 = alloca i32
store i32 %.tmp5696, i32* %tmp_id.5697
%.tmp5698 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5699 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5698, i32 0, i32 1
%.tmp5700 = load %m0$.File.type*, %m0$.File.type** %.tmp5699
%.tmp5702 = getelementptr [28 x i8], [28 x i8]*@.str5701, i32 0, i32 0
%.tmp5703 = load i32, i32* %tmp_id.5697
%.tmp5704 = load i8*, i8** %base_type.5688
%.tmp5705 = load i8*, i8** %base_type.5688
%.tmp5706 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5665
%.tmp5707 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5706)
%.tmp5708 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5700, i8* %.tmp5702, i32 %.tmp5703, i8* %.tmp5704, i8* %.tmp5705, i8* %.tmp5707)
%.tmp5709 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5552
%.tmp5710 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5709)
%new_base.5711 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5710, %m1861$.AssignableInfo.type** %new_base.5711
%.tmp5712 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5713 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5711
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5712, %m1861$.AssignableInfo.type* %.tmp5713)
%.tmp5714 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5665
%.tmp5715 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5714, i32 0, i32 3
%.tmp5716 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5715
%.tmp5717 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5716, i32 0, i32 3
%.tmp5718 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5717
%.tmp5719 = icmp eq %m1861$.Type.type* %.tmp5718, null
br i1 %.tmp5719, label %.if.true.5720, label %.if.false.5720
.if.true.5720:
%.tmp5721 = getelementptr i8*, i8** %err_msg.5550, i32 0
%.tmp5723 = getelementptr [35 x i8], [35 x i8]*@.str5722, i32 0, i32 0
%.tmp5724 = load i8*, i8** %base_type.5688
%.tmp5725 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5721, i8* %.tmp5723, i8* %.tmp5724)
%.tmp5726 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5727 = load %m307$.Node.type*, %m307$.Node.type** %addr.5672
%.tmp5728 = load i8*, i8** %err_msg.5550
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5726, %m307$.Node.type* %.tmp5727, i8* %.tmp5728)
%.tmp5729 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5665
ret %m1861$.AssignableInfo.type* %.tmp5729
br label %.if.end.5720
.if.false.5720:
br label %.if.end.5720
.if.end.5720:
%.tmp5730 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5711
%.tmp5731 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5730, i32 0, i32 3
%.tmp5732 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5665
%.tmp5733 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5732, i32 0, i32 3
%.tmp5734 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5733
%.tmp5735 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5734, i32 0, i32 3
%.tmp5736 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5735
store %m1861$.Type.type* %.tmp5736, %m1861$.Type.type** %.tmp5731
%.tmp5737 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5738 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5711
%.tmp5739 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5738, i32 0, i32 3
%.tmp5740 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5739
%.tmp5741 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5737, %m1861$.Type.type* %.tmp5740)
%base_type_2.5742 = alloca i8*
store i8* %.tmp5741, i8** %base_type_2.5742
%.tmp5743 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5744 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5743, i32 0, i32 1
%.tmp5745 = load %m0$.File.type*, %m0$.File.type** %.tmp5744
%.tmp5747 = getelementptr [44 x i8], [44 x i8]*@.str5746, i32 0, i32 0
%.tmp5748 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5711
%.tmp5749 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5748)
%.tmp5750 = load i8*, i8** %base_type_2.5742
%.tmp5751 = load i8*, i8** %base_type_2.5742
%.tmp5752 = load i32, i32* %tmp_id.5697
%.tmp5753 = load i8*, i8** %index_type.5694
%.tmp5754 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.5682
%.tmp5755 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5754)
%.tmp5756 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5745, i8* %.tmp5747, i8* %.tmp5749, i8* %.tmp5750, i8* %.tmp5751, i32 %.tmp5752, i8* %.tmp5753, i8* %.tmp5755)
%.tmp5757 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5711
store %m1861$.AssignableInfo.type* %.tmp5757, %m1861$.AssignableInfo.type** %base.5665
%.tmp5758 = load %m307$.Node.type*, %m307$.Node.type** %addr.5672
%.tmp5759 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5758, i32 0, i32 7
%.tmp5760 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5759
%.tmp5761 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5760, i32 0, i32 7
%.tmp5762 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5761
%.tmp5763 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5762, i32 0, i32 7
%.tmp5764 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5763
store %m307$.Node.type* %.tmp5764, %m307$.Node.type** %addr.5672
br label %.for.start.5666
.for.end.5666:
%.tmp5765 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5665
ret %m1861$.AssignableInfo.type* %.tmp5765
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp5766 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5767 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5766, i32 0, i32 6
%.tmp5768 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5767
%.tmp5769 = icmp eq %m307$.Node.type* %.tmp5768, null
br i1 %.tmp5769, label %.if.true.5770, label %.if.false.5770
.if.true.5770:
%.tmp5772 = getelementptr [15 x i8], [15 x i8]*@.str5771, i32 0, i32 0
%.tmp5773 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5774 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5773, i32 0, i32 0
%.tmp5775 = load i8*, i8** %.tmp5774
%.tmp5776 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5777 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5776, i32 0, i32 1
%.tmp5778 = load i8*, i8** %.tmp5777
%.tmp5779 = call i32(i8*,...) @printf(i8* %.tmp5772, i8* %.tmp5775, i8* %.tmp5778)
br label %.if.end.5770
.if.false.5770:
br label %.if.end.5770
.if.end.5770:
%.tmp5780 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5781 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5780, i32 0, i32 6
%.tmp5782 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5781
%.tmp5784 = getelementptr [16 x i8], [16 x i8]*@.str5783, i32 0, i32 0
%.tmp5785 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5782, i8* %.tmp5784)
%assignable_start.5786 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5785, %m307$.Node.type** %assignable_start.5786
%.tmp5787 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.5786
%.tmp5788 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5787)
%operator_stack.5789 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp5788, %m1988$.SYStack.type** %operator_stack.5789
%.tmp5790 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp5791 = ptrtoint %m1861$.StackHead.type* %.tmp5790 to i32
%.tmp5792 = call i8*(i32) @malloc(i32 %.tmp5791)
%.tmp5793 = bitcast i8* %.tmp5792 to %m1861$.StackHead.type*
%stack.5794 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp5793, %m1861$.StackHead.type** %stack.5794
%.tmp5795 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.5794
%.tmp5796 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5795, i32 0, i32 0
%.tmp5797 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.5789
store %m1988$.SYStack.type* %.tmp5797, %m1988$.SYStack.type** %.tmp5796
%.tmp5798 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5799 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.5794
%.tmp5800 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp5798, %m1861$.StackHead.type* %.tmp5799)
%info.5801 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5800, %m1861$.AssignableInfo.type** %info.5801
%.tmp5802 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
%.tmp5803 = icmp eq %m1861$.AssignableInfo.type* %.tmp5802, null
br i1 %.tmp5803, label %.if.true.5804, label %.if.false.5804
.if.true.5804:
%.tmp5805 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
ret %m1861$.AssignableInfo.type* %.tmp5805
br label %.if.end.5804
.if.false.5804:
br label %.if.end.5804
.if.end.5804:
%.tmp5806 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5807 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5806, i32 0, i32 6
%.tmp5808 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5807
%.tmp5810 = getelementptr [5 x i8], [5 x i8]*@.str5809, i32 0, i32 0
%.tmp5811 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5808, i8* %.tmp5810)
%cast.5812 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5811, %m307$.Node.type** %cast.5812
%.tmp5813 = load %m307$.Node.type*, %m307$.Node.type** %cast.5812
%.tmp5814 = icmp ne %m307$.Node.type* %.tmp5813, null
br i1 %.tmp5814, label %.if.true.5815, label %.if.false.5815
.if.true.5815:
%.tmp5816 = load %m307$.Node.type*, %m307$.Node.type** %cast.5812
%.tmp5817 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5816, i32 0, i32 6
%.tmp5818 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5817
%.tmp5820 = getelementptr [5 x i8], [5 x i8]*@.str5819, i32 0, i32 0
%.tmp5821 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5818, i8* %.tmp5820)
%cast_type.5822 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5821, %m307$.Node.type** %cast_type.5822
%.tmp5823 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5824 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.5822
%.tmp5825 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5824, i32 0, i32 6
%.tmp5826 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5825
%.tmp5827 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5823, %m307$.Node.type* %.tmp5826)
%type.5828 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5827, %m1861$.Type.type** %type.5828
%.tmp5829 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
%.tmp5830 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5829)
%prev_id.5831 = alloca i8*
store i8* %.tmp5830, i8** %prev_id.5831
%.tmp5832 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5833 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5832, %m1861$.AssignableInfo.type* %.tmp5833)
%.tmp5834 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5835 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
%.tmp5836 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5835, i32 0, i32 3
%.tmp5837 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5836
%.tmp5838 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5834, %m1861$.Type.type* %.tmp5837)
%from_type.5839 = alloca i8*
store i8* %.tmp5838, i8** %from_type.5839
%.tmp5840 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5841 = load %m1861$.Type.type*, %m1861$.Type.type** %type.5828
%.tmp5842 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5840, %m1861$.Type.type* %.tmp5841)
%to_type.5843 = alloca i8*
store i8* %.tmp5842, i8** %to_type.5843
%.tmp5845 = getelementptr [8 x i8], [8 x i8]*@.str5844, i32 0, i32 0
%cast_fn.5846 = alloca i8*
store i8* %.tmp5845, i8** %cast_fn.5846
%.tmp5847 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
%.tmp5848 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5847, i32 0, i32 3
%.tmp5849 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5848
%.tmp5850 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5849, i32 0, i32 0
%.tmp5851 = load i8*, i8** %.tmp5850
%.tmp5853 = getelementptr [4 x i8], [4 x i8]*@.str5852, i32 0, i32 0
%.tmp5854 = call i32(i8*,i8*) @strcmp(i8* %.tmp5851, i8* %.tmp5853)
%.tmp5855 = icmp ne i32 %.tmp5854, 0
%.tmp5856 = load %m1861$.Type.type*, %m1861$.Type.type** %type.5828
%.tmp5857 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5856, i32 0, i32 0
%.tmp5858 = load i8*, i8** %.tmp5857
%.tmp5860 = getelementptr [4 x i8], [4 x i8]*@.str5859, i32 0, i32 0
%.tmp5861 = call i32(i8*,i8*) @strcmp(i8* %.tmp5858, i8* %.tmp5860)
%.tmp5862 = icmp ne i32 %.tmp5861, 0
%.tmp5863 = and i1 %.tmp5855, %.tmp5862
br i1 %.tmp5863, label %.if.true.5864, label %.if.false.5864
.if.true.5864:
%.tmp5865 = load i8*, i8** %from_type.5839
%.tmp5866 = getelementptr i8, i8* %.tmp5865, i32 0
%.tmp5867 = load i8, i8* %.tmp5866
%.tmp5868 = icmp eq i8 %.tmp5867, 105
%.tmp5869 = load i8*, i8** %to_type.5843
%.tmp5870 = getelementptr i8, i8* %.tmp5869, i32 0
%.tmp5871 = load i8, i8* %.tmp5870
%.tmp5872 = icmp eq i8 %.tmp5871, 105
%.tmp5873 = and i1 %.tmp5868, %.tmp5872
br i1 %.tmp5873, label %.if.true.5874, label %.if.false.5874
.if.true.5874:
%from_size.5875 = alloca i32
store i32 0, i32* %from_size.5875
%to_size.5876 = alloca i32
store i32 0, i32* %to_size.5876
%.tmp5877 = load i8*, i8** %from_type.5839
%.tmp5879 = getelementptr [4 x i8], [4 x i8]*@.str5878, i32 0, i32 0
%.tmp5880 = getelementptr i32, i32* %from_size.5875, i32 0
%.tmp5881 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5877, i8* %.tmp5879, i32* %.tmp5880)
%.tmp5882 = load i8*, i8** %to_type.5843
%.tmp5884 = getelementptr [4 x i8], [4 x i8]*@.str5883, i32 0, i32 0
%.tmp5885 = getelementptr i32, i32* %to_size.5876, i32 0
%.tmp5886 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5882, i8* %.tmp5884, i32* %.tmp5885)
%.tmp5887 = load i32, i32* %from_size.5875
%.tmp5888 = load i32, i32* %to_size.5876
%.tmp5889 = icmp slt i32 %.tmp5887, %.tmp5888
br i1 %.tmp5889, label %.if.true.5890, label %.if.false.5890
.if.true.5890:
%.tmp5892 = getelementptr [5 x i8], [5 x i8]*@.str5891, i32 0, i32 0
store i8* %.tmp5892, i8** %cast_fn.5846
br label %.if.end.5890
.if.false.5890:
%.tmp5894 = getelementptr [6 x i8], [6 x i8]*@.str5893, i32 0, i32 0
store i8* %.tmp5894, i8** %cast_fn.5846
br label %.if.end.5890
.if.end.5890:
br label %.if.end.5874
.if.false.5874:
br label %.if.end.5874
.if.end.5874:
br label %.if.end.5864
.if.false.5864:
br label %.if.end.5864
.if.end.5864:
%.tmp5895 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5896 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5895, i32 0, i32 1
%.tmp5897 = load %m0$.File.type*, %m0$.File.type** %.tmp5896
%.tmp5899 = getelementptr [21 x i8], [21 x i8]*@.str5898, i32 0, i32 0
%.tmp5900 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
%.tmp5901 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5900)
%.tmp5902 = load i8*, i8** %cast_fn.5846
%.tmp5903 = load i8*, i8** %from_type.5839
%.tmp5904 = load i8*, i8** %prev_id.5831
%.tmp5905 = load i8*, i8** %to_type.5843
%.tmp5906 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5897, i8* %.tmp5899, i8* %.tmp5901, i8* %.tmp5902, i8* %.tmp5903, i8* %.tmp5904, i8* %.tmp5905)
%.tmp5907 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
%.tmp5908 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5907, i32 0, i32 3
%.tmp5909 = load %m1861$.Type.type*, %m1861$.Type.type** %type.5828
store %m1861$.Type.type* %.tmp5909, %m1861$.Type.type** %.tmp5908
br label %.if.end.5815
.if.false.5815:
br label %.if.end.5815
.if.end.5815:
%.tmp5910 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5801
ret %m1861$.AssignableInfo.type* %.tmp5910
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp5911 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5912 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5911, i32 0, i32 0
%.tmp5913 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5912
%.tmp5914 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp5913, i32 0, i32 0
%.tmp5915 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5914
%.tmp5916 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5915, i32 0, i32 0
%.tmp5917 = load i8*, i8** %.tmp5916
%.tmp5919 = getelementptr [16 x i8], [16 x i8]*@.str5918, i32 0, i32 0
%.tmp5920 = call i32(i8*,i8*) @strcmp(i8* %.tmp5917, i8* %.tmp5919)
%.tmp5921 = icmp eq i32 %.tmp5920, 0
br i1 %.tmp5921, label %.if.true.5922, label %.if.false.5922
.if.true.5922:
%.tmp5923 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5924 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5925 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5924, i32 0, i32 0
%.tmp5926 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5925
%.tmp5927 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp5926, i32 0, i32 0
%.tmp5928 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5927
%.tmp5929 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5923, %m307$.Node.type* %.tmp5928)
ret %m1861$.AssignableInfo.type* %.tmp5929
br label %.if.end.5922
.if.false.5922:
br label %.if.end.5922
.if.end.5922:
%.tmp5930 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5931 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5930, i32 0, i32 0
%.tmp5932 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5931
%.tmp5933 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp5932, i32 0, i32 0
%.tmp5934 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5933
%.tmp5935 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5934, i32 0, i32 6
%.tmp5936 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5935
%operator.5937 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5936, %m307$.Node.type** %operator.5937
%.tmp5938 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5939 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5938, i32 0, i32 0
%.tmp5940 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5941 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5940, i32 0, i32 0
%.tmp5942 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5941
%.tmp5943 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp5942, i32 0, i32 1
%.tmp5944 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5943
store %m1988$.SYStack.type* %.tmp5944, %m1988$.SYStack.type** %.tmp5939
%.tmp5945 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5946 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5947 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp5945, %m1861$.StackHead.type* %.tmp5946)
%A.5948 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5947, %m1861$.AssignableInfo.type** %A.5948
%.tmp5949 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.5948
%.tmp5950 = icmp eq %m1861$.AssignableInfo.type* %.tmp5949, null
br i1 %.tmp5950, label %.if.true.5951, label %.if.false.5951
.if.true.5951:
%.tmp5952 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.5948
ret %m1861$.AssignableInfo.type* %.tmp5952
br label %.if.end.5951
.if.false.5951:
br label %.if.end.5951
.if.end.5951:
%.tmp5953 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5954 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5953, i32 0, i32 0
%.tmp5955 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5956 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp5955, i32 0, i32 0
%.tmp5957 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5956
%.tmp5958 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp5957, i32 0, i32 1
%.tmp5959 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp5958
store %m1988$.SYStack.type* %.tmp5959, %m1988$.SYStack.type** %.tmp5954
%.tmp5960 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5961 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp5962 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp5960, %m1861$.StackHead.type* %.tmp5961)
%B.5963 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5962, %m1861$.AssignableInfo.type** %B.5963
%.tmp5964 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.5963
%.tmp5965 = icmp eq %m1861$.AssignableInfo.type* %.tmp5964, null
br i1 %.tmp5965, label %.if.true.5966, label %.if.false.5966
.if.true.5966:
%.tmp5967 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.5963
ret %m1861$.AssignableInfo.type* %.tmp5967
br label %.if.end.5966
.if.false.5966:
br label %.if.end.5966
.if.end.5966:
%.tmp5968 = bitcast ptr null to %m307$.Node.type*
%.tmp5969 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5968)
%op_info.5970 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5969, %m1861$.AssignableInfo.type** %op_info.5970
%.tmp5971 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.5970
%.tmp5972 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5971, i32 0, i32 3
%.tmp5973 = load %m307$.Node.type*, %m307$.Node.type** %operator.5937
%.tmp5974 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5973)
store %m1861$.Type.type* %.tmp5974, %m1861$.Type.type** %.tmp5972
%.tmp5975 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5976 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.5970
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5975, %m1861$.AssignableInfo.type* %.tmp5976)
%.tmp5977 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5978 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5977, i32 0, i32 1
%.tmp5979 = load %m0$.File.type*, %m0$.File.type** %.tmp5978
%.tmp5981 = getelementptr [19 x i8], [19 x i8]*@.str5980, i32 0, i32 0
%.tmp5982 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.5970
%.tmp5983 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5982)
%.tmp5984 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5985 = load %m307$.Node.type*, %m307$.Node.type** %operator.5937
%.tmp5986 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5984, %m307$.Node.type* %.tmp5985)
%.tmp5987 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5988 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.5948
%.tmp5989 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5988, i32 0, i32 3
%.tmp5990 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5989
%.tmp5991 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5987, %m1861$.Type.type* %.tmp5990)
%.tmp5992 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.5948
%.tmp5993 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5992)
%.tmp5994 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.5963
%.tmp5995 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5994)
%.tmp5996 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5979, i8* %.tmp5981, i8* %.tmp5983, i8* %.tmp5986, i8* %.tmp5991, i8* %.tmp5993, i8* %.tmp5995)
%.tmp5997 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.5970
ret %m1861$.AssignableInfo.type* %.tmp5997
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp5998 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp5999 = icmp eq %m307$.Node.type* %.tmp5998, null
br i1 %.tmp5999, label %.if.true.6000, label %.if.false.6000
.if.true.6000:
%.tmp6001 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6002 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6004 = getelementptr [31 x i8], [31 x i8]*@.str6003, i32 0, i32 0
%.tmp6005 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6001, %m307$.Node.type* %.tmp6002, i8* %.tmp6004)
%.tmp6006 = call i32(i8*,...) @printf(i8* %.tmp6005)
br label %.if.end.6000
.if.false.6000:
br label %.if.end.6000
.if.end.6000:
%.tmp6007 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6008 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6007, i32 0, i32 1
%.tmp6009 = load i8*, i8** %.tmp6008
%.tmp6011 = getelementptr [2 x i8], [2 x i8]*@.str6010, i32 0, i32 0
%.tmp6012 = call i32(i8*,i8*) @strcmp(i8* %.tmp6009, i8* %.tmp6011)
%.tmp6013 = icmp eq i32 %.tmp6012, 0
br i1 %.tmp6013, label %.if.true.6014, label %.if.false.6014
.if.true.6014:
%.tmp6016 = getelementptr [4 x i8], [4 x i8]*@.str6015, i32 0, i32 0
ret i8* %.tmp6016
br label %.if.end.6014
.if.false.6014:
%.tmp6017 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6018 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6017, i32 0, i32 1
%.tmp6019 = load i8*, i8** %.tmp6018
%.tmp6021 = getelementptr [2 x i8], [2 x i8]*@.str6020, i32 0, i32 0
%.tmp6022 = call i32(i8*,i8*) @strcmp(i8* %.tmp6019, i8* %.tmp6021)
%.tmp6023 = icmp eq i32 %.tmp6022, 0
br i1 %.tmp6023, label %.if.true.6024, label %.if.false.6024
.if.true.6024:
%.tmp6026 = getelementptr [4 x i8], [4 x i8]*@.str6025, i32 0, i32 0
ret i8* %.tmp6026
br label %.if.end.6024
.if.false.6024:
%.tmp6027 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6028 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6027, i32 0, i32 1
%.tmp6029 = load i8*, i8** %.tmp6028
%.tmp6031 = getelementptr [2 x i8], [2 x i8]*@.str6030, i32 0, i32 0
%.tmp6032 = call i32(i8*,i8*) @strcmp(i8* %.tmp6029, i8* %.tmp6031)
%.tmp6033 = icmp eq i32 %.tmp6032, 0
br i1 %.tmp6033, label %.if.true.6034, label %.if.false.6034
.if.true.6034:
%.tmp6036 = getelementptr [4 x i8], [4 x i8]*@.str6035, i32 0, i32 0
ret i8* %.tmp6036
br label %.if.end.6034
.if.false.6034:
%.tmp6037 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6038 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6037, i32 0, i32 1
%.tmp6039 = load i8*, i8** %.tmp6038
%.tmp6041 = getelementptr [2 x i8], [2 x i8]*@.str6040, i32 0, i32 0
%.tmp6042 = call i32(i8*,i8*) @strcmp(i8* %.tmp6039, i8* %.tmp6041)
%.tmp6043 = icmp eq i32 %.tmp6042, 0
br i1 %.tmp6043, label %.if.true.6044, label %.if.false.6044
.if.true.6044:
%.tmp6046 = getelementptr [5 x i8], [5 x i8]*@.str6045, i32 0, i32 0
ret i8* %.tmp6046
br label %.if.end.6044
.if.false.6044:
%.tmp6047 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6048 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6047, i32 0, i32 1
%.tmp6049 = load i8*, i8** %.tmp6048
%.tmp6051 = getelementptr [3 x i8], [3 x i8]*@.str6050, i32 0, i32 0
%.tmp6052 = call i32(i8*,i8*) @strcmp(i8* %.tmp6049, i8* %.tmp6051)
%.tmp6053 = icmp eq i32 %.tmp6052, 0
br i1 %.tmp6053, label %.if.true.6054, label %.if.false.6054
.if.true.6054:
%.tmp6056 = getelementptr [8 x i8], [8 x i8]*@.str6055, i32 0, i32 0
ret i8* %.tmp6056
br label %.if.end.6054
.if.false.6054:
%.tmp6057 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6058 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6057, i32 0, i32 1
%.tmp6059 = load i8*, i8** %.tmp6058
%.tmp6061 = getelementptr [3 x i8], [3 x i8]*@.str6060, i32 0, i32 0
%.tmp6062 = call i32(i8*,i8*) @strcmp(i8* %.tmp6059, i8* %.tmp6061)
%.tmp6063 = icmp eq i32 %.tmp6062, 0
br i1 %.tmp6063, label %.if.true.6064, label %.if.false.6064
.if.true.6064:
%.tmp6066 = getelementptr [8 x i8], [8 x i8]*@.str6065, i32 0, i32 0
ret i8* %.tmp6066
br label %.if.end.6064
.if.false.6064:
%.tmp6067 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6068 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6067, i32 0, i32 1
%.tmp6069 = load i8*, i8** %.tmp6068
%.tmp6071 = getelementptr [2 x i8], [2 x i8]*@.str6070, i32 0, i32 0
%.tmp6072 = call i32(i8*,i8*) @strcmp(i8* %.tmp6069, i8* %.tmp6071)
%.tmp6073 = icmp eq i32 %.tmp6072, 0
br i1 %.tmp6073, label %.if.true.6074, label %.if.false.6074
.if.true.6074:
%.tmp6076 = getelementptr [9 x i8], [9 x i8]*@.str6075, i32 0, i32 0
ret i8* %.tmp6076
br label %.if.end.6074
.if.false.6074:
%.tmp6077 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6078 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6077, i32 0, i32 1
%.tmp6079 = load i8*, i8** %.tmp6078
%.tmp6081 = getelementptr [2 x i8], [2 x i8]*@.str6080, i32 0, i32 0
%.tmp6082 = call i32(i8*,i8*) @strcmp(i8* %.tmp6079, i8* %.tmp6081)
%.tmp6083 = icmp eq i32 %.tmp6082, 0
br i1 %.tmp6083, label %.if.true.6084, label %.if.false.6084
.if.true.6084:
%.tmp6086 = getelementptr [9 x i8], [9 x i8]*@.str6085, i32 0, i32 0
ret i8* %.tmp6086
br label %.if.end.6084
.if.false.6084:
%.tmp6087 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6088 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6087, i32 0, i32 1
%.tmp6089 = load i8*, i8** %.tmp6088
%.tmp6091 = getelementptr [2 x i8], [2 x i8]*@.str6090, i32 0, i32 0
%.tmp6092 = call i32(i8*,i8*) @strcmp(i8* %.tmp6089, i8* %.tmp6091)
%.tmp6093 = icmp eq i32 %.tmp6092, 0
br i1 %.tmp6093, label %.if.true.6094, label %.if.false.6094
.if.true.6094:
%.tmp6096 = getelementptr [4 x i8], [4 x i8]*@.str6095, i32 0, i32 0
ret i8* %.tmp6096
br label %.if.end.6094
.if.false.6094:
%.tmp6097 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6098 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6097, i32 0, i32 1
%.tmp6099 = load i8*, i8** %.tmp6098
%.tmp6101 = getelementptr [2 x i8], [2 x i8]*@.str6100, i32 0, i32 0
%.tmp6102 = call i32(i8*,i8*) @strcmp(i8* %.tmp6099, i8* %.tmp6101)
%.tmp6103 = icmp eq i32 %.tmp6102, 0
br i1 %.tmp6103, label %.if.true.6104, label %.if.false.6104
.if.true.6104:
%.tmp6106 = getelementptr [3 x i8], [3 x i8]*@.str6105, i32 0, i32 0
ret i8* %.tmp6106
br label %.if.end.6104
.if.false.6104:
%.tmp6107 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6108 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6107, i32 0, i32 1
%.tmp6109 = load i8*, i8** %.tmp6108
%.tmp6111 = getelementptr [3 x i8], [3 x i8]*@.str6110, i32 0, i32 0
%.tmp6112 = call i32(i8*,i8*) @strcmp(i8* %.tmp6109, i8* %.tmp6111)
%.tmp6113 = icmp eq i32 %.tmp6112, 0
br i1 %.tmp6113, label %.if.true.6114, label %.if.false.6114
.if.true.6114:
%.tmp6116 = getelementptr [9 x i8], [9 x i8]*@.str6115, i32 0, i32 0
ret i8* %.tmp6116
br label %.if.end.6114
.if.false.6114:
%.tmp6117 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6118 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6117, i32 0, i32 1
%.tmp6119 = load i8*, i8** %.tmp6118
%.tmp6121 = getelementptr [3 x i8], [3 x i8]*@.str6120, i32 0, i32 0
%.tmp6122 = call i32(i8*,i8*) @strcmp(i8* %.tmp6119, i8* %.tmp6121)
%.tmp6123 = icmp eq i32 %.tmp6122, 0
br i1 %.tmp6123, label %.if.true.6124, label %.if.false.6124
.if.true.6124:
%.tmp6126 = getelementptr [9 x i8], [9 x i8]*@.str6125, i32 0, i32 0
ret i8* %.tmp6126
br label %.if.end.6124
.if.false.6124:
%.tmp6127 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6128 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6130 = getelementptr [30 x i8], [30 x i8]*@.str6129, i32 0, i32 0
%.tmp6131 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6127, %m307$.Node.type* %.tmp6128, i8* %.tmp6130)
%.tmp6132 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6133 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6132, i32 0, i32 1
%.tmp6134 = load i8*, i8** %.tmp6133
%.tmp6135 = call i32(i8*,...) @printf(i8* %.tmp6131, i8* %.tmp6134)
br label %.if.end.6124
.if.end.6124:
br label %.if.end.6114
.if.end.6114:
br label %.if.end.6104
.if.end.6104:
br label %.if.end.6094
.if.end.6094:
br label %.if.end.6084
.if.end.6084:
br label %.if.end.6074
.if.end.6074:
br label %.if.end.6064
.if.end.6064:
br label %.if.end.6054
.if.end.6054:
br label %.if.end.6044
.if.end.6044:
br label %.if.end.6034
.if.end.6034:
br label %.if.end.6024
.if.end.6024:
br label %.if.end.6014
.if.end.6014:
%.tmp6137 = getelementptr [4 x i8], [4 x i8]*@.str6136, i32 0, i32 0
ret i8* %.tmp6137
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6138 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6139 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6138, %m1861$.Type.type** %type.6139
%.tmp6140 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6141 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6140, i32 0, i32 1
%.tmp6142 = load i8*, i8** %.tmp6141
%.tmp6144 = getelementptr [3 x i8], [3 x i8]*@.str6143, i32 0, i32 0
%.tmp6145 = call i32(i8*,i8*) @strcmp(i8* %.tmp6142, i8* %.tmp6144)
%.tmp6146 = icmp eq i32 %.tmp6145, 0
%.tmp6147 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6148 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6147, i32 0, i32 1
%.tmp6149 = load i8*, i8** %.tmp6148
%.tmp6151 = getelementptr [3 x i8], [3 x i8]*@.str6150, i32 0, i32 0
%.tmp6152 = call i32(i8*,i8*) @strcmp(i8* %.tmp6149, i8* %.tmp6151)
%.tmp6153 = icmp eq i32 %.tmp6152, 0
%.tmp6154 = or i1 %.tmp6146, %.tmp6153
%.tmp6155 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6156 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6155, i32 0, i32 1
%.tmp6157 = load i8*, i8** %.tmp6156
%.tmp6159 = getelementptr [2 x i8], [2 x i8]*@.str6158, i32 0, i32 0
%.tmp6160 = call i32(i8*,i8*) @strcmp(i8* %.tmp6157, i8* %.tmp6159)
%.tmp6161 = icmp eq i32 %.tmp6160, 0
%.tmp6162 = or i1 %.tmp6154, %.tmp6161
%.tmp6163 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6164 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6163, i32 0, i32 1
%.tmp6165 = load i8*, i8** %.tmp6164
%.tmp6167 = getelementptr [2 x i8], [2 x i8]*@.str6166, i32 0, i32 0
%.tmp6168 = call i32(i8*,i8*) @strcmp(i8* %.tmp6165, i8* %.tmp6167)
%.tmp6169 = icmp eq i32 %.tmp6168, 0
%.tmp6170 = or i1 %.tmp6162, %.tmp6169
%.tmp6171 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6172 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6171, i32 0, i32 1
%.tmp6173 = load i8*, i8** %.tmp6172
%.tmp6175 = getelementptr [2 x i8], [2 x i8]*@.str6174, i32 0, i32 0
%.tmp6176 = call i32(i8*,i8*) @strcmp(i8* %.tmp6173, i8* %.tmp6175)
%.tmp6177 = icmp eq i32 %.tmp6176, 0
%.tmp6178 = or i1 %.tmp6170, %.tmp6177
%.tmp6179 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6179, i32 0, i32 1
%.tmp6181 = load i8*, i8** %.tmp6180
%.tmp6183 = getelementptr [2 x i8], [2 x i8]*@.str6182, i32 0, i32 0
%.tmp6184 = call i32(i8*,i8*) @strcmp(i8* %.tmp6181, i8* %.tmp6183)
%.tmp6185 = icmp eq i32 %.tmp6184, 0
%.tmp6186 = or i1 %.tmp6178, %.tmp6185
%.tmp6187 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6188 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6187, i32 0, i32 1
%.tmp6189 = load i8*, i8** %.tmp6188
%.tmp6191 = getelementptr [3 x i8], [3 x i8]*@.str6190, i32 0, i32 0
%.tmp6192 = call i32(i8*,i8*) @strcmp(i8* %.tmp6189, i8* %.tmp6191)
%.tmp6193 = icmp eq i32 %.tmp6192, 0
%.tmp6194 = or i1 %.tmp6186, %.tmp6193
%.tmp6195 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6195, i32 0, i32 1
%.tmp6197 = load i8*, i8** %.tmp6196
%.tmp6199 = getelementptr [3 x i8], [3 x i8]*@.str6198, i32 0, i32 0
%.tmp6200 = call i32(i8*,i8*) @strcmp(i8* %.tmp6197, i8* %.tmp6199)
%.tmp6201 = icmp eq i32 %.tmp6200, 0
%.tmp6202 = or i1 %.tmp6194, %.tmp6201
br i1 %.tmp6202, label %.if.true.6203, label %.if.false.6203
.if.true.6203:
%.tmp6204 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6139
%.tmp6205 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6204, i32 0, i32 0
%.tmp6207 = getelementptr [5 x i8], [5 x i8]*@.str6206, i32 0, i32 0
store i8* %.tmp6207, i8** %.tmp6205
br label %.if.end.6203
.if.false.6203:
%.tmp6208 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6139
%.tmp6209 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6208, i32 0, i32 0
%.tmp6211 = getelementptr [4 x i8], [4 x i8]*@.str6210, i32 0, i32 0
store i8* %.tmp6211, i8** %.tmp6209
br label %.if.end.6203
.if.end.6203:
%.tmp6212 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6139
ret %m1861$.Type.type* %.tmp6212
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6213 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6214 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6213, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6215 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6216 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6215, %m307$.Node.type** %mono.6216
%err_buf.6217 = alloca i8*
store i8* null, i8** %err_buf.6217
%buf.6218 = alloca i8*
store i8* null, i8** %buf.6218
%.tmp6219 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6220 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6219, i32 0, i32 6
%.tmp6221 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6220
%.tmp6222 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6221, i32 0, i32 0
%.tmp6223 = load i8*, i8** %.tmp6222
%.tmp6225 = getelementptr [7 x i8], [7 x i8]*@.str6224, i32 0, i32 0
%.tmp6226 = call i32(i8*,i8*) @strcmp(i8* %.tmp6223, i8* %.tmp6225)
%.tmp6227 = icmp eq i32 %.tmp6226, 0
br i1 %.tmp6227, label %.if.true.6228, label %.if.false.6228
.if.true.6228:
%.tmp6229 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6230 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6229)
store %m1861$.AssignableInfo.type* %.tmp6230, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6231 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6232 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6231, i32 0, i32 3
%.tmp6233 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6233, %m1861$.Type.type** %.tmp6232
%.tmp6234 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6235 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6234, i32 0, i32 3
%.tmp6236 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6235
%.tmp6237 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6236, i32 0, i32 0
%.tmp6239 = getelementptr [4 x i8], [4 x i8]*@.str6238, i32 0, i32 0
store i8* %.tmp6239, i8** %.tmp6237
%.tmp6240 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6241 = load i8, i8* @SCOPE_CONST
%.tmp6242 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6243 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6242, i32 0, i32 6
%.tmp6244 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6243
%.tmp6245 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6244, i32 0, i32 1
%.tmp6246 = load i8*, i8** %.tmp6245
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6240, i8 %.tmp6241, i8* %.tmp6246)
br label %.if.end.6228
.if.false.6228:
%.tmp6247 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6248 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6247, i32 0, i32 6
%.tmp6249 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6248
%.tmp6250 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6249, i32 0, i32 0
%.tmp6251 = load i8*, i8** %.tmp6250
%.tmp6253 = getelementptr [5 x i8], [5 x i8]*@.str6252, i32 0, i32 0
%.tmp6254 = call i32(i8*,i8*) @strcmp(i8* %.tmp6251, i8* %.tmp6253)
%.tmp6255 = icmp eq i32 %.tmp6254, 0
br i1 %.tmp6255, label %.if.true.6256, label %.if.false.6256
.if.true.6256:
%.tmp6257 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6258 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6257, i32 0, i32 6
%.tmp6259 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6258
%.tmp6260 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6259, i32 0, i32 1
%.tmp6261 = load i8*, i8** %.tmp6260
%.tmp6263 = getelementptr [5 x i8], [5 x i8]*@.str6262, i32 0, i32 0
%.tmp6264 = call i32(i8*,i8*) @strcmp(i8* %.tmp6261, i8* %.tmp6263)
%.tmp6265 = icmp ne i32 %.tmp6264, 0
br i1 %.tmp6265, label %.if.true.6266, label %.if.false.6266
.if.true.6266:
%.tmp6267 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6268 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6270 = getelementptr [42 x i8], [42 x i8]*@.str6269, i32 0, i32 0
%.tmp6271 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6267, %m307$.Node.type* %.tmp6268, i8* %.tmp6270)
%.tmp6272 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6273 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6272, i32 0, i32 6
%.tmp6274 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6273
%.tmp6275 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6274, i32 0, i32 1
%.tmp6276 = load i8*, i8** %.tmp6275
%.tmp6277 = call i32(i8*,...) @printf(i8* %.tmp6271, i8* %.tmp6276)
%.tmp6278 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6278
br label %.if.end.6266
.if.false.6266:
br label %.if.end.6266
.if.end.6266:
%.tmp6279 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6280 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6279)
store %m1861$.AssignableInfo.type* %.tmp6280, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6281 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6282 = load i8, i8* @SCOPE_CONST
%.tmp6284 = getelementptr [5 x i8], [5 x i8]*@.str6283, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6281, i8 %.tmp6282, i8* %.tmp6284)
%.tmp6285 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6286 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6285, i32 0, i32 3
%.tmp6287 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6287, %m1861$.Type.type** %.tmp6286
%.tmp6288 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6289 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6288, i32 0, i32 3
%.tmp6290 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6289
%.tmp6291 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6290, i32 0, i32 0
%.tmp6293 = getelementptr [8 x i8], [8 x i8]*@.str6292, i32 0, i32 0
store i8* %.tmp6293, i8** %.tmp6291
br label %.if.end.6256
.if.false.6256:
%.tmp6294 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6295 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6294, i32 0, i32 6
%.tmp6296 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6295
%.tmp6297 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6296, i32 0, i32 0
%.tmp6298 = load i8*, i8** %.tmp6297
%.tmp6300 = getelementptr [17 x i8], [17 x i8]*@.str6299, i32 0, i32 0
%.tmp6301 = call i32(i8*,i8*) @strcmp(i8* %.tmp6298, i8* %.tmp6300)
%.tmp6302 = icmp eq i32 %.tmp6301, 0
br i1 %.tmp6302, label %.if.true.6303, label %.if.false.6303
.if.true.6303:
%.tmp6304 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6305 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6304)
store %m1861$.AssignableInfo.type* %.tmp6305, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6306 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6307 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6306, i32 0, i32 6
%.tmp6308 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6307
%.tmp6309 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6308, i32 0, i32 6
%.tmp6310 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6309
%.tmp6312 = getelementptr [12 x i8], [12 x i8]*@.str6311, i32 0, i32 0
%.tmp6313 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6310, i8* %.tmp6312)
%dest.6314 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6313, %m307$.Node.type** %dest.6314
%.tmp6315 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6316 = load %m307$.Node.type*, %m307$.Node.type** %dest.6314
%.tmp6317 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6315, %m307$.Node.type* %.tmp6316)
%var_info.6318 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6317, %m1861$.AssignableInfo.type** %var_info.6318
%.tmp6319 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6318
%.tmp6320 = icmp eq %m1861$.AssignableInfo.type* %.tmp6319, null
br i1 %.tmp6320, label %.if.true.6321, label %.if.false.6321
.if.true.6321:
%.tmp6322 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
ret %m1861$.AssignableInfo.type* %.tmp6322
br label %.if.end.6321
.if.false.6321:
br label %.if.end.6321
.if.end.6321:
%.tmp6323 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6324 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6318
%.tmp6325 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6324, i32 0, i32 3
%.tmp6326 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6325
%.tmp6327 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6323, %m1861$.Type.type* %.tmp6326)
%var_type_repr.6328 = alloca i8*
store i8* %.tmp6327, i8** %var_type_repr.6328
%.tmp6329 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6330 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6329, %m1861$.AssignableInfo.type* %.tmp6330)
%.tmp6331 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6332 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6331, i32 0, i32 3
%.tmp6333 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6318
%.tmp6334 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6333, i32 0, i32 3
%.tmp6335 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6334
store %m1861$.Type.type* %.tmp6335, %m1861$.Type.type** %.tmp6332
%.tmp6337 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6338 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6337, i32 0, i32 6
%.tmp6339 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6338
%.tmp6340 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6339, i32 0, i32 6
%.tmp6341 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6340
%ptr.6342 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6341, %m307$.Node.type** %ptr.6342
br label %.for.start.6336
.for.start.6336:
%.tmp6343 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6342
%.tmp6344 = load %m307$.Node.type*, %m307$.Node.type** %dest.6314
%.tmp6345 = icmp ne %m307$.Node.type* %.tmp6343, %.tmp6344
br i1 %.tmp6345, label %.for.continue.6336, label %.for.end.6336
.for.continue.6336:
%.tmp6346 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6347 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6346, %m1861$.Type.type** %type.6347
%.tmp6348 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6347
%.tmp6349 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6348, i32 0, i32 3
%.tmp6350 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6351 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6350, i32 0, i32 3
%.tmp6352 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6351
store %m1861$.Type.type* %.tmp6352, %m1861$.Type.type** %.tmp6349
%.tmp6353 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6347
%.tmp6354 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6353, i32 0, i32 0
%.tmp6356 = getelementptr [4 x i8], [4 x i8]*@.str6355, i32 0, i32 0
store i8* %.tmp6356, i8** %.tmp6354
%.tmp6357 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6358 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6357, i32 0, i32 3
%.tmp6359 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6347
store %m1861$.Type.type* %.tmp6359, %m1861$.Type.type** %.tmp6358
%.tmp6360 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6342
%.tmp6361 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6360, i32 0, i32 7
%.tmp6362 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6361
store %m307$.Node.type* %.tmp6362, %m307$.Node.type** %ptr.6342
br label %.for.start.6336
.for.end.6336:
%.tmp6363 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6364 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6363, i32 0, i32 6
%.tmp6365 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6364
%.tmp6366 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6365, i32 0, i32 6
%.tmp6367 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6366
%.tmp6368 = load %m307$.Node.type*, %m307$.Node.type** %dest.6314
%.tmp6369 = icmp ne %m307$.Node.type* %.tmp6367, %.tmp6368
br i1 %.tmp6369, label %.if.true.6370, label %.if.false.6370
.if.true.6370:
%.tmp6371 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6372 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6371, i32 0, i32 1
%.tmp6373 = load %m0$.File.type*, %m0$.File.type** %.tmp6372
%.tmp6375 = getelementptr [38 x i8], [38 x i8]*@.str6374, i32 0, i32 0
%.tmp6376 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6377 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6376)
%.tmp6378 = load i8*, i8** %var_type_repr.6328
%.tmp6379 = load i8*, i8** %var_type_repr.6328
%.tmp6380 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6318
%.tmp6381 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6380)
%.tmp6382 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6373, i8* %.tmp6375, i8* %.tmp6377, i8* %.tmp6378, i8* %.tmp6379, i8* %.tmp6381)
br label %.if.end.6370
.if.false.6370:
%.tmp6383 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6384 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6383, i32 0, i32 1
%.tmp6385 = load %m0$.File.type*, %m0$.File.type** %.tmp6384
%.tmp6387 = getelementptr [22 x i8], [22 x i8]*@.str6386, i32 0, i32 0
%.tmp6388 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6389 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6388)
%.tmp6390 = load i8*, i8** %var_type_repr.6328
%.tmp6391 = load i8*, i8** %var_type_repr.6328
%.tmp6392 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6318
%.tmp6393 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6392)
%.tmp6394 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6385, i8* %.tmp6387, i8* %.tmp6389, i8* %.tmp6390, i8* %.tmp6391, i8* %.tmp6393)
br label %.if.end.6370
.if.end.6370:
br label %.if.end.6303
.if.false.6303:
%.tmp6395 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6396 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6395, i32 0, i32 6
%.tmp6397 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6396
%.tmp6398 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6397, i32 0, i32 0
%.tmp6399 = load i8*, i8** %.tmp6398
%.tmp6401 = getelementptr [8 x i8], [8 x i8]*@.str6400, i32 0, i32 0
%.tmp6402 = call i32(i8*,i8*) @strcmp(i8* %.tmp6399, i8* %.tmp6401)
%.tmp6403 = icmp eq i32 %.tmp6402, 0
br i1 %.tmp6403, label %.if.true.6404, label %.if.false.6404
.if.true.6404:
%.tmp6405 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6406 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6405)
store %m1861$.AssignableInfo.type* %.tmp6406, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6407 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6408 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6407, i32 0, i32 3
%.tmp6409 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6409, %m1861$.Type.type** %.tmp6408
%.tmp6410 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6411 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6410, i32 0, i32 3
%.tmp6412 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6411
%.tmp6413 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6412, i32 0, i32 0
%.tmp6415 = getelementptr [5 x i8], [5 x i8]*@.str6414, i32 0, i32 0
store i8* %.tmp6415, i8** %.tmp6413
%.tmp6416 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6417 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6416, i32 0, i32 6
%.tmp6418 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6417
%.tmp6419 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6418, i32 0, i32 6
%.tmp6420 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6419
%.tmp6421 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6420, i32 0, i32 1
%.tmp6422 = load i8*, i8** %.tmp6421
%.tmp6424 = getelementptr [6 x i8], [6 x i8]*@.str6423, i32 0, i32 0
%.tmp6425 = call i32(i8*,i8*) @strcmp(i8* %.tmp6422, i8* %.tmp6424)
%.tmp6426 = icmp eq i32 %.tmp6425, 0
br i1 %.tmp6426, label %.if.true.6427, label %.if.false.6427
.if.true.6427:
%.tmp6428 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6429 = load i8, i8* @SCOPE_CONST
%.tmp6431 = getelementptr [2 x i8], [2 x i8]*@.str6430, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6428, i8 %.tmp6429, i8* %.tmp6431)
br label %.if.end.6427
.if.false.6427:
%.tmp6432 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6433 = load i8, i8* @SCOPE_CONST
%.tmp6435 = getelementptr [2 x i8], [2 x i8]*@.str6434, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6432, i8 %.tmp6433, i8* %.tmp6435)
br label %.if.end.6427
.if.end.6427:
br label %.if.end.6404
.if.false.6404:
%.tmp6436 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6437 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6436, i32 0, i32 6
%.tmp6438 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6437
%.tmp6439 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6438, i32 0, i32 0
%.tmp6440 = load i8*, i8** %.tmp6439
%.tmp6442 = getelementptr [8 x i8], [8 x i8]*@.str6441, i32 0, i32 0
%.tmp6443 = call i32(i8*,i8*) @strcmp(i8* %.tmp6440, i8* %.tmp6442)
%.tmp6444 = icmp eq i32 %.tmp6443, 0
br i1 %.tmp6444, label %.if.true.6445, label %.if.false.6445
.if.true.6445:
%.tmp6446 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6447 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6448 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6447, i32 0, i32 6
%.tmp6449 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6448
%.tmp6450 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6449, i32 0, i32 6
%.tmp6451 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6450
%.tmp6452 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6446, %m307$.Node.type* %.tmp6451)
store %m1861$.AssignableInfo.type* %.tmp6452, %m1861$.AssignableInfo.type** %assignable_info.6214
br label %.if.end.6445
.if.false.6445:
%.tmp6453 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6454 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6453, i32 0, i32 6
%.tmp6455 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6454
%.tmp6456 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6455, i32 0, i32 0
%.tmp6457 = load i8*, i8** %.tmp6456
%.tmp6459 = getelementptr [7 x i8], [7 x i8]*@.str6458, i32 0, i32 0
%.tmp6460 = call i32(i8*,i8*) @strcmp(i8* %.tmp6457, i8* %.tmp6459)
%.tmp6461 = icmp eq i32 %.tmp6460, 0
br i1 %.tmp6461, label %.if.true.6462, label %.if.false.6462
.if.true.6462:
%.tmp6463 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6464 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6465 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6464, i32 0, i32 6
%.tmp6466 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6465
%.tmp6467 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6466, i32 0, i32 1
%.tmp6468 = load i8*, i8** %.tmp6467
%.tmp6469 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp6463, i8* %.tmp6468)
%string_info.6470 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6469, %m1861$.AssignableInfo.type** %string_info.6470
%.tmp6471 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6472 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6471)
store %m1861$.AssignableInfo.type* %.tmp6472, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6473 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6474 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6473, %m1861$.AssignableInfo.type* %.tmp6474)
%.tmp6475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6476 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6470
%.tmp6477 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6476, i32 0, i32 3
%.tmp6478 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6477
%.tmp6479 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6475, %m1861$.Type.type* %.tmp6478)
%str_tr.6480 = alloca i8*
store i8* %.tmp6479, i8** %str_tr.6480
%.tmp6481 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6482 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6481, i32 0, i32 1
%.tmp6483 = load %m0$.File.type*, %m0$.File.type** %.tmp6482
%.tmp6485 = getelementptr [44 x i8], [44 x i8]*@.str6484, i32 0, i32 0
%.tmp6486 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6487 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6486)
%.tmp6488 = load i8*, i8** %str_tr.6480
%.tmp6489 = load i8*, i8** %str_tr.6480
%.tmp6490 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6470
%.tmp6491 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6490)
%.tmp6492 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6483, i8* %.tmp6485, i8* %.tmp6487, i8* %.tmp6488, i8* %.tmp6489, i8* %.tmp6491)
%.tmp6493 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6494 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6493, i32 0, i32 3
%.tmp6495 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6495, %m1861$.Type.type** %.tmp6494
%.tmp6496 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6497 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6496, i32 0, i32 3
%.tmp6498 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6497
%.tmp6499 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6498, i32 0, i32 0
%.tmp6501 = getelementptr [4 x i8], [4 x i8]*@.str6500, i32 0, i32 0
store i8* %.tmp6501, i8** %.tmp6499
%.tmp6502 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6503 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6502, i32 0, i32 3
%.tmp6504 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6503
%.tmp6505 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6504, i32 0, i32 3
%.tmp6506 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6506, %m1861$.Type.type** %.tmp6505
%.tmp6507 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6508 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6507, i32 0, i32 3
%.tmp6509 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6508
%.tmp6510 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6509, i32 0, i32 3
%.tmp6511 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6510
%.tmp6512 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6511, i32 0, i32 0
%.tmp6514 = getelementptr [4 x i8], [4 x i8]*@.str6513, i32 0, i32 0
store i8* %.tmp6514, i8** %.tmp6512
br label %.if.end.6462
.if.false.6462:
%.tmp6515 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6516 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6515, i32 0, i32 6
%.tmp6517 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6516
%.tmp6518 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6517, i32 0, i32 0
%.tmp6519 = load i8*, i8** %.tmp6518
%.tmp6521 = getelementptr [4 x i8], [4 x i8]*@.str6520, i32 0, i32 0
%.tmp6522 = call i32(i8*,i8*) @strcmp(i8* %.tmp6519, i8* %.tmp6521)
%.tmp6523 = icmp eq i32 %.tmp6522, 0
br i1 %.tmp6523, label %.if.true.6524, label %.if.false.6524
.if.true.6524:
%.tmp6525 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6526 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6525)
store %m1861$.AssignableInfo.type* %.tmp6526, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6527 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6528 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6527, i32 0, i32 6
%.tmp6529 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6528
%.tmp6530 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6529, i32 0, i32 1
%.tmp6531 = load i8*, i8** %.tmp6530
%.tmp6532 = call i32(i8*) @strlen(i8* %.tmp6531)
%chr_len.6533 = alloca i32
store i32 %.tmp6532, i32* %chr_len.6533
%.tmp6534 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6535 = load i8, i8* @SCOPE_CONST
%.tmp6537 = getelementptr [2 x i8], [2 x i8]*@.str6536, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6534, i8 %.tmp6535, i8* %.tmp6537)
%.tmp6538 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6539 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6538, i32 0, i32 0
%.tmp6540 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6541 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6540, i32 0, i32 6
%.tmp6542 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6541
%.tmp6543 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6542, i32 0, i32 1
%.tmp6544 = load i8*, i8** %.tmp6543
%.tmp6545 = call i8*(i8*) @m2225$chr_to_llvm.cp.cp(i8* %.tmp6544)
store i8* %.tmp6545, i8** %.tmp6539
%.tmp6546 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6547 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6546, i32 0, i32 0
%.tmp6548 = load i8*, i8** %.tmp6547
%.tmp6549 = icmp eq i8* %.tmp6548, null
br i1 %.tmp6549, label %.if.true.6550, label %.if.false.6550
.if.true.6550:
%.tmp6551 = getelementptr i8*, i8** %err_buf.6217, i32 0
%.tmp6553 = getelementptr [22 x i8], [22 x i8]*@.str6552, i32 0, i32 0
%.tmp6554 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6555 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6554, i32 0, i32 6
%.tmp6556 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6555
%.tmp6557 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6556, i32 0, i32 1
%.tmp6558 = load i8*, i8** %.tmp6557
%.tmp6559 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6551, i8* %.tmp6553, i8* %.tmp6558)
%.tmp6560 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6560
br label %.if.end.6550
.if.false.6550:
br label %.if.end.6550
.if.end.6550:
%.tmp6561 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6562 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6561, i32 0, i32 3
%.tmp6563 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6563, %m1861$.Type.type** %.tmp6562
%.tmp6564 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6565 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6564, i32 0, i32 3
%.tmp6566 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6565
%.tmp6567 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6566, i32 0, i32 0
%.tmp6569 = getelementptr [4 x i8], [4 x i8]*@.str6568, i32 0, i32 0
store i8* %.tmp6569, i8** %.tmp6567
br label %.if.end.6524
.if.false.6524:
%.tmp6570 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6571 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6573 = getelementptr [40 x i8], [40 x i8]*@.str6572, i32 0, i32 0
%.tmp6574 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6570, %m307$.Node.type* %.tmp6571, i8* %.tmp6573)
%.tmp6575 = load %m307$.Node.type*, %m307$.Node.type** %mono.6216
%.tmp6576 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6575, i32 0, i32 6
%.tmp6577 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6576
%.tmp6578 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6577, i32 0, i32 0
%.tmp6579 = load i8*, i8** %.tmp6578
%.tmp6580 = call i32(i8*,...) @printf(i8* %.tmp6574, i8* %.tmp6579)
%.tmp6581 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6581
br label %.if.end.6524
.if.end.6524:
br label %.if.end.6462
.if.end.6462:
br label %.if.end.6445
.if.end.6445:
br label %.if.end.6404
.if.end.6404:
br label %.if.end.6303
.if.end.6303:
br label %.if.end.6256
.if.end.6256:
br label %.if.end.6228
.if.end.6228:
%.tmp6582 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6583 = icmp eq %m1861$.AssignableInfo.type* %.tmp6582, null
br i1 %.tmp6583, label %.if.true.6584, label %.if.false.6584
.if.true.6584:
%.tmp6585 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6585
br label %.if.end.6584
.if.false.6584:
br label %.if.end.6584
.if.end.6584:
%.tmp6586 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6587 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6586, i32 0, i32 4
%.tmp6588 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6589 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6588, i32 0, i32 3
%.tmp6590 = load i32, i32* %.tmp6589
store i32 %.tmp6590, i32* %.tmp6587
%.tmp6591 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6592 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6591, i32 0, i32 5
%.tmp6593 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6594 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6593, i32 0, i32 4
%.tmp6595 = load i32, i32* %.tmp6594
store i32 %.tmp6595, i32* %.tmp6592
%.tmp6596 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6214
%.tmp6597 = bitcast %m1861$.AssignableInfo.type* %.tmp6596 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6597
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp6598 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6599 = icmp ne %m1861$.Type.type* %.tmp6598, null
%.tmp6601 = getelementptr [22 x i8], [22 x i8]*@.str6600, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6599, i8* %.tmp6601)
%.tmp6602 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6603 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6602, i32 0, i32 0
%.tmp6604 = load i8*, i8** %.tmp6603
%.tmp6605 = icmp ne i8* %.tmp6604, null
%.tmp6607 = getelementptr [59 x i8], [59 x i8]*@.str6606, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6605, i8* %.tmp6607)
%.tmp6608 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6609 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6608, i32 0, i32 0
%.tmp6610 = load i8*, i8** %.tmp6609
%.tmp6612 = getelementptr [4 x i8], [4 x i8]*@.str6611, i32 0, i32 0
%.tmp6613 = call i32(i8*,i8*) @strcmp(i8* %.tmp6610, i8* %.tmp6612)
%.tmp6614 = icmp eq i32 %.tmp6613, 0
br i1 %.tmp6614, label %.if.true.6615, label %.if.false.6615
.if.true.6615:
%.tmp6617 = getelementptr [2 x i8], [2 x i8]*@.str6616, i32 0, i32 0
ret i8* %.tmp6617
br label %.if.end.6615
.if.false.6615:
%.tmp6618 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6619 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6618, i32 0, i32 0
%.tmp6620 = load i8*, i8** %.tmp6619
%.tmp6622 = getelementptr [5 x i8], [5 x i8]*@.str6621, i32 0, i32 0
%.tmp6623 = call i32(i8*,i8*) @strcmp(i8* %.tmp6620, i8* %.tmp6622)
%.tmp6624 = icmp eq i32 %.tmp6623, 0
br i1 %.tmp6624, label %.if.true.6625, label %.if.false.6625
.if.true.6625:
%.tmp6627 = getelementptr [2 x i8], [2 x i8]*@.str6626, i32 0, i32 0
ret i8* %.tmp6627
br label %.if.end.6625
.if.false.6625:
%.tmp6628 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6629 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6628, i32 0, i32 0
%.tmp6630 = load i8*, i8** %.tmp6629
%.tmp6632 = getelementptr [5 x i8], [5 x i8]*@.str6631, i32 0, i32 0
%.tmp6633 = call i32(i8*,i8*) @strcmp(i8* %.tmp6630, i8* %.tmp6632)
%.tmp6634 = icmp eq i32 %.tmp6633, 0
br i1 %.tmp6634, label %.if.true.6635, label %.if.false.6635
.if.true.6635:
%.tmp6637 = getelementptr [2 x i8], [2 x i8]*@.str6636, i32 0, i32 0
ret i8* %.tmp6637
br label %.if.end.6635
.if.false.6635:
%.tmp6638 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6639 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6638, i32 0, i32 0
%.tmp6640 = load i8*, i8** %.tmp6639
%.tmp6642 = getelementptr [4 x i8], [4 x i8]*@.str6641, i32 0, i32 0
%.tmp6643 = call i32(i8*,i8*) @strcmp(i8* %.tmp6640, i8* %.tmp6642)
%.tmp6644 = icmp eq i32 %.tmp6643, 0
br i1 %.tmp6644, label %.if.true.6645, label %.if.false.6645
.if.true.6645:
%.tmp6647 = getelementptr [2 x i8], [2 x i8]*@.str6646, i32 0, i32 0
ret i8* %.tmp6647
br label %.if.end.6645
.if.false.6645:
%.tmp6648 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6649 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6648, i32 0, i32 0
%.tmp6650 = load i8*, i8** %.tmp6649
%.tmp6652 = getelementptr [4 x i8], [4 x i8]*@.str6651, i32 0, i32 0
%.tmp6653 = call i32(i8*,i8*) @strcmp(i8* %.tmp6650, i8* %.tmp6652)
%.tmp6654 = icmp eq i32 %.tmp6653, 0
br i1 %.tmp6654, label %.if.true.6655, label %.if.false.6655
.if.true.6655:
%buf.6656 = alloca i8*
store i8* null, i8** %buf.6656
%.tmp6657 = getelementptr i8*, i8** %buf.6656, i32 0
%.tmp6659 = getelementptr [4 x i8], [4 x i8]*@.str6658, i32 0, i32 0
%.tmp6660 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6661 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6660, i32 0, i32 3
%.tmp6662 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6661
%.tmp6663 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp6662)
%.tmp6664 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6657, i8* %.tmp6659, i8* %.tmp6663)
%.tmp6665 = load i8*, i8** %buf.6656
ret i8* %.tmp6665
br label %.if.end.6655
.if.false.6655:
%.tmp6666 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6667 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6666, i32 0, i32 0
%.tmp6668 = load i8*, i8** %.tmp6667
%.tmp6670 = getelementptr [10 x i8], [10 x i8]*@.str6669, i32 0, i32 0
%.tmp6671 = call i32(i8*,i8*) @strcmp(i8* %.tmp6668, i8* %.tmp6670)
%.tmp6672 = icmp eq i32 %.tmp6671, 0
br i1 %.tmp6672, label %.if.true.6673, label %.if.false.6673
.if.true.6673:
%.tmp6674 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6675 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6674, i32 0, i32 2
%.tmp6676 = load i8*, i8** %.tmp6675
ret i8* %.tmp6676
br label %.if.end.6673
.if.false.6673:
%.tmp6677 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6678 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6677, i32 0, i32 0
%.tmp6679 = load i8*, i8** %.tmp6678
%.tmp6681 = getelementptr [6 x i8], [6 x i8]*@.str6680, i32 0, i32 0
%.tmp6682 = call i32(i8*,i8*) @strcmp(i8* %.tmp6679, i8* %.tmp6681)
%.tmp6683 = icmp eq i32 %.tmp6682, 0
br i1 %.tmp6683, label %.if.true.6684, label %.if.false.6684
.if.true.6684:
%.tmp6686 = getelementptr [2 x i8], [2 x i8]*@.str6685, i32 0, i32 0
ret i8* %.tmp6686
br label %.if.end.6684
.if.false.6684:
%.tmp6688 = getelementptr [44 x i8], [44 x i8]*@.str6687, i32 0, i32 0
%.tmp6689 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6690 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6689, i32 0, i32 0
%.tmp6691 = load i8*, i8** %.tmp6690
%.tmp6692 = call i32(i8*,...) @printf(i8* %.tmp6688, i8* %.tmp6691)
br label %.if.end.6684
.if.end.6684:
br label %.if.end.6673
.if.end.6673:
br label %.if.end.6655
.if.end.6655:
br label %.if.end.6645
.if.end.6645:
br label %.if.end.6635
.if.end.6635:
br label %.if.end.6625
.if.end.6625:
br label %.if.end.6615
.if.end.6615:
%.tmp6693 = bitcast ptr null to i8*
ret i8* %.tmp6693
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp6694 = bitcast ptr null to %m307$.Node.type*
%.tmp6695 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6694)
%info.6696 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6695, %m1861$.AssignableInfo.type** %info.6696
%tmp_buff.6697 = alloca i8*
store i8* null, i8** %tmp_buff.6697
%.tmp6698 = getelementptr i8*, i8** %tmp_buff.6697, i32 0
%.tmp6700 = getelementptr [7 x i8], [7 x i8]*@.str6699, i32 0, i32 0
%.tmp6701 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6702 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6701)
%.tmp6703 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6698, i8* %.tmp6700, i32 %.tmp6702)
%.tmp6704 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6705 = load i8, i8* @SCOPE_GLOBAL
%.tmp6706 = load i8*, i8** %tmp_buff.6697
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6704, i8 %.tmp6705, i8* %.tmp6706)
%.tmp6707 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp6708 = ptrtoint %m1861$.GlobalName.type* %.tmp6707 to i32
%.tmp6709 = call i8*(i32) @malloc(i32 %.tmp6708)
%.tmp6710 = bitcast i8* %.tmp6709 to %m1861$.GlobalName.type*
%global.6711 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp6710, %m1861$.GlobalName.type** %global.6711
%.tmp6712 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
%.tmp6713 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6712, i32 0, i32 0
%.tmp6714 = load i8*, i8** %text
%.tmp6715 = call i8*(i8*) @m2225$string_to_llvm.cp.cp(i8* %.tmp6714)
store i8* %.tmp6715, i8** %.tmp6713
%.tmp6716 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6717 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6716, i32 0, i32 3
%.tmp6718 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6718, %m1861$.Type.type** %.tmp6717
%.tmp6719 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6720 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6719, i32 0, i32 3
%.tmp6721 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6720
%.tmp6722 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6721, i32 0, i32 0
%.tmp6724 = getelementptr [6 x i8], [6 x i8]*@.str6723, i32 0, i32 0
store i8* %.tmp6724, i8** %.tmp6722
%.tmp6725 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6726 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6725, i32 0, i32 3
%.tmp6727 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6726
%.tmp6728 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6727, i32 0, i32 3
%.tmp6729 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6729, %m1861$.Type.type** %.tmp6728
%.tmp6730 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6731 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6730, i32 0, i32 3
%.tmp6732 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6731
%.tmp6733 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6732, i32 0, i32 3
%.tmp6734 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6733
%.tmp6735 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6734, i32 0, i32 0
%.tmp6737 = getelementptr [4 x i8], [4 x i8]*@.str6736, i32 0, i32 0
store i8* %.tmp6737, i8** %.tmp6735
%.tmp6738 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6739 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6738, i32 0, i32 3
%.tmp6740 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6739
%.tmp6741 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6740, i32 0, i32 3
%.tmp6742 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6741
%.tmp6743 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6742, i32 0, i32 4
%.tmp6744 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6744, %m1861$.Type.type** %.tmp6743
%.tmp6745 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
%.tmp6746 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6745, i32 0, i32 3
%.tmp6747 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6746
%.tmp6748 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6747, i32 0, i32 3
%.tmp6749 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6748
%.tmp6750 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6749, i32 0, i32 4
%.tmp6751 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6750
%.tmp6752 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6751, i32 0, i32 0
%.tmp6753 = getelementptr i8*, i8** %.tmp6752, i32 0
%.tmp6755 = getelementptr [3 x i8], [3 x i8]*@.str6754, i32 0, i32 0
%.tmp6756 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
%.tmp6757 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6756, i32 0, i32 0
%.tmp6758 = load i8*, i8** %.tmp6757
%.tmp6759 = call i32(i8*) @m2225$llvm_str_len.i.cp(i8* %.tmp6758)
%.tmp6760 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6753, i8* %.tmp6755, i32 %.tmp6759)
%.tmp6761 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
%.tmp6762 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6761, i32 0, i32 1
%.tmp6764 = getelementptr [7 x i8], [7 x i8]*@.str6763, i32 0, i32 0
store i8* %.tmp6764, i8** %.tmp6762
%.tmp6765 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
%.tmp6766 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6765, i32 0, i32 4
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp6766
%.tmp6767 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
%.tmp6768 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6767, i32 0, i32 3
%.tmp6769 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
store %m1861$.AssignableInfo.type* %.tmp6769, %m1861$.AssignableInfo.type** %.tmp6768
%.tmp6770 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
%.tmp6771 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6770, i32 0, i32 2
store i1 0, i1* %.tmp6771
%.tmp6772 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6773 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6711
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp6772, %m1861$.GlobalName.type* %.tmp6773)
%.tmp6774 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6696
ret %m1861$.AssignableInfo.type* %.tmp6774
}
define void @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%mod = alloca %m307$.Node.type*
store %m307$.Node.type* %.mod.arg, %m307$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp6775 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp6776 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6775)
%info.6777 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6776, %m1861$.AssignableInfo.type** %info.6777
%.tmp6778 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6777
%.tmp6779 = load i8, i8* @SCOPE_CONST
%.tmp6780 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6778, i8 %.tmp6779, i8* %.tmp6780)
%.tmp6781 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6777
%.tmp6782 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6781, i32 0, i32 2
%.tmp6784 = getelementptr [7 x i8], [7 x i8]*@.str6783, i32 0, i32 0
store i8* %.tmp6784, i8** %.tmp6782
%.tmp6785 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6777
%.tmp6786 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6785, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6786
%.tmp6787 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6788 = load i8*, i8** %as_name
%.tmp6789 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6777
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6787, i8* %.tmp6788, %m1861$.AssignableInfo.type* %.tmp6789)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp6790 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6791 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6790, i32 0, i32 3
%.tmp6792 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp6791
%.tmp6793 = icmp eq %m1861$.GlobalName.type* %.tmp6792, null
br i1 %.tmp6793, label %.if.true.6794, label %.if.false.6794
.if.true.6794:
%.tmp6795 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6796 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6795, i32 0, i32 3
%.tmp6797 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp6797, %m1861$.GlobalName.type** %.tmp6796
br label %.if.end.6794
.if.false.6794:
%last_global.6798 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %last_global.6798
%.tmp6800 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6801 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6800, i32 0, i32 3
%.tmp6802 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp6801
store %m1861$.GlobalName.type* %.tmp6802, %m1861$.GlobalName.type** %last_global.6798
br label %.for.start.6799
.for.start.6799:
%.tmp6803 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.6798
%.tmp6804 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6803, i32 0, i32 4
%.tmp6805 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp6804
%.tmp6806 = icmp ne %m1861$.GlobalName.type* %.tmp6805, null
br i1 %.tmp6806, label %.for.continue.6799, label %.for.end.6799
.for.continue.6799:
%.tmp6807 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.6798
%.tmp6808 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6807, i32 0, i32 4
%.tmp6809 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp6808
store %m1861$.GlobalName.type* %.tmp6809, %m1861$.GlobalName.type** %last_global.6798
br label %.for.start.6799
.for.end.6799:
%.tmp6810 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.6798
%.tmp6811 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6810, i32 0, i32 4
%.tmp6812 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp6812, %m1861$.GlobalName.type** %.tmp6811
br label %.if.end.6794
.if.end.6794:
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp6813 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6814 = icmp eq %m1861$.Type.type* %.tmp6813, null
br i1 %.tmp6814, label %.if.true.6815, label %.if.false.6815
.if.true.6815:
%.tmp6816 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp6816, label %.if.true.6817, label %.if.false.6817
.if.true.6817:
%.tmp6819 = getelementptr [44 x i8], [44 x i8]*@.str6818, i32 0, i32 0
%.tmp6820 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6821 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6820, i32 0, i32 6
%.tmp6822 = load i8*, i8** %.tmp6821
%.tmp6823 = call i32(i8*,...) @printf(i8* %.tmp6819, i8* %.tmp6822)
br label %.if.end.6817
.if.false.6817:
br label %.if.end.6817
.if.end.6817:
%.tmp6825 = getelementptr [2 x i8], [2 x i8]*@.str6824, i32 0, i32 0
ret i8* %.tmp6825
br label %.if.end.6815
.if.false.6815:
br label %.if.end.6815
.if.end.6815:
%.tmp6826 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6827 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6826, i32 0, i32 0
%.tmp6828 = load i8*, i8** %.tmp6827
%.tmp6829 = icmp ne i8* %.tmp6828, null
%.tmp6831 = getelementptr [59 x i8], [59 x i8]*@.str6830, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6829, i8* %.tmp6831)
%buf.6832 = alloca i8*
store i8* null, i8** %buf.6832
%.tmp6833 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6834 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6833, i32 0, i32 0
%.tmp6835 = load i8*, i8** %.tmp6834
%.tmp6837 = getelementptr [4 x i8], [4 x i8]*@.str6836, i32 0, i32 0
%.tmp6838 = call i32(i8*,i8*) @strcmp(i8* %.tmp6835, i8* %.tmp6837)
%.tmp6839 = icmp eq i32 %.tmp6838, 0
br i1 %.tmp6839, label %.if.true.6840, label %.if.false.6840
.if.true.6840:
%.tmp6842 = getelementptr [4 x i8], [4 x i8]*@.str6841, i32 0, i32 0
ret i8* %.tmp6842
br label %.if.end.6840
.if.false.6840:
%.tmp6843 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6844 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6843, i32 0, i32 0
%.tmp6845 = load i8*, i8** %.tmp6844
%.tmp6847 = getelementptr [5 x i8], [5 x i8]*@.str6846, i32 0, i32 0
%.tmp6848 = call i32(i8*,i8*) @strcmp(i8* %.tmp6845, i8* %.tmp6847)
%.tmp6849 = icmp eq i32 %.tmp6848, 0
br i1 %.tmp6849, label %.if.true.6850, label %.if.false.6850
.if.true.6850:
%.tmp6852 = getelementptr [5 x i8], [5 x i8]*@.str6851, i32 0, i32 0
ret i8* %.tmp6852
br label %.if.end.6850
.if.false.6850:
%.tmp6853 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6854 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6853, i32 0, i32 0
%.tmp6855 = load i8*, i8** %.tmp6854
%.tmp6857 = getelementptr [5 x i8], [5 x i8]*@.str6856, i32 0, i32 0
%.tmp6858 = call i32(i8*,i8*) @strcmp(i8* %.tmp6855, i8* %.tmp6857)
%.tmp6859 = icmp eq i32 %.tmp6858, 0
br i1 %.tmp6859, label %.if.true.6860, label %.if.false.6860
.if.true.6860:
%.tmp6862 = getelementptr [3 x i8], [3 x i8]*@.str6861, i32 0, i32 0
ret i8* %.tmp6862
br label %.if.end.6860
.if.false.6860:
%.tmp6863 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6864 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6863, i32 0, i32 0
%.tmp6865 = load i8*, i8** %.tmp6864
%.tmp6867 = getelementptr [8 x i8], [8 x i8]*@.str6866, i32 0, i32 0
%.tmp6868 = call i32(i8*,i8*) @strcmp(i8* %.tmp6865, i8* %.tmp6867)
%.tmp6869 = icmp eq i32 %.tmp6868, 0
br i1 %.tmp6869, label %.if.true.6870, label %.if.false.6870
.if.true.6870:
%.tmp6872 = getelementptr [4 x i8], [4 x i8]*@.str6871, i32 0, i32 0
ret i8* %.tmp6872
br label %.if.end.6870
.if.false.6870:
%.tmp6873 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6874 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6873, i32 0, i32 0
%.tmp6875 = load i8*, i8** %.tmp6874
%.tmp6877 = getelementptr [4 x i8], [4 x i8]*@.str6876, i32 0, i32 0
%.tmp6878 = call i32(i8*,i8*) @strcmp(i8* %.tmp6875, i8* %.tmp6877)
%.tmp6879 = icmp eq i32 %.tmp6878, 0
br i1 %.tmp6879, label %.if.true.6880, label %.if.false.6880
.if.true.6880:
%.tmp6882 = getelementptr [3 x i8], [3 x i8]*@.str6881, i32 0, i32 0
ret i8* %.tmp6882
br label %.if.end.6880
.if.false.6880:
%.tmp6883 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6884 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6883, i32 0, i32 0
%.tmp6885 = load i8*, i8** %.tmp6884
%.tmp6887 = getelementptr [9 x i8], [9 x i8]*@.str6886, i32 0, i32 0
%.tmp6888 = call i32(i8*,i8*) @strcmp(i8* %.tmp6885, i8* %.tmp6887)
%.tmp6889 = icmp eq i32 %.tmp6888, 0
br i1 %.tmp6889, label %.if.true.6890, label %.if.false.6890
.if.true.6890:
%.tmp6891 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6893 = getelementptr [4 x i8], [4 x i8]*@.str6892, i32 0, i32 0
%.tmp6894 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6895 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6896 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6895, i32 0, i32 3
%.tmp6897 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6896
%.tmp6898 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6894, %m1861$.Type.type* %.tmp6897)
%.tmp6899 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6891, i8* %.tmp6893, i8* %.tmp6898)
%.tmp6901 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6902 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6901, i32 0, i32 3
%.tmp6903 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6902
%.tmp6904 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6903, i32 0, i32 4
%.tmp6905 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6904
%p.6906 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6905, %m1861$.Type.type** %p.6906
br label %.for.start.6900
.for.start.6900:
%.tmp6907 = load %m1861$.Type.type*, %m1861$.Type.type** %p.6906
%.tmp6908 = icmp ne %m1861$.Type.type* %.tmp6907, null
br i1 %.tmp6908, label %.for.continue.6900, label %.for.end.6900
.for.continue.6900:
%.tmp6909 = load %m1861$.Type.type*, %m1861$.Type.type** %p.6906
%.tmp6910 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6911 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6910, i32 0, i32 3
%.tmp6912 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6911
%.tmp6913 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6912, i32 0, i32 4
%.tmp6914 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6913
%.tmp6915 = icmp ne %m1861$.Type.type* %.tmp6909, %.tmp6914
br i1 %.tmp6915, label %.if.true.6916, label %.if.false.6916
.if.true.6916:
%.tmp6917 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6919 = getelementptr [4 x i8], [4 x i8]*@.str6918, i32 0, i32 0
%.tmp6920 = load i8*, i8** %buf.6832
%.tmp6921 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6917, i8* %.tmp6919, i8* %.tmp6920)
br label %.if.end.6916
.if.false.6916:
br label %.if.end.6916
.if.end.6916:
%.tmp6922 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6924 = getelementptr [5 x i8], [5 x i8]*@.str6923, i32 0, i32 0
%.tmp6925 = load i8*, i8** %buf.6832
%.tmp6926 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6927 = load %m1861$.Type.type*, %m1861$.Type.type** %p.6906
%.tmp6928 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6926, %m1861$.Type.type* %.tmp6927)
%.tmp6929 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6922, i8* %.tmp6924, i8* %.tmp6925, i8* %.tmp6928)
%.tmp6930 = load %m1861$.Type.type*, %m1861$.Type.type** %p.6906
%.tmp6931 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6930, i32 0, i32 4
%.tmp6932 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6931
store %m1861$.Type.type* %.tmp6932, %m1861$.Type.type** %p.6906
br label %.for.start.6900
.for.end.6900:
%.tmp6933 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6935 = getelementptr [4 x i8], [4 x i8]*@.str6934, i32 0, i32 0
%.tmp6936 = load i8*, i8** %buf.6832
%.tmp6937 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6933, i8* %.tmp6935, i8* %.tmp6936)
%.tmp6938 = load i8*, i8** %buf.6832
ret i8* %.tmp6938
br label %.if.end.6890
.if.false.6890:
%.tmp6939 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6940 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6939, i32 0, i32 0
%.tmp6941 = load i8*, i8** %.tmp6940
%.tmp6943 = getelementptr [4 x i8], [4 x i8]*@.str6942, i32 0, i32 0
%.tmp6944 = call i32(i8*,i8*) @strcmp(i8* %.tmp6941, i8* %.tmp6943)
%.tmp6945 = icmp eq i32 %.tmp6944, 0
br i1 %.tmp6945, label %.if.true.6946, label %.if.false.6946
.if.true.6946:
%.tmp6947 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6949 = getelementptr [4 x i8], [4 x i8]*@.str6948, i32 0, i32 0
%.tmp6950 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6951 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6952 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6951, i32 0, i32 3
%.tmp6953 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6952
%.tmp6954 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6950, %m1861$.Type.type* %.tmp6953)
%.tmp6955 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6947, i8* %.tmp6949, i8* %.tmp6954)
%.tmp6956 = load i8*, i8** %buf.6832
ret i8* %.tmp6956
br label %.if.end.6946
.if.false.6946:
%.tmp6957 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6958 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6957, i32 0, i32 0
%.tmp6959 = load i8*, i8** %.tmp6958
%.tmp6961 = getelementptr [7 x i8], [7 x i8]*@.str6960, i32 0, i32 0
%.tmp6962 = call i32(i8*,i8*) @strcmp(i8* %.tmp6959, i8* %.tmp6961)
%.tmp6963 = icmp eq i32 %.tmp6962, 0
br i1 %.tmp6963, label %.if.true.6964, label %.if.false.6964
.if.true.6964:
%.tmp6965 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6967 = getelementptr [2 x i8], [2 x i8]*@.str6966, i32 0, i32 0
%.tmp6968 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6965, i8* %.tmp6967)
%.tmp6970 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6971 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6970, i32 0, i32 3
%.tmp6972 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6971
%t.6973 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6972, %m1861$.Type.type** %t.6973
br label %.for.start.6969
.for.start.6969:
%.tmp6974 = load %m1861$.Type.type*, %m1861$.Type.type** %t.6973
%.tmp6975 = icmp ne %m1861$.Type.type* %.tmp6974, null
br i1 %.tmp6975, label %.for.continue.6969, label %.for.end.6969
.for.continue.6969:
%.tmp6976 = load %m1861$.Type.type*, %m1861$.Type.type** %t.6973
%.tmp6977 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6978 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6977, i32 0, i32 3
%.tmp6979 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6978
%.tmp6980 = icmp ne %m1861$.Type.type* %.tmp6976, %.tmp6979
br i1 %.tmp6980, label %.if.true.6981, label %.if.false.6981
.if.true.6981:
%.tmp6982 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6984 = getelementptr [4 x i8], [4 x i8]*@.str6983, i32 0, i32 0
%.tmp6985 = load i8*, i8** %buf.6832
%.tmp6986 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6982, i8* %.tmp6984, i8* %.tmp6985)
br label %.if.end.6981
.if.false.6981:
br label %.if.end.6981
.if.end.6981:
%.tmp6987 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp6989 = getelementptr [5 x i8], [5 x i8]*@.str6988, i32 0, i32 0
%.tmp6990 = load i8*, i8** %buf.6832
%.tmp6991 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6992 = load %m1861$.Type.type*, %m1861$.Type.type** %t.6973
%.tmp6993 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6991, %m1861$.Type.type* %.tmp6992)
%.tmp6994 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6987, i8* %.tmp6989, i8* %.tmp6990, i8* %.tmp6993)
%.tmp6995 = load %m1861$.Type.type*, %m1861$.Type.type** %t.6973
%.tmp6996 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6995, i32 0, i32 4
%.tmp6997 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6996
store %m1861$.Type.type* %.tmp6997, %m1861$.Type.type** %t.6973
br label %.for.start.6969
.for.end.6969:
%.tmp6998 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp7000 = getelementptr [4 x i8], [4 x i8]*@.str6999, i32 0, i32 0
%.tmp7001 = load i8*, i8** %buf.6832
%.tmp7002 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6998, i8* %.tmp7000, i8* %.tmp7001)
%.tmp7003 = load i8*, i8** %buf.6832
ret i8* %.tmp7003
br label %.if.end.6964
.if.false.6964:
%.tmp7004 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7005 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7004, i32 0, i32 0
%.tmp7006 = load i8*, i8** %.tmp7005
%.tmp7008 = getelementptr [6 x i8], [6 x i8]*@.str7007, i32 0, i32 0
%.tmp7009 = call i32(i8*,i8*) @strcmp(i8* %.tmp7006, i8* %.tmp7008)
%.tmp7010 = icmp eq i32 %.tmp7009, 0
br i1 %.tmp7010, label %.if.true.7011, label %.if.false.7011
.if.true.7011:
%.tmp7012 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp7014 = getelementptr [10 x i8], [10 x i8]*@.str7013, i32 0, i32 0
%.tmp7015 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7016 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7015, i32 0, i32 3
%.tmp7017 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7016
%.tmp7018 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7017, i32 0, i32 4
%.tmp7019 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7018
%.tmp7020 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7019, i32 0, i32 0
%.tmp7021 = load i8*, i8** %.tmp7020
%.tmp7022 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7023 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7024 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7023, i32 0, i32 3
%.tmp7025 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7024
%.tmp7026 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7022, %m1861$.Type.type* %.tmp7025)
%.tmp7027 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7012, i8* %.tmp7014, i8* %.tmp7021, i8* %.tmp7026)
%.tmp7028 = load i8*, i8** %buf.6832
ret i8* %.tmp7028
br label %.if.end.7011
.if.false.7011:
%.tmp7029 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7030 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7029, i32 0, i32 0
%.tmp7031 = load i8*, i8** %.tmp7030
%.tmp7033 = getelementptr [10 x i8], [10 x i8]*@.str7032, i32 0, i32 0
%.tmp7034 = call i32(i8*,i8*) @strcmp(i8* %.tmp7031, i8* %.tmp7033)
%.tmp7035 = icmp eq i32 %.tmp7034, 0
br i1 %.tmp7035, label %.if.true.7036, label %.if.false.7036
.if.true.7036:
%.tmp7037 = getelementptr i8*, i8** %buf.6832, i32 0
%.tmp7039 = getelementptr [5 x i8], [5 x i8]*@.str7038, i32 0, i32 0
%.tmp7040 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7041 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7040, i32 0, i32 2
%.tmp7042 = load i8*, i8** %.tmp7041
%.tmp7043 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7037, i8* %.tmp7039, i8* %.tmp7042)
%.tmp7044 = load i8*, i8** %buf.6832
ret i8* %.tmp7044
br label %.if.end.7036
.if.false.7036:
%.tmp7045 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7046 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7045, i32 0, i32 0
%.tmp7047 = load i8*, i8** %.tmp7046
%.tmp7049 = getelementptr [7 x i8], [7 x i8]*@.str7048, i32 0, i32 0
%.tmp7050 = call i32(i8*,i8*) @strcmp(i8* %.tmp7047, i8* %.tmp7049)
%.tmp7051 = icmp eq i32 %.tmp7050, 0
br i1 %.tmp7051, label %.if.true.7052, label %.if.false.7052
.if.true.7052:
%.tmp7054 = getelementptr [4 x i8], [4 x i8]*@.str7053, i32 0, i32 0
ret i8* %.tmp7054
br label %.if.end.7052
.if.false.7052:
%.tmp7055 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7056 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7055, i32 0, i32 0
%.tmp7057 = load i8*, i8** %.tmp7056
%.tmp7059 = getelementptr [6 x i8], [6 x i8]*@.str7058, i32 0, i32 0
%.tmp7060 = call i32(i8*,i8*) @strcmp(i8* %.tmp7057, i8* %.tmp7059)
%.tmp7061 = icmp eq i32 %.tmp7060, 0
br i1 %.tmp7061, label %.if.true.7062, label %.if.false.7062
.if.true.7062:
br label %.if.end.7062
.if.false.7062:
%.tmp7064 = getelementptr [58 x i8], [58 x i8]*@.str7063, i32 0, i32 0
%.tmp7065 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7066 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7065, i32 0, i32 0
%.tmp7067 = load i8*, i8** %.tmp7066
%.tmp7068 = call i32(i8*,...) @printf(i8* %.tmp7064, i8* %.tmp7067)
br label %.if.end.7062
.if.end.7062:
br label %.if.end.7052
.if.end.7052:
br label %.if.end.7036
.if.end.7036:
br label %.if.end.7011
.if.end.7011:
br label %.if.end.6964
.if.end.6964:
br label %.if.end.6946
.if.end.6946:
br label %.if.end.6890
.if.end.6890:
br label %.if.end.6880
.if.end.6880:
br label %.if.end.6870
.if.end.6870:
br label %.if.end.6860
.if.end.6860:
br label %.if.end.6850
.if.end.6850:
br label %.if.end.6840
.if.end.6840:
%.tmp7069 = bitcast ptr null to i8*
ret i8* %.tmp7069
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7070 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7071 = ptrtoint %m1861$.ErrorList.type* %.tmp7070 to i32
%.tmp7072 = call i8*(i32) @malloc(i32 %.tmp7071)
%.tmp7073 = bitcast i8* %.tmp7072 to %m1861$.ErrorList.type*
%new_err.7074 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7073, %m1861$.ErrorList.type** %new_err.7074
%.tmp7075 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7074
%.tmp7076 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7075, i32 0, i32 0
%.tmp7077 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7077, %m751$.Error.type** %.tmp7076
%.tmp7078 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7074
%.tmp7079 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7078, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7079
%.tmp7080 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7081 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7080, i32 0, i32 2
%.tmp7082 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7081
%.tmp7083 = icmp eq %m1861$.ErrorList.type* %.tmp7082, null
br i1 %.tmp7083, label %.if.true.7084, label %.if.false.7084
.if.true.7084:
%.tmp7085 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7086 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7085, i32 0, i32 2
%.tmp7087 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7074
store %m1861$.ErrorList.type* %.tmp7087, %m1861$.ErrorList.type** %.tmp7086
ret void
br label %.if.end.7084
.if.false.7084:
br label %.if.end.7084
.if.end.7084:
%last.7088 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7088
%.tmp7090 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7091 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7090, i32 0, i32 2
%.tmp7092 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7091
store %m1861$.ErrorList.type* %.tmp7092, %m1861$.ErrorList.type** %last.7088
br label %.for.start.7089
.for.start.7089:
%.tmp7093 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7088
%.tmp7094 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7093, i32 0, i32 1
%.tmp7095 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7094
%.tmp7096 = icmp ne %m1861$.ErrorList.type* %.tmp7095, null
br i1 %.tmp7096, label %.for.continue.7089, label %.for.end.7089
.for.continue.7089:
%.tmp7097 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7088
%.tmp7098 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7097, i32 0, i32 1
%.tmp7099 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7098
store %m1861$.ErrorList.type* %.tmp7099, %m1861$.ErrorList.type** %last.7088
br label %.for.start.7089
.for.end.7089:
%.tmp7100 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7088
%.tmp7101 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7100, i32 0, i32 1
%.tmp7102 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7074
store %m1861$.ErrorList.type* %.tmp7102, %m1861$.ErrorList.type** %.tmp7101
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7103 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7104 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7103, i32 0, i32 6
%.tmp7105 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7104
%.tmp7106 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7105, i32 0, i32 7
%.tmp7107 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7106
%.tmp7108 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7107, i32 0, i32 1
%.tmp7109 = load i8*, i8** %.tmp7108
ret i8* %.tmp7109
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7111 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7112 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7111, %m307$.Node.type** %n.7112
br label %.for.start.7110
.for.start.7110:
%.tmp7113 = load %m307$.Node.type*, %m307$.Node.type** %n.7112
%.tmp7114 = icmp ne %m307$.Node.type* %.tmp7113, null
br i1 %.tmp7114, label %.for.continue.7110, label %.for.end.7110
.for.continue.7110:
%.tmp7115 = load %m307$.Node.type*, %m307$.Node.type** %n.7112
%.tmp7116 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7115, i32 0, i32 0
%.tmp7117 = load i8*, i8** %.tmp7116
%.tmp7118 = load i8*, i8** %type
%.tmp7119 = call i32(i8*,i8*) @strcmp(i8* %.tmp7117, i8* %.tmp7118)
%.tmp7120 = icmp eq i32 %.tmp7119, 0
br i1 %.tmp7120, label %.if.true.7121, label %.if.false.7121
.if.true.7121:
%.tmp7122 = load %m307$.Node.type*, %m307$.Node.type** %n.7112
ret %m307$.Node.type* %.tmp7122
br label %.if.end.7121
.if.false.7121:
br label %.if.end.7121
.if.end.7121:
%.tmp7123 = load %m307$.Node.type*, %m307$.Node.type** %n.7112
%.tmp7124 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7123, i32 0, i32 7
%.tmp7125 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7124
store %m307$.Node.type* %.tmp7125, %m307$.Node.type** %n.7112
br label %.for.start.7110
.for.end.7110:
%.tmp7126 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7126
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7127 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7128 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7127, %m1861$.Type.type** %function_type.7128
%.tmp7129 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7130 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7131 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7130, i32 0, i32 6
%.tmp7132 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7131
%.tmp7133 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7129, %m307$.Node.type* %.tmp7132)
%return_value_type.7134 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7133, %m1861$.Type.type** %return_value_type.7134
%.tmp7135 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7128
%.tmp7136 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7135, i32 0, i32 0
%.tmp7138 = getelementptr [9 x i8], [9 x i8]*@.str7137, i32 0, i32 0
store i8* %.tmp7138, i8** %.tmp7136
%.tmp7139 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7128
%.tmp7140 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7139, i32 0, i32 3
%.tmp7141 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7134
store %m1861$.Type.type* %.tmp7141, %m1861$.Type.type** %.tmp7140
%.tmp7142 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7134
%last_type.7143 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7142, %m1861$.Type.type** %last_type.7143
%.tmp7144 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7145 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7144)
%params.7146 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7145, %m307$.Node.type** %params.7146
%.tmp7148 = load %m307$.Node.type*, %m307$.Node.type** %params.7146
%param_ptr.7149 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7148, %m307$.Node.type** %param_ptr.7149
br label %.for.start.7147
.for.start.7147:
%.tmp7150 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7151 = icmp ne %m307$.Node.type* %.tmp7150, null
br i1 %.tmp7151, label %.for.continue.7147, label %.for.end.7147
.for.continue.7147:
%.tmp7152 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7153 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7152, i32 0, i32 0
%.tmp7154 = load i8*, i8** %.tmp7153
%.tmp7156 = getelementptr [5 x i8], [5 x i8]*@.str7155, i32 0, i32 0
%.tmp7157 = call i32(i8*,i8*) @strcmp(i8* %.tmp7154, i8* %.tmp7156)
%.tmp7158 = icmp eq i32 %.tmp7157, 0
br i1 %.tmp7158, label %.if.true.7159, label %.if.false.7159
.if.true.7159:
%.tmp7160 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7143
%.tmp7161 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7160, i32 0, i32 4
%.tmp7162 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7143
%.tmp7163 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7162)
store %m1861$.Type.type* %.tmp7163, %m1861$.Type.type** %.tmp7161
%.tmp7164 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7143
%.tmp7165 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7164, i32 0, i32 4
%.tmp7166 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7165
%.tmp7167 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7166, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7167
%.tmp7168 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7143
%.tmp7169 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7168, i32 0, i32 4
%.tmp7170 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7169
store %m1861$.Type.type* %.tmp7170, %m1861$.Type.type** %last_type.7143
%.tmp7171 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7172 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7171, i32 0, i32 7
%.tmp7173 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7172
%.tmp7174 = icmp ne %m307$.Node.type* %.tmp7173, null
br i1 %.tmp7174, label %.if.true.7175, label %.if.false.7175
.if.true.7175:
%.tmp7176 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7177 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7176, i32 0, i32 7
%.tmp7178 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7177
store %m307$.Node.type* %.tmp7178, %m307$.Node.type** %param_ptr.7149
br label %.if.end.7175
.if.false.7175:
br label %.if.end.7175
.if.end.7175:
%.tmp7179 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7179, i32 0, i32 7
%.tmp7181 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7180
%.tmp7182 = icmp ne %m307$.Node.type* %.tmp7181, null
br i1 %.tmp7182, label %.if.true.7183, label %.if.false.7183
.if.true.7183:
%.tmp7184 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7185 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7184, i32 0, i32 7
%.tmp7186 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7185
store %m307$.Node.type* %.tmp7186, %m307$.Node.type** %param_ptr.7149
br label %.if.end.7183
.if.false.7183:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7149
br label %.if.end.7183
.if.end.7183:
br label %.if.end.7159
.if.false.7159:
%.tmp7187 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7188 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7189 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7188, i32 0, i32 6
%.tmp7190 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7189
%.tmp7191 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7187, %m307$.Node.type* %.tmp7190)
%param_type.7192 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7191, %m1861$.Type.type** %param_type.7192
%.tmp7193 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7143
%.tmp7194 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7193, i32 0, i32 4
%.tmp7195 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7192
store %m1861$.Type.type* %.tmp7195, %m1861$.Type.type** %.tmp7194
%.tmp7196 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7192
store %m1861$.Type.type* %.tmp7196, %m1861$.Type.type** %last_type.7143
%.tmp7197 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7198 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7197, i32 0, i32 7
%.tmp7199 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7198
store %m307$.Node.type* %.tmp7199, %m307$.Node.type** %param_ptr.7149
%.tmp7200 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7201 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7200, i32 0, i32 7
%.tmp7202 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7201
%.tmp7203 = icmp ne %m307$.Node.type* %.tmp7202, null
br i1 %.tmp7203, label %.if.true.7204, label %.if.false.7204
.if.true.7204:
%.tmp7205 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7149
%.tmp7206 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7205, i32 0, i32 7
%.tmp7207 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7206
%.tmp7208 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7207, i32 0, i32 7
%.tmp7209 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7208
store %m307$.Node.type* %.tmp7209, %m307$.Node.type** %param_ptr.7149
br label %.if.end.7204
.if.false.7204:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7149
br label %.if.end.7204
.if.end.7204:
br label %.if.end.7159
.if.end.7159:
br label %.for.start.7147
.for.end.7147:
%.tmp7210 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7128
ret %m1861$.Type.type* %.tmp7210
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7211 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7213 = getelementptr [10 x i8], [10 x i8]*@.str7212, i32 0, i32 0
%.tmp7214 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7211, i8* %.tmp7213)
%params.7215 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7214, %m307$.Node.type** %params.7215
%.tmp7216 = load %m307$.Node.type*, %m307$.Node.type** %params.7215
%.tmp7217 = icmp eq %m307$.Node.type* %.tmp7216, null
br i1 %.tmp7217, label %.if.true.7218, label %.if.false.7218
.if.true.7218:
%.tmp7219 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7219
br label %.if.end.7218
.if.false.7218:
br label %.if.end.7218
.if.end.7218:
%.tmp7220 = load %m307$.Node.type*, %m307$.Node.type** %params.7215
%.tmp7221 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7220, i32 0, i32 6
%.tmp7222 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7221
ret %m307$.Node.type* %.tmp7222
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7223 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.7224 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7223, %m1861$.Type.type** %t.7224
%.tmp7225 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7226 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7225, i32 0, i32 0
%.tmp7227 = load i8*, i8** %.tmp7226
%.tmp7229 = getelementptr [10 x i8], [10 x i8]*@.str7228, i32 0, i32 0
%.tmp7230 = call i32(i8*,i8*) @strcmp(i8* %.tmp7227, i8* %.tmp7229)
%.tmp7231 = icmp eq i32 %.tmp7230, 0
br i1 %.tmp7231, label %.if.true.7232, label %.if.false.7232
.if.true.7232:
%.tmp7233 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7234 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7233, i32 0, i32 0
%.tmp7236 = getelementptr [7 x i8], [7 x i8]*@.str7235, i32 0, i32 0
store i8* %.tmp7236, i8** %.tmp7234
%.tmp7237 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7238 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7237, i32 0, i32 1
store i8* null, i8** %.tmp7238
%.tmp7239 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7240 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7239, i32 0, i32 6
%.tmp7241 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7240
%.tmp7243 = getelementptr [5 x i8], [5 x i8]*@.str7242, i32 0, i32 0
%.tmp7244 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7241, i8* %.tmp7243)
%curr_type.7245 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7244, %m307$.Node.type** %curr_type.7245
%.tmp7246 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7247 = icmp ne %m307$.Node.type* %.tmp7246, null
br i1 %.tmp7247, label %.if.true.7248, label %.if.false.7248
.if.true.7248:
%.tmp7249 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7250 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7249, i32 0, i32 3
%.tmp7251 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7252 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7253 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7252, i32 0, i32 6
%.tmp7254 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7253
%.tmp7255 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7251, %m307$.Node.type* %.tmp7254)
store %m1861$.Type.type* %.tmp7255, %m1861$.Type.type** %.tmp7250
%.tmp7256 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7257 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7256, i32 0, i32 3
%.tmp7258 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7257
%.tmp7259 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7258, i32 0, i32 1
%.tmp7260 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7261 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7260, i32 0, i32 7
%.tmp7262 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7261
%.tmp7263 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7262, i32 0, i32 1
%.tmp7264 = load i8*, i8** %.tmp7263
store i8* %.tmp7264, i8** %.tmp7259
%.tmp7265 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7266 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7265, i32 0, i32 3
%.tmp7267 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7266
%curr_t.7268 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7267, %m1861$.Type.type** %curr_t.7268
%.tmp7270 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7271 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7270, i32 0, i32 7
%.tmp7272 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7271
%.tmp7274 = getelementptr [5 x i8], [5 x i8]*@.str7273, i32 0, i32 0
%.tmp7275 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7272, i8* %.tmp7274)
store %m307$.Node.type* %.tmp7275, %m307$.Node.type** %curr_type.7245
br label %.for.start.7269
.for.start.7269:
%.tmp7276 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7277 = icmp ne %m307$.Node.type* %.tmp7276, null
br i1 %.tmp7277, label %.for.continue.7269, label %.for.end.7269
.for.continue.7269:
%.tmp7278 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7268
%.tmp7279 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7278, i32 0, i32 4
%.tmp7280 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7281 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7282 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7281, i32 0, i32 6
%.tmp7283 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7282
%.tmp7284 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7280, %m307$.Node.type* %.tmp7283)
store %m1861$.Type.type* %.tmp7284, %m1861$.Type.type** %.tmp7279
%.tmp7285 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7268
%.tmp7286 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7285, i32 0, i32 4
%.tmp7287 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7286
%.tmp7288 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7287, i32 0, i32 1
%.tmp7289 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7290 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7289, i32 0, i32 7
%.tmp7291 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7290
%.tmp7292 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7291, i32 0, i32 1
%.tmp7293 = load i8*, i8** %.tmp7292
store i8* %.tmp7293, i8** %.tmp7288
%.tmp7294 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7268
%.tmp7295 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7294, i32 0, i32 4
%.tmp7296 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7295
store %m1861$.Type.type* %.tmp7296, %m1861$.Type.type** %curr_t.7268
%.tmp7297 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7245
%.tmp7298 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7297, i32 0, i32 7
%.tmp7299 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7298
%.tmp7301 = getelementptr [5 x i8], [5 x i8]*@.str7300, i32 0, i32 0
%.tmp7302 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7299, i8* %.tmp7301)
store %m307$.Node.type* %.tmp7302, %m307$.Node.type** %curr_type.7245
br label %.for.start.7269
.for.end.7269:
br label %.if.end.7248
.if.false.7248:
br label %.if.end.7248
.if.end.7248:
br label %.if.end.7232
.if.false.7232:
%.tmp7303 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7304 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7303, i32 0, i32 0
%.tmp7305 = load i8*, i8** %.tmp7304
%.tmp7307 = getelementptr [12 x i8], [12 x i8]*@.str7306, i32 0, i32 0
%.tmp7308 = call i32(i8*,i8*) @strcmp(i8* %.tmp7305, i8* %.tmp7307)
%.tmp7309 = icmp eq i32 %.tmp7308, 0
br i1 %.tmp7309, label %.if.true.7310, label %.if.false.7310
.if.true.7310:
%err_msg.7311 = alloca i8*
store i8* null, i8** %err_msg.7311
%.tmp7312 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7313 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7314 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7312, %m307$.Node.type* %.tmp7313)
%base.7315 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp7314, %m1861$.ScopeItem.type** %base.7315
%.tmp7316 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7315
%.tmp7317 = icmp eq %m1861$.ScopeItem.type* %.tmp7316, null
br i1 %.tmp7317, label %.if.true.7318, label %.if.false.7318
.if.true.7318:
%.tmp7319 = getelementptr i8*, i8** %err_msg.7311, i32 0
%.tmp7321 = getelementptr [37 x i8], [37 x i8]*@.str7320, i32 0, i32 0
%.tmp7322 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7323 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7322, i32 0, i32 6
%.tmp7324 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7323
%.tmp7325 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7324, i32 0, i32 1
%.tmp7326 = load i8*, i8** %.tmp7325
%.tmp7327 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7319, i8* %.tmp7321, i8* %.tmp7326)
%.tmp7328 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7329 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7330 = load i8*, i8** %err_msg.7311
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7328, %m307$.Node.type* %.tmp7329, i8* %.tmp7330)
%.tmp7331 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7332 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7331, i32 0, i32 0
%.tmp7334 = getelementptr [6 x i8], [6 x i8]*@.str7333, i32 0, i32 0
store i8* %.tmp7334, i8** %.tmp7332
%.tmp7335 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
ret %m1861$.Type.type* %.tmp7335
br label %.if.end.7318
.if.false.7318:
br label %.if.end.7318
.if.end.7318:
%.tmp7336 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7337 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7336, i32 0, i32 0
%.tmp7339 = getelementptr [10 x i8], [10 x i8]*@.str7338, i32 0, i32 0
store i8* %.tmp7339, i8** %.tmp7337
%.tmp7340 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7341 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7340, i32 0, i32 1
%.tmp7342 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7315
%.tmp7343 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7342, i32 0, i32 0
%.tmp7344 = load i8*, i8** %.tmp7343
store i8* %.tmp7344, i8** %.tmp7341
%.tmp7345 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7346 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7345, i32 0, i32 2
%.tmp7347 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7315
%.tmp7348 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7347, i32 0, i32 1
%.tmp7349 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7348
%.tmp7350 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7349, i32 0, i32 0
%.tmp7351 = load i8*, i8** %.tmp7350
store i8* %.tmp7351, i8** %.tmp7346
%.tmp7352 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7353 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7352, i32 0, i32 3
%.tmp7354 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7315
%.tmp7355 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7354, i32 0, i32 1
%.tmp7356 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7355
%.tmp7357 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7356, i32 0, i32 3
%.tmp7358 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7357
store %m1861$.Type.type* %.tmp7358, %m1861$.Type.type** %.tmp7353
br label %.if.end.7310
.if.false.7310:
%.tmp7359 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7360 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7359, i32 0, i32 1
%.tmp7361 = load i8*, i8** %.tmp7360
%.tmp7363 = getelementptr [4 x i8], [4 x i8]*@.str7362, i32 0, i32 0
%.tmp7364 = call i32(i8*,i8*) @strcmp(i8* %.tmp7361, i8* %.tmp7363)
%.tmp7365 = icmp eq i32 %.tmp7364, 0
br i1 %.tmp7365, label %.if.true.7366, label %.if.false.7366
.if.true.7366:
%.tmp7367 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7368 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7367, i32 0, i32 0
%.tmp7370 = getelementptr [4 x i8], [4 x i8]*@.str7369, i32 0, i32 0
store i8* %.tmp7370, i8** %.tmp7368
%.tmp7371 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7372 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7371, i32 0, i32 3
%.tmp7373 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7373, %m1861$.Type.type** %.tmp7372
%.tmp7374 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7375 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7374, i32 0, i32 3
%.tmp7376 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7375
%.tmp7377 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7376, i32 0, i32 0
%.tmp7379 = getelementptr [4 x i8], [4 x i8]*@.str7378, i32 0, i32 0
store i8* %.tmp7379, i8** %.tmp7377
br label %.if.end.7366
.if.false.7366:
%.tmp7380 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7381 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7380, i32 0, i32 0
%.tmp7382 = load i8*, i8** %.tmp7381
%.tmp7384 = getelementptr [5 x i8], [5 x i8]*@.str7383, i32 0, i32 0
%.tmp7385 = call i32(i8*,i8*) @strcmp(i8* %.tmp7382, i8* %.tmp7384)
%.tmp7386 = icmp eq i32 %.tmp7385, 0
br i1 %.tmp7386, label %.if.true.7387, label %.if.false.7387
.if.true.7387:
%.tmp7388 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7389 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7388, i32 0, i32 0
%.tmp7390 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7391 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7390, i32 0, i32 1
%.tmp7392 = load i8*, i8** %.tmp7391
store i8* %.tmp7392, i8** %.tmp7389
br label %.if.end.7387
.if.false.7387:
%.tmp7393 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7394 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7393, i32 0, i32 1
%.tmp7395 = load i8*, i8** %.tmp7394
%.tmp7397 = getelementptr [4 x i8], [4 x i8]*@.str7396, i32 0, i32 0
%.tmp7398 = call i32(i8*,i8*) @strcmp(i8* %.tmp7395, i8* %.tmp7397)
%.tmp7399 = icmp eq i32 %.tmp7398, 0
br i1 %.tmp7399, label %.if.true.7400, label %.if.false.7400
.if.true.7400:
%.tmp7401 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
%.tmp7402 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7401, i32 0, i32 0
%.tmp7404 = getelementptr [7 x i8], [7 x i8]*@.str7403, i32 0, i32 0
store i8* %.tmp7404, i8** %.tmp7402
br label %.if.end.7400
.if.false.7400:
%.tmp7405 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7406 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7408 = getelementptr [54 x i8], [54 x i8]*@.str7407, i32 0, i32 0
%.tmp7409 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7405, %m307$.Node.type* %.tmp7406, i8* %.tmp7408)
%.tmp7410 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7411 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7410, i32 0, i32 0
%.tmp7412 = load i8*, i8** %.tmp7411
%.tmp7413 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7414 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7413, i32 0, i32 1
%.tmp7415 = load i8*, i8** %.tmp7414
%.tmp7416 = call i32(i8*,...) @printf(i8* %.tmp7409, i8* %.tmp7412, i8* %.tmp7415)
%.tmp7417 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7417
br label %.if.end.7400
.if.end.7400:
br label %.if.end.7387
.if.end.7387:
br label %.if.end.7366
.if.end.7366:
br label %.if.end.7310
.if.end.7310:
br label %.if.end.7232
.if.end.7232:
%.tmp7419 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7420 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7419, i32 0, i32 7
%.tmp7421 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7420
%ptr.7422 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7421, %m307$.Node.type** %ptr.7422
br label %.for.start.7418
.for.start.7418:
%.tmp7423 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7424 = icmp ne %m307$.Node.type* %.tmp7423, null
br i1 %.tmp7424, label %.for.continue.7418, label %.for.end.7418
.for.continue.7418:
%.tmp7425 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7426 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7425, i32 0, i32 1
%.tmp7427 = load i8*, i8** %.tmp7426
%.tmp7429 = getelementptr [2 x i8], [2 x i8]*@.str7428, i32 0, i32 0
%.tmp7430 = call i32(i8*,i8*) @strcmp(i8* %.tmp7427, i8* %.tmp7429)
%.tmp7431 = icmp eq i32 %.tmp7430, 0
br i1 %.tmp7431, label %.if.true.7432, label %.if.false.7432
.if.true.7432:
%.tmp7433 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.7434 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7433, %m1861$.Type.type** %pt.7434
%.tmp7435 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7434
%.tmp7436 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7435, i32 0, i32 0
%.tmp7438 = getelementptr [4 x i8], [4 x i8]*@.str7437, i32 0, i32 0
store i8* %.tmp7438, i8** %.tmp7436
%.tmp7439 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7434
%.tmp7440 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7439, i32 0, i32 3
%.tmp7441 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
store %m1861$.Type.type* %.tmp7441, %m1861$.Type.type** %.tmp7440
%.tmp7442 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7434
store %m1861$.Type.type* %.tmp7442, %m1861$.Type.type** %t.7224
br label %.if.end.7432
.if.false.7432:
%.tmp7443 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7444 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7443, i32 0, i32 1
%.tmp7445 = load i8*, i8** %.tmp7444
%.tmp7447 = getelementptr [2 x i8], [2 x i8]*@.str7446, i32 0, i32 0
%.tmp7448 = call i32(i8*,i8*) @strcmp(i8* %.tmp7445, i8* %.tmp7447)
%.tmp7449 = icmp eq i32 %.tmp7448, 0
br i1 %.tmp7449, label %.if.true.7450, label %.if.false.7450
.if.true.7450:
%.tmp7451 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7452 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7451, i32 0, i32 7
%.tmp7453 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7452
%.tmp7454 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7453, i32 0, i32 1
%.tmp7455 = load i8*, i8** %.tmp7454
%.tmp7457 = getelementptr [2 x i8], [2 x i8]*@.str7456, i32 0, i32 0
%.tmp7458 = call i32(i8*,i8*) @strcmp(i8* %.tmp7455, i8* %.tmp7457)
%.tmp7459 = icmp eq i32 %.tmp7458, 0
br i1 %.tmp7459, label %.if.true.7460, label %.if.false.7460
.if.true.7460:
%.tmp7461 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.7462 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7461, %m1861$.Type.type** %slice_type.7462
%.tmp7463 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7462
%.tmp7464 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7463, i32 0, i32 0
%.tmp7466 = getelementptr [7 x i8], [7 x i8]*@.str7465, i32 0, i32 0
store i8* %.tmp7466, i8** %.tmp7464
%.tmp7467 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.7468 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7467, %m1861$.Type.type** %slice_c_array.7468
%.tmp7469 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7468
%.tmp7470 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7469, i32 0, i32 0
%.tmp7472 = getelementptr [4 x i8], [4 x i8]*@.str7471, i32 0, i32 0
store i8* %.tmp7472, i8** %.tmp7470
%.tmp7473 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7468
%.tmp7474 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7473, i32 0, i32 1
%.tmp7476 = getelementptr [6 x i8], [6 x i8]*@.str7475, i32 0, i32 0
store i8* %.tmp7476, i8** %.tmp7474
%.tmp7477 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7468
%.tmp7478 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7477, i32 0, i32 3
%.tmp7479 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
store %m1861$.Type.type* %.tmp7479, %m1861$.Type.type** %.tmp7478
%.tmp7480 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7462
%.tmp7481 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7480, i32 0, i32 3
%.tmp7482 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7468
store %m1861$.Type.type* %.tmp7482, %m1861$.Type.type** %.tmp7481
%.tmp7483 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.7484 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7483, %m1861$.Type.type** %slice_len.7484
%.tmp7485 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7484
%.tmp7486 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7485, i32 0, i32 0
%.tmp7488 = getelementptr [4 x i8], [4 x i8]*@.str7487, i32 0, i32 0
store i8* %.tmp7488, i8** %.tmp7486
%.tmp7489 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7484
%.tmp7490 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7489, i32 0, i32 1
%.tmp7492 = getelementptr [4 x i8], [4 x i8]*@.str7491, i32 0, i32 0
store i8* %.tmp7492, i8** %.tmp7490
%.tmp7493 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7468
%.tmp7494 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7493, i32 0, i32 4
%.tmp7495 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7484
store %m1861$.Type.type* %.tmp7495, %m1861$.Type.type** %.tmp7494
%.tmp7496 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.7497 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7496, %m1861$.Type.type** %slice_cap.7497
%.tmp7498 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7497
%.tmp7499 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7498, i32 0, i32 0
%.tmp7501 = getelementptr [4 x i8], [4 x i8]*@.str7500, i32 0, i32 0
store i8* %.tmp7501, i8** %.tmp7499
%.tmp7502 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7497
%.tmp7503 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7502, i32 0, i32 1
%.tmp7505 = getelementptr [4 x i8], [4 x i8]*@.str7504, i32 0, i32 0
store i8* %.tmp7505, i8** %.tmp7503
%.tmp7506 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7484
%.tmp7507 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7506, i32 0, i32 4
%.tmp7508 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7497
store %m1861$.Type.type* %.tmp7508, %m1861$.Type.type** %.tmp7507
%.tmp7509 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7462
store %m1861$.Type.type* %.tmp7509, %m1861$.Type.type** %t.7224
%.tmp7510 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7511 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7510, i32 0, i32 7
%.tmp7512 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7511
store %m307$.Node.type* %.tmp7512, %m307$.Node.type** %ptr.7422
br label %.if.end.7460
.if.false.7460:
br label %.if.end.7460
.if.end.7460:
br label %.if.end.7450
.if.false.7450:
%.tmp7513 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7514 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7516 = getelementptr [49 x i8], [49 x i8]*@.str7515, i32 0, i32 0
%.tmp7517 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7513, %m307$.Node.type* %.tmp7514, i8* %.tmp7516)
%.tmp7518 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7519 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7518, i32 0, i32 1
%.tmp7520 = load i8*, i8** %.tmp7519
%.tmp7521 = call i32(i8*,...) @printf(i8* %.tmp7517, i8* %.tmp7520)
%.tmp7522 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7522
br label %.if.end.7450
.if.end.7450:
br label %.if.end.7432
.if.end.7432:
%.tmp7523 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7422
%.tmp7524 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7523, i32 0, i32 7
%.tmp7525 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7524
store %m307$.Node.type* %.tmp7525, %m307$.Node.type** %ptr.7422
br label %.for.start.7418
.for.end.7418:
%.tmp7526 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7224
ret %m1861$.Type.type* %.tmp7526
}
@.str2654 = constant [5 x i8] c"%s{\0A\00"
@.str2658 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2665 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2672 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2684 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2688 = constant [10 x i8] c"%s  of: \0A\00"
@.str2702 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2706 = constant [12 x i8] c"%s  next: \0A\00"
@.str2715 = constant [5 x i8] c"%s}\0A\00"
@.str2775 = constant [5 x i8] c"%c%s\00"
@.str2787 = constant [7 x i8] c".tmp%d\00"
@.str2868 = constant [1 x i8] c"\00"
@.str2910 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2947 = constant [6 x i8] c"start\00"
@.str3000 = constant [6 x i8] c"start\00"
@.str3006 = constant [7 x i8] c"global\00"
@.str3017 = constant [13 x i8] c"head_comment\00"
@.str3056 = constant [7 x i8] c"string\00"
@.str3065 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3098 = constant [5 x i8] c"%s%s\00"
@.str3106 = constant [9 x i8] c"function\00"
@.str3112 = constant [5 x i8] c"main\00"
@.str3127 = constant [6 x i8] c"%s.%s\00"
@.str3148 = constant [3 x i8] c"NL\00"
@.str3156 = constant [7 x i8] c"global\00"
@.str3164 = constant [11 x i8] c"assignable\00"
@.str3195 = constant [9 x i8] c"variable\00"
@.str3206 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3221 = constant [10 x i8] c"typealias\00"
@.str3243 = constant [11 x i8] c"%s.%s.type\00"
@.str3255 = constant [10 x i8] c"typealias\00"
@.str3276 = constant [5 x i8] c"type\00"
@.str3306 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3319 = constant [7 x i8] c"extern\00"
@.str3337 = constant [7 x i8] c"extern\00"
@.str3377 = constant [15 x i8] c"declare %s %s(\00"
@.str3409 = constant [3 x i8] c", \00"
@.str3415 = constant [3 x i8] c"%s\00"
@.str3427 = constant [3 x i8] c")\0A\00"
@.str3438 = constant [9 x i8] c"function\00"
@.str3447 = constant [9 x i8] c"function\00"
@.str3485 = constant [14 x i8] c"define %s %s(\00"
@.str3514 = constant [3 x i8] c", \00"
@.str3520 = constant [5 x i8] c"type\00"
@.str3536 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3551 = constant [5 x i8] c") {\0A\00"
@.str3555 = constant [9 x i8] c"function\00"
@.str3564 = constant [6 x i8] c"block\00"
@.str3585 = constant [3 x i8] c"NL\00"
@.str3592 = constant [9 x i8] c"OPERATOR\00"
@.str3611 = constant [7 x i8] c"return\00"
@.str3621 = constant [5 x i8] c"void\00"
@.str3628 = constant [21 x i8] c"missing return value\00"
@.str3633 = constant [10 x i8] c"ret void\0A\00"
@.str3639 = constant [3 x i8] c"}\0A\00"
@.str3645 = constant [7 x i8] c"import\00"
@.str3696 = constant [1 x i8] c"\00"
@.str3702 = constant [6 x i8] c"%s.bn\00"
@.str3707 = constant [9 x i8] c"%s/%s.bn\00"
@.str3719 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3780 = constant [5 x i8] c"m%d$\00"
@.str3830 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3839 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3871 = constant [9 x i8] c"variable\00"
@.str3876 = constant [5 x i8] c"type\00"
@.str3908 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3920 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3932 = constant [6 x i8] c"block\00"
@.str3946 = constant [11 x i8] c"expression\00"
@.str3974 = constant [7 x i8] c"sizeof\00"
@.str3980 = constant [8 x i8] c"fn_args\00"
@.str3987 = constant [11 x i8] c"assignable\00"
@.str4015 = constant [4 x i8] c"int\00"
@.str4028 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4037 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4064 = constant [35 x i8] c"unable to compile function address\00"
@.str4070 = constant [8 x i8] c"fn_args\00"
@.str4074 = constant [1 x i8] c"\00"
@.str4084 = constant [11 x i8] c"assignable\00"
@.str4098 = constant [5 x i8] c"%s, \00"
@.str4116 = constant [8 x i8] c"%s%s %s\00"
@.str4131 = constant [11 x i8] c"assignable\00"
@.str4141 = constant [5 x i8] c"void\00"
@.str4149 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4181 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4207 = constant [7 x i8] c"return\00"
@.str4219 = constant [3 x i8] c"NL\00"
@.str4237 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4250 = constant [10 x i8] c"ret void\0A\00"
@.str4254 = constant [3 x i8] c"NL\00"
@.str4260 = constant [8 x i8] c"fn_call\00"
@.str4271 = constant [12 x i8] c"declaration\00"
@.str4280 = constant [11 x i8] c"assignment\00"
@.str4288 = constant [11 x i8] c"assignable\00"
@.str4319 = constant [4 x i8] c"ptr\00"
@.str4328 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4338 = constant [9 x i8] c"if_block\00"
@.str4346 = constant [9 x i8] c"for_loop\00"
@.str4354 = constant [8 x i8] c"keyword\00"
@.str4372 = constant [6 x i8] c"break\00"
@.str4386 = constant [4 x i8] c"for\00"
@.str4394 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4408 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4415 = constant [9 x i8] c"continue\00"
@.str4429 = constant [4 x i8] c"for\00"
@.str4437 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4451 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4455 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4466 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4485 = constant [14 x i8] c".for.start.%d\00"
@.str4490 = constant [12 x i8] c".for.end.%d\00"
@.str4495 = constant [4 x i8] c"for\00"
@.str4502 = constant [12 x i8] c"declaration\00"
@.str4513 = constant [11 x i8] c"assignment\00"
@.str4523 = constant [9 x i8] c"OPERATOR\00"
@.str4530 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4541 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4548 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4555 = constant [9 x i8] c"OPERATOR\00"
@.str4566 = constant [9 x i8] c"OPERATOR\00"
@.str4573 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4582 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4597 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4604 = constant [9 x i8] c"OPERATOR\00"
@.str4613 = constant [6 x i8] c"block\00"
@.str4628 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4635 = constant [5 x i8] c"%s:\0A\00"
@.str4649 = constant [5 x i8] c"type\00"
@.str4664 = constant [11 x i8] c"assignable\00"
@.str4679 = constant [9 x i8] c"variable\00"
@.str4684 = constant [5 x i8] c"WORD\00"
@.str4693 = constant [31 x i8] c"unable to get declaration name\00"
@.str4713 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str4725 = constant [6 x i8] c"%s.%d\00"
@.str4782 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4798 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4810 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4851 = constant [4 x i8] c"int\00"
@.str4858 = constant [4 x i8] c"chr\00"
@.str4866 = constant [5 x i8] c"bool\00"
@.str4875 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str4884 = constant [4 x i8] c"ptr\00"
@.str4892 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4895 = constant [5 x i8] c"null\00"
@.str4903 = constant [7 x i8] c"struct\00"
@.str4924 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4944 = constant [10 x i8] c"typealias\00"
@.str4967 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4986 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5003 = constant [11 x i8] c"assignable\00"
@.str5020 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5035 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5042 = constant [6 x i8] c"block\00"
@.str5051 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5058 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5065 = constant [11 x i8] c"elif_block\00"
@.str5077 = constant [11 x i8] c"else_block\00"
@.str5087 = constant [6 x i8] c"block\00"
@.str5097 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5104 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5125 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5134 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5188 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5209 = constant [7 x i8] c"module\00"
@.str5262 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5299 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5307 = constant [9 x i8] c"function\00"
@.str5314 = constant [7 x i8] c"extern\00"
@.str5326 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5347 = constant [9 x i8] c"variable\00"
@.str5369 = constant [4 x i8] c"ptr\00"
@.str5388 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5412 = constant [10 x i8] c"typealias\00"
@.str5423 = constant [7 x i8] c"struct\00"
@.str5429 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5481 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5502 = constant [9 x i8] c"variable\00"
@.str5513 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5534 = constant [9 x i8] c"variable\00"
@.str5542 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5556 = constant [12 x i8] c"destination\00"
@.str5561 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5589 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5608 = constant [7 x i8] c"module\00"
@.str5630 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5701 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str5722 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str5746 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str5771 = constant [15 x i8] c"hello: %s %s?\0A\00"
@.str5783 = constant [16 x i8] c"mono_assignable\00"
@.str5809 = constant [5 x i8] c"cast\00"
@.str5819 = constant [5 x i8] c"type\00"
@.str5844 = constant [8 x i8] c"bitcast\00"
@.str5852 = constant [4 x i8] c"ptr\00"
@.str5859 = constant [4 x i8] c"ptr\00"
@.str5878 = constant [4 x i8] c"i%d\00"
@.str5883 = constant [4 x i8] c"i%d\00"
@.str5891 = constant [5 x i8] c"sext\00"
@.str5893 = constant [6 x i8] c"trunc\00"
@.str5898 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str5918 = constant [16 x i8] c"mono_assignable\00"
@.str5980 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6003 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6010 = constant [2 x i8] c"+\00"
@.str6015 = constant [4 x i8] c"add\00"
@.str6020 = constant [2 x i8] c"-\00"
@.str6025 = constant [4 x i8] c"sub\00"
@.str6030 = constant [2 x i8] c"*\00"
@.str6035 = constant [4 x i8] c"mul\00"
@.str6040 = constant [2 x i8] c"/\00"
@.str6045 = constant [5 x i8] c"sdiv\00"
@.str6050 = constant [3 x i8] c"==\00"
@.str6055 = constant [8 x i8] c"icmp eq\00"
@.str6060 = constant [3 x i8] c"!=\00"
@.str6065 = constant [8 x i8] c"icmp ne\00"
@.str6070 = constant [2 x i8] c">\00"
@.str6075 = constant [9 x i8] c"icmp sgt\00"
@.str6080 = constant [2 x i8] c"<\00"
@.str6085 = constant [9 x i8] c"icmp slt\00"
@.str6090 = constant [2 x i8] c"&\00"
@.str6095 = constant [4 x i8] c"and\00"
@.str6100 = constant [2 x i8] c"|\00"
@.str6105 = constant [3 x i8] c"or\00"
@.str6110 = constant [3 x i8] c">=\00"
@.str6115 = constant [9 x i8] c"icmp sge\00"
@.str6120 = constant [3 x i8] c"<=\00"
@.str6125 = constant [9 x i8] c"icmp sle\00"
@.str6129 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6136 = constant [4 x i8] c"add\00"
@.str6143 = constant [3 x i8] c"==\00"
@.str6150 = constant [3 x i8] c"!=\00"
@.str6158 = constant [2 x i8] c"|\00"
@.str6166 = constant [2 x i8] c"&\00"
@.str6174 = constant [2 x i8] c">\00"
@.str6182 = constant [2 x i8] c"<\00"
@.str6190 = constant [3 x i8] c">=\00"
@.str6198 = constant [3 x i8] c"<=\00"
@.str6206 = constant [5 x i8] c"bool\00"
@.str6210 = constant [4 x i8] c"int\00"
@.str6224 = constant [7 x i8] c"NUMBER\00"
@.str6238 = constant [4 x i8] c"int\00"
@.str6252 = constant [5 x i8] c"WORD\00"
@.str6262 = constant [5 x i8] c"null\00"
@.str6269 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str6283 = constant [5 x i8] c"null\00"
@.str6292 = constant [8 x i8] c"nullptr\00"
@.str6299 = constant [17 x i8] c"addr_destination\00"
@.str6311 = constant [12 x i8] c"destination\00"
@.str6355 = constant [4 x i8] c"ptr\00"
@.str6374 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6386 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6400 = constant [8 x i8] c"boolean\00"
@.str6414 = constant [5 x i8] c"bool\00"
@.str6423 = constant [6 x i8] c"false\00"
@.str6430 = constant [2 x i8] c"0\00"
@.str6434 = constant [2 x i8] c"1\00"
@.str6441 = constant [8 x i8] c"fn_call\00"
@.str6458 = constant [7 x i8] c"STRING\00"
@.str6484 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6500 = constant [4 x i8] c"ptr\00"
@.str6513 = constant [4 x i8] c"chr\00"
@.str6520 = constant [4 x i8] c"CHR\00"
@.str6536 = constant [2 x i8] c"0\00"
@.str6552 = constant [22 x i8] c"Invalid character: %s\00"
@.str6568 = constant [4 x i8] c"chr\00"
@.str6572 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6600 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6606 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6611 = constant [4 x i8] c"int\00"
@.str6616 = constant [2 x i8] c"i\00"
@.str6621 = constant [5 x i8] c"bool\00"
@.str6626 = constant [2 x i8] c"b\00"
@.str6631 = constant [5 x i8] c"void\00"
@.str6636 = constant [2 x i8] c"v\00"
@.str6641 = constant [4 x i8] c"chr\00"
@.str6646 = constant [2 x i8] c"c\00"
@.str6651 = constant [4 x i8] c"ptr\00"
@.str6658 = constant [4 x i8] c"%sp\00"
@.str6669 = constant [10 x i8] c"typealias\00"
@.str6680 = constant [6 x i8] c"error\00"
@.str6685 = constant [2 x i8] c"?\00"
@.str6687 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str6699 = constant [7 x i8] c".str%d\00"
@.str6723 = constant [6 x i8] c"array\00"
@.str6736 = constant [4 x i8] c"chr\00"
@.str6754 = constant [3 x i8] c"%d\00"
@.str6763 = constant [7 x i8] c"string\00"
@.str6783 = constant [7 x i8] c"module\00"
@.str6818 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str6824 = constant [2 x i8] c"?\00"
@.str6830 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str6836 = constant [4 x i8] c"int\00"
@.str6841 = constant [4 x i8] c"i32\00"
@.str6846 = constant [5 x i8] c"void\00"
@.str6851 = constant [5 x i8] c"void\00"
@.str6856 = constant [5 x i8] c"bool\00"
@.str6861 = constant [3 x i8] c"i1\00"
@.str6866 = constant [8 x i8] c"nullptr\00"
@.str6871 = constant [4 x i8] c"ptr\00"
@.str6876 = constant [4 x i8] c"chr\00"
@.str6881 = constant [3 x i8] c"i8\00"
@.str6886 = constant [9 x i8] c"function\00"
@.str6892 = constant [4 x i8] c"%s(\00"
@.str6918 = constant [4 x i8] c"%s,\00"
@.str6923 = constant [5 x i8] c"%s%s\00"
@.str6934 = constant [4 x i8] c"%s)\00"
@.str6942 = constant [4 x i8] c"ptr\00"
@.str6948 = constant [4 x i8] c"%s*\00"
@.str6960 = constant [7 x i8] c"struct\00"
@.str6966 = constant [2 x i8] c"{\00"
@.str6983 = constant [4 x i8] c"%s,\00"
@.str6988 = constant [5 x i8] c"%s%s\00"
@.str6999 = constant [4 x i8] c"%s}\00"
@.str7007 = constant [6 x i8] c"array\00"
@.str7013 = constant [10 x i8] c"[%s x %s]\00"
@.str7032 = constant [10 x i8] c"typealias\00"
@.str7038 = constant [5 x i8] c"%%%s\00"
@.str7048 = constant [7 x i8] c"vararg\00"
@.str7053 = constant [4 x i8] c"...\00"
@.str7058 = constant [6 x i8] c"error\00"
@.str7063 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7137 = constant [9 x i8] c"function\00"
@.str7155 = constant [5 x i8] c"WORD\00"
@.str7212 = constant [10 x i8] c"fn_params\00"
@.str7228 = constant [10 x i8] c"structdef\00"
@.str7235 = constant [7 x i8] c"struct\00"
@.str7242 = constant [5 x i8] c"type\00"
@.str7273 = constant [5 x i8] c"type\00"
@.str7300 = constant [5 x i8] c"type\00"
@.str7306 = constant [12 x i8] c"dotted_name\00"
@.str7320 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str7333 = constant [6 x i8] c"error\00"
@.str7338 = constant [10 x i8] c"typealias\00"
@.str7362 = constant [4 x i8] c"str\00"
@.str7369 = constant [4 x i8] c"ptr\00"
@.str7378 = constant [4 x i8] c"chr\00"
@.str7383 = constant [5 x i8] c"WORD\00"
@.str7396 = constant [4 x i8] c"...\00"
@.str7403 = constant [7 x i8] c"vararg\00"
@.str7407 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7428 = constant [2 x i8] c"*\00"
@.str7437 = constant [4 x i8] c"ptr\00"
@.str7446 = constant [2 x i8] c"[\00"
@.str7456 = constant [2 x i8] c"]\00"
@.str7465 = constant [7 x i8] c"struct\00"
@.str7471 = constant [4 x i8] c"ptr\00"
@.str7475 = constant [6 x i8] c"c_arr\00"
@.str7487 = constant [4 x i8] c"int\00"
@.str7491 = constant [4 x i8] c"len\00"
@.str7500 = constant [4 x i8] c"int\00"
@.str7504 = constant [4 x i8] c"cap\00"
@.str7515 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7527 = load i32, i32* %argc
%.tmp7528 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7527, i8** %.tmp7528)
%.tmp7529 = load i32, i32* @STDERR
%.tmp7531 = getelementptr [2 x i8], [2 x i8]*@.str7530, i32 0, i32 0
%.tmp7532 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7529, i8* %.tmp7531)
%stderr.7533 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7532, %m0$.File.type** %stderr.7533
%.tmp7534 = load i8**, i8*** %argv
%.tmp7535 = getelementptr i8*, i8** %.tmp7534, i32 1
%.tmp7536 = load i8*, i8** %.tmp7535
%filename.7537 = alloca i8*
store i8* %.tmp7536, i8** %filename.7537
%.tmp7538 = call %m0$.File.type*() @tmpfile()
%llvm_code.7539 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7538, %m0$.File.type** %llvm_code.7539
%.tmp7540 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7539
%.tmp7541 = load i8*, i8** %filename.7537
%.tmp7542 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7540, i8* %.tmp7541)
%compiler_ctx.7543 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp7542, %m1861$.CompilerCtx.type** %compiler_ctx.7543
%.tmp7544 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.7543
%.tmp7545 = load i8*, i8** %filename.7537
%.tmp7546 = call i1(%m1861$.CompilerCtx.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp7544, i8* %.tmp7545)
br i1 %.tmp7546, label %.if.true.7547, label %.if.false.7547
.if.true.7547:
%.tmp7548 = load %m0$.File.type*, %m0$.File.type** %stderr.7533
%.tmp7550 = getelementptr [34 x i8], [34 x i8]*@.str7549, i32 0, i32 0
%.tmp7551 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7548, i8* %.tmp7550)
ret i32 1
br label %.if.end.7547
.if.false.7547:
br label %.if.end.7547
.if.end.7547:
%.tmp7552 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7539
%.tmp7553 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7552)
%.tmp7554 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7539
%.tmp7555 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7554)
%llvm_code_size.7556 = alloca i32
store i32 %.tmp7555, i32* %llvm_code_size.7556
%.tmp7557 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7539
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7557)
%.tmp7559 = getelementptr [30 x i8], [30 x i8]*@.str7558, i32 0, i32 0
%.tmp7561 = getelementptr [2 x i8], [2 x i8]*@.str7560, i32 0, i32 0
%.tmp7562 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7559, i8* %.tmp7561)
%proc.7563 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7562, %m0$.File.type** %proc.7563
%.tmp7564 = load %m0$.File.type*, %m0$.File.type** %proc.7563
%.tmp7565 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7564)
%.tmp7566 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7539
%.tmp7567 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7566)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7565, i32 %.tmp7567)
%.tmp7568 = load %m0$.File.type*, %m0$.File.type** %proc.7563
%.tmp7569 = icmp eq %m0$.File.type* %.tmp7568, null
br i1 %.tmp7569, label %.if.true.7570, label %.if.false.7570
.if.true.7570:
%.tmp7571 = load %m0$.File.type*, %m0$.File.type** %stderr.7533
%.tmp7573 = getelementptr [28 x i8], [28 x i8]*@.str7572, i32 0, i32 0
%.tmp7574 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7571, i8* %.tmp7573)
ret i32 0
br label %.if.end.7570
.if.false.7570:
br label %.if.end.7570
.if.end.7570:
%.tmp7575 = load %m0$.File.type*, %m0$.File.type** %proc.7563
%.tmp7576 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7575)
%.tmp7577 = icmp ne i32 %.tmp7576, 0
br i1 %.tmp7577, label %.if.true.7578, label %.if.false.7578
.if.true.7578:
%.tmp7579 = load %m0$.File.type*, %m0$.File.type** %stderr.7533
%.tmp7581 = getelementptr [24 x i8], [24 x i8]*@.str7580, i32 0, i32 0
%.tmp7582 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7579, i8* %.tmp7581)
ret i32 0
br label %.if.end.7578
.if.false.7578:
br label %.if.end.7578
.if.end.7578:
%.tmp7584 = getelementptr [17 x i8], [17 x i8]*@.str7583, i32 0, i32 0
%.tmp7586 = getelementptr [2 x i8], [2 x i8]*@.str7585, i32 0, i32 0
%.tmp7587 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7584, i8* %.tmp7586)
%gcc_proc.7588 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7587, %m0$.File.type** %gcc_proc.7588
%.tmp7589 = load %m0$.File.type*, %m0$.File.type** %gcc_proc.7588
%.tmp7590 = icmp eq %m0$.File.type* %.tmp7589, null
br i1 %.tmp7590, label %.if.true.7591, label %.if.false.7591
.if.true.7591:
%.tmp7592 = load %m0$.File.type*, %m0$.File.type** %stderr.7533
%.tmp7594 = getelementptr [28 x i8], [28 x i8]*@.str7593, i32 0, i32 0
%.tmp7595 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7592, i8* %.tmp7594)
ret i32 0
br label %.if.end.7591
.if.false.7591:
br label %.if.end.7591
.if.end.7591:
%.tmp7596 = load %m0$.File.type*, %m0$.File.type** %proc.7563
%.tmp7597 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7596)
%.tmp7598 = icmp ne i32 %.tmp7597, 0
br i1 %.tmp7598, label %.if.true.7599, label %.if.false.7599
.if.true.7599:
%.tmp7600 = load %m0$.File.type*, %m0$.File.type** %stderr.7533
%.tmp7602 = getelementptr [23 x i8], [23 x i8]*@.str7601, i32 0, i32 0
%.tmp7603 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7600, i8* %.tmp7602)
br label %.if.end.7599
.if.false.7599:
%.tmp7605 = getelementptr [32 x i8], [32 x i8]*@.str7604, i32 0, i32 0
%.tmp7606 = load i8*, i8** %filename.7537
%.tmp7607 = call i32(i8*,...) @printf(i8* %.tmp7605, i8* %.tmp7606)
br label %.if.end.7599
.if.end.7599:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7608 = load i32, i32* %argc
%.tmp7609 = icmp eq i32 %.tmp7608, 2
br i1 %.tmp7609, label %.if.true.7610, label %.if.false.7610
.if.true.7610:
ret void
br label %.if.end.7610
.if.false.7610:
br label %.if.end.7610
.if.end.7610:
%.tmp7612 = getelementptr [21 x i8], [21 x i8]*@.str7611, i32 0, i32 0
%tmpl.7613 = alloca i8*
store i8* %.tmp7612, i8** %tmpl.7613
%.tmp7614 = load i8**, i8*** %argv
%.tmp7615 = getelementptr i8*, i8** %.tmp7614, i32 0
%.tmp7616 = load i8*, i8** %.tmp7615
%.tmp7617 = call i32(i8*) @strlen(i8* %.tmp7616)
%.tmp7618 = load i8*, i8** %tmpl.7613
%.tmp7619 = call i32(i8*) @strlen(i8* %.tmp7618)
%.tmp7620 = add i32 %.tmp7617, %.tmp7619
%len_filename.7621 = alloca i32
store i32 %.tmp7620, i32* %len_filename.7621
%.tmp7622 = load i32, i32* %len_filename.7621
%.tmp7623 = call i8*(i32) @malloc(i32 %.tmp7622)
%buf.7624 = alloca i8*
store i8* %.tmp7623, i8** %buf.7624
%.tmp7625 = load i8*, i8** %buf.7624
%.tmp7626 = load i8*, i8** %tmpl.7613
%.tmp7627 = load i8**, i8*** %argv
%.tmp7628 = getelementptr i8*, i8** %.tmp7627, i32 0
%.tmp7629 = load i8*, i8** %.tmp7628
%.tmp7630 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7625, i8* %.tmp7626, i8* %.tmp7629)
%.tmp7631 = load i8*, i8** %buf.7624
%.tmp7632 = call i32(i8*) @puts(i8* %.tmp7631)
%.tmp7633 = load i8*, i8** %buf.7624
call void(i8*) @free(i8* %.tmp7633)
call void(i32) @exit(i32 1)
ret void
}
@.str7530 = constant [2 x i8] c"w\00"
@.str7549 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7558 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7560 = constant [2 x i8] c"w\00"
@.str7572 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7580 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7583 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7585 = constant [2 x i8] c"w\00"
@.str7593 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7601 = constant [23 x i8] c"error on gcc execution\00"
@.str7604 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7611 = constant [21 x i8] c"Usage: %s <filename>\00"
