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
define i8* @m2531$append_tmpl.cp() {
%.tmp2533 = getelementptr [1883 x i8], [1883 x i8]*@.str2532, i32 0, i32 0
ret i8* %.tmp2533
}
@.str2532 = constant [1883 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
%.tmp2534 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2535 = icmp eq %m1861$.Type.type* %.tmp2534, null
br i1 %.tmp2535, label %.if.true.2536, label %.if.false.2536
.if.true.2536:
%.tmp2537 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp2537
br label %.if.end.2536
.if.false.2536:
br label %.if.end.2536
.if.end.2536:
%.tmp2538 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2539 = ptrtoint %m1861$.Type.type* %.tmp2538 to i32
%.tmp2540 = call i8*(i32) @malloc(i32 %.tmp2539)
%.tmp2541 = bitcast i8* %.tmp2540 to %m1861$.Type.type*
%clone.2542 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2541, %m1861$.Type.type** %clone.2542
%.tmp2543 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2542
%.tmp2544 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2543, i32 0, i32 3
%.tmp2545 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2546 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2545, i32 0, i32 3
%.tmp2547 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2546
store %m1861$.Type.type* %.tmp2547, %m1861$.Type.type** %.tmp2544
%.tmp2548 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2542
%.tmp2549 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2548, i32 0, i32 4
%.tmp2550 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2551 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2550, i32 0, i32 4
%.tmp2552 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2551
%.tmp2553 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2552)
store %m1861$.Type.type* %.tmp2553, %m1861$.Type.type** %.tmp2549
%.tmp2554 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2542
%.tmp2555 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2554, i32 0, i32 2
%.tmp2556 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2557 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2556, i32 0, i32 2
%.tmp2558 = load i8*, i8** %.tmp2557
store i8* %.tmp2558, i8** %.tmp2555
%.tmp2559 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2542
%.tmp2560 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2559, i32 0, i32 0
%.tmp2561 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2562 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2561, i32 0, i32 0
%.tmp2563 = load i8*, i8** %.tmp2562
store i8* %.tmp2563, i8** %.tmp2560
%.tmp2564 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2542
%.tmp2565 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2564, i32 0, i32 1
%.tmp2566 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2567 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2566, i32 0, i32 1
%.tmp2568 = load i8*, i8** %.tmp2567
store i8* %.tmp2568, i8** %.tmp2565
%.tmp2569 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2542
ret %m1861$.Type.type* %.tmp2569
}
define %m1861$.Type.type* @m1861$new_type.m1861$.Type.typep() {
%.tmp2570 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2571 = ptrtoint %m1861$.Type.type* %.tmp2570 to i32
%.tmp2572 = call i8*(i32) @malloc(i32 %.tmp2571)
%.tmp2573 = bitcast i8* %.tmp2572 to %m1861$.Type.type*
%type.2574 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2573, %m1861$.Type.type** %type.2574
%.tmp2575 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2574
%.tmp2576 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2575, i32 0, i32 1
store i8* null, i8** %.tmp2576
%.tmp2577 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2574
%.tmp2578 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2577, i32 0, i32 2
store i8* null, i8** %.tmp2578
%.tmp2579 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2574
%.tmp2580 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2579, i32 0, i32 0
store i8* null, i8** %.tmp2580
%.tmp2581 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2574
%.tmp2582 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2581, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2582
%.tmp2583 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2574
%.tmp2584 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2583, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2584
%.tmp2585 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2574
ret %m1861$.Type.type* %.tmp2585
}
define void @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.dest.arg, %m1861$.Type.type* %.src.arg) {
%dest = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.dest.arg, %m1861$.Type.type** %dest
%src = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.src.arg, %m1861$.Type.type** %src
%.tmp2586 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2587 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2586, i32 0, i32 0
%.tmp2588 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2589 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2588, i32 0, i32 0
%.tmp2590 = load i8*, i8** %.tmp2589
store i8* %.tmp2590, i8** %.tmp2587
%.tmp2591 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2592 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2591, i32 0, i32 1
%.tmp2593 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2594 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2593, i32 0, i32 1
%.tmp2595 = load i8*, i8** %.tmp2594
store i8* %.tmp2595, i8** %.tmp2592
%.tmp2596 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2597 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2596, i32 0, i32 2
%.tmp2598 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2599 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2598, i32 0, i32 2
%.tmp2600 = load i8*, i8** %.tmp2599
store i8* %.tmp2600, i8** %.tmp2597
%.tmp2601 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2602 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2601, i32 0, i32 3
%.tmp2603 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2602
%.tmp2604 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2605 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2604, i32 0, i32 3
%.tmp2606 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2605
%.tmp2607 = icmp ne %m1861$.Type.type* %.tmp2603, %.tmp2606
br i1 %.tmp2607, label %.if.true.2608, label %.if.false.2608
.if.true.2608:
%.tmp2609 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2610 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2609, i32 0, i32 3
%.tmp2611 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2612 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2611, i32 0, i32 3
%.tmp2613 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2612
store %m1861$.Type.type* %.tmp2613, %m1861$.Type.type** %.tmp2610
%.tmp2614 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2615 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2614, i32 0, i32 3
%.tmp2616 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2615
%.tmp2617 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2618 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2617, i32 0, i32 3
%.tmp2619 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2618
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2616, %m1861$.Type.type* %.tmp2619)
br label %.if.end.2608
.if.false.2608:
br label %.if.end.2608
.if.end.2608:
%.tmp2620 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2621 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2620, i32 0, i32 4
%.tmp2622 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2621
%.tmp2623 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2624 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2623, i32 0, i32 4
%.tmp2625 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2624
%.tmp2626 = icmp ne %m1861$.Type.type* %.tmp2622, %.tmp2625
br i1 %.tmp2626, label %.if.true.2627, label %.if.false.2627
.if.true.2627:
%.tmp2628 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2629 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2628, i32 0, i32 4
%.tmp2630 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2631 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2630, i32 0, i32 4
%.tmp2632 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2631
store %m1861$.Type.type* %.tmp2632, %m1861$.Type.type** %.tmp2629
%.tmp2633 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2634 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2633, i32 0, i32 4
%.tmp2635 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2634
%.tmp2636 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2637 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2636, i32 0, i32 4
%.tmp2638 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2637
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2635, %m1861$.Type.type* %.tmp2638)
br label %.if.end.2627
.if.false.2627:
br label %.if.end.2627
.if.end.2627:
ret void
}
define void @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2639 = load i32, i32* %level
%.tmp2640 = add i32 %.tmp2639, 1
%.tmp2641 = call i8*(i32) @malloc(i32 %.tmp2640)
%.tmp2642 = bitcast i8* %.tmp2641 to i8*
%indent.2643 = alloca i8*
store i8* %.tmp2642, i8** %indent.2643
%i.2645 = alloca i32
store i32 0, i32* %i.2645
br label %.for.start.2644
.for.start.2644:
%.tmp2646 = load i32, i32* %i.2645
%.tmp2647 = load i32, i32* %level
%.tmp2648 = icmp slt i32 %.tmp2646, %.tmp2647
br i1 %.tmp2648, label %.for.continue.2644, label %.for.end.2644
.for.continue.2644:
%.tmp2649 = load i32, i32* %i.2645
%.tmp2650 = load i8*, i8** %indent.2643
%.tmp2651 = getelementptr i8, i8* %.tmp2650, i32 %.tmp2649
store i8 32, i8* %.tmp2651
%.tmp2652 = load i32, i32* %i.2645
%.tmp2653 = add i32 %.tmp2652, 1
store i32 %.tmp2653, i32* %i.2645
br label %.for.start.2644
.for.end.2644:
%.tmp2654 = load i32, i32* %level
%.tmp2655 = load i8*, i8** %indent.2643
%.tmp2656 = getelementptr i8, i8* %.tmp2655, i32 %.tmp2654
store i8 0, i8* %.tmp2656
%.tmp2658 = getelementptr [5 x i8], [5 x i8]*@.str2657, i32 0, i32 0
%.tmp2659 = load i8*, i8** %indent.2643
%.tmp2660 = call i32(i8*,...) @printf(i8* %.tmp2658, i8* %.tmp2659)
%.tmp2662 = getelementptr [21 x i8], [21 x i8]*@.str2661, i32 0, i32 0
%.tmp2663 = load i8*, i8** %indent.2643
%.tmp2664 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2665 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2664, i32 0, i32 0
%.tmp2666 = load i8*, i8** %.tmp2665
%.tmp2667 = call i32(i8*,...) @printf(i8* %.tmp2662, i8* %.tmp2663, i8* %.tmp2666)
%.tmp2669 = getelementptr [16 x i8], [16 x i8]*@.str2668, i32 0, i32 0
%.tmp2670 = load i8*, i8** %indent.2643
%.tmp2671 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2672 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2671, i32 0, i32 1
%.tmp2673 = load i8*, i8** %.tmp2672
%.tmp2674 = call i32(i8*,...) @printf(i8* %.tmp2669, i8* %.tmp2670, i8* %.tmp2673)
%.tmp2676 = getelementptr [16 x i8], [16 x i8]*@.str2675, i32 0, i32 0
%.tmp2677 = load i8*, i8** %indent.2643
%.tmp2678 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2679 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2678, i32 0, i32 2
%.tmp2680 = load i8*, i8** %.tmp2679
%.tmp2681 = call i32(i8*,...) @printf(i8* %.tmp2676, i8* %.tmp2677, i8* %.tmp2680)
%.tmp2682 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2683 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2682, i32 0, i32 3
%.tmp2684 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2683
%.tmp2685 = icmp eq %m1861$.Type.type* %.tmp2684, null
br i1 %.tmp2685, label %.if.true.2686, label %.if.false.2686
.if.true.2686:
%.tmp2688 = getelementptr [16 x i8], [16 x i8]*@.str2687, i32 0, i32 0
%.tmp2689 = load i8*, i8** %indent.2643
%.tmp2690 = call i32(i8*,...) @printf(i8* %.tmp2688, i8* %.tmp2689)
br label %.if.end.2686
.if.false.2686:
%.tmp2692 = getelementptr [10 x i8], [10 x i8]*@.str2691, i32 0, i32 0
%.tmp2693 = load i8*, i8** %indent.2643
%.tmp2694 = call i32(i8*,...) @printf(i8* %.tmp2692, i8* %.tmp2693)
%.tmp2695 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2696 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2695, i32 0, i32 3
%.tmp2697 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2696
%.tmp2698 = load i32, i32* %level
%.tmp2699 = add i32 %.tmp2698, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2697, i32 %.tmp2699)
br label %.if.end.2686
.if.end.2686:
%.tmp2700 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2701 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2700, i32 0, i32 4
%.tmp2702 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2701
%.tmp2703 = icmp eq %m1861$.Type.type* %.tmp2702, null
br i1 %.tmp2703, label %.if.true.2704, label %.if.false.2704
.if.true.2704:
%.tmp2706 = getelementptr [18 x i8], [18 x i8]*@.str2705, i32 0, i32 0
%.tmp2707 = load i8*, i8** %indent.2643
%.tmp2708 = call i32(i8*,...) @printf(i8* %.tmp2706, i8* %.tmp2707)
br label %.if.end.2704
.if.false.2704:
%.tmp2710 = getelementptr [12 x i8], [12 x i8]*@.str2709, i32 0, i32 0
%.tmp2711 = load i8*, i8** %indent.2643
%.tmp2712 = call i32(i8*,...) @printf(i8* %.tmp2710, i8* %.tmp2711)
%.tmp2713 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2714 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2713, i32 0, i32 4
%.tmp2715 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2714
%.tmp2716 = load i32, i32* %level
%.tmp2717 = add i32 %.tmp2716, 1
call void(%m1861$.Type.type*,i32) @m1861$debug_type.v.m1861$.Type.typep.i(%m1861$.Type.type* %.tmp2715, i32 %.tmp2717)
br label %.if.end.2704
.if.end.2704:
%.tmp2719 = getelementptr [5 x i8], [5 x i8]*@.str2718, i32 0, i32 0
%.tmp2720 = load i8*, i8** %indent.2643
%.tmp2721 = call i32(i8*,...) @printf(i8* %.tmp2719, i8* %.tmp2720)
ret void
}
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,%m1861$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1861$.AssignableInfo.type* @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.node.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2722 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* null, i32 1
%.tmp2723 = ptrtoint %m1861$.AssignableInfo.type* %.tmp2722 to i32
%.tmp2724 = call i8*(i32) @malloc(i32 %.tmp2723)
%.tmp2725 = bitcast i8* %.tmp2724 to %m1861$.AssignableInfo.type*
%ptr.2726 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp2725, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2727 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2728 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2727, i32 0, i32 1
%.tmp2729 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2729, i8* %.tmp2728
%.tmp2730 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2731 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2730, i32 0, i32 0
store i8* null, i8** %.tmp2731
%.tmp2732 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2733 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2732, i32 0, i32 2
store i8* null, i8** %.tmp2733
%.tmp2734 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2735 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2734, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2735
%.tmp2736 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2737 = icmp ne %m307$.Node.type* %.tmp2736, null
br i1 %.tmp2737, label %.if.true.2738, label %.if.false.2738
.if.true.2738:
%.tmp2739 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2740 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2739, i32 0, i32 4
%.tmp2741 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2742 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2741, i32 0, i32 3
%.tmp2743 = load i32, i32* %.tmp2742
store i32 %.tmp2743, i32* %.tmp2740
%.tmp2744 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2745 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2744, i32 0, i32 5
%.tmp2746 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2747 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2746, i32 0, i32 4
%.tmp2748 = load i32, i32* %.tmp2747
store i32 %.tmp2748, i32* %.tmp2745
%.tmp2749 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2750 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2749, i32 0, i32 6
%.tmp2751 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2752 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2751, i32 0, i32 2
%.tmp2753 = load i8*, i8** %.tmp2752
store i8* %.tmp2753, i8** %.tmp2750
br label %.if.end.2738
.if.false.2738:
%.tmp2754 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2755 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2754, i32 0, i32 4
store i32 0, i32* %.tmp2755
%.tmp2756 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2757 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2756, i32 0, i32 5
store i32 0, i32* %.tmp2757
%.tmp2758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
%.tmp2759 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2758, i32 0, i32 6
store i8* null, i8** %.tmp2759
br label %.if.end.2738
.if.end.2738:
%.tmp2760 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2726
ret %m1861$.AssignableInfo.type* %.tmp2760
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2761 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2762 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2761, i32 0, i32 0
%.tmp2763 = load i8*, i8** %id
store i8* %.tmp2763, i8** %.tmp2762
%.tmp2764 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2765 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2764, i32 0, i32 1
%.tmp2766 = load i8, i8* %scope
store i8 %.tmp2766, i8* %.tmp2765
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2767 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2768 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2767, i32 0, i32 1
%.tmp2769 = load i8, i8* %.tmp2768
%.tmp2770 = load i8, i8* @SCOPE_CONST
%.tmp2771 = icmp eq i8 %.tmp2769, %.tmp2770
br i1 %.tmp2771, label %.if.true.2772, label %.if.false.2772
.if.true.2772:
%.tmp2773 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2774 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2773, i32 0, i32 0
%.tmp2775 = load i8*, i8** %.tmp2774
ret i8* %.tmp2775
br label %.if.end.2772
.if.false.2772:
br label %.if.end.2772
.if.end.2772:
%buf.2776 = alloca i8*
store i8* null, i8** %buf.2776
%.tmp2777 = getelementptr i8*, i8** %buf.2776, i32 0
%.tmp2779 = getelementptr [5 x i8], [5 x i8]*@.str2778, i32 0, i32 0
%.tmp2780 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2781 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2780, i32 0, i32 1
%.tmp2782 = load i8, i8* %.tmp2781
%.tmp2783 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2784 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2783, i32 0, i32 0
%.tmp2785 = load i8*, i8** %.tmp2784
%.tmp2786 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2777, i8* %.tmp2779, i8 %.tmp2782, i8* %.tmp2785)
%.tmp2787 = load i8*, i8** %buf.2776
ret i8* %.tmp2787
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
%tmp_buff.2788 = alloca i8*
store i8* null, i8** %tmp_buff.2788
%.tmp2789 = getelementptr i8*, i8** %tmp_buff.2788, i32 0
%.tmp2791 = getelementptr [7 x i8], [7 x i8]*@.str2790, i32 0, i32 0
%.tmp2792 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2793 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2792)
%.tmp2794 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2789, i8* %.tmp2791, i32 %.tmp2793)
%.tmp2795 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2796 = load i8, i8* @SCOPE_LOCAL
%.tmp2797 = load i8*, i8** %tmp_buff.2788
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2795, i8 %.tmp2796, i8* %.tmp2797)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2799 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2800 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2799, i32 0, i32 5
%.tmp2801 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2800
%m.2802 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2801, %m1861$.ModuleLookup.type** %m.2802
br label %.for.start.2798
.for.start.2798:
%.tmp2803 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2802
%.tmp2804 = icmp ne %m1861$.ModuleLookup.type* %.tmp2803, null
br i1 %.tmp2804, label %.for.continue.2798, label %.for.end.2798
.for.continue.2798:
%.tmp2805 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2802
%.tmp2806 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2805, i32 0, i32 0
%.tmp2807 = load i8*, i8** %.tmp2806
%.tmp2808 = load i8*, i8** %filename
%.tmp2809 = call i32(i8*,i8*) @strcmp(i8* %.tmp2807, i8* %.tmp2808)
%.tmp2810 = icmp eq i32 %.tmp2809, 0
br i1 %.tmp2810, label %.if.true.2811, label %.if.false.2811
.if.true.2811:
%.tmp2812 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2802
ret %m1861$.ModuleLookup.type* %.tmp2812
br label %.if.end.2811
.if.false.2811:
br label %.if.end.2811
.if.end.2811:
%.tmp2813 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2802
%.tmp2814 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2813, i32 0, i32 2
%.tmp2815 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2814
store %m1861$.ModuleLookup.type* %.tmp2815, %m1861$.ModuleLookup.type** %m.2802
br label %.for.start.2798
.for.end.2798:
%.tmp2816 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2816
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2817 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2818 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2819 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2818, i32 0, i32 6
%.tmp2820 = load i8*, i8** %.tmp2819
%.tmp2821 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2817, i8* %.tmp2820)
ret %m1861$.ModuleLookup.type* %.tmp2821
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2822 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2823 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2822, i32 0, i32 4
%.tmp2824 = load i32, i32* %.tmp2823
%uid.2825 = alloca i32
store i32 %.tmp2824, i32* %uid.2825
%.tmp2826 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2827 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2826, i32 0, i32 4
%.tmp2828 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2829 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2828, i32 0, i32 4
%.tmp2830 = load i32, i32* %.tmp2829
%.tmp2831 = add i32 %.tmp2830, 1
store i32 %.tmp2831, i32* %.tmp2827
%.tmp2832 = load i32, i32* %uid.2825
ret i32 %.tmp2832
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2833 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2834 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2833 to i32
%.tmp2835 = call i8*(i32) @malloc(i32 %.tmp2834)
%.tmp2836 = bitcast i8* %.tmp2835 to %m1861$.CompilerCtx.type*
%ctx.2837 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2836, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2839 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2838, i32 0, i32 1
%.tmp2840 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2840, %m0$.File.type** %.tmp2839
%.tmp2841 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2842 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2841, i32 0, i32 0
%.tmp2843 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2843, %m307$.Node.type** %.tmp2842
%.tmp2844 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2845 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2844, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2845
%.tmp2846 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2847 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2846, i32 0, i32 4
store i32 0, i32* %.tmp2847
%.tmp2848 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2849 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2848, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2849
%.tmp2850 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2851 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2850, i32 0, i32 6
%.tmp2852 = load i8*, i8** %filename
store i8* %.tmp2852, i8** %.tmp2851
%.tmp2853 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2854 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2853, i32 0, i32 5
%.tmp2855 = load i32, i32* @ModuleLookup_size
%.tmp2856 = call i8*(i32) @malloc(i32 %.tmp2855)
%.tmp2857 = bitcast i8* %.tmp2856 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2857, %m1861$.ModuleLookup.type** %.tmp2854
%.tmp2858 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2859 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2858, i32 0, i32 5
%.tmp2860 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2859
%.tmp2861 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2860, i32 0, i32 0
%.tmp2862 = load i8*, i8** %filename
store i8* %.tmp2862, i8** %.tmp2861
%.tmp2863 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2864 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2863, i32 0, i32 5
%.tmp2865 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2864
%.tmp2866 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2865, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2866
%.tmp2867 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2868 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2867, i32 0, i32 5
%.tmp2869 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2868
%.tmp2870 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2869, i32 0, i32 1
%.tmp2872 = getelementptr [1 x i8], [1 x i8]*@.str2871, i32 0, i32 0
store i8* %.tmp2872, i8** %.tmp2870
%.tmp2873 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2874 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2873, i32 0, i32 5
%.tmp2875 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2874
%.tmp2876 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2875, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2876
%.tmp2877 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2837
%.tmp2878 = bitcast %m1861$.CompilerCtx.type* %.tmp2877 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2878
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
%.tmp2879 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2880 = ptrtoint %m1861$.Scope.type* %.tmp2879 to i32
%.tmp2881 = call i8*(i32) @malloc(i32 %.tmp2880)
%.tmp2882 = bitcast i8* %.tmp2881 to %m1861$.Scope.type*
%s.2883 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2882, %m1861$.Scope.type** %s.2883
%.tmp2884 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2885 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2884)
%m.2886 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2885, %m1861$.ModuleLookup.type** %m.2886
%.tmp2887 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2883
%.tmp2888 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2887, i32 0, i32 5
%.tmp2889 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2886
%.tmp2890 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2889, i32 0, i32 3
%.tmp2891 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2890
store %m1861$.Scope.type* %.tmp2891, %m1861$.Scope.type** %.tmp2888
%.tmp2892 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2883
%.tmp2893 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2892, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2893
%.tmp2894 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2883
%.tmp2895 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2894, i32 0, i32 2
%.tmp2896 = load i8*, i8** %type
store i8* %.tmp2896, i8** %.tmp2895
%.tmp2897 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2883
%.tmp2898 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2897, i32 0, i32 3
%.tmp2899 = load i8*, i8** %begin_id
store i8* %.tmp2899, i8** %.tmp2898
%.tmp2900 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2883
%.tmp2901 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2900, i32 0, i32 4
%.tmp2902 = load i8*, i8** %end_id
store i8* %.tmp2902, i8** %.tmp2901
%.tmp2903 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2886
%.tmp2904 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2903, i32 0, i32 3
%.tmp2905 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2883
store %m1861$.Scope.type* %.tmp2905, %m1861$.Scope.type** %.tmp2904
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2906 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2907 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2906)
%m.2908 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2907, %m1861$.ModuleLookup.type** %m.2908
%.tmp2909 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2908
%.tmp2910 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2909, i32 0, i32 3
%.tmp2911 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2910
%.tmp2912 = icmp ne %m1861$.Scope.type* %.tmp2911, null
%.tmp2914 = getelementptr [61 x i8], [61 x i8]*@.str2913, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2912, i8* %.tmp2914)
%.tmp2915 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2908
%.tmp2916 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2915, i32 0, i32 3
%.tmp2917 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2908
%.tmp2918 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2917, i32 0, i32 3
%.tmp2919 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2918
%.tmp2920 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2919, i32 0, i32 5
%.tmp2921 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2920
store %m1861$.Scope.type* %.tmp2921, %m1861$.Scope.type** %.tmp2916
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2922 = call i8*() @m1862$grammar.cp()
%.tmp2923 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2922)
%grammar_file.2924 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2923, %m0$.File.type** %grammar_file.2924
%.tmp2925 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2924
%.tmp2926 = icmp eq %m0$.File.type* %.tmp2925, null
br i1 %.tmp2926, label %.if.true.2927, label %.if.false.2927
.if.true.2927:
ret i1 0
br label %.if.end.2927
.if.false.2927:
br label %.if.end.2927
.if.end.2927:
%.tmp2928 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2924
%.tmp2929 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2928)
%grammar_ctx.2930 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2929, %m307$.ParsingContext.type** %grammar_ctx.2930
%.tmp2931 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2930
%.tmp2932 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2931)
%grammar.2933 = alloca %m307$.Rule.type**
store %m307$.Rule.type** %.tmp2932, %m307$.Rule.type*** %grammar.2933
%.tmp2934 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2930
%.tmp2935 = bitcast %m307$.ParsingContext.type* %.tmp2934 to i8*
call void(i8*) @free(i8* %.tmp2935)
%.tmp2936 = load i8*, i8** %filepath
%.tmp2937 = load i32, i32* @O_RDONLY
%.tmp2938 = call i32(i8*,i32) @open(i8* %.tmp2936, i32 %.tmp2937)
%input_fd.2939 = alloca i32
store i32 %.tmp2938, i32* %input_fd.2939
%.tmp2940 = load i32, i32* %input_fd.2939
%.tmp2941 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2940)
%p.2942 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2941, %m229$.PeekerInfo.type** %p.2942
%.tmp2943 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2942
%.tmp2944 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2943, i32 0, i32 6
%.tmp2945 = load i8*, i8** %filepath
store i8* %.tmp2945, i8** %.tmp2944
%.tmp2946 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2942
%.tmp2947 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2946, i1 0)
%tokens.2948 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2947, %m308$.Token.type** %tokens.2948
%.tmp2949 = load %m307$.Rule.type**, %m307$.Rule.type*** %grammar.2933
%.tmp2951 = getelementptr [6 x i8], [6 x i8]*@.str2950, i32 0, i32 0
%.tmp2952 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2948
%.tmp2953 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2949, i8* %.tmp2951, %m308$.Token.type* %.tmp2952)
%ast.2954 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2953, %m307$.ParseResult.type** %ast.2954
%.tmp2955 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2956 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2954
%.tmp2957 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2956, i32 0, i32 1
%.tmp2958 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2957
%.tmp2959 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2955, %m307$.Node.type* %.tmp2958)
ret i1 %.tmp2959
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2960 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2961 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2960, %m307$.Node.type* %.tmp2961)
%.tmp2962 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2963 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2962, i32 0, i32 2
%.tmp2964 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2963
%.tmp2965 = icmp ne %m1861$.ErrorList.type* %.tmp2964, null
%has_errors.2966 = alloca i1
store i1 %.tmp2965, i1* %has_errors.2966
%.tmp2968 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2969 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2968, i32 0, i32 2
%.tmp2970 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2969
%err.2971 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp2970, %m1861$.ErrorList.type** %err.2971
br label %.for.start.2967
.for.start.2967:
%.tmp2972 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2971
%.tmp2973 = icmp ne %m1861$.ErrorList.type* %.tmp2972, null
br i1 %.tmp2973, label %.for.continue.2967, label %.for.end.2967
.for.continue.2967:
%.tmp2974 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2971
%.tmp2975 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2974, i32 0, i32 2
%.tmp2976 = load i1, i1* %.tmp2975
%.tmp2977 = icmp eq i1 %.tmp2976, 0
br i1 %.tmp2977, label %.if.true.2978, label %.if.false.2978
.if.true.2978:
%.tmp2979 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2971
%.tmp2980 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2979, i32 0, i32 0
%.tmp2981 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2980
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp2981)
%.tmp2982 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2971
%.tmp2983 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2982, i32 0, i32 2
store i1 1, i1* %.tmp2983
br label %.if.end.2978
.if.false.2978:
br label %.if.end.2978
.if.end.2978:
%.tmp2984 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2971
%.tmp2985 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2984, i32 0, i32 1
%.tmp2986 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2985
store %m1861$.ErrorList.type* %.tmp2986, %m1861$.ErrorList.type** %err.2971
br label %.for.start.2967
.for.end.2967:
%.tmp2988 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2989 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2988, i32 0, i32 3
%.tmp2990 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2989
%g.2991 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp2990, %m1861$.GlobalName.type** %g.2991
br label %.for.start.2987
.for.start.2987:
%.tmp2992 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2991
%.tmp2993 = icmp ne %m1861$.GlobalName.type* %.tmp2992, null
br i1 %.tmp2993, label %.for.continue.2987, label %.for.end.2987
.for.continue.2987:
%.tmp2994 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2995 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2991
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp2994, %m1861$.GlobalName.type* %.tmp2995)
%.tmp2996 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2991
%.tmp2997 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2996, i32 0, i32 4
%.tmp2998 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2997
store %m1861$.GlobalName.type* %.tmp2998, %m1861$.GlobalName.type** %g.2991
br label %.for.start.2987
.for.end.2987:
%.tmp2999 = load i1, i1* %has_errors.2966
ret i1 %.tmp2999
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp3000 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3001 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3000, i32 0, i32 0
%.tmp3002 = load i8*, i8** %.tmp3001
%.tmp3004 = getelementptr [6 x i8], [6 x i8]*@.str3003, i32 0, i32 0
%.tmp3005 = call i32(i8*,i8*) @strcmp(i8* %.tmp3002, i8* %.tmp3004)
%.tmp3006 = icmp ne i32 %.tmp3005, 0
br i1 %.tmp3006, label %.if.true.3007, label %.if.false.3007
.if.true.3007:
ret void
br label %.if.end.3007
.if.false.3007:
br label %.if.end.3007
.if.end.3007:
%.tmp3008 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3010 = getelementptr [7 x i8], [7 x i8]*@.str3009, i32 0, i32 0
%.tmp3011 = bitcast ptr null to i8*
%.tmp3012 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3008, i8* %.tmp3010, i8* %.tmp3011, i8* %.tmp3012)
%.tmp3013 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3014 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3013, i32 0, i32 6
%.tmp3015 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3014
%start.3016 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3015, %m307$.Node.type** %start.3016
%.tmp3017 = load %m307$.Node.type*, %m307$.Node.type** %start.3016
%.tmp3018 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3017, i32 0, i32 0
%.tmp3019 = load i8*, i8** %.tmp3018
%.tmp3021 = getelementptr [13 x i8], [13 x i8]*@.str3020, i32 0, i32 0
%.tmp3022 = call i32(i8*,i8*) @strcmp(i8* %.tmp3019, i8* %.tmp3021)
%.tmp3023 = icmp eq i32 %.tmp3022, 0
br i1 %.tmp3023, label %.if.true.3024, label %.if.false.3024
.if.true.3024:
%.tmp3025 = load %m307$.Node.type*, %m307$.Node.type** %start.3016
%.tmp3026 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3025, i32 0, i32 7
%.tmp3027 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3026
store %m307$.Node.type* %.tmp3027, %m307$.Node.type** %start.3016
br label %.if.end.3024
.if.false.3024:
br label %.if.end.3024
.if.end.3024:
%.tmp3029 = load %m307$.Node.type*, %m307$.Node.type** %start.3016
%stmt.3030 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3029, %m307$.Node.type** %stmt.3030
br label %.for.start.3028
.for.start.3028:
%.tmp3031 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3030
%.tmp3032 = icmp ne %m307$.Node.type* %.tmp3031, null
br i1 %.tmp3032, label %.for.continue.3028, label %.for.end.3028
.for.continue.3028:
%.tmp3033 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3034 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3030
%.tmp3035 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3034, i32 0, i32 6
%.tmp3036 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3035
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3033, %m307$.Node.type* %.tmp3036, i1 1)
%.tmp3037 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3030
%.tmp3038 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3037, i32 0, i32 7
%.tmp3039 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3038
store %m307$.Node.type* %.tmp3039, %m307$.Node.type** %stmt.3030
br label %.for.start.3028
.for.end.3028:
%.tmp3041 = load %m307$.Node.type*, %m307$.Node.type** %start.3016
%s.3042 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3041, %m307$.Node.type** %s.3042
br label %.for.start.3040
.for.start.3040:
%.tmp3043 = load %m307$.Node.type*, %m307$.Node.type** %s.3042
%.tmp3044 = icmp ne %m307$.Node.type* %.tmp3043, null
br i1 %.tmp3044, label %.for.continue.3040, label %.for.end.3040
.for.continue.3040:
%.tmp3045 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3046 = load %m307$.Node.type*, %m307$.Node.type** %s.3042
%.tmp3047 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3046, i32 0, i32 6
%.tmp3048 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3047
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3045, %m307$.Node.type* %.tmp3048, i1 0)
%.tmp3049 = load %m307$.Node.type*, %m307$.Node.type** %s.3042
%.tmp3050 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3049, i32 0, i32 7
%.tmp3051 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3050
store %m307$.Node.type* %.tmp3051, %m307$.Node.type** %s.3042
br label %.for.start.3040
.for.end.3040:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp3052 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3053 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3052, i32 0, i32 2
%.tmp3054 = load i1, i1* %.tmp3053
%.tmp3055 = icmp eq i1 %.tmp3054, 0
%.tmp3056 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3057 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3056, i32 0, i32 1
%.tmp3058 = load i8*, i8** %.tmp3057
%.tmp3060 = getelementptr [7 x i8], [7 x i8]*@.str3059, i32 0, i32 0
%.tmp3061 = call i32(i8*,i8*) @strcmp(i8* %.tmp3058, i8* %.tmp3060)
%.tmp3062 = icmp eq i32 %.tmp3061, 0
%.tmp3063 = and i1 %.tmp3055, %.tmp3062
br i1 %.tmp3063, label %.if.true.3064, label %.if.false.3064
.if.true.3064:
%.tmp3065 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3066 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3065, i32 0, i32 1
%.tmp3067 = load %m0$.File.type*, %m0$.File.type** %.tmp3066
%.tmp3069 = getelementptr [21 x i8], [21 x i8]*@.str3068, i32 0, i32 0
%.tmp3070 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3071 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3070, i32 0, i32 3
%.tmp3072 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3071
%.tmp3073 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3072)
%.tmp3074 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3075 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3076 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3075, i32 0, i32 3
%.tmp3077 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3076
%.tmp3078 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3077, i32 0, i32 3
%.tmp3079 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3078
%.tmp3080 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3074, %m1861$.Type.type* %.tmp3079)
%.tmp3081 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3082 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3081, i32 0, i32 0
%.tmp3083 = load i8*, i8** %.tmp3082
%.tmp3084 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3067, i8* %.tmp3069, i8* %.tmp3073, i8* %.tmp3080, i8* %.tmp3083)
%.tmp3085 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3086 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3085, i32 0, i32 2
store i1 1, i1* %.tmp3086
br label %.if.end.3064
.if.false.3064:
br label %.if.end.3064
.if.end.3064:
ret void
}
define i8* @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3087 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3088 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3087)
%m.3089 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3088, %m1861$.ModuleLookup.type** %m.3089
%.tmp3090 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3089
%.tmp3091 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3090, i32 0, i32 1
%.tmp3092 = load i8*, i8** %.tmp3091
ret i8* %.tmp3092
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
%mangled_name.3093 = alloca i8*
store i8* null, i8** %mangled_name.3093
%.tmp3094 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3095 = load %m307$.Node.type*, %m307$.Node.type** %fn
%.tmp3096 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3095, i32 0, i32 2
%.tmp3097 = load i8*, i8** %.tmp3096
%.tmp3098 = call i8*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3094, i8* %.tmp3097)
%prefix.3099 = alloca i8*
store i8* %.tmp3098, i8** %prefix.3099
%.tmp3100 = getelementptr i8*, i8** %mangled_name.3093, i32 0
%.tmp3102 = getelementptr [5 x i8], [5 x i8]*@.str3101, i32 0, i32 0
%.tmp3103 = load i8*, i8** %prefix.3099
%.tmp3104 = load i8*, i8** %original_name
%.tmp3105 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3100, i8* %.tmp3102, i8* %.tmp3103, i8* %.tmp3104)
%.tmp3106 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3107 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3106, i32 0, i32 0
%.tmp3108 = load i8*, i8** %.tmp3107
%.tmp3110 = getelementptr [9 x i8], [9 x i8]*@.str3109, i32 0, i32 0
%.tmp3111 = call i32(i8*,i8*) @strcmp(i8* %.tmp3108, i8* %.tmp3110)
%.tmp3112 = icmp eq i32 %.tmp3111, 0
br i1 %.tmp3112, label %.if.true.3113, label %.if.false.3113
.if.true.3113:
%.tmp3114 = load i8*, i8** %mangled_name.3093
%.tmp3116 = getelementptr [5 x i8], [5 x i8]*@.str3115, i32 0, i32 0
%.tmp3117 = call i32(i8*,i8*) @strcmp(i8* %.tmp3114, i8* %.tmp3116)
%.tmp3118 = icmp ne i32 %.tmp3117, 0
br i1 %.tmp3118, label %.if.true.3119, label %.if.false.3119
.if.true.3119:
%tmp_buff.3120 = alloca i8*
store i8* null, i8** %tmp_buff.3120
%swap_var.3121 = alloca i8*
store i8* null, i8** %swap_var.3121
%.tmp3123 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3124 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3123, i32 0, i32 3
%.tmp3125 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3124
%tp.3126 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3125, %m1861$.Type.type** %tp.3126
br label %.for.start.3122
.for.start.3122:
%.tmp3127 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3126
%.tmp3128 = icmp ne %m1861$.Type.type* %.tmp3127, null
br i1 %.tmp3128, label %.for.continue.3122, label %.for.end.3122
.for.continue.3122:
%.tmp3129 = getelementptr i8*, i8** %tmp_buff.3120, i32 0
%.tmp3131 = getelementptr [6 x i8], [6 x i8]*@.str3130, i32 0, i32 0
%.tmp3132 = load i8*, i8** %mangled_name.3093
%.tmp3133 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3126
%.tmp3134 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp3133)
%.tmp3135 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3129, i8* %.tmp3131, i8* %.tmp3132, i8* %.tmp3134)
%.tmp3136 = load i8*, i8** %tmp_buff.3120
store i8* %.tmp3136, i8** %swap_var.3121
%.tmp3137 = load i8*, i8** %mangled_name.3093
store i8* %.tmp3137, i8** %tmp_buff.3120
%.tmp3138 = load i8*, i8** %swap_var.3121
store i8* %.tmp3138, i8** %mangled_name.3093
%.tmp3139 = load i8*, i8** %tmp_buff.3120
call void(i8*) @free(i8* %.tmp3139)
%.tmp3140 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3126
%.tmp3141 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3140, i32 0, i32 4
%.tmp3142 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3141
store %m1861$.Type.type* %.tmp3142, %m1861$.Type.type** %tp.3126
br label %.for.start.3122
.for.end.3122:
br label %.if.end.3119
.if.false.3119:
br label %.if.end.3119
.if.end.3119:
br label %.if.end.3113
.if.false.3113:
br label %.if.end.3113
.if.end.3113:
%.tmp3143 = load i8*, i8** %mangled_name.3093
ret i8* %.tmp3143
}
define void @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3144 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %info.3144
%return_type.3145 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %return_type.3145
%err_buf.3146 = alloca i8*
store i8* null, i8** %err_buf.3146
%tmp_buff.3147 = alloca i8*
store i8* null, i8** %tmp_buff.3147
%.tmp3148 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3149 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3148, i32 0, i32 0
%.tmp3150 = load i8*, i8** %.tmp3149
%.tmp3152 = getelementptr [3 x i8], [3 x i8]*@.str3151, i32 0, i32 0
%.tmp3153 = call i32(i8*,i8*) @strcmp(i8* %.tmp3150, i8* %.tmp3152)
%.tmp3154 = icmp eq i32 %.tmp3153, 0
br i1 %.tmp3154, label %.if.true.3155, label %.if.false.3155
.if.true.3155:
ret void
br label %.if.end.3155
.if.false.3155:
%.tmp3156 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3157 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3156, i32 0, i32 0
%.tmp3158 = load i8*, i8** %.tmp3157
%.tmp3160 = getelementptr [7 x i8], [7 x i8]*@.str3159, i32 0, i32 0
%.tmp3161 = call i32(i8*,i8*) @strcmp(i8* %.tmp3158, i8* %.tmp3160)
%.tmp3162 = icmp eq i32 %.tmp3161, 0
br i1 %.tmp3162, label %.if.true.3163, label %.if.false.3163
.if.true.3163:
%.tmp3164 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3165 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3164, i32 0, i32 6
%.tmp3166 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3165
%.tmp3168 = getelementptr [11 x i8], [11 x i8]*@.str3167, i32 0, i32 0
%.tmp3169 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3166, i8* %.tmp3168)
%assignable.3170 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3169, %m307$.Node.type** %assignable.3170
%.tmp3171 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3172 = load %m307$.Node.type*, %m307$.Node.type** %assignable.3170
%.tmp3173 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3171, %m307$.Node.type* %.tmp3172)
%a_info.3174 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3173, %m1861$.AssignableInfo.type** %a_info.3174
%.tmp3175 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3174
%.tmp3176 = icmp eq %m1861$.AssignableInfo.type* %.tmp3175, null
br i1 %.tmp3176, label %.if.true.3177, label %.if.false.3177
.if.true.3177:
ret void
br label %.if.end.3177
.if.false.3177:
br label %.if.end.3177
.if.end.3177:
%.tmp3178 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3179 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3178)
store %m1861$.AssignableInfo.type* %.tmp3179, %m1861$.AssignableInfo.type** %info.3144
%.tmp3180 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3181 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3180, i32 0, i32 6
%.tmp3182 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3181
%.tmp3183 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3182, i32 0, i32 7
%.tmp3184 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3183
%.tmp3185 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3184, i32 0, i32 1
%.tmp3186 = load i8*, i8** %.tmp3185
%global_name.3187 = alloca i8*
store i8* %.tmp3186, i8** %global_name.3187
%.tmp3188 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3189 = load i8, i8* @SCOPE_GLOBAL
%.tmp3190 = load i8*, i8** %global_name.3187
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3188, i8 %.tmp3189, i8* %.tmp3190)
%.tmp3191 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3192 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3191, i32 0, i32 3
%.tmp3193 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3174
%.tmp3194 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3193, i32 0, i32 3
%.tmp3195 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3194
store %m1861$.Type.type* %.tmp3195, %m1861$.Type.type** %.tmp3192
%.tmp3196 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3197 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3196, i32 0, i32 2
%.tmp3199 = getelementptr [9 x i8], [9 x i8]*@.str3198, i32 0, i32 0
store i8* %.tmp3199, i8** %.tmp3197
%.tmp3200 = load i1, i1* %shallow
%.tmp3201 = icmp eq i1 %.tmp3200, 1
br i1 %.tmp3201, label %.if.true.3202, label %.if.false.3202
.if.true.3202:
%.tmp3203 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3204 = load i8*, i8** %global_name.3187
%.tmp3205 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3203, i8* %.tmp3204, %m1861$.AssignableInfo.type* %.tmp3205)
br label %.if.end.3202
.if.false.3202:
%.tmp3206 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3207 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3206, i32 0, i32 1
%.tmp3208 = load %m0$.File.type*, %m0$.File.type** %.tmp3207
%.tmp3210 = getelementptr [21 x i8], [21 x i8]*@.str3209, i32 0, i32 0
%.tmp3211 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3212 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3211)
%.tmp3213 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3214 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3215 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3214, i32 0, i32 3
%.tmp3216 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3215
%.tmp3217 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3213, %m1861$.Type.type* %.tmp3216)
%.tmp3218 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3174
%.tmp3219 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3218)
%.tmp3220 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3208, i8* %.tmp3210, i8* %.tmp3212, i8* %.tmp3217, i8* %.tmp3219)
br label %.if.end.3202
.if.end.3202:
br label %.if.end.3163
.if.false.3163:
%.tmp3221 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3222 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3221, i32 0, i32 0
%.tmp3223 = load i8*, i8** %.tmp3222
%.tmp3225 = getelementptr [10 x i8], [10 x i8]*@.str3224, i32 0, i32 0
%.tmp3226 = call i32(i8*,i8*) @strcmp(i8* %.tmp3223, i8* %.tmp3225)
%.tmp3227 = icmp eq i32 %.tmp3226, 0
br i1 %.tmp3227, label %.if.true.3228, label %.if.false.3228
.if.true.3228:
%.tmp3229 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3230 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3229, i32 0, i32 6
%.tmp3231 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3230
%.tmp3232 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3231, i32 0, i32 7
%.tmp3233 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3232
%.tmp3234 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3233, i32 0, i32 1
%.tmp3235 = load i8*, i8** %.tmp3234
%type_name.3236 = alloca i8*
store i8* %.tmp3235, i8** %type_name.3236
%.tmp3237 = load i1, i1* %shallow
%.tmp3238 = icmp eq i1 %.tmp3237, 1
br i1 %.tmp3238, label %.if.true.3239, label %.if.false.3239
.if.true.3239:
%.tmp3240 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3241 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3240)
store %m1861$.AssignableInfo.type* %.tmp3241, %m1861$.AssignableInfo.type** %info.3144
%.tmp3242 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3243 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3242)
%mod_from.3244 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3243, %m1861$.ModuleLookup.type** %mod_from.3244
%.tmp3245 = getelementptr i8*, i8** %tmp_buff.3147, i32 0
%.tmp3247 = getelementptr [11 x i8], [11 x i8]*@.str3246, i32 0, i32 0
%.tmp3248 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3244
%.tmp3249 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3248, i32 0, i32 1
%.tmp3250 = load i8*, i8** %.tmp3249
%.tmp3251 = load i8*, i8** %type_name.3236
%.tmp3252 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3245, i8* %.tmp3247, i8* %.tmp3250, i8* %.tmp3251)
%.tmp3253 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3254 = load i8, i8* @SCOPE_LOCAL
%.tmp3255 = load i8*, i8** %tmp_buff.3147
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3253, i8 %.tmp3254, i8* %.tmp3255)
%.tmp3256 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3257 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3256, i32 0, i32 2
%.tmp3259 = getelementptr [10 x i8], [10 x i8]*@.str3258, i32 0, i32 0
store i8* %.tmp3259, i8** %.tmp3257
%.tmp3260 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3261 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3260, i32 0, i32 4
%.tmp3262 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3263 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3262, i32 0, i32 3
%.tmp3264 = load i32, i32* %.tmp3263
store i32 %.tmp3264, i32* %.tmp3261
%.tmp3265 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3266 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3265, i32 0, i32 5
%.tmp3267 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3268 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3267, i32 0, i32 4
%.tmp3269 = load i32, i32* %.tmp3268
store i32 %.tmp3269, i32* %.tmp3266
%.tmp3270 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3271 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3270, i32 0, i32 3
%.tmp3272 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3272, %m1861$.Type.type** %.tmp3271
%.tmp3273 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3274 = load i8*, i8** %type_name.3236
%.tmp3275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3273, i8* %.tmp3274, %m1861$.AssignableInfo.type* %.tmp3275)
%.tmp3276 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3277 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3276, i32 0, i32 6
%.tmp3278 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3277
%.tmp3280 = getelementptr [5 x i8], [5 x i8]*@.str3279, i32 0, i32 0
%.tmp3281 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3278, i8* %.tmp3280)
%type_decl.3282 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3281, %m307$.Node.type** %type_decl.3282
%.tmp3283 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3284 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3282
%.tmp3285 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3284, i32 0, i32 6
%.tmp3286 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3285
%.tmp3287 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3283, %m307$.Node.type* %.tmp3286)
%type_struct.3288 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3287, %m1861$.Type.type** %type_struct.3288
%.tmp3289 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3290 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3289, i32 0, i32 3
%.tmp3291 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3290
%.tmp3292 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3288
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3291, %m1861$.Type.type* %.tmp3292)
%.tmp3293 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3294 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3293, i32 0, i32 3
%.tmp3295 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3288
store %m1861$.Type.type* %.tmp3295, %m1861$.Type.type** %.tmp3294
br label %.if.end.3239
.if.false.3239:
%.tmp3296 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3297 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3298 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3297, i32 0, i32 6
%.tmp3299 = load i8*, i8** %.tmp3298
%.tmp3300 = load i8*, i8** %type_name.3236
%.tmp3301 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3296, i8* %.tmp3299, i8* %.tmp3300)
%scope.3302 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3301, %m1861$.ScopeItem.type** %scope.3302
%.tmp3303 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3302
%.tmp3304 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3303, i32 0, i32 1
%.tmp3305 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3304
store %m1861$.AssignableInfo.type* %.tmp3305, %m1861$.AssignableInfo.type** %info.3144
%.tmp3306 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3307 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3306, i32 0, i32 1
%.tmp3308 = load %m0$.File.type*, %m0$.File.type** %.tmp3307
%.tmp3310 = getelementptr [14 x i8], [14 x i8]*@.str3309, i32 0, i32 0
%.tmp3311 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3312 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3311)
%.tmp3313 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3314 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3315 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3314, i32 0, i32 3
%.tmp3316 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3315
%.tmp3317 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3313, %m1861$.Type.type* %.tmp3316)
%.tmp3318 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3308, i8* %.tmp3310, i8* %.tmp3312, i8* %.tmp3317)
br label %.if.end.3239
.if.end.3239:
br label %.if.end.3228
.if.false.3228:
%.tmp3319 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3320 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3319, i32 0, i32 0
%.tmp3321 = load i8*, i8** %.tmp3320
%.tmp3323 = getelementptr [7 x i8], [7 x i8]*@.str3322, i32 0, i32 0
%.tmp3324 = call i32(i8*,i8*) @strcmp(i8* %.tmp3321, i8* %.tmp3323)
%.tmp3325 = icmp eq i32 %.tmp3324, 0
br i1 %.tmp3325, label %.if.true.3326, label %.if.false.3326
.if.true.3326:
%.tmp3327 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3328 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3327)
store %m1861$.AssignableInfo.type* %.tmp3328, %m1861$.AssignableInfo.type** %info.3144
%.tmp3329 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3330 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3329, i32 0, i32 3
%.tmp3331 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3332 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3333 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3332, i32 0, i32 6
%.tmp3334 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3333
%.tmp3335 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3334, i32 0, i32 7
%.tmp3336 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3335
%.tmp3337 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3331, %m307$.Node.type* %.tmp3336)
store %m1861$.Type.type* %.tmp3337, %m1861$.Type.type** %.tmp3330
%.tmp3338 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3339 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3338, i32 0, i32 2
%.tmp3341 = getelementptr [7 x i8], [7 x i8]*@.str3340, i32 0, i32 0
store i8* %.tmp3341, i8** %.tmp3339
%.tmp3342 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3343 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3342, i32 0, i32 6
%.tmp3344 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3343
%.tmp3345 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3344, i32 0, i32 7
%.tmp3346 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3345
%.tmp3347 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3346, i32 0, i32 7
%.tmp3348 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3347
%.tmp3349 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3348, i32 0, i32 1
%.tmp3350 = load i8*, i8** %.tmp3349
%fn_name.3351 = alloca i8*
store i8* %.tmp3350, i8** %fn_name.3351
%.tmp3352 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3353 = load i8, i8* @SCOPE_GLOBAL
%.tmp3354 = load i8*, i8** %fn_name.3351
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3352, i8 %.tmp3353, i8* %.tmp3354)
%.tmp3355 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3355, %m1861$.Type.type** %return_type.3145
%.tmp3356 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3357 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3356, i32 0, i32 0
%.tmp3358 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3359 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3358, i32 0, i32 3
%.tmp3360 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3359
%.tmp3361 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3360, i32 0, i32 3
%.tmp3362 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3361
%.tmp3363 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3362, i32 0, i32 0
%.tmp3364 = load i8*, i8** %.tmp3363
store i8* %.tmp3364, i8** %.tmp3357
%.tmp3365 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3366 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3365, i32 0, i32 3
%.tmp3367 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3368 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3367, i32 0, i32 3
%.tmp3369 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3368
%.tmp3370 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3369, i32 0, i32 3
%.tmp3371 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3370
%.tmp3372 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3371, i32 0, i32 3
%.tmp3373 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3372
store %m1861$.Type.type* %.tmp3373, %m1861$.Type.type** %.tmp3366
%.tmp3374 = load i1, i1* %shallow
%.tmp3375 = icmp eq i1 %.tmp3374, 0
br i1 %.tmp3375, label %.if.true.3376, label %.if.false.3376
.if.true.3376:
%.tmp3377 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3378 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3377, i32 0, i32 1
%.tmp3379 = load %m0$.File.type*, %m0$.File.type** %.tmp3378
%.tmp3381 = getelementptr [15 x i8], [15 x i8]*@.str3380, i32 0, i32 0
%.tmp3382 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3383 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3384 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3382, %m1861$.Type.type* %.tmp3383)
%.tmp3385 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3386 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3385)
%.tmp3387 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3379, i8* %.tmp3381, i8* %.tmp3384, i8* %.tmp3386)
%.tmp3389 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3390 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3389, i32 0, i32 3
%.tmp3391 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3390
%.tmp3392 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3391, i32 0, i32 3
%.tmp3393 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3392
%.tmp3394 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3393, i32 0, i32 4
%.tmp3395 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3394
%pt.3396 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3395, %m1861$.Type.type** %pt.3396
br label %.for.start.3388
.for.start.3388:
%.tmp3397 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3396
%.tmp3398 = icmp ne %m1861$.Type.type* %.tmp3397, null
br i1 %.tmp3398, label %.for.continue.3388, label %.for.end.3388
.for.continue.3388:
%.tmp3399 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3396
%.tmp3400 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3401 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3400, i32 0, i32 3
%.tmp3402 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3401
%.tmp3403 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3402, i32 0, i32 3
%.tmp3404 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3403
%.tmp3405 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3404, i32 0, i32 4
%.tmp3406 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3405
%.tmp3407 = icmp ne %m1861$.Type.type* %.tmp3399, %.tmp3406
br i1 %.tmp3407, label %.if.true.3408, label %.if.false.3408
.if.true.3408:
%.tmp3409 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3410 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3409, i32 0, i32 1
%.tmp3411 = load %m0$.File.type*, %m0$.File.type** %.tmp3410
%.tmp3413 = getelementptr [3 x i8], [3 x i8]*@.str3412, i32 0, i32 0
%.tmp3414 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3411, i8* %.tmp3413)
br label %.if.end.3408
.if.false.3408:
br label %.if.end.3408
.if.end.3408:
%.tmp3415 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3416 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3415, i32 0, i32 1
%.tmp3417 = load %m0$.File.type*, %m0$.File.type** %.tmp3416
%.tmp3419 = getelementptr [3 x i8], [3 x i8]*@.str3418, i32 0, i32 0
%.tmp3420 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3421 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3396
%.tmp3422 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3420, %m1861$.Type.type* %.tmp3421)
%.tmp3423 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3417, i8* %.tmp3419, i8* %.tmp3422)
%.tmp3424 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3396
%.tmp3425 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3424, i32 0, i32 4
%.tmp3426 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3425
store %m1861$.Type.type* %.tmp3426, %m1861$.Type.type** %pt.3396
br label %.for.start.3388
.for.end.3388:
%.tmp3427 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3428 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3427, i32 0, i32 1
%.tmp3429 = load %m0$.File.type*, %m0$.File.type** %.tmp3428
%.tmp3431 = getelementptr [3 x i8], [3 x i8]*@.str3430, i32 0, i32 0
%.tmp3432 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3429, i8* %.tmp3431)
%.tmp3433 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3434 = bitcast %m1861$.Type.type* %.tmp3433 to i8*
call void(i8*) @free(i8* %.tmp3434)
br label %.if.end.3376
.if.false.3376:
%.tmp3435 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3436 = load i8*, i8** %fn_name.3351
%.tmp3437 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3435, i8* %.tmp3436, %m1861$.AssignableInfo.type* %.tmp3437)
br label %.if.end.3376
.if.end.3376:
br label %.if.end.3326
.if.false.3326:
%.tmp3438 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3439 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3438, i32 0, i32 0
%.tmp3440 = load i8*, i8** %.tmp3439
%.tmp3442 = getelementptr [9 x i8], [9 x i8]*@.str3441, i32 0, i32 0
%.tmp3443 = call i32(i8*,i8*) @strcmp(i8* %.tmp3440, i8* %.tmp3442)
%.tmp3444 = icmp eq i32 %.tmp3443, 0
br i1 %.tmp3444, label %.if.true.3445, label %.if.false.3445
.if.true.3445:
%.tmp3446 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3447 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3446)
store %m1861$.AssignableInfo.type* %.tmp3447, %m1861$.AssignableInfo.type** %info.3144
%.tmp3448 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3449 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3448, i32 0, i32 2
%.tmp3451 = getelementptr [9 x i8], [9 x i8]*@.str3450, i32 0, i32 0
store i8* %.tmp3451, i8** %.tmp3449
%.tmp3452 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3453 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3452, i32 0, i32 3
%.tmp3454 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3455 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3456 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3455, i32 0, i32 6
%.tmp3457 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3456
%.tmp3458 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3454, %m307$.Node.type* %.tmp3457)
store %m1861$.Type.type* %.tmp3458, %m1861$.Type.type** %.tmp3453
%.tmp3459 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3460 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3459)
%name.3461 = alloca i8*
store i8* %.tmp3460, i8** %name.3461
%.tmp3462 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3463 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3464 = load i8*, i8** %name.3461
%.tmp3465 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3466 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3465, i32 0, i32 3
%.tmp3467 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3466
%.tmp3468 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3462, %m307$.Node.type* %.tmp3463, i8* %.tmp3464, %m1861$.Type.type* %.tmp3467)
store i8* %.tmp3468, i8** %tmp_buff.3147
%.tmp3469 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3470 = load i8, i8* @SCOPE_GLOBAL
%.tmp3471 = load i8*, i8** %tmp_buff.3147
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3469, i8 %.tmp3470, i8* %.tmp3471)
%.tmp3472 = load i1, i1* %shallow
%.tmp3473 = icmp eq i1 %.tmp3472, 1
br i1 %.tmp3473, label %.if.true.3474, label %.if.false.3474
.if.true.3474:
%.tmp3475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3476 = load i8*, i8** %name.3461
%.tmp3477 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3475, i8* %.tmp3476, %m1861$.AssignableInfo.type* %.tmp3477)
br label %.if.end.3474
.if.false.3474:
%.tmp3478 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3478, %m1861$.Type.type** %return_type.3145
%.tmp3479 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3480 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3481 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3480, i32 0, i32 3
%.tmp3482 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3481
%.tmp3483 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3482, i32 0, i32 3
%.tmp3484 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3483
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3479, %m1861$.Type.type* %.tmp3484)
%.tmp3485 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3486 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3485, i32 0, i32 1
%.tmp3487 = load %m0$.File.type*, %m0$.File.type** %.tmp3486
%.tmp3489 = getelementptr [14 x i8], [14 x i8]*@.str3488, i32 0, i32 0
%.tmp3490 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3491 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3492 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3490, %m1861$.Type.type* %.tmp3491)
%.tmp3493 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3144
%.tmp3494 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3493)
%.tmp3495 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3487, i8* %.tmp3489, i8* %.tmp3492, i8* %.tmp3494)
%.tmp3496 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3497 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3496, i32 0, i32 6
%.tmp3498 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3497
%.tmp3499 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3498)
%params.3500 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3499, %m307$.Node.type** %params.3500
%param_type.3501 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3501
%.tmp3503 = load %m307$.Node.type*, %m307$.Node.type** %params.3500
%param_ptr.3504 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3503, %m307$.Node.type** %param_ptr.3504
br label %.for.start.3502
.for.start.3502:
%.tmp3505 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3506 = icmp ne %m307$.Node.type* %.tmp3505, null
br i1 %.tmp3506, label %.for.continue.3502, label %.for.end.3502
.for.continue.3502:
%.tmp3507 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3508 = load %m307$.Node.type*, %m307$.Node.type** %params.3500
%.tmp3509 = icmp ne %m307$.Node.type* %.tmp3507, %.tmp3508
br i1 %.tmp3509, label %.if.true.3510, label %.if.false.3510
.if.true.3510:
%.tmp3511 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3512 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3511, i32 0, i32 7
%.tmp3513 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3512
store %m307$.Node.type* %.tmp3513, %m307$.Node.type** %param_ptr.3504
%.tmp3514 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3515 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3514, i32 0, i32 1
%.tmp3516 = load %m0$.File.type*, %m0$.File.type** %.tmp3515
%.tmp3518 = getelementptr [3 x i8], [3 x i8]*@.str3517, i32 0, i32 0
%.tmp3519 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3516, i8* %.tmp3518)
br label %.if.end.3510
.if.false.3510:
br label %.if.end.3510
.if.end.3510:
%.tmp3520 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3521 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3520, i32 0, i32 0
%.tmp3522 = load i8*, i8** %.tmp3521
%.tmp3524 = getelementptr [5 x i8], [5 x i8]*@.str3523, i32 0, i32 0
%.tmp3525 = call i32(i8*,i8*) @strcmp(i8* %.tmp3522, i8* %.tmp3524)
%.tmp3526 = icmp eq i32 %.tmp3525, 0
br i1 %.tmp3526, label %.if.true.3527, label %.if.false.3527
.if.true.3527:
%.tmp3528 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3529 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3530 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3529, i32 0, i32 6
%.tmp3531 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3530
%.tmp3532 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3528, %m307$.Node.type* %.tmp3531)
store %m1861$.Type.type* %.tmp3532, %m1861$.Type.type** %param_type.3501
%.tmp3533 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3534 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3533, i32 0, i32 7
%.tmp3535 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3534
store %m307$.Node.type* %.tmp3535, %m307$.Node.type** %param_ptr.3504
br label %.if.end.3527
.if.false.3527:
br label %.if.end.3527
.if.end.3527:
%.tmp3536 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3537 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3536, i32 0, i32 1
%.tmp3538 = load %m0$.File.type*, %m0$.File.type** %.tmp3537
%.tmp3540 = getelementptr [13 x i8], [13 x i8]*@.str3539, i32 0, i32 0
%.tmp3541 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3542 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3501
%.tmp3543 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3541, %m1861$.Type.type* %.tmp3542)
%.tmp3544 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3545 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3544, i32 0, i32 1
%.tmp3546 = load i8*, i8** %.tmp3545
%.tmp3547 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3538, i8* %.tmp3540, i8* %.tmp3543, i8* %.tmp3546)
%.tmp3548 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3504
%.tmp3549 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3548, i32 0, i32 7
%.tmp3550 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3549
store %m307$.Node.type* %.tmp3550, %m307$.Node.type** %param_ptr.3504
br label %.for.start.3502
.for.end.3502:
%.tmp3551 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3552 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3551, i32 0, i32 1
%.tmp3553 = load %m0$.File.type*, %m0$.File.type** %.tmp3552
%.tmp3555 = getelementptr [5 x i8], [5 x i8]*@.str3554, i32 0, i32 0
%.tmp3556 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3553, i8* %.tmp3555)
%.tmp3557 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3559 = getelementptr [9 x i8], [9 x i8]*@.str3558, i32 0, i32 0
%.tmp3560 = bitcast ptr null to i8*
%.tmp3561 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3557, i8* %.tmp3559, i8* %.tmp3560, i8* %.tmp3561)
%.tmp3562 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3563 = load %m307$.Node.type*, %m307$.Node.type** %params.3500
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3562, %m307$.Node.type* %.tmp3563)
%.tmp3564 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3565 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3564, i32 0, i32 6
%.tmp3566 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3565
%.tmp3568 = getelementptr [6 x i8], [6 x i8]*@.str3567, i32 0, i32 0
%.tmp3569 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3566, i8* %.tmp3568)
%fn_block.3570 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3569, %m307$.Node.type** %fn_block.3570
%.tmp3571 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3572 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3570
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3571, %m307$.Node.type* %.tmp3572)
%.tmp3573 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3573)
%.tmp3574 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3575 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3574, %m307$.Node.type** %last_valid_instruction.3575
%.tmp3577 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3570
%.tmp3578 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3577, i32 0, i32 6
%.tmp3579 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3578
%ci.3580 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3579, %m307$.Node.type** %ci.3580
br label %.for.start.3576
.for.start.3576:
%.tmp3581 = load %m307$.Node.type*, %m307$.Node.type** %ci.3580
%.tmp3582 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3581, i32 0, i32 7
%.tmp3583 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3582
%.tmp3584 = icmp ne %m307$.Node.type* %.tmp3583, null
br i1 %.tmp3584, label %.for.continue.3576, label %.for.end.3576
.for.continue.3576:
%.tmp3585 = load %m307$.Node.type*, %m307$.Node.type** %ci.3580
%.tmp3586 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3585, i32 0, i32 0
%.tmp3587 = load i8*, i8** %.tmp3586
%.tmp3589 = getelementptr [3 x i8], [3 x i8]*@.str3588, i32 0, i32 0
%.tmp3590 = call i32(i8*,i8*) @strcmp(i8* %.tmp3587, i8* %.tmp3589)
%.tmp3591 = icmp ne i32 %.tmp3590, 0
%.tmp3592 = load %m307$.Node.type*, %m307$.Node.type** %ci.3580
%.tmp3593 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3592, i32 0, i32 0
%.tmp3594 = load i8*, i8** %.tmp3593
%.tmp3596 = getelementptr [9 x i8], [9 x i8]*@.str3595, i32 0, i32 0
%.tmp3597 = call i32(i8*,i8*) @strcmp(i8* %.tmp3594, i8* %.tmp3596)
%.tmp3598 = icmp ne i32 %.tmp3597, 0
%.tmp3599 = and i1 %.tmp3591, %.tmp3598
br i1 %.tmp3599, label %.if.true.3600, label %.if.false.3600
.if.true.3600:
%.tmp3601 = load %m307$.Node.type*, %m307$.Node.type** %ci.3580
store %m307$.Node.type* %.tmp3601, %m307$.Node.type** %last_valid_instruction.3575
br label %.if.end.3600
.if.false.3600:
br label %.if.end.3600
.if.end.3600:
%.tmp3602 = load %m307$.Node.type*, %m307$.Node.type** %ci.3580
%.tmp3603 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3602, i32 0, i32 7
%.tmp3604 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3603
store %m307$.Node.type* %.tmp3604, %m307$.Node.type** %ci.3580
br label %.for.start.3576
.for.end.3576:
%add_implicit_return.3605 = alloca i1
store i1 0, i1* %add_implicit_return.3605
%.tmp3606 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3575
%.tmp3607 = icmp eq %m307$.Node.type* %.tmp3606, null
br i1 %.tmp3607, label %.if.true.3608, label %.if.false.3608
.if.true.3608:
store i1 1, i1* %add_implicit_return.3605
br label %.if.end.3608
.if.false.3608:
%.tmp3609 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3575
%.tmp3610 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3609, i32 0, i32 6
%.tmp3611 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3610
%.tmp3612 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3611, i32 0, i32 0
%.tmp3613 = load i8*, i8** %.tmp3612
%.tmp3615 = getelementptr [7 x i8], [7 x i8]*@.str3614, i32 0, i32 0
%.tmp3616 = call i32(i8*,i8*) @strcmp(i8* %.tmp3613, i8* %.tmp3615)
%.tmp3617 = icmp ne i32 %.tmp3616, 0
br i1 %.tmp3617, label %.if.true.3618, label %.if.false.3618
.if.true.3618:
store i1 1, i1* %add_implicit_return.3605
br label %.if.end.3618
.if.false.3618:
br label %.if.end.3618
.if.end.3618:
br label %.if.end.3608
.if.end.3608:
%.tmp3619 = load i1, i1* %add_implicit_return.3605
br i1 %.tmp3619, label %.if.true.3620, label %.if.false.3620
.if.true.3620:
%.tmp3621 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3622 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3145
%.tmp3623 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3621, %m1861$.Type.type* %.tmp3622)
%.tmp3625 = getelementptr [5 x i8], [5 x i8]*@.str3624, i32 0, i32 0
%.tmp3626 = call i32(i8*,i8*) @strcmp(i8* %.tmp3623, i8* %.tmp3625)
%.tmp3627 = icmp ne i32 %.tmp3626, 0
br i1 %.tmp3627, label %.if.true.3628, label %.if.false.3628
.if.true.3628:
%.tmp3629 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3630 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3570
%.tmp3632 = getelementptr [21 x i8], [21 x i8]*@.str3631, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3629, %m307$.Node.type* %.tmp3630, i8* %.tmp3632)
br label %.if.end.3628
.if.false.3628:
%.tmp3633 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3634 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3633, i32 0, i32 1
%.tmp3635 = load %m0$.File.type*, %m0$.File.type** %.tmp3634
%.tmp3637 = getelementptr [10 x i8], [10 x i8]*@.str3636, i32 0, i32 0
%.tmp3638 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3635, i8* %.tmp3637)
br label %.if.end.3628
.if.end.3628:
br label %.if.end.3620
.if.false.3620:
br label %.if.end.3620
.if.end.3620:
%.tmp3639 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3640 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3639, i32 0, i32 1
%.tmp3641 = load %m0$.File.type*, %m0$.File.type** %.tmp3640
%.tmp3643 = getelementptr [3 x i8], [3 x i8]*@.str3642, i32 0, i32 0
%.tmp3644 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3641, i8* %.tmp3643)
br label %.if.end.3474
.if.end.3474:
br label %.if.end.3445
.if.false.3445:
%.tmp3645 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3646 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3645, i32 0, i32 0
%.tmp3647 = load i8*, i8** %.tmp3646
%.tmp3649 = getelementptr [7 x i8], [7 x i8]*@.str3648, i32 0, i32 0
%.tmp3650 = call i32(i8*,i8*) @strcmp(i8* %.tmp3647, i8* %.tmp3649)
%.tmp3651 = icmp eq i32 %.tmp3650, 0
br i1 %.tmp3651, label %.if.true.3652, label %.if.false.3652
.if.true.3652:
%.tmp3653 = load i1, i1* %shallow
%.tmp3654 = icmp eq i1 %.tmp3653, 1
br i1 %.tmp3654, label %.if.true.3655, label %.if.false.3655
.if.true.3655:
%.tmp3656 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3657 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3656, i32 0, i32 6
%.tmp3658 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3657
%.tmp3659 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3658, i32 0, i32 7
%.tmp3660 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3659
%.tmp3661 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3660, i32 0, i32 1
%.tmp3662 = load i8*, i8** %.tmp3661
%mod_name.3663 = alloca i8*
store i8* %.tmp3662, i8** %mod_name.3663
%.tmp3664 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3665 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3664, i32 0, i32 6
%.tmp3666 = load i8*, i8** %.tmp3665
%mod_abspath.3667 = alloca i8*
store i8* %.tmp3666, i8** %mod_abspath.3667
%.tmp3668 = load i8*, i8** %mod_abspath.3667
%.tmp3669 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3668)
%dirname.3670 = alloca i8*
store i8* %.tmp3669, i8** %dirname.3670
%.tmp3671 = load i8*, i8** %mod_name.3663
%.tmp3672 = call i32(i8*) @strlen(i8* %.tmp3671)
%mod_name_len.3673 = alloca i32
store i32 %.tmp3672, i32* %mod_name_len.3673
%.tmp3674 = load i32, i32* %mod_name_len.3673
%.tmp3675 = sub i32 %.tmp3674, 1
%.tmp3676 = call i8*(i32) @malloc(i32 %.tmp3675)
%trimmed_name.3677 = alloca i8*
store i8* %.tmp3676, i8** %trimmed_name.3677
%i.3679 = alloca i32
store i32 1, i32* %i.3679
br label %.for.start.3678
.for.start.3678:
%.tmp3680 = load i32, i32* %i.3679
%.tmp3681 = load i32, i32* %mod_name_len.3673
%.tmp3682 = sub i32 %.tmp3681, 1
%.tmp3683 = icmp slt i32 %.tmp3680, %.tmp3682
br i1 %.tmp3683, label %.for.continue.3678, label %.for.end.3678
.for.continue.3678:
%.tmp3684 = load i32, i32* %i.3679
%.tmp3685 = sub i32 %.tmp3684, 1
%.tmp3686 = load i8*, i8** %trimmed_name.3677
%.tmp3687 = getelementptr i8, i8* %.tmp3686, i32 %.tmp3685
%.tmp3688 = load i32, i32* %i.3679
%.tmp3689 = load i8*, i8** %mod_name.3663
%.tmp3690 = getelementptr i8, i8* %.tmp3689, i32 %.tmp3688
%.tmp3691 = load i8, i8* %.tmp3690
store i8 %.tmp3691, i8* %.tmp3687
%.tmp3692 = load i32, i32* %i.3679
%.tmp3693 = add i32 %.tmp3692, 1
store i32 %.tmp3693, i32* %i.3679
br label %.for.start.3678
.for.end.3678:
%.tmp3694 = load i32, i32* %mod_name_len.3673
%.tmp3695 = sub i32 %.tmp3694, 2
%.tmp3696 = load i8*, i8** %trimmed_name.3677
%.tmp3697 = getelementptr i8, i8* %.tmp3696, i32 %.tmp3695
store i8 0, i8* %.tmp3697
%.tmp3698 = load i8*, i8** %dirname.3670
%.tmp3700 = getelementptr [1 x i8], [1 x i8]*@.str3699, i32 0, i32 0
%.tmp3701 = call i32(i8*,i8*) @strcmp(i8* %.tmp3698, i8* %.tmp3700)
%.tmp3702 = icmp eq i32 %.tmp3701, 0
br i1 %.tmp3702, label %.if.true.3703, label %.if.false.3703
.if.true.3703:
%.tmp3704 = getelementptr i8*, i8** %mod_abspath.3667, i32 0
%.tmp3706 = getelementptr [6 x i8], [6 x i8]*@.str3705, i32 0, i32 0
%.tmp3707 = load i8*, i8** %trimmed_name.3677
%.tmp3708 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3704, i8* %.tmp3706, i8* %.tmp3707)
br label %.if.end.3703
.if.false.3703:
%.tmp3709 = getelementptr i8*, i8** %mod_abspath.3667, i32 0
%.tmp3711 = getelementptr [9 x i8], [9 x i8]*@.str3710, i32 0, i32 0
%.tmp3712 = load i8*, i8** %dirname.3670
%.tmp3713 = load i8*, i8** %trimmed_name.3677
%.tmp3714 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3709, i8* %.tmp3711, i8* %.tmp3712, i8* %.tmp3713)
br label %.if.end.3703
.if.end.3703:
%.tmp3715 = load i8*, i8** %mod_abspath.3667
%.tmp3716 = call i8*(i32) @malloc(i32 4096)
%.tmp3717 = call i8*(i8*,i8*) @realpath(i8* %.tmp3715, i8* %.tmp3716)
store i8* %.tmp3717, i8** %mod_abspath.3667
%.tmp3718 = load i8*, i8** %mod_abspath.3667
%.tmp3719 = icmp eq i8* %.tmp3718, null
br i1 %.tmp3719, label %.if.true.3720, label %.if.false.3720
.if.true.3720:
%.tmp3721 = getelementptr i8*, i8** %err_buf.3146, i32 0
%.tmp3723 = getelementptr [60 x i8], [60 x i8]*@.str3722, i32 0, i32 0
%.tmp3724 = load i8*, i8** %mod_name.3663
%.tmp3725 = load i8*, i8** %dirname.3670
%.tmp3726 = load i8*, i8** %trimmed_name.3677
%.tmp3727 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3721, i8* %.tmp3723, i8* %.tmp3724, i8* %.tmp3725, i8* %.tmp3726)
%.tmp3728 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3729 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3730 = load i8*, i8** %err_buf.3146
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3728, %m307$.Node.type* %.tmp3729, i8* %.tmp3730)
ret void
br label %.if.end.3720
.if.false.3720:
br label %.if.end.3720
.if.end.3720:
%already_imported.3731 = alloca i1
store i1 0, i1* %already_imported.3731
%m.3732 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3732
%.tmp3733 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3734 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3733, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3736 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3737 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3736, i32 0, i32 5
%.tmp3738 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3737
store %m1861$.ModuleLookup.type* %.tmp3738, %m1861$.ModuleLookup.type** %m.3732
br label %.for.start.3735
.for.start.3735:
%.tmp3739 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
%.tmp3740 = icmp ne %m1861$.ModuleLookup.type* %.tmp3739, null
%.tmp3741 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3742 = icmp eq %m1861$.ModuleLookup.type* %.tmp3741, null
%.tmp3743 = and i1 %.tmp3740, %.tmp3742
br i1 %.tmp3743, label %.for.continue.3735, label %.for.end.3735
.for.continue.3735:
%.tmp3744 = load i8*, i8** %mod_abspath.3667
%.tmp3745 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
%.tmp3746 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3745, i32 0, i32 0
%.tmp3747 = load i8*, i8** %.tmp3746
%.tmp3748 = call i32(i8*,i8*) @strcmp(i8* %.tmp3744, i8* %.tmp3747)
%.tmp3749 = icmp eq i32 %.tmp3748, 0
br i1 %.tmp3749, label %.if.true.3750, label %.if.false.3750
.if.true.3750:
%.tmp3751 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
store %m1861$.ModuleLookup.type* %.tmp3751, %m1861$.ModuleLookup.type** %mod.3734
br label %.if.end.3750
.if.false.3750:
br label %.if.end.3750
.if.end.3750:
%.tmp3752 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
%.tmp3753 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3752, i32 0, i32 2
%.tmp3754 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3753
store %m1861$.ModuleLookup.type* %.tmp3754, %m1861$.ModuleLookup.type** %m.3732
br label %.for.start.3735
.for.end.3735:
%.tmp3755 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3756 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3755, i32 0, i32 6
%.tmp3757 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3756
%.tmp3758 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3757, i32 0, i32 7
%.tmp3759 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3758
%.tmp3760 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3759, i32 0, i32 7
%.tmp3761 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3760
%.tmp3762 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3761, i32 0, i32 7
%.tmp3763 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3762
%.tmp3764 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3763, i32 0, i32 1
%.tmp3765 = load i8*, i8** %.tmp3764
%asname.3766 = alloca i8*
store i8* %.tmp3765, i8** %asname.3766
%.tmp3767 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3768 = icmp eq %m1861$.ModuleLookup.type* %.tmp3767, null
br i1 %.tmp3768, label %.if.true.3769, label %.if.false.3769
.if.true.3769:
%.tmp3770 = load i32, i32* @ModuleLookup_size
%.tmp3771 = call i8*(i32) @malloc(i32 %.tmp3770)
%.tmp3772 = bitcast i8* %.tmp3771 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3772, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3773 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3774 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3773, i32 0, i32 0
%.tmp3775 = load i8*, i8** %mod_abspath.3667
store i8* %.tmp3775, i8** %.tmp3774
%.tmp3776 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3777 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3776, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3777
%.tmp3778 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3779 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3778, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3779
%.tmp3780 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3781 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3780, i32 0, i32 1
%.tmp3782 = getelementptr i8*, i8** %.tmp3781, i32 0
%.tmp3784 = getelementptr [5 x i8], [5 x i8]*@.str3783, i32 0, i32 0
%.tmp3785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3786 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3785)
%.tmp3787 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3782, i8* %.tmp3784, i32 %.tmp3786)
%.tmp3789 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3790 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3789, i32 0, i32 5
%.tmp3791 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3790
store %m1861$.ModuleLookup.type* %.tmp3791, %m1861$.ModuleLookup.type** %m.3732
br label %.for.start.3788
.for.start.3788:
%.tmp3792 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
%.tmp3793 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3792, i32 0, i32 2
%.tmp3794 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3793
%.tmp3795 = icmp ne %m1861$.ModuleLookup.type* %.tmp3794, null
br i1 %.tmp3795, label %.for.continue.3788, label %.for.end.3788
.for.continue.3788:
%.tmp3796 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
%.tmp3797 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3796, i32 0, i32 2
%.tmp3798 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3797
store %m1861$.ModuleLookup.type* %.tmp3798, %m1861$.ModuleLookup.type** %m.3732
br label %.for.start.3788
.for.end.3788:
%.tmp3799 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3732
%.tmp3800 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3799, i32 0, i32 2
%.tmp3801 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
store %m1861$.ModuleLookup.type* %.tmp3801, %m1861$.ModuleLookup.type** %.tmp3800
%.tmp3802 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3803 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3804 = load i8*, i8** %asname.3766
%.tmp3805 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3806 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3805, i32 0, i32 0
%.tmp3807 = load i8*, i8** %.tmp3806
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3802, %m307$.Node.type* %.tmp3803, i8* %.tmp3804, i8* %.tmp3807)
%.tmp3808 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3809 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3808, i32 0, i32 6
%.tmp3810 = load i8*, i8** %.tmp3809
%curr_mod.3811 = alloca i8*
store i8* %.tmp3810, i8** %curr_mod.3811
%.tmp3812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3813 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3812, i32 0, i32 6
%.tmp3814 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3815 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3814, i32 0, i32 0
%.tmp3816 = load i8*, i8** %.tmp3815
store i8* %.tmp3816, i8** %.tmp3813
%.tmp3817 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3818 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3819 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3818, i32 0, i32 0
%.tmp3820 = load i8*, i8** %.tmp3819
%.tmp3821 = call i1(%m1861$.CompilerCtx.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3817, i8* %.tmp3820)
%.tmp3822 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3823 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3822, i32 0, i32 6
%.tmp3824 = load i8*, i8** %curr_mod.3811
store i8* %.tmp3824, i8** %.tmp3823
br label %.if.end.3769
.if.false.3769:
%.tmp3825 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3826 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3827 = load i8*, i8** %asname.3766
%.tmp3828 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3734
%.tmp3829 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3828, i32 0, i32 0
%.tmp3830 = load i8*, i8** %.tmp3829
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3825, %m307$.Node.type* %.tmp3826, i8* %.tmp3827, i8* %.tmp3830)
br label %.if.end.3769
.if.end.3769:
br label %.if.end.3655
.if.false.3655:
br label %.if.end.3655
.if.end.3655:
br label %.if.end.3652
.if.false.3652:
%.tmp3831 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3832 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3834 = getelementptr [40 x i8], [40 x i8]*@.str3833, i32 0, i32 0
%.tmp3835 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3831, %m307$.Node.type* %.tmp3832, i8* %.tmp3834)
%.tmp3836 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3837 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3836, i32 0, i32 0
%.tmp3838 = load i8*, i8** %.tmp3837
%.tmp3839 = call i32(i8*,...) @printf(i8* %.tmp3835, i8* %.tmp3838)
br label %.if.end.3652
.if.end.3652:
br label %.if.end.3445
.if.end.3445:
br label %.if.end.3326
.if.end.3326:
br label %.if.end.3228
.if.end.3228:
br label %.if.end.3163
.if.end.3163:
br label %.if.end.3155
.if.end.3155:
ret void
}
define i8* @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3840 = alloca i8*
store i8* null, i8** %buf.3840
%.tmp3841 = getelementptr i8*, i8** %buf.3840, i32 0
%.tmp3843 = getelementptr [31 x i8], [31 x i8]*@.str3842, i32 0, i32 0
%.tmp3844 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3845 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3844, i32 0, i32 6
%.tmp3846 = load i8*, i8** %.tmp3845
%.tmp3847 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3848 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3847, i32 0, i32 3
%.tmp3849 = load i32, i32* %.tmp3848
%.tmp3850 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3851 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3850, i32 0, i32 4
%.tmp3852 = load i32, i32* %.tmp3851
%.tmp3853 = load i8*, i8** %msg
%.tmp3854 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3841, i8* %.tmp3843, i8* %.tmp3846, i32 %.tmp3849, i32 %.tmp3852, i8* %.tmp3853)
%.tmp3855 = load i8*, i8** %buf.3840
ret i8* %.tmp3855
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3856 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3856
%.tmp3858 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3859 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3858, %m307$.Node.type** %param_ptr.3859
br label %.for.start.3857
.for.start.3857:
%.tmp3860 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3861 = icmp ne %m307$.Node.type* %.tmp3860, null
br i1 %.tmp3861, label %.for.continue.3857, label %.for.end.3857
.for.continue.3857:
%.tmp3862 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3863 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3864 = icmp ne %m307$.Node.type* %.tmp3862, %.tmp3863
br i1 %.tmp3864, label %.if.true.3865, label %.if.false.3865
.if.true.3865:
%.tmp3866 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3867 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3866, i32 0, i32 7
%.tmp3868 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3867
store %m307$.Node.type* %.tmp3868, %m307$.Node.type** %param_ptr.3859
br label %.if.end.3865
.if.false.3865:
br label %.if.end.3865
.if.end.3865:
%.tmp3869 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3870 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3869)
%param_info.3871 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3870, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3872 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3873 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3872, i32 0, i32 2
%.tmp3875 = getelementptr [9 x i8], [9 x i8]*@.str3874, i32 0, i32 0
store i8* %.tmp3875, i8** %.tmp3873
%.tmp3876 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3877 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3876, i32 0, i32 0
%.tmp3878 = load i8*, i8** %.tmp3877
%.tmp3880 = getelementptr [5 x i8], [5 x i8]*@.str3879, i32 0, i32 0
%.tmp3881 = call i32(i8*,i8*) @strcmp(i8* %.tmp3878, i8* %.tmp3880)
%.tmp3882 = icmp eq i32 %.tmp3881, 0
br i1 %.tmp3882, label %.if.true.3883, label %.if.false.3883
.if.true.3883:
%.tmp3884 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3885 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3886 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3885, i32 0, i32 6
%.tmp3887 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3886
%.tmp3888 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3884, %m307$.Node.type* %.tmp3887)
store %m1861$.Type.type* %.tmp3888, %m1861$.Type.type** %param_type.3856
%.tmp3889 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3890 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3889, i32 0, i32 7
%.tmp3891 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3890
store %m307$.Node.type* %.tmp3891, %m307$.Node.type** %param_ptr.3859
br label %.if.end.3883
.if.false.3883:
br label %.if.end.3883
.if.end.3883:
%.tmp3892 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3893 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3892, i32 0, i32 3
%.tmp3894 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3856
store %m1861$.Type.type* %.tmp3894, %m1861$.Type.type** %.tmp3893
%.tmp3895 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3896 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3895, i32 0, i32 1
%.tmp3897 = load i8*, i8** %.tmp3896
%var_name.3898 = alloca i8*
store i8* %.tmp3897, i8** %var_name.3898
%.tmp3899 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3900 = load i8, i8* @SCOPE_LOCAL
%.tmp3901 = load i8*, i8** %var_name.3898
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3899, i8 %.tmp3900, i8* %.tmp3901)
%.tmp3902 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3903 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3904 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3903, i32 0, i32 3
%.tmp3905 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3904
%.tmp3906 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3902, %m1861$.Type.type* %.tmp3905)
%param_info_tr.3907 = alloca i8*
store i8* %.tmp3906, i8** %param_info_tr.3907
%.tmp3908 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3909 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3908, i32 0, i32 1
%.tmp3910 = load %m0$.File.type*, %m0$.File.type** %.tmp3909
%.tmp3912 = getelementptr [16 x i8], [16 x i8]*@.str3911, i32 0, i32 0
%.tmp3913 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3914 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3913)
%.tmp3915 = load i8*, i8** %param_info_tr.3907
%.tmp3916 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3910, i8* %.tmp3912, i8* %.tmp3914, i8* %.tmp3915)
%.tmp3917 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3918 = load i8*, i8** %var_name.3898
%.tmp3919 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3917, i8* %.tmp3918, %m1861$.AssignableInfo.type* %.tmp3919)
%.tmp3920 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3921 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3920, i32 0, i32 1
%.tmp3922 = load %m0$.File.type*, %m0$.File.type** %.tmp3921
%.tmp3924 = getelementptr [28 x i8], [28 x i8]*@.str3923, i32 0, i32 0
%.tmp3925 = load i8*, i8** %param_info_tr.3907
%.tmp3926 = load i8*, i8** %var_name.3898
%.tmp3927 = load i8*, i8** %param_info_tr.3907
%.tmp3928 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3871
%.tmp3929 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3928)
%.tmp3930 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3922, i8* %.tmp3924, i8* %.tmp3925, i8* %.tmp3926, i8* %.tmp3927, i8* %.tmp3929)
%.tmp3931 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3859
%.tmp3932 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3931, i32 0, i32 7
%.tmp3933 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3932
store %m307$.Node.type* %.tmp3933, %m307$.Node.type** %param_ptr.3859
br label %.for.start.3857
.for.end.3857:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3936 = getelementptr [6 x i8], [6 x i8]*@.str3935, i32 0, i32 0
%.tmp3937 = bitcast ptr null to i8*
%.tmp3938 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3934, i8* %.tmp3936, i8* %.tmp3937, i8* %.tmp3938)
%.tmp3940 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3941 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3940, i32 0, i32 6
%.tmp3942 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3941
%b.3943 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3942, %m307$.Node.type** %b.3943
br label %.for.start.3939
.for.start.3939:
%.tmp3944 = load %m307$.Node.type*, %m307$.Node.type** %b.3943
%.tmp3945 = icmp ne %m307$.Node.type* %.tmp3944, null
br i1 %.tmp3945, label %.for.continue.3939, label %.for.end.3939
.for.continue.3939:
%.tmp3946 = load %m307$.Node.type*, %m307$.Node.type** %b.3943
%.tmp3947 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3946, i32 0, i32 0
%.tmp3948 = load i8*, i8** %.tmp3947
%.tmp3950 = getelementptr [11 x i8], [11 x i8]*@.str3949, i32 0, i32 0
%.tmp3951 = call i32(i8*,i8*) @strcmp(i8* %.tmp3948, i8* %.tmp3950)
%.tmp3952 = icmp eq i32 %.tmp3951, 0
br i1 %.tmp3952, label %.if.true.3953, label %.if.false.3953
.if.true.3953:
%.tmp3954 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3955 = load %m307$.Node.type*, %m307$.Node.type** %b.3943
%.tmp3956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3955, i32 0, i32 6
%.tmp3957 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3956
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3954, %m307$.Node.type* %.tmp3957)
br label %.if.end.3953
.if.false.3953:
br label %.if.end.3953
.if.end.3953:
%.tmp3958 = load %m307$.Node.type*, %m307$.Node.type** %b.3943
%.tmp3959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3958, i32 0, i32 7
%.tmp3960 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3959
store %m307$.Node.type* %.tmp3960, %m307$.Node.type** %b.3943
br label %.for.start.3939
.for.end.3939:
%.tmp3961 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3961)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3962 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3963 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3964 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3962, %m307$.Node.type* %.tmp3963)
%val.3965 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3964, %m1861$.AssignableInfo.type** %val.3965
%.tmp3966 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3965
%.tmp3967 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3966, i32 0, i32 3
%.tmp3968 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3967
%.tmp3969 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3968, i32 0, i32 0
%.tmp3970 = load i8*, i8** %.tmp3969
%.tmp3972 = getelementptr [7 x i8], [7 x i8]*@.str3971, i32 0, i32 0
%.tmp3973 = call i32(i8*,i8*) @strcmp(i8* %.tmp3970, i8* %.tmp3972)
%.tmp3974 = icmp ne i32 %.tmp3973, 0
br i1 %.tmp3974, label %.if.true.3975, label %.if.false.3975
.if.true.3975:
%.tmp3977 = getelementptr [7 x i8], [7 x i8]*@.str3976, i32 0, i32 0
%.tmp3978 = call i32(i8*,...) @printf(i8* %.tmp3977)
%.tmp3979 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp3979
br label %.if.end.3975
.if.false.3975:
br label %.if.end.3975
.if.end.3975:
%.tmp3980 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3965
%.tmp3981 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3980, i32 0, i32 3
%.tmp3982 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3981
%.tmp3983 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3982, i32 0, i32 3
%.tmp3984 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3983
%node_type.3985 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3984, %m1861$.Type.type** %node_type.3985
%i.3987 = alloca i32
store i32 0, i32* %i.3987
br label %.for.start.3986
.for.start.3986:
%.tmp3988 = load i32, i32* %i.3987
%.tmp3989 = load i32, i32* %attr_id
%.tmp3990 = icmp slt i32 %.tmp3988, %.tmp3989
br i1 %.tmp3990, label %.for.continue.3986, label %.for.end.3986
.for.continue.3986:
%.tmp3991 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.3985
%.tmp3992 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3991, i32 0, i32 4
%.tmp3993 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3992
store %m1861$.Type.type* %.tmp3993, %m1861$.Type.type** %node_type.3985
%.tmp3994 = load i32, i32* %i.3987
%.tmp3995 = add i32 %.tmp3994, 1
store i32 %.tmp3995, i32* %i.3987
br label %.for.start.3986
.for.end.3986:
%.tmp3996 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3997 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3996)
%info.3998 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3997, %m1861$.AssignableInfo.type** %info.3998
%.tmp3999 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3998
%.tmp4000 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3999, i32 0, i32 3
%.tmp4001 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.3985
store %m1861$.Type.type* %.tmp4001, %m1861$.Type.type** %.tmp4000
%.tmp4002 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4003 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4002)
%tmp_id.4004 = alloca i32
store i32 %.tmp4003, i32* %tmp_id.4004
%.tmp4005 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4006 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3965
%.tmp4007 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4006, i32 0, i32 3
%.tmp4008 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4007
%.tmp4009 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4005, %m1861$.Type.type* %.tmp4008)
%type_as_str.4010 = alloca i8*
store i8* %.tmp4009, i8** %type_as_str.4010
%.tmp4011 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4012 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3998
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4011, %m1861$.AssignableInfo.type* %.tmp4012)
%.tmp4013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4014 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4013, i32 0, i32 1
%.tmp4015 = load %m0$.File.type*, %m0$.File.type** %.tmp4014
%.tmp4017 = getelementptr [52 x i8], [52 x i8]*@.str4016, i32 0, i32 0
%.tmp4018 = load i32, i32* %tmp_id.4004
%.tmp4019 = load i8*, i8** %type_as_str.4010
%.tmp4020 = load i8*, i8** %type_as_str.4010
%.tmp4021 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3965
%.tmp4022 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4021)
%.tmp4023 = load i32, i32* %attr_id
%.tmp4024 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4015, i8* %.tmp4017, i32 %.tmp4018, i8* %.tmp4019, i8* %.tmp4020, i8* %.tmp4022, i32 %.tmp4023)
%.tmp4025 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4026 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4025, i32 0, i32 1
%.tmp4027 = load %m0$.File.type*, %m0$.File.type** %.tmp4026
%.tmp4029 = getelementptr [28 x i8], [28 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3998
%.tmp4031 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4030)
%.tmp4032 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4033 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3998
%.tmp4034 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4033, i32 0, i32 3
%.tmp4035 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4034
%.tmp4036 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4032, %m1861$.Type.type* %.tmp4035)
%.tmp4037 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4038 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3998
%.tmp4039 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4038, i32 0, i32 3
%.tmp4040 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4039
%.tmp4041 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4037, %m1861$.Type.type* %.tmp4040)
%.tmp4042 = load i32, i32* %tmp_id.4004
%.tmp4043 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4027, i8* %.tmp4029, i8* %.tmp4031, i8* %.tmp4036, i8* %.tmp4041, i32 %.tmp4042)
%.tmp4044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3998
ret %m1861$.AssignableInfo.type* %.tmp4044
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
%.tmp4045 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4046 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4047 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4045, %m307$.Node.type* %.tmp4046)
%val.4048 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4047, %m1861$.AssignableInfo.type** %val.4048
%.tmp4049 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4048
%.tmp4050 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4049, i32 0, i32 3
%.tmp4051 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4050
%.tmp4052 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4051, i32 0, i32 0
%.tmp4053 = load i8*, i8** %.tmp4052
%.tmp4055 = getelementptr [7 x i8], [7 x i8]*@.str4054, i32 0, i32 0
%.tmp4056 = call i32(i8*,i8*) @strcmp(i8* %.tmp4053, i8* %.tmp4055)
%.tmp4057 = icmp ne i32 %.tmp4056, 0
br i1 %.tmp4057, label %.if.true.4058, label %.if.false.4058
.if.true.4058:
%.tmp4060 = getelementptr [7 x i8], [7 x i8]*@.str4059, i32 0, i32 0
%.tmp4061 = call i32(i8*,...) @printf(i8* %.tmp4060)
ret void
br label %.if.end.4058
.if.false.4058:
br label %.if.end.4058
.if.end.4058:
%.tmp4062 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4048
%.tmp4063 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4062, i32 0, i32 3
%.tmp4064 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4063
%.tmp4065 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4064, i32 0, i32 3
%.tmp4066 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4065
%node_type.4067 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4066, %m1861$.Type.type** %node_type.4067
%i.4069 = alloca i32
store i32 0, i32* %i.4069
br label %.for.start.4068
.for.start.4068:
%.tmp4070 = load i32, i32* %i.4069
%.tmp4071 = load i32, i32* %attr_id
%.tmp4072 = icmp slt i32 %.tmp4070, %.tmp4071
br i1 %.tmp4072, label %.for.continue.4068, label %.for.end.4068
.for.continue.4068:
%.tmp4073 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4067
%.tmp4074 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4073, i32 0, i32 4
%.tmp4075 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4074
store %m1861$.Type.type* %.tmp4075, %m1861$.Type.type** %node_type.4067
%.tmp4076 = load i32, i32* %i.4069
%.tmp4077 = add i32 %.tmp4076, 1
store i32 %.tmp4077, i32* %i.4069
br label %.for.start.4068
.for.end.4068:
%.tmp4078 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4079 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4078)
%tmp_id.4080 = alloca i32
store i32 %.tmp4079, i32* %tmp_id.4080
%.tmp4081 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4082 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4048
%.tmp4083 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4082, i32 0, i32 3
%.tmp4084 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4083
%.tmp4085 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4081, %m1861$.Type.type* %.tmp4084)
%type_as_str.4086 = alloca i8*
store i8* %.tmp4085, i8** %type_as_str.4086
%.tmp4087 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4088 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4087, i32 0, i32 1
%.tmp4089 = load %m0$.File.type*, %m0$.File.type** %.tmp4088
%.tmp4091 = getelementptr [52 x i8], [52 x i8]*@.str4090, i32 0, i32 0
%.tmp4092 = load i32, i32* %tmp_id.4080
%.tmp4093 = load i8*, i8** %type_as_str.4086
%.tmp4094 = load i8*, i8** %type_as_str.4086
%.tmp4095 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4048
%.tmp4096 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4095)
%.tmp4097 = load i32, i32* %attr_id
%.tmp4098 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4089, i8* %.tmp4091, i32 %.tmp4092, i8* %.tmp4093, i8* %.tmp4094, i8* %.tmp4096, i32 %.tmp4097)
%.tmp4099 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4100 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4099, i32 0, i32 1
%.tmp4101 = load %m0$.File.type*, %m0$.File.type** %.tmp4100
%.tmp4103 = getelementptr [18 x i8], [18 x i8]*@.str4102, i32 0, i32 0
%.tmp4104 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4105 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4067
%.tmp4106 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4104, %m1861$.Type.type* %.tmp4105)
%.tmp4107 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4108 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4067
%.tmp4109 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4107, %m1861$.Type.type* %.tmp4108)
%.tmp4110 = load i8*, i8** %attr
%.tmp4111 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4101, i8* %.tmp4103, i8* %.tmp4106, i8* %.tmp4109, i8* %.tmp4110)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4112 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4113 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4112, i32 0, i32 6
%.tmp4114 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4113
%.tmp4115 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4114, i32 0, i32 6
%.tmp4116 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4115
%dotted.4117 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4116, %m307$.Node.type** %dotted.4117
%.tmp4118 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4117
%.tmp4119 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4118, i32 0, i32 7
%.tmp4120 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4119
%.tmp4121 = icmp ne %m307$.Node.type* %.tmp4120, null
br i1 %.tmp4121, label %.if.true.4122, label %.if.false.4122
.if.true.4122:
%.tmp4123 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4123
br label %.if.end.4122
.if.false.4122:
br label %.if.end.4122
.if.end.4122:
%.tmp4124 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4117
%.tmp4125 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4124, i32 0, i32 1
%.tmp4126 = load i8*, i8** %.tmp4125
%.tmp4128 = getelementptr [7 x i8], [7 x i8]*@.str4127, i32 0, i32 0
%.tmp4129 = call i32(i8*,i8*) @strcmp(i8* %.tmp4126, i8* %.tmp4128)
%.tmp4130 = icmp eq i32 %.tmp4129, 0
br i1 %.tmp4130, label %.if.true.4131, label %.if.false.4131
.if.true.4131:
%.tmp4132 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4134 = getelementptr [8 x i8], [8 x i8]*@.str4133, i32 0, i32 0
%.tmp4135 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4132, i8* %.tmp4134)
%args.4136 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4135, %m307$.Node.type** %args.4136
%.tmp4137 = load %m307$.Node.type*, %m307$.Node.type** %args.4136
%.tmp4138 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4137, i32 0, i32 6
%.tmp4139 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4138
%.tmp4141 = getelementptr [11 x i8], [11 x i8]*@.str4140, i32 0, i32 0
%.tmp4142 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4139, i8* %.tmp4141)
%value.4143 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4142, %m307$.Node.type** %value.4143
%.tmp4144 = load %m307$.Node.type*, %m307$.Node.type** %value.4143
%.tmp4145 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4144, i32 0, i32 6
%.tmp4146 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4145
%.tmp4147 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4146, i32 0, i32 6
%.tmp4148 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4147
%.tmp4149 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4148, i32 0, i32 6
%.tmp4150 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4149
%.tmp4151 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4150, i32 0, i32 6
%.tmp4152 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4151
store %m307$.Node.type* %.tmp4152, %m307$.Node.type** %value.4143
%.tmp4153 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4154 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4153)
%tmp_id.4155 = alloca i32
store i32 %.tmp4154, i32* %tmp_id.4155
%.tmp4156 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4157 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4156)
%info.4158 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4157, %m1861$.AssignableInfo.type** %info.4158
%.tmp4159 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4160 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4158
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4159, %m1861$.AssignableInfo.type* %.tmp4160)
%.tmp4161 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4158
%.tmp4162 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4161, i32 0, i32 3
%.tmp4163 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4163, %m1861$.Type.type** %.tmp4162
%.tmp4164 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4158
%.tmp4165 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4164, i32 0, i32 3
%.tmp4166 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4165
%.tmp4167 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4166, i32 0, i32 0
%.tmp4169 = getelementptr [4 x i8], [4 x i8]*@.str4168, i32 0, i32 0
store i8* %.tmp4169, i8** %.tmp4167
%.tmp4170 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4171 = load %m307$.Node.type*, %m307$.Node.type** %value.4143
%.tmp4172 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4170, %m307$.Node.type* %.tmp4171)
%inspected_type.4173 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4172, %m1861$.Type.type** %inspected_type.4173
%.tmp4174 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4175 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4173
%.tmp4176 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4174, %m1861$.Type.type* %.tmp4175)
%type_as_str.4177 = alloca i8*
store i8* %.tmp4176, i8** %type_as_str.4177
%.tmp4178 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4179 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4178, i32 0, i32 1
%.tmp4180 = load %m0$.File.type*, %m0$.File.type** %.tmp4179
%.tmp4182 = getelementptr [46 x i8], [46 x i8]*@.str4181, i32 0, i32 0
%.tmp4183 = load i32, i32* %tmp_id.4155
%.tmp4184 = load i8*, i8** %type_as_str.4177
%.tmp4185 = load i8*, i8** %type_as_str.4177
%.tmp4186 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4180, i8* %.tmp4182, i32 %.tmp4183, i8* %.tmp4184, i8* %.tmp4185)
%.tmp4187 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4188 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4187, i32 0, i32 1
%.tmp4189 = load %m0$.File.type*, %m0$.File.type** %.tmp4188
%.tmp4191 = getelementptr [35 x i8], [35 x i8]*@.str4190, i32 0, i32 0
%.tmp4192 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4158
%.tmp4193 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4192)
%.tmp4194 = load i8*, i8** %type_as_str.4177
%.tmp4195 = load i32, i32* %tmp_id.4155
%.tmp4196 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4189, i8* %.tmp4191, i8* %.tmp4193, i8* %.tmp4194, i32 %.tmp4195)
%.tmp4197 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4158
ret %m1861$.AssignableInfo.type* %.tmp4197
br label %.if.end.4131
.if.false.4131:
%.tmp4198 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4117
%.tmp4199 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4198, i32 0, i32 1
%.tmp4200 = load i8*, i8** %.tmp4199
%.tmp4202 = getelementptr [7 x i8], [7 x i8]*@.str4201, i32 0, i32 0
%.tmp4203 = call i32(i8*,i8*) @strcmp(i8* %.tmp4200, i8* %.tmp4202)
%.tmp4204 = icmp eq i32 %.tmp4203, 0
br i1 %.tmp4204, label %.if.true.4205, label %.if.false.4205
.if.true.4205:
%.tmp4206 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4208 = getelementptr [8 x i8], [8 x i8]*@.str4207, i32 0, i32 0
%.tmp4209 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4206, i8* %.tmp4208)
%args.4210 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4209, %m307$.Node.type** %args.4210
%.tmp4211 = load %m307$.Node.type*, %m307$.Node.type** %args.4210
%.tmp4212 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4211, i32 0, i32 6
%.tmp4213 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4212
%.tmp4215 = getelementptr [11 x i8], [11 x i8]*@.str4214, i32 0, i32 0
%.tmp4216 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4213, i8* %.tmp4215)
%array.4217 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4216, %m307$.Node.type** %array.4217
%.tmp4218 = load %m307$.Node.type*, %m307$.Node.type** %array.4217
%.tmp4219 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4218, i32 0, i32 7
%.tmp4220 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4219
%.tmp4222 = getelementptr [11 x i8], [11 x i8]*@.str4221, i32 0, i32 0
%.tmp4223 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4220, i8* %.tmp4222)
%value.4224 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4223, %m307$.Node.type** %value.4224
%.tmp4225 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4226 = load %m307$.Node.type*, %m307$.Node.type** %value.4224
%.tmp4227 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4225, %m307$.Node.type* %.tmp4226)
%value_info.4228 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4227, %m1861$.AssignableInfo.type** %value_info.4228
%.tmp4229 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4230 = load %m307$.Node.type*, %m307$.Node.type** %array.4217
%.tmp4231 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4229, %m307$.Node.type* %.tmp4230)
%array_info.4232 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4231, %m1861$.AssignableInfo.type** %array_info.4232
%.tmp4233 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4234 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4233)
%info.4235 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4234, %m1861$.AssignableInfo.type** %info.4235
%.tmp4236 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4237 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4235
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4236, %m1861$.AssignableInfo.type* %.tmp4237)
%.tmp4238 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4235
%.tmp4239 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4238, i32 0, i32 3
%.tmp4240 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4232
%.tmp4241 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4240, i32 0, i32 3
%.tmp4242 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4241
store %m1861$.Type.type* %.tmp4242, %m1861$.Type.type** %.tmp4239
%builtin_prefix.4243 = alloca i8*
store i8* null, i8** %builtin_prefix.4243
%.tmp4244 = getelementptr i8*, i8** %builtin_prefix.4243, i32 0
%.tmp4246 = getelementptr [5 x i8], [5 x i8]*@.str4245, i32 0, i32 0
%.tmp4247 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4248 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4247)
%.tmp4249 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4244, i8* %.tmp4246, i32 %.tmp4248)
%.tmp4250 = call i8*() @m2531$append_tmpl.cp()
%tmpl.4251 = alloca i8*
store i8* %.tmp4250, i8** %tmpl.4251
%.tmp4252 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4253 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4252, i32 0, i32 1
%.tmp4254 = load %m0$.File.type*, %m0$.File.type** %.tmp4253
%.tmp4255 = load i8*, i8** %tmpl.4251
%.tmp4256 = load i8*, i8** %builtin_prefix.4243
%.tmp4257 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4258 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4232
%.tmp4259 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4258, i32 0, i32 3
%.tmp4260 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4259
%.tmp4261 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4257, %m1861$.Type.type* %.tmp4260)
%.tmp4262 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4232
%.tmp4263 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4262)
%.tmp4264 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4265 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4228
%.tmp4266 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4265, i32 0, i32 3
%.tmp4267 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4266
%.tmp4268 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4264, %m1861$.Type.type* %.tmp4267)
%.tmp4269 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4228
%.tmp4270 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4269)
%.tmp4271 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4235
%.tmp4272 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4271)
%.tmp4273 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4254, i8* %.tmp4255, i8* %.tmp4256, i8* %.tmp4261, i8* %.tmp4263, i8* %.tmp4268, i8* %.tmp4270, i8* %.tmp4272)
%.tmp4274 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4235
ret %m1861$.AssignableInfo.type* %.tmp4274
br label %.if.end.4205
.if.false.4205:
%.tmp4275 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4117
%.tmp4276 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4275, i32 0, i32 1
%.tmp4277 = load i8*, i8** %.tmp4276
%.tmp4279 = getelementptr [4 x i8], [4 x i8]*@.str4278, i32 0, i32 0
%.tmp4280 = call i32(i8*,i8*) @strcmp(i8* %.tmp4277, i8* %.tmp4279)
%.tmp4281 = icmp eq i32 %.tmp4280, 0
br i1 %.tmp4281, label %.if.true.4282, label %.if.false.4282
.if.true.4282:
%.tmp4283 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4285 = getelementptr [8 x i8], [8 x i8]*@.str4284, i32 0, i32 0
%.tmp4286 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4283, i8* %.tmp4285)
%args.4287 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4286, %m307$.Node.type** %args.4287
%.tmp4288 = load %m307$.Node.type*, %m307$.Node.type** %args.4287
%.tmp4289 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4288, i32 0, i32 6
%.tmp4290 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4289
%.tmp4292 = getelementptr [11 x i8], [11 x i8]*@.str4291, i32 0, i32 0
%.tmp4293 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4290, i8* %.tmp4292)
%value.4294 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4293, %m307$.Node.type** %value.4294
%.tmp4295 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4296 = load %m307$.Node.type*, %m307$.Node.type** %value.4294
%.tmp4297 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i32) @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.tmp4295, %m307$.Node.type* %.tmp4296, i32 1)
ret %m1861$.AssignableInfo.type* %.tmp4297
br label %.if.end.4282
.if.false.4282:
br label %.if.end.4282
.if.end.4282:
br label %.if.end.4205
.if.end.4205:
br label %.if.end.4131
.if.end.4131:
%.tmp4298 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4298
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4299 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4300 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4301 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4299, %m307$.Node.type* %.tmp4300)
%info.4302 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4301, %m1861$.AssignableInfo.type** %info.4302
%.tmp4303 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4304 = icmp ne %m1861$.AssignableInfo.type* %.tmp4303, null
br i1 %.tmp4304, label %.if.true.4305, label %.if.false.4305
.if.true.4305:
%.tmp4306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
ret %m1861$.AssignableInfo.type* %.tmp4306
br label %.if.end.4305
.if.false.4305:
br label %.if.end.4305
.if.end.4305:
%.tmp4307 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4308 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4309 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4307, %m307$.Node.type* %.tmp4308)
store %m1861$.AssignableInfo.type* %.tmp4309, %m1861$.AssignableInfo.type** %info.4302
%.tmp4310 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4311 = icmp eq %m1861$.AssignableInfo.type* %.tmp4310, null
br i1 %.tmp4311, label %.if.true.4312, label %.if.false.4312
.if.true.4312:
%.tmp4313 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4313, label %.if.true.4314, label %.if.false.4314
.if.true.4314:
%.tmp4315 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4316 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4318 = getelementptr [35 x i8], [35 x i8]*@.str4317, i32 0, i32 0
%.tmp4319 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4315, %m307$.Node.type* %.tmp4316, i8* %.tmp4318)
%.tmp4320 = call i32(i8*,...) @printf(i8* %.tmp4319)
br label %.if.end.4314
.if.false.4314:
br label %.if.end.4314
.if.end.4314:
%.tmp4321 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4321
br label %.if.end.4312
.if.false.4312:
br label %.if.end.4312
.if.end.4312:
%.tmp4322 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4324 = getelementptr [8 x i8], [8 x i8]*@.str4323, i32 0, i32 0
%.tmp4325 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4322, i8* %.tmp4324)
%args.4326 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4325, %m307$.Node.type** %args.4326
%.tmp4328 = getelementptr [1 x i8], [1 x i8]*@.str4327, i32 0, i32 0
%params_buff.4329 = alloca i8*
store i8* %.tmp4328, i8** %params_buff.4329
%tmp.4330 = alloca i8*
store i8* null, i8** %tmp.4330
%.tmp4331 = load %m307$.Node.type*, %m307$.Node.type** %args.4326
%.tmp4332 = icmp ne %m307$.Node.type* %.tmp4331, null
br i1 %.tmp4332, label %.if.true.4333, label %.if.false.4333
.if.true.4333:
%.tmp4334 = load %m307$.Node.type*, %m307$.Node.type** %args.4326
%.tmp4335 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4334, i32 0, i32 6
%.tmp4336 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4335
%.tmp4338 = getelementptr [11 x i8], [11 x i8]*@.str4337, i32 0, i32 0
%.tmp4339 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4336, i8* %.tmp4338)
%start.4340 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4339, %m307$.Node.type** %start.4340
%.tmp4342 = load %m307$.Node.type*, %m307$.Node.type** %start.4340
%pp.4343 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4342, %m307$.Node.type** %pp.4343
br label %.for.start.4341
.for.start.4341:
%.tmp4344 = load %m307$.Node.type*, %m307$.Node.type** %pp.4343
%.tmp4345 = icmp ne %m307$.Node.type* %.tmp4344, null
br i1 %.tmp4345, label %.for.continue.4341, label %.for.end.4341
.for.continue.4341:
%.tmp4346 = load %m307$.Node.type*, %m307$.Node.type** %pp.4343
%.tmp4347 = load %m307$.Node.type*, %m307$.Node.type** %start.4340
%.tmp4348 = icmp ne %m307$.Node.type* %.tmp4346, %.tmp4347
br i1 %.tmp4348, label %.if.true.4349, label %.if.false.4349
.if.true.4349:
%.tmp4350 = getelementptr i8*, i8** %tmp.4330, i32 0
%.tmp4352 = getelementptr [5 x i8], [5 x i8]*@.str4351, i32 0, i32 0
%.tmp4353 = load i8*, i8** %params_buff.4329
%.tmp4354 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4350, i8* %.tmp4352, i8* %.tmp4353)
%.tmp4355 = load i8*, i8** %params_buff.4329
%tmp_buff.4356 = alloca i8*
store i8* %.tmp4355, i8** %tmp_buff.4356
%.tmp4357 = load i8*, i8** %tmp.4330
store i8* %.tmp4357, i8** %params_buff.4329
%.tmp4358 = load i8*, i8** %tmp_buff.4356
store i8* %.tmp4358, i8** %tmp.4330
%.tmp4359 = load i8*, i8** %tmp.4330
call void(i8*) @free(i8* %.tmp4359)
br label %.if.end.4349
.if.false.4349:
br label %.if.end.4349
.if.end.4349:
%.tmp4360 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4361 = load %m307$.Node.type*, %m307$.Node.type** %pp.4343
%.tmp4362 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4360, %m307$.Node.type* %.tmp4361)
%a_info.4363 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4362, %m1861$.AssignableInfo.type** %a_info.4363
%.tmp4364 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4363
%.tmp4365 = icmp eq %m1861$.AssignableInfo.type* %.tmp4364, null
br i1 %.tmp4365, label %.if.true.4366, label %.if.false.4366
.if.true.4366:
%.tmp4367 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4367
br label %.if.end.4366
.if.false.4366:
br label %.if.end.4366
.if.end.4366:
%.tmp4368 = getelementptr i8*, i8** %params_buff.4329, i32 0
%.tmp4370 = getelementptr [8 x i8], [8 x i8]*@.str4369, i32 0, i32 0
%.tmp4371 = load i8*, i8** %params_buff.4329
%.tmp4372 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4373 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4363
%.tmp4374 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4373, i32 0, i32 3
%.tmp4375 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4374
%.tmp4376 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4372, %m1861$.Type.type* %.tmp4375)
%.tmp4377 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4363
%.tmp4378 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4377)
%.tmp4379 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4368, i8* %.tmp4370, i8* %.tmp4371, i8* %.tmp4376, i8* %.tmp4378)
%.tmp4380 = load %m307$.Node.type*, %m307$.Node.type** %pp.4343
%.tmp4381 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4380, i32 0, i32 7
%.tmp4382 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4381
store %m307$.Node.type* %.tmp4382, %m307$.Node.type** %pp.4343
%.tmp4383 = load %m307$.Node.type*, %m307$.Node.type** %pp.4343
%.tmp4385 = getelementptr [11 x i8], [11 x i8]*@.str4384, i32 0, i32 0
%.tmp4386 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4383, i8* %.tmp4385)
store %m307$.Node.type* %.tmp4386, %m307$.Node.type** %pp.4343
br label %.for.start.4341
.for.end.4341:
br label %.if.end.4333
.if.false.4333:
br label %.if.end.4333
.if.end.4333:
%.tmp4387 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4388 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4389 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4388, i32 0, i32 3
%.tmp4390 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4389
%.tmp4391 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4390, i32 0, i32 3
%.tmp4392 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4391
%.tmp4393 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4387, %m1861$.Type.type* %.tmp4392)
%.tmp4395 = getelementptr [5 x i8], [5 x i8]*@.str4394, i32 0, i32 0
%.tmp4396 = call i32(i8*,i8*) @strcmp(i8* %.tmp4393, i8* %.tmp4395)
%.tmp4397 = icmp eq i32 %.tmp4396, 0
br i1 %.tmp4397, label %.if.true.4398, label %.if.false.4398
.if.true.4398:
%.tmp4399 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4400 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4399, i32 0, i32 1
%.tmp4401 = load %m0$.File.type*, %m0$.File.type** %.tmp4400
%.tmp4403 = getelementptr [16 x i8], [16 x i8]*@.str4402, i32 0, i32 0
%.tmp4404 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4405 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4406 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4405, i32 0, i32 3
%.tmp4407 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4406
%.tmp4408 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4404, %m1861$.Type.type* %.tmp4407)
%.tmp4409 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4410 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4409)
%.tmp4411 = load i8*, i8** %params_buff.4329
%.tmp4412 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4401, i8* %.tmp4403, i8* %.tmp4408, i8* %.tmp4410, i8* %.tmp4411)
%.tmp4413 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4413
br label %.if.end.4398
.if.false.4398:
br label %.if.end.4398
.if.end.4398:
%.tmp4414 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4415 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4414)
%call_info.4416 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4415, %m1861$.AssignableInfo.type** %call_info.4416
%.tmp4417 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4418 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4416
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4417, %m1861$.AssignableInfo.type* %.tmp4418)
%.tmp4419 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4416
%.tmp4420 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4419, i32 0, i32 3
%.tmp4421 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4422 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4421, i32 0, i32 3
%.tmp4423 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4422
%.tmp4424 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4423, i32 0, i32 3
%.tmp4425 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4424
%.tmp4426 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4425)
store %m1861$.Type.type* %.tmp4426, %m1861$.Type.type** %.tmp4420
%.tmp4427 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4416
%.tmp4428 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4427, i32 0, i32 3
%.tmp4429 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4428
%.tmp4430 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4429, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4430
%.tmp4431 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4432 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4431, i32 0, i32 1
%.tmp4433 = load %m0$.File.type*, %m0$.File.type** %.tmp4432
%.tmp4435 = getelementptr [21 x i8], [21 x i8]*@.str4434, i32 0, i32 0
%.tmp4436 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4416
%.tmp4437 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4436)
%.tmp4438 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4439 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4440 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4439, i32 0, i32 3
%.tmp4441 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4440
%.tmp4442 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4438, %m1861$.Type.type* %.tmp4441)
%.tmp4443 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4302
%.tmp4444 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4443)
%.tmp4445 = load i8*, i8** %params_buff.4329
%.tmp4446 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4433, i8* %.tmp4435, i8* %.tmp4437, i8* %.tmp4442, i8* %.tmp4444, i8* %.tmp4445)
%.tmp4447 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4416
%.tmp4448 = bitcast %m1861$.AssignableInfo.type* %.tmp4447 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4448
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4449 = alloca i8*
store i8* null, i8** %err_msg.4449
%.tmp4450 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4451 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4450, i32 0, i32 0
%.tmp4452 = load i8*, i8** %.tmp4451
%expr_type.4453 = alloca i8*
store i8* %.tmp4452, i8** %expr_type.4453
%.tmp4454 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4455 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4454, %m1861$.AssignableInfo.type** %info.4455
%assignable.4456 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4456
%.tmp4457 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4458 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4457, %m1861$.AssignableInfo.type** %a_info.4458
%.tmp4459 = load i8*, i8** %expr_type.4453
%.tmp4461 = getelementptr [7 x i8], [7 x i8]*@.str4460, i32 0, i32 0
%.tmp4462 = call i32(i8*,i8*) @strcmp(i8* %.tmp4459, i8* %.tmp4461)
%.tmp4463 = icmp eq i32 %.tmp4462, 0
br i1 %.tmp4463, label %.if.true.4464, label %.if.false.4464
.if.true.4464:
%.tmp4465 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4466 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4465, i32 0, i32 6
%.tmp4467 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4466
%.tmp4468 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4467, i32 0, i32 7
%.tmp4469 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4468
%.tmp4470 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4469, i32 0, i32 0
%.tmp4471 = load i8*, i8** %.tmp4470
%.tmp4473 = getelementptr [3 x i8], [3 x i8]*@.str4472, i32 0, i32 0
%.tmp4474 = call i32(i8*,i8*) @strcmp(i8* %.tmp4471, i8* %.tmp4473)
%.tmp4475 = icmp ne i32 %.tmp4474, 0
br i1 %.tmp4475, label %.if.true.4476, label %.if.false.4476
.if.true.4476:
%.tmp4477 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4478 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4479 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4478, i32 0, i32 6
%.tmp4480 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4479
%.tmp4481 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4480, i32 0, i32 7
%.tmp4482 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4481
%.tmp4483 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4477, %m307$.Node.type* %.tmp4482)
store %m1861$.AssignableInfo.type* %.tmp4483, %m1861$.AssignableInfo.type** %info.4455
%.tmp4484 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4455
%.tmp4485 = icmp eq %m1861$.AssignableInfo.type* %.tmp4484, null
br i1 %.tmp4485, label %.if.true.4486, label %.if.false.4486
.if.true.4486:
ret void
br label %.if.end.4486
.if.false.4486:
br label %.if.end.4486
.if.end.4486:
%.tmp4487 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4488 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4487, i32 0, i32 1
%.tmp4489 = load %m0$.File.type*, %m0$.File.type** %.tmp4488
%.tmp4491 = getelementptr [11 x i8], [11 x i8]*@.str4490, i32 0, i32 0
%.tmp4492 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4493 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4455
%.tmp4494 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4493, i32 0, i32 3
%.tmp4495 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4494
%.tmp4496 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4492, %m1861$.Type.type* %.tmp4495)
%.tmp4497 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4455
%.tmp4498 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4497)
%.tmp4499 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4489, i8* %.tmp4491, i8* %.tmp4496, i8* %.tmp4498)
br label %.if.end.4476
.if.false.4476:
%.tmp4500 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4501 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4500, i32 0, i32 1
%.tmp4502 = load %m0$.File.type*, %m0$.File.type** %.tmp4501
%.tmp4504 = getelementptr [10 x i8], [10 x i8]*@.str4503, i32 0, i32 0
%.tmp4505 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4502, i8* %.tmp4504)
br label %.if.end.4476
.if.end.4476:
br label %.if.end.4464
.if.false.4464:
%.tmp4506 = load i8*, i8** %expr_type.4453
%.tmp4508 = getelementptr [3 x i8], [3 x i8]*@.str4507, i32 0, i32 0
%.tmp4509 = call i32(i8*,i8*) @strcmp(i8* %.tmp4506, i8* %.tmp4508)
%.tmp4510 = icmp eq i32 %.tmp4509, 0
br i1 %.tmp4510, label %.if.true.4511, label %.if.false.4511
.if.true.4511:
br label %.if.end.4511
.if.false.4511:
%.tmp4512 = load i8*, i8** %expr_type.4453
%.tmp4514 = getelementptr [8 x i8], [8 x i8]*@.str4513, i32 0, i32 0
%.tmp4515 = call i32(i8*,i8*) @strcmp(i8* %.tmp4512, i8* %.tmp4514)
%.tmp4516 = icmp eq i32 %.tmp4515, 0
br i1 %.tmp4516, label %.if.true.4517, label %.if.false.4517
.if.true.4517:
%.tmp4518 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4519 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4520 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4519, i32 0, i32 6
%.tmp4521 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4520
%.tmp4522 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4518, %m307$.Node.type* %.tmp4521)
br label %.if.end.4517
.if.false.4517:
%.tmp4523 = load i8*, i8** %expr_type.4453
%.tmp4525 = getelementptr [12 x i8], [12 x i8]*@.str4524, i32 0, i32 0
%.tmp4526 = call i32(i8*,i8*) @strcmp(i8* %.tmp4523, i8* %.tmp4525)
%.tmp4527 = icmp eq i32 %.tmp4526, 0
br i1 %.tmp4527, label %.if.true.4528, label %.if.false.4528
.if.true.4528:
%.tmp4529 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4530 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4531 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4529, %m307$.Node.type* %.tmp4530)
br label %.if.end.4528
.if.false.4528:
%.tmp4532 = load i8*, i8** %expr_type.4453
%.tmp4534 = getelementptr [11 x i8], [11 x i8]*@.str4533, i32 0, i32 0
%.tmp4535 = call i32(i8*,i8*) @strcmp(i8* %.tmp4532, i8* %.tmp4534)
%.tmp4536 = icmp eq i32 %.tmp4535, 0
br i1 %.tmp4536, label %.if.true.4537, label %.if.false.4537
.if.true.4537:
%.tmp4538 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4539 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4538, i32 0, i32 6
%.tmp4540 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4539
%.tmp4542 = getelementptr [11 x i8], [11 x i8]*@.str4541, i32 0, i32 0
%.tmp4543 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4540, i8* %.tmp4542)
store %m307$.Node.type* %.tmp4543, %m307$.Node.type** %assignable.4456
%.tmp4544 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4545 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4546 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4545, i32 0, i32 6
%.tmp4547 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4546
%.tmp4548 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4544, %m307$.Node.type* %.tmp4547)
%dest.4549 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4548, %m1861$.AssignableInfo.type** %dest.4549
%.tmp4550 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4549
%.tmp4551 = icmp eq %m1861$.AssignableInfo.type* %.tmp4550, null
br i1 %.tmp4551, label %.if.true.4552, label %.if.false.4552
.if.true.4552:
ret void
br label %.if.end.4552
.if.false.4552:
br label %.if.end.4552
.if.end.4552:
%.tmp4553 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4554 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4456
%.tmp4555 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4553, %m307$.Node.type* %.tmp4554)
store %m1861$.AssignableInfo.type* %.tmp4555, %m1861$.AssignableInfo.type** %a_info.4458
%.tmp4556 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4458
%.tmp4557 = icmp eq %m1861$.AssignableInfo.type* %.tmp4556, null
br i1 %.tmp4557, label %.if.true.4558, label %.if.false.4558
.if.true.4558:
ret void
br label %.if.end.4558
.if.false.4558:
br label %.if.end.4558
.if.end.4558:
%.tmp4559 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4560 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4549
%.tmp4561 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4560, i32 0, i32 3
%.tmp4562 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4561
%.tmp4563 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4559, %m1861$.Type.type* %.tmp4562)
%dest_tr.4564 = alloca i8*
store i8* %.tmp4563, i8** %dest_tr.4564
%.tmp4565 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4566 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4458
%.tmp4567 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4566, i32 0, i32 3
%.tmp4568 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4567
%.tmp4569 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4565, %m1861$.Type.type* %.tmp4568)
%src_tr.4570 = alloca i8*
store i8* %.tmp4569, i8** %src_tr.4570
%.tmp4571 = load i8*, i8** %src_tr.4570
%.tmp4573 = getelementptr [4 x i8], [4 x i8]*@.str4572, i32 0, i32 0
%.tmp4574 = call i32(i8*,i8*) @strcmp(i8* %.tmp4571, i8* %.tmp4573)
%.tmp4575 = icmp eq i32 %.tmp4574, 0
br i1 %.tmp4575, label %.if.true.4576, label %.if.false.4576
.if.true.4576:
%.tmp4577 = load i8*, i8** %dest_tr.4564
store i8* %.tmp4577, i8** %src_tr.4570
br label %.if.end.4576
.if.false.4576:
br label %.if.end.4576
.if.end.4576:
%.tmp4578 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4579 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4578, i32 0, i32 1
%.tmp4580 = load %m0$.File.type*, %m0$.File.type** %.tmp4579
%.tmp4582 = getelementptr [21 x i8], [21 x i8]*@.str4581, i32 0, i32 0
%.tmp4583 = load i8*, i8** %src_tr.4570
%.tmp4584 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4458
%.tmp4585 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4584)
%.tmp4586 = load i8*, i8** %dest_tr.4564
%.tmp4587 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4549
%.tmp4588 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4587)
%.tmp4589 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4580, i8* %.tmp4582, i8* %.tmp4583, i8* %.tmp4585, i8* %.tmp4586, i8* %.tmp4588)
br label %.if.end.4537
.if.false.4537:
%.tmp4590 = load i8*, i8** %expr_type.4453
%.tmp4592 = getelementptr [9 x i8], [9 x i8]*@.str4591, i32 0, i32 0
%.tmp4593 = call i32(i8*,i8*) @strcmp(i8* %.tmp4590, i8* %.tmp4592)
%.tmp4594 = icmp eq i32 %.tmp4593, 0
br i1 %.tmp4594, label %.if.true.4595, label %.if.false.4595
.if.true.4595:
%.tmp4596 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4597 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4596, %m307$.Node.type* %.tmp4597)
br label %.if.end.4595
.if.false.4595:
%.tmp4598 = load i8*, i8** %expr_type.4453
%.tmp4600 = getelementptr [9 x i8], [9 x i8]*@.str4599, i32 0, i32 0
%.tmp4601 = call i32(i8*,i8*) @strcmp(i8* %.tmp4598, i8* %.tmp4600)
%.tmp4602 = icmp eq i32 %.tmp4601, 0
br i1 %.tmp4602, label %.if.true.4603, label %.if.false.4603
.if.true.4603:
%.tmp4604 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4605 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4604, %m307$.Node.type* %.tmp4605)
br label %.if.end.4603
.if.false.4603:
%.tmp4606 = load i8*, i8** %expr_type.4453
%.tmp4608 = getelementptr [8 x i8], [8 x i8]*@.str4607, i32 0, i32 0
%.tmp4609 = call i32(i8*,i8*) @strcmp(i8* %.tmp4606, i8* %.tmp4608)
%.tmp4610 = icmp eq i32 %.tmp4609, 0
br i1 %.tmp4610, label %.if.true.4611, label %.if.false.4611
.if.true.4611:
%.tmp4612 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4613 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4612)
%mod.4614 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4613, %m1861$.ModuleLookup.type** %mod.4614
%found.4615 = alloca i1
store i1 0, i1* %found.4615
%.tmp4616 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4614
%.tmp4617 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4616, i32 0, i32 3
%.tmp4618 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4617
%s.4619 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4618, %m1861$.Scope.type** %s.4619
%.tmp4620 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4621 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4620, i32 0, i32 6
%.tmp4622 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4621
%.tmp4623 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4622, i32 0, i32 1
%.tmp4624 = load i8*, i8** %.tmp4623
%.tmp4626 = getelementptr [6 x i8], [6 x i8]*@.str4625, i32 0, i32 0
%.tmp4627 = call i32(i8*,i8*) @strcmp(i8* %.tmp4624, i8* %.tmp4626)
%.tmp4628 = icmp eq i32 %.tmp4627, 0
br i1 %.tmp4628, label %.if.true.4629, label %.if.false.4629
.if.true.4629:
br label %.for.start.4630
.for.start.4630:
%.tmp4631 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4632 = icmp ne %m1861$.Scope.type* %.tmp4631, null
%.tmp4633 = load i1, i1* %found.4615
%.tmp4634 = icmp eq i1 %.tmp4633, 0
%.tmp4635 = and i1 %.tmp4632, %.tmp4634
br i1 %.tmp4635, label %.for.continue.4630, label %.for.end.4630
.for.continue.4630:
%.tmp4636 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4637 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4636, i32 0, i32 2
%.tmp4638 = load i8*, i8** %.tmp4637
%.tmp4640 = getelementptr [4 x i8], [4 x i8]*@.str4639, i32 0, i32 0
%.tmp4641 = call i32(i8*,i8*) @strcmp(i8* %.tmp4638, i8* %.tmp4640)
%.tmp4642 = icmp eq i32 %.tmp4641, 0
br i1 %.tmp4642, label %.if.true.4643, label %.if.false.4643
.if.true.4643:
store i1 1, i1* %found.4615
%.tmp4644 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4645 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4644, i32 0, i32 1
%.tmp4646 = load %m0$.File.type*, %m0$.File.type** %.tmp4645
%.tmp4648 = getelementptr [15 x i8], [15 x i8]*@.str4647, i32 0, i32 0
%.tmp4649 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4650 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4649, i32 0, i32 4
%.tmp4651 = load i8*, i8** %.tmp4650
%.tmp4652 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4646, i8* %.tmp4648, i8* %.tmp4651)
br label %.if.end.4643
.if.false.4643:
br label %.if.end.4643
.if.end.4643:
%.tmp4653 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4654 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4653, i32 0, i32 5
%.tmp4655 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4654
store %m1861$.Scope.type* %.tmp4655, %m1861$.Scope.type** %s.4619
br label %.for.start.4630
.for.end.4630:
%.tmp4656 = load i1, i1* %found.4615
%.tmp4657 = icmp eq i1 %.tmp4656, 0
br i1 %.tmp4657, label %.if.true.4658, label %.if.false.4658
.if.true.4658:
%.tmp4659 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4660 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4662 = getelementptr [48 x i8], [48 x i8]*@.str4661, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4659, %m307$.Node.type* %.tmp4660, i8* %.tmp4662)
br label %.if.end.4658
.if.false.4658:
br label %.if.end.4658
.if.end.4658:
br label %.if.end.4629
.if.false.4629:
%.tmp4663 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4664 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4663, i32 0, i32 6
%.tmp4665 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4664
%.tmp4666 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4665, i32 0, i32 1
%.tmp4667 = load i8*, i8** %.tmp4666
%.tmp4669 = getelementptr [9 x i8], [9 x i8]*@.str4668, i32 0, i32 0
%.tmp4670 = call i32(i8*,i8*) @strcmp(i8* %.tmp4667, i8* %.tmp4669)
%.tmp4671 = icmp eq i32 %.tmp4670, 0
br i1 %.tmp4671, label %.if.true.4672, label %.if.false.4672
.if.true.4672:
br label %.for.start.4673
.for.start.4673:
%.tmp4674 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4675 = icmp ne %m1861$.Scope.type* %.tmp4674, null
%.tmp4676 = load i1, i1* %found.4615
%.tmp4677 = icmp eq i1 %.tmp4676, 0
%.tmp4678 = and i1 %.tmp4675, %.tmp4677
br i1 %.tmp4678, label %.for.continue.4673, label %.for.end.4673
.for.continue.4673:
%.tmp4679 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4680 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4679, i32 0, i32 2
%.tmp4681 = load i8*, i8** %.tmp4680
%.tmp4683 = getelementptr [4 x i8], [4 x i8]*@.str4682, i32 0, i32 0
%.tmp4684 = call i32(i8*,i8*) @strcmp(i8* %.tmp4681, i8* %.tmp4683)
%.tmp4685 = icmp eq i32 %.tmp4684, 0
br i1 %.tmp4685, label %.if.true.4686, label %.if.false.4686
.if.true.4686:
store i1 1, i1* %found.4615
%.tmp4687 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4688 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4687, i32 0, i32 1
%.tmp4689 = load %m0$.File.type*, %m0$.File.type** %.tmp4688
%.tmp4691 = getelementptr [15 x i8], [15 x i8]*@.str4690, i32 0, i32 0
%.tmp4692 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4693 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4692, i32 0, i32 3
%.tmp4694 = load i8*, i8** %.tmp4693
%.tmp4695 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4689, i8* %.tmp4691, i8* %.tmp4694)
br label %.if.end.4686
.if.false.4686:
br label %.if.end.4686
.if.end.4686:
%.tmp4696 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4619
%.tmp4697 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4696, i32 0, i32 5
%.tmp4698 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4697
store %m1861$.Scope.type* %.tmp4698, %m1861$.Scope.type** %s.4619
br label %.for.start.4673
.for.end.4673:
%.tmp4699 = load i1, i1* %found.4615
%.tmp4700 = icmp eq i1 %.tmp4699, 0
br i1 %.tmp4700, label %.if.true.4701, label %.if.false.4701
.if.true.4701:
%.tmp4702 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4703 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4705 = getelementptr [48 x i8], [48 x i8]*@.str4704, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4702, %m307$.Node.type* %.tmp4703, i8* %.tmp4705)
br label %.if.end.4701
.if.false.4701:
br label %.if.end.4701
.if.end.4701:
br label %.if.end.4672
.if.false.4672:
%.tmp4706 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4707 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4709 = getelementptr [29 x i8], [29 x i8]*@.str4708, i32 0, i32 0
%.tmp4710 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4706, %m307$.Node.type* %.tmp4707, i8* %.tmp4709)
%.tmp4711 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4712 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4711, i32 0, i32 6
%.tmp4713 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4712
%.tmp4714 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4713, i32 0, i32 1
%.tmp4715 = load i8*, i8** %.tmp4714
%.tmp4716 = call i32(i8*,...) @printf(i8* %.tmp4710, i8* %.tmp4715)
br label %.if.end.4672
.if.end.4672:
br label %.if.end.4629
.if.end.4629:
br label %.if.end.4611
.if.false.4611:
%.tmp4717 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4718 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4720 = getelementptr [34 x i8], [34 x i8]*@.str4719, i32 0, i32 0
%.tmp4721 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4717, %m307$.Node.type* %.tmp4718, i8* %.tmp4720)
%.tmp4722 = load i8*, i8** %expr_type.4453
%.tmp4723 = call i32(i8*,...) @printf(i8* %.tmp4721, i8* %.tmp4722)
br label %.if.end.4611
.if.end.4611:
br label %.if.end.4603
.if.end.4603:
br label %.if.end.4595
.if.end.4595:
br label %.if.end.4537
.if.end.4537:
br label %.if.end.4528
.if.end.4528:
br label %.if.end.4517
.if.end.4517:
br label %.if.end.4511
.if.end.4511:
br label %.if.end.4464
.if.end.4464:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4724 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4725 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4724)
%for_id.4726 = alloca i32
store i32 %.tmp4725, i32* %for_id.4726
%.tmp4727 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4728 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4727, i32 0, i32 6
%.tmp4729 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4728
%.tmp4730 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4729, i32 0, i32 7
%.tmp4731 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4730
%init_stmt.4732 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4731, %m307$.Node.type** %init_stmt.4732
%.tmp4733 = bitcast ptr null to i8*
%begin_lbl.4734 = alloca i8*
store i8* %.tmp4733, i8** %begin_lbl.4734
%.tmp4735 = bitcast ptr null to i8*
%end_lbl.4736 = alloca i8*
store i8* %.tmp4735, i8** %end_lbl.4736
%.tmp4737 = getelementptr i8*, i8** %begin_lbl.4734, i32 0
%.tmp4739 = getelementptr [14 x i8], [14 x i8]*@.str4738, i32 0, i32 0
%.tmp4740 = load i32, i32* %for_id.4726
%.tmp4741 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4737, i8* %.tmp4739, i32 %.tmp4740)
%.tmp4742 = getelementptr i8*, i8** %end_lbl.4736, i32 0
%.tmp4744 = getelementptr [12 x i8], [12 x i8]*@.str4743, i32 0, i32 0
%.tmp4745 = load i32, i32* %for_id.4726
%.tmp4746 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4742, i8* %.tmp4744, i32 %.tmp4745)
%.tmp4747 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4749 = getelementptr [4 x i8], [4 x i8]*@.str4748, i32 0, i32 0
%.tmp4750 = load i8*, i8** %begin_lbl.4734
%.tmp4751 = load i8*, i8** %end_lbl.4736
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp4747, i8* %.tmp4749, i8* %.tmp4750, i8* %.tmp4751)
%.tmp4752 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
%.tmp4753 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4752, i32 0, i32 0
%.tmp4754 = load i8*, i8** %.tmp4753
%.tmp4756 = getelementptr [12 x i8], [12 x i8]*@.str4755, i32 0, i32 0
%.tmp4757 = call i32(i8*,i8*) @strcmp(i8* %.tmp4754, i8* %.tmp4756)
%.tmp4758 = icmp eq i32 %.tmp4757, 0
br i1 %.tmp4758, label %.if.true.4759, label %.if.false.4759
.if.true.4759:
%.tmp4760 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4761 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
%.tmp4762 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4760, %m307$.Node.type* %.tmp4761)
br label %.if.end.4759
.if.false.4759:
%.tmp4763 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
%.tmp4764 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4763, i32 0, i32 0
%.tmp4765 = load i8*, i8** %.tmp4764
%.tmp4767 = getelementptr [11 x i8], [11 x i8]*@.str4766, i32 0, i32 0
%.tmp4768 = call i32(i8*,i8*) @strcmp(i8* %.tmp4765, i8* %.tmp4767)
%.tmp4769 = icmp eq i32 %.tmp4768, 0
br i1 %.tmp4769, label %.if.true.4770, label %.if.false.4770
.if.true.4770:
%.tmp4771 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4772 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4771, %m307$.Node.type* %.tmp4772)
br label %.if.end.4770
.if.false.4770:
%.tmp4773 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
%.tmp4774 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4773, i32 0, i32 0
%.tmp4775 = load i8*, i8** %.tmp4774
%.tmp4777 = getelementptr [9 x i8], [9 x i8]*@.str4776, i32 0, i32 0
%.tmp4778 = call i32(i8*,i8*) @strcmp(i8* %.tmp4775, i8* %.tmp4777)
%.tmp4779 = icmp eq i32 %.tmp4778, 0
br i1 %.tmp4779, label %.if.true.4780, label %.if.false.4780
.if.true.4780:
br label %.if.end.4780
.if.false.4780:
%.tmp4781 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4782 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
%.tmp4784 = getelementptr [66 x i8], [66 x i8]*@.str4783, i32 0, i32 0
%.tmp4785 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4781, %m307$.Node.type* %.tmp4782, i8* %.tmp4784)
%.tmp4786 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4732
%.tmp4787 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4786, i32 0, i32 0
%.tmp4788 = load i8*, i8** %.tmp4787
%.tmp4789 = call i32(i8*,...) @printf(i8* %.tmp4785, i8* %.tmp4788)
%.tmp4790 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4790)
ret void
br label %.if.end.4780
.if.end.4780:
br label %.if.end.4770
.if.end.4770:
br label %.if.end.4759
.if.end.4759:
%.tmp4791 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4792 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4791, i32 0, i32 1
%.tmp4793 = load %m0$.File.type*, %m0$.File.type** %.tmp4792
%.tmp4795 = getelementptr [26 x i8], [26 x i8]*@.str4794, i32 0, i32 0
%.tmp4796 = load i32, i32* %for_id.4726
%.tmp4797 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4793, i8* %.tmp4795, i32 %.tmp4796)
%.tmp4798 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4799 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4798, i32 0, i32 1
%.tmp4800 = load %m0$.File.type*, %m0$.File.type** %.tmp4799
%.tmp4802 = getelementptr [16 x i8], [16 x i8]*@.str4801, i32 0, i32 0
%.tmp4803 = load i32, i32* %for_id.4726
%.tmp4804 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4800, i8* %.tmp4802, i32 %.tmp4803)
%.tmp4805 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4806 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4805, i32 0, i32 6
%.tmp4807 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4806
%.tmp4809 = getelementptr [9 x i8], [9 x i8]*@.str4808, i32 0, i32 0
%.tmp4810 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4807, i8* %.tmp4809)
%fst_colon.4811 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4810, %m307$.Node.type** %fst_colon.4811
%.tmp4812 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4811
%.tmp4813 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4812, i32 0, i32 7
%.tmp4814 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4813
%condition.4815 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4814, %m307$.Node.type** %condition.4815
%.tmp4816 = load %m307$.Node.type*, %m307$.Node.type** %condition.4815
%.tmp4817 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4816, i32 0, i32 0
%.tmp4818 = load i8*, i8** %.tmp4817
%.tmp4820 = getelementptr [9 x i8], [9 x i8]*@.str4819, i32 0, i32 0
%.tmp4821 = call i32(i8*,i8*) @strcmp(i8* %.tmp4818, i8* %.tmp4820)
%.tmp4822 = icmp eq i32 %.tmp4821, 0
br i1 %.tmp4822, label %.if.true.4823, label %.if.false.4823
.if.true.4823:
%.tmp4824 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4825 = load %m307$.Node.type*, %m307$.Node.type** %condition.4815
%.tmp4827 = getelementptr [39 x i8], [39 x i8]*@.str4826, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4824, %m307$.Node.type* %.tmp4825, i8* %.tmp4827)
ret void
br label %.if.end.4823
.if.false.4823:
br label %.if.end.4823
.if.end.4823:
%.tmp4828 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4829 = load %m307$.Node.type*, %m307$.Node.type** %condition.4815
%.tmp4830 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4828, %m307$.Node.type* %.tmp4829)
%condition_info.4831 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4830, %m1861$.AssignableInfo.type** %condition_info.4831
%.tmp4832 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4833 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4832, i32 0, i32 1
%.tmp4834 = load %m0$.File.type*, %m0$.File.type** %.tmp4833
%.tmp4836 = getelementptr [48 x i8], [48 x i8]*@.str4835, i32 0, i32 0
%.tmp4837 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4838 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4831
%.tmp4839 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4838, i32 0, i32 3
%.tmp4840 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4839
%.tmp4841 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4837, %m1861$.Type.type* %.tmp4840)
%.tmp4842 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4831
%.tmp4843 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4842)
%.tmp4844 = load i32, i32* %for_id.4726
%.tmp4845 = load i8*, i8** %end_lbl.4736
%.tmp4846 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4834, i8* %.tmp4836, i8* %.tmp4841, i8* %.tmp4843, i32 %.tmp4844, i8* %.tmp4845)
%.tmp4847 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4848 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4847, i32 0, i32 1
%.tmp4849 = load %m0$.File.type*, %m0$.File.type** %.tmp4848
%.tmp4851 = getelementptr [19 x i8], [19 x i8]*@.str4850, i32 0, i32 0
%.tmp4852 = load i32, i32* %for_id.4726
%.tmp4853 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4849, i8* %.tmp4851, i32 %.tmp4852)
%.tmp4854 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4811
%.tmp4855 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4854, i32 0, i32 7
%.tmp4856 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4855
%.tmp4858 = getelementptr [9 x i8], [9 x i8]*@.str4857, i32 0, i32 0
%.tmp4859 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4856, i8* %.tmp4858)
%snd_colon.4860 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4859, %m307$.Node.type** %snd_colon.4860
%.tmp4861 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4860
%.tmp4862 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4861, i32 0, i32 7
%.tmp4863 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4862
%increment.4864 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4863, %m307$.Node.type** %increment.4864
%.tmp4865 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4860
%.tmp4867 = getelementptr [6 x i8], [6 x i8]*@.str4866, i32 0, i32 0
%.tmp4868 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4865, i8* %.tmp4867)
%for_body.4869 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4868, %m307$.Node.type** %for_body.4869
%.tmp4870 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4871 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4869
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4870, %m307$.Node.type* %.tmp4871)
%.tmp4872 = load %m307$.Node.type*, %m307$.Node.type** %increment.4864
%.tmp4873 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4869
%.tmp4874 = icmp ne %m307$.Node.type* %.tmp4872, %.tmp4873
br i1 %.tmp4874, label %.if.true.4875, label %.if.false.4875
.if.true.4875:
%.tmp4876 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4877 = load %m307$.Node.type*, %m307$.Node.type** %increment.4864
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4876, %m307$.Node.type* %.tmp4877)
br label %.if.end.4875
.if.false.4875:
br label %.if.end.4875
.if.end.4875:
%.tmp4878 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4879 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4878, i32 0, i32 1
%.tmp4880 = load %m0$.File.type*, %m0$.File.type** %.tmp4879
%.tmp4882 = getelementptr [15 x i8], [15 x i8]*@.str4881, i32 0, i32 0
%.tmp4883 = load i8*, i8** %begin_lbl.4734
%.tmp4884 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4880, i8* %.tmp4882, i8* %.tmp4883)
%.tmp4885 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4886 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4885, i32 0, i32 1
%.tmp4887 = load %m0$.File.type*, %m0$.File.type** %.tmp4886
%.tmp4889 = getelementptr [5 x i8], [5 x i8]*@.str4888, i32 0, i32 0
%.tmp4890 = load i8*, i8** %end_lbl.4736
%.tmp4891 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4887, i8* %.tmp4889, i8* %.tmp4890)
%.tmp4892 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4892)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4893 = bitcast ptr null to %m1861$.Type.type*
%decl_type.4894 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4893, %m1861$.Type.type** %decl_type.4894
%.tmp4895 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4896 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4895, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp4897 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4898 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4897, i32 0, i32 6
%.tmp4899 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4898
%.tmp4900 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4899, i32 0, i32 0
%.tmp4901 = load i8*, i8** %.tmp4900
%.tmp4903 = getelementptr [5 x i8], [5 x i8]*@.str4902, i32 0, i32 0
%.tmp4904 = call i32(i8*,i8*) @strcmp(i8* %.tmp4901, i8* %.tmp4903)
%.tmp4905 = icmp eq i32 %.tmp4904, 0
br i1 %.tmp4905, label %.if.true.4906, label %.if.false.4906
.if.true.4906:
%.tmp4907 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4908 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4909 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4908, i32 0, i32 6
%.tmp4910 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4909
%.tmp4911 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4910, i32 0, i32 6
%.tmp4912 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4911
%.tmp4913 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4907, %m307$.Node.type* %.tmp4912)
store %m1861$.Type.type* %.tmp4913, %m1861$.Type.type** %decl_type.4894
br label %.if.end.4906
.if.false.4906:
br label %.if.end.4906
.if.end.4906:
%.tmp4914 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4914, i32 0, i32 6
%.tmp4916 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4915
%.tmp4918 = getelementptr [11 x i8], [11 x i8]*@.str4917, i32 0, i32 0
%.tmp4919 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4916, i8* %.tmp4918)
%assignable.4920 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4919, %m307$.Node.type** %assignable.4920
%.tmp4921 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4920
%.tmp4922 = icmp ne %m307$.Node.type* %.tmp4921, null
br i1 %.tmp4922, label %.if.true.4923, label %.if.false.4923
.if.true.4923:
%.tmp4924 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4925 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4920
%.tmp4926 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4924, %m307$.Node.type* %.tmp4925)
store %m1861$.AssignableInfo.type* %.tmp4926, %m1861$.AssignableInfo.type** %a_info.4896
br label %.if.end.4923
.if.false.4923:
br label %.if.end.4923
.if.end.4923:
%.tmp4927 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4928 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4927)
%info.4929 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4928, %m1861$.AssignableInfo.type** %info.4929
%.tmp4930 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp4931 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4930, i32 0, i32 2
%.tmp4933 = getelementptr [9 x i8], [9 x i8]*@.str4932, i32 0, i32 0
store i8* %.tmp4933, i8** %.tmp4931
%.tmp4934 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4935 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4934, i32 0, i32 6
%.tmp4936 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4935
%.tmp4938 = getelementptr [5 x i8], [5 x i8]*@.str4937, i32 0, i32 0
%.tmp4939 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4936, i8* %.tmp4938)
%var_name.4940 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4939, %m307$.Node.type** %var_name.4940
%.tmp4941 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4940
%.tmp4942 = icmp eq %m307$.Node.type* %.tmp4941, null
br i1 %.tmp4942, label %.if.true.4943, label %.if.false.4943
.if.true.4943:
%.tmp4944 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4945 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4947 = getelementptr [31 x i8], [31 x i8]*@.str4946, i32 0, i32 0
%.tmp4948 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4944, %m307$.Node.type* %.tmp4945, i8* %.tmp4947)
%.tmp4949 = call i32(i8*,...) @printf(i8* %.tmp4948)
%.tmp4950 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4950
br label %.if.end.4943
.if.false.4943:
br label %.if.end.4943
.if.end.4943:
%.tmp4951 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4952 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4951)
%mod.4953 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4952, %m1861$.ModuleLookup.type** %mod.4953
%.tmp4954 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4955 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4953
%.tmp4956 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4955, i32 0, i32 3
%.tmp4957 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4956
%.tmp4958 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4940
%.tmp4959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4958, i32 0, i32 1
%.tmp4960 = load i8*, i8** %.tmp4959
%.tmp4961 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp4954, %m1861$.Scope.type* %.tmp4957, i8* %.tmp4960)
%.tmp4962 = icmp ne %m1861$.ScopeItem.type* %.tmp4961, null
br i1 %.tmp4962, label %.if.true.4963, label %.if.false.4963
.if.true.4963:
%err_buf.4964 = alloca i8*
store i8* null, i8** %err_buf.4964
%.tmp4965 = getelementptr i8*, i8** %err_buf.4964, i32 0
%.tmp4967 = getelementptr [43 x i8], [43 x i8]*@.str4966, i32 0, i32 0
%.tmp4968 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4940
%.tmp4969 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4968, i32 0, i32 1
%.tmp4970 = load i8*, i8** %.tmp4969
%.tmp4971 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4965, i8* %.tmp4967, i8* %.tmp4970)
%.tmp4972 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4973 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4974 = load i8*, i8** %err_buf.4964
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4972, %m307$.Node.type* %.tmp4973, i8* %.tmp4974)
%.tmp4975 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4975
br label %.if.end.4963
.if.false.4963:
br label %.if.end.4963
.if.end.4963:
%var_id.4976 = alloca i8*
store i8* null, i8** %var_id.4976
%.tmp4977 = getelementptr i8*, i8** %var_id.4976, i32 0
%.tmp4979 = getelementptr [6 x i8], [6 x i8]*@.str4978, i32 0, i32 0
%.tmp4980 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4940
%.tmp4981 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4980, i32 0, i32 1
%.tmp4982 = load i8*, i8** %.tmp4981
%.tmp4983 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4984 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4983)
%.tmp4985 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4977, i8* %.tmp4979, i8* %.tmp4982, i32 %.tmp4984)
%.tmp4986 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp4987 = load i8, i8* @SCOPE_LOCAL
%.tmp4988 = load i8*, i8** %var_id.4976
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp4986, i8 %.tmp4987, i8* %.tmp4988)
%.tmp4989 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4894
%.tmp4990 = icmp ne %m1861$.Type.type* %.tmp4989, null
br i1 %.tmp4990, label %.if.true.4991, label %.if.false.4991
.if.true.4991:
%.tmp4992 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp4993 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4992, i32 0, i32 3
%.tmp4994 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4894
store %m1861$.Type.type* %.tmp4994, %m1861$.Type.type** %.tmp4993
br label %.if.end.4991
.if.false.4991:
%.tmp4995 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp4996 = icmp ne %m1861$.AssignableInfo.type* %.tmp4995, null
br i1 %.tmp4996, label %.if.true.4997, label %.if.false.4997
.if.true.4997:
%.tmp4998 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp4999 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4998, i32 0, i32 3
%.tmp5000 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp5001 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5000, i32 0, i32 3
%.tmp5002 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5001
store %m1861$.Type.type* %.tmp5002, %m1861$.Type.type** %.tmp4999
br label %.if.end.4997
.if.false.4997:
br label %.if.end.4997
.if.end.4997:
br label %.if.end.4991
.if.end.4991:
%.tmp5003 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5004 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp5005 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5004, i32 0, i32 3
%.tmp5006 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5005
%.tmp5007 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5003, %m1861$.Type.type* %.tmp5006)
%var_type_repr.5008 = alloca i8*
store i8* %.tmp5007, i8** %var_type_repr.5008
%.tmp5009 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp5010 = icmp ne %m1861$.AssignableInfo.type* %.tmp5009, null
br i1 %.tmp5010, label %.if.true.5011, label %.if.false.5011
.if.true.5011:
%.tmp5012 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5013 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp5014 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5013, i32 0, i32 3
%.tmp5015 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5014
%.tmp5016 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5012, %m1861$.Type.type* %.tmp5015)
%a_type_repr.5017 = alloca i8*
store i8* %.tmp5016, i8** %a_type_repr.5017
%type_error.5018 = alloca i1
store i1 0, i1* %type_error.5018
%.tmp5019 = load i8*, i8** %a_type_repr.5017
%.tmp5020 = call i32(i8*) @strlen(i8* %.tmp5019)
%.tmp5021 = load i8*, i8** %var_type_repr.5008
%.tmp5022 = call i32(i8*) @strlen(i8* %.tmp5021)
%.tmp5023 = icmp ne i32 %.tmp5020, %.tmp5022
br i1 %.tmp5023, label %.if.true.5024, label %.if.false.5024
.if.true.5024:
store i1 1, i1* %type_error.5018
br label %.if.end.5024
.if.false.5024:
%.tmp5025 = load i8*, i8** %a_type_repr.5017
%.tmp5026 = load i8*, i8** %var_type_repr.5008
%.tmp5027 = call i32(i8*,i8*) @strcmp(i8* %.tmp5025, i8* %.tmp5026)
%.tmp5028 = icmp ne i32 %.tmp5027, 0
br i1 %.tmp5028, label %.if.true.5029, label %.if.false.5029
.if.true.5029:
store i1 1, i1* %type_error.5018
br label %.if.end.5029
.if.false.5029:
br label %.if.end.5029
.if.end.5029:
br label %.if.end.5024
.if.end.5024:
%.tmp5030 = load i1, i1* %type_error.5018
br i1 %.tmp5030, label %.if.true.5031, label %.if.false.5031
.if.true.5031:
%.tmp5032 = bitcast ptr null to i8*
%err_msg.5033 = alloca i8*
store i8* %.tmp5032, i8** %err_msg.5033
%.tmp5034 = getelementptr i8*, i8** %err_msg.5033, i32 0
%.tmp5036 = getelementptr [49 x i8], [49 x i8]*@.str5035, i32 0, i32 0
%.tmp5037 = load i8*, i8** %a_type_repr.5017
%.tmp5038 = load i8*, i8** %var_type_repr.5008
%.tmp5039 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5034, i8* %.tmp5036, i8* %.tmp5037, i8* %.tmp5038)
%.tmp5040 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5041 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5042 = load i8*, i8** %err_msg.5033
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5040, %m307$.Node.type* %.tmp5041, i8* %.tmp5042)
br label %.if.end.5031
.if.false.5031:
br label %.if.end.5031
.if.end.5031:
br label %.if.end.5011
.if.false.5011:
br label %.if.end.5011
.if.end.5011:
%.tmp5043 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5044 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4940
%.tmp5045 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5044, i32 0, i32 1
%.tmp5046 = load i8*, i8** %.tmp5045
%.tmp5047 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5043, i8* %.tmp5046, %m1861$.AssignableInfo.type* %.tmp5047)
%.tmp5048 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5049 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5048, i32 0, i32 1
%.tmp5050 = load %m0$.File.type*, %m0$.File.type** %.tmp5049
%.tmp5052 = getelementptr [16 x i8], [16 x i8]*@.str5051, i32 0, i32 0
%.tmp5053 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp5054 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5053)
%.tmp5055 = load i8*, i8** %var_type_repr.5008
%.tmp5056 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5050, i8* %.tmp5052, i8* %.tmp5054, i8* %.tmp5055)
%.tmp5057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp5058 = icmp ne %m1861$.AssignableInfo.type* %.tmp5057, null
br i1 %.tmp5058, label %.if.true.5059, label %.if.false.5059
.if.true.5059:
%.tmp5060 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5061 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5060, i32 0, i32 1
%.tmp5062 = load %m0$.File.type*, %m0$.File.type** %.tmp5061
%.tmp5064 = getelementptr [21 x i8], [21 x i8]*@.str5063, i32 0, i32 0
%.tmp5065 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5066 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp5067 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5066, i32 0, i32 3
%.tmp5068 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5067
%.tmp5069 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5065, %m1861$.Type.type* %.tmp5068)
%.tmp5070 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4896
%.tmp5071 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5070)
%.tmp5072 = load i8*, i8** %var_type_repr.5008
%.tmp5073 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
%.tmp5074 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5073)
%.tmp5075 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5062, i8* %.tmp5064, i8* %.tmp5069, i8* %.tmp5071, i8* %.tmp5072, i8* %.tmp5074)
br label %.if.end.5059
.if.false.5059:
%.tmp5076 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5077 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5078 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5076, %m307$.Node.type* %.tmp5077, %m1861$.AssignableInfo.type* %.tmp5078)
br label %.if.end.5059
.if.end.5059:
%.tmp5079 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4929
ret %m1861$.AssignableInfo.type* %.tmp5079
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5080 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5081 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5080, i32 0, i32 3
%.tmp5082 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5081
%.tmp5083 = icmp eq %m1861$.Type.type* %.tmp5082, null
br i1 %.tmp5083, label %.if.true.5084, label %.if.false.5084
.if.true.5084:
ret void
br label %.if.end.5084
.if.false.5084:
br label %.if.end.5084
.if.end.5084:
%.tmp5085 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5086 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5087 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5086, i32 0, i32 3
%.tmp5088 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5087
%.tmp5089 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5085, %m1861$.Type.type* %.tmp5088)
%t_repr.5090 = alloca i8*
store i8* %.tmp5089, i8** %t_repr.5090
%.tmp5091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5092 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5091)
%id.5093 = alloca i8*
store i8* %.tmp5092, i8** %id.5093
%field_id.5094 = alloca i32
store i32 0, i32* %field_id.5094
%field.5095 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5095
%field_info.5096 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5097 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5098 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5097, i32 0, i32 3
%.tmp5099 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5098
%t.5100 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5099, %m1861$.Type.type** %t.5100
%.tmp5101 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5102 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5101, i32 0, i32 0
%.tmp5103 = load i8*, i8** %.tmp5102
%.tmp5105 = getelementptr [4 x i8], [4 x i8]*@.str5104, i32 0, i32 0
%.tmp5106 = call i32(i8*,i8*) @strcmp(i8* %.tmp5103, i8* %.tmp5105)
%.tmp5107 = icmp eq i32 %.tmp5106, 0
%.tmp5108 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5109 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5108, i32 0, i32 0
%.tmp5110 = load i8*, i8** %.tmp5109
%.tmp5112 = getelementptr [4 x i8], [4 x i8]*@.str5111, i32 0, i32 0
%.tmp5113 = call i32(i8*,i8*) @strcmp(i8* %.tmp5110, i8* %.tmp5112)
%.tmp5114 = icmp eq i32 %.tmp5113, 0
%.tmp5115 = or i1 %.tmp5107, %.tmp5114
%.tmp5116 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5117 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5116, i32 0, i32 0
%.tmp5118 = load i8*, i8** %.tmp5117
%.tmp5120 = getelementptr [5 x i8], [5 x i8]*@.str5119, i32 0, i32 0
%.tmp5121 = call i32(i8*,i8*) @strcmp(i8* %.tmp5118, i8* %.tmp5120)
%.tmp5122 = icmp eq i32 %.tmp5121, 0
%.tmp5123 = or i1 %.tmp5115, %.tmp5122
br i1 %.tmp5123, label %.if.true.5124, label %.if.false.5124
.if.true.5124:
%.tmp5125 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5126 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5125, i32 0, i32 1
%.tmp5127 = load %m0$.File.type*, %m0$.File.type** %.tmp5126
%.tmp5129 = getelementptr [21 x i8], [21 x i8]*@.str5128, i32 0, i32 0
%.tmp5130 = load i8*, i8** %t_repr.5090
%.tmp5131 = load i8*, i8** %t_repr.5090
%.tmp5132 = load i8*, i8** %id.5093
%.tmp5133 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5127, i8* %.tmp5129, i8* %.tmp5130, i32 0, i8* %.tmp5131, i8* %.tmp5132)
br label %.if.end.5124
.if.false.5124:
%.tmp5134 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5135 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5134, i32 0, i32 0
%.tmp5136 = load i8*, i8** %.tmp5135
%.tmp5138 = getelementptr [4 x i8], [4 x i8]*@.str5137, i32 0, i32 0
%.tmp5139 = call i32(i8*,i8*) @strcmp(i8* %.tmp5136, i8* %.tmp5138)
%.tmp5140 = icmp eq i32 %.tmp5139, 0
br i1 %.tmp5140, label %.if.true.5141, label %.if.false.5141
.if.true.5141:
%.tmp5142 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5143 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5142, i32 0, i32 1
%.tmp5144 = load %m0$.File.type*, %m0$.File.type** %.tmp5143
%.tmp5146 = getelementptr [21 x i8], [21 x i8]*@.str5145, i32 0, i32 0
%.tmp5147 = load i8*, i8** %t_repr.5090
%.tmp5149 = getelementptr [5 x i8], [5 x i8]*@.str5148, i32 0, i32 0
%.tmp5150 = load i8*, i8** %t_repr.5090
%.tmp5151 = load i8*, i8** %id.5093
%.tmp5152 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5144, i8* %.tmp5146, i8* %.tmp5147, i8* %.tmp5149, i8* %.tmp5150, i8* %.tmp5151)
br label %.if.end.5141
.if.false.5141:
%.tmp5153 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5154 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5153, i32 0, i32 0
%.tmp5155 = load i8*, i8** %.tmp5154
%.tmp5157 = getelementptr [7 x i8], [7 x i8]*@.str5156, i32 0, i32 0
%.tmp5158 = call i32(i8*,i8*) @strcmp(i8* %.tmp5155, i8* %.tmp5157)
%.tmp5159 = icmp eq i32 %.tmp5158, 0
br i1 %.tmp5159, label %.if.true.5160, label %.if.false.5160
.if.true.5160:
%.tmp5162 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5163 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5162, i32 0, i32 3
%.tmp5164 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5163
store %m1861$.Type.type* %.tmp5164, %m1861$.Type.type** %field.5095
br label %.for.start.5161
.for.start.5161:
%.tmp5165 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5095
%.tmp5166 = icmp ne %m1861$.Type.type* %.tmp5165, null
br i1 %.tmp5166, label %.for.continue.5161, label %.for.end.5161
.for.continue.5161:
%.tmp5167 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5168 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5167)
store %m1861$.AssignableInfo.type* %.tmp5168, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5169 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5170 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5169, %m1861$.AssignableInfo.type* %.tmp5170)
%.tmp5171 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5172 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5171, i32 0, i32 3
%.tmp5173 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5095
store %m1861$.Type.type* %.tmp5173, %m1861$.Type.type** %.tmp5172
%.tmp5174 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5175 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5174, i32 0, i32 1
%.tmp5176 = load %m0$.File.type*, %m0$.File.type** %.tmp5175
%.tmp5178 = getelementptr [46 x i8], [46 x i8]*@.str5177, i32 0, i32 0
%.tmp5179 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5180 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5179)
%.tmp5181 = load i8*, i8** %t_repr.5090
%.tmp5182 = load i8*, i8** %t_repr.5090
%.tmp5183 = load i8*, i8** %id.5093
%.tmp5184 = load i32, i32* %field_id.5094
%.tmp5185 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5176, i8* %.tmp5178, i8* %.tmp5180, i8* %.tmp5181, i8* %.tmp5182, i8* %.tmp5183, i32 %.tmp5184)
%.tmp5186 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5187 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5188 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5186, %m307$.Node.type* %.tmp5187, %m1861$.AssignableInfo.type* %.tmp5188)
%.tmp5189 = load i32, i32* %field_id.5094
%.tmp5190 = add i32 %.tmp5189, 1
store i32 %.tmp5190, i32* %field_id.5094
%.tmp5191 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5095
%.tmp5192 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5191, i32 0, i32 4
%.tmp5193 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5192
store %m1861$.Type.type* %.tmp5193, %m1861$.Type.type** %field.5095
br label %.for.start.5161
.for.end.5161:
br label %.if.end.5160
.if.false.5160:
%.tmp5194 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5195 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5194, i32 0, i32 0
%.tmp5196 = load i8*, i8** %.tmp5195
%.tmp5198 = getelementptr [10 x i8], [10 x i8]*@.str5197, i32 0, i32 0
%.tmp5199 = call i32(i8*,i8*) @strcmp(i8* %.tmp5196, i8* %.tmp5198)
%.tmp5200 = icmp eq i32 %.tmp5199, 0
br i1 %.tmp5200, label %.if.true.5201, label %.if.false.5201
.if.true.5201:
%.tmp5203 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5100
%.tmp5204 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5203, i32 0, i32 3
%.tmp5205 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5204
%.tmp5206 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5205, i32 0, i32 3
%.tmp5207 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5206
store %m1861$.Type.type* %.tmp5207, %m1861$.Type.type** %field.5095
br label %.for.start.5202
.for.start.5202:
%.tmp5208 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5095
%.tmp5209 = icmp ne %m1861$.Type.type* %.tmp5208, null
br i1 %.tmp5209, label %.for.continue.5202, label %.for.end.5202
.for.continue.5202:
%.tmp5210 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5211 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5210)
store %m1861$.AssignableInfo.type* %.tmp5211, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5212 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5213 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5212, %m1861$.AssignableInfo.type* %.tmp5213)
%.tmp5214 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5215 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5214, i32 0, i32 3
%.tmp5216 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5095
store %m1861$.Type.type* %.tmp5216, %m1861$.Type.type** %.tmp5215
%.tmp5217 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5218 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5217, i32 0, i32 1
%.tmp5219 = load %m0$.File.type*, %m0$.File.type** %.tmp5218
%.tmp5221 = getelementptr [46 x i8], [46 x i8]*@.str5220, i32 0, i32 0
%.tmp5222 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
%.tmp5223 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5222)
%.tmp5224 = load i8*, i8** %t_repr.5090
%.tmp5225 = load i8*, i8** %t_repr.5090
%.tmp5226 = load i8*, i8** %id.5093
%.tmp5227 = load i32, i32* %field_id.5094
%.tmp5228 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5219, i8* %.tmp5221, i8* %.tmp5223, i8* %.tmp5224, i8* %.tmp5225, i8* %.tmp5226, i32 %.tmp5227)
%.tmp5229 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5230 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5231 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5096
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5229, %m307$.Node.type* %.tmp5230, %m1861$.AssignableInfo.type* %.tmp5231)
%.tmp5232 = load i32, i32* %field_id.5094
%.tmp5233 = add i32 %.tmp5232, 1
store i32 %.tmp5233, i32* %field_id.5094
%.tmp5234 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5095
%.tmp5235 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5234, i32 0, i32 4
%.tmp5236 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5235
store %m1861$.Type.type* %.tmp5236, %m1861$.Type.type** %field.5095
br label %.for.start.5202
.for.end.5202:
br label %.if.end.5201
.if.false.5201:
%.tmp5237 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5238 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5240 = getelementptr [44 x i8], [44 x i8]*@.str5239, i32 0, i32 0
%.tmp5241 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5237, %m307$.Node.type* %.tmp5238, i8* %.tmp5240)
%.tmp5242 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5243 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5242, i32 0, i32 3
%.tmp5244 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5243
%.tmp5245 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5244, i32 0, i32 0
%.tmp5246 = load i8*, i8** %.tmp5245
%.tmp5247 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5248 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5249 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5248, i32 0, i32 3
%.tmp5250 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5249
%.tmp5251 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5247, %m1861$.Type.type* %.tmp5250)
%.tmp5252 = call i32(i8*,...) @printf(i8* %.tmp5241, i8* %.tmp5246, i8* %.tmp5251)
ret void
br label %.if.end.5201
.if.end.5201:
br label %.if.end.5160
.if.end.5160:
br label %.if.end.5141
.if.end.5141:
br label %.if.end.5124
.if.end.5124:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5253 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5254 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5253, i32 0, i32 6
%.tmp5255 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5254
%.tmp5257 = getelementptr [11 x i8], [11 x i8]*@.str5256, i32 0, i32 0
%.tmp5258 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5255, i8* %.tmp5257)
%assignable.5259 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5258, %m307$.Node.type** %assignable.5259
%.tmp5260 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5261 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5259
%.tmp5262 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5260, %m307$.Node.type* %.tmp5261)
%a_info.5263 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5262, %m1861$.AssignableInfo.type** %a_info.5263
%.tmp5264 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5263
%.tmp5265 = icmp eq %m1861$.AssignableInfo.type* %.tmp5264, null
br i1 %.tmp5265, label %.if.true.5266, label %.if.false.5266
.if.true.5266:
ret void
br label %.if.end.5266
.if.false.5266:
br label %.if.end.5266
.if.end.5266:
%.tmp5267 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5268 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5267)
%if_id.5269 = alloca i32
store i32 %.tmp5268, i32* %if_id.5269
%.tmp5270 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5271 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5270, i32 0, i32 1
%.tmp5272 = load %m0$.File.type*, %m0$.File.type** %.tmp5271
%.tmp5274 = getelementptr [53 x i8], [53 x i8]*@.str5273, i32 0, i32 0
%.tmp5275 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5276 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5263
%.tmp5277 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5276, i32 0, i32 3
%.tmp5278 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5277
%.tmp5279 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5275, %m1861$.Type.type* %.tmp5278)
%.tmp5280 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5263
%.tmp5281 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5280)
%.tmp5282 = load i32, i32* %if_id.5269
%.tmp5283 = load i32, i32* %if_id.5269
%.tmp5284 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5272, i8* %.tmp5274, i8* %.tmp5279, i8* %.tmp5281, i32 %.tmp5282, i32 %.tmp5283)
%.tmp5285 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5286 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5285, i32 0, i32 1
%.tmp5287 = load %m0$.File.type*, %m0$.File.type** %.tmp5286
%.tmp5289 = getelementptr [14 x i8], [14 x i8]*@.str5288, i32 0, i32 0
%.tmp5290 = load i32, i32* %if_id.5269
%.tmp5291 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5287, i8* %.tmp5289, i32 %.tmp5290)
%.tmp5292 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5293 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5292, i32 0, i32 6
%.tmp5294 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5293
%.tmp5296 = getelementptr [6 x i8], [6 x i8]*@.str5295, i32 0, i32 0
%.tmp5297 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5294, i8* %.tmp5296)
%block.5298 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5297, %m307$.Node.type** %block.5298
%.tmp5299 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5300 = load %m307$.Node.type*, %m307$.Node.type** %block.5298
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5299, %m307$.Node.type* %.tmp5300)
%.tmp5301 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5302 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5301, i32 0, i32 1
%.tmp5303 = load %m0$.File.type*, %m0$.File.type** %.tmp5302
%.tmp5305 = getelementptr [23 x i8], [23 x i8]*@.str5304, i32 0, i32 0
%.tmp5306 = load i32, i32* %if_id.5269
%.tmp5307 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5303, i8* %.tmp5305, i32 %.tmp5306)
%.tmp5308 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5309 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5308, i32 0, i32 1
%.tmp5310 = load %m0$.File.type*, %m0$.File.type** %.tmp5309
%.tmp5312 = getelementptr [15 x i8], [15 x i8]*@.str5311, i32 0, i32 0
%.tmp5313 = load i32, i32* %if_id.5269
%.tmp5314 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5310, i8* %.tmp5312, i32 %.tmp5313)
%.tmp5315 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5316 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5315, i32 0, i32 6
%.tmp5317 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5316
%.tmp5319 = getelementptr [11 x i8], [11 x i8]*@.str5318, i32 0, i32 0
%.tmp5320 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5317, i8* %.tmp5319)
%else_block.5321 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5320, %m307$.Node.type** %else_block.5321
%.tmp5322 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5321
%.tmp5323 = icmp ne %m307$.Node.type* %.tmp5322, null
br i1 %.tmp5323, label %.if.true.5324, label %.if.false.5324
.if.true.5324:
%.tmp5325 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5321
%.tmp5326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5325, i32 0, i32 6
%.tmp5327 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5326
%.tmp5328 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5327, i32 0, i32 0
%.tmp5329 = load i8*, i8** %.tmp5328
%.tmp5331 = getelementptr [11 x i8], [11 x i8]*@.str5330, i32 0, i32 0
%.tmp5332 = call i32(i8*,i8*) @strcmp(i8* %.tmp5329, i8* %.tmp5331)
%.tmp5333 = icmp eq i32 %.tmp5332, 0
br i1 %.tmp5333, label %.if.true.5334, label %.if.false.5334
.if.true.5334:
%.tmp5335 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5321
%.tmp5336 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5335, i32 0, i32 6
%.tmp5337 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5336
%.tmp5338 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5337, i32 0, i32 6
%.tmp5339 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5338
%.tmp5341 = getelementptr [6 x i8], [6 x i8]*@.str5340, i32 0, i32 0
%.tmp5342 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5339, i8* %.tmp5341)
store %m307$.Node.type* %.tmp5342, %m307$.Node.type** %block.5298
%.tmp5343 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5344 = load %m307$.Node.type*, %m307$.Node.type** %block.5298
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5343, %m307$.Node.type* %.tmp5344)
br label %.if.end.5334
.if.false.5334:
%.tmp5345 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5346 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5321
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5345, %m307$.Node.type* %.tmp5346)
br label %.if.end.5334
.if.end.5334:
br label %.if.end.5324
.if.false.5324:
br label %.if.end.5324
.if.end.5324:
%.tmp5347 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5348 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5347, i32 0, i32 1
%.tmp5349 = load %m0$.File.type*, %m0$.File.type** %.tmp5348
%.tmp5351 = getelementptr [23 x i8], [23 x i8]*@.str5350, i32 0, i32 0
%.tmp5352 = load i32, i32* %if_id.5269
%.tmp5353 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5349, i8* %.tmp5351, i32 %.tmp5352)
%.tmp5354 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5355 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5354, i32 0, i32 1
%.tmp5356 = load %m0$.File.type*, %m0$.File.type** %.tmp5355
%.tmp5358 = getelementptr [13 x i8], [13 x i8]*@.str5357, i32 0, i32 0
%.tmp5359 = load i32, i32* %if_id.5269
%.tmp5360 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5356, i8* %.tmp5358, i32 %.tmp5359)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5361 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5362 = icmp ne %m307$.Node.type* %.tmp5361, null
br i1 %.tmp5362, label %.if.true.5363, label %.if.false.5363
.if.true.5363:
%.tmp5364 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5365 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5364, i32 0, i32 6
%.tmp5366 = load i8*, i8** %.tmp5365
%.tmp5367 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5368 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5367, i32 0, i32 3
%.tmp5369 = load i32, i32* %.tmp5368
%.tmp5370 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5371 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5370, i32 0, i32 4
%.tmp5372 = load i32, i32* %.tmp5371
%.tmp5373 = load i8*, i8** %msg
%.tmp5374 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5366, i32 %.tmp5369, i32 %.tmp5372, i8* %.tmp5373)
%err.5375 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5374, %m751$.Error.type** %err.5375
%.tmp5376 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5377 = load %m751$.Error.type*, %m751$.Error.type** %err.5375
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5376, %m751$.Error.type* %.tmp5377)
br label %.if.end.5363
.if.false.5363:
%.tmp5379 = getelementptr [61 x i8], [61 x i8]*@.str5378, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5379)
br label %.if.end.5363
.if.end.5363:
ret void
}
define void @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5380 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5381 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5380)
%mod.5382 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5381, %m1861$.ModuleLookup.type** %mod.5382
%.tmp5383 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5382
%.tmp5384 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5383, i32 0, i32 3
%.tmp5385 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5384
%.tmp5386 = icmp ne %m1861$.Scope.type* %.tmp5385, null
%.tmp5388 = getelementptr [82 x i8], [82 x i8]*@.str5387, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5386, i8* %.tmp5388)
%.tmp5389 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5382
%.tmp5390 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5389, i32 0, i32 3
%.tmp5391 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5390
%current_scope.5392 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5391, %m1861$.Scope.type** %current_scope.5392
%.tmp5393 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5394 = ptrtoint %m1861$.ScopeItem.type* %.tmp5393 to i32
%.tmp5395 = call i8*(i32) @malloc(i32 %.tmp5394)
%.tmp5396 = bitcast i8* %.tmp5395 to %m1861$.ScopeItem.type*
%newitem.5397 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5396, %m1861$.ScopeItem.type** %newitem.5397
%.tmp5398 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5397
%.tmp5399 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5398, i32 0, i32 0
%.tmp5400 = load i8*, i8** %name
store i8* %.tmp5400, i8** %.tmp5399
%.tmp5401 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5397
%.tmp5402 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5401, i32 0, i32 1
%.tmp5403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5403, %m1861$.AssignableInfo.type** %.tmp5402
%.tmp5404 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5397
%.tmp5405 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5404, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5405
%.tmp5406 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5392
%.tmp5407 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5406, i32 0, i32 1
%.tmp5408 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5407
%.tmp5409 = icmp eq %m1861$.ScopeItem.type* %.tmp5408, null
br i1 %.tmp5409, label %.if.true.5410, label %.if.false.5410
.if.true.5410:
%.tmp5411 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5392
%.tmp5412 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5411, i32 0, i32 1
%.tmp5413 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5397
store %m1861$.ScopeItem.type* %.tmp5413, %m1861$.ScopeItem.type** %.tmp5412
ret void
br label %.if.end.5410
.if.false.5410:
br label %.if.end.5410
.if.end.5410:
%.tmp5414 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5392
%.tmp5415 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5414, i32 0, i32 1
%.tmp5416 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5415
%last_item.5417 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5416, %m1861$.ScopeItem.type** %last_item.5417
br label %.for.start.5418
.for.start.5418:
%.tmp5419 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5417
%.tmp5420 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5419, i32 0, i32 2
%.tmp5421 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5420
%.tmp5422 = icmp ne %m1861$.ScopeItem.type* %.tmp5421, null
br i1 %.tmp5422, label %.for.continue.5418, label %.for.end.5418
.for.continue.5418:
%.tmp5423 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5417
%.tmp5424 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5423, i32 0, i32 2
%.tmp5425 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5424
store %m1861$.ScopeItem.type* %.tmp5425, %m1861$.ScopeItem.type** %last_item.5417
br label %.for.start.5418
.for.end.5418:
%.tmp5426 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5417
%.tmp5427 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5426, i32 0, i32 2
%.tmp5428 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5397
store %m1861$.ScopeItem.type* %.tmp5428, %m1861$.ScopeItem.type** %.tmp5427
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5429 = alloca i8*
store i8* null, i8** %err_buf.5429
%.tmp5430 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5431 = load i8*, i8** %module
%.tmp5432 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5433 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5432, i32 0, i32 1
%.tmp5434 = load i8*, i8** %.tmp5433
%.tmp5435 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5430, i8* %.tmp5431, i8* %.tmp5434)
%found.5436 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5435, %m1861$.ScopeItem.type** %found.5436
%.tmp5437 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5436
%.tmp5438 = icmp eq %m1861$.ScopeItem.type* %.tmp5437, null
br i1 %.tmp5438, label %.if.true.5439, label %.if.false.5439
.if.true.5439:
%.tmp5440 = getelementptr i8*, i8** %err_buf.5429, i32 0
%.tmp5442 = getelementptr [31 x i8], [31 x i8]*@.str5441, i32 0, i32 0
%.tmp5443 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5444 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5443, i32 0, i32 1
%.tmp5445 = load i8*, i8** %.tmp5444
%.tmp5446 = load i8*, i8** %module
%.tmp5447 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5440, i8* %.tmp5442, i8* %.tmp5445, i8* %.tmp5446)
%.tmp5448 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5449 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5450 = load i8*, i8** %err_buf.5429
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5448, %m307$.Node.type* %.tmp5449, i8* %.tmp5450)
%.tmp5451 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5451
br label %.if.end.5439
.if.false.5439:
br label %.if.end.5439
.if.end.5439:
br label %.for.start.5452
.for.start.5452:
%.tmp5453 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5454 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5453, i32 0, i32 7
%.tmp5455 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5454
%.tmp5456 = icmp ne %m307$.Node.type* %.tmp5455, null
%.tmp5457 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5436
%.tmp5458 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5457, i32 0, i32 1
%.tmp5459 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5458
%.tmp5460 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5459, i32 0, i32 2
%.tmp5461 = load i8*, i8** %.tmp5460
%.tmp5463 = getelementptr [7 x i8], [7 x i8]*@.str5462, i32 0, i32 0
%.tmp5464 = call i32(i8*,i8*) @strcmp(i8* %.tmp5461, i8* %.tmp5463)
%.tmp5465 = icmp eq i32 %.tmp5464, 0
%.tmp5466 = and i1 %.tmp5456, %.tmp5465
br i1 %.tmp5466, label %.for.continue.5452, label %.for.end.5452
.for.continue.5452:
%.tmp5467 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5468 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5436
%.tmp5469 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5468, i32 0, i32 1
%.tmp5470 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5469
%.tmp5471 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5470, i32 0, i32 0
%.tmp5472 = load i8*, i8** %.tmp5471
%.tmp5473 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5474 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5473, i32 0, i32 7
%.tmp5475 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5474
%.tmp5476 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5475, i32 0, i32 7
%.tmp5477 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5476
%.tmp5478 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5467, i8* %.tmp5472, %m307$.Node.type* %.tmp5477)
store %m1861$.ScopeItem.type* %.tmp5478, %m1861$.ScopeItem.type** %found.5436
%.tmp5479 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5436
%.tmp5480 = icmp eq %m1861$.ScopeItem.type* %.tmp5479, null
br i1 %.tmp5480, label %.if.true.5481, label %.if.false.5481
.if.true.5481:
%.tmp5482 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5482
br label %.if.end.5481
.if.false.5481:
br label %.if.end.5481
.if.end.5481:
br label %.for.start.5452
.for.end.5452:
%.tmp5483 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5436
ret %m1861$.ScopeItem.type* %.tmp5483
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5484 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5485 = icmp eq %m1861$.Scope.type* %.tmp5484, null
br i1 %.tmp5485, label %.if.true.5486, label %.if.false.5486
.if.true.5486:
%.tmp5487 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5487
br label %.if.end.5486
.if.false.5486:
br label %.if.end.5486
.if.end.5486:
%.tmp5489 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5490 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5489, i32 0, i32 1
%.tmp5491 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5490
%item.5492 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5491, %m1861$.ScopeItem.type** %item.5492
br label %.for.start.5488
.for.start.5488:
%.tmp5493 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5492
%.tmp5494 = icmp ne %m1861$.ScopeItem.type* %.tmp5493, null
br i1 %.tmp5494, label %.for.continue.5488, label %.for.end.5488
.for.continue.5488:
%.tmp5495 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5492
%.tmp5496 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5495, i32 0, i32 0
%.tmp5497 = load i8*, i8** %.tmp5496
%.tmp5498 = load i8*, i8** %name
%.tmp5499 = call i32(i8*,i8*) @strcmp(i8* %.tmp5497, i8* %.tmp5498)
%.tmp5500 = icmp eq i32 %.tmp5499, 0
br i1 %.tmp5500, label %.if.true.5501, label %.if.false.5501
.if.true.5501:
%.tmp5502 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5492
ret %m1861$.ScopeItem.type* %.tmp5502
br label %.if.end.5501
.if.false.5501:
br label %.if.end.5501
.if.end.5501:
%.tmp5503 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5492
%.tmp5504 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5503, i32 0, i32 2
%.tmp5505 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5504
store %m1861$.ScopeItem.type* %.tmp5505, %m1861$.ScopeItem.type** %item.5492
br label %.for.start.5488
.for.end.5488:
%.tmp5506 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5506
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5507 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5508 = load i8*, i8** %module
%.tmp5509 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5507, i8* %.tmp5508)
%mod.5510 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5509, %m1861$.ModuleLookup.type** %mod.5510
%.tmp5511 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5510
%.tmp5512 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5511, i32 0, i32 3
%.tmp5513 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5512
%.tmp5514 = icmp ne %m1861$.Scope.type* %.tmp5513, null
%.tmp5516 = getelementptr [77 x i8], [77 x i8]*@.str5515, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5514, i8* %.tmp5516)
%.tmp5518 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5510
%.tmp5519 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5518, i32 0, i32 3
%.tmp5520 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5519
%s.5521 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5520, %m1861$.Scope.type** %s.5521
br label %.for.start.5517
.for.start.5517:
%.tmp5522 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5521
%.tmp5523 = icmp ne %m1861$.Scope.type* %.tmp5522, null
br i1 %.tmp5523, label %.for.continue.5517, label %.for.end.5517
.for.continue.5517:
%.tmp5524 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5525 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5521
%.tmp5526 = load i8*, i8** %assignable_name
%.tmp5527 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5524, %m1861$.Scope.type* %.tmp5525, i8* %.tmp5526)
%item.5528 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5527, %m1861$.ScopeItem.type** %item.5528
%.tmp5529 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5528
%.tmp5530 = icmp ne %m1861$.ScopeItem.type* %.tmp5529, null
br i1 %.tmp5530, label %.if.true.5531, label %.if.false.5531
.if.true.5531:
%.tmp5532 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5528
ret %m1861$.ScopeItem.type* %.tmp5532
br label %.if.end.5531
.if.false.5531:
br label %.if.end.5531
.if.end.5531:
%.tmp5533 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5521
%.tmp5534 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5533, i32 0, i32 5
%.tmp5535 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5534
store %m1861$.Scope.type* %.tmp5535, %m1861$.Scope.type** %s.5521
br label %.for.start.5517
.for.end.5517:
%.tmp5536 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5536
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5537 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5538 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5539 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5538, i32 0, i32 6
%.tmp5540 = load i8*, i8** %.tmp5539
%.tmp5541 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5542 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5541, i32 0, i32 6
%.tmp5543 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5542
%.tmp5544 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5537, i8* %.tmp5540, %m307$.Node.type* %.tmp5543)
ret %m1861$.ScopeItem.type* %.tmp5544
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5545 = alloca i8*
store i8* null, i8** %err_msg.5545
%buf.5546 = alloca i8*
store i8* null, i8** %buf.5546
%.tmp5547 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5548 = icmp eq %m1861$.AssignableInfo.type* %.tmp5547, null
br i1 %.tmp5548, label %.if.true.5549, label %.if.false.5549
.if.true.5549:
%.tmp5550 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5551 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5553 = getelementptr [54 x i8], [54 x i8]*@.str5552, i32 0, i32 0
%.tmp5554 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5550, %m307$.Node.type* %.tmp5551, i8* %.tmp5553)
%.tmp5555 = call i32(i8*,...) @printf(i8* %.tmp5554)
%.tmp5556 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5556
br label %.if.end.5549
.if.false.5549:
br label %.if.end.5549
.if.end.5549:
%.tmp5557 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5558 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5557, i32 0, i32 2
%.tmp5559 = load i8*, i8** %.tmp5558
%.tmp5561 = getelementptr [9 x i8], [9 x i8]*@.str5560, i32 0, i32 0
%.tmp5562 = call i32(i8*,i8*) @strcmp(i8* %.tmp5559, i8* %.tmp5561)
%.tmp5563 = icmp eq i32 %.tmp5562, 0
%.tmp5564 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5565 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5564, i32 0, i32 2
%.tmp5566 = load i8*, i8** %.tmp5565
%.tmp5568 = getelementptr [7 x i8], [7 x i8]*@.str5567, i32 0, i32 0
%.tmp5569 = call i32(i8*,i8*) @strcmp(i8* %.tmp5566, i8* %.tmp5568)
%.tmp5570 = icmp eq i32 %.tmp5569, 0
%.tmp5571 = or i1 %.tmp5563, %.tmp5570
br i1 %.tmp5571, label %.if.true.5572, label %.if.false.5572
.if.true.5572:
%.tmp5573 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5574 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5573, i32 0, i32 7
%.tmp5575 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5574
%.tmp5576 = icmp ne %m307$.Node.type* %.tmp5575, null
br i1 %.tmp5576, label %.if.true.5577, label %.if.false.5577
.if.true.5577:
%.tmp5578 = getelementptr i8*, i8** %err_msg.5545, i32 0
%.tmp5580 = getelementptr [46 x i8], [46 x i8]*@.str5579, i32 0, i32 0
%.tmp5581 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5582 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5581, i32 0, i32 7
%.tmp5583 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5582
%.tmp5584 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5583, i32 0, i32 7
%.tmp5585 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5584
%.tmp5586 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5585, i32 0, i32 1
%.tmp5587 = load i8*, i8** %.tmp5586
%.tmp5588 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5589 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5588, i32 0, i32 1
%.tmp5590 = load i8*, i8** %.tmp5589
%.tmp5591 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5578, i8* %.tmp5580, i8* %.tmp5587, i8* %.tmp5590)
%.tmp5592 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5593 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5594 = load i8*, i8** %err_msg.5545
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5592, %m307$.Node.type* %.tmp5593, i8* %.tmp5594)
%.tmp5595 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5595
br label %.if.end.5577
.if.false.5577:
br label %.if.end.5577
.if.end.5577:
%.tmp5596 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5596
br label %.if.end.5572
.if.false.5572:
%.tmp5597 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5598 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5597, i32 0, i32 2
%.tmp5599 = load i8*, i8** %.tmp5598
%.tmp5601 = getelementptr [9 x i8], [9 x i8]*@.str5600, i32 0, i32 0
%.tmp5602 = call i32(i8*,i8*) @strcmp(i8* %.tmp5599, i8* %.tmp5601)
%.tmp5603 = icmp eq i32 %.tmp5602, 0
%.tmp5604 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5605 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5604, i32 0, i32 7
%.tmp5606 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5605
%.tmp5607 = icmp ne %m307$.Node.type* %.tmp5606, null
%.tmp5608 = and i1 %.tmp5603, %.tmp5607
br i1 %.tmp5608, label %.if.true.5609, label %.if.false.5609
.if.true.5609:
%.tmp5610 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5611 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5610, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5612 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5613 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5612, i32 0, i32 3
%.tmp5614 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5613
%struct_info.5615 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5614, %m1861$.Type.type** %struct_info.5615
br label %.for.start.5616
.for.start.5616:
%.tmp5617 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5618 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5617, i32 0, i32 3
%.tmp5619 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5618
%.tmp5620 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5619, i32 0, i32 0
%.tmp5621 = load i8*, i8** %.tmp5620
%.tmp5623 = getelementptr [4 x i8], [4 x i8]*@.str5622, i32 0, i32 0
%.tmp5624 = call i32(i8*,i8*) @strcmp(i8* %.tmp5621, i8* %.tmp5623)
%.tmp5625 = icmp eq i32 %.tmp5624, 0
br i1 %.tmp5625, label %.for.continue.5616, label %.for.end.5616
.for.continue.5616:
%.tmp5626 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5627 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5626)
%new_base.5628 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5627, %m1861$.AssignableInfo.type** %new_base.5628
%.tmp5629 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5630 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5628
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5629, %m1861$.AssignableInfo.type* %.tmp5630)
%.tmp5631 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5628
%.tmp5632 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5631, i32 0, i32 3
%.tmp5633 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5634 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5633, i32 0, i32 3
%.tmp5635 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5634
%.tmp5636 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5635, i32 0, i32 3
%.tmp5637 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5636
store %m1861$.Type.type* %.tmp5637, %m1861$.Type.type** %.tmp5632
%.tmp5638 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5639 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5638, i32 0, i32 1
%.tmp5640 = load %m0$.File.type*, %m0$.File.type** %.tmp5639
%.tmp5642 = getelementptr [23 x i8], [23 x i8]*@.str5641, i32 0, i32 0
%.tmp5643 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5628
%.tmp5644 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5643)
%.tmp5645 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5646 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5628
%.tmp5647 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5646, i32 0, i32 3
%.tmp5648 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5647
%.tmp5649 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5645, %m1861$.Type.type* %.tmp5648)
%.tmp5650 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5651 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5652 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5651, i32 0, i32 3
%.tmp5653 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5652
%.tmp5654 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5650, %m1861$.Type.type* %.tmp5653)
%.tmp5655 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5656 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5655)
%.tmp5657 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5640, i8* %.tmp5642, i8* %.tmp5644, i8* %.tmp5649, i8* %.tmp5654, i8* %.tmp5656)
%.tmp5658 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5628
store %m1861$.AssignableInfo.type* %.tmp5658, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5659 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5615
%.tmp5660 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5659, i32 0, i32 3
%.tmp5661 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5660
store %m1861$.Type.type* %.tmp5661, %m1861$.Type.type** %struct_info.5615
br label %.for.start.5616
.for.end.5616:
%.tmp5662 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5615
%.tmp5663 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5662, i32 0, i32 0
%.tmp5664 = load i8*, i8** %.tmp5663
%.tmp5666 = getelementptr [10 x i8], [10 x i8]*@.str5665, i32 0, i32 0
%.tmp5667 = call i32(i8*,i8*) @strcmp(i8* %.tmp5664, i8* %.tmp5666)
%.tmp5668 = icmp eq i32 %.tmp5667, 0
br i1 %.tmp5668, label %.if.true.5669, label %.if.false.5669
.if.true.5669:
%.tmp5670 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5615
%.tmp5671 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5670, i32 0, i32 3
%.tmp5672 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5671
store %m1861$.Type.type* %.tmp5672, %m1861$.Type.type** %struct_info.5615
br label %.if.end.5669
.if.false.5669:
br label %.if.end.5669
.if.end.5669:
%.tmp5673 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5615
%.tmp5674 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5673, i32 0, i32 0
%.tmp5675 = load i8*, i8** %.tmp5674
%.tmp5677 = getelementptr [7 x i8], [7 x i8]*@.str5676, i32 0, i32 0
%.tmp5678 = call i32(i8*,i8*) @strcmp(i8* %.tmp5675, i8* %.tmp5677)
%.tmp5679 = icmp ne i32 %.tmp5678, 0
br i1 %.tmp5679, label %.if.true.5680, label %.if.false.5680
.if.true.5680:
%.tmp5681 = getelementptr i8*, i8** %err_msg.5545, i32 0
%.tmp5683 = getelementptr [48 x i8], [48 x i8]*@.str5682, i32 0, i32 0
%.tmp5684 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5685 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5684, i32 0, i32 7
%.tmp5686 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5685
%.tmp5687 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5686, i32 0, i32 7
%.tmp5688 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5687
%.tmp5689 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5688, i32 0, i32 1
%.tmp5690 = load i8*, i8** %.tmp5689
%.tmp5691 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5692 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5691, i32 0, i32 1
%.tmp5693 = load i8*, i8** %.tmp5692
%.tmp5694 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5681, i8* %.tmp5683, i8* %.tmp5690, i8* %.tmp5693)
%.tmp5695 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5696 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5697 = load i8*, i8** %err_msg.5545
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5695, %m307$.Node.type* %.tmp5696, i8* %.tmp5697)
%.tmp5698 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5698
br label %.if.end.5680
.if.false.5680:
br label %.if.end.5680
.if.end.5680:
%.tmp5699 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5700 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5699, i32 0, i32 7
%.tmp5701 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5700
%.tmp5702 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5701, i32 0, i32 7
%.tmp5703 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5702
%.tmp5704 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5703, i32 0, i32 1
%.tmp5705 = load i8*, i8** %.tmp5704
%field_name.5706 = alloca i8*
store i8* %.tmp5705, i8** %field_name.5706
%field_id.5707 = alloca i32
store i32 0, i32* %field_id.5707
%.tmp5708 = bitcast ptr null to %m1861$.Type.type*
%found_field.5709 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5708, %m1861$.Type.type** %found_field.5709
%.tmp5711 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5615
%.tmp5712 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5711, i32 0, i32 3
%.tmp5713 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5712
%field.5714 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5713, %m1861$.Type.type** %field.5714
br label %.for.start.5710
.for.start.5710:
%.tmp5715 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5714
%.tmp5716 = icmp ne %m1861$.Type.type* %.tmp5715, null
br i1 %.tmp5716, label %.for.continue.5710, label %.for.end.5710
.for.continue.5710:
%.tmp5717 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5714
%.tmp5718 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5717, i32 0, i32 1
%.tmp5719 = load i8*, i8** %.tmp5718
%.tmp5720 = load i8*, i8** %field_name.5706
%.tmp5721 = call i32(i8*,i8*) @strcmp(i8* %.tmp5719, i8* %.tmp5720)
%.tmp5722 = icmp eq i32 %.tmp5721, 0
br i1 %.tmp5722, label %.if.true.5723, label %.if.false.5723
.if.true.5723:
%.tmp5724 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5714
store %m1861$.Type.type* %.tmp5724, %m1861$.Type.type** %found_field.5709
br label %.for.end.5710
br label %.if.end.5723
.if.false.5723:
%.tmp5725 = load i32, i32* %field_id.5707
%.tmp5726 = add i32 %.tmp5725, 1
store i32 %.tmp5726, i32* %field_id.5707
br label %.if.end.5723
.if.end.5723:
%.tmp5727 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5714
%.tmp5728 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5727, i32 0, i32 4
%.tmp5729 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5728
store %m1861$.Type.type* %.tmp5729, %m1861$.Type.type** %field.5714
br label %.for.start.5710
.for.end.5710:
%.tmp5730 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5709
%.tmp5731 = icmp eq %m1861$.Type.type* %.tmp5730, null
br i1 %.tmp5731, label %.if.true.5732, label %.if.false.5732
.if.true.5732:
%.tmp5733 = getelementptr i8*, i8** %err_msg.5545, i32 0
%.tmp5735 = getelementptr [34 x i8], [34 x i8]*@.str5734, i32 0, i32 0
%.tmp5736 = load i8*, i8** %field_name.5706
%.tmp5737 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5738 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5737, i32 0, i32 1
%.tmp5739 = load i8*, i8** %.tmp5738
%.tmp5740 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5733, i8* %.tmp5735, i8* %.tmp5736, i8* %.tmp5739)
%.tmp5741 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5742 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5743 = load i8*, i8** %err_msg.5545
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5741, %m307$.Node.type* %.tmp5742, i8* %.tmp5743)
%.tmp5744 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5744
br label %.if.end.5732
.if.false.5732:
br label %.if.end.5732
.if.end.5732:
%.tmp5745 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5746 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5745)
%new_info.5747 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5746, %m1861$.AssignableInfo.type** %new_info.5747
%.tmp5748 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5747
%.tmp5749 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5748, i32 0, i32 3
%.tmp5750 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5709
store %m1861$.Type.type* %.tmp5750, %m1861$.Type.type** %.tmp5749
%.tmp5751 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5752 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5747
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5751, %m1861$.AssignableInfo.type* %.tmp5752)
%.tmp5753 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5747
%.tmp5754 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5753, i32 0, i32 2
%.tmp5756 = getelementptr [9 x i8], [9 x i8]*@.str5755, i32 0, i32 0
store i8* %.tmp5756, i8** %.tmp5754
%.tmp5757 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5759 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5758, i32 0, i32 3
%.tmp5760 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5759
%.tmp5761 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5757, %m1861$.Type.type* %.tmp5760)
%info_tr.5762 = alloca i8*
store i8* %.tmp5761, i8** %info_tr.5762
%.tmp5763 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5764 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5763, i32 0, i32 1
%.tmp5765 = load %m0$.File.type*, %m0$.File.type** %.tmp5764
%.tmp5767 = getelementptr [46 x i8], [46 x i8]*@.str5766, i32 0, i32 0
%.tmp5768 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5747
%.tmp5769 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5768)
%.tmp5770 = load i8*, i8** %info_tr.5762
%.tmp5771 = load i8*, i8** %info_tr.5762
%.tmp5772 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5611
%.tmp5773 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5772)
%.tmp5774 = load i32, i32* %field_id.5707
%.tmp5775 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5765, i8* %.tmp5767, i8* %.tmp5769, i8* %.tmp5770, i8* %.tmp5771, i8* %.tmp5773, i32 %.tmp5774)
%.tmp5776 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5777 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5778 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5777, i32 0, i32 7
%.tmp5779 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5778
%.tmp5780 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5779, i32 0, i32 7
%.tmp5781 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5780
%.tmp5782 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5747
%.tmp5783 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5776, %m307$.Node.type* %.tmp5781, %m1861$.AssignableInfo.type* %.tmp5782)
ret %m1861$.AssignableInfo.type* %.tmp5783
br label %.if.end.5609
.if.false.5609:
%.tmp5784 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5785 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5784, i32 0, i32 2
%.tmp5786 = load i8*, i8** %.tmp5785
%.tmp5788 = getelementptr [9 x i8], [9 x i8]*@.str5787, i32 0, i32 0
%.tmp5789 = call i32(i8*,i8*) @strcmp(i8* %.tmp5786, i8* %.tmp5788)
%.tmp5790 = icmp eq i32 %.tmp5789, 0
br i1 %.tmp5790, label %.if.true.5791, label %.if.false.5791
.if.true.5791:
%.tmp5792 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5792
br label %.if.end.5791
.if.false.5791:
br label %.if.end.5791
.if.end.5791:
br label %.if.end.5609
.if.end.5609:
br label %.if.end.5572
.if.end.5572:
%.tmp5793 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5794 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5796 = getelementptr [43 x i8], [43 x i8]*@.str5795, i32 0, i32 0
%.tmp5797 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5793, %m307$.Node.type* %.tmp5794, i8* %.tmp5796)
%.tmp5798 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5799 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5798, i32 0, i32 2
%.tmp5800 = load i8*, i8** %.tmp5799
%.tmp5801 = call i32(i8*,...) @printf(i8* %.tmp5797, i8* %.tmp5800)
%.tmp5802 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5802
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.5803 = alloca i8*
store i8* null, i8** %err_msg.5803
%.tmp5804 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.5805 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5804, %m307$.Node.type** %curr_node.5805
%.tmp5806 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5807 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5806, i32 0, i32 0
%.tmp5808 = load i8*, i8** %.tmp5807
%.tmp5810 = getelementptr [17 x i8], [17 x i8]*@.str5809, i32 0, i32 0
%.tmp5811 = call i32(i8*,i8*) @strcmp(i8* %.tmp5808, i8* %.tmp5810)
%.tmp5812 = icmp eq i32 %.tmp5811, 0
%.tmp5813 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5814 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5813, i32 0, i32 0
%.tmp5815 = load i8*, i8** %.tmp5814
%.tmp5817 = getelementptr [16 x i8], [16 x i8]*@.str5816, i32 0, i32 0
%.tmp5818 = call i32(i8*,i8*) @strcmp(i8* %.tmp5815, i8* %.tmp5817)
%.tmp5819 = icmp eq i32 %.tmp5818, 0
%.tmp5820 = or i1 %.tmp5812, %.tmp5819
%.tmp5821 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5822 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5821, i32 0, i32 0
%.tmp5823 = load i8*, i8** %.tmp5822
%.tmp5825 = getelementptr [11 x i8], [11 x i8]*@.str5824, i32 0, i32 0
%.tmp5826 = call i32(i8*,i8*) @strcmp(i8* %.tmp5823, i8* %.tmp5825)
%.tmp5827 = icmp eq i32 %.tmp5826, 0
%.tmp5828 = or i1 %.tmp5820, %.tmp5827
br i1 %.tmp5828, label %.if.true.5829, label %.if.false.5829
.if.true.5829:
%.tmp5830 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5831 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5832 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5831, i32 0, i32 6
%.tmp5833 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5832
%.tmp5834 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5830, %m307$.Node.type* %.tmp5833)
ret %m1861$.AssignableInfo.type* %.tmp5834
br label %.if.end.5829
.if.false.5829:
br label %.if.end.5829
.if.end.5829:
%.tmp5835 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5836 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5835, i32 0, i32 0
%.tmp5837 = load i8*, i8** %.tmp5836
%.tmp5839 = getelementptr [12 x i8], [12 x i8]*@.str5838, i32 0, i32 0
%.tmp5840 = call i32(i8*,i8*) @strcmp(i8* %.tmp5837, i8* %.tmp5839)
%.tmp5841 = icmp ne i32 %.tmp5840, 0
br i1 %.tmp5841, label %.if.true.5842, label %.if.false.5842
.if.true.5842:
%.tmp5844 = getelementptr [92 x i8], [92 x i8]*@.str5843, i32 0, i32 0
%.tmp5845 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5846 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5845, i32 0, i32 0
%.tmp5847 = load i8*, i8** %.tmp5846
%.tmp5848 = call i32(i8*,...) @printf(i8* %.tmp5844, i8* %.tmp5847)
%.tmp5849 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5850 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5849, i32 0, i32 6
%.tmp5851 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5850
store %m307$.Node.type* %.tmp5851, %m307$.Node.type** %curr_node.5805
br label %.if.end.5842
.if.false.5842:
br label %.if.end.5842
.if.end.5842:
%.tmp5852 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5853 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5852, i32 0, i32 6
%.tmp5854 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5853
%assignable_name.5855 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5854, %m307$.Node.type** %assignable_name.5855
%.tmp5856 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5858 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5857, i32 0, i32 6
%.tmp5859 = load i8*, i8** %.tmp5858
%.tmp5860 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5861 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5860, i32 0, i32 6
%.tmp5862 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5861
%.tmp5863 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5862, i32 0, i32 1
%.tmp5864 = load i8*, i8** %.tmp5863
%.tmp5865 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5856, i8* %.tmp5859, i8* %.tmp5864)
%scope_info.5866 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5865, %m1861$.ScopeItem.type** %scope_info.5866
%.tmp5867 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5866
%.tmp5868 = icmp eq %m1861$.ScopeItem.type* %.tmp5867, null
br i1 %.tmp5868, label %.if.true.5869, label %.if.false.5869
.if.true.5869:
%.tmp5870 = getelementptr i8*, i8** %err_msg.5803, i32 0
%.tmp5872 = getelementptr [41 x i8], [41 x i8]*@.str5871, i32 0, i32 0
%.tmp5873 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5874 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5873, i32 0, i32 6
%.tmp5875 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5874
%.tmp5876 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5875, i32 0, i32 1
%.tmp5877 = load i8*, i8** %.tmp5876
%.tmp5878 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5870, i8* %.tmp5872, i8* %.tmp5877)
%.tmp5879 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5880 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5881 = load i8*, i8** %err_msg.5803
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5879, %m307$.Node.type* %.tmp5880, i8* %.tmp5881)
%.tmp5882 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5882
br label %.if.end.5869
.if.false.5869:
br label %.if.end.5869
.if.end.5869:
%.tmp5883 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5866
%.tmp5884 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5883, i32 0, i32 1
%.tmp5885 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5884
%info.5886 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5885, %m1861$.AssignableInfo.type** %info.5886
%.tmp5887 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5886
%.tmp5888 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5887, i32 0, i32 2
%.tmp5889 = load i8*, i8** %.tmp5888
%.tmp5891 = getelementptr [7 x i8], [7 x i8]*@.str5890, i32 0, i32 0
%.tmp5892 = call i32(i8*,i8*) @strcmp(i8* %.tmp5889, i8* %.tmp5891)
%.tmp5893 = icmp eq i32 %.tmp5892, 0
br i1 %.tmp5893, label %.if.true.5894, label %.if.false.5894
.if.true.5894:
%.tmp5895 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5896 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5886
%.tmp5897 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5896)
%.tmp5898 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5899 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5898, i32 0, i32 6
%.tmp5900 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5899
%.tmp5901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5900, i32 0, i32 7
%.tmp5902 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5901
%.tmp5903 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5902, i32 0, i32 7
%.tmp5904 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5903
%.tmp5905 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5904, i32 0, i32 1
%.tmp5906 = load i8*, i8** %.tmp5905
%.tmp5907 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5895, i8* %.tmp5897, i8* %.tmp5906)
store %m1861$.ScopeItem.type* %.tmp5907, %m1861$.ScopeItem.type** %scope_info.5866
%.tmp5908 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5866
%.tmp5909 = icmp eq %m1861$.ScopeItem.type* %.tmp5908, null
br i1 %.tmp5909, label %.if.true.5910, label %.if.false.5910
.if.true.5910:
%.tmp5911 = getelementptr i8*, i8** %err_msg.5803, i32 0
%.tmp5913 = getelementptr [31 x i8], [31 x i8]*@.str5912, i32 0, i32 0
%.tmp5914 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5914, i32 0, i32 6
%.tmp5916 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5915
%.tmp5917 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5916, i32 0, i32 7
%.tmp5918 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5917
%.tmp5919 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5918, i32 0, i32 7
%.tmp5920 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5919
%.tmp5921 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5920, i32 0, i32 1
%.tmp5922 = load i8*, i8** %.tmp5921
%.tmp5923 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5886
%.tmp5924 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5923)
%.tmp5925 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5911, i8* %.tmp5913, i8* %.tmp5922, i8* %.tmp5924)
%.tmp5926 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5927 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5928 = load i8*, i8** %err_msg.5803
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5926, %m307$.Node.type* %.tmp5927, i8* %.tmp5928)
%.tmp5929 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5929
br label %.if.end.5910
.if.false.5910:
br label %.if.end.5910
.if.end.5910:
%.tmp5930 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5866
%.tmp5931 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5930, i32 0, i32 1
%.tmp5932 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5931
store %m1861$.AssignableInfo.type* %.tmp5932, %m1861$.AssignableInfo.type** %info.5886
%.tmp5933 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5934 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5933, i32 0, i32 6
%.tmp5935 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5934
%.tmp5936 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5935, i32 0, i32 7
%.tmp5937 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5936
%.tmp5938 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5937, i32 0, i32 7
%.tmp5939 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5938
store %m307$.Node.type* %.tmp5939, %m307$.Node.type** %assignable_name.5855
br label %.if.end.5894
.if.false.5894:
%.tmp5940 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5941 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5940, i32 0, i32 6
%.tmp5942 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5941
store %m307$.Node.type* %.tmp5942, %m307$.Node.type** %assignable_name.5855
br label %.if.end.5894
.if.end.5894:
%.tmp5943 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5944 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5855
%.tmp5945 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5886
%.tmp5946 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5943, %m307$.Node.type* %.tmp5944, %m1861$.AssignableInfo.type* %.tmp5945)
%base.5947 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5946, %m1861$.AssignableInfo.type** %base.5947
%.tmp5949 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5950 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5949, i32 0, i32 6
%.tmp5951 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5950
%.tmp5952 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5951, i32 0, i32 7
%.tmp5953 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5952
%addr.5954 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5953, %m307$.Node.type** %addr.5954
br label %.for.start.5948
.for.start.5948:
%.tmp5955 = load %m307$.Node.type*, %m307$.Node.type** %addr.5954
%.tmp5956 = icmp ne %m307$.Node.type* %.tmp5955, null
br i1 %.tmp5956, label %.for.continue.5948, label %.for.end.5948
.for.continue.5948:
%.tmp5957 = load %m307$.Node.type*, %m307$.Node.type** %addr.5954
%.tmp5958 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5957, i32 0, i32 7
%.tmp5959 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5958
%index.5960 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5959, %m307$.Node.type** %index.5960
%.tmp5961 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5962 = load %m307$.Node.type*, %m307$.Node.type** %index.5960
%.tmp5963 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5961, %m307$.Node.type* %.tmp5962)
%index_info.5964 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5963, %m1861$.AssignableInfo.type** %index_info.5964
%.tmp5965 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5966 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5947
%.tmp5967 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5966, i32 0, i32 3
%.tmp5968 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5967
%.tmp5969 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5965, %m1861$.Type.type* %.tmp5968)
%base_type.5970 = alloca i8*
store i8* %.tmp5969, i8** %base_type.5970
%.tmp5971 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5972 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.5964
%.tmp5973 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5972, i32 0, i32 3
%.tmp5974 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5973
%.tmp5975 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5971, %m1861$.Type.type* %.tmp5974)
%index_type.5976 = alloca i8*
store i8* %.tmp5975, i8** %index_type.5976
%.tmp5977 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5978 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5977)
%tmp_id.5979 = alloca i32
store i32 %.tmp5978, i32* %tmp_id.5979
%.tmp5980 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5981 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5980, i32 0, i32 1
%.tmp5982 = load %m0$.File.type*, %m0$.File.type** %.tmp5981
%.tmp5984 = getelementptr [28 x i8], [28 x i8]*@.str5983, i32 0, i32 0
%.tmp5985 = load i32, i32* %tmp_id.5979
%.tmp5986 = load i8*, i8** %base_type.5970
%.tmp5987 = load i8*, i8** %base_type.5970
%.tmp5988 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5947
%.tmp5989 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5988)
%.tmp5990 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5982, i8* %.tmp5984, i32 %.tmp5985, i8* %.tmp5986, i8* %.tmp5987, i8* %.tmp5989)
%.tmp5991 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5805
%.tmp5992 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5991)
%new_base.5993 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5992, %m1861$.AssignableInfo.type** %new_base.5993
%.tmp5994 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5995 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5993
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5994, %m1861$.AssignableInfo.type* %.tmp5995)
%.tmp5996 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5947
%.tmp5997 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5996, i32 0, i32 3
%.tmp5998 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5997
%.tmp5999 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5998, i32 0, i32 3
%.tmp6000 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5999
%.tmp6001 = icmp eq %m1861$.Type.type* %.tmp6000, null
br i1 %.tmp6001, label %.if.true.6002, label %.if.false.6002
.if.true.6002:
%.tmp6003 = getelementptr i8*, i8** %err_msg.5803, i32 0
%.tmp6005 = getelementptr [35 x i8], [35 x i8]*@.str6004, i32 0, i32 0
%.tmp6006 = load i8*, i8** %base_type.5970
%.tmp6007 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6003, i8* %.tmp6005, i8* %.tmp6006)
%.tmp6008 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6009 = load %m307$.Node.type*, %m307$.Node.type** %addr.5954
%.tmp6010 = load i8*, i8** %err_msg.5803
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6008, %m307$.Node.type* %.tmp6009, i8* %.tmp6010)
%.tmp6011 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5947
ret %m1861$.AssignableInfo.type* %.tmp6011
br label %.if.end.6002
.if.false.6002:
br label %.if.end.6002
.if.end.6002:
%.tmp6012 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5993
%.tmp6013 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6012, i32 0, i32 3
%.tmp6014 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5947
%.tmp6015 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6014, i32 0, i32 3
%.tmp6016 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6015
%.tmp6017 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6016, i32 0, i32 3
%.tmp6018 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6017
store %m1861$.Type.type* %.tmp6018, %m1861$.Type.type** %.tmp6013
%.tmp6019 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6020 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5993
%.tmp6021 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6020, i32 0, i32 3
%.tmp6022 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6021
%.tmp6023 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6019, %m1861$.Type.type* %.tmp6022)
%base_type_2.6024 = alloca i8*
store i8* %.tmp6023, i8** %base_type_2.6024
%.tmp6025 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6026 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6025, i32 0, i32 1
%.tmp6027 = load %m0$.File.type*, %m0$.File.type** %.tmp6026
%.tmp6029 = getelementptr [44 x i8], [44 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5993
%.tmp6031 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6030)
%.tmp6032 = load i8*, i8** %base_type_2.6024
%.tmp6033 = load i8*, i8** %base_type_2.6024
%.tmp6034 = load i32, i32* %tmp_id.5979
%.tmp6035 = load i8*, i8** %index_type.5976
%.tmp6036 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.5964
%.tmp6037 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6036)
%.tmp6038 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6027, i8* %.tmp6029, i8* %.tmp6031, i8* %.tmp6032, i8* %.tmp6033, i32 %.tmp6034, i8* %.tmp6035, i8* %.tmp6037)
%.tmp6039 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5993
store %m1861$.AssignableInfo.type* %.tmp6039, %m1861$.AssignableInfo.type** %base.5947
%.tmp6040 = load %m307$.Node.type*, %m307$.Node.type** %addr.5954
%.tmp6041 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6040, i32 0, i32 7
%.tmp6042 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6041
%.tmp6043 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6042, i32 0, i32 7
%.tmp6044 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6043
%.tmp6045 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6044, i32 0, i32 7
%.tmp6046 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6045
store %m307$.Node.type* %.tmp6046, %m307$.Node.type** %addr.5954
br label %.for.start.5948
.for.end.5948:
%.tmp6047 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5947
ret %m1861$.AssignableInfo.type* %.tmp6047
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6048 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6049 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6048, i32 0, i32 6
%.tmp6050 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6049
%.tmp6052 = getelementptr [16 x i8], [16 x i8]*@.str6051, i32 0, i32 0
%.tmp6053 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6050, i8* %.tmp6052)
%assignable_start.6054 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6053, %m307$.Node.type** %assignable_start.6054
%.tmp6055 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6054
%.tmp6056 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6055)
%operator_stack.6057 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6056, %m1988$.SYStack.type** %operator_stack.6057
%.tmp6058 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6059 = ptrtoint %m1861$.StackHead.type* %.tmp6058 to i32
%.tmp6060 = call i8*(i32) @malloc(i32 %.tmp6059)
%.tmp6061 = bitcast i8* %.tmp6060 to %m1861$.StackHead.type*
%stack.6062 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6061, %m1861$.StackHead.type** %stack.6062
%.tmp6063 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6062
%.tmp6064 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6063, i32 0, i32 0
%.tmp6065 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6057
store %m1988$.SYStack.type* %.tmp6065, %m1988$.SYStack.type** %.tmp6064
%.tmp6066 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6067 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6062
%.tmp6068 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6066, %m1861$.StackHead.type* %.tmp6067)
%info.6069 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6068, %m1861$.AssignableInfo.type** %info.6069
%.tmp6070 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
%.tmp6071 = icmp eq %m1861$.AssignableInfo.type* %.tmp6070, null
br i1 %.tmp6071, label %.if.true.6072, label %.if.false.6072
.if.true.6072:
%.tmp6073 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
ret %m1861$.AssignableInfo.type* %.tmp6073
br label %.if.end.6072
.if.false.6072:
br label %.if.end.6072
.if.end.6072:
%.tmp6074 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6075 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6074, i32 0, i32 6
%.tmp6076 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6075
%.tmp6078 = getelementptr [5 x i8], [5 x i8]*@.str6077, i32 0, i32 0
%.tmp6079 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6076, i8* %.tmp6078)
%cast.6080 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6079, %m307$.Node.type** %cast.6080
%.tmp6081 = load %m307$.Node.type*, %m307$.Node.type** %cast.6080
%.tmp6082 = icmp ne %m307$.Node.type* %.tmp6081, null
br i1 %.tmp6082, label %.if.true.6083, label %.if.false.6083
.if.true.6083:
%.tmp6084 = load %m307$.Node.type*, %m307$.Node.type** %cast.6080
%.tmp6085 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6084, i32 0, i32 6
%.tmp6086 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6085
%.tmp6088 = getelementptr [5 x i8], [5 x i8]*@.str6087, i32 0, i32 0
%.tmp6089 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6086, i8* %.tmp6088)
%cast_type.6090 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6089, %m307$.Node.type** %cast_type.6090
%.tmp6091 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6092 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6090
%.tmp6093 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6092, i32 0, i32 6
%.tmp6094 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6093
%.tmp6095 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6091, %m307$.Node.type* %.tmp6094)
%type.6096 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6095, %m1861$.Type.type** %type.6096
%.tmp6097 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
%.tmp6098 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6097)
%prev_id.6099 = alloca i8*
store i8* %.tmp6098, i8** %prev_id.6099
%.tmp6100 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6101 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6100, %m1861$.AssignableInfo.type* %.tmp6101)
%.tmp6102 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6103 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
%.tmp6104 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6103, i32 0, i32 3
%.tmp6105 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6104
%.tmp6106 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6102, %m1861$.Type.type* %.tmp6105)
%from_type.6107 = alloca i8*
store i8* %.tmp6106, i8** %from_type.6107
%.tmp6108 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6109 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6096
%.tmp6110 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6108, %m1861$.Type.type* %.tmp6109)
%to_type.6111 = alloca i8*
store i8* %.tmp6110, i8** %to_type.6111
%.tmp6113 = getelementptr [8 x i8], [8 x i8]*@.str6112, i32 0, i32 0
%cast_fn.6114 = alloca i8*
store i8* %.tmp6113, i8** %cast_fn.6114
%.tmp6115 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
%.tmp6116 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6115, i32 0, i32 3
%.tmp6117 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6116
%.tmp6118 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6117, i32 0, i32 0
%.tmp6119 = load i8*, i8** %.tmp6118
%.tmp6121 = getelementptr [4 x i8], [4 x i8]*@.str6120, i32 0, i32 0
%.tmp6122 = call i32(i8*,i8*) @strcmp(i8* %.tmp6119, i8* %.tmp6121)
%.tmp6123 = icmp ne i32 %.tmp6122, 0
%.tmp6124 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6096
%.tmp6125 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6124, i32 0, i32 0
%.tmp6126 = load i8*, i8** %.tmp6125
%.tmp6128 = getelementptr [4 x i8], [4 x i8]*@.str6127, i32 0, i32 0
%.tmp6129 = call i32(i8*,i8*) @strcmp(i8* %.tmp6126, i8* %.tmp6128)
%.tmp6130 = icmp ne i32 %.tmp6129, 0
%.tmp6131 = and i1 %.tmp6123, %.tmp6130
br i1 %.tmp6131, label %.if.true.6132, label %.if.false.6132
.if.true.6132:
%.tmp6133 = load i8*, i8** %from_type.6107
%.tmp6134 = getelementptr i8, i8* %.tmp6133, i32 0
%.tmp6135 = load i8, i8* %.tmp6134
%.tmp6136 = icmp eq i8 %.tmp6135, 105
%.tmp6137 = load i8*, i8** %to_type.6111
%.tmp6138 = getelementptr i8, i8* %.tmp6137, i32 0
%.tmp6139 = load i8, i8* %.tmp6138
%.tmp6140 = icmp eq i8 %.tmp6139, 105
%.tmp6141 = and i1 %.tmp6136, %.tmp6140
br i1 %.tmp6141, label %.if.true.6142, label %.if.false.6142
.if.true.6142:
%from_size.6143 = alloca i32
store i32 0, i32* %from_size.6143
%to_size.6144 = alloca i32
store i32 0, i32* %to_size.6144
%.tmp6145 = load i8*, i8** %from_type.6107
%.tmp6147 = getelementptr [4 x i8], [4 x i8]*@.str6146, i32 0, i32 0
%.tmp6148 = getelementptr i32, i32* %from_size.6143, i32 0
%.tmp6149 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6145, i8* %.tmp6147, i32* %.tmp6148)
%.tmp6150 = load i8*, i8** %to_type.6111
%.tmp6152 = getelementptr [4 x i8], [4 x i8]*@.str6151, i32 0, i32 0
%.tmp6153 = getelementptr i32, i32* %to_size.6144, i32 0
%.tmp6154 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6150, i8* %.tmp6152, i32* %.tmp6153)
%.tmp6155 = load i32, i32* %from_size.6143
%.tmp6156 = load i32, i32* %to_size.6144
%.tmp6157 = icmp slt i32 %.tmp6155, %.tmp6156
br i1 %.tmp6157, label %.if.true.6158, label %.if.false.6158
.if.true.6158:
%.tmp6160 = getelementptr [5 x i8], [5 x i8]*@.str6159, i32 0, i32 0
store i8* %.tmp6160, i8** %cast_fn.6114
br label %.if.end.6158
.if.false.6158:
%.tmp6162 = getelementptr [6 x i8], [6 x i8]*@.str6161, i32 0, i32 0
store i8* %.tmp6162, i8** %cast_fn.6114
br label %.if.end.6158
.if.end.6158:
br label %.if.end.6142
.if.false.6142:
br label %.if.end.6142
.if.end.6142:
br label %.if.end.6132
.if.false.6132:
br label %.if.end.6132
.if.end.6132:
%.tmp6163 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6164 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6163, i32 0, i32 1
%.tmp6165 = load %m0$.File.type*, %m0$.File.type** %.tmp6164
%.tmp6167 = getelementptr [21 x i8], [21 x i8]*@.str6166, i32 0, i32 0
%.tmp6168 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
%.tmp6169 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6168)
%.tmp6170 = load i8*, i8** %cast_fn.6114
%.tmp6171 = load i8*, i8** %from_type.6107
%.tmp6172 = load i8*, i8** %prev_id.6099
%.tmp6173 = load i8*, i8** %to_type.6111
%.tmp6174 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6165, i8* %.tmp6167, i8* %.tmp6169, i8* %.tmp6170, i8* %.tmp6171, i8* %.tmp6172, i8* %.tmp6173)
%.tmp6175 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
%.tmp6176 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6175, i32 0, i32 3
%.tmp6177 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6096
store %m1861$.Type.type* %.tmp6177, %m1861$.Type.type** %.tmp6176
br label %.if.end.6083
.if.false.6083:
br label %.if.end.6083
.if.end.6083:
%.tmp6178 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6069
ret %m1861$.AssignableInfo.type* %.tmp6178
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6179 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6180 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6179, i32 0, i32 0
%.tmp6181 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6180
%.tmp6182 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6181, i32 0, i32 0
%.tmp6183 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6182
%.tmp6184 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6183, i32 0, i32 0
%.tmp6185 = load i8*, i8** %.tmp6184
%.tmp6187 = getelementptr [16 x i8], [16 x i8]*@.str6186, i32 0, i32 0
%.tmp6188 = call i32(i8*,i8*) @strcmp(i8* %.tmp6185, i8* %.tmp6187)
%.tmp6189 = icmp eq i32 %.tmp6188, 0
br i1 %.tmp6189, label %.if.true.6190, label %.if.false.6190
.if.true.6190:
%.tmp6191 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6192 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6193 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6192, i32 0, i32 0
%.tmp6194 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6193
%.tmp6195 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6194, i32 0, i32 0
%.tmp6196 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6195
%.tmp6197 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6191, %m307$.Node.type* %.tmp6196)
ret %m1861$.AssignableInfo.type* %.tmp6197
br label %.if.end.6190
.if.false.6190:
br label %.if.end.6190
.if.end.6190:
%.tmp6198 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6199 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6198, i32 0, i32 0
%.tmp6200 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6199
%.tmp6201 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6200, i32 0, i32 0
%.tmp6202 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6201
%.tmp6203 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6202, i32 0, i32 6
%.tmp6204 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6203
%operator.6205 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6204, %m307$.Node.type** %operator.6205
%.tmp6206 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6207 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6206, i32 0, i32 0
%.tmp6208 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6209 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6208, i32 0, i32 0
%.tmp6210 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6209
%.tmp6211 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6210, i32 0, i32 1
%.tmp6212 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6211
store %m1988$.SYStack.type* %.tmp6212, %m1988$.SYStack.type** %.tmp6207
%.tmp6213 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6214 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6215 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6213, %m1861$.StackHead.type* %.tmp6214)
%A.6216 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6215, %m1861$.AssignableInfo.type** %A.6216
%.tmp6217 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6216
%.tmp6218 = icmp eq %m1861$.AssignableInfo.type* %.tmp6217, null
br i1 %.tmp6218, label %.if.true.6219, label %.if.false.6219
.if.true.6219:
%.tmp6220 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6216
ret %m1861$.AssignableInfo.type* %.tmp6220
br label %.if.end.6219
.if.false.6219:
br label %.if.end.6219
.if.end.6219:
%.tmp6221 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6222 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6221, i32 0, i32 0
%.tmp6223 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6224 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6223, i32 0, i32 0
%.tmp6225 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6224
%.tmp6226 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6225, i32 0, i32 1
%.tmp6227 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6226
store %m1988$.SYStack.type* %.tmp6227, %m1988$.SYStack.type** %.tmp6222
%.tmp6228 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6229 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6230 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6228, %m1861$.StackHead.type* %.tmp6229)
%B.6231 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6230, %m1861$.AssignableInfo.type** %B.6231
%.tmp6232 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6231
%.tmp6233 = icmp eq %m1861$.AssignableInfo.type* %.tmp6232, null
br i1 %.tmp6233, label %.if.true.6234, label %.if.false.6234
.if.true.6234:
%.tmp6235 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6231
ret %m1861$.AssignableInfo.type* %.tmp6235
br label %.if.end.6234
.if.false.6234:
br label %.if.end.6234
.if.end.6234:
%.tmp6236 = bitcast ptr null to %m307$.Node.type*
%.tmp6237 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6236)
%op_info.6238 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6237, %m1861$.AssignableInfo.type** %op_info.6238
%.tmp6239 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6238
%.tmp6240 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6239, i32 0, i32 3
%.tmp6241 = load %m307$.Node.type*, %m307$.Node.type** %operator.6205
%.tmp6242 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6241)
store %m1861$.Type.type* %.tmp6242, %m1861$.Type.type** %.tmp6240
%.tmp6243 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6244 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6238
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6243, %m1861$.AssignableInfo.type* %.tmp6244)
%.tmp6245 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6246 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6245, i32 0, i32 1
%.tmp6247 = load %m0$.File.type*, %m0$.File.type** %.tmp6246
%.tmp6249 = getelementptr [19 x i8], [19 x i8]*@.str6248, i32 0, i32 0
%.tmp6250 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6238
%.tmp6251 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6250)
%.tmp6252 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6253 = load %m307$.Node.type*, %m307$.Node.type** %operator.6205
%.tmp6254 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6252, %m307$.Node.type* %.tmp6253)
%.tmp6255 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6256 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6216
%.tmp6257 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6256, i32 0, i32 3
%.tmp6258 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6257
%.tmp6259 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6255, %m1861$.Type.type* %.tmp6258)
%.tmp6260 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6216
%.tmp6261 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6260)
%.tmp6262 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6231
%.tmp6263 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6262)
%.tmp6264 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6247, i8* %.tmp6249, i8* %.tmp6251, i8* %.tmp6254, i8* %.tmp6259, i8* %.tmp6261, i8* %.tmp6263)
%.tmp6265 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6238
ret %m1861$.AssignableInfo.type* %.tmp6265
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6266 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6267 = icmp eq %m307$.Node.type* %.tmp6266, null
br i1 %.tmp6267, label %.if.true.6268, label %.if.false.6268
.if.true.6268:
%.tmp6269 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6270 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6272 = getelementptr [31 x i8], [31 x i8]*@.str6271, i32 0, i32 0
%.tmp6273 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6269, %m307$.Node.type* %.tmp6270, i8* %.tmp6272)
%.tmp6274 = call i32(i8*,...) @printf(i8* %.tmp6273)
br label %.if.end.6268
.if.false.6268:
br label %.if.end.6268
.if.end.6268:
%.tmp6275 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6276 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6275, i32 0, i32 1
%.tmp6277 = load i8*, i8** %.tmp6276
%.tmp6279 = getelementptr [2 x i8], [2 x i8]*@.str6278, i32 0, i32 0
%.tmp6280 = call i32(i8*,i8*) @strcmp(i8* %.tmp6277, i8* %.tmp6279)
%.tmp6281 = icmp eq i32 %.tmp6280, 0
br i1 %.tmp6281, label %.if.true.6282, label %.if.false.6282
.if.true.6282:
%.tmp6284 = getelementptr [4 x i8], [4 x i8]*@.str6283, i32 0, i32 0
ret i8* %.tmp6284
br label %.if.end.6282
.if.false.6282:
%.tmp6285 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6286 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6285, i32 0, i32 1
%.tmp6287 = load i8*, i8** %.tmp6286
%.tmp6289 = getelementptr [2 x i8], [2 x i8]*@.str6288, i32 0, i32 0
%.tmp6290 = call i32(i8*,i8*) @strcmp(i8* %.tmp6287, i8* %.tmp6289)
%.tmp6291 = icmp eq i32 %.tmp6290, 0
br i1 %.tmp6291, label %.if.true.6292, label %.if.false.6292
.if.true.6292:
%.tmp6294 = getelementptr [4 x i8], [4 x i8]*@.str6293, i32 0, i32 0
ret i8* %.tmp6294
br label %.if.end.6292
.if.false.6292:
%.tmp6295 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6296 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6295, i32 0, i32 1
%.tmp6297 = load i8*, i8** %.tmp6296
%.tmp6299 = getelementptr [2 x i8], [2 x i8]*@.str6298, i32 0, i32 0
%.tmp6300 = call i32(i8*,i8*) @strcmp(i8* %.tmp6297, i8* %.tmp6299)
%.tmp6301 = icmp eq i32 %.tmp6300, 0
br i1 %.tmp6301, label %.if.true.6302, label %.if.false.6302
.if.true.6302:
%.tmp6304 = getelementptr [4 x i8], [4 x i8]*@.str6303, i32 0, i32 0
ret i8* %.tmp6304
br label %.if.end.6302
.if.false.6302:
%.tmp6305 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6305, i32 0, i32 1
%.tmp6307 = load i8*, i8** %.tmp6306
%.tmp6309 = getelementptr [2 x i8], [2 x i8]*@.str6308, i32 0, i32 0
%.tmp6310 = call i32(i8*,i8*) @strcmp(i8* %.tmp6307, i8* %.tmp6309)
%.tmp6311 = icmp eq i32 %.tmp6310, 0
br i1 %.tmp6311, label %.if.true.6312, label %.if.false.6312
.if.true.6312:
%.tmp6314 = getelementptr [5 x i8], [5 x i8]*@.str6313, i32 0, i32 0
ret i8* %.tmp6314
br label %.if.end.6312
.if.false.6312:
%.tmp6315 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6316 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6315, i32 0, i32 1
%.tmp6317 = load i8*, i8** %.tmp6316
%.tmp6319 = getelementptr [3 x i8], [3 x i8]*@.str6318, i32 0, i32 0
%.tmp6320 = call i32(i8*,i8*) @strcmp(i8* %.tmp6317, i8* %.tmp6319)
%.tmp6321 = icmp eq i32 %.tmp6320, 0
br i1 %.tmp6321, label %.if.true.6322, label %.if.false.6322
.if.true.6322:
%.tmp6324 = getelementptr [8 x i8], [8 x i8]*@.str6323, i32 0, i32 0
ret i8* %.tmp6324
br label %.if.end.6322
.if.false.6322:
%.tmp6325 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6325, i32 0, i32 1
%.tmp6327 = load i8*, i8** %.tmp6326
%.tmp6329 = getelementptr [3 x i8], [3 x i8]*@.str6328, i32 0, i32 0
%.tmp6330 = call i32(i8*,i8*) @strcmp(i8* %.tmp6327, i8* %.tmp6329)
%.tmp6331 = icmp eq i32 %.tmp6330, 0
br i1 %.tmp6331, label %.if.true.6332, label %.if.false.6332
.if.true.6332:
%.tmp6334 = getelementptr [8 x i8], [8 x i8]*@.str6333, i32 0, i32 0
ret i8* %.tmp6334
br label %.if.end.6332
.if.false.6332:
%.tmp6335 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6336 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6335, i32 0, i32 1
%.tmp6337 = load i8*, i8** %.tmp6336
%.tmp6339 = getelementptr [2 x i8], [2 x i8]*@.str6338, i32 0, i32 0
%.tmp6340 = call i32(i8*,i8*) @strcmp(i8* %.tmp6337, i8* %.tmp6339)
%.tmp6341 = icmp eq i32 %.tmp6340, 0
br i1 %.tmp6341, label %.if.true.6342, label %.if.false.6342
.if.true.6342:
%.tmp6344 = getelementptr [9 x i8], [9 x i8]*@.str6343, i32 0, i32 0
ret i8* %.tmp6344
br label %.if.end.6342
.if.false.6342:
%.tmp6345 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6346 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6345, i32 0, i32 1
%.tmp6347 = load i8*, i8** %.tmp6346
%.tmp6349 = getelementptr [2 x i8], [2 x i8]*@.str6348, i32 0, i32 0
%.tmp6350 = call i32(i8*,i8*) @strcmp(i8* %.tmp6347, i8* %.tmp6349)
%.tmp6351 = icmp eq i32 %.tmp6350, 0
br i1 %.tmp6351, label %.if.true.6352, label %.if.false.6352
.if.true.6352:
%.tmp6354 = getelementptr [9 x i8], [9 x i8]*@.str6353, i32 0, i32 0
ret i8* %.tmp6354
br label %.if.end.6352
.if.false.6352:
%.tmp6355 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6356 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6355, i32 0, i32 1
%.tmp6357 = load i8*, i8** %.tmp6356
%.tmp6359 = getelementptr [2 x i8], [2 x i8]*@.str6358, i32 0, i32 0
%.tmp6360 = call i32(i8*,i8*) @strcmp(i8* %.tmp6357, i8* %.tmp6359)
%.tmp6361 = icmp eq i32 %.tmp6360, 0
br i1 %.tmp6361, label %.if.true.6362, label %.if.false.6362
.if.true.6362:
%.tmp6364 = getelementptr [4 x i8], [4 x i8]*@.str6363, i32 0, i32 0
ret i8* %.tmp6364
br label %.if.end.6362
.if.false.6362:
%.tmp6365 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6366 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6365, i32 0, i32 1
%.tmp6367 = load i8*, i8** %.tmp6366
%.tmp6369 = getelementptr [2 x i8], [2 x i8]*@.str6368, i32 0, i32 0
%.tmp6370 = call i32(i8*,i8*) @strcmp(i8* %.tmp6367, i8* %.tmp6369)
%.tmp6371 = icmp eq i32 %.tmp6370, 0
br i1 %.tmp6371, label %.if.true.6372, label %.if.false.6372
.if.true.6372:
%.tmp6374 = getelementptr [3 x i8], [3 x i8]*@.str6373, i32 0, i32 0
ret i8* %.tmp6374
br label %.if.end.6372
.if.false.6372:
%.tmp6375 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6376 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6375, i32 0, i32 1
%.tmp6377 = load i8*, i8** %.tmp6376
%.tmp6379 = getelementptr [3 x i8], [3 x i8]*@.str6378, i32 0, i32 0
%.tmp6380 = call i32(i8*,i8*) @strcmp(i8* %.tmp6377, i8* %.tmp6379)
%.tmp6381 = icmp eq i32 %.tmp6380, 0
br i1 %.tmp6381, label %.if.true.6382, label %.if.false.6382
.if.true.6382:
%.tmp6384 = getelementptr [9 x i8], [9 x i8]*@.str6383, i32 0, i32 0
ret i8* %.tmp6384
br label %.if.end.6382
.if.false.6382:
%.tmp6385 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6386 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6385, i32 0, i32 1
%.tmp6387 = load i8*, i8** %.tmp6386
%.tmp6389 = getelementptr [3 x i8], [3 x i8]*@.str6388, i32 0, i32 0
%.tmp6390 = call i32(i8*,i8*) @strcmp(i8* %.tmp6387, i8* %.tmp6389)
%.tmp6391 = icmp eq i32 %.tmp6390, 0
br i1 %.tmp6391, label %.if.true.6392, label %.if.false.6392
.if.true.6392:
%.tmp6394 = getelementptr [9 x i8], [9 x i8]*@.str6393, i32 0, i32 0
ret i8* %.tmp6394
br label %.if.end.6392
.if.false.6392:
%.tmp6395 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6396 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6398 = getelementptr [30 x i8], [30 x i8]*@.str6397, i32 0, i32 0
%.tmp6399 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6395, %m307$.Node.type* %.tmp6396, i8* %.tmp6398)
%.tmp6400 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6401 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6400, i32 0, i32 1
%.tmp6402 = load i8*, i8** %.tmp6401
%.tmp6403 = call i32(i8*,...) @printf(i8* %.tmp6399, i8* %.tmp6402)
br label %.if.end.6392
.if.end.6392:
br label %.if.end.6382
.if.end.6382:
br label %.if.end.6372
.if.end.6372:
br label %.if.end.6362
.if.end.6362:
br label %.if.end.6352
.if.end.6352:
br label %.if.end.6342
.if.end.6342:
br label %.if.end.6332
.if.end.6332:
br label %.if.end.6322
.if.end.6322:
br label %.if.end.6312
.if.end.6312:
br label %.if.end.6302
.if.end.6302:
br label %.if.end.6292
.if.end.6292:
br label %.if.end.6282
.if.end.6282:
%.tmp6405 = getelementptr [4 x i8], [4 x i8]*@.str6404, i32 0, i32 0
ret i8* %.tmp6405
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6406 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6407 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6406, %m1861$.Type.type** %type.6407
%.tmp6408 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6409 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6408, i32 0, i32 1
%.tmp6410 = load i8*, i8** %.tmp6409
%.tmp6412 = getelementptr [3 x i8], [3 x i8]*@.str6411, i32 0, i32 0
%.tmp6413 = call i32(i8*,i8*) @strcmp(i8* %.tmp6410, i8* %.tmp6412)
%.tmp6414 = icmp eq i32 %.tmp6413, 0
%.tmp6415 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6416 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6415, i32 0, i32 1
%.tmp6417 = load i8*, i8** %.tmp6416
%.tmp6419 = getelementptr [3 x i8], [3 x i8]*@.str6418, i32 0, i32 0
%.tmp6420 = call i32(i8*,i8*) @strcmp(i8* %.tmp6417, i8* %.tmp6419)
%.tmp6421 = icmp eq i32 %.tmp6420, 0
%.tmp6422 = or i1 %.tmp6414, %.tmp6421
%.tmp6423 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6424 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6423, i32 0, i32 1
%.tmp6425 = load i8*, i8** %.tmp6424
%.tmp6427 = getelementptr [2 x i8], [2 x i8]*@.str6426, i32 0, i32 0
%.tmp6428 = call i32(i8*,i8*) @strcmp(i8* %.tmp6425, i8* %.tmp6427)
%.tmp6429 = icmp eq i32 %.tmp6428, 0
%.tmp6430 = or i1 %.tmp6422, %.tmp6429
%.tmp6431 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6432 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6431, i32 0, i32 1
%.tmp6433 = load i8*, i8** %.tmp6432
%.tmp6435 = getelementptr [2 x i8], [2 x i8]*@.str6434, i32 0, i32 0
%.tmp6436 = call i32(i8*,i8*) @strcmp(i8* %.tmp6433, i8* %.tmp6435)
%.tmp6437 = icmp eq i32 %.tmp6436, 0
%.tmp6438 = or i1 %.tmp6430, %.tmp6437
%.tmp6439 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6440 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6439, i32 0, i32 1
%.tmp6441 = load i8*, i8** %.tmp6440
%.tmp6443 = getelementptr [2 x i8], [2 x i8]*@.str6442, i32 0, i32 0
%.tmp6444 = call i32(i8*,i8*) @strcmp(i8* %.tmp6441, i8* %.tmp6443)
%.tmp6445 = icmp eq i32 %.tmp6444, 0
%.tmp6446 = or i1 %.tmp6438, %.tmp6445
%.tmp6447 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6448 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6447, i32 0, i32 1
%.tmp6449 = load i8*, i8** %.tmp6448
%.tmp6451 = getelementptr [2 x i8], [2 x i8]*@.str6450, i32 0, i32 0
%.tmp6452 = call i32(i8*,i8*) @strcmp(i8* %.tmp6449, i8* %.tmp6451)
%.tmp6453 = icmp eq i32 %.tmp6452, 0
%.tmp6454 = or i1 %.tmp6446, %.tmp6453
%.tmp6455 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6456 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6455, i32 0, i32 1
%.tmp6457 = load i8*, i8** %.tmp6456
%.tmp6459 = getelementptr [3 x i8], [3 x i8]*@.str6458, i32 0, i32 0
%.tmp6460 = call i32(i8*,i8*) @strcmp(i8* %.tmp6457, i8* %.tmp6459)
%.tmp6461 = icmp eq i32 %.tmp6460, 0
%.tmp6462 = or i1 %.tmp6454, %.tmp6461
%.tmp6463 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6464 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6463, i32 0, i32 1
%.tmp6465 = load i8*, i8** %.tmp6464
%.tmp6467 = getelementptr [3 x i8], [3 x i8]*@.str6466, i32 0, i32 0
%.tmp6468 = call i32(i8*,i8*) @strcmp(i8* %.tmp6465, i8* %.tmp6467)
%.tmp6469 = icmp eq i32 %.tmp6468, 0
%.tmp6470 = or i1 %.tmp6462, %.tmp6469
br i1 %.tmp6470, label %.if.true.6471, label %.if.false.6471
.if.true.6471:
%.tmp6472 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6407
%.tmp6473 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6472, i32 0, i32 0
%.tmp6475 = getelementptr [5 x i8], [5 x i8]*@.str6474, i32 0, i32 0
store i8* %.tmp6475, i8** %.tmp6473
br label %.if.end.6471
.if.false.6471:
%.tmp6476 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6407
%.tmp6477 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6476, i32 0, i32 0
%.tmp6479 = getelementptr [4 x i8], [4 x i8]*@.str6478, i32 0, i32 0
store i8* %.tmp6479, i8** %.tmp6477
br label %.if.end.6471
.if.end.6471:
%.tmp6480 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6407
ret %m1861$.Type.type* %.tmp6480
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6481 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6482 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6481, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6483 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6484 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6483, %m307$.Node.type** %mono.6484
%err_buf.6485 = alloca i8*
store i8* null, i8** %err_buf.6485
%buf.6486 = alloca i8*
store i8* null, i8** %buf.6486
%.tmp6487 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6488 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6487, i32 0, i32 6
%.tmp6489 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6488
%.tmp6490 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6489, i32 0, i32 0
%.tmp6491 = load i8*, i8** %.tmp6490
%.tmp6493 = getelementptr [7 x i8], [7 x i8]*@.str6492, i32 0, i32 0
%.tmp6494 = call i32(i8*,i8*) @strcmp(i8* %.tmp6491, i8* %.tmp6493)
%.tmp6495 = icmp eq i32 %.tmp6494, 0
br i1 %.tmp6495, label %.if.true.6496, label %.if.false.6496
.if.true.6496:
%.tmp6497 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6498 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6497)
store %m1861$.AssignableInfo.type* %.tmp6498, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6499 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6500 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6499, i32 0, i32 3
%.tmp6501 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6501, %m1861$.Type.type** %.tmp6500
%.tmp6502 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6503 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6502, i32 0, i32 3
%.tmp6504 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6503
%.tmp6505 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6504, i32 0, i32 0
%.tmp6507 = getelementptr [4 x i8], [4 x i8]*@.str6506, i32 0, i32 0
store i8* %.tmp6507, i8** %.tmp6505
%.tmp6508 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6509 = load i8, i8* @SCOPE_CONST
%.tmp6510 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6511 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6510, i32 0, i32 6
%.tmp6512 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6511
%.tmp6513 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6512, i32 0, i32 1
%.tmp6514 = load i8*, i8** %.tmp6513
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6508, i8 %.tmp6509, i8* %.tmp6514)
br label %.if.end.6496
.if.false.6496:
%.tmp6515 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6516 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6515, i32 0, i32 6
%.tmp6517 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6516
%.tmp6518 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6517, i32 0, i32 0
%.tmp6519 = load i8*, i8** %.tmp6518
%.tmp6521 = getelementptr [5 x i8], [5 x i8]*@.str6520, i32 0, i32 0
%.tmp6522 = call i32(i8*,i8*) @strcmp(i8* %.tmp6519, i8* %.tmp6521)
%.tmp6523 = icmp eq i32 %.tmp6522, 0
br i1 %.tmp6523, label %.if.true.6524, label %.if.false.6524
.if.true.6524:
%.tmp6525 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6526 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6525, i32 0, i32 6
%.tmp6527 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6526
%.tmp6528 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6527, i32 0, i32 1
%.tmp6529 = load i8*, i8** %.tmp6528
%.tmp6531 = getelementptr [5 x i8], [5 x i8]*@.str6530, i32 0, i32 0
%.tmp6532 = call i32(i8*,i8*) @strcmp(i8* %.tmp6529, i8* %.tmp6531)
%.tmp6533 = icmp ne i32 %.tmp6532, 0
br i1 %.tmp6533, label %.if.true.6534, label %.if.false.6534
.if.true.6534:
%.tmp6535 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6536 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6538 = getelementptr [42 x i8], [42 x i8]*@.str6537, i32 0, i32 0
%.tmp6539 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6535, %m307$.Node.type* %.tmp6536, i8* %.tmp6538)
%.tmp6540 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6541 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6540, i32 0, i32 6
%.tmp6542 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6541
%.tmp6543 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6542, i32 0, i32 1
%.tmp6544 = load i8*, i8** %.tmp6543
%.tmp6545 = call i32(i8*,...) @printf(i8* %.tmp6539, i8* %.tmp6544)
%.tmp6546 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6546
br label %.if.end.6534
.if.false.6534:
br label %.if.end.6534
.if.end.6534:
%.tmp6547 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6548 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6547)
store %m1861$.AssignableInfo.type* %.tmp6548, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6549 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6550 = load i8, i8* @SCOPE_CONST
%.tmp6552 = getelementptr [5 x i8], [5 x i8]*@.str6551, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6549, i8 %.tmp6550, i8* %.tmp6552)
%.tmp6553 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6554 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6553, i32 0, i32 3
%.tmp6555 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6555, %m1861$.Type.type** %.tmp6554
%.tmp6556 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6557 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6556, i32 0, i32 3
%.tmp6558 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6557
%.tmp6559 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6558, i32 0, i32 0
%.tmp6561 = getelementptr [8 x i8], [8 x i8]*@.str6560, i32 0, i32 0
store i8* %.tmp6561, i8** %.tmp6559
br label %.if.end.6524
.if.false.6524:
%.tmp6562 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6563 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6562, i32 0, i32 6
%.tmp6564 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6563
%.tmp6565 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6564, i32 0, i32 0
%.tmp6566 = load i8*, i8** %.tmp6565
%.tmp6568 = getelementptr [17 x i8], [17 x i8]*@.str6567, i32 0, i32 0
%.tmp6569 = call i32(i8*,i8*) @strcmp(i8* %.tmp6566, i8* %.tmp6568)
%.tmp6570 = icmp eq i32 %.tmp6569, 0
br i1 %.tmp6570, label %.if.true.6571, label %.if.false.6571
.if.true.6571:
%.tmp6572 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6573 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6572)
store %m1861$.AssignableInfo.type* %.tmp6573, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6574 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6575 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6574, i32 0, i32 6
%.tmp6576 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6575
%.tmp6577 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6576, i32 0, i32 6
%.tmp6578 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6577
%.tmp6580 = getelementptr [12 x i8], [12 x i8]*@.str6579, i32 0, i32 0
%.tmp6581 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6578, i8* %.tmp6580)
%dest.6582 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6581, %m307$.Node.type** %dest.6582
%.tmp6583 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6584 = load %m307$.Node.type*, %m307$.Node.type** %dest.6582
%.tmp6585 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6583, %m307$.Node.type* %.tmp6584)
%var_info.6586 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6585, %m1861$.AssignableInfo.type** %var_info.6586
%.tmp6587 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6586
%.tmp6588 = icmp eq %m1861$.AssignableInfo.type* %.tmp6587, null
br i1 %.tmp6588, label %.if.true.6589, label %.if.false.6589
.if.true.6589:
%.tmp6590 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
ret %m1861$.AssignableInfo.type* %.tmp6590
br label %.if.end.6589
.if.false.6589:
br label %.if.end.6589
.if.end.6589:
%.tmp6591 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6592 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6586
%.tmp6593 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6592, i32 0, i32 3
%.tmp6594 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6593
%.tmp6595 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6591, %m1861$.Type.type* %.tmp6594)
%var_type_repr.6596 = alloca i8*
store i8* %.tmp6595, i8** %var_type_repr.6596
%.tmp6597 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6598 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6597, %m1861$.AssignableInfo.type* %.tmp6598)
%.tmp6599 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6600 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6599, i32 0, i32 3
%.tmp6601 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6586
%.tmp6602 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6601, i32 0, i32 3
%.tmp6603 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6602
store %m1861$.Type.type* %.tmp6603, %m1861$.Type.type** %.tmp6600
%.tmp6605 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6606 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6605, i32 0, i32 6
%.tmp6607 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6606
%.tmp6608 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6607, i32 0, i32 6
%.tmp6609 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6608
%ptr.6610 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6609, %m307$.Node.type** %ptr.6610
br label %.for.start.6604
.for.start.6604:
%.tmp6611 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6610
%.tmp6612 = load %m307$.Node.type*, %m307$.Node.type** %dest.6582
%.tmp6613 = icmp ne %m307$.Node.type* %.tmp6611, %.tmp6612
br i1 %.tmp6613, label %.for.continue.6604, label %.for.end.6604
.for.continue.6604:
%.tmp6614 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6615 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6614, %m1861$.Type.type** %type.6615
%.tmp6616 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6615
%.tmp6617 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6616, i32 0, i32 3
%.tmp6618 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6619 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6618, i32 0, i32 3
%.tmp6620 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6619
store %m1861$.Type.type* %.tmp6620, %m1861$.Type.type** %.tmp6617
%.tmp6621 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6615
%.tmp6622 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6621, i32 0, i32 0
%.tmp6624 = getelementptr [4 x i8], [4 x i8]*@.str6623, i32 0, i32 0
store i8* %.tmp6624, i8** %.tmp6622
%.tmp6625 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6626 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6625, i32 0, i32 3
%.tmp6627 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6615
store %m1861$.Type.type* %.tmp6627, %m1861$.Type.type** %.tmp6626
%.tmp6628 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6610
%.tmp6629 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6628, i32 0, i32 7
%.tmp6630 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6629
store %m307$.Node.type* %.tmp6630, %m307$.Node.type** %ptr.6610
br label %.for.start.6604
.for.end.6604:
%.tmp6631 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6632 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6631, i32 0, i32 6
%.tmp6633 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6632
%.tmp6634 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6633, i32 0, i32 6
%.tmp6635 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6634
%.tmp6636 = load %m307$.Node.type*, %m307$.Node.type** %dest.6582
%.tmp6637 = icmp ne %m307$.Node.type* %.tmp6635, %.tmp6636
br i1 %.tmp6637, label %.if.true.6638, label %.if.false.6638
.if.true.6638:
%.tmp6639 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6640 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6639, i32 0, i32 1
%.tmp6641 = load %m0$.File.type*, %m0$.File.type** %.tmp6640
%.tmp6643 = getelementptr [38 x i8], [38 x i8]*@.str6642, i32 0, i32 0
%.tmp6644 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6645 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6644)
%.tmp6646 = load i8*, i8** %var_type_repr.6596
%.tmp6647 = load i8*, i8** %var_type_repr.6596
%.tmp6648 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6586
%.tmp6649 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6648)
%.tmp6650 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6641, i8* %.tmp6643, i8* %.tmp6645, i8* %.tmp6646, i8* %.tmp6647, i8* %.tmp6649)
br label %.if.end.6638
.if.false.6638:
%.tmp6651 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6652 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6651, i32 0, i32 1
%.tmp6653 = load %m0$.File.type*, %m0$.File.type** %.tmp6652
%.tmp6655 = getelementptr [22 x i8], [22 x i8]*@.str6654, i32 0, i32 0
%.tmp6656 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6657 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6656)
%.tmp6658 = load i8*, i8** %var_type_repr.6596
%.tmp6659 = load i8*, i8** %var_type_repr.6596
%.tmp6660 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6586
%.tmp6661 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6660)
%.tmp6662 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6653, i8* %.tmp6655, i8* %.tmp6657, i8* %.tmp6658, i8* %.tmp6659, i8* %.tmp6661)
br label %.if.end.6638
.if.end.6638:
br label %.if.end.6571
.if.false.6571:
%.tmp6663 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6664 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6663, i32 0, i32 6
%.tmp6665 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6664
%.tmp6666 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6665, i32 0, i32 0
%.tmp6667 = load i8*, i8** %.tmp6666
%.tmp6669 = getelementptr [8 x i8], [8 x i8]*@.str6668, i32 0, i32 0
%.tmp6670 = call i32(i8*,i8*) @strcmp(i8* %.tmp6667, i8* %.tmp6669)
%.tmp6671 = icmp eq i32 %.tmp6670, 0
br i1 %.tmp6671, label %.if.true.6672, label %.if.false.6672
.if.true.6672:
%.tmp6673 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6674 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6673)
store %m1861$.AssignableInfo.type* %.tmp6674, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6675 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6676 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6675, i32 0, i32 3
%.tmp6677 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6677, %m1861$.Type.type** %.tmp6676
%.tmp6678 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6679 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6678, i32 0, i32 3
%.tmp6680 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6679
%.tmp6681 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6680, i32 0, i32 0
%.tmp6683 = getelementptr [5 x i8], [5 x i8]*@.str6682, i32 0, i32 0
store i8* %.tmp6683, i8** %.tmp6681
%.tmp6684 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6685 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6684, i32 0, i32 6
%.tmp6686 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6685
%.tmp6687 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6686, i32 0, i32 6
%.tmp6688 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6687
%.tmp6689 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6688, i32 0, i32 1
%.tmp6690 = load i8*, i8** %.tmp6689
%.tmp6692 = getelementptr [6 x i8], [6 x i8]*@.str6691, i32 0, i32 0
%.tmp6693 = call i32(i8*,i8*) @strcmp(i8* %.tmp6690, i8* %.tmp6692)
%.tmp6694 = icmp eq i32 %.tmp6693, 0
br i1 %.tmp6694, label %.if.true.6695, label %.if.false.6695
.if.true.6695:
%.tmp6696 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6697 = load i8, i8* @SCOPE_CONST
%.tmp6699 = getelementptr [2 x i8], [2 x i8]*@.str6698, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6696, i8 %.tmp6697, i8* %.tmp6699)
br label %.if.end.6695
.if.false.6695:
%.tmp6700 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6701 = load i8, i8* @SCOPE_CONST
%.tmp6703 = getelementptr [2 x i8], [2 x i8]*@.str6702, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6700, i8 %.tmp6701, i8* %.tmp6703)
br label %.if.end.6695
.if.end.6695:
br label %.if.end.6672
.if.false.6672:
%.tmp6704 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6705 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6704, i32 0, i32 6
%.tmp6706 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6705
%.tmp6707 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6706, i32 0, i32 0
%.tmp6708 = load i8*, i8** %.tmp6707
%.tmp6710 = getelementptr [8 x i8], [8 x i8]*@.str6709, i32 0, i32 0
%.tmp6711 = call i32(i8*,i8*) @strcmp(i8* %.tmp6708, i8* %.tmp6710)
%.tmp6712 = icmp eq i32 %.tmp6711, 0
br i1 %.tmp6712, label %.if.true.6713, label %.if.false.6713
.if.true.6713:
%.tmp6714 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6715 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6716 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6715, i32 0, i32 6
%.tmp6717 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6716
%.tmp6718 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6717, i32 0, i32 6
%.tmp6719 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6718
%.tmp6720 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6714, %m307$.Node.type* %.tmp6719)
store %m1861$.AssignableInfo.type* %.tmp6720, %m1861$.AssignableInfo.type** %assignable_info.6482
br label %.if.end.6713
.if.false.6713:
%.tmp6721 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6722 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6721, i32 0, i32 6
%.tmp6723 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6722
%.tmp6724 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6723, i32 0, i32 0
%.tmp6725 = load i8*, i8** %.tmp6724
%.tmp6727 = getelementptr [7 x i8], [7 x i8]*@.str6726, i32 0, i32 0
%.tmp6728 = call i32(i8*,i8*) @strcmp(i8* %.tmp6725, i8* %.tmp6727)
%.tmp6729 = icmp eq i32 %.tmp6728, 0
br i1 %.tmp6729, label %.if.true.6730, label %.if.false.6730
.if.true.6730:
%.tmp6731 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6732 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6733 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6732, i32 0, i32 6
%.tmp6734 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6733
%.tmp6735 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6734, i32 0, i32 1
%.tmp6736 = load i8*, i8** %.tmp6735
%.tmp6737 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp6731, i8* %.tmp6736)
%string_info.6738 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6737, %m1861$.AssignableInfo.type** %string_info.6738
%.tmp6739 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6740 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6739)
store %m1861$.AssignableInfo.type* %.tmp6740, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6741 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6742 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6741, %m1861$.AssignableInfo.type* %.tmp6742)
%.tmp6743 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6744 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6738
%.tmp6745 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6744, i32 0, i32 3
%.tmp6746 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6745
%.tmp6747 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6743, %m1861$.Type.type* %.tmp6746)
%str_tr.6748 = alloca i8*
store i8* %.tmp6747, i8** %str_tr.6748
%.tmp6749 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6750 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6749, i32 0, i32 1
%.tmp6751 = load %m0$.File.type*, %m0$.File.type** %.tmp6750
%.tmp6753 = getelementptr [44 x i8], [44 x i8]*@.str6752, i32 0, i32 0
%.tmp6754 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6755 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6754)
%.tmp6756 = load i8*, i8** %str_tr.6748
%.tmp6757 = load i8*, i8** %str_tr.6748
%.tmp6758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6738
%.tmp6759 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6758)
%.tmp6760 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6751, i8* %.tmp6753, i8* %.tmp6755, i8* %.tmp6756, i8* %.tmp6757, i8* %.tmp6759)
%.tmp6761 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6762 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6761, i32 0, i32 3
%.tmp6763 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6763, %m1861$.Type.type** %.tmp6762
%.tmp6764 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6765 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6764, i32 0, i32 3
%.tmp6766 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6765
%.tmp6767 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6766, i32 0, i32 0
%.tmp6769 = getelementptr [4 x i8], [4 x i8]*@.str6768, i32 0, i32 0
store i8* %.tmp6769, i8** %.tmp6767
%.tmp6770 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6771 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6770, i32 0, i32 3
%.tmp6772 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6771
%.tmp6773 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6772, i32 0, i32 3
%.tmp6774 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6774, %m1861$.Type.type** %.tmp6773
%.tmp6775 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6776 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6775, i32 0, i32 3
%.tmp6777 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6776
%.tmp6778 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6777, i32 0, i32 3
%.tmp6779 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6778
%.tmp6780 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6779, i32 0, i32 0
%.tmp6782 = getelementptr [4 x i8], [4 x i8]*@.str6781, i32 0, i32 0
store i8* %.tmp6782, i8** %.tmp6780
br label %.if.end.6730
.if.false.6730:
%.tmp6783 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6784 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6783, i32 0, i32 6
%.tmp6785 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6784
%.tmp6786 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6785, i32 0, i32 0
%.tmp6787 = load i8*, i8** %.tmp6786
%.tmp6789 = getelementptr [4 x i8], [4 x i8]*@.str6788, i32 0, i32 0
%.tmp6790 = call i32(i8*,i8*) @strcmp(i8* %.tmp6787, i8* %.tmp6789)
%.tmp6791 = icmp eq i32 %.tmp6790, 0
br i1 %.tmp6791, label %.if.true.6792, label %.if.false.6792
.if.true.6792:
%.tmp6793 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6794 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6793)
store %m1861$.AssignableInfo.type* %.tmp6794, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6795 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6796 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6795, i32 0, i32 6
%.tmp6797 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6796
%.tmp6798 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6797, i32 0, i32 1
%.tmp6799 = load i8*, i8** %.tmp6798
%.tmp6800 = call i32(i8*) @strlen(i8* %.tmp6799)
%chr_len.6801 = alloca i32
store i32 %.tmp6800, i32* %chr_len.6801
%.tmp6802 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6803 = load i8, i8* @SCOPE_CONST
%.tmp6805 = getelementptr [2 x i8], [2 x i8]*@.str6804, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6802, i8 %.tmp6803, i8* %.tmp6805)
%.tmp6806 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6807 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6806, i32 0, i32 0
%.tmp6808 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6809 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6808, i32 0, i32 6
%.tmp6810 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6809
%.tmp6811 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6810, i32 0, i32 1
%.tmp6812 = load i8*, i8** %.tmp6811
%.tmp6813 = call i8*(i8*) @m2225$chr_to_llvm.cp.cp(i8* %.tmp6812)
store i8* %.tmp6813, i8** %.tmp6807
%.tmp6814 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6815 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6814, i32 0, i32 0
%.tmp6816 = load i8*, i8** %.tmp6815
%.tmp6817 = icmp eq i8* %.tmp6816, null
br i1 %.tmp6817, label %.if.true.6818, label %.if.false.6818
.if.true.6818:
%.tmp6819 = getelementptr i8*, i8** %err_buf.6485, i32 0
%.tmp6821 = getelementptr [22 x i8], [22 x i8]*@.str6820, i32 0, i32 0
%.tmp6822 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6823 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6822, i32 0, i32 6
%.tmp6824 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6823
%.tmp6825 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6824, i32 0, i32 1
%.tmp6826 = load i8*, i8** %.tmp6825
%.tmp6827 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6819, i8* %.tmp6821, i8* %.tmp6826)
%.tmp6828 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6828
br label %.if.end.6818
.if.false.6818:
br label %.if.end.6818
.if.end.6818:
%.tmp6829 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6830 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6829, i32 0, i32 3
%.tmp6831 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6831, %m1861$.Type.type** %.tmp6830
%.tmp6832 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6833 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6832, i32 0, i32 3
%.tmp6834 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6833
%.tmp6835 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6834, i32 0, i32 0
%.tmp6837 = getelementptr [4 x i8], [4 x i8]*@.str6836, i32 0, i32 0
store i8* %.tmp6837, i8** %.tmp6835
br label %.if.end.6792
.if.false.6792:
%.tmp6838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6839 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6841 = getelementptr [40 x i8], [40 x i8]*@.str6840, i32 0, i32 0
%.tmp6842 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6838, %m307$.Node.type* %.tmp6839, i8* %.tmp6841)
%.tmp6843 = load %m307$.Node.type*, %m307$.Node.type** %mono.6484
%.tmp6844 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6843, i32 0, i32 6
%.tmp6845 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6844
%.tmp6846 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6845, i32 0, i32 0
%.tmp6847 = load i8*, i8** %.tmp6846
%.tmp6848 = call i32(i8*,...) @printf(i8* %.tmp6842, i8* %.tmp6847)
%.tmp6849 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6849
br label %.if.end.6792
.if.end.6792:
br label %.if.end.6730
.if.end.6730:
br label %.if.end.6713
.if.end.6713:
br label %.if.end.6672
.if.end.6672:
br label %.if.end.6571
.if.end.6571:
br label %.if.end.6524
.if.end.6524:
br label %.if.end.6496
.if.end.6496:
%.tmp6850 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6851 = icmp eq %m1861$.AssignableInfo.type* %.tmp6850, null
br i1 %.tmp6851, label %.if.true.6852, label %.if.false.6852
.if.true.6852:
%.tmp6853 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6853
br label %.if.end.6852
.if.false.6852:
br label %.if.end.6852
.if.end.6852:
%.tmp6854 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6855 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6854, i32 0, i32 4
%.tmp6856 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6857 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6856, i32 0, i32 3
%.tmp6858 = load i32, i32* %.tmp6857
store i32 %.tmp6858, i32* %.tmp6855
%.tmp6859 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6860 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6859, i32 0, i32 5
%.tmp6861 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6862 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6861, i32 0, i32 4
%.tmp6863 = load i32, i32* %.tmp6862
store i32 %.tmp6863, i32* %.tmp6860
%.tmp6864 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6482
%.tmp6865 = bitcast %m1861$.AssignableInfo.type* %.tmp6864 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6865
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp6866 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6867 = icmp ne %m1861$.Type.type* %.tmp6866, null
%.tmp6869 = getelementptr [22 x i8], [22 x i8]*@.str6868, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6867, i8* %.tmp6869)
%.tmp6870 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6871 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6870, i32 0, i32 0
%.tmp6872 = load i8*, i8** %.tmp6871
%.tmp6873 = icmp ne i8* %.tmp6872, null
%.tmp6875 = getelementptr [59 x i8], [59 x i8]*@.str6874, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6873, i8* %.tmp6875)
%.tmp6876 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6877 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6876, i32 0, i32 0
%.tmp6878 = load i8*, i8** %.tmp6877
%.tmp6880 = getelementptr [4 x i8], [4 x i8]*@.str6879, i32 0, i32 0
%.tmp6881 = call i32(i8*,i8*) @strcmp(i8* %.tmp6878, i8* %.tmp6880)
%.tmp6882 = icmp eq i32 %.tmp6881, 0
br i1 %.tmp6882, label %.if.true.6883, label %.if.false.6883
.if.true.6883:
%.tmp6885 = getelementptr [2 x i8], [2 x i8]*@.str6884, i32 0, i32 0
ret i8* %.tmp6885
br label %.if.end.6883
.if.false.6883:
%.tmp6886 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6887 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6886, i32 0, i32 0
%.tmp6888 = load i8*, i8** %.tmp6887
%.tmp6890 = getelementptr [5 x i8], [5 x i8]*@.str6889, i32 0, i32 0
%.tmp6891 = call i32(i8*,i8*) @strcmp(i8* %.tmp6888, i8* %.tmp6890)
%.tmp6892 = icmp eq i32 %.tmp6891, 0
br i1 %.tmp6892, label %.if.true.6893, label %.if.false.6893
.if.true.6893:
%.tmp6895 = getelementptr [2 x i8], [2 x i8]*@.str6894, i32 0, i32 0
ret i8* %.tmp6895
br label %.if.end.6893
.if.false.6893:
%.tmp6896 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6897 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6896, i32 0, i32 0
%.tmp6898 = load i8*, i8** %.tmp6897
%.tmp6900 = getelementptr [5 x i8], [5 x i8]*@.str6899, i32 0, i32 0
%.tmp6901 = call i32(i8*,i8*) @strcmp(i8* %.tmp6898, i8* %.tmp6900)
%.tmp6902 = icmp eq i32 %.tmp6901, 0
br i1 %.tmp6902, label %.if.true.6903, label %.if.false.6903
.if.true.6903:
%.tmp6905 = getelementptr [2 x i8], [2 x i8]*@.str6904, i32 0, i32 0
ret i8* %.tmp6905
br label %.if.end.6903
.if.false.6903:
%.tmp6906 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6907 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6906, i32 0, i32 0
%.tmp6908 = load i8*, i8** %.tmp6907
%.tmp6910 = getelementptr [4 x i8], [4 x i8]*@.str6909, i32 0, i32 0
%.tmp6911 = call i32(i8*,i8*) @strcmp(i8* %.tmp6908, i8* %.tmp6910)
%.tmp6912 = icmp eq i32 %.tmp6911, 0
br i1 %.tmp6912, label %.if.true.6913, label %.if.false.6913
.if.true.6913:
%.tmp6915 = getelementptr [2 x i8], [2 x i8]*@.str6914, i32 0, i32 0
ret i8* %.tmp6915
br label %.if.end.6913
.if.false.6913:
%.tmp6916 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6917 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6916, i32 0, i32 0
%.tmp6918 = load i8*, i8** %.tmp6917
%.tmp6920 = getelementptr [4 x i8], [4 x i8]*@.str6919, i32 0, i32 0
%.tmp6921 = call i32(i8*,i8*) @strcmp(i8* %.tmp6918, i8* %.tmp6920)
%.tmp6922 = icmp eq i32 %.tmp6921, 0
br i1 %.tmp6922, label %.if.true.6923, label %.if.false.6923
.if.true.6923:
%buf.6924 = alloca i8*
store i8* null, i8** %buf.6924
%.tmp6925 = getelementptr i8*, i8** %buf.6924, i32 0
%.tmp6927 = getelementptr [4 x i8], [4 x i8]*@.str6926, i32 0, i32 0
%.tmp6928 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6929 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6928, i32 0, i32 3
%.tmp6930 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6929
%.tmp6931 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp6930)
%.tmp6932 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6925, i8* %.tmp6927, i8* %.tmp6931)
%.tmp6933 = load i8*, i8** %buf.6924
ret i8* %.tmp6933
br label %.if.end.6923
.if.false.6923:
%.tmp6934 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6935 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6934, i32 0, i32 0
%.tmp6936 = load i8*, i8** %.tmp6935
%.tmp6938 = getelementptr [10 x i8], [10 x i8]*@.str6937, i32 0, i32 0
%.tmp6939 = call i32(i8*,i8*) @strcmp(i8* %.tmp6936, i8* %.tmp6938)
%.tmp6940 = icmp eq i32 %.tmp6939, 0
br i1 %.tmp6940, label %.if.true.6941, label %.if.false.6941
.if.true.6941:
%.tmp6942 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6943 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6942, i32 0, i32 2
%.tmp6944 = load i8*, i8** %.tmp6943
ret i8* %.tmp6944
br label %.if.end.6941
.if.false.6941:
%.tmp6945 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6946 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6945, i32 0, i32 0
%.tmp6947 = load i8*, i8** %.tmp6946
%.tmp6949 = getelementptr [6 x i8], [6 x i8]*@.str6948, i32 0, i32 0
%.tmp6950 = call i32(i8*,i8*) @strcmp(i8* %.tmp6947, i8* %.tmp6949)
%.tmp6951 = icmp eq i32 %.tmp6950, 0
br i1 %.tmp6951, label %.if.true.6952, label %.if.false.6952
.if.true.6952:
%.tmp6954 = getelementptr [2 x i8], [2 x i8]*@.str6953, i32 0, i32 0
ret i8* %.tmp6954
br label %.if.end.6952
.if.false.6952:
%.tmp6956 = getelementptr [44 x i8], [44 x i8]*@.str6955, i32 0, i32 0
%.tmp6957 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6958 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6957, i32 0, i32 0
%.tmp6959 = load i8*, i8** %.tmp6958
%.tmp6960 = call i32(i8*,...) @printf(i8* %.tmp6956, i8* %.tmp6959)
br label %.if.end.6952
.if.end.6952:
br label %.if.end.6941
.if.end.6941:
br label %.if.end.6923
.if.end.6923:
br label %.if.end.6913
.if.end.6913:
br label %.if.end.6903
.if.end.6903:
br label %.if.end.6893
.if.end.6893:
br label %.if.end.6883
.if.end.6883:
%.tmp6961 = bitcast ptr null to i8*
ret i8* %.tmp6961
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp6962 = bitcast ptr null to %m307$.Node.type*
%.tmp6963 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6962)
%info.6964 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6963, %m1861$.AssignableInfo.type** %info.6964
%tmp_buff.6965 = alloca i8*
store i8* null, i8** %tmp_buff.6965
%.tmp6966 = getelementptr i8*, i8** %tmp_buff.6965, i32 0
%.tmp6968 = getelementptr [7 x i8], [7 x i8]*@.str6967, i32 0, i32 0
%.tmp6969 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6970 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6969)
%.tmp6971 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6966, i8* %.tmp6968, i32 %.tmp6970)
%.tmp6972 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp6973 = load i8, i8* @SCOPE_GLOBAL
%.tmp6974 = load i8*, i8** %tmp_buff.6965
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6972, i8 %.tmp6973, i8* %.tmp6974)
%.tmp6975 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp6976 = ptrtoint %m1861$.GlobalName.type* %.tmp6975 to i32
%.tmp6977 = call i8*(i32) @malloc(i32 %.tmp6976)
%.tmp6978 = bitcast i8* %.tmp6977 to %m1861$.GlobalName.type*
%global.6979 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp6978, %m1861$.GlobalName.type** %global.6979
%.tmp6980 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
%.tmp6981 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp6980, i32 0, i32 0
%.tmp6982 = load i8*, i8** %text
%.tmp6983 = call i8*(i8*) @m2225$string_to_llvm.cp.cp(i8* %.tmp6982)
store i8* %.tmp6983, i8** %.tmp6981
%.tmp6984 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp6985 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6984, i32 0, i32 3
%.tmp6986 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6986, %m1861$.Type.type** %.tmp6985
%.tmp6987 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp6988 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6987, i32 0, i32 3
%.tmp6989 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6988
%.tmp6990 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6989, i32 0, i32 0
%.tmp6992 = getelementptr [6 x i8], [6 x i8]*@.str6991, i32 0, i32 0
store i8* %.tmp6992, i8** %.tmp6990
%.tmp6993 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp6994 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6993, i32 0, i32 3
%.tmp6995 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6994
%.tmp6996 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6995, i32 0, i32 3
%.tmp6997 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6997, %m1861$.Type.type** %.tmp6996
%.tmp6998 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp6999 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6998, i32 0, i32 3
%.tmp7000 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6999
%.tmp7001 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7000, i32 0, i32 3
%.tmp7002 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7001
%.tmp7003 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7002, i32 0, i32 0
%.tmp7005 = getelementptr [4 x i8], [4 x i8]*@.str7004, i32 0, i32 0
store i8* %.tmp7005, i8** %.tmp7003
%.tmp7006 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp7007 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7006, i32 0, i32 3
%.tmp7008 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7007
%.tmp7009 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7008, i32 0, i32 3
%.tmp7010 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7009
%.tmp7011 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7010, i32 0, i32 4
%.tmp7012 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7012, %m1861$.Type.type** %.tmp7011
%.tmp7013 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
%.tmp7014 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7013, i32 0, i32 3
%.tmp7015 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7014
%.tmp7016 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7015, i32 0, i32 3
%.tmp7017 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7016
%.tmp7018 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7017, i32 0, i32 4
%.tmp7019 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7018
%.tmp7020 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7019, i32 0, i32 0
%.tmp7021 = getelementptr i8*, i8** %.tmp7020, i32 0
%.tmp7023 = getelementptr [3 x i8], [3 x i8]*@.str7022, i32 0, i32 0
%.tmp7024 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
%.tmp7025 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7024, i32 0, i32 0
%.tmp7026 = load i8*, i8** %.tmp7025
%.tmp7027 = call i32(i8*) @m2225$llvm_str_len.i.cp(i8* %.tmp7026)
%.tmp7028 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7021, i8* %.tmp7023, i32 %.tmp7027)
%.tmp7029 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
%.tmp7030 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7029, i32 0, i32 1
%.tmp7032 = getelementptr [7 x i8], [7 x i8]*@.str7031, i32 0, i32 0
store i8* %.tmp7032, i8** %.tmp7030
%.tmp7033 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
%.tmp7034 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7033, i32 0, i32 4
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7034
%.tmp7035 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
%.tmp7036 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7035, i32 0, i32 3
%.tmp7037 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
store %m1861$.AssignableInfo.type* %.tmp7037, %m1861$.AssignableInfo.type** %.tmp7036
%.tmp7038 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
%.tmp7039 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7038, i32 0, i32 2
store i1 0, i1* %.tmp7039
%.tmp7040 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7041 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.6979
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7040, %m1861$.GlobalName.type* %.tmp7041)
%.tmp7042 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6964
ret %m1861$.AssignableInfo.type* %.tmp7042
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
%.tmp7043 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7044 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7043)
%info.7045 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7044, %m1861$.AssignableInfo.type** %info.7045
%.tmp7046 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7045
%.tmp7047 = load i8, i8* @SCOPE_CONST
%.tmp7048 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7046, i8 %.tmp7047, i8* %.tmp7048)
%.tmp7049 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7045
%.tmp7050 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7049, i32 0, i32 2
%.tmp7052 = getelementptr [7 x i8], [7 x i8]*@.str7051, i32 0, i32 0
store i8* %.tmp7052, i8** %.tmp7050
%.tmp7053 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7045
%.tmp7054 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7053, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7054
%.tmp7055 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7056 = load i8*, i8** %as_name
%.tmp7057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7045
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7055, i8* %.tmp7056, %m1861$.AssignableInfo.type* %.tmp7057)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7058 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7059 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7058, i32 0, i32 3
%.tmp7060 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7059
%.tmp7061 = icmp eq %m1861$.GlobalName.type* %.tmp7060, null
br i1 %.tmp7061, label %.if.true.7062, label %.if.false.7062
.if.true.7062:
%.tmp7063 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7064 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7063, i32 0, i32 3
%.tmp7065 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7065, %m1861$.GlobalName.type** %.tmp7064
br label %.if.end.7062
.if.false.7062:
%last_global.7066 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %last_global.7066
%.tmp7068 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7069 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7068, i32 0, i32 3
%.tmp7070 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7069
store %m1861$.GlobalName.type* %.tmp7070, %m1861$.GlobalName.type** %last_global.7066
br label %.for.start.7067
.for.start.7067:
%.tmp7071 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7066
%.tmp7072 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7071, i32 0, i32 4
%.tmp7073 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7072
%.tmp7074 = icmp ne %m1861$.GlobalName.type* %.tmp7073, null
br i1 %.tmp7074, label %.for.continue.7067, label %.for.end.7067
.for.continue.7067:
%.tmp7075 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7066
%.tmp7076 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7075, i32 0, i32 4
%.tmp7077 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7076
store %m1861$.GlobalName.type* %.tmp7077, %m1861$.GlobalName.type** %last_global.7066
br label %.for.start.7067
.for.end.7067:
%.tmp7078 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7066
%.tmp7079 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7078, i32 0, i32 4
%.tmp7080 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7080, %m1861$.GlobalName.type** %.tmp7079
br label %.if.end.7062
.if.end.7062:
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7081 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7082 = icmp eq %m1861$.Type.type* %.tmp7081, null
br i1 %.tmp7082, label %.if.true.7083, label %.if.false.7083
.if.true.7083:
%.tmp7084 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7084, label %.if.true.7085, label %.if.false.7085
.if.true.7085:
%.tmp7087 = getelementptr [44 x i8], [44 x i8]*@.str7086, i32 0, i32 0
%.tmp7088 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7089 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7088, i32 0, i32 6
%.tmp7090 = load i8*, i8** %.tmp7089
%.tmp7091 = call i32(i8*,...) @printf(i8* %.tmp7087, i8* %.tmp7090)
br label %.if.end.7085
.if.false.7085:
br label %.if.end.7085
.if.end.7085:
%.tmp7093 = getelementptr [2 x i8], [2 x i8]*@.str7092, i32 0, i32 0
ret i8* %.tmp7093
br label %.if.end.7083
.if.false.7083:
br label %.if.end.7083
.if.end.7083:
%.tmp7094 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7095 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7094, i32 0, i32 0
%.tmp7096 = load i8*, i8** %.tmp7095
%.tmp7097 = icmp ne i8* %.tmp7096, null
%.tmp7099 = getelementptr [59 x i8], [59 x i8]*@.str7098, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7097, i8* %.tmp7099)
%buf.7100 = alloca i8*
store i8* null, i8** %buf.7100
%.tmp7101 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7102 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7101, i32 0, i32 0
%.tmp7103 = load i8*, i8** %.tmp7102
%.tmp7105 = getelementptr [4 x i8], [4 x i8]*@.str7104, i32 0, i32 0
%.tmp7106 = call i32(i8*,i8*) @strcmp(i8* %.tmp7103, i8* %.tmp7105)
%.tmp7107 = icmp eq i32 %.tmp7106, 0
br i1 %.tmp7107, label %.if.true.7108, label %.if.false.7108
.if.true.7108:
%.tmp7110 = getelementptr [4 x i8], [4 x i8]*@.str7109, i32 0, i32 0
ret i8* %.tmp7110
br label %.if.end.7108
.if.false.7108:
%.tmp7111 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7112 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7111, i32 0, i32 0
%.tmp7113 = load i8*, i8** %.tmp7112
%.tmp7115 = getelementptr [5 x i8], [5 x i8]*@.str7114, i32 0, i32 0
%.tmp7116 = call i32(i8*,i8*) @strcmp(i8* %.tmp7113, i8* %.tmp7115)
%.tmp7117 = icmp eq i32 %.tmp7116, 0
br i1 %.tmp7117, label %.if.true.7118, label %.if.false.7118
.if.true.7118:
%.tmp7120 = getelementptr [5 x i8], [5 x i8]*@.str7119, i32 0, i32 0
ret i8* %.tmp7120
br label %.if.end.7118
.if.false.7118:
%.tmp7121 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7122 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7121, i32 0, i32 0
%.tmp7123 = load i8*, i8** %.tmp7122
%.tmp7125 = getelementptr [5 x i8], [5 x i8]*@.str7124, i32 0, i32 0
%.tmp7126 = call i32(i8*,i8*) @strcmp(i8* %.tmp7123, i8* %.tmp7125)
%.tmp7127 = icmp eq i32 %.tmp7126, 0
br i1 %.tmp7127, label %.if.true.7128, label %.if.false.7128
.if.true.7128:
%.tmp7130 = getelementptr [3 x i8], [3 x i8]*@.str7129, i32 0, i32 0
ret i8* %.tmp7130
br label %.if.end.7128
.if.false.7128:
%.tmp7131 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7132 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7131, i32 0, i32 0
%.tmp7133 = load i8*, i8** %.tmp7132
%.tmp7135 = getelementptr [8 x i8], [8 x i8]*@.str7134, i32 0, i32 0
%.tmp7136 = call i32(i8*,i8*) @strcmp(i8* %.tmp7133, i8* %.tmp7135)
%.tmp7137 = icmp eq i32 %.tmp7136, 0
br i1 %.tmp7137, label %.if.true.7138, label %.if.false.7138
.if.true.7138:
%.tmp7140 = getelementptr [4 x i8], [4 x i8]*@.str7139, i32 0, i32 0
ret i8* %.tmp7140
br label %.if.end.7138
.if.false.7138:
%.tmp7141 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7142 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7141, i32 0, i32 0
%.tmp7143 = load i8*, i8** %.tmp7142
%.tmp7145 = getelementptr [4 x i8], [4 x i8]*@.str7144, i32 0, i32 0
%.tmp7146 = call i32(i8*,i8*) @strcmp(i8* %.tmp7143, i8* %.tmp7145)
%.tmp7147 = icmp eq i32 %.tmp7146, 0
br i1 %.tmp7147, label %.if.true.7148, label %.if.false.7148
.if.true.7148:
%.tmp7150 = getelementptr [3 x i8], [3 x i8]*@.str7149, i32 0, i32 0
ret i8* %.tmp7150
br label %.if.end.7148
.if.false.7148:
%.tmp7151 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7152 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7151, i32 0, i32 0
%.tmp7153 = load i8*, i8** %.tmp7152
%.tmp7155 = getelementptr [9 x i8], [9 x i8]*@.str7154, i32 0, i32 0
%.tmp7156 = call i32(i8*,i8*) @strcmp(i8* %.tmp7153, i8* %.tmp7155)
%.tmp7157 = icmp eq i32 %.tmp7156, 0
br i1 %.tmp7157, label %.if.true.7158, label %.if.false.7158
.if.true.7158:
%.tmp7159 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7161 = getelementptr [4 x i8], [4 x i8]*@.str7160, i32 0, i32 0
%.tmp7162 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7163 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7164 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7163, i32 0, i32 3
%.tmp7165 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7164
%.tmp7166 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7162, %m1861$.Type.type* %.tmp7165)
%.tmp7167 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7159, i8* %.tmp7161, i8* %.tmp7166)
%.tmp7169 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7170 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7169, i32 0, i32 3
%.tmp7171 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7170
%.tmp7172 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7171, i32 0, i32 4
%.tmp7173 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7172
%p.7174 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7173, %m1861$.Type.type** %p.7174
br label %.for.start.7168
.for.start.7168:
%.tmp7175 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7174
%.tmp7176 = icmp ne %m1861$.Type.type* %.tmp7175, null
br i1 %.tmp7176, label %.for.continue.7168, label %.for.end.7168
.for.continue.7168:
%.tmp7177 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7174
%.tmp7178 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7179 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7178, i32 0, i32 3
%.tmp7180 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7179
%.tmp7181 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7180, i32 0, i32 4
%.tmp7182 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7181
%.tmp7183 = icmp ne %m1861$.Type.type* %.tmp7177, %.tmp7182
br i1 %.tmp7183, label %.if.true.7184, label %.if.false.7184
.if.true.7184:
%.tmp7185 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7187 = getelementptr [4 x i8], [4 x i8]*@.str7186, i32 0, i32 0
%.tmp7188 = load i8*, i8** %buf.7100
%.tmp7189 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7185, i8* %.tmp7187, i8* %.tmp7188)
br label %.if.end.7184
.if.false.7184:
br label %.if.end.7184
.if.end.7184:
%.tmp7190 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7192 = getelementptr [5 x i8], [5 x i8]*@.str7191, i32 0, i32 0
%.tmp7193 = load i8*, i8** %buf.7100
%.tmp7194 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7195 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7174
%.tmp7196 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7194, %m1861$.Type.type* %.tmp7195)
%.tmp7197 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7190, i8* %.tmp7192, i8* %.tmp7193, i8* %.tmp7196)
%.tmp7198 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7174
%.tmp7199 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7198, i32 0, i32 4
%.tmp7200 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7199
store %m1861$.Type.type* %.tmp7200, %m1861$.Type.type** %p.7174
br label %.for.start.7168
.for.end.7168:
%.tmp7201 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7203 = getelementptr [4 x i8], [4 x i8]*@.str7202, i32 0, i32 0
%.tmp7204 = load i8*, i8** %buf.7100
%.tmp7205 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7201, i8* %.tmp7203, i8* %.tmp7204)
%.tmp7206 = load i8*, i8** %buf.7100
ret i8* %.tmp7206
br label %.if.end.7158
.if.false.7158:
%.tmp7207 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7208 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7207, i32 0, i32 0
%.tmp7209 = load i8*, i8** %.tmp7208
%.tmp7211 = getelementptr [4 x i8], [4 x i8]*@.str7210, i32 0, i32 0
%.tmp7212 = call i32(i8*,i8*) @strcmp(i8* %.tmp7209, i8* %.tmp7211)
%.tmp7213 = icmp eq i32 %.tmp7212, 0
br i1 %.tmp7213, label %.if.true.7214, label %.if.false.7214
.if.true.7214:
%.tmp7215 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7217 = getelementptr [4 x i8], [4 x i8]*@.str7216, i32 0, i32 0
%.tmp7218 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7219 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7220 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7219, i32 0, i32 3
%.tmp7221 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7220
%.tmp7222 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7218, %m1861$.Type.type* %.tmp7221)
%.tmp7223 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7215, i8* %.tmp7217, i8* %.tmp7222)
%.tmp7224 = load i8*, i8** %buf.7100
ret i8* %.tmp7224
br label %.if.end.7214
.if.false.7214:
%.tmp7225 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7226 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7225, i32 0, i32 0
%.tmp7227 = load i8*, i8** %.tmp7226
%.tmp7229 = getelementptr [7 x i8], [7 x i8]*@.str7228, i32 0, i32 0
%.tmp7230 = call i32(i8*,i8*) @strcmp(i8* %.tmp7227, i8* %.tmp7229)
%.tmp7231 = icmp eq i32 %.tmp7230, 0
br i1 %.tmp7231, label %.if.true.7232, label %.if.false.7232
.if.true.7232:
%.tmp7233 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7235 = getelementptr [2 x i8], [2 x i8]*@.str7234, i32 0, i32 0
%.tmp7236 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7233, i8* %.tmp7235)
%.tmp7238 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7239 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7238, i32 0, i32 3
%.tmp7240 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7239
%t.7241 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7240, %m1861$.Type.type** %t.7241
br label %.for.start.7237
.for.start.7237:
%.tmp7242 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7241
%.tmp7243 = icmp ne %m1861$.Type.type* %.tmp7242, null
br i1 %.tmp7243, label %.for.continue.7237, label %.for.end.7237
.for.continue.7237:
%.tmp7244 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7241
%.tmp7245 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7246 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7245, i32 0, i32 3
%.tmp7247 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7246
%.tmp7248 = icmp ne %m1861$.Type.type* %.tmp7244, %.tmp7247
br i1 %.tmp7248, label %.if.true.7249, label %.if.false.7249
.if.true.7249:
%.tmp7250 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7252 = getelementptr [4 x i8], [4 x i8]*@.str7251, i32 0, i32 0
%.tmp7253 = load i8*, i8** %buf.7100
%.tmp7254 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7250, i8* %.tmp7252, i8* %.tmp7253)
br label %.if.end.7249
.if.false.7249:
br label %.if.end.7249
.if.end.7249:
%.tmp7255 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7257 = getelementptr [5 x i8], [5 x i8]*@.str7256, i32 0, i32 0
%.tmp7258 = load i8*, i8** %buf.7100
%.tmp7259 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7260 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7241
%.tmp7261 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7259, %m1861$.Type.type* %.tmp7260)
%.tmp7262 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7255, i8* %.tmp7257, i8* %.tmp7258, i8* %.tmp7261)
%.tmp7263 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7241
%.tmp7264 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7263, i32 0, i32 4
%.tmp7265 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7264
store %m1861$.Type.type* %.tmp7265, %m1861$.Type.type** %t.7241
br label %.for.start.7237
.for.end.7237:
%.tmp7266 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7268 = getelementptr [4 x i8], [4 x i8]*@.str7267, i32 0, i32 0
%.tmp7269 = load i8*, i8** %buf.7100
%.tmp7270 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7266, i8* %.tmp7268, i8* %.tmp7269)
%.tmp7271 = load i8*, i8** %buf.7100
ret i8* %.tmp7271
br label %.if.end.7232
.if.false.7232:
%.tmp7272 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7273 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7272, i32 0, i32 0
%.tmp7274 = load i8*, i8** %.tmp7273
%.tmp7276 = getelementptr [6 x i8], [6 x i8]*@.str7275, i32 0, i32 0
%.tmp7277 = call i32(i8*,i8*) @strcmp(i8* %.tmp7274, i8* %.tmp7276)
%.tmp7278 = icmp eq i32 %.tmp7277, 0
br i1 %.tmp7278, label %.if.true.7279, label %.if.false.7279
.if.true.7279:
%.tmp7280 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7282 = getelementptr [10 x i8], [10 x i8]*@.str7281, i32 0, i32 0
%.tmp7283 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7284 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7283, i32 0, i32 3
%.tmp7285 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7284
%.tmp7286 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7285, i32 0, i32 4
%.tmp7287 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7286
%.tmp7288 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7287, i32 0, i32 0
%.tmp7289 = load i8*, i8** %.tmp7288
%.tmp7290 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7291 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7292 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7291, i32 0, i32 3
%.tmp7293 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7292
%.tmp7294 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7290, %m1861$.Type.type* %.tmp7293)
%.tmp7295 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7280, i8* %.tmp7282, i8* %.tmp7289, i8* %.tmp7294)
%.tmp7296 = load i8*, i8** %buf.7100
ret i8* %.tmp7296
br label %.if.end.7279
.if.false.7279:
%.tmp7297 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7298 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7297, i32 0, i32 0
%.tmp7299 = load i8*, i8** %.tmp7298
%.tmp7301 = getelementptr [10 x i8], [10 x i8]*@.str7300, i32 0, i32 0
%.tmp7302 = call i32(i8*,i8*) @strcmp(i8* %.tmp7299, i8* %.tmp7301)
%.tmp7303 = icmp eq i32 %.tmp7302, 0
br i1 %.tmp7303, label %.if.true.7304, label %.if.false.7304
.if.true.7304:
%.tmp7305 = getelementptr i8*, i8** %buf.7100, i32 0
%.tmp7307 = getelementptr [5 x i8], [5 x i8]*@.str7306, i32 0, i32 0
%.tmp7308 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7309 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7308, i32 0, i32 2
%.tmp7310 = load i8*, i8** %.tmp7309
%.tmp7311 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7305, i8* %.tmp7307, i8* %.tmp7310)
%.tmp7312 = load i8*, i8** %buf.7100
ret i8* %.tmp7312
br label %.if.end.7304
.if.false.7304:
%.tmp7313 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7314 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7313, i32 0, i32 0
%.tmp7315 = load i8*, i8** %.tmp7314
%.tmp7317 = getelementptr [7 x i8], [7 x i8]*@.str7316, i32 0, i32 0
%.tmp7318 = call i32(i8*,i8*) @strcmp(i8* %.tmp7315, i8* %.tmp7317)
%.tmp7319 = icmp eq i32 %.tmp7318, 0
br i1 %.tmp7319, label %.if.true.7320, label %.if.false.7320
.if.true.7320:
%.tmp7322 = getelementptr [4 x i8], [4 x i8]*@.str7321, i32 0, i32 0
ret i8* %.tmp7322
br label %.if.end.7320
.if.false.7320:
%.tmp7323 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7324 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7323, i32 0, i32 0
%.tmp7325 = load i8*, i8** %.tmp7324
%.tmp7327 = getelementptr [6 x i8], [6 x i8]*@.str7326, i32 0, i32 0
%.tmp7328 = call i32(i8*,i8*) @strcmp(i8* %.tmp7325, i8* %.tmp7327)
%.tmp7329 = icmp eq i32 %.tmp7328, 0
br i1 %.tmp7329, label %.if.true.7330, label %.if.false.7330
.if.true.7330:
br label %.if.end.7330
.if.false.7330:
%.tmp7332 = getelementptr [58 x i8], [58 x i8]*@.str7331, i32 0, i32 0
%.tmp7333 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7334 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7333, i32 0, i32 0
%.tmp7335 = load i8*, i8** %.tmp7334
%.tmp7336 = call i32(i8*,...) @printf(i8* %.tmp7332, i8* %.tmp7335)
br label %.if.end.7330
.if.end.7330:
br label %.if.end.7320
.if.end.7320:
br label %.if.end.7304
.if.end.7304:
br label %.if.end.7279
.if.end.7279:
br label %.if.end.7232
.if.end.7232:
br label %.if.end.7214
.if.end.7214:
br label %.if.end.7158
.if.end.7158:
br label %.if.end.7148
.if.end.7148:
br label %.if.end.7138
.if.end.7138:
br label %.if.end.7128
.if.end.7128:
br label %.if.end.7118
.if.end.7118:
br label %.if.end.7108
.if.end.7108:
%.tmp7337 = bitcast ptr null to i8*
ret i8* %.tmp7337
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7338 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7339 = ptrtoint %m1861$.ErrorList.type* %.tmp7338 to i32
%.tmp7340 = call i8*(i32) @malloc(i32 %.tmp7339)
%.tmp7341 = bitcast i8* %.tmp7340 to %m1861$.ErrorList.type*
%new_err.7342 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7341, %m1861$.ErrorList.type** %new_err.7342
%.tmp7343 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7342
%.tmp7344 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7343, i32 0, i32 2
store i1 0, i1* %.tmp7344
%.tmp7345 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7342
%.tmp7346 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7345, i32 0, i32 0
%.tmp7347 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7347, %m751$.Error.type** %.tmp7346
%.tmp7348 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7342
%.tmp7349 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7348, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7349
%.tmp7350 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7351 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7350, i32 0, i32 2
%.tmp7352 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7351
%.tmp7353 = icmp eq %m1861$.ErrorList.type* %.tmp7352, null
br i1 %.tmp7353, label %.if.true.7354, label %.if.false.7354
.if.true.7354:
%.tmp7355 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7356 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7355, i32 0, i32 2
%.tmp7357 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7342
store %m1861$.ErrorList.type* %.tmp7357, %m1861$.ErrorList.type** %.tmp7356
ret void
br label %.if.end.7354
.if.false.7354:
br label %.if.end.7354
.if.end.7354:
%last.7358 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7358
%.tmp7360 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7361 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7360, i32 0, i32 2
%.tmp7362 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7361
store %m1861$.ErrorList.type* %.tmp7362, %m1861$.ErrorList.type** %last.7358
br label %.for.start.7359
.for.start.7359:
%.tmp7363 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7358
%.tmp7364 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7363, i32 0, i32 1
%.tmp7365 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7364
%.tmp7366 = icmp ne %m1861$.ErrorList.type* %.tmp7365, null
br i1 %.tmp7366, label %.for.continue.7359, label %.for.end.7359
.for.continue.7359:
%.tmp7367 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7358
%.tmp7368 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7367, i32 0, i32 1
%.tmp7369 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7368
store %m1861$.ErrorList.type* %.tmp7369, %m1861$.ErrorList.type** %last.7358
br label %.for.start.7359
.for.end.7359:
%.tmp7370 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7358
%.tmp7371 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7370, i32 0, i32 1
%.tmp7372 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7342
store %m1861$.ErrorList.type* %.tmp7372, %m1861$.ErrorList.type** %.tmp7371
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7373 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7374 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7373, i32 0, i32 6
%.tmp7375 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7374
%.tmp7376 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7375, i32 0, i32 7
%.tmp7377 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7376
%.tmp7378 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7377, i32 0, i32 1
%.tmp7379 = load i8*, i8** %.tmp7378
ret i8* %.tmp7379
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7381 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7382 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7381, %m307$.Node.type** %n.7382
br label %.for.start.7380
.for.start.7380:
%.tmp7383 = load %m307$.Node.type*, %m307$.Node.type** %n.7382
%.tmp7384 = icmp ne %m307$.Node.type* %.tmp7383, null
br i1 %.tmp7384, label %.for.continue.7380, label %.for.end.7380
.for.continue.7380:
%.tmp7385 = load %m307$.Node.type*, %m307$.Node.type** %n.7382
%.tmp7386 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7385, i32 0, i32 0
%.tmp7387 = load i8*, i8** %.tmp7386
%.tmp7388 = load i8*, i8** %type
%.tmp7389 = call i32(i8*,i8*) @strcmp(i8* %.tmp7387, i8* %.tmp7388)
%.tmp7390 = icmp eq i32 %.tmp7389, 0
br i1 %.tmp7390, label %.if.true.7391, label %.if.false.7391
.if.true.7391:
%.tmp7392 = load %m307$.Node.type*, %m307$.Node.type** %n.7382
ret %m307$.Node.type* %.tmp7392
br label %.if.end.7391
.if.false.7391:
br label %.if.end.7391
.if.end.7391:
%.tmp7393 = load %m307$.Node.type*, %m307$.Node.type** %n.7382
%.tmp7394 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7393, i32 0, i32 7
%.tmp7395 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7394
store %m307$.Node.type* %.tmp7395, %m307$.Node.type** %n.7382
br label %.for.start.7380
.for.end.7380:
%.tmp7396 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7396
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7397 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7398 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7397, %m1861$.Type.type** %function_type.7398
%.tmp7399 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7400 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7401 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7400, i32 0, i32 6
%.tmp7402 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7401
%.tmp7403 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7399, %m307$.Node.type* %.tmp7402)
%return_value_type.7404 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7403, %m1861$.Type.type** %return_value_type.7404
%.tmp7405 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7398
%.tmp7406 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7405, i32 0, i32 0
%.tmp7408 = getelementptr [9 x i8], [9 x i8]*@.str7407, i32 0, i32 0
store i8* %.tmp7408, i8** %.tmp7406
%.tmp7409 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7398
%.tmp7410 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7409, i32 0, i32 3
%.tmp7411 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7404
store %m1861$.Type.type* %.tmp7411, %m1861$.Type.type** %.tmp7410
%.tmp7412 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7404
%last_type.7413 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7412, %m1861$.Type.type** %last_type.7413
%.tmp7414 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7415 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7414)
%params.7416 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7415, %m307$.Node.type** %params.7416
%.tmp7418 = load %m307$.Node.type*, %m307$.Node.type** %params.7416
%param_ptr.7419 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7418, %m307$.Node.type** %param_ptr.7419
br label %.for.start.7417
.for.start.7417:
%.tmp7420 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7421 = icmp ne %m307$.Node.type* %.tmp7420, null
br i1 %.tmp7421, label %.for.continue.7417, label %.for.end.7417
.for.continue.7417:
%.tmp7422 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7423 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7422, i32 0, i32 0
%.tmp7424 = load i8*, i8** %.tmp7423
%.tmp7426 = getelementptr [5 x i8], [5 x i8]*@.str7425, i32 0, i32 0
%.tmp7427 = call i32(i8*,i8*) @strcmp(i8* %.tmp7424, i8* %.tmp7426)
%.tmp7428 = icmp eq i32 %.tmp7427, 0
br i1 %.tmp7428, label %.if.true.7429, label %.if.false.7429
.if.true.7429:
%.tmp7430 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7413
%.tmp7431 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7430, i32 0, i32 4
%.tmp7432 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7413
%.tmp7433 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7432)
store %m1861$.Type.type* %.tmp7433, %m1861$.Type.type** %.tmp7431
%.tmp7434 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7413
%.tmp7435 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7434, i32 0, i32 4
%.tmp7436 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7435
%.tmp7437 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7436, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7437
%.tmp7438 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7413
%.tmp7439 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7438, i32 0, i32 4
%.tmp7440 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7439
store %m1861$.Type.type* %.tmp7440, %m1861$.Type.type** %last_type.7413
%.tmp7441 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7442 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7441, i32 0, i32 7
%.tmp7443 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7442
%.tmp7444 = icmp ne %m307$.Node.type* %.tmp7443, null
br i1 %.tmp7444, label %.if.true.7445, label %.if.false.7445
.if.true.7445:
%.tmp7446 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7447 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7446, i32 0, i32 7
%.tmp7448 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7447
store %m307$.Node.type* %.tmp7448, %m307$.Node.type** %param_ptr.7419
br label %.if.end.7445
.if.false.7445:
br label %.if.end.7445
.if.end.7445:
%.tmp7449 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7450 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7449, i32 0, i32 7
%.tmp7451 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7450
%.tmp7452 = icmp ne %m307$.Node.type* %.tmp7451, null
br i1 %.tmp7452, label %.if.true.7453, label %.if.false.7453
.if.true.7453:
%.tmp7454 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7455 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7454, i32 0, i32 7
%.tmp7456 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7455
store %m307$.Node.type* %.tmp7456, %m307$.Node.type** %param_ptr.7419
br label %.if.end.7453
.if.false.7453:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7419
br label %.if.end.7453
.if.end.7453:
br label %.if.end.7429
.if.false.7429:
%.tmp7457 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7458 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7459 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7458, i32 0, i32 6
%.tmp7460 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7459
%.tmp7461 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7457, %m307$.Node.type* %.tmp7460)
%param_type.7462 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7461, %m1861$.Type.type** %param_type.7462
%.tmp7463 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7413
%.tmp7464 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7463, i32 0, i32 4
%.tmp7465 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7462
store %m1861$.Type.type* %.tmp7465, %m1861$.Type.type** %.tmp7464
%.tmp7466 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7462
store %m1861$.Type.type* %.tmp7466, %m1861$.Type.type** %last_type.7413
%.tmp7467 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7468 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7467, i32 0, i32 7
%.tmp7469 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7468
store %m307$.Node.type* %.tmp7469, %m307$.Node.type** %param_ptr.7419
%.tmp7470 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7471 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7470, i32 0, i32 7
%.tmp7472 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7471
%.tmp7473 = icmp ne %m307$.Node.type* %.tmp7472, null
br i1 %.tmp7473, label %.if.true.7474, label %.if.false.7474
.if.true.7474:
%.tmp7475 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7419
%.tmp7476 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7475, i32 0, i32 7
%.tmp7477 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7476
%.tmp7478 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7477, i32 0, i32 7
%.tmp7479 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7478
store %m307$.Node.type* %.tmp7479, %m307$.Node.type** %param_ptr.7419
br label %.if.end.7474
.if.false.7474:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7419
br label %.if.end.7474
.if.end.7474:
br label %.if.end.7429
.if.end.7429:
br label %.for.start.7417
.for.end.7417:
%.tmp7480 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7398
ret %m1861$.Type.type* %.tmp7480
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7481 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7483 = getelementptr [10 x i8], [10 x i8]*@.str7482, i32 0, i32 0
%.tmp7484 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7481, i8* %.tmp7483)
%params.7485 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7484, %m307$.Node.type** %params.7485
%.tmp7486 = load %m307$.Node.type*, %m307$.Node.type** %params.7485
%.tmp7487 = icmp eq %m307$.Node.type* %.tmp7486, null
br i1 %.tmp7487, label %.if.true.7488, label %.if.false.7488
.if.true.7488:
%.tmp7489 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7489
br label %.if.end.7488
.if.false.7488:
br label %.if.end.7488
.if.end.7488:
%.tmp7490 = load %m307$.Node.type*, %m307$.Node.type** %params.7485
%.tmp7491 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7490, i32 0, i32 6
%.tmp7492 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7491
ret %m307$.Node.type* %.tmp7492
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7493 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.7494 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7493, %m1861$.Type.type** %t.7494
%.tmp7495 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7496 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7495, i32 0, i32 0
%.tmp7497 = load i8*, i8** %.tmp7496
%.tmp7499 = getelementptr [10 x i8], [10 x i8]*@.str7498, i32 0, i32 0
%.tmp7500 = call i32(i8*,i8*) @strcmp(i8* %.tmp7497, i8* %.tmp7499)
%.tmp7501 = icmp eq i32 %.tmp7500, 0
br i1 %.tmp7501, label %.if.true.7502, label %.if.false.7502
.if.true.7502:
%.tmp7503 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7504 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7503, i32 0, i32 0
%.tmp7506 = getelementptr [7 x i8], [7 x i8]*@.str7505, i32 0, i32 0
store i8* %.tmp7506, i8** %.tmp7504
%.tmp7507 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7508 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7507, i32 0, i32 1
store i8* null, i8** %.tmp7508
%.tmp7509 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7510 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7509, i32 0, i32 6
%.tmp7511 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7510
%.tmp7513 = getelementptr [5 x i8], [5 x i8]*@.str7512, i32 0, i32 0
%.tmp7514 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7511, i8* %.tmp7513)
%curr_type.7515 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7514, %m307$.Node.type** %curr_type.7515
%.tmp7516 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7517 = icmp ne %m307$.Node.type* %.tmp7516, null
br i1 %.tmp7517, label %.if.true.7518, label %.if.false.7518
.if.true.7518:
%.tmp7519 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7520 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7519, i32 0, i32 3
%.tmp7521 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7522 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7523 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7522, i32 0, i32 6
%.tmp7524 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7523
%.tmp7525 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7521, %m307$.Node.type* %.tmp7524)
store %m1861$.Type.type* %.tmp7525, %m1861$.Type.type** %.tmp7520
%.tmp7526 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7527 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7526, i32 0, i32 3
%.tmp7528 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7527
%.tmp7529 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7528, i32 0, i32 1
%.tmp7530 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7531 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7530, i32 0, i32 7
%.tmp7532 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7531
%.tmp7533 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7532, i32 0, i32 1
%.tmp7534 = load i8*, i8** %.tmp7533
store i8* %.tmp7534, i8** %.tmp7529
%.tmp7535 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7536 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7535, i32 0, i32 3
%.tmp7537 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7536
%curr_t.7538 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7537, %m1861$.Type.type** %curr_t.7538
%.tmp7540 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7541 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7540, i32 0, i32 7
%.tmp7542 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7541
%.tmp7544 = getelementptr [5 x i8], [5 x i8]*@.str7543, i32 0, i32 0
%.tmp7545 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7542, i8* %.tmp7544)
store %m307$.Node.type* %.tmp7545, %m307$.Node.type** %curr_type.7515
br label %.for.start.7539
.for.start.7539:
%.tmp7546 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7547 = icmp ne %m307$.Node.type* %.tmp7546, null
br i1 %.tmp7547, label %.for.continue.7539, label %.for.end.7539
.for.continue.7539:
%.tmp7548 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7538
%.tmp7549 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7548, i32 0, i32 4
%.tmp7550 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7551 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7552 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7551, i32 0, i32 6
%.tmp7553 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7552
%.tmp7554 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7550, %m307$.Node.type* %.tmp7553)
store %m1861$.Type.type* %.tmp7554, %m1861$.Type.type** %.tmp7549
%.tmp7555 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7538
%.tmp7556 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7555, i32 0, i32 4
%.tmp7557 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7556
%.tmp7558 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7557, i32 0, i32 1
%.tmp7559 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7560 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7559, i32 0, i32 7
%.tmp7561 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7560
%.tmp7562 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7561, i32 0, i32 1
%.tmp7563 = load i8*, i8** %.tmp7562
store i8* %.tmp7563, i8** %.tmp7558
%.tmp7564 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7538
%.tmp7565 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7564, i32 0, i32 4
%.tmp7566 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7565
store %m1861$.Type.type* %.tmp7566, %m1861$.Type.type** %curr_t.7538
%.tmp7567 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7515
%.tmp7568 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7567, i32 0, i32 7
%.tmp7569 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7568
%.tmp7571 = getelementptr [5 x i8], [5 x i8]*@.str7570, i32 0, i32 0
%.tmp7572 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7569, i8* %.tmp7571)
store %m307$.Node.type* %.tmp7572, %m307$.Node.type** %curr_type.7515
br label %.for.start.7539
.for.end.7539:
br label %.if.end.7518
.if.false.7518:
br label %.if.end.7518
.if.end.7518:
br label %.if.end.7502
.if.false.7502:
%.tmp7573 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7574 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7573, i32 0, i32 0
%.tmp7575 = load i8*, i8** %.tmp7574
%.tmp7577 = getelementptr [12 x i8], [12 x i8]*@.str7576, i32 0, i32 0
%.tmp7578 = call i32(i8*,i8*) @strcmp(i8* %.tmp7575, i8* %.tmp7577)
%.tmp7579 = icmp eq i32 %.tmp7578, 0
br i1 %.tmp7579, label %.if.true.7580, label %.if.false.7580
.if.true.7580:
%err_msg.7581 = alloca i8*
store i8* null, i8** %err_msg.7581
%.tmp7582 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7583 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7584 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7582, %m307$.Node.type* %.tmp7583)
%base.7585 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp7584, %m1861$.ScopeItem.type** %base.7585
%.tmp7586 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7585
%.tmp7587 = icmp eq %m1861$.ScopeItem.type* %.tmp7586, null
br i1 %.tmp7587, label %.if.true.7588, label %.if.false.7588
.if.true.7588:
%.tmp7589 = getelementptr i8*, i8** %err_msg.7581, i32 0
%.tmp7591 = getelementptr [37 x i8], [37 x i8]*@.str7590, i32 0, i32 0
%.tmp7592 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7593 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7592, i32 0, i32 6
%.tmp7594 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7593
%.tmp7595 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7594, i32 0, i32 1
%.tmp7596 = load i8*, i8** %.tmp7595
%.tmp7597 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7589, i8* %.tmp7591, i8* %.tmp7596)
%.tmp7598 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7599 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7600 = load i8*, i8** %err_msg.7581
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7598, %m307$.Node.type* %.tmp7599, i8* %.tmp7600)
%.tmp7601 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7602 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7601, i32 0, i32 0
%.tmp7604 = getelementptr [6 x i8], [6 x i8]*@.str7603, i32 0, i32 0
store i8* %.tmp7604, i8** %.tmp7602
%.tmp7605 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
ret %m1861$.Type.type* %.tmp7605
br label %.if.end.7588
.if.false.7588:
br label %.if.end.7588
.if.end.7588:
%.tmp7606 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7607 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7606, i32 0, i32 0
%.tmp7609 = getelementptr [10 x i8], [10 x i8]*@.str7608, i32 0, i32 0
store i8* %.tmp7609, i8** %.tmp7607
%.tmp7610 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7611 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7610, i32 0, i32 1
%.tmp7612 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7585
%.tmp7613 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7612, i32 0, i32 0
%.tmp7614 = load i8*, i8** %.tmp7613
store i8* %.tmp7614, i8** %.tmp7611
%.tmp7615 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7616 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7615, i32 0, i32 2
%.tmp7617 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7585
%.tmp7618 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7617, i32 0, i32 1
%.tmp7619 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7618
%.tmp7620 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7619, i32 0, i32 0
%.tmp7621 = load i8*, i8** %.tmp7620
store i8* %.tmp7621, i8** %.tmp7616
%.tmp7622 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7623 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7622, i32 0, i32 3
%.tmp7624 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7585
%.tmp7625 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7624, i32 0, i32 1
%.tmp7626 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7625
%.tmp7627 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7626, i32 0, i32 3
%.tmp7628 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7627
store %m1861$.Type.type* %.tmp7628, %m1861$.Type.type** %.tmp7623
br label %.if.end.7580
.if.false.7580:
%.tmp7629 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7630 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7629, i32 0, i32 1
%.tmp7631 = load i8*, i8** %.tmp7630
%.tmp7633 = getelementptr [4 x i8], [4 x i8]*@.str7632, i32 0, i32 0
%.tmp7634 = call i32(i8*,i8*) @strcmp(i8* %.tmp7631, i8* %.tmp7633)
%.tmp7635 = icmp eq i32 %.tmp7634, 0
br i1 %.tmp7635, label %.if.true.7636, label %.if.false.7636
.if.true.7636:
%.tmp7637 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7638 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7637, i32 0, i32 0
%.tmp7640 = getelementptr [4 x i8], [4 x i8]*@.str7639, i32 0, i32 0
store i8* %.tmp7640, i8** %.tmp7638
%.tmp7641 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7642 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7641, i32 0, i32 3
%.tmp7643 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7643, %m1861$.Type.type** %.tmp7642
%.tmp7644 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7645 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7644, i32 0, i32 3
%.tmp7646 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7645
%.tmp7647 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7646, i32 0, i32 0
%.tmp7649 = getelementptr [4 x i8], [4 x i8]*@.str7648, i32 0, i32 0
store i8* %.tmp7649, i8** %.tmp7647
br label %.if.end.7636
.if.false.7636:
%.tmp7650 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7651 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7650, i32 0, i32 0
%.tmp7652 = load i8*, i8** %.tmp7651
%.tmp7654 = getelementptr [5 x i8], [5 x i8]*@.str7653, i32 0, i32 0
%.tmp7655 = call i32(i8*,i8*) @strcmp(i8* %.tmp7652, i8* %.tmp7654)
%.tmp7656 = icmp eq i32 %.tmp7655, 0
br i1 %.tmp7656, label %.if.true.7657, label %.if.false.7657
.if.true.7657:
%.tmp7658 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7659 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7658, i32 0, i32 0
%.tmp7660 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7661 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7660, i32 0, i32 1
%.tmp7662 = load i8*, i8** %.tmp7661
store i8* %.tmp7662, i8** %.tmp7659
br label %.if.end.7657
.if.false.7657:
%.tmp7663 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7664 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7663, i32 0, i32 1
%.tmp7665 = load i8*, i8** %.tmp7664
%.tmp7667 = getelementptr [4 x i8], [4 x i8]*@.str7666, i32 0, i32 0
%.tmp7668 = call i32(i8*,i8*) @strcmp(i8* %.tmp7665, i8* %.tmp7667)
%.tmp7669 = icmp eq i32 %.tmp7668, 0
br i1 %.tmp7669, label %.if.true.7670, label %.if.false.7670
.if.true.7670:
%.tmp7671 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
%.tmp7672 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7671, i32 0, i32 0
%.tmp7674 = getelementptr [7 x i8], [7 x i8]*@.str7673, i32 0, i32 0
store i8* %.tmp7674, i8** %.tmp7672
br label %.if.end.7670
.if.false.7670:
%.tmp7675 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7676 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7678 = getelementptr [54 x i8], [54 x i8]*@.str7677, i32 0, i32 0
%.tmp7679 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7675, %m307$.Node.type* %.tmp7676, i8* %.tmp7678)
%.tmp7680 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7681 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7680, i32 0, i32 0
%.tmp7682 = load i8*, i8** %.tmp7681
%.tmp7683 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7684 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7683, i32 0, i32 1
%.tmp7685 = load i8*, i8** %.tmp7684
%.tmp7686 = call i32(i8*,...) @printf(i8* %.tmp7679, i8* %.tmp7682, i8* %.tmp7685)
%.tmp7687 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7687
br label %.if.end.7670
.if.end.7670:
br label %.if.end.7657
.if.end.7657:
br label %.if.end.7636
.if.end.7636:
br label %.if.end.7580
.if.end.7580:
br label %.if.end.7502
.if.end.7502:
%.tmp7689 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7690 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7689, i32 0, i32 7
%.tmp7691 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7690
%ptr.7692 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7691, %m307$.Node.type** %ptr.7692
br label %.for.start.7688
.for.start.7688:
%.tmp7693 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7694 = icmp ne %m307$.Node.type* %.tmp7693, null
br i1 %.tmp7694, label %.for.continue.7688, label %.for.end.7688
.for.continue.7688:
%.tmp7695 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7696 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7695, i32 0, i32 1
%.tmp7697 = load i8*, i8** %.tmp7696
%.tmp7699 = getelementptr [2 x i8], [2 x i8]*@.str7698, i32 0, i32 0
%.tmp7700 = call i32(i8*,i8*) @strcmp(i8* %.tmp7697, i8* %.tmp7699)
%.tmp7701 = icmp eq i32 %.tmp7700, 0
br i1 %.tmp7701, label %.if.true.7702, label %.if.false.7702
.if.true.7702:
%.tmp7703 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.7704 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7703, %m1861$.Type.type** %pt.7704
%.tmp7705 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7704
%.tmp7706 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7705, i32 0, i32 0
%.tmp7708 = getelementptr [4 x i8], [4 x i8]*@.str7707, i32 0, i32 0
store i8* %.tmp7708, i8** %.tmp7706
%.tmp7709 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7704
%.tmp7710 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7709, i32 0, i32 3
%.tmp7711 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
store %m1861$.Type.type* %.tmp7711, %m1861$.Type.type** %.tmp7710
%.tmp7712 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7704
store %m1861$.Type.type* %.tmp7712, %m1861$.Type.type** %t.7494
br label %.if.end.7702
.if.false.7702:
%.tmp7713 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7714 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7713, i32 0, i32 1
%.tmp7715 = load i8*, i8** %.tmp7714
%.tmp7717 = getelementptr [2 x i8], [2 x i8]*@.str7716, i32 0, i32 0
%.tmp7718 = call i32(i8*,i8*) @strcmp(i8* %.tmp7715, i8* %.tmp7717)
%.tmp7719 = icmp eq i32 %.tmp7718, 0
br i1 %.tmp7719, label %.if.true.7720, label %.if.false.7720
.if.true.7720:
%.tmp7721 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7722 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7721, i32 0, i32 7
%.tmp7723 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7722
%.tmp7724 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7723, i32 0, i32 1
%.tmp7725 = load i8*, i8** %.tmp7724
%.tmp7727 = getelementptr [2 x i8], [2 x i8]*@.str7726, i32 0, i32 0
%.tmp7728 = call i32(i8*,i8*) @strcmp(i8* %.tmp7725, i8* %.tmp7727)
%.tmp7729 = icmp eq i32 %.tmp7728, 0
br i1 %.tmp7729, label %.if.true.7730, label %.if.false.7730
.if.true.7730:
%.tmp7731 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.7732 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7731, %m1861$.Type.type** %slice_type.7732
%.tmp7733 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7732
%.tmp7734 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7733, i32 0, i32 0
%.tmp7736 = getelementptr [7 x i8], [7 x i8]*@.str7735, i32 0, i32 0
store i8* %.tmp7736, i8** %.tmp7734
%.tmp7737 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.7738 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7737, %m1861$.Type.type** %slice_c_array.7738
%.tmp7739 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7738
%.tmp7740 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7739, i32 0, i32 0
%.tmp7742 = getelementptr [4 x i8], [4 x i8]*@.str7741, i32 0, i32 0
store i8* %.tmp7742, i8** %.tmp7740
%.tmp7743 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7738
%.tmp7744 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7743, i32 0, i32 1
%.tmp7746 = getelementptr [6 x i8], [6 x i8]*@.str7745, i32 0, i32 0
store i8* %.tmp7746, i8** %.tmp7744
%.tmp7747 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7738
%.tmp7748 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7747, i32 0, i32 3
%.tmp7749 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
store %m1861$.Type.type* %.tmp7749, %m1861$.Type.type** %.tmp7748
%.tmp7750 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7732
%.tmp7751 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7750, i32 0, i32 3
%.tmp7752 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7738
store %m1861$.Type.type* %.tmp7752, %m1861$.Type.type** %.tmp7751
%.tmp7753 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.7754 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7753, %m1861$.Type.type** %slice_len.7754
%.tmp7755 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7754
%.tmp7756 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7755, i32 0, i32 0
%.tmp7758 = getelementptr [4 x i8], [4 x i8]*@.str7757, i32 0, i32 0
store i8* %.tmp7758, i8** %.tmp7756
%.tmp7759 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7754
%.tmp7760 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7759, i32 0, i32 1
%.tmp7762 = getelementptr [4 x i8], [4 x i8]*@.str7761, i32 0, i32 0
store i8* %.tmp7762, i8** %.tmp7760
%.tmp7763 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7738
%.tmp7764 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7763, i32 0, i32 4
%.tmp7765 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7754
store %m1861$.Type.type* %.tmp7765, %m1861$.Type.type** %.tmp7764
%.tmp7766 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.7767 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7766, %m1861$.Type.type** %slice_cap.7767
%.tmp7768 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7767
%.tmp7769 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7768, i32 0, i32 0
%.tmp7771 = getelementptr [4 x i8], [4 x i8]*@.str7770, i32 0, i32 0
store i8* %.tmp7771, i8** %.tmp7769
%.tmp7772 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7767
%.tmp7773 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7772, i32 0, i32 1
%.tmp7775 = getelementptr [4 x i8], [4 x i8]*@.str7774, i32 0, i32 0
store i8* %.tmp7775, i8** %.tmp7773
%.tmp7776 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7754
%.tmp7777 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7776, i32 0, i32 4
%.tmp7778 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7767
store %m1861$.Type.type* %.tmp7778, %m1861$.Type.type** %.tmp7777
%.tmp7779 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7732
store %m1861$.Type.type* %.tmp7779, %m1861$.Type.type** %t.7494
%.tmp7780 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7781 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7780, i32 0, i32 7
%.tmp7782 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7781
store %m307$.Node.type* %.tmp7782, %m307$.Node.type** %ptr.7692
br label %.if.end.7730
.if.false.7730:
br label %.if.end.7730
.if.end.7730:
br label %.if.end.7720
.if.false.7720:
%.tmp7783 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7784 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7786 = getelementptr [49 x i8], [49 x i8]*@.str7785, i32 0, i32 0
%.tmp7787 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7783, %m307$.Node.type* %.tmp7784, i8* %.tmp7786)
%.tmp7788 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7789 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7788, i32 0, i32 1
%.tmp7790 = load i8*, i8** %.tmp7789
%.tmp7791 = call i32(i8*,...) @printf(i8* %.tmp7787, i8* %.tmp7790)
%.tmp7792 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7792
br label %.if.end.7720
.if.end.7720:
br label %.if.end.7702
.if.end.7702:
%.tmp7793 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7692
%.tmp7794 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7793, i32 0, i32 7
%.tmp7795 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7794
store %m307$.Node.type* %.tmp7795, %m307$.Node.type** %ptr.7692
br label %.for.start.7688
.for.end.7688:
%.tmp7796 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7494
ret %m1861$.Type.type* %.tmp7796
}
@.str2657 = constant [5 x i8] c"%s{\0A\00"
@.str2661 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2668 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2675 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2687 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2691 = constant [10 x i8] c"%s  of: \0A\00"
@.str2705 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2709 = constant [12 x i8] c"%s  next: \0A\00"
@.str2718 = constant [5 x i8] c"%s}\0A\00"
@.str2778 = constant [5 x i8] c"%c%s\00"
@.str2790 = constant [7 x i8] c".tmp%d\00"
@.str2871 = constant [1 x i8] c"\00"
@.str2913 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2950 = constant [6 x i8] c"start\00"
@.str3003 = constant [6 x i8] c"start\00"
@.str3009 = constant [7 x i8] c"global\00"
@.str3020 = constant [13 x i8] c"head_comment\00"
@.str3059 = constant [7 x i8] c"string\00"
@.str3068 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3101 = constant [5 x i8] c"%s%s\00"
@.str3109 = constant [9 x i8] c"function\00"
@.str3115 = constant [5 x i8] c"main\00"
@.str3130 = constant [6 x i8] c"%s.%s\00"
@.str3151 = constant [3 x i8] c"NL\00"
@.str3159 = constant [7 x i8] c"global\00"
@.str3167 = constant [11 x i8] c"assignable\00"
@.str3198 = constant [9 x i8] c"variable\00"
@.str3209 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3224 = constant [10 x i8] c"typealias\00"
@.str3246 = constant [11 x i8] c"%s.%s.type\00"
@.str3258 = constant [10 x i8] c"typealias\00"
@.str3279 = constant [5 x i8] c"type\00"
@.str3309 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3322 = constant [7 x i8] c"extern\00"
@.str3340 = constant [7 x i8] c"extern\00"
@.str3380 = constant [15 x i8] c"declare %s %s(\00"
@.str3412 = constant [3 x i8] c", \00"
@.str3418 = constant [3 x i8] c"%s\00"
@.str3430 = constant [3 x i8] c")\0A\00"
@.str3441 = constant [9 x i8] c"function\00"
@.str3450 = constant [9 x i8] c"function\00"
@.str3488 = constant [14 x i8] c"define %s %s(\00"
@.str3517 = constant [3 x i8] c", \00"
@.str3523 = constant [5 x i8] c"type\00"
@.str3539 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3554 = constant [5 x i8] c") {\0A\00"
@.str3558 = constant [9 x i8] c"function\00"
@.str3567 = constant [6 x i8] c"block\00"
@.str3588 = constant [3 x i8] c"NL\00"
@.str3595 = constant [9 x i8] c"OPERATOR\00"
@.str3614 = constant [7 x i8] c"return\00"
@.str3624 = constant [5 x i8] c"void\00"
@.str3631 = constant [21 x i8] c"missing return value\00"
@.str3636 = constant [10 x i8] c"ret void\0A\00"
@.str3642 = constant [3 x i8] c"}\0A\00"
@.str3648 = constant [7 x i8] c"import\00"
@.str3699 = constant [1 x i8] c"\00"
@.str3705 = constant [6 x i8] c"%s.bn\00"
@.str3710 = constant [9 x i8] c"%s/%s.bn\00"
@.str3722 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3783 = constant [5 x i8] c"m%d$\00"
@.str3833 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3842 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3874 = constant [9 x i8] c"variable\00"
@.str3879 = constant [5 x i8] c"type\00"
@.str3911 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3923 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3935 = constant [6 x i8] c"block\00"
@.str3949 = constant [11 x i8] c"expression\00"
@.str3971 = constant [7 x i8] c"struct\00"
@.str3976 = constant [7 x i8] c"WhAT!\0A\00"
@.str4016 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4028 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4054 = constant [7 x i8] c"struct\00"
@.str4059 = constant [7 x i8] c"WhAT!\0A\00"
@.str4090 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4102 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4127 = constant [7 x i8] c"sizeof\00"
@.str4133 = constant [8 x i8] c"fn_args\00"
@.str4140 = constant [11 x i8] c"assignable\00"
@.str4168 = constant [4 x i8] c"int\00"
@.str4181 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4190 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4201 = constant [7 x i8] c"append\00"
@.str4207 = constant [8 x i8] c"fn_args\00"
@.str4214 = constant [11 x i8] c"assignable\00"
@.str4221 = constant [11 x i8] c"assignable\00"
@.str4245 = constant [5 x i8] c".b%d\00"
@.str4278 = constant [4 x i8] c"len\00"
@.str4284 = constant [8 x i8] c"fn_args\00"
@.str4291 = constant [11 x i8] c"assignable\00"
@.str4317 = constant [35 x i8] c"unable to compile function address\00"
@.str4323 = constant [8 x i8] c"fn_args\00"
@.str4327 = constant [1 x i8] c"\00"
@.str4337 = constant [11 x i8] c"assignable\00"
@.str4351 = constant [5 x i8] c"%s, \00"
@.str4369 = constant [8 x i8] c"%s%s %s\00"
@.str4384 = constant [11 x i8] c"assignable\00"
@.str4394 = constant [5 x i8] c"void\00"
@.str4402 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4434 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4460 = constant [7 x i8] c"return\00"
@.str4472 = constant [3 x i8] c"NL\00"
@.str4490 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4503 = constant [10 x i8] c"ret void\0A\00"
@.str4507 = constant [3 x i8] c"NL\00"
@.str4513 = constant [8 x i8] c"fn_call\00"
@.str4524 = constant [12 x i8] c"declaration\00"
@.str4533 = constant [11 x i8] c"assignment\00"
@.str4541 = constant [11 x i8] c"assignable\00"
@.str4572 = constant [4 x i8] c"ptr\00"
@.str4581 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4591 = constant [9 x i8] c"if_block\00"
@.str4599 = constant [9 x i8] c"for_loop\00"
@.str4607 = constant [8 x i8] c"keyword\00"
@.str4625 = constant [6 x i8] c"break\00"
@.str4639 = constant [4 x i8] c"for\00"
@.str4647 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4661 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4668 = constant [9 x i8] c"continue\00"
@.str4682 = constant [4 x i8] c"for\00"
@.str4690 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4704 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4708 = constant [29 x i8] c"Keyword '%s' not implemented\00"
@.str4719 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4738 = constant [14 x i8] c".for.start.%d\00"
@.str4743 = constant [12 x i8] c".for.end.%d\00"
@.str4748 = constant [4 x i8] c"for\00"
@.str4755 = constant [12 x i8] c"declaration\00"
@.str4766 = constant [11 x i8] c"assignment\00"
@.str4776 = constant [9 x i8] c"OPERATOR\00"
@.str4783 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4794 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4801 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4808 = constant [9 x i8] c"OPERATOR\00"
@.str4819 = constant [9 x i8] c"OPERATOR\00"
@.str4826 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str4835 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4850 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4857 = constant [9 x i8] c"OPERATOR\00"
@.str4866 = constant [6 x i8] c"block\00"
@.str4881 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4888 = constant [5 x i8] c"%s:\0A\00"
@.str4902 = constant [5 x i8] c"type\00"
@.str4917 = constant [11 x i8] c"assignable\00"
@.str4932 = constant [9 x i8] c"variable\00"
@.str4937 = constant [5 x i8] c"WORD\00"
@.str4946 = constant [31 x i8] c"unable to get declaration name\00"
@.str4966 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str4978 = constant [6 x i8] c"%s.%d\00"
@.str5035 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5051 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5063 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5104 = constant [4 x i8] c"int\00"
@.str5111 = constant [4 x i8] c"chr\00"
@.str5119 = constant [5 x i8] c"bool\00"
@.str5128 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5137 = constant [4 x i8] c"ptr\00"
@.str5145 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5148 = constant [5 x i8] c"null\00"
@.str5156 = constant [7 x i8] c"struct\00"
@.str5177 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5197 = constant [10 x i8] c"typealias\00"
@.str5220 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5239 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5256 = constant [11 x i8] c"assignable\00"
@.str5273 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5288 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5295 = constant [6 x i8] c"block\00"
@.str5304 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5311 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5318 = constant [11 x i8] c"elif_block\00"
@.str5330 = constant [11 x i8] c"else_block\00"
@.str5340 = constant [6 x i8] c"block\00"
@.str5350 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5357 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5378 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5387 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5441 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5462 = constant [7 x i8] c"module\00"
@.str5515 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5552 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5560 = constant [9 x i8] c"function\00"
@.str5567 = constant [7 x i8] c"extern\00"
@.str5579 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5600 = constant [9 x i8] c"variable\00"
@.str5622 = constant [4 x i8] c"ptr\00"
@.str5641 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5665 = constant [10 x i8] c"typealias\00"
@.str5676 = constant [7 x i8] c"struct\00"
@.str5682 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5734 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5755 = constant [9 x i8] c"variable\00"
@.str5766 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5787 = constant [9 x i8] c"variable\00"
@.str5795 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5809 = constant [17 x i8] c"addr_destination\00"
@.str5816 = constant [16 x i8] c"mono_assignable\00"
@.str5824 = constant [11 x i8] c"assignable\00"
@.str5838 = constant [12 x i8] c"destination\00"
@.str5843 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5871 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5890 = constant [7 x i8] c"module\00"
@.str5912 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str5983 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6004 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6028 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6051 = constant [16 x i8] c"mono_assignable\00"
@.str6077 = constant [5 x i8] c"cast\00"
@.str6087 = constant [5 x i8] c"type\00"
@.str6112 = constant [8 x i8] c"bitcast\00"
@.str6120 = constant [4 x i8] c"ptr\00"
@.str6127 = constant [4 x i8] c"ptr\00"
@.str6146 = constant [4 x i8] c"i%d\00"
@.str6151 = constant [4 x i8] c"i%d\00"
@.str6159 = constant [5 x i8] c"sext\00"
@.str6161 = constant [6 x i8] c"trunc\00"
@.str6166 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6186 = constant [16 x i8] c"mono_assignable\00"
@.str6248 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6271 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6278 = constant [2 x i8] c"+\00"
@.str6283 = constant [4 x i8] c"add\00"
@.str6288 = constant [2 x i8] c"-\00"
@.str6293 = constant [4 x i8] c"sub\00"
@.str6298 = constant [2 x i8] c"*\00"
@.str6303 = constant [4 x i8] c"mul\00"
@.str6308 = constant [2 x i8] c"/\00"
@.str6313 = constant [5 x i8] c"sdiv\00"
@.str6318 = constant [3 x i8] c"==\00"
@.str6323 = constant [8 x i8] c"icmp eq\00"
@.str6328 = constant [3 x i8] c"!=\00"
@.str6333 = constant [8 x i8] c"icmp ne\00"
@.str6338 = constant [2 x i8] c">\00"
@.str6343 = constant [9 x i8] c"icmp sgt\00"
@.str6348 = constant [2 x i8] c"<\00"
@.str6353 = constant [9 x i8] c"icmp slt\00"
@.str6358 = constant [2 x i8] c"&\00"
@.str6363 = constant [4 x i8] c"and\00"
@.str6368 = constant [2 x i8] c"|\00"
@.str6373 = constant [3 x i8] c"or\00"
@.str6378 = constant [3 x i8] c">=\00"
@.str6383 = constant [9 x i8] c"icmp sge\00"
@.str6388 = constant [3 x i8] c"<=\00"
@.str6393 = constant [9 x i8] c"icmp sle\00"
@.str6397 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6404 = constant [4 x i8] c"add\00"
@.str6411 = constant [3 x i8] c"==\00"
@.str6418 = constant [3 x i8] c"!=\00"
@.str6426 = constant [2 x i8] c"|\00"
@.str6434 = constant [2 x i8] c"&\00"
@.str6442 = constant [2 x i8] c">\00"
@.str6450 = constant [2 x i8] c"<\00"
@.str6458 = constant [3 x i8] c">=\00"
@.str6466 = constant [3 x i8] c"<=\00"
@.str6474 = constant [5 x i8] c"bool\00"
@.str6478 = constant [4 x i8] c"int\00"
@.str6492 = constant [7 x i8] c"NUMBER\00"
@.str6506 = constant [4 x i8] c"int\00"
@.str6520 = constant [5 x i8] c"WORD\00"
@.str6530 = constant [5 x i8] c"null\00"
@.str6537 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str6551 = constant [5 x i8] c"null\00"
@.str6560 = constant [8 x i8] c"nullptr\00"
@.str6567 = constant [17 x i8] c"addr_destination\00"
@.str6579 = constant [12 x i8] c"destination\00"
@.str6623 = constant [4 x i8] c"ptr\00"
@.str6642 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6654 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6668 = constant [8 x i8] c"boolean\00"
@.str6682 = constant [5 x i8] c"bool\00"
@.str6691 = constant [6 x i8] c"false\00"
@.str6698 = constant [2 x i8] c"0\00"
@.str6702 = constant [2 x i8] c"1\00"
@.str6709 = constant [8 x i8] c"fn_call\00"
@.str6726 = constant [7 x i8] c"STRING\00"
@.str6752 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6768 = constant [4 x i8] c"ptr\00"
@.str6781 = constant [4 x i8] c"chr\00"
@.str6788 = constant [4 x i8] c"CHR\00"
@.str6804 = constant [2 x i8] c"0\00"
@.str6820 = constant [22 x i8] c"Invalid character: %s\00"
@.str6836 = constant [4 x i8] c"chr\00"
@.str6840 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6868 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6874 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6879 = constant [4 x i8] c"int\00"
@.str6884 = constant [2 x i8] c"i\00"
@.str6889 = constant [5 x i8] c"bool\00"
@.str6894 = constant [2 x i8] c"b\00"
@.str6899 = constant [5 x i8] c"void\00"
@.str6904 = constant [2 x i8] c"v\00"
@.str6909 = constant [4 x i8] c"chr\00"
@.str6914 = constant [2 x i8] c"c\00"
@.str6919 = constant [4 x i8] c"ptr\00"
@.str6926 = constant [4 x i8] c"%sp\00"
@.str6937 = constant [10 x i8] c"typealias\00"
@.str6948 = constant [6 x i8] c"error\00"
@.str6953 = constant [2 x i8] c"?\00"
@.str6955 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str6967 = constant [7 x i8] c".str%d\00"
@.str6991 = constant [6 x i8] c"array\00"
@.str7004 = constant [4 x i8] c"chr\00"
@.str7022 = constant [3 x i8] c"%d\00"
@.str7031 = constant [7 x i8] c"string\00"
@.str7051 = constant [7 x i8] c"module\00"
@.str7086 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7092 = constant [2 x i8] c"?\00"
@.str7098 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7104 = constant [4 x i8] c"int\00"
@.str7109 = constant [4 x i8] c"i32\00"
@.str7114 = constant [5 x i8] c"void\00"
@.str7119 = constant [5 x i8] c"void\00"
@.str7124 = constant [5 x i8] c"bool\00"
@.str7129 = constant [3 x i8] c"i1\00"
@.str7134 = constant [8 x i8] c"nullptr\00"
@.str7139 = constant [4 x i8] c"ptr\00"
@.str7144 = constant [4 x i8] c"chr\00"
@.str7149 = constant [3 x i8] c"i8\00"
@.str7154 = constant [9 x i8] c"function\00"
@.str7160 = constant [4 x i8] c"%s(\00"
@.str7186 = constant [4 x i8] c"%s,\00"
@.str7191 = constant [5 x i8] c"%s%s\00"
@.str7202 = constant [4 x i8] c"%s)\00"
@.str7210 = constant [4 x i8] c"ptr\00"
@.str7216 = constant [4 x i8] c"%s*\00"
@.str7228 = constant [7 x i8] c"struct\00"
@.str7234 = constant [2 x i8] c"{\00"
@.str7251 = constant [4 x i8] c"%s,\00"
@.str7256 = constant [5 x i8] c"%s%s\00"
@.str7267 = constant [4 x i8] c"%s}\00"
@.str7275 = constant [6 x i8] c"array\00"
@.str7281 = constant [10 x i8] c"[%s x %s]\00"
@.str7300 = constant [10 x i8] c"typealias\00"
@.str7306 = constant [5 x i8] c"%%%s\00"
@.str7316 = constant [7 x i8] c"vararg\00"
@.str7321 = constant [4 x i8] c"...\00"
@.str7326 = constant [6 x i8] c"error\00"
@.str7331 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7407 = constant [9 x i8] c"function\00"
@.str7425 = constant [5 x i8] c"WORD\00"
@.str7482 = constant [10 x i8] c"fn_params\00"
@.str7498 = constant [10 x i8] c"structdef\00"
@.str7505 = constant [7 x i8] c"struct\00"
@.str7512 = constant [5 x i8] c"type\00"
@.str7543 = constant [5 x i8] c"type\00"
@.str7570 = constant [5 x i8] c"type\00"
@.str7576 = constant [12 x i8] c"dotted_name\00"
@.str7590 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str7603 = constant [6 x i8] c"error\00"
@.str7608 = constant [10 x i8] c"typealias\00"
@.str7632 = constant [4 x i8] c"str\00"
@.str7639 = constant [4 x i8] c"ptr\00"
@.str7648 = constant [4 x i8] c"chr\00"
@.str7653 = constant [5 x i8] c"WORD\00"
@.str7666 = constant [4 x i8] c"...\00"
@.str7673 = constant [7 x i8] c"vararg\00"
@.str7677 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7698 = constant [2 x i8] c"*\00"
@.str7707 = constant [4 x i8] c"ptr\00"
@.str7716 = constant [2 x i8] c"[\00"
@.str7726 = constant [2 x i8] c"]\00"
@.str7735 = constant [7 x i8] c"struct\00"
@.str7741 = constant [4 x i8] c"ptr\00"
@.str7745 = constant [6 x i8] c"c_arr\00"
@.str7757 = constant [4 x i8] c"int\00"
@.str7761 = constant [4 x i8] c"len\00"
@.str7770 = constant [4 x i8] c"int\00"
@.str7774 = constant [4 x i8] c"cap\00"
@.str7785 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7797 = load i32, i32* %argc
%.tmp7798 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7797, i8** %.tmp7798)
%.tmp7799 = load i32, i32* @STDERR
%.tmp7801 = getelementptr [2 x i8], [2 x i8]*@.str7800, i32 0, i32 0
%.tmp7802 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7799, i8* %.tmp7801)
%stderr.7803 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7802, %m0$.File.type** %stderr.7803
%.tmp7804 = load i8**, i8*** %argv
%.tmp7805 = getelementptr i8*, i8** %.tmp7804, i32 1
%.tmp7806 = load i8*, i8** %.tmp7805
%filename.7807 = alloca i8*
store i8* %.tmp7806, i8** %filename.7807
%.tmp7808 = call %m0$.File.type*() @tmpfile()
%llvm_code.7809 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7808, %m0$.File.type** %llvm_code.7809
%.tmp7810 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7809
%.tmp7811 = load i8*, i8** %filename.7807
%.tmp7812 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7810, i8* %.tmp7811)
%compiler_ctx.7813 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp7812, %m1861$.CompilerCtx.type** %compiler_ctx.7813
%.tmp7814 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.7813
%.tmp7815 = load i8*, i8** %filename.7807
%.tmp7816 = call i1(%m1861$.CompilerCtx.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp7814, i8* %.tmp7815)
br i1 %.tmp7816, label %.if.true.7817, label %.if.false.7817
.if.true.7817:
%.tmp7818 = load %m0$.File.type*, %m0$.File.type** %stderr.7803
%.tmp7820 = getelementptr [34 x i8], [34 x i8]*@.str7819, i32 0, i32 0
%.tmp7821 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7818, i8* %.tmp7820)
ret i32 1
br label %.if.end.7817
.if.false.7817:
br label %.if.end.7817
.if.end.7817:
%.tmp7822 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7809
%.tmp7823 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7822)
%.tmp7824 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7809
%.tmp7825 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7824)
%llvm_code_size.7826 = alloca i32
store i32 %.tmp7825, i32* %llvm_code_size.7826
%.tmp7827 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7809
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7827)
%.tmp7829 = getelementptr [30 x i8], [30 x i8]*@.str7828, i32 0, i32 0
%.tmp7831 = getelementptr [2 x i8], [2 x i8]*@.str7830, i32 0, i32 0
%.tmp7832 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7829, i8* %.tmp7831)
%proc.7833 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7832, %m0$.File.type** %proc.7833
%.tmp7834 = load %m0$.File.type*, %m0$.File.type** %proc.7833
%.tmp7835 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7834)
%.tmp7836 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7809
%.tmp7837 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7836)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7835, i32 %.tmp7837)
%.tmp7838 = load %m0$.File.type*, %m0$.File.type** %proc.7833
%.tmp7839 = icmp eq %m0$.File.type* %.tmp7838, null
br i1 %.tmp7839, label %.if.true.7840, label %.if.false.7840
.if.true.7840:
%.tmp7841 = load %m0$.File.type*, %m0$.File.type** %stderr.7803
%.tmp7843 = getelementptr [28 x i8], [28 x i8]*@.str7842, i32 0, i32 0
%.tmp7844 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7841, i8* %.tmp7843)
ret i32 0
br label %.if.end.7840
.if.false.7840:
br label %.if.end.7840
.if.end.7840:
%.tmp7845 = load %m0$.File.type*, %m0$.File.type** %proc.7833
%.tmp7846 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7845)
%.tmp7847 = icmp ne i32 %.tmp7846, 0
br i1 %.tmp7847, label %.if.true.7848, label %.if.false.7848
.if.true.7848:
%.tmp7849 = load %m0$.File.type*, %m0$.File.type** %stderr.7803
%.tmp7851 = getelementptr [24 x i8], [24 x i8]*@.str7850, i32 0, i32 0
%.tmp7852 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7849, i8* %.tmp7851)
ret i32 0
br label %.if.end.7848
.if.false.7848:
br label %.if.end.7848
.if.end.7848:
%.tmp7854 = getelementptr [17 x i8], [17 x i8]*@.str7853, i32 0, i32 0
%.tmp7856 = getelementptr [2 x i8], [2 x i8]*@.str7855, i32 0, i32 0
%.tmp7857 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7854, i8* %.tmp7856)
%gcc_proc.7858 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7857, %m0$.File.type** %gcc_proc.7858
%.tmp7859 = load %m0$.File.type*, %m0$.File.type** %gcc_proc.7858
%.tmp7860 = icmp eq %m0$.File.type* %.tmp7859, null
br i1 %.tmp7860, label %.if.true.7861, label %.if.false.7861
.if.true.7861:
%.tmp7862 = load %m0$.File.type*, %m0$.File.type** %stderr.7803
%.tmp7864 = getelementptr [28 x i8], [28 x i8]*@.str7863, i32 0, i32 0
%.tmp7865 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7862, i8* %.tmp7864)
ret i32 0
br label %.if.end.7861
.if.false.7861:
br label %.if.end.7861
.if.end.7861:
%.tmp7866 = load %m0$.File.type*, %m0$.File.type** %proc.7833
%.tmp7867 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7866)
%.tmp7868 = icmp ne i32 %.tmp7867, 0
br i1 %.tmp7868, label %.if.true.7869, label %.if.false.7869
.if.true.7869:
%.tmp7870 = load %m0$.File.type*, %m0$.File.type** %stderr.7803
%.tmp7872 = getelementptr [23 x i8], [23 x i8]*@.str7871, i32 0, i32 0
%.tmp7873 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7870, i8* %.tmp7872)
br label %.if.end.7869
.if.false.7869:
%.tmp7875 = getelementptr [32 x i8], [32 x i8]*@.str7874, i32 0, i32 0
%.tmp7876 = load i8*, i8** %filename.7807
%.tmp7877 = call i32(i8*,...) @printf(i8* %.tmp7875, i8* %.tmp7876)
br label %.if.end.7869
.if.end.7869:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7878 = load i32, i32* %argc
%.tmp7879 = icmp eq i32 %.tmp7878, 2
br i1 %.tmp7879, label %.if.true.7880, label %.if.false.7880
.if.true.7880:
ret void
br label %.if.end.7880
.if.false.7880:
br label %.if.end.7880
.if.end.7880:
%.tmp7882 = getelementptr [21 x i8], [21 x i8]*@.str7881, i32 0, i32 0
%tmpl.7883 = alloca i8*
store i8* %.tmp7882, i8** %tmpl.7883
%.tmp7884 = load i8**, i8*** %argv
%.tmp7885 = getelementptr i8*, i8** %.tmp7884, i32 0
%.tmp7886 = load i8*, i8** %.tmp7885
%.tmp7887 = call i32(i8*) @strlen(i8* %.tmp7886)
%.tmp7888 = load i8*, i8** %tmpl.7883
%.tmp7889 = call i32(i8*) @strlen(i8* %.tmp7888)
%.tmp7890 = add i32 %.tmp7887, %.tmp7889
%len_filename.7891 = alloca i32
store i32 %.tmp7890, i32* %len_filename.7891
%.tmp7892 = load i32, i32* %len_filename.7891
%.tmp7893 = call i8*(i32) @malloc(i32 %.tmp7892)
%buf.7894 = alloca i8*
store i8* %.tmp7893, i8** %buf.7894
%.tmp7895 = load i8*, i8** %buf.7894
%.tmp7896 = load i8*, i8** %tmpl.7883
%.tmp7897 = load i8**, i8*** %argv
%.tmp7898 = getelementptr i8*, i8** %.tmp7897, i32 0
%.tmp7899 = load i8*, i8** %.tmp7898
%.tmp7900 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp7895, i8* %.tmp7896, i8* %.tmp7899)
%.tmp7901 = load i8*, i8** %buf.7894
%.tmp7902 = call i32(i8*) @puts(i8* %.tmp7901)
%.tmp7903 = load i8*, i8** %buf.7894
call void(i8*) @free(i8* %.tmp7903)
call void(i32) @exit(i32 1)
ret void
}
@.str7800 = constant [2 x i8] c"w\00"
@.str7819 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7828 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7830 = constant [2 x i8] c"w\00"
@.str7842 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7850 = constant [24 x i8] c"error on llc execution\0A\00"
@.str7853 = constant [17 x i8] c"gcc out.s -o out\00"
@.str7855 = constant [2 x i8] c"w\00"
@.str7863 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str7871 = constant [23 x i8] c"error on gcc execution\00"
@.str7874 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str7881 = constant [21 x i8] c"Usage: %s <filename>\00"
