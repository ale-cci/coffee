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
%.tmp1864 = getelementptr [1683 x i8], [1683 x i8]*@.str1863, i32 0, i32 0
ret i8* %.tmp1864
}
@.str1863 = constant [1683 x i8] c"
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
%.tmp4884 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4885 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4884, i32 0, i32 1
%.tmp4886 = load %m0$.File.type*, %m0$.File.type** %.tmp4885
%.tmp4888 = getelementptr [48 x i8], [48 x i8]*@.str4887, i32 0, i32 0
%.tmp4889 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4890 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4883
%.tmp4891 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4890, i32 0, i32 3
%.tmp4892 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4891
%.tmp4893 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4889, %m1861$.Type.type* %.tmp4892)
%.tmp4894 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.4883
%.tmp4895 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4894)
%.tmp4896 = load i32, i32* %for_id.4778
%.tmp4897 = load i8*, i8** %end_lbl.4788
%.tmp4898 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4886, i8* %.tmp4888, i8* %.tmp4893, i8* %.tmp4895, i32 %.tmp4896, i8* %.tmp4897)
%.tmp4899 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4900 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4899, i32 0, i32 1
%.tmp4901 = load %m0$.File.type*, %m0$.File.type** %.tmp4900
%.tmp4903 = getelementptr [19 x i8], [19 x i8]*@.str4902, i32 0, i32 0
%.tmp4904 = load i32, i32* %for_id.4778
%.tmp4905 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4901, i8* %.tmp4903, i32 %.tmp4904)
%.tmp4906 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4863
%.tmp4907 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4906, i32 0, i32 7
%.tmp4908 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4907
%.tmp4910 = getelementptr [9 x i8], [9 x i8]*@.str4909, i32 0, i32 0
%.tmp4911 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4908, i8* %.tmp4910)
%snd_colon.4912 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4911, %m307$.Node.type** %snd_colon.4912
%.tmp4913 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4912
%.tmp4914 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4913, i32 0, i32 7
%.tmp4915 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4914
%increment.4916 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4915, %m307$.Node.type** %increment.4916
%.tmp4917 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.4912
%.tmp4919 = getelementptr [6 x i8], [6 x i8]*@.str4918, i32 0, i32 0
%.tmp4920 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4917, i8* %.tmp4919)
%for_body.4921 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4920, %m307$.Node.type** %for_body.4921
%.tmp4922 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4923 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4921
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4922, %m307$.Node.type* %.tmp4923)
%.tmp4924 = load %m307$.Node.type*, %m307$.Node.type** %increment.4916
%.tmp4925 = load %m307$.Node.type*, %m307$.Node.type** %for_body.4921
%.tmp4926 = icmp ne %m307$.Node.type* %.tmp4924, %.tmp4925
br i1 %.tmp4926, label %.if.true.4927, label %.if.false.4927
.if.true.4927:
%.tmp4928 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4929 = load %m307$.Node.type*, %m307$.Node.type** %increment.4916
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4928, %m307$.Node.type* %.tmp4929)
br label %.if.end.4927
.if.false.4927:
br label %.if.end.4927
.if.end.4927:
%.tmp4930 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4931 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4930, i32 0, i32 1
%.tmp4932 = load %m0$.File.type*, %m0$.File.type** %.tmp4931
%.tmp4934 = getelementptr [15 x i8], [15 x i8]*@.str4933, i32 0, i32 0
%.tmp4935 = load i8*, i8** %begin_lbl.4786
%.tmp4936 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4932, i8* %.tmp4934, i8* %.tmp4935)
%.tmp4937 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4938 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4937, i32 0, i32 1
%.tmp4939 = load %m0$.File.type*, %m0$.File.type** %.tmp4938
%.tmp4941 = getelementptr [5 x i8], [5 x i8]*@.str4940, i32 0, i32 0
%.tmp4942 = load i8*, i8** %end_lbl.4788
%.tmp4943 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4939, i8* %.tmp4941, i8* %.tmp4942)
%.tmp4944 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4944)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4945 = bitcast ptr null to %m1861$.Type.type*
%decl_type.4946 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4945, %m1861$.Type.type** %decl_type.4946
%.tmp4947 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4948 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4947, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp4949 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4950 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4949, i32 0, i32 6
%.tmp4951 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4950
%.tmp4952 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4951, i32 0, i32 0
%.tmp4953 = load i8*, i8** %.tmp4952
%.tmp4955 = getelementptr [5 x i8], [5 x i8]*@.str4954, i32 0, i32 0
%.tmp4956 = call i32(i8*,i8*) @strcmp(i8* %.tmp4953, i8* %.tmp4955)
%.tmp4957 = icmp eq i32 %.tmp4956, 0
br i1 %.tmp4957, label %.if.true.4958, label %.if.false.4958
.if.true.4958:
%.tmp4959 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4960 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4961 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4960, i32 0, i32 6
%.tmp4962 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4961
%.tmp4963 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4962, i32 0, i32 6
%.tmp4964 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4963
%.tmp4965 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4959, %m307$.Node.type* %.tmp4964)
store %m1861$.Type.type* %.tmp4965, %m1861$.Type.type** %decl_type.4946
br label %.if.end.4958
.if.false.4958:
br label %.if.end.4958
.if.end.4958:
%.tmp4966 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4967 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4966, i32 0, i32 6
%.tmp4968 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4967
%.tmp4970 = getelementptr [11 x i8], [11 x i8]*@.str4969, i32 0, i32 0
%.tmp4971 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4968, i8* %.tmp4970)
%assignable.4972 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4971, %m307$.Node.type** %assignable.4972
%.tmp4973 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4972
%.tmp4974 = icmp ne %m307$.Node.type* %.tmp4973, null
br i1 %.tmp4974, label %.if.true.4975, label %.if.false.4975
.if.true.4975:
%.tmp4976 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4977 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4972
%.tmp4978 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4976, %m307$.Node.type* %.tmp4977)
store %m1861$.AssignableInfo.type* %.tmp4978, %m1861$.AssignableInfo.type** %a_info.4948
br label %.if.end.4975
.if.false.4975:
br label %.if.end.4975
.if.end.4975:
%.tmp4979 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4980 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4979)
%info.4981 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4980, %m1861$.AssignableInfo.type** %info.4981
%.tmp4982 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp4983 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4982, i32 0, i32 2
%.tmp4985 = getelementptr [9 x i8], [9 x i8]*@.str4984, i32 0, i32 0
store i8* %.tmp4985, i8** %.tmp4983
%.tmp4986 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4987 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4986, i32 0, i32 6
%.tmp4988 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4987
%.tmp4990 = getelementptr [5 x i8], [5 x i8]*@.str4989, i32 0, i32 0
%.tmp4991 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4988, i8* %.tmp4990)
%var_name.4992 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4991, %m307$.Node.type** %var_name.4992
%.tmp4993 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4992
%.tmp4994 = icmp eq %m307$.Node.type* %.tmp4993, null
br i1 %.tmp4994, label %.if.true.4995, label %.if.false.4995
.if.true.4995:
%.tmp4996 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4997 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4999 = getelementptr [31 x i8], [31 x i8]*@.str4998, i32 0, i32 0
%.tmp5000 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4996, %m307$.Node.type* %.tmp4997, i8* %.tmp4999)
%.tmp5001 = call i32(i8*,...) @printf(i8* %.tmp5000)
%.tmp5002 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5002
br label %.if.end.4995
.if.false.4995:
br label %.if.end.4995
.if.end.4995:
%.tmp5003 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5004 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5003)
%mod.5005 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5004, %m1861$.ModuleLookup.type** %mod.5005
%.tmp5006 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5007 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5005
%.tmp5008 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5007, i32 0, i32 3
%.tmp5009 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5008
%.tmp5010 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4992
%.tmp5011 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5010, i32 0, i32 1
%.tmp5012 = load i8*, i8** %.tmp5011
%.tmp5013 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5006, %m1861$.Scope.type* %.tmp5009, i8* %.tmp5012)
%.tmp5014 = icmp ne %m1861$.ScopeItem.type* %.tmp5013, null
br i1 %.tmp5014, label %.if.true.5015, label %.if.false.5015
.if.true.5015:
%err_buf.5016 = alloca i8*
store i8* null, i8** %err_buf.5016
%.tmp5017 = getelementptr i8*, i8** %err_buf.5016, i32 0
%.tmp5019 = getelementptr [43 x i8], [43 x i8]*@.str5018, i32 0, i32 0
%.tmp5020 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4992
%.tmp5021 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5020, i32 0, i32 1
%.tmp5022 = load i8*, i8** %.tmp5021
%.tmp5023 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5017, i8* %.tmp5019, i8* %.tmp5022)
%.tmp5024 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5025 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5026 = load i8*, i8** %err_buf.5016
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5024, %m307$.Node.type* %.tmp5025, i8* %.tmp5026)
%.tmp5027 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5027
br label %.if.end.5015
.if.false.5015:
br label %.if.end.5015
.if.end.5015:
%var_id.5028 = alloca i8*
store i8* null, i8** %var_id.5028
%.tmp5029 = getelementptr i8*, i8** %var_id.5028, i32 0
%.tmp5031 = getelementptr [6 x i8], [6 x i8]*@.str5030, i32 0, i32 0
%.tmp5032 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4992
%.tmp5033 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5032, i32 0, i32 1
%.tmp5034 = load i8*, i8** %.tmp5033
%.tmp5035 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5036 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5035)
%.tmp5037 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5029, i8* %.tmp5031, i8* %.tmp5034, i32 %.tmp5036)
%.tmp5038 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp5039 = load i8, i8* @SCOPE_LOCAL
%.tmp5040 = load i8*, i8** %var_id.5028
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5038, i8 %.tmp5039, i8* %.tmp5040)
%.tmp5041 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4946
%.tmp5042 = icmp ne %m1861$.Type.type* %.tmp5041, null
br i1 %.tmp5042, label %.if.true.5043, label %.if.false.5043
.if.true.5043:
%.tmp5044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp5045 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5044, i32 0, i32 3
%.tmp5046 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.4946
store %m1861$.Type.type* %.tmp5046, %m1861$.Type.type** %.tmp5045
br label %.if.end.5043
.if.false.5043:
%.tmp5047 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5048 = icmp ne %m1861$.AssignableInfo.type* %.tmp5047, null
br i1 %.tmp5048, label %.if.true.5049, label %.if.false.5049
.if.true.5049:
%.tmp5050 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp5051 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5050, i32 0, i32 3
%.tmp5052 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5053 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5052, i32 0, i32 3
%.tmp5054 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5053
store %m1861$.Type.type* %.tmp5054, %m1861$.Type.type** %.tmp5051
br label %.if.end.5049
.if.false.5049:
br label %.if.end.5049
.if.end.5049:
br label %.if.end.5043
.if.end.5043:
%.tmp5055 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5056 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp5057 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5056, i32 0, i32 3
%.tmp5058 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5057
%.tmp5059 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5055, %m1861$.Type.type* %.tmp5058)
%var_type_repr.5060 = alloca i8*
store i8* %.tmp5059, i8** %var_type_repr.5060
%.tmp5061 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5062 = icmp ne %m1861$.AssignableInfo.type* %.tmp5061, null
br i1 %.tmp5062, label %.if.true.5063, label %.if.false.5063
.if.true.5063:
%.tmp5064 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5065 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5066 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5065, i32 0, i32 3
%.tmp5067 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5066
%.tmp5068 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5064, %m1861$.Type.type* %.tmp5067)
%a_type_repr.5069 = alloca i8*
store i8* %.tmp5068, i8** %a_type_repr.5069
%type_error.5070 = alloca i1
store i1 0, i1* %type_error.5070
%.tmp5071 = load i8*, i8** %a_type_repr.5069
%.tmp5072 = call i32(i8*) @strlen(i8* %.tmp5071)
%.tmp5073 = load i8*, i8** %var_type_repr.5060
%.tmp5074 = call i32(i8*) @strlen(i8* %.tmp5073)
%.tmp5075 = icmp ne i32 %.tmp5072, %.tmp5074
br i1 %.tmp5075, label %.if.true.5076, label %.if.false.5076
.if.true.5076:
store i1 1, i1* %type_error.5070
br label %.if.end.5076
.if.false.5076:
%.tmp5077 = load i8*, i8** %a_type_repr.5069
%.tmp5078 = load i8*, i8** %var_type_repr.5060
%.tmp5079 = call i32(i8*,i8*) @strcmp(i8* %.tmp5077, i8* %.tmp5078)
%.tmp5080 = icmp ne i32 %.tmp5079, 0
br i1 %.tmp5080, label %.if.true.5081, label %.if.false.5081
.if.true.5081:
store i1 1, i1* %type_error.5070
br label %.if.end.5081
.if.false.5081:
br label %.if.end.5081
.if.end.5081:
br label %.if.end.5076
.if.end.5076:
%.tmp5082 = load i1, i1* %type_error.5070
br i1 %.tmp5082, label %.if.true.5083, label %.if.false.5083
.if.true.5083:
%.tmp5084 = bitcast ptr null to i8*
%err_msg.5085 = alloca i8*
store i8* %.tmp5084, i8** %err_msg.5085
%.tmp5086 = getelementptr i8*, i8** %err_msg.5085, i32 0
%.tmp5088 = getelementptr [49 x i8], [49 x i8]*@.str5087, i32 0, i32 0
%.tmp5089 = load i8*, i8** %a_type_repr.5069
%.tmp5090 = load i8*, i8** %var_type_repr.5060
%.tmp5091 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5086, i8* %.tmp5088, i8* %.tmp5089, i8* %.tmp5090)
%.tmp5092 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5093 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5094 = load i8*, i8** %err_msg.5085
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5092, %m307$.Node.type* %.tmp5093, i8* %.tmp5094)
br label %.if.end.5083
.if.false.5083:
br label %.if.end.5083
.if.end.5083:
br label %.if.end.5063
.if.false.5063:
br label %.if.end.5063
.if.end.5063:
%.tmp5095 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5096 = load %m307$.Node.type*, %m307$.Node.type** %var_name.4992
%.tmp5097 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5096, i32 0, i32 1
%.tmp5098 = load i8*, i8** %.tmp5097
%.tmp5099 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5095, i8* %.tmp5098, %m1861$.AssignableInfo.type* %.tmp5099)
%.tmp5100 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5101 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5100, i32 0, i32 1
%.tmp5102 = load %m0$.File.type*, %m0$.File.type** %.tmp5101
%.tmp5104 = getelementptr [16 x i8], [16 x i8]*@.str5103, i32 0, i32 0
%.tmp5105 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp5106 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5105)
%.tmp5107 = load i8*, i8** %var_type_repr.5060
%.tmp5108 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5102, i8* %.tmp5104, i8* %.tmp5106, i8* %.tmp5107)
%.tmp5109 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5110 = icmp ne %m1861$.AssignableInfo.type* %.tmp5109, null
br i1 %.tmp5110, label %.if.true.5111, label %.if.false.5111
.if.true.5111:
%.tmp5112 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5113 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5112, i32 0, i32 1
%.tmp5114 = load %m0$.File.type*, %m0$.File.type** %.tmp5113
%.tmp5116 = getelementptr [21 x i8], [21 x i8]*@.str5115, i32 0, i32 0
%.tmp5117 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5118 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5119 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5118, i32 0, i32 3
%.tmp5120 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5119
%.tmp5121 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5117, %m1861$.Type.type* %.tmp5120)
%.tmp5122 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4948
%.tmp5123 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5122)
%.tmp5124 = load i8*, i8** %var_type_repr.5060
%.tmp5125 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
%.tmp5126 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5125)
%.tmp5127 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5114, i8* %.tmp5116, i8* %.tmp5121, i8* %.tmp5123, i8* %.tmp5124, i8* %.tmp5126)
br label %.if.end.5111
.if.false.5111:
%.tmp5128 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5129 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5130 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5128, %m307$.Node.type* %.tmp5129, %m1861$.AssignableInfo.type* %.tmp5130)
br label %.if.end.5111
.if.end.5111:
%.tmp5131 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4981
ret %m1861$.AssignableInfo.type* %.tmp5131
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5132 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5133 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5132, i32 0, i32 3
%.tmp5134 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5133
%.tmp5135 = icmp eq %m1861$.Type.type* %.tmp5134, null
br i1 %.tmp5135, label %.if.true.5136, label %.if.false.5136
.if.true.5136:
ret void
br label %.if.end.5136
.if.false.5136:
br label %.if.end.5136
.if.end.5136:
%.tmp5137 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5138 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5139 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5138, i32 0, i32 3
%.tmp5140 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5139
%.tmp5141 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5137, %m1861$.Type.type* %.tmp5140)
%t_repr.5142 = alloca i8*
store i8* %.tmp5141, i8** %t_repr.5142
%.tmp5143 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5144 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5143)
%id.5145 = alloca i8*
store i8* %.tmp5144, i8** %id.5145
%field_id.5146 = alloca i32
store i32 0, i32* %field_id.5146
%field.5147 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5147
%field_info.5148 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5149 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5150 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5149, i32 0, i32 3
%.tmp5151 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5150
%t.5152 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5151, %m1861$.Type.type** %t.5152
%.tmp5153 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5154 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5153, i32 0, i32 0
%.tmp5155 = load i8*, i8** %.tmp5154
%.tmp5157 = getelementptr [4 x i8], [4 x i8]*@.str5156, i32 0, i32 0
%.tmp5158 = call i32(i8*,i8*) @strcmp(i8* %.tmp5155, i8* %.tmp5157)
%.tmp5159 = icmp eq i32 %.tmp5158, 0
%.tmp5160 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5161 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5160, i32 0, i32 0
%.tmp5162 = load i8*, i8** %.tmp5161
%.tmp5164 = getelementptr [4 x i8], [4 x i8]*@.str5163, i32 0, i32 0
%.tmp5165 = call i32(i8*,i8*) @strcmp(i8* %.tmp5162, i8* %.tmp5164)
%.tmp5166 = icmp eq i32 %.tmp5165, 0
%.tmp5167 = or i1 %.tmp5159, %.tmp5166
%.tmp5168 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5169 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5168, i32 0, i32 0
%.tmp5170 = load i8*, i8** %.tmp5169
%.tmp5172 = getelementptr [5 x i8], [5 x i8]*@.str5171, i32 0, i32 0
%.tmp5173 = call i32(i8*,i8*) @strcmp(i8* %.tmp5170, i8* %.tmp5172)
%.tmp5174 = icmp eq i32 %.tmp5173, 0
%.tmp5175 = or i1 %.tmp5167, %.tmp5174
br i1 %.tmp5175, label %.if.true.5176, label %.if.false.5176
.if.true.5176:
%.tmp5177 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5178 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5177, i32 0, i32 1
%.tmp5179 = load %m0$.File.type*, %m0$.File.type** %.tmp5178
%.tmp5181 = getelementptr [21 x i8], [21 x i8]*@.str5180, i32 0, i32 0
%.tmp5182 = load i8*, i8** %t_repr.5142
%.tmp5183 = load i8*, i8** %t_repr.5142
%.tmp5184 = load i8*, i8** %id.5145
%.tmp5185 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5179, i8* %.tmp5181, i8* %.tmp5182, i32 0, i8* %.tmp5183, i8* %.tmp5184)
br label %.if.end.5176
.if.false.5176:
%.tmp5186 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5187 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5186, i32 0, i32 0
%.tmp5188 = load i8*, i8** %.tmp5187
%.tmp5190 = getelementptr [4 x i8], [4 x i8]*@.str5189, i32 0, i32 0
%.tmp5191 = call i32(i8*,i8*) @strcmp(i8* %.tmp5188, i8* %.tmp5190)
%.tmp5192 = icmp eq i32 %.tmp5191, 0
br i1 %.tmp5192, label %.if.true.5193, label %.if.false.5193
.if.true.5193:
%.tmp5194 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5195 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5194, i32 0, i32 1
%.tmp5196 = load %m0$.File.type*, %m0$.File.type** %.tmp5195
%.tmp5198 = getelementptr [21 x i8], [21 x i8]*@.str5197, i32 0, i32 0
%.tmp5199 = load i8*, i8** %t_repr.5142
%.tmp5201 = getelementptr [5 x i8], [5 x i8]*@.str5200, i32 0, i32 0
%.tmp5202 = load i8*, i8** %t_repr.5142
%.tmp5203 = load i8*, i8** %id.5145
%.tmp5204 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5196, i8* %.tmp5198, i8* %.tmp5199, i8* %.tmp5201, i8* %.tmp5202, i8* %.tmp5203)
br label %.if.end.5193
.if.false.5193:
%.tmp5205 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5206 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5205, i32 0, i32 0
%.tmp5207 = load i8*, i8** %.tmp5206
%.tmp5209 = getelementptr [7 x i8], [7 x i8]*@.str5208, i32 0, i32 0
%.tmp5210 = call i32(i8*,i8*) @strcmp(i8* %.tmp5207, i8* %.tmp5209)
%.tmp5211 = icmp eq i32 %.tmp5210, 0
br i1 %.tmp5211, label %.if.true.5212, label %.if.false.5212
.if.true.5212:
%.tmp5214 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5215 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5214, i32 0, i32 3
%.tmp5216 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5215
store %m1861$.Type.type* %.tmp5216, %m1861$.Type.type** %field.5147
br label %.for.start.5213
.for.start.5213:
%.tmp5217 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5147
%.tmp5218 = icmp ne %m1861$.Type.type* %.tmp5217, null
br i1 %.tmp5218, label %.for.continue.5213, label %.for.end.5213
.for.continue.5213:
%.tmp5219 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5220 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5219)
store %m1861$.AssignableInfo.type* %.tmp5220, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5221 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5222 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5221, %m1861$.AssignableInfo.type* %.tmp5222)
%.tmp5223 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5224 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5223, i32 0, i32 3
%.tmp5225 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5147
store %m1861$.Type.type* %.tmp5225, %m1861$.Type.type** %.tmp5224
%.tmp5226 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5227 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5226, i32 0, i32 1
%.tmp5228 = load %m0$.File.type*, %m0$.File.type** %.tmp5227
%.tmp5230 = getelementptr [46 x i8], [46 x i8]*@.str5229, i32 0, i32 0
%.tmp5231 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5232 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5231)
%.tmp5233 = load i8*, i8** %t_repr.5142
%.tmp5234 = load i8*, i8** %t_repr.5142
%.tmp5235 = load i8*, i8** %id.5145
%.tmp5236 = load i32, i32* %field_id.5146
%.tmp5237 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5228, i8* %.tmp5230, i8* %.tmp5232, i8* %.tmp5233, i8* %.tmp5234, i8* %.tmp5235, i32 %.tmp5236)
%.tmp5238 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5239 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5240 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5238, %m307$.Node.type* %.tmp5239, %m1861$.AssignableInfo.type* %.tmp5240)
%.tmp5241 = load i32, i32* %field_id.5146
%.tmp5242 = add i32 %.tmp5241, 1
store i32 %.tmp5242, i32* %field_id.5146
%.tmp5243 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5147
%.tmp5244 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5243, i32 0, i32 4
%.tmp5245 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5244
store %m1861$.Type.type* %.tmp5245, %m1861$.Type.type** %field.5147
br label %.for.start.5213
.for.end.5213:
br label %.if.end.5212
.if.false.5212:
%.tmp5246 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5247 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5246, i32 0, i32 0
%.tmp5248 = load i8*, i8** %.tmp5247
%.tmp5250 = getelementptr [10 x i8], [10 x i8]*@.str5249, i32 0, i32 0
%.tmp5251 = call i32(i8*,i8*) @strcmp(i8* %.tmp5248, i8* %.tmp5250)
%.tmp5252 = icmp eq i32 %.tmp5251, 0
br i1 %.tmp5252, label %.if.true.5253, label %.if.false.5253
.if.true.5253:
%.tmp5255 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5152
%.tmp5256 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5255, i32 0, i32 3
%.tmp5257 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5256
%.tmp5258 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5257, i32 0, i32 3
%.tmp5259 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5258
store %m1861$.Type.type* %.tmp5259, %m1861$.Type.type** %field.5147
br label %.for.start.5254
.for.start.5254:
%.tmp5260 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5147
%.tmp5261 = icmp ne %m1861$.Type.type* %.tmp5260, null
br i1 %.tmp5261, label %.for.continue.5254, label %.for.end.5254
.for.continue.5254:
%.tmp5262 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5263 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5262)
store %m1861$.AssignableInfo.type* %.tmp5263, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5264 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5265 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5264, %m1861$.AssignableInfo.type* %.tmp5265)
%.tmp5266 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5267 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5266, i32 0, i32 3
%.tmp5268 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5147
store %m1861$.Type.type* %.tmp5268, %m1861$.Type.type** %.tmp5267
%.tmp5269 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5270 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5269, i32 0, i32 1
%.tmp5271 = load %m0$.File.type*, %m0$.File.type** %.tmp5270
%.tmp5273 = getelementptr [46 x i8], [46 x i8]*@.str5272, i32 0, i32 0
%.tmp5274 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
%.tmp5275 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5274)
%.tmp5276 = load i8*, i8** %t_repr.5142
%.tmp5277 = load i8*, i8** %t_repr.5142
%.tmp5278 = load i8*, i8** %id.5145
%.tmp5279 = load i32, i32* %field_id.5146
%.tmp5280 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5271, i8* %.tmp5273, i8* %.tmp5275, i8* %.tmp5276, i8* %.tmp5277, i8* %.tmp5278, i32 %.tmp5279)
%.tmp5281 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5282 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5283 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5148
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5281, %m307$.Node.type* %.tmp5282, %m1861$.AssignableInfo.type* %.tmp5283)
%.tmp5284 = load i32, i32* %field_id.5146
%.tmp5285 = add i32 %.tmp5284, 1
store i32 %.tmp5285, i32* %field_id.5146
%.tmp5286 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5147
%.tmp5287 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5286, i32 0, i32 4
%.tmp5288 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5287
store %m1861$.Type.type* %.tmp5288, %m1861$.Type.type** %field.5147
br label %.for.start.5254
.for.end.5254:
br label %.if.end.5253
.if.false.5253:
%.tmp5289 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5290 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5292 = getelementptr [44 x i8], [44 x i8]*@.str5291, i32 0, i32 0
%.tmp5293 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5289, %m307$.Node.type* %.tmp5290, i8* %.tmp5292)
%.tmp5294 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5295 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5294, i32 0, i32 3
%.tmp5296 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5295
%.tmp5297 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5296, i32 0, i32 0
%.tmp5298 = load i8*, i8** %.tmp5297
%.tmp5299 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5300 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5301 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5300, i32 0, i32 3
%.tmp5302 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5301
%.tmp5303 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5299, %m1861$.Type.type* %.tmp5302)
%.tmp5304 = call i32(i8*,...) @printf(i8* %.tmp5293, i8* %.tmp5298, i8* %.tmp5303)
ret void
br label %.if.end.5253
.if.end.5253:
br label %.if.end.5212
.if.end.5212:
br label %.if.end.5193
.if.end.5193:
br label %.if.end.5176
.if.end.5176:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5305 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5305, i32 0, i32 6
%.tmp5307 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5306
%.tmp5309 = getelementptr [11 x i8], [11 x i8]*@.str5308, i32 0, i32 0
%.tmp5310 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5307, i8* %.tmp5309)
%assignable.5311 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5310, %m307$.Node.type** %assignable.5311
%.tmp5312 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5313 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5311
%.tmp5314 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5312, %m307$.Node.type* %.tmp5313)
%a_info.5315 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5314, %m1861$.AssignableInfo.type** %a_info.5315
%.tmp5316 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5315
%.tmp5317 = icmp eq %m1861$.AssignableInfo.type* %.tmp5316, null
br i1 %.tmp5317, label %.if.true.5318, label %.if.false.5318
.if.true.5318:
ret void
br label %.if.end.5318
.if.false.5318:
br label %.if.end.5318
.if.end.5318:
%.tmp5319 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5320 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5319)
%if_id.5321 = alloca i32
store i32 %.tmp5320, i32* %if_id.5321
%.tmp5322 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5323 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5322, i32 0, i32 1
%.tmp5324 = load %m0$.File.type*, %m0$.File.type** %.tmp5323
%.tmp5326 = getelementptr [53 x i8], [53 x i8]*@.str5325, i32 0, i32 0
%.tmp5327 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5328 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5315
%.tmp5329 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5328, i32 0, i32 3
%.tmp5330 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5329
%.tmp5331 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5327, %m1861$.Type.type* %.tmp5330)
%.tmp5332 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5315
%.tmp5333 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5332)
%.tmp5334 = load i32, i32* %if_id.5321
%.tmp5335 = load i32, i32* %if_id.5321
%.tmp5336 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5324, i8* %.tmp5326, i8* %.tmp5331, i8* %.tmp5333, i32 %.tmp5334, i32 %.tmp5335)
%.tmp5337 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5338 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5337, i32 0, i32 1
%.tmp5339 = load %m0$.File.type*, %m0$.File.type** %.tmp5338
%.tmp5341 = getelementptr [14 x i8], [14 x i8]*@.str5340, i32 0, i32 0
%.tmp5342 = load i32, i32* %if_id.5321
%.tmp5343 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5339, i8* %.tmp5341, i32 %.tmp5342)
%.tmp5344 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5345 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5344, i32 0, i32 6
%.tmp5346 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5345
%.tmp5348 = getelementptr [6 x i8], [6 x i8]*@.str5347, i32 0, i32 0
%.tmp5349 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5346, i8* %.tmp5348)
%block.5350 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5349, %m307$.Node.type** %block.5350
%.tmp5351 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5352 = load %m307$.Node.type*, %m307$.Node.type** %block.5350
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5351, %m307$.Node.type* %.tmp5352)
%.tmp5353 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5354 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5353, i32 0, i32 1
%.tmp5355 = load %m0$.File.type*, %m0$.File.type** %.tmp5354
%.tmp5357 = getelementptr [23 x i8], [23 x i8]*@.str5356, i32 0, i32 0
%.tmp5358 = load i32, i32* %if_id.5321
%.tmp5359 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5355, i8* %.tmp5357, i32 %.tmp5358)
%.tmp5360 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5361 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5360, i32 0, i32 1
%.tmp5362 = load %m0$.File.type*, %m0$.File.type** %.tmp5361
%.tmp5364 = getelementptr [15 x i8], [15 x i8]*@.str5363, i32 0, i32 0
%.tmp5365 = load i32, i32* %if_id.5321
%.tmp5366 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5362, i8* %.tmp5364, i32 %.tmp5365)
%.tmp5367 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5368 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5367, i32 0, i32 6
%.tmp5369 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5368
%.tmp5371 = getelementptr [11 x i8], [11 x i8]*@.str5370, i32 0, i32 0
%.tmp5372 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5369, i8* %.tmp5371)
%else_block.5373 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5372, %m307$.Node.type** %else_block.5373
%.tmp5374 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5373
%.tmp5375 = icmp ne %m307$.Node.type* %.tmp5374, null
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
%.tmp5377 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5373
%.tmp5378 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5377, i32 0, i32 6
%.tmp5379 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5378
%.tmp5380 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5379, i32 0, i32 0
%.tmp5381 = load i8*, i8** %.tmp5380
%.tmp5383 = getelementptr [11 x i8], [11 x i8]*@.str5382, i32 0, i32 0
%.tmp5384 = call i32(i8*,i8*) @strcmp(i8* %.tmp5381, i8* %.tmp5383)
%.tmp5385 = icmp eq i32 %.tmp5384, 0
br i1 %.tmp5385, label %.if.true.5386, label %.if.false.5386
.if.true.5386:
%.tmp5387 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5373
%.tmp5388 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5387, i32 0, i32 6
%.tmp5389 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5388
%.tmp5390 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5389, i32 0, i32 6
%.tmp5391 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5390
%.tmp5393 = getelementptr [6 x i8], [6 x i8]*@.str5392, i32 0, i32 0
%.tmp5394 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5391, i8* %.tmp5393)
store %m307$.Node.type* %.tmp5394, %m307$.Node.type** %block.5350
%.tmp5395 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5396 = load %m307$.Node.type*, %m307$.Node.type** %block.5350
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5395, %m307$.Node.type* %.tmp5396)
br label %.if.end.5386
.if.false.5386:
%.tmp5397 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5398 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5373
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5397, %m307$.Node.type* %.tmp5398)
br label %.if.end.5386
.if.end.5386:
br label %.if.end.5376
.if.false.5376:
br label %.if.end.5376
.if.end.5376:
%.tmp5399 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5400 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5399, i32 0, i32 1
%.tmp5401 = load %m0$.File.type*, %m0$.File.type** %.tmp5400
%.tmp5403 = getelementptr [23 x i8], [23 x i8]*@.str5402, i32 0, i32 0
%.tmp5404 = load i32, i32* %if_id.5321
%.tmp5405 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5401, i8* %.tmp5403, i32 %.tmp5404)
%.tmp5406 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5407 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5406, i32 0, i32 1
%.tmp5408 = load %m0$.File.type*, %m0$.File.type** %.tmp5407
%.tmp5410 = getelementptr [13 x i8], [13 x i8]*@.str5409, i32 0, i32 0
%.tmp5411 = load i32, i32* %if_id.5321
%.tmp5412 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5408, i8* %.tmp5410, i32 %.tmp5411)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5413 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5414 = icmp ne %m307$.Node.type* %.tmp5413, null
br i1 %.tmp5414, label %.if.true.5415, label %.if.false.5415
.if.true.5415:
%.tmp5416 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5417 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5416, i32 0, i32 7
%.tmp5418 = load i8*, i8** %.tmp5417
%.tmp5419 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5420 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5419, i32 0, i32 3
%.tmp5421 = load i32, i32* %.tmp5420
%.tmp5422 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5423 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5422, i32 0, i32 4
%.tmp5424 = load i32, i32* %.tmp5423
%.tmp5425 = load i8*, i8** %msg
%.tmp5426 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5418, i32 %.tmp5421, i32 %.tmp5424, i8* %.tmp5425)
%err.5427 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5426, %m751$.Error.type** %err.5427
%.tmp5428 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5429 = load %m751$.Error.type*, %m751$.Error.type** %err.5427
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5428, %m751$.Error.type* %.tmp5429)
br label %.if.end.5415
.if.false.5415:
%.tmp5431 = getelementptr [61 x i8], [61 x i8]*@.str5430, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5431)
br label %.if.end.5415
.if.end.5415:
ret void
}
define void @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5432 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5433 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5432)
%mod.5434 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5433, %m1861$.ModuleLookup.type** %mod.5434
%.tmp5435 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5434
%.tmp5436 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5435, i32 0, i32 3
%.tmp5437 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5436
%.tmp5438 = icmp ne %m1861$.Scope.type* %.tmp5437, null
%.tmp5440 = getelementptr [82 x i8], [82 x i8]*@.str5439, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5438, i8* %.tmp5440)
%.tmp5441 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5434
%.tmp5442 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5441, i32 0, i32 3
%.tmp5443 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5442
%current_scope.5444 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5443, %m1861$.Scope.type** %current_scope.5444
%.tmp5445 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5446 = ptrtoint %m1861$.ScopeItem.type* %.tmp5445 to i32
%.tmp5447 = call i8*(i32) @malloc(i32 %.tmp5446)
%.tmp5448 = bitcast i8* %.tmp5447 to %m1861$.ScopeItem.type*
%newitem.5449 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5448, %m1861$.ScopeItem.type** %newitem.5449
%.tmp5450 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5449
%.tmp5451 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5450, i32 0, i32 0
%.tmp5452 = load i8*, i8** %name
store i8* %.tmp5452, i8** %.tmp5451
%.tmp5453 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5449
%.tmp5454 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5453, i32 0, i32 1
%.tmp5455 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5455, %m1861$.AssignableInfo.type** %.tmp5454
%.tmp5456 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5449
%.tmp5457 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5456, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5457
%.tmp5458 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5444
%.tmp5459 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5458, i32 0, i32 1
%.tmp5460 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5459
%.tmp5461 = icmp eq %m1861$.ScopeItem.type* %.tmp5460, null
br i1 %.tmp5461, label %.if.true.5462, label %.if.false.5462
.if.true.5462:
%.tmp5463 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5444
%.tmp5464 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5463, i32 0, i32 1
%.tmp5465 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5449
store %m1861$.ScopeItem.type* %.tmp5465, %m1861$.ScopeItem.type** %.tmp5464
ret void
br label %.if.end.5462
.if.false.5462:
br label %.if.end.5462
.if.end.5462:
%.tmp5466 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5444
%.tmp5467 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5466, i32 0, i32 1
%.tmp5468 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5467
%last_item.5469 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5468, %m1861$.ScopeItem.type** %last_item.5469
br label %.for.start.5470
.for.start.5470:
%.tmp5471 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5469
%.tmp5472 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5471, i32 0, i32 2
%.tmp5473 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5472
%.tmp5474 = icmp ne %m1861$.ScopeItem.type* %.tmp5473, null
br i1 %.tmp5474, label %.for.continue.5470, label %.for.end.5470
.for.continue.5470:
%.tmp5475 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5469
%.tmp5476 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5475, i32 0, i32 2
%.tmp5477 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5476
store %m1861$.ScopeItem.type* %.tmp5477, %m1861$.ScopeItem.type** %last_item.5469
br label %.for.start.5470
.for.end.5470:
%.tmp5478 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5469
%.tmp5479 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5478, i32 0, i32 2
%.tmp5480 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5449
store %m1861$.ScopeItem.type* %.tmp5480, %m1861$.ScopeItem.type** %.tmp5479
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5481 = alloca i8*
store i8* null, i8** %err_buf.5481
%.tmp5482 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5483 = load i8*, i8** %module
%.tmp5484 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5485 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5484, i32 0, i32 1
%.tmp5486 = load i8*, i8** %.tmp5485
%.tmp5487 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5482, i8* %.tmp5483, i8* %.tmp5486)
%found.5488 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5487, %m1861$.ScopeItem.type** %found.5488
%.tmp5489 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5488
%.tmp5490 = icmp eq %m1861$.ScopeItem.type* %.tmp5489, null
br i1 %.tmp5490, label %.if.true.5491, label %.if.false.5491
.if.true.5491:
%.tmp5492 = getelementptr i8*, i8** %err_buf.5481, i32 0
%.tmp5494 = getelementptr [31 x i8], [31 x i8]*@.str5493, i32 0, i32 0
%.tmp5495 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5496 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5495, i32 0, i32 1
%.tmp5497 = load i8*, i8** %.tmp5496
%.tmp5498 = load i8*, i8** %module
%.tmp5499 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5492, i8* %.tmp5494, i8* %.tmp5497, i8* %.tmp5498)
%.tmp5500 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5501 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5502 = load i8*, i8** %err_buf.5481
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5500, %m307$.Node.type* %.tmp5501, i8* %.tmp5502)
%.tmp5503 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5503
br label %.if.end.5491
.if.false.5491:
br label %.if.end.5491
.if.end.5491:
br label %.for.start.5504
.for.start.5504:
%.tmp5505 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5506 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5505, i32 0, i32 7
%.tmp5507 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5506
%.tmp5508 = icmp ne %m307$.Node.type* %.tmp5507, null
%.tmp5509 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5488
%.tmp5510 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5509, i32 0, i32 1
%.tmp5511 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5510
%.tmp5512 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5511, i32 0, i32 2
%.tmp5513 = load i8*, i8** %.tmp5512
%.tmp5515 = getelementptr [7 x i8], [7 x i8]*@.str5514, i32 0, i32 0
%.tmp5516 = call i32(i8*,i8*) @strcmp(i8* %.tmp5513, i8* %.tmp5515)
%.tmp5517 = icmp eq i32 %.tmp5516, 0
%.tmp5518 = and i1 %.tmp5508, %.tmp5517
br i1 %.tmp5518, label %.for.continue.5504, label %.for.end.5504
.for.continue.5504:
%.tmp5519 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5520 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5488
%.tmp5521 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5520, i32 0, i32 1
%.tmp5522 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5521
%.tmp5523 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5522, i32 0, i32 0
%.tmp5524 = load i8*, i8** %.tmp5523
%.tmp5525 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5526 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5525, i32 0, i32 7
%.tmp5527 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5526
%.tmp5528 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5527, i32 0, i32 7
%.tmp5529 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5528
%.tmp5530 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5519, i8* %.tmp5524, %m307$.Node.type* %.tmp5529)
store %m1861$.ScopeItem.type* %.tmp5530, %m1861$.ScopeItem.type** %found.5488
%.tmp5531 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5488
%.tmp5532 = icmp eq %m1861$.ScopeItem.type* %.tmp5531, null
br i1 %.tmp5532, label %.if.true.5533, label %.if.false.5533
.if.true.5533:
%.tmp5534 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5534
br label %.if.end.5533
.if.false.5533:
br label %.if.end.5533
.if.end.5533:
br label %.for.start.5504
.for.end.5504:
%.tmp5535 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5488
ret %m1861$.ScopeItem.type* %.tmp5535
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5536 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5537 = icmp eq %m1861$.Scope.type* %.tmp5536, null
br i1 %.tmp5537, label %.if.true.5538, label %.if.false.5538
.if.true.5538:
%.tmp5539 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5539
br label %.if.end.5538
.if.false.5538:
br label %.if.end.5538
.if.end.5538:
%.tmp5541 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5542 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5541, i32 0, i32 1
%.tmp5543 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5542
%item.5544 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5543, %m1861$.ScopeItem.type** %item.5544
br label %.for.start.5540
.for.start.5540:
%.tmp5545 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5544
%.tmp5546 = icmp ne %m1861$.ScopeItem.type* %.tmp5545, null
br i1 %.tmp5546, label %.for.continue.5540, label %.for.end.5540
.for.continue.5540:
%.tmp5547 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5544
%.tmp5548 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5547, i32 0, i32 0
%.tmp5549 = load i8*, i8** %.tmp5548
%.tmp5550 = load i8*, i8** %name
%.tmp5551 = call i32(i8*,i8*) @strcmp(i8* %.tmp5549, i8* %.tmp5550)
%.tmp5552 = icmp eq i32 %.tmp5551, 0
br i1 %.tmp5552, label %.if.true.5553, label %.if.false.5553
.if.true.5553:
%.tmp5554 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5544
ret %m1861$.ScopeItem.type* %.tmp5554
br label %.if.end.5553
.if.false.5553:
br label %.if.end.5553
.if.end.5553:
%.tmp5555 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5544
%.tmp5556 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5555, i32 0, i32 2
%.tmp5557 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5556
store %m1861$.ScopeItem.type* %.tmp5557, %m1861$.ScopeItem.type** %item.5544
br label %.for.start.5540
.for.end.5540:
%.tmp5558 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5558
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5559 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5560 = load i8*, i8** %module
%.tmp5561 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5559, i8* %.tmp5560)
%mod.5562 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5561, %m1861$.ModuleLookup.type** %mod.5562
%.tmp5563 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5562
%.tmp5564 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5563, i32 0, i32 3
%.tmp5565 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5564
%.tmp5566 = icmp ne %m1861$.Scope.type* %.tmp5565, null
%.tmp5568 = getelementptr [77 x i8], [77 x i8]*@.str5567, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5566, i8* %.tmp5568)
%.tmp5570 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5562
%.tmp5571 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5570, i32 0, i32 3
%.tmp5572 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5571
%s.5573 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5572, %m1861$.Scope.type** %s.5573
br label %.for.start.5569
.for.start.5569:
%.tmp5574 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5573
%.tmp5575 = icmp ne %m1861$.Scope.type* %.tmp5574, null
br i1 %.tmp5575, label %.for.continue.5569, label %.for.end.5569
.for.continue.5569:
%.tmp5576 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5577 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5573
%.tmp5578 = load i8*, i8** %assignable_name
%.tmp5579 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5576, %m1861$.Scope.type* %.tmp5577, i8* %.tmp5578)
%item.5580 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5579, %m1861$.ScopeItem.type** %item.5580
%.tmp5581 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5580
%.tmp5582 = icmp ne %m1861$.ScopeItem.type* %.tmp5581, null
br i1 %.tmp5582, label %.if.true.5583, label %.if.false.5583
.if.true.5583:
%.tmp5584 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5580
ret %m1861$.ScopeItem.type* %.tmp5584
br label %.if.end.5583
.if.false.5583:
br label %.if.end.5583
.if.end.5583:
%.tmp5585 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5573
%.tmp5586 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5585, i32 0, i32 5
%.tmp5587 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5586
store %m1861$.Scope.type* %.tmp5587, %m1861$.Scope.type** %s.5573
br label %.for.start.5569
.for.end.5569:
%.tmp5588 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5588
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5589 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5590 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5591 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5590, i32 0, i32 7
%.tmp5592 = load i8*, i8** %.tmp5591
%.tmp5593 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5594 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5593, i32 0, i32 6
%.tmp5595 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5594
%.tmp5596 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5589, i8* %.tmp5592, %m307$.Node.type* %.tmp5595)
ret %m1861$.ScopeItem.type* %.tmp5596
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5597 = alloca i8*
store i8* null, i8** %err_msg.5597
%buf.5598 = alloca i8*
store i8* null, i8** %buf.5598
%.tmp5599 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5600 = icmp eq %m1861$.AssignableInfo.type* %.tmp5599, null
br i1 %.tmp5600, label %.if.true.5601, label %.if.false.5601
.if.true.5601:
%.tmp5602 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5603 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5605 = getelementptr [54 x i8], [54 x i8]*@.str5604, i32 0, i32 0
%.tmp5606 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5602, %m307$.Node.type* %.tmp5603, i8* %.tmp5605)
%.tmp5607 = call i32(i8*,...) @printf(i8* %.tmp5606)
%.tmp5608 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5608
br label %.if.end.5601
.if.false.5601:
br label %.if.end.5601
.if.end.5601:
%.tmp5609 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5610 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5609, i32 0, i32 2
%.tmp5611 = load i8*, i8** %.tmp5610
%.tmp5613 = getelementptr [9 x i8], [9 x i8]*@.str5612, i32 0, i32 0
%.tmp5614 = call i32(i8*,i8*) @strcmp(i8* %.tmp5611, i8* %.tmp5613)
%.tmp5615 = icmp eq i32 %.tmp5614, 0
%.tmp5616 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5617 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5616, i32 0, i32 2
%.tmp5618 = load i8*, i8** %.tmp5617
%.tmp5620 = getelementptr [7 x i8], [7 x i8]*@.str5619, i32 0, i32 0
%.tmp5621 = call i32(i8*,i8*) @strcmp(i8* %.tmp5618, i8* %.tmp5620)
%.tmp5622 = icmp eq i32 %.tmp5621, 0
%.tmp5623 = or i1 %.tmp5615, %.tmp5622
br i1 %.tmp5623, label %.if.true.5624, label %.if.false.5624
.if.true.5624:
%.tmp5625 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5626 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5625, i32 0, i32 7
%.tmp5627 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5626
%.tmp5628 = icmp ne %m307$.Node.type* %.tmp5627, null
br i1 %.tmp5628, label %.if.true.5629, label %.if.false.5629
.if.true.5629:
%.tmp5630 = getelementptr i8*, i8** %err_msg.5597, i32 0
%.tmp5632 = getelementptr [46 x i8], [46 x i8]*@.str5631, i32 0, i32 0
%.tmp5633 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5634 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5633, i32 0, i32 7
%.tmp5635 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5634
%.tmp5636 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5635, i32 0, i32 7
%.tmp5637 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5636
%.tmp5638 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5637, i32 0, i32 1
%.tmp5639 = load i8*, i8** %.tmp5638
%.tmp5640 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5641 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5640, i32 0, i32 1
%.tmp5642 = load i8*, i8** %.tmp5641
%.tmp5643 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5630, i8* %.tmp5632, i8* %.tmp5639, i8* %.tmp5642)
%.tmp5644 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5645 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5646 = load i8*, i8** %err_msg.5597
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5644, %m307$.Node.type* %.tmp5645, i8* %.tmp5646)
%.tmp5647 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5647
br label %.if.end.5629
.if.false.5629:
br label %.if.end.5629
.if.end.5629:
%.tmp5648 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5648
br label %.if.end.5624
.if.false.5624:
%.tmp5649 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5650 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5649, i32 0, i32 2
%.tmp5651 = load i8*, i8** %.tmp5650
%.tmp5653 = getelementptr [9 x i8], [9 x i8]*@.str5652, i32 0, i32 0
%.tmp5654 = call i32(i8*,i8*) @strcmp(i8* %.tmp5651, i8* %.tmp5653)
%.tmp5655 = icmp eq i32 %.tmp5654, 0
%.tmp5656 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5657 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5656, i32 0, i32 7
%.tmp5658 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5657
%.tmp5659 = icmp ne %m307$.Node.type* %.tmp5658, null
%.tmp5660 = and i1 %.tmp5655, %.tmp5659
br i1 %.tmp5660, label %.if.true.5661, label %.if.false.5661
.if.true.5661:
%.tmp5662 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5663 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5662, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5664 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5665 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5664, i32 0, i32 3
%.tmp5666 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5665
%struct_info.5667 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5666, %m1861$.Type.type** %struct_info.5667
br label %.for.start.5668
.for.start.5668:
%.tmp5669 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5670 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5669, i32 0, i32 3
%.tmp5671 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5670
%.tmp5672 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5671, i32 0, i32 0
%.tmp5673 = load i8*, i8** %.tmp5672
%.tmp5675 = getelementptr [4 x i8], [4 x i8]*@.str5674, i32 0, i32 0
%.tmp5676 = call i32(i8*,i8*) @strcmp(i8* %.tmp5673, i8* %.tmp5675)
%.tmp5677 = icmp eq i32 %.tmp5676, 0
br i1 %.tmp5677, label %.for.continue.5668, label %.for.end.5668
.for.continue.5668:
%.tmp5678 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5679 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5678)
%new_base.5680 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5679, %m1861$.AssignableInfo.type** %new_base.5680
%.tmp5681 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5682 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5680
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5681, %m1861$.AssignableInfo.type* %.tmp5682)
%.tmp5683 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5680
%.tmp5684 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5683, i32 0, i32 3
%.tmp5685 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5686 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5685, i32 0, i32 3
%.tmp5687 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5686
%.tmp5688 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5687, i32 0, i32 3
%.tmp5689 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5688
store %m1861$.Type.type* %.tmp5689, %m1861$.Type.type** %.tmp5684
%.tmp5690 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5691 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5690, i32 0, i32 1
%.tmp5692 = load %m0$.File.type*, %m0$.File.type** %.tmp5691
%.tmp5694 = getelementptr [23 x i8], [23 x i8]*@.str5693, i32 0, i32 0
%.tmp5695 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5680
%.tmp5696 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5695)
%.tmp5697 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5698 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5680
%.tmp5699 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5698, i32 0, i32 3
%.tmp5700 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5699
%.tmp5701 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5697, %m1861$.Type.type* %.tmp5700)
%.tmp5702 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5703 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5704 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5703, i32 0, i32 3
%.tmp5705 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5704
%.tmp5706 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5702, %m1861$.Type.type* %.tmp5705)
%.tmp5707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5708 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5707)
%.tmp5709 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5692, i8* %.tmp5694, i8* %.tmp5696, i8* %.tmp5701, i8* %.tmp5706, i8* %.tmp5708)
%.tmp5710 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5680
store %m1861$.AssignableInfo.type* %.tmp5710, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5711 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5667
%.tmp5712 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5711, i32 0, i32 3
%.tmp5713 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5712
store %m1861$.Type.type* %.tmp5713, %m1861$.Type.type** %struct_info.5667
br label %.for.start.5668
.for.end.5668:
%.tmp5714 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5667
%.tmp5715 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5714, i32 0, i32 0
%.tmp5716 = load i8*, i8** %.tmp5715
%.tmp5718 = getelementptr [10 x i8], [10 x i8]*@.str5717, i32 0, i32 0
%.tmp5719 = call i32(i8*,i8*) @strcmp(i8* %.tmp5716, i8* %.tmp5718)
%.tmp5720 = icmp eq i32 %.tmp5719, 0
br i1 %.tmp5720, label %.if.true.5721, label %.if.false.5721
.if.true.5721:
%.tmp5722 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5667
%.tmp5723 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5722, i32 0, i32 3
%.tmp5724 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5723
store %m1861$.Type.type* %.tmp5724, %m1861$.Type.type** %struct_info.5667
br label %.if.end.5721
.if.false.5721:
br label %.if.end.5721
.if.end.5721:
%.tmp5725 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5667
%.tmp5726 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5725, i32 0, i32 0
%.tmp5727 = load i8*, i8** %.tmp5726
%.tmp5729 = getelementptr [7 x i8], [7 x i8]*@.str5728, i32 0, i32 0
%.tmp5730 = call i32(i8*,i8*) @strcmp(i8* %.tmp5727, i8* %.tmp5729)
%.tmp5731 = icmp ne i32 %.tmp5730, 0
br i1 %.tmp5731, label %.if.true.5732, label %.if.false.5732
.if.true.5732:
%.tmp5733 = getelementptr i8*, i8** %err_msg.5597, i32 0
%.tmp5735 = getelementptr [48 x i8], [48 x i8]*@.str5734, i32 0, i32 0
%.tmp5736 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5737 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5736, i32 0, i32 7
%.tmp5738 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5737
%.tmp5739 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5738, i32 0, i32 7
%.tmp5740 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5739
%.tmp5741 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5740, i32 0, i32 1
%.tmp5742 = load i8*, i8** %.tmp5741
%.tmp5743 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5744 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5743, i32 0, i32 1
%.tmp5745 = load i8*, i8** %.tmp5744
%.tmp5746 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5733, i8* %.tmp5735, i8* %.tmp5742, i8* %.tmp5745)
%.tmp5747 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5748 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5749 = load i8*, i8** %err_msg.5597
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5747, %m307$.Node.type* %.tmp5748, i8* %.tmp5749)
%.tmp5750 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5750
br label %.if.end.5732
.if.false.5732:
br label %.if.end.5732
.if.end.5732:
%.tmp5751 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5752 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5751, i32 0, i32 7
%.tmp5753 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5752
%.tmp5754 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5753, i32 0, i32 7
%.tmp5755 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5754
%.tmp5756 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5755, i32 0, i32 1
%.tmp5757 = load i8*, i8** %.tmp5756
%field_name.5758 = alloca i8*
store i8* %.tmp5757, i8** %field_name.5758
%field_id.5759 = alloca i32
store i32 0, i32* %field_id.5759
%.tmp5760 = bitcast ptr null to %m1861$.Type.type*
%found_field.5761 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5760, %m1861$.Type.type** %found_field.5761
%.tmp5763 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5667
%.tmp5764 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5763, i32 0, i32 3
%.tmp5765 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5764
%field.5766 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5765, %m1861$.Type.type** %field.5766
br label %.for.start.5762
.for.start.5762:
%.tmp5767 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5766
%.tmp5768 = icmp ne %m1861$.Type.type* %.tmp5767, null
br i1 %.tmp5768, label %.for.continue.5762, label %.for.end.5762
.for.continue.5762:
%.tmp5769 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5766
%.tmp5770 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5769, i32 0, i32 1
%.tmp5771 = load i8*, i8** %.tmp5770
%.tmp5772 = load i8*, i8** %field_name.5758
%.tmp5773 = call i32(i8*,i8*) @strcmp(i8* %.tmp5771, i8* %.tmp5772)
%.tmp5774 = icmp eq i32 %.tmp5773, 0
br i1 %.tmp5774, label %.if.true.5775, label %.if.false.5775
.if.true.5775:
%.tmp5776 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5766
store %m1861$.Type.type* %.tmp5776, %m1861$.Type.type** %found_field.5761
br label %.for.end.5762
br label %.if.end.5775
.if.false.5775:
%.tmp5777 = load i32, i32* %field_id.5759
%.tmp5778 = add i32 %.tmp5777, 1
store i32 %.tmp5778, i32* %field_id.5759
br label %.if.end.5775
.if.end.5775:
%.tmp5779 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5766
%.tmp5780 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5779, i32 0, i32 4
%.tmp5781 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5780
store %m1861$.Type.type* %.tmp5781, %m1861$.Type.type** %field.5766
br label %.for.start.5762
.for.end.5762:
%.tmp5782 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5761
%.tmp5783 = icmp eq %m1861$.Type.type* %.tmp5782, null
br i1 %.tmp5783, label %.if.true.5784, label %.if.false.5784
.if.true.5784:
%.tmp5785 = getelementptr i8*, i8** %err_msg.5597, i32 0
%.tmp5787 = getelementptr [34 x i8], [34 x i8]*@.str5786, i32 0, i32 0
%.tmp5788 = load i8*, i8** %field_name.5758
%.tmp5789 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5790 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5789, i32 0, i32 1
%.tmp5791 = load i8*, i8** %.tmp5790
%.tmp5792 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5785, i8* %.tmp5787, i8* %.tmp5788, i8* %.tmp5791)
%.tmp5793 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5794 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5795 = load i8*, i8** %err_msg.5597
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5793, %m307$.Node.type* %.tmp5794, i8* %.tmp5795)
%.tmp5796 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5796
br label %.if.end.5784
.if.false.5784:
br label %.if.end.5784
.if.end.5784:
%.tmp5797 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5798 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5797)
%new_info.5799 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5798, %m1861$.AssignableInfo.type** %new_info.5799
%.tmp5800 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5799
%.tmp5801 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5800, i32 0, i32 3
%.tmp5802 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5761
store %m1861$.Type.type* %.tmp5802, %m1861$.Type.type** %.tmp5801
%.tmp5803 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5804 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5799
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5803, %m1861$.AssignableInfo.type* %.tmp5804)
%.tmp5805 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5799
%.tmp5806 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5805, i32 0, i32 2
%.tmp5808 = getelementptr [9 x i8], [9 x i8]*@.str5807, i32 0, i32 0
store i8* %.tmp5808, i8** %.tmp5806
%.tmp5809 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5810 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5811 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5810, i32 0, i32 3
%.tmp5812 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5811
%.tmp5813 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5809, %m1861$.Type.type* %.tmp5812)
%info_tr.5814 = alloca i8*
store i8* %.tmp5813, i8** %info_tr.5814
%.tmp5815 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5816 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5815, i32 0, i32 1
%.tmp5817 = load %m0$.File.type*, %m0$.File.type** %.tmp5816
%.tmp5819 = getelementptr [46 x i8], [46 x i8]*@.str5818, i32 0, i32 0
%.tmp5820 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5799
%.tmp5821 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5820)
%.tmp5822 = load i8*, i8** %info_tr.5814
%.tmp5823 = load i8*, i8** %info_tr.5814
%.tmp5824 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5663
%.tmp5825 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5824)
%.tmp5826 = load i32, i32* %field_id.5759
%.tmp5827 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5817, i8* %.tmp5819, i8* %.tmp5821, i8* %.tmp5822, i8* %.tmp5823, i8* %.tmp5825, i32 %.tmp5826)
%.tmp5828 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5829 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5830 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5829, i32 0, i32 7
%.tmp5831 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5830
%.tmp5832 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5831, i32 0, i32 7
%.tmp5833 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5832
%.tmp5834 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.5799
%.tmp5835 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5828, %m307$.Node.type* %.tmp5833, %m1861$.AssignableInfo.type* %.tmp5834)
ret %m1861$.AssignableInfo.type* %.tmp5835
br label %.if.end.5661
.if.false.5661:
%.tmp5836 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5837 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5836, i32 0, i32 2
%.tmp5838 = load i8*, i8** %.tmp5837
%.tmp5840 = getelementptr [9 x i8], [9 x i8]*@.str5839, i32 0, i32 0
%.tmp5841 = call i32(i8*,i8*) @strcmp(i8* %.tmp5838, i8* %.tmp5840)
%.tmp5842 = icmp eq i32 %.tmp5841, 0
br i1 %.tmp5842, label %.if.true.5843, label %.if.false.5843
.if.true.5843:
%.tmp5844 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5844
br label %.if.end.5843
.if.false.5843:
br label %.if.end.5843
.if.end.5843:
br label %.if.end.5661
.if.end.5661:
br label %.if.end.5624
.if.end.5624:
%.tmp5845 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5846 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5848 = getelementptr [43 x i8], [43 x i8]*@.str5847, i32 0, i32 0
%.tmp5849 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5845, %m307$.Node.type* %.tmp5846, i8* %.tmp5848)
%.tmp5850 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5851 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5850, i32 0, i32 2
%.tmp5852 = load i8*, i8** %.tmp5851
%.tmp5853 = call i32(i8*,...) @printf(i8* %.tmp5849, i8* %.tmp5852)
%.tmp5854 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5854
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.5855 = alloca i8*
store i8* null, i8** %err_msg.5855
%.tmp5856 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.5857 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5856, %m307$.Node.type** %curr_node.5857
%.tmp5858 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5859 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5858, i32 0, i32 0
%.tmp5860 = load i8*, i8** %.tmp5859
%.tmp5862 = getelementptr [17 x i8], [17 x i8]*@.str5861, i32 0, i32 0
%.tmp5863 = call i32(i8*,i8*) @strcmp(i8* %.tmp5860, i8* %.tmp5862)
%.tmp5864 = icmp eq i32 %.tmp5863, 0
%.tmp5865 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5866 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5865, i32 0, i32 0
%.tmp5867 = load i8*, i8** %.tmp5866
%.tmp5869 = getelementptr [16 x i8], [16 x i8]*@.str5868, i32 0, i32 0
%.tmp5870 = call i32(i8*,i8*) @strcmp(i8* %.tmp5867, i8* %.tmp5869)
%.tmp5871 = icmp eq i32 %.tmp5870, 0
%.tmp5872 = or i1 %.tmp5864, %.tmp5871
%.tmp5873 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5874 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5873, i32 0, i32 0
%.tmp5875 = load i8*, i8** %.tmp5874
%.tmp5877 = getelementptr [11 x i8], [11 x i8]*@.str5876, i32 0, i32 0
%.tmp5878 = call i32(i8*,i8*) @strcmp(i8* %.tmp5875, i8* %.tmp5877)
%.tmp5879 = icmp eq i32 %.tmp5878, 0
%.tmp5880 = or i1 %.tmp5872, %.tmp5879
br i1 %.tmp5880, label %.if.true.5881, label %.if.false.5881
.if.true.5881:
%.tmp5882 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5883 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5884 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5883, i32 0, i32 6
%.tmp5885 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5884
%.tmp5886 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5882, %m307$.Node.type* %.tmp5885)
ret %m1861$.AssignableInfo.type* %.tmp5886
br label %.if.end.5881
.if.false.5881:
br label %.if.end.5881
.if.end.5881:
%.tmp5887 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5888 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5887, i32 0, i32 0
%.tmp5889 = load i8*, i8** %.tmp5888
%.tmp5891 = getelementptr [12 x i8], [12 x i8]*@.str5890, i32 0, i32 0
%.tmp5892 = call i32(i8*,i8*) @strcmp(i8* %.tmp5889, i8* %.tmp5891)
%.tmp5893 = icmp ne i32 %.tmp5892, 0
br i1 %.tmp5893, label %.if.true.5894, label %.if.false.5894
.if.true.5894:
%.tmp5896 = getelementptr [92 x i8], [92 x i8]*@.str5895, i32 0, i32 0
%.tmp5897 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5898 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5897, i32 0, i32 0
%.tmp5899 = load i8*, i8** %.tmp5898
%.tmp5900 = call i32(i8*,...) @printf(i8* %.tmp5896, i8* %.tmp5899)
%.tmp5901 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5902 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5901, i32 0, i32 6
%.tmp5903 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5902
store %m307$.Node.type* %.tmp5903, %m307$.Node.type** %curr_node.5857
br label %.if.end.5894
.if.false.5894:
br label %.if.end.5894
.if.end.5894:
%.tmp5904 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5905 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5904, i32 0, i32 6
%.tmp5906 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5905
%assignable_name.5907 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5906, %m307$.Node.type** %assignable_name.5907
%.tmp5908 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5909 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5910 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5909, i32 0, i32 7
%.tmp5911 = load i8*, i8** %.tmp5910
%.tmp5912 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5913 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5912, i32 0, i32 6
%.tmp5914 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5913
%.tmp5915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5914, i32 0, i32 1
%.tmp5916 = load i8*, i8** %.tmp5915
%.tmp5917 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5908, i8* %.tmp5911, i8* %.tmp5916)
%scope_info.5918 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5917, %m1861$.ScopeItem.type** %scope_info.5918
%.tmp5919 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5918
%.tmp5920 = icmp eq %m1861$.ScopeItem.type* %.tmp5919, null
br i1 %.tmp5920, label %.if.true.5921, label %.if.false.5921
.if.true.5921:
%.tmp5922 = getelementptr i8*, i8** %err_msg.5855, i32 0
%.tmp5924 = getelementptr [41 x i8], [41 x i8]*@.str5923, i32 0, i32 0
%.tmp5925 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5926 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5925, i32 0, i32 6
%.tmp5927 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5926
%.tmp5928 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5927, i32 0, i32 1
%.tmp5929 = load i8*, i8** %.tmp5928
%.tmp5930 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5922, i8* %.tmp5924, i8* %.tmp5929)
%.tmp5931 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5932 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5933 = load i8*, i8** %err_msg.5855
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5931, %m307$.Node.type* %.tmp5932, i8* %.tmp5933)
%.tmp5934 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5934
br label %.if.end.5921
.if.false.5921:
br label %.if.end.5921
.if.end.5921:
%.tmp5935 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5918
%.tmp5936 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5935, i32 0, i32 1
%.tmp5937 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5936
%info.5938 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5937, %m1861$.AssignableInfo.type** %info.5938
%.tmp5939 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5938
%.tmp5940 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5939, i32 0, i32 2
%.tmp5941 = load i8*, i8** %.tmp5940
%.tmp5943 = getelementptr [7 x i8], [7 x i8]*@.str5942, i32 0, i32 0
%.tmp5944 = call i32(i8*,i8*) @strcmp(i8* %.tmp5941, i8* %.tmp5943)
%.tmp5945 = icmp eq i32 %.tmp5944, 0
br i1 %.tmp5945, label %.if.true.5946, label %.if.false.5946
.if.true.5946:
%.tmp5947 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5948 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5938
%.tmp5949 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5948)
%.tmp5950 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5951 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5950, i32 0, i32 6
%.tmp5952 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5951
%.tmp5953 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5952, i32 0, i32 7
%.tmp5954 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5953
%.tmp5955 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5954, i32 0, i32 7
%.tmp5956 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5955
%.tmp5957 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5956, i32 0, i32 1
%.tmp5958 = load i8*, i8** %.tmp5957
%.tmp5959 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5947, i8* %.tmp5949, i8* %.tmp5958)
store %m1861$.ScopeItem.type* %.tmp5959, %m1861$.ScopeItem.type** %scope_info.5918
%.tmp5960 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5918
%.tmp5961 = icmp eq %m1861$.ScopeItem.type* %.tmp5960, null
br i1 %.tmp5961, label %.if.true.5962, label %.if.false.5962
.if.true.5962:
%.tmp5963 = getelementptr i8*, i8** %err_msg.5855, i32 0
%.tmp5965 = getelementptr [31 x i8], [31 x i8]*@.str5964, i32 0, i32 0
%.tmp5966 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5967 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5966, i32 0, i32 6
%.tmp5968 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5967
%.tmp5969 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5968, i32 0, i32 7
%.tmp5970 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5969
%.tmp5971 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5970, i32 0, i32 7
%.tmp5972 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5971
%.tmp5973 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5972, i32 0, i32 1
%.tmp5974 = load i8*, i8** %.tmp5973
%.tmp5975 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5938
%.tmp5976 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5975)
%.tmp5977 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5963, i8* %.tmp5965, i8* %.tmp5974, i8* %.tmp5976)
%.tmp5978 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5979 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp5980 = load i8*, i8** %err_msg.5855
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5978, %m307$.Node.type* %.tmp5979, i8* %.tmp5980)
%.tmp5981 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5981
br label %.if.end.5962
.if.false.5962:
br label %.if.end.5962
.if.end.5962:
%.tmp5982 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.5918
%.tmp5983 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5982, i32 0, i32 1
%.tmp5984 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5983
store %m1861$.AssignableInfo.type* %.tmp5984, %m1861$.AssignableInfo.type** %info.5938
%.tmp5985 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5986 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5985, i32 0, i32 6
%.tmp5987 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5986
%.tmp5988 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5987, i32 0, i32 7
%.tmp5989 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5988
%.tmp5990 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5989, i32 0, i32 7
%.tmp5991 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5990
store %m307$.Node.type* %.tmp5991, %m307$.Node.type** %assignable_name.5907
br label %.if.end.5946
.if.false.5946:
%.tmp5992 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5993 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5992, i32 0, i32 6
%.tmp5994 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5993
store %m307$.Node.type* %.tmp5994, %m307$.Node.type** %assignable_name.5907
br label %.if.end.5946
.if.end.5946:
%.tmp5995 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5996 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.5907
%.tmp5997 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5938
%.tmp5998 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5995, %m307$.Node.type* %.tmp5996, %m1861$.AssignableInfo.type* %.tmp5997)
%base.5999 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5998, %m1861$.AssignableInfo.type** %base.5999
%.tmp6001 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp6002 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6001, i32 0, i32 6
%.tmp6003 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6002
%.tmp6004 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6003, i32 0, i32 7
%.tmp6005 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6004
%addr.6006 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6005, %m307$.Node.type** %addr.6006
br label %.for.start.6000
.for.start.6000:
%.tmp6007 = load %m307$.Node.type*, %m307$.Node.type** %addr.6006
%.tmp6008 = icmp ne %m307$.Node.type* %.tmp6007, null
br i1 %.tmp6008, label %.for.continue.6000, label %.for.end.6000
.for.continue.6000:
%.tmp6009 = load %m307$.Node.type*, %m307$.Node.type** %addr.6006
%.tmp6010 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6009, i32 0, i32 7
%.tmp6011 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6010
%index.6012 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6011, %m307$.Node.type** %index.6012
%.tmp6013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6014 = load %m307$.Node.type*, %m307$.Node.type** %index.6012
%.tmp6015 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6013, %m307$.Node.type* %.tmp6014)
%index_info.6016 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6015, %m1861$.AssignableInfo.type** %index_info.6016
%.tmp6017 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6018 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6016
%.tmp6019 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6018, i32 0, i32 3
%.tmp6020 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6019
%.tmp6021 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6017, %m1861$.Type.type* %.tmp6020)
%index_type.6022 = alloca i8*
store i8* %.tmp6021, i8** %index_type.6022
%.tmp6023 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6024 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6023, i32 0, i32 3
%.tmp6025 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6024
%.tmp6026 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6025, i32 0, i32 1
%.tmp6027 = load i8*, i8** %.tmp6026
%.tmp6028 = icmp ne i8* %.tmp6027, null
br i1 %.tmp6028, label %.if.true.6029, label %.if.false.6029
.if.true.6029:
%.tmp6030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6031 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6030, i32 0, i32 3
%.tmp6032 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6031
%.tmp6033 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6032, i32 0, i32 1
%.tmp6034 = load i8*, i8** %.tmp6033
%.tmp6036 = getelementptr [6 x i8], [6 x i8]*@.str6035, i32 0, i32 0
%.tmp6037 = call i32(i8*,i8*) @strcmp(i8* %.tmp6034, i8* %.tmp6036)
%.tmp6038 = icmp eq i32 %.tmp6037, 0
br i1 %.tmp6038, label %.if.true.6039, label %.if.false.6039
.if.true.6039:
%.tmp6040 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp6041 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6040)
%new_base.6042 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6041, %m1861$.AssignableInfo.type** %new_base.6042
%.tmp6043 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6042
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6043, %m1861$.AssignableInfo.type* %.tmp6044)
%.tmp6045 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6046 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6045, i32 0, i32 1
%.tmp6047 = load %m0$.File.type*, %m0$.File.type** %.tmp6046
%.tmp6049 = getelementptr [45 x i8], [45 x i8]*@.str6048, i32 0, i32 0
%.tmp6050 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6042
%.tmp6051 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6050)
%.tmp6052 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6053 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6054 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6053, i32 0, i32 3
%.tmp6055 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6054
%.tmp6056 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6052, %m1861$.Type.type* %.tmp6055)
%.tmp6057 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6058 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6059 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6058, i32 0, i32 3
%.tmp6060 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6059
%.tmp6061 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6057, %m1861$.Type.type* %.tmp6060)
%.tmp6062 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6063 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6062)
%.tmp6064 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6047, i8* %.tmp6049, i8* %.tmp6051, i8* %.tmp6056, i8* %.tmp6061, i8* %.tmp6063)
%.tmp6065 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6042
%.tmp6066 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6065, i32 0, i32 3
%.tmp6067 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6068 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6067, i32 0, i32 3
%.tmp6069 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6068
%.tmp6070 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6069, i32 0, i32 3
%.tmp6071 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6070
%.tmp6072 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp6071)
store %m1861$.Type.type* %.tmp6072, %m1861$.Type.type** %.tmp6066
%.tmp6073 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6042
%.tmp6074 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6073, i32 0, i32 3
%.tmp6075 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6074
%.tmp6076 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6075, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6076
%.tmp6077 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6042
store %m1861$.AssignableInfo.type* %.tmp6077, %m1861$.AssignableInfo.type** %base.5999
br label %.if.end.6039
.if.false.6039:
br label %.if.end.6039
.if.end.6039:
br label %.if.end.6029
.if.false.6029:
br label %.if.end.6029
.if.end.6029:
%.tmp6078 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6079 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6080 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6079, i32 0, i32 3
%.tmp6081 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6080
%.tmp6082 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6078, %m1861$.Type.type* %.tmp6081)
%base_type.6083 = alloca i8*
store i8* %.tmp6082, i8** %base_type.6083
%.tmp6084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6085 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6084)
%tmp_id.6086 = alloca i32
store i32 %.tmp6085, i32* %tmp_id.6086
%.tmp6087 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6088 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6087, i32 0, i32 1
%.tmp6089 = load %m0$.File.type*, %m0$.File.type** %.tmp6088
%.tmp6091 = getelementptr [28 x i8], [28 x i8]*@.str6090, i32 0, i32 0
%.tmp6092 = load i32, i32* %tmp_id.6086
%.tmp6093 = load i8*, i8** %base_type.6083
%.tmp6094 = load i8*, i8** %base_type.6083
%.tmp6095 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6096 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6095)
%.tmp6097 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6089, i8* %.tmp6091, i32 %.tmp6092, i8* %.tmp6093, i8* %.tmp6094, i8* %.tmp6096)
%.tmp6098 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.5857
%.tmp6099 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6098)
%new_base.6100 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6099, %m1861$.AssignableInfo.type** %new_base.6100
%.tmp6101 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6102 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6100
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6101, %m1861$.AssignableInfo.type* %.tmp6102)
%.tmp6103 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6104 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6103, i32 0, i32 3
%.tmp6105 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6104
%.tmp6106 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6105, i32 0, i32 3
%.tmp6107 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6106
%.tmp6108 = icmp eq %m1861$.Type.type* %.tmp6107, null
br i1 %.tmp6108, label %.if.true.6109, label %.if.false.6109
.if.true.6109:
%.tmp6110 = getelementptr i8*, i8** %err_msg.5855, i32 0
%.tmp6112 = getelementptr [35 x i8], [35 x i8]*@.str6111, i32 0, i32 0
%.tmp6113 = load i8*, i8** %base_type.6083
%.tmp6114 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6110, i8* %.tmp6112, i8* %.tmp6113)
%.tmp6115 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6116 = load %m307$.Node.type*, %m307$.Node.type** %addr.6006
%.tmp6117 = load i8*, i8** %err_msg.5855
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6115, %m307$.Node.type* %.tmp6116, i8* %.tmp6117)
%.tmp6118 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
ret %m1861$.AssignableInfo.type* %.tmp6118
br label %.if.end.6109
.if.false.6109:
br label %.if.end.6109
.if.end.6109:
%.tmp6119 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6100
%.tmp6120 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6119, i32 0, i32 3
%.tmp6121 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
%.tmp6122 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6121, i32 0, i32 3
%.tmp6123 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6122
%.tmp6124 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6123, i32 0, i32 3
%.tmp6125 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6124
store %m1861$.Type.type* %.tmp6125, %m1861$.Type.type** %.tmp6120
%.tmp6126 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6127 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6100
%.tmp6128 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6127, i32 0, i32 3
%.tmp6129 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6128
%.tmp6130 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6126, %m1861$.Type.type* %.tmp6129)
%base_type_2.6131 = alloca i8*
store i8* %.tmp6130, i8** %base_type_2.6131
%.tmp6132 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6133 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6132, i32 0, i32 1
%.tmp6134 = load %m0$.File.type*, %m0$.File.type** %.tmp6133
%.tmp6136 = getelementptr [44 x i8], [44 x i8]*@.str6135, i32 0, i32 0
%.tmp6137 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6100
%.tmp6138 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6137)
%.tmp6139 = load i8*, i8** %base_type_2.6131
%.tmp6140 = load i8*, i8** %base_type_2.6131
%.tmp6141 = load i32, i32* %tmp_id.6086
%.tmp6142 = load i8*, i8** %index_type.6022
%.tmp6143 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6016
%.tmp6144 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6143)
%.tmp6145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6134, i8* %.tmp6136, i8* %.tmp6138, i8* %.tmp6139, i8* %.tmp6140, i32 %.tmp6141, i8* %.tmp6142, i8* %.tmp6144)
%.tmp6146 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6100
store %m1861$.AssignableInfo.type* %.tmp6146, %m1861$.AssignableInfo.type** %base.5999
%.tmp6147 = load %m307$.Node.type*, %m307$.Node.type** %addr.6006
%.tmp6148 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6147, i32 0, i32 7
%.tmp6149 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6148
%.tmp6150 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6149, i32 0, i32 7
%.tmp6151 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6150
%.tmp6152 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6151, i32 0, i32 7
%.tmp6153 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6152
store %m307$.Node.type* %.tmp6153, %m307$.Node.type** %addr.6006
br label %.for.start.6000
.for.end.6000:
%.tmp6154 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.5999
ret %m1861$.AssignableInfo.type* %.tmp6154
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6155 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6156 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6155, i32 0, i32 6
%.tmp6157 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6156
%.tmp6159 = getelementptr [16 x i8], [16 x i8]*@.str6158, i32 0, i32 0
%.tmp6160 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6157, i8* %.tmp6159)
%assignable_start.6161 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6160, %m307$.Node.type** %assignable_start.6161
%.tmp6162 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6161
%.tmp6163 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6162)
%operator_stack.6164 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6163, %m1988$.SYStack.type** %operator_stack.6164
%.tmp6165 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6166 = ptrtoint %m1861$.StackHead.type* %.tmp6165 to i32
%.tmp6167 = call i8*(i32) @malloc(i32 %.tmp6166)
%.tmp6168 = bitcast i8* %.tmp6167 to %m1861$.StackHead.type*
%stack.6169 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6168, %m1861$.StackHead.type** %stack.6169
%.tmp6170 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6169
%.tmp6171 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6170, i32 0, i32 0
%.tmp6172 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6164
store %m1988$.SYStack.type* %.tmp6172, %m1988$.SYStack.type** %.tmp6171
%.tmp6173 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6174 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6169
%.tmp6175 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6173, %m1861$.StackHead.type* %.tmp6174)
%info.6176 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6175, %m1861$.AssignableInfo.type** %info.6176
%.tmp6177 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
%.tmp6178 = icmp eq %m1861$.AssignableInfo.type* %.tmp6177, null
br i1 %.tmp6178, label %.if.true.6179, label %.if.false.6179
.if.true.6179:
%.tmp6180 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
ret %m1861$.AssignableInfo.type* %.tmp6180
br label %.if.end.6179
.if.false.6179:
br label %.if.end.6179
.if.end.6179:
%.tmp6181 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6182 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6181, i32 0, i32 6
%.tmp6183 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6182
%.tmp6185 = getelementptr [5 x i8], [5 x i8]*@.str6184, i32 0, i32 0
%.tmp6186 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6183, i8* %.tmp6185)
%cast.6187 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6186, %m307$.Node.type** %cast.6187
%.tmp6188 = load %m307$.Node.type*, %m307$.Node.type** %cast.6187
%.tmp6189 = icmp ne %m307$.Node.type* %.tmp6188, null
br i1 %.tmp6189, label %.if.true.6190, label %.if.false.6190
.if.true.6190:
%.tmp6191 = load %m307$.Node.type*, %m307$.Node.type** %cast.6187
%.tmp6192 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6191, i32 0, i32 6
%.tmp6193 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6192
%.tmp6195 = getelementptr [5 x i8], [5 x i8]*@.str6194, i32 0, i32 0
%.tmp6196 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6193, i8* %.tmp6195)
%cast_type.6197 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6196, %m307$.Node.type** %cast_type.6197
%.tmp6198 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6199 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6197
%.tmp6200 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6199, i32 0, i32 6
%.tmp6201 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6200
%.tmp6202 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6198, %m307$.Node.type* %.tmp6201)
%type.6203 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6202, %m1861$.Type.type** %type.6203
%.tmp6204 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
%.tmp6205 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6204)
%prev_id.6206 = alloca i8*
store i8* %.tmp6205, i8** %prev_id.6206
%.tmp6207 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6208 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6207, %m1861$.AssignableInfo.type* %.tmp6208)
%.tmp6209 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6210 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
%.tmp6211 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6210, i32 0, i32 3
%.tmp6212 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6211
%.tmp6213 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6209, %m1861$.Type.type* %.tmp6212)
%from_type.6214 = alloca i8*
store i8* %.tmp6213, i8** %from_type.6214
%.tmp6215 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6216 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6203
%.tmp6217 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6215, %m1861$.Type.type* %.tmp6216)
%to_type.6218 = alloca i8*
store i8* %.tmp6217, i8** %to_type.6218
%.tmp6220 = getelementptr [8 x i8], [8 x i8]*@.str6219, i32 0, i32 0
%cast_fn.6221 = alloca i8*
store i8* %.tmp6220, i8** %cast_fn.6221
%.tmp6222 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
%.tmp6223 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6222, i32 0, i32 3
%.tmp6224 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6223
%.tmp6225 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6224, i32 0, i32 0
%.tmp6226 = load i8*, i8** %.tmp6225
%.tmp6228 = getelementptr [4 x i8], [4 x i8]*@.str6227, i32 0, i32 0
%.tmp6229 = call i32(i8*,i8*) @strcmp(i8* %.tmp6226, i8* %.tmp6228)
%.tmp6230 = icmp ne i32 %.tmp6229, 0
%.tmp6231 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6203
%.tmp6232 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6231, i32 0, i32 0
%.tmp6233 = load i8*, i8** %.tmp6232
%.tmp6235 = getelementptr [4 x i8], [4 x i8]*@.str6234, i32 0, i32 0
%.tmp6236 = call i32(i8*,i8*) @strcmp(i8* %.tmp6233, i8* %.tmp6235)
%.tmp6237 = icmp ne i32 %.tmp6236, 0
%.tmp6238 = and i1 %.tmp6230, %.tmp6237
br i1 %.tmp6238, label %.if.true.6239, label %.if.false.6239
.if.true.6239:
%.tmp6240 = load i8*, i8** %from_type.6214
%.tmp6241 = getelementptr i8, i8* %.tmp6240, i32 0
%.tmp6242 = load i8, i8* %.tmp6241
%.tmp6243 = icmp eq i8 %.tmp6242, 105
%.tmp6244 = load i8*, i8** %to_type.6218
%.tmp6245 = getelementptr i8, i8* %.tmp6244, i32 0
%.tmp6246 = load i8, i8* %.tmp6245
%.tmp6247 = icmp eq i8 %.tmp6246, 105
%.tmp6248 = and i1 %.tmp6243, %.tmp6247
br i1 %.tmp6248, label %.if.true.6249, label %.if.false.6249
.if.true.6249:
%from_size.6250 = alloca i32
store i32 0, i32* %from_size.6250
%to_size.6251 = alloca i32
store i32 0, i32* %to_size.6251
%.tmp6252 = load i8*, i8** %from_type.6214
%.tmp6254 = getelementptr [4 x i8], [4 x i8]*@.str6253, i32 0, i32 0
%.tmp6255 = getelementptr i32, i32* %from_size.6250, i32 0
%.tmp6256 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6252, i8* %.tmp6254, i32* %.tmp6255)
%.tmp6257 = load i8*, i8** %to_type.6218
%.tmp6259 = getelementptr [4 x i8], [4 x i8]*@.str6258, i32 0, i32 0
%.tmp6260 = getelementptr i32, i32* %to_size.6251, i32 0
%.tmp6261 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6257, i8* %.tmp6259, i32* %.tmp6260)
%.tmp6262 = load i32, i32* %from_size.6250
%.tmp6263 = load i32, i32* %to_size.6251
%.tmp6264 = icmp slt i32 %.tmp6262, %.tmp6263
br i1 %.tmp6264, label %.if.true.6265, label %.if.false.6265
.if.true.6265:
%.tmp6267 = getelementptr [5 x i8], [5 x i8]*@.str6266, i32 0, i32 0
store i8* %.tmp6267, i8** %cast_fn.6221
br label %.if.end.6265
.if.false.6265:
%.tmp6269 = getelementptr [6 x i8], [6 x i8]*@.str6268, i32 0, i32 0
store i8* %.tmp6269, i8** %cast_fn.6221
br label %.if.end.6265
.if.end.6265:
br label %.if.end.6249
.if.false.6249:
br label %.if.end.6249
.if.end.6249:
br label %.if.end.6239
.if.false.6239:
br label %.if.end.6239
.if.end.6239:
%.tmp6270 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6271 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6270, i32 0, i32 1
%.tmp6272 = load %m0$.File.type*, %m0$.File.type** %.tmp6271
%.tmp6274 = getelementptr [21 x i8], [21 x i8]*@.str6273, i32 0, i32 0
%.tmp6275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
%.tmp6276 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6275)
%.tmp6277 = load i8*, i8** %cast_fn.6221
%.tmp6278 = load i8*, i8** %from_type.6214
%.tmp6279 = load i8*, i8** %prev_id.6206
%.tmp6280 = load i8*, i8** %to_type.6218
%.tmp6281 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6272, i8* %.tmp6274, i8* %.tmp6276, i8* %.tmp6277, i8* %.tmp6278, i8* %.tmp6279, i8* %.tmp6280)
%.tmp6282 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
%.tmp6283 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6282, i32 0, i32 3
%.tmp6284 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6203
store %m1861$.Type.type* %.tmp6284, %m1861$.Type.type** %.tmp6283
br label %.if.end.6190
.if.false.6190:
br label %.if.end.6190
.if.end.6190:
%.tmp6285 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6176
ret %m1861$.AssignableInfo.type* %.tmp6285
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6286 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6287 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6286, i32 0, i32 0
%.tmp6288 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6287
%.tmp6289 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6288, i32 0, i32 0
%.tmp6290 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6289
%.tmp6291 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6290, i32 0, i32 0
%.tmp6292 = load i8*, i8** %.tmp6291
%.tmp6294 = getelementptr [16 x i8], [16 x i8]*@.str6293, i32 0, i32 0
%.tmp6295 = call i32(i8*,i8*) @strcmp(i8* %.tmp6292, i8* %.tmp6294)
%.tmp6296 = icmp eq i32 %.tmp6295, 0
br i1 %.tmp6296, label %.if.true.6297, label %.if.false.6297
.if.true.6297:
%.tmp6298 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6299 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6300 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6299, i32 0, i32 0
%.tmp6301 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6300
%.tmp6302 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6301, i32 0, i32 0
%.tmp6303 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6302
%.tmp6304 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6298, %m307$.Node.type* %.tmp6303)
ret %m1861$.AssignableInfo.type* %.tmp6304
br label %.if.end.6297
.if.false.6297:
br label %.if.end.6297
.if.end.6297:
%.tmp6305 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6306 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6305, i32 0, i32 0
%.tmp6307 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6306
%.tmp6308 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6307, i32 0, i32 0
%.tmp6309 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6308
%.tmp6310 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6309, i32 0, i32 6
%.tmp6311 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6310
%operator.6312 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6311, %m307$.Node.type** %operator.6312
%.tmp6313 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6314 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6313, i32 0, i32 0
%.tmp6315 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6316 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6315, i32 0, i32 0
%.tmp6317 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6316
%.tmp6318 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6317, i32 0, i32 1
%.tmp6319 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6318
store %m1988$.SYStack.type* %.tmp6319, %m1988$.SYStack.type** %.tmp6314
%.tmp6320 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6321 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6322 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6320, %m1861$.StackHead.type* %.tmp6321)
%A.6323 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6322, %m1861$.AssignableInfo.type** %A.6323
%.tmp6324 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6323
%.tmp6325 = icmp eq %m1861$.AssignableInfo.type* %.tmp6324, null
br i1 %.tmp6325, label %.if.true.6326, label %.if.false.6326
.if.true.6326:
%.tmp6327 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6323
ret %m1861$.AssignableInfo.type* %.tmp6327
br label %.if.end.6326
.if.false.6326:
br label %.if.end.6326
.if.end.6326:
%.tmp6328 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6329 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6328, i32 0, i32 0
%.tmp6330 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6331 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6330, i32 0, i32 0
%.tmp6332 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6331
%.tmp6333 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6332, i32 0, i32 1
%.tmp6334 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6333
store %m1988$.SYStack.type* %.tmp6334, %m1988$.SYStack.type** %.tmp6329
%.tmp6335 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6336 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6337 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6335, %m1861$.StackHead.type* %.tmp6336)
%B.6338 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6337, %m1861$.AssignableInfo.type** %B.6338
%.tmp6339 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6338
%.tmp6340 = icmp eq %m1861$.AssignableInfo.type* %.tmp6339, null
br i1 %.tmp6340, label %.if.true.6341, label %.if.false.6341
.if.true.6341:
%.tmp6342 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6338
ret %m1861$.AssignableInfo.type* %.tmp6342
br label %.if.end.6341
.if.false.6341:
br label %.if.end.6341
.if.end.6341:
%.tmp6343 = bitcast ptr null to %m307$.Node.type*
%.tmp6344 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6343)
%op_info.6345 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6344, %m1861$.AssignableInfo.type** %op_info.6345
%.tmp6346 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6345
%.tmp6347 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6346, i32 0, i32 3
%.tmp6348 = load %m307$.Node.type*, %m307$.Node.type** %operator.6312
%.tmp6349 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6348)
store %m1861$.Type.type* %.tmp6349, %m1861$.Type.type** %.tmp6347
%.tmp6350 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6351 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6345
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6350, %m1861$.AssignableInfo.type* %.tmp6351)
%.tmp6352 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6353 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6352, i32 0, i32 1
%.tmp6354 = load %m0$.File.type*, %m0$.File.type** %.tmp6353
%.tmp6356 = getelementptr [19 x i8], [19 x i8]*@.str6355, i32 0, i32 0
%.tmp6357 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6345
%.tmp6358 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6357)
%.tmp6359 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6360 = load %m307$.Node.type*, %m307$.Node.type** %operator.6312
%.tmp6361 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6359, %m307$.Node.type* %.tmp6360)
%.tmp6362 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6363 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6323
%.tmp6364 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6363, i32 0, i32 3
%.tmp6365 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6364
%.tmp6366 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6362, %m1861$.Type.type* %.tmp6365)
%.tmp6367 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6323
%.tmp6368 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6367)
%.tmp6369 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6338
%.tmp6370 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6369)
%.tmp6371 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6354, i8* %.tmp6356, i8* %.tmp6358, i8* %.tmp6361, i8* %.tmp6366, i8* %.tmp6368, i8* %.tmp6370)
%.tmp6372 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6345
ret %m1861$.AssignableInfo.type* %.tmp6372
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6373 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6374 = icmp eq %m307$.Node.type* %.tmp6373, null
br i1 %.tmp6374, label %.if.true.6375, label %.if.false.6375
.if.true.6375:
%.tmp6376 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6377 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6379 = getelementptr [31 x i8], [31 x i8]*@.str6378, i32 0, i32 0
%.tmp6380 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6376, %m307$.Node.type* %.tmp6377, i8* %.tmp6379)
%.tmp6381 = call i32(i8*,...) @printf(i8* %.tmp6380)
br label %.if.end.6375
.if.false.6375:
br label %.if.end.6375
.if.end.6375:
%.tmp6382 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6383 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6382, i32 0, i32 1
%.tmp6384 = load i8*, i8** %.tmp6383
%.tmp6386 = getelementptr [2 x i8], [2 x i8]*@.str6385, i32 0, i32 0
%.tmp6387 = call i32(i8*,i8*) @strcmp(i8* %.tmp6384, i8* %.tmp6386)
%.tmp6388 = icmp eq i32 %.tmp6387, 0
br i1 %.tmp6388, label %.if.true.6389, label %.if.false.6389
.if.true.6389:
%.tmp6391 = getelementptr [4 x i8], [4 x i8]*@.str6390, i32 0, i32 0
ret i8* %.tmp6391
br label %.if.end.6389
.if.false.6389:
%.tmp6392 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6393 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6392, i32 0, i32 1
%.tmp6394 = load i8*, i8** %.tmp6393
%.tmp6396 = getelementptr [2 x i8], [2 x i8]*@.str6395, i32 0, i32 0
%.tmp6397 = call i32(i8*,i8*) @strcmp(i8* %.tmp6394, i8* %.tmp6396)
%.tmp6398 = icmp eq i32 %.tmp6397, 0
br i1 %.tmp6398, label %.if.true.6399, label %.if.false.6399
.if.true.6399:
%.tmp6401 = getelementptr [4 x i8], [4 x i8]*@.str6400, i32 0, i32 0
ret i8* %.tmp6401
br label %.if.end.6399
.if.false.6399:
%.tmp6402 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6403 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6402, i32 0, i32 1
%.tmp6404 = load i8*, i8** %.tmp6403
%.tmp6406 = getelementptr [2 x i8], [2 x i8]*@.str6405, i32 0, i32 0
%.tmp6407 = call i32(i8*,i8*) @strcmp(i8* %.tmp6404, i8* %.tmp6406)
%.tmp6408 = icmp eq i32 %.tmp6407, 0
br i1 %.tmp6408, label %.if.true.6409, label %.if.false.6409
.if.true.6409:
%.tmp6411 = getelementptr [4 x i8], [4 x i8]*@.str6410, i32 0, i32 0
ret i8* %.tmp6411
br label %.if.end.6409
.if.false.6409:
%.tmp6412 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6413 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6412, i32 0, i32 1
%.tmp6414 = load i8*, i8** %.tmp6413
%.tmp6416 = getelementptr [2 x i8], [2 x i8]*@.str6415, i32 0, i32 0
%.tmp6417 = call i32(i8*,i8*) @strcmp(i8* %.tmp6414, i8* %.tmp6416)
%.tmp6418 = icmp eq i32 %.tmp6417, 0
br i1 %.tmp6418, label %.if.true.6419, label %.if.false.6419
.if.true.6419:
%.tmp6421 = getelementptr [5 x i8], [5 x i8]*@.str6420, i32 0, i32 0
ret i8* %.tmp6421
br label %.if.end.6419
.if.false.6419:
%.tmp6422 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6423 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6422, i32 0, i32 1
%.tmp6424 = load i8*, i8** %.tmp6423
%.tmp6426 = getelementptr [3 x i8], [3 x i8]*@.str6425, i32 0, i32 0
%.tmp6427 = call i32(i8*,i8*) @strcmp(i8* %.tmp6424, i8* %.tmp6426)
%.tmp6428 = icmp eq i32 %.tmp6427, 0
br i1 %.tmp6428, label %.if.true.6429, label %.if.false.6429
.if.true.6429:
%.tmp6431 = getelementptr [8 x i8], [8 x i8]*@.str6430, i32 0, i32 0
ret i8* %.tmp6431
br label %.if.end.6429
.if.false.6429:
%.tmp6432 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6433 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6432, i32 0, i32 1
%.tmp6434 = load i8*, i8** %.tmp6433
%.tmp6436 = getelementptr [3 x i8], [3 x i8]*@.str6435, i32 0, i32 0
%.tmp6437 = call i32(i8*,i8*) @strcmp(i8* %.tmp6434, i8* %.tmp6436)
%.tmp6438 = icmp eq i32 %.tmp6437, 0
br i1 %.tmp6438, label %.if.true.6439, label %.if.false.6439
.if.true.6439:
%.tmp6441 = getelementptr [8 x i8], [8 x i8]*@.str6440, i32 0, i32 0
ret i8* %.tmp6441
br label %.if.end.6439
.if.false.6439:
%.tmp6442 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6443 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6442, i32 0, i32 1
%.tmp6444 = load i8*, i8** %.tmp6443
%.tmp6446 = getelementptr [2 x i8], [2 x i8]*@.str6445, i32 0, i32 0
%.tmp6447 = call i32(i8*,i8*) @strcmp(i8* %.tmp6444, i8* %.tmp6446)
%.tmp6448 = icmp eq i32 %.tmp6447, 0
br i1 %.tmp6448, label %.if.true.6449, label %.if.false.6449
.if.true.6449:
%.tmp6451 = getelementptr [9 x i8], [9 x i8]*@.str6450, i32 0, i32 0
ret i8* %.tmp6451
br label %.if.end.6449
.if.false.6449:
%.tmp6452 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6453 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6452, i32 0, i32 1
%.tmp6454 = load i8*, i8** %.tmp6453
%.tmp6456 = getelementptr [2 x i8], [2 x i8]*@.str6455, i32 0, i32 0
%.tmp6457 = call i32(i8*,i8*) @strcmp(i8* %.tmp6454, i8* %.tmp6456)
%.tmp6458 = icmp eq i32 %.tmp6457, 0
br i1 %.tmp6458, label %.if.true.6459, label %.if.false.6459
.if.true.6459:
%.tmp6461 = getelementptr [9 x i8], [9 x i8]*@.str6460, i32 0, i32 0
ret i8* %.tmp6461
br label %.if.end.6459
.if.false.6459:
%.tmp6462 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6463 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6462, i32 0, i32 1
%.tmp6464 = load i8*, i8** %.tmp6463
%.tmp6466 = getelementptr [2 x i8], [2 x i8]*@.str6465, i32 0, i32 0
%.tmp6467 = call i32(i8*,i8*) @strcmp(i8* %.tmp6464, i8* %.tmp6466)
%.tmp6468 = icmp eq i32 %.tmp6467, 0
br i1 %.tmp6468, label %.if.true.6469, label %.if.false.6469
.if.true.6469:
%.tmp6471 = getelementptr [4 x i8], [4 x i8]*@.str6470, i32 0, i32 0
ret i8* %.tmp6471
br label %.if.end.6469
.if.false.6469:
%.tmp6472 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6473 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6472, i32 0, i32 1
%.tmp6474 = load i8*, i8** %.tmp6473
%.tmp6476 = getelementptr [2 x i8], [2 x i8]*@.str6475, i32 0, i32 0
%.tmp6477 = call i32(i8*,i8*) @strcmp(i8* %.tmp6474, i8* %.tmp6476)
%.tmp6478 = icmp eq i32 %.tmp6477, 0
br i1 %.tmp6478, label %.if.true.6479, label %.if.false.6479
.if.true.6479:
%.tmp6481 = getelementptr [3 x i8], [3 x i8]*@.str6480, i32 0, i32 0
ret i8* %.tmp6481
br label %.if.end.6479
.if.false.6479:
%.tmp6482 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6483 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6482, i32 0, i32 1
%.tmp6484 = load i8*, i8** %.tmp6483
%.tmp6486 = getelementptr [3 x i8], [3 x i8]*@.str6485, i32 0, i32 0
%.tmp6487 = call i32(i8*,i8*) @strcmp(i8* %.tmp6484, i8* %.tmp6486)
%.tmp6488 = icmp eq i32 %.tmp6487, 0
br i1 %.tmp6488, label %.if.true.6489, label %.if.false.6489
.if.true.6489:
%.tmp6491 = getelementptr [9 x i8], [9 x i8]*@.str6490, i32 0, i32 0
ret i8* %.tmp6491
br label %.if.end.6489
.if.false.6489:
%.tmp6492 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6493 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6492, i32 0, i32 1
%.tmp6494 = load i8*, i8** %.tmp6493
%.tmp6496 = getelementptr [3 x i8], [3 x i8]*@.str6495, i32 0, i32 0
%.tmp6497 = call i32(i8*,i8*) @strcmp(i8* %.tmp6494, i8* %.tmp6496)
%.tmp6498 = icmp eq i32 %.tmp6497, 0
br i1 %.tmp6498, label %.if.true.6499, label %.if.false.6499
.if.true.6499:
%.tmp6501 = getelementptr [9 x i8], [9 x i8]*@.str6500, i32 0, i32 0
ret i8* %.tmp6501
br label %.if.end.6499
.if.false.6499:
%.tmp6502 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6503 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6502, i32 0, i32 1
%.tmp6504 = load i8*, i8** %.tmp6503
%.tmp6506 = getelementptr [2 x i8], [2 x i8]*@.str6505, i32 0, i32 0
%.tmp6507 = call i32(i8*,i8*) @strcmp(i8* %.tmp6504, i8* %.tmp6506)
%.tmp6508 = icmp eq i32 %.tmp6507, 0
br i1 %.tmp6508, label %.if.true.6509, label %.if.false.6509
.if.true.6509:
%.tmp6511 = getelementptr [5 x i8], [5 x i8]*@.str6510, i32 0, i32 0
ret i8* %.tmp6511
br label %.if.end.6509
.if.false.6509:
%.tmp6512 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6513 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6515 = getelementptr [30 x i8], [30 x i8]*@.str6514, i32 0, i32 0
%.tmp6516 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6512, %m307$.Node.type* %.tmp6513, i8* %.tmp6515)
%.tmp6517 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6518 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6517, i32 0, i32 1
%.tmp6519 = load i8*, i8** %.tmp6518
%.tmp6520 = call i32(i8*,...) @printf(i8* %.tmp6516, i8* %.tmp6519)
br label %.if.end.6509
.if.end.6509:
br label %.if.end.6499
.if.end.6499:
br label %.if.end.6489
.if.end.6489:
br label %.if.end.6479
.if.end.6479:
br label %.if.end.6469
.if.end.6469:
br label %.if.end.6459
.if.end.6459:
br label %.if.end.6449
.if.end.6449:
br label %.if.end.6439
.if.end.6439:
br label %.if.end.6429
.if.end.6429:
br label %.if.end.6419
.if.end.6419:
br label %.if.end.6409
.if.end.6409:
br label %.if.end.6399
.if.end.6399:
br label %.if.end.6389
.if.end.6389:
%.tmp6522 = getelementptr [4 x i8], [4 x i8]*@.str6521, i32 0, i32 0
ret i8* %.tmp6522
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6523 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6524 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6523, %m1861$.Type.type** %type.6524
%.tmp6525 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6526 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6525, i32 0, i32 1
%.tmp6527 = load i8*, i8** %.tmp6526
%.tmp6529 = getelementptr [3 x i8], [3 x i8]*@.str6528, i32 0, i32 0
%.tmp6530 = call i32(i8*,i8*) @strcmp(i8* %.tmp6527, i8* %.tmp6529)
%.tmp6531 = icmp eq i32 %.tmp6530, 0
%.tmp6532 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6533 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6532, i32 0, i32 1
%.tmp6534 = load i8*, i8** %.tmp6533
%.tmp6536 = getelementptr [3 x i8], [3 x i8]*@.str6535, i32 0, i32 0
%.tmp6537 = call i32(i8*,i8*) @strcmp(i8* %.tmp6534, i8* %.tmp6536)
%.tmp6538 = icmp eq i32 %.tmp6537, 0
%.tmp6539 = or i1 %.tmp6531, %.tmp6538
%.tmp6540 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6541 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6540, i32 0, i32 1
%.tmp6542 = load i8*, i8** %.tmp6541
%.tmp6544 = getelementptr [2 x i8], [2 x i8]*@.str6543, i32 0, i32 0
%.tmp6545 = call i32(i8*,i8*) @strcmp(i8* %.tmp6542, i8* %.tmp6544)
%.tmp6546 = icmp eq i32 %.tmp6545, 0
%.tmp6547 = or i1 %.tmp6539, %.tmp6546
%.tmp6548 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6549 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6548, i32 0, i32 1
%.tmp6550 = load i8*, i8** %.tmp6549
%.tmp6552 = getelementptr [2 x i8], [2 x i8]*@.str6551, i32 0, i32 0
%.tmp6553 = call i32(i8*,i8*) @strcmp(i8* %.tmp6550, i8* %.tmp6552)
%.tmp6554 = icmp eq i32 %.tmp6553, 0
%.tmp6555 = or i1 %.tmp6547, %.tmp6554
%.tmp6556 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6557 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6556, i32 0, i32 1
%.tmp6558 = load i8*, i8** %.tmp6557
%.tmp6560 = getelementptr [2 x i8], [2 x i8]*@.str6559, i32 0, i32 0
%.tmp6561 = call i32(i8*,i8*) @strcmp(i8* %.tmp6558, i8* %.tmp6560)
%.tmp6562 = icmp eq i32 %.tmp6561, 0
%.tmp6563 = or i1 %.tmp6555, %.tmp6562
%.tmp6564 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6565 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6564, i32 0, i32 1
%.tmp6566 = load i8*, i8** %.tmp6565
%.tmp6568 = getelementptr [2 x i8], [2 x i8]*@.str6567, i32 0, i32 0
%.tmp6569 = call i32(i8*,i8*) @strcmp(i8* %.tmp6566, i8* %.tmp6568)
%.tmp6570 = icmp eq i32 %.tmp6569, 0
%.tmp6571 = or i1 %.tmp6563, %.tmp6570
%.tmp6572 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6573 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6572, i32 0, i32 1
%.tmp6574 = load i8*, i8** %.tmp6573
%.tmp6576 = getelementptr [3 x i8], [3 x i8]*@.str6575, i32 0, i32 0
%.tmp6577 = call i32(i8*,i8*) @strcmp(i8* %.tmp6574, i8* %.tmp6576)
%.tmp6578 = icmp eq i32 %.tmp6577, 0
%.tmp6579 = or i1 %.tmp6571, %.tmp6578
%.tmp6580 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6581 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6580, i32 0, i32 1
%.tmp6582 = load i8*, i8** %.tmp6581
%.tmp6584 = getelementptr [3 x i8], [3 x i8]*@.str6583, i32 0, i32 0
%.tmp6585 = call i32(i8*,i8*) @strcmp(i8* %.tmp6582, i8* %.tmp6584)
%.tmp6586 = icmp eq i32 %.tmp6585, 0
%.tmp6587 = or i1 %.tmp6579, %.tmp6586
br i1 %.tmp6587, label %.if.true.6588, label %.if.false.6588
.if.true.6588:
%.tmp6589 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6524
%.tmp6590 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6589, i32 0, i32 0
%.tmp6592 = getelementptr [5 x i8], [5 x i8]*@.str6591, i32 0, i32 0
store i8* %.tmp6592, i8** %.tmp6590
br label %.if.end.6588
.if.false.6588:
%.tmp6593 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6524
%.tmp6594 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6593, i32 0, i32 0
%.tmp6596 = getelementptr [4 x i8], [4 x i8]*@.str6595, i32 0, i32 0
store i8* %.tmp6596, i8** %.tmp6594
br label %.if.end.6588
.if.end.6588:
%.tmp6597 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6524
ret %m1861$.Type.type* %.tmp6597
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6598 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6599 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6598, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6600 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6601 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6600, %m307$.Node.type** %mono.6601
%err_buf.6602 = alloca i8*
store i8* null, i8** %err_buf.6602
%buf.6603 = alloca i8*
store i8* null, i8** %buf.6603
%.tmp6604 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6605 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6604, i32 0, i32 6
%.tmp6606 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6605
%.tmp6607 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6606, i32 0, i32 0
%.tmp6608 = load i8*, i8** %.tmp6607
%.tmp6610 = getelementptr [7 x i8], [7 x i8]*@.str6609, i32 0, i32 0
%.tmp6611 = call i32(i8*,i8*) @strcmp(i8* %.tmp6608, i8* %.tmp6610)
%.tmp6612 = icmp eq i32 %.tmp6611, 0
br i1 %.tmp6612, label %.if.true.6613, label %.if.false.6613
.if.true.6613:
%.tmp6614 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6615 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6614)
store %m1861$.AssignableInfo.type* %.tmp6615, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6616 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6617 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6616, i32 0, i32 3
%.tmp6618 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6618, %m1861$.Type.type** %.tmp6617
%.tmp6619 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6620 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6619, i32 0, i32 3
%.tmp6621 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6620
%.tmp6622 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6621, i32 0, i32 0
%.tmp6624 = getelementptr [4 x i8], [4 x i8]*@.str6623, i32 0, i32 0
store i8* %.tmp6624, i8** %.tmp6622
%.tmp6625 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6626 = load i8, i8* @SCOPE_CONST
%.tmp6627 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6628 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6627, i32 0, i32 6
%.tmp6629 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6628
%.tmp6630 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6629, i32 0, i32 1
%.tmp6631 = load i8*, i8** %.tmp6630
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6625, i8 %.tmp6626, i8* %.tmp6631)
br label %.if.end.6613
.if.false.6613:
%.tmp6632 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6633 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6632, i32 0, i32 6
%.tmp6634 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6633
%.tmp6635 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6634, i32 0, i32 0
%.tmp6636 = load i8*, i8** %.tmp6635
%.tmp6638 = getelementptr [5 x i8], [5 x i8]*@.str6637, i32 0, i32 0
%.tmp6639 = call i32(i8*,i8*) @strcmp(i8* %.tmp6636, i8* %.tmp6638)
%.tmp6640 = icmp eq i32 %.tmp6639, 0
br i1 %.tmp6640, label %.if.true.6641, label %.if.false.6641
.if.true.6641:
%.tmp6642 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6643 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6642, i32 0, i32 6
%.tmp6644 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6643
%.tmp6645 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6644, i32 0, i32 1
%.tmp6646 = load i8*, i8** %.tmp6645
%.tmp6648 = getelementptr [5 x i8], [5 x i8]*@.str6647, i32 0, i32 0
%.tmp6649 = call i32(i8*,i8*) @strcmp(i8* %.tmp6646, i8* %.tmp6648)
%.tmp6650 = icmp ne i32 %.tmp6649, 0
br i1 %.tmp6650, label %.if.true.6651, label %.if.false.6651
.if.true.6651:
%.tmp6652 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6653 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6655 = getelementptr [42 x i8], [42 x i8]*@.str6654, i32 0, i32 0
%.tmp6656 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6652, %m307$.Node.type* %.tmp6653, i8* %.tmp6655)
%.tmp6657 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6658 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6657, i32 0, i32 6
%.tmp6659 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6658
%.tmp6660 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6659, i32 0, i32 1
%.tmp6661 = load i8*, i8** %.tmp6660
%.tmp6662 = call i32(i8*,...) @printf(i8* %.tmp6656, i8* %.tmp6661)
%.tmp6663 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6663
br label %.if.end.6651
.if.false.6651:
br label %.if.end.6651
.if.end.6651:
%.tmp6664 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6665 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6664)
store %m1861$.AssignableInfo.type* %.tmp6665, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6666 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6667 = load i8, i8* @SCOPE_CONST
%.tmp6669 = getelementptr [5 x i8], [5 x i8]*@.str6668, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6666, i8 %.tmp6667, i8* %.tmp6669)
%.tmp6670 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6671 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6670, i32 0, i32 3
%.tmp6672 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6672, %m1861$.Type.type** %.tmp6671
%.tmp6673 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6674 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6673, i32 0, i32 3
%.tmp6675 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6674
%.tmp6676 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6675, i32 0, i32 0
%.tmp6678 = getelementptr [8 x i8], [8 x i8]*@.str6677, i32 0, i32 0
store i8* %.tmp6678, i8** %.tmp6676
br label %.if.end.6641
.if.false.6641:
%.tmp6679 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6680 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6679, i32 0, i32 6
%.tmp6681 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6680
%.tmp6682 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6681, i32 0, i32 0
%.tmp6683 = load i8*, i8** %.tmp6682
%.tmp6685 = getelementptr [17 x i8], [17 x i8]*@.str6684, i32 0, i32 0
%.tmp6686 = call i32(i8*,i8*) @strcmp(i8* %.tmp6683, i8* %.tmp6685)
%.tmp6687 = icmp eq i32 %.tmp6686, 0
br i1 %.tmp6687, label %.if.true.6688, label %.if.false.6688
.if.true.6688:
%.tmp6689 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6690 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6689)
store %m1861$.AssignableInfo.type* %.tmp6690, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6691 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6692 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6691, i32 0, i32 6
%.tmp6693 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6692
%.tmp6694 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6693, i32 0, i32 6
%.tmp6695 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6694
%.tmp6697 = getelementptr [12 x i8], [12 x i8]*@.str6696, i32 0, i32 0
%.tmp6698 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6695, i8* %.tmp6697)
%dest.6699 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6698, %m307$.Node.type** %dest.6699
%.tmp6700 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6701 = load %m307$.Node.type*, %m307$.Node.type** %dest.6699
%.tmp6702 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6700, %m307$.Node.type* %.tmp6701)
%var_info.6703 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6702, %m1861$.AssignableInfo.type** %var_info.6703
%.tmp6704 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6703
%.tmp6705 = icmp eq %m1861$.AssignableInfo.type* %.tmp6704, null
br i1 %.tmp6705, label %.if.true.6706, label %.if.false.6706
.if.true.6706:
%.tmp6707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
ret %m1861$.AssignableInfo.type* %.tmp6707
br label %.if.end.6706
.if.false.6706:
br label %.if.end.6706
.if.end.6706:
%.tmp6708 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6709 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6703
%.tmp6710 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6709, i32 0, i32 3
%.tmp6711 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6710
%.tmp6712 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6708, %m1861$.Type.type* %.tmp6711)
%var_type_repr.6713 = alloca i8*
store i8* %.tmp6712, i8** %var_type_repr.6713
%.tmp6714 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6715 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6714, %m1861$.AssignableInfo.type* %.tmp6715)
%.tmp6716 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6717 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6716, i32 0, i32 3
%.tmp6718 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6703
%.tmp6719 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6718, i32 0, i32 3
%.tmp6720 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6719
store %m1861$.Type.type* %.tmp6720, %m1861$.Type.type** %.tmp6717
%.tmp6722 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6723 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6722, i32 0, i32 6
%.tmp6724 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6723
%.tmp6725 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6724, i32 0, i32 6
%.tmp6726 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6725
%ptr.6727 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6726, %m307$.Node.type** %ptr.6727
br label %.for.start.6721
.for.start.6721:
%.tmp6728 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6727
%.tmp6729 = load %m307$.Node.type*, %m307$.Node.type** %dest.6699
%.tmp6730 = icmp ne %m307$.Node.type* %.tmp6728, %.tmp6729
br i1 %.tmp6730, label %.for.continue.6721, label %.for.end.6721
.for.continue.6721:
%.tmp6731 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6732 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6731, %m1861$.Type.type** %type.6732
%.tmp6733 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6732
%.tmp6734 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6733, i32 0, i32 3
%.tmp6735 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6736 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6735, i32 0, i32 3
%.tmp6737 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6736
store %m1861$.Type.type* %.tmp6737, %m1861$.Type.type** %.tmp6734
%.tmp6738 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6732
%.tmp6739 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6738, i32 0, i32 0
%.tmp6741 = getelementptr [4 x i8], [4 x i8]*@.str6740, i32 0, i32 0
store i8* %.tmp6741, i8** %.tmp6739
%.tmp6742 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6743 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6742, i32 0, i32 3
%.tmp6744 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6732
store %m1861$.Type.type* %.tmp6744, %m1861$.Type.type** %.tmp6743
%.tmp6745 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6727
%.tmp6746 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6745, i32 0, i32 7
%.tmp6747 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6746
store %m307$.Node.type* %.tmp6747, %m307$.Node.type** %ptr.6727
br label %.for.start.6721
.for.end.6721:
%.tmp6748 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6749 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6748, i32 0, i32 6
%.tmp6750 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6749
%.tmp6751 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6750, i32 0, i32 6
%.tmp6752 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6751
%.tmp6753 = load %m307$.Node.type*, %m307$.Node.type** %dest.6699
%.tmp6754 = icmp ne %m307$.Node.type* %.tmp6752, %.tmp6753
br i1 %.tmp6754, label %.if.true.6755, label %.if.false.6755
.if.true.6755:
%.tmp6756 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6757 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6756, i32 0, i32 1
%.tmp6758 = load %m0$.File.type*, %m0$.File.type** %.tmp6757
%.tmp6760 = getelementptr [38 x i8], [38 x i8]*@.str6759, i32 0, i32 0
%.tmp6761 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6762 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6761)
%.tmp6763 = load i8*, i8** %var_type_repr.6713
%.tmp6764 = load i8*, i8** %var_type_repr.6713
%.tmp6765 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6703
%.tmp6766 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6765)
%.tmp6767 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6758, i8* %.tmp6760, i8* %.tmp6762, i8* %.tmp6763, i8* %.tmp6764, i8* %.tmp6766)
br label %.if.end.6755
.if.false.6755:
%.tmp6768 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6769 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6768, i32 0, i32 1
%.tmp6770 = load %m0$.File.type*, %m0$.File.type** %.tmp6769
%.tmp6772 = getelementptr [22 x i8], [22 x i8]*@.str6771, i32 0, i32 0
%.tmp6773 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6774 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6773)
%.tmp6775 = load i8*, i8** %var_type_repr.6713
%.tmp6776 = load i8*, i8** %var_type_repr.6713
%.tmp6777 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6703
%.tmp6778 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6777)
%.tmp6779 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6770, i8* %.tmp6772, i8* %.tmp6774, i8* %.tmp6775, i8* %.tmp6776, i8* %.tmp6778)
br label %.if.end.6755
.if.end.6755:
br label %.if.end.6688
.if.false.6688:
%.tmp6780 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6781 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6780, i32 0, i32 6
%.tmp6782 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6781
%.tmp6783 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6782, i32 0, i32 0
%.tmp6784 = load i8*, i8** %.tmp6783
%.tmp6786 = getelementptr [8 x i8], [8 x i8]*@.str6785, i32 0, i32 0
%.tmp6787 = call i32(i8*,i8*) @strcmp(i8* %.tmp6784, i8* %.tmp6786)
%.tmp6788 = icmp eq i32 %.tmp6787, 0
br i1 %.tmp6788, label %.if.true.6789, label %.if.false.6789
.if.true.6789:
%.tmp6790 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6791 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6790)
store %m1861$.AssignableInfo.type* %.tmp6791, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6792 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6793 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6792, i32 0, i32 3
%.tmp6794 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6794, %m1861$.Type.type** %.tmp6793
%.tmp6795 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6796 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6795, i32 0, i32 3
%.tmp6797 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6796
%.tmp6798 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6797, i32 0, i32 0
%.tmp6800 = getelementptr [5 x i8], [5 x i8]*@.str6799, i32 0, i32 0
store i8* %.tmp6800, i8** %.tmp6798
%.tmp6801 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6802 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6801, i32 0, i32 6
%.tmp6803 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6802
%.tmp6804 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6803, i32 0, i32 6
%.tmp6805 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6804
%.tmp6806 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6805, i32 0, i32 1
%.tmp6807 = load i8*, i8** %.tmp6806
%.tmp6809 = getelementptr [6 x i8], [6 x i8]*@.str6808, i32 0, i32 0
%.tmp6810 = call i32(i8*,i8*) @strcmp(i8* %.tmp6807, i8* %.tmp6809)
%.tmp6811 = icmp eq i32 %.tmp6810, 0
br i1 %.tmp6811, label %.if.true.6812, label %.if.false.6812
.if.true.6812:
%.tmp6813 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6814 = load i8, i8* @SCOPE_CONST
%.tmp6816 = getelementptr [2 x i8], [2 x i8]*@.str6815, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6813, i8 %.tmp6814, i8* %.tmp6816)
br label %.if.end.6812
.if.false.6812:
%.tmp6817 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6818 = load i8, i8* @SCOPE_CONST
%.tmp6820 = getelementptr [2 x i8], [2 x i8]*@.str6819, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6817, i8 %.tmp6818, i8* %.tmp6820)
br label %.if.end.6812
.if.end.6812:
br label %.if.end.6789
.if.false.6789:
%.tmp6821 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6822 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6821, i32 0, i32 6
%.tmp6823 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6822
%.tmp6824 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6823, i32 0, i32 0
%.tmp6825 = load i8*, i8** %.tmp6824
%.tmp6827 = getelementptr [8 x i8], [8 x i8]*@.str6826, i32 0, i32 0
%.tmp6828 = call i32(i8*,i8*) @strcmp(i8* %.tmp6825, i8* %.tmp6827)
%.tmp6829 = icmp eq i32 %.tmp6828, 0
br i1 %.tmp6829, label %.if.true.6830, label %.if.false.6830
.if.true.6830:
%.tmp6831 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6832 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6833 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6832, i32 0, i32 6
%.tmp6834 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6833
%.tmp6835 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6834, i32 0, i32 6
%.tmp6836 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6835
%.tmp6837 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6831, %m307$.Node.type* %.tmp6836)
store %m1861$.AssignableInfo.type* %.tmp6837, %m1861$.AssignableInfo.type** %assignable_info.6599
br label %.if.end.6830
.if.false.6830:
%.tmp6838 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6839 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6838, i32 0, i32 6
%.tmp6840 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6839
%.tmp6841 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6840, i32 0, i32 0
%.tmp6842 = load i8*, i8** %.tmp6841
%.tmp6844 = getelementptr [7 x i8], [7 x i8]*@.str6843, i32 0, i32 0
%.tmp6845 = call i32(i8*,i8*) @strcmp(i8* %.tmp6842, i8* %.tmp6844)
%.tmp6846 = icmp eq i32 %.tmp6845, 0
br i1 %.tmp6846, label %.if.true.6847, label %.if.false.6847
.if.true.6847:
%.tmp6848 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6849 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6850 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6849, i32 0, i32 6
%.tmp6851 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6850
%.tmp6852 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6851, i32 0, i32 1
%.tmp6853 = load i8*, i8** %.tmp6852
%.tmp6854 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp6848, i8* %.tmp6853)
%string_info.6855 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6854, %m1861$.AssignableInfo.type** %string_info.6855
%.tmp6856 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6857 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6856)
store %m1861$.AssignableInfo.type* %.tmp6857, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6858 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6859 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6858, %m1861$.AssignableInfo.type* %.tmp6859)
%.tmp6860 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6861 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6855
%.tmp6862 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6861, i32 0, i32 3
%.tmp6863 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6862
%.tmp6864 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6860, %m1861$.Type.type* %.tmp6863)
%str_tr.6865 = alloca i8*
store i8* %.tmp6864, i8** %str_tr.6865
%.tmp6866 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6867 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6866, i32 0, i32 1
%.tmp6868 = load %m0$.File.type*, %m0$.File.type** %.tmp6867
%.tmp6870 = getelementptr [44 x i8], [44 x i8]*@.str6869, i32 0, i32 0
%.tmp6871 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6872 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6871)
%.tmp6873 = load i8*, i8** %str_tr.6865
%.tmp6874 = load i8*, i8** %str_tr.6865
%.tmp6875 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.6855
%.tmp6876 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6875)
%.tmp6877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6868, i8* %.tmp6870, i8* %.tmp6872, i8* %.tmp6873, i8* %.tmp6874, i8* %.tmp6876)
%.tmp6878 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6879 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6878, i32 0, i32 3
%.tmp6880 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6880, %m1861$.Type.type** %.tmp6879
%.tmp6881 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6882 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6881, i32 0, i32 3
%.tmp6883 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6882
%.tmp6884 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6883, i32 0, i32 0
%.tmp6886 = getelementptr [4 x i8], [4 x i8]*@.str6885, i32 0, i32 0
store i8* %.tmp6886, i8** %.tmp6884
%.tmp6887 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6888 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6887, i32 0, i32 3
%.tmp6889 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6888
%.tmp6890 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6889, i32 0, i32 3
%.tmp6891 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6891, %m1861$.Type.type** %.tmp6890
%.tmp6892 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6893 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6892, i32 0, i32 3
%.tmp6894 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6893
%.tmp6895 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6894, i32 0, i32 3
%.tmp6896 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6895
%.tmp6897 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6896, i32 0, i32 0
%.tmp6899 = getelementptr [4 x i8], [4 x i8]*@.str6898, i32 0, i32 0
store i8* %.tmp6899, i8** %.tmp6897
br label %.if.end.6847
.if.false.6847:
%.tmp6900 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6900, i32 0, i32 6
%.tmp6902 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6901
%.tmp6903 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6902, i32 0, i32 0
%.tmp6904 = load i8*, i8** %.tmp6903
%.tmp6906 = getelementptr [4 x i8], [4 x i8]*@.str6905, i32 0, i32 0
%.tmp6907 = call i32(i8*,i8*) @strcmp(i8* %.tmp6904, i8* %.tmp6906)
%.tmp6908 = icmp eq i32 %.tmp6907, 0
br i1 %.tmp6908, label %.if.true.6909, label %.if.false.6909
.if.true.6909:
%.tmp6910 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6911 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6910)
store %m1861$.AssignableInfo.type* %.tmp6911, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6912 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6913 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6912, i32 0, i32 6
%.tmp6914 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6913
%.tmp6915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6914, i32 0, i32 1
%.tmp6916 = load i8*, i8** %.tmp6915
%.tmp6917 = call i32(i8*) @strlen(i8* %.tmp6916)
%chr_len.6918 = alloca i32
store i32 %.tmp6917, i32* %chr_len.6918
%.tmp6919 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6920 = load i8, i8* @SCOPE_CONST
%.tmp6922 = getelementptr [2 x i8], [2 x i8]*@.str6921, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6919, i8 %.tmp6920, i8* %.tmp6922)
%.tmp6923 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6924 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6923, i32 0, i32 0
%.tmp6925 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6926 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6925, i32 0, i32 6
%.tmp6927 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6926
%.tmp6928 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6927, i32 0, i32 1
%.tmp6929 = load i8*, i8** %.tmp6928
%.tmp6930 = call i8*(i8*) @m2233$chr_to_llvm.cp.cp(i8* %.tmp6929)
store i8* %.tmp6930, i8** %.tmp6924
%.tmp6931 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6932 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6931, i32 0, i32 0
%.tmp6933 = load i8*, i8** %.tmp6932
%.tmp6934 = icmp eq i8* %.tmp6933, null
br i1 %.tmp6934, label %.if.true.6935, label %.if.false.6935
.if.true.6935:
%.tmp6936 = getelementptr i8*, i8** %err_buf.6602, i32 0
%.tmp6938 = getelementptr [22 x i8], [22 x i8]*@.str6937, i32 0, i32 0
%.tmp6939 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6940 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6939, i32 0, i32 6
%.tmp6941 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6940
%.tmp6942 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6941, i32 0, i32 1
%.tmp6943 = load i8*, i8** %.tmp6942
%.tmp6944 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6936, i8* %.tmp6938, i8* %.tmp6943)
%.tmp6945 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6945
br label %.if.end.6935
.if.false.6935:
br label %.if.end.6935
.if.end.6935:
%.tmp6946 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6947 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6946, i32 0, i32 3
%.tmp6948 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6948, %m1861$.Type.type** %.tmp6947
%.tmp6949 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6950 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6949, i32 0, i32 3
%.tmp6951 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6950
%.tmp6952 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6951, i32 0, i32 0
%.tmp6954 = getelementptr [4 x i8], [4 x i8]*@.str6953, i32 0, i32 0
store i8* %.tmp6954, i8** %.tmp6952
br label %.if.end.6909
.if.false.6909:
%.tmp6955 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6956 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6958 = getelementptr [40 x i8], [40 x i8]*@.str6957, i32 0, i32 0
%.tmp6959 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6955, %m307$.Node.type* %.tmp6956, i8* %.tmp6958)
%.tmp6960 = load %m307$.Node.type*, %m307$.Node.type** %mono.6601
%.tmp6961 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6960, i32 0, i32 6
%.tmp6962 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6961
%.tmp6963 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6962, i32 0, i32 0
%.tmp6964 = load i8*, i8** %.tmp6963
%.tmp6965 = call i32(i8*,...) @printf(i8* %.tmp6959, i8* %.tmp6964)
%.tmp6966 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6966
br label %.if.end.6909
.if.end.6909:
br label %.if.end.6847
.if.end.6847:
br label %.if.end.6830
.if.end.6830:
br label %.if.end.6789
.if.end.6789:
br label %.if.end.6688
.if.end.6688:
br label %.if.end.6641
.if.end.6641:
br label %.if.end.6613
.if.end.6613:
%.tmp6967 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6968 = icmp eq %m1861$.AssignableInfo.type* %.tmp6967, null
br i1 %.tmp6968, label %.if.true.6969, label %.if.false.6969
.if.true.6969:
%.tmp6970 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6970
br label %.if.end.6969
.if.false.6969:
br label %.if.end.6969
.if.end.6969:
%.tmp6971 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6972 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6971, i32 0, i32 4
%.tmp6973 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6974 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6973, i32 0, i32 3
%.tmp6975 = load i32, i32* %.tmp6974
store i32 %.tmp6975, i32* %.tmp6972
%.tmp6976 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6977 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6976, i32 0, i32 5
%.tmp6978 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6979 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6978, i32 0, i32 4
%.tmp6980 = load i32, i32* %.tmp6979
store i32 %.tmp6980, i32* %.tmp6977
%.tmp6981 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6599
%.tmp6982 = bitcast %m1861$.AssignableInfo.type* %.tmp6981 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6982
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp6983 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6984 = icmp ne %m1861$.Type.type* %.tmp6983, null
%.tmp6986 = getelementptr [22 x i8], [22 x i8]*@.str6985, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6984, i8* %.tmp6986)
%.tmp6987 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6988 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6987, i32 0, i32 0
%.tmp6989 = load i8*, i8** %.tmp6988
%.tmp6990 = icmp ne i8* %.tmp6989, null
%.tmp6992 = getelementptr [59 x i8], [59 x i8]*@.str6991, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6990, i8* %.tmp6992)
%.tmp6993 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp6994 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6993, i32 0, i32 0
%.tmp6995 = load i8*, i8** %.tmp6994
%.tmp6997 = getelementptr [4 x i8], [4 x i8]*@.str6996, i32 0, i32 0
%.tmp6998 = call i32(i8*,i8*) @strcmp(i8* %.tmp6995, i8* %.tmp6997)
%.tmp6999 = icmp eq i32 %.tmp6998, 0
br i1 %.tmp6999, label %.if.true.7000, label %.if.false.7000
.if.true.7000:
%.tmp7002 = getelementptr [2 x i8], [2 x i8]*@.str7001, i32 0, i32 0
ret i8* %.tmp7002
br label %.if.end.7000
.if.false.7000:
%.tmp7003 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7004 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7003, i32 0, i32 0
%.tmp7005 = load i8*, i8** %.tmp7004
%.tmp7007 = getelementptr [5 x i8], [5 x i8]*@.str7006, i32 0, i32 0
%.tmp7008 = call i32(i8*,i8*) @strcmp(i8* %.tmp7005, i8* %.tmp7007)
%.tmp7009 = icmp eq i32 %.tmp7008, 0
br i1 %.tmp7009, label %.if.true.7010, label %.if.false.7010
.if.true.7010:
%.tmp7012 = getelementptr [2 x i8], [2 x i8]*@.str7011, i32 0, i32 0
ret i8* %.tmp7012
br label %.if.end.7010
.if.false.7010:
%.tmp7013 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7014 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7013, i32 0, i32 0
%.tmp7015 = load i8*, i8** %.tmp7014
%.tmp7017 = getelementptr [5 x i8], [5 x i8]*@.str7016, i32 0, i32 0
%.tmp7018 = call i32(i8*,i8*) @strcmp(i8* %.tmp7015, i8* %.tmp7017)
%.tmp7019 = icmp eq i32 %.tmp7018, 0
br i1 %.tmp7019, label %.if.true.7020, label %.if.false.7020
.if.true.7020:
%.tmp7022 = getelementptr [2 x i8], [2 x i8]*@.str7021, i32 0, i32 0
ret i8* %.tmp7022
br label %.if.end.7020
.if.false.7020:
%.tmp7023 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7024 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7023, i32 0, i32 0
%.tmp7025 = load i8*, i8** %.tmp7024
%.tmp7027 = getelementptr [4 x i8], [4 x i8]*@.str7026, i32 0, i32 0
%.tmp7028 = call i32(i8*,i8*) @strcmp(i8* %.tmp7025, i8* %.tmp7027)
%.tmp7029 = icmp eq i32 %.tmp7028, 0
br i1 %.tmp7029, label %.if.true.7030, label %.if.false.7030
.if.true.7030:
%.tmp7032 = getelementptr [2 x i8], [2 x i8]*@.str7031, i32 0, i32 0
ret i8* %.tmp7032
br label %.if.end.7030
.if.false.7030:
%.tmp7033 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7034 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7033, i32 0, i32 0
%.tmp7035 = load i8*, i8** %.tmp7034
%.tmp7037 = getelementptr [4 x i8], [4 x i8]*@.str7036, i32 0, i32 0
%.tmp7038 = call i32(i8*,i8*) @strcmp(i8* %.tmp7035, i8* %.tmp7037)
%.tmp7039 = icmp eq i32 %.tmp7038, 0
br i1 %.tmp7039, label %.if.true.7040, label %.if.false.7040
.if.true.7040:
%buf.7041 = alloca i8*
store i8* null, i8** %buf.7041
%.tmp7042 = getelementptr i8*, i8** %buf.7041, i32 0
%.tmp7044 = getelementptr [4 x i8], [4 x i8]*@.str7043, i32 0, i32 0
%.tmp7045 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7046 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7045, i32 0, i32 3
%.tmp7047 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7046
%.tmp7048 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7047)
%.tmp7049 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7042, i8* %.tmp7044, i8* %.tmp7048)
%.tmp7050 = load i8*, i8** %buf.7041
ret i8* %.tmp7050
br label %.if.end.7040
.if.false.7040:
%.tmp7051 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7052 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7051, i32 0, i32 0
%.tmp7053 = load i8*, i8** %.tmp7052
%.tmp7055 = getelementptr [10 x i8], [10 x i8]*@.str7054, i32 0, i32 0
%.tmp7056 = call i32(i8*,i8*) @strcmp(i8* %.tmp7053, i8* %.tmp7055)
%.tmp7057 = icmp eq i32 %.tmp7056, 0
br i1 %.tmp7057, label %.if.true.7058, label %.if.false.7058
.if.true.7058:
%.tmp7059 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7060 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7059, i32 0, i32 2
%.tmp7061 = load i8*, i8** %.tmp7060
ret i8* %.tmp7061
br label %.if.end.7058
.if.false.7058:
%.tmp7062 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7063 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7062, i32 0, i32 0
%.tmp7064 = load i8*, i8** %.tmp7063
%.tmp7066 = getelementptr [7 x i8], [7 x i8]*@.str7065, i32 0, i32 0
%.tmp7067 = call i32(i8*,i8*) @strcmp(i8* %.tmp7064, i8* %.tmp7066)
%.tmp7068 = icmp eq i32 %.tmp7067, 0
br i1 %.tmp7068, label %.if.true.7069, label %.if.false.7069
.if.true.7069:
%.tmp7071 = getelementptr [2 x i8], [2 x i8]*@.str7070, i32 0, i32 0
%buf.7072 = alloca i8*
store i8* %.tmp7071, i8** %buf.7072
%.tmp7074 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7075 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7074, i32 0, i32 3
%.tmp7076 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7075
%t.7077 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7076, %m1861$.Type.type** %t.7077
br label %.for.start.7073
.for.start.7073:
%.tmp7078 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7077
%.tmp7079 = icmp ne %m1861$.Type.type* %.tmp7078, null
br i1 %.tmp7079, label %.for.continue.7073, label %.for.end.7073
.for.continue.7073:
%.tmp7080 = getelementptr i8*, i8** %buf.7072, i32 0
%.tmp7082 = getelementptr [5 x i8], [5 x i8]*@.str7081, i32 0, i32 0
%.tmp7083 = load i8*, i8** %buf.7072
%.tmp7084 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7077
%.tmp7085 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7084)
%.tmp7086 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7080, i8* %.tmp7082, i8* %.tmp7083, i8* %.tmp7085)
%.tmp7087 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7077
%.tmp7088 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7087, i32 0, i32 4
%.tmp7089 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7088
store %m1861$.Type.type* %.tmp7089, %m1861$.Type.type** %t.7077
br label %.for.start.7073
.for.end.7073:
%.tmp7090 = load i8*, i8** %buf.7072
ret i8* %.tmp7090
br label %.if.end.7069
.if.false.7069:
%.tmp7091 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7092 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7091, i32 0, i32 0
%.tmp7093 = load i8*, i8** %.tmp7092
%.tmp7095 = getelementptr [6 x i8], [6 x i8]*@.str7094, i32 0, i32 0
%.tmp7096 = call i32(i8*,i8*) @strcmp(i8* %.tmp7093, i8* %.tmp7095)
%.tmp7097 = icmp eq i32 %.tmp7096, 0
br i1 %.tmp7097, label %.if.true.7098, label %.if.false.7098
.if.true.7098:
%.tmp7100 = getelementptr [2 x i8], [2 x i8]*@.str7099, i32 0, i32 0
ret i8* %.tmp7100
br label %.if.end.7098
.if.false.7098:
%.tmp7102 = getelementptr [45 x i8], [45 x i8]*@.str7101, i32 0, i32 0
%.tmp7103 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7104 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7103, i32 0, i32 0
%.tmp7105 = load i8*, i8** %.tmp7104
%.tmp7106 = call i32(i8*,...) @printf(i8* %.tmp7102, i8* %.tmp7105)
br label %.if.end.7098
.if.end.7098:
br label %.if.end.7069
.if.end.7069:
br label %.if.end.7058
.if.end.7058:
br label %.if.end.7040
.if.end.7040:
br label %.if.end.7030
.if.end.7030:
br label %.if.end.7020
.if.end.7020:
br label %.if.end.7010
.if.end.7010:
br label %.if.end.7000
.if.end.7000:
%.tmp7107 = bitcast ptr null to i8*
ret i8* %.tmp7107
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7108 = bitcast ptr null to %m307$.Node.type*
%.tmp7109 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7108)
%info.7110 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7109, %m1861$.AssignableInfo.type** %info.7110
%tmp_buff.7111 = alloca i8*
store i8* null, i8** %tmp_buff.7111
%.tmp7112 = getelementptr i8*, i8** %tmp_buff.7111, i32 0
%.tmp7114 = getelementptr [7 x i8], [7 x i8]*@.str7113, i32 0, i32 0
%.tmp7115 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7116 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7115)
%.tmp7117 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7112, i8* %.tmp7114, i32 %.tmp7116)
%.tmp7118 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7119 = load i8, i8* @SCOPE_GLOBAL
%.tmp7120 = load i8*, i8** %tmp_buff.7111
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7118, i8 %.tmp7119, i8* %.tmp7120)
%.tmp7121 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7122 = ptrtoint %m1861$.GlobalName.type* %.tmp7121 to i32
%.tmp7123 = call i8*(i32) @malloc(i32 %.tmp7122)
%.tmp7124 = bitcast i8* %.tmp7123 to %m1861$.GlobalName.type*
%global.7125 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7124, %m1861$.GlobalName.type** %global.7125
%.tmp7126 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
%.tmp7127 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7126, i32 0, i32 0
%.tmp7128 = load i8*, i8** %text
%.tmp7129 = call i8*(i8*) @m2233$string_to_llvm.cp.cp(i8* %.tmp7128)
store i8* %.tmp7129, i8** %.tmp7127
%.tmp7130 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7131 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7130, i32 0, i32 3
%.tmp7132 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7132, %m1861$.Type.type** %.tmp7131
%.tmp7133 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7134 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7133, i32 0, i32 3
%.tmp7135 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7134
%.tmp7136 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7135, i32 0, i32 0
%.tmp7138 = getelementptr [6 x i8], [6 x i8]*@.str7137, i32 0, i32 0
store i8* %.tmp7138, i8** %.tmp7136
%.tmp7139 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7140 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7139, i32 0, i32 3
%.tmp7141 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7140
%.tmp7142 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7141, i32 0, i32 3
%.tmp7143 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7143, %m1861$.Type.type** %.tmp7142
%.tmp7144 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7145 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7144, i32 0, i32 3
%.tmp7146 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7145
%.tmp7147 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7146, i32 0, i32 3
%.tmp7148 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7147
%.tmp7149 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7148, i32 0, i32 0
%.tmp7151 = getelementptr [4 x i8], [4 x i8]*@.str7150, i32 0, i32 0
store i8* %.tmp7151, i8** %.tmp7149
%.tmp7152 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7153 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7152, i32 0, i32 3
%.tmp7154 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7153
%.tmp7155 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7154, i32 0, i32 3
%.tmp7156 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7155
%.tmp7157 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7156, i32 0, i32 4
%.tmp7158 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7158, %m1861$.Type.type** %.tmp7157
%.tmp7159 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
%.tmp7160 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7159, i32 0, i32 3
%.tmp7161 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7160
%.tmp7162 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7161, i32 0, i32 3
%.tmp7163 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7162
%.tmp7164 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7163, i32 0, i32 4
%.tmp7165 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7164
%.tmp7166 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7165, i32 0, i32 0
%.tmp7167 = getelementptr i8*, i8** %.tmp7166, i32 0
%.tmp7169 = getelementptr [3 x i8], [3 x i8]*@.str7168, i32 0, i32 0
%.tmp7170 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
%.tmp7171 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7170, i32 0, i32 0
%.tmp7172 = load i8*, i8** %.tmp7171
%.tmp7173 = call i32(i8*) @m2233$llvm_str_len.i.cp(i8* %.tmp7172)
%.tmp7174 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7167, i8* %.tmp7169, i32 %.tmp7173)
%.tmp7175 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
%.tmp7176 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7175, i32 0, i32 1
%.tmp7178 = getelementptr [7 x i8], [7 x i8]*@.str7177, i32 0, i32 0
store i8* %.tmp7178, i8** %.tmp7176
%.tmp7179 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
%.tmp7180 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7179, i32 0, i32 4
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7180
%.tmp7181 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
%.tmp7182 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7181, i32 0, i32 3
%.tmp7183 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
store %m1861$.AssignableInfo.type* %.tmp7183, %m1861$.AssignableInfo.type** %.tmp7182
%.tmp7184 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
%.tmp7185 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7184, i32 0, i32 2
store i1 0, i1* %.tmp7185
%.tmp7186 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7187 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7125
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7186, %m1861$.GlobalName.type* %.tmp7187)
%.tmp7188 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7110
ret %m1861$.AssignableInfo.type* %.tmp7188
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
%.tmp7189 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7190 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7189)
%info.7191 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7190, %m1861$.AssignableInfo.type** %info.7191
%.tmp7192 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7191
%.tmp7193 = load i8, i8* @SCOPE_CONST
%.tmp7194 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7192, i8 %.tmp7193, i8* %.tmp7194)
%.tmp7195 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7191
%.tmp7196 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7195, i32 0, i32 2
%.tmp7198 = getelementptr [7 x i8], [7 x i8]*@.str7197, i32 0, i32 0
store i8* %.tmp7198, i8** %.tmp7196
%.tmp7199 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7191
%.tmp7200 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7199, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7200
%.tmp7201 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7202 = load i8*, i8** %as_name
%.tmp7203 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7191
call void(%m1861$.CompilerCtx.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7201, i8* %.tmp7202, %m1861$.AssignableInfo.type* %.tmp7203)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7204 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7205 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7204, i32 0, i32 3
%.tmp7206 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7205
%.tmp7207 = icmp eq %m1861$.GlobalName.type* %.tmp7206, null
br i1 %.tmp7207, label %.if.true.7208, label %.if.false.7208
.if.true.7208:
%.tmp7209 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7210 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7209, i32 0, i32 3
%.tmp7211 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7211, %m1861$.GlobalName.type** %.tmp7210
br label %.if.end.7208
.if.false.7208:
%last_global.7212 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %last_global.7212
%.tmp7214 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7215 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7214, i32 0, i32 3
%.tmp7216 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7215
store %m1861$.GlobalName.type* %.tmp7216, %m1861$.GlobalName.type** %last_global.7212
br label %.for.start.7213
.for.start.7213:
%.tmp7217 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7212
%.tmp7218 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7217, i32 0, i32 4
%.tmp7219 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7218
%.tmp7220 = icmp ne %m1861$.GlobalName.type* %.tmp7219, null
br i1 %.tmp7220, label %.for.continue.7213, label %.for.end.7213
.for.continue.7213:
%.tmp7221 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7212
%.tmp7222 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7221, i32 0, i32 4
%.tmp7223 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7222
store %m1861$.GlobalName.type* %.tmp7223, %m1861$.GlobalName.type** %last_global.7212
br label %.for.start.7213
.for.end.7213:
%.tmp7224 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7212
%.tmp7225 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7224, i32 0, i32 4
%.tmp7226 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7226, %m1861$.GlobalName.type** %.tmp7225
br label %.if.end.7208
.if.end.7208:
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7227 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7228 = icmp eq %m1861$.Type.type* %.tmp7227, null
br i1 %.tmp7228, label %.if.true.7229, label %.if.false.7229
.if.true.7229:
%.tmp7230 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7230, label %.if.true.7231, label %.if.false.7231
.if.true.7231:
%.tmp7233 = getelementptr [44 x i8], [44 x i8]*@.str7232, i32 0, i32 0
%.tmp7234 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7235 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7234, i32 0, i32 7
%.tmp7236 = load i8*, i8** %.tmp7235
%.tmp7237 = call i32(i8*,...) @printf(i8* %.tmp7233, i8* %.tmp7236)
br label %.if.end.7231
.if.false.7231:
br label %.if.end.7231
.if.end.7231:
%.tmp7239 = getelementptr [2 x i8], [2 x i8]*@.str7238, i32 0, i32 0
ret i8* %.tmp7239
br label %.if.end.7229
.if.false.7229:
br label %.if.end.7229
.if.end.7229:
%.tmp7240 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7241 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7240, i32 0, i32 0
%.tmp7242 = load i8*, i8** %.tmp7241
%.tmp7243 = icmp ne i8* %.tmp7242, null
%.tmp7245 = getelementptr [59 x i8], [59 x i8]*@.str7244, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7243, i8* %.tmp7245)
%buf.7246 = alloca i8*
store i8* null, i8** %buf.7246
%.tmp7247 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7248 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7247, i32 0, i32 0
%.tmp7249 = load i8*, i8** %.tmp7248
%.tmp7251 = getelementptr [4 x i8], [4 x i8]*@.str7250, i32 0, i32 0
%.tmp7252 = call i32(i8*,i8*) @strcmp(i8* %.tmp7249, i8* %.tmp7251)
%.tmp7253 = icmp eq i32 %.tmp7252, 0
br i1 %.tmp7253, label %.if.true.7254, label %.if.false.7254
.if.true.7254:
%.tmp7256 = getelementptr [4 x i8], [4 x i8]*@.str7255, i32 0, i32 0
ret i8* %.tmp7256
br label %.if.end.7254
.if.false.7254:
%.tmp7257 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7258 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7257, i32 0, i32 0
%.tmp7259 = load i8*, i8** %.tmp7258
%.tmp7261 = getelementptr [5 x i8], [5 x i8]*@.str7260, i32 0, i32 0
%.tmp7262 = call i32(i8*,i8*) @strcmp(i8* %.tmp7259, i8* %.tmp7261)
%.tmp7263 = icmp eq i32 %.tmp7262, 0
br i1 %.tmp7263, label %.if.true.7264, label %.if.false.7264
.if.true.7264:
%.tmp7266 = getelementptr [5 x i8], [5 x i8]*@.str7265, i32 0, i32 0
ret i8* %.tmp7266
br label %.if.end.7264
.if.false.7264:
%.tmp7267 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7268 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7267, i32 0, i32 0
%.tmp7269 = load i8*, i8** %.tmp7268
%.tmp7271 = getelementptr [5 x i8], [5 x i8]*@.str7270, i32 0, i32 0
%.tmp7272 = call i32(i8*,i8*) @strcmp(i8* %.tmp7269, i8* %.tmp7271)
%.tmp7273 = icmp eq i32 %.tmp7272, 0
br i1 %.tmp7273, label %.if.true.7274, label %.if.false.7274
.if.true.7274:
%.tmp7276 = getelementptr [3 x i8], [3 x i8]*@.str7275, i32 0, i32 0
ret i8* %.tmp7276
br label %.if.end.7274
.if.false.7274:
%.tmp7277 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7278 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7277, i32 0, i32 0
%.tmp7279 = load i8*, i8** %.tmp7278
%.tmp7281 = getelementptr [8 x i8], [8 x i8]*@.str7280, i32 0, i32 0
%.tmp7282 = call i32(i8*,i8*) @strcmp(i8* %.tmp7279, i8* %.tmp7281)
%.tmp7283 = icmp eq i32 %.tmp7282, 0
br i1 %.tmp7283, label %.if.true.7284, label %.if.false.7284
.if.true.7284:
%.tmp7286 = getelementptr [4 x i8], [4 x i8]*@.str7285, i32 0, i32 0
ret i8* %.tmp7286
br label %.if.end.7284
.if.false.7284:
%.tmp7287 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7288 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7287, i32 0, i32 0
%.tmp7289 = load i8*, i8** %.tmp7288
%.tmp7291 = getelementptr [4 x i8], [4 x i8]*@.str7290, i32 0, i32 0
%.tmp7292 = call i32(i8*,i8*) @strcmp(i8* %.tmp7289, i8* %.tmp7291)
%.tmp7293 = icmp eq i32 %.tmp7292, 0
br i1 %.tmp7293, label %.if.true.7294, label %.if.false.7294
.if.true.7294:
%.tmp7296 = getelementptr [3 x i8], [3 x i8]*@.str7295, i32 0, i32 0
ret i8* %.tmp7296
br label %.if.end.7294
.if.false.7294:
%.tmp7297 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7298 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7297, i32 0, i32 0
%.tmp7299 = load i8*, i8** %.tmp7298
%.tmp7301 = getelementptr [9 x i8], [9 x i8]*@.str7300, i32 0, i32 0
%.tmp7302 = call i32(i8*,i8*) @strcmp(i8* %.tmp7299, i8* %.tmp7301)
%.tmp7303 = icmp eq i32 %.tmp7302, 0
br i1 %.tmp7303, label %.if.true.7304, label %.if.false.7304
.if.true.7304:
%.tmp7305 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7307 = getelementptr [4 x i8], [4 x i8]*@.str7306, i32 0, i32 0
%.tmp7308 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7309 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7310 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7309, i32 0, i32 3
%.tmp7311 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7310
%.tmp7312 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7308, %m1861$.Type.type* %.tmp7311)
%.tmp7313 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7305, i8* %.tmp7307, i8* %.tmp7312)
%.tmp7315 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7316 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7315, i32 0, i32 3
%.tmp7317 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7316
%.tmp7318 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7317, i32 0, i32 4
%.tmp7319 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7318
%p.7320 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7319, %m1861$.Type.type** %p.7320
br label %.for.start.7314
.for.start.7314:
%.tmp7321 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7320
%.tmp7322 = icmp ne %m1861$.Type.type* %.tmp7321, null
br i1 %.tmp7322, label %.for.continue.7314, label %.for.end.7314
.for.continue.7314:
%.tmp7323 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7320
%.tmp7324 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7325 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7324, i32 0, i32 3
%.tmp7326 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7325
%.tmp7327 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7326, i32 0, i32 4
%.tmp7328 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7327
%.tmp7329 = icmp ne %m1861$.Type.type* %.tmp7323, %.tmp7328
br i1 %.tmp7329, label %.if.true.7330, label %.if.false.7330
.if.true.7330:
%.tmp7331 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7333 = getelementptr [4 x i8], [4 x i8]*@.str7332, i32 0, i32 0
%.tmp7334 = load i8*, i8** %buf.7246
%.tmp7335 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7331, i8* %.tmp7333, i8* %.tmp7334)
br label %.if.end.7330
.if.false.7330:
br label %.if.end.7330
.if.end.7330:
%.tmp7336 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7338 = getelementptr [5 x i8], [5 x i8]*@.str7337, i32 0, i32 0
%.tmp7339 = load i8*, i8** %buf.7246
%.tmp7340 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7341 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7320
%.tmp7342 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7340, %m1861$.Type.type* %.tmp7341)
%.tmp7343 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7336, i8* %.tmp7338, i8* %.tmp7339, i8* %.tmp7342)
%.tmp7344 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7320
%.tmp7345 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7344, i32 0, i32 4
%.tmp7346 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7345
store %m1861$.Type.type* %.tmp7346, %m1861$.Type.type** %p.7320
br label %.for.start.7314
.for.end.7314:
%.tmp7347 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7349 = getelementptr [4 x i8], [4 x i8]*@.str7348, i32 0, i32 0
%.tmp7350 = load i8*, i8** %buf.7246
%.tmp7351 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7347, i8* %.tmp7349, i8* %.tmp7350)
%.tmp7352 = load i8*, i8** %buf.7246
ret i8* %.tmp7352
br label %.if.end.7304
.if.false.7304:
%.tmp7353 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7354 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7353, i32 0, i32 0
%.tmp7355 = load i8*, i8** %.tmp7354
%.tmp7357 = getelementptr [4 x i8], [4 x i8]*@.str7356, i32 0, i32 0
%.tmp7358 = call i32(i8*,i8*) @strcmp(i8* %.tmp7355, i8* %.tmp7357)
%.tmp7359 = icmp eq i32 %.tmp7358, 0
br i1 %.tmp7359, label %.if.true.7360, label %.if.false.7360
.if.true.7360:
%.tmp7361 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7363 = getelementptr [4 x i8], [4 x i8]*@.str7362, i32 0, i32 0
%.tmp7364 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7365 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7366 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7365, i32 0, i32 3
%.tmp7367 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7366
%.tmp7368 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7364, %m1861$.Type.type* %.tmp7367)
%.tmp7369 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7361, i8* %.tmp7363, i8* %.tmp7368)
%.tmp7370 = load i8*, i8** %buf.7246
ret i8* %.tmp7370
br label %.if.end.7360
.if.false.7360:
%.tmp7371 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7372 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7371, i32 0, i32 0
%.tmp7373 = load i8*, i8** %.tmp7372
%.tmp7375 = getelementptr [7 x i8], [7 x i8]*@.str7374, i32 0, i32 0
%.tmp7376 = call i32(i8*,i8*) @strcmp(i8* %.tmp7373, i8* %.tmp7375)
%.tmp7377 = icmp eq i32 %.tmp7376, 0
br i1 %.tmp7377, label %.if.true.7378, label %.if.false.7378
.if.true.7378:
%.tmp7379 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7381 = getelementptr [2 x i8], [2 x i8]*@.str7380, i32 0, i32 0
%.tmp7382 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7379, i8* %.tmp7381)
%.tmp7384 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7385 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7384, i32 0, i32 3
%.tmp7386 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7385
%t.7387 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7386, %m1861$.Type.type** %t.7387
br label %.for.start.7383
.for.start.7383:
%.tmp7388 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7387
%.tmp7389 = icmp ne %m1861$.Type.type* %.tmp7388, null
br i1 %.tmp7389, label %.for.continue.7383, label %.for.end.7383
.for.continue.7383:
%.tmp7390 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7387
%.tmp7391 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7392 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7391, i32 0, i32 3
%.tmp7393 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7392
%.tmp7394 = icmp ne %m1861$.Type.type* %.tmp7390, %.tmp7393
br i1 %.tmp7394, label %.if.true.7395, label %.if.false.7395
.if.true.7395:
%.tmp7396 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7398 = getelementptr [4 x i8], [4 x i8]*@.str7397, i32 0, i32 0
%.tmp7399 = load i8*, i8** %buf.7246
%.tmp7400 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7396, i8* %.tmp7398, i8* %.tmp7399)
br label %.if.end.7395
.if.false.7395:
br label %.if.end.7395
.if.end.7395:
%.tmp7401 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7403 = getelementptr [5 x i8], [5 x i8]*@.str7402, i32 0, i32 0
%.tmp7404 = load i8*, i8** %buf.7246
%.tmp7405 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7406 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7387
%.tmp7407 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7405, %m1861$.Type.type* %.tmp7406)
%.tmp7408 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7401, i8* %.tmp7403, i8* %.tmp7404, i8* %.tmp7407)
%.tmp7409 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7387
%.tmp7410 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7409, i32 0, i32 4
%.tmp7411 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7410
store %m1861$.Type.type* %.tmp7411, %m1861$.Type.type** %t.7387
br label %.for.start.7383
.for.end.7383:
%.tmp7412 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7414 = getelementptr [4 x i8], [4 x i8]*@.str7413, i32 0, i32 0
%.tmp7415 = load i8*, i8** %buf.7246
%.tmp7416 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7412, i8* %.tmp7414, i8* %.tmp7415)
%.tmp7417 = load i8*, i8** %buf.7246
ret i8* %.tmp7417
br label %.if.end.7378
.if.false.7378:
%.tmp7418 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7419 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7418, i32 0, i32 0
%.tmp7420 = load i8*, i8** %.tmp7419
%.tmp7422 = getelementptr [6 x i8], [6 x i8]*@.str7421, i32 0, i32 0
%.tmp7423 = call i32(i8*,i8*) @strcmp(i8* %.tmp7420, i8* %.tmp7422)
%.tmp7424 = icmp eq i32 %.tmp7423, 0
br i1 %.tmp7424, label %.if.true.7425, label %.if.false.7425
.if.true.7425:
%.tmp7426 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7428 = getelementptr [10 x i8], [10 x i8]*@.str7427, i32 0, i32 0
%.tmp7429 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7430 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7429, i32 0, i32 3
%.tmp7431 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7430
%.tmp7432 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7431, i32 0, i32 4
%.tmp7433 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7432
%.tmp7434 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7433, i32 0, i32 0
%.tmp7435 = load i8*, i8** %.tmp7434
%.tmp7436 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7437 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7438 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7437, i32 0, i32 3
%.tmp7439 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7438
%.tmp7440 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7436, %m1861$.Type.type* %.tmp7439)
%.tmp7441 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7426, i8* %.tmp7428, i8* %.tmp7435, i8* %.tmp7440)
%.tmp7442 = load i8*, i8** %buf.7246
ret i8* %.tmp7442
br label %.if.end.7425
.if.false.7425:
%.tmp7443 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7444 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7443, i32 0, i32 0
%.tmp7445 = load i8*, i8** %.tmp7444
%.tmp7447 = getelementptr [10 x i8], [10 x i8]*@.str7446, i32 0, i32 0
%.tmp7448 = call i32(i8*,i8*) @strcmp(i8* %.tmp7445, i8* %.tmp7447)
%.tmp7449 = icmp eq i32 %.tmp7448, 0
br i1 %.tmp7449, label %.if.true.7450, label %.if.false.7450
.if.true.7450:
%.tmp7451 = getelementptr i8*, i8** %buf.7246, i32 0
%.tmp7453 = getelementptr [5 x i8], [5 x i8]*@.str7452, i32 0, i32 0
%.tmp7454 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7455 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7454, i32 0, i32 2
%.tmp7456 = load i8*, i8** %.tmp7455
%.tmp7457 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7451, i8* %.tmp7453, i8* %.tmp7456)
%.tmp7458 = load i8*, i8** %buf.7246
ret i8* %.tmp7458
br label %.if.end.7450
.if.false.7450:
%.tmp7459 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7460 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7459, i32 0, i32 0
%.tmp7461 = load i8*, i8** %.tmp7460
%.tmp7463 = getelementptr [7 x i8], [7 x i8]*@.str7462, i32 0, i32 0
%.tmp7464 = call i32(i8*,i8*) @strcmp(i8* %.tmp7461, i8* %.tmp7463)
%.tmp7465 = icmp eq i32 %.tmp7464, 0
br i1 %.tmp7465, label %.if.true.7466, label %.if.false.7466
.if.true.7466:
%.tmp7468 = getelementptr [4 x i8], [4 x i8]*@.str7467, i32 0, i32 0
ret i8* %.tmp7468
br label %.if.end.7466
.if.false.7466:
%.tmp7469 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7470 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7469, i32 0, i32 0
%.tmp7471 = load i8*, i8** %.tmp7470
%.tmp7473 = getelementptr [6 x i8], [6 x i8]*@.str7472, i32 0, i32 0
%.tmp7474 = call i32(i8*,i8*) @strcmp(i8* %.tmp7471, i8* %.tmp7473)
%.tmp7475 = icmp eq i32 %.tmp7474, 0
br i1 %.tmp7475, label %.if.true.7476, label %.if.false.7476
.if.true.7476:
br label %.if.end.7476
.if.false.7476:
%.tmp7478 = getelementptr [58 x i8], [58 x i8]*@.str7477, i32 0, i32 0
%.tmp7479 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7480 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7479, i32 0, i32 0
%.tmp7481 = load i8*, i8** %.tmp7480
%.tmp7482 = call i32(i8*,...) @printf(i8* %.tmp7478, i8* %.tmp7481)
br label %.if.end.7476
.if.end.7476:
br label %.if.end.7466
.if.end.7466:
br label %.if.end.7450
.if.end.7450:
br label %.if.end.7425
.if.end.7425:
br label %.if.end.7378
.if.end.7378:
br label %.if.end.7360
.if.end.7360:
br label %.if.end.7304
.if.end.7304:
br label %.if.end.7294
.if.end.7294:
br label %.if.end.7284
.if.end.7284:
br label %.if.end.7274
.if.end.7274:
br label %.if.end.7264
.if.end.7264:
br label %.if.end.7254
.if.end.7254:
%.tmp7483 = bitcast ptr null to i8*
ret i8* %.tmp7483
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7484 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7485 = ptrtoint %m1861$.ErrorList.type* %.tmp7484 to i32
%.tmp7486 = call i8*(i32) @malloc(i32 %.tmp7485)
%.tmp7487 = bitcast i8* %.tmp7486 to %m1861$.ErrorList.type*
%new_err.7488 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7487, %m1861$.ErrorList.type** %new_err.7488
%.tmp7489 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7488
%.tmp7490 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7489, i32 0, i32 2
store i1 0, i1* %.tmp7490
%.tmp7491 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7488
%.tmp7492 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7491, i32 0, i32 0
%.tmp7493 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7493, %m751$.Error.type** %.tmp7492
%.tmp7494 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7488
%.tmp7495 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7494, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7495
%.tmp7496 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7497 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7496, i32 0, i32 2
%.tmp7498 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7497
%.tmp7499 = icmp eq %m1861$.ErrorList.type* %.tmp7498, null
br i1 %.tmp7499, label %.if.true.7500, label %.if.false.7500
.if.true.7500:
%.tmp7501 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7502 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7501, i32 0, i32 2
%.tmp7503 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7488
store %m1861$.ErrorList.type* %.tmp7503, %m1861$.ErrorList.type** %.tmp7502
ret void
br label %.if.end.7500
.if.false.7500:
br label %.if.end.7500
.if.end.7500:
%last.7504 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7504
%.tmp7506 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7507 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7506, i32 0, i32 2
%.tmp7508 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7507
store %m1861$.ErrorList.type* %.tmp7508, %m1861$.ErrorList.type** %last.7504
br label %.for.start.7505
.for.start.7505:
%.tmp7509 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7504
%.tmp7510 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7509, i32 0, i32 1
%.tmp7511 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7510
%.tmp7512 = icmp ne %m1861$.ErrorList.type* %.tmp7511, null
br i1 %.tmp7512, label %.for.continue.7505, label %.for.end.7505
.for.continue.7505:
%.tmp7513 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7504
%.tmp7514 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7513, i32 0, i32 1
%.tmp7515 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7514
store %m1861$.ErrorList.type* %.tmp7515, %m1861$.ErrorList.type** %last.7504
br label %.for.start.7505
.for.end.7505:
%.tmp7516 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7504
%.tmp7517 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7516, i32 0, i32 1
%.tmp7518 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7488
store %m1861$.ErrorList.type* %.tmp7518, %m1861$.ErrorList.type** %.tmp7517
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7519 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7520 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7519, i32 0, i32 6
%.tmp7521 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7520
%.tmp7522 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7521, i32 0, i32 7
%.tmp7523 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7522
%.tmp7524 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7523, i32 0, i32 1
%.tmp7525 = load i8*, i8** %.tmp7524
ret i8* %.tmp7525
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7527 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7528 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7527, %m307$.Node.type** %n.7528
br label %.for.start.7526
.for.start.7526:
%.tmp7529 = load %m307$.Node.type*, %m307$.Node.type** %n.7528
%.tmp7530 = icmp ne %m307$.Node.type* %.tmp7529, null
br i1 %.tmp7530, label %.for.continue.7526, label %.for.end.7526
.for.continue.7526:
%.tmp7531 = load %m307$.Node.type*, %m307$.Node.type** %n.7528
%.tmp7532 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7531, i32 0, i32 0
%.tmp7533 = load i8*, i8** %.tmp7532
%.tmp7534 = load i8*, i8** %type
%.tmp7535 = call i32(i8*,i8*) @strcmp(i8* %.tmp7533, i8* %.tmp7534)
%.tmp7536 = icmp eq i32 %.tmp7535, 0
br i1 %.tmp7536, label %.if.true.7537, label %.if.false.7537
.if.true.7537:
%.tmp7538 = load %m307$.Node.type*, %m307$.Node.type** %n.7528
ret %m307$.Node.type* %.tmp7538
br label %.if.end.7537
.if.false.7537:
br label %.if.end.7537
.if.end.7537:
%.tmp7539 = load %m307$.Node.type*, %m307$.Node.type** %n.7528
%.tmp7540 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7539, i32 0, i32 7
%.tmp7541 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7540
store %m307$.Node.type* %.tmp7541, %m307$.Node.type** %n.7528
br label %.for.start.7526
.for.end.7526:
%.tmp7542 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7542
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7543 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7544 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7543, %m1861$.Type.type** %function_type.7544
%.tmp7545 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7546 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7547 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7546, i32 0, i32 6
%.tmp7548 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7547
%.tmp7549 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7545, %m307$.Node.type* %.tmp7548)
%return_value_type.7550 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7549, %m1861$.Type.type** %return_value_type.7550
%.tmp7551 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7544
%.tmp7552 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7551, i32 0, i32 0
%.tmp7554 = getelementptr [9 x i8], [9 x i8]*@.str7553, i32 0, i32 0
store i8* %.tmp7554, i8** %.tmp7552
%.tmp7555 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7544
%.tmp7556 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7555, i32 0, i32 3
%.tmp7557 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7550
store %m1861$.Type.type* %.tmp7557, %m1861$.Type.type** %.tmp7556
%.tmp7558 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7550
%last_type.7559 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7558, %m1861$.Type.type** %last_type.7559
%.tmp7560 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7561 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7560)
%params.7562 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7561, %m307$.Node.type** %params.7562
%.tmp7564 = load %m307$.Node.type*, %m307$.Node.type** %params.7562
%param_ptr.7565 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7564, %m307$.Node.type** %param_ptr.7565
br label %.for.start.7563
.for.start.7563:
%.tmp7566 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7567 = icmp ne %m307$.Node.type* %.tmp7566, null
br i1 %.tmp7567, label %.for.continue.7563, label %.for.end.7563
.for.continue.7563:
%.tmp7568 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7569 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7568, i32 0, i32 0
%.tmp7570 = load i8*, i8** %.tmp7569
%.tmp7572 = getelementptr [5 x i8], [5 x i8]*@.str7571, i32 0, i32 0
%.tmp7573 = call i32(i8*,i8*) @strcmp(i8* %.tmp7570, i8* %.tmp7572)
%.tmp7574 = icmp eq i32 %.tmp7573, 0
br i1 %.tmp7574, label %.if.true.7575, label %.if.false.7575
.if.true.7575:
%.tmp7576 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7559
%.tmp7577 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7576, i32 0, i32 4
%.tmp7578 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7559
%.tmp7579 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7578)
store %m1861$.Type.type* %.tmp7579, %m1861$.Type.type** %.tmp7577
%.tmp7580 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7559
%.tmp7581 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7580, i32 0, i32 4
%.tmp7582 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7581
%.tmp7583 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7582, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7583
%.tmp7584 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7559
%.tmp7585 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7584, i32 0, i32 4
%.tmp7586 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7585
store %m1861$.Type.type* %.tmp7586, %m1861$.Type.type** %last_type.7559
%.tmp7587 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7588 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7587, i32 0, i32 7
%.tmp7589 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7588
%.tmp7590 = icmp ne %m307$.Node.type* %.tmp7589, null
br i1 %.tmp7590, label %.if.true.7591, label %.if.false.7591
.if.true.7591:
%.tmp7592 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7593 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7592, i32 0, i32 7
%.tmp7594 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7593
store %m307$.Node.type* %.tmp7594, %m307$.Node.type** %param_ptr.7565
br label %.if.end.7591
.if.false.7591:
br label %.if.end.7591
.if.end.7591:
%.tmp7595 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7596 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7595, i32 0, i32 7
%.tmp7597 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7596
%.tmp7598 = icmp ne %m307$.Node.type* %.tmp7597, null
br i1 %.tmp7598, label %.if.true.7599, label %.if.false.7599
.if.true.7599:
%.tmp7600 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7601 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7600, i32 0, i32 7
%.tmp7602 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7601
store %m307$.Node.type* %.tmp7602, %m307$.Node.type** %param_ptr.7565
br label %.if.end.7599
.if.false.7599:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7565
br label %.if.end.7599
.if.end.7599:
br label %.if.end.7575
.if.false.7575:
%.tmp7603 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7604 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7605 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7604, i32 0, i32 6
%.tmp7606 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7605
%.tmp7607 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7603, %m307$.Node.type* %.tmp7606)
%param_type.7608 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7607, %m1861$.Type.type** %param_type.7608
%.tmp7609 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7559
%.tmp7610 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7609, i32 0, i32 4
%.tmp7611 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7608
store %m1861$.Type.type* %.tmp7611, %m1861$.Type.type** %.tmp7610
%.tmp7612 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7608
store %m1861$.Type.type* %.tmp7612, %m1861$.Type.type** %last_type.7559
%.tmp7613 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7614 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7613, i32 0, i32 7
%.tmp7615 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7614
store %m307$.Node.type* %.tmp7615, %m307$.Node.type** %param_ptr.7565
%.tmp7616 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7617 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7616, i32 0, i32 7
%.tmp7618 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7617
%.tmp7619 = icmp ne %m307$.Node.type* %.tmp7618, null
br i1 %.tmp7619, label %.if.true.7620, label %.if.false.7620
.if.true.7620:
%.tmp7621 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7565
%.tmp7622 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7621, i32 0, i32 7
%.tmp7623 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7622
%.tmp7624 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7623, i32 0, i32 7
%.tmp7625 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7624
store %m307$.Node.type* %.tmp7625, %m307$.Node.type** %param_ptr.7565
br label %.if.end.7620
.if.false.7620:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7565
br label %.if.end.7620
.if.end.7620:
br label %.if.end.7575
.if.end.7575:
br label %.for.start.7563
.for.end.7563:
%.tmp7626 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7544
ret %m1861$.Type.type* %.tmp7626
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7627 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7629 = getelementptr [10 x i8], [10 x i8]*@.str7628, i32 0, i32 0
%.tmp7630 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7627, i8* %.tmp7629)
%params.7631 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7630, %m307$.Node.type** %params.7631
%.tmp7632 = load %m307$.Node.type*, %m307$.Node.type** %params.7631
%.tmp7633 = icmp eq %m307$.Node.type* %.tmp7632, null
br i1 %.tmp7633, label %.if.true.7634, label %.if.false.7634
.if.true.7634:
%.tmp7635 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7635
br label %.if.end.7634
.if.false.7634:
br label %.if.end.7634
.if.end.7634:
%.tmp7636 = load %m307$.Node.type*, %m307$.Node.type** %params.7631
%.tmp7637 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7636, i32 0, i32 6
%.tmp7638 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7637
ret %m307$.Node.type* %.tmp7638
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7639 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.7640 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7639, %m1861$.Type.type** %t.7640
%.tmp7641 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7642 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7641, i32 0, i32 0
%.tmp7643 = load i8*, i8** %.tmp7642
%.tmp7645 = getelementptr [10 x i8], [10 x i8]*@.str7644, i32 0, i32 0
%.tmp7646 = call i32(i8*,i8*) @strcmp(i8* %.tmp7643, i8* %.tmp7645)
%.tmp7647 = icmp eq i32 %.tmp7646, 0
br i1 %.tmp7647, label %.if.true.7648, label %.if.false.7648
.if.true.7648:
%.tmp7649 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7650 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7649, i32 0, i32 0
%.tmp7652 = getelementptr [7 x i8], [7 x i8]*@.str7651, i32 0, i32 0
store i8* %.tmp7652, i8** %.tmp7650
%.tmp7653 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7654 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7653, i32 0, i32 1
store i8* null, i8** %.tmp7654
%.tmp7655 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7656 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7655, i32 0, i32 6
%.tmp7657 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7656
%.tmp7659 = getelementptr [5 x i8], [5 x i8]*@.str7658, i32 0, i32 0
%.tmp7660 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7657, i8* %.tmp7659)
%curr_type.7661 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7660, %m307$.Node.type** %curr_type.7661
%.tmp7662 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7663 = icmp ne %m307$.Node.type* %.tmp7662, null
br i1 %.tmp7663, label %.if.true.7664, label %.if.false.7664
.if.true.7664:
%.tmp7665 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7666 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7665, i32 0, i32 3
%.tmp7667 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7668 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7669 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7668, i32 0, i32 6
%.tmp7670 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7669
%.tmp7671 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7667, %m307$.Node.type* %.tmp7670)
store %m1861$.Type.type* %.tmp7671, %m1861$.Type.type** %.tmp7666
%.tmp7672 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7673 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7672, i32 0, i32 3
%.tmp7674 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7673
%.tmp7675 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7674, i32 0, i32 1
%.tmp7676 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7677 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7676, i32 0, i32 7
%.tmp7678 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7677
%.tmp7679 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7678, i32 0, i32 1
%.tmp7680 = load i8*, i8** %.tmp7679
store i8* %.tmp7680, i8** %.tmp7675
%.tmp7681 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7682 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7681, i32 0, i32 3
%.tmp7683 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7682
%curr_t.7684 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7683, %m1861$.Type.type** %curr_t.7684
%.tmp7686 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7687 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7686, i32 0, i32 7
%.tmp7688 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7687
%.tmp7690 = getelementptr [5 x i8], [5 x i8]*@.str7689, i32 0, i32 0
%.tmp7691 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7688, i8* %.tmp7690)
store %m307$.Node.type* %.tmp7691, %m307$.Node.type** %curr_type.7661
br label %.for.start.7685
.for.start.7685:
%.tmp7692 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7693 = icmp ne %m307$.Node.type* %.tmp7692, null
br i1 %.tmp7693, label %.for.continue.7685, label %.for.end.7685
.for.continue.7685:
%.tmp7694 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7684
%.tmp7695 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7694, i32 0, i32 4
%.tmp7696 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7697 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7698 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7697, i32 0, i32 6
%.tmp7699 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7698
%.tmp7700 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7696, %m307$.Node.type* %.tmp7699)
store %m1861$.Type.type* %.tmp7700, %m1861$.Type.type** %.tmp7695
%.tmp7701 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7684
%.tmp7702 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7701, i32 0, i32 4
%.tmp7703 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7702
%.tmp7704 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7703, i32 0, i32 1
%.tmp7705 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7706 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7705, i32 0, i32 7
%.tmp7707 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7706
%.tmp7708 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7707, i32 0, i32 1
%.tmp7709 = load i8*, i8** %.tmp7708
store i8* %.tmp7709, i8** %.tmp7704
%.tmp7710 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7684
%.tmp7711 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7710, i32 0, i32 4
%.tmp7712 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7711
store %m1861$.Type.type* %.tmp7712, %m1861$.Type.type** %curr_t.7684
%.tmp7713 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7661
%.tmp7714 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7713, i32 0, i32 7
%.tmp7715 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7714
%.tmp7717 = getelementptr [5 x i8], [5 x i8]*@.str7716, i32 0, i32 0
%.tmp7718 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7715, i8* %.tmp7717)
store %m307$.Node.type* %.tmp7718, %m307$.Node.type** %curr_type.7661
br label %.for.start.7685
.for.end.7685:
br label %.if.end.7664
.if.false.7664:
br label %.if.end.7664
.if.end.7664:
br label %.if.end.7648
.if.false.7648:
%.tmp7719 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7720 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7719, i32 0, i32 0
%.tmp7721 = load i8*, i8** %.tmp7720
%.tmp7723 = getelementptr [12 x i8], [12 x i8]*@.str7722, i32 0, i32 0
%.tmp7724 = call i32(i8*,i8*) @strcmp(i8* %.tmp7721, i8* %.tmp7723)
%.tmp7725 = icmp eq i32 %.tmp7724, 0
br i1 %.tmp7725, label %.if.true.7726, label %.if.false.7726
.if.true.7726:
%err_msg.7727 = alloca i8*
store i8* null, i8** %err_msg.7727
%.tmp7728 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7729 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7730 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7728, %m307$.Node.type* %.tmp7729)
%base.7731 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp7730, %m1861$.ScopeItem.type** %base.7731
%.tmp7732 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7731
%.tmp7733 = icmp eq %m1861$.ScopeItem.type* %.tmp7732, null
br i1 %.tmp7733, label %.if.true.7734, label %.if.false.7734
.if.true.7734:
%.tmp7735 = getelementptr i8*, i8** %err_msg.7727, i32 0
%.tmp7737 = getelementptr [37 x i8], [37 x i8]*@.str7736, i32 0, i32 0
%.tmp7738 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7739 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7738, i32 0, i32 6
%.tmp7740 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7739
%.tmp7741 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7740, i32 0, i32 1
%.tmp7742 = load i8*, i8** %.tmp7741
%.tmp7743 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7735, i8* %.tmp7737, i8* %.tmp7742)
%.tmp7744 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7745 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7746 = load i8*, i8** %err_msg.7727
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7744, %m307$.Node.type* %.tmp7745, i8* %.tmp7746)
%.tmp7747 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7748 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7747, i32 0, i32 0
%.tmp7750 = getelementptr [6 x i8], [6 x i8]*@.str7749, i32 0, i32 0
store i8* %.tmp7750, i8** %.tmp7748
%.tmp7751 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
ret %m1861$.Type.type* %.tmp7751
br label %.if.end.7734
.if.false.7734:
br label %.if.end.7734
.if.end.7734:
%.tmp7752 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7753 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7752, i32 0, i32 0
%.tmp7755 = getelementptr [10 x i8], [10 x i8]*@.str7754, i32 0, i32 0
store i8* %.tmp7755, i8** %.tmp7753
%.tmp7756 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7757 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7756, i32 0, i32 1
%.tmp7758 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7731
%.tmp7759 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7758, i32 0, i32 0
%.tmp7760 = load i8*, i8** %.tmp7759
store i8* %.tmp7760, i8** %.tmp7757
%.tmp7761 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7762 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7761, i32 0, i32 2
%.tmp7763 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7731
%.tmp7764 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7763, i32 0, i32 1
%.tmp7765 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7764
%.tmp7766 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7765, i32 0, i32 0
%.tmp7767 = load i8*, i8** %.tmp7766
store i8* %.tmp7767, i8** %.tmp7762
%.tmp7768 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7769 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7768, i32 0, i32 3
%.tmp7770 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7731
%.tmp7771 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7770, i32 0, i32 1
%.tmp7772 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7771
%.tmp7773 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7772, i32 0, i32 3
%.tmp7774 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7773
store %m1861$.Type.type* %.tmp7774, %m1861$.Type.type** %.tmp7769
br label %.if.end.7726
.if.false.7726:
%.tmp7775 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7776 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7775, i32 0, i32 1
%.tmp7777 = load i8*, i8** %.tmp7776
%.tmp7779 = getelementptr [4 x i8], [4 x i8]*@.str7778, i32 0, i32 0
%.tmp7780 = call i32(i8*,i8*) @strcmp(i8* %.tmp7777, i8* %.tmp7779)
%.tmp7781 = icmp eq i32 %.tmp7780, 0
br i1 %.tmp7781, label %.if.true.7782, label %.if.false.7782
.if.true.7782:
%.tmp7783 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7784 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7783, i32 0, i32 0
%.tmp7786 = getelementptr [4 x i8], [4 x i8]*@.str7785, i32 0, i32 0
store i8* %.tmp7786, i8** %.tmp7784
%.tmp7787 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7788 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7787, i32 0, i32 3
%.tmp7789 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7789, %m1861$.Type.type** %.tmp7788
%.tmp7790 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7791 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7790, i32 0, i32 3
%.tmp7792 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7791
%.tmp7793 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7792, i32 0, i32 0
%.tmp7795 = getelementptr [4 x i8], [4 x i8]*@.str7794, i32 0, i32 0
store i8* %.tmp7795, i8** %.tmp7793
br label %.if.end.7782
.if.false.7782:
%.tmp7796 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7797 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7796, i32 0, i32 0
%.tmp7798 = load i8*, i8** %.tmp7797
%.tmp7800 = getelementptr [5 x i8], [5 x i8]*@.str7799, i32 0, i32 0
%.tmp7801 = call i32(i8*,i8*) @strcmp(i8* %.tmp7798, i8* %.tmp7800)
%.tmp7802 = icmp eq i32 %.tmp7801, 0
br i1 %.tmp7802, label %.if.true.7803, label %.if.false.7803
.if.true.7803:
%.tmp7804 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7805 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7804, i32 0, i32 0
%.tmp7806 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7807 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7806, i32 0, i32 1
%.tmp7808 = load i8*, i8** %.tmp7807
store i8* %.tmp7808, i8** %.tmp7805
br label %.if.end.7803
.if.false.7803:
%.tmp7809 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7810 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7809, i32 0, i32 1
%.tmp7811 = load i8*, i8** %.tmp7810
%.tmp7813 = getelementptr [4 x i8], [4 x i8]*@.str7812, i32 0, i32 0
%.tmp7814 = call i32(i8*,i8*) @strcmp(i8* %.tmp7811, i8* %.tmp7813)
%.tmp7815 = icmp eq i32 %.tmp7814, 0
br i1 %.tmp7815, label %.if.true.7816, label %.if.false.7816
.if.true.7816:
%.tmp7817 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
%.tmp7818 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7817, i32 0, i32 0
%.tmp7820 = getelementptr [7 x i8], [7 x i8]*@.str7819, i32 0, i32 0
store i8* %.tmp7820, i8** %.tmp7818
br label %.if.end.7816
.if.false.7816:
%.tmp7821 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7822 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7824 = getelementptr [54 x i8], [54 x i8]*@.str7823, i32 0, i32 0
%.tmp7825 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7821, %m307$.Node.type* %.tmp7822, i8* %.tmp7824)
%.tmp7826 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7827 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7826, i32 0, i32 0
%.tmp7828 = load i8*, i8** %.tmp7827
%.tmp7829 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7830 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7829, i32 0, i32 1
%.tmp7831 = load i8*, i8** %.tmp7830
%.tmp7832 = call i32(i8*,...) @printf(i8* %.tmp7825, i8* %.tmp7828, i8* %.tmp7831)
%.tmp7833 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7833
br label %.if.end.7816
.if.end.7816:
br label %.if.end.7803
.if.end.7803:
br label %.if.end.7782
.if.end.7782:
br label %.if.end.7726
.if.end.7726:
br label %.if.end.7648
.if.end.7648:
%.tmp7835 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7836 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7835, i32 0, i32 7
%.tmp7837 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7836
%ptr.7838 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7837, %m307$.Node.type** %ptr.7838
br label %.for.start.7834
.for.start.7834:
%.tmp7839 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7840 = icmp ne %m307$.Node.type* %.tmp7839, null
br i1 %.tmp7840, label %.for.continue.7834, label %.for.end.7834
.for.continue.7834:
%.tmp7841 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7842 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7841, i32 0, i32 1
%.tmp7843 = load i8*, i8** %.tmp7842
%.tmp7845 = getelementptr [2 x i8], [2 x i8]*@.str7844, i32 0, i32 0
%.tmp7846 = call i32(i8*,i8*) @strcmp(i8* %.tmp7843, i8* %.tmp7845)
%.tmp7847 = icmp eq i32 %.tmp7846, 0
br i1 %.tmp7847, label %.if.true.7848, label %.if.false.7848
.if.true.7848:
%.tmp7849 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.7850 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7849, %m1861$.Type.type** %pt.7850
%.tmp7851 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7850
%.tmp7852 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7851, i32 0, i32 0
%.tmp7854 = getelementptr [4 x i8], [4 x i8]*@.str7853, i32 0, i32 0
store i8* %.tmp7854, i8** %.tmp7852
%.tmp7855 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7850
%.tmp7856 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7855, i32 0, i32 3
%.tmp7857 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
store %m1861$.Type.type* %.tmp7857, %m1861$.Type.type** %.tmp7856
%.tmp7858 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.7850
store %m1861$.Type.type* %.tmp7858, %m1861$.Type.type** %t.7640
br label %.if.end.7848
.if.false.7848:
%.tmp7859 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7860 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7859, i32 0, i32 1
%.tmp7861 = load i8*, i8** %.tmp7860
%.tmp7863 = getelementptr [2 x i8], [2 x i8]*@.str7862, i32 0, i32 0
%.tmp7864 = call i32(i8*,i8*) @strcmp(i8* %.tmp7861, i8* %.tmp7863)
%.tmp7865 = icmp eq i32 %.tmp7864, 0
br i1 %.tmp7865, label %.if.true.7866, label %.if.false.7866
.if.true.7866:
%.tmp7867 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7868 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7867, i32 0, i32 7
%.tmp7869 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7868
%.tmp7870 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7869, i32 0, i32 1
%.tmp7871 = load i8*, i8** %.tmp7870
%.tmp7873 = getelementptr [2 x i8], [2 x i8]*@.str7872, i32 0, i32 0
%.tmp7874 = call i32(i8*,i8*) @strcmp(i8* %.tmp7871, i8* %.tmp7873)
%.tmp7875 = icmp eq i32 %.tmp7874, 0
br i1 %.tmp7875, label %.if.true.7876, label %.if.false.7876
.if.true.7876:
%.tmp7877 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.7878 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7877, %m1861$.Type.type** %slice_type.7878
%.tmp7879 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7878
%.tmp7880 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7879, i32 0, i32 0
%.tmp7882 = getelementptr [7 x i8], [7 x i8]*@.str7881, i32 0, i32 0
store i8* %.tmp7882, i8** %.tmp7880
%.tmp7883 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7878
%.tmp7884 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7883, i32 0, i32 1
%.tmp7886 = getelementptr [6 x i8], [6 x i8]*@.str7885, i32 0, i32 0
store i8* %.tmp7886, i8** %.tmp7884
%.tmp7887 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.7888 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7887, %m1861$.Type.type** %slice_c_array.7888
%.tmp7889 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7888
%.tmp7890 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7889, i32 0, i32 0
%.tmp7892 = getelementptr [4 x i8], [4 x i8]*@.str7891, i32 0, i32 0
store i8* %.tmp7892, i8** %.tmp7890
%.tmp7893 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7888
%.tmp7894 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7893, i32 0, i32 1
%.tmp7896 = getelementptr [6 x i8], [6 x i8]*@.str7895, i32 0, i32 0
store i8* %.tmp7896, i8** %.tmp7894
%.tmp7897 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7888
%.tmp7898 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7897, i32 0, i32 3
%.tmp7899 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
store %m1861$.Type.type* %.tmp7899, %m1861$.Type.type** %.tmp7898
%.tmp7900 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7878
%.tmp7901 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7900, i32 0, i32 3
%.tmp7902 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7888
store %m1861$.Type.type* %.tmp7902, %m1861$.Type.type** %.tmp7901
%.tmp7903 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.7904 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7903, %m1861$.Type.type** %slice_len.7904
%.tmp7905 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7904
%.tmp7906 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7905, i32 0, i32 0
%.tmp7908 = getelementptr [4 x i8], [4 x i8]*@.str7907, i32 0, i32 0
store i8* %.tmp7908, i8** %.tmp7906
%.tmp7909 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7904
%.tmp7910 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7909, i32 0, i32 1
%.tmp7912 = getelementptr [4 x i8], [4 x i8]*@.str7911, i32 0, i32 0
store i8* %.tmp7912, i8** %.tmp7910
%.tmp7913 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.7888
%.tmp7914 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7913, i32 0, i32 4
%.tmp7915 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7904
store %m1861$.Type.type* %.tmp7915, %m1861$.Type.type** %.tmp7914
%.tmp7916 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.7917 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7916, %m1861$.Type.type** %slice_cap.7917
%.tmp7918 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7917
%.tmp7919 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7918, i32 0, i32 0
%.tmp7921 = getelementptr [4 x i8], [4 x i8]*@.str7920, i32 0, i32 0
store i8* %.tmp7921, i8** %.tmp7919
%.tmp7922 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7917
%.tmp7923 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7922, i32 0, i32 1
%.tmp7925 = getelementptr [4 x i8], [4 x i8]*@.str7924, i32 0, i32 0
store i8* %.tmp7925, i8** %.tmp7923
%.tmp7926 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.7904
%.tmp7927 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7926, i32 0, i32 4
%.tmp7928 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.7917
store %m1861$.Type.type* %.tmp7928, %m1861$.Type.type** %.tmp7927
%.tmp7929 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.7878
store %m1861$.Type.type* %.tmp7929, %m1861$.Type.type** %t.7640
%.tmp7930 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7931 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7930, i32 0, i32 7
%.tmp7932 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7931
store %m307$.Node.type* %.tmp7932, %m307$.Node.type** %ptr.7838
br label %.if.end.7876
.if.false.7876:
br label %.if.end.7876
.if.end.7876:
br label %.if.end.7866
.if.false.7866:
%.tmp7933 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7934 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7936 = getelementptr [49 x i8], [49 x i8]*@.str7935, i32 0, i32 0
%.tmp7937 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7933, %m307$.Node.type* %.tmp7934, i8* %.tmp7936)
%.tmp7938 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7939 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7938, i32 0, i32 1
%.tmp7940 = load i8*, i8** %.tmp7939
%.tmp7941 = call i32(i8*,...) @printf(i8* %.tmp7937, i8* %.tmp7940)
%.tmp7942 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp7942
br label %.if.end.7866
.if.end.7866:
br label %.if.end.7848
.if.end.7848:
%.tmp7943 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7838
%.tmp7944 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7943, i32 0, i32 7
%.tmp7945 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7944
store %m307$.Node.type* %.tmp7945, %m307$.Node.type** %ptr.7838
br label %.for.start.7834
.for.end.7834:
%.tmp7946 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7640
ret %m1861$.Type.type* %.tmp7946
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
@.str4887 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str4902 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4909 = constant [9 x i8] c"OPERATOR\00"
@.str4918 = constant [6 x i8] c"block\00"
@.str4933 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4940 = constant [5 x i8] c"%s:\0A\00"
@.str4954 = constant [5 x i8] c"type\00"
@.str4969 = constant [11 x i8] c"assignable\00"
@.str4984 = constant [9 x i8] c"variable\00"
@.str4989 = constant [5 x i8] c"WORD\00"
@.str4998 = constant [31 x i8] c"unable to get declaration name\00"
@.str5018 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5030 = constant [6 x i8] c"%s.%d\00"
@.str5087 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5103 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5115 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5156 = constant [4 x i8] c"int\00"
@.str5163 = constant [4 x i8] c"chr\00"
@.str5171 = constant [5 x i8] c"bool\00"
@.str5180 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5189 = constant [4 x i8] c"ptr\00"
@.str5197 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5200 = constant [5 x i8] c"null\00"
@.str5208 = constant [7 x i8] c"struct\00"
@.str5229 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5249 = constant [10 x i8] c"typealias\00"
@.str5272 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5291 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5308 = constant [11 x i8] c"assignable\00"
@.str5325 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5340 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5347 = constant [6 x i8] c"block\00"
@.str5356 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5363 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5370 = constant [11 x i8] c"elif_block\00"
@.str5382 = constant [11 x i8] c"else_block\00"
@.str5392 = constant [6 x i8] c"block\00"
@.str5402 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5409 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5430 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5439 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5493 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5514 = constant [7 x i8] c"module\00"
@.str5567 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5604 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5612 = constant [9 x i8] c"function\00"
@.str5619 = constant [7 x i8] c"extern\00"
@.str5631 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5652 = constant [9 x i8] c"variable\00"
@.str5674 = constant [4 x i8] c"ptr\00"
@.str5693 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5717 = constant [10 x i8] c"typealias\00"
@.str5728 = constant [7 x i8] c"struct\00"
@.str5734 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5786 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str5807 = constant [9 x i8] c"variable\00"
@.str5818 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5839 = constant [9 x i8] c"variable\00"
@.str5847 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str5861 = constant [17 x i8] c"addr_destination\00"
@.str5868 = constant [16 x i8] c"mono_assignable\00"
@.str5876 = constant [11 x i8] c"assignable\00"
@.str5890 = constant [12 x i8] c"destination\00"
@.str5895 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str5923 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str5942 = constant [7 x i8] c"module\00"
@.str5964 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6035 = constant [6 x i8] c"slice\00"
@.str6048 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6090 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6111 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6135 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6158 = constant [16 x i8] c"mono_assignable\00"
@.str6184 = constant [5 x i8] c"cast\00"
@.str6194 = constant [5 x i8] c"type\00"
@.str6219 = constant [8 x i8] c"bitcast\00"
@.str6227 = constant [4 x i8] c"ptr\00"
@.str6234 = constant [4 x i8] c"ptr\00"
@.str6253 = constant [4 x i8] c"i%d\00"
@.str6258 = constant [4 x i8] c"i%d\00"
@.str6266 = constant [5 x i8] c"sext\00"
@.str6268 = constant [6 x i8] c"trunc\00"
@.str6273 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6293 = constant [16 x i8] c"mono_assignable\00"
@.str6355 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6378 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6385 = constant [2 x i8] c"+\00"
@.str6390 = constant [4 x i8] c"add\00"
@.str6395 = constant [2 x i8] c"-\00"
@.str6400 = constant [4 x i8] c"sub\00"
@.str6405 = constant [2 x i8] c"*\00"
@.str6410 = constant [4 x i8] c"mul\00"
@.str6415 = constant [2 x i8] c"/\00"
@.str6420 = constant [5 x i8] c"sdiv\00"
@.str6425 = constant [3 x i8] c"==\00"
@.str6430 = constant [8 x i8] c"icmp eq\00"
@.str6435 = constant [3 x i8] c"!=\00"
@.str6440 = constant [8 x i8] c"icmp ne\00"
@.str6445 = constant [2 x i8] c">\00"
@.str6450 = constant [9 x i8] c"icmp sgt\00"
@.str6455 = constant [2 x i8] c"<\00"
@.str6460 = constant [9 x i8] c"icmp slt\00"
@.str6465 = constant [2 x i8] c"&\00"
@.str6470 = constant [4 x i8] c"and\00"
@.str6475 = constant [2 x i8] c"|\00"
@.str6480 = constant [3 x i8] c"or\00"
@.str6485 = constant [3 x i8] c">=\00"
@.str6490 = constant [9 x i8] c"icmp sge\00"
@.str6495 = constant [3 x i8] c"<=\00"
@.str6500 = constant [9 x i8] c"icmp sle\00"
@.str6505 = constant [2 x i8] c"%\00"
@.str6510 = constant [5 x i8] c"srem\00"
@.str6514 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6521 = constant [4 x i8] c"add\00"
@.str6528 = constant [3 x i8] c"==\00"
@.str6535 = constant [3 x i8] c"!=\00"
@.str6543 = constant [2 x i8] c"|\00"
@.str6551 = constant [2 x i8] c"&\00"
@.str6559 = constant [2 x i8] c">\00"
@.str6567 = constant [2 x i8] c"<\00"
@.str6575 = constant [3 x i8] c">=\00"
@.str6583 = constant [3 x i8] c"<=\00"
@.str6591 = constant [5 x i8] c"bool\00"
@.str6595 = constant [4 x i8] c"int\00"
@.str6609 = constant [7 x i8] c"NUMBER\00"
@.str6623 = constant [4 x i8] c"int\00"
@.str6637 = constant [5 x i8] c"WORD\00"
@.str6647 = constant [5 x i8] c"null\00"
@.str6654 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str6668 = constant [5 x i8] c"null\00"
@.str6677 = constant [8 x i8] c"nullptr\00"
@.str6684 = constant [17 x i8] c"addr_destination\00"
@.str6696 = constant [12 x i8] c"destination\00"
@.str6740 = constant [4 x i8] c"ptr\00"
@.str6759 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6771 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6785 = constant [8 x i8] c"boolean\00"
@.str6799 = constant [5 x i8] c"bool\00"
@.str6808 = constant [6 x i8] c"false\00"
@.str6815 = constant [2 x i8] c"0\00"
@.str6819 = constant [2 x i8] c"1\00"
@.str6826 = constant [8 x i8] c"fn_call\00"
@.str6843 = constant [7 x i8] c"STRING\00"
@.str6869 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str6885 = constant [4 x i8] c"ptr\00"
@.str6898 = constant [4 x i8] c"chr\00"
@.str6905 = constant [4 x i8] c"CHR\00"
@.str6921 = constant [2 x i8] c"0\00"
@.str6937 = constant [22 x i8] c"Invalid character: %s\00"
@.str6953 = constant [4 x i8] c"chr\00"
@.str6957 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str6985 = constant [22 x i8] c"called 'abbr' on null\00"
@.str6991 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str6996 = constant [4 x i8] c"int\00"
@.str7001 = constant [2 x i8] c"i\00"
@.str7006 = constant [5 x i8] c"bool\00"
@.str7011 = constant [2 x i8] c"b\00"
@.str7016 = constant [5 x i8] c"void\00"
@.str7021 = constant [2 x i8] c"v\00"
@.str7026 = constant [4 x i8] c"chr\00"
@.str7031 = constant [2 x i8] c"c\00"
@.str7036 = constant [4 x i8] c"ptr\00"
@.str7043 = constant [4 x i8] c"%sp\00"
@.str7054 = constant [10 x i8] c"typealias\00"
@.str7065 = constant [7 x i8] c"struct\00"
@.str7070 = constant [2 x i8] c"s\00"
@.str7081 = constant [5 x i8] c"%s%s\00"
@.str7094 = constant [6 x i8] c"error\00"
@.str7099 = constant [2 x i8] c"?\00"
@.str7101 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7113 = constant [7 x i8] c".str%d\00"
@.str7137 = constant [6 x i8] c"array\00"
@.str7150 = constant [4 x i8] c"chr\00"
@.str7168 = constant [3 x i8] c"%d\00"
@.str7177 = constant [7 x i8] c"string\00"
@.str7197 = constant [7 x i8] c"module\00"
@.str7232 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7238 = constant [2 x i8] c"?\00"
@.str7244 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7250 = constant [4 x i8] c"int\00"
@.str7255 = constant [4 x i8] c"i32\00"
@.str7260 = constant [5 x i8] c"void\00"
@.str7265 = constant [5 x i8] c"void\00"
@.str7270 = constant [5 x i8] c"bool\00"
@.str7275 = constant [3 x i8] c"i1\00"
@.str7280 = constant [8 x i8] c"nullptr\00"
@.str7285 = constant [4 x i8] c"ptr\00"
@.str7290 = constant [4 x i8] c"chr\00"
@.str7295 = constant [3 x i8] c"i8\00"
@.str7300 = constant [9 x i8] c"function\00"
@.str7306 = constant [4 x i8] c"%s(\00"
@.str7332 = constant [4 x i8] c"%s,\00"
@.str7337 = constant [5 x i8] c"%s%s\00"
@.str7348 = constant [4 x i8] c"%s)\00"
@.str7356 = constant [4 x i8] c"ptr\00"
@.str7362 = constant [4 x i8] c"%s*\00"
@.str7374 = constant [7 x i8] c"struct\00"
@.str7380 = constant [2 x i8] c"{\00"
@.str7397 = constant [4 x i8] c"%s,\00"
@.str7402 = constant [5 x i8] c"%s%s\00"
@.str7413 = constant [4 x i8] c"%s}\00"
@.str7421 = constant [6 x i8] c"array\00"
@.str7427 = constant [10 x i8] c"[%s x %s]\00"
@.str7446 = constant [10 x i8] c"typealias\00"
@.str7452 = constant [5 x i8] c"%%%s\00"
@.str7462 = constant [7 x i8] c"vararg\00"
@.str7467 = constant [4 x i8] c"...\00"
@.str7472 = constant [6 x i8] c"error\00"
@.str7477 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7553 = constant [9 x i8] c"function\00"
@.str7571 = constant [5 x i8] c"WORD\00"
@.str7628 = constant [10 x i8] c"fn_params\00"
@.str7644 = constant [10 x i8] c"structdef\00"
@.str7651 = constant [7 x i8] c"struct\00"
@.str7658 = constant [5 x i8] c"type\00"
@.str7689 = constant [5 x i8] c"type\00"
@.str7716 = constant [5 x i8] c"type\00"
@.str7722 = constant [12 x i8] c"dotted_name\00"
@.str7736 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str7749 = constant [6 x i8] c"error\00"
@.str7754 = constant [10 x i8] c"typealias\00"
@.str7778 = constant [4 x i8] c"str\00"
@.str7785 = constant [4 x i8] c"ptr\00"
@.str7794 = constant [4 x i8] c"chr\00"
@.str7799 = constant [5 x i8] c"WORD\00"
@.str7812 = constant [4 x i8] c"...\00"
@.str7819 = constant [7 x i8] c"vararg\00"
@.str7823 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str7844 = constant [2 x i8] c"*\00"
@.str7853 = constant [4 x i8] c"ptr\00"
@.str7862 = constant [2 x i8] c"[\00"
@.str7872 = constant [2 x i8] c"]\00"
@.str7881 = constant [7 x i8] c"struct\00"
@.str7885 = constant [6 x i8] c"slice\00"
@.str7891 = constant [4 x i8] c"ptr\00"
@.str7895 = constant [6 x i8] c"c_arr\00"
@.str7907 = constant [4 x i8] c"int\00"
@.str7911 = constant [4 x i8] c"len\00"
@.str7920 = constant [4 x i8] c"int\00"
@.str7924 = constant [4 x i8] c"cap\00"
@.str7935 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp7947 = load i32, i32* %argc
%.tmp7948 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp7947, i8** %.tmp7948)
%.tmp7949 = load i32, i32* @STDERR
%.tmp7951 = getelementptr [2 x i8], [2 x i8]*@.str7950, i32 0, i32 0
%.tmp7952 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp7949, i8* %.tmp7951)
%stderr.7953 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7952, %m0$.File.type** %stderr.7953
%.tmp7954 = load i8**, i8*** %argv
%.tmp7955 = getelementptr i8*, i8** %.tmp7954, i32 1
%.tmp7956 = load i8*, i8** %.tmp7955
%filename.7957 = alloca i8*
store i8* %.tmp7956, i8** %filename.7957
%.tmp7958 = call %m0$.File.type*() @tmpfile()
%llvm_code.7959 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7958, %m0$.File.type** %llvm_code.7959
%.tmp7960 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7959
%.tmp7961 = load i8*, i8** %filename.7957
%.tmp7962 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp7960, i8* %.tmp7961)
%compiler_ctx.7963 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp7962, %m1861$.CompilerCtx.type** %compiler_ctx.7963
%.tmp7964 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.7963
%.tmp7965 = bitcast ptr null to %m307$.Node.type*
%.tmp7966 = load i8*, i8** %filename.7957
%.tmp7967 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7964, %m307$.Node.type* %.tmp7965, i8* %.tmp7966)
br i1 %.tmp7967, label %.if.true.7968, label %.if.false.7968
.if.true.7968:
%.tmp7969 = load %m0$.File.type*, %m0$.File.type** %stderr.7953
%.tmp7971 = getelementptr [34 x i8], [34 x i8]*@.str7970, i32 0, i32 0
%.tmp7972 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7969, i8* %.tmp7971)
ret i32 1
br label %.if.end.7968
.if.false.7968:
br label %.if.end.7968
.if.end.7968:
%.tmp7973 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7959
%.tmp7974 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp7973)
%.tmp7975 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7959
%.tmp7976 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp7975)
%llvm_code_size.7977 = alloca i32
store i32 %.tmp7976, i32* %llvm_code_size.7977
%.tmp7978 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7959
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp7978)
%.tmp7980 = getelementptr [30 x i8], [30 x i8]*@.str7979, i32 0, i32 0
%.tmp7982 = getelementptr [2 x i8], [2 x i8]*@.str7981, i32 0, i32 0
%.tmp7983 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp7980, i8* %.tmp7982)
%proc.7984 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp7983, %m0$.File.type** %proc.7984
%.tmp7985 = load %m0$.File.type*, %m0$.File.type** %proc.7984
%.tmp7986 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7985)
%.tmp7987 = load %m0$.File.type*, %m0$.File.type** %llvm_code.7959
%.tmp7988 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp7987)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp7986, i32 %.tmp7988)
%.tmp7989 = load %m0$.File.type*, %m0$.File.type** %proc.7984
%.tmp7990 = icmp eq %m0$.File.type* %.tmp7989, null
br i1 %.tmp7990, label %.if.true.7991, label %.if.false.7991
.if.true.7991:
%.tmp7992 = load %m0$.File.type*, %m0$.File.type** %stderr.7953
%.tmp7994 = getelementptr [28 x i8], [28 x i8]*@.str7993, i32 0, i32 0
%.tmp7995 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7992, i8* %.tmp7994)
ret i32 0
br label %.if.end.7991
.if.false.7991:
br label %.if.end.7991
.if.end.7991:
%.tmp7996 = load %m0$.File.type*, %m0$.File.type** %proc.7984
%.tmp7997 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp7996)
%.tmp7998 = icmp ne i32 %.tmp7997, 0
br i1 %.tmp7998, label %.if.true.7999, label %.if.false.7999
.if.true.7999:
%.tmp8000 = load %m0$.File.type*, %m0$.File.type** %stderr.7953
%.tmp8002 = getelementptr [24 x i8], [24 x i8]*@.str8001, i32 0, i32 0
%.tmp8003 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8000, i8* %.tmp8002)
ret i32 0
br label %.if.end.7999
.if.false.7999:
br label %.if.end.7999
.if.end.7999:
%.tmp8005 = getelementptr [17 x i8], [17 x i8]*@.str8004, i32 0, i32 0
%.tmp8007 = getelementptr [2 x i8], [2 x i8]*@.str8006, i32 0, i32 0
%.tmp8008 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8005, i8* %.tmp8007)
%gcc_proc.8009 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8008, %m0$.File.type** %gcc_proc.8009
%.tmp8010 = load %m0$.File.type*, %m0$.File.type** %gcc_proc.8009
%.tmp8011 = icmp eq %m0$.File.type* %.tmp8010, null
br i1 %.tmp8011, label %.if.true.8012, label %.if.false.8012
.if.true.8012:
%.tmp8013 = load %m0$.File.type*, %m0$.File.type** %stderr.7953
%.tmp8015 = getelementptr [28 x i8], [28 x i8]*@.str8014, i32 0, i32 0
%.tmp8016 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8013, i8* %.tmp8015)
ret i32 0
br label %.if.end.8012
.if.false.8012:
br label %.if.end.8012
.if.end.8012:
%.tmp8017 = load %m0$.File.type*, %m0$.File.type** %proc.7984
%.tmp8018 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8017)
%.tmp8019 = icmp ne i32 %.tmp8018, 0
br i1 %.tmp8019, label %.if.true.8020, label %.if.false.8020
.if.true.8020:
%.tmp8021 = load %m0$.File.type*, %m0$.File.type** %stderr.7953
%.tmp8023 = getelementptr [23 x i8], [23 x i8]*@.str8022, i32 0, i32 0
%.tmp8024 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8021, i8* %.tmp8023)
br label %.if.end.8020
.if.false.8020:
%.tmp8026 = getelementptr [32 x i8], [32 x i8]*@.str8025, i32 0, i32 0
%.tmp8027 = load i8*, i8** %filename.7957
%.tmp8028 = call i32(i8*,...) @printf(i8* %.tmp8026, i8* %.tmp8027)
br label %.if.end.8020
.if.end.8020:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8029 = load i32, i32* %argc
%.tmp8030 = icmp eq i32 %.tmp8029, 2
br i1 %.tmp8030, label %.if.true.8031, label %.if.false.8031
.if.true.8031:
ret void
br label %.if.end.8031
.if.false.8031:
br label %.if.end.8031
.if.end.8031:
%.tmp8033 = getelementptr [21 x i8], [21 x i8]*@.str8032, i32 0, i32 0
%tmpl.8034 = alloca i8*
store i8* %.tmp8033, i8** %tmpl.8034
%.tmp8035 = load i8**, i8*** %argv
%.tmp8036 = getelementptr i8*, i8** %.tmp8035, i32 0
%.tmp8037 = load i8*, i8** %.tmp8036
%.tmp8038 = call i32(i8*) @strlen(i8* %.tmp8037)
%.tmp8039 = load i8*, i8** %tmpl.8034
%.tmp8040 = call i32(i8*) @strlen(i8* %.tmp8039)
%.tmp8041 = add i32 %.tmp8038, %.tmp8040
%len_filename.8042 = alloca i32
store i32 %.tmp8041, i32* %len_filename.8042
%.tmp8043 = load i32, i32* %len_filename.8042
%.tmp8044 = call i8*(i32) @malloc(i32 %.tmp8043)
%buf.8045 = alloca i8*
store i8* %.tmp8044, i8** %buf.8045
%.tmp8046 = load i8*, i8** %buf.8045
%.tmp8047 = load i8*, i8** %tmpl.8034
%.tmp8048 = load i8**, i8*** %argv
%.tmp8049 = getelementptr i8*, i8** %.tmp8048, i32 0
%.tmp8050 = load i8*, i8** %.tmp8049
%.tmp8051 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8046, i8* %.tmp8047, i8* %.tmp8050)
%.tmp8052 = load i8*, i8** %buf.8045
%.tmp8053 = call i32(i8*) @puts(i8* %.tmp8052)
%.tmp8054 = load i8*, i8** %buf.8045
call void(i8*) @free(i8* %.tmp8054)
call void(i32) @exit(i32 1)
ret void
}
@.str7950 = constant [2 x i8] c"w\00"
@.str7970 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str7979 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str7981 = constant [2 x i8] c"w\00"
@.str7993 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8001 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8004 = constant [17 x i8] c"gcc out.s -o out\00"
@.str8006 = constant [2 x i8] c"w\00"
@.str8014 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8022 = constant [23 x i8] c"error on gcc execution\00"
@.str8025 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8032 = constant [21 x i8] c"Usage: %s <filename>\00"
