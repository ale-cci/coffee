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
%m1861$.AssignableInfo.type = type {i8*,i8,i8*,%m1861$.Type.type*,i32,i32,i8*}
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
%.tmp2676 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2675, i32 0, i32 2
store i8* null, i8** %.tmp2676
%.tmp2677 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2678 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2677, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp2678
%.tmp2679 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2680 = icmp ne %m307$.Node.type* %.tmp2679, null
br i1 %.tmp2680, label %.if.true.2681, label %.if.false.2681
.if.true.2681:
%.tmp2682 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2683 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2682, i32 0, i32 4
%.tmp2684 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2685 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2684, i32 0, i32 3
%.tmp2686 = load i32, i32* %.tmp2685
store i32 %.tmp2686, i32* %.tmp2683
%.tmp2687 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2688 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2687, i32 0, i32 5
%.tmp2689 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2690 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2689, i32 0, i32 4
%.tmp2691 = load i32, i32* %.tmp2690
store i32 %.tmp2691, i32* %.tmp2688
%.tmp2692 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2693 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2692, i32 0, i32 6
%.tmp2694 = load %m307$.Node.type*, %m307$.Node.type** %node
%.tmp2695 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2694, i32 0, i32 2
%.tmp2696 = load i8*, i8** %.tmp2695
store i8* %.tmp2696, i8** %.tmp2693
br label %.if.end.2681
.if.false.2681:
%.tmp2697 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2698 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2697, i32 0, i32 4
store i32 0, i32* %.tmp2698
%.tmp2699 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2700 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2699, i32 0, i32 5
store i32 0, i32* %.tmp2700
%.tmp2701 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
%.tmp2702 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2701, i32 0, i32 6
store i8* null, i8** %.tmp2702
br label %.if.end.2681
.if.end.2681:
%.tmp2703 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %ptr.2669
ret %m1861$.AssignableInfo.type* %.tmp2703
}
define void @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2704 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2705 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2704, i32 0, i32 0
%.tmp2706 = load i8*, i8** %id
store i8* %.tmp2706, i8** %.tmp2705
%.tmp2707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2708 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2707, i32 0, i32 1
%.tmp2709 = load i8, i8* %scope
store i8 %.tmp2709, i8* %.tmp2708
ret void
}
define i8* @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp2710 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2711 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2710, i32 0, i32 1
%.tmp2712 = load i8, i8* %.tmp2711
%.tmp2713 = load i8, i8* @SCOPE_CONST
%.tmp2714 = icmp eq i8 %.tmp2712, %.tmp2713
br i1 %.tmp2714, label %.if.true.2715, label %.if.false.2715
.if.true.2715:
%.tmp2716 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2717 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2716, i32 0, i32 0
%.tmp2718 = load i8*, i8** %.tmp2717
ret i8* %.tmp2718
br label %.if.end.2715
.if.false.2715:
br label %.if.end.2715
.if.end.2715:
%buf.2719 = alloca i8*
store i8* null, i8** %buf.2719
%.tmp2720 = getelementptr i8*, i8** %buf.2719, i32 0
%.tmp2722 = getelementptr [5 x i8], [5 x i8]*@.str2721, i32 0, i32 0
%.tmp2723 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2724 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2723, i32 0, i32 1
%.tmp2725 = load i8, i8* %.tmp2724
%.tmp2726 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2727 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp2726, i32 0, i32 0
%.tmp2728 = load i8*, i8** %.tmp2727
%.tmp2729 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2720, i8* %.tmp2722, i8 %.tmp2725, i8* %.tmp2728)
%.tmp2730 = load i8*, i8** %buf.2719
ret i8* %.tmp2730
}
%m1861$.ScopeItem.type = type {i8*,%m1861$.AssignableInfo.type*,%m1861$.ScopeItem.type*}
%m1861$.GlobalName.type = type {i8*,i8*,i1,i1,%m1861$.AssignableInfo.type*,%m1861$.GlobalName.type*}
%m1861$.Scope.type = type {i8*,%m1861$.ScopeItem.type*,i8*,i8*,i8*,%m1861$.Scope.type*}
%m1861$.ModuleLookup.type = type {i8*,i8*,%m1861$.ModuleLookup.type*,%m1861$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1861$.CompilerCtx.type = type {%m307$.Node.type*,%m0$.File.type*,%m1861$.ErrorList.type*,%m1861$.GlobalName.type*,%m307$.Rule.type**,i32,%m1861$.ModuleLookup.type*,i8*}
define void @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%tmp_buff.2731 = alloca i8*
store i8* null, i8** %tmp_buff.2731
%.tmp2732 = getelementptr i8*, i8** %tmp_buff.2731, i32 0
%.tmp2734 = getelementptr [7 x i8], [7 x i8]*@.str2733, i32 0, i32 0
%.tmp2735 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2736 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2735)
%.tmp2737 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2732, i8* %.tmp2734, i32 %.tmp2736)
%.tmp2738 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp2739 = load i8, i8* @SCOPE_LOCAL
%.tmp2740 = load i8*, i8** %tmp_buff.2731
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp2738, i8 %.tmp2739, i8* %.tmp2740)
ret void
}
define %m1861$.ModuleLookup.type* @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2742 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2743 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2742, i32 0, i32 6
%.tmp2744 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2743
%m.2745 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2744, %m1861$.ModuleLookup.type** %m.2745
br label %.for.start.2741
.for.start.2741:
%.tmp2746 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2745
%.tmp2747 = icmp ne %m1861$.ModuleLookup.type* %.tmp2746, null
br i1 %.tmp2747, label %.for.continue.2741, label %.for.end.2741
.for.continue.2741:
%.tmp2748 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2745
%.tmp2749 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2748, i32 0, i32 0
%.tmp2750 = load i8*, i8** %.tmp2749
%.tmp2751 = load i8*, i8** %filename
%.tmp2752 = call i32(i8*,i8*) @strcmp(i8* %.tmp2750, i8* %.tmp2751)
%.tmp2753 = icmp eq i32 %.tmp2752, 0
br i1 %.tmp2753, label %.if.true.2754, label %.if.false.2754
.if.true.2754:
%.tmp2755 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2745
ret %m1861$.ModuleLookup.type* %.tmp2755
br label %.if.end.2754
.if.false.2754:
br label %.if.end.2754
.if.end.2754:
%.tmp2756 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2745
%.tmp2757 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2756, i32 0, i32 2
%.tmp2758 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2757
store %m1861$.ModuleLookup.type* %.tmp2758, %m1861$.ModuleLookup.type** %m.2745
br label %.for.start.2741
.for.end.2741:
%.tmp2759 = bitcast ptr null to %m1861$.ModuleLookup.type*
ret %m1861$.ModuleLookup.type* %.tmp2759
}
define %m1861$.ModuleLookup.type* @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2760 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2761 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2762 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2761, i32 0, i32 7
%.tmp2763 = load i8*, i8** %.tmp2762
%.tmp2764 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp2760, i8* %.tmp2763)
ret %m1861$.ModuleLookup.type* %.tmp2764
}
define i32 @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2765 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2766 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2765, i32 0, i32 5
%.tmp2767 = load i32, i32* %.tmp2766
%uid.2768 = alloca i32
store i32 %.tmp2767, i32* %uid.2768
%.tmp2769 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2770 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2769, i32 0, i32 5
%.tmp2771 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2772 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2771, i32 0, i32 5
%.tmp2773 = load i32, i32* %.tmp2772
%.tmp2774 = add i32 %.tmp2773, 1
store i32 %.tmp2774, i32* %.tmp2770
%.tmp2775 = load i32, i32* %uid.2768
ret i32 %.tmp2775
}
define %m1861$.CompilerCtx.type* @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2776 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* null, i32 1
%.tmp2777 = ptrtoint %m1861$.CompilerCtx.type* %.tmp2776 to i32
%.tmp2778 = call i8*(i32) @malloc(i32 %.tmp2777)
%.tmp2779 = bitcast i8* %.tmp2778 to %m1861$.CompilerCtx.type*
%ctx.2780 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp2779, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2781 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2782 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2781, i32 0, i32 1
%.tmp2783 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2783, %m0$.File.type** %.tmp2782
%.tmp2784 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2785 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2784, i32 0, i32 0
%.tmp2786 = bitcast ptr null to %m307$.Node.type*
store %m307$.Node.type* %.tmp2786, %m307$.Node.type** %.tmp2785
%.tmp2787 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2788 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2787, i32 0, i32 2
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp2788
%.tmp2789 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2790 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2789, i32 0, i32 5
store i32 0, i32* %.tmp2790
%.tmp2791 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2792 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2791, i32 0, i32 3
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp2792
%.tmp2793 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2794 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2793, i32 0, i32 7
%.tmp2795 = load i8*, i8** %filename
store i8* %.tmp2795, i8** %.tmp2794
%.tmp2796 = call i8*() @m1862$grammar.cp()
%.tmp2797 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2796)
%grammar_file.2798 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2797, %m0$.File.type** %grammar_file.2798
%.tmp2799 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2798
%.tmp2800 = icmp eq %m0$.File.type* %.tmp2799, null
br i1 %.tmp2800, label %.if.true.2801, label %.if.false.2801
.if.true.2801:
%.tmp2802 = bitcast ptr null to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2802
br label %.if.end.2801
.if.false.2801:
br label %.if.end.2801
.if.end.2801:
%.tmp2803 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2798
%.tmp2804 = call %m307$.ParsingContext.type*(%m0$.File.type*) @m307$new_context.m307$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2803)
%grammar_ctx.2805 = alloca %m307$.ParsingContext.type*
store %m307$.ParsingContext.type* %.tmp2804, %m307$.ParsingContext.type** %grammar_ctx.2805
%.tmp2806 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2798
%.tmp2807 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2806)
%.tmp2808 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2809 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2808, i32 0, i32 4
%.tmp2810 = load %m307$.ParsingContext.type*, %m307$.ParsingContext.type** %grammar_ctx.2805
%.tmp2811 = call %m307$.Rule.type**(%m307$.ParsingContext.type*) @m307$parse_grammar.m307$.Rule.typepp.m307$.ParsingContext.typep(%m307$.ParsingContext.type* %.tmp2810)
store %m307$.Rule.type** %.tmp2811, %m307$.Rule.type*** %.tmp2809
%.tmp2812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2813 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2812, i32 0, i32 6
%.tmp2814 = load i32, i32* @ModuleLookup_size
%.tmp2815 = call i8*(i32) @malloc(i32 %.tmp2814)
%.tmp2816 = bitcast i8* %.tmp2815 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2816, %m1861$.ModuleLookup.type** %.tmp2813
%.tmp2817 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2818 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2817, i32 0, i32 6
%.tmp2819 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2818
%.tmp2820 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2819, i32 0, i32 0
%.tmp2821 = load i8*, i8** %filename
store i8* %.tmp2821, i8** %.tmp2820
%.tmp2822 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2823 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2822, i32 0, i32 6
%.tmp2824 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2823
%.tmp2825 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2824, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp2825
%.tmp2826 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2827 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2826, i32 0, i32 6
%.tmp2828 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2827
%.tmp2829 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2828, i32 0, i32 1
%.tmp2831 = getelementptr [1 x i8], [1 x i8]*@.str2830, i32 0, i32 0
store i8* %.tmp2831, i8** %.tmp2829
%.tmp2832 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2833 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2832, i32 0, i32 6
%.tmp2834 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp2833
%.tmp2835 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2834, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp2835
%.tmp2836 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx.2780
%.tmp2837 = bitcast %m1861$.CompilerCtx.type* %.tmp2836 to %m1861$.CompilerCtx.type*
ret %m1861$.CompilerCtx.type* %.tmp2837
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
%.tmp2838 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* null, i32 1
%.tmp2839 = ptrtoint %m1861$.Scope.type* %.tmp2838 to i32
%.tmp2840 = call i8*(i32) @malloc(i32 %.tmp2839)
%.tmp2841 = bitcast i8* %.tmp2840 to %m1861$.Scope.type*
%s.2842 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp2841, %m1861$.Scope.type** %s.2842
%.tmp2843 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2844 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2843)
%m.2845 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2844, %m1861$.ModuleLookup.type** %m.2845
%.tmp2846 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2842
%.tmp2847 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2846, i32 0, i32 5
%.tmp2848 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2845
%.tmp2849 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2848, i32 0, i32 3
%.tmp2850 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2849
store %m1861$.Scope.type* %.tmp2850, %m1861$.Scope.type** %.tmp2847
%.tmp2851 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2842
%.tmp2852 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2851, i32 0, i32 1
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp2852
%.tmp2853 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2842
%.tmp2854 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2853, i32 0, i32 2
%.tmp2855 = load i8*, i8** %type
store i8* %.tmp2855, i8** %.tmp2854
%.tmp2856 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2842
%.tmp2857 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2856, i32 0, i32 3
%.tmp2858 = load i8*, i8** %begin_id
store i8* %.tmp2858, i8** %.tmp2857
%.tmp2859 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2842
%.tmp2860 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2859, i32 0, i32 4
%.tmp2861 = load i8*, i8** %end_id
store i8* %.tmp2861, i8** %.tmp2860
%.tmp2862 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2845
%.tmp2863 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2862, i32 0, i32 3
%.tmp2864 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.2842
store %m1861$.Scope.type* %.tmp2864, %m1861$.Scope.type** %.tmp2863
ret void
}
define void @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%.tmp2865 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2866 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp2865)
%m.2867 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp2866, %m1861$.ModuleLookup.type** %m.2867
%.tmp2868 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2867
%.tmp2869 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2868, i32 0, i32 3
%.tmp2870 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2869
%.tmp2871 = icmp ne %m1861$.Scope.type* %.tmp2870, null
%.tmp2873 = getelementptr [61 x i8], [61 x i8]*@.str2872, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2871, i8* %.tmp2873)
%.tmp2874 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2867
%.tmp2875 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2874, i32 0, i32 3
%.tmp2876 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.2867
%.tmp2877 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp2876, i32 0, i32 3
%.tmp2878 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2877
%.tmp2879 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp2878, i32 0, i32 5
%.tmp2880 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp2879
store %m1861$.Scope.type* %.tmp2880, %m1861$.Scope.type** %.tmp2875
ret void
}
define i1 @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2881 = call i8*() @m1862$grammar.cp()
%.tmp2882 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2881)
%grammar_file.2883 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2882, %m0$.File.type** %grammar_file.2883
%.tmp2884 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2883
%.tmp2885 = icmp eq %m0$.File.type* %.tmp2884, null
br i1 %.tmp2885, label %.if.true.2886, label %.if.false.2886
.if.true.2886:
ret i1 0
br label %.if.end.2886
.if.false.2886:
br label %.if.end.2886
.if.end.2886:
%.tmp2887 = load i8*, i8** %filepath
%.tmp2888 = load i32, i32* @O_RDONLY
%.tmp2889 = call i32(i8*,i32) @open(i8* %.tmp2887, i32 %.tmp2888)
%input_fd.2890 = alloca i32
store i32 %.tmp2889, i32* %input_fd.2890
%.tmp2891 = load i32, i32* %input_fd.2890
%.tmp2892 = icmp sle i32 %.tmp2891, 0
br i1 %.tmp2892, label %.if.true.2893, label %.if.false.2893
.if.true.2893:
%err_msg.2894 = alloca i8*
store i8* null, i8** %err_msg.2894
%.tmp2895 = getelementptr i8*, i8** %err_msg.2894, i32 0
%.tmp2897 = getelementptr [26 x i8], [26 x i8]*@.str2896, i32 0, i32 0
%.tmp2898 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2899 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2895, i8* %.tmp2897, %m307$.Node.type* %.tmp2898)
%.tmp2900 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2901 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp2902 = load i8*, i8** %err_msg.2894
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2900, %m307$.Node.type* %.tmp2901, i8* %.tmp2902)
ret i1 0
br label %.if.end.2893
.if.false.2893:
br label %.if.end.2893
.if.end.2893:
%.tmp2903 = load i32, i32* %input_fd.2890
%.tmp2904 = call %m229$.PeekerInfo.type*(i32) @m229$new.m229$.PeekerInfo.typep.i(i32 %.tmp2903)
%p.2905 = alloca %m229$.PeekerInfo.type*
store %m229$.PeekerInfo.type* %.tmp2904, %m229$.PeekerInfo.type** %p.2905
%.tmp2906 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2905
%.tmp2907 = getelementptr %m229$.PeekerInfo.type, %m229$.PeekerInfo.type* %.tmp2906, i32 0, i32 6
%.tmp2908 = load i8*, i8** %filepath
store i8* %.tmp2908, i8** %.tmp2907
%.tmp2909 = load %m229$.PeekerInfo.type*, %m229$.PeekerInfo.type** %p.2905
%.tmp2910 = call %m308$.Token.type*(%m229$.PeekerInfo.type*,i1) @m308$tokenize.m308$.Token.typep.m229$.PeekerInfo.typep.b(%m229$.PeekerInfo.type* %.tmp2909, i1 0)
%tokens.2911 = alloca %m308$.Token.type*
store %m308$.Token.type* %.tmp2910, %m308$.Token.type** %tokens.2911
%.tmp2912 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2913 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2912, i32 0, i32 4
%.tmp2914 = load %m307$.Rule.type**, %m307$.Rule.type*** %.tmp2913
%.tmp2916 = getelementptr [6 x i8], [6 x i8]*@.str2915, i32 0, i32 0
%.tmp2917 = load %m308$.Token.type*, %m308$.Token.type** %tokens.2911
%.tmp2918 = call %m307$.ParseResult.type*(%m307$.Rule.type**,i8*,%m308$.Token.type*) @m307$ast.m307$.ParseResult.typep.m307$.Rule.typepp.cp.m308$.Token.typep(%m307$.Rule.type** %.tmp2914, i8* %.tmp2916, %m308$.Token.type* %.tmp2917)
%ast.2919 = alloca %m307$.ParseResult.type*
store %m307$.ParseResult.type* %.tmp2918, %m307$.ParseResult.type** %ast.2919
%.tmp2920 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2919
%.tmp2921 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2920, i32 0, i32 0
%.tmp2922 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2921
%.tmp2923 = icmp ne %m751$.Error.type* %.tmp2922, null
br i1 %.tmp2923, label %.if.true.2924, label %.if.false.2924
.if.true.2924:
%.tmp2925 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2926 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2919
%.tmp2927 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2926, i32 0, i32 0
%.tmp2928 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2927
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp2925, %m751$.Error.type* %.tmp2928)
br label %.if.end.2924
.if.false.2924:
br label %.if.end.2924
.if.end.2924:
%.tmp2929 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2930 = load %m307$.ParseResult.type*, %m307$.ParseResult.type** %ast.2919
%.tmp2931 = getelementptr %m307$.ParseResult.type, %m307$.ParseResult.type* %.tmp2930, i32 0, i32 1
%.tmp2932 = load %m307$.Node.type*, %m307$.Node.type** %.tmp2931
%.tmp2933 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2929, %m307$.Node.type* %.tmp2932)
ret i1 %.tmp2933
}
define i1 @m1861$compile.b.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2935 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2934, i32 0, i32 2
%.tmp2936 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2935
%.tmp2937 = icmp eq %m1861$.ErrorList.type* %.tmp2936, null
br i1 %.tmp2937, label %.if.true.2938, label %.if.false.2938
.if.true.2938:
%.tmp2939 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2940 = load %m307$.Node.type*, %m307$.Node.type** %ast
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp2939, %m307$.Node.type* %.tmp2940)
br label %.if.end.2938
.if.false.2938:
br label %.if.end.2938
.if.end.2938:
%.tmp2941 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2942 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2941, i32 0, i32 2
%.tmp2943 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2942
%.tmp2944 = icmp ne %m1861$.ErrorList.type* %.tmp2943, null
br i1 %.tmp2944, label %.if.true.2945, label %.if.false.2945
.if.true.2945:
%.tmp2947 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2948 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp2947, i32 0, i32 2
%.tmp2949 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2948
%err.2950 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp2949, %m1861$.ErrorList.type** %err.2950
br label %.for.start.2946
.for.start.2946:
%.tmp2951 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2950
%.tmp2952 = icmp ne %m1861$.ErrorList.type* %.tmp2951, null
br i1 %.tmp2952, label %.for.continue.2946, label %.for.end.2946
.for.continue.2946:
%.tmp2953 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2950
%.tmp2954 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2953, i32 0, i32 2
%.tmp2955 = load i1, i1* %.tmp2954
%.tmp2956 = icmp eq i1 %.tmp2955, 0
br i1 %.tmp2956, label %.if.true.2957, label %.if.false.2957
.if.true.2957:
%.tmp2958 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2950
%.tmp2959 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2958, i32 0, i32 0
%.tmp2960 = load %m751$.Error.type*, %m751$.Error.type** %.tmp2959
call void(%m751$.Error.type*) @m751$report.v.m751$.Error.typep(%m751$.Error.type* %.tmp2960)
%.tmp2961 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2950
%.tmp2962 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2961, i32 0, i32 2
store i1 1, i1* %.tmp2962
br label %.if.end.2957
.if.false.2957:
br label %.if.end.2957
.if.end.2957:
%.tmp2963 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %err.2950
%.tmp2964 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp2963, i32 0, i32 1
%.tmp2965 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp2964
store %m1861$.ErrorList.type* %.tmp2965, %m1861$.ErrorList.type** %err.2950
br label %.for.start.2946
.for.end.2946:
ret i1 1
br label %.if.end.2945
.if.false.2945:
br label %.if.end.2945
.if.end.2945:
ret i1 0
}
define void @m1861$mark_weak_global.v.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
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
%.tmp2973 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
%.tmp2974 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2973, i32 0, i32 3
%.tmp2975 = load i1, i1* %.tmp2974
%.tmp2976 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
%.tmp2977 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2976, i32 0, i32 0
%.tmp2978 = load i8*, i8** %.tmp2977
%.tmp2979 = load i8*, i8** %id
%.tmp2980 = call i32(i8*,i8*) @strcmp(i8* %.tmp2978, i8* %.tmp2979)
%.tmp2981 = icmp eq i32 %.tmp2980, 0
%.tmp2982 = and i1 %.tmp2975, %.tmp2981
br i1 %.tmp2982, label %.if.true.2983, label %.if.false.2983
.if.true.2983:
%.tmp2984 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
%.tmp2985 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2984, i32 0, i32 2
store i1 1, i1* %.tmp2985
br label %.for.end.2966
br label %.if.end.2983
.if.false.2983:
br label %.if.end.2983
.if.end.2983:
%.tmp2986 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.2970
%.tmp2987 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp2986, i32 0, i32 5
%.tmp2988 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp2987
store %m1861$.GlobalName.type* %.tmp2988, %m1861$.GlobalName.type** %g.2970
br label %.for.start.2966
.for.end.2966:
ret void
}
define void @m1861$compile_ast.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.ast.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%ast = alloca %m307$.Node.type*
store %m307$.Node.type* %.ast.arg, %m307$.Node.type** %ast
%.tmp2989 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp2990 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp2989, i32 0, i32 0
%.tmp2991 = load i8*, i8** %.tmp2990
%.tmp2993 = getelementptr [6 x i8], [6 x i8]*@.str2992, i32 0, i32 0
%.tmp2994 = call i32(i8*,i8*) @strcmp(i8* %.tmp2991, i8* %.tmp2993)
%.tmp2995 = icmp ne i32 %.tmp2994, 0
br i1 %.tmp2995, label %.if.true.2996, label %.if.false.2996
.if.true.2996:
%.tmp2997 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp2998 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3000 = getelementptr [29 x i8], [29 x i8]*@.str2999, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp2997, %m307$.Node.type* %.tmp2998, i8* %.tmp3000)
ret void
br label %.if.end.2996
.if.false.2996:
br label %.if.end.2996
.if.end.2996:
%.tmp3001 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3003 = getelementptr [7 x i8], [7 x i8]*@.str3002, i32 0, i32 0
%.tmp3004 = bitcast ptr null to i8*
%.tmp3005 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3001, i8* %.tmp3003, i8* %.tmp3004, i8* %.tmp3005)
%.tmp3006 = load %m307$.Node.type*, %m307$.Node.type** %ast
%.tmp3007 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3006, i32 0, i32 6
%.tmp3008 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3007
%start.3009 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3008, %m307$.Node.type** %start.3009
%.tmp3010 = load %m307$.Node.type*, %m307$.Node.type** %start.3009
%.tmp3011 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3010, i32 0, i32 0
%.tmp3012 = load i8*, i8** %.tmp3011
%.tmp3014 = getelementptr [13 x i8], [13 x i8]*@.str3013, i32 0, i32 0
%.tmp3015 = call i32(i8*,i8*) @strcmp(i8* %.tmp3012, i8* %.tmp3014)
%.tmp3016 = icmp eq i32 %.tmp3015, 0
br i1 %.tmp3016, label %.if.true.3017, label %.if.false.3017
.if.true.3017:
%.tmp3018 = load %m307$.Node.type*, %m307$.Node.type** %start.3009
%.tmp3019 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3018, i32 0, i32 7
%.tmp3020 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3019
store %m307$.Node.type* %.tmp3020, %m307$.Node.type** %start.3009
br label %.if.end.3017
.if.false.3017:
br label %.if.end.3017
.if.end.3017:
%.tmp3022 = load %m307$.Node.type*, %m307$.Node.type** %start.3009
%stmt.3023 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3022, %m307$.Node.type** %stmt.3023
br label %.for.start.3021
.for.start.3021:
%.tmp3024 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3023
%.tmp3025 = icmp ne %m307$.Node.type* %.tmp3024, null
br i1 %.tmp3025, label %.for.continue.3021, label %.for.end.3021
.for.continue.3021:
%.tmp3026 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3027 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3023
%.tmp3028 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3027, i32 0, i32 6
%.tmp3029 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3028
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3026, %m307$.Node.type* %.tmp3029, i1 1)
%.tmp3030 = load %m307$.Node.type*, %m307$.Node.type** %stmt.3023
%.tmp3031 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3030, i32 0, i32 7
%.tmp3032 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3031
store %m307$.Node.type* %.tmp3032, %m307$.Node.type** %stmt.3023
br label %.for.start.3021
.for.end.3021:
%.tmp3034 = load %m307$.Node.type*, %m307$.Node.type** %start.3009
%s.3035 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3034, %m307$.Node.type** %s.3035
br label %.for.start.3033
.for.start.3033:
%.tmp3036 = load %m307$.Node.type*, %m307$.Node.type** %s.3035
%.tmp3037 = icmp ne %m307$.Node.type* %.tmp3036, null
br i1 %.tmp3037, label %.for.continue.3033, label %.for.end.3033
.for.continue.3033:
%.tmp3038 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3039 = load %m307$.Node.type*, %m307$.Node.type** %s.3035
%.tmp3040 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3039, i32 0, i32 6
%.tmp3041 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3040
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i1) @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.tmp3038, %m307$.Node.type* %.tmp3041, i1 0)
%.tmp3042 = load %m307$.Node.type*, %m307$.Node.type** %s.3035
%.tmp3043 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3042, i32 0, i32 7
%.tmp3044 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3043
store %m307$.Node.type* %.tmp3044, %m307$.Node.type** %s.3035
br label %.for.start.3033
.for.end.3033:
%.tmp3045 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3046 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3045)
%mod.3047 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3046, %m1861$.ModuleLookup.type** %mod.3047
%.tmp3048 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3047
%.tmp3049 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3048, i32 0, i32 1
%.tmp3050 = load i8*, i8** %.tmp3049
%.tmp3052 = getelementptr [1 x i8], [1 x i8]*@.str3051, i32 0, i32 0
%.tmp3053 = call i32(i8*,i8*) @strcmp(i8* %.tmp3050, i8* %.tmp3052)
%.tmp3054 = icmp eq i32 %.tmp3053, 0
br i1 %.tmp3054, label %.if.true.3055, label %.if.false.3055
.if.true.3055:
%.tmp3057 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3058 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3057, i32 0, i32 3
%.tmp3059 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3058
%g.3060 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp3059, %m1861$.GlobalName.type** %g.3060
br label %.for.start.3056
.for.start.3056:
%.tmp3061 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3060
%.tmp3062 = icmp ne %m1861$.GlobalName.type* %.tmp3061, null
br i1 %.tmp3062, label %.for.continue.3056, label %.for.end.3056
.for.continue.3056:
%.tmp3063 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3064 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3060
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp3063, %m1861$.GlobalName.type* %.tmp3064)
%.tmp3065 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g.3060
%.tmp3066 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3065, i32 0, i32 5
%.tmp3067 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp3066
store %m1861$.GlobalName.type* %.tmp3067, %m1861$.GlobalName.type** %g.3060
br label %.for.start.3056
.for.end.3056:
br label %.if.end.3055
.if.false.3055:
br label %.if.end.3055
.if.end.3055:
ret void
}
define void @m1861$compile_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp3068 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3069 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3068, i32 0, i32 2
%.tmp3070 = load i1, i1* %.tmp3069
br i1 %.tmp3070, label %.if.true.3071, label %.if.false.3071
.if.true.3071:
ret void
br label %.if.end.3071
.if.false.3071:
br label %.if.end.3071
.if.end.3071:
%.tmp3072 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3073 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3072, i32 0, i32 1
%.tmp3074 = load i8*, i8** %.tmp3073
%.tmp3076 = getelementptr [7 x i8], [7 x i8]*@.str3075, i32 0, i32 0
%.tmp3077 = call i32(i8*,i8*) @strcmp(i8* %.tmp3074, i8* %.tmp3076)
%.tmp3078 = icmp eq i32 %.tmp3077, 0
br i1 %.tmp3078, label %.if.true.3079, label %.if.false.3079
.if.true.3079:
%.tmp3080 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3081 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3080, i32 0, i32 1
%.tmp3082 = load %m0$.File.type*, %m0$.File.type** %.tmp3081
%.tmp3084 = getelementptr [21 x i8], [21 x i8]*@.str3083, i32 0, i32 0
%.tmp3085 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3086 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3085, i32 0, i32 4
%.tmp3087 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3086
%.tmp3088 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3087)
%.tmp3089 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3090 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3091 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3090, i32 0, i32 4
%.tmp3092 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3091
%.tmp3093 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3092, i32 0, i32 3
%.tmp3094 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3093
%.tmp3095 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3089, %m1861$.Type.type* %.tmp3094)
%.tmp3096 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3097 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3096, i32 0, i32 0
%.tmp3098 = load i8*, i8** %.tmp3097
%.tmp3099 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3082, i8* %.tmp3084, i8* %.tmp3088, i8* %.tmp3095, i8* %.tmp3098)
br label %.if.end.3079
.if.false.3079:
%.tmp3100 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3101 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3100, i32 0, i32 1
%.tmp3102 = load i8*, i8** %.tmp3101
%.tmp3104 = getelementptr [7 x i8], [7 x i8]*@.str3103, i32 0, i32 0
%.tmp3105 = call i32(i8*,i8*) @strcmp(i8* %.tmp3102, i8* %.tmp3104)
%.tmp3106 = icmp eq i32 %.tmp3105, 0
br i1 %.tmp3106, label %.if.true.3107, label %.if.false.3107
.if.true.3107:
%.tmp3108 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3109 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3110 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3109, i32 0, i32 4
%.tmp3111 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3110
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3108, %m1861$.AssignableInfo.type* %.tmp3111)
br label %.if.end.3107
.if.false.3107:
br label %.if.end.3107
.if.end.3107:
br label %.if.end.3079
.if.end.3079:
%.tmp3112 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp3113 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp3112, i32 0, i32 2
store i1 1, i1* %.tmp3113
ret void
}
define void @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp3114 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3115 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3114, i32 0, i32 1
%.tmp3116 = load %m0$.File.type*, %m0$.File.type** %.tmp3115
%.tmp3118 = getelementptr [15 x i8], [15 x i8]*@.str3117, i32 0, i32 0
%.tmp3119 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3120 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3121 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3120, i32 0, i32 3
%.tmp3122 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3121
%.tmp3123 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3122, i32 0, i32 3
%.tmp3124 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3123
%.tmp3125 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3119, %m1861$.Type.type* %.tmp3124)
%.tmp3126 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3127 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3126)
%.tmp3128 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3116, i8* %.tmp3118, i8* %.tmp3125, i8* %.tmp3127)
%.tmp3130 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3131 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3130, i32 0, i32 3
%.tmp3132 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3131
%.tmp3133 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3132, i32 0, i32 3
%.tmp3134 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3133
%.tmp3135 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3134, i32 0, i32 4
%.tmp3136 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3135
%pt.3137 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3136, %m1861$.Type.type** %pt.3137
br label %.for.start.3129
.for.start.3129:
%.tmp3138 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3137
%.tmp3139 = icmp ne %m1861$.Type.type* %.tmp3138, null
br i1 %.tmp3139, label %.for.continue.3129, label %.for.end.3129
.for.continue.3129:
%.tmp3140 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3137
%.tmp3141 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp3142 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3141, i32 0, i32 3
%.tmp3143 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3142
%.tmp3144 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3143, i32 0, i32 3
%.tmp3145 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3144
%.tmp3146 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3145, i32 0, i32 4
%.tmp3147 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3146
%.tmp3148 = icmp ne %m1861$.Type.type* %.tmp3140, %.tmp3147
br i1 %.tmp3148, label %.if.true.3149, label %.if.false.3149
.if.true.3149:
%.tmp3150 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3151 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3150, i32 0, i32 1
%.tmp3152 = load %m0$.File.type*, %m0$.File.type** %.tmp3151
%.tmp3154 = getelementptr [3 x i8], [3 x i8]*@.str3153, i32 0, i32 0
%.tmp3155 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3152, i8* %.tmp3154)
br label %.if.end.3149
.if.false.3149:
br label %.if.end.3149
.if.end.3149:
%.tmp3156 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3157 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3156, i32 0, i32 1
%.tmp3158 = load %m0$.File.type*, %m0$.File.type** %.tmp3157
%.tmp3160 = getelementptr [3 x i8], [3 x i8]*@.str3159, i32 0, i32 0
%.tmp3161 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3162 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3137
%.tmp3163 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3161, %m1861$.Type.type* %.tmp3162)
%.tmp3164 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3158, i8* %.tmp3160, i8* %.tmp3163)
%.tmp3165 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.3137
%.tmp3166 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3165, i32 0, i32 4
%.tmp3167 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3166
store %m1861$.Type.type* %.tmp3167, %m1861$.Type.type** %pt.3137
br label %.for.start.3129
.for.end.3129:
%.tmp3168 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3169 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3168, i32 0, i32 1
%.tmp3170 = load %m0$.File.type*, %m0$.File.type** %.tmp3169
%.tmp3172 = getelementptr [3 x i8], [3 x i8]*@.str3171, i32 0, i32 0
%.tmp3173 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3170, i8* %.tmp3172)
ret void
}
define i8* @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3174 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3175 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3174)
%m.3176 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3175, %m1861$.ModuleLookup.type** %m.3176
%.tmp3177 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3176
%.tmp3178 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3177, i32 0, i32 1
%.tmp3179 = load i8*, i8** %.tmp3178
ret i8* %.tmp3179
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
%mangled_name.3180 = alloca i8*
store i8* null, i8** %mangled_name.3180
%.tmp3181 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3182 = load %m307$.Node.type*, %m307$.Node.type** %fn
%.tmp3183 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3182, i32 0, i32 2
%.tmp3184 = load i8*, i8** %.tmp3183
%.tmp3185 = call i8*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_mod_prefix.cp.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3181, i8* %.tmp3184)
%prefix.3186 = alloca i8*
store i8* %.tmp3185, i8** %prefix.3186
%.tmp3187 = getelementptr i8*, i8** %mangled_name.3180, i32 0
%.tmp3189 = getelementptr [5 x i8], [5 x i8]*@.str3188, i32 0, i32 0
%.tmp3190 = load i8*, i8** %prefix.3186
%.tmp3191 = load i8*, i8** %original_name
%.tmp3192 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3187, i8* %.tmp3189, i8* %.tmp3190, i8* %.tmp3191)
%.tmp3193 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3194 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3193, i32 0, i32 0
%.tmp3195 = load i8*, i8** %.tmp3194
%.tmp3197 = getelementptr [9 x i8], [9 x i8]*@.str3196, i32 0, i32 0
%.tmp3198 = call i32(i8*,i8*) @strcmp(i8* %.tmp3195, i8* %.tmp3197)
%.tmp3199 = icmp eq i32 %.tmp3198, 0
br i1 %.tmp3199, label %.if.true.3200, label %.if.false.3200
.if.true.3200:
%.tmp3201 = load i8*, i8** %mangled_name.3180
%.tmp3203 = getelementptr [5 x i8], [5 x i8]*@.str3202, i32 0, i32 0
%.tmp3204 = call i32(i8*,i8*) @strcmp(i8* %.tmp3201, i8* %.tmp3203)
%.tmp3205 = icmp ne i32 %.tmp3204, 0
br i1 %.tmp3205, label %.if.true.3206, label %.if.false.3206
.if.true.3206:
%tmp_buff.3207 = alloca i8*
store i8* null, i8** %tmp_buff.3207
%swap_var.3208 = alloca i8*
store i8* null, i8** %swap_var.3208
%.tmp3210 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp3211 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3210, i32 0, i32 3
%.tmp3212 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3211
%tp.3213 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3212, %m1861$.Type.type** %tp.3213
br label %.for.start.3209
.for.start.3209:
%.tmp3214 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3213
%.tmp3215 = icmp ne %m1861$.Type.type* %.tmp3214, null
br i1 %.tmp3215, label %.for.continue.3209, label %.for.end.3209
.for.continue.3209:
%.tmp3216 = getelementptr i8*, i8** %tmp_buff.3207, i32 0
%.tmp3218 = getelementptr [6 x i8], [6 x i8]*@.str3217, i32 0, i32 0
%.tmp3219 = load i8*, i8** %mangled_name.3180
%.tmp3220 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3213
%.tmp3221 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp3220)
%.tmp3222 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3216, i8* %.tmp3218, i8* %.tmp3219, i8* %.tmp3221)
%.tmp3223 = load i8*, i8** %tmp_buff.3207
store i8* %.tmp3223, i8** %swap_var.3208
%.tmp3224 = load i8*, i8** %mangled_name.3180
store i8* %.tmp3224, i8** %tmp_buff.3207
%.tmp3225 = load i8*, i8** %swap_var.3208
store i8* %.tmp3225, i8** %mangled_name.3180
%.tmp3226 = load i8*, i8** %tmp_buff.3207
call void(i8*) @free(i8* %.tmp3226)
%.tmp3227 = load %m1861$.Type.type*, %m1861$.Type.type** %tp.3213
%.tmp3228 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3227, i32 0, i32 4
%.tmp3229 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3228
store %m1861$.Type.type* %.tmp3229, %m1861$.Type.type** %tp.3213
br label %.for.start.3209
.for.end.3209:
br label %.if.end.3206
.if.false.3206:
br label %.if.end.3206
.if.end.3206:
br label %.if.end.3200
.if.false.3200:
br label %.if.end.3200
.if.end.3200:
%.tmp3230 = load i8*, i8** %mangled_name.3180
ret i8* %.tmp3230
}
define void @m1861$compile_statement.v.m1861$.CompilerCtx.typep.m307$.Node.typep.b(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3231 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %info.3231
%return_type.3232 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %return_type.3232
%err_buf.3233 = alloca i8*
store i8* null, i8** %err_buf.3233
%tmp_buff.3234 = alloca i8*
store i8* null, i8** %tmp_buff.3234
%.tmp3235 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3236 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3235, i32 0, i32 0
%.tmp3237 = load i8*, i8** %.tmp3236
%.tmp3239 = getelementptr [3 x i8], [3 x i8]*@.str3238, i32 0, i32 0
%.tmp3240 = call i32(i8*,i8*) @strcmp(i8* %.tmp3237, i8* %.tmp3239)
%.tmp3241 = icmp eq i32 %.tmp3240, 0
br i1 %.tmp3241, label %.if.true.3242, label %.if.false.3242
.if.true.3242:
ret void
br label %.if.end.3242
.if.false.3242:
%.tmp3243 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3244 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3243, i32 0, i32 0
%.tmp3245 = load i8*, i8** %.tmp3244
%.tmp3247 = getelementptr [7 x i8], [7 x i8]*@.str3246, i32 0, i32 0
%.tmp3248 = call i32(i8*,i8*) @strcmp(i8* %.tmp3245, i8* %.tmp3247)
%.tmp3249 = icmp eq i32 %.tmp3248, 0
br i1 %.tmp3249, label %.if.true.3250, label %.if.false.3250
.if.true.3250:
%.tmp3251 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3252 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3251, i32 0, i32 6
%.tmp3253 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3252
%.tmp3255 = getelementptr [11 x i8], [11 x i8]*@.str3254, i32 0, i32 0
%.tmp3256 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3253, i8* %.tmp3255)
%assignable.3257 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3256, %m307$.Node.type** %assignable.3257
%.tmp3258 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3259 = load %m307$.Node.type*, %m307$.Node.type** %assignable.3257
%.tmp3260 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3258, %m307$.Node.type* %.tmp3259)
%a_info.3261 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3260, %m1861$.AssignableInfo.type** %a_info.3261
%.tmp3262 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3261
%.tmp3263 = icmp eq %m1861$.AssignableInfo.type* %.tmp3262, null
br i1 %.tmp3263, label %.if.true.3264, label %.if.false.3264
.if.true.3264:
ret void
br label %.if.end.3264
.if.false.3264:
br label %.if.end.3264
.if.end.3264:
%.tmp3265 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3266 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3265)
store %m1861$.AssignableInfo.type* %.tmp3266, %m1861$.AssignableInfo.type** %info.3231
%.tmp3267 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3268 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3267, i32 0, i32 6
%.tmp3269 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3268
%.tmp3270 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3269, i32 0, i32 7
%.tmp3271 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3270
%.tmp3272 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3271, i32 0, i32 1
%.tmp3273 = load i8*, i8** %.tmp3272
%global_name.3274 = alloca i8*
store i8* %.tmp3273, i8** %global_name.3274
%.tmp3275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3276 = load i8, i8* @SCOPE_GLOBAL
%.tmp3277 = load i8*, i8** %global_name.3274
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3275, i8 %.tmp3276, i8* %.tmp3277)
%.tmp3278 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3279 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3278, i32 0, i32 3
%.tmp3280 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3261
%.tmp3281 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3280, i32 0, i32 3
%.tmp3282 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3281
store %m1861$.Type.type* %.tmp3282, %m1861$.Type.type** %.tmp3279
%.tmp3283 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3284 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3283, i32 0, i32 2
%.tmp3286 = getelementptr [9 x i8], [9 x i8]*@.str3285, i32 0, i32 0
store i8* %.tmp3286, i8** %.tmp3284
%.tmp3287 = load i1, i1* %shallow
%.tmp3288 = icmp eq i1 %.tmp3287, 1
br i1 %.tmp3288, label %.if.true.3289, label %.if.false.3289
.if.true.3289:
%.tmp3290 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3291 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3292 = load i8*, i8** %global_name.3274
%.tmp3293 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3290, %m307$.Node.type* %.tmp3291, i8* %.tmp3292, %m1861$.AssignableInfo.type* %.tmp3293)
br label %.if.end.3289
.if.false.3289:
%.tmp3294 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3295 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3294, i32 0, i32 1
%.tmp3296 = load %m0$.File.type*, %m0$.File.type** %.tmp3295
%.tmp3298 = getelementptr [21 x i8], [21 x i8]*@.str3297, i32 0, i32 0
%.tmp3299 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3300 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3299)
%.tmp3301 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3302 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3303 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3302, i32 0, i32 3
%.tmp3304 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3303
%.tmp3305 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3301, %m1861$.Type.type* %.tmp3304)
%.tmp3306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.3261
%.tmp3307 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3306)
%.tmp3308 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3296, i8* %.tmp3298, i8* %.tmp3300, i8* %.tmp3305, i8* %.tmp3307)
br label %.if.end.3289
.if.end.3289:
br label %.if.end.3250
.if.false.3250:
%.tmp3309 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3310 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3309, i32 0, i32 0
%.tmp3311 = load i8*, i8** %.tmp3310
%.tmp3313 = getelementptr [10 x i8], [10 x i8]*@.str3312, i32 0, i32 0
%.tmp3314 = call i32(i8*,i8*) @strcmp(i8* %.tmp3311, i8* %.tmp3313)
%.tmp3315 = icmp eq i32 %.tmp3314, 0
br i1 %.tmp3315, label %.if.true.3316, label %.if.false.3316
.if.true.3316:
%.tmp3317 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3318 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3317, i32 0, i32 6
%.tmp3319 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3318
%.tmp3320 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3319, i32 0, i32 7
%.tmp3321 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3320
%.tmp3322 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3321, i32 0, i32 1
%.tmp3323 = load i8*, i8** %.tmp3322
%type_name.3324 = alloca i8*
store i8* %.tmp3323, i8** %type_name.3324
%.tmp3325 = load i1, i1* %shallow
%.tmp3326 = icmp eq i1 %.tmp3325, 1
br i1 %.tmp3326, label %.if.true.3327, label %.if.false.3327
.if.true.3327:
%.tmp3328 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3329 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3328)
store %m1861$.AssignableInfo.type* %.tmp3329, %m1861$.AssignableInfo.type** %info.3231
%.tmp3330 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3331 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3330)
%mod_from.3332 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3331, %m1861$.ModuleLookup.type** %mod_from.3332
%.tmp3333 = getelementptr i8*, i8** %tmp_buff.3234, i32 0
%.tmp3335 = getelementptr [11 x i8], [11 x i8]*@.str3334, i32 0, i32 0
%.tmp3336 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod_from.3332
%.tmp3337 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3336, i32 0, i32 1
%.tmp3338 = load i8*, i8** %.tmp3337
%.tmp3339 = load i8*, i8** %type_name.3324
%.tmp3340 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3333, i8* %.tmp3335, i8* %.tmp3338, i8* %.tmp3339)
%.tmp3341 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3342 = load i8, i8* @SCOPE_LOCAL
%.tmp3343 = load i8*, i8** %tmp_buff.3234
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3341, i8 %.tmp3342, i8* %.tmp3343)
%.tmp3344 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3345 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3344, i32 0, i32 2
%.tmp3347 = getelementptr [10 x i8], [10 x i8]*@.str3346, i32 0, i32 0
store i8* %.tmp3347, i8** %.tmp3345
%.tmp3348 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3349 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3348, i32 0, i32 4
%.tmp3350 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3351 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3350, i32 0, i32 3
%.tmp3352 = load i32, i32* %.tmp3351
store i32 %.tmp3352, i32* %.tmp3349
%.tmp3353 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3354 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3353, i32 0, i32 5
%.tmp3355 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3356 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3355, i32 0, i32 4
%.tmp3357 = load i32, i32* %.tmp3356
store i32 %.tmp3357, i32* %.tmp3354
%.tmp3358 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3359 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3358, i32 0, i32 3
%.tmp3360 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3360, %m1861$.Type.type** %.tmp3359
%.tmp3361 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3362 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3363 = load i8*, i8** %type_name.3324
%.tmp3364 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3361, %m307$.Node.type* %.tmp3362, i8* %.tmp3363, %m1861$.AssignableInfo.type* %.tmp3364)
%.tmp3365 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3366 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3365, i32 0, i32 6
%.tmp3367 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3366
%.tmp3369 = getelementptr [5 x i8], [5 x i8]*@.str3368, i32 0, i32 0
%.tmp3370 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3367, i8* %.tmp3369)
%type_decl.3371 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3370, %m307$.Node.type** %type_decl.3371
%.tmp3372 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3373 = load %m307$.Node.type*, %m307$.Node.type** %type_decl.3371
%.tmp3374 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3373, i32 0, i32 6
%.tmp3375 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3374
%.tmp3376 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3372, %m307$.Node.type* %.tmp3375)
%type_struct.3377 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3376, %m1861$.Type.type** %type_struct.3377
%.tmp3378 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3379 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3378, i32 0, i32 3
%.tmp3380 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3379
%.tmp3381 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3377
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3380, %m1861$.Type.type* %.tmp3381)
%.tmp3382 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3383 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3382, i32 0, i32 3
%.tmp3384 = load %m1861$.Type.type*, %m1861$.Type.type** %type_struct.3377
store %m1861$.Type.type* %.tmp3384, %m1861$.Type.type** %.tmp3383
br label %.if.end.3327
.if.false.3327:
%.tmp3385 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3386 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3387 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3386, i32 0, i32 7
%.tmp3388 = load i8*, i8** %.tmp3387
%.tmp3389 = load i8*, i8** %type_name.3324
%.tmp3390 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3385, i8* %.tmp3388, i8* %.tmp3389)
%scope.3391 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp3390, %m1861$.ScopeItem.type** %scope.3391
%.tmp3392 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope.3391
%.tmp3393 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp3392, i32 0, i32 1
%.tmp3394 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp3393
store %m1861$.AssignableInfo.type* %.tmp3394, %m1861$.AssignableInfo.type** %info.3231
%.tmp3395 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3396 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3395, i32 0, i32 1
%.tmp3397 = load %m0$.File.type*, %m0$.File.type** %.tmp3396
%.tmp3399 = getelementptr [14 x i8], [14 x i8]*@.str3398, i32 0, i32 0
%.tmp3400 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3401 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3400)
%.tmp3402 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3403 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3404 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3403, i32 0, i32 3
%.tmp3405 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3404
%.tmp3406 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3402, %m1861$.Type.type* %.tmp3405)
%.tmp3407 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3397, i8* %.tmp3399, i8* %.tmp3401, i8* %.tmp3406)
br label %.if.end.3327
.if.end.3327:
br label %.if.end.3316
.if.false.3316:
%.tmp3408 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3409 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3408, i32 0, i32 0
%.tmp3410 = load i8*, i8** %.tmp3409
%.tmp3412 = getelementptr [7 x i8], [7 x i8]*@.str3411, i32 0, i32 0
%.tmp3413 = call i32(i8*,i8*) @strcmp(i8* %.tmp3410, i8* %.tmp3412)
%.tmp3414 = icmp eq i32 %.tmp3413, 0
br i1 %.tmp3414, label %.if.true.3415, label %.if.false.3415
.if.true.3415:
%.tmp3416 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3417 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3416)
store %m1861$.AssignableInfo.type* %.tmp3417, %m1861$.AssignableInfo.type** %info.3231
%.tmp3418 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3419 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3418, i32 0, i32 3
%.tmp3420 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3421 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3422 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3421, i32 0, i32 6
%.tmp3423 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3422
%.tmp3424 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3423, i32 0, i32 7
%.tmp3425 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3424
%.tmp3426 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3420, %m307$.Node.type* %.tmp3425)
store %m1861$.Type.type* %.tmp3426, %m1861$.Type.type** %.tmp3419
%.tmp3427 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3428 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3427, i32 0, i32 2
%.tmp3430 = getelementptr [7 x i8], [7 x i8]*@.str3429, i32 0, i32 0
store i8* %.tmp3430, i8** %.tmp3428
%.tmp3431 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3432 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3431, i32 0, i32 6
%.tmp3433 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3432
%.tmp3434 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3433, i32 0, i32 7
%.tmp3435 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3434
%.tmp3436 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3435, i32 0, i32 7
%.tmp3437 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3436
%.tmp3438 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3437, i32 0, i32 1
%.tmp3439 = load i8*, i8** %.tmp3438
%fn_name.3440 = alloca i8*
store i8* %.tmp3439, i8** %fn_name.3440
%.tmp3441 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3442 = load i8, i8* @SCOPE_GLOBAL
%.tmp3443 = load i8*, i8** %fn_name.3440
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3441, i8 %.tmp3442, i8* %.tmp3443)
%.tmp3444 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3444, %m1861$.Type.type** %return_type.3232
%.tmp3445 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3232
%.tmp3446 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3445, i32 0, i32 0
%.tmp3447 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3448 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3447, i32 0, i32 3
%.tmp3449 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3448
%.tmp3450 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3449, i32 0, i32 3
%.tmp3451 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3450
%.tmp3452 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3451, i32 0, i32 0
%.tmp3453 = load i8*, i8** %.tmp3452
store i8* %.tmp3453, i8** %.tmp3446
%.tmp3454 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3232
%.tmp3455 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3454, i32 0, i32 3
%.tmp3456 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3457 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3456, i32 0, i32 3
%.tmp3458 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3457
%.tmp3459 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3458, i32 0, i32 3
%.tmp3460 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3459
%.tmp3461 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3460, i32 0, i32 3
%.tmp3462 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3461
store %m1861$.Type.type* %.tmp3462, %m1861$.Type.type** %.tmp3455
%.tmp3463 = load i1, i1* %shallow
%.tmp3464 = icmp eq i1 %.tmp3463, 0
br i1 %.tmp3464, label %.if.true.3465, label %.if.false.3465
.if.true.3465:
%.tmp3466 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3467 = load i8*, i8** %fn_name.3440
call void(%m1861$.CompilerCtx.type*,i8*) @m1861$mark_weak_global.v.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp3466, i8* %.tmp3467)
%.tmp3468 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3469 = load i8*, i8** %fn_name.3440
%.tmp3471 = getelementptr [7 x i8], [7 x i8]*@.str3470, i32 0, i32 0
%.tmp3472 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp3468, i8* %.tmp3469, i8* %.tmp3471, %m1861$.AssignableInfo.type* %.tmp3472, i1 1, i1 1)
%.tmp3473 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3474 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$compile_extern.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3473, %m1861$.AssignableInfo.type* %.tmp3474)
br label %.if.end.3465
.if.false.3465:
%.tmp3475 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3476 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3477 = load i8*, i8** %fn_name.3440
%.tmp3478 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3475, %m307$.Node.type* %.tmp3476, i8* %.tmp3477, %m1861$.AssignableInfo.type* %.tmp3478)
br label %.if.end.3465
.if.end.3465:
br label %.if.end.3415
.if.false.3415:
%.tmp3479 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3480 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3479, i32 0, i32 0
%.tmp3481 = load i8*, i8** %.tmp3480
%.tmp3483 = getelementptr [9 x i8], [9 x i8]*@.str3482, i32 0, i32 0
%.tmp3484 = call i32(i8*,i8*) @strcmp(i8* %.tmp3481, i8* %.tmp3483)
%.tmp3485 = icmp eq i32 %.tmp3484, 0
br i1 %.tmp3485, label %.if.true.3486, label %.if.false.3486
.if.true.3486:
%.tmp3487 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3488 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3487)
store %m1861$.AssignableInfo.type* %.tmp3488, %m1861$.AssignableInfo.type** %info.3231
%.tmp3489 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3490 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3489, i32 0, i32 2
%.tmp3492 = getelementptr [9 x i8], [9 x i8]*@.str3491, i32 0, i32 0
store i8* %.tmp3492, i8** %.tmp3490
%.tmp3493 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3494 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3493, i32 0, i32 3
%.tmp3495 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3496 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3497 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3496, i32 0, i32 6
%.tmp3498 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3497
%.tmp3499 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3495, %m307$.Node.type* %.tmp3498)
store %m1861$.Type.type* %.tmp3499, %m1861$.Type.type** %.tmp3494
%.tmp3500 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3501 = call i8*(%m307$.Node.type*) @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.tmp3500)
%name.3502 = alloca i8*
store i8* %.tmp3501, i8** %name.3502
%.tmp3503 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3504 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3505 = load i8*, i8** %name.3502
%.tmp3506 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3507 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3506, i32 0, i32 3
%.tmp3508 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3507
%.tmp3509 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.Type.type*) @m1861$name_mangle.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3503, %m307$.Node.type* %.tmp3504, i8* %.tmp3505, %m1861$.Type.type* %.tmp3508)
store i8* %.tmp3509, i8** %tmp_buff.3234
%.tmp3510 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3511 = load i8, i8* @SCOPE_GLOBAL
%.tmp3512 = load i8*, i8** %tmp_buff.3234
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3510, i8 %.tmp3511, i8* %.tmp3512)
%.tmp3513 = load i1, i1* %shallow
%.tmp3514 = icmp eq i1 %.tmp3513, 1
br i1 %.tmp3514, label %.if.true.3515, label %.if.false.3515
.if.true.3515:
%.tmp3516 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3517 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3518 = load i8*, i8** %name.3502
%.tmp3519 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3516, %m307$.Node.type* %.tmp3517, i8* %.tmp3518, %m1861$.AssignableInfo.type* %.tmp3519)
br label %.if.end.3515
.if.false.3515:
%.tmp3520 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp3520, %m1861$.Type.type** %return_type.3232
%.tmp3521 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3232
%.tmp3522 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3523 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3522, i32 0, i32 3
%.tmp3524 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3523
%.tmp3525 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3524, i32 0, i32 3
%.tmp3526 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3525
call void(%m1861$.Type.type*,%m1861$.Type.type*) @m1861$copy_type.v.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp3521, %m1861$.Type.type* %.tmp3526)
%.tmp3527 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3528 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3527, i32 0, i32 1
%.tmp3529 = load %m0$.File.type*, %m0$.File.type** %.tmp3528
%.tmp3531 = getelementptr [14 x i8], [14 x i8]*@.str3530, i32 0, i32 0
%.tmp3532 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3533 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3232
%.tmp3534 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3532, %m1861$.Type.type* %.tmp3533)
%.tmp3535 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3231
%.tmp3536 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3535)
%.tmp3537 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3529, i8* %.tmp3531, i8* %.tmp3534, i8* %.tmp3536)
%.tmp3538 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3539 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3538, i32 0, i32 6
%.tmp3540 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3539
%.tmp3541 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3540)
%params.3542 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3541, %m307$.Node.type** %params.3542
%param_type.3543 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3543
%.tmp3545 = load %m307$.Node.type*, %m307$.Node.type** %params.3542
%param_ptr.3546 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3545, %m307$.Node.type** %param_ptr.3546
br label %.for.start.3544
.for.start.3544:
%.tmp3547 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3548 = icmp ne %m307$.Node.type* %.tmp3547, null
br i1 %.tmp3548, label %.for.continue.3544, label %.for.end.3544
.for.continue.3544:
%.tmp3549 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3550 = load %m307$.Node.type*, %m307$.Node.type** %params.3542
%.tmp3551 = icmp ne %m307$.Node.type* %.tmp3549, %.tmp3550
br i1 %.tmp3551, label %.if.true.3552, label %.if.false.3552
.if.true.3552:
%.tmp3553 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3554 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3553, i32 0, i32 7
%.tmp3555 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3554
store %m307$.Node.type* %.tmp3555, %m307$.Node.type** %param_ptr.3546
%.tmp3556 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3557 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3556, i32 0, i32 1
%.tmp3558 = load %m0$.File.type*, %m0$.File.type** %.tmp3557
%.tmp3560 = getelementptr [3 x i8], [3 x i8]*@.str3559, i32 0, i32 0
%.tmp3561 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3558, i8* %.tmp3560)
br label %.if.end.3552
.if.false.3552:
br label %.if.end.3552
.if.end.3552:
%.tmp3562 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3563 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3562, i32 0, i32 0
%.tmp3564 = load i8*, i8** %.tmp3563
%.tmp3566 = getelementptr [5 x i8], [5 x i8]*@.str3565, i32 0, i32 0
%.tmp3567 = call i32(i8*,i8*) @strcmp(i8* %.tmp3564, i8* %.tmp3566)
%.tmp3568 = icmp eq i32 %.tmp3567, 0
br i1 %.tmp3568, label %.if.true.3569, label %.if.false.3569
.if.true.3569:
%.tmp3570 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3571 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3572 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3571, i32 0, i32 6
%.tmp3573 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3572
%.tmp3574 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3570, %m307$.Node.type* %.tmp3573)
store %m1861$.Type.type* %.tmp3574, %m1861$.Type.type** %param_type.3543
%.tmp3575 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3576 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3575, i32 0, i32 7
%.tmp3577 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3576
store %m307$.Node.type* %.tmp3577, %m307$.Node.type** %param_ptr.3546
br label %.if.end.3569
.if.false.3569:
br label %.if.end.3569
.if.end.3569:
%.tmp3578 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3579 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3578, i32 0, i32 1
%.tmp3580 = load %m0$.File.type*, %m0$.File.type** %.tmp3579
%.tmp3582 = getelementptr [13 x i8], [13 x i8]*@.str3581, i32 0, i32 0
%.tmp3583 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3584 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3543
%.tmp3585 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3583, %m1861$.Type.type* %.tmp3584)
%.tmp3586 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3587 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3586, i32 0, i32 1
%.tmp3588 = load i8*, i8** %.tmp3587
%.tmp3589 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3580, i8* %.tmp3582, i8* %.tmp3585, i8* %.tmp3588)
%.tmp3590 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3546
%.tmp3591 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3590, i32 0, i32 7
%.tmp3592 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3591
store %m307$.Node.type* %.tmp3592, %m307$.Node.type** %param_ptr.3546
br label %.for.start.3544
.for.end.3544:
%.tmp3593 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3594 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3593, i32 0, i32 1
%.tmp3595 = load %m0$.File.type*, %m0$.File.type** %.tmp3594
%.tmp3597 = getelementptr [5 x i8], [5 x i8]*@.str3596, i32 0, i32 0
%.tmp3598 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3595, i8* %.tmp3597)
%.tmp3599 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3601 = getelementptr [9 x i8], [9 x i8]*@.str3600, i32 0, i32 0
%.tmp3602 = bitcast ptr null to i8*
%.tmp3603 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3599, i8* %.tmp3601, i8* %.tmp3602, i8* %.tmp3603)
%.tmp3604 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3605 = load %m307$.Node.type*, %m307$.Node.type** %params.3542
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3604, %m307$.Node.type* %.tmp3605)
%.tmp3606 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3607 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3606, i32 0, i32 6
%.tmp3608 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3607
%.tmp3610 = getelementptr [6 x i8], [6 x i8]*@.str3609, i32 0, i32 0
%.tmp3611 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3608, i8* %.tmp3610)
%fn_block.3612 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3611, %m307$.Node.type** %fn_block.3612
%.tmp3613 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3614 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3612
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3613, %m307$.Node.type* %.tmp3614)
%.tmp3615 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3615)
%.tmp3616 = bitcast ptr null to %m307$.Node.type*
%last_valid_instruction.3617 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3616, %m307$.Node.type** %last_valid_instruction.3617
%.tmp3618 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3612
%.tmp3619 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3618, i32 0, i32 6
%.tmp3620 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3619
%.tmp3622 = getelementptr [12 x i8], [12 x i8]*@.str3621, i32 0, i32 0
%.tmp3623 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3620, i8* %.tmp3622)
%ci.3624 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3623, %m307$.Node.type** %ci.3624
%.tmp3626 = load %m307$.Node.type*, %m307$.Node.type** %ci.3624
%.tmp3627 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3626, i32 0, i32 6
%.tmp3628 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3627
store %m307$.Node.type* %.tmp3628, %m307$.Node.type** %ci.3624
br label %.for.start.3625
.for.start.3625:
%.tmp3629 = load %m307$.Node.type*, %m307$.Node.type** %ci.3624
%.tmp3630 = icmp ne %m307$.Node.type* %.tmp3629, null
br i1 %.tmp3630, label %.for.continue.3625, label %.for.end.3625
.for.continue.3625:
%.tmp3631 = load %m307$.Node.type*, %m307$.Node.type** %ci.3624
%.tmp3632 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3631, i32 0, i32 0
%.tmp3633 = load i8*, i8** %.tmp3632
%.tmp3635 = getelementptr [3 x i8], [3 x i8]*@.str3634, i32 0, i32 0
%.tmp3636 = call i32(i8*,i8*) @strcmp(i8* %.tmp3633, i8* %.tmp3635)
%.tmp3637 = icmp ne i32 %.tmp3636, 0
%.tmp3638 = load %m307$.Node.type*, %m307$.Node.type** %ci.3624
%.tmp3639 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3638, i32 0, i32 0
%.tmp3640 = load i8*, i8** %.tmp3639
%.tmp3642 = getelementptr [9 x i8], [9 x i8]*@.str3641, i32 0, i32 0
%.tmp3643 = call i32(i8*,i8*) @strcmp(i8* %.tmp3640, i8* %.tmp3642)
%.tmp3644 = icmp ne i32 %.tmp3643, 0
%.tmp3645 = and i1 %.tmp3637, %.tmp3644
br i1 %.tmp3645, label %.if.true.3646, label %.if.false.3646
.if.true.3646:
%.tmp3647 = load %m307$.Node.type*, %m307$.Node.type** %ci.3624
store %m307$.Node.type* %.tmp3647, %m307$.Node.type** %last_valid_instruction.3617
br label %.if.end.3646
.if.false.3646:
br label %.if.end.3646
.if.end.3646:
%.tmp3648 = load %m307$.Node.type*, %m307$.Node.type** %ci.3624
%.tmp3649 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3648, i32 0, i32 7
%.tmp3650 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3649
store %m307$.Node.type* %.tmp3650, %m307$.Node.type** %ci.3624
br label %.for.start.3625
.for.end.3625:
%add_implicit_return.3651 = alloca i1
store i1 0, i1* %add_implicit_return.3651
%.tmp3652 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3617
%.tmp3653 = icmp eq %m307$.Node.type* %.tmp3652, null
br i1 %.tmp3653, label %.if.true.3654, label %.if.false.3654
.if.true.3654:
store i1 1, i1* %add_implicit_return.3651
br label %.if.end.3654
.if.false.3654:
%.tmp3655 = load %m307$.Node.type*, %m307$.Node.type** %last_valid_instruction.3617
%.tmp3656 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3655, i32 0, i32 6
%.tmp3657 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3656
%.tmp3658 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3657, i32 0, i32 0
%.tmp3659 = load i8*, i8** %.tmp3658
%.tmp3661 = getelementptr [7 x i8], [7 x i8]*@.str3660, i32 0, i32 0
%.tmp3662 = call i32(i8*,i8*) @strcmp(i8* %.tmp3659, i8* %.tmp3661)
%.tmp3663 = icmp ne i32 %.tmp3662, 0
br i1 %.tmp3663, label %.if.true.3664, label %.if.false.3664
.if.true.3664:
store i1 1, i1* %add_implicit_return.3651
br label %.if.end.3664
.if.false.3664:
br label %.if.end.3664
.if.end.3664:
br label %.if.end.3654
.if.end.3654:
%.tmp3665 = load i1, i1* %add_implicit_return.3651
br i1 %.tmp3665, label %.if.true.3666, label %.if.false.3666
.if.true.3666:
%.tmp3667 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3668 = load %m1861$.Type.type*, %m1861$.Type.type** %return_type.3232
%.tmp3669 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3667, %m1861$.Type.type* %.tmp3668)
%.tmp3671 = getelementptr [5 x i8], [5 x i8]*@.str3670, i32 0, i32 0
%.tmp3672 = call i32(i8*,i8*) @strcmp(i8* %.tmp3669, i8* %.tmp3671)
%.tmp3673 = icmp ne i32 %.tmp3672, 0
br i1 %.tmp3673, label %.if.true.3674, label %.if.false.3674
.if.true.3674:
%.tmp3675 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3676 = load %m307$.Node.type*, %m307$.Node.type** %fn_block.3612
%.tmp3678 = getelementptr [21 x i8], [21 x i8]*@.str3677, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3675, %m307$.Node.type* %.tmp3676, i8* %.tmp3678)
br label %.if.end.3674
.if.false.3674:
%.tmp3679 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3680 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3679, i32 0, i32 1
%.tmp3681 = load %m0$.File.type*, %m0$.File.type** %.tmp3680
%.tmp3683 = getelementptr [10 x i8], [10 x i8]*@.str3682, i32 0, i32 0
%.tmp3684 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3681, i8* %.tmp3683)
br label %.if.end.3674
.if.end.3674:
br label %.if.end.3666
.if.false.3666:
br label %.if.end.3666
.if.end.3666:
%.tmp3685 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3686 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3685, i32 0, i32 1
%.tmp3687 = load %m0$.File.type*, %m0$.File.type** %.tmp3686
%.tmp3689 = getelementptr [3 x i8], [3 x i8]*@.str3688, i32 0, i32 0
%.tmp3690 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3687, i8* %.tmp3689)
br label %.if.end.3515
.if.end.3515:
br label %.if.end.3486
.if.false.3486:
%.tmp3691 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3692 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3691, i32 0, i32 0
%.tmp3693 = load i8*, i8** %.tmp3692
%.tmp3695 = getelementptr [7 x i8], [7 x i8]*@.str3694, i32 0, i32 0
%.tmp3696 = call i32(i8*,i8*) @strcmp(i8* %.tmp3693, i8* %.tmp3695)
%.tmp3697 = icmp eq i32 %.tmp3696, 0
br i1 %.tmp3697, label %.if.true.3698, label %.if.false.3698
.if.true.3698:
%.tmp3699 = load i1, i1* %shallow
%.tmp3700 = icmp eq i1 %.tmp3699, 1
br i1 %.tmp3700, label %.if.true.3701, label %.if.false.3701
.if.true.3701:
%.tmp3702 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3703 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3702, i32 0, i32 6
%.tmp3704 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3703
%.tmp3705 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3704, i32 0, i32 7
%.tmp3706 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3705
%.tmp3707 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3706, i32 0, i32 1
%.tmp3708 = load i8*, i8** %.tmp3707
%mod_name.3709 = alloca i8*
store i8* %.tmp3708, i8** %mod_name.3709
%.tmp3710 = load i8*, i8** %mod_name.3709
%.tmp3711 = call i32(i8*) @strlen(i8* %.tmp3710)
%mod_name_len.3712 = alloca i32
store i32 %.tmp3711, i32* %mod_name_len.3712
%.tmp3713 = load i32, i32* %mod_name_len.3712
%.tmp3714 = sub i32 %.tmp3713, 1
%.tmp3715 = call i8*(i32) @malloc(i32 %.tmp3714)
%trimmed_path.3716 = alloca i8*
store i8* %.tmp3715, i8** %trimmed_path.3716
%i.3718 = alloca i32
store i32 1, i32* %i.3718
br label %.for.start.3717
.for.start.3717:
%.tmp3719 = load i32, i32* %i.3718
%.tmp3720 = load i32, i32* %mod_name_len.3712
%.tmp3721 = sub i32 %.tmp3720, 1
%.tmp3722 = icmp slt i32 %.tmp3719, %.tmp3721
br i1 %.tmp3722, label %.for.continue.3717, label %.for.end.3717
.for.continue.3717:
%.tmp3723 = load i32, i32* %i.3718
%.tmp3724 = sub i32 %.tmp3723, 1
%.tmp3725 = load i8*, i8** %trimmed_path.3716
%.tmp3726 = getelementptr i8, i8* %.tmp3725, i32 %.tmp3724
%.tmp3727 = load i32, i32* %i.3718
%.tmp3728 = load i8*, i8** %mod_name.3709
%.tmp3729 = getelementptr i8, i8* %.tmp3728, i32 %.tmp3727
%.tmp3730 = load i8, i8* %.tmp3729
store i8 %.tmp3730, i8* %.tmp3726
%.tmp3731 = load i32, i32* %i.3718
%.tmp3732 = add i32 %.tmp3731, 1
store i32 %.tmp3732, i32* %i.3718
br label %.for.start.3717
.for.end.3717:
%.tmp3733 = load i32, i32* %mod_name_len.3712
%.tmp3734 = sub i32 %.tmp3733, 2
%.tmp3735 = load i8*, i8** %trimmed_path.3716
%.tmp3736 = getelementptr i8, i8* %.tmp3735, i32 %.tmp3734
store i8 0, i8* %.tmp3736
%.tmp3737 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3738 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3739 = load i8*, i8** %trimmed_path.3716
%.tmp3740 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3737, %m307$.Node.type* %.tmp3738, i8* %.tmp3739)
%mod_abspath.3741 = alloca i8*
store i8* %.tmp3740, i8** %mod_abspath.3741
%.tmp3742 = load i8*, i8** %mod_abspath.3741
%.tmp3743 = call i8*(i32) @malloc(i32 4096)
%.tmp3744 = call i8*(i8*,i8*) @realpath(i8* %.tmp3742, i8* %.tmp3743)
store i8* %.tmp3744, i8** %mod_abspath.3741
%.tmp3745 = load i8*, i8** %mod_abspath.3741
%.tmp3746 = icmp eq i8* %.tmp3745, null
br i1 %.tmp3746, label %.if.true.3747, label %.if.false.3747
.if.true.3747:
%.tmp3748 = getelementptr i8*, i8** %err_buf.3233, i32 0
%.tmp3750 = getelementptr [54 x i8], [54 x i8]*@.str3749, i32 0, i32 0
%.tmp3751 = load i8*, i8** %mod_name.3709
%.tmp3752 = load i8*, i8** %trimmed_path.3716
%.tmp3753 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3748, i8* %.tmp3750, i8* %.tmp3751, i8* %.tmp3752)
%.tmp3754 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3755 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3756 = load i8*, i8** %err_buf.3233
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3754, %m307$.Node.type* %.tmp3755, i8* %.tmp3756)
ret void
br label %.if.end.3747
.if.false.3747:
br label %.if.end.3747
.if.end.3747:
%m.3757 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3757
%.tmp3758 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3759 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3758, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3761 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3762 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3761, i32 0, i32 6
%.tmp3763 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3762
store %m1861$.ModuleLookup.type* %.tmp3763, %m1861$.ModuleLookup.type** %m.3757
br label %.for.start.3760
.for.start.3760:
%.tmp3764 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
%.tmp3765 = icmp ne %m1861$.ModuleLookup.type* %.tmp3764, null
%.tmp3766 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3767 = icmp eq %m1861$.ModuleLookup.type* %.tmp3766, null
%.tmp3768 = and i1 %.tmp3765, %.tmp3767
br i1 %.tmp3768, label %.for.continue.3760, label %.for.end.3760
.for.continue.3760:
%.tmp3769 = load i8*, i8** %mod_abspath.3741
%.tmp3770 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
%.tmp3771 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3770, i32 0, i32 0
%.tmp3772 = load i8*, i8** %.tmp3771
%.tmp3773 = call i32(i8*,i8*) @strcmp(i8* %.tmp3769, i8* %.tmp3772)
%.tmp3774 = icmp eq i32 %.tmp3773, 0
br i1 %.tmp3774, label %.if.true.3775, label %.if.false.3775
.if.true.3775:
%.tmp3776 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
store %m1861$.ModuleLookup.type* %.tmp3776, %m1861$.ModuleLookup.type** %mod.3759
br label %.if.end.3775
.if.false.3775:
br label %.if.end.3775
.if.end.3775:
%.tmp3777 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
%.tmp3778 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3777, i32 0, i32 2
%.tmp3779 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3778
store %m1861$.ModuleLookup.type* %.tmp3779, %m1861$.ModuleLookup.type** %m.3757
br label %.for.start.3760
.for.end.3760:
%.tmp3780 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3781 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3780, i32 0, i32 6
%.tmp3782 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3781
%.tmp3783 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3782, i32 0, i32 7
%.tmp3784 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3783
%.tmp3785 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3784, i32 0, i32 7
%.tmp3786 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3785
%.tmp3787 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3786, i32 0, i32 7
%.tmp3788 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3787
%.tmp3789 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3788, i32 0, i32 1
%.tmp3790 = load i8*, i8** %.tmp3789
%asname.3791 = alloca i8*
store i8* %.tmp3790, i8** %asname.3791
%.tmp3792 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3793 = icmp eq %m1861$.ModuleLookup.type* %.tmp3792, null
br i1 %.tmp3793, label %.if.true.3794, label %.if.false.3794
.if.true.3794:
%.tmp3795 = load i32, i32* @ModuleLookup_size
%.tmp3796 = call i8*(i32) @malloc(i32 %.tmp3795)
%.tmp3797 = bitcast i8* %.tmp3796 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3797, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3798 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3799 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3798, i32 0, i32 0
%.tmp3800 = load i8*, i8** %mod_abspath.3741
store i8* %.tmp3800, i8** %.tmp3799
%.tmp3801 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3802 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3801, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3802
%.tmp3803 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3804 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3803, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3804
%.tmp3805 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3806 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3805, i32 0, i32 1
%.tmp3807 = getelementptr i8*, i8** %.tmp3806, i32 0
%.tmp3809 = getelementptr [5 x i8], [5 x i8]*@.str3808, i32 0, i32 0
%.tmp3810 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3811 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3810)
%.tmp3812 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3807, i8* %.tmp3809, i32 %.tmp3811)
%.tmp3814 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3815 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3814, i32 0, i32 6
%.tmp3816 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3815
store %m1861$.ModuleLookup.type* %.tmp3816, %m1861$.ModuleLookup.type** %m.3757
br label %.for.start.3813
.for.start.3813:
%.tmp3817 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
%.tmp3818 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3817, i32 0, i32 2
%.tmp3819 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3818
%.tmp3820 = icmp ne %m1861$.ModuleLookup.type* %.tmp3819, null
br i1 %.tmp3820, label %.for.continue.3813, label %.for.end.3813
.for.continue.3813:
%.tmp3821 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
%.tmp3822 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3821, i32 0, i32 2
%.tmp3823 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3822
store %m1861$.ModuleLookup.type* %.tmp3823, %m1861$.ModuleLookup.type** %m.3757
br label %.for.start.3813
.for.end.3813:
%.tmp3824 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3757
%.tmp3825 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3824, i32 0, i32 2
%.tmp3826 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
store %m1861$.ModuleLookup.type* %.tmp3826, %m1861$.ModuleLookup.type** %.tmp3825
%.tmp3827 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3828 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3829 = load i8*, i8** %asname.3791
%.tmp3830 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3831 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3830, i32 0, i32 0
%.tmp3832 = load i8*, i8** %.tmp3831
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3827, %m307$.Node.type* %.tmp3828, i8* %.tmp3829, i8* %.tmp3832)
%.tmp3833 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3834 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3833, i32 0, i32 7
%.tmp3835 = load i8*, i8** %.tmp3834
%curr_mod.3836 = alloca i8*
store i8* %.tmp3835, i8** %curr_mod.3836
%.tmp3837 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3838 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3837, i32 0, i32 7
%.tmp3839 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3840 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3839, i32 0, i32 0
%.tmp3841 = load i8*, i8** %.tmp3840
store i8* %.tmp3841, i8** %.tmp3838
%.tmp3842 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3843 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3844 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3845 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3844, i32 0, i32 0
%.tmp3846 = load i8*, i8** %.tmp3845
%.tmp3847 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3842, %m307$.Node.type* %.tmp3843, i8* %.tmp3846)
%.tmp3848 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3849 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3848, i32 0, i32 7
%.tmp3850 = load i8*, i8** %curr_mod.3836
store i8* %.tmp3850, i8** %.tmp3849
br label %.if.end.3794
.if.false.3794:
%.tmp3851 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3852 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3853 = load i8*, i8** %asname.3791
%.tmp3854 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3759
%.tmp3855 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3854, i32 0, i32 0
%.tmp3856 = load i8*, i8** %.tmp3855
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3851, %m307$.Node.type* %.tmp3852, i8* %.tmp3853, i8* %.tmp3856)
br label %.if.end.3794
.if.end.3794:
br label %.if.end.3701
.if.false.3701:
br label %.if.end.3701
.if.end.3701:
br label %.if.end.3698
.if.false.3698:
%.tmp3857 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3858 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3860 = getelementptr [40 x i8], [40 x i8]*@.str3859, i32 0, i32 0
%.tmp3861 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3857, %m307$.Node.type* %.tmp3858, i8* %.tmp3860)
%.tmp3862 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3863 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3862, i32 0, i32 0
%.tmp3864 = load i8*, i8** %.tmp3863
%.tmp3865 = call i32(i8*,...) @printf(i8* %.tmp3861, i8* %.tmp3864)
br label %.if.end.3698
.if.end.3698:
br label %.if.end.3486
.if.end.3486:
br label %.if.end.3415
.if.end.3415:
br label %.if.end.3316
.if.end.3316:
br label %.if.end.3250
.if.end.3250:
br label %.if.end.3242
.if.end.3242:
ret void
}
define i8* @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3866 = alloca i8*
store i8* null, i8** %buf.3866
%.tmp3867 = getelementptr i8*, i8** %buf.3866, i32 0
%.tmp3869 = getelementptr [31 x i8], [31 x i8]*@.str3868, i32 0, i32 0
%.tmp3870 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3871 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3870, i32 0, i32 7
%.tmp3872 = load i8*, i8** %.tmp3871
%.tmp3873 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3874 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3873, i32 0, i32 3
%.tmp3875 = load i32, i32* %.tmp3874
%.tmp3876 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3877 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3876, i32 0, i32 4
%.tmp3878 = load i32, i32* %.tmp3877
%.tmp3879 = load i8*, i8** %msg
%.tmp3880 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3867, i8* %.tmp3869, i8* %.tmp3872, i32 %.tmp3875, i32 %.tmp3878, i8* %.tmp3879)
%.tmp3881 = load i8*, i8** %buf.3866
ret i8* %.tmp3881
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3882 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3882
%.tmp3884 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3885 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3884, %m307$.Node.type** %param_ptr.3885
br label %.for.start.3883
.for.start.3883:
%.tmp3886 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3887 = icmp ne %m307$.Node.type* %.tmp3886, null
br i1 %.tmp3887, label %.for.continue.3883, label %.for.end.3883
.for.continue.3883:
%.tmp3888 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3889 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3890 = icmp ne %m307$.Node.type* %.tmp3888, %.tmp3889
br i1 %.tmp3890, label %.if.true.3891, label %.if.false.3891
.if.true.3891:
%.tmp3892 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3893 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3892, i32 0, i32 7
%.tmp3894 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3893
store %m307$.Node.type* %.tmp3894, %m307$.Node.type** %param_ptr.3885
br label %.if.end.3891
.if.false.3891:
br label %.if.end.3891
.if.end.3891:
%.tmp3895 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3896 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3895)
%param_info.3897 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3896, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3898 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3899 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3898, i32 0, i32 2
%.tmp3901 = getelementptr [9 x i8], [9 x i8]*@.str3900, i32 0, i32 0
store i8* %.tmp3901, i8** %.tmp3899
%.tmp3902 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3903 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3902, i32 0, i32 0
%.tmp3904 = load i8*, i8** %.tmp3903
%.tmp3906 = getelementptr [5 x i8], [5 x i8]*@.str3905, i32 0, i32 0
%.tmp3907 = call i32(i8*,i8*) @strcmp(i8* %.tmp3904, i8* %.tmp3906)
%.tmp3908 = icmp eq i32 %.tmp3907, 0
br i1 %.tmp3908, label %.if.true.3909, label %.if.false.3909
.if.true.3909:
%.tmp3910 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3911 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3912 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3911, i32 0, i32 6
%.tmp3913 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3912
%.tmp3914 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3910, %m307$.Node.type* %.tmp3913)
store %m1861$.Type.type* %.tmp3914, %m1861$.Type.type** %param_type.3882
%.tmp3915 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3916 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3915, i32 0, i32 7
%.tmp3917 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3916
store %m307$.Node.type* %.tmp3917, %m307$.Node.type** %param_ptr.3885
br label %.if.end.3909
.if.false.3909:
br label %.if.end.3909
.if.end.3909:
%.tmp3918 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3919 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3918, i32 0, i32 3
%.tmp3920 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3882
store %m1861$.Type.type* %.tmp3920, %m1861$.Type.type** %.tmp3919
%.tmp3921 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3922 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3921, i32 0, i32 1
%.tmp3923 = load i8*, i8** %.tmp3922
%var_name.3924 = alloca i8*
store i8* %.tmp3923, i8** %var_name.3924
%.tmp3925 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3926 = load i8, i8* @SCOPE_LOCAL
%.tmp3927 = load i8*, i8** %var_name.3924
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3925, i8 %.tmp3926, i8* %.tmp3927)
%.tmp3928 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3929 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3930 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3929, i32 0, i32 3
%.tmp3931 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3930
%.tmp3932 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3928, %m1861$.Type.type* %.tmp3931)
%param_info_tr.3933 = alloca i8*
store i8* %.tmp3932, i8** %param_info_tr.3933
%.tmp3934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3935 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3934, i32 0, i32 1
%.tmp3936 = load %m0$.File.type*, %m0$.File.type** %.tmp3935
%.tmp3938 = getelementptr [16 x i8], [16 x i8]*@.str3937, i32 0, i32 0
%.tmp3939 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3940 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3939)
%.tmp3941 = load i8*, i8** %param_info_tr.3933
%.tmp3942 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3936, i8* %.tmp3938, i8* %.tmp3940, i8* %.tmp3941)
%.tmp3943 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3944 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3945 = load i8*, i8** %var_name.3924
%.tmp3946 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3943, %m307$.Node.type* %.tmp3944, i8* %.tmp3945, %m1861$.AssignableInfo.type* %.tmp3946)
%.tmp3947 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3948 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3947, i32 0, i32 1
%.tmp3949 = load %m0$.File.type*, %m0$.File.type** %.tmp3948
%.tmp3951 = getelementptr [28 x i8], [28 x i8]*@.str3950, i32 0, i32 0
%.tmp3952 = load i8*, i8** %param_info_tr.3933
%.tmp3953 = load i8*, i8** %var_name.3924
%.tmp3954 = load i8*, i8** %param_info_tr.3933
%.tmp3955 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3897
%.tmp3956 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3955)
%.tmp3957 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3949, i8* %.tmp3951, i8* %.tmp3952, i8* %.tmp3953, i8* %.tmp3954, i8* %.tmp3956)
%.tmp3958 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3885
%.tmp3959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3958, i32 0, i32 7
%.tmp3960 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3959
store %m307$.Node.type* %.tmp3960, %m307$.Node.type** %param_ptr.3885
br label %.for.start.3883
.for.end.3883:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3961 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3963 = getelementptr [6 x i8], [6 x i8]*@.str3962, i32 0, i32 0
%.tmp3964 = bitcast ptr null to i8*
%.tmp3965 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3961, i8* %.tmp3963, i8* %.tmp3964, i8* %.tmp3965)
%.tmp3966 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3967 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3966, i32 0, i32 6
%.tmp3968 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3967
%.tmp3970 = getelementptr [12 x i8], [12 x i8]*@.str3969, i32 0, i32 0
%.tmp3971 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3968, i8* %.tmp3970)
%exprs.3972 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3971, %m307$.Node.type** %exprs.3972
%.tmp3973 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3972
%.tmp3974 = icmp ne %m307$.Node.type* %.tmp3973, null
br i1 %.tmp3974, label %.if.true.3975, label %.if.false.3975
.if.true.3975:
%.tmp3977 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3972
%.tmp3978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3977, i32 0, i32 6
%.tmp3979 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3978
%b.3980 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3979, %m307$.Node.type** %b.3980
br label %.for.start.3976
.for.start.3976:
%.tmp3981 = load %m307$.Node.type*, %m307$.Node.type** %b.3980
%.tmp3982 = icmp ne %m307$.Node.type* %.tmp3981, null
br i1 %.tmp3982, label %.for.continue.3976, label %.for.end.3976
.for.continue.3976:
%.tmp3983 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3984 = load %m307$.Node.type*, %m307$.Node.type** %b.3980
%.tmp3985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3984, i32 0, i32 6
%.tmp3986 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3985
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3983, %m307$.Node.type* %.tmp3986)
%.tmp3987 = load %m307$.Node.type*, %m307$.Node.type** %b.3980
%.tmp3988 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3987, i32 0, i32 7
%.tmp3989 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3988
store %m307$.Node.type* %.tmp3989, %m307$.Node.type** %b.3980
br label %.for.start.3976
.for.end.3976:
br label %.if.end.3975
.if.false.3975:
br label %.if.end.3975
.if.end.3975:
%.tmp3990 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3990)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3991 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3992 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3993 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3991, %m307$.Node.type* %.tmp3992)
%val.3994 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3993, %m1861$.AssignableInfo.type** %val.3994
%.tmp3995 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3994
%.tmp3996 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3995, i32 0, i32 3
%.tmp3997 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3996
%.tmp3998 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3997, i32 0, i32 0
%.tmp3999 = load i8*, i8** %.tmp3998
%.tmp4001 = getelementptr [7 x i8], [7 x i8]*@.str4000, i32 0, i32 0
%.tmp4002 = call i32(i8*,i8*) @strcmp(i8* %.tmp3999, i8* %.tmp4001)
%.tmp4003 = icmp ne i32 %.tmp4002, 0
br i1 %.tmp4003, label %.if.true.4004, label %.if.false.4004
.if.true.4004:
%.tmp4006 = getelementptr [7 x i8], [7 x i8]*@.str4005, i32 0, i32 0
%.tmp4007 = call i32(i8*,...) @printf(i8* %.tmp4006)
%.tmp4008 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4008
br label %.if.end.4004
.if.false.4004:
br label %.if.end.4004
.if.end.4004:
%.tmp4009 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3994
%.tmp4010 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4009, i32 0, i32 3
%.tmp4011 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4010
%.tmp4012 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4011, i32 0, i32 3
%.tmp4013 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4012
%node_type.4014 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4013, %m1861$.Type.type** %node_type.4014
%i.4016 = alloca i32
store i32 0, i32* %i.4016
br label %.for.start.4015
.for.start.4015:
%.tmp4017 = load i32, i32* %i.4016
%.tmp4018 = load i32, i32* %attr_id
%.tmp4019 = icmp slt i32 %.tmp4017, %.tmp4018
br i1 %.tmp4019, label %.for.continue.4015, label %.for.end.4015
.for.continue.4015:
%.tmp4020 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4014
%.tmp4021 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4020, i32 0, i32 4
%.tmp4022 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4021
store %m1861$.Type.type* %.tmp4022, %m1861$.Type.type** %node_type.4014
%.tmp4023 = load i32, i32* %i.4016
%.tmp4024 = add i32 %.tmp4023, 1
store i32 %.tmp4024, i32* %i.4016
br label %.for.start.4015
.for.end.4015:
%.tmp4025 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4026 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4025)
%info.4027 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4026, %m1861$.AssignableInfo.type** %info.4027
%.tmp4028 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4027
%.tmp4029 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4028, i32 0, i32 3
%.tmp4030 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4014
store %m1861$.Type.type* %.tmp4030, %m1861$.Type.type** %.tmp4029
%.tmp4031 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4032 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4031)
%tmp_id.4033 = alloca i32
store i32 %.tmp4032, i32* %tmp_id.4033
%.tmp4034 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4035 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3994
%.tmp4036 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4035, i32 0, i32 3
%.tmp4037 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4036
%.tmp4038 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4034, %m1861$.Type.type* %.tmp4037)
%type_as_str.4039 = alloca i8*
store i8* %.tmp4038, i8** %type_as_str.4039
%.tmp4040 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4041 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4027
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4040, %m1861$.AssignableInfo.type* %.tmp4041)
%.tmp4042 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4043 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4042, i32 0, i32 1
%.tmp4044 = load %m0$.File.type*, %m0$.File.type** %.tmp4043
%.tmp4046 = getelementptr [52 x i8], [52 x i8]*@.str4045, i32 0, i32 0
%.tmp4047 = load i32, i32* %tmp_id.4033
%.tmp4048 = load i8*, i8** %type_as_str.4039
%.tmp4049 = load i8*, i8** %type_as_str.4039
%.tmp4050 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3994
%.tmp4051 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4050)
%.tmp4052 = load i32, i32* %attr_id
%.tmp4053 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4044, i8* %.tmp4046, i32 %.tmp4047, i8* %.tmp4048, i8* %.tmp4049, i8* %.tmp4051, i32 %.tmp4052)
%.tmp4054 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4055 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4054, i32 0, i32 1
%.tmp4056 = load %m0$.File.type*, %m0$.File.type** %.tmp4055
%.tmp4058 = getelementptr [28 x i8], [28 x i8]*@.str4057, i32 0, i32 0
%.tmp4059 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4027
%.tmp4060 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4059)
%.tmp4061 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4062 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4027
%.tmp4063 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4062, i32 0, i32 3
%.tmp4064 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4063
%.tmp4065 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4061, %m1861$.Type.type* %.tmp4064)
%.tmp4066 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4067 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4027
%.tmp4068 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4067, i32 0, i32 3
%.tmp4069 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4068
%.tmp4070 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4066, %m1861$.Type.type* %.tmp4069)
%.tmp4071 = load i32, i32* %tmp_id.4033
%.tmp4072 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4056, i8* %.tmp4058, i8* %.tmp4060, i8* %.tmp4065, i8* %.tmp4070, i32 %.tmp4071)
%.tmp4073 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4027
ret %m1861$.AssignableInfo.type* %.tmp4073
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
%.tmp4074 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4075 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4076 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4074, %m307$.Node.type* %.tmp4075)
%val.4077 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4076, %m1861$.AssignableInfo.type** %val.4077
%.tmp4078 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4077
%.tmp4079 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4078, i32 0, i32 3
%.tmp4080 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4079
%.tmp4081 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4080, i32 0, i32 0
%.tmp4082 = load i8*, i8** %.tmp4081
%.tmp4084 = getelementptr [7 x i8], [7 x i8]*@.str4083, i32 0, i32 0
%.tmp4085 = call i32(i8*,i8*) @strcmp(i8* %.tmp4082, i8* %.tmp4084)
%.tmp4086 = icmp ne i32 %.tmp4085, 0
br i1 %.tmp4086, label %.if.true.4087, label %.if.false.4087
.if.true.4087:
%.tmp4089 = getelementptr [7 x i8], [7 x i8]*@.str4088, i32 0, i32 0
%.tmp4090 = call i32(i8*,...) @printf(i8* %.tmp4089)
ret void
br label %.if.end.4087
.if.false.4087:
br label %.if.end.4087
.if.end.4087:
%.tmp4091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4077
%.tmp4092 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4091, i32 0, i32 3
%.tmp4093 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4092
%.tmp4094 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4093, i32 0, i32 3
%.tmp4095 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4094
%node_type.4096 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4095, %m1861$.Type.type** %node_type.4096
%i.4098 = alloca i32
store i32 0, i32* %i.4098
br label %.for.start.4097
.for.start.4097:
%.tmp4099 = load i32, i32* %i.4098
%.tmp4100 = load i32, i32* %attr_id
%.tmp4101 = icmp slt i32 %.tmp4099, %.tmp4100
br i1 %.tmp4101, label %.for.continue.4097, label %.for.end.4097
.for.continue.4097:
%.tmp4102 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4096
%.tmp4103 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4102, i32 0, i32 4
%.tmp4104 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4103
store %m1861$.Type.type* %.tmp4104, %m1861$.Type.type** %node_type.4096
%.tmp4105 = load i32, i32* %i.4098
%.tmp4106 = add i32 %.tmp4105, 1
store i32 %.tmp4106, i32* %i.4098
br label %.for.start.4097
.for.end.4097:
%.tmp4107 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4108 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4107)
%tmp_id.4109 = alloca i32
store i32 %.tmp4108, i32* %tmp_id.4109
%.tmp4110 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4111 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4077
%.tmp4112 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4111, i32 0, i32 3
%.tmp4113 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4112
%.tmp4114 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4110, %m1861$.Type.type* %.tmp4113)
%type_as_str.4115 = alloca i8*
store i8* %.tmp4114, i8** %type_as_str.4115
%.tmp4116 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4117 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4116, i32 0, i32 1
%.tmp4118 = load %m0$.File.type*, %m0$.File.type** %.tmp4117
%.tmp4120 = getelementptr [52 x i8], [52 x i8]*@.str4119, i32 0, i32 0
%.tmp4121 = load i32, i32* %tmp_id.4109
%.tmp4122 = load i8*, i8** %type_as_str.4115
%.tmp4123 = load i8*, i8** %type_as_str.4115
%.tmp4124 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.4077
%.tmp4125 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4124)
%.tmp4126 = load i32, i32* %attr_id
%.tmp4127 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4118, i8* %.tmp4120, i32 %.tmp4121, i8* %.tmp4122, i8* %.tmp4123, i8* %.tmp4125, i32 %.tmp4126)
%.tmp4128 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4129 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4128, i32 0, i32 1
%.tmp4130 = load %m0$.File.type*, %m0$.File.type** %.tmp4129
%.tmp4132 = getelementptr [18 x i8], [18 x i8]*@.str4131, i32 0, i32 0
%.tmp4133 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4134 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4096
%.tmp4135 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4133, %m1861$.Type.type* %.tmp4134)
%.tmp4136 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4137 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4096
%.tmp4138 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4136, %m1861$.Type.type* %.tmp4137)
%.tmp4139 = load i8*, i8** %attr
%.tmp4140 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4130, i8* %.tmp4132, i8* %.tmp4135, i8* %.tmp4138, i8* %.tmp4139)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4141 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4142 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4141, i32 0, i32 6
%.tmp4143 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4142
%.tmp4144 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4143, i32 0, i32 6
%.tmp4145 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4144
%dotted.4146 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4145, %m307$.Node.type** %dotted.4146
%.tmp4147 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4146
%.tmp4148 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4147, i32 0, i32 7
%.tmp4149 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4148
%.tmp4150 = icmp ne %m307$.Node.type* %.tmp4149, null
br i1 %.tmp4150, label %.if.true.4151, label %.if.false.4151
.if.true.4151:
%.tmp4152 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4152
br label %.if.end.4151
.if.false.4151:
br label %.if.end.4151
.if.end.4151:
%.tmp4153 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4146
%.tmp4154 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4153, i32 0, i32 1
%.tmp4155 = load i8*, i8** %.tmp4154
%.tmp4157 = getelementptr [7 x i8], [7 x i8]*@.str4156, i32 0, i32 0
%.tmp4158 = call i32(i8*,i8*) @strcmp(i8* %.tmp4155, i8* %.tmp4157)
%.tmp4159 = icmp eq i32 %.tmp4158, 0
br i1 %.tmp4159, label %.if.true.4160, label %.if.false.4160
.if.true.4160:
%.tmp4161 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4163 = getelementptr [8 x i8], [8 x i8]*@.str4162, i32 0, i32 0
%.tmp4164 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4161, i8* %.tmp4163)
%args.4165 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4164, %m307$.Node.type** %args.4165
%.tmp4166 = load %m307$.Node.type*, %m307$.Node.type** %args.4165
%.tmp4167 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4166, i32 0, i32 6
%.tmp4168 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4167
%.tmp4170 = getelementptr [11 x i8], [11 x i8]*@.str4169, i32 0, i32 0
%.tmp4171 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4168, i8* %.tmp4170)
%value.4172 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4171, %m307$.Node.type** %value.4172
%.tmp4173 = load %m307$.Node.type*, %m307$.Node.type** %value.4172
%.tmp4174 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4173, i32 0, i32 6
%.tmp4175 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4174
%.tmp4176 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4175, i32 0, i32 6
%.tmp4177 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4176
%.tmp4178 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4177, i32 0, i32 6
%.tmp4179 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4178
%.tmp4180 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4179, i32 0, i32 6
%.tmp4181 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4180
store %m307$.Node.type* %.tmp4181, %m307$.Node.type** %value.4172
%.tmp4182 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4183 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4182)
%tmp_id.4184 = alloca i32
store i32 %.tmp4183, i32* %tmp_id.4184
%.tmp4185 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4186 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4185)
%info.4187 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4186, %m1861$.AssignableInfo.type** %info.4187
%.tmp4188 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4189 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4187
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4188, %m1861$.AssignableInfo.type* %.tmp4189)
%.tmp4190 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4187
%.tmp4191 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4190, i32 0, i32 3
%.tmp4192 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4192, %m1861$.Type.type** %.tmp4191
%.tmp4193 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4187
%.tmp4194 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4193, i32 0, i32 3
%.tmp4195 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4194
%.tmp4196 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4195, i32 0, i32 0
%.tmp4198 = getelementptr [4 x i8], [4 x i8]*@.str4197, i32 0, i32 0
store i8* %.tmp4198, i8** %.tmp4196
%.tmp4199 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4200 = load %m307$.Node.type*, %m307$.Node.type** %value.4172
%.tmp4201 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4199, %m307$.Node.type* %.tmp4200)
%inspected_type.4202 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4201, %m1861$.Type.type** %inspected_type.4202
%.tmp4203 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4204 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4202
%.tmp4205 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4203, %m1861$.Type.type* %.tmp4204)
%type_as_str.4206 = alloca i8*
store i8* %.tmp4205, i8** %type_as_str.4206
%.tmp4207 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4208 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4207, i32 0, i32 1
%.tmp4209 = load %m0$.File.type*, %m0$.File.type** %.tmp4208
%.tmp4211 = getelementptr [46 x i8], [46 x i8]*@.str4210, i32 0, i32 0
%.tmp4212 = load i32, i32* %tmp_id.4184
%.tmp4213 = load i8*, i8** %type_as_str.4206
%.tmp4214 = load i8*, i8** %type_as_str.4206
%.tmp4215 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4209, i8* %.tmp4211, i32 %.tmp4212, i8* %.tmp4213, i8* %.tmp4214)
%.tmp4216 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4217 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4216, i32 0, i32 1
%.tmp4218 = load %m0$.File.type*, %m0$.File.type** %.tmp4217
%.tmp4220 = getelementptr [35 x i8], [35 x i8]*@.str4219, i32 0, i32 0
%.tmp4221 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4187
%.tmp4222 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4221)
%.tmp4223 = load i8*, i8** %type_as_str.4206
%.tmp4224 = load i32, i32* %tmp_id.4184
%.tmp4225 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4218, i8* %.tmp4220, i8* %.tmp4222, i8* %.tmp4223, i32 %.tmp4224)
%.tmp4226 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4187
ret %m1861$.AssignableInfo.type* %.tmp4226
br label %.if.end.4160
.if.false.4160:
%.tmp4227 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4146
%.tmp4228 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4227, i32 0, i32 1
%.tmp4229 = load i8*, i8** %.tmp4228
%.tmp4231 = getelementptr [7 x i8], [7 x i8]*@.str4230, i32 0, i32 0
%.tmp4232 = call i32(i8*,i8*) @strcmp(i8* %.tmp4229, i8* %.tmp4231)
%.tmp4233 = icmp eq i32 %.tmp4232, 0
br i1 %.tmp4233, label %.if.true.4234, label %.if.false.4234
.if.true.4234:
%.tmp4235 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4237 = getelementptr [8 x i8], [8 x i8]*@.str4236, i32 0, i32 0
%.tmp4238 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4235, i8* %.tmp4237)
%args.4239 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4238, %m307$.Node.type** %args.4239
%.tmp4240 = load %m307$.Node.type*, %m307$.Node.type** %args.4239
%.tmp4241 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4240, i32 0, i32 6
%.tmp4242 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4241
%.tmp4244 = getelementptr [11 x i8], [11 x i8]*@.str4243, i32 0, i32 0
%.tmp4245 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4242, i8* %.tmp4244)
%array.4246 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4245, %m307$.Node.type** %array.4246
%.tmp4247 = load %m307$.Node.type*, %m307$.Node.type** %array.4246
%.tmp4248 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4247, i32 0, i32 7
%.tmp4249 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4248
%.tmp4251 = getelementptr [11 x i8], [11 x i8]*@.str4250, i32 0, i32 0
%.tmp4252 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4249, i8* %.tmp4251)
%value.4253 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4252, %m307$.Node.type** %value.4253
%.tmp4254 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4255 = load %m307$.Node.type*, %m307$.Node.type** %value.4253
%.tmp4256 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4254, %m307$.Node.type* %.tmp4255)
%value_info.4257 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4256, %m1861$.AssignableInfo.type** %value_info.4257
%.tmp4258 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4259 = load %m307$.Node.type*, %m307$.Node.type** %array.4246
%.tmp4260 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4258, %m307$.Node.type* %.tmp4259)
%array_info.4261 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4260, %m1861$.AssignableInfo.type** %array_info.4261
%.tmp4262 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4263 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4262)
%info.4264 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4263, %m1861$.AssignableInfo.type** %info.4264
%.tmp4265 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4266 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4264
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4265, %m1861$.AssignableInfo.type* %.tmp4266)
%.tmp4267 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4264
%.tmp4268 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4267, i32 0, i32 3
%.tmp4269 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4261
%.tmp4270 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4269, i32 0, i32 3
%.tmp4271 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4270
store %m1861$.Type.type* %.tmp4271, %m1861$.Type.type** %.tmp4268
%builtin_prefix.4272 = alloca i8*
store i8* null, i8** %builtin_prefix.4272
%.tmp4273 = getelementptr i8*, i8** %builtin_prefix.4272, i32 0
%.tmp4275 = getelementptr [5 x i8], [5 x i8]*@.str4274, i32 0, i32 0
%.tmp4276 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4277 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4276)
%.tmp4278 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4273, i8* %.tmp4275, i32 %.tmp4277)
%.tmp4279 = call i8*() @m2540$append_tmpl.cp()
%tmpl.4280 = alloca i8*
store i8* %.tmp4279, i8** %tmpl.4280
%.tmp4281 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4282 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4281, i32 0, i32 1
%.tmp4283 = load %m0$.File.type*, %m0$.File.type** %.tmp4282
%.tmp4284 = load i8*, i8** %tmpl.4280
%.tmp4285 = load i8*, i8** %builtin_prefix.4272
%.tmp4286 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4287 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4261
%.tmp4288 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4287, i32 0, i32 3
%.tmp4289 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4288
%.tmp4290 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4286, %m1861$.Type.type* %.tmp4289)
%.tmp4291 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4261
%.tmp4292 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4291)
%.tmp4293 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4294 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4257
%.tmp4295 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4294, i32 0, i32 3
%.tmp4296 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4295
%.tmp4297 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4293, %m1861$.Type.type* %.tmp4296)
%.tmp4298 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4257
%.tmp4299 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4298)
%.tmp4300 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4264
%.tmp4301 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4300)
%.tmp4302 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4283, i8* %.tmp4284, i8* %.tmp4285, i8* %.tmp4290, i8* %.tmp4292, i8* %.tmp4297, i8* %.tmp4299, i8* %.tmp4301)
%.tmp4303 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4304 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4303)
%info_g.4305 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4304, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4306 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4307 = load i8, i8* @SCOPE_GLOBAL
%.tmp4309 = getelementptr [8 x i8], [8 x i8]*@.str4308, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp4306, i8 %.tmp4307, i8* %.tmp4309)
%.tmp4310 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4311 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4310, i32 0, i32 3
%.tmp4312 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4312, %m1861$.Type.type** %.tmp4311
%.tmp4313 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4314 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4313, i32 0, i32 3
%.tmp4315 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4314
%.tmp4316 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4315, i32 0, i32 0
%.tmp4318 = getelementptr [9 x i8], [9 x i8]*@.str4317, i32 0, i32 0
store i8* %.tmp4318, i8** %.tmp4316
%.tmp4319 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4320 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4319, i32 0, i32 3
%.tmp4321 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4320
%.tmp4322 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4321, i32 0, i32 3
%.tmp4323 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4323, %m1861$.Type.type** %.tmp4322
%.tmp4324 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4325 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4324, i32 0, i32 3
%.tmp4326 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4325
%.tmp4327 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4326, i32 0, i32 3
%.tmp4328 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4327
%.tmp4329 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4328, i32 0, i32 0
%.tmp4331 = getelementptr [4 x i8], [4 x i8]*@.str4330, i32 0, i32 0
store i8* %.tmp4331, i8** %.tmp4329
%.tmp4332 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4333 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4332, i32 0, i32 3
%.tmp4334 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4333
%.tmp4335 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4334, i32 0, i32 3
%.tmp4336 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4335
%.tmp4337 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4336, i32 0, i32 3
%.tmp4338 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4338, %m1861$.Type.type** %.tmp4337
%.tmp4339 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4340 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4339, i32 0, i32 3
%.tmp4341 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4340
%.tmp4342 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4341, i32 0, i32 3
%.tmp4343 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4342
%.tmp4344 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4343, i32 0, i32 3
%.tmp4345 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4344
%.tmp4346 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4345, i32 0, i32 0
%.tmp4348 = getelementptr [4 x i8], [4 x i8]*@.str4347, i32 0, i32 0
store i8* %.tmp4348, i8** %.tmp4346
%.tmp4349 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4350 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4349, i32 0, i32 3
%.tmp4351 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4350
%.tmp4352 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4351, i32 0, i32 3
%.tmp4353 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4352
%.tmp4354 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4353, i32 0, i32 4
%.tmp4355 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4355, %m1861$.Type.type** %.tmp4354
%.tmp4356 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4357 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4356, i32 0, i32 3
%.tmp4358 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4357
%.tmp4359 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4358, i32 0, i32 3
%.tmp4360 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4359
%.tmp4361 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4360, i32 0, i32 4
%.tmp4362 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4361
%.tmp4363 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4362, i32 0, i32 0
%.tmp4365 = getelementptr [4 x i8], [4 x i8]*@.str4364, i32 0, i32 0
store i8* %.tmp4365, i8** %.tmp4363
%.tmp4366 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4367 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4366, i32 0, i32 3
%.tmp4368 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4367
%.tmp4369 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4368, i32 0, i32 3
%.tmp4370 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4369
%.tmp4371 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4370, i32 0, i32 4
%.tmp4372 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4371
%.tmp4373 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4372, i32 0, i32 3
%.tmp4374 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4374, %m1861$.Type.type** %.tmp4373
%.tmp4375 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4376 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4375, i32 0, i32 3
%.tmp4377 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4376
%.tmp4378 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4377, i32 0, i32 3
%.tmp4379 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4378
%.tmp4380 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4379, i32 0, i32 4
%.tmp4381 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4380
%.tmp4382 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4381, i32 0, i32 3
%.tmp4383 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4382
%.tmp4384 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4383, i32 0, i32 0
%.tmp4386 = getelementptr [4 x i8], [4 x i8]*@.str4385, i32 0, i32 0
store i8* %.tmp4386, i8** %.tmp4384
%.tmp4387 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4388 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4387, i32 0, i32 3
%.tmp4389 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4388
%.tmp4390 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4389, i32 0, i32 3
%.tmp4391 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4390
%.tmp4392 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4391, i32 0, i32 4
%.tmp4393 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4392
%.tmp4394 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4393, i32 0, i32 4
%.tmp4395 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4395, %m1861$.Type.type** %.tmp4394
%.tmp4396 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
%.tmp4397 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4396, i32 0, i32 3
%.tmp4398 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4397
%.tmp4399 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4398, i32 0, i32 3
%.tmp4400 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4399
%.tmp4401 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4400, i32 0, i32 4
%.tmp4402 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4401
%.tmp4403 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4402, i32 0, i32 4
%.tmp4404 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4403
%.tmp4405 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4404, i32 0, i32 0
%.tmp4407 = getelementptr [4 x i8], [4 x i8]*@.str4406, i32 0, i32 0
store i8* %.tmp4407, i8** %.tmp4405
%.tmp4408 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4410 = getelementptr [8 x i8], [8 x i8]*@.str4409, i32 0, i32 0
%.tmp4412 = getelementptr [7 x i8], [7 x i8]*@.str4411, i32 0, i32 0
%.tmp4413 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4305
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp4408, i8* %.tmp4410, i8* %.tmp4412, %m1861$.AssignableInfo.type* %.tmp4413, i1 1, i1 0)
%.tmp4414 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4264
ret %m1861$.AssignableInfo.type* %.tmp4414
br label %.if.end.4234
.if.false.4234:
%.tmp4415 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4146
%.tmp4416 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4415, i32 0, i32 1
%.tmp4417 = load i8*, i8** %.tmp4416
%.tmp4419 = getelementptr [4 x i8], [4 x i8]*@.str4418, i32 0, i32 0
%.tmp4420 = call i32(i8*,i8*) @strcmp(i8* %.tmp4417, i8* %.tmp4419)
%.tmp4421 = icmp eq i32 %.tmp4420, 0
br i1 %.tmp4421, label %.if.true.4422, label %.if.false.4422
.if.true.4422:
%.tmp4423 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4425 = getelementptr [8 x i8], [8 x i8]*@.str4424, i32 0, i32 0
%.tmp4426 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4423, i8* %.tmp4425)
%args.4427 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4426, %m307$.Node.type** %args.4427
%.tmp4428 = load %m307$.Node.type*, %m307$.Node.type** %args.4427
%.tmp4429 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4428, i32 0, i32 6
%.tmp4430 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4429
%.tmp4432 = getelementptr [11 x i8], [11 x i8]*@.str4431, i32 0, i32 0
%.tmp4433 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4430, i8* %.tmp4432)
%value.4434 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4433, %m307$.Node.type** %value.4434
%.tmp4435 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4436 = load %m307$.Node.type*, %m307$.Node.type** %value.4434
%.tmp4437 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i32) @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.tmp4435, %m307$.Node.type* %.tmp4436, i32 1)
ret %m1861$.AssignableInfo.type* %.tmp4437
br label %.if.end.4422
.if.false.4422:
br label %.if.end.4422
.if.end.4422:
br label %.if.end.4234
.if.end.4234:
br label %.if.end.4160
.if.end.4160:
%.tmp4438 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4438
}
define i8* @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4440 = getelementptr [1 x i8], [1 x i8]*@.str4439, i32 0, i32 0
%err_buf.4441 = alloca i8*
store i8* %.tmp4440, i8** %err_buf.4441
%.tmp4442 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4443 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4442, i32 0, i32 7
%.tmp4444 = load i8*, i8** %.tmp4443
%mod_abspath.4445 = alloca i8*
store i8* %.tmp4444, i8** %mod_abspath.4445
%.tmp4446 = load i8*, i8** %mod_abspath.4445
%.tmp4447 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4446)
%dirname.4448 = alloca i8*
store i8* %.tmp4447, i8** %dirname.4448
%.tmp4449 = load i8*, i8** %import_str
%.tmp4450 = getelementptr i8, i8* %.tmp4449, i32 0
%.tmp4451 = load i8, i8* %.tmp4450
%.tmp4452 = icmp eq i8 %.tmp4451, 47
br i1 %.tmp4452, label %.if.true.4453, label %.if.false.4453
.if.true.4453:
%.tmp4454 = getelementptr i8*, i8** %err_buf.4441, i32 0
%.tmp4456 = getelementptr [46 x i8], [46 x i8]*@.str4455, i32 0, i32 0
%.tmp4457 = load i8*, i8** %import_str
%.tmp4458 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4454, i8* %.tmp4456, i8* %.tmp4457)
%.tmp4459 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4460 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4461 = load i8*, i8** %err_buf.4441
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4459, %m307$.Node.type* %.tmp4460, i8* %.tmp4461)
%.tmp4462 = bitcast ptr null to i8*
ret i8* %.tmp4462
br label %.if.end.4453
.if.false.4453:
br label %.if.end.4453
.if.end.4453:
%.tmp4463 = load i8*, i8** %import_str
%.tmp4464 = getelementptr i8, i8* %.tmp4463, i32 0
%.tmp4465 = load i8, i8* %.tmp4464
%.tmp4466 = icmp ne i8 %.tmp4465, 46
%.tmp4467 = load i8*, i8** %import_str
%.tmp4468 = getelementptr i8, i8* %.tmp4467, i32 1
%.tmp4469 = load i8, i8* %.tmp4468
%.tmp4470 = icmp ne i8 %.tmp4469, 47
%.tmp4471 = and i1 %.tmp4466, %.tmp4470
br i1 %.tmp4471, label %.if.true.4472, label %.if.false.4472
.if.true.4472:
%.tmp4473 = call i8*() @m1861$get_root.cp()
%root.4474 = alloca i8*
store i8* %.tmp4473, i8** %root.4474
%.tmp4475 = getelementptr i8*, i8** %mod_abspath.4445, i32 0
%.tmp4477 = getelementptr [13 x i8], [13 x i8]*@.str4476, i32 0, i32 0
%.tmp4478 = load i8*, i8** %root.4474
%.tmp4479 = load i8*, i8** %import_str
%.tmp4480 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4475, i8* %.tmp4477, i8* %.tmp4478, i8* %.tmp4479)
br label %.if.end.4472
.if.false.4472:
%.tmp4481 = load i8*, i8** %dirname.4448
%.tmp4483 = getelementptr [1 x i8], [1 x i8]*@.str4482, i32 0, i32 0
%.tmp4484 = call i32(i8*,i8*) @strcmp(i8* %.tmp4481, i8* %.tmp4483)
%.tmp4485 = icmp eq i32 %.tmp4484, 0
br i1 %.tmp4485, label %.if.true.4486, label %.if.false.4486
.if.true.4486:
%.tmp4487 = getelementptr i8*, i8** %mod_abspath.4445, i32 0
%.tmp4489 = getelementptr [6 x i8], [6 x i8]*@.str4488, i32 0, i32 0
%.tmp4490 = load i8*, i8** %import_str
%.tmp4491 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4487, i8* %.tmp4489, i8* %.tmp4490)
br label %.if.end.4486
.if.false.4486:
%.tmp4492 = getelementptr i8*, i8** %mod_abspath.4445, i32 0
%.tmp4494 = getelementptr [9 x i8], [9 x i8]*@.str4493, i32 0, i32 0
%.tmp4495 = load i8*, i8** %dirname.4448
%.tmp4496 = load i8*, i8** %import_str
%.tmp4497 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4492, i8* %.tmp4494, i8* %.tmp4495, i8* %.tmp4496)
br label %.if.end.4486
.if.end.4486:
br label %.if.end.4472
.if.end.4472:
%.tmp4498 = load i8*, i8** %mod_abspath.4445
ret i8* %.tmp4498
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4499 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4500 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4501 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4499, %m307$.Node.type* %.tmp4500)
%info.4502 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4501, %m1861$.AssignableInfo.type** %info.4502
%.tmp4503 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4504 = icmp ne %m1861$.AssignableInfo.type* %.tmp4503, null
br i1 %.tmp4504, label %.if.true.4505, label %.if.false.4505
.if.true.4505:
%.tmp4506 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
ret %m1861$.AssignableInfo.type* %.tmp4506
br label %.if.end.4505
.if.false.4505:
br label %.if.end.4505
.if.end.4505:
%.tmp4507 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4508 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4509 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4507, %m307$.Node.type* %.tmp4508)
store %m1861$.AssignableInfo.type* %.tmp4509, %m1861$.AssignableInfo.type** %info.4502
%.tmp4510 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4511 = icmp eq %m1861$.AssignableInfo.type* %.tmp4510, null
br i1 %.tmp4511, label %.if.true.4512, label %.if.false.4512
.if.true.4512:
%.tmp4513 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4513, label %.if.true.4514, label %.if.false.4514
.if.true.4514:
%.tmp4515 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4516 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4518 = getelementptr [35 x i8], [35 x i8]*@.str4517, i32 0, i32 0
%.tmp4519 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4515, %m307$.Node.type* %.tmp4516, i8* %.tmp4518)
%.tmp4520 = call i32(i8*,...) @printf(i8* %.tmp4519)
br label %.if.end.4514
.if.false.4514:
br label %.if.end.4514
.if.end.4514:
%.tmp4521 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4521
br label %.if.end.4512
.if.false.4512:
br label %.if.end.4512
.if.end.4512:
%.tmp4522 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4524 = getelementptr [8 x i8], [8 x i8]*@.str4523, i32 0, i32 0
%.tmp4525 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4522, i8* %.tmp4524)
%args.4526 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4525, %m307$.Node.type** %args.4526
%.tmp4528 = getelementptr [1 x i8], [1 x i8]*@.str4527, i32 0, i32 0
%params_buff.4529 = alloca i8*
store i8* %.tmp4528, i8** %params_buff.4529
%tmp.4530 = alloca i8*
store i8* null, i8** %tmp.4530
%.tmp4531 = load %m307$.Node.type*, %m307$.Node.type** %args.4526
%.tmp4532 = icmp ne %m307$.Node.type* %.tmp4531, null
br i1 %.tmp4532, label %.if.true.4533, label %.if.false.4533
.if.true.4533:
%.tmp4534 = load %m307$.Node.type*, %m307$.Node.type** %args.4526
%.tmp4535 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4534, i32 0, i32 6
%.tmp4536 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4535
%.tmp4538 = getelementptr [11 x i8], [11 x i8]*@.str4537, i32 0, i32 0
%.tmp4539 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4536, i8* %.tmp4538)
%start.4540 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4539, %m307$.Node.type** %start.4540
%.tmp4542 = load %m307$.Node.type*, %m307$.Node.type** %start.4540
%pp.4543 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4542, %m307$.Node.type** %pp.4543
br label %.for.start.4541
.for.start.4541:
%.tmp4544 = load %m307$.Node.type*, %m307$.Node.type** %pp.4543
%.tmp4545 = icmp ne %m307$.Node.type* %.tmp4544, null
br i1 %.tmp4545, label %.for.continue.4541, label %.for.end.4541
.for.continue.4541:
%.tmp4546 = load %m307$.Node.type*, %m307$.Node.type** %pp.4543
%.tmp4547 = load %m307$.Node.type*, %m307$.Node.type** %start.4540
%.tmp4548 = icmp ne %m307$.Node.type* %.tmp4546, %.tmp4547
br i1 %.tmp4548, label %.if.true.4549, label %.if.false.4549
.if.true.4549:
%.tmp4550 = getelementptr i8*, i8** %tmp.4530, i32 0
%.tmp4552 = getelementptr [5 x i8], [5 x i8]*@.str4551, i32 0, i32 0
%.tmp4553 = load i8*, i8** %params_buff.4529
%.tmp4554 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4550, i8* %.tmp4552, i8* %.tmp4553)
%.tmp4555 = load i8*, i8** %params_buff.4529
%tmp_buff.4556 = alloca i8*
store i8* %.tmp4555, i8** %tmp_buff.4556
%.tmp4557 = load i8*, i8** %tmp.4530
store i8* %.tmp4557, i8** %params_buff.4529
%.tmp4558 = load i8*, i8** %tmp_buff.4556
store i8* %.tmp4558, i8** %tmp.4530
%.tmp4559 = load i8*, i8** %tmp.4530
call void(i8*) @free(i8* %.tmp4559)
br label %.if.end.4549
.if.false.4549:
br label %.if.end.4549
.if.end.4549:
%.tmp4560 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4561 = load %m307$.Node.type*, %m307$.Node.type** %pp.4543
%.tmp4562 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4560, %m307$.Node.type* %.tmp4561)
%a_info.4563 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4562, %m1861$.AssignableInfo.type** %a_info.4563
%.tmp4564 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4563
%.tmp4565 = icmp eq %m1861$.AssignableInfo.type* %.tmp4564, null
br i1 %.tmp4565, label %.if.true.4566, label %.if.false.4566
.if.true.4566:
%.tmp4567 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4567
br label %.if.end.4566
.if.false.4566:
br label %.if.end.4566
.if.end.4566:
%.tmp4568 = getelementptr i8*, i8** %params_buff.4529, i32 0
%.tmp4570 = getelementptr [8 x i8], [8 x i8]*@.str4569, i32 0, i32 0
%.tmp4571 = load i8*, i8** %params_buff.4529
%.tmp4572 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4573 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4563
%.tmp4574 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4573, i32 0, i32 3
%.tmp4575 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4574
%.tmp4576 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4572, %m1861$.Type.type* %.tmp4575)
%.tmp4577 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4563
%.tmp4578 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4577)
%.tmp4579 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4568, i8* %.tmp4570, i8* %.tmp4571, i8* %.tmp4576, i8* %.tmp4578)
%.tmp4580 = load %m307$.Node.type*, %m307$.Node.type** %pp.4543
%.tmp4581 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4580, i32 0, i32 7
%.tmp4582 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4581
store %m307$.Node.type* %.tmp4582, %m307$.Node.type** %pp.4543
%.tmp4583 = load %m307$.Node.type*, %m307$.Node.type** %pp.4543
%.tmp4585 = getelementptr [11 x i8], [11 x i8]*@.str4584, i32 0, i32 0
%.tmp4586 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4583, i8* %.tmp4585)
store %m307$.Node.type* %.tmp4586, %m307$.Node.type** %pp.4543
br label %.for.start.4541
.for.end.4541:
br label %.if.end.4533
.if.false.4533:
br label %.if.end.4533
.if.end.4533:
%.tmp4587 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4588 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4589 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4588, i32 0, i32 3
%.tmp4590 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4589
%.tmp4591 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4590, i32 0, i32 3
%.tmp4592 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4591
%.tmp4593 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4587, %m1861$.Type.type* %.tmp4592)
%.tmp4595 = getelementptr [5 x i8], [5 x i8]*@.str4594, i32 0, i32 0
%.tmp4596 = call i32(i8*,i8*) @strcmp(i8* %.tmp4593, i8* %.tmp4595)
%.tmp4597 = icmp eq i32 %.tmp4596, 0
br i1 %.tmp4597, label %.if.true.4598, label %.if.false.4598
.if.true.4598:
%.tmp4599 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4600 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4599, i32 0, i32 1
%.tmp4601 = load %m0$.File.type*, %m0$.File.type** %.tmp4600
%.tmp4603 = getelementptr [16 x i8], [16 x i8]*@.str4602, i32 0, i32 0
%.tmp4604 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4605 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4606 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4605, i32 0, i32 3
%.tmp4607 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4606
%.tmp4608 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4604, %m1861$.Type.type* %.tmp4607)
%.tmp4609 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4610 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4609)
%.tmp4611 = load i8*, i8** %params_buff.4529
%.tmp4612 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4601, i8* %.tmp4603, i8* %.tmp4608, i8* %.tmp4610, i8* %.tmp4611)
%.tmp4613 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4613
br label %.if.end.4598
.if.false.4598:
br label %.if.end.4598
.if.end.4598:
%.tmp4614 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4615 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4614)
%call_info.4616 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4615, %m1861$.AssignableInfo.type** %call_info.4616
%.tmp4617 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4618 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4616
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4617, %m1861$.AssignableInfo.type* %.tmp4618)
%.tmp4619 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4616
%.tmp4620 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4619, i32 0, i32 3
%.tmp4621 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4622 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4621, i32 0, i32 3
%.tmp4623 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4622
%.tmp4624 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4623, i32 0, i32 3
%.tmp4625 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4624
%.tmp4626 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4625)
store %m1861$.Type.type* %.tmp4626, %m1861$.Type.type** %.tmp4620
%.tmp4627 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4616
%.tmp4628 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4627, i32 0, i32 3
%.tmp4629 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4628
%.tmp4630 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4629, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4630
%.tmp4631 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4632 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4631, i32 0, i32 1
%.tmp4633 = load %m0$.File.type*, %m0$.File.type** %.tmp4632
%.tmp4635 = getelementptr [21 x i8], [21 x i8]*@.str4634, i32 0, i32 0
%.tmp4636 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4616
%.tmp4637 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4636)
%.tmp4638 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4639 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4640 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4639, i32 0, i32 3
%.tmp4641 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4640
%.tmp4642 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4638, %m1861$.Type.type* %.tmp4641)
%.tmp4643 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4502
%.tmp4644 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4643)
%.tmp4645 = load i8*, i8** %params_buff.4529
%.tmp4646 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4633, i8* %.tmp4635, i8* %.tmp4637, i8* %.tmp4642, i8* %.tmp4644, i8* %.tmp4645)
%.tmp4647 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4616
%.tmp4648 = bitcast %m1861$.AssignableInfo.type* %.tmp4647 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4648
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4649 = alloca i8*
store i8* null, i8** %err_msg.4649
%.tmp4650 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4651 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4650, i32 0, i32 0
%.tmp4652 = load i8*, i8** %.tmp4651
%expr_type.4653 = alloca i8*
store i8* %.tmp4652, i8** %expr_type.4653
%.tmp4654 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4655 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4654, %m1861$.AssignableInfo.type** %info.4655
%assignable.4656 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4656
%.tmp4657 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4658 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4657, %m1861$.AssignableInfo.type** %a_info.4658
%.tmp4659 = load i8*, i8** %expr_type.4653
%.tmp4661 = getelementptr [7 x i8], [7 x i8]*@.str4660, i32 0, i32 0
%.tmp4662 = call i32(i8*,i8*) @strcmp(i8* %.tmp4659, i8* %.tmp4661)
%.tmp4663 = icmp eq i32 %.tmp4662, 0
br i1 %.tmp4663, label %.if.true.4664, label %.if.false.4664
.if.true.4664:
%.tmp4665 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4666 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4665, i32 0, i32 6
%.tmp4667 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4666
%.tmp4668 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4667, i32 0, i32 7
%.tmp4669 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4668
%.tmp4670 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4669, i32 0, i32 0
%.tmp4671 = load i8*, i8** %.tmp4670
%.tmp4673 = getelementptr [3 x i8], [3 x i8]*@.str4672, i32 0, i32 0
%.tmp4674 = call i32(i8*,i8*) @strcmp(i8* %.tmp4671, i8* %.tmp4673)
%.tmp4675 = icmp ne i32 %.tmp4674, 0
br i1 %.tmp4675, label %.if.true.4676, label %.if.false.4676
.if.true.4676:
%.tmp4677 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4678 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4679 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4678, i32 0, i32 6
%.tmp4680 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4679
%.tmp4681 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4680, i32 0, i32 7
%.tmp4682 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4681
%.tmp4683 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4677, %m307$.Node.type* %.tmp4682)
store %m1861$.AssignableInfo.type* %.tmp4683, %m1861$.AssignableInfo.type** %info.4655
%.tmp4684 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4655
%.tmp4685 = icmp eq %m1861$.AssignableInfo.type* %.tmp4684, null
br i1 %.tmp4685, label %.if.true.4686, label %.if.false.4686
.if.true.4686:
ret void
br label %.if.end.4686
.if.false.4686:
br label %.if.end.4686
.if.end.4686:
%.tmp4687 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4688 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4687, i32 0, i32 1
%.tmp4689 = load %m0$.File.type*, %m0$.File.type** %.tmp4688
%.tmp4691 = getelementptr [11 x i8], [11 x i8]*@.str4690, i32 0, i32 0
%.tmp4692 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4693 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4655
%.tmp4694 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4693, i32 0, i32 3
%.tmp4695 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4694
%.tmp4696 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4692, %m1861$.Type.type* %.tmp4695)
%.tmp4697 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4655
%.tmp4698 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4697)
%.tmp4699 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4689, i8* %.tmp4691, i8* %.tmp4696, i8* %.tmp4698)
br label %.if.end.4676
.if.false.4676:
%.tmp4700 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4701 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4700, i32 0, i32 1
%.tmp4702 = load %m0$.File.type*, %m0$.File.type** %.tmp4701
%.tmp4704 = getelementptr [10 x i8], [10 x i8]*@.str4703, i32 0, i32 0
%.tmp4705 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4702, i8* %.tmp4704)
br label %.if.end.4676
.if.end.4676:
br label %.if.end.4664
.if.false.4664:
%.tmp4706 = load i8*, i8** %expr_type.4653
%.tmp4708 = getelementptr [3 x i8], [3 x i8]*@.str4707, i32 0, i32 0
%.tmp4709 = call i32(i8*,i8*) @strcmp(i8* %.tmp4706, i8* %.tmp4708)
%.tmp4710 = icmp eq i32 %.tmp4709, 0
br i1 %.tmp4710, label %.if.true.4711, label %.if.false.4711
.if.true.4711:
br label %.if.end.4711
.if.false.4711:
%.tmp4712 = load i8*, i8** %expr_type.4653
%.tmp4714 = getelementptr [8 x i8], [8 x i8]*@.str4713, i32 0, i32 0
%.tmp4715 = call i32(i8*,i8*) @strcmp(i8* %.tmp4712, i8* %.tmp4714)
%.tmp4716 = icmp eq i32 %.tmp4715, 0
br i1 %.tmp4716, label %.if.true.4717, label %.if.false.4717
.if.true.4717:
%.tmp4718 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4719 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4720 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4719, i32 0, i32 6
%.tmp4721 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4720
%.tmp4722 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4718, %m307$.Node.type* %.tmp4721)
br label %.if.end.4717
.if.false.4717:
%.tmp4723 = load i8*, i8** %expr_type.4653
%.tmp4725 = getelementptr [12 x i8], [12 x i8]*@.str4724, i32 0, i32 0
%.tmp4726 = call i32(i8*,i8*) @strcmp(i8* %.tmp4723, i8* %.tmp4725)
%.tmp4727 = icmp eq i32 %.tmp4726, 0
br i1 %.tmp4727, label %.if.true.4728, label %.if.false.4728
.if.true.4728:
%.tmp4729 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4730 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4731 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4729, %m307$.Node.type* %.tmp4730)
br label %.if.end.4728
.if.false.4728:
%.tmp4732 = load i8*, i8** %expr_type.4653
%.tmp4734 = getelementptr [11 x i8], [11 x i8]*@.str4733, i32 0, i32 0
%.tmp4735 = call i32(i8*,i8*) @strcmp(i8* %.tmp4732, i8* %.tmp4734)
%.tmp4736 = icmp eq i32 %.tmp4735, 0
br i1 %.tmp4736, label %.if.true.4737, label %.if.false.4737
.if.true.4737:
%.tmp4738 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4739 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4738, i32 0, i32 6
%.tmp4740 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4739
%.tmp4742 = getelementptr [11 x i8], [11 x i8]*@.str4741, i32 0, i32 0
%.tmp4743 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4740, i8* %.tmp4742)
store %m307$.Node.type* %.tmp4743, %m307$.Node.type** %assignable.4656
%.tmp4744 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4745 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4746 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4745, i32 0, i32 6
%.tmp4747 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4746
%.tmp4748 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4744, %m307$.Node.type* %.tmp4747)
%dest.4749 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4748, %m1861$.AssignableInfo.type** %dest.4749
%.tmp4750 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4749
%.tmp4751 = icmp eq %m1861$.AssignableInfo.type* %.tmp4750, null
br i1 %.tmp4751, label %.if.true.4752, label %.if.false.4752
.if.true.4752:
ret void
br label %.if.end.4752
.if.false.4752:
br label %.if.end.4752
.if.end.4752:
%.tmp4753 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4754 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4656
%.tmp4755 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4753, %m307$.Node.type* %.tmp4754)
store %m1861$.AssignableInfo.type* %.tmp4755, %m1861$.AssignableInfo.type** %a_info.4658
%.tmp4756 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4658
%.tmp4757 = icmp eq %m1861$.AssignableInfo.type* %.tmp4756, null
br i1 %.tmp4757, label %.if.true.4758, label %.if.false.4758
.if.true.4758:
ret void
br label %.if.end.4758
.if.false.4758:
br label %.if.end.4758
.if.end.4758:
%.tmp4759 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4760 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4749
%.tmp4761 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4760, i32 0, i32 3
%.tmp4762 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4761
%.tmp4763 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4759, %m1861$.Type.type* %.tmp4762)
%dest_tr.4764 = alloca i8*
store i8* %.tmp4763, i8** %dest_tr.4764
%.tmp4765 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4766 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4658
%.tmp4767 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4766, i32 0, i32 3
%.tmp4768 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4767
%.tmp4769 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4765, %m1861$.Type.type* %.tmp4768)
%src_tr.4770 = alloca i8*
store i8* %.tmp4769, i8** %src_tr.4770
%.tmp4771 = load i8*, i8** %src_tr.4770
%.tmp4773 = getelementptr [4 x i8], [4 x i8]*@.str4772, i32 0, i32 0
%.tmp4774 = call i32(i8*,i8*) @strcmp(i8* %.tmp4771, i8* %.tmp4773)
%.tmp4775 = icmp eq i32 %.tmp4774, 0
br i1 %.tmp4775, label %.if.true.4776, label %.if.false.4776
.if.true.4776:
%.tmp4777 = load i8*, i8** %dest_tr.4764
store i8* %.tmp4777, i8** %src_tr.4770
br label %.if.end.4776
.if.false.4776:
br label %.if.end.4776
.if.end.4776:
%.tmp4778 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4779 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4778, i32 0, i32 1
%.tmp4780 = load %m0$.File.type*, %m0$.File.type** %.tmp4779
%.tmp4782 = getelementptr [21 x i8], [21 x i8]*@.str4781, i32 0, i32 0
%.tmp4783 = load i8*, i8** %src_tr.4770
%.tmp4784 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4658
%.tmp4785 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4784)
%.tmp4786 = load i8*, i8** %dest_tr.4764
%.tmp4787 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4749
%.tmp4788 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4787)
%.tmp4789 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4780, i8* %.tmp4782, i8* %.tmp4783, i8* %.tmp4785, i8* %.tmp4786, i8* %.tmp4788)
br label %.if.end.4737
.if.false.4737:
%.tmp4790 = load i8*, i8** %expr_type.4653
%.tmp4792 = getelementptr [9 x i8], [9 x i8]*@.str4791, i32 0, i32 0
%.tmp4793 = call i32(i8*,i8*) @strcmp(i8* %.tmp4790, i8* %.tmp4792)
%.tmp4794 = icmp eq i32 %.tmp4793, 0
br i1 %.tmp4794, label %.if.true.4795, label %.if.false.4795
.if.true.4795:
%.tmp4796 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4797 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4796, %m307$.Node.type* %.tmp4797)
br label %.if.end.4795
.if.false.4795:
%.tmp4798 = load i8*, i8** %expr_type.4653
%.tmp4800 = getelementptr [9 x i8], [9 x i8]*@.str4799, i32 0, i32 0
%.tmp4801 = call i32(i8*,i8*) @strcmp(i8* %.tmp4798, i8* %.tmp4800)
%.tmp4802 = icmp eq i32 %.tmp4801, 0
br i1 %.tmp4802, label %.if.true.4803, label %.if.false.4803
.if.true.4803:
%.tmp4804 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4805 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4804, %m307$.Node.type* %.tmp4805)
br label %.if.end.4803
.if.false.4803:
%.tmp4806 = load i8*, i8** %expr_type.4653
%.tmp4808 = getelementptr [8 x i8], [8 x i8]*@.str4807, i32 0, i32 0
%.tmp4809 = call i32(i8*,i8*) @strcmp(i8* %.tmp4806, i8* %.tmp4808)
%.tmp4810 = icmp eq i32 %.tmp4809, 0
br i1 %.tmp4810, label %.if.true.4811, label %.if.false.4811
.if.true.4811:
%.tmp4812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4813 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4812)
%mod.4814 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4813, %m1861$.ModuleLookup.type** %mod.4814
%.tmp4815 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4814
%.tmp4816 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4815, i32 0, i32 3
%.tmp4817 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4816
%s.4818 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4817, %m1861$.Scope.type** %s.4818
%.tmp4819 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4820 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4819, i32 0, i32 6
%.tmp4821 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4820
%.tmp4822 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4821, i32 0, i32 1
%.tmp4823 = load i8*, i8** %.tmp4822
%.tmp4825 = getelementptr [6 x i8], [6 x i8]*@.str4824, i32 0, i32 0
%.tmp4826 = call i32(i8*,i8*) @strcmp(i8* %.tmp4823, i8* %.tmp4825)
%.tmp4827 = icmp eq i32 %.tmp4826, 0
br i1 %.tmp4827, label %.if.true.4828, label %.if.false.4828
.if.true.4828:
br label %.for.start.4829
.for.start.4829:
%.tmp4830 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4831 = icmp ne %m1861$.Scope.type* %.tmp4830, null
br i1 %.tmp4831, label %.for.continue.4829, label %.for.else.4829
.for.continue.4829:
%.tmp4832 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4833 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4832, i32 0, i32 2
%.tmp4834 = load i8*, i8** %.tmp4833
%.tmp4836 = getelementptr [4 x i8], [4 x i8]*@.str4835, i32 0, i32 0
%.tmp4837 = call i32(i8*,i8*) @strcmp(i8* %.tmp4834, i8* %.tmp4836)
%.tmp4838 = icmp eq i32 %.tmp4837, 0
br i1 %.tmp4838, label %.if.true.4839, label %.if.false.4839
.if.true.4839:
%.tmp4840 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4841 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4840, i32 0, i32 1
%.tmp4842 = load %m0$.File.type*, %m0$.File.type** %.tmp4841
%.tmp4844 = getelementptr [15 x i8], [15 x i8]*@.str4843, i32 0, i32 0
%.tmp4845 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4846 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4845, i32 0, i32 4
%.tmp4847 = load i8*, i8** %.tmp4846
%.tmp4848 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4842, i8* %.tmp4844, i8* %.tmp4847)
br label %.for.end.4829
br label %.if.end.4839
.if.false.4839:
br label %.if.end.4839
.if.end.4839:
%.tmp4849 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4850 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4849, i32 0, i32 5
%.tmp4851 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4850
store %m1861$.Scope.type* %.tmp4851, %m1861$.Scope.type** %s.4818
br label %.for.start.4829
.for.else.4829:
%.tmp4852 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4853 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4855 = getelementptr [48 x i8], [48 x i8]*@.str4854, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4852, %m307$.Node.type* %.tmp4853, i8* %.tmp4855)
br label %.for.end.4829
.for.end.4829:
br label %.if.end.4828
.if.false.4828:
%.tmp4856 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4857 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4856, i32 0, i32 6
%.tmp4858 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4857
%.tmp4859 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4858, i32 0, i32 1
%.tmp4860 = load i8*, i8** %.tmp4859
%.tmp4862 = getelementptr [9 x i8], [9 x i8]*@.str4861, i32 0, i32 0
%.tmp4863 = call i32(i8*,i8*) @strcmp(i8* %.tmp4860, i8* %.tmp4862)
%.tmp4864 = icmp eq i32 %.tmp4863, 0
br i1 %.tmp4864, label %.if.true.4865, label %.if.false.4865
.if.true.4865:
br label %.for.start.4866
.for.start.4866:
%.tmp4867 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4868 = icmp ne %m1861$.Scope.type* %.tmp4867, null
br i1 %.tmp4868, label %.for.continue.4866, label %.for.else.4866
.for.continue.4866:
%.tmp4869 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4870 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4869, i32 0, i32 2
%.tmp4871 = load i8*, i8** %.tmp4870
%.tmp4873 = getelementptr [4 x i8], [4 x i8]*@.str4872, i32 0, i32 0
%.tmp4874 = call i32(i8*,i8*) @strcmp(i8* %.tmp4871, i8* %.tmp4873)
%.tmp4875 = icmp eq i32 %.tmp4874, 0
br i1 %.tmp4875, label %.if.true.4876, label %.if.false.4876
.if.true.4876:
%.tmp4877 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4878 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4877, i32 0, i32 1
%.tmp4879 = load %m0$.File.type*, %m0$.File.type** %.tmp4878
%.tmp4881 = getelementptr [15 x i8], [15 x i8]*@.str4880, i32 0, i32 0
%.tmp4882 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4883 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4882, i32 0, i32 3
%.tmp4884 = load i8*, i8** %.tmp4883
%.tmp4885 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4879, i8* %.tmp4881, i8* %.tmp4884)
br label %.for.end.4866
br label %.if.end.4876
.if.false.4876:
br label %.if.end.4876
.if.end.4876:
%.tmp4886 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4818
%.tmp4887 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4886, i32 0, i32 5
%.tmp4888 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4887
store %m1861$.Scope.type* %.tmp4888, %m1861$.Scope.type** %s.4818
br label %.for.start.4866
.for.else.4866:
%.tmp4889 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4890 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4892 = getelementptr [51 x i8], [51 x i8]*@.str4891, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4889, %m307$.Node.type* %.tmp4890, i8* %.tmp4892)
br label %.for.end.4866
.for.end.4866:
br label %.if.end.4865
.if.false.4865:
%.tmp4893 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4894 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4896 = getelementptr [40 x i8], [40 x i8]*@.str4895, i32 0, i32 0
%.tmp4897 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4893, %m307$.Node.type* %.tmp4894, i8* %.tmp4896)
%.tmp4898 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4899 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4898, i32 0, i32 6
%.tmp4900 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4899
%.tmp4901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4900, i32 0, i32 1
%.tmp4902 = load i8*, i8** %.tmp4901
%.tmp4903 = call i32(i8*,...) @printf(i8* %.tmp4897, i8* %.tmp4902)
br label %.if.end.4865
.if.end.4865:
br label %.if.end.4828
.if.end.4828:
br label %.if.end.4811
.if.false.4811:
%.tmp4904 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4905 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4907 = getelementptr [34 x i8], [34 x i8]*@.str4906, i32 0, i32 0
%.tmp4908 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4904, %m307$.Node.type* %.tmp4905, i8* %.tmp4907)
%.tmp4909 = load i8*, i8** %expr_type.4653
%.tmp4910 = call i32(i8*,...) @printf(i8* %.tmp4908, i8* %.tmp4909)
br label %.if.end.4811
.if.end.4811:
br label %.if.end.4803
.if.end.4803:
br label %.if.end.4795
.if.end.4795:
br label %.if.end.4737
.if.end.4737:
br label %.if.end.4728
.if.end.4728:
br label %.if.end.4717
.if.end.4717:
br label %.if.end.4711
.if.end.4711:
br label %.if.end.4664
.if.end.4664:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4911 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4912 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4911)
%for_id.4913 = alloca i32
store i32 %.tmp4912, i32* %for_id.4913
%.tmp4914 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4915 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4914, i32 0, i32 6
%.tmp4916 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4915
%.tmp4917 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4916, i32 0, i32 7
%.tmp4918 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4917
%init_stmt.4919 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4918, %m307$.Node.type** %init_stmt.4919
%.tmp4920 = bitcast ptr null to i8*
%begin_lbl.4921 = alloca i8*
store i8* %.tmp4920, i8** %begin_lbl.4921
%.tmp4922 = bitcast ptr null to i8*
%end_lbl.4923 = alloca i8*
store i8* %.tmp4922, i8** %end_lbl.4923
%.tmp4924 = getelementptr i8*, i8** %begin_lbl.4921, i32 0
%.tmp4926 = getelementptr [14 x i8], [14 x i8]*@.str4925, i32 0, i32 0
%.tmp4927 = load i32, i32* %for_id.4913
%.tmp4928 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4924, i8* %.tmp4926, i32 %.tmp4927)
%.tmp4929 = getelementptr i8*, i8** %end_lbl.4923, i32 0
%.tmp4931 = getelementptr [12 x i8], [12 x i8]*@.str4930, i32 0, i32 0
%.tmp4932 = load i32, i32* %for_id.4913
%.tmp4933 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4929, i8* %.tmp4931, i32 %.tmp4932)
%.tmp4934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4936 = getelementptr [4 x i8], [4 x i8]*@.str4935, i32 0, i32 0
%.tmp4937 = load i8*, i8** %begin_lbl.4921
%.tmp4938 = load i8*, i8** %end_lbl.4923
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp4934, i8* %.tmp4936, i8* %.tmp4937, i8* %.tmp4938)
%.tmp4939 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
%.tmp4940 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4939, i32 0, i32 0
%.tmp4941 = load i8*, i8** %.tmp4940
%.tmp4943 = getelementptr [12 x i8], [12 x i8]*@.str4942, i32 0, i32 0
%.tmp4944 = call i32(i8*,i8*) @strcmp(i8* %.tmp4941, i8* %.tmp4943)
%.tmp4945 = icmp eq i32 %.tmp4944, 0
br i1 %.tmp4945, label %.if.true.4946, label %.if.false.4946
.if.true.4946:
%.tmp4947 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4948 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
%.tmp4949 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4947, %m307$.Node.type* %.tmp4948)
br label %.if.end.4946
.if.false.4946:
%.tmp4950 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
%.tmp4951 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4950, i32 0, i32 0
%.tmp4952 = load i8*, i8** %.tmp4951
%.tmp4954 = getelementptr [11 x i8], [11 x i8]*@.str4953, i32 0, i32 0
%.tmp4955 = call i32(i8*,i8*) @strcmp(i8* %.tmp4952, i8* %.tmp4954)
%.tmp4956 = icmp eq i32 %.tmp4955, 0
br i1 %.tmp4956, label %.if.true.4957, label %.if.false.4957
.if.true.4957:
%.tmp4958 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4959 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4958, %m307$.Node.type* %.tmp4959)
br label %.if.end.4957
.if.false.4957:
%.tmp4960 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
%.tmp4961 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4960, i32 0, i32 0
%.tmp4962 = load i8*, i8** %.tmp4961
%.tmp4964 = getelementptr [9 x i8], [9 x i8]*@.str4963, i32 0, i32 0
%.tmp4965 = call i32(i8*,i8*) @strcmp(i8* %.tmp4962, i8* %.tmp4964)
%.tmp4966 = icmp eq i32 %.tmp4965, 0
br i1 %.tmp4966, label %.if.true.4967, label %.if.false.4967
.if.true.4967:
br label %.if.end.4967
.if.false.4967:
%.tmp4968 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4969 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
%.tmp4971 = getelementptr [66 x i8], [66 x i8]*@.str4970, i32 0, i32 0
%.tmp4972 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4968, %m307$.Node.type* %.tmp4969, i8* %.tmp4971)
%.tmp4973 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.4919
%.tmp4974 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4973, i32 0, i32 0
%.tmp4975 = load i8*, i8** %.tmp4974
%.tmp4976 = call i32(i8*,...) @printf(i8* %.tmp4972, i8* %.tmp4975)
%.tmp4977 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4977)
ret void
br label %.if.end.4967
.if.end.4967:
br label %.if.end.4957
.if.end.4957:
br label %.if.end.4946
.if.end.4946:
%.tmp4978 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4979 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4978, i32 0, i32 1
%.tmp4980 = load %m0$.File.type*, %m0$.File.type** %.tmp4979
%.tmp4982 = getelementptr [26 x i8], [26 x i8]*@.str4981, i32 0, i32 0
%.tmp4983 = load i32, i32* %for_id.4913
%.tmp4984 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4980, i8* %.tmp4982, i32 %.tmp4983)
%.tmp4985 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4986 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4985, i32 0, i32 1
%.tmp4987 = load %m0$.File.type*, %m0$.File.type** %.tmp4986
%.tmp4989 = getelementptr [16 x i8], [16 x i8]*@.str4988, i32 0, i32 0
%.tmp4990 = load i32, i32* %for_id.4913
%.tmp4991 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4987, i8* %.tmp4989, i32 %.tmp4990)
%.tmp4992 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4993 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4992, i32 0, i32 6
%.tmp4994 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4993
%.tmp4996 = getelementptr [9 x i8], [9 x i8]*@.str4995, i32 0, i32 0
%.tmp4997 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4994, i8* %.tmp4996)
%fst_colon.4998 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4997, %m307$.Node.type** %fst_colon.4998
%.tmp4999 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4998
%.tmp5000 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4999, i32 0, i32 7
%.tmp5001 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5000
%condition.5002 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5001, %m307$.Node.type** %condition.5002
%.tmp5003 = load %m307$.Node.type*, %m307$.Node.type** %condition.5002
%.tmp5004 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5003, i32 0, i32 0
%.tmp5005 = load i8*, i8** %.tmp5004
%.tmp5007 = getelementptr [9 x i8], [9 x i8]*@.str5006, i32 0, i32 0
%.tmp5008 = call i32(i8*,i8*) @strcmp(i8* %.tmp5005, i8* %.tmp5007)
%.tmp5009 = icmp eq i32 %.tmp5008, 0
br i1 %.tmp5009, label %.if.true.5010, label %.if.false.5010
.if.true.5010:
%.tmp5011 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5012 = load %m307$.Node.type*, %m307$.Node.type** %condition.5002
%.tmp5014 = getelementptr [39 x i8], [39 x i8]*@.str5013, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5011, %m307$.Node.type* %.tmp5012, i8* %.tmp5014)
ret void
br label %.if.end.5010
.if.false.5010:
br label %.if.end.5010
.if.end.5010:
%.tmp5015 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5016 = load %m307$.Node.type*, %m307$.Node.type** %condition.5002
%.tmp5017 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5015, %m307$.Node.type* %.tmp5016)
%condition_info.5018 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5017, %m1861$.AssignableInfo.type** %condition_info.5018
%.tmp5019 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.4998
%.tmp5020 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5019, i32 0, i32 7
%.tmp5021 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5020
%.tmp5023 = getelementptr [9 x i8], [9 x i8]*@.str5022, i32 0, i32 0
%.tmp5024 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5021, i8* %.tmp5023)
%snd_colon.5025 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5024, %m307$.Node.type** %snd_colon.5025
%.tmp5026 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5025
%.tmp5028 = getelementptr [6 x i8], [6 x i8]*@.str5027, i32 0, i32 0
%.tmp5029 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5026, i8* %.tmp5028)
%for_body.5030 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5029, %m307$.Node.type** %for_body.5030
%.tmp5031 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5030
%.tmp5033 = getelementptr [11 x i8], [11 x i8]*@.str5032, i32 0, i32 0
%.tmp5034 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5031, i8* %.tmp5033)
%else_block.5035 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5034, %m307$.Node.type** %else_block.5035
%.tmp5036 = load i8*, i8** %end_lbl.4923
%on_end.5037 = alloca i8*
store i8* %.tmp5036, i8** %on_end.5037
%.tmp5038 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5035
%.tmp5039 = icmp ne %m307$.Node.type* %.tmp5038, null
br i1 %.tmp5039, label %.if.true.5040, label %.if.false.5040
.if.true.5040:
%.tmp5041 = getelementptr i8*, i8** %on_end.5037, i32 0
%.tmp5043 = getelementptr [13 x i8], [13 x i8]*@.str5042, i32 0, i32 0
%.tmp5044 = load i32, i32* %for_id.4913
%.tmp5045 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5041, i8* %.tmp5043, i32 %.tmp5044)
br label %.if.end.5040
.if.false.5040:
br label %.if.end.5040
.if.end.5040:
%.tmp5046 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5047 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5046, i32 0, i32 1
%.tmp5048 = load %m0$.File.type*, %m0$.File.type** %.tmp5047
%.tmp5050 = getelementptr [48 x i8], [48 x i8]*@.str5049, i32 0, i32 0
%.tmp5051 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5052 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5018
%.tmp5053 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5052, i32 0, i32 3
%.tmp5054 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5053
%.tmp5055 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5051, %m1861$.Type.type* %.tmp5054)
%.tmp5056 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5018
%.tmp5057 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5056)
%.tmp5058 = load i32, i32* %for_id.4913
%.tmp5059 = load i8*, i8** %on_end.5037
%.tmp5060 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5048, i8* %.tmp5050, i8* %.tmp5055, i8* %.tmp5057, i32 %.tmp5058, i8* %.tmp5059)
%.tmp5061 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5062 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5061, i32 0, i32 1
%.tmp5063 = load %m0$.File.type*, %m0$.File.type** %.tmp5062
%.tmp5065 = getelementptr [19 x i8], [19 x i8]*@.str5064, i32 0, i32 0
%.tmp5066 = load i32, i32* %for_id.4913
%.tmp5067 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5063, i8* %.tmp5065, i32 %.tmp5066)
%.tmp5068 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5025
%.tmp5069 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5068, i32 0, i32 7
%.tmp5070 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5069
%increment.5071 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5070, %m307$.Node.type** %increment.5071
%.tmp5072 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5073 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5030
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5072, %m307$.Node.type* %.tmp5073)
%.tmp5074 = load %m307$.Node.type*, %m307$.Node.type** %increment.5071
%.tmp5075 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5030
%.tmp5076 = icmp ne %m307$.Node.type* %.tmp5074, %.tmp5075
br i1 %.tmp5076, label %.if.true.5077, label %.if.false.5077
.if.true.5077:
%.tmp5078 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5079 = load %m307$.Node.type*, %m307$.Node.type** %increment.5071
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5078, %m307$.Node.type* %.tmp5079)
br label %.if.end.5077
.if.false.5077:
br label %.if.end.5077
.if.end.5077:
%.tmp5080 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5081 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5080, i32 0, i32 1
%.tmp5082 = load %m0$.File.type*, %m0$.File.type** %.tmp5081
%.tmp5084 = getelementptr [15 x i8], [15 x i8]*@.str5083, i32 0, i32 0
%.tmp5085 = load i8*, i8** %begin_lbl.4921
%.tmp5086 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5082, i8* %.tmp5084, i8* %.tmp5085)
%.tmp5087 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5035
%.tmp5088 = icmp ne %m307$.Node.type* %.tmp5087, null
br i1 %.tmp5088, label %.if.true.5089, label %.if.false.5089
.if.true.5089:
%.tmp5090 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5091 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5090, i32 0, i32 1
%.tmp5092 = load %m0$.File.type*, %m0$.File.type** %.tmp5091
%.tmp5094 = getelementptr [15 x i8], [15 x i8]*@.str5093, i32 0, i32 0
%.tmp5095 = load i32, i32* %for_id.4913
%.tmp5096 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5092, i8* %.tmp5094, i32 %.tmp5095)
%.tmp5097 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5035
%.tmp5098 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5097, i32 0, i32 6
%.tmp5099 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5098
%.tmp5101 = getelementptr [6 x i8], [6 x i8]*@.str5100, i32 0, i32 0
%.tmp5102 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5099, i8* %.tmp5101)
%block.5103 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5102, %m307$.Node.type** %block.5103
%.tmp5104 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5105 = load %m307$.Node.type*, %m307$.Node.type** %block.5103
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5104, %m307$.Node.type* %.tmp5105)
%.tmp5106 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5107 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5106, i32 0, i32 1
%.tmp5108 = load %m0$.File.type*, %m0$.File.type** %.tmp5107
%.tmp5110 = getelementptr [15 x i8], [15 x i8]*@.str5109, i32 0, i32 0
%.tmp5111 = load i8*, i8** %end_lbl.4923
%.tmp5112 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5108, i8* %.tmp5110, i8* %.tmp5111)
br label %.if.end.5089
.if.false.5089:
br label %.if.end.5089
.if.end.5089:
%.tmp5113 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5114 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5113, i32 0, i32 1
%.tmp5115 = load %m0$.File.type*, %m0$.File.type** %.tmp5114
%.tmp5117 = getelementptr [5 x i8], [5 x i8]*@.str5116, i32 0, i32 0
%.tmp5118 = load i8*, i8** %end_lbl.4923
%.tmp5119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5115, i8* %.tmp5117, i8* %.tmp5118)
%.tmp5120 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5120)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5121 = bitcast ptr null to %m1861$.Type.type*
%decl_type.5122 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5121, %m1861$.Type.type** %decl_type.5122
%.tmp5123 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.5124 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5123, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5125 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5126 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5125, i32 0, i32 6
%.tmp5127 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5126
%.tmp5128 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5127, i32 0, i32 0
%.tmp5129 = load i8*, i8** %.tmp5128
%.tmp5131 = getelementptr [5 x i8], [5 x i8]*@.str5130, i32 0, i32 0
%.tmp5132 = call i32(i8*,i8*) @strcmp(i8* %.tmp5129, i8* %.tmp5131)
%.tmp5133 = icmp eq i32 %.tmp5132, 0
br i1 %.tmp5133, label %.if.true.5134, label %.if.false.5134
.if.true.5134:
%.tmp5135 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5136 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5137 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5136, i32 0, i32 6
%.tmp5138 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5137
%.tmp5139 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5138, i32 0, i32 6
%.tmp5140 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5139
%.tmp5141 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5135, %m307$.Node.type* %.tmp5140)
store %m1861$.Type.type* %.tmp5141, %m1861$.Type.type** %decl_type.5122
br label %.if.end.5134
.if.false.5134:
br label %.if.end.5134
.if.end.5134:
%.tmp5142 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5143 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5142, i32 0, i32 6
%.tmp5144 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5143
%.tmp5146 = getelementptr [11 x i8], [11 x i8]*@.str5145, i32 0, i32 0
%.tmp5147 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5144, i8* %.tmp5146)
%assignable.5148 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5147, %m307$.Node.type** %assignable.5148
%.tmp5149 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5148
%.tmp5150 = icmp ne %m307$.Node.type* %.tmp5149, null
br i1 %.tmp5150, label %.if.true.5151, label %.if.false.5151
.if.true.5151:
%.tmp5152 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5153 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5148
%.tmp5154 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5152, %m307$.Node.type* %.tmp5153)
store %m1861$.AssignableInfo.type* %.tmp5154, %m1861$.AssignableInfo.type** %a_info.5124
br label %.if.end.5151
.if.false.5151:
br label %.if.end.5151
.if.end.5151:
%.tmp5155 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5156 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5155)
%info.5157 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5156, %m1861$.AssignableInfo.type** %info.5157
%.tmp5158 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5159 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5158, i32 0, i32 2
%.tmp5161 = getelementptr [9 x i8], [9 x i8]*@.str5160, i32 0, i32 0
store i8* %.tmp5161, i8** %.tmp5159
%.tmp5162 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5163 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5162, i32 0, i32 6
%.tmp5164 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5163
%.tmp5166 = getelementptr [5 x i8], [5 x i8]*@.str5165, i32 0, i32 0
%.tmp5167 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5164, i8* %.tmp5166)
%var_name.5168 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5167, %m307$.Node.type** %var_name.5168
%.tmp5169 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5168
%.tmp5170 = icmp eq %m307$.Node.type* %.tmp5169, null
br i1 %.tmp5170, label %.if.true.5171, label %.if.false.5171
.if.true.5171:
%.tmp5172 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5173 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5175 = getelementptr [31 x i8], [31 x i8]*@.str5174, i32 0, i32 0
%.tmp5176 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5172, %m307$.Node.type* %.tmp5173, i8* %.tmp5175)
%.tmp5177 = call i32(i8*,...) @printf(i8* %.tmp5176)
%.tmp5178 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5178
br label %.if.end.5171
.if.false.5171:
br label %.if.end.5171
.if.end.5171:
%.tmp5179 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5180 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5179)
%mod.5181 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5180, %m1861$.ModuleLookup.type** %mod.5181
%.tmp5182 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5183 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5181
%.tmp5184 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5183, i32 0, i32 3
%.tmp5185 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5184
%.tmp5186 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5168
%.tmp5187 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5186, i32 0, i32 1
%.tmp5188 = load i8*, i8** %.tmp5187
%.tmp5189 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5182, %m1861$.Scope.type* %.tmp5185, i8* %.tmp5188)
%.tmp5190 = icmp ne %m1861$.ScopeItem.type* %.tmp5189, null
br i1 %.tmp5190, label %.if.true.5191, label %.if.false.5191
.if.true.5191:
%err_buf.5192 = alloca i8*
store i8* null, i8** %err_buf.5192
%.tmp5193 = getelementptr i8*, i8** %err_buf.5192, i32 0
%.tmp5195 = getelementptr [43 x i8], [43 x i8]*@.str5194, i32 0, i32 0
%.tmp5196 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5168
%.tmp5197 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5196, i32 0, i32 1
%.tmp5198 = load i8*, i8** %.tmp5197
%.tmp5199 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5193, i8* %.tmp5195, i8* %.tmp5198)
%.tmp5200 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5201 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5202 = load i8*, i8** %err_buf.5192
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5200, %m307$.Node.type* %.tmp5201, i8* %.tmp5202)
%.tmp5203 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5203
br label %.if.end.5191
.if.false.5191:
br label %.if.end.5191
.if.end.5191:
%var_id.5204 = alloca i8*
store i8* null, i8** %var_id.5204
%.tmp5205 = getelementptr i8*, i8** %var_id.5204, i32 0
%.tmp5207 = getelementptr [6 x i8], [6 x i8]*@.str5206, i32 0, i32 0
%.tmp5208 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5168
%.tmp5209 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5208, i32 0, i32 1
%.tmp5210 = load i8*, i8** %.tmp5209
%.tmp5211 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5212 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5211)
%.tmp5213 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5205, i8* %.tmp5207, i8* %.tmp5210, i32 %.tmp5212)
%.tmp5214 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5215 = load i8, i8* @SCOPE_LOCAL
%.tmp5216 = load i8*, i8** %var_id.5204
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5214, i8 %.tmp5215, i8* %.tmp5216)
%.tmp5217 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5122
%.tmp5218 = icmp ne %m1861$.Type.type* %.tmp5217, null
br i1 %.tmp5218, label %.if.true.5219, label %.if.false.5219
.if.true.5219:
%.tmp5220 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5221 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5220, i32 0, i32 3
%.tmp5222 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5122
store %m1861$.Type.type* %.tmp5222, %m1861$.Type.type** %.tmp5221
br label %.if.end.5219
.if.false.5219:
%.tmp5223 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5224 = icmp ne %m1861$.AssignableInfo.type* %.tmp5223, null
br i1 %.tmp5224, label %.if.true.5225, label %.if.false.5225
.if.true.5225:
%.tmp5226 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5227 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5226, i32 0, i32 3
%.tmp5228 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5229 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5228, i32 0, i32 3
%.tmp5230 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5229
store %m1861$.Type.type* %.tmp5230, %m1861$.Type.type** %.tmp5227
br label %.if.end.5225
.if.false.5225:
br label %.if.end.5225
.if.end.5225:
br label %.if.end.5219
.if.end.5219:
%.tmp5231 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5232 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5233 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5232, i32 0, i32 3
%.tmp5234 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5233
%.tmp5235 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5231, %m1861$.Type.type* %.tmp5234)
%var_type_repr.5236 = alloca i8*
store i8* %.tmp5235, i8** %var_type_repr.5236
%.tmp5237 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5238 = icmp ne %m1861$.AssignableInfo.type* %.tmp5237, null
br i1 %.tmp5238, label %.if.true.5239, label %.if.false.5239
.if.true.5239:
%.tmp5240 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5241 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5242 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5241, i32 0, i32 3
%.tmp5243 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5242
%.tmp5244 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5240, %m1861$.Type.type* %.tmp5243)
%a_type_repr.5245 = alloca i8*
store i8* %.tmp5244, i8** %a_type_repr.5245
%type_error.5246 = alloca i1
store i1 0, i1* %type_error.5246
%.tmp5247 = load i8*, i8** %a_type_repr.5245
%.tmp5248 = call i32(i8*) @strlen(i8* %.tmp5247)
%.tmp5249 = load i8*, i8** %var_type_repr.5236
%.tmp5250 = call i32(i8*) @strlen(i8* %.tmp5249)
%.tmp5251 = icmp ne i32 %.tmp5248, %.tmp5250
br i1 %.tmp5251, label %.if.true.5252, label %.if.false.5252
.if.true.5252:
store i1 1, i1* %type_error.5246
br label %.if.end.5252
.if.false.5252:
%.tmp5253 = load i8*, i8** %a_type_repr.5245
%.tmp5254 = load i8*, i8** %var_type_repr.5236
%.tmp5255 = call i32(i8*,i8*) @strcmp(i8* %.tmp5253, i8* %.tmp5254)
%.tmp5256 = icmp ne i32 %.tmp5255, 0
br i1 %.tmp5256, label %.if.true.5257, label %.if.false.5257
.if.true.5257:
store i1 1, i1* %type_error.5246
br label %.if.end.5257
.if.false.5257:
br label %.if.end.5257
.if.end.5257:
br label %.if.end.5252
.if.end.5252:
%.tmp5258 = load i1, i1* %type_error.5246
br i1 %.tmp5258, label %.if.true.5259, label %.if.false.5259
.if.true.5259:
%.tmp5260 = bitcast ptr null to i8*
%err_msg.5261 = alloca i8*
store i8* %.tmp5260, i8** %err_msg.5261
%.tmp5262 = getelementptr i8*, i8** %err_msg.5261, i32 0
%.tmp5264 = getelementptr [49 x i8], [49 x i8]*@.str5263, i32 0, i32 0
%.tmp5265 = load i8*, i8** %a_type_repr.5245
%.tmp5266 = load i8*, i8** %var_type_repr.5236
%.tmp5267 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5262, i8* %.tmp5264, i8* %.tmp5265, i8* %.tmp5266)
%.tmp5268 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5269 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5270 = load i8*, i8** %err_msg.5261
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5268, %m307$.Node.type* %.tmp5269, i8* %.tmp5270)
br label %.if.end.5259
.if.false.5259:
br label %.if.end.5259
.if.end.5259:
br label %.if.end.5239
.if.false.5239:
br label %.if.end.5239
.if.end.5239:
%.tmp5271 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5272 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5273 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5168
%.tmp5274 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5273, i32 0, i32 1
%.tmp5275 = load i8*, i8** %.tmp5274
%.tmp5276 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5271, %m307$.Node.type* %.tmp5272, i8* %.tmp5275, %m1861$.AssignableInfo.type* %.tmp5276)
%.tmp5277 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5278 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5277, i32 0, i32 1
%.tmp5279 = load %m0$.File.type*, %m0$.File.type** %.tmp5278
%.tmp5281 = getelementptr [16 x i8], [16 x i8]*@.str5280, i32 0, i32 0
%.tmp5282 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5283 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5282)
%.tmp5284 = load i8*, i8** %var_type_repr.5236
%.tmp5285 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5279, i8* %.tmp5281, i8* %.tmp5283, i8* %.tmp5284)
%.tmp5286 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5287 = icmp ne %m1861$.AssignableInfo.type* %.tmp5286, null
br i1 %.tmp5287, label %.if.true.5288, label %.if.false.5288
.if.true.5288:
%.tmp5289 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5290 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5289, i32 0, i32 1
%.tmp5291 = load %m0$.File.type*, %m0$.File.type** %.tmp5290
%.tmp5293 = getelementptr [21 x i8], [21 x i8]*@.str5292, i32 0, i32 0
%.tmp5294 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5295 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5296 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5295, i32 0, i32 3
%.tmp5297 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5296
%.tmp5298 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5294, %m1861$.Type.type* %.tmp5297)
%.tmp5299 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5124
%.tmp5300 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5299)
%.tmp5301 = load i8*, i8** %var_type_repr.5236
%.tmp5302 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
%.tmp5303 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5302)
%.tmp5304 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5291, i8* %.tmp5293, i8* %.tmp5298, i8* %.tmp5300, i8* %.tmp5301, i8* %.tmp5303)
br label %.if.end.5288
.if.false.5288:
%.tmp5305 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5306 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5307 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5305, %m307$.Node.type* %.tmp5306, %m1861$.AssignableInfo.type* %.tmp5307)
br label %.if.end.5288
.if.end.5288:
%.tmp5308 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5157
ret %m1861$.AssignableInfo.type* %.tmp5308
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5309 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5310 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5309, i32 0, i32 3
%.tmp5311 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5310
%.tmp5312 = icmp eq %m1861$.Type.type* %.tmp5311, null
br i1 %.tmp5312, label %.if.true.5313, label %.if.false.5313
.if.true.5313:
ret void
br label %.if.end.5313
.if.false.5313:
br label %.if.end.5313
.if.end.5313:
%.tmp5314 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5315 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5316 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5315, i32 0, i32 3
%.tmp5317 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5316
%.tmp5318 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5314, %m1861$.Type.type* %.tmp5317)
%t_repr.5319 = alloca i8*
store i8* %.tmp5318, i8** %t_repr.5319
%.tmp5320 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5321 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5320)
%id.5322 = alloca i8*
store i8* %.tmp5321, i8** %id.5322
%field_id.5323 = alloca i32
store i32 0, i32* %field_id.5323
%field.5324 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5324
%field_info.5325 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5327 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5326, i32 0, i32 3
%.tmp5328 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5327
%t.5329 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5328, %m1861$.Type.type** %t.5329
%.tmp5330 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5331 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5330, i32 0, i32 0
%.tmp5332 = load i8*, i8** %.tmp5331
%.tmp5334 = getelementptr [4 x i8], [4 x i8]*@.str5333, i32 0, i32 0
%.tmp5335 = call i32(i8*,i8*) @strcmp(i8* %.tmp5332, i8* %.tmp5334)
%.tmp5336 = icmp eq i32 %.tmp5335, 0
%.tmp5337 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5338 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5337, i32 0, i32 0
%.tmp5339 = load i8*, i8** %.tmp5338
%.tmp5341 = getelementptr [4 x i8], [4 x i8]*@.str5340, i32 0, i32 0
%.tmp5342 = call i32(i8*,i8*) @strcmp(i8* %.tmp5339, i8* %.tmp5341)
%.tmp5343 = icmp eq i32 %.tmp5342, 0
%.tmp5344 = or i1 %.tmp5336, %.tmp5343
%.tmp5345 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5346 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5345, i32 0, i32 0
%.tmp5347 = load i8*, i8** %.tmp5346
%.tmp5349 = getelementptr [5 x i8], [5 x i8]*@.str5348, i32 0, i32 0
%.tmp5350 = call i32(i8*,i8*) @strcmp(i8* %.tmp5347, i8* %.tmp5349)
%.tmp5351 = icmp eq i32 %.tmp5350, 0
%.tmp5352 = or i1 %.tmp5344, %.tmp5351
br i1 %.tmp5352, label %.if.true.5353, label %.if.false.5353
.if.true.5353:
%.tmp5354 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5355 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5354, i32 0, i32 1
%.tmp5356 = load %m0$.File.type*, %m0$.File.type** %.tmp5355
%.tmp5358 = getelementptr [21 x i8], [21 x i8]*@.str5357, i32 0, i32 0
%.tmp5359 = load i8*, i8** %t_repr.5319
%.tmp5360 = load i8*, i8** %t_repr.5319
%.tmp5361 = load i8*, i8** %id.5322
%.tmp5362 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5356, i8* %.tmp5358, i8* %.tmp5359, i32 0, i8* %.tmp5360, i8* %.tmp5361)
br label %.if.end.5353
.if.false.5353:
%.tmp5363 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5364 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5363, i32 0, i32 0
%.tmp5365 = load i8*, i8** %.tmp5364
%.tmp5367 = getelementptr [4 x i8], [4 x i8]*@.str5366, i32 0, i32 0
%.tmp5368 = call i32(i8*,i8*) @strcmp(i8* %.tmp5365, i8* %.tmp5367)
%.tmp5369 = icmp eq i32 %.tmp5368, 0
br i1 %.tmp5369, label %.if.true.5370, label %.if.false.5370
.if.true.5370:
%.tmp5371 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5372 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5371, i32 0, i32 1
%.tmp5373 = load %m0$.File.type*, %m0$.File.type** %.tmp5372
%.tmp5375 = getelementptr [21 x i8], [21 x i8]*@.str5374, i32 0, i32 0
%.tmp5376 = load i8*, i8** %t_repr.5319
%.tmp5378 = getelementptr [5 x i8], [5 x i8]*@.str5377, i32 0, i32 0
%.tmp5379 = load i8*, i8** %t_repr.5319
%.tmp5380 = load i8*, i8** %id.5322
%.tmp5381 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5373, i8* %.tmp5375, i8* %.tmp5376, i8* %.tmp5378, i8* %.tmp5379, i8* %.tmp5380)
br label %.if.end.5370
.if.false.5370:
%.tmp5382 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5383 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5382, i32 0, i32 0
%.tmp5384 = load i8*, i8** %.tmp5383
%.tmp5386 = getelementptr [7 x i8], [7 x i8]*@.str5385, i32 0, i32 0
%.tmp5387 = call i32(i8*,i8*) @strcmp(i8* %.tmp5384, i8* %.tmp5386)
%.tmp5388 = icmp eq i32 %.tmp5387, 0
br i1 %.tmp5388, label %.if.true.5389, label %.if.false.5389
.if.true.5389:
%.tmp5391 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5392 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5391, i32 0, i32 3
%.tmp5393 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5392
store %m1861$.Type.type* %.tmp5393, %m1861$.Type.type** %field.5324
br label %.for.start.5390
.for.start.5390:
%.tmp5394 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5324
%.tmp5395 = icmp ne %m1861$.Type.type* %.tmp5394, null
br i1 %.tmp5395, label %.for.continue.5390, label %.for.end.5390
.for.continue.5390:
%.tmp5396 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5397 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5396)
store %m1861$.AssignableInfo.type* %.tmp5397, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5398 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5399 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5398, %m1861$.AssignableInfo.type* %.tmp5399)
%.tmp5400 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5401 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5400, i32 0, i32 3
%.tmp5402 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5324
store %m1861$.Type.type* %.tmp5402, %m1861$.Type.type** %.tmp5401
%.tmp5403 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5404 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5403, i32 0, i32 1
%.tmp5405 = load %m0$.File.type*, %m0$.File.type** %.tmp5404
%.tmp5407 = getelementptr [46 x i8], [46 x i8]*@.str5406, i32 0, i32 0
%.tmp5408 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5409 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5408)
%.tmp5410 = load i8*, i8** %t_repr.5319
%.tmp5411 = load i8*, i8** %t_repr.5319
%.tmp5412 = load i8*, i8** %id.5322
%.tmp5413 = load i32, i32* %field_id.5323
%.tmp5414 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5405, i8* %.tmp5407, i8* %.tmp5409, i8* %.tmp5410, i8* %.tmp5411, i8* %.tmp5412, i32 %.tmp5413)
%.tmp5415 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5416 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5417 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5415, %m307$.Node.type* %.tmp5416, %m1861$.AssignableInfo.type* %.tmp5417)
%.tmp5418 = load i32, i32* %field_id.5323
%.tmp5419 = add i32 %.tmp5418, 1
store i32 %.tmp5419, i32* %field_id.5323
%.tmp5420 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5324
%.tmp5421 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5420, i32 0, i32 4
%.tmp5422 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5421
store %m1861$.Type.type* %.tmp5422, %m1861$.Type.type** %field.5324
br label %.for.start.5390
.for.end.5390:
br label %.if.end.5389
.if.false.5389:
%.tmp5423 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5424 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5423, i32 0, i32 0
%.tmp5425 = load i8*, i8** %.tmp5424
%.tmp5427 = getelementptr [10 x i8], [10 x i8]*@.str5426, i32 0, i32 0
%.tmp5428 = call i32(i8*,i8*) @strcmp(i8* %.tmp5425, i8* %.tmp5427)
%.tmp5429 = icmp eq i32 %.tmp5428, 0
br i1 %.tmp5429, label %.if.true.5430, label %.if.false.5430
.if.true.5430:
%.tmp5432 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5329
%.tmp5433 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5432, i32 0, i32 3
%.tmp5434 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5433
%.tmp5435 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5434, i32 0, i32 3
%.tmp5436 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5435
store %m1861$.Type.type* %.tmp5436, %m1861$.Type.type** %field.5324
br label %.for.start.5431
.for.start.5431:
%.tmp5437 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5324
%.tmp5438 = icmp ne %m1861$.Type.type* %.tmp5437, null
br i1 %.tmp5438, label %.for.continue.5431, label %.for.end.5431
.for.continue.5431:
%.tmp5439 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5440 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5439)
store %m1861$.AssignableInfo.type* %.tmp5440, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5441 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5442 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5441, %m1861$.AssignableInfo.type* %.tmp5442)
%.tmp5443 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5444 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5443, i32 0, i32 3
%.tmp5445 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5324
store %m1861$.Type.type* %.tmp5445, %m1861$.Type.type** %.tmp5444
%.tmp5446 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5447 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5446, i32 0, i32 1
%.tmp5448 = load %m0$.File.type*, %m0$.File.type** %.tmp5447
%.tmp5450 = getelementptr [46 x i8], [46 x i8]*@.str5449, i32 0, i32 0
%.tmp5451 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
%.tmp5452 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5451)
%.tmp5453 = load i8*, i8** %t_repr.5319
%.tmp5454 = load i8*, i8** %t_repr.5319
%.tmp5455 = load i8*, i8** %id.5322
%.tmp5456 = load i32, i32* %field_id.5323
%.tmp5457 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5448, i8* %.tmp5450, i8* %.tmp5452, i8* %.tmp5453, i8* %.tmp5454, i8* %.tmp5455, i32 %.tmp5456)
%.tmp5458 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5459 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5460 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5325
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5458, %m307$.Node.type* %.tmp5459, %m1861$.AssignableInfo.type* %.tmp5460)
%.tmp5461 = load i32, i32* %field_id.5323
%.tmp5462 = add i32 %.tmp5461, 1
store i32 %.tmp5462, i32* %field_id.5323
%.tmp5463 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5324
%.tmp5464 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5463, i32 0, i32 4
%.tmp5465 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5464
store %m1861$.Type.type* %.tmp5465, %m1861$.Type.type** %field.5324
br label %.for.start.5431
.for.end.5431:
br label %.if.end.5430
.if.false.5430:
%.tmp5466 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5467 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5469 = getelementptr [44 x i8], [44 x i8]*@.str5468, i32 0, i32 0
%.tmp5470 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5466, %m307$.Node.type* %.tmp5467, i8* %.tmp5469)
%.tmp5471 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5472 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5471, i32 0, i32 3
%.tmp5473 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5472
%.tmp5474 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5473, i32 0, i32 0
%.tmp5475 = load i8*, i8** %.tmp5474
%.tmp5476 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5477 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5478 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5477, i32 0, i32 3
%.tmp5479 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5478
%.tmp5480 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5476, %m1861$.Type.type* %.tmp5479)
%.tmp5481 = call i32(i8*,...) @printf(i8* %.tmp5470, i8* %.tmp5475, i8* %.tmp5480)
ret void
br label %.if.end.5430
.if.end.5430:
br label %.if.end.5389
.if.end.5389:
br label %.if.end.5370
.if.end.5370:
br label %.if.end.5353
.if.end.5353:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5482 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5483 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5482, i32 0, i32 6
%.tmp5484 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5483
%.tmp5486 = getelementptr [11 x i8], [11 x i8]*@.str5485, i32 0, i32 0
%.tmp5487 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5484, i8* %.tmp5486)
%assignable.5488 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5487, %m307$.Node.type** %assignable.5488
%.tmp5489 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5490 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5488
%.tmp5491 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5489, %m307$.Node.type* %.tmp5490)
%a_info.5492 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5491, %m1861$.AssignableInfo.type** %a_info.5492
%.tmp5493 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5492
%.tmp5494 = icmp eq %m1861$.AssignableInfo.type* %.tmp5493, null
br i1 %.tmp5494, label %.if.true.5495, label %.if.false.5495
.if.true.5495:
ret void
br label %.if.end.5495
.if.false.5495:
br label %.if.end.5495
.if.end.5495:
%.tmp5496 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5497 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5496)
%if_id.5498 = alloca i32
store i32 %.tmp5497, i32* %if_id.5498
%.tmp5499 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5500 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5499, i32 0, i32 1
%.tmp5501 = load %m0$.File.type*, %m0$.File.type** %.tmp5500
%.tmp5503 = getelementptr [53 x i8], [53 x i8]*@.str5502, i32 0, i32 0
%.tmp5504 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5505 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5492
%.tmp5506 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5505, i32 0, i32 3
%.tmp5507 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5506
%.tmp5508 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5504, %m1861$.Type.type* %.tmp5507)
%.tmp5509 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5492
%.tmp5510 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5509)
%.tmp5511 = load i32, i32* %if_id.5498
%.tmp5512 = load i32, i32* %if_id.5498
%.tmp5513 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5501, i8* %.tmp5503, i8* %.tmp5508, i8* %.tmp5510, i32 %.tmp5511, i32 %.tmp5512)
%.tmp5514 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5515 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5514, i32 0, i32 1
%.tmp5516 = load %m0$.File.type*, %m0$.File.type** %.tmp5515
%.tmp5518 = getelementptr [14 x i8], [14 x i8]*@.str5517, i32 0, i32 0
%.tmp5519 = load i32, i32* %if_id.5498
%.tmp5520 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5516, i8* %.tmp5518, i32 %.tmp5519)
%.tmp5521 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5522 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5521, i32 0, i32 6
%.tmp5523 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5522
%.tmp5525 = getelementptr [6 x i8], [6 x i8]*@.str5524, i32 0, i32 0
%.tmp5526 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5523, i8* %.tmp5525)
%block.5527 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5526, %m307$.Node.type** %block.5527
%.tmp5528 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5529 = load %m307$.Node.type*, %m307$.Node.type** %block.5527
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5528, %m307$.Node.type* %.tmp5529)
%.tmp5530 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5531 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5530, i32 0, i32 1
%.tmp5532 = load %m0$.File.type*, %m0$.File.type** %.tmp5531
%.tmp5534 = getelementptr [23 x i8], [23 x i8]*@.str5533, i32 0, i32 0
%.tmp5535 = load i32, i32* %if_id.5498
%.tmp5536 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5532, i8* %.tmp5534, i32 %.tmp5535)
%.tmp5537 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5538 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5537, i32 0, i32 1
%.tmp5539 = load %m0$.File.type*, %m0$.File.type** %.tmp5538
%.tmp5541 = getelementptr [15 x i8], [15 x i8]*@.str5540, i32 0, i32 0
%.tmp5542 = load i32, i32* %if_id.5498
%.tmp5543 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5539, i8* %.tmp5541, i32 %.tmp5542)
%.tmp5544 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5545 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5544, i32 0, i32 6
%.tmp5546 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5545
%.tmp5548 = getelementptr [11 x i8], [11 x i8]*@.str5547, i32 0, i32 0
%.tmp5549 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5546, i8* %.tmp5548)
%else_block.5550 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5549, %m307$.Node.type** %else_block.5550
%.tmp5551 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5550
%.tmp5552 = icmp ne %m307$.Node.type* %.tmp5551, null
br i1 %.tmp5552, label %.if.true.5553, label %.if.false.5553
.if.true.5553:
%.tmp5554 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5550
%.tmp5555 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5554, i32 0, i32 6
%.tmp5556 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5555
%.tmp5557 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5556, i32 0, i32 0
%.tmp5558 = load i8*, i8** %.tmp5557
%.tmp5560 = getelementptr [11 x i8], [11 x i8]*@.str5559, i32 0, i32 0
%.tmp5561 = call i32(i8*,i8*) @strcmp(i8* %.tmp5558, i8* %.tmp5560)
%.tmp5562 = icmp eq i32 %.tmp5561, 0
br i1 %.tmp5562, label %.if.true.5563, label %.if.false.5563
.if.true.5563:
%.tmp5564 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5550
%.tmp5565 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5564, i32 0, i32 6
%.tmp5566 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5565
%.tmp5567 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5566, i32 0, i32 6
%.tmp5568 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5567
%.tmp5570 = getelementptr [6 x i8], [6 x i8]*@.str5569, i32 0, i32 0
%.tmp5571 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5568, i8* %.tmp5570)
store %m307$.Node.type* %.tmp5571, %m307$.Node.type** %block.5527
%.tmp5572 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5573 = load %m307$.Node.type*, %m307$.Node.type** %block.5527
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5572, %m307$.Node.type* %.tmp5573)
br label %.if.end.5563
.if.false.5563:
%.tmp5574 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5575 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5550
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5574, %m307$.Node.type* %.tmp5575)
br label %.if.end.5563
.if.end.5563:
br label %.if.end.5553
.if.false.5553:
br label %.if.end.5553
.if.end.5553:
%.tmp5576 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5577 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5576, i32 0, i32 1
%.tmp5578 = load %m0$.File.type*, %m0$.File.type** %.tmp5577
%.tmp5580 = getelementptr [23 x i8], [23 x i8]*@.str5579, i32 0, i32 0
%.tmp5581 = load i32, i32* %if_id.5498
%.tmp5582 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5578, i8* %.tmp5580, i32 %.tmp5581)
%.tmp5583 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5584 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5583, i32 0, i32 1
%.tmp5585 = load %m0$.File.type*, %m0$.File.type** %.tmp5584
%.tmp5587 = getelementptr [13 x i8], [13 x i8]*@.str5586, i32 0, i32 0
%.tmp5588 = load i32, i32* %if_id.5498
%.tmp5589 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5585, i8* %.tmp5587, i32 %.tmp5588)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5590 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5591 = icmp ne %m307$.Node.type* %.tmp5590, null
br i1 %.tmp5591, label %.if.true.5592, label %.if.false.5592
.if.true.5592:
%.tmp5593 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5594 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5593, i32 0, i32 7
%.tmp5595 = load i8*, i8** %.tmp5594
%.tmp5596 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5597 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5596, i32 0, i32 3
%.tmp5598 = load i32, i32* %.tmp5597
%.tmp5599 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5600 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5599, i32 0, i32 4
%.tmp5601 = load i32, i32* %.tmp5600
%.tmp5602 = load i8*, i8** %msg
%.tmp5603 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5595, i32 %.tmp5598, i32 %.tmp5601, i8* %.tmp5602)
%err.5604 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5603, %m751$.Error.type** %err.5604
%.tmp5605 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5606 = load %m751$.Error.type*, %m751$.Error.type** %err.5604
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5605, %m751$.Error.type* %.tmp5606)
br label %.if.end.5592
.if.false.5592:
%.tmp5608 = getelementptr [61 x i8], [61 x i8]*@.str5607, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5608)
br label %.if.end.5592
.if.end.5592:
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
%.tmp5609 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5610 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5609)
%mod.5611 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5610, %m1861$.ModuleLookup.type** %mod.5611
%.tmp5612 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5611
%.tmp5613 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5612, i32 0, i32 3
%.tmp5614 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5613
%.tmp5615 = icmp ne %m1861$.Scope.type* %.tmp5614, null
%.tmp5617 = getelementptr [82 x i8], [82 x i8]*@.str5616, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5615, i8* %.tmp5617)
%.tmp5618 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5611
%.tmp5619 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5618, i32 0, i32 3
%.tmp5620 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5619
%current_scope.5621 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5620, %m1861$.Scope.type** %current_scope.5621
%.tmp5622 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5623 = ptrtoint %m1861$.ScopeItem.type* %.tmp5622 to i32
%.tmp5624 = call i8*(i32) @malloc(i32 %.tmp5623)
%.tmp5625 = bitcast i8* %.tmp5624 to %m1861$.ScopeItem.type*
%newitem.5626 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5625, %m1861$.ScopeItem.type** %newitem.5626
%.tmp5627 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5626
%.tmp5628 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5627, i32 0, i32 0
%.tmp5629 = load i8*, i8** %name
store i8* %.tmp5629, i8** %.tmp5628
%.tmp5630 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5626
%.tmp5631 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5630, i32 0, i32 1
%.tmp5632 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5632, %m1861$.AssignableInfo.type** %.tmp5631
%.tmp5633 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5626
%.tmp5634 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5633, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5634
%.tmp5635 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5621
%.tmp5636 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5635, i32 0, i32 1
%.tmp5637 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5636
%.tmp5638 = icmp eq %m1861$.ScopeItem.type* %.tmp5637, null
br i1 %.tmp5638, label %.if.true.5639, label %.if.false.5639
.if.true.5639:
%.tmp5640 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5621
%.tmp5641 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5640, i32 0, i32 1
%.tmp5642 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5626
store %m1861$.ScopeItem.type* %.tmp5642, %m1861$.ScopeItem.type** %.tmp5641
ret void
br label %.if.end.5639
.if.false.5639:
br label %.if.end.5639
.if.end.5639:
%.tmp5643 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5621
%.tmp5644 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5643, i32 0, i32 1
%.tmp5645 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5644
%last_item.5646 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5645, %m1861$.ScopeItem.type** %last_item.5646
%.tmp5648 = getelementptr [1 x i8], [1 x i8]*@.str5647, i32 0, i32 0
%err_buf.5649 = alloca i8*
store i8* %.tmp5648, i8** %err_buf.5649
%.tmp5650 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5646
%.tmp5651 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5650, i32 0, i32 0
%.tmp5652 = load i8*, i8** %.tmp5651
%.tmp5653 = load i8*, i8** %name
%.tmp5654 = call i32(i8*,i8*) @strcmp(i8* %.tmp5652, i8* %.tmp5653)
%.tmp5655 = icmp eq i32 %.tmp5654, 0
br i1 %.tmp5655, label %.if.true.5656, label %.if.false.5656
.if.true.5656:
%.tmp5657 = getelementptr i8*, i8** %err_buf.5649, i32 0
%.tmp5659 = getelementptr [43 x i8], [43 x i8]*@.str5658, i32 0, i32 0
%.tmp5660 = load i8*, i8** %name
%.tmp5661 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5657, i8* %.tmp5659, i8* %.tmp5660)
%.tmp5662 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5663 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5664 = load i8*, i8** %err_buf.5649
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5662, %m307$.Node.type* %.tmp5663, i8* %.tmp5664)
br label %.if.end.5656
.if.false.5656:
br label %.if.end.5656
.if.end.5656:
br label %.for.start.5665
.for.start.5665:
%.tmp5666 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5646
%.tmp5667 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5666, i32 0, i32 2
%.tmp5668 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5667
%.tmp5669 = icmp ne %m1861$.ScopeItem.type* %.tmp5668, null
br i1 %.tmp5669, label %.for.continue.5665, label %.for.else.5665
.for.continue.5665:
%.tmp5670 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5646
%.tmp5671 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5670, i32 0, i32 0
%.tmp5672 = load i8*, i8** %.tmp5671
%.tmp5673 = load i8*, i8** %name
%.tmp5674 = call i32(i8*,i8*) @strcmp(i8* %.tmp5672, i8* %.tmp5673)
%.tmp5675 = icmp eq i32 %.tmp5674, 0
br i1 %.tmp5675, label %.if.true.5676, label %.if.false.5676
.if.true.5676:
%.tmp5677 = getelementptr i8*, i8** %err_buf.5649, i32 0
%.tmp5679 = getelementptr [43 x i8], [43 x i8]*@.str5678, i32 0, i32 0
%.tmp5680 = load i8*, i8** %name
%.tmp5681 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5677, i8* %.tmp5679, i8* %.tmp5680)
%.tmp5682 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5683 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5684 = load i8*, i8** %err_buf.5649
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5682, %m307$.Node.type* %.tmp5683, i8* %.tmp5684)
br label %.for.end.5665
br label %.if.end.5676
.if.false.5676:
br label %.if.end.5676
.if.end.5676:
%.tmp5685 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5646
%.tmp5686 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5685, i32 0, i32 2
%.tmp5687 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5686
store %m1861$.ScopeItem.type* %.tmp5687, %m1861$.ScopeItem.type** %last_item.5646
br label %.for.start.5665
.for.else.5665:
%.tmp5688 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5646
%.tmp5689 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5688, i32 0, i32 2
%.tmp5690 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5626
store %m1861$.ScopeItem.type* %.tmp5690, %m1861$.ScopeItem.type** %.tmp5689
br label %.for.end.5665
.for.end.5665:
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5691 = alloca i8*
store i8* null, i8** %err_buf.5691
%.tmp5692 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5693 = load i8*, i8** %module
%.tmp5694 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5695 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5694, i32 0, i32 1
%.tmp5696 = load i8*, i8** %.tmp5695
%.tmp5697 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5692, i8* %.tmp5693, i8* %.tmp5696)
%found.5698 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5697, %m1861$.ScopeItem.type** %found.5698
%.tmp5699 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5698
%.tmp5700 = icmp eq %m1861$.ScopeItem.type* %.tmp5699, null
br i1 %.tmp5700, label %.if.true.5701, label %.if.false.5701
.if.true.5701:
%.tmp5702 = getelementptr i8*, i8** %err_buf.5691, i32 0
%.tmp5704 = getelementptr [31 x i8], [31 x i8]*@.str5703, i32 0, i32 0
%.tmp5705 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5706 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5705, i32 0, i32 1
%.tmp5707 = load i8*, i8** %.tmp5706
%.tmp5708 = load i8*, i8** %module
%.tmp5709 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5702, i8* %.tmp5704, i8* %.tmp5707, i8* %.tmp5708)
%.tmp5710 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5711 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5712 = load i8*, i8** %err_buf.5691
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5710, %m307$.Node.type* %.tmp5711, i8* %.tmp5712)
%.tmp5713 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5713
br label %.if.end.5701
.if.false.5701:
br label %.if.end.5701
.if.end.5701:
br label %.for.start.5714
.for.start.5714:
%.tmp5715 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5716 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5715, i32 0, i32 7
%.tmp5717 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5716
%.tmp5718 = icmp ne %m307$.Node.type* %.tmp5717, null
%.tmp5719 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5698
%.tmp5720 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5719, i32 0, i32 1
%.tmp5721 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5720
%.tmp5722 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5721, i32 0, i32 2
%.tmp5723 = load i8*, i8** %.tmp5722
%.tmp5725 = getelementptr [7 x i8], [7 x i8]*@.str5724, i32 0, i32 0
%.tmp5726 = call i32(i8*,i8*) @strcmp(i8* %.tmp5723, i8* %.tmp5725)
%.tmp5727 = icmp eq i32 %.tmp5726, 0
%.tmp5728 = and i1 %.tmp5718, %.tmp5727
br i1 %.tmp5728, label %.for.continue.5714, label %.for.end.5714
.for.continue.5714:
%.tmp5729 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5730 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5698
%.tmp5731 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5730, i32 0, i32 1
%.tmp5732 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5731
%.tmp5733 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5732, i32 0, i32 0
%.tmp5734 = load i8*, i8** %.tmp5733
%.tmp5735 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5736 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5735, i32 0, i32 7
%.tmp5737 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5736
%.tmp5738 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5737, i32 0, i32 7
%.tmp5739 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5738
%.tmp5740 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5729, i8* %.tmp5734, %m307$.Node.type* %.tmp5739)
store %m1861$.ScopeItem.type* %.tmp5740, %m1861$.ScopeItem.type** %found.5698
%.tmp5741 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5698
%.tmp5742 = icmp eq %m1861$.ScopeItem.type* %.tmp5741, null
br i1 %.tmp5742, label %.if.true.5743, label %.if.false.5743
.if.true.5743:
%.tmp5744 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5744
br label %.if.end.5743
.if.false.5743:
br label %.if.end.5743
.if.end.5743:
br label %.for.start.5714
.for.end.5714:
%.tmp5745 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5698
ret %m1861$.ScopeItem.type* %.tmp5745
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5746 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5747 = icmp eq %m1861$.Scope.type* %.tmp5746, null
br i1 %.tmp5747, label %.if.true.5748, label %.if.false.5748
.if.true.5748:
%.tmp5749 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5749
br label %.if.end.5748
.if.false.5748:
br label %.if.end.5748
.if.end.5748:
%.tmp5751 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5752 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5751, i32 0, i32 1
%.tmp5753 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5752
%item.5754 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5753, %m1861$.ScopeItem.type** %item.5754
br label %.for.start.5750
.for.start.5750:
%.tmp5755 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5754
%.tmp5756 = icmp ne %m1861$.ScopeItem.type* %.tmp5755, null
br i1 %.tmp5756, label %.for.continue.5750, label %.for.end.5750
.for.continue.5750:
%.tmp5757 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5754
%.tmp5758 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5757, i32 0, i32 0
%.tmp5759 = load i8*, i8** %.tmp5758
%.tmp5760 = load i8*, i8** %name
%.tmp5761 = call i32(i8*,i8*) @strcmp(i8* %.tmp5759, i8* %.tmp5760)
%.tmp5762 = icmp eq i32 %.tmp5761, 0
br i1 %.tmp5762, label %.if.true.5763, label %.if.false.5763
.if.true.5763:
%.tmp5764 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5754
ret %m1861$.ScopeItem.type* %.tmp5764
br label %.if.end.5763
.if.false.5763:
br label %.if.end.5763
.if.end.5763:
%.tmp5765 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5754
%.tmp5766 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5765, i32 0, i32 2
%.tmp5767 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5766
store %m1861$.ScopeItem.type* %.tmp5767, %m1861$.ScopeItem.type** %item.5754
br label %.for.start.5750
.for.end.5750:
%.tmp5768 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5768
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5769 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5770 = load i8*, i8** %module
%.tmp5771 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5769, i8* %.tmp5770)
%mod.5772 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5771, %m1861$.ModuleLookup.type** %mod.5772
%.tmp5773 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5772
%.tmp5774 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5773, i32 0, i32 3
%.tmp5775 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5774
%.tmp5776 = icmp ne %m1861$.Scope.type* %.tmp5775, null
%.tmp5778 = getelementptr [77 x i8], [77 x i8]*@.str5777, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5776, i8* %.tmp5778)
%.tmp5780 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5772
%.tmp5781 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5780, i32 0, i32 3
%.tmp5782 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5781
%s.5783 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5782, %m1861$.Scope.type** %s.5783
br label %.for.start.5779
.for.start.5779:
%.tmp5784 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5783
%.tmp5785 = icmp ne %m1861$.Scope.type* %.tmp5784, null
br i1 %.tmp5785, label %.for.continue.5779, label %.for.end.5779
.for.continue.5779:
%.tmp5786 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5787 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5783
%.tmp5788 = load i8*, i8** %assignable_name
%.tmp5789 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5786, %m1861$.Scope.type* %.tmp5787, i8* %.tmp5788)
%item.5790 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5789, %m1861$.ScopeItem.type** %item.5790
%.tmp5791 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5790
%.tmp5792 = icmp ne %m1861$.ScopeItem.type* %.tmp5791, null
br i1 %.tmp5792, label %.if.true.5793, label %.if.false.5793
.if.true.5793:
%.tmp5794 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5790
ret %m1861$.ScopeItem.type* %.tmp5794
br label %.if.end.5793
.if.false.5793:
br label %.if.end.5793
.if.end.5793:
%.tmp5795 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5783
%.tmp5796 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5795, i32 0, i32 5
%.tmp5797 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5796
store %m1861$.Scope.type* %.tmp5797, %m1861$.Scope.type** %s.5783
br label %.for.start.5779
.for.end.5779:
%.tmp5798 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5798
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5799 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5800 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5801 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5800, i32 0, i32 7
%.tmp5802 = load i8*, i8** %.tmp5801
%.tmp5803 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5804 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5803, i32 0, i32 6
%.tmp5805 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5804
%.tmp5806 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5799, i8* %.tmp5802, %m307$.Node.type* %.tmp5805)
ret %m1861$.ScopeItem.type* %.tmp5806
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5807 = alloca i8*
store i8* null, i8** %err_msg.5807
%buf.5808 = alloca i8*
store i8* null, i8** %buf.5808
%.tmp5809 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5810 = icmp eq %m1861$.AssignableInfo.type* %.tmp5809, null
br i1 %.tmp5810, label %.if.true.5811, label %.if.false.5811
.if.true.5811:
%.tmp5812 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5813 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5815 = getelementptr [54 x i8], [54 x i8]*@.str5814, i32 0, i32 0
%.tmp5816 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5812, %m307$.Node.type* %.tmp5813, i8* %.tmp5815)
%.tmp5817 = call i32(i8*,...) @printf(i8* %.tmp5816)
%.tmp5818 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5818
br label %.if.end.5811
.if.false.5811:
br label %.if.end.5811
.if.end.5811:
%.tmp5819 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5820 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5819, i32 0, i32 2
%.tmp5821 = load i8*, i8** %.tmp5820
%.tmp5823 = getelementptr [9 x i8], [9 x i8]*@.str5822, i32 0, i32 0
%.tmp5824 = call i32(i8*,i8*) @strcmp(i8* %.tmp5821, i8* %.tmp5823)
%.tmp5825 = icmp eq i32 %.tmp5824, 0
%.tmp5826 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5827 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5826, i32 0, i32 2
%.tmp5828 = load i8*, i8** %.tmp5827
%.tmp5830 = getelementptr [7 x i8], [7 x i8]*@.str5829, i32 0, i32 0
%.tmp5831 = call i32(i8*,i8*) @strcmp(i8* %.tmp5828, i8* %.tmp5830)
%.tmp5832 = icmp eq i32 %.tmp5831, 0
%.tmp5833 = or i1 %.tmp5825, %.tmp5832
br i1 %.tmp5833, label %.if.true.5834, label %.if.false.5834
.if.true.5834:
%.tmp5835 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5836 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5835, i32 0, i32 7
%.tmp5837 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5836
%.tmp5838 = icmp ne %m307$.Node.type* %.tmp5837, null
br i1 %.tmp5838, label %.if.true.5839, label %.if.false.5839
.if.true.5839:
%.tmp5840 = getelementptr i8*, i8** %err_msg.5807, i32 0
%.tmp5842 = getelementptr [46 x i8], [46 x i8]*@.str5841, i32 0, i32 0
%.tmp5843 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5844 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5843, i32 0, i32 7
%.tmp5845 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5844
%.tmp5846 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5845, i32 0, i32 7
%.tmp5847 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5846
%.tmp5848 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5847, i32 0, i32 1
%.tmp5849 = load i8*, i8** %.tmp5848
%.tmp5850 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5851 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5850, i32 0, i32 1
%.tmp5852 = load i8*, i8** %.tmp5851
%.tmp5853 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5840, i8* %.tmp5842, i8* %.tmp5849, i8* %.tmp5852)
%.tmp5854 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5855 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5856 = load i8*, i8** %err_msg.5807
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5854, %m307$.Node.type* %.tmp5855, i8* %.tmp5856)
%.tmp5857 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5857
br label %.if.end.5839
.if.false.5839:
br label %.if.end.5839
.if.end.5839:
%.tmp5858 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5858
br label %.if.end.5834
.if.false.5834:
%.tmp5859 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5860 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5859, i32 0, i32 2
%.tmp5861 = load i8*, i8** %.tmp5860
%.tmp5863 = getelementptr [9 x i8], [9 x i8]*@.str5862, i32 0, i32 0
%.tmp5864 = call i32(i8*,i8*) @strcmp(i8* %.tmp5861, i8* %.tmp5863)
%.tmp5865 = icmp eq i32 %.tmp5864, 0
%.tmp5866 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5867 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5866, i32 0, i32 7
%.tmp5868 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5867
%.tmp5869 = icmp ne %m307$.Node.type* %.tmp5868, null
%.tmp5870 = and i1 %.tmp5865, %.tmp5869
br i1 %.tmp5870, label %.if.true.5871, label %.if.false.5871
.if.true.5871:
%.tmp5872 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5873 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5872, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5874 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5875 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5874, i32 0, i32 3
%.tmp5876 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5875
%struct_info.5877 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5876, %m1861$.Type.type** %struct_info.5877
br label %.for.start.5878
.for.start.5878:
%.tmp5879 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5880 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5879, i32 0, i32 3
%.tmp5881 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5880
%.tmp5882 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5881, i32 0, i32 0
%.tmp5883 = load i8*, i8** %.tmp5882
%.tmp5885 = getelementptr [4 x i8], [4 x i8]*@.str5884, i32 0, i32 0
%.tmp5886 = call i32(i8*,i8*) @strcmp(i8* %.tmp5883, i8* %.tmp5885)
%.tmp5887 = icmp eq i32 %.tmp5886, 0
br i1 %.tmp5887, label %.for.continue.5878, label %.for.end.5878
.for.continue.5878:
%.tmp5888 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5889 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5888)
%new_base.5890 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5889, %m1861$.AssignableInfo.type** %new_base.5890
%.tmp5891 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5892 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5890
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5891, %m1861$.AssignableInfo.type* %.tmp5892)
%.tmp5893 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5890
%.tmp5894 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5893, i32 0, i32 3
%.tmp5895 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5896 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5895, i32 0, i32 3
%.tmp5897 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5896
%.tmp5898 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5897, i32 0, i32 3
%.tmp5899 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5898
store %m1861$.Type.type* %.tmp5899, %m1861$.Type.type** %.tmp5894
%.tmp5900 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5901 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5900, i32 0, i32 1
%.tmp5902 = load %m0$.File.type*, %m0$.File.type** %.tmp5901
%.tmp5904 = getelementptr [23 x i8], [23 x i8]*@.str5903, i32 0, i32 0
%.tmp5905 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5890
%.tmp5906 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5905)
%.tmp5907 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5908 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5890
%.tmp5909 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5908, i32 0, i32 3
%.tmp5910 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5909
%.tmp5911 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5907, %m1861$.Type.type* %.tmp5910)
%.tmp5912 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5913 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5914 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5913, i32 0, i32 3
%.tmp5915 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5914
%.tmp5916 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5912, %m1861$.Type.type* %.tmp5915)
%.tmp5917 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5918 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5917)
%.tmp5919 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5902, i8* %.tmp5904, i8* %.tmp5906, i8* %.tmp5911, i8* %.tmp5916, i8* %.tmp5918)
%.tmp5920 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.5890
store %m1861$.AssignableInfo.type* %.tmp5920, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp5921 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5877
%.tmp5922 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5921, i32 0, i32 3
%.tmp5923 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5922
store %m1861$.Type.type* %.tmp5923, %m1861$.Type.type** %struct_info.5877
br label %.for.start.5878
.for.end.5878:
%.tmp5924 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5877
%.tmp5925 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5924, i32 0, i32 0
%.tmp5926 = load i8*, i8** %.tmp5925
%.tmp5928 = getelementptr [10 x i8], [10 x i8]*@.str5927, i32 0, i32 0
%.tmp5929 = call i32(i8*,i8*) @strcmp(i8* %.tmp5926, i8* %.tmp5928)
%.tmp5930 = icmp eq i32 %.tmp5929, 0
br i1 %.tmp5930, label %.if.true.5931, label %.if.false.5931
.if.true.5931:
%.tmp5932 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5877
%.tmp5933 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5932, i32 0, i32 3
%.tmp5934 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5933
store %m1861$.Type.type* %.tmp5934, %m1861$.Type.type** %struct_info.5877
br label %.if.end.5931
.if.false.5931:
br label %.if.end.5931
.if.end.5931:
%.tmp5935 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5877
%.tmp5936 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5935, i32 0, i32 0
%.tmp5937 = load i8*, i8** %.tmp5936
%.tmp5939 = getelementptr [7 x i8], [7 x i8]*@.str5938, i32 0, i32 0
%.tmp5940 = call i32(i8*,i8*) @strcmp(i8* %.tmp5937, i8* %.tmp5939)
%.tmp5941 = icmp ne i32 %.tmp5940, 0
br i1 %.tmp5941, label %.if.true.5942, label %.if.false.5942
.if.true.5942:
%.tmp5943 = getelementptr i8*, i8** %err_msg.5807, i32 0
%.tmp5945 = getelementptr [48 x i8], [48 x i8]*@.str5944, i32 0, i32 0
%.tmp5946 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5947 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5946, i32 0, i32 7
%.tmp5948 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5947
%.tmp5949 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5948, i32 0, i32 7
%.tmp5950 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5949
%.tmp5951 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5950, i32 0, i32 1
%.tmp5952 = load i8*, i8** %.tmp5951
%.tmp5953 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5954 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5953, i32 0, i32 1
%.tmp5955 = load i8*, i8** %.tmp5954
%.tmp5956 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5943, i8* %.tmp5945, i8* %.tmp5952, i8* %.tmp5955)
%.tmp5957 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5958 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5959 = load i8*, i8** %err_msg.5807
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5957, %m307$.Node.type* %.tmp5958, i8* %.tmp5959)
%.tmp5960 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5960
br label %.if.end.5942
.if.false.5942:
br label %.if.end.5942
.if.end.5942:
%.tmp5961 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5962 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5961, i32 0, i32 7
%.tmp5963 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5962
%.tmp5964 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5963, i32 0, i32 7
%.tmp5965 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5964
%.tmp5966 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5965, i32 0, i32 1
%.tmp5967 = load i8*, i8** %.tmp5966
%field_name.5968 = alloca i8*
store i8* %.tmp5967, i8** %field_name.5968
%field_id.5969 = alloca i32
store i32 0, i32* %field_id.5969
%.tmp5970 = bitcast ptr null to %m1861$.Type.type*
%found_field.5971 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5970, %m1861$.Type.type** %found_field.5971
%.tmp5973 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5877
%.tmp5974 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5973, i32 0, i32 3
%.tmp5975 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5974
%field.5976 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5975, %m1861$.Type.type** %field.5976
br label %.for.start.5972
.for.start.5972:
%.tmp5977 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5976
%.tmp5978 = icmp ne %m1861$.Type.type* %.tmp5977, null
br i1 %.tmp5978, label %.for.continue.5972, label %.for.end.5972
.for.continue.5972:
%.tmp5979 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5976
%.tmp5980 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5979, i32 0, i32 1
%.tmp5981 = load i8*, i8** %.tmp5980
%.tmp5982 = load i8*, i8** %field_name.5968
%.tmp5983 = call i32(i8*,i8*) @strcmp(i8* %.tmp5981, i8* %.tmp5982)
%.tmp5984 = icmp eq i32 %.tmp5983, 0
br i1 %.tmp5984, label %.if.true.5985, label %.if.false.5985
.if.true.5985:
%.tmp5986 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5976
store %m1861$.Type.type* %.tmp5986, %m1861$.Type.type** %found_field.5971
br label %.for.end.5972
br label %.if.end.5985
.if.false.5985:
%.tmp5987 = load i32, i32* %field_id.5969
%.tmp5988 = add i32 %.tmp5987, 1
store i32 %.tmp5988, i32* %field_id.5969
br label %.if.end.5985
.if.end.5985:
%.tmp5989 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5976
%.tmp5990 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5989, i32 0, i32 4
%.tmp5991 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5990
store %m1861$.Type.type* %.tmp5991, %m1861$.Type.type** %field.5976
br label %.for.start.5972
.for.end.5972:
%.tmp5992 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5971
%.tmp5993 = icmp eq %m1861$.Type.type* %.tmp5992, null
br i1 %.tmp5993, label %.if.true.5994, label %.if.false.5994
.if.true.5994:
%.tmp5995 = getelementptr i8*, i8** %err_msg.5807, i32 0
%.tmp5997 = getelementptr [34 x i8], [34 x i8]*@.str5996, i32 0, i32 0
%.tmp5998 = load i8*, i8** %field_name.5968
%.tmp5999 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6000 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5999, i32 0, i32 1
%.tmp6001 = load i8*, i8** %.tmp6000
%.tmp6002 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5995, i8* %.tmp5997, i8* %.tmp5998, i8* %.tmp6001)
%.tmp6003 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6004 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6005 = load i8*, i8** %err_msg.5807
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6003, %m307$.Node.type* %.tmp6004, i8* %.tmp6005)
%.tmp6006 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6006
br label %.if.end.5994
.if.false.5994:
br label %.if.end.5994
.if.end.5994:
%.tmp6007 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6008 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6007)
%new_info.6009 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6008, %m1861$.AssignableInfo.type** %new_info.6009
%.tmp6010 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6009
%.tmp6011 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6010, i32 0, i32 3
%.tmp6012 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.5971
store %m1861$.Type.type* %.tmp6012, %m1861$.Type.type** %.tmp6011
%.tmp6013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6014 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6009
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6013, %m1861$.AssignableInfo.type* %.tmp6014)
%.tmp6015 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6009
%.tmp6016 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6015, i32 0, i32 2
%.tmp6018 = getelementptr [9 x i8], [9 x i8]*@.str6017, i32 0, i32 0
store i8* %.tmp6018, i8** %.tmp6016
%.tmp6019 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6020 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp6021 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6020, i32 0, i32 3
%.tmp6022 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6021
%.tmp6023 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6019, %m1861$.Type.type* %.tmp6022)
%info_tr.6024 = alloca i8*
store i8* %.tmp6023, i8** %info_tr.6024
%.tmp6025 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6026 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6025, i32 0, i32 1
%.tmp6027 = load %m0$.File.type*, %m0$.File.type** %.tmp6026
%.tmp6029 = getelementptr [46 x i8], [46 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6009
%.tmp6031 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6030)
%.tmp6032 = load i8*, i8** %info_tr.6024
%.tmp6033 = load i8*, i8** %info_tr.6024
%.tmp6034 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5873
%.tmp6035 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6034)
%.tmp6036 = load i32, i32* %field_id.5969
%.tmp6037 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6027, i8* %.tmp6029, i8* %.tmp6031, i8* %.tmp6032, i8* %.tmp6033, i8* %.tmp6035, i32 %.tmp6036)
%.tmp6038 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6039 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6040 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6039, i32 0, i32 7
%.tmp6041 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6040
%.tmp6042 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6041, i32 0, i32 7
%.tmp6043 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6042
%.tmp6044 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6009
%.tmp6045 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6038, %m307$.Node.type* %.tmp6043, %m1861$.AssignableInfo.type* %.tmp6044)
ret %m1861$.AssignableInfo.type* %.tmp6045
br label %.if.end.5871
.if.false.5871:
%.tmp6046 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6047 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6046, i32 0, i32 2
%.tmp6048 = load i8*, i8** %.tmp6047
%.tmp6050 = getelementptr [9 x i8], [9 x i8]*@.str6049, i32 0, i32 0
%.tmp6051 = call i32(i8*,i8*) @strcmp(i8* %.tmp6048, i8* %.tmp6050)
%.tmp6052 = icmp eq i32 %.tmp6051, 0
br i1 %.tmp6052, label %.if.true.6053, label %.if.false.6053
.if.true.6053:
%.tmp6054 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp6054
br label %.if.end.6053
.if.false.6053:
br label %.if.end.6053
.if.end.6053:
br label %.if.end.5871
.if.end.5871:
br label %.if.end.5834
.if.end.5834:
%.tmp6055 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6056 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6058 = getelementptr [43 x i8], [43 x i8]*@.str6057, i32 0, i32 0
%.tmp6059 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6055, %m307$.Node.type* %.tmp6056, i8* %.tmp6058)
%.tmp6060 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6061 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6060, i32 0, i32 2
%.tmp6062 = load i8*, i8** %.tmp6061
%.tmp6063 = call i32(i8*,...) @printf(i8* %.tmp6059, i8* %.tmp6062)
%.tmp6064 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6064
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.6065 = alloca i8*
store i8* null, i8** %err_msg.6065
%.tmp6066 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.6067 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6066, %m307$.Node.type** %curr_node.6067
%.tmp6068 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6069 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6068, i32 0, i32 0
%.tmp6070 = load i8*, i8** %.tmp6069
%.tmp6072 = getelementptr [17 x i8], [17 x i8]*@.str6071, i32 0, i32 0
%.tmp6073 = call i32(i8*,i8*) @strcmp(i8* %.tmp6070, i8* %.tmp6072)
%.tmp6074 = icmp eq i32 %.tmp6073, 0
%.tmp6075 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6076 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6075, i32 0, i32 0
%.tmp6077 = load i8*, i8** %.tmp6076
%.tmp6079 = getelementptr [16 x i8], [16 x i8]*@.str6078, i32 0, i32 0
%.tmp6080 = call i32(i8*,i8*) @strcmp(i8* %.tmp6077, i8* %.tmp6079)
%.tmp6081 = icmp eq i32 %.tmp6080, 0
%.tmp6082 = or i1 %.tmp6074, %.tmp6081
%.tmp6083 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6084 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6083, i32 0, i32 0
%.tmp6085 = load i8*, i8** %.tmp6084
%.tmp6087 = getelementptr [11 x i8], [11 x i8]*@.str6086, i32 0, i32 0
%.tmp6088 = call i32(i8*,i8*) @strcmp(i8* %.tmp6085, i8* %.tmp6087)
%.tmp6089 = icmp eq i32 %.tmp6088, 0
%.tmp6090 = or i1 %.tmp6082, %.tmp6089
br i1 %.tmp6090, label %.if.true.6091, label %.if.false.6091
.if.true.6091:
%.tmp6092 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6093 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6094 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6093, i32 0, i32 6
%.tmp6095 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6094
%.tmp6096 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6092, %m307$.Node.type* %.tmp6095)
ret %m1861$.AssignableInfo.type* %.tmp6096
br label %.if.end.6091
.if.false.6091:
br label %.if.end.6091
.if.end.6091:
%.tmp6097 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6098 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6097, i32 0, i32 0
%.tmp6099 = load i8*, i8** %.tmp6098
%.tmp6101 = getelementptr [12 x i8], [12 x i8]*@.str6100, i32 0, i32 0
%.tmp6102 = call i32(i8*,i8*) @strcmp(i8* %.tmp6099, i8* %.tmp6101)
%.tmp6103 = icmp ne i32 %.tmp6102, 0
br i1 %.tmp6103, label %.if.true.6104, label %.if.false.6104
.if.true.6104:
%.tmp6106 = getelementptr [92 x i8], [92 x i8]*@.str6105, i32 0, i32 0
%.tmp6107 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6108 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6107, i32 0, i32 0
%.tmp6109 = load i8*, i8** %.tmp6108
%.tmp6110 = call i32(i8*,...) @printf(i8* %.tmp6106, i8* %.tmp6109)
%.tmp6111 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6112 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6111, i32 0, i32 6
%.tmp6113 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6112
store %m307$.Node.type* %.tmp6113, %m307$.Node.type** %curr_node.6067
br label %.if.end.6104
.if.false.6104:
br label %.if.end.6104
.if.end.6104:
%.tmp6114 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6115 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6114, i32 0, i32 6
%.tmp6116 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6115
%assignable_name.6117 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6116, %m307$.Node.type** %assignable_name.6117
%.tmp6118 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6119 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6120 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6119, i32 0, i32 7
%.tmp6121 = load i8*, i8** %.tmp6120
%.tmp6122 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6123 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6122, i32 0, i32 6
%.tmp6124 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6123
%.tmp6125 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6124, i32 0, i32 1
%.tmp6126 = load i8*, i8** %.tmp6125
%.tmp6127 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6118, i8* %.tmp6121, i8* %.tmp6126)
%scope_info.6128 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp6127, %m1861$.ScopeItem.type** %scope_info.6128
%.tmp6129 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6128
%.tmp6130 = icmp eq %m1861$.ScopeItem.type* %.tmp6129, null
br i1 %.tmp6130, label %.if.true.6131, label %.if.false.6131
.if.true.6131:
%.tmp6132 = getelementptr i8*, i8** %err_msg.6065, i32 0
%.tmp6134 = getelementptr [41 x i8], [41 x i8]*@.str6133, i32 0, i32 0
%.tmp6135 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6136 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6135, i32 0, i32 6
%.tmp6137 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6136
%.tmp6138 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6137, i32 0, i32 1
%.tmp6139 = load i8*, i8** %.tmp6138
%.tmp6140 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6132, i8* %.tmp6134, i8* %.tmp6139)
%.tmp6141 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6142 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6143 = load i8*, i8** %err_msg.6065
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6141, %m307$.Node.type* %.tmp6142, i8* %.tmp6143)
%.tmp6144 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6144
br label %.if.end.6131
.if.false.6131:
br label %.if.end.6131
.if.end.6131:
%.tmp6145 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6128
%.tmp6146 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6145, i32 0, i32 1
%.tmp6147 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6146
%info.6148 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6147, %m1861$.AssignableInfo.type** %info.6148
%.tmp6149 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6148
%.tmp6150 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6149, i32 0, i32 2
%.tmp6151 = load i8*, i8** %.tmp6150
%.tmp6153 = getelementptr [7 x i8], [7 x i8]*@.str6152, i32 0, i32 0
%.tmp6154 = call i32(i8*,i8*) @strcmp(i8* %.tmp6151, i8* %.tmp6153)
%.tmp6155 = icmp eq i32 %.tmp6154, 0
br i1 %.tmp6155, label %.if.true.6156, label %.if.false.6156
.if.true.6156:
%.tmp6157 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6158 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6148
%.tmp6159 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6158)
%.tmp6160 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6161 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6160, i32 0, i32 6
%.tmp6162 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6161
%.tmp6163 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6162, i32 0, i32 7
%.tmp6164 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6163
%.tmp6165 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6164, i32 0, i32 7
%.tmp6166 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6165
%.tmp6167 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6166, i32 0, i32 1
%.tmp6168 = load i8*, i8** %.tmp6167
%.tmp6169 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6157, i8* %.tmp6159, i8* %.tmp6168)
store %m1861$.ScopeItem.type* %.tmp6169, %m1861$.ScopeItem.type** %scope_info.6128
%.tmp6170 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6128
%.tmp6171 = icmp eq %m1861$.ScopeItem.type* %.tmp6170, null
br i1 %.tmp6171, label %.if.true.6172, label %.if.false.6172
.if.true.6172:
%.tmp6173 = getelementptr i8*, i8** %err_msg.6065, i32 0
%.tmp6175 = getelementptr [31 x i8], [31 x i8]*@.str6174, i32 0, i32 0
%.tmp6176 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6177 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6176, i32 0, i32 6
%.tmp6178 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6177
%.tmp6179 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6178, i32 0, i32 7
%.tmp6180 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6179
%.tmp6181 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6180, i32 0, i32 7
%.tmp6182 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6181
%.tmp6183 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6182, i32 0, i32 1
%.tmp6184 = load i8*, i8** %.tmp6183
%.tmp6185 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6148
%.tmp6186 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6185)
%.tmp6187 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6173, i8* %.tmp6175, i8* %.tmp6184, i8* %.tmp6186)
%.tmp6188 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6189 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6190 = load i8*, i8** %err_msg.6065
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6188, %m307$.Node.type* %.tmp6189, i8* %.tmp6190)
%.tmp6191 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6191
br label %.if.end.6172
.if.false.6172:
br label %.if.end.6172
.if.end.6172:
%.tmp6192 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6128
%.tmp6193 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6192, i32 0, i32 1
%.tmp6194 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6193
store %m1861$.AssignableInfo.type* %.tmp6194, %m1861$.AssignableInfo.type** %info.6148
%.tmp6195 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6195, i32 0, i32 6
%.tmp6197 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6196
%.tmp6198 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6197, i32 0, i32 7
%.tmp6199 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6198
%.tmp6200 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6199, i32 0, i32 7
%.tmp6201 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6200
store %m307$.Node.type* %.tmp6201, %m307$.Node.type** %assignable_name.6117
br label %.if.end.6156
.if.false.6156:
%.tmp6202 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6203 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6202, i32 0, i32 6
%.tmp6204 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6203
store %m307$.Node.type* %.tmp6204, %m307$.Node.type** %assignable_name.6117
br label %.if.end.6156
.if.end.6156:
%.tmp6205 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6206 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6117
%.tmp6207 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6148
%.tmp6208 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6205, %m307$.Node.type* %.tmp6206, %m1861$.AssignableInfo.type* %.tmp6207)
%base.6209 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6208, %m1861$.AssignableInfo.type** %base.6209
%.tmp6211 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6212 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6211, i32 0, i32 6
%.tmp6213 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6212
%.tmp6214 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6213, i32 0, i32 7
%.tmp6215 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6214
%addr.6216 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6215, %m307$.Node.type** %addr.6216
br label %.for.start.6210
.for.start.6210:
%.tmp6217 = load %m307$.Node.type*, %m307$.Node.type** %addr.6216
%.tmp6218 = icmp ne %m307$.Node.type* %.tmp6217, null
br i1 %.tmp6218, label %.for.continue.6210, label %.for.end.6210
.for.continue.6210:
%.tmp6219 = load %m307$.Node.type*, %m307$.Node.type** %addr.6216
%.tmp6220 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6219, i32 0, i32 7
%.tmp6221 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6220
%index.6222 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6221, %m307$.Node.type** %index.6222
%.tmp6223 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6224 = load %m307$.Node.type*, %m307$.Node.type** %index.6222
%.tmp6225 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6223, %m307$.Node.type* %.tmp6224)
%index_info.6226 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6225, %m1861$.AssignableInfo.type** %index_info.6226
%.tmp6227 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6228 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6226
%.tmp6229 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6228, i32 0, i32 3
%.tmp6230 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6229
%.tmp6231 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6227, %m1861$.Type.type* %.tmp6230)
%index_type.6232 = alloca i8*
store i8* %.tmp6231, i8** %index_type.6232
%.tmp6233 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6234 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6233, i32 0, i32 3
%.tmp6235 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6234
%.tmp6236 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6235, i32 0, i32 1
%.tmp6237 = load i8*, i8** %.tmp6236
%.tmp6238 = icmp ne i8* %.tmp6237, null
br i1 %.tmp6238, label %.if.true.6239, label %.if.false.6239
.if.true.6239:
%.tmp6240 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6241 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6240, i32 0, i32 3
%.tmp6242 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6241
%.tmp6243 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6242, i32 0, i32 1
%.tmp6244 = load i8*, i8** %.tmp6243
%.tmp6246 = getelementptr [6 x i8], [6 x i8]*@.str6245, i32 0, i32 0
%.tmp6247 = call i32(i8*,i8*) @strcmp(i8* %.tmp6244, i8* %.tmp6246)
%.tmp6248 = icmp eq i32 %.tmp6247, 0
br i1 %.tmp6248, label %.if.true.6249, label %.if.false.6249
.if.true.6249:
%.tmp6250 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6251 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6250)
%new_base.6252 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6251, %m1861$.AssignableInfo.type** %new_base.6252
%.tmp6253 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6254 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6252
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6253, %m1861$.AssignableInfo.type* %.tmp6254)
%.tmp6255 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6256 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6255, i32 0, i32 1
%.tmp6257 = load %m0$.File.type*, %m0$.File.type** %.tmp6256
%.tmp6259 = getelementptr [45 x i8], [45 x i8]*@.str6258, i32 0, i32 0
%.tmp6260 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6252
%.tmp6261 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6260)
%.tmp6262 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6263 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6264 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6263, i32 0, i32 3
%.tmp6265 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6264
%.tmp6266 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6262, %m1861$.Type.type* %.tmp6265)
%.tmp6267 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6268 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6269 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6268, i32 0, i32 3
%.tmp6270 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6269
%.tmp6271 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6267, %m1861$.Type.type* %.tmp6270)
%.tmp6272 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6273 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6272)
%.tmp6274 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6257, i8* %.tmp6259, i8* %.tmp6261, i8* %.tmp6266, i8* %.tmp6271, i8* %.tmp6273)
%.tmp6275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6252
%.tmp6276 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6275, i32 0, i32 3
%.tmp6277 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6278 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6277, i32 0, i32 3
%.tmp6279 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6278
%.tmp6280 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6279, i32 0, i32 3
%.tmp6281 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6280
%.tmp6282 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp6281)
store %m1861$.Type.type* %.tmp6282, %m1861$.Type.type** %.tmp6276
%.tmp6283 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6252
%.tmp6284 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6283, i32 0, i32 3
%.tmp6285 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6284
%.tmp6286 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6285, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6286
%.tmp6287 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6252
store %m1861$.AssignableInfo.type* %.tmp6287, %m1861$.AssignableInfo.type** %base.6209
br label %.if.end.6249
.if.false.6249:
br label %.if.end.6249
.if.end.6249:
br label %.if.end.6239
.if.false.6239:
br label %.if.end.6239
.if.end.6239:
%.tmp6288 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6289 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6290 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6289, i32 0, i32 3
%.tmp6291 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6290
%.tmp6292 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6288, %m1861$.Type.type* %.tmp6291)
%base_type.6293 = alloca i8*
store i8* %.tmp6292, i8** %base_type.6293
%.tmp6294 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6295 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6294)
%tmp_id.6296 = alloca i32
store i32 %.tmp6295, i32* %tmp_id.6296
%.tmp6297 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6298 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6297, i32 0, i32 1
%.tmp6299 = load %m0$.File.type*, %m0$.File.type** %.tmp6298
%.tmp6301 = getelementptr [28 x i8], [28 x i8]*@.str6300, i32 0, i32 0
%.tmp6302 = load i32, i32* %tmp_id.6296
%.tmp6303 = load i8*, i8** %base_type.6293
%.tmp6304 = load i8*, i8** %base_type.6293
%.tmp6305 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6306 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6305)
%.tmp6307 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6299, i8* %.tmp6301, i32 %.tmp6302, i8* %.tmp6303, i8* %.tmp6304, i8* %.tmp6306)
%.tmp6308 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6067
%.tmp6309 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6308)
%new_base.6310 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6309, %m1861$.AssignableInfo.type** %new_base.6310
%.tmp6311 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6312 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6310
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6311, %m1861$.AssignableInfo.type* %.tmp6312)
%.tmp6313 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6314 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6313, i32 0, i32 3
%.tmp6315 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6314
%.tmp6316 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6315, i32 0, i32 3
%.tmp6317 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6316
%.tmp6318 = icmp eq %m1861$.Type.type* %.tmp6317, null
br i1 %.tmp6318, label %.if.true.6319, label %.if.false.6319
.if.true.6319:
%.tmp6320 = getelementptr i8*, i8** %err_msg.6065, i32 0
%.tmp6322 = getelementptr [35 x i8], [35 x i8]*@.str6321, i32 0, i32 0
%.tmp6323 = load i8*, i8** %base_type.6293
%.tmp6324 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6320, i8* %.tmp6322, i8* %.tmp6323)
%.tmp6325 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6326 = load %m307$.Node.type*, %m307$.Node.type** %addr.6216
%.tmp6327 = load i8*, i8** %err_msg.6065
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6325, %m307$.Node.type* %.tmp6326, i8* %.tmp6327)
%.tmp6328 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
ret %m1861$.AssignableInfo.type* %.tmp6328
br label %.if.end.6319
.if.false.6319:
br label %.if.end.6319
.if.end.6319:
%.tmp6329 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6310
%.tmp6330 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6329, i32 0, i32 3
%.tmp6331 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
%.tmp6332 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6331, i32 0, i32 3
%.tmp6333 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6332
%.tmp6334 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6333, i32 0, i32 3
%.tmp6335 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6334
store %m1861$.Type.type* %.tmp6335, %m1861$.Type.type** %.tmp6330
%.tmp6336 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6337 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6310
%.tmp6338 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6337, i32 0, i32 3
%.tmp6339 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6338
%.tmp6340 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6336, %m1861$.Type.type* %.tmp6339)
%base_type_2.6341 = alloca i8*
store i8* %.tmp6340, i8** %base_type_2.6341
%.tmp6342 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6343 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6342, i32 0, i32 1
%.tmp6344 = load %m0$.File.type*, %m0$.File.type** %.tmp6343
%.tmp6346 = getelementptr [44 x i8], [44 x i8]*@.str6345, i32 0, i32 0
%.tmp6347 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6310
%.tmp6348 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6347)
%.tmp6349 = load i8*, i8** %base_type_2.6341
%.tmp6350 = load i8*, i8** %base_type_2.6341
%.tmp6351 = load i32, i32* %tmp_id.6296
%.tmp6352 = load i8*, i8** %index_type.6232
%.tmp6353 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6226
%.tmp6354 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6353)
%.tmp6355 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6344, i8* %.tmp6346, i8* %.tmp6348, i8* %.tmp6349, i8* %.tmp6350, i32 %.tmp6351, i8* %.tmp6352, i8* %.tmp6354)
%.tmp6356 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6310
store %m1861$.AssignableInfo.type* %.tmp6356, %m1861$.AssignableInfo.type** %base.6209
%.tmp6357 = load %m307$.Node.type*, %m307$.Node.type** %addr.6216
%.tmp6358 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6357, i32 0, i32 7
%.tmp6359 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6358
%.tmp6360 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6359, i32 0, i32 7
%.tmp6361 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6360
%.tmp6362 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6361, i32 0, i32 7
%.tmp6363 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6362
store %m307$.Node.type* %.tmp6363, %m307$.Node.type** %addr.6216
br label %.for.start.6210
.for.end.6210:
%.tmp6364 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6209
ret %m1861$.AssignableInfo.type* %.tmp6364
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6365 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6366 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6365, i32 0, i32 6
%.tmp6367 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6366
%.tmp6369 = getelementptr [16 x i8], [16 x i8]*@.str6368, i32 0, i32 0
%.tmp6370 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6367, i8* %.tmp6369)
%assignable_start.6371 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6370, %m307$.Node.type** %assignable_start.6371
%.tmp6372 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6371
%.tmp6373 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6372)
%operator_stack.6374 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6373, %m1988$.SYStack.type** %operator_stack.6374
%.tmp6375 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6376 = ptrtoint %m1861$.StackHead.type* %.tmp6375 to i32
%.tmp6377 = call i8*(i32) @malloc(i32 %.tmp6376)
%.tmp6378 = bitcast i8* %.tmp6377 to %m1861$.StackHead.type*
%stack.6379 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6378, %m1861$.StackHead.type** %stack.6379
%.tmp6380 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6379
%.tmp6381 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6380, i32 0, i32 0
%.tmp6382 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6374
store %m1988$.SYStack.type* %.tmp6382, %m1988$.SYStack.type** %.tmp6381
%.tmp6383 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6384 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6379
%.tmp6385 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6383, %m1861$.StackHead.type* %.tmp6384)
%info.6386 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6385, %m1861$.AssignableInfo.type** %info.6386
%.tmp6387 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
%.tmp6388 = icmp eq %m1861$.AssignableInfo.type* %.tmp6387, null
br i1 %.tmp6388, label %.if.true.6389, label %.if.false.6389
.if.true.6389:
%.tmp6390 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
ret %m1861$.AssignableInfo.type* %.tmp6390
br label %.if.end.6389
.if.false.6389:
br label %.if.end.6389
.if.end.6389:
%.tmp6391 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6392 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6391, i32 0, i32 6
%.tmp6393 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6392
%.tmp6395 = getelementptr [5 x i8], [5 x i8]*@.str6394, i32 0, i32 0
%.tmp6396 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6393, i8* %.tmp6395)
%cast.6397 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6396, %m307$.Node.type** %cast.6397
%.tmp6398 = load %m307$.Node.type*, %m307$.Node.type** %cast.6397
%.tmp6399 = icmp ne %m307$.Node.type* %.tmp6398, null
br i1 %.tmp6399, label %.if.true.6400, label %.if.false.6400
.if.true.6400:
%.tmp6401 = load %m307$.Node.type*, %m307$.Node.type** %cast.6397
%.tmp6402 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6401, i32 0, i32 6
%.tmp6403 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6402
%.tmp6405 = getelementptr [5 x i8], [5 x i8]*@.str6404, i32 0, i32 0
%.tmp6406 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6403, i8* %.tmp6405)
%cast_type.6407 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6406, %m307$.Node.type** %cast_type.6407
%.tmp6408 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6409 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6407
%.tmp6410 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6409, i32 0, i32 6
%.tmp6411 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6410
%.tmp6412 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6408, %m307$.Node.type* %.tmp6411)
%type.6413 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6412, %m1861$.Type.type** %type.6413
%.tmp6414 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
%.tmp6415 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6414)
%prev_id.6416 = alloca i8*
store i8* %.tmp6415, i8** %prev_id.6416
%.tmp6417 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6418 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6417, %m1861$.AssignableInfo.type* %.tmp6418)
%.tmp6419 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6420 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
%.tmp6421 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6420, i32 0, i32 3
%.tmp6422 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6421
%.tmp6423 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6419, %m1861$.Type.type* %.tmp6422)
%from_type.6424 = alloca i8*
store i8* %.tmp6423, i8** %from_type.6424
%.tmp6425 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6426 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6413
%.tmp6427 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6425, %m1861$.Type.type* %.tmp6426)
%to_type.6428 = alloca i8*
store i8* %.tmp6427, i8** %to_type.6428
%.tmp6430 = getelementptr [8 x i8], [8 x i8]*@.str6429, i32 0, i32 0
%cast_fn.6431 = alloca i8*
store i8* %.tmp6430, i8** %cast_fn.6431
%.tmp6432 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
%.tmp6433 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6432, i32 0, i32 3
%.tmp6434 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6433
%.tmp6435 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6434, i32 0, i32 0
%.tmp6436 = load i8*, i8** %.tmp6435
%.tmp6438 = getelementptr [4 x i8], [4 x i8]*@.str6437, i32 0, i32 0
%.tmp6439 = call i32(i8*,i8*) @strcmp(i8* %.tmp6436, i8* %.tmp6438)
%.tmp6440 = icmp ne i32 %.tmp6439, 0
%.tmp6441 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6413
%.tmp6442 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6441, i32 0, i32 0
%.tmp6443 = load i8*, i8** %.tmp6442
%.tmp6445 = getelementptr [4 x i8], [4 x i8]*@.str6444, i32 0, i32 0
%.tmp6446 = call i32(i8*,i8*) @strcmp(i8* %.tmp6443, i8* %.tmp6445)
%.tmp6447 = icmp ne i32 %.tmp6446, 0
%.tmp6448 = and i1 %.tmp6440, %.tmp6447
br i1 %.tmp6448, label %.if.true.6449, label %.if.false.6449
.if.true.6449:
%.tmp6450 = load i8*, i8** %from_type.6424
%.tmp6451 = getelementptr i8, i8* %.tmp6450, i32 0
%.tmp6452 = load i8, i8* %.tmp6451
%.tmp6453 = icmp eq i8 %.tmp6452, 105
%.tmp6454 = load i8*, i8** %to_type.6428
%.tmp6455 = getelementptr i8, i8* %.tmp6454, i32 0
%.tmp6456 = load i8, i8* %.tmp6455
%.tmp6457 = icmp eq i8 %.tmp6456, 105
%.tmp6458 = and i1 %.tmp6453, %.tmp6457
br i1 %.tmp6458, label %.if.true.6459, label %.if.false.6459
.if.true.6459:
%from_size.6460 = alloca i32
store i32 0, i32* %from_size.6460
%to_size.6461 = alloca i32
store i32 0, i32* %to_size.6461
%.tmp6462 = load i8*, i8** %from_type.6424
%.tmp6464 = getelementptr [4 x i8], [4 x i8]*@.str6463, i32 0, i32 0
%.tmp6465 = getelementptr i32, i32* %from_size.6460, i32 0
%.tmp6466 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6462, i8* %.tmp6464, i32* %.tmp6465)
%.tmp6467 = load i8*, i8** %to_type.6428
%.tmp6469 = getelementptr [4 x i8], [4 x i8]*@.str6468, i32 0, i32 0
%.tmp6470 = getelementptr i32, i32* %to_size.6461, i32 0
%.tmp6471 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6467, i8* %.tmp6469, i32* %.tmp6470)
%.tmp6472 = load i32, i32* %from_size.6460
%.tmp6473 = load i32, i32* %to_size.6461
%.tmp6474 = icmp slt i32 %.tmp6472, %.tmp6473
br i1 %.tmp6474, label %.if.true.6475, label %.if.false.6475
.if.true.6475:
%.tmp6477 = getelementptr [5 x i8], [5 x i8]*@.str6476, i32 0, i32 0
store i8* %.tmp6477, i8** %cast_fn.6431
br label %.if.end.6475
.if.false.6475:
%.tmp6479 = getelementptr [6 x i8], [6 x i8]*@.str6478, i32 0, i32 0
store i8* %.tmp6479, i8** %cast_fn.6431
br label %.if.end.6475
.if.end.6475:
br label %.if.end.6459
.if.false.6459:
br label %.if.end.6459
.if.end.6459:
br label %.if.end.6449
.if.false.6449:
br label %.if.end.6449
.if.end.6449:
%.tmp6480 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6481 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6480, i32 0, i32 1
%.tmp6482 = load %m0$.File.type*, %m0$.File.type** %.tmp6481
%.tmp6484 = getelementptr [21 x i8], [21 x i8]*@.str6483, i32 0, i32 0
%.tmp6485 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
%.tmp6486 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6485)
%.tmp6487 = load i8*, i8** %cast_fn.6431
%.tmp6488 = load i8*, i8** %from_type.6424
%.tmp6489 = load i8*, i8** %prev_id.6416
%.tmp6490 = load i8*, i8** %to_type.6428
%.tmp6491 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6482, i8* %.tmp6484, i8* %.tmp6486, i8* %.tmp6487, i8* %.tmp6488, i8* %.tmp6489, i8* %.tmp6490)
%.tmp6492 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
%.tmp6493 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6492, i32 0, i32 3
%.tmp6494 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6413
store %m1861$.Type.type* %.tmp6494, %m1861$.Type.type** %.tmp6493
br label %.if.end.6400
.if.false.6400:
br label %.if.end.6400
.if.end.6400:
%.tmp6495 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6386
ret %m1861$.AssignableInfo.type* %.tmp6495
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6496 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6497 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6496, i32 0, i32 0
%.tmp6498 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6497
%.tmp6499 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6498, i32 0, i32 0
%.tmp6500 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6499
%.tmp6501 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6500, i32 0, i32 0
%.tmp6502 = load i8*, i8** %.tmp6501
%.tmp6504 = getelementptr [16 x i8], [16 x i8]*@.str6503, i32 0, i32 0
%.tmp6505 = call i32(i8*,i8*) @strcmp(i8* %.tmp6502, i8* %.tmp6504)
%.tmp6506 = icmp eq i32 %.tmp6505, 0
br i1 %.tmp6506, label %.if.true.6507, label %.if.false.6507
.if.true.6507:
%.tmp6508 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6509 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6510 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6509, i32 0, i32 0
%.tmp6511 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6510
%.tmp6512 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6511, i32 0, i32 0
%.tmp6513 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6512
%.tmp6514 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6508, %m307$.Node.type* %.tmp6513)
ret %m1861$.AssignableInfo.type* %.tmp6514
br label %.if.end.6507
.if.false.6507:
br label %.if.end.6507
.if.end.6507:
%.tmp6515 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6516 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6515, i32 0, i32 0
%.tmp6517 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6516
%.tmp6518 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6517, i32 0, i32 0
%.tmp6519 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6518
%.tmp6520 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6519, i32 0, i32 6
%.tmp6521 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6520
%operator.6522 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6521, %m307$.Node.type** %operator.6522
%.tmp6523 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6524 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6523, i32 0, i32 0
%.tmp6525 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6526 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6525, i32 0, i32 0
%.tmp6527 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6526
%.tmp6528 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6527, i32 0, i32 1
%.tmp6529 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6528
store %m1988$.SYStack.type* %.tmp6529, %m1988$.SYStack.type** %.tmp6524
%.tmp6530 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6531 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6532 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6530, %m1861$.StackHead.type* %.tmp6531)
%A.6533 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6532, %m1861$.AssignableInfo.type** %A.6533
%.tmp6534 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6533
%.tmp6535 = icmp eq %m1861$.AssignableInfo.type* %.tmp6534, null
br i1 %.tmp6535, label %.if.true.6536, label %.if.false.6536
.if.true.6536:
%.tmp6537 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6533
ret %m1861$.AssignableInfo.type* %.tmp6537
br label %.if.end.6536
.if.false.6536:
br label %.if.end.6536
.if.end.6536:
%.tmp6538 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6539 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6538, i32 0, i32 0
%.tmp6540 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6541 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6540, i32 0, i32 0
%.tmp6542 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6541
%.tmp6543 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6542, i32 0, i32 1
%.tmp6544 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6543
store %m1988$.SYStack.type* %.tmp6544, %m1988$.SYStack.type** %.tmp6539
%.tmp6545 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6546 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6547 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6545, %m1861$.StackHead.type* %.tmp6546)
%B.6548 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6547, %m1861$.AssignableInfo.type** %B.6548
%.tmp6549 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6548
%.tmp6550 = icmp eq %m1861$.AssignableInfo.type* %.tmp6549, null
br i1 %.tmp6550, label %.if.true.6551, label %.if.false.6551
.if.true.6551:
%.tmp6552 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6548
ret %m1861$.AssignableInfo.type* %.tmp6552
br label %.if.end.6551
.if.false.6551:
br label %.if.end.6551
.if.end.6551:
%.tmp6553 = bitcast ptr null to %m307$.Node.type*
%.tmp6554 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6553)
%op_info.6555 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6554, %m1861$.AssignableInfo.type** %op_info.6555
%.tmp6556 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6555
%.tmp6557 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6556, i32 0, i32 3
%.tmp6558 = load %m307$.Node.type*, %m307$.Node.type** %operator.6522
%.tmp6559 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6558)
store %m1861$.Type.type* %.tmp6559, %m1861$.Type.type** %.tmp6557
%.tmp6560 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6561 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6555
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6560, %m1861$.AssignableInfo.type* %.tmp6561)
%.tmp6562 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6563 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6562, i32 0, i32 1
%.tmp6564 = load %m0$.File.type*, %m0$.File.type** %.tmp6563
%.tmp6566 = getelementptr [19 x i8], [19 x i8]*@.str6565, i32 0, i32 0
%.tmp6567 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6555
%.tmp6568 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6567)
%.tmp6569 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6570 = load %m307$.Node.type*, %m307$.Node.type** %operator.6522
%.tmp6571 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6569, %m307$.Node.type* %.tmp6570)
%.tmp6572 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6573 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6533
%.tmp6574 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6573, i32 0, i32 3
%.tmp6575 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6574
%.tmp6576 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6572, %m1861$.Type.type* %.tmp6575)
%.tmp6577 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6533
%.tmp6578 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6577)
%.tmp6579 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6548
%.tmp6580 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6579)
%.tmp6581 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6564, i8* %.tmp6566, i8* %.tmp6568, i8* %.tmp6571, i8* %.tmp6576, i8* %.tmp6578, i8* %.tmp6580)
%.tmp6582 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6555
ret %m1861$.AssignableInfo.type* %.tmp6582
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6583 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6584 = icmp eq %m307$.Node.type* %.tmp6583, null
br i1 %.tmp6584, label %.if.true.6585, label %.if.false.6585
.if.true.6585:
%.tmp6586 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6587 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6589 = getelementptr [31 x i8], [31 x i8]*@.str6588, i32 0, i32 0
%.tmp6590 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6586, %m307$.Node.type* %.tmp6587, i8* %.tmp6589)
%.tmp6591 = call i32(i8*,...) @printf(i8* %.tmp6590)
br label %.if.end.6585
.if.false.6585:
br label %.if.end.6585
.if.end.6585:
%.tmp6592 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6593 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6592, i32 0, i32 1
%.tmp6594 = load i8*, i8** %.tmp6593
%.tmp6596 = getelementptr [2 x i8], [2 x i8]*@.str6595, i32 0, i32 0
%.tmp6597 = call i32(i8*,i8*) @strcmp(i8* %.tmp6594, i8* %.tmp6596)
%.tmp6598 = icmp eq i32 %.tmp6597, 0
br i1 %.tmp6598, label %.if.true.6599, label %.if.false.6599
.if.true.6599:
%.tmp6601 = getelementptr [4 x i8], [4 x i8]*@.str6600, i32 0, i32 0
ret i8* %.tmp6601
br label %.if.end.6599
.if.false.6599:
%.tmp6602 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6603 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6602, i32 0, i32 1
%.tmp6604 = load i8*, i8** %.tmp6603
%.tmp6606 = getelementptr [2 x i8], [2 x i8]*@.str6605, i32 0, i32 0
%.tmp6607 = call i32(i8*,i8*) @strcmp(i8* %.tmp6604, i8* %.tmp6606)
%.tmp6608 = icmp eq i32 %.tmp6607, 0
br i1 %.tmp6608, label %.if.true.6609, label %.if.false.6609
.if.true.6609:
%.tmp6611 = getelementptr [4 x i8], [4 x i8]*@.str6610, i32 0, i32 0
ret i8* %.tmp6611
br label %.if.end.6609
.if.false.6609:
%.tmp6612 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6613 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6612, i32 0, i32 1
%.tmp6614 = load i8*, i8** %.tmp6613
%.tmp6616 = getelementptr [2 x i8], [2 x i8]*@.str6615, i32 0, i32 0
%.tmp6617 = call i32(i8*,i8*) @strcmp(i8* %.tmp6614, i8* %.tmp6616)
%.tmp6618 = icmp eq i32 %.tmp6617, 0
br i1 %.tmp6618, label %.if.true.6619, label %.if.false.6619
.if.true.6619:
%.tmp6621 = getelementptr [4 x i8], [4 x i8]*@.str6620, i32 0, i32 0
ret i8* %.tmp6621
br label %.if.end.6619
.if.false.6619:
%.tmp6622 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6623 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6622, i32 0, i32 1
%.tmp6624 = load i8*, i8** %.tmp6623
%.tmp6626 = getelementptr [2 x i8], [2 x i8]*@.str6625, i32 0, i32 0
%.tmp6627 = call i32(i8*,i8*) @strcmp(i8* %.tmp6624, i8* %.tmp6626)
%.tmp6628 = icmp eq i32 %.tmp6627, 0
br i1 %.tmp6628, label %.if.true.6629, label %.if.false.6629
.if.true.6629:
%.tmp6631 = getelementptr [5 x i8], [5 x i8]*@.str6630, i32 0, i32 0
ret i8* %.tmp6631
br label %.if.end.6629
.if.false.6629:
%.tmp6632 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6633 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6632, i32 0, i32 1
%.tmp6634 = load i8*, i8** %.tmp6633
%.tmp6636 = getelementptr [3 x i8], [3 x i8]*@.str6635, i32 0, i32 0
%.tmp6637 = call i32(i8*,i8*) @strcmp(i8* %.tmp6634, i8* %.tmp6636)
%.tmp6638 = icmp eq i32 %.tmp6637, 0
br i1 %.tmp6638, label %.if.true.6639, label %.if.false.6639
.if.true.6639:
%.tmp6641 = getelementptr [8 x i8], [8 x i8]*@.str6640, i32 0, i32 0
ret i8* %.tmp6641
br label %.if.end.6639
.if.false.6639:
%.tmp6642 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6643 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6642, i32 0, i32 1
%.tmp6644 = load i8*, i8** %.tmp6643
%.tmp6646 = getelementptr [3 x i8], [3 x i8]*@.str6645, i32 0, i32 0
%.tmp6647 = call i32(i8*,i8*) @strcmp(i8* %.tmp6644, i8* %.tmp6646)
%.tmp6648 = icmp eq i32 %.tmp6647, 0
br i1 %.tmp6648, label %.if.true.6649, label %.if.false.6649
.if.true.6649:
%.tmp6651 = getelementptr [8 x i8], [8 x i8]*@.str6650, i32 0, i32 0
ret i8* %.tmp6651
br label %.if.end.6649
.if.false.6649:
%.tmp6652 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6653 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6652, i32 0, i32 1
%.tmp6654 = load i8*, i8** %.tmp6653
%.tmp6656 = getelementptr [2 x i8], [2 x i8]*@.str6655, i32 0, i32 0
%.tmp6657 = call i32(i8*,i8*) @strcmp(i8* %.tmp6654, i8* %.tmp6656)
%.tmp6658 = icmp eq i32 %.tmp6657, 0
br i1 %.tmp6658, label %.if.true.6659, label %.if.false.6659
.if.true.6659:
%.tmp6661 = getelementptr [9 x i8], [9 x i8]*@.str6660, i32 0, i32 0
ret i8* %.tmp6661
br label %.if.end.6659
.if.false.6659:
%.tmp6662 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6663 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6662, i32 0, i32 1
%.tmp6664 = load i8*, i8** %.tmp6663
%.tmp6666 = getelementptr [2 x i8], [2 x i8]*@.str6665, i32 0, i32 0
%.tmp6667 = call i32(i8*,i8*) @strcmp(i8* %.tmp6664, i8* %.tmp6666)
%.tmp6668 = icmp eq i32 %.tmp6667, 0
br i1 %.tmp6668, label %.if.true.6669, label %.if.false.6669
.if.true.6669:
%.tmp6671 = getelementptr [9 x i8], [9 x i8]*@.str6670, i32 0, i32 0
ret i8* %.tmp6671
br label %.if.end.6669
.if.false.6669:
%.tmp6672 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6673 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6672, i32 0, i32 1
%.tmp6674 = load i8*, i8** %.tmp6673
%.tmp6676 = getelementptr [2 x i8], [2 x i8]*@.str6675, i32 0, i32 0
%.tmp6677 = call i32(i8*,i8*) @strcmp(i8* %.tmp6674, i8* %.tmp6676)
%.tmp6678 = icmp eq i32 %.tmp6677, 0
br i1 %.tmp6678, label %.if.true.6679, label %.if.false.6679
.if.true.6679:
%.tmp6681 = getelementptr [4 x i8], [4 x i8]*@.str6680, i32 0, i32 0
ret i8* %.tmp6681
br label %.if.end.6679
.if.false.6679:
%.tmp6682 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6683 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6682, i32 0, i32 1
%.tmp6684 = load i8*, i8** %.tmp6683
%.tmp6686 = getelementptr [2 x i8], [2 x i8]*@.str6685, i32 0, i32 0
%.tmp6687 = call i32(i8*,i8*) @strcmp(i8* %.tmp6684, i8* %.tmp6686)
%.tmp6688 = icmp eq i32 %.tmp6687, 0
br i1 %.tmp6688, label %.if.true.6689, label %.if.false.6689
.if.true.6689:
%.tmp6691 = getelementptr [3 x i8], [3 x i8]*@.str6690, i32 0, i32 0
ret i8* %.tmp6691
br label %.if.end.6689
.if.false.6689:
%.tmp6692 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6693 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6692, i32 0, i32 1
%.tmp6694 = load i8*, i8** %.tmp6693
%.tmp6696 = getelementptr [3 x i8], [3 x i8]*@.str6695, i32 0, i32 0
%.tmp6697 = call i32(i8*,i8*) @strcmp(i8* %.tmp6694, i8* %.tmp6696)
%.tmp6698 = icmp eq i32 %.tmp6697, 0
br i1 %.tmp6698, label %.if.true.6699, label %.if.false.6699
.if.true.6699:
%.tmp6701 = getelementptr [9 x i8], [9 x i8]*@.str6700, i32 0, i32 0
ret i8* %.tmp6701
br label %.if.end.6699
.if.false.6699:
%.tmp6702 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6703 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6702, i32 0, i32 1
%.tmp6704 = load i8*, i8** %.tmp6703
%.tmp6706 = getelementptr [3 x i8], [3 x i8]*@.str6705, i32 0, i32 0
%.tmp6707 = call i32(i8*,i8*) @strcmp(i8* %.tmp6704, i8* %.tmp6706)
%.tmp6708 = icmp eq i32 %.tmp6707, 0
br i1 %.tmp6708, label %.if.true.6709, label %.if.false.6709
.if.true.6709:
%.tmp6711 = getelementptr [9 x i8], [9 x i8]*@.str6710, i32 0, i32 0
ret i8* %.tmp6711
br label %.if.end.6709
.if.false.6709:
%.tmp6712 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6713 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6712, i32 0, i32 1
%.tmp6714 = load i8*, i8** %.tmp6713
%.tmp6716 = getelementptr [2 x i8], [2 x i8]*@.str6715, i32 0, i32 0
%.tmp6717 = call i32(i8*,i8*) @strcmp(i8* %.tmp6714, i8* %.tmp6716)
%.tmp6718 = icmp eq i32 %.tmp6717, 0
br i1 %.tmp6718, label %.if.true.6719, label %.if.false.6719
.if.true.6719:
%.tmp6721 = getelementptr [5 x i8], [5 x i8]*@.str6720, i32 0, i32 0
ret i8* %.tmp6721
br label %.if.end.6719
.if.false.6719:
%.tmp6722 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6723 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6725 = getelementptr [30 x i8], [30 x i8]*@.str6724, i32 0, i32 0
%.tmp6726 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6722, %m307$.Node.type* %.tmp6723, i8* %.tmp6725)
%.tmp6727 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6728 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6727, i32 0, i32 1
%.tmp6729 = load i8*, i8** %.tmp6728
%.tmp6730 = call i32(i8*,...) @printf(i8* %.tmp6726, i8* %.tmp6729)
br label %.if.end.6719
.if.end.6719:
br label %.if.end.6709
.if.end.6709:
br label %.if.end.6699
.if.end.6699:
br label %.if.end.6689
.if.end.6689:
br label %.if.end.6679
.if.end.6679:
br label %.if.end.6669
.if.end.6669:
br label %.if.end.6659
.if.end.6659:
br label %.if.end.6649
.if.end.6649:
br label %.if.end.6639
.if.end.6639:
br label %.if.end.6629
.if.end.6629:
br label %.if.end.6619
.if.end.6619:
br label %.if.end.6609
.if.end.6609:
br label %.if.end.6599
.if.end.6599:
%.tmp6732 = getelementptr [4 x i8], [4 x i8]*@.str6731, i32 0, i32 0
ret i8* %.tmp6732
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6733 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6734 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6733, %m1861$.Type.type** %type.6734
%.tmp6735 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6736 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6735, i32 0, i32 1
%.tmp6737 = load i8*, i8** %.tmp6736
%.tmp6739 = getelementptr [3 x i8], [3 x i8]*@.str6738, i32 0, i32 0
%.tmp6740 = call i32(i8*,i8*) @strcmp(i8* %.tmp6737, i8* %.tmp6739)
%.tmp6741 = icmp eq i32 %.tmp6740, 0
%.tmp6742 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6743 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6742, i32 0, i32 1
%.tmp6744 = load i8*, i8** %.tmp6743
%.tmp6746 = getelementptr [3 x i8], [3 x i8]*@.str6745, i32 0, i32 0
%.tmp6747 = call i32(i8*,i8*) @strcmp(i8* %.tmp6744, i8* %.tmp6746)
%.tmp6748 = icmp eq i32 %.tmp6747, 0
%.tmp6749 = or i1 %.tmp6741, %.tmp6748
%.tmp6750 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6751 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6750, i32 0, i32 1
%.tmp6752 = load i8*, i8** %.tmp6751
%.tmp6754 = getelementptr [2 x i8], [2 x i8]*@.str6753, i32 0, i32 0
%.tmp6755 = call i32(i8*,i8*) @strcmp(i8* %.tmp6752, i8* %.tmp6754)
%.tmp6756 = icmp eq i32 %.tmp6755, 0
%.tmp6757 = or i1 %.tmp6749, %.tmp6756
%.tmp6758 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6759 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6758, i32 0, i32 1
%.tmp6760 = load i8*, i8** %.tmp6759
%.tmp6762 = getelementptr [2 x i8], [2 x i8]*@.str6761, i32 0, i32 0
%.tmp6763 = call i32(i8*,i8*) @strcmp(i8* %.tmp6760, i8* %.tmp6762)
%.tmp6764 = icmp eq i32 %.tmp6763, 0
%.tmp6765 = or i1 %.tmp6757, %.tmp6764
%.tmp6766 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6767 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6766, i32 0, i32 1
%.tmp6768 = load i8*, i8** %.tmp6767
%.tmp6770 = getelementptr [2 x i8], [2 x i8]*@.str6769, i32 0, i32 0
%.tmp6771 = call i32(i8*,i8*) @strcmp(i8* %.tmp6768, i8* %.tmp6770)
%.tmp6772 = icmp eq i32 %.tmp6771, 0
%.tmp6773 = or i1 %.tmp6765, %.tmp6772
%.tmp6774 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6775 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6774, i32 0, i32 1
%.tmp6776 = load i8*, i8** %.tmp6775
%.tmp6778 = getelementptr [2 x i8], [2 x i8]*@.str6777, i32 0, i32 0
%.tmp6779 = call i32(i8*,i8*) @strcmp(i8* %.tmp6776, i8* %.tmp6778)
%.tmp6780 = icmp eq i32 %.tmp6779, 0
%.tmp6781 = or i1 %.tmp6773, %.tmp6780
%.tmp6782 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6783 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6782, i32 0, i32 1
%.tmp6784 = load i8*, i8** %.tmp6783
%.tmp6786 = getelementptr [3 x i8], [3 x i8]*@.str6785, i32 0, i32 0
%.tmp6787 = call i32(i8*,i8*) @strcmp(i8* %.tmp6784, i8* %.tmp6786)
%.tmp6788 = icmp eq i32 %.tmp6787, 0
%.tmp6789 = or i1 %.tmp6781, %.tmp6788
%.tmp6790 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6791 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6790, i32 0, i32 1
%.tmp6792 = load i8*, i8** %.tmp6791
%.tmp6794 = getelementptr [3 x i8], [3 x i8]*@.str6793, i32 0, i32 0
%.tmp6795 = call i32(i8*,i8*) @strcmp(i8* %.tmp6792, i8* %.tmp6794)
%.tmp6796 = icmp eq i32 %.tmp6795, 0
%.tmp6797 = or i1 %.tmp6789, %.tmp6796
br i1 %.tmp6797, label %.if.true.6798, label %.if.false.6798
.if.true.6798:
%.tmp6799 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6734
%.tmp6800 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6799, i32 0, i32 0
%.tmp6802 = getelementptr [5 x i8], [5 x i8]*@.str6801, i32 0, i32 0
store i8* %.tmp6802, i8** %.tmp6800
br label %.if.end.6798
.if.false.6798:
%.tmp6803 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6734
%.tmp6804 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6803, i32 0, i32 0
%.tmp6806 = getelementptr [4 x i8], [4 x i8]*@.str6805, i32 0, i32 0
store i8* %.tmp6806, i8** %.tmp6804
br label %.if.end.6798
.if.end.6798:
%.tmp6807 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6734
ret %m1861$.Type.type* %.tmp6807
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6808 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6809 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6808, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6810 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6811 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6810, %m307$.Node.type** %mono.6811
%err_buf.6812 = alloca i8*
store i8* null, i8** %err_buf.6812
%buf.6813 = alloca i8*
store i8* null, i8** %buf.6813
%.tmp6814 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6815 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6814, i32 0, i32 6
%.tmp6816 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6815
%.tmp6817 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6816, i32 0, i32 0
%.tmp6818 = load i8*, i8** %.tmp6817
%.tmp6820 = getelementptr [7 x i8], [7 x i8]*@.str6819, i32 0, i32 0
%.tmp6821 = call i32(i8*,i8*) @strcmp(i8* %.tmp6818, i8* %.tmp6820)
%.tmp6822 = icmp eq i32 %.tmp6821, 0
br i1 %.tmp6822, label %.if.true.6823, label %.if.false.6823
.if.true.6823:
%.tmp6824 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6825 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6824)
store %m1861$.AssignableInfo.type* %.tmp6825, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6826 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6827 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6826, i32 0, i32 3
%.tmp6828 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6828, %m1861$.Type.type** %.tmp6827
%.tmp6829 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6830 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6829, i32 0, i32 3
%.tmp6831 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6830
%.tmp6832 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6831, i32 0, i32 0
%.tmp6834 = getelementptr [4 x i8], [4 x i8]*@.str6833, i32 0, i32 0
store i8* %.tmp6834, i8** %.tmp6832
%.tmp6835 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6836 = load i8, i8* @SCOPE_CONST
%.tmp6837 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6838 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6837, i32 0, i32 6
%.tmp6839 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6838
%.tmp6840 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6839, i32 0, i32 1
%.tmp6841 = load i8*, i8** %.tmp6840
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6835, i8 %.tmp6836, i8* %.tmp6841)
br label %.if.end.6823
.if.false.6823:
%.tmp6842 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6843 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6842, i32 0, i32 6
%.tmp6844 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6843
%.tmp6845 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6844, i32 0, i32 0
%.tmp6846 = load i8*, i8** %.tmp6845
%.tmp6848 = getelementptr [5 x i8], [5 x i8]*@.str6847, i32 0, i32 0
%.tmp6849 = call i32(i8*,i8*) @strcmp(i8* %.tmp6846, i8* %.tmp6848)
%.tmp6850 = icmp eq i32 %.tmp6849, 0
br i1 %.tmp6850, label %.if.true.6851, label %.if.false.6851
.if.true.6851:
%.tmp6852 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6853 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6852, i32 0, i32 6
%.tmp6854 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6853
%.tmp6855 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6854, i32 0, i32 1
%.tmp6856 = load i8*, i8** %.tmp6855
%.tmp6858 = getelementptr [5 x i8], [5 x i8]*@.str6857, i32 0, i32 0
%.tmp6859 = call i32(i8*,i8*) @strcmp(i8* %.tmp6856, i8* %.tmp6858)
%.tmp6860 = icmp ne i32 %.tmp6859, 0
br i1 %.tmp6860, label %.if.true.6861, label %.if.false.6861
.if.true.6861:
%.tmp6862 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6863 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6865 = getelementptr [42 x i8], [42 x i8]*@.str6864, i32 0, i32 0
%.tmp6866 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6862, %m307$.Node.type* %.tmp6863, i8* %.tmp6865)
%.tmp6867 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6868 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6867, i32 0, i32 6
%.tmp6869 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6868
%.tmp6870 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6869, i32 0, i32 1
%.tmp6871 = load i8*, i8** %.tmp6870
%.tmp6872 = call i32(i8*,...) @printf(i8* %.tmp6866, i8* %.tmp6871)
%.tmp6873 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6873
br label %.if.end.6861
.if.false.6861:
br label %.if.end.6861
.if.end.6861:
%.tmp6874 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6875 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6874)
store %m1861$.AssignableInfo.type* %.tmp6875, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6876 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6877 = load i8, i8* @SCOPE_CONST
%.tmp6879 = getelementptr [5 x i8], [5 x i8]*@.str6878, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6876, i8 %.tmp6877, i8* %.tmp6879)
%.tmp6880 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6881 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6880, i32 0, i32 3
%.tmp6882 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6882, %m1861$.Type.type** %.tmp6881
%.tmp6883 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6884 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6883, i32 0, i32 3
%.tmp6885 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6884
%.tmp6886 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6885, i32 0, i32 0
%.tmp6888 = getelementptr [8 x i8], [8 x i8]*@.str6887, i32 0, i32 0
store i8* %.tmp6888, i8** %.tmp6886
br label %.if.end.6851
.if.false.6851:
%.tmp6889 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6890 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6889, i32 0, i32 6
%.tmp6891 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6890
%.tmp6892 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6891, i32 0, i32 0
%.tmp6893 = load i8*, i8** %.tmp6892
%.tmp6895 = getelementptr [17 x i8], [17 x i8]*@.str6894, i32 0, i32 0
%.tmp6896 = call i32(i8*,i8*) @strcmp(i8* %.tmp6893, i8* %.tmp6895)
%.tmp6897 = icmp eq i32 %.tmp6896, 0
br i1 %.tmp6897, label %.if.true.6898, label %.if.false.6898
.if.true.6898:
%.tmp6899 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6900 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6899)
store %m1861$.AssignableInfo.type* %.tmp6900, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6901 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6902 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6901, i32 0, i32 6
%.tmp6903 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6902
%.tmp6904 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6903, i32 0, i32 6
%.tmp6905 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6904
%.tmp6907 = getelementptr [12 x i8], [12 x i8]*@.str6906, i32 0, i32 0
%.tmp6908 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6905, i8* %.tmp6907)
%dest.6909 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6908, %m307$.Node.type** %dest.6909
%.tmp6910 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6911 = load %m307$.Node.type*, %m307$.Node.type** %dest.6909
%.tmp6912 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6910, %m307$.Node.type* %.tmp6911)
%var_info.6913 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6912, %m1861$.AssignableInfo.type** %var_info.6913
%.tmp6914 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6913
%.tmp6915 = icmp eq %m1861$.AssignableInfo.type* %.tmp6914, null
br i1 %.tmp6915, label %.if.true.6916, label %.if.false.6916
.if.true.6916:
%.tmp6917 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
ret %m1861$.AssignableInfo.type* %.tmp6917
br label %.if.end.6916
.if.false.6916:
br label %.if.end.6916
.if.end.6916:
%.tmp6918 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6919 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6913
%.tmp6920 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6919, i32 0, i32 3
%.tmp6921 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6920
%.tmp6922 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6918, %m1861$.Type.type* %.tmp6921)
%var_type_repr.6923 = alloca i8*
store i8* %.tmp6922, i8** %var_type_repr.6923
%.tmp6924 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6925 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6924, %m1861$.AssignableInfo.type* %.tmp6925)
%.tmp6926 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6927 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6926, i32 0, i32 3
%.tmp6928 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6913
%.tmp6929 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6928, i32 0, i32 3
%.tmp6930 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6929
store %m1861$.Type.type* %.tmp6930, %m1861$.Type.type** %.tmp6927
%.tmp6932 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6933 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6932, i32 0, i32 6
%.tmp6934 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6933
%.tmp6935 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6934, i32 0, i32 6
%.tmp6936 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6935
%ptr.6937 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6936, %m307$.Node.type** %ptr.6937
br label %.for.start.6931
.for.start.6931:
%.tmp6938 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6937
%.tmp6939 = load %m307$.Node.type*, %m307$.Node.type** %dest.6909
%.tmp6940 = icmp ne %m307$.Node.type* %.tmp6938, %.tmp6939
br i1 %.tmp6940, label %.for.continue.6931, label %.for.end.6931
.for.continue.6931:
%.tmp6941 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6942 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6941, %m1861$.Type.type** %type.6942
%.tmp6943 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6942
%.tmp6944 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6943, i32 0, i32 3
%.tmp6945 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6946 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6945, i32 0, i32 3
%.tmp6947 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6946
store %m1861$.Type.type* %.tmp6947, %m1861$.Type.type** %.tmp6944
%.tmp6948 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6942
%.tmp6949 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6948, i32 0, i32 0
%.tmp6951 = getelementptr [4 x i8], [4 x i8]*@.str6950, i32 0, i32 0
store i8* %.tmp6951, i8** %.tmp6949
%.tmp6952 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6953 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6952, i32 0, i32 3
%.tmp6954 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6942
store %m1861$.Type.type* %.tmp6954, %m1861$.Type.type** %.tmp6953
%.tmp6955 = load %m307$.Node.type*, %m307$.Node.type** %ptr.6937
%.tmp6956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6955, i32 0, i32 7
%.tmp6957 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6956
store %m307$.Node.type* %.tmp6957, %m307$.Node.type** %ptr.6937
br label %.for.start.6931
.for.end.6931:
%.tmp6958 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6958, i32 0, i32 6
%.tmp6960 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6959
%.tmp6961 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6960, i32 0, i32 6
%.tmp6962 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6961
%.tmp6963 = load %m307$.Node.type*, %m307$.Node.type** %dest.6909
%.tmp6964 = icmp ne %m307$.Node.type* %.tmp6962, %.tmp6963
br i1 %.tmp6964, label %.if.true.6965, label %.if.false.6965
.if.true.6965:
%.tmp6966 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6967 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6966, i32 0, i32 1
%.tmp6968 = load %m0$.File.type*, %m0$.File.type** %.tmp6967
%.tmp6970 = getelementptr [38 x i8], [38 x i8]*@.str6969, i32 0, i32 0
%.tmp6971 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6972 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6971)
%.tmp6973 = load i8*, i8** %var_type_repr.6923
%.tmp6974 = load i8*, i8** %var_type_repr.6923
%.tmp6975 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6913
%.tmp6976 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6975)
%.tmp6977 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6968, i8* %.tmp6970, i8* %.tmp6972, i8* %.tmp6973, i8* %.tmp6974, i8* %.tmp6976)
br label %.if.end.6965
.if.false.6965:
%.tmp6978 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6979 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6978, i32 0, i32 1
%.tmp6980 = load %m0$.File.type*, %m0$.File.type** %.tmp6979
%.tmp6982 = getelementptr [22 x i8], [22 x i8]*@.str6981, i32 0, i32 0
%.tmp6983 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp6984 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6983)
%.tmp6985 = load i8*, i8** %var_type_repr.6923
%.tmp6986 = load i8*, i8** %var_type_repr.6923
%.tmp6987 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.6913
%.tmp6988 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6987)
%.tmp6989 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6980, i8* %.tmp6982, i8* %.tmp6984, i8* %.tmp6985, i8* %.tmp6986, i8* %.tmp6988)
br label %.if.end.6965
.if.end.6965:
br label %.if.end.6898
.if.false.6898:
%.tmp6990 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp6991 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6990, i32 0, i32 6
%.tmp6992 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6991
%.tmp6993 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6992, i32 0, i32 0
%.tmp6994 = load i8*, i8** %.tmp6993
%.tmp6996 = getelementptr [8 x i8], [8 x i8]*@.str6995, i32 0, i32 0
%.tmp6997 = call i32(i8*,i8*) @strcmp(i8* %.tmp6994, i8* %.tmp6996)
%.tmp6998 = icmp eq i32 %.tmp6997, 0
br i1 %.tmp6998, label %.if.true.6999, label %.if.false.6999
.if.true.6999:
%.tmp7000 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7001 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7000)
store %m1861$.AssignableInfo.type* %.tmp7001, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7002 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7003 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7002, i32 0, i32 3
%.tmp7004 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7004, %m1861$.Type.type** %.tmp7003
%.tmp7005 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7006 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7005, i32 0, i32 3
%.tmp7007 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7006
%.tmp7008 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7007, i32 0, i32 0
%.tmp7010 = getelementptr [5 x i8], [5 x i8]*@.str7009, i32 0, i32 0
store i8* %.tmp7010, i8** %.tmp7008
%.tmp7011 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7012 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7011, i32 0, i32 6
%.tmp7013 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7012
%.tmp7014 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7013, i32 0, i32 6
%.tmp7015 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7014
%.tmp7016 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7015, i32 0, i32 1
%.tmp7017 = load i8*, i8** %.tmp7016
%.tmp7019 = getelementptr [6 x i8], [6 x i8]*@.str7018, i32 0, i32 0
%.tmp7020 = call i32(i8*,i8*) @strcmp(i8* %.tmp7017, i8* %.tmp7019)
%.tmp7021 = icmp eq i32 %.tmp7020, 0
br i1 %.tmp7021, label %.if.true.7022, label %.if.false.7022
.if.true.7022:
%.tmp7023 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7024 = load i8, i8* @SCOPE_CONST
%.tmp7026 = getelementptr [2 x i8], [2 x i8]*@.str7025, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7023, i8 %.tmp7024, i8* %.tmp7026)
br label %.if.end.7022
.if.false.7022:
%.tmp7027 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7028 = load i8, i8* @SCOPE_CONST
%.tmp7030 = getelementptr [2 x i8], [2 x i8]*@.str7029, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7027, i8 %.tmp7028, i8* %.tmp7030)
br label %.if.end.7022
.if.end.7022:
br label %.if.end.6999
.if.false.6999:
%.tmp7031 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7032 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7031, i32 0, i32 6
%.tmp7033 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7032
%.tmp7034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7033, i32 0, i32 0
%.tmp7035 = load i8*, i8** %.tmp7034
%.tmp7037 = getelementptr [8 x i8], [8 x i8]*@.str7036, i32 0, i32 0
%.tmp7038 = call i32(i8*,i8*) @strcmp(i8* %.tmp7035, i8* %.tmp7037)
%.tmp7039 = icmp eq i32 %.tmp7038, 0
br i1 %.tmp7039, label %.if.true.7040, label %.if.false.7040
.if.true.7040:
%.tmp7041 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7042 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7043 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7042, i32 0, i32 6
%.tmp7044 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7043
%.tmp7045 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7044, i32 0, i32 6
%.tmp7046 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7045
%.tmp7047 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7041, %m307$.Node.type* %.tmp7046)
store %m1861$.AssignableInfo.type* %.tmp7047, %m1861$.AssignableInfo.type** %assignable_info.6809
br label %.if.end.7040
.if.false.7040:
%.tmp7048 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7049 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7048, i32 0, i32 6
%.tmp7050 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7049
%.tmp7051 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7050, i32 0, i32 0
%.tmp7052 = load i8*, i8** %.tmp7051
%.tmp7054 = getelementptr [7 x i8], [7 x i8]*@.str7053, i32 0, i32 0
%.tmp7055 = call i32(i8*,i8*) @strcmp(i8* %.tmp7052, i8* %.tmp7054)
%.tmp7056 = icmp eq i32 %.tmp7055, 0
br i1 %.tmp7056, label %.if.true.7057, label %.if.false.7057
.if.true.7057:
%.tmp7058 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7059 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7060 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7059, i32 0, i32 6
%.tmp7061 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7060
%.tmp7062 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7061, i32 0, i32 1
%.tmp7063 = load i8*, i8** %.tmp7062
%.tmp7064 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp7058, i8* %.tmp7063)
%string_info.7065 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7064, %m1861$.AssignableInfo.type** %string_info.7065
%.tmp7066 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7067 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7066)
store %m1861$.AssignableInfo.type* %.tmp7067, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7068 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7069 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7068, %m1861$.AssignableInfo.type* %.tmp7069)
%.tmp7070 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7071 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7065
%.tmp7072 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7071, i32 0, i32 3
%.tmp7073 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7072
%.tmp7074 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7070, %m1861$.Type.type* %.tmp7073)
%str_tr.7075 = alloca i8*
store i8* %.tmp7074, i8** %str_tr.7075
%.tmp7076 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7077 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7076, i32 0, i32 1
%.tmp7078 = load %m0$.File.type*, %m0$.File.type** %.tmp7077
%.tmp7080 = getelementptr [44 x i8], [44 x i8]*@.str7079, i32 0, i32 0
%.tmp7081 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7082 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7081)
%.tmp7083 = load i8*, i8** %str_tr.7075
%.tmp7084 = load i8*, i8** %str_tr.7075
%.tmp7085 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7065
%.tmp7086 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7085)
%.tmp7087 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7078, i8* %.tmp7080, i8* %.tmp7082, i8* %.tmp7083, i8* %.tmp7084, i8* %.tmp7086)
%.tmp7088 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7089 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7088, i32 0, i32 3
%.tmp7090 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7090, %m1861$.Type.type** %.tmp7089
%.tmp7091 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7092 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7091, i32 0, i32 3
%.tmp7093 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7092
%.tmp7094 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7093, i32 0, i32 0
%.tmp7096 = getelementptr [4 x i8], [4 x i8]*@.str7095, i32 0, i32 0
store i8* %.tmp7096, i8** %.tmp7094
%.tmp7097 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7098 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7097, i32 0, i32 3
%.tmp7099 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7098
%.tmp7100 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7099, i32 0, i32 3
%.tmp7101 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7101, %m1861$.Type.type** %.tmp7100
%.tmp7102 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7103 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7102, i32 0, i32 3
%.tmp7104 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7103
%.tmp7105 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7104, i32 0, i32 3
%.tmp7106 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7105
%.tmp7107 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7106, i32 0, i32 0
%.tmp7109 = getelementptr [4 x i8], [4 x i8]*@.str7108, i32 0, i32 0
store i8* %.tmp7109, i8** %.tmp7107
br label %.if.end.7057
.if.false.7057:
%.tmp7110 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7111 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7110, i32 0, i32 6
%.tmp7112 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7111
%.tmp7113 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7112, i32 0, i32 0
%.tmp7114 = load i8*, i8** %.tmp7113
%.tmp7116 = getelementptr [4 x i8], [4 x i8]*@.str7115, i32 0, i32 0
%.tmp7117 = call i32(i8*,i8*) @strcmp(i8* %.tmp7114, i8* %.tmp7116)
%.tmp7118 = icmp eq i32 %.tmp7117, 0
br i1 %.tmp7118, label %.if.true.7119, label %.if.false.7119
.if.true.7119:
%.tmp7120 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7121 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7120)
store %m1861$.AssignableInfo.type* %.tmp7121, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7122 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7123 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7122, i32 0, i32 6
%.tmp7124 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7123
%.tmp7125 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7124, i32 0, i32 1
%.tmp7126 = load i8*, i8** %.tmp7125
%.tmp7127 = call i32(i8*) @strlen(i8* %.tmp7126)
%chr_len.7128 = alloca i32
store i32 %.tmp7127, i32* %chr_len.7128
%.tmp7129 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7130 = load i8, i8* @SCOPE_CONST
%.tmp7132 = getelementptr [2 x i8], [2 x i8]*@.str7131, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7129, i8 %.tmp7130, i8* %.tmp7132)
%.tmp7133 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7134 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7133, i32 0, i32 0
%.tmp7135 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7136 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7135, i32 0, i32 6
%.tmp7137 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7136
%.tmp7138 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7137, i32 0, i32 1
%.tmp7139 = load i8*, i8** %.tmp7138
%.tmp7140 = call i8*(i8*) @m2233$chr_to_llvm.cp.cp(i8* %.tmp7139)
store i8* %.tmp7140, i8** %.tmp7134
%.tmp7141 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7142 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7141, i32 0, i32 0
%.tmp7143 = load i8*, i8** %.tmp7142
%.tmp7144 = icmp eq i8* %.tmp7143, null
br i1 %.tmp7144, label %.if.true.7145, label %.if.false.7145
.if.true.7145:
%.tmp7146 = getelementptr i8*, i8** %err_buf.6812, i32 0
%.tmp7148 = getelementptr [22 x i8], [22 x i8]*@.str7147, i32 0, i32 0
%.tmp7149 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7150 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7149, i32 0, i32 6
%.tmp7151 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7150
%.tmp7152 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7151, i32 0, i32 1
%.tmp7153 = load i8*, i8** %.tmp7152
%.tmp7154 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7146, i8* %.tmp7148, i8* %.tmp7153)
%.tmp7155 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7155
br label %.if.end.7145
.if.false.7145:
br label %.if.end.7145
.if.end.7145:
%.tmp7156 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7157 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7156, i32 0, i32 3
%.tmp7158 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7158, %m1861$.Type.type** %.tmp7157
%.tmp7159 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7160 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7159, i32 0, i32 3
%.tmp7161 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7160
%.tmp7162 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7161, i32 0, i32 0
%.tmp7164 = getelementptr [4 x i8], [4 x i8]*@.str7163, i32 0, i32 0
store i8* %.tmp7164, i8** %.tmp7162
br label %.if.end.7119
.if.false.7119:
%.tmp7165 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7166 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7168 = getelementptr [40 x i8], [40 x i8]*@.str7167, i32 0, i32 0
%.tmp7169 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7165, %m307$.Node.type* %.tmp7166, i8* %.tmp7168)
%.tmp7170 = load %m307$.Node.type*, %m307$.Node.type** %mono.6811
%.tmp7171 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7170, i32 0, i32 6
%.tmp7172 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7171
%.tmp7173 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7172, i32 0, i32 0
%.tmp7174 = load i8*, i8** %.tmp7173
%.tmp7175 = call i32(i8*,...) @printf(i8* %.tmp7169, i8* %.tmp7174)
%.tmp7176 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7176
br label %.if.end.7119
.if.end.7119:
br label %.if.end.7057
.if.end.7057:
br label %.if.end.7040
.if.end.7040:
br label %.if.end.6999
.if.end.6999:
br label %.if.end.6898
.if.end.6898:
br label %.if.end.6851
.if.end.6851:
br label %.if.end.6823
.if.end.6823:
%.tmp7177 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7178 = icmp eq %m1861$.AssignableInfo.type* %.tmp7177, null
br i1 %.tmp7178, label %.if.true.7179, label %.if.false.7179
.if.true.7179:
%.tmp7180 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7180
br label %.if.end.7179
.if.false.7179:
br label %.if.end.7179
.if.end.7179:
%.tmp7181 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7182 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7181, i32 0, i32 4
%.tmp7183 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7184 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7183, i32 0, i32 3
%.tmp7185 = load i32, i32* %.tmp7184
store i32 %.tmp7185, i32* %.tmp7182
%.tmp7186 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7187 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7186, i32 0, i32 5
%.tmp7188 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7189 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7188, i32 0, i32 4
%.tmp7190 = load i32, i32* %.tmp7189
store i32 %.tmp7190, i32* %.tmp7187
%.tmp7191 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6809
%.tmp7192 = bitcast %m1861$.AssignableInfo.type* %.tmp7191 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7192
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7193 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7194 = icmp ne %m1861$.Type.type* %.tmp7193, null
%.tmp7196 = getelementptr [22 x i8], [22 x i8]*@.str7195, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7194, i8* %.tmp7196)
%.tmp7197 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7198 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7197, i32 0, i32 0
%.tmp7199 = load i8*, i8** %.tmp7198
%.tmp7200 = icmp ne i8* %.tmp7199, null
%.tmp7202 = getelementptr [59 x i8], [59 x i8]*@.str7201, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7200, i8* %.tmp7202)
%.tmp7203 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7204 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7203, i32 0, i32 0
%.tmp7205 = load i8*, i8** %.tmp7204
%.tmp7207 = getelementptr [4 x i8], [4 x i8]*@.str7206, i32 0, i32 0
%.tmp7208 = call i32(i8*,i8*) @strcmp(i8* %.tmp7205, i8* %.tmp7207)
%.tmp7209 = icmp eq i32 %.tmp7208, 0
br i1 %.tmp7209, label %.if.true.7210, label %.if.false.7210
.if.true.7210:
%.tmp7212 = getelementptr [2 x i8], [2 x i8]*@.str7211, i32 0, i32 0
ret i8* %.tmp7212
br label %.if.end.7210
.if.false.7210:
%.tmp7213 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7214 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7213, i32 0, i32 0
%.tmp7215 = load i8*, i8** %.tmp7214
%.tmp7217 = getelementptr [5 x i8], [5 x i8]*@.str7216, i32 0, i32 0
%.tmp7218 = call i32(i8*,i8*) @strcmp(i8* %.tmp7215, i8* %.tmp7217)
%.tmp7219 = icmp eq i32 %.tmp7218, 0
br i1 %.tmp7219, label %.if.true.7220, label %.if.false.7220
.if.true.7220:
%.tmp7222 = getelementptr [2 x i8], [2 x i8]*@.str7221, i32 0, i32 0
ret i8* %.tmp7222
br label %.if.end.7220
.if.false.7220:
%.tmp7223 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7224 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7223, i32 0, i32 0
%.tmp7225 = load i8*, i8** %.tmp7224
%.tmp7227 = getelementptr [5 x i8], [5 x i8]*@.str7226, i32 0, i32 0
%.tmp7228 = call i32(i8*,i8*) @strcmp(i8* %.tmp7225, i8* %.tmp7227)
%.tmp7229 = icmp eq i32 %.tmp7228, 0
br i1 %.tmp7229, label %.if.true.7230, label %.if.false.7230
.if.true.7230:
%.tmp7232 = getelementptr [2 x i8], [2 x i8]*@.str7231, i32 0, i32 0
ret i8* %.tmp7232
br label %.if.end.7230
.if.false.7230:
%.tmp7233 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7234 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7233, i32 0, i32 0
%.tmp7235 = load i8*, i8** %.tmp7234
%.tmp7237 = getelementptr [4 x i8], [4 x i8]*@.str7236, i32 0, i32 0
%.tmp7238 = call i32(i8*,i8*) @strcmp(i8* %.tmp7235, i8* %.tmp7237)
%.tmp7239 = icmp eq i32 %.tmp7238, 0
br i1 %.tmp7239, label %.if.true.7240, label %.if.false.7240
.if.true.7240:
%.tmp7242 = getelementptr [2 x i8], [2 x i8]*@.str7241, i32 0, i32 0
ret i8* %.tmp7242
br label %.if.end.7240
.if.false.7240:
%.tmp7243 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7244 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7243, i32 0, i32 0
%.tmp7245 = load i8*, i8** %.tmp7244
%.tmp7247 = getelementptr [4 x i8], [4 x i8]*@.str7246, i32 0, i32 0
%.tmp7248 = call i32(i8*,i8*) @strcmp(i8* %.tmp7245, i8* %.tmp7247)
%.tmp7249 = icmp eq i32 %.tmp7248, 0
br i1 %.tmp7249, label %.if.true.7250, label %.if.false.7250
.if.true.7250:
%buf.7251 = alloca i8*
store i8* null, i8** %buf.7251
%.tmp7252 = getelementptr i8*, i8** %buf.7251, i32 0
%.tmp7254 = getelementptr [4 x i8], [4 x i8]*@.str7253, i32 0, i32 0
%.tmp7255 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7256 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7255, i32 0, i32 3
%.tmp7257 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7256
%.tmp7258 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7257)
%.tmp7259 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7252, i8* %.tmp7254, i8* %.tmp7258)
%.tmp7260 = load i8*, i8** %buf.7251
ret i8* %.tmp7260
br label %.if.end.7250
.if.false.7250:
%.tmp7261 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7262 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7261, i32 0, i32 0
%.tmp7263 = load i8*, i8** %.tmp7262
%.tmp7265 = getelementptr [10 x i8], [10 x i8]*@.str7264, i32 0, i32 0
%.tmp7266 = call i32(i8*,i8*) @strcmp(i8* %.tmp7263, i8* %.tmp7265)
%.tmp7267 = icmp eq i32 %.tmp7266, 0
br i1 %.tmp7267, label %.if.true.7268, label %.if.false.7268
.if.true.7268:
%.tmp7269 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7270 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7269, i32 0, i32 2
%.tmp7271 = load i8*, i8** %.tmp7270
ret i8* %.tmp7271
br label %.if.end.7268
.if.false.7268:
%.tmp7272 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7273 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7272, i32 0, i32 0
%.tmp7274 = load i8*, i8** %.tmp7273
%.tmp7276 = getelementptr [7 x i8], [7 x i8]*@.str7275, i32 0, i32 0
%.tmp7277 = call i32(i8*,i8*) @strcmp(i8* %.tmp7274, i8* %.tmp7276)
%.tmp7278 = icmp eq i32 %.tmp7277, 0
br i1 %.tmp7278, label %.if.true.7279, label %.if.false.7279
.if.true.7279:
%.tmp7281 = getelementptr [2 x i8], [2 x i8]*@.str7280, i32 0, i32 0
%buf.7282 = alloca i8*
store i8* %.tmp7281, i8** %buf.7282
%.tmp7284 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7285 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7284, i32 0, i32 3
%.tmp7286 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7285
%t.7287 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7286, %m1861$.Type.type** %t.7287
br label %.for.start.7283
.for.start.7283:
%.tmp7288 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7287
%.tmp7289 = icmp ne %m1861$.Type.type* %.tmp7288, null
br i1 %.tmp7289, label %.for.continue.7283, label %.for.end.7283
.for.continue.7283:
%.tmp7290 = getelementptr i8*, i8** %buf.7282, i32 0
%.tmp7292 = getelementptr [5 x i8], [5 x i8]*@.str7291, i32 0, i32 0
%.tmp7293 = load i8*, i8** %buf.7282
%.tmp7294 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7287
%.tmp7295 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7294)
%.tmp7296 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7290, i8* %.tmp7292, i8* %.tmp7293, i8* %.tmp7295)
%.tmp7297 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7287
%.tmp7298 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7297, i32 0, i32 4
%.tmp7299 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7298
store %m1861$.Type.type* %.tmp7299, %m1861$.Type.type** %t.7287
br label %.for.start.7283
.for.end.7283:
%.tmp7300 = load i8*, i8** %buf.7282
ret i8* %.tmp7300
br label %.if.end.7279
.if.false.7279:
%.tmp7301 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7302 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7301, i32 0, i32 0
%.tmp7303 = load i8*, i8** %.tmp7302
%.tmp7305 = getelementptr [6 x i8], [6 x i8]*@.str7304, i32 0, i32 0
%.tmp7306 = call i32(i8*,i8*) @strcmp(i8* %.tmp7303, i8* %.tmp7305)
%.tmp7307 = icmp eq i32 %.tmp7306, 0
br i1 %.tmp7307, label %.if.true.7308, label %.if.false.7308
.if.true.7308:
%.tmp7310 = getelementptr [2 x i8], [2 x i8]*@.str7309, i32 0, i32 0
ret i8* %.tmp7310
br label %.if.end.7308
.if.false.7308:
%.tmp7312 = getelementptr [45 x i8], [45 x i8]*@.str7311, i32 0, i32 0
%.tmp7313 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7314 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7313, i32 0, i32 0
%.tmp7315 = load i8*, i8** %.tmp7314
%.tmp7316 = call i32(i8*,...) @printf(i8* %.tmp7312, i8* %.tmp7315)
br label %.if.end.7308
.if.end.7308:
br label %.if.end.7279
.if.end.7279:
br label %.if.end.7268
.if.end.7268:
br label %.if.end.7250
.if.end.7250:
br label %.if.end.7240
.if.end.7240:
br label %.if.end.7230
.if.end.7230:
br label %.if.end.7220
.if.end.7220:
br label %.if.end.7210
.if.end.7210:
%.tmp7317 = bitcast ptr null to i8*
ret i8* %.tmp7317
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7318 = bitcast ptr null to %m307$.Node.type*
%.tmp7319 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7318)
%info.7320 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7319, %m1861$.AssignableInfo.type** %info.7320
%tmp_buff.7321 = alloca i8*
store i8* null, i8** %tmp_buff.7321
%.tmp7322 = getelementptr i8*, i8** %tmp_buff.7321, i32 0
%.tmp7324 = getelementptr [7 x i8], [7 x i8]*@.str7323, i32 0, i32 0
%.tmp7325 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7326 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7325)
%.tmp7327 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7322, i8* %.tmp7324, i32 %.tmp7326)
%.tmp7328 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7329 = load i8, i8* @SCOPE_GLOBAL
%.tmp7330 = load i8*, i8** %tmp_buff.7321
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7328, i8 %.tmp7329, i8* %.tmp7330)
%.tmp7331 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7332 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7331, i32 0, i32 3
%.tmp7333 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7333, %m1861$.Type.type** %.tmp7332
%.tmp7334 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7335 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7334, i32 0, i32 3
%.tmp7336 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7335
%.tmp7337 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7336, i32 0, i32 0
%.tmp7339 = getelementptr [6 x i8], [6 x i8]*@.str7338, i32 0, i32 0
store i8* %.tmp7339, i8** %.tmp7337
%.tmp7340 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7341 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7340, i32 0, i32 3
%.tmp7342 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7341
%.tmp7343 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7342, i32 0, i32 3
%.tmp7344 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7344, %m1861$.Type.type** %.tmp7343
%.tmp7345 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7346 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7345, i32 0, i32 3
%.tmp7347 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7346
%.tmp7348 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7347, i32 0, i32 3
%.tmp7349 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7348
%.tmp7350 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7349, i32 0, i32 0
%.tmp7352 = getelementptr [4 x i8], [4 x i8]*@.str7351, i32 0, i32 0
store i8* %.tmp7352, i8** %.tmp7350
%.tmp7353 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7354 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7353, i32 0, i32 3
%.tmp7355 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7354
%.tmp7356 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7355, i32 0, i32 3
%.tmp7357 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7356
%.tmp7358 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7357, i32 0, i32 4
%.tmp7359 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7359, %m1861$.Type.type** %.tmp7358
%.tmp7360 = load i8*, i8** %text
%.tmp7361 = call i8*(i8*) @m2233$string_to_llvm.cp.cp(i8* %.tmp7360)
%identifier.7362 = alloca i8*
store i8* %.tmp7361, i8** %identifier.7362
%.tmp7363 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
%.tmp7364 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7363, i32 0, i32 3
%.tmp7365 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7364
%.tmp7366 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7365, i32 0, i32 3
%.tmp7367 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7366
%.tmp7368 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7367, i32 0, i32 4
%.tmp7369 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7368
%.tmp7370 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7369, i32 0, i32 0
%.tmp7371 = getelementptr i8*, i8** %.tmp7370, i32 0
%.tmp7373 = getelementptr [3 x i8], [3 x i8]*@.str7372, i32 0, i32 0
%.tmp7374 = load i8*, i8** %identifier.7362
%.tmp7375 = call i32(i8*) @m2233$llvm_str_len.i.cp(i8* %.tmp7374)
%.tmp7376 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7371, i8* %.tmp7373, i32 %.tmp7375)
%.tmp7377 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7378 = load i8*, i8** %identifier.7362
%.tmp7380 = getelementptr [7 x i8], [7 x i8]*@.str7379, i32 0, i32 0
%.tmp7381 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp7377, i8* %.tmp7378, i8* %.tmp7380, %m1861$.AssignableInfo.type* %.tmp7381, i1 0, i1 0)
%.tmp7382 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7320
ret %m1861$.AssignableInfo.type* %.tmp7382
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
%.tmp7383 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7384 = ptrtoint %m1861$.GlobalName.type* %.tmp7383 to i32
%.tmp7385 = call i8*(i32) @malloc(i32 %.tmp7384)
%.tmp7386 = bitcast i8* %.tmp7385 to %m1861$.GlobalName.type*
%global.7387 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7386, %m1861$.GlobalName.type** %global.7387
%.tmp7388 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
%.tmp7389 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7388, i32 0, i32 0
%.tmp7390 = load i8*, i8** %id
store i8* %.tmp7390, i8** %.tmp7389
%.tmp7391 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
%.tmp7392 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7391, i32 0, i32 1
%.tmp7393 = load i8*, i8** %type
store i8* %.tmp7393, i8** %.tmp7392
%.tmp7394 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
%.tmp7395 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7394, i32 0, i32 4
%.tmp7396 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp7396, %m1861$.AssignableInfo.type** %.tmp7395
%.tmp7397 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
%.tmp7398 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7397, i32 0, i32 2
%.tmp7399 = load i1, i1* %compiled
store i1 %.tmp7399, i1* %.tmp7398
%.tmp7400 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
%.tmp7401 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7400, i32 0, i32 5
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7401
%.tmp7402 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
%.tmp7403 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7402, i32 0, i32 3
%.tmp7404 = load i1, i1* %weak
store i1 %.tmp7404, i1* %.tmp7403
%.tmp7405 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7406 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7387
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7405, %m1861$.GlobalName.type* %.tmp7406)
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
%.tmp7407 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7408 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7407)
%info.7409 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7408, %m1861$.AssignableInfo.type** %info.7409
%.tmp7410 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7409
%.tmp7411 = load i8, i8* @SCOPE_CONST
%.tmp7412 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7410, i8 %.tmp7411, i8* %.tmp7412)
%.tmp7413 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7409
%.tmp7414 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7413, i32 0, i32 2
%.tmp7416 = getelementptr [7 x i8], [7 x i8]*@.str7415, i32 0, i32 0
store i8* %.tmp7416, i8** %.tmp7414
%.tmp7417 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7409
%.tmp7418 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7417, i32 0, i32 3
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7418
%.tmp7419 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7420 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7421 = load i8*, i8** %as_name
%.tmp7422 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7409
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7419, %m307$.Node.type* %.tmp7420, i8* %.tmp7421, %m1861$.AssignableInfo.type* %.tmp7422)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7423 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7424 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7423, i32 0, i32 3
%.tmp7425 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7424
%.tmp7426 = icmp eq %m1861$.GlobalName.type* %.tmp7425, null
br i1 %.tmp7426, label %.if.true.7427, label %.if.false.7427
.if.true.7427:
%.tmp7428 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7429 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7428, i32 0, i32 3
%.tmp7430 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7430, %m1861$.GlobalName.type** %.tmp7429
ret void
br label %.if.end.7427
.if.false.7427:
br label %.if.end.7427
.if.end.7427:
%.tmp7431 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7432 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7431, i32 0, i32 3
%.tmp7433 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7432
%last_global.7434 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7433, %m1861$.GlobalName.type** %last_global.7434
%.tmp7436 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7437 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7436, i32 0, i32 3
%.tmp7438 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7437
%curr_global.7439 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7438, %m1861$.GlobalName.type** %curr_global.7439
br label %.for.start.7435
.for.start.7435:
%.tmp7440 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7439
%.tmp7441 = icmp ne %m1861$.GlobalName.type* %.tmp7440, null
br i1 %.tmp7441, label %.for.continue.7435, label %.for.end.7435
.for.continue.7435:
%.tmp7442 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7439
%.tmp7443 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7442, i32 0, i32 4
%.tmp7444 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7443
%.tmp7445 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7444, i32 0, i32 0
%.tmp7446 = load i8*, i8** %.tmp7445
%.tmp7447 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp7448 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7447, i32 0, i32 4
%.tmp7449 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7448
%.tmp7450 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7449, i32 0, i32 0
%.tmp7451 = load i8*, i8** %.tmp7450
%.tmp7452 = call i32(i8*,i8*) @strcmp(i8* %.tmp7446, i8* %.tmp7451)
%.tmp7453 = icmp eq i32 %.tmp7452, 0
br i1 %.tmp7453, label %.if.true.7454, label %.if.false.7454
.if.true.7454:
ret void
br label %.if.end.7454
.if.false.7454:
br label %.if.end.7454
.if.end.7454:
%.tmp7455 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7439
store %m1861$.GlobalName.type* %.tmp7455, %m1861$.GlobalName.type** %last_global.7434
%.tmp7456 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7439
%.tmp7457 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7456, i32 0, i32 5
%.tmp7458 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7457
store %m1861$.GlobalName.type* %.tmp7458, %m1861$.GlobalName.type** %curr_global.7439
br label %.for.start.7435
.for.end.7435:
%.tmp7459 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7434
%.tmp7460 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7459, i32 0, i32 5
%.tmp7461 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7461, %m1861$.GlobalName.type** %.tmp7460
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7462 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7463 = icmp eq %m1861$.Type.type* %.tmp7462, null
br i1 %.tmp7463, label %.if.true.7464, label %.if.false.7464
.if.true.7464:
%.tmp7465 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7465, label %.if.true.7466, label %.if.false.7466
.if.true.7466:
%.tmp7468 = getelementptr [44 x i8], [44 x i8]*@.str7467, i32 0, i32 0
%.tmp7469 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7470 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7469, i32 0, i32 7
%.tmp7471 = load i8*, i8** %.tmp7470
%.tmp7472 = call i32(i8*,...) @printf(i8* %.tmp7468, i8* %.tmp7471)
br label %.if.end.7466
.if.false.7466:
br label %.if.end.7466
.if.end.7466:
%.tmp7474 = getelementptr [2 x i8], [2 x i8]*@.str7473, i32 0, i32 0
ret i8* %.tmp7474
br label %.if.end.7464
.if.false.7464:
br label %.if.end.7464
.if.end.7464:
%.tmp7475 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7476 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7475, i32 0, i32 0
%.tmp7477 = load i8*, i8** %.tmp7476
%.tmp7478 = icmp ne i8* %.tmp7477, null
%.tmp7480 = getelementptr [59 x i8], [59 x i8]*@.str7479, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7478, i8* %.tmp7480)
%buf.7481 = alloca i8*
store i8* null, i8** %buf.7481
%.tmp7482 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7483 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7482, i32 0, i32 0
%.tmp7484 = load i8*, i8** %.tmp7483
%.tmp7486 = getelementptr [4 x i8], [4 x i8]*@.str7485, i32 0, i32 0
%.tmp7487 = call i32(i8*,i8*) @strcmp(i8* %.tmp7484, i8* %.tmp7486)
%.tmp7488 = icmp eq i32 %.tmp7487, 0
br i1 %.tmp7488, label %.if.true.7489, label %.if.false.7489
.if.true.7489:
%.tmp7491 = getelementptr [4 x i8], [4 x i8]*@.str7490, i32 0, i32 0
ret i8* %.tmp7491
br label %.if.end.7489
.if.false.7489:
%.tmp7492 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7493 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7492, i32 0, i32 0
%.tmp7494 = load i8*, i8** %.tmp7493
%.tmp7496 = getelementptr [5 x i8], [5 x i8]*@.str7495, i32 0, i32 0
%.tmp7497 = call i32(i8*,i8*) @strcmp(i8* %.tmp7494, i8* %.tmp7496)
%.tmp7498 = icmp eq i32 %.tmp7497, 0
br i1 %.tmp7498, label %.if.true.7499, label %.if.false.7499
.if.true.7499:
%.tmp7501 = getelementptr [5 x i8], [5 x i8]*@.str7500, i32 0, i32 0
ret i8* %.tmp7501
br label %.if.end.7499
.if.false.7499:
%.tmp7502 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7503 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7502, i32 0, i32 0
%.tmp7504 = load i8*, i8** %.tmp7503
%.tmp7506 = getelementptr [5 x i8], [5 x i8]*@.str7505, i32 0, i32 0
%.tmp7507 = call i32(i8*,i8*) @strcmp(i8* %.tmp7504, i8* %.tmp7506)
%.tmp7508 = icmp eq i32 %.tmp7507, 0
br i1 %.tmp7508, label %.if.true.7509, label %.if.false.7509
.if.true.7509:
%.tmp7511 = getelementptr [3 x i8], [3 x i8]*@.str7510, i32 0, i32 0
ret i8* %.tmp7511
br label %.if.end.7509
.if.false.7509:
%.tmp7512 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7513 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7512, i32 0, i32 0
%.tmp7514 = load i8*, i8** %.tmp7513
%.tmp7516 = getelementptr [8 x i8], [8 x i8]*@.str7515, i32 0, i32 0
%.tmp7517 = call i32(i8*,i8*) @strcmp(i8* %.tmp7514, i8* %.tmp7516)
%.tmp7518 = icmp eq i32 %.tmp7517, 0
br i1 %.tmp7518, label %.if.true.7519, label %.if.false.7519
.if.true.7519:
%.tmp7521 = getelementptr [4 x i8], [4 x i8]*@.str7520, i32 0, i32 0
ret i8* %.tmp7521
br label %.if.end.7519
.if.false.7519:
%.tmp7522 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7523 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7522, i32 0, i32 0
%.tmp7524 = load i8*, i8** %.tmp7523
%.tmp7526 = getelementptr [4 x i8], [4 x i8]*@.str7525, i32 0, i32 0
%.tmp7527 = call i32(i8*,i8*) @strcmp(i8* %.tmp7524, i8* %.tmp7526)
%.tmp7528 = icmp eq i32 %.tmp7527, 0
br i1 %.tmp7528, label %.if.true.7529, label %.if.false.7529
.if.true.7529:
%.tmp7531 = getelementptr [3 x i8], [3 x i8]*@.str7530, i32 0, i32 0
ret i8* %.tmp7531
br label %.if.end.7529
.if.false.7529:
%.tmp7532 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7533 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7532, i32 0, i32 0
%.tmp7534 = load i8*, i8** %.tmp7533
%.tmp7536 = getelementptr [9 x i8], [9 x i8]*@.str7535, i32 0, i32 0
%.tmp7537 = call i32(i8*,i8*) @strcmp(i8* %.tmp7534, i8* %.tmp7536)
%.tmp7538 = icmp eq i32 %.tmp7537, 0
br i1 %.tmp7538, label %.if.true.7539, label %.if.false.7539
.if.true.7539:
%.tmp7540 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7542 = getelementptr [4 x i8], [4 x i8]*@.str7541, i32 0, i32 0
%.tmp7543 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7544 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7545 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7544, i32 0, i32 3
%.tmp7546 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7545
%.tmp7547 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7543, %m1861$.Type.type* %.tmp7546)
%.tmp7548 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7540, i8* %.tmp7542, i8* %.tmp7547)
%.tmp7550 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7551 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7550, i32 0, i32 3
%.tmp7552 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7551
%.tmp7553 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7552, i32 0, i32 4
%.tmp7554 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7553
%p.7555 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7554, %m1861$.Type.type** %p.7555
br label %.for.start.7549
.for.start.7549:
%.tmp7556 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7555
%.tmp7557 = icmp ne %m1861$.Type.type* %.tmp7556, null
br i1 %.tmp7557, label %.for.continue.7549, label %.for.end.7549
.for.continue.7549:
%.tmp7558 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7555
%.tmp7559 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7560 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7559, i32 0, i32 3
%.tmp7561 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7560
%.tmp7562 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7561, i32 0, i32 4
%.tmp7563 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7562
%.tmp7564 = icmp ne %m1861$.Type.type* %.tmp7558, %.tmp7563
br i1 %.tmp7564, label %.if.true.7565, label %.if.false.7565
.if.true.7565:
%.tmp7566 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7568 = getelementptr [4 x i8], [4 x i8]*@.str7567, i32 0, i32 0
%.tmp7569 = load i8*, i8** %buf.7481
%.tmp7570 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7566, i8* %.tmp7568, i8* %.tmp7569)
br label %.if.end.7565
.if.false.7565:
br label %.if.end.7565
.if.end.7565:
%.tmp7571 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7573 = getelementptr [5 x i8], [5 x i8]*@.str7572, i32 0, i32 0
%.tmp7574 = load i8*, i8** %buf.7481
%.tmp7575 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7576 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7555
%.tmp7577 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7575, %m1861$.Type.type* %.tmp7576)
%.tmp7578 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7571, i8* %.tmp7573, i8* %.tmp7574, i8* %.tmp7577)
%.tmp7579 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7555
%.tmp7580 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7579, i32 0, i32 4
%.tmp7581 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7580
store %m1861$.Type.type* %.tmp7581, %m1861$.Type.type** %p.7555
br label %.for.start.7549
.for.end.7549:
%.tmp7582 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7584 = getelementptr [4 x i8], [4 x i8]*@.str7583, i32 0, i32 0
%.tmp7585 = load i8*, i8** %buf.7481
%.tmp7586 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7582, i8* %.tmp7584, i8* %.tmp7585)
%.tmp7587 = load i8*, i8** %buf.7481
ret i8* %.tmp7587
br label %.if.end.7539
.if.false.7539:
%.tmp7588 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7589 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7588, i32 0, i32 0
%.tmp7590 = load i8*, i8** %.tmp7589
%.tmp7592 = getelementptr [4 x i8], [4 x i8]*@.str7591, i32 0, i32 0
%.tmp7593 = call i32(i8*,i8*) @strcmp(i8* %.tmp7590, i8* %.tmp7592)
%.tmp7594 = icmp eq i32 %.tmp7593, 0
br i1 %.tmp7594, label %.if.true.7595, label %.if.false.7595
.if.true.7595:
%.tmp7596 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7598 = getelementptr [4 x i8], [4 x i8]*@.str7597, i32 0, i32 0
%.tmp7599 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7600 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7601 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7600, i32 0, i32 3
%.tmp7602 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7601
%.tmp7603 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7599, %m1861$.Type.type* %.tmp7602)
%.tmp7604 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7596, i8* %.tmp7598, i8* %.tmp7603)
%.tmp7605 = load i8*, i8** %buf.7481
ret i8* %.tmp7605
br label %.if.end.7595
.if.false.7595:
%.tmp7606 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7607 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7606, i32 0, i32 0
%.tmp7608 = load i8*, i8** %.tmp7607
%.tmp7610 = getelementptr [7 x i8], [7 x i8]*@.str7609, i32 0, i32 0
%.tmp7611 = call i32(i8*,i8*) @strcmp(i8* %.tmp7608, i8* %.tmp7610)
%.tmp7612 = icmp eq i32 %.tmp7611, 0
br i1 %.tmp7612, label %.if.true.7613, label %.if.false.7613
.if.true.7613:
%.tmp7614 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7616 = getelementptr [2 x i8], [2 x i8]*@.str7615, i32 0, i32 0
%.tmp7617 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7614, i8* %.tmp7616)
%.tmp7619 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7620 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7619, i32 0, i32 3
%.tmp7621 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7620
%t.7622 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7621, %m1861$.Type.type** %t.7622
br label %.for.start.7618
.for.start.7618:
%.tmp7623 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7622
%.tmp7624 = icmp ne %m1861$.Type.type* %.tmp7623, null
br i1 %.tmp7624, label %.for.continue.7618, label %.for.end.7618
.for.continue.7618:
%.tmp7625 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7622
%.tmp7626 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7627 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7626, i32 0, i32 3
%.tmp7628 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7627
%.tmp7629 = icmp ne %m1861$.Type.type* %.tmp7625, %.tmp7628
br i1 %.tmp7629, label %.if.true.7630, label %.if.false.7630
.if.true.7630:
%.tmp7631 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7633 = getelementptr [4 x i8], [4 x i8]*@.str7632, i32 0, i32 0
%.tmp7634 = load i8*, i8** %buf.7481
%.tmp7635 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7631, i8* %.tmp7633, i8* %.tmp7634)
br label %.if.end.7630
.if.false.7630:
br label %.if.end.7630
.if.end.7630:
%.tmp7636 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7638 = getelementptr [5 x i8], [5 x i8]*@.str7637, i32 0, i32 0
%.tmp7639 = load i8*, i8** %buf.7481
%.tmp7640 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7641 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7622
%.tmp7642 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7640, %m1861$.Type.type* %.tmp7641)
%.tmp7643 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7636, i8* %.tmp7638, i8* %.tmp7639, i8* %.tmp7642)
%.tmp7644 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7622
%.tmp7645 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7644, i32 0, i32 4
%.tmp7646 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7645
store %m1861$.Type.type* %.tmp7646, %m1861$.Type.type** %t.7622
br label %.for.start.7618
.for.end.7618:
%.tmp7647 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7649 = getelementptr [4 x i8], [4 x i8]*@.str7648, i32 0, i32 0
%.tmp7650 = load i8*, i8** %buf.7481
%.tmp7651 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7647, i8* %.tmp7649, i8* %.tmp7650)
%.tmp7652 = load i8*, i8** %buf.7481
ret i8* %.tmp7652
br label %.if.end.7613
.if.false.7613:
%.tmp7653 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7654 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7653, i32 0, i32 0
%.tmp7655 = load i8*, i8** %.tmp7654
%.tmp7657 = getelementptr [6 x i8], [6 x i8]*@.str7656, i32 0, i32 0
%.tmp7658 = call i32(i8*,i8*) @strcmp(i8* %.tmp7655, i8* %.tmp7657)
%.tmp7659 = icmp eq i32 %.tmp7658, 0
br i1 %.tmp7659, label %.if.true.7660, label %.if.false.7660
.if.true.7660:
%.tmp7661 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7663 = getelementptr [10 x i8], [10 x i8]*@.str7662, i32 0, i32 0
%.tmp7664 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7665 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7664, i32 0, i32 3
%.tmp7666 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7665
%.tmp7667 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7666, i32 0, i32 4
%.tmp7668 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7667
%.tmp7669 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7668, i32 0, i32 0
%.tmp7670 = load i8*, i8** %.tmp7669
%.tmp7671 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7672 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7673 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7672, i32 0, i32 3
%.tmp7674 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7673
%.tmp7675 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7671, %m1861$.Type.type* %.tmp7674)
%.tmp7676 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7661, i8* %.tmp7663, i8* %.tmp7670, i8* %.tmp7675)
%.tmp7677 = load i8*, i8** %buf.7481
ret i8* %.tmp7677
br label %.if.end.7660
.if.false.7660:
%.tmp7678 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7679 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7678, i32 0, i32 0
%.tmp7680 = load i8*, i8** %.tmp7679
%.tmp7682 = getelementptr [10 x i8], [10 x i8]*@.str7681, i32 0, i32 0
%.tmp7683 = call i32(i8*,i8*) @strcmp(i8* %.tmp7680, i8* %.tmp7682)
%.tmp7684 = icmp eq i32 %.tmp7683, 0
br i1 %.tmp7684, label %.if.true.7685, label %.if.false.7685
.if.true.7685:
%.tmp7686 = getelementptr i8*, i8** %buf.7481, i32 0
%.tmp7688 = getelementptr [5 x i8], [5 x i8]*@.str7687, i32 0, i32 0
%.tmp7689 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7690 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7689, i32 0, i32 2
%.tmp7691 = load i8*, i8** %.tmp7690
%.tmp7692 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7686, i8* %.tmp7688, i8* %.tmp7691)
%.tmp7693 = load i8*, i8** %buf.7481
ret i8* %.tmp7693
br label %.if.end.7685
.if.false.7685:
%.tmp7694 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7695 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7694, i32 0, i32 0
%.tmp7696 = load i8*, i8** %.tmp7695
%.tmp7698 = getelementptr [7 x i8], [7 x i8]*@.str7697, i32 0, i32 0
%.tmp7699 = call i32(i8*,i8*) @strcmp(i8* %.tmp7696, i8* %.tmp7698)
%.tmp7700 = icmp eq i32 %.tmp7699, 0
br i1 %.tmp7700, label %.if.true.7701, label %.if.false.7701
.if.true.7701:
%.tmp7703 = getelementptr [4 x i8], [4 x i8]*@.str7702, i32 0, i32 0
ret i8* %.tmp7703
br label %.if.end.7701
.if.false.7701:
%.tmp7704 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7705 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7704, i32 0, i32 0
%.tmp7706 = load i8*, i8** %.tmp7705
%.tmp7708 = getelementptr [6 x i8], [6 x i8]*@.str7707, i32 0, i32 0
%.tmp7709 = call i32(i8*,i8*) @strcmp(i8* %.tmp7706, i8* %.tmp7708)
%.tmp7710 = icmp eq i32 %.tmp7709, 0
br i1 %.tmp7710, label %.if.true.7711, label %.if.false.7711
.if.true.7711:
br label %.if.end.7711
.if.false.7711:
%.tmp7713 = getelementptr [58 x i8], [58 x i8]*@.str7712, i32 0, i32 0
%.tmp7714 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7715 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7714, i32 0, i32 0
%.tmp7716 = load i8*, i8** %.tmp7715
%.tmp7717 = call i32(i8*,...) @printf(i8* %.tmp7713, i8* %.tmp7716)
br label %.if.end.7711
.if.end.7711:
br label %.if.end.7701
.if.end.7701:
br label %.if.end.7685
.if.end.7685:
br label %.if.end.7660
.if.end.7660:
br label %.if.end.7613
.if.end.7613:
br label %.if.end.7595
.if.end.7595:
br label %.if.end.7539
.if.end.7539:
br label %.if.end.7529
.if.end.7529:
br label %.if.end.7519
.if.end.7519:
br label %.if.end.7509
.if.end.7509:
br label %.if.end.7499
.if.end.7499:
br label %.if.end.7489
.if.end.7489:
%.tmp7718 = bitcast ptr null to i8*
ret i8* %.tmp7718
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7719 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7720 = ptrtoint %m1861$.ErrorList.type* %.tmp7719 to i32
%.tmp7721 = call i8*(i32) @malloc(i32 %.tmp7720)
%.tmp7722 = bitcast i8* %.tmp7721 to %m1861$.ErrorList.type*
%new_err.7723 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7722, %m1861$.ErrorList.type** %new_err.7723
%.tmp7724 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7723
%.tmp7725 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7724, i32 0, i32 2
store i1 0, i1* %.tmp7725
%.tmp7726 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7723
%.tmp7727 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7726, i32 0, i32 0
%.tmp7728 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7728, %m751$.Error.type** %.tmp7727
%.tmp7729 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7723
%.tmp7730 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7729, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7730
%.tmp7731 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7732 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7731, i32 0, i32 2
%.tmp7733 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7732
%.tmp7734 = icmp eq %m1861$.ErrorList.type* %.tmp7733, null
br i1 %.tmp7734, label %.if.true.7735, label %.if.false.7735
.if.true.7735:
%.tmp7736 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7737 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7736, i32 0, i32 2
%.tmp7738 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7723
store %m1861$.ErrorList.type* %.tmp7738, %m1861$.ErrorList.type** %.tmp7737
ret void
br label %.if.end.7735
.if.false.7735:
br label %.if.end.7735
.if.end.7735:
%last.7739 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7739
%.tmp7741 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7742 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7741, i32 0, i32 2
%.tmp7743 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7742
store %m1861$.ErrorList.type* %.tmp7743, %m1861$.ErrorList.type** %last.7739
br label %.for.start.7740
.for.start.7740:
%.tmp7744 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7739
%.tmp7745 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7744, i32 0, i32 1
%.tmp7746 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7745
%.tmp7747 = icmp ne %m1861$.ErrorList.type* %.tmp7746, null
br i1 %.tmp7747, label %.for.continue.7740, label %.for.end.7740
.for.continue.7740:
%.tmp7748 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7739
%.tmp7749 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7748, i32 0, i32 1
%.tmp7750 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7749
store %m1861$.ErrorList.type* %.tmp7750, %m1861$.ErrorList.type** %last.7739
br label %.for.start.7740
.for.end.7740:
%.tmp7751 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7739
%.tmp7752 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7751, i32 0, i32 1
%.tmp7753 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7723
store %m1861$.ErrorList.type* %.tmp7753, %m1861$.ErrorList.type** %.tmp7752
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7754 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7755 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7754, i32 0, i32 6
%.tmp7756 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7755
%.tmp7757 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7756, i32 0, i32 7
%.tmp7758 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7757
%.tmp7759 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7758, i32 0, i32 1
%.tmp7760 = load i8*, i8** %.tmp7759
ret i8* %.tmp7760
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7762 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7763 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7762, %m307$.Node.type** %n.7763
br label %.for.start.7761
.for.start.7761:
%.tmp7764 = load %m307$.Node.type*, %m307$.Node.type** %n.7763
%.tmp7765 = icmp ne %m307$.Node.type* %.tmp7764, null
br i1 %.tmp7765, label %.for.continue.7761, label %.for.end.7761
.for.continue.7761:
%.tmp7766 = load %m307$.Node.type*, %m307$.Node.type** %n.7763
%.tmp7767 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7766, i32 0, i32 0
%.tmp7768 = load i8*, i8** %.tmp7767
%.tmp7769 = load i8*, i8** %type
%.tmp7770 = call i32(i8*,i8*) @strcmp(i8* %.tmp7768, i8* %.tmp7769)
%.tmp7771 = icmp eq i32 %.tmp7770, 0
br i1 %.tmp7771, label %.if.true.7772, label %.if.false.7772
.if.true.7772:
%.tmp7773 = load %m307$.Node.type*, %m307$.Node.type** %n.7763
ret %m307$.Node.type* %.tmp7773
br label %.if.end.7772
.if.false.7772:
br label %.if.end.7772
.if.end.7772:
%.tmp7774 = load %m307$.Node.type*, %m307$.Node.type** %n.7763
%.tmp7775 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7774, i32 0, i32 7
%.tmp7776 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7775
store %m307$.Node.type* %.tmp7776, %m307$.Node.type** %n.7763
br label %.for.start.7761
.for.end.7761:
%.tmp7777 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7777
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7778 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7779 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7778, %m1861$.Type.type** %function_type.7779
%.tmp7780 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7781 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7782 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7781, i32 0, i32 6
%.tmp7783 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7782
%.tmp7784 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7780, %m307$.Node.type* %.tmp7783)
%return_value_type.7785 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7784, %m1861$.Type.type** %return_value_type.7785
%.tmp7786 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7779
%.tmp7787 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7786, i32 0, i32 0
%.tmp7789 = getelementptr [9 x i8], [9 x i8]*@.str7788, i32 0, i32 0
store i8* %.tmp7789, i8** %.tmp7787
%.tmp7790 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7779
%.tmp7791 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7790, i32 0, i32 3
%.tmp7792 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7785
store %m1861$.Type.type* %.tmp7792, %m1861$.Type.type** %.tmp7791
%.tmp7793 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7785
%last_type.7794 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7793, %m1861$.Type.type** %last_type.7794
%.tmp7795 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7796 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7795)
%params.7797 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7796, %m307$.Node.type** %params.7797
%.tmp7799 = load %m307$.Node.type*, %m307$.Node.type** %params.7797
%param_ptr.7800 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7799, %m307$.Node.type** %param_ptr.7800
br label %.for.start.7798
.for.start.7798:
%.tmp7801 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7802 = icmp ne %m307$.Node.type* %.tmp7801, null
br i1 %.tmp7802, label %.for.continue.7798, label %.for.end.7798
.for.continue.7798:
%.tmp7803 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7804 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7803, i32 0, i32 0
%.tmp7805 = load i8*, i8** %.tmp7804
%.tmp7807 = getelementptr [5 x i8], [5 x i8]*@.str7806, i32 0, i32 0
%.tmp7808 = call i32(i8*,i8*) @strcmp(i8* %.tmp7805, i8* %.tmp7807)
%.tmp7809 = icmp eq i32 %.tmp7808, 0
br i1 %.tmp7809, label %.if.true.7810, label %.if.false.7810
.if.true.7810:
%.tmp7811 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7794
%.tmp7812 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7811, i32 0, i32 4
%.tmp7813 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7794
%.tmp7814 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7813)
store %m1861$.Type.type* %.tmp7814, %m1861$.Type.type** %.tmp7812
%.tmp7815 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7794
%.tmp7816 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7815, i32 0, i32 4
%.tmp7817 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7816
%.tmp7818 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7817, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7818
%.tmp7819 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7794
%.tmp7820 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7819, i32 0, i32 4
%.tmp7821 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7820
store %m1861$.Type.type* %.tmp7821, %m1861$.Type.type** %last_type.7794
%.tmp7822 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7823 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7822, i32 0, i32 7
%.tmp7824 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7823
%.tmp7825 = icmp ne %m307$.Node.type* %.tmp7824, null
br i1 %.tmp7825, label %.if.true.7826, label %.if.false.7826
.if.true.7826:
%.tmp7827 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7828 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7827, i32 0, i32 7
%.tmp7829 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7828
store %m307$.Node.type* %.tmp7829, %m307$.Node.type** %param_ptr.7800
br label %.if.end.7826
.if.false.7826:
br label %.if.end.7826
.if.end.7826:
%.tmp7830 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7831 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7830, i32 0, i32 7
%.tmp7832 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7831
%.tmp7833 = icmp ne %m307$.Node.type* %.tmp7832, null
br i1 %.tmp7833, label %.if.true.7834, label %.if.false.7834
.if.true.7834:
%.tmp7835 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7836 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7835, i32 0, i32 7
%.tmp7837 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7836
store %m307$.Node.type* %.tmp7837, %m307$.Node.type** %param_ptr.7800
br label %.if.end.7834
.if.false.7834:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7800
br label %.if.end.7834
.if.end.7834:
br label %.if.end.7810
.if.false.7810:
%.tmp7838 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7839 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7840 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7839, i32 0, i32 6
%.tmp7841 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7840
%.tmp7842 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7838, %m307$.Node.type* %.tmp7841)
%param_type.7843 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7842, %m1861$.Type.type** %param_type.7843
%.tmp7844 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7794
%.tmp7845 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7844, i32 0, i32 4
%.tmp7846 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7843
store %m1861$.Type.type* %.tmp7846, %m1861$.Type.type** %.tmp7845
%.tmp7847 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7843
store %m1861$.Type.type* %.tmp7847, %m1861$.Type.type** %last_type.7794
%.tmp7848 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7849 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7848, i32 0, i32 7
%.tmp7850 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7849
store %m307$.Node.type* %.tmp7850, %m307$.Node.type** %param_ptr.7800
%.tmp7851 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7852 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7851, i32 0, i32 7
%.tmp7853 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7852
%.tmp7854 = icmp ne %m307$.Node.type* %.tmp7853, null
br i1 %.tmp7854, label %.if.true.7855, label %.if.false.7855
.if.true.7855:
%.tmp7856 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7800
%.tmp7857 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7856, i32 0, i32 7
%.tmp7858 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7857
%.tmp7859 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7858, i32 0, i32 7
%.tmp7860 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7859
store %m307$.Node.type* %.tmp7860, %m307$.Node.type** %param_ptr.7800
br label %.if.end.7855
.if.false.7855:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7800
br label %.if.end.7855
.if.end.7855:
br label %.if.end.7810
.if.end.7810:
br label %.for.start.7798
.for.end.7798:
%.tmp7861 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7779
ret %m1861$.Type.type* %.tmp7861
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7862 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7864 = getelementptr [10 x i8], [10 x i8]*@.str7863, i32 0, i32 0
%.tmp7865 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7862, i8* %.tmp7864)
%params.7866 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7865, %m307$.Node.type** %params.7866
%.tmp7867 = load %m307$.Node.type*, %m307$.Node.type** %params.7866
%.tmp7868 = icmp eq %m307$.Node.type* %.tmp7867, null
br i1 %.tmp7868, label %.if.true.7869, label %.if.false.7869
.if.true.7869:
%.tmp7870 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7870
br label %.if.end.7869
.if.false.7869:
br label %.if.end.7869
.if.end.7869:
%.tmp7871 = load %m307$.Node.type*, %m307$.Node.type** %params.7866
%.tmp7872 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7871, i32 0, i32 6
%.tmp7873 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7872
ret %m307$.Node.type* %.tmp7873
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7874 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.7875 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7874, %m1861$.Type.type** %t.7875
%.tmp7876 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7877 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7876, i32 0, i32 0
%.tmp7878 = load i8*, i8** %.tmp7877
%.tmp7880 = getelementptr [10 x i8], [10 x i8]*@.str7879, i32 0, i32 0
%.tmp7881 = call i32(i8*,i8*) @strcmp(i8* %.tmp7878, i8* %.tmp7880)
%.tmp7882 = icmp eq i32 %.tmp7881, 0
br i1 %.tmp7882, label %.if.true.7883, label %.if.false.7883
.if.true.7883:
%.tmp7884 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7885 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7884, i32 0, i32 0
%.tmp7887 = getelementptr [7 x i8], [7 x i8]*@.str7886, i32 0, i32 0
store i8* %.tmp7887, i8** %.tmp7885
%.tmp7888 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7889 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7888, i32 0, i32 1
store i8* null, i8** %.tmp7889
%.tmp7890 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7891 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7890, i32 0, i32 6
%.tmp7892 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7891
%.tmp7894 = getelementptr [5 x i8], [5 x i8]*@.str7893, i32 0, i32 0
%.tmp7895 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7892, i8* %.tmp7894)
%curr_type.7896 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7895, %m307$.Node.type** %curr_type.7896
%.tmp7897 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7898 = icmp ne %m307$.Node.type* %.tmp7897, null
br i1 %.tmp7898, label %.if.true.7899, label %.if.false.7899
.if.true.7899:
%.tmp7900 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7901 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7900, i32 0, i32 3
%.tmp7902 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7903 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7904 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7903, i32 0, i32 6
%.tmp7905 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7904
%.tmp7906 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7902, %m307$.Node.type* %.tmp7905)
store %m1861$.Type.type* %.tmp7906, %m1861$.Type.type** %.tmp7901
%.tmp7907 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7908 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7907, i32 0, i32 3
%.tmp7909 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7908
%.tmp7910 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7909, i32 0, i32 1
%.tmp7911 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7912 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7911, i32 0, i32 7
%.tmp7913 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7912
%.tmp7914 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7913, i32 0, i32 1
%.tmp7915 = load i8*, i8** %.tmp7914
store i8* %.tmp7915, i8** %.tmp7910
%.tmp7916 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7917 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7916, i32 0, i32 3
%.tmp7918 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7917
%curr_t.7919 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7918, %m1861$.Type.type** %curr_t.7919
%.tmp7921 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7922 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7921, i32 0, i32 7
%.tmp7923 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7922
%.tmp7925 = getelementptr [5 x i8], [5 x i8]*@.str7924, i32 0, i32 0
%.tmp7926 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7923, i8* %.tmp7925)
store %m307$.Node.type* %.tmp7926, %m307$.Node.type** %curr_type.7896
br label %.for.start.7920
.for.start.7920:
%.tmp7927 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7928 = icmp ne %m307$.Node.type* %.tmp7927, null
br i1 %.tmp7928, label %.for.continue.7920, label %.for.end.7920
.for.continue.7920:
%.tmp7929 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7919
%.tmp7930 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7929, i32 0, i32 4
%.tmp7931 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7932 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7933 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7932, i32 0, i32 6
%.tmp7934 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7933
%.tmp7935 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7931, %m307$.Node.type* %.tmp7934)
store %m1861$.Type.type* %.tmp7935, %m1861$.Type.type** %.tmp7930
%.tmp7936 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7919
%.tmp7937 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7936, i32 0, i32 4
%.tmp7938 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7937
%.tmp7939 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7938, i32 0, i32 1
%.tmp7940 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7941 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7940, i32 0, i32 7
%.tmp7942 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7941
%.tmp7943 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7942, i32 0, i32 1
%.tmp7944 = load i8*, i8** %.tmp7943
store i8* %.tmp7944, i8** %.tmp7939
%.tmp7945 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.7919
%.tmp7946 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7945, i32 0, i32 4
%.tmp7947 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7946
store %m1861$.Type.type* %.tmp7947, %m1861$.Type.type** %curr_t.7919
%.tmp7948 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.7896
%.tmp7949 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7948, i32 0, i32 7
%.tmp7950 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7949
%.tmp7952 = getelementptr [5 x i8], [5 x i8]*@.str7951, i32 0, i32 0
%.tmp7953 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7950, i8* %.tmp7952)
store %m307$.Node.type* %.tmp7953, %m307$.Node.type** %curr_type.7896
br label %.for.start.7920
.for.end.7920:
br label %.if.end.7899
.if.false.7899:
br label %.if.end.7899
.if.end.7899:
br label %.if.end.7883
.if.false.7883:
%.tmp7954 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7955 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7954, i32 0, i32 0
%.tmp7956 = load i8*, i8** %.tmp7955
%.tmp7958 = getelementptr [12 x i8], [12 x i8]*@.str7957, i32 0, i32 0
%.tmp7959 = call i32(i8*,i8*) @strcmp(i8* %.tmp7956, i8* %.tmp7958)
%.tmp7960 = icmp eq i32 %.tmp7959, 0
br i1 %.tmp7960, label %.if.true.7961, label %.if.false.7961
.if.true.7961:
%err_msg.7962 = alloca i8*
store i8* null, i8** %err_msg.7962
%.tmp7963 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7964 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7965 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7963, %m307$.Node.type* %.tmp7964)
%base.7966 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp7965, %m1861$.ScopeItem.type** %base.7966
%.tmp7967 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7966
%.tmp7968 = icmp eq %m1861$.ScopeItem.type* %.tmp7967, null
br i1 %.tmp7968, label %.if.true.7969, label %.if.false.7969
.if.true.7969:
%.tmp7970 = getelementptr i8*, i8** %err_msg.7962, i32 0
%.tmp7972 = getelementptr [37 x i8], [37 x i8]*@.str7971, i32 0, i32 0
%.tmp7973 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7974 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7973, i32 0, i32 6
%.tmp7975 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7974
%.tmp7976 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7975, i32 0, i32 1
%.tmp7977 = load i8*, i8** %.tmp7976
%.tmp7978 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7970, i8* %.tmp7972, i8* %.tmp7977)
%.tmp7979 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7980 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7981 = load i8*, i8** %err_msg.7962
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7979, %m307$.Node.type* %.tmp7980, i8* %.tmp7981)
%.tmp7982 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7983 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7982, i32 0, i32 0
%.tmp7985 = getelementptr [6 x i8], [6 x i8]*@.str7984, i32 0, i32 0
store i8* %.tmp7985, i8** %.tmp7983
%.tmp7986 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
ret %m1861$.Type.type* %.tmp7986
br label %.if.end.7969
.if.false.7969:
br label %.if.end.7969
.if.end.7969:
%.tmp7987 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7988 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7987, i32 0, i32 0
%.tmp7990 = getelementptr [10 x i8], [10 x i8]*@.str7989, i32 0, i32 0
store i8* %.tmp7990, i8** %.tmp7988
%.tmp7991 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7992 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7991, i32 0, i32 1
%.tmp7993 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7966
%.tmp7994 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7993, i32 0, i32 0
%.tmp7995 = load i8*, i8** %.tmp7994
store i8* %.tmp7995, i8** %.tmp7992
%.tmp7996 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp7997 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7996, i32 0, i32 2
%.tmp7998 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7966
%.tmp7999 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp7998, i32 0, i32 1
%.tmp8000 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7999
%.tmp8001 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8000, i32 0, i32 0
%.tmp8002 = load i8*, i8** %.tmp8001
store i8* %.tmp8002, i8** %.tmp7997
%.tmp8003 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp8004 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8003, i32 0, i32 3
%.tmp8005 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.7966
%.tmp8006 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8005, i32 0, i32 1
%.tmp8007 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8006
%.tmp8008 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8007, i32 0, i32 3
%.tmp8009 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8008
store %m1861$.Type.type* %.tmp8009, %m1861$.Type.type** %.tmp8004
br label %.if.end.7961
.if.false.7961:
%.tmp8010 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8011 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8010, i32 0, i32 1
%.tmp8012 = load i8*, i8** %.tmp8011
%.tmp8014 = getelementptr [4 x i8], [4 x i8]*@.str8013, i32 0, i32 0
%.tmp8015 = call i32(i8*,i8*) @strcmp(i8* %.tmp8012, i8* %.tmp8014)
%.tmp8016 = icmp eq i32 %.tmp8015, 0
br i1 %.tmp8016, label %.if.true.8017, label %.if.false.8017
.if.true.8017:
%.tmp8018 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp8019 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8018, i32 0, i32 0
%.tmp8021 = getelementptr [4 x i8], [4 x i8]*@.str8020, i32 0, i32 0
store i8* %.tmp8021, i8** %.tmp8019
%.tmp8022 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp8023 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8022, i32 0, i32 3
%.tmp8024 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp8024, %m1861$.Type.type** %.tmp8023
%.tmp8025 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp8026 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8025, i32 0, i32 3
%.tmp8027 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8026
%.tmp8028 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8027, i32 0, i32 0
%.tmp8030 = getelementptr [4 x i8], [4 x i8]*@.str8029, i32 0, i32 0
store i8* %.tmp8030, i8** %.tmp8028
br label %.if.end.8017
.if.false.8017:
%.tmp8031 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8032 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8031, i32 0, i32 0
%.tmp8033 = load i8*, i8** %.tmp8032
%.tmp8035 = getelementptr [5 x i8], [5 x i8]*@.str8034, i32 0, i32 0
%.tmp8036 = call i32(i8*,i8*) @strcmp(i8* %.tmp8033, i8* %.tmp8035)
%.tmp8037 = icmp eq i32 %.tmp8036, 0
br i1 %.tmp8037, label %.if.true.8038, label %.if.false.8038
.if.true.8038:
%.tmp8039 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp8040 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8039, i32 0, i32 0
%.tmp8041 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8042 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8041, i32 0, i32 1
%.tmp8043 = load i8*, i8** %.tmp8042
store i8* %.tmp8043, i8** %.tmp8040
br label %.if.end.8038
.if.false.8038:
%.tmp8044 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8045 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8044, i32 0, i32 1
%.tmp8046 = load i8*, i8** %.tmp8045
%.tmp8048 = getelementptr [4 x i8], [4 x i8]*@.str8047, i32 0, i32 0
%.tmp8049 = call i32(i8*,i8*) @strcmp(i8* %.tmp8046, i8* %.tmp8048)
%.tmp8050 = icmp eq i32 %.tmp8049, 0
br i1 %.tmp8050, label %.if.true.8051, label %.if.false.8051
.if.true.8051:
%.tmp8052 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
%.tmp8053 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8052, i32 0, i32 0
%.tmp8055 = getelementptr [7 x i8], [7 x i8]*@.str8054, i32 0, i32 0
store i8* %.tmp8055, i8** %.tmp8053
br label %.if.end.8051
.if.false.8051:
%.tmp8056 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8057 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8059 = getelementptr [54 x i8], [54 x i8]*@.str8058, i32 0, i32 0
%.tmp8060 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8056, %m307$.Node.type* %.tmp8057, i8* %.tmp8059)
%.tmp8061 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8062 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8061, i32 0, i32 0
%.tmp8063 = load i8*, i8** %.tmp8062
%.tmp8064 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8065 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8064, i32 0, i32 1
%.tmp8066 = load i8*, i8** %.tmp8065
%.tmp8067 = call i32(i8*,...) @printf(i8* %.tmp8060, i8* %.tmp8063, i8* %.tmp8066)
%.tmp8068 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8068
br label %.if.end.8051
.if.end.8051:
br label %.if.end.8038
.if.end.8038:
br label %.if.end.8017
.if.end.8017:
br label %.if.end.7961
.if.end.7961:
br label %.if.end.7883
.if.end.7883:
%.tmp8070 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8071 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8070, i32 0, i32 7
%.tmp8072 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8071
%ptr.8073 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8072, %m307$.Node.type** %ptr.8073
br label %.for.start.8069
.for.start.8069:
%.tmp8074 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8075 = icmp ne %m307$.Node.type* %.tmp8074, null
br i1 %.tmp8075, label %.for.continue.8069, label %.for.end.8069
.for.continue.8069:
%.tmp8076 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8077 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8076, i32 0, i32 1
%.tmp8078 = load i8*, i8** %.tmp8077
%.tmp8080 = getelementptr [2 x i8], [2 x i8]*@.str8079, i32 0, i32 0
%.tmp8081 = call i32(i8*,i8*) @strcmp(i8* %.tmp8078, i8* %.tmp8080)
%.tmp8082 = icmp eq i32 %.tmp8081, 0
br i1 %.tmp8082, label %.if.true.8083, label %.if.false.8083
.if.true.8083:
%.tmp8084 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.8085 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8084, %m1861$.Type.type** %pt.8085
%.tmp8086 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8085
%.tmp8087 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8086, i32 0, i32 0
%.tmp8089 = getelementptr [4 x i8], [4 x i8]*@.str8088, i32 0, i32 0
store i8* %.tmp8089, i8** %.tmp8087
%.tmp8090 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8085
%.tmp8091 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8090, i32 0, i32 3
%.tmp8092 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
store %m1861$.Type.type* %.tmp8092, %m1861$.Type.type** %.tmp8091
%.tmp8093 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8085
store %m1861$.Type.type* %.tmp8093, %m1861$.Type.type** %t.7875
br label %.if.end.8083
.if.false.8083:
%.tmp8094 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8095 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8094, i32 0, i32 1
%.tmp8096 = load i8*, i8** %.tmp8095
%.tmp8098 = getelementptr [2 x i8], [2 x i8]*@.str8097, i32 0, i32 0
%.tmp8099 = call i32(i8*,i8*) @strcmp(i8* %.tmp8096, i8* %.tmp8098)
%.tmp8100 = icmp eq i32 %.tmp8099, 0
br i1 %.tmp8100, label %.if.true.8101, label %.if.false.8101
.if.true.8101:
%.tmp8102 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8103 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8102, i32 0, i32 7
%.tmp8104 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8103
%.tmp8105 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8104, i32 0, i32 1
%.tmp8106 = load i8*, i8** %.tmp8105
%.tmp8108 = getelementptr [2 x i8], [2 x i8]*@.str8107, i32 0, i32 0
%.tmp8109 = call i32(i8*,i8*) @strcmp(i8* %.tmp8106, i8* %.tmp8108)
%.tmp8110 = icmp eq i32 %.tmp8109, 0
br i1 %.tmp8110, label %.if.true.8111, label %.if.false.8111
.if.true.8111:
%.tmp8112 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.8113 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8112, %m1861$.Type.type** %slice_type.8113
%.tmp8114 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8113
%.tmp8115 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8114, i32 0, i32 0
%.tmp8117 = getelementptr [7 x i8], [7 x i8]*@.str8116, i32 0, i32 0
store i8* %.tmp8117, i8** %.tmp8115
%.tmp8118 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8113
%.tmp8119 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8118, i32 0, i32 1
%.tmp8121 = getelementptr [6 x i8], [6 x i8]*@.str8120, i32 0, i32 0
store i8* %.tmp8121, i8** %.tmp8119
%.tmp8122 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.8123 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8122, %m1861$.Type.type** %slice_c_array.8123
%.tmp8124 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8123
%.tmp8125 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8124, i32 0, i32 0
%.tmp8127 = getelementptr [4 x i8], [4 x i8]*@.str8126, i32 0, i32 0
store i8* %.tmp8127, i8** %.tmp8125
%.tmp8128 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8123
%.tmp8129 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8128, i32 0, i32 1
%.tmp8131 = getelementptr [6 x i8], [6 x i8]*@.str8130, i32 0, i32 0
store i8* %.tmp8131, i8** %.tmp8129
%.tmp8132 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8123
%.tmp8133 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8132, i32 0, i32 3
%.tmp8134 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
store %m1861$.Type.type* %.tmp8134, %m1861$.Type.type** %.tmp8133
%.tmp8135 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8113
%.tmp8136 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8135, i32 0, i32 3
%.tmp8137 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8123
store %m1861$.Type.type* %.tmp8137, %m1861$.Type.type** %.tmp8136
%.tmp8138 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.8139 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8138, %m1861$.Type.type** %slice_len.8139
%.tmp8140 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8139
%.tmp8141 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8140, i32 0, i32 0
%.tmp8143 = getelementptr [4 x i8], [4 x i8]*@.str8142, i32 0, i32 0
store i8* %.tmp8143, i8** %.tmp8141
%.tmp8144 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8139
%.tmp8145 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8144, i32 0, i32 1
%.tmp8147 = getelementptr [4 x i8], [4 x i8]*@.str8146, i32 0, i32 0
store i8* %.tmp8147, i8** %.tmp8145
%.tmp8148 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8123
%.tmp8149 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8148, i32 0, i32 4
%.tmp8150 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8139
store %m1861$.Type.type* %.tmp8150, %m1861$.Type.type** %.tmp8149
%.tmp8151 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.8152 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8151, %m1861$.Type.type** %slice_cap.8152
%.tmp8153 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8152
%.tmp8154 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8153, i32 0, i32 0
%.tmp8156 = getelementptr [4 x i8], [4 x i8]*@.str8155, i32 0, i32 0
store i8* %.tmp8156, i8** %.tmp8154
%.tmp8157 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8152
%.tmp8158 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8157, i32 0, i32 1
%.tmp8160 = getelementptr [4 x i8], [4 x i8]*@.str8159, i32 0, i32 0
store i8* %.tmp8160, i8** %.tmp8158
%.tmp8161 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8139
%.tmp8162 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8161, i32 0, i32 4
%.tmp8163 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8152
store %m1861$.Type.type* %.tmp8163, %m1861$.Type.type** %.tmp8162
%.tmp8164 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8113
store %m1861$.Type.type* %.tmp8164, %m1861$.Type.type** %t.7875
%.tmp8165 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8166 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8165, i32 0, i32 7
%.tmp8167 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8166
store %m307$.Node.type* %.tmp8167, %m307$.Node.type** %ptr.8073
br label %.if.end.8111
.if.false.8111:
br label %.if.end.8111
.if.end.8111:
br label %.if.end.8101
.if.false.8101:
%.tmp8168 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8169 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8171 = getelementptr [49 x i8], [49 x i8]*@.str8170, i32 0, i32 0
%.tmp8172 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8168, %m307$.Node.type* %.tmp8169, i8* %.tmp8171)
%.tmp8173 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8174 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8173, i32 0, i32 1
%.tmp8175 = load i8*, i8** %.tmp8174
%.tmp8176 = call i32(i8*,...) @printf(i8* %.tmp8172, i8* %.tmp8175)
%.tmp8177 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8177
br label %.if.end.8101
.if.end.8101:
br label %.if.end.8083
.if.end.8083:
%.tmp8178 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8073
%.tmp8179 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8178, i32 0, i32 7
%.tmp8180 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8179
store %m307$.Node.type* %.tmp8180, %m307$.Node.type** %ptr.8073
br label %.for.start.8069
.for.end.8069:
%.tmp8181 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7875
ret %m1861$.Type.type* %.tmp8181
}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8182 = load i32, i32* %argc
%.tmp8183 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp8182, i8** %.tmp8183)
%.tmp8184 = load i32, i32* @STDERR
%.tmp8186 = getelementptr [2 x i8], [2 x i8]*@.str8185, i32 0, i32 0
%.tmp8187 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp8184, i8* %.tmp8186)
%stderr.8188 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8187, %m0$.File.type** %stderr.8188
%.tmp8189 = load i8**, i8*** %argv
%.tmp8190 = getelementptr i8*, i8** %.tmp8189, i32 1
%.tmp8191 = load i8*, i8** %.tmp8190
%filename.8192 = alloca i8*
store i8* %.tmp8191, i8** %filename.8192
%.tmp8193 = call %m0$.File.type*() @tmpfile()
%llvm_code.8194 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8193, %m0$.File.type** %llvm_code.8194
%.tmp8195 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8194
%.tmp8196 = load i8*, i8** %filename.8192
%.tmp8197 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp8195, i8* %.tmp8196)
%compiler_ctx.8198 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp8197, %m1861$.CompilerCtx.type** %compiler_ctx.8198
%.tmp8199 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.8198
%.tmp8200 = bitcast ptr null to %m307$.Node.type*
%.tmp8201 = load i8*, i8** %filename.8192
%.tmp8202 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8199, %m307$.Node.type* %.tmp8200, i8* %.tmp8201)
br i1 %.tmp8202, label %.if.true.8203, label %.if.false.8203
.if.true.8203:
%.tmp8204 = load %m0$.File.type*, %m0$.File.type** %stderr.8188
%.tmp8206 = getelementptr [34 x i8], [34 x i8]*@.str8205, i32 0, i32 0
%.tmp8207 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8204, i8* %.tmp8206)
ret i32 1
br label %.if.end.8203
.if.false.8203:
br label %.if.end.8203
.if.end.8203:
%.tmp8208 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8194
%.tmp8209 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp8208)
%.tmp8210 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8194
%.tmp8211 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp8210)
%llvm_code_size.8212 = alloca i32
store i32 %.tmp8211, i32* %llvm_code_size.8212
%.tmp8213 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8194
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp8213)
%.tmp8215 = getelementptr [30 x i8], [30 x i8]*@.str8214, i32 0, i32 0
%.tmp8217 = getelementptr [2 x i8], [2 x i8]*@.str8216, i32 0, i32 0
%.tmp8218 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8215, i8* %.tmp8217)
%proc.8219 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8218, %m0$.File.type** %proc.8219
%.tmp8220 = load %m0$.File.type*, %m0$.File.type** %proc.8219
%.tmp8221 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8220)
%.tmp8222 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8194
%.tmp8223 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8222)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp8221, i32 %.tmp8223)
%.tmp8224 = load %m0$.File.type*, %m0$.File.type** %proc.8219
%.tmp8225 = icmp eq %m0$.File.type* %.tmp8224, null
br i1 %.tmp8225, label %.if.true.8226, label %.if.false.8226
.if.true.8226:
%.tmp8227 = load %m0$.File.type*, %m0$.File.type** %stderr.8188
%.tmp8229 = getelementptr [28 x i8], [28 x i8]*@.str8228, i32 0, i32 0
%.tmp8230 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8227, i8* %.tmp8229)
ret i32 0
br label %.if.end.8226
.if.false.8226:
br label %.if.end.8226
.if.end.8226:
%.tmp8231 = load %m0$.File.type*, %m0$.File.type** %proc.8219
%.tmp8232 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8231)
%.tmp8233 = icmp ne i32 %.tmp8232, 0
br i1 %.tmp8233, label %.if.true.8234, label %.if.false.8234
.if.true.8234:
%.tmp8235 = load %m0$.File.type*, %m0$.File.type** %stderr.8188
%.tmp8237 = getelementptr [24 x i8], [24 x i8]*@.str8236, i32 0, i32 0
%.tmp8238 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8235, i8* %.tmp8237)
ret i32 0
br label %.if.end.8234
.if.false.8234:
br label %.if.end.8234
.if.end.8234:
%.tmp8240 = getelementptr [16 x i8], [16 x i8]*@.str8239, i32 0, i32 0
%.tmp8242 = getelementptr [2 x i8], [2 x i8]*@.str8241, i32 0, i32 0
%.tmp8243 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8240, i8* %.tmp8242)
%cc_proc.8244 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8243, %m0$.File.type** %cc_proc.8244
%.tmp8245 = load %m0$.File.type*, %m0$.File.type** %cc_proc.8244
%.tmp8246 = icmp eq %m0$.File.type* %.tmp8245, null
br i1 %.tmp8246, label %.if.true.8247, label %.if.false.8247
.if.true.8247:
%.tmp8248 = load %m0$.File.type*, %m0$.File.type** %stderr.8188
%.tmp8250 = getelementptr [28 x i8], [28 x i8]*@.str8249, i32 0, i32 0
%.tmp8251 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8248, i8* %.tmp8250)
ret i32 0
br label %.if.end.8247
.if.false.8247:
br label %.if.end.8247
.if.end.8247:
%.tmp8252 = load %m0$.File.type*, %m0$.File.type** %proc.8219
%.tmp8253 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8252)
%.tmp8254 = icmp ne i32 %.tmp8253, 0
br i1 %.tmp8254, label %.if.true.8255, label %.if.false.8255
.if.true.8255:
%.tmp8256 = load %m0$.File.type*, %m0$.File.type** %stderr.8188
%.tmp8258 = getelementptr [22 x i8], [22 x i8]*@.str8257, i32 0, i32 0
%.tmp8259 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8256, i8* %.tmp8258)
br label %.if.end.8255
.if.false.8255:
%.tmp8261 = getelementptr [32 x i8], [32 x i8]*@.str8260, i32 0, i32 0
%.tmp8262 = load i8*, i8** %filename.8192
%.tmp8263 = call i32(i8*,...) @printf(i8* %.tmp8261, i8* %.tmp8262)
br label %.if.end.8255
.if.end.8255:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8264 = load i32, i32* %argc
%.tmp8265 = icmp eq i32 %.tmp8264, 2
br i1 %.tmp8265, label %.if.true.8266, label %.if.false.8266
.if.true.8266:
ret void
br label %.if.end.8266
.if.false.8266:
br label %.if.end.8266
.if.end.8266:
%.tmp8268 = getelementptr [21 x i8], [21 x i8]*@.str8267, i32 0, i32 0
%tmpl.8269 = alloca i8*
store i8* %.tmp8268, i8** %tmpl.8269
%.tmp8270 = load i8**, i8*** %argv
%.tmp8271 = getelementptr i8*, i8** %.tmp8270, i32 0
%.tmp8272 = load i8*, i8** %.tmp8271
%.tmp8273 = call i32(i8*) @strlen(i8* %.tmp8272)
%.tmp8274 = load i8*, i8** %tmpl.8269
%.tmp8275 = call i32(i8*) @strlen(i8* %.tmp8274)
%.tmp8276 = add i32 %.tmp8273, %.tmp8275
%len_filename.8277 = alloca i32
store i32 %.tmp8276, i32* %len_filename.8277
%.tmp8278 = load i32, i32* %len_filename.8277
%.tmp8279 = call i8*(i32) @malloc(i32 %.tmp8278)
%buf.8280 = alloca i8*
store i8* %.tmp8279, i8** %buf.8280
%.tmp8281 = load i8*, i8** %buf.8280
%.tmp8282 = load i8*, i8** %tmpl.8269
%.tmp8283 = load i8**, i8*** %argv
%.tmp8284 = getelementptr i8*, i8** %.tmp8283, i32 0
%.tmp8285 = load i8*, i8** %.tmp8284
%.tmp8286 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8281, i8* %.tmp8282, i8* %.tmp8285)
%.tmp8287 = load i8*, i8** %buf.8280
%.tmp8288 = call i32(i8*) @puts(i8* %.tmp8287)
%.tmp8289 = load i8*, i8** %buf.8280
call void(i8*) @free(i8* %.tmp8289)
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
@.str2721 = constant [5 x i8] c"%c%s\00"
@.str2733 = constant [7 x i8] c".tmp%d\00"
@.str2830 = constant [1 x i8] c"\00"
@.str2872 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2896 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2915 = constant [6 x i8] c"start\00"
@.str2992 = constant [6 x i8] c"start\00"
@.str2999 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3002 = constant [7 x i8] c"global\00"
@.str3013 = constant [13 x i8] c"head_comment\00"
@.str3051 = constant [1 x i8] c"\00"
@.str3075 = constant [7 x i8] c"string\00"
@.str3083 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3103 = constant [7 x i8] c"extern\00"
@.str3117 = constant [15 x i8] c"declare %s %s(\00"
@.str3153 = constant [3 x i8] c", \00"
@.str3159 = constant [3 x i8] c"%s\00"
@.str3171 = constant [3 x i8] c")\0A\00"
@.str3188 = constant [5 x i8] c"%s%s\00"
@.str3196 = constant [9 x i8] c"function\00"
@.str3202 = constant [5 x i8] c"main\00"
@.str3217 = constant [6 x i8] c"%s.%s\00"
@.str3238 = constant [3 x i8] c"NL\00"
@.str3246 = constant [7 x i8] c"global\00"
@.str3254 = constant [11 x i8] c"assignable\00"
@.str3285 = constant [9 x i8] c"variable\00"
@.str3297 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3312 = constant [10 x i8] c"typealias\00"
@.str3334 = constant [11 x i8] c"%s.%s.type\00"
@.str3346 = constant [10 x i8] c"typealias\00"
@.str3368 = constant [5 x i8] c"type\00"
@.str3398 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3411 = constant [7 x i8] c"extern\00"
@.str3429 = constant [7 x i8] c"extern\00"
@.str3470 = constant [7 x i8] c"extern\00"
@.str3482 = constant [9 x i8] c"function\00"
@.str3491 = constant [9 x i8] c"function\00"
@.str3530 = constant [14 x i8] c"define %s %s(\00"
@.str3559 = constant [3 x i8] c", \00"
@.str3565 = constant [5 x i8] c"type\00"
@.str3581 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3596 = constant [5 x i8] c") {\0A\00"
@.str3600 = constant [9 x i8] c"function\00"
@.str3609 = constant [6 x i8] c"block\00"
@.str3621 = constant [12 x i8] c"expressions\00"
@.str3634 = constant [3 x i8] c"NL\00"
@.str3641 = constant [9 x i8] c"OPERATOR\00"
@.str3660 = constant [7 x i8] c"return\00"
@.str3670 = constant [5 x i8] c"void\00"
@.str3677 = constant [21 x i8] c"missing return value\00"
@.str3682 = constant [10 x i8] c"ret void\0A\00"
@.str3688 = constant [3 x i8] c"}\0A\00"
@.str3694 = constant [7 x i8] c"import\00"
@.str3749 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3808 = constant [5 x i8] c"m%d$\00"
@.str3859 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3868 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3900 = constant [9 x i8] c"variable\00"
@.str3905 = constant [5 x i8] c"type\00"
@.str3937 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3950 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3962 = constant [6 x i8] c"block\00"
@.str3969 = constant [12 x i8] c"expressions\00"
@.str4000 = constant [7 x i8] c"struct\00"
@.str4005 = constant [7 x i8] c"WhAT!\0A\00"
@.str4045 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4057 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4083 = constant [7 x i8] c"struct\00"
@.str4088 = constant [7 x i8] c"WhAT!\0A\00"
@.str4119 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4131 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4156 = constant [7 x i8] c"sizeof\00"
@.str4162 = constant [8 x i8] c"fn_args\00"
@.str4169 = constant [11 x i8] c"assignable\00"
@.str4197 = constant [4 x i8] c"int\00"
@.str4210 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4219 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4230 = constant [7 x i8] c"append\00"
@.str4236 = constant [8 x i8] c"fn_args\00"
@.str4243 = constant [11 x i8] c"assignable\00"
@.str4250 = constant [11 x i8] c"assignable\00"
@.str4274 = constant [5 x i8] c".b%d\00"
@.str4308 = constant [8 x i8] c"realloc\00"
@.str4317 = constant [9 x i8] c"function\00"
@.str4330 = constant [4 x i8] c"ptr\00"
@.str4347 = constant [4 x i8] c"chr\00"
@.str4364 = constant [4 x i8] c"ptr\00"
@.str4385 = constant [4 x i8] c"chr\00"
@.str4406 = constant [4 x i8] c"int\00"
@.str4409 = constant [8 x i8] c"realloc\00"
@.str4411 = constant [7 x i8] c"extern\00"
@.str4418 = constant [4 x i8] c"len\00"
@.str4424 = constant [8 x i8] c"fn_args\00"
@.str4431 = constant [11 x i8] c"assignable\00"
@.str4439 = constant [1 x i8] c"\00"
@.str4455 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4476 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4482 = constant [1 x i8] c"\00"
@.str4488 = constant [6 x i8] c"%s.bn\00"
@.str4493 = constant [9 x i8] c"%s/%s.bn\00"
@.str4517 = constant [35 x i8] c"unable to compile function address\00"
@.str4523 = constant [8 x i8] c"fn_args\00"
@.str4527 = constant [1 x i8] c"\00"
@.str4537 = constant [11 x i8] c"assignable\00"
@.str4551 = constant [5 x i8] c"%s, \00"
@.str4569 = constant [8 x i8] c"%s%s %s\00"
@.str4584 = constant [11 x i8] c"assignable\00"
@.str4594 = constant [5 x i8] c"void\00"
@.str4602 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4634 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4660 = constant [7 x i8] c"return\00"
@.str4672 = constant [3 x i8] c"NL\00"
@.str4690 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4703 = constant [10 x i8] c"ret void\0A\00"
@.str4707 = constant [3 x i8] c"NL\00"
@.str4713 = constant [8 x i8] c"fn_call\00"
@.str4724 = constant [12 x i8] c"declaration\00"
@.str4733 = constant [11 x i8] c"assignment\00"
@.str4741 = constant [11 x i8] c"assignable\00"
@.str4772 = constant [4 x i8] c"ptr\00"
@.str4781 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4791 = constant [9 x i8] c"if_block\00"
@.str4799 = constant [9 x i8] c"for_loop\00"
@.str4807 = constant [8 x i8] c"keyword\00"
@.str4824 = constant [6 x i8] c"break\00"
@.str4835 = constant [4 x i8] c"for\00"
@.str4843 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4854 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4861 = constant [9 x i8] c"continue\00"
@.str4872 = constant [4 x i8] c"for\00"
@.str4880 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4891 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str4895 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str4906 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4925 = constant [14 x i8] c".for.start.%d\00"
@.str4930 = constant [12 x i8] c".for.end.%d\00"
@.str4935 = constant [4 x i8] c"for\00"
@.str4942 = constant [12 x i8] c"declaration\00"
@.str4953 = constant [11 x i8] c"assignment\00"
@.str4963 = constant [9 x i8] c"OPERATOR\00"
@.str4970 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str4981 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4988 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4995 = constant [9 x i8] c"OPERATOR\00"
@.str5006 = constant [9 x i8] c"OPERATOR\00"
@.str5013 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5022 = constant [9 x i8] c"OPERATOR\00"
@.str5027 = constant [6 x i8] c"block\00"
@.str5032 = constant [11 x i8] c"else_block\00"
@.str5042 = constant [13 x i8] c".for.else.%d\00"
@.str5049 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5064 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5083 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5093 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5100 = constant [6 x i8] c"block\00"
@.str5109 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5116 = constant [5 x i8] c"%s:\0A\00"
@.str5130 = constant [5 x i8] c"type\00"
@.str5145 = constant [11 x i8] c"assignable\00"
@.str5160 = constant [9 x i8] c"variable\00"
@.str5165 = constant [5 x i8] c"WORD\00"
@.str5174 = constant [31 x i8] c"unable to get declaration name\00"
@.str5194 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5206 = constant [6 x i8] c"%s.%d\00"
@.str5263 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5280 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5292 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5333 = constant [4 x i8] c"int\00"
@.str5340 = constant [4 x i8] c"chr\00"
@.str5348 = constant [5 x i8] c"bool\00"
@.str5357 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5366 = constant [4 x i8] c"ptr\00"
@.str5374 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5377 = constant [5 x i8] c"null\00"
@.str5385 = constant [7 x i8] c"struct\00"
@.str5406 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5426 = constant [10 x i8] c"typealias\00"
@.str5449 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5468 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5485 = constant [11 x i8] c"assignable\00"
@.str5502 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5517 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5524 = constant [6 x i8] c"block\00"
@.str5533 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5540 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5547 = constant [11 x i8] c"elif_block\00"
@.str5559 = constant [11 x i8] c"else_block\00"
@.str5569 = constant [6 x i8] c"block\00"
@.str5579 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5586 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5607 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5616 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5647 = constant [1 x i8] c"\00"
@.str5658 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5678 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5703 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5724 = constant [7 x i8] c"module\00"
@.str5777 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5814 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5822 = constant [9 x i8] c"function\00"
@.str5829 = constant [7 x i8] c"extern\00"
@.str5841 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5862 = constant [9 x i8] c"variable\00"
@.str5884 = constant [4 x i8] c"ptr\00"
@.str5903 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str5927 = constant [10 x i8] c"typealias\00"
@.str5938 = constant [7 x i8] c"struct\00"
@.str5944 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str5996 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6017 = constant [9 x i8] c"variable\00"
@.str6028 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6049 = constant [9 x i8] c"variable\00"
@.str6057 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6071 = constant [17 x i8] c"addr_destination\00"
@.str6078 = constant [16 x i8] c"mono_assignable\00"
@.str6086 = constant [11 x i8] c"assignable\00"
@.str6100 = constant [12 x i8] c"destination\00"
@.str6105 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6133 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6152 = constant [7 x i8] c"module\00"
@.str6174 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6245 = constant [6 x i8] c"slice\00"
@.str6258 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6300 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6321 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6345 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6368 = constant [16 x i8] c"mono_assignable\00"
@.str6394 = constant [5 x i8] c"cast\00"
@.str6404 = constant [5 x i8] c"type\00"
@.str6429 = constant [8 x i8] c"bitcast\00"
@.str6437 = constant [4 x i8] c"ptr\00"
@.str6444 = constant [4 x i8] c"ptr\00"
@.str6463 = constant [4 x i8] c"i%d\00"
@.str6468 = constant [4 x i8] c"i%d\00"
@.str6476 = constant [5 x i8] c"sext\00"
@.str6478 = constant [6 x i8] c"trunc\00"
@.str6483 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6503 = constant [16 x i8] c"mono_assignable\00"
@.str6565 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6588 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6595 = constant [2 x i8] c"+\00"
@.str6600 = constant [4 x i8] c"add\00"
@.str6605 = constant [2 x i8] c"-\00"
@.str6610 = constant [4 x i8] c"sub\00"
@.str6615 = constant [2 x i8] c"*\00"
@.str6620 = constant [4 x i8] c"mul\00"
@.str6625 = constant [2 x i8] c"/\00"
@.str6630 = constant [5 x i8] c"sdiv\00"
@.str6635 = constant [3 x i8] c"==\00"
@.str6640 = constant [8 x i8] c"icmp eq\00"
@.str6645 = constant [3 x i8] c"!=\00"
@.str6650 = constant [8 x i8] c"icmp ne\00"
@.str6655 = constant [2 x i8] c">\00"
@.str6660 = constant [9 x i8] c"icmp sgt\00"
@.str6665 = constant [2 x i8] c"<\00"
@.str6670 = constant [9 x i8] c"icmp slt\00"
@.str6675 = constant [2 x i8] c"&\00"
@.str6680 = constant [4 x i8] c"and\00"
@.str6685 = constant [2 x i8] c"|\00"
@.str6690 = constant [3 x i8] c"or\00"
@.str6695 = constant [3 x i8] c">=\00"
@.str6700 = constant [9 x i8] c"icmp sge\00"
@.str6705 = constant [3 x i8] c"<=\00"
@.str6710 = constant [9 x i8] c"icmp sle\00"
@.str6715 = constant [2 x i8] c"%\00"
@.str6720 = constant [5 x i8] c"srem\00"
@.str6724 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6731 = constant [4 x i8] c"add\00"
@.str6738 = constant [3 x i8] c"==\00"
@.str6745 = constant [3 x i8] c"!=\00"
@.str6753 = constant [2 x i8] c"|\00"
@.str6761 = constant [2 x i8] c"&\00"
@.str6769 = constant [2 x i8] c">\00"
@.str6777 = constant [2 x i8] c"<\00"
@.str6785 = constant [3 x i8] c">=\00"
@.str6793 = constant [3 x i8] c"<=\00"
@.str6801 = constant [5 x i8] c"bool\00"
@.str6805 = constant [4 x i8] c"int\00"
@.str6819 = constant [7 x i8] c"NUMBER\00"
@.str6833 = constant [4 x i8] c"int\00"
@.str6847 = constant [5 x i8] c"WORD\00"
@.str6857 = constant [5 x i8] c"null\00"
@.str6864 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str6878 = constant [5 x i8] c"null\00"
@.str6887 = constant [8 x i8] c"nullptr\00"
@.str6894 = constant [17 x i8] c"addr_destination\00"
@.str6906 = constant [12 x i8] c"destination\00"
@.str6950 = constant [4 x i8] c"ptr\00"
@.str6969 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str6981 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str6995 = constant [8 x i8] c"boolean\00"
@.str7009 = constant [5 x i8] c"bool\00"
@.str7018 = constant [6 x i8] c"false\00"
@.str7025 = constant [2 x i8] c"0\00"
@.str7029 = constant [2 x i8] c"1\00"
@.str7036 = constant [8 x i8] c"fn_call\00"
@.str7053 = constant [7 x i8] c"STRING\00"
@.str7079 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7095 = constant [4 x i8] c"ptr\00"
@.str7108 = constant [4 x i8] c"chr\00"
@.str7115 = constant [4 x i8] c"CHR\00"
@.str7131 = constant [2 x i8] c"0\00"
@.str7147 = constant [22 x i8] c"Invalid character: %s\00"
@.str7163 = constant [4 x i8] c"chr\00"
@.str7167 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7195 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7201 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7206 = constant [4 x i8] c"int\00"
@.str7211 = constant [2 x i8] c"i\00"
@.str7216 = constant [5 x i8] c"bool\00"
@.str7221 = constant [2 x i8] c"b\00"
@.str7226 = constant [5 x i8] c"void\00"
@.str7231 = constant [2 x i8] c"v\00"
@.str7236 = constant [4 x i8] c"chr\00"
@.str7241 = constant [2 x i8] c"c\00"
@.str7246 = constant [4 x i8] c"ptr\00"
@.str7253 = constant [4 x i8] c"%sp\00"
@.str7264 = constant [10 x i8] c"typealias\00"
@.str7275 = constant [7 x i8] c"struct\00"
@.str7280 = constant [2 x i8] c"s\00"
@.str7291 = constant [5 x i8] c"%s%s\00"
@.str7304 = constant [6 x i8] c"error\00"
@.str7309 = constant [2 x i8] c"?\00"
@.str7311 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7323 = constant [7 x i8] c".str%d\00"
@.str7338 = constant [6 x i8] c"array\00"
@.str7351 = constant [4 x i8] c"chr\00"
@.str7372 = constant [3 x i8] c"%d\00"
@.str7379 = constant [7 x i8] c"string\00"
@.str7415 = constant [7 x i8] c"module\00"
@.str7467 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7473 = constant [2 x i8] c"?\00"
@.str7479 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7485 = constant [4 x i8] c"int\00"
@.str7490 = constant [4 x i8] c"i32\00"
@.str7495 = constant [5 x i8] c"void\00"
@.str7500 = constant [5 x i8] c"void\00"
@.str7505 = constant [5 x i8] c"bool\00"
@.str7510 = constant [3 x i8] c"i1\00"
@.str7515 = constant [8 x i8] c"nullptr\00"
@.str7520 = constant [4 x i8] c"ptr\00"
@.str7525 = constant [4 x i8] c"chr\00"
@.str7530 = constant [3 x i8] c"i8\00"
@.str7535 = constant [9 x i8] c"function\00"
@.str7541 = constant [4 x i8] c"%s(\00"
@.str7567 = constant [4 x i8] c"%s,\00"
@.str7572 = constant [5 x i8] c"%s%s\00"
@.str7583 = constant [4 x i8] c"%s)\00"
@.str7591 = constant [4 x i8] c"ptr\00"
@.str7597 = constant [4 x i8] c"%s*\00"
@.str7609 = constant [7 x i8] c"struct\00"
@.str7615 = constant [2 x i8] c"{\00"
@.str7632 = constant [4 x i8] c"%s,\00"
@.str7637 = constant [5 x i8] c"%s%s\00"
@.str7648 = constant [4 x i8] c"%s}\00"
@.str7656 = constant [6 x i8] c"array\00"
@.str7662 = constant [10 x i8] c"[%s x %s]\00"
@.str7681 = constant [10 x i8] c"typealias\00"
@.str7687 = constant [5 x i8] c"%%%s\00"
@.str7697 = constant [7 x i8] c"vararg\00"
@.str7702 = constant [4 x i8] c"...\00"
@.str7707 = constant [6 x i8] c"error\00"
@.str7712 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7788 = constant [9 x i8] c"function\00"
@.str7806 = constant [5 x i8] c"WORD\00"
@.str7863 = constant [10 x i8] c"fn_params\00"
@.str7879 = constant [10 x i8] c"structdef\00"
@.str7886 = constant [7 x i8] c"struct\00"
@.str7893 = constant [5 x i8] c"type\00"
@.str7924 = constant [5 x i8] c"type\00"
@.str7951 = constant [5 x i8] c"type\00"
@.str7957 = constant [12 x i8] c"dotted_name\00"
@.str7971 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str7984 = constant [6 x i8] c"error\00"
@.str7989 = constant [10 x i8] c"typealias\00"
@.str8013 = constant [4 x i8] c"str\00"
@.str8020 = constant [4 x i8] c"ptr\00"
@.str8029 = constant [4 x i8] c"chr\00"
@.str8034 = constant [5 x i8] c"WORD\00"
@.str8047 = constant [4 x i8] c"...\00"
@.str8054 = constant [7 x i8] c"vararg\00"
@.str8058 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str8079 = constant [2 x i8] c"*\00"
@.str8088 = constant [4 x i8] c"ptr\00"
@.str8097 = constant [2 x i8] c"[\00"
@.str8107 = constant [2 x i8] c"]\00"
@.str8116 = constant [7 x i8] c"struct\00"
@.str8120 = constant [6 x i8] c"slice\00"
@.str8126 = constant [4 x i8] c"ptr\00"
@.str8130 = constant [6 x i8] c"c_arr\00"
@.str8142 = constant [4 x i8] c"int\00"
@.str8146 = constant [4 x i8] c"len\00"
@.str8155 = constant [4 x i8] c"int\00"
@.str8159 = constant [4 x i8] c"cap\00"
@.str8170 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str8185 = constant [2 x i8] c"w\00"
@.str8205 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str8214 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str8216 = constant [2 x i8] c"w\00"
@.str8228 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8236 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8239 = constant [16 x i8] c"cc out.s -o out\00"
@.str8241 = constant [2 x i8] c"w\00"
@.str8249 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8257 = constant [22 x i8] c"error on cc execution\00"
@.str8260 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8267 = constant [21 x i8] c"Usage: %s <filename>\00"
