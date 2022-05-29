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
%.tmp1864 = getelementptr [1836 x i8], [1836 x i8]*@.str1863, i32 0, i32 0
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
%.tmp2238 = getelementptr [1 x i8], [1 x i8]*@.str2237, i32 0, i32 0
%buf.2239 = alloca i8*
store i8* %.tmp2238, i8** %buf.2239
%i.2241 = alloca i32
store i32 1, i32* %i.2241
br label %.for.start.2240
.for.start.2240:
%.tmp2242 = load i32, i32* %i.2241
%.tmp2243 = load i32, i32* %str_len.2236
%.tmp2244 = sub i32 %.tmp2243, 1
%.tmp2245 = icmp slt i32 %.tmp2242, %.tmp2244
br i1 %.tmp2245, label %.for.continue.2240, label %.for.end.2240
.for.continue.2240:
%.tmp2246 = load i32, i32* %i.2241
%.tmp2247 = load i8*, i8** %text
%.tmp2248 = getelementptr i8, i8* %.tmp2247, i32 %.tmp2246
%.tmp2249 = load i8, i8* %.tmp2248
%.tmp2250 = icmp eq i8 %.tmp2249, 34
br i1 %.tmp2250, label %.if.true.2251, label %.if.false.2251
.if.true.2251:
%.tmp2252 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2254 = getelementptr [6 x i8], [6 x i8]*@.str2253, i32 0, i32 0
%.tmp2255 = load i8*, i8** %buf.2239
%.tmp2256 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2252, i8* %.tmp2254, i8* %.tmp2255)
br label %.if.end.2251
.if.false.2251:
%.tmp2257 = load i32, i32* %i.2241
%.tmp2258 = load i8*, i8** %text
%.tmp2259 = getelementptr i8, i8* %.tmp2258, i32 %.tmp2257
%.tmp2260 = load i8, i8* %.tmp2259
%.tmp2261 = icmp eq i8 %.tmp2260, 92
br i1 %.tmp2261, label %.if.true.2262, label %.if.false.2262
.if.true.2262:
%.tmp2263 = load i32, i32* %i.2241
%.tmp2264 = add i32 %.tmp2263, 1
%.tmp2265 = load i8*, i8** %text
%.tmp2266 = getelementptr i8, i8* %.tmp2265, i32 %.tmp2264
%.tmp2267 = load i8, i8* %.tmp2266
%.tmp2268 = icmp eq i8 %.tmp2267, 110
%.tmp2269 = load i32, i32* %i.2241
%.tmp2270 = add i32 %.tmp2269, 1
%.tmp2271 = load i8*, i8** %text
%.tmp2272 = getelementptr i8, i8* %.tmp2271, i32 %.tmp2270
%.tmp2273 = load i8, i8* %.tmp2272
%.tmp2274 = icmp eq i8 %.tmp2273, 78
%.tmp2275 = or i1 %.tmp2268, %.tmp2274
br i1 %.tmp2275, label %.if.true.2276, label %.if.false.2276
.if.true.2276:
%.tmp2277 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2279 = getelementptr [6 x i8], [6 x i8]*@.str2278, i32 0, i32 0
%.tmp2280 = load i8*, i8** %buf.2239
%.tmp2281 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2277, i8* %.tmp2279, i8* %.tmp2280)
%.tmp2282 = load i32, i32* %i.2241
%.tmp2283 = add i32 %.tmp2282, 1
store i32 %.tmp2283, i32* %i.2241
br label %.if.end.2276
.if.false.2276:
%.tmp2284 = load i32, i32* %i.2241
%.tmp2285 = add i32 %.tmp2284, 1
%.tmp2286 = load i8*, i8** %text
%.tmp2287 = getelementptr i8, i8* %.tmp2286, i32 %.tmp2285
%.tmp2288 = load i8, i8* %.tmp2287
%.tmp2289 = icmp eq i8 %.tmp2288, 92
br i1 %.tmp2289, label %.if.true.2290, label %.if.false.2290
.if.true.2290:
%.tmp2291 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2293 = getelementptr [6 x i8], [6 x i8]*@.str2292, i32 0, i32 0
%.tmp2294 = load i8*, i8** %buf.2239
%.tmp2295 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2291, i8* %.tmp2293, i8* %.tmp2294)
%.tmp2296 = load i32, i32* %i.2241
%.tmp2297 = add i32 %.tmp2296, 1
store i32 %.tmp2297, i32* %i.2241
br label %.if.end.2290
.if.false.2290:
%.tmp2298 = load i32, i32* %i.2241
%.tmp2299 = add i32 %.tmp2298, 1
%.tmp2300 = load i8*, i8** %text
%.tmp2301 = getelementptr i8, i8* %.tmp2300, i32 %.tmp2299
%.tmp2302 = load i8, i8* %.tmp2301
%.tmp2303 = icmp eq i8 %.tmp2302, 120
br i1 %.tmp2303, label %.if.true.2304, label %.if.false.2304
.if.true.2304:
%.tmp2305 = load i32, i32* %i.2241
%.tmp2306 = add i32 %.tmp2305, 2
store i32 %.tmp2306, i32* %i.2241
%.tmp2307 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2309 = getelementptr [8 x i8], [8 x i8]*@.str2308, i32 0, i32 0
%.tmp2310 = load i8*, i8** %buf.2239
%.tmp2311 = load i32, i32* %i.2241
%.tmp2312 = load i8*, i8** %text
%.tmp2313 = getelementptr i8, i8* %.tmp2312, i32 %.tmp2311
%.tmp2314 = load i8, i8* %.tmp2313
%.tmp2315 = call i8(i8) @toupper(i8 %.tmp2314)
%.tmp2316 = load i32, i32* %i.2241
%.tmp2317 = add i32 %.tmp2316, 1
%.tmp2318 = load i8*, i8** %text
%.tmp2319 = getelementptr i8, i8* %.tmp2318, i32 %.tmp2317
%.tmp2320 = load i8, i8* %.tmp2319
%.tmp2321 = call i8(i8) @toupper(i8 %.tmp2320)
%.tmp2322 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2307, i8* %.tmp2309, i8* %.tmp2310, i8 %.tmp2315, i8 %.tmp2321)
%.tmp2323 = load i32, i32* %i.2241
%.tmp2324 = add i32 %.tmp2323, 1
store i32 %.tmp2324, i32* %i.2241
br label %.if.end.2304
.if.false.2304:
%.tmp2325 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2327 = getelementptr [5 x i8], [5 x i8]*@.str2326, i32 0, i32 0
%.tmp2328 = load i8*, i8** %buf.2239
%.tmp2329 = load i32, i32* %i.2241
%.tmp2330 = load i8*, i8** %text
%.tmp2331 = getelementptr i8, i8* %.tmp2330, i32 %.tmp2329
%.tmp2332 = load i8, i8* %.tmp2331
%.tmp2333 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2325, i8* %.tmp2327, i8* %.tmp2328, i8 %.tmp2332)
br label %.if.end.2304
.if.end.2304:
br label %.if.end.2290
.if.end.2290:
br label %.if.end.2276
.if.end.2276:
br label %.if.end.2262
.if.false.2262:
%.tmp2334 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2336 = getelementptr [5 x i8], [5 x i8]*@.str2335, i32 0, i32 0
%.tmp2337 = load i8*, i8** %buf.2239
%.tmp2338 = load i32, i32* %i.2241
%.tmp2339 = load i8*, i8** %text
%.tmp2340 = getelementptr i8, i8* %.tmp2339, i32 %.tmp2338
%.tmp2341 = load i8, i8* %.tmp2340
%.tmp2342 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2334, i8* %.tmp2336, i8* %.tmp2337, i8 %.tmp2341)
br label %.if.end.2262
.if.end.2262:
br label %.if.end.2251
.if.end.2251:
%.tmp2343 = load i32, i32* %i.2241
%.tmp2344 = add i32 %.tmp2343, 1
store i32 %.tmp2344, i32* %i.2241
br label %.for.start.2240
.for.end.2240:
%.tmp2345 = getelementptr i8*, i8** %buf.2239, i32 0
%.tmp2347 = getelementptr [9 x i8], [9 x i8]*@.str2346, i32 0, i32 0
%.tmp2348 = load i8*, i8** %buf.2239
%.tmp2349 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2345, i8* %.tmp2347, i8* %.tmp2348)
%.tmp2350 = load i8*, i8** %buf.2239
ret i8* %.tmp2350
}
define i32 @m2233$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2351 = alloca i32
store i32 0, i32* %len.2351
%i.2353 = alloca i32
store i32 2, i32* %i.2353
br label %.for.start.2352
.for.start.2352:
%.tmp2354 = load i32, i32* %i.2353
%.tmp2355 = load i8*, i8** %text
%.tmp2356 = getelementptr i8, i8* %.tmp2355, i32 %.tmp2354
%.tmp2357 = load i8, i8* %.tmp2356
%.tmp2358 = icmp ne i8 %.tmp2357, 0
br i1 %.tmp2358, label %.for.continue.2352, label %.for.end.2352
.for.continue.2352:
%.tmp2359 = load i32, i32* %i.2353
%.tmp2360 = load i8*, i8** %text
%.tmp2361 = getelementptr i8, i8* %.tmp2360, i32 %.tmp2359
%.tmp2362 = load i8, i8* %.tmp2361
%.tmp2363 = icmp eq i8 %.tmp2362, 92
br i1 %.tmp2363, label %.if.true.2364, label %.if.false.2364
.if.true.2364:
%.tmp2365 = load i32, i32* %i.2353
%.tmp2366 = add i32 %.tmp2365, 2
store i32 %.tmp2366, i32* %i.2353
br label %.if.end.2364
.if.false.2364:
br label %.if.end.2364
.if.end.2364:
%.tmp2367 = load i32, i32* %len.2351
%.tmp2368 = add i32 %.tmp2367, 1
store i32 %.tmp2368, i32* %len.2351
%.tmp2369 = load i32, i32* %i.2353
%.tmp2370 = add i32 %.tmp2369, 1
store i32 %.tmp2370, i32* %i.2353
br label %.for.start.2352
.for.end.2352:
%.tmp2371 = load i32, i32* %len.2351
%.tmp2372 = sub i32 %.tmp2371, 1
ret i32 %.tmp2372
}
define i8* @m2233$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2373 = alloca i32
store i32 0, i32* %intval.2373
%buf.2374 = alloca i8*
store i8* null, i8** %buf.2374
%chrval.2375 = alloca i8
store i8 0, i8* %chrval.2375
%.tmp2376 = load i8*, i8** %chr_repr
%.tmp2377 = call i32(i8*) @strlen(i8* %.tmp2376)
%chr_len.2378 = alloca i32
store i32 %.tmp2377, i32* %chr_len.2378
%.tmp2379 = load i32, i32* %chr_len.2378
%.tmp2380 = icmp eq i32 %.tmp2379, 6
br i1 %.tmp2380, label %.if.true.2381, label %.if.false.2381
.if.true.2381:
%.tmp2382 = load i8*, i8** %chr_repr
%.tmp2384 = getelementptr [7 x i8], [7 x i8]*@.str2383, i32 0, i32 0
%.tmp2385 = getelementptr i32, i32* %intval.2373, i32 0
%.tmp2386 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2382, i8* %.tmp2384, i32* %.tmp2385)
%.tmp2387 = getelementptr i8*, i8** %buf.2374, i32 0
%.tmp2389 = getelementptr [3 x i8], [3 x i8]*@.str2388, i32 0, i32 0
%.tmp2390 = load i32, i32* %intval.2373
%.tmp2391 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2387, i8* %.tmp2389, i32 %.tmp2390)
br label %.if.end.2381
.if.false.2381:
%.tmp2392 = load i32, i32* %chr_len.2378
%.tmp2393 = icmp eq i32 %.tmp2392, 5
br i1 %.tmp2393, label %.if.true.2394, label %.if.false.2394
.if.true.2394:
%.tmp2395 = load i8*, i8** %chr_repr
%.tmp2397 = getelementptr [6 x i8], [6 x i8]*@.str2396, i32 0, i32 0
%.tmp2398 = getelementptr i32, i32* %intval.2373, i32 0
%.tmp2399 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2395, i8* %.tmp2397, i32* %.tmp2398)
%.tmp2400 = getelementptr i8*, i8** %buf.2374, i32 0
%.tmp2402 = getelementptr [3 x i8], [3 x i8]*@.str2401, i32 0, i32 0
%.tmp2403 = load i32, i32* %intval.2373
%.tmp2404 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2400, i8* %.tmp2402, i32 %.tmp2403)
br label %.if.end.2394
.if.false.2394:
%.tmp2405 = load i32, i32* %chr_len.2378
%.tmp2406 = icmp eq i32 %.tmp2405, 4
br i1 %.tmp2406, label %.if.true.2407, label %.if.false.2407
.if.true.2407:
%.tmp2408 = load i8*, i8** %chr_repr
%.tmp2410 = getelementptr [6 x i8], [6 x i8]*@.str2409, i32 0, i32 0
%.tmp2411 = getelementptr i8, i8* %chrval.2375, i32 0
%.tmp2412 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2408, i8* %.tmp2410, i8* %.tmp2411)
%.tmp2413 = load i8, i8* %chrval.2375
%.tmp2414 = icmp eq i8 %.tmp2413, 110
br i1 %.tmp2414, label %.if.true.2415, label %.if.false.2415
.if.true.2415:
%.tmp2417 = getelementptr [3 x i8], [3 x i8]*@.str2416, i32 0, i32 0
store i8* %.tmp2417, i8** %buf.2374
br label %.if.end.2415
.if.false.2415:
%.tmp2418 = bitcast ptr null to i8*
ret i8* %.tmp2418
br label %.if.end.2415
.if.end.2415:
br label %.if.end.2407
.if.false.2407:
%.tmp2419 = load i32, i32* %chr_len.2378
%.tmp2420 = icmp eq i32 %.tmp2419, 3
br i1 %.tmp2420, label %.if.true.2421, label %.if.false.2421
.if.true.2421:
%.tmp2422 = load i8*, i8** %chr_repr
%.tmp2424 = getelementptr [5 x i8], [5 x i8]*@.str2423, i32 0, i32 0
%.tmp2425 = getelementptr i32, i32* %intval.2373, i32 0
%.tmp2426 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2422, i8* %.tmp2424, i32* %.tmp2425)
%.tmp2427 = getelementptr i8*, i8** %buf.2374, i32 0
%.tmp2429 = getelementptr [3 x i8], [3 x i8]*@.str2428, i32 0, i32 0
%.tmp2430 = load i32, i32* %intval.2373
%.tmp2431 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2427, i8* %.tmp2429, i32 %.tmp2430)
br label %.if.end.2421
.if.false.2421:
%.tmp2432 = bitcast ptr null to i8*
ret i8* %.tmp2432
br label %.if.end.2421
.if.end.2421:
br label %.if.end.2407
.if.end.2407:
br label %.if.end.2394
.if.end.2394:
br label %.if.end.2381
.if.end.2381:
%.tmp2433 = load i8*, i8** %buf.2374
ret i8* %.tmp2433
}
define i8* @m2434$append_tmpl.cp() {
%.tmp2436 = getelementptr [1885 x i8], [1885 x i8]*@.str2435, i32 0, i32 0
ret i8* %.tmp2436
}
@DEBUG_INTERNALS = constant i1 0
%m1861$.ErrorList.type = type {%m751$.Error.type*,%m1861$.ErrorList.type*,i1}
%m1861$.Type.type = type {i8*,i8*,i8*,%m1861$.Type.type*,%m1861$.Type.type*}
define %m1861$.Type.type* @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.t.arg) {
%t = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.t.arg, %m1861$.Type.type** %t
%.tmp2437 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2438 = icmp eq %m1861$.Type.type* %.tmp2437, null
br i1 %.tmp2438, label %.if.true.2439, label %.if.false.2439
.if.true.2439:
%.tmp2440 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp2440
br label %.if.end.2439
.if.false.2439:
br label %.if.end.2439
.if.end.2439:
%.tmp2441 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2442 = ptrtoint %m1861$.Type.type* %.tmp2441 to i32
%.tmp2443 = call i8*(i32) @malloc(i32 %.tmp2442)
%.tmp2444 = bitcast i8* %.tmp2443 to %m1861$.Type.type*
%clone.2445 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2444, %m1861$.Type.type** %clone.2445
%.tmp2446 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2445
%.tmp2447 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2446, i32 0, i32 3
%.tmp2448 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2449 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2448, i32 0, i32 3
%.tmp2450 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2449
store %m1861$.Type.type* %.tmp2450, %m1861$.Type.type** %.tmp2447
%.tmp2451 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2445
%.tmp2452 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2451, i32 0, i32 4
%.tmp2453 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2454 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2453, i32 0, i32 4
%.tmp2455 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2454
%.tmp2456 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2455)
store %m1861$.Type.type* %.tmp2456, %m1861$.Type.type** %.tmp2452
%.tmp2457 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2445
%.tmp2458 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2457, i32 0, i32 2
%.tmp2459 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2460 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2459, i32 0, i32 2
%.tmp2461 = load i8*, i8** %.tmp2460
store i8* %.tmp2461, i8** %.tmp2458
%.tmp2462 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2445
%.tmp2463 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2462, i32 0, i32 0
%.tmp2464 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2465 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2464, i32 0, i32 0
%.tmp2466 = load i8*, i8** %.tmp2465
store i8* %.tmp2466, i8** %.tmp2463
%.tmp2467 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2445
%.tmp2468 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2467, i32 0, i32 1
%.tmp2469 = load %m1861$.Type.type*, %m1861$.Type.type** %t
%.tmp2470 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2469, i32 0, i32 1
%.tmp2471 = load i8*, i8** %.tmp2470
store i8* %.tmp2471, i8** %.tmp2468
%.tmp2472 = load %m1861$.Type.type*, %m1861$.Type.type** %clone.2445
ret %m1861$.Type.type* %.tmp2472
}
define i8* @m1861$get_root.cp() {
%.tmp2474 = getelementptr [12 x i8], [12 x i8]*@.str2473, i32 0, i32 0
%.tmp2475 = call i8*(i8*) @getenv(i8* %.tmp2474)
%project_root.2476 = alloca i8*
store i8* %.tmp2475, i8** %project_root.2476
%.tmp2477 = load i8*, i8** %project_root.2476
%.tmp2478 = icmp eq i8* %.tmp2477, null
br i1 %.tmp2478, label %.if.true.2479, label %.if.false.2479
.if.true.2479:
%.tmp2481 = getelementptr [5 x i8], [5 x i8]*@.str2480, i32 0, i32 0
%.tmp2482 = call i8*(i8*) @getenv(i8* %.tmp2481)
%home.2483 = alloca i8*
store i8* %.tmp2482, i8** %home.2483
%.tmp2484 = getelementptr i8*, i8** %project_root.2476, i32 0
%.tmp2486 = getelementptr [11 x i8], [11 x i8]*@.str2485, i32 0, i32 0
%.tmp2487 = load i8*, i8** %home.2483
%.tmp2488 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2484, i8* %.tmp2486, i8* %.tmp2487)
br label %.if.end.2479
.if.false.2479:
br label %.if.end.2479
.if.end.2479:
%.tmp2489 = load i8*, i8** %project_root.2476
ret i8* %.tmp2489
}
define %m1861$.Type.type* @m1861$new_type.m1861$.Type.typep() {
%.tmp2490 = getelementptr %m1861$.Type.type, %m1861$.Type.type* null, i32 1
%.tmp2491 = ptrtoint %m1861$.Type.type* %.tmp2490 to i32
%.tmp2492 = call i8*(i32) @malloc(i32 %.tmp2491)
%.tmp2493 = bitcast i8* %.tmp2492 to %m1861$.Type.type*
%type.2494 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp2493, %m1861$.Type.type** %type.2494
%.tmp2495 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2494
%.tmp2496 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2495, i32 0, i32 1
store i8* null, i8** %.tmp2496
%.tmp2497 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2494
%.tmp2498 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2497, i32 0, i32 2
store i8* null, i8** %.tmp2498
%.tmp2499 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2494
%.tmp2500 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2499, i32 0, i32 0
store i8* null, i8** %.tmp2500
%.tmp2501 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2494
%.tmp2502 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2501, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2502
%.tmp2503 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2494
%.tmp2504 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2503, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2504
%.tmp2505 = load %m1861$.Type.type*, %m1861$.Type.type** %type.2494
ret %m1861$.Type.type* %.tmp2505
}
define void @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.dest.arg, %m1861$.Type.type* %.src.arg) {
%dest = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.dest.arg, %m1861$.Type.type** %dest
%src = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.src.arg, %m1861$.Type.type** %src
%.tmp2506 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2507 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2506, i32 0, i32 0
%.tmp2508 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2509 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2508, i32 0, i32 0
%.tmp2510 = load i8*, i8** %.tmp2509
store i8* %.tmp2510, i8** %.tmp2507
%.tmp2511 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2512 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2511, i32 0, i32 1
%.tmp2513 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2514 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2513, i32 0, i32 1
%.tmp2515 = load i8*, i8** %.tmp2514
store i8* %.tmp2515, i8** %.tmp2512
%.tmp2516 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2517 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2516, i32 0, i32 2
%.tmp2518 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2519 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2518, i32 0, i32 2
%.tmp2520 = load i8*, i8** %.tmp2519
store i8* %.tmp2520, i8** %.tmp2517
%.tmp2521 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2522 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2521, i32 0, i32 3
%.tmp2523 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2522
%.tmp2524 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2525 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2524, i32 0, i32 3
%.tmp2526 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2525
%.tmp2527 = icmp ne %m1861$.Type.type* %.tmp2523, %.tmp2526
br i1 %.tmp2527, label %.if.true.2528, label %.if.false.2528
.if.true.2528:
%.tmp2529 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2530 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2529, i32 0, i32 3
%.tmp2531 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2532 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2531, i32 0, i32 3
%.tmp2533 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2532
store %m1861$.Type.type* %.tmp2533, %m1861$.Type.type** %.tmp2530
%.tmp2534 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2535 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2534, i32 0, i32 3
%.tmp2536 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2535
%.tmp2537 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2538 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2537, i32 0, i32 3
%.tmp2539 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2538
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2536, %m1861$.Type.type* %.tmp2539)
br label %.if.end.2528
.if.false.2528:
br label %.if.end.2528
.if.end.2528:
%.tmp2540 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2541 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2540, i32 0, i32 4
%.tmp2542 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2541
%.tmp2543 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2544 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2543, i32 0, i32 4
%.tmp2545 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2544
%.tmp2546 = icmp ne %m1861$.Type.type* %.tmp2542, %.tmp2545
br i1 %.tmp2546, label %.if.true.2547, label %.if.false.2547
.if.true.2547:
%.tmp2548 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2549 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2548, i32 0, i32 4
%.tmp2550 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2551 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2550, i32 0, i32 4
%.tmp2552 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2551
store %m1861$.Type.type* %.tmp2552, %m1861$.Type.type** %.tmp2549
%.tmp2553 = load %m1861$.Type.type*, %m1861$.Type.type** %dest
%.tmp2554 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2553, i32 0, i32 4
%.tmp2555 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2554
%.tmp2556 = load %m1861$.Type.type*, %m1861$.Type.type** %src
%.tmp2557 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp2556, i32 0, i32 4
%.tmp2558 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp2557
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp2555, %m1861$.Type.type* %.tmp2558)
br label %.if.end.2547
.if.false.2547:
br label %.if.end.2547
.if.end.2547:
ret void
}
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m1861$.Type.type*,i32,i32,i8*}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1861$.AssignableInfo.type* @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.node.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%.tmp2559 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* null, i32 1
%.tmp2560 = ptrtoint %m1861$.AssignableInfo.type* %.tmp2559 to i32
%.tmp2561 = call i8*(i32) @malloc(i32 %.tmp2560)
%.tmp2562 = bitcast i8* %.tmp2561 to %m1861$.AssignableInfo.type*
%ptr.2563 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp2562, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2564 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2565 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2564, i32 0, i32 1
%.tmp2566 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2566, i8* %.tmp2565
%.tmp2567 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2568 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2567, i32 0, i32 0
store i8* null, i8** %.tmp2568
%.tmp2569 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2570 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2569, i32 0, i32 3
store i8* null, i8** %.tmp2570
%.tmp2571 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2572 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2571, i32 0, i32 2
%.tmp2574 = getelementptr [1 x i8], [1 x i8]*@.str2573, i32 0, i32 0
store i8* %.tmp2574, i8** %.tmp2572
%.tmp2575 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2576 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2575, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2576
%.tmp2577 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2578 = icmp ne %m307$.Node.type* %.tmp2577, null
br i1 %.tmp2578, label %.if.true.2579, label %.if.false.2579
.if.true.2579:
%.tmp2580 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2581 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2580, i32 0, i32 5
%.tmp2582 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2583 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2582, i32 0, i32 3
%.tmp2584 = load i32, i32* %.tmp2583
store i32 %.tmp2584, i32* %.tmp2581
%.tmp2585 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2586 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2585, i32 0, i32 6
%.tmp2587 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2588 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2587, i32 0, i32 4
%.tmp2589 = load i32, i32* %.tmp2588
store i32 %.tmp2589, i32* %.tmp2586
%.tmp2590 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2591 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2590, i32 0, i32 7
%.tmp2592 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2593 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2592, i32 0, i32 2
%.tmp2594 = load i8*, i8** %.tmp2593
store i8* %.tmp2594, i8** %.tmp2591
br label %.if.end.2579
.if.false.2579:
%.tmp2595 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2596 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2595, i32 0, i32 5
store i32 0, i32* %.tmp2596
%.tmp2597 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2598 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2597, i32 0, i32 6
store i32 0, i32* %.tmp2598
%.tmp2599 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
%.tmp2600 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2599, i32 0, i32 7
store i8* null, i8** %.tmp2600
br label %.if.end.2579
.if.end.2579:
%.tmp2601 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2563
ret %m1861$.AssignableInfo.type* %.tmp2601
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2602 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2603 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2602, i32 0, i32 0
%.tmp2604 = load i8*, i8** %id
store i8* %.tmp2604, i8** %.tmp2603
%.tmp2605 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2606 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2605, i32 0, i32 1
%.tmp2607 = load i8, i8* %scope
store i8 %.tmp2607, i8* %.tmp2606
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2608 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2609 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2608, i32 0, i32 1
%.tmp2610 = load i8, i8* %.tmp2609
%.tmp2611 = load i8, i8* @SCOPE_CONST
%.tmp2612 = icmp eq i8 %.tmp2610, %.tmp2611
br i1 %.tmp2612, label %.if.true.2613, label %.if.false.2613
.if.true.2613:
%.tmp2614 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2615 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2614, i32 0, i32 0
%.tmp2616 = load i8*, i8** %.tmp2615
ret i8* %.tmp2616
br label %.if.end.2613
.if.false.2613:
br label %.if.end.2613
.if.end.2613:
%buf.2617 = alloca i8*
store i8* null, i8** %buf.2617
%.tmp2618 = getelementptr i8*, i8** %buf.2617, i32 0
%.tmp2620 = getelementptr [5 x i8], [5 x i8]*@.str2619, i32 0, i32 0
%.tmp2621 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2622 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2621, i32 0, i32 1
%.tmp2623 = load i8, i8* %.tmp2622
%.tmp2624 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2625 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2624, i32 0, i32 0
%.tmp2626 = load i8*, i8** %.tmp2625
%.tmp2627 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2618, i8* %.tmp2620, i8 %.tmp2623, i8* %.tmp2626)
%.tmp2628 = load i8*, i8** %buf.2617
ret i8* %.tmp2628
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
%.tmp2629 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2630 = load %m1861$.Type.type*, %m1861$.Type.type** %a
%.tmp2631 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp2629, %m1861$.Type.type* %.tmp2630)
%a_repr.2632 = alloca i8*
store i8* %.tmp2631, i8** %a_repr.2632
%.tmp2633 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2634 = load %m1861$.Type.type*, %m1861$.Type.type** %b
%.tmp2635 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp2633, %m1861$.Type.type* %.tmp2634)
%b_repr.2636 = alloca i8*
store i8* %.tmp2635, i8** %b_repr.2636
%.tmp2637 = load i8*, i8** %a_repr.2632
%.tmp2638 = load i8*, i8** %b_repr.2636
%.tmp2639 = call i32(i8*,i8*) @strcmp(i8* %.tmp2637, i8* %.tmp2638)
%.tmp2640 = icmp eq i32 %.tmp2639, 0
ret i1 %.tmp2640
}
define void @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%tmp_buff.2641 = alloca i8*
store i8* null, i8** %tmp_buff.2641
%.tmp2642 = getelementptr i8*, i8** %tmp_buff.2641, i32 0
%.tmp2644 = getelementptr [7 x i8], [7 x i8]*@.str2643, i32 0, i32 0
%.tmp2645 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2646 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2645)
%.tmp2647 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2642, i8* %.tmp2644, i32 %.tmp2646)
%.tmp2648 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2649 = load i8, i8* @SCOPE_LOCAL
%.tmp2650 = load i8*, i8** %tmp_buff.2641
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2648, i8 %.tmp2649, i8* %.tmp2650)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2652 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2653 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2652, i32 0, i32 6
%.tmp2654 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2653
%m.2655 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2654, %m1861$.ModuleLookup.type** %m.2655
br label %.for.start.2651
.for.start.2651:
%.tmp2656 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2655
%.tmp2657 = icmp ne %m1861$.ModuleLookup.type* %.tmp2656, null
br i1 %.tmp2657, label %.for.continue.2651, label %.for.end.2651
.for.continue.2651:
%.tmp2658 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2655
%.tmp2659 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2658, i32 0, i32 0
%.tmp2660 = load i8*, i8** %.tmp2659
%.tmp2661 = load i8*, i8** %filename
%.tmp2662 = call i32(i8*,i8*) @strcmp(i8* %.tmp2660, i8* %.tmp2661)
%.tmp2663 = icmp eq i32 %.tmp2662, 0
br i1 %.tmp2663, label %.if.true.2664, label %.if.false.2664
.if.true.2664:
%.tmp2665 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2655
ret %m1861$.ModuleLookup.type* %.tmp2665
br label %.if.end.2664
.if.false.2664:
br label %.if.end.2664
.if.end.2664:
%.tmp2666 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2655
%.tmp2667 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2666, i32 0, i32 2
%.tmp2668 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2667
store %m1861$.ModuleLookup.type* %.tmp2668, %m1861$.ModuleLookup.type** %m.2655
br label %.for.start.2651
.for.end.2651:
%.tmp2669 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2669
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2670 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2671 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2672 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2671, i32 0, i32 7
%.tmp2673 = load i8*, i8** %.tmp2672
%.tmp2674 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2670, i8* %.tmp2673)
ret %m1861$.ModuleLookup.type* %.tmp2674
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2675 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2676 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2675, i32 0, i32 5
%.tmp2677 = load i32, i32* %.tmp2676
%uid.2678 = alloca i32
store i32 %.tmp2677, i32* %uid.2678
%.tmp2679 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2680 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2679, i32 0, i32 5
%.tmp2681 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2682 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2681, i32 0, i32 5
%.tmp2683 = load i32, i32* %.tmp2682
%.tmp2684 = add i32 %.tmp2683, 1
store i32 %.tmp2684, i32* %.tmp2680
%.tmp2685 = load i32, i32* %uid.2678
ret i32 %.tmp2685
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2686 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2687 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2686 to i32
%.tmp2688 = call i8*(i32) @malloc(i32 %.tmp2687)
%.tmp2689 = bitcast i8* %.tmp2688 to %m1861$.CompilerCtx.type*
%ctx.2690 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2689, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2691 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2692 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2691, i32 0, i32 1
%.tmp2693 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2693, %m0$.File.type** %.tmp2692
%.tmp2694 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2695 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2694, i32 0, i32 0
%.tmp2696 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2696, %m307$.Node.type** %.tmp2695
%.tmp2697 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2698 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2697, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2698
%.tmp2699 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2700 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2699, i32 0, i32 5
store i32 0, i32* %.tmp2700
%.tmp2701 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2702 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2701, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2702
%.tmp2703 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2704 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2703, i32 0, i32 7
%.tmp2705 = load i8*, i8** %filename
store i8* %.tmp2705, i8** %.tmp2704
%.tmp2706 = call i8*() @m1862$grammar.cp()
%.tmp2707 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2706)
%grammar_file.2708 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2707, %m0$.File.type** %grammar_file.2708
%.tmp2709 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2708
%.tmp2710 = icmp eq %m0$.File.type* %.tmp2709, null
br i1 %.tmp2710, label %.if.true.2711, label %.if.false.2711
.if.true.2711:
%.tmp2712 = bitcast ptr null to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2712
br label %.if.end.2711
.if.false.2711:
br label %.if.end.2711
.if.end.2711:
%.tmp2713 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2708
%.tmp2714 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2713)
%grammar_ctx.2715 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2714, %m307$.ParsingContext.type** %grammar_ctx.2715
%.tmp2716 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2708
%.tmp2717 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2716)
%.tmp2718 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2719 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2718, i32 0, i32 4
%.tmp2720 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2715
%.tmp2721 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2720)
store %m307$.Rule.type** %.tmp2721, %m307$.Rule.type*** %.tmp2719
%.tmp2722 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2723 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2722, i32 0, i32 6
%.tmp2724 = load i32, i32* @ModuleLookup_size
%.tmp2725 = call i8*(i32) @malloc(i32 %.tmp2724)
%.tmp2726 = bitcast i8* %.tmp2725 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2726, %m1861$.ModuleLookup.type** %.tmp2723
%.tmp2727 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2728 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2727, i32 0, i32 6
%.tmp2729 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2728
%.tmp2730 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2729, i32 0, i32 0
%.tmp2731 = load i8*, i8** %filename
store i8* %.tmp2731, i8** %.tmp2730
%.tmp2732 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2733 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2732, i32 0, i32 6
%.tmp2734 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2733
%.tmp2735 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2734, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2735
%.tmp2736 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2737 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2736, i32 0, i32 6
%.tmp2738 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2737
%.tmp2739 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2738, i32 0, i32 1
%.tmp2741 = getelementptr [1 x i8], [1 x i8]*@.str2740, i32 0, i32 0
store i8* %.tmp2741, i8** %.tmp2739
%.tmp2742 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2743 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2742, i32 0, i32 6
%.tmp2744 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2743
%.tmp2745 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2744, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2745
%.tmp2746 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2690
%.tmp2747 = bitcast %m1861$.CompilerCtx.type* %.tmp2746 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2747
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
%.tmp2748 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2749 = ptrtoint %m1861$.Scope.type* %.tmp2748 to i32
%.tmp2750 = call i8*(i32) @malloc(i32 %.tmp2749)
%.tmp2751 = bitcast i8* %.tmp2750 to %m1861$.Scope.type*
%s.2752 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2751, %m1861$.Scope.type** %s.2752
%.tmp2753 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2754 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2753)
%m.2755 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2754, %m1861$.ModuleLookup.type** %m.2755
%.tmp2756 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2752
%.tmp2757 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2756, i32 0, i32 5
%.tmp2758 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2755
%.tmp2759 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2758, i32 0, i32 3
%.tmp2760 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2759
store %m1861$.Scope.type* %.tmp2760, %m1861$.Scope.type** %.tmp2757
%.tmp2761 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2752
%.tmp2762 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2761, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2762
%.tmp2763 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2752
%.tmp2764 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2763, i32 0, i32 2
%.tmp2765 = load i8*, i8** %type
store i8* %.tmp2765, i8** %.tmp2764
%.tmp2766 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2752
%.tmp2767 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2766, i32 0, i32 3
%.tmp2768 = load i8*, i8** %begin_id
store i8* %.tmp2768, i8** %.tmp2767
%.tmp2769 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2752
%.tmp2770 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2769, i32 0, i32 4
%.tmp2771 = load i8*, i8** %end_id
store i8* %.tmp2771, i8** %.tmp2770
%.tmp2772 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2755
%.tmp2773 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2772, i32 0, i32 3
%.tmp2774 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2752
store %m1861$.Scope.type* %.tmp2774, %m1861$.Scope.type** %.tmp2773
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2775 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2776 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2775)
%m.2777 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2776, %m1861$.ModuleLookup.type** %m.2777
%.tmp2778 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2777
%.tmp2779 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2778, i32 0, i32 3
%.tmp2780 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2779
%.tmp2781 = icmp ne %m1861$.Scope.type* %.tmp2780, null
%.tmp2783 = getelementptr [61 x i8], [61 x i8]*@.str2782, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2781, i8* %.tmp2783)
%.tmp2784 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2777
%.tmp2785 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2784, i32 0, i32 3
%.tmp2786 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2777
%.tmp2787 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2786, i32 0, i32 3
%.tmp2788 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2787
%.tmp2789 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2788, i32 0, i32 5
%.tmp2790 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2789
store %m1861$.Scope.type* %.tmp2790, %m1861$.Scope.type** %.tmp2785
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2791 = call i8*() @m1862$grammar.cp()
%.tmp2792 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2791)
%grammar_file.2793 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2792, %m0$.File.type** %grammar_file.2793
%.tmp2794 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2793
%.tmp2795 = icmp eq %m0$.File.type* %.tmp2794, null
br i1 %.tmp2795, label %.if.true.2796, label %.if.false.2796
.if.true.2796:
ret i1 0
br label %.if.end.2796
.if.false.2796:
br label %.if.end.2796
.if.end.2796:
%.tmp2797 = load i8*, i8** %filepath
%.tmp2798 = load i32, i32* @O_RDONLY
%.tmp2799 = call i32(i8*,i32) @open(i8* %.tmp2797, i32 %.tmp2798)
%input_fd.2800 = alloca i32
store i32 %.tmp2799, i32* %input_fd.2800
%.tmp2801 = load i32, i32* %input_fd.2800
%.tmp2802 = icmp sle i32 %.tmp2801, 0
br i1 %.tmp2802, label %.if.true.2803, label %.if.false.2803
.if.true.2803:
%err_msg.2804 = alloca i8*
store i8* null, i8** %err_msg.2804
%.tmp2805 = getelementptr i8*, i8** %err_msg.2804, i32 0
%.tmp2807 = getelementptr [26 x i8], [26 x i8]*@.str2806, i32 0, i32 0
%.tmp2808 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2809 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2805, i8* %.tmp2807, %m307$.Node.type* %.tmp2808)
%.tmp2810 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2811 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2812 = load i8*, i8** %err_msg.2804
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2810, %m307$.Node.type* %.tmp2811, i8* %.tmp2812)
ret i1 0
br label %.if.end.2803
.if.false.2803:
br label %.if.end.2803
.if.end.2803:
%.tmp2813 = load i32, i32* %input_fd.2800
%.tmp2814 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2813)
%p.2815 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2814, %m229$.PeekerInfo.type** %p.2815
%.tmp2816 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2815
%.tmp2817 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2816, i32 0, i32 6
%.tmp2818 = load i8*, i8** %filepath
store i8* %.tmp2818, i8** %.tmp2817
%.tmp2819 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2815
%.tmp2820 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2819, i1 0)
%tokens.2821 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2820, %m308$.Token.type** %tokens.2821
%.tmp2822 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2823 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2822, i32 0, i32 4
%.tmp2824 = load %m307$.Rule.type**, %m307$.Rule.type*** %.tmp2823
%.tmp2826 = getelementptr [6 x i8], [6 x i8]*@.str2825, i32 0, i32 0
%.tmp2827 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2821
%.tmp2828 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2824, i8* %.tmp2826, %m308$.Token.type* %.tmp2827)
%ast.2829 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2828, %m307$.ParseResult.type** %ast.2829
%.tmp2830 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2829
%.tmp2831 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2830, i32 0, i32 0
%.tmp2832 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2831
%.tmp2833 = icmp ne %m751$.Error.type* %.tmp2832, null
br i1 %.tmp2833, label %.if.true.2834, label %.if.false.2834
.if.true.2834:
%.tmp2835 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2836 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2829
%.tmp2837 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2836, i32 0, i32 0
%.tmp2838 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2837
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp2835, %m751$.Error.type* %.tmp2838)
br label %.if.end.2834
.if.false.2834:
br label %.if.end.2834
.if.end.2834:
%.tmp2839 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2840 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2829
%.tmp2841 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2840, i32 0, i32 1
%.tmp2842 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2841
%.tmp2843 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2839, %m307$.Node.type* %.tmp2842)
ret i1 %.tmp2843
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2844 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2845 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2844, i32 0, i32 2
%.tmp2846 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2845
%.tmp2847 = icmp eq %m1861$.ErrorList.type* %.tmp2846, null
br i1 %.tmp2847, label %.if.true.2848, label %.if.false.2848
.if.true.2848:
%.tmp2849 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2850 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2849, %m307$.Node.type* %.tmp2850)
br label %.if.end.2848
.if.false.2848:
br label %.if.end.2848
.if.end.2848:
%.tmp2851 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2852 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2851, i32 0, i32 2
%.tmp2853 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2852
%.tmp2854 = icmp ne %m1861$.ErrorList.type* %.tmp2853, null
br i1 %.tmp2854, label %.if.true.2855, label %.if.false.2855
.if.true.2855:
%.tmp2857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2858 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2857, i32 0, i32 2
%.tmp2859 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2858
%err.2860 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp2859, %m1861$.ErrorList.type** %err.2860
br label %.for.start.2856
.for.start.2856:
%.tmp2861 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2860
%.tmp2862 = icmp ne %m1861$.ErrorList.type* %.tmp2861, null
br i1 %.tmp2862, label %.for.continue.2856, label %.for.end.2856
.for.continue.2856:
%.tmp2863 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2860
%.tmp2864 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2863, i32 0, i32 2
%.tmp2865 = load i1, i1* %.tmp2864
%.tmp2866 = icmp eq i1 %.tmp2865, 0
br i1 %.tmp2866, label %.if.true.2867, label %.if.false.2867
.if.true.2867:
%.tmp2868 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2860
%.tmp2869 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2868, i32 0, i32 0
%.tmp2870 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2869
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp2870)
%.tmp2871 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2860
%.tmp2872 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2871, i32 0, i32 2
store i1 1, i1* %.tmp2872
br label %.if.end.2867
.if.false.2867:
br label %.if.end.2867
.if.end.2867:
%.tmp2873 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2860
%.tmp2874 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2873, i32 0, i32 1
%.tmp2875 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2874
store %m1861$.ErrorList.type* %.tmp2875, %m1861$.ErrorList.type** %err.2860
br label %.for.start.2856
.for.end.2856:
ret i1 1
br label %.if.end.2855
.if.false.2855:
br label %.if.end.2855
.if.end.2855:
ret i1 0
}
define void @m1861$mark_weak_global.v.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2877 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2878 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2877, i32 0, i32 3
%.tmp2879 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2878
%g.2880 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp2879, %m1861$.GlobalName.type** %g.2880
br label %.for.start.2876
.for.start.2876:
%.tmp2881 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2880
%.tmp2882 = icmp ne %m1861$.GlobalName.type* %.tmp2881, null
br i1 %.tmp2882, label %.for.continue.2876, label %.for.end.2876
.for.continue.2876:
%.tmp2883 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2880
%.tmp2884 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2883, i32 0, i32 3
%.tmp2885 = load i1, i1* %.tmp2884
%.tmp2886 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2880
%.tmp2887 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2886, i32 0, i32 0
%.tmp2888 = load i8*, i8** %.tmp2887
%.tmp2889 = load i8*, i8** %id
%.tmp2890 = call i32(i8*,i8*) @strcmp(i8* %.tmp2888, i8* %.tmp2889)
%.tmp2891 = icmp eq i32 %.tmp2890, 0
%.tmp2892 = and i1 %.tmp2885, %.tmp2891
br i1 %.tmp2892, label %.if.true.2893, label %.if.false.2893
.if.true.2893:
%.tmp2894 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2880
%.tmp2895 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2894, i32 0, i32 2
store i1 1, i1* %.tmp2895
br label %.for.end.2876
br label %.if.end.2893
.if.false.2893:
br label %.if.end.2893
.if.end.2893:
%.tmp2896 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2880
%.tmp2897 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2896, i32 0, i32 5
%.tmp2898 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2897
store %m1861$.GlobalName.type* %.tmp2898, %m1861$.GlobalName.type** %g.2880
br label %.for.start.2876
.for.end.2876:
ret void
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2899 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp2900 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2899, i32 0, i32 0
%.tmp2901 = load i8*, i8** %.tmp2900
%.tmp2903 = getelementptr [6 x i8], [6 x i8]*@.str2902, i32 0, i32 0
%.tmp2904 = call i32(i8*,i8*) @strcmp(i8* %.tmp2901, i8* %.tmp2903)
%.tmp2905 = icmp ne i32 %.tmp2904, 0
br i1 %.tmp2905, label %.if.true.2906, label %.if.false.2906
.if.true.2906:
%.tmp2907 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2908 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp2910 = getelementptr [29 x i8], [29 x i8]*@.str2909, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2907, %m307$.Node.type* %.tmp2908, i8* %.tmp2910)
ret void
br label %.if.end.2906
.if.false.2906:
br label %.if.end.2906
.if.end.2906:
%.tmp2911 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2913 = getelementptr [7 x i8], [7 x i8]*@.str2912, i32 0, i32 0
%.tmp2914 = bitcast ptr null to i8*
%.tmp2915 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp2911, i8* %.tmp2913, i8* %.tmp2914, i8* %.tmp2915)
%.tmp2916 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp2917 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2916, i32 0, i32 6
%.tmp2918 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2917
%start.2919 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp2918, %m307$.Node.type** %start.2919
%.tmp2920 = load %m307$.Node.type*, %m307$.Node.type** %start.2919
%.tmp2921 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2920, i32 0, i32 0
%.tmp2922 = load i8*, i8** %.tmp2921
%.tmp2924 = getelementptr [13 x i8], [13 x i8]*@.str2923, i32 0, i32 0
%.tmp2925 = call i32(i8*,i8*) @strcmp(i8* %.tmp2922, i8* %.tmp2924)
%.tmp2926 = icmp eq i32 %.tmp2925, 0
br i1 %.tmp2926, label %.if.true.2927, label %.if.false.2927
.if.true.2927:
%.tmp2928 = load %m307$.Node.type*, %m307$.Node.type** %start.2919
%.tmp2929 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2928, i32 0, i32 7
%.tmp2930 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2929
store %m307$.Node.type* %.tmp2930, %m307$.Node.type** %start.2919
br label %.if.end.2927
.if.false.2927:
br label %.if.end.2927
.if.end.2927:
%.tmp2932 = load %m307$.Node.type*, %m307$.Node.type** %start.2919
%stmt.2933 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp2932, %m307$.Node.type** %stmt.2933
br label %.for.start.2931
.for.start.2931:
%.tmp2934 = load %m307$.Node.type*, %m307$.Node.type** %stmt.2933
%.tmp2935 = icmp ne %m307$.Node.type* %.tmp2934, null
br i1 %.tmp2935, label %.for.continue.2931, label %.for.end.2931
.for.continue.2931:
%.tmp2936 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2937 = load %m307$.Node.type*, %m307$.Node.type** %stmt.2933
%.tmp2938 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2937, i32 0, i32 6
%.tmp2939 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2938
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp2936, %m307$.Node.type* %.tmp2939, i1 1)
%.tmp2940 = load %m307$.Node.type*, %m307$.Node.type** %stmt.2933
%.tmp2941 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2940, i32 0, i32 7
%.tmp2942 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2941
store %m307$.Node.type* %.tmp2942, %m307$.Node.type** %stmt.2933
br label %.for.start.2931
.for.end.2931:
%.tmp2944 = load %m307$.Node.type*, %m307$.Node.type** %start.2919
%s.2945 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp2944, %m307$.Node.type** %s.2945
br label %.for.start.2943
.for.start.2943:
%.tmp2946 = load %m307$.Node.type*, %m307$.Node.type** %s.2945
%.tmp2947 = icmp ne %m307$.Node.type* %.tmp2946, null
br i1 %.tmp2947, label %.for.continue.2943, label %.for.end.2943
.for.continue.2943:
%.tmp2948 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2949 = load %m307$.Node.type*, %m307$.Node.type** %s.2945
%.tmp2950 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2949, i32 0, i32 6
%.tmp2951 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2950
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp2948, %m307$.Node.type* %.tmp2951, i1 0)
%.tmp2952 = load %m307$.Node.type*, %m307$.Node.type** %s.2945
%.tmp2953 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2952, i32 0, i32 7
%.tmp2954 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2953
store %m307$.Node.type* %.tmp2954, %m307$.Node.type** %s.2945
br label %.for.start.2943
.for.end.2943:
%.tmp2955 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2956 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2955)
%mod.2957 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2956, %m1861$.ModuleLookup.type** %mod.2957
%.tmp2958 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.2957
%.tmp2959 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2958, i32 0, i32 1
%.tmp2960 = load i8*, i8** %.tmp2959
%.tmp2962 = getelementptr [1 x i8], [1 x i8]*@.str2961, i32 0, i32 0
%.tmp2963 = call i32(i8*,i8*) @strcmp(i8* %.tmp2960, i8* %.tmp2962)
%.tmp2964 = icmp eq i32 %.tmp2963, 0
br i1 %.tmp2964, label %.if.true.2965, label %.if.false.2965
.if.true.2965:
%.tmp2967 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2968 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2967, i32 0, i32 3
%.tmp2969 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2968
%g.2970 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp2969, %m1861$.GlobalName.type** %g.2970
br label %.for.start.2966
.for.start.2966:
%.tmp2971 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
%.tmp2972 = icmp ne %m1861$.GlobalName.type* %.tmp2971, null
br i1 %.tmp2972, label %.for.continue.2966, label %.for.end.2966
.for.continue.2966:
%.tmp2973 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2974 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp2973, %m1861$.GlobalName.type* %.tmp2974)
%.tmp2975 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
%.tmp2976 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2975, i32 0, i32 5
%.tmp2977 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2976
store %m1861$.GlobalName.type* %.tmp2977, %m1861$.GlobalName.type** %g.2970
br label %.for.start.2966
.for.end.2966:
br label %.if.end.2965
.if.false.2965:
br label %.if.end.2965
.if.end.2965:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp2978 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp2979 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2978, i32 0, i32 2
%.tmp2980 = load i1, i1* %.tmp2979
br i1 %.tmp2980, label %.if.true.2981, label %.if.false.2981
.if.true.2981:
ret void
br label %.if.end.2981
.if.false.2981:
br label %.if.end.2981
.if.end.2981:
%.tmp2982 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp2983 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2982, i32 0, i32 1
%.tmp2984 = load i8*, i8** %.tmp2983
%.tmp2986 = getelementptr [7 x i8], [7 x i8]*@.str2985, i32 0, i32 0
%.tmp2987 = call i32(i8*,i8*) @strcmp(i8* %.tmp2984, i8* %.tmp2986)
%.tmp2988 = icmp eq i32 %.tmp2987, 0
br i1 %.tmp2988, label %.if.true.2989, label %.if.false.2989
.if.true.2989:
%.tmp2990 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2991 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2990, i32 0, i32 1
%.tmp2992 = load %m0$.File.type*, %m0$.File.type** %.tmp2991
%.tmp2994 = getelementptr [21 x i8], [21 x i8]*@.str2993, i32 0, i32 0
%.tmp2995 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp2996 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2995, i32 0, i32 4
%.tmp2997 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp2996
%.tmp2998 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp2997)
%.tmp2999 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3000 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3001 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3000, i32 0, i32 4
%.tmp3002 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3001
%.tmp3003 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3002, i32 0, i32 4
%.tmp3004 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3003
%.tmp3005 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp2999, %m1861$.Type.type* %.tmp3004)
%.tmp3006 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3007 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3006, i32 0, i32 0
%.tmp3008 = load i8*, i8** %.tmp3007
%.tmp3009 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2992, i8* %.tmp2994, i8* %.tmp2998, i8* %.tmp3005, i8* %.tmp3008)
br label %.if.end.2989
.if.false.2989:
%.tmp3010 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3011 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3010, i32 0, i32 1
%.tmp3012 = load i8*, i8** %.tmp3011
%.tmp3014 = getelementptr [7 x i8], [7 x i8]*@.str3013, i32 0, i32 0
%.tmp3015 = call i32(i8*,i8*) @strcmp(i8* %.tmp3012, i8* %.tmp3014)
%.tmp3016 = icmp eq i32 %.tmp3015, 0
br i1 %.tmp3016, label %.if.true.3017, label %.if.false.3017
.if.true.3017:
%.tmp3018 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3019 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3020 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3019, i32 0, i32 4
%.tmp3021 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3020
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3018, %m1861$.AssignableInfo.type* %.tmp3021)
br label %.if.end.3017
.if.false.3017:
br label %.if.end.3017
.if.end.3017:
br label %.if.end.2989
.if.end.2989:
%.tmp3022 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3023 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3022, i32 0, i32 2
store i1 1, i1* %.tmp3023
ret void
}
define void @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp3024 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3025 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3024, i32 0, i32 1
%.tmp3026 = load %m0$.File.type*, %m0$.File.type** %.tmp3025
%.tmp3028 = getelementptr [15 x i8], [15 x i8]*@.str3027, i32 0, i32 0
%.tmp3029 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3031 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3030, i32 0, i32 4
%.tmp3032 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3031
%.tmp3033 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3032, i32 0, i32 3
%.tmp3034 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3033
%.tmp3035 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3029, %m1861$.Type.type* %.tmp3034)
%.tmp3036 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3037 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3036)
%.tmp3038 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3026, i8* %.tmp3028, i8* %.tmp3035, i8* %.tmp3037)
%.tmp3040 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3041 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3040, i32 0, i32 4
%.tmp3042 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3041
%.tmp3043 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3042, i32 0, i32 3
%.tmp3044 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3043
%.tmp3045 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3044, i32 0, i32 4
%.tmp3046 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3045
%pt.3047 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3046, %m1861$.Type.type** %pt.3047
br label %.for.start.3039
.for.start.3039:
%.tmp3048 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3047
%.tmp3049 = icmp ne %m1861$.Type.type* %.tmp3048, null
br i1 %.tmp3049, label %.for.continue.3039, label %.for.end.3039
.for.continue.3039:
%.tmp3050 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3047
%.tmp3051 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3052 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3051, i32 0, i32 4
%.tmp3053 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3052
%.tmp3054 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3053, i32 0, i32 3
%.tmp3055 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3054
%.tmp3056 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3055, i32 0, i32 4
%.tmp3057 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3056
%.tmp3058 = icmp ne %m1861$.Type.type* %.tmp3050, %.tmp3057
br i1 %.tmp3058, label %.if.true.3059, label %.if.false.3059
.if.true.3059:
%.tmp3060 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3061 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3060, i32 0, i32 1
%.tmp3062 = load %m0$.File.type*, %m0$.File.type** %.tmp3061
%.tmp3064 = getelementptr [3 x i8], [3 x i8]*@.str3063, i32 0, i32 0
%.tmp3065 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3062, i8* %.tmp3064)
br label %.if.end.3059
.if.false.3059:
br label %.if.end.3059
.if.end.3059:
%.tmp3066 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3067 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3066, i32 0, i32 1
%.tmp3068 = load %m0$.File.type*, %m0$.File.type** %.tmp3067
%.tmp3070 = getelementptr [3 x i8], [3 x i8]*@.str3069, i32 0, i32 0
%.tmp3071 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3072 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3047
%.tmp3073 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3071, %m1861$.Type.type* %.tmp3072)
%.tmp3074 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3068, i8* %.tmp3070, i8* %.tmp3073)
%.tmp3075 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3047
%.tmp3076 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3075, i32 0, i32 4
%.tmp3077 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3076
store %m1861$.Type.type* %.tmp3077, %m1861$.Type.type** %pt.3047
br label %.for.start.3039
.for.end.3039:
%.tmp3078 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3079 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3078, i32 0, i32 1
%.tmp3080 = load %m0$.File.type*, %m0$.File.type** %.tmp3079
%.tmp3082 = getelementptr [3 x i8], [3 x i8]*@.str3081, i32 0, i32 0
%.tmp3083 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3080, i8* %.tmp3082)
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
%.tmp3189 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3188, i32 0, i32 4
%.tmp3190 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3171
%.tmp3191 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3190, i32 0, i32 4
%.tmp3192 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3191
store %m1861$.Type.type* %.tmp3192, %m1861$.Type.type** %.tmp3189
%.tmp3193 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3194 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3193, i32 0, i32 3
%.tmp3196 = getelementptr [9 x i8], [9 x i8]*@.str3195, i32 0, i32 0
store i8* %.tmp3196, i8** %.tmp3194
%.tmp3197 = load i1, i1* %shallow
%.tmp3198 = icmp eq i1 %.tmp3197, 1
br i1 %.tmp3198, label %.if.true.3199, label %.if.false.3199
.if.true.3199:
%.tmp3200 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3201 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3202 = load i8*, i8** %global_name.3184
%.tmp3203 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3200, %m307$.Node.type* %.tmp3201, i8* %.tmp3202, %m1861$.AssignableInfo.type* %.tmp3203)
br label %.if.end.3199
.if.false.3199:
%.tmp3204 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3205 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3204, i32 0, i32 1
%.tmp3206 = load %m0$.File.type*, %m0$.File.type** %.tmp3205
%.tmp3208 = getelementptr [21 x i8], [21 x i8]*@.str3207, i32 0, i32 0
%.tmp3209 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3210 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3209)
%.tmp3211 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3212 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3213 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3212, i32 0, i32 4
%.tmp3214 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3213
%.tmp3215 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3211, %m1861$.Type.type* %.tmp3214)
%.tmp3216 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3171
%.tmp3217 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3216)
%.tmp3218 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3206, i8* %.tmp3208, i8* %.tmp3210, i8* %.tmp3215, i8* %.tmp3217)
br label %.if.end.3199
.if.end.3199:
br label %.if.end.3160
.if.false.3160:
%.tmp3219 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3220 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3219, i32 0, i32 0
%.tmp3221 = load i8*, i8** %.tmp3220
%.tmp3223 = getelementptr [10 x i8], [10 x i8]*@.str3222, i32 0, i32 0
%.tmp3224 = call i32(i8*,i8*) @strcmp(i8* %.tmp3221, i8* %.tmp3223)
%.tmp3225 = icmp eq i32 %.tmp3224, 0
br i1 %.tmp3225, label %.if.true.3226, label %.if.false.3226
.if.true.3226:
%.tmp3227 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3228 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3227, i32 0, i32 6
%.tmp3229 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3228
%.tmp3230 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3229, i32 0, i32 7
%.tmp3231 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3230
%.tmp3232 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3231, i32 0, i32 1
%.tmp3233 = load i8*, i8** %.tmp3232
%type_name.3234 = alloca i8*
store i8* %.tmp3233, i8** %type_name.3234
%.tmp3235 = load i1, i1* %shallow
%.tmp3236 = icmp eq i1 %.tmp3235, 1
br i1 %.tmp3236, label %.if.true.3237, label %.if.false.3237
.if.true.3237:
%.tmp3238 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3239 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3238)
store %m1861$.AssignableInfo.type* %.tmp3239, %m1861$.AssignableInfo.type** %info.3141
%.tmp3240 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3241 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3240)
%mod_from.3242 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3241, %m1861$.ModuleLookup.type** %mod_from.3242
%.tmp3243 = getelementptr i8*, i8** %tmp_buff.3144, i32 0
%.tmp3245 = getelementptr [11 x i8], [11 x i8]*@.str3244, i32 0, i32 0
%.tmp3246 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3242
%.tmp3247 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3246, i32 0, i32 1
%.tmp3248 = load i8*, i8** %.tmp3247
%.tmp3249 = load i8*, i8** %type_name.3234
%.tmp3250 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3243, i8* %.tmp3245, i8* %.tmp3248, i8* %.tmp3249)
%.tmp3251 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3252 = load i8, i8* @SCOPE_LOCAL
%.tmp3253 = load i8*, i8** %tmp_buff.3144
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3251, i8 %.tmp3252, i8* %.tmp3253)
%.tmp3254 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3255 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3254, i32 0, i32 3
%.tmp3257 = getelementptr [10 x i8], [10 x i8]*@.str3256, i32 0, i32 0
store i8* %.tmp3257, i8** %.tmp3255
%.tmp3258 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3259 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3258, i32 0, i32 5
%.tmp3260 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3261 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3260, i32 0, i32 3
%.tmp3262 = load i32, i32* %.tmp3261
store i32 %.tmp3262, i32* %.tmp3259
%.tmp3263 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3264 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3263, i32 0, i32 6
%.tmp3265 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3266 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3265, i32 0, i32 4
%.tmp3267 = load i32, i32* %.tmp3266
store i32 %.tmp3267, i32* %.tmp3264
%.tmp3268 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3269 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3268, i32 0, i32 4
%.tmp3270 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3270, %m1861$.Type.type** %.tmp3269
%.tmp3271 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3272 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3273 = load i8*, i8** %type_name.3234
%.tmp3274 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3271, %m307$.Node.type* %.tmp3272, i8* %.tmp3273, %m1861$.AssignableInfo.type* %.tmp3274)
%.tmp3275 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3276 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3275, i32 0, i32 6
%.tmp3277 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3276
%.tmp3279 = getelementptr [5 x i8], [5 x i8]*@.str3278, i32 0, i32 0
%.tmp3280 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3277, i8* %.tmp3279)
%type_decl.3281 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3280, %m307$.Node.type** %type_decl.3281
%.tmp3282 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3283 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3281
%.tmp3284 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3283, i32 0, i32 6
%.tmp3285 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3284
%.tmp3286 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3282, %m307$.Node.type* %.tmp3285)
%type_struct.3287 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3286, %m1861$.Type.type** %type_struct.3287
%.tmp3288 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3289 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3288, i32 0, i32 4
%.tmp3290 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3289
%.tmp3291 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3287
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3290, %m1861$.Type.type* %.tmp3291)
%.tmp3292 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3293 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3292, i32 0, i32 4
%.tmp3294 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3287
store %m1861$.Type.type* %.tmp3294, %m1861$.Type.type** %.tmp3293
br label %.if.end.3237
.if.false.3237:
%.tmp3295 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3296 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3297 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3296, i32 0, i32 7
%.tmp3298 = load i8*, i8** %.tmp3297
%.tmp3299 = load i8*, i8** %type_name.3234
%.tmp3300 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3295, i8* %.tmp3298, i8* %.tmp3299)
%scope.3301 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3300, %m1861$.ScopeItem.type** %scope.3301
%.tmp3302 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3301
%.tmp3303 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3302, i32 0, i32 1
%.tmp3304 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3303
store %m1861$.AssignableInfo.type* %.tmp3304, %m1861$.AssignableInfo.type** %info.3141
%.tmp3305 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3306 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3305, i32 0, i32 1
%.tmp3307 = load %m0$.File.type*, %m0$.File.type** %.tmp3306
%.tmp3309 = getelementptr [14 x i8], [14 x i8]*@.str3308, i32 0, i32 0
%.tmp3310 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3311 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3310)
%.tmp3312 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3313 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3314 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3313, i32 0, i32 4
%.tmp3315 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3314
%.tmp3316 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3312, %m1861$.Type.type* %.tmp3315)
%.tmp3317 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3307, i8* %.tmp3309, i8* %.tmp3311, i8* %.tmp3316)
br label %.if.end.3237
.if.end.3237:
br label %.if.end.3226
.if.false.3226:
%.tmp3318 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3319 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3318, i32 0, i32 0
%.tmp3320 = load i8*, i8** %.tmp3319
%.tmp3322 = getelementptr [7 x i8], [7 x i8]*@.str3321, i32 0, i32 0
%.tmp3323 = call i32(i8*,i8*) @strcmp(i8* %.tmp3320, i8* %.tmp3322)
%.tmp3324 = icmp eq i32 %.tmp3323, 0
br i1 %.tmp3324, label %.if.true.3325, label %.if.false.3325
.if.true.3325:
%.tmp3326 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3327 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3326)
store %m1861$.AssignableInfo.type* %.tmp3327, %m1861$.AssignableInfo.type** %info.3141
%.tmp3328 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3329 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3328, i32 0, i32 4
%.tmp3330 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3331 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3332 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3331, i32 0, i32 6
%.tmp3333 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3332
%.tmp3334 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3333, i32 0, i32 7
%.tmp3335 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3334
%.tmp3336 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3330, %m307$.Node.type* %.tmp3335)
store %m1861$.Type.type* %.tmp3336, %m1861$.Type.type** %.tmp3329
%.tmp3337 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3338 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3337, i32 0, i32 3
%.tmp3340 = getelementptr [7 x i8], [7 x i8]*@.str3339, i32 0, i32 0
store i8* %.tmp3340, i8** %.tmp3338
%.tmp3341 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3342 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3341, i32 0, i32 6
%.tmp3343 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3342
%.tmp3344 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3343, i32 0, i32 7
%.tmp3345 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3344
%.tmp3346 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3345, i32 0, i32 7
%.tmp3347 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3346
%.tmp3348 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3347, i32 0, i32 1
%.tmp3349 = load i8*, i8** %.tmp3348
%fn_name.3350 = alloca i8*
store i8* %.tmp3349, i8** %fn_name.3350
%.tmp3351 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3352 = load i8, i8* @SCOPE_GLOBAL
%.tmp3353 = load i8*, i8** %fn_name.3350
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3351, i8 %.tmp3352, i8* %.tmp3353)
%.tmp3354 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3354, %m1861$.Type.type** %return_type.3142
%.tmp3355 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3356 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3355, i32 0, i32 0
%.tmp3357 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3358 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3357, i32 0, i32 4
%.tmp3359 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3358
%.tmp3360 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3359, i32 0, i32 3
%.tmp3361 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3360
%.tmp3362 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3361, i32 0, i32 0
%.tmp3363 = load i8*, i8** %.tmp3362
store i8* %.tmp3363, i8** %.tmp3356
%.tmp3364 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3365 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3364, i32 0, i32 3
%.tmp3366 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3367 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3366, i32 0, i32 4
%.tmp3368 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3367
%.tmp3369 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3368, i32 0, i32 3
%.tmp3370 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3369
%.tmp3371 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3370, i32 0, i32 3
%.tmp3372 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3371
store %m1861$.Type.type* %.tmp3372, %m1861$.Type.type** %.tmp3365
%.tmp3373 = load i1, i1* %shallow
%.tmp3374 = icmp eq i1 %.tmp3373, 0
br i1 %.tmp3374, label %.if.true.3375, label %.if.false.3375
.if.true.3375:
%.tmp3376 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3377 = load i8*, i8** %fn_name.3350
call void(%m1861$.CompilerCtx.type*,i8*) @m1861$mark_weak_global.v.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3376, i8* %.tmp3377)
%.tmp3378 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3379 = load i8*, i8** %fn_name.3350
%.tmp3381 = getelementptr [7 x i8], [7 x i8]*@.str3380, i32 0, i32 0
%.tmp3382 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp3378, i8* %.tmp3379, i8* %.tmp3381, %m1861$.AssignableInfo.type* %.tmp3382, i1 1, i1 1)
%.tmp3383 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3384 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3383, %m1861$.AssignableInfo.type* %.tmp3384)
br label %.if.end.3375
.if.false.3375:
%.tmp3385 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3386 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3387 = load i8*, i8** %fn_name.3350
%.tmp3388 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3385, %m307$.Node.type* %.tmp3386, i8* %.tmp3387, %m1861$.AssignableInfo.type* %.tmp3388)
br label %.if.end.3375
.if.end.3375:
br label %.if.end.3325
.if.false.3325:
%.tmp3389 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3390 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3389, i32 0, i32 0
%.tmp3391 = load i8*, i8** %.tmp3390
%.tmp3393 = getelementptr [9 x i8], [9 x i8]*@.str3392, i32 0, i32 0
%.tmp3394 = call i32(i8*,i8*) @strcmp(i8* %.tmp3391, i8* %.tmp3393)
%.tmp3395 = icmp eq i32 %.tmp3394, 0
br i1 %.tmp3395, label %.if.true.3396, label %.if.false.3396
.if.true.3396:
%.tmp3397 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3398 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3397)
store %m1861$.AssignableInfo.type* %.tmp3398, %m1861$.AssignableInfo.type** %info.3141
%.tmp3399 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3400 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3399, i32 0, i32 3
%.tmp3402 = getelementptr [9 x i8], [9 x i8]*@.str3401, i32 0, i32 0
store i8* %.tmp3402, i8** %.tmp3400
%.tmp3403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3404 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3403, i32 0, i32 4
%.tmp3405 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3406 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3407 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3406, i32 0, i32 6
%.tmp3408 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3407
%.tmp3409 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3405, %m307$.Node.type* %.tmp3408)
store %m1861$.Type.type* %.tmp3409, %m1861$.Type.type** %.tmp3404
%.tmp3410 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3411 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3410)
%name.3412 = alloca i8*
store i8* %.tmp3411, i8** %name.3412
%.tmp3413 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3414 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3415 = load i8*, i8** %name.3412
%.tmp3416 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3417 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3416, i32 0, i32 4
%.tmp3418 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3417
%.tmp3419 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3413, %m307$.Node.type* %.tmp3414, i8* %.tmp3415, %m1861$.Type.type* %.tmp3418)
store i8* %.tmp3419, i8** %tmp_buff.3144
%.tmp3420 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3421 = load i8, i8* @SCOPE_GLOBAL
%.tmp3422 = load i8*, i8** %tmp_buff.3144
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3420, i8 %.tmp3421, i8* %.tmp3422)
%.tmp3423 = load i1, i1* %shallow
%.tmp3424 = icmp eq i1 %.tmp3423, 1
br i1 %.tmp3424, label %.if.true.3425, label %.if.false.3425
.if.true.3425:
%.tmp3426 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3427 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3428 = load i8*, i8** %name.3412
%.tmp3429 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3426, %m307$.Node.type* %.tmp3427, i8* %.tmp3428, %m1861$.AssignableInfo.type* %.tmp3429)
br label %.if.end.3425
.if.false.3425:
%.tmp3430 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3430, %m1861$.Type.type** %return_type.3142
%.tmp3431 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3432 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3433 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3432, i32 0, i32 4
%.tmp3434 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3433
%.tmp3435 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3434, i32 0, i32 3
%.tmp3436 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3435
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3431, %m1861$.Type.type* %.tmp3436)
%.tmp3437 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3438 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3437, i32 0, i32 1
%.tmp3439 = load %m0$.File.type*, %m0$.File.type** %.tmp3438
%.tmp3441 = getelementptr [14 x i8], [14 x i8]*@.str3440, i32 0, i32 0
%.tmp3442 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3443 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3444 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3442, %m1861$.Type.type* %.tmp3443)
%.tmp3445 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3141
%.tmp3446 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3445)
%.tmp3447 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3439, i8* %.tmp3441, i8* %.tmp3444, i8* %.tmp3446)
%.tmp3448 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3449 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3448, i32 0, i32 6
%.tmp3450 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3449
%.tmp3451 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3450)
%params.3452 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3451, %m307$.Node.type** %params.3452
%param_type.3453 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3453
%.tmp3455 = load %m307$.Node.type*, %m307$.Node.type** %params.3452
%param_ptr.3456 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3455, %m307$.Node.type** %param_ptr.3456
br label %.for.start.3454
.for.start.3454:
%.tmp3457 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3458 = icmp ne %m307$.Node.type* %.tmp3457, null
br i1 %.tmp3458, label %.for.continue.3454, label %.for.end.3454
.for.continue.3454:
%.tmp3459 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3460 = load %m307$.Node.type*, %m307$.Node.type** %params.3452
%.tmp3461 = icmp ne %m307$.Node.type* %.tmp3459, %.tmp3460
br i1 %.tmp3461, label %.if.true.3462, label %.if.false.3462
.if.true.3462:
%.tmp3463 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3464 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3463, i32 0, i32 7
%.tmp3465 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3464
store %m307$.Node.type* %.tmp3465, %m307$.Node.type** %param_ptr.3456
%.tmp3466 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3467 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3466, i32 0, i32 1
%.tmp3468 = load %m0$.File.type*, %m0$.File.type** %.tmp3467
%.tmp3470 = getelementptr [3 x i8], [3 x i8]*@.str3469, i32 0, i32 0
%.tmp3471 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3468, i8* %.tmp3470)
br label %.if.end.3462
.if.false.3462:
br label %.if.end.3462
.if.end.3462:
%.tmp3472 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3473 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3472, i32 0, i32 0
%.tmp3474 = load i8*, i8** %.tmp3473
%.tmp3476 = getelementptr [5 x i8], [5 x i8]*@.str3475, i32 0, i32 0
%.tmp3477 = call i32(i8*,i8*) @strcmp(i8* %.tmp3474, i8* %.tmp3476)
%.tmp3478 = icmp eq i32 %.tmp3477, 0
br i1 %.tmp3478, label %.if.true.3479, label %.if.false.3479
.if.true.3479:
%.tmp3480 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3481 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3482 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3481, i32 0, i32 6
%.tmp3483 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3482
%.tmp3484 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3480, %m307$.Node.type* %.tmp3483)
store %m1861$.Type.type* %.tmp3484, %m1861$.Type.type** %param_type.3453
%.tmp3485 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3486 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3485, i32 0, i32 7
%.tmp3487 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3486
store %m307$.Node.type* %.tmp3487, %m307$.Node.type** %param_ptr.3456
br label %.if.end.3479
.if.false.3479:
br label %.if.end.3479
.if.end.3479:
%.tmp3488 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3489 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3488, i32 0, i32 1
%.tmp3490 = load %m0$.File.type*, %m0$.File.type** %.tmp3489
%.tmp3492 = getelementptr [13 x i8], [13 x i8]*@.str3491, i32 0, i32 0
%.tmp3493 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3494 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3453
%.tmp3495 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3493, %m1861$.Type.type* %.tmp3494)
%.tmp3496 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3497 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3496, i32 0, i32 1
%.tmp3498 = load i8*, i8** %.tmp3497
%.tmp3499 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3490, i8* %.tmp3492, i8* %.tmp3495, i8* %.tmp3498)
%.tmp3500 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3456
%.tmp3501 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3500, i32 0, i32 7
%.tmp3502 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3501
store %m307$.Node.type* %.tmp3502, %m307$.Node.type** %param_ptr.3456
br label %.for.start.3454
.for.end.3454:
%.tmp3503 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3504 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3503, i32 0, i32 1
%.tmp3505 = load %m0$.File.type*, %m0$.File.type** %.tmp3504
%.tmp3507 = getelementptr [5 x i8], [5 x i8]*@.str3506, i32 0, i32 0
%.tmp3508 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3505, i8* %.tmp3507)
%.tmp3509 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3511 = getelementptr [9 x i8], [9 x i8]*@.str3510, i32 0, i32 0
%.tmp3512 = bitcast ptr null to i8*
%.tmp3513 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3509, i8* %.tmp3511, i8* %.tmp3512, i8* %.tmp3513)
%.tmp3514 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3515 = load %m307$.Node.type*, %m307$.Node.type** %params.3452
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3514, %m307$.Node.type* %.tmp3515)
%.tmp3516 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3517 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3516, i32 0, i32 6
%.tmp3518 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3517
%.tmp3520 = getelementptr [6 x i8], [6 x i8]*@.str3519, i32 0, i32 0
%.tmp3521 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3518, i8* %.tmp3520)
%fn_block.3522 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3521, %m307$.Node.type** %fn_block.3522
%.tmp3523 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3524 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3522
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3523, %m307$.Node.type* %.tmp3524)
%.tmp3525 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3525)
%.tmp3526 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3527 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3526, %m307$.Node.type** %last_valid_instruction.3527
%.tmp3528 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3522
%.tmp3529 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3528, i32 0, i32 6
%.tmp3530 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3529
%.tmp3532 = getelementptr [12 x i8], [12 x i8]*@.str3531, i32 0, i32 0
%.tmp3533 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3530, i8* %.tmp3532)
%ci.3534 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3533, %m307$.Node.type** %ci.3534
%.tmp3536 = load %m307$.Node.type*, %m307$.Node.type** %ci.3534
%.tmp3537 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3536, i32 0, i32 6
%.tmp3538 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3537
store %m307$.Node.type* %.tmp3538, %m307$.Node.type** %ci.3534
br label %.for.start.3535
.for.start.3535:
%.tmp3539 = load %m307$.Node.type*, %m307$.Node.type** %ci.3534
%.tmp3540 = icmp ne %m307$.Node.type* %.tmp3539, null
br i1 %.tmp3540, label %.for.continue.3535, label %.for.end.3535
.for.continue.3535:
%.tmp3541 = load %m307$.Node.type*, %m307$.Node.type** %ci.3534
%.tmp3542 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3541, i32 0, i32 0
%.tmp3543 = load i8*, i8** %.tmp3542
%.tmp3545 = getelementptr [3 x i8], [3 x i8]*@.str3544, i32 0, i32 0
%.tmp3546 = call i32(i8*,i8*) @strcmp(i8* %.tmp3543, i8* %.tmp3545)
%.tmp3547 = icmp ne i32 %.tmp3546, 0
%.tmp3548 = load %m307$.Node.type*, %m307$.Node.type** %ci.3534
%.tmp3549 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3548, i32 0, i32 0
%.tmp3550 = load i8*, i8** %.tmp3549
%.tmp3552 = getelementptr [9 x i8], [9 x i8]*@.str3551, i32 0, i32 0
%.tmp3553 = call i32(i8*,i8*) @strcmp(i8* %.tmp3550, i8* %.tmp3552)
%.tmp3554 = icmp ne i32 %.tmp3553, 0
%.tmp3555 = and i1 %.tmp3547, %.tmp3554
br i1 %.tmp3555, label %.if.true.3556, label %.if.false.3556
.if.true.3556:
%.tmp3557 = load %m307$.Node.type*, %m307$.Node.type** %ci.3534
store %m307$.Node.type* %.tmp3557, %m307$.Node.type** %last_valid_instruction.3527
br label %.if.end.3556
.if.false.3556:
br label %.if.end.3556
.if.end.3556:
%.tmp3558 = load %m307$.Node.type*, %m307$.Node.type** %ci.3534
%.tmp3559 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3558, i32 0, i32 7
%.tmp3560 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3559
store %m307$.Node.type* %.tmp3560, %m307$.Node.type** %ci.3534
br label %.for.start.3535
.for.end.3535:
%add_implicit_return.3561 = alloca i1
store i1 0, i1* %add_implicit_return.3561
%.tmp3562 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3527
%.tmp3563 = icmp eq %m307$.Node.type* %.tmp3562, null
br i1 %.tmp3563, label %.if.true.3564, label %.if.false.3564
.if.true.3564:
store i1 1, i1* %add_implicit_return.3561
br label %.if.end.3564
.if.false.3564:
%.tmp3565 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3527
%.tmp3566 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3565, i32 0, i32 6
%.tmp3567 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3566
%.tmp3568 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3567, i32 0, i32 0
%.tmp3569 = load i8*, i8** %.tmp3568
%.tmp3571 = getelementptr [7 x i8], [7 x i8]*@.str3570, i32 0, i32 0
%.tmp3572 = call i32(i8*,i8*) @strcmp(i8* %.tmp3569, i8* %.tmp3571)
%.tmp3573 = icmp ne i32 %.tmp3572, 0
br i1 %.tmp3573, label %.if.true.3574, label %.if.false.3574
.if.true.3574:
store i1 1, i1* %add_implicit_return.3561
br label %.if.end.3574
.if.false.3574:
br label %.if.end.3574
.if.end.3574:
br label %.if.end.3564
.if.end.3564:
%.tmp3575 = load i1, i1* %add_implicit_return.3561
br i1 %.tmp3575, label %.if.true.3576, label %.if.false.3576
.if.true.3576:
%.tmp3577 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3578 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3142
%.tmp3579 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3577, %m1861$.Type.type* %.tmp3578)
%.tmp3581 = getelementptr [5 x i8], [5 x i8]*@.str3580, i32 0, i32 0
%.tmp3582 = call i32(i8*,i8*) @strcmp(i8* %.tmp3579, i8* %.tmp3581)
%.tmp3583 = icmp ne i32 %.tmp3582, 0
br i1 %.tmp3583, label %.if.true.3584, label %.if.false.3584
.if.true.3584:
%.tmp3585 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3586 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3522
%.tmp3588 = getelementptr [21 x i8], [21 x i8]*@.str3587, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3585, %m307$.Node.type* %.tmp3586, i8* %.tmp3588)
br label %.if.end.3584
.if.false.3584:
%.tmp3589 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3590 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3589, i32 0, i32 1
%.tmp3591 = load %m0$.File.type*, %m0$.File.type** %.tmp3590
%.tmp3593 = getelementptr [10 x i8], [10 x i8]*@.str3592, i32 0, i32 0
%.tmp3594 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3591, i8* %.tmp3593)
br label %.if.end.3584
.if.end.3584:
br label %.if.end.3576
.if.false.3576:
br label %.if.end.3576
.if.end.3576:
%.tmp3595 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3596 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3595, i32 0, i32 1
%.tmp3597 = load %m0$.File.type*, %m0$.File.type** %.tmp3596
%.tmp3599 = getelementptr [3 x i8], [3 x i8]*@.str3598, i32 0, i32 0
%.tmp3600 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3597, i8* %.tmp3599)
br label %.if.end.3425
.if.end.3425:
br label %.if.end.3396
.if.false.3396:
%.tmp3601 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3602 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3601, i32 0, i32 0
%.tmp3603 = load i8*, i8** %.tmp3602
%.tmp3605 = getelementptr [7 x i8], [7 x i8]*@.str3604, i32 0, i32 0
%.tmp3606 = call i32(i8*,i8*) @strcmp(i8* %.tmp3603, i8* %.tmp3605)
%.tmp3607 = icmp eq i32 %.tmp3606, 0
br i1 %.tmp3607, label %.if.true.3608, label %.if.false.3608
.if.true.3608:
%.tmp3609 = load i1, i1* %shallow
%.tmp3610 = icmp eq i1 %.tmp3609, 1
br i1 %.tmp3610, label %.if.true.3611, label %.if.false.3611
.if.true.3611:
%.tmp3612 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3613 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3612, i32 0, i32 6
%.tmp3614 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3613
%.tmp3615 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3614, i32 0, i32 7
%.tmp3616 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3615
%.tmp3617 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3616, i32 0, i32 1
%.tmp3618 = load i8*, i8** %.tmp3617
%mod_name.3619 = alloca i8*
store i8* %.tmp3618, i8** %mod_name.3619
%.tmp3620 = load i8*, i8** %mod_name.3619
%.tmp3621 = call i32(i8*) @strlen(i8* %.tmp3620)
%mod_name_len.3622 = alloca i32
store i32 %.tmp3621, i32* %mod_name_len.3622
%.tmp3623 = load i32, i32* %mod_name_len.3622
%.tmp3624 = sub i32 %.tmp3623, 1
%.tmp3625 = call i8*(i32) @malloc(i32 %.tmp3624)
%trimmed_path.3626 = alloca i8*
store i8* %.tmp3625, i8** %trimmed_path.3626
%i.3628 = alloca i32
store i32 1, i32* %i.3628
br label %.for.start.3627
.for.start.3627:
%.tmp3629 = load i32, i32* %i.3628
%.tmp3630 = load i32, i32* %mod_name_len.3622
%.tmp3631 = sub i32 %.tmp3630, 1
%.tmp3632 = icmp slt i32 %.tmp3629, %.tmp3631
br i1 %.tmp3632, label %.for.continue.3627, label %.for.end.3627
.for.continue.3627:
%.tmp3633 = load i32, i32* %i.3628
%.tmp3634 = sub i32 %.tmp3633, 1
%.tmp3635 = load i8*, i8** %trimmed_path.3626
%.tmp3636 = getelementptr i8, i8* %.tmp3635, i32 %.tmp3634
%.tmp3637 = load i32, i32* %i.3628
%.tmp3638 = load i8*, i8** %mod_name.3619
%.tmp3639 = getelementptr i8, i8* %.tmp3638, i32 %.tmp3637
%.tmp3640 = load i8, i8* %.tmp3639
store i8 %.tmp3640, i8* %.tmp3636
%.tmp3641 = load i32, i32* %i.3628
%.tmp3642 = add i32 %.tmp3641, 1
store i32 %.tmp3642, i32* %i.3628
br label %.for.start.3627
.for.end.3627:
%.tmp3643 = load i32, i32* %mod_name_len.3622
%.tmp3644 = sub i32 %.tmp3643, 2
%.tmp3645 = load i8*, i8** %trimmed_path.3626
%.tmp3646 = getelementptr i8, i8* %.tmp3645, i32 %.tmp3644
store i8 0, i8* %.tmp3646
%.tmp3647 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3648 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3649 = load i8*, i8** %trimmed_path.3626
%.tmp3650 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3647, %m307$.Node.type* %.tmp3648, i8* %.tmp3649)
%mod_abspath.3651 = alloca i8*
store i8* %.tmp3650, i8** %mod_abspath.3651
%.tmp3652 = load i8*, i8** %mod_abspath.3651
%.tmp3653 = call i8*(i32) @malloc(i32 4096)
%.tmp3654 = call i8*(i8*,i8*) @realpath(i8* %.tmp3652, i8* %.tmp3653)
store i8* %.tmp3654, i8** %mod_abspath.3651
%.tmp3655 = load i8*, i8** %mod_abspath.3651
%.tmp3656 = icmp eq i8* %.tmp3655, null
br i1 %.tmp3656, label %.if.true.3657, label %.if.false.3657
.if.true.3657:
%.tmp3658 = getelementptr i8*, i8** %err_buf.3143, i32 0
%.tmp3660 = getelementptr [54 x i8], [54 x i8]*@.str3659, i32 0, i32 0
%.tmp3661 = load i8*, i8** %mod_name.3619
%.tmp3662 = load i8*, i8** %trimmed_path.3626
%.tmp3663 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3658, i8* %.tmp3660, i8* %.tmp3661, i8* %.tmp3662)
%.tmp3664 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3665 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3666 = load i8*, i8** %err_buf.3143
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3664, %m307$.Node.type* %.tmp3665, i8* %.tmp3666)
ret void
br label %.if.end.3657
.if.false.3657:
br label %.if.end.3657
.if.end.3657:
%m.3667 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3667
%.tmp3668 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3669 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3668, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3671 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3672 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3671, i32 0, i32 6
%.tmp3673 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3672
store %m1861$.ModuleLookup.type* %.tmp3673, %m1861$.ModuleLookup.type** %m.3667
br label %.for.start.3670
.for.start.3670:
%.tmp3674 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
%.tmp3675 = icmp ne %m1861$.ModuleLookup.type* %.tmp3674, null
%.tmp3676 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3677 = icmp eq %m1861$.ModuleLookup.type* %.tmp3676, null
%.tmp3678 = and i1 %.tmp3675, %.tmp3677
br i1 %.tmp3678, label %.for.continue.3670, label %.for.end.3670
.for.continue.3670:
%.tmp3679 = load i8*, i8** %mod_abspath.3651
%.tmp3680 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
%.tmp3681 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3680, i32 0, i32 0
%.tmp3682 = load i8*, i8** %.tmp3681
%.tmp3683 = call i32(i8*,i8*) @strcmp(i8* %.tmp3679, i8* %.tmp3682)
%.tmp3684 = icmp eq i32 %.tmp3683, 0
br i1 %.tmp3684, label %.if.true.3685, label %.if.false.3685
.if.true.3685:
%.tmp3686 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
store %m1861$.ModuleLookup.type* %.tmp3686, %m1861$.ModuleLookup.type** %mod.3669
br label %.if.end.3685
.if.false.3685:
br label %.if.end.3685
.if.end.3685:
%.tmp3687 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
%.tmp3688 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3687, i32 0, i32 2
%.tmp3689 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3688
store %m1861$.ModuleLookup.type* %.tmp3689, %m1861$.ModuleLookup.type** %m.3667
br label %.for.start.3670
.for.end.3670:
%.tmp3690 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3691 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3690, i32 0, i32 6
%.tmp3692 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3691
%.tmp3693 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3692, i32 0, i32 7
%.tmp3694 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3693
%.tmp3695 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3694, i32 0, i32 7
%.tmp3696 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3695
%.tmp3697 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3696, i32 0, i32 7
%.tmp3698 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3697
%.tmp3699 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3698, i32 0, i32 1
%.tmp3700 = load i8*, i8** %.tmp3699
%asname.3701 = alloca i8*
store i8* %.tmp3700, i8** %asname.3701
%.tmp3702 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3703 = icmp eq %m1861$.ModuleLookup.type* %.tmp3702, null
br i1 %.tmp3703, label %.if.true.3704, label %.if.false.3704
.if.true.3704:
%.tmp3705 = load i32, i32* @ModuleLookup_size
%.tmp3706 = call i8*(i32) @malloc(i32 %.tmp3705)
%.tmp3707 = bitcast i8* %.tmp3706 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3707, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3708 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3709 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3708, i32 0, i32 0
%.tmp3710 = load i8*, i8** %mod_abspath.3651
store i8* %.tmp3710, i8** %.tmp3709
%.tmp3711 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3712 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3711, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3712
%.tmp3713 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3714 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3713, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3714
%.tmp3715 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3716 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3715, i32 0, i32 1
%.tmp3717 = getelementptr i8*, i8** %.tmp3716, i32 0
%.tmp3719 = getelementptr [5 x i8], [5 x i8]*@.str3718, i32 0, i32 0
%.tmp3720 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3721 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3720)
%.tmp3722 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3717, i8* %.tmp3719, i32 %.tmp3721)
%.tmp3724 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3725 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3724, i32 0, i32 6
%.tmp3726 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3725
store %m1861$.ModuleLookup.type* %.tmp3726, %m1861$.ModuleLookup.type** %m.3667
br label %.for.start.3723
.for.start.3723:
%.tmp3727 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
%.tmp3728 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3727, i32 0, i32 2
%.tmp3729 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3728
%.tmp3730 = icmp ne %m1861$.ModuleLookup.type* %.tmp3729, null
br i1 %.tmp3730, label %.for.continue.3723, label %.for.end.3723
.for.continue.3723:
%.tmp3731 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
%.tmp3732 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3731, i32 0, i32 2
%.tmp3733 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3732
store %m1861$.ModuleLookup.type* %.tmp3733, %m1861$.ModuleLookup.type** %m.3667
br label %.for.start.3723
.for.end.3723:
%.tmp3734 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3667
%.tmp3735 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3734, i32 0, i32 2
%.tmp3736 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
store %m1861$.ModuleLookup.type* %.tmp3736, %m1861$.ModuleLookup.type** %.tmp3735
%.tmp3737 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3738 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3739 = load i8*, i8** %asname.3701
%.tmp3740 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3741 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3740, i32 0, i32 0
%.tmp3742 = load i8*, i8** %.tmp3741
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3737, %m307$.Node.type* %.tmp3738, i8* %.tmp3739, i8* %.tmp3742)
%.tmp3743 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3744 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3743, i32 0, i32 7
%.tmp3745 = load i8*, i8** %.tmp3744
%curr_mod.3746 = alloca i8*
store i8* %.tmp3745, i8** %curr_mod.3746
%.tmp3747 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3748 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3747, i32 0, i32 7
%.tmp3749 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3750 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3749, i32 0, i32 0
%.tmp3751 = load i8*, i8** %.tmp3750
store i8* %.tmp3751, i8** %.tmp3748
%.tmp3752 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3753 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3754 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3755 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3754, i32 0, i32 0
%.tmp3756 = load i8*, i8** %.tmp3755
%.tmp3757 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3752, %m307$.Node.type* %.tmp3753, i8* %.tmp3756)
%.tmp3758 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3759 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3758, i32 0, i32 7
%.tmp3760 = load i8*, i8** %curr_mod.3746
store i8* %.tmp3760, i8** %.tmp3759
br label %.if.end.3704
.if.false.3704:
%.tmp3761 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3762 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3763 = load i8*, i8** %asname.3701
%.tmp3764 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3669
%.tmp3765 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3764, i32 0, i32 0
%.tmp3766 = load i8*, i8** %.tmp3765
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3761, %m307$.Node.type* %.tmp3762, i8* %.tmp3763, i8* %.tmp3766)
br label %.if.end.3704
.if.end.3704:
br label %.if.end.3611
.if.false.3611:
br label %.if.end.3611
.if.end.3611:
br label %.if.end.3608
.if.false.3608:
%.tmp3767 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3768 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3770 = getelementptr [40 x i8], [40 x i8]*@.str3769, i32 0, i32 0
%.tmp3771 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3767, %m307$.Node.type* %.tmp3768, i8* %.tmp3770)
%.tmp3772 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3773 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3772, i32 0, i32 0
%.tmp3774 = load i8*, i8** %.tmp3773
%.tmp3775 = call i32(i8*,...) @printf(i8* %.tmp3771, i8* %.tmp3774)
br label %.if.end.3608
.if.end.3608:
br label %.if.end.3396
.if.end.3396:
br label %.if.end.3325
.if.end.3325:
br label %.if.end.3226
.if.end.3226:
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
%buf.3776 = alloca i8*
store i8* null, i8** %buf.3776
%.tmp3777 = getelementptr i8*, i8** %buf.3776, i32 0
%.tmp3779 = getelementptr [31 x i8], [31 x i8]*@.str3778, i32 0, i32 0
%.tmp3780 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3781 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3780, i32 0, i32 7
%.tmp3782 = load i8*, i8** %.tmp3781
%.tmp3783 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3784 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3783, i32 0, i32 3
%.tmp3785 = load i32, i32* %.tmp3784
%.tmp3786 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3787 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3786, i32 0, i32 4
%.tmp3788 = load i32, i32* %.tmp3787
%.tmp3789 = load i8*, i8** %msg
%.tmp3790 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3777, i8* %.tmp3779, i8* %.tmp3782, i32 %.tmp3785, i32 %.tmp3788, i8* %.tmp3789)
%.tmp3791 = load i8*, i8** %buf.3776
ret i8* %.tmp3791
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3792 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3792
%.tmp3794 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3795 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3794, %m307$.Node.type** %param_ptr.3795
br label %.for.start.3793
.for.start.3793:
%.tmp3796 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3797 = icmp ne %m307$.Node.type* %.tmp3796, null
br i1 %.tmp3797, label %.for.continue.3793, label %.for.end.3793
.for.continue.3793:
%.tmp3798 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3799 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3800 = icmp ne %m307$.Node.type* %.tmp3798, %.tmp3799
br i1 %.tmp3800, label %.if.true.3801, label %.if.false.3801
.if.true.3801:
%.tmp3802 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3803 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3802, i32 0, i32 7
%.tmp3804 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3803
store %m307$.Node.type* %.tmp3804, %m307$.Node.type** %param_ptr.3795
br label %.if.end.3801
.if.false.3801:
br label %.if.end.3801
.if.end.3801:
%.tmp3805 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3806 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3805)
%param_info.3807 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3806, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3808 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3809 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3808, i32 0, i32 3
%.tmp3811 = getelementptr [9 x i8], [9 x i8]*@.str3810, i32 0, i32 0
store i8* %.tmp3811, i8** %.tmp3809
%.tmp3812 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3813 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3812, i32 0, i32 0
%.tmp3814 = load i8*, i8** %.tmp3813
%.tmp3816 = getelementptr [5 x i8], [5 x i8]*@.str3815, i32 0, i32 0
%.tmp3817 = call i32(i8*,i8*) @strcmp(i8* %.tmp3814, i8* %.tmp3816)
%.tmp3818 = icmp eq i32 %.tmp3817, 0
br i1 %.tmp3818, label %.if.true.3819, label %.if.false.3819
.if.true.3819:
%.tmp3820 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3821 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3822 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3821, i32 0, i32 6
%.tmp3823 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3822
%.tmp3824 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3820, %m307$.Node.type* %.tmp3823)
store %m1861$.Type.type* %.tmp3824, %m1861$.Type.type** %param_type.3792
%.tmp3825 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3826 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3825, i32 0, i32 7
%.tmp3827 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3826
store %m307$.Node.type* %.tmp3827, %m307$.Node.type** %param_ptr.3795
br label %.if.end.3819
.if.false.3819:
br label %.if.end.3819
.if.end.3819:
%.tmp3828 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3829 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3828, i32 0, i32 4
%.tmp3830 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3792
store %m1861$.Type.type* %.tmp3830, %m1861$.Type.type** %.tmp3829
%.tmp3831 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3832 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3831, i32 0, i32 1
%.tmp3833 = load i8*, i8** %.tmp3832
%var_name.3834 = alloca i8*
store i8* %.tmp3833, i8** %var_name.3834
%.tmp3835 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3836 = load i8, i8* @SCOPE_LOCAL
%.tmp3837 = load i8*, i8** %var_name.3834
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3835, i8 %.tmp3836, i8* %.tmp3837)
%.tmp3838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3839 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3840 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3839, i32 0, i32 4
%.tmp3841 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3840
%.tmp3842 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3838, %m1861$.Type.type* %.tmp3841)
%param_info_tr.3843 = alloca i8*
store i8* %.tmp3842, i8** %param_info_tr.3843
%.tmp3844 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3845 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3844, i32 0, i32 1
%.tmp3846 = load %m0$.File.type*, %m0$.File.type** %.tmp3845
%.tmp3848 = getelementptr [16 x i8], [16 x i8]*@.str3847, i32 0, i32 0
%.tmp3849 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3850 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3849)
%.tmp3851 = load i8*, i8** %param_info_tr.3843
%.tmp3852 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3846, i8* %.tmp3848, i8* %.tmp3850, i8* %.tmp3851)
%.tmp3853 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3854 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3855 = load i8*, i8** %var_name.3834
%.tmp3856 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3853, %m307$.Node.type* %.tmp3854, i8* %.tmp3855, %m1861$.AssignableInfo.type* %.tmp3856)
%.tmp3857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3858 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3857, i32 0, i32 1
%.tmp3859 = load %m0$.File.type*, %m0$.File.type** %.tmp3858
%.tmp3861 = getelementptr [28 x i8], [28 x i8]*@.str3860, i32 0, i32 0
%.tmp3862 = load i8*, i8** %param_info_tr.3843
%.tmp3863 = load i8*, i8** %var_name.3834
%.tmp3864 = load i8*, i8** %param_info_tr.3843
%.tmp3865 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3807
%.tmp3866 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3865)
%.tmp3867 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3859, i8* %.tmp3861, i8* %.tmp3862, i8* %.tmp3863, i8* %.tmp3864, i8* %.tmp3866)
%.tmp3868 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3795
%.tmp3869 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3868, i32 0, i32 7
%.tmp3870 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3869
store %m307$.Node.type* %.tmp3870, %m307$.Node.type** %param_ptr.3795
br label %.for.start.3793
.for.end.3793:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3871 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3873 = getelementptr [6 x i8], [6 x i8]*@.str3872, i32 0, i32 0
%.tmp3874 = bitcast ptr null to i8*
%.tmp3875 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3871, i8* %.tmp3873, i8* %.tmp3874, i8* %.tmp3875)
%.tmp3876 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3877 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3876, i32 0, i32 6
%.tmp3878 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3877
%.tmp3880 = getelementptr [12 x i8], [12 x i8]*@.str3879, i32 0, i32 0
%.tmp3881 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3878, i8* %.tmp3880)
%exprs.3882 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3881, %m307$.Node.type** %exprs.3882
%.tmp3883 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3882
%.tmp3884 = icmp ne %m307$.Node.type* %.tmp3883, null
br i1 %.tmp3884, label %.if.true.3885, label %.if.false.3885
.if.true.3885:
%.tmp3887 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3882
%.tmp3888 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3887, i32 0, i32 6
%.tmp3889 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3888
%b.3890 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3889, %m307$.Node.type** %b.3890
br label %.for.start.3886
.for.start.3886:
%.tmp3891 = load %m307$.Node.type*, %m307$.Node.type** %b.3890
%.tmp3892 = icmp ne %m307$.Node.type* %.tmp3891, null
br i1 %.tmp3892, label %.for.continue.3886, label %.for.end.3886
.for.continue.3886:
%.tmp3893 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3894 = load %m307$.Node.type*, %m307$.Node.type** %b.3890
%.tmp3895 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3894, i32 0, i32 6
%.tmp3896 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3895
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3893, %m307$.Node.type* %.tmp3896)
%.tmp3897 = load %m307$.Node.type*, %m307$.Node.type** %b.3890
%.tmp3898 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3897, i32 0, i32 7
%.tmp3899 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3898
store %m307$.Node.type* %.tmp3899, %m307$.Node.type** %b.3890
br label %.for.start.3886
.for.end.3886:
br label %.if.end.3885
.if.false.3885:
br label %.if.end.3885
.if.end.3885:
%.tmp3900 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3900)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3901 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3902 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3903 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3901, %m307$.Node.type* %.tmp3902)
%val.3904 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3903, %m1861$.AssignableInfo.type** %val.3904
%.tmp3905 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3904
%.tmp3906 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3905, i32 0, i32 4
%.tmp3907 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3906
%.tmp3908 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3907, i32 0, i32 0
%.tmp3909 = load i8*, i8** %.tmp3908
%.tmp3911 = getelementptr [7 x i8], [7 x i8]*@.str3910, i32 0, i32 0
%.tmp3912 = call i32(i8*,i8*) @strcmp(i8* %.tmp3909, i8* %.tmp3911)
%.tmp3913 = icmp ne i32 %.tmp3912, 0
br i1 %.tmp3913, label %.if.true.3914, label %.if.false.3914
.if.true.3914:
%.tmp3916 = getelementptr [7 x i8], [7 x i8]*@.str3915, i32 0, i32 0
%.tmp3917 = call i32(i8*,...) @printf(i8* %.tmp3916)
%.tmp3918 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp3918
br label %.if.end.3914
.if.false.3914:
br label %.if.end.3914
.if.end.3914:
%.tmp3919 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3904
%.tmp3920 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3919, i32 0, i32 4
%.tmp3921 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3920
%.tmp3922 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3921, i32 0, i32 3
%.tmp3923 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3922
%node_type.3924 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3923, %m1861$.Type.type** %node_type.3924
%i.3926 = alloca i32
store i32 0, i32* %i.3926
br label %.for.start.3925
.for.start.3925:
%.tmp3927 = load i32, i32* %i.3926
%.tmp3928 = load i32, i32* %attr_id
%.tmp3929 = icmp slt i32 %.tmp3927, %.tmp3928
br i1 %.tmp3929, label %.for.continue.3925, label %.for.end.3925
.for.continue.3925:
%.tmp3930 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.3924
%.tmp3931 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3930, i32 0, i32 4
%.tmp3932 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3931
store %m1861$.Type.type* %.tmp3932, %m1861$.Type.type** %node_type.3924
%.tmp3933 = load i32, i32* %i.3926
%.tmp3934 = add i32 %.tmp3933, 1
store i32 %.tmp3934, i32* %i.3926
br label %.for.start.3925
.for.end.3925:
%.tmp3935 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3936 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3935)
%info.3937 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3936, %m1861$.AssignableInfo.type** %info.3937
%.tmp3938 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3937
%.tmp3939 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3938, i32 0, i32 4
%.tmp3940 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.3924
store %m1861$.Type.type* %.tmp3940, %m1861$.Type.type** %.tmp3939
%.tmp3941 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3942 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3941)
%tmp_id.3943 = alloca i32
store i32 %.tmp3942, i32* %tmp_id.3943
%.tmp3944 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3945 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3904
%.tmp3946 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3945, i32 0, i32 4
%.tmp3947 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3946
%.tmp3948 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3944, %m1861$.Type.type* %.tmp3947)
%type_as_str.3949 = alloca i8*
store i8* %.tmp3948, i8** %type_as_str.3949
%.tmp3950 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3951 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3937
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3950, %m1861$.AssignableInfo.type* %.tmp3951)
%.tmp3952 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3953 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3952, i32 0, i32 1
%.tmp3954 = load %m0$.File.type*, %m0$.File.type** %.tmp3953
%.tmp3956 = getelementptr [52 x i8], [52 x i8]*@.str3955, i32 0, i32 0
%.tmp3957 = load i32, i32* %tmp_id.3943
%.tmp3958 = load i8*, i8** %type_as_str.3949
%.tmp3959 = load i8*, i8** %type_as_str.3949
%.tmp3960 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3904
%.tmp3961 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3960)
%.tmp3962 = load i32, i32* %attr_id
%.tmp3963 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3954, i8* %.tmp3956, i32 %.tmp3957, i8* %.tmp3958, i8* %.tmp3959, i8* %.tmp3961, i32 %.tmp3962)
%.tmp3964 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3965 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3964, i32 0, i32 1
%.tmp3966 = load %m0$.File.type*, %m0$.File.type** %.tmp3965
%.tmp3968 = getelementptr [28 x i8], [28 x i8]*@.str3967, i32 0, i32 0
%.tmp3969 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3937
%.tmp3970 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3969)
%.tmp3971 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3972 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3937
%.tmp3973 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3972, i32 0, i32 4
%.tmp3974 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3973
%.tmp3975 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3971, %m1861$.Type.type* %.tmp3974)
%.tmp3976 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3977 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3937
%.tmp3978 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3977, i32 0, i32 4
%.tmp3979 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3978
%.tmp3980 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3976, %m1861$.Type.type* %.tmp3979)
%.tmp3981 = load i32, i32* %tmp_id.3943
%.tmp3982 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3966, i8* %.tmp3968, i8* %.tmp3970, i8* %.tmp3975, i8* %.tmp3980, i32 %.tmp3981)
%.tmp3983 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3937
ret %m1861$.AssignableInfo.type* %.tmp3983
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
%.tmp3984 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3985 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3986 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3984, %m307$.Node.type* %.tmp3985)
%val.3987 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3986, %m1861$.AssignableInfo.type** %val.3987
%.tmp3988 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3987
%.tmp3989 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3988, i32 0, i32 4
%.tmp3990 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3989
%.tmp3991 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3990, i32 0, i32 0
%.tmp3992 = load i8*, i8** %.tmp3991
%.tmp3994 = getelementptr [7 x i8], [7 x i8]*@.str3993, i32 0, i32 0
%.tmp3995 = call i32(i8*,i8*) @strcmp(i8* %.tmp3992, i8* %.tmp3994)
%.tmp3996 = icmp ne i32 %.tmp3995, 0
br i1 %.tmp3996, label %.if.true.3997, label %.if.false.3997
.if.true.3997:
%.tmp3999 = getelementptr [7 x i8], [7 x i8]*@.str3998, i32 0, i32 0
%.tmp4000 = call i32(i8*,...) @printf(i8* %.tmp3999)
ret void
br label %.if.end.3997
.if.false.3997:
br label %.if.end.3997
.if.end.3997:
%.tmp4001 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3987
%.tmp4002 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4001, i32 0, i32 4
%.tmp4003 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4002
%.tmp4004 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4003, i32 0, i32 3
%.tmp4005 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4004
%node_type.4006 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4005, %m1861$.Type.type** %node_type.4006
%i.4008 = alloca i32
store i32 0, i32* %i.4008
br label %.for.start.4007
.for.start.4007:
%.tmp4009 = load i32, i32* %i.4008
%.tmp4010 = load i32, i32* %attr_id
%.tmp4011 = icmp slt i32 %.tmp4009, %.tmp4010
br i1 %.tmp4011, label %.for.continue.4007, label %.for.end.4007
.for.continue.4007:
%.tmp4012 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4006
%.tmp4013 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4012, i32 0, i32 4
%.tmp4014 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4013
store %m1861$.Type.type* %.tmp4014, %m1861$.Type.type** %node_type.4006
%.tmp4015 = load i32, i32* %i.4008
%.tmp4016 = add i32 %.tmp4015, 1
store i32 %.tmp4016, i32* %i.4008
br label %.for.start.4007
.for.end.4007:
%.tmp4017 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4018 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4017)
%tmp_id.4019 = alloca i32
store i32 %.tmp4018, i32* %tmp_id.4019
%.tmp4020 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4021 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3987
%.tmp4022 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4021, i32 0, i32 4
%.tmp4023 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4022
%.tmp4024 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4020, %m1861$.Type.type* %.tmp4023)
%type_as_str.4025 = alloca i8*
store i8* %.tmp4024, i8** %type_as_str.4025
%.tmp4026 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4027 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4026, i32 0, i32 1
%.tmp4028 = load %m0$.File.type*, %m0$.File.type** %.tmp4027
%.tmp4030 = getelementptr [52 x i8], [52 x i8]*@.str4029, i32 0, i32 0
%.tmp4031 = load i32, i32* %tmp_id.4019
%.tmp4032 = load i8*, i8** %type_as_str.4025
%.tmp4033 = load i8*, i8** %type_as_str.4025
%.tmp4034 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3987
%.tmp4035 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4034)
%.tmp4036 = load i32, i32* %attr_id
%.tmp4037 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4028, i8* %.tmp4030, i32 %.tmp4031, i8* %.tmp4032, i8* %.tmp4033, i8* %.tmp4035, i32 %.tmp4036)
%.tmp4038 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4039 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4038, i32 0, i32 1
%.tmp4040 = load %m0$.File.type*, %m0$.File.type** %.tmp4039
%.tmp4042 = getelementptr [18 x i8], [18 x i8]*@.str4041, i32 0, i32 0
%.tmp4043 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4044 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4006
%.tmp4045 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4043, %m1861$.Type.type* %.tmp4044)
%.tmp4046 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4047 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4006
%.tmp4048 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4046, %m1861$.Type.type* %.tmp4047)
%.tmp4049 = load i8*, i8** %attr
%.tmp4050 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4040, i8* %.tmp4042, i8* %.tmp4045, i8* %.tmp4048, i8* %.tmp4049)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4051 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4052 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4051, i32 0, i32 6
%.tmp4053 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4052
%.tmp4054 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4053, i32 0, i32 6
%.tmp4055 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4054
%dotted.4056 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4055, %m307$.Node.type** %dotted.4056
%.tmp4057 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4056
%.tmp4058 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4057, i32 0, i32 7
%.tmp4059 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4058
%.tmp4060 = icmp ne %m307$.Node.type* %.tmp4059, null
br i1 %.tmp4060, label %.if.true.4061, label %.if.false.4061
.if.true.4061:
%.tmp4062 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4062
br label %.if.end.4061
.if.false.4061:
br label %.if.end.4061
.if.end.4061:
%.tmp4063 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4056
%.tmp4064 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4063, i32 0, i32 1
%.tmp4065 = load i8*, i8** %.tmp4064
%.tmp4067 = getelementptr [7 x i8], [7 x i8]*@.str4066, i32 0, i32 0
%.tmp4068 = call i32(i8*,i8*) @strcmp(i8* %.tmp4065, i8* %.tmp4067)
%.tmp4069 = icmp eq i32 %.tmp4068, 0
br i1 %.tmp4069, label %.if.true.4070, label %.if.false.4070
.if.true.4070:
%.tmp4071 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4073 = getelementptr [8 x i8], [8 x i8]*@.str4072, i32 0, i32 0
%.tmp4074 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4071, i8* %.tmp4073)
%args.4075 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4074, %m307$.Node.type** %args.4075
%.tmp4076 = load %m307$.Node.type*, %m307$.Node.type** %args.4075
%.tmp4077 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4076, i32 0, i32 6
%.tmp4078 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4077
%.tmp4080 = getelementptr [11 x i8], [11 x i8]*@.str4079, i32 0, i32 0
%.tmp4081 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4078, i8* %.tmp4080)
%value.4082 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4081, %m307$.Node.type** %value.4082
%.tmp4083 = load %m307$.Node.type*, %m307$.Node.type** %value.4082
%.tmp4084 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4083, i32 0, i32 6
%.tmp4085 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4084
%.tmp4086 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4085, i32 0, i32 6
%.tmp4087 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4086
%.tmp4088 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4087, i32 0, i32 6
%.tmp4089 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4088
%.tmp4090 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4089, i32 0, i32 6
%.tmp4091 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4090
store %m307$.Node.type* %.tmp4091, %m307$.Node.type** %value.4082
%.tmp4092 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4093 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4092)
%tmp_id.4094 = alloca i32
store i32 %.tmp4093, i32* %tmp_id.4094
%.tmp4095 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4096 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4095)
%info.4097 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4096, %m1861$.AssignableInfo.type** %info.4097
%.tmp4098 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4099 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4097
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4098, %m1861$.AssignableInfo.type* %.tmp4099)
%.tmp4100 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4097
%.tmp4101 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4100, i32 0, i32 4
%.tmp4102 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4102, %m1861$.Type.type** %.tmp4101
%.tmp4103 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4097
%.tmp4104 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4103, i32 0, i32 4
%.tmp4105 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4104
%.tmp4106 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4105, i32 0, i32 0
%.tmp4108 = getelementptr [4 x i8], [4 x i8]*@.str4107, i32 0, i32 0
store i8* %.tmp4108, i8** %.tmp4106
%.tmp4109 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4110 = load %m307$.Node.type*, %m307$.Node.type** %value.4082
%.tmp4111 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4109, %m307$.Node.type* %.tmp4110)
%inspected_type.4112 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4111, %m1861$.Type.type** %inspected_type.4112
%.tmp4113 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4114 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4112
%.tmp4115 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4113, %m1861$.Type.type* %.tmp4114)
%type_as_str.4116 = alloca i8*
store i8* %.tmp4115, i8** %type_as_str.4116
%.tmp4117 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4118 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4117, i32 0, i32 1
%.tmp4119 = load %m0$.File.type*, %m0$.File.type** %.tmp4118
%.tmp4121 = getelementptr [46 x i8], [46 x i8]*@.str4120, i32 0, i32 0
%.tmp4122 = load i32, i32* %tmp_id.4094
%.tmp4123 = load i8*, i8** %type_as_str.4116
%.tmp4124 = load i8*, i8** %type_as_str.4116
%.tmp4125 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4119, i8* %.tmp4121, i32 %.tmp4122, i8* %.tmp4123, i8* %.tmp4124)
%.tmp4126 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4127 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4126, i32 0, i32 1
%.tmp4128 = load %m0$.File.type*, %m0$.File.type** %.tmp4127
%.tmp4130 = getelementptr [35 x i8], [35 x i8]*@.str4129, i32 0, i32 0
%.tmp4131 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4097
%.tmp4132 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4131)
%.tmp4133 = load i8*, i8** %type_as_str.4116
%.tmp4134 = load i32, i32* %tmp_id.4094
%.tmp4135 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4128, i8* %.tmp4130, i8* %.tmp4132, i8* %.tmp4133, i32 %.tmp4134)
%.tmp4136 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4097
ret %m1861$.AssignableInfo.type* %.tmp4136
br label %.if.end.4070
.if.false.4070:
%.tmp4137 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4056
%.tmp4138 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4137, i32 0, i32 1
%.tmp4139 = load i8*, i8** %.tmp4138
%.tmp4141 = getelementptr [7 x i8], [7 x i8]*@.str4140, i32 0, i32 0
%.tmp4142 = call i32(i8*,i8*) @strcmp(i8* %.tmp4139, i8* %.tmp4141)
%.tmp4143 = icmp eq i32 %.tmp4142, 0
br i1 %.tmp4143, label %.if.true.4144, label %.if.false.4144
.if.true.4144:
%.tmp4145 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4147 = getelementptr [8 x i8], [8 x i8]*@.str4146, i32 0, i32 0
%.tmp4148 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4145, i8* %.tmp4147)
%args.4149 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4148, %m307$.Node.type** %args.4149
%.tmp4150 = load %m307$.Node.type*, %m307$.Node.type** %args.4149
%.tmp4151 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4150, i32 0, i32 6
%.tmp4152 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4151
%.tmp4154 = getelementptr [11 x i8], [11 x i8]*@.str4153, i32 0, i32 0
%.tmp4155 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4152, i8* %.tmp4154)
%array.4156 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4155, %m307$.Node.type** %array.4156
%.tmp4157 = load %m307$.Node.type*, %m307$.Node.type** %array.4156
%.tmp4158 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4157, i32 0, i32 7
%.tmp4159 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4158
%.tmp4161 = getelementptr [11 x i8], [11 x i8]*@.str4160, i32 0, i32 0
%.tmp4162 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4159, i8* %.tmp4161)
%value.4163 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4162, %m307$.Node.type** %value.4163
%.tmp4164 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4165 = load %m307$.Node.type*, %m307$.Node.type** %value.4163
%.tmp4166 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4164, %m307$.Node.type* %.tmp4165)
%value_info.4167 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4166, %m1861$.AssignableInfo.type** %value_info.4167
%.tmp4168 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4169 = load %m307$.Node.type*, %m307$.Node.type** %array.4156
%.tmp4170 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4168, %m307$.Node.type* %.tmp4169)
%array_info.4171 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4170, %m1861$.AssignableInfo.type** %array_info.4171
%.tmp4172 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4173 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4172)
%info.4174 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4173, %m1861$.AssignableInfo.type** %info.4174
%.tmp4175 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4176 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4174
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4175, %m1861$.AssignableInfo.type* %.tmp4176)
%.tmp4177 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4174
%.tmp4178 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4177, i32 0, i32 4
%.tmp4179 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4171
%.tmp4180 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4179, i32 0, i32 4
%.tmp4181 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4180
store %m1861$.Type.type* %.tmp4181, %m1861$.Type.type** %.tmp4178
%builtin_prefix.4182 = alloca i8*
store i8* null, i8** %builtin_prefix.4182
%.tmp4183 = getelementptr i8*, i8** %builtin_prefix.4182, i32 0
%.tmp4185 = getelementptr [5 x i8], [5 x i8]*@.str4184, i32 0, i32 0
%.tmp4186 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4187 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4186)
%.tmp4188 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4183, i8* %.tmp4185, i32 %.tmp4187)
%.tmp4189 = call i8*() @m2434$append_tmpl.cp()
%tmpl.4190 = alloca i8*
store i8* %.tmp4189, i8** %tmpl.4190
%.tmp4191 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4192 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4191, i32 0, i32 1
%.tmp4193 = load %m0$.File.type*, %m0$.File.type** %.tmp4192
%.tmp4194 = load i8*, i8** %tmpl.4190
%.tmp4195 = load i8*, i8** %builtin_prefix.4182
%.tmp4196 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4197 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4171
%.tmp4198 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4197, i32 0, i32 4
%.tmp4199 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4198
%.tmp4200 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4196, %m1861$.Type.type* %.tmp4199)
%.tmp4201 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4171
%.tmp4202 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4201)
%.tmp4203 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4204 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4167
%.tmp4205 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4204, i32 0, i32 4
%.tmp4206 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4205
%.tmp4207 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4203, %m1861$.Type.type* %.tmp4206)
%.tmp4208 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4167
%.tmp4209 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4208)
%.tmp4210 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4174
%.tmp4211 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4210)
%.tmp4212 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4193, i8* %.tmp4194, i8* %.tmp4195, i8* %.tmp4200, i8* %.tmp4202, i8* %.tmp4207, i8* %.tmp4209, i8* %.tmp4211)
%.tmp4213 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4214 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4213)
%info_g.4215 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4214, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4216 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4217 = load i8, i8* @SCOPE_GLOBAL
%.tmp4219 = getelementptr [8 x i8], [8 x i8]*@.str4218, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp4216, i8 %.tmp4217, i8* %.tmp4219)
%.tmp4220 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4221 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4220, i32 0, i32 4
%.tmp4222 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4222, %m1861$.Type.type** %.tmp4221
%.tmp4223 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4224 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4223, i32 0, i32 4
%.tmp4225 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4224
%.tmp4226 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4225, i32 0, i32 0
%.tmp4228 = getelementptr [9 x i8], [9 x i8]*@.str4227, i32 0, i32 0
store i8* %.tmp4228, i8** %.tmp4226
%.tmp4229 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4230 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4229, i32 0, i32 4
%.tmp4231 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4230
%.tmp4232 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4231, i32 0, i32 3
%.tmp4233 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4233, %m1861$.Type.type** %.tmp4232
%.tmp4234 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4235 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4234, i32 0, i32 4
%.tmp4236 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4235
%.tmp4237 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4236, i32 0, i32 3
%.tmp4238 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4237
%.tmp4239 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4238, i32 0, i32 0
%.tmp4241 = getelementptr [4 x i8], [4 x i8]*@.str4240, i32 0, i32 0
store i8* %.tmp4241, i8** %.tmp4239
%.tmp4242 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4243 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4242, i32 0, i32 4
%.tmp4244 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4243
%.tmp4245 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4244, i32 0, i32 3
%.tmp4246 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4245
%.tmp4247 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4246, i32 0, i32 3
%.tmp4248 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4248, %m1861$.Type.type** %.tmp4247
%.tmp4249 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4250 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4249, i32 0, i32 4
%.tmp4251 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4250
%.tmp4252 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4251, i32 0, i32 3
%.tmp4253 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4252
%.tmp4254 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4253, i32 0, i32 3
%.tmp4255 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4254
%.tmp4256 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4255, i32 0, i32 0
%.tmp4258 = getelementptr [4 x i8], [4 x i8]*@.str4257, i32 0, i32 0
store i8* %.tmp4258, i8** %.tmp4256
%.tmp4259 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4260 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4259, i32 0, i32 4
%.tmp4261 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4260
%.tmp4262 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4261, i32 0, i32 3
%.tmp4263 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4262
%.tmp4264 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4263, i32 0, i32 4
%.tmp4265 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4265, %m1861$.Type.type** %.tmp4264
%.tmp4266 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4267 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4266, i32 0, i32 4
%.tmp4268 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4267
%.tmp4269 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4268, i32 0, i32 3
%.tmp4270 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4269
%.tmp4271 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4270, i32 0, i32 4
%.tmp4272 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4271
%.tmp4273 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4272, i32 0, i32 0
%.tmp4275 = getelementptr [4 x i8], [4 x i8]*@.str4274, i32 0, i32 0
store i8* %.tmp4275, i8** %.tmp4273
%.tmp4276 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4277 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4276, i32 0, i32 4
%.tmp4278 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4277
%.tmp4279 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4278, i32 0, i32 3
%.tmp4280 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4279
%.tmp4281 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4280, i32 0, i32 4
%.tmp4282 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4281
%.tmp4283 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4282, i32 0, i32 3
%.tmp4284 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4284, %m1861$.Type.type** %.tmp4283
%.tmp4285 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4286 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4285, i32 0, i32 4
%.tmp4287 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4286
%.tmp4288 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4287, i32 0, i32 3
%.tmp4289 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4288
%.tmp4290 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4289, i32 0, i32 4
%.tmp4291 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4290
%.tmp4292 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4291, i32 0, i32 3
%.tmp4293 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4292
%.tmp4294 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4293, i32 0, i32 0
%.tmp4296 = getelementptr [4 x i8], [4 x i8]*@.str4295, i32 0, i32 0
store i8* %.tmp4296, i8** %.tmp4294
%.tmp4297 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4298 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4297, i32 0, i32 4
%.tmp4299 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4298
%.tmp4300 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4299, i32 0, i32 3
%.tmp4301 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4300
%.tmp4302 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4301, i32 0, i32 4
%.tmp4303 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4302
%.tmp4304 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4303, i32 0, i32 4
%.tmp4305 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4305, %m1861$.Type.type** %.tmp4304
%.tmp4306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
%.tmp4307 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4306, i32 0, i32 4
%.tmp4308 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4307
%.tmp4309 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4308, i32 0, i32 3
%.tmp4310 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4309
%.tmp4311 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4310, i32 0, i32 4
%.tmp4312 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4311
%.tmp4313 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4312, i32 0, i32 4
%.tmp4314 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4313
%.tmp4315 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4314, i32 0, i32 0
%.tmp4317 = getelementptr [4 x i8], [4 x i8]*@.str4316, i32 0, i32 0
store i8* %.tmp4317, i8** %.tmp4315
%.tmp4318 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4320 = getelementptr [8 x i8], [8 x i8]*@.str4319, i32 0, i32 0
%.tmp4322 = getelementptr [7 x i8], [7 x i8]*@.str4321, i32 0, i32 0
%.tmp4323 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4215
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp4318, i8* %.tmp4320, i8* %.tmp4322, %m1861$.AssignableInfo.type* %.tmp4323, i1 1, i1 0)
%.tmp4324 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4174
ret %m1861$.AssignableInfo.type* %.tmp4324
br label %.if.end.4144
.if.false.4144:
%.tmp4325 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4056
%.tmp4326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4325, i32 0, i32 1
%.tmp4327 = load i8*, i8** %.tmp4326
%.tmp4329 = getelementptr [4 x i8], [4 x i8]*@.str4328, i32 0, i32 0
%.tmp4330 = call i32(i8*,i8*) @strcmp(i8* %.tmp4327, i8* %.tmp4329)
%.tmp4331 = icmp eq i32 %.tmp4330, 0
br i1 %.tmp4331, label %.if.true.4332, label %.if.false.4332
.if.true.4332:
%.tmp4333 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4335 = getelementptr [8 x i8], [8 x i8]*@.str4334, i32 0, i32 0
%.tmp4336 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4333, i8* %.tmp4335)
%args.4337 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4336, %m307$.Node.type** %args.4337
%.tmp4338 = load %m307$.Node.type*, %m307$.Node.type** %args.4337
%.tmp4339 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4338, i32 0, i32 6
%.tmp4340 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4339
%.tmp4342 = getelementptr [11 x i8], [11 x i8]*@.str4341, i32 0, i32 0
%.tmp4343 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4340, i8* %.tmp4342)
%value.4344 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4343, %m307$.Node.type** %value.4344
%.tmp4345 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4346 = load %m307$.Node.type*, %m307$.Node.type** %value.4344
%.tmp4347 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i32) @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.tmp4345, %m307$.Node.type* %.tmp4346, i32 1)
ret %m1861$.AssignableInfo.type* %.tmp4347
br label %.if.end.4332
.if.false.4332:
br label %.if.end.4332
.if.end.4332:
br label %.if.end.4144
.if.end.4144:
br label %.if.end.4070
.if.end.4070:
%.tmp4348 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4348
}
define i8* @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4350 = getelementptr [1 x i8], [1 x i8]*@.str4349, i32 0, i32 0
%err_buf.4351 = alloca i8*
store i8* %.tmp4350, i8** %err_buf.4351
%.tmp4352 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4353 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4352, i32 0, i32 7
%.tmp4354 = load i8*, i8** %.tmp4353
%mod_abspath.4355 = alloca i8*
store i8* %.tmp4354, i8** %mod_abspath.4355
%.tmp4356 = load i8*, i8** %mod_abspath.4355
%.tmp4357 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4356)
%dirname.4358 = alloca i8*
store i8* %.tmp4357, i8** %dirname.4358
%.tmp4359 = load i8*, i8** %import_str
%.tmp4360 = getelementptr i8, i8* %.tmp4359, i32 0
%.tmp4361 = load i8, i8* %.tmp4360
%.tmp4362 = icmp eq i8 %.tmp4361, 47
br i1 %.tmp4362, label %.if.true.4363, label %.if.false.4363
.if.true.4363:
%.tmp4364 = getelementptr i8*, i8** %err_buf.4351, i32 0
%.tmp4366 = getelementptr [46 x i8], [46 x i8]*@.str4365, i32 0, i32 0
%.tmp4367 = load i8*, i8** %import_str
%.tmp4368 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4364, i8* %.tmp4366, i8* %.tmp4367)
%.tmp4369 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4370 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4371 = load i8*, i8** %err_buf.4351
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4369, %m307$.Node.type* %.tmp4370, i8* %.tmp4371)
%.tmp4372 = bitcast ptr null to i8*
ret i8* %.tmp4372
br label %.if.end.4363
.if.false.4363:
br label %.if.end.4363
.if.end.4363:
%.tmp4373 = load i8*, i8** %import_str
%.tmp4374 = getelementptr i8, i8* %.tmp4373, i32 0
%.tmp4375 = load i8, i8* %.tmp4374
%.tmp4376 = icmp ne i8 %.tmp4375, 46
%.tmp4377 = load i8*, i8** %import_str
%.tmp4378 = getelementptr i8, i8* %.tmp4377, i32 1
%.tmp4379 = load i8, i8* %.tmp4378
%.tmp4380 = icmp ne i8 %.tmp4379, 47
%.tmp4381 = and i1 %.tmp4376, %.tmp4380
br i1 %.tmp4381, label %.if.true.4382, label %.if.false.4382
.if.true.4382:
%.tmp4383 = call i8*() @m1861$get_root.cp()
%root.4384 = alloca i8*
store i8* %.tmp4383, i8** %root.4384
%.tmp4385 = getelementptr i8*, i8** %mod_abspath.4355, i32 0
%.tmp4387 = getelementptr [13 x i8], [13 x i8]*@.str4386, i32 0, i32 0
%.tmp4388 = load i8*, i8** %root.4384
%.tmp4389 = load i8*, i8** %import_str
%.tmp4390 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4385, i8* %.tmp4387, i8* %.tmp4388, i8* %.tmp4389)
br label %.if.end.4382
.if.false.4382:
%.tmp4391 = load i8*, i8** %dirname.4358
%.tmp4393 = getelementptr [1 x i8], [1 x i8]*@.str4392, i32 0, i32 0
%.tmp4394 = call i32(i8*,i8*) @strcmp(i8* %.tmp4391, i8* %.tmp4393)
%.tmp4395 = icmp eq i32 %.tmp4394, 0
br i1 %.tmp4395, label %.if.true.4396, label %.if.false.4396
.if.true.4396:
%.tmp4397 = getelementptr i8*, i8** %mod_abspath.4355, i32 0
%.tmp4399 = getelementptr [6 x i8], [6 x i8]*@.str4398, i32 0, i32 0
%.tmp4400 = load i8*, i8** %import_str
%.tmp4401 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4397, i8* %.tmp4399, i8* %.tmp4400)
br label %.if.end.4396
.if.false.4396:
%.tmp4402 = getelementptr i8*, i8** %mod_abspath.4355, i32 0
%.tmp4404 = getelementptr [9 x i8], [9 x i8]*@.str4403, i32 0, i32 0
%.tmp4405 = load i8*, i8** %dirname.4358
%.tmp4406 = load i8*, i8** %import_str
%.tmp4407 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4402, i8* %.tmp4404, i8* %.tmp4405, i8* %.tmp4406)
br label %.if.end.4396
.if.end.4396:
br label %.if.end.4382
.if.end.4382:
%.tmp4408 = load i8*, i8** %mod_abspath.4355
ret i8* %.tmp4408
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4409 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4410 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4411 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4409, %m307$.Node.type* %.tmp4410)
%info.4412 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4411, %m1861$.AssignableInfo.type** %info.4412
%.tmp4413 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4414 = icmp ne %m1861$.AssignableInfo.type* %.tmp4413, null
br i1 %.tmp4414, label %.if.true.4415, label %.if.false.4415
.if.true.4415:
%.tmp4416 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
ret %m1861$.AssignableInfo.type* %.tmp4416
br label %.if.end.4415
.if.false.4415:
br label %.if.end.4415
.if.end.4415:
%.tmp4417 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4418 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4419 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4417, %m307$.Node.type* %.tmp4418)
store %m1861$.AssignableInfo.type* %.tmp4419, %m1861$.AssignableInfo.type** %info.4412
%.tmp4420 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4421 = icmp eq %m1861$.AssignableInfo.type* %.tmp4420, null
br i1 %.tmp4421, label %.if.true.4422, label %.if.false.4422
.if.true.4422:
%.tmp4423 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4423, label %.if.true.4424, label %.if.false.4424
.if.true.4424:
%.tmp4425 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4426 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4428 = getelementptr [35 x i8], [35 x i8]*@.str4427, i32 0, i32 0
%.tmp4429 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4425, %m307$.Node.type* %.tmp4426, i8* %.tmp4428)
%.tmp4430 = call i32(i8*,...) @printf(i8* %.tmp4429)
br label %.if.end.4424
.if.false.4424:
br label %.if.end.4424
.if.end.4424:
%.tmp4431 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4431
br label %.if.end.4422
.if.false.4422:
br label %.if.end.4422
.if.end.4422:
%.tmp4432 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4434 = getelementptr [8 x i8], [8 x i8]*@.str4433, i32 0, i32 0
%.tmp4435 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4432, i8* %.tmp4434)
%args.4436 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4435, %m307$.Node.type** %args.4436
%.tmp4438 = getelementptr [1 x i8], [1 x i8]*@.str4437, i32 0, i32 0
%params_buff.4439 = alloca i8*
store i8* %.tmp4438, i8** %params_buff.4439
%tmp.4440 = alloca i8*
store i8* null, i8** %tmp.4440
%.tmp4441 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4442 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4441, i32 0, i32 4
%.tmp4443 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4442
%.tmp4444 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4443, i32 0, i32 0
%.tmp4445 = load i8*, i8** %.tmp4444
%.tmp4447 = getelementptr [4 x i8], [4 x i8]*@.str4446, i32 0, i32 0
%.tmp4448 = call i32(i8*,i8*) @strcmp(i8* %.tmp4445, i8* %.tmp4447)
%.tmp4449 = icmp eq i32 %.tmp4448, 0
br i1 %.tmp4449, label %.if.true.4450, label %.if.false.4450
.if.true.4450:
%.tmp4451 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4452 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4451)
%new_info.4453 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4452, %m1861$.AssignableInfo.type** %new_info.4453
%.tmp4454 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4455 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4453
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4454, %m1861$.AssignableInfo.type* %.tmp4455)
%.tmp4456 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4453
%.tmp4457 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4456, i32 0, i32 4
%.tmp4458 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4459 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4458, i32 0, i32 4
%.tmp4460 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4459
%.tmp4461 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4460, i32 0, i32 3
%.tmp4462 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4461
store %m1861$.Type.type* %.tmp4462, %m1861$.Type.type** %.tmp4457
%.tmp4463 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4464 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4463, i32 0, i32 1
%.tmp4465 = load %m0$.File.type*, %m0$.File.type** %.tmp4464
%.tmp4467 = getelementptr [22 x i8], [22 x i8]*@.str4466, i32 0, i32 0
%.tmp4468 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4453
%.tmp4469 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4468)
%.tmp4470 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4471 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4472 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4471, i32 0, i32 4
%.tmp4473 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4472
%.tmp4474 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4470, %m1861$.Type.type* %.tmp4473)
%.tmp4475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4476 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4477 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4476, i32 0, i32 4
%.tmp4478 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4477
%.tmp4479 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4475, %m1861$.Type.type* %.tmp4478)
%.tmp4480 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4481 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4480)
%.tmp4482 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4465, i8* %.tmp4467, i8* %.tmp4469, i8* %.tmp4474, i8* %.tmp4479, i8* %.tmp4481)
%.tmp4483 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4453
store %m1861$.AssignableInfo.type* %.tmp4483, %m1861$.AssignableInfo.type** %info.4412
br label %.if.end.4450
.if.false.4450:
br label %.if.end.4450
.if.end.4450:
%.tmp4484 = load %m307$.Node.type*, %m307$.Node.type** %args.4436
%.tmp4485 = icmp ne %m307$.Node.type* %.tmp4484, null
br i1 %.tmp4485, label %.if.true.4486, label %.if.false.4486
.if.true.4486:
%.tmp4487 = load %m307$.Node.type*, %m307$.Node.type** %args.4436
%.tmp4488 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4487, i32 0, i32 6
%.tmp4489 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4488
%.tmp4491 = getelementptr [11 x i8], [11 x i8]*@.str4490, i32 0, i32 0
%.tmp4492 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4489, i8* %.tmp4491)
%start.4493 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4492, %m307$.Node.type** %start.4493
%argno.4494 = alloca i32
store i32 1, i32* %argno.4494
%.tmp4495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4496 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4495, i32 0, i32 4
%.tmp4497 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4496
%.tmp4498 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4497, i32 0, i32 3
%.tmp4499 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4498
%.tmp4500 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4499, i32 0, i32 4
%.tmp4501 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4500
%expect_type.4502 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4501, %m1861$.Type.type** %expect_type.4502
%provided_args.4503 = alloca i32
store i32 0, i32* %provided_args.4503
%.tmp4505 = load %m307$.Node.type*, %m307$.Node.type** %start.4493
%pp.4506 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4505, %m307$.Node.type** %pp.4506
br label %.for.start.4504
.for.start.4504:
%.tmp4507 = load %m307$.Node.type*, %m307$.Node.type** %pp.4506
%.tmp4508 = icmp ne %m307$.Node.type* %.tmp4507, null
br i1 %.tmp4508, label %.for.continue.4504, label %.for.end.4504
.for.continue.4504:
%.tmp4509 = load i32, i32* %provided_args.4503
%.tmp4510 = add i32 %.tmp4509, 1
store i32 %.tmp4510, i32* %provided_args.4503
%.tmp4511 = load %m307$.Node.type*, %m307$.Node.type** %pp.4506
%.tmp4512 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4511, i32 0, i32 7
%.tmp4513 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4512
%.tmp4515 = getelementptr [11 x i8], [11 x i8]*@.str4514, i32 0, i32 0
%.tmp4516 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4513, i8* %.tmp4515)
store %m307$.Node.type* %.tmp4516, %m307$.Node.type** %pp.4506
br label %.for.start.4504
.for.end.4504:
%.tmp4518 = load %m307$.Node.type*, %m307$.Node.type** %start.4493
%pp.4519 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4518, %m307$.Node.type** %pp.4519
br label %.for.start.4517
.for.start.4517:
%.tmp4520 = load %m307$.Node.type*, %m307$.Node.type** %pp.4519
%.tmp4521 = icmp ne %m307$.Node.type* %.tmp4520, null
br i1 %.tmp4521, label %.for.continue.4517, label %.for.end.4517
.for.continue.4517:
%.tmp4522 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4523 = icmp eq %m1861$.Type.type* %.tmp4522, null
br i1 %.tmp4523, label %.if.true.4524, label %.if.false.4524
.if.true.4524:
%.tmp4525 = getelementptr i8*, i8** %tmp.4440, i32 0
%.tmp4527 = getelementptr [43 x i8], [43 x i8]*@.str4526, i32 0, i32 0
%.tmp4528 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4529 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4528, i32 0, i32 2
%.tmp4530 = load i8*, i8** %.tmp4529
%.tmp4531 = load i32, i32* %argno.4494
%.tmp4532 = sub i32 %.tmp4531, 1
%.tmp4533 = load i32, i32* %provided_args.4503
%.tmp4534 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4525, i8* %.tmp4527, i8* %.tmp4530, i32 %.tmp4532, i32 %.tmp4533)
%.tmp4535 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4536 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4537 = load i8*, i8** %tmp.4440
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4535, %m307$.Node.type* %.tmp4536, i8* %.tmp4537)
%.tmp4538 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4538
br label %.if.end.4524
.if.false.4524:
br label %.if.end.4524
.if.end.4524:
%.tmp4539 = load %m307$.Node.type*, %m307$.Node.type** %pp.4519
%.tmp4540 = load %m307$.Node.type*, %m307$.Node.type** %start.4493
%.tmp4541 = icmp ne %m307$.Node.type* %.tmp4539, %.tmp4540
br i1 %.tmp4541, label %.if.true.4542, label %.if.false.4542
.if.true.4542:
%.tmp4543 = getelementptr i8*, i8** %tmp.4440, i32 0
%.tmp4545 = getelementptr [5 x i8], [5 x i8]*@.str4544, i32 0, i32 0
%.tmp4546 = load i8*, i8** %params_buff.4439
%.tmp4547 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4543, i8* %.tmp4545, i8* %.tmp4546)
%.tmp4548 = load i8*, i8** %params_buff.4439
%tmp_buff.4549 = alloca i8*
store i8* %.tmp4548, i8** %tmp_buff.4549
%.tmp4550 = load i8*, i8** %tmp.4440
store i8* %.tmp4550, i8** %params_buff.4439
%.tmp4551 = load i8*, i8** %tmp_buff.4549
store i8* %.tmp4551, i8** %tmp.4440
%.tmp4552 = load i8*, i8** %tmp.4440
call void(i8*) @free(i8* %.tmp4552)
br label %.if.end.4542
.if.false.4542:
br label %.if.end.4542
.if.end.4542:
%.tmp4553 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4554 = load %m307$.Node.type*, %m307$.Node.type** %pp.4519
%.tmp4555 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4553, %m307$.Node.type* %.tmp4554)
%a_info.4556 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4555, %m1861$.AssignableInfo.type** %a_info.4556
%.tmp4557 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4556
%.tmp4558 = icmp eq %m1861$.AssignableInfo.type* %.tmp4557, null
br i1 %.tmp4558, label %.if.true.4559, label %.if.false.4559
.if.true.4559:
%.tmp4560 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4560
br label %.if.end.4559
.if.false.4559:
br label %.if.end.4559
.if.end.4559:
%.tmp4561 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4562 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4561)
%exp.4563 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4562, %m1861$.Type.type** %exp.4563
%.tmp4564 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4563
%.tmp4565 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4564, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4565
%.tmp4566 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4567 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4566, i32 0, i32 0
%.tmp4568 = load i8*, i8** %.tmp4567
%.tmp4570 = getelementptr [7 x i8], [7 x i8]*@.str4569, i32 0, i32 0
%.tmp4571 = call i32(i8*,i8*) @strcmp(i8* %.tmp4568, i8* %.tmp4570)
%.tmp4572 = icmp ne i32 %.tmp4571, 0
%.tmp4573 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4574 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4556
%.tmp4575 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4574, i32 0, i32 4
%.tmp4576 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4575
%.tmp4577 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4563
%.tmp4578 = call i1(%m1861$.CompilerCtx.type*,%m1861$.Type.type*,%m1861$.Type.type*) @m1861$is_same_type.b.m1861$.CompilerCtx.typep.m1861$.Type.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4573, %m1861$.Type.type* %.tmp4576, %m1861$.Type.type* %.tmp4577)
%.tmp4579 = icmp eq i1 %.tmp4578, 0
%.tmp4580 = and i1 %.tmp4572, %.tmp4579
br i1 %.tmp4580, label %.if.true.4581, label %.if.false.4581
.if.true.4581:
%.tmp4583 = getelementptr [1 x i8], [1 x i8]*@.str4582, i32 0, i32 0
%err_buf.4584 = alloca i8*
store i8* %.tmp4583, i8** %err_buf.4584
%.tmp4585 = getelementptr i8*, i8** %err_buf.4584, i32 0
%.tmp4587 = getelementptr [52 x i8], [52 x i8]*@.str4586, i32 0, i32 0
%.tmp4588 = load i32, i32* %argno.4494
%.tmp4589 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4590 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4563
%.tmp4591 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4589, %m1861$.Type.type* %.tmp4590)
%.tmp4592 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4593 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4556
%.tmp4594 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4593, i32 0, i32 4
%.tmp4595 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4594
%.tmp4596 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4592, %m1861$.Type.type* %.tmp4595)
%.tmp4597 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4585, i8* %.tmp4587, i32 %.tmp4588, i8* %.tmp4591, i8* %.tmp4596)
%.tmp4598 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4599 = load %m307$.Node.type*, %m307$.Node.type** %pp.4519
%.tmp4600 = load i8*, i8** %err_buf.4584
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4598, %m307$.Node.type* %.tmp4599, i8* %.tmp4600)
%.tmp4601 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4601
br label %.if.end.4581
.if.false.4581:
br label %.if.end.4581
.if.end.4581:
%.tmp4602 = getelementptr i8*, i8** %params_buff.4439, i32 0
%.tmp4604 = getelementptr [8 x i8], [8 x i8]*@.str4603, i32 0, i32 0
%.tmp4605 = load i8*, i8** %params_buff.4439
%.tmp4606 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4607 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4556
%.tmp4608 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4607, i32 0, i32 4
%.tmp4609 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4608
%.tmp4610 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4606, %m1861$.Type.type* %.tmp4609)
%.tmp4611 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4556
%.tmp4612 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4611)
%.tmp4613 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4602, i8* %.tmp4604, i8* %.tmp4605, i8* %.tmp4610, i8* %.tmp4612)
%.tmp4614 = load %m307$.Node.type*, %m307$.Node.type** %pp.4519
%.tmp4615 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4614, i32 0, i32 7
%.tmp4616 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4615
store %m307$.Node.type* %.tmp4616, %m307$.Node.type** %pp.4519
%.tmp4617 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4618 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4617, i32 0, i32 0
%.tmp4619 = load i8*, i8** %.tmp4618
%.tmp4621 = getelementptr [7 x i8], [7 x i8]*@.str4620, i32 0, i32 0
%.tmp4622 = call i32(i8*,i8*) @strcmp(i8* %.tmp4619, i8* %.tmp4621)
%.tmp4623 = icmp ne i32 %.tmp4622, 0
br i1 %.tmp4623, label %.if.true.4624, label %.if.false.4624
.if.true.4624:
%.tmp4625 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4626 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4625, i32 0, i32 4
%.tmp4627 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4626
store %m1861$.Type.type* %.tmp4627, %m1861$.Type.type** %expect_type.4502
br label %.if.end.4624
.if.false.4624:
br label %.if.end.4624
.if.end.4624:
%.tmp4628 = load i32, i32* %argno.4494
%.tmp4629 = add i32 %.tmp4628, 1
store i32 %.tmp4629, i32* %argno.4494
%.tmp4630 = load %m307$.Node.type*, %m307$.Node.type** %pp.4519
%.tmp4632 = getelementptr [11 x i8], [11 x i8]*@.str4631, i32 0, i32 0
%.tmp4633 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4630, i8* %.tmp4632)
store %m307$.Node.type* %.tmp4633, %m307$.Node.type** %pp.4519
br label %.for.start.4517
.for.end.4517:
%.tmp4634 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4635 = icmp ne %m1861$.Type.type* %.tmp4634, null
br i1 %.tmp4635, label %.if.true.4636, label %.if.false.4636
.if.true.4636:
%.tmp4637 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4502
%.tmp4638 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4637, i32 0, i32 0
%.tmp4639 = load i8*, i8** %.tmp4638
%.tmp4641 = getelementptr [7 x i8], [7 x i8]*@.str4640, i32 0, i32 0
%.tmp4642 = call i32(i8*,i8*) @strcmp(i8* %.tmp4639, i8* %.tmp4641)
%.tmp4643 = icmp ne i32 %.tmp4642, 0
br i1 %.tmp4643, label %.if.true.4644, label %.if.false.4644
.if.true.4644:
%.tmp4645 = getelementptr i8*, i8** %tmp.4440, i32 0
%.tmp4647 = getelementptr [43 x i8], [43 x i8]*@.str4646, i32 0, i32 0
%.tmp4648 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4649 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4648, i32 0, i32 2
%.tmp4650 = load i8*, i8** %.tmp4649
%.tmp4651 = load i32, i32* %argno.4494
%.tmp4652 = load i32, i32* %provided_args.4503
%.tmp4653 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4645, i8* %.tmp4647, i8* %.tmp4650, i32 %.tmp4651, i32 %.tmp4652)
%.tmp4654 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4655 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4656 = load i8*, i8** %tmp.4440
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4654, %m307$.Node.type* %.tmp4655, i8* %.tmp4656)
%.tmp4657 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4657
br label %.if.end.4644
.if.false.4644:
br label %.if.end.4644
.if.end.4644:
br label %.if.end.4636
.if.false.4636:
br label %.if.end.4636
.if.end.4636:
br label %.if.end.4486
.if.false.4486:
%.tmp4658 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4659 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4658, i32 0, i32 4
%.tmp4660 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4659
%.tmp4661 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4660, i32 0, i32 3
%.tmp4662 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4661
%.tmp4663 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4662, i32 0, i32 4
%.tmp4664 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4663
%.tmp4665 = icmp ne %m1861$.Type.type* %.tmp4664, null
br i1 %.tmp4665, label %.if.true.4666, label %.if.false.4666
.if.true.4666:
%args_required.4667 = alloca i32
store i32 0, i32* %args_required.4667
%.tmp4669 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4670 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4669, i32 0, i32 4
%.tmp4671 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4670
%.tmp4672 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4671, i32 0, i32 3
%.tmp4673 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4672
%.tmp4674 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4673, i32 0, i32 4
%.tmp4675 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4674
%pp.4676 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4675, %m1861$.Type.type** %pp.4676
br label %.for.start.4668
.for.start.4668:
%.tmp4677 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4676
%.tmp4678 = icmp ne %m1861$.Type.type* %.tmp4677, null
br i1 %.tmp4678, label %.for.continue.4668, label %.for.else.4668
.for.continue.4668:
%.tmp4679 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4676
%.tmp4680 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4679, i32 0, i32 0
%.tmp4681 = load i8*, i8** %.tmp4680
%.tmp4683 = getelementptr [7 x i8], [7 x i8]*@.str4682, i32 0, i32 0
%.tmp4684 = call i32(i8*,i8*) @strcmp(i8* %.tmp4681, i8* %.tmp4683)
%.tmp4685 = icmp eq i32 %.tmp4684, 0
br i1 %.tmp4685, label %.if.true.4686, label %.if.false.4686
.if.true.4686:
br label %.for.end.4668
br label %.if.end.4686
.if.false.4686:
br label %.if.end.4686
.if.end.4686:
%.tmp4687 = load i32, i32* %args_required.4667
%.tmp4688 = add i32 %.tmp4687, 1
store i32 %.tmp4688, i32* %args_required.4667
%.tmp4689 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4676
%.tmp4690 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4689, i32 0, i32 4
%.tmp4691 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4690
store %m1861$.Type.type* %.tmp4691, %m1861$.Type.type** %pp.4676
br label %.for.start.4668
.for.else.4668:
%.tmp4692 = getelementptr i8*, i8** %tmp.4440, i32 0
%.tmp4694 = getelementptr [42 x i8], [42 x i8]*@.str4693, i32 0, i32 0
%.tmp4695 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4696 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4695, i32 0, i32 2
%.tmp4697 = load i8*, i8** %.tmp4696
%.tmp4698 = load i32, i32* %args_required.4667
%.tmp4699 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4692, i8* %.tmp4694, i8* %.tmp4697, i32 %.tmp4698)
%.tmp4700 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4701 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4702 = load i8*, i8** %tmp.4440
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4700, %m307$.Node.type* %.tmp4701, i8* %.tmp4702)
%.tmp4703 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4703
br label %.for.end.4668
.for.end.4668:
br label %.if.end.4666
.if.false.4666:
br label %.if.end.4666
.if.end.4666:
br label %.if.end.4486
.if.end.4486:
%.tmp4704 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4705 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4706 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4705, i32 0, i32 4
%.tmp4707 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4706
%.tmp4708 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4707, i32 0, i32 3
%.tmp4709 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4708
%.tmp4710 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4704, %m1861$.Type.type* %.tmp4709)
%.tmp4712 = getelementptr [5 x i8], [5 x i8]*@.str4711, i32 0, i32 0
%.tmp4713 = call i32(i8*,i8*) @strcmp(i8* %.tmp4710, i8* %.tmp4712)
%.tmp4714 = icmp eq i32 %.tmp4713, 0
br i1 %.tmp4714, label %.if.true.4715, label %.if.false.4715
.if.true.4715:
%.tmp4716 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4717 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4716, i32 0, i32 1
%.tmp4718 = load %m0$.File.type*, %m0$.File.type** %.tmp4717
%.tmp4720 = getelementptr [16 x i8], [16 x i8]*@.str4719, i32 0, i32 0
%.tmp4721 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4722 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4723 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4722, i32 0, i32 4
%.tmp4724 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4723
%.tmp4725 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4721, %m1861$.Type.type* %.tmp4724)
%.tmp4726 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4727 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4726)
%.tmp4728 = load i8*, i8** %params_buff.4439
%.tmp4729 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4718, i8* %.tmp4720, i8* %.tmp4725, i8* %.tmp4727, i8* %.tmp4728)
%.tmp4730 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4730
br label %.if.end.4715
.if.false.4715:
br label %.if.end.4715
.if.end.4715:
%.tmp4731 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4732 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4731)
%call_info.4733 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4732, %m1861$.AssignableInfo.type** %call_info.4733
%.tmp4734 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4735 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4733
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4734, %m1861$.AssignableInfo.type* %.tmp4735)
%.tmp4736 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4733
%.tmp4737 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4736, i32 0, i32 4
%.tmp4738 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4739 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4738, i32 0, i32 4
%.tmp4740 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4739
%.tmp4741 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4740, i32 0, i32 3
%.tmp4742 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4741
%.tmp4743 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4742)
store %m1861$.Type.type* %.tmp4743, %m1861$.Type.type** %.tmp4737
%.tmp4744 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4733
%.tmp4745 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4744, i32 0, i32 4
%.tmp4746 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4745
%.tmp4747 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4746, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4747
%.tmp4748 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4749 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4748, i32 0, i32 1
%.tmp4750 = load %m0$.File.type*, %m0$.File.type** %.tmp4749
%.tmp4752 = getelementptr [21 x i8], [21 x i8]*@.str4751, i32 0, i32 0
%.tmp4753 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4733
%.tmp4754 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4753)
%.tmp4755 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4756 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4757 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4756, i32 0, i32 4
%.tmp4758 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4757
%.tmp4759 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4755, %m1861$.Type.type* %.tmp4758)
%.tmp4760 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4412
%.tmp4761 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4760)
%.tmp4762 = load i8*, i8** %params_buff.4439
%.tmp4763 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4750, i8* %.tmp4752, i8* %.tmp4754, i8* %.tmp4759, i8* %.tmp4761, i8* %.tmp4762)
%.tmp4764 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4733
%.tmp4765 = bitcast %m1861$.AssignableInfo.type* %.tmp4764 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4765
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4766 = alloca i8*
store i8* null, i8** %err_msg.4766
%.tmp4767 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4768 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4767, i32 0, i32 0
%.tmp4769 = load i8*, i8** %.tmp4768
%expr_type.4770 = alloca i8*
store i8* %.tmp4769, i8** %expr_type.4770
%.tmp4771 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4772 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4771, %m1861$.AssignableInfo.type** %info.4772
%assignable.4773 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4773
%.tmp4774 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4775 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4774, %m1861$.AssignableInfo.type** %a_info.4775
%.tmp4776 = load i8*, i8** %expr_type.4770
%.tmp4778 = getelementptr [7 x i8], [7 x i8]*@.str4777, i32 0, i32 0
%.tmp4779 = call i32(i8*,i8*) @strcmp(i8* %.tmp4776, i8* %.tmp4778)
%.tmp4780 = icmp eq i32 %.tmp4779, 0
br i1 %.tmp4780, label %.if.true.4781, label %.if.false.4781
.if.true.4781:
%.tmp4782 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4783 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4782, i32 0, i32 6
%.tmp4784 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4783
%.tmp4785 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4784, i32 0, i32 7
%.tmp4786 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4785
%.tmp4787 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4786, i32 0, i32 0
%.tmp4788 = load i8*, i8** %.tmp4787
%.tmp4790 = getelementptr [3 x i8], [3 x i8]*@.str4789, i32 0, i32 0
%.tmp4791 = call i32(i8*,i8*) @strcmp(i8* %.tmp4788, i8* %.tmp4790)
%.tmp4792 = icmp ne i32 %.tmp4791, 0
br i1 %.tmp4792, label %.if.true.4793, label %.if.false.4793
.if.true.4793:
%.tmp4794 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4795 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4796 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4795, i32 0, i32 6
%.tmp4797 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4796
%.tmp4798 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4797, i32 0, i32 7
%.tmp4799 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4798
%.tmp4800 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4794, %m307$.Node.type* %.tmp4799)
store %m1861$.AssignableInfo.type* %.tmp4800, %m1861$.AssignableInfo.type** %info.4772
%.tmp4801 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4772
%.tmp4802 = icmp eq %m1861$.AssignableInfo.type* %.tmp4801, null
br i1 %.tmp4802, label %.if.true.4803, label %.if.false.4803
.if.true.4803:
ret void
br label %.if.end.4803
.if.false.4803:
br label %.if.end.4803
.if.end.4803:
%.tmp4804 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4805 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4804, i32 0, i32 1
%.tmp4806 = load %m0$.File.type*, %m0$.File.type** %.tmp4805
%.tmp4808 = getelementptr [11 x i8], [11 x i8]*@.str4807, i32 0, i32 0
%.tmp4809 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4810 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4772
%.tmp4811 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4810, i32 0, i32 4
%.tmp4812 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4811
%.tmp4813 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4809, %m1861$.Type.type* %.tmp4812)
%.tmp4814 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4772
%.tmp4815 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4814)
%.tmp4816 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4806, i8* %.tmp4808, i8* %.tmp4813, i8* %.tmp4815)
br label %.if.end.4793
.if.false.4793:
%.tmp4817 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4818 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4817, i32 0, i32 1
%.tmp4819 = load %m0$.File.type*, %m0$.File.type** %.tmp4818
%.tmp4821 = getelementptr [10 x i8], [10 x i8]*@.str4820, i32 0, i32 0
%.tmp4822 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4819, i8* %.tmp4821)
br label %.if.end.4793
.if.end.4793:
br label %.if.end.4781
.if.false.4781:
%.tmp4823 = load i8*, i8** %expr_type.4770
%.tmp4825 = getelementptr [3 x i8], [3 x i8]*@.str4824, i32 0, i32 0
%.tmp4826 = call i32(i8*,i8*) @strcmp(i8* %.tmp4823, i8* %.tmp4825)
%.tmp4827 = icmp eq i32 %.tmp4826, 0
br i1 %.tmp4827, label %.if.true.4828, label %.if.false.4828
.if.true.4828:
br label %.if.end.4828
.if.false.4828:
%.tmp4829 = load i8*, i8** %expr_type.4770
%.tmp4831 = getelementptr [8 x i8], [8 x i8]*@.str4830, i32 0, i32 0
%.tmp4832 = call i32(i8*,i8*) @strcmp(i8* %.tmp4829, i8* %.tmp4831)
%.tmp4833 = icmp eq i32 %.tmp4832, 0
br i1 %.tmp4833, label %.if.true.4834, label %.if.false.4834
.if.true.4834:
%.tmp4835 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4836 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4837 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4836, i32 0, i32 6
%.tmp4838 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4837
%.tmp4839 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4835, %m307$.Node.type* %.tmp4838)
br label %.if.end.4834
.if.false.4834:
%.tmp4840 = load i8*, i8** %expr_type.4770
%.tmp4842 = getelementptr [12 x i8], [12 x i8]*@.str4841, i32 0, i32 0
%.tmp4843 = call i32(i8*,i8*) @strcmp(i8* %.tmp4840, i8* %.tmp4842)
%.tmp4844 = icmp eq i32 %.tmp4843, 0
br i1 %.tmp4844, label %.if.true.4845, label %.if.false.4845
.if.true.4845:
%.tmp4846 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4847 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4848 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4846, %m307$.Node.type* %.tmp4847)
br label %.if.end.4845
.if.false.4845:
%.tmp4849 = load i8*, i8** %expr_type.4770
%.tmp4851 = getelementptr [11 x i8], [11 x i8]*@.str4850, i32 0, i32 0
%.tmp4852 = call i32(i8*,i8*) @strcmp(i8* %.tmp4849, i8* %.tmp4851)
%.tmp4853 = icmp eq i32 %.tmp4852, 0
br i1 %.tmp4853, label %.if.true.4854, label %.if.false.4854
.if.true.4854:
%.tmp4855 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4856 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4855, i32 0, i32 6
%.tmp4857 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4856
%.tmp4859 = getelementptr [11 x i8], [11 x i8]*@.str4858, i32 0, i32 0
%.tmp4860 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4857, i8* %.tmp4859)
store %m307$.Node.type* %.tmp4860, %m307$.Node.type** %assignable.4773
%.tmp4861 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4862 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4863 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4862, i32 0, i32 6
%.tmp4864 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4863
%.tmp4865 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4861, %m307$.Node.type* %.tmp4864)
%dest.4866 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4865, %m1861$.AssignableInfo.type** %dest.4866
%.tmp4867 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4866
%.tmp4868 = icmp eq %m1861$.AssignableInfo.type* %.tmp4867, null
br i1 %.tmp4868, label %.if.true.4869, label %.if.false.4869
.if.true.4869:
ret void
br label %.if.end.4869
.if.false.4869:
br label %.if.end.4869
.if.end.4869:
%.tmp4870 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4871 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4773
%.tmp4872 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4870, %m307$.Node.type* %.tmp4871)
store %m1861$.AssignableInfo.type* %.tmp4872, %m1861$.AssignableInfo.type** %a_info.4775
%.tmp4873 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4775
%.tmp4874 = icmp eq %m1861$.AssignableInfo.type* %.tmp4873, null
br i1 %.tmp4874, label %.if.true.4875, label %.if.false.4875
.if.true.4875:
ret void
br label %.if.end.4875
.if.false.4875:
br label %.if.end.4875
.if.end.4875:
%.tmp4876 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4877 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4866
%.tmp4878 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4877, i32 0, i32 4
%.tmp4879 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4878
%.tmp4880 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4876, %m1861$.Type.type* %.tmp4879)
%dest_tr.4881 = alloca i8*
store i8* %.tmp4880, i8** %dest_tr.4881
%.tmp4882 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4883 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4775
%.tmp4884 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4883, i32 0, i32 4
%.tmp4885 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4884
%.tmp4886 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4882, %m1861$.Type.type* %.tmp4885)
%src_tr.4887 = alloca i8*
store i8* %.tmp4886, i8** %src_tr.4887
%.tmp4888 = load i8*, i8** %src_tr.4887
%.tmp4890 = getelementptr [4 x i8], [4 x i8]*@.str4889, i32 0, i32 0
%.tmp4891 = call i32(i8*,i8*) @strcmp(i8* %.tmp4888, i8* %.tmp4890)
%.tmp4892 = icmp eq i32 %.tmp4891, 0
br i1 %.tmp4892, label %.if.true.4893, label %.if.false.4893
.if.true.4893:
%.tmp4894 = load i8*, i8** %dest_tr.4881
store i8* %.tmp4894, i8** %src_tr.4887
br label %.if.end.4893
.if.false.4893:
br label %.if.end.4893
.if.end.4893:
%.tmp4895 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4896 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4895, i32 0, i32 1
%.tmp4897 = load %m0$.File.type*, %m0$.File.type** %.tmp4896
%.tmp4899 = getelementptr [21 x i8], [21 x i8]*@.str4898, i32 0, i32 0
%.tmp4900 = load i8*, i8** %src_tr.4887
%.tmp4901 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4775
%.tmp4902 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4901)
%.tmp4903 = load i8*, i8** %dest_tr.4881
%.tmp4904 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4866
%.tmp4905 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4904)
%.tmp4906 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4897, i8* %.tmp4899, i8* %.tmp4900, i8* %.tmp4902, i8* %.tmp4903, i8* %.tmp4905)
br label %.if.end.4854
.if.false.4854:
%.tmp4907 = load i8*, i8** %expr_type.4770
%.tmp4909 = getelementptr [9 x i8], [9 x i8]*@.str4908, i32 0, i32 0
%.tmp4910 = call i32(i8*,i8*) @strcmp(i8* %.tmp4907, i8* %.tmp4909)
%.tmp4911 = icmp eq i32 %.tmp4910, 0
br i1 %.tmp4911, label %.if.true.4912, label %.if.false.4912
.if.true.4912:
%.tmp4913 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4914 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4913, %m307$.Node.type* %.tmp4914)
br label %.if.end.4912
.if.false.4912:
%.tmp4915 = load i8*, i8** %expr_type.4770
%.tmp4917 = getelementptr [9 x i8], [9 x i8]*@.str4916, i32 0, i32 0
%.tmp4918 = call i32(i8*,i8*) @strcmp(i8* %.tmp4915, i8* %.tmp4917)
%.tmp4919 = icmp eq i32 %.tmp4918, 0
br i1 %.tmp4919, label %.if.true.4920, label %.if.false.4920
.if.true.4920:
%.tmp4921 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4922 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4921, %m307$.Node.type* %.tmp4922)
br label %.if.end.4920
.if.false.4920:
%.tmp4923 = load i8*, i8** %expr_type.4770
%.tmp4925 = getelementptr [8 x i8], [8 x i8]*@.str4924, i32 0, i32 0
%.tmp4926 = call i32(i8*,i8*) @strcmp(i8* %.tmp4923, i8* %.tmp4925)
%.tmp4927 = icmp eq i32 %.tmp4926, 0
br i1 %.tmp4927, label %.if.true.4928, label %.if.false.4928
.if.true.4928:
%.tmp4929 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4930 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4929)
%mod.4931 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4930, %m1861$.ModuleLookup.type** %mod.4931
%.tmp4932 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4931
%.tmp4933 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4932, i32 0, i32 3
%.tmp4934 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4933
%s.4935 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4934, %m1861$.Scope.type** %s.4935
%.tmp4936 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4937 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4936, i32 0, i32 6
%.tmp4938 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4937
%.tmp4939 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4938, i32 0, i32 1
%.tmp4940 = load i8*, i8** %.tmp4939
%.tmp4942 = getelementptr [6 x i8], [6 x i8]*@.str4941, i32 0, i32 0
%.tmp4943 = call i32(i8*,i8*) @strcmp(i8* %.tmp4940, i8* %.tmp4942)
%.tmp4944 = icmp eq i32 %.tmp4943, 0
br i1 %.tmp4944, label %.if.true.4945, label %.if.false.4945
.if.true.4945:
br label %.for.start.4946
.for.start.4946:
%.tmp4947 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp4948 = icmp ne %m1861$.Scope.type* %.tmp4947, null
br i1 %.tmp4948, label %.for.continue.4946, label %.for.else.4946
.for.continue.4946:
%.tmp4949 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp4950 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4949, i32 0, i32 2
%.tmp4951 = load i8*, i8** %.tmp4950
%.tmp4953 = getelementptr [4 x i8], [4 x i8]*@.str4952, i32 0, i32 0
%.tmp4954 = call i32(i8*,i8*) @strcmp(i8* %.tmp4951, i8* %.tmp4953)
%.tmp4955 = icmp eq i32 %.tmp4954, 0
br i1 %.tmp4955, label %.if.true.4956, label %.if.false.4956
.if.true.4956:
%.tmp4957 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4958 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4957, i32 0, i32 1
%.tmp4959 = load %m0$.File.type*, %m0$.File.type** %.tmp4958
%.tmp4961 = getelementptr [15 x i8], [15 x i8]*@.str4960, i32 0, i32 0
%.tmp4962 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp4963 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4962, i32 0, i32 4
%.tmp4964 = load i8*, i8** %.tmp4963
%.tmp4965 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4959, i8* %.tmp4961, i8* %.tmp4964)
br label %.for.end.4946
br label %.if.end.4956
.if.false.4956:
br label %.if.end.4956
.if.end.4956:
%.tmp4966 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp4967 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4966, i32 0, i32 5
%.tmp4968 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4967
store %m1861$.Scope.type* %.tmp4968, %m1861$.Scope.type** %s.4935
br label %.for.start.4946
.for.else.4946:
%.tmp4969 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4970 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4972 = getelementptr [48 x i8], [48 x i8]*@.str4971, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4969, %m307$.Node.type* %.tmp4970, i8* %.tmp4972)
br label %.for.end.4946
.for.end.4946:
br label %.if.end.4945
.if.false.4945:
%.tmp4973 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4974 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4973, i32 0, i32 6
%.tmp4975 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4974
%.tmp4976 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4975, i32 0, i32 1
%.tmp4977 = load i8*, i8** %.tmp4976
%.tmp4979 = getelementptr [9 x i8], [9 x i8]*@.str4978, i32 0, i32 0
%.tmp4980 = call i32(i8*,i8*) @strcmp(i8* %.tmp4977, i8* %.tmp4979)
%.tmp4981 = icmp eq i32 %.tmp4980, 0
br i1 %.tmp4981, label %.if.true.4982, label %.if.false.4982
.if.true.4982:
br label %.for.start.4983
.for.start.4983:
%.tmp4984 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp4985 = icmp ne %m1861$.Scope.type* %.tmp4984, null
br i1 %.tmp4985, label %.for.continue.4983, label %.for.else.4983
.for.continue.4983:
%.tmp4986 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp4987 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4986, i32 0, i32 2
%.tmp4988 = load i8*, i8** %.tmp4987
%.tmp4990 = getelementptr [4 x i8], [4 x i8]*@.str4989, i32 0, i32 0
%.tmp4991 = call i32(i8*,i8*) @strcmp(i8* %.tmp4988, i8* %.tmp4990)
%.tmp4992 = icmp eq i32 %.tmp4991, 0
br i1 %.tmp4992, label %.if.true.4993, label %.if.false.4993
.if.true.4993:
%.tmp4994 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4995 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4994, i32 0, i32 1
%.tmp4996 = load %m0$.File.type*, %m0$.File.type** %.tmp4995
%.tmp4998 = getelementptr [15 x i8], [15 x i8]*@.str4997, i32 0, i32 0
%.tmp4999 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp5000 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4999, i32 0, i32 3
%.tmp5001 = load i8*, i8** %.tmp5000
%.tmp5002 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4996, i8* %.tmp4998, i8* %.tmp5001)
br label %.for.end.4983
br label %.if.end.4993
.if.false.4993:
br label %.if.end.4993
.if.end.4993:
%.tmp5003 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4935
%.tmp5004 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5003, i32 0, i32 5
%.tmp5005 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5004
store %m1861$.Scope.type* %.tmp5005, %m1861$.Scope.type** %s.4935
br label %.for.start.4983
.for.else.4983:
%.tmp5006 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5007 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5009 = getelementptr [51 x i8], [51 x i8]*@.str5008, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5006, %m307$.Node.type* %.tmp5007, i8* %.tmp5009)
br label %.for.end.4983
.for.end.4983:
br label %.if.end.4982
.if.false.4982:
%.tmp5010 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5011 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5013 = getelementptr [40 x i8], [40 x i8]*@.str5012, i32 0, i32 0
%.tmp5014 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5010, %m307$.Node.type* %.tmp5011, i8* %.tmp5013)
%.tmp5015 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5016 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5015, i32 0, i32 6
%.tmp5017 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5016
%.tmp5018 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5017, i32 0, i32 1
%.tmp5019 = load i8*, i8** %.tmp5018
%.tmp5020 = call i32(i8*,...) @printf(i8* %.tmp5014, i8* %.tmp5019)
br label %.if.end.4982
.if.end.4982:
br label %.if.end.4945
.if.end.4945:
br label %.if.end.4928
.if.false.4928:
%.tmp5021 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5022 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5024 = getelementptr [34 x i8], [34 x i8]*@.str5023, i32 0, i32 0
%.tmp5025 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5021, %m307$.Node.type* %.tmp5022, i8* %.tmp5024)
%.tmp5026 = load i8*, i8** %expr_type.4770
%.tmp5027 = call i32(i8*,...) @printf(i8* %.tmp5025, i8* %.tmp5026)
br label %.if.end.4928
.if.end.4928:
br label %.if.end.4920
.if.end.4920:
br label %.if.end.4912
.if.end.4912:
br label %.if.end.4854
.if.end.4854:
br label %.if.end.4845
.if.end.4845:
br label %.if.end.4834
.if.end.4834:
br label %.if.end.4828
.if.end.4828:
br label %.if.end.4781
.if.end.4781:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5028 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5029 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5028)
%for_id.5030 = alloca i32
store i32 %.tmp5029, i32* %for_id.5030
%.tmp5031 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5032 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5031, i32 0, i32 6
%.tmp5033 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5032
%.tmp5034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5033, i32 0, i32 7
%.tmp5035 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5034
%init_stmt.5036 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5035, %m307$.Node.type** %init_stmt.5036
%.tmp5037 = bitcast ptr null to i8*
%begin_lbl.5038 = alloca i8*
store i8* %.tmp5037, i8** %begin_lbl.5038
%.tmp5039 = bitcast ptr null to i8*
%end_lbl.5040 = alloca i8*
store i8* %.tmp5039, i8** %end_lbl.5040
%.tmp5041 = getelementptr i8*, i8** %begin_lbl.5038, i32 0
%.tmp5043 = getelementptr [14 x i8], [14 x i8]*@.str5042, i32 0, i32 0
%.tmp5044 = load i32, i32* %for_id.5030
%.tmp5045 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5041, i8* %.tmp5043, i32 %.tmp5044)
%.tmp5046 = getelementptr i8*, i8** %end_lbl.5040, i32 0
%.tmp5048 = getelementptr [12 x i8], [12 x i8]*@.str5047, i32 0, i32 0
%.tmp5049 = load i32, i32* %for_id.5030
%.tmp5050 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5046, i8* %.tmp5048, i32 %.tmp5049)
%.tmp5051 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5053 = getelementptr [4 x i8], [4 x i8]*@.str5052, i32 0, i32 0
%.tmp5054 = load i8*, i8** %begin_lbl.5038
%.tmp5055 = load i8*, i8** %end_lbl.5040
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp5051, i8* %.tmp5053, i8* %.tmp5054, i8* %.tmp5055)
%.tmp5056 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
%.tmp5057 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5056, i32 0, i32 0
%.tmp5058 = load i8*, i8** %.tmp5057
%.tmp5060 = getelementptr [12 x i8], [12 x i8]*@.str5059, i32 0, i32 0
%.tmp5061 = call i32(i8*,i8*) @strcmp(i8* %.tmp5058, i8* %.tmp5060)
%.tmp5062 = icmp eq i32 %.tmp5061, 0
br i1 %.tmp5062, label %.if.true.5063, label %.if.false.5063
.if.true.5063:
%.tmp5064 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5065 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
%.tmp5066 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5064, %m307$.Node.type* %.tmp5065)
br label %.if.end.5063
.if.false.5063:
%.tmp5067 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
%.tmp5068 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5067, i32 0, i32 0
%.tmp5069 = load i8*, i8** %.tmp5068
%.tmp5071 = getelementptr [11 x i8], [11 x i8]*@.str5070, i32 0, i32 0
%.tmp5072 = call i32(i8*,i8*) @strcmp(i8* %.tmp5069, i8* %.tmp5071)
%.tmp5073 = icmp eq i32 %.tmp5072, 0
br i1 %.tmp5073, label %.if.true.5074, label %.if.false.5074
.if.true.5074:
%.tmp5075 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5076 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5075, %m307$.Node.type* %.tmp5076)
br label %.if.end.5074
.if.false.5074:
%.tmp5077 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
%.tmp5078 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5077, i32 0, i32 0
%.tmp5079 = load i8*, i8** %.tmp5078
%.tmp5081 = getelementptr [9 x i8], [9 x i8]*@.str5080, i32 0, i32 0
%.tmp5082 = call i32(i8*,i8*) @strcmp(i8* %.tmp5079, i8* %.tmp5081)
%.tmp5083 = icmp eq i32 %.tmp5082, 0
br i1 %.tmp5083, label %.if.true.5084, label %.if.false.5084
.if.true.5084:
br label %.if.end.5084
.if.false.5084:
%.tmp5085 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5086 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
%.tmp5088 = getelementptr [66 x i8], [66 x i8]*@.str5087, i32 0, i32 0
%.tmp5089 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5085, %m307$.Node.type* %.tmp5086, i8* %.tmp5088)
%.tmp5090 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5036
%.tmp5091 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5090, i32 0, i32 0
%.tmp5092 = load i8*, i8** %.tmp5091
%.tmp5093 = call i32(i8*,...) @printf(i8* %.tmp5089, i8* %.tmp5092)
%.tmp5094 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5094)
ret void
br label %.if.end.5084
.if.end.5084:
br label %.if.end.5074
.if.end.5074:
br label %.if.end.5063
.if.end.5063:
%.tmp5095 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5096 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5095, i32 0, i32 1
%.tmp5097 = load %m0$.File.type*, %m0$.File.type** %.tmp5096
%.tmp5099 = getelementptr [26 x i8], [26 x i8]*@.str5098, i32 0, i32 0
%.tmp5100 = load i32, i32* %for_id.5030
%.tmp5101 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5097, i8* %.tmp5099, i32 %.tmp5100)
%.tmp5102 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5103 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5102, i32 0, i32 1
%.tmp5104 = load %m0$.File.type*, %m0$.File.type** %.tmp5103
%.tmp5106 = getelementptr [16 x i8], [16 x i8]*@.str5105, i32 0, i32 0
%.tmp5107 = load i32, i32* %for_id.5030
%.tmp5108 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5104, i8* %.tmp5106, i32 %.tmp5107)
%.tmp5109 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5110 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5109, i32 0, i32 6
%.tmp5111 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5110
%.tmp5113 = getelementptr [9 x i8], [9 x i8]*@.str5112, i32 0, i32 0
%.tmp5114 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5111, i8* %.tmp5113)
%fst_colon.5115 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5114, %m307$.Node.type** %fst_colon.5115
%.tmp5116 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.5115
%.tmp5117 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5116, i32 0, i32 7
%.tmp5118 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5117
%condition.5119 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5118, %m307$.Node.type** %condition.5119
%.tmp5120 = load %m307$.Node.type*, %m307$.Node.type** %condition.5119
%.tmp5121 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5120, i32 0, i32 0
%.tmp5122 = load i8*, i8** %.tmp5121
%.tmp5124 = getelementptr [9 x i8], [9 x i8]*@.str5123, i32 0, i32 0
%.tmp5125 = call i32(i8*,i8*) @strcmp(i8* %.tmp5122, i8* %.tmp5124)
%.tmp5126 = icmp eq i32 %.tmp5125, 0
br i1 %.tmp5126, label %.if.true.5127, label %.if.false.5127
.if.true.5127:
%.tmp5128 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5129 = load %m307$.Node.type*, %m307$.Node.type** %condition.5119
%.tmp5131 = getelementptr [39 x i8], [39 x i8]*@.str5130, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5128, %m307$.Node.type* %.tmp5129, i8* %.tmp5131)
ret void
br label %.if.end.5127
.if.false.5127:
br label %.if.end.5127
.if.end.5127:
%.tmp5132 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5133 = load %m307$.Node.type*, %m307$.Node.type** %condition.5119
%.tmp5134 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5132, %m307$.Node.type* %.tmp5133)
%condition_info.5135 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5134, %m1861$.AssignableInfo.type** %condition_info.5135
%.tmp5136 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.5115
%.tmp5137 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5136, i32 0, i32 7
%.tmp5138 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5137
%.tmp5140 = getelementptr [9 x i8], [9 x i8]*@.str5139, i32 0, i32 0
%.tmp5141 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5138, i8* %.tmp5140)
%snd_colon.5142 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5141, %m307$.Node.type** %snd_colon.5142
%.tmp5143 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5142
%.tmp5145 = getelementptr [6 x i8], [6 x i8]*@.str5144, i32 0, i32 0
%.tmp5146 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5143, i8* %.tmp5145)
%for_body.5147 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5146, %m307$.Node.type** %for_body.5147
%.tmp5148 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5147
%.tmp5150 = getelementptr [11 x i8], [11 x i8]*@.str5149, i32 0, i32 0
%.tmp5151 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5148, i8* %.tmp5150)
%else_block.5152 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5151, %m307$.Node.type** %else_block.5152
%.tmp5153 = load i8*, i8** %end_lbl.5040
%on_end.5154 = alloca i8*
store i8* %.tmp5153, i8** %on_end.5154
%.tmp5155 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5152
%.tmp5156 = icmp ne %m307$.Node.type* %.tmp5155, null
br i1 %.tmp5156, label %.if.true.5157, label %.if.false.5157
.if.true.5157:
%.tmp5158 = getelementptr i8*, i8** %on_end.5154, i32 0
%.tmp5160 = getelementptr [13 x i8], [13 x i8]*@.str5159, i32 0, i32 0
%.tmp5161 = load i32, i32* %for_id.5030
%.tmp5162 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5158, i8* %.tmp5160, i32 %.tmp5161)
br label %.if.end.5157
.if.false.5157:
br label %.if.end.5157
.if.end.5157:
%.tmp5163 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5164 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5163, i32 0, i32 1
%.tmp5165 = load %m0$.File.type*, %m0$.File.type** %.tmp5164
%.tmp5167 = getelementptr [48 x i8], [48 x i8]*@.str5166, i32 0, i32 0
%.tmp5168 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5169 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5135
%.tmp5170 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5169, i32 0, i32 4
%.tmp5171 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5170
%.tmp5172 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5168, %m1861$.Type.type* %.tmp5171)
%.tmp5173 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5135
%.tmp5174 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5173)
%.tmp5175 = load i32, i32* %for_id.5030
%.tmp5176 = load i8*, i8** %on_end.5154
%.tmp5177 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5165, i8* %.tmp5167, i8* %.tmp5172, i8* %.tmp5174, i32 %.tmp5175, i8* %.tmp5176)
%.tmp5178 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5179 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5178, i32 0, i32 1
%.tmp5180 = load %m0$.File.type*, %m0$.File.type** %.tmp5179
%.tmp5182 = getelementptr [19 x i8], [19 x i8]*@.str5181, i32 0, i32 0
%.tmp5183 = load i32, i32* %for_id.5030
%.tmp5184 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5180, i8* %.tmp5182, i32 %.tmp5183)
%.tmp5185 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5142
%.tmp5186 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5185, i32 0, i32 7
%.tmp5187 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5186
%increment.5188 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5187, %m307$.Node.type** %increment.5188
%.tmp5189 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5190 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5147
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5189, %m307$.Node.type* %.tmp5190)
%.tmp5191 = load %m307$.Node.type*, %m307$.Node.type** %increment.5188
%.tmp5192 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5147
%.tmp5193 = icmp ne %m307$.Node.type* %.tmp5191, %.tmp5192
br i1 %.tmp5193, label %.if.true.5194, label %.if.false.5194
.if.true.5194:
%.tmp5195 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5196 = load %m307$.Node.type*, %m307$.Node.type** %increment.5188
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5195, %m307$.Node.type* %.tmp5196)
br label %.if.end.5194
.if.false.5194:
br label %.if.end.5194
.if.end.5194:
%.tmp5197 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5198 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5197, i32 0, i32 1
%.tmp5199 = load %m0$.File.type*, %m0$.File.type** %.tmp5198
%.tmp5201 = getelementptr [15 x i8], [15 x i8]*@.str5200, i32 0, i32 0
%.tmp5202 = load i8*, i8** %begin_lbl.5038
%.tmp5203 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5199, i8* %.tmp5201, i8* %.tmp5202)
%.tmp5204 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5152
%.tmp5205 = icmp ne %m307$.Node.type* %.tmp5204, null
br i1 %.tmp5205, label %.if.true.5206, label %.if.false.5206
.if.true.5206:
%.tmp5207 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5208 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5207, i32 0, i32 1
%.tmp5209 = load %m0$.File.type*, %m0$.File.type** %.tmp5208
%.tmp5211 = getelementptr [15 x i8], [15 x i8]*@.str5210, i32 0, i32 0
%.tmp5212 = load i32, i32* %for_id.5030
%.tmp5213 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5209, i8* %.tmp5211, i32 %.tmp5212)
%.tmp5214 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5152
%.tmp5215 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5214, i32 0, i32 6
%.tmp5216 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5215
%.tmp5218 = getelementptr [6 x i8], [6 x i8]*@.str5217, i32 0, i32 0
%.tmp5219 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5216, i8* %.tmp5218)
%block.5220 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5219, %m307$.Node.type** %block.5220
%.tmp5221 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5222 = load %m307$.Node.type*, %m307$.Node.type** %block.5220
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5221, %m307$.Node.type* %.tmp5222)
%.tmp5223 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5224 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5223, i32 0, i32 1
%.tmp5225 = load %m0$.File.type*, %m0$.File.type** %.tmp5224
%.tmp5227 = getelementptr [15 x i8], [15 x i8]*@.str5226, i32 0, i32 0
%.tmp5228 = load i8*, i8** %end_lbl.5040
%.tmp5229 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5225, i8* %.tmp5227, i8* %.tmp5228)
br label %.if.end.5206
.if.false.5206:
br label %.if.end.5206
.if.end.5206:
%.tmp5230 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5231 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5230, i32 0, i32 1
%.tmp5232 = load %m0$.File.type*, %m0$.File.type** %.tmp5231
%.tmp5234 = getelementptr [5 x i8], [5 x i8]*@.str5233, i32 0, i32 0
%.tmp5235 = load i8*, i8** %end_lbl.5040
%.tmp5236 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5232, i8* %.tmp5234, i8* %.tmp5235)
%.tmp5237 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5237)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5238 = bitcast ptr null to %m1861$.Type.type*
%decl_type.5239 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5238, %m1861$.Type.type** %decl_type.5239
%.tmp5240 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.5241 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5240, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5242 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5243 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5242, i32 0, i32 6
%.tmp5244 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5243
%.tmp5245 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5244, i32 0, i32 0
%.tmp5246 = load i8*, i8** %.tmp5245
%.tmp5248 = getelementptr [5 x i8], [5 x i8]*@.str5247, i32 0, i32 0
%.tmp5249 = call i32(i8*,i8*) @strcmp(i8* %.tmp5246, i8* %.tmp5248)
%.tmp5250 = icmp eq i32 %.tmp5249, 0
br i1 %.tmp5250, label %.if.true.5251, label %.if.false.5251
.if.true.5251:
%.tmp5252 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5253 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5254 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5253, i32 0, i32 6
%.tmp5255 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5254
%.tmp5256 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5255, i32 0, i32 6
%.tmp5257 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5256
%.tmp5258 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5252, %m307$.Node.type* %.tmp5257)
store %m1861$.Type.type* %.tmp5258, %m1861$.Type.type** %decl_type.5239
br label %.if.end.5251
.if.false.5251:
br label %.if.end.5251
.if.end.5251:
%.tmp5259 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5260 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5259, i32 0, i32 6
%.tmp5261 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5260
%.tmp5263 = getelementptr [11 x i8], [11 x i8]*@.str5262, i32 0, i32 0
%.tmp5264 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5261, i8* %.tmp5263)
%assignable.5265 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5264, %m307$.Node.type** %assignable.5265
%.tmp5266 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5265
%.tmp5267 = icmp ne %m307$.Node.type* %.tmp5266, null
br i1 %.tmp5267, label %.if.true.5268, label %.if.false.5268
.if.true.5268:
%.tmp5269 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5270 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5265
%.tmp5271 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5269, %m307$.Node.type* %.tmp5270)
store %m1861$.AssignableInfo.type* %.tmp5271, %m1861$.AssignableInfo.type** %a_info.5241
br label %.if.end.5268
.if.false.5268:
br label %.if.end.5268
.if.end.5268:
%.tmp5272 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5273 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5272)
%info.5274 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5273, %m1861$.AssignableInfo.type** %info.5274
%.tmp5275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5276 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5275, i32 0, i32 3
%.tmp5278 = getelementptr [9 x i8], [9 x i8]*@.str5277, i32 0, i32 0
store i8* %.tmp5278, i8** %.tmp5276
%.tmp5279 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5280 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5279, i32 0, i32 6
%.tmp5281 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5280
%.tmp5283 = getelementptr [5 x i8], [5 x i8]*@.str5282, i32 0, i32 0
%.tmp5284 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5281, i8* %.tmp5283)
%var_name.5285 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5284, %m307$.Node.type** %var_name.5285
%.tmp5286 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5285
%.tmp5287 = icmp eq %m307$.Node.type* %.tmp5286, null
br i1 %.tmp5287, label %.if.true.5288, label %.if.false.5288
.if.true.5288:
%.tmp5289 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5290 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5292 = getelementptr [31 x i8], [31 x i8]*@.str5291, i32 0, i32 0
%.tmp5293 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5289, %m307$.Node.type* %.tmp5290, i8* %.tmp5292)
%.tmp5294 = call i32(i8*,...) @printf(i8* %.tmp5293)
%.tmp5295 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5295
br label %.if.end.5288
.if.false.5288:
br label %.if.end.5288
.if.end.5288:
%.tmp5296 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5297 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5296)
%mod.5298 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5297, %m1861$.ModuleLookup.type** %mod.5298
%.tmp5299 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5300 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5298
%.tmp5301 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5300, i32 0, i32 3
%.tmp5302 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5301
%.tmp5303 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5285
%.tmp5304 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5303, i32 0, i32 1
%.tmp5305 = load i8*, i8** %.tmp5304
%.tmp5306 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5299, %m1861$.Scope.type* %.tmp5302, i8* %.tmp5305)
%.tmp5307 = icmp ne %m1861$.ScopeItem.type* %.tmp5306, null
br i1 %.tmp5307, label %.if.true.5308, label %.if.false.5308
.if.true.5308:
%err_buf.5309 = alloca i8*
store i8* null, i8** %err_buf.5309
%.tmp5310 = getelementptr i8*, i8** %err_buf.5309, i32 0
%.tmp5312 = getelementptr [43 x i8], [43 x i8]*@.str5311, i32 0, i32 0
%.tmp5313 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5285
%.tmp5314 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5313, i32 0, i32 1
%.tmp5315 = load i8*, i8** %.tmp5314
%.tmp5316 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5310, i8* %.tmp5312, i8* %.tmp5315)
%.tmp5317 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5318 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5319 = load i8*, i8** %err_buf.5309
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5317, %m307$.Node.type* %.tmp5318, i8* %.tmp5319)
%.tmp5320 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5320
br label %.if.end.5308
.if.false.5308:
br label %.if.end.5308
.if.end.5308:
%var_id.5321 = alloca i8*
store i8* null, i8** %var_id.5321
%.tmp5322 = getelementptr i8*, i8** %var_id.5321, i32 0
%.tmp5324 = getelementptr [6 x i8], [6 x i8]*@.str5323, i32 0, i32 0
%.tmp5325 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5285
%.tmp5326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5325, i32 0, i32 1
%.tmp5327 = load i8*, i8** %.tmp5326
%.tmp5328 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5329 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5328)
%.tmp5330 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5322, i8* %.tmp5324, i8* %.tmp5327, i32 %.tmp5329)
%.tmp5331 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5332 = load i8, i8* @SCOPE_LOCAL
%.tmp5333 = load i8*, i8** %var_id.5321
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5331, i8 %.tmp5332, i8* %.tmp5333)
%.tmp5334 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5239
%.tmp5335 = icmp ne %m1861$.Type.type* %.tmp5334, null
br i1 %.tmp5335, label %.if.true.5336, label %.if.false.5336
.if.true.5336:
%.tmp5337 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5338 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5337, i32 0, i32 4
%.tmp5339 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5239
store %m1861$.Type.type* %.tmp5339, %m1861$.Type.type** %.tmp5338
br label %.if.end.5336
.if.false.5336:
%.tmp5340 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5341 = icmp ne %m1861$.AssignableInfo.type* %.tmp5340, null
br i1 %.tmp5341, label %.if.true.5342, label %.if.false.5342
.if.true.5342:
%.tmp5343 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5344 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5343, i32 0, i32 4
%.tmp5345 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5346 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5345, i32 0, i32 4
%.tmp5347 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5346
store %m1861$.Type.type* %.tmp5347, %m1861$.Type.type** %.tmp5344
br label %.if.end.5342
.if.false.5342:
br label %.if.end.5342
.if.end.5342:
br label %.if.end.5336
.if.end.5336:
%.tmp5348 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5349 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5350 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5349, i32 0, i32 4
%.tmp5351 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5350
%.tmp5352 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5348, %m1861$.Type.type* %.tmp5351)
%var_type_repr.5353 = alloca i8*
store i8* %.tmp5352, i8** %var_type_repr.5353
%.tmp5354 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5355 = icmp ne %m1861$.AssignableInfo.type* %.tmp5354, null
br i1 %.tmp5355, label %.if.true.5356, label %.if.false.5356
.if.true.5356:
%.tmp5357 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5358 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5359 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5358, i32 0, i32 4
%.tmp5360 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5359
%.tmp5361 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5357, %m1861$.Type.type* %.tmp5360)
%a_type_repr.5362 = alloca i8*
store i8* %.tmp5361, i8** %a_type_repr.5362
%type_error.5363 = alloca i1
store i1 0, i1* %type_error.5363
%.tmp5364 = load i8*, i8** %a_type_repr.5362
%.tmp5365 = call i32(i8*) @strlen(i8* %.tmp5364)
%.tmp5366 = load i8*, i8** %var_type_repr.5353
%.tmp5367 = call i32(i8*) @strlen(i8* %.tmp5366)
%.tmp5368 = icmp ne i32 %.tmp5365, %.tmp5367
br i1 %.tmp5368, label %.if.true.5369, label %.if.false.5369
.if.true.5369:
store i1 1, i1* %type_error.5363
br label %.if.end.5369
.if.false.5369:
%.tmp5370 = load i8*, i8** %a_type_repr.5362
%.tmp5371 = load i8*, i8** %var_type_repr.5353
%.tmp5372 = call i32(i8*,i8*) @strcmp(i8* %.tmp5370, i8* %.tmp5371)
%.tmp5373 = icmp ne i32 %.tmp5372, 0
br i1 %.tmp5373, label %.if.true.5374, label %.if.false.5374
.if.true.5374:
store i1 1, i1* %type_error.5363
br label %.if.end.5374
.if.false.5374:
br label %.if.end.5374
.if.end.5374:
br label %.if.end.5369
.if.end.5369:
%.tmp5375 = load i1, i1* %type_error.5363
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
%.tmp5377 = bitcast ptr null to i8*
%err_msg.5378 = alloca i8*
store i8* %.tmp5377, i8** %err_msg.5378
%.tmp5379 = getelementptr i8*, i8** %err_msg.5378, i32 0
%.tmp5381 = getelementptr [49 x i8], [49 x i8]*@.str5380, i32 0, i32 0
%.tmp5382 = load i8*, i8** %a_type_repr.5362
%.tmp5383 = load i8*, i8** %var_type_repr.5353
%.tmp5384 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5379, i8* %.tmp5381, i8* %.tmp5382, i8* %.tmp5383)
%.tmp5385 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5386 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5387 = load i8*, i8** %err_msg.5378
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5385, %m307$.Node.type* %.tmp5386, i8* %.tmp5387)
br label %.if.end.5376
.if.false.5376:
br label %.if.end.5376
.if.end.5376:
br label %.if.end.5356
.if.false.5356:
br label %.if.end.5356
.if.end.5356:
%.tmp5388 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5389 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5390 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5285
%.tmp5391 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5390, i32 0, i32 1
%.tmp5392 = load i8*, i8** %.tmp5391
%.tmp5393 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5388, %m307$.Node.type* %.tmp5389, i8* %.tmp5392, %m1861$.AssignableInfo.type* %.tmp5393)
%.tmp5394 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5395 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5394, i32 0, i32 1
%.tmp5396 = load %m0$.File.type*, %m0$.File.type** %.tmp5395
%.tmp5398 = getelementptr [16 x i8], [16 x i8]*@.str5397, i32 0, i32 0
%.tmp5399 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5400 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5399)
%.tmp5401 = load i8*, i8** %var_type_repr.5353
%.tmp5402 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5396, i8* %.tmp5398, i8* %.tmp5400, i8* %.tmp5401)
%.tmp5403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5404 = icmp ne %m1861$.AssignableInfo.type* %.tmp5403, null
br i1 %.tmp5404, label %.if.true.5405, label %.if.false.5405
.if.true.5405:
%.tmp5406 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5407 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5406, i32 0, i32 1
%.tmp5408 = load %m0$.File.type*, %m0$.File.type** %.tmp5407
%.tmp5410 = getelementptr [21 x i8], [21 x i8]*@.str5409, i32 0, i32 0
%.tmp5411 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5412 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5413 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5412, i32 0, i32 4
%.tmp5414 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5413
%.tmp5415 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5411, %m1861$.Type.type* %.tmp5414)
%.tmp5416 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5241
%.tmp5417 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5416)
%.tmp5418 = load i8*, i8** %var_type_repr.5353
%.tmp5419 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
%.tmp5420 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5419)
%.tmp5421 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5408, i8* %.tmp5410, i8* %.tmp5415, i8* %.tmp5417, i8* %.tmp5418, i8* %.tmp5420)
br label %.if.end.5405
.if.false.5405:
%.tmp5422 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5423 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5424 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5422, %m307$.Node.type* %.tmp5423, %m1861$.AssignableInfo.type* %.tmp5424)
br label %.if.end.5405
.if.end.5405:
%.tmp5425 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5274
ret %m1861$.AssignableInfo.type* %.tmp5425
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5426 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5427 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5426, i32 0, i32 4
%.tmp5428 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5427
%.tmp5429 = icmp eq %m1861$.Type.type* %.tmp5428, null
br i1 %.tmp5429, label %.if.true.5430, label %.if.false.5430
.if.true.5430:
ret void
br label %.if.end.5430
.if.false.5430:
br label %.if.end.5430
.if.end.5430:
%.tmp5431 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5432 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5433 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5432, i32 0, i32 4
%.tmp5434 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5433
%.tmp5435 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5431, %m1861$.Type.type* %.tmp5434)
%t_repr.5436 = alloca i8*
store i8* %.tmp5435, i8** %t_repr.5436
%.tmp5437 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5438 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5437)
%id.5439 = alloca i8*
store i8* %.tmp5438, i8** %id.5439
%field_id.5440 = alloca i32
store i32 0, i32* %field_id.5440
%field.5441 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5441
%field_info.5442 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5443 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5444 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5443, i32 0, i32 4
%.tmp5445 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5444
%t.5446 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5445, %m1861$.Type.type** %t.5446
%.tmp5447 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5448 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5447, i32 0, i32 0
%.tmp5449 = load i8*, i8** %.tmp5448
%.tmp5451 = getelementptr [4 x i8], [4 x i8]*@.str5450, i32 0, i32 0
%.tmp5452 = call i32(i8*,i8*) @strcmp(i8* %.tmp5449, i8* %.tmp5451)
%.tmp5453 = icmp eq i32 %.tmp5452, 0
%.tmp5454 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5455 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5454, i32 0, i32 0
%.tmp5456 = load i8*, i8** %.tmp5455
%.tmp5458 = getelementptr [4 x i8], [4 x i8]*@.str5457, i32 0, i32 0
%.tmp5459 = call i32(i8*,i8*) @strcmp(i8* %.tmp5456, i8* %.tmp5458)
%.tmp5460 = icmp eq i32 %.tmp5459, 0
%.tmp5461 = or i1 %.tmp5453, %.tmp5460
%.tmp5462 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5463 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5462, i32 0, i32 0
%.tmp5464 = load i8*, i8** %.tmp5463
%.tmp5466 = getelementptr [5 x i8], [5 x i8]*@.str5465, i32 0, i32 0
%.tmp5467 = call i32(i8*,i8*) @strcmp(i8* %.tmp5464, i8* %.tmp5466)
%.tmp5468 = icmp eq i32 %.tmp5467, 0
%.tmp5469 = or i1 %.tmp5461, %.tmp5468
br i1 %.tmp5469, label %.if.true.5470, label %.if.false.5470
.if.true.5470:
%.tmp5471 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5472 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5471, i32 0, i32 1
%.tmp5473 = load %m0$.File.type*, %m0$.File.type** %.tmp5472
%.tmp5475 = getelementptr [21 x i8], [21 x i8]*@.str5474, i32 0, i32 0
%.tmp5476 = load i8*, i8** %t_repr.5436
%.tmp5477 = load i8*, i8** %t_repr.5436
%.tmp5478 = load i8*, i8** %id.5439
%.tmp5479 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5473, i8* %.tmp5475, i8* %.tmp5476, i32 0, i8* %.tmp5477, i8* %.tmp5478)
br label %.if.end.5470
.if.false.5470:
%.tmp5480 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5481 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5480, i32 0, i32 0
%.tmp5482 = load i8*, i8** %.tmp5481
%.tmp5484 = getelementptr [4 x i8], [4 x i8]*@.str5483, i32 0, i32 0
%.tmp5485 = call i32(i8*,i8*) @strcmp(i8* %.tmp5482, i8* %.tmp5484)
%.tmp5486 = icmp eq i32 %.tmp5485, 0
br i1 %.tmp5486, label %.if.true.5487, label %.if.false.5487
.if.true.5487:
%.tmp5488 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5489 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5488, i32 0, i32 1
%.tmp5490 = load %m0$.File.type*, %m0$.File.type** %.tmp5489
%.tmp5492 = getelementptr [21 x i8], [21 x i8]*@.str5491, i32 0, i32 0
%.tmp5493 = load i8*, i8** %t_repr.5436
%.tmp5495 = getelementptr [5 x i8], [5 x i8]*@.str5494, i32 0, i32 0
%.tmp5496 = load i8*, i8** %t_repr.5436
%.tmp5497 = load i8*, i8** %id.5439
%.tmp5498 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5490, i8* %.tmp5492, i8* %.tmp5493, i8* %.tmp5495, i8* %.tmp5496, i8* %.tmp5497)
br label %.if.end.5487
.if.false.5487:
%.tmp5499 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5500 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5499, i32 0, i32 0
%.tmp5501 = load i8*, i8** %.tmp5500
%.tmp5503 = getelementptr [7 x i8], [7 x i8]*@.str5502, i32 0, i32 0
%.tmp5504 = call i32(i8*,i8*) @strcmp(i8* %.tmp5501, i8* %.tmp5503)
%.tmp5505 = icmp eq i32 %.tmp5504, 0
br i1 %.tmp5505, label %.if.true.5506, label %.if.false.5506
.if.true.5506:
%.tmp5508 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5509 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5508, i32 0, i32 3
%.tmp5510 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5509
store %m1861$.Type.type* %.tmp5510, %m1861$.Type.type** %field.5441
br label %.for.start.5507
.for.start.5507:
%.tmp5511 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5441
%.tmp5512 = icmp ne %m1861$.Type.type* %.tmp5511, null
br i1 %.tmp5512, label %.for.continue.5507, label %.for.end.5507
.for.continue.5507:
%.tmp5513 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5514 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5513)
store %m1861$.AssignableInfo.type* %.tmp5514, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5515 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5516 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5515, %m1861$.AssignableInfo.type* %.tmp5516)
%.tmp5517 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5518 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5517, i32 0, i32 4
%.tmp5519 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5441
store %m1861$.Type.type* %.tmp5519, %m1861$.Type.type** %.tmp5518
%.tmp5520 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5521 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5520, i32 0, i32 1
%.tmp5522 = load %m0$.File.type*, %m0$.File.type** %.tmp5521
%.tmp5524 = getelementptr [46 x i8], [46 x i8]*@.str5523, i32 0, i32 0
%.tmp5525 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5526 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5525)
%.tmp5527 = load i8*, i8** %t_repr.5436
%.tmp5528 = load i8*, i8** %t_repr.5436
%.tmp5529 = load i8*, i8** %id.5439
%.tmp5530 = load i32, i32* %field_id.5440
%.tmp5531 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5522, i8* %.tmp5524, i8* %.tmp5526, i8* %.tmp5527, i8* %.tmp5528, i8* %.tmp5529, i32 %.tmp5530)
%.tmp5532 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5533 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5534 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5532, %m307$.Node.type* %.tmp5533, %m1861$.AssignableInfo.type* %.tmp5534)
%.tmp5535 = load i32, i32* %field_id.5440
%.tmp5536 = add i32 %.tmp5535, 1
store i32 %.tmp5536, i32* %field_id.5440
%.tmp5537 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5441
%.tmp5538 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5537, i32 0, i32 4
%.tmp5539 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5538
store %m1861$.Type.type* %.tmp5539, %m1861$.Type.type** %field.5441
br label %.for.start.5507
.for.end.5507:
br label %.if.end.5506
.if.false.5506:
%.tmp5540 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5541 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5540, i32 0, i32 0
%.tmp5542 = load i8*, i8** %.tmp5541
%.tmp5544 = getelementptr [10 x i8], [10 x i8]*@.str5543, i32 0, i32 0
%.tmp5545 = call i32(i8*,i8*) @strcmp(i8* %.tmp5542, i8* %.tmp5544)
%.tmp5546 = icmp eq i32 %.tmp5545, 0
br i1 %.tmp5546, label %.if.true.5547, label %.if.false.5547
.if.true.5547:
%.tmp5549 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5446
%.tmp5550 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5549, i32 0, i32 3
%.tmp5551 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5550
%.tmp5552 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5551, i32 0, i32 3
%.tmp5553 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5552
store %m1861$.Type.type* %.tmp5553, %m1861$.Type.type** %field.5441
br label %.for.start.5548
.for.start.5548:
%.tmp5554 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5441
%.tmp5555 = icmp ne %m1861$.Type.type* %.tmp5554, null
br i1 %.tmp5555, label %.for.continue.5548, label %.for.end.5548
.for.continue.5548:
%.tmp5556 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5557 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5556)
store %m1861$.AssignableInfo.type* %.tmp5557, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5558 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5559 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5558, %m1861$.AssignableInfo.type* %.tmp5559)
%.tmp5560 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5561 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5560, i32 0, i32 4
%.tmp5562 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5441
store %m1861$.Type.type* %.tmp5562, %m1861$.Type.type** %.tmp5561
%.tmp5563 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5564 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5563, i32 0, i32 1
%.tmp5565 = load %m0$.File.type*, %m0$.File.type** %.tmp5564
%.tmp5567 = getelementptr [46 x i8], [46 x i8]*@.str5566, i32 0, i32 0
%.tmp5568 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
%.tmp5569 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5568)
%.tmp5570 = load i8*, i8** %t_repr.5436
%.tmp5571 = load i8*, i8** %t_repr.5436
%.tmp5572 = load i8*, i8** %id.5439
%.tmp5573 = load i32, i32* %field_id.5440
%.tmp5574 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5565, i8* %.tmp5567, i8* %.tmp5569, i8* %.tmp5570, i8* %.tmp5571, i8* %.tmp5572, i32 %.tmp5573)
%.tmp5575 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5576 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5577 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5442
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5575, %m307$.Node.type* %.tmp5576, %m1861$.AssignableInfo.type* %.tmp5577)
%.tmp5578 = load i32, i32* %field_id.5440
%.tmp5579 = add i32 %.tmp5578, 1
store i32 %.tmp5579, i32* %field_id.5440
%.tmp5580 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5441
%.tmp5581 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5580, i32 0, i32 4
%.tmp5582 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5581
store %m1861$.Type.type* %.tmp5582, %m1861$.Type.type** %field.5441
br label %.for.start.5548
.for.end.5548:
br label %.if.end.5547
.if.false.5547:
%.tmp5583 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5584 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5586 = getelementptr [44 x i8], [44 x i8]*@.str5585, i32 0, i32 0
%.tmp5587 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5583, %m307$.Node.type* %.tmp5584, i8* %.tmp5586)
%.tmp5588 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5589 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5588, i32 0, i32 4
%.tmp5590 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5589
%.tmp5591 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5590, i32 0, i32 0
%.tmp5592 = load i8*, i8** %.tmp5591
%.tmp5593 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5594 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5595 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5594, i32 0, i32 4
%.tmp5596 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5595
%.tmp5597 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5593, %m1861$.Type.type* %.tmp5596)
%.tmp5598 = call i32(i8*,...) @printf(i8* %.tmp5587, i8* %.tmp5592, i8* %.tmp5597)
ret void
br label %.if.end.5547
.if.end.5547:
br label %.if.end.5506
.if.end.5506:
br label %.if.end.5487
.if.end.5487:
br label %.if.end.5470
.if.end.5470:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5599 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5600 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5599, i32 0, i32 6
%.tmp5601 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5600
%.tmp5603 = getelementptr [11 x i8], [11 x i8]*@.str5602, i32 0, i32 0
%.tmp5604 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5601, i8* %.tmp5603)
%assignable.5605 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5604, %m307$.Node.type** %assignable.5605
%.tmp5606 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5607 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5605
%.tmp5608 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5606, %m307$.Node.type* %.tmp5607)
%a_info.5609 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5608, %m1861$.AssignableInfo.type** %a_info.5609
%.tmp5610 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5609
%.tmp5611 = icmp eq %m1861$.AssignableInfo.type* %.tmp5610, null
br i1 %.tmp5611, label %.if.true.5612, label %.if.false.5612
.if.true.5612:
ret void
br label %.if.end.5612
.if.false.5612:
br label %.if.end.5612
.if.end.5612:
%.tmp5613 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5614 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5613)
%if_id.5615 = alloca i32
store i32 %.tmp5614, i32* %if_id.5615
%.tmp5616 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5617 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5616, i32 0, i32 1
%.tmp5618 = load %m0$.File.type*, %m0$.File.type** %.tmp5617
%.tmp5620 = getelementptr [53 x i8], [53 x i8]*@.str5619, i32 0, i32 0
%.tmp5621 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5622 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5609
%.tmp5623 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5622, i32 0, i32 4
%.tmp5624 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5623
%.tmp5625 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5621, %m1861$.Type.type* %.tmp5624)
%.tmp5626 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5609
%.tmp5627 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5626)
%.tmp5628 = load i32, i32* %if_id.5615
%.tmp5629 = load i32, i32* %if_id.5615
%.tmp5630 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5618, i8* %.tmp5620, i8* %.tmp5625, i8* %.tmp5627, i32 %.tmp5628, i32 %.tmp5629)
%.tmp5631 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5632 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5631, i32 0, i32 1
%.tmp5633 = load %m0$.File.type*, %m0$.File.type** %.tmp5632
%.tmp5635 = getelementptr [14 x i8], [14 x i8]*@.str5634, i32 0, i32 0
%.tmp5636 = load i32, i32* %if_id.5615
%.tmp5637 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5633, i8* %.tmp5635, i32 %.tmp5636)
%.tmp5638 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5639 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5638, i32 0, i32 6
%.tmp5640 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5639
%.tmp5642 = getelementptr [6 x i8], [6 x i8]*@.str5641, i32 0, i32 0
%.tmp5643 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5640, i8* %.tmp5642)
%block.5644 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5643, %m307$.Node.type** %block.5644
%.tmp5645 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5646 = load %m307$.Node.type*, %m307$.Node.type** %block.5644
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5645, %m307$.Node.type* %.tmp5646)
%.tmp5647 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5648 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5647, i32 0, i32 1
%.tmp5649 = load %m0$.File.type*, %m0$.File.type** %.tmp5648
%.tmp5651 = getelementptr [23 x i8], [23 x i8]*@.str5650, i32 0, i32 0
%.tmp5652 = load i32, i32* %if_id.5615
%.tmp5653 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5649, i8* %.tmp5651, i32 %.tmp5652)
%.tmp5654 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5655 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5654, i32 0, i32 1
%.tmp5656 = load %m0$.File.type*, %m0$.File.type** %.tmp5655
%.tmp5658 = getelementptr [15 x i8], [15 x i8]*@.str5657, i32 0, i32 0
%.tmp5659 = load i32, i32* %if_id.5615
%.tmp5660 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5656, i8* %.tmp5658, i32 %.tmp5659)
%.tmp5661 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5662 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5661, i32 0, i32 6
%.tmp5663 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5662
%.tmp5665 = getelementptr [11 x i8], [11 x i8]*@.str5664, i32 0, i32 0
%.tmp5666 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5663, i8* %.tmp5665)
%else_block.5667 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5666, %m307$.Node.type** %else_block.5667
%.tmp5668 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5667
%.tmp5669 = icmp ne %m307$.Node.type* %.tmp5668, null
br i1 %.tmp5669, label %.if.true.5670, label %.if.false.5670
.if.true.5670:
%.tmp5671 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5667
%.tmp5672 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5671, i32 0, i32 6
%.tmp5673 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5672
%.tmp5674 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5673, i32 0, i32 0
%.tmp5675 = load i8*, i8** %.tmp5674
%.tmp5677 = getelementptr [11 x i8], [11 x i8]*@.str5676, i32 0, i32 0
%.tmp5678 = call i32(i8*,i8*) @strcmp(i8* %.tmp5675, i8* %.tmp5677)
%.tmp5679 = icmp eq i32 %.tmp5678, 0
br i1 %.tmp5679, label %.if.true.5680, label %.if.false.5680
.if.true.5680:
%.tmp5681 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5667
%.tmp5682 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5681, i32 0, i32 6
%.tmp5683 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5682
%.tmp5684 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5683, i32 0, i32 6
%.tmp5685 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5684
%.tmp5687 = getelementptr [6 x i8], [6 x i8]*@.str5686, i32 0, i32 0
%.tmp5688 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5685, i8* %.tmp5687)
store %m307$.Node.type* %.tmp5688, %m307$.Node.type** %block.5644
%.tmp5689 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5690 = load %m307$.Node.type*, %m307$.Node.type** %block.5644
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5689, %m307$.Node.type* %.tmp5690)
br label %.if.end.5680
.if.false.5680:
%.tmp5691 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5692 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5667
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5691, %m307$.Node.type* %.tmp5692)
br label %.if.end.5680
.if.end.5680:
br label %.if.end.5670
.if.false.5670:
br label %.if.end.5670
.if.end.5670:
%.tmp5693 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5694 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5693, i32 0, i32 1
%.tmp5695 = load %m0$.File.type*, %m0$.File.type** %.tmp5694
%.tmp5697 = getelementptr [23 x i8], [23 x i8]*@.str5696, i32 0, i32 0
%.tmp5698 = load i32, i32* %if_id.5615
%.tmp5699 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5695, i8* %.tmp5697, i32 %.tmp5698)
%.tmp5700 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5701 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5700, i32 0, i32 1
%.tmp5702 = load %m0$.File.type*, %m0$.File.type** %.tmp5701
%.tmp5704 = getelementptr [13 x i8], [13 x i8]*@.str5703, i32 0, i32 0
%.tmp5705 = load i32, i32* %if_id.5615
%.tmp5706 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5702, i8* %.tmp5704, i32 %.tmp5705)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5707 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5708 = icmp ne %m307$.Node.type* %.tmp5707, null
br i1 %.tmp5708, label %.if.true.5709, label %.if.false.5709
.if.true.5709:
%.tmp5710 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5711 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5710, i32 0, i32 7
%.tmp5712 = load i8*, i8** %.tmp5711
%.tmp5713 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5714 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5713, i32 0, i32 3
%.tmp5715 = load i32, i32* %.tmp5714
%.tmp5716 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5717 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5716, i32 0, i32 4
%.tmp5718 = load i32, i32* %.tmp5717
%.tmp5719 = load i8*, i8** %msg
%.tmp5720 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5712, i32 %.tmp5715, i32 %.tmp5718, i8* %.tmp5719)
%err.5721 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5720, %m751$.Error.type** %err.5721
%.tmp5722 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5723 = load %m751$.Error.type*, %m751$.Error.type** %err.5721
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5722, %m751$.Error.type* %.tmp5723)
br label %.if.end.5709
.if.false.5709:
%.tmp5725 = getelementptr [61 x i8], [61 x i8]*@.str5724, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5725)
br label %.if.end.5709
.if.end.5709:
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
%.tmp5726 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5727 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5726)
%mod.5728 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5727, %m1861$.ModuleLookup.type** %mod.5728
%.tmp5729 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5728
%.tmp5730 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5729, i32 0, i32 3
%.tmp5731 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5730
%.tmp5732 = icmp ne %m1861$.Scope.type* %.tmp5731, null
%.tmp5734 = getelementptr [82 x i8], [82 x i8]*@.str5733, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5732, i8* %.tmp5734)
%.tmp5735 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5728
%.tmp5736 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5735, i32 0, i32 3
%.tmp5737 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5736
%current_scope.5738 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5737, %m1861$.Scope.type** %current_scope.5738
%.tmp5739 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5740 = ptrtoint %m1861$.ScopeItem.type* %.tmp5739 to i32
%.tmp5741 = call i8*(i32) @malloc(i32 %.tmp5740)
%.tmp5742 = bitcast i8* %.tmp5741 to %m1861$.ScopeItem.type*
%newitem.5743 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5742, %m1861$.ScopeItem.type** %newitem.5743
%.tmp5744 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5743
%.tmp5745 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5744, i32 0, i32 0
%.tmp5746 = load i8*, i8** %name
store i8* %.tmp5746, i8** %.tmp5745
%.tmp5747 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5743
%.tmp5748 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5747, i32 0, i32 1
%.tmp5749 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5749, %m1861$.AssignableInfo.type** %.tmp5748
%.tmp5750 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5743
%.tmp5751 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5750, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5751
%.tmp5752 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5753 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5752, i32 0, i32 2
%.tmp5754 = load i8*, i8** %name
store i8* %.tmp5754, i8** %.tmp5753
%.tmp5755 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5738
%.tmp5756 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5755, i32 0, i32 1
%.tmp5757 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5756
%.tmp5758 = icmp eq %m1861$.ScopeItem.type* %.tmp5757, null
br i1 %.tmp5758, label %.if.true.5759, label %.if.false.5759
.if.true.5759:
%.tmp5760 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5738
%.tmp5761 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5760, i32 0, i32 1
%.tmp5762 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5743
store %m1861$.ScopeItem.type* %.tmp5762, %m1861$.ScopeItem.type** %.tmp5761
ret void
br label %.if.end.5759
.if.false.5759:
br label %.if.end.5759
.if.end.5759:
%.tmp5763 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5738
%.tmp5764 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5763, i32 0, i32 1
%.tmp5765 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5764
%last_item.5766 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5765, %m1861$.ScopeItem.type** %last_item.5766
%.tmp5768 = getelementptr [1 x i8], [1 x i8]*@.str5767, i32 0, i32 0
%err_buf.5769 = alloca i8*
store i8* %.tmp5768, i8** %err_buf.5769
%.tmp5770 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5766
%.tmp5771 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5770, i32 0, i32 0
%.tmp5772 = load i8*, i8** %.tmp5771
%.tmp5773 = load i8*, i8** %name
%.tmp5774 = call i32(i8*,i8*) @strcmp(i8* %.tmp5772, i8* %.tmp5773)
%.tmp5775 = icmp eq i32 %.tmp5774, 0
br i1 %.tmp5775, label %.if.true.5776, label %.if.false.5776
.if.true.5776:
%.tmp5777 = getelementptr i8*, i8** %err_buf.5769, i32 0
%.tmp5779 = getelementptr [43 x i8], [43 x i8]*@.str5778, i32 0, i32 0
%.tmp5780 = load i8*, i8** %name
%.tmp5781 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5777, i8* %.tmp5779, i8* %.tmp5780)
%.tmp5782 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5783 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5784 = load i8*, i8** %err_buf.5769
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5782, %m307$.Node.type* %.tmp5783, i8* %.tmp5784)
br label %.if.end.5776
.if.false.5776:
br label %.if.end.5776
.if.end.5776:
br label %.for.start.5785
.for.start.5785:
%.tmp5786 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5766
%.tmp5787 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5786, i32 0, i32 2
%.tmp5788 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5787
%.tmp5789 = icmp ne %m1861$.ScopeItem.type* %.tmp5788, null
br i1 %.tmp5789, label %.for.continue.5785, label %.for.else.5785
.for.continue.5785:
%.tmp5790 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5766
%.tmp5791 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5790, i32 0, i32 0
%.tmp5792 = load i8*, i8** %.tmp5791
%.tmp5793 = load i8*, i8** %name
%.tmp5794 = call i32(i8*,i8*) @strcmp(i8* %.tmp5792, i8* %.tmp5793)
%.tmp5795 = icmp eq i32 %.tmp5794, 0
br i1 %.tmp5795, label %.if.true.5796, label %.if.false.5796
.if.true.5796:
%.tmp5797 = getelementptr i8*, i8** %err_buf.5769, i32 0
%.tmp5799 = getelementptr [43 x i8], [43 x i8]*@.str5798, i32 0, i32 0
%.tmp5800 = load i8*, i8** %name
%.tmp5801 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5797, i8* %.tmp5799, i8* %.tmp5800)
%.tmp5802 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5803 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5804 = load i8*, i8** %err_buf.5769
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5802, %m307$.Node.type* %.tmp5803, i8* %.tmp5804)
br label %.for.end.5785
br label %.if.end.5796
.if.false.5796:
br label %.if.end.5796
.if.end.5796:
%.tmp5805 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5766
%.tmp5806 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5805, i32 0, i32 2
%.tmp5807 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5806
store %m1861$.ScopeItem.type* %.tmp5807, %m1861$.ScopeItem.type** %last_item.5766
br label %.for.start.5785
.for.else.5785:
%.tmp5808 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5766
%.tmp5809 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5808, i32 0, i32 2
%.tmp5810 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5743
store %m1861$.ScopeItem.type* %.tmp5810, %m1861$.ScopeItem.type** %.tmp5809
br label %.for.end.5785
.for.end.5785:
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5811 = alloca i8*
store i8* null, i8** %err_buf.5811
%.tmp5812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5813 = load i8*, i8** %module
%.tmp5814 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5815 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5814, i32 0, i32 1
%.tmp5816 = load i8*, i8** %.tmp5815
%.tmp5817 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5812, i8* %.tmp5813, i8* %.tmp5816)
%found.5818 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5817, %m1861$.ScopeItem.type** %found.5818
%.tmp5819 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5818
%.tmp5820 = icmp eq %m1861$.ScopeItem.type* %.tmp5819, null
br i1 %.tmp5820, label %.if.true.5821, label %.if.false.5821
.if.true.5821:
%.tmp5822 = getelementptr i8*, i8** %err_buf.5811, i32 0
%.tmp5824 = getelementptr [31 x i8], [31 x i8]*@.str5823, i32 0, i32 0
%.tmp5825 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5826 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5825, i32 0, i32 1
%.tmp5827 = load i8*, i8** %.tmp5826
%.tmp5828 = load i8*, i8** %module
%.tmp5829 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5822, i8* %.tmp5824, i8* %.tmp5827, i8* %.tmp5828)
%.tmp5830 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5831 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5832 = load i8*, i8** %err_buf.5811
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5830, %m307$.Node.type* %.tmp5831, i8* %.tmp5832)
%.tmp5833 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5833
br label %.if.end.5821
.if.false.5821:
br label %.if.end.5821
.if.end.5821:
br label %.for.start.5834
.for.start.5834:
%.tmp5835 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5836 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5835, i32 0, i32 7
%.tmp5837 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5836
%.tmp5838 = icmp ne %m307$.Node.type* %.tmp5837, null
%.tmp5839 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5818
%.tmp5840 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5839, i32 0, i32 1
%.tmp5841 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5840
%.tmp5842 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5841, i32 0, i32 3
%.tmp5843 = load i8*, i8** %.tmp5842
%.tmp5845 = getelementptr [7 x i8], [7 x i8]*@.str5844, i32 0, i32 0
%.tmp5846 = call i32(i8*,i8*) @strcmp(i8* %.tmp5843, i8* %.tmp5845)
%.tmp5847 = icmp eq i32 %.tmp5846, 0
%.tmp5848 = and i1 %.tmp5838, %.tmp5847
br i1 %.tmp5848, label %.for.continue.5834, label %.for.end.5834
.for.continue.5834:
%.tmp5849 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5850 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5818
%.tmp5851 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5850, i32 0, i32 1
%.tmp5852 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5851
%.tmp5853 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5852, i32 0, i32 0
%.tmp5854 = load i8*, i8** %.tmp5853
%.tmp5855 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5856 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5855, i32 0, i32 7
%.tmp5857 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5856
%.tmp5858 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5857, i32 0, i32 7
%.tmp5859 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5858
%.tmp5860 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5849, i8* %.tmp5854, %m307$.Node.type* %.tmp5859)
store %m1861$.ScopeItem.type* %.tmp5860, %m1861$.ScopeItem.type** %found.5818
%.tmp5861 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5818
%.tmp5862 = icmp eq %m1861$.ScopeItem.type* %.tmp5861, null
br i1 %.tmp5862, label %.if.true.5863, label %.if.false.5863
.if.true.5863:
%.tmp5864 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5864
br label %.if.end.5863
.if.false.5863:
br label %.if.end.5863
.if.end.5863:
br label %.for.start.5834
.for.end.5834:
%.tmp5865 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5818
ret %m1861$.ScopeItem.type* %.tmp5865
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5866 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5867 = icmp eq %m1861$.Scope.type* %.tmp5866, null
br i1 %.tmp5867, label %.if.true.5868, label %.if.false.5868
.if.true.5868:
%.tmp5869 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5869
br label %.if.end.5868
.if.false.5868:
br label %.if.end.5868
.if.end.5868:
%.tmp5871 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5872 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5871, i32 0, i32 1
%.tmp5873 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5872
%item.5874 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5873, %m1861$.ScopeItem.type** %item.5874
br label %.for.start.5870
.for.start.5870:
%.tmp5875 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5874
%.tmp5876 = icmp ne %m1861$.ScopeItem.type* %.tmp5875, null
br i1 %.tmp5876, label %.for.continue.5870, label %.for.end.5870
.for.continue.5870:
%.tmp5877 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5874
%.tmp5878 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5877, i32 0, i32 0
%.tmp5879 = load i8*, i8** %.tmp5878
%.tmp5880 = load i8*, i8** %name
%.tmp5881 = call i32(i8*,i8*) @strcmp(i8* %.tmp5879, i8* %.tmp5880)
%.tmp5882 = icmp eq i32 %.tmp5881, 0
br i1 %.tmp5882, label %.if.true.5883, label %.if.false.5883
.if.true.5883:
%.tmp5884 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5874
ret %m1861$.ScopeItem.type* %.tmp5884
br label %.if.end.5883
.if.false.5883:
br label %.if.end.5883
.if.end.5883:
%.tmp5885 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5874
%.tmp5886 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5885, i32 0, i32 2
%.tmp5887 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5886
store %m1861$.ScopeItem.type* %.tmp5887, %m1861$.ScopeItem.type** %item.5874
br label %.for.start.5870
.for.end.5870:
%.tmp5888 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5888
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5889 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5890 = load i8*, i8** %module
%.tmp5891 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5889, i8* %.tmp5890)
%mod.5892 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5891, %m1861$.ModuleLookup.type** %mod.5892
%.tmp5893 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5892
%.tmp5894 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5893, i32 0, i32 3
%.tmp5895 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5894
%.tmp5896 = icmp ne %m1861$.Scope.type* %.tmp5895, null
%.tmp5898 = getelementptr [77 x i8], [77 x i8]*@.str5897, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5896, i8* %.tmp5898)
%.tmp5900 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5892
%.tmp5901 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5900, i32 0, i32 3
%.tmp5902 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5901
%s.5903 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5902, %m1861$.Scope.type** %s.5903
br label %.for.start.5899
.for.start.5899:
%.tmp5904 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5903
%.tmp5905 = icmp ne %m1861$.Scope.type* %.tmp5904, null
br i1 %.tmp5905, label %.for.continue.5899, label %.for.end.5899
.for.continue.5899:
%.tmp5906 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5907 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5903
%.tmp5908 = load i8*, i8** %assignable_name
%.tmp5909 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5906, %m1861$.Scope.type* %.tmp5907, i8* %.tmp5908)
%item.5910 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5909, %m1861$.ScopeItem.type** %item.5910
%.tmp5911 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5910
%.tmp5912 = icmp ne %m1861$.ScopeItem.type* %.tmp5911, null
br i1 %.tmp5912, label %.if.true.5913, label %.if.false.5913
.if.true.5913:
%.tmp5914 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5910
ret %m1861$.ScopeItem.type* %.tmp5914
br label %.if.end.5913
.if.false.5913:
br label %.if.end.5913
.if.end.5913:
%.tmp5915 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5903
%.tmp5916 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5915, i32 0, i32 5
%.tmp5917 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5916
store %m1861$.Scope.type* %.tmp5917, %m1861$.Scope.type** %s.5903
br label %.for.start.5899
.for.end.5899:
%.tmp5918 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5918
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5919 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5920 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5921 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5920, i32 0, i32 7
%.tmp5922 = load i8*, i8** %.tmp5921
%.tmp5923 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5924 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5923, i32 0, i32 6
%.tmp5925 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5924
%.tmp5926 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5919, i8* %.tmp5922, %m307$.Node.type* %.tmp5925)
ret %m1861$.ScopeItem.type* %.tmp5926
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5927 = alloca i8*
store i8* null, i8** %err_msg.5927
%buf.5928 = alloca i8*
store i8* null, i8** %buf.5928
%.tmp5929 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5930 = icmp eq %m1861$.AssignableInfo.type* %.tmp5929, null
br i1 %.tmp5930, label %.if.true.5931, label %.if.false.5931
.if.true.5931:
%.tmp5932 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5933 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5935 = getelementptr [54 x i8], [54 x i8]*@.str5934, i32 0, i32 0
%.tmp5936 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5932, %m307$.Node.type* %.tmp5933, i8* %.tmp5935)
%.tmp5937 = call i32(i8*,...) @printf(i8* %.tmp5936)
%.tmp5938 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5938
br label %.if.end.5931
.if.false.5931:
br label %.if.end.5931
.if.end.5931:
%.tmp5939 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5940 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5939, i32 0, i32 3
%.tmp5941 = load i8*, i8** %.tmp5940
%.tmp5943 = getelementptr [9 x i8], [9 x i8]*@.str5942, i32 0, i32 0
%.tmp5944 = call i32(i8*,i8*) @strcmp(i8* %.tmp5941, i8* %.tmp5943)
%.tmp5945 = icmp eq i32 %.tmp5944, 0
%.tmp5946 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5947 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5946, i32 0, i32 3
%.tmp5948 = load i8*, i8** %.tmp5947
%.tmp5950 = getelementptr [7 x i8], [7 x i8]*@.str5949, i32 0, i32 0
%.tmp5951 = call i32(i8*,i8*) @strcmp(i8* %.tmp5948, i8* %.tmp5950)
%.tmp5952 = icmp eq i32 %.tmp5951, 0
%.tmp5953 = or i1 %.tmp5945, %.tmp5952
br i1 %.tmp5953, label %.if.true.5954, label %.if.false.5954
.if.true.5954:
%.tmp5955 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5955, i32 0, i32 7
%.tmp5957 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5956
%.tmp5958 = icmp ne %m307$.Node.type* %.tmp5957, null
br i1 %.tmp5958, label %.if.true.5959, label %.if.false.5959
.if.true.5959:
%.tmp5960 = getelementptr i8*, i8** %err_msg.5927, i32 0
%.tmp5962 = getelementptr [46 x i8], [46 x i8]*@.str5961, i32 0, i32 0
%.tmp5963 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5964 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5963, i32 0, i32 7
%.tmp5965 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5964
%.tmp5966 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5965, i32 0, i32 7
%.tmp5967 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5966
%.tmp5968 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5967, i32 0, i32 1
%.tmp5969 = load i8*, i8** %.tmp5968
%.tmp5970 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5971 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5970, i32 0, i32 1
%.tmp5972 = load i8*, i8** %.tmp5971
%.tmp5973 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5960, i8* %.tmp5962, i8* %.tmp5969, i8* %.tmp5972)
%.tmp5974 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5975 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5976 = load i8*, i8** %err_msg.5927
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5974, %m307$.Node.type* %.tmp5975, i8* %.tmp5976)
%.tmp5977 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5977
br label %.if.end.5959
.if.false.5959:
br label %.if.end.5959
.if.end.5959:
%.tmp5978 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5978
br label %.if.end.5954
.if.false.5954:
%.tmp5979 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5980 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5979, i32 0, i32 3
%.tmp5981 = load i8*, i8** %.tmp5980
%.tmp5983 = getelementptr [9 x i8], [9 x i8]*@.str5982, i32 0, i32 0
%.tmp5984 = call i32(i8*,i8*) @strcmp(i8* %.tmp5981, i8* %.tmp5983)
%.tmp5985 = icmp eq i32 %.tmp5984, 0
%.tmp5986 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5987 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5986, i32 0, i32 7
%.tmp5988 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5987
%.tmp5989 = icmp ne %m307$.Node.type* %.tmp5988, null
%.tmp5990 = and i1 %.tmp5985, %.tmp5989
br i1 %.tmp5990, label %.if.true.5991, label %.if.false.5991
.if.true.5991:
%.tmp5992 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5993 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5992, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp5994 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp5995 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5994, i32 0, i32 4
%.tmp5996 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5995
%struct_info.5997 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5996, %m1861$.Type.type** %struct_info.5997
br label %.for.start.5998
.for.start.5998:
%.tmp5999 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6000 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5999, i32 0, i32 4
%.tmp6001 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6000
%.tmp6002 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6001, i32 0, i32 0
%.tmp6003 = load i8*, i8** %.tmp6002
%.tmp6005 = getelementptr [4 x i8], [4 x i8]*@.str6004, i32 0, i32 0
%.tmp6006 = call i32(i8*,i8*) @strcmp(i8* %.tmp6003, i8* %.tmp6005)
%.tmp6007 = icmp eq i32 %.tmp6006, 0
br i1 %.tmp6007, label %.for.continue.5998, label %.for.end.5998
.for.continue.5998:
%.tmp6008 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6009 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6008)
%new_base.6010 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6009, %m1861$.AssignableInfo.type** %new_base.6010
%.tmp6011 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6012 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6010
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6011, %m1861$.AssignableInfo.type* %.tmp6012)
%.tmp6013 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6010
%.tmp6014 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6013, i32 0, i32 4
%.tmp6015 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6016 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6015, i32 0, i32 4
%.tmp6017 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6016
%.tmp6018 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6017, i32 0, i32 3
%.tmp6019 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6018
store %m1861$.Type.type* %.tmp6019, %m1861$.Type.type** %.tmp6014
%.tmp6020 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6021 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6020, i32 0, i32 1
%.tmp6022 = load %m0$.File.type*, %m0$.File.type** %.tmp6021
%.tmp6024 = getelementptr [23 x i8], [23 x i8]*@.str6023, i32 0, i32 0
%.tmp6025 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6010
%.tmp6026 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6025)
%.tmp6027 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6028 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6010
%.tmp6029 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6028, i32 0, i32 4
%.tmp6030 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6029
%.tmp6031 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6027, %m1861$.Type.type* %.tmp6030)
%.tmp6032 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6033 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6034 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6033, i32 0, i32 4
%.tmp6035 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6034
%.tmp6036 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6032, %m1861$.Type.type* %.tmp6035)
%.tmp6037 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6038 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6037)
%.tmp6039 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6022, i8* %.tmp6024, i8* %.tmp6026, i8* %.tmp6031, i8* %.tmp6036, i8* %.tmp6038)
%.tmp6040 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6010
store %m1861$.AssignableInfo.type* %.tmp6040, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6041 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5997
%.tmp6042 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6041, i32 0, i32 3
%.tmp6043 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6042
store %m1861$.Type.type* %.tmp6043, %m1861$.Type.type** %struct_info.5997
br label %.for.start.5998
.for.end.5998:
%.tmp6044 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5997
%.tmp6045 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6044, i32 0, i32 0
%.tmp6046 = load i8*, i8** %.tmp6045
%.tmp6048 = getelementptr [10 x i8], [10 x i8]*@.str6047, i32 0, i32 0
%.tmp6049 = call i32(i8*,i8*) @strcmp(i8* %.tmp6046, i8* %.tmp6048)
%.tmp6050 = icmp eq i32 %.tmp6049, 0
br i1 %.tmp6050, label %.if.true.6051, label %.if.false.6051
.if.true.6051:
%.tmp6052 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5997
%.tmp6053 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6052, i32 0, i32 3
%.tmp6054 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6053
store %m1861$.Type.type* %.tmp6054, %m1861$.Type.type** %struct_info.5997
br label %.if.end.6051
.if.false.6051:
br label %.if.end.6051
.if.end.6051:
%.tmp6055 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5997
%.tmp6056 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6055, i32 0, i32 0
%.tmp6057 = load i8*, i8** %.tmp6056
%.tmp6059 = getelementptr [7 x i8], [7 x i8]*@.str6058, i32 0, i32 0
%.tmp6060 = call i32(i8*,i8*) @strcmp(i8* %.tmp6057, i8* %.tmp6059)
%.tmp6061 = icmp ne i32 %.tmp6060, 0
br i1 %.tmp6061, label %.if.true.6062, label %.if.false.6062
.if.true.6062:
%.tmp6063 = getelementptr i8*, i8** %err_msg.5927, i32 0
%.tmp6065 = getelementptr [48 x i8], [48 x i8]*@.str6064, i32 0, i32 0
%.tmp6066 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6067 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6066, i32 0, i32 7
%.tmp6068 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6067
%.tmp6069 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6068, i32 0, i32 7
%.tmp6070 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6069
%.tmp6071 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6070, i32 0, i32 1
%.tmp6072 = load i8*, i8** %.tmp6071
%.tmp6073 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6074 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6073, i32 0, i32 1
%.tmp6075 = load i8*, i8** %.tmp6074
%.tmp6076 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6063, i8* %.tmp6065, i8* %.tmp6072, i8* %.tmp6075)
%.tmp6077 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6078 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6079 = load i8*, i8** %err_msg.5927
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6077, %m307$.Node.type* %.tmp6078, i8* %.tmp6079)
%.tmp6080 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6080
br label %.if.end.6062
.if.false.6062:
br label %.if.end.6062
.if.end.6062:
%.tmp6081 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6082 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6081, i32 0, i32 7
%.tmp6083 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6082
%.tmp6084 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6083, i32 0, i32 7
%.tmp6085 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6084
%.tmp6086 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6085, i32 0, i32 1
%.tmp6087 = load i8*, i8** %.tmp6086
%field_name.6088 = alloca i8*
store i8* %.tmp6087, i8** %field_name.6088
%field_id.6089 = alloca i32
store i32 0, i32* %field_id.6089
%.tmp6090 = bitcast ptr null to %m1861$.Type.type*
%found_field.6091 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6090, %m1861$.Type.type** %found_field.6091
%.tmp6093 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5997
%.tmp6094 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6093, i32 0, i32 3
%.tmp6095 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6094
%field.6096 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6095, %m1861$.Type.type** %field.6096
br label %.for.start.6092
.for.start.6092:
%.tmp6097 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6096
%.tmp6098 = icmp ne %m1861$.Type.type* %.tmp6097, null
br i1 %.tmp6098, label %.for.continue.6092, label %.for.end.6092
.for.continue.6092:
%.tmp6099 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6096
%.tmp6100 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6099, i32 0, i32 1
%.tmp6101 = load i8*, i8** %.tmp6100
%.tmp6102 = load i8*, i8** %field_name.6088
%.tmp6103 = call i32(i8*,i8*) @strcmp(i8* %.tmp6101, i8* %.tmp6102)
%.tmp6104 = icmp eq i32 %.tmp6103, 0
br i1 %.tmp6104, label %.if.true.6105, label %.if.false.6105
.if.true.6105:
%.tmp6106 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6096
store %m1861$.Type.type* %.tmp6106, %m1861$.Type.type** %found_field.6091
br label %.for.end.6092
br label %.if.end.6105
.if.false.6105:
%.tmp6107 = load i32, i32* %field_id.6089
%.tmp6108 = add i32 %.tmp6107, 1
store i32 %.tmp6108, i32* %field_id.6089
br label %.if.end.6105
.if.end.6105:
%.tmp6109 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6096
%.tmp6110 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6109, i32 0, i32 4
%.tmp6111 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6110
store %m1861$.Type.type* %.tmp6111, %m1861$.Type.type** %field.6096
br label %.for.start.6092
.for.end.6092:
%.tmp6112 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.6091
%.tmp6113 = icmp eq %m1861$.Type.type* %.tmp6112, null
br i1 %.tmp6113, label %.if.true.6114, label %.if.false.6114
.if.true.6114:
%.tmp6115 = getelementptr i8*, i8** %err_msg.5927, i32 0
%.tmp6117 = getelementptr [34 x i8], [34 x i8]*@.str6116, i32 0, i32 0
%.tmp6118 = load i8*, i8** %field_name.6088
%.tmp6119 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6120 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6119, i32 0, i32 1
%.tmp6121 = load i8*, i8** %.tmp6120
%.tmp6122 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6115, i8* %.tmp6117, i8* %.tmp6118, i8* %.tmp6121)
%.tmp6123 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6124 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6125 = load i8*, i8** %err_msg.5927
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6123, %m307$.Node.type* %.tmp6124, i8* %.tmp6125)
%.tmp6126 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6126
br label %.if.end.6114
.if.false.6114:
br label %.if.end.6114
.if.end.6114:
%.tmp6127 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6128 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6127)
%new_info.6129 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6128, %m1861$.AssignableInfo.type** %new_info.6129
%.tmp6130 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6129
%.tmp6131 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6130, i32 0, i32 4
%.tmp6132 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.6091
store %m1861$.Type.type* %.tmp6132, %m1861$.Type.type** %.tmp6131
%.tmp6133 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6134 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6129
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6133, %m1861$.AssignableInfo.type* %.tmp6134)
%.tmp6135 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6129
%.tmp6136 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6135, i32 0, i32 3
%.tmp6138 = getelementptr [9 x i8], [9 x i8]*@.str6137, i32 0, i32 0
store i8* %.tmp6138, i8** %.tmp6136
%.tmp6139 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6140 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6141 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6140, i32 0, i32 4
%.tmp6142 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6141
%.tmp6143 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6139, %m1861$.Type.type* %.tmp6142)
%info_tr.6144 = alloca i8*
store i8* %.tmp6143, i8** %info_tr.6144
%.tmp6145 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6146 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6145, i32 0, i32 1
%.tmp6147 = load %m0$.File.type*, %m0$.File.type** %.tmp6146
%.tmp6149 = getelementptr [46 x i8], [46 x i8]*@.str6148, i32 0, i32 0
%.tmp6150 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6129
%.tmp6151 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6150)
%.tmp6152 = load i8*, i8** %info_tr.6144
%.tmp6153 = load i8*, i8** %info_tr.6144
%.tmp6154 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5993
%.tmp6155 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6154)
%.tmp6156 = load i32, i32* %field_id.6089
%.tmp6157 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6147, i8* %.tmp6149, i8* %.tmp6151, i8* %.tmp6152, i8* %.tmp6153, i8* %.tmp6155, i32 %.tmp6156)
%.tmp6158 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6159 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6160 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6159, i32 0, i32 7
%.tmp6161 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6160
%.tmp6162 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6161, i32 0, i32 7
%.tmp6163 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6162
%.tmp6164 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6129
%.tmp6165 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6158, %m307$.Node.type* %.tmp6163, %m1861$.AssignableInfo.type* %.tmp6164)
ret %m1861$.AssignableInfo.type* %.tmp6165
br label %.if.end.5991
.if.false.5991:
%.tmp6166 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6167 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6166, i32 0, i32 3
%.tmp6168 = load i8*, i8** %.tmp6167
%.tmp6170 = getelementptr [9 x i8], [9 x i8]*@.str6169, i32 0, i32 0
%.tmp6171 = call i32(i8*,i8*) @strcmp(i8* %.tmp6168, i8* %.tmp6170)
%.tmp6172 = icmp eq i32 %.tmp6171, 0
br i1 %.tmp6172, label %.if.true.6173, label %.if.false.6173
.if.true.6173:
%.tmp6174 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp6174
br label %.if.end.6173
.if.false.6173:
br label %.if.end.6173
.if.end.6173:
br label %.if.end.5991
.if.end.5991:
br label %.if.end.5954
.if.end.5954:
%.tmp6175 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6176 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6178 = getelementptr [43 x i8], [43 x i8]*@.str6177, i32 0, i32 0
%.tmp6179 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6175, %m307$.Node.type* %.tmp6176, i8* %.tmp6178)
%.tmp6180 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6181 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6180, i32 0, i32 3
%.tmp6182 = load i8*, i8** %.tmp6181
%.tmp6183 = call i32(i8*,...) @printf(i8* %.tmp6179, i8* %.tmp6182)
%.tmp6184 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6184
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.6185 = alloca i8*
store i8* null, i8** %err_msg.6185
%.tmp6186 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.6187 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6186, %m307$.Node.type** %curr_node.6187
%.tmp6188 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6189 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6188, i32 0, i32 0
%.tmp6190 = load i8*, i8** %.tmp6189
%.tmp6192 = getelementptr [17 x i8], [17 x i8]*@.str6191, i32 0, i32 0
%.tmp6193 = call i32(i8*,i8*) @strcmp(i8* %.tmp6190, i8* %.tmp6192)
%.tmp6194 = icmp eq i32 %.tmp6193, 0
%.tmp6195 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6195, i32 0, i32 0
%.tmp6197 = load i8*, i8** %.tmp6196
%.tmp6199 = getelementptr [16 x i8], [16 x i8]*@.str6198, i32 0, i32 0
%.tmp6200 = call i32(i8*,i8*) @strcmp(i8* %.tmp6197, i8* %.tmp6199)
%.tmp6201 = icmp eq i32 %.tmp6200, 0
%.tmp6202 = or i1 %.tmp6194, %.tmp6201
%.tmp6203 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6204 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6203, i32 0, i32 0
%.tmp6205 = load i8*, i8** %.tmp6204
%.tmp6207 = getelementptr [11 x i8], [11 x i8]*@.str6206, i32 0, i32 0
%.tmp6208 = call i32(i8*,i8*) @strcmp(i8* %.tmp6205, i8* %.tmp6207)
%.tmp6209 = icmp eq i32 %.tmp6208, 0
%.tmp6210 = or i1 %.tmp6202, %.tmp6209
br i1 %.tmp6210, label %.if.true.6211, label %.if.false.6211
.if.true.6211:
%.tmp6212 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6213 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6214 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6213, i32 0, i32 6
%.tmp6215 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6214
%.tmp6216 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6212, %m307$.Node.type* %.tmp6215)
ret %m1861$.AssignableInfo.type* %.tmp6216
br label %.if.end.6211
.if.false.6211:
br label %.if.end.6211
.if.end.6211:
%.tmp6217 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6218 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6217, i32 0, i32 0
%.tmp6219 = load i8*, i8** %.tmp6218
%.tmp6221 = getelementptr [12 x i8], [12 x i8]*@.str6220, i32 0, i32 0
%.tmp6222 = call i32(i8*,i8*) @strcmp(i8* %.tmp6219, i8* %.tmp6221)
%.tmp6223 = icmp ne i32 %.tmp6222, 0
br i1 %.tmp6223, label %.if.true.6224, label %.if.false.6224
.if.true.6224:
%.tmp6226 = getelementptr [92 x i8], [92 x i8]*@.str6225, i32 0, i32 0
%.tmp6227 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6228 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6227, i32 0, i32 0
%.tmp6229 = load i8*, i8** %.tmp6228
%.tmp6230 = call i32(i8*,...) @printf(i8* %.tmp6226, i8* %.tmp6229)
%.tmp6231 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6232 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6231, i32 0, i32 6
%.tmp6233 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6232
store %m307$.Node.type* %.tmp6233, %m307$.Node.type** %curr_node.6187
br label %.if.end.6224
.if.false.6224:
br label %.if.end.6224
.if.end.6224:
%.tmp6234 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6235 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6234, i32 0, i32 6
%.tmp6236 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6235
%assignable_name.6237 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6236, %m307$.Node.type** %assignable_name.6237
%.tmp6238 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6239 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6240 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6239, i32 0, i32 7
%.tmp6241 = load i8*, i8** %.tmp6240
%.tmp6242 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6243 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6242, i32 0, i32 6
%.tmp6244 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6243
%.tmp6245 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6244, i32 0, i32 1
%.tmp6246 = load i8*, i8** %.tmp6245
%.tmp6247 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6238, i8* %.tmp6241, i8* %.tmp6246)
%scope_info.6248 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp6247, %m1861$.ScopeItem.type** %scope_info.6248
%.tmp6249 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6248
%.tmp6250 = icmp eq %m1861$.ScopeItem.type* %.tmp6249, null
br i1 %.tmp6250, label %.if.true.6251, label %.if.false.6251
.if.true.6251:
%.tmp6252 = getelementptr i8*, i8** %err_msg.6185, i32 0
%.tmp6254 = getelementptr [41 x i8], [41 x i8]*@.str6253, i32 0, i32 0
%.tmp6255 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6256 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6255, i32 0, i32 6
%.tmp6257 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6256
%.tmp6258 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6257, i32 0, i32 1
%.tmp6259 = load i8*, i8** %.tmp6258
%.tmp6260 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6252, i8* %.tmp6254, i8* %.tmp6259)
%.tmp6261 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6262 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6263 = load i8*, i8** %err_msg.6185
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6261, %m307$.Node.type* %.tmp6262, i8* %.tmp6263)
%.tmp6264 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6264
br label %.if.end.6251
.if.false.6251:
br label %.if.end.6251
.if.end.6251:
%.tmp6265 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6248
%.tmp6266 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6265, i32 0, i32 1
%.tmp6267 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6266
%info.6268 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6267, %m1861$.AssignableInfo.type** %info.6268
%.tmp6269 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6268
%.tmp6270 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6269, i32 0, i32 3
%.tmp6271 = load i8*, i8** %.tmp6270
%.tmp6273 = getelementptr [7 x i8], [7 x i8]*@.str6272, i32 0, i32 0
%.tmp6274 = call i32(i8*,i8*) @strcmp(i8* %.tmp6271, i8* %.tmp6273)
%.tmp6275 = icmp eq i32 %.tmp6274, 0
br i1 %.tmp6275, label %.if.true.6276, label %.if.false.6276
.if.true.6276:
%.tmp6277 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6278 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6268
%.tmp6279 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6278)
%.tmp6280 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6281 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6280, i32 0, i32 6
%.tmp6282 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6281
%.tmp6283 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6282, i32 0, i32 7
%.tmp6284 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6283
%.tmp6285 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6284, i32 0, i32 7
%.tmp6286 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6285
%.tmp6287 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6286, i32 0, i32 1
%.tmp6288 = load i8*, i8** %.tmp6287
%.tmp6289 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6277, i8* %.tmp6279, i8* %.tmp6288)
store %m1861$.ScopeItem.type* %.tmp6289, %m1861$.ScopeItem.type** %scope_info.6248
%.tmp6290 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6248
%.tmp6291 = icmp eq %m1861$.ScopeItem.type* %.tmp6290, null
br i1 %.tmp6291, label %.if.true.6292, label %.if.false.6292
.if.true.6292:
%.tmp6293 = getelementptr i8*, i8** %err_msg.6185, i32 0
%.tmp6295 = getelementptr [31 x i8], [31 x i8]*@.str6294, i32 0, i32 0
%.tmp6296 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6297 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6296, i32 0, i32 6
%.tmp6298 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6297
%.tmp6299 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6298, i32 0, i32 7
%.tmp6300 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6299
%.tmp6301 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6300, i32 0, i32 7
%.tmp6302 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6301
%.tmp6303 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6302, i32 0, i32 1
%.tmp6304 = load i8*, i8** %.tmp6303
%.tmp6305 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6268
%.tmp6306 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6305)
%.tmp6307 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6293, i8* %.tmp6295, i8* %.tmp6304, i8* %.tmp6306)
%.tmp6308 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6309 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6310 = load i8*, i8** %err_msg.6185
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6308, %m307$.Node.type* %.tmp6309, i8* %.tmp6310)
%.tmp6311 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6311
br label %.if.end.6292
.if.false.6292:
br label %.if.end.6292
.if.end.6292:
%.tmp6312 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6248
%.tmp6313 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6312, i32 0, i32 1
%.tmp6314 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6313
store %m1861$.AssignableInfo.type* %.tmp6314, %m1861$.AssignableInfo.type** %info.6268
%.tmp6315 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6316 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6315, i32 0, i32 6
%.tmp6317 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6316
%.tmp6318 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6317, i32 0, i32 7
%.tmp6319 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6318
%.tmp6320 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6319, i32 0, i32 7
%.tmp6321 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6320
store %m307$.Node.type* %.tmp6321, %m307$.Node.type** %assignable_name.6237
br label %.if.end.6276
.if.false.6276:
%.tmp6322 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6323 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6322, i32 0, i32 6
%.tmp6324 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6323
store %m307$.Node.type* %.tmp6324, %m307$.Node.type** %assignable_name.6237
br label %.if.end.6276
.if.end.6276:
%.tmp6325 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6326 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6237
%.tmp6327 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6268
%.tmp6328 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6325, %m307$.Node.type* %.tmp6326, %m1861$.AssignableInfo.type* %.tmp6327)
%base.6329 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6328, %m1861$.AssignableInfo.type** %base.6329
%.tmp6331 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6332 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6331, i32 0, i32 6
%.tmp6333 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6332
%.tmp6334 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6333, i32 0, i32 7
%.tmp6335 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6334
%addr.6336 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6335, %m307$.Node.type** %addr.6336
br label %.for.start.6330
.for.start.6330:
%.tmp6337 = load %m307$.Node.type*, %m307$.Node.type** %addr.6336
%.tmp6338 = icmp ne %m307$.Node.type* %.tmp6337, null
br i1 %.tmp6338, label %.for.continue.6330, label %.for.end.6330
.for.continue.6330:
%.tmp6339 = load %m307$.Node.type*, %m307$.Node.type** %addr.6336
%.tmp6340 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6339, i32 0, i32 7
%.tmp6341 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6340
%index.6342 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6341, %m307$.Node.type** %index.6342
%.tmp6343 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6344 = load %m307$.Node.type*, %m307$.Node.type** %index.6342
%.tmp6345 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6343, %m307$.Node.type* %.tmp6344)
%index_info.6346 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6345, %m1861$.AssignableInfo.type** %index_info.6346
%.tmp6347 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6348 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6346
%.tmp6349 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6348, i32 0, i32 4
%.tmp6350 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6349
%.tmp6351 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6347, %m1861$.Type.type* %.tmp6350)
%index_type.6352 = alloca i8*
store i8* %.tmp6351, i8** %index_type.6352
%.tmp6353 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6354 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6353, i32 0, i32 4
%.tmp6355 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6354
%.tmp6356 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6355, i32 0, i32 1
%.tmp6357 = load i8*, i8** %.tmp6356
%.tmp6358 = icmp ne i8* %.tmp6357, null
br i1 %.tmp6358, label %.if.true.6359, label %.if.false.6359
.if.true.6359:
%.tmp6360 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6361 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6360, i32 0, i32 4
%.tmp6362 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6361
%.tmp6363 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6362, i32 0, i32 1
%.tmp6364 = load i8*, i8** %.tmp6363
%.tmp6366 = getelementptr [6 x i8], [6 x i8]*@.str6365, i32 0, i32 0
%.tmp6367 = call i32(i8*,i8*) @strcmp(i8* %.tmp6364, i8* %.tmp6366)
%.tmp6368 = icmp eq i32 %.tmp6367, 0
br i1 %.tmp6368, label %.if.true.6369, label %.if.false.6369
.if.true.6369:
%.tmp6370 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6371 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6370)
%new_base.6372 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6371, %m1861$.AssignableInfo.type** %new_base.6372
%.tmp6373 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6374 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6372
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6373, %m1861$.AssignableInfo.type* %.tmp6374)
%.tmp6375 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6376 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6375, i32 0, i32 1
%.tmp6377 = load %m0$.File.type*, %m0$.File.type** %.tmp6376
%.tmp6379 = getelementptr [45 x i8], [45 x i8]*@.str6378, i32 0, i32 0
%.tmp6380 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6372
%.tmp6381 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6380)
%.tmp6382 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6383 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6384 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6383, i32 0, i32 4
%.tmp6385 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6384
%.tmp6386 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6382, %m1861$.Type.type* %.tmp6385)
%.tmp6387 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6388 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6389 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6388, i32 0, i32 4
%.tmp6390 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6389
%.tmp6391 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6387, %m1861$.Type.type* %.tmp6390)
%.tmp6392 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6393 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6392)
%.tmp6394 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6377, i8* %.tmp6379, i8* %.tmp6381, i8* %.tmp6386, i8* %.tmp6391, i8* %.tmp6393)
%.tmp6395 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6372
%.tmp6396 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6395, i32 0, i32 4
%.tmp6397 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6398 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6397, i32 0, i32 4
%.tmp6399 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6398
%.tmp6400 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6399, i32 0, i32 3
%.tmp6401 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6400
%.tmp6402 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp6401)
store %m1861$.Type.type* %.tmp6402, %m1861$.Type.type** %.tmp6396
%.tmp6403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6372
%.tmp6404 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6403, i32 0, i32 4
%.tmp6405 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6404
%.tmp6406 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6405, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6406
%.tmp6407 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6372
store %m1861$.AssignableInfo.type* %.tmp6407, %m1861$.AssignableInfo.type** %base.6329
br label %.if.end.6369
.if.false.6369:
br label %.if.end.6369
.if.end.6369:
br label %.if.end.6359
.if.false.6359:
br label %.if.end.6359
.if.end.6359:
%.tmp6408 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6409 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6410 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6409, i32 0, i32 4
%.tmp6411 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6410
%.tmp6412 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6408, %m1861$.Type.type* %.tmp6411)
%base_type.6413 = alloca i8*
store i8* %.tmp6412, i8** %base_type.6413
%.tmp6414 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6415 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6414)
%tmp_id.6416 = alloca i32
store i32 %.tmp6415, i32* %tmp_id.6416
%.tmp6417 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6418 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6417, i32 0, i32 1
%.tmp6419 = load %m0$.File.type*, %m0$.File.type** %.tmp6418
%.tmp6421 = getelementptr [28 x i8], [28 x i8]*@.str6420, i32 0, i32 0
%.tmp6422 = load i32, i32* %tmp_id.6416
%.tmp6423 = load i8*, i8** %base_type.6413
%.tmp6424 = load i8*, i8** %base_type.6413
%.tmp6425 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6426 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6425)
%.tmp6427 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6419, i8* %.tmp6421, i32 %.tmp6422, i8* %.tmp6423, i8* %.tmp6424, i8* %.tmp6426)
%.tmp6428 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6187
%.tmp6429 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6428)
%new_base.6430 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6429, %m1861$.AssignableInfo.type** %new_base.6430
%.tmp6431 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6432 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6430
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6431, %m1861$.AssignableInfo.type* %.tmp6432)
%.tmp6433 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6434 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6433, i32 0, i32 4
%.tmp6435 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6434
%.tmp6436 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6435, i32 0, i32 3
%.tmp6437 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6436
%.tmp6438 = icmp eq %m1861$.Type.type* %.tmp6437, null
br i1 %.tmp6438, label %.if.true.6439, label %.if.false.6439
.if.true.6439:
%.tmp6440 = getelementptr i8*, i8** %err_msg.6185, i32 0
%.tmp6442 = getelementptr [35 x i8], [35 x i8]*@.str6441, i32 0, i32 0
%.tmp6443 = load i8*, i8** %base_type.6413
%.tmp6444 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6440, i8* %.tmp6442, i8* %.tmp6443)
%.tmp6445 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6446 = load %m307$.Node.type*, %m307$.Node.type** %addr.6336
%.tmp6447 = load i8*, i8** %err_msg.6185
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6445, %m307$.Node.type* %.tmp6446, i8* %.tmp6447)
%.tmp6448 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
ret %m1861$.AssignableInfo.type* %.tmp6448
br label %.if.end.6439
.if.false.6439:
br label %.if.end.6439
.if.end.6439:
%.tmp6449 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6430
%.tmp6450 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6449, i32 0, i32 4
%.tmp6451 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
%.tmp6452 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6451, i32 0, i32 4
%.tmp6453 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6452
%.tmp6454 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6453, i32 0, i32 3
%.tmp6455 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6454
store %m1861$.Type.type* %.tmp6455, %m1861$.Type.type** %.tmp6450
%.tmp6456 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6457 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6430
%.tmp6458 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6457, i32 0, i32 4
%.tmp6459 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6458
%.tmp6460 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6456, %m1861$.Type.type* %.tmp6459)
%base_type_2.6461 = alloca i8*
store i8* %.tmp6460, i8** %base_type_2.6461
%.tmp6462 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6463 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6462, i32 0, i32 1
%.tmp6464 = load %m0$.File.type*, %m0$.File.type** %.tmp6463
%.tmp6466 = getelementptr [44 x i8], [44 x i8]*@.str6465, i32 0, i32 0
%.tmp6467 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6430
%.tmp6468 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6467)
%.tmp6469 = load i8*, i8** %base_type_2.6461
%.tmp6470 = load i8*, i8** %base_type_2.6461
%.tmp6471 = load i32, i32* %tmp_id.6416
%.tmp6472 = load i8*, i8** %index_type.6352
%.tmp6473 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6346
%.tmp6474 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6473)
%.tmp6475 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6464, i8* %.tmp6466, i8* %.tmp6468, i8* %.tmp6469, i8* %.tmp6470, i32 %.tmp6471, i8* %.tmp6472, i8* %.tmp6474)
%.tmp6476 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6430
store %m1861$.AssignableInfo.type* %.tmp6476, %m1861$.AssignableInfo.type** %base.6329
%.tmp6477 = load %m307$.Node.type*, %m307$.Node.type** %addr.6336
%.tmp6478 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6477, i32 0, i32 7
%.tmp6479 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6478
%.tmp6480 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6479, i32 0, i32 7
%.tmp6481 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6480
%.tmp6482 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6481, i32 0, i32 7
%.tmp6483 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6482
store %m307$.Node.type* %.tmp6483, %m307$.Node.type** %addr.6336
br label %.for.start.6330
.for.end.6330:
%.tmp6484 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6329
ret %m1861$.AssignableInfo.type* %.tmp6484
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6485 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6486 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6485, i32 0, i32 6
%.tmp6487 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6486
%.tmp6489 = getelementptr [16 x i8], [16 x i8]*@.str6488, i32 0, i32 0
%.tmp6490 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6487, i8* %.tmp6489)
%assignable_start.6491 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6490, %m307$.Node.type** %assignable_start.6491
%.tmp6492 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6491
%.tmp6493 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6492)
%operator_stack.6494 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6493, %m1988$.SYStack.type** %operator_stack.6494
%.tmp6495 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6496 = ptrtoint %m1861$.StackHead.type* %.tmp6495 to i32
%.tmp6497 = call i8*(i32) @malloc(i32 %.tmp6496)
%.tmp6498 = bitcast i8* %.tmp6497 to %m1861$.StackHead.type*
%stack.6499 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6498, %m1861$.StackHead.type** %stack.6499
%.tmp6500 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6499
%.tmp6501 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6500, i32 0, i32 0
%.tmp6502 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6494
store %m1988$.SYStack.type* %.tmp6502, %m1988$.SYStack.type** %.tmp6501
%.tmp6503 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6504 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6499
%.tmp6505 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6503, %m1861$.StackHead.type* %.tmp6504)
%info.6506 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6505, %m1861$.AssignableInfo.type** %info.6506
%.tmp6507 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6508 = icmp eq %m1861$.AssignableInfo.type* %.tmp6507, null
br i1 %.tmp6508, label %.if.true.6509, label %.if.false.6509
.if.true.6509:
%.tmp6510 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
ret %m1861$.AssignableInfo.type* %.tmp6510
br label %.if.end.6509
.if.false.6509:
br label %.if.end.6509
.if.end.6509:
%.tmp6511 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6512 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6511, i32 0, i32 6
%.tmp6513 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6512
%.tmp6515 = getelementptr [5 x i8], [5 x i8]*@.str6514, i32 0, i32 0
%.tmp6516 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6513, i8* %.tmp6515)
%cast.6517 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6516, %m307$.Node.type** %cast.6517
%.tmp6518 = load %m307$.Node.type*, %m307$.Node.type** %cast.6517
%.tmp6519 = icmp ne %m307$.Node.type* %.tmp6518, null
br i1 %.tmp6519, label %.if.true.6520, label %.if.false.6520
.if.true.6520:
%.tmp6521 = load %m307$.Node.type*, %m307$.Node.type** %cast.6517
%.tmp6522 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6521, i32 0, i32 6
%.tmp6523 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6522
%.tmp6525 = getelementptr [5 x i8], [5 x i8]*@.str6524, i32 0, i32 0
%.tmp6526 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6523, i8* %.tmp6525)
%cast_type.6527 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6526, %m307$.Node.type** %cast_type.6527
%.tmp6528 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6529 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6527
%.tmp6530 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6529, i32 0, i32 6
%.tmp6531 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6530
%.tmp6532 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6528, %m307$.Node.type* %.tmp6531)
%type.6533 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6532, %m1861$.Type.type** %type.6533
%.tmp6534 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6535 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6534)
%prev_id.6536 = alloca i8*
store i8* %.tmp6535, i8** %prev_id.6536
%.tmp6537 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6538 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6537, %m1861$.AssignableInfo.type* %.tmp6538)
%.tmp6539 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6540 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6541 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6540, i32 0, i32 4
%.tmp6542 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6541
%.tmp6543 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6539, %m1861$.Type.type* %.tmp6542)
%from_type.6544 = alloca i8*
store i8* %.tmp6543, i8** %from_type.6544
%.tmp6545 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6546 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6533
%.tmp6547 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6545, %m1861$.Type.type* %.tmp6546)
%to_type.6548 = alloca i8*
store i8* %.tmp6547, i8** %to_type.6548
%.tmp6550 = getelementptr [8 x i8], [8 x i8]*@.str6549, i32 0, i32 0
%cast_fn.6551 = alloca i8*
store i8* %.tmp6550, i8** %cast_fn.6551
%.tmp6552 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6553 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6552, i32 0, i32 4
%.tmp6554 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6553
%.tmp6555 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6554, i32 0, i32 1
%.tmp6556 = load i8*, i8** %.tmp6555
%.tmp6557 = icmp ne i8* %.tmp6556, null
br i1 %.tmp6557, label %.if.true.6558, label %.if.false.6558
.if.true.6558:
%.tmp6559 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6560 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6559, i32 0, i32 4
%.tmp6561 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6560
%.tmp6562 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6561, i32 0, i32 1
%.tmp6563 = load i8*, i8** %.tmp6562
%.tmp6565 = getelementptr [6 x i8], [6 x i8]*@.str6564, i32 0, i32 0
%.tmp6566 = call i32(i8*,i8*) @strcmp(i8* %.tmp6563, i8* %.tmp6565)
%.tmp6567 = icmp eq i32 %.tmp6566, 0
br i1 %.tmp6567, label %.if.true.6568, label %.if.false.6568
.if.true.6568:
%.tmp6570 = getelementptr [48 x i8], [48 x i8]*@.str6569, i32 0, i32 0
%.tmp6571 = call i32(i8*,...) @printf(i8* %.tmp6570)
br label %.if.end.6568
.if.false.6568:
br label %.if.end.6568
.if.end.6568:
br label %.if.end.6558
.if.false.6558:
br label %.if.end.6558
.if.end.6558:
%.tmp6572 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6573 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6572, i32 0, i32 4
%.tmp6574 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6573
%.tmp6575 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6574, i32 0, i32 0
%.tmp6576 = load i8*, i8** %.tmp6575
%.tmp6578 = getelementptr [4 x i8], [4 x i8]*@.str6577, i32 0, i32 0
%.tmp6579 = call i32(i8*,i8*) @strcmp(i8* %.tmp6576, i8* %.tmp6578)
%.tmp6580 = icmp ne i32 %.tmp6579, 0
%.tmp6581 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6533
%.tmp6582 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6581, i32 0, i32 0
%.tmp6583 = load i8*, i8** %.tmp6582
%.tmp6585 = getelementptr [4 x i8], [4 x i8]*@.str6584, i32 0, i32 0
%.tmp6586 = call i32(i8*,i8*) @strcmp(i8* %.tmp6583, i8* %.tmp6585)
%.tmp6587 = icmp ne i32 %.tmp6586, 0
%.tmp6588 = and i1 %.tmp6580, %.tmp6587
br i1 %.tmp6588, label %.if.true.6589, label %.if.false.6589
.if.true.6589:
%.tmp6590 = load i8*, i8** %from_type.6544
%.tmp6591 = getelementptr i8, i8* %.tmp6590, i32 0
%.tmp6592 = load i8, i8* %.tmp6591
%.tmp6593 = icmp eq i8 %.tmp6592, 105
%.tmp6594 = load i8*, i8** %to_type.6548
%.tmp6595 = getelementptr i8, i8* %.tmp6594, i32 0
%.tmp6596 = load i8, i8* %.tmp6595
%.tmp6597 = icmp eq i8 %.tmp6596, 105
%.tmp6598 = and i1 %.tmp6593, %.tmp6597
br i1 %.tmp6598, label %.if.true.6599, label %.if.false.6599
.if.true.6599:
%from_size.6600 = alloca i32
store i32 0, i32* %from_size.6600
%to_size.6601 = alloca i32
store i32 0, i32* %to_size.6601
%.tmp6602 = load i8*, i8** %from_type.6544
%.tmp6604 = getelementptr [4 x i8], [4 x i8]*@.str6603, i32 0, i32 0
%.tmp6605 = getelementptr i32, i32* %from_size.6600, i32 0
%.tmp6606 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6602, i8* %.tmp6604, i32* %.tmp6605)
%.tmp6607 = load i8*, i8** %to_type.6548
%.tmp6609 = getelementptr [4 x i8], [4 x i8]*@.str6608, i32 0, i32 0
%.tmp6610 = getelementptr i32, i32* %to_size.6601, i32 0
%.tmp6611 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6607, i8* %.tmp6609, i32* %.tmp6610)
%.tmp6612 = load i32, i32* %from_size.6600
%.tmp6613 = load i32, i32* %to_size.6601
%.tmp6614 = icmp slt i32 %.tmp6612, %.tmp6613
br i1 %.tmp6614, label %.if.true.6615, label %.if.false.6615
.if.true.6615:
%.tmp6617 = getelementptr [5 x i8], [5 x i8]*@.str6616, i32 0, i32 0
store i8* %.tmp6617, i8** %cast_fn.6551
br label %.if.end.6615
.if.false.6615:
%.tmp6619 = getelementptr [6 x i8], [6 x i8]*@.str6618, i32 0, i32 0
store i8* %.tmp6619, i8** %cast_fn.6551
br label %.if.end.6615
.if.end.6615:
br label %.if.end.6599
.if.false.6599:
br label %.if.end.6599
.if.end.6599:
br label %.if.end.6589
.if.false.6589:
br label %.if.end.6589
.if.end.6589:
%.tmp6620 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6621 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6620, i32 0, i32 1
%.tmp6622 = load %m0$.File.type*, %m0$.File.type** %.tmp6621
%.tmp6624 = getelementptr [21 x i8], [21 x i8]*@.str6623, i32 0, i32 0
%.tmp6625 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6626 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6625)
%.tmp6627 = load i8*, i8** %cast_fn.6551
%.tmp6628 = load i8*, i8** %from_type.6544
%.tmp6629 = load i8*, i8** %prev_id.6536
%.tmp6630 = load i8*, i8** %to_type.6548
%.tmp6631 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6622, i8* %.tmp6624, i8* %.tmp6626, i8* %.tmp6627, i8* %.tmp6628, i8* %.tmp6629, i8* %.tmp6630)
%.tmp6632 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
%.tmp6633 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6632, i32 0, i32 4
%.tmp6634 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6533
store %m1861$.Type.type* %.tmp6634, %m1861$.Type.type** %.tmp6633
br label %.if.end.6520
.if.false.6520:
br label %.if.end.6520
.if.end.6520:
%.tmp6635 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6506
ret %m1861$.AssignableInfo.type* %.tmp6635
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6636 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6637 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6636, i32 0, i32 0
%.tmp6638 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6637
%.tmp6639 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6638, i32 0, i32 0
%.tmp6640 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6639
%.tmp6641 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6640, i32 0, i32 0
%.tmp6642 = load i8*, i8** %.tmp6641
%.tmp6644 = getelementptr [16 x i8], [16 x i8]*@.str6643, i32 0, i32 0
%.tmp6645 = call i32(i8*,i8*) @strcmp(i8* %.tmp6642, i8* %.tmp6644)
%.tmp6646 = icmp eq i32 %.tmp6645, 0
br i1 %.tmp6646, label %.if.true.6647, label %.if.false.6647
.if.true.6647:
%.tmp6648 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6649 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6650 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6649, i32 0, i32 0
%.tmp6651 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6650
%.tmp6652 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6651, i32 0, i32 0
%.tmp6653 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6652
%.tmp6654 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6648, %m307$.Node.type* %.tmp6653)
ret %m1861$.AssignableInfo.type* %.tmp6654
br label %.if.end.6647
.if.false.6647:
br label %.if.end.6647
.if.end.6647:
%.tmp6655 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6656 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6655, i32 0, i32 0
%.tmp6657 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6656
%.tmp6658 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6657, i32 0, i32 0
%.tmp6659 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6658
%.tmp6660 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6659, i32 0, i32 6
%.tmp6661 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6660
%operator.6662 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6661, %m307$.Node.type** %operator.6662
%.tmp6663 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6664 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6663, i32 0, i32 0
%.tmp6665 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6666 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6665, i32 0, i32 0
%.tmp6667 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6666
%.tmp6668 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6667, i32 0, i32 1
%.tmp6669 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6668
store %m1988$.SYStack.type* %.tmp6669, %m1988$.SYStack.type** %.tmp6664
%.tmp6670 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6671 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6672 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6670, %m1861$.StackHead.type* %.tmp6671)
%A.6673 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6672, %m1861$.AssignableInfo.type** %A.6673
%.tmp6674 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6673
%.tmp6675 = icmp eq %m1861$.AssignableInfo.type* %.tmp6674, null
br i1 %.tmp6675, label %.if.true.6676, label %.if.false.6676
.if.true.6676:
%.tmp6677 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6673
ret %m1861$.AssignableInfo.type* %.tmp6677
br label %.if.end.6676
.if.false.6676:
br label %.if.end.6676
.if.end.6676:
%.tmp6678 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6679 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6678, i32 0, i32 0
%.tmp6680 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6681 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6680, i32 0, i32 0
%.tmp6682 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6681
%.tmp6683 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6682, i32 0, i32 1
%.tmp6684 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6683
store %m1988$.SYStack.type* %.tmp6684, %m1988$.SYStack.type** %.tmp6679
%.tmp6685 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6686 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6687 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6685, %m1861$.StackHead.type* %.tmp6686)
%B.6688 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6687, %m1861$.AssignableInfo.type** %B.6688
%.tmp6689 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6688
%.tmp6690 = icmp eq %m1861$.AssignableInfo.type* %.tmp6689, null
br i1 %.tmp6690, label %.if.true.6691, label %.if.false.6691
.if.true.6691:
%.tmp6692 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6688
ret %m1861$.AssignableInfo.type* %.tmp6692
br label %.if.end.6691
.if.false.6691:
br label %.if.end.6691
.if.end.6691:
%.tmp6693 = bitcast ptr null to %m307$.Node.type*
%.tmp6694 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6693)
%op_info.6695 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6694, %m1861$.AssignableInfo.type** %op_info.6695
%.tmp6696 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6695
%.tmp6697 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6696, i32 0, i32 4
%.tmp6698 = load %m307$.Node.type*, %m307$.Node.type** %operator.6662
%.tmp6699 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6698)
store %m1861$.Type.type* %.tmp6699, %m1861$.Type.type** %.tmp6697
%.tmp6700 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6701 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6695
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6700, %m1861$.AssignableInfo.type* %.tmp6701)
%.tmp6702 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6703 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6702, i32 0, i32 1
%.tmp6704 = load %m0$.File.type*, %m0$.File.type** %.tmp6703
%.tmp6706 = getelementptr [19 x i8], [19 x i8]*@.str6705, i32 0, i32 0
%.tmp6707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6695
%.tmp6708 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6707)
%.tmp6709 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6710 = load %m307$.Node.type*, %m307$.Node.type** %operator.6662
%.tmp6711 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6709, %m307$.Node.type* %.tmp6710)
%.tmp6712 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6713 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6673
%.tmp6714 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6713, i32 0, i32 4
%.tmp6715 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6714
%.tmp6716 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6712, %m1861$.Type.type* %.tmp6715)
%.tmp6717 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6673
%.tmp6718 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6717)
%.tmp6719 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6688
%.tmp6720 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6719)
%.tmp6721 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6704, i8* %.tmp6706, i8* %.tmp6708, i8* %.tmp6711, i8* %.tmp6716, i8* %.tmp6718, i8* %.tmp6720)
%.tmp6722 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6695
ret %m1861$.AssignableInfo.type* %.tmp6722
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6723 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6724 = icmp eq %m307$.Node.type* %.tmp6723, null
br i1 %.tmp6724, label %.if.true.6725, label %.if.false.6725
.if.true.6725:
%.tmp6726 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6727 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6729 = getelementptr [31 x i8], [31 x i8]*@.str6728, i32 0, i32 0
%.tmp6730 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6726, %m307$.Node.type* %.tmp6727, i8* %.tmp6729)
%.tmp6731 = call i32(i8*,...) @printf(i8* %.tmp6730)
br label %.if.end.6725
.if.false.6725:
br label %.if.end.6725
.if.end.6725:
%.tmp6732 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6733 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6732, i32 0, i32 1
%.tmp6734 = load i8*, i8** %.tmp6733
%.tmp6736 = getelementptr [2 x i8], [2 x i8]*@.str6735, i32 0, i32 0
%.tmp6737 = call i32(i8*,i8*) @strcmp(i8* %.tmp6734, i8* %.tmp6736)
%.tmp6738 = icmp eq i32 %.tmp6737, 0
br i1 %.tmp6738, label %.if.true.6739, label %.if.false.6739
.if.true.6739:
%.tmp6741 = getelementptr [4 x i8], [4 x i8]*@.str6740, i32 0, i32 0
ret i8* %.tmp6741
br label %.if.end.6739
.if.false.6739:
%.tmp6742 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6743 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6742, i32 0, i32 1
%.tmp6744 = load i8*, i8** %.tmp6743
%.tmp6746 = getelementptr [2 x i8], [2 x i8]*@.str6745, i32 0, i32 0
%.tmp6747 = call i32(i8*,i8*) @strcmp(i8* %.tmp6744, i8* %.tmp6746)
%.tmp6748 = icmp eq i32 %.tmp6747, 0
br i1 %.tmp6748, label %.if.true.6749, label %.if.false.6749
.if.true.6749:
%.tmp6751 = getelementptr [4 x i8], [4 x i8]*@.str6750, i32 0, i32 0
ret i8* %.tmp6751
br label %.if.end.6749
.if.false.6749:
%.tmp6752 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6753 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6752, i32 0, i32 1
%.tmp6754 = load i8*, i8** %.tmp6753
%.tmp6756 = getelementptr [2 x i8], [2 x i8]*@.str6755, i32 0, i32 0
%.tmp6757 = call i32(i8*,i8*) @strcmp(i8* %.tmp6754, i8* %.tmp6756)
%.tmp6758 = icmp eq i32 %.tmp6757, 0
br i1 %.tmp6758, label %.if.true.6759, label %.if.false.6759
.if.true.6759:
%.tmp6761 = getelementptr [4 x i8], [4 x i8]*@.str6760, i32 0, i32 0
ret i8* %.tmp6761
br label %.if.end.6759
.if.false.6759:
%.tmp6762 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6763 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6762, i32 0, i32 1
%.tmp6764 = load i8*, i8** %.tmp6763
%.tmp6766 = getelementptr [2 x i8], [2 x i8]*@.str6765, i32 0, i32 0
%.tmp6767 = call i32(i8*,i8*) @strcmp(i8* %.tmp6764, i8* %.tmp6766)
%.tmp6768 = icmp eq i32 %.tmp6767, 0
br i1 %.tmp6768, label %.if.true.6769, label %.if.false.6769
.if.true.6769:
%.tmp6771 = getelementptr [5 x i8], [5 x i8]*@.str6770, i32 0, i32 0
ret i8* %.tmp6771
br label %.if.end.6769
.if.false.6769:
%.tmp6772 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6773 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6772, i32 0, i32 1
%.tmp6774 = load i8*, i8** %.tmp6773
%.tmp6776 = getelementptr [3 x i8], [3 x i8]*@.str6775, i32 0, i32 0
%.tmp6777 = call i32(i8*,i8*) @strcmp(i8* %.tmp6774, i8* %.tmp6776)
%.tmp6778 = icmp eq i32 %.tmp6777, 0
br i1 %.tmp6778, label %.if.true.6779, label %.if.false.6779
.if.true.6779:
%.tmp6781 = getelementptr [8 x i8], [8 x i8]*@.str6780, i32 0, i32 0
ret i8* %.tmp6781
br label %.if.end.6779
.if.false.6779:
%.tmp6782 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6783 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6782, i32 0, i32 1
%.tmp6784 = load i8*, i8** %.tmp6783
%.tmp6786 = getelementptr [3 x i8], [3 x i8]*@.str6785, i32 0, i32 0
%.tmp6787 = call i32(i8*,i8*) @strcmp(i8* %.tmp6784, i8* %.tmp6786)
%.tmp6788 = icmp eq i32 %.tmp6787, 0
br i1 %.tmp6788, label %.if.true.6789, label %.if.false.6789
.if.true.6789:
%.tmp6791 = getelementptr [8 x i8], [8 x i8]*@.str6790, i32 0, i32 0
ret i8* %.tmp6791
br label %.if.end.6789
.if.false.6789:
%.tmp6792 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6793 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6792, i32 0, i32 1
%.tmp6794 = load i8*, i8** %.tmp6793
%.tmp6796 = getelementptr [2 x i8], [2 x i8]*@.str6795, i32 0, i32 0
%.tmp6797 = call i32(i8*,i8*) @strcmp(i8* %.tmp6794, i8* %.tmp6796)
%.tmp6798 = icmp eq i32 %.tmp6797, 0
br i1 %.tmp6798, label %.if.true.6799, label %.if.false.6799
.if.true.6799:
%.tmp6801 = getelementptr [9 x i8], [9 x i8]*@.str6800, i32 0, i32 0
ret i8* %.tmp6801
br label %.if.end.6799
.if.false.6799:
%.tmp6802 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6803 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6802, i32 0, i32 1
%.tmp6804 = load i8*, i8** %.tmp6803
%.tmp6806 = getelementptr [2 x i8], [2 x i8]*@.str6805, i32 0, i32 0
%.tmp6807 = call i32(i8*,i8*) @strcmp(i8* %.tmp6804, i8* %.tmp6806)
%.tmp6808 = icmp eq i32 %.tmp6807, 0
br i1 %.tmp6808, label %.if.true.6809, label %.if.false.6809
.if.true.6809:
%.tmp6811 = getelementptr [9 x i8], [9 x i8]*@.str6810, i32 0, i32 0
ret i8* %.tmp6811
br label %.if.end.6809
.if.false.6809:
%.tmp6812 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6813 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6812, i32 0, i32 1
%.tmp6814 = load i8*, i8** %.tmp6813
%.tmp6816 = getelementptr [2 x i8], [2 x i8]*@.str6815, i32 0, i32 0
%.tmp6817 = call i32(i8*,i8*) @strcmp(i8* %.tmp6814, i8* %.tmp6816)
%.tmp6818 = icmp eq i32 %.tmp6817, 0
br i1 %.tmp6818, label %.if.true.6819, label %.if.false.6819
.if.true.6819:
%.tmp6821 = getelementptr [4 x i8], [4 x i8]*@.str6820, i32 0, i32 0
ret i8* %.tmp6821
br label %.if.end.6819
.if.false.6819:
%.tmp6822 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6823 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6822, i32 0, i32 1
%.tmp6824 = load i8*, i8** %.tmp6823
%.tmp6826 = getelementptr [2 x i8], [2 x i8]*@.str6825, i32 0, i32 0
%.tmp6827 = call i32(i8*,i8*) @strcmp(i8* %.tmp6824, i8* %.tmp6826)
%.tmp6828 = icmp eq i32 %.tmp6827, 0
br i1 %.tmp6828, label %.if.true.6829, label %.if.false.6829
.if.true.6829:
%.tmp6831 = getelementptr [3 x i8], [3 x i8]*@.str6830, i32 0, i32 0
ret i8* %.tmp6831
br label %.if.end.6829
.if.false.6829:
%.tmp6832 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6833 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6832, i32 0, i32 1
%.tmp6834 = load i8*, i8** %.tmp6833
%.tmp6836 = getelementptr [3 x i8], [3 x i8]*@.str6835, i32 0, i32 0
%.tmp6837 = call i32(i8*,i8*) @strcmp(i8* %.tmp6834, i8* %.tmp6836)
%.tmp6838 = icmp eq i32 %.tmp6837, 0
br i1 %.tmp6838, label %.if.true.6839, label %.if.false.6839
.if.true.6839:
%.tmp6841 = getelementptr [9 x i8], [9 x i8]*@.str6840, i32 0, i32 0
ret i8* %.tmp6841
br label %.if.end.6839
.if.false.6839:
%.tmp6842 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6843 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6842, i32 0, i32 1
%.tmp6844 = load i8*, i8** %.tmp6843
%.tmp6846 = getelementptr [3 x i8], [3 x i8]*@.str6845, i32 0, i32 0
%.tmp6847 = call i32(i8*,i8*) @strcmp(i8* %.tmp6844, i8* %.tmp6846)
%.tmp6848 = icmp eq i32 %.tmp6847, 0
br i1 %.tmp6848, label %.if.true.6849, label %.if.false.6849
.if.true.6849:
%.tmp6851 = getelementptr [9 x i8], [9 x i8]*@.str6850, i32 0, i32 0
ret i8* %.tmp6851
br label %.if.end.6849
.if.false.6849:
%.tmp6852 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6853 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6852, i32 0, i32 1
%.tmp6854 = load i8*, i8** %.tmp6853
%.tmp6856 = getelementptr [2 x i8], [2 x i8]*@.str6855, i32 0, i32 0
%.tmp6857 = call i32(i8*,i8*) @strcmp(i8* %.tmp6854, i8* %.tmp6856)
%.tmp6858 = icmp eq i32 %.tmp6857, 0
br i1 %.tmp6858, label %.if.true.6859, label %.if.false.6859
.if.true.6859:
%.tmp6861 = getelementptr [5 x i8], [5 x i8]*@.str6860, i32 0, i32 0
ret i8* %.tmp6861
br label %.if.end.6859
.if.false.6859:
%.tmp6862 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6863 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6865 = getelementptr [30 x i8], [30 x i8]*@.str6864, i32 0, i32 0
%.tmp6866 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6862, %m307$.Node.type* %.tmp6863, i8* %.tmp6865)
%.tmp6867 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6868 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6867, i32 0, i32 1
%.tmp6869 = load i8*, i8** %.tmp6868
%.tmp6870 = call i32(i8*,...) @printf(i8* %.tmp6866, i8* %.tmp6869)
br label %.if.end.6859
.if.end.6859:
br label %.if.end.6849
.if.end.6849:
br label %.if.end.6839
.if.end.6839:
br label %.if.end.6829
.if.end.6829:
br label %.if.end.6819
.if.end.6819:
br label %.if.end.6809
.if.end.6809:
br label %.if.end.6799
.if.end.6799:
br label %.if.end.6789
.if.end.6789:
br label %.if.end.6779
.if.end.6779:
br label %.if.end.6769
.if.end.6769:
br label %.if.end.6759
.if.end.6759:
br label %.if.end.6749
.if.end.6749:
br label %.if.end.6739
.if.end.6739:
%.tmp6872 = getelementptr [4 x i8], [4 x i8]*@.str6871, i32 0, i32 0
ret i8* %.tmp6872
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6873 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6874 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6873, %m1861$.Type.type** %type.6874
%.tmp6875 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6876 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6875, i32 0, i32 1
%.tmp6877 = load i8*, i8** %.tmp6876
%.tmp6879 = getelementptr [3 x i8], [3 x i8]*@.str6878, i32 0, i32 0
%.tmp6880 = call i32(i8*,i8*) @strcmp(i8* %.tmp6877, i8* %.tmp6879)
%.tmp6881 = icmp eq i32 %.tmp6880, 0
%.tmp6882 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6883 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6882, i32 0, i32 1
%.tmp6884 = load i8*, i8** %.tmp6883
%.tmp6886 = getelementptr [3 x i8], [3 x i8]*@.str6885, i32 0, i32 0
%.tmp6887 = call i32(i8*,i8*) @strcmp(i8* %.tmp6884, i8* %.tmp6886)
%.tmp6888 = icmp eq i32 %.tmp6887, 0
%.tmp6889 = or i1 %.tmp6881, %.tmp6888
%.tmp6890 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6891 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6890, i32 0, i32 1
%.tmp6892 = load i8*, i8** %.tmp6891
%.tmp6894 = getelementptr [2 x i8], [2 x i8]*@.str6893, i32 0, i32 0
%.tmp6895 = call i32(i8*,i8*) @strcmp(i8* %.tmp6892, i8* %.tmp6894)
%.tmp6896 = icmp eq i32 %.tmp6895, 0
%.tmp6897 = or i1 %.tmp6889, %.tmp6896
%.tmp6898 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6899 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6898, i32 0, i32 1
%.tmp6900 = load i8*, i8** %.tmp6899
%.tmp6902 = getelementptr [2 x i8], [2 x i8]*@.str6901, i32 0, i32 0
%.tmp6903 = call i32(i8*,i8*) @strcmp(i8* %.tmp6900, i8* %.tmp6902)
%.tmp6904 = icmp eq i32 %.tmp6903, 0
%.tmp6905 = or i1 %.tmp6897, %.tmp6904
%.tmp6906 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6907 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6906, i32 0, i32 1
%.tmp6908 = load i8*, i8** %.tmp6907
%.tmp6910 = getelementptr [2 x i8], [2 x i8]*@.str6909, i32 0, i32 0
%.tmp6911 = call i32(i8*,i8*) @strcmp(i8* %.tmp6908, i8* %.tmp6910)
%.tmp6912 = icmp eq i32 %.tmp6911, 0
%.tmp6913 = or i1 %.tmp6905, %.tmp6912
%.tmp6914 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6914, i32 0, i32 1
%.tmp6916 = load i8*, i8** %.tmp6915
%.tmp6918 = getelementptr [2 x i8], [2 x i8]*@.str6917, i32 0, i32 0
%.tmp6919 = call i32(i8*,i8*) @strcmp(i8* %.tmp6916, i8* %.tmp6918)
%.tmp6920 = icmp eq i32 %.tmp6919, 0
%.tmp6921 = or i1 %.tmp6913, %.tmp6920
%.tmp6922 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6923 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6922, i32 0, i32 1
%.tmp6924 = load i8*, i8** %.tmp6923
%.tmp6926 = getelementptr [3 x i8], [3 x i8]*@.str6925, i32 0, i32 0
%.tmp6927 = call i32(i8*,i8*) @strcmp(i8* %.tmp6924, i8* %.tmp6926)
%.tmp6928 = icmp eq i32 %.tmp6927, 0
%.tmp6929 = or i1 %.tmp6921, %.tmp6928
%.tmp6930 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6931 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6930, i32 0, i32 1
%.tmp6932 = load i8*, i8** %.tmp6931
%.tmp6934 = getelementptr [3 x i8], [3 x i8]*@.str6933, i32 0, i32 0
%.tmp6935 = call i32(i8*,i8*) @strcmp(i8* %.tmp6932, i8* %.tmp6934)
%.tmp6936 = icmp eq i32 %.tmp6935, 0
%.tmp6937 = or i1 %.tmp6929, %.tmp6936
br i1 %.tmp6937, label %.if.true.6938, label %.if.false.6938
.if.true.6938:
%.tmp6939 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6874
%.tmp6940 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6939, i32 0, i32 0
%.tmp6942 = getelementptr [5 x i8], [5 x i8]*@.str6941, i32 0, i32 0
store i8* %.tmp6942, i8** %.tmp6940
br label %.if.end.6938
.if.false.6938:
%.tmp6943 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6874
%.tmp6944 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6943, i32 0, i32 0
%.tmp6946 = getelementptr [4 x i8], [4 x i8]*@.str6945, i32 0, i32 0
store i8* %.tmp6946, i8** %.tmp6944
br label %.if.end.6938
.if.end.6938:
%.tmp6947 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6874
ret %m1861$.Type.type* %.tmp6947
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6948 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6949 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6948, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp6950 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6951 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6950, %m307$.Node.type** %mono.6951
%err_buf.6952 = alloca i8*
store i8* null, i8** %err_buf.6952
%buf.6953 = alloca i8*
store i8* null, i8** %buf.6953
%.tmp6954 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp6955 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6954, i32 0, i32 6
%.tmp6956 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6955
%.tmp6957 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6956, i32 0, i32 0
%.tmp6958 = load i8*, i8** %.tmp6957
%.tmp6960 = getelementptr [7 x i8], [7 x i8]*@.str6959, i32 0, i32 0
%.tmp6961 = call i32(i8*,i8*) @strcmp(i8* %.tmp6958, i8* %.tmp6960)
%.tmp6962 = icmp eq i32 %.tmp6961, 0
br i1 %.tmp6962, label %.if.true.6963, label %.if.false.6963
.if.true.6963:
%.tmp6964 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6965 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6964)
store %m1861$.AssignableInfo.type* %.tmp6965, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp6966 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp6967 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6966, i32 0, i32 4
%.tmp6968 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6968, %m1861$.Type.type** %.tmp6967
%.tmp6969 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp6970 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6969, i32 0, i32 4
%.tmp6971 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6970
%.tmp6972 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6971, i32 0, i32 0
%.tmp6974 = getelementptr [4 x i8], [4 x i8]*@.str6973, i32 0, i32 0
store i8* %.tmp6974, i8** %.tmp6972
%.tmp6975 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp6976 = load i8, i8* @SCOPE_CONST
%.tmp6977 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp6978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6977, i32 0, i32 6
%.tmp6979 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6978
%.tmp6980 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6979, i32 0, i32 1
%.tmp6981 = load i8*, i8** %.tmp6980
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6975, i8 %.tmp6976, i8* %.tmp6981)
br label %.if.end.6963
.if.false.6963:
%.tmp6982 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp6983 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6982, i32 0, i32 6
%.tmp6984 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6983
%.tmp6985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6984, i32 0, i32 0
%.tmp6986 = load i8*, i8** %.tmp6985
%.tmp6988 = getelementptr [5 x i8], [5 x i8]*@.str6987, i32 0, i32 0
%.tmp6989 = call i32(i8*,i8*) @strcmp(i8* %.tmp6986, i8* %.tmp6988)
%.tmp6990 = icmp eq i32 %.tmp6989, 0
br i1 %.tmp6990, label %.if.true.6991, label %.if.false.6991
.if.true.6991:
%.tmp6992 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp6993 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6992, i32 0, i32 6
%.tmp6994 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6993
%.tmp6995 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6994, i32 0, i32 1
%.tmp6996 = load i8*, i8** %.tmp6995
%.tmp6998 = getelementptr [5 x i8], [5 x i8]*@.str6997, i32 0, i32 0
%.tmp6999 = call i32(i8*,i8*) @strcmp(i8* %.tmp6996, i8* %.tmp6998)
%.tmp7000 = icmp ne i32 %.tmp6999, 0
br i1 %.tmp7000, label %.if.true.7001, label %.if.false.7001
.if.true.7001:
%.tmp7002 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7003 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7005 = getelementptr [42 x i8], [42 x i8]*@.str7004, i32 0, i32 0
%.tmp7006 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7002, %m307$.Node.type* %.tmp7003, i8* %.tmp7005)
%.tmp7007 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7008 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7007, i32 0, i32 6
%.tmp7009 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7008
%.tmp7010 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7009, i32 0, i32 1
%.tmp7011 = load i8*, i8** %.tmp7010
%.tmp7012 = call i32(i8*,...) @printf(i8* %.tmp7006, i8* %.tmp7011)
%.tmp7013 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7013
br label %.if.end.7001
.if.false.7001:
br label %.if.end.7001
.if.end.7001:
%.tmp7014 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7015 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7014)
store %m1861$.AssignableInfo.type* %.tmp7015, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7016 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7017 = load i8, i8* @SCOPE_CONST
%.tmp7019 = getelementptr [5 x i8], [5 x i8]*@.str7018, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7016, i8 %.tmp7017, i8* %.tmp7019)
%.tmp7020 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7021 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7020, i32 0, i32 4
%.tmp7022 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7022, %m1861$.Type.type** %.tmp7021
%.tmp7023 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7024 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7023, i32 0, i32 4
%.tmp7025 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7024
%.tmp7026 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7025, i32 0, i32 0
%.tmp7028 = getelementptr [8 x i8], [8 x i8]*@.str7027, i32 0, i32 0
store i8* %.tmp7028, i8** %.tmp7026
br label %.if.end.6991
.if.false.6991:
%.tmp7029 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7030 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7029, i32 0, i32 6
%.tmp7031 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7030
%.tmp7032 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7031, i32 0, i32 0
%.tmp7033 = load i8*, i8** %.tmp7032
%.tmp7035 = getelementptr [17 x i8], [17 x i8]*@.str7034, i32 0, i32 0
%.tmp7036 = call i32(i8*,i8*) @strcmp(i8* %.tmp7033, i8* %.tmp7035)
%.tmp7037 = icmp eq i32 %.tmp7036, 0
br i1 %.tmp7037, label %.if.true.7038, label %.if.false.7038
.if.true.7038:
%.tmp7039 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7040 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7039)
store %m1861$.AssignableInfo.type* %.tmp7040, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7041 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7042 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7041, i32 0, i32 6
%.tmp7043 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7042
%.tmp7044 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7043, i32 0, i32 6
%.tmp7045 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7044
%.tmp7047 = getelementptr [12 x i8], [12 x i8]*@.str7046, i32 0, i32 0
%.tmp7048 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7045, i8* %.tmp7047)
%dest.7049 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7048, %m307$.Node.type** %dest.7049
%.tmp7050 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7051 = load %m307$.Node.type*, %m307$.Node.type** %dest.7049
%.tmp7052 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7050, %m307$.Node.type* %.tmp7051)
%var_info.7053 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7052, %m1861$.AssignableInfo.type** %var_info.7053
%.tmp7054 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7053
%.tmp7055 = icmp eq %m1861$.AssignableInfo.type* %.tmp7054, null
br i1 %.tmp7055, label %.if.true.7056, label %.if.false.7056
.if.true.7056:
%.tmp7057 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
ret %m1861$.AssignableInfo.type* %.tmp7057
br label %.if.end.7056
.if.false.7056:
br label %.if.end.7056
.if.end.7056:
%.tmp7058 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7059 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7053
%.tmp7060 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7059, i32 0, i32 4
%.tmp7061 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7060
%.tmp7062 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7058, %m1861$.Type.type* %.tmp7061)
%var_type_repr.7063 = alloca i8*
store i8* %.tmp7062, i8** %var_type_repr.7063
%.tmp7064 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7065 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7064, %m1861$.AssignableInfo.type* %.tmp7065)
%.tmp7066 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7067 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7066, i32 0, i32 4
%.tmp7068 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7053
%.tmp7069 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7068, i32 0, i32 4
%.tmp7070 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7069
store %m1861$.Type.type* %.tmp7070, %m1861$.Type.type** %.tmp7067
%.tmp7072 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7073 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7072, i32 0, i32 6
%.tmp7074 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7073
%.tmp7075 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7074, i32 0, i32 6
%.tmp7076 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7075
%ptr.7077 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7076, %m307$.Node.type** %ptr.7077
br label %.for.start.7071
.for.start.7071:
%.tmp7078 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7077
%.tmp7079 = load %m307$.Node.type*, %m307$.Node.type** %dest.7049
%.tmp7080 = icmp ne %m307$.Node.type* %.tmp7078, %.tmp7079
br i1 %.tmp7080, label %.for.continue.7071, label %.for.end.7071
.for.continue.7071:
%.tmp7081 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.7082 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7081, %m1861$.Type.type** %type.7082
%.tmp7083 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7082
%.tmp7084 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7083, i32 0, i32 3
%.tmp7085 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7086 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7085, i32 0, i32 4
%.tmp7087 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7086
store %m1861$.Type.type* %.tmp7087, %m1861$.Type.type** %.tmp7084
%.tmp7088 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7082
%.tmp7089 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7088, i32 0, i32 0
%.tmp7091 = getelementptr [4 x i8], [4 x i8]*@.str7090, i32 0, i32 0
store i8* %.tmp7091, i8** %.tmp7089
%.tmp7092 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7093 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7092, i32 0, i32 4
%.tmp7094 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7082
store %m1861$.Type.type* %.tmp7094, %m1861$.Type.type** %.tmp7093
%.tmp7095 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7077
%.tmp7096 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7095, i32 0, i32 7
%.tmp7097 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7096
store %m307$.Node.type* %.tmp7097, %m307$.Node.type** %ptr.7077
br label %.for.start.7071
.for.end.7071:
%.tmp7098 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7099 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7098, i32 0, i32 6
%.tmp7100 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7099
%.tmp7101 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7100, i32 0, i32 6
%.tmp7102 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7101
%.tmp7103 = load %m307$.Node.type*, %m307$.Node.type** %dest.7049
%.tmp7104 = icmp ne %m307$.Node.type* %.tmp7102, %.tmp7103
br i1 %.tmp7104, label %.if.true.7105, label %.if.false.7105
.if.true.7105:
%.tmp7106 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7107 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7106, i32 0, i32 1
%.tmp7108 = load %m0$.File.type*, %m0$.File.type** %.tmp7107
%.tmp7110 = getelementptr [38 x i8], [38 x i8]*@.str7109, i32 0, i32 0
%.tmp7111 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7112 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7111)
%.tmp7113 = load i8*, i8** %var_type_repr.7063
%.tmp7114 = load i8*, i8** %var_type_repr.7063
%.tmp7115 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7053
%.tmp7116 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7115)
%.tmp7117 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7108, i8* %.tmp7110, i8* %.tmp7112, i8* %.tmp7113, i8* %.tmp7114, i8* %.tmp7116)
br label %.if.end.7105
.if.false.7105:
%.tmp7118 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7119 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7118, i32 0, i32 1
%.tmp7120 = load %m0$.File.type*, %m0$.File.type** %.tmp7119
%.tmp7122 = getelementptr [22 x i8], [22 x i8]*@.str7121, i32 0, i32 0
%.tmp7123 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7124 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7123)
%.tmp7125 = load i8*, i8** %var_type_repr.7063
%.tmp7126 = load i8*, i8** %var_type_repr.7063
%.tmp7127 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7053
%.tmp7128 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7127)
%.tmp7129 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7120, i8* %.tmp7122, i8* %.tmp7124, i8* %.tmp7125, i8* %.tmp7126, i8* %.tmp7128)
br label %.if.end.7105
.if.end.7105:
br label %.if.end.7038
.if.false.7038:
%.tmp7130 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7131 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7130, i32 0, i32 6
%.tmp7132 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7131
%.tmp7133 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7132, i32 0, i32 0
%.tmp7134 = load i8*, i8** %.tmp7133
%.tmp7136 = getelementptr [8 x i8], [8 x i8]*@.str7135, i32 0, i32 0
%.tmp7137 = call i32(i8*,i8*) @strcmp(i8* %.tmp7134, i8* %.tmp7136)
%.tmp7138 = icmp eq i32 %.tmp7137, 0
br i1 %.tmp7138, label %.if.true.7139, label %.if.false.7139
.if.true.7139:
%.tmp7140 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7141 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7140)
store %m1861$.AssignableInfo.type* %.tmp7141, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7142 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7143 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7142, i32 0, i32 4
%.tmp7144 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7144, %m1861$.Type.type** %.tmp7143
%.tmp7145 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7146 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7145, i32 0, i32 4
%.tmp7147 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7146
%.tmp7148 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7147, i32 0, i32 0
%.tmp7150 = getelementptr [5 x i8], [5 x i8]*@.str7149, i32 0, i32 0
store i8* %.tmp7150, i8** %.tmp7148
%.tmp7151 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7152 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7151, i32 0, i32 6
%.tmp7153 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7152
%.tmp7154 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7153, i32 0, i32 6
%.tmp7155 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7154
%.tmp7156 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7155, i32 0, i32 1
%.tmp7157 = load i8*, i8** %.tmp7156
%.tmp7159 = getelementptr [6 x i8], [6 x i8]*@.str7158, i32 0, i32 0
%.tmp7160 = call i32(i8*,i8*) @strcmp(i8* %.tmp7157, i8* %.tmp7159)
%.tmp7161 = icmp eq i32 %.tmp7160, 0
br i1 %.tmp7161, label %.if.true.7162, label %.if.false.7162
.if.true.7162:
%.tmp7163 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7164 = load i8, i8* @SCOPE_CONST
%.tmp7166 = getelementptr [2 x i8], [2 x i8]*@.str7165, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7163, i8 %.tmp7164, i8* %.tmp7166)
br label %.if.end.7162
.if.false.7162:
%.tmp7167 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7168 = load i8, i8* @SCOPE_CONST
%.tmp7170 = getelementptr [2 x i8], [2 x i8]*@.str7169, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7167, i8 %.tmp7168, i8* %.tmp7170)
br label %.if.end.7162
.if.end.7162:
br label %.if.end.7139
.if.false.7139:
%.tmp7171 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7172 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7171, i32 0, i32 6
%.tmp7173 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7172
%.tmp7174 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7173, i32 0, i32 0
%.tmp7175 = load i8*, i8** %.tmp7174
%.tmp7177 = getelementptr [8 x i8], [8 x i8]*@.str7176, i32 0, i32 0
%.tmp7178 = call i32(i8*,i8*) @strcmp(i8* %.tmp7175, i8* %.tmp7177)
%.tmp7179 = icmp eq i32 %.tmp7178, 0
br i1 %.tmp7179, label %.if.true.7180, label %.if.false.7180
.if.true.7180:
%.tmp7181 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7182 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7183 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7182, i32 0, i32 6
%.tmp7184 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7183
%.tmp7185 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7184, i32 0, i32 6
%.tmp7186 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7185
%.tmp7187 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7181, %m307$.Node.type* %.tmp7186)
store %m1861$.AssignableInfo.type* %.tmp7187, %m1861$.AssignableInfo.type** %assignable_info.6949
br label %.if.end.7180
.if.false.7180:
%.tmp7188 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7189 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7188, i32 0, i32 6
%.tmp7190 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7189
%.tmp7191 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7190, i32 0, i32 0
%.tmp7192 = load i8*, i8** %.tmp7191
%.tmp7194 = getelementptr [7 x i8], [7 x i8]*@.str7193, i32 0, i32 0
%.tmp7195 = call i32(i8*,i8*) @strcmp(i8* %.tmp7192, i8* %.tmp7194)
%.tmp7196 = icmp eq i32 %.tmp7195, 0
br i1 %.tmp7196, label %.if.true.7197, label %.if.false.7197
.if.true.7197:
%.tmp7198 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7199 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7200 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7199, i32 0, i32 6
%.tmp7201 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7200
%.tmp7202 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7201, i32 0, i32 1
%.tmp7203 = load i8*, i8** %.tmp7202
%.tmp7204 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp7198, i8* %.tmp7203)
%string_info.7205 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7204, %m1861$.AssignableInfo.type** %string_info.7205
%.tmp7206 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7207 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7206)
store %m1861$.AssignableInfo.type* %.tmp7207, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7208 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7209 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7208, %m1861$.AssignableInfo.type* %.tmp7209)
%.tmp7210 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7211 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7205
%.tmp7212 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7211, i32 0, i32 4
%.tmp7213 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7212
%.tmp7214 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7210, %m1861$.Type.type* %.tmp7213)
%str_tr.7215 = alloca i8*
store i8* %.tmp7214, i8** %str_tr.7215
%.tmp7216 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7217 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7216, i32 0, i32 1
%.tmp7218 = load %m0$.File.type*, %m0$.File.type** %.tmp7217
%.tmp7220 = getelementptr [44 x i8], [44 x i8]*@.str7219, i32 0, i32 0
%.tmp7221 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7222 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7221)
%.tmp7223 = load i8*, i8** %str_tr.7215
%.tmp7224 = load i8*, i8** %str_tr.7215
%.tmp7225 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7205
%.tmp7226 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7225)
%.tmp7227 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7218, i8* %.tmp7220, i8* %.tmp7222, i8* %.tmp7223, i8* %.tmp7224, i8* %.tmp7226)
%.tmp7228 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7229 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7228, i32 0, i32 4
%.tmp7230 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7230, %m1861$.Type.type** %.tmp7229
%.tmp7231 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7232 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7231, i32 0, i32 4
%.tmp7233 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7232
%.tmp7234 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7233, i32 0, i32 0
%.tmp7236 = getelementptr [4 x i8], [4 x i8]*@.str7235, i32 0, i32 0
store i8* %.tmp7236, i8** %.tmp7234
%.tmp7237 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7238 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7237, i32 0, i32 4
%.tmp7239 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7238
%.tmp7240 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7239, i32 0, i32 3
%.tmp7241 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7241, %m1861$.Type.type** %.tmp7240
%.tmp7242 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7243 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7242, i32 0, i32 4
%.tmp7244 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7243
%.tmp7245 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7244, i32 0, i32 3
%.tmp7246 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7245
%.tmp7247 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7246, i32 0, i32 0
%.tmp7249 = getelementptr [4 x i8], [4 x i8]*@.str7248, i32 0, i32 0
store i8* %.tmp7249, i8** %.tmp7247
br label %.if.end.7197
.if.false.7197:
%.tmp7250 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7251 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7250, i32 0, i32 6
%.tmp7252 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7251
%.tmp7253 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7252, i32 0, i32 0
%.tmp7254 = load i8*, i8** %.tmp7253
%.tmp7256 = getelementptr [4 x i8], [4 x i8]*@.str7255, i32 0, i32 0
%.tmp7257 = call i32(i8*,i8*) @strcmp(i8* %.tmp7254, i8* %.tmp7256)
%.tmp7258 = icmp eq i32 %.tmp7257, 0
br i1 %.tmp7258, label %.if.true.7259, label %.if.false.7259
.if.true.7259:
%.tmp7260 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7261 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7260)
store %m1861$.AssignableInfo.type* %.tmp7261, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7262 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7263 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7262, i32 0, i32 6
%.tmp7264 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7263
%.tmp7265 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7264, i32 0, i32 1
%.tmp7266 = load i8*, i8** %.tmp7265
%.tmp7267 = call i32(i8*) @strlen(i8* %.tmp7266)
%chr_len.7268 = alloca i32
store i32 %.tmp7267, i32* %chr_len.7268
%.tmp7269 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7270 = load i8, i8* @SCOPE_CONST
%.tmp7272 = getelementptr [2 x i8], [2 x i8]*@.str7271, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7269, i8 %.tmp7270, i8* %.tmp7272)
%.tmp7273 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7274 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7273, i32 0, i32 0
%.tmp7275 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7276 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7275, i32 0, i32 6
%.tmp7277 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7276
%.tmp7278 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7277, i32 0, i32 1
%.tmp7279 = load i8*, i8** %.tmp7278
%.tmp7280 = call i8*(i8*) @m2233$chr_to_llvm.cp.cp(i8* %.tmp7279)
store i8* %.tmp7280, i8** %.tmp7274
%.tmp7281 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7282 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7281, i32 0, i32 0
%.tmp7283 = load i8*, i8** %.tmp7282
%.tmp7284 = icmp eq i8* %.tmp7283, null
br i1 %.tmp7284, label %.if.true.7285, label %.if.false.7285
.if.true.7285:
%.tmp7286 = getelementptr i8*, i8** %err_buf.6952, i32 0
%.tmp7288 = getelementptr [22 x i8], [22 x i8]*@.str7287, i32 0, i32 0
%.tmp7289 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7290 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7289, i32 0, i32 6
%.tmp7291 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7290
%.tmp7292 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7291, i32 0, i32 1
%.tmp7293 = load i8*, i8** %.tmp7292
%.tmp7294 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7286, i8* %.tmp7288, i8* %.tmp7293)
%.tmp7295 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7295
br label %.if.end.7285
.if.false.7285:
br label %.if.end.7285
.if.end.7285:
%.tmp7296 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7297 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7296, i32 0, i32 4
%.tmp7298 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7298, %m1861$.Type.type** %.tmp7297
%.tmp7299 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7300 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7299, i32 0, i32 4
%.tmp7301 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7300
%.tmp7302 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7301, i32 0, i32 0
%.tmp7304 = getelementptr [4 x i8], [4 x i8]*@.str7303, i32 0, i32 0
store i8* %.tmp7304, i8** %.tmp7302
br label %.if.end.7259
.if.false.7259:
%.tmp7305 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7306 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7308 = getelementptr [40 x i8], [40 x i8]*@.str7307, i32 0, i32 0
%.tmp7309 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7305, %m307$.Node.type* %.tmp7306, i8* %.tmp7308)
%.tmp7310 = load %m307$.Node.type*, %m307$.Node.type** %mono.6951
%.tmp7311 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7310, i32 0, i32 6
%.tmp7312 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7311
%.tmp7313 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7312, i32 0, i32 0
%.tmp7314 = load i8*, i8** %.tmp7313
%.tmp7315 = call i32(i8*,...) @printf(i8* %.tmp7309, i8* %.tmp7314)
%.tmp7316 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7316
br label %.if.end.7259
.if.end.7259:
br label %.if.end.7197
.if.end.7197:
br label %.if.end.7180
.if.end.7180:
br label %.if.end.7139
.if.end.7139:
br label %.if.end.7038
.if.end.7038:
br label %.if.end.6991
.if.end.6991:
br label %.if.end.6963
.if.end.6963:
%.tmp7317 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7318 = icmp eq %m1861$.AssignableInfo.type* %.tmp7317, null
br i1 %.tmp7318, label %.if.true.7319, label %.if.false.7319
.if.true.7319:
%.tmp7320 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7320
br label %.if.end.7319
.if.false.7319:
br label %.if.end.7319
.if.end.7319:
%.tmp7321 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7322 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7321, i32 0, i32 5
%.tmp7323 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7324 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7323, i32 0, i32 3
%.tmp7325 = load i32, i32* %.tmp7324
store i32 %.tmp7325, i32* %.tmp7322
%.tmp7326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7327 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7326, i32 0, i32 6
%.tmp7328 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7329 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7328, i32 0, i32 4
%.tmp7330 = load i32, i32* %.tmp7329
store i32 %.tmp7330, i32* %.tmp7327
%.tmp7331 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6949
%.tmp7332 = bitcast %m1861$.AssignableInfo.type* %.tmp7331 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7332
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7333 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7334 = icmp ne %m1861$.Type.type* %.tmp7333, null
%.tmp7336 = getelementptr [22 x i8], [22 x i8]*@.str7335, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7334, i8* %.tmp7336)
%.tmp7337 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7338 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7337, i32 0, i32 0
%.tmp7339 = load i8*, i8** %.tmp7338
%.tmp7340 = icmp ne i8* %.tmp7339, null
%.tmp7342 = getelementptr [59 x i8], [59 x i8]*@.str7341, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7340, i8* %.tmp7342)
%.tmp7343 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7344 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7343, i32 0, i32 0
%.tmp7345 = load i8*, i8** %.tmp7344
%.tmp7347 = getelementptr [4 x i8], [4 x i8]*@.str7346, i32 0, i32 0
%.tmp7348 = call i32(i8*,i8*) @strcmp(i8* %.tmp7345, i8* %.tmp7347)
%.tmp7349 = icmp eq i32 %.tmp7348, 0
br i1 %.tmp7349, label %.if.true.7350, label %.if.false.7350
.if.true.7350:
%.tmp7352 = getelementptr [2 x i8], [2 x i8]*@.str7351, i32 0, i32 0
ret i8* %.tmp7352
br label %.if.end.7350
.if.false.7350:
%.tmp7353 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7354 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7353, i32 0, i32 0
%.tmp7355 = load i8*, i8** %.tmp7354
%.tmp7357 = getelementptr [5 x i8], [5 x i8]*@.str7356, i32 0, i32 0
%.tmp7358 = call i32(i8*,i8*) @strcmp(i8* %.tmp7355, i8* %.tmp7357)
%.tmp7359 = icmp eq i32 %.tmp7358, 0
br i1 %.tmp7359, label %.if.true.7360, label %.if.false.7360
.if.true.7360:
%.tmp7362 = getelementptr [2 x i8], [2 x i8]*@.str7361, i32 0, i32 0
ret i8* %.tmp7362
br label %.if.end.7360
.if.false.7360:
%.tmp7363 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7364 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7363, i32 0, i32 0
%.tmp7365 = load i8*, i8** %.tmp7364
%.tmp7367 = getelementptr [5 x i8], [5 x i8]*@.str7366, i32 0, i32 0
%.tmp7368 = call i32(i8*,i8*) @strcmp(i8* %.tmp7365, i8* %.tmp7367)
%.tmp7369 = icmp eq i32 %.tmp7368, 0
br i1 %.tmp7369, label %.if.true.7370, label %.if.false.7370
.if.true.7370:
%.tmp7372 = getelementptr [2 x i8], [2 x i8]*@.str7371, i32 0, i32 0
ret i8* %.tmp7372
br label %.if.end.7370
.if.false.7370:
%.tmp7373 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7374 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7373, i32 0, i32 0
%.tmp7375 = load i8*, i8** %.tmp7374
%.tmp7377 = getelementptr [4 x i8], [4 x i8]*@.str7376, i32 0, i32 0
%.tmp7378 = call i32(i8*,i8*) @strcmp(i8* %.tmp7375, i8* %.tmp7377)
%.tmp7379 = icmp eq i32 %.tmp7378, 0
br i1 %.tmp7379, label %.if.true.7380, label %.if.false.7380
.if.true.7380:
%.tmp7382 = getelementptr [2 x i8], [2 x i8]*@.str7381, i32 0, i32 0
ret i8* %.tmp7382
br label %.if.end.7380
.if.false.7380:
%.tmp7383 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7384 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7383, i32 0, i32 0
%.tmp7385 = load i8*, i8** %.tmp7384
%.tmp7387 = getelementptr [4 x i8], [4 x i8]*@.str7386, i32 0, i32 0
%.tmp7388 = call i32(i8*,i8*) @strcmp(i8* %.tmp7385, i8* %.tmp7387)
%.tmp7389 = icmp eq i32 %.tmp7388, 0
br i1 %.tmp7389, label %.if.true.7390, label %.if.false.7390
.if.true.7390:
%buf.7391 = alloca i8*
store i8* null, i8** %buf.7391
%.tmp7392 = getelementptr i8*, i8** %buf.7391, i32 0
%.tmp7394 = getelementptr [4 x i8], [4 x i8]*@.str7393, i32 0, i32 0
%.tmp7395 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7396 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7395, i32 0, i32 3
%.tmp7397 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7396
%.tmp7398 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7397)
%.tmp7399 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7392, i8* %.tmp7394, i8* %.tmp7398)
%.tmp7400 = load i8*, i8** %buf.7391
ret i8* %.tmp7400
br label %.if.end.7390
.if.false.7390:
%.tmp7401 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7402 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7401, i32 0, i32 0
%.tmp7403 = load i8*, i8** %.tmp7402
%.tmp7405 = getelementptr [10 x i8], [10 x i8]*@.str7404, i32 0, i32 0
%.tmp7406 = call i32(i8*,i8*) @strcmp(i8* %.tmp7403, i8* %.tmp7405)
%.tmp7407 = icmp eq i32 %.tmp7406, 0
br i1 %.tmp7407, label %.if.true.7408, label %.if.false.7408
.if.true.7408:
%.tmp7409 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7410 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7409, i32 0, i32 2
%.tmp7411 = load i8*, i8** %.tmp7410
ret i8* %.tmp7411
br label %.if.end.7408
.if.false.7408:
%.tmp7412 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7413 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7412, i32 0, i32 0
%.tmp7414 = load i8*, i8** %.tmp7413
%.tmp7416 = getelementptr [7 x i8], [7 x i8]*@.str7415, i32 0, i32 0
%.tmp7417 = call i32(i8*,i8*) @strcmp(i8* %.tmp7414, i8* %.tmp7416)
%.tmp7418 = icmp eq i32 %.tmp7417, 0
br i1 %.tmp7418, label %.if.true.7419, label %.if.false.7419
.if.true.7419:
%.tmp7421 = getelementptr [2 x i8], [2 x i8]*@.str7420, i32 0, i32 0
%buf.7422 = alloca i8*
store i8* %.tmp7421, i8** %buf.7422
%.tmp7424 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7425 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7424, i32 0, i32 3
%.tmp7426 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7425
%t.7427 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7426, %m1861$.Type.type** %t.7427
br label %.for.start.7423
.for.start.7423:
%.tmp7428 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7427
%.tmp7429 = icmp ne %m1861$.Type.type* %.tmp7428, null
br i1 %.tmp7429, label %.for.continue.7423, label %.for.end.7423
.for.continue.7423:
%.tmp7430 = getelementptr i8*, i8** %buf.7422, i32 0
%.tmp7432 = getelementptr [5 x i8], [5 x i8]*@.str7431, i32 0, i32 0
%.tmp7433 = load i8*, i8** %buf.7422
%.tmp7434 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7427
%.tmp7435 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7434)
%.tmp7436 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7430, i8* %.tmp7432, i8* %.tmp7433, i8* %.tmp7435)
%.tmp7437 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7427
%.tmp7438 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7437, i32 0, i32 4
%.tmp7439 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7438
store %m1861$.Type.type* %.tmp7439, %m1861$.Type.type** %t.7427
br label %.for.start.7423
.for.end.7423:
%.tmp7440 = load i8*, i8** %buf.7422
ret i8* %.tmp7440
br label %.if.end.7419
.if.false.7419:
%.tmp7441 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7442 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7441, i32 0, i32 0
%.tmp7443 = load i8*, i8** %.tmp7442
%.tmp7445 = getelementptr [9 x i8], [9 x i8]*@.str7444, i32 0, i32 0
%.tmp7446 = call i32(i8*,i8*) @strcmp(i8* %.tmp7443, i8* %.tmp7445)
%.tmp7447 = icmp eq i32 %.tmp7446, 0
br i1 %.tmp7447, label %.if.true.7448, label %.if.false.7448
.if.true.7448:
%.tmp7450 = getelementptr [2 x i8], [2 x i8]*@.str7449, i32 0, i32 0
ret i8* %.tmp7450
br label %.if.end.7448
.if.false.7448:
%.tmp7451 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7452 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7451, i32 0, i32 0
%.tmp7453 = load i8*, i8** %.tmp7452
%.tmp7455 = getelementptr [6 x i8], [6 x i8]*@.str7454, i32 0, i32 0
%.tmp7456 = call i32(i8*,i8*) @strcmp(i8* %.tmp7453, i8* %.tmp7455)
%.tmp7457 = icmp eq i32 %.tmp7456, 0
br i1 %.tmp7457, label %.if.true.7458, label %.if.false.7458
.if.true.7458:
%.tmp7460 = getelementptr [2 x i8], [2 x i8]*@.str7459, i32 0, i32 0
ret i8* %.tmp7460
br label %.if.end.7458
.if.false.7458:
%.tmp7462 = getelementptr [45 x i8], [45 x i8]*@.str7461, i32 0, i32 0
%.tmp7463 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7464 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7463, i32 0, i32 0
%.tmp7465 = load i8*, i8** %.tmp7464
%.tmp7466 = call i32(i8*,...) @printf(i8* %.tmp7462, i8* %.tmp7465)
br label %.if.end.7458
.if.end.7458:
br label %.if.end.7448
.if.end.7448:
br label %.if.end.7419
.if.end.7419:
br label %.if.end.7408
.if.end.7408:
br label %.if.end.7390
.if.end.7390:
br label %.if.end.7380
.if.end.7380:
br label %.if.end.7370
.if.end.7370:
br label %.if.end.7360
.if.end.7360:
br label %.if.end.7350
.if.end.7350:
%.tmp7467 = bitcast ptr null to i8*
ret i8* %.tmp7467
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7468 = bitcast ptr null to %m307$.Node.type*
%.tmp7469 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7468)
%info.7470 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7469, %m1861$.AssignableInfo.type** %info.7470
%tmp_buff.7471 = alloca i8*
store i8* null, i8** %tmp_buff.7471
%.tmp7472 = getelementptr i8*, i8** %tmp_buff.7471, i32 0
%.tmp7474 = getelementptr [7 x i8], [7 x i8]*@.str7473, i32 0, i32 0
%.tmp7475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7476 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7475)
%.tmp7477 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7472, i8* %.tmp7474, i32 %.tmp7476)
%.tmp7478 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7479 = load i8, i8* @SCOPE_GLOBAL
%.tmp7480 = load i8*, i8** %tmp_buff.7471
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7478, i8 %.tmp7479, i8* %.tmp7480)
%.tmp7481 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7482 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7481, i32 0, i32 4
%.tmp7483 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7483, %m1861$.Type.type** %.tmp7482
%.tmp7484 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7485 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7484, i32 0, i32 4
%.tmp7486 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7485
%.tmp7487 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7486, i32 0, i32 0
%.tmp7489 = getelementptr [6 x i8], [6 x i8]*@.str7488, i32 0, i32 0
store i8* %.tmp7489, i8** %.tmp7487
%.tmp7490 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7491 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7490, i32 0, i32 4
%.tmp7492 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7491
%.tmp7493 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7492, i32 0, i32 3
%.tmp7494 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7494, %m1861$.Type.type** %.tmp7493
%.tmp7495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7496 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7495, i32 0, i32 4
%.tmp7497 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7496
%.tmp7498 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7497, i32 0, i32 3
%.tmp7499 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7498
%.tmp7500 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7499, i32 0, i32 0
%.tmp7502 = getelementptr [4 x i8], [4 x i8]*@.str7501, i32 0, i32 0
store i8* %.tmp7502, i8** %.tmp7500
%.tmp7503 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7504 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7503, i32 0, i32 4
%.tmp7505 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7504
%.tmp7506 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7505, i32 0, i32 3
%.tmp7507 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7506
%.tmp7508 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7507, i32 0, i32 4
%.tmp7509 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7509, %m1861$.Type.type** %.tmp7508
%.tmp7510 = load i8*, i8** %text
%.tmp7511 = call i8*(i8*) @m2233$string_to_llvm.cp.cp(i8* %.tmp7510)
%identifier.7512 = alloca i8*
store i8* %.tmp7511, i8** %identifier.7512
%.tmp7513 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
%.tmp7514 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7513, i32 0, i32 4
%.tmp7515 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7514
%.tmp7516 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7515, i32 0, i32 3
%.tmp7517 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7516
%.tmp7518 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7517, i32 0, i32 4
%.tmp7519 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7518
%.tmp7520 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7519, i32 0, i32 0
%.tmp7521 = getelementptr i8*, i8** %.tmp7520, i32 0
%.tmp7523 = getelementptr [3 x i8], [3 x i8]*@.str7522, i32 0, i32 0
%.tmp7524 = load i8*, i8** %identifier.7512
%.tmp7525 = call i32(i8*) @m2233$llvm_str_len.i.cp(i8* %.tmp7524)
%.tmp7526 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7521, i8* %.tmp7523, i32 %.tmp7525)
%.tmp7527 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7528 = load i8*, i8** %identifier.7512
%.tmp7530 = getelementptr [7 x i8], [7 x i8]*@.str7529, i32 0, i32 0
%.tmp7531 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp7527, i8* %.tmp7528, i8* %.tmp7530, %m1861$.AssignableInfo.type* %.tmp7531, i1 0, i1 0)
%.tmp7532 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7470
ret %m1861$.AssignableInfo.type* %.tmp7532
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
%.tmp7533 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7534 = ptrtoint %m1861$.GlobalName.type* %.tmp7533 to i32
%.tmp7535 = call i8*(i32) @malloc(i32 %.tmp7534)
%.tmp7536 = bitcast i8* %.tmp7535 to %m1861$.GlobalName.type*
%global.7537 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7536, %m1861$.GlobalName.type** %global.7537
%.tmp7538 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
%.tmp7539 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7538, i32 0, i32 0
%.tmp7540 = load i8*, i8** %id
store i8* %.tmp7540, i8** %.tmp7539
%.tmp7541 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
%.tmp7542 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7541, i32 0, i32 1
%.tmp7543 = load i8*, i8** %type
store i8* %.tmp7543, i8** %.tmp7542
%.tmp7544 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
%.tmp7545 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7544, i32 0, i32 4
%.tmp7546 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp7546, %m1861$.AssignableInfo.type** %.tmp7545
%.tmp7547 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
%.tmp7548 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7547, i32 0, i32 2
%.tmp7549 = load i1, i1* %compiled
store i1 %.tmp7549, i1* %.tmp7548
%.tmp7550 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
%.tmp7551 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7550, i32 0, i32 5
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7551
%.tmp7552 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
%.tmp7553 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7552, i32 0, i32 3
%.tmp7554 = load i1, i1* %weak
store i1 %.tmp7554, i1* %.tmp7553
%.tmp7555 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7556 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7537
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7555, %m1861$.GlobalName.type* %.tmp7556)
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
%.tmp7557 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7558 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7557)
%info.7559 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7558, %m1861$.AssignableInfo.type** %info.7559
%.tmp7560 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7559
%.tmp7561 = load i8, i8* @SCOPE_CONST
%.tmp7562 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7560, i8 %.tmp7561, i8* %.tmp7562)
%.tmp7563 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7559
%.tmp7564 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7563, i32 0, i32 3
%.tmp7566 = getelementptr [7 x i8], [7 x i8]*@.str7565, i32 0, i32 0
store i8* %.tmp7566, i8** %.tmp7564
%.tmp7567 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7559
%.tmp7568 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7567, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7568
%.tmp7569 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7570 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7571 = load i8*, i8** %as_name
%.tmp7572 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7559
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7569, %m307$.Node.type* %.tmp7570, i8* %.tmp7571, %m1861$.AssignableInfo.type* %.tmp7572)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7573 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7574 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7573, i32 0, i32 3
%.tmp7575 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7574
%.tmp7576 = icmp eq %m1861$.GlobalName.type* %.tmp7575, null
br i1 %.tmp7576, label %.if.true.7577, label %.if.false.7577
.if.true.7577:
%.tmp7578 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7579 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7578, i32 0, i32 3
%.tmp7580 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7580, %m1861$.GlobalName.type** %.tmp7579
ret void
br label %.if.end.7577
.if.false.7577:
br label %.if.end.7577
.if.end.7577:
%.tmp7581 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7582 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7581, i32 0, i32 3
%.tmp7583 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7582
%last_global.7584 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7583, %m1861$.GlobalName.type** %last_global.7584
%.tmp7586 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7587 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7586, i32 0, i32 3
%.tmp7588 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7587
%curr_global.7589 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7588, %m1861$.GlobalName.type** %curr_global.7589
br label %.for.start.7585
.for.start.7585:
%.tmp7590 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7589
%.tmp7591 = icmp ne %m1861$.GlobalName.type* %.tmp7590, null
br i1 %.tmp7591, label %.for.continue.7585, label %.for.end.7585
.for.continue.7585:
%.tmp7592 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7589
%.tmp7593 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7592, i32 0, i32 4
%.tmp7594 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7593
%.tmp7595 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7594, i32 0, i32 0
%.tmp7596 = load i8*, i8** %.tmp7595
%.tmp7597 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp7598 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7597, i32 0, i32 4
%.tmp7599 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7598
%.tmp7600 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7599, i32 0, i32 0
%.tmp7601 = load i8*, i8** %.tmp7600
%.tmp7602 = call i32(i8*,i8*) @strcmp(i8* %.tmp7596, i8* %.tmp7601)
%.tmp7603 = icmp eq i32 %.tmp7602, 0
br i1 %.tmp7603, label %.if.true.7604, label %.if.false.7604
.if.true.7604:
ret void
br label %.if.end.7604
.if.false.7604:
br label %.if.end.7604
.if.end.7604:
%.tmp7605 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7589
store %m1861$.GlobalName.type* %.tmp7605, %m1861$.GlobalName.type** %last_global.7584
%.tmp7606 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7589
%.tmp7607 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7606, i32 0, i32 5
%.tmp7608 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7607
store %m1861$.GlobalName.type* %.tmp7608, %m1861$.GlobalName.type** %curr_global.7589
br label %.for.start.7585
.for.end.7585:
%.tmp7609 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7584
%.tmp7610 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7609, i32 0, i32 5
%.tmp7611 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7611, %m1861$.GlobalName.type** %.tmp7610
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7612 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7613 = icmp eq %m1861$.Type.type* %.tmp7612, null
br i1 %.tmp7613, label %.if.true.7614, label %.if.false.7614
.if.true.7614:
%.tmp7615 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7615, label %.if.true.7616, label %.if.false.7616
.if.true.7616:
%.tmp7618 = getelementptr [44 x i8], [44 x i8]*@.str7617, i32 0, i32 0
%.tmp7619 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7620 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7619, i32 0, i32 7
%.tmp7621 = load i8*, i8** %.tmp7620
%.tmp7622 = call i32(i8*,...) @printf(i8* %.tmp7618, i8* %.tmp7621)
br label %.if.end.7616
.if.false.7616:
br label %.if.end.7616
.if.end.7616:
%.tmp7624 = getelementptr [2 x i8], [2 x i8]*@.str7623, i32 0, i32 0
ret i8* %.tmp7624
br label %.if.end.7614
.if.false.7614:
br label %.if.end.7614
.if.end.7614:
%.tmp7625 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7626 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7625, i32 0, i32 0
%.tmp7627 = load i8*, i8** %.tmp7626
%.tmp7628 = icmp ne i8* %.tmp7627, null
%.tmp7630 = getelementptr [59 x i8], [59 x i8]*@.str7629, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7628, i8* %.tmp7630)
%buf.7631 = alloca i8*
store i8* null, i8** %buf.7631
%.tmp7632 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7633 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7632, i32 0, i32 0
%.tmp7634 = load i8*, i8** %.tmp7633
%.tmp7636 = getelementptr [4 x i8], [4 x i8]*@.str7635, i32 0, i32 0
%.tmp7637 = call i32(i8*,i8*) @strcmp(i8* %.tmp7634, i8* %.tmp7636)
%.tmp7638 = icmp eq i32 %.tmp7637, 0
br i1 %.tmp7638, label %.if.true.7639, label %.if.false.7639
.if.true.7639:
%.tmp7641 = getelementptr [4 x i8], [4 x i8]*@.str7640, i32 0, i32 0
ret i8* %.tmp7641
br label %.if.end.7639
.if.false.7639:
%.tmp7642 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7643 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7642, i32 0, i32 0
%.tmp7644 = load i8*, i8** %.tmp7643
%.tmp7646 = getelementptr [5 x i8], [5 x i8]*@.str7645, i32 0, i32 0
%.tmp7647 = call i32(i8*,i8*) @strcmp(i8* %.tmp7644, i8* %.tmp7646)
%.tmp7648 = icmp eq i32 %.tmp7647, 0
br i1 %.tmp7648, label %.if.true.7649, label %.if.false.7649
.if.true.7649:
%.tmp7651 = getelementptr [5 x i8], [5 x i8]*@.str7650, i32 0, i32 0
ret i8* %.tmp7651
br label %.if.end.7649
.if.false.7649:
%.tmp7652 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7653 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7652, i32 0, i32 0
%.tmp7654 = load i8*, i8** %.tmp7653
%.tmp7656 = getelementptr [5 x i8], [5 x i8]*@.str7655, i32 0, i32 0
%.tmp7657 = call i32(i8*,i8*) @strcmp(i8* %.tmp7654, i8* %.tmp7656)
%.tmp7658 = icmp eq i32 %.tmp7657, 0
br i1 %.tmp7658, label %.if.true.7659, label %.if.false.7659
.if.true.7659:
%.tmp7661 = getelementptr [3 x i8], [3 x i8]*@.str7660, i32 0, i32 0
ret i8* %.tmp7661
br label %.if.end.7659
.if.false.7659:
%.tmp7662 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7663 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7662, i32 0, i32 0
%.tmp7664 = load i8*, i8** %.tmp7663
%.tmp7666 = getelementptr [8 x i8], [8 x i8]*@.str7665, i32 0, i32 0
%.tmp7667 = call i32(i8*,i8*) @strcmp(i8* %.tmp7664, i8* %.tmp7666)
%.tmp7668 = icmp eq i32 %.tmp7667, 0
br i1 %.tmp7668, label %.if.true.7669, label %.if.false.7669
.if.true.7669:
%.tmp7671 = getelementptr [4 x i8], [4 x i8]*@.str7670, i32 0, i32 0
ret i8* %.tmp7671
br label %.if.end.7669
.if.false.7669:
%.tmp7672 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7673 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7672, i32 0, i32 0
%.tmp7674 = load i8*, i8** %.tmp7673
%.tmp7676 = getelementptr [4 x i8], [4 x i8]*@.str7675, i32 0, i32 0
%.tmp7677 = call i32(i8*,i8*) @strcmp(i8* %.tmp7674, i8* %.tmp7676)
%.tmp7678 = icmp eq i32 %.tmp7677, 0
br i1 %.tmp7678, label %.if.true.7679, label %.if.false.7679
.if.true.7679:
%.tmp7681 = getelementptr [3 x i8], [3 x i8]*@.str7680, i32 0, i32 0
ret i8* %.tmp7681
br label %.if.end.7679
.if.false.7679:
%.tmp7682 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7683 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7682, i32 0, i32 0
%.tmp7684 = load i8*, i8** %.tmp7683
%.tmp7686 = getelementptr [9 x i8], [9 x i8]*@.str7685, i32 0, i32 0
%.tmp7687 = call i32(i8*,i8*) @strcmp(i8* %.tmp7684, i8* %.tmp7686)
%.tmp7688 = icmp eq i32 %.tmp7687, 0
br i1 %.tmp7688, label %.if.true.7689, label %.if.false.7689
.if.true.7689:
%.tmp7690 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7692 = getelementptr [4 x i8], [4 x i8]*@.str7691, i32 0, i32 0
%.tmp7693 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7694 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7695 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7694, i32 0, i32 3
%.tmp7696 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7695
%.tmp7697 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7693, %m1861$.Type.type* %.tmp7696)
%.tmp7698 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7690, i8* %.tmp7692, i8* %.tmp7697)
%.tmp7700 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7701 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7700, i32 0, i32 3
%.tmp7702 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7701
%.tmp7703 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7702, i32 0, i32 4
%.tmp7704 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7703
%p.7705 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7704, %m1861$.Type.type** %p.7705
br label %.for.start.7699
.for.start.7699:
%.tmp7706 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7705
%.tmp7707 = icmp ne %m1861$.Type.type* %.tmp7706, null
br i1 %.tmp7707, label %.for.continue.7699, label %.for.end.7699
.for.continue.7699:
%.tmp7708 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7705
%.tmp7709 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7710 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7709, i32 0, i32 3
%.tmp7711 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7710
%.tmp7712 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7711, i32 0, i32 4
%.tmp7713 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7712
%.tmp7714 = icmp ne %m1861$.Type.type* %.tmp7708, %.tmp7713
br i1 %.tmp7714, label %.if.true.7715, label %.if.false.7715
.if.true.7715:
%.tmp7716 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7718 = getelementptr [4 x i8], [4 x i8]*@.str7717, i32 0, i32 0
%.tmp7719 = load i8*, i8** %buf.7631
%.tmp7720 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7716, i8* %.tmp7718, i8* %.tmp7719)
br label %.if.end.7715
.if.false.7715:
br label %.if.end.7715
.if.end.7715:
%.tmp7721 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7723 = getelementptr [5 x i8], [5 x i8]*@.str7722, i32 0, i32 0
%.tmp7724 = load i8*, i8** %buf.7631
%.tmp7725 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7726 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7705
%.tmp7727 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7725, %m1861$.Type.type* %.tmp7726)
%.tmp7728 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7721, i8* %.tmp7723, i8* %.tmp7724, i8* %.tmp7727)
%.tmp7729 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7705
%.tmp7730 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7729, i32 0, i32 4
%.tmp7731 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7730
store %m1861$.Type.type* %.tmp7731, %m1861$.Type.type** %p.7705
br label %.for.start.7699
.for.end.7699:
%.tmp7732 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7734 = getelementptr [4 x i8], [4 x i8]*@.str7733, i32 0, i32 0
%.tmp7735 = load i8*, i8** %buf.7631
%.tmp7736 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7732, i8* %.tmp7734, i8* %.tmp7735)
%.tmp7737 = load i8*, i8** %buf.7631
ret i8* %.tmp7737
br label %.if.end.7689
.if.false.7689:
%.tmp7738 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7739 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7738, i32 0, i32 0
%.tmp7740 = load i8*, i8** %.tmp7739
%.tmp7742 = getelementptr [4 x i8], [4 x i8]*@.str7741, i32 0, i32 0
%.tmp7743 = call i32(i8*,i8*) @strcmp(i8* %.tmp7740, i8* %.tmp7742)
%.tmp7744 = icmp eq i32 %.tmp7743, 0
br i1 %.tmp7744, label %.if.true.7745, label %.if.false.7745
.if.true.7745:
%.tmp7746 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7748 = getelementptr [4 x i8], [4 x i8]*@.str7747, i32 0, i32 0
%.tmp7749 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7750 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7751 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7750, i32 0, i32 3
%.tmp7752 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7751
%.tmp7753 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7749, %m1861$.Type.type* %.tmp7752)
%.tmp7754 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7746, i8* %.tmp7748, i8* %.tmp7753)
%.tmp7755 = load i8*, i8** %buf.7631
ret i8* %.tmp7755
br label %.if.end.7745
.if.false.7745:
%.tmp7756 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7757 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7756, i32 0, i32 0
%.tmp7758 = load i8*, i8** %.tmp7757
%.tmp7760 = getelementptr [7 x i8], [7 x i8]*@.str7759, i32 0, i32 0
%.tmp7761 = call i32(i8*,i8*) @strcmp(i8* %.tmp7758, i8* %.tmp7760)
%.tmp7762 = icmp eq i32 %.tmp7761, 0
br i1 %.tmp7762, label %.if.true.7763, label %.if.false.7763
.if.true.7763:
%.tmp7764 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7766 = getelementptr [2 x i8], [2 x i8]*@.str7765, i32 0, i32 0
%.tmp7767 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7764, i8* %.tmp7766)
%.tmp7769 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7770 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7769, i32 0, i32 3
%.tmp7771 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7770
%t.7772 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7771, %m1861$.Type.type** %t.7772
br label %.for.start.7768
.for.start.7768:
%.tmp7773 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7772
%.tmp7774 = icmp ne %m1861$.Type.type* %.tmp7773, null
br i1 %.tmp7774, label %.for.continue.7768, label %.for.end.7768
.for.continue.7768:
%.tmp7775 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7772
%.tmp7776 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7777 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7776, i32 0, i32 3
%.tmp7778 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7777
%.tmp7779 = icmp ne %m1861$.Type.type* %.tmp7775, %.tmp7778
br i1 %.tmp7779, label %.if.true.7780, label %.if.false.7780
.if.true.7780:
%.tmp7781 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7783 = getelementptr [4 x i8], [4 x i8]*@.str7782, i32 0, i32 0
%.tmp7784 = load i8*, i8** %buf.7631
%.tmp7785 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7781, i8* %.tmp7783, i8* %.tmp7784)
br label %.if.end.7780
.if.false.7780:
br label %.if.end.7780
.if.end.7780:
%.tmp7786 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7788 = getelementptr [5 x i8], [5 x i8]*@.str7787, i32 0, i32 0
%.tmp7789 = load i8*, i8** %buf.7631
%.tmp7790 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7791 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7772
%.tmp7792 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7790, %m1861$.Type.type* %.tmp7791)
%.tmp7793 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7786, i8* %.tmp7788, i8* %.tmp7789, i8* %.tmp7792)
%.tmp7794 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7772
%.tmp7795 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7794, i32 0, i32 4
%.tmp7796 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7795
store %m1861$.Type.type* %.tmp7796, %m1861$.Type.type** %t.7772
br label %.for.start.7768
.for.end.7768:
%.tmp7797 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7799 = getelementptr [4 x i8], [4 x i8]*@.str7798, i32 0, i32 0
%.tmp7800 = load i8*, i8** %buf.7631
%.tmp7801 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7797, i8* %.tmp7799, i8* %.tmp7800)
%.tmp7802 = load i8*, i8** %buf.7631
ret i8* %.tmp7802
br label %.if.end.7763
.if.false.7763:
%.tmp7803 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7804 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7803, i32 0, i32 0
%.tmp7805 = load i8*, i8** %.tmp7804
%.tmp7807 = getelementptr [6 x i8], [6 x i8]*@.str7806, i32 0, i32 0
%.tmp7808 = call i32(i8*,i8*) @strcmp(i8* %.tmp7805, i8* %.tmp7807)
%.tmp7809 = icmp eq i32 %.tmp7808, 0
br i1 %.tmp7809, label %.if.true.7810, label %.if.false.7810
.if.true.7810:
%.tmp7811 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7813 = getelementptr [10 x i8], [10 x i8]*@.str7812, i32 0, i32 0
%.tmp7814 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7815 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7814, i32 0, i32 3
%.tmp7816 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7815
%.tmp7817 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7816, i32 0, i32 4
%.tmp7818 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7817
%.tmp7819 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7818, i32 0, i32 0
%.tmp7820 = load i8*, i8** %.tmp7819
%.tmp7821 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7822 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7823 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7822, i32 0, i32 3
%.tmp7824 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7823
%.tmp7825 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7821, %m1861$.Type.type* %.tmp7824)
%.tmp7826 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7811, i8* %.tmp7813, i8* %.tmp7820, i8* %.tmp7825)
%.tmp7827 = load i8*, i8** %buf.7631
ret i8* %.tmp7827
br label %.if.end.7810
.if.false.7810:
%.tmp7828 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7829 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7828, i32 0, i32 0
%.tmp7830 = load i8*, i8** %.tmp7829
%.tmp7832 = getelementptr [10 x i8], [10 x i8]*@.str7831, i32 0, i32 0
%.tmp7833 = call i32(i8*,i8*) @strcmp(i8* %.tmp7830, i8* %.tmp7832)
%.tmp7834 = icmp eq i32 %.tmp7833, 0
br i1 %.tmp7834, label %.if.true.7835, label %.if.false.7835
.if.true.7835:
%.tmp7836 = getelementptr i8*, i8** %buf.7631, i32 0
%.tmp7838 = getelementptr [5 x i8], [5 x i8]*@.str7837, i32 0, i32 0
%.tmp7839 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7840 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7839, i32 0, i32 2
%.tmp7841 = load i8*, i8** %.tmp7840
%.tmp7842 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7836, i8* %.tmp7838, i8* %.tmp7841)
%.tmp7843 = load i8*, i8** %buf.7631
ret i8* %.tmp7843
br label %.if.end.7835
.if.false.7835:
%.tmp7844 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7845 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7844, i32 0, i32 0
%.tmp7846 = load i8*, i8** %.tmp7845
%.tmp7848 = getelementptr [7 x i8], [7 x i8]*@.str7847, i32 0, i32 0
%.tmp7849 = call i32(i8*,i8*) @strcmp(i8* %.tmp7846, i8* %.tmp7848)
%.tmp7850 = icmp eq i32 %.tmp7849, 0
br i1 %.tmp7850, label %.if.true.7851, label %.if.false.7851
.if.true.7851:
%.tmp7853 = getelementptr [4 x i8], [4 x i8]*@.str7852, i32 0, i32 0
ret i8* %.tmp7853
br label %.if.end.7851
.if.false.7851:
%.tmp7854 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7855 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7854, i32 0, i32 0
%.tmp7856 = load i8*, i8** %.tmp7855
%.tmp7858 = getelementptr [6 x i8], [6 x i8]*@.str7857, i32 0, i32 0
%.tmp7859 = call i32(i8*,i8*) @strcmp(i8* %.tmp7856, i8* %.tmp7858)
%.tmp7860 = icmp eq i32 %.tmp7859, 0
br i1 %.tmp7860, label %.if.true.7861, label %.if.false.7861
.if.true.7861:
br label %.if.end.7861
.if.false.7861:
%.tmp7863 = getelementptr [58 x i8], [58 x i8]*@.str7862, i32 0, i32 0
%.tmp7864 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7865 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7864, i32 0, i32 0
%.tmp7866 = load i8*, i8** %.tmp7865
%.tmp7867 = call i32(i8*,...) @printf(i8* %.tmp7863, i8* %.tmp7866)
br label %.if.end.7861
.if.end.7861:
br label %.if.end.7851
.if.end.7851:
br label %.if.end.7835
.if.end.7835:
br label %.if.end.7810
.if.end.7810:
br label %.if.end.7763
.if.end.7763:
br label %.if.end.7745
.if.end.7745:
br label %.if.end.7689
.if.end.7689:
br label %.if.end.7679
.if.end.7679:
br label %.if.end.7669
.if.end.7669:
br label %.if.end.7659
.if.end.7659:
br label %.if.end.7649
.if.end.7649:
br label %.if.end.7639
.if.end.7639:
%.tmp7868 = bitcast ptr null to i8*
ret i8* %.tmp7868
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7869 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7870 = ptrtoint %m1861$.ErrorList.type* %.tmp7869 to i32
%.tmp7871 = call i8*(i32) @malloc(i32 %.tmp7870)
%.tmp7872 = bitcast i8* %.tmp7871 to %m1861$.ErrorList.type*
%new_err.7873 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7872, %m1861$.ErrorList.type** %new_err.7873
%.tmp7874 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7873
%.tmp7875 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7874, i32 0, i32 2
store i1 0, i1* %.tmp7875
%.tmp7876 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7873
%.tmp7877 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7876, i32 0, i32 0
%.tmp7878 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7878, %m751$.Error.type** %.tmp7877
%.tmp7879 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7873
%.tmp7880 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7879, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7880
%.tmp7881 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7882 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7881, i32 0, i32 2
%.tmp7883 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7882
%.tmp7884 = icmp eq %m1861$.ErrorList.type* %.tmp7883, null
br i1 %.tmp7884, label %.if.true.7885, label %.if.false.7885
.if.true.7885:
%.tmp7886 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7887 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7886, i32 0, i32 2
%.tmp7888 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7873
store %m1861$.ErrorList.type* %.tmp7888, %m1861$.ErrorList.type** %.tmp7887
ret void
br label %.if.end.7885
.if.false.7885:
br label %.if.end.7885
.if.end.7885:
%last.7889 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7889
%.tmp7891 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7892 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7891, i32 0, i32 2
%.tmp7893 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7892
store %m1861$.ErrorList.type* %.tmp7893, %m1861$.ErrorList.type** %last.7889
br label %.for.start.7890
.for.start.7890:
%.tmp7894 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7889
%.tmp7895 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7894, i32 0, i32 1
%.tmp7896 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7895
%.tmp7897 = icmp ne %m1861$.ErrorList.type* %.tmp7896, null
br i1 %.tmp7897, label %.for.continue.7890, label %.for.end.7890
.for.continue.7890:
%.tmp7898 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7889
%.tmp7899 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7898, i32 0, i32 1
%.tmp7900 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7899
store %m1861$.ErrorList.type* %.tmp7900, %m1861$.ErrorList.type** %last.7889
br label %.for.start.7890
.for.end.7890:
%.tmp7901 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7889
%.tmp7902 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7901, i32 0, i32 1
%.tmp7903 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7873
store %m1861$.ErrorList.type* %.tmp7903, %m1861$.ErrorList.type** %.tmp7902
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7904 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7905 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7904, i32 0, i32 6
%.tmp7906 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7905
%.tmp7907 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7906, i32 0, i32 7
%.tmp7908 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7907
%.tmp7909 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7908, i32 0, i32 1
%.tmp7910 = load i8*, i8** %.tmp7909
ret i8* %.tmp7910
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7912 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7913 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7912, %m307$.Node.type** %n.7913
br label %.for.start.7911
.for.start.7911:
%.tmp7914 = load %m307$.Node.type*, %m307$.Node.type** %n.7913
%.tmp7915 = icmp ne %m307$.Node.type* %.tmp7914, null
br i1 %.tmp7915, label %.for.continue.7911, label %.for.end.7911
.for.continue.7911:
%.tmp7916 = load %m307$.Node.type*, %m307$.Node.type** %n.7913
%.tmp7917 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7916, i32 0, i32 0
%.tmp7918 = load i8*, i8** %.tmp7917
%.tmp7919 = load i8*, i8** %type
%.tmp7920 = call i32(i8*,i8*) @strcmp(i8* %.tmp7918, i8* %.tmp7919)
%.tmp7921 = icmp eq i32 %.tmp7920, 0
br i1 %.tmp7921, label %.if.true.7922, label %.if.false.7922
.if.true.7922:
%.tmp7923 = load %m307$.Node.type*, %m307$.Node.type** %n.7913
ret %m307$.Node.type* %.tmp7923
br label %.if.end.7922
.if.false.7922:
br label %.if.end.7922
.if.end.7922:
%.tmp7924 = load %m307$.Node.type*, %m307$.Node.type** %n.7913
%.tmp7925 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7924, i32 0, i32 7
%.tmp7926 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7925
store %m307$.Node.type* %.tmp7926, %m307$.Node.type** %n.7913
br label %.for.start.7911
.for.end.7911:
%.tmp7927 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7927
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7928 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7929 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7928, %m1861$.Type.type** %function_type.7929
%.tmp7930 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7931 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7932 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7931, i32 0, i32 6
%.tmp7933 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7932
%.tmp7934 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7930, %m307$.Node.type* %.tmp7933)
%return_value_type.7935 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7934, %m1861$.Type.type** %return_value_type.7935
%.tmp7936 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7929
%.tmp7937 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7936, i32 0, i32 0
%.tmp7939 = getelementptr [9 x i8], [9 x i8]*@.str7938, i32 0, i32 0
store i8* %.tmp7939, i8** %.tmp7937
%.tmp7940 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7929
%.tmp7941 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7940, i32 0, i32 3
%.tmp7942 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7935
store %m1861$.Type.type* %.tmp7942, %m1861$.Type.type** %.tmp7941
%.tmp7943 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7935
%last_type.7944 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7943, %m1861$.Type.type** %last_type.7944
%.tmp7945 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7946 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7945)
%params.7947 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7946, %m307$.Node.type** %params.7947
%.tmp7949 = load %m307$.Node.type*, %m307$.Node.type** %params.7947
%param_ptr.7950 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7949, %m307$.Node.type** %param_ptr.7950
br label %.for.start.7948
.for.start.7948:
%.tmp7951 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7952 = icmp ne %m307$.Node.type* %.tmp7951, null
br i1 %.tmp7952, label %.for.continue.7948, label %.for.end.7948
.for.continue.7948:
%.tmp7953 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7954 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7953, i32 0, i32 0
%.tmp7955 = load i8*, i8** %.tmp7954
%.tmp7957 = getelementptr [5 x i8], [5 x i8]*@.str7956, i32 0, i32 0
%.tmp7958 = call i32(i8*,i8*) @strcmp(i8* %.tmp7955, i8* %.tmp7957)
%.tmp7959 = icmp eq i32 %.tmp7958, 0
br i1 %.tmp7959, label %.if.true.7960, label %.if.false.7960
.if.true.7960:
%.tmp7961 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7944
%.tmp7962 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7961, i32 0, i32 4
%.tmp7963 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7944
%.tmp7964 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7963)
store %m1861$.Type.type* %.tmp7964, %m1861$.Type.type** %.tmp7962
%.tmp7965 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7944
%.tmp7966 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7965, i32 0, i32 4
%.tmp7967 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7966
%.tmp7968 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7967, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7968
%.tmp7969 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7944
%.tmp7970 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7969, i32 0, i32 4
%.tmp7971 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7970
store %m1861$.Type.type* %.tmp7971, %m1861$.Type.type** %last_type.7944
%.tmp7972 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7973 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7972, i32 0, i32 7
%.tmp7974 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7973
%.tmp7975 = icmp ne %m307$.Node.type* %.tmp7974, null
br i1 %.tmp7975, label %.if.true.7976, label %.if.false.7976
.if.true.7976:
%.tmp7977 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7977, i32 0, i32 7
%.tmp7979 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7978
store %m307$.Node.type* %.tmp7979, %m307$.Node.type** %param_ptr.7950
br label %.if.end.7976
.if.false.7976:
br label %.if.end.7976
.if.end.7976:
%.tmp7980 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7981 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7980, i32 0, i32 7
%.tmp7982 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7981
%.tmp7983 = icmp ne %m307$.Node.type* %.tmp7982, null
br i1 %.tmp7983, label %.if.true.7984, label %.if.false.7984
.if.true.7984:
%.tmp7985 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7986 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7985, i32 0, i32 7
%.tmp7987 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7986
store %m307$.Node.type* %.tmp7987, %m307$.Node.type** %param_ptr.7950
br label %.if.end.7984
.if.false.7984:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7950
br label %.if.end.7984
.if.end.7984:
br label %.if.end.7960
.if.false.7960:
%.tmp7988 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7989 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7990 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7989, i32 0, i32 6
%.tmp7991 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7990
%.tmp7992 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7988, %m307$.Node.type* %.tmp7991)
%param_type.7993 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7992, %m1861$.Type.type** %param_type.7993
%.tmp7994 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7944
%.tmp7995 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7994, i32 0, i32 4
%.tmp7996 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7993
store %m1861$.Type.type* %.tmp7996, %m1861$.Type.type** %.tmp7995
%.tmp7997 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7993
store %m1861$.Type.type* %.tmp7997, %m1861$.Type.type** %last_type.7944
%.tmp7998 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp7999 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7998, i32 0, i32 7
%.tmp8000 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7999
store %m307$.Node.type* %.tmp8000, %m307$.Node.type** %param_ptr.7950
%.tmp8001 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp8002 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8001, i32 0, i32 7
%.tmp8003 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8002
%.tmp8004 = icmp ne %m307$.Node.type* %.tmp8003, null
br i1 %.tmp8004, label %.if.true.8005, label %.if.false.8005
.if.true.8005:
%.tmp8006 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7950
%.tmp8007 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8006, i32 0, i32 7
%.tmp8008 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8007
%.tmp8009 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8008, i32 0, i32 7
%.tmp8010 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8009
store %m307$.Node.type* %.tmp8010, %m307$.Node.type** %param_ptr.7950
br label %.if.end.8005
.if.false.8005:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7950
br label %.if.end.8005
.if.end.8005:
br label %.if.end.7960
.if.end.7960:
br label %.for.start.7948
.for.end.7948:
%.tmp8011 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7929
ret %m1861$.Type.type* %.tmp8011
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp8012 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8014 = getelementptr [10 x i8], [10 x i8]*@.str8013, i32 0, i32 0
%.tmp8015 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8012, i8* %.tmp8014)
%params.8016 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8015, %m307$.Node.type** %params.8016
%.tmp8017 = load %m307$.Node.type*, %m307$.Node.type** %params.8016
%.tmp8018 = icmp eq %m307$.Node.type* %.tmp8017, null
br i1 %.tmp8018, label %.if.true.8019, label %.if.false.8019
.if.true.8019:
%.tmp8020 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp8020
br label %.if.end.8019
.if.false.8019:
br label %.if.end.8019
.if.end.8019:
%.tmp8021 = load %m307$.Node.type*, %m307$.Node.type** %params.8016
%.tmp8022 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8021, i32 0, i32 6
%.tmp8023 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8022
ret %m307$.Node.type* %.tmp8023
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp8024 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8025 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8024, i32 0, i32 0
%.tmp8026 = load i8*, i8** %.tmp8025
%.tmp8028 = getelementptr [11 x i8], [11 x i8]*@.str8027, i32 0, i32 0
%.tmp8029 = call i32(i8*,i8*) @strcmp(i8* %.tmp8026, i8* %.tmp8028)
%.tmp8030 = icmp eq i32 %.tmp8029, 0
br i1 %.tmp8030, label %.if.true.8031, label %.if.false.8031
.if.true.8031:
%.tmp8032 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8033 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8033, i32 0, i32 6
%.tmp8035 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8034
%.tmp8036 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8032, %m307$.Node.type* %.tmp8035)
%t.8037 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8036, %m1861$.Type.type** %t.8037
%.tmp8038 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8039 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8038, i32 0, i32 7
%.tmp8040 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8039
%.tmp8041 = icmp ne %m307$.Node.type* %.tmp8040, null
br i1 %.tmp8041, label %.if.true.8042, label %.if.false.8042
.if.true.8042:
%.tmp8043 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8044 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8043, i32 0, i32 7
%.tmp8045 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8044
%.tmp8046 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8045, i32 0, i32 0
%.tmp8047 = load i8*, i8** %.tmp8046
%.tmp8049 = getelementptr [13 x i8], [13 x i8]*@.str8048, i32 0, i32 0
%.tmp8050 = call i32(i8*,i8*) @strcmp(i8* %.tmp8047, i8* %.tmp8049)
%.tmp8051 = icmp eq i32 %.tmp8050, 0
br i1 %.tmp8051, label %.if.true.8052, label %.if.false.8052
.if.true.8052:
%.tmp8053 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%fn_type.8054 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8053, %m1861$.Type.type** %fn_type.8054
%.tmp8055 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8054
%.tmp8056 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8055, i32 0, i32 0
%.tmp8058 = getelementptr [9 x i8], [9 x i8]*@.str8057, i32 0, i32 0
store i8* %.tmp8058, i8** %.tmp8056
%.tmp8059 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8054
%.tmp8060 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8059, i32 0, i32 3
%.tmp8061 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8037
store %m1861$.Type.type* %.tmp8061, %m1861$.Type.type** %.tmp8060
%.tmp8062 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8063 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8062, i32 0, i32 7
%.tmp8064 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8063
%.tmp8065 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8064, i32 0, i32 6
%.tmp8066 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8065
%.tmp8067 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8066, i32 0, i32 7
%.tmp8068 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8067
%fst_operator.8069 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8068, %m307$.Node.type** %fst_operator.8069
%.tmp8070 = load %m307$.Node.type*, %m307$.Node.type** %fst_operator.8069
%.tmp8071 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8070, i32 0, i32 0
%.tmp8072 = load i8*, i8** %.tmp8071
%.tmp8074 = getelementptr [15 x i8], [15 x i8]*@.str8073, i32 0, i32 0
%.tmp8075 = call i32(i8*,i8*) @strcmp(i8* %.tmp8072, i8* %.tmp8074)
%.tmp8076 = icmp eq i32 %.tmp8075, 0
br i1 %.tmp8076, label %.if.true.8077, label %.if.false.8077
.if.true.8077:
%.tmp8078 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8054
%.tmp8079 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8078, i32 0, i32 3
%.tmp8080 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8079
%last_fn_value.8081 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8080, %m1861$.Type.type** %last_fn_value.8081
%.tmp8083 = load %m307$.Node.type*, %m307$.Node.type** %fst_operator.8069
%.tmp8084 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8083, i32 0, i32 6
%.tmp8085 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8084
%t.8086 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8085, %m307$.Node.type** %t.8086
br label %.for.start.8082
.for.start.8082:
%.tmp8087 = load %m307$.Node.type*, %m307$.Node.type** %t.8086
%.tmp8088 = icmp ne %m307$.Node.type* %.tmp8087, null
br i1 %.tmp8088, label %.for.continue.8082, label %.for.end.8082
.for.continue.8082:
%.tmp8089 = load %m1861$.Type.type*, %m1861$.Type.type** %last_fn_value.8081
%.tmp8090 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8089, i32 0, i32 4
%.tmp8091 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8092 = load %m307$.Node.type*, %m307$.Node.type** %t.8086
%.tmp8093 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8092, i32 0, i32 6
%.tmp8094 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8093
%.tmp8095 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8091, %m307$.Node.type* %.tmp8094)
store %m1861$.Type.type* %.tmp8095, %m1861$.Type.type** %.tmp8090
%.tmp8096 = load %m1861$.Type.type*, %m1861$.Type.type** %last_fn_value.8081
%.tmp8097 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8096, i32 0, i32 4
%.tmp8098 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8097
store %m1861$.Type.type* %.tmp8098, %m1861$.Type.type** %last_fn_value.8081
%.tmp8099 = load %m307$.Node.type*, %m307$.Node.type** %t.8086
%.tmp8100 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8099, i32 0, i32 7
%.tmp8101 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8100
store %m307$.Node.type* %.tmp8101, %m307$.Node.type** %t.8086
br label %.for.start.8082
.for.end.8082:
br label %.if.end.8077
.if.false.8077:
br label %.if.end.8077
.if.end.8077:
%.tmp8102 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t_ptr.8103 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8102, %m1861$.Type.type** %t_ptr.8103
%.tmp8104 = load %m1861$.Type.type*, %m1861$.Type.type** %t_ptr.8103
%.tmp8105 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8104, i32 0, i32 0
%.tmp8107 = getelementptr [4 x i8], [4 x i8]*@.str8106, i32 0, i32 0
store i8* %.tmp8107, i8** %.tmp8105
%.tmp8108 = load %m1861$.Type.type*, %m1861$.Type.type** %t_ptr.8103
%.tmp8109 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8108, i32 0, i32 3
%.tmp8110 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8054
store %m1861$.Type.type* %.tmp8110, %m1861$.Type.type** %.tmp8109
%.tmp8111 = load %m1861$.Type.type*, %m1861$.Type.type** %t_ptr.8103
store %m1861$.Type.type* %.tmp8111, %m1861$.Type.type** %t.8037
br label %.if.end.8052
.if.false.8052:
br label %.if.end.8052
.if.end.8052:
br label %.if.end.8042
.if.false.8042:
br label %.if.end.8042
.if.end.8042:
%.tmp8112 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8037
ret %m1861$.Type.type* %.tmp8112
br label %.if.end.8031
.if.false.8031:
br label %.if.end.8031
.if.end.8031:
%.tmp8113 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.8114 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8113, %m1861$.Type.type** %t.8114
%.tmp8115 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8116 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8115, i32 0, i32 0
%.tmp8117 = load i8*, i8** %.tmp8116
%.tmp8119 = getelementptr [10 x i8], [10 x i8]*@.str8118, i32 0, i32 0
%.tmp8120 = call i32(i8*,i8*) @strcmp(i8* %.tmp8117, i8* %.tmp8119)
%.tmp8121 = icmp eq i32 %.tmp8120, 0
br i1 %.tmp8121, label %.if.true.8122, label %.if.false.8122
.if.true.8122:
%.tmp8123 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8124 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8123, i32 0, i32 0
%.tmp8126 = getelementptr [7 x i8], [7 x i8]*@.str8125, i32 0, i32 0
store i8* %.tmp8126, i8** %.tmp8124
%.tmp8127 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8128 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8127, i32 0, i32 1
store i8* null, i8** %.tmp8128
%.tmp8129 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8130 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8129, i32 0, i32 6
%.tmp8131 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8130
%.tmp8133 = getelementptr [5 x i8], [5 x i8]*@.str8132, i32 0, i32 0
%.tmp8134 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8131, i8* %.tmp8133)
%curr_type.8135 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8134, %m307$.Node.type** %curr_type.8135
%.tmp8136 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8137 = icmp ne %m307$.Node.type* %.tmp8136, null
br i1 %.tmp8137, label %.if.true.8138, label %.if.false.8138
.if.true.8138:
%.tmp8139 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8140 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8139, i32 0, i32 3
%.tmp8141 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8142 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8143 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8142, i32 0, i32 6
%.tmp8144 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8143
%.tmp8145 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8141, %m307$.Node.type* %.tmp8144)
store %m1861$.Type.type* %.tmp8145, %m1861$.Type.type** %.tmp8140
%.tmp8146 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8147 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8146, i32 0, i32 3
%.tmp8148 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8147
%.tmp8149 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8148, i32 0, i32 1
%.tmp8150 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8151 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8150, i32 0, i32 7
%.tmp8152 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8151
%.tmp8153 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8152, i32 0, i32 1
%.tmp8154 = load i8*, i8** %.tmp8153
store i8* %.tmp8154, i8** %.tmp8149
%.tmp8155 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8156 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8155, i32 0, i32 3
%.tmp8157 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8156
%curr_t.8158 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8157, %m1861$.Type.type** %curr_t.8158
%.tmp8160 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8161 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8160, i32 0, i32 7
%.tmp8162 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8161
%.tmp8164 = getelementptr [5 x i8], [5 x i8]*@.str8163, i32 0, i32 0
%.tmp8165 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8162, i8* %.tmp8164)
store %m307$.Node.type* %.tmp8165, %m307$.Node.type** %curr_type.8135
br label %.for.start.8159
.for.start.8159:
%.tmp8166 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8167 = icmp ne %m307$.Node.type* %.tmp8166, null
br i1 %.tmp8167, label %.for.continue.8159, label %.for.end.8159
.for.continue.8159:
%.tmp8168 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8158
%.tmp8169 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8168, i32 0, i32 4
%.tmp8170 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8171 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8172 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8171, i32 0, i32 6
%.tmp8173 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8172
%.tmp8174 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8170, %m307$.Node.type* %.tmp8173)
store %m1861$.Type.type* %.tmp8174, %m1861$.Type.type** %.tmp8169
%.tmp8175 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8158
%.tmp8176 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8175, i32 0, i32 4
%.tmp8177 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8176
%.tmp8178 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8177, i32 0, i32 1
%.tmp8179 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8179, i32 0, i32 7
%.tmp8181 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8180
%.tmp8182 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8181, i32 0, i32 1
%.tmp8183 = load i8*, i8** %.tmp8182
store i8* %.tmp8183, i8** %.tmp8178
%.tmp8184 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8158
%.tmp8185 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8184, i32 0, i32 4
%.tmp8186 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8185
store %m1861$.Type.type* %.tmp8186, %m1861$.Type.type** %curr_t.8158
%.tmp8187 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8135
%.tmp8188 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8187, i32 0, i32 7
%.tmp8189 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8188
%.tmp8191 = getelementptr [5 x i8], [5 x i8]*@.str8190, i32 0, i32 0
%.tmp8192 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8189, i8* %.tmp8191)
store %m307$.Node.type* %.tmp8192, %m307$.Node.type** %curr_type.8135
br label %.for.start.8159
.for.end.8159:
br label %.if.end.8138
.if.false.8138:
br label %.if.end.8138
.if.end.8138:
br label %.if.end.8122
.if.false.8122:
%.tmp8193 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8194 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8193, i32 0, i32 0
%.tmp8195 = load i8*, i8** %.tmp8194
%.tmp8197 = getelementptr [12 x i8], [12 x i8]*@.str8196, i32 0, i32 0
%.tmp8198 = call i32(i8*,i8*) @strcmp(i8* %.tmp8195, i8* %.tmp8197)
%.tmp8199 = icmp eq i32 %.tmp8198, 0
br i1 %.tmp8199, label %.if.true.8200, label %.if.false.8200
.if.true.8200:
%err_msg.8201 = alloca i8*
store i8* null, i8** %err_msg.8201
%.tmp8202 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8203 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8204 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8202, %m307$.Node.type* %.tmp8203)
%base.8205 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp8204, %m1861$.ScopeItem.type** %base.8205
%.tmp8206 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8205
%.tmp8207 = icmp eq %m1861$.ScopeItem.type* %.tmp8206, null
br i1 %.tmp8207, label %.if.true.8208, label %.if.false.8208
.if.true.8208:
%.tmp8209 = getelementptr i8*, i8** %err_msg.8201, i32 0
%.tmp8211 = getelementptr [37 x i8], [37 x i8]*@.str8210, i32 0, i32 0
%.tmp8212 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8213 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8212, i32 0, i32 6
%.tmp8214 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8213
%.tmp8215 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8214, i32 0, i32 1
%.tmp8216 = load i8*, i8** %.tmp8215
%.tmp8217 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8209, i8* %.tmp8211, i8* %.tmp8216)
%.tmp8218 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8219 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8220 = load i8*, i8** %err_msg.8201
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8218, %m307$.Node.type* %.tmp8219, i8* %.tmp8220)
%.tmp8221 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8222 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8221, i32 0, i32 0
%.tmp8224 = getelementptr [6 x i8], [6 x i8]*@.str8223, i32 0, i32 0
store i8* %.tmp8224, i8** %.tmp8222
%.tmp8225 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
ret %m1861$.Type.type* %.tmp8225
br label %.if.end.8208
.if.false.8208:
br label %.if.end.8208
.if.end.8208:
%.tmp8226 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8227 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8226, i32 0, i32 0
%.tmp8229 = getelementptr [10 x i8], [10 x i8]*@.str8228, i32 0, i32 0
store i8* %.tmp8229, i8** %.tmp8227
%.tmp8230 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8231 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8230, i32 0, i32 1
%.tmp8232 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8205
%.tmp8233 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8232, i32 0, i32 0
%.tmp8234 = load i8*, i8** %.tmp8233
store i8* %.tmp8234, i8** %.tmp8231
%.tmp8235 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8236 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8235, i32 0, i32 2
%.tmp8237 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8205
%.tmp8238 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8237, i32 0, i32 1
%.tmp8239 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8238
%.tmp8240 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8239, i32 0, i32 0
%.tmp8241 = load i8*, i8** %.tmp8240
store i8* %.tmp8241, i8** %.tmp8236
%.tmp8242 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8243 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8242, i32 0, i32 3
%.tmp8244 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8205
%.tmp8245 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8244, i32 0, i32 1
%.tmp8246 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8245
%.tmp8247 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8246, i32 0, i32 4
%.tmp8248 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8247
store %m1861$.Type.type* %.tmp8248, %m1861$.Type.type** %.tmp8243
br label %.if.end.8200
.if.false.8200:
%.tmp8249 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8250 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8249, i32 0, i32 1
%.tmp8251 = load i8*, i8** %.tmp8250
%.tmp8253 = getelementptr [4 x i8], [4 x i8]*@.str8252, i32 0, i32 0
%.tmp8254 = call i32(i8*,i8*) @strcmp(i8* %.tmp8251, i8* %.tmp8253)
%.tmp8255 = icmp eq i32 %.tmp8254, 0
br i1 %.tmp8255, label %.if.true.8256, label %.if.false.8256
.if.true.8256:
%.tmp8257 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8258 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8257, i32 0, i32 0
%.tmp8260 = getelementptr [4 x i8], [4 x i8]*@.str8259, i32 0, i32 0
store i8* %.tmp8260, i8** %.tmp8258
%.tmp8261 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8262 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8261, i32 0, i32 3
%.tmp8263 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp8263, %m1861$.Type.type** %.tmp8262
%.tmp8264 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8265 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8264, i32 0, i32 3
%.tmp8266 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8265
%.tmp8267 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8266, i32 0, i32 0
%.tmp8269 = getelementptr [4 x i8], [4 x i8]*@.str8268, i32 0, i32 0
store i8* %.tmp8269, i8** %.tmp8267
br label %.if.end.8256
.if.false.8256:
%.tmp8270 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8271 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8270, i32 0, i32 0
%.tmp8272 = load i8*, i8** %.tmp8271
%.tmp8274 = getelementptr [5 x i8], [5 x i8]*@.str8273, i32 0, i32 0
%.tmp8275 = call i32(i8*,i8*) @strcmp(i8* %.tmp8272, i8* %.tmp8274)
%.tmp8276 = icmp eq i32 %.tmp8275, 0
br i1 %.tmp8276, label %.if.true.8277, label %.if.false.8277
.if.true.8277:
%.tmp8278 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8279 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8278, i32 0, i32 0
%.tmp8280 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8281 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8280, i32 0, i32 1
%.tmp8282 = load i8*, i8** %.tmp8281
store i8* %.tmp8282, i8** %.tmp8279
br label %.if.end.8277
.if.false.8277:
%.tmp8283 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8284 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8283, i32 0, i32 1
%.tmp8285 = load i8*, i8** %.tmp8284
%.tmp8287 = getelementptr [4 x i8], [4 x i8]*@.str8286, i32 0, i32 0
%.tmp8288 = call i32(i8*,i8*) @strcmp(i8* %.tmp8285, i8* %.tmp8287)
%.tmp8289 = icmp eq i32 %.tmp8288, 0
br i1 %.tmp8289, label %.if.true.8290, label %.if.false.8290
.if.true.8290:
%.tmp8291 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
%.tmp8292 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8291, i32 0, i32 0
%.tmp8294 = getelementptr [7 x i8], [7 x i8]*@.str8293, i32 0, i32 0
store i8* %.tmp8294, i8** %.tmp8292
br label %.if.end.8290
.if.false.8290:
%.tmp8295 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8296 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8298 = getelementptr [54 x i8], [54 x i8]*@.str8297, i32 0, i32 0
%.tmp8299 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8295, %m307$.Node.type* %.tmp8296, i8* %.tmp8298)
%.tmp8300 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8301 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8300, i32 0, i32 0
%.tmp8302 = load i8*, i8** %.tmp8301
%.tmp8303 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8304 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8303, i32 0, i32 1
%.tmp8305 = load i8*, i8** %.tmp8304
%.tmp8306 = call i32(i8*,...) @printf(i8* %.tmp8299, i8* %.tmp8302, i8* %.tmp8305)
%.tmp8307 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8307
br label %.if.end.8290
.if.end.8290:
br label %.if.end.8277
.if.end.8277:
br label %.if.end.8256
.if.end.8256:
br label %.if.end.8200
.if.end.8200:
br label %.if.end.8122
.if.end.8122:
%.tmp8309 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8310 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8309, i32 0, i32 7
%.tmp8311 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8310
%ptr.8312 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8311, %m307$.Node.type** %ptr.8312
br label %.for.start.8308
.for.start.8308:
%.tmp8313 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8314 = icmp ne %m307$.Node.type* %.tmp8313, null
br i1 %.tmp8314, label %.for.continue.8308, label %.for.end.8308
.for.continue.8308:
%.tmp8315 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8316 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8315, i32 0, i32 1
%.tmp8317 = load i8*, i8** %.tmp8316
%.tmp8319 = getelementptr [2 x i8], [2 x i8]*@.str8318, i32 0, i32 0
%.tmp8320 = call i32(i8*,i8*) @strcmp(i8* %.tmp8317, i8* %.tmp8319)
%.tmp8321 = icmp eq i32 %.tmp8320, 0
br i1 %.tmp8321, label %.if.true.8322, label %.if.false.8322
.if.true.8322:
%.tmp8323 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.8324 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8323, %m1861$.Type.type** %pt.8324
%.tmp8325 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8324
%.tmp8326 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8325, i32 0, i32 0
%.tmp8328 = getelementptr [4 x i8], [4 x i8]*@.str8327, i32 0, i32 0
store i8* %.tmp8328, i8** %.tmp8326
%.tmp8329 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8324
%.tmp8330 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8329, i32 0, i32 3
%.tmp8331 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
store %m1861$.Type.type* %.tmp8331, %m1861$.Type.type** %.tmp8330
%.tmp8332 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8324
store %m1861$.Type.type* %.tmp8332, %m1861$.Type.type** %t.8114
br label %.if.end.8322
.if.false.8322:
%.tmp8333 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8334 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8333, i32 0, i32 1
%.tmp8335 = load i8*, i8** %.tmp8334
%.tmp8337 = getelementptr [2 x i8], [2 x i8]*@.str8336, i32 0, i32 0
%.tmp8338 = call i32(i8*,i8*) @strcmp(i8* %.tmp8335, i8* %.tmp8337)
%.tmp8339 = icmp eq i32 %.tmp8338, 0
br i1 %.tmp8339, label %.if.true.8340, label %.if.false.8340
.if.true.8340:
%.tmp8341 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8342 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8341, i32 0, i32 7
%.tmp8343 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8342
%.tmp8344 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8343, i32 0, i32 1
%.tmp8345 = load i8*, i8** %.tmp8344
%.tmp8347 = getelementptr [2 x i8], [2 x i8]*@.str8346, i32 0, i32 0
%.tmp8348 = call i32(i8*,i8*) @strcmp(i8* %.tmp8345, i8* %.tmp8347)
%.tmp8349 = icmp eq i32 %.tmp8348, 0
br i1 %.tmp8349, label %.if.true.8350, label %.if.false.8350
.if.true.8350:
%.tmp8351 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.8352 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8351, %m1861$.Type.type** %slice_type.8352
%.tmp8353 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8352
%.tmp8354 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8353, i32 0, i32 0
%.tmp8356 = getelementptr [7 x i8], [7 x i8]*@.str8355, i32 0, i32 0
store i8* %.tmp8356, i8** %.tmp8354
%.tmp8357 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8352
%.tmp8358 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8357, i32 0, i32 1
%.tmp8360 = getelementptr [6 x i8], [6 x i8]*@.str8359, i32 0, i32 0
store i8* %.tmp8360, i8** %.tmp8358
%.tmp8361 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.8362 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8361, %m1861$.Type.type** %slice_c_array.8362
%.tmp8363 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8362
%.tmp8364 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8363, i32 0, i32 0
%.tmp8366 = getelementptr [4 x i8], [4 x i8]*@.str8365, i32 0, i32 0
store i8* %.tmp8366, i8** %.tmp8364
%.tmp8367 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8362
%.tmp8368 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8367, i32 0, i32 1
%.tmp8370 = getelementptr [6 x i8], [6 x i8]*@.str8369, i32 0, i32 0
store i8* %.tmp8370, i8** %.tmp8368
%.tmp8371 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8362
%.tmp8372 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8371, i32 0, i32 3
%.tmp8373 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
store %m1861$.Type.type* %.tmp8373, %m1861$.Type.type** %.tmp8372
%.tmp8374 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8352
%.tmp8375 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8374, i32 0, i32 3
%.tmp8376 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8362
store %m1861$.Type.type* %.tmp8376, %m1861$.Type.type** %.tmp8375
%.tmp8377 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.8378 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8377, %m1861$.Type.type** %slice_len.8378
%.tmp8379 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8378
%.tmp8380 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8379, i32 0, i32 0
%.tmp8382 = getelementptr [4 x i8], [4 x i8]*@.str8381, i32 0, i32 0
store i8* %.tmp8382, i8** %.tmp8380
%.tmp8383 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8378
%.tmp8384 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8383, i32 0, i32 1
%.tmp8386 = getelementptr [4 x i8], [4 x i8]*@.str8385, i32 0, i32 0
store i8* %.tmp8386, i8** %.tmp8384
%.tmp8387 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8362
%.tmp8388 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8387, i32 0, i32 4
%.tmp8389 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8378
store %m1861$.Type.type* %.tmp8389, %m1861$.Type.type** %.tmp8388
%.tmp8390 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.8391 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8390, %m1861$.Type.type** %slice_cap.8391
%.tmp8392 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8391
%.tmp8393 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8392, i32 0, i32 0
%.tmp8395 = getelementptr [4 x i8], [4 x i8]*@.str8394, i32 0, i32 0
store i8* %.tmp8395, i8** %.tmp8393
%.tmp8396 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8391
%.tmp8397 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8396, i32 0, i32 1
%.tmp8399 = getelementptr [4 x i8], [4 x i8]*@.str8398, i32 0, i32 0
store i8* %.tmp8399, i8** %.tmp8397
%.tmp8400 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8378
%.tmp8401 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8400, i32 0, i32 4
%.tmp8402 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8391
store %m1861$.Type.type* %.tmp8402, %m1861$.Type.type** %.tmp8401
%.tmp8403 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8352
store %m1861$.Type.type* %.tmp8403, %m1861$.Type.type** %t.8114
%.tmp8404 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8405 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8404, i32 0, i32 7
%.tmp8406 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8405
store %m307$.Node.type* %.tmp8406, %m307$.Node.type** %ptr.8312
br label %.if.end.8350
.if.false.8350:
br label %.if.end.8350
.if.end.8350:
br label %.if.end.8340
.if.false.8340:
%.tmp8407 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8408 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8410 = getelementptr [49 x i8], [49 x i8]*@.str8409, i32 0, i32 0
%.tmp8411 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8407, %m307$.Node.type* %.tmp8408, i8* %.tmp8410)
%.tmp8412 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8413 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8412, i32 0, i32 1
%.tmp8414 = load i8*, i8** %.tmp8413
%.tmp8415 = call i32(i8*,...) @printf(i8* %.tmp8411, i8* %.tmp8414)
%.tmp8416 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8416
br label %.if.end.8340
.if.end.8340:
br label %.if.end.8322
.if.end.8322:
%.tmp8417 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8312
%.tmp8418 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8417, i32 0, i32 7
%.tmp8419 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8418
store %m307$.Node.type* %.tmp8419, %m307$.Node.type** %ptr.8312
br label %.for.start.8308
.for.end.8308:
%.tmp8420 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8114
ret %m1861$.Type.type* %.tmp8420
}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8421 = load i32, i32* %argc
%.tmp8422 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp8421, i8** %.tmp8422)
%.tmp8423 = load i32, i32* @STDERR
%.tmp8425 = getelementptr [2 x i8], [2 x i8]*@.str8424, i32 0, i32 0
%.tmp8426 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp8423, i8* %.tmp8425)
%stderr.8427 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8426, %m0$.File.type** %stderr.8427
%.tmp8428 = load i8**, i8*** %argv
%.tmp8429 = getelementptr i8*, i8** %.tmp8428, i32 1
%.tmp8430 = load i8*, i8** %.tmp8429
%filename.8431 = alloca i8*
store i8* %.tmp8430, i8** %filename.8431
%.tmp8432 = call %m0$.File.type*() @tmpfile()
%llvm_code.8433 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8432, %m0$.File.type** %llvm_code.8433
%.tmp8434 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8433
%.tmp8435 = load i8*, i8** %filename.8431
%.tmp8436 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp8434, i8* %.tmp8435)
%compiler_ctx.8437 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp8436, %m1861$.CompilerCtx.type** %compiler_ctx.8437
%.tmp8438 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.8437
%.tmp8439 = bitcast ptr null to %m307$.Node.type*
%.tmp8440 = load i8*, i8** %filename.8431
%.tmp8441 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8438, %m307$.Node.type* %.tmp8439, i8* %.tmp8440)
br i1 %.tmp8441, label %.if.true.8442, label %.if.false.8442
.if.true.8442:
%.tmp8443 = load %m0$.File.type*, %m0$.File.type** %stderr.8427
%.tmp8445 = getelementptr [34 x i8], [34 x i8]*@.str8444, i32 0, i32 0
%.tmp8446 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8443, i8* %.tmp8445)
ret i32 1
br label %.if.end.8442
.if.false.8442:
br label %.if.end.8442
.if.end.8442:
%.tmp8447 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8433
%.tmp8448 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp8447)
%.tmp8449 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8433
%.tmp8450 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp8449)
%llvm_code_size.8451 = alloca i32
store i32 %.tmp8450, i32* %llvm_code_size.8451
%.tmp8452 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8433
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp8452)
%.tmp8454 = getelementptr [30 x i8], [30 x i8]*@.str8453, i32 0, i32 0
%.tmp8456 = getelementptr [2 x i8], [2 x i8]*@.str8455, i32 0, i32 0
%.tmp8457 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8454, i8* %.tmp8456)
%proc.8458 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8457, %m0$.File.type** %proc.8458
%.tmp8459 = load %m0$.File.type*, %m0$.File.type** %proc.8458
%.tmp8460 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8459)
%.tmp8461 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8433
%.tmp8462 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8461)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp8460, i32 %.tmp8462)
%.tmp8463 = load %m0$.File.type*, %m0$.File.type** %proc.8458
%.tmp8464 = icmp eq %m0$.File.type* %.tmp8463, null
br i1 %.tmp8464, label %.if.true.8465, label %.if.false.8465
.if.true.8465:
%.tmp8466 = load %m0$.File.type*, %m0$.File.type** %stderr.8427
%.tmp8468 = getelementptr [28 x i8], [28 x i8]*@.str8467, i32 0, i32 0
%.tmp8469 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8466, i8* %.tmp8468)
ret i32 0
br label %.if.end.8465
.if.false.8465:
br label %.if.end.8465
.if.end.8465:
%.tmp8470 = load %m0$.File.type*, %m0$.File.type** %proc.8458
%.tmp8471 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8470)
%.tmp8472 = icmp ne i32 %.tmp8471, 0
br i1 %.tmp8472, label %.if.true.8473, label %.if.false.8473
.if.true.8473:
%.tmp8474 = load %m0$.File.type*, %m0$.File.type** %stderr.8427
%.tmp8476 = getelementptr [24 x i8], [24 x i8]*@.str8475, i32 0, i32 0
%.tmp8477 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8474, i8* %.tmp8476)
ret i32 0
br label %.if.end.8473
.if.false.8473:
br label %.if.end.8473
.if.end.8473:
%.tmp8479 = getelementptr [16 x i8], [16 x i8]*@.str8478, i32 0, i32 0
%.tmp8481 = getelementptr [2 x i8], [2 x i8]*@.str8480, i32 0, i32 0
%.tmp8482 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8479, i8* %.tmp8481)
%cc_proc.8483 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8482, %m0$.File.type** %cc_proc.8483
%.tmp8484 = load %m0$.File.type*, %m0$.File.type** %cc_proc.8483
%.tmp8485 = icmp eq %m0$.File.type* %.tmp8484, null
br i1 %.tmp8485, label %.if.true.8486, label %.if.false.8486
.if.true.8486:
%.tmp8487 = load %m0$.File.type*, %m0$.File.type** %stderr.8427
%.tmp8489 = getelementptr [28 x i8], [28 x i8]*@.str8488, i32 0, i32 0
%.tmp8490 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8487, i8* %.tmp8489)
ret i32 0
br label %.if.end.8486
.if.false.8486:
br label %.if.end.8486
.if.end.8486:
%.tmp8491 = load %m0$.File.type*, %m0$.File.type** %proc.8458
%.tmp8492 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8491)
%.tmp8493 = icmp ne i32 %.tmp8492, 0
br i1 %.tmp8493, label %.if.true.8494, label %.if.false.8494
.if.true.8494:
%.tmp8495 = load %m0$.File.type*, %m0$.File.type** %stderr.8427
%.tmp8497 = getelementptr [22 x i8], [22 x i8]*@.str8496, i32 0, i32 0
%.tmp8498 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8495, i8* %.tmp8497)
br label %.if.end.8494
.if.false.8494:
%.tmp8500 = getelementptr [32 x i8], [32 x i8]*@.str8499, i32 0, i32 0
%.tmp8501 = load i8*, i8** %filename.8431
%.tmp8502 = call i32(i8*,...) @printf(i8* %.tmp8500, i8* %.tmp8501)
br label %.if.end.8494
.if.end.8494:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8503 = load i32, i32* %argc
%.tmp8504 = icmp eq i32 %.tmp8503, 2
br i1 %.tmp8504, label %.if.true.8505, label %.if.false.8505
.if.true.8505:
ret void
br label %.if.end.8505
.if.false.8505:
br label %.if.end.8505
.if.end.8505:
%.tmp8507 = getelementptr [21 x i8], [21 x i8]*@.str8506, i32 0, i32 0
%tmpl.8508 = alloca i8*
store i8* %.tmp8507, i8** %tmpl.8508
%.tmp8509 = load i8**, i8*** %argv
%.tmp8510 = getelementptr i8*, i8** %.tmp8509, i32 0
%.tmp8511 = load i8*, i8** %.tmp8510
%.tmp8512 = call i32(i8*) @strlen(i8* %.tmp8511)
%.tmp8513 = load i8*, i8** %tmpl.8508
%.tmp8514 = call i32(i8*) @strlen(i8* %.tmp8513)
%.tmp8515 = add i32 %.tmp8512, %.tmp8514
%len_filename.8516 = alloca i32
store i32 %.tmp8515, i32* %len_filename.8516
%.tmp8517 = load i32, i32* %len_filename.8516
%.tmp8518 = call i8*(i32) @malloc(i32 %.tmp8517)
%buf.8519 = alloca i8*
store i8* %.tmp8518, i8** %buf.8519
%.tmp8520 = load i8*, i8** %buf.8519
%.tmp8521 = load i8*, i8** %tmpl.8508
%.tmp8522 = load i8**, i8*** %argv
%.tmp8523 = getelementptr i8*, i8** %.tmp8522, i32 0
%.tmp8524 = load i8*, i8** %.tmp8523
%.tmp8525 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8520, i8* %.tmp8521, i8* %.tmp8524)
%.tmp8526 = load i8*, i8** %buf.8519
%.tmp8527 = call i32(i8*) @puts(i8* %.tmp8526)
%.tmp8528 = load i8*, i8** %buf.8519
call void(i8*) @free(i8* %.tmp8528)
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
@.str1863 = constant [1836 x i8] c"
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

basic_type: ( \22void\22 | \22int\22 | \22bool\22 | \22chr\22 | \22str\22 | structdef | dotted_name | \22...\22 ) (\22[\22 \22]\22)* (\22*\22)*

type: basic_type (type_trailer)?

type_fn_params: type ( \22,\22 type )*

type_trailer: \22(\22 ( type_fn_params )? ( \22)\22 ) (type_trailer)?

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
@.str2237 = constant [1 x i8] c"\00"
@.str2253 = constant [6 x i8] c"%s\5C22\00"
@.str2278 = constant [6 x i8] c"%s\5C0A\00"
@.str2292 = constant [6 x i8] c"%s\5C5C\00"
@.str2308 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2326 = constant [5 x i8] c"%s%c\00"
@.str2335 = constant [5 x i8] c"%s%c\00"
@.str2346 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2383 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2388 = constant [3 x i8] c"%d\00"
@.str2396 = constant [6 x i8] c"'\5C%x'\00"
@.str2401 = constant [3 x i8] c"%d\00"
@.str2409 = constant [6 x i8] c"'\5C%c'\00"
@.str2416 = constant [3 x i8] c"10\00"
@.str2423 = constant [5 x i8] c"'%c'\00"
@.str2428 = constant [3 x i8] c"%d\00"
@.str2435 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2473 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str2480 = constant [5 x i8] c"HOME\00"
@.str2485 = constant [11 x i8] c"%s/.coffee\00"
@.str2573 = constant [1 x i8] c"\00"
@.str2619 = constant [5 x i8] c"%c%s\00"
@.str2643 = constant [7 x i8] c".tmp%d\00"
@.str2740 = constant [1 x i8] c"\00"
@.str2782 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2806 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2825 = constant [6 x i8] c"start\00"
@.str2902 = constant [6 x i8] c"start\00"
@.str2909 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str2912 = constant [7 x i8] c"global\00"
@.str2923 = constant [13 x i8] c"head_comment\00"
@.str2961 = constant [1 x i8] c"\00"
@.str2985 = constant [7 x i8] c"string\00"
@.str2993 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3013 = constant [7 x i8] c"extern\00"
@.str3027 = constant [15 x i8] c"declare %s %s(\00"
@.str3063 = constant [3 x i8] c", \00"
@.str3069 = constant [3 x i8] c"%s\00"
@.str3081 = constant [3 x i8] c")\0A\00"
@.str3098 = constant [5 x i8] c"%s%s\00"
@.str3106 = constant [9 x i8] c"function\00"
@.str3112 = constant [5 x i8] c"main\00"
@.str3127 = constant [6 x i8] c"%s.%s\00"
@.str3148 = constant [3 x i8] c"NL\00"
@.str3156 = constant [7 x i8] c"global\00"
@.str3164 = constant [11 x i8] c"assignable\00"
@.str3195 = constant [9 x i8] c"variable\00"
@.str3207 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3222 = constant [10 x i8] c"typealias\00"
@.str3244 = constant [11 x i8] c"%s.%s.type\00"
@.str3256 = constant [10 x i8] c"typealias\00"
@.str3278 = constant [5 x i8] c"type\00"
@.str3308 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3321 = constant [7 x i8] c"extern\00"
@.str3339 = constant [7 x i8] c"extern\00"
@.str3380 = constant [7 x i8] c"extern\00"
@.str3392 = constant [9 x i8] c"function\00"
@.str3401 = constant [9 x i8] c"function\00"
@.str3440 = constant [14 x i8] c"define %s %s(\00"
@.str3469 = constant [3 x i8] c", \00"
@.str3475 = constant [5 x i8] c"type\00"
@.str3491 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3506 = constant [5 x i8] c") {\0A\00"
@.str3510 = constant [9 x i8] c"function\00"
@.str3519 = constant [6 x i8] c"block\00"
@.str3531 = constant [12 x i8] c"expressions\00"
@.str3544 = constant [3 x i8] c"NL\00"
@.str3551 = constant [9 x i8] c"OPERATOR\00"
@.str3570 = constant [7 x i8] c"return\00"
@.str3580 = constant [5 x i8] c"void\00"
@.str3587 = constant [21 x i8] c"missing return value\00"
@.str3592 = constant [10 x i8] c"ret void\0A\00"
@.str3598 = constant [3 x i8] c"}\0A\00"
@.str3604 = constant [7 x i8] c"import\00"
@.str3659 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3718 = constant [5 x i8] c"m%d$\00"
@.str3769 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3778 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3810 = constant [9 x i8] c"variable\00"
@.str3815 = constant [5 x i8] c"type\00"
@.str3847 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3860 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3872 = constant [6 x i8] c"block\00"
@.str3879 = constant [12 x i8] c"expressions\00"
@.str3910 = constant [7 x i8] c"struct\00"
@.str3915 = constant [7 x i8] c"WhAT!\0A\00"
@.str3955 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str3967 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str3993 = constant [7 x i8] c"struct\00"
@.str3998 = constant [7 x i8] c"WhAT!\0A\00"
@.str4029 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4041 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4066 = constant [7 x i8] c"sizeof\00"
@.str4072 = constant [8 x i8] c"fn_args\00"
@.str4079 = constant [11 x i8] c"assignable\00"
@.str4107 = constant [4 x i8] c"int\00"
@.str4120 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4129 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4140 = constant [7 x i8] c"append\00"
@.str4146 = constant [8 x i8] c"fn_args\00"
@.str4153 = constant [11 x i8] c"assignable\00"
@.str4160 = constant [11 x i8] c"assignable\00"
@.str4184 = constant [5 x i8] c".b%d\00"
@.str4218 = constant [8 x i8] c"realloc\00"
@.str4227 = constant [9 x i8] c"function\00"
@.str4240 = constant [4 x i8] c"ptr\00"
@.str4257 = constant [4 x i8] c"chr\00"
@.str4274 = constant [4 x i8] c"ptr\00"
@.str4295 = constant [4 x i8] c"chr\00"
@.str4316 = constant [4 x i8] c"int\00"
@.str4319 = constant [8 x i8] c"realloc\00"
@.str4321 = constant [7 x i8] c"extern\00"
@.str4328 = constant [4 x i8] c"len\00"
@.str4334 = constant [8 x i8] c"fn_args\00"
@.str4341 = constant [11 x i8] c"assignable\00"
@.str4349 = constant [1 x i8] c"\00"
@.str4365 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4386 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4392 = constant [1 x i8] c"\00"
@.str4398 = constant [6 x i8] c"%s.bn\00"
@.str4403 = constant [9 x i8] c"%s/%s.bn\00"
@.str4427 = constant [35 x i8] c"unable to compile function address\00"
@.str4433 = constant [8 x i8] c"fn_args\00"
@.str4437 = constant [1 x i8] c"\00"
@.str4446 = constant [4 x i8] c"ptr\00"
@.str4466 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4490 = constant [11 x i8] c"assignable\00"
@.str4514 = constant [11 x i8] c"assignable\00"
@.str4526 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4544 = constant [5 x i8] c"%s, \00"
@.str4569 = constant [7 x i8] c"vararg\00"
@.str4582 = constant [1 x i8] c"\00"
@.str4586 = constant [52 x i8] c"Type for argument %d does not match: '%s', got '%s'\00"
@.str4603 = constant [8 x i8] c"%s%s %s\00"
@.str4620 = constant [7 x i8] c"vararg\00"
@.str4631 = constant [11 x i8] c"assignable\00"
@.str4640 = constant [7 x i8] c"vararg\00"
@.str4646 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4682 = constant [7 x i8] c"vararg\00"
@.str4693 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4711 = constant [5 x i8] c"void\00"
@.str4719 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4751 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4777 = constant [7 x i8] c"return\00"
@.str4789 = constant [3 x i8] c"NL\00"
@.str4807 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4820 = constant [10 x i8] c"ret void\0A\00"
@.str4824 = constant [3 x i8] c"NL\00"
@.str4830 = constant [8 x i8] c"fn_call\00"
@.str4841 = constant [12 x i8] c"declaration\00"
@.str4850 = constant [11 x i8] c"assignment\00"
@.str4858 = constant [11 x i8] c"assignable\00"
@.str4889 = constant [4 x i8] c"ptr\00"
@.str4898 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4908 = constant [9 x i8] c"if_block\00"
@.str4916 = constant [9 x i8] c"for_loop\00"
@.str4924 = constant [8 x i8] c"keyword\00"
@.str4941 = constant [6 x i8] c"break\00"
@.str4952 = constant [4 x i8] c"for\00"
@.str4960 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4971 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4978 = constant [9 x i8] c"continue\00"
@.str4989 = constant [4 x i8] c"for\00"
@.str4997 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5008 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str5012 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str5023 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5042 = constant [14 x i8] c".for.start.%d\00"
@.str5047 = constant [12 x i8] c".for.end.%d\00"
@.str5052 = constant [4 x i8] c"for\00"
@.str5059 = constant [12 x i8] c"declaration\00"
@.str5070 = constant [11 x i8] c"assignment\00"
@.str5080 = constant [9 x i8] c"OPERATOR\00"
@.str5087 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5098 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5105 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5112 = constant [9 x i8] c"OPERATOR\00"
@.str5123 = constant [9 x i8] c"OPERATOR\00"
@.str5130 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5139 = constant [9 x i8] c"OPERATOR\00"
@.str5144 = constant [6 x i8] c"block\00"
@.str5149 = constant [11 x i8] c"else_block\00"
@.str5159 = constant [13 x i8] c".for.else.%d\00"
@.str5166 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5181 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5200 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5210 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5217 = constant [6 x i8] c"block\00"
@.str5226 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5233 = constant [5 x i8] c"%s:\0A\00"
@.str5247 = constant [5 x i8] c"type\00"
@.str5262 = constant [11 x i8] c"assignable\00"
@.str5277 = constant [9 x i8] c"variable\00"
@.str5282 = constant [5 x i8] c"WORD\00"
@.str5291 = constant [31 x i8] c"unable to get declaration name\00"
@.str5311 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5323 = constant [6 x i8] c"%s.%d\00"
@.str5380 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5397 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5409 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5450 = constant [4 x i8] c"int\00"
@.str5457 = constant [4 x i8] c"chr\00"
@.str5465 = constant [5 x i8] c"bool\00"
@.str5474 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5483 = constant [4 x i8] c"ptr\00"
@.str5491 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5494 = constant [5 x i8] c"null\00"
@.str5502 = constant [7 x i8] c"struct\00"
@.str5523 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5543 = constant [10 x i8] c"typealias\00"
@.str5566 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5585 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5602 = constant [11 x i8] c"assignable\00"
@.str5619 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5634 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5641 = constant [6 x i8] c"block\00"
@.str5650 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5657 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5664 = constant [11 x i8] c"elif_block\00"
@.str5676 = constant [11 x i8] c"else_block\00"
@.str5686 = constant [6 x i8] c"block\00"
@.str5696 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5703 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5724 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5733 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5767 = constant [1 x i8] c"\00"
@.str5778 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5798 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5823 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5844 = constant [7 x i8] c"module\00"
@.str5897 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5934 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5942 = constant [9 x i8] c"function\00"
@.str5949 = constant [7 x i8] c"extern\00"
@.str5961 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5982 = constant [9 x i8] c"variable\00"
@.str6004 = constant [4 x i8] c"ptr\00"
@.str6023 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6047 = constant [10 x i8] c"typealias\00"
@.str6058 = constant [7 x i8] c"struct\00"
@.str6064 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6116 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6137 = constant [9 x i8] c"variable\00"
@.str6148 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6169 = constant [9 x i8] c"variable\00"
@.str6177 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6191 = constant [17 x i8] c"addr_destination\00"
@.str6198 = constant [16 x i8] c"mono_assignable\00"
@.str6206 = constant [11 x i8] c"assignable\00"
@.str6220 = constant [12 x i8] c"destination\00"
@.str6225 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6253 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6272 = constant [7 x i8] c"module\00"
@.str6294 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6365 = constant [6 x i8] c"slice\00"
@.str6378 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6420 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6441 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6465 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6488 = constant [16 x i8] c"mono_assignable\00"
@.str6514 = constant [5 x i8] c"cast\00"
@.str6524 = constant [5 x i8] c"type\00"
@.str6549 = constant [8 x i8] c"bitcast\00"
@.str6564 = constant [6 x i8] c"slice\00"
@.str6569 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str6577 = constant [4 x i8] c"ptr\00"
@.str6584 = constant [4 x i8] c"ptr\00"
@.str6603 = constant [4 x i8] c"i%d\00"
@.str6608 = constant [4 x i8] c"i%d\00"
@.str6616 = constant [5 x i8] c"sext\00"
@.str6618 = constant [6 x i8] c"trunc\00"
@.str6623 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6643 = constant [16 x i8] c"mono_assignable\00"
@.str6705 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6728 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6735 = constant [2 x i8] c"+\00"
@.str6740 = constant [4 x i8] c"add\00"
@.str6745 = constant [2 x i8] c"-\00"
@.str6750 = constant [4 x i8] c"sub\00"
@.str6755 = constant [2 x i8] c"*\00"
@.str6760 = constant [4 x i8] c"mul\00"
@.str6765 = constant [2 x i8] c"/\00"
@.str6770 = constant [5 x i8] c"sdiv\00"
@.str6775 = constant [3 x i8] c"==\00"
@.str6780 = constant [8 x i8] c"icmp eq\00"
@.str6785 = constant [3 x i8] c"!=\00"
@.str6790 = constant [8 x i8] c"icmp ne\00"
@.str6795 = constant [2 x i8] c">\00"
@.str6800 = constant [9 x i8] c"icmp sgt\00"
@.str6805 = constant [2 x i8] c"<\00"
@.str6810 = constant [9 x i8] c"icmp slt\00"
@.str6815 = constant [2 x i8] c"&\00"
@.str6820 = constant [4 x i8] c"and\00"
@.str6825 = constant [2 x i8] c"|\00"
@.str6830 = constant [3 x i8] c"or\00"
@.str6835 = constant [3 x i8] c">=\00"
@.str6840 = constant [9 x i8] c"icmp sge\00"
@.str6845 = constant [3 x i8] c"<=\00"
@.str6850 = constant [9 x i8] c"icmp sle\00"
@.str6855 = constant [2 x i8] c"%\00"
@.str6860 = constant [5 x i8] c"srem\00"
@.str6864 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6871 = constant [4 x i8] c"add\00"
@.str6878 = constant [3 x i8] c"==\00"
@.str6885 = constant [3 x i8] c"!=\00"
@.str6893 = constant [2 x i8] c"|\00"
@.str6901 = constant [2 x i8] c"&\00"
@.str6909 = constant [2 x i8] c">\00"
@.str6917 = constant [2 x i8] c"<\00"
@.str6925 = constant [3 x i8] c">=\00"
@.str6933 = constant [3 x i8] c"<=\00"
@.str6941 = constant [5 x i8] c"bool\00"
@.str6945 = constant [4 x i8] c"int\00"
@.str6959 = constant [7 x i8] c"NUMBER\00"
@.str6973 = constant [4 x i8] c"int\00"
@.str6987 = constant [5 x i8] c"WORD\00"
@.str6997 = constant [5 x i8] c"null\00"
@.str7004 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7018 = constant [5 x i8] c"null\00"
@.str7027 = constant [8 x i8] c"nullptr\00"
@.str7034 = constant [17 x i8] c"addr_destination\00"
@.str7046 = constant [12 x i8] c"destination\00"
@.str7090 = constant [4 x i8] c"ptr\00"
@.str7109 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7121 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7135 = constant [8 x i8] c"boolean\00"
@.str7149 = constant [5 x i8] c"bool\00"
@.str7158 = constant [6 x i8] c"false\00"
@.str7165 = constant [2 x i8] c"0\00"
@.str7169 = constant [2 x i8] c"1\00"
@.str7176 = constant [8 x i8] c"fn_call\00"
@.str7193 = constant [7 x i8] c"STRING\00"
@.str7219 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7235 = constant [4 x i8] c"ptr\00"
@.str7248 = constant [4 x i8] c"chr\00"
@.str7255 = constant [4 x i8] c"CHR\00"
@.str7271 = constant [2 x i8] c"0\00"
@.str7287 = constant [22 x i8] c"Invalid character: %s\00"
@.str7303 = constant [4 x i8] c"chr\00"
@.str7307 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7335 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7341 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7346 = constant [4 x i8] c"int\00"
@.str7351 = constant [2 x i8] c"i\00"
@.str7356 = constant [5 x i8] c"bool\00"
@.str7361 = constant [2 x i8] c"b\00"
@.str7366 = constant [5 x i8] c"void\00"
@.str7371 = constant [2 x i8] c"v\00"
@.str7376 = constant [4 x i8] c"chr\00"
@.str7381 = constant [2 x i8] c"c\00"
@.str7386 = constant [4 x i8] c"ptr\00"
@.str7393 = constant [4 x i8] c"%sp\00"
@.str7404 = constant [10 x i8] c"typealias\00"
@.str7415 = constant [7 x i8] c"struct\00"
@.str7420 = constant [2 x i8] c"s\00"
@.str7431 = constant [5 x i8] c"%s%s\00"
@.str7444 = constant [9 x i8] c"function\00"
@.str7449 = constant [2 x i8] c"f\00"
@.str7454 = constant [6 x i8] c"error\00"
@.str7459 = constant [2 x i8] c"?\00"
@.str7461 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7473 = constant [7 x i8] c".str%d\00"
@.str7488 = constant [6 x i8] c"array\00"
@.str7501 = constant [4 x i8] c"chr\00"
@.str7522 = constant [3 x i8] c"%d\00"
@.str7529 = constant [7 x i8] c"string\00"
@.str7565 = constant [7 x i8] c"module\00"
@.str7617 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7623 = constant [2 x i8] c"?\00"
@.str7629 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7635 = constant [4 x i8] c"int\00"
@.str7640 = constant [4 x i8] c"i32\00"
@.str7645 = constant [5 x i8] c"void\00"
@.str7650 = constant [5 x i8] c"void\00"
@.str7655 = constant [5 x i8] c"bool\00"
@.str7660 = constant [3 x i8] c"i1\00"
@.str7665 = constant [8 x i8] c"nullptr\00"
@.str7670 = constant [4 x i8] c"ptr\00"
@.str7675 = constant [4 x i8] c"chr\00"
@.str7680 = constant [3 x i8] c"i8\00"
@.str7685 = constant [9 x i8] c"function\00"
@.str7691 = constant [4 x i8] c"%s(\00"
@.str7717 = constant [4 x i8] c"%s,\00"
@.str7722 = constant [5 x i8] c"%s%s\00"
@.str7733 = constant [4 x i8] c"%s)\00"
@.str7741 = constant [4 x i8] c"ptr\00"
@.str7747 = constant [4 x i8] c"%s*\00"
@.str7759 = constant [7 x i8] c"struct\00"
@.str7765 = constant [2 x i8] c"{\00"
@.str7782 = constant [4 x i8] c"%s,\00"
@.str7787 = constant [5 x i8] c"%s%s\00"
@.str7798 = constant [4 x i8] c"%s}\00"
@.str7806 = constant [6 x i8] c"array\00"
@.str7812 = constant [10 x i8] c"[%s x %s]\00"
@.str7831 = constant [10 x i8] c"typealias\00"
@.str7837 = constant [5 x i8] c"%%%s\00"
@.str7847 = constant [7 x i8] c"vararg\00"
@.str7852 = constant [4 x i8] c"...\00"
@.str7857 = constant [6 x i8] c"error\00"
@.str7862 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7938 = constant [9 x i8] c"function\00"
@.str7956 = constant [5 x i8] c"WORD\00"
@.str8013 = constant [10 x i8] c"fn_params\00"
@.str8027 = constant [11 x i8] c"basic_type\00"
@.str8048 = constant [13 x i8] c"type_trailer\00"
@.str8057 = constant [9 x i8] c"function\00"
@.str8073 = constant [15 x i8] c"type_fn_params\00"
@.str8106 = constant [4 x i8] c"ptr\00"
@.str8118 = constant [10 x i8] c"structdef\00"
@.str8125 = constant [7 x i8] c"struct\00"
@.str8132 = constant [5 x i8] c"type\00"
@.str8163 = constant [5 x i8] c"type\00"
@.str8190 = constant [5 x i8] c"type\00"
@.str8196 = constant [12 x i8] c"dotted_name\00"
@.str8210 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str8223 = constant [6 x i8] c"error\00"
@.str8228 = constant [10 x i8] c"typealias\00"
@.str8252 = constant [4 x i8] c"str\00"
@.str8259 = constant [4 x i8] c"ptr\00"
@.str8268 = constant [4 x i8] c"chr\00"
@.str8273 = constant [5 x i8] c"WORD\00"
@.str8286 = constant [4 x i8] c"...\00"
@.str8293 = constant [7 x i8] c"vararg\00"
@.str8297 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str8318 = constant [2 x i8] c"*\00"
@.str8327 = constant [4 x i8] c"ptr\00"
@.str8336 = constant [2 x i8] c"[\00"
@.str8346 = constant [2 x i8] c"]\00"
@.str8355 = constant [7 x i8] c"struct\00"
@.str8359 = constant [6 x i8] c"slice\00"
@.str8365 = constant [4 x i8] c"ptr\00"
@.str8369 = constant [6 x i8] c"c_arr\00"
@.str8381 = constant [4 x i8] c"int\00"
@.str8385 = constant [4 x i8] c"len\00"
@.str8394 = constant [4 x i8] c"int\00"
@.str8398 = constant [4 x i8] c"cap\00"
@.str8409 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str8424 = constant [2 x i8] c"w\00"
@.str8444 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str8453 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str8455 = constant [2 x i8] c"w\00"
@.str8467 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8475 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8478 = constant [16 x i8] c"cc out.s -o out\00"
@.str8480 = constant [2 x i8] c"w\00"
@.str8488 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8496 = constant [22 x i8] c"error on cc execution\00"
@.str8499 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8506 = constant [21 x i8] c"Usage: %s <filename>\00"
