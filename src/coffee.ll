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
%m2$.Passwd.type = type {i8*,i32,i32,i8*,i8*}
declare i32 @getuid()
declare %m2$.Passwd.type* @getpwuid(i32)
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
define i8* @m1862$grammar.cp() {
%.tmp1864 = getelementptr [1697 x i8], [1697 x i8]*@.str1863, i32 0, i32 0
ret i8* %.tmp1864
}
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
define i8* @m2540$append_tmpl.cp() {
%.tmp2542 = getelementptr [1885 x i8], [1885 x i8]*@.str2541, i32 0, i32 0
ret i8* %.tmp2542
}
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
define i8* @m1861$get_root.cp() {
%.tmp2580 = getelementptr [12 x i8], [12 x i8]*@.str2579, i32 0, i32 0
%.tmp2581 = call i8*(i8*) @getenv(i8* %.tmp2580)
%project_root.2582 = alloca i8*
store i8* %.tmp2581, i8** %project_root.2582
%.tmp2583 = load i8*, i8** %project_root.2582
%.tmp2584 = icmp eq i8* %.tmp2583, null
br i1 %.tmp2584, label %.if.true.2585, label %.if.false.2585
.if.true.2585:
%.tmp2587 = getelementptr [5 x i8], [5 x i8]*@.str2586, i32 0, i32 0
%.tmp2588 = call i8*(i8*) @getenv(i8* %.tmp2587)
%home.2589 = alloca i8*
store i8* %.tmp2588, i8** %home.2589
%.tmp2590 = getelementptr i8*, i8** %project_root.2582, i32 0
%.tmp2592 = getelementptr [11 x i8], [11 x i8]*@.str2591, i32 0, i32 0
%.tmp2593 = load i8*, i8** %home.2589
%.tmp2594 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2590, i8* %.tmp2592, i8* %.tmp2593)
br label %.if.end.2585
.if.false.2585:
br label %.if.end.2585
.if.end.2585:
%.tmp2595 = load i8*, i8** %project_root.2582
ret i8* %.tmp2595
}
define %m1861$.Type.type* @m1861$new_type.m1861$.Type.typep() {
%.tmp2596 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2597 = ptrtoint %m1861$.Type.type* %.tmp2596 to i32
%.tmp2598 = call i8*(i32) @malloc(i32 %.tmp2597)
%.tmp2599 = bitcast i8* %.tmp2598 to %m1861$.Type.type*
%type.2600 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2599, %m1861$.Type.type** %type.2600
%.tmp2601 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2600
%.tmp2602 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2601, i32 0, i32 1
store i8* null, i8** %.tmp2602
%.tmp2603 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2600
%.tmp2604 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2603, i32 0, i32 2
store i8* null, i8** %.tmp2604
%.tmp2605 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2600
%.tmp2606 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2605, i32 0, i32 0
store i8* null, i8** %.tmp2606
%.tmp2607 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2600
%.tmp2608 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2607, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2608
%.tmp2609 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2600
%.tmp2610 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2609, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2610
%.tmp2611 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2600
ret %m1861$.Type.type* %.tmp2611
}
define void @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.dest.arg, %m1861$.Type.type* %.src.arg) {
%dest = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.dest.arg, %m1861$.Type.type** %dest
%src = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.src.arg, %m1861$.Type.type** %src
%.tmp2612 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2613 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2612, i32 0, i32 0
%.tmp2614 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2615 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2614, i32 0, i32 0
%.tmp2616 = load i8*, i8** %.tmp2615
store i8* %.tmp2616, i8** %.tmp2613
%.tmp2617 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2618 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2617, i32 0, i32 1
%.tmp2619 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2620 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2619, i32 0, i32 1
%.tmp2621 = load i8*, i8** %.tmp2620
store i8* %.tmp2621, i8** %.tmp2618
%.tmp2622 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2623 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2622, i32 0, i32 2
%.tmp2624 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2625 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2624, i32 0, i32 2
%.tmp2626 = load i8*, i8** %.tmp2625
store i8* %.tmp2626, i8** %.tmp2623
%.tmp2627 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2628 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2627, i32 0, i32 3
%.tmp2629 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2628
%.tmp2630 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2631 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2630, i32 0, i32 3
%.tmp2632 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2631
%.tmp2633 = icmp ne %m1861$.Type.type* %.tmp2629, %.tmp2632
br i1 %.tmp2633, label %.if.true.2634, label %.if.false.2634
.if.true.2634:
%.tmp2635 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2636 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2635, i32 0, i32 3
%.tmp2637 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2638 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2637, i32 0, i32 3
%.tmp2639 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2638
store %m1861$.Type.type* %.tmp2639, %m1861$.Type.type** %.tmp2636
%.tmp2640 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2641 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2640, i32 0, i32 3
%.tmp2642 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2641
%.tmp2643 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2644 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2643, i32 0, i32 3
%.tmp2645 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2644
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2642, %m1861$.Type.type* %.tmp2645)
br label %.if.end.2634
.if.false.2634:
br label %.if.end.2634
.if.end.2634:
%.tmp2646 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2647 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2646, i32 0, i32 4
%.tmp2648 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2647
%.tmp2649 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2650 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2649, i32 0, i32 4
%.tmp2651 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2650
%.tmp2652 = icmp ne %m1861$.Type.type* %.tmp2648, %.tmp2651
br i1 %.tmp2652, label %.if.true.2653, label %.if.false.2653
.if.true.2653:
%.tmp2654 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2655 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2654, i32 0, i32 4
%.tmp2656 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2657 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2656, i32 0, i32 4
%.tmp2658 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2657
store %m1861$.Type.type* %.tmp2658, %m1861$.Type.type** %.tmp2655
%.tmp2659 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2660 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2659, i32 0, i32 4
%.tmp2661 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2660
%.tmp2662 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2663 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2662, i32 0, i32 4
%.tmp2664 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2663
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2661, %m1861$.Type.type* %.tmp2664)
br label %.if.end.2653
.if.false.2653:
br label %.if.end.2653
.if.end.2653:
ret void
}
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m1861$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1861$.AssignableInfo.type* @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.node.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2665 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* null, i32 1
%.tmp2666 = ptrtoint %m1861$.AssignableInfo.type* %.tmp2665 to i32
%.tmp2667 = call i8*(i32) @malloc(i32 %.tmp2666)
%.tmp2668 = bitcast i8* %.tmp2667 to %m1861$.AssignableInfo.type*
%ptr.2669 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp2668, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2670 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2671 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2670, i32 0, i32 1
%.tmp2672 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2672, i8* %.tmp2671
%.tmp2673 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2674 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2673, i32 0, i32 0
store i8* null, i8** %.tmp2674
%.tmp2675 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2676 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2675, i32 0, i32 3
store i8* null, i8** %.tmp2676
%.tmp2677 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2678 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2677, i32 0, i32 2
%.tmp2680 = getelementptr [1 x i8], [1 x i8]*@.str2679, i32 0, i32 0
store i8* %.tmp2680, i8** %.tmp2678
%.tmp2681 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2682 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2681, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2682
%.tmp2683 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2684 = icmp ne %m307$.Node.type* %.tmp2683, null
br i1 %.tmp2684, label %.if.true.2685, label %.if.false.2685
.if.true.2685:
%.tmp2686 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2687 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2686, i32 0, i32 5
%.tmp2688 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2689 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2688, i32 0, i32 3
%.tmp2690 = load i32, i32* %.tmp2689
store i32 %.tmp2690, i32* %.tmp2687
%.tmp2691 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2692 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2691, i32 0, i32 6
%.tmp2693 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2694 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2693, i32 0, i32 4
%.tmp2695 = load i32, i32* %.tmp2694
store i32 %.tmp2695, i32* %.tmp2692
%.tmp2696 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2697 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2696, i32 0, i32 7
%.tmp2698 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2699 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2698, i32 0, i32 2
%.tmp2700 = load i8*, i8** %.tmp2699
store i8* %.tmp2700, i8** %.tmp2697
br label %.if.end.2685
.if.false.2685:
%.tmp2701 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2702 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2701, i32 0, i32 5
store i32 0, i32* %.tmp2702
%.tmp2703 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2704 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2703, i32 0, i32 6
store i32 0, i32* %.tmp2704
%.tmp2705 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2706 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2705, i32 0, i32 7
store i8* null, i8** %.tmp2706
br label %.if.end.2685
.if.end.2685:
%.tmp2707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
ret %m1861$.AssignableInfo.type* %.tmp2707
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2708 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2709 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2708, i32 0, i32 0
%.tmp2710 = load i8*, i8** %id
store i8* %.tmp2710, i8** %.tmp2709
%.tmp2711 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2712 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2711, i32 0, i32 1
%.tmp2713 = load i8, i8* %scope
store i8 %.tmp2713, i8* %.tmp2712
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2714 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2715 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2714, i32 0, i32 1
%.tmp2716 = load i8, i8* %.tmp2715
%.tmp2717 = load i8, i8* @SCOPE_CONST
%.tmp2718 = icmp eq i8 %.tmp2716, %.tmp2717
br i1 %.tmp2718, label %.if.true.2719, label %.if.false.2719
.if.true.2719:
%.tmp2720 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2721 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2720, i32 0, i32 0
%.tmp2722 = load i8*, i8** %.tmp2721
ret i8* %.tmp2722
br label %.if.end.2719
.if.false.2719:
br label %.if.end.2719
.if.end.2719:
%buf.2723 = alloca i8*
store i8* null, i8** %buf.2723
%.tmp2724 = getelementptr i8*, i8** %buf.2723, i32 0
%.tmp2726 = getelementptr [5 x i8], [5 x i8]*@.str2725, i32 0, i32 0
%.tmp2727 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2728 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2727, i32 0, i32 1
%.tmp2729 = load i8, i8* %.tmp2728
%.tmp2730 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2731 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2730, i32 0, i32 0
%.tmp2732 = load i8*, i8** %.tmp2731
%.tmp2733 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2724, i8* %.tmp2726, i8 %.tmp2729, i8* %.tmp2732)
%.tmp2734 = load i8*, i8** %buf.2723
ret i8* %.tmp2734
}
%m1861$.ScopeItem.type = type {i8*,%m1861$.AssignableInfo.type*,%m1861$.ScopeItem.type*}
%m1861$.GlobalName.type = type {i8*,i8*,i1,i1,%m1861$.AssignableInfo.type*,%m1861$.GlobalName.type*}
%m1861$.Scope.type = type {i8*,%m1861$.ScopeItem.type*,i8*,i8*,i8*,%m1861$.Scope.type*}
%m1861$.ModuleLookup.type = type {i8*,i8*,%m1861$.ModuleLookup.type*,%m1861$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1861$.CompilerCtx.type = type {%m307$.Node.type*,%m0$.File.type*,%m1861$.ErrorList.type*,%m1861$.GlobalName.type*,%m307$.Rule.type**,i32,%m1861$.ModuleLookup.type*,i8*}
define i1 @m1861$is_same_type.b.m1861$.CompilerCtx.typep.m1861$.Type.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.a.arg, %m1861$.Type.type* %.b.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%a = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.a.arg, %m1861$.Type.type** %a
%b = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.b.arg, %m1861$.Type.type** %b
%.tmp2735 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2736 = load %m1861$.Type.type*, %m1861$.Type.type** %a
%.tmp2737 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp2735, %m1861$.Type.type* %.tmp2736)
%a_repr.2738 = alloca i8*
store i8* %.tmp2737, i8** %a_repr.2738
%.tmp2739 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2740 = load %m1861$.Type.type*, %m1861$.Type.type** %b
%.tmp2741 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp2739, %m1861$.Type.type* %.tmp2740)
%b_repr.2742 = alloca i8*
store i8* %.tmp2741, i8** %b_repr.2742
%.tmp2743 = load i8*, i8** %a_repr.2738
%.tmp2744 = load i8*, i8** %b_repr.2742
%.tmp2745 = call i32(i8*,i8*) @strcmp(i8* %.tmp2743, i8* %.tmp2744)
%.tmp2746 = icmp eq i32 %.tmp2745, 0
ret i1 %.tmp2746
}
define void @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%tmp_buff.2747 = alloca i8*
store i8* null, i8** %tmp_buff.2747
%.tmp2748 = getelementptr i8*, i8** %tmp_buff.2747, i32 0
%.tmp2750 = getelementptr [7 x i8], [7 x i8]*@.str2749, i32 0, i32 0
%.tmp2751 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2752 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2751)
%.tmp2753 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2748, i8* %.tmp2750, i32 %.tmp2752)
%.tmp2754 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2755 = load i8, i8* @SCOPE_LOCAL
%.tmp2756 = load i8*, i8** %tmp_buff.2747
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2754, i8 %.tmp2755, i8* %.tmp2756)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2758 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2759 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2758, i32 0, i32 6
%.tmp2760 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2759
%m.2761 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2760, %m1861$.ModuleLookup.type** %m.2761
br label %.for.start.2757
.for.start.2757:
%.tmp2762 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2761
%.tmp2763 = icmp ne %m1861$.ModuleLookup.type* %.tmp2762, null
br i1 %.tmp2763, label %.for.continue.2757, label %.for.end.2757
.for.continue.2757:
%.tmp2764 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2761
%.tmp2765 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2764, i32 0, i32 0
%.tmp2766 = load i8*, i8** %.tmp2765
%.tmp2767 = load i8*, i8** %filename
%.tmp2768 = call i32(i8*,i8*) @strcmp(i8* %.tmp2766, i8* %.tmp2767)
%.tmp2769 = icmp eq i32 %.tmp2768, 0
br i1 %.tmp2769, label %.if.true.2770, label %.if.false.2770
.if.true.2770:
%.tmp2771 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2761
ret %m1861$.ModuleLookup.type* %.tmp2771
br label %.if.end.2770
.if.false.2770:
br label %.if.end.2770
.if.end.2770:
%.tmp2772 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2761
%.tmp2773 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2772, i32 0, i32 2
%.tmp2774 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2773
store %m1861$.ModuleLookup.type* %.tmp2774, %m1861$.ModuleLookup.type** %m.2761
br label %.for.start.2757
.for.end.2757:
%.tmp2775 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2775
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2776 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2777 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2778 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2777, i32 0, i32 7
%.tmp2779 = load i8*, i8** %.tmp2778
%.tmp2780 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2776, i8* %.tmp2779)
ret %m1861$.ModuleLookup.type* %.tmp2780
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2781 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2782 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2781, i32 0, i32 5
%.tmp2783 = load i32, i32* %.tmp2782
%uid.2784 = alloca i32
store i32 %.tmp2783, i32* %uid.2784
%.tmp2785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2786 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2785, i32 0, i32 5
%.tmp2787 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2788 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2787, i32 0, i32 5
%.tmp2789 = load i32, i32* %.tmp2788
%.tmp2790 = add i32 %.tmp2789, 1
store i32 %.tmp2790, i32* %.tmp2786
%.tmp2791 = load i32, i32* %uid.2784
ret i32 %.tmp2791
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2792 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2793 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2792 to i32
%.tmp2794 = call i8*(i32) @malloc(i32 %.tmp2793)
%.tmp2795 = bitcast i8* %.tmp2794 to %m1861$.CompilerCtx.type*
%ctx.2796 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2795, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2797 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2798 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2797, i32 0, i32 1
%.tmp2799 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2799, %m0$.File.type** %.tmp2798
%.tmp2800 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2801 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2800, i32 0, i32 0
%.tmp2802 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2802, %m307$.Node.type** %.tmp2801
%.tmp2803 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2804 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2803, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2804
%.tmp2805 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2806 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2805, i32 0, i32 5
store i32 0, i32* %.tmp2806
%.tmp2807 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2808 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2807, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2808
%.tmp2809 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2810 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2809, i32 0, i32 7
%.tmp2811 = load i8*, i8** %filename
store i8* %.tmp2811, i8** %.tmp2810
%.tmp2812 = call i8*() @m1862$grammar.cp()
%.tmp2813 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2812)
%grammar_file.2814 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2813, %m0$.File.type** %grammar_file.2814
%.tmp2815 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2814
%.tmp2816 = icmp eq %m0$.File.type* %.tmp2815, null
br i1 %.tmp2816, label %.if.true.2817, label %.if.false.2817
.if.true.2817:
%.tmp2818 = bitcast ptr null to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2818
br label %.if.end.2817
.if.false.2817:
br label %.if.end.2817
.if.end.2817:
%.tmp2819 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2814
%.tmp2820 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2819)
%grammar_ctx.2821 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2820, %m307$.ParsingContext.type** %grammar_ctx.2821
%.tmp2822 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2814
%.tmp2823 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2822)
%.tmp2824 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2825 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2824, i32 0, i32 4
%.tmp2826 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2821
%.tmp2827 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2826)
store %m307$.Rule.type** %.tmp2827, %m307$.Rule.type*** %.tmp2825
%.tmp2828 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2829 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2828, i32 0, i32 6
%.tmp2830 = load i32, i32* @ModuleLookup_size
%.tmp2831 = call i8*(i32) @malloc(i32 %.tmp2830)
%.tmp2832 = bitcast i8* %.tmp2831 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2832, %m1861$.ModuleLookup.type** %.tmp2829
%.tmp2833 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2834 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2833, i32 0, i32 6
%.tmp2835 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2834
%.tmp2836 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2835, i32 0, i32 0
%.tmp2837 = load i8*, i8** %filename
store i8* %.tmp2837, i8** %.tmp2836
%.tmp2838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2839 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2838, i32 0, i32 6
%.tmp2840 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2839
%.tmp2841 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2840, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2841
%.tmp2842 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2843 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2842, i32 0, i32 6
%.tmp2844 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2843
%.tmp2845 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2844, i32 0, i32 1
%.tmp2847 = getelementptr [1 x i8], [1 x i8]*@.str2846, i32 0, i32 0
store i8* %.tmp2847, i8** %.tmp2845
%.tmp2848 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2849 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2848, i32 0, i32 6
%.tmp2850 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2849
%.tmp2851 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2850, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2851
%.tmp2852 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2796
%.tmp2853 = bitcast %m1861$.CompilerCtx.type* %.tmp2852 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2853
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
%.tmp2854 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2855 = ptrtoint %m1861$.Scope.type* %.tmp2854 to i32
%.tmp2856 = call i8*(i32) @malloc(i32 %.tmp2855)
%.tmp2857 = bitcast i8* %.tmp2856 to %m1861$.Scope.type*
%s.2858 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2857, %m1861$.Scope.type** %s.2858
%.tmp2859 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2860 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2859)
%m.2861 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2860, %m1861$.ModuleLookup.type** %m.2861
%.tmp2862 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2858
%.tmp2863 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2862, i32 0, i32 5
%.tmp2864 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2861
%.tmp2865 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2864, i32 0, i32 3
%.tmp2866 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2865
store %m1861$.Scope.type* %.tmp2866, %m1861$.Scope.type** %.tmp2863
%.tmp2867 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2858
%.tmp2868 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2867, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2868
%.tmp2869 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2858
%.tmp2870 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2869, i32 0, i32 2
%.tmp2871 = load i8*, i8** %type
store i8* %.tmp2871, i8** %.tmp2870
%.tmp2872 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2858
%.tmp2873 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2872, i32 0, i32 3
%.tmp2874 = load i8*, i8** %begin_id
store i8* %.tmp2874, i8** %.tmp2873
%.tmp2875 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2858
%.tmp2876 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2875, i32 0, i32 4
%.tmp2877 = load i8*, i8** %end_id
store i8* %.tmp2877, i8** %.tmp2876
%.tmp2878 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2861
%.tmp2879 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2878, i32 0, i32 3
%.tmp2880 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2858
store %m1861$.Scope.type* %.tmp2880, %m1861$.Scope.type** %.tmp2879
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2881 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2882 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2881)
%m.2883 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2882, %m1861$.ModuleLookup.type** %m.2883
%.tmp2884 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2883
%.tmp2885 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2884, i32 0, i32 3
%.tmp2886 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2885
%.tmp2887 = icmp ne %m1861$.Scope.type* %.tmp2886, null
%.tmp2889 = getelementptr [61 x i8], [61 x i8]*@.str2888, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2887, i8* %.tmp2889)
%.tmp2890 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2883
%.tmp2891 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2890, i32 0, i32 3
%.tmp2892 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2883
%.tmp2893 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2892, i32 0, i32 3
%.tmp2894 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2893
%.tmp2895 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2894, i32 0, i32 5
%.tmp2896 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2895
store %m1861$.Scope.type* %.tmp2896, %m1861$.Scope.type** %.tmp2891
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2897 = call i8*() @m1862$grammar.cp()
%.tmp2898 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2897)
%grammar_file.2899 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2898, %m0$.File.type** %grammar_file.2899
%.tmp2900 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2899
%.tmp2901 = icmp eq %m0$.File.type* %.tmp2900, null
br i1 %.tmp2901, label %.if.true.2902, label %.if.false.2902
.if.true.2902:
ret i1 0
br label %.if.end.2902
.if.false.2902:
br label %.if.end.2902
.if.end.2902:
%.tmp2903 = load i8*, i8** %filepath
%.tmp2904 = load i32, i32* @O_RDONLY
%.tmp2905 = call i32(i8*,i32) @open(i8* %.tmp2903, i32 %.tmp2904)
%input_fd.2906 = alloca i32
store i32 %.tmp2905, i32* %input_fd.2906
%.tmp2907 = load i32, i32* %input_fd.2906
%.tmp2908 = icmp sle i32 %.tmp2907, 0
br i1 %.tmp2908, label %.if.true.2909, label %.if.false.2909
.if.true.2909:
%err_msg.2910 = alloca i8*
store i8* null, i8** %err_msg.2910
%.tmp2911 = getelementptr i8*, i8** %err_msg.2910, i32 0
%.tmp2913 = getelementptr [26 x i8], [26 x i8]*@.str2912, i32 0, i32 0
%.tmp2914 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2915 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2911, i8* %.tmp2913, %m307$.Node.type* %.tmp2914)
%.tmp2916 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2917 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2918 = load i8*, i8** %err_msg.2910
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2916, %m307$.Node.type* %.tmp2917, i8* %.tmp2918)
ret i1 0
br label %.if.end.2909
.if.false.2909:
br label %.if.end.2909
.if.end.2909:
%.tmp2919 = load i32, i32* %input_fd.2906
%.tmp2920 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2919)
%p.2921 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2920, %m229$.PeekerInfo.type** %p.2921
%.tmp2922 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2921
%.tmp2923 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2922, i32 0, i32 6
%.tmp2924 = load i8*, i8** %filepath
store i8* %.tmp2924, i8** %.tmp2923
%.tmp2925 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2921
%.tmp2926 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2925, i1 0)
%tokens.2927 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2926, %m308$.Token.type** %tokens.2927
%.tmp2928 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2929 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2928, i32 0, i32 4
%.tmp2930 = load %m307$.Rule.type**, %m307$.Rule.type*** %.tmp2929
%.tmp2932 = getelementptr [6 x i8], [6 x i8]*@.str2931, i32 0, i32 0
%.tmp2933 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2927
%.tmp2934 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2930, i8* %.tmp2932, %m308$.Token.type* %.tmp2933)
%ast.2935 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2934, %m307$.ParseResult.type** %ast.2935
%.tmp2936 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2935
%.tmp2937 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2936, i32 0, i32 0
%.tmp2938 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2937
%.tmp2939 = icmp ne %m751$.Error.type* %.tmp2938, null
br i1 %.tmp2939, label %.if.true.2940, label %.if.false.2940
.if.true.2940:
%.tmp2941 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2942 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2935
%.tmp2943 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2942, i32 0, i32 0
%.tmp2944 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2943
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp2941, %m751$.Error.type* %.tmp2944)
br label %.if.end.2940
.if.false.2940:
br label %.if.end.2940
.if.end.2940:
%.tmp2945 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2946 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2935
%.tmp2947 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2946, i32 0, i32 1
%.tmp2948 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2947
%.tmp2949 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2945, %m307$.Node.type* %.tmp2948)
ret i1 %.tmp2949
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2950 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2951 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2950, i32 0, i32 2
%.tmp2952 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2951
%.tmp2953 = icmp eq %m1861$.ErrorList.type* %.tmp2952, null
br i1 %.tmp2953, label %.if.true.2954, label %.if.false.2954
.if.true.2954:
%.tmp2955 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2956 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2955, %m307$.Node.type* %.tmp2956)
br label %.if.end.2954
.if.false.2954:
br label %.if.end.2954
.if.end.2954:
%.tmp2957 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2958 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2957, i32 0, i32 2
%.tmp2959 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2958
%.tmp2960 = icmp ne %m1861$.ErrorList.type* %.tmp2959, null
br i1 %.tmp2960, label %.if.true.2961, label %.if.false.2961
.if.true.2961:
%.tmp2963 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2964 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2963, i32 0, i32 2
%.tmp2965 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2964
%err.2966 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp2965, %m1861$.ErrorList.type** %err.2966
br label %.for.start.2962
.for.start.2962:
%.tmp2967 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2966
%.tmp2968 = icmp ne %m1861$.ErrorList.type* %.tmp2967, null
br i1 %.tmp2968, label %.for.continue.2962, label %.for.end.2962
.for.continue.2962:
%.tmp2969 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2966
%.tmp2970 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2969, i32 0, i32 2
%.tmp2971 = load i1, i1* %.tmp2970
%.tmp2972 = icmp eq i1 %.tmp2971, 0
br i1 %.tmp2972, label %.if.true.2973, label %.if.false.2973
.if.true.2973:
%.tmp2974 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2966
%.tmp2975 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2974, i32 0, i32 0
%.tmp2976 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2975
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp2976)
%.tmp2977 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2966
%.tmp2978 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2977, i32 0, i32 2
store i1 1, i1* %.tmp2978
br label %.if.end.2973
.if.false.2973:
br label %.if.end.2973
.if.end.2973:
%.tmp2979 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2966
%.tmp2980 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2979, i32 0, i32 1
%.tmp2981 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2980
store %m1861$.ErrorList.type* %.tmp2981, %m1861$.ErrorList.type** %err.2966
br label %.for.start.2962
.for.end.2962:
ret i1 1
br label %.if.end.2961
.if.false.2961:
br label %.if.end.2961
.if.end.2961:
ret i1 0
}
define void @m1861$mark_weak_global.v.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2983 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2984 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2983, i32 0, i32 3
%.tmp2985 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2984
%g.2986 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp2985, %m1861$.GlobalName.type** %g.2986
br label %.for.start.2982
.for.start.2982:
%.tmp2987 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2986
%.tmp2988 = icmp ne %m1861$.GlobalName.type* %.tmp2987, null
br i1 %.tmp2988, label %.for.continue.2982, label %.for.end.2982
.for.continue.2982:
%.tmp2989 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2986
%.tmp2990 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2989, i32 0, i32 3
%.tmp2991 = load i1, i1* %.tmp2990
%.tmp2992 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2986
%.tmp2993 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2992, i32 0, i32 0
%.tmp2994 = load i8*, i8** %.tmp2993
%.tmp2995 = load i8*, i8** %id
%.tmp2996 = call i32(i8*,i8*) @strcmp(i8* %.tmp2994, i8* %.tmp2995)
%.tmp2997 = icmp eq i32 %.tmp2996, 0
%.tmp2998 = and i1 %.tmp2991, %.tmp2997
br i1 %.tmp2998, label %.if.true.2999, label %.if.false.2999
.if.true.2999:
%.tmp3000 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2986
%.tmp3001 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3000, i32 0, i32 2
store i1 1, i1* %.tmp3001
br label %.for.end.2982
br label %.if.end.2999
.if.false.2999:
br label %.if.end.2999
.if.end.2999:
%.tmp3002 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2986
%.tmp3003 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3002, i32 0, i32 5
%.tmp3004 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3003
store %m1861$.GlobalName.type* %.tmp3004, %m1861$.GlobalName.type** %g.2986
br label %.for.start.2982
.for.end.2982:
ret void
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp3005 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3006 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3005, i32 0, i32 0
%.tmp3007 = load i8*, i8** %.tmp3006
%.tmp3009 = getelementptr [6 x i8], [6 x i8]*@.str3008, i32 0, i32 0
%.tmp3010 = call i32(i8*,i8*) @strcmp(i8* %.tmp3007, i8* %.tmp3009)
%.tmp3011 = icmp ne i32 %.tmp3010, 0
br i1 %.tmp3011, label %.if.true.3012, label %.if.false.3012
.if.true.3012:
%.tmp3013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3014 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3016 = getelementptr [29 x i8], [29 x i8]*@.str3015, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3013, %m307$.Node.type* %.tmp3014, i8* %.tmp3016)
ret void
br label %.if.end.3012
.if.false.3012:
br label %.if.end.3012
.if.end.3012:
%.tmp3017 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3019 = getelementptr [7 x i8], [7 x i8]*@.str3018, i32 0, i32 0
%.tmp3020 = bitcast ptr null to i8*
%.tmp3021 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3017, i8* %.tmp3019, i8* %.tmp3020, i8* %.tmp3021)
%.tmp3022 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3023 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3022, i32 0, i32 6
%.tmp3024 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3023
%start.3025 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3024, %m307$.Node.type** %start.3025
%.tmp3026 = load %m307$.Node.type*, %m307$.Node.type** %start.3025
%.tmp3027 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3026, i32 0, i32 0
%.tmp3028 = load i8*, i8** %.tmp3027
%.tmp3030 = getelementptr [13 x i8], [13 x i8]*@.str3029, i32 0, i32 0
%.tmp3031 = call i32(i8*,i8*) @strcmp(i8* %.tmp3028, i8* %.tmp3030)
%.tmp3032 = icmp eq i32 %.tmp3031, 0
br i1 %.tmp3032, label %.if.true.3033, label %.if.false.3033
.if.true.3033:
%.tmp3034 = load %m307$.Node.type*, %m307$.Node.type** %start.3025
%.tmp3035 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3034, i32 0, i32 7
%.tmp3036 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3035
store %m307$.Node.type* %.tmp3036, %m307$.Node.type** %start.3025
br label %.if.end.3033
.if.false.3033:
br label %.if.end.3033
.if.end.3033:
%.tmp3038 = load %m307$.Node.type*, %m307$.Node.type** %start.3025
%stmt.3039 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3038, %m307$.Node.type** %stmt.3039
br label %.for.start.3037
.for.start.3037:
%.tmp3040 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3039
%.tmp3041 = icmp ne %m307$.Node.type* %.tmp3040, null
br i1 %.tmp3041, label %.for.continue.3037, label %.for.end.3037
.for.continue.3037:
%.tmp3042 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3043 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3039
%.tmp3044 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3043, i32 0, i32 6
%.tmp3045 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3044
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3042, %m307$.Node.type* %.tmp3045, i1 1)
%.tmp3046 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3039
%.tmp3047 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3046, i32 0, i32 7
%.tmp3048 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3047
store %m307$.Node.type* %.tmp3048, %m307$.Node.type** %stmt.3039
br label %.for.start.3037
.for.end.3037:
%.tmp3050 = load %m307$.Node.type*, %m307$.Node.type** %start.3025
%s.3051 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3050, %m307$.Node.type** %s.3051
br label %.for.start.3049
.for.start.3049:
%.tmp3052 = load %m307$.Node.type*, %m307$.Node.type** %s.3051
%.tmp3053 = icmp ne %m307$.Node.type* %.tmp3052, null
br i1 %.tmp3053, label %.for.continue.3049, label %.for.end.3049
.for.continue.3049:
%.tmp3054 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3055 = load %m307$.Node.type*, %m307$.Node.type** %s.3051
%.tmp3056 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3055, i32 0, i32 6
%.tmp3057 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3056
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3054, %m307$.Node.type* %.tmp3057, i1 0)
%.tmp3058 = load %m307$.Node.type*, %m307$.Node.type** %s.3051
%.tmp3059 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3058, i32 0, i32 7
%.tmp3060 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3059
store %m307$.Node.type* %.tmp3060, %m307$.Node.type** %s.3051
br label %.for.start.3049
.for.end.3049:
%.tmp3061 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3062 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3061)
%mod.3063 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3062, %m1861$.ModuleLookup.type** %mod.3063
%.tmp3064 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3063
%.tmp3065 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3064, i32 0, i32 1
%.tmp3066 = load i8*, i8** %.tmp3065
%.tmp3068 = getelementptr [1 x i8], [1 x i8]*@.str3067, i32 0, i32 0
%.tmp3069 = call i32(i8*,i8*) @strcmp(i8* %.tmp3066, i8* %.tmp3068)
%.tmp3070 = icmp eq i32 %.tmp3069, 0
br i1 %.tmp3070, label %.if.true.3071, label %.if.false.3071
.if.true.3071:
%.tmp3073 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3074 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3073, i32 0, i32 3
%.tmp3075 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3074
%g.3076 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp3075, %m1861$.GlobalName.type** %g.3076
br label %.for.start.3072
.for.start.3072:
%.tmp3077 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3076
%.tmp3078 = icmp ne %m1861$.GlobalName.type* %.tmp3077, null
br i1 %.tmp3078, label %.for.continue.3072, label %.for.end.3072
.for.continue.3072:
%.tmp3079 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3080 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3076
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp3079, %m1861$.GlobalName.type* %.tmp3080)
%.tmp3081 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3076
%.tmp3082 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3081, i32 0, i32 5
%.tmp3083 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3082
store %m1861$.GlobalName.type* %.tmp3083, %m1861$.GlobalName.type** %g.3076
br label %.for.start.3072
.for.end.3072:
br label %.if.end.3071
.if.false.3071:
br label %.if.end.3071
.if.end.3071:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp3084 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3085 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3084, i32 0, i32 2
%.tmp3086 = load i1, i1* %.tmp3085
br i1 %.tmp3086, label %.if.true.3087, label %.if.false.3087
.if.true.3087:
ret void
br label %.if.end.3087
.if.false.3087:
br label %.if.end.3087
.if.end.3087:
%.tmp3088 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3089 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3088, i32 0, i32 1
%.tmp3090 = load i8*, i8** %.tmp3089
%.tmp3092 = getelementptr [7 x i8], [7 x i8]*@.str3091, i32 0, i32 0
%.tmp3093 = call i32(i8*,i8*) @strcmp(i8* %.tmp3090, i8* %.tmp3092)
%.tmp3094 = icmp eq i32 %.tmp3093, 0
br i1 %.tmp3094, label %.if.true.3095, label %.if.false.3095
.if.true.3095:
%.tmp3096 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3097 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3096, i32 0, i32 1
%.tmp3098 = load %m0$.File.type*, %m0$.File.type** %.tmp3097
%.tmp3100 = getelementptr [21 x i8], [21 x i8]*@.str3099, i32 0, i32 0
%.tmp3101 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3102 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3101, i32 0, i32 4
%.tmp3103 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3102
%.tmp3104 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3103)
%.tmp3105 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3106 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3107 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3106, i32 0, i32 4
%.tmp3108 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3107
%.tmp3109 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3108, i32 0, i32 4
%.tmp3110 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3109
%.tmp3111 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3105, %m1861$.Type.type* %.tmp3110)
%.tmp3112 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3113 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3112, i32 0, i32 0
%.tmp3114 = load i8*, i8** %.tmp3113
%.tmp3115 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3098, i8* %.tmp3100, i8* %.tmp3104, i8* %.tmp3111, i8* %.tmp3114)
br label %.if.end.3095
.if.false.3095:
%.tmp3116 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3117 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3116, i32 0, i32 1
%.tmp3118 = load i8*, i8** %.tmp3117
%.tmp3120 = getelementptr [7 x i8], [7 x i8]*@.str3119, i32 0, i32 0
%.tmp3121 = call i32(i8*,i8*) @strcmp(i8* %.tmp3118, i8* %.tmp3120)
%.tmp3122 = icmp eq i32 %.tmp3121, 0
br i1 %.tmp3122, label %.if.true.3123, label %.if.false.3123
.if.true.3123:
%.tmp3124 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3125 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3126 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3125, i32 0, i32 4
%.tmp3127 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3126
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3124, %m1861$.AssignableInfo.type* %.tmp3127)
br label %.if.end.3123
.if.false.3123:
br label %.if.end.3123
.if.end.3123:
br label %.if.end.3095
.if.end.3095:
%.tmp3128 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3129 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3128, i32 0, i32 2
store i1 1, i1* %.tmp3129
ret void
}
define void @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp3130 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3131 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3130, i32 0, i32 1
%.tmp3132 = load %m0$.File.type*, %m0$.File.type** %.tmp3131
%.tmp3134 = getelementptr [15 x i8], [15 x i8]*@.str3133, i32 0, i32 0
%.tmp3135 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3136 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3137 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3136, i32 0, i32 4
%.tmp3138 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3137
%.tmp3139 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3138, i32 0, i32 3
%.tmp3140 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3139
%.tmp3141 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3135, %m1861$.Type.type* %.tmp3140)
%.tmp3142 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3143 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3142)
%.tmp3144 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3132, i8* %.tmp3134, i8* %.tmp3141, i8* %.tmp3143)
%.tmp3146 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3147 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3146, i32 0, i32 4
%.tmp3148 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3147
%.tmp3149 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3148, i32 0, i32 3
%.tmp3150 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3149
%.tmp3151 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3150, i32 0, i32 4
%.tmp3152 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3151
%pt.3153 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3152, %m1861$.Type.type** %pt.3153
br label %.for.start.3145
.for.start.3145:
%.tmp3154 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3153
%.tmp3155 = icmp ne %m1861$.Type.type* %.tmp3154, null
br i1 %.tmp3155, label %.for.continue.3145, label %.for.end.3145
.for.continue.3145:
%.tmp3156 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3153
%.tmp3157 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3158 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3157, i32 0, i32 4
%.tmp3159 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3158
%.tmp3160 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3159, i32 0, i32 3
%.tmp3161 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3160
%.tmp3162 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3161, i32 0, i32 4
%.tmp3163 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3162
%.tmp3164 = icmp ne %m1861$.Type.type* %.tmp3156, %.tmp3163
br i1 %.tmp3164, label %.if.true.3165, label %.if.false.3165
.if.true.3165:
%.tmp3166 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3167 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3166, i32 0, i32 1
%.tmp3168 = load %m0$.File.type*, %m0$.File.type** %.tmp3167
%.tmp3170 = getelementptr [3 x i8], [3 x i8]*@.str3169, i32 0, i32 0
%.tmp3171 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3168, i8* %.tmp3170)
br label %.if.end.3165
.if.false.3165:
br label %.if.end.3165
.if.end.3165:
%.tmp3172 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3173 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3172, i32 0, i32 1
%.tmp3174 = load %m0$.File.type*, %m0$.File.type** %.tmp3173
%.tmp3176 = getelementptr [3 x i8], [3 x i8]*@.str3175, i32 0, i32 0
%.tmp3177 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3178 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3153
%.tmp3179 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3177, %m1861$.Type.type* %.tmp3178)
%.tmp3180 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3174, i8* %.tmp3176, i8* %.tmp3179)
%.tmp3181 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3153
%.tmp3182 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3181, i32 0, i32 4
%.tmp3183 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3182
store %m1861$.Type.type* %.tmp3183, %m1861$.Type.type** %pt.3153
br label %.for.start.3145
.for.end.3145:
%.tmp3184 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3185 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3184, i32 0, i32 1
%.tmp3186 = load %m0$.File.type*, %m0$.File.type** %.tmp3185
%.tmp3188 = getelementptr [3 x i8], [3 x i8]*@.str3187, i32 0, i32 0
%.tmp3189 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3186, i8* %.tmp3188)
ret void
}
define i8* @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3190 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3191 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3190)
%m.3192 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3191, %m1861$.ModuleLookup.type** %m.3192
%.tmp3193 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3192
%.tmp3194 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3193, i32 0, i32 1
%.tmp3195 = load i8*, i8** %.tmp3194
ret i8* %.tmp3195
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
%mangled_name.3196 = alloca i8*
store i8* null, i8** %mangled_name.3196
%.tmp3197 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3198 = load %m307$.Node.type*, %m307$.Node.type** %fn
%.tmp3199 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3198, i32 0, i32 2
%.tmp3200 = load i8*, i8** %.tmp3199
%.tmp3201 = call i8*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3197, i8* %.tmp3200)
%prefix.3202 = alloca i8*
store i8* %.tmp3201, i8** %prefix.3202
%.tmp3203 = getelementptr i8*, i8** %mangled_name.3196, i32 0
%.tmp3205 = getelementptr [5 x i8], [5 x i8]*@.str3204, i32 0, i32 0
%.tmp3206 = load i8*, i8** %prefix.3202
%.tmp3207 = load i8*, i8** %original_name
%.tmp3208 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3203, i8* %.tmp3205, i8* %.tmp3206, i8* %.tmp3207)
%.tmp3209 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3210 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3209, i32 0, i32 0
%.tmp3211 = load i8*, i8** %.tmp3210
%.tmp3213 = getelementptr [9 x i8], [9 x i8]*@.str3212, i32 0, i32 0
%.tmp3214 = call i32(i8*,i8*) @strcmp(i8* %.tmp3211, i8* %.tmp3213)
%.tmp3215 = icmp eq i32 %.tmp3214, 0
br i1 %.tmp3215, label %.if.true.3216, label %.if.false.3216
.if.true.3216:
%.tmp3217 = load i8*, i8** %mangled_name.3196
%.tmp3219 = getelementptr [5 x i8], [5 x i8]*@.str3218, i32 0, i32 0
%.tmp3220 = call i32(i8*,i8*) @strcmp(i8* %.tmp3217, i8* %.tmp3219)
%.tmp3221 = icmp ne i32 %.tmp3220, 0
br i1 %.tmp3221, label %.if.true.3222, label %.if.false.3222
.if.true.3222:
%tmp_buff.3223 = alloca i8*
store i8* null, i8** %tmp_buff.3223
%swap_var.3224 = alloca i8*
store i8* null, i8** %swap_var.3224
%.tmp3226 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3227 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3226, i32 0, i32 3
%.tmp3228 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3227
%tp.3229 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3228, %m1861$.Type.type** %tp.3229
br label %.for.start.3225
.for.start.3225:
%.tmp3230 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3229
%.tmp3231 = icmp ne %m1861$.Type.type* %.tmp3230, null
br i1 %.tmp3231, label %.for.continue.3225, label %.for.end.3225
.for.continue.3225:
%.tmp3232 = getelementptr i8*, i8** %tmp_buff.3223, i32 0
%.tmp3234 = getelementptr [6 x i8], [6 x i8]*@.str3233, i32 0, i32 0
%.tmp3235 = load i8*, i8** %mangled_name.3196
%.tmp3236 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3229
%.tmp3237 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp3236)
%.tmp3238 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3232, i8* %.tmp3234, i8* %.tmp3235, i8* %.tmp3237)
%.tmp3239 = load i8*, i8** %tmp_buff.3223
store i8* %.tmp3239, i8** %swap_var.3224
%.tmp3240 = load i8*, i8** %mangled_name.3196
store i8* %.tmp3240, i8** %tmp_buff.3223
%.tmp3241 = load i8*, i8** %swap_var.3224
store i8* %.tmp3241, i8** %mangled_name.3196
%.tmp3242 = load i8*, i8** %tmp_buff.3223
call void(i8*) @free(i8* %.tmp3242)
%.tmp3243 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3229
%.tmp3244 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3243, i32 0, i32 4
%.tmp3245 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3244
store %m1861$.Type.type* %.tmp3245, %m1861$.Type.type** %tp.3229
br label %.for.start.3225
.for.end.3225:
br label %.if.end.3222
.if.false.3222:
br label %.if.end.3222
.if.end.3222:
br label %.if.end.3216
.if.false.3216:
br label %.if.end.3216
.if.end.3216:
%.tmp3246 = load i8*, i8** %mangled_name.3196
ret i8* %.tmp3246
}
define void @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3247 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %info.3247
%return_type.3248 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %return_type.3248
%err_buf.3249 = alloca i8*
store i8* null, i8** %err_buf.3249
%tmp_buff.3250 = alloca i8*
store i8* null, i8** %tmp_buff.3250
%.tmp3251 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3252 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3251, i32 0, i32 0
%.tmp3253 = load i8*, i8** %.tmp3252
%.tmp3255 = getelementptr [3 x i8], [3 x i8]*@.str3254, i32 0, i32 0
%.tmp3256 = call i32(i8*,i8*) @strcmp(i8* %.tmp3253, i8* %.tmp3255)
%.tmp3257 = icmp eq i32 %.tmp3256, 0
br i1 %.tmp3257, label %.if.true.3258, label %.if.false.3258
.if.true.3258:
ret void
br label %.if.end.3258
.if.false.3258:
%.tmp3259 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3260 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3259, i32 0, i32 0
%.tmp3261 = load i8*, i8** %.tmp3260
%.tmp3263 = getelementptr [7 x i8], [7 x i8]*@.str3262, i32 0, i32 0
%.tmp3264 = call i32(i8*,i8*) @strcmp(i8* %.tmp3261, i8* %.tmp3263)
%.tmp3265 = icmp eq i32 %.tmp3264, 0
br i1 %.tmp3265, label %.if.true.3266, label %.if.false.3266
.if.true.3266:
%.tmp3267 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3268 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3267, i32 0, i32 6
%.tmp3269 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3268
%.tmp3271 = getelementptr [11 x i8], [11 x i8]*@.str3270, i32 0, i32 0
%.tmp3272 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3269, i8* %.tmp3271)
%assignable.3273 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3272, %m307$.Node.type** %assignable.3273
%.tmp3274 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3275 = load %m307$.Node.type*, %m307$.Node.type** %assignable.3273
%.tmp3276 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3274, %m307$.Node.type* %.tmp3275)
%a_info.3277 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3276, %m1861$.AssignableInfo.type** %a_info.3277
%.tmp3278 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3277
%.tmp3279 = icmp eq %m1861$.AssignableInfo.type* %.tmp3278, null
br i1 %.tmp3279, label %.if.true.3280, label %.if.false.3280
.if.true.3280:
ret void
br label %.if.end.3280
.if.false.3280:
br label %.if.end.3280
.if.end.3280:
%.tmp3281 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3282 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3281)
store %m1861$.AssignableInfo.type* %.tmp3282, %m1861$.AssignableInfo.type** %info.3247
%.tmp3283 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3284 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3283, i32 0, i32 6
%.tmp3285 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3284
%.tmp3286 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3285, i32 0, i32 7
%.tmp3287 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3286
%.tmp3288 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3287, i32 0, i32 1
%.tmp3289 = load i8*, i8** %.tmp3288
%global_name.3290 = alloca i8*
store i8* %.tmp3289, i8** %global_name.3290
%.tmp3291 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3292 = load i8, i8* @SCOPE_GLOBAL
%.tmp3293 = load i8*, i8** %global_name.3290
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3291, i8 %.tmp3292, i8* %.tmp3293)
%.tmp3294 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3295 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3294, i32 0, i32 4
%.tmp3296 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3277
%.tmp3297 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3296, i32 0, i32 4
%.tmp3298 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3297
store %m1861$.Type.type* %.tmp3298, %m1861$.Type.type** %.tmp3295
%.tmp3299 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3300 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3299, i32 0, i32 3
%.tmp3302 = getelementptr [9 x i8], [9 x i8]*@.str3301, i32 0, i32 0
store i8* %.tmp3302, i8** %.tmp3300
%.tmp3303 = load i1, i1* %shallow
%.tmp3304 = icmp eq i1 %.tmp3303, 1
br i1 %.tmp3304, label %.if.true.3305, label %.if.false.3305
.if.true.3305:
%.tmp3306 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3307 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3308 = load i8*, i8** %global_name.3290
%.tmp3309 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3306, %m307$.Node.type* %.tmp3307, i8* %.tmp3308, %m1861$.AssignableInfo.type* %.tmp3309)
br label %.if.end.3305
.if.false.3305:
%.tmp3310 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3311 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3310, i32 0, i32 1
%.tmp3312 = load %m0$.File.type*, %m0$.File.type** %.tmp3311
%.tmp3314 = getelementptr [21 x i8], [21 x i8]*@.str3313, i32 0, i32 0
%.tmp3315 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3316 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3315)
%.tmp3317 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3318 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3319 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3318, i32 0, i32 4
%.tmp3320 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3319
%.tmp3321 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3317, %m1861$.Type.type* %.tmp3320)
%.tmp3322 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3277
%.tmp3323 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3322)
%.tmp3324 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3312, i8* %.tmp3314, i8* %.tmp3316, i8* %.tmp3321, i8* %.tmp3323)
br label %.if.end.3305
.if.end.3305:
br label %.if.end.3266
.if.false.3266:
%.tmp3325 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3325, i32 0, i32 0
%.tmp3327 = load i8*, i8** %.tmp3326
%.tmp3329 = getelementptr [10 x i8], [10 x i8]*@.str3328, i32 0, i32 0
%.tmp3330 = call i32(i8*,i8*) @strcmp(i8* %.tmp3327, i8* %.tmp3329)
%.tmp3331 = icmp eq i32 %.tmp3330, 0
br i1 %.tmp3331, label %.if.true.3332, label %.if.false.3332
.if.true.3332:
%.tmp3333 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3334 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3333, i32 0, i32 6
%.tmp3335 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3334
%.tmp3336 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3335, i32 0, i32 7
%.tmp3337 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3336
%.tmp3338 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3337, i32 0, i32 1
%.tmp3339 = load i8*, i8** %.tmp3338
%type_name.3340 = alloca i8*
store i8* %.tmp3339, i8** %type_name.3340
%.tmp3341 = load i1, i1* %shallow
%.tmp3342 = icmp eq i1 %.tmp3341, 1
br i1 %.tmp3342, label %.if.true.3343, label %.if.false.3343
.if.true.3343:
%.tmp3344 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3345 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3344)
store %m1861$.AssignableInfo.type* %.tmp3345, %m1861$.AssignableInfo.type** %info.3247
%.tmp3346 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3347 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3346)
%mod_from.3348 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3347, %m1861$.ModuleLookup.type** %mod_from.3348
%.tmp3349 = getelementptr i8*, i8** %tmp_buff.3250, i32 0
%.tmp3351 = getelementptr [11 x i8], [11 x i8]*@.str3350, i32 0, i32 0
%.tmp3352 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3348
%.tmp3353 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3352, i32 0, i32 1
%.tmp3354 = load i8*, i8** %.tmp3353
%.tmp3355 = load i8*, i8** %type_name.3340
%.tmp3356 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3349, i8* %.tmp3351, i8* %.tmp3354, i8* %.tmp3355)
%.tmp3357 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3358 = load i8, i8* @SCOPE_LOCAL
%.tmp3359 = load i8*, i8** %tmp_buff.3250
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3357, i8 %.tmp3358, i8* %.tmp3359)
%.tmp3360 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3361 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3360, i32 0, i32 3
%.tmp3363 = getelementptr [10 x i8], [10 x i8]*@.str3362, i32 0, i32 0
store i8* %.tmp3363, i8** %.tmp3361
%.tmp3364 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3365 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3364, i32 0, i32 5
%.tmp3366 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3367 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3366, i32 0, i32 3
%.tmp3368 = load i32, i32* %.tmp3367
store i32 %.tmp3368, i32* %.tmp3365
%.tmp3369 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3370 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3369, i32 0, i32 6
%.tmp3371 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3372 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3371, i32 0, i32 4
%.tmp3373 = load i32, i32* %.tmp3372
store i32 %.tmp3373, i32* %.tmp3370
%.tmp3374 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3375 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3374, i32 0, i32 4
%.tmp3376 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3376, %m1861$.Type.type** %.tmp3375
%.tmp3377 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3378 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3379 = load i8*, i8** %type_name.3340
%.tmp3380 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3377, %m307$.Node.type* %.tmp3378, i8* %.tmp3379, %m1861$.AssignableInfo.type* %.tmp3380)
%.tmp3381 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3382 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3381, i32 0, i32 6
%.tmp3383 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3382
%.tmp3385 = getelementptr [5 x i8], [5 x i8]*@.str3384, i32 0, i32 0
%.tmp3386 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3383, i8* %.tmp3385)
%type_decl.3387 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3386, %m307$.Node.type** %type_decl.3387
%.tmp3388 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3389 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3387
%.tmp3390 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3389, i32 0, i32 6
%.tmp3391 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3390
%.tmp3392 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3388, %m307$.Node.type* %.tmp3391)
%type_struct.3393 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3392, %m1861$.Type.type** %type_struct.3393
%.tmp3394 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3395 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3394, i32 0, i32 4
%.tmp3396 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3395
%.tmp3397 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3393
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3396, %m1861$.Type.type* %.tmp3397)
%.tmp3398 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3399 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3398, i32 0, i32 4
%.tmp3400 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3393
store %m1861$.Type.type* %.tmp3400, %m1861$.Type.type** %.tmp3399
br label %.if.end.3343
.if.false.3343:
%.tmp3401 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3402 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3403 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3402, i32 0, i32 7
%.tmp3404 = load i8*, i8** %.tmp3403
%.tmp3405 = load i8*, i8** %type_name.3340
%.tmp3406 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3401, i8* %.tmp3404, i8* %.tmp3405)
%scope.3407 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3406, %m1861$.ScopeItem.type** %scope.3407
%.tmp3408 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3407
%.tmp3409 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3408, i32 0, i32 1
%.tmp3410 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3409
store %m1861$.AssignableInfo.type* %.tmp3410, %m1861$.AssignableInfo.type** %info.3247
%.tmp3411 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3412 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3411, i32 0, i32 1
%.tmp3413 = load %m0$.File.type*, %m0$.File.type** %.tmp3412
%.tmp3415 = getelementptr [14 x i8], [14 x i8]*@.str3414, i32 0, i32 0
%.tmp3416 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3417 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3416)
%.tmp3418 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3419 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3420 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3419, i32 0, i32 4
%.tmp3421 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3420
%.tmp3422 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3418, %m1861$.Type.type* %.tmp3421)
%.tmp3423 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3413, i8* %.tmp3415, i8* %.tmp3417, i8* %.tmp3422)
br label %.if.end.3343
.if.end.3343:
br label %.if.end.3332
.if.false.3332:
%.tmp3424 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3425 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3424, i32 0, i32 0
%.tmp3426 = load i8*, i8** %.tmp3425
%.tmp3428 = getelementptr [7 x i8], [7 x i8]*@.str3427, i32 0, i32 0
%.tmp3429 = call i32(i8*,i8*) @strcmp(i8* %.tmp3426, i8* %.tmp3428)
%.tmp3430 = icmp eq i32 %.tmp3429, 0
br i1 %.tmp3430, label %.if.true.3431, label %.if.false.3431
.if.true.3431:
%.tmp3432 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3433 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3432)
store %m1861$.AssignableInfo.type* %.tmp3433, %m1861$.AssignableInfo.type** %info.3247
%.tmp3434 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3435 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3434, i32 0, i32 4
%.tmp3436 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3437 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3438 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3437, i32 0, i32 6
%.tmp3439 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3438
%.tmp3440 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3439, i32 0, i32 7
%.tmp3441 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3440
%.tmp3442 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3436, %m307$.Node.type* %.tmp3441)
store %m1861$.Type.type* %.tmp3442, %m1861$.Type.type** %.tmp3435
%.tmp3443 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3444 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3443, i32 0, i32 3
%.tmp3446 = getelementptr [7 x i8], [7 x i8]*@.str3445, i32 0, i32 0
store i8* %.tmp3446, i8** %.tmp3444
%.tmp3447 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3448 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3447, i32 0, i32 6
%.tmp3449 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3448
%.tmp3450 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3449, i32 0, i32 7
%.tmp3451 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3450
%.tmp3452 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3451, i32 0, i32 7
%.tmp3453 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3452
%.tmp3454 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3453, i32 0, i32 1
%.tmp3455 = load i8*, i8** %.tmp3454
%fn_name.3456 = alloca i8*
store i8* %.tmp3455, i8** %fn_name.3456
%.tmp3457 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3458 = load i8, i8* @SCOPE_GLOBAL
%.tmp3459 = load i8*, i8** %fn_name.3456
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3457, i8 %.tmp3458, i8* %.tmp3459)
%.tmp3460 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3460, %m1861$.Type.type** %return_type.3248
%.tmp3461 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3248
%.tmp3462 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3461, i32 0, i32 0
%.tmp3463 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3464 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3463, i32 0, i32 4
%.tmp3465 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3464
%.tmp3466 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3465, i32 0, i32 3
%.tmp3467 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3466
%.tmp3468 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3467, i32 0, i32 0
%.tmp3469 = load i8*, i8** %.tmp3468
store i8* %.tmp3469, i8** %.tmp3462
%.tmp3470 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3248
%.tmp3471 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3470, i32 0, i32 3
%.tmp3472 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3473 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3472, i32 0, i32 4
%.tmp3474 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3473
%.tmp3475 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3474, i32 0, i32 3
%.tmp3476 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3475
%.tmp3477 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3476, i32 0, i32 3
%.tmp3478 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3477
store %m1861$.Type.type* %.tmp3478, %m1861$.Type.type** %.tmp3471
%.tmp3479 = load i1, i1* %shallow
%.tmp3480 = icmp eq i1 %.tmp3479, 0
br i1 %.tmp3480, label %.if.true.3481, label %.if.false.3481
.if.true.3481:
%.tmp3482 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3483 = load i8*, i8** %fn_name.3456
call void(%m1861$.CompilerCtx.type*,i8*) @m1861$mark_weak_global.v.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3482, i8* %.tmp3483)
%.tmp3484 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3485 = load i8*, i8** %fn_name.3456
%.tmp3487 = getelementptr [7 x i8], [7 x i8]*@.str3486, i32 0, i32 0
%.tmp3488 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp3484, i8* %.tmp3485, i8* %.tmp3487, %m1861$.AssignableInfo.type* %.tmp3488, i1 1, i1 1)
%.tmp3489 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3490 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3489, %m1861$.AssignableInfo.type* %.tmp3490)
br label %.if.end.3481
.if.false.3481:
%.tmp3491 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3492 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3493 = load i8*, i8** %fn_name.3456
%.tmp3494 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3491, %m307$.Node.type* %.tmp3492, i8* %.tmp3493, %m1861$.AssignableInfo.type* %.tmp3494)
br label %.if.end.3481
.if.end.3481:
br label %.if.end.3431
.if.false.3431:
%.tmp3495 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3496 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3495, i32 0, i32 0
%.tmp3497 = load i8*, i8** %.tmp3496
%.tmp3499 = getelementptr [9 x i8], [9 x i8]*@.str3498, i32 0, i32 0
%.tmp3500 = call i32(i8*,i8*) @strcmp(i8* %.tmp3497, i8* %.tmp3499)
%.tmp3501 = icmp eq i32 %.tmp3500, 0
br i1 %.tmp3501, label %.if.true.3502, label %.if.false.3502
.if.true.3502:
%.tmp3503 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3504 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3503)
store %m1861$.AssignableInfo.type* %.tmp3504, %m1861$.AssignableInfo.type** %info.3247
%.tmp3505 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3506 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3505, i32 0, i32 3
%.tmp3508 = getelementptr [9 x i8], [9 x i8]*@.str3507, i32 0, i32 0
store i8* %.tmp3508, i8** %.tmp3506
%.tmp3509 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3510 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3509, i32 0, i32 4
%.tmp3511 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3512 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3513 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3512, i32 0, i32 6
%.tmp3514 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3513
%.tmp3515 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3511, %m307$.Node.type* %.tmp3514)
store %m1861$.Type.type* %.tmp3515, %m1861$.Type.type** %.tmp3510
%.tmp3516 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3517 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3516)
%name.3518 = alloca i8*
store i8* %.tmp3517, i8** %name.3518
%.tmp3519 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3520 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3521 = load i8*, i8** %name.3518
%.tmp3522 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3523 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3522, i32 0, i32 4
%.tmp3524 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3523
%.tmp3525 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3519, %m307$.Node.type* %.tmp3520, i8* %.tmp3521, %m1861$.Type.type* %.tmp3524)
store i8* %.tmp3525, i8** %tmp_buff.3250
%.tmp3526 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3527 = load i8, i8* @SCOPE_GLOBAL
%.tmp3528 = load i8*, i8** %tmp_buff.3250
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3526, i8 %.tmp3527, i8* %.tmp3528)
%.tmp3529 = load i1, i1* %shallow
%.tmp3530 = icmp eq i1 %.tmp3529, 1
br i1 %.tmp3530, label %.if.true.3531, label %.if.false.3531
.if.true.3531:
%.tmp3532 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3533 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3534 = load i8*, i8** %name.3518
%.tmp3535 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3532, %m307$.Node.type* %.tmp3533, i8* %.tmp3534, %m1861$.AssignableInfo.type* %.tmp3535)
br label %.if.end.3531
.if.false.3531:
%.tmp3536 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3536, %m1861$.Type.type** %return_type.3248
%.tmp3537 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3248
%.tmp3538 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3539 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3538, i32 0, i32 4
%.tmp3540 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3539
%.tmp3541 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3540, i32 0, i32 3
%.tmp3542 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3541
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3537, %m1861$.Type.type* %.tmp3542)
%.tmp3543 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3544 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3543, i32 0, i32 1
%.tmp3545 = load %m0$.File.type*, %m0$.File.type** %.tmp3544
%.tmp3547 = getelementptr [14 x i8], [14 x i8]*@.str3546, i32 0, i32 0
%.tmp3548 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3549 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3248
%.tmp3550 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3548, %m1861$.Type.type* %.tmp3549)
%.tmp3551 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3247
%.tmp3552 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3551)
%.tmp3553 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3545, i8* %.tmp3547, i8* %.tmp3550, i8* %.tmp3552)
%.tmp3554 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3555 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3554, i32 0, i32 6
%.tmp3556 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3555
%.tmp3557 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3556)
%params.3558 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3557, %m307$.Node.type** %params.3558
%param_type.3559 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3559
%.tmp3561 = load %m307$.Node.type*, %m307$.Node.type** %params.3558
%param_ptr.3562 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3561, %m307$.Node.type** %param_ptr.3562
br label %.for.start.3560
.for.start.3560:
%.tmp3563 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3564 = icmp ne %m307$.Node.type* %.tmp3563, null
br i1 %.tmp3564, label %.for.continue.3560, label %.for.end.3560
.for.continue.3560:
%.tmp3565 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3566 = load %m307$.Node.type*, %m307$.Node.type** %params.3558
%.tmp3567 = icmp ne %m307$.Node.type* %.tmp3565, %.tmp3566
br i1 %.tmp3567, label %.if.true.3568, label %.if.false.3568
.if.true.3568:
%.tmp3569 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3570 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3569, i32 0, i32 7
%.tmp3571 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3570
store %m307$.Node.type* %.tmp3571, %m307$.Node.type** %param_ptr.3562
%.tmp3572 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3573 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3572, i32 0, i32 1
%.tmp3574 = load %m0$.File.type*, %m0$.File.type** %.tmp3573
%.tmp3576 = getelementptr [3 x i8], [3 x i8]*@.str3575, i32 0, i32 0
%.tmp3577 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3574, i8* %.tmp3576)
br label %.if.end.3568
.if.false.3568:
br label %.if.end.3568
.if.end.3568:
%.tmp3578 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3579 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3578, i32 0, i32 0
%.tmp3580 = load i8*, i8** %.tmp3579
%.tmp3582 = getelementptr [5 x i8], [5 x i8]*@.str3581, i32 0, i32 0
%.tmp3583 = call i32(i8*,i8*) @strcmp(i8* %.tmp3580, i8* %.tmp3582)
%.tmp3584 = icmp eq i32 %.tmp3583, 0
br i1 %.tmp3584, label %.if.true.3585, label %.if.false.3585
.if.true.3585:
%.tmp3586 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3587 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3588 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3587, i32 0, i32 6
%.tmp3589 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3588
%.tmp3590 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3586, %m307$.Node.type* %.tmp3589)
store %m1861$.Type.type* %.tmp3590, %m1861$.Type.type** %param_type.3559
%.tmp3591 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3592 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3591, i32 0, i32 7
%.tmp3593 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3592
store %m307$.Node.type* %.tmp3593, %m307$.Node.type** %param_ptr.3562
br label %.if.end.3585
.if.false.3585:
br label %.if.end.3585
.if.end.3585:
%.tmp3594 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3595 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3594, i32 0, i32 1
%.tmp3596 = load %m0$.File.type*, %m0$.File.type** %.tmp3595
%.tmp3598 = getelementptr [13 x i8], [13 x i8]*@.str3597, i32 0, i32 0
%.tmp3599 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3600 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3559
%.tmp3601 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3599, %m1861$.Type.type* %.tmp3600)
%.tmp3602 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3603 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3602, i32 0, i32 1
%.tmp3604 = load i8*, i8** %.tmp3603
%.tmp3605 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3596, i8* %.tmp3598, i8* %.tmp3601, i8* %.tmp3604)
%.tmp3606 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3562
%.tmp3607 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3606, i32 0, i32 7
%.tmp3608 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3607
store %m307$.Node.type* %.tmp3608, %m307$.Node.type** %param_ptr.3562
br label %.for.start.3560
.for.end.3560:
%.tmp3609 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3610 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3609, i32 0, i32 1
%.tmp3611 = load %m0$.File.type*, %m0$.File.type** %.tmp3610
%.tmp3613 = getelementptr [5 x i8], [5 x i8]*@.str3612, i32 0, i32 0
%.tmp3614 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3611, i8* %.tmp3613)
%.tmp3615 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3617 = getelementptr [9 x i8], [9 x i8]*@.str3616, i32 0, i32 0
%.tmp3618 = bitcast ptr null to i8*
%.tmp3619 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3615, i8* %.tmp3617, i8* %.tmp3618, i8* %.tmp3619)
%.tmp3620 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3621 = load %m307$.Node.type*, %m307$.Node.type** %params.3558
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3620, %m307$.Node.type* %.tmp3621)
%.tmp3622 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3623 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3622, i32 0, i32 6
%.tmp3624 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3623
%.tmp3626 = getelementptr [6 x i8], [6 x i8]*@.str3625, i32 0, i32 0
%.tmp3627 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3624, i8* %.tmp3626)
%fn_block.3628 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3627, %m307$.Node.type** %fn_block.3628
%.tmp3629 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3630 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3628
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3629, %m307$.Node.type* %.tmp3630)
%.tmp3631 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3631)
%.tmp3632 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3633 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3632, %m307$.Node.type** %last_valid_instruction.3633
%.tmp3634 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3628
%.tmp3635 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3634, i32 0, i32 6
%.tmp3636 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3635
%.tmp3638 = getelementptr [12 x i8], [12 x i8]*@.str3637, i32 0, i32 0
%.tmp3639 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3636, i8* %.tmp3638)
%ci.3640 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3639, %m307$.Node.type** %ci.3640
%.tmp3642 = load %m307$.Node.type*, %m307$.Node.type** %ci.3640
%.tmp3643 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3642, i32 0, i32 6
%.tmp3644 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3643
store %m307$.Node.type* %.tmp3644, %m307$.Node.type** %ci.3640
br label %.for.start.3641
.for.start.3641:
%.tmp3645 = load %m307$.Node.type*, %m307$.Node.type** %ci.3640
%.tmp3646 = icmp ne %m307$.Node.type* %.tmp3645, null
br i1 %.tmp3646, label %.for.continue.3641, label %.for.end.3641
.for.continue.3641:
%.tmp3647 = load %m307$.Node.type*, %m307$.Node.type** %ci.3640
%.tmp3648 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3647, i32 0, i32 0
%.tmp3649 = load i8*, i8** %.tmp3648
%.tmp3651 = getelementptr [3 x i8], [3 x i8]*@.str3650, i32 0, i32 0
%.tmp3652 = call i32(i8*,i8*) @strcmp(i8* %.tmp3649, i8* %.tmp3651)
%.tmp3653 = icmp ne i32 %.tmp3652, 0
%.tmp3654 = load %m307$.Node.type*, %m307$.Node.type** %ci.3640
%.tmp3655 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3654, i32 0, i32 0
%.tmp3656 = load i8*, i8** %.tmp3655
%.tmp3658 = getelementptr [9 x i8], [9 x i8]*@.str3657, i32 0, i32 0
%.tmp3659 = call i32(i8*,i8*) @strcmp(i8* %.tmp3656, i8* %.tmp3658)
%.tmp3660 = icmp ne i32 %.tmp3659, 0
%.tmp3661 = and i1 %.tmp3653, %.tmp3660
br i1 %.tmp3661, label %.if.true.3662, label %.if.false.3662
.if.true.3662:
%.tmp3663 = load %m307$.Node.type*, %m307$.Node.type** %ci.3640
store %m307$.Node.type* %.tmp3663, %m307$.Node.type** %last_valid_instruction.3633
br label %.if.end.3662
.if.false.3662:
br label %.if.end.3662
.if.end.3662:
%.tmp3664 = load %m307$.Node.type*, %m307$.Node.type** %ci.3640
%.tmp3665 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3664, i32 0, i32 7
%.tmp3666 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3665
store %m307$.Node.type* %.tmp3666, %m307$.Node.type** %ci.3640
br label %.for.start.3641
.for.end.3641:
%add_implicit_return.3667 = alloca i1
store i1 0, i1* %add_implicit_return.3667
%.tmp3668 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3633
%.tmp3669 = icmp eq %m307$.Node.type* %.tmp3668, null
br i1 %.tmp3669, label %.if.true.3670, label %.if.false.3670
.if.true.3670:
store i1 1, i1* %add_implicit_return.3667
br label %.if.end.3670
.if.false.3670:
%.tmp3671 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3633
%.tmp3672 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3671, i32 0, i32 6
%.tmp3673 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3672
%.tmp3674 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3673, i32 0, i32 0
%.tmp3675 = load i8*, i8** %.tmp3674
%.tmp3677 = getelementptr [7 x i8], [7 x i8]*@.str3676, i32 0, i32 0
%.tmp3678 = call i32(i8*,i8*) @strcmp(i8* %.tmp3675, i8* %.tmp3677)
%.tmp3679 = icmp ne i32 %.tmp3678, 0
br i1 %.tmp3679, label %.if.true.3680, label %.if.false.3680
.if.true.3680:
store i1 1, i1* %add_implicit_return.3667
br label %.if.end.3680
.if.false.3680:
br label %.if.end.3680
.if.end.3680:
br label %.if.end.3670
.if.end.3670:
%.tmp3681 = load i1, i1* %add_implicit_return.3667
br i1 %.tmp3681, label %.if.true.3682, label %.if.false.3682
.if.true.3682:
%.tmp3683 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3684 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3248
%.tmp3685 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3683, %m1861$.Type.type* %.tmp3684)
%.tmp3687 = getelementptr [5 x i8], [5 x i8]*@.str3686, i32 0, i32 0
%.tmp3688 = call i32(i8*,i8*) @strcmp(i8* %.tmp3685, i8* %.tmp3687)
%.tmp3689 = icmp ne i32 %.tmp3688, 0
br i1 %.tmp3689, label %.if.true.3690, label %.if.false.3690
.if.true.3690:
%.tmp3691 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3692 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3628
%.tmp3694 = getelementptr [21 x i8], [21 x i8]*@.str3693, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3691, %m307$.Node.type* %.tmp3692, i8* %.tmp3694)
br label %.if.end.3690
.if.false.3690:
%.tmp3695 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3696 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3695, i32 0, i32 1
%.tmp3697 = load %m0$.File.type*, %m0$.File.type** %.tmp3696
%.tmp3699 = getelementptr [10 x i8], [10 x i8]*@.str3698, i32 0, i32 0
%.tmp3700 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3697, i8* %.tmp3699)
br label %.if.end.3690
.if.end.3690:
br label %.if.end.3682
.if.false.3682:
br label %.if.end.3682
.if.end.3682:
%.tmp3701 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3702 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3701, i32 0, i32 1
%.tmp3703 = load %m0$.File.type*, %m0$.File.type** %.tmp3702
%.tmp3705 = getelementptr [3 x i8], [3 x i8]*@.str3704, i32 0, i32 0
%.tmp3706 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3703, i8* %.tmp3705)
br label %.if.end.3531
.if.end.3531:
br label %.if.end.3502
.if.false.3502:
%.tmp3707 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3708 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3707, i32 0, i32 0
%.tmp3709 = load i8*, i8** %.tmp3708
%.tmp3711 = getelementptr [7 x i8], [7 x i8]*@.str3710, i32 0, i32 0
%.tmp3712 = call i32(i8*,i8*) @strcmp(i8* %.tmp3709, i8* %.tmp3711)
%.tmp3713 = icmp eq i32 %.tmp3712, 0
br i1 %.tmp3713, label %.if.true.3714, label %.if.false.3714
.if.true.3714:
%.tmp3715 = load i1, i1* %shallow
%.tmp3716 = icmp eq i1 %.tmp3715, 1
br i1 %.tmp3716, label %.if.true.3717, label %.if.false.3717
.if.true.3717:
%.tmp3718 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3719 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3718, i32 0, i32 6
%.tmp3720 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3719
%.tmp3721 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3720, i32 0, i32 7
%.tmp3722 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3721
%.tmp3723 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3722, i32 0, i32 1
%.tmp3724 = load i8*, i8** %.tmp3723
%mod_name.3725 = alloca i8*
store i8* %.tmp3724, i8** %mod_name.3725
%.tmp3726 = load i8*, i8** %mod_name.3725
%.tmp3727 = call i32(i8*) @strlen(i8* %.tmp3726)
%mod_name_len.3728 = alloca i32
store i32 %.tmp3727, i32* %mod_name_len.3728
%.tmp3729 = load i32, i32* %mod_name_len.3728
%.tmp3730 = sub i32 %.tmp3729, 1
%.tmp3731 = call i8*(i32) @malloc(i32 %.tmp3730)
%trimmed_path.3732 = alloca i8*
store i8* %.tmp3731, i8** %trimmed_path.3732
%i.3734 = alloca i32
store i32 1, i32* %i.3734
br label %.for.start.3733
.for.start.3733:
%.tmp3735 = load i32, i32* %i.3734
%.tmp3736 = load i32, i32* %mod_name_len.3728
%.tmp3737 = sub i32 %.tmp3736, 1
%.tmp3738 = icmp slt i32 %.tmp3735, %.tmp3737
br i1 %.tmp3738, label %.for.continue.3733, label %.for.end.3733
.for.continue.3733:
%.tmp3739 = load i32, i32* %i.3734
%.tmp3740 = sub i32 %.tmp3739, 1
%.tmp3741 = load i8*, i8** %trimmed_path.3732
%.tmp3742 = getelementptr i8, i8* %.tmp3741, i32 %.tmp3740
%.tmp3743 = load i32, i32* %i.3734
%.tmp3744 = load i8*, i8** %mod_name.3725
%.tmp3745 = getelementptr i8, i8* %.tmp3744, i32 %.tmp3743
%.tmp3746 = load i8, i8* %.tmp3745
store i8 %.tmp3746, i8* %.tmp3742
%.tmp3747 = load i32, i32* %i.3734
%.tmp3748 = add i32 %.tmp3747, 1
store i32 %.tmp3748, i32* %i.3734
br label %.for.start.3733
.for.end.3733:
%.tmp3749 = load i32, i32* %mod_name_len.3728
%.tmp3750 = sub i32 %.tmp3749, 2
%.tmp3751 = load i8*, i8** %trimmed_path.3732
%.tmp3752 = getelementptr i8, i8* %.tmp3751, i32 %.tmp3750
store i8 0, i8* %.tmp3752
%.tmp3753 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3754 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3755 = load i8*, i8** %trimmed_path.3732
%.tmp3756 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3753, %m307$.Node.type* %.tmp3754, i8* %.tmp3755)
%mod_abspath.3757 = alloca i8*
store i8* %.tmp3756, i8** %mod_abspath.3757
%.tmp3758 = load i8*, i8** %mod_abspath.3757
%.tmp3759 = call i8*(i32) @malloc(i32 4096)
%.tmp3760 = call i8*(i8*,i8*) @realpath(i8* %.tmp3758, i8* %.tmp3759)
store i8* %.tmp3760, i8** %mod_abspath.3757
%.tmp3761 = load i8*, i8** %mod_abspath.3757
%.tmp3762 = icmp eq i8* %.tmp3761, null
br i1 %.tmp3762, label %.if.true.3763, label %.if.false.3763
.if.true.3763:
%.tmp3764 = getelementptr i8*, i8** %err_buf.3249, i32 0
%.tmp3766 = getelementptr [54 x i8], [54 x i8]*@.str3765, i32 0, i32 0
%.tmp3767 = load i8*, i8** %mod_name.3725
%.tmp3768 = load i8*, i8** %trimmed_path.3732
%.tmp3769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3764, i8* %.tmp3766, i8* %.tmp3767, i8* %.tmp3768)
%.tmp3770 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3771 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3772 = load i8*, i8** %err_buf.3249
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3770, %m307$.Node.type* %.tmp3771, i8* %.tmp3772)
ret void
br label %.if.end.3763
.if.false.3763:
br label %.if.end.3763
.if.end.3763:
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
%.tmp3785 = load i8*, i8** %mod_abspath.3757
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
%.tmp3816 = load i8*, i8** %mod_abspath.3757
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
br label %.if.end.3717
.if.false.3717:
br label %.if.end.3717
.if.end.3717:
br label %.if.end.3714
.if.false.3714:
%.tmp3873 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3874 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3876 = getelementptr [40 x i8], [40 x i8]*@.str3875, i32 0, i32 0
%.tmp3877 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3873, %m307$.Node.type* %.tmp3874, i8* %.tmp3876)
%.tmp3878 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3879 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3878, i32 0, i32 0
%.tmp3880 = load i8*, i8** %.tmp3879
%.tmp3881 = call i32(i8*,...) @printf(i8* %.tmp3877, i8* %.tmp3880)
br label %.if.end.3714
.if.end.3714:
br label %.if.end.3502
.if.end.3502:
br label %.if.end.3431
.if.end.3431:
br label %.if.end.3332
.if.end.3332:
br label %.if.end.3266
.if.end.3266:
br label %.if.end.3258
.if.end.3258:
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
%.tmp3915 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3914, i32 0, i32 3
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
%.tmp3935 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3934, i32 0, i32 4
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
%.tmp3946 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3945, i32 0, i32 4
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
%.tmp3960 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3961 = load i8*, i8** %var_name.3940
%.tmp3962 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3959, %m307$.Node.type* %.tmp3960, i8* %.tmp3961, %m1861$.AssignableInfo.type* %.tmp3962)
%.tmp3963 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3964 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3963, i32 0, i32 1
%.tmp3965 = load %m0$.File.type*, %m0$.File.type** %.tmp3964
%.tmp3967 = getelementptr [28 x i8], [28 x i8]*@.str3966, i32 0, i32 0
%.tmp3968 = load i8*, i8** %param_info_tr.3949
%.tmp3969 = load i8*, i8** %var_name.3940
%.tmp3970 = load i8*, i8** %param_info_tr.3949
%.tmp3971 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3913
%.tmp3972 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3971)
%.tmp3973 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3965, i8* %.tmp3967, i8* %.tmp3968, i8* %.tmp3969, i8* %.tmp3970, i8* %.tmp3972)
%.tmp3974 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3901
%.tmp3975 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3974, i32 0, i32 7
%.tmp3976 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3975
store %m307$.Node.type* %.tmp3976, %m307$.Node.type** %param_ptr.3901
br label %.for.start.3899
.for.end.3899:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3977 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3979 = getelementptr [6 x i8], [6 x i8]*@.str3978, i32 0, i32 0
%.tmp3980 = bitcast ptr null to i8*
%.tmp3981 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3977, i8* %.tmp3979, i8* %.tmp3980, i8* %.tmp3981)
%.tmp3982 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3983 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3982, i32 0, i32 6
%.tmp3984 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3983
%.tmp3986 = getelementptr [12 x i8], [12 x i8]*@.str3985, i32 0, i32 0
%.tmp3987 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3984, i8* %.tmp3986)
%exprs.3988 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3987, %m307$.Node.type** %exprs.3988
%.tmp3989 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3988
%.tmp3990 = icmp ne %m307$.Node.type* %.tmp3989, null
br i1 %.tmp3990, label %.if.true.3991, label %.if.false.3991
.if.true.3991:
%.tmp3993 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3988
%.tmp3994 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3993, i32 0, i32 6
%.tmp3995 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3994
%b.3996 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3995, %m307$.Node.type** %b.3996
br label %.for.start.3992
.for.start.3992:
%.tmp3997 = load %m307$.Node.type*, %m307$.Node.type** %b.3996
%.tmp3998 = icmp ne %m307$.Node.type* %.tmp3997, null
br i1 %.tmp3998, label %.for.continue.3992, label %.for.end.3992
.for.continue.3992:
%.tmp3999 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4000 = load %m307$.Node.type*, %m307$.Node.type** %b.3996
%.tmp4001 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4000, i32 0, i32 6
%.tmp4002 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4001
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3999, %m307$.Node.type* %.tmp4002)
%.tmp4003 = load %m307$.Node.type*, %m307$.Node.type** %b.3996
%.tmp4004 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4003, i32 0, i32 7
%.tmp4005 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4004
store %m307$.Node.type* %.tmp4005, %m307$.Node.type** %b.3996
br label %.for.start.3992
.for.end.3992:
br label %.if.end.3991
.if.false.3991:
br label %.if.end.3991
.if.end.3991:
%.tmp4006 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4006)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4007 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4008 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4009 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4007, %m307$.Node.type* %.tmp4008)
%val.4010 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4009, %m1861$.AssignableInfo.type** %val.4010
%.tmp4011 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4010
%.tmp4012 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4011, i32 0, i32 4
%.tmp4013 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4012
%.tmp4014 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4013, i32 0, i32 0
%.tmp4015 = load i8*, i8** %.tmp4014
%.tmp4017 = getelementptr [7 x i8], [7 x i8]*@.str4016, i32 0, i32 0
%.tmp4018 = call i32(i8*,i8*) @strcmp(i8* %.tmp4015, i8* %.tmp4017)
%.tmp4019 = icmp ne i32 %.tmp4018, 0
br i1 %.tmp4019, label %.if.true.4020, label %.if.false.4020
.if.true.4020:
%.tmp4022 = getelementptr [7 x i8], [7 x i8]*@.str4021, i32 0, i32 0
%.tmp4023 = call i32(i8*,...) @printf(i8* %.tmp4022)
%.tmp4024 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4024
br label %.if.end.4020
.if.false.4020:
br label %.if.end.4020
.if.end.4020:
%.tmp4025 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4010
%.tmp4026 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4025, i32 0, i32 4
%.tmp4027 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4026
%.tmp4028 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4027, i32 0, i32 3
%.tmp4029 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4028
%node_type.4030 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4029, %m1861$.Type.type** %node_type.4030
%i.4032 = alloca i32
store i32 0, i32* %i.4032
br label %.for.start.4031
.for.start.4031:
%.tmp4033 = load i32, i32* %i.4032
%.tmp4034 = load i32, i32* %attr_id
%.tmp4035 = icmp slt i32 %.tmp4033, %.tmp4034
br i1 %.tmp4035, label %.for.continue.4031, label %.for.end.4031
.for.continue.4031:
%.tmp4036 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4030
%.tmp4037 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4036, i32 0, i32 4
%.tmp4038 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4037
store %m1861$.Type.type* %.tmp4038, %m1861$.Type.type** %node_type.4030
%.tmp4039 = load i32, i32* %i.4032
%.tmp4040 = add i32 %.tmp4039, 1
store i32 %.tmp4040, i32* %i.4032
br label %.for.start.4031
.for.end.4031:
%.tmp4041 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4042 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4041)
%info.4043 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4042, %m1861$.AssignableInfo.type** %info.4043
%.tmp4044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4043
%.tmp4045 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4044, i32 0, i32 4
%.tmp4046 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4030
store %m1861$.Type.type* %.tmp4046, %m1861$.Type.type** %.tmp4045
%.tmp4047 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4048 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4047)
%tmp_id.4049 = alloca i32
store i32 %.tmp4048, i32* %tmp_id.4049
%.tmp4050 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4051 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4010
%.tmp4052 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4051, i32 0, i32 4
%.tmp4053 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4052
%.tmp4054 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4050, %m1861$.Type.type* %.tmp4053)
%type_as_str.4055 = alloca i8*
store i8* %.tmp4054, i8** %type_as_str.4055
%.tmp4056 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4043
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4056, %m1861$.AssignableInfo.type* %.tmp4057)
%.tmp4058 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4059 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4058, i32 0, i32 1
%.tmp4060 = load %m0$.File.type*, %m0$.File.type** %.tmp4059
%.tmp4062 = getelementptr [52 x i8], [52 x i8]*@.str4061, i32 0, i32 0
%.tmp4063 = load i32, i32* %tmp_id.4049
%.tmp4064 = load i8*, i8** %type_as_str.4055
%.tmp4065 = load i8*, i8** %type_as_str.4055
%.tmp4066 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4010
%.tmp4067 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4066)
%.tmp4068 = load i32, i32* %attr_id
%.tmp4069 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4060, i8* %.tmp4062, i32 %.tmp4063, i8* %.tmp4064, i8* %.tmp4065, i8* %.tmp4067, i32 %.tmp4068)
%.tmp4070 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4071 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4070, i32 0, i32 1
%.tmp4072 = load %m0$.File.type*, %m0$.File.type** %.tmp4071
%.tmp4074 = getelementptr [28 x i8], [28 x i8]*@.str4073, i32 0, i32 0
%.tmp4075 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4043
%.tmp4076 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4075)
%.tmp4077 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4078 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4043
%.tmp4079 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4078, i32 0, i32 4
%.tmp4080 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4079
%.tmp4081 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4077, %m1861$.Type.type* %.tmp4080)
%.tmp4082 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4083 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4043
%.tmp4084 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4083, i32 0, i32 4
%.tmp4085 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4084
%.tmp4086 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4082, %m1861$.Type.type* %.tmp4085)
%.tmp4087 = load i32, i32* %tmp_id.4049
%.tmp4088 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4072, i8* %.tmp4074, i8* %.tmp4076, i8* %.tmp4081, i8* %.tmp4086, i32 %.tmp4087)
%.tmp4089 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4043
ret %m1861$.AssignableInfo.type* %.tmp4089
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
%.tmp4090 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4091 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4092 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4090, %m307$.Node.type* %.tmp4091)
%val.4093 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4092, %m1861$.AssignableInfo.type** %val.4093
%.tmp4094 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4093
%.tmp4095 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4094, i32 0, i32 4
%.tmp4096 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4095
%.tmp4097 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4096, i32 0, i32 0
%.tmp4098 = load i8*, i8** %.tmp4097
%.tmp4100 = getelementptr [7 x i8], [7 x i8]*@.str4099, i32 0, i32 0
%.tmp4101 = call i32(i8*,i8*) @strcmp(i8* %.tmp4098, i8* %.tmp4100)
%.tmp4102 = icmp ne i32 %.tmp4101, 0
br i1 %.tmp4102, label %.if.true.4103, label %.if.false.4103
.if.true.4103:
%.tmp4105 = getelementptr [7 x i8], [7 x i8]*@.str4104, i32 0, i32 0
%.tmp4106 = call i32(i8*,...) @printf(i8* %.tmp4105)
ret void
br label %.if.end.4103
.if.false.4103:
br label %.if.end.4103
.if.end.4103:
%.tmp4107 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4093
%.tmp4108 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4107, i32 0, i32 4
%.tmp4109 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4108
%.tmp4110 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4109, i32 0, i32 3
%.tmp4111 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4110
%node_type.4112 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4111, %m1861$.Type.type** %node_type.4112
%i.4114 = alloca i32
store i32 0, i32* %i.4114
br label %.for.start.4113
.for.start.4113:
%.tmp4115 = load i32, i32* %i.4114
%.tmp4116 = load i32, i32* %attr_id
%.tmp4117 = icmp slt i32 %.tmp4115, %.tmp4116
br i1 %.tmp4117, label %.for.continue.4113, label %.for.end.4113
.for.continue.4113:
%.tmp4118 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4112
%.tmp4119 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4118, i32 0, i32 4
%.tmp4120 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4119
store %m1861$.Type.type* %.tmp4120, %m1861$.Type.type** %node_type.4112
%.tmp4121 = load i32, i32* %i.4114
%.tmp4122 = add i32 %.tmp4121, 1
store i32 %.tmp4122, i32* %i.4114
br label %.for.start.4113
.for.end.4113:
%.tmp4123 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4124 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4123)
%tmp_id.4125 = alloca i32
store i32 %.tmp4124, i32* %tmp_id.4125
%.tmp4126 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4127 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4093
%.tmp4128 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4127, i32 0, i32 4
%.tmp4129 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4128
%.tmp4130 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4126, %m1861$.Type.type* %.tmp4129)
%type_as_str.4131 = alloca i8*
store i8* %.tmp4130, i8** %type_as_str.4131
%.tmp4132 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4133 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4132, i32 0, i32 1
%.tmp4134 = load %m0$.File.type*, %m0$.File.type** %.tmp4133
%.tmp4136 = getelementptr [52 x i8], [52 x i8]*@.str4135, i32 0, i32 0
%.tmp4137 = load i32, i32* %tmp_id.4125
%.tmp4138 = load i8*, i8** %type_as_str.4131
%.tmp4139 = load i8*, i8** %type_as_str.4131
%.tmp4140 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4093
%.tmp4141 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4140)
%.tmp4142 = load i32, i32* %attr_id
%.tmp4143 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4134, i8* %.tmp4136, i32 %.tmp4137, i8* %.tmp4138, i8* %.tmp4139, i8* %.tmp4141, i32 %.tmp4142)
%.tmp4144 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4145 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4144, i32 0, i32 1
%.tmp4146 = load %m0$.File.type*, %m0$.File.type** %.tmp4145
%.tmp4148 = getelementptr [18 x i8], [18 x i8]*@.str4147, i32 0, i32 0
%.tmp4149 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4150 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4112
%.tmp4151 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4149, %m1861$.Type.type* %.tmp4150)
%.tmp4152 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4153 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4112
%.tmp4154 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4152, %m1861$.Type.type* %.tmp4153)
%.tmp4155 = load i8*, i8** %attr
%.tmp4156 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4146, i8* %.tmp4148, i8* %.tmp4151, i8* %.tmp4154, i8* %.tmp4155)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4157 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4158 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4157, i32 0, i32 6
%.tmp4159 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4158
%.tmp4160 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4159, i32 0, i32 6
%.tmp4161 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4160
%dotted.4162 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4161, %m307$.Node.type** %dotted.4162
%.tmp4163 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4162
%.tmp4164 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4163, i32 0, i32 7
%.tmp4165 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4164
%.tmp4166 = icmp ne %m307$.Node.type* %.tmp4165, null
br i1 %.tmp4166, label %.if.true.4167, label %.if.false.4167
.if.true.4167:
%.tmp4168 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4168
br label %.if.end.4167
.if.false.4167:
br label %.if.end.4167
.if.end.4167:
%.tmp4169 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4162
%.tmp4170 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4169, i32 0, i32 1
%.tmp4171 = load i8*, i8** %.tmp4170
%.tmp4173 = getelementptr [7 x i8], [7 x i8]*@.str4172, i32 0, i32 0
%.tmp4174 = call i32(i8*,i8*) @strcmp(i8* %.tmp4171, i8* %.tmp4173)
%.tmp4175 = icmp eq i32 %.tmp4174, 0
br i1 %.tmp4175, label %.if.true.4176, label %.if.false.4176
.if.true.4176:
%.tmp4177 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4179 = getelementptr [8 x i8], [8 x i8]*@.str4178, i32 0, i32 0
%.tmp4180 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4177, i8* %.tmp4179)
%args.4181 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4180, %m307$.Node.type** %args.4181
%.tmp4182 = load %m307$.Node.type*, %m307$.Node.type** %args.4181
%.tmp4183 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4182, i32 0, i32 6
%.tmp4184 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4183
%.tmp4186 = getelementptr [11 x i8], [11 x i8]*@.str4185, i32 0, i32 0
%.tmp4187 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4184, i8* %.tmp4186)
%value.4188 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4187, %m307$.Node.type** %value.4188
%.tmp4189 = load %m307$.Node.type*, %m307$.Node.type** %value.4188
%.tmp4190 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4189, i32 0, i32 6
%.tmp4191 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4190
%.tmp4192 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4191, i32 0, i32 6
%.tmp4193 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4192
%.tmp4194 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4193, i32 0, i32 6
%.tmp4195 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4194
%.tmp4196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4195, i32 0, i32 6
%.tmp4197 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4196
store %m307$.Node.type* %.tmp4197, %m307$.Node.type** %value.4188
%.tmp4198 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4199 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4198)
%tmp_id.4200 = alloca i32
store i32 %.tmp4199, i32* %tmp_id.4200
%.tmp4201 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4202 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4201)
%info.4203 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4202, %m1861$.AssignableInfo.type** %info.4203
%.tmp4204 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4205 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4203
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4204, %m1861$.AssignableInfo.type* %.tmp4205)
%.tmp4206 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4203
%.tmp4207 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4206, i32 0, i32 4
%.tmp4208 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4208, %m1861$.Type.type** %.tmp4207
%.tmp4209 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4203
%.tmp4210 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4209, i32 0, i32 4
%.tmp4211 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4210
%.tmp4212 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4211, i32 0, i32 0
%.tmp4214 = getelementptr [4 x i8], [4 x i8]*@.str4213, i32 0, i32 0
store i8* %.tmp4214, i8** %.tmp4212
%.tmp4215 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4216 = load %m307$.Node.type*, %m307$.Node.type** %value.4188
%.tmp4217 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4215, %m307$.Node.type* %.tmp4216)
%inspected_type.4218 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4217, %m1861$.Type.type** %inspected_type.4218
%.tmp4219 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4220 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4218
%.tmp4221 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4219, %m1861$.Type.type* %.tmp4220)
%type_as_str.4222 = alloca i8*
store i8* %.tmp4221, i8** %type_as_str.4222
%.tmp4223 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4224 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4223, i32 0, i32 1
%.tmp4225 = load %m0$.File.type*, %m0$.File.type** %.tmp4224
%.tmp4227 = getelementptr [46 x i8], [46 x i8]*@.str4226, i32 0, i32 0
%.tmp4228 = load i32, i32* %tmp_id.4200
%.tmp4229 = load i8*, i8** %type_as_str.4222
%.tmp4230 = load i8*, i8** %type_as_str.4222
%.tmp4231 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4225, i8* %.tmp4227, i32 %.tmp4228, i8* %.tmp4229, i8* %.tmp4230)
%.tmp4232 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4233 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4232, i32 0, i32 1
%.tmp4234 = load %m0$.File.type*, %m0$.File.type** %.tmp4233
%.tmp4236 = getelementptr [35 x i8], [35 x i8]*@.str4235, i32 0, i32 0
%.tmp4237 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4203
%.tmp4238 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4237)
%.tmp4239 = load i8*, i8** %type_as_str.4222
%.tmp4240 = load i32, i32* %tmp_id.4200
%.tmp4241 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4234, i8* %.tmp4236, i8* %.tmp4238, i8* %.tmp4239, i32 %.tmp4240)
%.tmp4242 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4203
ret %m1861$.AssignableInfo.type* %.tmp4242
br label %.if.end.4176
.if.false.4176:
%.tmp4243 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4162
%.tmp4244 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4243, i32 0, i32 1
%.tmp4245 = load i8*, i8** %.tmp4244
%.tmp4247 = getelementptr [7 x i8], [7 x i8]*@.str4246, i32 0, i32 0
%.tmp4248 = call i32(i8*,i8*) @strcmp(i8* %.tmp4245, i8* %.tmp4247)
%.tmp4249 = icmp eq i32 %.tmp4248, 0
br i1 %.tmp4249, label %.if.true.4250, label %.if.false.4250
.if.true.4250:
%.tmp4251 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4253 = getelementptr [8 x i8], [8 x i8]*@.str4252, i32 0, i32 0
%.tmp4254 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4251, i8* %.tmp4253)
%args.4255 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4254, %m307$.Node.type** %args.4255
%.tmp4256 = load %m307$.Node.type*, %m307$.Node.type** %args.4255
%.tmp4257 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4256, i32 0, i32 6
%.tmp4258 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4257
%.tmp4260 = getelementptr [11 x i8], [11 x i8]*@.str4259, i32 0, i32 0
%.tmp4261 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4258, i8* %.tmp4260)
%array.4262 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4261, %m307$.Node.type** %array.4262
%.tmp4263 = load %m307$.Node.type*, %m307$.Node.type** %array.4262
%.tmp4264 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4263, i32 0, i32 7
%.tmp4265 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4264
%.tmp4267 = getelementptr [11 x i8], [11 x i8]*@.str4266, i32 0, i32 0
%.tmp4268 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4265, i8* %.tmp4267)
%value.4269 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4268, %m307$.Node.type** %value.4269
%.tmp4270 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4271 = load %m307$.Node.type*, %m307$.Node.type** %value.4269
%.tmp4272 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4270, %m307$.Node.type* %.tmp4271)
%value_info.4273 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4272, %m1861$.AssignableInfo.type** %value_info.4273
%.tmp4274 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4275 = load %m307$.Node.type*, %m307$.Node.type** %array.4262
%.tmp4276 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4274, %m307$.Node.type* %.tmp4275)
%array_info.4277 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4276, %m1861$.AssignableInfo.type** %array_info.4277
%.tmp4278 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4279 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4278)
%info.4280 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4279, %m1861$.AssignableInfo.type** %info.4280
%.tmp4281 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4282 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4280
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4281, %m1861$.AssignableInfo.type* %.tmp4282)
%.tmp4283 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4280
%.tmp4284 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4283, i32 0, i32 4
%.tmp4285 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4277
%.tmp4286 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4285, i32 0, i32 4
%.tmp4287 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4286
store %m1861$.Type.type* %.tmp4287, %m1861$.Type.type** %.tmp4284
%builtin_prefix.4288 = alloca i8*
store i8* null, i8** %builtin_prefix.4288
%.tmp4289 = getelementptr i8*, i8** %builtin_prefix.4288, i32 0
%.tmp4291 = getelementptr [5 x i8], [5 x i8]*@.str4290, i32 0, i32 0
%.tmp4292 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4293 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4292)
%.tmp4294 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4289, i8* %.tmp4291, i32 %.tmp4293)
%.tmp4295 = call i8*() @m2540$append_tmpl.cp()
%tmpl.4296 = alloca i8*
store i8* %.tmp4295, i8** %tmpl.4296
%.tmp4297 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4298 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4297, i32 0, i32 1
%.tmp4299 = load %m0$.File.type*, %m0$.File.type** %.tmp4298
%.tmp4300 = load i8*, i8** %tmpl.4296
%.tmp4301 = load i8*, i8** %builtin_prefix.4288
%.tmp4302 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4303 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4277
%.tmp4304 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4303, i32 0, i32 4
%.tmp4305 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4304
%.tmp4306 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4302, %m1861$.Type.type* %.tmp4305)
%.tmp4307 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4277
%.tmp4308 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4307)
%.tmp4309 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4310 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4273
%.tmp4311 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4310, i32 0, i32 4
%.tmp4312 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4311
%.tmp4313 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4309, %m1861$.Type.type* %.tmp4312)
%.tmp4314 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4273
%.tmp4315 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4314)
%.tmp4316 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4280
%.tmp4317 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4316)
%.tmp4318 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4299, i8* %.tmp4300, i8* %.tmp4301, i8* %.tmp4306, i8* %.tmp4308, i8* %.tmp4313, i8* %.tmp4315, i8* %.tmp4317)
%.tmp4319 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4320 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4319)
%info_g.4321 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4320, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4322 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4323 = load i8, i8* @SCOPE_GLOBAL
%.tmp4325 = getelementptr [8 x i8], [8 x i8]*@.str4324, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp4322, i8 %.tmp4323, i8* %.tmp4325)
%.tmp4326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4327 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4326, i32 0, i32 4
%.tmp4328 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4328, %m1861$.Type.type** %.tmp4327
%.tmp4329 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4330 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4329, i32 0, i32 4
%.tmp4331 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4330
%.tmp4332 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4331, i32 0, i32 0
%.tmp4334 = getelementptr [9 x i8], [9 x i8]*@.str4333, i32 0, i32 0
store i8* %.tmp4334, i8** %.tmp4332
%.tmp4335 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4336 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4335, i32 0, i32 4
%.tmp4337 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4336
%.tmp4338 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4337, i32 0, i32 3
%.tmp4339 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4339, %m1861$.Type.type** %.tmp4338
%.tmp4340 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4341 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4340, i32 0, i32 4
%.tmp4342 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4341
%.tmp4343 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4342, i32 0, i32 3
%.tmp4344 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4343
%.tmp4345 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4344, i32 0, i32 0
%.tmp4347 = getelementptr [4 x i8], [4 x i8]*@.str4346, i32 0, i32 0
store i8* %.tmp4347, i8** %.tmp4345
%.tmp4348 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4349 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4348, i32 0, i32 4
%.tmp4350 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4349
%.tmp4351 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4350, i32 0, i32 3
%.tmp4352 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4351
%.tmp4353 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4352, i32 0, i32 3
%.tmp4354 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4354, %m1861$.Type.type** %.tmp4353
%.tmp4355 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4356 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4355, i32 0, i32 4
%.tmp4357 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4356
%.tmp4358 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4357, i32 0, i32 3
%.tmp4359 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4358
%.tmp4360 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4359, i32 0, i32 3
%.tmp4361 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4360
%.tmp4362 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4361, i32 0, i32 0
%.tmp4364 = getelementptr [4 x i8], [4 x i8]*@.str4363, i32 0, i32 0
store i8* %.tmp4364, i8** %.tmp4362
%.tmp4365 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4366 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4365, i32 0, i32 4
%.tmp4367 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4366
%.tmp4368 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4367, i32 0, i32 3
%.tmp4369 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4368
%.tmp4370 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4369, i32 0, i32 4
%.tmp4371 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4371, %m1861$.Type.type** %.tmp4370
%.tmp4372 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4373 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4372, i32 0, i32 4
%.tmp4374 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4373
%.tmp4375 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4374, i32 0, i32 3
%.tmp4376 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4375
%.tmp4377 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4376, i32 0, i32 4
%.tmp4378 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4377
%.tmp4379 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4378, i32 0, i32 0
%.tmp4381 = getelementptr [4 x i8], [4 x i8]*@.str4380, i32 0, i32 0
store i8* %.tmp4381, i8** %.tmp4379
%.tmp4382 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4383 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4382, i32 0, i32 4
%.tmp4384 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4383
%.tmp4385 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4384, i32 0, i32 3
%.tmp4386 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4385
%.tmp4387 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4386, i32 0, i32 4
%.tmp4388 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4387
%.tmp4389 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4388, i32 0, i32 3
%.tmp4390 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4390, %m1861$.Type.type** %.tmp4389
%.tmp4391 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4392 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4391, i32 0, i32 4
%.tmp4393 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4392
%.tmp4394 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4393, i32 0, i32 3
%.tmp4395 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4394
%.tmp4396 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4395, i32 0, i32 4
%.tmp4397 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4396
%.tmp4398 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4397, i32 0, i32 3
%.tmp4399 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4398
%.tmp4400 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4399, i32 0, i32 0
%.tmp4402 = getelementptr [4 x i8], [4 x i8]*@.str4401, i32 0, i32 0
store i8* %.tmp4402, i8** %.tmp4400
%.tmp4403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4404 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4403, i32 0, i32 4
%.tmp4405 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4404
%.tmp4406 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4405, i32 0, i32 3
%.tmp4407 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4406
%.tmp4408 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4407, i32 0, i32 4
%.tmp4409 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4408
%.tmp4410 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4409, i32 0, i32 4
%.tmp4411 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4411, %m1861$.Type.type** %.tmp4410
%.tmp4412 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
%.tmp4413 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4412, i32 0, i32 4
%.tmp4414 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4413
%.tmp4415 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4414, i32 0, i32 3
%.tmp4416 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4415
%.tmp4417 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4416, i32 0, i32 4
%.tmp4418 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4417
%.tmp4419 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4418, i32 0, i32 4
%.tmp4420 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4419
%.tmp4421 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4420, i32 0, i32 0
%.tmp4423 = getelementptr [4 x i8], [4 x i8]*@.str4422, i32 0, i32 0
store i8* %.tmp4423, i8** %.tmp4421
%.tmp4424 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4426 = getelementptr [8 x i8], [8 x i8]*@.str4425, i32 0, i32 0
%.tmp4428 = getelementptr [7 x i8], [7 x i8]*@.str4427, i32 0, i32 0
%.tmp4429 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4321
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp4424, i8* %.tmp4426, i8* %.tmp4428, %m1861$.AssignableInfo.type* %.tmp4429, i1 1, i1 0)
%.tmp4430 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4280
ret %m1861$.AssignableInfo.type* %.tmp4430
br label %.if.end.4250
.if.false.4250:
%.tmp4431 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4162
%.tmp4432 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4431, i32 0, i32 1
%.tmp4433 = load i8*, i8** %.tmp4432
%.tmp4435 = getelementptr [4 x i8], [4 x i8]*@.str4434, i32 0, i32 0
%.tmp4436 = call i32(i8*,i8*) @strcmp(i8* %.tmp4433, i8* %.tmp4435)
%.tmp4437 = icmp eq i32 %.tmp4436, 0
br i1 %.tmp4437, label %.if.true.4438, label %.if.false.4438
.if.true.4438:
%.tmp4439 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4441 = getelementptr [8 x i8], [8 x i8]*@.str4440, i32 0, i32 0
%.tmp4442 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4439, i8* %.tmp4441)
%args.4443 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4442, %m307$.Node.type** %args.4443
%.tmp4444 = load %m307$.Node.type*, %m307$.Node.type** %args.4443
%.tmp4445 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4444, i32 0, i32 6
%.tmp4446 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4445
%.tmp4448 = getelementptr [11 x i8], [11 x i8]*@.str4447, i32 0, i32 0
%.tmp4449 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4446, i8* %.tmp4448)
%value.4450 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4449, %m307$.Node.type** %value.4450
%.tmp4451 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4452 = load %m307$.Node.type*, %m307$.Node.type** %value.4450
%.tmp4453 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i32) @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.tmp4451, %m307$.Node.type* %.tmp4452, i32 1)
ret %m1861$.AssignableInfo.type* %.tmp4453
br label %.if.end.4438
.if.false.4438:
br label %.if.end.4438
.if.end.4438:
br label %.if.end.4250
.if.end.4250:
br label %.if.end.4176
.if.end.4176:
%.tmp4454 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4454
}
define i8* @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4456 = getelementptr [1 x i8], [1 x i8]*@.str4455, i32 0, i32 0
%err_buf.4457 = alloca i8*
store i8* %.tmp4456, i8** %err_buf.4457
%.tmp4458 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4459 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4458, i32 0, i32 7
%.tmp4460 = load i8*, i8** %.tmp4459
%mod_abspath.4461 = alloca i8*
store i8* %.tmp4460, i8** %mod_abspath.4461
%.tmp4462 = load i8*, i8** %mod_abspath.4461
%.tmp4463 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4462)
%dirname.4464 = alloca i8*
store i8* %.tmp4463, i8** %dirname.4464
%.tmp4465 = load i8*, i8** %import_str
%.tmp4466 = getelementptr i8, i8* %.tmp4465, i32 0
%.tmp4467 = load i8, i8* %.tmp4466
%.tmp4468 = icmp eq i8 %.tmp4467, 47
br i1 %.tmp4468, label %.if.true.4469, label %.if.false.4469
.if.true.4469:
%.tmp4470 = getelementptr i8*, i8** %err_buf.4457, i32 0
%.tmp4472 = getelementptr [46 x i8], [46 x i8]*@.str4471, i32 0, i32 0
%.tmp4473 = load i8*, i8** %import_str
%.tmp4474 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4470, i8* %.tmp4472, i8* %.tmp4473)
%.tmp4475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4476 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4477 = load i8*, i8** %err_buf.4457
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4475, %m307$.Node.type* %.tmp4476, i8* %.tmp4477)
%.tmp4478 = bitcast ptr null to i8*
ret i8* %.tmp4478
br label %.if.end.4469
.if.false.4469:
br label %.if.end.4469
.if.end.4469:
%.tmp4479 = load i8*, i8** %import_str
%.tmp4480 = getelementptr i8, i8* %.tmp4479, i32 0
%.tmp4481 = load i8, i8* %.tmp4480
%.tmp4482 = icmp ne i8 %.tmp4481, 46
%.tmp4483 = load i8*, i8** %import_str
%.tmp4484 = getelementptr i8, i8* %.tmp4483, i32 1
%.tmp4485 = load i8, i8* %.tmp4484
%.tmp4486 = icmp ne i8 %.tmp4485, 47
%.tmp4487 = and i1 %.tmp4482, %.tmp4486
br i1 %.tmp4487, label %.if.true.4488, label %.if.false.4488
.if.true.4488:
%.tmp4489 = call i8*() @m1861$get_root.cp()
%root.4490 = alloca i8*
store i8* %.tmp4489, i8** %root.4490
%.tmp4491 = getelementptr i8*, i8** %mod_abspath.4461, i32 0
%.tmp4493 = getelementptr [13 x i8], [13 x i8]*@.str4492, i32 0, i32 0
%.tmp4494 = load i8*, i8** %root.4490
%.tmp4495 = load i8*, i8** %import_str
%.tmp4496 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4491, i8* %.tmp4493, i8* %.tmp4494, i8* %.tmp4495)
br label %.if.end.4488
.if.false.4488:
%.tmp4497 = load i8*, i8** %dirname.4464
%.tmp4499 = getelementptr [1 x i8], [1 x i8]*@.str4498, i32 0, i32 0
%.tmp4500 = call i32(i8*,i8*) @strcmp(i8* %.tmp4497, i8* %.tmp4499)
%.tmp4501 = icmp eq i32 %.tmp4500, 0
br i1 %.tmp4501, label %.if.true.4502, label %.if.false.4502
.if.true.4502:
%.tmp4503 = getelementptr i8*, i8** %mod_abspath.4461, i32 0
%.tmp4505 = getelementptr [6 x i8], [6 x i8]*@.str4504, i32 0, i32 0
%.tmp4506 = load i8*, i8** %import_str
%.tmp4507 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4503, i8* %.tmp4505, i8* %.tmp4506)
br label %.if.end.4502
.if.false.4502:
%.tmp4508 = getelementptr i8*, i8** %mod_abspath.4461, i32 0
%.tmp4510 = getelementptr [9 x i8], [9 x i8]*@.str4509, i32 0, i32 0
%.tmp4511 = load i8*, i8** %dirname.4464
%.tmp4512 = load i8*, i8** %import_str
%.tmp4513 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4508, i8* %.tmp4510, i8* %.tmp4511, i8* %.tmp4512)
br label %.if.end.4502
.if.end.4502:
br label %.if.end.4488
.if.end.4488:
%.tmp4514 = load i8*, i8** %mod_abspath.4461
ret i8* %.tmp4514
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4515 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4516 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4517 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4515, %m307$.Node.type* %.tmp4516)
%info.4518 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4517, %m1861$.AssignableInfo.type** %info.4518
%.tmp4519 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4520 = icmp ne %m1861$.AssignableInfo.type* %.tmp4519, null
br i1 %.tmp4520, label %.if.true.4521, label %.if.false.4521
.if.true.4521:
%.tmp4522 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
ret %m1861$.AssignableInfo.type* %.tmp4522
br label %.if.end.4521
.if.false.4521:
br label %.if.end.4521
.if.end.4521:
%.tmp4523 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4524 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4525 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4523, %m307$.Node.type* %.tmp4524)
store %m1861$.AssignableInfo.type* %.tmp4525, %m1861$.AssignableInfo.type** %info.4518
%.tmp4526 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4527 = icmp eq %m1861$.AssignableInfo.type* %.tmp4526, null
br i1 %.tmp4527, label %.if.true.4528, label %.if.false.4528
.if.true.4528:
%.tmp4529 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4529, label %.if.true.4530, label %.if.false.4530
.if.true.4530:
%.tmp4531 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4532 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4534 = getelementptr [35 x i8], [35 x i8]*@.str4533, i32 0, i32 0
%.tmp4535 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4531, %m307$.Node.type* %.tmp4532, i8* %.tmp4534)
%.tmp4536 = call i32(i8*,...) @printf(i8* %.tmp4535)
br label %.if.end.4530
.if.false.4530:
br label %.if.end.4530
.if.end.4530:
%.tmp4537 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4537
br label %.if.end.4528
.if.false.4528:
br label %.if.end.4528
.if.end.4528:
%.tmp4538 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4540 = getelementptr [8 x i8], [8 x i8]*@.str4539, i32 0, i32 0
%.tmp4541 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4538, i8* %.tmp4540)
%args.4542 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4541, %m307$.Node.type** %args.4542
%.tmp4544 = getelementptr [1 x i8], [1 x i8]*@.str4543, i32 0, i32 0
%params_buff.4545 = alloca i8*
store i8* %.tmp4544, i8** %params_buff.4545
%tmp.4546 = alloca i8*
store i8* null, i8** %tmp.4546
%.tmp4547 = load %m307$.Node.type*, %m307$.Node.type** %args.4542
%.tmp4548 = icmp ne %m307$.Node.type* %.tmp4547, null
br i1 %.tmp4548, label %.if.true.4549, label %.if.false.4549
.if.true.4549:
%.tmp4550 = load %m307$.Node.type*, %m307$.Node.type** %args.4542
%.tmp4551 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4550, i32 0, i32 6
%.tmp4552 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4551
%.tmp4554 = getelementptr [11 x i8], [11 x i8]*@.str4553, i32 0, i32 0
%.tmp4555 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4552, i8* %.tmp4554)
%start.4556 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4555, %m307$.Node.type** %start.4556
%argno.4557 = alloca i32
store i32 1, i32* %argno.4557
%.tmp4558 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4559 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4558, i32 0, i32 4
%.tmp4560 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4559
%.tmp4561 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4560, i32 0, i32 3
%.tmp4562 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4561
%.tmp4563 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4562, i32 0, i32 4
%.tmp4564 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4563
%expect_type.4565 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4564, %m1861$.Type.type** %expect_type.4565
%provided_args.4566 = alloca i32
store i32 0, i32* %provided_args.4566
%.tmp4568 = load %m307$.Node.type*, %m307$.Node.type** %start.4556
%pp.4569 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4568, %m307$.Node.type** %pp.4569
br label %.for.start.4567
.for.start.4567:
%.tmp4570 = load %m307$.Node.type*, %m307$.Node.type** %pp.4569
%.tmp4571 = icmp ne %m307$.Node.type* %.tmp4570, null
br i1 %.tmp4571, label %.for.continue.4567, label %.for.end.4567
.for.continue.4567:
%.tmp4572 = load i32, i32* %provided_args.4566
%.tmp4573 = add i32 %.tmp4572, 1
store i32 %.tmp4573, i32* %provided_args.4566
%.tmp4574 = load %m307$.Node.type*, %m307$.Node.type** %pp.4569
%.tmp4575 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4574, i32 0, i32 7
%.tmp4576 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4575
%.tmp4578 = getelementptr [11 x i8], [11 x i8]*@.str4577, i32 0, i32 0
%.tmp4579 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4576, i8* %.tmp4578)
store %m307$.Node.type* %.tmp4579, %m307$.Node.type** %pp.4569
br label %.for.start.4567
.for.end.4567:
%.tmp4581 = load %m307$.Node.type*, %m307$.Node.type** %start.4556
%pp.4582 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4581, %m307$.Node.type** %pp.4582
br label %.for.start.4580
.for.start.4580:
%.tmp4583 = load %m307$.Node.type*, %m307$.Node.type** %pp.4582
%.tmp4584 = icmp ne %m307$.Node.type* %.tmp4583, null
br i1 %.tmp4584, label %.for.continue.4580, label %.for.end.4580
.for.continue.4580:
%.tmp4585 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4586 = icmp eq %m1861$.Type.type* %.tmp4585, null
br i1 %.tmp4586, label %.if.true.4587, label %.if.false.4587
.if.true.4587:
%.tmp4588 = getelementptr i8*, i8** %tmp.4546, i32 0
%.tmp4590 = getelementptr [43 x i8], [43 x i8]*@.str4589, i32 0, i32 0
%.tmp4591 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4592 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4591, i32 0, i32 2
%.tmp4593 = load i8*, i8** %.tmp4592
%.tmp4594 = load i32, i32* %argno.4557
%.tmp4595 = sub i32 %.tmp4594, 1
%.tmp4596 = load i32, i32* %provided_args.4566
%.tmp4597 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4588, i8* %.tmp4590, i8* %.tmp4593, i32 %.tmp4595, i32 %.tmp4596)
%.tmp4598 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4599 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4600 = load i8*, i8** %tmp.4546
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4598, %m307$.Node.type* %.tmp4599, i8* %.tmp4600)
%.tmp4601 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4601
br label %.if.end.4587
.if.false.4587:
br label %.if.end.4587
.if.end.4587:
%.tmp4602 = load %m307$.Node.type*, %m307$.Node.type** %pp.4582
%.tmp4603 = load %m307$.Node.type*, %m307$.Node.type** %start.4556
%.tmp4604 = icmp ne %m307$.Node.type* %.tmp4602, %.tmp4603
br i1 %.tmp4604, label %.if.true.4605, label %.if.false.4605
.if.true.4605:
%.tmp4606 = getelementptr i8*, i8** %tmp.4546, i32 0
%.tmp4608 = getelementptr [5 x i8], [5 x i8]*@.str4607, i32 0, i32 0
%.tmp4609 = load i8*, i8** %params_buff.4545
%.tmp4610 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4606, i8* %.tmp4608, i8* %.tmp4609)
%.tmp4611 = load i8*, i8** %params_buff.4545
%tmp_buff.4612 = alloca i8*
store i8* %.tmp4611, i8** %tmp_buff.4612
%.tmp4613 = load i8*, i8** %tmp.4546
store i8* %.tmp4613, i8** %params_buff.4545
%.tmp4614 = load i8*, i8** %tmp_buff.4612
store i8* %.tmp4614, i8** %tmp.4546
%.tmp4615 = load i8*, i8** %tmp.4546
call void(i8*) @free(i8* %.tmp4615)
br label %.if.end.4605
.if.false.4605:
br label %.if.end.4605
.if.end.4605:
%.tmp4616 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4617 = load %m307$.Node.type*, %m307$.Node.type** %pp.4582
%.tmp4618 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4616, %m307$.Node.type* %.tmp4617)
%a_info.4619 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4618, %m1861$.AssignableInfo.type** %a_info.4619
%.tmp4620 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4619
%.tmp4621 = icmp eq %m1861$.AssignableInfo.type* %.tmp4620, null
br i1 %.tmp4621, label %.if.true.4622, label %.if.false.4622
.if.true.4622:
%.tmp4623 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4623
br label %.if.end.4622
.if.false.4622:
br label %.if.end.4622
.if.end.4622:
%.tmp4624 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4625 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4624)
%exp.4626 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4625, %m1861$.Type.type** %exp.4626
%.tmp4627 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4626
%.tmp4628 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4627, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4628
%.tmp4629 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4630 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4629, i32 0, i32 0
%.tmp4631 = load i8*, i8** %.tmp4630
%.tmp4633 = getelementptr [7 x i8], [7 x i8]*@.str4632, i32 0, i32 0
%.tmp4634 = call i32(i8*,i8*) @strcmp(i8* %.tmp4631, i8* %.tmp4633)
%.tmp4635 = icmp ne i32 %.tmp4634, 0
%.tmp4636 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4637 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4619
%.tmp4638 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4637, i32 0, i32 4
%.tmp4639 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4638
%.tmp4640 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4626
%.tmp4641 = call i1(%m1861$.CompilerCtx.type*,%m1861$.Type.type*,%m1861$.Type.type*) @m1861$is_same_type.b.m1861$.CompilerCtx.typep.m1861$.Type.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4636, %m1861$.Type.type* %.tmp4639, %m1861$.Type.type* %.tmp4640)
%.tmp4642 = icmp eq i1 %.tmp4641, 0
%.tmp4643 = and i1 %.tmp4635, %.tmp4642
br i1 %.tmp4643, label %.if.true.4644, label %.if.false.4644
.if.true.4644:
%.tmp4646 = getelementptr [1 x i8], [1 x i8]*@.str4645, i32 0, i32 0
%err_buf.4647 = alloca i8*
store i8* %.tmp4646, i8** %err_buf.4647
%.tmp4648 = getelementptr i8*, i8** %err_buf.4647, i32 0
%.tmp4650 = getelementptr [52 x i8], [52 x i8]*@.str4649, i32 0, i32 0
%.tmp4651 = load i32, i32* %argno.4557
%.tmp4652 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4653 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4626
%.tmp4654 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4652, %m1861$.Type.type* %.tmp4653)
%.tmp4655 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4656 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4619
%.tmp4657 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4656, i32 0, i32 4
%.tmp4658 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4657
%.tmp4659 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4655, %m1861$.Type.type* %.tmp4658)
%.tmp4660 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4648, i8* %.tmp4650, i32 %.tmp4651, i8* %.tmp4654, i8* %.tmp4659)
%.tmp4661 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4662 = load %m307$.Node.type*, %m307$.Node.type** %pp.4582
%.tmp4663 = load i8*, i8** %err_buf.4647
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4661, %m307$.Node.type* %.tmp4662, i8* %.tmp4663)
%.tmp4664 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4664
br label %.if.end.4644
.if.false.4644:
br label %.if.end.4644
.if.end.4644:
%.tmp4665 = getelementptr i8*, i8** %params_buff.4545, i32 0
%.tmp4667 = getelementptr [8 x i8], [8 x i8]*@.str4666, i32 0, i32 0
%.tmp4668 = load i8*, i8** %params_buff.4545
%.tmp4669 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4670 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4619
%.tmp4671 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4670, i32 0, i32 4
%.tmp4672 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4671
%.tmp4673 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4669, %m1861$.Type.type* %.tmp4672)
%.tmp4674 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4619
%.tmp4675 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4674)
%.tmp4676 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4665, i8* %.tmp4667, i8* %.tmp4668, i8* %.tmp4673, i8* %.tmp4675)
%.tmp4677 = load %m307$.Node.type*, %m307$.Node.type** %pp.4582
%.tmp4678 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4677, i32 0, i32 7
%.tmp4679 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4678
store %m307$.Node.type* %.tmp4679, %m307$.Node.type** %pp.4582
%.tmp4680 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4681 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4680, i32 0, i32 0
%.tmp4682 = load i8*, i8** %.tmp4681
%.tmp4684 = getelementptr [7 x i8], [7 x i8]*@.str4683, i32 0, i32 0
%.tmp4685 = call i32(i8*,i8*) @strcmp(i8* %.tmp4682, i8* %.tmp4684)
%.tmp4686 = icmp ne i32 %.tmp4685, 0
br i1 %.tmp4686, label %.if.true.4687, label %.if.false.4687
.if.true.4687:
%.tmp4688 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4689 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4688, i32 0, i32 4
%.tmp4690 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4689
store %m1861$.Type.type* %.tmp4690, %m1861$.Type.type** %expect_type.4565
br label %.if.end.4687
.if.false.4687:
br label %.if.end.4687
.if.end.4687:
%.tmp4691 = load i32, i32* %argno.4557
%.tmp4692 = add i32 %.tmp4691, 1
store i32 %.tmp4692, i32* %argno.4557
%.tmp4693 = load %m307$.Node.type*, %m307$.Node.type** %pp.4582
%.tmp4695 = getelementptr [11 x i8], [11 x i8]*@.str4694, i32 0, i32 0
%.tmp4696 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4693, i8* %.tmp4695)
store %m307$.Node.type* %.tmp4696, %m307$.Node.type** %pp.4582
br label %.for.start.4580
.for.end.4580:
%.tmp4697 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4698 = icmp ne %m1861$.Type.type* %.tmp4697, null
br i1 %.tmp4698, label %.if.true.4699, label %.if.false.4699
.if.true.4699:
%.tmp4700 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4565
%.tmp4701 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4700, i32 0, i32 0
%.tmp4702 = load i8*, i8** %.tmp4701
%.tmp4704 = getelementptr [7 x i8], [7 x i8]*@.str4703, i32 0, i32 0
%.tmp4705 = call i32(i8*,i8*) @strcmp(i8* %.tmp4702, i8* %.tmp4704)
%.tmp4706 = icmp ne i32 %.tmp4705, 0
br i1 %.tmp4706, label %.if.true.4707, label %.if.false.4707
.if.true.4707:
%.tmp4708 = getelementptr i8*, i8** %tmp.4546, i32 0
%.tmp4710 = getelementptr [43 x i8], [43 x i8]*@.str4709, i32 0, i32 0
%.tmp4711 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4712 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4711, i32 0, i32 2
%.tmp4713 = load i8*, i8** %.tmp4712
%.tmp4714 = load i32, i32* %argno.4557
%.tmp4715 = load i32, i32* %provided_args.4566
%.tmp4716 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4708, i8* %.tmp4710, i8* %.tmp4713, i32 %.tmp4714, i32 %.tmp4715)
%.tmp4717 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4718 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4719 = load i8*, i8** %tmp.4546
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4717, %m307$.Node.type* %.tmp4718, i8* %.tmp4719)
%.tmp4720 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4720
br label %.if.end.4707
.if.false.4707:
br label %.if.end.4707
.if.end.4707:
br label %.if.end.4699
.if.false.4699:
br label %.if.end.4699
.if.end.4699:
br label %.if.end.4549
.if.false.4549:
%.tmp4721 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4722 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4721, i32 0, i32 4
%.tmp4723 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4722
%.tmp4724 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4723, i32 0, i32 3
%.tmp4725 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4724
%.tmp4726 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4725, i32 0, i32 4
%.tmp4727 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4726
%.tmp4728 = icmp ne %m1861$.Type.type* %.tmp4727, null
br i1 %.tmp4728, label %.if.true.4729, label %.if.false.4729
.if.true.4729:
%args_required.4730 = alloca i32
store i32 0, i32* %args_required.4730
%.tmp4732 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4733 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4732, i32 0, i32 4
%.tmp4734 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4733
%.tmp4735 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4734, i32 0, i32 3
%.tmp4736 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4735
%.tmp4737 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4736, i32 0, i32 4
%.tmp4738 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4737
%pp.4739 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4738, %m1861$.Type.type** %pp.4739
br label %.for.start.4731
.for.start.4731:
%.tmp4740 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4739
%.tmp4741 = icmp ne %m1861$.Type.type* %.tmp4740, null
br i1 %.tmp4741, label %.for.continue.4731, label %.for.else.4731
.for.continue.4731:
%.tmp4742 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4739
%.tmp4743 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4742, i32 0, i32 0
%.tmp4744 = load i8*, i8** %.tmp4743
%.tmp4746 = getelementptr [7 x i8], [7 x i8]*@.str4745, i32 0, i32 0
%.tmp4747 = call i32(i8*,i8*) @strcmp(i8* %.tmp4744, i8* %.tmp4746)
%.tmp4748 = icmp eq i32 %.tmp4747, 0
br i1 %.tmp4748, label %.if.true.4749, label %.if.false.4749
.if.true.4749:
br label %.for.end.4731
br label %.if.end.4749
.if.false.4749:
br label %.if.end.4749
.if.end.4749:
%.tmp4750 = load i32, i32* %args_required.4730
%.tmp4751 = add i32 %.tmp4750, 1
store i32 %.tmp4751, i32* %args_required.4730
%.tmp4752 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4739
%.tmp4753 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4752, i32 0, i32 4
%.tmp4754 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4753
store %m1861$.Type.type* %.tmp4754, %m1861$.Type.type** %pp.4739
br label %.for.start.4731
.for.else.4731:
%.tmp4755 = getelementptr i8*, i8** %tmp.4546, i32 0
%.tmp4757 = getelementptr [42 x i8], [42 x i8]*@.str4756, i32 0, i32 0
%.tmp4758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4759 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4758, i32 0, i32 2
%.tmp4760 = load i8*, i8** %.tmp4759
%.tmp4761 = load i32, i32* %args_required.4730
%.tmp4762 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4755, i8* %.tmp4757, i8* %.tmp4760, i32 %.tmp4761)
%.tmp4763 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4764 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4765 = load i8*, i8** %tmp.4546
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4763, %m307$.Node.type* %.tmp4764, i8* %.tmp4765)
%.tmp4766 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4766
br label %.for.end.4731
.for.end.4731:
br label %.if.end.4729
.if.false.4729:
br label %.if.end.4729
.if.end.4729:
br label %.if.end.4549
.if.end.4549:
%.tmp4767 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4768 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4769 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4768, i32 0, i32 4
%.tmp4770 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4769
%.tmp4771 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4770, i32 0, i32 3
%.tmp4772 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4771
%.tmp4773 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4767, %m1861$.Type.type* %.tmp4772)
%.tmp4775 = getelementptr [5 x i8], [5 x i8]*@.str4774, i32 0, i32 0
%.tmp4776 = call i32(i8*,i8*) @strcmp(i8* %.tmp4773, i8* %.tmp4775)
%.tmp4777 = icmp eq i32 %.tmp4776, 0
br i1 %.tmp4777, label %.if.true.4778, label %.if.false.4778
.if.true.4778:
%.tmp4779 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4780 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4779, i32 0, i32 1
%.tmp4781 = load %m0$.File.type*, %m0$.File.type** %.tmp4780
%.tmp4783 = getelementptr [16 x i8], [16 x i8]*@.str4782, i32 0, i32 0
%.tmp4784 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4785 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4786 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4785, i32 0, i32 4
%.tmp4787 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4786
%.tmp4788 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4784, %m1861$.Type.type* %.tmp4787)
%.tmp4789 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4790 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4789)
%.tmp4791 = load i8*, i8** %params_buff.4545
%.tmp4792 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4781, i8* %.tmp4783, i8* %.tmp4788, i8* %.tmp4790, i8* %.tmp4791)
%.tmp4793 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4793
br label %.if.end.4778
.if.false.4778:
br label %.if.end.4778
.if.end.4778:
%.tmp4794 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4795 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4794)
%call_info.4796 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4795, %m1861$.AssignableInfo.type** %call_info.4796
%.tmp4797 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4798 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4796
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4797, %m1861$.AssignableInfo.type* %.tmp4798)
%.tmp4799 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4796
%.tmp4800 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4799, i32 0, i32 4
%.tmp4801 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4802 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4801, i32 0, i32 4
%.tmp4803 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4802
%.tmp4804 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4803, i32 0, i32 3
%.tmp4805 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4804
%.tmp4806 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4805)
store %m1861$.Type.type* %.tmp4806, %m1861$.Type.type** %.tmp4800
%.tmp4807 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4796
%.tmp4808 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4807, i32 0, i32 4
%.tmp4809 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4808
%.tmp4810 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4809, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4810
%.tmp4811 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4812 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4811, i32 0, i32 1
%.tmp4813 = load %m0$.File.type*, %m0$.File.type** %.tmp4812
%.tmp4815 = getelementptr [21 x i8], [21 x i8]*@.str4814, i32 0, i32 0
%.tmp4816 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4796
%.tmp4817 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4816)
%.tmp4818 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4819 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4820 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4819, i32 0, i32 4
%.tmp4821 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4820
%.tmp4822 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4818, %m1861$.Type.type* %.tmp4821)
%.tmp4823 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4518
%.tmp4824 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4823)
%.tmp4825 = load i8*, i8** %params_buff.4545
%.tmp4826 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4813, i8* %.tmp4815, i8* %.tmp4817, i8* %.tmp4822, i8* %.tmp4824, i8* %.tmp4825)
%.tmp4827 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4796
%.tmp4828 = bitcast %m1861$.AssignableInfo.type* %.tmp4827 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4828
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4829 = alloca i8*
store i8* null, i8** %err_msg.4829
%.tmp4830 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4831 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4830, i32 0, i32 0
%.tmp4832 = load i8*, i8** %.tmp4831
%expr_type.4833 = alloca i8*
store i8* %.tmp4832, i8** %expr_type.4833
%.tmp4834 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4835 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4834, %m1861$.AssignableInfo.type** %info.4835
%assignable.4836 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4836
%.tmp4837 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4838 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4837, %m1861$.AssignableInfo.type** %a_info.4838
%.tmp4839 = load i8*, i8** %expr_type.4833
%.tmp4841 = getelementptr [7 x i8], [7 x i8]*@.str4840, i32 0, i32 0
%.tmp4842 = call i32(i8*,i8*) @strcmp(i8* %.tmp4839, i8* %.tmp4841)
%.tmp4843 = icmp eq i32 %.tmp4842, 0
br i1 %.tmp4843, label %.if.true.4844, label %.if.false.4844
.if.true.4844:
%.tmp4845 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4846 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4845, i32 0, i32 6
%.tmp4847 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4846
%.tmp4848 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4847, i32 0, i32 7
%.tmp4849 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4848
%.tmp4850 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4849, i32 0, i32 0
%.tmp4851 = load i8*, i8** %.tmp4850
%.tmp4853 = getelementptr [3 x i8], [3 x i8]*@.str4852, i32 0, i32 0
%.tmp4854 = call i32(i8*,i8*) @strcmp(i8* %.tmp4851, i8* %.tmp4853)
%.tmp4855 = icmp ne i32 %.tmp4854, 0
br i1 %.tmp4855, label %.if.true.4856, label %.if.false.4856
.if.true.4856:
%.tmp4857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4858 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4859 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4858, i32 0, i32 6
%.tmp4860 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4859
%.tmp4861 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4860, i32 0, i32 7
%.tmp4862 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4861
%.tmp4863 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4857, %m307$.Node.type* %.tmp4862)
store %m1861$.AssignableInfo.type* %.tmp4863, %m1861$.AssignableInfo.type** %info.4835
%.tmp4864 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4835
%.tmp4865 = icmp eq %m1861$.AssignableInfo.type* %.tmp4864, null
br i1 %.tmp4865, label %.if.true.4866, label %.if.false.4866
.if.true.4866:
ret void
br label %.if.end.4866
.if.false.4866:
br label %.if.end.4866
.if.end.4866:
%.tmp4867 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4868 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4867, i32 0, i32 1
%.tmp4869 = load %m0$.File.type*, %m0$.File.type** %.tmp4868
%.tmp4871 = getelementptr [11 x i8], [11 x i8]*@.str4870, i32 0, i32 0
%.tmp4872 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4873 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4835
%.tmp4874 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4873, i32 0, i32 4
%.tmp4875 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4874
%.tmp4876 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4872, %m1861$.Type.type* %.tmp4875)
%.tmp4877 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4835
%.tmp4878 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4877)
%.tmp4879 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4869, i8* %.tmp4871, i8* %.tmp4876, i8* %.tmp4878)
br label %.if.end.4856
.if.false.4856:
%.tmp4880 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4881 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4880, i32 0, i32 1
%.tmp4882 = load %m0$.File.type*, %m0$.File.type** %.tmp4881
%.tmp4884 = getelementptr [10 x i8], [10 x i8]*@.str4883, i32 0, i32 0
%.tmp4885 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4882, i8* %.tmp4884)
br label %.if.end.4856
.if.end.4856:
br label %.if.end.4844
.if.false.4844:
%.tmp4886 = load i8*, i8** %expr_type.4833
%.tmp4888 = getelementptr [3 x i8], [3 x i8]*@.str4887, i32 0, i32 0
%.tmp4889 = call i32(i8*,i8*) @strcmp(i8* %.tmp4886, i8* %.tmp4888)
%.tmp4890 = icmp eq i32 %.tmp4889, 0
br i1 %.tmp4890, label %.if.true.4891, label %.if.false.4891
.if.true.4891:
br label %.if.end.4891
.if.false.4891:
%.tmp4892 = load i8*, i8** %expr_type.4833
%.tmp4894 = getelementptr [8 x i8], [8 x i8]*@.str4893, i32 0, i32 0
%.tmp4895 = call i32(i8*,i8*) @strcmp(i8* %.tmp4892, i8* %.tmp4894)
%.tmp4896 = icmp eq i32 %.tmp4895, 0
br i1 %.tmp4896, label %.if.true.4897, label %.if.false.4897
.if.true.4897:
%.tmp4898 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4899 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4900 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4899, i32 0, i32 6
%.tmp4901 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4900
%.tmp4902 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4898, %m307$.Node.type* %.tmp4901)
br label %.if.end.4897
.if.false.4897:
%.tmp4903 = load i8*, i8** %expr_type.4833
%.tmp4905 = getelementptr [12 x i8], [12 x i8]*@.str4904, i32 0, i32 0
%.tmp4906 = call i32(i8*,i8*) @strcmp(i8* %.tmp4903, i8* %.tmp4905)
%.tmp4907 = icmp eq i32 %.tmp4906, 0
br i1 %.tmp4907, label %.if.true.4908, label %.if.false.4908
.if.true.4908:
%.tmp4909 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4910 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4911 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4909, %m307$.Node.type* %.tmp4910)
br label %.if.end.4908
.if.false.4908:
%.tmp4912 = load i8*, i8** %expr_type.4833
%.tmp4914 = getelementptr [11 x i8], [11 x i8]*@.str4913, i32 0, i32 0
%.tmp4915 = call i32(i8*,i8*) @strcmp(i8* %.tmp4912, i8* %.tmp4914)
%.tmp4916 = icmp eq i32 %.tmp4915, 0
br i1 %.tmp4916, label %.if.true.4917, label %.if.false.4917
.if.true.4917:
%.tmp4918 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4919 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4918, i32 0, i32 6
%.tmp4920 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4919
%.tmp4922 = getelementptr [11 x i8], [11 x i8]*@.str4921, i32 0, i32 0
%.tmp4923 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4920, i8* %.tmp4922)
store %m307$.Node.type* %.tmp4923, %m307$.Node.type** %assignable.4836
%.tmp4924 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4925 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4926 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4925, i32 0, i32 6
%.tmp4927 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4926
%.tmp4928 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4924, %m307$.Node.type* %.tmp4927)
%dest.4929 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4928, %m1861$.AssignableInfo.type** %dest.4929
%.tmp4930 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4929
%.tmp4931 = icmp eq %m1861$.AssignableInfo.type* %.tmp4930, null
br i1 %.tmp4931, label %.if.true.4932, label %.if.false.4932
.if.true.4932:
ret void
br label %.if.end.4932
.if.false.4932:
br label %.if.end.4932
.if.end.4932:
%.tmp4933 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4934 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4836
%.tmp4935 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4933, %m307$.Node.type* %.tmp4934)
store %m1861$.AssignableInfo.type* %.tmp4935, %m1861$.AssignableInfo.type** %a_info.4838
%.tmp4936 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4838
%.tmp4937 = icmp eq %m1861$.AssignableInfo.type* %.tmp4936, null
br i1 %.tmp4937, label %.if.true.4938, label %.if.false.4938
.if.true.4938:
ret void
br label %.if.end.4938
.if.false.4938:
br label %.if.end.4938
.if.end.4938:
%.tmp4939 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4940 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4929
%.tmp4941 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4940, i32 0, i32 4
%.tmp4942 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4941
%.tmp4943 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4939, %m1861$.Type.type* %.tmp4942)
%dest_tr.4944 = alloca i8*
store i8* %.tmp4943, i8** %dest_tr.4944
%.tmp4945 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4946 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4838
%.tmp4947 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4946, i32 0, i32 4
%.tmp4948 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4947
%.tmp4949 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4945, %m1861$.Type.type* %.tmp4948)
%src_tr.4950 = alloca i8*
store i8* %.tmp4949, i8** %src_tr.4950
%.tmp4951 = load i8*, i8** %src_tr.4950
%.tmp4953 = getelementptr [4 x i8], [4 x i8]*@.str4952, i32 0, i32 0
%.tmp4954 = call i32(i8*,i8*) @strcmp(i8* %.tmp4951, i8* %.tmp4953)
%.tmp4955 = icmp eq i32 %.tmp4954, 0
br i1 %.tmp4955, label %.if.true.4956, label %.if.false.4956
.if.true.4956:
%.tmp4957 = load i8*, i8** %dest_tr.4944
store i8* %.tmp4957, i8** %src_tr.4950
br label %.if.end.4956
.if.false.4956:
br label %.if.end.4956
.if.end.4956:
%.tmp4958 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4959 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4958, i32 0, i32 1
%.tmp4960 = load %m0$.File.type*, %m0$.File.type** %.tmp4959
%.tmp4962 = getelementptr [21 x i8], [21 x i8]*@.str4961, i32 0, i32 0
%.tmp4963 = load i8*, i8** %src_tr.4950
%.tmp4964 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4838
%.tmp4965 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4964)
%.tmp4966 = load i8*, i8** %dest_tr.4944
%.tmp4967 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4929
%.tmp4968 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4967)
%.tmp4969 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4960, i8* %.tmp4962, i8* %.tmp4963, i8* %.tmp4965, i8* %.tmp4966, i8* %.tmp4968)
br label %.if.end.4917
.if.false.4917:
%.tmp4970 = load i8*, i8** %expr_type.4833
%.tmp4972 = getelementptr [9 x i8], [9 x i8]*@.str4971, i32 0, i32 0
%.tmp4973 = call i32(i8*,i8*) @strcmp(i8* %.tmp4970, i8* %.tmp4972)
%.tmp4974 = icmp eq i32 %.tmp4973, 0
br i1 %.tmp4974, label %.if.true.4975, label %.if.false.4975
.if.true.4975:
%.tmp4976 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4977 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4976, %m307$.Node.type* %.tmp4977)
br label %.if.end.4975
.if.false.4975:
%.tmp4978 = load i8*, i8** %expr_type.4833
%.tmp4980 = getelementptr [9 x i8], [9 x i8]*@.str4979, i32 0, i32 0
%.tmp4981 = call i32(i8*,i8*) @strcmp(i8* %.tmp4978, i8* %.tmp4980)
%.tmp4982 = icmp eq i32 %.tmp4981, 0
br i1 %.tmp4982, label %.if.true.4983, label %.if.false.4983
.if.true.4983:
%.tmp4984 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4985 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4984, %m307$.Node.type* %.tmp4985)
br label %.if.end.4983
.if.false.4983:
%.tmp4986 = load i8*, i8** %expr_type.4833
%.tmp4988 = getelementptr [8 x i8], [8 x i8]*@.str4987, i32 0, i32 0
%.tmp4989 = call i32(i8*,i8*) @strcmp(i8* %.tmp4986, i8* %.tmp4988)
%.tmp4990 = icmp eq i32 %.tmp4989, 0
br i1 %.tmp4990, label %.if.true.4991, label %.if.false.4991
.if.true.4991:
%.tmp4992 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4993 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4992)
%mod.4994 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4993, %m1861$.ModuleLookup.type** %mod.4994
%.tmp4995 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4994
%.tmp4996 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4995, i32 0, i32 3
%.tmp4997 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4996
%s.4998 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4997, %m1861$.Scope.type** %s.4998
%.tmp4999 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5000 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4999, i32 0, i32 6
%.tmp5001 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5000
%.tmp5002 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5001, i32 0, i32 1
%.tmp5003 = load i8*, i8** %.tmp5002
%.tmp5005 = getelementptr [6 x i8], [6 x i8]*@.str5004, i32 0, i32 0
%.tmp5006 = call i32(i8*,i8*) @strcmp(i8* %.tmp5003, i8* %.tmp5005)
%.tmp5007 = icmp eq i32 %.tmp5006, 0
br i1 %.tmp5007, label %.if.true.5008, label %.if.false.5008
.if.true.5008:
br label %.for.start.5009
.for.start.5009:
%.tmp5010 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5011 = icmp ne %m1861$.Scope.type* %.tmp5010, null
br i1 %.tmp5011, label %.for.continue.5009, label %.for.else.5009
.for.continue.5009:
%.tmp5012 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5013 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5012, i32 0, i32 2
%.tmp5014 = load i8*, i8** %.tmp5013
%.tmp5016 = getelementptr [4 x i8], [4 x i8]*@.str5015, i32 0, i32 0
%.tmp5017 = call i32(i8*,i8*) @strcmp(i8* %.tmp5014, i8* %.tmp5016)
%.tmp5018 = icmp eq i32 %.tmp5017, 0
br i1 %.tmp5018, label %.if.true.5019, label %.if.false.5019
.if.true.5019:
%.tmp5020 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5021 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5020, i32 0, i32 1
%.tmp5022 = load %m0$.File.type*, %m0$.File.type** %.tmp5021
%.tmp5024 = getelementptr [15 x i8], [15 x i8]*@.str5023, i32 0, i32 0
%.tmp5025 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5026 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5025, i32 0, i32 4
%.tmp5027 = load i8*, i8** %.tmp5026
%.tmp5028 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5022, i8* %.tmp5024, i8* %.tmp5027)
br label %.for.end.5009
br label %.if.end.5019
.if.false.5019:
br label %.if.end.5019
.if.end.5019:
%.tmp5029 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5030 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5029, i32 0, i32 5
%.tmp5031 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5030
store %m1861$.Scope.type* %.tmp5031, %m1861$.Scope.type** %s.4998
br label %.for.start.5009
.for.else.5009:
%.tmp5032 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5033 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5035 = getelementptr [48 x i8], [48 x i8]*@.str5034, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5032, %m307$.Node.type* %.tmp5033, i8* %.tmp5035)
br label %.for.end.5009
.for.end.5009:
br label %.if.end.5008
.if.false.5008:
%.tmp5036 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5037 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5036, i32 0, i32 6
%.tmp5038 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5037
%.tmp5039 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5038, i32 0, i32 1
%.tmp5040 = load i8*, i8** %.tmp5039
%.tmp5042 = getelementptr [9 x i8], [9 x i8]*@.str5041, i32 0, i32 0
%.tmp5043 = call i32(i8*,i8*) @strcmp(i8* %.tmp5040, i8* %.tmp5042)
%.tmp5044 = icmp eq i32 %.tmp5043, 0
br i1 %.tmp5044, label %.if.true.5045, label %.if.false.5045
.if.true.5045:
br label %.for.start.5046
.for.start.5046:
%.tmp5047 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5048 = icmp ne %m1861$.Scope.type* %.tmp5047, null
br i1 %.tmp5048, label %.for.continue.5046, label %.for.else.5046
.for.continue.5046:
%.tmp5049 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5050 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5049, i32 0, i32 2
%.tmp5051 = load i8*, i8** %.tmp5050
%.tmp5053 = getelementptr [4 x i8], [4 x i8]*@.str5052, i32 0, i32 0
%.tmp5054 = call i32(i8*,i8*) @strcmp(i8* %.tmp5051, i8* %.tmp5053)
%.tmp5055 = icmp eq i32 %.tmp5054, 0
br i1 %.tmp5055, label %.if.true.5056, label %.if.false.5056
.if.true.5056:
%.tmp5057 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5058 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5057, i32 0, i32 1
%.tmp5059 = load %m0$.File.type*, %m0$.File.type** %.tmp5058
%.tmp5061 = getelementptr [15 x i8], [15 x i8]*@.str5060, i32 0, i32 0
%.tmp5062 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5063 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5062, i32 0, i32 3
%.tmp5064 = load i8*, i8** %.tmp5063
%.tmp5065 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5059, i8* %.tmp5061, i8* %.tmp5064)
br label %.for.end.5046
br label %.if.end.5056
.if.false.5056:
br label %.if.end.5056
.if.end.5056:
%.tmp5066 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4998
%.tmp5067 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5066, i32 0, i32 5
%.tmp5068 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5067
store %m1861$.Scope.type* %.tmp5068, %m1861$.Scope.type** %s.4998
br label %.for.start.5046
.for.else.5046:
%.tmp5069 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5070 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5072 = getelementptr [51 x i8], [51 x i8]*@.str5071, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5069, %m307$.Node.type* %.tmp5070, i8* %.tmp5072)
br label %.for.end.5046
.for.end.5046:
br label %.if.end.5045
.if.false.5045:
%.tmp5073 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5074 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5076 = getelementptr [40 x i8], [40 x i8]*@.str5075, i32 0, i32 0
%.tmp5077 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5073, %m307$.Node.type* %.tmp5074, i8* %.tmp5076)
%.tmp5078 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5079 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5078, i32 0, i32 6
%.tmp5080 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5079
%.tmp5081 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5080, i32 0, i32 1
%.tmp5082 = load i8*, i8** %.tmp5081
%.tmp5083 = call i32(i8*,...) @printf(i8* %.tmp5077, i8* %.tmp5082)
br label %.if.end.5045
.if.end.5045:
br label %.if.end.5008
.if.end.5008:
br label %.if.end.4991
.if.false.4991:
%.tmp5084 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5085 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5087 = getelementptr [34 x i8], [34 x i8]*@.str5086, i32 0, i32 0
%.tmp5088 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5084, %m307$.Node.type* %.tmp5085, i8* %.tmp5087)
%.tmp5089 = load i8*, i8** %expr_type.4833
%.tmp5090 = call i32(i8*,...) @printf(i8* %.tmp5088, i8* %.tmp5089)
br label %.if.end.4991
.if.end.4991:
br label %.if.end.4983
.if.end.4983:
br label %.if.end.4975
.if.end.4975:
br label %.if.end.4917
.if.end.4917:
br label %.if.end.4908
.if.end.4908:
br label %.if.end.4897
.if.end.4897:
br label %.if.end.4891
.if.end.4891:
br label %.if.end.4844
.if.end.4844:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5091 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5092 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5091)
%for_id.5093 = alloca i32
store i32 %.tmp5092, i32* %for_id.5093
%.tmp5094 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5095 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5094, i32 0, i32 6
%.tmp5096 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5095
%.tmp5097 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5096, i32 0, i32 7
%.tmp5098 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5097
%init_stmt.5099 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5098, %m307$.Node.type** %init_stmt.5099
%.tmp5100 = bitcast ptr null to i8*
%begin_lbl.5101 = alloca i8*
store i8* %.tmp5100, i8** %begin_lbl.5101
%.tmp5102 = bitcast ptr null to i8*
%end_lbl.5103 = alloca i8*
store i8* %.tmp5102, i8** %end_lbl.5103
%.tmp5104 = getelementptr i8*, i8** %begin_lbl.5101, i32 0
%.tmp5106 = getelementptr [14 x i8], [14 x i8]*@.str5105, i32 0, i32 0
%.tmp5107 = load i32, i32* %for_id.5093
%.tmp5108 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5104, i8* %.tmp5106, i32 %.tmp5107)
%.tmp5109 = getelementptr i8*, i8** %end_lbl.5103, i32 0
%.tmp5111 = getelementptr [12 x i8], [12 x i8]*@.str5110, i32 0, i32 0
%.tmp5112 = load i32, i32* %for_id.5093
%.tmp5113 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5109, i8* %.tmp5111, i32 %.tmp5112)
%.tmp5114 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5116 = getelementptr [4 x i8], [4 x i8]*@.str5115, i32 0, i32 0
%.tmp5117 = load i8*, i8** %begin_lbl.5101
%.tmp5118 = load i8*, i8** %end_lbl.5103
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp5114, i8* %.tmp5116, i8* %.tmp5117, i8* %.tmp5118)
%.tmp5119 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
%.tmp5120 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5119, i32 0, i32 0
%.tmp5121 = load i8*, i8** %.tmp5120
%.tmp5123 = getelementptr [12 x i8], [12 x i8]*@.str5122, i32 0, i32 0
%.tmp5124 = call i32(i8*,i8*) @strcmp(i8* %.tmp5121, i8* %.tmp5123)
%.tmp5125 = icmp eq i32 %.tmp5124, 0
br i1 %.tmp5125, label %.if.true.5126, label %.if.false.5126
.if.true.5126:
%.tmp5127 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5128 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
%.tmp5129 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5127, %m307$.Node.type* %.tmp5128)
br label %.if.end.5126
.if.false.5126:
%.tmp5130 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
%.tmp5131 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5130, i32 0, i32 0
%.tmp5132 = load i8*, i8** %.tmp5131
%.tmp5134 = getelementptr [11 x i8], [11 x i8]*@.str5133, i32 0, i32 0
%.tmp5135 = call i32(i8*,i8*) @strcmp(i8* %.tmp5132, i8* %.tmp5134)
%.tmp5136 = icmp eq i32 %.tmp5135, 0
br i1 %.tmp5136, label %.if.true.5137, label %.if.false.5137
.if.true.5137:
%.tmp5138 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5139 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5138, %m307$.Node.type* %.tmp5139)
br label %.if.end.5137
.if.false.5137:
%.tmp5140 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
%.tmp5141 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5140, i32 0, i32 0
%.tmp5142 = load i8*, i8** %.tmp5141
%.tmp5144 = getelementptr [9 x i8], [9 x i8]*@.str5143, i32 0, i32 0
%.tmp5145 = call i32(i8*,i8*) @strcmp(i8* %.tmp5142, i8* %.tmp5144)
%.tmp5146 = icmp eq i32 %.tmp5145, 0
br i1 %.tmp5146, label %.if.true.5147, label %.if.false.5147
.if.true.5147:
br label %.if.end.5147
.if.false.5147:
%.tmp5148 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5149 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
%.tmp5151 = getelementptr [66 x i8], [66 x i8]*@.str5150, i32 0, i32 0
%.tmp5152 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5148, %m307$.Node.type* %.tmp5149, i8* %.tmp5151)
%.tmp5153 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5099
%.tmp5154 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5153, i32 0, i32 0
%.tmp5155 = load i8*, i8** %.tmp5154
%.tmp5156 = call i32(i8*,...) @printf(i8* %.tmp5152, i8* %.tmp5155)
%.tmp5157 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5157)
ret void
br label %.if.end.5147
.if.end.5147:
br label %.if.end.5137
.if.end.5137:
br label %.if.end.5126
.if.end.5126:
%.tmp5158 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5159 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5158, i32 0, i32 1
%.tmp5160 = load %m0$.File.type*, %m0$.File.type** %.tmp5159
%.tmp5162 = getelementptr [26 x i8], [26 x i8]*@.str5161, i32 0, i32 0
%.tmp5163 = load i32, i32* %for_id.5093
%.tmp5164 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5160, i8* %.tmp5162, i32 %.tmp5163)
%.tmp5165 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5166 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5165, i32 0, i32 1
%.tmp5167 = load %m0$.File.type*, %m0$.File.type** %.tmp5166
%.tmp5169 = getelementptr [16 x i8], [16 x i8]*@.str5168, i32 0, i32 0
%.tmp5170 = load i32, i32* %for_id.5093
%.tmp5171 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5167, i8* %.tmp5169, i32 %.tmp5170)
%.tmp5172 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5173 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5172, i32 0, i32 6
%.tmp5174 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5173
%.tmp5176 = getelementptr [9 x i8], [9 x i8]*@.str5175, i32 0, i32 0
%.tmp5177 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5174, i8* %.tmp5176)
%fst_colon.5178 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5177, %m307$.Node.type** %fst_colon.5178
%.tmp5179 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.5178
%.tmp5180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5179, i32 0, i32 7
%.tmp5181 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5180
%condition.5182 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5181, %m307$.Node.type** %condition.5182
%.tmp5183 = load %m307$.Node.type*, %m307$.Node.type** %condition.5182
%.tmp5184 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5183, i32 0, i32 0
%.tmp5185 = load i8*, i8** %.tmp5184
%.tmp5187 = getelementptr [9 x i8], [9 x i8]*@.str5186, i32 0, i32 0
%.tmp5188 = call i32(i8*,i8*) @strcmp(i8* %.tmp5185, i8* %.tmp5187)
%.tmp5189 = icmp eq i32 %.tmp5188, 0
br i1 %.tmp5189, label %.if.true.5190, label %.if.false.5190
.if.true.5190:
%.tmp5191 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5192 = load %m307$.Node.type*, %m307$.Node.type** %condition.5182
%.tmp5194 = getelementptr [39 x i8], [39 x i8]*@.str5193, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5191, %m307$.Node.type* %.tmp5192, i8* %.tmp5194)
ret void
br label %.if.end.5190
.if.false.5190:
br label %.if.end.5190
.if.end.5190:
%.tmp5195 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5196 = load %m307$.Node.type*, %m307$.Node.type** %condition.5182
%.tmp5197 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5195, %m307$.Node.type* %.tmp5196)
%condition_info.5198 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5197, %m1861$.AssignableInfo.type** %condition_info.5198
%.tmp5199 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.5178
%.tmp5200 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5199, i32 0, i32 7
%.tmp5201 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5200
%.tmp5203 = getelementptr [9 x i8], [9 x i8]*@.str5202, i32 0, i32 0
%.tmp5204 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5201, i8* %.tmp5203)
%snd_colon.5205 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5204, %m307$.Node.type** %snd_colon.5205
%.tmp5206 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5205
%.tmp5208 = getelementptr [6 x i8], [6 x i8]*@.str5207, i32 0, i32 0
%.tmp5209 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5206, i8* %.tmp5208)
%for_body.5210 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5209, %m307$.Node.type** %for_body.5210
%.tmp5211 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5210
%.tmp5213 = getelementptr [11 x i8], [11 x i8]*@.str5212, i32 0, i32 0
%.tmp5214 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5211, i8* %.tmp5213)
%else_block.5215 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5214, %m307$.Node.type** %else_block.5215
%.tmp5216 = load i8*, i8** %end_lbl.5103
%on_end.5217 = alloca i8*
store i8* %.tmp5216, i8** %on_end.5217
%.tmp5218 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5215
%.tmp5219 = icmp ne %m307$.Node.type* %.tmp5218, null
br i1 %.tmp5219, label %.if.true.5220, label %.if.false.5220
.if.true.5220:
%.tmp5221 = getelementptr i8*, i8** %on_end.5217, i32 0
%.tmp5223 = getelementptr [13 x i8], [13 x i8]*@.str5222, i32 0, i32 0
%.tmp5224 = load i32, i32* %for_id.5093
%.tmp5225 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5221, i8* %.tmp5223, i32 %.tmp5224)
br label %.if.end.5220
.if.false.5220:
br label %.if.end.5220
.if.end.5220:
%.tmp5226 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5227 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5226, i32 0, i32 1
%.tmp5228 = load %m0$.File.type*, %m0$.File.type** %.tmp5227
%.tmp5230 = getelementptr [48 x i8], [48 x i8]*@.str5229, i32 0, i32 0
%.tmp5231 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5232 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5198
%.tmp5233 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5232, i32 0, i32 4
%.tmp5234 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5233
%.tmp5235 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5231, %m1861$.Type.type* %.tmp5234)
%.tmp5236 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5198
%.tmp5237 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5236)
%.tmp5238 = load i32, i32* %for_id.5093
%.tmp5239 = load i8*, i8** %on_end.5217
%.tmp5240 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5228, i8* %.tmp5230, i8* %.tmp5235, i8* %.tmp5237, i32 %.tmp5238, i8* %.tmp5239)
%.tmp5241 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5242 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5241, i32 0, i32 1
%.tmp5243 = load %m0$.File.type*, %m0$.File.type** %.tmp5242
%.tmp5245 = getelementptr [19 x i8], [19 x i8]*@.str5244, i32 0, i32 0
%.tmp5246 = load i32, i32* %for_id.5093
%.tmp5247 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5243, i8* %.tmp5245, i32 %.tmp5246)
%.tmp5248 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5205
%.tmp5249 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5248, i32 0, i32 7
%.tmp5250 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5249
%increment.5251 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5250, %m307$.Node.type** %increment.5251
%.tmp5252 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5253 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5210
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5252, %m307$.Node.type* %.tmp5253)
%.tmp5254 = load %m307$.Node.type*, %m307$.Node.type** %increment.5251
%.tmp5255 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5210
%.tmp5256 = icmp ne %m307$.Node.type* %.tmp5254, %.tmp5255
br i1 %.tmp5256, label %.if.true.5257, label %.if.false.5257
.if.true.5257:
%.tmp5258 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5259 = load %m307$.Node.type*, %m307$.Node.type** %increment.5251
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5258, %m307$.Node.type* %.tmp5259)
br label %.if.end.5257
.if.false.5257:
br label %.if.end.5257
.if.end.5257:
%.tmp5260 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5261 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5260, i32 0, i32 1
%.tmp5262 = load %m0$.File.type*, %m0$.File.type** %.tmp5261
%.tmp5264 = getelementptr [15 x i8], [15 x i8]*@.str5263, i32 0, i32 0
%.tmp5265 = load i8*, i8** %begin_lbl.5101
%.tmp5266 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5262, i8* %.tmp5264, i8* %.tmp5265)
%.tmp5267 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5215
%.tmp5268 = icmp ne %m307$.Node.type* %.tmp5267, null
br i1 %.tmp5268, label %.if.true.5269, label %.if.false.5269
.if.true.5269:
%.tmp5270 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5271 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5270, i32 0, i32 1
%.tmp5272 = load %m0$.File.type*, %m0$.File.type** %.tmp5271
%.tmp5274 = getelementptr [15 x i8], [15 x i8]*@.str5273, i32 0, i32 0
%.tmp5275 = load i32, i32* %for_id.5093
%.tmp5276 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5272, i8* %.tmp5274, i32 %.tmp5275)
%.tmp5277 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5215
%.tmp5278 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5277, i32 0, i32 6
%.tmp5279 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5278
%.tmp5281 = getelementptr [6 x i8], [6 x i8]*@.str5280, i32 0, i32 0
%.tmp5282 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5279, i8* %.tmp5281)
%block.5283 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5282, %m307$.Node.type** %block.5283
%.tmp5284 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5285 = load %m307$.Node.type*, %m307$.Node.type** %block.5283
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5284, %m307$.Node.type* %.tmp5285)
%.tmp5286 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5287 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5286, i32 0, i32 1
%.tmp5288 = load %m0$.File.type*, %m0$.File.type** %.tmp5287
%.tmp5290 = getelementptr [15 x i8], [15 x i8]*@.str5289, i32 0, i32 0
%.tmp5291 = load i8*, i8** %end_lbl.5103
%.tmp5292 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5288, i8* %.tmp5290, i8* %.tmp5291)
br label %.if.end.5269
.if.false.5269:
br label %.if.end.5269
.if.end.5269:
%.tmp5293 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5294 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5293, i32 0, i32 1
%.tmp5295 = load %m0$.File.type*, %m0$.File.type** %.tmp5294
%.tmp5297 = getelementptr [5 x i8], [5 x i8]*@.str5296, i32 0, i32 0
%.tmp5298 = load i8*, i8** %end_lbl.5103
%.tmp5299 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5295, i8* %.tmp5297, i8* %.tmp5298)
%.tmp5300 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5300)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5301 = bitcast ptr null to %m1861$.Type.type*
%decl_type.5302 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5301, %m1861$.Type.type** %decl_type.5302
%.tmp5303 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.5304 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5303, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5305 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5305, i32 0, i32 6
%.tmp5307 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5306
%.tmp5308 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5307, i32 0, i32 0
%.tmp5309 = load i8*, i8** %.tmp5308
%.tmp5311 = getelementptr [5 x i8], [5 x i8]*@.str5310, i32 0, i32 0
%.tmp5312 = call i32(i8*,i8*) @strcmp(i8* %.tmp5309, i8* %.tmp5311)
%.tmp5313 = icmp eq i32 %.tmp5312, 0
br i1 %.tmp5313, label %.if.true.5314, label %.if.false.5314
.if.true.5314:
%.tmp5315 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5316 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5317 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5316, i32 0, i32 6
%.tmp5318 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5317
%.tmp5319 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5318, i32 0, i32 6
%.tmp5320 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5319
%.tmp5321 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5315, %m307$.Node.type* %.tmp5320)
store %m1861$.Type.type* %.tmp5321, %m1861$.Type.type** %decl_type.5302
br label %.if.end.5314
.if.false.5314:
br label %.if.end.5314
.if.end.5314:
%.tmp5322 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5323 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5322, i32 0, i32 6
%.tmp5324 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5323
%.tmp5326 = getelementptr [11 x i8], [11 x i8]*@.str5325, i32 0, i32 0
%.tmp5327 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5324, i8* %.tmp5326)
%assignable.5328 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5327, %m307$.Node.type** %assignable.5328
%.tmp5329 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5328
%.tmp5330 = icmp ne %m307$.Node.type* %.tmp5329, null
br i1 %.tmp5330, label %.if.true.5331, label %.if.false.5331
.if.true.5331:
%.tmp5332 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5333 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5328
%.tmp5334 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5332, %m307$.Node.type* %.tmp5333)
store %m1861$.AssignableInfo.type* %.tmp5334, %m1861$.AssignableInfo.type** %a_info.5304
br label %.if.end.5331
.if.false.5331:
br label %.if.end.5331
.if.end.5331:
%.tmp5335 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5336 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5335)
%info.5337 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5336, %m1861$.AssignableInfo.type** %info.5337
%.tmp5338 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5339 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5338, i32 0, i32 3
%.tmp5341 = getelementptr [9 x i8], [9 x i8]*@.str5340, i32 0, i32 0
store i8* %.tmp5341, i8** %.tmp5339
%.tmp5342 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5343 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5342, i32 0, i32 6
%.tmp5344 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5343
%.tmp5346 = getelementptr [5 x i8], [5 x i8]*@.str5345, i32 0, i32 0
%.tmp5347 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5344, i8* %.tmp5346)
%var_name.5348 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5347, %m307$.Node.type** %var_name.5348
%.tmp5349 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5348
%.tmp5350 = icmp eq %m307$.Node.type* %.tmp5349, null
br i1 %.tmp5350, label %.if.true.5351, label %.if.false.5351
.if.true.5351:
%.tmp5352 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5353 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5355 = getelementptr [31 x i8], [31 x i8]*@.str5354, i32 0, i32 0
%.tmp5356 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5352, %m307$.Node.type* %.tmp5353, i8* %.tmp5355)
%.tmp5357 = call i32(i8*,...) @printf(i8* %.tmp5356)
%.tmp5358 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5358
br label %.if.end.5351
.if.false.5351:
br label %.if.end.5351
.if.end.5351:
%.tmp5359 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5360 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5359)
%mod.5361 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5360, %m1861$.ModuleLookup.type** %mod.5361
%.tmp5362 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5363 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5361
%.tmp5364 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5363, i32 0, i32 3
%.tmp5365 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5364
%.tmp5366 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5348
%.tmp5367 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5366, i32 0, i32 1
%.tmp5368 = load i8*, i8** %.tmp5367
%.tmp5369 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5362, %m1861$.Scope.type* %.tmp5365, i8* %.tmp5368)
%.tmp5370 = icmp ne %m1861$.ScopeItem.type* %.tmp5369, null
br i1 %.tmp5370, label %.if.true.5371, label %.if.false.5371
.if.true.5371:
%err_buf.5372 = alloca i8*
store i8* null, i8** %err_buf.5372
%.tmp5373 = getelementptr i8*, i8** %err_buf.5372, i32 0
%.tmp5375 = getelementptr [43 x i8], [43 x i8]*@.str5374, i32 0, i32 0
%.tmp5376 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5348
%.tmp5377 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5376, i32 0, i32 1
%.tmp5378 = load i8*, i8** %.tmp5377
%.tmp5379 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5373, i8* %.tmp5375, i8* %.tmp5378)
%.tmp5380 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5381 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5382 = load i8*, i8** %err_buf.5372
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5380, %m307$.Node.type* %.tmp5381, i8* %.tmp5382)
%.tmp5383 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5383
br label %.if.end.5371
.if.false.5371:
br label %.if.end.5371
.if.end.5371:
%var_id.5384 = alloca i8*
store i8* null, i8** %var_id.5384
%.tmp5385 = getelementptr i8*, i8** %var_id.5384, i32 0
%.tmp5387 = getelementptr [6 x i8], [6 x i8]*@.str5386, i32 0, i32 0
%.tmp5388 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5348
%.tmp5389 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5388, i32 0, i32 1
%.tmp5390 = load i8*, i8** %.tmp5389
%.tmp5391 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5392 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5391)
%.tmp5393 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5385, i8* %.tmp5387, i8* %.tmp5390, i32 %.tmp5392)
%.tmp5394 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5395 = load i8, i8* @SCOPE_LOCAL
%.tmp5396 = load i8*, i8** %var_id.5384
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5394, i8 %.tmp5395, i8* %.tmp5396)
%.tmp5397 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5302
%.tmp5398 = icmp ne %m1861$.Type.type* %.tmp5397, null
br i1 %.tmp5398, label %.if.true.5399, label %.if.false.5399
.if.true.5399:
%.tmp5400 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5401 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5400, i32 0, i32 4
%.tmp5402 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5302
store %m1861$.Type.type* %.tmp5402, %m1861$.Type.type** %.tmp5401
br label %.if.end.5399
.if.false.5399:
%.tmp5403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5404 = icmp ne %m1861$.AssignableInfo.type* %.tmp5403, null
br i1 %.tmp5404, label %.if.true.5405, label %.if.false.5405
.if.true.5405:
%.tmp5406 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5407 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5406, i32 0, i32 4
%.tmp5408 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5409 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5408, i32 0, i32 4
%.tmp5410 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5409
store %m1861$.Type.type* %.tmp5410, %m1861$.Type.type** %.tmp5407
br label %.if.end.5405
.if.false.5405:
br label %.if.end.5405
.if.end.5405:
br label %.if.end.5399
.if.end.5399:
%.tmp5411 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5412 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5413 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5412, i32 0, i32 4
%.tmp5414 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5413
%.tmp5415 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5411, %m1861$.Type.type* %.tmp5414)
%var_type_repr.5416 = alloca i8*
store i8* %.tmp5415, i8** %var_type_repr.5416
%.tmp5417 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5418 = icmp ne %m1861$.AssignableInfo.type* %.tmp5417, null
br i1 %.tmp5418, label %.if.true.5419, label %.if.false.5419
.if.true.5419:
%.tmp5420 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5421 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5422 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5421, i32 0, i32 4
%.tmp5423 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5422
%.tmp5424 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5420, %m1861$.Type.type* %.tmp5423)
%a_type_repr.5425 = alloca i8*
store i8* %.tmp5424, i8** %a_type_repr.5425
%type_error.5426 = alloca i1
store i1 0, i1* %type_error.5426
%.tmp5427 = load i8*, i8** %a_type_repr.5425
%.tmp5428 = call i32(i8*) @strlen(i8* %.tmp5427)
%.tmp5429 = load i8*, i8** %var_type_repr.5416
%.tmp5430 = call i32(i8*) @strlen(i8* %.tmp5429)
%.tmp5431 = icmp ne i32 %.tmp5428, %.tmp5430
br i1 %.tmp5431, label %.if.true.5432, label %.if.false.5432
.if.true.5432:
store i1 1, i1* %type_error.5426
br label %.if.end.5432
.if.false.5432:
%.tmp5433 = load i8*, i8** %a_type_repr.5425
%.tmp5434 = load i8*, i8** %var_type_repr.5416
%.tmp5435 = call i32(i8*,i8*) @strcmp(i8* %.tmp5433, i8* %.tmp5434)
%.tmp5436 = icmp ne i32 %.tmp5435, 0
br i1 %.tmp5436, label %.if.true.5437, label %.if.false.5437
.if.true.5437:
store i1 1, i1* %type_error.5426
br label %.if.end.5437
.if.false.5437:
br label %.if.end.5437
.if.end.5437:
br label %.if.end.5432
.if.end.5432:
%.tmp5438 = load i1, i1* %type_error.5426
br i1 %.tmp5438, label %.if.true.5439, label %.if.false.5439
.if.true.5439:
%.tmp5440 = bitcast ptr null to i8*
%err_msg.5441 = alloca i8*
store i8* %.tmp5440, i8** %err_msg.5441
%.tmp5442 = getelementptr i8*, i8** %err_msg.5441, i32 0
%.tmp5444 = getelementptr [49 x i8], [49 x i8]*@.str5443, i32 0, i32 0
%.tmp5445 = load i8*, i8** %a_type_repr.5425
%.tmp5446 = load i8*, i8** %var_type_repr.5416
%.tmp5447 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5442, i8* %.tmp5444, i8* %.tmp5445, i8* %.tmp5446)
%.tmp5448 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5449 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5450 = load i8*, i8** %err_msg.5441
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5448, %m307$.Node.type* %.tmp5449, i8* %.tmp5450)
br label %.if.end.5439
.if.false.5439:
br label %.if.end.5439
.if.end.5439:
br label %.if.end.5419
.if.false.5419:
br label %.if.end.5419
.if.end.5419:
%.tmp5451 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5452 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5453 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5348
%.tmp5454 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5453, i32 0, i32 1
%.tmp5455 = load i8*, i8** %.tmp5454
%.tmp5456 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5451, %m307$.Node.type* %.tmp5452, i8* %.tmp5455, %m1861$.AssignableInfo.type* %.tmp5456)
%.tmp5457 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5458 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5457, i32 0, i32 1
%.tmp5459 = load %m0$.File.type*, %m0$.File.type** %.tmp5458
%.tmp5461 = getelementptr [16 x i8], [16 x i8]*@.str5460, i32 0, i32 0
%.tmp5462 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5463 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5462)
%.tmp5464 = load i8*, i8** %var_type_repr.5416
%.tmp5465 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5459, i8* %.tmp5461, i8* %.tmp5463, i8* %.tmp5464)
%.tmp5466 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5467 = icmp ne %m1861$.AssignableInfo.type* %.tmp5466, null
br i1 %.tmp5467, label %.if.true.5468, label %.if.false.5468
.if.true.5468:
%.tmp5469 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5470 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5469, i32 0, i32 1
%.tmp5471 = load %m0$.File.type*, %m0$.File.type** %.tmp5470
%.tmp5473 = getelementptr [21 x i8], [21 x i8]*@.str5472, i32 0, i32 0
%.tmp5474 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5475 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5476 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5475, i32 0, i32 4
%.tmp5477 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5476
%.tmp5478 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5474, %m1861$.Type.type* %.tmp5477)
%.tmp5479 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5304
%.tmp5480 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5479)
%.tmp5481 = load i8*, i8** %var_type_repr.5416
%.tmp5482 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
%.tmp5483 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5482)
%.tmp5484 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5471, i8* %.tmp5473, i8* %.tmp5478, i8* %.tmp5480, i8* %.tmp5481, i8* %.tmp5483)
br label %.if.end.5468
.if.false.5468:
%.tmp5485 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5486 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5487 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5485, %m307$.Node.type* %.tmp5486, %m1861$.AssignableInfo.type* %.tmp5487)
br label %.if.end.5468
.if.end.5468:
%.tmp5488 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5337
ret %m1861$.AssignableInfo.type* %.tmp5488
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5489 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5490 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5489, i32 0, i32 4
%.tmp5491 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5490
%.tmp5492 = icmp eq %m1861$.Type.type* %.tmp5491, null
br i1 %.tmp5492, label %.if.true.5493, label %.if.false.5493
.if.true.5493:
ret void
br label %.if.end.5493
.if.false.5493:
br label %.if.end.5493
.if.end.5493:
%.tmp5494 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5496 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5495, i32 0, i32 4
%.tmp5497 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5496
%.tmp5498 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5494, %m1861$.Type.type* %.tmp5497)
%t_repr.5499 = alloca i8*
store i8* %.tmp5498, i8** %t_repr.5499
%.tmp5500 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5501 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5500)
%id.5502 = alloca i8*
store i8* %.tmp5501, i8** %id.5502
%field_id.5503 = alloca i32
store i32 0, i32* %field_id.5503
%field.5504 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5504
%field_info.5505 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5506 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5507 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5506, i32 0, i32 4
%.tmp5508 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5507
%t.5509 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5508, %m1861$.Type.type** %t.5509
%.tmp5510 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5511 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5510, i32 0, i32 0
%.tmp5512 = load i8*, i8** %.tmp5511
%.tmp5514 = getelementptr [4 x i8], [4 x i8]*@.str5513, i32 0, i32 0
%.tmp5515 = call i32(i8*,i8*) @strcmp(i8* %.tmp5512, i8* %.tmp5514)
%.tmp5516 = icmp eq i32 %.tmp5515, 0
%.tmp5517 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5518 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5517, i32 0, i32 0
%.tmp5519 = load i8*, i8** %.tmp5518
%.tmp5521 = getelementptr [4 x i8], [4 x i8]*@.str5520, i32 0, i32 0
%.tmp5522 = call i32(i8*,i8*) @strcmp(i8* %.tmp5519, i8* %.tmp5521)
%.tmp5523 = icmp eq i32 %.tmp5522, 0
%.tmp5524 = or i1 %.tmp5516, %.tmp5523
%.tmp5525 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5526 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5525, i32 0, i32 0
%.tmp5527 = load i8*, i8** %.tmp5526
%.tmp5529 = getelementptr [5 x i8], [5 x i8]*@.str5528, i32 0, i32 0
%.tmp5530 = call i32(i8*,i8*) @strcmp(i8* %.tmp5527, i8* %.tmp5529)
%.tmp5531 = icmp eq i32 %.tmp5530, 0
%.tmp5532 = or i1 %.tmp5524, %.tmp5531
br i1 %.tmp5532, label %.if.true.5533, label %.if.false.5533
.if.true.5533:
%.tmp5534 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5535 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5534, i32 0, i32 1
%.tmp5536 = load %m0$.File.type*, %m0$.File.type** %.tmp5535
%.tmp5538 = getelementptr [21 x i8], [21 x i8]*@.str5537, i32 0, i32 0
%.tmp5539 = load i8*, i8** %t_repr.5499
%.tmp5540 = load i8*, i8** %t_repr.5499
%.tmp5541 = load i8*, i8** %id.5502
%.tmp5542 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5536, i8* %.tmp5538, i8* %.tmp5539, i32 0, i8* %.tmp5540, i8* %.tmp5541)
br label %.if.end.5533
.if.false.5533:
%.tmp5543 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5544 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5543, i32 0, i32 0
%.tmp5545 = load i8*, i8** %.tmp5544
%.tmp5547 = getelementptr [4 x i8], [4 x i8]*@.str5546, i32 0, i32 0
%.tmp5548 = call i32(i8*,i8*) @strcmp(i8* %.tmp5545, i8* %.tmp5547)
%.tmp5549 = icmp eq i32 %.tmp5548, 0
br i1 %.tmp5549, label %.if.true.5550, label %.if.false.5550
.if.true.5550:
%.tmp5551 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5552 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5551, i32 0, i32 1
%.tmp5553 = load %m0$.File.type*, %m0$.File.type** %.tmp5552
%.tmp5555 = getelementptr [21 x i8], [21 x i8]*@.str5554, i32 0, i32 0
%.tmp5556 = load i8*, i8** %t_repr.5499
%.tmp5558 = getelementptr [5 x i8], [5 x i8]*@.str5557, i32 0, i32 0
%.tmp5559 = load i8*, i8** %t_repr.5499
%.tmp5560 = load i8*, i8** %id.5502
%.tmp5561 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5553, i8* %.tmp5555, i8* %.tmp5556, i8* %.tmp5558, i8* %.tmp5559, i8* %.tmp5560)
br label %.if.end.5550
.if.false.5550:
%.tmp5562 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5563 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5562, i32 0, i32 0
%.tmp5564 = load i8*, i8** %.tmp5563
%.tmp5566 = getelementptr [7 x i8], [7 x i8]*@.str5565, i32 0, i32 0
%.tmp5567 = call i32(i8*,i8*) @strcmp(i8* %.tmp5564, i8* %.tmp5566)
%.tmp5568 = icmp eq i32 %.tmp5567, 0
br i1 %.tmp5568, label %.if.true.5569, label %.if.false.5569
.if.true.5569:
%.tmp5571 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5572 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5571, i32 0, i32 3
%.tmp5573 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5572
store %m1861$.Type.type* %.tmp5573, %m1861$.Type.type** %field.5504
br label %.for.start.5570
.for.start.5570:
%.tmp5574 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5504
%.tmp5575 = icmp ne %m1861$.Type.type* %.tmp5574, null
br i1 %.tmp5575, label %.for.continue.5570, label %.for.end.5570
.for.continue.5570:
%.tmp5576 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5577 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5576)
store %m1861$.AssignableInfo.type* %.tmp5577, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5578 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5579 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5578, %m1861$.AssignableInfo.type* %.tmp5579)
%.tmp5580 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5581 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5580, i32 0, i32 4
%.tmp5582 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5504
store %m1861$.Type.type* %.tmp5582, %m1861$.Type.type** %.tmp5581
%.tmp5583 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5584 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5583, i32 0, i32 1
%.tmp5585 = load %m0$.File.type*, %m0$.File.type** %.tmp5584
%.tmp5587 = getelementptr [46 x i8], [46 x i8]*@.str5586, i32 0, i32 0
%.tmp5588 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5589 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5588)
%.tmp5590 = load i8*, i8** %t_repr.5499
%.tmp5591 = load i8*, i8** %t_repr.5499
%.tmp5592 = load i8*, i8** %id.5502
%.tmp5593 = load i32, i32* %field_id.5503
%.tmp5594 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5585, i8* %.tmp5587, i8* %.tmp5589, i8* %.tmp5590, i8* %.tmp5591, i8* %.tmp5592, i32 %.tmp5593)
%.tmp5595 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5596 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5597 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5595, %m307$.Node.type* %.tmp5596, %m1861$.AssignableInfo.type* %.tmp5597)
%.tmp5598 = load i32, i32* %field_id.5503
%.tmp5599 = add i32 %.tmp5598, 1
store i32 %.tmp5599, i32* %field_id.5503
%.tmp5600 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5504
%.tmp5601 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5600, i32 0, i32 4
%.tmp5602 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5601
store %m1861$.Type.type* %.tmp5602, %m1861$.Type.type** %field.5504
br label %.for.start.5570
.for.end.5570:
br label %.if.end.5569
.if.false.5569:
%.tmp5603 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5604 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5603, i32 0, i32 0
%.tmp5605 = load i8*, i8** %.tmp5604
%.tmp5607 = getelementptr [10 x i8], [10 x i8]*@.str5606, i32 0, i32 0
%.tmp5608 = call i32(i8*,i8*) @strcmp(i8* %.tmp5605, i8* %.tmp5607)
%.tmp5609 = icmp eq i32 %.tmp5608, 0
br i1 %.tmp5609, label %.if.true.5610, label %.if.false.5610
.if.true.5610:
%.tmp5612 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5509
%.tmp5613 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5612, i32 0, i32 3
%.tmp5614 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5613
%.tmp5615 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5614, i32 0, i32 3
%.tmp5616 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5615
store %m1861$.Type.type* %.tmp5616, %m1861$.Type.type** %field.5504
br label %.for.start.5611
.for.start.5611:
%.tmp5617 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5504
%.tmp5618 = icmp ne %m1861$.Type.type* %.tmp5617, null
br i1 %.tmp5618, label %.for.continue.5611, label %.for.end.5611
.for.continue.5611:
%.tmp5619 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5620 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5619)
store %m1861$.AssignableInfo.type* %.tmp5620, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5621 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5622 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5621, %m1861$.AssignableInfo.type* %.tmp5622)
%.tmp5623 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5624 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5623, i32 0, i32 4
%.tmp5625 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5504
store %m1861$.Type.type* %.tmp5625, %m1861$.Type.type** %.tmp5624
%.tmp5626 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5627 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5626, i32 0, i32 1
%.tmp5628 = load %m0$.File.type*, %m0$.File.type** %.tmp5627
%.tmp5630 = getelementptr [46 x i8], [46 x i8]*@.str5629, i32 0, i32 0
%.tmp5631 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
%.tmp5632 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5631)
%.tmp5633 = load i8*, i8** %t_repr.5499
%.tmp5634 = load i8*, i8** %t_repr.5499
%.tmp5635 = load i8*, i8** %id.5502
%.tmp5636 = load i32, i32* %field_id.5503
%.tmp5637 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5628, i8* %.tmp5630, i8* %.tmp5632, i8* %.tmp5633, i8* %.tmp5634, i8* %.tmp5635, i32 %.tmp5636)
%.tmp5638 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5639 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5640 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5505
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5638, %m307$.Node.type* %.tmp5639, %m1861$.AssignableInfo.type* %.tmp5640)
%.tmp5641 = load i32, i32* %field_id.5503
%.tmp5642 = add i32 %.tmp5641, 1
store i32 %.tmp5642, i32* %field_id.5503
%.tmp5643 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5504
%.tmp5644 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5643, i32 0, i32 4
%.tmp5645 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5644
store %m1861$.Type.type* %.tmp5645, %m1861$.Type.type** %field.5504
br label %.for.start.5611
.for.end.5611:
br label %.if.end.5610
.if.false.5610:
%.tmp5646 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5647 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5649 = getelementptr [44 x i8], [44 x i8]*@.str5648, i32 0, i32 0
%.tmp5650 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5646, %m307$.Node.type* %.tmp5647, i8* %.tmp5649)
%.tmp5651 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5652 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5651, i32 0, i32 4
%.tmp5653 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5652
%.tmp5654 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5653, i32 0, i32 0
%.tmp5655 = load i8*, i8** %.tmp5654
%.tmp5656 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5657 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5658 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5657, i32 0, i32 4
%.tmp5659 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5658
%.tmp5660 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5656, %m1861$.Type.type* %.tmp5659)
%.tmp5661 = call i32(i8*,...) @printf(i8* %.tmp5650, i8* %.tmp5655, i8* %.tmp5660)
ret void
br label %.if.end.5610
.if.end.5610:
br label %.if.end.5569
.if.end.5569:
br label %.if.end.5550
.if.end.5550:
br label %.if.end.5533
.if.end.5533:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5662 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5663 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5662, i32 0, i32 6
%.tmp5664 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5663
%.tmp5666 = getelementptr [11 x i8], [11 x i8]*@.str5665, i32 0, i32 0
%.tmp5667 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5664, i8* %.tmp5666)
%assignable.5668 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5667, %m307$.Node.type** %assignable.5668
%.tmp5669 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5670 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5668
%.tmp5671 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5669, %m307$.Node.type* %.tmp5670)
%a_info.5672 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5671, %m1861$.AssignableInfo.type** %a_info.5672
%.tmp5673 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5672
%.tmp5674 = icmp eq %m1861$.AssignableInfo.type* %.tmp5673, null
br i1 %.tmp5674, label %.if.true.5675, label %.if.false.5675
.if.true.5675:
ret void
br label %.if.end.5675
.if.false.5675:
br label %.if.end.5675
.if.end.5675:
%.tmp5676 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5677 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5676)
%if_id.5678 = alloca i32
store i32 %.tmp5677, i32* %if_id.5678
%.tmp5679 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5680 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5679, i32 0, i32 1
%.tmp5681 = load %m0$.File.type*, %m0$.File.type** %.tmp5680
%.tmp5683 = getelementptr [53 x i8], [53 x i8]*@.str5682, i32 0, i32 0
%.tmp5684 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5685 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5672
%.tmp5686 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5685, i32 0, i32 4
%.tmp5687 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5686
%.tmp5688 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5684, %m1861$.Type.type* %.tmp5687)
%.tmp5689 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5672
%.tmp5690 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5689)
%.tmp5691 = load i32, i32* %if_id.5678
%.tmp5692 = load i32, i32* %if_id.5678
%.tmp5693 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5681, i8* %.tmp5683, i8* %.tmp5688, i8* %.tmp5690, i32 %.tmp5691, i32 %.tmp5692)
%.tmp5694 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5695 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5694, i32 0, i32 1
%.tmp5696 = load %m0$.File.type*, %m0$.File.type** %.tmp5695
%.tmp5698 = getelementptr [14 x i8], [14 x i8]*@.str5697, i32 0, i32 0
%.tmp5699 = load i32, i32* %if_id.5678
%.tmp5700 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5696, i8* %.tmp5698, i32 %.tmp5699)
%.tmp5701 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5702 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5701, i32 0, i32 6
%.tmp5703 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5702
%.tmp5705 = getelementptr [6 x i8], [6 x i8]*@.str5704, i32 0, i32 0
%.tmp5706 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5703, i8* %.tmp5705)
%block.5707 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5706, %m307$.Node.type** %block.5707
%.tmp5708 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5709 = load %m307$.Node.type*, %m307$.Node.type** %block.5707
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5708, %m307$.Node.type* %.tmp5709)
%.tmp5710 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5711 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5710, i32 0, i32 1
%.tmp5712 = load %m0$.File.type*, %m0$.File.type** %.tmp5711
%.tmp5714 = getelementptr [23 x i8], [23 x i8]*@.str5713, i32 0, i32 0
%.tmp5715 = load i32, i32* %if_id.5678
%.tmp5716 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5712, i8* %.tmp5714, i32 %.tmp5715)
%.tmp5717 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5718 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5717, i32 0, i32 1
%.tmp5719 = load %m0$.File.type*, %m0$.File.type** %.tmp5718
%.tmp5721 = getelementptr [15 x i8], [15 x i8]*@.str5720, i32 0, i32 0
%.tmp5722 = load i32, i32* %if_id.5678
%.tmp5723 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5719, i8* %.tmp5721, i32 %.tmp5722)
%.tmp5724 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5725 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5724, i32 0, i32 6
%.tmp5726 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5725
%.tmp5728 = getelementptr [11 x i8], [11 x i8]*@.str5727, i32 0, i32 0
%.tmp5729 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5726, i8* %.tmp5728)
%else_block.5730 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5729, %m307$.Node.type** %else_block.5730
%.tmp5731 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5730
%.tmp5732 = icmp ne %m307$.Node.type* %.tmp5731, null
br i1 %.tmp5732, label %.if.true.5733, label %.if.false.5733
.if.true.5733:
%.tmp5734 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5730
%.tmp5735 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5734, i32 0, i32 6
%.tmp5736 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5735
%.tmp5737 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5736, i32 0, i32 0
%.tmp5738 = load i8*, i8** %.tmp5737
%.tmp5740 = getelementptr [11 x i8], [11 x i8]*@.str5739, i32 0, i32 0
%.tmp5741 = call i32(i8*,i8*) @strcmp(i8* %.tmp5738, i8* %.tmp5740)
%.tmp5742 = icmp eq i32 %.tmp5741, 0
br i1 %.tmp5742, label %.if.true.5743, label %.if.false.5743
.if.true.5743:
%.tmp5744 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5730
%.tmp5745 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5744, i32 0, i32 6
%.tmp5746 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5745
%.tmp5747 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5746, i32 0, i32 6
%.tmp5748 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5747
%.tmp5750 = getelementptr [6 x i8], [6 x i8]*@.str5749, i32 0, i32 0
%.tmp5751 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5748, i8* %.tmp5750)
store %m307$.Node.type* %.tmp5751, %m307$.Node.type** %block.5707
%.tmp5752 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5753 = load %m307$.Node.type*, %m307$.Node.type** %block.5707
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5752, %m307$.Node.type* %.tmp5753)
br label %.if.end.5743
.if.false.5743:
%.tmp5754 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5755 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5730
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5754, %m307$.Node.type* %.tmp5755)
br label %.if.end.5743
.if.end.5743:
br label %.if.end.5733
.if.false.5733:
br label %.if.end.5733
.if.end.5733:
%.tmp5756 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5757 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5756, i32 0, i32 1
%.tmp5758 = load %m0$.File.type*, %m0$.File.type** %.tmp5757
%.tmp5760 = getelementptr [23 x i8], [23 x i8]*@.str5759, i32 0, i32 0
%.tmp5761 = load i32, i32* %if_id.5678
%.tmp5762 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5758, i8* %.tmp5760, i32 %.tmp5761)
%.tmp5763 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5764 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5763, i32 0, i32 1
%.tmp5765 = load %m0$.File.type*, %m0$.File.type** %.tmp5764
%.tmp5767 = getelementptr [13 x i8], [13 x i8]*@.str5766, i32 0, i32 0
%.tmp5768 = load i32, i32* %if_id.5678
%.tmp5769 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5765, i8* %.tmp5767, i32 %.tmp5768)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5770 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5771 = icmp ne %m307$.Node.type* %.tmp5770, null
br i1 %.tmp5771, label %.if.true.5772, label %.if.false.5772
.if.true.5772:
%.tmp5773 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5774 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5773, i32 0, i32 7
%.tmp5775 = load i8*, i8** %.tmp5774
%.tmp5776 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5777 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5776, i32 0, i32 3
%.tmp5778 = load i32, i32* %.tmp5777
%.tmp5779 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5780 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5779, i32 0, i32 4
%.tmp5781 = load i32, i32* %.tmp5780
%.tmp5782 = load i8*, i8** %msg
%.tmp5783 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5775, i32 %.tmp5778, i32 %.tmp5781, i8* %.tmp5782)
%err.5784 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5783, %m751$.Error.type** %err.5784
%.tmp5785 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5786 = load %m751$.Error.type*, %m751$.Error.type** %err.5784
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5785, %m751$.Error.type* %.tmp5786)
br label %.if.end.5772
.if.false.5772:
%.tmp5788 = getelementptr [61 x i8], [61 x i8]*@.str5787, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5788)
br label %.if.end.5772
.if.end.5772:
ret void
}
define void @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.name.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5789 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5790 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5789)
%mod.5791 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5790, %m1861$.ModuleLookup.type** %mod.5791
%.tmp5792 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5791
%.tmp5793 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5792, i32 0, i32 3
%.tmp5794 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5793
%.tmp5795 = icmp ne %m1861$.Scope.type* %.tmp5794, null
%.tmp5797 = getelementptr [82 x i8], [82 x i8]*@.str5796, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5795, i8* %.tmp5797)
%.tmp5798 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5791
%.tmp5799 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5798, i32 0, i32 3
%.tmp5800 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5799
%current_scope.5801 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5800, %m1861$.Scope.type** %current_scope.5801
%.tmp5802 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5803 = ptrtoint %m1861$.ScopeItem.type* %.tmp5802 to i32
%.tmp5804 = call i8*(i32) @malloc(i32 %.tmp5803)
%.tmp5805 = bitcast i8* %.tmp5804 to %m1861$.ScopeItem.type*
%newitem.5806 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5805, %m1861$.ScopeItem.type** %newitem.5806
%.tmp5807 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5806
%.tmp5808 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5807, i32 0, i32 0
%.tmp5809 = load i8*, i8** %name
store i8* %.tmp5809, i8** %.tmp5808
%.tmp5810 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5806
%.tmp5811 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5810, i32 0, i32 1
%.tmp5812 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5812, %m1861$.AssignableInfo.type** %.tmp5811
%.tmp5813 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5806
%.tmp5814 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5813, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5814
%.tmp5815 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5816 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5815, i32 0, i32 2
%.tmp5817 = load i8*, i8** %name
store i8* %.tmp5817, i8** %.tmp5816
%.tmp5818 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5801
%.tmp5819 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5818, i32 0, i32 1
%.tmp5820 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5819
%.tmp5821 = icmp eq %m1861$.ScopeItem.type* %.tmp5820, null
br i1 %.tmp5821, label %.if.true.5822, label %.if.false.5822
.if.true.5822:
%.tmp5823 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5801
%.tmp5824 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5823, i32 0, i32 1
%.tmp5825 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5806
store %m1861$.ScopeItem.type* %.tmp5825, %m1861$.ScopeItem.type** %.tmp5824
ret void
br label %.if.end.5822
.if.false.5822:
br label %.if.end.5822
.if.end.5822:
%.tmp5826 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5801
%.tmp5827 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5826, i32 0, i32 1
%.tmp5828 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5827
%last_item.5829 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5828, %m1861$.ScopeItem.type** %last_item.5829
%.tmp5831 = getelementptr [1 x i8], [1 x i8]*@.str5830, i32 0, i32 0
%err_buf.5832 = alloca i8*
store i8* %.tmp5831, i8** %err_buf.5832
%.tmp5833 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5829
%.tmp5834 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5833, i32 0, i32 0
%.tmp5835 = load i8*, i8** %.tmp5834
%.tmp5836 = load i8*, i8** %name
%.tmp5837 = call i32(i8*,i8*) @strcmp(i8* %.tmp5835, i8* %.tmp5836)
%.tmp5838 = icmp eq i32 %.tmp5837, 0
br i1 %.tmp5838, label %.if.true.5839, label %.if.false.5839
.if.true.5839:
%.tmp5840 = getelementptr i8*, i8** %err_buf.5832, i32 0
%.tmp5842 = getelementptr [43 x i8], [43 x i8]*@.str5841, i32 0, i32 0
%.tmp5843 = load i8*, i8** %name
%.tmp5844 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5840, i8* %.tmp5842, i8* %.tmp5843)
%.tmp5845 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5846 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5847 = load i8*, i8** %err_buf.5832
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5845, %m307$.Node.type* %.tmp5846, i8* %.tmp5847)
br label %.if.end.5839
.if.false.5839:
br label %.if.end.5839
.if.end.5839:
br label %.for.start.5848
.for.start.5848:
%.tmp5849 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5829
%.tmp5850 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5849, i32 0, i32 2
%.tmp5851 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5850
%.tmp5852 = icmp ne %m1861$.ScopeItem.type* %.tmp5851, null
br i1 %.tmp5852, label %.for.continue.5848, label %.for.else.5848
.for.continue.5848:
%.tmp5853 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5829
%.tmp5854 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5853, i32 0, i32 0
%.tmp5855 = load i8*, i8** %.tmp5854
%.tmp5856 = load i8*, i8** %name
%.tmp5857 = call i32(i8*,i8*) @strcmp(i8* %.tmp5855, i8* %.tmp5856)
%.tmp5858 = icmp eq i32 %.tmp5857, 0
br i1 %.tmp5858, label %.if.true.5859, label %.if.false.5859
.if.true.5859:
%.tmp5860 = getelementptr i8*, i8** %err_buf.5832, i32 0
%.tmp5862 = getelementptr [43 x i8], [43 x i8]*@.str5861, i32 0, i32 0
%.tmp5863 = load i8*, i8** %name
%.tmp5864 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5860, i8* %.tmp5862, i8* %.tmp5863)
%.tmp5865 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5866 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5867 = load i8*, i8** %err_buf.5832
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5865, %m307$.Node.type* %.tmp5866, i8* %.tmp5867)
br label %.for.end.5848
br label %.if.end.5859
.if.false.5859:
br label %.if.end.5859
.if.end.5859:
%.tmp5868 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5829
%.tmp5869 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5868, i32 0, i32 2
%.tmp5870 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5869
store %m1861$.ScopeItem.type* %.tmp5870, %m1861$.ScopeItem.type** %last_item.5829
br label %.for.start.5848
.for.else.5848:
%.tmp5871 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5829
%.tmp5872 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5871, i32 0, i32 2
%.tmp5873 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5806
store %m1861$.ScopeItem.type* %.tmp5873, %m1861$.ScopeItem.type** %.tmp5872
br label %.for.end.5848
.for.end.5848:
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5874 = alloca i8*
store i8* null, i8** %err_buf.5874
%.tmp5875 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5876 = load i8*, i8** %module
%.tmp5877 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5878 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5877, i32 0, i32 1
%.tmp5879 = load i8*, i8** %.tmp5878
%.tmp5880 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5875, i8* %.tmp5876, i8* %.tmp5879)
%found.5881 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5880, %m1861$.ScopeItem.type** %found.5881
%.tmp5882 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5881
%.tmp5883 = icmp eq %m1861$.ScopeItem.type* %.tmp5882, null
br i1 %.tmp5883, label %.if.true.5884, label %.if.false.5884
.if.true.5884:
%.tmp5885 = getelementptr i8*, i8** %err_buf.5874, i32 0
%.tmp5887 = getelementptr [31 x i8], [31 x i8]*@.str5886, i32 0, i32 0
%.tmp5888 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5889 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5888, i32 0, i32 1
%.tmp5890 = load i8*, i8** %.tmp5889
%.tmp5891 = load i8*, i8** %module
%.tmp5892 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5885, i8* %.tmp5887, i8* %.tmp5890, i8* %.tmp5891)
%.tmp5893 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5894 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5895 = load i8*, i8** %err_buf.5874
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5893, %m307$.Node.type* %.tmp5894, i8* %.tmp5895)
%.tmp5896 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5896
br label %.if.end.5884
.if.false.5884:
br label %.if.end.5884
.if.end.5884:
br label %.for.start.5897
.for.start.5897:
%.tmp5898 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5899 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5898, i32 0, i32 7
%.tmp5900 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5899
%.tmp5901 = icmp ne %m307$.Node.type* %.tmp5900, null
%.tmp5902 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5881
%.tmp5903 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5902, i32 0, i32 1
%.tmp5904 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5903
%.tmp5905 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5904, i32 0, i32 3
%.tmp5906 = load i8*, i8** %.tmp5905
%.tmp5908 = getelementptr [7 x i8], [7 x i8]*@.str5907, i32 0, i32 0
%.tmp5909 = call i32(i8*,i8*) @strcmp(i8* %.tmp5906, i8* %.tmp5908)
%.tmp5910 = icmp eq i32 %.tmp5909, 0
%.tmp5911 = and i1 %.tmp5901, %.tmp5910
br i1 %.tmp5911, label %.for.continue.5897, label %.for.end.5897
.for.continue.5897:
%.tmp5912 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5913 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5881
%.tmp5914 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5913, i32 0, i32 1
%.tmp5915 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5914
%.tmp5916 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5915, i32 0, i32 0
%.tmp5917 = load i8*, i8** %.tmp5916
%.tmp5918 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5919 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5918, i32 0, i32 7
%.tmp5920 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5919
%.tmp5921 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5920, i32 0, i32 7
%.tmp5922 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5921
%.tmp5923 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5912, i8* %.tmp5917, %m307$.Node.type* %.tmp5922)
store %m1861$.ScopeItem.type* %.tmp5923, %m1861$.ScopeItem.type** %found.5881
%.tmp5924 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5881
%.tmp5925 = icmp eq %m1861$.ScopeItem.type* %.tmp5924, null
br i1 %.tmp5925, label %.if.true.5926, label %.if.false.5926
.if.true.5926:
%.tmp5927 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5927
br label %.if.end.5926
.if.false.5926:
br label %.if.end.5926
.if.end.5926:
br label %.for.start.5897
.for.end.5897:
%.tmp5928 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5881
ret %m1861$.ScopeItem.type* %.tmp5928
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5929 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5930 = icmp eq %m1861$.Scope.type* %.tmp5929, null
br i1 %.tmp5930, label %.if.true.5931, label %.if.false.5931
.if.true.5931:
%.tmp5932 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5932
br label %.if.end.5931
.if.false.5931:
br label %.if.end.5931
.if.end.5931:
%.tmp5934 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5935 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5934, i32 0, i32 1
%.tmp5936 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5935
%item.5937 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5936, %m1861$.ScopeItem.type** %item.5937
br label %.for.start.5933
.for.start.5933:
%.tmp5938 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5937
%.tmp5939 = icmp ne %m1861$.ScopeItem.type* %.tmp5938, null
br i1 %.tmp5939, label %.for.continue.5933, label %.for.end.5933
.for.continue.5933:
%.tmp5940 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5937
%.tmp5941 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5940, i32 0, i32 0
%.tmp5942 = load i8*, i8** %.tmp5941
%.tmp5943 = load i8*, i8** %name
%.tmp5944 = call i32(i8*,i8*) @strcmp(i8* %.tmp5942, i8* %.tmp5943)
%.tmp5945 = icmp eq i32 %.tmp5944, 0
br i1 %.tmp5945, label %.if.true.5946, label %.if.false.5946
.if.true.5946:
%.tmp5947 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5937
ret %m1861$.ScopeItem.type* %.tmp5947
br label %.if.end.5946
.if.false.5946:
br label %.if.end.5946
.if.end.5946:
%.tmp5948 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5937
%.tmp5949 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5948, i32 0, i32 2
%.tmp5950 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5949
store %m1861$.ScopeItem.type* %.tmp5950, %m1861$.ScopeItem.type** %item.5937
br label %.for.start.5933
.for.end.5933:
%.tmp5951 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5951
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5952 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5953 = load i8*, i8** %module
%.tmp5954 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5952, i8* %.tmp5953)
%mod.5955 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5954, %m1861$.ModuleLookup.type** %mod.5955
%.tmp5956 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5955
%.tmp5957 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5956, i32 0, i32 3
%.tmp5958 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5957
%.tmp5959 = icmp ne %m1861$.Scope.type* %.tmp5958, null
%.tmp5961 = getelementptr [77 x i8], [77 x i8]*@.str5960, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5959, i8* %.tmp5961)
%.tmp5963 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5955
%.tmp5964 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5963, i32 0, i32 3
%.tmp5965 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5964
%s.5966 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5965, %m1861$.Scope.type** %s.5966
br label %.for.start.5962
.for.start.5962:
%.tmp5967 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5966
%.tmp5968 = icmp ne %m1861$.Scope.type* %.tmp5967, null
br i1 %.tmp5968, label %.for.continue.5962, label %.for.end.5962
.for.continue.5962:
%.tmp5969 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5970 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5966
%.tmp5971 = load i8*, i8** %assignable_name
%.tmp5972 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5969, %m1861$.Scope.type* %.tmp5970, i8* %.tmp5971)
%item.5973 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5972, %m1861$.ScopeItem.type** %item.5973
%.tmp5974 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5973
%.tmp5975 = icmp ne %m1861$.ScopeItem.type* %.tmp5974, null
br i1 %.tmp5975, label %.if.true.5976, label %.if.false.5976
.if.true.5976:
%.tmp5977 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5973
ret %m1861$.ScopeItem.type* %.tmp5977
br label %.if.end.5976
.if.false.5976:
br label %.if.end.5976
.if.end.5976:
%.tmp5978 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5966
%.tmp5979 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5978, i32 0, i32 5
%.tmp5980 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5979
store %m1861$.Scope.type* %.tmp5980, %m1861$.Scope.type** %s.5966
br label %.for.start.5962
.for.end.5962:
%.tmp5981 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5981
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5982 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5983 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5984 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5983, i32 0, i32 7
%.tmp5985 = load i8*, i8** %.tmp5984
%.tmp5986 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5987 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5986, i32 0, i32 6
%.tmp5988 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5987
%.tmp5989 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5982, i8* %.tmp5985, %m307$.Node.type* %.tmp5988)
ret %m1861$.ScopeItem.type* %.tmp5989
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5990 = alloca i8*
store i8* null, i8** %err_msg.5990
%buf.5991 = alloca i8*
store i8* null, i8** %buf.5991
%.tmp5992 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5993 = icmp eq %m1861$.AssignableInfo.type* %.tmp5992, null
br i1 %.tmp5993, label %.if.true.5994, label %.if.false.5994
.if.true.5994:
%.tmp5995 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5996 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5998 = getelementptr [54 x i8], [54 x i8]*@.str5997, i32 0, i32 0
%.tmp5999 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5995, %m307$.Node.type* %.tmp5996, i8* %.tmp5998)
%.tmp6000 = call i32(i8*,...) @printf(i8* %.tmp5999)
%.tmp6001 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6001
br label %.if.end.5994
.if.false.5994:
br label %.if.end.5994
.if.end.5994:
%.tmp6002 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6003 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6002, i32 0, i32 3
%.tmp6004 = load i8*, i8** %.tmp6003
%.tmp6006 = getelementptr [9 x i8], [9 x i8]*@.str6005, i32 0, i32 0
%.tmp6007 = call i32(i8*,i8*) @strcmp(i8* %.tmp6004, i8* %.tmp6006)
%.tmp6008 = icmp eq i32 %.tmp6007, 0
%.tmp6009 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6010 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6009, i32 0, i32 3
%.tmp6011 = load i8*, i8** %.tmp6010
%.tmp6013 = getelementptr [7 x i8], [7 x i8]*@.str6012, i32 0, i32 0
%.tmp6014 = call i32(i8*,i8*) @strcmp(i8* %.tmp6011, i8* %.tmp6013)
%.tmp6015 = icmp eq i32 %.tmp6014, 0
%.tmp6016 = or i1 %.tmp6008, %.tmp6015
br i1 %.tmp6016, label %.if.true.6017, label %.if.false.6017
.if.true.6017:
%.tmp6018 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6019 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6018, i32 0, i32 7
%.tmp6020 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6019
%.tmp6021 = icmp ne %m307$.Node.type* %.tmp6020, null
br i1 %.tmp6021, label %.if.true.6022, label %.if.false.6022
.if.true.6022:
%.tmp6023 = getelementptr i8*, i8** %err_msg.5990, i32 0
%.tmp6025 = getelementptr [46 x i8], [46 x i8]*@.str6024, i32 0, i32 0
%.tmp6026 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6027 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6026, i32 0, i32 7
%.tmp6028 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6027
%.tmp6029 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6028, i32 0, i32 7
%.tmp6030 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6029
%.tmp6031 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6030, i32 0, i32 1
%.tmp6032 = load i8*, i8** %.tmp6031
%.tmp6033 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6033, i32 0, i32 1
%.tmp6035 = load i8*, i8** %.tmp6034
%.tmp6036 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6023, i8* %.tmp6025, i8* %.tmp6032, i8* %.tmp6035)
%.tmp6037 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6038 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6039 = load i8*, i8** %err_msg.5990
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6037, %m307$.Node.type* %.tmp6038, i8* %.tmp6039)
%.tmp6040 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6040
br label %.if.end.6022
.if.false.6022:
br label %.if.end.6022
.if.end.6022:
%.tmp6041 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp6041
br label %.if.end.6017
.if.false.6017:
%.tmp6042 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6043 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6042, i32 0, i32 3
%.tmp6044 = load i8*, i8** %.tmp6043
%.tmp6046 = getelementptr [9 x i8], [9 x i8]*@.str6045, i32 0, i32 0
%.tmp6047 = call i32(i8*,i8*) @strcmp(i8* %.tmp6044, i8* %.tmp6046)
%.tmp6048 = icmp eq i32 %.tmp6047, 0
%.tmp6049 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6050 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6049, i32 0, i32 7
%.tmp6051 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6050
%.tmp6052 = icmp ne %m307$.Node.type* %.tmp6051, null
%.tmp6053 = and i1 %.tmp6048, %.tmp6052
br i1 %.tmp6053, label %.if.true.6054, label %.if.false.6054
.if.true.6054:
%.tmp6055 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.6056 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6055, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6058 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6057, i32 0, i32 4
%.tmp6059 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6058
%struct_info.6060 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6059, %m1861$.Type.type** %struct_info.6060
br label %.for.start.6061
.for.start.6061:
%.tmp6062 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6063 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6062, i32 0, i32 4
%.tmp6064 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6063
%.tmp6065 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6064, i32 0, i32 0
%.tmp6066 = load i8*, i8** %.tmp6065
%.tmp6068 = getelementptr [4 x i8], [4 x i8]*@.str6067, i32 0, i32 0
%.tmp6069 = call i32(i8*,i8*) @strcmp(i8* %.tmp6066, i8* %.tmp6068)
%.tmp6070 = icmp eq i32 %.tmp6069, 0
br i1 %.tmp6070, label %.for.continue.6061, label %.for.end.6061
.for.continue.6061:
%.tmp6071 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6072 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6071)
%new_base.6073 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6072, %m1861$.AssignableInfo.type** %new_base.6073
%.tmp6074 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6075 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6073
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6074, %m1861$.AssignableInfo.type* %.tmp6075)
%.tmp6076 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6073
%.tmp6077 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6076, i32 0, i32 4
%.tmp6078 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6079 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6078, i32 0, i32 4
%.tmp6080 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6079
%.tmp6081 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6080, i32 0, i32 3
%.tmp6082 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6081
store %m1861$.Type.type* %.tmp6082, %m1861$.Type.type** %.tmp6077
%.tmp6083 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6084 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6083, i32 0, i32 1
%.tmp6085 = load %m0$.File.type*, %m0$.File.type** %.tmp6084
%.tmp6087 = getelementptr [23 x i8], [23 x i8]*@.str6086, i32 0, i32 0
%.tmp6088 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6073
%.tmp6089 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6088)
%.tmp6090 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6073
%.tmp6092 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6091, i32 0, i32 4
%.tmp6093 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6092
%.tmp6094 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6090, %m1861$.Type.type* %.tmp6093)
%.tmp6095 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6096 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6097 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6096, i32 0, i32 4
%.tmp6098 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6097
%.tmp6099 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6095, %m1861$.Type.type* %.tmp6098)
%.tmp6100 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6101 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6100)
%.tmp6102 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6085, i8* %.tmp6087, i8* %.tmp6089, i8* %.tmp6094, i8* %.tmp6099, i8* %.tmp6101)
%.tmp6103 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6073
store %m1861$.AssignableInfo.type* %.tmp6103, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6104 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.6060
%.tmp6105 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6104, i32 0, i32 3
%.tmp6106 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6105
store %m1861$.Type.type* %.tmp6106, %m1861$.Type.type** %struct_info.6060
br label %.for.start.6061
.for.end.6061:
%.tmp6107 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.6060
%.tmp6108 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6107, i32 0, i32 0
%.tmp6109 = load i8*, i8** %.tmp6108
%.tmp6111 = getelementptr [10 x i8], [10 x i8]*@.str6110, i32 0, i32 0
%.tmp6112 = call i32(i8*,i8*) @strcmp(i8* %.tmp6109, i8* %.tmp6111)
%.tmp6113 = icmp eq i32 %.tmp6112, 0
br i1 %.tmp6113, label %.if.true.6114, label %.if.false.6114
.if.true.6114:
%.tmp6115 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.6060
%.tmp6116 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6115, i32 0, i32 3
%.tmp6117 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6116
store %m1861$.Type.type* %.tmp6117, %m1861$.Type.type** %struct_info.6060
br label %.if.end.6114
.if.false.6114:
br label %.if.end.6114
.if.end.6114:
%.tmp6118 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.6060
%.tmp6119 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6118, i32 0, i32 0
%.tmp6120 = load i8*, i8** %.tmp6119
%.tmp6122 = getelementptr [7 x i8], [7 x i8]*@.str6121, i32 0, i32 0
%.tmp6123 = call i32(i8*,i8*) @strcmp(i8* %.tmp6120, i8* %.tmp6122)
%.tmp6124 = icmp ne i32 %.tmp6123, 0
br i1 %.tmp6124, label %.if.true.6125, label %.if.false.6125
.if.true.6125:
%.tmp6126 = getelementptr i8*, i8** %err_msg.5990, i32 0
%.tmp6128 = getelementptr [48 x i8], [48 x i8]*@.str6127, i32 0, i32 0
%.tmp6129 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6130 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6129, i32 0, i32 7
%.tmp6131 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6130
%.tmp6132 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6131, i32 0, i32 7
%.tmp6133 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6132
%.tmp6134 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6133, i32 0, i32 1
%.tmp6135 = load i8*, i8** %.tmp6134
%.tmp6136 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6137 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6136, i32 0, i32 1
%.tmp6138 = load i8*, i8** %.tmp6137
%.tmp6139 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6126, i8* %.tmp6128, i8* %.tmp6135, i8* %.tmp6138)
%.tmp6140 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6141 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6142 = load i8*, i8** %err_msg.5990
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6140, %m307$.Node.type* %.tmp6141, i8* %.tmp6142)
%.tmp6143 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6143
br label %.if.end.6125
.if.false.6125:
br label %.if.end.6125
.if.end.6125:
%.tmp6144 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6145 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6144, i32 0, i32 7
%.tmp6146 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6145
%.tmp6147 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6146, i32 0, i32 7
%.tmp6148 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6147
%.tmp6149 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6148, i32 0, i32 1
%.tmp6150 = load i8*, i8** %.tmp6149
%field_name.6151 = alloca i8*
store i8* %.tmp6150, i8** %field_name.6151
%field_id.6152 = alloca i32
store i32 0, i32* %field_id.6152
%.tmp6153 = bitcast ptr null to %m1861$.Type.type*
%found_field.6154 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6153, %m1861$.Type.type** %found_field.6154
%.tmp6156 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.6060
%.tmp6157 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6156, i32 0, i32 3
%.tmp6158 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6157
%field.6159 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6158, %m1861$.Type.type** %field.6159
br label %.for.start.6155
.for.start.6155:
%.tmp6160 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6159
%.tmp6161 = icmp ne %m1861$.Type.type* %.tmp6160, null
br i1 %.tmp6161, label %.for.continue.6155, label %.for.end.6155
.for.continue.6155:
%.tmp6162 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6159
%.tmp6163 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6162, i32 0, i32 1
%.tmp6164 = load i8*, i8** %.tmp6163
%.tmp6165 = load i8*, i8** %field_name.6151
%.tmp6166 = call i32(i8*,i8*) @strcmp(i8* %.tmp6164, i8* %.tmp6165)
%.tmp6167 = icmp eq i32 %.tmp6166, 0
br i1 %.tmp6167, label %.if.true.6168, label %.if.false.6168
.if.true.6168:
%.tmp6169 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6159
store %m1861$.Type.type* %.tmp6169, %m1861$.Type.type** %found_field.6154
br label %.for.end.6155
br label %.if.end.6168
.if.false.6168:
%.tmp6170 = load i32, i32* %field_id.6152
%.tmp6171 = add i32 %.tmp6170, 1
store i32 %.tmp6171, i32* %field_id.6152
br label %.if.end.6168
.if.end.6168:
%.tmp6172 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6159
%.tmp6173 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6172, i32 0, i32 4
%.tmp6174 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6173
store %m1861$.Type.type* %.tmp6174, %m1861$.Type.type** %field.6159
br label %.for.start.6155
.for.end.6155:
%.tmp6175 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.6154
%.tmp6176 = icmp eq %m1861$.Type.type* %.tmp6175, null
br i1 %.tmp6176, label %.if.true.6177, label %.if.false.6177
.if.true.6177:
%.tmp6178 = getelementptr i8*, i8** %err_msg.5990, i32 0
%.tmp6180 = getelementptr [34 x i8], [34 x i8]*@.str6179, i32 0, i32 0
%.tmp6181 = load i8*, i8** %field_name.6151
%.tmp6182 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6183 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6182, i32 0, i32 1
%.tmp6184 = load i8*, i8** %.tmp6183
%.tmp6185 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6178, i8* %.tmp6180, i8* %.tmp6181, i8* %.tmp6184)
%.tmp6186 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6187 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6188 = load i8*, i8** %err_msg.5990
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6186, %m307$.Node.type* %.tmp6187, i8* %.tmp6188)
%.tmp6189 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6189
br label %.if.end.6177
.if.false.6177:
br label %.if.end.6177
.if.end.6177:
%.tmp6190 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6191 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6190)
%new_info.6192 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6191, %m1861$.AssignableInfo.type** %new_info.6192
%.tmp6193 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6192
%.tmp6194 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6193, i32 0, i32 4
%.tmp6195 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.6154
store %m1861$.Type.type* %.tmp6195, %m1861$.Type.type** %.tmp6194
%.tmp6196 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6197 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6192
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6196, %m1861$.AssignableInfo.type* %.tmp6197)
%.tmp6198 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6192
%.tmp6199 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6198, i32 0, i32 3
%.tmp6201 = getelementptr [9 x i8], [9 x i8]*@.str6200, i32 0, i32 0
store i8* %.tmp6201, i8** %.tmp6199
%.tmp6202 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6203 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6204 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6203, i32 0, i32 4
%.tmp6205 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6204
%.tmp6206 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6202, %m1861$.Type.type* %.tmp6205)
%info_tr.6207 = alloca i8*
store i8* %.tmp6206, i8** %info_tr.6207
%.tmp6208 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6209 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6208, i32 0, i32 1
%.tmp6210 = load %m0$.File.type*, %m0$.File.type** %.tmp6209
%.tmp6212 = getelementptr [46 x i8], [46 x i8]*@.str6211, i32 0, i32 0
%.tmp6213 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6192
%.tmp6214 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6213)
%.tmp6215 = load i8*, i8** %info_tr.6207
%.tmp6216 = load i8*, i8** %info_tr.6207
%.tmp6217 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.6056
%.tmp6218 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6217)
%.tmp6219 = load i32, i32* %field_id.6152
%.tmp6220 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6210, i8* %.tmp6212, i8* %.tmp6214, i8* %.tmp6215, i8* %.tmp6216, i8* %.tmp6218, i32 %.tmp6219)
%.tmp6221 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6222 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6223 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6222, i32 0, i32 7
%.tmp6224 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6223
%.tmp6225 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6224, i32 0, i32 7
%.tmp6226 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6225
%.tmp6227 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6192
%.tmp6228 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6221, %m307$.Node.type* %.tmp6226, %m1861$.AssignableInfo.type* %.tmp6227)
ret %m1861$.AssignableInfo.type* %.tmp6228
br label %.if.end.6054
.if.false.6054:
%.tmp6229 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6230 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6229, i32 0, i32 3
%.tmp6231 = load i8*, i8** %.tmp6230
%.tmp6233 = getelementptr [9 x i8], [9 x i8]*@.str6232, i32 0, i32 0
%.tmp6234 = call i32(i8*,i8*) @strcmp(i8* %.tmp6231, i8* %.tmp6233)
%.tmp6235 = icmp eq i32 %.tmp6234, 0
br i1 %.tmp6235, label %.if.true.6236, label %.if.false.6236
.if.true.6236:
%.tmp6237 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp6237
br label %.if.end.6236
.if.false.6236:
br label %.if.end.6236
.if.end.6236:
br label %.if.end.6054
.if.end.6054:
br label %.if.end.6017
.if.end.6017:
%.tmp6238 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6239 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6241 = getelementptr [43 x i8], [43 x i8]*@.str6240, i32 0, i32 0
%.tmp6242 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6238, %m307$.Node.type* %.tmp6239, i8* %.tmp6241)
%.tmp6243 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6244 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6243, i32 0, i32 3
%.tmp6245 = load i8*, i8** %.tmp6244
%.tmp6246 = call i32(i8*,...) @printf(i8* %.tmp6242, i8* %.tmp6245)
%.tmp6247 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6247
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.6248 = alloca i8*
store i8* null, i8** %err_msg.6248
%.tmp6249 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.6250 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6249, %m307$.Node.type** %curr_node.6250
%.tmp6251 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6252 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6251, i32 0, i32 0
%.tmp6253 = load i8*, i8** %.tmp6252
%.tmp6255 = getelementptr [17 x i8], [17 x i8]*@.str6254, i32 0, i32 0
%.tmp6256 = call i32(i8*,i8*) @strcmp(i8* %.tmp6253, i8* %.tmp6255)
%.tmp6257 = icmp eq i32 %.tmp6256, 0
%.tmp6258 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6259 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6258, i32 0, i32 0
%.tmp6260 = load i8*, i8** %.tmp6259
%.tmp6262 = getelementptr [16 x i8], [16 x i8]*@.str6261, i32 0, i32 0
%.tmp6263 = call i32(i8*,i8*) @strcmp(i8* %.tmp6260, i8* %.tmp6262)
%.tmp6264 = icmp eq i32 %.tmp6263, 0
%.tmp6265 = or i1 %.tmp6257, %.tmp6264
%.tmp6266 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6267 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6266, i32 0, i32 0
%.tmp6268 = load i8*, i8** %.tmp6267
%.tmp6270 = getelementptr [11 x i8], [11 x i8]*@.str6269, i32 0, i32 0
%.tmp6271 = call i32(i8*,i8*) @strcmp(i8* %.tmp6268, i8* %.tmp6270)
%.tmp6272 = icmp eq i32 %.tmp6271, 0
%.tmp6273 = or i1 %.tmp6265, %.tmp6272
br i1 %.tmp6273, label %.if.true.6274, label %.if.false.6274
.if.true.6274:
%.tmp6275 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6276 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6277 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6276, i32 0, i32 6
%.tmp6278 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6277
%.tmp6279 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6275, %m307$.Node.type* %.tmp6278)
ret %m1861$.AssignableInfo.type* %.tmp6279
br label %.if.end.6274
.if.false.6274:
br label %.if.end.6274
.if.end.6274:
%.tmp6280 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6281 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6280, i32 0, i32 0
%.tmp6282 = load i8*, i8** %.tmp6281
%.tmp6284 = getelementptr [12 x i8], [12 x i8]*@.str6283, i32 0, i32 0
%.tmp6285 = call i32(i8*,i8*) @strcmp(i8* %.tmp6282, i8* %.tmp6284)
%.tmp6286 = icmp ne i32 %.tmp6285, 0
br i1 %.tmp6286, label %.if.true.6287, label %.if.false.6287
.if.true.6287:
%.tmp6289 = getelementptr [92 x i8], [92 x i8]*@.str6288, i32 0, i32 0
%.tmp6290 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6291 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6290, i32 0, i32 0
%.tmp6292 = load i8*, i8** %.tmp6291
%.tmp6293 = call i32(i8*,...) @printf(i8* %.tmp6289, i8* %.tmp6292)
%.tmp6294 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6295 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6294, i32 0, i32 6
%.tmp6296 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6295
store %m307$.Node.type* %.tmp6296, %m307$.Node.type** %curr_node.6250
br label %.if.end.6287
.if.false.6287:
br label %.if.end.6287
.if.end.6287:
%.tmp6297 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6298 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6297, i32 0, i32 6
%.tmp6299 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6298
%assignable_name.6300 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6299, %m307$.Node.type** %assignable_name.6300
%.tmp6301 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6302 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6303 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6302, i32 0, i32 7
%.tmp6304 = load i8*, i8** %.tmp6303
%.tmp6305 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6305, i32 0, i32 6
%.tmp6307 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6306
%.tmp6308 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6307, i32 0, i32 1
%.tmp6309 = load i8*, i8** %.tmp6308
%.tmp6310 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6301, i8* %.tmp6304, i8* %.tmp6309)
%scope_info.6311 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp6310, %m1861$.ScopeItem.type** %scope_info.6311
%.tmp6312 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6311
%.tmp6313 = icmp eq %m1861$.ScopeItem.type* %.tmp6312, null
br i1 %.tmp6313, label %.if.true.6314, label %.if.false.6314
.if.true.6314:
%.tmp6315 = getelementptr i8*, i8** %err_msg.6248, i32 0
%.tmp6317 = getelementptr [41 x i8], [41 x i8]*@.str6316, i32 0, i32 0
%.tmp6318 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6319 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6318, i32 0, i32 6
%.tmp6320 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6319
%.tmp6321 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6320, i32 0, i32 1
%.tmp6322 = load i8*, i8** %.tmp6321
%.tmp6323 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6315, i8* %.tmp6317, i8* %.tmp6322)
%.tmp6324 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6325 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6326 = load i8*, i8** %err_msg.6248
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6324, %m307$.Node.type* %.tmp6325, i8* %.tmp6326)
%.tmp6327 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6327
br label %.if.end.6314
.if.false.6314:
br label %.if.end.6314
.if.end.6314:
%.tmp6328 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6311
%.tmp6329 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6328, i32 0, i32 1
%.tmp6330 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6329
%info.6331 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6330, %m1861$.AssignableInfo.type** %info.6331
%.tmp6332 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6331
%.tmp6333 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6332, i32 0, i32 3
%.tmp6334 = load i8*, i8** %.tmp6333
%.tmp6336 = getelementptr [7 x i8], [7 x i8]*@.str6335, i32 0, i32 0
%.tmp6337 = call i32(i8*,i8*) @strcmp(i8* %.tmp6334, i8* %.tmp6336)
%.tmp6338 = icmp eq i32 %.tmp6337, 0
br i1 %.tmp6338, label %.if.true.6339, label %.if.false.6339
.if.true.6339:
%.tmp6340 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6341 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6331
%.tmp6342 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6341)
%.tmp6343 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6344 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6343, i32 0, i32 6
%.tmp6345 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6344
%.tmp6346 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6345, i32 0, i32 7
%.tmp6347 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6346
%.tmp6348 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6347, i32 0, i32 7
%.tmp6349 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6348
%.tmp6350 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6349, i32 0, i32 1
%.tmp6351 = load i8*, i8** %.tmp6350
%.tmp6352 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6340, i8* %.tmp6342, i8* %.tmp6351)
store %m1861$.ScopeItem.type* %.tmp6352, %m1861$.ScopeItem.type** %scope_info.6311
%.tmp6353 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6311
%.tmp6354 = icmp eq %m1861$.ScopeItem.type* %.tmp6353, null
br i1 %.tmp6354, label %.if.true.6355, label %.if.false.6355
.if.true.6355:
%.tmp6356 = getelementptr i8*, i8** %err_msg.6248, i32 0
%.tmp6358 = getelementptr [31 x i8], [31 x i8]*@.str6357, i32 0, i32 0
%.tmp6359 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6360 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6359, i32 0, i32 6
%.tmp6361 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6360
%.tmp6362 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6361, i32 0, i32 7
%.tmp6363 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6362
%.tmp6364 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6363, i32 0, i32 7
%.tmp6365 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6364
%.tmp6366 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6365, i32 0, i32 1
%.tmp6367 = load i8*, i8** %.tmp6366
%.tmp6368 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6331
%.tmp6369 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6368)
%.tmp6370 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6356, i8* %.tmp6358, i8* %.tmp6367, i8* %.tmp6369)
%.tmp6371 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6372 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6373 = load i8*, i8** %err_msg.6248
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6371, %m307$.Node.type* %.tmp6372, i8* %.tmp6373)
%.tmp6374 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6374
br label %.if.end.6355
.if.false.6355:
br label %.if.end.6355
.if.end.6355:
%.tmp6375 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6311
%.tmp6376 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6375, i32 0, i32 1
%.tmp6377 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6376
store %m1861$.AssignableInfo.type* %.tmp6377, %m1861$.AssignableInfo.type** %info.6331
%.tmp6378 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6379 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6378, i32 0, i32 6
%.tmp6380 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6379
%.tmp6381 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6380, i32 0, i32 7
%.tmp6382 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6381
%.tmp6383 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6382, i32 0, i32 7
%.tmp6384 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6383
store %m307$.Node.type* %.tmp6384, %m307$.Node.type** %assignable_name.6300
br label %.if.end.6339
.if.false.6339:
%.tmp6385 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6386 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6385, i32 0, i32 6
%.tmp6387 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6386
store %m307$.Node.type* %.tmp6387, %m307$.Node.type** %assignable_name.6300
br label %.if.end.6339
.if.end.6339:
%.tmp6388 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6389 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6300
%.tmp6390 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6331
%.tmp6391 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6388, %m307$.Node.type* %.tmp6389, %m1861$.AssignableInfo.type* %.tmp6390)
%base.6392 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6391, %m1861$.AssignableInfo.type** %base.6392
%.tmp6394 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6395 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6394, i32 0, i32 6
%.tmp6396 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6395
%.tmp6397 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6396, i32 0, i32 7
%.tmp6398 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6397
%addr.6399 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6398, %m307$.Node.type** %addr.6399
br label %.for.start.6393
.for.start.6393:
%.tmp6400 = load %m307$.Node.type*, %m307$.Node.type** %addr.6399
%.tmp6401 = icmp ne %m307$.Node.type* %.tmp6400, null
br i1 %.tmp6401, label %.for.continue.6393, label %.for.end.6393
.for.continue.6393:
%.tmp6402 = load %m307$.Node.type*, %m307$.Node.type** %addr.6399
%.tmp6403 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6402, i32 0, i32 7
%.tmp6404 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6403
%index.6405 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6404, %m307$.Node.type** %index.6405
%.tmp6406 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6407 = load %m307$.Node.type*, %m307$.Node.type** %index.6405
%.tmp6408 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6406, %m307$.Node.type* %.tmp6407)
%index_info.6409 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6408, %m1861$.AssignableInfo.type** %index_info.6409
%.tmp6410 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6411 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6409
%.tmp6412 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6411, i32 0, i32 4
%.tmp6413 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6412
%.tmp6414 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6410, %m1861$.Type.type* %.tmp6413)
%index_type.6415 = alloca i8*
store i8* %.tmp6414, i8** %index_type.6415
%.tmp6416 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6417 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6416, i32 0, i32 4
%.tmp6418 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6417
%.tmp6419 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6418, i32 0, i32 1
%.tmp6420 = load i8*, i8** %.tmp6419
%.tmp6421 = icmp ne i8* %.tmp6420, null
br i1 %.tmp6421, label %.if.true.6422, label %.if.false.6422
.if.true.6422:
%.tmp6423 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6424 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6423, i32 0, i32 4
%.tmp6425 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6424
%.tmp6426 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6425, i32 0, i32 1
%.tmp6427 = load i8*, i8** %.tmp6426
%.tmp6429 = getelementptr [6 x i8], [6 x i8]*@.str6428, i32 0, i32 0
%.tmp6430 = call i32(i8*,i8*) @strcmp(i8* %.tmp6427, i8* %.tmp6429)
%.tmp6431 = icmp eq i32 %.tmp6430, 0
br i1 %.tmp6431, label %.if.true.6432, label %.if.false.6432
.if.true.6432:
%.tmp6433 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6434 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6433)
%new_base.6435 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6434, %m1861$.AssignableInfo.type** %new_base.6435
%.tmp6436 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6437 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6435
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6436, %m1861$.AssignableInfo.type* %.tmp6437)
%.tmp6438 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6439 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6438, i32 0, i32 1
%.tmp6440 = load %m0$.File.type*, %m0$.File.type** %.tmp6439
%.tmp6442 = getelementptr [45 x i8], [45 x i8]*@.str6441, i32 0, i32 0
%.tmp6443 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6435
%.tmp6444 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6443)
%.tmp6445 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6446 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6447 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6446, i32 0, i32 4
%.tmp6448 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6447
%.tmp6449 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6445, %m1861$.Type.type* %.tmp6448)
%.tmp6450 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6451 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6452 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6451, i32 0, i32 4
%.tmp6453 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6452
%.tmp6454 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6450, %m1861$.Type.type* %.tmp6453)
%.tmp6455 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6456 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6455)
%.tmp6457 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6440, i8* %.tmp6442, i8* %.tmp6444, i8* %.tmp6449, i8* %.tmp6454, i8* %.tmp6456)
%.tmp6458 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6435
%.tmp6459 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6458, i32 0, i32 4
%.tmp6460 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6461 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6460, i32 0, i32 4
%.tmp6462 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6461
%.tmp6463 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6462, i32 0, i32 3
%.tmp6464 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6463
%.tmp6465 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp6464)
store %m1861$.Type.type* %.tmp6465, %m1861$.Type.type** %.tmp6459
%.tmp6466 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6435
%.tmp6467 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6466, i32 0, i32 4
%.tmp6468 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6467
%.tmp6469 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6468, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6469
%.tmp6470 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6435
store %m1861$.AssignableInfo.type* %.tmp6470, %m1861$.AssignableInfo.type** %base.6392
br label %.if.end.6432
.if.false.6432:
br label %.if.end.6432
.if.end.6432:
br label %.if.end.6422
.if.false.6422:
br label %.if.end.6422
.if.end.6422:
%.tmp6471 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6472 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6473 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6472, i32 0, i32 4
%.tmp6474 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6473
%.tmp6475 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6471, %m1861$.Type.type* %.tmp6474)
%base_type.6476 = alloca i8*
store i8* %.tmp6475, i8** %base_type.6476
%.tmp6477 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6478 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6477)
%tmp_id.6479 = alloca i32
store i32 %.tmp6478, i32* %tmp_id.6479
%.tmp6480 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6481 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6480, i32 0, i32 1
%.tmp6482 = load %m0$.File.type*, %m0$.File.type** %.tmp6481
%.tmp6484 = getelementptr [28 x i8], [28 x i8]*@.str6483, i32 0, i32 0
%.tmp6485 = load i32, i32* %tmp_id.6479
%.tmp6486 = load i8*, i8** %base_type.6476
%.tmp6487 = load i8*, i8** %base_type.6476
%.tmp6488 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6489 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6488)
%.tmp6490 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6482, i8* %.tmp6484, i32 %.tmp6485, i8* %.tmp6486, i8* %.tmp6487, i8* %.tmp6489)
%.tmp6491 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6250
%.tmp6492 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6491)
%new_base.6493 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6492, %m1861$.AssignableInfo.type** %new_base.6493
%.tmp6494 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6493
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6494, %m1861$.AssignableInfo.type* %.tmp6495)
%.tmp6496 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6497 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6496, i32 0, i32 4
%.tmp6498 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6497
%.tmp6499 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6498, i32 0, i32 3
%.tmp6500 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6499
%.tmp6501 = icmp eq %m1861$.Type.type* %.tmp6500, null
br i1 %.tmp6501, label %.if.true.6502, label %.if.false.6502
.if.true.6502:
%.tmp6503 = getelementptr i8*, i8** %err_msg.6248, i32 0
%.tmp6505 = getelementptr [35 x i8], [35 x i8]*@.str6504, i32 0, i32 0
%.tmp6506 = load i8*, i8** %base_type.6476
%.tmp6507 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6503, i8* %.tmp6505, i8* %.tmp6506)
%.tmp6508 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6509 = load %m307$.Node.type*, %m307$.Node.type** %addr.6399
%.tmp6510 = load i8*, i8** %err_msg.6248
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6508, %m307$.Node.type* %.tmp6509, i8* %.tmp6510)
%.tmp6511 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
ret %m1861$.AssignableInfo.type* %.tmp6511
br label %.if.end.6502
.if.false.6502:
br label %.if.end.6502
.if.end.6502:
%.tmp6512 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6493
%.tmp6513 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6512, i32 0, i32 4
%.tmp6514 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
%.tmp6515 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6514, i32 0, i32 4
%.tmp6516 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6515
%.tmp6517 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6516, i32 0, i32 3
%.tmp6518 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6517
store %m1861$.Type.type* %.tmp6518, %m1861$.Type.type** %.tmp6513
%.tmp6519 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6520 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6493
%.tmp6521 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6520, i32 0, i32 4
%.tmp6522 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6521
%.tmp6523 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6519, %m1861$.Type.type* %.tmp6522)
%base_type_2.6524 = alloca i8*
store i8* %.tmp6523, i8** %base_type_2.6524
%.tmp6525 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6526 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6525, i32 0, i32 1
%.tmp6527 = load %m0$.File.type*, %m0$.File.type** %.tmp6526
%.tmp6529 = getelementptr [44 x i8], [44 x i8]*@.str6528, i32 0, i32 0
%.tmp6530 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6493
%.tmp6531 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6530)
%.tmp6532 = load i8*, i8** %base_type_2.6524
%.tmp6533 = load i8*, i8** %base_type_2.6524
%.tmp6534 = load i32, i32* %tmp_id.6479
%.tmp6535 = load i8*, i8** %index_type.6415
%.tmp6536 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6409
%.tmp6537 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6536)
%.tmp6538 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6527, i8* %.tmp6529, i8* %.tmp6531, i8* %.tmp6532, i8* %.tmp6533, i32 %.tmp6534, i8* %.tmp6535, i8* %.tmp6537)
%.tmp6539 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6493
store %m1861$.AssignableInfo.type* %.tmp6539, %m1861$.AssignableInfo.type** %base.6392
%.tmp6540 = load %m307$.Node.type*, %m307$.Node.type** %addr.6399
%.tmp6541 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6540, i32 0, i32 7
%.tmp6542 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6541
%.tmp6543 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6542, i32 0, i32 7
%.tmp6544 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6543
%.tmp6545 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6544, i32 0, i32 7
%.tmp6546 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6545
store %m307$.Node.type* %.tmp6546, %m307$.Node.type** %addr.6399
br label %.for.start.6393
.for.end.6393:
%.tmp6547 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6392
ret %m1861$.AssignableInfo.type* %.tmp6547
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6548 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6549 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6548, i32 0, i32 6
%.tmp6550 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6549
%.tmp6552 = getelementptr [16 x i8], [16 x i8]*@.str6551, i32 0, i32 0
%.tmp6553 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6550, i8* %.tmp6552)
%assignable_start.6554 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6553, %m307$.Node.type** %assignable_start.6554
%.tmp6555 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6554
%.tmp6556 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6555)
%operator_stack.6557 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6556, %m1988$.SYStack.type** %operator_stack.6557
%.tmp6558 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6559 = ptrtoint %m1861$.StackHead.type* %.tmp6558 to i32
%.tmp6560 = call i8*(i32) @malloc(i32 %.tmp6559)
%.tmp6561 = bitcast i8* %.tmp6560 to %m1861$.StackHead.type*
%stack.6562 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6561, %m1861$.StackHead.type** %stack.6562
%.tmp6563 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6562
%.tmp6564 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6563, i32 0, i32 0
%.tmp6565 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6557
store %m1988$.SYStack.type* %.tmp6565, %m1988$.SYStack.type** %.tmp6564
%.tmp6566 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6567 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6562
%.tmp6568 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6566, %m1861$.StackHead.type* %.tmp6567)
%info.6569 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6568, %m1861$.AssignableInfo.type** %info.6569
%.tmp6570 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6571 = icmp eq %m1861$.AssignableInfo.type* %.tmp6570, null
br i1 %.tmp6571, label %.if.true.6572, label %.if.false.6572
.if.true.6572:
%.tmp6573 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
ret %m1861$.AssignableInfo.type* %.tmp6573
br label %.if.end.6572
.if.false.6572:
br label %.if.end.6572
.if.end.6572:
%.tmp6574 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6575 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6574, i32 0, i32 6
%.tmp6576 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6575
%.tmp6578 = getelementptr [5 x i8], [5 x i8]*@.str6577, i32 0, i32 0
%.tmp6579 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6576, i8* %.tmp6578)
%cast.6580 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6579, %m307$.Node.type** %cast.6580
%.tmp6581 = load %m307$.Node.type*, %m307$.Node.type** %cast.6580
%.tmp6582 = icmp ne %m307$.Node.type* %.tmp6581, null
br i1 %.tmp6582, label %.if.true.6583, label %.if.false.6583
.if.true.6583:
%.tmp6584 = load %m307$.Node.type*, %m307$.Node.type** %cast.6580
%.tmp6585 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6584, i32 0, i32 6
%.tmp6586 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6585
%.tmp6588 = getelementptr [5 x i8], [5 x i8]*@.str6587, i32 0, i32 0
%.tmp6589 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6586, i8* %.tmp6588)
%cast_type.6590 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6589, %m307$.Node.type** %cast_type.6590
%.tmp6591 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6592 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6590
%.tmp6593 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6592, i32 0, i32 6
%.tmp6594 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6593
%.tmp6595 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6591, %m307$.Node.type* %.tmp6594)
%type.6596 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6595, %m1861$.Type.type** %type.6596
%.tmp6597 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6598 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6597)
%prev_id.6599 = alloca i8*
store i8* %.tmp6598, i8** %prev_id.6599
%.tmp6600 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6601 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6600, %m1861$.AssignableInfo.type* %.tmp6601)
%.tmp6602 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6603 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6604 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6603, i32 0, i32 4
%.tmp6605 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6604
%.tmp6606 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6602, %m1861$.Type.type* %.tmp6605)
%from_type.6607 = alloca i8*
store i8* %.tmp6606, i8** %from_type.6607
%.tmp6608 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6609 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6596
%.tmp6610 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6608, %m1861$.Type.type* %.tmp6609)
%to_type.6611 = alloca i8*
store i8* %.tmp6610, i8** %to_type.6611
%.tmp6613 = getelementptr [8 x i8], [8 x i8]*@.str6612, i32 0, i32 0
%cast_fn.6614 = alloca i8*
store i8* %.tmp6613, i8** %cast_fn.6614
%.tmp6615 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6616 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6615, i32 0, i32 4
%.tmp6617 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6616
%.tmp6618 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6617, i32 0, i32 1
%.tmp6619 = load i8*, i8** %.tmp6618
%.tmp6620 = icmp ne i8* %.tmp6619, null
br i1 %.tmp6620, label %.if.true.6621, label %.if.false.6621
.if.true.6621:
%.tmp6622 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6623 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6622, i32 0, i32 4
%.tmp6624 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6623
%.tmp6625 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6624, i32 0, i32 1
%.tmp6626 = load i8*, i8** %.tmp6625
%.tmp6628 = getelementptr [6 x i8], [6 x i8]*@.str6627, i32 0, i32 0
%.tmp6629 = call i32(i8*,i8*) @strcmp(i8* %.tmp6626, i8* %.tmp6628)
%.tmp6630 = icmp eq i32 %.tmp6629, 0
br i1 %.tmp6630, label %.if.true.6631, label %.if.false.6631
.if.true.6631:
%.tmp6633 = getelementptr [16 x i8], [16 x i8]*@.str6632, i32 0, i32 0
%.tmp6634 = call i32(i8*,...) @printf(i8* %.tmp6633)
br label %.if.end.6631
.if.false.6631:
br label %.if.end.6631
.if.end.6631:
br label %.if.end.6621
.if.false.6621:
br label %.if.end.6621
.if.end.6621:
%.tmp6635 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6636 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6635, i32 0, i32 4
%.tmp6637 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6636
%.tmp6638 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6637, i32 0, i32 0
%.tmp6639 = load i8*, i8** %.tmp6638
%.tmp6641 = getelementptr [4 x i8], [4 x i8]*@.str6640, i32 0, i32 0
%.tmp6642 = call i32(i8*,i8*) @strcmp(i8* %.tmp6639, i8* %.tmp6641)
%.tmp6643 = icmp ne i32 %.tmp6642, 0
%.tmp6644 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6596
%.tmp6645 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6644, i32 0, i32 0
%.tmp6646 = load i8*, i8** %.tmp6645
%.tmp6648 = getelementptr [4 x i8], [4 x i8]*@.str6647, i32 0, i32 0
%.tmp6649 = call i32(i8*,i8*) @strcmp(i8* %.tmp6646, i8* %.tmp6648)
%.tmp6650 = icmp ne i32 %.tmp6649, 0
%.tmp6651 = and i1 %.tmp6643, %.tmp6650
br i1 %.tmp6651, label %.if.true.6652, label %.if.false.6652
.if.true.6652:
%.tmp6653 = load i8*, i8** %from_type.6607
%.tmp6654 = getelementptr i8, i8* %.tmp6653, i32 0
%.tmp6655 = load i8, i8* %.tmp6654
%.tmp6656 = icmp eq i8 %.tmp6655, 105
%.tmp6657 = load i8*, i8** %to_type.6611
%.tmp6658 = getelementptr i8, i8* %.tmp6657, i32 0
%.tmp6659 = load i8, i8* %.tmp6658
%.tmp6660 = icmp eq i8 %.tmp6659, 105
%.tmp6661 = and i1 %.tmp6656, %.tmp6660
br i1 %.tmp6661, label %.if.true.6662, label %.if.false.6662
.if.true.6662:
%from_size.6663 = alloca i32
store i32 0, i32* %from_size.6663
%to_size.6664 = alloca i32
store i32 0, i32* %to_size.6664
%.tmp6665 = load i8*, i8** %from_type.6607
%.tmp6667 = getelementptr [4 x i8], [4 x i8]*@.str6666, i32 0, i32 0
%.tmp6668 = getelementptr i32, i32* %from_size.6663, i32 0
%.tmp6669 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6665, i8* %.tmp6667, i32* %.tmp6668)
%.tmp6670 = load i8*, i8** %to_type.6611
%.tmp6672 = getelementptr [4 x i8], [4 x i8]*@.str6671, i32 0, i32 0
%.tmp6673 = getelementptr i32, i32* %to_size.6664, i32 0
%.tmp6674 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6670, i8* %.tmp6672, i32* %.tmp6673)
%.tmp6675 = load i32, i32* %from_size.6663
%.tmp6676 = load i32, i32* %to_size.6664
%.tmp6677 = icmp slt i32 %.tmp6675, %.tmp6676
br i1 %.tmp6677, label %.if.true.6678, label %.if.false.6678
.if.true.6678:
%.tmp6680 = getelementptr [5 x i8], [5 x i8]*@.str6679, i32 0, i32 0
store i8* %.tmp6680, i8** %cast_fn.6614
br label %.if.end.6678
.if.false.6678:
%.tmp6682 = getelementptr [6 x i8], [6 x i8]*@.str6681, i32 0, i32 0
store i8* %.tmp6682, i8** %cast_fn.6614
br label %.if.end.6678
.if.end.6678:
br label %.if.end.6662
.if.false.6662:
br label %.if.end.6662
.if.end.6662:
br label %.if.end.6652
.if.false.6652:
br label %.if.end.6652
.if.end.6652:
%.tmp6683 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6684 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6683, i32 0, i32 1
%.tmp6685 = load %m0$.File.type*, %m0$.File.type** %.tmp6684
%.tmp6687 = getelementptr [21 x i8], [21 x i8]*@.str6686, i32 0, i32 0
%.tmp6688 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6689 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6688)
%.tmp6690 = load i8*, i8** %cast_fn.6614
%.tmp6691 = load i8*, i8** %from_type.6607
%.tmp6692 = load i8*, i8** %prev_id.6599
%.tmp6693 = load i8*, i8** %to_type.6611
%.tmp6694 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6685, i8* %.tmp6687, i8* %.tmp6689, i8* %.tmp6690, i8* %.tmp6691, i8* %.tmp6692, i8* %.tmp6693)
%.tmp6695 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
%.tmp6696 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6695, i32 0, i32 4
%.tmp6697 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6596
store %m1861$.Type.type* %.tmp6697, %m1861$.Type.type** %.tmp6696
br label %.if.end.6583
.if.false.6583:
br label %.if.end.6583
.if.end.6583:
%.tmp6698 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6569
ret %m1861$.AssignableInfo.type* %.tmp6698
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6699 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6700 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6699, i32 0, i32 0
%.tmp6701 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6700
%.tmp6702 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6701, i32 0, i32 0
%.tmp6703 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6702
%.tmp6704 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6703, i32 0, i32 0
%.tmp6705 = load i8*, i8** %.tmp6704
%.tmp6707 = getelementptr [16 x i8], [16 x i8]*@.str6706, i32 0, i32 0
%.tmp6708 = call i32(i8*,i8*) @strcmp(i8* %.tmp6705, i8* %.tmp6707)
%.tmp6709 = icmp eq i32 %.tmp6708, 0
br i1 %.tmp6709, label %.if.true.6710, label %.if.false.6710
.if.true.6710:
%.tmp6711 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6712 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6713 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6712, i32 0, i32 0
%.tmp6714 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6713
%.tmp6715 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6714, i32 0, i32 0
%.tmp6716 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6715
%.tmp6717 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6711, %m307$.Node.type* %.tmp6716)
ret %m1861$.AssignableInfo.type* %.tmp6717
br label %.if.end.6710
.if.false.6710:
br label %.if.end.6710
.if.end.6710:
%.tmp6718 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6719 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6718, i32 0, i32 0
%.tmp6720 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6719
%.tmp6721 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6720, i32 0, i32 0
%.tmp6722 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6721
%.tmp6723 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6722, i32 0, i32 6
%.tmp6724 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6723
%operator.6725 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6724, %m307$.Node.type** %operator.6725
%.tmp6726 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6727 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6726, i32 0, i32 0
%.tmp6728 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6729 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6728, i32 0, i32 0
%.tmp6730 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6729
%.tmp6731 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6730, i32 0, i32 1
%.tmp6732 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6731
store %m1988$.SYStack.type* %.tmp6732, %m1988$.SYStack.type** %.tmp6727
%.tmp6733 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6734 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6735 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6733, %m1861$.StackHead.type* %.tmp6734)
%A.6736 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6735, %m1861$.AssignableInfo.type** %A.6736
%.tmp6737 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6736
%.tmp6738 = icmp eq %m1861$.AssignableInfo.type* %.tmp6737, null
br i1 %.tmp6738, label %.if.true.6739, label %.if.false.6739
.if.true.6739:
%.tmp6740 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6736
ret %m1861$.AssignableInfo.type* %.tmp6740
br label %.if.end.6739
.if.false.6739:
br label %.if.end.6739
.if.end.6739:
%.tmp6741 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6742 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6741, i32 0, i32 0
%.tmp6743 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6744 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6743, i32 0, i32 0
%.tmp6745 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6744
%.tmp6746 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6745, i32 0, i32 1
%.tmp6747 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6746
store %m1988$.SYStack.type* %.tmp6747, %m1988$.SYStack.type** %.tmp6742
%.tmp6748 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6749 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6750 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6748, %m1861$.StackHead.type* %.tmp6749)
%B.6751 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6750, %m1861$.AssignableInfo.type** %B.6751
%.tmp6752 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6751
%.tmp6753 = icmp eq %m1861$.AssignableInfo.type* %.tmp6752, null
br i1 %.tmp6753, label %.if.true.6754, label %.if.false.6754
.if.true.6754:
%.tmp6755 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6751
ret %m1861$.AssignableInfo.type* %.tmp6755
br label %.if.end.6754
.if.false.6754:
br label %.if.end.6754
.if.end.6754:
%.tmp6756 = bitcast ptr null to %m307$.Node.type*
%.tmp6757 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6756)
%op_info.6758 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6757, %m1861$.AssignableInfo.type** %op_info.6758
%.tmp6759 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6758
%.tmp6760 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6759, i32 0, i32 4
%.tmp6761 = load %m307$.Node.type*, %m307$.Node.type** %operator.6725
%.tmp6762 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6761)
store %m1861$.Type.type* %.tmp6762, %m1861$.Type.type** %.tmp6760
%.tmp6763 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6764 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6758
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6763, %m1861$.AssignableInfo.type* %.tmp6764)
%.tmp6765 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6766 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6765, i32 0, i32 1
%.tmp6767 = load %m0$.File.type*, %m0$.File.type** %.tmp6766
%.tmp6769 = getelementptr [19 x i8], [19 x i8]*@.str6768, i32 0, i32 0
%.tmp6770 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6758
%.tmp6771 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6770)
%.tmp6772 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6773 = load %m307$.Node.type*, %m307$.Node.type** %operator.6725
%.tmp6774 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6772, %m307$.Node.type* %.tmp6773)
%.tmp6775 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6776 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6736
%.tmp6777 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6776, i32 0, i32 4
%.tmp6778 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6777
%.tmp6779 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6775, %m1861$.Type.type* %.tmp6778)
%.tmp6780 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6736
%.tmp6781 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6780)
%.tmp6782 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6751
%.tmp6783 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6782)
%.tmp6784 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6767, i8* %.tmp6769, i8* %.tmp6771, i8* %.tmp6774, i8* %.tmp6779, i8* %.tmp6781, i8* %.tmp6783)
%.tmp6785 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6758
ret %m1861$.AssignableInfo.type* %.tmp6785
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6786 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6787 = icmp eq %m307$.Node.type* %.tmp6786, null
br i1 %.tmp6787, label %.if.true.6788, label %.if.false.6788
.if.true.6788:
%.tmp6789 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6790 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6792 = getelementptr [31 x i8], [31 x i8]*@.str6791, i32 0, i32 0
%.tmp6793 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6789, %m307$.Node.type* %.tmp6790, i8* %.tmp6792)
%.tmp6794 = call i32(i8*,...) @printf(i8* %.tmp6793)
br label %.if.end.6788
.if.false.6788:
br label %.if.end.6788
.if.end.6788:
%.tmp6795 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6796 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6795, i32 0, i32 1
%.tmp6797 = load i8*, i8** %.tmp6796
%.tmp6799 = getelementptr [2 x i8], [2 x i8]*@.str6798, i32 0, i32 0
%.tmp6800 = call i32(i8*,i8*) @strcmp(i8* %.tmp6797, i8* %.tmp6799)
%.tmp6801 = icmp eq i32 %.tmp6800, 0
br i1 %.tmp6801, label %.if.true.6802, label %.if.false.6802
.if.true.6802:
%.tmp6804 = getelementptr [4 x i8], [4 x i8]*@.str6803, i32 0, i32 0
ret i8* %.tmp6804
br label %.if.end.6802
.if.false.6802:
%.tmp6805 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6806 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6805, i32 0, i32 1
%.tmp6807 = load i8*, i8** %.tmp6806
%.tmp6809 = getelementptr [2 x i8], [2 x i8]*@.str6808, i32 0, i32 0
%.tmp6810 = call i32(i8*,i8*) @strcmp(i8* %.tmp6807, i8* %.tmp6809)
%.tmp6811 = icmp eq i32 %.tmp6810, 0
br i1 %.tmp6811, label %.if.true.6812, label %.if.false.6812
.if.true.6812:
%.tmp6814 = getelementptr [4 x i8], [4 x i8]*@.str6813, i32 0, i32 0
ret i8* %.tmp6814
br label %.if.end.6812
.if.false.6812:
%.tmp6815 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6816 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6815, i32 0, i32 1
%.tmp6817 = load i8*, i8** %.tmp6816
%.tmp6819 = getelementptr [2 x i8], [2 x i8]*@.str6818, i32 0, i32 0
%.tmp6820 = call i32(i8*,i8*) @strcmp(i8* %.tmp6817, i8* %.tmp6819)
%.tmp6821 = icmp eq i32 %.tmp6820, 0
br i1 %.tmp6821, label %.if.true.6822, label %.if.false.6822
.if.true.6822:
%.tmp6824 = getelementptr [4 x i8], [4 x i8]*@.str6823, i32 0, i32 0
ret i8* %.tmp6824
br label %.if.end.6822
.if.false.6822:
%.tmp6825 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6826 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6825, i32 0, i32 1
%.tmp6827 = load i8*, i8** %.tmp6826
%.tmp6829 = getelementptr [2 x i8], [2 x i8]*@.str6828, i32 0, i32 0
%.tmp6830 = call i32(i8*,i8*) @strcmp(i8* %.tmp6827, i8* %.tmp6829)
%.tmp6831 = icmp eq i32 %.tmp6830, 0
br i1 %.tmp6831, label %.if.true.6832, label %.if.false.6832
.if.true.6832:
%.tmp6834 = getelementptr [5 x i8], [5 x i8]*@.str6833, i32 0, i32 0
ret i8* %.tmp6834
br label %.if.end.6832
.if.false.6832:
%.tmp6835 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6836 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6835, i32 0, i32 1
%.tmp6837 = load i8*, i8** %.tmp6836
%.tmp6839 = getelementptr [3 x i8], [3 x i8]*@.str6838, i32 0, i32 0
%.tmp6840 = call i32(i8*,i8*) @strcmp(i8* %.tmp6837, i8* %.tmp6839)
%.tmp6841 = icmp eq i32 %.tmp6840, 0
br i1 %.tmp6841, label %.if.true.6842, label %.if.false.6842
.if.true.6842:
%.tmp6844 = getelementptr [8 x i8], [8 x i8]*@.str6843, i32 0, i32 0
ret i8* %.tmp6844
br label %.if.end.6842
.if.false.6842:
%.tmp6845 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6846 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6845, i32 0, i32 1
%.tmp6847 = load i8*, i8** %.tmp6846
%.tmp6849 = getelementptr [3 x i8], [3 x i8]*@.str6848, i32 0, i32 0
%.tmp6850 = call i32(i8*,i8*) @strcmp(i8* %.tmp6847, i8* %.tmp6849)
%.tmp6851 = icmp eq i32 %.tmp6850, 0
br i1 %.tmp6851, label %.if.true.6852, label %.if.false.6852
.if.true.6852:
%.tmp6854 = getelementptr [8 x i8], [8 x i8]*@.str6853, i32 0, i32 0
ret i8* %.tmp6854
br label %.if.end.6852
.if.false.6852:
%.tmp6855 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6856 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6855, i32 0, i32 1
%.tmp6857 = load i8*, i8** %.tmp6856
%.tmp6859 = getelementptr [2 x i8], [2 x i8]*@.str6858, i32 0, i32 0
%.tmp6860 = call i32(i8*,i8*) @strcmp(i8* %.tmp6857, i8* %.tmp6859)
%.tmp6861 = icmp eq i32 %.tmp6860, 0
br i1 %.tmp6861, label %.if.true.6862, label %.if.false.6862
.if.true.6862:
%.tmp6864 = getelementptr [9 x i8], [9 x i8]*@.str6863, i32 0, i32 0
ret i8* %.tmp6864
br label %.if.end.6862
.if.false.6862:
%.tmp6865 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6866 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6865, i32 0, i32 1
%.tmp6867 = load i8*, i8** %.tmp6866
%.tmp6869 = getelementptr [2 x i8], [2 x i8]*@.str6868, i32 0, i32 0
%.tmp6870 = call i32(i8*,i8*) @strcmp(i8* %.tmp6867, i8* %.tmp6869)
%.tmp6871 = icmp eq i32 %.tmp6870, 0
br i1 %.tmp6871, label %.if.true.6872, label %.if.false.6872
.if.true.6872:
%.tmp6874 = getelementptr [9 x i8], [9 x i8]*@.str6873, i32 0, i32 0
ret i8* %.tmp6874
br label %.if.end.6872
.if.false.6872:
%.tmp6875 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6876 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6875, i32 0, i32 1
%.tmp6877 = load i8*, i8** %.tmp6876
%.tmp6879 = getelementptr [2 x i8], [2 x i8]*@.str6878, i32 0, i32 0
%.tmp6880 = call i32(i8*,i8*) @strcmp(i8* %.tmp6877, i8* %.tmp6879)
%.tmp6881 = icmp eq i32 %.tmp6880, 0
br i1 %.tmp6881, label %.if.true.6882, label %.if.false.6882
.if.true.6882:
%.tmp6884 = getelementptr [4 x i8], [4 x i8]*@.str6883, i32 0, i32 0
ret i8* %.tmp6884
br label %.if.end.6882
.if.false.6882:
%.tmp6885 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6886 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6885, i32 0, i32 1
%.tmp6887 = load i8*, i8** %.tmp6886
%.tmp6889 = getelementptr [2 x i8], [2 x i8]*@.str6888, i32 0, i32 0
%.tmp6890 = call i32(i8*,i8*) @strcmp(i8* %.tmp6887, i8* %.tmp6889)
%.tmp6891 = icmp eq i32 %.tmp6890, 0
br i1 %.tmp6891, label %.if.true.6892, label %.if.false.6892
.if.true.6892:
%.tmp6894 = getelementptr [3 x i8], [3 x i8]*@.str6893, i32 0, i32 0
ret i8* %.tmp6894
br label %.if.end.6892
.if.false.6892:
%.tmp6895 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6896 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6895, i32 0, i32 1
%.tmp6897 = load i8*, i8** %.tmp6896
%.tmp6899 = getelementptr [3 x i8], [3 x i8]*@.str6898, i32 0, i32 0
%.tmp6900 = call i32(i8*,i8*) @strcmp(i8* %.tmp6897, i8* %.tmp6899)
%.tmp6901 = icmp eq i32 %.tmp6900, 0
br i1 %.tmp6901, label %.if.true.6902, label %.if.false.6902
.if.true.6902:
%.tmp6904 = getelementptr [9 x i8], [9 x i8]*@.str6903, i32 0, i32 0
ret i8* %.tmp6904
br label %.if.end.6902
.if.false.6902:
%.tmp6905 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6906 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6905, i32 0, i32 1
%.tmp6907 = load i8*, i8** %.tmp6906
%.tmp6909 = getelementptr [3 x i8], [3 x i8]*@.str6908, i32 0, i32 0
%.tmp6910 = call i32(i8*,i8*) @strcmp(i8* %.tmp6907, i8* %.tmp6909)
%.tmp6911 = icmp eq i32 %.tmp6910, 0
br i1 %.tmp6911, label %.if.true.6912, label %.if.false.6912
.if.true.6912:
%.tmp6914 = getelementptr [9 x i8], [9 x i8]*@.str6913, i32 0, i32 0
ret i8* %.tmp6914
br label %.if.end.6912
.if.false.6912:
%.tmp6915 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6916 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6915, i32 0, i32 1
%.tmp6917 = load i8*, i8** %.tmp6916
%.tmp6919 = getelementptr [2 x i8], [2 x i8]*@.str6918, i32 0, i32 0
%.tmp6920 = call i32(i8*,i8*) @strcmp(i8* %.tmp6917, i8* %.tmp6919)
%.tmp6921 = icmp eq i32 %.tmp6920, 0
br i1 %.tmp6921, label %.if.true.6922, label %.if.false.6922
.if.true.6922:
%.tmp6924 = getelementptr [5 x i8], [5 x i8]*@.str6923, i32 0, i32 0
ret i8* %.tmp6924
br label %.if.end.6922
.if.false.6922:
%.tmp6925 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6926 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6928 = getelementptr [30 x i8], [30 x i8]*@.str6927, i32 0, i32 0
%.tmp6929 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6925, %m307$.Node.type* %.tmp6926, i8* %.tmp6928)
%.tmp6930 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6931 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6930, i32 0, i32 1
%.tmp6932 = load i8*, i8** %.tmp6931
%.tmp6933 = call i32(i8*,...) @printf(i8* %.tmp6929, i8* %.tmp6932)
br label %.if.end.6922
.if.end.6922:
br label %.if.end.6912
.if.end.6912:
br label %.if.end.6902
.if.end.6902:
br label %.if.end.6892
.if.end.6892:
br label %.if.end.6882
.if.end.6882:
br label %.if.end.6872
.if.end.6872:
br label %.if.end.6862
.if.end.6862:
br label %.if.end.6852
.if.end.6852:
br label %.if.end.6842
.if.end.6842:
br label %.if.end.6832
.if.end.6832:
br label %.if.end.6822
.if.end.6822:
br label %.if.end.6812
.if.end.6812:
br label %.if.end.6802
.if.end.6802:
%.tmp6935 = getelementptr [4 x i8], [4 x i8]*@.str6934, i32 0, i32 0
ret i8* %.tmp6935
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6936 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6937 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6936, %m1861$.Type.type** %type.6937
%.tmp6938 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6939 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6938, i32 0, i32 1
%.tmp6940 = load i8*, i8** %.tmp6939
%.tmp6942 = getelementptr [3 x i8], [3 x i8]*@.str6941, i32 0, i32 0
%.tmp6943 = call i32(i8*,i8*) @strcmp(i8* %.tmp6940, i8* %.tmp6942)
%.tmp6944 = icmp eq i32 %.tmp6943, 0
%.tmp6945 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6946 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6945, i32 0, i32 1
%.tmp6947 = load i8*, i8** %.tmp6946
%.tmp6949 = getelementptr [3 x i8], [3 x i8]*@.str6948, i32 0, i32 0
%.tmp6950 = call i32(i8*,i8*) @strcmp(i8* %.tmp6947, i8* %.tmp6949)
%.tmp6951 = icmp eq i32 %.tmp6950, 0
%.tmp6952 = or i1 %.tmp6944, %.tmp6951
%.tmp6953 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6954 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6953, i32 0, i32 1
%.tmp6955 = load i8*, i8** %.tmp6954
%.tmp6957 = getelementptr [2 x i8], [2 x i8]*@.str6956, i32 0, i32 0
%.tmp6958 = call i32(i8*,i8*) @strcmp(i8* %.tmp6955, i8* %.tmp6957)
%.tmp6959 = icmp eq i32 %.tmp6958, 0
%.tmp6960 = or i1 %.tmp6952, %.tmp6959
%.tmp6961 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6962 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6961, i32 0, i32 1
%.tmp6963 = load i8*, i8** %.tmp6962
%.tmp6965 = getelementptr [2 x i8], [2 x i8]*@.str6964, i32 0, i32 0
%.tmp6966 = call i32(i8*,i8*) @strcmp(i8* %.tmp6963, i8* %.tmp6965)
%.tmp6967 = icmp eq i32 %.tmp6966, 0
%.tmp6968 = or i1 %.tmp6960, %.tmp6967
%.tmp6969 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6970 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6969, i32 0, i32 1
%.tmp6971 = load i8*, i8** %.tmp6970
%.tmp6973 = getelementptr [2 x i8], [2 x i8]*@.str6972, i32 0, i32 0
%.tmp6974 = call i32(i8*,i8*) @strcmp(i8* %.tmp6971, i8* %.tmp6973)
%.tmp6975 = icmp eq i32 %.tmp6974, 0
%.tmp6976 = or i1 %.tmp6968, %.tmp6975
%.tmp6977 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6977, i32 0, i32 1
%.tmp6979 = load i8*, i8** %.tmp6978
%.tmp6981 = getelementptr [2 x i8], [2 x i8]*@.str6980, i32 0, i32 0
%.tmp6982 = call i32(i8*,i8*) @strcmp(i8* %.tmp6979, i8* %.tmp6981)
%.tmp6983 = icmp eq i32 %.tmp6982, 0
%.tmp6984 = or i1 %.tmp6976, %.tmp6983
%.tmp6985 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6986 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6985, i32 0, i32 1
%.tmp6987 = load i8*, i8** %.tmp6986
%.tmp6989 = getelementptr [3 x i8], [3 x i8]*@.str6988, i32 0, i32 0
%.tmp6990 = call i32(i8*,i8*) @strcmp(i8* %.tmp6987, i8* %.tmp6989)
%.tmp6991 = icmp eq i32 %.tmp6990, 0
%.tmp6992 = or i1 %.tmp6984, %.tmp6991
%.tmp6993 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6994 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6993, i32 0, i32 1
%.tmp6995 = load i8*, i8** %.tmp6994
%.tmp6997 = getelementptr [3 x i8], [3 x i8]*@.str6996, i32 0, i32 0
%.tmp6998 = call i32(i8*,i8*) @strcmp(i8* %.tmp6995, i8* %.tmp6997)
%.tmp6999 = icmp eq i32 %.tmp6998, 0
%.tmp7000 = or i1 %.tmp6992, %.tmp6999
br i1 %.tmp7000, label %.if.true.7001, label %.if.false.7001
.if.true.7001:
%.tmp7002 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6937
%.tmp7003 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7002, i32 0, i32 0
%.tmp7005 = getelementptr [5 x i8], [5 x i8]*@.str7004, i32 0, i32 0
store i8* %.tmp7005, i8** %.tmp7003
br label %.if.end.7001
.if.false.7001:
%.tmp7006 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6937
%.tmp7007 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7006, i32 0, i32 0
%.tmp7009 = getelementptr [4 x i8], [4 x i8]*@.str7008, i32 0, i32 0
store i8* %.tmp7009, i8** %.tmp7007
br label %.if.end.7001
.if.end.7001:
%.tmp7010 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6937
ret %m1861$.Type.type* %.tmp7010
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp7011 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.7012 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7011, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7013 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.7014 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7013, %m307$.Node.type** %mono.7014
%err_buf.7015 = alloca i8*
store i8* null, i8** %err_buf.7015
%buf.7016 = alloca i8*
store i8* null, i8** %buf.7016
%.tmp7017 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7018 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7017, i32 0, i32 6
%.tmp7019 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7018
%.tmp7020 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7019, i32 0, i32 0
%.tmp7021 = load i8*, i8** %.tmp7020
%.tmp7023 = getelementptr [7 x i8], [7 x i8]*@.str7022, i32 0, i32 0
%.tmp7024 = call i32(i8*,i8*) @strcmp(i8* %.tmp7021, i8* %.tmp7023)
%.tmp7025 = icmp eq i32 %.tmp7024, 0
br i1 %.tmp7025, label %.if.true.7026, label %.if.false.7026
.if.true.7026:
%.tmp7027 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7028 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7027)
store %m1861$.AssignableInfo.type* %.tmp7028, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7029 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7030 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7029, i32 0, i32 4
%.tmp7031 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7031, %m1861$.Type.type** %.tmp7030
%.tmp7032 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7033 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7032, i32 0, i32 4
%.tmp7034 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7033
%.tmp7035 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7034, i32 0, i32 0
%.tmp7037 = getelementptr [4 x i8], [4 x i8]*@.str7036, i32 0, i32 0
store i8* %.tmp7037, i8** %.tmp7035
%.tmp7038 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7039 = load i8, i8* @SCOPE_CONST
%.tmp7040 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7041 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7040, i32 0, i32 6
%.tmp7042 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7041
%.tmp7043 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7042, i32 0, i32 1
%.tmp7044 = load i8*, i8** %.tmp7043
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7038, i8 %.tmp7039, i8* %.tmp7044)
br label %.if.end.7026
.if.false.7026:
%.tmp7045 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7046 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7045, i32 0, i32 6
%.tmp7047 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7046
%.tmp7048 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7047, i32 0, i32 0
%.tmp7049 = load i8*, i8** %.tmp7048
%.tmp7051 = getelementptr [5 x i8], [5 x i8]*@.str7050, i32 0, i32 0
%.tmp7052 = call i32(i8*,i8*) @strcmp(i8* %.tmp7049, i8* %.tmp7051)
%.tmp7053 = icmp eq i32 %.tmp7052, 0
br i1 %.tmp7053, label %.if.true.7054, label %.if.false.7054
.if.true.7054:
%.tmp7055 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7056 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7055, i32 0, i32 6
%.tmp7057 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7056
%.tmp7058 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7057, i32 0, i32 1
%.tmp7059 = load i8*, i8** %.tmp7058
%.tmp7061 = getelementptr [5 x i8], [5 x i8]*@.str7060, i32 0, i32 0
%.tmp7062 = call i32(i8*,i8*) @strcmp(i8* %.tmp7059, i8* %.tmp7061)
%.tmp7063 = icmp ne i32 %.tmp7062, 0
br i1 %.tmp7063, label %.if.true.7064, label %.if.false.7064
.if.true.7064:
%.tmp7065 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7066 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7068 = getelementptr [42 x i8], [42 x i8]*@.str7067, i32 0, i32 0
%.tmp7069 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7065, %m307$.Node.type* %.tmp7066, i8* %.tmp7068)
%.tmp7070 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7071 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7070, i32 0, i32 6
%.tmp7072 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7071
%.tmp7073 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7072, i32 0, i32 1
%.tmp7074 = load i8*, i8** %.tmp7073
%.tmp7075 = call i32(i8*,...) @printf(i8* %.tmp7069, i8* %.tmp7074)
%.tmp7076 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7076
br label %.if.end.7064
.if.false.7064:
br label %.if.end.7064
.if.end.7064:
%.tmp7077 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7078 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7077)
store %m1861$.AssignableInfo.type* %.tmp7078, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7079 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7080 = load i8, i8* @SCOPE_CONST
%.tmp7082 = getelementptr [5 x i8], [5 x i8]*@.str7081, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7079, i8 %.tmp7080, i8* %.tmp7082)
%.tmp7083 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7084 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7083, i32 0, i32 4
%.tmp7085 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7085, %m1861$.Type.type** %.tmp7084
%.tmp7086 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7087 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7086, i32 0, i32 4
%.tmp7088 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7087
%.tmp7089 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7088, i32 0, i32 0
%.tmp7091 = getelementptr [8 x i8], [8 x i8]*@.str7090, i32 0, i32 0
store i8* %.tmp7091, i8** %.tmp7089
br label %.if.end.7054
.if.false.7054:
%.tmp7092 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7093 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7092, i32 0, i32 6
%.tmp7094 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7093
%.tmp7095 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7094, i32 0, i32 0
%.tmp7096 = load i8*, i8** %.tmp7095
%.tmp7098 = getelementptr [17 x i8], [17 x i8]*@.str7097, i32 0, i32 0
%.tmp7099 = call i32(i8*,i8*) @strcmp(i8* %.tmp7096, i8* %.tmp7098)
%.tmp7100 = icmp eq i32 %.tmp7099, 0
br i1 %.tmp7100, label %.if.true.7101, label %.if.false.7101
.if.true.7101:
%.tmp7102 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7103 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7102)
store %m1861$.AssignableInfo.type* %.tmp7103, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7104 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7105 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7104, i32 0, i32 6
%.tmp7106 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7105
%.tmp7107 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7106, i32 0, i32 6
%.tmp7108 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7107
%.tmp7110 = getelementptr [12 x i8], [12 x i8]*@.str7109, i32 0, i32 0
%.tmp7111 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7108, i8* %.tmp7110)
%dest.7112 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7111, %m307$.Node.type** %dest.7112
%.tmp7113 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7114 = load %m307$.Node.type*, %m307$.Node.type** %dest.7112
%.tmp7115 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7113, %m307$.Node.type* %.tmp7114)
%var_info.7116 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7115, %m1861$.AssignableInfo.type** %var_info.7116
%.tmp7117 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7116
%.tmp7118 = icmp eq %m1861$.AssignableInfo.type* %.tmp7117, null
br i1 %.tmp7118, label %.if.true.7119, label %.if.false.7119
.if.true.7119:
%.tmp7120 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
ret %m1861$.AssignableInfo.type* %.tmp7120
br label %.if.end.7119
.if.false.7119:
br label %.if.end.7119
.if.end.7119:
%.tmp7121 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7122 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7116
%.tmp7123 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7122, i32 0, i32 4
%.tmp7124 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7123
%.tmp7125 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7121, %m1861$.Type.type* %.tmp7124)
%var_type_repr.7126 = alloca i8*
store i8* %.tmp7125, i8** %var_type_repr.7126
%.tmp7127 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7128 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7127, %m1861$.AssignableInfo.type* %.tmp7128)
%.tmp7129 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7130 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7129, i32 0, i32 4
%.tmp7131 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7116
%.tmp7132 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7131, i32 0, i32 4
%.tmp7133 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7132
store %m1861$.Type.type* %.tmp7133, %m1861$.Type.type** %.tmp7130
%.tmp7135 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7136 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7135, i32 0, i32 6
%.tmp7137 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7136
%.tmp7138 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7137, i32 0, i32 6
%.tmp7139 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7138
%ptr.7140 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7139, %m307$.Node.type** %ptr.7140
br label %.for.start.7134
.for.start.7134:
%.tmp7141 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7140
%.tmp7142 = load %m307$.Node.type*, %m307$.Node.type** %dest.7112
%.tmp7143 = icmp ne %m307$.Node.type* %.tmp7141, %.tmp7142
br i1 %.tmp7143, label %.for.continue.7134, label %.for.end.7134
.for.continue.7134:
%.tmp7144 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.7145 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7144, %m1861$.Type.type** %type.7145
%.tmp7146 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7145
%.tmp7147 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7146, i32 0, i32 3
%.tmp7148 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7149 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7148, i32 0, i32 4
%.tmp7150 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7149
store %m1861$.Type.type* %.tmp7150, %m1861$.Type.type** %.tmp7147
%.tmp7151 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7145
%.tmp7152 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7151, i32 0, i32 0
%.tmp7154 = getelementptr [4 x i8], [4 x i8]*@.str7153, i32 0, i32 0
store i8* %.tmp7154, i8** %.tmp7152
%.tmp7155 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7156 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7155, i32 0, i32 4
%.tmp7157 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7145
store %m1861$.Type.type* %.tmp7157, %m1861$.Type.type** %.tmp7156
%.tmp7158 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7140
%.tmp7159 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7158, i32 0, i32 7
%.tmp7160 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7159
store %m307$.Node.type* %.tmp7160, %m307$.Node.type** %ptr.7140
br label %.for.start.7134
.for.end.7134:
%.tmp7161 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7162 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7161, i32 0, i32 6
%.tmp7163 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7162
%.tmp7164 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7163, i32 0, i32 6
%.tmp7165 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7164
%.tmp7166 = load %m307$.Node.type*, %m307$.Node.type** %dest.7112
%.tmp7167 = icmp ne %m307$.Node.type* %.tmp7165, %.tmp7166
br i1 %.tmp7167, label %.if.true.7168, label %.if.false.7168
.if.true.7168:
%.tmp7169 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7170 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7169, i32 0, i32 1
%.tmp7171 = load %m0$.File.type*, %m0$.File.type** %.tmp7170
%.tmp7173 = getelementptr [38 x i8], [38 x i8]*@.str7172, i32 0, i32 0
%.tmp7174 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7175 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7174)
%.tmp7176 = load i8*, i8** %var_type_repr.7126
%.tmp7177 = load i8*, i8** %var_type_repr.7126
%.tmp7178 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7116
%.tmp7179 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7178)
%.tmp7180 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7171, i8* %.tmp7173, i8* %.tmp7175, i8* %.tmp7176, i8* %.tmp7177, i8* %.tmp7179)
br label %.if.end.7168
.if.false.7168:
%.tmp7181 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7182 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7181, i32 0, i32 1
%.tmp7183 = load %m0$.File.type*, %m0$.File.type** %.tmp7182
%.tmp7185 = getelementptr [22 x i8], [22 x i8]*@.str7184, i32 0, i32 0
%.tmp7186 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7187 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7186)
%.tmp7188 = load i8*, i8** %var_type_repr.7126
%.tmp7189 = load i8*, i8** %var_type_repr.7126
%.tmp7190 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7116
%.tmp7191 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7190)
%.tmp7192 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7183, i8* %.tmp7185, i8* %.tmp7187, i8* %.tmp7188, i8* %.tmp7189, i8* %.tmp7191)
br label %.if.end.7168
.if.end.7168:
br label %.if.end.7101
.if.false.7101:
%.tmp7193 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7194 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7193, i32 0, i32 6
%.tmp7195 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7194
%.tmp7196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7195, i32 0, i32 0
%.tmp7197 = load i8*, i8** %.tmp7196
%.tmp7199 = getelementptr [8 x i8], [8 x i8]*@.str7198, i32 0, i32 0
%.tmp7200 = call i32(i8*,i8*) @strcmp(i8* %.tmp7197, i8* %.tmp7199)
%.tmp7201 = icmp eq i32 %.tmp7200, 0
br i1 %.tmp7201, label %.if.true.7202, label %.if.false.7202
.if.true.7202:
%.tmp7203 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7204 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7203)
store %m1861$.AssignableInfo.type* %.tmp7204, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7205 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7206 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7205, i32 0, i32 4
%.tmp7207 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7207, %m1861$.Type.type** %.tmp7206
%.tmp7208 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7209 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7208, i32 0, i32 4
%.tmp7210 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7209
%.tmp7211 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7210, i32 0, i32 0
%.tmp7213 = getelementptr [5 x i8], [5 x i8]*@.str7212, i32 0, i32 0
store i8* %.tmp7213, i8** %.tmp7211
%.tmp7214 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7215 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7214, i32 0, i32 6
%.tmp7216 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7215
%.tmp7217 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7216, i32 0, i32 6
%.tmp7218 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7217
%.tmp7219 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7218, i32 0, i32 1
%.tmp7220 = load i8*, i8** %.tmp7219
%.tmp7222 = getelementptr [6 x i8], [6 x i8]*@.str7221, i32 0, i32 0
%.tmp7223 = call i32(i8*,i8*) @strcmp(i8* %.tmp7220, i8* %.tmp7222)
%.tmp7224 = icmp eq i32 %.tmp7223, 0
br i1 %.tmp7224, label %.if.true.7225, label %.if.false.7225
.if.true.7225:
%.tmp7226 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7227 = load i8, i8* @SCOPE_CONST
%.tmp7229 = getelementptr [2 x i8], [2 x i8]*@.str7228, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7226, i8 %.tmp7227, i8* %.tmp7229)
br label %.if.end.7225
.if.false.7225:
%.tmp7230 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7231 = load i8, i8* @SCOPE_CONST
%.tmp7233 = getelementptr [2 x i8], [2 x i8]*@.str7232, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7230, i8 %.tmp7231, i8* %.tmp7233)
br label %.if.end.7225
.if.end.7225:
br label %.if.end.7202
.if.false.7202:
%.tmp7234 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7235 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7234, i32 0, i32 6
%.tmp7236 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7235
%.tmp7237 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7236, i32 0, i32 0
%.tmp7238 = load i8*, i8** %.tmp7237
%.tmp7240 = getelementptr [8 x i8], [8 x i8]*@.str7239, i32 0, i32 0
%.tmp7241 = call i32(i8*,i8*) @strcmp(i8* %.tmp7238, i8* %.tmp7240)
%.tmp7242 = icmp eq i32 %.tmp7241, 0
br i1 %.tmp7242, label %.if.true.7243, label %.if.false.7243
.if.true.7243:
%.tmp7244 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7245 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7246 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7245, i32 0, i32 6
%.tmp7247 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7246
%.tmp7248 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7247, i32 0, i32 6
%.tmp7249 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7248
%.tmp7250 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7244, %m307$.Node.type* %.tmp7249)
store %m1861$.AssignableInfo.type* %.tmp7250, %m1861$.AssignableInfo.type** %assignable_info.7012
br label %.if.end.7243
.if.false.7243:
%.tmp7251 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7252 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7251, i32 0, i32 6
%.tmp7253 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7252
%.tmp7254 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7253, i32 0, i32 0
%.tmp7255 = load i8*, i8** %.tmp7254
%.tmp7257 = getelementptr [7 x i8], [7 x i8]*@.str7256, i32 0, i32 0
%.tmp7258 = call i32(i8*,i8*) @strcmp(i8* %.tmp7255, i8* %.tmp7257)
%.tmp7259 = icmp eq i32 %.tmp7258, 0
br i1 %.tmp7259, label %.if.true.7260, label %.if.false.7260
.if.true.7260:
%.tmp7261 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7262 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7263 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7262, i32 0, i32 6
%.tmp7264 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7263
%.tmp7265 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7264, i32 0, i32 1
%.tmp7266 = load i8*, i8** %.tmp7265
%.tmp7267 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp7261, i8* %.tmp7266)
%string_info.7268 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7267, %m1861$.AssignableInfo.type** %string_info.7268
%.tmp7269 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7270 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7269)
store %m1861$.AssignableInfo.type* %.tmp7270, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7271 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7272 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7271, %m1861$.AssignableInfo.type* %.tmp7272)
%.tmp7273 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7274 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7268
%.tmp7275 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7274, i32 0, i32 4
%.tmp7276 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7275
%.tmp7277 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7273, %m1861$.Type.type* %.tmp7276)
%str_tr.7278 = alloca i8*
store i8* %.tmp7277, i8** %str_tr.7278
%.tmp7279 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7280 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7279, i32 0, i32 1
%.tmp7281 = load %m0$.File.type*, %m0$.File.type** %.tmp7280
%.tmp7283 = getelementptr [44 x i8], [44 x i8]*@.str7282, i32 0, i32 0
%.tmp7284 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7285 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7284)
%.tmp7286 = load i8*, i8** %str_tr.7278
%.tmp7287 = load i8*, i8** %str_tr.7278
%.tmp7288 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7268
%.tmp7289 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7288)
%.tmp7290 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7281, i8* %.tmp7283, i8* %.tmp7285, i8* %.tmp7286, i8* %.tmp7287, i8* %.tmp7289)
%.tmp7291 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7292 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7291, i32 0, i32 4
%.tmp7293 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7293, %m1861$.Type.type** %.tmp7292
%.tmp7294 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7295 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7294, i32 0, i32 4
%.tmp7296 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7295
%.tmp7297 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7296, i32 0, i32 0
%.tmp7299 = getelementptr [4 x i8], [4 x i8]*@.str7298, i32 0, i32 0
store i8* %.tmp7299, i8** %.tmp7297
%.tmp7300 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7301 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7300, i32 0, i32 4
%.tmp7302 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7301
%.tmp7303 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7302, i32 0, i32 3
%.tmp7304 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7304, %m1861$.Type.type** %.tmp7303
%.tmp7305 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7306 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7305, i32 0, i32 4
%.tmp7307 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7306
%.tmp7308 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7307, i32 0, i32 3
%.tmp7309 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7308
%.tmp7310 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7309, i32 0, i32 0
%.tmp7312 = getelementptr [4 x i8], [4 x i8]*@.str7311, i32 0, i32 0
store i8* %.tmp7312, i8** %.tmp7310
br label %.if.end.7260
.if.false.7260:
%.tmp7313 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7314 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7313, i32 0, i32 6
%.tmp7315 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7314
%.tmp7316 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7315, i32 0, i32 0
%.tmp7317 = load i8*, i8** %.tmp7316
%.tmp7319 = getelementptr [4 x i8], [4 x i8]*@.str7318, i32 0, i32 0
%.tmp7320 = call i32(i8*,i8*) @strcmp(i8* %.tmp7317, i8* %.tmp7319)
%.tmp7321 = icmp eq i32 %.tmp7320, 0
br i1 %.tmp7321, label %.if.true.7322, label %.if.false.7322
.if.true.7322:
%.tmp7323 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7324 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7323)
store %m1861$.AssignableInfo.type* %.tmp7324, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7325 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7325, i32 0, i32 6
%.tmp7327 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7326
%.tmp7328 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7327, i32 0, i32 1
%.tmp7329 = load i8*, i8** %.tmp7328
%.tmp7330 = call i32(i8*) @strlen(i8* %.tmp7329)
%chr_len.7331 = alloca i32
store i32 %.tmp7330, i32* %chr_len.7331
%.tmp7332 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7333 = load i8, i8* @SCOPE_CONST
%.tmp7335 = getelementptr [2 x i8], [2 x i8]*@.str7334, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7332, i8 %.tmp7333, i8* %.tmp7335)
%.tmp7336 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7337 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7336, i32 0, i32 0
%.tmp7338 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7339 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7338, i32 0, i32 6
%.tmp7340 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7339
%.tmp7341 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7340, i32 0, i32 1
%.tmp7342 = load i8*, i8** %.tmp7341
%.tmp7343 = call i8*(i8*) @m2233$chr_to_llvm.cp.cp(i8* %.tmp7342)
store i8* %.tmp7343, i8** %.tmp7337
%.tmp7344 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7345 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7344, i32 0, i32 0
%.tmp7346 = load i8*, i8** %.tmp7345
%.tmp7347 = icmp eq i8* %.tmp7346, null
br i1 %.tmp7347, label %.if.true.7348, label %.if.false.7348
.if.true.7348:
%.tmp7349 = getelementptr i8*, i8** %err_buf.7015, i32 0
%.tmp7351 = getelementptr [22 x i8], [22 x i8]*@.str7350, i32 0, i32 0
%.tmp7352 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7353 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7352, i32 0, i32 6
%.tmp7354 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7353
%.tmp7355 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7354, i32 0, i32 1
%.tmp7356 = load i8*, i8** %.tmp7355
%.tmp7357 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7349, i8* %.tmp7351, i8* %.tmp7356)
%.tmp7358 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7358
br label %.if.end.7348
.if.false.7348:
br label %.if.end.7348
.if.end.7348:
%.tmp7359 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7360 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7359, i32 0, i32 4
%.tmp7361 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7361, %m1861$.Type.type** %.tmp7360
%.tmp7362 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7363 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7362, i32 0, i32 4
%.tmp7364 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7363
%.tmp7365 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7364, i32 0, i32 0
%.tmp7367 = getelementptr [4 x i8], [4 x i8]*@.str7366, i32 0, i32 0
store i8* %.tmp7367, i8** %.tmp7365
br label %.if.end.7322
.if.false.7322:
%.tmp7368 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7369 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7371 = getelementptr [40 x i8], [40 x i8]*@.str7370, i32 0, i32 0
%.tmp7372 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7368, %m307$.Node.type* %.tmp7369, i8* %.tmp7371)
%.tmp7373 = load %m307$.Node.type*, %m307$.Node.type** %mono.7014
%.tmp7374 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7373, i32 0, i32 6
%.tmp7375 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7374
%.tmp7376 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7375, i32 0, i32 0
%.tmp7377 = load i8*, i8** %.tmp7376
%.tmp7378 = call i32(i8*,...) @printf(i8* %.tmp7372, i8* %.tmp7377)
%.tmp7379 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7379
br label %.if.end.7322
.if.end.7322:
br label %.if.end.7260
.if.end.7260:
br label %.if.end.7243
.if.end.7243:
br label %.if.end.7202
.if.end.7202:
br label %.if.end.7101
.if.end.7101:
br label %.if.end.7054
.if.end.7054:
br label %.if.end.7026
.if.end.7026:
%.tmp7380 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7381 = icmp eq %m1861$.AssignableInfo.type* %.tmp7380, null
br i1 %.tmp7381, label %.if.true.7382, label %.if.false.7382
.if.true.7382:
%.tmp7383 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7383
br label %.if.end.7382
.if.false.7382:
br label %.if.end.7382
.if.end.7382:
%.tmp7384 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7385 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7384, i32 0, i32 5
%.tmp7386 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7387 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7386, i32 0, i32 3
%.tmp7388 = load i32, i32* %.tmp7387
store i32 %.tmp7388, i32* %.tmp7385
%.tmp7389 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7390 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7389, i32 0, i32 6
%.tmp7391 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7392 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7391, i32 0, i32 4
%.tmp7393 = load i32, i32* %.tmp7392
store i32 %.tmp7393, i32* %.tmp7390
%.tmp7394 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.7012
%.tmp7395 = bitcast %m1861$.AssignableInfo.type* %.tmp7394 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7395
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7396 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7397 = icmp ne %m1861$.Type.type* %.tmp7396, null
%.tmp7399 = getelementptr [22 x i8], [22 x i8]*@.str7398, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7397, i8* %.tmp7399)
%.tmp7400 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7401 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7400, i32 0, i32 0
%.tmp7402 = load i8*, i8** %.tmp7401
%.tmp7403 = icmp ne i8* %.tmp7402, null
%.tmp7405 = getelementptr [59 x i8], [59 x i8]*@.str7404, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7403, i8* %.tmp7405)
%.tmp7406 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7407 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7406, i32 0, i32 0
%.tmp7408 = load i8*, i8** %.tmp7407
%.tmp7410 = getelementptr [4 x i8], [4 x i8]*@.str7409, i32 0, i32 0
%.tmp7411 = call i32(i8*,i8*) @strcmp(i8* %.tmp7408, i8* %.tmp7410)
%.tmp7412 = icmp eq i32 %.tmp7411, 0
br i1 %.tmp7412, label %.if.true.7413, label %.if.false.7413
.if.true.7413:
%.tmp7415 = getelementptr [2 x i8], [2 x i8]*@.str7414, i32 0, i32 0
ret i8* %.tmp7415
br label %.if.end.7413
.if.false.7413:
%.tmp7416 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7417 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7416, i32 0, i32 0
%.tmp7418 = load i8*, i8** %.tmp7417
%.tmp7420 = getelementptr [5 x i8], [5 x i8]*@.str7419, i32 0, i32 0
%.tmp7421 = call i32(i8*,i8*) @strcmp(i8* %.tmp7418, i8* %.tmp7420)
%.tmp7422 = icmp eq i32 %.tmp7421, 0
br i1 %.tmp7422, label %.if.true.7423, label %.if.false.7423
.if.true.7423:
%.tmp7425 = getelementptr [2 x i8], [2 x i8]*@.str7424, i32 0, i32 0
ret i8* %.tmp7425
br label %.if.end.7423
.if.false.7423:
%.tmp7426 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7427 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7426, i32 0, i32 0
%.tmp7428 = load i8*, i8** %.tmp7427
%.tmp7430 = getelementptr [5 x i8], [5 x i8]*@.str7429, i32 0, i32 0
%.tmp7431 = call i32(i8*,i8*) @strcmp(i8* %.tmp7428, i8* %.tmp7430)
%.tmp7432 = icmp eq i32 %.tmp7431, 0
br i1 %.tmp7432, label %.if.true.7433, label %.if.false.7433
.if.true.7433:
%.tmp7435 = getelementptr [2 x i8], [2 x i8]*@.str7434, i32 0, i32 0
ret i8* %.tmp7435
br label %.if.end.7433
.if.false.7433:
%.tmp7436 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7437 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7436, i32 0, i32 0
%.tmp7438 = load i8*, i8** %.tmp7437
%.tmp7440 = getelementptr [4 x i8], [4 x i8]*@.str7439, i32 0, i32 0
%.tmp7441 = call i32(i8*,i8*) @strcmp(i8* %.tmp7438, i8* %.tmp7440)
%.tmp7442 = icmp eq i32 %.tmp7441, 0
br i1 %.tmp7442, label %.if.true.7443, label %.if.false.7443
.if.true.7443:
%.tmp7445 = getelementptr [2 x i8], [2 x i8]*@.str7444, i32 0, i32 0
ret i8* %.tmp7445
br label %.if.end.7443
.if.false.7443:
%.tmp7446 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7447 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7446, i32 0, i32 0
%.tmp7448 = load i8*, i8** %.tmp7447
%.tmp7450 = getelementptr [4 x i8], [4 x i8]*@.str7449, i32 0, i32 0
%.tmp7451 = call i32(i8*,i8*) @strcmp(i8* %.tmp7448, i8* %.tmp7450)
%.tmp7452 = icmp eq i32 %.tmp7451, 0
br i1 %.tmp7452, label %.if.true.7453, label %.if.false.7453
.if.true.7453:
%buf.7454 = alloca i8*
store i8* null, i8** %buf.7454
%.tmp7455 = getelementptr i8*, i8** %buf.7454, i32 0
%.tmp7457 = getelementptr [4 x i8], [4 x i8]*@.str7456, i32 0, i32 0
%.tmp7458 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7459 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7458, i32 0, i32 3
%.tmp7460 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7459
%.tmp7461 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7460)
%.tmp7462 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7455, i8* %.tmp7457, i8* %.tmp7461)
%.tmp7463 = load i8*, i8** %buf.7454
ret i8* %.tmp7463
br label %.if.end.7453
.if.false.7453:
%.tmp7464 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7465 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7464, i32 0, i32 0
%.tmp7466 = load i8*, i8** %.tmp7465
%.tmp7468 = getelementptr [10 x i8], [10 x i8]*@.str7467, i32 0, i32 0
%.tmp7469 = call i32(i8*,i8*) @strcmp(i8* %.tmp7466, i8* %.tmp7468)
%.tmp7470 = icmp eq i32 %.tmp7469, 0
br i1 %.tmp7470, label %.if.true.7471, label %.if.false.7471
.if.true.7471:
%.tmp7472 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7473 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7472, i32 0, i32 2
%.tmp7474 = load i8*, i8** %.tmp7473
ret i8* %.tmp7474
br label %.if.end.7471
.if.false.7471:
%.tmp7475 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7476 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7475, i32 0, i32 0
%.tmp7477 = load i8*, i8** %.tmp7476
%.tmp7479 = getelementptr [7 x i8], [7 x i8]*@.str7478, i32 0, i32 0
%.tmp7480 = call i32(i8*,i8*) @strcmp(i8* %.tmp7477, i8* %.tmp7479)
%.tmp7481 = icmp eq i32 %.tmp7480, 0
br i1 %.tmp7481, label %.if.true.7482, label %.if.false.7482
.if.true.7482:
%.tmp7484 = getelementptr [2 x i8], [2 x i8]*@.str7483, i32 0, i32 0
%buf.7485 = alloca i8*
store i8* %.tmp7484, i8** %buf.7485
%.tmp7487 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7488 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7487, i32 0, i32 3
%.tmp7489 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7488
%t.7490 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7489, %m1861$.Type.type** %t.7490
br label %.for.start.7486
.for.start.7486:
%.tmp7491 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7490
%.tmp7492 = icmp ne %m1861$.Type.type* %.tmp7491, null
br i1 %.tmp7492, label %.for.continue.7486, label %.for.end.7486
.for.continue.7486:
%.tmp7493 = getelementptr i8*, i8** %buf.7485, i32 0
%.tmp7495 = getelementptr [5 x i8], [5 x i8]*@.str7494, i32 0, i32 0
%.tmp7496 = load i8*, i8** %buf.7485
%.tmp7497 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7490
%.tmp7498 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7497)
%.tmp7499 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7493, i8* %.tmp7495, i8* %.tmp7496, i8* %.tmp7498)
%.tmp7500 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7490
%.tmp7501 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7500, i32 0, i32 4
%.tmp7502 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7501
store %m1861$.Type.type* %.tmp7502, %m1861$.Type.type** %t.7490
br label %.for.start.7486
.for.end.7486:
%.tmp7503 = load i8*, i8** %buf.7485
ret i8* %.tmp7503
br label %.if.end.7482
.if.false.7482:
%.tmp7504 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7505 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7504, i32 0, i32 0
%.tmp7506 = load i8*, i8** %.tmp7505
%.tmp7508 = getelementptr [6 x i8], [6 x i8]*@.str7507, i32 0, i32 0
%.tmp7509 = call i32(i8*,i8*) @strcmp(i8* %.tmp7506, i8* %.tmp7508)
%.tmp7510 = icmp eq i32 %.tmp7509, 0
br i1 %.tmp7510, label %.if.true.7511, label %.if.false.7511
.if.true.7511:
%.tmp7513 = getelementptr [2 x i8], [2 x i8]*@.str7512, i32 0, i32 0
ret i8* %.tmp7513
br label %.if.end.7511
.if.false.7511:
%.tmp7515 = getelementptr [45 x i8], [45 x i8]*@.str7514, i32 0, i32 0
%.tmp7516 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7517 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7516, i32 0, i32 0
%.tmp7518 = load i8*, i8** %.tmp7517
%.tmp7519 = call i32(i8*,...) @printf(i8* %.tmp7515, i8* %.tmp7518)
br label %.if.end.7511
.if.end.7511:
br label %.if.end.7482
.if.end.7482:
br label %.if.end.7471
.if.end.7471:
br label %.if.end.7453
.if.end.7453:
br label %.if.end.7443
.if.end.7443:
br label %.if.end.7433
.if.end.7433:
br label %.if.end.7423
.if.end.7423:
br label %.if.end.7413
.if.end.7413:
%.tmp7520 = bitcast ptr null to i8*
ret i8* %.tmp7520
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7521 = bitcast ptr null to %m307$.Node.type*
%.tmp7522 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7521)
%info.7523 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7522, %m1861$.AssignableInfo.type** %info.7523
%tmp_buff.7524 = alloca i8*
store i8* null, i8** %tmp_buff.7524
%.tmp7525 = getelementptr i8*, i8** %tmp_buff.7524, i32 0
%.tmp7527 = getelementptr [7 x i8], [7 x i8]*@.str7526, i32 0, i32 0
%.tmp7528 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7529 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7528)
%.tmp7530 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7525, i8* %.tmp7527, i32 %.tmp7529)
%.tmp7531 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7532 = load i8, i8* @SCOPE_GLOBAL
%.tmp7533 = load i8*, i8** %tmp_buff.7524
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7531, i8 %.tmp7532, i8* %.tmp7533)
%.tmp7534 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7535 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7534, i32 0, i32 4
%.tmp7536 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7536, %m1861$.Type.type** %.tmp7535
%.tmp7537 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7538 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7537, i32 0, i32 4
%.tmp7539 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7538
%.tmp7540 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7539, i32 0, i32 0
%.tmp7542 = getelementptr [6 x i8], [6 x i8]*@.str7541, i32 0, i32 0
store i8* %.tmp7542, i8** %.tmp7540
%.tmp7543 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7544 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7543, i32 0, i32 4
%.tmp7545 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7544
%.tmp7546 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7545, i32 0, i32 3
%.tmp7547 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7547, %m1861$.Type.type** %.tmp7546
%.tmp7548 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7549 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7548, i32 0, i32 4
%.tmp7550 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7549
%.tmp7551 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7550, i32 0, i32 3
%.tmp7552 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7551
%.tmp7553 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7552, i32 0, i32 0
%.tmp7555 = getelementptr [4 x i8], [4 x i8]*@.str7554, i32 0, i32 0
store i8* %.tmp7555, i8** %.tmp7553
%.tmp7556 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7557 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7556, i32 0, i32 4
%.tmp7558 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7557
%.tmp7559 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7558, i32 0, i32 3
%.tmp7560 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7559
%.tmp7561 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7560, i32 0, i32 4
%.tmp7562 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7562, %m1861$.Type.type** %.tmp7561
%.tmp7563 = load i8*, i8** %text
%.tmp7564 = call i8*(i8*) @m2233$string_to_llvm.cp.cp(i8* %.tmp7563)
%identifier.7565 = alloca i8*
store i8* %.tmp7564, i8** %identifier.7565
%.tmp7566 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
%.tmp7567 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7566, i32 0, i32 4
%.tmp7568 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7567
%.tmp7569 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7568, i32 0, i32 3
%.tmp7570 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7569
%.tmp7571 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7570, i32 0, i32 4
%.tmp7572 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7571
%.tmp7573 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7572, i32 0, i32 0
%.tmp7574 = getelementptr i8*, i8** %.tmp7573, i32 0
%.tmp7576 = getelementptr [3 x i8], [3 x i8]*@.str7575, i32 0, i32 0
%.tmp7577 = load i8*, i8** %identifier.7565
%.tmp7578 = call i32(i8*) @m2233$llvm_str_len.i.cp(i8* %.tmp7577)
%.tmp7579 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7574, i8* %.tmp7576, i32 %.tmp7578)
%.tmp7580 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7581 = load i8*, i8** %identifier.7565
%.tmp7583 = getelementptr [7 x i8], [7 x i8]*@.str7582, i32 0, i32 0
%.tmp7584 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp7580, i8* %.tmp7581, i8* %.tmp7583, %m1861$.AssignableInfo.type* %.tmp7584, i1 0, i1 0)
%.tmp7585 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7523
ret %m1861$.AssignableInfo.type* %.tmp7585
}
define void @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m1861$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp7586 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7587 = ptrtoint %m1861$.GlobalName.type* %.tmp7586 to i32
%.tmp7588 = call i8*(i32) @malloc(i32 %.tmp7587)
%.tmp7589 = bitcast i8* %.tmp7588 to %m1861$.GlobalName.type*
%global.7590 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7589, %m1861$.GlobalName.type** %global.7590
%.tmp7591 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
%.tmp7592 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7591, i32 0, i32 0
%.tmp7593 = load i8*, i8** %id
store i8* %.tmp7593, i8** %.tmp7592
%.tmp7594 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
%.tmp7595 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7594, i32 0, i32 1
%.tmp7596 = load i8*, i8** %type
store i8* %.tmp7596, i8** %.tmp7595
%.tmp7597 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
%.tmp7598 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7597, i32 0, i32 4
%.tmp7599 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp7599, %m1861$.AssignableInfo.type** %.tmp7598
%.tmp7600 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
%.tmp7601 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7600, i32 0, i32 2
%.tmp7602 = load i1, i1* %compiled
store i1 %.tmp7602, i1* %.tmp7601
%.tmp7603 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
%.tmp7604 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7603, i32 0, i32 5
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7604
%.tmp7605 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
%.tmp7606 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7605, i32 0, i32 3
%.tmp7607 = load i1, i1* %weak
store i1 %.tmp7607, i1* %.tmp7606
%.tmp7608 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7609 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7590
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7608, %m1861$.GlobalName.type* %.tmp7609)
ret void
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
%.tmp7610 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7611 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7610)
%info.7612 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7611, %m1861$.AssignableInfo.type** %info.7612
%.tmp7613 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7612
%.tmp7614 = load i8, i8* @SCOPE_CONST
%.tmp7615 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7613, i8 %.tmp7614, i8* %.tmp7615)
%.tmp7616 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7612
%.tmp7617 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7616, i32 0, i32 3
%.tmp7619 = getelementptr [7 x i8], [7 x i8]*@.str7618, i32 0, i32 0
store i8* %.tmp7619, i8** %.tmp7617
%.tmp7620 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7612
%.tmp7621 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7620, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7621
%.tmp7622 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7623 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7624 = load i8*, i8** %as_name
%.tmp7625 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7612
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7622, %m307$.Node.type* %.tmp7623, i8* %.tmp7624, %m1861$.AssignableInfo.type* %.tmp7625)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7626 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7627 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7626, i32 0, i32 3
%.tmp7628 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7627
%.tmp7629 = icmp eq %m1861$.GlobalName.type* %.tmp7628, null
br i1 %.tmp7629, label %.if.true.7630, label %.if.false.7630
.if.true.7630:
%.tmp7631 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7632 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7631, i32 0, i32 3
%.tmp7633 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7633, %m1861$.GlobalName.type** %.tmp7632
ret void
br label %.if.end.7630
.if.false.7630:
br label %.if.end.7630
.if.end.7630:
%.tmp7634 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7635 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7634, i32 0, i32 3
%.tmp7636 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7635
%last_global.7637 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7636, %m1861$.GlobalName.type** %last_global.7637
%.tmp7639 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7640 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7639, i32 0, i32 3
%.tmp7641 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7640
%curr_global.7642 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7641, %m1861$.GlobalName.type** %curr_global.7642
br label %.for.start.7638
.for.start.7638:
%.tmp7643 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7642
%.tmp7644 = icmp ne %m1861$.GlobalName.type* %.tmp7643, null
br i1 %.tmp7644, label %.for.continue.7638, label %.for.end.7638
.for.continue.7638:
%.tmp7645 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7642
%.tmp7646 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7645, i32 0, i32 4
%.tmp7647 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7646
%.tmp7648 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7647, i32 0, i32 0
%.tmp7649 = load i8*, i8** %.tmp7648
%.tmp7650 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp7651 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7650, i32 0, i32 4
%.tmp7652 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7651
%.tmp7653 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7652, i32 0, i32 0
%.tmp7654 = load i8*, i8** %.tmp7653
%.tmp7655 = call i32(i8*,i8*) @strcmp(i8* %.tmp7649, i8* %.tmp7654)
%.tmp7656 = icmp eq i32 %.tmp7655, 0
br i1 %.tmp7656, label %.if.true.7657, label %.if.false.7657
.if.true.7657:
ret void
br label %.if.end.7657
.if.false.7657:
br label %.if.end.7657
.if.end.7657:
%.tmp7658 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7642
store %m1861$.GlobalName.type* %.tmp7658, %m1861$.GlobalName.type** %last_global.7637
%.tmp7659 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7642
%.tmp7660 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7659, i32 0, i32 5
%.tmp7661 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7660
store %m1861$.GlobalName.type* %.tmp7661, %m1861$.GlobalName.type** %curr_global.7642
br label %.for.start.7638
.for.end.7638:
%.tmp7662 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7637
%.tmp7663 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7662, i32 0, i32 5
%.tmp7664 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7664, %m1861$.GlobalName.type** %.tmp7663
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7665 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7666 = icmp eq %m1861$.Type.type* %.tmp7665, null
br i1 %.tmp7666, label %.if.true.7667, label %.if.false.7667
.if.true.7667:
%.tmp7668 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7668, label %.if.true.7669, label %.if.false.7669
.if.true.7669:
%.tmp7671 = getelementptr [44 x i8], [44 x i8]*@.str7670, i32 0, i32 0
%.tmp7672 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7673 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7672, i32 0, i32 7
%.tmp7674 = load i8*, i8** %.tmp7673
%.tmp7675 = call i32(i8*,...) @printf(i8* %.tmp7671, i8* %.tmp7674)
br label %.if.end.7669
.if.false.7669:
br label %.if.end.7669
.if.end.7669:
%.tmp7677 = getelementptr [2 x i8], [2 x i8]*@.str7676, i32 0, i32 0
ret i8* %.tmp7677
br label %.if.end.7667
.if.false.7667:
br label %.if.end.7667
.if.end.7667:
%.tmp7678 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7679 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7678, i32 0, i32 0
%.tmp7680 = load i8*, i8** %.tmp7679
%.tmp7681 = icmp ne i8* %.tmp7680, null
%.tmp7683 = getelementptr [59 x i8], [59 x i8]*@.str7682, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7681, i8* %.tmp7683)
%buf.7684 = alloca i8*
store i8* null, i8** %buf.7684
%.tmp7685 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7686 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7685, i32 0, i32 0
%.tmp7687 = load i8*, i8** %.tmp7686
%.tmp7689 = getelementptr [4 x i8], [4 x i8]*@.str7688, i32 0, i32 0
%.tmp7690 = call i32(i8*,i8*) @strcmp(i8* %.tmp7687, i8* %.tmp7689)
%.tmp7691 = icmp eq i32 %.tmp7690, 0
br i1 %.tmp7691, label %.if.true.7692, label %.if.false.7692
.if.true.7692:
%.tmp7694 = getelementptr [4 x i8], [4 x i8]*@.str7693, i32 0, i32 0
ret i8* %.tmp7694
br label %.if.end.7692
.if.false.7692:
%.tmp7695 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7696 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7695, i32 0, i32 0
%.tmp7697 = load i8*, i8** %.tmp7696
%.tmp7699 = getelementptr [5 x i8], [5 x i8]*@.str7698, i32 0, i32 0
%.tmp7700 = call i32(i8*,i8*) @strcmp(i8* %.tmp7697, i8* %.tmp7699)
%.tmp7701 = icmp eq i32 %.tmp7700, 0
br i1 %.tmp7701, label %.if.true.7702, label %.if.false.7702
.if.true.7702:
%.tmp7704 = getelementptr [5 x i8], [5 x i8]*@.str7703, i32 0, i32 0
ret i8* %.tmp7704
br label %.if.end.7702
.if.false.7702:
%.tmp7705 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7706 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7705, i32 0, i32 0
%.tmp7707 = load i8*, i8** %.tmp7706
%.tmp7709 = getelementptr [5 x i8], [5 x i8]*@.str7708, i32 0, i32 0
%.tmp7710 = call i32(i8*,i8*) @strcmp(i8* %.tmp7707, i8* %.tmp7709)
%.tmp7711 = icmp eq i32 %.tmp7710, 0
br i1 %.tmp7711, label %.if.true.7712, label %.if.false.7712
.if.true.7712:
%.tmp7714 = getelementptr [3 x i8], [3 x i8]*@.str7713, i32 0, i32 0
ret i8* %.tmp7714
br label %.if.end.7712
.if.false.7712:
%.tmp7715 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7716 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7715, i32 0, i32 0
%.tmp7717 = load i8*, i8** %.tmp7716
%.tmp7719 = getelementptr [8 x i8], [8 x i8]*@.str7718, i32 0, i32 0
%.tmp7720 = call i32(i8*,i8*) @strcmp(i8* %.tmp7717, i8* %.tmp7719)
%.tmp7721 = icmp eq i32 %.tmp7720, 0
br i1 %.tmp7721, label %.if.true.7722, label %.if.false.7722
.if.true.7722:
%.tmp7724 = getelementptr [4 x i8], [4 x i8]*@.str7723, i32 0, i32 0
ret i8* %.tmp7724
br label %.if.end.7722
.if.false.7722:
%.tmp7725 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7726 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7725, i32 0, i32 0
%.tmp7727 = load i8*, i8** %.tmp7726
%.tmp7729 = getelementptr [4 x i8], [4 x i8]*@.str7728, i32 0, i32 0
%.tmp7730 = call i32(i8*,i8*) @strcmp(i8* %.tmp7727, i8* %.tmp7729)
%.tmp7731 = icmp eq i32 %.tmp7730, 0
br i1 %.tmp7731, label %.if.true.7732, label %.if.false.7732
.if.true.7732:
%.tmp7734 = getelementptr [3 x i8], [3 x i8]*@.str7733, i32 0, i32 0
ret i8* %.tmp7734
br label %.if.end.7732
.if.false.7732:
%.tmp7735 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7736 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7735, i32 0, i32 0
%.tmp7737 = load i8*, i8** %.tmp7736
%.tmp7739 = getelementptr [9 x i8], [9 x i8]*@.str7738, i32 0, i32 0
%.tmp7740 = call i32(i8*,i8*) @strcmp(i8* %.tmp7737, i8* %.tmp7739)
%.tmp7741 = icmp eq i32 %.tmp7740, 0
br i1 %.tmp7741, label %.if.true.7742, label %.if.false.7742
.if.true.7742:
%.tmp7743 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7745 = getelementptr [4 x i8], [4 x i8]*@.str7744, i32 0, i32 0
%.tmp7746 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7747 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7748 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7747, i32 0, i32 3
%.tmp7749 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7748
%.tmp7750 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7746, %m1861$.Type.type* %.tmp7749)
%.tmp7751 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7743, i8* %.tmp7745, i8* %.tmp7750)
%.tmp7753 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7754 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7753, i32 0, i32 3
%.tmp7755 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7754
%.tmp7756 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7755, i32 0, i32 4
%.tmp7757 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7756
%p.7758 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7757, %m1861$.Type.type** %p.7758
br label %.for.start.7752
.for.start.7752:
%.tmp7759 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7758
%.tmp7760 = icmp ne %m1861$.Type.type* %.tmp7759, null
br i1 %.tmp7760, label %.for.continue.7752, label %.for.end.7752
.for.continue.7752:
%.tmp7761 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7758
%.tmp7762 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7763 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7762, i32 0, i32 3
%.tmp7764 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7763
%.tmp7765 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7764, i32 0, i32 4
%.tmp7766 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7765
%.tmp7767 = icmp ne %m1861$.Type.type* %.tmp7761, %.tmp7766
br i1 %.tmp7767, label %.if.true.7768, label %.if.false.7768
.if.true.7768:
%.tmp7769 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7771 = getelementptr [4 x i8], [4 x i8]*@.str7770, i32 0, i32 0
%.tmp7772 = load i8*, i8** %buf.7684
%.tmp7773 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7769, i8* %.tmp7771, i8* %.tmp7772)
br label %.if.end.7768
.if.false.7768:
br label %.if.end.7768
.if.end.7768:
%.tmp7774 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7776 = getelementptr [5 x i8], [5 x i8]*@.str7775, i32 0, i32 0
%.tmp7777 = load i8*, i8** %buf.7684
%.tmp7778 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7779 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7758
%.tmp7780 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7778, %m1861$.Type.type* %.tmp7779)
%.tmp7781 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7774, i8* %.tmp7776, i8* %.tmp7777, i8* %.tmp7780)
%.tmp7782 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7758
%.tmp7783 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7782, i32 0, i32 4
%.tmp7784 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7783
store %m1861$.Type.type* %.tmp7784, %m1861$.Type.type** %p.7758
br label %.for.start.7752
.for.end.7752:
%.tmp7785 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7787 = getelementptr [4 x i8], [4 x i8]*@.str7786, i32 0, i32 0
%.tmp7788 = load i8*, i8** %buf.7684
%.tmp7789 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7785, i8* %.tmp7787, i8* %.tmp7788)
%.tmp7790 = load i8*, i8** %buf.7684
ret i8* %.tmp7790
br label %.if.end.7742
.if.false.7742:
%.tmp7791 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7792 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7791, i32 0, i32 0
%.tmp7793 = load i8*, i8** %.tmp7792
%.tmp7795 = getelementptr [4 x i8], [4 x i8]*@.str7794, i32 0, i32 0
%.tmp7796 = call i32(i8*,i8*) @strcmp(i8* %.tmp7793, i8* %.tmp7795)
%.tmp7797 = icmp eq i32 %.tmp7796, 0
br i1 %.tmp7797, label %.if.true.7798, label %.if.false.7798
.if.true.7798:
%.tmp7799 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7801 = getelementptr [4 x i8], [4 x i8]*@.str7800, i32 0, i32 0
%.tmp7802 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7803 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7804 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7803, i32 0, i32 3
%.tmp7805 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7804
%.tmp7806 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7802, %m1861$.Type.type* %.tmp7805)
%.tmp7807 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7799, i8* %.tmp7801, i8* %.tmp7806)
%.tmp7808 = load i8*, i8** %buf.7684
ret i8* %.tmp7808
br label %.if.end.7798
.if.false.7798:
%.tmp7809 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7810 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7809, i32 0, i32 0
%.tmp7811 = load i8*, i8** %.tmp7810
%.tmp7813 = getelementptr [7 x i8], [7 x i8]*@.str7812, i32 0, i32 0
%.tmp7814 = call i32(i8*,i8*) @strcmp(i8* %.tmp7811, i8* %.tmp7813)
%.tmp7815 = icmp eq i32 %.tmp7814, 0
br i1 %.tmp7815, label %.if.true.7816, label %.if.false.7816
.if.true.7816:
%.tmp7817 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7819 = getelementptr [2 x i8], [2 x i8]*@.str7818, i32 0, i32 0
%.tmp7820 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7817, i8* %.tmp7819)
%.tmp7822 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7823 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7822, i32 0, i32 3
%.tmp7824 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7823
%t.7825 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7824, %m1861$.Type.type** %t.7825
br label %.for.start.7821
.for.start.7821:
%.tmp7826 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7825
%.tmp7827 = icmp ne %m1861$.Type.type* %.tmp7826, null
br i1 %.tmp7827, label %.for.continue.7821, label %.for.end.7821
.for.continue.7821:
%.tmp7828 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7825
%.tmp7829 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7830 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7829, i32 0, i32 3
%.tmp7831 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7830
%.tmp7832 = icmp ne %m1861$.Type.type* %.tmp7828, %.tmp7831
br i1 %.tmp7832, label %.if.true.7833, label %.if.false.7833
.if.true.7833:
%.tmp7834 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7836 = getelementptr [4 x i8], [4 x i8]*@.str7835, i32 0, i32 0
%.tmp7837 = load i8*, i8** %buf.7684
%.tmp7838 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7834, i8* %.tmp7836, i8* %.tmp7837)
br label %.if.end.7833
.if.false.7833:
br label %.if.end.7833
.if.end.7833:
%.tmp7839 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7841 = getelementptr [5 x i8], [5 x i8]*@.str7840, i32 0, i32 0
%.tmp7842 = load i8*, i8** %buf.7684
%.tmp7843 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7844 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7825
%.tmp7845 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7843, %m1861$.Type.type* %.tmp7844)
%.tmp7846 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7839, i8* %.tmp7841, i8* %.tmp7842, i8* %.tmp7845)
%.tmp7847 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7825
%.tmp7848 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7847, i32 0, i32 4
%.tmp7849 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7848
store %m1861$.Type.type* %.tmp7849, %m1861$.Type.type** %t.7825
br label %.for.start.7821
.for.end.7821:
%.tmp7850 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7852 = getelementptr [4 x i8], [4 x i8]*@.str7851, i32 0, i32 0
%.tmp7853 = load i8*, i8** %buf.7684
%.tmp7854 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7850, i8* %.tmp7852, i8* %.tmp7853)
%.tmp7855 = load i8*, i8** %buf.7684
ret i8* %.tmp7855
br label %.if.end.7816
.if.false.7816:
%.tmp7856 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7857 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7856, i32 0, i32 0
%.tmp7858 = load i8*, i8** %.tmp7857
%.tmp7860 = getelementptr [6 x i8], [6 x i8]*@.str7859, i32 0, i32 0
%.tmp7861 = call i32(i8*,i8*) @strcmp(i8* %.tmp7858, i8* %.tmp7860)
%.tmp7862 = icmp eq i32 %.tmp7861, 0
br i1 %.tmp7862, label %.if.true.7863, label %.if.false.7863
.if.true.7863:
%.tmp7864 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7866 = getelementptr [10 x i8], [10 x i8]*@.str7865, i32 0, i32 0
%.tmp7867 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7868 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7867, i32 0, i32 3
%.tmp7869 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7868
%.tmp7870 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7869, i32 0, i32 4
%.tmp7871 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7870
%.tmp7872 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7871, i32 0, i32 0
%.tmp7873 = load i8*, i8** %.tmp7872
%.tmp7874 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7875 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7876 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7875, i32 0, i32 3
%.tmp7877 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7876
%.tmp7878 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7874, %m1861$.Type.type* %.tmp7877)
%.tmp7879 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7864, i8* %.tmp7866, i8* %.tmp7873, i8* %.tmp7878)
%.tmp7880 = load i8*, i8** %buf.7684
ret i8* %.tmp7880
br label %.if.end.7863
.if.false.7863:
%.tmp7881 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7882 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7881, i32 0, i32 0
%.tmp7883 = load i8*, i8** %.tmp7882
%.tmp7885 = getelementptr [10 x i8], [10 x i8]*@.str7884, i32 0, i32 0
%.tmp7886 = call i32(i8*,i8*) @strcmp(i8* %.tmp7883, i8* %.tmp7885)
%.tmp7887 = icmp eq i32 %.tmp7886, 0
br i1 %.tmp7887, label %.if.true.7888, label %.if.false.7888
.if.true.7888:
%.tmp7889 = getelementptr i8*, i8** %buf.7684, i32 0
%.tmp7891 = getelementptr [5 x i8], [5 x i8]*@.str7890, i32 0, i32 0
%.tmp7892 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7893 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7892, i32 0, i32 2
%.tmp7894 = load i8*, i8** %.tmp7893
%.tmp7895 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7889, i8* %.tmp7891, i8* %.tmp7894)
%.tmp7896 = load i8*, i8** %buf.7684
ret i8* %.tmp7896
br label %.if.end.7888
.if.false.7888:
%.tmp7897 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7898 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7897, i32 0, i32 0
%.tmp7899 = load i8*, i8** %.tmp7898
%.tmp7901 = getelementptr [7 x i8], [7 x i8]*@.str7900, i32 0, i32 0
%.tmp7902 = call i32(i8*,i8*) @strcmp(i8* %.tmp7899, i8* %.tmp7901)
%.tmp7903 = icmp eq i32 %.tmp7902, 0
br i1 %.tmp7903, label %.if.true.7904, label %.if.false.7904
.if.true.7904:
%.tmp7906 = getelementptr [4 x i8], [4 x i8]*@.str7905, i32 0, i32 0
ret i8* %.tmp7906
br label %.if.end.7904
.if.false.7904:
%.tmp7907 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7908 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7907, i32 0, i32 0
%.tmp7909 = load i8*, i8** %.tmp7908
%.tmp7911 = getelementptr [6 x i8], [6 x i8]*@.str7910, i32 0, i32 0
%.tmp7912 = call i32(i8*,i8*) @strcmp(i8* %.tmp7909, i8* %.tmp7911)
%.tmp7913 = icmp eq i32 %.tmp7912, 0
br i1 %.tmp7913, label %.if.true.7914, label %.if.false.7914
.if.true.7914:
br label %.if.end.7914
.if.false.7914:
%.tmp7916 = getelementptr [58 x i8], [58 x i8]*@.str7915, i32 0, i32 0
%.tmp7917 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7918 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7917, i32 0, i32 0
%.tmp7919 = load i8*, i8** %.tmp7918
%.tmp7920 = call i32(i8*,...) @printf(i8* %.tmp7916, i8* %.tmp7919)
br label %.if.end.7914
.if.end.7914:
br label %.if.end.7904
.if.end.7904:
br label %.if.end.7888
.if.end.7888:
br label %.if.end.7863
.if.end.7863:
br label %.if.end.7816
.if.end.7816:
br label %.if.end.7798
.if.end.7798:
br label %.if.end.7742
.if.end.7742:
br label %.if.end.7732
.if.end.7732:
br label %.if.end.7722
.if.end.7722:
br label %.if.end.7712
.if.end.7712:
br label %.if.end.7702
.if.end.7702:
br label %.if.end.7692
.if.end.7692:
%.tmp7921 = bitcast ptr null to i8*
ret i8* %.tmp7921
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7922 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7923 = ptrtoint %m1861$.ErrorList.type* %.tmp7922 to i32
%.tmp7924 = call i8*(i32) @malloc(i32 %.tmp7923)
%.tmp7925 = bitcast i8* %.tmp7924 to %m1861$.ErrorList.type*
%new_err.7926 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7925, %m1861$.ErrorList.type** %new_err.7926
%.tmp7927 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7926
%.tmp7928 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7927, i32 0, i32 2
store i1 0, i1* %.tmp7928
%.tmp7929 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7926
%.tmp7930 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7929, i32 0, i32 0
%.tmp7931 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7931, %m751$.Error.type** %.tmp7930
%.tmp7932 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7926
%.tmp7933 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7932, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7933
%.tmp7934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7935 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7934, i32 0, i32 2
%.tmp7936 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7935
%.tmp7937 = icmp eq %m1861$.ErrorList.type* %.tmp7936, null
br i1 %.tmp7937, label %.if.true.7938, label %.if.false.7938
.if.true.7938:
%.tmp7939 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7940 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7939, i32 0, i32 2
%.tmp7941 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7926
store %m1861$.ErrorList.type* %.tmp7941, %m1861$.ErrorList.type** %.tmp7940
ret void
br label %.if.end.7938
.if.false.7938:
br label %.if.end.7938
.if.end.7938:
%last.7942 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7942
%.tmp7944 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7945 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7944, i32 0, i32 2
%.tmp7946 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7945
store %m1861$.ErrorList.type* %.tmp7946, %m1861$.ErrorList.type** %last.7942
br label %.for.start.7943
.for.start.7943:
%.tmp7947 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7942
%.tmp7948 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7947, i32 0, i32 1
%.tmp7949 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7948
%.tmp7950 = icmp ne %m1861$.ErrorList.type* %.tmp7949, null
br i1 %.tmp7950, label %.for.continue.7943, label %.for.end.7943
.for.continue.7943:
%.tmp7951 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7942
%.tmp7952 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7951, i32 0, i32 1
%.tmp7953 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7952
store %m1861$.ErrorList.type* %.tmp7953, %m1861$.ErrorList.type** %last.7942
br label %.for.start.7943
.for.end.7943:
%.tmp7954 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7942
%.tmp7955 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7954, i32 0, i32 1
%.tmp7956 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7926
store %m1861$.ErrorList.type* %.tmp7956, %m1861$.ErrorList.type** %.tmp7955
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7957 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7958 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7957, i32 0, i32 6
%.tmp7959 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7958
%.tmp7960 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7959, i32 0, i32 7
%.tmp7961 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7960
%.tmp7962 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7961, i32 0, i32 1
%.tmp7963 = load i8*, i8** %.tmp7962
ret i8* %.tmp7963
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7965 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7966 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7965, %m307$.Node.type** %n.7966
br label %.for.start.7964
.for.start.7964:
%.tmp7967 = load %m307$.Node.type*, %m307$.Node.type** %n.7966
%.tmp7968 = icmp ne %m307$.Node.type* %.tmp7967, null
br i1 %.tmp7968, label %.for.continue.7964, label %.for.end.7964
.for.continue.7964:
%.tmp7969 = load %m307$.Node.type*, %m307$.Node.type** %n.7966
%.tmp7970 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7969, i32 0, i32 0
%.tmp7971 = load i8*, i8** %.tmp7970
%.tmp7972 = load i8*, i8** %type
%.tmp7973 = call i32(i8*,i8*) @strcmp(i8* %.tmp7971, i8* %.tmp7972)
%.tmp7974 = icmp eq i32 %.tmp7973, 0
br i1 %.tmp7974, label %.if.true.7975, label %.if.false.7975
.if.true.7975:
%.tmp7976 = load %m307$.Node.type*, %m307$.Node.type** %n.7966
ret %m307$.Node.type* %.tmp7976
br label %.if.end.7975
.if.false.7975:
br label %.if.end.7975
.if.end.7975:
%.tmp7977 = load %m307$.Node.type*, %m307$.Node.type** %n.7966
%.tmp7978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7977, i32 0, i32 7
%.tmp7979 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7978
store %m307$.Node.type* %.tmp7979, %m307$.Node.type** %n.7966
br label %.for.start.7964
.for.end.7964:
%.tmp7980 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7980
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7981 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7982 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7981, %m1861$.Type.type** %function_type.7982
%.tmp7983 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7984 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7984, i32 0, i32 6
%.tmp7986 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7985
%.tmp7987 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7983, %m307$.Node.type* %.tmp7986)
%return_value_type.7988 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7987, %m1861$.Type.type** %return_value_type.7988
%.tmp7989 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7982
%.tmp7990 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7989, i32 0, i32 0
%.tmp7992 = getelementptr [9 x i8], [9 x i8]*@.str7991, i32 0, i32 0
store i8* %.tmp7992, i8** %.tmp7990
%.tmp7993 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7982
%.tmp7994 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7993, i32 0, i32 3
%.tmp7995 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7988
store %m1861$.Type.type* %.tmp7995, %m1861$.Type.type** %.tmp7994
%.tmp7996 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7988
%last_type.7997 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7996, %m1861$.Type.type** %last_type.7997
%.tmp7998 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7999 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7998)
%params.8000 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7999, %m307$.Node.type** %params.8000
%.tmp8002 = load %m307$.Node.type*, %m307$.Node.type** %params.8000
%param_ptr.8003 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8002, %m307$.Node.type** %param_ptr.8003
br label %.for.start.8001
.for.start.8001:
%.tmp8004 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8005 = icmp ne %m307$.Node.type* %.tmp8004, null
br i1 %.tmp8005, label %.for.continue.8001, label %.for.end.8001
.for.continue.8001:
%.tmp8006 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8007 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8006, i32 0, i32 0
%.tmp8008 = load i8*, i8** %.tmp8007
%.tmp8010 = getelementptr [5 x i8], [5 x i8]*@.str8009, i32 0, i32 0
%.tmp8011 = call i32(i8*,i8*) @strcmp(i8* %.tmp8008, i8* %.tmp8010)
%.tmp8012 = icmp eq i32 %.tmp8011, 0
br i1 %.tmp8012, label %.if.true.8013, label %.if.false.8013
.if.true.8013:
%.tmp8014 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7997
%.tmp8015 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8014, i32 0, i32 4
%.tmp8016 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7997
%.tmp8017 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp8016)
store %m1861$.Type.type* %.tmp8017, %m1861$.Type.type** %.tmp8015
%.tmp8018 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7997
%.tmp8019 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8018, i32 0, i32 4
%.tmp8020 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8019
%.tmp8021 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8020, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp8021
%.tmp8022 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7997
%.tmp8023 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8022, i32 0, i32 4
%.tmp8024 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8023
store %m1861$.Type.type* %.tmp8024, %m1861$.Type.type** %last_type.7997
%.tmp8025 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8026 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8025, i32 0, i32 7
%.tmp8027 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8026
%.tmp8028 = icmp ne %m307$.Node.type* %.tmp8027, null
br i1 %.tmp8028, label %.if.true.8029, label %.if.false.8029
.if.true.8029:
%.tmp8030 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8031 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8030, i32 0, i32 7
%.tmp8032 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8031
store %m307$.Node.type* %.tmp8032, %m307$.Node.type** %param_ptr.8003
br label %.if.end.8029
.if.false.8029:
br label %.if.end.8029
.if.end.8029:
%.tmp8033 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8033, i32 0, i32 7
%.tmp8035 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8034
%.tmp8036 = icmp ne %m307$.Node.type* %.tmp8035, null
br i1 %.tmp8036, label %.if.true.8037, label %.if.false.8037
.if.true.8037:
%.tmp8038 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8039 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8038, i32 0, i32 7
%.tmp8040 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8039
store %m307$.Node.type* %.tmp8040, %m307$.Node.type** %param_ptr.8003
br label %.if.end.8037
.if.false.8037:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.8003
br label %.if.end.8037
.if.end.8037:
br label %.if.end.8013
.if.false.8013:
%.tmp8041 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8042 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8043 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8042, i32 0, i32 6
%.tmp8044 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8043
%.tmp8045 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8041, %m307$.Node.type* %.tmp8044)
%param_type.8046 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8045, %m1861$.Type.type** %param_type.8046
%.tmp8047 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7997
%.tmp8048 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8047, i32 0, i32 4
%.tmp8049 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.8046
store %m1861$.Type.type* %.tmp8049, %m1861$.Type.type** %.tmp8048
%.tmp8050 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.8046
store %m1861$.Type.type* %.tmp8050, %m1861$.Type.type** %last_type.7997
%.tmp8051 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8052 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8051, i32 0, i32 7
%.tmp8053 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8052
store %m307$.Node.type* %.tmp8053, %m307$.Node.type** %param_ptr.8003
%.tmp8054 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8055 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8054, i32 0, i32 7
%.tmp8056 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8055
%.tmp8057 = icmp ne %m307$.Node.type* %.tmp8056, null
br i1 %.tmp8057, label %.if.true.8058, label %.if.false.8058
.if.true.8058:
%.tmp8059 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.8003
%.tmp8060 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8059, i32 0, i32 7
%.tmp8061 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8060
%.tmp8062 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8061, i32 0, i32 7
%.tmp8063 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8062
store %m307$.Node.type* %.tmp8063, %m307$.Node.type** %param_ptr.8003
br label %.if.end.8058
.if.false.8058:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.8003
br label %.if.end.8058
.if.end.8058:
br label %.if.end.8013
.if.end.8013:
br label %.for.start.8001
.for.end.8001:
%.tmp8064 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7982
ret %m1861$.Type.type* %.tmp8064
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp8065 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8067 = getelementptr [10 x i8], [10 x i8]*@.str8066, i32 0, i32 0
%.tmp8068 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8065, i8* %.tmp8067)
%params.8069 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8068, %m307$.Node.type** %params.8069
%.tmp8070 = load %m307$.Node.type*, %m307$.Node.type** %params.8069
%.tmp8071 = icmp eq %m307$.Node.type* %.tmp8070, null
br i1 %.tmp8071, label %.if.true.8072, label %.if.false.8072
.if.true.8072:
%.tmp8073 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp8073
br label %.if.end.8072
.if.false.8072:
br label %.if.end.8072
.if.end.8072:
%.tmp8074 = load %m307$.Node.type*, %m307$.Node.type** %params.8069
%.tmp8075 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8074, i32 0, i32 6
%.tmp8076 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8075
ret %m307$.Node.type* %.tmp8076
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp8077 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.8078 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8077, %m1861$.Type.type** %t.8078
%.tmp8079 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8080 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8079, i32 0, i32 0
%.tmp8081 = load i8*, i8** %.tmp8080
%.tmp8083 = getelementptr [10 x i8], [10 x i8]*@.str8082, i32 0, i32 0
%.tmp8084 = call i32(i8*,i8*) @strcmp(i8* %.tmp8081, i8* %.tmp8083)
%.tmp8085 = icmp eq i32 %.tmp8084, 0
br i1 %.tmp8085, label %.if.true.8086, label %.if.false.8086
.if.true.8086:
%.tmp8087 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8088 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8087, i32 0, i32 0
%.tmp8090 = getelementptr [7 x i8], [7 x i8]*@.str8089, i32 0, i32 0
store i8* %.tmp8090, i8** %.tmp8088
%.tmp8091 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8092 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8091, i32 0, i32 1
store i8* null, i8** %.tmp8092
%.tmp8093 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8094 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8093, i32 0, i32 6
%.tmp8095 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8094
%.tmp8097 = getelementptr [5 x i8], [5 x i8]*@.str8096, i32 0, i32 0
%.tmp8098 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8095, i8* %.tmp8097)
%curr_type.8099 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8098, %m307$.Node.type** %curr_type.8099
%.tmp8100 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8101 = icmp ne %m307$.Node.type* %.tmp8100, null
br i1 %.tmp8101, label %.if.true.8102, label %.if.false.8102
.if.true.8102:
%.tmp8103 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8104 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8103, i32 0, i32 3
%.tmp8105 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8106 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8107 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8106, i32 0, i32 6
%.tmp8108 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8107
%.tmp8109 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8105, %m307$.Node.type* %.tmp8108)
store %m1861$.Type.type* %.tmp8109, %m1861$.Type.type** %.tmp8104
%.tmp8110 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8111 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8110, i32 0, i32 3
%.tmp8112 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8111
%.tmp8113 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8112, i32 0, i32 1
%.tmp8114 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8115 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8114, i32 0, i32 7
%.tmp8116 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8115
%.tmp8117 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8116, i32 0, i32 1
%.tmp8118 = load i8*, i8** %.tmp8117
store i8* %.tmp8118, i8** %.tmp8113
%.tmp8119 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8120 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8119, i32 0, i32 3
%.tmp8121 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8120
%curr_t.8122 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8121, %m1861$.Type.type** %curr_t.8122
%.tmp8124 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8125 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8124, i32 0, i32 7
%.tmp8126 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8125
%.tmp8128 = getelementptr [5 x i8], [5 x i8]*@.str8127, i32 0, i32 0
%.tmp8129 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8126, i8* %.tmp8128)
store %m307$.Node.type* %.tmp8129, %m307$.Node.type** %curr_type.8099
br label %.for.start.8123
.for.start.8123:
%.tmp8130 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8131 = icmp ne %m307$.Node.type* %.tmp8130, null
br i1 %.tmp8131, label %.for.continue.8123, label %.for.end.8123
.for.continue.8123:
%.tmp8132 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8122
%.tmp8133 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8132, i32 0, i32 4
%.tmp8134 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8135 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8136 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8135, i32 0, i32 6
%.tmp8137 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8136
%.tmp8138 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8134, %m307$.Node.type* %.tmp8137)
store %m1861$.Type.type* %.tmp8138, %m1861$.Type.type** %.tmp8133
%.tmp8139 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8122
%.tmp8140 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8139, i32 0, i32 4
%.tmp8141 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8140
%.tmp8142 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8141, i32 0, i32 1
%.tmp8143 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8144 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8143, i32 0, i32 7
%.tmp8145 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8144
%.tmp8146 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8145, i32 0, i32 1
%.tmp8147 = load i8*, i8** %.tmp8146
store i8* %.tmp8147, i8** %.tmp8142
%.tmp8148 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8122
%.tmp8149 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8148, i32 0, i32 4
%.tmp8150 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8149
store %m1861$.Type.type* %.tmp8150, %m1861$.Type.type** %curr_t.8122
%.tmp8151 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8099
%.tmp8152 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8151, i32 0, i32 7
%.tmp8153 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8152
%.tmp8155 = getelementptr [5 x i8], [5 x i8]*@.str8154, i32 0, i32 0
%.tmp8156 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8153, i8* %.tmp8155)
store %m307$.Node.type* %.tmp8156, %m307$.Node.type** %curr_type.8099
br label %.for.start.8123
.for.end.8123:
br label %.if.end.8102
.if.false.8102:
br label %.if.end.8102
.if.end.8102:
br label %.if.end.8086
.if.false.8086:
%.tmp8157 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8158 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8157, i32 0, i32 0
%.tmp8159 = load i8*, i8** %.tmp8158
%.tmp8161 = getelementptr [12 x i8], [12 x i8]*@.str8160, i32 0, i32 0
%.tmp8162 = call i32(i8*,i8*) @strcmp(i8* %.tmp8159, i8* %.tmp8161)
%.tmp8163 = icmp eq i32 %.tmp8162, 0
br i1 %.tmp8163, label %.if.true.8164, label %.if.false.8164
.if.true.8164:
%err_msg.8165 = alloca i8*
store i8* null, i8** %err_msg.8165
%.tmp8166 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8167 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8168 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8166, %m307$.Node.type* %.tmp8167)
%base.8169 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp8168, %m1861$.ScopeItem.type** %base.8169
%.tmp8170 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8169
%.tmp8171 = icmp eq %m1861$.ScopeItem.type* %.tmp8170, null
br i1 %.tmp8171, label %.if.true.8172, label %.if.false.8172
.if.true.8172:
%.tmp8173 = getelementptr i8*, i8** %err_msg.8165, i32 0
%.tmp8175 = getelementptr [37 x i8], [37 x i8]*@.str8174, i32 0, i32 0
%.tmp8176 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8177 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8176, i32 0, i32 6
%.tmp8178 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8177
%.tmp8179 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8178, i32 0, i32 1
%.tmp8180 = load i8*, i8** %.tmp8179
%.tmp8181 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8173, i8* %.tmp8175, i8* %.tmp8180)
%.tmp8182 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8183 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8184 = load i8*, i8** %err_msg.8165
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8182, %m307$.Node.type* %.tmp8183, i8* %.tmp8184)
%.tmp8185 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8186 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8185, i32 0, i32 0
%.tmp8188 = getelementptr [6 x i8], [6 x i8]*@.str8187, i32 0, i32 0
store i8* %.tmp8188, i8** %.tmp8186
%.tmp8189 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
ret %m1861$.Type.type* %.tmp8189
br label %.if.end.8172
.if.false.8172:
br label %.if.end.8172
.if.end.8172:
%.tmp8190 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8191 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8190, i32 0, i32 0
%.tmp8193 = getelementptr [10 x i8], [10 x i8]*@.str8192, i32 0, i32 0
store i8* %.tmp8193, i8** %.tmp8191
%.tmp8194 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8195 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8194, i32 0, i32 1
%.tmp8196 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8169
%.tmp8197 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8196, i32 0, i32 0
%.tmp8198 = load i8*, i8** %.tmp8197
store i8* %.tmp8198, i8** %.tmp8195
%.tmp8199 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8200 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8199, i32 0, i32 2
%.tmp8201 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8169
%.tmp8202 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8201, i32 0, i32 1
%.tmp8203 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8202
%.tmp8204 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8203, i32 0, i32 0
%.tmp8205 = load i8*, i8** %.tmp8204
store i8* %.tmp8205, i8** %.tmp8200
%.tmp8206 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8207 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8206, i32 0, i32 3
%.tmp8208 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8169
%.tmp8209 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8208, i32 0, i32 1
%.tmp8210 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8209
%.tmp8211 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8210, i32 0, i32 4
%.tmp8212 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8211
store %m1861$.Type.type* %.tmp8212, %m1861$.Type.type** %.tmp8207
br label %.if.end.8164
.if.false.8164:
%.tmp8213 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8214 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8213, i32 0, i32 1
%.tmp8215 = load i8*, i8** %.tmp8214
%.tmp8217 = getelementptr [4 x i8], [4 x i8]*@.str8216, i32 0, i32 0
%.tmp8218 = call i32(i8*,i8*) @strcmp(i8* %.tmp8215, i8* %.tmp8217)
%.tmp8219 = icmp eq i32 %.tmp8218, 0
br i1 %.tmp8219, label %.if.true.8220, label %.if.false.8220
.if.true.8220:
%.tmp8221 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8222 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8221, i32 0, i32 0
%.tmp8224 = getelementptr [4 x i8], [4 x i8]*@.str8223, i32 0, i32 0
store i8* %.tmp8224, i8** %.tmp8222
%.tmp8225 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8226 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8225, i32 0, i32 3
%.tmp8227 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp8227, %m1861$.Type.type** %.tmp8226
%.tmp8228 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8229 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8228, i32 0, i32 3
%.tmp8230 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8229
%.tmp8231 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8230, i32 0, i32 0
%.tmp8233 = getelementptr [4 x i8], [4 x i8]*@.str8232, i32 0, i32 0
store i8* %.tmp8233, i8** %.tmp8231
br label %.if.end.8220
.if.false.8220:
%.tmp8234 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8235 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8234, i32 0, i32 0
%.tmp8236 = load i8*, i8** %.tmp8235
%.tmp8238 = getelementptr [5 x i8], [5 x i8]*@.str8237, i32 0, i32 0
%.tmp8239 = call i32(i8*,i8*) @strcmp(i8* %.tmp8236, i8* %.tmp8238)
%.tmp8240 = icmp eq i32 %.tmp8239, 0
br i1 %.tmp8240, label %.if.true.8241, label %.if.false.8241
.if.true.8241:
%.tmp8242 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8243 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8242, i32 0, i32 0
%.tmp8244 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8245 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8244, i32 0, i32 1
%.tmp8246 = load i8*, i8** %.tmp8245
store i8* %.tmp8246, i8** %.tmp8243
br label %.if.end.8241
.if.false.8241:
%.tmp8247 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8248 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8247, i32 0, i32 1
%.tmp8249 = load i8*, i8** %.tmp8248
%.tmp8251 = getelementptr [4 x i8], [4 x i8]*@.str8250, i32 0, i32 0
%.tmp8252 = call i32(i8*,i8*) @strcmp(i8* %.tmp8249, i8* %.tmp8251)
%.tmp8253 = icmp eq i32 %.tmp8252, 0
br i1 %.tmp8253, label %.if.true.8254, label %.if.false.8254
.if.true.8254:
%.tmp8255 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
%.tmp8256 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8255, i32 0, i32 0
%.tmp8258 = getelementptr [7 x i8], [7 x i8]*@.str8257, i32 0, i32 0
store i8* %.tmp8258, i8** %.tmp8256
br label %.if.end.8254
.if.false.8254:
%.tmp8259 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8260 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8262 = getelementptr [54 x i8], [54 x i8]*@.str8261, i32 0, i32 0
%.tmp8263 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8259, %m307$.Node.type* %.tmp8260, i8* %.tmp8262)
%.tmp8264 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8265 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8264, i32 0, i32 0
%.tmp8266 = load i8*, i8** %.tmp8265
%.tmp8267 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8268 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8267, i32 0, i32 1
%.tmp8269 = load i8*, i8** %.tmp8268
%.tmp8270 = call i32(i8*,...) @printf(i8* %.tmp8263, i8* %.tmp8266, i8* %.tmp8269)
%.tmp8271 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8271
br label %.if.end.8254
.if.end.8254:
br label %.if.end.8241
.if.end.8241:
br label %.if.end.8220
.if.end.8220:
br label %.if.end.8164
.if.end.8164:
br label %.if.end.8086
.if.end.8086:
%.tmp8273 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8274 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8273, i32 0, i32 7
%.tmp8275 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8274
%ptr.8276 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8275, %m307$.Node.type** %ptr.8276
br label %.for.start.8272
.for.start.8272:
%.tmp8277 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8278 = icmp ne %m307$.Node.type* %.tmp8277, null
br i1 %.tmp8278, label %.for.continue.8272, label %.for.end.8272
.for.continue.8272:
%.tmp8279 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8280 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8279, i32 0, i32 1
%.tmp8281 = load i8*, i8** %.tmp8280
%.tmp8283 = getelementptr [2 x i8], [2 x i8]*@.str8282, i32 0, i32 0
%.tmp8284 = call i32(i8*,i8*) @strcmp(i8* %.tmp8281, i8* %.tmp8283)
%.tmp8285 = icmp eq i32 %.tmp8284, 0
br i1 %.tmp8285, label %.if.true.8286, label %.if.false.8286
.if.true.8286:
%.tmp8287 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.8288 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8287, %m1861$.Type.type** %pt.8288
%.tmp8289 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8288
%.tmp8290 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8289, i32 0, i32 0
%.tmp8292 = getelementptr [4 x i8], [4 x i8]*@.str8291, i32 0, i32 0
store i8* %.tmp8292, i8** %.tmp8290
%.tmp8293 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8288
%.tmp8294 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8293, i32 0, i32 3
%.tmp8295 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
store %m1861$.Type.type* %.tmp8295, %m1861$.Type.type** %.tmp8294
%.tmp8296 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8288
store %m1861$.Type.type* %.tmp8296, %m1861$.Type.type** %t.8078
br label %.if.end.8286
.if.false.8286:
%.tmp8297 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8298 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8297, i32 0, i32 1
%.tmp8299 = load i8*, i8** %.tmp8298
%.tmp8301 = getelementptr [2 x i8], [2 x i8]*@.str8300, i32 0, i32 0
%.tmp8302 = call i32(i8*,i8*) @strcmp(i8* %.tmp8299, i8* %.tmp8301)
%.tmp8303 = icmp eq i32 %.tmp8302, 0
br i1 %.tmp8303, label %.if.true.8304, label %.if.false.8304
.if.true.8304:
%.tmp8305 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8305, i32 0, i32 7
%.tmp8307 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8306
%.tmp8308 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8307, i32 0, i32 1
%.tmp8309 = load i8*, i8** %.tmp8308
%.tmp8311 = getelementptr [2 x i8], [2 x i8]*@.str8310, i32 0, i32 0
%.tmp8312 = call i32(i8*,i8*) @strcmp(i8* %.tmp8309, i8* %.tmp8311)
%.tmp8313 = icmp eq i32 %.tmp8312, 0
br i1 %.tmp8313, label %.if.true.8314, label %.if.false.8314
.if.true.8314:
%.tmp8315 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.8316 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8315, %m1861$.Type.type** %slice_type.8316
%.tmp8317 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8316
%.tmp8318 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8317, i32 0, i32 0
%.tmp8320 = getelementptr [7 x i8], [7 x i8]*@.str8319, i32 0, i32 0
store i8* %.tmp8320, i8** %.tmp8318
%.tmp8321 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8316
%.tmp8322 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8321, i32 0, i32 1
%.tmp8324 = getelementptr [6 x i8], [6 x i8]*@.str8323, i32 0, i32 0
store i8* %.tmp8324, i8** %.tmp8322
%.tmp8325 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.8326 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8325, %m1861$.Type.type** %slice_c_array.8326
%.tmp8327 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8326
%.tmp8328 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8327, i32 0, i32 0
%.tmp8330 = getelementptr [4 x i8], [4 x i8]*@.str8329, i32 0, i32 0
store i8* %.tmp8330, i8** %.tmp8328
%.tmp8331 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8326
%.tmp8332 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8331, i32 0, i32 1
%.tmp8334 = getelementptr [6 x i8], [6 x i8]*@.str8333, i32 0, i32 0
store i8* %.tmp8334, i8** %.tmp8332
%.tmp8335 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8326
%.tmp8336 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8335, i32 0, i32 3
%.tmp8337 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
store %m1861$.Type.type* %.tmp8337, %m1861$.Type.type** %.tmp8336
%.tmp8338 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8316
%.tmp8339 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8338, i32 0, i32 3
%.tmp8340 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8326
store %m1861$.Type.type* %.tmp8340, %m1861$.Type.type** %.tmp8339
%.tmp8341 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.8342 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8341, %m1861$.Type.type** %slice_len.8342
%.tmp8343 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8342
%.tmp8344 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8343, i32 0, i32 0
%.tmp8346 = getelementptr [4 x i8], [4 x i8]*@.str8345, i32 0, i32 0
store i8* %.tmp8346, i8** %.tmp8344
%.tmp8347 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8342
%.tmp8348 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8347, i32 0, i32 1
%.tmp8350 = getelementptr [4 x i8], [4 x i8]*@.str8349, i32 0, i32 0
store i8* %.tmp8350, i8** %.tmp8348
%.tmp8351 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8326
%.tmp8352 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8351, i32 0, i32 4
%.tmp8353 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8342
store %m1861$.Type.type* %.tmp8353, %m1861$.Type.type** %.tmp8352
%.tmp8354 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.8355 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8354, %m1861$.Type.type** %slice_cap.8355
%.tmp8356 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8355
%.tmp8357 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8356, i32 0, i32 0
%.tmp8359 = getelementptr [4 x i8], [4 x i8]*@.str8358, i32 0, i32 0
store i8* %.tmp8359, i8** %.tmp8357
%.tmp8360 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8355
%.tmp8361 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8360, i32 0, i32 1
%.tmp8363 = getelementptr [4 x i8], [4 x i8]*@.str8362, i32 0, i32 0
store i8* %.tmp8363, i8** %.tmp8361
%.tmp8364 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8342
%.tmp8365 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8364, i32 0, i32 4
%.tmp8366 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8355
store %m1861$.Type.type* %.tmp8366, %m1861$.Type.type** %.tmp8365
%.tmp8367 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8316
store %m1861$.Type.type* %.tmp8367, %m1861$.Type.type** %t.8078
%.tmp8368 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8369 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8368, i32 0, i32 7
%.tmp8370 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8369
store %m307$.Node.type* %.tmp8370, %m307$.Node.type** %ptr.8276
br label %.if.end.8314
.if.false.8314:
br label %.if.end.8314
.if.end.8314:
br label %.if.end.8304
.if.false.8304:
%.tmp8371 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8372 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8374 = getelementptr [49 x i8], [49 x i8]*@.str8373, i32 0, i32 0
%.tmp8375 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8371, %m307$.Node.type* %.tmp8372, i8* %.tmp8374)
%.tmp8376 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8377 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8376, i32 0, i32 1
%.tmp8378 = load i8*, i8** %.tmp8377
%.tmp8379 = call i32(i8*,...) @printf(i8* %.tmp8375, i8* %.tmp8378)
%.tmp8380 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8380
br label %.if.end.8304
.if.end.8304:
br label %.if.end.8286
.if.end.8286:
%.tmp8381 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8276
%.tmp8382 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8381, i32 0, i32 7
%.tmp8383 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8382
store %m307$.Node.type* %.tmp8383, %m307$.Node.type** %ptr.8276
br label %.for.start.8272
.for.end.8272:
%.tmp8384 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8078
ret %m1861$.Type.type* %.tmp8384
}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8385 = load i32, i32* %argc
%.tmp8386 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp8385, i8** %.tmp8386)
%.tmp8387 = load i32, i32* @STDERR
%.tmp8389 = getelementptr [2 x i8], [2 x i8]*@.str8388, i32 0, i32 0
%.tmp8390 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp8387, i8* %.tmp8389)
%stderr.8391 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8390, %m0$.File.type** %stderr.8391
%.tmp8392 = load i8**, i8*** %argv
%.tmp8393 = getelementptr i8*, i8** %.tmp8392, i32 1
%.tmp8394 = load i8*, i8** %.tmp8393
%filename.8395 = alloca i8*
store i8* %.tmp8394, i8** %filename.8395
%.tmp8396 = call %m0$.File.type*() @tmpfile()
%llvm_code.8397 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8396, %m0$.File.type** %llvm_code.8397
%.tmp8398 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8397
%.tmp8399 = load i8*, i8** %filename.8395
%.tmp8400 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp8398, i8* %.tmp8399)
%compiler_ctx.8401 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp8400, %m1861$.CompilerCtx.type** %compiler_ctx.8401
%.tmp8402 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.8401
%.tmp8403 = bitcast ptr null to %m307$.Node.type*
%.tmp8404 = load i8*, i8** %filename.8395
%.tmp8405 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8402, %m307$.Node.type* %.tmp8403, i8* %.tmp8404)
br i1 %.tmp8405, label %.if.true.8406, label %.if.false.8406
.if.true.8406:
%.tmp8407 = load %m0$.File.type*, %m0$.File.type** %stderr.8391
%.tmp8409 = getelementptr [34 x i8], [34 x i8]*@.str8408, i32 0, i32 0
%.tmp8410 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8407, i8* %.tmp8409)
ret i32 1
br label %.if.end.8406
.if.false.8406:
br label %.if.end.8406
.if.end.8406:
%.tmp8411 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8397
%.tmp8412 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp8411)
%.tmp8413 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8397
%.tmp8414 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp8413)
%llvm_code_size.8415 = alloca i32
store i32 %.tmp8414, i32* %llvm_code_size.8415
%.tmp8416 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8397
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp8416)
%.tmp8418 = getelementptr [30 x i8], [30 x i8]*@.str8417, i32 0, i32 0
%.tmp8420 = getelementptr [2 x i8], [2 x i8]*@.str8419, i32 0, i32 0
%.tmp8421 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8418, i8* %.tmp8420)
%proc.8422 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8421, %m0$.File.type** %proc.8422
%.tmp8423 = load %m0$.File.type*, %m0$.File.type** %proc.8422
%.tmp8424 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8423)
%.tmp8425 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8397
%.tmp8426 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8425)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp8424, i32 %.tmp8426)
%.tmp8427 = load %m0$.File.type*, %m0$.File.type** %proc.8422
%.tmp8428 = icmp eq %m0$.File.type* %.tmp8427, null
br i1 %.tmp8428, label %.if.true.8429, label %.if.false.8429
.if.true.8429:
%.tmp8430 = load %m0$.File.type*, %m0$.File.type** %stderr.8391
%.tmp8432 = getelementptr [28 x i8], [28 x i8]*@.str8431, i32 0, i32 0
%.tmp8433 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8430, i8* %.tmp8432)
ret i32 0
br label %.if.end.8429
.if.false.8429:
br label %.if.end.8429
.if.end.8429:
%.tmp8434 = load %m0$.File.type*, %m0$.File.type** %proc.8422
%.tmp8435 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8434)
%.tmp8436 = icmp ne i32 %.tmp8435, 0
br i1 %.tmp8436, label %.if.true.8437, label %.if.false.8437
.if.true.8437:
%.tmp8438 = load %m0$.File.type*, %m0$.File.type** %stderr.8391
%.tmp8440 = getelementptr [24 x i8], [24 x i8]*@.str8439, i32 0, i32 0
%.tmp8441 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8438, i8* %.tmp8440)
ret i32 0
br label %.if.end.8437
.if.false.8437:
br label %.if.end.8437
.if.end.8437:
%.tmp8443 = getelementptr [16 x i8], [16 x i8]*@.str8442, i32 0, i32 0
%.tmp8445 = getelementptr [2 x i8], [2 x i8]*@.str8444, i32 0, i32 0
%.tmp8446 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8443, i8* %.tmp8445)
%cc_proc.8447 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8446, %m0$.File.type** %cc_proc.8447
%.tmp8448 = load %m0$.File.type*, %m0$.File.type** %cc_proc.8447
%.tmp8449 = icmp eq %m0$.File.type* %.tmp8448, null
br i1 %.tmp8449, label %.if.true.8450, label %.if.false.8450
.if.true.8450:
%.tmp8451 = load %m0$.File.type*, %m0$.File.type** %stderr.8391
%.tmp8453 = getelementptr [28 x i8], [28 x i8]*@.str8452, i32 0, i32 0
%.tmp8454 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8451, i8* %.tmp8453)
ret i32 0
br label %.if.end.8450
.if.false.8450:
br label %.if.end.8450
.if.end.8450:
%.tmp8455 = load %m0$.File.type*, %m0$.File.type** %proc.8422
%.tmp8456 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8455)
%.tmp8457 = icmp ne i32 %.tmp8456, 0
br i1 %.tmp8457, label %.if.true.8458, label %.if.false.8458
.if.true.8458:
%.tmp8459 = load %m0$.File.type*, %m0$.File.type** %stderr.8391
%.tmp8461 = getelementptr [22 x i8], [22 x i8]*@.str8460, i32 0, i32 0
%.tmp8462 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8459, i8* %.tmp8461)
br label %.if.end.8458
.if.false.8458:
%.tmp8464 = getelementptr [32 x i8], [32 x i8]*@.str8463, i32 0, i32 0
%.tmp8465 = load i8*, i8** %filename.8395
%.tmp8466 = call i32(i8*,...) @printf(i8* %.tmp8464, i8* %.tmp8465)
br label %.if.end.8458
.if.end.8458:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8467 = load i32, i32* %argc
%.tmp8468 = icmp eq i32 %.tmp8467, 2
br i1 %.tmp8468, label %.if.true.8469, label %.if.false.8469
.if.true.8469:
ret void
br label %.if.end.8469
.if.false.8469:
br label %.if.end.8469
.if.end.8469:
%.tmp8471 = getelementptr [21 x i8], [21 x i8]*@.str8470, i32 0, i32 0
%tmpl.8472 = alloca i8*
store i8* %.tmp8471, i8** %tmpl.8472
%.tmp8473 = load i8**, i8*** %argv
%.tmp8474 = getelementptr i8*, i8** %.tmp8473, i32 0
%.tmp8475 = load i8*, i8** %.tmp8474
%.tmp8476 = call i32(i8*) @strlen(i8* %.tmp8475)
%.tmp8477 = load i8*, i8** %tmpl.8472
%.tmp8478 = call i32(i8*) @strlen(i8* %.tmp8477)
%.tmp8479 = add i32 %.tmp8476, %.tmp8478
%len_filename.8480 = alloca i32
store i32 %.tmp8479, i32* %len_filename.8480
%.tmp8481 = load i32, i32* %len_filename.8480
%.tmp8482 = call i8*(i32) @malloc(i32 %.tmp8481)
%buf.8483 = alloca i8*
store i8* %.tmp8482, i8** %buf.8483
%.tmp8484 = load i8*, i8** %buf.8483
%.tmp8485 = load i8*, i8** %tmpl.8472
%.tmp8486 = load i8**, i8*** %argv
%.tmp8487 = getelementptr i8*, i8** %.tmp8486, i32 0
%.tmp8488 = load i8*, i8** %.tmp8487
%.tmp8489 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8484, i8* %.tmp8485, i8* %.tmp8488)
%.tmp8490 = load i8*, i8** %buf.8483
%.tmp8491 = call i32(i8*) @puts(i8* %.tmp8490)
%.tmp8492 = load i8*, i8** %buf.8483
call void(i8*) @free(i8* %.tmp8492)
call void(i32) @exit(i32 1)
ret void
}
@.str226 = constant [2 x i8] c"r\00"
@.str304 = constant [1 x i8] c"\00"
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
@.str781 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str797 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
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
@.str2449 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2489 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2494 = constant [3 x i8] c"%d\00"
@.str2502 = constant [6 x i8] c"'\5C%x'\00"
@.str2507 = constant [3 x i8] c"%d\00"
@.str2515 = constant [6 x i8] c"'\5C%c'\00"
@.str2522 = constant [3 x i8] c"10\00"
@.str2529 = constant [5 x i8] c"'%c'\00"
@.str2534 = constant [3 x i8] c"%d\00"
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
@.str2579 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str2586 = constant [5 x i8] c"HOME\00"
@.str2591 = constant [11 x i8] c"%s/.coffee\00"
@.str2679 = constant [1 x i8] c"\00"
@.str2725 = constant [5 x i8] c"%c%s\00"
@.str2749 = constant [7 x i8] c".tmp%d\00"
@.str2846 = constant [1 x i8] c"\00"
@.str2888 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2912 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2931 = constant [6 x i8] c"start\00"
@.str3008 = constant [6 x i8] c"start\00"
@.str3015 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3018 = constant [7 x i8] c"global\00"
@.str3029 = constant [13 x i8] c"head_comment\00"
@.str3067 = constant [1 x i8] c"\00"
@.str3091 = constant [7 x i8] c"string\00"
@.str3099 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3119 = constant [7 x i8] c"extern\00"
@.str3133 = constant [15 x i8] c"declare %s %s(\00"
@.str3169 = constant [3 x i8] c", \00"
@.str3175 = constant [3 x i8] c"%s\00"
@.str3187 = constant [3 x i8] c")\0A\00"
@.str3204 = constant [5 x i8] c"%s%s\00"
@.str3212 = constant [9 x i8] c"function\00"
@.str3218 = constant [5 x i8] c"main\00"
@.str3233 = constant [6 x i8] c"%s.%s\00"
@.str3254 = constant [3 x i8] c"NL\00"
@.str3262 = constant [7 x i8] c"global\00"
@.str3270 = constant [11 x i8] c"assignable\00"
@.str3301 = constant [9 x i8] c"variable\00"
@.str3313 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3328 = constant [10 x i8] c"typealias\00"
@.str3350 = constant [11 x i8] c"%s.%s.type\00"
@.str3362 = constant [10 x i8] c"typealias\00"
@.str3384 = constant [5 x i8] c"type\00"
@.str3414 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3427 = constant [7 x i8] c"extern\00"
@.str3445 = constant [7 x i8] c"extern\00"
@.str3486 = constant [7 x i8] c"extern\00"
@.str3498 = constant [9 x i8] c"function\00"
@.str3507 = constant [9 x i8] c"function\00"
@.str3546 = constant [14 x i8] c"define %s %s(\00"
@.str3575 = constant [3 x i8] c", \00"
@.str3581 = constant [5 x i8] c"type\00"
@.str3597 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3612 = constant [5 x i8] c") {\0A\00"
@.str3616 = constant [9 x i8] c"function\00"
@.str3625 = constant [6 x i8] c"block\00"
@.str3637 = constant [12 x i8] c"expressions\00"
@.str3650 = constant [3 x i8] c"NL\00"
@.str3657 = constant [9 x i8] c"OPERATOR\00"
@.str3676 = constant [7 x i8] c"return\00"
@.str3686 = constant [5 x i8] c"void\00"
@.str3693 = constant [21 x i8] c"missing return value\00"
@.str3698 = constant [10 x i8] c"ret void\0A\00"
@.str3704 = constant [3 x i8] c"}\0A\00"
@.str3710 = constant [7 x i8] c"import\00"
@.str3765 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3824 = constant [5 x i8] c"m%d$\00"
@.str3875 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3884 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3916 = constant [9 x i8] c"variable\00"
@.str3921 = constant [5 x i8] c"type\00"
@.str3953 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3966 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3978 = constant [6 x i8] c"block\00"
@.str3985 = constant [12 x i8] c"expressions\00"
@.str4016 = constant [7 x i8] c"struct\00"
@.str4021 = constant [7 x i8] c"WhAT!\0A\00"
@.str4061 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4073 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4099 = constant [7 x i8] c"struct\00"
@.str4104 = constant [7 x i8] c"WhAT!\0A\00"
@.str4135 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4147 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4172 = constant [7 x i8] c"sizeof\00"
@.str4178 = constant [8 x i8] c"fn_args\00"
@.str4185 = constant [11 x i8] c"assignable\00"
@.str4213 = constant [4 x i8] c"int\00"
@.str4226 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4235 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4246 = constant [7 x i8] c"append\00"
@.str4252 = constant [8 x i8] c"fn_args\00"
@.str4259 = constant [11 x i8] c"assignable\00"
@.str4266 = constant [11 x i8] c"assignable\00"
@.str4290 = constant [5 x i8] c".b%d\00"
@.str4324 = constant [8 x i8] c"realloc\00"
@.str4333 = constant [9 x i8] c"function\00"
@.str4346 = constant [4 x i8] c"ptr\00"
@.str4363 = constant [4 x i8] c"chr\00"
@.str4380 = constant [4 x i8] c"ptr\00"
@.str4401 = constant [4 x i8] c"chr\00"
@.str4422 = constant [4 x i8] c"int\00"
@.str4425 = constant [8 x i8] c"realloc\00"
@.str4427 = constant [7 x i8] c"extern\00"
@.str4434 = constant [4 x i8] c"len\00"
@.str4440 = constant [8 x i8] c"fn_args\00"
@.str4447 = constant [11 x i8] c"assignable\00"
@.str4455 = constant [1 x i8] c"\00"
@.str4471 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4492 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4498 = constant [1 x i8] c"\00"
@.str4504 = constant [6 x i8] c"%s.bn\00"
@.str4509 = constant [9 x i8] c"%s/%s.bn\00"
@.str4533 = constant [35 x i8] c"unable to compile function address\00"
@.str4539 = constant [8 x i8] c"fn_args\00"
@.str4543 = constant [1 x i8] c"\00"
@.str4553 = constant [11 x i8] c"assignable\00"
@.str4577 = constant [11 x i8] c"assignable\00"
@.str4589 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4607 = constant [5 x i8] c"%s, \00"
@.str4632 = constant [7 x i8] c"vararg\00"
@.str4645 = constant [1 x i8] c"\00"
@.str4649 = constant [52 x i8] c"Type for argument %d does not match: '%s', got '%s'\00"
@.str4666 = constant [8 x i8] c"%s%s %s\00"
@.str4683 = constant [7 x i8] c"vararg\00"
@.str4694 = constant [11 x i8] c"assignable\00"
@.str4703 = constant [7 x i8] c"vararg\00"
@.str4709 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4745 = constant [7 x i8] c"vararg\00"
@.str4756 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4774 = constant [5 x i8] c"void\00"
@.str4782 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4814 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4840 = constant [7 x i8] c"return\00"
@.str4852 = constant [3 x i8] c"NL\00"
@.str4870 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4883 = constant [10 x i8] c"ret void\0A\00"
@.str4887 = constant [3 x i8] c"NL\00"
@.str4893 = constant [8 x i8] c"fn_call\00"
@.str4904 = constant [12 x i8] c"declaration\00"
@.str4913 = constant [11 x i8] c"assignment\00"
@.str4921 = constant [11 x i8] c"assignable\00"
@.str4952 = constant [4 x i8] c"ptr\00"
@.str4961 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4971 = constant [9 x i8] c"if_block\00"
@.str4979 = constant [9 x i8] c"for_loop\00"
@.str4987 = constant [8 x i8] c"keyword\00"
@.str5004 = constant [6 x i8] c"break\00"
@.str5015 = constant [4 x i8] c"for\00"
@.str5023 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5034 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str5041 = constant [9 x i8] c"continue\00"
@.str5052 = constant [4 x i8] c"for\00"
@.str5060 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5071 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str5075 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str5086 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5105 = constant [14 x i8] c".for.start.%d\00"
@.str5110 = constant [12 x i8] c".for.end.%d\00"
@.str5115 = constant [4 x i8] c"for\00"
@.str5122 = constant [12 x i8] c"declaration\00"
@.str5133 = constant [11 x i8] c"assignment\00"
@.str5143 = constant [9 x i8] c"OPERATOR\00"
@.str5150 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5161 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5168 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5175 = constant [9 x i8] c"OPERATOR\00"
@.str5186 = constant [9 x i8] c"OPERATOR\00"
@.str5193 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5202 = constant [9 x i8] c"OPERATOR\00"
@.str5207 = constant [6 x i8] c"block\00"
@.str5212 = constant [11 x i8] c"else_block\00"
@.str5222 = constant [13 x i8] c".for.else.%d\00"
@.str5229 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5244 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5263 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5273 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5280 = constant [6 x i8] c"block\00"
@.str5289 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5296 = constant [5 x i8] c"%s:\0A\00"
@.str5310 = constant [5 x i8] c"type\00"
@.str5325 = constant [11 x i8] c"assignable\00"
@.str5340 = constant [9 x i8] c"variable\00"
@.str5345 = constant [5 x i8] c"WORD\00"
@.str5354 = constant [31 x i8] c"unable to get declaration name\00"
@.str5374 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5386 = constant [6 x i8] c"%s.%d\00"
@.str5443 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5460 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5472 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5513 = constant [4 x i8] c"int\00"
@.str5520 = constant [4 x i8] c"chr\00"
@.str5528 = constant [5 x i8] c"bool\00"
@.str5537 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5546 = constant [4 x i8] c"ptr\00"
@.str5554 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5557 = constant [5 x i8] c"null\00"
@.str5565 = constant [7 x i8] c"struct\00"
@.str5586 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5606 = constant [10 x i8] c"typealias\00"
@.str5629 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5648 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5665 = constant [11 x i8] c"assignable\00"
@.str5682 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5697 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5704 = constant [6 x i8] c"block\00"
@.str5713 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5720 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5727 = constant [11 x i8] c"elif_block\00"
@.str5739 = constant [11 x i8] c"else_block\00"
@.str5749 = constant [6 x i8] c"block\00"
@.str5759 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5766 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5787 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5796 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5830 = constant [1 x i8] c"\00"
@.str5841 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5861 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5886 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5907 = constant [7 x i8] c"module\00"
@.str5960 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5997 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str6005 = constant [9 x i8] c"function\00"
@.str6012 = constant [7 x i8] c"extern\00"
@.str6024 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str6045 = constant [9 x i8] c"variable\00"
@.str6067 = constant [4 x i8] c"ptr\00"
@.str6086 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6110 = constant [10 x i8] c"typealias\00"
@.str6121 = constant [7 x i8] c"struct\00"
@.str6127 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6179 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6200 = constant [9 x i8] c"variable\00"
@.str6211 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6232 = constant [9 x i8] c"variable\00"
@.str6240 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6254 = constant [17 x i8] c"addr_destination\00"
@.str6261 = constant [16 x i8] c"mono_assignable\00"
@.str6269 = constant [11 x i8] c"assignable\00"
@.str6283 = constant [12 x i8] c"destination\00"
@.str6288 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6316 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6335 = constant [7 x i8] c"module\00"
@.str6357 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6428 = constant [6 x i8] c"slice\00"
@.str6441 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6483 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6504 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6528 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6551 = constant [16 x i8] c"mono_assignable\00"
@.str6577 = constant [5 x i8] c"cast\00"
@.str6587 = constant [5 x i8] c"type\00"
@.str6612 = constant [8 x i8] c"bitcast\00"
@.str6627 = constant [6 x i8] c"slice\00"
@.str6632 = constant [16 x i8] c"Casting array!\0A\00"
@.str6640 = constant [4 x i8] c"ptr\00"
@.str6647 = constant [4 x i8] c"ptr\00"
@.str6666 = constant [4 x i8] c"i%d\00"
@.str6671 = constant [4 x i8] c"i%d\00"
@.str6679 = constant [5 x i8] c"sext\00"
@.str6681 = constant [6 x i8] c"trunc\00"
@.str6686 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6706 = constant [16 x i8] c"mono_assignable\00"
@.str6768 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6791 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6798 = constant [2 x i8] c"+\00"
@.str6803 = constant [4 x i8] c"add\00"
@.str6808 = constant [2 x i8] c"-\00"
@.str6813 = constant [4 x i8] c"sub\00"
@.str6818 = constant [2 x i8] c"*\00"
@.str6823 = constant [4 x i8] c"mul\00"
@.str6828 = constant [2 x i8] c"/\00"
@.str6833 = constant [5 x i8] c"sdiv\00"
@.str6838 = constant [3 x i8] c"==\00"
@.str6843 = constant [8 x i8] c"icmp eq\00"
@.str6848 = constant [3 x i8] c"!=\00"
@.str6853 = constant [8 x i8] c"icmp ne\00"
@.str6858 = constant [2 x i8] c">\00"
@.str6863 = constant [9 x i8] c"icmp sgt\00"
@.str6868 = constant [2 x i8] c"<\00"
@.str6873 = constant [9 x i8] c"icmp slt\00"
@.str6878 = constant [2 x i8] c"&\00"
@.str6883 = constant [4 x i8] c"and\00"
@.str6888 = constant [2 x i8] c"|\00"
@.str6893 = constant [3 x i8] c"or\00"
@.str6898 = constant [3 x i8] c">=\00"
@.str6903 = constant [9 x i8] c"icmp sge\00"
@.str6908 = constant [3 x i8] c"<=\00"
@.str6913 = constant [9 x i8] c"icmp sle\00"
@.str6918 = constant [2 x i8] c"%\00"
@.str6923 = constant [5 x i8] c"srem\00"
@.str6927 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6934 = constant [4 x i8] c"add\00"
@.str6941 = constant [3 x i8] c"==\00"
@.str6948 = constant [3 x i8] c"!=\00"
@.str6956 = constant [2 x i8] c"|\00"
@.str6964 = constant [2 x i8] c"&\00"
@.str6972 = constant [2 x i8] c">\00"
@.str6980 = constant [2 x i8] c"<\00"
@.str6988 = constant [3 x i8] c">=\00"
@.str6996 = constant [3 x i8] c"<=\00"
@.str7004 = constant [5 x i8] c"bool\00"
@.str7008 = constant [4 x i8] c"int\00"
@.str7022 = constant [7 x i8] c"NUMBER\00"
@.str7036 = constant [4 x i8] c"int\00"
@.str7050 = constant [5 x i8] c"WORD\00"
@.str7060 = constant [5 x i8] c"null\00"
@.str7067 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7081 = constant [5 x i8] c"null\00"
@.str7090 = constant [8 x i8] c"nullptr\00"
@.str7097 = constant [17 x i8] c"addr_destination\00"
@.str7109 = constant [12 x i8] c"destination\00"
@.str7153 = constant [4 x i8] c"ptr\00"
@.str7172 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7184 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7198 = constant [8 x i8] c"boolean\00"
@.str7212 = constant [5 x i8] c"bool\00"
@.str7221 = constant [6 x i8] c"false\00"
@.str7228 = constant [2 x i8] c"0\00"
@.str7232 = constant [2 x i8] c"1\00"
@.str7239 = constant [8 x i8] c"fn_call\00"
@.str7256 = constant [7 x i8] c"STRING\00"
@.str7282 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7298 = constant [4 x i8] c"ptr\00"
@.str7311 = constant [4 x i8] c"chr\00"
@.str7318 = constant [4 x i8] c"CHR\00"
@.str7334 = constant [2 x i8] c"0\00"
@.str7350 = constant [22 x i8] c"Invalid character: %s\00"
@.str7366 = constant [4 x i8] c"chr\00"
@.str7370 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7398 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7404 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7409 = constant [4 x i8] c"int\00"
@.str7414 = constant [2 x i8] c"i\00"
@.str7419 = constant [5 x i8] c"bool\00"
@.str7424 = constant [2 x i8] c"b\00"
@.str7429 = constant [5 x i8] c"void\00"
@.str7434 = constant [2 x i8] c"v\00"
@.str7439 = constant [4 x i8] c"chr\00"
@.str7444 = constant [2 x i8] c"c\00"
@.str7449 = constant [4 x i8] c"ptr\00"
@.str7456 = constant [4 x i8] c"%sp\00"
@.str7467 = constant [10 x i8] c"typealias\00"
@.str7478 = constant [7 x i8] c"struct\00"
@.str7483 = constant [2 x i8] c"s\00"
@.str7494 = constant [5 x i8] c"%s%s\00"
@.str7507 = constant [6 x i8] c"error\00"
@.str7512 = constant [2 x i8] c"?\00"
@.str7514 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7526 = constant [7 x i8] c".str%d\00"
@.str7541 = constant [6 x i8] c"array\00"
@.str7554 = constant [4 x i8] c"chr\00"
@.str7575 = constant [3 x i8] c"%d\00"
@.str7582 = constant [7 x i8] c"string\00"
@.str7618 = constant [7 x i8] c"module\00"
@.str7670 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7676 = constant [2 x i8] c"?\00"
@.str7682 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7688 = constant [4 x i8] c"int\00"
@.str7693 = constant [4 x i8] c"i32\00"
@.str7698 = constant [5 x i8] c"void\00"
@.str7703 = constant [5 x i8] c"void\00"
@.str7708 = constant [5 x i8] c"bool\00"
@.str7713 = constant [3 x i8] c"i1\00"
@.str7718 = constant [8 x i8] c"nullptr\00"
@.str7723 = constant [4 x i8] c"ptr\00"
@.str7728 = constant [4 x i8] c"chr\00"
@.str7733 = constant [3 x i8] c"i8\00"
@.str7738 = constant [9 x i8] c"function\00"
@.str7744 = constant [4 x i8] c"%s(\00"
@.str7770 = constant [4 x i8] c"%s,\00"
@.str7775 = constant [5 x i8] c"%s%s\00"
@.str7786 = constant [4 x i8] c"%s)\00"
@.str7794 = constant [4 x i8] c"ptr\00"
@.str7800 = constant [4 x i8] c"%s*\00"
@.str7812 = constant [7 x i8] c"struct\00"
@.str7818 = constant [2 x i8] c"{\00"
@.str7835 = constant [4 x i8] c"%s,\00"
@.str7840 = constant [5 x i8] c"%s%s\00"
@.str7851 = constant [4 x i8] c"%s}\00"
@.str7859 = constant [6 x i8] c"array\00"
@.str7865 = constant [10 x i8] c"[%s x %s]\00"
@.str7884 = constant [10 x i8] c"typealias\00"
@.str7890 = constant [5 x i8] c"%%%s\00"
@.str7900 = constant [7 x i8] c"vararg\00"
@.str7905 = constant [4 x i8] c"...\00"
@.str7910 = constant [6 x i8] c"error\00"
@.str7915 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7991 = constant [9 x i8] c"function\00"
@.str8009 = constant [5 x i8] c"WORD\00"
@.str8066 = constant [10 x i8] c"fn_params\00"
@.str8082 = constant [10 x i8] c"structdef\00"
@.str8089 = constant [7 x i8] c"struct\00"
@.str8096 = constant [5 x i8] c"type\00"
@.str8127 = constant [5 x i8] c"type\00"
@.str8154 = constant [5 x i8] c"type\00"
@.str8160 = constant [12 x i8] c"dotted_name\00"
@.str8174 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str8187 = constant [6 x i8] c"error\00"
@.str8192 = constant [10 x i8] c"typealias\00"
@.str8216 = constant [4 x i8] c"str\00"
@.str8223 = constant [4 x i8] c"ptr\00"
@.str8232 = constant [4 x i8] c"chr\00"
@.str8237 = constant [5 x i8] c"WORD\00"
@.str8250 = constant [4 x i8] c"...\00"
@.str8257 = constant [7 x i8] c"vararg\00"
@.str8261 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str8282 = constant [2 x i8] c"*\00"
@.str8291 = constant [4 x i8] c"ptr\00"
@.str8300 = constant [2 x i8] c"[\00"
@.str8310 = constant [2 x i8] c"]\00"
@.str8319 = constant [7 x i8] c"struct\00"
@.str8323 = constant [6 x i8] c"slice\00"
@.str8329 = constant [4 x i8] c"ptr\00"
@.str8333 = constant [6 x i8] c"c_arr\00"
@.str8345 = constant [4 x i8] c"int\00"
@.str8349 = constant [4 x i8] c"len\00"
@.str8358 = constant [4 x i8] c"int\00"
@.str8362 = constant [4 x i8] c"cap\00"
@.str8373 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str8388 = constant [2 x i8] c"w\00"
@.str8408 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str8417 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str8419 = constant [2 x i8] c"w\00"
@.str8431 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8439 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8442 = constant [16 x i8] c"cc out.s -o out\00"
@.str8444 = constant [2 x i8] c"w\00"
@.str8452 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8460 = constant [22 x i8] c"error on cc execution\00"
@.str8463 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8470 = constant [21 x i8] c"Usage: %s <filename>\00"
