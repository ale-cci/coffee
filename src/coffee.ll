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
%.tmp552 = icmp ne i8 %.tmp551, 45
br i1 %.tmp552, label %.if.true.553, label %.if.false.553
.if.true.553:
%.tmp554 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp556 = getelementptr [9 x i8], [9 x i8]*@.str555, i32 0, i32 0
%.tmp558 = getelementptr [2 x i8], [2 x i8]*@.str557, i32 0, i32 0
%.tmp559 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp554, i8* %.tmp556, i8* %.tmp558)
br label %.for.start.385
br label %.if.end.553
.if.false.553:
br label %.if.end.553
.if.end.553:
%.tmp560 = load i32, i32* %max_token_size.378
%.tmp561 = call i8*(i32) @malloc(i32 %.tmp560)
store i8* %.tmp561, i8** %buf.380
%.tmp562 = load i8*, i8** %buf.380
%.tmp563 = getelementptr i8, i8* %.tmp562, i32 0
store i8 45, i8* %.tmp563
store i32 1, i32* %idx.381
br label %.for.start.564
.for.start.564:
%.tmp565 = load i8, i8* %c.384
%.tmp566 = icmp ne i8 %.tmp565, 10
%.tmp567 = load i8, i8* %c.384
%.tmp568 = icmp ne i8 %.tmp567, 0
%.tmp569 = and i1 %.tmp566, %.tmp568
br i1 %.tmp569, label %.for.continue.564, label %.for.end.564
.for.continue.564:
%.tmp570 = load i32, i32* %idx.381
%.tmp571 = load i8*, i8** %buf.380
%.tmp572 = getelementptr i8, i8* %.tmp571, i32 %.tmp570
%.tmp573 = load i8, i8* %c.384
store i8 %.tmp573, i8* %.tmp572
%.tmp574 = load i32, i32* %idx.381
%.tmp575 = add i32 %.tmp574, 1
store i32 %.tmp575, i32* %idx.381
%.tmp576 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p
%.tmp577 = call i8(%m229$.PeekerInfo.type*) @m229$read.c.m229$.PeekerInfo.typep(%m229$.PeekerInfo.type* %.tmp576)
store i8 %.tmp577, i8* %c.384
br label %.for.start.564
.for.end.564:
%.tmp578 = load i32, i32* %idx.381
%.tmp579 = load i8*, i8** %buf.380
%.tmp580 = getelementptr i8, i8* %.tmp579, i32 %.tmp578
store i8 0, i8* %.tmp580
%.tmp581 = load i1, i1* %keep_comments
br i1 %.tmp581, label %.if.true.582, label %.if.false.582
.if.true.582:
%.tmp583 = load %m308$.ParseCtx.type*, %m308$.ParseCtx.type** %ctx.368
%.tmp585 = getelementptr [8 x i8], [8 x i8]*@.str584, i32 0, i32 0
%.tmp586 = load i8*, i8** %buf.380
%.tmp587 = call %m308$.Token.type*(%m308$.ParseCtx.type*,i8*,i8*) @m308$push_token.m308$.Token.typep.m308$.ParseCtx.typep.cp.cp(%m308$.ParseCtx.type* %.tmp583, i8* %.tmp585, i8* %.tmp586)
br label %.if.end.582
.if.false.582:
%.tmp588 = load i8*, i8** %buf.380
%.tmp589 = bitcast i8* %.tmp588 to i8*
call void(i8*) @free(i8* %.tmp589)
br label %.if.end.582
.if.end.582:
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
@.str555 = constant [9 x i8] c"OPERATOR\00"
@.str557 = constant [2 x i8] c"-\00"
@.str584 = constant [8 x i8] c"COMMENT\00"
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
%.tmp1864 = getelementptr [1697 x i8], [1697 x i8]*@.str1863, i32 0, i32 0
ret i8* %.tmp1864
}
@.str1863 = constant [1697 x i8] c"
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

operator: ( \22+\22 | \22/\22 | \22==\22 | \22!=\22 | \22|\22 | \22&\22 | \22<=\22 | \22>=\22 | \22<\22 | \22>\22 | \22*\22 | \22-\22 | \22%\22)

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

expressions: (expression)*

block: \22{\22 NL expressions (\22}\22)

for_loop: \22for\22 (declaration | assignment)? (\22;\22) (assignable)? (\22;\22) (assignment)? block (else_block)?
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
%.tmp2154 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2155 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2154, i32 0, i32 1
%.tmp2156 = load i8*, i8** %.tmp2155
%.tmp2158 = getelementptr [2 x i8], [2 x i8]*@.str2157, i32 0, i32 0
%.tmp2159 = call i32(i8*,i8*) @strcmp(i8* %.tmp2156, i8* %.tmp2158)
%.tmp2160 = icmp eq i32 %.tmp2159, 0
%.tmp2161 = or i1 %.tmp2153, %.tmp2160
br i1 %.tmp2161, label %.if.true.2162, label %.if.false.2162
.if.true.2162:
ret i32 3
br label %.if.end.2162
.if.false.2162:
%.tmp2163 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2164 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2163, i32 0, i32 1
%.tmp2165 = load i8*, i8** %.tmp2164
%.tmp2167 = getelementptr [3 x i8], [3 x i8]*@.str2166, i32 0, i32 0
%.tmp2168 = call i32(i8*,i8*) @strcmp(i8* %.tmp2165, i8* %.tmp2167)
%.tmp2169 = icmp eq i32 %.tmp2168, 0
%.tmp2170 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2171 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2170, i32 0, i32 1
%.tmp2172 = load i8*, i8** %.tmp2171
%.tmp2174 = getelementptr [3 x i8], [3 x i8]*@.str2173, i32 0, i32 0
%.tmp2175 = call i32(i8*,i8*) @strcmp(i8* %.tmp2172, i8* %.tmp2174)
%.tmp2176 = icmp eq i32 %.tmp2175, 0
%.tmp2177 = or i1 %.tmp2169, %.tmp2176
br i1 %.tmp2177, label %.if.true.2178, label %.if.false.2178
.if.true.2178:
ret i32 7
br label %.if.end.2178
.if.false.2178:
%.tmp2179 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2179, i32 0, i32 1
%.tmp2181 = load i8*, i8** %.tmp2180
%.tmp2183 = getelementptr [3 x i8], [3 x i8]*@.str2182, i32 0, i32 0
%.tmp2184 = call i32(i8*,i8*) @strcmp(i8* %.tmp2181, i8* %.tmp2183)
%.tmp2185 = icmp eq i32 %.tmp2184, 0
%.tmp2186 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2187 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2186, i32 0, i32 1
%.tmp2188 = load i8*, i8** %.tmp2187
%.tmp2190 = getelementptr [3 x i8], [3 x i8]*@.str2189, i32 0, i32 0
%.tmp2191 = call i32(i8*,i8*) @strcmp(i8* %.tmp2188, i8* %.tmp2190)
%.tmp2192 = icmp eq i32 %.tmp2191, 0
%.tmp2193 = or i1 %.tmp2185, %.tmp2192
br i1 %.tmp2193, label %.if.true.2194, label %.if.false.2194
.if.true.2194:
ret i32 6
br label %.if.end.2194
.if.false.2194:
%.tmp2195 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2195, i32 0, i32 1
%.tmp2197 = load i8*, i8** %.tmp2196
%.tmp2199 = getelementptr [2 x i8], [2 x i8]*@.str2198, i32 0, i32 0
%.tmp2200 = call i32(i8*,i8*) @strcmp(i8* %.tmp2197, i8* %.tmp2199)
%.tmp2201 = icmp eq i32 %.tmp2200, 0
%.tmp2202 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2203 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2202, i32 0, i32 1
%.tmp2204 = load i8*, i8** %.tmp2203
%.tmp2206 = getelementptr [2 x i8], [2 x i8]*@.str2205, i32 0, i32 0
%.tmp2207 = call i32(i8*,i8*) @strcmp(i8* %.tmp2204, i8* %.tmp2206)
%.tmp2208 = icmp eq i32 %.tmp2207, 0
%.tmp2209 = or i1 %.tmp2201, %.tmp2208
br i1 %.tmp2209, label %.if.true.2210, label %.if.false.2210
.if.true.2210:
ret i32 6
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
ret i32 11
br label %.if.end.2218
.if.false.2218:
%.tmp2219 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2220 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2219, i32 0, i32 1
%.tmp2221 = load i8*, i8** %.tmp2220
%.tmp2223 = getelementptr [2 x i8], [2 x i8]*@.str2222, i32 0, i32 0
%.tmp2224 = call i32(i8*,i8*) @strcmp(i8* %.tmp2221, i8* %.tmp2223)
%.tmp2225 = icmp eq i32 %.tmp2224, 0
br i1 %.tmp2225, label %.if.true.2226, label %.if.false.2226
.if.true.2226:
ret i32 12
br label %.if.end.2226
.if.false.2226:
br label %.if.end.2226
.if.end.2226:
br label %.if.end.2218
.if.end.2218:
br label %.if.end.2210
.if.end.2210:
br label %.if.end.2194
.if.end.2194:
br label %.if.end.2178
.if.end.2178:
br label %.if.end.2162
.if.end.2162:
br label %.if.end.2138
.if.end.2138:
%.tmp2228 = getelementptr [65 x i8], [65 x i8]*@.str2227, i32 0, i32 0
%.tmp2229 = load %m307$.Node.type*, %m307$.Node.type** %op.2122
%.tmp2230 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2229, i32 0, i32 1
%.tmp2231 = load i8*, i8** %.tmp2230
%.tmp2232 = call i32(i8*,...) @printf(i8* %.tmp2228, i8* %.tmp2231)
ret i32 4
}
@.str2031 = constant [16 x i8] c"mono_assignable\00"
@.str2042 = constant [9 x i8] c"operator\00"
@.str2079 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2126 = constant [2 x i8] c"+\00"
@.str2133 = constant [2 x i8] c"-\00"
@.str2142 = constant [2 x i8] c"*\00"
@.str2149 = constant [2 x i8] c"/\00"
@.str2157 = constant [2 x i8] c"%\00"
@.str2166 = constant [3 x i8] c"==\00"
@.str2173 = constant [3 x i8] c"!=\00"
@.str2182 = constant [3 x i8] c">=\00"
@.str2189 = constant [3 x i8] c"<=\00"
@.str2198 = constant [2 x i8] c">\00"
@.str2205 = constant [2 x i8] c"<\00"
@.str2214 = constant [2 x i8] c"&\00"
@.str2222 = constant [2 x i8] c"|\00"
@.str2227 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
define i8* @m2233$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2234 = load i8*, i8** %text
%.tmp2235 = call i32(i8*) @strlen(i8* %.tmp2234)
%str_len.2236 = alloca i32
store i32 %.tmp2235, i32* %str_len.2236
%dest_string.2237 = alloca {i32,i32,i8*}
%.tmp2238 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 0
store i32 0, i32* %.tmp2238
%.tmp2239 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
store i32 0, i32* %.tmp2239
%.tmp2240 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
store i8* null, i8** %.tmp2240
%.tmp2241 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 0
%.tmp2242 = load i32, i32* %str_len.2236
store i32 %.tmp2242, i32* %.tmp2241
%.tmp2243 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
store i32 0, i32* %.tmp2243
%.tmp2244 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2245 = load i32, i32* %str_len.2236
%.tmp2246 = call i8*(i32) @malloc(i32 %.tmp2245)
store i8* %.tmp2246, i8** %.tmp2244
%i.2248 = alloca i32
store i32 1, i32* %i.2248
br label %.for.start.2247
.for.start.2247:
%.tmp2249 = load i32, i32* %i.2248
%.tmp2250 = load i32, i32* %str_len.2236
%.tmp2251 = sub i32 %.tmp2250, 1
%.tmp2252 = icmp slt i32 %.tmp2249, %.tmp2251
br i1 %.tmp2252, label %.for.continue.2247, label %.for.end.2247
.for.continue.2247:
%.tmp2253 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2254 = load i32, i32* %.tmp2253
%.tmp2255 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 0
%.tmp2256 = load i32, i32* %.tmp2255
%.tmp2257 = sub i32 %.tmp2256, 5
%.tmp2258 = icmp eq i32 %.tmp2254, %.tmp2257
br i1 %.tmp2258, label %.if.true.2259, label %.if.false.2259
.if.true.2259:
%.tmp2260 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2261 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2262 = load i8*, i8** %.tmp2261
%.tmp2263 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 0
%.tmp2264 = load i32, i32* %.tmp2263
%.tmp2265 = mul i32 %.tmp2264, 2
%.tmp2266 = add i32 %.tmp2265, 1
%.tmp2267 = call i8*(i8*,i32) @realloc(i8* %.tmp2262, i32 %.tmp2266)
store i8* %.tmp2267, i8** %.tmp2260
br label %.if.end.2259
.if.false.2259:
br label %.if.end.2259
.if.end.2259:
%.tmp2268 = load i32, i32* %i.2248
%.tmp2269 = load i8*, i8** %text
%.tmp2270 = getelementptr i8, i8* %.tmp2269, i32 %.tmp2268
%.tmp2271 = load i8, i8* %.tmp2270
%.tmp2272 = icmp eq i8 %.tmp2271, 34
br i1 %.tmp2272, label %.if.true.2273, label %.if.false.2273
.if.true.2273:
%.tmp2274 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2275 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2276 = load i32, i32* %.tmp2275
%.tmp2277 = load i8*, i8** %.tmp2274
%.tmp2278 = getelementptr i8, i8* %.tmp2277, i32 %.tmp2276
store i8 92, i8* %.tmp2278
%.tmp2279 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2280 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2281 = load i32, i32* %.tmp2280
%.tmp2282 = add i32 %.tmp2281, 1
store i32 %.tmp2282, i32* %.tmp2279
%.tmp2283 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2284 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2285 = load i32, i32* %.tmp2284
%.tmp2286 = load i8*, i8** %.tmp2283
%.tmp2287 = getelementptr i8, i8* %.tmp2286, i32 %.tmp2285
store i8 50, i8* %.tmp2287
%.tmp2288 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2289 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2290 = load i32, i32* %.tmp2289
%.tmp2291 = add i32 %.tmp2290, 1
store i32 %.tmp2291, i32* %.tmp2288
%.tmp2292 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2293 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2294 = load i32, i32* %.tmp2293
%.tmp2295 = load i8*, i8** %.tmp2292
%.tmp2296 = getelementptr i8, i8* %.tmp2295, i32 %.tmp2294
store i8 50, i8* %.tmp2296
br label %.if.end.2273
.if.false.2273:
%.tmp2297 = load i32, i32* %i.2248
%.tmp2298 = load i8*, i8** %text
%.tmp2299 = getelementptr i8, i8* %.tmp2298, i32 %.tmp2297
%.tmp2300 = load i8, i8* %.tmp2299
%.tmp2301 = icmp eq i8 %.tmp2300, 92
br i1 %.tmp2301, label %.if.true.2302, label %.if.false.2302
.if.true.2302:
%.tmp2303 = load i32, i32* %i.2248
%.tmp2304 = add i32 %.tmp2303, 1
%.tmp2305 = load i8*, i8** %text
%.tmp2306 = getelementptr i8, i8* %.tmp2305, i32 %.tmp2304
%.tmp2307 = load i8, i8* %.tmp2306
%.tmp2308 = icmp eq i8 %.tmp2307, 110
%.tmp2309 = load i32, i32* %i.2248
%.tmp2310 = add i32 %.tmp2309, 1
%.tmp2311 = load i8*, i8** %text
%.tmp2312 = getelementptr i8, i8* %.tmp2311, i32 %.tmp2310
%.tmp2313 = load i8, i8* %.tmp2312
%.tmp2314 = icmp eq i8 %.tmp2313, 78
%.tmp2315 = or i1 %.tmp2308, %.tmp2314
br i1 %.tmp2315, label %.if.true.2316, label %.if.false.2316
.if.true.2316:
%.tmp2317 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2318 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2319 = load i32, i32* %.tmp2318
%.tmp2320 = load i8*, i8** %.tmp2317
%.tmp2321 = getelementptr i8, i8* %.tmp2320, i32 %.tmp2319
store i8 92, i8* %.tmp2321
%.tmp2322 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2323 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2324 = load i32, i32* %.tmp2323
%.tmp2325 = add i32 %.tmp2324, 1
store i32 %.tmp2325, i32* %.tmp2322
%.tmp2326 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2327 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2328 = load i32, i32* %.tmp2327
%.tmp2329 = load i8*, i8** %.tmp2326
%.tmp2330 = getelementptr i8, i8* %.tmp2329, i32 %.tmp2328
store i8 48, i8* %.tmp2330
%.tmp2331 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2332 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2333 = load i32, i32* %.tmp2332
%.tmp2334 = add i32 %.tmp2333, 1
store i32 %.tmp2334, i32* %.tmp2331
%.tmp2335 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2336 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2337 = load i32, i32* %.tmp2336
%.tmp2338 = load i8*, i8** %.tmp2335
%.tmp2339 = getelementptr i8, i8* %.tmp2338, i32 %.tmp2337
store i8 65, i8* %.tmp2339
%.tmp2340 = load i32, i32* %i.2248
%.tmp2341 = add i32 %.tmp2340, 1
store i32 %.tmp2341, i32* %i.2248
br label %.if.end.2316
.if.false.2316:
%.tmp2342 = load i32, i32* %i.2248
%.tmp2343 = add i32 %.tmp2342, 1
%.tmp2344 = load i8*, i8** %text
%.tmp2345 = getelementptr i8, i8* %.tmp2344, i32 %.tmp2343
%.tmp2346 = load i8, i8* %.tmp2345
%.tmp2347 = icmp eq i8 %.tmp2346, 92
br i1 %.tmp2347, label %.if.true.2348, label %.if.false.2348
.if.true.2348:
%.tmp2349 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2350 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2351 = load i32, i32* %.tmp2350
%.tmp2352 = load i8*, i8** %.tmp2349
%.tmp2353 = getelementptr i8, i8* %.tmp2352, i32 %.tmp2351
store i8 92, i8* %.tmp2353
%.tmp2354 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2355 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2356 = load i32, i32* %.tmp2355
%.tmp2357 = add i32 %.tmp2356, 1
store i32 %.tmp2357, i32* %.tmp2354
%.tmp2358 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2359 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2360 = load i32, i32* %.tmp2359
%.tmp2361 = load i8*, i8** %.tmp2358
%.tmp2362 = getelementptr i8, i8* %.tmp2361, i32 %.tmp2360
store i8 53, i8* %.tmp2362
%.tmp2363 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2364 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2365 = load i32, i32* %.tmp2364
%.tmp2366 = add i32 %.tmp2365, 1
store i32 %.tmp2366, i32* %.tmp2363
%.tmp2367 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2368 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2369 = load i32, i32* %.tmp2368
%.tmp2370 = load i8*, i8** %.tmp2367
%.tmp2371 = getelementptr i8, i8* %.tmp2370, i32 %.tmp2369
store i8 67, i8* %.tmp2371
%.tmp2372 = load i32, i32* %i.2248
%.tmp2373 = add i32 %.tmp2372, 1
store i32 %.tmp2373, i32* %i.2248
br label %.if.end.2348
.if.false.2348:
%.tmp2374 = load i32, i32* %i.2248
%.tmp2375 = add i32 %.tmp2374, 1
%.tmp2376 = load i8*, i8** %text
%.tmp2377 = getelementptr i8, i8* %.tmp2376, i32 %.tmp2375
%.tmp2378 = load i8, i8* %.tmp2377
%.tmp2379 = icmp eq i8 %.tmp2378, 120
br i1 %.tmp2379, label %.if.true.2380, label %.if.false.2380
.if.true.2380:
%.tmp2381 = load i32, i32* %i.2248
%.tmp2382 = add i32 %.tmp2381, 2
store i32 %.tmp2382, i32* %i.2248
%.tmp2383 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2384 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2385 = load i32, i32* %.tmp2384
%.tmp2386 = load i8*, i8** %.tmp2383
%.tmp2387 = getelementptr i8, i8* %.tmp2386, i32 %.tmp2385
store i8 92, i8* %.tmp2387
%.tmp2388 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2389 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2390 = load i32, i32* %.tmp2389
%.tmp2391 = add i32 %.tmp2390, 1
store i32 %.tmp2391, i32* %.tmp2388
%.tmp2392 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2393 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2394 = load i32, i32* %.tmp2393
%.tmp2395 = load i8*, i8** %.tmp2392
%.tmp2396 = getelementptr i8, i8* %.tmp2395, i32 %.tmp2394
%.tmp2397 = load i32, i32* %i.2248
%.tmp2398 = load i8*, i8** %text
%.tmp2399 = getelementptr i8, i8* %.tmp2398, i32 %.tmp2397
%.tmp2400 = load i8, i8* %.tmp2399
%.tmp2401 = call i8(i8) @toupper(i8 %.tmp2400)
store i8 %.tmp2401, i8* %.tmp2396
%.tmp2402 = load i32, i32* %i.2248
%.tmp2403 = add i32 %.tmp2402, 1
store i32 %.tmp2403, i32* %i.2248
%.tmp2404 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2405 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2406 = load i32, i32* %.tmp2405
%.tmp2407 = add i32 %.tmp2406, 1
store i32 %.tmp2407, i32* %.tmp2404
%.tmp2408 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2409 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2410 = load i32, i32* %.tmp2409
%.tmp2411 = load i8*, i8** %.tmp2408
%.tmp2412 = getelementptr i8, i8* %.tmp2411, i32 %.tmp2410
%.tmp2413 = load i32, i32* %i.2248
%.tmp2414 = load i8*, i8** %text
%.tmp2415 = getelementptr i8, i8* %.tmp2414, i32 %.tmp2413
%.tmp2416 = load i8, i8* %.tmp2415
%.tmp2417 = call i8(i8) @toupper(i8 %.tmp2416)
store i8 %.tmp2417, i8* %.tmp2412
br label %.if.end.2380
.if.false.2380:
%.tmp2418 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2419 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2420 = load i32, i32* %.tmp2419
%.tmp2421 = load i8*, i8** %.tmp2418
%.tmp2422 = getelementptr i8, i8* %.tmp2421, i32 %.tmp2420
%.tmp2423 = load i32, i32* %i.2248
%.tmp2424 = load i8*, i8** %text
%.tmp2425 = getelementptr i8, i8* %.tmp2424, i32 %.tmp2423
%.tmp2426 = load i8, i8* %.tmp2425
store i8 %.tmp2426, i8* %.tmp2422
br label %.if.end.2380
.if.end.2380:
br label %.if.end.2348
.if.end.2348:
br label %.if.end.2316
.if.end.2316:
br label %.if.end.2302
.if.false.2302:
%.tmp2427 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2428 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2429 = load i32, i32* %.tmp2428
%.tmp2430 = load i8*, i8** %.tmp2427
%.tmp2431 = getelementptr i8, i8* %.tmp2430, i32 %.tmp2429
%.tmp2432 = load i32, i32* %i.2248
%.tmp2433 = load i8*, i8** %text
%.tmp2434 = getelementptr i8, i8* %.tmp2433, i32 %.tmp2432
%.tmp2435 = load i8, i8* %.tmp2434
store i8 %.tmp2435, i8* %.tmp2431
br label %.if.end.2302
.if.end.2302:
br label %.if.end.2273
.if.end.2273:
%.tmp2436 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2437 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2438 = load i32, i32* %.tmp2437
%.tmp2439 = add i32 %.tmp2438, 1
store i32 %.tmp2439, i32* %.tmp2436
%.tmp2440 = load i32, i32* %i.2248
%.tmp2441 = add i32 %.tmp2440, 1
store i32 %.tmp2441, i32* %i.2248
br label %.for.start.2247
.for.end.2247:
%.tmp2442 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2443 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 1
%.tmp2444 = load i32, i32* %.tmp2443
%.tmp2445 = load i8*, i8** %.tmp2442
%.tmp2446 = getelementptr i8, i8* %.tmp2445, i32 %.tmp2444
store i8 0, i8* %.tmp2446
%buf.2447 = alloca i8*
store i8* null, i8** %buf.2447
%.tmp2448 = getelementptr i8*, i8** %buf.2447, i32 0
%.tmp2450 = getelementptr [9 x i8], [9 x i8]*@.str2449, i32 0, i32 0
%.tmp2451 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2452 = load i8*, i8** %.tmp2451
%.tmp2453 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2448, i8* %.tmp2450, i8* %.tmp2452)
%.tmp2454 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2237, i32 0, i32 2
%.tmp2455 = load i8*, i8** %.tmp2454
call void(i8*) @free(i8* %.tmp2455)
%.tmp2456 = load i8*, i8** %buf.2447
ret i8* %.tmp2456
}
define i32 @m2233$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2457 = alloca i32
store i32 0, i32* %len.2457
%i.2459 = alloca i32
store i32 2, i32* %i.2459
br label %.for.start.2458
.for.start.2458:
%.tmp2460 = load i32, i32* %i.2459
%.tmp2461 = load i8*, i8** %text
%.tmp2462 = getelementptr i8, i8* %.tmp2461, i32 %.tmp2460
%.tmp2463 = load i8, i8* %.tmp2462
%.tmp2464 = icmp ne i8 %.tmp2463, 0
br i1 %.tmp2464, label %.for.continue.2458, label %.for.end.2458
.for.continue.2458:
%.tmp2465 = load i32, i32* %i.2459
%.tmp2466 = load i8*, i8** %text
%.tmp2467 = getelementptr i8, i8* %.tmp2466, i32 %.tmp2465
%.tmp2468 = load i8, i8* %.tmp2467
%.tmp2469 = icmp eq i8 %.tmp2468, 92
br i1 %.tmp2469, label %.if.true.2470, label %.if.false.2470
.if.true.2470:
%.tmp2471 = load i32, i32* %i.2459
%.tmp2472 = add i32 %.tmp2471, 2
store i32 %.tmp2472, i32* %i.2459
br label %.if.end.2470
.if.false.2470:
br label %.if.end.2470
.if.end.2470:
%.tmp2473 = load i32, i32* %len.2457
%.tmp2474 = add i32 %.tmp2473, 1
store i32 %.tmp2474, i32* %len.2457
%.tmp2475 = load i32, i32* %i.2459
%.tmp2476 = add i32 %.tmp2475, 1
store i32 %.tmp2476, i32* %i.2459
br label %.for.start.2458
.for.end.2458:
%.tmp2477 = load i32, i32* %len.2457
%.tmp2478 = sub i32 %.tmp2477, 1
ret i32 %.tmp2478
}
define i8* @m2233$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2479 = alloca i32
store i32 0, i32* %intval.2479
%buf.2480 = alloca i8*
store i8* null, i8** %buf.2480
%chrval.2481 = alloca i8
store i8 0, i8* %chrval.2481
%.tmp2482 = load i8*, i8** %chr_repr
%.tmp2483 = call i32(i8*) @strlen(i8* %.tmp2482)
%chr_len.2484 = alloca i32
store i32 %.tmp2483, i32* %chr_len.2484
%.tmp2485 = load i32, i32* %chr_len.2484
%.tmp2486 = icmp eq i32 %.tmp2485, 6
br i1 %.tmp2486, label %.if.true.2487, label %.if.false.2487
.if.true.2487:
%.tmp2488 = load i8*, i8** %chr_repr
%.tmp2490 = getelementptr [7 x i8], [7 x i8]*@.str2489, i32 0, i32 0
%.tmp2491 = getelementptr i32, i32* %intval.2479, i32 0
%.tmp2492 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2488, i8* %.tmp2490, i32* %.tmp2491)
%.tmp2493 = getelementptr i8*, i8** %buf.2480, i32 0
%.tmp2495 = getelementptr [3 x i8], [3 x i8]*@.str2494, i32 0, i32 0
%.tmp2496 = load i32, i32* %intval.2479
%.tmp2497 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2493, i8* %.tmp2495, i32 %.tmp2496)
br label %.if.end.2487
.if.false.2487:
%.tmp2498 = load i32, i32* %chr_len.2484
%.tmp2499 = icmp eq i32 %.tmp2498, 5
br i1 %.tmp2499, label %.if.true.2500, label %.if.false.2500
.if.true.2500:
%.tmp2501 = load i8*, i8** %chr_repr
%.tmp2503 = getelementptr [6 x i8], [6 x i8]*@.str2502, i32 0, i32 0
%.tmp2504 = getelementptr i32, i32* %intval.2479, i32 0
%.tmp2505 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2501, i8* %.tmp2503, i32* %.tmp2504)
%.tmp2506 = getelementptr i8*, i8** %buf.2480, i32 0
%.tmp2508 = getelementptr [3 x i8], [3 x i8]*@.str2507, i32 0, i32 0
%.tmp2509 = load i32, i32* %intval.2479
%.tmp2510 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2506, i8* %.tmp2508, i32 %.tmp2509)
br label %.if.end.2500
.if.false.2500:
%.tmp2511 = load i32, i32* %chr_len.2484
%.tmp2512 = icmp eq i32 %.tmp2511, 4
br i1 %.tmp2512, label %.if.true.2513, label %.if.false.2513
.if.true.2513:
%.tmp2514 = load i8*, i8** %chr_repr
%.tmp2516 = getelementptr [6 x i8], [6 x i8]*@.str2515, i32 0, i32 0
%.tmp2517 = getelementptr i8, i8* %chrval.2481, i32 0
%.tmp2518 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2514, i8* %.tmp2516, i8* %.tmp2517)
%.tmp2519 = load i8, i8* %chrval.2481
%.tmp2520 = icmp eq i8 %.tmp2519, 110
br i1 %.tmp2520, label %.if.true.2521, label %.if.false.2521
.if.true.2521:
%.tmp2523 = getelementptr [3 x i8], [3 x i8]*@.str2522, i32 0, i32 0
store i8* %.tmp2523, i8** %buf.2480
br label %.if.end.2521
.if.false.2521:
%.tmp2524 = bitcast ptr null to i8*
ret i8* %.tmp2524
br label %.if.end.2521
.if.end.2521:
br label %.if.end.2513
.if.false.2513:
%.tmp2525 = load i32, i32* %chr_len.2484
%.tmp2526 = icmp eq i32 %.tmp2525, 3
br i1 %.tmp2526, label %.if.true.2527, label %.if.false.2527
.if.true.2527:
%.tmp2528 = load i8*, i8** %chr_repr
%.tmp2530 = getelementptr [5 x i8], [5 x i8]*@.str2529, i32 0, i32 0
%.tmp2531 = getelementptr i32, i32* %intval.2479, i32 0
%.tmp2532 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2528, i8* %.tmp2530, i32* %.tmp2531)
%.tmp2533 = getelementptr i8*, i8** %buf.2480, i32 0
%.tmp2535 = getelementptr [3 x i8], [3 x i8]*@.str2534, i32 0, i32 0
%.tmp2536 = load i32, i32* %intval.2479
%.tmp2537 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2533, i8* %.tmp2535, i32 %.tmp2536)
br label %.if.end.2527
.if.false.2527:
%.tmp2538 = bitcast ptr null to i8*
ret i8* %.tmp2538
br label %.if.end.2527
.if.end.2527:
br label %.if.end.2513
.if.end.2513:
br label %.if.end.2500
.if.end.2500:
br label %.if.end.2487
.if.end.2487:
%.tmp2539 = load i8*, i8** %buf.2480
ret i8* %.tmp2539
}
@.str2449 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2489 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2494 = constant [3 x i8] c"%d\00"
@.str2502 = constant [6 x i8] c"'\5C%x'\00"
@.str2507 = constant [3 x i8] c"%d\00"
@.str2515 = constant [6 x i8] c"'\5C%c'\00"
@.str2522 = constant [3 x i8] c"10\00"
@.str2529 = constant [5 x i8] c"'%c'\00"
@.str2534 = constant [3 x i8] c"%d\00"
define i8* @m2540$append_tmpl.cp() {
%.tmp2542 = getelementptr [1885 x i8], [1885 x i8]*@.str2541, i32 0, i32 0
ret i8* %.tmp2542
}
@.str2541 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
%%%1$s.tmp1 = load i32, i32* %%%1$s.tmp0
%%%1$s.tmp2 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 2
%%%1$s.tmp3 = load i32, i32* %%%1$s.tmp2
%%%1$s.tmp4 = icmp sge i32 %%%1$s.tmp1, %%%1$s.tmp3
br i1 %%%1$s.tmp4, label %%%1$s.if.true.9, label %%%1$s.if.end.9
%1$s.if.true.9:
%%%1$s.tmp6 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 2
%%%1$s.tmp7 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 2
%%%1$s.tmp8 = load i32, i32* %%%1$s.tmp7
%%%1$s.tmp9 = mul i32 %%%1$s.tmp8, 2
%%%1$s.tmp10 = add i32 %%%1$s.tmp9, 1
store i32 %%%1$s.tmp10, i32* %%%1$s.tmp6
%%%1$s.tmp11 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 0
%%%1$s.tmp12 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 0
%%%1$s.tmp13 = load %4$s*, %4$s** %%%1$s.tmp12
%%%1$s.tmp14 = bitcast %4$s* %%%1$s.tmp13 to i8*
%%%1$s.tmp15 = getelementptr %4$s, %4$s* null, i32 1
%%%1$s.tmp16 = ptrtoint %4$s* %%%1$s.tmp15 to i32
%%%1$s.tmp17 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 2
%%%1$s.tmp18 = load i32, i32* %%%1$s.tmp17
%%%1$s.tmp19 = mul i32 %%%1$s.tmp16, %%%1$s.tmp18
%%%1$s.tmp20 = call i8*(i8*,i32) @realloc(i8* %%%1$s.tmp14, i32 %%%1$s.tmp19)
%%%1$s.tmp21 = bitcast i8* %%%1$s.tmp20 to %4$s*
store %4$s* %%%1$s.tmp21, %4$s** %%%1$s.tmp11
br label %%%1$s.if.end.9
%1$s.if.end.9:
%%%1$s.tmp22 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 0
%%%1$s.tmp23 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
%%%1$s.tmp24 = load i32, i32* %%%1$s.tmp23
%%%1$s.tmp25 = load %4$s*, %4$s** %%%1$s.tmp22
%%%1$s.tmp26 = getelementptr %4$s, %4$s* %%%1$s.tmp25, i32 %%%1$s.tmp24
store %4$s %5$s, %4$s* %%%1$s.tmp26
%%%1$s.tmp27 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
%%%1$s.tmp28 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
%%%1$s.tmp29 = load i32, i32* %%%1$s.tmp28
%%%1$s.tmp30 = add i32 %%%1$s.tmp29, 1
store i32 %%%1$s.tmp30, i32* %%%1$s.tmp27
%6$s = load %2$s, %2$s* %3$s\0A\00"
@DEBUG_INTERNALS = constant i1 0
%m1861$.ErrorList.type = type {%m751$.Error.type*,%m1861$.ErrorList.type*,i1}
%m1861$.Type.type = type {i8*,i8*,i8*,%m1861$.Type.type*,%m1861$.Type.type*}
define %m1861$.Type.type* @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.t.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%.tmp2543 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2544 = icmp eq %m1861$.Type.type* %.tmp2543, null
br i1 %.tmp2544, label %.if.true.2545, label %.if.false.2545
.if.true.2545:
%.tmp2546 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp2546
br label %.if.end.2545
.if.false.2545:
br label %.if.end.2545
.if.end.2545:
%.tmp2547 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2548 = ptrtoint %m1861$.Type.type* %.tmp2547 to i32
%.tmp2549 = call i8*(i32) @malloc(i32 %.tmp2548)
%.tmp2550 = bitcast i8* %.tmp2549 to %m1861$.Type.type*
%clone.2551 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2550, %m1861$.Type.type** %clone.2551
%.tmp2552 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2551
%.tmp2553 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2552, i32 0, i32 3
%.tmp2554 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2555 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2554, i32 0, i32 3
%.tmp2556 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2555
store %m1861$.Type.type* %.tmp2556, %m1861$.Type.type** %.tmp2553
%.tmp2557 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2551
%.tmp2558 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2557, i32 0, i32 4
%.tmp2559 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2560 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2559, i32 0, i32 4
%.tmp2561 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2560
%.tmp2562 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2561)
store %m1861$.Type.type* %.tmp2562, %m1861$.Type.type** %.tmp2558
%.tmp2563 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2551
%.tmp2564 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2563, i32 0, i32 2
%.tmp2565 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2566 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2565, i32 0, i32 2
%.tmp2567 = load i8*, i8** %.tmp2566
store i8* %.tmp2567, i8** %.tmp2564
%.tmp2568 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2551
%.tmp2569 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2568, i32 0, i32 0
%.tmp2570 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2571 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2570, i32 0, i32 0
%.tmp2572 = load i8*, i8** %.tmp2571
store i8* %.tmp2572, i8** %.tmp2569
%.tmp2573 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2551
%.tmp2574 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2573, i32 0, i32 1
%.tmp2575 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2576 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2575, i32 0, i32 1
%.tmp2577 = load i8*, i8** %.tmp2576
store i8* %.tmp2577, i8** %.tmp2574
%.tmp2578 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2551
ret %m1861$.Type.type* %.tmp2578
}
define %m1861$.Type.type* @m1861$new_type.m1861$.Type.typep() {
%.tmp2579 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2580 = ptrtoint %m1861$.Type.type* %.tmp2579 to i32
%.tmp2581 = call i8*(i32) @malloc(i32 %.tmp2580)
%.tmp2582 = bitcast i8* %.tmp2581 to %m1861$.Type.type*
%type.2583 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2582, %m1861$.Type.type** %type.2583
%.tmp2584 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2583
%.tmp2585 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2584, i32 0, i32 1
store i8* null, i8** %.tmp2585
%.tmp2586 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2583
%.tmp2587 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2586, i32 0, i32 2
store i8* null, i8** %.tmp2587
%.tmp2588 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2583
%.tmp2589 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2588, i32 0, i32 0
store i8* null, i8** %.tmp2589
%.tmp2590 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2583
%.tmp2591 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2590, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2591
%.tmp2592 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2583
%.tmp2593 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2592, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2593
%.tmp2594 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2583
ret %m1861$.Type.type* %.tmp2594
}
define void @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.dest.arg, %m1861$.Type.type* %.src.arg) {
%dest = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.dest.arg, %m1861$.Type.type** %dest
%src = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.src.arg, %m1861$.Type.type** %src
%.tmp2595 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2596 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2595, i32 0, i32 0
%.tmp2597 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2598 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2597, i32 0, i32 0
%.tmp2599 = load i8*, i8** %.tmp2598
store i8* %.tmp2599, i8** %.tmp2596
%.tmp2600 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2601 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2600, i32 0, i32 1
%.tmp2602 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2603 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2602, i32 0, i32 1
%.tmp2604 = load i8*, i8** %.tmp2603
store i8* %.tmp2604, i8** %.tmp2601
%.tmp2605 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2606 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2605, i32 0, i32 2
%.tmp2607 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2608 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2607, i32 0, i32 2
%.tmp2609 = load i8*, i8** %.tmp2608
store i8* %.tmp2609, i8** %.tmp2606
%.tmp2610 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2611 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2610, i32 0, i32 3
%.tmp2612 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2611
%.tmp2613 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2614 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2613, i32 0, i32 3
%.tmp2615 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2614
%.tmp2616 = icmp ne %m1861$.Type.type* %.tmp2612, %.tmp2615
br i1 %.tmp2616, label %.if.true.2617, label %.if.false.2617
.if.true.2617:
%.tmp2618 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2619 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2618, i32 0, i32 3
%.tmp2620 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2621 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2620, i32 0, i32 3
%.tmp2622 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2621
store %m1861$.Type.type* %.tmp2622, %m1861$.Type.type** %.tmp2619
%.tmp2623 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2624 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2623, i32 0, i32 3
%.tmp2625 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2624
%.tmp2626 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2627 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2626, i32 0, i32 3
%.tmp2628 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2627
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2625, %m1861$.Type.type* %.tmp2628)
br label %.if.end.2617
.if.false.2617:
br label %.if.end.2617
.if.end.2617:
%.tmp2629 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2630 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2629, i32 0, i32 4
%.tmp2631 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2630
%.tmp2632 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2633 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2632, i32 0, i32 4
%.tmp2634 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2633
%.tmp2635 = icmp ne %m1861$.Type.type* %.tmp2631, %.tmp2634
br i1 %.tmp2635, label %.if.true.2636, label %.if.false.2636
.if.true.2636:
%.tmp2637 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2638 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2637, i32 0, i32 4
%.tmp2639 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2640 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2639, i32 0, i32 4
%.tmp2641 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2640
store %m1861$.Type.type* %.tmp2641, %m1861$.Type.type** %.tmp2638
%.tmp2642 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2643 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2642, i32 0, i32 4
%.tmp2644 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2643
%.tmp2645 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2646 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2645, i32 0, i32 4
%.tmp2647 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2646
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2644, %m1861$.Type.type* %.tmp2647)
br label %.if.end.2636
.if.false.2636:
br label %.if.end.2636
.if.end.2636:
ret void
}
define void @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2648 = load i32, i32* %level
%.tmp2649 = add i32 %.tmp2648, 1
%.tmp2650 = call i8*(i32) @malloc(i32 %.tmp2649)
%.tmp2651 = bitcast i8* %.tmp2650 to i8*
%indent.2652 = alloca i8*
store i8* %.tmp2651, i8** %indent.2652
%i.2654 = alloca i32
store i32 0, i32* %i.2654
br label %.for.start.2653
.for.start.2653:
%.tmp2655 = load i32, i32* %i.2654
%.tmp2656 = load i32, i32* %level
%.tmp2657 = icmp slt i32 %.tmp2655, %.tmp2656
br i1 %.tmp2657, label %.for.continue.2653, label %.for.end.2653
.for.continue.2653:
%.tmp2658 = load i32, i32* %i.2654
%.tmp2659 = load i8*, i8** %indent.2652
%.tmp2660 = getelementptr i8, i8* %.tmp2659, i32 %.tmp2658
store i8 32, i8* %.tmp2660
%.tmp2661 = load i32, i32* %i.2654
%.tmp2662 = add i32 %.tmp2661, 1
store i32 %.tmp2662, i32* %i.2654
br label %.for.start.2653
.for.end.2653:
%.tmp2663 = load i32, i32* %level
%.tmp2664 = load i8*, i8** %indent.2652
%.tmp2665 = getelementptr i8, i8* %.tmp2664, i32 %.tmp2663
store i8 0, i8* %.tmp2665
%.tmp2667 = getelementptr [5 x i8], [5 x i8]*@.str2666, i32 0, i32 0
%.tmp2668 = load i8*, i8** %indent.2652
%.tmp2669 = call i32(i8*,...) @printf(i8* %.tmp2667, i8* %.tmp2668)
%.tmp2671 = getelementptr [21 x i8], [21 x i8]*@.str2670, i32 0, i32 0
%.tmp2672 = load i8*, i8** %indent.2652
%.tmp2673 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2674 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2673, i32 0, i32 0
%.tmp2675 = load i8*, i8** %.tmp2674
%.tmp2676 = call i32(i8*,...) @printf(i8* %.tmp2671, i8* %.tmp2672, i8* %.tmp2675)
%.tmp2678 = getelementptr [16 x i8], [16 x i8]*@.str2677, i32 0, i32 0
%.tmp2679 = load i8*, i8** %indent.2652
%.tmp2680 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2681 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2680, i32 0, i32 1
%.tmp2682 = load i8*, i8** %.tmp2681
%.tmp2683 = call i32(i8*,...) @printf(i8* %.tmp2678, i8* %.tmp2679, i8* %.tmp2682)
%.tmp2685 = getelementptr [16 x i8], [16 x i8]*@.str2684, i32 0, i32 0
%.tmp2686 = load i8*, i8** %indent.2652
%.tmp2687 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2688 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2687, i32 0, i32 2
%.tmp2689 = load i8*, i8** %.tmp2688
%.tmp2690 = call i32(i8*,...) @printf(i8* %.tmp2685, i8* %.tmp2686, i8* %.tmp2689)
%.tmp2691 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2692 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2691, i32 0, i32 3
%.tmp2693 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2692
%.tmp2694 = icmp eq %m1861$.Type.type* %.tmp2693, null
br i1 %.tmp2694, label %.if.true.2695, label %.if.false.2695
.if.true.2695:
%.tmp2697 = getelementptr [16 x i8], [16 x i8]*@.str2696, i32 0, i32 0
%.tmp2698 = load i8*, i8** %indent.2652
%.tmp2699 = call i32(i8*,...) @printf(i8* %.tmp2697, i8* %.tmp2698)
br label %.if.end.2695
.if.false.2695:
%.tmp2701 = getelementptr [10 x i8], [10 x i8]*@.str2700, i32 0, i32 0
%.tmp2702 = load i8*, i8** %indent.2652
%.tmp2703 = call i32(i8*,...) @printf(i8* %.tmp2701, i8* %.tmp2702)
%.tmp2704 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2705 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2704, i32 0, i32 3
%.tmp2706 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2705
%.tmp2707 = load i32, i32* %level
%.tmp2708 = add i32 %.tmp2707, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2706, i32 %.tmp2708)
br label %.if.end.2695
.if.end.2695:
%.tmp2709 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2710 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2709, i32 0, i32 4
%.tmp2711 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2710
%.tmp2712 = icmp eq %m1861$.Type.type* %.tmp2711, null
br i1 %.tmp2712, label %.if.true.2713, label %.if.false.2713
.if.true.2713:
%.tmp2715 = getelementptr [18 x i8], [18 x i8]*@.str2714, i32 0, i32 0
%.tmp2716 = load i8*, i8** %indent.2652
%.tmp2717 = call i32(i8*,...) @printf(i8* %.tmp2715, i8* %.tmp2716)
br label %.if.end.2713
.if.false.2713:
%.tmp2719 = getelementptr [12 x i8], [12 x i8]*@.str2718, i32 0, i32 0
%.tmp2720 = load i8*, i8** %indent.2652
%.tmp2721 = call i32(i8*,...) @printf(i8* %.tmp2719, i8* %.tmp2720)
%.tmp2722 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2723 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2722, i32 0, i32 4
%.tmp2724 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2723
%.tmp2725 = load i32, i32* %level
%.tmp2726 = add i32 %.tmp2725, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2724, i32 %.tmp2726)
br label %.if.end.2713
.if.end.2713:
%.tmp2728 = getelementptr [5 x i8], [5 x i8]*@.str2727, i32 0, i32 0
%.tmp2729 = load i8*, i8** %indent.2652
%.tmp2730 = call i32(i8*,...) @printf(i8* %.tmp2728, i8* %.tmp2729)
ret void
}
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,%m1861$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1861$.AssignableInfo.type* @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.node.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2731 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* null, i32 1
%.tmp2732 = ptrtoint %m1861$.AssignableInfo.type* %.tmp2731 to i32
%.tmp2733 = call i8*(i32) @malloc(i32 %.tmp2732)
%.tmp2734 = bitcast i8* %.tmp2733 to %m1861$.AssignableInfo.type*
%ptr.2735 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp2734, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2736 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2737 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2736, i32 0, i32 1
%.tmp2738 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2738, i8* %.tmp2737
%.tmp2739 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2740 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2739, i32 0, i32 0
store i8* null, i8** %.tmp2740
%.tmp2741 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2742 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2741, i32 0, i32 2
store i8* null, i8** %.tmp2742
%.tmp2743 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2744 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2743, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2744
%.tmp2745 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2746 = icmp ne %m307$.Node.type* %.tmp2745, null
br i1 %.tmp2746, label %.if.true.2747, label %.if.false.2747
.if.true.2747:
%.tmp2748 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2749 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2748, i32 0, i32 4
%.tmp2750 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2751 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2750, i32 0, i32 3
%.tmp2752 = load i32, i32* %.tmp2751
store i32 %.tmp2752, i32* %.tmp2749
%.tmp2753 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2754 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2753, i32 0, i32 5
%.tmp2755 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2756 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2755, i32 0, i32 4
%.tmp2757 = load i32, i32* %.tmp2756
store i32 %.tmp2757, i32* %.tmp2754
%.tmp2758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2759 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2758, i32 0, i32 6
%.tmp2760 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2761 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2760, i32 0, i32 2
%.tmp2762 = load i8*, i8** %.tmp2761
store i8* %.tmp2762, i8** %.tmp2759
br label %.if.end.2747
.if.false.2747:
%.tmp2763 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2764 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2763, i32 0, i32 4
store i32 0, i32* %.tmp2764
%.tmp2765 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2766 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2765, i32 0, i32 5
store i32 0, i32* %.tmp2766
%.tmp2767 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
%.tmp2768 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2767, i32 0, i32 6
store i8* null, i8** %.tmp2768
br label %.if.end.2747
.if.end.2747:
%.tmp2769 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2735
ret %m1861$.AssignableInfo.type* %.tmp2769
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2770 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2771 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2770, i32 0, i32 0
%.tmp2772 = load i8*, i8** %id
store i8* %.tmp2772, i8** %.tmp2771
%.tmp2773 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2774 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2773, i32 0, i32 1
%.tmp2775 = load i8, i8* %scope
store i8 %.tmp2775, i8* %.tmp2774
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2776 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2777 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2776, i32 0, i32 1
%.tmp2778 = load i8, i8* %.tmp2777
%.tmp2779 = load i8, i8* @SCOPE_CONST
%.tmp2780 = icmp eq i8 %.tmp2778, %.tmp2779
br i1 %.tmp2780, label %.if.true.2781, label %.if.false.2781
.if.true.2781:
%.tmp2782 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2783 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2782, i32 0, i32 0
%.tmp2784 = load i8*, i8** %.tmp2783
ret i8* %.tmp2784
br label %.if.end.2781
.if.false.2781:
br label %.if.end.2781
.if.end.2781:
%buf.2785 = alloca i8*
store i8* null, i8** %buf.2785
%.tmp2786 = getelementptr i8*, i8** %buf.2785, i32 0
%.tmp2788 = getelementptr [5 x i8], [5 x i8]*@.str2787, i32 0, i32 0
%.tmp2789 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2790 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2789, i32 0, i32 1
%.tmp2791 = load i8, i8* %.tmp2790
%.tmp2792 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2793 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2792, i32 0, i32 0
%.tmp2794 = load i8*, i8** %.tmp2793
%.tmp2795 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2786, i8* %.tmp2788, i8 %.tmp2791, i8* %.tmp2794)
%.tmp2796 = load i8*, i8** %buf.2785
ret i8* %.tmp2796
}
%m1861$.ScopeItem.type = type {i8*,%m1861$.AssignableInfo.type*,%m1861$.ScopeItem.type*}
%m1861$.GlobalName.type = type {i8*,i8*,i1,%m1861$.AssignableInfo.type*,%m1861$.GlobalName.type*}
%m1861$.Scope.type = type {i8*,%m1861$.ScopeItem.type*,i8*,i8*,i8*,%m1861$.Scope.type*}
%m1861$.ModuleLookup.type = type {i8*,i8*,%m1861$.ModuleLookup.type*,%m1861$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1861$.CompilerCtx.type = type {%m307$.Node.type*,%m0$.File.type*,%m1861$.ErrorList.type*,%m1861$.GlobalName.type*,%m307$.Rule.type**,i32,%m1861$.ModuleLookup.type*,i8*}
define void @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%tmp_buff.2797 = alloca i8*
store i8* null, i8** %tmp_buff.2797
%.tmp2798 = getelementptr i8*, i8** %tmp_buff.2797, i32 0
%.tmp2800 = getelementptr [7 x i8], [7 x i8]*@.str2799, i32 0, i32 0
%.tmp2801 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2802 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2801)
%.tmp2803 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2798, i8* %.tmp2800, i32 %.tmp2802)
%.tmp2804 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2805 = load i8, i8* @SCOPE_LOCAL
%.tmp2806 = load i8*, i8** %tmp_buff.2797
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2804, i8 %.tmp2805, i8* %.tmp2806)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2808 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2809 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2808, i32 0, i32 6
%.tmp2810 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2809
%m.2811 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2810, %m1861$.ModuleLookup.type** %m.2811
br label %.for.start.2807
.for.start.2807:
%.tmp2812 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2811
%.tmp2813 = icmp ne %m1861$.ModuleLookup.type* %.tmp2812, null
br i1 %.tmp2813, label %.for.continue.2807, label %.for.end.2807
.for.continue.2807:
%.tmp2814 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2811
%.tmp2815 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2814, i32 0, i32 0
%.tmp2816 = load i8*, i8** %.tmp2815
%.tmp2817 = load i8*, i8** %filename
%.tmp2818 = call i32(i8*,i8*) @strcmp(i8* %.tmp2816, i8* %.tmp2817)
%.tmp2819 = icmp eq i32 %.tmp2818, 0
br i1 %.tmp2819, label %.if.true.2820, label %.if.false.2820
.if.true.2820:
%.tmp2821 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2811
ret %m1861$.ModuleLookup.type* %.tmp2821
br label %.if.end.2820
.if.false.2820:
br label %.if.end.2820
.if.end.2820:
%.tmp2822 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2811
%.tmp2823 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2822, i32 0, i32 2
%.tmp2824 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2823
store %m1861$.ModuleLookup.type* %.tmp2824, %m1861$.ModuleLookup.type** %m.2811
br label %.for.start.2807
.for.end.2807:
%.tmp2825 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2825
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2826 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2827 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2828 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2827, i32 0, i32 7
%.tmp2829 = load i8*, i8** %.tmp2828
%.tmp2830 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2826, i8* %.tmp2829)
ret %m1861$.ModuleLookup.type* %.tmp2830
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2831 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2832 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2831, i32 0, i32 5
%.tmp2833 = load i32, i32* %.tmp2832
%uid.2834 = alloca i32
store i32 %.tmp2833, i32* %uid.2834
%.tmp2835 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2836 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2835, i32 0, i32 5
%.tmp2837 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2838 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2837, i32 0, i32 5
%.tmp2839 = load i32, i32* %.tmp2838
%.tmp2840 = add i32 %.tmp2839, 1
store i32 %.tmp2840, i32* %.tmp2836
%.tmp2841 = load i32, i32* %uid.2834
ret i32 %.tmp2841
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2842 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2843 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2842 to i32
%.tmp2844 = call i8*(i32) @malloc(i32 %.tmp2843)
%.tmp2845 = bitcast i8* %.tmp2844 to %m1861$.CompilerCtx.type*
%ctx.2846 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2845, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2847 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2848 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2847, i32 0, i32 1
%.tmp2849 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2849, %m0$.File.type** %.tmp2848
%.tmp2850 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2851 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2850, i32 0, i32 0
%.tmp2852 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2852, %m307$.Node.type** %.tmp2851
%.tmp2853 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2854 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2853, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2854
%.tmp2855 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2856 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2855, i32 0, i32 5
store i32 0, i32* %.tmp2856
%.tmp2857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2858 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2857, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2858
%.tmp2859 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2860 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2859, i32 0, i32 7
%.tmp2861 = load i8*, i8** %filename
store i8* %.tmp2861, i8** %.tmp2860
%.tmp2862 = call i8*() @m1862$grammar.cp()
%.tmp2863 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2862)
%grammar_file.2864 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2863, %m0$.File.type** %grammar_file.2864
%.tmp2865 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2864
%.tmp2866 = icmp eq %m0$.File.type* %.tmp2865, null
br i1 %.tmp2866, label %.if.true.2867, label %.if.false.2867
.if.true.2867:
%.tmp2868 = bitcast ptr null to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2868
br label %.if.end.2867
.if.false.2867:
br label %.if.end.2867
.if.end.2867:
%.tmp2869 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2864
%.tmp2870 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2869)
%grammar_ctx.2871 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2870, %m307$.ParsingContext.type** %grammar_ctx.2871
%.tmp2872 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2864
%.tmp2873 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2872)
%.tmp2874 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2875 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2874, i32 0, i32 4
%.tmp2876 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2871
%.tmp2877 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2876)
store %m307$.Rule.type** %.tmp2877, %m307$.Rule.type*** %.tmp2875
%.tmp2878 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2879 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2878, i32 0, i32 6
%.tmp2880 = load i32, i32* @ModuleLookup_size
%.tmp2881 = call i8*(i32) @malloc(i32 %.tmp2880)
%.tmp2882 = bitcast i8* %.tmp2881 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2882, %m1861$.ModuleLookup.type** %.tmp2879
%.tmp2883 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2884 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2883, i32 0, i32 6
%.tmp2885 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2884
%.tmp2886 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2885, i32 0, i32 0
%.tmp2887 = load i8*, i8** %filename
store i8* %.tmp2887, i8** %.tmp2886
%.tmp2888 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2889 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2888, i32 0, i32 6
%.tmp2890 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2889
%.tmp2891 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2890, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2891
%.tmp2892 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2893 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2892, i32 0, i32 6
%.tmp2894 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2893
%.tmp2895 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2894, i32 0, i32 1
%.tmp2897 = getelementptr [1 x i8], [1 x i8]*@.str2896, i32 0, i32 0
store i8* %.tmp2897, i8** %.tmp2895
%.tmp2898 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2899 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2898, i32 0, i32 6
%.tmp2900 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2899
%.tmp2901 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2900, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2901
%.tmp2902 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2846
%.tmp2903 = bitcast %m1861$.CompilerCtx.type* %.tmp2902 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2903
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
%.tmp2904 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2905 = ptrtoint %m1861$.Scope.type* %.tmp2904 to i32
%.tmp2906 = call i8*(i32) @malloc(i32 %.tmp2905)
%.tmp2907 = bitcast i8* %.tmp2906 to %m1861$.Scope.type*
%s.2908 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2907, %m1861$.Scope.type** %s.2908
%.tmp2909 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2910 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2909)
%m.2911 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2910, %m1861$.ModuleLookup.type** %m.2911
%.tmp2912 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2908
%.tmp2913 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2912, i32 0, i32 5
%.tmp2914 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2911
%.tmp2915 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2914, i32 0, i32 3
%.tmp2916 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2915
store %m1861$.Scope.type* %.tmp2916, %m1861$.Scope.type** %.tmp2913
%.tmp2917 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2908
%.tmp2918 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2917, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2918
%.tmp2919 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2908
%.tmp2920 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2919, i32 0, i32 2
%.tmp2921 = load i8*, i8** %type
store i8* %.tmp2921, i8** %.tmp2920
%.tmp2922 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2908
%.tmp2923 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2922, i32 0, i32 3
%.tmp2924 = load i8*, i8** %begin_id
store i8* %.tmp2924, i8** %.tmp2923
%.tmp2925 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2908
%.tmp2926 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2925, i32 0, i32 4
%.tmp2927 = load i8*, i8** %end_id
store i8* %.tmp2927, i8** %.tmp2926
%.tmp2928 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2911
%.tmp2929 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2928, i32 0, i32 3
%.tmp2930 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2908
store %m1861$.Scope.type* %.tmp2930, %m1861$.Scope.type** %.tmp2929
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2931 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2932 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2931)
%m.2933 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2932, %m1861$.ModuleLookup.type** %m.2933
%.tmp2934 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2933
%.tmp2935 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2934, i32 0, i32 3
%.tmp2936 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2935
%.tmp2937 = icmp ne %m1861$.Scope.type* %.tmp2936, null
%.tmp2939 = getelementptr [61 x i8], [61 x i8]*@.str2938, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2937, i8* %.tmp2939)
%.tmp2940 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2933
%.tmp2941 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2940, i32 0, i32 3
%.tmp2942 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2933
%.tmp2943 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2942, i32 0, i32 3
%.tmp2944 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2943
%.tmp2945 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2944, i32 0, i32 5
%.tmp2946 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2945
store %m1861$.Scope.type* %.tmp2946, %m1861$.Scope.type** %.tmp2941
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2947 = call i8*() @m1862$grammar.cp()
%.tmp2948 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2947)
%grammar_file.2949 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2948, %m0$.File.type** %grammar_file.2949
%.tmp2950 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2949
%.tmp2951 = icmp eq %m0$.File.type* %.tmp2950, null
br i1 %.tmp2951, label %.if.true.2952, label %.if.false.2952
.if.true.2952:
ret i1 0
br label %.if.end.2952
.if.false.2952:
br label %.if.end.2952
.if.end.2952:
%.tmp2953 = load i8*, i8** %filepath
%.tmp2954 = load i32, i32* @O_RDONLY
%.tmp2955 = call i32(i8*,i32) @open(i8* %.tmp2953, i32 %.tmp2954)
%input_fd.2956 = alloca i32
store i32 %.tmp2955, i32* %input_fd.2956
%.tmp2957 = load i32, i32* %input_fd.2956
%.tmp2958 = icmp sle i32 %.tmp2957, 0
br i1 %.tmp2958, label %.if.true.2959, label %.if.false.2959
.if.true.2959:
%err_msg.2960 = alloca i8*
store i8* null, i8** %err_msg.2960
%.tmp2961 = getelementptr i8*, i8** %err_msg.2960, i32 0
%.tmp2963 = getelementptr [26 x i8], [26 x i8]*@.str2962, i32 0, i32 0
%.tmp2964 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2965 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2961, i8* %.tmp2963, %m307$.Node.type* %.tmp2964)
%.tmp2966 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2967 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2968 = load i8*, i8** %err_msg.2960
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2966, %m307$.Node.type* %.tmp2967, i8* %.tmp2968)
ret i1 0
br label %.if.end.2959
.if.false.2959:
br label %.if.end.2959
.if.end.2959:
%.tmp2969 = load i32, i32* %input_fd.2956
%.tmp2970 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2969)
%p.2971 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2970, %m229$.PeekerInfo.type** %p.2971
%.tmp2972 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2971
%.tmp2973 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2972, i32 0, i32 6
%.tmp2974 = load i8*, i8** %filepath
store i8* %.tmp2974, i8** %.tmp2973
%.tmp2975 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2971
%.tmp2976 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2975, i1 0)
%tokens.2977 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2976, %m308$.Token.type** %tokens.2977
%.tmp2978 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2979 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2978, i32 0, i32 4
%.tmp2980 = load %m307$.Rule.type**, %m307$.Rule.type*** %.tmp2979
%.tmp2982 = getelementptr [6 x i8], [6 x i8]*@.str2981, i32 0, i32 0
%.tmp2983 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2977
%.tmp2984 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2980, i8* %.tmp2982, %m308$.Token.type* %.tmp2983)
%ast.2985 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2984, %m307$.ParseResult.type** %ast.2985
%.tmp2986 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2985
%.tmp2987 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2986, i32 0, i32 0
%.tmp2988 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2987
%.tmp2989 = icmp ne %m751$.Error.type* %.tmp2988, null
br i1 %.tmp2989, label %.if.true.2990, label %.if.false.2990
.if.true.2990:
%.tmp2991 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2992 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2985
%.tmp2993 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2992, i32 0, i32 0
%.tmp2994 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2993
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp2991, %m751$.Error.type* %.tmp2994)
br label %.if.end.2990
.if.false.2990:
br label %.if.end.2990
.if.end.2990:
%.tmp2995 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2996 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2985
%.tmp2997 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2996, i32 0, i32 1
%.tmp2998 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2997
%.tmp2999 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2995, %m307$.Node.type* %.tmp2998)
ret i1 %.tmp2999
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp3000 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3001 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3000, i32 0, i32 2
%.tmp3002 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3001
%.tmp3003 = icmp eq %m1861$.ErrorList.type* %.tmp3002, null
br i1 %.tmp3003, label %.if.true.3004, label %.if.false.3004
.if.true.3004:
%.tmp3005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3006 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3005, %m307$.Node.type* %.tmp3006)
br label %.if.end.3004
.if.false.3004:
br label %.if.end.3004
.if.end.3004:
%.tmp3007 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3008 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3007, i32 0, i32 2
%.tmp3009 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3008
%.tmp3010 = icmp ne %m1861$.ErrorList.type* %.tmp3009, null
%has_errors.3011 = alloca i1
store i1 %.tmp3010, i1* %has_errors.3011
%.tmp3013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3014 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3013, i32 0, i32 2
%.tmp3015 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3014
%err.3016 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp3015, %m1861$.ErrorList.type** %err.3016
br label %.for.start.3012
.for.start.3012:
%.tmp3017 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3016
%.tmp3018 = icmp ne %m1861$.ErrorList.type* %.tmp3017, null
br i1 %.tmp3018, label %.for.continue.3012, label %.for.end.3012
.for.continue.3012:
%.tmp3019 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3016
%.tmp3020 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3019, i32 0, i32 2
%.tmp3021 = load i1, i1* %.tmp3020
%.tmp3022 = icmp eq i1 %.tmp3021, 0
br i1 %.tmp3022, label %.if.true.3023, label %.if.false.3023
.if.true.3023:
%.tmp3024 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3016
%.tmp3025 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3024, i32 0, i32 0
%.tmp3026 = load %m751$.Error.type*, %m751$.Error.type** %.tmp3025
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp3026)
%.tmp3027 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3016
%.tmp3028 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3027, i32 0, i32 2
store i1 1, i1* %.tmp3028
br label %.if.end.3023
.if.false.3023:
br label %.if.end.3023
.if.end.3023:
%.tmp3029 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3016
%.tmp3030 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3029, i32 0, i32 1
%.tmp3031 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3030
store %m1861$.ErrorList.type* %.tmp3031, %m1861$.ErrorList.type** %err.3016
br label %.for.start.3012
.for.end.3012:
%.tmp3033 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3034 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3033, i32 0, i32 3
%.tmp3035 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3034
%g.3036 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp3035, %m1861$.GlobalName.type** %g.3036
br label %.for.start.3032
.for.start.3032:
%.tmp3037 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3036
%.tmp3038 = icmp ne %m1861$.GlobalName.type* %.tmp3037, null
br i1 %.tmp3038, label %.for.continue.3032, label %.for.end.3032
.for.continue.3032:
%.tmp3039 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3040 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3036
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp3039, %m1861$.GlobalName.type* %.tmp3040)
%.tmp3041 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3036
%.tmp3042 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3041, i32 0, i32 4
%.tmp3043 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3042
store %m1861$.GlobalName.type* %.tmp3043, %m1861$.GlobalName.type** %g.3036
br label %.for.start.3032
.for.end.3032:
%.tmp3044 = load i1, i1* %has_errors.3011
ret i1 %.tmp3044
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp3045 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3046 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3045, i32 0, i32 0
%.tmp3047 = load i8*, i8** %.tmp3046
%.tmp3049 = getelementptr [6 x i8], [6 x i8]*@.str3048, i32 0, i32 0
%.tmp3050 = call i32(i8*,i8*) @strcmp(i8* %.tmp3047, i8* %.tmp3049)
%.tmp3051 = icmp ne i32 %.tmp3050, 0
br i1 %.tmp3051, label %.if.true.3052, label %.if.false.3052
.if.true.3052:
ret void
br label %.if.end.3052
.if.false.3052:
br label %.if.end.3052
.if.end.3052:
%.tmp3053 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3055 = getelementptr [7 x i8], [7 x i8]*@.str3054, i32 0, i32 0
%.tmp3056 = bitcast ptr null to i8*
%.tmp3057 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3053, i8* %.tmp3055, i8* %.tmp3056, i8* %.tmp3057)
%.tmp3058 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3059 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3058, i32 0, i32 6
%.tmp3060 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3059
%start.3061 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3060, %m307$.Node.type** %start.3061
%.tmp3062 = load %m307$.Node.type*, %m307$.Node.type** %start.3061
%.tmp3063 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3062, i32 0, i32 0
%.tmp3064 = load i8*, i8** %.tmp3063
%.tmp3066 = getelementptr [13 x i8], [13 x i8]*@.str3065, i32 0, i32 0
%.tmp3067 = call i32(i8*,i8*) @strcmp(i8* %.tmp3064, i8* %.tmp3066)
%.tmp3068 = icmp eq i32 %.tmp3067, 0
br i1 %.tmp3068, label %.if.true.3069, label %.if.false.3069
.if.true.3069:
%.tmp3070 = load %m307$.Node.type*, %m307$.Node.type** %start.3061
%.tmp3071 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3070, i32 0, i32 7
%.tmp3072 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3071
store %m307$.Node.type* %.tmp3072, %m307$.Node.type** %start.3061
br label %.if.end.3069
.if.false.3069:
br label %.if.end.3069
.if.end.3069:
%.tmp3074 = load %m307$.Node.type*, %m307$.Node.type** %start.3061
%stmt.3075 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3074, %m307$.Node.type** %stmt.3075
br label %.for.start.3073
.for.start.3073:
%.tmp3076 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3075
%.tmp3077 = icmp ne %m307$.Node.type* %.tmp3076, null
br i1 %.tmp3077, label %.for.continue.3073, label %.for.end.3073
.for.continue.3073:
%.tmp3078 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3079 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3075
%.tmp3080 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3079, i32 0, i32 6
%.tmp3081 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3080
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3078, %m307$.Node.type* %.tmp3081, i1 1)
%.tmp3082 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3075
%.tmp3083 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3082, i32 0, i32 7
%.tmp3084 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3083
store %m307$.Node.type* %.tmp3084, %m307$.Node.type** %stmt.3075
br label %.for.start.3073
.for.end.3073:
%.tmp3086 = load %m307$.Node.type*, %m307$.Node.type** %start.3061
%s.3087 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3086, %m307$.Node.type** %s.3087
br label %.for.start.3085
.for.start.3085:
%.tmp3088 = load %m307$.Node.type*, %m307$.Node.type** %s.3087
%.tmp3089 = icmp ne %m307$.Node.type* %.tmp3088, null
br i1 %.tmp3089, label %.for.continue.3085, label %.for.end.3085
.for.continue.3085:
%.tmp3090 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3091 = load %m307$.Node.type*, %m307$.Node.type** %s.3087
%.tmp3092 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3091, i32 0, i32 6
%.tmp3093 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3092
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3090, %m307$.Node.type* %.tmp3093, i1 0)
%.tmp3094 = load %m307$.Node.type*, %m307$.Node.type** %s.3087
%.tmp3095 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3094, i32 0, i32 7
%.tmp3096 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3095
store %m307$.Node.type* %.tmp3096, %m307$.Node.type** %s.3087
br label %.for.start.3085
.for.end.3085:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp3097 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3098 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3097, i32 0, i32 2
%.tmp3099 = load i1, i1* %.tmp3098
%.tmp3100 = icmp eq i1 %.tmp3099, 0
%.tmp3101 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3102 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3101, i32 0, i32 1
%.tmp3103 = load i8*, i8** %.tmp3102
%.tmp3105 = getelementptr [7 x i8], [7 x i8]*@.str3104, i32 0, i32 0
%.tmp3106 = call i32(i8*,i8*) @strcmp(i8* %.tmp3103, i8* %.tmp3105)
%.tmp3107 = icmp eq i32 %.tmp3106, 0
%.tmp3108 = and i1 %.tmp3100, %.tmp3107
br i1 %.tmp3108, label %.if.true.3109, label %.if.false.3109
.if.true.3109:
%.tmp3110 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3111 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3110, i32 0, i32 1
%.tmp3112 = load %m0$.File.type*, %m0$.File.type** %.tmp3111
%.tmp3114 = getelementptr [21 x i8], [21 x i8]*@.str3113, i32 0, i32 0
%.tmp3115 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3116 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3115, i32 0, i32 3
%.tmp3117 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3116
%.tmp3118 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3117)
%.tmp3119 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3120 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3121 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3120, i32 0, i32 3
%.tmp3122 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3121
%.tmp3123 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3122, i32 0, i32 3
%.tmp3124 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3123
%.tmp3125 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3119, %m1861$.Type.type* %.tmp3124)
%.tmp3126 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3127 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3126, i32 0, i32 0
%.tmp3128 = load i8*, i8** %.tmp3127
%.tmp3129 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3112, i8* %.tmp3114, i8* %.tmp3118, i8* %.tmp3125, i8* %.tmp3128)
%.tmp3130 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3131 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3130, i32 0, i32 2
store i1 1, i1* %.tmp3131
br label %.if.end.3109
.if.false.3109:
br label %.if.end.3109
.if.end.3109:
ret void
}
define i8* @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3132 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3133 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3132)
%m.3134 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3133, %m1861$.ModuleLookup.type** %m.3134
%.tmp3135 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3134
%.tmp3136 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3135, i32 0, i32 1
%.tmp3137 = load i8*, i8** %.tmp3136
ret i8* %.tmp3137
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
%mangled_name.3138 = alloca i8*
store i8* null, i8** %mangled_name.3138
%.tmp3139 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3140 = load %m307$.Node.type*, %m307$.Node.type** %fn
%.tmp3141 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3140, i32 0, i32 2
%.tmp3142 = load i8*, i8** %.tmp3141
%.tmp3143 = call i8*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3139, i8* %.tmp3142)
%prefix.3144 = alloca i8*
store i8* %.tmp3143, i8** %prefix.3144
%.tmp3145 = getelementptr i8*, i8** %mangled_name.3138, i32 0
%.tmp3147 = getelementptr [5 x i8], [5 x i8]*@.str3146, i32 0, i32 0
%.tmp3148 = load i8*, i8** %prefix.3144
%.tmp3149 = load i8*, i8** %original_name
%.tmp3150 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3145, i8* %.tmp3147, i8* %.tmp3148, i8* %.tmp3149)
%.tmp3151 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3152 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3151, i32 0, i32 0
%.tmp3153 = load i8*, i8** %.tmp3152
%.tmp3155 = getelementptr [9 x i8], [9 x i8]*@.str3154, i32 0, i32 0
%.tmp3156 = call i32(i8*,i8*) @strcmp(i8* %.tmp3153, i8* %.tmp3155)
%.tmp3157 = icmp eq i32 %.tmp3156, 0
br i1 %.tmp3157, label %.if.true.3158, label %.if.false.3158
.if.true.3158:
%.tmp3159 = load i8*, i8** %mangled_name.3138
%.tmp3161 = getelementptr [5 x i8], [5 x i8]*@.str3160, i32 0, i32 0
%.tmp3162 = call i32(i8*,i8*) @strcmp(i8* %.tmp3159, i8* %.tmp3161)
%.tmp3163 = icmp ne i32 %.tmp3162, 0
br i1 %.tmp3163, label %.if.true.3164, label %.if.false.3164
.if.true.3164:
%tmp_buff.3165 = alloca i8*
store i8* null, i8** %tmp_buff.3165
%swap_var.3166 = alloca i8*
store i8* null, i8** %swap_var.3166
%.tmp3168 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3169 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3168, i32 0, i32 3
%.tmp3170 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3169
%tp.3171 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3170, %m1861$.Type.type** %tp.3171
br label %.for.start.3167
.for.start.3167:
%.tmp3172 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3171
%.tmp3173 = icmp ne %m1861$.Type.type* %.tmp3172, null
br i1 %.tmp3173, label %.for.continue.3167, label %.for.end.3167
.for.continue.3167:
%.tmp3174 = getelementptr i8*, i8** %tmp_buff.3165, i32 0
%.tmp3176 = getelementptr [6 x i8], [6 x i8]*@.str3175, i32 0, i32 0
%.tmp3177 = load i8*, i8** %mangled_name.3138
%.tmp3178 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3171
%.tmp3179 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp3178)
%.tmp3180 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3174, i8* %.tmp3176, i8* %.tmp3177, i8* %.tmp3179)
%.tmp3181 = load i8*, i8** %tmp_buff.3165
store i8* %.tmp3181, i8** %swap_var.3166
%.tmp3182 = load i8*, i8** %mangled_name.3138
store i8* %.tmp3182, i8** %tmp_buff.3165
%.tmp3183 = load i8*, i8** %swap_var.3166
store i8* %.tmp3183, i8** %mangled_name.3138
%.tmp3184 = load i8*, i8** %tmp_buff.3165
call void(i8*) @free(i8* %.tmp3184)
%.tmp3185 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3171
%.tmp3186 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3185, i32 0, i32 4
%.tmp3187 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3186
store %m1861$.Type.type* %.tmp3187, %m1861$.Type.type** %tp.3171
br label %.for.start.3167
.for.end.3167:
br label %.if.end.3164
.if.false.3164:
br label %.if.end.3164
.if.end.3164:
br label %.if.end.3158
.if.false.3158:
br label %.if.end.3158
.if.end.3158:
%.tmp3188 = load i8*, i8** %mangled_name.3138
ret i8* %.tmp3188
}
define void @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3189 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %info.3189
%return_type.3190 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %return_type.3190
%err_buf.3191 = alloca i8*
store i8* null, i8** %err_buf.3191
%tmp_buff.3192 = alloca i8*
store i8* null, i8** %tmp_buff.3192
%.tmp3193 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3194 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3193, i32 0, i32 0
%.tmp3195 = load i8*, i8** %.tmp3194
%.tmp3197 = getelementptr [3 x i8], [3 x i8]*@.str3196, i32 0, i32 0
%.tmp3198 = call i32(i8*,i8*) @strcmp(i8* %.tmp3195, i8* %.tmp3197)
%.tmp3199 = icmp eq i32 %.tmp3198, 0
br i1 %.tmp3199, label %.if.true.3200, label %.if.false.3200
.if.true.3200:
ret void
br label %.if.end.3200
.if.false.3200:
%.tmp3201 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3202 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3201, i32 0, i32 0
%.tmp3203 = load i8*, i8** %.tmp3202
%.tmp3205 = getelementptr [7 x i8], [7 x i8]*@.str3204, i32 0, i32 0
%.tmp3206 = call i32(i8*,i8*) @strcmp(i8* %.tmp3203, i8* %.tmp3205)
%.tmp3207 = icmp eq i32 %.tmp3206, 0
br i1 %.tmp3207, label %.if.true.3208, label %.if.false.3208
.if.true.3208:
%.tmp3209 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3210 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3209, i32 0, i32 6
%.tmp3211 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3210
%.tmp3213 = getelementptr [11 x i8], [11 x i8]*@.str3212, i32 0, i32 0
%.tmp3214 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3211, i8* %.tmp3213)
%assignable.3215 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3214, %m307$.Node.type** %assignable.3215
%.tmp3216 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3217 = load %m307$.Node.type*, %m307$.Node.type** %assignable.3215
%.tmp3218 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3216, %m307$.Node.type* %.tmp3217)
%a_info.3219 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3218, %m1861$.AssignableInfo.type** %a_info.3219
%.tmp3220 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3219
%.tmp3221 = icmp eq %m1861$.AssignableInfo.type* %.tmp3220, null
br i1 %.tmp3221, label %.if.true.3222, label %.if.false.3222
.if.true.3222:
ret void
br label %.if.end.3222
.if.false.3222:
br label %.if.end.3222
.if.end.3222:
%.tmp3223 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3224 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3223)
store %m1861$.AssignableInfo.type* %.tmp3224, %m1861$.AssignableInfo.type** %info.3189
%.tmp3225 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3226 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3225, i32 0, i32 6
%.tmp3227 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3226
%.tmp3228 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3227, i32 0, i32 7
%.tmp3229 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3228
%.tmp3230 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3229, i32 0, i32 1
%.tmp3231 = load i8*, i8** %.tmp3230
%global_name.3232 = alloca i8*
store i8* %.tmp3231, i8** %global_name.3232
%.tmp3233 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3234 = load i8, i8* @SCOPE_GLOBAL
%.tmp3235 = load i8*, i8** %global_name.3232
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3233, i8 %.tmp3234, i8* %.tmp3235)
%.tmp3236 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3237 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3236, i32 0, i32 3
%.tmp3238 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3219
%.tmp3239 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3238, i32 0, i32 3
%.tmp3240 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3239
store %m1861$.Type.type* %.tmp3240, %m1861$.Type.type** %.tmp3237
%.tmp3241 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3242 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3241, i32 0, i32 2
%.tmp3244 = getelementptr [9 x i8], [9 x i8]*@.str3243, i32 0, i32 0
store i8* %.tmp3244, i8** %.tmp3242
%.tmp3245 = load i1, i1* %shallow
%.tmp3246 = icmp eq i1 %.tmp3245, 1
br i1 %.tmp3246, label %.if.true.3247, label %.if.false.3247
.if.true.3247:
%.tmp3248 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3249 = load i8*, i8** %global_name.3232
%.tmp3250 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3248, i8* %.tmp3249, %m1861$.AssignableInfo.type* %.tmp3250)
br label %.if.end.3247
.if.false.3247:
%.tmp3251 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3252 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3251, i32 0, i32 1
%.tmp3253 = load %m0$.File.type*, %m0$.File.type** %.tmp3252
%.tmp3255 = getelementptr [21 x i8], [21 x i8]*@.str3254, i32 0, i32 0
%.tmp3256 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3257 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3256)
%.tmp3258 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3259 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3260 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3259, i32 0, i32 3
%.tmp3261 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3260
%.tmp3262 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3258, %m1861$.Type.type* %.tmp3261)
%.tmp3263 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3219
%.tmp3264 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3263)
%.tmp3265 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3253, i8* %.tmp3255, i8* %.tmp3257, i8* %.tmp3262, i8* %.tmp3264)
br label %.if.end.3247
.if.end.3247:
br label %.if.end.3208
.if.false.3208:
%.tmp3266 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3267 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3266, i32 0, i32 0
%.tmp3268 = load i8*, i8** %.tmp3267
%.tmp3270 = getelementptr [10 x i8], [10 x i8]*@.str3269, i32 0, i32 0
%.tmp3271 = call i32(i8*,i8*) @strcmp(i8* %.tmp3268, i8* %.tmp3270)
%.tmp3272 = icmp eq i32 %.tmp3271, 0
br i1 %.tmp3272, label %.if.true.3273, label %.if.false.3273
.if.true.3273:
%.tmp3274 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3275 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3274, i32 0, i32 6
%.tmp3276 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3275
%.tmp3277 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3276, i32 0, i32 7
%.tmp3278 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3277
%.tmp3279 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3278, i32 0, i32 1
%.tmp3280 = load i8*, i8** %.tmp3279
%type_name.3281 = alloca i8*
store i8* %.tmp3280, i8** %type_name.3281
%.tmp3282 = load i1, i1* %shallow
%.tmp3283 = icmp eq i1 %.tmp3282, 1
br i1 %.tmp3283, label %.if.true.3284, label %.if.false.3284
.if.true.3284:
%.tmp3285 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3286 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3285)
store %m1861$.AssignableInfo.type* %.tmp3286, %m1861$.AssignableInfo.type** %info.3189
%.tmp3287 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3288 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3287)
%mod_from.3289 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3288, %m1861$.ModuleLookup.type** %mod_from.3289
%.tmp3290 = getelementptr i8*, i8** %tmp_buff.3192, i32 0
%.tmp3292 = getelementptr [11 x i8], [11 x i8]*@.str3291, i32 0, i32 0
%.tmp3293 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3289
%.tmp3294 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3293, i32 0, i32 1
%.tmp3295 = load i8*, i8** %.tmp3294
%.tmp3296 = load i8*, i8** %type_name.3281
%.tmp3297 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3290, i8* %.tmp3292, i8* %.tmp3295, i8* %.tmp3296)
%.tmp3298 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3299 = load i8, i8* @SCOPE_LOCAL
%.tmp3300 = load i8*, i8** %tmp_buff.3192
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3298, i8 %.tmp3299, i8* %.tmp3300)
%.tmp3301 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3302 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3301, i32 0, i32 2
%.tmp3304 = getelementptr [10 x i8], [10 x i8]*@.str3303, i32 0, i32 0
store i8* %.tmp3304, i8** %.tmp3302
%.tmp3305 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3306 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3305, i32 0, i32 4
%.tmp3307 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3308 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3307, i32 0, i32 3
%.tmp3309 = load i32, i32* %.tmp3308
store i32 %.tmp3309, i32* %.tmp3306
%.tmp3310 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3311 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3310, i32 0, i32 5
%.tmp3312 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3313 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3312, i32 0, i32 4
%.tmp3314 = load i32, i32* %.tmp3313
store i32 %.tmp3314, i32* %.tmp3311
%.tmp3315 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3316 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3315, i32 0, i32 3
%.tmp3317 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3317, %m1861$.Type.type** %.tmp3316
%.tmp3318 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3319 = load i8*, i8** %type_name.3281
%.tmp3320 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3318, i8* %.tmp3319, %m1861$.AssignableInfo.type* %.tmp3320)
%.tmp3321 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3322 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3321, i32 0, i32 6
%.tmp3323 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3322
%.tmp3325 = getelementptr [5 x i8], [5 x i8]*@.str3324, i32 0, i32 0
%.tmp3326 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3323, i8* %.tmp3325)
%type_decl.3327 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3326, %m307$.Node.type** %type_decl.3327
%.tmp3328 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3329 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3327
%.tmp3330 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3329, i32 0, i32 6
%.tmp3331 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3330
%.tmp3332 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3328, %m307$.Node.type* %.tmp3331)
%type_struct.3333 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3332, %m1861$.Type.type** %type_struct.3333
%.tmp3334 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3335 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3334, i32 0, i32 3
%.tmp3336 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3335
%.tmp3337 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3333
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3336, %m1861$.Type.type* %.tmp3337)
%.tmp3338 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3339 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3338, i32 0, i32 3
%.tmp3340 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3333
store %m1861$.Type.type* %.tmp3340, %m1861$.Type.type** %.tmp3339
br label %.if.end.3284
.if.false.3284:
%.tmp3341 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3342 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3343 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3342, i32 0, i32 7
%.tmp3344 = load i8*, i8** %.tmp3343
%.tmp3345 = load i8*, i8** %type_name.3281
%.tmp3346 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3341, i8* %.tmp3344, i8* %.tmp3345)
%scope.3347 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3346, %m1861$.ScopeItem.type** %scope.3347
%.tmp3348 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3347
%.tmp3349 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3348, i32 0, i32 1
%.tmp3350 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3349
store %m1861$.AssignableInfo.type* %.tmp3350, %m1861$.AssignableInfo.type** %info.3189
%.tmp3351 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3352 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3351, i32 0, i32 1
%.tmp3353 = load %m0$.File.type*, %m0$.File.type** %.tmp3352
%.tmp3355 = getelementptr [14 x i8], [14 x i8]*@.str3354, i32 0, i32 0
%.tmp3356 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3357 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3356)
%.tmp3358 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3359 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3360 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3359, i32 0, i32 3
%.tmp3361 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3360
%.tmp3362 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3358, %m1861$.Type.type* %.tmp3361)
%.tmp3363 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3353, i8* %.tmp3355, i8* %.tmp3357, i8* %.tmp3362)
br label %.if.end.3284
.if.end.3284:
br label %.if.end.3273
.if.false.3273:
%.tmp3364 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3365 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3364, i32 0, i32 0
%.tmp3366 = load i8*, i8** %.tmp3365
%.tmp3368 = getelementptr [7 x i8], [7 x i8]*@.str3367, i32 0, i32 0
%.tmp3369 = call i32(i8*,i8*) @strcmp(i8* %.tmp3366, i8* %.tmp3368)
%.tmp3370 = icmp eq i32 %.tmp3369, 0
br i1 %.tmp3370, label %.if.true.3371, label %.if.false.3371
.if.true.3371:
%.tmp3372 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3373 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3372)
store %m1861$.AssignableInfo.type* %.tmp3373, %m1861$.AssignableInfo.type** %info.3189
%.tmp3374 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3375 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3374, i32 0, i32 3
%.tmp3376 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3377 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3378 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3377, i32 0, i32 6
%.tmp3379 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3378
%.tmp3380 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3379, i32 0, i32 7
%.tmp3381 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3380
%.tmp3382 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3376, %m307$.Node.type* %.tmp3381)
store %m1861$.Type.type* %.tmp3382, %m1861$.Type.type** %.tmp3375
%.tmp3383 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3384 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3383, i32 0, i32 2
%.tmp3386 = getelementptr [7 x i8], [7 x i8]*@.str3385, i32 0, i32 0
store i8* %.tmp3386, i8** %.tmp3384
%.tmp3387 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3388 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3387, i32 0, i32 6
%.tmp3389 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3388
%.tmp3390 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3389, i32 0, i32 7
%.tmp3391 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3390
%.tmp3392 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3391, i32 0, i32 7
%.tmp3393 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3392
%.tmp3394 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3393, i32 0, i32 1
%.tmp3395 = load i8*, i8** %.tmp3394
%fn_name.3396 = alloca i8*
store i8* %.tmp3395, i8** %fn_name.3396
%.tmp3397 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3398 = load i8, i8* @SCOPE_GLOBAL
%.tmp3399 = load i8*, i8** %fn_name.3396
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3397, i8 %.tmp3398, i8* %.tmp3399)
%.tmp3400 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3400, %m1861$.Type.type** %return_type.3190
%.tmp3401 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3402 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3401, i32 0, i32 0
%.tmp3403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3404 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3403, i32 0, i32 3
%.tmp3405 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3404
%.tmp3406 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3405, i32 0, i32 3
%.tmp3407 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3406
%.tmp3408 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3407, i32 0, i32 0
%.tmp3409 = load i8*, i8** %.tmp3408
store i8* %.tmp3409, i8** %.tmp3402
%.tmp3410 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3411 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3410, i32 0, i32 3
%.tmp3412 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3413 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3412, i32 0, i32 3
%.tmp3414 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3413
%.tmp3415 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3414, i32 0, i32 3
%.tmp3416 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3415
%.tmp3417 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3416, i32 0, i32 3
%.tmp3418 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3417
store %m1861$.Type.type* %.tmp3418, %m1861$.Type.type** %.tmp3411
%.tmp3419 = load i1, i1* %shallow
%.tmp3420 = icmp eq i1 %.tmp3419, 0
br i1 %.tmp3420, label %.if.true.3421, label %.if.false.3421
.if.true.3421:
%.tmp3422 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3423 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3422, i32 0, i32 1
%.tmp3424 = load %m0$.File.type*, %m0$.File.type** %.tmp3423
%.tmp3426 = getelementptr [15 x i8], [15 x i8]*@.str3425, i32 0, i32 0
%.tmp3427 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3428 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3429 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3427, %m1861$.Type.type* %.tmp3428)
%.tmp3430 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3431 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3430)
%.tmp3432 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3424, i8* %.tmp3426, i8* %.tmp3429, i8* %.tmp3431)
%.tmp3434 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3435 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3434, i32 0, i32 3
%.tmp3436 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3435
%.tmp3437 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3436, i32 0, i32 3
%.tmp3438 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3437
%.tmp3439 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3438, i32 0, i32 4
%.tmp3440 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3439
%pt.3441 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3440, %m1861$.Type.type** %pt.3441
br label %.for.start.3433
.for.start.3433:
%.tmp3442 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3441
%.tmp3443 = icmp ne %m1861$.Type.type* %.tmp3442, null
br i1 %.tmp3443, label %.for.continue.3433, label %.for.end.3433
.for.continue.3433:
%.tmp3444 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3441
%.tmp3445 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3446 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3445, i32 0, i32 3
%.tmp3447 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3446
%.tmp3448 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3447, i32 0, i32 3
%.tmp3449 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3448
%.tmp3450 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3449, i32 0, i32 4
%.tmp3451 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3450
%.tmp3452 = icmp ne %m1861$.Type.type* %.tmp3444, %.tmp3451
br i1 %.tmp3452, label %.if.true.3453, label %.if.false.3453
.if.true.3453:
%.tmp3454 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3455 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3454, i32 0, i32 1
%.tmp3456 = load %m0$.File.type*, %m0$.File.type** %.tmp3455
%.tmp3458 = getelementptr [3 x i8], [3 x i8]*@.str3457, i32 0, i32 0
%.tmp3459 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3456, i8* %.tmp3458)
br label %.if.end.3453
.if.false.3453:
br label %.if.end.3453
.if.end.3453:
%.tmp3460 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3461 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3460, i32 0, i32 1
%.tmp3462 = load %m0$.File.type*, %m0$.File.type** %.tmp3461
%.tmp3464 = getelementptr [3 x i8], [3 x i8]*@.str3463, i32 0, i32 0
%.tmp3465 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3466 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3441
%.tmp3467 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3465, %m1861$.Type.type* %.tmp3466)
%.tmp3468 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3462, i8* %.tmp3464, i8* %.tmp3467)
%.tmp3469 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3441
%.tmp3470 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3469, i32 0, i32 4
%.tmp3471 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3470
store %m1861$.Type.type* %.tmp3471, %m1861$.Type.type** %pt.3441
br label %.for.start.3433
.for.end.3433:
%.tmp3472 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3473 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3472, i32 0, i32 1
%.tmp3474 = load %m0$.File.type*, %m0$.File.type** %.tmp3473
%.tmp3476 = getelementptr [3 x i8], [3 x i8]*@.str3475, i32 0, i32 0
%.tmp3477 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3474, i8* %.tmp3476)
%.tmp3478 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3479 = bitcast %m1861$.Type.type* %.tmp3478 to i8*
call void(i8*) @free(i8* %.tmp3479)
br label %.if.end.3421
.if.false.3421:
%.tmp3480 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3481 = load i8*, i8** %fn_name.3396
%.tmp3482 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3480, i8* %.tmp3481, %m1861$.AssignableInfo.type* %.tmp3482)
br label %.if.end.3421
.if.end.3421:
br label %.if.end.3371
.if.false.3371:
%.tmp3483 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3484 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3483, i32 0, i32 0
%.tmp3485 = load i8*, i8** %.tmp3484
%.tmp3487 = getelementptr [9 x i8], [9 x i8]*@.str3486, i32 0, i32 0
%.tmp3488 = call i32(i8*,i8*) @strcmp(i8* %.tmp3485, i8* %.tmp3487)
%.tmp3489 = icmp eq i32 %.tmp3488, 0
br i1 %.tmp3489, label %.if.true.3490, label %.if.false.3490
.if.true.3490:
%.tmp3491 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3492 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3491)
store %m1861$.AssignableInfo.type* %.tmp3492, %m1861$.AssignableInfo.type** %info.3189
%.tmp3493 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3494 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3493, i32 0, i32 2
%.tmp3496 = getelementptr [9 x i8], [9 x i8]*@.str3495, i32 0, i32 0
store i8* %.tmp3496, i8** %.tmp3494
%.tmp3497 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3498 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3497, i32 0, i32 3
%.tmp3499 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3500 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3501 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3500, i32 0, i32 6
%.tmp3502 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3501
%.tmp3503 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3499, %m307$.Node.type* %.tmp3502)
store %m1861$.Type.type* %.tmp3503, %m1861$.Type.type** %.tmp3498
%.tmp3504 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3505 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3504)
%name.3506 = alloca i8*
store i8* %.tmp3505, i8** %name.3506
%.tmp3507 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3508 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3509 = load i8*, i8** %name.3506
%.tmp3510 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3511 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3510, i32 0, i32 3
%.tmp3512 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3511
%.tmp3513 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3507, %m307$.Node.type* %.tmp3508, i8* %.tmp3509, %m1861$.Type.type* %.tmp3512)
store i8* %.tmp3513, i8** %tmp_buff.3192
%.tmp3514 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3515 = load i8, i8* @SCOPE_GLOBAL
%.tmp3516 = load i8*, i8** %tmp_buff.3192
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3514, i8 %.tmp3515, i8* %.tmp3516)
%.tmp3517 = load i1, i1* %shallow
%.tmp3518 = icmp eq i1 %.tmp3517, 1
br i1 %.tmp3518, label %.if.true.3519, label %.if.false.3519
.if.true.3519:
%.tmp3520 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3521 = load i8*, i8** %name.3506
%.tmp3522 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3520, i8* %.tmp3521, %m1861$.AssignableInfo.type* %.tmp3522)
br label %.if.end.3519
.if.false.3519:
%.tmp3523 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3523, %m1861$.Type.type** %return_type.3190
%.tmp3524 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3525 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3526 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3525, i32 0, i32 3
%.tmp3527 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3526
%.tmp3528 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3527, i32 0, i32 3
%.tmp3529 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3528
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3524, %m1861$.Type.type* %.tmp3529)
%.tmp3530 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3531 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3530, i32 0, i32 1
%.tmp3532 = load %m0$.File.type*, %m0$.File.type** %.tmp3531
%.tmp3534 = getelementptr [14 x i8], [14 x i8]*@.str3533, i32 0, i32 0
%.tmp3535 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3536 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3537 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3535, %m1861$.Type.type* %.tmp3536)
%.tmp3538 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3189
%.tmp3539 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3538)
%.tmp3540 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3532, i8* %.tmp3534, i8* %.tmp3537, i8* %.tmp3539)
%.tmp3541 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3542 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3541, i32 0, i32 6
%.tmp3543 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3542
%.tmp3544 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3543)
%params.3545 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3544, %m307$.Node.type** %params.3545
%param_type.3546 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3546
%.tmp3548 = load %m307$.Node.type*, %m307$.Node.type** %params.3545
%param_ptr.3549 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3548, %m307$.Node.type** %param_ptr.3549
br label %.for.start.3547
.for.start.3547:
%.tmp3550 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3551 = icmp ne %m307$.Node.type* %.tmp3550, null
br i1 %.tmp3551, label %.for.continue.3547, label %.for.end.3547
.for.continue.3547:
%.tmp3552 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3553 = load %m307$.Node.type*, %m307$.Node.type** %params.3545
%.tmp3554 = icmp ne %m307$.Node.type* %.tmp3552, %.tmp3553
br i1 %.tmp3554, label %.if.true.3555, label %.if.false.3555
.if.true.3555:
%.tmp3556 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3557 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3556, i32 0, i32 7
%.tmp3558 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3557
store %m307$.Node.type* %.tmp3558, %m307$.Node.type** %param_ptr.3549
%.tmp3559 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3560 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3559, i32 0, i32 1
%.tmp3561 = load %m0$.File.type*, %m0$.File.type** %.tmp3560
%.tmp3563 = getelementptr [3 x i8], [3 x i8]*@.str3562, i32 0, i32 0
%.tmp3564 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3561, i8* %.tmp3563)
br label %.if.end.3555
.if.false.3555:
br label %.if.end.3555
.if.end.3555:
%.tmp3565 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3566 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3565, i32 0, i32 0
%.tmp3567 = load i8*, i8** %.tmp3566
%.tmp3569 = getelementptr [5 x i8], [5 x i8]*@.str3568, i32 0, i32 0
%.tmp3570 = call i32(i8*,i8*) @strcmp(i8* %.tmp3567, i8* %.tmp3569)
%.tmp3571 = icmp eq i32 %.tmp3570, 0
br i1 %.tmp3571, label %.if.true.3572, label %.if.false.3572
.if.true.3572:
%.tmp3573 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3574 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3575 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3574, i32 0, i32 6
%.tmp3576 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3575
%.tmp3577 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3573, %m307$.Node.type* %.tmp3576)
store %m1861$.Type.type* %.tmp3577, %m1861$.Type.type** %param_type.3546
%.tmp3578 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3579 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3578, i32 0, i32 7
%.tmp3580 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3579
store %m307$.Node.type* %.tmp3580, %m307$.Node.type** %param_ptr.3549
br label %.if.end.3572
.if.false.3572:
br label %.if.end.3572
.if.end.3572:
%.tmp3581 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3582 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3581, i32 0, i32 1
%.tmp3583 = load %m0$.File.type*, %m0$.File.type** %.tmp3582
%.tmp3585 = getelementptr [13 x i8], [13 x i8]*@.str3584, i32 0, i32 0
%.tmp3586 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3587 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3546
%.tmp3588 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3586, %m1861$.Type.type* %.tmp3587)
%.tmp3589 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3590 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3589, i32 0, i32 1
%.tmp3591 = load i8*, i8** %.tmp3590
%.tmp3592 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3583, i8* %.tmp3585, i8* %.tmp3588, i8* %.tmp3591)
%.tmp3593 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3549
%.tmp3594 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3593, i32 0, i32 7
%.tmp3595 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3594
store %m307$.Node.type* %.tmp3595, %m307$.Node.type** %param_ptr.3549
br label %.for.start.3547
.for.end.3547:
%.tmp3596 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3597 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3596, i32 0, i32 1
%.tmp3598 = load %m0$.File.type*, %m0$.File.type** %.tmp3597
%.tmp3600 = getelementptr [5 x i8], [5 x i8]*@.str3599, i32 0, i32 0
%.tmp3601 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3598, i8* %.tmp3600)
%.tmp3602 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3604 = getelementptr [9 x i8], [9 x i8]*@.str3603, i32 0, i32 0
%.tmp3605 = bitcast ptr null to i8*
%.tmp3606 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3602, i8* %.tmp3604, i8* %.tmp3605, i8* %.tmp3606)
%.tmp3607 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3608 = load %m307$.Node.type*, %m307$.Node.type** %params.3545
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3607, %m307$.Node.type* %.tmp3608)
%.tmp3609 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3610 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3609, i32 0, i32 6
%.tmp3611 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3610
%.tmp3613 = getelementptr [6 x i8], [6 x i8]*@.str3612, i32 0, i32 0
%.tmp3614 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3611, i8* %.tmp3613)
%fn_block.3615 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3614, %m307$.Node.type** %fn_block.3615
%.tmp3616 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3617 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3615
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3616, %m307$.Node.type* %.tmp3617)
%.tmp3618 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3618)
%.tmp3619 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3620 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3619, %m307$.Node.type** %last_valid_instruction.3620
%.tmp3621 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3615
%.tmp3622 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3621, i32 0, i32 6
%.tmp3623 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3622
%.tmp3625 = getelementptr [12 x i8], [12 x i8]*@.str3624, i32 0, i32 0
%.tmp3626 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3623, i8* %.tmp3625)
%ci.3627 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3626, %m307$.Node.type** %ci.3627
%.tmp3629 = load %m307$.Node.type*, %m307$.Node.type** %ci.3627
%.tmp3630 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3629, i32 0, i32 6
%.tmp3631 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3630
store %m307$.Node.type* %.tmp3631, %m307$.Node.type** %ci.3627
br label %.for.start.3628
.for.start.3628:
%.tmp3632 = load %m307$.Node.type*, %m307$.Node.type** %ci.3627
%.tmp3633 = icmp ne %m307$.Node.type* %.tmp3632, null
br i1 %.tmp3633, label %.for.continue.3628, label %.for.end.3628
.for.continue.3628:
%.tmp3634 = load %m307$.Node.type*, %m307$.Node.type** %ci.3627
%.tmp3635 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3634, i32 0, i32 0
%.tmp3636 = load i8*, i8** %.tmp3635
%.tmp3638 = getelementptr [3 x i8], [3 x i8]*@.str3637, i32 0, i32 0
%.tmp3639 = call i32(i8*,i8*) @strcmp(i8* %.tmp3636, i8* %.tmp3638)
%.tmp3640 = icmp ne i32 %.tmp3639, 0
%.tmp3641 = load %m307$.Node.type*, %m307$.Node.type** %ci.3627
%.tmp3642 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3641, i32 0, i32 0
%.tmp3643 = load i8*, i8** %.tmp3642
%.tmp3645 = getelementptr [9 x i8], [9 x i8]*@.str3644, i32 0, i32 0
%.tmp3646 = call i32(i8*,i8*) @strcmp(i8* %.tmp3643, i8* %.tmp3645)
%.tmp3647 = icmp ne i32 %.tmp3646, 0
%.tmp3648 = and i1 %.tmp3640, %.tmp3647
br i1 %.tmp3648, label %.if.true.3649, label %.if.false.3649
.if.true.3649:
%.tmp3650 = load %m307$.Node.type*, %m307$.Node.type** %ci.3627
store %m307$.Node.type* %.tmp3650, %m307$.Node.type** %last_valid_instruction.3620
br label %.if.end.3649
.if.false.3649:
br label %.if.end.3649
.if.end.3649:
%.tmp3651 = load %m307$.Node.type*, %m307$.Node.type** %ci.3627
%.tmp3652 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3651, i32 0, i32 7
%.tmp3653 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3652
store %m307$.Node.type* %.tmp3653, %m307$.Node.type** %ci.3627
br label %.for.start.3628
.for.end.3628:
%add_implicit_return.3654 = alloca i1
store i1 0, i1* %add_implicit_return.3654
%.tmp3655 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3620
%.tmp3656 = icmp eq %m307$.Node.type* %.tmp3655, null
br i1 %.tmp3656, label %.if.true.3657, label %.if.false.3657
.if.true.3657:
store i1 1, i1* %add_implicit_return.3654
br label %.if.end.3657
.if.false.3657:
%.tmp3658 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3620
%.tmp3659 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3658, i32 0, i32 6
%.tmp3660 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3659
%.tmp3661 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3660, i32 0, i32 0
%.tmp3662 = load i8*, i8** %.tmp3661
%.tmp3664 = getelementptr [7 x i8], [7 x i8]*@.str3663, i32 0, i32 0
%.tmp3665 = call i32(i8*,i8*) @strcmp(i8* %.tmp3662, i8* %.tmp3664)
%.tmp3666 = icmp ne i32 %.tmp3665, 0
br i1 %.tmp3666, label %.if.true.3667, label %.if.false.3667
.if.true.3667:
store i1 1, i1* %add_implicit_return.3654
br label %.if.end.3667
.if.false.3667:
br label %.if.end.3667
.if.end.3667:
br label %.if.end.3657
.if.end.3657:
%.tmp3668 = load i1, i1* %add_implicit_return.3654
br i1 %.tmp3668, label %.if.true.3669, label %.if.false.3669
.if.true.3669:
%.tmp3670 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3671 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3190
%.tmp3672 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3670, %m1861$.Type.type* %.tmp3671)
%.tmp3674 = getelementptr [5 x i8], [5 x i8]*@.str3673, i32 0, i32 0
%.tmp3675 = call i32(i8*,i8*) @strcmp(i8* %.tmp3672, i8* %.tmp3674)
%.tmp3676 = icmp ne i32 %.tmp3675, 0
br i1 %.tmp3676, label %.if.true.3677, label %.if.false.3677
.if.true.3677:
%.tmp3678 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3679 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3615
%.tmp3681 = getelementptr [21 x i8], [21 x i8]*@.str3680, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3678, %m307$.Node.type* %.tmp3679, i8* %.tmp3681)
br label %.if.end.3677
.if.false.3677:
%.tmp3682 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3683 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3682, i32 0, i32 1
%.tmp3684 = load %m0$.File.type*, %m0$.File.type** %.tmp3683
%.tmp3686 = getelementptr [10 x i8], [10 x i8]*@.str3685, i32 0, i32 0
%.tmp3687 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3684, i8* %.tmp3686)
br label %.if.end.3677
.if.end.3677:
br label %.if.end.3669
.if.false.3669:
br label %.if.end.3669
.if.end.3669:
%.tmp3688 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3689 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3688, i32 0, i32 1
%.tmp3690 = load %m0$.File.type*, %m0$.File.type** %.tmp3689
%.tmp3692 = getelementptr [3 x i8], [3 x i8]*@.str3691, i32 0, i32 0
%.tmp3693 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3690, i8* %.tmp3692)
br label %.if.end.3519
.if.end.3519:
br label %.if.end.3490
.if.false.3490:
%.tmp3694 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3695 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3694, i32 0, i32 0
%.tmp3696 = load i8*, i8** %.tmp3695
%.tmp3698 = getelementptr [7 x i8], [7 x i8]*@.str3697, i32 0, i32 0
%.tmp3699 = call i32(i8*,i8*) @strcmp(i8* %.tmp3696, i8* %.tmp3698)
%.tmp3700 = icmp eq i32 %.tmp3699, 0
br i1 %.tmp3700, label %.if.true.3701, label %.if.false.3701
.if.true.3701:
%.tmp3702 = load i1, i1* %shallow
%.tmp3703 = icmp eq i1 %.tmp3702, 1
br i1 %.tmp3703, label %.if.true.3704, label %.if.false.3704
.if.true.3704:
%.tmp3705 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3706 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3705, i32 0, i32 6
%.tmp3707 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3706
%.tmp3708 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3707, i32 0, i32 7
%.tmp3709 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3708
%.tmp3710 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3709, i32 0, i32 1
%.tmp3711 = load i8*, i8** %.tmp3710
%mod_name.3712 = alloca i8*
store i8* %.tmp3711, i8** %mod_name.3712
%.tmp3713 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3714 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3713, i32 0, i32 7
%.tmp3715 = load i8*, i8** %.tmp3714
%mod_abspath.3716 = alloca i8*
store i8* %.tmp3715, i8** %mod_abspath.3716
%.tmp3717 = load i8*, i8** %mod_abspath.3716
%.tmp3718 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3717)
%dirname.3719 = alloca i8*
store i8* %.tmp3718, i8** %dirname.3719
%.tmp3720 = load i8*, i8** %mod_name.3712
%.tmp3721 = call i32(i8*) @strlen(i8* %.tmp3720)
%mod_name_len.3722 = alloca i32
store i32 %.tmp3721, i32* %mod_name_len.3722
%.tmp3723 = load i32, i32* %mod_name_len.3722
%.tmp3724 = sub i32 %.tmp3723, 1
%.tmp3725 = call i8*(i32) @malloc(i32 %.tmp3724)
%trimmed_name.3726 = alloca i8*
store i8* %.tmp3725, i8** %trimmed_name.3726
%i.3728 = alloca i32
store i32 1, i32* %i.3728
br label %.for.start.3727
.for.start.3727:
%.tmp3729 = load i32, i32* %i.3728
%.tmp3730 = load i32, i32* %mod_name_len.3722
%.tmp3731 = sub i32 %.tmp3730, 1
%.tmp3732 = icmp slt i32 %.tmp3729, %.tmp3731
br i1 %.tmp3732, label %.for.continue.3727, label %.for.end.3727
.for.continue.3727:
%.tmp3733 = load i32, i32* %i.3728
%.tmp3734 = sub i32 %.tmp3733, 1
%.tmp3735 = load i8*, i8** %trimmed_name.3726
%.tmp3736 = getelementptr i8, i8* %.tmp3735, i32 %.tmp3734
%.tmp3737 = load i32, i32* %i.3728
%.tmp3738 = load i8*, i8** %mod_name.3712
%.tmp3739 = getelementptr i8, i8* %.tmp3738, i32 %.tmp3737
%.tmp3740 = load i8, i8* %.tmp3739
store i8 %.tmp3740, i8* %.tmp3736
%.tmp3741 = load i32, i32* %i.3728
%.tmp3742 = add i32 %.tmp3741, 1
store i32 %.tmp3742, i32* %i.3728
br label %.for.start.3727
.for.end.3727:
%.tmp3743 = load i32, i32* %mod_name_len.3722
%.tmp3744 = sub i32 %.tmp3743, 2
%.tmp3745 = load i8*, i8** %trimmed_name.3726
%.tmp3746 = getelementptr i8, i8* %.tmp3745, i32 %.tmp3744
store i8 0, i8* %.tmp3746
%.tmp3747 = load i8*, i8** %dirname.3719
%.tmp3749 = getelementptr [1 x i8], [1 x i8]*@.str3748, i32 0, i32 0
%.tmp3750 = call i32(i8*,i8*) @strcmp(i8* %.tmp3747, i8* %.tmp3749)
%.tmp3751 = icmp eq i32 %.tmp3750, 0
br i1 %.tmp3751, label %.if.true.3752, label %.if.false.3752
.if.true.3752:
%.tmp3753 = getelementptr i8*, i8** %mod_abspath.3716, i32 0
%.tmp3755 = getelementptr [6 x i8], [6 x i8]*@.str3754, i32 0, i32 0
%.tmp3756 = load i8*, i8** %trimmed_name.3726
%.tmp3757 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3753, i8* %.tmp3755, i8* %.tmp3756)
br label %.if.end.3752
.if.false.3752:
%.tmp3758 = getelementptr i8*, i8** %mod_abspath.3716, i32 0
%.tmp3760 = getelementptr [9 x i8], [9 x i8]*@.str3759, i32 0, i32 0
%.tmp3761 = load i8*, i8** %dirname.3719
%.tmp3762 = load i8*, i8** %trimmed_name.3726
%.tmp3763 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3758, i8* %.tmp3760, i8* %.tmp3761, i8* %.tmp3762)
br label %.if.end.3752
.if.end.3752:
%.tmp3764 = load i8*, i8** %mod_abspath.3716
%.tmp3765 = call i8*(i32) @malloc(i32 4096)
%.tmp3766 = call i8*(i8*,i8*) @realpath(i8* %.tmp3764, i8* %.tmp3765)
store i8* %.tmp3766, i8** %mod_abspath.3716
%.tmp3767 = load i8*, i8** %mod_abspath.3716
%.tmp3768 = icmp eq i8* %.tmp3767, null
br i1 %.tmp3768, label %.if.true.3769, label %.if.false.3769
.if.true.3769:
%.tmp3770 = getelementptr i8*, i8** %err_buf.3191, i32 0
%.tmp3772 = getelementptr [60 x i8], [60 x i8]*@.str3771, i32 0, i32 0
%.tmp3773 = load i8*, i8** %mod_name.3712
%.tmp3774 = load i8*, i8** %dirname.3719
%.tmp3775 = load i8*, i8** %trimmed_name.3726
%.tmp3776 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3770, i8* %.tmp3772, i8* %.tmp3773, i8* %.tmp3774, i8* %.tmp3775)
%.tmp3777 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3778 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3779 = load i8*, i8** %err_buf.3191
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3777, %m307$.Node.type* %.tmp3778, i8* %.tmp3779)
ret void
br label %.if.end.3769
.if.false.3769:
br label %.if.end.3769
.if.end.3769:
%already_imported.3780 = alloca i1
store i1 0, i1* %already_imported.3780
%m.3781 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3781
%.tmp3782 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3783 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3782, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3786 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3785, i32 0, i32 6
%.tmp3787 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3786
store %m1861$.ModuleLookup.type* %.tmp3787, %m1861$.ModuleLookup.type** %m.3781
br label %.for.start.3784
.for.start.3784:
%.tmp3788 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
%.tmp3789 = icmp ne %m1861$.ModuleLookup.type* %.tmp3788, null
%.tmp3790 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3791 = icmp eq %m1861$.ModuleLookup.type* %.tmp3790, null
%.tmp3792 = and i1 %.tmp3789, %.tmp3791
br i1 %.tmp3792, label %.for.continue.3784, label %.for.end.3784
.for.continue.3784:
%.tmp3793 = load i8*, i8** %mod_abspath.3716
%.tmp3794 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
%.tmp3795 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3794, i32 0, i32 0
%.tmp3796 = load i8*, i8** %.tmp3795
%.tmp3797 = call i32(i8*,i8*) @strcmp(i8* %.tmp3793, i8* %.tmp3796)
%.tmp3798 = icmp eq i32 %.tmp3797, 0
br i1 %.tmp3798, label %.if.true.3799, label %.if.false.3799
.if.true.3799:
%.tmp3800 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
store %m1861$.ModuleLookup.type* %.tmp3800, %m1861$.ModuleLookup.type** %mod.3783
br label %.if.end.3799
.if.false.3799:
br label %.if.end.3799
.if.end.3799:
%.tmp3801 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
%.tmp3802 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3801, i32 0, i32 2
%.tmp3803 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3802
store %m1861$.ModuleLookup.type* %.tmp3803, %m1861$.ModuleLookup.type** %m.3781
br label %.for.start.3784
.for.end.3784:
%.tmp3804 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3805 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3804, i32 0, i32 6
%.tmp3806 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3805
%.tmp3807 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3806, i32 0, i32 7
%.tmp3808 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3807
%.tmp3809 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3808, i32 0, i32 7
%.tmp3810 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3809
%.tmp3811 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3810, i32 0, i32 7
%.tmp3812 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3811
%.tmp3813 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3812, i32 0, i32 1
%.tmp3814 = load i8*, i8** %.tmp3813
%asname.3815 = alloca i8*
store i8* %.tmp3814, i8** %asname.3815
%.tmp3816 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3817 = icmp eq %m1861$.ModuleLookup.type* %.tmp3816, null
br i1 %.tmp3817, label %.if.true.3818, label %.if.false.3818
.if.true.3818:
%.tmp3819 = load i32, i32* @ModuleLookup_size
%.tmp3820 = call i8*(i32) @malloc(i32 %.tmp3819)
%.tmp3821 = bitcast i8* %.tmp3820 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3821, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3822 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3823 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3822, i32 0, i32 0
%.tmp3824 = load i8*, i8** %mod_abspath.3716
store i8* %.tmp3824, i8** %.tmp3823
%.tmp3825 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3826 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3825, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3826
%.tmp3827 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3828 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3827, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3828
%.tmp3829 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3830 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3829, i32 0, i32 1
%.tmp3831 = getelementptr i8*, i8** %.tmp3830, i32 0
%.tmp3833 = getelementptr [5 x i8], [5 x i8]*@.str3832, i32 0, i32 0
%.tmp3834 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3835 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3834)
%.tmp3836 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3831, i8* %.tmp3833, i32 %.tmp3835)
%.tmp3838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3839 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3838, i32 0, i32 6
%.tmp3840 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3839
store %m1861$.ModuleLookup.type* %.tmp3840, %m1861$.ModuleLookup.type** %m.3781
br label %.for.start.3837
.for.start.3837:
%.tmp3841 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
%.tmp3842 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3841, i32 0, i32 2
%.tmp3843 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3842
%.tmp3844 = icmp ne %m1861$.ModuleLookup.type* %.tmp3843, null
br i1 %.tmp3844, label %.for.continue.3837, label %.for.end.3837
.for.continue.3837:
%.tmp3845 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
%.tmp3846 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3845, i32 0, i32 2
%.tmp3847 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3846
store %m1861$.ModuleLookup.type* %.tmp3847, %m1861$.ModuleLookup.type** %m.3781
br label %.for.start.3837
.for.end.3837:
%.tmp3848 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3781
%.tmp3849 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3848, i32 0, i32 2
%.tmp3850 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
store %m1861$.ModuleLookup.type* %.tmp3850, %m1861$.ModuleLookup.type** %.tmp3849
%.tmp3851 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3852 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3853 = load i8*, i8** %asname.3815
%.tmp3854 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3855 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3854, i32 0, i32 0
%.tmp3856 = load i8*, i8** %.tmp3855
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3851, %m307$.Node.type* %.tmp3852, i8* %.tmp3853, i8* %.tmp3856)
%.tmp3857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3858 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3857, i32 0, i32 7
%.tmp3859 = load i8*, i8** %.tmp3858
%curr_mod.3860 = alloca i8*
store i8* %.tmp3859, i8** %curr_mod.3860
%.tmp3861 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3862 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3861, i32 0, i32 7
%.tmp3863 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3864 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3863, i32 0, i32 0
%.tmp3865 = load i8*, i8** %.tmp3864
store i8* %.tmp3865, i8** %.tmp3862
%.tmp3866 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3867 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3868 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3869 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3868, i32 0, i32 0
%.tmp3870 = load i8*, i8** %.tmp3869
%.tmp3871 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3866, %m307$.Node.type* %.tmp3867, i8* %.tmp3870)
%.tmp3872 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3873 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3872, i32 0, i32 7
%.tmp3874 = load i8*, i8** %curr_mod.3860
store i8* %.tmp3874, i8** %.tmp3873
br label %.if.end.3818
.if.false.3818:
%.tmp3875 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3876 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3877 = load i8*, i8** %asname.3815
%.tmp3878 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3783
%.tmp3879 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3878, i32 0, i32 0
%.tmp3880 = load i8*, i8** %.tmp3879
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3875, %m307$.Node.type* %.tmp3876, i8* %.tmp3877, i8* %.tmp3880)
br label %.if.end.3818
.if.end.3818:
br label %.if.end.3704
.if.false.3704:
br label %.if.end.3704
.if.end.3704:
br label %.if.end.3701
.if.false.3701:
%.tmp3881 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3882 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3884 = getelementptr [40 x i8], [40 x i8]*@.str3883, i32 0, i32 0
%.tmp3885 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3881, %m307$.Node.type* %.tmp3882, i8* %.tmp3884)
%.tmp3886 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3887 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3886, i32 0, i32 0
%.tmp3888 = load i8*, i8** %.tmp3887
%.tmp3889 = call i32(i8*,...) @printf(i8* %.tmp3885, i8* %.tmp3888)
br label %.if.end.3701
.if.end.3701:
br label %.if.end.3490
.if.end.3490:
br label %.if.end.3371
.if.end.3371:
br label %.if.end.3273
.if.end.3273:
br label %.if.end.3208
.if.end.3208:
br label %.if.end.3200
.if.end.3200:
ret void
}
define i8* @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3890 = alloca i8*
store i8* null, i8** %buf.3890
%.tmp3891 = getelementptr i8*, i8** %buf.3890, i32 0
%.tmp3893 = getelementptr [31 x i8], [31 x i8]*@.str3892, i32 0, i32 0
%.tmp3894 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3895 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3894, i32 0, i32 7
%.tmp3896 = load i8*, i8** %.tmp3895
%.tmp3897 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3898 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3897, i32 0, i32 3
%.tmp3899 = load i32, i32* %.tmp3898
%.tmp3900 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3900, i32 0, i32 4
%.tmp3902 = load i32, i32* %.tmp3901
%.tmp3903 = load i8*, i8** %msg
%.tmp3904 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3891, i8* %.tmp3893, i8* %.tmp3896, i32 %.tmp3899, i32 %.tmp3902, i8* %.tmp3903)
%.tmp3905 = load i8*, i8** %buf.3890
ret i8* %.tmp3905
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3906 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3906
%.tmp3908 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3909 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3908, %m307$.Node.type** %param_ptr.3909
br label %.for.start.3907
.for.start.3907:
%.tmp3910 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3911 = icmp ne %m307$.Node.type* %.tmp3910, null
br i1 %.tmp3911, label %.for.continue.3907, label %.for.end.3907
.for.continue.3907:
%.tmp3912 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3913 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3914 = icmp ne %m307$.Node.type* %.tmp3912, %.tmp3913
br i1 %.tmp3914, label %.if.true.3915, label %.if.false.3915
.if.true.3915:
%.tmp3916 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3917 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3916, i32 0, i32 7
%.tmp3918 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3917
store %m307$.Node.type* %.tmp3918, %m307$.Node.type** %param_ptr.3909
br label %.if.end.3915
.if.false.3915:
br label %.if.end.3915
.if.end.3915:
%.tmp3919 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3920 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3919)
%param_info.3921 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3920, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3922 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3923 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3922, i32 0, i32 2
%.tmp3925 = getelementptr [9 x i8], [9 x i8]*@.str3924, i32 0, i32 0
store i8* %.tmp3925, i8** %.tmp3923
%.tmp3926 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3927 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3926, i32 0, i32 0
%.tmp3928 = load i8*, i8** %.tmp3927
%.tmp3930 = getelementptr [5 x i8], [5 x i8]*@.str3929, i32 0, i32 0
%.tmp3931 = call i32(i8*,i8*) @strcmp(i8* %.tmp3928, i8* %.tmp3930)
%.tmp3932 = icmp eq i32 %.tmp3931, 0
br i1 %.tmp3932, label %.if.true.3933, label %.if.false.3933
.if.true.3933:
%.tmp3934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3935 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3936 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3935, i32 0, i32 6
%.tmp3937 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3936
%.tmp3938 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3934, %m307$.Node.type* %.tmp3937)
store %m1861$.Type.type* %.tmp3938, %m1861$.Type.type** %param_type.3906
%.tmp3939 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3940 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3939, i32 0, i32 7
%.tmp3941 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3940
store %m307$.Node.type* %.tmp3941, %m307$.Node.type** %param_ptr.3909
br label %.if.end.3933
.if.false.3933:
br label %.if.end.3933
.if.end.3933:
%.tmp3942 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3943 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3942, i32 0, i32 3
%.tmp3944 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3906
store %m1861$.Type.type* %.tmp3944, %m1861$.Type.type** %.tmp3943
%.tmp3945 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3946 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3945, i32 0, i32 1
%.tmp3947 = load i8*, i8** %.tmp3946
%var_name.3948 = alloca i8*
store i8* %.tmp3947, i8** %var_name.3948
%.tmp3949 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3950 = load i8, i8* @SCOPE_LOCAL
%.tmp3951 = load i8*, i8** %var_name.3948
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3949, i8 %.tmp3950, i8* %.tmp3951)
%.tmp3952 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3953 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3954 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3953, i32 0, i32 3
%.tmp3955 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3954
%.tmp3956 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3952, %m1861$.Type.type* %.tmp3955)
%param_info_tr.3957 = alloca i8*
store i8* %.tmp3956, i8** %param_info_tr.3957
%.tmp3958 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3959 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3958, i32 0, i32 1
%.tmp3960 = load %m0$.File.type*, %m0$.File.type** %.tmp3959
%.tmp3962 = getelementptr [16 x i8], [16 x i8]*@.str3961, i32 0, i32 0
%.tmp3963 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3964 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3963)
%.tmp3965 = load i8*, i8** %param_info_tr.3957
%.tmp3966 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3960, i8* %.tmp3962, i8* %.tmp3964, i8* %.tmp3965)
%.tmp3967 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3968 = load i8*, i8** %var_name.3948
%.tmp3969 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3967, i8* %.tmp3968, %m1861$.AssignableInfo.type* %.tmp3969)
%.tmp3970 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3971 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3970, i32 0, i32 1
%.tmp3972 = load %m0$.File.type*, %m0$.File.type** %.tmp3971
%.tmp3974 = getelementptr [28 x i8], [28 x i8]*@.str3973, i32 0, i32 0
%.tmp3975 = load i8*, i8** %param_info_tr.3957
%.tmp3976 = load i8*, i8** %var_name.3948
%.tmp3977 = load i8*, i8** %param_info_tr.3957
%.tmp3978 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3921
%.tmp3979 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3978)
%.tmp3980 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3972, i8* %.tmp3974, i8* %.tmp3975, i8* %.tmp3976, i8* %.tmp3977, i8* %.tmp3979)
%.tmp3981 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3909
%.tmp3982 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3981, i32 0, i32 7
%.tmp3983 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3982
store %m307$.Node.type* %.tmp3983, %m307$.Node.type** %param_ptr.3909
br label %.for.start.3907
.for.end.3907:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3984 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3986 = getelementptr [6 x i8], [6 x i8]*@.str3985, i32 0, i32 0
%.tmp3987 = bitcast ptr null to i8*
%.tmp3988 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3984, i8* %.tmp3986, i8* %.tmp3987, i8* %.tmp3988)
%.tmp3989 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3990 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3989, i32 0, i32 6
%.tmp3991 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3990
%.tmp3993 = getelementptr [12 x i8], [12 x i8]*@.str3992, i32 0, i32 0
%.tmp3994 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3991, i8* %.tmp3993)
%exprs.3995 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3994, %m307$.Node.type** %exprs.3995
%.tmp3996 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3995
%.tmp3997 = icmp ne %m307$.Node.type* %.tmp3996, null
br i1 %.tmp3997, label %.if.true.3998, label %.if.false.3998
.if.true.3998:
%.tmp4000 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3995
%.tmp4001 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4000, i32 0, i32 6
%.tmp4002 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4001
%b.4003 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4002, %m307$.Node.type** %b.4003
br label %.for.start.3999
.for.start.3999:
%.tmp4004 = load %m307$.Node.type*, %m307$.Node.type** %b.4003
%.tmp4005 = icmp ne %m307$.Node.type* %.tmp4004, null
br i1 %.tmp4005, label %.for.continue.3999, label %.for.end.3999
.for.continue.3999:
%.tmp4006 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4007 = load %m307$.Node.type*, %m307$.Node.type** %b.4003
%.tmp4008 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4007, i32 0, i32 6
%.tmp4009 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4008
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4006, %m307$.Node.type* %.tmp4009)
%.tmp4010 = load %m307$.Node.type*, %m307$.Node.type** %b.4003
%.tmp4011 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4010, i32 0, i32 7
%.tmp4012 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4011
store %m307$.Node.type* %.tmp4012, %m307$.Node.type** %b.4003
br label %.for.start.3999
.for.end.3999:
br label %.if.end.3998
.if.false.3998:
br label %.if.end.3998
.if.end.3998:
%.tmp4013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4013)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4014 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4015 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4016 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4014, %m307$.Node.type* %.tmp4015)
%val.4017 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4016, %m1861$.AssignableInfo.type** %val.4017
%.tmp4018 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4017
%.tmp4019 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4018, i32 0, i32 3
%.tmp4020 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4019
%.tmp4021 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4020, i32 0, i32 0
%.tmp4022 = load i8*, i8** %.tmp4021
%.tmp4024 = getelementptr [7 x i8], [7 x i8]*@.str4023, i32 0, i32 0
%.tmp4025 = call i32(i8*,i8*) @strcmp(i8* %.tmp4022, i8* %.tmp4024)
%.tmp4026 = icmp ne i32 %.tmp4025, 0
br i1 %.tmp4026, label %.if.true.4027, label %.if.false.4027
.if.true.4027:
%.tmp4029 = getelementptr [7 x i8], [7 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = call i32(i8*,...) @printf(i8* %.tmp4029)
%.tmp4031 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4031
br label %.if.end.4027
.if.false.4027:
br label %.if.end.4027
.if.end.4027:
%.tmp4032 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4017
%.tmp4033 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4032, i32 0, i32 3
%.tmp4034 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4033
%.tmp4035 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4034, i32 0, i32 3
%.tmp4036 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4035
%node_type.4037 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4036, %m1861$.Type.type** %node_type.4037
%i.4039 = alloca i32
store i32 0, i32* %i.4039
br label %.for.start.4038
.for.start.4038:
%.tmp4040 = load i32, i32* %i.4039
%.tmp4041 = load i32, i32* %attr_id
%.tmp4042 = icmp slt i32 %.tmp4040, %.tmp4041
br i1 %.tmp4042, label %.for.continue.4038, label %.for.end.4038
.for.continue.4038:
%.tmp4043 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4037
%.tmp4044 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4043, i32 0, i32 4
%.tmp4045 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4044
store %m1861$.Type.type* %.tmp4045, %m1861$.Type.type** %node_type.4037
%.tmp4046 = load i32, i32* %i.4039
%.tmp4047 = add i32 %.tmp4046, 1
store i32 %.tmp4047, i32* %i.4039
br label %.for.start.4038
.for.end.4038:
%.tmp4048 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4049 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4048)
%info.4050 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4049, %m1861$.AssignableInfo.type** %info.4050
%.tmp4051 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4050
%.tmp4052 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4051, i32 0, i32 3
%.tmp4053 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4037
store %m1861$.Type.type* %.tmp4053, %m1861$.Type.type** %.tmp4052
%.tmp4054 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4055 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4054)
%tmp_id.4056 = alloca i32
store i32 %.tmp4055, i32* %tmp_id.4056
%.tmp4057 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4058 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4017
%.tmp4059 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4058, i32 0, i32 3
%.tmp4060 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4059
%.tmp4061 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4057, %m1861$.Type.type* %.tmp4060)
%type_as_str.4062 = alloca i8*
store i8* %.tmp4061, i8** %type_as_str.4062
%.tmp4063 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4064 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4050
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4063, %m1861$.AssignableInfo.type* %.tmp4064)
%.tmp4065 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4066 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4065, i32 0, i32 1
%.tmp4067 = load %m0$.File.type*, %m0$.File.type** %.tmp4066
%.tmp4069 = getelementptr [52 x i8], [52 x i8]*@.str4068, i32 0, i32 0
%.tmp4070 = load i32, i32* %tmp_id.4056
%.tmp4071 = load i8*, i8** %type_as_str.4062
%.tmp4072 = load i8*, i8** %type_as_str.4062
%.tmp4073 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4017
%.tmp4074 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4073)
%.tmp4075 = load i32, i32* %attr_id
%.tmp4076 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4067, i8* %.tmp4069, i32 %.tmp4070, i8* %.tmp4071, i8* %.tmp4072, i8* %.tmp4074, i32 %.tmp4075)
%.tmp4077 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4078 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4077, i32 0, i32 1
%.tmp4079 = load %m0$.File.type*, %m0$.File.type** %.tmp4078
%.tmp4081 = getelementptr [28 x i8], [28 x i8]*@.str4080, i32 0, i32 0
%.tmp4082 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4050
%.tmp4083 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4082)
%.tmp4084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4085 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4050
%.tmp4086 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4085, i32 0, i32 3
%.tmp4087 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4086
%.tmp4088 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4084, %m1861$.Type.type* %.tmp4087)
%.tmp4089 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4090 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4050
%.tmp4091 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4090, i32 0, i32 3
%.tmp4092 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4091
%.tmp4093 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4089, %m1861$.Type.type* %.tmp4092)
%.tmp4094 = load i32, i32* %tmp_id.4056
%.tmp4095 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4079, i8* %.tmp4081, i8* %.tmp4083, i8* %.tmp4088, i8* %.tmp4093, i32 %.tmp4094)
%.tmp4096 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4050
ret %m1861$.AssignableInfo.type* %.tmp4096
}
define void @m1861$set_struct_attr.v.m1861$.CompilerCtx.typep.m307$.Node.typep.i.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4097 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4098 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4099 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4097, %m307$.Node.type* %.tmp4098)
%val.4100 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4099, %m1861$.AssignableInfo.type** %val.4100
%.tmp4101 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4100
%.tmp4102 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4101, i32 0, i32 3
%.tmp4103 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4102
%.tmp4104 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4103, i32 0, i32 0
%.tmp4105 = load i8*, i8** %.tmp4104
%.tmp4107 = getelementptr [7 x i8], [7 x i8]*@.str4106, i32 0, i32 0
%.tmp4108 = call i32(i8*,i8*) @strcmp(i8* %.tmp4105, i8* %.tmp4107)
%.tmp4109 = icmp ne i32 %.tmp4108, 0
br i1 %.tmp4109, label %.if.true.4110, label %.if.false.4110
.if.true.4110:
%.tmp4112 = getelementptr [7 x i8], [7 x i8]*@.str4111, i32 0, i32 0
%.tmp4113 = call i32(i8*,...) @printf(i8* %.tmp4112)
ret void
br label %.if.end.4110
.if.false.4110:
br label %.if.end.4110
.if.end.4110:
%.tmp4114 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4100
%.tmp4115 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4114, i32 0, i32 3
%.tmp4116 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4115
%.tmp4117 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4116, i32 0, i32 3
%.tmp4118 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4117
%node_type.4119 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4118, %m1861$.Type.type** %node_type.4119
%i.4121 = alloca i32
store i32 0, i32* %i.4121
br label %.for.start.4120
.for.start.4120:
%.tmp4122 = load i32, i32* %i.4121
%.tmp4123 = load i32, i32* %attr_id
%.tmp4124 = icmp slt i32 %.tmp4122, %.tmp4123
br i1 %.tmp4124, label %.for.continue.4120, label %.for.end.4120
.for.continue.4120:
%.tmp4125 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4119
%.tmp4126 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4125, i32 0, i32 4
%.tmp4127 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4126
store %m1861$.Type.type* %.tmp4127, %m1861$.Type.type** %node_type.4119
%.tmp4128 = load i32, i32* %i.4121
%.tmp4129 = add i32 %.tmp4128, 1
store i32 %.tmp4129, i32* %i.4121
br label %.for.start.4120
.for.end.4120:
%.tmp4130 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4131 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4130)
%tmp_id.4132 = alloca i32
store i32 %.tmp4131, i32* %tmp_id.4132
%.tmp4133 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4134 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4100
%.tmp4135 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4134, i32 0, i32 3
%.tmp4136 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4135
%.tmp4137 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4133, %m1861$.Type.type* %.tmp4136)
%type_as_str.4138 = alloca i8*
store i8* %.tmp4137, i8** %type_as_str.4138
%.tmp4139 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4140 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4139, i32 0, i32 1
%.tmp4141 = load %m0$.File.type*, %m0$.File.type** %.tmp4140
%.tmp4143 = getelementptr [52 x i8], [52 x i8]*@.str4142, i32 0, i32 0
%.tmp4144 = load i32, i32* %tmp_id.4132
%.tmp4145 = load i8*, i8** %type_as_str.4138
%.tmp4146 = load i8*, i8** %type_as_str.4138
%.tmp4147 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4100
%.tmp4148 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4147)
%.tmp4149 = load i32, i32* %attr_id
%.tmp4150 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4141, i8* %.tmp4143, i32 %.tmp4144, i8* %.tmp4145, i8* %.tmp4146, i8* %.tmp4148, i32 %.tmp4149)
%.tmp4151 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4152 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4151, i32 0, i32 1
%.tmp4153 = load %m0$.File.type*, %m0$.File.type** %.tmp4152
%.tmp4155 = getelementptr [18 x i8], [18 x i8]*@.str4154, i32 0, i32 0
%.tmp4156 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4157 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4119
%.tmp4158 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4156, %m1861$.Type.type* %.tmp4157)
%.tmp4159 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4160 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4119
%.tmp4161 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4159, %m1861$.Type.type* %.tmp4160)
%.tmp4162 = load i8*, i8** %attr
%.tmp4163 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4153, i8* %.tmp4155, i8* %.tmp4158, i8* %.tmp4161, i8* %.tmp4162)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4164 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4165 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4164, i32 0, i32 6
%.tmp4166 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4165
%.tmp4167 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4166, i32 0, i32 6
%.tmp4168 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4167
%dotted.4169 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4168, %m307$.Node.type** %dotted.4169
%.tmp4170 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4169
%.tmp4171 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4170, i32 0, i32 7
%.tmp4172 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4171
%.tmp4173 = icmp ne %m307$.Node.type* %.tmp4172, null
br i1 %.tmp4173, label %.if.true.4174, label %.if.false.4174
.if.true.4174:
%.tmp4175 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4175
br label %.if.end.4174
.if.false.4174:
br label %.if.end.4174
.if.end.4174:
%.tmp4176 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4169
%.tmp4177 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4176, i32 0, i32 1
%.tmp4178 = load i8*, i8** %.tmp4177
%.tmp4180 = getelementptr [7 x i8], [7 x i8]*@.str4179, i32 0, i32 0
%.tmp4181 = call i32(i8*,i8*) @strcmp(i8* %.tmp4178, i8* %.tmp4180)
%.tmp4182 = icmp eq i32 %.tmp4181, 0
br i1 %.tmp4182, label %.if.true.4183, label %.if.false.4183
.if.true.4183:
%.tmp4184 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4186 = getelementptr [8 x i8], [8 x i8]*@.str4185, i32 0, i32 0
%.tmp4187 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4184, i8* %.tmp4186)
%args.4188 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4187, %m307$.Node.type** %args.4188
%.tmp4189 = load %m307$.Node.type*, %m307$.Node.type** %args.4188
%.tmp4190 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4189, i32 0, i32 6
%.tmp4191 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4190
%.tmp4193 = getelementptr [11 x i8], [11 x i8]*@.str4192, i32 0, i32 0
%.tmp4194 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4191, i8* %.tmp4193)
%value.4195 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4194, %m307$.Node.type** %value.4195
%.tmp4196 = load %m307$.Node.type*, %m307$.Node.type** %value.4195
%.tmp4197 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4196, i32 0, i32 6
%.tmp4198 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4197
%.tmp4199 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4198, i32 0, i32 6
%.tmp4200 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4199
%.tmp4201 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4200, i32 0, i32 6
%.tmp4202 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4201
%.tmp4203 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4202, i32 0, i32 6
%.tmp4204 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4203
store %m307$.Node.type* %.tmp4204, %m307$.Node.type** %value.4195
%.tmp4205 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4206 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4205)
%tmp_id.4207 = alloca i32
store i32 %.tmp4206, i32* %tmp_id.4207
%.tmp4208 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4209 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4208)
%info.4210 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4209, %m1861$.AssignableInfo.type** %info.4210
%.tmp4211 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4212 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4210
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4211, %m1861$.AssignableInfo.type* %.tmp4212)
%.tmp4213 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4210
%.tmp4214 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4213, i32 0, i32 3
%.tmp4215 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4215, %m1861$.Type.type** %.tmp4214
%.tmp4216 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4210
%.tmp4217 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4216, i32 0, i32 3
%.tmp4218 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4217
%.tmp4219 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4218, i32 0, i32 0
%.tmp4221 = getelementptr [4 x i8], [4 x i8]*@.str4220, i32 0, i32 0
store i8* %.tmp4221, i8** %.tmp4219
%.tmp4222 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4223 = load %m307$.Node.type*, %m307$.Node.type** %value.4195
%.tmp4224 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4222, %m307$.Node.type* %.tmp4223)
%inspected_type.4225 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4224, %m1861$.Type.type** %inspected_type.4225
%.tmp4226 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4227 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4225
%.tmp4228 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4226, %m1861$.Type.type* %.tmp4227)
%type_as_str.4229 = alloca i8*
store i8* %.tmp4228, i8** %type_as_str.4229
%.tmp4230 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4231 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4230, i32 0, i32 1
%.tmp4232 = load %m0$.File.type*, %m0$.File.type** %.tmp4231
%.tmp4234 = getelementptr [46 x i8], [46 x i8]*@.str4233, i32 0, i32 0
%.tmp4235 = load i32, i32* %tmp_id.4207
%.tmp4236 = load i8*, i8** %type_as_str.4229
%.tmp4237 = load i8*, i8** %type_as_str.4229
%.tmp4238 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4232, i8* %.tmp4234, i32 %.tmp4235, i8* %.tmp4236, i8* %.tmp4237)
%.tmp4239 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4240 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4239, i32 0, i32 1
%.tmp4241 = load %m0$.File.type*, %m0$.File.type** %.tmp4240
%.tmp4243 = getelementptr [35 x i8], [35 x i8]*@.str4242, i32 0, i32 0
%.tmp4244 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4210
%.tmp4245 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4244)
%.tmp4246 = load i8*, i8** %type_as_str.4229
%.tmp4247 = load i32, i32* %tmp_id.4207
%.tmp4248 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4241, i8* %.tmp4243, i8* %.tmp4245, i8* %.tmp4246, i32 %.tmp4247)
%.tmp4249 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4210
ret %m1861$.AssignableInfo.type* %.tmp4249
br label %.if.end.4183
.if.false.4183:
%.tmp4250 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4169
%.tmp4251 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4250, i32 0, i32 1
%.tmp4252 = load i8*, i8** %.tmp4251
%.tmp4254 = getelementptr [7 x i8], [7 x i8]*@.str4253, i32 0, i32 0
%.tmp4255 = call i32(i8*,i8*) @strcmp(i8* %.tmp4252, i8* %.tmp4254)
%.tmp4256 = icmp eq i32 %.tmp4255, 0
br i1 %.tmp4256, label %.if.true.4257, label %.if.false.4257
.if.true.4257:
%.tmp4258 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4260 = getelementptr [8 x i8], [8 x i8]*@.str4259, i32 0, i32 0
%.tmp4261 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4258, i8* %.tmp4260)
%args.4262 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4261, %m307$.Node.type** %args.4262
%.tmp4263 = load %m307$.Node.type*, %m307$.Node.type** %args.4262
%.tmp4264 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4263, i32 0, i32 6
%.tmp4265 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4264
%.tmp4267 = getelementptr [11 x i8], [11 x i8]*@.str4266, i32 0, i32 0
%.tmp4268 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4265, i8* %.tmp4267)
%array.4269 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4268, %m307$.Node.type** %array.4269
%.tmp4270 = load %m307$.Node.type*, %m307$.Node.type** %array.4269
%.tmp4271 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4270, i32 0, i32 7
%.tmp4272 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4271
%.tmp4274 = getelementptr [11 x i8], [11 x i8]*@.str4273, i32 0, i32 0
%.tmp4275 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4272, i8* %.tmp4274)
%value.4276 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4275, %m307$.Node.type** %value.4276
%.tmp4277 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4278 = load %m307$.Node.type*, %m307$.Node.type** %value.4276
%.tmp4279 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4277, %m307$.Node.type* %.tmp4278)
%value_info.4280 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4279, %m1861$.AssignableInfo.type** %value_info.4280
%.tmp4281 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4282 = load %m307$.Node.type*, %m307$.Node.type** %array.4269
%.tmp4283 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4281, %m307$.Node.type* %.tmp4282)
%array_info.4284 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4283, %m1861$.AssignableInfo.type** %array_info.4284
%.tmp4285 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4286 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4285)
%info.4287 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4286, %m1861$.AssignableInfo.type** %info.4287
%.tmp4288 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4289 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4287
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4288, %m1861$.AssignableInfo.type* %.tmp4289)
%.tmp4290 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4287
%.tmp4291 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4290, i32 0, i32 3
%.tmp4292 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4284
%.tmp4293 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4292, i32 0, i32 3
%.tmp4294 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4293
store %m1861$.Type.type* %.tmp4294, %m1861$.Type.type** %.tmp4291
%builtin_prefix.4295 = alloca i8*
store i8* null, i8** %builtin_prefix.4295
%.tmp4296 = getelementptr i8*, i8** %builtin_prefix.4295, i32 0
%.tmp4298 = getelementptr [5 x i8], [5 x i8]*@.str4297, i32 0, i32 0
%.tmp4299 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4300 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4299)
%.tmp4301 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4296, i8* %.tmp4298, i32 %.tmp4300)
%.tmp4302 = call i8*() @m2540$append_tmpl.cp()
%tmpl.4303 = alloca i8*
store i8* %.tmp4302, i8** %tmpl.4303
%.tmp4304 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4305 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4304, i32 0, i32 1
%.tmp4306 = load %m0$.File.type*, %m0$.File.type** %.tmp4305
%.tmp4307 = load i8*, i8** %tmpl.4303
%.tmp4308 = load i8*, i8** %builtin_prefix.4295
%.tmp4309 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4310 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4284
%.tmp4311 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4310, i32 0, i32 3
%.tmp4312 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4311
%.tmp4313 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4309, %m1861$.Type.type* %.tmp4312)
%.tmp4314 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4284
%.tmp4315 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4314)
%.tmp4316 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4317 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4280
%.tmp4318 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4317, i32 0, i32 3
%.tmp4319 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4318
%.tmp4320 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4316, %m1861$.Type.type* %.tmp4319)
%.tmp4321 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4280
%.tmp4322 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4321)
%.tmp4323 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4287
%.tmp4324 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4323)
%.tmp4325 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4306, i8* %.tmp4307, i8* %.tmp4308, i8* %.tmp4313, i8* %.tmp4315, i8* %.tmp4320, i8* %.tmp4322, i8* %.tmp4324)
%.tmp4326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4287
ret %m1861$.AssignableInfo.type* %.tmp4326
br label %.if.end.4257
.if.false.4257:
%.tmp4327 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4169
%.tmp4328 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4327, i32 0, i32 1
%.tmp4329 = load i8*, i8** %.tmp4328
%.tmp4331 = getelementptr [4 x i8], [4 x i8]*@.str4330, i32 0, i32 0
%.tmp4332 = call i32(i8*,i8*) @strcmp(i8* %.tmp4329, i8* %.tmp4331)
%.tmp4333 = icmp eq i32 %.tmp4332, 0
br i1 %.tmp4333, label %.if.true.4334, label %.if.false.4334
.if.true.4334:
%.tmp4335 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4337 = getelementptr [8 x i8], [8 x i8]*@.str4336, i32 0, i32 0
%.tmp4338 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4335, i8* %.tmp4337)
%args.4339 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4338, %m307$.Node.type** %args.4339
%.tmp4340 = load %m307$.Node.type*, %m307$.Node.type** %args.4339
%.tmp4341 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4340, i32 0, i32 6
%.tmp4342 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4341
%.tmp4344 = getelementptr [11 x i8], [11 x i8]*@.str4343, i32 0, i32 0
%.tmp4345 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4342, i8* %.tmp4344)
%value.4346 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4345, %m307$.Node.type** %value.4346
%.tmp4347 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4348 = load %m307$.Node.type*, %m307$.Node.type** %value.4346
%.tmp4349 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i32) @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.tmp4347, %m307$.Node.type* %.tmp4348, i32 1)
ret %m1861$.AssignableInfo.type* %.tmp4349
br label %.if.end.4334
.if.false.4334:
br label %.if.end.4334
.if.end.4334:
br label %.if.end.4257
.if.end.4257:
br label %.if.end.4183
.if.end.4183:
%.tmp4350 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4350
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4351 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4352 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4353 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4351, %m307$.Node.type* %.tmp4352)
%info.4354 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4353, %m1861$.AssignableInfo.type** %info.4354
%.tmp4355 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4356 = icmp ne %m1861$.AssignableInfo.type* %.tmp4355, null
br i1 %.tmp4356, label %.if.true.4357, label %.if.false.4357
.if.true.4357:
%.tmp4358 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
ret %m1861$.AssignableInfo.type* %.tmp4358
br label %.if.end.4357
.if.false.4357:
br label %.if.end.4357
.if.end.4357:
%.tmp4359 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4360 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4361 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4359, %m307$.Node.type* %.tmp4360)
store %m1861$.AssignableInfo.type* %.tmp4361, %m1861$.AssignableInfo.type** %info.4354
%.tmp4362 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4363 = icmp eq %m1861$.AssignableInfo.type* %.tmp4362, null
br i1 %.tmp4363, label %.if.true.4364, label %.if.false.4364
.if.true.4364:
%.tmp4365 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4365, label %.if.true.4366, label %.if.false.4366
.if.true.4366:
%.tmp4367 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4368 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4370 = getelementptr [35 x i8], [35 x i8]*@.str4369, i32 0, i32 0
%.tmp4371 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4367, %m307$.Node.type* %.tmp4368, i8* %.tmp4370)
%.tmp4372 = call i32(i8*,...) @printf(i8* %.tmp4371)
br label %.if.end.4366
.if.false.4366:
br label %.if.end.4366
.if.end.4366:
%.tmp4373 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4373
br label %.if.end.4364
.if.false.4364:
br label %.if.end.4364
.if.end.4364:
%.tmp4374 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4376 = getelementptr [8 x i8], [8 x i8]*@.str4375, i32 0, i32 0
%.tmp4377 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4374, i8* %.tmp4376)
%args.4378 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4377, %m307$.Node.type** %args.4378
%.tmp4380 = getelementptr [1 x i8], [1 x i8]*@.str4379, i32 0, i32 0
%params_buff.4381 = alloca i8*
store i8* %.tmp4380, i8** %params_buff.4381
%tmp.4382 = alloca i8*
store i8* null, i8** %tmp.4382
%.tmp4383 = load %m307$.Node.type*, %m307$.Node.type** %args.4378
%.tmp4384 = icmp ne %m307$.Node.type* %.tmp4383, null
br i1 %.tmp4384, label %.if.true.4385, label %.if.false.4385
.if.true.4385:
%.tmp4386 = load %m307$.Node.type*, %m307$.Node.type** %args.4378
%.tmp4387 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4386, i32 0, i32 6
%.tmp4388 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4387
%.tmp4390 = getelementptr [11 x i8], [11 x i8]*@.str4389, i32 0, i32 0
%.tmp4391 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4388, i8* %.tmp4390)
%start.4392 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4391, %m307$.Node.type** %start.4392
%.tmp4394 = load %m307$.Node.type*, %m307$.Node.type** %start.4392
%pp.4395 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4394, %m307$.Node.type** %pp.4395
br label %.for.start.4393
.for.start.4393:
%.tmp4396 = load %m307$.Node.type*, %m307$.Node.type** %pp.4395
%.tmp4397 = icmp ne %m307$.Node.type* %.tmp4396, null
br i1 %.tmp4397, label %.for.continue.4393, label %.for.end.4393
.for.continue.4393:
%.tmp4398 = load %m307$.Node.type*, %m307$.Node.type** %pp.4395
%.tmp4399 = load %m307$.Node.type*, %m307$.Node.type** %start.4392
%.tmp4400 = icmp ne %m307$.Node.type* %.tmp4398, %.tmp4399
br i1 %.tmp4400, label %.if.true.4401, label %.if.false.4401
.if.true.4401:
%.tmp4402 = getelementptr i8*, i8** %tmp.4382, i32 0
%.tmp4404 = getelementptr [5 x i8], [5 x i8]*@.str4403, i32 0, i32 0
%.tmp4405 = load i8*, i8** %params_buff.4381
%.tmp4406 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4402, i8* %.tmp4404, i8* %.tmp4405)
%.tmp4407 = load i8*, i8** %params_buff.4381
%tmp_buff.4408 = alloca i8*
store i8* %.tmp4407, i8** %tmp_buff.4408
%.tmp4409 = load i8*, i8** %tmp.4382
store i8* %.tmp4409, i8** %params_buff.4381
%.tmp4410 = load i8*, i8** %tmp_buff.4408
store i8* %.tmp4410, i8** %tmp.4382
%.tmp4411 = load i8*, i8** %tmp.4382
call void(i8*) @free(i8* %.tmp4411)
br label %.if.end.4401
.if.false.4401:
br label %.if.end.4401
.if.end.4401:
%.tmp4412 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4413 = load %m307$.Node.type*, %m307$.Node.type** %pp.4395
%.tmp4414 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4412, %m307$.Node.type* %.tmp4413)
%a_info.4415 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4414, %m1861$.AssignableInfo.type** %a_info.4415
%.tmp4416 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4415
%.tmp4417 = icmp eq %m1861$.AssignableInfo.type* %.tmp4416, null
br i1 %.tmp4417, label %.if.true.4418, label %.if.false.4418
.if.true.4418:
%.tmp4419 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4419
br label %.if.end.4418
.if.false.4418:
br label %.if.end.4418
.if.end.4418:
%.tmp4420 = getelementptr i8*, i8** %params_buff.4381, i32 0
%.tmp4422 = getelementptr [8 x i8], [8 x i8]*@.str4421, i32 0, i32 0
%.tmp4423 = load i8*, i8** %params_buff.4381
%.tmp4424 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4425 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4415
%.tmp4426 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4425, i32 0, i32 3
%.tmp4427 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4426
%.tmp4428 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4424, %m1861$.Type.type* %.tmp4427)
%.tmp4429 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4415
%.tmp4430 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4429)
%.tmp4431 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4420, i8* %.tmp4422, i8* %.tmp4423, i8* %.tmp4428, i8* %.tmp4430)
%.tmp4432 = load %m307$.Node.type*, %m307$.Node.type** %pp.4395
%.tmp4433 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4432, i32 0, i32 7
%.tmp4434 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4433
store %m307$.Node.type* %.tmp4434, %m307$.Node.type** %pp.4395
%.tmp4435 = load %m307$.Node.type*, %m307$.Node.type** %pp.4395
%.tmp4437 = getelementptr [11 x i8], [11 x i8]*@.str4436, i32 0, i32 0
%.tmp4438 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4435, i8* %.tmp4437)
store %m307$.Node.type* %.tmp4438, %m307$.Node.type** %pp.4395
br label %.for.start.4393
.for.end.4393:
br label %.if.end.4385
.if.false.4385:
br label %.if.end.4385
.if.end.4385:
%.tmp4439 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4440 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4441 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4440, i32 0, i32 3
%.tmp4442 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4441
%.tmp4443 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4442, i32 0, i32 3
%.tmp4444 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4443
%.tmp4445 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4439, %m1861$.Type.type* %.tmp4444)
%.tmp4447 = getelementptr [5 x i8], [5 x i8]*@.str4446, i32 0, i32 0
%.tmp4448 = call i32(i8*,i8*) @strcmp(i8* %.tmp4445, i8* %.tmp4447)
%.tmp4449 = icmp eq i32 %.tmp4448, 0
br i1 %.tmp4449, label %.if.true.4450, label %.if.false.4450
.if.true.4450:
%.tmp4451 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4452 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4451, i32 0, i32 1
%.tmp4453 = load %m0$.File.type*, %m0$.File.type** %.tmp4452
%.tmp4455 = getelementptr [16 x i8], [16 x i8]*@.str4454, i32 0, i32 0
%.tmp4456 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4457 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4458 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4457, i32 0, i32 3
%.tmp4459 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4458
%.tmp4460 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4456, %m1861$.Type.type* %.tmp4459)
%.tmp4461 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4462 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4461)
%.tmp4463 = load i8*, i8** %params_buff.4381
%.tmp4464 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4453, i8* %.tmp4455, i8* %.tmp4460, i8* %.tmp4462, i8* %.tmp4463)
%.tmp4465 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4465
br label %.if.end.4450
.if.false.4450:
br label %.if.end.4450
.if.end.4450:
%.tmp4466 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4467 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4466)
%call_info.4468 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4467, %m1861$.AssignableInfo.type** %call_info.4468
%.tmp4469 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4470 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4468
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4469, %m1861$.AssignableInfo.type* %.tmp4470)
%.tmp4471 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4468
%.tmp4472 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4471, i32 0, i32 3
%.tmp4473 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4474 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4473, i32 0, i32 3
%.tmp4475 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4474
%.tmp4476 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4475, i32 0, i32 3
%.tmp4477 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4476
%.tmp4478 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4477)
store %m1861$.Type.type* %.tmp4478, %m1861$.Type.type** %.tmp4472
%.tmp4479 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4468
%.tmp4480 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4479, i32 0, i32 3
%.tmp4481 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4480
%.tmp4482 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4481, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4482
%.tmp4483 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4484 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4483, i32 0, i32 1
%.tmp4485 = load %m0$.File.type*, %m0$.File.type** %.tmp4484
%.tmp4487 = getelementptr [21 x i8], [21 x i8]*@.str4486, i32 0, i32 0
%.tmp4488 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4468
%.tmp4489 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4488)
%.tmp4490 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4491 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4492 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4491, i32 0, i32 3
%.tmp4493 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4492
%.tmp4494 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4490, %m1861$.Type.type* %.tmp4493)
%.tmp4495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4354
%.tmp4496 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4495)
%.tmp4497 = load i8*, i8** %params_buff.4381
%.tmp4498 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4485, i8* %.tmp4487, i8* %.tmp4489, i8* %.tmp4494, i8* %.tmp4496, i8* %.tmp4497)
%.tmp4499 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4468
%.tmp4500 = bitcast %m1861$.AssignableInfo.type* %.tmp4499 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4500
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4501 = alloca i8*
store i8* null, i8** %err_msg.4501
%.tmp4502 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4503 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4502, i32 0, i32 0
%.tmp4504 = load i8*, i8** %.tmp4503
%expr_type.4505 = alloca i8*
store i8* %.tmp4504, i8** %expr_type.4505
%.tmp4506 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4507 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4506, %m1861$.AssignableInfo.type** %info.4507
%assignable.4508 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4508
%.tmp4509 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4510 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4509, %m1861$.AssignableInfo.type** %a_info.4510
%.tmp4511 = load i8*, i8** %expr_type.4505
%.tmp4513 = getelementptr [7 x i8], [7 x i8]*@.str4512, i32 0, i32 0
%.tmp4514 = call i32(i8*,i8*) @strcmp(i8* %.tmp4511, i8* %.tmp4513)
%.tmp4515 = icmp eq i32 %.tmp4514, 0
br i1 %.tmp4515, label %.if.true.4516, label %.if.false.4516
.if.true.4516:
%.tmp4517 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4518 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4517, i32 0, i32 6
%.tmp4519 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4518
%.tmp4520 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4519, i32 0, i32 7
%.tmp4521 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4520
%.tmp4522 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4521, i32 0, i32 0
%.tmp4523 = load i8*, i8** %.tmp4522
%.tmp4525 = getelementptr [3 x i8], [3 x i8]*@.str4524, i32 0, i32 0
%.tmp4526 = call i32(i8*,i8*) @strcmp(i8* %.tmp4523, i8* %.tmp4525)
%.tmp4527 = icmp ne i32 %.tmp4526, 0
br i1 %.tmp4527, label %.if.true.4528, label %.if.false.4528
.if.true.4528:
%.tmp4529 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4530 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4531 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4530, i32 0, i32 6
%.tmp4532 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4531
%.tmp4533 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4532, i32 0, i32 7
%.tmp4534 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4533
%.tmp4535 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4529, %m307$.Node.type* %.tmp4534)
store %m1861$.AssignableInfo.type* %.tmp4535, %m1861$.AssignableInfo.type** %info.4507
%.tmp4536 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4507
%.tmp4537 = icmp eq %m1861$.AssignableInfo.type* %.tmp4536, null
br i1 %.tmp4537, label %.if.true.4538, label %.if.false.4538
.if.true.4538:
ret void
br label %.if.end.4538
.if.false.4538:
br label %.if.end.4538
.if.end.4538:
%.tmp4539 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4540 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4539, i32 0, i32 1
%.tmp4541 = load %m0$.File.type*, %m0$.File.type** %.tmp4540
%.tmp4543 = getelementptr [11 x i8], [11 x i8]*@.str4542, i32 0, i32 0
%.tmp4544 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4545 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4507
%.tmp4546 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4545, i32 0, i32 3
%.tmp4547 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4546
%.tmp4548 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4544, %m1861$.Type.type* %.tmp4547)
%.tmp4549 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4507
%.tmp4550 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4549)
%.tmp4551 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4541, i8* %.tmp4543, i8* %.tmp4548, i8* %.tmp4550)
br label %.if.end.4528
.if.false.4528:
%.tmp4552 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4553 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4552, i32 0, i32 1
%.tmp4554 = load %m0$.File.type*, %m0$.File.type** %.tmp4553
%.tmp4556 = getelementptr [10 x i8], [10 x i8]*@.str4555, i32 0, i32 0
%.tmp4557 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4554, i8* %.tmp4556)
br label %.if.end.4528
.if.end.4528:
br label %.if.end.4516
.if.false.4516:
%.tmp4558 = load i8*, i8** %expr_type.4505
%.tmp4560 = getelementptr [3 x i8], [3 x i8]*@.str4559, i32 0, i32 0
%.tmp4561 = call i32(i8*,i8*) @strcmp(i8* %.tmp4558, i8* %.tmp4560)
%.tmp4562 = icmp eq i32 %.tmp4561, 0
br i1 %.tmp4562, label %.if.true.4563, label %.if.false.4563
.if.true.4563:
br label %.if.end.4563
.if.false.4563:
%.tmp4564 = load i8*, i8** %expr_type.4505
%.tmp4566 = getelementptr [8 x i8], [8 x i8]*@.str4565, i32 0, i32 0
%.tmp4567 = call i32(i8*,i8*) @strcmp(i8* %.tmp4564, i8* %.tmp4566)
%.tmp4568 = icmp eq i32 %.tmp4567, 0
br i1 %.tmp4568, label %.if.true.4569, label %.if.false.4569
.if.true.4569:
%.tmp4570 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4571 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4572 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4571, i32 0, i32 6
%.tmp4573 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4572
%.tmp4574 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4570, %m307$.Node.type* %.tmp4573)
br label %.if.end.4569
.if.false.4569:
%.tmp4575 = load i8*, i8** %expr_type.4505
%.tmp4577 = getelementptr [12 x i8], [12 x i8]*@.str4576, i32 0, i32 0
%.tmp4578 = call i32(i8*,i8*) @strcmp(i8* %.tmp4575, i8* %.tmp4577)
%.tmp4579 = icmp eq i32 %.tmp4578, 0
br i1 %.tmp4579, label %.if.true.4580, label %.if.false.4580
.if.true.4580:
%.tmp4581 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4582 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4583 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4581, %m307$.Node.type* %.tmp4582)
br label %.if.end.4580
.if.false.4580:
%.tmp4584 = load i8*, i8** %expr_type.4505
%.tmp4586 = getelementptr [11 x i8], [11 x i8]*@.str4585, i32 0, i32 0
%.tmp4587 = call i32(i8*,i8*) @strcmp(i8* %.tmp4584, i8* %.tmp4586)
%.tmp4588 = icmp eq i32 %.tmp4587, 0
br i1 %.tmp4588, label %.if.true.4589, label %.if.false.4589
.if.true.4589:
%.tmp4590 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4591 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4590, i32 0, i32 6
%.tmp4592 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4591
%.tmp4594 = getelementptr [11 x i8], [11 x i8]*@.str4593, i32 0, i32 0
%.tmp4595 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4592, i8* %.tmp4594)
store %m307$.Node.type* %.tmp4595, %m307$.Node.type** %assignable.4508
%.tmp4596 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4597 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4598 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4597, i32 0, i32 6
%.tmp4599 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4598
%.tmp4600 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4596, %m307$.Node.type* %.tmp4599)
%dest.4601 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4600, %m1861$.AssignableInfo.type** %dest.4601
%.tmp4602 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4601
%.tmp4603 = icmp eq %m1861$.AssignableInfo.type* %.tmp4602, null
br i1 %.tmp4603, label %.if.true.4604, label %.if.false.4604
.if.true.4604:
ret void
br label %.if.end.4604
.if.false.4604:
br label %.if.end.4604
.if.end.4604:
%.tmp4605 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4606 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4508
%.tmp4607 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4605, %m307$.Node.type* %.tmp4606)
store %m1861$.AssignableInfo.type* %.tmp4607, %m1861$.AssignableInfo.type** %a_info.4510
%.tmp4608 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4510
%.tmp4609 = icmp eq %m1861$.AssignableInfo.type* %.tmp4608, null
br i1 %.tmp4609, label %.if.true.4610, label %.if.false.4610
.if.true.4610:
ret void
br label %.if.end.4610
.if.false.4610:
br label %.if.end.4610
.if.end.4610:
%.tmp4611 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4612 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4601
%.tmp4613 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4612, i32 0, i32 3
%.tmp4614 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4613
%.tmp4615 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4611, %m1861$.Type.type* %.tmp4614)
%dest_tr.4616 = alloca i8*
store i8* %.tmp4615, i8** %dest_tr.4616
%.tmp4617 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4618 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4510
%.tmp4619 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4618, i32 0, i32 3
%.tmp4620 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4619
%.tmp4621 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4617, %m1861$.Type.type* %.tmp4620)
%src_tr.4622 = alloca i8*
store i8* %.tmp4621, i8** %src_tr.4622
%.tmp4623 = load i8*, i8** %src_tr.4622
%.tmp4625 = getelementptr [4 x i8], [4 x i8]*@.str4624, i32 0, i32 0
%.tmp4626 = call i32(i8*,i8*) @strcmp(i8* %.tmp4623, i8* %.tmp4625)
%.tmp4627 = icmp eq i32 %.tmp4626, 0
br i1 %.tmp4627, label %.if.true.4628, label %.if.false.4628
.if.true.4628:
%.tmp4629 = load i8*, i8** %dest_tr.4616
store i8* %.tmp4629, i8** %src_tr.4622
br label %.if.end.4628
.if.false.4628:
br label %.if.end.4628
.if.end.4628:
%.tmp4630 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4631 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4630, i32 0, i32 1
%.tmp4632 = load %m0$.File.type*, %m0$.File.type** %.tmp4631
%.tmp4634 = getelementptr [21 x i8], [21 x i8]*@.str4633, i32 0, i32 0
%.tmp4635 = load i8*, i8** %src_tr.4622
%.tmp4636 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4510
%.tmp4637 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4636)
%.tmp4638 = load i8*, i8** %dest_tr.4616
%.tmp4639 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4601
%.tmp4640 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4639)
%.tmp4641 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4632, i8* %.tmp4634, i8* %.tmp4635, i8* %.tmp4637, i8* %.tmp4638, i8* %.tmp4640)
br label %.if.end.4589
.if.false.4589:
%.tmp4642 = load i8*, i8** %expr_type.4505
%.tmp4644 = getelementptr [9 x i8], [9 x i8]*@.str4643, i32 0, i32 0
%.tmp4645 = call i32(i8*,i8*) @strcmp(i8* %.tmp4642, i8* %.tmp4644)
%.tmp4646 = icmp eq i32 %.tmp4645, 0
br i1 %.tmp4646, label %.if.true.4647, label %.if.false.4647
.if.true.4647:
%.tmp4648 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4649 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4648, %m307$.Node.type* %.tmp4649)
br label %.if.end.4647
.if.false.4647:
%.tmp4650 = load i8*, i8** %expr_type.4505
%.tmp4652 = getelementptr [9 x i8], [9 x i8]*@.str4651, i32 0, i32 0
%.tmp4653 = call i32(i8*,i8*) @strcmp(i8* %.tmp4650, i8* %.tmp4652)
%.tmp4654 = icmp eq i32 %.tmp4653, 0
br i1 %.tmp4654, label %.if.true.4655, label %.if.false.4655
.if.true.4655:
%.tmp4656 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4657 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4656, %m307$.Node.type* %.tmp4657)
br label %.if.end.4655
.if.false.4655:
%.tmp4658 = load i8*, i8** %expr_type.4505
%.tmp4660 = getelementptr [8 x i8], [8 x i8]*@.str4659, i32 0, i32 0
%.tmp4661 = call i32(i8*,i8*) @strcmp(i8* %.tmp4658, i8* %.tmp4660)
%.tmp4662 = icmp eq i32 %.tmp4661, 0
br i1 %.tmp4662, label %.if.true.4663, label %.if.false.4663
.if.true.4663:
%.tmp4664 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4665 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4664)
%mod.4666 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4665, %m1861$.ModuleLookup.type** %mod.4666
%found.4667 = alloca i1
store i1 0, i1* %found.4667
%.tmp4668 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4666
%.tmp4669 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4668, i32 0, i32 3
%.tmp4670 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4669
%s.4671 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4670, %m1861$.Scope.type** %s.4671
%.tmp4672 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4673 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4672, i32 0, i32 6
%.tmp4674 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4673
%.tmp4675 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4674, i32 0, i32 1
%.tmp4676 = load i8*, i8** %.tmp4675
%.tmp4678 = getelementptr [6 x i8], [6 x i8]*@.str4677, i32 0, i32 0
%.tmp4679 = call i32(i8*,i8*) @strcmp(i8* %.tmp4676, i8* %.tmp4678)
%.tmp4680 = icmp eq i32 %.tmp4679, 0
br i1 %.tmp4680, label %.if.true.4681, label %.if.false.4681
.if.true.4681:
br label %.for.start.4682
.for.start.4682:
%.tmp4683 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4684 = icmp ne %m1861$.Scope.type* %.tmp4683, null
%.tmp4685 = load i1, i1* %found.4667
%.tmp4686 = icmp eq i1 %.tmp4685, 0
%.tmp4687 = and i1 %.tmp4684, %.tmp4686
br i1 %.tmp4687, label %.for.continue.4682, label %.for.end.4682
.for.continue.4682:
%.tmp4688 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4689 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4688, i32 0, i32 2
%.tmp4690 = load i8*, i8** %.tmp4689
%.tmp4692 = getelementptr [4 x i8], [4 x i8]*@.str4691, i32 0, i32 0
%.tmp4693 = call i32(i8*,i8*) @strcmp(i8* %.tmp4690, i8* %.tmp4692)
%.tmp4694 = icmp eq i32 %.tmp4693, 0
br i1 %.tmp4694, label %.if.true.4695, label %.if.false.4695
.if.true.4695:
store i1 1, i1* %found.4667
%.tmp4696 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4697 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4696, i32 0, i32 1
%.tmp4698 = load %m0$.File.type*, %m0$.File.type** %.tmp4697
%.tmp4700 = getelementptr [15 x i8], [15 x i8]*@.str4699, i32 0, i32 0
%.tmp4701 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4702 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4701, i32 0, i32 4
%.tmp4703 = load i8*, i8** %.tmp4702
%.tmp4704 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4698, i8* %.tmp4700, i8* %.tmp4703)
br label %.if.end.4695
.if.false.4695:
br label %.if.end.4695
.if.end.4695:
%.tmp4705 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4706 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4705, i32 0, i32 5
%.tmp4707 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4706
store %m1861$.Scope.type* %.tmp4707, %m1861$.Scope.type** %s.4671
br label %.for.start.4682
.for.end.4682:
%.tmp4708 = load i1, i1* %found.4667
%.tmp4709 = icmp eq i1 %.tmp4708, 0
br i1 %.tmp4709, label %.if.true.4710, label %.if.false.4710
.if.true.4710:
%.tmp4711 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4712 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4714 = getelementptr [48 x i8], [48 x i8]*@.str4713, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4711, %m307$.Node.type* %.tmp4712, i8* %.tmp4714)
br label %.if.end.4710
.if.false.4710:
br label %.if.end.4710
.if.end.4710:
br label %.if.end.4681
.if.false.4681:
%.tmp4715 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4716 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4715, i32 0, i32 6
%.tmp4717 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4716
%.tmp4718 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4717, i32 0, i32 1
%.tmp4719 = load i8*, i8** %.tmp4718
%.tmp4721 = getelementptr [9 x i8], [9 x i8]*@.str4720, i32 0, i32 0
%.tmp4722 = call i32(i8*,i8*) @strcmp(i8* %.tmp4719, i8* %.tmp4721)
%.tmp4723 = icmp eq i32 %.tmp4722, 0
br i1 %.tmp4723, label %.if.true.4724, label %.if.false.4724
.if.true.4724:
br label %.for.start.4725
.for.start.4725:
%.tmp4726 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4727 = icmp ne %m1861$.Scope.type* %.tmp4726, null
%.tmp4728 = load i1, i1* %found.4667
%.tmp4729 = icmp eq i1 %.tmp4728, 0
%.tmp4730 = and i1 %.tmp4727, %.tmp4729
br i1 %.tmp4730, label %.for.continue.4725, label %.for.end.4725
.for.continue.4725:
%.tmp4731 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4732 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4731, i32 0, i32 2
%.tmp4733 = load i8*, i8** %.tmp4732
%.tmp4735 = getelementptr [4 x i8], [4 x i8]*@.str4734, i32 0, i32 0
%.tmp4736 = call i32(i8*,i8*) @strcmp(i8* %.tmp4733, i8* %.tmp4735)
%.tmp4737 = icmp eq i32 %.tmp4736, 0
br i1 %.tmp4737, label %.if.true.4738, label %.if.false.4738
.if.true.4738:
store i1 1, i1* %found.4667
%.tmp4739 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4740 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4739, i32 0, i32 1
%.tmp4741 = load %m0$.File.type*, %m0$.File.type** %.tmp4740
%.tmp4743 = getelementptr [15 x i8], [15 x i8]*@.str4742, i32 0, i32 0
%.tmp4744 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4745 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4744, i32 0, i32 3
%.tmp4746 = load i8*, i8** %.tmp4745
%.tmp4747 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4741, i8* %.tmp4743, i8* %.tmp4746)
br label %.if.end.4738
.if.false.4738:
br label %.if.end.4738
.if.end.4738:
%.tmp4748 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4671
%.tmp4749 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4748, i32 0, i32 5
%.tmp4750 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4749
store %m1861$.Scope.type* %.tmp4750, %m1861$.Scope.type** %s.4671
br label %.for.start.4725
.for.end.4725:
%.tmp4751 = load i1, i1* %found.4667
%.tmp4752 = icmp eq i1 %.tmp4751, 0
br i1 %.tmp4752, label %.if.true.4753, label %.if.false.4753
.if.true.4753:
%.tmp4754 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4755 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4757 = getelementptr [48 x i8], [48 x i8]*@.str4756, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4754, %m307$.Node.type* %.tmp4755, i8* %.tmp4757)
br label %.if.end.4753
.if.false.4753:
br label %.if.end.4753
.if.end.4753:
br label %.if.end.4724
.if.false.4724:
%.tmp4758 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4759 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4761 = getelementptr [29 x i8], [29 x i8]*@.str4760, i32 0, i32 0
%.tmp4762 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4758, %m307$.Node.type* %.tmp4759, i8* %.tmp4761)
%.tmp4763 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4764 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4763, i32 0, i32 6
%.tmp4765 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4764
%.tmp4766 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4765, i32 0, i32 1
%.tmp4767 = load i8*, i8** %.tmp4766
%.tmp4768 = call i32(i8*,...) @printf(i8* %.tmp4762, i8* %.tmp4767)
br label %.if.end.4724
.if.end.4724:
br label %.if.end.4681
.if.end.4681:
br label %.if.end.4663
.if.false.4663:
%.tmp4769 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4770 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4772 = getelementptr [34 x i8], [34 x i8]*@.str4771, i32 0, i32 0
%.tmp4773 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4769, %m307$.Node.type* %.tmp4770, i8* %.tmp4772)
%.tmp4774 = load i8*, i8** %expr_type.4505
%.tmp4775 = call i32(i8*,...) @printf(i8* %.tmp4773, i8* %.tmp4774)
br label %.if.end.4663
.if.end.4663:
br label %.if.end.4655
.if.end.4655:
br label %.if.end.4647
.if.end.4647:
br label %.if.end.4589
.if.end.4589:
br label %.if.end.4580
.if.end.4580:
br label %.if.end.4569
.if.end.4569:
br label %.if.end.4563
.if.end.4563:
br label %.if.end.4516
.if.end.4516:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4776 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4777 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4776)
%for_id.4778 = alloca i32
store i32 %.tmp4777, i32* %for_id.4778
%.tmp4779 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4780 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4779, i32 0, i32 6
%.tmp4781 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4780
%.tmp4782 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4781, i32 0, i32 7
%.tmp4783 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4782
%init_stmt.4784 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4783, %m307$.Node.type** %init_stmt.4784
%.tmp4785 = bitcast ptr null to i8*
%begin_lbl.4786 = alloca i8*
store i8* %.tmp4785, i8** %begin_lbl.4786
%.tmp4787 = bitcast ptr null to i8*
%end_lbl.4788 = alloca i8*
store i8* %.tmp4787, i8** %end_lbl.4788
%.tmp4789 = getelementptr i8*, i8** %begin_lbl.4786, i32 0
%.tmp4791 = getelementptr [14 x i8], [14 x i8]*@.str4790, i32 0, i32 0
%.tmp4792 = load i32, i32* %for_id.4778
%.tmp4793 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4789, i8* %.tmp4791, i32 %.tmp4792)
%.tmp4794 = getelementptr i8*, i8** %end_lbl.4788, i32 0
%.tmp4796 = getelementptr [12 x i8], [12 x i8]*@.str4795, i32 0, i32 0
%.tmp4797 = load i32, i32* %for_id.4778
%.tmp4798 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4794, i8* %.tmp4796, i32 %.tmp4797)
%.tmp4799 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4801 = getelementptr [4 x i8], [4 x i8]*@.str4800, i32 0, i32 0
%.tmp4802 = load i8*, i8** %begin_lbl.4786
%.tmp4803 = load i8*, i8** %end_lbl.4788
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp4799, i8* %.tmp4801, i8* %.tmp4802, i8* %.tmp4803)
%.tmp4804 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
%.tmp4805 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4804, i32 0, i32 0
%.tmp4806 = load i8*, i8** %.tmp4805
%.tmp4808 = getelementptr [12 x i8], [12 x i8]*@.str4807, i32 0, i32 0
%.tmp4809 = call i32(i8*,i8*) @strcmp(i8* %.tmp4806, i8* %.tmp4808)
%.tmp4810 = icmp eq i32 %.tmp4809, 0
br i1 %.tmp4810, label %.if.true.4811, label %.if.false.4811
.if.true.4811:
%.tmp4812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4813 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
%.tmp4814 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4812, %m307$.Node.type* %.tmp4813)
br label %.if.end.4811
.if.false.4811:
%.tmp4815 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
%.tmp4816 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4815, i32 0, i32 0
%.tmp4817 = load i8*, i8** %.tmp4816
%.tmp4819 = getelementptr [11 x i8], [11 x i8]*@.str4818, i32 0, i32 0
%.tmp4820 = call i32(i8*,i8*) @strcmp(i8* %.tmp4817, i8* %.tmp4819)
%.tmp4821 = icmp eq i32 %.tmp4820, 0
br i1 %.tmp4821, label %.if.true.4822, label %.if.false.4822
.if.true.4822:
%.tmp4823 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4824 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4823, %m307$.Node.type* %.tmp4824)
br label %.if.end.4822
.if.false.4822:
%.tmp4825 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
%.tmp4826 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4825, i32 0, i32 0
%.tmp4827 = load i8*, i8** %.tmp4826
%.tmp4829 = getelementptr [9 x i8], [9 x i8]*@.str4828, i32 0, i32 0
%.tmp4830 = call i32(i8*,i8*) @strcmp(i8* %.tmp4827, i8* %.tmp4829)
%.tmp4831 = icmp eq i32 %.tmp4830, 0
br i1 %.tmp4831, label %.if.true.4832, label %.if.false.4832
.if.true.4832:
br label %.if.end.4832
.if.false.4832:
%.tmp4833 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4834 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
%.tmp4836 = getelementptr [66 x i8], [66 x i8]*@.str4835, i32 0, i32 0
%.tmp4837 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4833, %m307$.Node.type* %.tmp4834, i8* %.tmp4836)
%.tmp4838 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4784
%.tmp4839 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4838, i32 0, i32 0
%.tmp4840 = load i8*, i8** %.tmp4839
%.tmp4841 = call i32(i8*,...) @printf(i8* %.tmp4837, i8* %.tmp4840)
%.tmp4842 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4842)
ret void
br label %.if.end.4832
.if.end.4832:
br label %.if.end.4822
.if.end.4822:
br label %.if.end.4811
.if.end.4811:
%.tmp4843 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4844 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4843, i32 0, i32 1
%.tmp4845 = load %m0$.File.type*, %m0$.File.type** %.tmp4844
%.tmp4847 = getelementptr [26 x i8], [26 x i8]*@.str4846, i32 0, i32 0
%.tmp4848 = load i32, i32* %for_id.4778
%.tmp4849 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4845, i8* %.tmp4847, i32 %.tmp4848)
%.tmp4850 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4851 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4850, i32 0, i32 1
%.tmp4852 = load %m0$.File.type*, %m0$.File.type** %.tmp4851
%.tmp4854 = getelementptr [16 x i8], [16 x i8]*@.str4853, i32 0, i32 0
%.tmp4855 = load i32, i32* %for_id.4778
%.tmp4856 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4852, i8* %.tmp4854, i32 %.tmp4855)
%.tmp4857 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4858 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4857, i32 0, i32 6
%.tmp4859 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4858
%.tmp4861 = getelementptr [9 x i8], [9 x i8]*@.str4860, i32 0, i32 0
%.tmp4862 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4859, i8* %.tmp4861)
%fst_colon.4863 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4862, %m307$.Node.type** %fst_colon.4863
%.tmp4864 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4863
%.tmp4865 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4864, i32 0, i32 7
%.tmp4866 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4865
%condition.4867 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4866, %m307$.Node.type** %condition.4867
%.tmp4868 = load %m307$.Node.type*, %m307$.Node.type** %condition.4867
%.tmp4869 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4868, i32 0, i32 0
%.tmp4870 = load i8*, i8** %.tmp4869
%.tmp4872 = getelementptr [9 x i8], [9 x i8]*@.str4871, i32 0, i32 0
%.tmp4873 = call i32(i8*,i8*) @strcmp(i8* %.tmp4870, i8* %.tmp4872)
%.tmp4874 = icmp eq i32 %.tmp4873, 0
br i1 %.tmp4874, label %.if.true.4875, label %.if.false.4875
.if.true.4875:
%.tmp4876 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4877 = load %m307$.Node.type*, %m307$.Node.type** %condition.4867
%.tmp4879 = getelementptr [39 x i8], [39 x i8]*@.str4878, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4876, %m307$.Node.type* %.tmp4877, i8* %.tmp4879)
ret void
br label %.if.end.4875
.if.false.4875:
br label %.if.end.4875
.if.end.4875:
%.tmp4880 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4881 = load %m307$.Node.type*, %m307$.Node.type** %condition.4867
%.tmp4882 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4880, %m307$.Node.type* %.tmp4881)
%condition_info.4883 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4882, %m1861$.AssignableInfo.type** %condition_info.4883
%.tmp4884 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4863
%.tmp4885 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4884, i32 0, i32 7
%.tmp4886 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4885
%.tmp4888 = getelementptr [9 x i8], [9 x i8]*@.str4887, i32 0, i32 0
%.tmp4889 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4886, i8* %.tmp4888)
%snd_colon.4890 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4889, %m307$.Node.type** %snd_colon.4890
%.tmp4891 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4890
%.tmp4893 = getelementptr [6 x i8], [6 x i8]*@.str4892, i32 0, i32 0
%.tmp4894 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4891, i8* %.tmp4893)
%for_body.4895 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4894, %m307$.Node.type** %for_body.4895
%.tmp4896 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4895
%.tmp4898 = getelementptr [11 x i8], [11 x i8]*@.str4897, i32 0, i32 0
%.tmp4899 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4896, i8* %.tmp4898)
%else_block.4900 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4899, %m307$.Node.type** %else_block.4900
%.tmp4901 = load i8*, i8** %end_lbl.4788
%on_end.4902 = alloca i8*
store i8* %.tmp4901, i8** %on_end.4902
%.tmp4903 = load %m307$.Node.type*, %m307$.Node.type** %else_block.4900
%.tmp4904 = icmp ne %m307$.Node.type* %.tmp4903, null
br i1 %.tmp4904, label %.if.true.4905, label %.if.false.4905
.if.true.4905:
%.tmp4906 = getelementptr i8*, i8** %on_end.4902, i32 0
%.tmp4908 = getelementptr [13 x i8], [13 x i8]*@.str4907, i32 0, i32 0
%.tmp4909 = load i32, i32* %for_id.4778
%.tmp4910 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4906, i8* %.tmp4908, i32 %.tmp4909)
br label %.if.end.4905
.if.false.4905:
br label %.if.end.4905
.if.end.4905:
%.tmp4911 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4912 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4911, i32 0, i32 1
%.tmp4913 = load %m0$.File.type*, %m0$.File.type** %.tmp4912
%.tmp4915 = getelementptr [48 x i8], [48 x i8]*@.str4914, i32 0, i32 0
%.tmp4916 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4917 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4883
%.tmp4918 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4917, i32 0, i32 3
%.tmp4919 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4918
%.tmp4920 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4916, %m1861$.Type.type* %.tmp4919)
%.tmp4921 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4883
%.tmp4922 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4921)
%.tmp4923 = load i32, i32* %for_id.4778
%.tmp4924 = load i8*, i8** %on_end.4902
%.tmp4925 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4913, i8* %.tmp4915, i8* %.tmp4920, i8* %.tmp4922, i32 %.tmp4923, i8* %.tmp4924)
%.tmp4926 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4927 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4926, i32 0, i32 1
%.tmp4928 = load %m0$.File.type*, %m0$.File.type** %.tmp4927
%.tmp4930 = getelementptr [19 x i8], [19 x i8]*@.str4929, i32 0, i32 0
%.tmp4931 = load i32, i32* %for_id.4778
%.tmp4932 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4928, i8* %.tmp4930, i32 %.tmp4931)
%.tmp4933 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4890
%.tmp4934 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4933, i32 0, i32 7
%.tmp4935 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4934
%increment.4936 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4935, %m307$.Node.type** %increment.4936
%.tmp4937 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4938 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4895
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4937, %m307$.Node.type* %.tmp4938)
%.tmp4939 = load %m307$.Node.type*, %m307$.Node.type** %increment.4936
%.tmp4940 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4895
%.tmp4941 = icmp ne %m307$.Node.type* %.tmp4939, %.tmp4940
br i1 %.tmp4941, label %.if.true.4942, label %.if.false.4942
.if.true.4942:
%.tmp4943 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4944 = load %m307$.Node.type*, %m307$.Node.type** %increment.4936
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4943, %m307$.Node.type* %.tmp4944)
br label %.if.end.4942
.if.false.4942:
br label %.if.end.4942
.if.end.4942:
%.tmp4945 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4946 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4945, i32 0, i32 1
%.tmp4947 = load %m0$.File.type*, %m0$.File.type** %.tmp4946
%.tmp4949 = getelementptr [15 x i8], [15 x i8]*@.str4948, i32 0, i32 0
%.tmp4950 = load i8*, i8** %begin_lbl.4786
%.tmp4951 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4947, i8* %.tmp4949, i8* %.tmp4950)
%.tmp4952 = load %m307$.Node.type*, %m307$.Node.type** %else_block.4900
%.tmp4953 = icmp ne %m307$.Node.type* %.tmp4952, null
br i1 %.tmp4953, label %.if.true.4954, label %.if.false.4954
.if.true.4954:
%.tmp4955 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4956 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4955, i32 0, i32 1
%.tmp4957 = load %m0$.File.type*, %m0$.File.type** %.tmp4956
%.tmp4959 = getelementptr [15 x i8], [15 x i8]*@.str4958, i32 0, i32 0
%.tmp4960 = load i32, i32* %for_id.4778
%.tmp4961 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4957, i8* %.tmp4959, i32 %.tmp4960)
%.tmp4962 = load %m307$.Node.type*, %m307$.Node.type** %else_block.4900
%.tmp4963 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4962, i32 0, i32 6
%.tmp4964 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4963
%.tmp4966 = getelementptr [6 x i8], [6 x i8]*@.str4965, i32 0, i32 0
%.tmp4967 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4964, i8* %.tmp4966)
%block.4968 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4967, %m307$.Node.type** %block.4968
%.tmp4969 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4970 = load %m307$.Node.type*, %m307$.Node.type** %block.4968
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4969, %m307$.Node.type* %.tmp4970)
%.tmp4971 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4972 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4971, i32 0, i32 1
%.tmp4973 = load %m0$.File.type*, %m0$.File.type** %.tmp4972
%.tmp4975 = getelementptr [15 x i8], [15 x i8]*@.str4974, i32 0, i32 0
%.tmp4976 = load i8*, i8** %end_lbl.4788
%.tmp4977 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4973, i8* %.tmp4975, i8* %.tmp4976)
br label %.if.end.4954
.if.false.4954:
br label %.if.end.4954
.if.end.4954:
%.tmp4978 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4979 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4978, i32 0, i32 1
%.tmp4980 = load %m0$.File.type*, %m0$.File.type** %.tmp4979
%.tmp4982 = getelementptr [5 x i8], [5 x i8]*@.str4981, i32 0, i32 0
%.tmp4983 = load i8*, i8** %end_lbl.4788
%.tmp4984 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4980, i8* %.tmp4982, i8* %.tmp4983)
%.tmp4985 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4985)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4986 = bitcast ptr null to %m1861$.Type.type*
%decl_type.4987 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4986, %m1861$.Type.type** %decl_type.4987
%.tmp4988 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4989 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4988, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp4990 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4991 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4990, i32 0, i32 6
%.tmp4992 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4991
%.tmp4993 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4992, i32 0, i32 0
%.tmp4994 = load i8*, i8** %.tmp4993
%.tmp4996 = getelementptr [5 x i8], [5 x i8]*@.str4995, i32 0, i32 0
%.tmp4997 = call i32(i8*,i8*) @strcmp(i8* %.tmp4994, i8* %.tmp4996)
%.tmp4998 = icmp eq i32 %.tmp4997, 0
br i1 %.tmp4998, label %.if.true.4999, label %.if.false.4999
.if.true.4999:
%.tmp5000 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5001 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5002 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5001, i32 0, i32 6
%.tmp5003 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5002
%.tmp5004 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5003, i32 0, i32 6
%.tmp5005 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5004
%.tmp5006 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5000, %m307$.Node.type* %.tmp5005)
store %m1861$.Type.type* %.tmp5006, %m1861$.Type.type** %decl_type.4987
br label %.if.end.4999
.if.false.4999:
br label %.if.end.4999
.if.end.4999:
%.tmp5007 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5008 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5007, i32 0, i32 6
%.tmp5009 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5008
%.tmp5011 = getelementptr [11 x i8], [11 x i8]*@.str5010, i32 0, i32 0
%.tmp5012 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5009, i8* %.tmp5011)
%assignable.5013 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5012, %m307$.Node.type** %assignable.5013
%.tmp5014 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5013
%.tmp5015 = icmp ne %m307$.Node.type* %.tmp5014, null
br i1 %.tmp5015, label %.if.true.5016, label %.if.false.5016
.if.true.5016:
%.tmp5017 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5018 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5013
%.tmp5019 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5017, %m307$.Node.type* %.tmp5018)
store %m1861$.AssignableInfo.type* %.tmp5019, %m1861$.AssignableInfo.type** %a_info.4989
br label %.if.end.5016
.if.false.5016:
br label %.if.end.5016
.if.end.5016:
%.tmp5020 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5021 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5020)
%info.5022 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5021, %m1861$.AssignableInfo.type** %info.5022
%.tmp5023 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5024 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5023, i32 0, i32 2
%.tmp5026 = getelementptr [9 x i8], [9 x i8]*@.str5025, i32 0, i32 0
store i8* %.tmp5026, i8** %.tmp5024
%.tmp5027 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5028 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5027, i32 0, i32 6
%.tmp5029 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5028
%.tmp5031 = getelementptr [5 x i8], [5 x i8]*@.str5030, i32 0, i32 0
%.tmp5032 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5029, i8* %.tmp5031)
%var_name.5033 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5032, %m307$.Node.type** %var_name.5033
%.tmp5034 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5033
%.tmp5035 = icmp eq %m307$.Node.type* %.tmp5034, null
br i1 %.tmp5035, label %.if.true.5036, label %.if.false.5036
.if.true.5036:
%.tmp5037 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5038 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5040 = getelementptr [31 x i8], [31 x i8]*@.str5039, i32 0, i32 0
%.tmp5041 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5037, %m307$.Node.type* %.tmp5038, i8* %.tmp5040)
%.tmp5042 = call i32(i8*,...) @printf(i8* %.tmp5041)
%.tmp5043 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5043
br label %.if.end.5036
.if.false.5036:
br label %.if.end.5036
.if.end.5036:
%.tmp5044 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5045 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5044)
%mod.5046 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5045, %m1861$.ModuleLookup.type** %mod.5046
%.tmp5047 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5048 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5046
%.tmp5049 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5048, i32 0, i32 3
%.tmp5050 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5049
%.tmp5051 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5033
%.tmp5052 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5051, i32 0, i32 1
%.tmp5053 = load i8*, i8** %.tmp5052
%.tmp5054 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5047, %m1861$.Scope.type* %.tmp5050, i8* %.tmp5053)
%.tmp5055 = icmp ne %m1861$.ScopeItem.type* %.tmp5054, null
br i1 %.tmp5055, label %.if.true.5056, label %.if.false.5056
.if.true.5056:
%err_buf.5057 = alloca i8*
store i8* null, i8** %err_buf.5057
%.tmp5058 = getelementptr i8*, i8** %err_buf.5057, i32 0
%.tmp5060 = getelementptr [43 x i8], [43 x i8]*@.str5059, i32 0, i32 0
%.tmp5061 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5033
%.tmp5062 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5061, i32 0, i32 1
%.tmp5063 = load i8*, i8** %.tmp5062
%.tmp5064 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5058, i8* %.tmp5060, i8* %.tmp5063)
%.tmp5065 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5066 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5067 = load i8*, i8** %err_buf.5057
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5065, %m307$.Node.type* %.tmp5066, i8* %.tmp5067)
%.tmp5068 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5068
br label %.if.end.5056
.if.false.5056:
br label %.if.end.5056
.if.end.5056:
%var_id.5069 = alloca i8*
store i8* null, i8** %var_id.5069
%.tmp5070 = getelementptr i8*, i8** %var_id.5069, i32 0
%.tmp5072 = getelementptr [6 x i8], [6 x i8]*@.str5071, i32 0, i32 0
%.tmp5073 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5033
%.tmp5074 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5073, i32 0, i32 1
%.tmp5075 = load i8*, i8** %.tmp5074
%.tmp5076 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5077 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5076)
%.tmp5078 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5070, i8* %.tmp5072, i8* %.tmp5075, i32 %.tmp5077)
%.tmp5079 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5080 = load i8, i8* @SCOPE_LOCAL
%.tmp5081 = load i8*, i8** %var_id.5069
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5079, i8 %.tmp5080, i8* %.tmp5081)
%.tmp5082 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4987
%.tmp5083 = icmp ne %m1861$.Type.type* %.tmp5082, null
br i1 %.tmp5083, label %.if.true.5084, label %.if.false.5084
.if.true.5084:
%.tmp5085 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5086 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5085, i32 0, i32 3
%.tmp5087 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4987
store %m1861$.Type.type* %.tmp5087, %m1861$.Type.type** %.tmp5086
br label %.if.end.5084
.if.false.5084:
%.tmp5088 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5089 = icmp ne %m1861$.AssignableInfo.type* %.tmp5088, null
br i1 %.tmp5089, label %.if.true.5090, label %.if.false.5090
.if.true.5090:
%.tmp5091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5092 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5091, i32 0, i32 3
%.tmp5093 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5094 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5093, i32 0, i32 3
%.tmp5095 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5094
store %m1861$.Type.type* %.tmp5095, %m1861$.Type.type** %.tmp5092
br label %.if.end.5090
.if.false.5090:
br label %.if.end.5090
.if.end.5090:
br label %.if.end.5084
.if.end.5084:
%.tmp5096 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5097 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5098 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5097, i32 0, i32 3
%.tmp5099 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5098
%.tmp5100 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5096, %m1861$.Type.type* %.tmp5099)
%var_type_repr.5101 = alloca i8*
store i8* %.tmp5100, i8** %var_type_repr.5101
%.tmp5102 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5103 = icmp ne %m1861$.AssignableInfo.type* %.tmp5102, null
br i1 %.tmp5103, label %.if.true.5104, label %.if.false.5104
.if.true.5104:
%.tmp5105 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5106 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5107 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5106, i32 0, i32 3
%.tmp5108 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5107
%.tmp5109 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5105, %m1861$.Type.type* %.tmp5108)
%a_type_repr.5110 = alloca i8*
store i8* %.tmp5109, i8** %a_type_repr.5110
%type_error.5111 = alloca i1
store i1 0, i1* %type_error.5111
%.tmp5112 = load i8*, i8** %a_type_repr.5110
%.tmp5113 = call i32(i8*) @strlen(i8* %.tmp5112)
%.tmp5114 = load i8*, i8** %var_type_repr.5101
%.tmp5115 = call i32(i8*) @strlen(i8* %.tmp5114)
%.tmp5116 = icmp ne i32 %.tmp5113, %.tmp5115
br i1 %.tmp5116, label %.if.true.5117, label %.if.false.5117
.if.true.5117:
store i1 1, i1* %type_error.5111
br label %.if.end.5117
.if.false.5117:
%.tmp5118 = load i8*, i8** %a_type_repr.5110
%.tmp5119 = load i8*, i8** %var_type_repr.5101
%.tmp5120 = call i32(i8*,i8*) @strcmp(i8* %.tmp5118, i8* %.tmp5119)
%.tmp5121 = icmp ne i32 %.tmp5120, 0
br i1 %.tmp5121, label %.if.true.5122, label %.if.false.5122
.if.true.5122:
store i1 1, i1* %type_error.5111
br label %.if.end.5122
.if.false.5122:
br label %.if.end.5122
.if.end.5122:
br label %.if.end.5117
.if.end.5117:
%.tmp5123 = load i1, i1* %type_error.5111
br i1 %.tmp5123, label %.if.true.5124, label %.if.false.5124
.if.true.5124:
%.tmp5125 = bitcast ptr null to i8*
%err_msg.5126 = alloca i8*
store i8* %.tmp5125, i8** %err_msg.5126
%.tmp5127 = getelementptr i8*, i8** %err_msg.5126, i32 0
%.tmp5129 = getelementptr [49 x i8], [49 x i8]*@.str5128, i32 0, i32 0
%.tmp5130 = load i8*, i8** %a_type_repr.5110
%.tmp5131 = load i8*, i8** %var_type_repr.5101
%.tmp5132 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5127, i8* %.tmp5129, i8* %.tmp5130, i8* %.tmp5131)
%.tmp5133 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5134 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5135 = load i8*, i8** %err_msg.5126
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5133, %m307$.Node.type* %.tmp5134, i8* %.tmp5135)
br label %.if.end.5124
.if.false.5124:
br label %.if.end.5124
.if.end.5124:
br label %.if.end.5104
.if.false.5104:
br label %.if.end.5104
.if.end.5104:
%.tmp5136 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5137 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5033
%.tmp5138 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5137, i32 0, i32 1
%.tmp5139 = load i8*, i8** %.tmp5138
%.tmp5140 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5136, i8* %.tmp5139, %m1861$.AssignableInfo.type* %.tmp5140)
%.tmp5141 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5142 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5141, i32 0, i32 1
%.tmp5143 = load %m0$.File.type*, %m0$.File.type** %.tmp5142
%.tmp5145 = getelementptr [16 x i8], [16 x i8]*@.str5144, i32 0, i32 0
%.tmp5146 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5147 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5146)
%.tmp5148 = load i8*, i8** %var_type_repr.5101
%.tmp5149 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5143, i8* %.tmp5145, i8* %.tmp5147, i8* %.tmp5148)
%.tmp5150 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5151 = icmp ne %m1861$.AssignableInfo.type* %.tmp5150, null
br i1 %.tmp5151, label %.if.true.5152, label %.if.false.5152
.if.true.5152:
%.tmp5153 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5154 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5153, i32 0, i32 1
%.tmp5155 = load %m0$.File.type*, %m0$.File.type** %.tmp5154
%.tmp5157 = getelementptr [21 x i8], [21 x i8]*@.str5156, i32 0, i32 0
%.tmp5158 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5159 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5160 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5159, i32 0, i32 3
%.tmp5161 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5160
%.tmp5162 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5158, %m1861$.Type.type* %.tmp5161)
%.tmp5163 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4989
%.tmp5164 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5163)
%.tmp5165 = load i8*, i8** %var_type_repr.5101
%.tmp5166 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
%.tmp5167 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5166)
%.tmp5168 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5155, i8* %.tmp5157, i8* %.tmp5162, i8* %.tmp5164, i8* %.tmp5165, i8* %.tmp5167)
br label %.if.end.5152
.if.false.5152:
%.tmp5169 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5170 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5171 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5169, %m307$.Node.type* %.tmp5170, %m1861$.AssignableInfo.type* %.tmp5171)
br label %.if.end.5152
.if.end.5152:
%.tmp5172 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5022
ret %m1861$.AssignableInfo.type* %.tmp5172
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5173 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5174 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5173, i32 0, i32 3
%.tmp5175 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5174
%.tmp5176 = icmp eq %m1861$.Type.type* %.tmp5175, null
br i1 %.tmp5176, label %.if.true.5177, label %.if.false.5177
.if.true.5177:
ret void
br label %.if.end.5177
.if.false.5177:
br label %.if.end.5177
.if.end.5177:
%.tmp5178 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5179 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5180 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5179, i32 0, i32 3
%.tmp5181 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5180
%.tmp5182 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5178, %m1861$.Type.type* %.tmp5181)
%t_repr.5183 = alloca i8*
store i8* %.tmp5182, i8** %t_repr.5183
%.tmp5184 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5185 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5184)
%id.5186 = alloca i8*
store i8* %.tmp5185, i8** %id.5186
%field_id.5187 = alloca i32
store i32 0, i32* %field_id.5187
%field.5188 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5188
%field_info.5189 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5190 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5191 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5190, i32 0, i32 3
%.tmp5192 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5191
%t.5193 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5192, %m1861$.Type.type** %t.5193
%.tmp5194 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5195 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5194, i32 0, i32 0
%.tmp5196 = load i8*, i8** %.tmp5195
%.tmp5198 = getelementptr [4 x i8], [4 x i8]*@.str5197, i32 0, i32 0
%.tmp5199 = call i32(i8*,i8*) @strcmp(i8* %.tmp5196, i8* %.tmp5198)
%.tmp5200 = icmp eq i32 %.tmp5199, 0
%.tmp5201 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5202 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5201, i32 0, i32 0
%.tmp5203 = load i8*, i8** %.tmp5202
%.tmp5205 = getelementptr [4 x i8], [4 x i8]*@.str5204, i32 0, i32 0
%.tmp5206 = call i32(i8*,i8*) @strcmp(i8* %.tmp5203, i8* %.tmp5205)
%.tmp5207 = icmp eq i32 %.tmp5206, 0
%.tmp5208 = or i1 %.tmp5200, %.tmp5207
%.tmp5209 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5210 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5209, i32 0, i32 0
%.tmp5211 = load i8*, i8** %.tmp5210
%.tmp5213 = getelementptr [5 x i8], [5 x i8]*@.str5212, i32 0, i32 0
%.tmp5214 = call i32(i8*,i8*) @strcmp(i8* %.tmp5211, i8* %.tmp5213)
%.tmp5215 = icmp eq i32 %.tmp5214, 0
%.tmp5216 = or i1 %.tmp5208, %.tmp5215
br i1 %.tmp5216, label %.if.true.5217, label %.if.false.5217
.if.true.5217:
%.tmp5218 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5219 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5218, i32 0, i32 1
%.tmp5220 = load %m0$.File.type*, %m0$.File.type** %.tmp5219
%.tmp5222 = getelementptr [21 x i8], [21 x i8]*@.str5221, i32 0, i32 0
%.tmp5223 = load i8*, i8** %t_repr.5183
%.tmp5224 = load i8*, i8** %t_repr.5183
%.tmp5225 = load i8*, i8** %id.5186
%.tmp5226 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5220, i8* %.tmp5222, i8* %.tmp5223, i32 0, i8* %.tmp5224, i8* %.tmp5225)
br label %.if.end.5217
.if.false.5217:
%.tmp5227 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5228 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5227, i32 0, i32 0
%.tmp5229 = load i8*, i8** %.tmp5228
%.tmp5231 = getelementptr [4 x i8], [4 x i8]*@.str5230, i32 0, i32 0
%.tmp5232 = call i32(i8*,i8*) @strcmp(i8* %.tmp5229, i8* %.tmp5231)
%.tmp5233 = icmp eq i32 %.tmp5232, 0
br i1 %.tmp5233, label %.if.true.5234, label %.if.false.5234
.if.true.5234:
%.tmp5235 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5236 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5235, i32 0, i32 1
%.tmp5237 = load %m0$.File.type*, %m0$.File.type** %.tmp5236
%.tmp5239 = getelementptr [21 x i8], [21 x i8]*@.str5238, i32 0, i32 0
%.tmp5240 = load i8*, i8** %t_repr.5183
%.tmp5242 = getelementptr [5 x i8], [5 x i8]*@.str5241, i32 0, i32 0
%.tmp5243 = load i8*, i8** %t_repr.5183
%.tmp5244 = load i8*, i8** %id.5186
%.tmp5245 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5237, i8* %.tmp5239, i8* %.tmp5240, i8* %.tmp5242, i8* %.tmp5243, i8* %.tmp5244)
br label %.if.end.5234
.if.false.5234:
%.tmp5246 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5247 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5246, i32 0, i32 0
%.tmp5248 = load i8*, i8** %.tmp5247
%.tmp5250 = getelementptr [7 x i8], [7 x i8]*@.str5249, i32 0, i32 0
%.tmp5251 = call i32(i8*,i8*) @strcmp(i8* %.tmp5248, i8* %.tmp5250)
%.tmp5252 = icmp eq i32 %.tmp5251, 0
br i1 %.tmp5252, label %.if.true.5253, label %.if.false.5253
.if.true.5253:
%.tmp5255 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5256 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5255, i32 0, i32 3
%.tmp5257 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5256
store %m1861$.Type.type* %.tmp5257, %m1861$.Type.type** %field.5188
br label %.for.start.5254
.for.start.5254:
%.tmp5258 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5188
%.tmp5259 = icmp ne %m1861$.Type.type* %.tmp5258, null
br i1 %.tmp5259, label %.for.continue.5254, label %.for.end.5254
.for.continue.5254:
%.tmp5260 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5261 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5260)
store %m1861$.AssignableInfo.type* %.tmp5261, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5262 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5263 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5262, %m1861$.AssignableInfo.type* %.tmp5263)
%.tmp5264 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5265 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5264, i32 0, i32 3
%.tmp5266 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5188
store %m1861$.Type.type* %.tmp5266, %m1861$.Type.type** %.tmp5265
%.tmp5267 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5268 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5267, i32 0, i32 1
%.tmp5269 = load %m0$.File.type*, %m0$.File.type** %.tmp5268
%.tmp5271 = getelementptr [46 x i8], [46 x i8]*@.str5270, i32 0, i32 0
%.tmp5272 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5273 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5272)
%.tmp5274 = load i8*, i8** %t_repr.5183
%.tmp5275 = load i8*, i8** %t_repr.5183
%.tmp5276 = load i8*, i8** %id.5186
%.tmp5277 = load i32, i32* %field_id.5187
%.tmp5278 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5269, i8* %.tmp5271, i8* %.tmp5273, i8* %.tmp5274, i8* %.tmp5275, i8* %.tmp5276, i32 %.tmp5277)
%.tmp5279 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5280 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5281 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5279, %m307$.Node.type* %.tmp5280, %m1861$.AssignableInfo.type* %.tmp5281)
%.tmp5282 = load i32, i32* %field_id.5187
%.tmp5283 = add i32 %.tmp5282, 1
store i32 %.tmp5283, i32* %field_id.5187
%.tmp5284 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5188
%.tmp5285 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5284, i32 0, i32 4
%.tmp5286 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5285
store %m1861$.Type.type* %.tmp5286, %m1861$.Type.type** %field.5188
br label %.for.start.5254
.for.end.5254:
br label %.if.end.5253
.if.false.5253:
%.tmp5287 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5288 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5287, i32 0, i32 0
%.tmp5289 = load i8*, i8** %.tmp5288
%.tmp5291 = getelementptr [10 x i8], [10 x i8]*@.str5290, i32 0, i32 0
%.tmp5292 = call i32(i8*,i8*) @strcmp(i8* %.tmp5289, i8* %.tmp5291)
%.tmp5293 = icmp eq i32 %.tmp5292, 0
br i1 %.tmp5293, label %.if.true.5294, label %.if.false.5294
.if.true.5294:
%.tmp5296 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5193
%.tmp5297 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5296, i32 0, i32 3
%.tmp5298 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5297
%.tmp5299 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5298, i32 0, i32 3
%.tmp5300 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5299
store %m1861$.Type.type* %.tmp5300, %m1861$.Type.type** %field.5188
br label %.for.start.5295
.for.start.5295:
%.tmp5301 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5188
%.tmp5302 = icmp ne %m1861$.Type.type* %.tmp5301, null
br i1 %.tmp5302, label %.for.continue.5295, label %.for.end.5295
.for.continue.5295:
%.tmp5303 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5304 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5303)
store %m1861$.AssignableInfo.type* %.tmp5304, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5305 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5305, %m1861$.AssignableInfo.type* %.tmp5306)
%.tmp5307 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5308 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5307, i32 0, i32 3
%.tmp5309 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5188
store %m1861$.Type.type* %.tmp5309, %m1861$.Type.type** %.tmp5308
%.tmp5310 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5311 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5310, i32 0, i32 1
%.tmp5312 = load %m0$.File.type*, %m0$.File.type** %.tmp5311
%.tmp5314 = getelementptr [46 x i8], [46 x i8]*@.str5313, i32 0, i32 0
%.tmp5315 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
%.tmp5316 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5315)
%.tmp5317 = load i8*, i8** %t_repr.5183
%.tmp5318 = load i8*, i8** %t_repr.5183
%.tmp5319 = load i8*, i8** %id.5186
%.tmp5320 = load i32, i32* %field_id.5187
%.tmp5321 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5312, i8* %.tmp5314, i8* %.tmp5316, i8* %.tmp5317, i8* %.tmp5318, i8* %.tmp5319, i32 %.tmp5320)
%.tmp5322 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5323 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5324 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5189
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5322, %m307$.Node.type* %.tmp5323, %m1861$.AssignableInfo.type* %.tmp5324)
%.tmp5325 = load i32, i32* %field_id.5187
%.tmp5326 = add i32 %.tmp5325, 1
store i32 %.tmp5326, i32* %field_id.5187
%.tmp5327 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5188
%.tmp5328 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5327, i32 0, i32 4
%.tmp5329 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5328
store %m1861$.Type.type* %.tmp5329, %m1861$.Type.type** %field.5188
br label %.for.start.5295
.for.end.5295:
br label %.if.end.5294
.if.false.5294:
%.tmp5330 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5331 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5333 = getelementptr [44 x i8], [44 x i8]*@.str5332, i32 0, i32 0
%.tmp5334 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5330, %m307$.Node.type* %.tmp5331, i8* %.tmp5333)
%.tmp5335 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5336 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5335, i32 0, i32 3
%.tmp5337 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5336
%.tmp5338 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5337, i32 0, i32 0
%.tmp5339 = load i8*, i8** %.tmp5338
%.tmp5340 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5341 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5342 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5341, i32 0, i32 3
%.tmp5343 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5342
%.tmp5344 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5340, %m1861$.Type.type* %.tmp5343)
%.tmp5345 = call i32(i8*,...) @printf(i8* %.tmp5334, i8* %.tmp5339, i8* %.tmp5344)
ret void
br label %.if.end.5294
.if.end.5294:
br label %.if.end.5253
.if.end.5253:
br label %.if.end.5234
.if.end.5234:
br label %.if.end.5217
.if.end.5217:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5346 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5347 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5346, i32 0, i32 6
%.tmp5348 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5347
%.tmp5350 = getelementptr [11 x i8], [11 x i8]*@.str5349, i32 0, i32 0
%.tmp5351 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5348, i8* %.tmp5350)
%assignable.5352 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5351, %m307$.Node.type** %assignable.5352
%.tmp5353 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5354 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5352
%.tmp5355 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5353, %m307$.Node.type* %.tmp5354)
%a_info.5356 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5355, %m1861$.AssignableInfo.type** %a_info.5356
%.tmp5357 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5356
%.tmp5358 = icmp eq %m1861$.AssignableInfo.type* %.tmp5357, null
br i1 %.tmp5358, label %.if.true.5359, label %.if.false.5359
.if.true.5359:
ret void
br label %.if.end.5359
.if.false.5359:
br label %.if.end.5359
.if.end.5359:
%.tmp5360 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5361 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5360)
%if_id.5362 = alloca i32
store i32 %.tmp5361, i32* %if_id.5362
%.tmp5363 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5364 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5363, i32 0, i32 1
%.tmp5365 = load %m0$.File.type*, %m0$.File.type** %.tmp5364
%.tmp5367 = getelementptr [53 x i8], [53 x i8]*@.str5366, i32 0, i32 0
%.tmp5368 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5369 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5356
%.tmp5370 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5369, i32 0, i32 3
%.tmp5371 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5370
%.tmp5372 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5368, %m1861$.Type.type* %.tmp5371)
%.tmp5373 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5356
%.tmp5374 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5373)
%.tmp5375 = load i32, i32* %if_id.5362
%.tmp5376 = load i32, i32* %if_id.5362
%.tmp5377 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5365, i8* %.tmp5367, i8* %.tmp5372, i8* %.tmp5374, i32 %.tmp5375, i32 %.tmp5376)
%.tmp5378 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5379 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5378, i32 0, i32 1
%.tmp5380 = load %m0$.File.type*, %m0$.File.type** %.tmp5379
%.tmp5382 = getelementptr [14 x i8], [14 x i8]*@.str5381, i32 0, i32 0
%.tmp5383 = load i32, i32* %if_id.5362
%.tmp5384 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5380, i8* %.tmp5382, i32 %.tmp5383)
%.tmp5385 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5386 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5385, i32 0, i32 6
%.tmp5387 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5386
%.tmp5389 = getelementptr [6 x i8], [6 x i8]*@.str5388, i32 0, i32 0
%.tmp5390 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5387, i8* %.tmp5389)
%block.5391 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5390, %m307$.Node.type** %block.5391
%.tmp5392 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5393 = load %m307$.Node.type*, %m307$.Node.type** %block.5391
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5392, %m307$.Node.type* %.tmp5393)
%.tmp5394 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5395 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5394, i32 0, i32 1
%.tmp5396 = load %m0$.File.type*, %m0$.File.type** %.tmp5395
%.tmp5398 = getelementptr [23 x i8], [23 x i8]*@.str5397, i32 0, i32 0
%.tmp5399 = load i32, i32* %if_id.5362
%.tmp5400 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5396, i8* %.tmp5398, i32 %.tmp5399)
%.tmp5401 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5402 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5401, i32 0, i32 1
%.tmp5403 = load %m0$.File.type*, %m0$.File.type** %.tmp5402
%.tmp5405 = getelementptr [15 x i8], [15 x i8]*@.str5404, i32 0, i32 0
%.tmp5406 = load i32, i32* %if_id.5362
%.tmp5407 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5403, i8* %.tmp5405, i32 %.tmp5406)
%.tmp5408 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5409 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5408, i32 0, i32 6
%.tmp5410 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5409
%.tmp5412 = getelementptr [11 x i8], [11 x i8]*@.str5411, i32 0, i32 0
%.tmp5413 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5410, i8* %.tmp5412)
%else_block.5414 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5413, %m307$.Node.type** %else_block.5414
%.tmp5415 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5414
%.tmp5416 = icmp ne %m307$.Node.type* %.tmp5415, null
br i1 %.tmp5416, label %.if.true.5417, label %.if.false.5417
.if.true.5417:
%.tmp5418 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5414
%.tmp5419 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5418, i32 0, i32 6
%.tmp5420 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5419
%.tmp5421 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5420, i32 0, i32 0
%.tmp5422 = load i8*, i8** %.tmp5421
%.tmp5424 = getelementptr [11 x i8], [11 x i8]*@.str5423, i32 0, i32 0
%.tmp5425 = call i32(i8*,i8*) @strcmp(i8* %.tmp5422, i8* %.tmp5424)
%.tmp5426 = icmp eq i32 %.tmp5425, 0
br i1 %.tmp5426, label %.if.true.5427, label %.if.false.5427
.if.true.5427:
%.tmp5428 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5414
%.tmp5429 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5428, i32 0, i32 6
%.tmp5430 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5429
%.tmp5431 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5430, i32 0, i32 6
%.tmp5432 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5431
%.tmp5434 = getelementptr [6 x i8], [6 x i8]*@.str5433, i32 0, i32 0
%.tmp5435 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5432, i8* %.tmp5434)
store %m307$.Node.type* %.tmp5435, %m307$.Node.type** %block.5391
%.tmp5436 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5437 = load %m307$.Node.type*, %m307$.Node.type** %block.5391
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5436, %m307$.Node.type* %.tmp5437)
br label %.if.end.5427
.if.false.5427:
%.tmp5438 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5439 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5414
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5438, %m307$.Node.type* %.tmp5439)
br label %.if.end.5427
.if.end.5427:
br label %.if.end.5417
.if.false.5417:
br label %.if.end.5417
.if.end.5417:
%.tmp5440 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5441 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5440, i32 0, i32 1
%.tmp5442 = load %m0$.File.type*, %m0$.File.type** %.tmp5441
%.tmp5444 = getelementptr [23 x i8], [23 x i8]*@.str5443, i32 0, i32 0
%.tmp5445 = load i32, i32* %if_id.5362
%.tmp5446 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5442, i8* %.tmp5444, i32 %.tmp5445)
%.tmp5447 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5448 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5447, i32 0, i32 1
%.tmp5449 = load %m0$.File.type*, %m0$.File.type** %.tmp5448
%.tmp5451 = getelementptr [13 x i8], [13 x i8]*@.str5450, i32 0, i32 0
%.tmp5452 = load i32, i32* %if_id.5362
%.tmp5453 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5449, i8* %.tmp5451, i32 %.tmp5452)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5454 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5455 = icmp ne %m307$.Node.type* %.tmp5454, null
br i1 %.tmp5455, label %.if.true.5456, label %.if.false.5456
.if.true.5456:
%.tmp5457 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5458 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5457, i32 0, i32 7
%.tmp5459 = load i8*, i8** %.tmp5458
%.tmp5460 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5461 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5460, i32 0, i32 3
%.tmp5462 = load i32, i32* %.tmp5461
%.tmp5463 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5464 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5463, i32 0, i32 4
%.tmp5465 = load i32, i32* %.tmp5464
%.tmp5466 = load i8*, i8** %msg
%.tmp5467 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5459, i32 %.tmp5462, i32 %.tmp5465, i8* %.tmp5466)
%err.5468 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5467, %m751$.Error.type** %err.5468
%.tmp5469 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5470 = load %m751$.Error.type*, %m751$.Error.type** %err.5468
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5469, %m751$.Error.type* %.tmp5470)
br label %.if.end.5456
.if.false.5456:
%.tmp5472 = getelementptr [61 x i8], [61 x i8]*@.str5471, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5472)
br label %.if.end.5456
.if.end.5456:
ret void
}
define void @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5473 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5474 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5473)
%mod.5475 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5474, %m1861$.ModuleLookup.type** %mod.5475
%.tmp5476 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5475
%.tmp5477 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5476, i32 0, i32 3
%.tmp5478 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5477
%.tmp5479 = icmp ne %m1861$.Scope.type* %.tmp5478, null
%.tmp5481 = getelementptr [82 x i8], [82 x i8]*@.str5480, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5479, i8* %.tmp5481)
%.tmp5482 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5475
%.tmp5483 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5482, i32 0, i32 3
%.tmp5484 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5483
%current_scope.5485 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5484, %m1861$.Scope.type** %current_scope.5485
%.tmp5486 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5487 = ptrtoint %m1861$.ScopeItem.type* %.tmp5486 to i32
%.tmp5488 = call i8*(i32) @malloc(i32 %.tmp5487)
%.tmp5489 = bitcast i8* %.tmp5488 to %m1861$.ScopeItem.type*
%newitem.5490 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5489, %m1861$.ScopeItem.type** %newitem.5490
%.tmp5491 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5490
%.tmp5492 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5491, i32 0, i32 0
%.tmp5493 = load i8*, i8** %name
store i8* %.tmp5493, i8** %.tmp5492
%.tmp5494 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5490
%.tmp5495 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5494, i32 0, i32 1
%.tmp5496 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5496, %m1861$.AssignableInfo.type** %.tmp5495
%.tmp5497 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5490
%.tmp5498 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5497, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5498
%.tmp5499 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5485
%.tmp5500 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5499, i32 0, i32 1
%.tmp5501 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5500
%.tmp5502 = icmp eq %m1861$.ScopeItem.type* %.tmp5501, null
br i1 %.tmp5502, label %.if.true.5503, label %.if.false.5503
.if.true.5503:
%.tmp5504 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5485
%.tmp5505 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5504, i32 0, i32 1
%.tmp5506 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5490
store %m1861$.ScopeItem.type* %.tmp5506, %m1861$.ScopeItem.type** %.tmp5505
ret void
br label %.if.end.5503
.if.false.5503:
br label %.if.end.5503
.if.end.5503:
%.tmp5507 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5485
%.tmp5508 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5507, i32 0, i32 1
%.tmp5509 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5508
%last_item.5510 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5509, %m1861$.ScopeItem.type** %last_item.5510
br label %.for.start.5511
.for.start.5511:
%.tmp5512 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5510
%.tmp5513 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5512, i32 0, i32 2
%.tmp5514 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5513
%.tmp5515 = icmp ne %m1861$.ScopeItem.type* %.tmp5514, null
br i1 %.tmp5515, label %.for.continue.5511, label %.for.end.5511
.for.continue.5511:
%.tmp5516 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5510
%.tmp5517 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5516, i32 0, i32 2
%.tmp5518 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5517
store %m1861$.ScopeItem.type* %.tmp5518, %m1861$.ScopeItem.type** %last_item.5510
br label %.for.start.5511
.for.end.5511:
%.tmp5519 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5510
%.tmp5520 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5519, i32 0, i32 2
%.tmp5521 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5490
store %m1861$.ScopeItem.type* %.tmp5521, %m1861$.ScopeItem.type** %.tmp5520
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5522 = alloca i8*
store i8* null, i8** %err_buf.5522
%.tmp5523 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5524 = load i8*, i8** %module
%.tmp5525 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5526 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5525, i32 0, i32 1
%.tmp5527 = load i8*, i8** %.tmp5526
%.tmp5528 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5523, i8* %.tmp5524, i8* %.tmp5527)
%found.5529 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5528, %m1861$.ScopeItem.type** %found.5529
%.tmp5530 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5529
%.tmp5531 = icmp eq %m1861$.ScopeItem.type* %.tmp5530, null
br i1 %.tmp5531, label %.if.true.5532, label %.if.false.5532
.if.true.5532:
%.tmp5533 = getelementptr i8*, i8** %err_buf.5522, i32 0
%.tmp5535 = getelementptr [31 x i8], [31 x i8]*@.str5534, i32 0, i32 0
%.tmp5536 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5537 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5536, i32 0, i32 1
%.tmp5538 = load i8*, i8** %.tmp5537
%.tmp5539 = load i8*, i8** %module
%.tmp5540 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5533, i8* %.tmp5535, i8* %.tmp5538, i8* %.tmp5539)
%.tmp5541 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5542 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5543 = load i8*, i8** %err_buf.5522
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5541, %m307$.Node.type* %.tmp5542, i8* %.tmp5543)
%.tmp5544 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5544
br label %.if.end.5532
.if.false.5532:
br label %.if.end.5532
.if.end.5532:
br label %.for.start.5545
.for.start.5545:
%.tmp5546 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5547 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5546, i32 0, i32 7
%.tmp5548 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5547
%.tmp5549 = icmp ne %m307$.Node.type* %.tmp5548, null
%.tmp5550 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5529
%.tmp5551 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5550, i32 0, i32 1
%.tmp5552 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5551
%.tmp5553 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5552, i32 0, i32 2
%.tmp5554 = load i8*, i8** %.tmp5553
%.tmp5556 = getelementptr [7 x i8], [7 x i8]*@.str5555, i32 0, i32 0
%.tmp5557 = call i32(i8*,i8*) @strcmp(i8* %.tmp5554, i8* %.tmp5556)
%.tmp5558 = icmp eq i32 %.tmp5557, 0
%.tmp5559 = and i1 %.tmp5549, %.tmp5558
br i1 %.tmp5559, label %.for.continue.5545, label %.for.end.5545
.for.continue.5545:
%.tmp5560 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5561 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5529
%.tmp5562 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5561, i32 0, i32 1
%.tmp5563 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5562
%.tmp5564 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5563, i32 0, i32 0
%.tmp5565 = load i8*, i8** %.tmp5564
%.tmp5566 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5567 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5566, i32 0, i32 7
%.tmp5568 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5567
%.tmp5569 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5568, i32 0, i32 7
%.tmp5570 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5569
%.tmp5571 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5560, i8* %.tmp5565, %m307$.Node.type* %.tmp5570)
store %m1861$.ScopeItem.type* %.tmp5571, %m1861$.ScopeItem.type** %found.5529
%.tmp5572 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5529
%.tmp5573 = icmp eq %m1861$.ScopeItem.type* %.tmp5572, null
br i1 %.tmp5573, label %.if.true.5574, label %.if.false.5574
.if.true.5574:
%.tmp5575 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5575
br label %.if.end.5574
.if.false.5574:
br label %.if.end.5574
.if.end.5574:
br label %.for.start.5545
.for.end.5545:
%.tmp5576 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5529
ret %m1861$.ScopeItem.type* %.tmp5576
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5577 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5578 = icmp eq %m1861$.Scope.type* %.tmp5577, null
br i1 %.tmp5578, label %.if.true.5579, label %.if.false.5579
.if.true.5579:
%.tmp5580 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5580
br label %.if.end.5579
.if.false.5579:
br label %.if.end.5579
.if.end.5579:
%.tmp5582 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5583 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5582, i32 0, i32 1
%.tmp5584 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5583
%item.5585 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5584, %m1861$.ScopeItem.type** %item.5585
br label %.for.start.5581
.for.start.5581:
%.tmp5586 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5585
%.tmp5587 = icmp ne %m1861$.ScopeItem.type* %.tmp5586, null
br i1 %.tmp5587, label %.for.continue.5581, label %.for.end.5581
.for.continue.5581:
%.tmp5588 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5585
%.tmp5589 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5588, i32 0, i32 0
%.tmp5590 = load i8*, i8** %.tmp5589
%.tmp5591 = load i8*, i8** %name
%.tmp5592 = call i32(i8*,i8*) @strcmp(i8* %.tmp5590, i8* %.tmp5591)
%.tmp5593 = icmp eq i32 %.tmp5592, 0
br i1 %.tmp5593, label %.if.true.5594, label %.if.false.5594
.if.true.5594:
%.tmp5595 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5585
ret %m1861$.ScopeItem.type* %.tmp5595
br label %.if.end.5594
.if.false.5594:
br label %.if.end.5594
.if.end.5594:
%.tmp5596 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5585
%.tmp5597 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5596, i32 0, i32 2
%.tmp5598 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5597
store %m1861$.ScopeItem.type* %.tmp5598, %m1861$.ScopeItem.type** %item.5585
br label %.for.start.5581
.for.end.5581:
%.tmp5599 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5599
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5600 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5601 = load i8*, i8** %module
%.tmp5602 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5600, i8* %.tmp5601)
%mod.5603 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5602, %m1861$.ModuleLookup.type** %mod.5603
%.tmp5604 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5603
%.tmp5605 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5604, i32 0, i32 3
%.tmp5606 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5605
%.tmp5607 = icmp ne %m1861$.Scope.type* %.tmp5606, null
%.tmp5609 = getelementptr [77 x i8], [77 x i8]*@.str5608, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5607, i8* %.tmp5609)
%.tmp5611 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5603
%.tmp5612 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5611, i32 0, i32 3
%.tmp5613 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5612
%s.5614 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5613, %m1861$.Scope.type** %s.5614
br label %.for.start.5610
.for.start.5610:
%.tmp5615 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5614
%.tmp5616 = icmp ne %m1861$.Scope.type* %.tmp5615, null
br i1 %.tmp5616, label %.for.continue.5610, label %.for.end.5610
.for.continue.5610:
%.tmp5617 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5618 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5614
%.tmp5619 = load i8*, i8** %assignable_name
%.tmp5620 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5617, %m1861$.Scope.type* %.tmp5618, i8* %.tmp5619)
%item.5621 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5620, %m1861$.ScopeItem.type** %item.5621
%.tmp5622 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5621
%.tmp5623 = icmp ne %m1861$.ScopeItem.type* %.tmp5622, null
br i1 %.tmp5623, label %.if.true.5624, label %.if.false.5624
.if.true.5624:
%.tmp5625 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5621
ret %m1861$.ScopeItem.type* %.tmp5625
br label %.if.end.5624
.if.false.5624:
br label %.if.end.5624
.if.end.5624:
%.tmp5626 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5614
%.tmp5627 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5626, i32 0, i32 5
%.tmp5628 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5627
store %m1861$.Scope.type* %.tmp5628, %m1861$.Scope.type** %s.5614
br label %.for.start.5610
.for.end.5610:
%.tmp5629 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5629
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5630 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5631 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5632 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5631, i32 0, i32 7
%.tmp5633 = load i8*, i8** %.tmp5632
%.tmp5634 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5635 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5634, i32 0, i32 6
%.tmp5636 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5635
%.tmp5637 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5630, i8* %.tmp5633, %m307$.Node.type* %.tmp5636)
ret %m1861$.ScopeItem.type* %.tmp5637
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5638 = alloca i8*
store i8* null, i8** %err_msg.5638
%buf.5639 = alloca i8*
store i8* null, i8** %buf.5639
%.tmp5640 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5641 = icmp eq %m1861$.AssignableInfo.type* %.tmp5640, null
br i1 %.tmp5641, label %.if.true.5642, label %.if.false.5642
.if.true.5642:
%.tmp5643 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5644 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5646 = getelementptr [54 x i8], [54 x i8]*@.str5645, i32 0, i32 0
%.tmp5647 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5643, %m307$.Node.type* %.tmp5644, i8* %.tmp5646)
%.tmp5648 = call i32(i8*,...) @printf(i8* %.tmp5647)
%.tmp5649 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5649
br label %.if.end.5642
.if.false.5642:
br label %.if.end.5642
.if.end.5642:
%.tmp5650 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5651 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5650, i32 0, i32 2
%.tmp5652 = load i8*, i8** %.tmp5651
%.tmp5654 = getelementptr [9 x i8], [9 x i8]*@.str5653, i32 0, i32 0
%.tmp5655 = call i32(i8*,i8*) @strcmp(i8* %.tmp5652, i8* %.tmp5654)
%.tmp5656 = icmp eq i32 %.tmp5655, 0
%.tmp5657 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5658 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5657, i32 0, i32 2
%.tmp5659 = load i8*, i8** %.tmp5658
%.tmp5661 = getelementptr [7 x i8], [7 x i8]*@.str5660, i32 0, i32 0
%.tmp5662 = call i32(i8*,i8*) @strcmp(i8* %.tmp5659, i8* %.tmp5661)
%.tmp5663 = icmp eq i32 %.tmp5662, 0
%.tmp5664 = or i1 %.tmp5656, %.tmp5663
br i1 %.tmp5664, label %.if.true.5665, label %.if.false.5665
.if.true.5665:
%.tmp5666 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5667 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5666, i32 0, i32 7
%.tmp5668 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5667
%.tmp5669 = icmp ne %m307$.Node.type* %.tmp5668, null
br i1 %.tmp5669, label %.if.true.5670, label %.if.false.5670
.if.true.5670:
%.tmp5671 = getelementptr i8*, i8** %err_msg.5638, i32 0
%.tmp5673 = getelementptr [46 x i8], [46 x i8]*@.str5672, i32 0, i32 0
%.tmp5674 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5675 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5674, i32 0, i32 7
%.tmp5676 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5675
%.tmp5677 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5676, i32 0, i32 7
%.tmp5678 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5677
%.tmp5679 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5678, i32 0, i32 1
%.tmp5680 = load i8*, i8** %.tmp5679
%.tmp5681 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5682 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5681, i32 0, i32 1
%.tmp5683 = load i8*, i8** %.tmp5682
%.tmp5684 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5671, i8* %.tmp5673, i8* %.tmp5680, i8* %.tmp5683)
%.tmp5685 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5686 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5687 = load i8*, i8** %err_msg.5638
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5685, %m307$.Node.type* %.tmp5686, i8* %.tmp5687)
%.tmp5688 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5688
br label %.if.end.5670
.if.false.5670:
br label %.if.end.5670
.if.end.5670:
%.tmp5689 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5689
br label %.if.end.5665
.if.false.5665:
%.tmp5690 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5691 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5690, i32 0, i32 2
%.tmp5692 = load i8*, i8** %.tmp5691
%.tmp5694 = getelementptr [9 x i8], [9 x i8]*@.str5693, i32 0, i32 0
%.tmp5695 = call i32(i8*,i8*) @strcmp(i8* %.tmp5692, i8* %.tmp5694)
%.tmp5696 = icmp eq i32 %.tmp5695, 0
%.tmp5697 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5698 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5697, i32 0, i32 7
%.tmp5699 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5698
%.tmp5700 = icmp ne %m307$.Node.type* %.tmp5699, null
%.tmp5701 = and i1 %.tmp5696, %.tmp5700
br i1 %.tmp5701, label %.if.true.5702, label %.if.false.5702
.if.true.5702:
%.tmp5703 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5704 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5703, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5705 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5706 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5705, i32 0, i32 3
%.tmp5707 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5706
%struct_info.5708 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5707, %m1861$.Type.type** %struct_info.5708
br label %.for.start.5709
.for.start.5709:
%.tmp5710 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5711 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5710, i32 0, i32 3
%.tmp5712 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5711
%.tmp5713 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5712, i32 0, i32 0
%.tmp5714 = load i8*, i8** %.tmp5713
%.tmp5716 = getelementptr [4 x i8], [4 x i8]*@.str5715, i32 0, i32 0
%.tmp5717 = call i32(i8*,i8*) @strcmp(i8* %.tmp5714, i8* %.tmp5716)
%.tmp5718 = icmp eq i32 %.tmp5717, 0
br i1 %.tmp5718, label %.for.continue.5709, label %.for.end.5709
.for.continue.5709:
%.tmp5719 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5720 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5719)
%new_base.5721 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5720, %m1861$.AssignableInfo.type** %new_base.5721
%.tmp5722 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5723 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5721
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5722, %m1861$.AssignableInfo.type* %.tmp5723)
%.tmp5724 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5721
%.tmp5725 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5724, i32 0, i32 3
%.tmp5726 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5727 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5726, i32 0, i32 3
%.tmp5728 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5727
%.tmp5729 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5728, i32 0, i32 3
%.tmp5730 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5729
store %m1861$.Type.type* %.tmp5730, %m1861$.Type.type** %.tmp5725
%.tmp5731 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5732 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5731, i32 0, i32 1
%.tmp5733 = load %m0$.File.type*, %m0$.File.type** %.tmp5732
%.tmp5735 = getelementptr [23 x i8], [23 x i8]*@.str5734, i32 0, i32 0
%.tmp5736 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5721
%.tmp5737 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5736)
%.tmp5738 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5739 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5721
%.tmp5740 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5739, i32 0, i32 3
%.tmp5741 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5740
%.tmp5742 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5738, %m1861$.Type.type* %.tmp5741)
%.tmp5743 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5744 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5745 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5744, i32 0, i32 3
%.tmp5746 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5745
%.tmp5747 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5743, %m1861$.Type.type* %.tmp5746)
%.tmp5748 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5749 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5748)
%.tmp5750 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5733, i8* %.tmp5735, i8* %.tmp5737, i8* %.tmp5742, i8* %.tmp5747, i8* %.tmp5749)
%.tmp5751 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5721
store %m1861$.AssignableInfo.type* %.tmp5751, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5752 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5708
%.tmp5753 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5752, i32 0, i32 3
%.tmp5754 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5753
store %m1861$.Type.type* %.tmp5754, %m1861$.Type.type** %struct_info.5708
br label %.for.start.5709
.for.end.5709:
%.tmp5755 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5708
%.tmp5756 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5755, i32 0, i32 0
%.tmp5757 = load i8*, i8** %.tmp5756
%.tmp5759 = getelementptr [10 x i8], [10 x i8]*@.str5758, i32 0, i32 0
%.tmp5760 = call i32(i8*,i8*) @strcmp(i8* %.tmp5757, i8* %.tmp5759)
%.tmp5761 = icmp eq i32 %.tmp5760, 0
br i1 %.tmp5761, label %.if.true.5762, label %.if.false.5762
.if.true.5762:
%.tmp5763 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5708
%.tmp5764 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5763, i32 0, i32 3
%.tmp5765 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5764
store %m1861$.Type.type* %.tmp5765, %m1861$.Type.type** %struct_info.5708
br label %.if.end.5762
.if.false.5762:
br label %.if.end.5762
.if.end.5762:
%.tmp5766 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5708
%.tmp5767 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5766, i32 0, i32 0
%.tmp5768 = load i8*, i8** %.tmp5767
%.tmp5770 = getelementptr [7 x i8], [7 x i8]*@.str5769, i32 0, i32 0
%.tmp5771 = call i32(i8*,i8*) @strcmp(i8* %.tmp5768, i8* %.tmp5770)
%.tmp5772 = icmp ne i32 %.tmp5771, 0
br i1 %.tmp5772, label %.if.true.5773, label %.if.false.5773
.if.true.5773:
%.tmp5774 = getelementptr i8*, i8** %err_msg.5638, i32 0
%.tmp5776 = getelementptr [48 x i8], [48 x i8]*@.str5775, i32 0, i32 0
%.tmp5777 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5778 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5777, i32 0, i32 7
%.tmp5779 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5778
%.tmp5780 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5779, i32 0, i32 7
%.tmp5781 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5780
%.tmp5782 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5781, i32 0, i32 1
%.tmp5783 = load i8*, i8** %.tmp5782
%.tmp5784 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5785 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5784, i32 0, i32 1
%.tmp5786 = load i8*, i8** %.tmp5785
%.tmp5787 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5774, i8* %.tmp5776, i8* %.tmp5783, i8* %.tmp5786)
%.tmp5788 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5789 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5790 = load i8*, i8** %err_msg.5638
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5788, %m307$.Node.type* %.tmp5789, i8* %.tmp5790)
%.tmp5791 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5791
br label %.if.end.5773
.if.false.5773:
br label %.if.end.5773
.if.end.5773:
%.tmp5792 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5793 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5792, i32 0, i32 7
%.tmp5794 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5793
%.tmp5795 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5794, i32 0, i32 7
%.tmp5796 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5795
%.tmp5797 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5796, i32 0, i32 1
%.tmp5798 = load i8*, i8** %.tmp5797
%field_name.5799 = alloca i8*
store i8* %.tmp5798, i8** %field_name.5799
%field_id.5800 = alloca i32
store i32 0, i32* %field_id.5800
%.tmp5801 = bitcast ptr null to %m1861$.Type.type*
%found_field.5802 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5801, %m1861$.Type.type** %found_field.5802
%.tmp5804 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5708
%.tmp5805 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5804, i32 0, i32 3
%.tmp5806 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5805
%field.5807 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5806, %m1861$.Type.type** %field.5807
br label %.for.start.5803
.for.start.5803:
%.tmp5808 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5807
%.tmp5809 = icmp ne %m1861$.Type.type* %.tmp5808, null
br i1 %.tmp5809, label %.for.continue.5803, label %.for.end.5803
.for.continue.5803:
%.tmp5810 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5807
%.tmp5811 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5810, i32 0, i32 1
%.tmp5812 = load i8*, i8** %.tmp5811
%.tmp5813 = load i8*, i8** %field_name.5799
%.tmp5814 = call i32(i8*,i8*) @strcmp(i8* %.tmp5812, i8* %.tmp5813)
%.tmp5815 = icmp eq i32 %.tmp5814, 0
br i1 %.tmp5815, label %.if.true.5816, label %.if.false.5816
.if.true.5816:
%.tmp5817 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5807
store %m1861$.Type.type* %.tmp5817, %m1861$.Type.type** %found_field.5802
br label %.for.end.5803
br label %.if.end.5816
.if.false.5816:
%.tmp5818 = load i32, i32* %field_id.5800
%.tmp5819 = add i32 %.tmp5818, 1
store i32 %.tmp5819, i32* %field_id.5800
br label %.if.end.5816
.if.end.5816:
%.tmp5820 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5807
%.tmp5821 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5820, i32 0, i32 4
%.tmp5822 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5821
store %m1861$.Type.type* %.tmp5822, %m1861$.Type.type** %field.5807
br label %.for.start.5803
.for.end.5803:
%.tmp5823 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5802
%.tmp5824 = icmp eq %m1861$.Type.type* %.tmp5823, null
br i1 %.tmp5824, label %.if.true.5825, label %.if.false.5825
.if.true.5825:
%.tmp5826 = getelementptr i8*, i8** %err_msg.5638, i32 0
%.tmp5828 = getelementptr [34 x i8], [34 x i8]*@.str5827, i32 0, i32 0
%.tmp5829 = load i8*, i8** %field_name.5799
%.tmp5830 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5831 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5830, i32 0, i32 1
%.tmp5832 = load i8*, i8** %.tmp5831
%.tmp5833 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5826, i8* %.tmp5828, i8* %.tmp5829, i8* %.tmp5832)
%.tmp5834 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5835 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5836 = load i8*, i8** %err_msg.5638
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5834, %m307$.Node.type* %.tmp5835, i8* %.tmp5836)
%.tmp5837 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5837
br label %.if.end.5825
.if.false.5825:
br label %.if.end.5825
.if.end.5825:
%.tmp5838 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5839 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5838)
%new_info.5840 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5839, %m1861$.AssignableInfo.type** %new_info.5840
%.tmp5841 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5840
%.tmp5842 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5841, i32 0, i32 3
%.tmp5843 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5802
store %m1861$.Type.type* %.tmp5843, %m1861$.Type.type** %.tmp5842
%.tmp5844 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5845 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5840
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5844, %m1861$.AssignableInfo.type* %.tmp5845)
%.tmp5846 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5840
%.tmp5847 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5846, i32 0, i32 2
%.tmp5849 = getelementptr [9 x i8], [9 x i8]*@.str5848, i32 0, i32 0
store i8* %.tmp5849, i8** %.tmp5847
%.tmp5850 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5851 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5852 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5851, i32 0, i32 3
%.tmp5853 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5852
%.tmp5854 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5850, %m1861$.Type.type* %.tmp5853)
%info_tr.5855 = alloca i8*
store i8* %.tmp5854, i8** %info_tr.5855
%.tmp5856 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5857 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5856, i32 0, i32 1
%.tmp5858 = load %m0$.File.type*, %m0$.File.type** %.tmp5857
%.tmp5860 = getelementptr [46 x i8], [46 x i8]*@.str5859, i32 0, i32 0
%.tmp5861 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5840
%.tmp5862 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5861)
%.tmp5863 = load i8*, i8** %info_tr.5855
%.tmp5864 = load i8*, i8** %info_tr.5855
%.tmp5865 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5704
%.tmp5866 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5865)
%.tmp5867 = load i32, i32* %field_id.5800
%.tmp5868 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5858, i8* %.tmp5860, i8* %.tmp5862, i8* %.tmp5863, i8* %.tmp5864, i8* %.tmp5866, i32 %.tmp5867)
%.tmp5869 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5870 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5871 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5870, i32 0, i32 7
%.tmp5872 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5871
%.tmp5873 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5872, i32 0, i32 7
%.tmp5874 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5873
%.tmp5875 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5840
%.tmp5876 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5869, %m307$.Node.type* %.tmp5874, %m1861$.AssignableInfo.type* %.tmp5875)
ret %m1861$.AssignableInfo.type* %.tmp5876
br label %.if.end.5702
.if.false.5702:
%.tmp5877 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5878 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5877, i32 0, i32 2
%.tmp5879 = load i8*, i8** %.tmp5878
%.tmp5881 = getelementptr [9 x i8], [9 x i8]*@.str5880, i32 0, i32 0
%.tmp5882 = call i32(i8*,i8*) @strcmp(i8* %.tmp5879, i8* %.tmp5881)
%.tmp5883 = icmp eq i32 %.tmp5882, 0
br i1 %.tmp5883, label %.if.true.5884, label %.if.false.5884
.if.true.5884:
%.tmp5885 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5885
br label %.if.end.5884
.if.false.5884:
br label %.if.end.5884
.if.end.5884:
br label %.if.end.5702
.if.end.5702:
br label %.if.end.5665
.if.end.5665:
%.tmp5886 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5887 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5889 = getelementptr [43 x i8], [43 x i8]*@.str5888, i32 0, i32 0
%.tmp5890 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5886, %m307$.Node.type* %.tmp5887, i8* %.tmp5889)
%.tmp5891 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5892 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5891, i32 0, i32 2
%.tmp5893 = load i8*, i8** %.tmp5892
%.tmp5894 = call i32(i8*,...) @printf(i8* %.tmp5890, i8* %.tmp5893)
%.tmp5895 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5895
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.5896 = alloca i8*
store i8* null, i8** %err_msg.5896
%.tmp5897 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.5898 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5897, %m307$.Node.type** %curr_node.5898
%.tmp5899 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp5900 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5899, i32 0, i32 0
%.tmp5901 = load i8*, i8** %.tmp5900
%.tmp5903 = getelementptr [17 x i8], [17 x i8]*@.str5902, i32 0, i32 0
%.tmp5904 = call i32(i8*,i8*) @strcmp(i8* %.tmp5901, i8* %.tmp5903)
%.tmp5905 = icmp eq i32 %.tmp5904, 0
%.tmp5906 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp5907 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5906, i32 0, i32 0
%.tmp5908 = load i8*, i8** %.tmp5907
%.tmp5910 = getelementptr [16 x i8], [16 x i8]*@.str5909, i32 0, i32 0
%.tmp5911 = call i32(i8*,i8*) @strcmp(i8* %.tmp5908, i8* %.tmp5910)
%.tmp5912 = icmp eq i32 %.tmp5911, 0
%.tmp5913 = or i1 %.tmp5905, %.tmp5912
%.tmp5914 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp5915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5914, i32 0, i32 0
%.tmp5916 = load i8*, i8** %.tmp5915
%.tmp5918 = getelementptr [11 x i8], [11 x i8]*@.str5917, i32 0, i32 0
%.tmp5919 = call i32(i8*,i8*) @strcmp(i8* %.tmp5916, i8* %.tmp5918)
%.tmp5920 = icmp eq i32 %.tmp5919, 0
%.tmp5921 = or i1 %.tmp5913, %.tmp5920
br i1 %.tmp5921, label %.if.true.5922, label %.if.false.5922
.if.true.5922:
%.tmp5923 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5924 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5925 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5924, i32 0, i32 6
%.tmp5926 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5925
%.tmp5927 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5923, %m307$.Node.type* %.tmp5926)
ret %m1861$.AssignableInfo.type* %.tmp5927
br label %.if.end.5922
.if.false.5922:
br label %.if.end.5922
.if.end.5922:
%.tmp5928 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp5929 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5928, i32 0, i32 0
%.tmp5930 = load i8*, i8** %.tmp5929
%.tmp5932 = getelementptr [12 x i8], [12 x i8]*@.str5931, i32 0, i32 0
%.tmp5933 = call i32(i8*,i8*) @strcmp(i8* %.tmp5930, i8* %.tmp5932)
%.tmp5934 = icmp ne i32 %.tmp5933, 0
br i1 %.tmp5934, label %.if.true.5935, label %.if.false.5935
.if.true.5935:
%.tmp5937 = getelementptr [92 x i8], [92 x i8]*@.str5936, i32 0, i32 0
%.tmp5938 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp5939 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5938, i32 0, i32 0
%.tmp5940 = load i8*, i8** %.tmp5939
%.tmp5941 = call i32(i8*,...) @printf(i8* %.tmp5937, i8* %.tmp5940)
%.tmp5942 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5943 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5942, i32 0, i32 6
%.tmp5944 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5943
store %m307$.Node.type* %.tmp5944, %m307$.Node.type** %curr_node.5898
br label %.if.end.5935
.if.false.5935:
br label %.if.end.5935
.if.end.5935:
%.tmp5945 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp5946 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5945, i32 0, i32 6
%.tmp5947 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5946
%assignable_name.5948 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5947, %m307$.Node.type** %assignable_name.5948
%.tmp5949 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5950 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5951 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5950, i32 0, i32 7
%.tmp5952 = load i8*, i8** %.tmp5951
%.tmp5953 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp5954 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5953, i32 0, i32 6
%.tmp5955 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5954
%.tmp5956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5955, i32 0, i32 1
%.tmp5957 = load i8*, i8** %.tmp5956
%.tmp5958 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5949, i8* %.tmp5952, i8* %.tmp5957)
%scope_info.5959 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5958, %m1861$.ScopeItem.type** %scope_info.5959
%.tmp5960 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5959
%.tmp5961 = icmp eq %m1861$.ScopeItem.type* %.tmp5960, null
br i1 %.tmp5961, label %.if.true.5962, label %.if.false.5962
.if.true.5962:
%.tmp5963 = getelementptr i8*, i8** %err_msg.5896, i32 0
%.tmp5965 = getelementptr [41 x i8], [41 x i8]*@.str5964, i32 0, i32 0
%.tmp5966 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp5967 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5966, i32 0, i32 6
%.tmp5968 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5967
%.tmp5969 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5968, i32 0, i32 1
%.tmp5970 = load i8*, i8** %.tmp5969
%.tmp5971 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5963, i8* %.tmp5965, i8* %.tmp5970)
%.tmp5972 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5973 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp5974 = load i8*, i8** %err_msg.5896
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5972, %m307$.Node.type* %.tmp5973, i8* %.tmp5974)
%.tmp5975 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5975
br label %.if.end.5962
.if.false.5962:
br label %.if.end.5962
.if.end.5962:
%.tmp5976 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5959
%.tmp5977 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5976, i32 0, i32 1
%.tmp5978 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5977
%info.5979 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5978, %m1861$.AssignableInfo.type** %info.5979
%.tmp5980 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5979
%.tmp5981 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5980, i32 0, i32 2
%.tmp5982 = load i8*, i8** %.tmp5981
%.tmp5984 = getelementptr [7 x i8], [7 x i8]*@.str5983, i32 0, i32 0
%.tmp5985 = call i32(i8*,i8*) @strcmp(i8* %.tmp5982, i8* %.tmp5984)
%.tmp5986 = icmp eq i32 %.tmp5985, 0
br i1 %.tmp5986, label %.if.true.5987, label %.if.false.5987
.if.true.5987:
%.tmp5988 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5989 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5979
%.tmp5990 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5989)
%.tmp5991 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp5992 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5991, i32 0, i32 6
%.tmp5993 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5992
%.tmp5994 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5993, i32 0, i32 7
%.tmp5995 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5994
%.tmp5996 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5995, i32 0, i32 7
%.tmp5997 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5996
%.tmp5998 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5997, i32 0, i32 1
%.tmp5999 = load i8*, i8** %.tmp5998
%.tmp6000 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5988, i8* %.tmp5990, i8* %.tmp5999)
store %m1861$.ScopeItem.type* %.tmp6000, %m1861$.ScopeItem.type** %scope_info.5959
%.tmp6001 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5959
%.tmp6002 = icmp eq %m1861$.ScopeItem.type* %.tmp6001, null
br i1 %.tmp6002, label %.if.true.6003, label %.if.false.6003
.if.true.6003:
%.tmp6004 = getelementptr i8*, i8** %err_msg.5896, i32 0
%.tmp6006 = getelementptr [31 x i8], [31 x i8]*@.str6005, i32 0, i32 0
%.tmp6007 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp6008 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6007, i32 0, i32 6
%.tmp6009 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6008
%.tmp6010 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6009, i32 0, i32 7
%.tmp6011 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6010
%.tmp6012 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6011, i32 0, i32 7
%.tmp6013 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6012
%.tmp6014 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6013, i32 0, i32 1
%.tmp6015 = load i8*, i8** %.tmp6014
%.tmp6016 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5979
%.tmp6017 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6016)
%.tmp6018 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6004, i8* %.tmp6006, i8* %.tmp6015, i8* %.tmp6017)
%.tmp6019 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6020 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp6021 = load i8*, i8** %err_msg.5896
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6019, %m307$.Node.type* %.tmp6020, i8* %.tmp6021)
%.tmp6022 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6022
br label %.if.end.6003
.if.false.6003:
br label %.if.end.6003
.if.end.6003:
%.tmp6023 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5959
%.tmp6024 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6023, i32 0, i32 1
%.tmp6025 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6024
store %m1861$.AssignableInfo.type* %.tmp6025, %m1861$.AssignableInfo.type** %info.5979
%.tmp6026 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp6027 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6026, i32 0, i32 6
%.tmp6028 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6027
%.tmp6029 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6028, i32 0, i32 7
%.tmp6030 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6029
%.tmp6031 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6030, i32 0, i32 7
%.tmp6032 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6031
store %m307$.Node.type* %.tmp6032, %m307$.Node.type** %assignable_name.5948
br label %.if.end.5987
.if.false.5987:
%.tmp6033 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp6034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6033, i32 0, i32 6
%.tmp6035 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6034
store %m307$.Node.type* %.tmp6035, %m307$.Node.type** %assignable_name.5948
br label %.if.end.5987
.if.end.5987:
%.tmp6036 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6037 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5948
%.tmp6038 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5979
%.tmp6039 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6036, %m307$.Node.type* %.tmp6037, %m1861$.AssignableInfo.type* %.tmp6038)
%base.6040 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6039, %m1861$.AssignableInfo.type** %base.6040
%.tmp6042 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp6043 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6042, i32 0, i32 6
%.tmp6044 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6043
%.tmp6045 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6044, i32 0, i32 7
%.tmp6046 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6045
%addr.6047 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6046, %m307$.Node.type** %addr.6047
br label %.for.start.6041
.for.start.6041:
%.tmp6048 = load %m307$.Node.type*, %m307$.Node.type** %addr.6047
%.tmp6049 = icmp ne %m307$.Node.type* %.tmp6048, null
br i1 %.tmp6049, label %.for.continue.6041, label %.for.end.6041
.for.continue.6041:
%.tmp6050 = load %m307$.Node.type*, %m307$.Node.type** %addr.6047
%.tmp6051 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6050, i32 0, i32 7
%.tmp6052 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6051
%index.6053 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6052, %m307$.Node.type** %index.6053
%.tmp6054 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6055 = load %m307$.Node.type*, %m307$.Node.type** %index.6053
%.tmp6056 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6054, %m307$.Node.type* %.tmp6055)
%index_info.6057 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6056, %m1861$.AssignableInfo.type** %index_info.6057
%.tmp6058 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6059 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6057
%.tmp6060 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6059, i32 0, i32 3
%.tmp6061 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6060
%.tmp6062 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6058, %m1861$.Type.type* %.tmp6061)
%index_type.6063 = alloca i8*
store i8* %.tmp6062, i8** %index_type.6063
%.tmp6064 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6065 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6064, i32 0, i32 3
%.tmp6066 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6065
%.tmp6067 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6066, i32 0, i32 1
%.tmp6068 = load i8*, i8** %.tmp6067
%.tmp6069 = icmp ne i8* %.tmp6068, null
br i1 %.tmp6069, label %.if.true.6070, label %.if.false.6070
.if.true.6070:
%.tmp6071 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6072 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6071, i32 0, i32 3
%.tmp6073 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6072
%.tmp6074 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6073, i32 0, i32 1
%.tmp6075 = load i8*, i8** %.tmp6074
%.tmp6077 = getelementptr [6 x i8], [6 x i8]*@.str6076, i32 0, i32 0
%.tmp6078 = call i32(i8*,i8*) @strcmp(i8* %.tmp6075, i8* %.tmp6077)
%.tmp6079 = icmp eq i32 %.tmp6078, 0
br i1 %.tmp6079, label %.if.true.6080, label %.if.false.6080
.if.true.6080:
%.tmp6081 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp6082 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6081)
%new_base.6083 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6082, %m1861$.AssignableInfo.type** %new_base.6083
%.tmp6084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6085 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6083
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6084, %m1861$.AssignableInfo.type* %.tmp6085)
%.tmp6086 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6087 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6086, i32 0, i32 1
%.tmp6088 = load %m0$.File.type*, %m0$.File.type** %.tmp6087
%.tmp6090 = getelementptr [45 x i8], [45 x i8]*@.str6089, i32 0, i32 0
%.tmp6091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6083
%.tmp6092 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6091)
%.tmp6093 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6094 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6095 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6094, i32 0, i32 3
%.tmp6096 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6095
%.tmp6097 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6093, %m1861$.Type.type* %.tmp6096)
%.tmp6098 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6099 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6100 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6099, i32 0, i32 3
%.tmp6101 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6100
%.tmp6102 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6098, %m1861$.Type.type* %.tmp6101)
%.tmp6103 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6104 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6103)
%.tmp6105 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6088, i8* %.tmp6090, i8* %.tmp6092, i8* %.tmp6097, i8* %.tmp6102, i8* %.tmp6104)
%.tmp6106 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6083
%.tmp6107 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6106, i32 0, i32 3
%.tmp6108 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6109 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6108, i32 0, i32 3
%.tmp6110 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6109
%.tmp6111 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6110, i32 0, i32 3
%.tmp6112 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6111
%.tmp6113 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp6112)
store %m1861$.Type.type* %.tmp6113, %m1861$.Type.type** %.tmp6107
%.tmp6114 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6083
%.tmp6115 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6114, i32 0, i32 3
%.tmp6116 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6115
%.tmp6117 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6116, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6117
%.tmp6118 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6083
store %m1861$.AssignableInfo.type* %.tmp6118, %m1861$.AssignableInfo.type** %base.6040
br label %.if.end.6080
.if.false.6080:
br label %.if.end.6080
.if.end.6080:
br label %.if.end.6070
.if.false.6070:
br label %.if.end.6070
.if.end.6070:
%.tmp6119 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6120 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6121 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6120, i32 0, i32 3
%.tmp6122 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6121
%.tmp6123 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6119, %m1861$.Type.type* %.tmp6122)
%base_type.6124 = alloca i8*
store i8* %.tmp6123, i8** %base_type.6124
%.tmp6125 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6126 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6125)
%tmp_id.6127 = alloca i32
store i32 %.tmp6126, i32* %tmp_id.6127
%.tmp6128 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6129 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6128, i32 0, i32 1
%.tmp6130 = load %m0$.File.type*, %m0$.File.type** %.tmp6129
%.tmp6132 = getelementptr [28 x i8], [28 x i8]*@.str6131, i32 0, i32 0
%.tmp6133 = load i32, i32* %tmp_id.6127
%.tmp6134 = load i8*, i8** %base_type.6124
%.tmp6135 = load i8*, i8** %base_type.6124
%.tmp6136 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6137 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6136)
%.tmp6138 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6130, i8* %.tmp6132, i32 %.tmp6133, i8* %.tmp6134, i8* %.tmp6135, i8* %.tmp6137)
%.tmp6139 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5898
%.tmp6140 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6139)
%new_base.6141 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6140, %m1861$.AssignableInfo.type** %new_base.6141
%.tmp6142 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6143 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6141
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6142, %m1861$.AssignableInfo.type* %.tmp6143)
%.tmp6144 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6145 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6144, i32 0, i32 3
%.tmp6146 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6145
%.tmp6147 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6146, i32 0, i32 3
%.tmp6148 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6147
%.tmp6149 = icmp eq %m1861$.Type.type* %.tmp6148, null
br i1 %.tmp6149, label %.if.true.6150, label %.if.false.6150
.if.true.6150:
%.tmp6151 = getelementptr i8*, i8** %err_msg.5896, i32 0
%.tmp6153 = getelementptr [35 x i8], [35 x i8]*@.str6152, i32 0, i32 0
%.tmp6154 = load i8*, i8** %base_type.6124
%.tmp6155 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6151, i8* %.tmp6153, i8* %.tmp6154)
%.tmp6156 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6157 = load %m307$.Node.type*, %m307$.Node.type** %addr.6047
%.tmp6158 = load i8*, i8** %err_msg.5896
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6156, %m307$.Node.type* %.tmp6157, i8* %.tmp6158)
%.tmp6159 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
ret %m1861$.AssignableInfo.type* %.tmp6159
br label %.if.end.6150
.if.false.6150:
br label %.if.end.6150
.if.end.6150:
%.tmp6160 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6141
%.tmp6161 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6160, i32 0, i32 3
%.tmp6162 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
%.tmp6163 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6162, i32 0, i32 3
%.tmp6164 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6163
%.tmp6165 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6164, i32 0, i32 3
%.tmp6166 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6165
store %m1861$.Type.type* %.tmp6166, %m1861$.Type.type** %.tmp6161
%.tmp6167 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6168 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6141
%.tmp6169 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6168, i32 0, i32 3
%.tmp6170 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6169
%.tmp6171 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6167, %m1861$.Type.type* %.tmp6170)
%base_type_2.6172 = alloca i8*
store i8* %.tmp6171, i8** %base_type_2.6172
%.tmp6173 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6174 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6173, i32 0, i32 1
%.tmp6175 = load %m0$.File.type*, %m0$.File.type** %.tmp6174
%.tmp6177 = getelementptr [44 x i8], [44 x i8]*@.str6176, i32 0, i32 0
%.tmp6178 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6141
%.tmp6179 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6178)
%.tmp6180 = load i8*, i8** %base_type_2.6172
%.tmp6181 = load i8*, i8** %base_type_2.6172
%.tmp6182 = load i32, i32* %tmp_id.6127
%.tmp6183 = load i8*, i8** %index_type.6063
%.tmp6184 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6057
%.tmp6185 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6184)
%.tmp6186 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6175, i8* %.tmp6177, i8* %.tmp6179, i8* %.tmp6180, i8* %.tmp6181, i32 %.tmp6182, i8* %.tmp6183, i8* %.tmp6185)
%.tmp6187 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6141
store %m1861$.AssignableInfo.type* %.tmp6187, %m1861$.AssignableInfo.type** %base.6040
%.tmp6188 = load %m307$.Node.type*, %m307$.Node.type** %addr.6047
%.tmp6189 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6188, i32 0, i32 7
%.tmp6190 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6189
%.tmp6191 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6190, i32 0, i32 7
%.tmp6192 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6191
%.tmp6193 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6192, i32 0, i32 7
%.tmp6194 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6193
store %m307$.Node.type* %.tmp6194, %m307$.Node.type** %addr.6047
br label %.for.start.6041
.for.end.6041:
%.tmp6195 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6040
ret %m1861$.AssignableInfo.type* %.tmp6195
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6196 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6197 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6196, i32 0, i32 6
%.tmp6198 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6197
%.tmp6200 = getelementptr [16 x i8], [16 x i8]*@.str6199, i32 0, i32 0
%.tmp6201 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6198, i8* %.tmp6200)
%assignable_start.6202 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6201, %m307$.Node.type** %assignable_start.6202
%.tmp6203 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6202
%.tmp6204 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6203)
%operator_stack.6205 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6204, %m1988$.SYStack.type** %operator_stack.6205
%.tmp6206 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6207 = ptrtoint %m1861$.StackHead.type* %.tmp6206 to i32
%.tmp6208 = call i8*(i32) @malloc(i32 %.tmp6207)
%.tmp6209 = bitcast i8* %.tmp6208 to %m1861$.StackHead.type*
%stack.6210 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6209, %m1861$.StackHead.type** %stack.6210
%.tmp6211 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6210
%.tmp6212 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6211, i32 0, i32 0
%.tmp6213 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6205
store %m1988$.SYStack.type* %.tmp6213, %m1988$.SYStack.type** %.tmp6212
%.tmp6214 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6215 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6210
%.tmp6216 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6214, %m1861$.StackHead.type* %.tmp6215)
%info.6217 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6216, %m1861$.AssignableInfo.type** %info.6217
%.tmp6218 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
%.tmp6219 = icmp eq %m1861$.AssignableInfo.type* %.tmp6218, null
br i1 %.tmp6219, label %.if.true.6220, label %.if.false.6220
.if.true.6220:
%.tmp6221 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
ret %m1861$.AssignableInfo.type* %.tmp6221
br label %.if.end.6220
.if.false.6220:
br label %.if.end.6220
.if.end.6220:
%.tmp6222 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6223 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6222, i32 0, i32 6
%.tmp6224 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6223
%.tmp6226 = getelementptr [5 x i8], [5 x i8]*@.str6225, i32 0, i32 0
%.tmp6227 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6224, i8* %.tmp6226)
%cast.6228 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6227, %m307$.Node.type** %cast.6228
%.tmp6229 = load %m307$.Node.type*, %m307$.Node.type** %cast.6228
%.tmp6230 = icmp ne %m307$.Node.type* %.tmp6229, null
br i1 %.tmp6230, label %.if.true.6231, label %.if.false.6231
.if.true.6231:
%.tmp6232 = load %m307$.Node.type*, %m307$.Node.type** %cast.6228
%.tmp6233 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6232, i32 0, i32 6
%.tmp6234 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6233
%.tmp6236 = getelementptr [5 x i8], [5 x i8]*@.str6235, i32 0, i32 0
%.tmp6237 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6234, i8* %.tmp6236)
%cast_type.6238 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6237, %m307$.Node.type** %cast_type.6238
%.tmp6239 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6240 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6238
%.tmp6241 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6240, i32 0, i32 6
%.tmp6242 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6241
%.tmp6243 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6239, %m307$.Node.type* %.tmp6242)
%type.6244 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6243, %m1861$.Type.type** %type.6244
%.tmp6245 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
%.tmp6246 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6245)
%prev_id.6247 = alloca i8*
store i8* %.tmp6246, i8** %prev_id.6247
%.tmp6248 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6249 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6248, %m1861$.AssignableInfo.type* %.tmp6249)
%.tmp6250 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6251 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
%.tmp6252 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6251, i32 0, i32 3
%.tmp6253 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6252
%.tmp6254 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6250, %m1861$.Type.type* %.tmp6253)
%from_type.6255 = alloca i8*
store i8* %.tmp6254, i8** %from_type.6255
%.tmp6256 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6257 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6244
%.tmp6258 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6256, %m1861$.Type.type* %.tmp6257)
%to_type.6259 = alloca i8*
store i8* %.tmp6258, i8** %to_type.6259
%.tmp6261 = getelementptr [8 x i8], [8 x i8]*@.str6260, i32 0, i32 0
%cast_fn.6262 = alloca i8*
store i8* %.tmp6261, i8** %cast_fn.6262
%.tmp6263 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
%.tmp6264 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6263, i32 0, i32 3
%.tmp6265 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6264
%.tmp6266 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6265, i32 0, i32 0
%.tmp6267 = load i8*, i8** %.tmp6266
%.tmp6269 = getelementptr [4 x i8], [4 x i8]*@.str6268, i32 0, i32 0
%.tmp6270 = call i32(i8*,i8*) @strcmp(i8* %.tmp6267, i8* %.tmp6269)
%.tmp6271 = icmp ne i32 %.tmp6270, 0
%.tmp6272 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6244
%.tmp6273 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6272, i32 0, i32 0
%.tmp6274 = load i8*, i8** %.tmp6273
%.tmp6276 = getelementptr [4 x i8], [4 x i8]*@.str6275, i32 0, i32 0
%.tmp6277 = call i32(i8*,i8*) @strcmp(i8* %.tmp6274, i8* %.tmp6276)
%.tmp6278 = icmp ne i32 %.tmp6277, 0
%.tmp6279 = and i1 %.tmp6271, %.tmp6278
br i1 %.tmp6279, label %.if.true.6280, label %.if.false.6280
.if.true.6280:
%.tmp6281 = load i8*, i8** %from_type.6255
%.tmp6282 = getelementptr i8, i8* %.tmp6281, i32 0
%.tmp6283 = load i8, i8* %.tmp6282
%.tmp6284 = icmp eq i8 %.tmp6283, 105
%.tmp6285 = load i8*, i8** %to_type.6259
%.tmp6286 = getelementptr i8, i8* %.tmp6285, i32 0
%.tmp6287 = load i8, i8* %.tmp6286
%.tmp6288 = icmp eq i8 %.tmp6287, 105
%.tmp6289 = and i1 %.tmp6284, %.tmp6288
br i1 %.tmp6289, label %.if.true.6290, label %.if.false.6290
.if.true.6290:
%from_size.6291 = alloca i32
store i32 0, i32* %from_size.6291
%to_size.6292 = alloca i32
store i32 0, i32* %to_size.6292
%.tmp6293 = load i8*, i8** %from_type.6255
%.tmp6295 = getelementptr [4 x i8], [4 x i8]*@.str6294, i32 0, i32 0
%.tmp6296 = getelementptr i32, i32* %from_size.6291, i32 0
%.tmp6297 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6293, i8* %.tmp6295, i32* %.tmp6296)
%.tmp6298 = load i8*, i8** %to_type.6259
%.tmp6300 = getelementptr [4 x i8], [4 x i8]*@.str6299, i32 0, i32 0
%.tmp6301 = getelementptr i32, i32* %to_size.6292, i32 0
%.tmp6302 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6298, i8* %.tmp6300, i32* %.tmp6301)
%.tmp6303 = load i32, i32* %from_size.6291
%.tmp6304 = load i32, i32* %to_size.6292
%.tmp6305 = icmp slt i32 %.tmp6303, %.tmp6304
br i1 %.tmp6305, label %.if.true.6306, label %.if.false.6306
.if.true.6306:
%.tmp6308 = getelementptr [5 x i8], [5 x i8]*@.str6307, i32 0, i32 0
store i8* %.tmp6308, i8** %cast_fn.6262
br label %.if.end.6306
.if.false.6306:
%.tmp6310 = getelementptr [6 x i8], [6 x i8]*@.str6309, i32 0, i32 0
store i8* %.tmp6310, i8** %cast_fn.6262
br label %.if.end.6306
.if.end.6306:
br label %.if.end.6290
.if.false.6290:
br label %.if.end.6290
.if.end.6290:
br label %.if.end.6280
.if.false.6280:
br label %.if.end.6280
.if.end.6280:
%.tmp6311 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6312 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6311, i32 0, i32 1
%.tmp6313 = load %m0$.File.type*, %m0$.File.type** %.tmp6312
%.tmp6315 = getelementptr [21 x i8], [21 x i8]*@.str6314, i32 0, i32 0
%.tmp6316 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
%.tmp6317 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6316)
%.tmp6318 = load i8*, i8** %cast_fn.6262
%.tmp6319 = load i8*, i8** %from_type.6255
%.tmp6320 = load i8*, i8** %prev_id.6247
%.tmp6321 = load i8*, i8** %to_type.6259
%.tmp6322 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6313, i8* %.tmp6315, i8* %.tmp6317, i8* %.tmp6318, i8* %.tmp6319, i8* %.tmp6320, i8* %.tmp6321)
%.tmp6323 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
%.tmp6324 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6323, i32 0, i32 3
%.tmp6325 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6244
store %m1861$.Type.type* %.tmp6325, %m1861$.Type.type** %.tmp6324
br label %.if.end.6231
.if.false.6231:
br label %.if.end.6231
.if.end.6231:
%.tmp6326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6217
ret %m1861$.AssignableInfo.type* %.tmp6326
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6327 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6328 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6327, i32 0, i32 0
%.tmp6329 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6328
%.tmp6330 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6329, i32 0, i32 0
%.tmp6331 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6330
%.tmp6332 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6331, i32 0, i32 0
%.tmp6333 = load i8*, i8** %.tmp6332
%.tmp6335 = getelementptr [16 x i8], [16 x i8]*@.str6334, i32 0, i32 0
%.tmp6336 = call i32(i8*,i8*) @strcmp(i8* %.tmp6333, i8* %.tmp6335)
%.tmp6337 = icmp eq i32 %.tmp6336, 0
br i1 %.tmp6337, label %.if.true.6338, label %.if.false.6338
.if.true.6338:
%.tmp6339 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6340 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6341 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6340, i32 0, i32 0
%.tmp6342 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6341
%.tmp6343 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6342, i32 0, i32 0
%.tmp6344 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6343
%.tmp6345 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6339, %m307$.Node.type* %.tmp6344)
ret %m1861$.AssignableInfo.type* %.tmp6345
br label %.if.end.6338
.if.false.6338:
br label %.if.end.6338
.if.end.6338:
%.tmp6346 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6347 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6346, i32 0, i32 0
%.tmp6348 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6347
%.tmp6349 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6348, i32 0, i32 0
%.tmp6350 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6349
%.tmp6351 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6350, i32 0, i32 6
%.tmp6352 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6351
%operator.6353 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6352, %m307$.Node.type** %operator.6353
%.tmp6354 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6355 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6354, i32 0, i32 0
%.tmp6356 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6357 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6356, i32 0, i32 0
%.tmp6358 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6357
%.tmp6359 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6358, i32 0, i32 1
%.tmp6360 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6359
store %m1988$.SYStack.type* %.tmp6360, %m1988$.SYStack.type** %.tmp6355
%.tmp6361 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6362 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6363 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6361, %m1861$.StackHead.type* %.tmp6362)
%A.6364 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6363, %m1861$.AssignableInfo.type** %A.6364
%.tmp6365 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6364
%.tmp6366 = icmp eq %m1861$.AssignableInfo.type* %.tmp6365, null
br i1 %.tmp6366, label %.if.true.6367, label %.if.false.6367
.if.true.6367:
%.tmp6368 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6364
ret %m1861$.AssignableInfo.type* %.tmp6368
br label %.if.end.6367
.if.false.6367:
br label %.if.end.6367
.if.end.6367:
%.tmp6369 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6370 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6369, i32 0, i32 0
%.tmp6371 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6372 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6371, i32 0, i32 0
%.tmp6373 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6372
%.tmp6374 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6373, i32 0, i32 1
%.tmp6375 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6374
store %m1988$.SYStack.type* %.tmp6375, %m1988$.SYStack.type** %.tmp6370
%.tmp6376 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6377 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6378 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6376, %m1861$.StackHead.type* %.tmp6377)
%B.6379 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6378, %m1861$.AssignableInfo.type** %B.6379
%.tmp6380 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6379
%.tmp6381 = icmp eq %m1861$.AssignableInfo.type* %.tmp6380, null
br i1 %.tmp6381, label %.if.true.6382, label %.if.false.6382
.if.true.6382:
%.tmp6383 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6379
ret %m1861$.AssignableInfo.type* %.tmp6383
br label %.if.end.6382
.if.false.6382:
br label %.if.end.6382
.if.end.6382:
%.tmp6384 = bitcast ptr null to %m307$.Node.type*
%.tmp6385 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6384)
%op_info.6386 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6385, %m1861$.AssignableInfo.type** %op_info.6386
%.tmp6387 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6386
%.tmp6388 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6387, i32 0, i32 3
%.tmp6389 = load %m307$.Node.type*, %m307$.Node.type** %operator.6353
%.tmp6390 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6389)
store %m1861$.Type.type* %.tmp6390, %m1861$.Type.type** %.tmp6388
%.tmp6391 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6392 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6386
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6391, %m1861$.AssignableInfo.type* %.tmp6392)
%.tmp6393 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6394 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6393, i32 0, i32 1
%.tmp6395 = load %m0$.File.type*, %m0$.File.type** %.tmp6394
%.tmp6397 = getelementptr [19 x i8], [19 x i8]*@.str6396, i32 0, i32 0
%.tmp6398 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6386
%.tmp6399 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6398)
%.tmp6400 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6401 = load %m307$.Node.type*, %m307$.Node.type** %operator.6353
%.tmp6402 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6400, %m307$.Node.type* %.tmp6401)
%.tmp6403 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6404 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6364
%.tmp6405 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6404, i32 0, i32 3
%.tmp6406 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6405
%.tmp6407 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6403, %m1861$.Type.type* %.tmp6406)
%.tmp6408 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6364
%.tmp6409 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6408)
%.tmp6410 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6379
%.tmp6411 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6410)
%.tmp6412 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6395, i8* %.tmp6397, i8* %.tmp6399, i8* %.tmp6402, i8* %.tmp6407, i8* %.tmp6409, i8* %.tmp6411)
%.tmp6413 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6386
ret %m1861$.AssignableInfo.type* %.tmp6413
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6414 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6415 = icmp eq %m307$.Node.type* %.tmp6414, null
br i1 %.tmp6415, label %.if.true.6416, label %.if.false.6416
.if.true.6416:
%.tmp6417 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6418 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6420 = getelementptr [31 x i8], [31 x i8]*@.str6419, i32 0, i32 0
%.tmp6421 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6417, %m307$.Node.type* %.tmp6418, i8* %.tmp6420)
%.tmp6422 = call i32(i8*,...) @printf(i8* %.tmp6421)
br label %.if.end.6416
.if.false.6416:
br label %.if.end.6416
.if.end.6416:
%.tmp6423 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6424 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6423, i32 0, i32 1
%.tmp6425 = load i8*, i8** %.tmp6424
%.tmp6427 = getelementptr [2 x i8], [2 x i8]*@.str6426, i32 0, i32 0
%.tmp6428 = call i32(i8*,i8*) @strcmp(i8* %.tmp6425, i8* %.tmp6427)
%.tmp6429 = icmp eq i32 %.tmp6428, 0
br i1 %.tmp6429, label %.if.true.6430, label %.if.false.6430
.if.true.6430:
%.tmp6432 = getelementptr [4 x i8], [4 x i8]*@.str6431, i32 0, i32 0
ret i8* %.tmp6432
br label %.if.end.6430
.if.false.6430:
%.tmp6433 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6434 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6433, i32 0, i32 1
%.tmp6435 = load i8*, i8** %.tmp6434
%.tmp6437 = getelementptr [2 x i8], [2 x i8]*@.str6436, i32 0, i32 0
%.tmp6438 = call i32(i8*,i8*) @strcmp(i8* %.tmp6435, i8* %.tmp6437)
%.tmp6439 = icmp eq i32 %.tmp6438, 0
br i1 %.tmp6439, label %.if.true.6440, label %.if.false.6440
.if.true.6440:
%.tmp6442 = getelementptr [4 x i8], [4 x i8]*@.str6441, i32 0, i32 0
ret i8* %.tmp6442
br label %.if.end.6440
.if.false.6440:
%.tmp6443 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6444 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6443, i32 0, i32 1
%.tmp6445 = load i8*, i8** %.tmp6444
%.tmp6447 = getelementptr [2 x i8], [2 x i8]*@.str6446, i32 0, i32 0
%.tmp6448 = call i32(i8*,i8*) @strcmp(i8* %.tmp6445, i8* %.tmp6447)
%.tmp6449 = icmp eq i32 %.tmp6448, 0
br i1 %.tmp6449, label %.if.true.6450, label %.if.false.6450
.if.true.6450:
%.tmp6452 = getelementptr [4 x i8], [4 x i8]*@.str6451, i32 0, i32 0
ret i8* %.tmp6452
br label %.if.end.6450
.if.false.6450:
%.tmp6453 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6454 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6453, i32 0, i32 1
%.tmp6455 = load i8*, i8** %.tmp6454
%.tmp6457 = getelementptr [2 x i8], [2 x i8]*@.str6456, i32 0, i32 0
%.tmp6458 = call i32(i8*,i8*) @strcmp(i8* %.tmp6455, i8* %.tmp6457)
%.tmp6459 = icmp eq i32 %.tmp6458, 0
br i1 %.tmp6459, label %.if.true.6460, label %.if.false.6460
.if.true.6460:
%.tmp6462 = getelementptr [5 x i8], [5 x i8]*@.str6461, i32 0, i32 0
ret i8* %.tmp6462
br label %.if.end.6460
.if.false.6460:
%.tmp6463 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6464 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6463, i32 0, i32 1
%.tmp6465 = load i8*, i8** %.tmp6464
%.tmp6467 = getelementptr [3 x i8], [3 x i8]*@.str6466, i32 0, i32 0
%.tmp6468 = call i32(i8*,i8*) @strcmp(i8* %.tmp6465, i8* %.tmp6467)
%.tmp6469 = icmp eq i32 %.tmp6468, 0
br i1 %.tmp6469, label %.if.true.6470, label %.if.false.6470
.if.true.6470:
%.tmp6472 = getelementptr [8 x i8], [8 x i8]*@.str6471, i32 0, i32 0
ret i8* %.tmp6472
br label %.if.end.6470
.if.false.6470:
%.tmp6473 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6474 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6473, i32 0, i32 1
%.tmp6475 = load i8*, i8** %.tmp6474
%.tmp6477 = getelementptr [3 x i8], [3 x i8]*@.str6476, i32 0, i32 0
%.tmp6478 = call i32(i8*,i8*) @strcmp(i8* %.tmp6475, i8* %.tmp6477)
%.tmp6479 = icmp eq i32 %.tmp6478, 0
br i1 %.tmp6479, label %.if.true.6480, label %.if.false.6480
.if.true.6480:
%.tmp6482 = getelementptr [8 x i8], [8 x i8]*@.str6481, i32 0, i32 0
ret i8* %.tmp6482
br label %.if.end.6480
.if.false.6480:
%.tmp6483 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6484 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6483, i32 0, i32 1
%.tmp6485 = load i8*, i8** %.tmp6484
%.tmp6487 = getelementptr [2 x i8], [2 x i8]*@.str6486, i32 0, i32 0
%.tmp6488 = call i32(i8*,i8*) @strcmp(i8* %.tmp6485, i8* %.tmp6487)
%.tmp6489 = icmp eq i32 %.tmp6488, 0
br i1 %.tmp6489, label %.if.true.6490, label %.if.false.6490
.if.true.6490:
%.tmp6492 = getelementptr [9 x i8], [9 x i8]*@.str6491, i32 0, i32 0
ret i8* %.tmp6492
br label %.if.end.6490
.if.false.6490:
%.tmp6493 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6494 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6493, i32 0, i32 1
%.tmp6495 = load i8*, i8** %.tmp6494
%.tmp6497 = getelementptr [2 x i8], [2 x i8]*@.str6496, i32 0, i32 0
%.tmp6498 = call i32(i8*,i8*) @strcmp(i8* %.tmp6495, i8* %.tmp6497)
%.tmp6499 = icmp eq i32 %.tmp6498, 0
br i1 %.tmp6499, label %.if.true.6500, label %.if.false.6500
.if.true.6500:
%.tmp6502 = getelementptr [9 x i8], [9 x i8]*@.str6501, i32 0, i32 0
ret i8* %.tmp6502
br label %.if.end.6500
.if.false.6500:
%.tmp6503 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6504 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6503, i32 0, i32 1
%.tmp6505 = load i8*, i8** %.tmp6504
%.tmp6507 = getelementptr [2 x i8], [2 x i8]*@.str6506, i32 0, i32 0
%.tmp6508 = call i32(i8*,i8*) @strcmp(i8* %.tmp6505, i8* %.tmp6507)
%.tmp6509 = icmp eq i32 %.tmp6508, 0
br i1 %.tmp6509, label %.if.true.6510, label %.if.false.6510
.if.true.6510:
%.tmp6512 = getelementptr [4 x i8], [4 x i8]*@.str6511, i32 0, i32 0
ret i8* %.tmp6512
br label %.if.end.6510
.if.false.6510:
%.tmp6513 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6514 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6513, i32 0, i32 1
%.tmp6515 = load i8*, i8** %.tmp6514
%.tmp6517 = getelementptr [2 x i8], [2 x i8]*@.str6516, i32 0, i32 0
%.tmp6518 = call i32(i8*,i8*) @strcmp(i8* %.tmp6515, i8* %.tmp6517)
%.tmp6519 = icmp eq i32 %.tmp6518, 0
br i1 %.tmp6519, label %.if.true.6520, label %.if.false.6520
.if.true.6520:
%.tmp6522 = getelementptr [3 x i8], [3 x i8]*@.str6521, i32 0, i32 0
ret i8* %.tmp6522
br label %.if.end.6520
.if.false.6520:
%.tmp6523 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6524 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6523, i32 0, i32 1
%.tmp6525 = load i8*, i8** %.tmp6524
%.tmp6527 = getelementptr [3 x i8], [3 x i8]*@.str6526, i32 0, i32 0
%.tmp6528 = call i32(i8*,i8*) @strcmp(i8* %.tmp6525, i8* %.tmp6527)
%.tmp6529 = icmp eq i32 %.tmp6528, 0
br i1 %.tmp6529, label %.if.true.6530, label %.if.false.6530
.if.true.6530:
%.tmp6532 = getelementptr [9 x i8], [9 x i8]*@.str6531, i32 0, i32 0
ret i8* %.tmp6532
br label %.if.end.6530
.if.false.6530:
%.tmp6533 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6534 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6533, i32 0, i32 1
%.tmp6535 = load i8*, i8** %.tmp6534
%.tmp6537 = getelementptr [3 x i8], [3 x i8]*@.str6536, i32 0, i32 0
%.tmp6538 = call i32(i8*,i8*) @strcmp(i8* %.tmp6535, i8* %.tmp6537)
%.tmp6539 = icmp eq i32 %.tmp6538, 0
br i1 %.tmp6539, label %.if.true.6540, label %.if.false.6540
.if.true.6540:
%.tmp6542 = getelementptr [9 x i8], [9 x i8]*@.str6541, i32 0, i32 0
ret i8* %.tmp6542
br label %.if.end.6540
.if.false.6540:
%.tmp6543 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6544 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6543, i32 0, i32 1
%.tmp6545 = load i8*, i8** %.tmp6544
%.tmp6547 = getelementptr [2 x i8], [2 x i8]*@.str6546, i32 0, i32 0
%.tmp6548 = call i32(i8*,i8*) @strcmp(i8* %.tmp6545, i8* %.tmp6547)
%.tmp6549 = icmp eq i32 %.tmp6548, 0
br i1 %.tmp6549, label %.if.true.6550, label %.if.false.6550
.if.true.6550:
%.tmp6552 = getelementptr [5 x i8], [5 x i8]*@.str6551, i32 0, i32 0
ret i8* %.tmp6552
br label %.if.end.6550
.if.false.6550:
%.tmp6553 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6554 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6556 = getelementptr [30 x i8], [30 x i8]*@.str6555, i32 0, i32 0
%.tmp6557 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6553, %m307$.Node.type* %.tmp6554, i8* %.tmp6556)
%.tmp6558 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6559 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6558, i32 0, i32 1
%.tmp6560 = load i8*, i8** %.tmp6559
%.tmp6561 = call i32(i8*,...) @printf(i8* %.tmp6557, i8* %.tmp6560)
br label %.if.end.6550
.if.end.6550:
br label %.if.end.6540
.if.end.6540:
br label %.if.end.6530
.if.end.6530:
br label %.if.end.6520
.if.end.6520:
br label %.if.end.6510
.if.end.6510:
br label %.if.end.6500
.if.end.6500:
br label %.if.end.6490
.if.end.6490:
br label %.if.end.6480
.if.end.6480:
br label %.if.end.6470
.if.end.6470:
br label %.if.end.6460
.if.end.6460:
br label %.if.end.6450
.if.end.6450:
br label %.if.end.6440
.if.end.6440:
br label %.if.end.6430
.if.end.6430:
%.tmp6563 = getelementptr [4 x i8], [4 x i8]*@.str6562, i32 0, i32 0
ret i8* %.tmp6563
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6564 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6565 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6564, %m1861$.Type.type** %type.6565
%.tmp6566 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6567 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6566, i32 0, i32 1
%.tmp6568 = load i8*, i8** %.tmp6567
%.tmp6570 = getelementptr [3 x i8], [3 x i8]*@.str6569, i32 0, i32 0
%.tmp6571 = call i32(i8*,i8*) @strcmp(i8* %.tmp6568, i8* %.tmp6570)
%.tmp6572 = icmp eq i32 %.tmp6571, 0
%.tmp6573 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6574 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6573, i32 0, i32 1
%.tmp6575 = load i8*, i8** %.tmp6574
%.tmp6577 = getelementptr [3 x i8], [3 x i8]*@.str6576, i32 0, i32 0
%.tmp6578 = call i32(i8*,i8*) @strcmp(i8* %.tmp6575, i8* %.tmp6577)
%.tmp6579 = icmp eq i32 %.tmp6578, 0
%.tmp6580 = or i1 %.tmp6572, %.tmp6579
%.tmp6581 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6582 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6581, i32 0, i32 1
%.tmp6583 = load i8*, i8** %.tmp6582
%.tmp6585 = getelementptr [2 x i8], [2 x i8]*@.str6584, i32 0, i32 0
%.tmp6586 = call i32(i8*,i8*) @strcmp(i8* %.tmp6583, i8* %.tmp6585)
%.tmp6587 = icmp eq i32 %.tmp6586, 0
%.tmp6588 = or i1 %.tmp6580, %.tmp6587
%.tmp6589 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6590 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6589, i32 0, i32 1
%.tmp6591 = load i8*, i8** %.tmp6590
%.tmp6593 = getelementptr [2 x i8], [2 x i8]*@.str6592, i32 0, i32 0
%.tmp6594 = call i32(i8*,i8*) @strcmp(i8* %.tmp6591, i8* %.tmp6593)
%.tmp6595 = icmp eq i32 %.tmp6594, 0
%.tmp6596 = or i1 %.tmp6588, %.tmp6595
%.tmp6597 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6598 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6597, i32 0, i32 1
%.tmp6599 = load i8*, i8** %.tmp6598
%.tmp6601 = getelementptr [2 x i8], [2 x i8]*@.str6600, i32 0, i32 0
%.tmp6602 = call i32(i8*,i8*) @strcmp(i8* %.tmp6599, i8* %.tmp6601)
%.tmp6603 = icmp eq i32 %.tmp6602, 0
%.tmp6604 = or i1 %.tmp6596, %.tmp6603
%.tmp6605 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6606 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6605, i32 0, i32 1
%.tmp6607 = load i8*, i8** %.tmp6606
%.tmp6609 = getelementptr [2 x i8], [2 x i8]*@.str6608, i32 0, i32 0
%.tmp6610 = call i32(i8*,i8*) @strcmp(i8* %.tmp6607, i8* %.tmp6609)
%.tmp6611 = icmp eq i32 %.tmp6610, 0
%.tmp6612 = or i1 %.tmp6604, %.tmp6611
%.tmp6613 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6614 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6613, i32 0, i32 1
%.tmp6615 = load i8*, i8** %.tmp6614
%.tmp6617 = getelementptr [3 x i8], [3 x i8]*@.str6616, i32 0, i32 0
%.tmp6618 = call i32(i8*,i8*) @strcmp(i8* %.tmp6615, i8* %.tmp6617)
%.tmp6619 = icmp eq i32 %.tmp6618, 0
%.tmp6620 = or i1 %.tmp6612, %.tmp6619
%.tmp6621 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6622 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6621, i32 0, i32 1
%.tmp6623 = load i8*, i8** %.tmp6622
%.tmp6625 = getelementptr [3 x i8], [3 x i8]*@.str6624, i32 0, i32 0
%.tmp6626 = call i32(i8*,i8*) @strcmp(i8* %.tmp6623, i8* %.tmp6625)
%.tmp6627 = icmp eq i32 %.tmp6626, 0
%.tmp6628 = or i1 %.tmp6620, %.tmp6627
br i1 %.tmp6628, label %.if.true.6629, label %.if.false.6629
.if.true.6629:
%.tmp6630 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6565
%.tmp6631 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6630, i32 0, i32 0
%.tmp6633 = getelementptr [5 x i8], [5 x i8]*@.str6632, i32 0, i32 0
store i8* %.tmp6633, i8** %.tmp6631
br label %.if.end.6629
.if.false.6629:
%.tmp6634 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6565
%.tmp6635 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6634, i32 0, i32 0
%.tmp6637 = getelementptr [4 x i8], [4 x i8]*@.str6636, i32 0, i32 0
store i8* %.tmp6637, i8** %.tmp6635
br label %.if.end.6629
.if.end.6629:
%.tmp6638 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6565
ret %m1861$.Type.type* %.tmp6638
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6639 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6640 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6639, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6641 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6642 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6641, %m307$.Node.type** %mono.6642
%err_buf.6643 = alloca i8*
store i8* null, i8** %err_buf.6643
%buf.6644 = alloca i8*
store i8* null, i8** %buf.6644
%.tmp6645 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6646 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6645, i32 0, i32 6
%.tmp6647 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6646
%.tmp6648 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6647, i32 0, i32 0
%.tmp6649 = load i8*, i8** %.tmp6648
%.tmp6651 = getelementptr [7 x i8], [7 x i8]*@.str6650, i32 0, i32 0
%.tmp6652 = call i32(i8*,i8*) @strcmp(i8* %.tmp6649, i8* %.tmp6651)
%.tmp6653 = icmp eq i32 %.tmp6652, 0
br i1 %.tmp6653, label %.if.true.6654, label %.if.false.6654
.if.true.6654:
%.tmp6655 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6656 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6655)
store %m1861$.AssignableInfo.type* %.tmp6656, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6657 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6658 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6657, i32 0, i32 3
%.tmp6659 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6659, %m1861$.Type.type** %.tmp6658
%.tmp6660 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6661 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6660, i32 0, i32 3
%.tmp6662 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6661
%.tmp6663 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6662, i32 0, i32 0
%.tmp6665 = getelementptr [4 x i8], [4 x i8]*@.str6664, i32 0, i32 0
store i8* %.tmp6665, i8** %.tmp6663
%.tmp6666 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6667 = load i8, i8* @SCOPE_CONST
%.tmp6668 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6669 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6668, i32 0, i32 6
%.tmp6670 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6669
%.tmp6671 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6670, i32 0, i32 1
%.tmp6672 = load i8*, i8** %.tmp6671
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6666, i8 %.tmp6667, i8* %.tmp6672)
br label %.if.end.6654
.if.false.6654:
%.tmp6673 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6674 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6673, i32 0, i32 6
%.tmp6675 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6674
%.tmp6676 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6675, i32 0, i32 0
%.tmp6677 = load i8*, i8** %.tmp6676
%.tmp6679 = getelementptr [5 x i8], [5 x i8]*@.str6678, i32 0, i32 0
%.tmp6680 = call i32(i8*,i8*) @strcmp(i8* %.tmp6677, i8* %.tmp6679)
%.tmp6681 = icmp eq i32 %.tmp6680, 0
br i1 %.tmp6681, label %.if.true.6682, label %.if.false.6682
.if.true.6682:
%.tmp6683 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6684 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6683, i32 0, i32 6
%.tmp6685 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6684
%.tmp6686 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6685, i32 0, i32 1
%.tmp6687 = load i8*, i8** %.tmp6686
%.tmp6689 = getelementptr [5 x i8], [5 x i8]*@.str6688, i32 0, i32 0
%.tmp6690 = call i32(i8*,i8*) @strcmp(i8* %.tmp6687, i8* %.tmp6689)
%.tmp6691 = icmp ne i32 %.tmp6690, 0
br i1 %.tmp6691, label %.if.true.6692, label %.if.false.6692
.if.true.6692:
%.tmp6693 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6694 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6696 = getelementptr [42 x i8], [42 x i8]*@.str6695, i32 0, i32 0
%.tmp6697 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6693, %m307$.Node.type* %.tmp6694, i8* %.tmp6696)
%.tmp6698 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6699 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6698, i32 0, i32 6
%.tmp6700 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6699
%.tmp6701 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6700, i32 0, i32 1
%.tmp6702 = load i8*, i8** %.tmp6701
%.tmp6703 = call i32(i8*,...) @printf(i8* %.tmp6697, i8* %.tmp6702)
%.tmp6704 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6704
br label %.if.end.6692
.if.false.6692:
br label %.if.end.6692
.if.end.6692:
%.tmp6705 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6706 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6705)
store %m1861$.AssignableInfo.type* %.tmp6706, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6708 = load i8, i8* @SCOPE_CONST
%.tmp6710 = getelementptr [5 x i8], [5 x i8]*@.str6709, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6707, i8 %.tmp6708, i8* %.tmp6710)
%.tmp6711 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6712 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6711, i32 0, i32 3
%.tmp6713 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6713, %m1861$.Type.type** %.tmp6712
%.tmp6714 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6715 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6714, i32 0, i32 3
%.tmp6716 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6715
%.tmp6717 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6716, i32 0, i32 0
%.tmp6719 = getelementptr [8 x i8], [8 x i8]*@.str6718, i32 0, i32 0
store i8* %.tmp6719, i8** %.tmp6717
br label %.if.end.6682
.if.false.6682:
%.tmp6720 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6721 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6720, i32 0, i32 6
%.tmp6722 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6721
%.tmp6723 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6722, i32 0, i32 0
%.tmp6724 = load i8*, i8** %.tmp6723
%.tmp6726 = getelementptr [17 x i8], [17 x i8]*@.str6725, i32 0, i32 0
%.tmp6727 = call i32(i8*,i8*) @strcmp(i8* %.tmp6724, i8* %.tmp6726)
%.tmp6728 = icmp eq i32 %.tmp6727, 0
br i1 %.tmp6728, label %.if.true.6729, label %.if.false.6729
.if.true.6729:
%.tmp6730 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6731 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6730)
store %m1861$.AssignableInfo.type* %.tmp6731, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6732 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6733 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6732, i32 0, i32 6
%.tmp6734 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6733
%.tmp6735 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6734, i32 0, i32 6
%.tmp6736 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6735
%.tmp6738 = getelementptr [12 x i8], [12 x i8]*@.str6737, i32 0, i32 0
%.tmp6739 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6736, i8* %.tmp6738)
%dest.6740 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6739, %m307$.Node.type** %dest.6740
%.tmp6741 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6742 = load %m307$.Node.type*, %m307$.Node.type** %dest.6740
%.tmp6743 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6741, %m307$.Node.type* %.tmp6742)
%var_info.6744 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6743, %m1861$.AssignableInfo.type** %var_info.6744
%.tmp6745 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6744
%.tmp6746 = icmp eq %m1861$.AssignableInfo.type* %.tmp6745, null
br i1 %.tmp6746, label %.if.true.6747, label %.if.false.6747
.if.true.6747:
%.tmp6748 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
ret %m1861$.AssignableInfo.type* %.tmp6748
br label %.if.end.6747
.if.false.6747:
br label %.if.end.6747
.if.end.6747:
%.tmp6749 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6750 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6744
%.tmp6751 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6750, i32 0, i32 3
%.tmp6752 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6751
%.tmp6753 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6749, %m1861$.Type.type* %.tmp6752)
%var_type_repr.6754 = alloca i8*
store i8* %.tmp6753, i8** %var_type_repr.6754
%.tmp6755 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6756 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6755, %m1861$.AssignableInfo.type* %.tmp6756)
%.tmp6757 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6758 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6757, i32 0, i32 3
%.tmp6759 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6744
%.tmp6760 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6759, i32 0, i32 3
%.tmp6761 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6760
store %m1861$.Type.type* %.tmp6761, %m1861$.Type.type** %.tmp6758
%.tmp6763 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6764 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6763, i32 0, i32 6
%.tmp6765 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6764
%.tmp6766 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6765, i32 0, i32 6
%.tmp6767 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6766
%ptr.6768 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6767, %m307$.Node.type** %ptr.6768
br label %.for.start.6762
.for.start.6762:
%.tmp6769 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6768
%.tmp6770 = load %m307$.Node.type*, %m307$.Node.type** %dest.6740
%.tmp6771 = icmp ne %m307$.Node.type* %.tmp6769, %.tmp6770
br i1 %.tmp6771, label %.for.continue.6762, label %.for.end.6762
.for.continue.6762:
%.tmp6772 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6773 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6772, %m1861$.Type.type** %type.6773
%.tmp6774 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6773
%.tmp6775 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6774, i32 0, i32 3
%.tmp6776 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6777 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6776, i32 0, i32 3
%.tmp6778 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6777
store %m1861$.Type.type* %.tmp6778, %m1861$.Type.type** %.tmp6775
%.tmp6779 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6773
%.tmp6780 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6779, i32 0, i32 0
%.tmp6782 = getelementptr [4 x i8], [4 x i8]*@.str6781, i32 0, i32 0
store i8* %.tmp6782, i8** %.tmp6780
%.tmp6783 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6784 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6783, i32 0, i32 3
%.tmp6785 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6773
store %m1861$.Type.type* %.tmp6785, %m1861$.Type.type** %.tmp6784
%.tmp6786 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6768
%.tmp6787 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6786, i32 0, i32 7
%.tmp6788 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6787
store %m307$.Node.type* %.tmp6788, %m307$.Node.type** %ptr.6768
br label %.for.start.6762
.for.end.6762:
%.tmp6789 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6790 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6789, i32 0, i32 6
%.tmp6791 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6790
%.tmp6792 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6791, i32 0, i32 6
%.tmp6793 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6792
%.tmp6794 = load %m307$.Node.type*, %m307$.Node.type** %dest.6740
%.tmp6795 = icmp ne %m307$.Node.type* %.tmp6793, %.tmp6794
br i1 %.tmp6795, label %.if.true.6796, label %.if.false.6796
.if.true.6796:
%.tmp6797 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6798 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6797, i32 0, i32 1
%.tmp6799 = load %m0$.File.type*, %m0$.File.type** %.tmp6798
%.tmp6801 = getelementptr [38 x i8], [38 x i8]*@.str6800, i32 0, i32 0
%.tmp6802 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6803 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6802)
%.tmp6804 = load i8*, i8** %var_type_repr.6754
%.tmp6805 = load i8*, i8** %var_type_repr.6754
%.tmp6806 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6744
%.tmp6807 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6806)
%.tmp6808 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6799, i8* %.tmp6801, i8* %.tmp6803, i8* %.tmp6804, i8* %.tmp6805, i8* %.tmp6807)
br label %.if.end.6796
.if.false.6796:
%.tmp6809 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6810 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6809, i32 0, i32 1
%.tmp6811 = load %m0$.File.type*, %m0$.File.type** %.tmp6810
%.tmp6813 = getelementptr [22 x i8], [22 x i8]*@.str6812, i32 0, i32 0
%.tmp6814 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6815 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6814)
%.tmp6816 = load i8*, i8** %var_type_repr.6754
%.tmp6817 = load i8*, i8** %var_type_repr.6754
%.tmp6818 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6744
%.tmp6819 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6818)
%.tmp6820 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6811, i8* %.tmp6813, i8* %.tmp6815, i8* %.tmp6816, i8* %.tmp6817, i8* %.tmp6819)
br label %.if.end.6796
.if.end.6796:
br label %.if.end.6729
.if.false.6729:
%.tmp6821 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6822 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6821, i32 0, i32 6
%.tmp6823 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6822
%.tmp6824 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6823, i32 0, i32 0
%.tmp6825 = load i8*, i8** %.tmp6824
%.tmp6827 = getelementptr [8 x i8], [8 x i8]*@.str6826, i32 0, i32 0
%.tmp6828 = call i32(i8*,i8*) @strcmp(i8* %.tmp6825, i8* %.tmp6827)
%.tmp6829 = icmp eq i32 %.tmp6828, 0
br i1 %.tmp6829, label %.if.true.6830, label %.if.false.6830
.if.true.6830:
%.tmp6831 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6832 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6831)
store %m1861$.AssignableInfo.type* %.tmp6832, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6833 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6834 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6833, i32 0, i32 3
%.tmp6835 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6835, %m1861$.Type.type** %.tmp6834
%.tmp6836 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6837 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6836, i32 0, i32 3
%.tmp6838 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6837
%.tmp6839 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6838, i32 0, i32 0
%.tmp6841 = getelementptr [5 x i8], [5 x i8]*@.str6840, i32 0, i32 0
store i8* %.tmp6841, i8** %.tmp6839
%.tmp6842 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6843 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6842, i32 0, i32 6
%.tmp6844 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6843
%.tmp6845 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6844, i32 0, i32 6
%.tmp6846 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6845
%.tmp6847 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6846, i32 0, i32 1
%.tmp6848 = load i8*, i8** %.tmp6847
%.tmp6850 = getelementptr [6 x i8], [6 x i8]*@.str6849, i32 0, i32 0
%.tmp6851 = call i32(i8*,i8*) @strcmp(i8* %.tmp6848, i8* %.tmp6850)
%.tmp6852 = icmp eq i32 %.tmp6851, 0
br i1 %.tmp6852, label %.if.true.6853, label %.if.false.6853
.if.true.6853:
%.tmp6854 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6855 = load i8, i8* @SCOPE_CONST
%.tmp6857 = getelementptr [2 x i8], [2 x i8]*@.str6856, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6854, i8 %.tmp6855, i8* %.tmp6857)
br label %.if.end.6853
.if.false.6853:
%.tmp6858 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6859 = load i8, i8* @SCOPE_CONST
%.tmp6861 = getelementptr [2 x i8], [2 x i8]*@.str6860, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6858, i8 %.tmp6859, i8* %.tmp6861)
br label %.if.end.6853
.if.end.6853:
br label %.if.end.6830
.if.false.6830:
%.tmp6862 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6863 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6862, i32 0, i32 6
%.tmp6864 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6863
%.tmp6865 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6864, i32 0, i32 0
%.tmp6866 = load i8*, i8** %.tmp6865
%.tmp6868 = getelementptr [8 x i8], [8 x i8]*@.str6867, i32 0, i32 0
%.tmp6869 = call i32(i8*,i8*) @strcmp(i8* %.tmp6866, i8* %.tmp6868)
%.tmp6870 = icmp eq i32 %.tmp6869, 0
br i1 %.tmp6870, label %.if.true.6871, label %.if.false.6871
.if.true.6871:
%.tmp6872 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6873 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6874 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6873, i32 0, i32 6
%.tmp6875 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6874
%.tmp6876 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6875, i32 0, i32 6
%.tmp6877 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6876
%.tmp6878 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6872, %m307$.Node.type* %.tmp6877)
store %m1861$.AssignableInfo.type* %.tmp6878, %m1861$.AssignableInfo.type** %assignable_info.6640
br label %.if.end.6871
.if.false.6871:
%.tmp6879 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6880 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6879, i32 0, i32 6
%.tmp6881 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6880
%.tmp6882 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6881, i32 0, i32 0
%.tmp6883 = load i8*, i8** %.tmp6882
%.tmp6885 = getelementptr [7 x i8], [7 x i8]*@.str6884, i32 0, i32 0
%.tmp6886 = call i32(i8*,i8*) @strcmp(i8* %.tmp6883, i8* %.tmp6885)
%.tmp6887 = icmp eq i32 %.tmp6886, 0
br i1 %.tmp6887, label %.if.true.6888, label %.if.false.6888
.if.true.6888:
%.tmp6889 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6890 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6891 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6890, i32 0, i32 6
%.tmp6892 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6891
%.tmp6893 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6892, i32 0, i32 1
%.tmp6894 = load i8*, i8** %.tmp6893
%.tmp6895 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp6889, i8* %.tmp6894)
%string_info.6896 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6895, %m1861$.AssignableInfo.type** %string_info.6896
%.tmp6897 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6898 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6897)
store %m1861$.AssignableInfo.type* %.tmp6898, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6899 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6900 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6899, %m1861$.AssignableInfo.type* %.tmp6900)
%.tmp6901 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6902 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6896
%.tmp6903 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6902, i32 0, i32 3
%.tmp6904 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6903
%.tmp6905 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6901, %m1861$.Type.type* %.tmp6904)
%str_tr.6906 = alloca i8*
store i8* %.tmp6905, i8** %str_tr.6906
%.tmp6907 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6908 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6907, i32 0, i32 1
%.tmp6909 = load %m0$.File.type*, %m0$.File.type** %.tmp6908
%.tmp6911 = getelementptr [44 x i8], [44 x i8]*@.str6910, i32 0, i32 0
%.tmp6912 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6913 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6912)
%.tmp6914 = load i8*, i8** %str_tr.6906
%.tmp6915 = load i8*, i8** %str_tr.6906
%.tmp6916 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6896
%.tmp6917 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6916)
%.tmp6918 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6909, i8* %.tmp6911, i8* %.tmp6913, i8* %.tmp6914, i8* %.tmp6915, i8* %.tmp6917)
%.tmp6919 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6920 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6919, i32 0, i32 3
%.tmp6921 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6921, %m1861$.Type.type** %.tmp6920
%.tmp6922 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6923 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6922, i32 0, i32 3
%.tmp6924 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6923
%.tmp6925 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6924, i32 0, i32 0
%.tmp6927 = getelementptr [4 x i8], [4 x i8]*@.str6926, i32 0, i32 0
store i8* %.tmp6927, i8** %.tmp6925
%.tmp6928 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6929 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6928, i32 0, i32 3
%.tmp6930 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6929
%.tmp6931 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6930, i32 0, i32 3
%.tmp6932 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6932, %m1861$.Type.type** %.tmp6931
%.tmp6933 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6934 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6933, i32 0, i32 3
%.tmp6935 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6934
%.tmp6936 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6935, i32 0, i32 3
%.tmp6937 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6936
%.tmp6938 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6937, i32 0, i32 0
%.tmp6940 = getelementptr [4 x i8], [4 x i8]*@.str6939, i32 0, i32 0
store i8* %.tmp6940, i8** %.tmp6938
br label %.if.end.6888
.if.false.6888:
%.tmp6941 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6942 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6941, i32 0, i32 6
%.tmp6943 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6942
%.tmp6944 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6943, i32 0, i32 0
%.tmp6945 = load i8*, i8** %.tmp6944
%.tmp6947 = getelementptr [4 x i8], [4 x i8]*@.str6946, i32 0, i32 0
%.tmp6948 = call i32(i8*,i8*) @strcmp(i8* %.tmp6945, i8* %.tmp6947)
%.tmp6949 = icmp eq i32 %.tmp6948, 0
br i1 %.tmp6949, label %.if.true.6950, label %.if.false.6950
.if.true.6950:
%.tmp6951 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6952 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6951)
store %m1861$.AssignableInfo.type* %.tmp6952, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6953 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6954 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6953, i32 0, i32 6
%.tmp6955 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6954
%.tmp6956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6955, i32 0, i32 1
%.tmp6957 = load i8*, i8** %.tmp6956
%.tmp6958 = call i32(i8*) @strlen(i8* %.tmp6957)
%chr_len.6959 = alloca i32
store i32 %.tmp6958, i32* %chr_len.6959
%.tmp6960 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6961 = load i8, i8* @SCOPE_CONST
%.tmp6963 = getelementptr [2 x i8], [2 x i8]*@.str6962, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6960, i8 %.tmp6961, i8* %.tmp6963)
%.tmp6964 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6965 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6964, i32 0, i32 0
%.tmp6966 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6967 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6966, i32 0, i32 6
%.tmp6968 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6967
%.tmp6969 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6968, i32 0, i32 1
%.tmp6970 = load i8*, i8** %.tmp6969
%.tmp6971 = call i8*(i8*) @m2233$chr_to_llvm.cp.cp(i8* %.tmp6970)
store i8* %.tmp6971, i8** %.tmp6965
%.tmp6972 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6973 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6972, i32 0, i32 0
%.tmp6974 = load i8*, i8** %.tmp6973
%.tmp6975 = icmp eq i8* %.tmp6974, null
br i1 %.tmp6975, label %.if.true.6976, label %.if.false.6976
.if.true.6976:
%.tmp6977 = getelementptr i8*, i8** %err_buf.6643, i32 0
%.tmp6979 = getelementptr [22 x i8], [22 x i8]*@.str6978, i32 0, i32 0
%.tmp6980 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6981 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6980, i32 0, i32 6
%.tmp6982 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6981
%.tmp6983 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6982, i32 0, i32 1
%.tmp6984 = load i8*, i8** %.tmp6983
%.tmp6985 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6977, i8* %.tmp6979, i8* %.tmp6984)
%.tmp6986 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6986
br label %.if.end.6976
.if.false.6976:
br label %.if.end.6976
.if.end.6976:
%.tmp6987 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6988 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6987, i32 0, i32 3
%.tmp6989 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6989, %m1861$.Type.type** %.tmp6988
%.tmp6990 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp6991 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6990, i32 0, i32 3
%.tmp6992 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6991
%.tmp6993 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6992, i32 0, i32 0
%.tmp6995 = getelementptr [4 x i8], [4 x i8]*@.str6994, i32 0, i32 0
store i8* %.tmp6995, i8** %.tmp6993
br label %.if.end.6950
.if.false.6950:
%.tmp6996 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6997 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp6999 = getelementptr [40 x i8], [40 x i8]*@.str6998, i32 0, i32 0
%.tmp7000 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6996, %m307$.Node.type* %.tmp6997, i8* %.tmp6999)
%.tmp7001 = load %m307$.Node.type*, %m307$.Node.type** %mono.6642
%.tmp7002 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7001, i32 0, i32 6
%.tmp7003 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7002
%.tmp7004 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7003, i32 0, i32 0
%.tmp7005 = load i8*, i8** %.tmp7004
%.tmp7006 = call i32(i8*,...) @printf(i8* %.tmp7000, i8* %.tmp7005)
%.tmp7007 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7007
br label %.if.end.6950
.if.end.6950:
br label %.if.end.6888
.if.end.6888:
br label %.if.end.6871
.if.end.6871:
br label %.if.end.6830
.if.end.6830:
br label %.if.end.6729
.if.end.6729:
br label %.if.end.6682
.if.end.6682:
br label %.if.end.6654
.if.end.6654:
%.tmp7008 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp7009 = icmp eq %m1861$.AssignableInfo.type* %.tmp7008, null
br i1 %.tmp7009, label %.if.true.7010, label %.if.false.7010
.if.true.7010:
%.tmp7011 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7011
br label %.if.end.7010
.if.false.7010:
br label %.if.end.7010
.if.end.7010:
%.tmp7012 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp7013 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7012, i32 0, i32 4
%.tmp7014 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7015 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7014, i32 0, i32 3
%.tmp7016 = load i32, i32* %.tmp7015
store i32 %.tmp7016, i32* %.tmp7013
%.tmp7017 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp7018 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7017, i32 0, i32 5
%.tmp7019 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7020 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7019, i32 0, i32 4
%.tmp7021 = load i32, i32* %.tmp7020
store i32 %.tmp7021, i32* %.tmp7018
%.tmp7022 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6640
%.tmp7023 = bitcast %m1861$.AssignableInfo.type* %.tmp7022 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7023
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7024 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7025 = icmp ne %m1861$.Type.type* %.tmp7024, null
%.tmp7027 = getelementptr [22 x i8], [22 x i8]*@.str7026, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7025, i8* %.tmp7027)
%.tmp7028 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7029 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7028, i32 0, i32 0
%.tmp7030 = load i8*, i8** %.tmp7029
%.tmp7031 = icmp ne i8* %.tmp7030, null
%.tmp7033 = getelementptr [59 x i8], [59 x i8]*@.str7032, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7031, i8* %.tmp7033)
%.tmp7034 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7035 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7034, i32 0, i32 0
%.tmp7036 = load i8*, i8** %.tmp7035
%.tmp7038 = getelementptr [4 x i8], [4 x i8]*@.str7037, i32 0, i32 0
%.tmp7039 = call i32(i8*,i8*) @strcmp(i8* %.tmp7036, i8* %.tmp7038)
%.tmp7040 = icmp eq i32 %.tmp7039, 0
br i1 %.tmp7040, label %.if.true.7041, label %.if.false.7041
.if.true.7041:
%.tmp7043 = getelementptr [2 x i8], [2 x i8]*@.str7042, i32 0, i32 0
ret i8* %.tmp7043
br label %.if.end.7041
.if.false.7041:
%.tmp7044 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7045 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7044, i32 0, i32 0
%.tmp7046 = load i8*, i8** %.tmp7045
%.tmp7048 = getelementptr [5 x i8], [5 x i8]*@.str7047, i32 0, i32 0
%.tmp7049 = call i32(i8*,i8*) @strcmp(i8* %.tmp7046, i8* %.tmp7048)
%.tmp7050 = icmp eq i32 %.tmp7049, 0
br i1 %.tmp7050, label %.if.true.7051, label %.if.false.7051
.if.true.7051:
%.tmp7053 = getelementptr [2 x i8], [2 x i8]*@.str7052, i32 0, i32 0
ret i8* %.tmp7053
br label %.if.end.7051
.if.false.7051:
%.tmp7054 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7055 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7054, i32 0, i32 0
%.tmp7056 = load i8*, i8** %.tmp7055
%.tmp7058 = getelementptr [5 x i8], [5 x i8]*@.str7057, i32 0, i32 0
%.tmp7059 = call i32(i8*,i8*) @strcmp(i8* %.tmp7056, i8* %.tmp7058)
%.tmp7060 = icmp eq i32 %.tmp7059, 0
br i1 %.tmp7060, label %.if.true.7061, label %.if.false.7061
.if.true.7061:
%.tmp7063 = getelementptr [2 x i8], [2 x i8]*@.str7062, i32 0, i32 0
ret i8* %.tmp7063
br label %.if.end.7061
.if.false.7061:
%.tmp7064 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7065 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7064, i32 0, i32 0
%.tmp7066 = load i8*, i8** %.tmp7065
%.tmp7068 = getelementptr [4 x i8], [4 x i8]*@.str7067, i32 0, i32 0
%.tmp7069 = call i32(i8*,i8*) @strcmp(i8* %.tmp7066, i8* %.tmp7068)
%.tmp7070 = icmp eq i32 %.tmp7069, 0
br i1 %.tmp7070, label %.if.true.7071, label %.if.false.7071
.if.true.7071:
%.tmp7073 = getelementptr [2 x i8], [2 x i8]*@.str7072, i32 0, i32 0
ret i8* %.tmp7073
br label %.if.end.7071
.if.false.7071:
%.tmp7074 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7075 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7074, i32 0, i32 0
%.tmp7076 = load i8*, i8** %.tmp7075
%.tmp7078 = getelementptr [4 x i8], [4 x i8]*@.str7077, i32 0, i32 0
%.tmp7079 = call i32(i8*,i8*) @strcmp(i8* %.tmp7076, i8* %.tmp7078)
%.tmp7080 = icmp eq i32 %.tmp7079, 0
br i1 %.tmp7080, label %.if.true.7081, label %.if.false.7081
.if.true.7081:
%buf.7082 = alloca i8*
store i8* null, i8** %buf.7082
%.tmp7083 = getelementptr i8*, i8** %buf.7082, i32 0
%.tmp7085 = getelementptr [4 x i8], [4 x i8]*@.str7084, i32 0, i32 0
%.tmp7086 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7087 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7086, i32 0, i32 3
%.tmp7088 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7087
%.tmp7089 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7088)
%.tmp7090 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7083, i8* %.tmp7085, i8* %.tmp7089)
%.tmp7091 = load i8*, i8** %buf.7082
ret i8* %.tmp7091
br label %.if.end.7081
.if.false.7081:
%.tmp7092 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7093 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7092, i32 0, i32 0
%.tmp7094 = load i8*, i8** %.tmp7093
%.tmp7096 = getelementptr [10 x i8], [10 x i8]*@.str7095, i32 0, i32 0
%.tmp7097 = call i32(i8*,i8*) @strcmp(i8* %.tmp7094, i8* %.tmp7096)
%.tmp7098 = icmp eq i32 %.tmp7097, 0
br i1 %.tmp7098, label %.if.true.7099, label %.if.false.7099
.if.true.7099:
%.tmp7100 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7101 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7100, i32 0, i32 2
%.tmp7102 = load i8*, i8** %.tmp7101
ret i8* %.tmp7102
br label %.if.end.7099
.if.false.7099:
%.tmp7103 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7104 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7103, i32 0, i32 0
%.tmp7105 = load i8*, i8** %.tmp7104
%.tmp7107 = getelementptr [7 x i8], [7 x i8]*@.str7106, i32 0, i32 0
%.tmp7108 = call i32(i8*,i8*) @strcmp(i8* %.tmp7105, i8* %.tmp7107)
%.tmp7109 = icmp eq i32 %.tmp7108, 0
br i1 %.tmp7109, label %.if.true.7110, label %.if.false.7110
.if.true.7110:
%.tmp7112 = getelementptr [2 x i8], [2 x i8]*@.str7111, i32 0, i32 0
%buf.7113 = alloca i8*
store i8* %.tmp7112, i8** %buf.7113
%.tmp7115 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7116 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7115, i32 0, i32 3
%.tmp7117 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7116
%t.7118 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7117, %m1861$.Type.type** %t.7118
br label %.for.start.7114
.for.start.7114:
%.tmp7119 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7118
%.tmp7120 = icmp ne %m1861$.Type.type* %.tmp7119, null
br i1 %.tmp7120, label %.for.continue.7114, label %.for.end.7114
.for.continue.7114:
%.tmp7121 = getelementptr i8*, i8** %buf.7113, i32 0
%.tmp7123 = getelementptr [5 x i8], [5 x i8]*@.str7122, i32 0, i32 0
%.tmp7124 = load i8*, i8** %buf.7113
%.tmp7125 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7118
%.tmp7126 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7125)
%.tmp7127 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7121, i8* %.tmp7123, i8* %.tmp7124, i8* %.tmp7126)
%.tmp7128 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7118
%.tmp7129 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7128, i32 0, i32 4
%.tmp7130 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7129
store %m1861$.Type.type* %.tmp7130, %m1861$.Type.type** %t.7118
br label %.for.start.7114
.for.end.7114:
%.tmp7131 = load i8*, i8** %buf.7113
ret i8* %.tmp7131
br label %.if.end.7110
.if.false.7110:
%.tmp7132 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7133 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7132, i32 0, i32 0
%.tmp7134 = load i8*, i8** %.tmp7133
%.tmp7136 = getelementptr [6 x i8], [6 x i8]*@.str7135, i32 0, i32 0
%.tmp7137 = call i32(i8*,i8*) @strcmp(i8* %.tmp7134, i8* %.tmp7136)
%.tmp7138 = icmp eq i32 %.tmp7137, 0
br i1 %.tmp7138, label %.if.true.7139, label %.if.false.7139
.if.true.7139:
%.tmp7141 = getelementptr [2 x i8], [2 x i8]*@.str7140, i32 0, i32 0
ret i8* %.tmp7141
br label %.if.end.7139
.if.false.7139:
%.tmp7143 = getelementptr [45 x i8], [45 x i8]*@.str7142, i32 0, i32 0
%.tmp7144 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7145 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7144, i32 0, i32 0
%.tmp7146 = load i8*, i8** %.tmp7145
%.tmp7147 = call i32(i8*,...) @printf(i8* %.tmp7143, i8* %.tmp7146)
br label %.if.end.7139
.if.end.7139:
br label %.if.end.7110
.if.end.7110:
br label %.if.end.7099
.if.end.7099:
br label %.if.end.7081
.if.end.7081:
br label %.if.end.7071
.if.end.7071:
br label %.if.end.7061
.if.end.7061:
br label %.if.end.7051
.if.end.7051:
br label %.if.end.7041
.if.end.7041:
%.tmp7148 = bitcast ptr null to i8*
ret i8* %.tmp7148
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7149 = bitcast ptr null to %m307$.Node.type*
%.tmp7150 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7149)
%info.7151 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7150, %m1861$.AssignableInfo.type** %info.7151
%tmp_buff.7152 = alloca i8*
store i8* null, i8** %tmp_buff.7152
%.tmp7153 = getelementptr i8*, i8** %tmp_buff.7152, i32 0
%.tmp7155 = getelementptr [7 x i8], [7 x i8]*@.str7154, i32 0, i32 0
%.tmp7156 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7157 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7156)
%.tmp7158 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7153, i8* %.tmp7155, i32 %.tmp7157)
%.tmp7159 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7160 = load i8, i8* @SCOPE_GLOBAL
%.tmp7161 = load i8*, i8** %tmp_buff.7152
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7159, i8 %.tmp7160, i8* %.tmp7161)
%.tmp7162 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7163 = ptrtoint %m1861$.GlobalName.type* %.tmp7162 to i32
%.tmp7164 = call i8*(i32) @malloc(i32 %.tmp7163)
%.tmp7165 = bitcast i8* %.tmp7164 to %m1861$.GlobalName.type*
%global.7166 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7165, %m1861$.GlobalName.type** %global.7166
%.tmp7167 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
%.tmp7168 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7167, i32 0, i32 0
%.tmp7169 = load i8*, i8** %text
%.tmp7170 = call i8*(i8*) @m2233$string_to_llvm.cp.cp(i8* %.tmp7169)
store i8* %.tmp7170, i8** %.tmp7168
%.tmp7171 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7172 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7171, i32 0, i32 3
%.tmp7173 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7173, %m1861$.Type.type** %.tmp7172
%.tmp7174 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7175 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7174, i32 0, i32 3
%.tmp7176 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7175
%.tmp7177 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7176, i32 0, i32 0
%.tmp7179 = getelementptr [6 x i8], [6 x i8]*@.str7178, i32 0, i32 0
store i8* %.tmp7179, i8** %.tmp7177
%.tmp7180 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7181 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7180, i32 0, i32 3
%.tmp7182 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7181
%.tmp7183 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7182, i32 0, i32 3
%.tmp7184 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7184, %m1861$.Type.type** %.tmp7183
%.tmp7185 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7186 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7185, i32 0, i32 3
%.tmp7187 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7186
%.tmp7188 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7187, i32 0, i32 3
%.tmp7189 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7188
%.tmp7190 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7189, i32 0, i32 0
%.tmp7192 = getelementptr [4 x i8], [4 x i8]*@.str7191, i32 0, i32 0
store i8* %.tmp7192, i8** %.tmp7190
%.tmp7193 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7194 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7193, i32 0, i32 3
%.tmp7195 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7194
%.tmp7196 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7195, i32 0, i32 3
%.tmp7197 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7196
%.tmp7198 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7197, i32 0, i32 4
%.tmp7199 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7199, %m1861$.Type.type** %.tmp7198
%.tmp7200 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
%.tmp7201 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7200, i32 0, i32 3
%.tmp7202 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7201
%.tmp7203 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7202, i32 0, i32 3
%.tmp7204 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7203
%.tmp7205 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7204, i32 0, i32 4
%.tmp7206 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7205
%.tmp7207 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7206, i32 0, i32 0
%.tmp7208 = getelementptr i8*, i8** %.tmp7207, i32 0
%.tmp7210 = getelementptr [3 x i8], [3 x i8]*@.str7209, i32 0, i32 0
%.tmp7211 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
%.tmp7212 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7211, i32 0, i32 0
%.tmp7213 = load i8*, i8** %.tmp7212
%.tmp7214 = call i32(i8*) @m2233$llvm_str_len.i.cp(i8* %.tmp7213)
%.tmp7215 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7208, i8* %.tmp7210, i32 %.tmp7214)
%.tmp7216 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
%.tmp7217 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7216, i32 0, i32 1
%.tmp7219 = getelementptr [7 x i8], [7 x i8]*@.str7218, i32 0, i32 0
store i8* %.tmp7219, i8** %.tmp7217
%.tmp7220 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
%.tmp7221 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7220, i32 0, i32 4
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7221
%.tmp7222 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
%.tmp7223 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7222, i32 0, i32 3
%.tmp7224 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
store %m1861$.AssignableInfo.type* %.tmp7224, %m1861$.AssignableInfo.type** %.tmp7223
%.tmp7225 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
%.tmp7226 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7225, i32 0, i32 2
store i1 0, i1* %.tmp7226
%.tmp7227 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7228 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7166
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7227, %m1861$.GlobalName.type* %.tmp7228)
%.tmp7229 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7151
ret %m1861$.AssignableInfo.type* %.tmp7229
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
%.tmp7230 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7231 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7230)
%info.7232 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7231, %m1861$.AssignableInfo.type** %info.7232
%.tmp7233 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7232
%.tmp7234 = load i8, i8* @SCOPE_CONST
%.tmp7235 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7233, i8 %.tmp7234, i8* %.tmp7235)
%.tmp7236 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7232
%.tmp7237 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7236, i32 0, i32 2
%.tmp7239 = getelementptr [7 x i8], [7 x i8]*@.str7238, i32 0, i32 0
store i8* %.tmp7239, i8** %.tmp7237
%.tmp7240 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7232
%.tmp7241 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7240, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7241
%.tmp7242 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7243 = load i8*, i8** %as_name
%.tmp7244 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7232
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7242, i8* %.tmp7243, %m1861$.AssignableInfo.type* %.tmp7244)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7245 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7246 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7245, i32 0, i32 3
%.tmp7247 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7246
%.tmp7248 = icmp eq %m1861$.GlobalName.type* %.tmp7247, null
br i1 %.tmp7248, label %.if.true.7249, label %.if.false.7249
.if.true.7249:
%.tmp7250 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7251 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7250, i32 0, i32 3
%.tmp7252 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7252, %m1861$.GlobalName.type** %.tmp7251
br label %.if.end.7249
.if.false.7249:
%last_global.7253 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %last_global.7253
%.tmp7255 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7256 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7255, i32 0, i32 3
%.tmp7257 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7256
store %m1861$.GlobalName.type* %.tmp7257, %m1861$.GlobalName.type** %last_global.7253
br label %.for.start.7254
.for.start.7254:
%.tmp7258 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7253
%.tmp7259 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7258, i32 0, i32 4
%.tmp7260 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7259
%.tmp7261 = icmp ne %m1861$.GlobalName.type* %.tmp7260, null
br i1 %.tmp7261, label %.for.continue.7254, label %.for.end.7254
.for.continue.7254:
%.tmp7262 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7253
%.tmp7263 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7262, i32 0, i32 4
%.tmp7264 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7263
store %m1861$.GlobalName.type* %.tmp7264, %m1861$.GlobalName.type** %last_global.7253
br label %.for.start.7254
.for.end.7254:
%.tmp7265 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7253
%.tmp7266 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7265, i32 0, i32 4
%.tmp7267 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7267, %m1861$.GlobalName.type** %.tmp7266
br label %.if.end.7249
.if.end.7249:
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7268 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7269 = icmp eq %m1861$.Type.type* %.tmp7268, null
br i1 %.tmp7269, label %.if.true.7270, label %.if.false.7270
.if.true.7270:
%.tmp7271 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7271, label %.if.true.7272, label %.if.false.7272
.if.true.7272:
%.tmp7274 = getelementptr [44 x i8], [44 x i8]*@.str7273, i32 0, i32 0
%.tmp7275 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7276 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7275, i32 0, i32 7
%.tmp7277 = load i8*, i8** %.tmp7276
%.tmp7278 = call i32(i8*,...) @printf(i8* %.tmp7274, i8* %.tmp7277)
br label %.if.end.7272
.if.false.7272:
br label %.if.end.7272
.if.end.7272:
%.tmp7280 = getelementptr [2 x i8], [2 x i8]*@.str7279, i32 0, i32 0
ret i8* %.tmp7280
br label %.if.end.7270
.if.false.7270:
br label %.if.end.7270
.if.end.7270:
%.tmp7281 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7282 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7281, i32 0, i32 0
%.tmp7283 = load i8*, i8** %.tmp7282
%.tmp7284 = icmp ne i8* %.tmp7283, null
%.tmp7286 = getelementptr [59 x i8], [59 x i8]*@.str7285, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7284, i8* %.tmp7286)
%buf.7287 = alloca i8*
store i8* null, i8** %buf.7287
%.tmp7288 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7289 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7288, i32 0, i32 0
%.tmp7290 = load i8*, i8** %.tmp7289
%.tmp7292 = getelementptr [4 x i8], [4 x i8]*@.str7291, i32 0, i32 0
%.tmp7293 = call i32(i8*,i8*) @strcmp(i8* %.tmp7290, i8* %.tmp7292)
%.tmp7294 = icmp eq i32 %.tmp7293, 0
br i1 %.tmp7294, label %.if.true.7295, label %.if.false.7295
.if.true.7295:
%.tmp7297 = getelementptr [4 x i8], [4 x i8]*@.str7296, i32 0, i32 0
ret i8* %.tmp7297
br label %.if.end.7295
.if.false.7295:
%.tmp7298 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7299 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7298, i32 0, i32 0
%.tmp7300 = load i8*, i8** %.tmp7299
%.tmp7302 = getelementptr [5 x i8], [5 x i8]*@.str7301, i32 0, i32 0
%.tmp7303 = call i32(i8*,i8*) @strcmp(i8* %.tmp7300, i8* %.tmp7302)
%.tmp7304 = icmp eq i32 %.tmp7303, 0
br i1 %.tmp7304, label %.if.true.7305, label %.if.false.7305
.if.true.7305:
%.tmp7307 = getelementptr [5 x i8], [5 x i8]*@.str7306, i32 0, i32 0
ret i8* %.tmp7307
br label %.if.end.7305
.if.false.7305:
%.tmp7308 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7309 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7308, i32 0, i32 0
%.tmp7310 = load i8*, i8** %.tmp7309
%.tmp7312 = getelementptr [5 x i8], [5 x i8]*@.str7311, i32 0, i32 0
%.tmp7313 = call i32(i8*,i8*) @strcmp(i8* %.tmp7310, i8* %.tmp7312)
%.tmp7314 = icmp eq i32 %.tmp7313, 0
br i1 %.tmp7314, label %.if.true.7315, label %.if.false.7315
.if.true.7315:
%.tmp7317 = getelementptr [3 x i8], [3 x i8]*@.str7316, i32 0, i32 0
ret i8* %.tmp7317
br label %.if.end.7315
.if.false.7315:
%.tmp7318 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7319 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7318, i32 0, i32 0
%.tmp7320 = load i8*, i8** %.tmp7319
%.tmp7322 = getelementptr [8 x i8], [8 x i8]*@.str7321, i32 0, i32 0
%.tmp7323 = call i32(i8*,i8*) @strcmp(i8* %.tmp7320, i8* %.tmp7322)
%.tmp7324 = icmp eq i32 %.tmp7323, 0
br i1 %.tmp7324, label %.if.true.7325, label %.if.false.7325
.if.true.7325:
%.tmp7327 = getelementptr [4 x i8], [4 x i8]*@.str7326, i32 0, i32 0
ret i8* %.tmp7327
br label %.if.end.7325
.if.false.7325:
%.tmp7328 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7329 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7328, i32 0, i32 0
%.tmp7330 = load i8*, i8** %.tmp7329
%.tmp7332 = getelementptr [4 x i8], [4 x i8]*@.str7331, i32 0, i32 0
%.tmp7333 = call i32(i8*,i8*) @strcmp(i8* %.tmp7330, i8* %.tmp7332)
%.tmp7334 = icmp eq i32 %.tmp7333, 0
br i1 %.tmp7334, label %.if.true.7335, label %.if.false.7335
.if.true.7335:
%.tmp7337 = getelementptr [3 x i8], [3 x i8]*@.str7336, i32 0, i32 0
ret i8* %.tmp7337
br label %.if.end.7335
.if.false.7335:
%.tmp7338 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7339 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7338, i32 0, i32 0
%.tmp7340 = load i8*, i8** %.tmp7339
%.tmp7342 = getelementptr [9 x i8], [9 x i8]*@.str7341, i32 0, i32 0
%.tmp7343 = call i32(i8*,i8*) @strcmp(i8* %.tmp7340, i8* %.tmp7342)
%.tmp7344 = icmp eq i32 %.tmp7343, 0
br i1 %.tmp7344, label %.if.true.7345, label %.if.false.7345
.if.true.7345:
%.tmp7346 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7348 = getelementptr [4 x i8], [4 x i8]*@.str7347, i32 0, i32 0
%.tmp7349 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7350 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7351 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7350, i32 0, i32 3
%.tmp7352 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7351
%.tmp7353 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7349, %m1861$.Type.type* %.tmp7352)
%.tmp7354 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7346, i8* %.tmp7348, i8* %.tmp7353)
%.tmp7356 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7357 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7356, i32 0, i32 3
%.tmp7358 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7357
%.tmp7359 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7358, i32 0, i32 4
%.tmp7360 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7359
%p.7361 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7360, %m1861$.Type.type** %p.7361
br label %.for.start.7355
.for.start.7355:
%.tmp7362 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7361
%.tmp7363 = icmp ne %m1861$.Type.type* %.tmp7362, null
br i1 %.tmp7363, label %.for.continue.7355, label %.for.end.7355
.for.continue.7355:
%.tmp7364 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7361
%.tmp7365 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7366 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7365, i32 0, i32 3
%.tmp7367 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7366
%.tmp7368 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7367, i32 0, i32 4
%.tmp7369 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7368
%.tmp7370 = icmp ne %m1861$.Type.type* %.tmp7364, %.tmp7369
br i1 %.tmp7370, label %.if.true.7371, label %.if.false.7371
.if.true.7371:
%.tmp7372 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7374 = getelementptr [4 x i8], [4 x i8]*@.str7373, i32 0, i32 0
%.tmp7375 = load i8*, i8** %buf.7287
%.tmp7376 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7372, i8* %.tmp7374, i8* %.tmp7375)
br label %.if.end.7371
.if.false.7371:
br label %.if.end.7371
.if.end.7371:
%.tmp7377 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7379 = getelementptr [5 x i8], [5 x i8]*@.str7378, i32 0, i32 0
%.tmp7380 = load i8*, i8** %buf.7287
%.tmp7381 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7382 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7361
%.tmp7383 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7381, %m1861$.Type.type* %.tmp7382)
%.tmp7384 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7377, i8* %.tmp7379, i8* %.tmp7380, i8* %.tmp7383)
%.tmp7385 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7361
%.tmp7386 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7385, i32 0, i32 4
%.tmp7387 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7386
store %m1861$.Type.type* %.tmp7387, %m1861$.Type.type** %p.7361
br label %.for.start.7355
.for.end.7355:
%.tmp7388 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7390 = getelementptr [4 x i8], [4 x i8]*@.str7389, i32 0, i32 0
%.tmp7391 = load i8*, i8** %buf.7287
%.tmp7392 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7388, i8* %.tmp7390, i8* %.tmp7391)
%.tmp7393 = load i8*, i8** %buf.7287
ret i8* %.tmp7393
br label %.if.end.7345
.if.false.7345:
%.tmp7394 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7395 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7394, i32 0, i32 0
%.tmp7396 = load i8*, i8** %.tmp7395
%.tmp7398 = getelementptr [4 x i8], [4 x i8]*@.str7397, i32 0, i32 0
%.tmp7399 = call i32(i8*,i8*) @strcmp(i8* %.tmp7396, i8* %.tmp7398)
%.tmp7400 = icmp eq i32 %.tmp7399, 0
br i1 %.tmp7400, label %.if.true.7401, label %.if.false.7401
.if.true.7401:
%.tmp7402 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7404 = getelementptr [4 x i8], [4 x i8]*@.str7403, i32 0, i32 0
%.tmp7405 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7406 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7407 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7406, i32 0, i32 3
%.tmp7408 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7407
%.tmp7409 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7405, %m1861$.Type.type* %.tmp7408)
%.tmp7410 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7402, i8* %.tmp7404, i8* %.tmp7409)
%.tmp7411 = load i8*, i8** %buf.7287
ret i8* %.tmp7411
br label %.if.end.7401
.if.false.7401:
%.tmp7412 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7413 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7412, i32 0, i32 0
%.tmp7414 = load i8*, i8** %.tmp7413
%.tmp7416 = getelementptr [7 x i8], [7 x i8]*@.str7415, i32 0, i32 0
%.tmp7417 = call i32(i8*,i8*) @strcmp(i8* %.tmp7414, i8* %.tmp7416)
%.tmp7418 = icmp eq i32 %.tmp7417, 0
br i1 %.tmp7418, label %.if.true.7419, label %.if.false.7419
.if.true.7419:
%.tmp7420 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7422 = getelementptr [2 x i8], [2 x i8]*@.str7421, i32 0, i32 0
%.tmp7423 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7420, i8* %.tmp7422)
%.tmp7425 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7426 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7425, i32 0, i32 3
%.tmp7427 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7426
%t.7428 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7427, %m1861$.Type.type** %t.7428
br label %.for.start.7424
.for.start.7424:
%.tmp7429 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7428
%.tmp7430 = icmp ne %m1861$.Type.type* %.tmp7429, null
br i1 %.tmp7430, label %.for.continue.7424, label %.for.end.7424
.for.continue.7424:
%.tmp7431 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7428
%.tmp7432 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7433 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7432, i32 0, i32 3
%.tmp7434 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7433
%.tmp7435 = icmp ne %m1861$.Type.type* %.tmp7431, %.tmp7434
br i1 %.tmp7435, label %.if.true.7436, label %.if.false.7436
.if.true.7436:
%.tmp7437 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7439 = getelementptr [4 x i8], [4 x i8]*@.str7438, i32 0, i32 0
%.tmp7440 = load i8*, i8** %buf.7287
%.tmp7441 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7437, i8* %.tmp7439, i8* %.tmp7440)
br label %.if.end.7436
.if.false.7436:
br label %.if.end.7436
.if.end.7436:
%.tmp7442 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7444 = getelementptr [5 x i8], [5 x i8]*@.str7443, i32 0, i32 0
%.tmp7445 = load i8*, i8** %buf.7287
%.tmp7446 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7447 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7428
%.tmp7448 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7446, %m1861$.Type.type* %.tmp7447)
%.tmp7449 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7442, i8* %.tmp7444, i8* %.tmp7445, i8* %.tmp7448)
%.tmp7450 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7428
%.tmp7451 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7450, i32 0, i32 4
%.tmp7452 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7451
store %m1861$.Type.type* %.tmp7452, %m1861$.Type.type** %t.7428
br label %.for.start.7424
.for.end.7424:
%.tmp7453 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7455 = getelementptr [4 x i8], [4 x i8]*@.str7454, i32 0, i32 0
%.tmp7456 = load i8*, i8** %buf.7287
%.tmp7457 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7453, i8* %.tmp7455, i8* %.tmp7456)
%.tmp7458 = load i8*, i8** %buf.7287
ret i8* %.tmp7458
br label %.if.end.7419
.if.false.7419:
%.tmp7459 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7460 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7459, i32 0, i32 0
%.tmp7461 = load i8*, i8** %.tmp7460
%.tmp7463 = getelementptr [6 x i8], [6 x i8]*@.str7462, i32 0, i32 0
%.tmp7464 = call i32(i8*,i8*) @strcmp(i8* %.tmp7461, i8* %.tmp7463)
%.tmp7465 = icmp eq i32 %.tmp7464, 0
br i1 %.tmp7465, label %.if.true.7466, label %.if.false.7466
.if.true.7466:
%.tmp7467 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7469 = getelementptr [10 x i8], [10 x i8]*@.str7468, i32 0, i32 0
%.tmp7470 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7471 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7470, i32 0, i32 3
%.tmp7472 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7471
%.tmp7473 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7472, i32 0, i32 4
%.tmp7474 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7473
%.tmp7475 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7474, i32 0, i32 0
%.tmp7476 = load i8*, i8** %.tmp7475
%.tmp7477 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7478 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7479 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7478, i32 0, i32 3
%.tmp7480 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7479
%.tmp7481 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7477, %m1861$.Type.type* %.tmp7480)
%.tmp7482 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7467, i8* %.tmp7469, i8* %.tmp7476, i8* %.tmp7481)
%.tmp7483 = load i8*, i8** %buf.7287
ret i8* %.tmp7483
br label %.if.end.7466
.if.false.7466:
%.tmp7484 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7485 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7484, i32 0, i32 0
%.tmp7486 = load i8*, i8** %.tmp7485
%.tmp7488 = getelementptr [10 x i8], [10 x i8]*@.str7487, i32 0, i32 0
%.tmp7489 = call i32(i8*,i8*) @strcmp(i8* %.tmp7486, i8* %.tmp7488)
%.tmp7490 = icmp eq i32 %.tmp7489, 0
br i1 %.tmp7490, label %.if.true.7491, label %.if.false.7491
.if.true.7491:
%.tmp7492 = getelementptr i8*, i8** %buf.7287, i32 0
%.tmp7494 = getelementptr [5 x i8], [5 x i8]*@.str7493, i32 0, i32 0
%.tmp7495 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7496 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7495, i32 0, i32 2
%.tmp7497 = load i8*, i8** %.tmp7496
%.tmp7498 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7492, i8* %.tmp7494, i8* %.tmp7497)
%.tmp7499 = load i8*, i8** %buf.7287
ret i8* %.tmp7499
br label %.if.end.7491
.if.false.7491:
%.tmp7500 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7501 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7500, i32 0, i32 0
%.tmp7502 = load i8*, i8** %.tmp7501
%.tmp7504 = getelementptr [7 x i8], [7 x i8]*@.str7503, i32 0, i32 0
%.tmp7505 = call i32(i8*,i8*) @strcmp(i8* %.tmp7502, i8* %.tmp7504)
%.tmp7506 = icmp eq i32 %.tmp7505, 0
br i1 %.tmp7506, label %.if.true.7507, label %.if.false.7507
.if.true.7507:
%.tmp7509 = getelementptr [4 x i8], [4 x i8]*@.str7508, i32 0, i32 0
ret i8* %.tmp7509
br label %.if.end.7507
.if.false.7507:
%.tmp7510 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7511 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7510, i32 0, i32 0
%.tmp7512 = load i8*, i8** %.tmp7511
%.tmp7514 = getelementptr [6 x i8], [6 x i8]*@.str7513, i32 0, i32 0
%.tmp7515 = call i32(i8*,i8*) @strcmp(i8* %.tmp7512, i8* %.tmp7514)
%.tmp7516 = icmp eq i32 %.tmp7515, 0
br i1 %.tmp7516, label %.if.true.7517, label %.if.false.7517
.if.true.7517:
br label %.if.end.7517
.if.false.7517:
%.tmp7519 = getelementptr [58 x i8], [58 x i8]*@.str7518, i32 0, i32 0
%.tmp7520 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7521 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7520, i32 0, i32 0
%.tmp7522 = load i8*, i8** %.tmp7521
%.tmp7523 = call i32(i8*,...) @printf(i8* %.tmp7519, i8* %.tmp7522)
br label %.if.end.7517
.if.end.7517:
br label %.if.end.7507
.if.end.7507:
br label %.if.end.7491
.if.end.7491:
br label %.if.end.7466
.if.end.7466:
br label %.if.end.7419
.if.end.7419:
br label %.if.end.7401
.if.end.7401:
br label %.if.end.7345
.if.end.7345:
br label %.if.end.7335
.if.end.7335:
br label %.if.end.7325
.if.end.7325:
br label %.if.end.7315
.if.end.7315:
br label %.if.end.7305
.if.end.7305:
br label %.if.end.7295
.if.end.7295:
%.tmp7524 = bitcast ptr null to i8*
ret i8* %.tmp7524
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7525 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7526 = ptrtoint %m1861$.ErrorList.type* %.tmp7525 to i32
%.tmp7527 = call i8*(i32) @malloc(i32 %.tmp7526)
%.tmp7528 = bitcast i8* %.tmp7527 to %m1861$.ErrorList.type*
%new_err.7529 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7528, %m1861$.ErrorList.type** %new_err.7529
%.tmp7530 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7529
%.tmp7531 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7530, i32 0, i32 2
store i1 0, i1* %.tmp7531
%.tmp7532 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7529
%.tmp7533 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7532, i32 0, i32 0
%.tmp7534 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7534, %m751$.Error.type** %.tmp7533
%.tmp7535 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7529
%.tmp7536 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7535, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7536
%.tmp7537 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7538 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7537, i32 0, i32 2
%.tmp7539 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7538
%.tmp7540 = icmp eq %m1861$.ErrorList.type* %.tmp7539, null
br i1 %.tmp7540, label %.if.true.7541, label %.if.false.7541
.if.true.7541:
%.tmp7542 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7543 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7542, i32 0, i32 2
%.tmp7544 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7529
store %m1861$.ErrorList.type* %.tmp7544, %m1861$.ErrorList.type** %.tmp7543
ret void
br label %.if.end.7541
.if.false.7541:
br label %.if.end.7541
.if.end.7541:
%last.7545 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7545
%.tmp7547 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7548 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7547, i32 0, i32 2
%.tmp7549 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7548
store %m1861$.ErrorList.type* %.tmp7549, %m1861$.ErrorList.type** %last.7545
br label %.for.start.7546
.for.start.7546:
%.tmp7550 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7545
%.tmp7551 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7550, i32 0, i32 1
%.tmp7552 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7551
%.tmp7553 = icmp ne %m1861$.ErrorList.type* %.tmp7552, null
br i1 %.tmp7553, label %.for.continue.7546, label %.for.end.7546
.for.continue.7546:
%.tmp7554 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7545
%.tmp7555 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7554, i32 0, i32 1
%.tmp7556 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7555
store %m1861$.ErrorList.type* %.tmp7556, %m1861$.ErrorList.type** %last.7545
br label %.for.start.7546
.for.end.7546:
%.tmp7557 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7545
%.tmp7558 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7557, i32 0, i32 1
%.tmp7559 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7529
store %m1861$.ErrorList.type* %.tmp7559, %m1861$.ErrorList.type** %.tmp7558
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7560 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7561 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7560, i32 0, i32 6
%.tmp7562 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7561
%.tmp7563 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7562, i32 0, i32 7
%.tmp7564 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7563
%.tmp7565 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7564, i32 0, i32 1
%.tmp7566 = load i8*, i8** %.tmp7565
ret i8* %.tmp7566
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7568 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7569 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7568, %m307$.Node.type** %n.7569
br label %.for.start.7567
.for.start.7567:
%.tmp7570 = load %m307$.Node.type*, %m307$.Node.type** %n.7569
%.tmp7571 = icmp ne %m307$.Node.type* %.tmp7570, null
br i1 %.tmp7571, label %.for.continue.7567, label %.for.end.7567
.for.continue.7567:
%.tmp7572 = load %m307$.Node.type*, %m307$.Node.type** %n.7569
%.tmp7573 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7572, i32 0, i32 0
%.tmp7574 = load i8*, i8** %.tmp7573
%.tmp7575 = load i8*, i8** %type
%.tmp7576 = call i32(i8*,i8*) @strcmp(i8* %.tmp7574, i8* %.tmp7575)
%.tmp7577 = icmp eq i32 %.tmp7576, 0
br i1 %.tmp7577, label %.if.true.7578, label %.if.false.7578
.if.true.7578:
%.tmp7579 = load %m307$.Node.type*, %m307$.Node.type** %n.7569
ret %m307$.Node.type* %.tmp7579
br label %.if.end.7578
.if.false.7578:
br label %.if.end.7578
.if.end.7578:
%.tmp7580 = load %m307$.Node.type*, %m307$.Node.type** %n.7569
%.tmp7581 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7580, i32 0, i32 7
%.tmp7582 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7581
store %m307$.Node.type* %.tmp7582, %m307$.Node.type** %n.7569
br label %.for.start.7567
.for.end.7567:
%.tmp7583 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7583
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7584 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7585 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7584, %m1861$.Type.type** %function_type.7585
%.tmp7586 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7587 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7588 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7587, i32 0, i32 6
%.tmp7589 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7588
%.tmp7590 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7586, %m307$.Node.type* %.tmp7589)
%return_value_type.7591 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7590, %m1861$.Type.type** %return_value_type.7591
%.tmp7592 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7585
%.tmp7593 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7592, i32 0, i32 0
%.tmp7595 = getelementptr [9 x i8], [9 x i8]*@.str7594, i32 0, i32 0
store i8* %.tmp7595, i8** %.tmp7593
%.tmp7596 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7585
%.tmp7597 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7596, i32 0, i32 3
%.tmp7598 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7591
store %m1861$.Type.type* %.tmp7598, %m1861$.Type.type** %.tmp7597
%.tmp7599 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7591
%last_type.7600 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7599, %m1861$.Type.type** %last_type.7600
%.tmp7601 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7602 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7601)
%params.7603 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7602, %m307$.Node.type** %params.7603
%.tmp7605 = load %m307$.Node.type*, %m307$.Node.type** %params.7603
%param_ptr.7606 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7605, %m307$.Node.type** %param_ptr.7606
br label %.for.start.7604
.for.start.7604:
%.tmp7607 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7608 = icmp ne %m307$.Node.type* %.tmp7607, null
br i1 %.tmp7608, label %.for.continue.7604, label %.for.end.7604
.for.continue.7604:
%.tmp7609 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7610 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7609, i32 0, i32 0
%.tmp7611 = load i8*, i8** %.tmp7610
%.tmp7613 = getelementptr [5 x i8], [5 x i8]*@.str7612, i32 0, i32 0
%.tmp7614 = call i32(i8*,i8*) @strcmp(i8* %.tmp7611, i8* %.tmp7613)
%.tmp7615 = icmp eq i32 %.tmp7614, 0
br i1 %.tmp7615, label %.if.true.7616, label %.if.false.7616
.if.true.7616:
%.tmp7617 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7600
%.tmp7618 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7617, i32 0, i32 4
%.tmp7619 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7600
%.tmp7620 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7619)
store %m1861$.Type.type* %.tmp7620, %m1861$.Type.type** %.tmp7618
%.tmp7621 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7600
%.tmp7622 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7621, i32 0, i32 4
%.tmp7623 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7622
%.tmp7624 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7623, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7624
%.tmp7625 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7600
%.tmp7626 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7625, i32 0, i32 4
%.tmp7627 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7626
store %m1861$.Type.type* %.tmp7627, %m1861$.Type.type** %last_type.7600
%.tmp7628 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7629 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7628, i32 0, i32 7
%.tmp7630 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7629
%.tmp7631 = icmp ne %m307$.Node.type* %.tmp7630, null
br i1 %.tmp7631, label %.if.true.7632, label %.if.false.7632
.if.true.7632:
%.tmp7633 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7634 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7633, i32 0, i32 7
%.tmp7635 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7634
store %m307$.Node.type* %.tmp7635, %m307$.Node.type** %param_ptr.7606
br label %.if.end.7632
.if.false.7632:
br label %.if.end.7632
.if.end.7632:
%.tmp7636 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7637 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7636, i32 0, i32 7
%.tmp7638 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7637
%.tmp7639 = icmp ne %m307$.Node.type* %.tmp7638, null
br i1 %.tmp7639, label %.if.true.7640, label %.if.false.7640
.if.true.7640:
%.tmp7641 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7642 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7641, i32 0, i32 7
%.tmp7643 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7642
store %m307$.Node.type* %.tmp7643, %m307$.Node.type** %param_ptr.7606
br label %.if.end.7640
.if.false.7640:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7606
br label %.if.end.7640
.if.end.7640:
br label %.if.end.7616
.if.false.7616:
%.tmp7644 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7645 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7646 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7645, i32 0, i32 6
%.tmp7647 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7646
%.tmp7648 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7644, %m307$.Node.type* %.tmp7647)
%param_type.7649 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7648, %m1861$.Type.type** %param_type.7649
%.tmp7650 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7600
%.tmp7651 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7650, i32 0, i32 4
%.tmp7652 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7649
store %m1861$.Type.type* %.tmp7652, %m1861$.Type.type** %.tmp7651
%.tmp7653 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7649
store %m1861$.Type.type* %.tmp7653, %m1861$.Type.type** %last_type.7600
%.tmp7654 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7655 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7654, i32 0, i32 7
%.tmp7656 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7655
store %m307$.Node.type* %.tmp7656, %m307$.Node.type** %param_ptr.7606
%.tmp7657 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7658 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7657, i32 0, i32 7
%.tmp7659 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7658
%.tmp7660 = icmp ne %m307$.Node.type* %.tmp7659, null
br i1 %.tmp7660, label %.if.true.7661, label %.if.false.7661
.if.true.7661:
%.tmp7662 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7606
%.tmp7663 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7662, i32 0, i32 7
%.tmp7664 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7663
%.tmp7665 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7664, i32 0, i32 7
%.tmp7666 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7665
store %m307$.Node.type* %.tmp7666, %m307$.Node.type** %param_ptr.7606
br label %.if.end.7661
.if.false.7661:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7606
br label %.if.end.7661
.if.end.7661:
br label %.if.end.7616
.if.end.7616:
br label %.for.start.7604
.for.end.7604:
%.tmp7667 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7585
ret %m1861$.Type.type* %.tmp7667
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7668 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7670 = getelementptr [10 x i8], [10 x i8]*@.str7669, i32 0, i32 0
%.tmp7671 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7668, i8* %.tmp7670)
%params.7672 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7671, %m307$.Node.type** %params.7672
%.tmp7673 = load %m307$.Node.type*, %m307$.Node.type** %params.7672
%.tmp7674 = icmp eq %m307$.Node.type* %.tmp7673, null
br i1 %.tmp7674, label %.if.true.7675, label %.if.false.7675
.if.true.7675:
%.tmp7676 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7676
br label %.if.end.7675
.if.false.7675:
br label %.if.end.7675
.if.end.7675:
%.tmp7677 = load %m307$.Node.type*, %m307$.Node.type** %params.7672
%.tmp7678 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7677, i32 0, i32 6
%.tmp7679 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7678
ret %m307$.Node.type* %.tmp7679
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7680 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.7681 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7680, %m1861$.Type.type** %t.7681
%.tmp7682 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7683 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7682, i32 0, i32 0
%.tmp7684 = load i8*, i8** %.tmp7683
%.tmp7686 = getelementptr [10 x i8], [10 x i8]*@.str7685, i32 0, i32 0
%.tmp7687 = call i32(i8*,i8*) @strcmp(i8* %.tmp7684, i8* %.tmp7686)
%.tmp7688 = icmp eq i32 %.tmp7687, 0
br i1 %.tmp7688, label %.if.true.7689, label %.if.false.7689
.if.true.7689:
%.tmp7690 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7691 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7690, i32 0, i32 0
%.tmp7693 = getelementptr [7 x i8], [7 x i8]*@.str7692, i32 0, i32 0
store i8* %.tmp7693, i8** %.tmp7691
%.tmp7694 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7695 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7694, i32 0, i32 1
store i8* null, i8** %.tmp7695
%.tmp7696 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7697 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7696, i32 0, i32 6
%.tmp7698 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7697
%.tmp7700 = getelementptr [5 x i8], [5 x i8]*@.str7699, i32 0, i32 0
%.tmp7701 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7698, i8* %.tmp7700)
%curr_type.7702 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7701, %m307$.Node.type** %curr_type.7702
%.tmp7703 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7704 = icmp ne %m307$.Node.type* %.tmp7703, null
br i1 %.tmp7704, label %.if.true.7705, label %.if.false.7705
.if.true.7705:
%.tmp7706 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7707 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7706, i32 0, i32 3
%.tmp7708 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7709 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7710 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7709, i32 0, i32 6
%.tmp7711 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7710
%.tmp7712 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7708, %m307$.Node.type* %.tmp7711)
store %m1861$.Type.type* %.tmp7712, %m1861$.Type.type** %.tmp7707
%.tmp7713 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7714 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7713, i32 0, i32 3
%.tmp7715 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7714
%.tmp7716 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7715, i32 0, i32 1
%.tmp7717 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7718 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7717, i32 0, i32 7
%.tmp7719 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7718
%.tmp7720 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7719, i32 0, i32 1
%.tmp7721 = load i8*, i8** %.tmp7720
store i8* %.tmp7721, i8** %.tmp7716
%.tmp7722 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7723 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7722, i32 0, i32 3
%.tmp7724 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7723
%curr_t.7725 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7724, %m1861$.Type.type** %curr_t.7725
%.tmp7727 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7728 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7727, i32 0, i32 7
%.tmp7729 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7728
%.tmp7731 = getelementptr [5 x i8], [5 x i8]*@.str7730, i32 0, i32 0
%.tmp7732 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7729, i8* %.tmp7731)
store %m307$.Node.type* %.tmp7732, %m307$.Node.type** %curr_type.7702
br label %.for.start.7726
.for.start.7726:
%.tmp7733 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7734 = icmp ne %m307$.Node.type* %.tmp7733, null
br i1 %.tmp7734, label %.for.continue.7726, label %.for.end.7726
.for.continue.7726:
%.tmp7735 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7725
%.tmp7736 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7735, i32 0, i32 4
%.tmp7737 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7738 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7739 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7738, i32 0, i32 6
%.tmp7740 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7739
%.tmp7741 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7737, %m307$.Node.type* %.tmp7740)
store %m1861$.Type.type* %.tmp7741, %m1861$.Type.type** %.tmp7736
%.tmp7742 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7725
%.tmp7743 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7742, i32 0, i32 4
%.tmp7744 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7743
%.tmp7745 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7744, i32 0, i32 1
%.tmp7746 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7747 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7746, i32 0, i32 7
%.tmp7748 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7747
%.tmp7749 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7748, i32 0, i32 1
%.tmp7750 = load i8*, i8** %.tmp7749
store i8* %.tmp7750, i8** %.tmp7745
%.tmp7751 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7725
%.tmp7752 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7751, i32 0, i32 4
%.tmp7753 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7752
store %m1861$.Type.type* %.tmp7753, %m1861$.Type.type** %curr_t.7725
%.tmp7754 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7702
%.tmp7755 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7754, i32 0, i32 7
%.tmp7756 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7755
%.tmp7758 = getelementptr [5 x i8], [5 x i8]*@.str7757, i32 0, i32 0
%.tmp7759 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7756, i8* %.tmp7758)
store %m307$.Node.type* %.tmp7759, %m307$.Node.type** %curr_type.7702
br label %.for.start.7726
.for.end.7726:
br label %.if.end.7705
.if.false.7705:
br label %.if.end.7705
.if.end.7705:
br label %.if.end.7689
.if.false.7689:
%.tmp7760 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7761 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7760, i32 0, i32 0
%.tmp7762 = load i8*, i8** %.tmp7761
%.tmp7764 = getelementptr [12 x i8], [12 x i8]*@.str7763, i32 0, i32 0
%.tmp7765 = call i32(i8*,i8*) @strcmp(i8* %.tmp7762, i8* %.tmp7764)
%.tmp7766 = icmp eq i32 %.tmp7765, 0
br i1 %.tmp7766, label %.if.true.7767, label %.if.false.7767
.if.true.7767:
%err_msg.7768 = alloca i8*
store i8* null, i8** %err_msg.7768
%.tmp7769 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7770 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7771 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7769, %m307$.Node.type* %.tmp7770)
%base.7772 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp7771, %m1861$.ScopeItem.type** %base.7772
%.tmp7773 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7772
%.tmp7774 = icmp eq %m1861$.ScopeItem.type* %.tmp7773, null
br i1 %.tmp7774, label %.if.true.7775, label %.if.false.7775
.if.true.7775:
%.tmp7776 = getelementptr i8*, i8** %err_msg.7768, i32 0
%.tmp7778 = getelementptr [37 x i8], [37 x i8]*@.str7777, i32 0, i32 0
%.tmp7779 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7780 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7779, i32 0, i32 6
%.tmp7781 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7780
%.tmp7782 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7781, i32 0, i32 1
%.tmp7783 = load i8*, i8** %.tmp7782
%.tmp7784 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7776, i8* %.tmp7778, i8* %.tmp7783)
%.tmp7785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7786 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7787 = load i8*, i8** %err_msg.7768
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7785, %m307$.Node.type* %.tmp7786, i8* %.tmp7787)
%.tmp7788 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7789 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7788, i32 0, i32 0
%.tmp7791 = getelementptr [6 x i8], [6 x i8]*@.str7790, i32 0, i32 0
store i8* %.tmp7791, i8** %.tmp7789
%.tmp7792 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
ret %m1861$.Type.type* %.tmp7792
br label %.if.end.7775
.if.false.7775:
br label %.if.end.7775
.if.end.7775:
%.tmp7793 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7794 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7793, i32 0, i32 0
%.tmp7796 = getelementptr [10 x i8], [10 x i8]*@.str7795, i32 0, i32 0
store i8* %.tmp7796, i8** %.tmp7794
%.tmp7797 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7798 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7797, i32 0, i32 1
%.tmp7799 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7772
%.tmp7800 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7799, i32 0, i32 0
%.tmp7801 = load i8*, i8** %.tmp7800
store i8* %.tmp7801, i8** %.tmp7798
%.tmp7802 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7803 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7802, i32 0, i32 2
%.tmp7804 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7772
%.tmp7805 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7804, i32 0, i32 1
%.tmp7806 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7805
%.tmp7807 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7806, i32 0, i32 0
%.tmp7808 = load i8*, i8** %.tmp7807
store i8* %.tmp7808, i8** %.tmp7803
%.tmp7809 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7810 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7809, i32 0, i32 3
%.tmp7811 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7772
%.tmp7812 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7811, i32 0, i32 1
%.tmp7813 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7812
%.tmp7814 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7813, i32 0, i32 3
%.tmp7815 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7814
store %m1861$.Type.type* %.tmp7815, %m1861$.Type.type** %.tmp7810
br label %.if.end.7767
.if.false.7767:
%.tmp7816 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7817 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7816, i32 0, i32 1
%.tmp7818 = load i8*, i8** %.tmp7817
%.tmp7820 = getelementptr [4 x i8], [4 x i8]*@.str7819, i32 0, i32 0
%.tmp7821 = call i32(i8*,i8*) @strcmp(i8* %.tmp7818, i8* %.tmp7820)
%.tmp7822 = icmp eq i32 %.tmp7821, 0
br i1 %.tmp7822, label %.if.true.7823, label %.if.false.7823
.if.true.7823:
%.tmp7824 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7825 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7824, i32 0, i32 0
%.tmp7827 = getelementptr [4 x i8], [4 x i8]*@.str7826, i32 0, i32 0
store i8* %.tmp7827, i8** %.tmp7825
%.tmp7828 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7829 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7828, i32 0, i32 3
%.tmp7830 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7830, %m1861$.Type.type** %.tmp7829
%.tmp7831 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7832 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7831, i32 0, i32 3
%.tmp7833 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7832
%.tmp7834 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7833, i32 0, i32 0
%.tmp7836 = getelementptr [4 x i8], [4 x i8]*@.str7835, i32 0, i32 0
store i8* %.tmp7836, i8** %.tmp7834
br label %.if.end.7823
.if.false.7823:
%.tmp7837 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7838 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7837, i32 0, i32 0
%.tmp7839 = load i8*, i8** %.tmp7838
%.tmp7841 = getelementptr [5 x i8], [5 x i8]*@.str7840, i32 0, i32 0
%.tmp7842 = call i32(i8*,i8*) @strcmp(i8* %.tmp7839, i8* %.tmp7841)
%.tmp7843 = icmp eq i32 %.tmp7842, 0
br i1 %.tmp7843, label %.if.true.7844, label %.if.false.7844
.if.true.7844:
%.tmp7845 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7846 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7845, i32 0, i32 0
%.tmp7847 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7848 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7847, i32 0, i32 1
%.tmp7849 = load i8*, i8** %.tmp7848
store i8* %.tmp7849, i8** %.tmp7846
br label %.if.end.7844
.if.false.7844:
%.tmp7850 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7851 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7850, i32 0, i32 1
%.tmp7852 = load i8*, i8** %.tmp7851
%.tmp7854 = getelementptr [4 x i8], [4 x i8]*@.str7853, i32 0, i32 0
%.tmp7855 = call i32(i8*,i8*) @strcmp(i8* %.tmp7852, i8* %.tmp7854)
%.tmp7856 = icmp eq i32 %.tmp7855, 0
br i1 %.tmp7856, label %.if.true.7857, label %.if.false.7857
.if.true.7857:
%.tmp7858 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
%.tmp7859 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7858, i32 0, i32 0
%.tmp7861 = getelementptr [7 x i8], [7 x i8]*@.str7860, i32 0, i32 0
store i8* %.tmp7861, i8** %.tmp7859
br label %.if.end.7857
.if.false.7857:
%.tmp7862 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7863 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7865 = getelementptr [54 x i8], [54 x i8]*@.str7864, i32 0, i32 0
%.tmp7866 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7862, %m307$.Node.type* %.tmp7863, i8* %.tmp7865)
%.tmp7867 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7868 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7867, i32 0, i32 0
%.tmp7869 = load i8*, i8** %.tmp7868
%.tmp7870 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7871 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7870, i32 0, i32 1
%.tmp7872 = load i8*, i8** %.tmp7871
%.tmp7873 = call i32(i8*,...) @printf(i8* %.tmp7866, i8* %.tmp7869, i8* %.tmp7872)
%.tmp7874 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7874
br label %.if.end.7857
.if.end.7857:
br label %.if.end.7844
.if.end.7844:
br label %.if.end.7823
.if.end.7823:
br label %.if.end.7767
.if.end.7767:
br label %.if.end.7689
.if.end.7689:
%.tmp7876 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7877 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7876, i32 0, i32 7
%.tmp7878 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7877
%ptr.7879 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7878, %m307$.Node.type** %ptr.7879
br label %.for.start.7875
.for.start.7875:
%.tmp7880 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7881 = icmp ne %m307$.Node.type* %.tmp7880, null
br i1 %.tmp7881, label %.for.continue.7875, label %.for.end.7875
.for.continue.7875:
%.tmp7882 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7883 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7882, i32 0, i32 1
%.tmp7884 = load i8*, i8** %.tmp7883
%.tmp7886 = getelementptr [2 x i8], [2 x i8]*@.str7885, i32 0, i32 0
%.tmp7887 = call i32(i8*,i8*) @strcmp(i8* %.tmp7884, i8* %.tmp7886)
%.tmp7888 = icmp eq i32 %.tmp7887, 0
br i1 %.tmp7888, label %.if.true.7889, label %.if.false.7889
.if.true.7889:
%.tmp7890 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.7891 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7890, %m1861$.Type.type** %pt.7891
%.tmp7892 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7891
%.tmp7893 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7892, i32 0, i32 0
%.tmp7895 = getelementptr [4 x i8], [4 x i8]*@.str7894, i32 0, i32 0
store i8* %.tmp7895, i8** %.tmp7893
%.tmp7896 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7891
%.tmp7897 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7896, i32 0, i32 3
%.tmp7898 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
store %m1861$.Type.type* %.tmp7898, %m1861$.Type.type** %.tmp7897
%.tmp7899 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7891
store %m1861$.Type.type* %.tmp7899, %m1861$.Type.type** %t.7681
br label %.if.end.7889
.if.false.7889:
%.tmp7900 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7900, i32 0, i32 1
%.tmp7902 = load i8*, i8** %.tmp7901
%.tmp7904 = getelementptr [2 x i8], [2 x i8]*@.str7903, i32 0, i32 0
%.tmp7905 = call i32(i8*,i8*) @strcmp(i8* %.tmp7902, i8* %.tmp7904)
%.tmp7906 = icmp eq i32 %.tmp7905, 0
br i1 %.tmp7906, label %.if.true.7907, label %.if.false.7907
.if.true.7907:
%.tmp7908 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7909 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7908, i32 0, i32 7
%.tmp7910 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7909
%.tmp7911 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7910, i32 0, i32 1
%.tmp7912 = load i8*, i8** %.tmp7911
%.tmp7914 = getelementptr [2 x i8], [2 x i8]*@.str7913, i32 0, i32 0
%.tmp7915 = call i32(i8*,i8*) @strcmp(i8* %.tmp7912, i8* %.tmp7914)
%.tmp7916 = icmp eq i32 %.tmp7915, 0
br i1 %.tmp7916, label %.if.true.7917, label %.if.false.7917
.if.true.7917:
%.tmp7918 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.7919 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7918, %m1861$.Type.type** %slice_type.7919
%.tmp7920 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7919
%.tmp7921 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7920, i32 0, i32 0
%.tmp7923 = getelementptr [7 x i8], [7 x i8]*@.str7922, i32 0, i32 0
store i8* %.tmp7923, i8** %.tmp7921
%.tmp7924 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7919
%.tmp7925 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7924, i32 0, i32 1
%.tmp7927 = getelementptr [6 x i8], [6 x i8]*@.str7926, i32 0, i32 0
store i8* %.tmp7927, i8** %.tmp7925
%.tmp7928 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.7929 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7928, %m1861$.Type.type** %slice_c_array.7929
%.tmp7930 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7929
%.tmp7931 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7930, i32 0, i32 0
%.tmp7933 = getelementptr [4 x i8], [4 x i8]*@.str7932, i32 0, i32 0
store i8* %.tmp7933, i8** %.tmp7931
%.tmp7934 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7929
%.tmp7935 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7934, i32 0, i32 1
%.tmp7937 = getelementptr [6 x i8], [6 x i8]*@.str7936, i32 0, i32 0
store i8* %.tmp7937, i8** %.tmp7935
%.tmp7938 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7929
%.tmp7939 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7938, i32 0, i32 3
%.tmp7940 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
store %m1861$.Type.type* %.tmp7940, %m1861$.Type.type** %.tmp7939
%.tmp7941 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7919
%.tmp7942 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7941, i32 0, i32 3
%.tmp7943 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7929
store %m1861$.Type.type* %.tmp7943, %m1861$.Type.type** %.tmp7942
%.tmp7944 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.7945 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7944, %m1861$.Type.type** %slice_len.7945
%.tmp7946 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7945
%.tmp7947 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7946, i32 0, i32 0
%.tmp7949 = getelementptr [4 x i8], [4 x i8]*@.str7948, i32 0, i32 0
store i8* %.tmp7949, i8** %.tmp7947
%.tmp7950 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7945
%.tmp7951 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7950, i32 0, i32 1
%.tmp7953 = getelementptr [4 x i8], [4 x i8]*@.str7952, i32 0, i32 0
store i8* %.tmp7953, i8** %.tmp7951
%.tmp7954 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7929
%.tmp7955 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7954, i32 0, i32 4
%.tmp7956 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7945
store %m1861$.Type.type* %.tmp7956, %m1861$.Type.type** %.tmp7955
%.tmp7957 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.7958 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7957, %m1861$.Type.type** %slice_cap.7958
%.tmp7959 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7958
%.tmp7960 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7959, i32 0, i32 0
%.tmp7962 = getelementptr [4 x i8], [4 x i8]*@.str7961, i32 0, i32 0
store i8* %.tmp7962, i8** %.tmp7960
%.tmp7963 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7958
%.tmp7964 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7963, i32 0, i32 1
%.tmp7966 = getelementptr [4 x i8], [4 x i8]*@.str7965, i32 0, i32 0
store i8* %.tmp7966, i8** %.tmp7964
%.tmp7967 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7945
%.tmp7968 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7967, i32 0, i32 4
%.tmp7969 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7958
store %m1861$.Type.type* %.tmp7969, %m1861$.Type.type** %.tmp7968
%.tmp7970 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7919
store %m1861$.Type.type* %.tmp7970, %m1861$.Type.type** %t.7681
%.tmp7971 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7972 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7971, i32 0, i32 7
%.tmp7973 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7972
store %m307$.Node.type* %.tmp7973, %m307$.Node.type** %ptr.7879
br label %.if.end.7917
.if.false.7917:
br label %.if.end.7917
.if.end.7917:
br label %.if.end.7907
.if.false.7907:
%.tmp7974 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7975 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7977 = getelementptr [49 x i8], [49 x i8]*@.str7976, i32 0, i32 0
%.tmp7978 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7974, %m307$.Node.type* %.tmp7975, i8* %.tmp7977)
%.tmp7979 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7980 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7979, i32 0, i32 1
%.tmp7981 = load i8*, i8** %.tmp7980
%.tmp7982 = call i32(i8*,...) @printf(i8* %.tmp7978, i8* %.tmp7981)
%.tmp7983 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7983
br label %.if.end.7907
.if.end.7907:
br label %.if.end.7889
.if.end.7889:
%.tmp7984 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7879
%.tmp7985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7984, i32 0, i32 7
%.tmp7986 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7985
store %m307$.Node.type* %.tmp7986, %m307$.Node.type** %ptr.7879
br label %.for.start.7875
.for.end.7875:
%.tmp7987 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7681
ret %m1861$.Type.type* %.tmp7987
}
@.str2666 = constant [5 x i8] c"%s{\0A\00"
@.str2670 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2677 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2684 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2696 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2700 = constant [10 x i8] c"%s  of: \0A\00"
@.str2714 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2718 = constant [12 x i8] c"%s  next: \0A\00"
@.str2727 = constant [5 x i8] c"%s}\0A\00"
@.str2787 = constant [5 x i8] c"%c%s\00"
@.str2799 = constant [7 x i8] c".tmp%d\00"
@.str2896 = constant [1 x i8] c"\00"
@.str2938 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2962 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2981 = constant [6 x i8] c"start\00"
@.str3048 = constant [6 x i8] c"start\00"
@.str3054 = constant [7 x i8] c"global\00"
@.str3065 = constant [13 x i8] c"head_comment\00"
@.str3104 = constant [7 x i8] c"string\00"
@.str3113 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3146 = constant [5 x i8] c"%s%s\00"
@.str3154 = constant [9 x i8] c"function\00"
@.str3160 = constant [5 x i8] c"main\00"
@.str3175 = constant [6 x i8] c"%s.%s\00"
@.str3196 = constant [3 x i8] c"NL\00"
@.str3204 = constant [7 x i8] c"global\00"
@.str3212 = constant [11 x i8] c"assignable\00"
@.str3243 = constant [9 x i8] c"variable\00"
@.str3254 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3269 = constant [10 x i8] c"typealias\00"
@.str3291 = constant [11 x i8] c"%s.%s.type\00"
@.str3303 = constant [10 x i8] c"typealias\00"
@.str3324 = constant [5 x i8] c"type\00"
@.str3354 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3367 = constant [7 x i8] c"extern\00"
@.str3385 = constant [7 x i8] c"extern\00"
@.str3425 = constant [15 x i8] c"declare %s %s(\00"
@.str3457 = constant [3 x i8] c", \00"
@.str3463 = constant [3 x i8] c"%s\00"
@.str3475 = constant [3 x i8] c")\0A\00"
@.str3486 = constant [9 x i8] c"function\00"
@.str3495 = constant [9 x i8] c"function\00"
@.str3533 = constant [14 x i8] c"define %s %s(\00"
@.str3562 = constant [3 x i8] c", \00"
@.str3568 = constant [5 x i8] c"type\00"
@.str3584 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3599 = constant [5 x i8] c") {\0A\00"
@.str3603 = constant [9 x i8] c"function\00"
@.str3612 = constant [6 x i8] c"block\00"
@.str3624 = constant [12 x i8] c"expressions\00"
@.str3637 = constant [3 x i8] c"NL\00"
@.str3644 = constant [9 x i8] c"OPERATOR\00"
@.str3663 = constant [7 x i8] c"return\00"
@.str3673 = constant [5 x i8] c"void\00"
@.str3680 = constant [21 x i8] c"missing return value\00"
@.str3685 = constant [10 x i8] c"ret void\0A\00"
@.str3691 = constant [3 x i8] c"}\0A\00"
@.str3697 = constant [7 x i8] c"import\00"
@.str3748 = constant [1 x i8] c"\00"
@.str3754 = constant [6 x i8] c"%s.bn\00"
@.str3759 = constant [9 x i8] c"%s/%s.bn\00"
@.str3771 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3832 = constant [5 x i8] c"m%d$\00"
@.str3883 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3892 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3924 = constant [9 x i8] c"variable\00"
@.str3929 = constant [5 x i8] c"type\00"
@.str3961 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3973 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3985 = constant [6 x i8] c"block\00"
@.str3992 = constant [12 x i8] c"expressions\00"
@.str4023 = constant [7 x i8] c"struct\00"
@.str4028 = constant [7 x i8] c"WhAT!\0A\00"
@.str4068 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4080 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4106 = constant [7 x i8] c"struct\00"
@.str4111 = constant [7 x i8] c"WhAT!\0A\00"
@.str4142 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4154 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4179 = constant [7 x i8] c"sizeof\00"
@.str4185 = constant [8 x i8] c"fn_args\00"
@.str4192 = constant [11 x i8] c"assignable\00"
@.str4220 = constant [4 x i8] c"int\00"
@.str4233 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4242 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4253 = constant [7 x i8] c"append\00"
@.str4259 = constant [8 x i8] c"fn_args\00"
@.str4266 = constant [11 x i8] c"assignable\00"
@.str4273 = constant [11 x i8] c"assignable\00"
@.str4297 = constant [5 x i8] c".b%d\00"
@.str4330 = constant [4 x i8] c"len\00"
@.str4336 = constant [8 x i8] c"fn_args\00"
@.str4343 = constant [11 x i8] c"assignable\00"
@.str4369 = constant [35 x i8] c"unable to compile function address\00"
@.str4375 = constant [8 x i8] c"fn_args\00"
@.str4379 = constant [1 x i8] c"\00"
@.str4389 = constant [11 x i8] c"assignable\00"
@.str4403 = constant [5 x i8] c"%s, \00"
@.str4421 = constant [8 x i8] c"%s%s %s\00"
@.str4436 = constant [11 x i8] c"assignable\00"
@.str4446 = constant [5 x i8] c"void\00"
@.str4454 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4486 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4512 = constant [7 x i8] c"return\00"
@.str4524 = constant [3 x i8] c"NL\00"
@.str4542 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4555 = constant [10 x i8] c"ret void\0A\00"
@.str4559 = constant [3 x i8] c"NL\00"
@.str4565 = constant [8 x i8] c"fn_call\00"
@.str4576 = constant [12 x i8] c"declaration\00"
@.str4585 = constant [11 x i8] c"assignment\00"
@.str4593 = constant [11 x i8] c"assignable\00"
@.str4624 = constant [4 x i8] c"ptr\00"
@.str4633 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4643 = constant [9 x i8] c"if_block\00"
@.str4651 = constant [9 x i8] c"for_loop\00"
@.str4659 = constant [8 x i8] c"keyword\00"
@.str4677 = constant [6 x i8] c"break\00"
@.str4691 = constant [4 x i8] c"for\00"
@.str4699 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4713 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4720 = constant [9 x i8] c"continue\00"
@.str4734 = constant [4 x i8] c"for\00"
@.str4742 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4756 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4760 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4771 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4790 = constant [14 x i8] c".for.start.%d\00"
@.str4795 = constant [12 x i8] c".for.end.%d\00"
@.str4800 = constant [4 x i8] c"for\00"
@.str4807 = constant [12 x i8] c"declaration\00"
@.str4818 = constant [11 x i8] c"assignment\00"
@.str4828 = constant [9 x i8] c"OPERATOR\00"
@.str4835 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4846 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4853 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4860 = constant [9 x i8] c"OPERATOR\00"
@.str4871 = constant [9 x i8] c"OPERATOR\00"
@.str4878 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4887 = constant [9 x i8] c"OPERATOR\00"
@.str4892 = constant [6 x i8] c"block\00"
@.str4897 = constant [11 x i8] c"else_block\00"
@.str4907 = constant [13 x i8] c".for.else.%d\00"
@.str4914 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4929 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4948 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4958 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str4965 = constant [6 x i8] c"block\00"
@.str4974 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4981 = constant [5 x i8] c"%s:\0A\00"
@.str4995 = constant [5 x i8] c"type\00"
@.str5010 = constant [11 x i8] c"assignable\00"
@.str5025 = constant [9 x i8] c"variable\00"
@.str5030 = constant [5 x i8] c"WORD\00"
@.str5039 = constant [31 x i8] c"unable to get declaration name\00"
@.str5059 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5071 = constant [6 x i8] c"%s.%d\00"
@.str5128 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5144 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5156 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5197 = constant [4 x i8] c"int\00"
@.str5204 = constant [4 x i8] c"chr\00"
@.str5212 = constant [5 x i8] c"bool\00"
@.str5221 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5230 = constant [4 x i8] c"ptr\00"
@.str5238 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5241 = constant [5 x i8] c"null\00"
@.str5249 = constant [7 x i8] c"struct\00"
@.str5270 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5290 = constant [10 x i8] c"typealias\00"
@.str5313 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5332 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5349 = constant [11 x i8] c"assignable\00"
@.str5366 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5381 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5388 = constant [6 x i8] c"block\00"
@.str5397 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5404 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5411 = constant [11 x i8] c"elif_block\00"
@.str5423 = constant [11 x i8] c"else_block\00"
@.str5433 = constant [6 x i8] c"block\00"
@.str5443 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5450 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5471 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5480 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5534 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5555 = constant [7 x i8] c"module\00"
@.str5608 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5645 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5653 = constant [9 x i8] c"function\00"
@.str5660 = constant [7 x i8] c"extern\00"
@.str5672 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5693 = constant [9 x i8] c"variable\00"
@.str5715 = constant [4 x i8] c"ptr\00"
@.str5734 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5758 = constant [10 x i8] c"typealias\00"
@.str5769 = constant [7 x i8] c"struct\00"
@.str5775 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5827 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5848 = constant [9 x i8] c"variable\00"
@.str5859 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5880 = constant [9 x i8] c"variable\00"
@.str5888 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5902 = constant [17 x i8] c"addr_destination\00"
@.str5909 = constant [16 x i8] c"mono_assignable\00"
@.str5917 = constant [11 x i8] c"assignable\00"
@.str5931 = constant [12 x i8] c"destination\00"
@.str5936 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5964 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5983 = constant [7 x i8] c"module\00"
@.str6005 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6076 = constant [6 x i8] c"slice\00"
@.str6089 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6131 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6152 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6176 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6199 = constant [16 x i8] c"mono_assignable\00"
@.str6225 = constant [5 x i8] c"cast\00"
@.str6235 = constant [5 x i8] c"type\00"
@.str6260 = constant [8 x i8] c"bitcast\00"
@.str6268 = constant [4 x i8] c"ptr\00"
@.str6275 = constant [4 x i8] c"ptr\00"
@.str6294 = constant [4 x i8] c"i%d\00"
@.str6299 = constant [4 x i8] c"i%d\00"
@.str6307 = constant [5 x i8] c"sext\00"
@.str6309 = constant [6 x i8] c"trunc\00"
@.str6314 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6334 = constant [16 x i8] c"mono_assignable\00"
@.str6396 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6419 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6426 = constant [2 x i8] c"+\00"
@.str6431 = constant [4 x i8] c"add\00"
@.str6436 = constant [2 x i8] c"-\00"
@.str6441 = constant [4 x i8] c"sub\00"
@.str6446 = constant [2 x i8] c"*\00"
@.str6451 = constant [4 x i8] c"mul\00"
@.str6456 = constant [2 x i8] c"/\00"
@.str6461 = constant [5 x i8] c"sdiv\00"
@.str6466 = constant [3 x i8] c"==\00"
@.str6471 = constant [8 x i8] c"icmp eq\00"
@.str6476 = constant [3 x i8] c"!=\00"
@.str6481 = constant [8 x i8] c"icmp ne\00"
@.str6486 = constant [2 x i8] c">\00"
@.str6491 = constant [9 x i8] c"icmp sgt\00"
@.str6496 = constant [2 x i8] c"<\00"
@.str6501 = constant [9 x i8] c"icmp slt\00"
@.str6506 = constant [2 x i8] c"&\00"
@.str6511 = constant [4 x i8] c"and\00"
@.str6516 = constant [2 x i8] c"|\00"
@.str6521 = constant [3 x i8] c"or\00"
@.str6526 = constant [3 x i8] c">=\00"
@.str6531 = constant [9 x i8] c"icmp sge\00"
@.str6536 = constant [3 x i8] c"<=\00"
@.str6541 = constant [9 x i8] c"icmp sle\00"
@.str6546 = constant [2 x i8] c"%\00"
@.str6551 = constant [5 x i8] c"srem\00"
@.str6555 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6562 = constant [4 x i8] c"add\00"
@.str6569 = constant [3 x i8] c"==\00"
@.str6576 = constant [3 x i8] c"!=\00"
@.str6584 = constant [2 x i8] c"|\00"
@.str6592 = constant [2 x i8] c"&\00"
@.str6600 = constant [2 x i8] c">\00"
@.str6608 = constant [2 x i8] c"<\00"
@.str6616 = constant [3 x i8] c">=\00"
@.str6624 = constant [3 x i8] c"<=\00"
@.str6632 = constant [5 x i8] c"bool\00"
@.str6636 = constant [4 x i8] c"int\00"
@.str6650 = constant [7 x i8] c"NUMBER\00"
@.str6664 = constant [4 x i8] c"int\00"
@.str6678 = constant [5 x i8] c"WORD\00"
@.str6688 = constant [5 x i8] c"null\00"
@.str6695 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str6709 = constant [5 x i8] c"null\00"
@.str6718 = constant [8 x i8] c"nullptr\00"
@.str6725 = constant [17 x i8] c"addr_destination\00"
@.str6737 = constant [12 x i8] c"destination\00"
@.str6781 = constant [4 x i8] c"ptr\00"
@.str6800 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6812 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6826 = constant [8 x i8] c"boolean\00"
@.str6840 = constant [5 x i8] c"bool\00"
@.str6849 = constant [6 x i8] c"false\00"
@.str6856 = constant [2 x i8] c"0\00"
@.str6860 = constant [2 x i8] c"1\00"
@.str6867 = constant [8 x i8] c"fn_call\00"
@.str6884 = constant [7 x i8] c"STRING\00"
@.str6910 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6926 = constant [4 x i8] c"ptr\00"
@.str6939 = constant [4 x i8] c"chr\00"
@.str6946 = constant [4 x i8] c"CHR\00"
@.str6962 = constant [2 x i8] c"0\00"
@.str6978 = constant [22 x i8] c"Invalid character: %s\00"
@.str6994 = constant [4 x i8] c"chr\00"
@.str6998 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7026 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7032 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7037 = constant [4 x i8] c"int\00"
@.str7042 = constant [2 x i8] c"i\00"
@.str7047 = constant [5 x i8] c"bool\00"
@.str7052 = constant [2 x i8] c"b\00"
@.str7057 = constant [5 x i8] c"void\00"
@.str7062 = constant [2 x i8] c"v\00"
@.str7067 = constant [4 x i8] c"chr\00"
@.str7072 = constant [2 x i8] c"c\00"
@.str7077 = constant [4 x i8] c"ptr\00"
@.str7084 = constant [4 x i8] c"%sp\00"
@.str7095 = constant [10 x i8] c"typealias\00"
@.str7106 = constant [7 x i8] c"struct\00"
@.str7111 = constant [2 x i8] c"s\00"
@.str7122 = constant [5 x i8] c"%s%s\00"
@.str7135 = constant [6 x i8] c"error\00"
@.str7140 = constant [2 x i8] c"?\00"
@.str7142 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7154 = constant [7 x i8] c".str%d\00"
@.str7178 = constant [6 x i8] c"array\00"
@.str7191 = constant [4 x i8] c"chr\00"
@.str7209 = constant [3 x i8] c"%d\00"
@.str7218 = constant [7 x i8] c"string\00"
@.str7238 = constant [7 x i8] c"module\00"
@.str7273 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7279 = constant [2 x i8] c"?\00"
@.str7285 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7291 = constant [4 x i8] c"int\00"
@.str7296 = constant [4 x i8] c"i32\00"
@.str7301 = constant [5 x i8] c"void\00"
@.str7306 = constant [5 x i8] c"void\00"
@.str7311 = constant [5 x i8] c"bool\00"
@.str7316 = constant [3 x i8] c"i1\00"
@.str7321 = constant [8 x i8] c"nullptr\00"
@.str7326 = constant [4 x i8] c"ptr\00"
@.str7331 = constant [4 x i8] c"chr\00"
@.str7336 = constant [3 x i8] c"i8\00"
@.str7341 = constant [9 x i8] c"function\00"
@.str7347 = constant [4 x i8] c"%s(\00"
@.str7373 = constant [4 x i8] c"%s,\00"
@.str7378 = constant [5 x i8] c"%s%s\00"
@.str7389 = constant [4 x i8] c"%s)\00"
@.str7397 = constant [4 x i8] c"ptr\00"
@.str7403 = constant [4 x i8] c"%s*\00"
@.str7415 = constant [7 x i8] c"struct\00"
@.str7421 = constant [2 x i8] c"{\00"
@.str7438 = constant [4 x i8] c"%s,\00"
@.str7443 = constant [5 x i8] c"%s%s\00"
@.str7454 = constant [4 x i8] c"%s}\00"
@.str7462 = constant [6 x i8] c"array\00"
@.str7468 = constant [10 x i8] c"[%s x %s]\00"
@.str7487 = constant [10 x i8] c"typealias\00"
@.str7493 = constant [5 x i8] c"%%%s\00"
@.str7503 = constant [7 x i8] c"vararg\00"
@.str7508 = constant [4 x i8] c"...\00"
@.str7513 = constant [6 x i8] c"error\00"
@.str7518 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7594 = constant [9 x i8] c"function\00"
@.str7612 = constant [5 x i8] c"WORD\00"
@.str7669 = constant [10 x i8] c"fn_params\00"
@.str7685 = constant [10 x i8] c"structdef\00"
@.str7692 = constant [7 x i8] c"struct\00"
@.str7699 = constant [5 x i8] c"type\00"
@.str7730 = constant [5 x i8] c"type\00"
@.str7757 = constant [5 x i8] c"type\00"
@.str7763 = constant [12 x i8] c"dotted_name\00"
@.str7777 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str7790 = constant [6 x i8] c"error\00"
@.str7795 = constant [10 x i8] c"typealias\00"
@.str7819 = constant [4 x i8] c"str\00"
@.str7826 = constant [4 x i8] c"ptr\00"
@.str7835 = constant [4 x i8] c"chr\00"
@.str7840 = constant [5 x i8] c"WORD\00"
@.str7853 = constant [4 x i8] c"...\00"
@.str7860 = constant [7 x i8] c"vararg\00"
@.str7864 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7885 = constant [2 x i8] c"*\00"
@.str7894 = constant [4 x i8] c"ptr\00"
@.str7903 = constant [2 x i8] c"[\00"
@.str7913 = constant [2 x i8] c"]\00"
@.str7922 = constant [7 x i8] c"struct\00"
@.str7926 = constant [6 x i8] c"slice\00"
@.str7932 = constant [4 x i8] c"ptr\00"
@.str7936 = constant [6 x i8] c"c_arr\00"
@.str7948 = constant [4 x i8] c"int\00"
@.str7952 = constant [4 x i8] c"len\00"
@.str7961 = constant [4 x i8] c"int\00"
@.str7965 = constant [4 x i8] c"cap\00"
@.str7976 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7988 = load i32, i32* %argc
%.tmp7989 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7988, i8** %.tmp7989)
%.tmp7990 = load i32, i32* @STDERR
%.tmp7992 = getelementptr [2 x i8], [2 x i8]*@.str7991, i32 0, i32 0
%.tmp7993 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7990, i8* %.tmp7992)
%stderr.7994 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7993, %m0$.File.type** %stderr.7994
%.tmp7995 = load i8**, i8*** %argv
%.tmp7996 = getelementptr i8*, i8** %.tmp7995, i32 1
%.tmp7997 = load i8*, i8** %.tmp7996
%filename.7998 = alloca i8*
store i8* %.tmp7997, i8** %filename.7998
%.tmp7999 = call %m0$.File.type*() @tmpfile()
%llvm_code.8000 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7999, %m0$.File.type** %llvm_code.8000
%.tmp8001 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8000
%.tmp8002 = load i8*, i8** %filename.7998
%.tmp8003 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp8001, i8* %.tmp8002)
%compiler_ctx.8004 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp8003, %m1861$.CompilerCtx.type** %compiler_ctx.8004
%.tmp8005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.8004
%.tmp8006 = bitcast ptr null to %m307$.Node.type*
%.tmp8007 = load i8*, i8** %filename.7998
%.tmp8008 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8005, %m307$.Node.type* %.tmp8006, i8* %.tmp8007)
br i1 %.tmp8008, label %.if.true.8009, label %.if.false.8009
.if.true.8009:
%.tmp8010 = load %m0$.File.type*, %m0$.File.type** %stderr.7994
%.tmp8012 = getelementptr [34 x i8], [34 x i8]*@.str8011, i32 0, i32 0
%.tmp8013 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8010, i8* %.tmp8012)
ret i32 1
br label %.if.end.8009
.if.false.8009:
br label %.if.end.8009
.if.end.8009:
%.tmp8014 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8000
%.tmp8015 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp8014)
%.tmp8016 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8000
%.tmp8017 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp8016)
%llvm_code_size.8018 = alloca i32
store i32 %.tmp8017, i32* %llvm_code_size.8018
%.tmp8019 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8000
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp8019)
%.tmp8021 = getelementptr [30 x i8], [30 x i8]*@.str8020, i32 0, i32 0
%.tmp8023 = getelementptr [2 x i8], [2 x i8]*@.str8022, i32 0, i32 0
%.tmp8024 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8021, i8* %.tmp8023)
%proc.8025 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8024, %m0$.File.type** %proc.8025
%.tmp8026 = load %m0$.File.type*, %m0$.File.type** %proc.8025
%.tmp8027 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8026)
%.tmp8028 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8000
%.tmp8029 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8028)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp8027, i32 %.tmp8029)
%.tmp8030 = load %m0$.File.type*, %m0$.File.type** %proc.8025
%.tmp8031 = icmp eq %m0$.File.type* %.tmp8030, null
br i1 %.tmp8031, label %.if.true.8032, label %.if.false.8032
.if.true.8032:
%.tmp8033 = load %m0$.File.type*, %m0$.File.type** %stderr.7994
%.tmp8035 = getelementptr [28 x i8], [28 x i8]*@.str8034, i32 0, i32 0
%.tmp8036 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8033, i8* %.tmp8035)
ret i32 0
br label %.if.end.8032
.if.false.8032:
br label %.if.end.8032
.if.end.8032:
%.tmp8037 = load %m0$.File.type*, %m0$.File.type** %proc.8025
%.tmp8038 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8037)
%.tmp8039 = icmp ne i32 %.tmp8038, 0
br i1 %.tmp8039, label %.if.true.8040, label %.if.false.8040
.if.true.8040:
%.tmp8041 = load %m0$.File.type*, %m0$.File.type** %stderr.7994
%.tmp8043 = getelementptr [24 x i8], [24 x i8]*@.str8042, i32 0, i32 0
%.tmp8044 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8041, i8* %.tmp8043)
ret i32 0
br label %.if.end.8040
.if.false.8040:
br label %.if.end.8040
.if.end.8040:
%.tmp8046 = getelementptr [17 x i8], [17 x i8]*@.str8045, i32 0, i32 0
%.tmp8048 = getelementptr [2 x i8], [2 x i8]*@.str8047, i32 0, i32 0
%.tmp8049 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8046, i8* %.tmp8048)
%gcc_proc.8050 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8049, %m0$.File.type** %gcc_proc.8050
%.tmp8051 = load %m0$.File.type*, %m0$.File.type** %gcc_proc.8050
%.tmp8052 = icmp eq %m0$.File.type* %.tmp8051, null
br i1 %.tmp8052, label %.if.true.8053, label %.if.false.8053
.if.true.8053:
%.tmp8054 = load %m0$.File.type*, %m0$.File.type** %stderr.7994
%.tmp8056 = getelementptr [28 x i8], [28 x i8]*@.str8055, i32 0, i32 0
%.tmp8057 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8054, i8* %.tmp8056)
ret i32 0
br label %.if.end.8053
.if.false.8053:
br label %.if.end.8053
.if.end.8053:
%.tmp8058 = load %m0$.File.type*, %m0$.File.type** %proc.8025
%.tmp8059 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8058)
%.tmp8060 = icmp ne i32 %.tmp8059, 0
br i1 %.tmp8060, label %.if.true.8061, label %.if.false.8061
.if.true.8061:
%.tmp8062 = load %m0$.File.type*, %m0$.File.type** %stderr.7994
%.tmp8064 = getelementptr [23 x i8], [23 x i8]*@.str8063, i32 0, i32 0
%.tmp8065 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8062, i8* %.tmp8064)
br label %.if.end.8061
.if.false.8061:
%.tmp8067 = getelementptr [32 x i8], [32 x i8]*@.str8066, i32 0, i32 0
%.tmp8068 = load i8*, i8** %filename.7998
%.tmp8069 = call i32(i8*,...) @printf(i8* %.tmp8067, i8* %.tmp8068)
br label %.if.end.8061
.if.end.8061:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8070 = load i32, i32* %argc
%.tmp8071 = icmp eq i32 %.tmp8070, 2
br i1 %.tmp8071, label %.if.true.8072, label %.if.false.8072
.if.true.8072:
ret void
br label %.if.end.8072
.if.false.8072:
br label %.if.end.8072
.if.end.8072:
%.tmp8074 = getelementptr [21 x i8], [21 x i8]*@.str8073, i32 0, i32 0
%tmpl.8075 = alloca i8*
store i8* %.tmp8074, i8** %tmpl.8075
%.tmp8076 = load i8**, i8*** %argv
%.tmp8077 = getelementptr i8*, i8** %.tmp8076, i32 0
%.tmp8078 = load i8*, i8** %.tmp8077
%.tmp8079 = call i32(i8*) @strlen(i8* %.tmp8078)
%.tmp8080 = load i8*, i8** %tmpl.8075
%.tmp8081 = call i32(i8*) @strlen(i8* %.tmp8080)
%.tmp8082 = add i32 %.tmp8079, %.tmp8081
%len_filename.8083 = alloca i32
store i32 %.tmp8082, i32* %len_filename.8083
%.tmp8084 = load i32, i32* %len_filename.8083
%.tmp8085 = call i8*(i32) @malloc(i32 %.tmp8084)
%buf.8086 = alloca i8*
store i8* %.tmp8085, i8** %buf.8086
%.tmp8087 = load i8*, i8** %buf.8086
%.tmp8088 = load i8*, i8** %tmpl.8075
%.tmp8089 = load i8**, i8*** %argv
%.tmp8090 = getelementptr i8*, i8** %.tmp8089, i32 0
%.tmp8091 = load i8*, i8** %.tmp8090
%.tmp8092 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8087, i8* %.tmp8088, i8* %.tmp8091)
%.tmp8093 = load i8*, i8** %buf.8086
%.tmp8094 = call i32(i8*) @puts(i8* %.tmp8093)
%.tmp8095 = load i8*, i8** %buf.8086
call void(i8*) @free(i8* %.tmp8095)
call void(i32) @exit(i32 1)
ret void
}
@.str7991 = constant [2 x i8] c"w\00"
@.str8011 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str8020 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str8022 = constant [2 x i8] c"w\00"
@.str8034 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8042 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8045 = constant [17 x i8] c"gcc out.s -o out\00"
@.str8047 = constant [2 x i8] c"w\00"
@.str8055 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8063 = constant [23 x i8] c"error on gcc execution\00"
@.str8066 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8073 = constant [21 x i8] c"Usage: %s <filename>\00"
