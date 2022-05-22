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
%.tmp1864 = getelementptr [1678 x i8], [1678 x i8]*@.str1863, i32 0, i32 0
ret i8* %.tmp1864
}
@.str1863 = constant [1678 x i8] c"
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

expressions: (expression)*

block: \22{\22 NL expressions (\22}\22)

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
%.tmp2249 = sub i32 %.tmp2248, 5
%.tmp2250 = icmp eq i32 %.tmp2246, %.tmp2249
br i1 %.tmp2250, label %.if.true.2251, label %.if.false.2251
.if.true.2251:
%.tmp2252 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2253 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2254 = load i8*, i8** %.tmp2253
%.tmp2255 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 0
%.tmp2256 = load i32, i32* %.tmp2255
%.tmp2257 = mul i32 %.tmp2256, 2
%.tmp2258 = add i32 %.tmp2257, 1
%.tmp2259 = call i8*(i8*,i32) @realloc(i8* %.tmp2254, i32 %.tmp2258)
store i8* %.tmp2259, i8** %.tmp2252
br label %.if.end.2251
.if.false.2251:
br label %.if.end.2251
.if.end.2251:
%.tmp2260 = load i32, i32* %i.2240
%.tmp2261 = load i8*, i8** %text
%.tmp2262 = getelementptr i8, i8* %.tmp2261, i32 %.tmp2260
%.tmp2263 = load i8, i8* %.tmp2262
%.tmp2264 = icmp eq i8 %.tmp2263, 34
br i1 %.tmp2264, label %.if.true.2265, label %.if.false.2265
.if.true.2265:
%.tmp2266 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2267 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2268 = load i32, i32* %.tmp2267
%.tmp2269 = load i8*, i8** %.tmp2266
%.tmp2270 = getelementptr i8, i8* %.tmp2269, i32 %.tmp2268
store i8 92, i8* %.tmp2270
%.tmp2271 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2272 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2273 = load i32, i32* %.tmp2272
%.tmp2274 = add i32 %.tmp2273, 1
store i32 %.tmp2274, i32* %.tmp2271
%.tmp2275 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2276 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2277 = load i32, i32* %.tmp2276
%.tmp2278 = load i8*, i8** %.tmp2275
%.tmp2279 = getelementptr i8, i8* %.tmp2278, i32 %.tmp2277
store i8 50, i8* %.tmp2279
%.tmp2280 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2281 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2282 = load i32, i32* %.tmp2281
%.tmp2283 = add i32 %.tmp2282, 1
store i32 %.tmp2283, i32* %.tmp2280
%.tmp2284 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2285 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2286 = load i32, i32* %.tmp2285
%.tmp2287 = load i8*, i8** %.tmp2284
%.tmp2288 = getelementptr i8, i8* %.tmp2287, i32 %.tmp2286
store i8 50, i8* %.tmp2288
br label %.if.end.2265
.if.false.2265:
%.tmp2289 = load i32, i32* %i.2240
%.tmp2290 = load i8*, i8** %text
%.tmp2291 = getelementptr i8, i8* %.tmp2290, i32 %.tmp2289
%.tmp2292 = load i8, i8* %.tmp2291
%.tmp2293 = icmp eq i8 %.tmp2292, 92
br i1 %.tmp2293, label %.if.true.2294, label %.if.false.2294
.if.true.2294:
%.tmp2295 = load i32, i32* %i.2240
%.tmp2296 = add i32 %.tmp2295, 1
%.tmp2297 = load i8*, i8** %text
%.tmp2298 = getelementptr i8, i8* %.tmp2297, i32 %.tmp2296
%.tmp2299 = load i8, i8* %.tmp2298
%.tmp2300 = icmp eq i8 %.tmp2299, 110
%.tmp2301 = load i32, i32* %i.2240
%.tmp2302 = add i32 %.tmp2301, 1
%.tmp2303 = load i8*, i8** %text
%.tmp2304 = getelementptr i8, i8* %.tmp2303, i32 %.tmp2302
%.tmp2305 = load i8, i8* %.tmp2304
%.tmp2306 = icmp eq i8 %.tmp2305, 78
%.tmp2307 = or i1 %.tmp2300, %.tmp2306
br i1 %.tmp2307, label %.if.true.2308, label %.if.false.2308
.if.true.2308:
%.tmp2309 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2310 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2311 = load i32, i32* %.tmp2310
%.tmp2312 = load i8*, i8** %.tmp2309
%.tmp2313 = getelementptr i8, i8* %.tmp2312, i32 %.tmp2311
store i8 92, i8* %.tmp2313
%.tmp2314 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2315 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2316 = load i32, i32* %.tmp2315
%.tmp2317 = add i32 %.tmp2316, 1
store i32 %.tmp2317, i32* %.tmp2314
%.tmp2318 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2319 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2320 = load i32, i32* %.tmp2319
%.tmp2321 = load i8*, i8** %.tmp2318
%.tmp2322 = getelementptr i8, i8* %.tmp2321, i32 %.tmp2320
store i8 48, i8* %.tmp2322
%.tmp2323 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2324 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2325 = load i32, i32* %.tmp2324
%.tmp2326 = add i32 %.tmp2325, 1
store i32 %.tmp2326, i32* %.tmp2323
%.tmp2327 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2328 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2329 = load i32, i32* %.tmp2328
%.tmp2330 = load i8*, i8** %.tmp2327
%.tmp2331 = getelementptr i8, i8* %.tmp2330, i32 %.tmp2329
store i8 65, i8* %.tmp2331
%.tmp2332 = load i32, i32* %i.2240
%.tmp2333 = add i32 %.tmp2332, 1
store i32 %.tmp2333, i32* %i.2240
br label %.if.end.2308
.if.false.2308:
%.tmp2334 = load i32, i32* %i.2240
%.tmp2335 = add i32 %.tmp2334, 1
%.tmp2336 = load i8*, i8** %text
%.tmp2337 = getelementptr i8, i8* %.tmp2336, i32 %.tmp2335
%.tmp2338 = load i8, i8* %.tmp2337
%.tmp2339 = icmp eq i8 %.tmp2338, 92
br i1 %.tmp2339, label %.if.true.2340, label %.if.false.2340
.if.true.2340:
%.tmp2341 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2342 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2343 = load i32, i32* %.tmp2342
%.tmp2344 = load i8*, i8** %.tmp2341
%.tmp2345 = getelementptr i8, i8* %.tmp2344, i32 %.tmp2343
store i8 92, i8* %.tmp2345
%.tmp2346 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2347 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2348 = load i32, i32* %.tmp2347
%.tmp2349 = add i32 %.tmp2348, 1
store i32 %.tmp2349, i32* %.tmp2346
%.tmp2350 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2351 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2352 = load i32, i32* %.tmp2351
%.tmp2353 = load i8*, i8** %.tmp2350
%.tmp2354 = getelementptr i8, i8* %.tmp2353, i32 %.tmp2352
store i8 53, i8* %.tmp2354
%.tmp2355 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2356 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2357 = load i32, i32* %.tmp2356
%.tmp2358 = add i32 %.tmp2357, 1
store i32 %.tmp2358, i32* %.tmp2355
%.tmp2359 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2360 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2361 = load i32, i32* %.tmp2360
%.tmp2362 = load i8*, i8** %.tmp2359
%.tmp2363 = getelementptr i8, i8* %.tmp2362, i32 %.tmp2361
store i8 67, i8* %.tmp2363
%.tmp2364 = load i32, i32* %i.2240
%.tmp2365 = add i32 %.tmp2364, 1
store i32 %.tmp2365, i32* %i.2240
br label %.if.end.2340
.if.false.2340:
%.tmp2366 = load i32, i32* %i.2240
%.tmp2367 = add i32 %.tmp2366, 1
%.tmp2368 = load i8*, i8** %text
%.tmp2369 = getelementptr i8, i8* %.tmp2368, i32 %.tmp2367
%.tmp2370 = load i8, i8* %.tmp2369
%.tmp2371 = icmp eq i8 %.tmp2370, 120
br i1 %.tmp2371, label %.if.true.2372, label %.if.false.2372
.if.true.2372:
%.tmp2373 = load i32, i32* %i.2240
%.tmp2374 = add i32 %.tmp2373, 2
store i32 %.tmp2374, i32* %i.2240
%.tmp2375 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2376 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2377 = load i32, i32* %.tmp2376
%.tmp2378 = load i8*, i8** %.tmp2375
%.tmp2379 = getelementptr i8, i8* %.tmp2378, i32 %.tmp2377
store i8 92, i8* %.tmp2379
%.tmp2380 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2381 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2382 = load i32, i32* %.tmp2381
%.tmp2383 = add i32 %.tmp2382, 1
store i32 %.tmp2383, i32* %.tmp2380
%.tmp2384 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2385 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2386 = load i32, i32* %.tmp2385
%.tmp2387 = load i8*, i8** %.tmp2384
%.tmp2388 = getelementptr i8, i8* %.tmp2387, i32 %.tmp2386
%.tmp2389 = load i32, i32* %i.2240
%.tmp2390 = load i8*, i8** %text
%.tmp2391 = getelementptr i8, i8* %.tmp2390, i32 %.tmp2389
%.tmp2392 = load i8, i8* %.tmp2391
%.tmp2393 = call i8(i8) @toupper(i8 %.tmp2392)
store i8 %.tmp2393, i8* %.tmp2388
%.tmp2394 = load i32, i32* %i.2240
%.tmp2395 = add i32 %.tmp2394, 1
store i32 %.tmp2395, i32* %i.2240
%.tmp2396 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2397 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2398 = load i32, i32* %.tmp2397
%.tmp2399 = add i32 %.tmp2398, 1
store i32 %.tmp2399, i32* %.tmp2396
%.tmp2400 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2401 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2402 = load i32, i32* %.tmp2401
%.tmp2403 = load i8*, i8** %.tmp2400
%.tmp2404 = getelementptr i8, i8* %.tmp2403, i32 %.tmp2402
%.tmp2405 = load i32, i32* %i.2240
%.tmp2406 = load i8*, i8** %text
%.tmp2407 = getelementptr i8, i8* %.tmp2406, i32 %.tmp2405
%.tmp2408 = load i8, i8* %.tmp2407
%.tmp2409 = call i8(i8) @toupper(i8 %.tmp2408)
store i8 %.tmp2409, i8* %.tmp2404
br label %.if.end.2372
.if.false.2372:
%.tmp2410 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2411 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2412 = load i32, i32* %.tmp2411
%.tmp2413 = load i8*, i8** %.tmp2410
%.tmp2414 = getelementptr i8, i8* %.tmp2413, i32 %.tmp2412
%.tmp2415 = load i32, i32* %i.2240
%.tmp2416 = load i8*, i8** %text
%.tmp2417 = getelementptr i8, i8* %.tmp2416, i32 %.tmp2415
%.tmp2418 = load i8, i8* %.tmp2417
store i8 %.tmp2418, i8* %.tmp2414
br label %.if.end.2372
.if.end.2372:
br label %.if.end.2340
.if.end.2340:
br label %.if.end.2308
.if.end.2308:
br label %.if.end.2294
.if.false.2294:
%.tmp2419 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2420 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2421 = load i32, i32* %.tmp2420
%.tmp2422 = load i8*, i8** %.tmp2419
%.tmp2423 = getelementptr i8, i8* %.tmp2422, i32 %.tmp2421
%.tmp2424 = load i32, i32* %i.2240
%.tmp2425 = load i8*, i8** %text
%.tmp2426 = getelementptr i8, i8* %.tmp2425, i32 %.tmp2424
%.tmp2427 = load i8, i8* %.tmp2426
store i8 %.tmp2427, i8* %.tmp2423
br label %.if.end.2294
.if.end.2294:
br label %.if.end.2265
.if.end.2265:
%.tmp2428 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2429 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2430 = load i32, i32* %.tmp2429
%.tmp2431 = add i32 %.tmp2430, 1
store i32 %.tmp2431, i32* %.tmp2428
%.tmp2432 = load i32, i32* %i.2240
%.tmp2433 = add i32 %.tmp2432, 1
store i32 %.tmp2433, i32* %i.2240
br label %.for.start.2239
.for.end.2239:
%.tmp2434 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2435 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 1
%.tmp2436 = load i32, i32* %.tmp2435
%.tmp2437 = load i8*, i8** %.tmp2434
%.tmp2438 = getelementptr i8, i8* %.tmp2437, i32 %.tmp2436
store i8 0, i8* %.tmp2438
%buf.2439 = alloca i8*
store i8* null, i8** %buf.2439
%.tmp2440 = getelementptr i8*, i8** %buf.2439, i32 0
%.tmp2442 = getelementptr [9 x i8], [9 x i8]*@.str2441, i32 0, i32 0
%.tmp2443 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2444 = load i8*, i8** %.tmp2443
%.tmp2445 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2440, i8* %.tmp2442, i8* %.tmp2444)
%.tmp2446 = getelementptr {i32,i32,i8*}, {i32,i32,i8*}* %dest_string.2229, i32 0, i32 2
%.tmp2447 = load i8*, i8** %.tmp2446
call void(i8*) @free(i8* %.tmp2447)
%.tmp2448 = load i8*, i8** %buf.2439
ret i8* %.tmp2448
}
define i32 @m2225$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2449 = alloca i32
store i32 0, i32* %len.2449
%i.2451 = alloca i32
store i32 2, i32* %i.2451
br label %.for.start.2450
.for.start.2450:
%.tmp2452 = load i32, i32* %i.2451
%.tmp2453 = load i8*, i8** %text
%.tmp2454 = getelementptr i8, i8* %.tmp2453, i32 %.tmp2452
%.tmp2455 = load i8, i8* %.tmp2454
%.tmp2456 = icmp ne i8 %.tmp2455, 0
br i1 %.tmp2456, label %.for.continue.2450, label %.for.end.2450
.for.continue.2450:
%.tmp2457 = load i32, i32* %i.2451
%.tmp2458 = load i8*, i8** %text
%.tmp2459 = getelementptr i8, i8* %.tmp2458, i32 %.tmp2457
%.tmp2460 = load i8, i8* %.tmp2459
%.tmp2461 = icmp eq i8 %.tmp2460, 92
br i1 %.tmp2461, label %.if.true.2462, label %.if.false.2462
.if.true.2462:
%.tmp2463 = load i32, i32* %i.2451
%.tmp2464 = add i32 %.tmp2463, 2
store i32 %.tmp2464, i32* %i.2451
br label %.if.end.2462
.if.false.2462:
br label %.if.end.2462
.if.end.2462:
%.tmp2465 = load i32, i32* %len.2449
%.tmp2466 = add i32 %.tmp2465, 1
store i32 %.tmp2466, i32* %len.2449
%.tmp2467 = load i32, i32* %i.2451
%.tmp2468 = add i32 %.tmp2467, 1
store i32 %.tmp2468, i32* %i.2451
br label %.for.start.2450
.for.end.2450:
%.tmp2469 = load i32, i32* %len.2449
%.tmp2470 = sub i32 %.tmp2469, 1
ret i32 %.tmp2470
}
define i8* @m2225$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2471 = alloca i32
store i32 0, i32* %intval.2471
%buf.2472 = alloca i8*
store i8* null, i8** %buf.2472
%chrval.2473 = alloca i8
store i8 0, i8* %chrval.2473
%.tmp2474 = load i8*, i8** %chr_repr
%.tmp2475 = call i32(i8*) @strlen(i8* %.tmp2474)
%chr_len.2476 = alloca i32
store i32 %.tmp2475, i32* %chr_len.2476
%.tmp2477 = load i32, i32* %chr_len.2476
%.tmp2478 = icmp eq i32 %.tmp2477, 6
br i1 %.tmp2478, label %.if.true.2479, label %.if.false.2479
.if.true.2479:
%.tmp2480 = load i8*, i8** %chr_repr
%.tmp2482 = getelementptr [7 x i8], [7 x i8]*@.str2481, i32 0, i32 0
%.tmp2483 = getelementptr i32, i32* %intval.2471, i32 0
%.tmp2484 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2480, i8* %.tmp2482, i32* %.tmp2483)
%.tmp2485 = getelementptr i8*, i8** %buf.2472, i32 0
%.tmp2487 = getelementptr [3 x i8], [3 x i8]*@.str2486, i32 0, i32 0
%.tmp2488 = load i32, i32* %intval.2471
%.tmp2489 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2485, i8* %.tmp2487, i32 %.tmp2488)
br label %.if.end.2479
.if.false.2479:
%.tmp2490 = load i32, i32* %chr_len.2476
%.tmp2491 = icmp eq i32 %.tmp2490, 5
br i1 %.tmp2491, label %.if.true.2492, label %.if.false.2492
.if.true.2492:
%.tmp2493 = load i8*, i8** %chr_repr
%.tmp2495 = getelementptr [6 x i8], [6 x i8]*@.str2494, i32 0, i32 0
%.tmp2496 = getelementptr i32, i32* %intval.2471, i32 0
%.tmp2497 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2493, i8* %.tmp2495, i32* %.tmp2496)
%.tmp2498 = getelementptr i8*, i8** %buf.2472, i32 0
%.tmp2500 = getelementptr [3 x i8], [3 x i8]*@.str2499, i32 0, i32 0
%.tmp2501 = load i32, i32* %intval.2471
%.tmp2502 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2498, i8* %.tmp2500, i32 %.tmp2501)
br label %.if.end.2492
.if.false.2492:
%.tmp2503 = load i32, i32* %chr_len.2476
%.tmp2504 = icmp eq i32 %.tmp2503, 4
br i1 %.tmp2504, label %.if.true.2505, label %.if.false.2505
.if.true.2505:
%.tmp2506 = load i8*, i8** %chr_repr
%.tmp2508 = getelementptr [6 x i8], [6 x i8]*@.str2507, i32 0, i32 0
%.tmp2509 = getelementptr i8, i8* %chrval.2473, i32 0
%.tmp2510 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2506, i8* %.tmp2508, i8* %.tmp2509)
%.tmp2511 = load i8, i8* %chrval.2473
%.tmp2512 = icmp eq i8 %.tmp2511, 110
br i1 %.tmp2512, label %.if.true.2513, label %.if.false.2513
.if.true.2513:
%.tmp2515 = getelementptr [3 x i8], [3 x i8]*@.str2514, i32 0, i32 0
store i8* %.tmp2515, i8** %buf.2472
br label %.if.end.2513
.if.false.2513:
%.tmp2516 = bitcast ptr null to i8*
ret i8* %.tmp2516
br label %.if.end.2513
.if.end.2513:
br label %.if.end.2505
.if.false.2505:
%.tmp2517 = load i32, i32* %chr_len.2476
%.tmp2518 = icmp eq i32 %.tmp2517, 3
br i1 %.tmp2518, label %.if.true.2519, label %.if.false.2519
.if.true.2519:
%.tmp2520 = load i8*, i8** %chr_repr
%.tmp2522 = getelementptr [5 x i8], [5 x i8]*@.str2521, i32 0, i32 0
%.tmp2523 = getelementptr i32, i32* %intval.2471, i32 0
%.tmp2524 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2520, i8* %.tmp2522, i32* %.tmp2523)
%.tmp2525 = getelementptr i8*, i8** %buf.2472, i32 0
%.tmp2527 = getelementptr [3 x i8], [3 x i8]*@.str2526, i32 0, i32 0
%.tmp2528 = load i32, i32* %intval.2471
%.tmp2529 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2525, i8* %.tmp2527, i32 %.tmp2528)
br label %.if.end.2519
.if.false.2519:
%.tmp2530 = bitcast ptr null to i8*
ret i8* %.tmp2530
br label %.if.end.2519
.if.end.2519:
br label %.if.end.2505
.if.end.2505:
br label %.if.end.2492
.if.end.2492:
br label %.if.end.2479
.if.end.2479:
%.tmp2531 = load i8*, i8** %buf.2472
ret i8* %.tmp2531
}
@.str2441 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2481 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2486 = constant [3 x i8] c"%d\00"
@.str2494 = constant [6 x i8] c"'\5C%x'\00"
@.str2499 = constant [3 x i8] c"%d\00"
@.str2507 = constant [6 x i8] c"'\5C%c'\00"
@.str2514 = constant [3 x i8] c"10\00"
@.str2521 = constant [5 x i8] c"'%c'\00"
@.str2526 = constant [3 x i8] c"%d\00"
define i8* @m2532$append_tmpl.cp() {
%.tmp2534 = getelementptr [1883 x i8], [1883 x i8]*@.str2533, i32 0, i32 0
ret i8* %.tmp2534
}
@.str2533 = constant [1883 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
store i8 %5$s, %4$s* %%%1$s.tmp26
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
%.tmp2535 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2536 = icmp eq %m1861$.Type.type* %.tmp2535, null
br i1 %.tmp2536, label %.if.true.2537, label %.if.false.2537
.if.true.2537:
%.tmp2538 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp2538
br label %.if.end.2537
.if.false.2537:
br label %.if.end.2537
.if.end.2537:
%.tmp2539 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2540 = ptrtoint %m1861$.Type.type* %.tmp2539 to i32
%.tmp2541 = call i8*(i32) @malloc(i32 %.tmp2540)
%.tmp2542 = bitcast i8* %.tmp2541 to %m1861$.Type.type*
%clone.2543 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2542, %m1861$.Type.type** %clone.2543
%.tmp2544 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2543
%.tmp2545 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2544, i32 0, i32 3
%.tmp2546 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2547 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2546, i32 0, i32 3
%.tmp2548 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2547
store %m1861$.Type.type* %.tmp2548, %m1861$.Type.type** %.tmp2545
%.tmp2549 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2543
%.tmp2550 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2549, i32 0, i32 4
%.tmp2551 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2552 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2551, i32 0, i32 4
%.tmp2553 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2552
%.tmp2554 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2553)
store %m1861$.Type.type* %.tmp2554, %m1861$.Type.type** %.tmp2550
%.tmp2555 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2543
%.tmp2556 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2555, i32 0, i32 2
%.tmp2557 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2558 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2557, i32 0, i32 2
%.tmp2559 = load i8*, i8** %.tmp2558
store i8* %.tmp2559, i8** %.tmp2556
%.tmp2560 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2543
%.tmp2561 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2560, i32 0, i32 0
%.tmp2562 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2563 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2562, i32 0, i32 0
%.tmp2564 = load i8*, i8** %.tmp2563
store i8* %.tmp2564, i8** %.tmp2561
%.tmp2565 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2543
%.tmp2566 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2565, i32 0, i32 1
%.tmp2567 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2568 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2567, i32 0, i32 1
%.tmp2569 = load i8*, i8** %.tmp2568
store i8* %.tmp2569, i8** %.tmp2566
%.tmp2570 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2543
ret %m1861$.Type.type* %.tmp2570
}
define %m1861$.Type.type* @m1861$new_type.m1861$.Type.typep() {
%.tmp2571 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2572 = ptrtoint %m1861$.Type.type* %.tmp2571 to i32
%.tmp2573 = call i8*(i32) @malloc(i32 %.tmp2572)
%.tmp2574 = bitcast i8* %.tmp2573 to %m1861$.Type.type*
%type.2575 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2574, %m1861$.Type.type** %type.2575
%.tmp2576 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2575
%.tmp2577 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2576, i32 0, i32 1
store i8* null, i8** %.tmp2577
%.tmp2578 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2575
%.tmp2579 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2578, i32 0, i32 2
store i8* null, i8** %.tmp2579
%.tmp2580 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2575
%.tmp2581 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2580, i32 0, i32 0
store i8* null, i8** %.tmp2581
%.tmp2582 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2575
%.tmp2583 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2582, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2583
%.tmp2584 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2575
%.tmp2585 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2584, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2585
%.tmp2586 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2575
ret %m1861$.Type.type* %.tmp2586
}
define void @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.dest.arg, %m1861$.Type.type* %.src.arg) {
%dest = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.dest.arg, %m1861$.Type.type** %dest
%src = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.src.arg, %m1861$.Type.type** %src
%.tmp2587 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2588 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2587, i32 0, i32 0
%.tmp2589 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2590 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2589, i32 0, i32 0
%.tmp2591 = load i8*, i8** %.tmp2590
store i8* %.tmp2591, i8** %.tmp2588
%.tmp2592 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2593 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2592, i32 0, i32 1
%.tmp2594 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2595 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2594, i32 0, i32 1
%.tmp2596 = load i8*, i8** %.tmp2595
store i8* %.tmp2596, i8** %.tmp2593
%.tmp2597 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2598 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2597, i32 0, i32 2
%.tmp2599 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2600 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2599, i32 0, i32 2
%.tmp2601 = load i8*, i8** %.tmp2600
store i8* %.tmp2601, i8** %.tmp2598
%.tmp2602 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2603 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2602, i32 0, i32 3
%.tmp2604 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2603
%.tmp2605 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2606 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2605, i32 0, i32 3
%.tmp2607 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2606
%.tmp2608 = icmp ne %m1861$.Type.type* %.tmp2604, %.tmp2607
br i1 %.tmp2608, label %.if.true.2609, label %.if.false.2609
.if.true.2609:
%.tmp2610 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2611 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2610, i32 0, i32 3
%.tmp2612 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2613 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2612, i32 0, i32 3
%.tmp2614 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2613
store %m1861$.Type.type* %.tmp2614, %m1861$.Type.type** %.tmp2611
%.tmp2615 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2616 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2615, i32 0, i32 3
%.tmp2617 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2616
%.tmp2618 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2619 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2618, i32 0, i32 3
%.tmp2620 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2619
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2617, %m1861$.Type.type* %.tmp2620)
br label %.if.end.2609
.if.false.2609:
br label %.if.end.2609
.if.end.2609:
%.tmp2621 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2622 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2621, i32 0, i32 4
%.tmp2623 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2622
%.tmp2624 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2625 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2624, i32 0, i32 4
%.tmp2626 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2625
%.tmp2627 = icmp ne %m1861$.Type.type* %.tmp2623, %.tmp2626
br i1 %.tmp2627, label %.if.true.2628, label %.if.false.2628
.if.true.2628:
%.tmp2629 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2630 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2629, i32 0, i32 4
%.tmp2631 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2632 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2631, i32 0, i32 4
%.tmp2633 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2632
store %m1861$.Type.type* %.tmp2633, %m1861$.Type.type** %.tmp2630
%.tmp2634 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2635 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2634, i32 0, i32 4
%.tmp2636 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2635
%.tmp2637 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2638 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2637, i32 0, i32 4
%.tmp2639 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2638
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2636, %m1861$.Type.type* %.tmp2639)
br label %.if.end.2628
.if.false.2628:
br label %.if.end.2628
.if.end.2628:
ret void
}
define void @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2640 = load i32, i32* %level
%.tmp2641 = add i32 %.tmp2640, 1
%.tmp2642 = call i8*(i32) @malloc(i32 %.tmp2641)
%.tmp2643 = bitcast i8* %.tmp2642 to i8*
%indent.2644 = alloca i8*
store i8* %.tmp2643, i8** %indent.2644
%i.2646 = alloca i32
store i32 0, i32* %i.2646
br label %.for.start.2645
.for.start.2645:
%.tmp2647 = load i32, i32* %i.2646
%.tmp2648 = load i32, i32* %level
%.tmp2649 = icmp slt i32 %.tmp2647, %.tmp2648
br i1 %.tmp2649, label %.for.continue.2645, label %.for.end.2645
.for.continue.2645:
%.tmp2650 = load i32, i32* %i.2646
%.tmp2651 = load i8*, i8** %indent.2644
%.tmp2652 = getelementptr i8, i8* %.tmp2651, i32 %.tmp2650
store i8 32, i8* %.tmp2652
%.tmp2653 = load i32, i32* %i.2646
%.tmp2654 = add i32 %.tmp2653, 1
store i32 %.tmp2654, i32* %i.2646
br label %.for.start.2645
.for.end.2645:
%.tmp2655 = load i32, i32* %level
%.tmp2656 = load i8*, i8** %indent.2644
%.tmp2657 = getelementptr i8, i8* %.tmp2656, i32 %.tmp2655
store i8 0, i8* %.tmp2657
%.tmp2659 = getelementptr [5 x i8], [5 x i8]*@.str2658, i32 0, i32 0
%.tmp2660 = load i8*, i8** %indent.2644
%.tmp2661 = call i32(i8*,...) @printf(i8* %.tmp2659, i8* %.tmp2660)
%.tmp2663 = getelementptr [21 x i8], [21 x i8]*@.str2662, i32 0, i32 0
%.tmp2664 = load i8*, i8** %indent.2644
%.tmp2665 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2666 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2665, i32 0, i32 0
%.tmp2667 = load i8*, i8** %.tmp2666
%.tmp2668 = call i32(i8*,...) @printf(i8* %.tmp2663, i8* %.tmp2664, i8* %.tmp2667)
%.tmp2670 = getelementptr [16 x i8], [16 x i8]*@.str2669, i32 0, i32 0
%.tmp2671 = load i8*, i8** %indent.2644
%.tmp2672 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2673 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2672, i32 0, i32 1
%.tmp2674 = load i8*, i8** %.tmp2673
%.tmp2675 = call i32(i8*,...) @printf(i8* %.tmp2670, i8* %.tmp2671, i8* %.tmp2674)
%.tmp2677 = getelementptr [16 x i8], [16 x i8]*@.str2676, i32 0, i32 0
%.tmp2678 = load i8*, i8** %indent.2644
%.tmp2679 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2680 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2679, i32 0, i32 2
%.tmp2681 = load i8*, i8** %.tmp2680
%.tmp2682 = call i32(i8*,...) @printf(i8* %.tmp2677, i8* %.tmp2678, i8* %.tmp2681)
%.tmp2683 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2684 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2683, i32 0, i32 3
%.tmp2685 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2684
%.tmp2686 = icmp eq %m1861$.Type.type* %.tmp2685, null
br i1 %.tmp2686, label %.if.true.2687, label %.if.false.2687
.if.true.2687:
%.tmp2689 = getelementptr [16 x i8], [16 x i8]*@.str2688, i32 0, i32 0
%.tmp2690 = load i8*, i8** %indent.2644
%.tmp2691 = call i32(i8*,...) @printf(i8* %.tmp2689, i8* %.tmp2690)
br label %.if.end.2687
.if.false.2687:
%.tmp2693 = getelementptr [10 x i8], [10 x i8]*@.str2692, i32 0, i32 0
%.tmp2694 = load i8*, i8** %indent.2644
%.tmp2695 = call i32(i8*,...) @printf(i8* %.tmp2693, i8* %.tmp2694)
%.tmp2696 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2697 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2696, i32 0, i32 3
%.tmp2698 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2697
%.tmp2699 = load i32, i32* %level
%.tmp2700 = add i32 %.tmp2699, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2698, i32 %.tmp2700)
br label %.if.end.2687
.if.end.2687:
%.tmp2701 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2702 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2701, i32 0, i32 4
%.tmp2703 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2702
%.tmp2704 = icmp eq %m1861$.Type.type* %.tmp2703, null
br i1 %.tmp2704, label %.if.true.2705, label %.if.false.2705
.if.true.2705:
%.tmp2707 = getelementptr [18 x i8], [18 x i8]*@.str2706, i32 0, i32 0
%.tmp2708 = load i8*, i8** %indent.2644
%.tmp2709 = call i32(i8*,...) @printf(i8* %.tmp2707, i8* %.tmp2708)
br label %.if.end.2705
.if.false.2705:
%.tmp2711 = getelementptr [12 x i8], [12 x i8]*@.str2710, i32 0, i32 0
%.tmp2712 = load i8*, i8** %indent.2644
%.tmp2713 = call i32(i8*,...) @printf(i8* %.tmp2711, i8* %.tmp2712)
%.tmp2714 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2715 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2714, i32 0, i32 4
%.tmp2716 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2715
%.tmp2717 = load i32, i32* %level
%.tmp2718 = add i32 %.tmp2717, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2716, i32 %.tmp2718)
br label %.if.end.2705
.if.end.2705:
%.tmp2720 = getelementptr [5 x i8], [5 x i8]*@.str2719, i32 0, i32 0
%.tmp2721 = load i8*, i8** %indent.2644
%.tmp2722 = call i32(i8*,...) @printf(i8* %.tmp2720, i8* %.tmp2721)
ret void
}
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,%m1861$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1861$.AssignableInfo.type* @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.node.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2723 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* null, i32 1
%.tmp2724 = ptrtoint %m1861$.AssignableInfo.type* %.tmp2723 to i32
%.tmp2725 = call i8*(i32) @malloc(i32 %.tmp2724)
%.tmp2726 = bitcast i8* %.tmp2725 to %m1861$.AssignableInfo.type*
%ptr.2727 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp2726, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2728 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2729 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2728, i32 0, i32 1
%.tmp2730 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2730, i8* %.tmp2729
%.tmp2731 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2732 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2731, i32 0, i32 0
store i8* null, i8** %.tmp2732
%.tmp2733 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2734 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2733, i32 0, i32 2
store i8* null, i8** %.tmp2734
%.tmp2735 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2736 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2735, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2736
%.tmp2737 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2738 = icmp ne %m307$.Node.type* %.tmp2737, null
br i1 %.tmp2738, label %.if.true.2739, label %.if.false.2739
.if.true.2739:
%.tmp2740 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2741 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2740, i32 0, i32 4
%.tmp2742 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2743 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2742, i32 0, i32 3
%.tmp2744 = load i32, i32* %.tmp2743
store i32 %.tmp2744, i32* %.tmp2741
%.tmp2745 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2746 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2745, i32 0, i32 5
%.tmp2747 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2748 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2747, i32 0, i32 4
%.tmp2749 = load i32, i32* %.tmp2748
store i32 %.tmp2749, i32* %.tmp2746
%.tmp2750 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2751 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2750, i32 0, i32 6
%.tmp2752 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2753 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2752, i32 0, i32 2
%.tmp2754 = load i8*, i8** %.tmp2753
store i8* %.tmp2754, i8** %.tmp2751
br label %.if.end.2739
.if.false.2739:
%.tmp2755 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2756 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2755, i32 0, i32 4
store i32 0, i32* %.tmp2756
%.tmp2757 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2758 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2757, i32 0, i32 5
store i32 0, i32* %.tmp2758
%.tmp2759 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
%.tmp2760 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2759, i32 0, i32 6
store i8* null, i8** %.tmp2760
br label %.if.end.2739
.if.end.2739:
%.tmp2761 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2727
ret %m1861$.AssignableInfo.type* %.tmp2761
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2762 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2763 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2762, i32 0, i32 0
%.tmp2764 = load i8*, i8** %id
store i8* %.tmp2764, i8** %.tmp2763
%.tmp2765 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2766 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2765, i32 0, i32 1
%.tmp2767 = load i8, i8* %scope
store i8 %.tmp2767, i8* %.tmp2766
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2768 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2769 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2768, i32 0, i32 1
%.tmp2770 = load i8, i8* %.tmp2769
%.tmp2771 = load i8, i8* @SCOPE_CONST
%.tmp2772 = icmp eq i8 %.tmp2770, %.tmp2771
br i1 %.tmp2772, label %.if.true.2773, label %.if.false.2773
.if.true.2773:
%.tmp2774 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2775 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2774, i32 0, i32 0
%.tmp2776 = load i8*, i8** %.tmp2775
ret i8* %.tmp2776
br label %.if.end.2773
.if.false.2773:
br label %.if.end.2773
.if.end.2773:
%buf.2777 = alloca i8*
store i8* null, i8** %buf.2777
%.tmp2778 = getelementptr i8*, i8** %buf.2777, i32 0
%.tmp2780 = getelementptr [5 x i8], [5 x i8]*@.str2779, i32 0, i32 0
%.tmp2781 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2782 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2781, i32 0, i32 1
%.tmp2783 = load i8, i8* %.tmp2782
%.tmp2784 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2785 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2784, i32 0, i32 0
%.tmp2786 = load i8*, i8** %.tmp2785
%.tmp2787 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2778, i8* %.tmp2780, i8 %.tmp2783, i8* %.tmp2786)
%.tmp2788 = load i8*, i8** %buf.2777
ret i8* %.tmp2788
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
%tmp_buff.2789 = alloca i8*
store i8* null, i8** %tmp_buff.2789
%.tmp2790 = getelementptr i8*, i8** %tmp_buff.2789, i32 0
%.tmp2792 = getelementptr [7 x i8], [7 x i8]*@.str2791, i32 0, i32 0
%.tmp2793 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2794 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2793)
%.tmp2795 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2790, i8* %.tmp2792, i32 %.tmp2794)
%.tmp2796 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2797 = load i8, i8* @SCOPE_LOCAL
%.tmp2798 = load i8*, i8** %tmp_buff.2789
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2796, i8 %.tmp2797, i8* %.tmp2798)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2800 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2801 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2800, i32 0, i32 6
%.tmp2802 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2801
%m.2803 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2802, %m1861$.ModuleLookup.type** %m.2803
br label %.for.start.2799
.for.start.2799:
%.tmp2804 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2803
%.tmp2805 = icmp ne %m1861$.ModuleLookup.type* %.tmp2804, null
br i1 %.tmp2805, label %.for.continue.2799, label %.for.end.2799
.for.continue.2799:
%.tmp2806 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2803
%.tmp2807 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2806, i32 0, i32 0
%.tmp2808 = load i8*, i8** %.tmp2807
%.tmp2809 = load i8*, i8** %filename
%.tmp2810 = call i32(i8*,i8*) @strcmp(i8* %.tmp2808, i8* %.tmp2809)
%.tmp2811 = icmp eq i32 %.tmp2810, 0
br i1 %.tmp2811, label %.if.true.2812, label %.if.false.2812
.if.true.2812:
%.tmp2813 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2803
ret %m1861$.ModuleLookup.type* %.tmp2813
br label %.if.end.2812
.if.false.2812:
br label %.if.end.2812
.if.end.2812:
%.tmp2814 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2803
%.tmp2815 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2814, i32 0, i32 2
%.tmp2816 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2815
store %m1861$.ModuleLookup.type* %.tmp2816, %m1861$.ModuleLookup.type** %m.2803
br label %.for.start.2799
.for.end.2799:
%.tmp2817 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2817
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2818 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2819 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2820 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2819, i32 0, i32 7
%.tmp2821 = load i8*, i8** %.tmp2820
%.tmp2822 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2818, i8* %.tmp2821)
ret %m1861$.ModuleLookup.type* %.tmp2822
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2823 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2824 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2823, i32 0, i32 5
%.tmp2825 = load i32, i32* %.tmp2824
%uid.2826 = alloca i32
store i32 %.tmp2825, i32* %uid.2826
%.tmp2827 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2828 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2827, i32 0, i32 5
%.tmp2829 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2830 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2829, i32 0, i32 5
%.tmp2831 = load i32, i32* %.tmp2830
%.tmp2832 = add i32 %.tmp2831, 1
store i32 %.tmp2832, i32* %.tmp2828
%.tmp2833 = load i32, i32* %uid.2826
ret i32 %.tmp2833
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2834 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2835 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2834 to i32
%.tmp2836 = call i8*(i32) @malloc(i32 %.tmp2835)
%.tmp2837 = bitcast i8* %.tmp2836 to %m1861$.CompilerCtx.type*
%ctx.2838 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2837, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2839 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2840 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2839, i32 0, i32 1
%.tmp2841 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2841, %m0$.File.type** %.tmp2840
%.tmp2842 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2843 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2842, i32 0, i32 0
%.tmp2844 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2844, %m307$.Node.type** %.tmp2843
%.tmp2845 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2846 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2845, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2846
%.tmp2847 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2848 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2847, i32 0, i32 5
store i32 0, i32* %.tmp2848
%.tmp2849 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2850 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2849, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2850
%.tmp2851 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2852 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2851, i32 0, i32 7
%.tmp2853 = load i8*, i8** %filename
store i8* %.tmp2853, i8** %.tmp2852
%.tmp2854 = call i8*() @m1862$grammar.cp()
%.tmp2855 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2854)
%grammar_file.2856 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2855, %m0$.File.type** %grammar_file.2856
%.tmp2857 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2856
%.tmp2858 = icmp eq %m0$.File.type* %.tmp2857, null
br i1 %.tmp2858, label %.if.true.2859, label %.if.false.2859
.if.true.2859:
%.tmp2860 = bitcast ptr null to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2860
br label %.if.end.2859
.if.false.2859:
br label %.if.end.2859
.if.end.2859:
%.tmp2861 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2856
%.tmp2862 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2861)
%grammar_ctx.2863 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2862, %m307$.ParsingContext.type** %grammar_ctx.2863
%.tmp2864 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2856
%.tmp2865 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2864)
%.tmp2866 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2867 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2866, i32 0, i32 4
%.tmp2868 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2863
%.tmp2869 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2868)
store %m307$.Rule.type** %.tmp2869, %m307$.Rule.type*** %.tmp2867
%.tmp2870 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2871 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2870, i32 0, i32 6
%.tmp2872 = load i32, i32* @ModuleLookup_size
%.tmp2873 = call i8*(i32) @malloc(i32 %.tmp2872)
%.tmp2874 = bitcast i8* %.tmp2873 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2874, %m1861$.ModuleLookup.type** %.tmp2871
%.tmp2875 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2876 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2875, i32 0, i32 6
%.tmp2877 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2876
%.tmp2878 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2877, i32 0, i32 0
%.tmp2879 = load i8*, i8** %filename
store i8* %.tmp2879, i8** %.tmp2878
%.tmp2880 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2881 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2880, i32 0, i32 6
%.tmp2882 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2881
%.tmp2883 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2882, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2883
%.tmp2884 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2885 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2884, i32 0, i32 6
%.tmp2886 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2885
%.tmp2887 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2886, i32 0, i32 1
%.tmp2889 = getelementptr [1 x i8], [1 x i8]*@.str2888, i32 0, i32 0
store i8* %.tmp2889, i8** %.tmp2887
%.tmp2890 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2891 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2890, i32 0, i32 6
%.tmp2892 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2891
%.tmp2893 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2892, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2893
%.tmp2894 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2838
%.tmp2895 = bitcast %m1861$.CompilerCtx.type* %.tmp2894 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2895
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
%.tmp2896 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2897 = ptrtoint %m1861$.Scope.type* %.tmp2896 to i32
%.tmp2898 = call i8*(i32) @malloc(i32 %.tmp2897)
%.tmp2899 = bitcast i8* %.tmp2898 to %m1861$.Scope.type*
%s.2900 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2899, %m1861$.Scope.type** %s.2900
%.tmp2901 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2902 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2901)
%m.2903 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2902, %m1861$.ModuleLookup.type** %m.2903
%.tmp2904 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2900
%.tmp2905 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2904, i32 0, i32 5
%.tmp2906 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2903
%.tmp2907 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2906, i32 0, i32 3
%.tmp2908 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2907
store %m1861$.Scope.type* %.tmp2908, %m1861$.Scope.type** %.tmp2905
%.tmp2909 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2900
%.tmp2910 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2909, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2910
%.tmp2911 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2900
%.tmp2912 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2911, i32 0, i32 2
%.tmp2913 = load i8*, i8** %type
store i8* %.tmp2913, i8** %.tmp2912
%.tmp2914 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2900
%.tmp2915 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2914, i32 0, i32 3
%.tmp2916 = load i8*, i8** %begin_id
store i8* %.tmp2916, i8** %.tmp2915
%.tmp2917 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2900
%.tmp2918 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2917, i32 0, i32 4
%.tmp2919 = load i8*, i8** %end_id
store i8* %.tmp2919, i8** %.tmp2918
%.tmp2920 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2903
%.tmp2921 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2920, i32 0, i32 3
%.tmp2922 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2900
store %m1861$.Scope.type* %.tmp2922, %m1861$.Scope.type** %.tmp2921
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2923 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2924 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2923)
%m.2925 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2924, %m1861$.ModuleLookup.type** %m.2925
%.tmp2926 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2925
%.tmp2927 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2926, i32 0, i32 3
%.tmp2928 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2927
%.tmp2929 = icmp ne %m1861$.Scope.type* %.tmp2928, null
%.tmp2931 = getelementptr [61 x i8], [61 x i8]*@.str2930, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2929, i8* %.tmp2931)
%.tmp2932 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2925
%.tmp2933 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2932, i32 0, i32 3
%.tmp2934 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2925
%.tmp2935 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2934, i32 0, i32 3
%.tmp2936 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2935
%.tmp2937 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2936, i32 0, i32 5
%.tmp2938 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2937
store %m1861$.Scope.type* %.tmp2938, %m1861$.Scope.type** %.tmp2933
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2939 = call i8*() @m1862$grammar.cp()
%.tmp2940 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2939)
%grammar_file.2941 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2940, %m0$.File.type** %grammar_file.2941
%.tmp2942 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2941
%.tmp2943 = icmp eq %m0$.File.type* %.tmp2942, null
br i1 %.tmp2943, label %.if.true.2944, label %.if.false.2944
.if.true.2944:
ret i1 0
br label %.if.end.2944
.if.false.2944:
br label %.if.end.2944
.if.end.2944:
%.tmp2945 = load i8*, i8** %filepath
%.tmp2946 = load i32, i32* @O_RDONLY
%.tmp2947 = call i32(i8*,i32) @open(i8* %.tmp2945, i32 %.tmp2946)
%input_fd.2948 = alloca i32
store i32 %.tmp2947, i32* %input_fd.2948
%.tmp2949 = load i32, i32* %input_fd.2948
%.tmp2950 = icmp sle i32 %.tmp2949, 0
br i1 %.tmp2950, label %.if.true.2951, label %.if.false.2951
.if.true.2951:
%err_msg.2952 = alloca i8*
store i8* null, i8** %err_msg.2952
%.tmp2953 = getelementptr i8*, i8** %err_msg.2952, i32 0
%.tmp2955 = getelementptr [26 x i8], [26 x i8]*@.str2954, i32 0, i32 0
%.tmp2956 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2957 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2953, i8* %.tmp2955, %m307$.Node.type* %.tmp2956)
%.tmp2958 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2959 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2960 = load i8*, i8** %err_msg.2952
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2958, %m307$.Node.type* %.tmp2959, i8* %.tmp2960)
ret i1 0
br label %.if.end.2951
.if.false.2951:
br label %.if.end.2951
.if.end.2951:
%.tmp2961 = load i32, i32* %input_fd.2948
%.tmp2962 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2961)
%p.2963 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2962, %m229$.PeekerInfo.type** %p.2963
%.tmp2964 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2963
%.tmp2965 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2964, i32 0, i32 6
%.tmp2966 = load i8*, i8** %filepath
store i8* %.tmp2966, i8** %.tmp2965
%.tmp2967 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2963
%.tmp2968 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2967, i1 0)
%tokens.2969 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2968, %m308$.Token.type** %tokens.2969
%.tmp2970 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2971 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2970, i32 0, i32 4
%.tmp2972 = load %m307$.Rule.type**, %m307$.Rule.type*** %.tmp2971
%.tmp2974 = getelementptr [6 x i8], [6 x i8]*@.str2973, i32 0, i32 0
%.tmp2975 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2969
%.tmp2976 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2972, i8* %.tmp2974, %m308$.Token.type* %.tmp2975)
%ast.2977 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2976, %m307$.ParseResult.type** %ast.2977
%.tmp2978 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2977
%.tmp2979 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2978, i32 0, i32 0
%.tmp2980 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2979
%.tmp2981 = icmp ne %m751$.Error.type* %.tmp2980, null
br i1 %.tmp2981, label %.if.true.2982, label %.if.false.2982
.if.true.2982:
%.tmp2983 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2984 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2977
%.tmp2985 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2984, i32 0, i32 0
%.tmp2986 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2985
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp2983, %m751$.Error.type* %.tmp2986)
br label %.if.end.2982
.if.false.2982:
br label %.if.end.2982
.if.end.2982:
%.tmp2987 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2988 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2977
%.tmp2989 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2988, i32 0, i32 1
%.tmp2990 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2989
%.tmp2991 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2987, %m307$.Node.type* %.tmp2990)
ret i1 %.tmp2991
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2992 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2993 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2992, i32 0, i32 2
%.tmp2994 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2993
%.tmp2995 = icmp eq %m1861$.ErrorList.type* %.tmp2994, null
br i1 %.tmp2995, label %.if.true.2996, label %.if.false.2996
.if.true.2996:
%.tmp2997 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2998 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2997, %m307$.Node.type* %.tmp2998)
br label %.if.end.2996
.if.false.2996:
br label %.if.end.2996
.if.end.2996:
%.tmp2999 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3000 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2999, i32 0, i32 2
%.tmp3001 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3000
%.tmp3002 = icmp ne %m1861$.ErrorList.type* %.tmp3001, null
%has_errors.3003 = alloca i1
store i1 %.tmp3002, i1* %has_errors.3003
%.tmp3005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3006 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3005, i32 0, i32 2
%.tmp3007 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3006
%err.3008 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp3007, %m1861$.ErrorList.type** %err.3008
br label %.for.start.3004
.for.start.3004:
%.tmp3009 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3008
%.tmp3010 = icmp ne %m1861$.ErrorList.type* %.tmp3009, null
br i1 %.tmp3010, label %.for.continue.3004, label %.for.end.3004
.for.continue.3004:
%.tmp3011 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3008
%.tmp3012 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3011, i32 0, i32 2
%.tmp3013 = load i1, i1* %.tmp3012
%.tmp3014 = icmp eq i1 %.tmp3013, 0
br i1 %.tmp3014, label %.if.true.3015, label %.if.false.3015
.if.true.3015:
%.tmp3016 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3008
%.tmp3017 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3016, i32 0, i32 0
%.tmp3018 = load %m751$.Error.type*, %m751$.Error.type** %.tmp3017
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp3018)
%.tmp3019 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3008
%.tmp3020 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3019, i32 0, i32 2
store i1 1, i1* %.tmp3020
br label %.if.end.3015
.if.false.3015:
br label %.if.end.3015
.if.end.3015:
%.tmp3021 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.3008
%.tmp3022 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp3021, i32 0, i32 1
%.tmp3023 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp3022
store %m1861$.ErrorList.type* %.tmp3023, %m1861$.ErrorList.type** %err.3008
br label %.for.start.3004
.for.end.3004:
%.tmp3025 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3026 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3025, i32 0, i32 3
%.tmp3027 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3026
%g.3028 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp3027, %m1861$.GlobalName.type** %g.3028
br label %.for.start.3024
.for.start.3024:
%.tmp3029 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3028
%.tmp3030 = icmp ne %m1861$.GlobalName.type* %.tmp3029, null
br i1 %.tmp3030, label %.for.continue.3024, label %.for.end.3024
.for.continue.3024:
%.tmp3031 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3032 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3028
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp3031, %m1861$.GlobalName.type* %.tmp3032)
%.tmp3033 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3028
%.tmp3034 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3033, i32 0, i32 4
%.tmp3035 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3034
store %m1861$.GlobalName.type* %.tmp3035, %m1861$.GlobalName.type** %g.3028
br label %.for.start.3024
.for.end.3024:
%.tmp3036 = load i1, i1* %has_errors.3003
ret i1 %.tmp3036
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp3037 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3038 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3037, i32 0, i32 0
%.tmp3039 = load i8*, i8** %.tmp3038
%.tmp3041 = getelementptr [6 x i8], [6 x i8]*@.str3040, i32 0, i32 0
%.tmp3042 = call i32(i8*,i8*) @strcmp(i8* %.tmp3039, i8* %.tmp3041)
%.tmp3043 = icmp ne i32 %.tmp3042, 0
br i1 %.tmp3043, label %.if.true.3044, label %.if.false.3044
.if.true.3044:
ret void
br label %.if.end.3044
.if.false.3044:
br label %.if.end.3044
.if.end.3044:
%.tmp3045 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3047 = getelementptr [7 x i8], [7 x i8]*@.str3046, i32 0, i32 0
%.tmp3048 = bitcast ptr null to i8*
%.tmp3049 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3045, i8* %.tmp3047, i8* %.tmp3048, i8* %.tmp3049)
%.tmp3050 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3051 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3050, i32 0, i32 6
%.tmp3052 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3051
%start.3053 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3052, %m307$.Node.type** %start.3053
%.tmp3054 = load %m307$.Node.type*, %m307$.Node.type** %start.3053
%.tmp3055 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3054, i32 0, i32 0
%.tmp3056 = load i8*, i8** %.tmp3055
%.tmp3058 = getelementptr [13 x i8], [13 x i8]*@.str3057, i32 0, i32 0
%.tmp3059 = call i32(i8*,i8*) @strcmp(i8* %.tmp3056, i8* %.tmp3058)
%.tmp3060 = icmp eq i32 %.tmp3059, 0
br i1 %.tmp3060, label %.if.true.3061, label %.if.false.3061
.if.true.3061:
%.tmp3062 = load %m307$.Node.type*, %m307$.Node.type** %start.3053
%.tmp3063 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3062, i32 0, i32 7
%.tmp3064 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3063
store %m307$.Node.type* %.tmp3064, %m307$.Node.type** %start.3053
br label %.if.end.3061
.if.false.3061:
br label %.if.end.3061
.if.end.3061:
%.tmp3066 = load %m307$.Node.type*, %m307$.Node.type** %start.3053
%stmt.3067 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3066, %m307$.Node.type** %stmt.3067
br label %.for.start.3065
.for.start.3065:
%.tmp3068 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3067
%.tmp3069 = icmp ne %m307$.Node.type* %.tmp3068, null
br i1 %.tmp3069, label %.for.continue.3065, label %.for.end.3065
.for.continue.3065:
%.tmp3070 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3071 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3067
%.tmp3072 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3071, i32 0, i32 6
%.tmp3073 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3072
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3070, %m307$.Node.type* %.tmp3073, i1 1)
%.tmp3074 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3067
%.tmp3075 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3074, i32 0, i32 7
%.tmp3076 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3075
store %m307$.Node.type* %.tmp3076, %m307$.Node.type** %stmt.3067
br label %.for.start.3065
.for.end.3065:
%.tmp3078 = load %m307$.Node.type*, %m307$.Node.type** %start.3053
%s.3079 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3078, %m307$.Node.type** %s.3079
br label %.for.start.3077
.for.start.3077:
%.tmp3080 = load %m307$.Node.type*, %m307$.Node.type** %s.3079
%.tmp3081 = icmp ne %m307$.Node.type* %.tmp3080, null
br i1 %.tmp3081, label %.for.continue.3077, label %.for.end.3077
.for.continue.3077:
%.tmp3082 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3083 = load %m307$.Node.type*, %m307$.Node.type** %s.3079
%.tmp3084 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3083, i32 0, i32 6
%.tmp3085 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3084
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3082, %m307$.Node.type* %.tmp3085, i1 0)
%.tmp3086 = load %m307$.Node.type*, %m307$.Node.type** %s.3079
%.tmp3087 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3086, i32 0, i32 7
%.tmp3088 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3087
store %m307$.Node.type* %.tmp3088, %m307$.Node.type** %s.3079
br label %.for.start.3077
.for.end.3077:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp3089 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3090 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3089, i32 0, i32 2
%.tmp3091 = load i1, i1* %.tmp3090
%.tmp3092 = icmp eq i1 %.tmp3091, 0
%.tmp3093 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3094 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3093, i32 0, i32 1
%.tmp3095 = load i8*, i8** %.tmp3094
%.tmp3097 = getelementptr [7 x i8], [7 x i8]*@.str3096, i32 0, i32 0
%.tmp3098 = call i32(i8*,i8*) @strcmp(i8* %.tmp3095, i8* %.tmp3097)
%.tmp3099 = icmp eq i32 %.tmp3098, 0
%.tmp3100 = and i1 %.tmp3092, %.tmp3099
br i1 %.tmp3100, label %.if.true.3101, label %.if.false.3101
.if.true.3101:
%.tmp3102 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3103 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3102, i32 0, i32 1
%.tmp3104 = load %m0$.File.type*, %m0$.File.type** %.tmp3103
%.tmp3106 = getelementptr [21 x i8], [21 x i8]*@.str3105, i32 0, i32 0
%.tmp3107 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3108 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3107, i32 0, i32 3
%.tmp3109 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3108
%.tmp3110 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3109)
%.tmp3111 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3112 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3113 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3112, i32 0, i32 3
%.tmp3114 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3113
%.tmp3115 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3114, i32 0, i32 3
%.tmp3116 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3115
%.tmp3117 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3111, %m1861$.Type.type* %.tmp3116)
%.tmp3118 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3119 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3118, i32 0, i32 0
%.tmp3120 = load i8*, i8** %.tmp3119
%.tmp3121 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3104, i8* %.tmp3106, i8* %.tmp3110, i8* %.tmp3117, i8* %.tmp3120)
%.tmp3122 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3123 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3122, i32 0, i32 2
store i1 1, i1* %.tmp3123
br label %.if.end.3101
.if.false.3101:
br label %.if.end.3101
.if.end.3101:
ret void
}
define i8* @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3124 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3125 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3124)
%m.3126 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3125, %m1861$.ModuleLookup.type** %m.3126
%.tmp3127 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3126
%.tmp3128 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3127, i32 0, i32 1
%.tmp3129 = load i8*, i8** %.tmp3128
ret i8* %.tmp3129
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
%mangled_name.3130 = alloca i8*
store i8* null, i8** %mangled_name.3130
%.tmp3131 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3132 = load %m307$.Node.type*, %m307$.Node.type** %fn
%.tmp3133 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3132, i32 0, i32 2
%.tmp3134 = load i8*, i8** %.tmp3133
%.tmp3135 = call i8*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3131, i8* %.tmp3134)
%prefix.3136 = alloca i8*
store i8* %.tmp3135, i8** %prefix.3136
%.tmp3137 = getelementptr i8*, i8** %mangled_name.3130, i32 0
%.tmp3139 = getelementptr [5 x i8], [5 x i8]*@.str3138, i32 0, i32 0
%.tmp3140 = load i8*, i8** %prefix.3136
%.tmp3141 = load i8*, i8** %original_name
%.tmp3142 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3137, i8* %.tmp3139, i8* %.tmp3140, i8* %.tmp3141)
%.tmp3143 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3144 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3143, i32 0, i32 0
%.tmp3145 = load i8*, i8** %.tmp3144
%.tmp3147 = getelementptr [9 x i8], [9 x i8]*@.str3146, i32 0, i32 0
%.tmp3148 = call i32(i8*,i8*) @strcmp(i8* %.tmp3145, i8* %.tmp3147)
%.tmp3149 = icmp eq i32 %.tmp3148, 0
br i1 %.tmp3149, label %.if.true.3150, label %.if.false.3150
.if.true.3150:
%.tmp3151 = load i8*, i8** %mangled_name.3130
%.tmp3153 = getelementptr [5 x i8], [5 x i8]*@.str3152, i32 0, i32 0
%.tmp3154 = call i32(i8*,i8*) @strcmp(i8* %.tmp3151, i8* %.tmp3153)
%.tmp3155 = icmp ne i32 %.tmp3154, 0
br i1 %.tmp3155, label %.if.true.3156, label %.if.false.3156
.if.true.3156:
%tmp_buff.3157 = alloca i8*
store i8* null, i8** %tmp_buff.3157
%swap_var.3158 = alloca i8*
store i8* null, i8** %swap_var.3158
%.tmp3160 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3161 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3160, i32 0, i32 3
%.tmp3162 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3161
%tp.3163 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3162, %m1861$.Type.type** %tp.3163
br label %.for.start.3159
.for.start.3159:
%.tmp3164 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3163
%.tmp3165 = icmp ne %m1861$.Type.type* %.tmp3164, null
br i1 %.tmp3165, label %.for.continue.3159, label %.for.end.3159
.for.continue.3159:
%.tmp3166 = getelementptr i8*, i8** %tmp_buff.3157, i32 0
%.tmp3168 = getelementptr [6 x i8], [6 x i8]*@.str3167, i32 0, i32 0
%.tmp3169 = load i8*, i8** %mangled_name.3130
%.tmp3170 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3163
%.tmp3171 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp3170)
%.tmp3172 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3166, i8* %.tmp3168, i8* %.tmp3169, i8* %.tmp3171)
%.tmp3173 = load i8*, i8** %tmp_buff.3157
store i8* %.tmp3173, i8** %swap_var.3158
%.tmp3174 = load i8*, i8** %mangled_name.3130
store i8* %.tmp3174, i8** %tmp_buff.3157
%.tmp3175 = load i8*, i8** %swap_var.3158
store i8* %.tmp3175, i8** %mangled_name.3130
%.tmp3176 = load i8*, i8** %tmp_buff.3157
call void(i8*) @free(i8* %.tmp3176)
%.tmp3177 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3163
%.tmp3178 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3177, i32 0, i32 4
%.tmp3179 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3178
store %m1861$.Type.type* %.tmp3179, %m1861$.Type.type** %tp.3163
br label %.for.start.3159
.for.end.3159:
br label %.if.end.3156
.if.false.3156:
br label %.if.end.3156
.if.end.3156:
br label %.if.end.3150
.if.false.3150:
br label %.if.end.3150
.if.end.3150:
%.tmp3180 = load i8*, i8** %mangled_name.3130
ret i8* %.tmp3180
}
define void @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3181 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %info.3181
%return_type.3182 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %return_type.3182
%err_buf.3183 = alloca i8*
store i8* null, i8** %err_buf.3183
%tmp_buff.3184 = alloca i8*
store i8* null, i8** %tmp_buff.3184
%.tmp3185 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3186 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3185, i32 0, i32 0
%.tmp3187 = load i8*, i8** %.tmp3186
%.tmp3189 = getelementptr [3 x i8], [3 x i8]*@.str3188, i32 0, i32 0
%.tmp3190 = call i32(i8*,i8*) @strcmp(i8* %.tmp3187, i8* %.tmp3189)
%.tmp3191 = icmp eq i32 %.tmp3190, 0
br i1 %.tmp3191, label %.if.true.3192, label %.if.false.3192
.if.true.3192:
ret void
br label %.if.end.3192
.if.false.3192:
%.tmp3193 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3194 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3193, i32 0, i32 0
%.tmp3195 = load i8*, i8** %.tmp3194
%.tmp3197 = getelementptr [7 x i8], [7 x i8]*@.str3196, i32 0, i32 0
%.tmp3198 = call i32(i8*,i8*) @strcmp(i8* %.tmp3195, i8* %.tmp3197)
%.tmp3199 = icmp eq i32 %.tmp3198, 0
br i1 %.tmp3199, label %.if.true.3200, label %.if.false.3200
.if.true.3200:
%.tmp3201 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3202 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3201, i32 0, i32 6
%.tmp3203 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3202
%.tmp3205 = getelementptr [11 x i8], [11 x i8]*@.str3204, i32 0, i32 0
%.tmp3206 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3203, i8* %.tmp3205)
%assignable.3207 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3206, %m307$.Node.type** %assignable.3207
%.tmp3208 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3209 = load %m307$.Node.type*, %m307$.Node.type** %assignable.3207
%.tmp3210 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3208, %m307$.Node.type* %.tmp3209)
%a_info.3211 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3210, %m1861$.AssignableInfo.type** %a_info.3211
%.tmp3212 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3211
%.tmp3213 = icmp eq %m1861$.AssignableInfo.type* %.tmp3212, null
br i1 %.tmp3213, label %.if.true.3214, label %.if.false.3214
.if.true.3214:
ret void
br label %.if.end.3214
.if.false.3214:
br label %.if.end.3214
.if.end.3214:
%.tmp3215 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3216 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3215)
store %m1861$.AssignableInfo.type* %.tmp3216, %m1861$.AssignableInfo.type** %info.3181
%.tmp3217 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3218 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3217, i32 0, i32 6
%.tmp3219 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3218
%.tmp3220 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3219, i32 0, i32 7
%.tmp3221 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3220
%.tmp3222 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3221, i32 0, i32 1
%.tmp3223 = load i8*, i8** %.tmp3222
%global_name.3224 = alloca i8*
store i8* %.tmp3223, i8** %global_name.3224
%.tmp3225 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3226 = load i8, i8* @SCOPE_GLOBAL
%.tmp3227 = load i8*, i8** %global_name.3224
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3225, i8 %.tmp3226, i8* %.tmp3227)
%.tmp3228 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3229 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3228, i32 0, i32 3
%.tmp3230 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3211
%.tmp3231 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3230, i32 0, i32 3
%.tmp3232 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3231
store %m1861$.Type.type* %.tmp3232, %m1861$.Type.type** %.tmp3229
%.tmp3233 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3234 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3233, i32 0, i32 2
%.tmp3236 = getelementptr [9 x i8], [9 x i8]*@.str3235, i32 0, i32 0
store i8* %.tmp3236, i8** %.tmp3234
%.tmp3237 = load i1, i1* %shallow
%.tmp3238 = icmp eq i1 %.tmp3237, 1
br i1 %.tmp3238, label %.if.true.3239, label %.if.false.3239
.if.true.3239:
%.tmp3240 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3241 = load i8*, i8** %global_name.3224
%.tmp3242 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3240, i8* %.tmp3241, %m1861$.AssignableInfo.type* %.tmp3242)
br label %.if.end.3239
.if.false.3239:
%.tmp3243 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3244 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3243, i32 0, i32 1
%.tmp3245 = load %m0$.File.type*, %m0$.File.type** %.tmp3244
%.tmp3247 = getelementptr [21 x i8], [21 x i8]*@.str3246, i32 0, i32 0
%.tmp3248 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3249 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3248)
%.tmp3250 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3251 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3252 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3251, i32 0, i32 3
%.tmp3253 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3252
%.tmp3254 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3250, %m1861$.Type.type* %.tmp3253)
%.tmp3255 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3211
%.tmp3256 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3255)
%.tmp3257 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3245, i8* %.tmp3247, i8* %.tmp3249, i8* %.tmp3254, i8* %.tmp3256)
br label %.if.end.3239
.if.end.3239:
br label %.if.end.3200
.if.false.3200:
%.tmp3258 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3259 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3258, i32 0, i32 0
%.tmp3260 = load i8*, i8** %.tmp3259
%.tmp3262 = getelementptr [10 x i8], [10 x i8]*@.str3261, i32 0, i32 0
%.tmp3263 = call i32(i8*,i8*) @strcmp(i8* %.tmp3260, i8* %.tmp3262)
%.tmp3264 = icmp eq i32 %.tmp3263, 0
br i1 %.tmp3264, label %.if.true.3265, label %.if.false.3265
.if.true.3265:
%.tmp3266 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3267 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3266, i32 0, i32 6
%.tmp3268 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3267
%.tmp3269 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3268, i32 0, i32 7
%.tmp3270 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3269
%.tmp3271 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3270, i32 0, i32 1
%.tmp3272 = load i8*, i8** %.tmp3271
%type_name.3273 = alloca i8*
store i8* %.tmp3272, i8** %type_name.3273
%.tmp3274 = load i1, i1* %shallow
%.tmp3275 = icmp eq i1 %.tmp3274, 1
br i1 %.tmp3275, label %.if.true.3276, label %.if.false.3276
.if.true.3276:
%.tmp3277 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3278 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3277)
store %m1861$.AssignableInfo.type* %.tmp3278, %m1861$.AssignableInfo.type** %info.3181
%.tmp3279 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3280 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3279)
%mod_from.3281 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3280, %m1861$.ModuleLookup.type** %mod_from.3281
%.tmp3282 = getelementptr i8*, i8** %tmp_buff.3184, i32 0
%.tmp3284 = getelementptr [11 x i8], [11 x i8]*@.str3283, i32 0, i32 0
%.tmp3285 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3281
%.tmp3286 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3285, i32 0, i32 1
%.tmp3287 = load i8*, i8** %.tmp3286
%.tmp3288 = load i8*, i8** %type_name.3273
%.tmp3289 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3282, i8* %.tmp3284, i8* %.tmp3287, i8* %.tmp3288)
%.tmp3290 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3291 = load i8, i8* @SCOPE_LOCAL
%.tmp3292 = load i8*, i8** %tmp_buff.3184
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3290, i8 %.tmp3291, i8* %.tmp3292)
%.tmp3293 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3294 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3293, i32 0, i32 2
%.tmp3296 = getelementptr [10 x i8], [10 x i8]*@.str3295, i32 0, i32 0
store i8* %.tmp3296, i8** %.tmp3294
%.tmp3297 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3298 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3297, i32 0, i32 4
%.tmp3299 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3300 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3299, i32 0, i32 3
%.tmp3301 = load i32, i32* %.tmp3300
store i32 %.tmp3301, i32* %.tmp3298
%.tmp3302 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3303 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3302, i32 0, i32 5
%.tmp3304 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3305 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3304, i32 0, i32 4
%.tmp3306 = load i32, i32* %.tmp3305
store i32 %.tmp3306, i32* %.tmp3303
%.tmp3307 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3308 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3307, i32 0, i32 3
%.tmp3309 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3309, %m1861$.Type.type** %.tmp3308
%.tmp3310 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3311 = load i8*, i8** %type_name.3273
%.tmp3312 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3310, i8* %.tmp3311, %m1861$.AssignableInfo.type* %.tmp3312)
%.tmp3313 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3314 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3313, i32 0, i32 6
%.tmp3315 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3314
%.tmp3317 = getelementptr [5 x i8], [5 x i8]*@.str3316, i32 0, i32 0
%.tmp3318 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3315, i8* %.tmp3317)
%type_decl.3319 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3318, %m307$.Node.type** %type_decl.3319
%.tmp3320 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3321 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3319
%.tmp3322 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3321, i32 0, i32 6
%.tmp3323 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3322
%.tmp3324 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3320, %m307$.Node.type* %.tmp3323)
%type_struct.3325 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3324, %m1861$.Type.type** %type_struct.3325
%.tmp3326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3327 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3326, i32 0, i32 3
%.tmp3328 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3327
%.tmp3329 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3325
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3328, %m1861$.Type.type* %.tmp3329)
%.tmp3330 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3331 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3330, i32 0, i32 3
%.tmp3332 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3325
store %m1861$.Type.type* %.tmp3332, %m1861$.Type.type** %.tmp3331
br label %.if.end.3276
.if.false.3276:
%.tmp3333 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3334 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3335 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3334, i32 0, i32 7
%.tmp3336 = load i8*, i8** %.tmp3335
%.tmp3337 = load i8*, i8** %type_name.3273
%.tmp3338 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3333, i8* %.tmp3336, i8* %.tmp3337)
%scope.3339 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3338, %m1861$.ScopeItem.type** %scope.3339
%.tmp3340 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3339
%.tmp3341 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3340, i32 0, i32 1
%.tmp3342 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3341
store %m1861$.AssignableInfo.type* %.tmp3342, %m1861$.AssignableInfo.type** %info.3181
%.tmp3343 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3344 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3343, i32 0, i32 1
%.tmp3345 = load %m0$.File.type*, %m0$.File.type** %.tmp3344
%.tmp3347 = getelementptr [14 x i8], [14 x i8]*@.str3346, i32 0, i32 0
%.tmp3348 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3349 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3348)
%.tmp3350 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3351 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3352 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3351, i32 0, i32 3
%.tmp3353 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3352
%.tmp3354 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3350, %m1861$.Type.type* %.tmp3353)
%.tmp3355 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3345, i8* %.tmp3347, i8* %.tmp3349, i8* %.tmp3354)
br label %.if.end.3276
.if.end.3276:
br label %.if.end.3265
.if.false.3265:
%.tmp3356 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3357 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3356, i32 0, i32 0
%.tmp3358 = load i8*, i8** %.tmp3357
%.tmp3360 = getelementptr [7 x i8], [7 x i8]*@.str3359, i32 0, i32 0
%.tmp3361 = call i32(i8*,i8*) @strcmp(i8* %.tmp3358, i8* %.tmp3360)
%.tmp3362 = icmp eq i32 %.tmp3361, 0
br i1 %.tmp3362, label %.if.true.3363, label %.if.false.3363
.if.true.3363:
%.tmp3364 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3365 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3364)
store %m1861$.AssignableInfo.type* %.tmp3365, %m1861$.AssignableInfo.type** %info.3181
%.tmp3366 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3367 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3366, i32 0, i32 3
%.tmp3368 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3369 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3370 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3369, i32 0, i32 6
%.tmp3371 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3370
%.tmp3372 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3371, i32 0, i32 7
%.tmp3373 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3372
%.tmp3374 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3368, %m307$.Node.type* %.tmp3373)
store %m1861$.Type.type* %.tmp3374, %m1861$.Type.type** %.tmp3367
%.tmp3375 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3376 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3375, i32 0, i32 2
%.tmp3378 = getelementptr [7 x i8], [7 x i8]*@.str3377, i32 0, i32 0
store i8* %.tmp3378, i8** %.tmp3376
%.tmp3379 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3380 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3379, i32 0, i32 6
%.tmp3381 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3380
%.tmp3382 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3381, i32 0, i32 7
%.tmp3383 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3382
%.tmp3384 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3383, i32 0, i32 7
%.tmp3385 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3384
%.tmp3386 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3385, i32 0, i32 1
%.tmp3387 = load i8*, i8** %.tmp3386
%fn_name.3388 = alloca i8*
store i8* %.tmp3387, i8** %fn_name.3388
%.tmp3389 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3390 = load i8, i8* @SCOPE_GLOBAL
%.tmp3391 = load i8*, i8** %fn_name.3388
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3389, i8 %.tmp3390, i8* %.tmp3391)
%.tmp3392 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3392, %m1861$.Type.type** %return_type.3182
%.tmp3393 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3394 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3393, i32 0, i32 0
%.tmp3395 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3396 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3395, i32 0, i32 3
%.tmp3397 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3396
%.tmp3398 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3397, i32 0, i32 3
%.tmp3399 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3398
%.tmp3400 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3399, i32 0, i32 0
%.tmp3401 = load i8*, i8** %.tmp3400
store i8* %.tmp3401, i8** %.tmp3394
%.tmp3402 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3403 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3402, i32 0, i32 3
%.tmp3404 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3405 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3404, i32 0, i32 3
%.tmp3406 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3405
%.tmp3407 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3406, i32 0, i32 3
%.tmp3408 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3407
%.tmp3409 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3408, i32 0, i32 3
%.tmp3410 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3409
store %m1861$.Type.type* %.tmp3410, %m1861$.Type.type** %.tmp3403
%.tmp3411 = load i1, i1* %shallow
%.tmp3412 = icmp eq i1 %.tmp3411, 0
br i1 %.tmp3412, label %.if.true.3413, label %.if.false.3413
.if.true.3413:
%.tmp3414 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3415 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3414, i32 0, i32 1
%.tmp3416 = load %m0$.File.type*, %m0$.File.type** %.tmp3415
%.tmp3418 = getelementptr [15 x i8], [15 x i8]*@.str3417, i32 0, i32 0
%.tmp3419 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3420 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3421 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3419, %m1861$.Type.type* %.tmp3420)
%.tmp3422 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3423 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3422)
%.tmp3424 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3416, i8* %.tmp3418, i8* %.tmp3421, i8* %.tmp3423)
%.tmp3426 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3427 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3426, i32 0, i32 3
%.tmp3428 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3427
%.tmp3429 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3428, i32 0, i32 3
%.tmp3430 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3429
%.tmp3431 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3430, i32 0, i32 4
%.tmp3432 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3431
%pt.3433 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3432, %m1861$.Type.type** %pt.3433
br label %.for.start.3425
.for.start.3425:
%.tmp3434 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3433
%.tmp3435 = icmp ne %m1861$.Type.type* %.tmp3434, null
br i1 %.tmp3435, label %.for.continue.3425, label %.for.end.3425
.for.continue.3425:
%.tmp3436 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3433
%.tmp3437 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3438 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3437, i32 0, i32 3
%.tmp3439 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3438
%.tmp3440 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3439, i32 0, i32 3
%.tmp3441 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3440
%.tmp3442 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3441, i32 0, i32 4
%.tmp3443 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3442
%.tmp3444 = icmp ne %m1861$.Type.type* %.tmp3436, %.tmp3443
br i1 %.tmp3444, label %.if.true.3445, label %.if.false.3445
.if.true.3445:
%.tmp3446 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3447 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3446, i32 0, i32 1
%.tmp3448 = load %m0$.File.type*, %m0$.File.type** %.tmp3447
%.tmp3450 = getelementptr [3 x i8], [3 x i8]*@.str3449, i32 0, i32 0
%.tmp3451 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3448, i8* %.tmp3450)
br label %.if.end.3445
.if.false.3445:
br label %.if.end.3445
.if.end.3445:
%.tmp3452 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3453 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3452, i32 0, i32 1
%.tmp3454 = load %m0$.File.type*, %m0$.File.type** %.tmp3453
%.tmp3456 = getelementptr [3 x i8], [3 x i8]*@.str3455, i32 0, i32 0
%.tmp3457 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3458 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3433
%.tmp3459 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3457, %m1861$.Type.type* %.tmp3458)
%.tmp3460 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3454, i8* %.tmp3456, i8* %.tmp3459)
%.tmp3461 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3433
%.tmp3462 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3461, i32 0, i32 4
%.tmp3463 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3462
store %m1861$.Type.type* %.tmp3463, %m1861$.Type.type** %pt.3433
br label %.for.start.3425
.for.end.3425:
%.tmp3464 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3465 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3464, i32 0, i32 1
%.tmp3466 = load %m0$.File.type*, %m0$.File.type** %.tmp3465
%.tmp3468 = getelementptr [3 x i8], [3 x i8]*@.str3467, i32 0, i32 0
%.tmp3469 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3466, i8* %.tmp3468)
%.tmp3470 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3471 = bitcast %m1861$.Type.type* %.tmp3470 to i8*
call void(i8*) @free(i8* %.tmp3471)
br label %.if.end.3413
.if.false.3413:
%.tmp3472 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3473 = load i8*, i8** %fn_name.3388
%.tmp3474 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3472, i8* %.tmp3473, %m1861$.AssignableInfo.type* %.tmp3474)
br label %.if.end.3413
.if.end.3413:
br label %.if.end.3363
.if.false.3363:
%.tmp3475 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3476 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3475, i32 0, i32 0
%.tmp3477 = load i8*, i8** %.tmp3476
%.tmp3479 = getelementptr [9 x i8], [9 x i8]*@.str3478, i32 0, i32 0
%.tmp3480 = call i32(i8*,i8*) @strcmp(i8* %.tmp3477, i8* %.tmp3479)
%.tmp3481 = icmp eq i32 %.tmp3480, 0
br i1 %.tmp3481, label %.if.true.3482, label %.if.false.3482
.if.true.3482:
%.tmp3483 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3484 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3483)
store %m1861$.AssignableInfo.type* %.tmp3484, %m1861$.AssignableInfo.type** %info.3181
%.tmp3485 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3486 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3485, i32 0, i32 2
%.tmp3488 = getelementptr [9 x i8], [9 x i8]*@.str3487, i32 0, i32 0
store i8* %.tmp3488, i8** %.tmp3486
%.tmp3489 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3490 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3489, i32 0, i32 3
%.tmp3491 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3492 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3493 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3492, i32 0, i32 6
%.tmp3494 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3493
%.tmp3495 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3491, %m307$.Node.type* %.tmp3494)
store %m1861$.Type.type* %.tmp3495, %m1861$.Type.type** %.tmp3490
%.tmp3496 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3497 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3496)
%name.3498 = alloca i8*
store i8* %.tmp3497, i8** %name.3498
%.tmp3499 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3500 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3501 = load i8*, i8** %name.3498
%.tmp3502 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3503 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3502, i32 0, i32 3
%.tmp3504 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3503
%.tmp3505 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3499, %m307$.Node.type* %.tmp3500, i8* %.tmp3501, %m1861$.Type.type* %.tmp3504)
store i8* %.tmp3505, i8** %tmp_buff.3184
%.tmp3506 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3507 = load i8, i8* @SCOPE_GLOBAL
%.tmp3508 = load i8*, i8** %tmp_buff.3184
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3506, i8 %.tmp3507, i8* %.tmp3508)
%.tmp3509 = load i1, i1* %shallow
%.tmp3510 = icmp eq i1 %.tmp3509, 1
br i1 %.tmp3510, label %.if.true.3511, label %.if.false.3511
.if.true.3511:
%.tmp3512 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3513 = load i8*, i8** %name.3498
%.tmp3514 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3512, i8* %.tmp3513, %m1861$.AssignableInfo.type* %.tmp3514)
br label %.if.end.3511
.if.false.3511:
%.tmp3515 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3515, %m1861$.Type.type** %return_type.3182
%.tmp3516 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3517 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3518 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3517, i32 0, i32 3
%.tmp3519 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3518
%.tmp3520 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3519, i32 0, i32 3
%.tmp3521 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3520
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3516, %m1861$.Type.type* %.tmp3521)
%.tmp3522 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3523 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3522, i32 0, i32 1
%.tmp3524 = load %m0$.File.type*, %m0$.File.type** %.tmp3523
%.tmp3526 = getelementptr [14 x i8], [14 x i8]*@.str3525, i32 0, i32 0
%.tmp3527 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3528 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3529 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3527, %m1861$.Type.type* %.tmp3528)
%.tmp3530 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3181
%.tmp3531 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3530)
%.tmp3532 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3524, i8* %.tmp3526, i8* %.tmp3529, i8* %.tmp3531)
%.tmp3533 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3534 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3533, i32 0, i32 6
%.tmp3535 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3534
%.tmp3536 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3535)
%params.3537 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3536, %m307$.Node.type** %params.3537
%param_type.3538 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3538
%.tmp3540 = load %m307$.Node.type*, %m307$.Node.type** %params.3537
%param_ptr.3541 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3540, %m307$.Node.type** %param_ptr.3541
br label %.for.start.3539
.for.start.3539:
%.tmp3542 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3543 = icmp ne %m307$.Node.type* %.tmp3542, null
br i1 %.tmp3543, label %.for.continue.3539, label %.for.end.3539
.for.continue.3539:
%.tmp3544 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3545 = load %m307$.Node.type*, %m307$.Node.type** %params.3537
%.tmp3546 = icmp ne %m307$.Node.type* %.tmp3544, %.tmp3545
br i1 %.tmp3546, label %.if.true.3547, label %.if.false.3547
.if.true.3547:
%.tmp3548 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3549 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3548, i32 0, i32 7
%.tmp3550 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3549
store %m307$.Node.type* %.tmp3550, %m307$.Node.type** %param_ptr.3541
%.tmp3551 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3552 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3551, i32 0, i32 1
%.tmp3553 = load %m0$.File.type*, %m0$.File.type** %.tmp3552
%.tmp3555 = getelementptr [3 x i8], [3 x i8]*@.str3554, i32 0, i32 0
%.tmp3556 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3553, i8* %.tmp3555)
br label %.if.end.3547
.if.false.3547:
br label %.if.end.3547
.if.end.3547:
%.tmp3557 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3558 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3557, i32 0, i32 0
%.tmp3559 = load i8*, i8** %.tmp3558
%.tmp3561 = getelementptr [5 x i8], [5 x i8]*@.str3560, i32 0, i32 0
%.tmp3562 = call i32(i8*,i8*) @strcmp(i8* %.tmp3559, i8* %.tmp3561)
%.tmp3563 = icmp eq i32 %.tmp3562, 0
br i1 %.tmp3563, label %.if.true.3564, label %.if.false.3564
.if.true.3564:
%.tmp3565 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3566 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3567 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3566, i32 0, i32 6
%.tmp3568 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3567
%.tmp3569 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3565, %m307$.Node.type* %.tmp3568)
store %m1861$.Type.type* %.tmp3569, %m1861$.Type.type** %param_type.3538
%.tmp3570 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3571 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3570, i32 0, i32 7
%.tmp3572 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3571
store %m307$.Node.type* %.tmp3572, %m307$.Node.type** %param_ptr.3541
br label %.if.end.3564
.if.false.3564:
br label %.if.end.3564
.if.end.3564:
%.tmp3573 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3574 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3573, i32 0, i32 1
%.tmp3575 = load %m0$.File.type*, %m0$.File.type** %.tmp3574
%.tmp3577 = getelementptr [13 x i8], [13 x i8]*@.str3576, i32 0, i32 0
%.tmp3578 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3579 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3538
%.tmp3580 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3578, %m1861$.Type.type* %.tmp3579)
%.tmp3581 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3582 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3581, i32 0, i32 1
%.tmp3583 = load i8*, i8** %.tmp3582
%.tmp3584 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3575, i8* %.tmp3577, i8* %.tmp3580, i8* %.tmp3583)
%.tmp3585 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3541
%.tmp3586 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3585, i32 0, i32 7
%.tmp3587 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3586
store %m307$.Node.type* %.tmp3587, %m307$.Node.type** %param_ptr.3541
br label %.for.start.3539
.for.end.3539:
%.tmp3588 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3589 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3588, i32 0, i32 1
%.tmp3590 = load %m0$.File.type*, %m0$.File.type** %.tmp3589
%.tmp3592 = getelementptr [5 x i8], [5 x i8]*@.str3591, i32 0, i32 0
%.tmp3593 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3590, i8* %.tmp3592)
%.tmp3594 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3596 = getelementptr [9 x i8], [9 x i8]*@.str3595, i32 0, i32 0
%.tmp3597 = bitcast ptr null to i8*
%.tmp3598 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3594, i8* %.tmp3596, i8* %.tmp3597, i8* %.tmp3598)
%.tmp3599 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3600 = load %m307$.Node.type*, %m307$.Node.type** %params.3537
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3599, %m307$.Node.type* %.tmp3600)
%.tmp3601 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3602 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3601, i32 0, i32 6
%.tmp3603 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3602
%.tmp3605 = getelementptr [6 x i8], [6 x i8]*@.str3604, i32 0, i32 0
%.tmp3606 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3603, i8* %.tmp3605)
%fn_block.3607 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3606, %m307$.Node.type** %fn_block.3607
%.tmp3608 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3609 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3607
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3608, %m307$.Node.type* %.tmp3609)
%.tmp3610 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3610)
%.tmp3611 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3612 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3611, %m307$.Node.type** %last_valid_instruction.3612
%.tmp3613 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3607
%.tmp3614 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3613, i32 0, i32 6
%.tmp3615 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3614
%.tmp3617 = getelementptr [12 x i8], [12 x i8]*@.str3616, i32 0, i32 0
%.tmp3618 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3615, i8* %.tmp3617)
%ci.3619 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3618, %m307$.Node.type** %ci.3619
%.tmp3621 = load %m307$.Node.type*, %m307$.Node.type** %ci.3619
%.tmp3622 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3621, i32 0, i32 6
%.tmp3623 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3622
store %m307$.Node.type* %.tmp3623, %m307$.Node.type** %ci.3619
br label %.for.start.3620
.for.start.3620:
%.tmp3624 = load %m307$.Node.type*, %m307$.Node.type** %ci.3619
%.tmp3625 = icmp ne %m307$.Node.type* %.tmp3624, null
br i1 %.tmp3625, label %.for.continue.3620, label %.for.end.3620
.for.continue.3620:
%.tmp3626 = load %m307$.Node.type*, %m307$.Node.type** %ci.3619
%.tmp3627 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3626, i32 0, i32 0
%.tmp3628 = load i8*, i8** %.tmp3627
%.tmp3630 = getelementptr [3 x i8], [3 x i8]*@.str3629, i32 0, i32 0
%.tmp3631 = call i32(i8*,i8*) @strcmp(i8* %.tmp3628, i8* %.tmp3630)
%.tmp3632 = icmp ne i32 %.tmp3631, 0
%.tmp3633 = load %m307$.Node.type*, %m307$.Node.type** %ci.3619
%.tmp3634 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3633, i32 0, i32 0
%.tmp3635 = load i8*, i8** %.tmp3634
%.tmp3637 = getelementptr [9 x i8], [9 x i8]*@.str3636, i32 0, i32 0
%.tmp3638 = call i32(i8*,i8*) @strcmp(i8* %.tmp3635, i8* %.tmp3637)
%.tmp3639 = icmp ne i32 %.tmp3638, 0
%.tmp3640 = and i1 %.tmp3632, %.tmp3639
br i1 %.tmp3640, label %.if.true.3641, label %.if.false.3641
.if.true.3641:
%.tmp3642 = load %m307$.Node.type*, %m307$.Node.type** %ci.3619
store %m307$.Node.type* %.tmp3642, %m307$.Node.type** %last_valid_instruction.3612
br label %.if.end.3641
.if.false.3641:
br label %.if.end.3641
.if.end.3641:
%.tmp3643 = load %m307$.Node.type*, %m307$.Node.type** %ci.3619
%.tmp3644 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3643, i32 0, i32 7
%.tmp3645 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3644
store %m307$.Node.type* %.tmp3645, %m307$.Node.type** %ci.3619
br label %.for.start.3620
.for.end.3620:
%add_implicit_return.3646 = alloca i1
store i1 0, i1* %add_implicit_return.3646
%.tmp3647 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3612
%.tmp3648 = icmp eq %m307$.Node.type* %.tmp3647, null
br i1 %.tmp3648, label %.if.true.3649, label %.if.false.3649
.if.true.3649:
store i1 1, i1* %add_implicit_return.3646
br label %.if.end.3649
.if.false.3649:
%.tmp3650 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3612
%.tmp3651 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3650, i32 0, i32 6
%.tmp3652 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3651
%.tmp3653 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3652, i32 0, i32 0
%.tmp3654 = load i8*, i8** %.tmp3653
%.tmp3656 = getelementptr [7 x i8], [7 x i8]*@.str3655, i32 0, i32 0
%.tmp3657 = call i32(i8*,i8*) @strcmp(i8* %.tmp3654, i8* %.tmp3656)
%.tmp3658 = icmp ne i32 %.tmp3657, 0
br i1 %.tmp3658, label %.if.true.3659, label %.if.false.3659
.if.true.3659:
store i1 1, i1* %add_implicit_return.3646
br label %.if.end.3659
.if.false.3659:
br label %.if.end.3659
.if.end.3659:
br label %.if.end.3649
.if.end.3649:
%.tmp3660 = load i1, i1* %add_implicit_return.3646
br i1 %.tmp3660, label %.if.true.3661, label %.if.false.3661
.if.true.3661:
%.tmp3662 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3663 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3182
%.tmp3664 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3662, %m1861$.Type.type* %.tmp3663)
%.tmp3666 = getelementptr [5 x i8], [5 x i8]*@.str3665, i32 0, i32 0
%.tmp3667 = call i32(i8*,i8*) @strcmp(i8* %.tmp3664, i8* %.tmp3666)
%.tmp3668 = icmp ne i32 %.tmp3667, 0
br i1 %.tmp3668, label %.if.true.3669, label %.if.false.3669
.if.true.3669:
%.tmp3670 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3671 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3607
%.tmp3673 = getelementptr [21 x i8], [21 x i8]*@.str3672, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3670, %m307$.Node.type* %.tmp3671, i8* %.tmp3673)
br label %.if.end.3669
.if.false.3669:
%.tmp3674 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3675 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3674, i32 0, i32 1
%.tmp3676 = load %m0$.File.type*, %m0$.File.type** %.tmp3675
%.tmp3678 = getelementptr [10 x i8], [10 x i8]*@.str3677, i32 0, i32 0
%.tmp3679 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3676, i8* %.tmp3678)
br label %.if.end.3669
.if.end.3669:
br label %.if.end.3661
.if.false.3661:
br label %.if.end.3661
.if.end.3661:
%.tmp3680 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3681 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3680, i32 0, i32 1
%.tmp3682 = load %m0$.File.type*, %m0$.File.type** %.tmp3681
%.tmp3684 = getelementptr [3 x i8], [3 x i8]*@.str3683, i32 0, i32 0
%.tmp3685 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3682, i8* %.tmp3684)
br label %.if.end.3511
.if.end.3511:
br label %.if.end.3482
.if.false.3482:
%.tmp3686 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3687 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3686, i32 0, i32 0
%.tmp3688 = load i8*, i8** %.tmp3687
%.tmp3690 = getelementptr [7 x i8], [7 x i8]*@.str3689, i32 0, i32 0
%.tmp3691 = call i32(i8*,i8*) @strcmp(i8* %.tmp3688, i8* %.tmp3690)
%.tmp3692 = icmp eq i32 %.tmp3691, 0
br i1 %.tmp3692, label %.if.true.3693, label %.if.false.3693
.if.true.3693:
%.tmp3694 = load i1, i1* %shallow
%.tmp3695 = icmp eq i1 %.tmp3694, 1
br i1 %.tmp3695, label %.if.true.3696, label %.if.false.3696
.if.true.3696:
%.tmp3697 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3698 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3697, i32 0, i32 6
%.tmp3699 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3698
%.tmp3700 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3699, i32 0, i32 7
%.tmp3701 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3700
%.tmp3702 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3701, i32 0, i32 1
%.tmp3703 = load i8*, i8** %.tmp3702
%mod_name.3704 = alloca i8*
store i8* %.tmp3703, i8** %mod_name.3704
%.tmp3705 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3706 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3705, i32 0, i32 7
%.tmp3707 = load i8*, i8** %.tmp3706
%mod_abspath.3708 = alloca i8*
store i8* %.tmp3707, i8** %mod_abspath.3708
%.tmp3709 = load i8*, i8** %mod_abspath.3708
%.tmp3710 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3709)
%dirname.3711 = alloca i8*
store i8* %.tmp3710, i8** %dirname.3711
%.tmp3712 = load i8*, i8** %mod_name.3704
%.tmp3713 = call i32(i8*) @strlen(i8* %.tmp3712)
%mod_name_len.3714 = alloca i32
store i32 %.tmp3713, i32* %mod_name_len.3714
%.tmp3715 = load i32, i32* %mod_name_len.3714
%.tmp3716 = sub i32 %.tmp3715, 1
%.tmp3717 = call i8*(i32) @malloc(i32 %.tmp3716)
%trimmed_name.3718 = alloca i8*
store i8* %.tmp3717, i8** %trimmed_name.3718
%i.3720 = alloca i32
store i32 1, i32* %i.3720
br label %.for.start.3719
.for.start.3719:
%.tmp3721 = load i32, i32* %i.3720
%.tmp3722 = load i32, i32* %mod_name_len.3714
%.tmp3723 = sub i32 %.tmp3722, 1
%.tmp3724 = icmp slt i32 %.tmp3721, %.tmp3723
br i1 %.tmp3724, label %.for.continue.3719, label %.for.end.3719
.for.continue.3719:
%.tmp3725 = load i32, i32* %i.3720
%.tmp3726 = sub i32 %.tmp3725, 1
%.tmp3727 = load i8*, i8** %trimmed_name.3718
%.tmp3728 = getelementptr i8, i8* %.tmp3727, i32 %.tmp3726
%.tmp3729 = load i32, i32* %i.3720
%.tmp3730 = load i8*, i8** %mod_name.3704
%.tmp3731 = getelementptr i8, i8* %.tmp3730, i32 %.tmp3729
%.tmp3732 = load i8, i8* %.tmp3731
store i8 %.tmp3732, i8* %.tmp3728
%.tmp3733 = load i32, i32* %i.3720
%.tmp3734 = add i32 %.tmp3733, 1
store i32 %.tmp3734, i32* %i.3720
br label %.for.start.3719
.for.end.3719:
%.tmp3735 = load i32, i32* %mod_name_len.3714
%.tmp3736 = sub i32 %.tmp3735, 2
%.tmp3737 = load i8*, i8** %trimmed_name.3718
%.tmp3738 = getelementptr i8, i8* %.tmp3737, i32 %.tmp3736
store i8 0, i8* %.tmp3738
%.tmp3739 = load i8*, i8** %dirname.3711
%.tmp3741 = getelementptr [1 x i8], [1 x i8]*@.str3740, i32 0, i32 0
%.tmp3742 = call i32(i8*,i8*) @strcmp(i8* %.tmp3739, i8* %.tmp3741)
%.tmp3743 = icmp eq i32 %.tmp3742, 0
br i1 %.tmp3743, label %.if.true.3744, label %.if.false.3744
.if.true.3744:
%.tmp3745 = getelementptr i8*, i8** %mod_abspath.3708, i32 0
%.tmp3747 = getelementptr [6 x i8], [6 x i8]*@.str3746, i32 0, i32 0
%.tmp3748 = load i8*, i8** %trimmed_name.3718
%.tmp3749 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3745, i8* %.tmp3747, i8* %.tmp3748)
br label %.if.end.3744
.if.false.3744:
%.tmp3750 = getelementptr i8*, i8** %mod_abspath.3708, i32 0
%.tmp3752 = getelementptr [9 x i8], [9 x i8]*@.str3751, i32 0, i32 0
%.tmp3753 = load i8*, i8** %dirname.3711
%.tmp3754 = load i8*, i8** %trimmed_name.3718
%.tmp3755 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3750, i8* %.tmp3752, i8* %.tmp3753, i8* %.tmp3754)
br label %.if.end.3744
.if.end.3744:
%.tmp3756 = load i8*, i8** %mod_abspath.3708
%.tmp3757 = call i8*(i32) @malloc(i32 4096)
%.tmp3758 = call i8*(i8*,i8*) @realpath(i8* %.tmp3756, i8* %.tmp3757)
store i8* %.tmp3758, i8** %mod_abspath.3708
%.tmp3759 = load i8*, i8** %mod_abspath.3708
%.tmp3760 = icmp eq i8* %.tmp3759, null
br i1 %.tmp3760, label %.if.true.3761, label %.if.false.3761
.if.true.3761:
%.tmp3762 = getelementptr i8*, i8** %err_buf.3183, i32 0
%.tmp3764 = getelementptr [60 x i8], [60 x i8]*@.str3763, i32 0, i32 0
%.tmp3765 = load i8*, i8** %mod_name.3704
%.tmp3766 = load i8*, i8** %dirname.3711
%.tmp3767 = load i8*, i8** %trimmed_name.3718
%.tmp3768 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3762, i8* %.tmp3764, i8* %.tmp3765, i8* %.tmp3766, i8* %.tmp3767)
%.tmp3769 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3770 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3771 = load i8*, i8** %err_buf.3183
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3769, %m307$.Node.type* %.tmp3770, i8* %.tmp3771)
ret void
br label %.if.end.3761
.if.false.3761:
br label %.if.end.3761
.if.end.3761:
%already_imported.3772 = alloca i1
store i1 0, i1* %already_imported.3772
%m.3773 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3773
%.tmp3774 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3775 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3774, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3777 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3778 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3777, i32 0, i32 6
%.tmp3779 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3778
store %m1861$.ModuleLookup.type* %.tmp3779, %m1861$.ModuleLookup.type** %m.3773
br label %.for.start.3776
.for.start.3776:
%.tmp3780 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
%.tmp3781 = icmp ne %m1861$.ModuleLookup.type* %.tmp3780, null
%.tmp3782 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3783 = icmp eq %m1861$.ModuleLookup.type* %.tmp3782, null
%.tmp3784 = and i1 %.tmp3781, %.tmp3783
br i1 %.tmp3784, label %.for.continue.3776, label %.for.end.3776
.for.continue.3776:
%.tmp3785 = load i8*, i8** %mod_abspath.3708
%.tmp3786 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
%.tmp3787 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3786, i32 0, i32 0
%.tmp3788 = load i8*, i8** %.tmp3787
%.tmp3789 = call i32(i8*,i8*) @strcmp(i8* %.tmp3785, i8* %.tmp3788)
%.tmp3790 = icmp eq i32 %.tmp3789, 0
br i1 %.tmp3790, label %.if.true.3791, label %.if.false.3791
.if.true.3791:
%.tmp3792 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
store %m1861$.ModuleLookup.type* %.tmp3792, %m1861$.ModuleLookup.type** %mod.3775
br label %.if.end.3791
.if.false.3791:
br label %.if.end.3791
.if.end.3791:
%.tmp3793 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
%.tmp3794 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3793, i32 0, i32 2
%.tmp3795 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3794
store %m1861$.ModuleLookup.type* %.tmp3795, %m1861$.ModuleLookup.type** %m.3773
br label %.for.start.3776
.for.end.3776:
%.tmp3796 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3797 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3796, i32 0, i32 6
%.tmp3798 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3797
%.tmp3799 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3798, i32 0, i32 7
%.tmp3800 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3799
%.tmp3801 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3800, i32 0, i32 7
%.tmp3802 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3801
%.tmp3803 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3802, i32 0, i32 7
%.tmp3804 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3803
%.tmp3805 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3804, i32 0, i32 1
%.tmp3806 = load i8*, i8** %.tmp3805
%asname.3807 = alloca i8*
store i8* %.tmp3806, i8** %asname.3807
%.tmp3808 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3809 = icmp eq %m1861$.ModuleLookup.type* %.tmp3808, null
br i1 %.tmp3809, label %.if.true.3810, label %.if.false.3810
.if.true.3810:
%.tmp3811 = load i32, i32* @ModuleLookup_size
%.tmp3812 = call i8*(i32) @malloc(i32 %.tmp3811)
%.tmp3813 = bitcast i8* %.tmp3812 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3813, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3814 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3815 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3814, i32 0, i32 0
%.tmp3816 = load i8*, i8** %mod_abspath.3708
store i8* %.tmp3816, i8** %.tmp3815
%.tmp3817 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3818 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3817, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3818
%.tmp3819 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3820 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3819, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3820
%.tmp3821 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3822 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3821, i32 0, i32 1
%.tmp3823 = getelementptr i8*, i8** %.tmp3822, i32 0
%.tmp3825 = getelementptr [5 x i8], [5 x i8]*@.str3824, i32 0, i32 0
%.tmp3826 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3827 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3826)
%.tmp3828 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3823, i8* %.tmp3825, i32 %.tmp3827)
%.tmp3830 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3831 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3830, i32 0, i32 6
%.tmp3832 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3831
store %m1861$.ModuleLookup.type* %.tmp3832, %m1861$.ModuleLookup.type** %m.3773
br label %.for.start.3829
.for.start.3829:
%.tmp3833 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
%.tmp3834 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3833, i32 0, i32 2
%.tmp3835 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3834
%.tmp3836 = icmp ne %m1861$.ModuleLookup.type* %.tmp3835, null
br i1 %.tmp3836, label %.for.continue.3829, label %.for.end.3829
.for.continue.3829:
%.tmp3837 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
%.tmp3838 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3837, i32 0, i32 2
%.tmp3839 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3838
store %m1861$.ModuleLookup.type* %.tmp3839, %m1861$.ModuleLookup.type** %m.3773
br label %.for.start.3829
.for.end.3829:
%.tmp3840 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3773
%.tmp3841 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3840, i32 0, i32 2
%.tmp3842 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
store %m1861$.ModuleLookup.type* %.tmp3842, %m1861$.ModuleLookup.type** %.tmp3841
%.tmp3843 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3844 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3845 = load i8*, i8** %asname.3807
%.tmp3846 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3847 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3846, i32 0, i32 0
%.tmp3848 = load i8*, i8** %.tmp3847
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3843, %m307$.Node.type* %.tmp3844, i8* %.tmp3845, i8* %.tmp3848)
%.tmp3849 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3850 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3849, i32 0, i32 7
%.tmp3851 = load i8*, i8** %.tmp3850
%curr_mod.3852 = alloca i8*
store i8* %.tmp3851, i8** %curr_mod.3852
%.tmp3853 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3854 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3853, i32 0, i32 7
%.tmp3855 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3856 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3855, i32 0, i32 0
%.tmp3857 = load i8*, i8** %.tmp3856
store i8* %.tmp3857, i8** %.tmp3854
%.tmp3858 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3859 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3860 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3861 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3860, i32 0, i32 0
%.tmp3862 = load i8*, i8** %.tmp3861
%.tmp3863 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3858, %m307$.Node.type* %.tmp3859, i8* %.tmp3862)
%.tmp3864 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3865 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3864, i32 0, i32 7
%.tmp3866 = load i8*, i8** %curr_mod.3852
store i8* %.tmp3866, i8** %.tmp3865
br label %.if.end.3810
.if.false.3810:
%.tmp3867 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3868 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3869 = load i8*, i8** %asname.3807
%.tmp3870 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3775
%.tmp3871 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3870, i32 0, i32 0
%.tmp3872 = load i8*, i8** %.tmp3871
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3867, %m307$.Node.type* %.tmp3868, i8* %.tmp3869, i8* %.tmp3872)
br label %.if.end.3810
.if.end.3810:
br label %.if.end.3696
.if.false.3696:
br label %.if.end.3696
.if.end.3696:
br label %.if.end.3693
.if.false.3693:
%.tmp3873 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3874 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3876 = getelementptr [40 x i8], [40 x i8]*@.str3875, i32 0, i32 0
%.tmp3877 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3873, %m307$.Node.type* %.tmp3874, i8* %.tmp3876)
%.tmp3878 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3879 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3878, i32 0, i32 0
%.tmp3880 = load i8*, i8** %.tmp3879
%.tmp3881 = call i32(i8*,...) @printf(i8* %.tmp3877, i8* %.tmp3880)
br label %.if.end.3693
.if.end.3693:
br label %.if.end.3482
.if.end.3482:
br label %.if.end.3363
.if.end.3363:
br label %.if.end.3265
.if.end.3265:
br label %.if.end.3200
.if.end.3200:
br label %.if.end.3192
.if.end.3192:
ret void
}
define i8* @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3882 = alloca i8*
store i8* null, i8** %buf.3882
%.tmp3883 = getelementptr i8*, i8** %buf.3882, i32 0
%.tmp3885 = getelementptr [31 x i8], [31 x i8]*@.str3884, i32 0, i32 0
%.tmp3886 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3887 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3886, i32 0, i32 7
%.tmp3888 = load i8*, i8** %.tmp3887
%.tmp3889 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3890 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3889, i32 0, i32 3
%.tmp3891 = load i32, i32* %.tmp3890
%.tmp3892 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3893 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3892, i32 0, i32 4
%.tmp3894 = load i32, i32* %.tmp3893
%.tmp3895 = load i8*, i8** %msg
%.tmp3896 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3883, i8* %.tmp3885, i8* %.tmp3888, i32 %.tmp3891, i32 %.tmp3894, i8* %.tmp3895)
%.tmp3897 = load i8*, i8** %buf.3882
ret i8* %.tmp3897
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3898 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3898
%.tmp3900 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3901 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3900, %m307$.Node.type** %param_ptr.3901
br label %.for.start.3899
.for.start.3899:
%.tmp3902 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3903 = icmp ne %m307$.Node.type* %.tmp3902, null
br i1 %.tmp3903, label %.for.continue.3899, label %.for.end.3899
.for.continue.3899:
%.tmp3904 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3905 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3906 = icmp ne %m307$.Node.type* %.tmp3904, %.tmp3905
br i1 %.tmp3906, label %.if.true.3907, label %.if.false.3907
.if.true.3907:
%.tmp3908 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3909 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3908, i32 0, i32 7
%.tmp3910 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3909
store %m307$.Node.type* %.tmp3910, %m307$.Node.type** %param_ptr.3901
br label %.if.end.3907
.if.false.3907:
br label %.if.end.3907
.if.end.3907:
%.tmp3911 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3912 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3911)
%param_info.3913 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3912, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3914 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3915 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3914, i32 0, i32 2
%.tmp3917 = getelementptr [9 x i8], [9 x i8]*@.str3916, i32 0, i32 0
store i8* %.tmp3917, i8** %.tmp3915
%.tmp3918 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3919 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3918, i32 0, i32 0
%.tmp3920 = load i8*, i8** %.tmp3919
%.tmp3922 = getelementptr [5 x i8], [5 x i8]*@.str3921, i32 0, i32 0
%.tmp3923 = call i32(i8*,i8*) @strcmp(i8* %.tmp3920, i8* %.tmp3922)
%.tmp3924 = icmp eq i32 %.tmp3923, 0
br i1 %.tmp3924, label %.if.true.3925, label %.if.false.3925
.if.true.3925:
%.tmp3926 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3927 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3928 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3927, i32 0, i32 6
%.tmp3929 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3928
%.tmp3930 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3926, %m307$.Node.type* %.tmp3929)
store %m1861$.Type.type* %.tmp3930, %m1861$.Type.type** %param_type.3898
%.tmp3931 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3932 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3931, i32 0, i32 7
%.tmp3933 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3932
store %m307$.Node.type* %.tmp3933, %m307$.Node.type** %param_ptr.3901
br label %.if.end.3925
.if.false.3925:
br label %.if.end.3925
.if.end.3925:
%.tmp3934 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3935 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3934, i32 0, i32 3
%.tmp3936 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3898
store %m1861$.Type.type* %.tmp3936, %m1861$.Type.type** %.tmp3935
%.tmp3937 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3938 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3937, i32 0, i32 1
%.tmp3939 = load i8*, i8** %.tmp3938
%var_name.3940 = alloca i8*
store i8* %.tmp3939, i8** %var_name.3940
%.tmp3941 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3942 = load i8, i8* @SCOPE_LOCAL
%.tmp3943 = load i8*, i8** %var_name.3940
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3941, i8 %.tmp3942, i8* %.tmp3943)
%.tmp3944 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3945 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3946 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3945, i32 0, i32 3
%.tmp3947 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3946
%.tmp3948 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3944, %m1861$.Type.type* %.tmp3947)
%param_info_tr.3949 = alloca i8*
store i8* %.tmp3948, i8** %param_info_tr.3949
%.tmp3950 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3951 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3950, i32 0, i32 1
%.tmp3952 = load %m0$.File.type*, %m0$.File.type** %.tmp3951
%.tmp3954 = getelementptr [16 x i8], [16 x i8]*@.str3953, i32 0, i32 0
%.tmp3955 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3956 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3955)
%.tmp3957 = load i8*, i8** %param_info_tr.3949
%.tmp3958 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3952, i8* %.tmp3954, i8* %.tmp3956, i8* %.tmp3957)
%.tmp3959 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3960 = load i8*, i8** %var_name.3940
%.tmp3961 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3959, i8* %.tmp3960, %m1861$.AssignableInfo.type* %.tmp3961)
%.tmp3962 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3963 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3962, i32 0, i32 1
%.tmp3964 = load %m0$.File.type*, %m0$.File.type** %.tmp3963
%.tmp3966 = getelementptr [28 x i8], [28 x i8]*@.str3965, i32 0, i32 0
%.tmp3967 = load i8*, i8** %param_info_tr.3949
%.tmp3968 = load i8*, i8** %var_name.3940
%.tmp3969 = load i8*, i8** %param_info_tr.3949
%.tmp3970 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3971 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3970)
%.tmp3972 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3964, i8* %.tmp3966, i8* %.tmp3967, i8* %.tmp3968, i8* %.tmp3969, i8* %.tmp3971)
%.tmp3973 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3974 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3973, i32 0, i32 7
%.tmp3975 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3974
store %m307$.Node.type* %.tmp3975, %m307$.Node.type** %param_ptr.3901
br label %.for.start.3899
.for.end.3899:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3976 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3978 = getelementptr [6 x i8], [6 x i8]*@.str3977, i32 0, i32 0
%.tmp3979 = bitcast ptr null to i8*
%.tmp3980 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3976, i8* %.tmp3978, i8* %.tmp3979, i8* %.tmp3980)
%.tmp3981 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3982 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3981, i32 0, i32 6
%.tmp3983 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3982
%.tmp3985 = getelementptr [12 x i8], [12 x i8]*@.str3984, i32 0, i32 0
%.tmp3986 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3983, i8* %.tmp3985)
%exprs.3987 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3986, %m307$.Node.type** %exprs.3987
%.tmp3988 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3987
%.tmp3989 = icmp ne %m307$.Node.type* %.tmp3988, null
br i1 %.tmp3989, label %.if.true.3990, label %.if.false.3990
.if.true.3990:
%.tmp3992 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3987
%.tmp3993 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3992, i32 0, i32 6
%.tmp3994 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3993
%b.3995 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3994, %m307$.Node.type** %b.3995
br label %.for.start.3991
.for.start.3991:
%.tmp3996 = load %m307$.Node.type*, %m307$.Node.type** %b.3995
%.tmp3997 = icmp ne %m307$.Node.type* %.tmp3996, null
br i1 %.tmp3997, label %.for.continue.3991, label %.for.end.3991
.for.continue.3991:
%.tmp3998 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3999 = load %m307$.Node.type*, %m307$.Node.type** %b.3995
%.tmp4000 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3999, i32 0, i32 6
%.tmp4001 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4000
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3998, %m307$.Node.type* %.tmp4001)
%.tmp4002 = load %m307$.Node.type*, %m307$.Node.type** %b.3995
%.tmp4003 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4002, i32 0, i32 7
%.tmp4004 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4003
store %m307$.Node.type* %.tmp4004, %m307$.Node.type** %b.3995
br label %.for.start.3991
.for.end.3991:
br label %.if.end.3990
.if.false.3990:
br label %.if.end.3990
.if.end.3990:
%.tmp4005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4005)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4006 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4007 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4008 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4006, %m307$.Node.type* %.tmp4007)
%val.4009 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4008, %m1861$.AssignableInfo.type** %val.4009
%.tmp4010 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4009
%.tmp4011 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4010, i32 0, i32 3
%.tmp4012 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4011
%.tmp4013 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4012, i32 0, i32 0
%.tmp4014 = load i8*, i8** %.tmp4013
%.tmp4016 = getelementptr [7 x i8], [7 x i8]*@.str4015, i32 0, i32 0
%.tmp4017 = call i32(i8*,i8*) @strcmp(i8* %.tmp4014, i8* %.tmp4016)
%.tmp4018 = icmp ne i32 %.tmp4017, 0
br i1 %.tmp4018, label %.if.true.4019, label %.if.false.4019
.if.true.4019:
%.tmp4021 = getelementptr [7 x i8], [7 x i8]*@.str4020, i32 0, i32 0
%.tmp4022 = call i32(i8*,...) @printf(i8* %.tmp4021)
%.tmp4023 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4023
br label %.if.end.4019
.if.false.4019:
br label %.if.end.4019
.if.end.4019:
%.tmp4024 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4009
%.tmp4025 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4024, i32 0, i32 3
%.tmp4026 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4025
%.tmp4027 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4026, i32 0, i32 3
%.tmp4028 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4027
%node_type.4029 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4028, %m1861$.Type.type** %node_type.4029
%i.4031 = alloca i32
store i32 0, i32* %i.4031
br label %.for.start.4030
.for.start.4030:
%.tmp4032 = load i32, i32* %i.4031
%.tmp4033 = load i32, i32* %attr_id
%.tmp4034 = icmp slt i32 %.tmp4032, %.tmp4033
br i1 %.tmp4034, label %.for.continue.4030, label %.for.end.4030
.for.continue.4030:
%.tmp4035 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4029
%.tmp4036 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4035, i32 0, i32 4
%.tmp4037 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4036
store %m1861$.Type.type* %.tmp4037, %m1861$.Type.type** %node_type.4029
%.tmp4038 = load i32, i32* %i.4031
%.tmp4039 = add i32 %.tmp4038, 1
store i32 %.tmp4039, i32* %i.4031
br label %.for.start.4030
.for.end.4030:
%.tmp4040 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4041 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4040)
%info.4042 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4041, %m1861$.AssignableInfo.type** %info.4042
%.tmp4043 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4042
%.tmp4044 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4043, i32 0, i32 3
%.tmp4045 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4029
store %m1861$.Type.type* %.tmp4045, %m1861$.Type.type** %.tmp4044
%.tmp4046 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4047 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4046)
%tmp_id.4048 = alloca i32
store i32 %.tmp4047, i32* %tmp_id.4048
%.tmp4049 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4050 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4009
%.tmp4051 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4050, i32 0, i32 3
%.tmp4052 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4051
%.tmp4053 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4049, %m1861$.Type.type* %.tmp4052)
%type_as_str.4054 = alloca i8*
store i8* %.tmp4053, i8** %type_as_str.4054
%.tmp4055 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4056 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4042
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4055, %m1861$.AssignableInfo.type* %.tmp4056)
%.tmp4057 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4058 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4057, i32 0, i32 1
%.tmp4059 = load %m0$.File.type*, %m0$.File.type** %.tmp4058
%.tmp4061 = getelementptr [52 x i8], [52 x i8]*@.str4060, i32 0, i32 0
%.tmp4062 = load i32, i32* %tmp_id.4048
%.tmp4063 = load i8*, i8** %type_as_str.4054
%.tmp4064 = load i8*, i8** %type_as_str.4054
%.tmp4065 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4009
%.tmp4066 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4065)
%.tmp4067 = load i32, i32* %attr_id
%.tmp4068 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4059, i8* %.tmp4061, i32 %.tmp4062, i8* %.tmp4063, i8* %.tmp4064, i8* %.tmp4066, i32 %.tmp4067)
%.tmp4069 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4070 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4069, i32 0, i32 1
%.tmp4071 = load %m0$.File.type*, %m0$.File.type** %.tmp4070
%.tmp4073 = getelementptr [28 x i8], [28 x i8]*@.str4072, i32 0, i32 0
%.tmp4074 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4042
%.tmp4075 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4074)
%.tmp4076 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4077 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4042
%.tmp4078 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4077, i32 0, i32 3
%.tmp4079 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4078
%.tmp4080 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4076, %m1861$.Type.type* %.tmp4079)
%.tmp4081 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4082 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4042
%.tmp4083 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4082, i32 0, i32 3
%.tmp4084 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4083
%.tmp4085 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4081, %m1861$.Type.type* %.tmp4084)
%.tmp4086 = load i32, i32* %tmp_id.4048
%.tmp4087 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4071, i8* %.tmp4073, i8* %.tmp4075, i8* %.tmp4080, i8* %.tmp4085, i32 %.tmp4086)
%.tmp4088 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4042
ret %m1861$.AssignableInfo.type* %.tmp4088
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
%.tmp4089 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4090 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4091 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4089, %m307$.Node.type* %.tmp4090)
%val.4092 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4091, %m1861$.AssignableInfo.type** %val.4092
%.tmp4093 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4092
%.tmp4094 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4093, i32 0, i32 3
%.tmp4095 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4094
%.tmp4096 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4095, i32 0, i32 0
%.tmp4097 = load i8*, i8** %.tmp4096
%.tmp4099 = getelementptr [7 x i8], [7 x i8]*@.str4098, i32 0, i32 0
%.tmp4100 = call i32(i8*,i8*) @strcmp(i8* %.tmp4097, i8* %.tmp4099)
%.tmp4101 = icmp ne i32 %.tmp4100, 0
br i1 %.tmp4101, label %.if.true.4102, label %.if.false.4102
.if.true.4102:
%.tmp4104 = getelementptr [7 x i8], [7 x i8]*@.str4103, i32 0, i32 0
%.tmp4105 = call i32(i8*,...) @printf(i8* %.tmp4104)
ret void
br label %.if.end.4102
.if.false.4102:
br label %.if.end.4102
.if.end.4102:
%.tmp4106 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4092
%.tmp4107 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4106, i32 0, i32 3
%.tmp4108 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4107
%.tmp4109 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4108, i32 0, i32 3
%.tmp4110 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4109
%node_type.4111 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4110, %m1861$.Type.type** %node_type.4111
%i.4113 = alloca i32
store i32 0, i32* %i.4113
br label %.for.start.4112
.for.start.4112:
%.tmp4114 = load i32, i32* %i.4113
%.tmp4115 = load i32, i32* %attr_id
%.tmp4116 = icmp slt i32 %.tmp4114, %.tmp4115
br i1 %.tmp4116, label %.for.continue.4112, label %.for.end.4112
.for.continue.4112:
%.tmp4117 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4111
%.tmp4118 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4117, i32 0, i32 4
%.tmp4119 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4118
store %m1861$.Type.type* %.tmp4119, %m1861$.Type.type** %node_type.4111
%.tmp4120 = load i32, i32* %i.4113
%.tmp4121 = add i32 %.tmp4120, 1
store i32 %.tmp4121, i32* %i.4113
br label %.for.start.4112
.for.end.4112:
%.tmp4122 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4123 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4122)
%tmp_id.4124 = alloca i32
store i32 %.tmp4123, i32* %tmp_id.4124
%.tmp4125 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4126 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4092
%.tmp4127 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4126, i32 0, i32 3
%.tmp4128 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4127
%.tmp4129 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4125, %m1861$.Type.type* %.tmp4128)
%type_as_str.4130 = alloca i8*
store i8* %.tmp4129, i8** %type_as_str.4130
%.tmp4131 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4132 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4131, i32 0, i32 1
%.tmp4133 = load %m0$.File.type*, %m0$.File.type** %.tmp4132
%.tmp4135 = getelementptr [52 x i8], [52 x i8]*@.str4134, i32 0, i32 0
%.tmp4136 = load i32, i32* %tmp_id.4124
%.tmp4137 = load i8*, i8** %type_as_str.4130
%.tmp4138 = load i8*, i8** %type_as_str.4130
%.tmp4139 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4092
%.tmp4140 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4139)
%.tmp4141 = load i32, i32* %attr_id
%.tmp4142 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4133, i8* %.tmp4135, i32 %.tmp4136, i8* %.tmp4137, i8* %.tmp4138, i8* %.tmp4140, i32 %.tmp4141)
%.tmp4143 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4144 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4143, i32 0, i32 1
%.tmp4145 = load %m0$.File.type*, %m0$.File.type** %.tmp4144
%.tmp4147 = getelementptr [18 x i8], [18 x i8]*@.str4146, i32 0, i32 0
%.tmp4148 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4149 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4111
%.tmp4150 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4148, %m1861$.Type.type* %.tmp4149)
%.tmp4151 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4152 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4111
%.tmp4153 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4151, %m1861$.Type.type* %.tmp4152)
%.tmp4154 = load i8*, i8** %attr
%.tmp4155 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4145, i8* %.tmp4147, i8* %.tmp4150, i8* %.tmp4153, i8* %.tmp4154)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4156 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4157 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4156, i32 0, i32 6
%.tmp4158 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4157
%.tmp4159 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4158, i32 0, i32 6
%.tmp4160 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4159
%dotted.4161 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4160, %m307$.Node.type** %dotted.4161
%.tmp4162 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4161
%.tmp4163 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4162, i32 0, i32 7
%.tmp4164 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4163
%.tmp4165 = icmp ne %m307$.Node.type* %.tmp4164, null
br i1 %.tmp4165, label %.if.true.4166, label %.if.false.4166
.if.true.4166:
%.tmp4167 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4167
br label %.if.end.4166
.if.false.4166:
br label %.if.end.4166
.if.end.4166:
%.tmp4168 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4161
%.tmp4169 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4168, i32 0, i32 1
%.tmp4170 = load i8*, i8** %.tmp4169
%.tmp4172 = getelementptr [7 x i8], [7 x i8]*@.str4171, i32 0, i32 0
%.tmp4173 = call i32(i8*,i8*) @strcmp(i8* %.tmp4170, i8* %.tmp4172)
%.tmp4174 = icmp eq i32 %.tmp4173, 0
br i1 %.tmp4174, label %.if.true.4175, label %.if.false.4175
.if.true.4175:
%.tmp4176 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4178 = getelementptr [8 x i8], [8 x i8]*@.str4177, i32 0, i32 0
%.tmp4179 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4176, i8* %.tmp4178)
%args.4180 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4179, %m307$.Node.type** %args.4180
%.tmp4181 = load %m307$.Node.type*, %m307$.Node.type** %args.4180
%.tmp4182 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4181, i32 0, i32 6
%.tmp4183 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4182
%.tmp4185 = getelementptr [11 x i8], [11 x i8]*@.str4184, i32 0, i32 0
%.tmp4186 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4183, i8* %.tmp4185)
%value.4187 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4186, %m307$.Node.type** %value.4187
%.tmp4188 = load %m307$.Node.type*, %m307$.Node.type** %value.4187
%.tmp4189 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4188, i32 0, i32 6
%.tmp4190 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4189
%.tmp4191 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4190, i32 0, i32 6
%.tmp4192 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4191
%.tmp4193 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4192, i32 0, i32 6
%.tmp4194 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4193
%.tmp4195 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4194, i32 0, i32 6
%.tmp4196 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4195
store %m307$.Node.type* %.tmp4196, %m307$.Node.type** %value.4187
%.tmp4197 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4198 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4197)
%tmp_id.4199 = alloca i32
store i32 %.tmp4198, i32* %tmp_id.4199
%.tmp4200 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4201 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4200)
%info.4202 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4201, %m1861$.AssignableInfo.type** %info.4202
%.tmp4203 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4204 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4203, %m1861$.AssignableInfo.type* %.tmp4204)
%.tmp4205 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
%.tmp4206 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4205, i32 0, i32 3
%.tmp4207 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4207, %m1861$.Type.type** %.tmp4206
%.tmp4208 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
%.tmp4209 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4208, i32 0, i32 3
%.tmp4210 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4209
%.tmp4211 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4210, i32 0, i32 0
%.tmp4213 = getelementptr [4 x i8], [4 x i8]*@.str4212, i32 0, i32 0
store i8* %.tmp4213, i8** %.tmp4211
%.tmp4214 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4215 = load %m307$.Node.type*, %m307$.Node.type** %value.4187
%.tmp4216 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4214, %m307$.Node.type* %.tmp4215)
%inspected_type.4217 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4216, %m1861$.Type.type** %inspected_type.4217
%.tmp4218 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4219 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4217
%.tmp4220 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4218, %m1861$.Type.type* %.tmp4219)
%type_as_str.4221 = alloca i8*
store i8* %.tmp4220, i8** %type_as_str.4221
%.tmp4222 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4223 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4222, i32 0, i32 1
%.tmp4224 = load %m0$.File.type*, %m0$.File.type** %.tmp4223
%.tmp4226 = getelementptr [46 x i8], [46 x i8]*@.str4225, i32 0, i32 0
%.tmp4227 = load i32, i32* %tmp_id.4199
%.tmp4228 = load i8*, i8** %type_as_str.4221
%.tmp4229 = load i8*, i8** %type_as_str.4221
%.tmp4230 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4224, i8* %.tmp4226, i32 %.tmp4227, i8* %.tmp4228, i8* %.tmp4229)
%.tmp4231 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4232 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4231, i32 0, i32 1
%.tmp4233 = load %m0$.File.type*, %m0$.File.type** %.tmp4232
%.tmp4235 = getelementptr [35 x i8], [35 x i8]*@.str4234, i32 0, i32 0
%.tmp4236 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
%.tmp4237 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4236)
%.tmp4238 = load i8*, i8** %type_as_str.4221
%.tmp4239 = load i32, i32* %tmp_id.4199
%.tmp4240 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4233, i8* %.tmp4235, i8* %.tmp4237, i8* %.tmp4238, i32 %.tmp4239)
%.tmp4241 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4202
ret %m1861$.AssignableInfo.type* %.tmp4241
br label %.if.end.4175
.if.false.4175:
%.tmp4242 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4161
%.tmp4243 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4242, i32 0, i32 1
%.tmp4244 = load i8*, i8** %.tmp4243
%.tmp4246 = getelementptr [7 x i8], [7 x i8]*@.str4245, i32 0, i32 0
%.tmp4247 = call i32(i8*,i8*) @strcmp(i8* %.tmp4244, i8* %.tmp4246)
%.tmp4248 = icmp eq i32 %.tmp4247, 0
br i1 %.tmp4248, label %.if.true.4249, label %.if.false.4249
.if.true.4249:
%.tmp4250 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4252 = getelementptr [8 x i8], [8 x i8]*@.str4251, i32 0, i32 0
%.tmp4253 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4250, i8* %.tmp4252)
%args.4254 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4253, %m307$.Node.type** %args.4254
%.tmp4255 = load %m307$.Node.type*, %m307$.Node.type** %args.4254
%.tmp4256 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4255, i32 0, i32 6
%.tmp4257 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4256
%.tmp4259 = getelementptr [11 x i8], [11 x i8]*@.str4258, i32 0, i32 0
%.tmp4260 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4257, i8* %.tmp4259)
%array.4261 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4260, %m307$.Node.type** %array.4261
%.tmp4262 = load %m307$.Node.type*, %m307$.Node.type** %array.4261
%.tmp4263 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4262, i32 0, i32 7
%.tmp4264 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4263
%.tmp4266 = getelementptr [11 x i8], [11 x i8]*@.str4265, i32 0, i32 0
%.tmp4267 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4264, i8* %.tmp4266)
%value.4268 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4267, %m307$.Node.type** %value.4268
%.tmp4269 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4270 = load %m307$.Node.type*, %m307$.Node.type** %value.4268
%.tmp4271 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4269, %m307$.Node.type* %.tmp4270)
%value_info.4272 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4271, %m1861$.AssignableInfo.type** %value_info.4272
%.tmp4273 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4274 = load %m307$.Node.type*, %m307$.Node.type** %array.4261
%.tmp4275 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4273, %m307$.Node.type* %.tmp4274)
%array_info.4276 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4275, %m1861$.AssignableInfo.type** %array_info.4276
%.tmp4277 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4278 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4277)
%info.4279 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4278, %m1861$.AssignableInfo.type** %info.4279
%.tmp4280 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4281 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4279
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4280, %m1861$.AssignableInfo.type* %.tmp4281)
%.tmp4282 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4279
%.tmp4283 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4282, i32 0, i32 3
%.tmp4284 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4276
%.tmp4285 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4284, i32 0, i32 3
%.tmp4286 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4285
store %m1861$.Type.type* %.tmp4286, %m1861$.Type.type** %.tmp4283
%builtin_prefix.4287 = alloca i8*
store i8* null, i8** %builtin_prefix.4287
%.tmp4288 = getelementptr i8*, i8** %builtin_prefix.4287, i32 0
%.tmp4290 = getelementptr [5 x i8], [5 x i8]*@.str4289, i32 0, i32 0
%.tmp4291 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4292 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4291)
%.tmp4293 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4288, i8* %.tmp4290, i32 %.tmp4292)
%.tmp4294 = call i8*() @m2532$append_tmpl.cp()
%tmpl.4295 = alloca i8*
store i8* %.tmp4294, i8** %tmpl.4295
%.tmp4296 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4297 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4296, i32 0, i32 1
%.tmp4298 = load %m0$.File.type*, %m0$.File.type** %.tmp4297
%.tmp4299 = load i8*, i8** %tmpl.4295
%.tmp4300 = load i8*, i8** %builtin_prefix.4287
%.tmp4301 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4302 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4276
%.tmp4303 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4302, i32 0, i32 3
%.tmp4304 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4303
%.tmp4305 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4301, %m1861$.Type.type* %.tmp4304)
%.tmp4306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4276
%.tmp4307 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4306)
%.tmp4308 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4309 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4272
%.tmp4310 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4309, i32 0, i32 3
%.tmp4311 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4310
%.tmp4312 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4308, %m1861$.Type.type* %.tmp4311)
%.tmp4313 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4272
%.tmp4314 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4313)
%.tmp4315 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4279
%.tmp4316 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4315)
%.tmp4317 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4298, i8* %.tmp4299, i8* %.tmp4300, i8* %.tmp4305, i8* %.tmp4307, i8* %.tmp4312, i8* %.tmp4314, i8* %.tmp4316)
%.tmp4318 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4279
ret %m1861$.AssignableInfo.type* %.tmp4318
br label %.if.end.4249
.if.false.4249:
%.tmp4319 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4161
%.tmp4320 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4319, i32 0, i32 1
%.tmp4321 = load i8*, i8** %.tmp4320
%.tmp4323 = getelementptr [4 x i8], [4 x i8]*@.str4322, i32 0, i32 0
%.tmp4324 = call i32(i8*,i8*) @strcmp(i8* %.tmp4321, i8* %.tmp4323)
%.tmp4325 = icmp eq i32 %.tmp4324, 0
br i1 %.tmp4325, label %.if.true.4326, label %.if.false.4326
.if.true.4326:
%.tmp4327 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4329 = getelementptr [8 x i8], [8 x i8]*@.str4328, i32 0, i32 0
%.tmp4330 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4327, i8* %.tmp4329)
%args.4331 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4330, %m307$.Node.type** %args.4331
%.tmp4332 = load %m307$.Node.type*, %m307$.Node.type** %args.4331
%.tmp4333 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4332, i32 0, i32 6
%.tmp4334 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4333
%.tmp4336 = getelementptr [11 x i8], [11 x i8]*@.str4335, i32 0, i32 0
%.tmp4337 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4334, i8* %.tmp4336)
%value.4338 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4337, %m307$.Node.type** %value.4338
%.tmp4339 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4340 = load %m307$.Node.type*, %m307$.Node.type** %value.4338
%.tmp4341 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i32) @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.tmp4339, %m307$.Node.type* %.tmp4340, i32 1)
ret %m1861$.AssignableInfo.type* %.tmp4341
br label %.if.end.4326
.if.false.4326:
br label %.if.end.4326
.if.end.4326:
br label %.if.end.4249
.if.end.4249:
br label %.if.end.4175
.if.end.4175:
%.tmp4342 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4342
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4343 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4344 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4345 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4343, %m307$.Node.type* %.tmp4344)
%info.4346 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4345, %m1861$.AssignableInfo.type** %info.4346
%.tmp4347 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4348 = icmp ne %m1861$.AssignableInfo.type* %.tmp4347, null
br i1 %.tmp4348, label %.if.true.4349, label %.if.false.4349
.if.true.4349:
%.tmp4350 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
ret %m1861$.AssignableInfo.type* %.tmp4350
br label %.if.end.4349
.if.false.4349:
br label %.if.end.4349
.if.end.4349:
%.tmp4351 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4352 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4353 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4351, %m307$.Node.type* %.tmp4352)
store %m1861$.AssignableInfo.type* %.tmp4353, %m1861$.AssignableInfo.type** %info.4346
%.tmp4354 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4355 = icmp eq %m1861$.AssignableInfo.type* %.tmp4354, null
br i1 %.tmp4355, label %.if.true.4356, label %.if.false.4356
.if.true.4356:
%.tmp4357 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4357, label %.if.true.4358, label %.if.false.4358
.if.true.4358:
%.tmp4359 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4360 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4362 = getelementptr [35 x i8], [35 x i8]*@.str4361, i32 0, i32 0
%.tmp4363 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4359, %m307$.Node.type* %.tmp4360, i8* %.tmp4362)
%.tmp4364 = call i32(i8*,...) @printf(i8* %.tmp4363)
br label %.if.end.4358
.if.false.4358:
br label %.if.end.4358
.if.end.4358:
%.tmp4365 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4365
br label %.if.end.4356
.if.false.4356:
br label %.if.end.4356
.if.end.4356:
%.tmp4366 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4368 = getelementptr [8 x i8], [8 x i8]*@.str4367, i32 0, i32 0
%.tmp4369 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4366, i8* %.tmp4368)
%args.4370 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4369, %m307$.Node.type** %args.4370
%.tmp4372 = getelementptr [1 x i8], [1 x i8]*@.str4371, i32 0, i32 0
%params_buff.4373 = alloca i8*
store i8* %.tmp4372, i8** %params_buff.4373
%tmp.4374 = alloca i8*
store i8* null, i8** %tmp.4374
%.tmp4375 = load %m307$.Node.type*, %m307$.Node.type** %args.4370
%.tmp4376 = icmp ne %m307$.Node.type* %.tmp4375, null
br i1 %.tmp4376, label %.if.true.4377, label %.if.false.4377
.if.true.4377:
%.tmp4378 = load %m307$.Node.type*, %m307$.Node.type** %args.4370
%.tmp4379 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4378, i32 0, i32 6
%.tmp4380 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4379
%.tmp4382 = getelementptr [11 x i8], [11 x i8]*@.str4381, i32 0, i32 0
%.tmp4383 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4380, i8* %.tmp4382)
%start.4384 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4383, %m307$.Node.type** %start.4384
%.tmp4386 = load %m307$.Node.type*, %m307$.Node.type** %start.4384
%pp.4387 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4386, %m307$.Node.type** %pp.4387
br label %.for.start.4385
.for.start.4385:
%.tmp4388 = load %m307$.Node.type*, %m307$.Node.type** %pp.4387
%.tmp4389 = icmp ne %m307$.Node.type* %.tmp4388, null
br i1 %.tmp4389, label %.for.continue.4385, label %.for.end.4385
.for.continue.4385:
%.tmp4390 = load %m307$.Node.type*, %m307$.Node.type** %pp.4387
%.tmp4391 = load %m307$.Node.type*, %m307$.Node.type** %start.4384
%.tmp4392 = icmp ne %m307$.Node.type* %.tmp4390, %.tmp4391
br i1 %.tmp4392, label %.if.true.4393, label %.if.false.4393
.if.true.4393:
%.tmp4394 = getelementptr i8*, i8** %tmp.4374, i32 0
%.tmp4396 = getelementptr [5 x i8], [5 x i8]*@.str4395, i32 0, i32 0
%.tmp4397 = load i8*, i8** %params_buff.4373
%.tmp4398 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4394, i8* %.tmp4396, i8* %.tmp4397)
%.tmp4399 = load i8*, i8** %params_buff.4373
%tmp_buff.4400 = alloca i8*
store i8* %.tmp4399, i8** %tmp_buff.4400
%.tmp4401 = load i8*, i8** %tmp.4374
store i8* %.tmp4401, i8** %params_buff.4373
%.tmp4402 = load i8*, i8** %tmp_buff.4400
store i8* %.tmp4402, i8** %tmp.4374
%.tmp4403 = load i8*, i8** %tmp.4374
call void(i8*) @free(i8* %.tmp4403)
br label %.if.end.4393
.if.false.4393:
br label %.if.end.4393
.if.end.4393:
%.tmp4404 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4405 = load %m307$.Node.type*, %m307$.Node.type** %pp.4387
%.tmp4406 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4404, %m307$.Node.type* %.tmp4405)
%a_info.4407 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4406, %m1861$.AssignableInfo.type** %a_info.4407
%.tmp4408 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4407
%.tmp4409 = icmp eq %m1861$.AssignableInfo.type* %.tmp4408, null
br i1 %.tmp4409, label %.if.true.4410, label %.if.false.4410
.if.true.4410:
%.tmp4411 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4411
br label %.if.end.4410
.if.false.4410:
br label %.if.end.4410
.if.end.4410:
%.tmp4412 = getelementptr i8*, i8** %params_buff.4373, i32 0
%.tmp4414 = getelementptr [8 x i8], [8 x i8]*@.str4413, i32 0, i32 0
%.tmp4415 = load i8*, i8** %params_buff.4373
%.tmp4416 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4417 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4407
%.tmp4418 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4417, i32 0, i32 3
%.tmp4419 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4418
%.tmp4420 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4416, %m1861$.Type.type* %.tmp4419)
%.tmp4421 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4407
%.tmp4422 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4421)
%.tmp4423 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4412, i8* %.tmp4414, i8* %.tmp4415, i8* %.tmp4420, i8* %.tmp4422)
%.tmp4424 = load %m307$.Node.type*, %m307$.Node.type** %pp.4387
%.tmp4425 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4424, i32 0, i32 7
%.tmp4426 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4425
store %m307$.Node.type* %.tmp4426, %m307$.Node.type** %pp.4387
%.tmp4427 = load %m307$.Node.type*, %m307$.Node.type** %pp.4387
%.tmp4429 = getelementptr [11 x i8], [11 x i8]*@.str4428, i32 0, i32 0
%.tmp4430 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4427, i8* %.tmp4429)
store %m307$.Node.type* %.tmp4430, %m307$.Node.type** %pp.4387
br label %.for.start.4385
.for.end.4385:
br label %.if.end.4377
.if.false.4377:
br label %.if.end.4377
.if.end.4377:
%.tmp4431 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4432 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4433 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4432, i32 0, i32 3
%.tmp4434 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4433
%.tmp4435 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4434, i32 0, i32 3
%.tmp4436 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4435
%.tmp4437 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4431, %m1861$.Type.type* %.tmp4436)
%.tmp4439 = getelementptr [5 x i8], [5 x i8]*@.str4438, i32 0, i32 0
%.tmp4440 = call i32(i8*,i8*) @strcmp(i8* %.tmp4437, i8* %.tmp4439)
%.tmp4441 = icmp eq i32 %.tmp4440, 0
br i1 %.tmp4441, label %.if.true.4442, label %.if.false.4442
.if.true.4442:
%.tmp4443 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4444 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4443, i32 0, i32 1
%.tmp4445 = load %m0$.File.type*, %m0$.File.type** %.tmp4444
%.tmp4447 = getelementptr [16 x i8], [16 x i8]*@.str4446, i32 0, i32 0
%.tmp4448 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4449 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4450 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4449, i32 0, i32 3
%.tmp4451 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4450
%.tmp4452 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4448, %m1861$.Type.type* %.tmp4451)
%.tmp4453 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4454 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4453)
%.tmp4455 = load i8*, i8** %params_buff.4373
%.tmp4456 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4445, i8* %.tmp4447, i8* %.tmp4452, i8* %.tmp4454, i8* %.tmp4455)
%.tmp4457 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4457
br label %.if.end.4442
.if.false.4442:
br label %.if.end.4442
.if.end.4442:
%.tmp4458 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4459 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4458)
%call_info.4460 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4459, %m1861$.AssignableInfo.type** %call_info.4460
%.tmp4461 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4462 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4460
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4461, %m1861$.AssignableInfo.type* %.tmp4462)
%.tmp4463 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4460
%.tmp4464 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4463, i32 0, i32 3
%.tmp4465 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4466 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4465, i32 0, i32 3
%.tmp4467 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4466
%.tmp4468 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4467, i32 0, i32 3
%.tmp4469 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4468
%.tmp4470 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4469)
store %m1861$.Type.type* %.tmp4470, %m1861$.Type.type** %.tmp4464
%.tmp4471 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4460
%.tmp4472 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4471, i32 0, i32 3
%.tmp4473 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4472
%.tmp4474 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4473, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4474
%.tmp4475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4476 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4475, i32 0, i32 1
%.tmp4477 = load %m0$.File.type*, %m0$.File.type** %.tmp4476
%.tmp4479 = getelementptr [21 x i8], [21 x i8]*@.str4478, i32 0, i32 0
%.tmp4480 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4460
%.tmp4481 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4480)
%.tmp4482 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4483 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4484 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4483, i32 0, i32 3
%.tmp4485 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4484
%.tmp4486 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4482, %m1861$.Type.type* %.tmp4485)
%.tmp4487 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4346
%.tmp4488 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4487)
%.tmp4489 = load i8*, i8** %params_buff.4373
%.tmp4490 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4477, i8* %.tmp4479, i8* %.tmp4481, i8* %.tmp4486, i8* %.tmp4488, i8* %.tmp4489)
%.tmp4491 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4460
%.tmp4492 = bitcast %m1861$.AssignableInfo.type* %.tmp4491 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4492
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4493 = alloca i8*
store i8* null, i8** %err_msg.4493
%.tmp4494 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4495 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4494, i32 0, i32 0
%.tmp4496 = load i8*, i8** %.tmp4495
%expr_type.4497 = alloca i8*
store i8* %.tmp4496, i8** %expr_type.4497
%.tmp4498 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4499 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4498, %m1861$.AssignableInfo.type** %info.4499
%assignable.4500 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4500
%.tmp4501 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4502 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4501, %m1861$.AssignableInfo.type** %a_info.4502
%.tmp4503 = load i8*, i8** %expr_type.4497
%.tmp4505 = getelementptr [7 x i8], [7 x i8]*@.str4504, i32 0, i32 0
%.tmp4506 = call i32(i8*,i8*) @strcmp(i8* %.tmp4503, i8* %.tmp4505)
%.tmp4507 = icmp eq i32 %.tmp4506, 0
br i1 %.tmp4507, label %.if.true.4508, label %.if.false.4508
.if.true.4508:
%.tmp4509 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4510 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4509, i32 0, i32 6
%.tmp4511 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4510
%.tmp4512 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4511, i32 0, i32 7
%.tmp4513 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4512
%.tmp4514 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4513, i32 0, i32 0
%.tmp4515 = load i8*, i8** %.tmp4514
%.tmp4517 = getelementptr [3 x i8], [3 x i8]*@.str4516, i32 0, i32 0
%.tmp4518 = call i32(i8*,i8*) @strcmp(i8* %.tmp4515, i8* %.tmp4517)
%.tmp4519 = icmp ne i32 %.tmp4518, 0
br i1 %.tmp4519, label %.if.true.4520, label %.if.false.4520
.if.true.4520:
%.tmp4521 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4522 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4523 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4522, i32 0, i32 6
%.tmp4524 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4523
%.tmp4525 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4524, i32 0, i32 7
%.tmp4526 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4525
%.tmp4527 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4521, %m307$.Node.type* %.tmp4526)
store %m1861$.AssignableInfo.type* %.tmp4527, %m1861$.AssignableInfo.type** %info.4499
%.tmp4528 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4499
%.tmp4529 = icmp eq %m1861$.AssignableInfo.type* %.tmp4528, null
br i1 %.tmp4529, label %.if.true.4530, label %.if.false.4530
.if.true.4530:
ret void
br label %.if.end.4530
.if.false.4530:
br label %.if.end.4530
.if.end.4530:
%.tmp4531 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4532 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4531, i32 0, i32 1
%.tmp4533 = load %m0$.File.type*, %m0$.File.type** %.tmp4532
%.tmp4535 = getelementptr [11 x i8], [11 x i8]*@.str4534, i32 0, i32 0
%.tmp4536 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4537 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4499
%.tmp4538 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4537, i32 0, i32 3
%.tmp4539 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4538
%.tmp4540 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4536, %m1861$.Type.type* %.tmp4539)
%.tmp4541 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4499
%.tmp4542 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4541)
%.tmp4543 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4533, i8* %.tmp4535, i8* %.tmp4540, i8* %.tmp4542)
br label %.if.end.4520
.if.false.4520:
%.tmp4544 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4545 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4544, i32 0, i32 1
%.tmp4546 = load %m0$.File.type*, %m0$.File.type** %.tmp4545
%.tmp4548 = getelementptr [10 x i8], [10 x i8]*@.str4547, i32 0, i32 0
%.tmp4549 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4546, i8* %.tmp4548)
br label %.if.end.4520
.if.end.4520:
br label %.if.end.4508
.if.false.4508:
%.tmp4550 = load i8*, i8** %expr_type.4497
%.tmp4552 = getelementptr [3 x i8], [3 x i8]*@.str4551, i32 0, i32 0
%.tmp4553 = call i32(i8*,i8*) @strcmp(i8* %.tmp4550, i8* %.tmp4552)
%.tmp4554 = icmp eq i32 %.tmp4553, 0
br i1 %.tmp4554, label %.if.true.4555, label %.if.false.4555
.if.true.4555:
br label %.if.end.4555
.if.false.4555:
%.tmp4556 = load i8*, i8** %expr_type.4497
%.tmp4558 = getelementptr [8 x i8], [8 x i8]*@.str4557, i32 0, i32 0
%.tmp4559 = call i32(i8*,i8*) @strcmp(i8* %.tmp4556, i8* %.tmp4558)
%.tmp4560 = icmp eq i32 %.tmp4559, 0
br i1 %.tmp4560, label %.if.true.4561, label %.if.false.4561
.if.true.4561:
%.tmp4562 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4563 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4564 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4563, i32 0, i32 6
%.tmp4565 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4564
%.tmp4566 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4562, %m307$.Node.type* %.tmp4565)
br label %.if.end.4561
.if.false.4561:
%.tmp4567 = load i8*, i8** %expr_type.4497
%.tmp4569 = getelementptr [12 x i8], [12 x i8]*@.str4568, i32 0, i32 0
%.tmp4570 = call i32(i8*,i8*) @strcmp(i8* %.tmp4567, i8* %.tmp4569)
%.tmp4571 = icmp eq i32 %.tmp4570, 0
br i1 %.tmp4571, label %.if.true.4572, label %.if.false.4572
.if.true.4572:
%.tmp4573 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4574 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4575 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4573, %m307$.Node.type* %.tmp4574)
br label %.if.end.4572
.if.false.4572:
%.tmp4576 = load i8*, i8** %expr_type.4497
%.tmp4578 = getelementptr [11 x i8], [11 x i8]*@.str4577, i32 0, i32 0
%.tmp4579 = call i32(i8*,i8*) @strcmp(i8* %.tmp4576, i8* %.tmp4578)
%.tmp4580 = icmp eq i32 %.tmp4579, 0
br i1 %.tmp4580, label %.if.true.4581, label %.if.false.4581
.if.true.4581:
%.tmp4582 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4583 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4582, i32 0, i32 6
%.tmp4584 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4583
%.tmp4586 = getelementptr [11 x i8], [11 x i8]*@.str4585, i32 0, i32 0
%.tmp4587 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4584, i8* %.tmp4586)
store %m307$.Node.type* %.tmp4587, %m307$.Node.type** %assignable.4500
%.tmp4588 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4589 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4590 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4589, i32 0, i32 6
%.tmp4591 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4590
%.tmp4592 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4588, %m307$.Node.type* %.tmp4591)
%dest.4593 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4592, %m1861$.AssignableInfo.type** %dest.4593
%.tmp4594 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4593
%.tmp4595 = icmp eq %m1861$.AssignableInfo.type* %.tmp4594, null
br i1 %.tmp4595, label %.if.true.4596, label %.if.false.4596
.if.true.4596:
ret void
br label %.if.end.4596
.if.false.4596:
br label %.if.end.4596
.if.end.4596:
%.tmp4597 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4598 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4500
%.tmp4599 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4597, %m307$.Node.type* %.tmp4598)
store %m1861$.AssignableInfo.type* %.tmp4599, %m1861$.AssignableInfo.type** %a_info.4502
%.tmp4600 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4502
%.tmp4601 = icmp eq %m1861$.AssignableInfo.type* %.tmp4600, null
br i1 %.tmp4601, label %.if.true.4602, label %.if.false.4602
.if.true.4602:
ret void
br label %.if.end.4602
.if.false.4602:
br label %.if.end.4602
.if.end.4602:
%.tmp4603 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4604 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4593
%.tmp4605 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4604, i32 0, i32 3
%.tmp4606 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4605
%.tmp4607 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4603, %m1861$.Type.type* %.tmp4606)
%dest_tr.4608 = alloca i8*
store i8* %.tmp4607, i8** %dest_tr.4608
%.tmp4609 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4610 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4502
%.tmp4611 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4610, i32 0, i32 3
%.tmp4612 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4611
%.tmp4613 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4609, %m1861$.Type.type* %.tmp4612)
%src_tr.4614 = alloca i8*
store i8* %.tmp4613, i8** %src_tr.4614
%.tmp4615 = load i8*, i8** %src_tr.4614
%.tmp4617 = getelementptr [4 x i8], [4 x i8]*@.str4616, i32 0, i32 0
%.tmp4618 = call i32(i8*,i8*) @strcmp(i8* %.tmp4615, i8* %.tmp4617)
%.tmp4619 = icmp eq i32 %.tmp4618, 0
br i1 %.tmp4619, label %.if.true.4620, label %.if.false.4620
.if.true.4620:
%.tmp4621 = load i8*, i8** %dest_tr.4608
store i8* %.tmp4621, i8** %src_tr.4614
br label %.if.end.4620
.if.false.4620:
br label %.if.end.4620
.if.end.4620:
%.tmp4622 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4623 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4622, i32 0, i32 1
%.tmp4624 = load %m0$.File.type*, %m0$.File.type** %.tmp4623
%.tmp4626 = getelementptr [21 x i8], [21 x i8]*@.str4625, i32 0, i32 0
%.tmp4627 = load i8*, i8** %src_tr.4614
%.tmp4628 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4502
%.tmp4629 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4628)
%.tmp4630 = load i8*, i8** %dest_tr.4608
%.tmp4631 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4593
%.tmp4632 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4631)
%.tmp4633 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4624, i8* %.tmp4626, i8* %.tmp4627, i8* %.tmp4629, i8* %.tmp4630, i8* %.tmp4632)
br label %.if.end.4581
.if.false.4581:
%.tmp4634 = load i8*, i8** %expr_type.4497
%.tmp4636 = getelementptr [9 x i8], [9 x i8]*@.str4635, i32 0, i32 0
%.tmp4637 = call i32(i8*,i8*) @strcmp(i8* %.tmp4634, i8* %.tmp4636)
%.tmp4638 = icmp eq i32 %.tmp4637, 0
br i1 %.tmp4638, label %.if.true.4639, label %.if.false.4639
.if.true.4639:
%.tmp4640 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4641 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4640, %m307$.Node.type* %.tmp4641)
br label %.if.end.4639
.if.false.4639:
%.tmp4642 = load i8*, i8** %expr_type.4497
%.tmp4644 = getelementptr [9 x i8], [9 x i8]*@.str4643, i32 0, i32 0
%.tmp4645 = call i32(i8*,i8*) @strcmp(i8* %.tmp4642, i8* %.tmp4644)
%.tmp4646 = icmp eq i32 %.tmp4645, 0
br i1 %.tmp4646, label %.if.true.4647, label %.if.false.4647
.if.true.4647:
%.tmp4648 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4649 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4648, %m307$.Node.type* %.tmp4649)
br label %.if.end.4647
.if.false.4647:
%.tmp4650 = load i8*, i8** %expr_type.4497
%.tmp4652 = getelementptr [8 x i8], [8 x i8]*@.str4651, i32 0, i32 0
%.tmp4653 = call i32(i8*,i8*) @strcmp(i8* %.tmp4650, i8* %.tmp4652)
%.tmp4654 = icmp eq i32 %.tmp4653, 0
br i1 %.tmp4654, label %.if.true.4655, label %.if.false.4655
.if.true.4655:
%.tmp4656 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4657 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4656)
%mod.4658 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4657, %m1861$.ModuleLookup.type** %mod.4658
%found.4659 = alloca i1
store i1 0, i1* %found.4659
%.tmp4660 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4658
%.tmp4661 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4660, i32 0, i32 3
%.tmp4662 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4661
%s.4663 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4662, %m1861$.Scope.type** %s.4663
%.tmp4664 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4665 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4664, i32 0, i32 6
%.tmp4666 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4665
%.tmp4667 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4666, i32 0, i32 1
%.tmp4668 = load i8*, i8** %.tmp4667
%.tmp4670 = getelementptr [6 x i8], [6 x i8]*@.str4669, i32 0, i32 0
%.tmp4671 = call i32(i8*,i8*) @strcmp(i8* %.tmp4668, i8* %.tmp4670)
%.tmp4672 = icmp eq i32 %.tmp4671, 0
br i1 %.tmp4672, label %.if.true.4673, label %.if.false.4673
.if.true.4673:
br label %.for.start.4674
.for.start.4674:
%.tmp4675 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4676 = icmp ne %m1861$.Scope.type* %.tmp4675, null
%.tmp4677 = load i1, i1* %found.4659
%.tmp4678 = icmp eq i1 %.tmp4677, 0
%.tmp4679 = and i1 %.tmp4676, %.tmp4678
br i1 %.tmp4679, label %.for.continue.4674, label %.for.end.4674
.for.continue.4674:
%.tmp4680 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4681 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4680, i32 0, i32 2
%.tmp4682 = load i8*, i8** %.tmp4681
%.tmp4684 = getelementptr [4 x i8], [4 x i8]*@.str4683, i32 0, i32 0
%.tmp4685 = call i32(i8*,i8*) @strcmp(i8* %.tmp4682, i8* %.tmp4684)
%.tmp4686 = icmp eq i32 %.tmp4685, 0
br i1 %.tmp4686, label %.if.true.4687, label %.if.false.4687
.if.true.4687:
store i1 1, i1* %found.4659
%.tmp4688 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4689 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4688, i32 0, i32 1
%.tmp4690 = load %m0$.File.type*, %m0$.File.type** %.tmp4689
%.tmp4692 = getelementptr [15 x i8], [15 x i8]*@.str4691, i32 0, i32 0
%.tmp4693 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4694 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4693, i32 0, i32 4
%.tmp4695 = load i8*, i8** %.tmp4694
%.tmp4696 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4690, i8* %.tmp4692, i8* %.tmp4695)
br label %.if.end.4687
.if.false.4687:
br label %.if.end.4687
.if.end.4687:
%.tmp4697 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4698 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4697, i32 0, i32 5
%.tmp4699 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4698
store %m1861$.Scope.type* %.tmp4699, %m1861$.Scope.type** %s.4663
br label %.for.start.4674
.for.end.4674:
%.tmp4700 = load i1, i1* %found.4659
%.tmp4701 = icmp eq i1 %.tmp4700, 0
br i1 %.tmp4701, label %.if.true.4702, label %.if.false.4702
.if.true.4702:
%.tmp4703 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4704 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4706 = getelementptr [48 x i8], [48 x i8]*@.str4705, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4703, %m307$.Node.type* %.tmp4704, i8* %.tmp4706)
br label %.if.end.4702
.if.false.4702:
br label %.if.end.4702
.if.end.4702:
br label %.if.end.4673
.if.false.4673:
%.tmp4707 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4708 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4707, i32 0, i32 6
%.tmp4709 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4708
%.tmp4710 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4709, i32 0, i32 1
%.tmp4711 = load i8*, i8** %.tmp4710
%.tmp4713 = getelementptr [9 x i8], [9 x i8]*@.str4712, i32 0, i32 0
%.tmp4714 = call i32(i8*,i8*) @strcmp(i8* %.tmp4711, i8* %.tmp4713)
%.tmp4715 = icmp eq i32 %.tmp4714, 0
br i1 %.tmp4715, label %.if.true.4716, label %.if.false.4716
.if.true.4716:
br label %.for.start.4717
.for.start.4717:
%.tmp4718 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4719 = icmp ne %m1861$.Scope.type* %.tmp4718, null
%.tmp4720 = load i1, i1* %found.4659
%.tmp4721 = icmp eq i1 %.tmp4720, 0
%.tmp4722 = and i1 %.tmp4719, %.tmp4721
br i1 %.tmp4722, label %.for.continue.4717, label %.for.end.4717
.for.continue.4717:
%.tmp4723 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4724 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4723, i32 0, i32 2
%.tmp4725 = load i8*, i8** %.tmp4724
%.tmp4727 = getelementptr [4 x i8], [4 x i8]*@.str4726, i32 0, i32 0
%.tmp4728 = call i32(i8*,i8*) @strcmp(i8* %.tmp4725, i8* %.tmp4727)
%.tmp4729 = icmp eq i32 %.tmp4728, 0
br i1 %.tmp4729, label %.if.true.4730, label %.if.false.4730
.if.true.4730:
store i1 1, i1* %found.4659
%.tmp4731 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4732 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4731, i32 0, i32 1
%.tmp4733 = load %m0$.File.type*, %m0$.File.type** %.tmp4732
%.tmp4735 = getelementptr [15 x i8], [15 x i8]*@.str4734, i32 0, i32 0
%.tmp4736 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4737 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4736, i32 0, i32 3
%.tmp4738 = load i8*, i8** %.tmp4737
%.tmp4739 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4733, i8* %.tmp4735, i8* %.tmp4738)
br label %.if.end.4730
.if.false.4730:
br label %.if.end.4730
.if.end.4730:
%.tmp4740 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4663
%.tmp4741 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4740, i32 0, i32 5
%.tmp4742 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4741
store %m1861$.Scope.type* %.tmp4742, %m1861$.Scope.type** %s.4663
br label %.for.start.4717
.for.end.4717:
%.tmp4743 = load i1, i1* %found.4659
%.tmp4744 = icmp eq i1 %.tmp4743, 0
br i1 %.tmp4744, label %.if.true.4745, label %.if.false.4745
.if.true.4745:
%.tmp4746 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4747 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4749 = getelementptr [48 x i8], [48 x i8]*@.str4748, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4746, %m307$.Node.type* %.tmp4747, i8* %.tmp4749)
br label %.if.end.4745
.if.false.4745:
br label %.if.end.4745
.if.end.4745:
br label %.if.end.4716
.if.false.4716:
%.tmp4750 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4751 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4753 = getelementptr [29 x i8], [29 x i8]*@.str4752, i32 0, i32 0
%.tmp4754 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4750, %m307$.Node.type* %.tmp4751, i8* %.tmp4753)
%.tmp4755 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4756 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4755, i32 0, i32 6
%.tmp4757 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4756
%.tmp4758 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4757, i32 0, i32 1
%.tmp4759 = load i8*, i8** %.tmp4758
%.tmp4760 = call i32(i8*,...) @printf(i8* %.tmp4754, i8* %.tmp4759)
br label %.if.end.4716
.if.end.4716:
br label %.if.end.4673
.if.end.4673:
br label %.if.end.4655
.if.false.4655:
%.tmp4761 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4762 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4764 = getelementptr [34 x i8], [34 x i8]*@.str4763, i32 0, i32 0
%.tmp4765 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4761, %m307$.Node.type* %.tmp4762, i8* %.tmp4764)
%.tmp4766 = load i8*, i8** %expr_type.4497
%.tmp4767 = call i32(i8*,...) @printf(i8* %.tmp4765, i8* %.tmp4766)
br label %.if.end.4655
.if.end.4655:
br label %.if.end.4647
.if.end.4647:
br label %.if.end.4639
.if.end.4639:
br label %.if.end.4581
.if.end.4581:
br label %.if.end.4572
.if.end.4572:
br label %.if.end.4561
.if.end.4561:
br label %.if.end.4555
.if.end.4555:
br label %.if.end.4508
.if.end.4508:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4768 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4769 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4768)
%for_id.4770 = alloca i32
store i32 %.tmp4769, i32* %for_id.4770
%.tmp4771 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4772 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4771, i32 0, i32 6
%.tmp4773 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4772
%.tmp4774 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4773, i32 0, i32 7
%.tmp4775 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4774
%init_stmt.4776 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4775, %m307$.Node.type** %init_stmt.4776
%.tmp4777 = bitcast ptr null to i8*
%begin_lbl.4778 = alloca i8*
store i8* %.tmp4777, i8** %begin_lbl.4778
%.tmp4779 = bitcast ptr null to i8*
%end_lbl.4780 = alloca i8*
store i8* %.tmp4779, i8** %end_lbl.4780
%.tmp4781 = getelementptr i8*, i8** %begin_lbl.4778, i32 0
%.tmp4783 = getelementptr [14 x i8], [14 x i8]*@.str4782, i32 0, i32 0
%.tmp4784 = load i32, i32* %for_id.4770
%.tmp4785 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4781, i8* %.tmp4783, i32 %.tmp4784)
%.tmp4786 = getelementptr i8*, i8** %end_lbl.4780, i32 0
%.tmp4788 = getelementptr [12 x i8], [12 x i8]*@.str4787, i32 0, i32 0
%.tmp4789 = load i32, i32* %for_id.4770
%.tmp4790 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4786, i8* %.tmp4788, i32 %.tmp4789)
%.tmp4791 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4793 = getelementptr [4 x i8], [4 x i8]*@.str4792, i32 0, i32 0
%.tmp4794 = load i8*, i8** %begin_lbl.4778
%.tmp4795 = load i8*, i8** %end_lbl.4780
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp4791, i8* %.tmp4793, i8* %.tmp4794, i8* %.tmp4795)
%.tmp4796 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
%.tmp4797 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4796, i32 0, i32 0
%.tmp4798 = load i8*, i8** %.tmp4797
%.tmp4800 = getelementptr [12 x i8], [12 x i8]*@.str4799, i32 0, i32 0
%.tmp4801 = call i32(i8*,i8*) @strcmp(i8* %.tmp4798, i8* %.tmp4800)
%.tmp4802 = icmp eq i32 %.tmp4801, 0
br i1 %.tmp4802, label %.if.true.4803, label %.if.false.4803
.if.true.4803:
%.tmp4804 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4805 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
%.tmp4806 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4804, %m307$.Node.type* %.tmp4805)
br label %.if.end.4803
.if.false.4803:
%.tmp4807 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
%.tmp4808 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4807, i32 0, i32 0
%.tmp4809 = load i8*, i8** %.tmp4808
%.tmp4811 = getelementptr [11 x i8], [11 x i8]*@.str4810, i32 0, i32 0
%.tmp4812 = call i32(i8*,i8*) @strcmp(i8* %.tmp4809, i8* %.tmp4811)
%.tmp4813 = icmp eq i32 %.tmp4812, 0
br i1 %.tmp4813, label %.if.true.4814, label %.if.false.4814
.if.true.4814:
%.tmp4815 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4816 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4815, %m307$.Node.type* %.tmp4816)
br label %.if.end.4814
.if.false.4814:
%.tmp4817 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
%.tmp4818 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4817, i32 0, i32 0
%.tmp4819 = load i8*, i8** %.tmp4818
%.tmp4821 = getelementptr [9 x i8], [9 x i8]*@.str4820, i32 0, i32 0
%.tmp4822 = call i32(i8*,i8*) @strcmp(i8* %.tmp4819, i8* %.tmp4821)
%.tmp4823 = icmp eq i32 %.tmp4822, 0
br i1 %.tmp4823, label %.if.true.4824, label %.if.false.4824
.if.true.4824:
br label %.if.end.4824
.if.false.4824:
%.tmp4825 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4826 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
%.tmp4828 = getelementptr [66 x i8], [66 x i8]*@.str4827, i32 0, i32 0
%.tmp4829 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4825, %m307$.Node.type* %.tmp4826, i8* %.tmp4828)
%.tmp4830 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4776
%.tmp4831 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4830, i32 0, i32 0
%.tmp4832 = load i8*, i8** %.tmp4831
%.tmp4833 = call i32(i8*,...) @printf(i8* %.tmp4829, i8* %.tmp4832)
%.tmp4834 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4834)
ret void
br label %.if.end.4824
.if.end.4824:
br label %.if.end.4814
.if.end.4814:
br label %.if.end.4803
.if.end.4803:
%.tmp4835 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4836 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4835, i32 0, i32 1
%.tmp4837 = load %m0$.File.type*, %m0$.File.type** %.tmp4836
%.tmp4839 = getelementptr [26 x i8], [26 x i8]*@.str4838, i32 0, i32 0
%.tmp4840 = load i32, i32* %for_id.4770
%.tmp4841 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4837, i8* %.tmp4839, i32 %.tmp4840)
%.tmp4842 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4843 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4842, i32 0, i32 1
%.tmp4844 = load %m0$.File.type*, %m0$.File.type** %.tmp4843
%.tmp4846 = getelementptr [16 x i8], [16 x i8]*@.str4845, i32 0, i32 0
%.tmp4847 = load i32, i32* %for_id.4770
%.tmp4848 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4844, i8* %.tmp4846, i32 %.tmp4847)
%.tmp4849 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4850 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4849, i32 0, i32 6
%.tmp4851 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4850
%.tmp4853 = getelementptr [9 x i8], [9 x i8]*@.str4852, i32 0, i32 0
%.tmp4854 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4851, i8* %.tmp4853)
%fst_colon.4855 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4854, %m307$.Node.type** %fst_colon.4855
%.tmp4856 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4855
%.tmp4857 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4856, i32 0, i32 7
%.tmp4858 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4857
%condition.4859 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4858, %m307$.Node.type** %condition.4859
%.tmp4860 = load %m307$.Node.type*, %m307$.Node.type** %condition.4859
%.tmp4861 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4860, i32 0, i32 0
%.tmp4862 = load i8*, i8** %.tmp4861
%.tmp4864 = getelementptr [9 x i8], [9 x i8]*@.str4863, i32 0, i32 0
%.tmp4865 = call i32(i8*,i8*) @strcmp(i8* %.tmp4862, i8* %.tmp4864)
%.tmp4866 = icmp eq i32 %.tmp4865, 0
br i1 %.tmp4866, label %.if.true.4867, label %.if.false.4867
.if.true.4867:
%.tmp4868 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4869 = load %m307$.Node.type*, %m307$.Node.type** %condition.4859
%.tmp4871 = getelementptr [39 x i8], [39 x i8]*@.str4870, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4868, %m307$.Node.type* %.tmp4869, i8* %.tmp4871)
ret void
br label %.if.end.4867
.if.false.4867:
br label %.if.end.4867
.if.end.4867:
%.tmp4872 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4873 = load %m307$.Node.type*, %m307$.Node.type** %condition.4859
%.tmp4874 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4872, %m307$.Node.type* %.tmp4873)
%condition_info.4875 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4874, %m1861$.AssignableInfo.type** %condition_info.4875
%.tmp4876 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4877 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4876, i32 0, i32 1
%.tmp4878 = load %m0$.File.type*, %m0$.File.type** %.tmp4877
%.tmp4880 = getelementptr [48 x i8], [48 x i8]*@.str4879, i32 0, i32 0
%.tmp4881 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4882 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4875
%.tmp4883 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4882, i32 0, i32 3
%.tmp4884 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4883
%.tmp4885 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4881, %m1861$.Type.type* %.tmp4884)
%.tmp4886 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4875
%.tmp4887 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4886)
%.tmp4888 = load i32, i32* %for_id.4770
%.tmp4889 = load i8*, i8** %end_lbl.4780
%.tmp4890 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4878, i8* %.tmp4880, i8* %.tmp4885, i8* %.tmp4887, i32 %.tmp4888, i8* %.tmp4889)
%.tmp4891 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4892 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4891, i32 0, i32 1
%.tmp4893 = load %m0$.File.type*, %m0$.File.type** %.tmp4892
%.tmp4895 = getelementptr [19 x i8], [19 x i8]*@.str4894, i32 0, i32 0
%.tmp4896 = load i32, i32* %for_id.4770
%.tmp4897 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4893, i8* %.tmp4895, i32 %.tmp4896)
%.tmp4898 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4855
%.tmp4899 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4898, i32 0, i32 7
%.tmp4900 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4899
%.tmp4902 = getelementptr [9 x i8], [9 x i8]*@.str4901, i32 0, i32 0
%.tmp4903 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4900, i8* %.tmp4902)
%snd_colon.4904 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4903, %m307$.Node.type** %snd_colon.4904
%.tmp4905 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4904
%.tmp4906 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4905, i32 0, i32 7
%.tmp4907 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4906
%increment.4908 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4907, %m307$.Node.type** %increment.4908
%.tmp4909 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4904
%.tmp4911 = getelementptr [6 x i8], [6 x i8]*@.str4910, i32 0, i32 0
%.tmp4912 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4909, i8* %.tmp4911)
%for_body.4913 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4912, %m307$.Node.type** %for_body.4913
%.tmp4914 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4915 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4913
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4914, %m307$.Node.type* %.tmp4915)
%.tmp4916 = load %m307$.Node.type*, %m307$.Node.type** %increment.4908
%.tmp4917 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4913
%.tmp4918 = icmp ne %m307$.Node.type* %.tmp4916, %.tmp4917
br i1 %.tmp4918, label %.if.true.4919, label %.if.false.4919
.if.true.4919:
%.tmp4920 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4921 = load %m307$.Node.type*, %m307$.Node.type** %increment.4908
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4920, %m307$.Node.type* %.tmp4921)
br label %.if.end.4919
.if.false.4919:
br label %.if.end.4919
.if.end.4919:
%.tmp4922 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4923 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4922, i32 0, i32 1
%.tmp4924 = load %m0$.File.type*, %m0$.File.type** %.tmp4923
%.tmp4926 = getelementptr [15 x i8], [15 x i8]*@.str4925, i32 0, i32 0
%.tmp4927 = load i8*, i8** %begin_lbl.4778
%.tmp4928 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4924, i8* %.tmp4926, i8* %.tmp4927)
%.tmp4929 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4930 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4929, i32 0, i32 1
%.tmp4931 = load %m0$.File.type*, %m0$.File.type** %.tmp4930
%.tmp4933 = getelementptr [5 x i8], [5 x i8]*@.str4932, i32 0, i32 0
%.tmp4934 = load i8*, i8** %end_lbl.4780
%.tmp4935 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4931, i8* %.tmp4933, i8* %.tmp4934)
%.tmp4936 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4936)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4937 = bitcast ptr null to %m1861$.Type.type*
%decl_type.4938 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4937, %m1861$.Type.type** %decl_type.4938
%.tmp4939 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4940 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4939, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp4941 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4942 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4941, i32 0, i32 6
%.tmp4943 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4942
%.tmp4944 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4943, i32 0, i32 0
%.tmp4945 = load i8*, i8** %.tmp4944
%.tmp4947 = getelementptr [5 x i8], [5 x i8]*@.str4946, i32 0, i32 0
%.tmp4948 = call i32(i8*,i8*) @strcmp(i8* %.tmp4945, i8* %.tmp4947)
%.tmp4949 = icmp eq i32 %.tmp4948, 0
br i1 %.tmp4949, label %.if.true.4950, label %.if.false.4950
.if.true.4950:
%.tmp4951 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4952 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4953 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4952, i32 0, i32 6
%.tmp4954 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4953
%.tmp4955 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4954, i32 0, i32 6
%.tmp4956 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4955
%.tmp4957 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4951, %m307$.Node.type* %.tmp4956)
store %m1861$.Type.type* %.tmp4957, %m1861$.Type.type** %decl_type.4938
br label %.if.end.4950
.if.false.4950:
br label %.if.end.4950
.if.end.4950:
%.tmp4958 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4958, i32 0, i32 6
%.tmp4960 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4959
%.tmp4962 = getelementptr [11 x i8], [11 x i8]*@.str4961, i32 0, i32 0
%.tmp4963 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4960, i8* %.tmp4962)
%assignable.4964 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4963, %m307$.Node.type** %assignable.4964
%.tmp4965 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4964
%.tmp4966 = icmp ne %m307$.Node.type* %.tmp4965, null
br i1 %.tmp4966, label %.if.true.4967, label %.if.false.4967
.if.true.4967:
%.tmp4968 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4969 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4964
%.tmp4970 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4968, %m307$.Node.type* %.tmp4969)
store %m1861$.AssignableInfo.type* %.tmp4970, %m1861$.AssignableInfo.type** %a_info.4940
br label %.if.end.4967
.if.false.4967:
br label %.if.end.4967
.if.end.4967:
%.tmp4971 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4972 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4971)
%info.4973 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4972, %m1861$.AssignableInfo.type** %info.4973
%.tmp4974 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp4975 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4974, i32 0, i32 2
%.tmp4977 = getelementptr [9 x i8], [9 x i8]*@.str4976, i32 0, i32 0
store i8* %.tmp4977, i8** %.tmp4975
%.tmp4978 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4979 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4978, i32 0, i32 6
%.tmp4980 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4979
%.tmp4982 = getelementptr [5 x i8], [5 x i8]*@.str4981, i32 0, i32 0
%.tmp4983 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4980, i8* %.tmp4982)
%var_name.4984 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4983, %m307$.Node.type** %var_name.4984
%.tmp4985 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4984
%.tmp4986 = icmp eq %m307$.Node.type* %.tmp4985, null
br i1 %.tmp4986, label %.if.true.4987, label %.if.false.4987
.if.true.4987:
%.tmp4988 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4989 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4991 = getelementptr [31 x i8], [31 x i8]*@.str4990, i32 0, i32 0
%.tmp4992 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4988, %m307$.Node.type* %.tmp4989, i8* %.tmp4991)
%.tmp4993 = call i32(i8*,...) @printf(i8* %.tmp4992)
%.tmp4994 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4994
br label %.if.end.4987
.if.false.4987:
br label %.if.end.4987
.if.end.4987:
%.tmp4995 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4996 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4995)
%mod.4997 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4996, %m1861$.ModuleLookup.type** %mod.4997
%.tmp4998 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4999 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4997
%.tmp5000 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4999, i32 0, i32 3
%.tmp5001 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5000
%.tmp5002 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4984
%.tmp5003 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5002, i32 0, i32 1
%.tmp5004 = load i8*, i8** %.tmp5003
%.tmp5005 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp4998, %m1861$.Scope.type* %.tmp5001, i8* %.tmp5004)
%.tmp5006 = icmp ne %m1861$.ScopeItem.type* %.tmp5005, null
br i1 %.tmp5006, label %.if.true.5007, label %.if.false.5007
.if.true.5007:
%err_buf.5008 = alloca i8*
store i8* null, i8** %err_buf.5008
%.tmp5009 = getelementptr i8*, i8** %err_buf.5008, i32 0
%.tmp5011 = getelementptr [43 x i8], [43 x i8]*@.str5010, i32 0, i32 0
%.tmp5012 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4984
%.tmp5013 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5012, i32 0, i32 1
%.tmp5014 = load i8*, i8** %.tmp5013
%.tmp5015 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5009, i8* %.tmp5011, i8* %.tmp5014)
%.tmp5016 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5017 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5018 = load i8*, i8** %err_buf.5008
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5016, %m307$.Node.type* %.tmp5017, i8* %.tmp5018)
%.tmp5019 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5019
br label %.if.end.5007
.if.false.5007:
br label %.if.end.5007
.if.end.5007:
%var_id.5020 = alloca i8*
store i8* null, i8** %var_id.5020
%.tmp5021 = getelementptr i8*, i8** %var_id.5020, i32 0
%.tmp5023 = getelementptr [6 x i8], [6 x i8]*@.str5022, i32 0, i32 0
%.tmp5024 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4984
%.tmp5025 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5024, i32 0, i32 1
%.tmp5026 = load i8*, i8** %.tmp5025
%.tmp5027 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5028 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5027)
%.tmp5029 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5021, i8* %.tmp5023, i8* %.tmp5026, i32 %.tmp5028)
%.tmp5030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp5031 = load i8, i8* @SCOPE_LOCAL
%.tmp5032 = load i8*, i8** %var_id.5020
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5030, i8 %.tmp5031, i8* %.tmp5032)
%.tmp5033 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4938
%.tmp5034 = icmp ne %m1861$.Type.type* %.tmp5033, null
br i1 %.tmp5034, label %.if.true.5035, label %.if.false.5035
.if.true.5035:
%.tmp5036 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp5037 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5036, i32 0, i32 3
%.tmp5038 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4938
store %m1861$.Type.type* %.tmp5038, %m1861$.Type.type** %.tmp5037
br label %.if.end.5035
.if.false.5035:
%.tmp5039 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5040 = icmp ne %m1861$.AssignableInfo.type* %.tmp5039, null
br i1 %.tmp5040, label %.if.true.5041, label %.if.false.5041
.if.true.5041:
%.tmp5042 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp5043 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5042, i32 0, i32 3
%.tmp5044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5045 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5044, i32 0, i32 3
%.tmp5046 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5045
store %m1861$.Type.type* %.tmp5046, %m1861$.Type.type** %.tmp5043
br label %.if.end.5041
.if.false.5041:
br label %.if.end.5041
.if.end.5041:
br label %.if.end.5035
.if.end.5035:
%.tmp5047 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5048 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp5049 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5048, i32 0, i32 3
%.tmp5050 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5049
%.tmp5051 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5047, %m1861$.Type.type* %.tmp5050)
%var_type_repr.5052 = alloca i8*
store i8* %.tmp5051, i8** %var_type_repr.5052
%.tmp5053 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5054 = icmp ne %m1861$.AssignableInfo.type* %.tmp5053, null
br i1 %.tmp5054, label %.if.true.5055, label %.if.false.5055
.if.true.5055:
%.tmp5056 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5058 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5057, i32 0, i32 3
%.tmp5059 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5058
%.tmp5060 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5056, %m1861$.Type.type* %.tmp5059)
%a_type_repr.5061 = alloca i8*
store i8* %.tmp5060, i8** %a_type_repr.5061
%type_error.5062 = alloca i1
store i1 0, i1* %type_error.5062
%.tmp5063 = load i8*, i8** %a_type_repr.5061
%.tmp5064 = call i32(i8*) @strlen(i8* %.tmp5063)
%.tmp5065 = load i8*, i8** %var_type_repr.5052
%.tmp5066 = call i32(i8*) @strlen(i8* %.tmp5065)
%.tmp5067 = icmp ne i32 %.tmp5064, %.tmp5066
br i1 %.tmp5067, label %.if.true.5068, label %.if.false.5068
.if.true.5068:
store i1 1, i1* %type_error.5062
br label %.if.end.5068
.if.false.5068:
%.tmp5069 = load i8*, i8** %a_type_repr.5061
%.tmp5070 = load i8*, i8** %var_type_repr.5052
%.tmp5071 = call i32(i8*,i8*) @strcmp(i8* %.tmp5069, i8* %.tmp5070)
%.tmp5072 = icmp ne i32 %.tmp5071, 0
br i1 %.tmp5072, label %.if.true.5073, label %.if.false.5073
.if.true.5073:
store i1 1, i1* %type_error.5062
br label %.if.end.5073
.if.false.5073:
br label %.if.end.5073
.if.end.5073:
br label %.if.end.5068
.if.end.5068:
%.tmp5074 = load i1, i1* %type_error.5062
br i1 %.tmp5074, label %.if.true.5075, label %.if.false.5075
.if.true.5075:
%.tmp5076 = bitcast ptr null to i8*
%err_msg.5077 = alloca i8*
store i8* %.tmp5076, i8** %err_msg.5077
%.tmp5078 = getelementptr i8*, i8** %err_msg.5077, i32 0
%.tmp5080 = getelementptr [49 x i8], [49 x i8]*@.str5079, i32 0, i32 0
%.tmp5081 = load i8*, i8** %a_type_repr.5061
%.tmp5082 = load i8*, i8** %var_type_repr.5052
%.tmp5083 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5078, i8* %.tmp5080, i8* %.tmp5081, i8* %.tmp5082)
%.tmp5084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5085 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5086 = load i8*, i8** %err_msg.5077
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5084, %m307$.Node.type* %.tmp5085, i8* %.tmp5086)
br label %.if.end.5075
.if.false.5075:
br label %.if.end.5075
.if.end.5075:
br label %.if.end.5055
.if.false.5055:
br label %.if.end.5055
.if.end.5055:
%.tmp5087 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5088 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4984
%.tmp5089 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5088, i32 0, i32 1
%.tmp5090 = load i8*, i8** %.tmp5089
%.tmp5091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5087, i8* %.tmp5090, %m1861$.AssignableInfo.type* %.tmp5091)
%.tmp5092 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5093 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5092, i32 0, i32 1
%.tmp5094 = load %m0$.File.type*, %m0$.File.type** %.tmp5093
%.tmp5096 = getelementptr [16 x i8], [16 x i8]*@.str5095, i32 0, i32 0
%.tmp5097 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp5098 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5097)
%.tmp5099 = load i8*, i8** %var_type_repr.5052
%.tmp5100 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5094, i8* %.tmp5096, i8* %.tmp5098, i8* %.tmp5099)
%.tmp5101 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5102 = icmp ne %m1861$.AssignableInfo.type* %.tmp5101, null
br i1 %.tmp5102, label %.if.true.5103, label %.if.false.5103
.if.true.5103:
%.tmp5104 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5105 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5104, i32 0, i32 1
%.tmp5106 = load %m0$.File.type*, %m0$.File.type** %.tmp5105
%.tmp5108 = getelementptr [21 x i8], [21 x i8]*@.str5107, i32 0, i32 0
%.tmp5109 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5110 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5111 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5110, i32 0, i32 3
%.tmp5112 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5111
%.tmp5113 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5109, %m1861$.Type.type* %.tmp5112)
%.tmp5114 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4940
%.tmp5115 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5114)
%.tmp5116 = load i8*, i8** %var_type_repr.5052
%.tmp5117 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
%.tmp5118 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5117)
%.tmp5119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5106, i8* %.tmp5108, i8* %.tmp5113, i8* %.tmp5115, i8* %.tmp5116, i8* %.tmp5118)
br label %.if.end.5103
.if.false.5103:
%.tmp5120 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5121 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5122 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5120, %m307$.Node.type* %.tmp5121, %m1861$.AssignableInfo.type* %.tmp5122)
br label %.if.end.5103
.if.end.5103:
%.tmp5123 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4973
ret %m1861$.AssignableInfo.type* %.tmp5123
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5124 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5125 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5124, i32 0, i32 3
%.tmp5126 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5125
%.tmp5127 = icmp eq %m1861$.Type.type* %.tmp5126, null
br i1 %.tmp5127, label %.if.true.5128, label %.if.false.5128
.if.true.5128:
ret void
br label %.if.end.5128
.if.false.5128:
br label %.if.end.5128
.if.end.5128:
%.tmp5129 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5130 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5131 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5130, i32 0, i32 3
%.tmp5132 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5131
%.tmp5133 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5129, %m1861$.Type.type* %.tmp5132)
%t_repr.5134 = alloca i8*
store i8* %.tmp5133, i8** %t_repr.5134
%.tmp5135 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5136 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5135)
%id.5137 = alloca i8*
store i8* %.tmp5136, i8** %id.5137
%field_id.5138 = alloca i32
store i32 0, i32* %field_id.5138
%field.5139 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5139
%field_info.5140 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5141 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5142 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5141, i32 0, i32 3
%.tmp5143 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5142
%t.5144 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5143, %m1861$.Type.type** %t.5144
%.tmp5145 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5146 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5145, i32 0, i32 0
%.tmp5147 = load i8*, i8** %.tmp5146
%.tmp5149 = getelementptr [4 x i8], [4 x i8]*@.str5148, i32 0, i32 0
%.tmp5150 = call i32(i8*,i8*) @strcmp(i8* %.tmp5147, i8* %.tmp5149)
%.tmp5151 = icmp eq i32 %.tmp5150, 0
%.tmp5152 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5153 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5152, i32 0, i32 0
%.tmp5154 = load i8*, i8** %.tmp5153
%.tmp5156 = getelementptr [4 x i8], [4 x i8]*@.str5155, i32 0, i32 0
%.tmp5157 = call i32(i8*,i8*) @strcmp(i8* %.tmp5154, i8* %.tmp5156)
%.tmp5158 = icmp eq i32 %.tmp5157, 0
%.tmp5159 = or i1 %.tmp5151, %.tmp5158
%.tmp5160 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5161 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5160, i32 0, i32 0
%.tmp5162 = load i8*, i8** %.tmp5161
%.tmp5164 = getelementptr [5 x i8], [5 x i8]*@.str5163, i32 0, i32 0
%.tmp5165 = call i32(i8*,i8*) @strcmp(i8* %.tmp5162, i8* %.tmp5164)
%.tmp5166 = icmp eq i32 %.tmp5165, 0
%.tmp5167 = or i1 %.tmp5159, %.tmp5166
br i1 %.tmp5167, label %.if.true.5168, label %.if.false.5168
.if.true.5168:
%.tmp5169 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5170 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5169, i32 0, i32 1
%.tmp5171 = load %m0$.File.type*, %m0$.File.type** %.tmp5170
%.tmp5173 = getelementptr [21 x i8], [21 x i8]*@.str5172, i32 0, i32 0
%.tmp5174 = load i8*, i8** %t_repr.5134
%.tmp5175 = load i8*, i8** %t_repr.5134
%.tmp5176 = load i8*, i8** %id.5137
%.tmp5177 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5171, i8* %.tmp5173, i8* %.tmp5174, i32 0, i8* %.tmp5175, i8* %.tmp5176)
br label %.if.end.5168
.if.false.5168:
%.tmp5178 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5179 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5178, i32 0, i32 0
%.tmp5180 = load i8*, i8** %.tmp5179
%.tmp5182 = getelementptr [4 x i8], [4 x i8]*@.str5181, i32 0, i32 0
%.tmp5183 = call i32(i8*,i8*) @strcmp(i8* %.tmp5180, i8* %.tmp5182)
%.tmp5184 = icmp eq i32 %.tmp5183, 0
br i1 %.tmp5184, label %.if.true.5185, label %.if.false.5185
.if.true.5185:
%.tmp5186 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5187 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5186, i32 0, i32 1
%.tmp5188 = load %m0$.File.type*, %m0$.File.type** %.tmp5187
%.tmp5190 = getelementptr [21 x i8], [21 x i8]*@.str5189, i32 0, i32 0
%.tmp5191 = load i8*, i8** %t_repr.5134
%.tmp5193 = getelementptr [5 x i8], [5 x i8]*@.str5192, i32 0, i32 0
%.tmp5194 = load i8*, i8** %t_repr.5134
%.tmp5195 = load i8*, i8** %id.5137
%.tmp5196 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5188, i8* %.tmp5190, i8* %.tmp5191, i8* %.tmp5193, i8* %.tmp5194, i8* %.tmp5195)
br label %.if.end.5185
.if.false.5185:
%.tmp5197 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5198 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5197, i32 0, i32 0
%.tmp5199 = load i8*, i8** %.tmp5198
%.tmp5201 = getelementptr [7 x i8], [7 x i8]*@.str5200, i32 0, i32 0
%.tmp5202 = call i32(i8*,i8*) @strcmp(i8* %.tmp5199, i8* %.tmp5201)
%.tmp5203 = icmp eq i32 %.tmp5202, 0
br i1 %.tmp5203, label %.if.true.5204, label %.if.false.5204
.if.true.5204:
%.tmp5206 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5207 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5206, i32 0, i32 3
%.tmp5208 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5207
store %m1861$.Type.type* %.tmp5208, %m1861$.Type.type** %field.5139
br label %.for.start.5205
.for.start.5205:
%.tmp5209 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5139
%.tmp5210 = icmp ne %m1861$.Type.type* %.tmp5209, null
br i1 %.tmp5210, label %.for.continue.5205, label %.for.end.5205
.for.continue.5205:
%.tmp5211 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5212 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5211)
store %m1861$.AssignableInfo.type* %.tmp5212, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5213 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5214 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5213, %m1861$.AssignableInfo.type* %.tmp5214)
%.tmp5215 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5216 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5215, i32 0, i32 3
%.tmp5217 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5139
store %m1861$.Type.type* %.tmp5217, %m1861$.Type.type** %.tmp5216
%.tmp5218 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5219 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5218, i32 0, i32 1
%.tmp5220 = load %m0$.File.type*, %m0$.File.type** %.tmp5219
%.tmp5222 = getelementptr [46 x i8], [46 x i8]*@.str5221, i32 0, i32 0
%.tmp5223 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5224 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5223)
%.tmp5225 = load i8*, i8** %t_repr.5134
%.tmp5226 = load i8*, i8** %t_repr.5134
%.tmp5227 = load i8*, i8** %id.5137
%.tmp5228 = load i32, i32* %field_id.5138
%.tmp5229 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5220, i8* %.tmp5222, i8* %.tmp5224, i8* %.tmp5225, i8* %.tmp5226, i8* %.tmp5227, i32 %.tmp5228)
%.tmp5230 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5231 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5232 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5230, %m307$.Node.type* %.tmp5231, %m1861$.AssignableInfo.type* %.tmp5232)
%.tmp5233 = load i32, i32* %field_id.5138
%.tmp5234 = add i32 %.tmp5233, 1
store i32 %.tmp5234, i32* %field_id.5138
%.tmp5235 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5139
%.tmp5236 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5235, i32 0, i32 4
%.tmp5237 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5236
store %m1861$.Type.type* %.tmp5237, %m1861$.Type.type** %field.5139
br label %.for.start.5205
.for.end.5205:
br label %.if.end.5204
.if.false.5204:
%.tmp5238 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5239 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5238, i32 0, i32 0
%.tmp5240 = load i8*, i8** %.tmp5239
%.tmp5242 = getelementptr [10 x i8], [10 x i8]*@.str5241, i32 0, i32 0
%.tmp5243 = call i32(i8*,i8*) @strcmp(i8* %.tmp5240, i8* %.tmp5242)
%.tmp5244 = icmp eq i32 %.tmp5243, 0
br i1 %.tmp5244, label %.if.true.5245, label %.if.false.5245
.if.true.5245:
%.tmp5247 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5144
%.tmp5248 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5247, i32 0, i32 3
%.tmp5249 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5248
%.tmp5250 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5249, i32 0, i32 3
%.tmp5251 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5250
store %m1861$.Type.type* %.tmp5251, %m1861$.Type.type** %field.5139
br label %.for.start.5246
.for.start.5246:
%.tmp5252 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5139
%.tmp5253 = icmp ne %m1861$.Type.type* %.tmp5252, null
br i1 %.tmp5253, label %.for.continue.5246, label %.for.end.5246
.for.continue.5246:
%.tmp5254 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5255 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5254)
store %m1861$.AssignableInfo.type* %.tmp5255, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5256 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5257 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5256, %m1861$.AssignableInfo.type* %.tmp5257)
%.tmp5258 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5259 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5258, i32 0, i32 3
%.tmp5260 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5139
store %m1861$.Type.type* %.tmp5260, %m1861$.Type.type** %.tmp5259
%.tmp5261 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5262 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5261, i32 0, i32 1
%.tmp5263 = load %m0$.File.type*, %m0$.File.type** %.tmp5262
%.tmp5265 = getelementptr [46 x i8], [46 x i8]*@.str5264, i32 0, i32 0
%.tmp5266 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
%.tmp5267 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5266)
%.tmp5268 = load i8*, i8** %t_repr.5134
%.tmp5269 = load i8*, i8** %t_repr.5134
%.tmp5270 = load i8*, i8** %id.5137
%.tmp5271 = load i32, i32* %field_id.5138
%.tmp5272 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5263, i8* %.tmp5265, i8* %.tmp5267, i8* %.tmp5268, i8* %.tmp5269, i8* %.tmp5270, i32 %.tmp5271)
%.tmp5273 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5274 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5140
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5273, %m307$.Node.type* %.tmp5274, %m1861$.AssignableInfo.type* %.tmp5275)
%.tmp5276 = load i32, i32* %field_id.5138
%.tmp5277 = add i32 %.tmp5276, 1
store i32 %.tmp5277, i32* %field_id.5138
%.tmp5278 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5139
%.tmp5279 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5278, i32 0, i32 4
%.tmp5280 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5279
store %m1861$.Type.type* %.tmp5280, %m1861$.Type.type** %field.5139
br label %.for.start.5246
.for.end.5246:
br label %.if.end.5245
.if.false.5245:
%.tmp5281 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5282 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5284 = getelementptr [44 x i8], [44 x i8]*@.str5283, i32 0, i32 0
%.tmp5285 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5281, %m307$.Node.type* %.tmp5282, i8* %.tmp5284)
%.tmp5286 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5287 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5286, i32 0, i32 3
%.tmp5288 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5287
%.tmp5289 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5288, i32 0, i32 0
%.tmp5290 = load i8*, i8** %.tmp5289
%.tmp5291 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5292 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5293 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5292, i32 0, i32 3
%.tmp5294 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5293
%.tmp5295 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5291, %m1861$.Type.type* %.tmp5294)
%.tmp5296 = call i32(i8*,...) @printf(i8* %.tmp5285, i8* %.tmp5290, i8* %.tmp5295)
ret void
br label %.if.end.5245
.if.end.5245:
br label %.if.end.5204
.if.end.5204:
br label %.if.end.5185
.if.end.5185:
br label %.if.end.5168
.if.end.5168:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5297 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5298 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5297, i32 0, i32 6
%.tmp5299 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5298
%.tmp5301 = getelementptr [11 x i8], [11 x i8]*@.str5300, i32 0, i32 0
%.tmp5302 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5299, i8* %.tmp5301)
%assignable.5303 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5302, %m307$.Node.type** %assignable.5303
%.tmp5304 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5305 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5303
%.tmp5306 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5304, %m307$.Node.type* %.tmp5305)
%a_info.5307 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5306, %m1861$.AssignableInfo.type** %a_info.5307
%.tmp5308 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5307
%.tmp5309 = icmp eq %m1861$.AssignableInfo.type* %.tmp5308, null
br i1 %.tmp5309, label %.if.true.5310, label %.if.false.5310
.if.true.5310:
ret void
br label %.if.end.5310
.if.false.5310:
br label %.if.end.5310
.if.end.5310:
%.tmp5311 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5312 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5311)
%if_id.5313 = alloca i32
store i32 %.tmp5312, i32* %if_id.5313
%.tmp5314 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5315 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5314, i32 0, i32 1
%.tmp5316 = load %m0$.File.type*, %m0$.File.type** %.tmp5315
%.tmp5318 = getelementptr [53 x i8], [53 x i8]*@.str5317, i32 0, i32 0
%.tmp5319 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5320 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5307
%.tmp5321 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5320, i32 0, i32 3
%.tmp5322 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5321
%.tmp5323 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5319, %m1861$.Type.type* %.tmp5322)
%.tmp5324 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5307
%.tmp5325 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5324)
%.tmp5326 = load i32, i32* %if_id.5313
%.tmp5327 = load i32, i32* %if_id.5313
%.tmp5328 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5316, i8* %.tmp5318, i8* %.tmp5323, i8* %.tmp5325, i32 %.tmp5326, i32 %.tmp5327)
%.tmp5329 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5330 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5329, i32 0, i32 1
%.tmp5331 = load %m0$.File.type*, %m0$.File.type** %.tmp5330
%.tmp5333 = getelementptr [14 x i8], [14 x i8]*@.str5332, i32 0, i32 0
%.tmp5334 = load i32, i32* %if_id.5313
%.tmp5335 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5331, i8* %.tmp5333, i32 %.tmp5334)
%.tmp5336 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5337 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5336, i32 0, i32 6
%.tmp5338 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5337
%.tmp5340 = getelementptr [6 x i8], [6 x i8]*@.str5339, i32 0, i32 0
%.tmp5341 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5338, i8* %.tmp5340)
%block.5342 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5341, %m307$.Node.type** %block.5342
%.tmp5343 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5344 = load %m307$.Node.type*, %m307$.Node.type** %block.5342
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5343, %m307$.Node.type* %.tmp5344)
%.tmp5345 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5346 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5345, i32 0, i32 1
%.tmp5347 = load %m0$.File.type*, %m0$.File.type** %.tmp5346
%.tmp5349 = getelementptr [23 x i8], [23 x i8]*@.str5348, i32 0, i32 0
%.tmp5350 = load i32, i32* %if_id.5313
%.tmp5351 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5347, i8* %.tmp5349, i32 %.tmp5350)
%.tmp5352 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5353 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5352, i32 0, i32 1
%.tmp5354 = load %m0$.File.type*, %m0$.File.type** %.tmp5353
%.tmp5356 = getelementptr [15 x i8], [15 x i8]*@.str5355, i32 0, i32 0
%.tmp5357 = load i32, i32* %if_id.5313
%.tmp5358 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5354, i8* %.tmp5356, i32 %.tmp5357)
%.tmp5359 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5360 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5359, i32 0, i32 6
%.tmp5361 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5360
%.tmp5363 = getelementptr [11 x i8], [11 x i8]*@.str5362, i32 0, i32 0
%.tmp5364 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5361, i8* %.tmp5363)
%else_block.5365 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5364, %m307$.Node.type** %else_block.5365
%.tmp5366 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5365
%.tmp5367 = icmp ne %m307$.Node.type* %.tmp5366, null
br i1 %.tmp5367, label %.if.true.5368, label %.if.false.5368
.if.true.5368:
%.tmp5369 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5365
%.tmp5370 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5369, i32 0, i32 6
%.tmp5371 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5370
%.tmp5372 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5371, i32 0, i32 0
%.tmp5373 = load i8*, i8** %.tmp5372
%.tmp5375 = getelementptr [11 x i8], [11 x i8]*@.str5374, i32 0, i32 0
%.tmp5376 = call i32(i8*,i8*) @strcmp(i8* %.tmp5373, i8* %.tmp5375)
%.tmp5377 = icmp eq i32 %.tmp5376, 0
br i1 %.tmp5377, label %.if.true.5378, label %.if.false.5378
.if.true.5378:
%.tmp5379 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5365
%.tmp5380 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5379, i32 0, i32 6
%.tmp5381 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5380
%.tmp5382 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5381, i32 0, i32 6
%.tmp5383 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5382
%.tmp5385 = getelementptr [6 x i8], [6 x i8]*@.str5384, i32 0, i32 0
%.tmp5386 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5383, i8* %.tmp5385)
store %m307$.Node.type* %.tmp5386, %m307$.Node.type** %block.5342
%.tmp5387 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5388 = load %m307$.Node.type*, %m307$.Node.type** %block.5342
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5387, %m307$.Node.type* %.tmp5388)
br label %.if.end.5378
.if.false.5378:
%.tmp5389 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5390 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5365
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5389, %m307$.Node.type* %.tmp5390)
br label %.if.end.5378
.if.end.5378:
br label %.if.end.5368
.if.false.5368:
br label %.if.end.5368
.if.end.5368:
%.tmp5391 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5392 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5391, i32 0, i32 1
%.tmp5393 = load %m0$.File.type*, %m0$.File.type** %.tmp5392
%.tmp5395 = getelementptr [23 x i8], [23 x i8]*@.str5394, i32 0, i32 0
%.tmp5396 = load i32, i32* %if_id.5313
%.tmp5397 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5393, i8* %.tmp5395, i32 %.tmp5396)
%.tmp5398 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5399 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5398, i32 0, i32 1
%.tmp5400 = load %m0$.File.type*, %m0$.File.type** %.tmp5399
%.tmp5402 = getelementptr [13 x i8], [13 x i8]*@.str5401, i32 0, i32 0
%.tmp5403 = load i32, i32* %if_id.5313
%.tmp5404 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5400, i8* %.tmp5402, i32 %.tmp5403)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5405 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5406 = icmp ne %m307$.Node.type* %.tmp5405, null
br i1 %.tmp5406, label %.if.true.5407, label %.if.false.5407
.if.true.5407:
%.tmp5408 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5409 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5408, i32 0, i32 7
%.tmp5410 = load i8*, i8** %.tmp5409
%.tmp5411 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5412 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5411, i32 0, i32 3
%.tmp5413 = load i32, i32* %.tmp5412
%.tmp5414 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5415 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5414, i32 0, i32 4
%.tmp5416 = load i32, i32* %.tmp5415
%.tmp5417 = load i8*, i8** %msg
%.tmp5418 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5410, i32 %.tmp5413, i32 %.tmp5416, i8* %.tmp5417)
%err.5419 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5418, %m751$.Error.type** %err.5419
%.tmp5420 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5421 = load %m751$.Error.type*, %m751$.Error.type** %err.5419
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5420, %m751$.Error.type* %.tmp5421)
br label %.if.end.5407
.if.false.5407:
%.tmp5423 = getelementptr [61 x i8], [61 x i8]*@.str5422, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5423)
br label %.if.end.5407
.if.end.5407:
ret void
}
define void @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5424 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5425 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5424)
%mod.5426 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5425, %m1861$.ModuleLookup.type** %mod.5426
%.tmp5427 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5426
%.tmp5428 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5427, i32 0, i32 3
%.tmp5429 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5428
%.tmp5430 = icmp ne %m1861$.Scope.type* %.tmp5429, null
%.tmp5432 = getelementptr [82 x i8], [82 x i8]*@.str5431, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5430, i8* %.tmp5432)
%.tmp5433 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5426
%.tmp5434 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5433, i32 0, i32 3
%.tmp5435 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5434
%current_scope.5436 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5435, %m1861$.Scope.type** %current_scope.5436
%.tmp5437 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5438 = ptrtoint %m1861$.ScopeItem.type* %.tmp5437 to i32
%.tmp5439 = call i8*(i32) @malloc(i32 %.tmp5438)
%.tmp5440 = bitcast i8* %.tmp5439 to %m1861$.ScopeItem.type*
%newitem.5441 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5440, %m1861$.ScopeItem.type** %newitem.5441
%.tmp5442 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5441
%.tmp5443 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5442, i32 0, i32 0
%.tmp5444 = load i8*, i8** %name
store i8* %.tmp5444, i8** %.tmp5443
%.tmp5445 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5441
%.tmp5446 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5445, i32 0, i32 1
%.tmp5447 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5447, %m1861$.AssignableInfo.type** %.tmp5446
%.tmp5448 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5441
%.tmp5449 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5448, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5449
%.tmp5450 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5436
%.tmp5451 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5450, i32 0, i32 1
%.tmp5452 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5451
%.tmp5453 = icmp eq %m1861$.ScopeItem.type* %.tmp5452, null
br i1 %.tmp5453, label %.if.true.5454, label %.if.false.5454
.if.true.5454:
%.tmp5455 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5436
%.tmp5456 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5455, i32 0, i32 1
%.tmp5457 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5441
store %m1861$.ScopeItem.type* %.tmp5457, %m1861$.ScopeItem.type** %.tmp5456
ret void
br label %.if.end.5454
.if.false.5454:
br label %.if.end.5454
.if.end.5454:
%.tmp5458 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5436
%.tmp5459 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5458, i32 0, i32 1
%.tmp5460 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5459
%last_item.5461 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5460, %m1861$.ScopeItem.type** %last_item.5461
br label %.for.start.5462
.for.start.5462:
%.tmp5463 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5461
%.tmp5464 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5463, i32 0, i32 2
%.tmp5465 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5464
%.tmp5466 = icmp ne %m1861$.ScopeItem.type* %.tmp5465, null
br i1 %.tmp5466, label %.for.continue.5462, label %.for.end.5462
.for.continue.5462:
%.tmp5467 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5461
%.tmp5468 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5467, i32 0, i32 2
%.tmp5469 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5468
store %m1861$.ScopeItem.type* %.tmp5469, %m1861$.ScopeItem.type** %last_item.5461
br label %.for.start.5462
.for.end.5462:
%.tmp5470 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5461
%.tmp5471 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5470, i32 0, i32 2
%.tmp5472 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5441
store %m1861$.ScopeItem.type* %.tmp5472, %m1861$.ScopeItem.type** %.tmp5471
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5473 = alloca i8*
store i8* null, i8** %err_buf.5473
%.tmp5474 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5475 = load i8*, i8** %module
%.tmp5476 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5477 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5476, i32 0, i32 1
%.tmp5478 = load i8*, i8** %.tmp5477
%.tmp5479 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5474, i8* %.tmp5475, i8* %.tmp5478)
%found.5480 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5479, %m1861$.ScopeItem.type** %found.5480
%.tmp5481 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5480
%.tmp5482 = icmp eq %m1861$.ScopeItem.type* %.tmp5481, null
br i1 %.tmp5482, label %.if.true.5483, label %.if.false.5483
.if.true.5483:
%.tmp5484 = getelementptr i8*, i8** %err_buf.5473, i32 0
%.tmp5486 = getelementptr [31 x i8], [31 x i8]*@.str5485, i32 0, i32 0
%.tmp5487 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5488 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5487, i32 0, i32 1
%.tmp5489 = load i8*, i8** %.tmp5488
%.tmp5490 = load i8*, i8** %module
%.tmp5491 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5484, i8* %.tmp5486, i8* %.tmp5489, i8* %.tmp5490)
%.tmp5492 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5493 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5494 = load i8*, i8** %err_buf.5473
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5492, %m307$.Node.type* %.tmp5493, i8* %.tmp5494)
%.tmp5495 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5495
br label %.if.end.5483
.if.false.5483:
br label %.if.end.5483
.if.end.5483:
br label %.for.start.5496
.for.start.5496:
%.tmp5497 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5498 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5497, i32 0, i32 7
%.tmp5499 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5498
%.tmp5500 = icmp ne %m307$.Node.type* %.tmp5499, null
%.tmp5501 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5480
%.tmp5502 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5501, i32 0, i32 1
%.tmp5503 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5502
%.tmp5504 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5503, i32 0, i32 2
%.tmp5505 = load i8*, i8** %.tmp5504
%.tmp5507 = getelementptr [7 x i8], [7 x i8]*@.str5506, i32 0, i32 0
%.tmp5508 = call i32(i8*,i8*) @strcmp(i8* %.tmp5505, i8* %.tmp5507)
%.tmp5509 = icmp eq i32 %.tmp5508, 0
%.tmp5510 = and i1 %.tmp5500, %.tmp5509
br i1 %.tmp5510, label %.for.continue.5496, label %.for.end.5496
.for.continue.5496:
%.tmp5511 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5512 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5480
%.tmp5513 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5512, i32 0, i32 1
%.tmp5514 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5513
%.tmp5515 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5514, i32 0, i32 0
%.tmp5516 = load i8*, i8** %.tmp5515
%.tmp5517 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5518 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5517, i32 0, i32 7
%.tmp5519 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5518
%.tmp5520 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5519, i32 0, i32 7
%.tmp5521 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5520
%.tmp5522 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5511, i8* %.tmp5516, %m307$.Node.type* %.tmp5521)
store %m1861$.ScopeItem.type* %.tmp5522, %m1861$.ScopeItem.type** %found.5480
%.tmp5523 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5480
%.tmp5524 = icmp eq %m1861$.ScopeItem.type* %.tmp5523, null
br i1 %.tmp5524, label %.if.true.5525, label %.if.false.5525
.if.true.5525:
%.tmp5526 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5526
br label %.if.end.5525
.if.false.5525:
br label %.if.end.5525
.if.end.5525:
br label %.for.start.5496
.for.end.5496:
%.tmp5527 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5480
ret %m1861$.ScopeItem.type* %.tmp5527
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5528 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5529 = icmp eq %m1861$.Scope.type* %.tmp5528, null
br i1 %.tmp5529, label %.if.true.5530, label %.if.false.5530
.if.true.5530:
%.tmp5531 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5531
br label %.if.end.5530
.if.false.5530:
br label %.if.end.5530
.if.end.5530:
%.tmp5533 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5534 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5533, i32 0, i32 1
%.tmp5535 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5534
%item.5536 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5535, %m1861$.ScopeItem.type** %item.5536
br label %.for.start.5532
.for.start.5532:
%.tmp5537 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5536
%.tmp5538 = icmp ne %m1861$.ScopeItem.type* %.tmp5537, null
br i1 %.tmp5538, label %.for.continue.5532, label %.for.end.5532
.for.continue.5532:
%.tmp5539 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5536
%.tmp5540 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5539, i32 0, i32 0
%.tmp5541 = load i8*, i8** %.tmp5540
%.tmp5542 = load i8*, i8** %name
%.tmp5543 = call i32(i8*,i8*) @strcmp(i8* %.tmp5541, i8* %.tmp5542)
%.tmp5544 = icmp eq i32 %.tmp5543, 0
br i1 %.tmp5544, label %.if.true.5545, label %.if.false.5545
.if.true.5545:
%.tmp5546 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5536
ret %m1861$.ScopeItem.type* %.tmp5546
br label %.if.end.5545
.if.false.5545:
br label %.if.end.5545
.if.end.5545:
%.tmp5547 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5536
%.tmp5548 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5547, i32 0, i32 2
%.tmp5549 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5548
store %m1861$.ScopeItem.type* %.tmp5549, %m1861$.ScopeItem.type** %item.5536
br label %.for.start.5532
.for.end.5532:
%.tmp5550 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5550
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5551 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5552 = load i8*, i8** %module
%.tmp5553 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5551, i8* %.tmp5552)
%mod.5554 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5553, %m1861$.ModuleLookup.type** %mod.5554
%.tmp5555 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5554
%.tmp5556 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5555, i32 0, i32 3
%.tmp5557 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5556
%.tmp5558 = icmp ne %m1861$.Scope.type* %.tmp5557, null
%.tmp5560 = getelementptr [77 x i8], [77 x i8]*@.str5559, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5558, i8* %.tmp5560)
%.tmp5562 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5554
%.tmp5563 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5562, i32 0, i32 3
%.tmp5564 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5563
%s.5565 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5564, %m1861$.Scope.type** %s.5565
br label %.for.start.5561
.for.start.5561:
%.tmp5566 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5565
%.tmp5567 = icmp ne %m1861$.Scope.type* %.tmp5566, null
br i1 %.tmp5567, label %.for.continue.5561, label %.for.end.5561
.for.continue.5561:
%.tmp5568 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5569 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5565
%.tmp5570 = load i8*, i8** %assignable_name
%.tmp5571 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5568, %m1861$.Scope.type* %.tmp5569, i8* %.tmp5570)
%item.5572 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5571, %m1861$.ScopeItem.type** %item.5572
%.tmp5573 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5572
%.tmp5574 = icmp ne %m1861$.ScopeItem.type* %.tmp5573, null
br i1 %.tmp5574, label %.if.true.5575, label %.if.false.5575
.if.true.5575:
%.tmp5576 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5572
ret %m1861$.ScopeItem.type* %.tmp5576
br label %.if.end.5575
.if.false.5575:
br label %.if.end.5575
.if.end.5575:
%.tmp5577 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5565
%.tmp5578 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5577, i32 0, i32 5
%.tmp5579 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5578
store %m1861$.Scope.type* %.tmp5579, %m1861$.Scope.type** %s.5565
br label %.for.start.5561
.for.end.5561:
%.tmp5580 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5580
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5581 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5582 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5583 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5582, i32 0, i32 7
%.tmp5584 = load i8*, i8** %.tmp5583
%.tmp5585 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5586 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5585, i32 0, i32 6
%.tmp5587 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5586
%.tmp5588 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5581, i8* %.tmp5584, %m307$.Node.type* %.tmp5587)
ret %m1861$.ScopeItem.type* %.tmp5588
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5589 = alloca i8*
store i8* null, i8** %err_msg.5589
%buf.5590 = alloca i8*
store i8* null, i8** %buf.5590
%.tmp5591 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5592 = icmp eq %m1861$.AssignableInfo.type* %.tmp5591, null
br i1 %.tmp5592, label %.if.true.5593, label %.if.false.5593
.if.true.5593:
%.tmp5594 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5595 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5597 = getelementptr [54 x i8], [54 x i8]*@.str5596, i32 0, i32 0
%.tmp5598 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5594, %m307$.Node.type* %.tmp5595, i8* %.tmp5597)
%.tmp5599 = call i32(i8*,...) @printf(i8* %.tmp5598)
%.tmp5600 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5600
br label %.if.end.5593
.if.false.5593:
br label %.if.end.5593
.if.end.5593:
%.tmp5601 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5602 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5601, i32 0, i32 2
%.tmp5603 = load i8*, i8** %.tmp5602
%.tmp5605 = getelementptr [9 x i8], [9 x i8]*@.str5604, i32 0, i32 0
%.tmp5606 = call i32(i8*,i8*) @strcmp(i8* %.tmp5603, i8* %.tmp5605)
%.tmp5607 = icmp eq i32 %.tmp5606, 0
%.tmp5608 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5609 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5608, i32 0, i32 2
%.tmp5610 = load i8*, i8** %.tmp5609
%.tmp5612 = getelementptr [7 x i8], [7 x i8]*@.str5611, i32 0, i32 0
%.tmp5613 = call i32(i8*,i8*) @strcmp(i8* %.tmp5610, i8* %.tmp5612)
%.tmp5614 = icmp eq i32 %.tmp5613, 0
%.tmp5615 = or i1 %.tmp5607, %.tmp5614
br i1 %.tmp5615, label %.if.true.5616, label %.if.false.5616
.if.true.5616:
%.tmp5617 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5618 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5617, i32 0, i32 7
%.tmp5619 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5618
%.tmp5620 = icmp ne %m307$.Node.type* %.tmp5619, null
br i1 %.tmp5620, label %.if.true.5621, label %.if.false.5621
.if.true.5621:
%.tmp5622 = getelementptr i8*, i8** %err_msg.5589, i32 0
%.tmp5624 = getelementptr [46 x i8], [46 x i8]*@.str5623, i32 0, i32 0
%.tmp5625 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5626 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5625, i32 0, i32 7
%.tmp5627 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5626
%.tmp5628 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5627, i32 0, i32 7
%.tmp5629 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5628
%.tmp5630 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5629, i32 0, i32 1
%.tmp5631 = load i8*, i8** %.tmp5630
%.tmp5632 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5633 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5632, i32 0, i32 1
%.tmp5634 = load i8*, i8** %.tmp5633
%.tmp5635 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5622, i8* %.tmp5624, i8* %.tmp5631, i8* %.tmp5634)
%.tmp5636 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5637 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5638 = load i8*, i8** %err_msg.5589
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5636, %m307$.Node.type* %.tmp5637, i8* %.tmp5638)
%.tmp5639 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5639
br label %.if.end.5621
.if.false.5621:
br label %.if.end.5621
.if.end.5621:
%.tmp5640 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5640
br label %.if.end.5616
.if.false.5616:
%.tmp5641 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5642 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5641, i32 0, i32 2
%.tmp5643 = load i8*, i8** %.tmp5642
%.tmp5645 = getelementptr [9 x i8], [9 x i8]*@.str5644, i32 0, i32 0
%.tmp5646 = call i32(i8*,i8*) @strcmp(i8* %.tmp5643, i8* %.tmp5645)
%.tmp5647 = icmp eq i32 %.tmp5646, 0
%.tmp5648 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5649 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5648, i32 0, i32 7
%.tmp5650 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5649
%.tmp5651 = icmp ne %m307$.Node.type* %.tmp5650, null
%.tmp5652 = and i1 %.tmp5647, %.tmp5651
br i1 %.tmp5652, label %.if.true.5653, label %.if.false.5653
.if.true.5653:
%.tmp5654 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5655 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5654, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5656 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5657 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5656, i32 0, i32 3
%.tmp5658 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5657
%struct_info.5659 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5658, %m1861$.Type.type** %struct_info.5659
br label %.for.start.5660
.for.start.5660:
%.tmp5661 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5662 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5661, i32 0, i32 3
%.tmp5663 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5662
%.tmp5664 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5663, i32 0, i32 0
%.tmp5665 = load i8*, i8** %.tmp5664
%.tmp5667 = getelementptr [4 x i8], [4 x i8]*@.str5666, i32 0, i32 0
%.tmp5668 = call i32(i8*,i8*) @strcmp(i8* %.tmp5665, i8* %.tmp5667)
%.tmp5669 = icmp eq i32 %.tmp5668, 0
br i1 %.tmp5669, label %.for.continue.5660, label %.for.end.5660
.for.continue.5660:
%.tmp5670 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5671 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5670)
%new_base.5672 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5671, %m1861$.AssignableInfo.type** %new_base.5672
%.tmp5673 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5674 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5672
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5673, %m1861$.AssignableInfo.type* %.tmp5674)
%.tmp5675 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5672
%.tmp5676 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5675, i32 0, i32 3
%.tmp5677 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5678 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5677, i32 0, i32 3
%.tmp5679 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5678
%.tmp5680 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5679, i32 0, i32 3
%.tmp5681 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5680
store %m1861$.Type.type* %.tmp5681, %m1861$.Type.type** %.tmp5676
%.tmp5682 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5683 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5682, i32 0, i32 1
%.tmp5684 = load %m0$.File.type*, %m0$.File.type** %.tmp5683
%.tmp5686 = getelementptr [23 x i8], [23 x i8]*@.str5685, i32 0, i32 0
%.tmp5687 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5672
%.tmp5688 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5687)
%.tmp5689 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5690 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5672
%.tmp5691 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5690, i32 0, i32 3
%.tmp5692 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5691
%.tmp5693 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5689, %m1861$.Type.type* %.tmp5692)
%.tmp5694 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5695 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5696 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5695, i32 0, i32 3
%.tmp5697 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5696
%.tmp5698 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5694, %m1861$.Type.type* %.tmp5697)
%.tmp5699 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5700 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5699)
%.tmp5701 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5684, i8* %.tmp5686, i8* %.tmp5688, i8* %.tmp5693, i8* %.tmp5698, i8* %.tmp5700)
%.tmp5702 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5672
store %m1861$.AssignableInfo.type* %.tmp5702, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5703 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5659
%.tmp5704 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5703, i32 0, i32 3
%.tmp5705 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5704
store %m1861$.Type.type* %.tmp5705, %m1861$.Type.type** %struct_info.5659
br label %.for.start.5660
.for.end.5660:
%.tmp5706 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5659
%.tmp5707 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5706, i32 0, i32 0
%.tmp5708 = load i8*, i8** %.tmp5707
%.tmp5710 = getelementptr [10 x i8], [10 x i8]*@.str5709, i32 0, i32 0
%.tmp5711 = call i32(i8*,i8*) @strcmp(i8* %.tmp5708, i8* %.tmp5710)
%.tmp5712 = icmp eq i32 %.tmp5711, 0
br i1 %.tmp5712, label %.if.true.5713, label %.if.false.5713
.if.true.5713:
%.tmp5714 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5659
%.tmp5715 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5714, i32 0, i32 3
%.tmp5716 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5715
store %m1861$.Type.type* %.tmp5716, %m1861$.Type.type** %struct_info.5659
br label %.if.end.5713
.if.false.5713:
br label %.if.end.5713
.if.end.5713:
%.tmp5717 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5659
%.tmp5718 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5717, i32 0, i32 0
%.tmp5719 = load i8*, i8** %.tmp5718
%.tmp5721 = getelementptr [7 x i8], [7 x i8]*@.str5720, i32 0, i32 0
%.tmp5722 = call i32(i8*,i8*) @strcmp(i8* %.tmp5719, i8* %.tmp5721)
%.tmp5723 = icmp ne i32 %.tmp5722, 0
br i1 %.tmp5723, label %.if.true.5724, label %.if.false.5724
.if.true.5724:
%.tmp5725 = getelementptr i8*, i8** %err_msg.5589, i32 0
%.tmp5727 = getelementptr [48 x i8], [48 x i8]*@.str5726, i32 0, i32 0
%.tmp5728 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5729 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5728, i32 0, i32 7
%.tmp5730 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5729
%.tmp5731 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5730, i32 0, i32 7
%.tmp5732 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5731
%.tmp5733 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5732, i32 0, i32 1
%.tmp5734 = load i8*, i8** %.tmp5733
%.tmp5735 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5736 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5735, i32 0, i32 1
%.tmp5737 = load i8*, i8** %.tmp5736
%.tmp5738 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5725, i8* %.tmp5727, i8* %.tmp5734, i8* %.tmp5737)
%.tmp5739 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5740 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5741 = load i8*, i8** %err_msg.5589
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5739, %m307$.Node.type* %.tmp5740, i8* %.tmp5741)
%.tmp5742 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5742
br label %.if.end.5724
.if.false.5724:
br label %.if.end.5724
.if.end.5724:
%.tmp5743 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5744 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5743, i32 0, i32 7
%.tmp5745 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5744
%.tmp5746 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5745, i32 0, i32 7
%.tmp5747 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5746
%.tmp5748 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5747, i32 0, i32 1
%.tmp5749 = load i8*, i8** %.tmp5748
%field_name.5750 = alloca i8*
store i8* %.tmp5749, i8** %field_name.5750
%field_id.5751 = alloca i32
store i32 0, i32* %field_id.5751
%.tmp5752 = bitcast ptr null to %m1861$.Type.type*
%found_field.5753 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5752, %m1861$.Type.type** %found_field.5753
%.tmp5755 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5659
%.tmp5756 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5755, i32 0, i32 3
%.tmp5757 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5756
%field.5758 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5757, %m1861$.Type.type** %field.5758
br label %.for.start.5754
.for.start.5754:
%.tmp5759 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5758
%.tmp5760 = icmp ne %m1861$.Type.type* %.tmp5759, null
br i1 %.tmp5760, label %.for.continue.5754, label %.for.end.5754
.for.continue.5754:
%.tmp5761 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5758
%.tmp5762 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5761, i32 0, i32 1
%.tmp5763 = load i8*, i8** %.tmp5762
%.tmp5764 = load i8*, i8** %field_name.5750
%.tmp5765 = call i32(i8*,i8*) @strcmp(i8* %.tmp5763, i8* %.tmp5764)
%.tmp5766 = icmp eq i32 %.tmp5765, 0
br i1 %.tmp5766, label %.if.true.5767, label %.if.false.5767
.if.true.5767:
%.tmp5768 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5758
store %m1861$.Type.type* %.tmp5768, %m1861$.Type.type** %found_field.5753
br label %.for.end.5754
br label %.if.end.5767
.if.false.5767:
%.tmp5769 = load i32, i32* %field_id.5751
%.tmp5770 = add i32 %.tmp5769, 1
store i32 %.tmp5770, i32* %field_id.5751
br label %.if.end.5767
.if.end.5767:
%.tmp5771 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5758
%.tmp5772 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5771, i32 0, i32 4
%.tmp5773 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5772
store %m1861$.Type.type* %.tmp5773, %m1861$.Type.type** %field.5758
br label %.for.start.5754
.for.end.5754:
%.tmp5774 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5753
%.tmp5775 = icmp eq %m1861$.Type.type* %.tmp5774, null
br i1 %.tmp5775, label %.if.true.5776, label %.if.false.5776
.if.true.5776:
%.tmp5777 = getelementptr i8*, i8** %err_msg.5589, i32 0
%.tmp5779 = getelementptr [34 x i8], [34 x i8]*@.str5778, i32 0, i32 0
%.tmp5780 = load i8*, i8** %field_name.5750
%.tmp5781 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5782 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5781, i32 0, i32 1
%.tmp5783 = load i8*, i8** %.tmp5782
%.tmp5784 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5777, i8* %.tmp5779, i8* %.tmp5780, i8* %.tmp5783)
%.tmp5785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5786 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5787 = load i8*, i8** %err_msg.5589
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5785, %m307$.Node.type* %.tmp5786, i8* %.tmp5787)
%.tmp5788 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5788
br label %.if.end.5776
.if.false.5776:
br label %.if.end.5776
.if.end.5776:
%.tmp5789 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5790 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5789)
%new_info.5791 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5790, %m1861$.AssignableInfo.type** %new_info.5791
%.tmp5792 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5791
%.tmp5793 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5792, i32 0, i32 3
%.tmp5794 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5753
store %m1861$.Type.type* %.tmp5794, %m1861$.Type.type** %.tmp5793
%.tmp5795 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5796 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5791
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5795, %m1861$.AssignableInfo.type* %.tmp5796)
%.tmp5797 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5791
%.tmp5798 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5797, i32 0, i32 2
%.tmp5800 = getelementptr [9 x i8], [9 x i8]*@.str5799, i32 0, i32 0
store i8* %.tmp5800, i8** %.tmp5798
%.tmp5801 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5802 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5803 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5802, i32 0, i32 3
%.tmp5804 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5803
%.tmp5805 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5801, %m1861$.Type.type* %.tmp5804)
%info_tr.5806 = alloca i8*
store i8* %.tmp5805, i8** %info_tr.5806
%.tmp5807 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5808 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5807, i32 0, i32 1
%.tmp5809 = load %m0$.File.type*, %m0$.File.type** %.tmp5808
%.tmp5811 = getelementptr [46 x i8], [46 x i8]*@.str5810, i32 0, i32 0
%.tmp5812 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5791
%.tmp5813 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5812)
%.tmp5814 = load i8*, i8** %info_tr.5806
%.tmp5815 = load i8*, i8** %info_tr.5806
%.tmp5816 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5655
%.tmp5817 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5816)
%.tmp5818 = load i32, i32* %field_id.5751
%.tmp5819 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5809, i8* %.tmp5811, i8* %.tmp5813, i8* %.tmp5814, i8* %.tmp5815, i8* %.tmp5817, i32 %.tmp5818)
%.tmp5820 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5821 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5822 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5821, i32 0, i32 7
%.tmp5823 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5822
%.tmp5824 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5823, i32 0, i32 7
%.tmp5825 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5824
%.tmp5826 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5791
%.tmp5827 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5820, %m307$.Node.type* %.tmp5825, %m1861$.AssignableInfo.type* %.tmp5826)
ret %m1861$.AssignableInfo.type* %.tmp5827
br label %.if.end.5653
.if.false.5653:
%.tmp5828 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5829 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5828, i32 0, i32 2
%.tmp5830 = load i8*, i8** %.tmp5829
%.tmp5832 = getelementptr [9 x i8], [9 x i8]*@.str5831, i32 0, i32 0
%.tmp5833 = call i32(i8*,i8*) @strcmp(i8* %.tmp5830, i8* %.tmp5832)
%.tmp5834 = icmp eq i32 %.tmp5833, 0
br i1 %.tmp5834, label %.if.true.5835, label %.if.false.5835
.if.true.5835:
%.tmp5836 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5836
br label %.if.end.5835
.if.false.5835:
br label %.if.end.5835
.if.end.5835:
br label %.if.end.5653
.if.end.5653:
br label %.if.end.5616
.if.end.5616:
%.tmp5837 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5838 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5840 = getelementptr [43 x i8], [43 x i8]*@.str5839, i32 0, i32 0
%.tmp5841 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5837, %m307$.Node.type* %.tmp5838, i8* %.tmp5840)
%.tmp5842 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5843 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5842, i32 0, i32 2
%.tmp5844 = load i8*, i8** %.tmp5843
%.tmp5845 = call i32(i8*,...) @printf(i8* %.tmp5841, i8* %.tmp5844)
%.tmp5846 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5846
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.5847 = alloca i8*
store i8* null, i8** %err_msg.5847
%.tmp5848 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.5849 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5848, %m307$.Node.type** %curr_node.5849
%.tmp5850 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5851 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5850, i32 0, i32 0
%.tmp5852 = load i8*, i8** %.tmp5851
%.tmp5854 = getelementptr [17 x i8], [17 x i8]*@.str5853, i32 0, i32 0
%.tmp5855 = call i32(i8*,i8*) @strcmp(i8* %.tmp5852, i8* %.tmp5854)
%.tmp5856 = icmp eq i32 %.tmp5855, 0
%.tmp5857 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5858 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5857, i32 0, i32 0
%.tmp5859 = load i8*, i8** %.tmp5858
%.tmp5861 = getelementptr [16 x i8], [16 x i8]*@.str5860, i32 0, i32 0
%.tmp5862 = call i32(i8*,i8*) @strcmp(i8* %.tmp5859, i8* %.tmp5861)
%.tmp5863 = icmp eq i32 %.tmp5862, 0
%.tmp5864 = or i1 %.tmp5856, %.tmp5863
%.tmp5865 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5866 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5865, i32 0, i32 0
%.tmp5867 = load i8*, i8** %.tmp5866
%.tmp5869 = getelementptr [11 x i8], [11 x i8]*@.str5868, i32 0, i32 0
%.tmp5870 = call i32(i8*,i8*) @strcmp(i8* %.tmp5867, i8* %.tmp5869)
%.tmp5871 = icmp eq i32 %.tmp5870, 0
%.tmp5872 = or i1 %.tmp5864, %.tmp5871
br i1 %.tmp5872, label %.if.true.5873, label %.if.false.5873
.if.true.5873:
%.tmp5874 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5875 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5876 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5875, i32 0, i32 6
%.tmp5877 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5876
%.tmp5878 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5874, %m307$.Node.type* %.tmp5877)
ret %m1861$.AssignableInfo.type* %.tmp5878
br label %.if.end.5873
.if.false.5873:
br label %.if.end.5873
.if.end.5873:
%.tmp5879 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5880 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5879, i32 0, i32 0
%.tmp5881 = load i8*, i8** %.tmp5880
%.tmp5883 = getelementptr [12 x i8], [12 x i8]*@.str5882, i32 0, i32 0
%.tmp5884 = call i32(i8*,i8*) @strcmp(i8* %.tmp5881, i8* %.tmp5883)
%.tmp5885 = icmp ne i32 %.tmp5884, 0
br i1 %.tmp5885, label %.if.true.5886, label %.if.false.5886
.if.true.5886:
%.tmp5888 = getelementptr [92 x i8], [92 x i8]*@.str5887, i32 0, i32 0
%.tmp5889 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5890 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5889, i32 0, i32 0
%.tmp5891 = load i8*, i8** %.tmp5890
%.tmp5892 = call i32(i8*,...) @printf(i8* %.tmp5888, i8* %.tmp5891)
%.tmp5893 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5894 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5893, i32 0, i32 6
%.tmp5895 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5894
store %m307$.Node.type* %.tmp5895, %m307$.Node.type** %curr_node.5849
br label %.if.end.5886
.if.false.5886:
br label %.if.end.5886
.if.end.5886:
%.tmp5896 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5897 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5896, i32 0, i32 6
%.tmp5898 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5897
%assignable_name.5899 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5898, %m307$.Node.type** %assignable_name.5899
%.tmp5900 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5901 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5902 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5901, i32 0, i32 7
%.tmp5903 = load i8*, i8** %.tmp5902
%.tmp5904 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5905 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5904, i32 0, i32 6
%.tmp5906 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5905
%.tmp5907 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5906, i32 0, i32 1
%.tmp5908 = load i8*, i8** %.tmp5907
%.tmp5909 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5900, i8* %.tmp5903, i8* %.tmp5908)
%scope_info.5910 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5909, %m1861$.ScopeItem.type** %scope_info.5910
%.tmp5911 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5910
%.tmp5912 = icmp eq %m1861$.ScopeItem.type* %.tmp5911, null
br i1 %.tmp5912, label %.if.true.5913, label %.if.false.5913
.if.true.5913:
%.tmp5914 = getelementptr i8*, i8** %err_msg.5847, i32 0
%.tmp5916 = getelementptr [41 x i8], [41 x i8]*@.str5915, i32 0, i32 0
%.tmp5917 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5918 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5917, i32 0, i32 6
%.tmp5919 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5918
%.tmp5920 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5919, i32 0, i32 1
%.tmp5921 = load i8*, i8** %.tmp5920
%.tmp5922 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5914, i8* %.tmp5916, i8* %.tmp5921)
%.tmp5923 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5924 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5925 = load i8*, i8** %err_msg.5847
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5923, %m307$.Node.type* %.tmp5924, i8* %.tmp5925)
%.tmp5926 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5926
br label %.if.end.5913
.if.false.5913:
br label %.if.end.5913
.if.end.5913:
%.tmp5927 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5910
%.tmp5928 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5927, i32 0, i32 1
%.tmp5929 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5928
%info.5930 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5929, %m1861$.AssignableInfo.type** %info.5930
%.tmp5931 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5930
%.tmp5932 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5931, i32 0, i32 2
%.tmp5933 = load i8*, i8** %.tmp5932
%.tmp5935 = getelementptr [7 x i8], [7 x i8]*@.str5934, i32 0, i32 0
%.tmp5936 = call i32(i8*,i8*) @strcmp(i8* %.tmp5933, i8* %.tmp5935)
%.tmp5937 = icmp eq i32 %.tmp5936, 0
br i1 %.tmp5937, label %.if.true.5938, label %.if.false.5938
.if.true.5938:
%.tmp5939 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5940 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5930
%.tmp5941 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5940)
%.tmp5942 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5943 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5942, i32 0, i32 6
%.tmp5944 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5943
%.tmp5945 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5944, i32 0, i32 7
%.tmp5946 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5945
%.tmp5947 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5946, i32 0, i32 7
%.tmp5948 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5947
%.tmp5949 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5948, i32 0, i32 1
%.tmp5950 = load i8*, i8** %.tmp5949
%.tmp5951 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5939, i8* %.tmp5941, i8* %.tmp5950)
store %m1861$.ScopeItem.type* %.tmp5951, %m1861$.ScopeItem.type** %scope_info.5910
%.tmp5952 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5910
%.tmp5953 = icmp eq %m1861$.ScopeItem.type* %.tmp5952, null
br i1 %.tmp5953, label %.if.true.5954, label %.if.false.5954
.if.true.5954:
%.tmp5955 = getelementptr i8*, i8** %err_msg.5847, i32 0
%.tmp5957 = getelementptr [31 x i8], [31 x i8]*@.str5956, i32 0, i32 0
%.tmp5958 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5958, i32 0, i32 6
%.tmp5960 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5959
%.tmp5961 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5960, i32 0, i32 7
%.tmp5962 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5961
%.tmp5963 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5962, i32 0, i32 7
%.tmp5964 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5963
%.tmp5965 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5964, i32 0, i32 1
%.tmp5966 = load i8*, i8** %.tmp5965
%.tmp5967 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5930
%.tmp5968 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5967)
%.tmp5969 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5955, i8* %.tmp5957, i8* %.tmp5966, i8* %.tmp5968)
%.tmp5970 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5971 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5972 = load i8*, i8** %err_msg.5847
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5970, %m307$.Node.type* %.tmp5971, i8* %.tmp5972)
%.tmp5973 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5973
br label %.if.end.5954
.if.false.5954:
br label %.if.end.5954
.if.end.5954:
%.tmp5974 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5910
%.tmp5975 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5974, i32 0, i32 1
%.tmp5976 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5975
store %m1861$.AssignableInfo.type* %.tmp5976, %m1861$.AssignableInfo.type** %info.5930
%.tmp5977 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5977, i32 0, i32 6
%.tmp5979 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5978
%.tmp5980 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5979, i32 0, i32 7
%.tmp5981 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5980
%.tmp5982 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5981, i32 0, i32 7
%.tmp5983 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5982
store %m307$.Node.type* %.tmp5983, %m307$.Node.type** %assignable_name.5899
br label %.if.end.5938
.if.false.5938:
%.tmp5984 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5984, i32 0, i32 6
%.tmp5986 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5985
store %m307$.Node.type* %.tmp5986, %m307$.Node.type** %assignable_name.5899
br label %.if.end.5938
.if.end.5938:
%.tmp5987 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5988 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5899
%.tmp5989 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5930
%.tmp5990 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5987, %m307$.Node.type* %.tmp5988, %m1861$.AssignableInfo.type* %.tmp5989)
%base.5991 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5990, %m1861$.AssignableInfo.type** %base.5991
%.tmp5993 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp5994 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5993, i32 0, i32 6
%.tmp5995 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5994
%.tmp5996 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5995, i32 0, i32 7
%.tmp5997 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5996
%addr.5998 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5997, %m307$.Node.type** %addr.5998
br label %.for.start.5992
.for.start.5992:
%.tmp5999 = load %m307$.Node.type*, %m307$.Node.type** %addr.5998
%.tmp6000 = icmp ne %m307$.Node.type* %.tmp5999, null
br i1 %.tmp6000, label %.for.continue.5992, label %.for.end.5992
.for.continue.5992:
%.tmp6001 = load %m307$.Node.type*, %m307$.Node.type** %addr.5998
%.tmp6002 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6001, i32 0, i32 7
%.tmp6003 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6002
%index.6004 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6003, %m307$.Node.type** %index.6004
%.tmp6005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6006 = load %m307$.Node.type*, %m307$.Node.type** %index.6004
%.tmp6007 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6005, %m307$.Node.type* %.tmp6006)
%index_info.6008 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6007, %m1861$.AssignableInfo.type** %index_info.6008
%.tmp6009 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6010 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5991
%.tmp6011 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6010, i32 0, i32 3
%.tmp6012 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6011
%.tmp6013 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6009, %m1861$.Type.type* %.tmp6012)
%base_type.6014 = alloca i8*
store i8* %.tmp6013, i8** %base_type.6014
%.tmp6015 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6016 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6008
%.tmp6017 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6016, i32 0, i32 3
%.tmp6018 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6017
%.tmp6019 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6015, %m1861$.Type.type* %.tmp6018)
%index_type.6020 = alloca i8*
store i8* %.tmp6019, i8** %index_type.6020
%.tmp6021 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6022 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6021)
%tmp_id.6023 = alloca i32
store i32 %.tmp6022, i32* %tmp_id.6023
%.tmp6024 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6025 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6024, i32 0, i32 1
%.tmp6026 = load %m0$.File.type*, %m0$.File.type** %.tmp6025
%.tmp6028 = getelementptr [28 x i8], [28 x i8]*@.str6027, i32 0, i32 0
%.tmp6029 = load i32, i32* %tmp_id.6023
%.tmp6030 = load i8*, i8** %base_type.6014
%.tmp6031 = load i8*, i8** %base_type.6014
%.tmp6032 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5991
%.tmp6033 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6032)
%.tmp6034 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6026, i8* %.tmp6028, i32 %.tmp6029, i8* %.tmp6030, i8* %.tmp6031, i8* %.tmp6033)
%.tmp6035 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5849
%.tmp6036 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6035)
%new_base.6037 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6036, %m1861$.AssignableInfo.type** %new_base.6037
%.tmp6038 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6039 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6037
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6038, %m1861$.AssignableInfo.type* %.tmp6039)
%.tmp6040 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5991
%.tmp6041 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6040, i32 0, i32 3
%.tmp6042 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6041
%.tmp6043 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6042, i32 0, i32 3
%.tmp6044 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6043
%.tmp6045 = icmp eq %m1861$.Type.type* %.tmp6044, null
br i1 %.tmp6045, label %.if.true.6046, label %.if.false.6046
.if.true.6046:
%.tmp6047 = getelementptr i8*, i8** %err_msg.5847, i32 0
%.tmp6049 = getelementptr [35 x i8], [35 x i8]*@.str6048, i32 0, i32 0
%.tmp6050 = load i8*, i8** %base_type.6014
%.tmp6051 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6047, i8* %.tmp6049, i8* %.tmp6050)
%.tmp6052 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6053 = load %m307$.Node.type*, %m307$.Node.type** %addr.5998
%.tmp6054 = load i8*, i8** %err_msg.5847
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6052, %m307$.Node.type* %.tmp6053, i8* %.tmp6054)
%.tmp6055 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5991
ret %m1861$.AssignableInfo.type* %.tmp6055
br label %.if.end.6046
.if.false.6046:
br label %.if.end.6046
.if.end.6046:
%.tmp6056 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6037
%.tmp6057 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6056, i32 0, i32 3
%.tmp6058 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5991
%.tmp6059 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6058, i32 0, i32 3
%.tmp6060 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6059
%.tmp6061 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6060, i32 0, i32 3
%.tmp6062 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6061
store %m1861$.Type.type* %.tmp6062, %m1861$.Type.type** %.tmp6057
%.tmp6063 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6064 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6037
%.tmp6065 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6064, i32 0, i32 3
%.tmp6066 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6065
%.tmp6067 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6063, %m1861$.Type.type* %.tmp6066)
%base_type_2.6068 = alloca i8*
store i8* %.tmp6067, i8** %base_type_2.6068
%.tmp6069 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6070 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6069, i32 0, i32 1
%.tmp6071 = load %m0$.File.type*, %m0$.File.type** %.tmp6070
%.tmp6073 = getelementptr [44 x i8], [44 x i8]*@.str6072, i32 0, i32 0
%.tmp6074 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6037
%.tmp6075 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6074)
%.tmp6076 = load i8*, i8** %base_type_2.6068
%.tmp6077 = load i8*, i8** %base_type_2.6068
%.tmp6078 = load i32, i32* %tmp_id.6023
%.tmp6079 = load i8*, i8** %index_type.6020
%.tmp6080 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6008
%.tmp6081 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6080)
%.tmp6082 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6071, i8* %.tmp6073, i8* %.tmp6075, i8* %.tmp6076, i8* %.tmp6077, i32 %.tmp6078, i8* %.tmp6079, i8* %.tmp6081)
%.tmp6083 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6037
store %m1861$.AssignableInfo.type* %.tmp6083, %m1861$.AssignableInfo.type** %base.5991
%.tmp6084 = load %m307$.Node.type*, %m307$.Node.type** %addr.5998
%.tmp6085 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6084, i32 0, i32 7
%.tmp6086 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6085
%.tmp6087 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6086, i32 0, i32 7
%.tmp6088 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6087
%.tmp6089 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6088, i32 0, i32 7
%.tmp6090 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6089
store %m307$.Node.type* %.tmp6090, %m307$.Node.type** %addr.5998
br label %.for.start.5992
.for.end.5992:
%.tmp6091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5991
ret %m1861$.AssignableInfo.type* %.tmp6091
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6092 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6093 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6092, i32 0, i32 6
%.tmp6094 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6093
%.tmp6096 = getelementptr [16 x i8], [16 x i8]*@.str6095, i32 0, i32 0
%.tmp6097 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6094, i8* %.tmp6096)
%assignable_start.6098 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6097, %m307$.Node.type** %assignable_start.6098
%.tmp6099 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6098
%.tmp6100 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6099)
%operator_stack.6101 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6100, %m1988$.SYStack.type** %operator_stack.6101
%.tmp6102 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6103 = ptrtoint %m1861$.StackHead.type* %.tmp6102 to i32
%.tmp6104 = call i8*(i32) @malloc(i32 %.tmp6103)
%.tmp6105 = bitcast i8* %.tmp6104 to %m1861$.StackHead.type*
%stack.6106 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6105, %m1861$.StackHead.type** %stack.6106
%.tmp6107 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6106
%.tmp6108 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6107, i32 0, i32 0
%.tmp6109 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6101
store %m1988$.SYStack.type* %.tmp6109, %m1988$.SYStack.type** %.tmp6108
%.tmp6110 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6111 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6106
%.tmp6112 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6110, %m1861$.StackHead.type* %.tmp6111)
%info.6113 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6112, %m1861$.AssignableInfo.type** %info.6113
%.tmp6114 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
%.tmp6115 = icmp eq %m1861$.AssignableInfo.type* %.tmp6114, null
br i1 %.tmp6115, label %.if.true.6116, label %.if.false.6116
.if.true.6116:
%.tmp6117 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
ret %m1861$.AssignableInfo.type* %.tmp6117
br label %.if.end.6116
.if.false.6116:
br label %.if.end.6116
.if.end.6116:
%.tmp6118 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6119 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6118, i32 0, i32 6
%.tmp6120 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6119
%.tmp6122 = getelementptr [5 x i8], [5 x i8]*@.str6121, i32 0, i32 0
%.tmp6123 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6120, i8* %.tmp6122)
%cast.6124 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6123, %m307$.Node.type** %cast.6124
%.tmp6125 = load %m307$.Node.type*, %m307$.Node.type** %cast.6124
%.tmp6126 = icmp ne %m307$.Node.type* %.tmp6125, null
br i1 %.tmp6126, label %.if.true.6127, label %.if.false.6127
.if.true.6127:
%.tmp6128 = load %m307$.Node.type*, %m307$.Node.type** %cast.6124
%.tmp6129 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6128, i32 0, i32 6
%.tmp6130 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6129
%.tmp6132 = getelementptr [5 x i8], [5 x i8]*@.str6131, i32 0, i32 0
%.tmp6133 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6130, i8* %.tmp6132)
%cast_type.6134 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6133, %m307$.Node.type** %cast_type.6134
%.tmp6135 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6136 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6134
%.tmp6137 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6136, i32 0, i32 6
%.tmp6138 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6137
%.tmp6139 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6135, %m307$.Node.type* %.tmp6138)
%type.6140 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6139, %m1861$.Type.type** %type.6140
%.tmp6141 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
%.tmp6142 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6141)
%prev_id.6143 = alloca i8*
store i8* %.tmp6142, i8** %prev_id.6143
%.tmp6144 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6145 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6144, %m1861$.AssignableInfo.type* %.tmp6145)
%.tmp6146 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6147 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
%.tmp6148 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6147, i32 0, i32 3
%.tmp6149 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6148
%.tmp6150 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6146, %m1861$.Type.type* %.tmp6149)
%from_type.6151 = alloca i8*
store i8* %.tmp6150, i8** %from_type.6151
%.tmp6152 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6153 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6140
%.tmp6154 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6152, %m1861$.Type.type* %.tmp6153)
%to_type.6155 = alloca i8*
store i8* %.tmp6154, i8** %to_type.6155
%.tmp6157 = getelementptr [8 x i8], [8 x i8]*@.str6156, i32 0, i32 0
%cast_fn.6158 = alloca i8*
store i8* %.tmp6157, i8** %cast_fn.6158
%.tmp6159 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
%.tmp6160 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6159, i32 0, i32 3
%.tmp6161 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6160
%.tmp6162 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6161, i32 0, i32 0
%.tmp6163 = load i8*, i8** %.tmp6162
%.tmp6165 = getelementptr [4 x i8], [4 x i8]*@.str6164, i32 0, i32 0
%.tmp6166 = call i32(i8*,i8*) @strcmp(i8* %.tmp6163, i8* %.tmp6165)
%.tmp6167 = icmp ne i32 %.tmp6166, 0
%.tmp6168 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6140
%.tmp6169 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6168, i32 0, i32 0
%.tmp6170 = load i8*, i8** %.tmp6169
%.tmp6172 = getelementptr [4 x i8], [4 x i8]*@.str6171, i32 0, i32 0
%.tmp6173 = call i32(i8*,i8*) @strcmp(i8* %.tmp6170, i8* %.tmp6172)
%.tmp6174 = icmp ne i32 %.tmp6173, 0
%.tmp6175 = and i1 %.tmp6167, %.tmp6174
br i1 %.tmp6175, label %.if.true.6176, label %.if.false.6176
.if.true.6176:
%.tmp6177 = load i8*, i8** %from_type.6151
%.tmp6178 = getelementptr i8, i8* %.tmp6177, i32 0
%.tmp6179 = load i8, i8* %.tmp6178
%.tmp6180 = icmp eq i8 %.tmp6179, 105
%.tmp6181 = load i8*, i8** %to_type.6155
%.tmp6182 = getelementptr i8, i8* %.tmp6181, i32 0
%.tmp6183 = load i8, i8* %.tmp6182
%.tmp6184 = icmp eq i8 %.tmp6183, 105
%.tmp6185 = and i1 %.tmp6180, %.tmp6184
br i1 %.tmp6185, label %.if.true.6186, label %.if.false.6186
.if.true.6186:
%from_size.6187 = alloca i32
store i32 0, i32* %from_size.6187
%to_size.6188 = alloca i32
store i32 0, i32* %to_size.6188
%.tmp6189 = load i8*, i8** %from_type.6151
%.tmp6191 = getelementptr [4 x i8], [4 x i8]*@.str6190, i32 0, i32 0
%.tmp6192 = getelementptr i32, i32* %from_size.6187, i32 0
%.tmp6193 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6189, i8* %.tmp6191, i32* %.tmp6192)
%.tmp6194 = load i8*, i8** %to_type.6155
%.tmp6196 = getelementptr [4 x i8], [4 x i8]*@.str6195, i32 0, i32 0
%.tmp6197 = getelementptr i32, i32* %to_size.6188, i32 0
%.tmp6198 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6194, i8* %.tmp6196, i32* %.tmp6197)
%.tmp6199 = load i32, i32* %from_size.6187
%.tmp6200 = load i32, i32* %to_size.6188
%.tmp6201 = icmp slt i32 %.tmp6199, %.tmp6200
br i1 %.tmp6201, label %.if.true.6202, label %.if.false.6202
.if.true.6202:
%.tmp6204 = getelementptr [5 x i8], [5 x i8]*@.str6203, i32 0, i32 0
store i8* %.tmp6204, i8** %cast_fn.6158
br label %.if.end.6202
.if.false.6202:
%.tmp6206 = getelementptr [6 x i8], [6 x i8]*@.str6205, i32 0, i32 0
store i8* %.tmp6206, i8** %cast_fn.6158
br label %.if.end.6202
.if.end.6202:
br label %.if.end.6186
.if.false.6186:
br label %.if.end.6186
.if.end.6186:
br label %.if.end.6176
.if.false.6176:
br label %.if.end.6176
.if.end.6176:
%.tmp6207 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6208 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6207, i32 0, i32 1
%.tmp6209 = load %m0$.File.type*, %m0$.File.type** %.tmp6208
%.tmp6211 = getelementptr [21 x i8], [21 x i8]*@.str6210, i32 0, i32 0
%.tmp6212 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
%.tmp6213 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6212)
%.tmp6214 = load i8*, i8** %cast_fn.6158
%.tmp6215 = load i8*, i8** %from_type.6151
%.tmp6216 = load i8*, i8** %prev_id.6143
%.tmp6217 = load i8*, i8** %to_type.6155
%.tmp6218 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6209, i8* %.tmp6211, i8* %.tmp6213, i8* %.tmp6214, i8* %.tmp6215, i8* %.tmp6216, i8* %.tmp6217)
%.tmp6219 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
%.tmp6220 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6219, i32 0, i32 3
%.tmp6221 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6140
store %m1861$.Type.type* %.tmp6221, %m1861$.Type.type** %.tmp6220
br label %.if.end.6127
.if.false.6127:
br label %.if.end.6127
.if.end.6127:
%.tmp6222 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6113
ret %m1861$.AssignableInfo.type* %.tmp6222
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6223 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6224 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6223, i32 0, i32 0
%.tmp6225 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6224
%.tmp6226 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6225, i32 0, i32 0
%.tmp6227 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6226
%.tmp6228 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6227, i32 0, i32 0
%.tmp6229 = load i8*, i8** %.tmp6228
%.tmp6231 = getelementptr [16 x i8], [16 x i8]*@.str6230, i32 0, i32 0
%.tmp6232 = call i32(i8*,i8*) @strcmp(i8* %.tmp6229, i8* %.tmp6231)
%.tmp6233 = icmp eq i32 %.tmp6232, 0
br i1 %.tmp6233, label %.if.true.6234, label %.if.false.6234
.if.true.6234:
%.tmp6235 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6236 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6237 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6236, i32 0, i32 0
%.tmp6238 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6237
%.tmp6239 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6238, i32 0, i32 0
%.tmp6240 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6239
%.tmp6241 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6235, %m307$.Node.type* %.tmp6240)
ret %m1861$.AssignableInfo.type* %.tmp6241
br label %.if.end.6234
.if.false.6234:
br label %.if.end.6234
.if.end.6234:
%.tmp6242 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6243 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6242, i32 0, i32 0
%.tmp6244 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6243
%.tmp6245 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6244, i32 0, i32 0
%.tmp6246 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6245
%.tmp6247 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6246, i32 0, i32 6
%.tmp6248 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6247
%operator.6249 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6248, %m307$.Node.type** %operator.6249
%.tmp6250 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6251 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6250, i32 0, i32 0
%.tmp6252 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6253 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6252, i32 0, i32 0
%.tmp6254 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6253
%.tmp6255 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6254, i32 0, i32 1
%.tmp6256 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6255
store %m1988$.SYStack.type* %.tmp6256, %m1988$.SYStack.type** %.tmp6251
%.tmp6257 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6258 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6259 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6257, %m1861$.StackHead.type* %.tmp6258)
%A.6260 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6259, %m1861$.AssignableInfo.type** %A.6260
%.tmp6261 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6260
%.tmp6262 = icmp eq %m1861$.AssignableInfo.type* %.tmp6261, null
br i1 %.tmp6262, label %.if.true.6263, label %.if.false.6263
.if.true.6263:
%.tmp6264 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6260
ret %m1861$.AssignableInfo.type* %.tmp6264
br label %.if.end.6263
.if.false.6263:
br label %.if.end.6263
.if.end.6263:
%.tmp6265 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6266 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6265, i32 0, i32 0
%.tmp6267 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6268 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6267, i32 0, i32 0
%.tmp6269 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6268
%.tmp6270 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6269, i32 0, i32 1
%.tmp6271 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6270
store %m1988$.SYStack.type* %.tmp6271, %m1988$.SYStack.type** %.tmp6266
%.tmp6272 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6273 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6274 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6272, %m1861$.StackHead.type* %.tmp6273)
%B.6275 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6274, %m1861$.AssignableInfo.type** %B.6275
%.tmp6276 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6275
%.tmp6277 = icmp eq %m1861$.AssignableInfo.type* %.tmp6276, null
br i1 %.tmp6277, label %.if.true.6278, label %.if.false.6278
.if.true.6278:
%.tmp6279 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6275
ret %m1861$.AssignableInfo.type* %.tmp6279
br label %.if.end.6278
.if.false.6278:
br label %.if.end.6278
.if.end.6278:
%.tmp6280 = bitcast ptr null to %m307$.Node.type*
%.tmp6281 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6280)
%op_info.6282 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6281, %m1861$.AssignableInfo.type** %op_info.6282
%.tmp6283 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6282
%.tmp6284 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6283, i32 0, i32 3
%.tmp6285 = load %m307$.Node.type*, %m307$.Node.type** %operator.6249
%.tmp6286 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6285)
store %m1861$.Type.type* %.tmp6286, %m1861$.Type.type** %.tmp6284
%.tmp6287 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6288 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6282
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6287, %m1861$.AssignableInfo.type* %.tmp6288)
%.tmp6289 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6290 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6289, i32 0, i32 1
%.tmp6291 = load %m0$.File.type*, %m0$.File.type** %.tmp6290
%.tmp6293 = getelementptr [19 x i8], [19 x i8]*@.str6292, i32 0, i32 0
%.tmp6294 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6282
%.tmp6295 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6294)
%.tmp6296 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6297 = load %m307$.Node.type*, %m307$.Node.type** %operator.6249
%.tmp6298 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6296, %m307$.Node.type* %.tmp6297)
%.tmp6299 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6300 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6260
%.tmp6301 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6300, i32 0, i32 3
%.tmp6302 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6301
%.tmp6303 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6299, %m1861$.Type.type* %.tmp6302)
%.tmp6304 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6260
%.tmp6305 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6304)
%.tmp6306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6275
%.tmp6307 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6306)
%.tmp6308 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6291, i8* %.tmp6293, i8* %.tmp6295, i8* %.tmp6298, i8* %.tmp6303, i8* %.tmp6305, i8* %.tmp6307)
%.tmp6309 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6282
ret %m1861$.AssignableInfo.type* %.tmp6309
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6310 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6311 = icmp eq %m307$.Node.type* %.tmp6310, null
br i1 %.tmp6311, label %.if.true.6312, label %.if.false.6312
.if.true.6312:
%.tmp6313 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6314 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6316 = getelementptr [31 x i8], [31 x i8]*@.str6315, i32 0, i32 0
%.tmp6317 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6313, %m307$.Node.type* %.tmp6314, i8* %.tmp6316)
%.tmp6318 = call i32(i8*,...) @printf(i8* %.tmp6317)
br label %.if.end.6312
.if.false.6312:
br label %.if.end.6312
.if.end.6312:
%.tmp6319 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6320 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6319, i32 0, i32 1
%.tmp6321 = load i8*, i8** %.tmp6320
%.tmp6323 = getelementptr [2 x i8], [2 x i8]*@.str6322, i32 0, i32 0
%.tmp6324 = call i32(i8*,i8*) @strcmp(i8* %.tmp6321, i8* %.tmp6323)
%.tmp6325 = icmp eq i32 %.tmp6324, 0
br i1 %.tmp6325, label %.if.true.6326, label %.if.false.6326
.if.true.6326:
%.tmp6328 = getelementptr [4 x i8], [4 x i8]*@.str6327, i32 0, i32 0
ret i8* %.tmp6328
br label %.if.end.6326
.if.false.6326:
%.tmp6329 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6330 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6329, i32 0, i32 1
%.tmp6331 = load i8*, i8** %.tmp6330
%.tmp6333 = getelementptr [2 x i8], [2 x i8]*@.str6332, i32 0, i32 0
%.tmp6334 = call i32(i8*,i8*) @strcmp(i8* %.tmp6331, i8* %.tmp6333)
%.tmp6335 = icmp eq i32 %.tmp6334, 0
br i1 %.tmp6335, label %.if.true.6336, label %.if.false.6336
.if.true.6336:
%.tmp6338 = getelementptr [4 x i8], [4 x i8]*@.str6337, i32 0, i32 0
ret i8* %.tmp6338
br label %.if.end.6336
.if.false.6336:
%.tmp6339 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6340 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6339, i32 0, i32 1
%.tmp6341 = load i8*, i8** %.tmp6340
%.tmp6343 = getelementptr [2 x i8], [2 x i8]*@.str6342, i32 0, i32 0
%.tmp6344 = call i32(i8*,i8*) @strcmp(i8* %.tmp6341, i8* %.tmp6343)
%.tmp6345 = icmp eq i32 %.tmp6344, 0
br i1 %.tmp6345, label %.if.true.6346, label %.if.false.6346
.if.true.6346:
%.tmp6348 = getelementptr [4 x i8], [4 x i8]*@.str6347, i32 0, i32 0
ret i8* %.tmp6348
br label %.if.end.6346
.if.false.6346:
%.tmp6349 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6350 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6349, i32 0, i32 1
%.tmp6351 = load i8*, i8** %.tmp6350
%.tmp6353 = getelementptr [2 x i8], [2 x i8]*@.str6352, i32 0, i32 0
%.tmp6354 = call i32(i8*,i8*) @strcmp(i8* %.tmp6351, i8* %.tmp6353)
%.tmp6355 = icmp eq i32 %.tmp6354, 0
br i1 %.tmp6355, label %.if.true.6356, label %.if.false.6356
.if.true.6356:
%.tmp6358 = getelementptr [5 x i8], [5 x i8]*@.str6357, i32 0, i32 0
ret i8* %.tmp6358
br label %.if.end.6356
.if.false.6356:
%.tmp6359 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6360 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6359, i32 0, i32 1
%.tmp6361 = load i8*, i8** %.tmp6360
%.tmp6363 = getelementptr [3 x i8], [3 x i8]*@.str6362, i32 0, i32 0
%.tmp6364 = call i32(i8*,i8*) @strcmp(i8* %.tmp6361, i8* %.tmp6363)
%.tmp6365 = icmp eq i32 %.tmp6364, 0
br i1 %.tmp6365, label %.if.true.6366, label %.if.false.6366
.if.true.6366:
%.tmp6368 = getelementptr [8 x i8], [8 x i8]*@.str6367, i32 0, i32 0
ret i8* %.tmp6368
br label %.if.end.6366
.if.false.6366:
%.tmp6369 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6370 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6369, i32 0, i32 1
%.tmp6371 = load i8*, i8** %.tmp6370
%.tmp6373 = getelementptr [3 x i8], [3 x i8]*@.str6372, i32 0, i32 0
%.tmp6374 = call i32(i8*,i8*) @strcmp(i8* %.tmp6371, i8* %.tmp6373)
%.tmp6375 = icmp eq i32 %.tmp6374, 0
br i1 %.tmp6375, label %.if.true.6376, label %.if.false.6376
.if.true.6376:
%.tmp6378 = getelementptr [8 x i8], [8 x i8]*@.str6377, i32 0, i32 0
ret i8* %.tmp6378
br label %.if.end.6376
.if.false.6376:
%.tmp6379 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6380 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6379, i32 0, i32 1
%.tmp6381 = load i8*, i8** %.tmp6380
%.tmp6383 = getelementptr [2 x i8], [2 x i8]*@.str6382, i32 0, i32 0
%.tmp6384 = call i32(i8*,i8*) @strcmp(i8* %.tmp6381, i8* %.tmp6383)
%.tmp6385 = icmp eq i32 %.tmp6384, 0
br i1 %.tmp6385, label %.if.true.6386, label %.if.false.6386
.if.true.6386:
%.tmp6388 = getelementptr [9 x i8], [9 x i8]*@.str6387, i32 0, i32 0
ret i8* %.tmp6388
br label %.if.end.6386
.if.false.6386:
%.tmp6389 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6390 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6389, i32 0, i32 1
%.tmp6391 = load i8*, i8** %.tmp6390
%.tmp6393 = getelementptr [2 x i8], [2 x i8]*@.str6392, i32 0, i32 0
%.tmp6394 = call i32(i8*,i8*) @strcmp(i8* %.tmp6391, i8* %.tmp6393)
%.tmp6395 = icmp eq i32 %.tmp6394, 0
br i1 %.tmp6395, label %.if.true.6396, label %.if.false.6396
.if.true.6396:
%.tmp6398 = getelementptr [9 x i8], [9 x i8]*@.str6397, i32 0, i32 0
ret i8* %.tmp6398
br label %.if.end.6396
.if.false.6396:
%.tmp6399 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6400 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6399, i32 0, i32 1
%.tmp6401 = load i8*, i8** %.tmp6400
%.tmp6403 = getelementptr [2 x i8], [2 x i8]*@.str6402, i32 0, i32 0
%.tmp6404 = call i32(i8*,i8*) @strcmp(i8* %.tmp6401, i8* %.tmp6403)
%.tmp6405 = icmp eq i32 %.tmp6404, 0
br i1 %.tmp6405, label %.if.true.6406, label %.if.false.6406
.if.true.6406:
%.tmp6408 = getelementptr [4 x i8], [4 x i8]*@.str6407, i32 0, i32 0
ret i8* %.tmp6408
br label %.if.end.6406
.if.false.6406:
%.tmp6409 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6410 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6409, i32 0, i32 1
%.tmp6411 = load i8*, i8** %.tmp6410
%.tmp6413 = getelementptr [2 x i8], [2 x i8]*@.str6412, i32 0, i32 0
%.tmp6414 = call i32(i8*,i8*) @strcmp(i8* %.tmp6411, i8* %.tmp6413)
%.tmp6415 = icmp eq i32 %.tmp6414, 0
br i1 %.tmp6415, label %.if.true.6416, label %.if.false.6416
.if.true.6416:
%.tmp6418 = getelementptr [3 x i8], [3 x i8]*@.str6417, i32 0, i32 0
ret i8* %.tmp6418
br label %.if.end.6416
.if.false.6416:
%.tmp6419 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6420 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6419, i32 0, i32 1
%.tmp6421 = load i8*, i8** %.tmp6420
%.tmp6423 = getelementptr [3 x i8], [3 x i8]*@.str6422, i32 0, i32 0
%.tmp6424 = call i32(i8*,i8*) @strcmp(i8* %.tmp6421, i8* %.tmp6423)
%.tmp6425 = icmp eq i32 %.tmp6424, 0
br i1 %.tmp6425, label %.if.true.6426, label %.if.false.6426
.if.true.6426:
%.tmp6428 = getelementptr [9 x i8], [9 x i8]*@.str6427, i32 0, i32 0
ret i8* %.tmp6428
br label %.if.end.6426
.if.false.6426:
%.tmp6429 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6430 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6429, i32 0, i32 1
%.tmp6431 = load i8*, i8** %.tmp6430
%.tmp6433 = getelementptr [3 x i8], [3 x i8]*@.str6432, i32 0, i32 0
%.tmp6434 = call i32(i8*,i8*) @strcmp(i8* %.tmp6431, i8* %.tmp6433)
%.tmp6435 = icmp eq i32 %.tmp6434, 0
br i1 %.tmp6435, label %.if.true.6436, label %.if.false.6436
.if.true.6436:
%.tmp6438 = getelementptr [9 x i8], [9 x i8]*@.str6437, i32 0, i32 0
ret i8* %.tmp6438
br label %.if.end.6436
.if.false.6436:
%.tmp6439 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6440 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6442 = getelementptr [30 x i8], [30 x i8]*@.str6441, i32 0, i32 0
%.tmp6443 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6439, %m307$.Node.type* %.tmp6440, i8* %.tmp6442)
%.tmp6444 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6445 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6444, i32 0, i32 1
%.tmp6446 = load i8*, i8** %.tmp6445
%.tmp6447 = call i32(i8*,...) @printf(i8* %.tmp6443, i8* %.tmp6446)
br label %.if.end.6436
.if.end.6436:
br label %.if.end.6426
.if.end.6426:
br label %.if.end.6416
.if.end.6416:
br label %.if.end.6406
.if.end.6406:
br label %.if.end.6396
.if.end.6396:
br label %.if.end.6386
.if.end.6386:
br label %.if.end.6376
.if.end.6376:
br label %.if.end.6366
.if.end.6366:
br label %.if.end.6356
.if.end.6356:
br label %.if.end.6346
.if.end.6346:
br label %.if.end.6336
.if.end.6336:
br label %.if.end.6326
.if.end.6326:
%.tmp6449 = getelementptr [4 x i8], [4 x i8]*@.str6448, i32 0, i32 0
ret i8* %.tmp6449
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6450 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6451 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6450, %m1861$.Type.type** %type.6451
%.tmp6452 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6453 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6452, i32 0, i32 1
%.tmp6454 = load i8*, i8** %.tmp6453
%.tmp6456 = getelementptr [3 x i8], [3 x i8]*@.str6455, i32 0, i32 0
%.tmp6457 = call i32(i8*,i8*) @strcmp(i8* %.tmp6454, i8* %.tmp6456)
%.tmp6458 = icmp eq i32 %.tmp6457, 0
%.tmp6459 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6460 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6459, i32 0, i32 1
%.tmp6461 = load i8*, i8** %.tmp6460
%.tmp6463 = getelementptr [3 x i8], [3 x i8]*@.str6462, i32 0, i32 0
%.tmp6464 = call i32(i8*,i8*) @strcmp(i8* %.tmp6461, i8* %.tmp6463)
%.tmp6465 = icmp eq i32 %.tmp6464, 0
%.tmp6466 = or i1 %.tmp6458, %.tmp6465
%.tmp6467 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6468 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6467, i32 0, i32 1
%.tmp6469 = load i8*, i8** %.tmp6468
%.tmp6471 = getelementptr [2 x i8], [2 x i8]*@.str6470, i32 0, i32 0
%.tmp6472 = call i32(i8*,i8*) @strcmp(i8* %.tmp6469, i8* %.tmp6471)
%.tmp6473 = icmp eq i32 %.tmp6472, 0
%.tmp6474 = or i1 %.tmp6466, %.tmp6473
%.tmp6475 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6476 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6475, i32 0, i32 1
%.tmp6477 = load i8*, i8** %.tmp6476
%.tmp6479 = getelementptr [2 x i8], [2 x i8]*@.str6478, i32 0, i32 0
%.tmp6480 = call i32(i8*,i8*) @strcmp(i8* %.tmp6477, i8* %.tmp6479)
%.tmp6481 = icmp eq i32 %.tmp6480, 0
%.tmp6482 = or i1 %.tmp6474, %.tmp6481
%.tmp6483 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6484 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6483, i32 0, i32 1
%.tmp6485 = load i8*, i8** %.tmp6484
%.tmp6487 = getelementptr [2 x i8], [2 x i8]*@.str6486, i32 0, i32 0
%.tmp6488 = call i32(i8*,i8*) @strcmp(i8* %.tmp6485, i8* %.tmp6487)
%.tmp6489 = icmp eq i32 %.tmp6488, 0
%.tmp6490 = or i1 %.tmp6482, %.tmp6489
%.tmp6491 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6492 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6491, i32 0, i32 1
%.tmp6493 = load i8*, i8** %.tmp6492
%.tmp6495 = getelementptr [2 x i8], [2 x i8]*@.str6494, i32 0, i32 0
%.tmp6496 = call i32(i8*,i8*) @strcmp(i8* %.tmp6493, i8* %.tmp6495)
%.tmp6497 = icmp eq i32 %.tmp6496, 0
%.tmp6498 = or i1 %.tmp6490, %.tmp6497
%.tmp6499 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6500 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6499, i32 0, i32 1
%.tmp6501 = load i8*, i8** %.tmp6500
%.tmp6503 = getelementptr [3 x i8], [3 x i8]*@.str6502, i32 0, i32 0
%.tmp6504 = call i32(i8*,i8*) @strcmp(i8* %.tmp6501, i8* %.tmp6503)
%.tmp6505 = icmp eq i32 %.tmp6504, 0
%.tmp6506 = or i1 %.tmp6498, %.tmp6505
%.tmp6507 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6508 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6507, i32 0, i32 1
%.tmp6509 = load i8*, i8** %.tmp6508
%.tmp6511 = getelementptr [3 x i8], [3 x i8]*@.str6510, i32 0, i32 0
%.tmp6512 = call i32(i8*,i8*) @strcmp(i8* %.tmp6509, i8* %.tmp6511)
%.tmp6513 = icmp eq i32 %.tmp6512, 0
%.tmp6514 = or i1 %.tmp6506, %.tmp6513
br i1 %.tmp6514, label %.if.true.6515, label %.if.false.6515
.if.true.6515:
%.tmp6516 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6451
%.tmp6517 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6516, i32 0, i32 0
%.tmp6519 = getelementptr [5 x i8], [5 x i8]*@.str6518, i32 0, i32 0
store i8* %.tmp6519, i8** %.tmp6517
br label %.if.end.6515
.if.false.6515:
%.tmp6520 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6451
%.tmp6521 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6520, i32 0, i32 0
%.tmp6523 = getelementptr [4 x i8], [4 x i8]*@.str6522, i32 0, i32 0
store i8* %.tmp6523, i8** %.tmp6521
br label %.if.end.6515
.if.end.6515:
%.tmp6524 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6451
ret %m1861$.Type.type* %.tmp6524
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6525 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6526 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6525, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6527 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6528 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6527, %m307$.Node.type** %mono.6528
%err_buf.6529 = alloca i8*
store i8* null, i8** %err_buf.6529
%buf.6530 = alloca i8*
store i8* null, i8** %buf.6530
%.tmp6531 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6532 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6531, i32 0, i32 6
%.tmp6533 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6532
%.tmp6534 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6533, i32 0, i32 0
%.tmp6535 = load i8*, i8** %.tmp6534
%.tmp6537 = getelementptr [7 x i8], [7 x i8]*@.str6536, i32 0, i32 0
%.tmp6538 = call i32(i8*,i8*) @strcmp(i8* %.tmp6535, i8* %.tmp6537)
%.tmp6539 = icmp eq i32 %.tmp6538, 0
br i1 %.tmp6539, label %.if.true.6540, label %.if.false.6540
.if.true.6540:
%.tmp6541 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6542 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6541)
store %m1861$.AssignableInfo.type* %.tmp6542, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6543 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6544 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6543, i32 0, i32 3
%.tmp6545 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6545, %m1861$.Type.type** %.tmp6544
%.tmp6546 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6547 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6546, i32 0, i32 3
%.tmp6548 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6547
%.tmp6549 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6548, i32 0, i32 0
%.tmp6551 = getelementptr [4 x i8], [4 x i8]*@.str6550, i32 0, i32 0
store i8* %.tmp6551, i8** %.tmp6549
%.tmp6552 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6553 = load i8, i8* @SCOPE_CONST
%.tmp6554 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6555 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6554, i32 0, i32 6
%.tmp6556 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6555
%.tmp6557 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6556, i32 0, i32 1
%.tmp6558 = load i8*, i8** %.tmp6557
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6552, i8 %.tmp6553, i8* %.tmp6558)
br label %.if.end.6540
.if.false.6540:
%.tmp6559 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6560 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6559, i32 0, i32 6
%.tmp6561 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6560
%.tmp6562 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6561, i32 0, i32 0
%.tmp6563 = load i8*, i8** %.tmp6562
%.tmp6565 = getelementptr [5 x i8], [5 x i8]*@.str6564, i32 0, i32 0
%.tmp6566 = call i32(i8*,i8*) @strcmp(i8* %.tmp6563, i8* %.tmp6565)
%.tmp6567 = icmp eq i32 %.tmp6566, 0
br i1 %.tmp6567, label %.if.true.6568, label %.if.false.6568
.if.true.6568:
%.tmp6569 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6570 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6569, i32 0, i32 6
%.tmp6571 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6570
%.tmp6572 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6571, i32 0, i32 1
%.tmp6573 = load i8*, i8** %.tmp6572
%.tmp6575 = getelementptr [5 x i8], [5 x i8]*@.str6574, i32 0, i32 0
%.tmp6576 = call i32(i8*,i8*) @strcmp(i8* %.tmp6573, i8* %.tmp6575)
%.tmp6577 = icmp ne i32 %.tmp6576, 0
br i1 %.tmp6577, label %.if.true.6578, label %.if.false.6578
.if.true.6578:
%.tmp6579 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6580 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6582 = getelementptr [42 x i8], [42 x i8]*@.str6581, i32 0, i32 0
%.tmp6583 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6579, %m307$.Node.type* %.tmp6580, i8* %.tmp6582)
%.tmp6584 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6585 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6584, i32 0, i32 6
%.tmp6586 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6585
%.tmp6587 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6586, i32 0, i32 1
%.tmp6588 = load i8*, i8** %.tmp6587
%.tmp6589 = call i32(i8*,...) @printf(i8* %.tmp6583, i8* %.tmp6588)
%.tmp6590 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6590
br label %.if.end.6578
.if.false.6578:
br label %.if.end.6578
.if.end.6578:
%.tmp6591 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6592 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6591)
store %m1861$.AssignableInfo.type* %.tmp6592, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6593 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6594 = load i8, i8* @SCOPE_CONST
%.tmp6596 = getelementptr [5 x i8], [5 x i8]*@.str6595, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6593, i8 %.tmp6594, i8* %.tmp6596)
%.tmp6597 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6598 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6597, i32 0, i32 3
%.tmp6599 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6599, %m1861$.Type.type** %.tmp6598
%.tmp6600 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6601 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6600, i32 0, i32 3
%.tmp6602 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6601
%.tmp6603 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6602, i32 0, i32 0
%.tmp6605 = getelementptr [8 x i8], [8 x i8]*@.str6604, i32 0, i32 0
store i8* %.tmp6605, i8** %.tmp6603
br label %.if.end.6568
.if.false.6568:
%.tmp6606 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6607 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6606, i32 0, i32 6
%.tmp6608 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6607
%.tmp6609 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6608, i32 0, i32 0
%.tmp6610 = load i8*, i8** %.tmp6609
%.tmp6612 = getelementptr [17 x i8], [17 x i8]*@.str6611, i32 0, i32 0
%.tmp6613 = call i32(i8*,i8*) @strcmp(i8* %.tmp6610, i8* %.tmp6612)
%.tmp6614 = icmp eq i32 %.tmp6613, 0
br i1 %.tmp6614, label %.if.true.6615, label %.if.false.6615
.if.true.6615:
%.tmp6616 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6617 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6616)
store %m1861$.AssignableInfo.type* %.tmp6617, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6618 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6619 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6618, i32 0, i32 6
%.tmp6620 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6619
%.tmp6621 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6620, i32 0, i32 6
%.tmp6622 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6621
%.tmp6624 = getelementptr [12 x i8], [12 x i8]*@.str6623, i32 0, i32 0
%.tmp6625 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6622, i8* %.tmp6624)
%dest.6626 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6625, %m307$.Node.type** %dest.6626
%.tmp6627 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6628 = load %m307$.Node.type*, %m307$.Node.type** %dest.6626
%.tmp6629 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6627, %m307$.Node.type* %.tmp6628)
%var_info.6630 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6629, %m1861$.AssignableInfo.type** %var_info.6630
%.tmp6631 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6630
%.tmp6632 = icmp eq %m1861$.AssignableInfo.type* %.tmp6631, null
br i1 %.tmp6632, label %.if.true.6633, label %.if.false.6633
.if.true.6633:
%.tmp6634 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
ret %m1861$.AssignableInfo.type* %.tmp6634
br label %.if.end.6633
.if.false.6633:
br label %.if.end.6633
.if.end.6633:
%.tmp6635 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6636 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6630
%.tmp6637 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6636, i32 0, i32 3
%.tmp6638 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6637
%.tmp6639 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6635, %m1861$.Type.type* %.tmp6638)
%var_type_repr.6640 = alloca i8*
store i8* %.tmp6639, i8** %var_type_repr.6640
%.tmp6641 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6642 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6641, %m1861$.AssignableInfo.type* %.tmp6642)
%.tmp6643 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6644 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6643, i32 0, i32 3
%.tmp6645 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6630
%.tmp6646 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6645, i32 0, i32 3
%.tmp6647 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6646
store %m1861$.Type.type* %.tmp6647, %m1861$.Type.type** %.tmp6644
%.tmp6649 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6650 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6649, i32 0, i32 6
%.tmp6651 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6650
%.tmp6652 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6651, i32 0, i32 6
%.tmp6653 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6652
%ptr.6654 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6653, %m307$.Node.type** %ptr.6654
br label %.for.start.6648
.for.start.6648:
%.tmp6655 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6654
%.tmp6656 = load %m307$.Node.type*, %m307$.Node.type** %dest.6626
%.tmp6657 = icmp ne %m307$.Node.type* %.tmp6655, %.tmp6656
br i1 %.tmp6657, label %.for.continue.6648, label %.for.end.6648
.for.continue.6648:
%.tmp6658 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6659 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6658, %m1861$.Type.type** %type.6659
%.tmp6660 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6659
%.tmp6661 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6660, i32 0, i32 3
%.tmp6662 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6663 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6662, i32 0, i32 3
%.tmp6664 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6663
store %m1861$.Type.type* %.tmp6664, %m1861$.Type.type** %.tmp6661
%.tmp6665 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6659
%.tmp6666 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6665, i32 0, i32 0
%.tmp6668 = getelementptr [4 x i8], [4 x i8]*@.str6667, i32 0, i32 0
store i8* %.tmp6668, i8** %.tmp6666
%.tmp6669 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6670 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6669, i32 0, i32 3
%.tmp6671 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6659
store %m1861$.Type.type* %.tmp6671, %m1861$.Type.type** %.tmp6670
%.tmp6672 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6654
%.tmp6673 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6672, i32 0, i32 7
%.tmp6674 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6673
store %m307$.Node.type* %.tmp6674, %m307$.Node.type** %ptr.6654
br label %.for.start.6648
.for.end.6648:
%.tmp6675 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6676 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6675, i32 0, i32 6
%.tmp6677 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6676
%.tmp6678 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6677, i32 0, i32 6
%.tmp6679 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6678
%.tmp6680 = load %m307$.Node.type*, %m307$.Node.type** %dest.6626
%.tmp6681 = icmp ne %m307$.Node.type* %.tmp6679, %.tmp6680
br i1 %.tmp6681, label %.if.true.6682, label %.if.false.6682
.if.true.6682:
%.tmp6683 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6684 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6683, i32 0, i32 1
%.tmp6685 = load %m0$.File.type*, %m0$.File.type** %.tmp6684
%.tmp6687 = getelementptr [38 x i8], [38 x i8]*@.str6686, i32 0, i32 0
%.tmp6688 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6689 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6688)
%.tmp6690 = load i8*, i8** %var_type_repr.6640
%.tmp6691 = load i8*, i8** %var_type_repr.6640
%.tmp6692 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6630
%.tmp6693 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6692)
%.tmp6694 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6685, i8* %.tmp6687, i8* %.tmp6689, i8* %.tmp6690, i8* %.tmp6691, i8* %.tmp6693)
br label %.if.end.6682
.if.false.6682:
%.tmp6695 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6696 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6695, i32 0, i32 1
%.tmp6697 = load %m0$.File.type*, %m0$.File.type** %.tmp6696
%.tmp6699 = getelementptr [22 x i8], [22 x i8]*@.str6698, i32 0, i32 0
%.tmp6700 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6701 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6700)
%.tmp6702 = load i8*, i8** %var_type_repr.6640
%.tmp6703 = load i8*, i8** %var_type_repr.6640
%.tmp6704 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6630
%.tmp6705 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6704)
%.tmp6706 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6697, i8* %.tmp6699, i8* %.tmp6701, i8* %.tmp6702, i8* %.tmp6703, i8* %.tmp6705)
br label %.if.end.6682
.if.end.6682:
br label %.if.end.6615
.if.false.6615:
%.tmp6707 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6708 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6707, i32 0, i32 6
%.tmp6709 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6708
%.tmp6710 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6709, i32 0, i32 0
%.tmp6711 = load i8*, i8** %.tmp6710
%.tmp6713 = getelementptr [8 x i8], [8 x i8]*@.str6712, i32 0, i32 0
%.tmp6714 = call i32(i8*,i8*) @strcmp(i8* %.tmp6711, i8* %.tmp6713)
%.tmp6715 = icmp eq i32 %.tmp6714, 0
br i1 %.tmp6715, label %.if.true.6716, label %.if.false.6716
.if.true.6716:
%.tmp6717 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6718 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6717)
store %m1861$.AssignableInfo.type* %.tmp6718, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6719 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6720 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6719, i32 0, i32 3
%.tmp6721 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6721, %m1861$.Type.type** %.tmp6720
%.tmp6722 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6723 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6722, i32 0, i32 3
%.tmp6724 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6723
%.tmp6725 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6724, i32 0, i32 0
%.tmp6727 = getelementptr [5 x i8], [5 x i8]*@.str6726, i32 0, i32 0
store i8* %.tmp6727, i8** %.tmp6725
%.tmp6728 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6729 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6728, i32 0, i32 6
%.tmp6730 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6729
%.tmp6731 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6730, i32 0, i32 6
%.tmp6732 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6731
%.tmp6733 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6732, i32 0, i32 1
%.tmp6734 = load i8*, i8** %.tmp6733
%.tmp6736 = getelementptr [6 x i8], [6 x i8]*@.str6735, i32 0, i32 0
%.tmp6737 = call i32(i8*,i8*) @strcmp(i8* %.tmp6734, i8* %.tmp6736)
%.tmp6738 = icmp eq i32 %.tmp6737, 0
br i1 %.tmp6738, label %.if.true.6739, label %.if.false.6739
.if.true.6739:
%.tmp6740 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6741 = load i8, i8* @SCOPE_CONST
%.tmp6743 = getelementptr [2 x i8], [2 x i8]*@.str6742, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6740, i8 %.tmp6741, i8* %.tmp6743)
br label %.if.end.6739
.if.false.6739:
%.tmp6744 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6745 = load i8, i8* @SCOPE_CONST
%.tmp6747 = getelementptr [2 x i8], [2 x i8]*@.str6746, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6744, i8 %.tmp6745, i8* %.tmp6747)
br label %.if.end.6739
.if.end.6739:
br label %.if.end.6716
.if.false.6716:
%.tmp6748 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6749 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6748, i32 0, i32 6
%.tmp6750 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6749
%.tmp6751 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6750, i32 0, i32 0
%.tmp6752 = load i8*, i8** %.tmp6751
%.tmp6754 = getelementptr [8 x i8], [8 x i8]*@.str6753, i32 0, i32 0
%.tmp6755 = call i32(i8*,i8*) @strcmp(i8* %.tmp6752, i8* %.tmp6754)
%.tmp6756 = icmp eq i32 %.tmp6755, 0
br i1 %.tmp6756, label %.if.true.6757, label %.if.false.6757
.if.true.6757:
%.tmp6758 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6759 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6760 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6759, i32 0, i32 6
%.tmp6761 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6760
%.tmp6762 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6761, i32 0, i32 6
%.tmp6763 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6762
%.tmp6764 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6758, %m307$.Node.type* %.tmp6763)
store %m1861$.AssignableInfo.type* %.tmp6764, %m1861$.AssignableInfo.type** %assignable_info.6526
br label %.if.end.6757
.if.false.6757:
%.tmp6765 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6766 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6765, i32 0, i32 6
%.tmp6767 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6766
%.tmp6768 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6767, i32 0, i32 0
%.tmp6769 = load i8*, i8** %.tmp6768
%.tmp6771 = getelementptr [7 x i8], [7 x i8]*@.str6770, i32 0, i32 0
%.tmp6772 = call i32(i8*,i8*) @strcmp(i8* %.tmp6769, i8* %.tmp6771)
%.tmp6773 = icmp eq i32 %.tmp6772, 0
br i1 %.tmp6773, label %.if.true.6774, label %.if.false.6774
.if.true.6774:
%.tmp6775 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6776 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6777 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6776, i32 0, i32 6
%.tmp6778 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6777
%.tmp6779 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6778, i32 0, i32 1
%.tmp6780 = load i8*, i8** %.tmp6779
%.tmp6781 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp6775, i8* %.tmp6780)
%string_info.6782 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6781, %m1861$.AssignableInfo.type** %string_info.6782
%.tmp6783 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6784 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6783)
store %m1861$.AssignableInfo.type* %.tmp6784, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6786 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6785, %m1861$.AssignableInfo.type* %.tmp6786)
%.tmp6787 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6788 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6782
%.tmp6789 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6788, i32 0, i32 3
%.tmp6790 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6789
%.tmp6791 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6787, %m1861$.Type.type* %.tmp6790)
%str_tr.6792 = alloca i8*
store i8* %.tmp6791, i8** %str_tr.6792
%.tmp6793 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6794 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6793, i32 0, i32 1
%.tmp6795 = load %m0$.File.type*, %m0$.File.type** %.tmp6794
%.tmp6797 = getelementptr [44 x i8], [44 x i8]*@.str6796, i32 0, i32 0
%.tmp6798 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6799 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6798)
%.tmp6800 = load i8*, i8** %str_tr.6792
%.tmp6801 = load i8*, i8** %str_tr.6792
%.tmp6802 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6782
%.tmp6803 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6802)
%.tmp6804 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6795, i8* %.tmp6797, i8* %.tmp6799, i8* %.tmp6800, i8* %.tmp6801, i8* %.tmp6803)
%.tmp6805 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6806 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6805, i32 0, i32 3
%.tmp6807 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6807, %m1861$.Type.type** %.tmp6806
%.tmp6808 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6809 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6808, i32 0, i32 3
%.tmp6810 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6809
%.tmp6811 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6810, i32 0, i32 0
%.tmp6813 = getelementptr [4 x i8], [4 x i8]*@.str6812, i32 0, i32 0
store i8* %.tmp6813, i8** %.tmp6811
%.tmp6814 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6815 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6814, i32 0, i32 3
%.tmp6816 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6815
%.tmp6817 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6816, i32 0, i32 3
%.tmp6818 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6818, %m1861$.Type.type** %.tmp6817
%.tmp6819 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6820 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6819, i32 0, i32 3
%.tmp6821 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6820
%.tmp6822 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6821, i32 0, i32 3
%.tmp6823 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6822
%.tmp6824 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6823, i32 0, i32 0
%.tmp6826 = getelementptr [4 x i8], [4 x i8]*@.str6825, i32 0, i32 0
store i8* %.tmp6826, i8** %.tmp6824
br label %.if.end.6774
.if.false.6774:
%.tmp6827 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6828 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6827, i32 0, i32 6
%.tmp6829 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6828
%.tmp6830 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6829, i32 0, i32 0
%.tmp6831 = load i8*, i8** %.tmp6830
%.tmp6833 = getelementptr [4 x i8], [4 x i8]*@.str6832, i32 0, i32 0
%.tmp6834 = call i32(i8*,i8*) @strcmp(i8* %.tmp6831, i8* %.tmp6833)
%.tmp6835 = icmp eq i32 %.tmp6834, 0
br i1 %.tmp6835, label %.if.true.6836, label %.if.false.6836
.if.true.6836:
%.tmp6837 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6838 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6837)
store %m1861$.AssignableInfo.type* %.tmp6838, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6839 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6840 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6839, i32 0, i32 6
%.tmp6841 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6840
%.tmp6842 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6841, i32 0, i32 1
%.tmp6843 = load i8*, i8** %.tmp6842
%.tmp6844 = call i32(i8*) @strlen(i8* %.tmp6843)
%chr_len.6845 = alloca i32
store i32 %.tmp6844, i32* %chr_len.6845
%.tmp6846 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6847 = load i8, i8* @SCOPE_CONST
%.tmp6849 = getelementptr [2 x i8], [2 x i8]*@.str6848, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6846, i8 %.tmp6847, i8* %.tmp6849)
%.tmp6850 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6851 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6850, i32 0, i32 0
%.tmp6852 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6853 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6852, i32 0, i32 6
%.tmp6854 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6853
%.tmp6855 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6854, i32 0, i32 1
%.tmp6856 = load i8*, i8** %.tmp6855
%.tmp6857 = call i8*(i8*) @m2225$chr_to_llvm.cp.cp(i8* %.tmp6856)
store i8* %.tmp6857, i8** %.tmp6851
%.tmp6858 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6859 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6858, i32 0, i32 0
%.tmp6860 = load i8*, i8** %.tmp6859
%.tmp6861 = icmp eq i8* %.tmp6860, null
br i1 %.tmp6861, label %.if.true.6862, label %.if.false.6862
.if.true.6862:
%.tmp6863 = getelementptr i8*, i8** %err_buf.6529, i32 0
%.tmp6865 = getelementptr [22 x i8], [22 x i8]*@.str6864, i32 0, i32 0
%.tmp6866 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6867 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6866, i32 0, i32 6
%.tmp6868 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6867
%.tmp6869 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6868, i32 0, i32 1
%.tmp6870 = load i8*, i8** %.tmp6869
%.tmp6871 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6863, i8* %.tmp6865, i8* %.tmp6870)
%.tmp6872 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6872
br label %.if.end.6862
.if.false.6862:
br label %.if.end.6862
.if.end.6862:
%.tmp6873 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6874 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6873, i32 0, i32 3
%.tmp6875 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6875, %m1861$.Type.type** %.tmp6874
%.tmp6876 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6877 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6876, i32 0, i32 3
%.tmp6878 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6877
%.tmp6879 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6878, i32 0, i32 0
%.tmp6881 = getelementptr [4 x i8], [4 x i8]*@.str6880, i32 0, i32 0
store i8* %.tmp6881, i8** %.tmp6879
br label %.if.end.6836
.if.false.6836:
%.tmp6882 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6883 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6885 = getelementptr [40 x i8], [40 x i8]*@.str6884, i32 0, i32 0
%.tmp6886 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6882, %m307$.Node.type* %.tmp6883, i8* %.tmp6885)
%.tmp6887 = load %m307$.Node.type*, %m307$.Node.type** %mono.6528
%.tmp6888 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6887, i32 0, i32 6
%.tmp6889 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6888
%.tmp6890 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6889, i32 0, i32 0
%.tmp6891 = load i8*, i8** %.tmp6890
%.tmp6892 = call i32(i8*,...) @printf(i8* %.tmp6886, i8* %.tmp6891)
%.tmp6893 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6893
br label %.if.end.6836
.if.end.6836:
br label %.if.end.6774
.if.end.6774:
br label %.if.end.6757
.if.end.6757:
br label %.if.end.6716
.if.end.6716:
br label %.if.end.6615
.if.end.6615:
br label %.if.end.6568
.if.end.6568:
br label %.if.end.6540
.if.end.6540:
%.tmp6894 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6895 = icmp eq %m1861$.AssignableInfo.type* %.tmp6894, null
br i1 %.tmp6895, label %.if.true.6896, label %.if.false.6896
.if.true.6896:
%.tmp6897 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6897
br label %.if.end.6896
.if.false.6896:
br label %.if.end.6896
.if.end.6896:
%.tmp6898 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6899 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6898, i32 0, i32 4
%.tmp6900 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6900, i32 0, i32 3
%.tmp6902 = load i32, i32* %.tmp6901
store i32 %.tmp6902, i32* %.tmp6899
%.tmp6903 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6904 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6903, i32 0, i32 5
%.tmp6905 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6906 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6905, i32 0, i32 4
%.tmp6907 = load i32, i32* %.tmp6906
store i32 %.tmp6907, i32* %.tmp6904
%.tmp6908 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6526
%.tmp6909 = bitcast %m1861$.AssignableInfo.type* %.tmp6908 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6909
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp6910 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6911 = icmp ne %m1861$.Type.type* %.tmp6910, null
%.tmp6913 = getelementptr [22 x i8], [22 x i8]*@.str6912, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6911, i8* %.tmp6913)
%.tmp6914 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6915 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6914, i32 0, i32 0
%.tmp6916 = load i8*, i8** %.tmp6915
%.tmp6917 = icmp ne i8* %.tmp6916, null
%.tmp6919 = getelementptr [59 x i8], [59 x i8]*@.str6918, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6917, i8* %.tmp6919)
%.tmp6920 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6921 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6920, i32 0, i32 0
%.tmp6922 = load i8*, i8** %.tmp6921
%.tmp6924 = getelementptr [4 x i8], [4 x i8]*@.str6923, i32 0, i32 0
%.tmp6925 = call i32(i8*,i8*) @strcmp(i8* %.tmp6922, i8* %.tmp6924)
%.tmp6926 = icmp eq i32 %.tmp6925, 0
br i1 %.tmp6926, label %.if.true.6927, label %.if.false.6927
.if.true.6927:
%.tmp6929 = getelementptr [2 x i8], [2 x i8]*@.str6928, i32 0, i32 0
ret i8* %.tmp6929
br label %.if.end.6927
.if.false.6927:
%.tmp6930 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6931 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6930, i32 0, i32 0
%.tmp6932 = load i8*, i8** %.tmp6931
%.tmp6934 = getelementptr [5 x i8], [5 x i8]*@.str6933, i32 0, i32 0
%.tmp6935 = call i32(i8*,i8*) @strcmp(i8* %.tmp6932, i8* %.tmp6934)
%.tmp6936 = icmp eq i32 %.tmp6935, 0
br i1 %.tmp6936, label %.if.true.6937, label %.if.false.6937
.if.true.6937:
%.tmp6939 = getelementptr [2 x i8], [2 x i8]*@.str6938, i32 0, i32 0
ret i8* %.tmp6939
br label %.if.end.6937
.if.false.6937:
%.tmp6940 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6941 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6940, i32 0, i32 0
%.tmp6942 = load i8*, i8** %.tmp6941
%.tmp6944 = getelementptr [5 x i8], [5 x i8]*@.str6943, i32 0, i32 0
%.tmp6945 = call i32(i8*,i8*) @strcmp(i8* %.tmp6942, i8* %.tmp6944)
%.tmp6946 = icmp eq i32 %.tmp6945, 0
br i1 %.tmp6946, label %.if.true.6947, label %.if.false.6947
.if.true.6947:
%.tmp6949 = getelementptr [2 x i8], [2 x i8]*@.str6948, i32 0, i32 0
ret i8* %.tmp6949
br label %.if.end.6947
.if.false.6947:
%.tmp6950 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6951 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6950, i32 0, i32 0
%.tmp6952 = load i8*, i8** %.tmp6951
%.tmp6954 = getelementptr [4 x i8], [4 x i8]*@.str6953, i32 0, i32 0
%.tmp6955 = call i32(i8*,i8*) @strcmp(i8* %.tmp6952, i8* %.tmp6954)
%.tmp6956 = icmp eq i32 %.tmp6955, 0
br i1 %.tmp6956, label %.if.true.6957, label %.if.false.6957
.if.true.6957:
%.tmp6959 = getelementptr [2 x i8], [2 x i8]*@.str6958, i32 0, i32 0
ret i8* %.tmp6959
br label %.if.end.6957
.if.false.6957:
%.tmp6960 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6961 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6960, i32 0, i32 0
%.tmp6962 = load i8*, i8** %.tmp6961
%.tmp6964 = getelementptr [4 x i8], [4 x i8]*@.str6963, i32 0, i32 0
%.tmp6965 = call i32(i8*,i8*) @strcmp(i8* %.tmp6962, i8* %.tmp6964)
%.tmp6966 = icmp eq i32 %.tmp6965, 0
br i1 %.tmp6966, label %.if.true.6967, label %.if.false.6967
.if.true.6967:
%buf.6968 = alloca i8*
store i8* null, i8** %buf.6968
%.tmp6969 = getelementptr i8*, i8** %buf.6968, i32 0
%.tmp6971 = getelementptr [4 x i8], [4 x i8]*@.str6970, i32 0, i32 0
%.tmp6972 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6973 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6972, i32 0, i32 3
%.tmp6974 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6973
%.tmp6975 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp6974)
%.tmp6976 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6969, i8* %.tmp6971, i8* %.tmp6975)
%.tmp6977 = load i8*, i8** %buf.6968
ret i8* %.tmp6977
br label %.if.end.6967
.if.false.6967:
%.tmp6978 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6979 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6978, i32 0, i32 0
%.tmp6980 = load i8*, i8** %.tmp6979
%.tmp6982 = getelementptr [10 x i8], [10 x i8]*@.str6981, i32 0, i32 0
%.tmp6983 = call i32(i8*,i8*) @strcmp(i8* %.tmp6980, i8* %.tmp6982)
%.tmp6984 = icmp eq i32 %.tmp6983, 0
br i1 %.tmp6984, label %.if.true.6985, label %.if.false.6985
.if.true.6985:
%.tmp6986 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6987 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6986, i32 0, i32 2
%.tmp6988 = load i8*, i8** %.tmp6987
ret i8* %.tmp6988
br label %.if.end.6985
.if.false.6985:
%.tmp6989 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6990 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6989, i32 0, i32 0
%.tmp6991 = load i8*, i8** %.tmp6990
%.tmp6993 = getelementptr [6 x i8], [6 x i8]*@.str6992, i32 0, i32 0
%.tmp6994 = call i32(i8*,i8*) @strcmp(i8* %.tmp6991, i8* %.tmp6993)
%.tmp6995 = icmp eq i32 %.tmp6994, 0
br i1 %.tmp6995, label %.if.true.6996, label %.if.false.6996
.if.true.6996:
%.tmp6998 = getelementptr [2 x i8], [2 x i8]*@.str6997, i32 0, i32 0
ret i8* %.tmp6998
br label %.if.end.6996
.if.false.6996:
%.tmp7000 = getelementptr [44 x i8], [44 x i8]*@.str6999, i32 0, i32 0
%.tmp7001 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7002 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7001, i32 0, i32 0
%.tmp7003 = load i8*, i8** %.tmp7002
%.tmp7004 = call i32(i8*,...) @printf(i8* %.tmp7000, i8* %.tmp7003)
br label %.if.end.6996
.if.end.6996:
br label %.if.end.6985
.if.end.6985:
br label %.if.end.6967
.if.end.6967:
br label %.if.end.6957
.if.end.6957:
br label %.if.end.6947
.if.end.6947:
br label %.if.end.6937
.if.end.6937:
br label %.if.end.6927
.if.end.6927:
%.tmp7005 = bitcast ptr null to i8*
ret i8* %.tmp7005
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7006 = bitcast ptr null to %m307$.Node.type*
%.tmp7007 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7006)
%info.7008 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7007, %m1861$.AssignableInfo.type** %info.7008
%tmp_buff.7009 = alloca i8*
store i8* null, i8** %tmp_buff.7009
%.tmp7010 = getelementptr i8*, i8** %tmp_buff.7009, i32 0
%.tmp7012 = getelementptr [7 x i8], [7 x i8]*@.str7011, i32 0, i32 0
%.tmp7013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7014 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7013)
%.tmp7015 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7010, i8* %.tmp7012, i32 %.tmp7014)
%.tmp7016 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7017 = load i8, i8* @SCOPE_GLOBAL
%.tmp7018 = load i8*, i8** %tmp_buff.7009
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7016, i8 %.tmp7017, i8* %.tmp7018)
%.tmp7019 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7020 = ptrtoint %m1861$.GlobalName.type* %.tmp7019 to i32
%.tmp7021 = call i8*(i32) @malloc(i32 %.tmp7020)
%.tmp7022 = bitcast i8* %.tmp7021 to %m1861$.GlobalName.type*
%global.7023 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7022, %m1861$.GlobalName.type** %global.7023
%.tmp7024 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
%.tmp7025 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7024, i32 0, i32 0
%.tmp7026 = load i8*, i8** %text
%.tmp7027 = call i8*(i8*) @m2225$string_to_llvm.cp.cp(i8* %.tmp7026)
store i8* %.tmp7027, i8** %.tmp7025
%.tmp7028 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7029 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7028, i32 0, i32 3
%.tmp7030 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7030, %m1861$.Type.type** %.tmp7029
%.tmp7031 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7032 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7031, i32 0, i32 3
%.tmp7033 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7032
%.tmp7034 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7033, i32 0, i32 0
%.tmp7036 = getelementptr [6 x i8], [6 x i8]*@.str7035, i32 0, i32 0
store i8* %.tmp7036, i8** %.tmp7034
%.tmp7037 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7038 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7037, i32 0, i32 3
%.tmp7039 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7038
%.tmp7040 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7039, i32 0, i32 3
%.tmp7041 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7041, %m1861$.Type.type** %.tmp7040
%.tmp7042 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7043 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7042, i32 0, i32 3
%.tmp7044 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7043
%.tmp7045 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7044, i32 0, i32 3
%.tmp7046 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7045
%.tmp7047 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7046, i32 0, i32 0
%.tmp7049 = getelementptr [4 x i8], [4 x i8]*@.str7048, i32 0, i32 0
store i8* %.tmp7049, i8** %.tmp7047
%.tmp7050 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7051 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7050, i32 0, i32 3
%.tmp7052 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7051
%.tmp7053 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7052, i32 0, i32 3
%.tmp7054 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7053
%.tmp7055 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7054, i32 0, i32 4
%.tmp7056 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7056, %m1861$.Type.type** %.tmp7055
%.tmp7057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
%.tmp7058 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7057, i32 0, i32 3
%.tmp7059 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7058
%.tmp7060 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7059, i32 0, i32 3
%.tmp7061 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7060
%.tmp7062 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7061, i32 0, i32 4
%.tmp7063 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7062
%.tmp7064 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7063, i32 0, i32 0
%.tmp7065 = getelementptr i8*, i8** %.tmp7064, i32 0
%.tmp7067 = getelementptr [3 x i8], [3 x i8]*@.str7066, i32 0, i32 0
%.tmp7068 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
%.tmp7069 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7068, i32 0, i32 0
%.tmp7070 = load i8*, i8** %.tmp7069
%.tmp7071 = call i32(i8*) @m2225$llvm_str_len.i.cp(i8* %.tmp7070)
%.tmp7072 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7065, i8* %.tmp7067, i32 %.tmp7071)
%.tmp7073 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
%.tmp7074 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7073, i32 0, i32 1
%.tmp7076 = getelementptr [7 x i8], [7 x i8]*@.str7075, i32 0, i32 0
store i8* %.tmp7076, i8** %.tmp7074
%.tmp7077 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
%.tmp7078 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7077, i32 0, i32 4
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7078
%.tmp7079 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
%.tmp7080 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7079, i32 0, i32 3
%.tmp7081 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
store %m1861$.AssignableInfo.type* %.tmp7081, %m1861$.AssignableInfo.type** %.tmp7080
%.tmp7082 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
%.tmp7083 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7082, i32 0, i32 2
store i1 0, i1* %.tmp7083
%.tmp7084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7085 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7023
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7084, %m1861$.GlobalName.type* %.tmp7085)
%.tmp7086 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7008
ret %m1861$.AssignableInfo.type* %.tmp7086
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
%.tmp7087 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7088 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7087)
%info.7089 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7088, %m1861$.AssignableInfo.type** %info.7089
%.tmp7090 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7089
%.tmp7091 = load i8, i8* @SCOPE_CONST
%.tmp7092 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7090, i8 %.tmp7091, i8* %.tmp7092)
%.tmp7093 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7089
%.tmp7094 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7093, i32 0, i32 2
%.tmp7096 = getelementptr [7 x i8], [7 x i8]*@.str7095, i32 0, i32 0
store i8* %.tmp7096, i8** %.tmp7094
%.tmp7097 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7089
%.tmp7098 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7097, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7098
%.tmp7099 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7100 = load i8*, i8** %as_name
%.tmp7101 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7089
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7099, i8* %.tmp7100, %m1861$.AssignableInfo.type* %.tmp7101)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7102 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7103 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7102, i32 0, i32 3
%.tmp7104 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7103
%.tmp7105 = icmp eq %m1861$.GlobalName.type* %.tmp7104, null
br i1 %.tmp7105, label %.if.true.7106, label %.if.false.7106
.if.true.7106:
%.tmp7107 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7108 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7107, i32 0, i32 3
%.tmp7109 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7109, %m1861$.GlobalName.type** %.tmp7108
br label %.if.end.7106
.if.false.7106:
%last_global.7110 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %last_global.7110
%.tmp7112 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7113 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7112, i32 0, i32 3
%.tmp7114 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7113
store %m1861$.GlobalName.type* %.tmp7114, %m1861$.GlobalName.type** %last_global.7110
br label %.for.start.7111
.for.start.7111:
%.tmp7115 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7110
%.tmp7116 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7115, i32 0, i32 4
%.tmp7117 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7116
%.tmp7118 = icmp ne %m1861$.GlobalName.type* %.tmp7117, null
br i1 %.tmp7118, label %.for.continue.7111, label %.for.end.7111
.for.continue.7111:
%.tmp7119 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7110
%.tmp7120 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7119, i32 0, i32 4
%.tmp7121 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7120
store %m1861$.GlobalName.type* %.tmp7121, %m1861$.GlobalName.type** %last_global.7110
br label %.for.start.7111
.for.end.7111:
%.tmp7122 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7110
%.tmp7123 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7122, i32 0, i32 4
%.tmp7124 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7124, %m1861$.GlobalName.type** %.tmp7123
br label %.if.end.7106
.if.end.7106:
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7125 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7126 = icmp eq %m1861$.Type.type* %.tmp7125, null
br i1 %.tmp7126, label %.if.true.7127, label %.if.false.7127
.if.true.7127:
%.tmp7128 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7128, label %.if.true.7129, label %.if.false.7129
.if.true.7129:
%.tmp7131 = getelementptr [44 x i8], [44 x i8]*@.str7130, i32 0, i32 0
%.tmp7132 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7133 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7132, i32 0, i32 7
%.tmp7134 = load i8*, i8** %.tmp7133
%.tmp7135 = call i32(i8*,...) @printf(i8* %.tmp7131, i8* %.tmp7134)
br label %.if.end.7129
.if.false.7129:
br label %.if.end.7129
.if.end.7129:
%.tmp7137 = getelementptr [2 x i8], [2 x i8]*@.str7136, i32 0, i32 0
ret i8* %.tmp7137
br label %.if.end.7127
.if.false.7127:
br label %.if.end.7127
.if.end.7127:
%.tmp7138 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7139 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7138, i32 0, i32 0
%.tmp7140 = load i8*, i8** %.tmp7139
%.tmp7141 = icmp ne i8* %.tmp7140, null
%.tmp7143 = getelementptr [59 x i8], [59 x i8]*@.str7142, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7141, i8* %.tmp7143)
%buf.7144 = alloca i8*
store i8* null, i8** %buf.7144
%.tmp7145 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7146 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7145, i32 0, i32 0
%.tmp7147 = load i8*, i8** %.tmp7146
%.tmp7149 = getelementptr [4 x i8], [4 x i8]*@.str7148, i32 0, i32 0
%.tmp7150 = call i32(i8*,i8*) @strcmp(i8* %.tmp7147, i8* %.tmp7149)
%.tmp7151 = icmp eq i32 %.tmp7150, 0
br i1 %.tmp7151, label %.if.true.7152, label %.if.false.7152
.if.true.7152:
%.tmp7154 = getelementptr [4 x i8], [4 x i8]*@.str7153, i32 0, i32 0
ret i8* %.tmp7154
br label %.if.end.7152
.if.false.7152:
%.tmp7155 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7156 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7155, i32 0, i32 0
%.tmp7157 = load i8*, i8** %.tmp7156
%.tmp7159 = getelementptr [5 x i8], [5 x i8]*@.str7158, i32 0, i32 0
%.tmp7160 = call i32(i8*,i8*) @strcmp(i8* %.tmp7157, i8* %.tmp7159)
%.tmp7161 = icmp eq i32 %.tmp7160, 0
br i1 %.tmp7161, label %.if.true.7162, label %.if.false.7162
.if.true.7162:
%.tmp7164 = getelementptr [5 x i8], [5 x i8]*@.str7163, i32 0, i32 0
ret i8* %.tmp7164
br label %.if.end.7162
.if.false.7162:
%.tmp7165 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7166 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7165, i32 0, i32 0
%.tmp7167 = load i8*, i8** %.tmp7166
%.tmp7169 = getelementptr [5 x i8], [5 x i8]*@.str7168, i32 0, i32 0
%.tmp7170 = call i32(i8*,i8*) @strcmp(i8* %.tmp7167, i8* %.tmp7169)
%.tmp7171 = icmp eq i32 %.tmp7170, 0
br i1 %.tmp7171, label %.if.true.7172, label %.if.false.7172
.if.true.7172:
%.tmp7174 = getelementptr [3 x i8], [3 x i8]*@.str7173, i32 0, i32 0
ret i8* %.tmp7174
br label %.if.end.7172
.if.false.7172:
%.tmp7175 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7176 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7175, i32 0, i32 0
%.tmp7177 = load i8*, i8** %.tmp7176
%.tmp7179 = getelementptr [8 x i8], [8 x i8]*@.str7178, i32 0, i32 0
%.tmp7180 = call i32(i8*,i8*) @strcmp(i8* %.tmp7177, i8* %.tmp7179)
%.tmp7181 = icmp eq i32 %.tmp7180, 0
br i1 %.tmp7181, label %.if.true.7182, label %.if.false.7182
.if.true.7182:
%.tmp7184 = getelementptr [4 x i8], [4 x i8]*@.str7183, i32 0, i32 0
ret i8* %.tmp7184
br label %.if.end.7182
.if.false.7182:
%.tmp7185 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7186 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7185, i32 0, i32 0
%.tmp7187 = load i8*, i8** %.tmp7186
%.tmp7189 = getelementptr [4 x i8], [4 x i8]*@.str7188, i32 0, i32 0
%.tmp7190 = call i32(i8*,i8*) @strcmp(i8* %.tmp7187, i8* %.tmp7189)
%.tmp7191 = icmp eq i32 %.tmp7190, 0
br i1 %.tmp7191, label %.if.true.7192, label %.if.false.7192
.if.true.7192:
%.tmp7194 = getelementptr [3 x i8], [3 x i8]*@.str7193, i32 0, i32 0
ret i8* %.tmp7194
br label %.if.end.7192
.if.false.7192:
%.tmp7195 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7196 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7195, i32 0, i32 0
%.tmp7197 = load i8*, i8** %.tmp7196
%.tmp7199 = getelementptr [9 x i8], [9 x i8]*@.str7198, i32 0, i32 0
%.tmp7200 = call i32(i8*,i8*) @strcmp(i8* %.tmp7197, i8* %.tmp7199)
%.tmp7201 = icmp eq i32 %.tmp7200, 0
br i1 %.tmp7201, label %.if.true.7202, label %.if.false.7202
.if.true.7202:
%.tmp7203 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7205 = getelementptr [4 x i8], [4 x i8]*@.str7204, i32 0, i32 0
%.tmp7206 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7207 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7208 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7207, i32 0, i32 3
%.tmp7209 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7208
%.tmp7210 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7206, %m1861$.Type.type* %.tmp7209)
%.tmp7211 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7203, i8* %.tmp7205, i8* %.tmp7210)
%.tmp7213 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7214 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7213, i32 0, i32 3
%.tmp7215 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7214
%.tmp7216 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7215, i32 0, i32 4
%.tmp7217 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7216
%p.7218 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7217, %m1861$.Type.type** %p.7218
br label %.for.start.7212
.for.start.7212:
%.tmp7219 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7218
%.tmp7220 = icmp ne %m1861$.Type.type* %.tmp7219, null
br i1 %.tmp7220, label %.for.continue.7212, label %.for.end.7212
.for.continue.7212:
%.tmp7221 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7218
%.tmp7222 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7223 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7222, i32 0, i32 3
%.tmp7224 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7223
%.tmp7225 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7224, i32 0, i32 4
%.tmp7226 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7225
%.tmp7227 = icmp ne %m1861$.Type.type* %.tmp7221, %.tmp7226
br i1 %.tmp7227, label %.if.true.7228, label %.if.false.7228
.if.true.7228:
%.tmp7229 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7231 = getelementptr [4 x i8], [4 x i8]*@.str7230, i32 0, i32 0
%.tmp7232 = load i8*, i8** %buf.7144
%.tmp7233 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7229, i8* %.tmp7231, i8* %.tmp7232)
br label %.if.end.7228
.if.false.7228:
br label %.if.end.7228
.if.end.7228:
%.tmp7234 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7236 = getelementptr [5 x i8], [5 x i8]*@.str7235, i32 0, i32 0
%.tmp7237 = load i8*, i8** %buf.7144
%.tmp7238 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7239 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7218
%.tmp7240 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7238, %m1861$.Type.type* %.tmp7239)
%.tmp7241 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7234, i8* %.tmp7236, i8* %.tmp7237, i8* %.tmp7240)
%.tmp7242 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7218
%.tmp7243 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7242, i32 0, i32 4
%.tmp7244 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7243
store %m1861$.Type.type* %.tmp7244, %m1861$.Type.type** %p.7218
br label %.for.start.7212
.for.end.7212:
%.tmp7245 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7247 = getelementptr [4 x i8], [4 x i8]*@.str7246, i32 0, i32 0
%.tmp7248 = load i8*, i8** %buf.7144
%.tmp7249 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7245, i8* %.tmp7247, i8* %.tmp7248)
%.tmp7250 = load i8*, i8** %buf.7144
ret i8* %.tmp7250
br label %.if.end.7202
.if.false.7202:
%.tmp7251 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7252 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7251, i32 0, i32 0
%.tmp7253 = load i8*, i8** %.tmp7252
%.tmp7255 = getelementptr [4 x i8], [4 x i8]*@.str7254, i32 0, i32 0
%.tmp7256 = call i32(i8*,i8*) @strcmp(i8* %.tmp7253, i8* %.tmp7255)
%.tmp7257 = icmp eq i32 %.tmp7256, 0
br i1 %.tmp7257, label %.if.true.7258, label %.if.false.7258
.if.true.7258:
%.tmp7259 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7261 = getelementptr [4 x i8], [4 x i8]*@.str7260, i32 0, i32 0
%.tmp7262 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7263 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7264 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7263, i32 0, i32 3
%.tmp7265 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7264
%.tmp7266 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7262, %m1861$.Type.type* %.tmp7265)
%.tmp7267 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7259, i8* %.tmp7261, i8* %.tmp7266)
%.tmp7268 = load i8*, i8** %buf.7144
ret i8* %.tmp7268
br label %.if.end.7258
.if.false.7258:
%.tmp7269 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7270 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7269, i32 0, i32 0
%.tmp7271 = load i8*, i8** %.tmp7270
%.tmp7273 = getelementptr [7 x i8], [7 x i8]*@.str7272, i32 0, i32 0
%.tmp7274 = call i32(i8*,i8*) @strcmp(i8* %.tmp7271, i8* %.tmp7273)
%.tmp7275 = icmp eq i32 %.tmp7274, 0
br i1 %.tmp7275, label %.if.true.7276, label %.if.false.7276
.if.true.7276:
%.tmp7277 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7279 = getelementptr [2 x i8], [2 x i8]*@.str7278, i32 0, i32 0
%.tmp7280 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7277, i8* %.tmp7279)
%.tmp7282 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7283 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7282, i32 0, i32 3
%.tmp7284 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7283
%t.7285 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7284, %m1861$.Type.type** %t.7285
br label %.for.start.7281
.for.start.7281:
%.tmp7286 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7285
%.tmp7287 = icmp ne %m1861$.Type.type* %.tmp7286, null
br i1 %.tmp7287, label %.for.continue.7281, label %.for.end.7281
.for.continue.7281:
%.tmp7288 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7285
%.tmp7289 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7290 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7289, i32 0, i32 3
%.tmp7291 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7290
%.tmp7292 = icmp ne %m1861$.Type.type* %.tmp7288, %.tmp7291
br i1 %.tmp7292, label %.if.true.7293, label %.if.false.7293
.if.true.7293:
%.tmp7294 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7296 = getelementptr [4 x i8], [4 x i8]*@.str7295, i32 0, i32 0
%.tmp7297 = load i8*, i8** %buf.7144
%.tmp7298 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7294, i8* %.tmp7296, i8* %.tmp7297)
br label %.if.end.7293
.if.false.7293:
br label %.if.end.7293
.if.end.7293:
%.tmp7299 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7301 = getelementptr [5 x i8], [5 x i8]*@.str7300, i32 0, i32 0
%.tmp7302 = load i8*, i8** %buf.7144
%.tmp7303 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7304 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7285
%.tmp7305 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7303, %m1861$.Type.type* %.tmp7304)
%.tmp7306 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7299, i8* %.tmp7301, i8* %.tmp7302, i8* %.tmp7305)
%.tmp7307 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7285
%.tmp7308 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7307, i32 0, i32 4
%.tmp7309 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7308
store %m1861$.Type.type* %.tmp7309, %m1861$.Type.type** %t.7285
br label %.for.start.7281
.for.end.7281:
%.tmp7310 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7312 = getelementptr [4 x i8], [4 x i8]*@.str7311, i32 0, i32 0
%.tmp7313 = load i8*, i8** %buf.7144
%.tmp7314 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7310, i8* %.tmp7312, i8* %.tmp7313)
%.tmp7315 = load i8*, i8** %buf.7144
ret i8* %.tmp7315
br label %.if.end.7276
.if.false.7276:
%.tmp7316 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7317 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7316, i32 0, i32 0
%.tmp7318 = load i8*, i8** %.tmp7317
%.tmp7320 = getelementptr [6 x i8], [6 x i8]*@.str7319, i32 0, i32 0
%.tmp7321 = call i32(i8*,i8*) @strcmp(i8* %.tmp7318, i8* %.tmp7320)
%.tmp7322 = icmp eq i32 %.tmp7321, 0
br i1 %.tmp7322, label %.if.true.7323, label %.if.false.7323
.if.true.7323:
%.tmp7324 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7326 = getelementptr [10 x i8], [10 x i8]*@.str7325, i32 0, i32 0
%.tmp7327 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7328 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7327, i32 0, i32 3
%.tmp7329 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7328
%.tmp7330 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7329, i32 0, i32 4
%.tmp7331 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7330
%.tmp7332 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7331, i32 0, i32 0
%.tmp7333 = load i8*, i8** %.tmp7332
%.tmp7334 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7335 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7336 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7335, i32 0, i32 3
%.tmp7337 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7336
%.tmp7338 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7334, %m1861$.Type.type* %.tmp7337)
%.tmp7339 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7324, i8* %.tmp7326, i8* %.tmp7333, i8* %.tmp7338)
%.tmp7340 = load i8*, i8** %buf.7144
ret i8* %.tmp7340
br label %.if.end.7323
.if.false.7323:
%.tmp7341 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7342 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7341, i32 0, i32 0
%.tmp7343 = load i8*, i8** %.tmp7342
%.tmp7345 = getelementptr [10 x i8], [10 x i8]*@.str7344, i32 0, i32 0
%.tmp7346 = call i32(i8*,i8*) @strcmp(i8* %.tmp7343, i8* %.tmp7345)
%.tmp7347 = icmp eq i32 %.tmp7346, 0
br i1 %.tmp7347, label %.if.true.7348, label %.if.false.7348
.if.true.7348:
%.tmp7349 = getelementptr i8*, i8** %buf.7144, i32 0
%.tmp7351 = getelementptr [5 x i8], [5 x i8]*@.str7350, i32 0, i32 0
%.tmp7352 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7353 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7352, i32 0, i32 2
%.tmp7354 = load i8*, i8** %.tmp7353
%.tmp7355 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7349, i8* %.tmp7351, i8* %.tmp7354)
%.tmp7356 = load i8*, i8** %buf.7144
ret i8* %.tmp7356
br label %.if.end.7348
.if.false.7348:
%.tmp7357 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7358 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7357, i32 0, i32 0
%.tmp7359 = load i8*, i8** %.tmp7358
%.tmp7361 = getelementptr [7 x i8], [7 x i8]*@.str7360, i32 0, i32 0
%.tmp7362 = call i32(i8*,i8*) @strcmp(i8* %.tmp7359, i8* %.tmp7361)
%.tmp7363 = icmp eq i32 %.tmp7362, 0
br i1 %.tmp7363, label %.if.true.7364, label %.if.false.7364
.if.true.7364:
%.tmp7366 = getelementptr [4 x i8], [4 x i8]*@.str7365, i32 0, i32 0
ret i8* %.tmp7366
br label %.if.end.7364
.if.false.7364:
%.tmp7367 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7368 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7367, i32 0, i32 0
%.tmp7369 = load i8*, i8** %.tmp7368
%.tmp7371 = getelementptr [6 x i8], [6 x i8]*@.str7370, i32 0, i32 0
%.tmp7372 = call i32(i8*,i8*) @strcmp(i8* %.tmp7369, i8* %.tmp7371)
%.tmp7373 = icmp eq i32 %.tmp7372, 0
br i1 %.tmp7373, label %.if.true.7374, label %.if.false.7374
.if.true.7374:
br label %.if.end.7374
.if.false.7374:
%.tmp7376 = getelementptr [58 x i8], [58 x i8]*@.str7375, i32 0, i32 0
%.tmp7377 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7378 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7377, i32 0, i32 0
%.tmp7379 = load i8*, i8** %.tmp7378
%.tmp7380 = call i32(i8*,...) @printf(i8* %.tmp7376, i8* %.tmp7379)
br label %.if.end.7374
.if.end.7374:
br label %.if.end.7364
.if.end.7364:
br label %.if.end.7348
.if.end.7348:
br label %.if.end.7323
.if.end.7323:
br label %.if.end.7276
.if.end.7276:
br label %.if.end.7258
.if.end.7258:
br label %.if.end.7202
.if.end.7202:
br label %.if.end.7192
.if.end.7192:
br label %.if.end.7182
.if.end.7182:
br label %.if.end.7172
.if.end.7172:
br label %.if.end.7162
.if.end.7162:
br label %.if.end.7152
.if.end.7152:
%.tmp7381 = bitcast ptr null to i8*
ret i8* %.tmp7381
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7382 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7383 = ptrtoint %m1861$.ErrorList.type* %.tmp7382 to i32
%.tmp7384 = call i8*(i32) @malloc(i32 %.tmp7383)
%.tmp7385 = bitcast i8* %.tmp7384 to %m1861$.ErrorList.type*
%new_err.7386 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7385, %m1861$.ErrorList.type** %new_err.7386
%.tmp7387 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7386
%.tmp7388 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7387, i32 0, i32 2
store i1 0, i1* %.tmp7388
%.tmp7389 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7386
%.tmp7390 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7389, i32 0, i32 0
%.tmp7391 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7391, %m751$.Error.type** %.tmp7390
%.tmp7392 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7386
%.tmp7393 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7392, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7393
%.tmp7394 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7395 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7394, i32 0, i32 2
%.tmp7396 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7395
%.tmp7397 = icmp eq %m1861$.ErrorList.type* %.tmp7396, null
br i1 %.tmp7397, label %.if.true.7398, label %.if.false.7398
.if.true.7398:
%.tmp7399 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7400 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7399, i32 0, i32 2
%.tmp7401 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7386
store %m1861$.ErrorList.type* %.tmp7401, %m1861$.ErrorList.type** %.tmp7400
ret void
br label %.if.end.7398
.if.false.7398:
br label %.if.end.7398
.if.end.7398:
%last.7402 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7402
%.tmp7404 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7405 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7404, i32 0, i32 2
%.tmp7406 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7405
store %m1861$.ErrorList.type* %.tmp7406, %m1861$.ErrorList.type** %last.7402
br label %.for.start.7403
.for.start.7403:
%.tmp7407 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7402
%.tmp7408 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7407, i32 0, i32 1
%.tmp7409 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7408
%.tmp7410 = icmp ne %m1861$.ErrorList.type* %.tmp7409, null
br i1 %.tmp7410, label %.for.continue.7403, label %.for.end.7403
.for.continue.7403:
%.tmp7411 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7402
%.tmp7412 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7411, i32 0, i32 1
%.tmp7413 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7412
store %m1861$.ErrorList.type* %.tmp7413, %m1861$.ErrorList.type** %last.7402
br label %.for.start.7403
.for.end.7403:
%.tmp7414 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7402
%.tmp7415 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7414, i32 0, i32 1
%.tmp7416 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7386
store %m1861$.ErrorList.type* %.tmp7416, %m1861$.ErrorList.type** %.tmp7415
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7417 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7418 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7417, i32 0, i32 6
%.tmp7419 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7418
%.tmp7420 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7419, i32 0, i32 7
%.tmp7421 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7420
%.tmp7422 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7421, i32 0, i32 1
%.tmp7423 = load i8*, i8** %.tmp7422
ret i8* %.tmp7423
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7425 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7426 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7425, %m307$.Node.type** %n.7426
br label %.for.start.7424
.for.start.7424:
%.tmp7427 = load %m307$.Node.type*, %m307$.Node.type** %n.7426
%.tmp7428 = icmp ne %m307$.Node.type* %.tmp7427, null
br i1 %.tmp7428, label %.for.continue.7424, label %.for.end.7424
.for.continue.7424:
%.tmp7429 = load %m307$.Node.type*, %m307$.Node.type** %n.7426
%.tmp7430 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7429, i32 0, i32 0
%.tmp7431 = load i8*, i8** %.tmp7430
%.tmp7432 = load i8*, i8** %type
%.tmp7433 = call i32(i8*,i8*) @strcmp(i8* %.tmp7431, i8* %.tmp7432)
%.tmp7434 = icmp eq i32 %.tmp7433, 0
br i1 %.tmp7434, label %.if.true.7435, label %.if.false.7435
.if.true.7435:
%.tmp7436 = load %m307$.Node.type*, %m307$.Node.type** %n.7426
ret %m307$.Node.type* %.tmp7436
br label %.if.end.7435
.if.false.7435:
br label %.if.end.7435
.if.end.7435:
%.tmp7437 = load %m307$.Node.type*, %m307$.Node.type** %n.7426
%.tmp7438 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7437, i32 0, i32 7
%.tmp7439 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7438
store %m307$.Node.type* %.tmp7439, %m307$.Node.type** %n.7426
br label %.for.start.7424
.for.end.7424:
%.tmp7440 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7440
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7441 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7442 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7441, %m1861$.Type.type** %function_type.7442
%.tmp7443 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7444 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7445 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7444, i32 0, i32 6
%.tmp7446 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7445
%.tmp7447 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7443, %m307$.Node.type* %.tmp7446)
%return_value_type.7448 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7447, %m1861$.Type.type** %return_value_type.7448
%.tmp7449 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7442
%.tmp7450 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7449, i32 0, i32 0
%.tmp7452 = getelementptr [9 x i8], [9 x i8]*@.str7451, i32 0, i32 0
store i8* %.tmp7452, i8** %.tmp7450
%.tmp7453 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7442
%.tmp7454 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7453, i32 0, i32 3
%.tmp7455 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7448
store %m1861$.Type.type* %.tmp7455, %m1861$.Type.type** %.tmp7454
%.tmp7456 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7448
%last_type.7457 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7456, %m1861$.Type.type** %last_type.7457
%.tmp7458 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7459 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7458)
%params.7460 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7459, %m307$.Node.type** %params.7460
%.tmp7462 = load %m307$.Node.type*, %m307$.Node.type** %params.7460
%param_ptr.7463 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7462, %m307$.Node.type** %param_ptr.7463
br label %.for.start.7461
.for.start.7461:
%.tmp7464 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7465 = icmp ne %m307$.Node.type* %.tmp7464, null
br i1 %.tmp7465, label %.for.continue.7461, label %.for.end.7461
.for.continue.7461:
%.tmp7466 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7467 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7466, i32 0, i32 0
%.tmp7468 = load i8*, i8** %.tmp7467
%.tmp7470 = getelementptr [5 x i8], [5 x i8]*@.str7469, i32 0, i32 0
%.tmp7471 = call i32(i8*,i8*) @strcmp(i8* %.tmp7468, i8* %.tmp7470)
%.tmp7472 = icmp eq i32 %.tmp7471, 0
br i1 %.tmp7472, label %.if.true.7473, label %.if.false.7473
.if.true.7473:
%.tmp7474 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7457
%.tmp7475 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7474, i32 0, i32 4
%.tmp7476 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7457
%.tmp7477 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7476)
store %m1861$.Type.type* %.tmp7477, %m1861$.Type.type** %.tmp7475
%.tmp7478 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7457
%.tmp7479 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7478, i32 0, i32 4
%.tmp7480 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7479
%.tmp7481 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7480, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7481
%.tmp7482 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7457
%.tmp7483 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7482, i32 0, i32 4
%.tmp7484 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7483
store %m1861$.Type.type* %.tmp7484, %m1861$.Type.type** %last_type.7457
%.tmp7485 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7486 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7485, i32 0, i32 7
%.tmp7487 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7486
%.tmp7488 = icmp ne %m307$.Node.type* %.tmp7487, null
br i1 %.tmp7488, label %.if.true.7489, label %.if.false.7489
.if.true.7489:
%.tmp7490 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7491 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7490, i32 0, i32 7
%.tmp7492 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7491
store %m307$.Node.type* %.tmp7492, %m307$.Node.type** %param_ptr.7463
br label %.if.end.7489
.if.false.7489:
br label %.if.end.7489
.if.end.7489:
%.tmp7493 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7494 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7493, i32 0, i32 7
%.tmp7495 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7494
%.tmp7496 = icmp ne %m307$.Node.type* %.tmp7495, null
br i1 %.tmp7496, label %.if.true.7497, label %.if.false.7497
.if.true.7497:
%.tmp7498 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7499 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7498, i32 0, i32 7
%.tmp7500 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7499
store %m307$.Node.type* %.tmp7500, %m307$.Node.type** %param_ptr.7463
br label %.if.end.7497
.if.false.7497:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7463
br label %.if.end.7497
.if.end.7497:
br label %.if.end.7473
.if.false.7473:
%.tmp7501 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7502 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7503 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7502, i32 0, i32 6
%.tmp7504 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7503
%.tmp7505 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7501, %m307$.Node.type* %.tmp7504)
%param_type.7506 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7505, %m1861$.Type.type** %param_type.7506
%.tmp7507 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7457
%.tmp7508 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7507, i32 0, i32 4
%.tmp7509 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7506
store %m1861$.Type.type* %.tmp7509, %m1861$.Type.type** %.tmp7508
%.tmp7510 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7506
store %m1861$.Type.type* %.tmp7510, %m1861$.Type.type** %last_type.7457
%.tmp7511 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7512 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7511, i32 0, i32 7
%.tmp7513 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7512
store %m307$.Node.type* %.tmp7513, %m307$.Node.type** %param_ptr.7463
%.tmp7514 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7515 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7514, i32 0, i32 7
%.tmp7516 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7515
%.tmp7517 = icmp ne %m307$.Node.type* %.tmp7516, null
br i1 %.tmp7517, label %.if.true.7518, label %.if.false.7518
.if.true.7518:
%.tmp7519 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7463
%.tmp7520 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7519, i32 0, i32 7
%.tmp7521 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7520
%.tmp7522 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7521, i32 0, i32 7
%.tmp7523 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7522
store %m307$.Node.type* %.tmp7523, %m307$.Node.type** %param_ptr.7463
br label %.if.end.7518
.if.false.7518:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7463
br label %.if.end.7518
.if.end.7518:
br label %.if.end.7473
.if.end.7473:
br label %.for.start.7461
.for.end.7461:
%.tmp7524 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7442
ret %m1861$.Type.type* %.tmp7524
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7525 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7527 = getelementptr [10 x i8], [10 x i8]*@.str7526, i32 0, i32 0
%.tmp7528 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7525, i8* %.tmp7527)
%params.7529 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7528, %m307$.Node.type** %params.7529
%.tmp7530 = load %m307$.Node.type*, %m307$.Node.type** %params.7529
%.tmp7531 = icmp eq %m307$.Node.type* %.tmp7530, null
br i1 %.tmp7531, label %.if.true.7532, label %.if.false.7532
.if.true.7532:
%.tmp7533 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7533
br label %.if.end.7532
.if.false.7532:
br label %.if.end.7532
.if.end.7532:
%.tmp7534 = load %m307$.Node.type*, %m307$.Node.type** %params.7529
%.tmp7535 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7534, i32 0, i32 6
%.tmp7536 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7535
ret %m307$.Node.type* %.tmp7536
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7537 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.7538 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7537, %m1861$.Type.type** %t.7538
%.tmp7539 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7540 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7539, i32 0, i32 0
%.tmp7541 = load i8*, i8** %.tmp7540
%.tmp7543 = getelementptr [10 x i8], [10 x i8]*@.str7542, i32 0, i32 0
%.tmp7544 = call i32(i8*,i8*) @strcmp(i8* %.tmp7541, i8* %.tmp7543)
%.tmp7545 = icmp eq i32 %.tmp7544, 0
br i1 %.tmp7545, label %.if.true.7546, label %.if.false.7546
.if.true.7546:
%.tmp7547 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7548 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7547, i32 0, i32 0
%.tmp7550 = getelementptr [7 x i8], [7 x i8]*@.str7549, i32 0, i32 0
store i8* %.tmp7550, i8** %.tmp7548
%.tmp7551 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7552 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7551, i32 0, i32 1
store i8* null, i8** %.tmp7552
%.tmp7553 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7554 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7553, i32 0, i32 6
%.tmp7555 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7554
%.tmp7557 = getelementptr [5 x i8], [5 x i8]*@.str7556, i32 0, i32 0
%.tmp7558 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7555, i8* %.tmp7557)
%curr_type.7559 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7558, %m307$.Node.type** %curr_type.7559
%.tmp7560 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7561 = icmp ne %m307$.Node.type* %.tmp7560, null
br i1 %.tmp7561, label %.if.true.7562, label %.if.false.7562
.if.true.7562:
%.tmp7563 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7564 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7563, i32 0, i32 3
%.tmp7565 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7566 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7567 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7566, i32 0, i32 6
%.tmp7568 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7567
%.tmp7569 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7565, %m307$.Node.type* %.tmp7568)
store %m1861$.Type.type* %.tmp7569, %m1861$.Type.type** %.tmp7564
%.tmp7570 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7571 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7570, i32 0, i32 3
%.tmp7572 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7571
%.tmp7573 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7572, i32 0, i32 1
%.tmp7574 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7575 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7574, i32 0, i32 7
%.tmp7576 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7575
%.tmp7577 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7576, i32 0, i32 1
%.tmp7578 = load i8*, i8** %.tmp7577
store i8* %.tmp7578, i8** %.tmp7573
%.tmp7579 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7580 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7579, i32 0, i32 3
%.tmp7581 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7580
%curr_t.7582 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7581, %m1861$.Type.type** %curr_t.7582
%.tmp7584 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7585 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7584, i32 0, i32 7
%.tmp7586 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7585
%.tmp7588 = getelementptr [5 x i8], [5 x i8]*@.str7587, i32 0, i32 0
%.tmp7589 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7586, i8* %.tmp7588)
store %m307$.Node.type* %.tmp7589, %m307$.Node.type** %curr_type.7559
br label %.for.start.7583
.for.start.7583:
%.tmp7590 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7591 = icmp ne %m307$.Node.type* %.tmp7590, null
br i1 %.tmp7591, label %.for.continue.7583, label %.for.end.7583
.for.continue.7583:
%.tmp7592 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7582
%.tmp7593 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7592, i32 0, i32 4
%.tmp7594 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7595 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7596 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7595, i32 0, i32 6
%.tmp7597 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7596
%.tmp7598 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7594, %m307$.Node.type* %.tmp7597)
store %m1861$.Type.type* %.tmp7598, %m1861$.Type.type** %.tmp7593
%.tmp7599 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7582
%.tmp7600 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7599, i32 0, i32 4
%.tmp7601 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7600
%.tmp7602 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7601, i32 0, i32 1
%.tmp7603 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7604 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7603, i32 0, i32 7
%.tmp7605 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7604
%.tmp7606 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7605, i32 0, i32 1
%.tmp7607 = load i8*, i8** %.tmp7606
store i8* %.tmp7607, i8** %.tmp7602
%.tmp7608 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7582
%.tmp7609 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7608, i32 0, i32 4
%.tmp7610 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7609
store %m1861$.Type.type* %.tmp7610, %m1861$.Type.type** %curr_t.7582
%.tmp7611 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7559
%.tmp7612 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7611, i32 0, i32 7
%.tmp7613 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7612
%.tmp7615 = getelementptr [5 x i8], [5 x i8]*@.str7614, i32 0, i32 0
%.tmp7616 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7613, i8* %.tmp7615)
store %m307$.Node.type* %.tmp7616, %m307$.Node.type** %curr_type.7559
br label %.for.start.7583
.for.end.7583:
br label %.if.end.7562
.if.false.7562:
br label %.if.end.7562
.if.end.7562:
br label %.if.end.7546
.if.false.7546:
%.tmp7617 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7618 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7617, i32 0, i32 0
%.tmp7619 = load i8*, i8** %.tmp7618
%.tmp7621 = getelementptr [12 x i8], [12 x i8]*@.str7620, i32 0, i32 0
%.tmp7622 = call i32(i8*,i8*) @strcmp(i8* %.tmp7619, i8* %.tmp7621)
%.tmp7623 = icmp eq i32 %.tmp7622, 0
br i1 %.tmp7623, label %.if.true.7624, label %.if.false.7624
.if.true.7624:
%err_msg.7625 = alloca i8*
store i8* null, i8** %err_msg.7625
%.tmp7626 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7627 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7628 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7626, %m307$.Node.type* %.tmp7627)
%base.7629 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp7628, %m1861$.ScopeItem.type** %base.7629
%.tmp7630 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7629
%.tmp7631 = icmp eq %m1861$.ScopeItem.type* %.tmp7630, null
br i1 %.tmp7631, label %.if.true.7632, label %.if.false.7632
.if.true.7632:
%.tmp7633 = getelementptr i8*, i8** %err_msg.7625, i32 0
%.tmp7635 = getelementptr [37 x i8], [37 x i8]*@.str7634, i32 0, i32 0
%.tmp7636 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7637 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7636, i32 0, i32 6
%.tmp7638 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7637
%.tmp7639 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7638, i32 0, i32 1
%.tmp7640 = load i8*, i8** %.tmp7639
%.tmp7641 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7633, i8* %.tmp7635, i8* %.tmp7640)
%.tmp7642 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7643 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7644 = load i8*, i8** %err_msg.7625
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7642, %m307$.Node.type* %.tmp7643, i8* %.tmp7644)
%.tmp7645 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7646 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7645, i32 0, i32 0
%.tmp7648 = getelementptr [6 x i8], [6 x i8]*@.str7647, i32 0, i32 0
store i8* %.tmp7648, i8** %.tmp7646
%.tmp7649 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
ret %m1861$.Type.type* %.tmp7649
br label %.if.end.7632
.if.false.7632:
br label %.if.end.7632
.if.end.7632:
%.tmp7650 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7651 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7650, i32 0, i32 0
%.tmp7653 = getelementptr [10 x i8], [10 x i8]*@.str7652, i32 0, i32 0
store i8* %.tmp7653, i8** %.tmp7651
%.tmp7654 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7655 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7654, i32 0, i32 1
%.tmp7656 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7629
%.tmp7657 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7656, i32 0, i32 0
%.tmp7658 = load i8*, i8** %.tmp7657
store i8* %.tmp7658, i8** %.tmp7655
%.tmp7659 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7660 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7659, i32 0, i32 2
%.tmp7661 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7629
%.tmp7662 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7661, i32 0, i32 1
%.tmp7663 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7662
%.tmp7664 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7663, i32 0, i32 0
%.tmp7665 = load i8*, i8** %.tmp7664
store i8* %.tmp7665, i8** %.tmp7660
%.tmp7666 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7667 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7666, i32 0, i32 3
%.tmp7668 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7629
%.tmp7669 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7668, i32 0, i32 1
%.tmp7670 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7669
%.tmp7671 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7670, i32 0, i32 3
%.tmp7672 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7671
store %m1861$.Type.type* %.tmp7672, %m1861$.Type.type** %.tmp7667
br label %.if.end.7624
.if.false.7624:
%.tmp7673 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7674 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7673, i32 0, i32 1
%.tmp7675 = load i8*, i8** %.tmp7674
%.tmp7677 = getelementptr [4 x i8], [4 x i8]*@.str7676, i32 0, i32 0
%.tmp7678 = call i32(i8*,i8*) @strcmp(i8* %.tmp7675, i8* %.tmp7677)
%.tmp7679 = icmp eq i32 %.tmp7678, 0
br i1 %.tmp7679, label %.if.true.7680, label %.if.false.7680
.if.true.7680:
%.tmp7681 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7682 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7681, i32 0, i32 0
%.tmp7684 = getelementptr [4 x i8], [4 x i8]*@.str7683, i32 0, i32 0
store i8* %.tmp7684, i8** %.tmp7682
%.tmp7685 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7686 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7685, i32 0, i32 3
%.tmp7687 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7687, %m1861$.Type.type** %.tmp7686
%.tmp7688 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7689 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7688, i32 0, i32 3
%.tmp7690 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7689
%.tmp7691 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7690, i32 0, i32 0
%.tmp7693 = getelementptr [4 x i8], [4 x i8]*@.str7692, i32 0, i32 0
store i8* %.tmp7693, i8** %.tmp7691
br label %.if.end.7680
.if.false.7680:
%.tmp7694 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7695 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7694, i32 0, i32 0
%.tmp7696 = load i8*, i8** %.tmp7695
%.tmp7698 = getelementptr [5 x i8], [5 x i8]*@.str7697, i32 0, i32 0
%.tmp7699 = call i32(i8*,i8*) @strcmp(i8* %.tmp7696, i8* %.tmp7698)
%.tmp7700 = icmp eq i32 %.tmp7699, 0
br i1 %.tmp7700, label %.if.true.7701, label %.if.false.7701
.if.true.7701:
%.tmp7702 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7703 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7702, i32 0, i32 0
%.tmp7704 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7705 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7704, i32 0, i32 1
%.tmp7706 = load i8*, i8** %.tmp7705
store i8* %.tmp7706, i8** %.tmp7703
br label %.if.end.7701
.if.false.7701:
%.tmp7707 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7708 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7707, i32 0, i32 1
%.tmp7709 = load i8*, i8** %.tmp7708
%.tmp7711 = getelementptr [4 x i8], [4 x i8]*@.str7710, i32 0, i32 0
%.tmp7712 = call i32(i8*,i8*) @strcmp(i8* %.tmp7709, i8* %.tmp7711)
%.tmp7713 = icmp eq i32 %.tmp7712, 0
br i1 %.tmp7713, label %.if.true.7714, label %.if.false.7714
.if.true.7714:
%.tmp7715 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
%.tmp7716 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7715, i32 0, i32 0
%.tmp7718 = getelementptr [7 x i8], [7 x i8]*@.str7717, i32 0, i32 0
store i8* %.tmp7718, i8** %.tmp7716
br label %.if.end.7714
.if.false.7714:
%.tmp7719 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7720 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7722 = getelementptr [54 x i8], [54 x i8]*@.str7721, i32 0, i32 0
%.tmp7723 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7719, %m307$.Node.type* %.tmp7720, i8* %.tmp7722)
%.tmp7724 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7725 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7724, i32 0, i32 0
%.tmp7726 = load i8*, i8** %.tmp7725
%.tmp7727 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7728 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7727, i32 0, i32 1
%.tmp7729 = load i8*, i8** %.tmp7728
%.tmp7730 = call i32(i8*,...) @printf(i8* %.tmp7723, i8* %.tmp7726, i8* %.tmp7729)
%.tmp7731 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7731
br label %.if.end.7714
.if.end.7714:
br label %.if.end.7701
.if.end.7701:
br label %.if.end.7680
.if.end.7680:
br label %.if.end.7624
.if.end.7624:
br label %.if.end.7546
.if.end.7546:
%.tmp7733 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7734 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7733, i32 0, i32 7
%.tmp7735 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7734
%ptr.7736 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7735, %m307$.Node.type** %ptr.7736
br label %.for.start.7732
.for.start.7732:
%.tmp7737 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7738 = icmp ne %m307$.Node.type* %.tmp7737, null
br i1 %.tmp7738, label %.for.continue.7732, label %.for.end.7732
.for.continue.7732:
%.tmp7739 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7740 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7739, i32 0, i32 1
%.tmp7741 = load i8*, i8** %.tmp7740
%.tmp7743 = getelementptr [2 x i8], [2 x i8]*@.str7742, i32 0, i32 0
%.tmp7744 = call i32(i8*,i8*) @strcmp(i8* %.tmp7741, i8* %.tmp7743)
%.tmp7745 = icmp eq i32 %.tmp7744, 0
br i1 %.tmp7745, label %.if.true.7746, label %.if.false.7746
.if.true.7746:
%.tmp7747 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.7748 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7747, %m1861$.Type.type** %pt.7748
%.tmp7749 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7748
%.tmp7750 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7749, i32 0, i32 0
%.tmp7752 = getelementptr [4 x i8], [4 x i8]*@.str7751, i32 0, i32 0
store i8* %.tmp7752, i8** %.tmp7750
%.tmp7753 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7748
%.tmp7754 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7753, i32 0, i32 3
%.tmp7755 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
store %m1861$.Type.type* %.tmp7755, %m1861$.Type.type** %.tmp7754
%.tmp7756 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7748
store %m1861$.Type.type* %.tmp7756, %m1861$.Type.type** %t.7538
br label %.if.end.7746
.if.false.7746:
%.tmp7757 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7758 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7757, i32 0, i32 1
%.tmp7759 = load i8*, i8** %.tmp7758
%.tmp7761 = getelementptr [2 x i8], [2 x i8]*@.str7760, i32 0, i32 0
%.tmp7762 = call i32(i8*,i8*) @strcmp(i8* %.tmp7759, i8* %.tmp7761)
%.tmp7763 = icmp eq i32 %.tmp7762, 0
br i1 %.tmp7763, label %.if.true.7764, label %.if.false.7764
.if.true.7764:
%.tmp7765 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7766 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7765, i32 0, i32 7
%.tmp7767 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7766
%.tmp7768 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7767, i32 0, i32 1
%.tmp7769 = load i8*, i8** %.tmp7768
%.tmp7771 = getelementptr [2 x i8], [2 x i8]*@.str7770, i32 0, i32 0
%.tmp7772 = call i32(i8*,i8*) @strcmp(i8* %.tmp7769, i8* %.tmp7771)
%.tmp7773 = icmp eq i32 %.tmp7772, 0
br i1 %.tmp7773, label %.if.true.7774, label %.if.false.7774
.if.true.7774:
%.tmp7775 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.7776 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7775, %m1861$.Type.type** %slice_type.7776
%.tmp7777 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7776
%.tmp7778 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7777, i32 0, i32 0
%.tmp7780 = getelementptr [7 x i8], [7 x i8]*@.str7779, i32 0, i32 0
store i8* %.tmp7780, i8** %.tmp7778
%.tmp7781 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.7782 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7781, %m1861$.Type.type** %slice_c_array.7782
%.tmp7783 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7782
%.tmp7784 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7783, i32 0, i32 0
%.tmp7786 = getelementptr [4 x i8], [4 x i8]*@.str7785, i32 0, i32 0
store i8* %.tmp7786, i8** %.tmp7784
%.tmp7787 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7782
%.tmp7788 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7787, i32 0, i32 1
%.tmp7790 = getelementptr [6 x i8], [6 x i8]*@.str7789, i32 0, i32 0
store i8* %.tmp7790, i8** %.tmp7788
%.tmp7791 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7782
%.tmp7792 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7791, i32 0, i32 3
%.tmp7793 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
store %m1861$.Type.type* %.tmp7793, %m1861$.Type.type** %.tmp7792
%.tmp7794 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7776
%.tmp7795 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7794, i32 0, i32 3
%.tmp7796 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7782
store %m1861$.Type.type* %.tmp7796, %m1861$.Type.type** %.tmp7795
%.tmp7797 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.7798 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7797, %m1861$.Type.type** %slice_len.7798
%.tmp7799 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7798
%.tmp7800 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7799, i32 0, i32 0
%.tmp7802 = getelementptr [4 x i8], [4 x i8]*@.str7801, i32 0, i32 0
store i8* %.tmp7802, i8** %.tmp7800
%.tmp7803 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7798
%.tmp7804 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7803, i32 0, i32 1
%.tmp7806 = getelementptr [4 x i8], [4 x i8]*@.str7805, i32 0, i32 0
store i8* %.tmp7806, i8** %.tmp7804
%.tmp7807 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7782
%.tmp7808 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7807, i32 0, i32 4
%.tmp7809 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7798
store %m1861$.Type.type* %.tmp7809, %m1861$.Type.type** %.tmp7808
%.tmp7810 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.7811 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7810, %m1861$.Type.type** %slice_cap.7811
%.tmp7812 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7811
%.tmp7813 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7812, i32 0, i32 0
%.tmp7815 = getelementptr [4 x i8], [4 x i8]*@.str7814, i32 0, i32 0
store i8* %.tmp7815, i8** %.tmp7813
%.tmp7816 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7811
%.tmp7817 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7816, i32 0, i32 1
%.tmp7819 = getelementptr [4 x i8], [4 x i8]*@.str7818, i32 0, i32 0
store i8* %.tmp7819, i8** %.tmp7817
%.tmp7820 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7798
%.tmp7821 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7820, i32 0, i32 4
%.tmp7822 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7811
store %m1861$.Type.type* %.tmp7822, %m1861$.Type.type** %.tmp7821
%.tmp7823 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7776
store %m1861$.Type.type* %.tmp7823, %m1861$.Type.type** %t.7538
%.tmp7824 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7825 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7824, i32 0, i32 7
%.tmp7826 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7825
store %m307$.Node.type* %.tmp7826, %m307$.Node.type** %ptr.7736
br label %.if.end.7774
.if.false.7774:
br label %.if.end.7774
.if.end.7774:
br label %.if.end.7764
.if.false.7764:
%.tmp7827 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7828 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7830 = getelementptr [49 x i8], [49 x i8]*@.str7829, i32 0, i32 0
%.tmp7831 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7827, %m307$.Node.type* %.tmp7828, i8* %.tmp7830)
%.tmp7832 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7833 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7832, i32 0, i32 1
%.tmp7834 = load i8*, i8** %.tmp7833
%.tmp7835 = call i32(i8*,...) @printf(i8* %.tmp7831, i8* %.tmp7834)
%.tmp7836 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7836
br label %.if.end.7764
.if.end.7764:
br label %.if.end.7746
.if.end.7746:
%.tmp7837 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7736
%.tmp7838 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7837, i32 0, i32 7
%.tmp7839 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7838
store %m307$.Node.type* %.tmp7839, %m307$.Node.type** %ptr.7736
br label %.for.start.7732
.for.end.7732:
%.tmp7840 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7538
ret %m1861$.Type.type* %.tmp7840
}
@.str2658 = constant [5 x i8] c"%s{\0A\00"
@.str2662 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2669 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2676 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2688 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2692 = constant [10 x i8] c"%s  of: \0A\00"
@.str2706 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2710 = constant [12 x i8] c"%s  next: \0A\00"
@.str2719 = constant [5 x i8] c"%s}\0A\00"
@.str2779 = constant [5 x i8] c"%c%s\00"
@.str2791 = constant [7 x i8] c".tmp%d\00"
@.str2888 = constant [1 x i8] c"\00"
@.str2930 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2954 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2973 = constant [6 x i8] c"start\00"
@.str3040 = constant [6 x i8] c"start\00"
@.str3046 = constant [7 x i8] c"global\00"
@.str3057 = constant [13 x i8] c"head_comment\00"
@.str3096 = constant [7 x i8] c"string\00"
@.str3105 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3138 = constant [5 x i8] c"%s%s\00"
@.str3146 = constant [9 x i8] c"function\00"
@.str3152 = constant [5 x i8] c"main\00"
@.str3167 = constant [6 x i8] c"%s.%s\00"
@.str3188 = constant [3 x i8] c"NL\00"
@.str3196 = constant [7 x i8] c"global\00"
@.str3204 = constant [11 x i8] c"assignable\00"
@.str3235 = constant [9 x i8] c"variable\00"
@.str3246 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3261 = constant [10 x i8] c"typealias\00"
@.str3283 = constant [11 x i8] c"%s.%s.type\00"
@.str3295 = constant [10 x i8] c"typealias\00"
@.str3316 = constant [5 x i8] c"type\00"
@.str3346 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3359 = constant [7 x i8] c"extern\00"
@.str3377 = constant [7 x i8] c"extern\00"
@.str3417 = constant [15 x i8] c"declare %s %s(\00"
@.str3449 = constant [3 x i8] c", \00"
@.str3455 = constant [3 x i8] c"%s\00"
@.str3467 = constant [3 x i8] c")\0A\00"
@.str3478 = constant [9 x i8] c"function\00"
@.str3487 = constant [9 x i8] c"function\00"
@.str3525 = constant [14 x i8] c"define %s %s(\00"
@.str3554 = constant [3 x i8] c", \00"
@.str3560 = constant [5 x i8] c"type\00"
@.str3576 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3591 = constant [5 x i8] c") {\0A\00"
@.str3595 = constant [9 x i8] c"function\00"
@.str3604 = constant [6 x i8] c"block\00"
@.str3616 = constant [12 x i8] c"expressions\00"
@.str3629 = constant [3 x i8] c"NL\00"
@.str3636 = constant [9 x i8] c"OPERATOR\00"
@.str3655 = constant [7 x i8] c"return\00"
@.str3665 = constant [5 x i8] c"void\00"
@.str3672 = constant [21 x i8] c"missing return value\00"
@.str3677 = constant [10 x i8] c"ret void\0A\00"
@.str3683 = constant [3 x i8] c"}\0A\00"
@.str3689 = constant [7 x i8] c"import\00"
@.str3740 = constant [1 x i8] c"\00"
@.str3746 = constant [6 x i8] c"%s.bn\00"
@.str3751 = constant [9 x i8] c"%s/%s.bn\00"
@.str3763 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3824 = constant [5 x i8] c"m%d$\00"
@.str3875 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3884 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3916 = constant [9 x i8] c"variable\00"
@.str3921 = constant [5 x i8] c"type\00"
@.str3953 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3965 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3977 = constant [6 x i8] c"block\00"
@.str3984 = constant [12 x i8] c"expressions\00"
@.str4015 = constant [7 x i8] c"struct\00"
@.str4020 = constant [7 x i8] c"WhAT!\0A\00"
@.str4060 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4072 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4098 = constant [7 x i8] c"struct\00"
@.str4103 = constant [7 x i8] c"WhAT!\0A\00"
@.str4134 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4146 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4171 = constant [7 x i8] c"sizeof\00"
@.str4177 = constant [8 x i8] c"fn_args\00"
@.str4184 = constant [11 x i8] c"assignable\00"
@.str4212 = constant [4 x i8] c"int\00"
@.str4225 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4234 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4245 = constant [7 x i8] c"append\00"
@.str4251 = constant [8 x i8] c"fn_args\00"
@.str4258 = constant [11 x i8] c"assignable\00"
@.str4265 = constant [11 x i8] c"assignable\00"
@.str4289 = constant [5 x i8] c".b%d\00"
@.str4322 = constant [4 x i8] c"len\00"
@.str4328 = constant [8 x i8] c"fn_args\00"
@.str4335 = constant [11 x i8] c"assignable\00"
@.str4361 = constant [35 x i8] c"unable to compile function address\00"
@.str4367 = constant [8 x i8] c"fn_args\00"
@.str4371 = constant [1 x i8] c"\00"
@.str4381 = constant [11 x i8] c"assignable\00"
@.str4395 = constant [5 x i8] c"%s, \00"
@.str4413 = constant [8 x i8] c"%s%s %s\00"
@.str4428 = constant [11 x i8] c"assignable\00"
@.str4438 = constant [5 x i8] c"void\00"
@.str4446 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4478 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4504 = constant [7 x i8] c"return\00"
@.str4516 = constant [3 x i8] c"NL\00"
@.str4534 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4547 = constant [10 x i8] c"ret void\0A\00"
@.str4551 = constant [3 x i8] c"NL\00"
@.str4557 = constant [8 x i8] c"fn_call\00"
@.str4568 = constant [12 x i8] c"declaration\00"
@.str4577 = constant [11 x i8] c"assignment\00"
@.str4585 = constant [11 x i8] c"assignable\00"
@.str4616 = constant [4 x i8] c"ptr\00"
@.str4625 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4635 = constant [9 x i8] c"if_block\00"
@.str4643 = constant [9 x i8] c"for_loop\00"
@.str4651 = constant [8 x i8] c"keyword\00"
@.str4669 = constant [6 x i8] c"break\00"
@.str4683 = constant [4 x i8] c"for\00"
@.str4691 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4705 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4712 = constant [9 x i8] c"continue\00"
@.str4726 = constant [4 x i8] c"for\00"
@.str4734 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4748 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4752 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4763 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4782 = constant [14 x i8] c".for.start.%d\00"
@.str4787 = constant [12 x i8] c".for.end.%d\00"
@.str4792 = constant [4 x i8] c"for\00"
@.str4799 = constant [12 x i8] c"declaration\00"
@.str4810 = constant [11 x i8] c"assignment\00"
@.str4820 = constant [9 x i8] c"OPERATOR\00"
@.str4827 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4838 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4845 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4852 = constant [9 x i8] c"OPERATOR\00"
@.str4863 = constant [9 x i8] c"OPERATOR\00"
@.str4870 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4879 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4894 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4901 = constant [9 x i8] c"OPERATOR\00"
@.str4910 = constant [6 x i8] c"block\00"
@.str4925 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4932 = constant [5 x i8] c"%s:\0A\00"
@.str4946 = constant [5 x i8] c"type\00"
@.str4961 = constant [11 x i8] c"assignable\00"
@.str4976 = constant [9 x i8] c"variable\00"
@.str4981 = constant [5 x i8] c"WORD\00"
@.str4990 = constant [31 x i8] c"unable to get declaration name\00"
@.str5010 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5022 = constant [6 x i8] c"%s.%d\00"
@.str5079 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5095 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5107 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5148 = constant [4 x i8] c"int\00"
@.str5155 = constant [4 x i8] c"chr\00"
@.str5163 = constant [5 x i8] c"bool\00"
@.str5172 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5181 = constant [4 x i8] c"ptr\00"
@.str5189 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5192 = constant [5 x i8] c"null\00"
@.str5200 = constant [7 x i8] c"struct\00"
@.str5221 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5241 = constant [10 x i8] c"typealias\00"
@.str5264 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5283 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5300 = constant [11 x i8] c"assignable\00"
@.str5317 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5332 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5339 = constant [6 x i8] c"block\00"
@.str5348 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5355 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5362 = constant [11 x i8] c"elif_block\00"
@.str5374 = constant [11 x i8] c"else_block\00"
@.str5384 = constant [6 x i8] c"block\00"
@.str5394 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5401 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5422 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5431 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5485 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5506 = constant [7 x i8] c"module\00"
@.str5559 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5596 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5604 = constant [9 x i8] c"function\00"
@.str5611 = constant [7 x i8] c"extern\00"
@.str5623 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5644 = constant [9 x i8] c"variable\00"
@.str5666 = constant [4 x i8] c"ptr\00"
@.str5685 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5709 = constant [10 x i8] c"typealias\00"
@.str5720 = constant [7 x i8] c"struct\00"
@.str5726 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5778 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5799 = constant [9 x i8] c"variable\00"
@.str5810 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5831 = constant [9 x i8] c"variable\00"
@.str5839 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5853 = constant [17 x i8] c"addr_destination\00"
@.str5860 = constant [16 x i8] c"mono_assignable\00"
@.str5868 = constant [11 x i8] c"assignable\00"
@.str5882 = constant [12 x i8] c"destination\00"
@.str5887 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5915 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5934 = constant [7 x i8] c"module\00"
@.str5956 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6027 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6048 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6072 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6095 = constant [16 x i8] c"mono_assignable\00"
@.str6121 = constant [5 x i8] c"cast\00"
@.str6131 = constant [5 x i8] c"type\00"
@.str6156 = constant [8 x i8] c"bitcast\00"
@.str6164 = constant [4 x i8] c"ptr\00"
@.str6171 = constant [4 x i8] c"ptr\00"
@.str6190 = constant [4 x i8] c"i%d\00"
@.str6195 = constant [4 x i8] c"i%d\00"
@.str6203 = constant [5 x i8] c"sext\00"
@.str6205 = constant [6 x i8] c"trunc\00"
@.str6210 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6230 = constant [16 x i8] c"mono_assignable\00"
@.str6292 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6315 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6322 = constant [2 x i8] c"+\00"
@.str6327 = constant [4 x i8] c"add\00"
@.str6332 = constant [2 x i8] c"-\00"
@.str6337 = constant [4 x i8] c"sub\00"
@.str6342 = constant [2 x i8] c"*\00"
@.str6347 = constant [4 x i8] c"mul\00"
@.str6352 = constant [2 x i8] c"/\00"
@.str6357 = constant [5 x i8] c"sdiv\00"
@.str6362 = constant [3 x i8] c"==\00"
@.str6367 = constant [8 x i8] c"icmp eq\00"
@.str6372 = constant [3 x i8] c"!=\00"
@.str6377 = constant [8 x i8] c"icmp ne\00"
@.str6382 = constant [2 x i8] c">\00"
@.str6387 = constant [9 x i8] c"icmp sgt\00"
@.str6392 = constant [2 x i8] c"<\00"
@.str6397 = constant [9 x i8] c"icmp slt\00"
@.str6402 = constant [2 x i8] c"&\00"
@.str6407 = constant [4 x i8] c"and\00"
@.str6412 = constant [2 x i8] c"|\00"
@.str6417 = constant [3 x i8] c"or\00"
@.str6422 = constant [3 x i8] c">=\00"
@.str6427 = constant [9 x i8] c"icmp sge\00"
@.str6432 = constant [3 x i8] c"<=\00"
@.str6437 = constant [9 x i8] c"icmp sle\00"
@.str6441 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6448 = constant [4 x i8] c"add\00"
@.str6455 = constant [3 x i8] c"==\00"
@.str6462 = constant [3 x i8] c"!=\00"
@.str6470 = constant [2 x i8] c"|\00"
@.str6478 = constant [2 x i8] c"&\00"
@.str6486 = constant [2 x i8] c">\00"
@.str6494 = constant [2 x i8] c"<\00"
@.str6502 = constant [3 x i8] c">=\00"
@.str6510 = constant [3 x i8] c"<=\00"
@.str6518 = constant [5 x i8] c"bool\00"
@.str6522 = constant [4 x i8] c"int\00"
@.str6536 = constant [7 x i8] c"NUMBER\00"
@.str6550 = constant [4 x i8] c"int\00"
@.str6564 = constant [5 x i8] c"WORD\00"
@.str6574 = constant [5 x i8] c"null\00"
@.str6581 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str6595 = constant [5 x i8] c"null\00"
@.str6604 = constant [8 x i8] c"nullptr\00"
@.str6611 = constant [17 x i8] c"addr_destination\00"
@.str6623 = constant [12 x i8] c"destination\00"
@.str6667 = constant [4 x i8] c"ptr\00"
@.str6686 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6698 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6712 = constant [8 x i8] c"boolean\00"
@.str6726 = constant [5 x i8] c"bool\00"
@.str6735 = constant [6 x i8] c"false\00"
@.str6742 = constant [2 x i8] c"0\00"
@.str6746 = constant [2 x i8] c"1\00"
@.str6753 = constant [8 x i8] c"fn_call\00"
@.str6770 = constant [7 x i8] c"STRING\00"
@.str6796 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6812 = constant [4 x i8] c"ptr\00"
@.str6825 = constant [4 x i8] c"chr\00"
@.str6832 = constant [4 x i8] c"CHR\00"
@.str6848 = constant [2 x i8] c"0\00"
@.str6864 = constant [22 x i8] c"Invalid character: %s\00"
@.str6880 = constant [4 x i8] c"chr\00"
@.str6884 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6912 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6918 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6923 = constant [4 x i8] c"int\00"
@.str6928 = constant [2 x i8] c"i\00"
@.str6933 = constant [5 x i8] c"bool\00"
@.str6938 = constant [2 x i8] c"b\00"
@.str6943 = constant [5 x i8] c"void\00"
@.str6948 = constant [2 x i8] c"v\00"
@.str6953 = constant [4 x i8] c"chr\00"
@.str6958 = constant [2 x i8] c"c\00"
@.str6963 = constant [4 x i8] c"ptr\00"
@.str6970 = constant [4 x i8] c"%sp\00"
@.str6981 = constant [10 x i8] c"typealias\00"
@.str6992 = constant [6 x i8] c"error\00"
@.str6997 = constant [2 x i8] c"?\00"
@.str6999 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str7011 = constant [7 x i8] c".str%d\00"
@.str7035 = constant [6 x i8] c"array\00"
@.str7048 = constant [4 x i8] c"chr\00"
@.str7066 = constant [3 x i8] c"%d\00"
@.str7075 = constant [7 x i8] c"string\00"
@.str7095 = constant [7 x i8] c"module\00"
@.str7130 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7136 = constant [2 x i8] c"?\00"
@.str7142 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7148 = constant [4 x i8] c"int\00"
@.str7153 = constant [4 x i8] c"i32\00"
@.str7158 = constant [5 x i8] c"void\00"
@.str7163 = constant [5 x i8] c"void\00"
@.str7168 = constant [5 x i8] c"bool\00"
@.str7173 = constant [3 x i8] c"i1\00"
@.str7178 = constant [8 x i8] c"nullptr\00"
@.str7183 = constant [4 x i8] c"ptr\00"
@.str7188 = constant [4 x i8] c"chr\00"
@.str7193 = constant [3 x i8] c"i8\00"
@.str7198 = constant [9 x i8] c"function\00"
@.str7204 = constant [4 x i8] c"%s(\00"
@.str7230 = constant [4 x i8] c"%s,\00"
@.str7235 = constant [5 x i8] c"%s%s\00"
@.str7246 = constant [4 x i8] c"%s)\00"
@.str7254 = constant [4 x i8] c"ptr\00"
@.str7260 = constant [4 x i8] c"%s*\00"
@.str7272 = constant [7 x i8] c"struct\00"
@.str7278 = constant [2 x i8] c"{\00"
@.str7295 = constant [4 x i8] c"%s,\00"
@.str7300 = constant [5 x i8] c"%s%s\00"
@.str7311 = constant [4 x i8] c"%s}\00"
@.str7319 = constant [6 x i8] c"array\00"
@.str7325 = constant [10 x i8] c"[%s x %s]\00"
@.str7344 = constant [10 x i8] c"typealias\00"
@.str7350 = constant [5 x i8] c"%%%s\00"
@.str7360 = constant [7 x i8] c"vararg\00"
@.str7365 = constant [4 x i8] c"...\00"
@.str7370 = constant [6 x i8] c"error\00"
@.str7375 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7451 = constant [9 x i8] c"function\00"
@.str7469 = constant [5 x i8] c"WORD\00"
@.str7526 = constant [10 x i8] c"fn_params\00"
@.str7542 = constant [10 x i8] c"structdef\00"
@.str7549 = constant [7 x i8] c"struct\00"
@.str7556 = constant [5 x i8] c"type\00"
@.str7587 = constant [5 x i8] c"type\00"
@.str7614 = constant [5 x i8] c"type\00"
@.str7620 = constant [12 x i8] c"dotted_name\00"
@.str7634 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str7647 = constant [6 x i8] c"error\00"
@.str7652 = constant [10 x i8] c"typealias\00"
@.str7676 = constant [4 x i8] c"str\00"
@.str7683 = constant [4 x i8] c"ptr\00"
@.str7692 = constant [4 x i8] c"chr\00"
@.str7697 = constant [5 x i8] c"WORD\00"
@.str7710 = constant [4 x i8] c"...\00"
@.str7717 = constant [7 x i8] c"vararg\00"
@.str7721 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7742 = constant [2 x i8] c"*\00"
@.str7751 = constant [4 x i8] c"ptr\00"
@.str7760 = constant [2 x i8] c"[\00"
@.str7770 = constant [2 x i8] c"]\00"
@.str7779 = constant [7 x i8] c"struct\00"
@.str7785 = constant [4 x i8] c"ptr\00"
@.str7789 = constant [6 x i8] c"c_arr\00"
@.str7801 = constant [4 x i8] c"int\00"
@.str7805 = constant [4 x i8] c"len\00"
@.str7814 = constant [4 x i8] c"int\00"
@.str7818 = constant [4 x i8] c"cap\00"
@.str7829 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7841 = load i32, i32* %argc
%.tmp7842 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7841, i8** %.tmp7842)
%.tmp7843 = load i32, i32* @STDERR
%.tmp7845 = getelementptr [2 x i8], [2 x i8]*@.str7844, i32 0, i32 0
%.tmp7846 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7843, i8* %.tmp7845)
%stderr.7847 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7846, %m0$.File.type** %stderr.7847
%.tmp7848 = load i8**, i8*** %argv
%.tmp7849 = getelementptr i8*, i8** %.tmp7848, i32 1
%.tmp7850 = load i8*, i8** %.tmp7849
%filename.7851 = alloca i8*
store i8* %.tmp7850, i8** %filename.7851
%.tmp7852 = call %m0$.File.type*() @tmpfile()
%llvm_code.7853 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7852, %m0$.File.type** %llvm_code.7853
%.tmp7854 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7853
%.tmp7855 = load i8*, i8** %filename.7851
%.tmp7856 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7854, i8* %.tmp7855)
%compiler_ctx.7857 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp7856, %m1861$.CompilerCtx.type** %compiler_ctx.7857
%.tmp7858 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.7857
%.tmp7859 = bitcast ptr null to %m307$.Node.type*
%.tmp7860 = load i8*, i8** %filename.7851
%.tmp7861 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7858, %m307$.Node.type* %.tmp7859, i8* %.tmp7860)
br i1 %.tmp7861, label %.if.true.7862, label %.if.false.7862
.if.true.7862:
%.tmp7863 = load %m0$.File.type*, %m0$.File.type** %stderr.7847
%.tmp7865 = getelementptr [34 x i8], [34 x i8]*@.str7864, i32 0, i32 0
%.tmp7866 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7863, i8* %.tmp7865)
ret i32 1
br label %.if.end.7862
.if.false.7862:
br label %.if.end.7862
.if.end.7862:
%.tmp7867 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7853
%.tmp7868 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7867)
%.tmp7869 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7853
%.tmp7870 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7869)
%llvm_code_size.7871 = alloca i32
store i32 %.tmp7870, i32* %llvm_code_size.7871
%.tmp7872 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7853
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7872)
%.tmp7874 = getelementptr [30 x i8], [30 x i8]*@.str7873, i32 0, i32 0
%.tmp7876 = getelementptr [2 x i8], [2 x i8]*@.str7875, i32 0, i32 0
%.tmp7877 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7874, i8* %.tmp7876)
%proc.7878 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7877, %m0$.File.type** %proc.7878
%.tmp7879 = load %m0$.File.type*, %m0$.File.type** %proc.7878
%.tmp7880 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7879)
%.tmp7881 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7853
%.tmp7882 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7881)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7880, i32 %.tmp7882)
%.tmp7883 = load %m0$.File.type*, %m0$.File.type** %proc.7878
%.tmp7884 = icmp eq %m0$.File.type* %.tmp7883, null
br i1 %.tmp7884, label %.if.true.7885, label %.if.false.7885
.if.true.7885:
%.tmp7886 = load %m0$.File.type*, %m0$.File.type** %stderr.7847
%.tmp7888 = getelementptr [28 x i8], [28 x i8]*@.str7887, i32 0, i32 0
%.tmp7889 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7886, i8* %.tmp7888)
ret i32 0
br label %.if.end.7885
.if.false.7885:
br label %.if.end.7885
.if.end.7885:
%.tmp7890 = load %m0$.File.type*, %m0$.File.type** %proc.7878
%.tmp7891 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7890)
%.tmp7892 = icmp ne i32 %.tmp7891, 0
br i1 %.tmp7892, label %.if.true.7893, label %.if.false.7893
.if.true.7893:
%.tmp7894 = load %m0$.File.type*, %m0$.File.type** %stderr.7847
%.tmp7896 = getelementptr [24 x i8], [24 x i8]*@.str7895, i32 0, i32 0
%.tmp7897 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7894, i8* %.tmp7896)
ret i32 0
br label %.if.end.7893
.if.false.7893:
br label %.if.end.7893
.if.end.7893:
%.tmp7899 = getelementptr [17 x i8], [17 x i8]*@.str7898, i32 0, i32 0
%.tmp7901 = getelementptr [2 x i8], [2 x i8]*@.str7900, i32 0, i32 0
%.tmp7902 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7899, i8* %.tmp7901)
%gcc_proc.7903 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7902, %m0$.File.type** %gcc_proc.7903
%.tmp7904 = load %m0$.File.type*, %m0$.File.type** %gcc_proc.7903
%.tmp7905 = icmp eq %m0$.File.type* %.tmp7904, null
br i1 %.tmp7905, label %.if.true.7906, label %.if.false.7906
.if.true.7906:
%.tmp7907 = load %m0$.File.type*, %m0$.File.type** %stderr.7847
%.tmp7909 = getelementptr [28 x i8], [28 x i8]*@.str7908, i32 0, i32 0
%.tmp7910 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7907, i8* %.tmp7909)
ret i32 0
br label %.if.end.7906
.if.false.7906:
br label %.if.end.7906
.if.end.7906:
%.tmp7911 = load %m0$.File.type*, %m0$.File.type** %proc.7878
%.tmp7912 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7911)
%.tmp7913 = icmp ne i32 %.tmp7912, 0
br i1 %.tmp7913, label %.if.true.7914, label %.if.false.7914
.if.true.7914:
%.tmp7915 = load %m0$.File.type*, %m0$.File.type** %stderr.7847
%.tmp7917 = getelementptr [23 x i8], [23 x i8]*@.str7916, i32 0, i32 0
%.tmp7918 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7915, i8* %.tmp7917)
br label %.if.end.7914
.if.false.7914:
%.tmp7920 = getelementptr [32 x i8], [32 x i8]*@.str7919, i32 0, i32 0
%.tmp7921 = load i8*, i8** %filename.7851
%.tmp7922 = call i32(i8*,...) @printf(i8* %.tmp7920, i8* %.tmp7921)
br label %.if.end.7914
.if.end.7914:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7923 = load i32, i32* %argc
%.tmp7924 = icmp eq i32 %.tmp7923, 2
br i1 %.tmp7924, label %.if.true.7925, label %.if.false.7925
.if.true.7925:
ret void
br label %.if.end.7925
.if.false.7925:
br label %.if.end.7925
.if.end.7925:
%.tmp7927 = getelementptr [21 x i8], [21 x i8]*@.str7926, i32 0, i32 0
%tmpl.7928 = alloca i8*
store i8* %.tmp7927, i8** %tmpl.7928
%.tmp7929 = load i8**, i8*** %argv
%.tmp7930 = getelementptr i8*, i8** %.tmp7929, i32 0
%.tmp7931 = load i8*, i8** %.tmp7930
%.tmp7932 = call i32(i8*) @strlen(i8* %.tmp7931)
%.tmp7933 = load i8*, i8** %tmpl.7928
%.tmp7934 = call i32(i8*) @strlen(i8* %.tmp7933)
%.tmp7935 = add i32 %.tmp7932, %.tmp7934
%len_filename.7936 = alloca i32
store i32 %.tmp7935, i32* %len_filename.7936
%.tmp7937 = load i32, i32* %len_filename.7936
%.tmp7938 = call i8*(i32) @malloc(i32 %.tmp7937)
%buf.7939 = alloca i8*
store i8* %.tmp7938, i8** %buf.7939
%.tmp7940 = load i8*, i8** %buf.7939
%.tmp7941 = load i8*, i8** %tmpl.7928
%.tmp7942 = load i8**, i8*** %argv
%.tmp7943 = getelementptr i8*, i8** %.tmp7942, i32 0
%.tmp7944 = load i8*, i8** %.tmp7943
%.tmp7945 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7940, i8* %.tmp7941, i8* %.tmp7944)
%.tmp7946 = load i8*, i8** %buf.7939
%.tmp7947 = call i32(i8*) @puts(i8* %.tmp7946)
%.tmp7948 = load i8*, i8** %buf.7939
call void(i8*) @free(i8* %.tmp7948)
call void(i32) @exit(i32 1)
ret void
}
@.str7844 = constant [2 x i8] c"w\00"
@.str7864 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7873 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7875 = constant [2 x i8] c"w\00"
@.str7887 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7895 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7898 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7900 = constant [2 x i8] c"w\00"
@.str7908 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7916 = constant [23 x i8] c"error on gcc execution\00"
@.str7919 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7926 = constant [21 x i8] c"Usage: %s <filename>\00"
